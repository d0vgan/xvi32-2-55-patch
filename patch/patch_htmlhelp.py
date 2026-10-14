"""Patch XVI32 Help buttons + Help->Contents + What's This (?) to HtmlHelpA.

Base: XVI32-0.exe. The first step of patch() writes the startup-position and
post-script focus edits similarly to the patch_base.txt.
Later hooks expect that image. XVIScript Editor Help keeps `mov edx, 47` and
replaces only `call HelpContext` (topic 0x47).

Helpers (Delphi register): edx = help context id
  helper      -> TOPIC_BY_ID (Help buttons / Contents; full dialog topics)
  popup       -> POPUP_BY_ID (What's This / HELP_CONTEXTPOPUP; control hints)
  edx <= 0 or unknown id -> open XVI32U.CHM with no topic (Contents)

WinHelpA CODE thunk is hooked: HELP_CONTEXTPOPUP and HELP_CONTEXT divert to
popup helper; HELP_SETPOPUP_POS is a no-op success; other commands call real
WinHelpA. Help buttons never reach WinHelp (already call helper).

Also fixes stock DFM bug: Find/Replace 'Scope from' HelpContext 59->58
(idh_scope), so ? shows the search Cursor/Begin/End hint instead of
Character Conversion. CharTable Scope from stays at 59 (F1 -> Character
Conversion chapter is acceptable there).

Display strategy: HH_DISPLAY_TOPIC (2a) for What's This - short CHM pages,
not HH_DISPLAY_TEXT_POPUP balloons.

Also: on first FormActivate (non-script path), always arm a 1ms SetTimer. After
Activate finishes the timer focuses the main grid, then opens DI if the menu is
checked. Showing DI inside FormActivate races activation; deferring matches
Tools->Data Inspector timing.

Save / Save As: status panel 3 gets "Accessing network, please wait..." and
stock code never clears it. Arm a flag at those SetText calls; the cursor
finally clears panel 3 only when this save showed the message (so a local
save keeps a Read Only notice). WNetGetConnectionA's return is checked: a
failed call used to look like a network drive because the stack buffer was
uninitialized, so the message appeared on ordinary local saves.

DI open path: TCustomForm.Show == SetVisible(True) + BringToFront. Memo init needs
SetVisible (never skip that). After Create we Visible:=False, fill while hidden, then
SetVisible(True) with a ShowWindow IAT hook that forces SW_SHOWNOACTIVATE only for
the DI HWND (TCustomForm.CMShowingChanged calls ShowWindow). Skip BringToFront;
SetFocus main instead. Never replace SetVisible with ShowWindow alone.

Writable state (g_HtmlHelpA, g_form, g_net_status) lives in a tiny RW-only companion section
.hdata (not executable). .hhelp is RX-only like CODE - no W+X section.

Character conversion grid: the stock DFM stores HelpContext 61, which is the
endian etymology popup. The grid's own popup is context 60 (idh_chartab). That
byte is changed 61->60, so F1 / What's This on the table shows how to fill it
in. The Help button still passes 60 into TOPIC_BY_ID (the Character Conversion
chapter).

Help buttons that already put a TOPIC_BY_ID key in edx replace only
`call TApplication.HelpContext`. Find compares the caption with the Count
string and sets edx to 0x21 (Find) or 0x22 (Count) before that call. Block
sets edx to 0x26 (its topic key) before its call. Insert and Print Preview
leave the existing `xchg`, which puts the form's help id in edx.

XVIscript Save: the toolbar button calls Save1Click while gvar_000B6CF8 is
still nil, and SaveToFile then raises "Cannot create file". No form property
selects Save As only in that case, so Save1Click jumps to a hook. The hook
uses the same nil test as the close-query (mov eax,[0xB5644] / cmp [eax],0)
and, when nil, calls sub_000A6194 with the form in eax. That routine shows
the Save XVIscript dialog and calls Save1Click only after the name is stored,
so the second entry takes the original SaveToFile path.

Character conversion rewrites the file from the scope start through EOF, then
calls sub_00099890. That routine passes the cursor column (gvar_000B6B7C) and
row (gvar_000B6B80) to sub_000996A4, so only cells at and after the cursor are
rewritten. Scope Begin (start offset 1) therefore leaves earlier visible bytes
stale. No immediate selects the first visible cell, so the call at 0009B511
jumps to a hook that repeats 00099890 with column 0 and row 0, the same
registers sub_000998B0 uses to reload the whole visible text and hex grids.
The cursor globals are not written.

The same conversion sets the file-modified flag with setg on the replacement
count after every byte, so a run that replaces nothing clears the flag and a
later close drops earlier edits. That setg is removed. The refresh hook reads
the count through the pointer at [ebp-4] (the edx argument of sub_0009B42C,
stored by `mov [ebp-4], edx` at 0009B43C) and sets gvar_000B6BA5 only when
the count is greater than zero.

sub_0009B070 clears the 256-byte table at gvar_000B6BF4 before it reads the
file, and ButtonLoadClick clears the stored name, the table, and the window
title when that read fails. The clear call at 0009B0A6 jumps to a hook that
copies the table into .hdata and then calls sub_0009B244. The exception path
at 0009B1F8 jumps to a hook that copies the saved table back, calls
@DoneExcept, and continues at 0009B1FF. ButtonLoadClick's failure path jumps
from 000A2CF8 to 000A2D1E, so the name, the table, and the title stay while
the error message is still shown. The CHARCON command's own call to
sub_0009B244 at 000A8727 is removed; otherwise a failed script load would
save the empty table and restore that. Startup still calls sub_0009B244 after
its own read error, so a missing remembered table still becomes the identity
table.

"""
from __future__ import annotations

import argparse
import struct
from pathlib import Path

SRC_DEFAULT = Path(r"XVI32-0.exe")
DST_DEFAULT = Path(r"XVI32-2.exe")

IAT_GET_MODULE_FILE_NAME_A = 0xB8330
IAT_LOAD_LIBRARY_A = 0xB82DC
IAT_GET_PROC_ADDRESS = 0xB8324
IAT_FREE_LIBRARY = 0xB8360
IAT_GET_WINDOW_LONG_A = 0xB8684
IAT_SET_WINDOW_LONG_A = 0xB857C
IAT_SHOW_WINDOW = 0xB8558
STR_XVI32U_CHM = 0xB25A0
HELPCONTEXT_VA = 0x5F7C0
GETHANDLE_VA = 0x488F4
SETTIMER_VA = 0x170D0
KILLTIMER_VA = 0x16F78
DATAINSPECTOR1CLICK_VA = 0xB35EC
DI_STARTUP_CALL_VA = 0xAAFC1  # xor edx,edx / mov eax,ebx / call DataInspector1Click
DI_STARTUP_RESUME_VA = 0xAAFCA
DI_TIMER_ID = 0x445349  # arbitrary id 'DSI'
MODUS_PTR_VA = 0xB5B00
DATAINSPECTOR_MENU_OFF = 0x47C  # TFormMain.DataInspector1
MENUITEM_CHECKED_OFF = 0x2C
GRID_TEXT_OFF = 0x310
GRID_HEX_OFF = 0x314
SETFOCUS_VMT_OFF = 0xB4
FORMMAIN_PTR_VA = 0xB5784  # ^TFormMain
SETVISIBLE_VA = 0x42A48  # TControl.SetVisible (used for hide-after-create)
TCUSTOMFORM_SETVISIBLE_VA = 0x59084  # Show's init half
TCUSTOMFORM_SHOW_VA = 0x5C240  # stock Show (expect at call site)
DI_LAYOUT_VA = 0x93A70
DI_LAYOUT_CALL_VA = 0x93D89
DI_FILL_CONTENT_VA = 0x93834
DI_SHOW_CALL_VA = 0x93D93
DI_FILL_CALL_VA = 0x93D9D
DI_BRINGTOFRONT_BLOCK_VA = 0x93DA2
DI_BRINGTOFRONT_BLOCK_LEN = 12
SW_SHOWNOACTIVATE = 4
SW_HIDE = 0
SHOWWINDOW_THUNK_VA = 0x17120  # FF25 [IAT_SHOW_WINDOW]; patch to jmp hook
WINHELP_THUNK_VA = 0x17178  # FF25 [IAT_WINHELP_A]; patch to jmp hook
IAT_WINHELP_A = 0xB852C

# Filled in patch() once section VAs are known (before codegen).
G_HTMLHELPA_VA = 0
G_FORM_VA = 0
G_DI_HWND_VA = 0
G_NET_STATUS_VA = 0
G_TABLE_BACKUP_VA = 0

HH_DISPLAY_TOPIC = 0
PATH_BUF = 0x104
HELP_CONTEXT = 1
HELP_CONTEXTPOPUP = 8
HELP_SETPOPUP_POS = 0xD

SECTION_NAME = b".hhelp\x00\x00"
SECTION_CHARS = 0x60000020  # CODE|EXECUTE|READ (same as CODE; not writable)
SECTION_RAW = 0x1000  # helper + DI + dual maps (~2.5K strings/tables)

