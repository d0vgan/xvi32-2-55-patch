//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit windows;

interface

uses
  SysUtils, Classes;

    function RegCloseKey:Integer; stdcall;//000166B0
    function RegCreateKeyExA(lpSubKey:PAnsiChar; Reserved:Longword; lpClass:PAnsiChar; dwOptions:Longword; samDesired:Longword; lpSecurityAttributes:PSecurityAttributes; var phkResult:HKEY; lpdwDisposition:PDWORD):Longint; stdcall;//000166B8
    function RegFlushKey:Longint; stdcall;//000166C0
    function RegOpenKeyExA(lpSubKey:PAnsiChar; ulOptions:Longword; samDesired:Longword; var phkResult:HKEY):Longint; stdcall;//000166C8
    function RegQueryValueA(lpSubKey:PAnsiChar; lpValue:PAnsiChar; var lpcbValue:Longint):Longint; stdcall;//000166D0
    function RegQueryValueExA(lpValueName:PAnsiChar; lpReserved:Pointer; lpType:PDWORD; lpData:PByte; lpcbData:PDWORD):Longint; stdcall;//000166D8
    function CloseHandle:LongBool; stdcall;//000166E0
    function CompareStringA(dwCmpFlags:Longword; lpString1:PAnsiChar; cchCount1:Integer; lpString2:PAnsiChar; cchCount2:Integer):Integer; stdcall;//000166E8
    function CreateEventA(bManualReset:LongBool; bInitialState:LongBool; lpName:PAnsiChar):Longword; stdcall;//000166F0
    function CreateFileA(dwDesiredAccess:Longword; dwShareMode:Longword; lpSecurityAttributes:PSecurityAttributes; dwCreationDisposition:Longword; dwFlagsAndAttributes:Longword; hTemplateFile:Longword):Longword; stdcall;//000166F8
    function CreateThread(StackSize:Cardinal; ThreadFunc:TThreadFunc; Parameter:Pointer; CreationFlags:Cardinal; var ThreadId:Cardinal):Integer; stdcall;//00016700
    procedure DeleteCriticalSection; stdcall;//00016708
    function DeleteFileA:LongBool; stdcall;//00016710
    function DosDateTimeToFileTime(wFatTime:Word; var lpFileTime:_FILETIME):LongBool; stdcall;//00016718
    procedure EnterCriticalSection; stdcall;//00016720
    function EnumCalendarInfoA(Locale:Longword; Calendar:Longword; CalType:Longword):LongBool; stdcall;//00016728
    function FileTimeToDosDateTime(var lpFatDate:Word; var lpFatTime:Word):LongBool; stdcall;//00016730
    function FileTimeToLocalFileTime(var lpLocalFileTime:_FILETIME):LongBool; stdcall;//00016738
    procedure FindClose;//00016740
    function FindFirstFileA(var lpFindFileData:_WIN32_FIND_DATAA):Longword; stdcall;//00016748
    function FindNextFileA(var lpFindFileData:_WIN32_FIND_DATAA):LongBool; stdcall;//00016750
    function FindResourceA(lpName:PAnsiChar; lpType:PAnsiChar):HRSRC; stdcall;//00016758
    function FormatMessageA(lpSource:Pointer; dwMessageId:Longword; dwLanguageId:Longword; lpBuffer:PAnsiChar; nSize:Longword; Arguments:Pointer):Longword; stdcall;//00016760
    function FreeLibrary:LongBool; stdcall;//00016768
    function FreeResource:LongBool; stdcall;//00016770
    function GetCPInfo(var lpCPInfo:_cpinfo):LongBool; stdcall;//00016778
    function GetCurrentProcessId:Longword;//00016780
    function GetCurrentThreadId:Longword;//00016788
    function GetDateFormatA(dwFlags:Longword; lpDate:PSystemTime; lpFormat:PAnsiChar; lpDateStr:PAnsiChar; cchDate:Integer):Integer; stdcall;//00016790
    function GetDiskFreeSpaceA(var lpSectorsPerCluster:Longword; var lpBytesPerSector:Longword; var lpNumberOfFreeClusters:Longword; var lpTotalNumberOfClusters:Longword):LongBool; stdcall;//00016798
    function GetFileAttributesA:Longword; stdcall;//000167A0
    function GetFullPathNameA(nBufferLength:Longword; lpBuffer:PAnsiChar; var lpFilePart:PAnsiChar):Longword; stdcall;//000167A8
    function GetLastError:Integer;//000167B0
    procedure GetLocalTime; stdcall;//000167B8
    function GetLocaleInfoA(LCType:Longword; lpLCData:PAnsiChar; cchData:Integer):Integer; stdcall;//000167C0
    function GetModuleFileNameA(lpFilename:PAnsiChar; nSize:Longword):Longword; stdcall;//000167C8
    function GetModuleHandleA:HINST; stdcall;//000167D0
    function GetPrivateProfileStringA(lpKeyName:PAnsiChar; lpDefault:PAnsiChar; lpReturnedString:PAnsiChar; nSize:Longword; lpFileName:PAnsiChar):Longword; stdcall;//000167D8
    function GetProcAddress(lpProcName:PAnsiChar):Pointer; stdcall;//000167E0
    function GetProfileStringA(lpKeyName:PAnsiChar; lpDefault:PAnsiChar; lpReturnedString:PAnsiChar; nSize:Longword):Longword; stdcall;//000167E8
    procedure GetSystemInfo; stdcall;//000167F0
    function GetThreadLocale:Integer;//000167F8
    function GetTickCount:Cardinal;//00016800
    function GetVersion:Longword;//00016808
    function GetVersionExA:LongBool; stdcall;//00016810
    function GlobalAddAtomA:Word; stdcall;//00016818
    function GlobalAlloc(dwBytes:Longword):Longword; stdcall;//00016820
    function GlobalDeleteAtom:Word; stdcall;//00016828
    function GlobalFree:Longword; stdcall;//00016830
    function GlobalLock:Pointer; stdcall;//00016838
    function GlobalHandle:Longword; stdcall;//00016840
    function GlobalReAlloc(dwBytes:Longword; uFlags:Longword):Longword; stdcall;//00016848
    function GlobalSize:Longword; stdcall;//00016850
    function GlobalUnlock:LongBool; stdcall;//00016858
    procedure InitializeCriticalSection; stdcall;//00016860
    procedure LeaveCriticalSection; stdcall;//00016868
    function LoadLibraryA:HINST; stdcall;//00016870
    function LoadResource(hResInfo:HRSRC):Longword; stdcall;//00016878
    function LocalFileTimeToFileTime(var lpFileTime:_FILETIME):LongBool; stdcall;//00016880
    function LockResource:Pointer; stdcall;//00016888
    function MulDiv(nNumerator:Integer; nDenominator:Integer):Integer; stdcall;//00016890
    function MultiByteToWideChar(Flags:Integer; MBStr:PAnsiChar; MBCount:Integer; WCStr:PWideChar; WCCount:Integer):Integer; stdcall;//00016898
    function ReadFile(var Buffer:void ; nNumberOfBytesToRead:Longword; var lpNumberOfBytesRead:Longword; lpOverlapped:POverlapped):LongBool; stdcall;//000168A0
    function SetEndOfFile:LongBool; stdcall;//000168A8
    function SetErrorMode:Longword; stdcall;//000168B0
    function SetEvent:LongBool; stdcall;//000168B8
    function SetFilePointer(lDistanceToMove:Longint; lpDistanceToMoveHigh:Pointer; dwMoveMethod:Longword):Longword; stdcall;//000168C0
    function SetFileTime(lpCreationTime:PFileTime; lpLastAccessTime:PFileTime; lpLastWriteTime:PFileTime):LongBool; stdcall;//000168C8
    function SetThreadLocale:LongBool; stdcall;//000168D0
    function SizeofResource(hResInfo:HRSRC):Longword; stdcall;//000168D8
    procedure Sleep;//000168E0
    function VirtualAlloc(dwSize:Integer; flAllocationType:Integer; flProtect:Integer):Pointer; stdcall;//000168E8
    function VirtualQuery(var lpBuffer:TMemInfo; dwLength:Integer):Integer; stdcall;//000168F0
    function WaitForSingleObject(dwMilliseconds:Longword):Longword; stdcall;//000168F8
    function WinExec(uCmdShow:Longword):Longword; stdcall;//00016900
    function WriteFile(const Buffer:void ; nNumberOfBytesToWrite:Longword; var lpNumberOfBytesWritten:Longword; lpOverlapped:POverlapped):LongBool; stdcall;//00016908
    function WritePrivateProfileStringA(lpKeyName:PAnsiChar; lpString:PAnsiChar; lpFileName:PAnsiChar):LongBool; stdcall;//00016910
    function lstrcmpA(lpString2:PAnsiChar):Integer; stdcall;//00016918
    function lstrcpyA(lpString2:PAnsiChar):PAnsiChar; stdcall;//00016920
    function WNetGetConnectionA(lpRemoteName:PAnsiChar; var lpnLength:Longword):Longword; stdcall;//00016928
    function GetFileVersionInfoA(dwHandle:Longword; dwLen:Longword; lpData:Pointer):LongBool; stdcall;//00016930
    function GetFileVersionInfoSizeA(var lpdwHandle:Longword):Longword; stdcall;//00016938
    function VerQueryValueA(lpSubBlock:PAnsiChar; var lplpBuffer:Pointer; var puLen:Longword):LongBool; stdcall;//00016940
    function AbortDoc:Integer; stdcall;//00016948
    function BitBlt(X:Integer; Y:Integer; Width:Integer; Height:Integer; SrcDC:HDC; XSrc:Integer; YSrc:Integer; Rop:Longword):LongBool; stdcall;//00016950
    function CloseEnhMetaFile:HENHMETAFILE; stdcall;//00016958
    function CopyEnhMetaFileA(p2:PAnsiChar):HENHMETAFILE; stdcall;//00016960
    function CreateBitmap(Height:Integer; Planes:Longint; BitCount:Longint; Bits:Pointer):HBITMAP; stdcall;//00016968
    function CreateBrushIndirect:HBRUSH; stdcall;//00016970
    function CreateCompatibleBitmap(Width:Integer; Height:Integer):HBITMAP; stdcall;//00016978
    function CreateCompatibleDC:HDC; stdcall;//00016980
    function CreateDCA(lpszDevice:PAnsiChar; lpszOutput:PAnsiChar; lpdvmInit:PDeviceModeA):HDC; stdcall;//00016988
    function CreateDIBSection(const p2:tagBITMAPINFO; p3:Longword; var p4:Pointer; p5:Longword; p6:Longword):HBITMAP; stdcall;//00016990
    function CreateDIBitmap(var InfoHeader:tagBITMAPINFOHEADER; dwUsage:Longword; InitBits:PChar; var InitInfo:tagBITMAPINFO; wUsage:Longword):HBITMAP; stdcall;//00016998
    function CreateEnhMetaFileA(p2:PAnsiChar; p3:PRect; p4:PAnsiChar):HDC; stdcall;//000169A0
    function CreateFontIndirectA:HFONT; stdcall;//000169A8
    function CreateHalftonePalette:HPALETTE; stdcall;//000169B0
    function CreateICA(lpszDevice:PAnsiChar; lpszOutput:PAnsiChar; lpdvmInit:PDeviceModeA):HDC; stdcall;//000169B8
    function CreatePalette:HPALETTE; stdcall;//000169C0
    function CreatePenIndirect:HPEN; stdcall;//000169C8
    function CreateRectRgn(p2:Integer; p3:Integer; p4:Integer):HRGN; stdcall;//000169D0
    function CreateSolidBrush:HBRUSH; stdcall;//000169D8
    function DeleteDC:LongBool; stdcall;//000169E0
    function DeleteEnhMetaFile:LongBool; stdcall;//000169E8
    function DeleteObject:LongBool; stdcall;//000169F0
    function Ellipse(X1:Integer; Y1:Integer; X2:Integer; Y2:Integer):LongBool; stdcall;//000169F8
    function EndDoc:Integer; stdcall;//00016A00
    function EndPage:Integer; stdcall;//00016A08
    function EnumFontFamiliesExA(var p2:tagLOGFONTA; p3:Pointer; p4:Longint; p5:Longword):LongBool; stdcall;//00016A10
    function EnumFontsA(lpszFace:PAnsiChar; fntenmprc:Pointer; lpszData:PChar):Integer; stdcall;//00016A18
    function Escape(p2:Integer; p3:Integer; p4:PAnsiChar; p5:Pointer):Integer; stdcall;//00016A20
    function ExcludeClipRect(p2:Integer; p3:Integer; p4:Integer; p5:Integer):Integer; stdcall;//00016A28
    function ExtCreatePen(Width:Longword; const Brush:tagLOGBRUSH; StyleCount:Longword; Style:Pointer):HPEN; stdcall;//00016A30
    function ExtTextOutA(X:Integer; Y:Integer; Options:Longint; Rect:PRect; Str:PAnsiChar; Count:Longint; Dx:PInteger):LongBool; stdcall;//00016A38
    function GetBitmapBits(Count:Longint; Bits:Pointer):Longint; stdcall;//00016A40
    function GetBrushOrgEx(var p2:TPoint):LongBool; stdcall;//00016A48
    function GetClipBox(var Rect:TRect):Integer; stdcall;//00016A50
    function GetCurrentPositionEx(Point:PPoint):LongBool; stdcall;//00016A58
    function GetDCOrgEx(var Origin:TPoint):LongBool; stdcall;//00016A60
    function GetDIBColorTable(p2:Longword; p3:Longword; var RGBQuadStructs:void ):Longword; stdcall;//00016A68
    function GetDIBits(Bitmap:HBITMAP; StartScan:Longword; NumScans:Longword; Bits:Pointer; var BitInfo:tagBITMAPINFO; Usage:Longword):Integer; stdcall;//00016A70
    function GetDeviceCaps(Index:Integer):Integer; stdcall;//00016A78
    function GetEnhMetaFileBits(p2:Longword; p3:PByte):Longword; stdcall;//00016A80
    function GetEnhMetaFileDescriptionA(p2:Longword; p3:PAnsiChar):Longword; stdcall;//00016A88
    function GetEnhMetaFileHeader(p2:Longword; p3:PEnhMetaHeader):Longword; stdcall;//00016A90
    function GetEnhMetaFilePaletteEntries(p2:Longword; p3:Pointer):Longword; stdcall;//00016A98
    function GetObjectA(p2:Integer; p3:Pointer):Integer; stdcall;//00016AA0
    function GetPaletteEntries(StartIndex:Longword; NumEntries:Longword; var PaletteEntries:void ):Longword; stdcall;//00016AA8
    function GetPixel(X:Integer; Y:Integer):Longword; stdcall;//00016AB0
    function GetStockObject:HGDIOBJ; stdcall;//00016AB8
    function GetSystemPaletteEntries(StartIndex:Longword; NumEntries:Longword; var PaletteEntries:void ):Longword; stdcall;//00016AC0
    function GetTextExtentPointA(Str:PAnsiChar; Count:Integer; var Size:tagSIZE):LongBool; stdcall;//00016AC8
    function GetTextMetricsA(var TM:tagTEXTMETRICA):LongBool; stdcall;//00016AD0
    function GetWinMetaFileBits(p2:Longword; p3:PByte; p4:Integer; p5:HDC):Longword; stdcall;//00016AD8
    function GetWindowOrgEx(var Point:TPoint):LongBool; stdcall;//00016AE0
    function IntersectClipRect(X1:Integer; Y1:Integer; X2:Integer; Y2:Integer):Integer; stdcall;//00016AE8
    function LineTo(X:Integer; Y:Integer):LongBool; stdcall;//00016AF0
    function MaskBlt(p2:Integer; p3:Integer; p4:Integer; p5:Integer; p6:HDC; p7:Integer; p8:Integer; p9:HBITMAP; p10:Integer; p11:Integer; p12:Longword):LongBool; stdcall;//00016AF8
    function MoveToEx(p2:Integer; p3:Integer; p4:PPoint):LongBool; stdcall;//00016B00
    function PatBlt(X:Integer; Y:Integer; Width:Integer; Height:Integer; Rop:Longword):LongBool; stdcall;//00016B08
    function Pie(X1:Integer; Y1:Integer; X2:Integer; Y2:Integer; X3:Integer; Y3:Integer; X4:Integer; Y4:Integer):LongBool; stdcall;//00016B10
    function PlayEnhMetaFile(p2:HENHMETAFILE; const p3:TRect):LongBool; stdcall;//00016B18
    function PolyPolyline(const PointStructs:void ; const Points:void ; p4:Longword):LongBool; stdcall;//00016B20
    function Polyline(var Points:void ; Count:Integer):LongBool; stdcall;//00016B28
    function RealizePalette:Longword; stdcall;//00016B30
    function RectVisible(const Rect:TRect):LongBool; stdcall;//00016B38
    function Rectangle(X1:Integer; Y1:Integer; X2:Integer; Y2:Integer):LongBool; stdcall;//00016B40
    function RestoreDC(SavedDC:Integer):LongBool; stdcall;//00016B48
    function SaveDC:Integer; stdcall;//00016B50
    function SelectObject(p2:HGDIOBJ):HGDIOBJ; stdcall;//00016B58
    function SelectPalette(Palette:HPALETTE; ForceBackground:LongBool):HPALETTE; stdcall;//00016B60
    function SetAbortProc(lpAbortProc:TFNAbortProc):Integer; stdcall;//00016B68
    function SetBkColor(Color:Longword):Longword; stdcall;//00016B70
    function SetBkMode(BkMode:Integer):Integer; stdcall;//00016B78
    function SetBrushOrgEx(X:Integer; Y:Integer; PrevPt:PPoint):LongBool; stdcall;//00016B80
    function SetDIBColorTable(p2:Longword; p3:Longword; var RGBQuadSTructs:void ):Longword; stdcall;//00016B88
    function SetEnhMetaFileBits(p2:PChar):HENHMETAFILE; stdcall;//00016B90
    function SetMapMode(p2:Integer):Integer; stdcall;//00016B98
    function SetPixel(X:Integer; Y:Integer; Color:Longword):Longword; stdcall;//00016BA0
    function SetROP2(p2:Integer):Integer; stdcall;//00016BA8
    function SetStretchBltMode(p2:Integer):Integer; stdcall;//00016BB0
    function SetTextColor(Color:Longword):Longword; stdcall;//00016BB8
    function SetViewportExtEx(XExt:Integer; YExt:Integer; Size:PSize):LongBool; stdcall;//00016BC0
    function SetViewportOrgEx(X:Integer; Y:Integer; Point:PPoint):LongBool; stdcall;//00016BC8
    function SetWinMetaFileBits(p2:PChar; p3:HDC; const p4:tagMETAFILEPICT):HENHMETAFILE; stdcall;//00016BD0
    function SetWindowExtEx(XExt:Integer; YExt:Integer; Size:PSize):LongBool; stdcall;//00016BD8
    function SetWindowOrgEx(X:Integer; Y:Integer; Point:PPoint):LongBool; stdcall;//00016BE0
    function StartDocA(const p2:_DOCINFOA):Integer; stdcall;//00016BE8
    function StartPage:Integer; stdcall;//00016BF0
    function StretchBlt(X:Integer; Y:Integer; Width:Integer; Height:Integer; SrcDC:HDC; XSrc:Integer; YSrc:Integer; SrcWidth:Integer; SrcHeight:Integer; Rop:Longword):LongBool; stdcall;//00016BF8
    function UnrealizeObject:LongBool; stdcall;//00016C00
    function ActivateKeyboardLayout(Flags:Longword):HKL; stdcall;//00016C08
    function AdjustWindowRectEx(dwStyle:Longword; bMenu:LongBool; dwExStyle:Longword):LongBool; stdcall;//00016C10
    function CharLowerA:PAnsiChar; stdcall;//00016C18
    function BeginDeferWindowPos:Longword; stdcall;//00016C20
    function BeginPaint(var lpPaint:tagPAINTSTRUCT):HDC; stdcall;//00016C28
    function CallNextHookEx(nCode:Integer; wParam:Longint; lParam:Longint):Longint; stdcall;//00016C30
    function CallWindowProcA(hWnd:HWND; Msg:Longword; wParam:Longint; lParam:Longint):Longint; stdcall;//00016C38
    function ChangeClipboardChain(hWndNewNext:HWND):LongBool; stdcall;//00016C40
    function CharLowerBuffA(cchLength:Longword):Longword; stdcall;//00016C48
    function CharUpperBuffA(cchLength:Longword):Longword; stdcall;//00016C50
    function CheckMenuItem(uIDCheckItem:Longword; uCheck:Longword):Longword; stdcall;//00016C58
    function ClientToScreen(var lpPoint:TPoint):LongBool; stdcall;//00016C60
    function CloseClipboard:LongBool;//00016C68
    function CreateIcon(nWidth:Integer; nHeight:Integer; cPlanes:Byte; cBitsPixel:Byte; lpbANDbits:Pointer; lpbXORbits:Pointer):HICON; stdcall;//00016C70
    function CreateMenu:HMENU;//00016C78
    function CreatePopupMenu:HMENU;//00016C80
    function CreateWindowExA(lpClassName:PAnsiChar; lpWindowName:PAnsiChar; dwStyle:Longword; X:Integer; Y:Integer; nWidth:Integer; nHeight:Integer; hWndParent:HWND; hMenu:HMENU; hInstance:HINST; lpParam:Pointer):HWND; stdcall;//00016C88
    function DefFrameProcA(hWndMDIClient:HWND; uMsg:Longword; wParam:Longint; lParam:Longint):Longint; stdcall;//00016C90
    function DefMDIChildProcA(uMsg:Longword; wParam:Longint; lParam:Longint):Longint; stdcall;//00016C98
    function DefWindowProcA(Msg:Longword; wParam:Longint; lParam:Longint):Longint; stdcall;//00016CA0
    function DeferWindowPos(hWnd:HWND; hWndInsertAfter:HWND; x:Integer; y:Integer; cx:Integer; cy:Integer; uFlags:Longword):Longword; stdcall;//00016CA8
    function DeleteMenu(uPosition:Longword; uFlags:Longword):LongBool; stdcall;//00016CB0
    function DestroyCursor:LongBool; stdcall;//00016CB8
    function DestroyIcon:LongBool; stdcall;//00016CC0
    function DestroyMenu:LongBool; stdcall;//00016CC8
    function DestroyWindow:LongBool; stdcall;//00016CD0
    function DispatchMessageA:Longint; stdcall;//00016CD8
    function DrawEdge(var qrc:TRect; edge:Longword; grfFlags:Longword):LongBool; stdcall;//00016CE0
    function DrawFocusRect(const lprc:TRect):LongBool; stdcall;//00016CE8
    function DrawFrameControl(const Rect:TRect; uType:Longword; uState:Longword):LongBool; stdcall;//00016CF0
    function DrawIcon(X:Integer; Y:Integer; hIcon:HICON):LongBool; stdcall;//00016CF8
    function DrawMenuBar:LongBool; stdcall;//00016D00
    function DrawTextA(lpString:PAnsiChar; nCount:Integer; var lpRect:TRect; uFormat:Longword):Integer; stdcall;//00016D08
    function EmptyClipboard:LongBool;//00016D10
    function EnableMenuItem(uIDEnableItem:Longword; uEnable:Longword):LongBool; stdcall;//00016D18
    function EnableScrollBar(wSBflags:Longword; wArrows:Longword):LongBool; stdcall;//00016D20
    function EnableWindow(bEnable:LongBool):LongBool; stdcall;//00016D28
    function EndDeferWindowPos:LongBool; stdcall;//00016D30
    function EndPaint(const lpPaint:tagPAINTSTRUCT):LongBool; stdcall;//00016D38
    function EnumClipboardFormats:Longword; stdcall;//00016D40
    function EnumThreadWindows(lpfn:Pointer; lParam:Longint):LongBool; stdcall;//00016D48
    function EnumWindows(lParam:Longint):LongBool; stdcall;//00016D50
    function EqualRect(const lprc2:TRect):LongBool; stdcall;//00016D58
    function FillRect(const lprc:TRect; hbr:HBRUSH):Integer; stdcall;//00016D60
    function FindWindowA(lpWindowName:PAnsiChar):HWND; stdcall;//00016D68
    function FrameRect(const lprc:TRect; hbr:HBRUSH):Integer; stdcall;//00016D70
    function GetActiveWindow:HWND;//00016D78
    function GetCapture:HWND;//00016D80
    function GetClassInfoA(lpClassName:PAnsiChar; var lpWndClass:tagWNDCLASSA):LongBool; stdcall;//00016D88
    function GetClientRect(var lpRect:TRect):LongBool; stdcall;//00016D90
    function GetClipboardData:Longword; stdcall;//00016D98
    function GetClipboardOwner:HWND;//00016DA0
    function GetCursor:HICON;//00016DA8
    function GetCursorPos:LongBool; stdcall;//00016DB0
    function GetDC:HDC; stdcall;//00016DB8
    function GetDCEx(hrgnClip:HRGN; flags:Longword):HDC; stdcall;//00016DC0
    function GetDesktopWindow:HWND;//00016DC8
    function GetDlgItem(nIDDlgItem:Integer):HWND; stdcall;//00016DD0
    function GetDoubleClickTime:Longword;//00016DD8
    function GetFocus:HWND;//00016DE0
    function GetForegroundWindow:HWND;//00016DE8
    function GetIconInfo(var piconinfo:_ICONINFO):LongBool; stdcall;//00016DF0
    function GetKeyNameTextA(lpString:PAnsiChar; nSize:Integer):Integer; stdcall;//00016DF8
    function GetKeyState:Smallint; stdcall;//00016E00
    function GetKeyboardLayout:HKL; stdcall;//00016E08
    function GetKeyboardLayoutList(var List:void ):Longword; stdcall;//00016E10
    function GetKeyboardState:LongBool; stdcall;//00016E18
    function GetLastActivePopup:HWND; stdcall;//00016E20
    function GetMenu:HMENU; stdcall;//00016E28
    function GetMenuItemCount:Integer; stdcall;//00016E30
    function GetMenuItemID(nPos:Integer):Longword; stdcall;//00016E38
    function GetMenuItemInfoA(p2:Longword; p3:LongBool; var p4:tagMENUITEMINFOA):LongBool; stdcall;//00016E40
    function GetMenuState(uId:Longword; uFlags:Longword):Longword; stdcall;//00016E48
    function GetMenuStringA(uIDItem:Longword; lpString:PAnsiChar; nMaxCount:Integer; uFlag:Longword):Integer; stdcall;//00016E50
    function GetMessageTime:Longint;//00016E58
    function GetWindow(uCmd:Longword):HWND; stdcall;//00016E60
    function GetParent:HWND; stdcall;//00016E68
    function GetPropA(lpString:PAnsiChar):Longword; stdcall;//00016E70
    function GetScrollInfo(BarFlag:Integer; var ScrollInfo:tagSCROLLINFO):LongBool; stdcall;//00016E78
    function GetScrollPos(nBar:Integer):Integer; stdcall;//00016E80
    function GetScrollRange(nBar:Integer; var lpMinPos:Integer; var lpMaxPos:Integer):LongBool; stdcall;//00016E88
    function GetSubMenu(nPos:Integer):HMENU; stdcall;//00016E90
    function GetSysColor:Longword; stdcall;//00016E98
    function GetSystemMenu(bRevert:LongBool):HMENU; stdcall;//00016EA0
    function GetSystemMetrics:Integer; stdcall;//00016EA8
    function GetTopWindow:HWND; stdcall;//00016EB0
    function GetWindow(uCmd:Longword):HWND; stdcall;//00016EB8
    function GetWindowDC:HDC; stdcall;//00016EC0
    function GetWindowLongA(nIndex:Integer):Longint; stdcall;//00016EC8
    function GetWindowPlacement(WindowPlacement:PWindowPlacement):LongBool; stdcall;//00016ED0
    function GetWindowRect(var lpRect:TRect):LongBool; stdcall;//00016ED8
    function GetWindowRgn(hRgn:HRGN):LongBool; stdcall;//00016EE0
    function GetWindowTextA(lpString:PAnsiChar; nMaxCount:Integer):Integer; stdcall;//00016EE8
    function GetWindowThreadProcessId(lpdwProcessId:Pointer):Longword; stdcall;//00016EF0
    function InflateRect(dx:Integer; dy:Integer):LongBool; stdcall;//00016EF8
    function InsertMenuA(uPosition:Longword; uFlags:Longword; uIDNewItem:Longword; lpNewItem:PAnsiChar):LongBool; stdcall;//00016F00
    function InsertMenuItemA(p2:Longword; p3:LongBool; const p4:tagMENUITEMINFOA):LongBool; stdcall;//00016F08
    function IntersectRect(const lprcSrc1:TRect; const lprcSrc2:TRect):LongBool; stdcall;//00016F10
    function InvalidateRect(lpRect:PRect; bErase:LongBool):LongBool; stdcall;//00016F18
    function IsCharAlphaA:LongBool; stdcall;//00016F20
    function IsCharAlphaNumericA:LongBool; stdcall;//00016F28
    function IsChild(hWnd:HWND):LongBool; stdcall;//00016F30
    function IsClipboardFormatAvailable:LongBool; stdcall;//00016F38
    function IsDialogMessageA(var lpMsg:tagMSG):LongBool; stdcall;//00016F40
    function IsIconic:LongBool; stdcall;//00016F48
    function IsRectEmpty:LongBool; stdcall;//00016F50
    function IsWindow:LongBool; stdcall;//00016F58
    function IsWindowEnabled:LongBool; stdcall;//00016F60
    function IsWindowVisible:LongBool; stdcall;//00016F68
    function IsZoomed:LongBool; stdcall;//00016F70
    function KillTimer(uIDEvent:Longword):LongBool; stdcall;//00016F78
    function LoadBitmapA(lpBitmapName:PAnsiChar):HBITMAP; stdcall;//00016F80
    function LoadCursorA(lpCursorName:PAnsiChar):HICON; stdcall;//00016F88
    function LoadIconA(lpIconName:PAnsiChar):HICON; stdcall;//00016F90
    function LoadStringA(uID:Longword; lpBuffer:PAnsiChar; nBufferMax:Integer):Integer; stdcall;//00016F98
    function MapVirtualKeyA(uMapType:Longword):Longword; stdcall;//00016FA0
    function MapWindowPoints(hWndTo:HWND; var lpPoints:void ; cPoints:Longword):Integer; stdcall;//00016FA8
    function MessageBeep:LongBool; stdcall;//00016FB0
    function MessageBoxA(lpText:PAnsiChar; lpCaption:PAnsiChar; uType:Longword):Integer; stdcall;//00016FB8
    function OemToCharA(lpszDst:PAnsiChar):LongBool; stdcall;//00016FC0
    function OffsetRect(dx:Integer; dy:Integer):LongBool; stdcall;//00016FC8
    function OpenClipboard:LongBool; stdcall;//00016FD0
    function PeekMessageA(hWnd:HWND; wMsgFilterMin:Longword; wMsgFilterMax:Longword; wRemoveMsg:Longword):LongBool; stdcall;//00016FD8
    function PostMessageA(Msg:Longword; wParam:Longint; lParam:Longint):LongBool; stdcall;//00016FE0
    procedure PostQuitMessage; stdcall;//00016FE8
    function PtInRect(pt:TPoint):LongBool; stdcall;//00016FF0
    function RedrawWindow(lprcUpdate:PRect; hrgnUpdate:HRGN; flags:Longword):LongBool; stdcall;//00016FF8
    function RegisterClassA:Word; stdcall;//00017000
    function RegisterClipboardFormatA:Longword; stdcall;//00017008
    function RegisterWindowMessageA:Longword; stdcall;//00017010
    function ReleaseCapture:LongBool;//00017018
    function ReleaseDC(hDC:HDC):Integer; stdcall;//00017020
    function RemoveMenu(uPosition:Longword; uFlags:Longword):LongBool; stdcall;//00017028
    function RemovePropA(lpString:PAnsiChar):Longword; stdcall;//00017030
    function ScreenToClient(var lpPoint:TPoint):LongBool; stdcall;//00017038
    function ScrollWindow(XAmount:Integer; YAmount:Integer; Rect:PRect; ClipRect:PRect):LongBool; stdcall;//00017040
    function ScrollWindowEx(dx:Integer; dy:Integer; prcScroll:PRect; prcClip:PRect; hrgnUpdate:HRGN; prcUpdate:PRect; flags:Longword):LongBool; stdcall;//00017048
    function SendMessageA(Msg:Longword; wParam:Longint; lParam:Longint):Longint; stdcall;//00017050
    function SetActiveWindow:HWND; stdcall;//00017058
    function SetCapture:HWND; stdcall;//00017060
    function SetClipboardData(hMem:Longword):Longword; stdcall;//00017068
    function SetClipboardViewer:HWND; stdcall;//00017070
    function SetCursor:HICON; stdcall;//00017078
    function SetFocus:HWND; stdcall;//00017080
    function SetForegroundWindow:LongBool; stdcall;//00017088
    function SetKeyboardState:LongBool; stdcall;//00017090
    function SetMenu(hMenu:HMENU):LongBool; stdcall;//00017098
    function SetMenuItemInfoA(p2:Longword; p3:LongBool; const p4:tagMENUITEMINFOA):LongBool; stdcall;//000170A0
    function SetPropA(lpString:PAnsiChar; hData:Longword):LongBool; stdcall;//000170A8
    function SetRect(xLeft:Integer; yTop:Integer; xRight:Integer; yBottom:Integer):LongBool; stdcall;//000170B0
    function SetScrollInfo(BarFlag:Integer; const ScrollInfo:tagSCROLLINFO; Redraw:LongBool):Integer; stdcall;//000170B8
    function SetScrollPos(nBar:Integer; nPos:Integer; bRedraw:LongBool):Integer; stdcall;//000170C0
    function SetScrollRange(nBar:Integer; nMinPos:Integer; nMaxPos:Integer; bRedraw:LongBool):LongBool; stdcall;//000170C8
    function SetTimer(nIDEvent:Longword; uElapse:Longword; lpTimerFunc:Pointer):Longword; stdcall;//000170D0
    function SetWindowLongA(nIndex:Integer; dwNewLong:Longint):Longint; stdcall;//000170D8
    function SetWindowPlacement(WindowPlacement:PWindowPlacement):LongBool; stdcall;//000170E0
    function SetWindowPos(hWndInsertAfter:HWND; X:Integer; Y:Integer; cx:Integer; cy:Integer; uFlags:Longword):LongBool; stdcall;//000170E8
    function SetWindowTextA(lpString:PAnsiChar):LongBool; stdcall;//000170F0
    function SetWindowsHookExA(lpfn:TFNHookProc; hmod:HINST; dwThreadId:Longword):HHOOK; stdcall;//000170F8
    function SetWindowRgn(hRgn:HRGN; bRedraw:LongBool):LongBool; stdcall;//00017100
    function ShowCursor:Integer; stdcall;//00017108
    function ShowOwnedPopups(fShow:LongBool):LongBool; stdcall;//00017110
    function ShowScrollBar(wBar:Integer; bShow:LongBool):LongBool; stdcall;//00017118
    function ShowWindow(nCmdShow:Integer):LongBool; stdcall;//00017120
    function SystemParametersInfoA(uiParam:Longword; pvParam:Pointer; fWinIni:Longword):LongBool; stdcall;//00017128
    function TrackPopupMenu(uFlags:Longword; x:Integer; y:Integer; nReserved:Integer; hWnd:HWND; prcRect:PRect):LongBool; stdcall;//00017130
    function TranslateMDISysAccel(const lpMsg:tagMSG):LongBool; stdcall;//00017138
    function TranslateMessage:LongBool; stdcall;//00017140
    function UnhookWindowsHookEx:LongBool; stdcall;//00017148
    function UnionRect(const lprcSrc1:TRect; const lprcSrc2:TRect):LongBool; stdcall;//00017150
    function UnregisterClassA(hInstance:HINST):LongBool; stdcall;//00017158
    function UpdateWindow:LongBool; stdcall;//00017160
    function ValidateRect(lpRect:PRect):LongBool; stdcall;//00017168
    function WaitMessage:LongBool;//00017170
    function WinHelpA(lpszHelp:PAnsiChar; uCommand:Longword; dwData:Longword):LongBool; stdcall;//00017178
    function WindowFromPoint:HWND; stdcall;//00017180
    function MakeLong(a:Word; b:Word):Longint;//00017188
    //function sub_00017194(?:?):?;//00017194
    function HiByte(W:Word):Byte;//00017198
    function GetCurrentTime:Longint;//000171A0
    function UnlockResource(hResData:Longword):LongBool;//000171A8
    function GlobalAllocPtr(Flags:Integer; Bytes:Longint):Pointer;//000171AC
    function GlobalReAllocPtr(P:Pointer; Bytes:Longint; Flags:Integer):Pointer;//000171BC
    function GlobalFreePtr(P:Pointer):Longword;//000171D8
    function MakeROP4(fore:Longword; back:Longword):Longword;//000171EC
    function SmallPointToPoint(const P:TSmallPoint):TPoint;//000171F8
    function PointToSmallPoint(const P:TPoint):TSmallPoint;//0001720C
    procedure sub_00017224;//00017224
    function CreateWindow(lpClassName:PChar; lpWindowName:PChar; dwStyle:Longword; X:Integer; Y:Integer; nWidth:Integer; nHeight:Integer; hWndParent:HWND; hMenu:HMENU; hInstance:HINST; lpParam:Pointer):HWND;//0001722C
    function HwndMSWheel(var puiMsh_MsgMouseWheel:Longword; var puiMsh_Msg3DSupport:Longword; var puiMsh_MsgScrollLines:Longword; var pf3DSupport:LongBool; var piScrollLines:Integer):HWND;//00017260

