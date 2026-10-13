//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit commctrl;

interface

uses
  SysUtils, Classes;

    function InitCommonControls:Boolean;//000315D4
    procedure InitComCtl;//000315DC
    function InitCommonControlsEx(var ICC:tagINITCOMMONCONTROLSEX):BOOL;//0003163C
    function ImageList_Create(CY:Integer; Flags:UINT; Initial:Integer; Grow:Integer):THandle; stdcall;//00031670
    function ImageList_Destroy:BOOL; stdcall;//00031678
    function ImageList_GetImageCount:Integer; stdcall;//00031680
    function ImageList_Add(Image:HBITMAP; Mask:HBITMAP):Integer; stdcall;//00031688
    function ImageList_ReplaceIcon(Index:Integer; Icon:HICON):Integer; stdcall;//00031690
    function ImageList_SetBkColor(ClrBk:TColorRef):TColorRef; stdcall;//00031698
    function ImageList_GetBkColor:TColorRef; stdcall;//000316A0
    function ImageList_AddIcon(ImageList:THandle; Icon:HICON):Integer;//000316A8
    function IndexToOverlayMask(Index:Integer):Integer;//000316B4
    function ImageList_Draw(Index:Integer; Dest:HDC; X:Integer; Y:Integer; Style:UINT):BOOL; stdcall;//000316B8
    function ImageList_Replace(Index:Integer; Image:HBITMAP; Mask:HBITMAP):BOOL; stdcall;//000316C0
    function ImageList_DrawEx(Index:Integer; Dest:HDC; X:Integer; Y:Integer; DX:Integer; DY:Integer; Bk:TColorRef; Fg:TColorRef; Style:Cardinal):BOOL; stdcall;//000316C8
    function ImageList_Remove(Index:Integer):BOOL; stdcall;//000316D0
    function ImageList_BeginDrag(Track:Integer; XHotSpot:Integer; YHotSpot:Integer):BOOL; stdcall;//000316D8
    function ImageList_EndDrag:BOOL;//000316E0
    function ImageList_DragEnter(X:Integer; Y:Integer):BOOL; stdcall;//000316E8
    function ImageList_DragLeave:BOOL; stdcall;//000316F0
    function ImageList_DragMove(Y:Integer):BOOL; stdcall;//000316F8
    function ImageList_SetDragCursorImage(Drag:Integer; XHotSpot:Integer; YHotSpot:Integer):BOOL; stdcall;//00031700
    function ImageList_DragShowNolock:BOOL; stdcall;//00031708
    function ImageList_GetDragImage(HotSpot:PPoint):THandle; stdcall;//00031710
    function ImageList_Read:THandle; stdcall;//00031718
    function ImageList_GetIconSize(var CX:Integer; var CY:Integer):BOOL; stdcall;//00031720
    function ImageList_SetIconSize(CX:Integer; CY:Integer):BOOL; stdcall;//00031728
    function ImageList_GetImageInfo(Index:Integer; var ImageInfo:_IMAGEINFO):BOOL; stdcall;//00031730
    function ListView_SetBkColor(hWnd:HWND; clrBk:TColorRef):BOOL;//00031738
    function ListView_SetImageList(hWnd:HWND; himl:THandle; iImageList:Integer):THandle;//00031750
    function ListView_GetItemCount(hWnd:HWND):Integer;//0003176C
    function IndexToStateImageMask(I:Longint):Longint;//0003177C
    function ListView_GetItem(hWnd:HWND; var pItem:tagLVITEMA):BOOL;//00031780
    function ListView_SetItem(hWnd:HWND; const pItem:tagLVITEMA):BOOL;//00031798
    function ListView_InsertItem(hWnd:HWND; const pItem:tagLVITEMA):Integer;//000317B0
    function ListView_DeleteItem(hWnd:HWND; i:Integer):BOOL;//000317C8
    function ListView_DeleteAllItems(hWnd:HWND):BOOL;//000317E0
    function ListView_GetNextItem(hWnd:HWND; iStart:Integer; Flags:UINT):Integer;//000317F4
    function ListView_FindItem(hWnd:HWND; iStart:Integer; const plvfi:tagLVFINDINFOA):Integer;//00031818
    function ListView_GetItemRect(hWnd:HWND; i:Integer; var prc:TRect; Code:Integer):BOOL;//00031828
    function ListView_HitTest(hwndLV:HWND; var pinfo:tagLVHITTESTINFO):Integer;//00031864
    function ListView_RedrawItems(hwndLV:HWND; iFirst:Integer; iLast:Integer):BOOL;//00031874
    function ListView_Arrange(hwndLV:HWND; Code:UINT):BOOL;//00031890
    function ListView_GetEditControl(hwndLV:HWND):HWND;//000318A8
    function ListView_SetColumn(hwnd:HWND; iCol:Integer; const pcol:tagLVCOLUMNA):BOOL;//000318BC
    function ListView_InsertColumn(hwnd:HWND; iCol:Integer; const pcol:tagLVCOLUMNA):Integer;//000318D8
    function ListView_DeleteColumn(hwnd:HWND; iCol:Integer):BOOL;//000318E8
    function ListView_SetColumnWidth(hwnd:HWND; iCol:Integer; cx:Integer):BOOL;//00031900
    function ListView_CreateDragImage(hwnd:HWND; i:Integer; const lpptUpLeft:TPoint):THandle;//00031924
    function ListView_SetTextColor(hwnd:HWND; clrText:TColorRef):BOOL;//00031940
    function ListView_SetTextBkColor(hwnd:HWND; clrTextBk:TColorRef):BOOL;//00031958
    function ListView_Update(hwndLV:HWND; i:Integer):BOOL;//00031970
    function ListView_SetItemState(hwndLV:HWND; i:Integer; data:UINT; mask:UINT):BOOL;//00031990
    function ListView_GetItemState(hwndLV:HWND; i:Integer; mask:Integer):Integer;//000319C0
    function ListView_GetCheckState(hwndLV:HWND; i:Integer):UINT;//000319D0
    procedure ListView_SetCheckState(hwndLV:HWND; i:Integer; Checked:Boolean);//000319F0
    function ListView_SetItemText(hwndLV:HWND; i:Integer; iSubItem:Integer; pszText:PChar):BOOL;//00031A1C
    procedure ListView_SetItemCount(hwndLV:HWND; cItems:Integer);//00031A4C
    function ListView_SortItems(hwndLV:HWND; pfnCompare:PFNLVCOMPARE; lPrm:Longint):BOOL;//00031A5C
    function ListView_GetSelectedCount(hwndLV:HWND):UINT;//00031A78
    function ListView_SetExtendedListViewStyle(hwndLV:HWND; dw:DWORD):BOOL;//00031A88
    function ListView_GetExtendedListViewStyle(hwndLV:HWND):DWORD;//00031AA0
    function ListView_GetColumnOrderArray(hwndLV:HWND; iCount:Integer; pi:PInteger):BOOL;//00031AB0