HDATA_NAME = b".hdata\x00\x00"
HDATA_CHARS = 0xC0000040  # INITIALIZED_DATA|READ|WRITE (same as DATA)
HDATA_VIRT = 16 + 256  # HtmlHelpA, g_form, g_di_hwnd, g_net_status, then the conversion-table copy
STATUS_SETTEXT_VA = 0x6BBD0  # TStatusPanel.SetText
STATUS_GETITEM_VA = 0x6BC58  # TStatusPanels.GetItem
SCREEN_SETCURSOR_VA = 0x5D6F4  # TScreen.SetCursor
STATUSBAR_OFF = 0x2C4
STATUS_PANELS_OFF = 0x1EC
STATUS_PANEL_NET = 3
SAVE_SETTEXT_VA = 0xAF241
SAVEAS_SETTEXT_VA = 0xAF32A
SAVE_SETCURSOR_VA = 0xAF2AD
SAVEAS_SETCURSOR_VA = 0xAF36A
WNET_CALL_VA = 0x9B97F  # call WNetGetConnectionA thunk
WNET_RESUME_VA = 0x9B984
WNET_THUNK_VA = 0x16928
# TFormScript.Save1Click. First 9 bytes are push ebx / mov ebx,eax /
# mov edx,[0xB5644]; resume at mov edx,[edx].
SCRIPT_SAVE_VA = 0xA6694
SCRIPT_SAVE_RESUME_VA = 0xA669D
SCRIPT_SAVEAS_VA = 0xA6194  # sub_000A6194, Save As dialog
SCRIPT_PATH_PTR_VA = 0xB5644  # ^gvar_000B6CF8:AnsiString
# sub_0009B42C end: call sub_00099890. That refresh starts at the cursor.
CHARCONV_REFRESH_VA = 0x9B511
VISIBLE_END_VA = 0x9958C  # sub_0009958C -> eax
VISIBLE_END_PTR_VA = 0xB6B88  # gvar_000B6B88
FILL_GRID_VA = 0x996A4  # sub_000996A4(al=col, dl=row)
REFRESH_STATUS_VA = 0x983B8  # sub_000983B8
# 0009B4DA setg byte ptr [gvar_000B6BA5]. Replaced with NOPs; the refresh
# hook writes 1 only when the replacement count is greater than zero.
MODIFIED_FLAG_VA = 0xB6BA5
SETG_VA = 0x9B4DA
# gvar_000B6BF4, 256 bytes. 0009B246 mov eax, 0B6BF4.
TABLE_VA = 0xB6BF4
IDENTITY_VA = 0x9B244  # sub_0009B244
# 0009B0A6 call 0009B244, while esi is the text-file record.
LOAD_CLEAR_VA = 0x9B0A6
# 0009B1F8 xor ebx,ebx / call @DoneExcept. Resume is 0009B1FF xor eax,eax.
LOAD_FAIL_VA = 0x9B1F8
LOAD_FAIL_RESUME_VA = 0x9B1FF
DONEEXCEPT_VA = 0x1356C
# ButtonLoadClick failure: 000A2CF8 through the SetText at 000A2D19.
# 000A2D1E lea eax,[ebp-8] formats "Error reading %s".
BUTTON_LOAD_FAIL_VA = 0xA2CF8
BUTTON_LOAD_ERR_VA = 0xA2D1E
# CHARCON calls 0009B244 before 0009B070, which would snapshot the identity map.
SCRIPT_CHARCON_CLEAR_VA = 0xA8727
HDATA_RAW = 0x200  # FileAlign minimum

# Help button / Contents: full dialog topics (may differ from HLP CTXOMAP popups).
# Note: TFormIns stores 0x32 / 0x48 in [form+0x310] (IDR shows those as hex).
# Same numeric IDs can mean different CHM pages in POPUP_BY_ID (control hints); that is
# intentional - Help buttons use this table, What's This uses POPUP_BY_ID.
TOPIC_BY_ID: dict[int, bytes] = {
    9: b"::/html/xvi33uic.htm",  # Bit manipulation
    14: b"::/html/xvi32gc3.htm",  # Address menu (Display difference Help / Address1)
    17: b"::/html/xvi33tbi.htm",  # Options: General
    0x21: b"::/html/xvi38pgk.htm",  # Find string (33)
    0x22: b"::/html/xvi32tmc.htm",  # Count occurrence (34)
    0x26: b"::/html/xvi35twr.htm",  # Block <n> (38; Mark a block)
    0x29: b"::/html/xvi347qv.htm",  # Print Preview (41)
    0x32: b"::/html/xvi34cmq.htm",  # Insert string (50) - TFormIns+0x310
    0x35: b"::/html/xvi34fmt.htm",  # Replace string (53)
    0x36: b"::/html/xvi34uzz.htm",  # Go to (54)
    0x37: b"::/html/xvi380v9.htm",  # Encode number (55)
    0x3C: b"::/html/xvi33aum.htm",  # Character conversion (60)
    0x40: b"::/html/xvi33chg.htm",  # Printing (64)
    0x47: b"::/html/xvi340vj.htm",  # XVIscript: Introduction (71)
    0x48: b"::/html/xvi39kdu.htm",  # Overwrite string (72) - TFormIns+0x310
    0x52: b"::/html/xvi33awg.htm",  # Options: Appearance (82)
    0x53: b"::/html/xvi31gmh.htm",  # Options: Data Inspector (83)
    0x54: b"::/html/xvi349kb.htm",  # Options: Shortcut Link (84)
}

# What's This (?): HLP |CTXOMAP id -> CHM page (HH_DISPLAY_TOPIC).
# Conflicts with TOPIC_BY_ID (same id, different page): 33, 34, 38, 41, 60.
# CharTable "Scope from" stays HelpContext 59 (Character Conversion) - OK for that dialog.
# Find/Replace Scope from is patched 59->58 in the EXE.
POPUP_BY_ID: dict[int, bytes] = {
    1: b"::/html/xvi38c6s.htm",  # Features
    2: b"::/html/xvi36ovt.htm",  # History
    3: b"::/html/xvi34q3n.htm",  # Licence Agreement and Copyright
    4: b"::/html/xvi37oqd.htm",  # menu bar
    5: b"::/html/xvi39otg.htm",  # Using Clipboard
    6: b"::/html/xvi335mf.htm",  # XVI32 Window
    7: b"::/html/xvi31yyb.htm",  # Menus
    8: b"::/html/xvi37wa4.htm",  # Toolbar (OnHelp force-popup)
    9: b"::/html/xvi33uic.htm",  # Bit manipulation
    10: b"::/html/xvi368mq.htm",  # bits at current address
    11: b"::/html/xvi38pd1.htm",  # Menu "File"
    12: b"::/html/xvi32n5g.htm",  # Menu "Edit"
    13: b"::/html/xvi36w88.htm",  # Menu "Search"
    14: b"::/html/xvi32gc3.htm",  # Menu "Address"
    15: b"::/html/xvi35e2b.htm",  # Menu "Tools"
    16: b"::/html/xvi39l9s.htm",  # Menu "Help"
    17: b"::/html/xvi33tbi.htm",  # Options: General
    18: b"::/html/xvi32eek.htm",  # Installation
    19: b"::/html/xvi36gqb.htm",  # Using Keys
    20: b"::/html/xvi39qpg.htm",  # Text string radio (idh_rbtext); was swapped with 21
    21: b"::/html/xvi32jaw.htm",  # Hex string radio (idh_rbhex)
    22: b"::/html/xvi30ibc.htm",  # Text -> Hex button
    23: b"::/html/xvi302b1.htm",  # decimal number radio (idh_rbdecnum)
    24: b"::/html/xvi343zh.htm",  # hexadecimal number radio (idh_rbhexnum)
    25: b"::/html/xvi315lx.htm",  # Case sensitive
    26: b"::/html/xvi3938y.htm",  # Joker / wildcard
    27: b"::/html/xvi35wvk.htm",  # Direction up/down
    28: b"::/html/xvi34g30.htm",  # Replace all
    29: b"::/html/xvi31tyd.htm",  # Go to absolute/relative
    30: b"::/html/xvi33nhv.htm",  # Encode data type
    31: b"::/html/xvi3506s.htm",  # Encode byte order
    32: b"::/html/xvi36r1w.htm",  # text edit field (idh_edtext)
    33: b"::/html/xvi391vc.htm",  # hex edit field (idh_edhex); Help button 33 -> Find topic
    34: b"::/html/xvi32485.htm",  # title bar; Help button 34 -> Count topic
    35: b"::/html/xvi322er.htm",  # status: current address (OnHelp via 999)
    36: b"::/html/xvi3936t.htm",  # status: char code
    37: b"::/html/xvi328ab.htm",  # status: Insert/Overwrite
    38: b"::/html/xvi36o38.htm",  # status: hint panel; Help button 38 -> Mark a block
    39: b"::/html/xvi339is.htm",  # text grid (OnHelp force-popup)
    40: b"::/html/xvi39gs8.htm",  # hex grid (OnHelp force-popup)
    41: b"::/html/xvi39zsp.htm",  # Memory usage; Help button 41 -> Print Preview topic
    42: b"::/html/xvi325ym.htm",  # Options General tab (idh_optgen)
    43: b"::/html/xvi31njk.htm",  # Options Appearance tab (idh_optapp)
    44: b"::/html/xvi32m7f.htm",  # Options Shortcut Link tab
    48: b"::/html/xvi33m5s.htm",  # Using help
    49: b"::/html/xvi381lv.htm",  # Miscellaneous
    50: b"::/html/xvi34cmq.htm",  # Insert string
    51: b"::/html/xvi38pgk.htm",  # Find
    52: b"::/html/xvi32tmc.htm",  # Count
    53: b"::/html/xvi34fmt.htm",  # Replace
    54: b"::/html/xvi34uzz.htm",  # Go to
    55: b"::/html/xvi380v9.htm",  # Encode number
    56: b"::/html/xvi35twr.htm",  # Mark a block
    58: b"::/html/xvi38dlx.htm",  # Scope from Cursor/Begin/End (idh_scope)
    59: b"::/html/xvi33aum.htm",  # Character Conversion (CharTable Scope / chapter)
    60: b"::/html/xvi34rvm.htm",  # conversion grid cell; Help button 60 -> Character Conversion
    61: b"::/html/xvi3341a.htm",  # endian etymology
    62: b"::/html/xvi31s1f.htm",  # Included XCT files
    63: b"::/html/xvi344x8.htm",  # Auto-fill feature
    64: b"::/html/xvi33chg.htm",  # Printing
    65: b"::/html/xvi347qv.htm",  # Print Preview
    66: b"::/html/xvi314tq.htm",  # print margins
    67: b"::/html/xvi32r3r.htm",  # print hex dump layout
    68: b"::/html/xvi32zhu.htm",  # print redirect / driver note
    69: b"::/html/xvi35dwy.htm",  # print redirect to file
    70: b"::/html/xvi36e7m.htm",  # row address column (OnHelp force-popup)
    71: b"::/html/xvi340vj.htm",  # XVIscript: Introduction
    72: b"::/html/xvi39kdu.htm",  # Overwrite string
    73: b"::/html/xvi32p4d.htm",  # Menu "Bookmarks"
    74: b"::/html/xvi33mgj.htm",  # What's a hex editor?
    75: b"::/html/xvi33xbo.htm",  # XVIscript: Syntax check and execution
    76: b"::/html/xvi323qq.htm",  # XVIscript: Error messages
    77: b"::/html/xvi31x5w.htm",  # XVIScript: Command reference
    78: b"::/html/xvi37xv1.htm",  # XVIscript: Command line parameters
    79: b"::/html/xvi356b4.htm",  # XVIscript: Example
    80: b"::/html/xvi32gac.htm",  # Menu "XVIScript"
    81: b"::/html/xvi384q4.htm",  # Uninstall XVI32
    82: b"::/html/xvi33awg.htm",  # Options: Appearance
    83: b"::/html/xvi31gmh.htm",  # Options: Data Inspector
    84: b"::/html/xvi349kb.htm",  # Options: Shortcut Link
    85: b"::/html/xvi304kw.htm",  # Data Inspector window
    86: b"::/html/xvi33gtl.htm",  # Options DI tab (idh_optdi)
    87: b"::/html/xvi34p2d.htm",  # UTF-16 / Unicode option
}