implementation

//000166B0
function advapi32.RegCloseKey:Integer; stdcall;
begin
{*
 000166B0    jmp         dword ptr ds:[0B827C]
*}
end;

//000166B8
function advapi32.RegCreateKeyExA(lpSubKey:PAnsiChar; Reserved:Longword; lpClass:PAnsiChar; dwOptions:Longword; samDesired:Longword; lpSecurityAttributes:PSecurityAttributes; var phkResult:HKEY; lpdwDisposition:PDWORD):Longint; stdcall;
begin
{*
 000166B8    jmp         dword ptr ds:[0B8278]
*}
end;

//000166C0
function advapi32.RegFlushKey:Longint; stdcall;
begin
{*
 000166C0    jmp         dword ptr ds:[0B8274]
*}
end;

//000166C8
function advapi32.RegOpenKeyExA(lpSubKey:PAnsiChar; ulOptions:Longword; samDesired:Longword; var phkResult:HKEY):Longint; stdcall;
begin
{*
 000166C8    jmp         dword ptr ds:[0B8270]
*}
end;

//000166D0
function advapi32.RegQueryValueA(lpSubKey:PAnsiChar; lpValue:PAnsiChar; var lpcbValue:Longint):Longint; stdcall;
begin
{*
 000166D0    jmp         dword ptr ds:[0B826C]
*}
end;