implementation

//000315D4
function comctl32.InitCommonControls:Boolean;
begin
{*
 000315D4    jmp         dword ptr ds:[0B8864]
*}
end;

//000315DC
procedure InitComCtl;
begin
{*
 000315DC    cmp         dword ptr ds:[0B6698],0
>000315E3    jne         00031612
 000315E5    push        31614
 000315EA    call        kernel32.GetModuleHandleA
 000315EF    mov         [000B6698],eax
 000315F4    cmp         dword ptr ds:[0B6698],0
>000315FB    je          00031612
 000315FD    push        31624
 00031602    mov         eax,[000B6698]
 00031607    push        eax
 00031608    call        kernel32.GetProcAddress
 0003160D    mov         [000B669C],eax
 00031612    ret
*}
end;

//0003163C
function InitCommonControlsEx(var ICC:tagINITCOMMONCONTROLSEX):BOOL;
begin
{*
 0003163C    push        ebx
 0003163D    mov         ebx,eax
 0003163F    cmp         dword ptr ds:[0B6698],0
>00031646    jne         0003164D
 00031648    call        InitComCtl
 0003164D    cmp         dword ptr ds:[0B669C],0
>00031654    je          00031661
 00031656    push        ebx
 00031657    call        dword ptr ds:[0B669C]
 0003165D    test        eax,eax
>0003165F    jne         00031665
 00031661    xor         eax,eax
>00031663    jmp         00031667
 00031665    mov         al,1
 00031667    neg         al
 00031669    sbb         eax,eax
 0003166B    pop         ebx
 0003166C    ret
*}
end;