def enc_call(at: int, target: int) -> bytes:
    return b"\xE8" + struct.pack("<i", target - (at + 5))


def enc_jmp(at: int, target: int) -> bytes:
    return b"\xE9" + struct.pack("<i", target - (at + 5))


def enc_jmp_short(at: int, target: int) -> bytes:
    rel = target - (at + 2)
    if not -128 <= rel <= 127:
        raise ValueError(f"short jump out of range {at:#x}->{target:#x}")
    return b"\xEB" + struct.pack("<b", rel)


def enc_jcc_short(op: int, at: int, target: int) -> bytes:
    rel = target - (at + 2)
    if not -128 <= rel <= 127:
        raise ValueError(f"short jcc out of range {at:#x}->{target:#x}")
    return bytes([op]) + struct.pack("<b", rel)


class Emitter:
    def __init__(self, va: int):
        self.va = va
        self.buf = bytearray()

    def emit(self, b: bytes) -> None:
        self.buf += b
        self.va += len(b)

    def call_iat(self, iat: int) -> None:
        self.emit(b"\xFF\x15" + struct.pack("<I", iat))


def align_up(v: int, a: int) -> int:
    return (v + a - 1) & ~(a - 1)


def build_helper(cave_va: int) -> tuple[bytes, dict[str, int]]:
    """edx = context id (<=0 => Contents / no section).

    Entries:
      helper     -> TOPIC_BY_ID (Help buttons). Caller edx is the context id.
      popup      -> POPUP_BY_ID (What's This / WinHelp hook)
    ECX holds the active id->suffix table for the shared body (pushed before
    GetModuleFileNameA - Win32 calls clobber ECX).
    """
    e = Emitter(cave_va)
    patch_hhctrl: list[int] = []
    patch_htmlhelp: list[int] = []
    patch_topic_table: list[int] = []
    patch_popup_table: list[int] = []
    patch_cache: list[int] = []  # imm32 offsets for g_HtmlHelpA VA
    entries: dict[str, int] = {}

    entries["helper"] = e.va
    patch_topic_table.append(len(e.buf) + 1)
    e.emit(b"\xB9\x00\x00\x00\x00")  # mov ecx, TOPIC table
    jmp_shared_from_helper = len(e.buf)
    e.emit(b"\xEB\x00")

    entries["popup"] = e.va
    patch_popup_table.append(len(e.buf) + 1)
    e.emit(b"\xB9\x00\x00\x00\x00")  # mov ecx, POPUP table
    # fall through to shared

    shared_va = e.va
    e.buf[jmp_shared_from_helper : jmp_shared_from_helper + 2] = enc_jmp_short(
        cave_va + jmp_shared_from_helper, shared_va
    )

    e.emit(b"\x53\x56\x57")  # push ebx,esi,edi
    e.emit(b"\x8B\xDA")  # mov ebx, edx  ; context
    # ECX = table VA must survive GetModuleFileNameA (caller-saved). Keep under path buf.
    e.emit(b"\x51")  # push ecx
    e.emit(b"\x81\xEC" + struct.pack("<I", PATH_BUF))

    # GetModuleFileNameA(NULL, path, PATH_BUF)
    e.emit(b"\x68" + struct.pack("<I", PATH_BUF))
    e.emit(b"\x8D\x44\x24\x04")
    e.emit(b"\x50")
    e.emit(b"\x6A\x00")
    e.call_iat(IAT_GET_MODULE_FILE_NAME_A)

    # find last '\\'
    e.emit(b"\x8D\x34\x24")
    e.emit(b"\x33\xFF")
    loop_va = e.va
    e.emit(b"\x8A\x06")
    e.emit(b"\x84\xC0")
    jz_done = len(e.buf)
    e.emit(b"\x74\x00")
    e.emit(b"\x3C\x5C")
    jne_next = len(e.buf)
    e.emit(b"\x75\x00")
    e.emit(b"\x8B\xFE")
    e.buf[jne_next + 1] = (len(e.buf) - (jne_next + 2)) & 0xFF
    e.emit(b"\x46")
    e.emit(enc_jmp_short(e.va, loop_va))
    e.buf[jz_done + 1] = (len(e.buf) - (jz_done + 2)) & 0xFF

    # if edi: copy CHM name over filename
    e.emit(b"\x85\xFF")
    jz_skip_chm = len(e.buf)
    e.emit(b"\x74\x00")
    e.emit(b"\x47")
    e.emit(b"\xBE" + struct.pack("<I", STR_XVI32U_CHM))
    copy_chm = e.va
    e.emit(b"\xAC")
    e.emit(b"\xAA")
    e.emit(b"\x84\xC0")
    e.emit(enc_jcc_short(0x75, e.va, copy_chm))
    e.buf[jz_skip_chm + 1] = (len(e.buf) - (jz_skip_chm + 2)) & 0xFF

    # if ebx <= 0: skip topic suffix (Contents)
    e.emit(b"\x85\xDB")  # test ebx, ebx
    jle_no_topic = len(e.buf)
    e.emit(b"\x7E\x00")  # jle

    # lookup ebx in table saved at [esp+PATH_BUF]: {dword id, dword str_va}*, id=0 sentinel
    e.emit(b"\x8B\xB4\x24" + struct.pack("<I", PATH_BUF))  # mov esi, [esp+PATH_BUF]
    look_va = e.va
    e.emit(b"\x8B\x06")  # mov eax, [esi]  ; id
    e.emit(b"\x85\xC0")
    jz_not_found = len(e.buf)
    e.emit(b"\x74\x00")
    e.emit(b"\x3B\xC3")  # cmp eax, ebx
    jne_next_ent = len(e.buf)
    e.emit(b"\x75\x00")
    e.emit(b"\x8B\x76\x04")  # mov esi, [esi+4]  ; topic suffix VA
    e.emit(b"\x8D\x3C\x24")  # lea edi, [esp]  ; path start
    find_end = e.va
    e.emit(b"\x80\x3F\x00")
    je_at_nul = len(e.buf)
    e.emit(b"\x74\x00")
    e.emit(b"\x47")
    e.emit(enc_jmp_short(e.va, find_end))
    e.buf[je_at_nul + 1] = (len(e.buf) - (je_at_nul + 2)) & 0xFF
    # copy suffix from esi
    copy_suf = e.va
    e.emit(b"\xAC")
    e.emit(b"\xAA")
    e.emit(b"\x84\xC0")
    e.emit(enc_jcc_short(0x75, e.va, copy_suf))
    jmp_after_lookup = len(e.buf)
    e.emit(b"\xEB\x00")
    # next entry
    e.buf[jne_next_ent + 1] = (len(e.buf) - (jne_next_ent + 2)) & 0xFF
    e.emit(b"\x83\xC6\x08")  # add esi, 8
    e.emit(enc_jmp_short(e.va, look_va))
    # not found / jle: no suffix
    e.buf[jz_not_found + 1] = (len(e.buf) - (jz_not_found + 2)) & 0xFF
    e.buf[jle_no_topic + 1] = (len(e.buf) - (jle_no_topic + 2)) & 0xFF
    e.buf[jmp_after_lookup + 1] = (len(e.buf) - (jmp_after_lookup + 2)) & 0xFF

    # Lazy resolve HtmlHelpA into g_HtmlHelpA (once per process).
    # cmp dword [g_HtmlHelpA], 0 / jne use_cached
    patch_cache.append(len(e.buf) + 2)
    e.emit(b"\x83\x3D\x00\x00\x00\x00\x00")
    jne_use_cached = len(e.buf)
    e.emit(b"\x75\x00")

    # LoadLibraryA("hhctrl.ocx")
    patch_hhctrl.append(len(e.buf) + 1)
    e.emit(b"\x68\x00\x00\x00\x00")
    e.call_iat(IAT_LOAD_LIBRARY_A)
    e.emit(b"\x85\xC0")
    jz_fail_load = len(e.buf)
    e.emit(b"\x74\x00")

    # Keep HMODULE on stack across GetProcAddress; FreeLibrary consumes it on fail.
    e.emit(b"\x50")  # push eax  ; HMODULE
    patch_htmlhelp.append(len(e.buf) + 1)
    e.emit(b"\x68\x00\x00\x00\x00")  # push "HtmlHelpA"
    e.emit(b"\xFF\x74\x24\x04")  # push dword [esp+4] ; HMODULE
    e.call_iat(IAT_GET_PROC_ADDRESS)
    e.emit(b"\x85\xC0")
    jz_fail_gpa = len(e.buf)
    e.emit(b"\x74\x00")

    e.emit(b"\x83\xC4\x04")  # add esp, 4  ; drop saved HMODULE (keep module loaded)
    patch_cache.append(len(e.buf) + 1)
    e.emit(b"\xA3\x00\x00\x00\x00")  # mov [g_HtmlHelpA], eax
    jmp_use_cached = len(e.buf)
    e.emit(b"\xEB\x00")

    # GetProcAddress failed: FreeLibrary(HMODULE) - stdcall pops our saved push.
    e.buf[jz_fail_gpa + 1] = (len(e.buf) - (jz_fail_gpa + 2)) & 0xFF
    e.call_iat(IAT_FREE_LIBRARY)
    jmp_fail_after_free = len(e.buf)
    e.emit(b"\xEB\x00")

    use_cached = len(e.buf)
    e.buf[jne_use_cached + 1] = (use_cached - (jne_use_cached + 2)) & 0xFF
    e.buf[jmp_use_cached + 1] = (use_cached - (jmp_use_cached + 2)) & 0xFF

    patch_cache.append(len(e.buf) + 1)
    e.emit(b"\xA1\x00\x00\x00\x00")  # mov eax, [g_HtmlHelpA]
    e.emit(b"\x6A\x00")
    e.emit(b"\x6A" + bytes([HH_DISPLAY_TOPIC]))
    e.emit(b"\x8D\x4C\x24\x08")  # lea ecx, [esp+8] ; path
    e.emit(b"\x51")
    e.emit(b"\x6A\x00")
    e.emit(b"\xFF\xD0")  # call HtmlHelpA (stdcall)

    fail = len(e.buf)
    e.buf[jz_fail_load + 1] = (fail - (jz_fail_load + 2)) & 0xFF
    e.buf[jmp_fail_after_free + 1] = (fail - (jmp_fail_after_free + 2)) & 0xFF

    e.emit(b"\x81\xC4" + struct.pack("<I", PATH_BUF + 4))  # path + saved table
    e.emit(b"\xB0\x01")
    e.emit(b"\x5F\x5E\x5B")
    e.emit(b"\xC3")

    # --- strings + table (writable caches live in BSS slack, not here) ---
    while len(e.buf) & 3:
        e.emit(b"\x00")

    hhctrl = b"hhctrl.ocx\x00"
    htmlhelp = b"HtmlHelpA\x00"
    hhctrl_va = cave_va + len(e.buf)
    e.emit(hhctrl)
    htmlhelp_va = cave_va + len(e.buf)
    e.emit(htmlhelp)

    # Deduped CHM path strings for both maps
    all_suffixes = sorted(set(TOPIC_BY_ID.values()) | set(POPUP_BY_ID.values()))
    suffix_va: dict[bytes, int] = {}
    for suf in all_suffixes:
        suffix_va[suf] = cave_va + len(e.buf)
        e.emit(suf + b"\x00")

    # align table to 4
    while len(e.buf) & 3:
        e.emit(b"\x00")
    topic_table_va = cave_va + len(e.buf)
    for cid in sorted(TOPIC_BY_ID):
        e.emit(struct.pack("<II", cid, suffix_va[TOPIC_BY_ID[cid]]))
    e.emit(struct.pack("<II", 0, 0))

    while len(e.buf) & 3:
        e.emit(b"\x00")
    popup_table_va = cave_va + len(e.buf)
    for cid in sorted(POPUP_BY_ID):
        e.emit(struct.pack("<II", cid, suffix_va[POPUP_BY_ID[cid]]))
    e.emit(struct.pack("<II", 0, 0))

    for off in patch_hhctrl:
        struct.pack_into("<I", e.buf, off, hhctrl_va)
    for off in patch_htmlhelp:
        struct.pack_into("<I", e.buf, off, htmlhelp_va)
    for off in patch_topic_table:
        struct.pack_into("<I", e.buf, off, topic_table_va)
    for off in patch_popup_table:
        struct.pack_into("<I", e.buf, off, popup_table_va)
    for off in patch_cache:
        struct.pack_into("<I", e.buf, off, G_HTMLHELPA_VA)

    entries["cache"] = G_HTMLHELPA_VA
    entries["topic_table"] = topic_table_va
    entries["popup_table"] = popup_table_va
    return bytes(e.buf), entries