//000166D8
function advapi32.RegQueryValueExA(lpValueName:PAnsiChar; lpReserved:Pointer; lpType:PDWORD; lpData:PByte; lpcbData:PDWORD):Longint; stdcall;
begin
{*
 000166D8    jmp         dword ptr ds:[0B8268]
*}
end;

//000166E0
function kernel32.CloseHandle:LongBool; stdcall;
begin
{*
 000166E0    jmp         dword ptr ds:[0B83A4]
*}
end;

//000166E8
function kernel32.CompareStringA(dwCmpFlags:Longword; lpString1:PAnsiChar; cchCount1:Integer; lpString2:PAnsiChar; cchCount2:Integer):Integer; stdcall;
begin
{*
 000166E8    jmp         dword ptr ds:[0B83A0]
*}
end;

//000166F0
function kernel32.CreateEventA(bManualReset:LongBool; bInitialState:LongBool; lpName:PAnsiChar):Longword; stdcall;
begin
{*
 000166F0    jmp         dword ptr ds:[0B839C]
*}
end;

//000166F8
function kernel32.CreateFileA(dwDesiredAccess:Longword; dwShareMode:Longword; lpSecurityAttributes:PSecurityAttributes; dwCreationDisposition:Longword; dwFlagsAndAttributes:Longword; hTemplateFile:Longword):Longword; stdcall;
begin
{*
 000166F8    jmp         dword ptr ds:[0B8398]
*}
end;

//00016700
function kernel32.CreateThread(StackSize:Cardinal; ThreadFunc:TThreadFunc; Parameter:Pointer; CreationFlags:Cardinal; var ThreadId:Cardinal):Integer; stdcall;
begin
{*
 00016700    jmp         dword ptr ds:[0B8394]
*}
end;

//00016708
procedure kernel32.DeleteCriticalSection; stdcall;
begin
{*
 00016708    jmp         dword ptr ds:[0B8390]
*}
end;

//00016710
function kernel32.DeleteFileA:LongBool; stdcall;
begin
{*
 00016710    jmp         dword ptr ds:[0B838C]
*}
end;

//00016718
function kernel32.DosDateTimeToFileTime(wFatTime:Word; var lpFileTime:_FILETIME):LongBool; stdcall;
begin
{*
 00016718    jmp         dword ptr ds:[0B8388]
*}
end;

//00016720
procedure kernel32.EnterCriticalSection; stdcall;
begin
{*
 00016720    jmp         dword ptr ds:[0B8384]
*}
end;

//00016728
function kernel32.EnumCalendarInfoA(Locale:Longword; Calendar:Longword; CalType:Longword):LongBool; stdcall;
begin
{*
 00016728    jmp         dword ptr ds:[0B8380]
*}
end;

//00016730
function kernel32.FileTimeToDosDateTime(var lpFatDate:Word; var lpFatTime:Word):LongBool; stdcall;
begin
{*
 00016730    jmp         dword ptr ds:[0B837C]
*}
end;

//00016738
function kernel32.FileTimeToLocalFileTime(var lpLocalFileTime:_FILETIME):LongBool; stdcall;
begin
{*
 00016738    jmp         dword ptr ds:[0B8378]
*}
end;

//00016740
procedure kernel32.FindClose;
begin
{*
 00016740    jmp         dword ptr ds:[0B8374]
*}
end;

//00016748
function kernel32.FindFirstFileA(var lpFindFileData:_WIN32_FIND_DATAA):Longword; stdcall;
begin
{*
 00016748    jmp         dword ptr ds:[0B8370]
*}
end;

//00016750
function kernel32.FindNextFileA(var lpFindFileData:_WIN32_FIND_DATAA):LongBool; stdcall;
begin
{*
 00016750    jmp         dword ptr ds:[0B836C]
*}
end;

//00016758
function kernel32.FindResourceA(lpName:PAnsiChar; lpType:PAnsiChar):HRSRC; stdcall;
begin
{*
 00016758    jmp         dword ptr ds:[0B8368]
*}
end;

//00016760
function kernel32.FormatMessageA(lpSource:Pointer; dwMessageId:Longword; dwLanguageId:Longword; lpBuffer:PAnsiChar; nSize:Longword; Arguments:Pointer):Longword; stdcall;
begin
{*
 00016760    jmp         dword ptr ds:[0B8364]
*}
end;

//00016768
function kernel32.FreeLibrary:LongBool; stdcall;
begin
{*
 00016768    jmp         dword ptr ds:[0B8360]
*}
end;

//00016770
function kernel32.FreeResource:LongBool; stdcall;
begin
{*
 00016770    jmp         dword ptr ds:[0B835C]
*}
end;