//00031670
function comctl32.ImageList_Create(CY:Integer; Flags:UINT; Initial:Integer; Grow:Integer):THandle; stdcall;
begin
{*
 00031670    jmp         dword ptr ds:[0B8860]
*}
end;

//00031678
function comctl32.ImageList_Destroy:BOOL; stdcall;
begin
{*
 00031678    jmp         dword ptr ds:[0B885C]
*}
end;

//00031680
function comctl32.ImageList_GetImageCount:Integer; stdcall;
begin
{*
 00031680    jmp         dword ptr ds:[0B8858]
*}
end;

//00031688
function comctl32.ImageList_Add(Image:HBITMAP; Mask:HBITMAP):Integer; stdcall;
begin
{*
 00031688    jmp         dword ptr ds:[0B8854]
*}
end;

//00031690
function comctl32.ImageList_ReplaceIcon(Index:Integer; Icon:HICON):Integer; stdcall;
begin
{*
 00031690    jmp         dword ptr ds:[0B8850]
*}
end;

//00031698
function comctl32.ImageList_SetBkColor(ClrBk:TColorRef):TColorRef; stdcall;
begin
{*
 00031698    jmp         dword ptr ds:[0B884C]
*}
end;

//000316A0
function comctl32.ImageList_GetBkColor:TColorRef; stdcall;
begin
{*
 000316A0    jmp         dword ptr ds:[0B8848]
*}
end;

//000316A8
function ImageList_AddIcon(ImageList:THandle; Icon:HICON):Integer;
begin
{*
 000316A8    push        edx
 000316A9    push        0FF
 000316AB    push        eax
 000316AC    call        comctl32.ImageList_ReplaceIcon
 000316B1    ret
*}
end;

//000316B4
function IndexToOverlayMask(Index:Integer):Integer;
begin
{*
 000316B4    shl         eax,8
 000316B7    ret
*}
end;

//000316B8
function comctl32.ImageList_Draw(Index:Integer; Dest:HDC; X:Integer; Y:Integer; Style:UINT):BOOL; stdcall;
begin
{*
 000316B8    jmp         dword ptr ds:[0B8844]
*}
end;

//000316C0
function comctl32.ImageList_Replace(Index:Integer; Image:HBITMAP; Mask:HBITMAP):BOOL; stdcall;
begin
{*
 000316C0    jmp         dword ptr ds:[0B8840]
*}
end;

//000316C8
function comctl32.ImageList_DrawEx(Index:Integer; Dest:HDC; X:Integer; Y:Integer; DX:Integer; DY:Integer; Bk:TColorRef; Fg:TColorRef; Style:Cardinal):BOOL; stdcall;
begin
{*
 000316C8    jmp         dword ptr ds:[0B883C]
*}
end;

//000316D0
function comctl32.ImageList_Remove(Index:Integer):BOOL; stdcall;
begin
{*
 000316D0    jmp         dword ptr ds:[0B8838]
*}
end;

//000316D8
function comctl32.ImageList_BeginDrag(Track:Integer; XHotSpot:Integer; YHotSpot:Integer):BOOL; stdcall;
begin
{*
 000316D8    jmp         dword ptr ds:[0B8834]
*}
end;

//000316E0
function comctl32.ImageList_EndDrag:BOOL;
begin
{*
 000316E0    jmp         dword ptr ds:[0B8830]
*}
end;

//000316E8
function comctl32.ImageList_DragEnter(X:Integer; Y:Integer):BOOL; stdcall;
begin
{*
 000316E8    jmp         dword ptr ds:[0B882C]
*}
end;

//000316F0
function comctl32.ImageList_DragLeave:BOOL; stdcall;
begin
{*
 000316F0    jmp         dword ptr ds:[0B8828]
*}
end;