def build_winhelp_hook(cave_va: int, popup_helper: int) -> bytes:
    """WinHelpA CODE-thunk hook (same pattern as ShowWindow).

    HELP_CONTEXTPOPUP / HELP_CONTEXT -> popup helper (POPUP_BY_ID, HH_DISPLAY_TOPIC).
    HELP_SETPOPUP_POS -> return TRUE (HtmlHelp places the window itself).
    Other commands -> jmp [IAT_WinHelpA].

    Help buttons never reach this path (they call helper with TOPIC_BY_ID).
    OnHelp remaps some HELP_CONTEXT ids (8,39,40,70) and status-bar 999 to
    CONTEXTPOPUP before WinHelp; those land here as command 8.
    """
    e = Emitter(cave_va)
    e.emit(b"\x55\x8B\xEC")  # push ebp; mov ebp, esp
    # stdcall: [ebp+8]=hwnd [ebp+0C]=lpszHelpFile [ebp+10]=uCommand [ebp+14]=dwData
    e.emit(b"\x8B\x45\x10")  # mov eax, [ebp+0x10] ; uCommand
    e.emit(b"\x83\xF8" + bytes([HELP_SETPOPUP_POS]))
    je_true = len(e.buf)
    e.emit(b"\x74\x00")
    e.emit(b"\x83\xF8" + bytes([HELP_CONTEXTPOPUP]))
    je_popup = len(e.buf)
    e.emit(b"\x74\x00")
    e.emit(b"\x83\xF8" + bytes([HELP_CONTEXT]))
    je_popup2 = len(e.buf)
    e.emit(b"\x74\x00")
    # pass through to real WinHelpA (ret 16 done by the API)
    e.emit(b"\x5D")
    e.emit(b"\xFF\x25" + struct.pack("<I", IAT_WINHELP_A))

    do_popup = len(e.buf)
    e.buf[je_popup + 1] = (do_popup - (je_popup + 2)) & 0xFF
    e.buf[je_popup2 + 1] = (do_popup - (je_popup2 + 2)) & 0xFF
    e.emit(b"\x8B\x55\x14")  # mov edx, [ebp+0x14] ; dwData = context id
    e.emit(enc_call(e.va, popup_helper))
    ret_true = len(e.buf)
    e.buf[je_true + 1] = (ret_true - (je_true + 2)) & 0xFF
    e.emit(b"\xB8\x01\x00\x00\x00")  # mov eax, 1
    e.emit(b"\x5D")
    e.emit(b"\xC2\x10\x00")  # ret 16 (stdcall)
    return bytes(e.buf)


def emit_setfocus_grid_by_modus(e: Emitter) -> None:
    """SetFocus text (+310) or hex (+314) from modus; FormMain in ebx."""
    e.emit(b"\xA1" + struct.pack("<I", MODUS_PTR_VA))
    e.emit(b"\x80\x38\x00")
    je_hex = len(e.buf)
    e.emit(b"\x74\x00")
    e.emit(b"\x8B\x83" + struct.pack("<I", GRID_TEXT_OFF))
    jmp_do = len(e.buf)
    e.emit(b"\xEB\x00")
    hex_off = len(e.buf)
    e.emit(b"\x8B\x83" + struct.pack("<I", GRID_HEX_OFF))
    do_off = len(e.buf)
    e.buf[je_hex + 1] = (hex_off - (je_hex + 2)) & 0xFF
    e.buf[jmp_do + 1] = (do_off - (jmp_do + 2)) & 0xFF
    e.emit(b"\x8B\x10")
    e.emit(b"\xFF\x92" + struct.pack("<I", SETFOCUS_VMT_OFF))


def build_di_layout_keep_hidden(cave_va: int) -> bytes:
    """Visible := False then stock layout (93A70). eax = FormInspect."""
    e = Emitter(cave_va)
    e.emit(b"\x53")
    e.emit(b"\x8B\xD8")
    e.emit(b"\x33\xD2")  # xor edx, edx
    e.emit(b"\x8B\xC3")
    e.emit(enc_call(e.va, SETVISIBLE_VA))
    e.emit(b"\x8B\xC3")
    e.emit(b"\x5B")
    e.emit(enc_jmp(e.va, DI_LAYOUT_VA))
    return bytes(e.buf)


def build_showwindow_hook(cave_va: int) -> bytes:
    """Thunk hook: for g_di_hwnd only, force SW_SHOWNOACTIVATE (unless SW_HIDE).

    Ends with jmp [IAT_SHOW_WINDOW] so the loader-resolved API is used.
    """
    e = Emitter(cave_va)
    e.emit(b"\x55\x8B\xEC")
    e.emit(b"\xA1" + struct.pack("<I", G_DI_HWND_VA))
    e.emit(b"\x85\xC0")
    jz_pass = len(e.buf)
    e.emit(b"\x74\x00")
    e.emit(b"\x3B\x45\x08")
    jne_pass = len(e.buf)
    e.emit(b"\x75\x00")
    e.emit(b"\x83\x7D\x0C\x00")
    je_pass = len(e.buf)
    e.emit(b"\x74\x00")
    e.emit(b"\xC7\x45\x0C" + struct.pack("<I", SW_SHOWNOACTIVATE))
    pass_off = len(e.buf)
    e.buf[jz_pass + 1] = (pass_off - (jz_pass + 2)) & 0xFF
    e.buf[jne_pass + 1] = (pass_off - (jne_pass + 2)) & 0xFF
    e.buf[je_pass + 1] = (pass_off - (je_pass + 2)) & 0xFF
    e.emit(b"\x5D")
    e.emit(b"\xFF\x25" + struct.pack("<I", IAT_SHOW_WINDOW))
    return bytes(e.buf)


def build_di_show_noactivate(cave_va: int) -> bytes:
    """Focus main, SetVisible(True) with DI ShowWindow hooked, SetFocus main.

    This is Show without BringToFront: Memo init lives in SetVisible.
    """
    e = Emitter(cave_va)
    e.emit(b"\x53\x57")  # push ebx, edi
    e.emit(b"\x8B\xD8")  # mov ebx, eax  ; DI

    def focus_main() -> None:
        e.emit(b"\xA1" + struct.pack("<I", FORMMAIN_PTR_VA))
        e.emit(b"\x8B\x00")
        e.emit(b"\x85\xC0")
        jz = len(e.buf)
        e.emit(b"\x74\x00")
        e.emit(b"\x8B\xFB")
        e.emit(b"\x8B\xD8")
        emit_setfocus_grid_by_modus(e)
        e.emit(b"\x8B\xDF")
        done = len(e.buf)
        e.buf[jz + 1] = (done - (jz + 2)) & 0xFF

    focus_main()

    e.emit(b"\x8B\xC3")
    e.emit(enc_call(e.va, GETHANDLE_VA))
    e.emit(b"\xA3" + struct.pack("<I", G_DI_HWND_VA))  # arm ShowWindow hook

    e.emit(b"\xB2\x01")  # mov dl, 1
    e.emit(b"\x8B\xC3")
    e.emit(enc_call(e.va, TCUSTOMFORM_SETVISIBLE_VA))  # Show's init half

    e.emit(b"\x33\xC0")
    e.emit(b"\xA3" + struct.pack("<I", G_DI_HWND_VA))  # disarm hook

    focus_main()

    e.emit(b"\x5F\x5B")
    e.emit(b"\xC3")
    return bytes(e.buf)


def build_di_after_show_focus(cave_va: int) -> bytes:
    """Replace post-Show BringToFront(main) with SetFocus on hex/text grid."""
    e = Emitter(cave_va)
    e.emit(b"\x53")
    e.emit(b"\xA1" + struct.pack("<I", FORMMAIN_PTR_VA))
    e.emit(b"\x8B\x00")
    e.emit(b"\x8B\xD8")
    emit_setfocus_grid_by_modus(e)
    e.emit(b"\x5B")
    e.emit(b"\xC3")
    return bytes(e.buf)