//00016778
function kernel32.GetCPInfo(var lpCPInfo:_cpinfo):LongBool; stdcall;
begin
{*
 00016778    jmp         dword ptr ds:[0B8358]
*}
end;

//00016780
function kernel32.GetCurrentProcessId:Longword;
begin
{*
 00016780    jmp         dword ptr ds:[0B8354]
*}
end;

//00016788
function kernel32.GetCurrentThreadId:Longword;
begin
{*
 00016788    jmp         dword ptr ds:[0B8350]
*}
end;

//00016790
function kernel32.GetDateFormatA(dwFlags:Longword; lpDate:PSystemTime; lpFormat:PAnsiChar; lpDateStr:PAnsiChar; cchDate:Integer):Integer; stdcall;
begin
{*
 00016790    jmp         dword ptr ds:[0B834C]
*}
end;

//00016798
function kernel32.GetDiskFreeSpaceA(var lpSectorsPerCluster:Longword; var lpBytesPerSector:Longword; var lpNumberOfFreeClusters:Longword; var lpTotalNumberOfClusters:Longword):LongBool; stdcall;
begin
{*
 00016798    jmp         dword ptr ds:[0B8348]
*}
end;

//000167A0
function kernel32.GetFileAttributesA:Longword; stdcall;
begin
{*
 000167A0    jmp         dword ptr ds:[0B8344]
*}
end;

//000167A8
function kernel32.GetFullPathNameA(nBufferLength:Longword; lpBuffer:PAnsiChar; var lpFilePart:PAnsiChar):Longword; stdcall;
begin
{*
 000167A8    jmp         dword ptr ds:[0B8340]
*}
end;

//000167B0
function kernel32.GetLastError:Integer;
begin
{*
 000167B0    jmp         dword ptr ds:[0B833C]
*}
end;

//000167B8
procedure kernel32.GetLocalTime; stdcall;
begin
{*
 000167B8    jmp         dword ptr ds:[0B8338]
*}
end;

//000167C0
function kernel32.GetLocaleInfoA(LCType:Longword; lpLCData:PAnsiChar; cchData:Integer):Integer; stdcall;
begin
{*
 000167C0    jmp         dword ptr ds:[0B8334]
*}
end;

//000167C8
function kernel32.GetModuleFileNameA(lpFilename:PAnsiChar; nSize:Longword):Longword; stdcall;
begin
{*
 000167C8    jmp         dword ptr ds:[0B8330]
*}
end;

//000167D0
function kernel32.GetModuleHandleA:HINST; stdcall;
begin
{*
 000167D0    jmp         dword ptr ds:[0B832C]
*}
end;

//000167D8
function kernel32.GetPrivateProfileStringA(lpKeyName:PAnsiChar; lpDefault:PAnsiChar; lpReturnedString:PAnsiChar; nSize:Longword; lpFileName:PAnsiChar):Longword; stdcall;
begin
{*
 000167D8    jmp         dword ptr ds:[0B8328]
*}
end;

//000167E0
function kernel32.GetProcAddress(lpProcName:PAnsiChar):Pointer; stdcall;
begin
{*
 000167E0    jmp         dword ptr ds:[0B8324]
*}
end;

//000167E8
function kernel32.GetProfileStringA(lpKeyName:PAnsiChar; lpDefault:PAnsiChar; lpReturnedString:PAnsiChar; nSize:Longword):Longword; stdcall;
begin
{*
 000167E8    jmp         dword ptr ds:[0B8320]
*}
end;

//000167F0
procedure kernel32.GetSystemInfo; stdcall;
begin
{*
 000167F0    jmp         dword ptr ds:[0B831C]
*}
end;

//000167F8
function kernel32.GetThreadLocale:Integer;
begin
{*
 000167F8    jmp         dword ptr ds:[0B8318]
*}
end;

//00016800
function kernel32.GetTickCount:Cardinal;
begin
{*
 00016800    jmp         dword ptr ds:[0B8314]
*}
end;

//00016808
function kernel32.GetVersion:Longword;
begin
{*
 00016808    jmp         dword ptr ds:[0B8310]
*}
end;

//00016810
function kernel32.GetVersionExA:LongBool; stdcall;
begin
{*
 00016810    jmp         dword ptr ds:[0B830C]
*}
end;

//00016818
function kernel32.GlobalAddAtomA:Word; stdcall;
begin
{*
 00016818    jmp         dword ptr ds:[0B8308]
*}
end;

//00016820
function kernel32.GlobalAlloc(dwBytes:Longword):Longword; stdcall;
begin
{*
 00016820    jmp         dword ptr ds:[0B8304]
*}
end;

//00016828
function kernel32.GlobalDeleteAtom:Word; stdcall;
begin
{*
 00016828    jmp         dword ptr ds:[0B8300]
*}
end;

//00016830
function kernel32.GlobalFree:Longword; stdcall;
begin
{*
 00016830    jmp         dword ptr ds:[0B82FC]
*}
end;

//00016838
function kernel32.GlobalLock:Pointer; stdcall;
begin
{*
 00016838    jmp         dword ptr ds:[0B82F8]
*}
end;

//00016840
function kernel32.GlobalHandle:Longword; stdcall;
begin
{*
 00016840    jmp         dword ptr ds:[0B82F4]
*}
end;

//00016848
function kernel32.GlobalReAlloc(dwBytes:Longword; uFlags:Longword):Longword; stdcall;
begin
{*
 00016848    jmp         dword ptr ds:[0B82F0]
*}
end;

//00016850
function kernel32.GlobalSize:Longword; stdcall;
begin
{*
 00016850    jmp         dword ptr ds:[0B82EC]
*}
end;

//00016858
function kernel32.GlobalUnlock:LongBool; stdcall;
begin
{*
 00016858    jmp         dword ptr ds:[0B82E8]
*}
end;

//00016860
procedure kernel32.InitializeCriticalSection; stdcall;
begin
{*
 00016860    jmp         dword ptr ds:[0B82E4]
*}
end;

//00016868
procedure kernel32.LeaveCriticalSection; stdcall;
begin
{*
 00016868    jmp         dword ptr ds:[0B82E0]
*}
end;

//00016870
function kernel32.LoadLibraryA:HINST; stdcall;
begin
{*
 00016870    jmp         dword ptr ds:[0B82DC]
*}
end;

//00016878
function kernel32.LoadResource(hResInfo:HRSRC):Longword; stdcall;
begin
{*
 00016878    jmp         dword ptr ds:[0B82D8]
*}
end;

//00016880
function kernel32.LocalFileTimeToFileTime(var lpFileTime:_FILETIME):LongBool; stdcall;
begin
{*
 00016880    jmp         dword ptr ds:[0B82D4]
*}
end;

//00016888
function kernel32.LockResource:Pointer; stdcall;
begin
{*
 00016888    jmp         dword ptr ds:[0B82D0]
*}
end;

//00016890
function kernel32.MulDiv(nNumerator:Integer; nDenominator:Integer):Integer; stdcall;
begin
{*
 00016890    jmp         dword ptr ds:[0B82CC]
*}
end;

//00016898
function kernel32.MultiByteToWideChar(Flags:Integer; MBStr:PAnsiChar; MBCount:Integer; WCStr:PWideChar; WCCount:Integer):Integer; stdcall;
begin
{*
 00016898    jmp         dword ptr ds:[0B82C8]
*}
end;

//000168A0
function kernel32.ReadFile(var Buffer:void ; nNumberOfBytesToRead:Longword; var lpNumberOfBytesRead:Longword; lpOverlapped:POverlapped):LongBool; stdcall;
begin
{*
 000168A0    jmp         dword ptr ds:[0B82C4]
*}
end;

//000168A8
function kernel32.SetEndOfFile:LongBool; stdcall;
begin
{*
 000168A8    jmp         dword ptr ds:[0B82C0]
*}
end;

//000168B0
function kernel32.SetErrorMode:Longword; stdcall;
begin
{*
 000168B0    jmp         dword ptr ds:[0B82BC]
*}
end;

//000168B8
function kernel32.SetEvent:LongBool; stdcall;
begin
{*
 000168B8    jmp         dword ptr ds:[0B82B8]
*}
end;

//000168C0
function kernel32.SetFilePointer(lDistanceToMove:Longint; lpDistanceToMoveHigh:Pointer; dwMoveMethod:Longword):Longword; stdcall;
begin
{*
 000168C0    jmp         dword ptr ds:[0B82B4]
*}
end;

//000168C8
function kernel32.SetFileTime(lpCreationTime:PFileTime; lpLastAccessTime:PFileTime; lpLastWriteTime:PFileTime):LongBool; stdcall;
begin
{*
 000168C8    jmp         dword ptr ds:[0B82B0]
*}
end;

//000168D0
function kernel32.SetThreadLocale:LongBool; stdcall;
begin
{*
 000168D0    jmp         dword ptr ds:[0B82AC]
*}
end;

//000168D8
function kernel32.SizeofResource(hResInfo:HRSRC):Longword; stdcall;
begin
{*
 000168D8    jmp         dword ptr ds:[0B82A8]
*}
end;

//000168E0
procedure kernel32.Sleep;
begin
{*
 000168E0    jmp         dword ptr ds:[0B82A4]
*}
end;

//000168E8
function kernel32.VirtualAlloc(dwSize:Integer; flAllocationType:Integer; flProtect:Integer):Pointer; stdcall;
begin
{*
 000168E8    jmp         dword ptr ds:[0B82A0]
*}
end;

//000168F0
function kernel32.VirtualQuery(var lpBuffer:TMemInfo; dwLength:Integer):Integer; stdcall;
begin
{*
 000168F0    jmp         dword ptr ds:[0B829C]
*}
end;

//000168F8
function kernel32.WaitForSingleObject(dwMilliseconds:Longword):Longword; stdcall;
begin
{*
 000168F8    jmp         dword ptr ds:[0B8298]
*}
end;

//00016900
function kernel32.WinExec(uCmdShow:Longword):Longword; stdcall;
begin
{*
 00016900    jmp         dword ptr ds:[0B8294]
*}
end;

//00016908
function kernel32.WriteFile(const Buffer:void ; nNumberOfBytesToWrite:Longword; var lpNumberOfBytesWritten:Longword; lpOverlapped:POverlapped):LongBool; stdcall;
begin
{*
 00016908    jmp         dword ptr ds:[0B8290]
*}
end;

//00016910
function kernel32.WritePrivateProfileStringA(lpKeyName:PAnsiChar; lpString:PAnsiChar; lpFileName:PAnsiChar):LongBool; stdcall;
begin
{*
 00016910    jmp         dword ptr ds:[0B828C]
*}
end;

//00016918
function kernel32.lstrcmpA(lpString2:PAnsiChar):Integer; stdcall;
begin
{*
 00016918    jmp         dword ptr ds:[0B8288]
*}
end;

//00016920
function kernel32.lstrcpyA(lpString2:PAnsiChar):PAnsiChar; stdcall;
begin
{*
 00016920    jmp         dword ptr ds:[0B8284]
*}
end;

//00016928
function mpr.WNetGetConnectionA(lpRemoteName:PAnsiChar; var lpnLength:Longword):Longword; stdcall;
begin
{*
 00016928    jmp         dword ptr ds:[0B83AC]
*}
end;

//00016930
function version.GetFileVersionInfoA(dwHandle:Longword; dwLen:Longword; lpData:Pointer):LongBool; stdcall;
begin
{*
 00016930    jmp         dword ptr ds:[0B83BC]
*}
end;

//00016938
function version.GetFileVersionInfoSizeA(var lpdwHandle:Longword):Longword; stdcall;
begin
{*
 00016938    jmp         dword ptr ds:[0B83B8]
*}
end;

//00016940
function version.VerQueryValueA(lpSubBlock:PAnsiChar; var lplpBuffer:Pointer; var puLen:Longword):LongBool; stdcall;
begin
{*
 00016940    jmp         dword ptr ds:[0B83B4]
*}
end;

//00016948
function gdi32.AbortDoc:Integer; stdcall;
begin
{*
 00016948    jmp         dword ptr ds:[0B8520]
*}
end;

//00016950
function gdi32.BitBlt(X:Integer; Y:Integer; Width:Integer; Height:Integer; SrcDC:HDC; XSrc:Integer; YSrc:Integer; Rop:Longword):LongBool; stdcall;
begin
{*
 00016950    jmp         dword ptr ds:[0B851C]
*}
end;

//00016958
function gdi32.CloseEnhMetaFile:HENHMETAFILE; stdcall;
begin
{*
 00016958    jmp         dword ptr ds:[0B8518]
*}
end;

//00016960
function gdi32.CopyEnhMetaFileA(p2:PAnsiChar):HENHMETAFILE; stdcall;
begin
{*
 00016960    jmp         dword ptr ds:[0B8514]
*}
end;

//00016968
function gdi32.CreateBitmap(Height:Integer; Planes:Longint; BitCount:Longint; Bits:Pointer):HBITMAP; stdcall;
begin
{*
 00016968    jmp         dword ptr ds:[0B8510]
*}
end;

//00016970
function gdi32.CreateBrushIndirect:HBRUSH; stdcall;
begin
{*
 00016970    jmp         dword ptr ds:[0B850C]
*}
end;

//00016978
function gdi32.CreateCompatibleBitmap(Width:Integer; Height:Integer):HBITMAP; stdcall;
begin
{*
 00016978    jmp         dword ptr ds:[0B8508]
*}
end;

//00016980
function gdi32.CreateCompatibleDC:HDC; stdcall;
begin
{*
 00016980    jmp         dword ptr ds:[0B8504]
*}
end;

//00016988
function gdi32.CreateDCA(lpszDevice:PAnsiChar; lpszOutput:PAnsiChar; lpdvmInit:PDeviceModeA):HDC; stdcall;
begin
{*
 00016988    jmp         dword ptr ds:[0B8500]
*}
end;

//00016990
function gdi32.CreateDIBSection(const p2:tagBITMAPINFO; p3:Longword; var p4:Pointer; p5:Longword; p6:Longword):HBITMAP; stdcall;
begin
{*
 00016990    jmp         dword ptr ds:[0B84FC]
*}
end;

//00016998
function gdi32.CreateDIBitmap(var InfoHeader:tagBITMAPINFOHEADER; dwUsage:Longword; InitBits:PChar; var InitInfo:tagBITMAPINFO; wUsage:Longword):HBITMAP; stdcall;
begin
{*
 00016998    jmp         dword ptr ds:[0B84F8]
*}
end;

//000169A0
function gdi32.CreateEnhMetaFileA(p2:PAnsiChar; p3:PRect; p4:PAnsiChar):HDC; stdcall;
begin
{*
 000169A0    jmp         dword ptr ds:[0B84F4]
*}
end;