//000316F8
function comctl32.ImageList_DragMove(Y:Integer):BOOL; stdcall;
begin
{*
 000316F8    jmp         dword ptr ds:[0B8824]
*}
end;

//00031700
function comctl32.ImageList_SetDragCursorImage(Drag:Integer; XHotSpot:Integer; YHotSpot:Integer):BOOL; stdcall;
begin
{*
 00031700    jmp         dword ptr ds:[0B8820]
*}
end;

//00031708
function comctl32.ImageList_DragShowNolock:BOOL; stdcall;
begin
{*
 00031708    jmp         dword ptr ds:[0B881C]
*}
end;

//00031710
function comctl32.ImageList_GetDragImage(HotSpot:PPoint):THandle; stdcall;
begin
{*
 00031710    jmp         dword ptr ds:[0B8818]
*}
end;

//00031718
function comctl32.ImageList_Read:THandle; stdcall;
begin
{*
 00031718    jmp         dword ptr ds:[0B8814]
*}
end;

//00031720
function comctl32.ImageList_GetIconSize(var CX:Integer; var CY:Integer):BOOL; stdcall;
begin
{*
 00031720    jmp         dword ptr ds:[0B8810]
*}
end;

//00031728
function comctl32.ImageList_SetIconSize(CX:Integer; CY:Integer):BOOL; stdcall;
begin
{*
 00031728    jmp         dword ptr ds:[0B880C]
*}
end;

//00031730
function comctl32.ImageList_GetImageInfo(Index:Integer; var ImageInfo:_IMAGEINFO):BOOL; stdcall;
begin
{*
 00031730    jmp         dword ptr ds:[0B8808]
*}
end;

//00031738
function ListView_SetBkColor(hWnd:HWND; clrBk:TColorRef):BOOL;
begin
{*
 00031738    push        ebx
 00031739    push        esi
 0003173A    mov         esi,edx
 0003173C    mov         ebx,eax
 0003173E    push        esi
 0003173F    push        0
 00031741    push        1001
 00031746    push        ebx
 00031747    call        user32.SendMessageA
 0003174C    pop         esi
 0003174D    pop         ebx
 0003174E    ret
*}
end;

//00031750
function ListView_SetImageList(hWnd:HWND; himl:THandle; iImageList:Integer):THandle;
begin
{*
 00031750    push        ebx
 00031751    push        esi
 00031752    push        edi
 00031753    mov         edi,ecx
 00031755    mov         esi,edx
 00031757    mov         ebx,eax
 00031759    push        esi
 0003175A    push        edi
 0003175B    push        1003
 00031760    push        ebx
 00031761    call        user32.SendMessageA
 00031766    pop         edi
 00031767    pop         esi
 00031768    pop         ebx
 00031769    ret
*}
end;

//0003176C
function ListView_GetItemCount(hWnd:HWND):Integer;
begin
{*
 0003176C    push        0
 0003176E    push        0
 00031770    push        1004
 00031775    push        eax
 00031776    call        user32.SendMessageA
 0003177B    ret
*}
end;

//0003177C
function IndexToStateImageMask(I:Longint):Longint;
begin
{*
 0003177C    shl         eax,0C
 0003177F    ret
*}
end;

//00031780
function ListView_GetItem(hWnd:HWND; var pItem:tagLVITEMA):BOOL;
begin
{*
 00031780    push        ebx
 00031781    push        esi
 00031782    mov         esi,edx
 00031784    mov         ebx,eax
 00031786    push        esi
 00031787    push        0
 00031789    push        1005
 0003178E    push        ebx
 0003178F    call        user32.SendMessageA
 00031794    pop         esi
 00031795    pop         ebx
 00031796    ret
*}
end;

//00031798
function ListView_SetItem(hWnd:HWND; const pItem:tagLVITEMA):BOOL;
begin
{*
 00031798    push        ebx
 00031799    push        esi
 0003179A    mov         esi,edx
 0003179C    mov         ebx,eax
 0003179E    push        esi
 0003179F    push        0
 000317A1    push        1006
 000317A6    push        ebx
 000317A7    call        user32.SendMessageA
 000317AC    pop         esi
 000317AD    pop         ebx
 000317AE    ret
*}
end;

