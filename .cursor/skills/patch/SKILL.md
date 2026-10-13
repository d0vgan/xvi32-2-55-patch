---
name: patch
description: >-
  Add a feature or fix to the XVI32 binary patch by writing the next
  patch_htmlhelp-N.py, running it to produce XVI32-N.exe, and updating
  patch_htmlhelp_info.txt. Prefer changing a value already in the base
  executable, and add a hook only when no such value exists. Use when
  changing XVI32, XVI32.exe, HtmlHelp, the patch script, status-bar or
  help behavior, or the end-user patch notes.
---

# XVI32 binary patch

## Purpose

Maintain a versioned Python program that patches one fixed XVI32 base executable, and ship the executable that program writes. The patch already makes XVI32 use HtmlHelpA and contains earlier fixes. Each new feature or fix is a new version. Older versions stay untouched.

The start folder is `./patch`. Every path below is relative to it, and Python must be run from there: `SRC_DEFAULT` and `DST_DEFAULT` are filenames opened from the working directory.

## Files

- Version N of the program: `patch_htmlhelp-N.py`
- Base executable: `XVI32-0.exe`
- Executable produced by version N: `XVI32-N.exe`
- End-user notes: `patch_htmlhelp_info.txt`
- Decompiled XVI32 source: `IDR/XVI32`

`N` is an integer. The current version is the highest `N`. When no numbered script exists, `patch_htmlhelp.py` is the current script and `N` is 1: the next script is `patch_htmlhelp-2.py` and its output file is `XVI32-2.exe`. When a numbered script exists, `patch_htmlhelp.py` is a spare copy of the latest numbered script. Do not edit that spare copy.

## Rules

1. Copy the current script to `patch_htmlhelp-(N+1).py`. When the current script is the unnumbered `patch_htmlhelp.py`, that copy is `patch_htmlhelp-2.py` (treating `N` as 1). Change only the copy.
2. Keep every comment and the module docstring from the previous version. Add comments for the new code, including why a hook exists. Do not shorten or rewrite old comments.
3. Keep `SRC_DEFAULT` as `XVI32-0.exe`. Do not point it at `XVI32-N.exe`, at a previous output, or at a file that already contains `.hhelp` or `.hdata`. The script rejects those.
4. Set `DST_DEFAULT` to `XVI32-(N+1).exe`. When the source script is the unnumbered `patch_htmlhelp.py`, set `DST_DEFAULT` to `XVI32-2.exe` (treating `N` as 1).
5. Every new hook must pass the register and offset check below before it is written. `patch_bytes` must include `expect` set to the bytes read from `XVI32-0.exe`. A script that only runs successfully has not passed this check.
6. Put technical detail in the Python file only. Put a short end-user description in `patch_htmlhelp_info.txt`.
7. Leave every older `patch_htmlhelp-N.py` and `XVI32-N.exe` as they are. After copying the unnumbered `patch_htmlhelp.py`, leave that file as it is too.

## Minimal binary change

Each new version adds the smallest edit that produces the behavior. The script still rebuilds the executable from `XVI32-0.exe`. Minimal means a smaller edit in that script. It does not mean patching `XVI32-N.exe`.

1. Change a value that is already in `XVI32-0.exe`: a form-resource property, or an immediate in an existing instruction.
2. Add a hook only when no such value exists. Hook the smallest site that already holds the right register, and add only the instructions that assignment needs.
3. The register and offset check still applies to every new or changed hook. A smaller patch that uses a guessed offset does not qualify.

## Actions

1. If a numbered script exists, find the highest `N` and read `patch_htmlhelp-N.py` and `patch_htmlhelp_info.txt`. If none exists, read `patch_htmlhelp.py` and `patch_htmlhelp_info.txt` and use `N` = 1.
2. Find the behavior in `IDR/XVI32` and check the matching bytes in `XVI32-0.exe`.
3. Save the copy as `patch_htmlhelp-(N+1).py` and implement the change there. Choose the edit using Minimal binary change before writing a hook.
4. Extend the module docstring with the new behavior. Keep the old docstring text.
5. Run `python patch_htmlhelp-(N+1).py`. Confirm it writes `XVI32-(N+1).exe`, or `XVI32-2.exe` when `N` is 1. If that file is locked, the script writes the same name with `_lazy` before `.exe`; report that path.
6. Run the register and offset check on that executable. If any row fails, fix the new script and run it again. Do not update the end-user note until every row matches.
7. Update `patch_htmlhelp_info.txt` in the same sitting.

## Register and offset check

A wrong register or structure offset passes the script and crashes XVI32. Do this for every new or changed hook.

1. Copy the IDR instruction, including its VA, register, and displacement. Copy the bytes at that VA from `XVI32-0.exe`. The bytes must decode to that instruction. If they do not, stop and do not guess an offset.
2. In the new code, use that same register for that value. A Delphi call leaves `ebx`, `esi`, and `edi` unchanged and may change `eax`, `edx`, and `ecx`. If the hooked function still needs one of those three after the hook returns, the hook must save and restore it.
3. Copy a structure offset only from that IDR instruction or from the same field in `IDR/XVI32`. Do not invent an offset from a nearby field.
4. After the executable is written, decode every new `call` and `jmp`. Each target must be the VA named in IDR, or an instruction inside the new hook. A target that falls in the middle of an instruction is a failed check.
5. Report one row per hook: IDR text, original bytes, register and offset used in the hook, and each resolved target. Ship the executable only when every row matches.

## End-user note

Add one short paragraph to `patch_htmlhelp_info.txt`, in the same voice as the paragraphs already there. Place it immediately above the line `This patch has been produced by AI`.

Describe only what the user sees: which menu, key, dialog, or message changed, and the result. Do not mention addresses, hooks, sections, or script names. Do not edit the quoted section that starts with `>>>>>>>>`.