//000169A8
function gdi32.CreateFontIndirectA:HFONT; stdcall;
begin
{*
 000169A8    jmp         dword ptr ds:[0B84F0]
*}
end;

//000169B0
function gdi32.CreateHalftonePalette:HPALETTE; stdcall;
begin
{*
 000169B0    jmp         dword ptr ds:[0B84EC]
*}
end;

//000169B8
function gdi32.CreateICA(lpszDevice:PAnsiChar; lpszOutput:PAnsiChar; lpdvmInit:PDeviceModeA):HDC; stdcall;
begin
{*
 000169B8    jmp         dword ptr ds:[0B84E8]
*}
end;

//000169C0
function gdi32.CreatePalette:HPALETTE; stdcall;
begin
{*
 000169C0    jmp         dword ptr ds:[0B84E4]
*}
end;

//000169C8
function gdi32.CreatePenIndirect:HPEN; stdcall;
begin
{*
 000169C8    jmp         dword ptr ds:[0B84E0]
*}
end;

//000169D0
function gdi32.CreateRectRgn(p2:Integer; p3:Integer; p4:Integer):HRGN; stdcall;
begin
{*
 000169D0    jmp         dword ptr ds:[0B84DC]
*}
end;

//000169D8
function gdi32.CreateSolidBrush:HBRUSH; stdcall;
begin
{*
 000169D8    jmp         dword ptr ds:[0B84D8]
*}
end;

//000169E0
function gdi32.DeleteDC:LongBool; stdcall;
begin
{*
 000169E0    jmp         dword ptr ds:[0B84D4]
*}
end;

//000169E8
function gdi32.DeleteEnhMetaFile:LongBool; stdcall;
begin
{*
 000169E8    jmp         dword ptr ds:[0B84D0]
*}
end;

//000169F0
function gdi32.DeleteObject:LongBool; stdcall;
begin
{*
 000169F0    jmp         dword ptr ds:[0B84CC]
*}
end;

//000169F8
function gdi32.Ellipse(X1:Integer; Y1:Integer; X2:Integer; Y2:Integer):LongBool; stdcall;
begin
{*
 000169F8    jmp         dword ptr ds:[0B84C8]
*}
end;

//00016A00
function gdi32.EndDoc:Integer; stdcall;
begin
{*
 00016A00    jmp         dword ptr ds:[0B84C4]
*}
end;

//00016A08
function gdi32.EndPage:Integer; stdcall;
begin
{*
 00016A08    jmp         dword ptr ds:[0B84C0]
*}
end;

//00016A10
function gdi32.EnumFontFamiliesExA(var p2:tagLOGFONTA; p3:Pointer; p4:Longint; p5:Longword):LongBool; stdcall;
begin
{*
 00016A10    jmp         dword ptr ds:[0B84BC]
*}
end;

//00016A18
function gdi32.EnumFontsA(lpszFace:PAnsiChar; fntenmprc:Pointer; lpszData:PChar):Integer; stdcall;
begin
{*
 00016A18    jmp         dword ptr ds:[0B84B8]
*}
end;

//00016A20
function gdi32.Escape(p2:Integer; p3:Integer; p4:PAnsiChar; p5:Pointer):Integer; stdcall;
begin
{*
 00016A20    jmp         dword ptr ds:[0B84B4]
*}
end;

//00016A28
function gdi32.ExcludeClipRect(p2:Integer; p3:Integer; p4:Integer; p5:Integer):Integer; stdcall;
begin
{*
 00016A28    jmp         dword ptr ds:[0B84B0]
*}
end;

//00016A30
function gdi32.ExtCreatePen(Width:Longword; const Brush:tagLOGBRUSH; StyleCount:Longword; Style:Pointer):HPEN; stdcall;
begin
{*
 00016A30    jmp         dword ptr ds:[0B84AC]
*}
end;

//00016A38
function gdi32.ExtTextOutA(X:Integer; Y:Integer; Options:Longint; Rect:PRect; Str:PAnsiChar; Count:Longint; Dx:PInteger):LongBool; stdcall;
begin
{*
 00016A38    jmp         dword ptr ds:[0B84A8]
*}
end;

//00016A40
function gdi32.GetBitmapBits(Count:Longint; Bits:Pointer):Longint; stdcall;
begin
{*
 00016A40    jmp         dword ptr ds:[0B84A4]
*}
end;

//00016A48
function gdi32.GetBrushOrgEx(var p2:TPoint):LongBool; stdcall;
begin
{*
 00016A48    jmp         dword ptr ds:[0B84A0]
*}
end;

//00016A50
function gdi32.GetClipBox(var Rect:TRect):Integer; stdcall;
begin
{*
 00016A50    jmp         dword ptr ds:[0B849C]
*}
end;

//00016A58
function gdi32.GetCurrentPositionEx(Point:PPoint):LongBool; stdcall;
begin
{*
 00016A58    jmp         dword ptr ds:[0B8498]
*}
end;

//00016A60
function gdi32.GetDCOrgEx(var Origin:TPoint):LongBool; stdcall;
begin
{*
 00016A60    jmp         dword ptr ds:[0B8494]
*}
end;

//00016A68
function gdi32.GetDIBColorTable(p2:Longword; p3:Longword; var RGBQuadStructs:void ):Longword; stdcall;
begin
{*
 00016A68    jmp         dword ptr ds:[0B8490]
*}
end;

//00016A70
function gdi32.GetDIBits(Bitmap:HBITMAP; StartScan:Longword; NumScans:Longword; Bits:Pointer; var BitInfo:tagBITMAPINFO; Usage:Longword):Integer; stdcall;
begin
{*
 00016A70    jmp         dword ptr ds:[0B848C]
*}
end;

//00016A78
function gdi32.GetDeviceCaps(Index:Integer):Integer; stdcall;
begin
{*
 00016A78    jmp         dword ptr ds:[0B8488]
*}
end;

//00016A80
function gdi32.GetEnhMetaFileBits(p2:Longword; p3:PByte):Longword; stdcall;
begin
{*
 00016A80    jmp         dword ptr ds:[0B8484]
*}
end;

//00016A88
function gdi32.GetEnhMetaFileDescriptionA(p2:Longword; p3:PAnsiChar):Longword; stdcall;
begin
{*
 00016A88    jmp         dword ptr ds:[0B8480]
*}
end;

//00016A90
function gdi32.GetEnhMetaFileHeader(p2:Longword; p3:PEnhMetaHeader):Longword; stdcall;
begin
{*
 00016A90    jmp         dword ptr ds:[0B847C]
*}
end;

//00016A98
function gdi32.GetEnhMetaFilePaletteEntries(p2:Longword; p3:Pointer):Longword; stdcall;
begin
{*
 00016A98    jmp         dword ptr ds:[0B8478]
*}
end;

//00016AA0
function gdi32.GetObjectA(p2:Integer; p3:Pointer):Integer; stdcall;
begin
{*
 00016AA0    jmp         dword ptr ds:[0B8474]
*}
end;

//00016AA8
function gdi32.GetPaletteEntries(StartIndex:Longword; NumEntries:Longword; var PaletteEntries:void ):Longword; stdcall;
begin
{*
 00016AA8    jmp         dword ptr ds:[0B8470]
*}
end;

//00016AB0
function gdi32.GetPixel(X:Integer; Y:Integer):Longword; stdcall;
begin
{*
 00016AB0    jmp         dword ptr ds:[0B846C]
*}
end;

//00016AB8
function gdi32.GetStockObject:HGDIOBJ; stdcall;
begin
{*
 00016AB8    jmp         dword ptr ds:[0B8468]
*}
end;

//00016AC0
function gdi32.GetSystemPaletteEntries(StartIndex:Longword; NumEntries:Longword; var PaletteEntries:void ):Longword; stdcall;
begin
{*
 00016AC0    jmp         dword ptr ds:[0B8464]
*}
end;

//00016AC8
function gdi32.GetTextExtentPointA(Str:PAnsiChar; Count:Integer; var Size:tagSIZE):LongBool; stdcall;
begin
{*
 00016AC8    jmp         dword ptr ds:[0B8460]
*}
end;

//00016AD0
function gdi32.GetTextMetricsA(var TM:tagTEXTMETRICA):LongBool; stdcall;
begin
{*
 00016AD0    jmp         dword ptr ds:[0B845C]
*}
end;

//00016AD8
function gdi32.GetWinMetaFileBits(p2:Longword; p3:PByte; p4:Integer; p5:HDC):Longword; stdcall;
begin
{*
 00016AD8    jmp         dword ptr ds:[0B8458]
*}
end;

//00016AE0
function gdi32.GetWindowOrgEx(var Point:TPoint):LongBool; stdcall;
begin
{*
 00016AE0    jmp         dword ptr ds:[0B8454]
*}
end;

//00016AE8
function gdi32.IntersectClipRect(X1:Integer; Y1:Integer; X2:Integer; Y2:Integer):Integer; stdcall;
begin
{*
 00016AE8    jmp         dword ptr ds:[0B8450]
*}
end;

//00016AF0
function gdi32.LineTo(X:Integer; Y:Integer):LongBool; stdcall;
begin
{*
 00016AF0    jmp         dword ptr ds:[0B844C]
*}
end;

//00016AF8
function gdi32.MaskBlt(p2:Integer; p3:Integer; p4:Integer; p5:Integer; p6:HDC; p7:Integer; p8:Integer; p9:HBITMAP; p10:Integer; p11:Integer; p12:Longword):LongBool; stdcall;
begin
{*
 00016AF8    jmp         dword ptr ds:[0B8448]
*}
end;

//00016B00
function gdi32.MoveToEx(p2:Integer; p3:Integer; p4:PPoint):LongBool; stdcall;
begin
{*
 00016B00    jmp         dword ptr ds:[0B8444]
*}
end;

//00016B08
function gdi32.PatBlt(X:Integer; Y:Integer; Width:Integer; Height:Integer; Rop:Longword):LongBool; stdcall;
begin
{*
 00016B08    jmp         dword ptr ds:[0B8440]
*}
end;

//00016B10
function gdi32.Pie(X1:Integer; Y1:Integer; X2:Integer; Y2:Integer; X3:Integer; Y3:Integer; X4:Integer; Y4:Integer):LongBool; stdcall;
begin
{*
 00016B10    jmp         dword ptr ds:[0B843C]
*}
end;

//00016B18
function gdi32.PlayEnhMetaFile(p2:HENHMETAFILE; const p3:TRect):LongBool; stdcall;
begin
{*
 00016B18    jmp         dword ptr ds:[0B8438]
*}
end;

//00016B20
function gdi32.PolyPolyline(const PointStructs:void ; const Points:void ; p4:Longword):LongBool; stdcall;
begin
{*
 00016B20    jmp         dword ptr ds:[0B8434]
*}
end;

//00016B28
function gdi32.Polyline(var Points:void ; Count:Integer):LongBool; stdcall;
begin
{*
 00016B28    jmp         dword ptr ds:[0B8430]
*}
end;

//00016B30
function gdi32.RealizePalette:Longword; stdcall;
begin
{*
 00016B30    jmp         dword ptr ds:[0B842C]
*}
end;

//00016B38
function gdi32.RectVisible(const Rect:TRect):LongBool; stdcall;
begin
{*
 00016B38    jmp         dword ptr ds:[0B8428]
*}
end;

//00016B40
function gdi32.Rectangle(X1:Integer; Y1:Integer; X2:Integer; Y2:Integer):LongBool; stdcall;
begin
{*
 00016B40    jmp         dword ptr ds:[0B8424]
*}
end;

//00016B48
function gdi32.RestoreDC(SavedDC:Integer):LongBool; stdcall;
begin
{*
 00016B48    jmp         dword ptr ds:[0B8420]
*}
end;

//00016B50
function gdi32.SaveDC:Integer; stdcall;
begin
{*
 00016B50    jmp         dword ptr ds:[0B841C]
*}
end;

//00016B58
function gdi32.SelectObject(p2:HGDIOBJ):HGDIOBJ; stdcall;
begin
{*
 00016B58    jmp         dword ptr ds:[0B8418]
*}
end;

//00016B60
function gdi32.SelectPalette(Palette:HPALETTE; ForceBackground:LongBool):HPALETTE; stdcall;
begin
{*
 00016B60    jmp         dword ptr ds:[0B8414]
*}
end;

//00016B68
function gdi32.SetAbortProc(lpAbortProc:TFNAbortProc):Integer; stdcall;
begin
{*
 00016B68    jmp         dword ptr ds:[0B8410]
*}
end;

//00016B70
function gdi32.SetBkColor(Color:Longword):Longword; stdcall;
begin
{*
 00016B70    jmp         dword ptr ds:[0B840C]
*}
end;

//00016B78
function gdi32.SetBkMode(BkMode:Integer):Integer; stdcall;
begin
{*
 00016B78    jmp         dword ptr ds:[0B8408]
*}
end;

//00016B80
function gdi32.SetBrushOrgEx(X:Integer; Y:Integer; PrevPt:PPoint):LongBool; stdcall;
begin
{*
 00016B80    jmp         dword ptr ds:[0B8404]
*}
end;

//00016B88
function gdi32.SetDIBColorTable(p2:Longword; p3:Longword; var RGBQuadSTructs:void ):Longword; stdcall;
begin
{*
 00016B88    jmp         dword ptr ds:[0B8400]
*}
end;

//00016B90
function gdi32.SetEnhMetaFileBits(p2:PChar):HENHMETAFILE; stdcall;
begin
{*
 00016B90    jmp         dword ptr ds:[0B83FC]
*}
end;

//00016B98
function gdi32.SetMapMode(p2:Integer):Integer; stdcall;
begin
{*
 00016B98    jmp         dword ptr ds:[0B83F8]
*}
end;

//00016BA0
function gdi32.SetPixel(X:Integer; Y:Integer; Color:Longword):Longword; stdcall;
begin
{*
 00016BA0    jmp         dword ptr ds:[0B83F4]
*}
end;

//00016BA8
function gdi32.SetROP2(p2:Integer):Integer; stdcall;
begin
{*
 00016BA8    jmp         dword ptr ds:[0B83F0]
*}
end;

//00016BB0
function gdi32.SetStretchBltMode(p2:Integer):Integer; stdcall;
begin
{*
 00016BB0    jmp         dword ptr ds:[0B83EC]
*}
end;

//00016BB8
function gdi32.SetTextColor(Color:Longword):Longword; stdcall;
begin
{*
 00016BB8    jmp         dword ptr ds:[0B83E8]
*}
end;

//00016BC0
function gdi32.SetViewportExtEx(XExt:Integer; YExt:Integer; Size:PSize):LongBool; stdcall;
begin
{*
 00016BC0    jmp         dword ptr ds:[0B83E4]
*}
end;