//000317B0
function ListView_InsertItem(hWnd:HWND; const pItem:tagLVITEMA):Integer;
begin
{*
 000317B0    push        ebx
 000317B1    push        esi
 000317B2    mov         esi,edx
 000317B4    mov         ebx,eax
 000317B6    push        esi
 000317B7    push        0
 000317B9    push        1007
 000317BE    push        ebx
 000317BF    call        user32.SendMessageA
 000317C4    pop         esi
 000317C5    pop         ebx
 000317C6    ret
*}
end;

//000317C8
function ListView_DeleteItem(hWnd:HWND; i:Integer):BOOL;
begin
{*
 000317C8    push        ebx
 000317C9    push        esi
 000317CA    mov         esi,edx
 000317CC    mov         ebx,eax
 000317CE    push        0
 000317D0    push        esi
 000317D1    push        1008
 000317D6    push        ebx
 000317D7    call        user32.SendMessageA
 000317DC    pop         esi
 000317DD    pop         ebx
 000317DE    ret
*}
end;

//000317E0
function ListView_DeleteAllItems(hWnd:HWND):BOOL;
begin
{*
 000317E0    push        ebx
 000317E1    mov         ebx,eax
 000317E3    push        0
 000317E5    push        0
 000317E7    push        1009
 000317EC    push        ebx
 000317ED    call        user32.SendMessageA
 000317F2    pop         ebx
 000317F3    ret
*}
end;

//000317F4
function ListView_GetNextItem(hWnd:HWND; iStart:Integer; Flags:UINT):Integer;
begin
{*
 000317F4    push        ebx
 000317F5    push        esi
 000317F6    push        edi
 000317F7    mov         edi,ecx
 000317F9    mov         esi,edx
 000317FB    mov         ebx,eax
 000317FD    xor         edx,edx
 000317FF    mov         eax,edi
 00031801    call        MakeLong
 00031806    push        eax
 00031807    push        esi
 00031808    push        100C
 0003180D    push        ebx
 0003180E    call        user32.SendMessageA
 00031813    pop         edi
 00031814    pop         esi
 00031815    pop         ebx
 00031816    ret
*}
end;

//00031818
function ListView_FindItem(hWnd:HWND; iStart:Integer; const plvfi:tagLVFINDINFOA):Integer;
begin
{*
 00031818    push        ecx
 00031819    push        edx
 0003181A    push        100D
 0003181F    push        eax
 00031820    call        user32.SendMessageA
 00031825    ret
*}
end;

//00031828
function ListView_GetItemRect(hWnd:HWND; i:Integer; var prc:TRect; Code:Integer):BOOL;
begin
{*
 00031828    push        ebp
 00031829    mov         ebp,esp
 0003182B    push        ebx
 0003182C    push        esi
 0003182D    push        edi
 0003182E    mov         ebx,ecx
 00031830    mov         edi,edx
 00031832    mov         esi,eax
 00031834    test        ebx,ebx
>00031836    je          0003184C
 00031838    mov         eax,dword ptr [ebp+8]
 0003183B    mov         dword ptr [ebx],eax
 0003183D    push        ebx
 0003183E    push        edi
 0003183F    push        100E
 00031844    push        esi
 00031845    call        user32.SendMessageA
>0003184A    jmp         0003185A
 0003184C    push        0
 0003184E    push        edi
 0003184F    push        100E
 00031854    push        esi
 00031855    call        user32.SendMessageA
 0003185A    pop         edi
 0003185B    pop         esi
 0003185C    pop         ebx
 0003185D    pop         ebp
 0003185E    ret         4
*}
end;

//00031864
function ListView_HitTest(hwndLV:HWND; var pinfo:tagLVHITTESTINFO):Integer;
begin
{*
 00031864    push        edx
 00031865    push        0
 00031867    push        1012
 0003186C    push        eax
 0003186D    call        user32.SendMessageA
 00031872    ret
*}
end;