def build_di_deferred_startup(cave_va: int) -> tuple[bytes, dict[str, int]]:
    """Replace sync DataInspector1Click on first FormActivate with SetTimer(1ms).

    Timer: focus main first; if DataInspector checked, then DataInspector1Click.
    """
    e = Emitter(cave_va)
    patch_timerproc: list[int] = []
    entries: dict[str, int] = {}

    entries["schedule"] = e.va
    e.emit(b"\x89\x1D" + struct.pack("<I", G_FORM_VA))
    e.emit(b"\x8B\xC3")
    e.emit(enc_call(e.va, GETHANDLE_VA))
    e.emit(b"\x68")
    patch_timerproc.append(len(e.buf))
    e.emit(b"\x00\x00\x00\x00")
    e.emit(b"\x6A\x01")
    e.emit(b"\x68" + struct.pack("<I", DI_TIMER_ID))
    e.emit(b"\x50")
    e.emit(enc_call(e.va, SETTIMER_VA))
    e.emit(enc_jmp(e.va, DI_STARTUP_RESUME_VA))

    entries["timerproc"] = e.va
    e.emit(b"\x55\x8B\xEC")
    e.emit(b"\xFF\x75\x10")
    e.emit(b"\xFF\x75\x08")
    e.emit(enc_call(e.va, KILLTIMER_VA))
    e.emit(b"\xA1" + struct.pack("<I", G_FORM_VA))
    e.emit(b"\x85\xC0")
    jz_done = len(e.buf)
    e.emit(b"\x74\x00")
    e.emit(b"\x53")
    e.emit(b"\x8B\xD8")
    emit_setfocus_grid_by_modus(e)
    e.emit(b"\x8B\x83" + struct.pack("<I", DATAINSPECTOR_MENU_OFF))
    e.emit(b"\x80\xB8" + struct.pack("<I", MENUITEM_CHECKED_OFF) + b"\x00")
    je_after = len(e.buf)
    e.emit(b"\x74\x00")
    e.emit(b"\x33\xD2")
    e.emit(b"\x8B\xC3")
    e.emit(enc_call(e.va, DATAINSPECTOR1CLICK_VA))
    after_off = len(e.buf)
    e.buf[je_after + 1] = (after_off - (je_after + 2)) & 0xFF
    e.emit(b"\x33\xC0")
    e.emit(b"\xA3" + struct.pack("<I", G_FORM_VA))
    e.emit(b"\x5B")
    done_off = len(e.buf)
    e.buf[jz_done + 1] = (done_off - (jz_done + 2)) & 0xFF
    e.emit(b"\x5D")
    e.emit(b"\xC2\x10\x00")

    entries["g_form"] = G_FORM_VA
    for off in patch_timerproc:
        struct.pack_into("<I", e.buf, off, entries["timerproc"])
    return bytes(e.buf), entries


def build_net_status(cave_va: int) -> tuple[bytes, dict[str, int]]:
    """Save/Save As status panel 3, plus WNetGetConnectionA failure check.

    arm: SetText (eax/edx already set) then g_net_status = 1.
    clear: SetCursor (eax/edx already set). If flagged, empty panel 3.
    ebx is TFormMain on both the fall-through finally and @HandleFinally.
    wnet: stdcall args are already on the stack (site is a jmp, not a call).
    Nonzero API result -> zero ebp-0x10C so the following StrPas is empty.
    """
    e = Emitter(cave_va)
    entries: dict[str, int] = {}

    entries["arm"] = e.va
    e.emit(enc_call(e.va, STATUS_SETTEXT_VA))
    e.emit(b"\xC6\x05" + struct.pack("<I", G_NET_STATUS_VA) + b"\x01")
    e.emit(b"\xC3")

    entries["clear"] = e.va
    e.emit(enc_call(e.va, SCREEN_SETCURSOR_VA))
    e.emit(b"\x80\x3D" + struct.pack("<I", G_NET_STATUS_VA) + b"\x00")
    jz_done = len(e.buf)
    e.emit(b"\x74\x00")
    e.emit(b"\xC6\x05" + struct.pack("<I", G_NET_STATUS_VA) + b"\x00")
    e.emit(b"\x8B\x83" + struct.pack("<I", STATUSBAR_OFF))
    e.emit(b"\x8B\x80" + struct.pack("<I", STATUS_PANELS_OFF))
    e.emit(b"\xBA" + struct.pack("<I", STATUS_PANEL_NET))
    e.emit(enc_call(e.va, STATUS_GETITEM_VA))
    e.emit(b"\x33\xD2")
    e.emit(enc_call(e.va, STATUS_SETTEXT_VA))
    done = len(e.buf)
    rel = done - (jz_done + 2)
    if not -128 <= rel <= 127:
        raise SystemExit(f"net-status clear jump out of range ({rel})")
    e.buf[jz_done + 1] = rel & 0xFF
    e.emit(b"\xC3")

    entries["wnet"] = e.va
    e.emit(enc_call(e.va, WNET_THUNK_VA))
    e.emit(b"\x85\xC0")
    jz_ok = len(e.buf)
    e.emit(b"\x74\x00")
    # mov byte ptr [ebp-10Ch], 0
    e.emit(b"\xC6\x85" + struct.pack("<i", -0x10C) + b"\x00")
    ok = len(e.buf)
    rel = ok - (jz_ok + 2)
    if not -128 <= rel <= 127:
        raise SystemExit(f"wnet jump out of range ({rel})")
    e.buf[jz_ok + 1] = rel & 0xFF
    e.emit(enc_jmp(e.va, WNET_RESUME_VA))

    return bytes(e.buf), entries


def build_script_save_hook(cave_va: int) -> bytes:
    """Untitled XVIscript Save opens the Save As dialog.

    Save1Click always passes gvar_000B6CF8 to TStrings.SaveToFile. The
    toolbar button is enabled while that string is nil, so FileCreate
    fails with "Cannot create file". The close-query already handles a
    nil name by calling sub_000A6194 (000A60CD nil test, 000A6139 call
    with the form in eax). This hook does that at the start of Save1Click.
    sub_000A6194 stores the chosen name before it calls Save1Click again,
    so the re-entry follows the original SaveToFile tail. Cancel returns
    without writing. A name already set (Open, or Save after Save As)
    replays the stolen prologue and continues at 000A669D.
    """
    e = Emitter(cave_va)
    # eax = TFormScript. edx = Sender; Save1Click never reads it.
    # 000A60CD mov eax,[0xB5644] / 000A60D2 cmp dword ptr [eax],0
    e.emit(b"\x50")  # push eax  (keep Self across the nil test)
    e.emit(b"\xA1" + struct.pack("<I", SCRIPT_PATH_PTR_VA))
    e.emit(b"\x83\x38\x00")
    e.emit(b"\x58")  # pop eax
    jne_have = len(e.buf)
    e.emit(b"\x75\x00")
    # 000A6139 mov eax,ebx / call 000A6194. Self is already in eax.
    # 000A6194 preserves ebx, esi, and edi.
    e.emit(enc_call(e.va, SCRIPT_SAVEAS_VA))
    e.emit(b"\xC3")
    have = len(e.buf)
    rel = have - (jne_have + 2)
    if not -128 <= rel <= 127:
        raise SystemExit(f"script save jump out of range ({rel})")
    e.buf[jne_have + 1] = rel & 0xFF
    # Stolen 000A6694 prologue, then jmp 000A669D mov edx,[edx].
    e.emit(b"\x53")  # push ebx
    e.emit(b"\x8B\xD8")  # mov ebx, eax
    e.emit(b"\x8B\x15" + struct.pack("<I", SCRIPT_PATH_PTR_VA))
    e.emit(enc_jmp(e.va, SCRIPT_SAVE_RESUME_VA))
    return bytes(e.buf)


def build_charconv_refresh_hook(cave_va: int) -> bytes:
    """Reload every visible hex and text cell after character conversion.

    sub_0009B42C converts from its start offset through the end of the file,
    then calls sub_00099890. 0009989A loads dl from gvar_000B6B80 (cursor row)
    and 000998A0 loads al from gvar_000B6B7C (cursor column). sub_000996A4
    rewrites grid cells only from that cell forward, so Scope Begin (the
    `mov eax, 1` at 000B270D) changes bytes before the cursor in the file
    while the hex and text views keep the old cells. Nothing in that call
    is an immediate we can retarget at the first visible cell.

    sub_000998B0 already reloads the whole visible area with xor edx,edx /
    xor eax,eax / call 000996A4 (00099995). This hook is that full reload
    in the shape of 00099890: call 0009958C, store eax to gvar_000B6B88,
    pass column 0 and row 0, then call 000983B8. The cursor globals are
    left as they are. The three callees preserve ebx, esi, and edi, same
    as the Delphi call being replaced. The caller overwrites eax at 0009B516.

    0009B4DA setg byte ptr [gvar_000B6BA5] runs inside the per-byte loop, so a
    count of zero clears the modified flag. Those 7 bytes are NOP'd. This
    hook still has sub_0009B42C's ebp: 0009B43C stored the caller's count
    pointer with `mov [ebp-4], edx`, and 0009B4D4 reads it back with
    `mov eax, [ebp-4]`. The same compare, used once after the loop, sets the
    flag only when that dword is greater than zero. eax is free; the caller
    overwrites it at 0009B516.
    """
    e = Emitter(cave_va)
    # 0009B4D4 mov eax, [ebp-4] / 0009B4D7 cmp dword ptr [eax], 0
    e.emit(b"\x8B\x45\xFC")
    e.emit(b"\x83\x38\x00")
    jle_at = len(e.buf)
    e.emit(b"\x7E\x00")  # jle skip  (count == 0: leave gvar_000B6BA5 as it is)
    # mov byte ptr [gvar_000B6BA5], 1
    e.emit(b"\xC6\x05" + struct.pack("<I", MODIFIED_FLAG_VA) + b"\x01")
    rel = len(e.buf) - (jle_at + 2)
    if not -128 <= rel <= 127:
        raise SystemExit(f"modified-flag jump out of range ({rel})")
    e.buf[jle_at + 1] = rel & 0xFF
    e.emit(enc_call(e.va, VISIBLE_END_VA))
    # 00099895 mov [gvar_000B6B88], eax
    e.emit(b"\xA3" + struct.pack("<I", VISIBLE_END_PTR_VA))
    e.emit(b"\x33\xC0")  # xor eax, eax  column 0, as at 00099997
    e.emit(b"\x33\xD2")  # xor edx, edx  row 0, as at 00099995
    e.emit(enc_call(e.va, FILL_GRID_VA))
    e.emit(enc_call(e.va, REFRESH_STATUS_VA))
    e.emit(b"\xC3")
    return bytes(e.buf)