//00016BC8
function gdi32.SetViewportOrgEx(X:Integer; Y:Integer; Point:PPoint):LongBool; stdcall;
begin
{*
 00016BC8    jmp         dword ptr ds:[0B83E0]
*}
end;

//00016BD0
function gdi32.SetWinMetaFileBits(p2:PChar; p3:HDC; const p4:tagMETAFILEPICT):HENHMETAFILE; stdcall;
begin
{*
 00016BD0    jmp         dword ptr ds:[0B83DC]
*}
end;

//00016BD8
function gdi32.SetWindowExtEx(XExt:Integer; YExt:Integer; Size:PSize):LongBool; stdcall;
begin
{*
 00016BD8    jmp         dword ptr ds:[0B83D8]
*}
end;

//00016BE0
function gdi32.SetWindowOrgEx(X:Integer; Y:Integer; Point:PPoint):LongBool; stdcall;
begin
{*
 00016BE0    jmp         dword ptr ds:[0B83D4]
*}
end;

//00016BE8
function gdi32.StartDocA(const p2:_DOCINFOA):Integer; stdcall;
begin
{*
 00016BE8    jmp         dword ptr ds:[0B83D0]
*}
end;

//00016BF0
function gdi32.StartPage:Integer; stdcall;
begin
{*
 00016BF0    jmp         dword ptr ds:[0B83CC]
*}
end;

//00016BF8
function gdi32.StretchBlt(X:Integer; Y:Integer; Width:Integer; Height:Integer; SrcDC:HDC; XSrc:Integer; YSrc:Integer; SrcWidth:Integer; SrcHeight:Integer; Rop:Longword):LongBool; stdcall;
begin
{*
 00016BF8    jmp         dword ptr ds:[0B83C8]
*}
end;

//00016C00
function gdi32.UnrealizeObject:LongBool; stdcall;
begin
{*
 00016C00    jmp         dword ptr ds:[0B83C4]
*}
end;

//00016C08
function user32.ActivateKeyboardLayout(Flags:Longword):HKL; stdcall;
begin
{*
 00016C08    jmp         dword ptr ds:[0B87E0]
*}
end;

//00016C10
function user32.AdjustWindowRectEx(dwStyle:Longword; bMenu:LongBool; dwExStyle:Longword):LongBool; stdcall;
begin
{*
 00016C10    jmp         dword ptr ds:[0B87DC]
*}
end;

//00016C18
function user32.CharLowerA:PAnsiChar; stdcall;
begin
{*
 00016C18    jmp         dword ptr ds:[0B87D4]
*}
end;

//00016C20
function user32.BeginDeferWindowPos:Longword; stdcall;
begin
{*
 00016C20    jmp         dword ptr ds:[0B87CC]
*}
end;

//00016C28
function user32.BeginPaint(var lpPaint:tagPAINTSTRUCT):HDC; stdcall;
begin
{*
 00016C28    jmp         dword ptr ds:[0B87C8]
*}
end;

//00016C30
function user32.CallNextHookEx(nCode:Integer; wParam:Longint; lParam:Longint):Longint; stdcall;
begin
{*
 00016C30    jmp         dword ptr ds:[0B87C4]
*}
end;

//00016C38
function user32.CallWindowProcA(hWnd:HWND; Msg:Longword; wParam:Longint; lParam:Longint):Longint; stdcall;
begin
{*
 00016C38    jmp         dword ptr ds:[0B87C0]
*}
end;

//00016C40
function user32.ChangeClipboardChain(hWndNewNext:HWND):LongBool; stdcall;
begin
{*
 00016C40    jmp         dword ptr ds:[0B87BC]
*}
end;

//00016C48
function user32.CharLowerBuffA(cchLength:Longword):Longword; stdcall;
begin
{*
 00016C48    jmp         dword ptr ds:[0B87D0]
*}
end;

//00016C50
function user32.CharUpperBuffA(cchLength:Longword):Longword; stdcall;
begin
{*
 00016C50    jmp         dword ptr ds:[0B87D8]
*}
end;

//00016C58
function user32.CheckMenuItem(uIDCheckItem:Longword; uCheck:Longword):Longword; stdcall;
begin
{*
 00016C58    jmp         dword ptr ds:[0B87B8]
*}
end;

//00016C60
function user32.ClientToScreen(var lpPoint:TPoint):LongBool; stdcall;
begin
{*
 00016C60    jmp         dword ptr ds:[0B87B4]
*}
end;

//00016C68
function user32.CloseClipboard:LongBool;
begin
{*
 00016C68    jmp         dword ptr ds:[0B87B0]
*}
end;

//00016C70
function user32.CreateIcon(nWidth:Integer; nHeight:Integer; cPlanes:Byte; cBitsPixel:Byte; lpbANDbits:Pointer; lpbXORbits:Pointer):HICON; stdcall;
begin
{*
 00016C70    jmp         dword ptr ds:[0B87AC]
*}
end;

//00016C78
function user32.CreateMenu:HMENU;
begin
{*
 00016C78    jmp         dword ptr ds:[0B87A8]
*}
end;

//00016C80
function user32.CreatePopupMenu:HMENU;
begin
{*
 00016C80    jmp         dword ptr ds:[0B87A4]
*}
end;

//00016C88
function user32.CreateWindowExA(lpClassName:PAnsiChar; lpWindowName:PAnsiChar; dwStyle:Longword; X:Integer; Y:Integer; nWidth:Integer; nHeight:Integer; hWndParent:HWND; hMenu:HMENU; hInstance:HINST; lpParam:Pointer):HWND; stdcall;
begin
{*
 00016C88    jmp         dword ptr ds:[0B87A0]
*}
end;

//00016C90
function user32.DefFrameProcA(hWndMDIClient:HWND; uMsg:Longword; wParam:Longint; lParam:Longint):Longint; stdcall;
begin
{*
 00016C90    jmp         dword ptr ds:[0B879C]
*}
end;

//00016C98
function user32.DefMDIChildProcA(uMsg:Longword; wParam:Longint; lParam:Longint):Longint; stdcall;
begin
{*
 00016C98    jmp         dword ptr ds:[0B8798]
*}
end;

//00016CA0
function user32.DefWindowProcA(Msg:Longword; wParam:Longint; lParam:Longint):Longint; stdcall;
begin
{*
 00016CA0    jmp         dword ptr ds:[0B8794]
*}
end;

//00016CA8
function user32.DeferWindowPos(hWnd:HWND; hWndInsertAfter:HWND; x:Integer; y:Integer; cx:Integer; cy:Integer; uFlags:Longword):Longword; stdcall;
begin
{*
 00016CA8    jmp         dword ptr ds:[0B8790]
*}
end;

//00016CB0
function user32.DeleteMenu(uPosition:Longword; uFlags:Longword):LongBool; stdcall;
begin
{*
 00016CB0    jmp         dword ptr ds:[0B878C]
*}
end;

//00016CB8
function user32.DestroyCursor:LongBool; stdcall;
begin
{*
 00016CB8    jmp         dword ptr ds:[0B8788]
*}
end;

//00016CC0
function user32.DestroyIcon:LongBool; stdcall;
begin
{*
 00016CC0    jmp         dword ptr ds:[0B8784]
*}
end;

//00016CC8
function user32.DestroyMenu:LongBool; stdcall;
begin
{*
 00016CC8    jmp         dword ptr ds:[0B8780]
*}
end;

//00016CD0
function user32.DestroyWindow:LongBool; stdcall;
begin
{*
 00016CD0    jmp         dword ptr ds:[0B877C]
*}
end;

//00016CD8
function user32.DispatchMessageA:Longint; stdcall;
begin
{*
 00016CD8    jmp         dword ptr ds:[0B8778]
*}
end;

//00016CE0
function user32.DrawEdge(var qrc:TRect; edge:Longword; grfFlags:Longword):LongBool; stdcall;
begin
{*
 00016CE0    jmp         dword ptr ds:[0B8774]
*}
end;

//00016CE8
function user32.DrawFocusRect(const lprc:TRect):LongBool; stdcall;
begin
{*
 00016CE8    jmp         dword ptr ds:[0B8770]
*}
end;

//00016CF0
function user32.DrawFrameControl(const Rect:TRect; uType:Longword; uState:Longword):LongBool; stdcall;
begin
{*
 00016CF0    jmp         dword ptr ds:[0B876C]
*}
end;

//00016CF8
function user32.DrawIcon(X:Integer; Y:Integer; hIcon:HICON):LongBool; stdcall;
begin
{*
 00016CF8    jmp         dword ptr ds:[0B8768]
*}
end;

//00016D00
function user32.DrawMenuBar:LongBool; stdcall;
begin
{*
 00016D00    jmp         dword ptr ds:[0B8764]
*}
end;

//00016D08
function user32.DrawTextA(lpString:PAnsiChar; nCount:Integer; var lpRect:TRect; uFormat:Longword):Integer; stdcall;
begin
{*
 00016D08    jmp         dword ptr ds:[0B8760]
*}
end;

//00016D10
function user32.EmptyClipboard:LongBool;
begin
{*
 00016D10    jmp         dword ptr ds:[0B875C]
*}
end;

//00016D18
function user32.EnableMenuItem(uIDEnableItem:Longword; uEnable:Longword):LongBool; stdcall;
begin
{*
 00016D18    jmp         dword ptr ds:[0B8758]
*}
end;

//00016D20
function user32.EnableScrollBar(wSBflags:Longword; wArrows:Longword):LongBool; stdcall;
begin
{*
 00016D20    jmp         dword ptr ds:[0B8754]
*}
end;

//00016D28
function user32.EnableWindow(bEnable:LongBool):LongBool; stdcall;
begin
{*
 00016D28    jmp         dword ptr ds:[0B8750]
*}
end;

//00016D30
function user32.EndDeferWindowPos:LongBool; stdcall;
begin
{*
 00016D30    jmp         dword ptr ds:[0B874C]
*}
end;

//00016D38
function user32.EndPaint(const lpPaint:tagPAINTSTRUCT):LongBool; stdcall;
begin
{*
 00016D38    jmp         dword ptr ds:[0B8748]
*}
end;

//00016D40
function user32.EnumClipboardFormats:Longword; stdcall;
begin
{*
 00016D40    jmp         dword ptr ds:[0B8744]
*}
end;

//00016D48
function user32.EnumThreadWindows(lpfn:Pointer; lParam:Longint):LongBool; stdcall;
begin
{*
 00016D48    jmp         dword ptr ds:[0B8740]
*}
end;

//00016D50
function user32.EnumWindows(lParam:Longint):LongBool; stdcall;
begin
{*
 00016D50    jmp         dword ptr ds:[0B873C]
*}
end;

//00016D58
function user32.EqualRect(const lprc2:TRect):LongBool; stdcall;
begin
{*
 00016D58    jmp         dword ptr ds:[0B8738]
*}
end;

//00016D60
function user32.FillRect(const lprc:TRect; hbr:HBRUSH):Integer; stdcall;
begin
{*
 00016D60    jmp         dword ptr ds:[0B8734]
*}
end;

//00016D68
function user32.FindWindowA(lpWindowName:PAnsiChar):HWND; stdcall;
begin
{*
 00016D68    jmp         dword ptr ds:[0B8730]
*}
end;

//00016D70
function user32.FrameRect(const lprc:TRect; hbr:HBRUSH):Integer; stdcall;
begin
{*
 00016D70    jmp         dword ptr ds:[0B872C]
*}
end;

//00016D78
function user32.GetActiveWindow:HWND;
begin
{*
 00016D78    jmp         dword ptr ds:[0B8728]
*}
end;

//00016D80
function user32.GetCapture:HWND;
begin
{*
 00016D80    jmp         dword ptr ds:[0B8724]
*}
end;

//00016D88
function user32.GetClassInfoA(lpClassName:PAnsiChar; var lpWndClass:tagWNDCLASSA):LongBool; stdcall;
begin
{*
 00016D88    jmp         dword ptr ds:[0B8720]
*}
end;

//00016D90
function user32.GetClientRect(var lpRect:TRect):LongBool; stdcall;
begin
{*
 00016D90    jmp         dword ptr ds:[0B871C]
*}
end;

//00016D98
function user32.GetClipboardData:Longword; stdcall;
begin
{*
 00016D98    jmp         dword ptr ds:[0B8718]
*}
end;

//00016DA0
function user32.GetClipboardOwner:HWND;
begin
{*
 00016DA0    jmp         dword ptr ds:[0B8714]
*}
end;

//00016DA8
function user32.GetCursor:HICON;
begin
{*
 00016DA8    jmp         dword ptr ds:[0B8710]
*}
end;

//00016DB0
function user32.GetCursorPos:LongBool; stdcall;
begin
{*
 00016DB0    jmp         dword ptr ds:[0B870C]
*}
end;

//00016DB8
function user32.GetDC:HDC; stdcall;
begin
{*
 00016DB8    jmp         dword ptr ds:[0B8708]
*}
end;

//00016DC0
function user32.GetDCEx(hrgnClip:HRGN; flags:Longword):HDC; stdcall;
begin
{*
 00016DC0    jmp         dword ptr ds:[0B8704]
*}
end;

//00016DC8
function user32.GetDesktopWindow:HWND;
begin
{*
 00016DC8    jmp         dword ptr ds:[0B8700]
*}
end;

//00016DD0
function user32.GetDlgItem(nIDDlgItem:Integer):HWND; stdcall;
begin
{*
 00016DD0    jmp         dword ptr ds:[0B86FC]
*}
end;

//00016DD8
function user32.GetDoubleClickTime:Longword;
begin
{*
 00016DD8    jmp         dword ptr ds:[0B86F8]
*}
end;

//00016DE0
function user32.GetFocus:HWND;
begin
{*
 00016DE0    jmp         dword ptr ds:[0B86F4]
*}
end;

//00016DE8
function user32.GetForegroundWindow:HWND;
begin
{*
 00016DE8    jmp         dword ptr ds:[0B86F0]
*}
end;

//00016DF0
function user32.GetIconInfo(var piconinfo:_ICONINFO):LongBool; stdcall;
begin
{*
 00016DF0    jmp         dword ptr ds:[0B86EC]
*}
end;

//00016DF8
function user32.GetKeyNameTextA(lpString:PAnsiChar; nSize:Integer):Integer; stdcall;
begin
{*
 00016DF8    jmp         dword ptr ds:[0B86E8]
*}
end;

//00016E00
function user32.GetKeyState:Smallint; stdcall;
begin
{*
 00016E00    jmp         dword ptr ds:[0B86E4]
*}
end;