//00031874
function ListView_RedrawItems(hwndLV:HWND; iFirst:Integer; iLast:Integer):BOOL;
begin
{*
 00031874    push        ebx
 00031875    push        esi
 00031876    push        edi
 00031877    mov         edi,ecx
 00031879    mov         esi,edx
 0003187B    mov         ebx,eax
 0003187D    push        edi
 0003187E    push        esi
 0003187F    push        1015
 00031884    push        ebx
 00031885    call        user32.SendMessageA
 0003188A    pop         edi
 0003188B    pop         esi
 0003188C    pop         ebx
 0003188D    ret
*}
end;

//00031890
function ListView_Arrange(hwndLV:HWND; Code:UINT):BOOL;
begin
{*
 00031890    push        ebx
 00031891    push        esi
 00031892    mov         esi,edx
 00031894    mov         ebx,eax
 00031896    push        0
 00031898    push        esi
 00031899    push        1016
 0003189E    push        ebx
 0003189F    call        user32.SendMessageA
 000318A4    pop         esi
 000318A5    pop         ebx
 000318A6    ret
*}
end;

//000318A8
function ListView_GetEditControl(hwndLV:HWND):HWND;
begin
{*
 000318A8    push        ebx
 000318A9    mov         ebx,eax
 000318AB    push        0
 000318AD    push        0
 000318AF    push        1018
 000318B4    push        ebx
 000318B5    call        user32.SendMessageA
 000318BA    pop         ebx
 000318BB    ret
*}
end;

//000318BC
function ListView_SetColumn(hwnd:HWND; iCol:Integer; const pcol:tagLVCOLUMNA):BOOL;
begin
{*
 000318BC    push        ebx
 000318BD    push        esi
 000318BE    push        edi
 000318BF    mov         edi,ecx
 000318C1    mov         esi,edx
 000318C3    mov         ebx,eax
 000318C5    push        edi
 000318C6    push        esi
 000318C7    push        101A
 000318CC    push        ebx
 000318CD    call        user32.SendMessageA
 000318D2    pop         edi
 000318D3    pop         esi
 000318D4    pop         ebx
 000318D5    ret
*}
end;

//000318D8
function ListView_InsertColumn(hwnd:HWND; iCol:Integer; const pcol:tagLVCOLUMNA):Integer;
begin
{*
 000318D8    push        ecx
 000318D9    push        edx
 000318DA    push        101B
 000318DF    push        eax
 000318E0    call        user32.SendMessageA
 000318E5    ret
*}
end;

//000318E8
function ListView_DeleteColumn(hwnd:HWND; iCol:Integer):BOOL;
begin
{*
 000318E8    push        ebx
 000318E9    push        esi
 000318EA    mov         esi,edx
 000318EC    mov         ebx,eax
 000318EE    push        0
 000318F0    push        esi
 000318F1    push        101C
 000318F6    push        ebx
 000318F7    call        user32.SendMessageA
 000318FC    pop         esi
 000318FD    pop         ebx
 000318FE    ret
*}
end;

//00031900
function ListView_SetColumnWidth(hwnd:HWND; iCol:Integer; cx:Integer):BOOL;
begin
{*
 00031900    push        ebx
 00031901    push        esi
 00031902    push        edi
 00031903    mov         edi,ecx
 00031905    mov         esi,edx
 00031907    mov         ebx,eax
 00031909    xor         edx,edx
 0003190B    mov         eax,edi
 0003190D    call        MakeLong
 00031912    push        eax
 00031913    push        esi
 00031914    push        101E
 00031919    push        ebx
 0003191A    call        user32.SendMessageA
 0003191F    pop         edi
 00031920    pop         esi
 00031921    pop         ebx
 00031922    ret
*}
end;

//00031924
function ListView_CreateDragImage(hwnd:HWND; i:Integer; const lpptUpLeft:TPoint):THandle;
begin
{*
 00031924    push        ebx
 00031925    push        esi
 00031926    push        edi
 00031927    mov         edi,ecx
 00031929    mov         esi,edx
 0003192B    mov         ebx,eax
 0003192D    push        edi
 0003192E    push        esi
 0003192F    push        1021
 00031934    push        ebx
 00031935    call        user32.SendMessageA
 0003193A    pop         edi
 0003193B    pop         esi
 0003193C    pop         ebx
 0003193D    ret
*}
end;