def build_table_save_hook(cave_va: int) -> bytes:
    """Copy the conversion table, then clear it the way 0009B0A6 did.

    sub_0009B070 calls sub_0009B244 before reading, so a bad file replaces
    the table with the identity map and the exception path returns 0 with
    that empty map still in place. No immediate selects "keep the old table".
    esi at this call is the text-file record (`lea esi, [ebp-1D4]` at
    0009B092). The copy uses esi and edi, so both are saved and restored
    before sub_0009B244. That routine preserves ebx, esi, and edi. The 256
    bytes at gvar_000B6BF4 are the whole table (0009B246 through the wrap
    of dl).
    """
    e = Emitter(cave_va)
    e.emit(b"\x56")  # push esi
    e.emit(b"\x57")  # push edi
    e.emit(b"\xFC")  # cld
    e.emit(b"\xBE" + struct.pack("<I", TABLE_VA))  # mov esi, gvar_000B6BF4
    e.emit(b"\xBF" + struct.pack("<I", G_TABLE_BACKUP_VA))  # mov edi, backup
    e.emit(b"\xB9" + struct.pack("<I", 64))  # mov ecx, 64
    e.emit(b"\xF3\xA5")  # rep movsd
    e.emit(b"\x5F")  # pop edi
    e.emit(b"\x5E")  # pop esi
    e.emit(enc_call(e.va, IDENTITY_VA))
    e.emit(b"\xC3")
    return bytes(e.buf)


def build_table_restore_hook(cave_va: int) -> bytes:
    """Put the saved table back when sub_0009B070's read raises.

    0009B1F8 is `xor ebx, ebx` / `call @DoneExcept`. ebx is the function
    result and must stay 0. The copy saves esi and edi; @DoneExcept preserves
    ebx, esi, and edi. Execution continues at 0009B1FF (`xor eax, eax`),
    the outer finally. There is no flag in the function that means "restore".
    """
    e = Emitter(cave_va)
    e.emit(b"\x33\xDB")  # xor ebx, ebx   as at 0009B1F8
    e.emit(b"\x56")  # push esi
    e.emit(b"\x57")  # push edi
    e.emit(b"\xFC")  # cld
    e.emit(b"\xBE" + struct.pack("<I", G_TABLE_BACKUP_VA))
    e.emit(b"\xBF" + struct.pack("<I", TABLE_VA))
    e.emit(b"\xB9" + struct.pack("<I", 64))
    e.emit(b"\xF3\xA5")
    e.emit(b"\x5F")
    e.emit(b"\x5E")
    e.emit(enc_call(e.va, DONEEXCEPT_VA))
    e.emit(enc_jmp(e.va, LOAD_FAIL_RESUME_VA))
    return bytes(e.buf)


def append_hhelp_and_hdata(data: bytearray, blob: bytes) -> tuple[int, int]:
    """Append RX .hhelp (blob) then RW .hdata (8 zero bytes). Returns (hhelp_va, hdata_va)."""
    if len(blob) > SECTION_RAW:
        raise SystemExit(f"helper {len(blob)} exceeds section {SECTION_RAW}")

    e_lfanew = struct.unpack_from("<I", data, 0x3C)[0]
    nsec = struct.unpack_from("<H", data, e_lfanew + 6)[0]
    opt_size = struct.unpack_from("<H", data, e_lfanew + 20)[0]
    opt = e_lfanew + 24
    sec = opt + opt_size
    section_align = struct.unpack_from("<I", data, opt + 32)[0]
    file_align = struct.unpack_from("<I", data, opt + 36)[0]
    size_of_image = struct.unpack_from("<I", data, opt + 56)[0]
    image_base = struct.unpack_from("<I", data, opt + 28)[0]

    header_end = sec + nsec * 40
    first_raw = struct.unpack_from("<I", data, sec + 20)[0]
    if header_end + 80 > first_raw:
        raise SystemExit("no room for .hhelp + .hdata section headers")

    for i in range(nsec):
        name = bytes(data[sec + i * 40 : sec + i * 40 + 8])
        if name.startswith(b".hhelp") or name.startswith(b".hdata"):
            raise SystemExit("already has .hhelp/.hdata - use an unpatched htmlhelp base")

    hhelp_rva = align_up(size_of_image, section_align)
    # SizeOfImage after .hhelp: one section page when blob/raw fit in SectionAlign
    hdata_rva = align_up(hhelp_rva + max(len(blob), SECTION_RAW, 1), section_align)
    hhelp_va = image_base + hhelp_rva
    hdata_va = image_base + hdata_rva

    hhelp_raw = align_up(len(data), file_align)
    if hhelp_raw > len(data):
        data.extend(b"\x00" * (hhelp_raw - len(data)))
    hdata_file = align_up(hhelp_raw + SECTION_RAW, file_align)

    hdr_hhelp = bytearray(40)
    hdr_hhelp[0:8] = SECTION_NAME
    struct.pack_into("<I", hdr_hhelp, 8, len(blob))
    struct.pack_into("<I", hdr_hhelp, 12, hhelp_rva)
    struct.pack_into("<I", hdr_hhelp, 16, SECTION_RAW)
    struct.pack_into("<I", hdr_hhelp, 20, hhelp_raw)
    struct.pack_into("<I", hdr_hhelp, 36, SECTION_CHARS)

    hdr_hdata = bytearray(40)
    hdr_hdata[0:8] = HDATA_NAME
    struct.pack_into("<I", hdr_hdata, 8, HDATA_VIRT)
    struct.pack_into("<I", hdr_hdata, 12, hdata_rva)
    struct.pack_into("<I", hdr_hdata, 16, HDATA_RAW)
    struct.pack_into("<I", hdr_hdata, 20, hdata_file)
    struct.pack_into("<I", hdr_hdata, 36, HDATA_CHARS)

    data[header_end : header_end + 40] = hdr_hhelp
    data[header_end + 40 : header_end + 80] = hdr_hdata
    struct.pack_into("<H", data, e_lfanew + 6, nsec + 2)
    struct.pack_into(
        "<I",
        data,
        opt + 56,
        align_up(hdata_rva + max(HDATA_VIRT, 1), section_align),
    )

    end = hdata_file + HDATA_RAW
    if end > len(data):
        data.extend(b"\x00" * (end - len(data)))
    data[hhelp_raw : hhelp_raw + SECTION_RAW] = blob + b"\x00" * (SECTION_RAW - len(blob))
    # .hdata payload already zero from extend
    return hhelp_va, hdata_va


def va_to_fo(data: bytes, va: int) -> int:
    e_lfanew = struct.unpack_from("<I", data, 0x3C)[0]
    nsec = struct.unpack_from("<H", data, e_lfanew + 6)[0]
    opt_size = struct.unpack_from("<H", data, e_lfanew + 20)[0]
    opt = e_lfanew + 24
    image_base = struct.unpack_from("<I", data, opt + 28)[0]
    rva = va - image_base
    sec = opt + opt_size
    for i in range(nsec):
        o = sec + i * 40
        vs, sva, rs, rp = struct.unpack_from("<IIII", data, o + 8)
        if sva <= rva < sva + max(vs, rs):
            return rp + (rva - sva)
    raise ValueError(f"VA {va:#x} not in section")


def patch_bytes(data: bytearray, va: int, new: bytes, expect: bytes | None = None) -> None:
    fo = va_to_fo(data, va)
    if expect is not None and data[fo : fo + len(expect)] != expect:
        raise SystemExit(
            f"unexpected at {va:#x}: got {data[fo:fo+len(expect)].hex()} "
            f"want {expect.hex()}"
        )
    data[fo : fo + len(new)] = new


def patch_call_helpcontext(data: bytearray, call_va: int, helper: int) -> None:
    """Replace `call HelpContext` with `call helper`."""
    expect = enc_call(call_va, HELPCONTEXT_VA)
    patch_bytes(data, call_va, enc_call(call_va, helper), expect)


def patch_scope_from_helpcontext(data: bytearray) -> int:
    """Fix Find/Replace (and Count) 'Scope from' HelpContext 59 -> 58.

    Stock DFM uses 59 (Character Conversion topic). HLP CTXOMAP id 58 is the
    correct popup (idh_scope / xvi38dlx.htm): search starts at Cursor / Begin / End.
    CharTable also has HelpContext 59 on its Scope group; leave that alone -
    its DFM blob uses ItemIndex (not TabOrder+rbtCursor), and F1 showing the
    Character Conversion chapter is acceptable for that dialog.
    """
    # Binary DFM: HelpContext <type=2> <byte value> Caption ...
    marker = b"HelpContext\x02;\x07Caption\x06\nScope from\x08TabOrder"
    n = 0
    start = 0
    while True:
        i = data.find(marker, start)
        if i < 0:
            break
        val_off = i + len(b"HelpContext\x02")
        if data[val_off] != 59:
            raise SystemExit(f"Scope from HelpContext at {i:#x} expected 59 got {data[val_off]}")
        data[val_off] = 58
        n += 1
        start = i + 1
    if n != 2:
        raise SystemExit(f"expected 2 Find/Replace Scope from patches, got {n}")
    return n


def patch_chartable_grid_helpcontext(data: bytearray) -> int:
    """Point the conversion grid at its own popup (context 60), not endian (61).

    XVI32-0.exe has one DFM property `HelpContext = 61` followed by `Align =
    alClient`: the StringGridCharTable. Context 60 is idh_chartab (how to type
    or drag a code into the Convert-to column). Context 61 is the endian
    etymology popup.
    """
    marker = b"HelpContext\x02=\x05Align\x07\x08alClient"
    i = data.find(marker)
    if i < 0:
        raise SystemExit("CharTable grid HelpContext marker not found")
    if data.find(marker, i + 1) >= 0:
        raise SystemExit("CharTable grid HelpContext marker is not unique")
    val_off = i + len(b"HelpContext\x02")
    if data[val_off] != 61:
        raise SystemExit(
            f"CharTable grid HelpContext at {i:#x} expected 61 got {data[val_off]}"
        )
    data[val_off] = 60
    return 1