//00016E08
function user32.GetKeyboardLayout:HKL; stdcall;
begin
{*
 00016E08    jmp         dword ptr ds:[0B86E0]
*}
end;

//00016E10
function user32.GetKeyboardLayoutList(var List:void ):Longword; stdcall;
begin
{*
 00016E10    jmp         dword ptr ds:[0B86DC]
*}
end;

//00016E18
function user32.GetKeyboardState:LongBool; stdcall;
begin
{*
 00016E18    jmp         dword ptr ds:[0B86D8]
*}
end;

//00016E20
function user32.GetLastActivePopup:HWND; stdcall;
begin
{*
 00016E20    jmp         dword ptr ds:[0B86D4]
*}
end;

//00016E28
function user32.GetMenu:HMENU; stdcall;
begin
{*
 00016E28    jmp         dword ptr ds:[0B86D0]
*}
end;

//00016E30
function user32.GetMenuItemCount:Integer; stdcall;
begin
{*
 00016E30    jmp         dword ptr ds:[0B86CC]
*}
end;

//00016E38
function user32.GetMenuItemID(nPos:Integer):Longword; stdcall;
begin
{*
 00016E38    jmp         dword ptr ds:[0B86C8]
*}
end;

//00016E40
function user32.GetMenuItemInfoA(p2:Longword; p3:LongBool; var p4:tagMENUITEMINFOA):LongBool; stdcall;
begin
{*
 00016E40    jmp         dword ptr ds:[0B86C4]
*}
end;

//00016E48
function user32.GetMenuState(uId:Longword; uFlags:Longword):Longword; stdcall;
begin
{*
 00016E48    jmp         dword ptr ds:[0B86C0]
*}
end;

//00016E50
function user32.GetMenuStringA(uIDItem:Longword; lpString:PAnsiChar; nMaxCount:Integer; uFlag:Longword):Integer; stdcall;
begin
{*
 00016E50    jmp         dword ptr ds:[0B86BC]
*}
end;

//00016E58
function user32.GetMessageTime:Longint;
begin
{*
 00016E58    jmp         dword ptr ds:[0B86B8]
*}
end;

//00016E60
function user32.GetWindow(uCmd:Longword):HWND; stdcall;
begin
{*
 00016E60    jmp         dword ptr ds:[0B86B4]
*}
end;

//00016E68
function user32.GetParent:HWND; stdcall;
begin
{*
 00016E68    jmp         dword ptr ds:[0B86B0]
*}
end;

//00016E70
function user32.GetPropA(lpString:PAnsiChar):Longword; stdcall;
begin
{*
 00016E70    jmp         dword ptr ds:[0B86AC]
*}
end;

//00016E78
function user32.GetScrollInfo(BarFlag:Integer; var ScrollInfo:tagSCROLLINFO):LongBool; stdcall;
begin
{*
 00016E78    jmp         dword ptr ds:[0B86A8]
*}
end;

//00016E80
function user32.GetScrollPos(nBar:Integer):Integer; stdcall;
begin
{*
 00016E80    jmp         dword ptr ds:[0B86A4]
*}
end;

//00016E88
function user32.GetScrollRange(nBar:Integer; var lpMinPos:Integer; var lpMaxPos:Integer):LongBool; stdcall;
begin
{*
 00016E88    jmp         dword ptr ds:[0B86A0]
*}
end;

//00016E90
function user32.GetSubMenu(nPos:Integer):HMENU; stdcall;
begin
{*
 00016E90    jmp         dword ptr ds:[0B869C]
*}
end;

//00016E98
function user32.GetSysColor:Longword; stdcall;
begin
{*
 00016E98    jmp         dword ptr ds:[0B8698]
*}
end;

//00016EA0
function user32.GetSystemMenu(bRevert:LongBool):HMENU; stdcall;
begin
{*
 00016EA0    jmp         dword ptr ds:[0B8694]
*}
end;

//00016EA8
function user32.GetSystemMetrics:Integer; stdcall;
begin
{*
 00016EA8    jmp         dword ptr ds:[0B8690]
*}
end;

//00016EB0
function user32.GetTopWindow:HWND; stdcall;
begin
{*
 00016EB0    jmp         dword ptr ds:[0B868C]
*}
end;

//00016EB8
function user32.GetWindow(uCmd:Longword):HWND; stdcall;
begin
{*
 00016EB8    jmp         dword ptr ds:[0B86B4]
*}
end;

//00016EC0
function user32.GetWindowDC:HDC; stdcall;
begin
{*
 00016EC0    jmp         dword ptr ds:[0B8688]
*}
end;

//00016EC8
function user32.GetWindowLongA(nIndex:Integer):Longint; stdcall;
begin
{*
 00016EC8    jmp         dword ptr ds:[0B8684]
*}
end;

//00016ED0
function user32.GetWindowPlacement(WindowPlacement:PWindowPlacement):LongBool; stdcall;
begin
{*
 00016ED0    jmp         dword ptr ds:[0B8680]
*}
end;

//00016ED8
function user32.GetWindowRect(var lpRect:TRect):LongBool; stdcall;
begin
{*
 00016ED8    jmp         dword ptr ds:[0B867C]
*}
end;

//00016EE0
function user32.GetWindowRgn(hRgn:HRGN):LongBool; stdcall;
begin
{*
 00016EE0    jmp         dword ptr ds:[0B8678]
*}
end;

//00016EE8
function user32.GetWindowTextA(lpString:PAnsiChar; nMaxCount:Integer):Integer; stdcall;
begin
{*
 00016EE8    jmp         dword ptr ds:[0B8674]
*}
end;

//00016EF0
function user32.GetWindowThreadProcessId(lpdwProcessId:Pointer):Longword; stdcall;
begin
{*
 00016EF0    jmp         dword ptr ds:[0B8670]
*}
end;

//00016EF8
function user32.InflateRect(dx:Integer; dy:Integer):LongBool; stdcall;
begin
{*
 00016EF8    jmp         dword ptr ds:[0B866C]
*}
end;

//00016F00
function user32.InsertMenuA(uPosition:Longword; uFlags:Longword; uIDNewItem:Longword; lpNewItem:PAnsiChar):LongBool; stdcall;
begin
{*
 00016F00    jmp         dword ptr ds:[0B8668]
*}
end;

//00016F08
function user32.InsertMenuItemA(p2:Longword; p3:LongBool; const p4:tagMENUITEMINFOA):LongBool; stdcall;
begin
{*
 00016F08    jmp         dword ptr ds:[0B8664]
*}
end;

//00016F10
function user32.IntersectRect(const lprcSrc1:TRect; const lprcSrc2:TRect):LongBool; stdcall;
begin
{*
 00016F10    jmp         dword ptr ds:[0B8660]
*}
end;

//00016F18
function user32.InvalidateRect(lpRect:PRect; bErase:LongBool):LongBool; stdcall;
begin
{*
 00016F18    jmp         dword ptr ds:[0B865C]
*}
end;

//00016F20
function user32.IsCharAlphaA:LongBool; stdcall;
begin
{*
 00016F20    jmp         dword ptr ds:[0B8658]
*}
end;

//00016F28
function user32.IsCharAlphaNumericA:LongBool; stdcall;
begin
{*
 00016F28    jmp         dword ptr ds:[0B8654]
*}
end;

//00016F30
function user32.IsChild(hWnd:HWND):LongBool; stdcall;
begin
{*
 00016F30    jmp         dword ptr ds:[0B8650]
*}
end;

//00016F38
function user32.IsClipboardFormatAvailable:LongBool; stdcall;
begin
{*
 00016F38    jmp         dword ptr ds:[0B864C]
*}
end;

//00016F40
function user32.IsDialogMessageA(var lpMsg:tagMSG):LongBool; stdcall;
begin
{*
 00016F40    jmp         dword ptr ds:[0B8648]
*}
end;

//00016F48
function user32.IsIconic:LongBool; stdcall;
begin
{*
 00016F48    jmp         dword ptr ds:[0B8644]
*}
end;

//00016F50
function user32.IsRectEmpty:LongBool; stdcall;
begin
{*
 00016F50    jmp         dword ptr ds:[0B8640]
*}
end;

//00016F58
function user32.IsWindow:LongBool; stdcall;
begin
{*
 00016F58    jmp         dword ptr ds:[0B863C]
*}
end;

//00016F60
function user32.IsWindowEnabled:LongBool; stdcall;
begin
{*
 00016F60    jmp         dword ptr ds:[0B8638]
*}
end;

//00016F68
function user32.IsWindowVisible:LongBool; stdcall;
begin
{*
 00016F68    jmp         dword ptr ds:[0B8634]
*}
end;

//00016F70
function user32.IsZoomed:LongBool; stdcall;
begin
{*
 00016F70    jmp         dword ptr ds:[0B8630]
*}
end;

//00016F78
function user32.KillTimer(uIDEvent:Longword):LongBool; stdcall;
begin
{*
 00016F78    jmp         dword ptr ds:[0B862C]
*}
end;

//00016F80
function user32.LoadBitmapA(lpBitmapName:PAnsiChar):HBITMAP; stdcall;
begin
{*
 00016F80    jmp         dword ptr ds:[0B8628]
*}
end;

//00016F88
function user32.LoadCursorA(lpCursorName:PAnsiChar):HICON; stdcall;
begin
{*
 00016F88    jmp         dword ptr ds:[0B8624]
*}
end;

//00016F90
function user32.LoadIconA(lpIconName:PAnsiChar):HICON; stdcall;
begin
{*
 00016F90    jmp         dword ptr ds:[0B8620]
*}
end;

//00016F98
function user32.LoadStringA(uID:Longword; lpBuffer:PAnsiChar; nBufferMax:Integer):Integer; stdcall;
begin
{*
 00016F98    jmp         dword ptr ds:[0B861C]
*}
end;

//00016FA0
function user32.MapVirtualKeyA(uMapType:Longword):Longword; stdcall;
begin
{*
 00016FA0    jmp         dword ptr ds:[0B8618]
*}
end;

//00016FA8
function user32.MapWindowPoints(hWndTo:HWND; var lpPoints:void ; cPoints:Longword):Integer; stdcall;
begin
{*
 00016FA8    jmp         dword ptr ds:[0B8614]
*}
end;

//00016FB0
function user32.MessageBeep:LongBool; stdcall;
begin
{*
 00016FB0    jmp         dword ptr ds:[0B8610]
*}
end;

//00016FB8
function user32.MessageBoxA(lpText:PAnsiChar; lpCaption:PAnsiChar; uType:Longword):Integer; stdcall;
begin
{*
 00016FB8    jmp         dword ptr ds:[0B860C]
*}
end;

//00016FC0
function user32.OemToCharA(lpszDst:PAnsiChar):LongBool; stdcall;
begin
{*
 00016FC0    jmp         dword ptr ds:[0B8608]
*}
end;

//00016FC8
function user32.OffsetRect(dx:Integer; dy:Integer):LongBool; stdcall;
begin
{*
 00016FC8    jmp         dword ptr ds:[0B8604]
*}
end;

//00016FD0
function user32.OpenClipboard:LongBool; stdcall;
begin
{*
 00016FD0    jmp         dword ptr ds:[0B8600]
*}
end;

//00016FD8
function user32.PeekMessageA(hWnd:HWND; wMsgFilterMin:Longword; wMsgFilterMax:Longword; wRemoveMsg:Longword):LongBool; stdcall;
begin
{*
 00016FD8    jmp         dword ptr ds:[0B85FC]
*}
end;

//00016FE0
function user32.PostMessageA(Msg:Longword; wParam:Longint; lParam:Longint):LongBool; stdcall;
begin
{*
 00016FE0    jmp         dword ptr ds:[0B85F8]
*}
end;

//00016FE8
procedure user32.PostQuitMessage; stdcall;
begin
{*
 00016FE8    jmp         dword ptr ds:[0B85F4]
*}
end;

//00016FF0
function user32.PtInRect(pt:TPoint):LongBool; stdcall;
begin
{*
 00016FF0    jmp         dword ptr ds:[0B85F0]
*}
end;

//00016FF8
function user32.RedrawWindow(lprcUpdate:PRect; hrgnUpdate:HRGN; flags:Longword):LongBool; stdcall;
begin
{*
 00016FF8    jmp         dword ptr ds:[0B85EC]
*}
end;

//00017000
function user32.RegisterClassA:Word; stdcall;
begin
{*
 00017000    jmp         dword ptr ds:[0B85E8]
*}
end;

//00017008
function user32.RegisterClipboardFormatA:Longword; stdcall;
begin
{*
 00017008    jmp         dword ptr ds:[0B85E4]
*}
end;

//00017010
function user32.RegisterWindowMessageA:Longword; stdcall;
begin
{*
 00017010    jmp         dword ptr ds:[0B85E0]
*}
end;

//00017018
function user32.ReleaseCapture:LongBool;
begin
{*
 00017018    jmp         dword ptr ds:[0B85DC]
*}
end;

//00017020
function user32.ReleaseDC(hDC:HDC):Integer; stdcall;
begin
{*
 00017020    jmp         dword ptr ds:[0B85D8]
*}
end;

//00017028
function user32.RemoveMenu(uPosition:Longword; uFlags:Longword):LongBool; stdcall;
begin
{*
 00017028    jmp         dword ptr ds:[0B85D4]
*}
end;

//00017030
function user32.RemovePropA(lpString:PAnsiChar):Longword; stdcall;
begin
{*
 00017030    jmp         dword ptr ds:[0B85D0]
*}
end;

//00017038
function user32.ScreenToClient(var lpPoint:TPoint):LongBool; stdcall;
begin
{*
 00017038    jmp         dword ptr ds:[0B85CC]
*}
end;

//00017040
function user32.ScrollWindow(XAmount:Integer; YAmount:Integer; Rect:PRect; ClipRect:PRect):LongBool; stdcall;
begin
{*
 00017040    jmp         dword ptr ds:[0B85C8]
*}
end;

//00017048
function user32.ScrollWindowEx(dx:Integer; dy:Integer; prcScroll:PRect; prcClip:PRect; hrgnUpdate:HRGN; prcUpdate:PRect; flags:Longword):LongBool; stdcall;
begin
{*
 00017048    jmp         dword ptr ds:[0B85C4]
*}
end;

//00017050
function user32.SendMessageA(Msg:Longword; wParam:Longint; lParam:Longint):Longint; stdcall;
begin
{*
 00017050    jmp         dword ptr ds:[0B85C0]
*}
end;

//00017058
function user32.SetActiveWindow:HWND; stdcall;
begin
{*
 00017058    jmp         dword ptr ds:[0B85BC]
*}
end;

//00017060
function user32.SetCapture:HWND; stdcall;
begin
{*
 00017060    jmp         dword ptr ds:[0B85B8]
*}
end;