//00031940
function ListView_SetTextColor(hwnd:HWND; clrText:TColorRef):BOOL;
begin
{*
 00031940    push        ebx
 00031941    push        esi
 00031942    mov         esi,edx
 00031944    mov         ebx,eax
 00031946    push        esi
 00031947    push        0
 00031949    push        1024
 0003194E    push        ebx
 0003194F    call        user32.SendMessageA
 00031954    pop         esi
 00031955    pop         ebx
 00031956    ret
*}
end;

//00031958
function ListView_SetTextBkColor(hwnd:HWND; clrTextBk:TColorRef):BOOL;
begin
{*
 00031958    push        ebx
 00031959    push        esi
 0003195A    mov         esi,edx
 0003195C    mov         ebx,eax
 0003195E    push        esi
 0003195F    push        0
 00031961    push        1026
 00031966    push        ebx
 00031967    call        user32.SendMessageA
 0003196C    pop         esi
 0003196D    pop         ebx
 0003196E    ret
*}
end;

//00031970
function ListView_Update(hwndLV:HWND; i:Integer):BOOL;
begin
{*
 00031970    push        ebx
 00031971    push        esi
 00031972    mov         esi,edx
 00031974    mov         ebx,eax
 00031976    push        0
 00031978    push        esi
 00031979    push        102A
 0003197E    push        ebx
 0003197F    call        user32.SendMessageA
 00031984    test        eax,eax
 00031986    setne       al
 00031989    neg         al
 0003198B    sbb         eax,eax
 0003198D    pop         esi
 0003198E    pop         ebx
 0003198F    ret
*}
end;

//00031990
function ListView_SetItemState(hwndLV:HWND; i:Integer; data:UINT; mask:UINT):BOOL;
begin
{*
 00031990    push        ebp
 00031991    mov         ebp,esp
 00031993    add         esp,0FFFFFFD8
 00031996    push        ebx
 00031997    push        esi
 00031998    mov         esi,edx
 0003199A    mov         ebx,eax
 0003199C    mov         eax,dword ptr [ebp+8]
 0003199F    mov         dword ptr [ebp-18],eax
 000319A2    mov         dword ptr [ebp-1C],ecx
 000319A5    lea         eax,[ebp-28]
 000319A8    push        eax
 000319A9    push        esi
 000319AA    push        102B
 000319AF    push        ebx
 000319B0    call        user32.SendMessageA
 000319B5    pop         esi
 000319B6    pop         ebx
 000319B7    mov         esp,ebp
 000319B9    pop         ebp
 000319BA    ret         4
*}
end;

//000319C0
function ListView_GetItemState(hwndLV:HWND; i:Integer; mask:Integer):Integer;
begin
{*
 000319C0    push        ecx
 000319C1    push        edx
 000319C2    push        102C
 000319C7    push        eax
 000319C8    call        user32.SendMessageA
 000319CD    ret
*}
end;

//000319D0
function ListView_GetCheckState(hwndLV:HWND; i:Integer):UINT;
begin
{*
 000319D0    push        ebx
 000319D1    push        esi
 000319D2    mov         esi,edx
 000319D4    mov         ebx,eax
 000319D6    push        0F000
 000319DB    push        esi
 000319DC    push        102C
 000319E1    push        ebx
 000319E2    call        user32.SendMessageA
 000319E7    shr         eax,0C
 000319EA    dec         eax
 000319EB    pop         esi
 000319EC    pop         ebx
 000319ED    ret
*}
end;

//000319F0
procedure ListView_SetCheckState(hwndLV:HWND; i:Integer; Checked:Boolean);
begin
{*
 000319F0    add         esp,0FFFFFFD8
 000319F3    mov         dword ptr [esp+10],0F000
 000319FB    and         ecx,1
 000319FE    inc         ecx
 000319FF    shl         ecx,0C
 00031A02    mov         dword ptr [esp+0C],ecx
 00031A06    mov         ecx,esp
 00031A08    push        ecx
 00031A09    push        edx
 00031A0A    push        102B
 00031A0F    push        eax
 00031A10    call        user32.SendMessageA
 00031A15    add         esp,28
 00031A18    ret
*}
end;