# File offsets. Each entry is (offset, XVI32-0 bytes, XVI32_base bytes).
# Equal bytes between regions are left unchanged.
_XVI32_BASE_EDITS: tuple[tuple[int, bytes, bytes], ...] = (
    # CODE VirtualSize 0xA2D5C -> 0xA2DEC, so the caves at the end of CODE
    # (file 0xA315C..0xA31EB) are inside the in-memory section.
    (0x200, bytes.fromhex("5c"), bytes.fromhex("ec")),
    # After a successful script, jmp into the ShowMessage path instead of
    # the call that drops focus.
    (0x95DBE, bytes.fromhex("8b45f0e8c666feff"), bytes.fromhex("909090e964010000")),
    # FormCreate: jmp to the cave that hides the form before the usual setup.
    (
        0x99D28,
        bytes.fromhex("8bc3e8b98400008bc3e8bedff9ff50e834c7f6ff89839c040000"),
        bytes.fromhex("e92f940000" + "90" * 21),
    ),
    # End of FormCreate: apply the saved window position while still hidden.
    (0x9A152, bytes.fromhex("8bd78bc3e83d460000"), bytes.fromhex("e92d90000090909090")),
    # FormActivate: call the SetFocus-only stub instead of the INI/position routine.
    (0x9A23C, bytes.fromhex("e404"), bytes.fromhex("8b8f")),
    # ModusText1Click: both SetFocus sites go through a cave that skips focus
    # while the form is still invisible.
    (0x9DA8B, bytes.fromhex("8b831003"), bytes.fromhex("e9095700")),
    (0x9DA90, bytes.fromhex("008b10ff92b4000000"), bytes.fromhex("909090909090909090")),
    (0x9DB29, bytes.fromhex("8b831403"), bytes.fromhex("e9845600")),
    (0x9DB2E, bytes.fromhex("008b10ff92b4000000"), bytes.fromhex("909090909090909090")),
    # CODE caves: hide-on-create, position-while-hidden, and the two
    # "SetFocus only if visible" stubs plus the activate SetFocus stub.
    (
        0xA315C,
        bytes(33),
        bytes.fromhex("33d28bc3e81f53faff8bc3e87cf0ffff8bc3e8814bf9ff50e8f732f6ff89839c04"),
    ),
    (
        0xA317F,
        bytes(29),
        bytes.fromhex("e9be6bffff8bc3e89975ffff8bd78bc3e804b6ffffe9c26fffff807b47"),
    ),
    (0xA319D, bytes(6), bytes.fromhex("740e8b831003")),
    (0xA31A5, bytes(5), bytes.fromhex("8b10ff92b4")),
    (0xA31AD, bytes(8), bytes.fromhex("e9e7a8ffff807b47")),
    (0xA31B6, bytes(6), bytes.fromhex("740e8b831403")),
    (0xA31BE, bytes(5), bytes.fromhex("8b10ff92b4")),
    (0xA31C6, bytes(6), bytes.fromhex("e96ca9ffffa1")),
    (0xA31CD, bytes(2), bytes.fromhex("5b0b")),
    (0xA31D0, bytes(2), bytes.fromhex("8038")),
    (0xA31D3, bytes(6), bytes.fromhex("74088b831003")),
    (0xA31DB, bytes(6), bytes.fromhex("eb068b831403")),
    (0xA31E3, bytes(5), bytes.fromhex("8b10ff92b4")),
    (0xA31EB, bytes(1), bytes.fromhex("c3")),
)


def apply_xvi32_base(data: bytearray) -> None:
    """Write the XVI32-0.exe -> XVI32_base.exe difference in place.

    Later hooks in patch() expect the XVI32_base image, so this runs first.
    """
    for off, old, new in _XVI32_BASE_EDITS:
        if len(old) != len(new):
            raise SystemExit(f"base edit length mismatch at {off:#x}")
        got = bytes(data[off : off + len(old)])
        if got != old:
            raise SystemExit(
                f"XVI32-0 mismatch at {off:#x}: got {got.hex()} want {old.hex()}"
            )
        data[off : off + len(new)] = new