//00017068
function user32.SetClipboardData(hMem:Longword):Longword; stdcall;
begin
{*
 00017068    jmp         dword ptr ds:[0B85B4]
*}
end;

//00017070
function user32.SetClipboardViewer:HWND; stdcall;
begin
{*
 00017070    jmp         dword ptr ds:[0B85B0]
*}
end;

//00017078
function user32.SetCursor:HICON; stdcall;
begin
{*
 00017078    jmp         dword ptr ds:[0B85AC]
*}
end;

//00017080
function user32.SetFocus:HWND; stdcall;
begin
{*
 00017080    jmp         dword ptr ds:[0B85A8]
*}
end;

//00017088
function user32.SetForegroundWindow:LongBool; stdcall;
begin
{*
 00017088    jmp         dword ptr ds:[0B85A4]
*}
end;

//00017090
function user32.SetKeyboardState:LongBool; stdcall;
begin
{*
 00017090    jmp         dword ptr ds:[0B85A0]
*}
end;

//00017098
function user32.SetMenu(hMenu:HMENU):LongBool; stdcall;
begin
{*
 00017098    jmp         dword ptr ds:[0B859C]
*}
end;

//000170A0
function user32.SetMenuItemInfoA(p2:Longword; p3:LongBool; const p4:tagMENUITEMINFOA):LongBool; stdcall;
begin
{*
 000170A0    jmp         dword ptr ds:[0B8598]
*}
end;

//000170A8
function user32.SetPropA(lpString:PAnsiChar; hData:Longword):LongBool; stdcall;
begin
{*
 000170A8    jmp         dword ptr ds:[0B8594]
*}
end;

//000170B0
function user32.SetRect(xLeft:Integer; yTop:Integer; xRight:Integer; yBottom:Integer):LongBool; stdcall;
begin
{*
 000170B0    jmp         dword ptr ds:[0B8590]
*}
end;

//000170B8
function user32.SetScrollInfo(BarFlag:Integer; const ScrollInfo:tagSCROLLINFO; Redraw:LongBool):Integer; stdcall;
begin
{*
 000170B8    jmp         dword ptr ds:[0B858C]
*}
end;

//000170C0
function user32.SetScrollPos(nBar:Integer; nPos:Integer; bRedraw:LongBool):Integer; stdcall;
begin
{*
 000170C0    jmp         dword ptr ds:[0B8588]
*}
end;

//000170C8
function user32.SetScrollRange(nBar:Integer; nMinPos:Integer; nMaxPos:Integer; bRedraw:LongBool):LongBool; stdcall;
begin
{*
 000170C8    jmp         dword ptr ds:[0B8584]
*}
end;

//000170D0
function user32.SetTimer(nIDEvent:Longword; uElapse:Longword; lpTimerFunc:Pointer):Longword; stdcall;
begin
{*
 000170D0    jmp         dword ptr ds:[0B8580]
*}
end;

//000170D8
function user32.SetWindowLongA(nIndex:Integer; dwNewLong:Longint):Longint; stdcall;
begin
{*
 000170D8    jmp         dword ptr ds:[0B857C]
*}
end;

//000170E0
function user32.SetWindowPlacement(WindowPlacement:PWindowPlacement):LongBool; stdcall;
begin
{*
 000170E0    jmp         dword ptr ds:[0B8578]
*}
end;

//000170E8
function user32.SetWindowPos(hWndInsertAfter:HWND; X:Integer; Y:Integer; cx:Integer; cy:Integer; uFlags:Longword):LongBool; stdcall;
begin
{*
 000170E8    jmp         dword ptr ds:[0B8574]
*}
end;

//000170F0
function user32.SetWindowTextA(lpString:PAnsiChar):LongBool; stdcall;
begin
{*
 000170F0    jmp         dword ptr ds:[0B8570]
*}
end;

//000170F8
function user32.SetWindowsHookExA(lpfn:TFNHookProc; hmod:HINST; dwThreadId:Longword):HHOOK; stdcall;
begin
{*
 000170F8    jmp         dword ptr ds:[0B856C]
*}
end;

//00017100
function user32.SetWindowRgn(hRgn:HRGN; bRedraw:LongBool):LongBool; stdcall;
begin
{*
 00017100    jmp         dword ptr ds:[0B8568]
*}
end;

//00017108
function user32.ShowCursor:Integer; stdcall;
begin
{*
 00017108    jmp         dword ptr ds:[0B8564]
*}
end;

//00017110
function user32.ShowOwnedPopups(fShow:LongBool):LongBool; stdcall;
begin
{*
 00017110    jmp         dword ptr ds:[0B8560]
*}
end;

//00017118
function user32.ShowScrollBar(wBar:Integer; bShow:LongBool):LongBool; stdcall;
begin
{*
 00017118    jmp         dword ptr ds:[0B855C]
*}
end;

//00017120
function user32.ShowWindow(nCmdShow:Integer):LongBool; stdcall;
begin
{*
 00017120    jmp         dword ptr ds:[0B8558]
*}
end;

//00017128
function user32.SystemParametersInfoA(uiParam:Longword; pvParam:Pointer; fWinIni:Longword):LongBool; stdcall;
begin
{*
 00017128    jmp         dword ptr ds:[0B8554]
*}
end;

//00017130
function user32.TrackPopupMenu(uFlags:Longword; x:Integer; y:Integer; nReserved:Integer; hWnd:HWND; prcRect:PRect):LongBool; stdcall;
begin
{*
 00017130    jmp         dword ptr ds:[0B8550]
*}
end;

//00017138
function user32.TranslateMDISysAccel(const lpMsg:tagMSG):LongBool; stdcall;
begin
{*
 00017138    jmp         dword ptr ds:[0B854C]
*}
end;

//00017140
function user32.TranslateMessage:LongBool; stdcall;
begin
{*
 00017140    jmp         dword ptr ds:[0B8548]
*}
end;

//00017148
function user32.UnhookWindowsHookEx:LongBool; stdcall;
begin
{*
 00017148    jmp         dword ptr ds:[0B8544]
*}
end;

//00017150
function user32.UnionRect(const lprcSrc1:TRect; const lprcSrc2:TRect):LongBool; stdcall;
begin
{*
 00017150    jmp         dword ptr ds:[0B8540]
*}
end;

//00017158
function user32.UnregisterClassA(hInstance:HINST):LongBool; stdcall;
begin
{*
 00017158    jmp         dword ptr ds:[0B853C]
*}
end;

//00017160
function user32.UpdateWindow:LongBool; stdcall;
begin
{*
 00017160    jmp         dword ptr ds:[0B8538]
*}
end;

//00017168
function user32.ValidateRect(lpRect:PRect):LongBool; stdcall;
begin
{*
 00017168    jmp         dword ptr ds:[0B8534]
*}
end;

//00017170
function user32.WaitMessage:LongBool;
begin
{*
 00017170    jmp         dword ptr ds:[0B8530]
*}
end;

//00017178
function user32.WinHelpA(lpszHelp:PAnsiChar; uCommand:Longword; dwData:Longword):LongBool; stdcall;
begin
{*
 00017178    jmp         dword ptr ds:[0B852C]
*}
end;

//00017180
function user32.WindowFromPoint:HWND; stdcall;
begin
{*
 00017180    jmp         dword ptr ds:[0B8528]
*}
end;

//00017188
function MakeLong(a:Word; b:Word):Longint;
begin
{*
 00017188    movzx       eax,ax
 0001718B    movzx       edx,dx
 0001718E    shl         edx,10
 00017191    or          eax,edx
 00017193    ret
*}
end;

//00017194
{*function sub_00017194(?:?):?;
begin
 00017194    shr         eax,10
 00017197    ret
end;*}

//00017198
function HiByte(W:Word):Byte;
begin
{*
 00017198    movzx       eax,ax
 0001719B    shr         eax,8
 0001719E    ret
*}
end;

//000171A0
function GetCurrentTime:Longint;
begin
{*
 000171A0    call        kernel32.GetTickCount
 000171A5    ret
*}
end;

//000171A8
function UnlockResource(hResData:Longword):LongBool;
begin
{*
 000171A8    xor         eax,eax
 000171AA    ret
*}
end;

//000171AC
function GlobalAllocPtr(Flags:Integer; Bytes:Longint):Pointer;
begin
{*
 000171AC    push        edx
 000171AD    push        eax
 000171AE    call        kernel32.GlobalAlloc
 000171B3    push        eax
 000171B4    call        kernel32.GlobalLock
 000171B9    ret
*}
end;

//000171BC
function GlobalReAllocPtr(P:Pointer; Bytes:Longint; Flags:Integer):Pointer;
begin
{*
 000171BC    push        ecx
 000171BD    push        edx
 000171BE    push        eax
 000171BF    call        kernel32.GlobalHandle
 000171C4    push        eax
 000171C5    push        eax
 000171C6    call        kernel32.GlobalUnlock
 000171CB    call        kernel32.GlobalReAlloc
 000171D0    push        eax
 000171D1    call        kernel32.GlobalLock
 000171D6    ret
*}
end;

//000171D8
function GlobalFreePtr(P:Pointer):Longword;
begin
{*
 000171D8    push        eax
 000171D9    call        kernel32.GlobalHandle
 000171DE    push        eax
 000171DF    push        eax
 000171E0    call        kernel32.GlobalUnlock
 000171E5    call        kernel32.GlobalFree
 000171EA    ret
*}
end;

//000171EC
function MakeROP4(fore:Longword; back:Longword):Longword;
begin
{*
 000171EC    shl         edx,8
 000171EF    and         edx,0FF000000
 000171F5    or          eax,edx
 000171F7    ret
*}
end;

//000171F8
function SmallPointToPoint(const P:TSmallPoint):TPoint;
begin
{*
 000171F8    push        ecx
 000171F9    mov         dword ptr [esp],eax
 000171FC    movsx       eax,word ptr [esp]
 00017200    mov         dword ptr [edx],eax
 00017202    movsx       eax,word ptr [esp+2]
 00017207    mov         dword ptr [edx+4],eax
 0001720A    pop         edx
 0001720B    ret
*}
end;

//0001720C
function PointToSmallPoint(const P:TPoint):TSmallPoint;
begin
{*
 0001720C    push        ecx
 0001720D    mov         dx,word ptr [eax]
 00017210    mov         word ptr [esp],dx
 00017214    mov         ax,word ptr [eax+4]
 00017218    mov         word ptr [esp+2],ax
 0001721D    mov         eax,dword ptr [esp]
 00017220    pop         edx
 00017221    ret
*}
end;

//00017224
procedure sub_00017224;
begin
{*
 00017224    call        MakeLong
 00017229    ret
*}
end;

//0001722C
function CreateWindow(lpClassName:PChar; lpWindowName:PChar; dwStyle:Longword; X:Integer; Y:Integer; nWidth:Integer; nHeight:Integer; hWndParent:HWND; hMenu:HMENU; hInstance:HINST; lpParam:Pointer):HWND;
begin
{*
 0001722C    push        ebp
 0001722D    mov         ebp,esp
 0001722F    push        ebx
 00017230    mov         ebx,dword ptr [ebp+8]
 00017233    push        ebx
 00017234    mov         ebx,dword ptr [ebp+0C]
 00017237    push        ebx
 00017238    mov         ebx,dword ptr [ebp+10]
 0001723B    push        ebx
 0001723C    mov         ebx,dword ptr [ebp+14]
 0001723F    push        ebx
 00017240    mov         ebx,dword ptr [ebp+18]
 00017243    push        ebx
 00017244    mov         ebx,dword ptr [ebp+1C]
 00017247    push        ebx
 00017248    mov         ebx,dword ptr [ebp+20]
 0001724B    push        ebx
 0001724C    mov         ebx,dword ptr [ebp+24]
 0001724F    push        ebx
 00017250    push        ecx
 00017251    push        edx
 00017252    push        eax
 00017253    push        0
 00017255    call        user32.CreateWindowExA
 0001725A    pop         ebx
 0001725B    pop         ebp
 0001725C    ret         20
*}
end;

//00017260
function HwndMSWheel(var puiMsh_MsgMouseWheel:Longword; var puiMsh_Msg3DSupport:Longword; var puiMsh_MsgScrollLines:Longword; var pf3DSupport:LongBool; var piScrollLines:Integer):HWND;
begin
{*
 00017260    push        ebp
 00017261    mov         ebp,esp
 00017263    push        ecx
 00017264    push        ebx
 00017265    push        esi
 00017266    push        edi
 00017267    mov         edi,ecx
 00017269    mov         esi,edx
 0001726B    mov         dword ptr [ebp-4],eax
 0001726E    push        172FC
 00017273    push        17310
 00017278    call        user32.FindWindowA
 0001727D    mov         ebx,eax
 0001727F    push        17318
 00017284    call        user32.RegisterWindowMessageA
 00017289    mov         edx,dword ptr [ebp-4]
 0001728C    mov         dword ptr [edx],eax
 0001728E    push        17328
 00017293    call        user32.RegisterWindowMessageA
 00017298    mov         dword ptr [esi],eax
 0001729A    push        17340
 0001729F    call        user32.RegisterWindowMessageA
 000172A4    mov         dword ptr [edi],eax
 000172A6    cmp         dword ptr [esi],0
>000172A9    je          000172C3
 000172AB    test        ebx,ebx
>000172AD    je          000172C3
 000172AF    push        0
 000172B1    push        0
 000172B3    mov         eax,dword ptr [esi]
 000172B5    push        eax
 000172B6    push        ebx
 000172B7    call        user32.SendMessageA
 000172BC    mov         edx,dword ptr [ebp+0C]
 000172BF    mov         dword ptr [edx],eax
>000172C1    jmp         000172CA
 000172C3    mov         eax,dword ptr [ebp+0C]
 000172C6    xor         edx,edx
 000172C8    mov         dword ptr [eax],edx
 000172CA    cmp         dword ptr [edi],0
>000172CD    je          000172E7
 000172CF    test        ebx,ebx
>000172D1    je          000172E7
 000172D3    push        0
 000172D5    push        0
 000172D7    mov         eax,dword ptr [edi]
 000172D9    push        eax
 000172DA    push        ebx
 000172DB    call        user32.SendMessageA
 000172E0    mov         edx,dword ptr [ebp+8]
 000172E3    mov         dword ptr [edx],eax
>000172E5    jmp         000172F0
 000172E7    mov         eax,dword ptr [ebp+8]
 000172EA    mov         dword ptr [eax],3
 000172F0    mov         eax,ebx
 000172F2    pop         edi
 000172F3    pop         esi
 000172F4    pop         ebx
 000172F5    pop         ecx
 000172F6    pop         ebp
 000172F7    ret         8
*}
end;

end.