//00031A1C
function ListView_SetItemText(hwndLV:HWND; i:Integer; iSubItem:Integer; pszText:PChar):BOOL;
begin
{*
 00031A1C    push        ebp
 00031A1D    mov         ebp,esp
 00031A1F    add         esp,0FFFFFFD8
 00031A22    push        ebx
 00031A23    push        esi
 00031A24    mov         esi,edx
 00031A26    mov         ebx,eax
 00031A28    mov         dword ptr [ebp-20],ecx
 00031A2B    mov         eax,dword ptr [ebp+8]
 00031A2E    mov         dword ptr [ebp-14],eax
 00031A31    lea         eax,[ebp-28]
 00031A34    push        eax
 00031A35    push        esi
 00031A36    push        102E
 00031A3B    push        ebx
 00031A3C    call        user32.SendMessageA
 00031A41    pop         esi
 00031A42    pop         ebx
 00031A43    mov         esp,ebp
 00031A45    pop         ebp
 00031A46    ret         4
*}
end;

//00031A4C
procedure ListView_SetItemCount(hwndLV:HWND; cItems:Integer);
begin
{*
 00031A4C    push        0
 00031A4E    push        edx
 00031A4F    push        102F
 00031A54    push        eax
 00031A55    call        user32.SendMessageA
 00031A5A    ret
*}
end;

//00031A5C
function ListView_SortItems(hwndLV:HWND; pfnCompare:PFNLVCOMPARE; lPrm:Longint):BOOL;
begin
{*
 00031A5C    push        ebx
 00031A5D    push        esi
 00031A5E    push        edi
 00031A5F    mov         edi,ecx
 00031A61    mov         esi,edx
 00031A63    mov         ebx,eax
 00031A65    push        esi
 00031A66    push        edi
 00031A67    push        1030
 00031A6C    push        ebx
 00031A6D    call        user32.SendMessageA
 00031A72    pop         edi
 00031A73    pop         esi
 00031A74    pop         ebx
 00031A75    ret
*}
end;

//00031A78
function ListView_GetSelectedCount(hwndLV:HWND):UINT;
begin
{*
 00031A78    push        0
 00031A7A    push        0
 00031A7C    push        1032
 00031A81    push        eax
 00031A82    call        user32.SendMessageA
 00031A87    ret
*}
end;

//00031A88
function ListView_SetExtendedListViewStyle(hwndLV:HWND; dw:DWORD):BOOL;
begin
{*
 00031A88    push        ebx
 00031A89    push        esi
 00031A8A    mov         esi,edx
 00031A8C    mov         ebx,eax
 00031A8E    push        esi
 00031A8F    push        0
 00031A91    push        1036
 00031A96    push        ebx
 00031A97    call        user32.SendMessageA
 00031A9C    pop         esi
 00031A9D    pop         ebx
 00031A9E    ret
*}
end;

//00031AA0
function ListView_GetExtendedListViewStyle(hwndLV:HWND):DWORD;
begin
{*
 00031AA0    push        0
 00031AA2    push        0
 00031AA4    push        1037
 00031AA9    push        eax
 00031AAA    call        user32.SendMessageA
 00031AAF    ret
*}
end;

//00031AB0
function ListView_GetColumnOrderArray(hwndLV:HWND; iCount:Integer; pi:PInteger):BOOL;
begin
{*
 00031AB0    push        ebx
 00031AB1    push        esi
 00031AB2    push        edi
 00031AB3    mov         edi,ecx
 00031AB5    mov         esi,edx
 00031AB7    mov         ebx,eax
 00031AB9    push        edi
 00031ABA    push        esi
 00031ABB    push        103B
 00031AC0    push        ebx
 00031AC1    call        user32.SendMessageA
 00031AC6    pop         edi
 00031AC7    pop         esi
 00031AC8    pop         ebx
 00031AC9    ret
*}
end;

end.