def patch(data: bytearray) -> dict:
    global G_HTMLHELPA_VA, G_FORM_VA, G_DI_HWND_VA, G_NET_STATUS_VA, G_TABLE_BACKUP_VA

    apply_xvi32_base(data)
    scope_fixed = patch_scope_from_helpcontext(data)
    grid_fixed = patch_chartable_grid_helpcontext(data)

    e_lfanew = struct.unpack_from("<I", data, 0x3C)[0]
    opt = e_lfanew + 24
    image_base = struct.unpack_from("<I", data, opt + 28)[0]
    size_of_image = struct.unpack_from("<I", data, opt + 56)[0]
    section_align = struct.unpack_from("<I", data, opt + 32)[0]
    helper_rva = align_up(size_of_image, section_align)
    helper_va = image_base + helper_rva
    hdata_va = image_base + align_up(helper_rva + SECTION_RAW, section_align)
    G_HTMLHELPA_VA = hdata_va
    G_FORM_VA = hdata_va + 4
    G_DI_HWND_VA = hdata_va + 8
    G_NET_STATUS_VA = hdata_va + 12
    G_TABLE_BACKUP_VA = hdata_va + 16

    # --- Codegen into one .hhelp blob (helper, DI deferral, hooks) ---
    blob, entries = build_helper(helper_va)
    while len(blob) & 3:
        blob += b"\x00"
    di_va = helper_va + len(blob)
    di_blob, di_entries = build_di_deferred_startup(di_va)
    blob += di_blob
    entries.update(di_entries)

    while len(blob) & 3:
        blob += b"\x00"
    layout_va = helper_va + len(blob)
    blob += build_di_layout_keep_hidden(layout_va)
    entries["di_layout"] = layout_va

    while len(blob) & 3:
        blob += b"\x00"
    show_va = helper_va + len(blob)
    blob += build_di_show_noactivate(show_va)
    entries["di_show_na"] = show_va

    while len(blob) & 3:
        blob += b"\x00"
    focus_va = helper_va + len(blob)
    blob += build_di_after_show_focus(focus_va)
    entries["di_after_show"] = focus_va

    while len(blob) & 3:
        blob += b"\x00"
    hook_va = helper_va + len(blob)
    blob += build_showwindow_hook(hook_va)
    entries["sw_hook"] = hook_va

    while len(blob) & 3:
        blob += b"\x00"
    wh_hook_va = helper_va + len(blob)
    blob += build_winhelp_hook(wh_hook_va, entries["popup"])
    entries["winhelp_hook"] = wh_hook_va

    while len(blob) & 3:
        blob += b"\x00"
    net_va = helper_va + len(blob)
    net_blob, net_entries = build_net_status(net_va)
    blob += net_blob
    entries["net_arm"] = net_entries["arm"]
    entries["net_clear"] = net_entries["clear"]
    entries["net_wnet"] = net_entries["wnet"]

    while len(blob) & 3:
        blob += b"\x00"
    script_save_va = helper_va + len(blob)
    blob += build_script_save_hook(script_save_va)
    entries["script_save"] = script_save_va

    while len(blob) & 3:
        blob += b"\x00"
    charconv_va = helper_va + len(blob)
    blob += build_charconv_refresh_hook(charconv_va)
    entries["charconv_refresh"] = charconv_va

    while len(blob) & 3:
        blob += b"\x00"
    table_save_va = helper_va + len(blob)
    blob += build_table_save_hook(table_save_va)
    entries["table_save"] = table_save_va

    while len(blob) & 3:
        blob += b"\x00"
    table_restore_va = helper_va + len(blob)
    blob += build_table_restore_hook(table_restore_va)
    entries["table_restore"] = table_restore_va

    got_help, got_data = append_hhelp_and_hdata(data, blob)
    if got_help != helper_va:
        raise SystemExit(f"VA mismatch .hhelp {got_help:#x} vs {helper_va:#x}")
    if got_data != hdata_va:
        raise SystemExit(f"VA mismatch .hdata {got_data:#x} vs {hdata_va:#x}")

    # Hook CODE thunks jmp [IAT] -> filters; IAT stays loader-owned
    patch_bytes(
        data,
        SHOWWINDOW_THUNK_VA,
        enc_jmp(SHOWWINDOW_THUNK_VA, hook_va) + b"\x90",
        b"\xFF\x25" + struct.pack("<I", IAT_SHOW_WINDOW),
    )
    patch_bytes(
        data,
        WINHELP_THUNK_VA,
        enc_jmp(WINHELP_THUNK_VA, wh_hook_va) + b"\x90",
        b"\xFF\x25" + struct.pack("<I", IAT_WINHELP_A),
    )

    helper_va = entries["helper"]
    popup_entry = entries["popup"]  # WinHelp hook; Help buttons call helper_va

    # First FormActivate: defer DataInspector1Click until after Activate completes
    expect_di = (
        b"\x33\xD2\x8B\xC3" + enc_call(DI_STARTUP_CALL_VA + 4, DATAINSPECTOR1CLICK_VA)
    )
    patch_bytes(
        data,
        DI_STARTUP_CALL_VA,
        enc_jmp(DI_STARTUP_CALL_VA, entries["schedule"]) + b"\x90" * 4,
        expect_di,
    )

    # DI open: hide after Create, fill, ShowWindow(NOACTIVATE), SetFocus not BringToFront
    patch_bytes(
        data,
        DI_LAYOUT_CALL_VA,
        enc_call(DI_LAYOUT_CALL_VA, entries["di_layout"]),
        enc_call(DI_LAYOUT_CALL_VA, DI_LAYOUT_VA),
    )
    patch_bytes(
        data,
        DI_SHOW_CALL_VA,
        enc_call(DI_SHOW_CALL_VA, DI_FILL_CONTENT_VA),
        enc_call(DI_SHOW_CALL_VA, TCUSTOMFORM_SHOW_VA),
    )
    patch_bytes(
        data,
        DI_FILL_CALL_VA,
        enc_call(DI_FILL_CALL_VA, entries["di_show_na"]),
        enc_call(DI_FILL_CALL_VA, DI_FILL_CONTENT_VA),
    )
    patch_bytes(
        data,
        DI_BRINGTOFRONT_BLOCK_VA,
        enc_call(DI_BRINGTOFRONT_BLOCK_VA, entries["di_after_show"]) + b"\x90" * 7,
        b"\xA1"
        + struct.pack("<I", FORMMAIN_PTR_VA)
        + b"\x8B\x00"
        + enc_call(DI_BRINGTOFRONT_BLOCK_VA + 7, 0x42D74),
    )

    # Help buttons: A1 [Application] / 8B 00 / BA imm / E8 HelpContext / C3.
    # edx is already the topic id, so only the call is replaced.
    # Script is the same shape with imm 0x47. Block's imm is set to 0x26 below.
    for call_va in (
        0xA5990,  # Bit:          000A598B mov edx, 9
        0x9D5B8,  # BlockN:       call after 0009D5B3 mov edx, 0x26
        0xA2DBC,  # CharTable:    000A2DB7 mov edx, 3C
        0x9E898,  # Encode:       0009E893 mov edx, 37
        0x9DB24,  # Goto:         0009DB1F mov edx, 36
        0xA43CC,  # Print:        000A43C7 mov edx, 40
        0x9FCFC,  # Replace:      0009FCF7 mov edx, 35
        0xA66DC,  # Script:       000A66D7 mov edx, 47
    ):
        patch_call_helpcontext(data, call_va, helper_va)

    # Ins: 000A1D50 mov eax,[eax+310] / 000A1D56 xchg eax,edx / 000A1D57 call.
    # After xchg, edx is the insert (0x32) or overwrite (0x48) id.
    patch_call_helpcontext(data, 0xA1D57, helper_va)

    # Preview: 00098024 mov eax,[eax+144] / 0009802A xchg eax,edx / 0009802B call.
    # After xchg, edx is TFormPreview.HelpContext.
    patch_call_helpcontext(data, 0x9802B, helper_va)

    # Opt: four HelpContext calls with edx already set
    for call_va in (0x934F0, 0x9350A, 0x93525, 0x93538):
        patch_call_helpcontext(data, call_va, helper_va)

    # TBitBtn bkHelp click: edx = HelpContext from [control+0x144]
    # (Display difference Information dialog uses context 14)
    patch_call_helpcontext(data, 0x7372B, helper_va)

    # Find/Count share this handler. Compare the caption with string 0x801
    # (Count). je, displacement 0x13, targets 0009F0B1. Fall-through is Find.
    # 0009F0AF jmp 0009F0C2 runs the SEH cleanup.
    patch_bytes(
        data,
        0x9F089,
        b"\xB8" + struct.pack("<I", 0x801),
        b"\xB8" + struct.pack("<I", 0x800),
    )
    patch_bytes(data, 0x9F09C, b"\x74", b"\x75")  # je Count path
    # 0009F0A5 Find: edx = 0x21. 0009F0B8 Count: edx = 0x22.
    # 0009D5B3 Block: edx = 0x26.
    patch_bytes(
        data,
        0x9F0A5,
        b"\xBA" + struct.pack("<I", 0x21),
        bytes.fromhex("ba33000000"),  # XVI32-0.exe: mov edx, 0x33
    )
    patch_bytes(
        data,
        0x9F0B8,
        b"\xBA" + struct.pack("<I", 0x22),
        bytes.fromhex("ba34000000"),  # XVI32-0.exe: mov edx, 0x34
    )
    patch_bytes(
        data,
        0x9D5B3,
        b"\xBA" + struct.pack("<I", 0x26),
        bytes.fromhex("ba38000000"),  # XVI32-0.exe: mov edx, 0x38
    )
    patch_call_helpcontext(data, 0x9F0AA, helper_va)
    patch_call_helpcontext(data, 0x9F0BD, helper_va)

    # Save / Save As: remember that panel 3 shows the network wait text,
    # and clear it in the same finally that restores the cursor.
    for settext_va in (SAVE_SETTEXT_VA, SAVEAS_SETTEXT_VA):
        patch_bytes(
            data,
            settext_va,
            enc_call(settext_va, entries["net_arm"]),
            enc_call(settext_va, STATUS_SETTEXT_VA),
        )
    for setcursor_va in (SAVE_SETCURSOR_VA, SAVEAS_SETCURSOR_VA):
        patch_bytes(
            data,
            setcursor_va,
            enc_call(setcursor_va, entries["net_clear"]),
            enc_call(setcursor_va, SCREEN_SETCURSOR_VA),
        )
    # Failed WNetGetConnectionA must not look like a mapped network drive.
    patch_bytes(
        data,
        WNET_CALL_VA,
        enc_jmp(WNET_CALL_VA, entries["net_wnet"]),
        enc_call(WNET_CALL_VA, WNET_THUNK_VA),
    )

    # Character conversion: refresh the visible grids from the first cell,
    # not from the cursor. 0009B511 is `call 00099890` (E8 7A E3 FF FF).
    patch_bytes(
        data,
        CHARCONV_REFRESH_VA,
        enc_call(CHARCONV_REFRESH_VA, entries["charconv_refresh"]),
        bytes.fromhex("e87ae3ffff"),
    )
    # 0009B4DA setg byte ptr [0xB6BA5] (0F 9F 05 A5 6B 0B 00). A zero count
    # must not clear the flag. The refresh hook sets it when the count is > 0.
    patch_bytes(
        data,
        SETG_VA,
        b"\x90" * 7,
        bytes.fromhex("0f9f05a56b0b00"),
    )
    # 0009B0A6 call 0009B244 (E8 99 01 00 00). Snapshot the table first.
    patch_bytes(
        data,
        LOAD_CLEAR_VA,
        enc_call(LOAD_CLEAR_VA, entries["table_save"]),
        bytes.fromhex("e899010000"),
    )
    # 0009B1F8 xor ebx,ebx / call @DoneExcept (33 DB E8 6D 83 F7 FF).
    # Restore the snapshot, then the same DoneExcept, then 0009B1FF.
    patch_bytes(
        data,
        LOAD_FAIL_VA,
        enc_jmp(LOAD_FAIL_VA, entries["table_restore"]) + b"\x90" * 2,
        bytes.fromhex("33dbe86d83f7ff"),
    )
    # 000A2CF8 clears the name, the table, and the window title. Jump to
    # 000A2D1E lea eax,[ebp-8], which still shows "Error reading %s".
    fail_len = BUTTON_LOAD_ERR_VA - BUTTON_LOAD_FAIL_VA
    patch_bytes(
        data,
        BUTTON_LOAD_FAIL_VA,
        enc_jmp(BUTTON_LOAD_FAIL_VA, BUTTON_LOAD_ERR_VA) + b"\x90" * (fail_len - 5),
        bytes.fromhex(
            "a10c590b00e8020df7ffe83d85ffff8d55f8b81f080000"
            "e8345af7ff8b55f88bc3e842fef9ff"
        ),
    )
    # 000A8727 call 0009B244 (E8 18 2B FF FF). CHARCON's own clear would
    # make a failed load restore the identity map.
    patch_bytes(
        data,
        SCRIPT_CHARCON_CLEAR_VA,
        b"\x90" * 5,
        bytes.fromhex("e8182bffff"),
    )

    # XVIscript Save with no filename: show the Save As dialog.
    # 000A6694 push ebx / mov ebx,eax / mov edx,[0xB5644]
    # (9 bytes). Resume is 000A669D mov edx,[edx].
    patch_bytes(
        data,
        SCRIPT_SAVE_VA,
        enc_jmp(SCRIPT_SAVE_VA, entries["script_save"]) + b"\x90" * 4,
        bytes.fromhex("538bd88b1544560b00"),
    )

    # Contents1Click -> helper(0)
    # Replace prologue with xor edx,edx / call helper / ret
    cont = bytearray()
    cont += b"\x33\xD2"  # xor edx, edx
    cont += enc_call(0xB2514 + 2, helper_va)
    cont += b"\xC3"
    # Original is a long function; overwrite enough of the start
    cont_len = 16
    cont += b"\x90" * (cont_len - len(cont))
    patch_bytes(data, 0xB2514, bytes(cont))

    return {
        "helper": helper_va,
        "popup": popup_entry,
        "cache": entries["cache"],
        "di_schedule": entries["schedule"],
        "di_timerproc": entries["timerproc"],
        "di_layout": entries["di_layout"],
        "di_show_na": entries["di_show_na"],
        "di_after_show": entries["di_after_show"],
        "sw_hook": entries["sw_hook"],
        "winhelp_hook": entries["winhelp_hook"],
        "net_arm": entries["net_arm"],
        "net_clear": entries["net_clear"],
        "net_wnet": entries["net_wnet"],
        "script_save": entries["script_save"],
        "charconv_refresh": entries["charconv_refresh"],
        "table_save": entries["table_save"],
        "table_restore": entries["table_restore"],
        "scope_from_fixed": scope_fixed,
        "grid_fixed": grid_fixed,
        "size": len(blob),
    }


def main() -> None:
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--src", type=Path, default=SRC_DEFAULT)
    ap.add_argument("--dst", type=Path, default=DST_DEFAULT)
    args = ap.parse_args()

    data = bytearray(args.src.read_bytes())
    meta = patch(data)
    out = args.dst
    try:
        out.write_bytes(data)
    except PermissionError:
        out = args.dst.with_name(args.dst.stem + "_lazy" + args.dst.suffix)
        out.write_bytes(data)
        print(f"NOTE: {args.dst} locked; wrote {out} instead")
    print(f"Wrote {out} size={len(data)}")
    print(f"  HtmlHelp helper @ {meta['helper']:#x} popup @ {meta['popup']:#x} ({meta['size']} bytes)")
    print(f"  g_HtmlHelpA @ {meta['cache']:#x} (.hdata)")
    print(f"  g_form @ {G_FORM_VA:#x} (.hdata)")
    print(f"  .hhelp chars={SECTION_CHARS:#x} (RX) raw={SECTION_RAW:#x}")
    print(f"  .hdata chars={HDATA_CHARS:#x} (RW, not executable)")
    print(
        f"  DI: hide@create={meta['di_layout']:#x}; "
        f"SetVisible+SW_hook={meta['di_show_na']:#x}; "
        f"SetFocus={meta['di_after_show']:#x}; "
        f"ShowWindow IAT hook={meta['sw_hook']:#x}"
    )
    print(
        f"  DI deferred startup schedule={meta['di_schedule']:#x} "
        f"timerproc={meta['di_timerproc']:#x}"
    )
    print(
        f"  WinHelp hook @ {meta['winhelp_hook']:#x} "
        f"(CONTEXT/CONTEXTPOPUP -> popup; SETPOPUP_POS no-op)"
    )
    print(f"  TOPIC_BY_ID entries: {len(TOPIC_BY_ID)}")
    print(f"  POPUP_BY_ID entries: {len(POPUP_BY_ID)}")
    print(
        f"  Scope from HelpContext fixed (Find/Replace): {meta['scope_from_fixed']} "
        f"(59->58 idh_scope)"
    )
    print(
        f"  CharTable grid HelpContext fixed: {meta['grid_fixed']} (61->60 idh_chartab)"
    )
    print(
        f"  Net status arm={meta['net_arm']:#x} clear={meta['net_clear']:#x} "
        f"wnet={meta['net_wnet']:#x} flag @ {G_NET_STATUS_VA:#x}"
    )
    print(f"  XVIscript Save hook @ {meta['script_save']:#x}")
    print(f"  Character conversion refresh hook @ {meta['charconv_refresh']:#x}")
    print(
        f"  Conversion table save @ {meta['table_save']:#x} "
        f"restore @ {meta['table_restore']:#x} "
        f"backup @ {G_TABLE_BACKUP_VA:#x}"
    )


if __name__ == "__main__":
    main()
