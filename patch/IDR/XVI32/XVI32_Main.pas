//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit XVI32_Main;

interface

uses
  SysUtils, Classes, ComCtrls, ExtCtrls, Menus, CMGrid, Cmbtn40, CMiVCL, CMScroll;

type
  TFormMain = class(TForm)
  published
    StatusBar1:TStatusBar;//f2C4
    Panel1:TPanel;//f2C8
    MainMenu1:TMainMenu;//f2CC
    File1:TMenuItem;//f2D0
    Edit1:TMenuItem;//f2D4
    Search1:TMenuItem;//f2D8
    Address1:TMenuItem;//f2DC
    Tools1:TMenuItem;//f2E0
    Help1:TMenuItem;//f2E4
    Open1:TMenuItem;//f2E8
    Save1:TMenuItem;//f2EC
    SaveAs1:TMenuItem;//f2F0
    Exit1:TMenuItem;//f2F4
    Info1:TMenuItem;//f2F8
    ModusText1:TMenuItem;//f2FC
    ModusOverwrite1:TMenuItem;//f300
    N3:TMenuItem;//f304
    Reopen1:TMenuItem;//f308
    N4:TMenuItem;//f30C
    CMStrGridText:TCMStrGrid;//f310
    CMStrGridHex:TCMStrGrid;//f314
    Blockmark1:TMenuItem;//f318
    Blockunmark1:TMenuItem;//f31C
    Blocknchars1:TMenuItem;//f320
    Blockdelete1:TMenuItem;//f324
    Blockcopy1:TMenuItem;//f328
    Blockmove1:TMenuItem;//f32C
    N5:TMenuItem;//f330
    Deletefromcursor1:TMenuItem;//f334
    Deletetocursor1:TMenuItem;//f338
    Goto1:TMenuItem;//f33C
    N1:TMenuItem;//f340
    Close1:TMenuItem;//f344
    N6:TMenuItem;//f348
    Jumpwidth1:TMenuItem;//f34C
    Jumpdown1:TMenuItem;//f350
    Jumpup1:TMenuItem;//f354
    N7:TMenuItem;//f358
    Rememberaddress1:TMenuItem;//f35C
    Gotoremembered1:TMenuItem;//f360
    Displaydifference1:TMenuItem;//f364
    N8:TMenuItem;//f368
    Options1:TMenuItem;//f36C
    Decode1:TMenuItem;//f370
    Encode1:TMenuItem;//f374
    N9:TMenuItem;//f378
    Find1:TMenuItem;//f37C
    Findagaindown1:TMenuItem;//f380
    Findagainup1:TMenuItem;//f384
    Count1:TMenuItem;//f388
    N10:TMenuItem;//f38C
    Replace1:TMenuItem;//f390
    Replaceagaindown1:TMenuItem;//f394
    Replaceundo1:TMenuItem;//f398
    CMBtnOpen:TCMBtn;//f39C
    CMBtnSave:TCMBtn;//f3A0
    Patch1:TMenuItem;//f3A4
    Blockcopyovwr1:TMenuItem;//f3A8
    Insert1:TMenuItem;//f3AC
    N11:TMenuItem;//f3B0
    New1:TMenuItem;//f3B4
    CMBtnNew:TCMBtn;//f3B8
    Insertfile1:TMenuItem;//f3BC
    N2:TMenuItem;//f3C0
    Writeblock1:TMenuItem;//f3C4
    CMBtnFind:TCMBtn;//f3C8
    CMBtnReplace:TCMBtn;//f3CC
    CMBtnInfo:TCMBtn;//f3D0
    CMBtnWhats:TCMBtn;//f3D4
    Clipboard1:TMenuItem;//f3D8
    N13:TMenuItem;//f3DC
    Cut1:TMenuItem;//f3E0
    Copy1:TMenuItem;//f3E4
    Paste1:TMenuItem;//f3E8
    CMBtnCut:TCMBtn;//f3EC
    CMBtnCopy:TCMBtn;//f3F0
    CMBtnPaste:TCMBtn;//f3F4
    N14:TMenuItem;//f3F8
    CMBtnDel:TCMBtn;//f3FC
    Contents1:TMenuItem;//f400
    Charconversion1:TMenuItem;//f404
    N12:TMenuItem;//f408
    Copyhex1:TMenuItem;//f40C
    Print1:TMenuItem;//f410
    N15:TMenuItem;//f414
    CMBtnOptions:TCMBtn;//f418
    Bitmanipulation1:TMenuItem;//f41C
    CMStrGridAddr:TCMStrGrid;//f420
    Overwritestring1:TMenuItem;//f424
    Pastefromhexstring1:TMenuItem;//f428
    Bookmarks1:TMenuItem;//f42C
    Add1:TMenuItem;//f430
    Remove1:TMenuItem;//f434
    Removeall1:TMenuItem;//f438
    Bookmarkdivi:TMenuItem;//f43C
    Bookmark1:TMenuItem;//f440
    Bookmark2:TMenuItem;//f444
    Bookmark3:TMenuItem;//f448
    Bookmark4:TMenuItem;//f44C
    Bookmark5:TMenuItem;//f450
    Bookmark6:TMenuItem;//f454
    Bookmark7:TMenuItem;//f458
    Bookmark8:TMenuItem;//f45C
    Bookmark9:TMenuItem;//f460
    N16:TMenuItem;//f464
    Savetofile1:TMenuItem;//f468
    Loadfromfile1:TMenuItem;//f46C
    Script1:TMenuItem;//f470
    Editor1:TMenuItem;//f474
    Executeactive1:TMenuItem;//f478
    DataInspector1:TMenuItem;//f47C
    CalculateCRC321:TMenuItem;//f480
    Reload1:TMenuItem;//f484
    Donate1:TMenuItem;//f488
    Shredderdata1:TMenuItem;//f48C
    procedure Copyhex1Click(Sender:TObject);//000B2790
    procedure FormDestroy(Sender:TObject);//000AB020
    procedure Contents1Click(Sender:TObject);//000B2514
    procedure Charconversion1Click(Sender:TObject);//000B269C
    procedure Print1Click(Sender:TObject);//000B29F4
    procedure Tools1Click(Sender:TObject);//000B2D74
    procedure File1Click(Sender:TObject);//000B2CE0
    procedure FormMouseDown(Sender:TObject; Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);//000B2ACC
    procedure Bitmanipulation1Click(Sender:TObject);//000B2C50
    procedure Paste1Click(Sender:TObject);//000B20D4
    procedure Patch1Click(Sender:TObject);//000B1640
    procedure Insert1Click(Sender:TObject);//000B1834
    procedure Replaceagaindown1Click(Sender:TObject);//000B10FC
    procedure Replaceundo1Click(Sender:TObject);//000B15EC
    procedure New1Click(Sender:TObject);//000AD3E8
    procedure CMBtnWhatsClick;//000B24F4
    procedure Cut1Click(Sender:TObject);//000B1E34
    procedure Insertfile1Click(Sender:TObject);//000B1B8C
    procedure Writeblock1Click(Sender:TObject);//000B1D5C
    procedure Executeactive1Click(Sender:TObject);//000B356C
    procedure Script1Click(Sender:TObject);//000B35B0
    procedure Bookmarks1Click(Sender:TObject);//000B351C
    procedure Editor1Click(Sender:TObject);//000B3534
    procedure DataInspector1Click(Sender:TObject);//000B35EC
    procedure Donate1Click(Sender:TObject);//000B396C
    procedure Shredderdata1Click(Sender:TObject);//000B171C
    procedure CalculateCRC321Click(Sender:TObject);//000B3620
    procedure Reload1Click(Sender:TObject);//000B393C
    procedure Loadfromfile1Click(Sender:TObject);//000B3448
    procedure Overwritestring1Click(Sender:TObject);//000B19BC
    procedure Pastefromhexstring1Click(Sender:TObject);//000B22A4
    procedure Edit1Click(Sender:TObject);//000B2CF8
    procedure Address1Click(Sender:TObject);//000B2D2C
    procedure Add1Click(Sender:TObject);//000B3140
    procedure BookmarkClick(Sender:TObject);//000B302C
    procedure Savetofile1Click(Sender:TObject);//000B3378
    procedure Remove1Click(Sender:TObject);//000B3260
    procedure Removeall1Click(Sender:TObject);//000B3360
    procedure Replace1Click(Sender:TObject);//000B12B8
    procedure CMStrGridTextKeyUp(Sender:TObject; var Key:Word; Shift:TShiftState);//000AEEB4
    procedure Save1Click(Sender:TObject);//000AF1F0
    //procedure CMStrGridTextHexDrawCell(?:?; ?:?; ?:?);//000AF124
    //procedure CMStrGridTextHexSelectCell(?:TCMStrGrid; ?:TMouseButton; ?:?; ?:?);//000AF020
    //procedure ScrollBar1Scroll(?:?; ?:?; ?:?);//000AE758
    procedure Deletetocursor1Click(Sender:TObject);//000AF508
    procedure Blockdelete1Click(Sender:TObject);//000AF510
    procedure Deletefromcursor1Click(Sender:TObject);//000AF500
    procedure Blockunmark1Click(Sender:TObject);//000AF4D8
    procedure Blockmark1Click(Sender:TObject);//000AF4E0
    procedure Info1Click(Sender:TObject);//000AD028
    procedure Exit1Click(Sender:TObject);//000AE5D4
    procedure ModusOverwrite1Click(Sender:TObject);//000AD624
    procedure Open1Click(Sender:TObject);//000AD4B4
    procedure FormCreate(Sender:TObject);//000AA870
    procedure CMStrGridTextKeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);//000AE998
    procedure CMStrGridTextKeyPress(Sender:TObject; var Key:Char);//000AEEFC
    procedure ModusText1Click(Sender:TObject);//000AE5DC
    procedure FormCloseQuery(Sender:TObject; var CanClose:Boolean);//000AB07C
    procedure FormActivate(Sender:TObject);//000AAE08
    procedure Options1Click(Sender:TObject);//000B05D8
    procedure Decode1Click(Sender:TObject);//000AD6E8
    procedure FormClose(Sender:TObject; var Action:TCloseAction);//000AB044
    procedure Displaydifference1Click(Sender:TObject);//000AF968
    procedure FormResize(Sender:TObject);//000ACA60
    procedure Findagainup1Click(Sender:TObject);//000B070C
    procedure Count1Click(Sender:TObject);//000B0B64
    procedure Findagaindown1Click(Sender:TObject);//000B05E4
    procedure Encode1Click(Sender:TObject);//000ADC64
    procedure Find1Click(Sender:TObject);//000B0834
    procedure SaveAs1Click(Sender:TObject);//000AF2DC
    procedure Close1Click(Sender:TObject);//000AF398
    procedure Blockcopy1Click(Sender:TObject);//000AFA94
    procedure Goto1Click(Sender:TObject);//000AF660
    procedure Blocknchars1Click(Sender:TObject);//000AF518
    procedure Gotoremembered1Click(Sender:TObject);//000AF8F0
    procedure Rememberaddress1Click(Sender:TObject);//000AF8B8
    procedure Jumpup1Click(Sender:TObject);//000AF844
    procedure Jumpwidth1Click(Sender:TObject);//000AF70C
    procedure Jumpdown1Click(Sender:TObject);//000AF7CC
  public
    f490:TMRUFiles;//f490
    f494:TFileDrop;//f494
    f498:byte;//f498
    f49C:HWND;//f49C
    f4A0:TStringList;//f4A0
    f4A4:TMenuItem;//f4A4
    f4A8:TMenuItem;//f4A8
    f4AC:TMenuItem;//f4AC
    f4B0:TMenuItem;//f4B0
    f4B4:TMenuItem;//f4B4
    f4B8:TMenuItem;//f4B8
    f4BC:TMenuItem;//f4BC
    f4C0:TMenuItem;//f4C0
    f4C4:TMenuItem;//f4C4
    f4C8:TCMScrollBar;//f4C8
    procedure WMDrawClipboard; message WM_DRAWCLIPBOARD;//000AA7B4
    //procedure WMChangeCBChain(?:?); message WM_CHANGECBCHAIN;//000AA828
  end;
    procedure WMDrawClipboard;//000AA7B4
    //procedure WMChangeCBChain(?:?);//000AA828
    //function sub_000AB134(?:TFormMain; ?:Longint):?;//000AB134
    //function sub_000AB1AC(?:TFormMain; ?:Longint):?;//000AB1AC
    //function sub_000AB204(?:TFormMain; ?:Integer):?;//000AB204
    //function sub_000AB2BC(?:TFormMain; ?:Integer):?;//000AB2BC
    procedure sub_000AB324(?:TFormMain);//000AB324
    procedure sub_000ABF90(?:TFormMain);//000ABF90
    procedure sub_000AC990(?:TFormMain);//000AC990
    procedure sub_000ACAC4(?:TFormMain);//000ACAC4
    //procedure sub_000ACD9C(?:TFormMain; ?:TObject; ?:?);//000ACD9C
    //function sub_000AD130(?:TFormMain; ?:?):?;//000AD130
    //function sub_000AD234(?:TFormMain):?;//000AD234
    //procedure sub_000AD998(?:TFormMain; ?:?);//000AD998
    //procedure sub_000ADC6C(?:TMenuItem; ?:?);//000ADC6C
    procedure sub_000ADCB0(?:TFormMain);//000ADCB0
    procedure sub_000ADD3C(?:TFormMain; ?:Integer);//000ADD3C
    //procedure sub_000AE098(?:TFormMain; ?:?);//000AE098
    //procedure sub_000AE0E8(?:TFormMain; ?:Longint; ?:?);//000AE0E8
    //procedure sub_000AE344(?:TFormMain; ?:?; ?:?);//000AE344
    //procedure sub_000AE3E4(?:TFormMain; ?:?; ?:?);//000AE3E4
    //procedure sub_000AE518(?:TFormMain; ?:?);//000AE518
    procedure sub_000AE7EC(?:TFormMain; ?:Char);//000AE7EC
    procedure sub_000AE914;//000AE914
    procedure sub_000AE970;//000AE970
    //procedure sub_000AFCA4(?:TFormMain; ?:?);//000AFCA4
    //procedure sub_000B0F40(?:TFormMain; ?:TObject; ?:?; ?:?);//000B0F40
    //procedure sub_000B1138(?:?);//000B1138
    //procedure sub_000B2070(?:?);//000B2070
    procedure sub_000B23E4(?:TFormMain);//000B23E4
    //function sub_000B25B4(?:?; ?:?; ?:?; ?:?):?;//000B25B4
    procedure sub_000B2DE8(?:TFormMain);//000B2DE8

implementation

{$R *.DFM}

//000AA7B4
procedure TFormMain.WMDrawClipboard;
begin
{*
 000AA7B4    push        ebx
 000AA7B5    mov         ebx,eax
 000AA7B7    mov         eax,[000B5618];^gvar_000B6B74:Longword
 000AA7BC    movzx       eax,word ptr [eax]
 000AA7BF    push        eax
 000AA7C0    call        user32.IsClipboardFormatAvailable
 000AA7C5    test        eax,eax
>000AA7C7    jne         000AA7D8
 000AA7C9    push        1
 000AA7CB    call        user32.IsClipboardFormatAvailable
 000AA7D0    test        eax,eax
>000AA7D2    jne         000AA7D8
 000AA7D4    xor         edx,edx
>000AA7D6    jmp         000AA7DA
 000AA7D8    mov         dl,1
 000AA7DA    mov         eax,dword ptr [ebx+3E8];TFormMain.Paste1:TMenuItem
 000AA7E0    call        TMenuItem.SetEnabled
 000AA7E5    mov         eax,dword ptr [ebx+3E8];TFormMain.Paste1:TMenuItem
 000AA7EB    mov         dl,byte ptr [eax+2D];TMenuItem.Enabled:Boolean
 000AA7EE    mov         eax,dword ptr [ebx+3F4];TFormMain.CMBtnPaste:TCMBtn
 000AA7F4    call        TCMBtn.SetEnabled
 000AA7F9    push        1
 000AA7FB    call        user32.IsClipboardFormatAvailable
 000AA800    neg         eax
 000AA802    sbb         edx,edx
 000AA804    neg         edx
 000AA806    mov         eax,dword ptr [ebx+428];TFormMain.Pastefromhexstring1:TMenuItem
 000AA80C    call        TMenuItem.SetEnabled
 000AA811    push        0
 000AA813    push        0
 000AA815    push        308
 000AA81A    mov         eax,dword ptr [ebx+49C];TFormMain.?f49C:HWND
 000AA820    push        eax
 000AA821    call        user32.SendMessageA
 000AA826    pop         ebx
 000AA827    ret
*}
end;

//000AA828
{*procedure TFormMain.WMChangeCBChain(?:?);
begin
 000AA828    push        ebx
 000AA829    push        esi
 000AA82A    push        edi
 000AA82B    mov         ebx,edx
 000AA82D    mov         ecx,eax
 000AA82F    mov         edi,dword ptr [ebx+4]
 000AA832    mov         eax,edi
 000AA834    cdq
 000AA835    push        edx
 000AA836    push        eax
 000AA837    mov         esi,dword ptr [ecx+49C];TFormMain.?f49C:HWND
 000AA83D    mov         eax,esi
 000AA83F    xor         edx,edx
 000AA841    cmp         edx,dword ptr [esp+4]
>000AA845    jne         000AA84A
 000AA847    cmp         eax,dword ptr [esp]
 000AA84A    pop         edx
 000AA84B    pop         eax
>000AA84C    jne         000AA859
 000AA84E    mov         eax,dword ptr [ebx+8]
 000AA851    mov         dword ptr [ecx+49C],eax;TFormMain.?f49C:HWND
>000AA857    jmp         000AA869
 000AA859    mov         eax,dword ptr [ebx+8]
 000AA85C    push        eax
 000AA85D    push        edi
 000AA85E    push        30D
 000AA863    push        esi
 000AA864    call        user32.SendMessageA
 000AA869    pop         edi
 000AA86A    pop         esi
 000AA86B    pop         ebx
 000AA86C    ret
end;*}

//000AA870
procedure TFormMain.FormCreate(Sender:TObject);
begin
{*
 000AA870    push        ebp
 000AA871    mov         ebp,esp
 000AA873    add         esp,0FFFFFEBC
 000AA879    push        ebx
 000AA87A    push        esi
 000AA87B    push        edi
 000AA87C    xor         ecx,ecx
 000AA87E    mov         dword ptr [ebp-4],ecx
 000AA881    mov         dword ptr [ebp-8],ecx
 000AA884    mov         dword ptr [ebp-144],ecx
 000AA88A    mov         edi,edx
 000AA88C    mov         ebx,eax
 000AA88E    mov         esi,dword ptr ds:[0B5950];^HInstance:Longword
 000AA894    xor         eax,eax
 000AA896    push        ebp
 000AA897    push        0AAD81
 000AA89C    push        dword ptr fs:[eax]
 000AA89F    mov         dword ptr fs:[eax],esp
 000AA8A2    mov         eax,[000B5A1C];^gvar_000B7009
 000AA8A7    mov         byte ptr [eax],0
 000AA8AA    mov         dl,1
 000AA8AC    mov         eax,[0001F340];TStringList
 000AA8B1    call        TObject.Create;TStringList.Create
 000AA8B6    mov         dword ptr [ebx+4A0],eax;TFormMain.?f4A0:TStringList
 000AA8BC    mov         eax,dword ptr [ebx+440];TFormMain.Bookmark1:TMenuItem
 000AA8C2    mov         dword ptr [ebx+4A4],eax;TFormMain.?f4A4:TMenuItem
 000AA8C8    mov         eax,dword ptr [ebx+444];TFormMain.Bookmark2:TMenuItem
 000AA8CE    mov         dword ptr [ebx+4A8],eax;TFormMain.?f4A8:TMenuItem
 000AA8D4    mov         eax,dword ptr [ebx+448];TFormMain.Bookmark3:TMenuItem
 000AA8DA    mov         dword ptr [ebx+4AC],eax;TFormMain.?f4AC:TMenuItem
 000AA8E0    mov         eax,dword ptr [ebx+44C];TFormMain.Bookmark4:TMenuItem
 000AA8E6    mov         dword ptr [ebx+4B0],eax;TFormMain.?f4B0:TMenuItem
 000AA8EC    mov         eax,dword ptr [ebx+450];TFormMain.Bookmark5:TMenuItem
 000AA8F2    mov         dword ptr [ebx+4B4],eax;TFormMain.?f4B4:TMenuItem
 000AA8F8    mov         eax,dword ptr [ebx+454];TFormMain.Bookmark6:TMenuItem
 000AA8FE    mov         dword ptr [ebx+4B8],eax;TFormMain.?f4B8:TMenuItem
 000AA904    mov         eax,dword ptr [ebx+458];TFormMain.Bookmark7:TMenuItem
 000AA90A    mov         dword ptr [ebx+4BC],eax;TFormMain.?f4BC:TMenuItem
 000AA910    mov         eax,dword ptr [ebx+45C];TFormMain.Bookmark8:TMenuItem
 000AA916    mov         dword ptr [ebx+4C0],eax;TFormMain.?f4C0:TMenuItem
 000AA91C    mov         eax,dword ptr [ebx+460];TFormMain.Bookmark9:TMenuItem
 000AA922    mov         dword ptr [ebx+4C4],eax;TFormMain.?f4C4:TMenuItem
 000AA928    mov         eax,ebx
 000AA92A    call        000B2DE8
 000AA92F    mov         eax,ebx
 000AA931    call        TWinControl.GetHandle
 000AA936    push        eax
 000AA937    call        user32.SetClipboardViewer
 000AA93C    mov         dword ptr [ebx+49C],eax;TFormMain.?f49C:HWND
 000AA942    lea         edx,[ebp-8]
 000AA945    mov         eax,[000B59E8];^Application:TApplication
 000AA94A    mov         eax,dword ptr [eax]
 000AA94C    call        TApplication.GetExeName
 000AA951    mov         eax,dword ptr [ebp-8]
 000AA954    lea         edx,[ebp-4]
 000AA957    call        ExtractFilePath
 000AA95C    mov         edx,dword ptr [ebp-4]
 000AA95F    mov         eax,[000B59E8];^Application:TApplication
 000AA964    mov         eax,dword ptr [eax]
 000AA966    add         eax,38;TApplication.FHelpFile:String
 000AA969    mov         ecx,0AAD98;'XVI32U.HLP'
 000AA96E    call        @LStrCat3
 000AA973    mov         eax,[000B59E8];^Application:TApplication
 000AA978    mov         eax,dword ptr [eax]
 000AA97A    mov         dword ptr [eax+0DC],ebx;TApplication.?fDC:TFormMain
 000AA980    mov         dword ptr [eax+0D8],0B25B4;TApplication.FOnHelp:THelpEvent sub_000B25B4
 000AA98A    mov         eax,dword ptr [ebx+2C8];TFormMain.Panel1:TPanel
 000AA990    mov         eax,dword ptr [eax+3C];TPanel.Height:Integer
 000AA993    mov         edx,dword ptr ds:[0B5C18];^gvar_000B6BD0:Integer
 000AA999    mov         dword ptr [edx],eax
 000AA99B    push        0AADA4;'NEW'
 000AA9A0    mov         eax,dword ptr [esi]
 000AA9A2    push        eax
 000AA9A3    call        user32.LoadBitmapA
 000AA9A8    mov         edx,eax
 000AA9AA    mov         eax,dword ptr [ebx+3B8];TFormMain.CMBtnNew:TCMBtn
 000AA9B0    mov         eax,dword ptr [eax+20C];TCMBtn.Glyph:TBitmap
 000AA9B6    call        TBitmap.SetHandle
 000AA9BB    push        0AADA8;'OPEN'
 000AA9C0    mov         eax,dword ptr [esi]
 000AA9C2    push        eax
 000AA9C3    call        user32.LoadBitmapA
 000AA9C8    mov         edx,eax
 000AA9CA    mov         eax,dword ptr [ebx+39C];TFormMain.CMBtnOpen:TCMBtn
 000AA9D0    mov         eax,dword ptr [eax+20C];TCMBtn.Glyph:TBitmap
 000AA9D6    call        TBitmap.SetHandle
 000AA9DB    push        0AADB0;'SAVE'
 000AA9E0    mov         eax,dword ptr [esi]
 000AA9E2    push        eax
 000AA9E3    call        user32.LoadBitmapA
 000AA9E8    mov         edx,eax
 000AA9EA    mov         eax,dword ptr [ebx+3A0];TFormMain.CMBtnSave:TCMBtn
 000AA9F0    mov         eax,dword ptr [eax+20C];TCMBtn.Glyph:TBitmap
 000AA9F6    call        TBitmap.SetHandle
 000AA9FB    push        0AADB8;'DELETE'
 000AAA00    mov         eax,dword ptr [esi]
 000AAA02    push        eax
 000AAA03    call        user32.LoadBitmapA
 000AAA08    mov         edx,eax
 000AAA0A    mov         eax,dword ptr [ebx+3FC];TFormMain.CMBtnDel:TCMBtn
 000AAA10    mov         eax,dword ptr [eax+20C];TCMBtn.Glyph:TBitmap
 000AAA16    call        TBitmap.SetHandle
 000AAA1B    push        0AADC0;'CUT'
 000AAA20    mov         eax,dword ptr [esi]
 000AAA22    push        eax
 000AAA23    call        user32.LoadBitmapA
 000AAA28    mov         edx,eax
 000AAA2A    mov         eax,dword ptr [ebx+3EC];TFormMain.CMBtnCut:TCMBtn
 000AAA30    mov         eax,dword ptr [eax+20C];TCMBtn.Glyph:TBitmap
 000AAA36    call        TBitmap.SetHandle
 000AAA3B    push        0AADC4;'COPY'
 000AAA40    mov         eax,dword ptr [esi]
 000AAA42    push        eax
 000AAA43    call        user32.LoadBitmapA
 000AAA48    mov         edx,eax
 000AAA4A    mov         eax,dword ptr [ebx+3F0];TFormMain.CMBtnCopy:TCMBtn
 000AAA50    mov         eax,dword ptr [eax+20C];TCMBtn.Glyph:TBitmap
 000AAA56    call        TBitmap.SetHandle
 000AAA5B    push        0AADCC;'PASTE'
 000AAA60    mov         eax,dword ptr [esi]
 000AAA62    push        eax
 000AAA63    call        user32.LoadBitmapA
 000AAA68    mov         edx,eax
 000AAA6A    mov         eax,dword ptr [ebx+3F4];TFormMain.CMBtnPaste:TCMBtn
 000AAA70    mov         eax,dword ptr [eax+20C];TCMBtn.Glyph:TBitmap
 000AAA76    call        TBitmap.SetHandle
 000AAA7B    push        0AADD4;'FIND'
 000AAA80    mov         eax,dword ptr [esi]
 000AAA82    push        eax
 000AAA83    call        user32.LoadBitmapA
 000AAA88    mov         edx,eax
 000AAA8A    mov         eax,dword ptr [ebx+3C8];TFormMain.CMBtnFind:TCMBtn
 000AAA90    mov         eax,dword ptr [eax+20C];TCMBtn.Glyph:TBitmap
 000AAA96    call        TBitmap.SetHandle
 000AAA9B    push        0AADDC;'REPLACE'
 000AAAA0    mov         eax,dword ptr [esi]
 000AAAA2    push        eax
 000AAAA3    call        user32.LoadBitmapA
 000AAAA8    mov         edx,eax
 000AAAAA    mov         eax,dword ptr [ebx+3CC];TFormMain.CMBtnReplace:TCMBtn
 000AAAB0    mov         eax,dword ptr [eax+20C];TCMBtn.Glyph:TBitmap
 000AAAB6    call        TBitmap.SetHandle
 000AAABB    push        0AADE4;'PROPERT'
 000AAAC0    mov         eax,dword ptr [esi]
 000AAAC2    push        eax
 000AAAC3    call        user32.LoadBitmapA
 000AAAC8    mov         edx,eax
 000AAACA    mov         eax,dword ptr [ebx+418];TFormMain.CMBtnOptions:TCMBtn
 000AAAD0    mov         eax,dword ptr [eax+20C];TCMBtn.Glyph:TBitmap
 000AAAD6    call        TBitmap.SetHandle
 000AAADB    push        0AADEC;'INFO'
 000AAAE0    mov         eax,dword ptr [esi]
 000AAAE2    push        eax
 000AAAE3    call        user32.LoadBitmapA
 000AAAE8    mov         edx,eax
 000AAAEA    mov         eax,dword ptr [ebx+3D0];TFormMain.CMBtnInfo:TCMBtn
 000AAAF0    mov         eax,dword ptr [eax+20C];TCMBtn.Glyph:TBitmap
 000AAAF6    call        TBitmap.SetHandle
 000AAAFB    push        0AADF4;'WHATS'
 000AAB00    mov         eax,dword ptr [esi]
 000AAB02    push        eax
 000AAB03    call        user32.LoadBitmapA
 000AAB08    mov         edx,eax
 000AAB0A    mov         eax,dword ptr [ebx+3D4];TFormMain.CMBtnWhats:TCMBtn
 000AAB10    mov         eax,dword ptr [eax+20C];TCMBtn.Glyph:TBitmap
 000AAB16    call        TBitmap.SetHandle
 000AAB1B    lea         edx,[ebp-8]
 000AAB1E    mov         eax,[000B59E8];^Application:TApplication
 000AAB23    mov         eax,dword ptr [eax]
 000AAB25    call        TApplication.GetExeName
 000AAB2A    mov         eax,dword ptr [ebp-8]
 000AAB2D    lea         edx,[ebp-4]
 000AAB30    call        0009034C
 000AAB35    mov         edx,dword ptr [ebp-4]
 000AAB38    lea         eax,[ebp-108]
 000AAB3E    mov         ecx,0FF
 000AAB43    call        @LStrToString
 000AAB48    lea         edx,[ebp-108]
 000AAB4E    mov         eax,[000B5998];^gvar_000B6AF8:ShortString
 000AAB53    mov         cl,8
 000AAB55    call        @PStrNCpy
 000AAB5A    mov         ecx,ebx
 000AAB5C    mov         dl,1
 000AAB5E    mov         eax,[0008BBB0];TCMScrollBar
 000AAB63    call        TCMScrollBar.Create;TCMScrollBar.Create
 000AAB68    mov         esi,eax
 000AAB6A    mov         dword ptr [ebx+4C8],esi;TFormMain.?f4C8:TCMScrollBar
 000AAB70    mov         edx,ebx
 000AAB72    mov         eax,esi
 000AAB74    mov         ecx,dword ptr [eax]
 000AAB76    call        dword ptr [ecx+64];TControl.SetParent
 000AAB79    mov         dl,1
 000AAB7B    mov         eax,esi
 000AAB7D    call        TCMScrollBar.SetKind
 000AAB82    xor         edx,edx
 000AAB84    mov         eax,esi
 000AAB86    call        TWinControl.SetTabStop
 000AAB8B    mov         edx,2E9
 000AAB90    mov         eax,esi
 000AAB92    call        TControl.SetLeft
 000AAB97    mov         edx,1B
 000AAB9C    mov         eax,esi
 000AAB9E    call        TControl.SetTop
 000AABA3    mov         edx,14E
 000AABA8    mov         eax,esi
 000AABAA    call        TControl.SetHeight
 000AABAF    mov         dword ptr [esi+214],ebx;TCMScrollBar.?f214:TFormMain
 000AABB5    mov         dword ptr [esi+210],0AE758;TCMScrollBar.OnScroll:TScrollEvent TFormMain.ScrollBar1Scroll
 000AABBF    mov         eax,ebx
 000AABC1    call        00087964
 000AABC6    mov         eax,[000B59E8];^Application:TApplication
 000AABCB    mov         eax,dword ptr [eax]
 000AABCD    mov         dword ptr [eax+0E4],ebx;TApplication.?fE4:TFormMain
 000AABD3    mov         dword ptr [eax+0E0],0AB06C;TApplication.FOnHint:TNotifyEvent
 000AABDD    lea         edx,[ebp-4]
 000AABE0    mov         eax,7DF
 000AABE5    call        LoadStr;'Insert'
 000AABEA    mov         eax,dword ptr [ebp-4]
 000AABED    push        eax
 000AABEE    mov         eax,dword ptr [ebx+2C4];TFormMain.StatusBar1:TStatusBar
 000AABF4    mov         eax,dword ptr [eax+1EC];TStatusBar.Panels:TStatusPanels
 000AABFA    mov         edx,2
 000AABFF    call        TCoolBands.GetItem
 000AAC04    pop         edx
 000AAC05    call        TStatusPanel.SetText
 000AAC0A    mov         ecx,ebx
 000AAC0C    mov         dl,1
 000AAC0E    mov         eax,[00088190];TMRUFiles
 000AAC13    call        TMRUFiles.Create;TMRUFiles.Create
 000AAC18    mov         esi,eax
 000AAC1A    mov         dword ptr [ebx+490],esi;TFormMain.?f490:TMRUFiles
 000AAC20    mov         edx,ebx
 000AAC22    mov         eax,ebx
 000AAC24    mov         ecx,dword ptr [eax]
 000AAC26    call        dword ptr [ecx+64];TCustomForm.SetParent
 000AAC29    mov         dword ptr [esi+44],ebx;TMRUFiles.?f44:TFormMain
 000AAC2C    mov         dword ptr [esi+40],0ACD9C;TMRUFiles.OnMRUItemClick:TMRUClick sub_000ACD9C
 000AAC33    mov         edx,dword ptr [ebx+308];TFormMain.Reopen1:TMenuItem
 000AAC39    mov         eax,esi
 000AAC3B    call        TMRUFiles.SetFileMenu
 000AAC40    mov         ecx,ebx
 000AAC42    mov         dl,1
 000AAC44    mov         eax,[0008837C];TFileDrop
 000AAC49    call        TFileDrop.Create;TFileDrop.Create
 000AAC4E    mov         esi,eax
 000AAC50    mov         dword ptr [ebx+494],esi;TFormMain.?f494:TFileDrop
 000AAC56    mov         dword ptr [esi+3C],ebx;TFileDrop.?f3C:TFormMain
 000AAC59    mov         dword ptr [esi+38],0AB094;TFileDrop.OnDrop:TNotifyEvent
 000AAC60    xor         eax,eax
 000AAC62    mov         dword ptr [ebp-138],eax
 000AAC68    mov         byte ptr [ebp-134],0
 000AAC6F    lea         eax,[ebp-4]
 000AAC72    push        eax
 000AAC73    mov         eax,0AADFC
 000AAC78    mov         dword ptr [ebp-140],eax
 000AAC7E    mov         byte ptr [ebp-13C],3
 000AAC85    lea         edx,[ebp-140]
 000AAC8B    xor         ecx,ecx
 000AAC8D    mov         eax,7DD
 000AAC92    call        FmtLoadStr;'Adr. dec: %.0n'
 000AAC97    mov         eax,dword ptr [ebp-4]
 000AAC9A    mov         dword ptr [ebp-130],eax
 000AACA0    mov         byte ptr [ebp-12C],0B
 000AACA7    mov         dword ptr [ebp-128],1
 000AACB1    mov         byte ptr [ebp-124],0
 000AACB8    lea         eax,[ebp-8]
 000AACBB    push        eax
 000AACBC    mov         dword ptr [ebp-140],0FF
 000AACC6    mov         byte ptr [ebp-13C],0
 000AACCD    lea         edx,[ebp-140]
 000AACD3    xor         ecx,ecx
 000AACD5    mov         eax,7DE
 000AACDA    call        FmtLoadStr;'Char dec: %d'
 000AACDF    mov         eax,dword ptr [ebp-8]
 000AACE2    mov         dword ptr [ebp-120],eax
 000AACE8    mov         byte ptr [ebp-11C],0B
 000AACEF    mov         dword ptr [ebp-118],2
 000AACF9    mov         byte ptr [ebp-114],0
 000AAD00    lea         edx,[ebp-144]
 000AAD06    mov         eax,7E0
 000AAD0B    call        LoadStr;'Overwrite'
 000AAD10    mov         eax,dword ptr [ebp-144]
 000AAD16    mov         dword ptr [ebp-110],eax
 000AAD1C    mov         byte ptr [ebp-10C],0B
 000AAD23    lea         edx,[ebp-138]
 000AAD29    mov         ecx,5
 000AAD2E    mov         eax,dword ptr [ebx+2C4];TFormMain.StatusBar1:TStatusBar
 000AAD34    call        00087AEC
 000AAD39    mov         eax,[000B5988];^gvar_000B6BE9
 000AAD3E    mov         byte ptr [eax],0
 000AAD41    mov         eax,[000B581C];^gvar_000B6BEC
 000AAD46    xor         edx,edx
 000AAD48    mov         dword ptr [eax],edx
 000AAD4A    mov         eax,[000B5A68];^gvar_000B6B0F
 000AAD4F    mov         byte ptr [eax],1
 000AAD52    mov         edx,edi
 000AAD54    mov         eax,ebx
 000AAD56    call        TFormMain.Close1Click
 000AAD5B    xor         eax,eax
 000AAD5D    pop         edx
 000AAD5E    pop         ecx
 000AAD5F    pop         ecx
 000AAD60    mov         dword ptr fs:[eax],edx
 000AAD63    push        0AAD88
 000AAD68    lea         eax,[ebp-144]
 000AAD6E    call        @LStrClr
 000AAD73    lea         eax,[ebp-8]
 000AAD76    mov         edx,2
 000AAD7B    call        @LStrArrayClr
 000AAD80    ret
>000AAD81    jmp         @HandleFinally
>000AAD86    jmp         000AAD68
 000AAD88    pop         edi
 000AAD89    pop         esi
 000AAD8A    pop         ebx
 000AAD8B    mov         esp,ebp
 000AAD8D    pop         ebp
 000AAD8E    ret
*}
end;

//000AAE08
procedure TFormMain.FormActivate(Sender:TObject);
begin
{*
 000AAE08    push        ebp
 000AAE09    mov         ebp,esp
 000AAE0B    xor         ecx,ecx
 000AAE0D    push        ecx
 000AAE0E    push        ecx
 000AAE0F    push        ecx
 000AAE10    push        ecx
 000AAE11    push        ebx
 000AAE12    push        esi
 000AAE13    mov         esi,edx
 000AAE15    mov         ebx,eax
 000AAE17    xor         eax,eax
 000AAE19    push        ebp
 000AAE1A    push        0AAFE5
 000AAE1F    push        dword ptr fs:[eax]
 000AAE22    mov         dword ptr fs:[eax],esp
 000AAE25    cmp         byte ptr [ebx+498],0;TFormMain.?f498:byte
>000AAE2C    jne         000AAFCA
 000AAE32    mov         byte ptr [ebx+498],1;TFormMain.?f498:byte
 000AAE39    mov         eax,ebx
 000AAE3B    call        000AB324
 000AAE40    push        0AAFF4;'CMBINARY'
 000AAE45    call        user32.RegisterClipboardFormatA
 000AAE4A    mov         edx,dword ptr ds:[0B5618];^gvar_000B6B74:Longword
 000AAE50    mov         word ptr [edx],ax
 000AAE53    mov         eax,[000B5618];^gvar_000B6B74:Longword
 000AAE58    cmp         word ptr [eax],0
>000AAE5C    jne         000AAE87
 000AAE5E    mov         eax,dword ptr [ebx+3D8];TFormMain.Clipboard1:TMenuItem
 000AAE64    mov         dword ptr [eax+0C],2;TMenuItem.Tag:Integer
 000AAE6B    xor         edx,edx
 000AAE6D    call        TMenuItem.SetEnabled
 000AAE72    lea         edx,[ebp-0C]
 000AAE75    mov         eax,80D
 000AAE7A    call        LoadStr;'Can't register clipboard format CMBINARY'
 000AAE7F    mov         eax,dword ptr [ebp-0C]
 000AAE82    call        0008D0A8
 000AAE87    mov         eax,[000B59C0];^gvar_000B6B6C
 000AAE8C    cmp         dword ptr [eax],0
>000AAE8F    jne         000AAE96
 000AAE91    call        00098084
 000AAE96    lea         edx,[ebp-0C]
 000AAE99    mov         eax,1
 000AAE9E    call        ParamStr
 000AAEA3    cmp         dword ptr [ebp-0C],0
>000AAEA7    je          000AAEF6
 000AAEA9    lea         edx,[ebp-0C]
 000AAEAC    mov         eax,1
 000AAEB1    call        ParamStr
 000AAEB6    mov         eax,dword ptr [ebp-0C]
 000AAEB9    lea         edx,[ebp-4]
 000AAEBC    call        00079634
 000AAEC1    mov         eax,[000B5994];^gvar_000B7008
 000AAEC6    mov         byte ptr [eax],0
 000AAEC9    cmp         dword ptr [ebp-4],0
>000AAECD    jne         000AAEEA
 000AAECF    lea         edx,[ebp-0C]
 000AAED2    mov         eax,1
 000AAED7    call        ParamStr
 000AAEDC    mov         ecx,dword ptr [ebp-0C]
 000AAEDF    mov         edx,esi
 000AAEE1    mov         eax,ebx
 000AAEE3    call        000ACD9C
>000AAEE8    jmp         000AAEF6
 000AAEEA    mov         ecx,dword ptr [ebp-4]
 000AAEED    mov         edx,esi
 000AAEEF    mov         eax,ebx
 000AAEF1    call        000ACD9C
 000AAEF6    lea         eax,[ebp-0C]
 000AAEF9    push        eax
 000AAEFA    lea         edx,[ebp-10]
 000AAEFD    mov         eax,2
 000AAF02    call        ParamStr
 000AAF07    mov         eax,dword ptr [ebp-10]
 000AAF0A    mov         ecx,2
 000AAF0F    mov         edx,1
 000AAF14    call        @LStrCopy
 000AAF19    mov         eax,dword ptr [ebp-0C]
 000AAF1C    mov         edx,0AB008;'/s /S -s -S'
 000AAF21    call        @LStrPos
 000AAF26    test        eax,eax
>000AAF28    jle         000AAFC1
 000AAF2E    lea         edx,[ebp-0C]
 000AAF31    mov         eax,2
 000AAF36    call        ParamStr
 000AAF3B    mov         eax,dword ptr [ebp-0C]
 000AAF3E    lea         ecx,[ebp-8]
 000AAF41    mov         edx,2
 000AAF46    call        00075144
 000AAF4B    lea         eax,[ebp-0C]
 000AAF4E    push        eax
 000AAF4F    mov         ecx,1
 000AAF54    mov         edx,1
 000AAF59    mov         eax,dword ptr [ebp-8]
 000AAF5C    call        @LStrCopy
 000AAF61    mov         eax,dword ptr [ebp-0C]
 000AAF64    mov         edx,0AB01C;'='
 000AAF69    call        @LStrCmp
>000AAF6E    jne         000AAF8B
 000AAF70    lea         ecx,[ebp-0C]
 000AAF73    mov         edx,1
 000AAF78    mov         eax,dword ptr [ebp-8]
 000AAF7B    call        00075144
 000AAF80    mov         edx,dword ptr [ebp-0C]
 000AAF83    lea         eax,[ebp-8]
 000AAF86    call        @LStrLAsg
 000AAF8B    mov         eax,[000B5AAC];^gvar_000B709C:TFormScript
 000AAF90    mov         eax,dword ptr [eax]
 000AAF92    mov         edx,dword ptr [ebp-8]
 000AAF95    call        000A650C
 000AAF9A    mov         eax,[000B5A1C];^gvar_000B7009
 000AAF9F    mov         byte ptr [eax],1
 000AAFA2    mov         eax,[000B5AAC];^gvar_000B709C:TFormScript
 000AAFA7    mov         eax,dword ptr [eax]
 000AAFA9    mov         byte ptr [eax+3A4],1
 000AAFB0    mov         eax,[000B5AAC];^gvar_000B709C:TFormScript
 000AAFB5    mov         eax,dword ptr [eax]
 000AAFB7    mov         edx,dword ptr [eax]
 000AAFB9    call        dword ptr [edx+0CC]
>000AAFBF    jmp         000AAFCA
 000AAFC1    xor         edx,edx
 000AAFC3    mov         eax,ebx
 000AAFC5    call        TFormMain.DataInspector1Click
 000AAFCA    xor         eax,eax
 000AAFCC    pop         edx
 000AAFCD    pop         ecx
 000AAFCE    pop         ecx
 000AAFCF    mov         dword ptr fs:[eax],edx
 000AAFD2    push        0AAFEC
 000AAFD7    lea         eax,[ebp-10]
 000AAFDA    mov         edx,4
 000AAFDF    call        @LStrArrayClr
 000AAFE4    ret
>000AAFE5    jmp         @HandleFinally
>000AAFEA    jmp         000AAFD7
 000AAFEC    pop         esi
 000AAFED    pop         ebx
 000AAFEE    mov         esp,ebp
 000AAFF0    pop         ebp
 000AAFF1    ret
*}
end;

//000AB020
procedure TFormMain.FormDestroy(Sender:TObject);
begin
{*
 000AB020    push        ebx
 000AB021    mov         ebx,eax
 000AB023    mov         eax,dword ptr [ebx+49C];TFormMain.?f49C:HWND
 000AB029    push        eax
 000AB02A    mov         eax,ebx
 000AB02C    call        TWinControl.GetHandle
 000AB031    push        eax
 000AB032    call        user32.ChangeClipboardChain
 000AB037    mov         eax,dword ptr [ebx+4A0];TFormMain.?f4A0:TStringList
 000AB03D    call        TObject.Free
 000AB042    pop         ebx
 000AB043    ret
*}
end;

//000AB044
procedure TFormMain.FormClose(Sender:TObject; var Action:TCloseAction);
begin
{*
 000AB044    push        ebx
 000AB045    mov         ebx,eax
 000AB047    mov         eax,[000B59C0];^gvar_000B6B6C
 000AB04C    cmp         dword ptr [eax],0
>000AB04F    je          000AB056
 000AB051    call        00098120
 000AB056    call        00093DB0
 000AB05B    mov         eax,ebx
 000AB05D    call        000ABF90
 000AB062    mov         eax,ebx
 000AB064    call        000B23E4
 000AB069    pop         ebx
 000AB06A    ret
*}
end;

//000AB07C
procedure TFormMain.FormCloseQuery(Sender:TObject; var CanClose:Boolean);
begin
{*
 000AB07C    push        ebx
 000AB07D    push        esi
 000AB07E    push        ecx
 000AB07F    mov         esi,ecx
 000AB081    mov         ebx,eax
 000AB083    mov         edx,esp
 000AB085    mov         eax,ebx
 000AB087    call        000AD130
 000AB08C    mov         byte ptr [esi],al
 000AB08E    pop         edx
 000AB08F    pop         esi
 000AB090    pop         ebx
 000AB091    ret
*}
end;

//000AB134
{*function sub_000AB134(?:TFormMain; ?:Longint):?;
begin
 000AB134    push        ebx
 000AB135    push        esi
 000AB136    push        edi
 000AB137    mov         esi,edx
 000AB139    mov         ebx,eax
 000AB13B    push        20
 000AB13D    call        user32.GetSystemMetrics
 000AB142    mov         edi,eax
 000AB144    add         edi,edi
 000AB146    push        5
 000AB148    call        user32.GetSystemMetrics
 000AB14D    shl         eax,2
 000AB150    add         edi,eax
 000AB152    mov         edx,esi
 000AB154    mov         eax,dword ptr [ebx+310]
 000AB15A    call        000892DC
 000AB15F    add         edi,eax
 000AB161    mov         edx,esi
 000AB163    mov         eax,dword ptr [ebx+314]
 000AB169    call        000892DC
 000AB16E    add         edi,eax
 000AB170    mov         eax,dword ptr [ebx+4C8]
 000AB176    add         edi,dword ptr [eax+38]
 000AB179    mov         esi,edi
 000AB17B    mov         eax,[000B5AD8];^gvar_000B7006:Boolean
 000AB180    cmp         byte ptr [eax],0
>000AB183    jne         000AB1A6
 000AB185    mov         edx,1
 000AB18A    mov         eax,dword ptr [ebx+420]
 000AB190    call        000892DC
 000AB195    mov         ebx,eax
 000AB197    push        5
 000AB199    call        user32.GetSystemMetrics
 000AB19E    add         eax,eax
 000AB1A0    add         esi,eax
 000AB1A2    add         ebx,esi
 000AB1A4    mov         esi,ebx
 000AB1A6    mov         eax,esi
 000AB1A8    pop         edi
 000AB1A9    pop         esi
 000AB1AA    pop         ebx
 000AB1AB    ret
end;*}

//000AB1AC
{*function sub_000AB1AC(?:TFormMain; ?:Longint):?;
begin
 000AB1AC    push        ebx
 000AB1AD    push        esi
 000AB1AE    push        edi
 000AB1AF    mov         esi,edx
 000AB1B1    mov         ebx,eax
 000AB1B3    push        21
 000AB1B5    call        user32.GetSystemMetrics
 000AB1BA    mov         edi,eax
 000AB1BC    add         edi,edi
 000AB1BE    push        4
 000AB1C0    call        user32.GetSystemMetrics
 000AB1C5    add         edi,eax
 000AB1C7    mov         eax,ebx
 000AB1C9    call        00090430
 000AB1CE    add         edi,eax
 000AB1D0    push        6
 000AB1D2    call        user32.GetSystemMetrics
 000AB1D7    add         eax,eax
 000AB1D9    add         edi,eax
 000AB1DB    mov         eax,dword ptr [ebx+2C8]
 000AB1E1    add         edi,dword ptr [eax+3C]
 000AB1E4    mov         eax,dword ptr [ebx+2C4]
 000AB1EA    add         edi,dword ptr [eax+3C]
 000AB1ED    mov         edx,esi
 000AB1EF    mov         eax,dword ptr [ebx+310]
 000AB1F5    call        000892F4
 000AB1FA    add         edi,eax
 000AB1FC    mov         eax,edi
 000AB1FE    pop         edi
 000AB1FF    pop         esi
 000AB200    pop         ebx
 000AB201    ret
end;*}

//000AB204
{*function sub_000AB204(?:TFormMain; ?:Integer):?;
begin
 000AB204    push        ebx
 000AB205    push        esi
 000AB206    push        edi
 000AB207    mov         esi,edx
 000AB209    mov         ebx,eax
 000AB20B    push        20
 000AB20D    call        user32.GetSystemMetrics
 000AB212    add         eax,eax
 000AB214    sub         esi,eax
 000AB216    push        5
 000AB218    call        user32.GetSystemMetrics
 000AB21D    shl         eax,2
 000AB220    sub         esi,eax
 000AB222    mov         eax,dword ptr [ebx+4C8]
 000AB228    sub         esi,dword ptr [eax+38]
 000AB22B    mov         eax,[000B5AD8];^gvar_000B7006:Boolean
 000AB230    cmp         byte ptr [eax],0
>000AB233    jne         000AB284
 000AB235    push        5
 000AB237    call        user32.GetSystemMetrics
 000AB23C    add         eax,eax
 000AB23E    sub         esi,eax
 000AB240    mov         ecx,dword ptr [ebx+310]
 000AB246    mov         edi,dword ptr [ecx+224]
 000AB24C    mov         eax,edi
 000AB24E    add         eax,eax
 000AB250    lea         eax,[eax+eax*2]
 000AB253    push        eax
 000AB254    mov         eax,esi
 000AB256    pop         edx
 000AB257    sub         eax,edx
 000AB259    mov         edx,dword ptr [ebx+420]
 000AB25F    sub         eax,dword ptr [edx+210]
 000AB265    mov         edx,dword ptr [ecx+210]
 000AB26B    mov         ebx,dword ptr [ebx+314]
 000AB271    add         edx,dword ptr [ebx+210]
 000AB277    mov         ecx,edi
 000AB279    add         ecx,ecx
 000AB27B    add         edx,ecx
 000AB27D    mov         ecx,edx
 000AB27F    cdq
 000AB280    idiv        eax,ecx
>000AB282    jmp         000AB2B8
 000AB284    mov         ecx,dword ptr [ebx+310]
 000AB28A    mov         edi,dword ptr [ecx+224]
 000AB290    mov         eax,edi
 000AB292    shl         eax,2
 000AB295    push        eax
 000AB296    mov         eax,esi
 000AB298    pop         edx
 000AB299    sub         eax,edx
 000AB29B    mov         edx,dword ptr [ecx+210]
 000AB2A1    mov         ebx,dword ptr [ebx+314]
 000AB2A7    add         edx,dword ptr [ebx+210]
 000AB2AD    mov         ecx,edi
 000AB2AF    add         ecx,ecx
 000AB2B1    add         edx,ecx
 000AB2B3    mov         ecx,edx
 000AB2B5    cdq
 000AB2B6    idiv        eax,ecx
 000AB2B8    pop         edi
 000AB2B9    pop         esi
 000AB2BA    pop         ebx
 000AB2BB    ret
end;*}

//000AB2BC
{*function sub_000AB2BC(?:TFormMain; ?:Integer):?;
begin
 000AB2BC    push        ebx
 000AB2BD    push        esi
 000AB2BE    mov         esi,edx
 000AB2C0    mov         ebx,eax
 000AB2C2    push        21
 000AB2C4    call        user32.GetSystemMetrics
 000AB2C9    add         eax,eax
 000AB2CB    sub         esi,eax
 000AB2CD    push        4
 000AB2CF    call        user32.GetSystemMetrics
 000AB2D4    sub         esi,eax
 000AB2D6    mov         eax,ebx
 000AB2D8    call        00090430
 000AB2DD    sub         esi,eax
 000AB2DF    push        6
 000AB2E1    call        user32.GetSystemMetrics
 000AB2E6    add         eax,eax
 000AB2E8    sub         esi,eax
 000AB2EA    mov         eax,dword ptr [ebx+2C8]
 000AB2F0    sub         esi,dword ptr [eax+3C]
 000AB2F3    mov         eax,dword ptr [ebx+2C4]
 000AB2F9    sub         esi,dword ptr [eax+3C]
 000AB2FC    mov         ecx,dword ptr [ebx+310]
 000AB302    mov         ebx,dword ptr [ecx+224]
 000AB308    mov         eax,ebx
 000AB30A    shl         eax,2
 000AB30D    push        eax
 000AB30E    mov         eax,esi
 000AB310    pop         edx
 000AB311    sub         eax,edx
 000AB313    mov         edx,dword ptr [ecx+214]
 000AB319    add         edx,ebx
 000AB31B    mov         ecx,edx
 000AB31D    cdq
 000AB31E    idiv        eax,ecx
 000AB320    pop         esi
 000AB321    pop         ebx
 000AB322    ret
end;*}

//000AB324
procedure sub_000AB324(?:TFormMain);
begin
{*
 000AB324    push        ebp
 000AB325    mov         ebp,esp
 000AB327    add         esp,0FFFFFED8
 000AB32D    push        ebx
 000AB32E    push        esi
 000AB32F    push        edi
 000AB330    xor         edx,edx
 000AB332    mov         dword ptr [ebp-1C],edx
 000AB335    mov         dword ptr [ebp-120],edx
 000AB33B    mov         dword ptr [ebp-14],edx
 000AB33E    mov         dword ptr [ebp-18],edx
 000AB341    mov         ebx,eax
 000AB343    xor         eax,eax
 000AB345    push        ebp
 000AB346    push        0ABBBA
 000AB34B    push        dword ptr fs:[eax]
 000AB34E    mov         dword ptr fs:[eax],esp
 000AB351    lea         eax,[ebp-1C]
 000AB354    call        00086D5C
 000AB359    mov         ecx,dword ptr [ebp-1C]
 000AB35C    mov         dl,1
 000AB35E    mov         eax,[0007792C];TIniFile
 000AB363    call        TCustomIniFile.Create;TIniFile.Create
 000AB368    mov         dword ptr [ebp-4],eax
 000AB36B    xor         edx,edx
 000AB36D    push        ebp
 000AB36E    push        0ABB1A
 000AB373    push        dword ptr fs:[edx]
 000AB376    mov         dword ptr fs:[edx],esp
 000AB379    push        0
 000AB37B    mov         ecx,0ABBD0;'TextGridLeft'
 000AB380    mov         edx,0ABBE8;'Options'
 000AB385    mov         eax,dword ptr [ebp-4]
 000AB388    mov         esi,dword ptr [eax]
 000AB38A    call        dword ptr [esi+10];TCustomIniFile.ReadBool
 000AB38D    mov         edx,dword ptr ds:[0B5A20];^gvar_000B6CFC:Boolean
 000AB393    mov         byte ptr [edx],al
 000AB395    mov         eax,ebx
 000AB397    call        000AC990
 000AB39C    push        0
 000AB39E    mov         ecx,0ABBF8;'resx'
 000AB3A3    mov         edx,0ABC08;'display'
 000AB3A8    mov         eax,dword ptr [ebp-4]
 000AB3AB    mov         esi,dword ptr [eax]
 000AB3AD    call        dword ptr [esi+8];TCustomIniFile.ReadInteger
 000AB3B0    mov         esi,eax
 000AB3B2    mov         eax,[000B5BDC];^Screen:TScreen
 000AB3B7    mov         eax,dword ptr [eax]
 000AB3B9    call        TScreen.GetWidth
 000AB3BE    cmp         esi,eax
>000AB3C0    jne         000AB409
 000AB3C2    push        0
 000AB3C4    mov         ecx,0ABC18;'resy'
 000AB3C9    mov         edx,0ABC08;'display'
 000AB3CE    mov         eax,dword ptr [ebp-4]
 000AB3D1    mov         esi,dword ptr [eax]
 000AB3D3    call        dword ptr [esi+8];TCustomIniFile.ReadInteger
 000AB3D6    mov         esi,eax
 000AB3D8    mov         eax,[000B5BDC];^Screen:TScreen
 000AB3DD    mov         eax,dword ptr [eax]
 000AB3DF    call        TScreen.GetHeight
 000AB3E4    cmp         esi,eax
>000AB3E6    jne         000AB409
 000AB3E8    push        0
 000AB3EA    mov         ecx,0ABC28;'ppi'
 000AB3EF    mov         edx,0ABC08;'display'
 000AB3F4    mov         eax,dword ptr [ebp-4]
 000AB3F7    mov         esi,dword ptr [eax]
 000AB3F9    call        dword ptr [esi+8];TCustomIniFile.ReadInteger
 000AB3FC    mov         edx,dword ptr ds:[0B5BDC];^Screen:TScreen
 000AB402    mov         edx,dword ptr [edx]
 000AB404    cmp         eax,dword ptr [edx+34];TScreen.FPixelsPerInch:Integer
>000AB407    je          000AB40D
 000AB409    xor         eax,eax
>000AB40B    jmp         000AB40F
 000AB40D    mov         al,1
 000AB40F    mov         byte ptr [ebp-5],al
 000AB412    mov         al,byte ptr [ebp-5]
 000AB415    xor         al,1
 000AB417    test        al,al
>000AB419    je          000AB433
 000AB41B    mov         esi,11
 000AB420    mov         dword ptr [ebp-0C],13
 000AB427    mov         dword ptr [ebp-10],8
>000AB42E    jmp         000AB4E7
 000AB433    mov         eax,dword ptr [ebx+34];TFormMain.Top:Integer
 000AB436    push        eax
 000AB437    lea         edx,[ebp-11C]
 000AB43D    mov         eax,dword ptr [ebx]
 000AB43F    call        TObject.ClassName
 000AB444    lea         edx,[ebp-11C]
 000AB44A    lea         eax,[ebp-1C]
 000AB44D    call        @LStrFromString
 000AB452    mov         edx,dword ptr [ebp-1C]
 000AB455    mov         ecx,0ABC34;'Top'
 000AB45A    mov         eax,dword ptr [ebp-4]
 000AB45D    mov         esi,dword ptr [eax]
 000AB45F    call        dword ptr [esi+8];TCustomIniFile.ReadInteger
 000AB462    mov         edx,eax
 000AB464    mov         eax,ebx
 000AB466    call        TControl.SetTop
 000AB46B    mov         eax,dword ptr [ebx+30];TFormMain.Left:Integer
 000AB46E    push        eax
 000AB46F    lea         edx,[ebp-11C]
 000AB475    mov         eax,dword ptr [ebx]
 000AB477    call        TObject.ClassName
 000AB47C    lea         edx,[ebp-11C]
 000AB482    lea         eax,[ebp-1C]
 000AB485    call        @LStrFromString
 000AB48A    mov         edx,dword ptr [ebp-1C]
 000AB48D    mov         ecx,0ABC40;'Left'
 000AB492    mov         eax,dword ptr [ebp-4]
 000AB495    mov         esi,dword ptr [eax]
 000AB497    call        dword ptr [esi+8];TCustomIniFile.ReadInteger
 000AB49A    mov         edx,eax
 000AB49C    mov         eax,ebx
 000AB49E    call        TControl.SetLeft
 000AB4A3    push        11
 000AB4A5    mov         edx,0ABBE8;'Options'
 000AB4AA    mov         ecx,0ABC50;'Cols'
 000AB4AF    mov         eax,dword ptr [ebp-4]
 000AB4B2    mov         esi,dword ptr [eax]
 000AB4B4    call        dword ptr [esi+8];TCustomIniFile.ReadInteger
 000AB4B7    mov         esi,eax
 000AB4B9    push        13
 000AB4BB    mov         edx,0ABBE8;'Options'
 000AB4C0    mov         ecx,0ABC60;'Rows'
 000AB4C5    mov         eax,dword ptr [ebp-4]
 000AB4C8    mov         edi,dword ptr [eax]
 000AB4CA    call        dword ptr [edi+8];TCustomIniFile.ReadInteger
 000AB4CD    mov         dword ptr [ebp-0C],eax
 000AB4D0    push        8
 000AB4D2    mov         edx,0ABBE8;'Options'
 000AB4D7    mov         ecx,0ABC70;'FontSize'
 000AB4DC    mov         eax,dword ptr [ebp-4]
 000AB4DF    mov         edi,dword ptr [eax]
 000AB4E1    call        dword ptr [edi+8];TCustomIniFile.ReadInteger
 000AB4E4    mov         dword ptr [ebp-10],eax
 000AB4E7    push        0ABC84;'Courier New'
 000AB4EC    lea         eax,[ebp-14]
 000AB4EF    push        eax
 000AB4F0    mov         edx,0ABBE8;'Options'
 000AB4F5    mov         ecx,0ABC98;'Font'
 000AB4FA    mov         eax,dword ptr [ebp-4]
 000AB4FD    mov         edi,dword ptr [eax]
 000AB4FF    call        dword ptr [edi];TIniFile.ReadString
 000AB501    mov         eax,dword ptr [ebx+314];TFormMain.CMStrGridHex:TCMStrGrid
 000AB507    mov         eax,dword ptr [eax+58];TCMStrGrid.FFont:TFont
 000AB50A    mov         edx,dword ptr [ebp-10]
 000AB50D    call        TFont.SetSize
 000AB512    push        0
 000AB514    mov         edx,0ABBE8;'Options'
 000AB519    mov         ecx,0ABCA8;'HideToolBar'
 000AB51E    mov         eax,dword ptr [ebp-4]
 000AB521    mov         edi,dword ptr [eax]
 000AB523    call        dword ptr [edi+10];TCustomIniFile.ReadBool
 000AB526    mov         edx,dword ptr ds:[0B58D8];^gvar_000B6BCD:Boolean
 000AB52C    mov         byte ptr [edx],al
 000AB52E    push        0
 000AB530    mov         edx,0ABBE8;'Options'
 000AB535    mov         ecx,0ABCBC;'HideAddressRange'
 000AB53A    mov         eax,dword ptr [ebp-4]
 000AB53D    mov         edi,dword ptr [eax]
 000AB53F    call        dword ptr [edi+10];TCustomIniFile.ReadBool
 000AB542    mov         edx,dword ptr ds:[0B5AD8];^gvar_000B7006:Boolean
 000AB548    mov         byte ptr [edx],al
 000AB54A    mov         edx,dword ptr ds:[0B58D8];^gvar_000B6BCD:Boolean
 000AB550    mov         dl,byte ptr [edx]
 000AB552    xor         ecx,ecx
 000AB554    mov         eax,ebx
 000AB556    call        000AE344
 000AB55B    mov         edx,dword ptr ds:[0B5AD8];^gvar_000B7006:Boolean
 000AB561    mov         dl,byte ptr [edx]
 000AB563    xor         ecx,ecx
 000AB565    mov         eax,ebx
 000AB567    call        000AE3E4
 000AB56C    mov         eax,[000B5868];^gvar_000B6B64:Longint
 000AB571    mov         dword ptr [eax],esi
 000AB573    mov         eax,[000B578C];^gvar_000B6B68:Longint
 000AB578    mov         edx,dword ptr [ebp-0C]
 000AB57B    mov         dword ptr [eax],edx
 000AB57D    mov         edx,dword ptr [ebp-14]
 000AB580    mov         eax,ebx
 000AB582    call        000AE098
 000AB587    mov         edx,esi
 000AB589    mov         eax,ebx
 000AB58B    call        000AB134
 000AB590    mov         esi,eax
 000AB592    mov         eax,[000B5BDC];^Screen:TScreen
 000AB597    mov         eax,dword ptr [eax]
 000AB599    call        TScreen.GetWidth
 000AB59E    cmp         esi,eax
>000AB5A0    jle         000AB5B5
 000AB5A2    mov         ecx,13
 000AB5A7    mov         edx,11
 000AB5AC    mov         eax,ebx
 000AB5AE    call        000AE0E8
>000AB5B3    jmp         000AB5E2
 000AB5B5    mov         edx,dword ptr [ebp-0C]
 000AB5B8    mov         eax,ebx
 000AB5BA    call        000AB1AC
 000AB5BF    mov         esi,eax
 000AB5C1    mov         eax,[000B5BDC];^Screen:TScreen
 000AB5C6    mov         eax,dword ptr [eax]
 000AB5C8    call        TScreen.GetHeight
 000AB5CD    cmp         esi,eax
>000AB5CF    jle         000AB5E2
 000AB5D1    mov         ecx,13
 000AB5D6    mov         edx,11
 000AB5DB    mov         eax,ebx
 000AB5DD    call        000AE0E8
 000AB5E2    push        1
 000AB5E4    mov         edx,0ABBE8;'Options'
 000AB5E9    mov         ecx,0ABCD8;'ShowGrids'
 000AB5EE    mov         eax,dword ptr [ebp-4]
 000AB5F1    mov         esi,dword ptr [eax]
 000AB5F3    call        dword ptr [esi+10];TCustomIniFile.ReadBool
 000AB5F6    mov         edx,dword ptr ds:[0B5648];^gvar_000B7007:Boolean
 000AB5FC    mov         byte ptr [edx],al
 000AB5FE    mov         edx,dword ptr ds:[0B5648];^gvar_000B7007:Boolean
 000AB604    mov         dl,byte ptr [edx]
 000AB606    xor         dl,1
 000AB609    mov         eax,ebx
 000AB60B    call        000AE518
 000AB610    push        0
 000AB612    mov         edx,0ABBE8;'Options'
 000AB617    mov         ecx,0ABCEC;'BlankForCC'
 000AB61C    mov         eax,dword ptr [ebp-4]
 000AB61F    mov         esi,dword ptr [eax]
 000AB621    call        dword ptr [esi+10];TCustomIniFile.ReadBool
 000AB624    mov         edx,dword ptr ds:[0B5B4C];^gvar_000B7013:Boolean
 000AB62A    mov         byte ptr [edx],al
 000AB62C    mov         al,byte ptr [ebp-5]
 000AB62F    xor         al,1
 000AB631    test        al,al
>000AB633    je          000AB63E
 000AB635    mov         eax,ebx
 000AB637    call        000879C4
>000AB63C    jmp         000AB689
 000AB63E    push        0
 000AB640    lea         edx,[ebp-11C]
 000AB646    mov         eax,dword ptr [ebx]
 000AB648    call        TObject.ClassName
 000AB64D    lea         edx,[ebp-11C]
 000AB653    lea         eax,[ebp-1C]
 000AB656    call        @LStrFromString
 000AB65B    mov         edx,dword ptr [ebp-1C]
 000AB65E    mov         ecx,0ABD00;'WindowState'
 000AB663    mov         eax,dword ptr [ebp-4]
 000AB666    mov         esi,dword ptr [eax]
 000AB668    call        dword ptr [esi+8];TCustomIniFile.ReadInteger
 000AB66B    sub         eax,1
>000AB66E    jb          000AB675
 000AB670    dec         eax
>000AB671    je          000AB680
>000AB673    jmp         000AB689
 000AB675    xor         edx,edx
 000AB677    mov         eax,ebx
 000AB679    call        TCustomForm.SetWindowState
>000AB67E    jmp         000AB689
 000AB680    mov         dl,2
 000AB682    mov         eax,ebx
 000AB684    call        TCustomForm.SetWindowState
 000AB689    push        0
 000AB68B    mov         edx,0ABBE8;'Options'
 000AB690    mov         ecx,0ABD14;'ByteOrder'
 000AB695    mov         eax,dword ptr [ebp-4]
 000AB698    mov         esi,dword ptr [eax]
 000AB69A    call        dword ptr [esi+8];TCustomIniFile.ReadInteger
 000AB69D    mov         edx,dword ptr ds:[0B5A50];^gvar_000B6BC5:Longint
 000AB6A3    mov         byte ptr [edx],al
 000AB6A5    push        0FF
 000AB6AA    mov         edx,0ABBE8;'Options'
 000AB6AF    mov         ecx,0ABD28;'ColorBlock'
 000AB6B4    mov         eax,dword ptr [ebp-4]
 000AB6B7    mov         esi,dword ptr [eax]
 000AB6B9    call        dword ptr [esi+8];TCustomIniFile.ReadInteger
 000AB6BC    mov         edx,dword ptr ds:[0B5BC4];^gvar_000B6BA8:Longint
 000AB6C2    mov         dword ptr [edx],eax
 000AB6C4    lea         eax,[ebp-1C]
 000AB6C7    mov         edx,dword ptr ds:[0B56C8];^gvar_000B55F4
 000AB6CD    call        @LStrFromString
 000AB6D2    mov         eax,dword ptr [ebp-1C]
 000AB6D5    push        eax
 000AB6D6    lea         eax,[ebp-18]
 000AB6D9    push        eax
 000AB6DA    mov         edx,0ABBE8;'Options'
 000AB6DF    mov         ecx,0ABD3C;'JokerHex'
 000AB6E4    mov         eax,dword ptr [ebp-4]
 000AB6E7    mov         esi,dword ptr [eax]
 000AB6E9    call        dword ptr [esi];TIniFile.ReadString
 000AB6EB    mov         eax,dword ptr [ebp-18]
 000AB6EE    call        @LStrLen
 000AB6F3    cmp         eax,2
>000AB6F6    jge         000AB718
 000AB6F8    lea         eax,[ebp-1C]
 000AB6FB    mov         edx,dword ptr ds:[0B56C8];^gvar_000B55F4
 000AB701    call        @LStrFromString
 000AB706    mov         eax,dword ptr [ebp-1C]
 000AB709    call        00074EA8
 000AB70E    mov         edx,dword ptr ds:[0B5C04];^gvar_000B6BC7:AnsiString
 000AB714    mov         byte ptr [edx],al
>000AB716    jmp         000AB728
 000AB718    mov         eax,dword ptr [ebp-18]
 000AB71B    call        00074EA8
 000AB720    mov         edx,dword ptr ds:[0B5C04];^gvar_000B6BC7:AnsiString
 000AB726    mov         byte ptr [edx],al
 000AB728    push        1
 000AB72A    mov         edx,0ABBE8;'Options'
 000AB72F    mov         ecx,0ABD50;'FindHex'
 000AB734    mov         eax,dword ptr [ebp-4]
 000AB737    mov         esi,dword ptr [eax]
 000AB739    call        dword ptr [esi+10];TCustomIniFile.ReadBool
 000AB73C    mov         edx,dword ptr ds:[0B5A4C];^gvar_000B6BD4:Boolean
 000AB742    mov         byte ptr [edx],al
 000AB744    push        1
 000AB746    mov         edx,0ABBE8;'Options'
 000AB74B    mov         ecx,0ABD60;'ReplaceHex'
 000AB750    mov         eax,dword ptr [ebp-4]
 000AB753    mov         esi,dword ptr [eax]
 000AB755    call        dword ptr [esi+10];TCustomIniFile.ReadBool
 000AB758    mov         edx,dword ptr ds:[0B58BC];^gvar_000B6BD5:Boolean
 000AB75E    mov         byte ptr [edx],al
 000AB760    push        0
 000AB762    mov         edx,0ABBE8;'Options'
 000AB767    mov         ecx,0ABD74;'InsHex'
 000AB76C    mov         eax,dword ptr [ebp-4]
 000AB76F    mov         esi,dword ptr [eax]
 000AB771    call        dword ptr [esi+10];TCustomIniFile.ReadBool
 000AB774    mov         edx,dword ptr ds:[0B5AF8];^gvar_000B6BD6:Boolean
 000AB77A    mov         byte ptr [edx],al
 000AB77C    push        0
 000AB77E    mov         edx,0ABBE8;'Options'
 000AB783    mov         ecx,0ABD84;'UnicodeIns'
 000AB788    mov         eax,dword ptr [ebp-4]
 000AB78B    mov         esi,dword ptr [eax]
 000AB78D    call        dword ptr [esi+10];TCustomIniFile.ReadBool
 000AB790    mov         edx,dword ptr ds:[0B5958];^gvar_000B6BD7:Boolean
 000AB796    mov         byte ptr [edx],al
 000AB798    push        0
 000AB79A    mov         edx,0ABBE8;'Options'
 000AB79F    mov         ecx,0ABD98;'UnicodeFind'
 000AB7A4    mov         eax,dword ptr [ebp-4]
 000AB7A7    mov         esi,dword ptr [eax]
 000AB7A9    call        dword ptr [esi+10];TCustomIniFile.ReadBool
 000AB7AC    mov         edx,dword ptr ds:[0B58B4];^gvar_000B6BD8:Boolean
 000AB7B2    mov         byte ptr [edx],al
 000AB7B4    push        0
 000AB7B6    mov         edx,0ABBE8;'Options'
 000AB7BB    mov         ecx,0ABDAC;'UnicodeRepl'
 000AB7C0    mov         eax,dword ptr [ebp-4]
 000AB7C3    mov         esi,dword ptr [eax]
 000AB7C5    call        dword ptr [esi+10];TCustomIniFile.ReadBool
 000AB7C8    mov         edx,dword ptr ds:[0B5AD4];^gvar_000B6BD9:Boolean
 000AB7CE    mov         byte ptr [edx],al
 000AB7D0    push        1
 000AB7D2    mov         edx,0ABBE8;'Options'
 000AB7D7    mov         ecx,0ABDC0;'CaseSensitive'
 000AB7DC    mov         eax,dword ptr [ebp-4]
 000AB7DF    mov         esi,dword ptr [eax]
 000AB7E1    call        dword ptr [esi+10];TCustomIniFile.ReadBool
 000AB7E4    mov         edx,dword ptr ds:[0B5AA4];^gvar_000B6BB5:Boolean
 000AB7EA    mov         byte ptr [edx],al
 000AB7EC    push        0
 000AB7EE    mov         edx,0ABBE8;'Options'
 000AB7F3    mov         ecx,0ABDD8;'JokerFind'
 000AB7F8    mov         eax,dword ptr [ebp-4]
 000AB7FB    mov         esi,dword ptr [eax]
 000AB7FD    call        dword ptr [esi+10];TCustomIniFile.ReadBool
 000AB800    mov         edx,dword ptr ds:[0B5794];^gvar_000B6BC6:Boolean
 000AB806    mov         byte ptr [edx],al
 000AB808    push        1
 000AB80A    mov         edx,0ABBE8;'Options'
 000AB80F    mov         ecx,0ABDEC;'FindDown'
 000AB814    mov         eax,dword ptr [ebp-4]
 000AB817    mov         esi,dword ptr [eax]
 000AB819    call        dword ptr [esi+10];TCustomIniFile.ReadBool
 000AB81C    mov         edx,dword ptr ds:[0B59EC];^gvar_000B6BCC:Boolean
 000AB822    mov         byte ptr [edx],al
 000AB824    push        0
 000AB826    mov         edx,0ABBE8;'Options'
 000AB82B    mov         ecx,0ABE00;'GotoMode'
 000AB830    mov         eax,dword ptr [ebp-4]
 000AB833    mov         esi,dword ptr [eax]
 000AB835    call        dword ptr [esi+8];TCustomIniFile.ReadInteger
 000AB838    mov         edx,dword ptr ds:[0B57B0];^gvar_000B6BC8:Longint
 000AB83E    mov         dword ptr [edx],eax
 000AB840    push        0
 000AB842    mov         edx,0ABBE8;'Options'
 000AB847    mov         ecx,0ABE14;'EncodeAs'
 000AB84C    mov         eax,dword ptr [ebp-4]
 000AB84F    mov         esi,dword ptr [eax]
 000AB851    call        dword ptr [esi+8];TCustomIniFile.ReadInteger
 000AB854    mov         edx,dword ptr ds:[0B5910];^gvar_000B7004:Longint
 000AB85A    mov         byte ptr [edx],al
 000AB85C    push        0
 000AB85E    mov         edx,0ABBE8;'Options'
 000AB863    mov         ecx,0ABE28;'EncodeWhere'
 000AB868    mov         eax,dword ptr [ebp-4]
 000AB86B    mov         esi,dword ptr [eax]
 000AB86D    call        dword ptr [esi+8];TCustomIniFile.ReadInteger
 000AB870    mov         edx,dword ptr ds:[0B5A34];^gvar_000B7005:Longint
 000AB876    mov         byte ptr [edx],al
 000AB878    mov         esi,dword ptr [ebx+490];TFormMain.?f490:TMRUFiles
 000AB87E    xor         eax,eax
 000AB880    mov         al,byte ptr [esi+28];TMRUFiles.FileCount:byte
 000AB883    push        eax
 000AB884    mov         edx,0ABBE8;'Options'
 000AB889    mov         ecx,0ABE3C;'MRU'
 000AB88E    mov         eax,dword ptr [ebp-4]
 000AB891    mov         edi,dword ptr [eax]
 000AB893    call        dword ptr [edi+8];TCustomIniFile.ReadInteger
 000AB896    mov         edx,eax
 000AB898    mov         eax,esi
 000AB89A    call        TMRUFiles.SetFileCount
 000AB89F    mov         eax,dword ptr [ebx+490];TFormMain.?f490:TMRUFiles
 000AB8A5    call        00088A60
 000AB8AA    push        0
 000AB8AC    mov         edx,0ABBE8;'Options'
 000AB8B1    mov         ecx,0ABE48;'BaseAdress'
 000AB8B6    mov         eax,dword ptr [ebp-4]
 000AB8B9    mov         esi,dword ptr [eax]
 000AB8BB    call        dword ptr [esi+8];TCustomIniFile.ReadInteger
 000AB8BE    mov         edx,dword ptr ds:[0B5B1C];^gvar_000B55F8:Longint
 000AB8C4    mov         dword ptr [edx],eax
 000AB8C6    mov         eax,[000B5B1C];^gvar_000B55F8:Longint
 000AB8CB    mov         eax,dword ptr [eax]
 000AB8CD    sub         eax,2
>000AB8D0    jb          000AB8DB
 000AB8D2    mov         eax,[000B5B1C];^gvar_000B55F8:Longint
 000AB8D7    xor         edx,edx
 000AB8D9    mov         dword ptr [eax],edx
 000AB8DB    push        0
 000AB8DD    mov         edx,0ABBE8;'Options'
 000AB8E2    mov         ecx,0ABE5C;'OldFileTime'
 000AB8E7    mov         eax,dword ptr [ebp-4]
 000AB8EA    mov         esi,dword ptr [eax]
 000AB8EC    call        dword ptr [esi+10];TCustomIniFile.ReadBool
 000AB8EF    mov         edx,dword ptr ds:[0B5744];^gvar_000B6BDA:Boolean
 000AB8F5    mov         byte ptr [edx],al
 000AB8F7    push        0
 000AB8F9    mov         edx,0ABBE8;'Options'
 000AB8FE    mov         ecx,0ABE70;'NewEOF'
 000AB903    mov         eax,dword ptr [ebp-4]
 000AB906    mov         esi,dword ptr [eax]
 000AB908    call        dword ptr [esi+10];TCustomIniFile.ReadBool
 000AB90B    mov         edx,dword ptr ds:[0B5BB4];^gvar_000B6BE8:Boolean
 000AB911    mov         byte ptr [edx],al
 000AB913    lea         edx,[ebp-1C]
 000AB916    mov         eax,[000B59E8];^Application:TApplication
 000AB91B    mov         eax,dword ptr [eax]
 000AB91D    call        TApplication.GetExeName
 000AB922    mov         eax,dword ptr [ebp-1C]
 000AB925    lea         edx,[ebp-120]
 000AB92B    call        ExtractFileDir
 000AB930    mov         eax,dword ptr [ebp-120]
 000AB936    push        eax
 000AB937    lea         eax,[ebp-1C]
 000AB93A    push        eax
 000AB93B    mov         edx,0ABBE8;'Options'
 000AB940    mov         ecx,0ABE80;'CurrentDir'
 000AB945    mov         eax,dword ptr [ebp-4]
 000AB948    mov         esi,dword ptr [eax]
 000AB94A    call        dword ptr [esi];TIniFile.ReadString
 000AB94C    mov         edx,dword ptr [ebp-1C]
 000AB94F    mov         eax,[000B5A10];^gvar_000B6BE4:AnsiString
 000AB954    call        @LStrAsg
 000AB959    push        1
 000AB95B    mov         edx,0ABBE8;'Options'
 000AB960    mov         ecx,0ABE94;'Overwrite'
 000AB965    mov         eax,dword ptr [ebp-4]
 000AB968    mov         esi,dword ptr [eax]
 000AB96A    call        dword ptr [esi+10];TCustomIniFile.ReadBool
 000AB96D    xor         al,1
 000AB96F    mov         edx,dword ptr ds:[0B5A0C];^gvar_000B6BA6
 000AB975    mov         byte ptr [edx],al
 000AB977    xor         edx,edx
 000AB979    mov         eax,ebx
 000AB97B    call        TFormMain.ModusOverwrite1Click
 000AB980    push        1
 000AB982    mov         edx,0ABBE8;'Options'
 000AB987    mov         ecx,0ABEA8;'ModusText'
 000AB98C    mov         eax,dword ptr [ebp-4]
 000AB98F    mov         esi,dword ptr [eax]
 000AB991    call        dword ptr [esi+10];TCustomIniFile.ReadBool
 000AB994    xor         al,1
 000AB996    mov         edx,dword ptr ds:[0B5B00];^gvar_000B6BA4
 000AB99C    mov         byte ptr [edx],al
 000AB99E    xor         edx,edx
 000AB9A0    mov         eax,ebx
 000AB9A2    call        TFormMain.ModusText1Click
 000AB9A7    push        1
 000AB9A9    mov         edx,0ABBE8;'Options'
 000AB9AE    mov         ecx,0ABEBC;'Scope'
 000AB9B3    mov         eax,dword ptr [ebp-4]
 000AB9B6    mov         esi,dword ptr [eax]
 000AB9B8    call        dword ptr [esi+10];TCustomIniFile.ReadBool
 000AB9BB    mov         edx,dword ptr ds:[0B5B54];^gvar_000B6BF0:Boolean
 000AB9C1    mov         byte ptr [edx],al
 000AB9C3    push        0
 000AB9C5    lea         eax,[ebp-1C]
 000AB9C8    push        eax
 000AB9C9    mov         edx,0ABBE8;'Options'
 000AB9CE    mov         ecx,0ABECC;'ConvTable'
 000AB9D3    mov         eax,dword ptr [ebp-4]
 000AB9D6    mov         esi,dword ptr [eax]
 000AB9D8    call        dword ptr [esi];TIniFile.ReadString
 000AB9DA    mov         edx,dword ptr [ebp-1C]
 000AB9DD    mov         eax,[000B590C];^gvar_000B6CF4:AnsiString
 000AB9E2    call        @LStrAsg
 000AB9E7    push        0
 000AB9E9    mov         ecx,0ABEE0;'short'
 000AB9EE    mov         edx,0ABEF0;'DataInsp'
 000AB9F3    mov         eax,dword ptr [ebp-4]
 000AB9F6    mov         esi,dword ptr [eax]
 000AB9F8    call        dword ptr [esi+10];TCustomIniFile.ReadBool
 000AB9FB    mov         edx,dword ptr ds:[0B59FC];^gvar_000B700A:Boolean
 000ABA01    mov         byte ptr [edx],al
 000ABA03    push        0
 000ABA05    mov         edx,0ABEF0;'DataInsp'
 000ABA0A    mov         ecx,0ABF04;'byte'
 000ABA0F    mov         eax,dword ptr [ebp-4]
 000ABA12    mov         esi,dword ptr [eax]
 000ABA14    call        dword ptr [esi+10];TCustomIniFile.ReadBool
 000ABA17    mov         edx,dword ptr ds:[0B57A8];^gvar_000B700B:Boolean
 000ABA1D    mov         byte ptr [edx],al
 000ABA1F    push        1
 000ABA21    mov         edx,0ABEF0;'DataInsp'
 000ABA26    mov         ecx,0ABF14;'word'
 000ABA2B    mov         eax,dword ptr [ebp-4]
 000ABA2E    mov         esi,dword ptr [eax]
 000ABA30    call        dword ptr [esi+10];TCustomIniFile.ReadBool
 000ABA33    mov         edx,dword ptr ds:[0B5B18];^gvar_000B700C:Boolean
 000ABA39    mov         byte ptr [edx],al
 000ABA3B    push        1
 000ABA3D    mov         edx,0ABEF0;'DataInsp'
 000ABA42    mov         ecx,0ABF24;'int'
 000ABA47    mov         eax,dword ptr [ebp-4]
 000ABA4A    mov         esi,dword ptr [eax]
 000ABA4C    call        dword ptr [esi+10];TCustomIniFile.ReadBool
 000ABA4F    mov         edx,dword ptr ds:[0B5920];^gvar_000B700D:Boolean
 000ABA55    mov         byte ptr [edx],al
 000ABA57    push        1
 000ABA59    mov         edx,0ABEF0;'DataInsp'
 000ABA5E    mov         ecx,0ABF30;'long'
 000ABA63    mov         eax,dword ptr [ebp-4]
 000ABA66    mov         esi,dword ptr [eax]
 000ABA68    call        dword ptr [esi+10];TCustomIniFile.ReadBool
 000ABA6B    mov         edx,dword ptr ds:[0B56D0];^gvar_000B700E:Boolean
 000ABA71    mov         byte ptr [edx],al
 000ABA73    push        1
 000ABA75    mov         edx,0ABEF0;'DataInsp'
 000ABA7A    mov         ecx,0ABF40;'single'
 000ABA7F    mov         eax,dword ptr [ebp-4]
 000ABA82    mov         esi,dword ptr [eax]
 000ABA84    call        dword ptr [esi+10];TCustomIniFile.ReadBool
 000ABA87    mov         edx,dword ptr ds:[0B5664];^gvar_000B700F:Boolean
 000ABA8D    mov         byte ptr [edx],al
 000ABA8F    push        0
 000ABA91    mov         edx,0ABEF0;'DataInsp'
 000ABA96    mov         ecx,0ABF50;'double'
 000ABA9B    mov         eax,dword ptr [ebp-4]
 000ABA9E    mov         esi,dword ptr [eax]
 000ABAA0    call        dword ptr [esi+10];TCustomIniFile.ReadBool
 000ABAA3    mov         edx,dword ptr ds:[0B59CC];^gvar_000B7010:Boolean
 000ABAA9    mov         byte ptr [edx],al
 000ABAAB    push        1
 000ABAAD    mov         edx,0ABEF0;'DataInsp'
 000ABAB2    mov         ecx,0ABF60;'bin'
 000ABAB7    mov         eax,dword ptr [ebp-4]
 000ABABA    mov         esi,dword ptr [eax]
 000ABABC    call        dword ptr [esi+10];TCustomIniFile.ReadBool
 000ABABF    mov         edx,dword ptr ds:[0B5980];^gvar_000B7011:Boolean
 000ABAC5    mov         byte ptr [edx],al
 000ABAC7    push        0
 000ABAC9    mov         edx,0ABEF0;'DataInsp'
 000ABACE    mov         ecx,0ABF6C;'BlockSize'
 000ABAD3    mov         eax,dword ptr [ebp-4]
 000ABAD6    mov         esi,dword ptr [eax]
 000ABAD8    call        dword ptr [esi+10];TCustomIniFile.ReadBool
 000ABADB    mov         edx,dword ptr ds:[0B5A00];^gvar_000B7012:Boolean
 000ABAE1    mov         byte ptr [edx],al
 000ABAE3    push        0
 000ABAE5    mov         edx,0ABBE8;'Options'
 000ABAEA    mov         ecx,0ABF80;'ShowDataInsp'
 000ABAEF    mov         eax,dword ptr [ebp-4]
 000ABAF2    mov         esi,dword ptr [eax]
 000ABAF4    call        dword ptr [esi+10];TCustomIniFile.ReadBool
 000ABAF7    mov         edx,eax
 000ABAF9    mov         eax,dword ptr [ebx+47C];TFormMain.DataInspector1:TMenuItem
 000ABAFF    call        TMenuItem.SetChecked
 000ABB04    xor         eax,eax
 000ABB06    pop         edx
 000ABB07    pop         ecx
 000ABB08    pop         ecx
 000ABB09    mov         dword ptr fs:[eax],edx
 000ABB0C    push        0ABB21
 000ABB11    mov         eax,dword ptr [ebp-4]
 000ABB14    call        TObject.Free
 000ABB19    ret
>000ABB1A    jmp         @HandleFinally
>000ABB1F    jmp         000ABB11
 000ABB21    mov         eax,[000B590C];^gvar_000B6CF4:AnsiString
 000ABB26    cmp         dword ptr [eax],0
>000ABB29    jne         000ABB32
 000ABB2B    call        0009B244
>000ABB30    jmp         000ABB94
 000ABB32    mov         eax,[000B590C];^gvar_000B6CF4:AnsiString
 000ABB37    mov         eax,dword ptr [eax]
 000ABB39    call        0009B070
 000ABB3E    test        al,al
>000ABB40    jne         000ABB94
 000ABB42    lea         eax,[ebp-1C]
 000ABB45    push        eax
 000ABB46    lea         edx,[ebp-120]
 000ABB4C    mov         eax,[000B590C];^gvar_000B6CF4:AnsiString
 000ABB51    mov         eax,dword ptr [eax]
 000ABB53    call        ExtractFileName
 000ABB58    mov         eax,dword ptr [ebp-120]
 000ABB5E    mov         dword ptr [ebp-128],eax
 000ABB64    mov         byte ptr [ebp-124],0B
 000ABB6B    lea         edx,[ebp-128]
 000ABB71    xor         ecx,ecx
 000ABB73    mov         eax,7D5
 000ABB78    call        FmtLoadStr;'Error reading
%s'
 000ABB7D    mov         eax,dword ptr [ebp-1C]
 000ABB80    call        0008D0A8
 000ABB85    mov         eax,[000B590C];^gvar_000B6CF4:AnsiString
 000ABB8A    call        @LStrClr
 000ABB8F    call        0009B244
 000ABB94    xor         eax,eax
 000ABB96    pop         edx
 000ABB97    pop         ecx
 000ABB98    pop         ecx
 000ABB99    mov         dword ptr fs:[eax],edx
 000ABB9C    push        0ABBC1
 000ABBA1    lea         eax,[ebp-120]
 000ABBA7    call        @LStrClr
 000ABBAC    lea         eax,[ebp-1C]
 000ABBAF    mov         edx,3
 000ABBB4    call        @LStrArrayClr
 000ABBB9    ret
>000ABBBA    jmp         @HandleFinally
>000ABBBF    jmp         000ABBA1
 000ABBC1    pop         edi
 000ABBC2    pop         esi
 000ABBC3    pop         ebx
 000ABBC4    mov         esp,ebp
 000ABBC6    pop         ebp
 000ABBC7    ret
*}
end;

//000ABF90
procedure sub_000ABF90(?:TFormMain);
begin
{*
 000ABF90    push        ebp
 000ABF91    mov         ebp,esp
 000ABF93    add         esp,0FFFFFEF4
 000ABF99    push        ebx
 000ABF9A    push        esi
 000ABF9B    push        edi
 000ABF9C    xor         edx,edx
 000ABF9E    mov         dword ptr [ebp-8],edx
 000ABFA1    mov         dword ptr [ebp-10C],edx
 000ABFA7    mov         ebx,eax
 000ABFA9    xor         eax,eax
 000ABFAB    push        ebp
 000ABFAC    push        0AC5CC
 000ABFB1    push        dword ptr fs:[eax]
 000ABFB4    mov         dword ptr fs:[eax],esp
 000ABFB7    lea         eax,[ebp-8]
 000ABFBA    call        00086D5C
 000ABFBF    mov         ecx,dword ptr [ebp-8]
 000ABFC2    mov         dl,1
 000ABFC4    mov         eax,[0007792C];TIniFile
 000ABFC9    call        TCustomIniFile.Create;TIniFile.Create
 000ABFCE    mov         dword ptr [ebp-4],eax
 000ABFD1    xor         eax,eax
 000ABFD3    push        ebp
 000ABFD4    push        0AC5A4
 000ABFD9    push        dword ptr fs:[eax]
 000ABFDC    mov         dword ptr fs:[eax],esp
 000ABFDF    xor         eax,eax
 000ABFE1    push        ebp
 000ABFE2    push        0AC56F
 000ABFE7    push        dword ptr fs:[eax]
 000ABFEA    mov         dword ptr fs:[eax],esp
 000ABFED    mov         eax,[000B5BDC];^Screen:TScreen
 000ABFF2    mov         eax,dword ptr [eax]
 000ABFF4    call        TScreen.GetWidth
 000ABFF9    push        eax
 000ABFFA    mov         ecx,0AC5E4;'resx'
 000ABFFF    mov         edx,0AC5F4;'display'
 000AC004    mov         eax,dword ptr [ebp-4]
 000AC007    mov         esi,dword ptr [eax]
 000AC009    call        dword ptr [esi+0C];TCustomIniFile.WriteInteger
 000AC00C    mov         eax,[000B5BDC];^Screen:TScreen
 000AC011    mov         eax,dword ptr [eax]
 000AC013    call        TScreen.GetHeight
 000AC018    push        eax
 000AC019    mov         ecx,0AC604;'resy'
 000AC01E    mov         edx,0AC5F4;'display'
 000AC023    mov         eax,dword ptr [ebp-4]
 000AC026    mov         esi,dword ptr [eax]
 000AC028    call        dword ptr [esi+0C];TCustomIniFile.WriteInteger
 000AC02B    mov         eax,[000B5BDC];^Screen:TScreen
 000AC030    mov         eax,dword ptr [eax]
 000AC032    mov         eax,dword ptr [eax+34];TScreen.FPixelsPerInch:Integer
 000AC035    push        eax
 000AC036    mov         ecx,0AC614;'ppi'
 000AC03B    mov         edx,0AC5F4;'display'
 000AC040    mov         eax,dword ptr [ebp-4]
 000AC043    mov         esi,dword ptr [eax]
 000AC045    call        dword ptr [esi+0C];TCustomIniFile.WriteInteger
 000AC048    mov         eax,dword ptr [ebx+34];TFormMain.Top:Integer
 000AC04B    push        eax
 000AC04C    lea         edx,[ebp-108]
 000AC052    mov         eax,dword ptr [ebx]
 000AC054    call        TObject.ClassName
 000AC059    lea         edx,[ebp-108]
 000AC05F    lea         eax,[ebp-8]
 000AC062    call        @LStrFromString
 000AC067    mov         edx,dword ptr [ebp-8]
 000AC06A    mov         ecx,0AC620;'Top'
 000AC06F    mov         eax,dword ptr [ebp-4]
 000AC072    mov         esi,dword ptr [eax]
 000AC074    call        dword ptr [esi+0C];TCustomIniFile.WriteInteger
 000AC077    mov         eax,dword ptr [ebx+30];TFormMain.Left:Integer
 000AC07A    push        eax
 000AC07B    lea         edx,[ebp-108]
 000AC081    mov         eax,dword ptr [ebx]
 000AC083    call        TObject.ClassName
 000AC088    lea         edx,[ebp-108]
 000AC08E    lea         eax,[ebp-8]
 000AC091    call        @LStrFromString
 000AC096    mov         edx,dword ptr [ebp-8]
 000AC099    mov         ecx,0AC62C;'Left'
 000AC09E    mov         eax,dword ptr [ebp-4]
 000AC0A1    mov         esi,dword ptr [eax]
 000AC0A3    call        dword ptr [esi+0C];TCustomIniFile.WriteInteger
 000AC0A6    xor         eax,eax
 000AC0A8    mov         al,byte ptr [ebx+20B];TFormMain.FWindowState:TWindowState
 000AC0AE    push        eax
 000AC0AF    lea         edx,[ebp-108]
 000AC0B5    mov         eax,dword ptr [ebx]
 000AC0B7    call        TObject.ClassName
 000AC0BC    lea         edx,[ebp-108]
 000AC0C2    lea         eax,[ebp-8]
 000AC0C5    call        @LStrFromString
 000AC0CA    mov         edx,dword ptr [ebp-8]
 000AC0CD    mov         ecx,0AC63C;'WindowState'
 000AC0D2    mov         eax,dword ptr [ebp-4]
 000AC0D5    mov         esi,dword ptr [eax]
 000AC0D7    call        dword ptr [esi+0C];TCustomIniFile.WriteInteger
 000AC0DA    mov         eax,[000B5868];^gvar_000B6B64:Longint
 000AC0DF    mov         eax,dword ptr [eax]
 000AC0E1    push        eax
 000AC0E2    mov         ecx,0AC650;'Cols'
 000AC0E7    mov         edx,0AC660;'Options'
 000AC0EC    mov         eax,dword ptr [ebp-4]
 000AC0EF    mov         esi,dword ptr [eax]
 000AC0F1    call        dword ptr [esi+0C];TCustomIniFile.WriteInteger
 000AC0F4    mov         eax,[000B578C];^gvar_000B6B68:Longint
 000AC0F9    mov         eax,dword ptr [eax]
 000AC0FB    push        eax
 000AC0FC    mov         edx,0AC660;'Options'
 000AC101    mov         ecx,0AC670;'Rows'
 000AC106    mov         eax,dword ptr [ebp-4]
 000AC109    mov         esi,dword ptr [eax]
 000AC10B    call        dword ptr [esi+0C];TCustomIniFile.WriteInteger
 000AC10E    mov         eax,[000B5A20];^gvar_000B6CFC:Boolean
 000AC113    mov         al,byte ptr [eax]
 000AC115    push        eax
 000AC116    mov         edx,0AC660;'Options'
 000AC11B    mov         ecx,0AC680;'TextGridLeft'
 000AC120    mov         eax,dword ptr [ebp-4]
 000AC123    mov         esi,dword ptr [eax]
 000AC125    call        dword ptr [esi+14];TCustomIniFile.WriteBool
 000AC128    mov         eax,[000B58D8];^gvar_000B6BCD:Boolean
 000AC12D    mov         al,byte ptr [eax]
 000AC12F    push        eax
 000AC130    mov         edx,0AC660;'Options'
 000AC135    mov         ecx,0AC698;'HideToolBar'
 000AC13A    mov         eax,dword ptr [ebp-4]
 000AC13D    mov         esi,dword ptr [eax]
 000AC13F    call        dword ptr [esi+14];TCustomIniFile.WriteBool
 000AC142    lea         edx,[ebp-10C]
 000AC148    mov         eax,dword ptr [ebx+310];TFormMain.CMStrGridText:TCMStrGrid
 000AC14E    mov         eax,dword ptr [eax+58];TCMStrGrid.FFont:TFont
 000AC151    call        TFont.GetName
 000AC156    mov         eax,dword ptr [ebp-10C]
 000AC15C    push        eax
 000AC15D    mov         edx,0AC660;'Options'
 000AC162    mov         ecx,0AC6AC;'Font'
 000AC167    mov         eax,dword ptr [ebp-4]
 000AC16A    mov         esi,dword ptr [eax]
 000AC16C    call        dword ptr [esi+4];TIniFile.WriteString
 000AC16F    mov         eax,dword ptr [ebx+310];TFormMain.CMStrGridText:TCMStrGrid
 000AC175    mov         eax,dword ptr [eax+58];TCMStrGrid.FFont:TFont
 000AC178    call        TFont.GetSize
 000AC17D    push        eax
 000AC17E    mov         edx,0AC660;'Options'
 000AC183    mov         ecx,0AC6BC;'FontSize'
 000AC188    mov         eax,dword ptr [ebp-4]
 000AC18B    mov         esi,dword ptr [eax]
 000AC18D    call        dword ptr [esi+0C];TCustomIniFile.WriteInteger
 000AC190    mov         eax,[000B5A50];^gvar_000B6BC5:Longint
 000AC195    movzx       eax,byte ptr [eax]
 000AC198    push        eax
 000AC199    mov         edx,0AC660;'Options'
 000AC19E    mov         ecx,0AC6D0;'ByteOrder'
 000AC1A3    mov         eax,dword ptr [ebp-4]
 000AC1A6    mov         esi,dword ptr [eax]
 000AC1A8    call        dword ptr [esi+0C];TCustomIniFile.WriteInteger
 000AC1AB    mov         eax,[000B5BC4];^gvar_000B6BA8:Longint
 000AC1B0    mov         eax,dword ptr [eax]
 000AC1B2    push        eax
 000AC1B3    mov         edx,0AC660;'Options'
 000AC1B8    mov         ecx,0AC6E4;'ColorBlock'
 000AC1BD    mov         eax,dword ptr [ebp-4]
 000AC1C0    mov         esi,dword ptr [eax]
 000AC1C2    call        dword ptr [esi+0C];TCustomIniFile.WriteInteger
 000AC1C5    lea         edx,[ebp-8]
 000AC1C8    mov         eax,[000B5C04];^gvar_000B6BC7:AnsiString
 000AC1CD    mov         al,byte ptr [eax]
 000AC1CF    call        00074C9C
 000AC1D4    mov         eax,dword ptr [ebp-8]
 000AC1D7    push        eax
 000AC1D8    mov         edx,0AC660;'Options'
 000AC1DD    mov         ecx,0AC6F8;'JokerHex'
 000AC1E2    mov         eax,dword ptr [ebp-4]
 000AC1E5    mov         esi,dword ptr [eax]
 000AC1E7    call        dword ptr [esi+4];TIniFile.WriteString
 000AC1EA    mov         eax,[000B5A4C];^gvar_000B6BD4:Boolean
 000AC1EF    mov         al,byte ptr [eax]
 000AC1F1    push        eax
 000AC1F2    mov         edx,0AC660;'Options'
 000AC1F7    mov         ecx,0AC70C;'FindHex'
 000AC1FC    mov         eax,dword ptr [ebp-4]
 000AC1FF    mov         esi,dword ptr [eax]
 000AC201    call        dword ptr [esi+14];TCustomIniFile.WriteBool
 000AC204    mov         eax,[000B58BC];^gvar_000B6BD5:Boolean
 000AC209    mov         al,byte ptr [eax]
 000AC20B    push        eax
 000AC20C    mov         edx,0AC660;'Options'
 000AC211    mov         ecx,0AC71C;'ReplaceHex'
 000AC216    mov         eax,dword ptr [ebp-4]
 000AC219    mov         esi,dword ptr [eax]
 000AC21B    call        dword ptr [esi+14];TCustomIniFile.WriteBool
 000AC21E    mov         eax,[000B5AF8];^gvar_000B6BD6:Boolean
 000AC223    mov         al,byte ptr [eax]
 000AC225    push        eax
 000AC226    mov         edx,0AC660;'Options'
 000AC22B    mov         ecx,0AC730;'InsHex'
 000AC230    mov         eax,dword ptr [ebp-4]
 000AC233    mov         esi,dword ptr [eax]
 000AC235    call        dword ptr [esi+14];TCustomIniFile.WriteBool
 000AC238    mov         eax,[000B5958];^gvar_000B6BD7:Boolean
 000AC23D    mov         al,byte ptr [eax]
 000AC23F    push        eax
 000AC240    mov         edx,0AC660;'Options'
 000AC245    mov         ecx,0AC740;'UnicodeIns'
 000AC24A    mov         eax,dword ptr [ebp-4]
 000AC24D    mov         esi,dword ptr [eax]
 000AC24F    call        dword ptr [esi+14];TCustomIniFile.WriteBool
 000AC252    mov         eax,[000B58B4];^gvar_000B6BD8:Boolean
 000AC257    mov         al,byte ptr [eax]
 000AC259    push        eax
 000AC25A    mov         edx,0AC660;'Options'
 000AC25F    mov         ecx,0AC754;'UnicodeFind'
 000AC264    mov         eax,dword ptr [ebp-4]
 000AC267    mov         esi,dword ptr [eax]
 000AC269    call        dword ptr [esi+14];TCustomIniFile.WriteBool
 000AC26C    mov         eax,[000B5AD4];^gvar_000B6BD9:Boolean
 000AC271    mov         al,byte ptr [eax]
 000AC273    push        eax
 000AC274    mov         edx,0AC660;'Options'
 000AC279    mov         ecx,0AC768;'UnicodeRepl'
 000AC27E    mov         eax,dword ptr [ebp-4]
 000AC281    mov         esi,dword ptr [eax]
 000AC283    call        dword ptr [esi+14];TCustomIniFile.WriteBool
 000AC286    mov         eax,[000B5AA4];^gvar_000B6BB5:Boolean
 000AC28B    mov         al,byte ptr [eax]
 000AC28D    push        eax
 000AC28E    mov         edx,0AC660;'Options'
 000AC293    mov         ecx,0AC77C;'CaseSensitive'
 000AC298    mov         eax,dword ptr [ebp-4]
 000AC29B    mov         esi,dword ptr [eax]
 000AC29D    call        dword ptr [esi+14];TCustomIniFile.WriteBool
 000AC2A0    mov         eax,[000B5794];^gvar_000B6BC6:Boolean
 000AC2A5    mov         al,byte ptr [eax]
 000AC2A7    push        eax
 000AC2A8    mov         edx,0AC660;'Options'
 000AC2AD    mov         ecx,0AC794;'JokerFind'
 000AC2B2    mov         eax,dword ptr [ebp-4]
 000AC2B5    mov         esi,dword ptr [eax]
 000AC2B7    call        dword ptr [esi+14];TCustomIniFile.WriteBool
 000AC2BA    mov         eax,[000B59EC];^gvar_000B6BCC:Boolean
 000AC2BF    mov         al,byte ptr [eax]
 000AC2C1    push        eax
 000AC2C2    mov         edx,0AC660;'Options'
 000AC2C7    mov         ecx,0AC7A8;'FindDown'
 000AC2CC    mov         eax,dword ptr [ebp-4]
 000AC2CF    mov         esi,dword ptr [eax]
 000AC2D1    call        dword ptr [esi+14];TCustomIniFile.WriteBool
 000AC2D4    mov         eax,[000B57B0];^gvar_000B6BC8:Longint
 000AC2D9    mov         eax,dword ptr [eax]
 000AC2DB    push        eax
 000AC2DC    mov         edx,0AC660;'Options'
 000AC2E1    mov         ecx,0AC7BC;'GotoMode'
 000AC2E6    mov         eax,dword ptr [ebp-4]
 000AC2E9    mov         esi,dword ptr [eax]
 000AC2EB    call        dword ptr [esi+0C];TCustomIniFile.WriteInteger
 000AC2EE    mov         eax,[000B5B1C];^gvar_000B55F8:Longint
 000AC2F3    mov         eax,dword ptr [eax]
 000AC2F5    push        eax
 000AC2F6    mov         edx,0AC660;'Options'
 000AC2FB    mov         ecx,0AC7D0;'BaseAdress'
 000AC300    mov         eax,dword ptr [ebp-4]
 000AC303    mov         esi,dword ptr [eax]
 000AC305    call        dword ptr [esi+0C];TCustomIniFile.WriteInteger
 000AC308    mov         eax,[000B5910];^gvar_000B7004:Longint
 000AC30D    movzx       eax,byte ptr [eax]
 000AC310    push        eax
 000AC311    mov         edx,0AC660;'Options'
 000AC316    mov         ecx,0AC7E4;'EncodeAs'
 000AC31B    mov         eax,dword ptr [ebp-4]
 000AC31E    mov         esi,dword ptr [eax]
 000AC320    call        dword ptr [esi+0C];TCustomIniFile.WriteInteger
 000AC323    mov         eax,[000B5A34];^gvar_000B7005:Longint
 000AC328    movzx       eax,byte ptr [eax]
 000AC32B    push        eax
 000AC32C    mov         edx,0AC660;'Options'
 000AC331    mov         ecx,0AC7F8;'EncodeWhere'
 000AC336    mov         eax,dword ptr [ebp-4]
 000AC339    mov         esi,dword ptr [eax]
 000AC33B    call        dword ptr [esi+0C];TCustomIniFile.WriteInteger
 000AC33E    mov         eax,[000B5744];^gvar_000B6BDA:Boolean
 000AC343    mov         al,byte ptr [eax]
 000AC345    push        eax
 000AC346    mov         edx,0AC660;'Options'
 000AC34B    mov         ecx,0AC80C;'OldFileTime'
 000AC350    mov         eax,dword ptr [ebp-4]
 000AC353    mov         esi,dword ptr [eax]
 000AC355    call        dword ptr [esi+14];TCustomIniFile.WriteBool
 000AC358    mov         eax,[000B5BB4];^gvar_000B6BE8:Boolean
 000AC35D    mov         al,byte ptr [eax]
 000AC35F    push        eax
 000AC360    mov         edx,0AC660;'Options'
 000AC365    mov         ecx,0AC820;'NewEOF'
 000AC36A    mov         eax,dword ptr [ebp-4]
 000AC36D    mov         esi,dword ptr [eax]
 000AC36F    call        dword ptr [esi+14];TCustomIniFile.WriteBool
 000AC372    mov         eax,[000B5A10];^gvar_000B6BE4:AnsiString
 000AC377    mov         eax,dword ptr [eax]
 000AC379    push        eax
 000AC37A    mov         edx,0AC660;'Options'
 000AC37F    mov         ecx,0AC830;'CurrentDir'
 000AC384    mov         eax,dword ptr [ebp-4]
 000AC387    mov         esi,dword ptr [eax]
 000AC389    call        dword ptr [esi+4];TIniFile.WriteString
 000AC38C    mov         eax,[000B5A0C];^gvar_000B6BA6
 000AC391    mov         al,byte ptr [eax]
 000AC393    push        eax
 000AC394    mov         edx,0AC660;'Options'
 000AC399    mov         ecx,0AC844;'Overwrite'
 000AC39E    mov         eax,dword ptr [ebp-4]
 000AC3A1    mov         esi,dword ptr [eax]
 000AC3A3    call        dword ptr [esi+14];TCustomIniFile.WriteBool
 000AC3A6    mov         eax,[000B5B00];^gvar_000B6BA4
 000AC3AB    mov         al,byte ptr [eax]
 000AC3AD    push        eax
 000AC3AE    mov         edx,0AC660;'Options'
 000AC3B3    mov         ecx,0AC858;'ModusText'
 000AC3B8    mov         eax,dword ptr [ebp-4]
 000AC3BB    mov         esi,dword ptr [eax]
 000AC3BD    call        dword ptr [esi+14];TCustomIniFile.WriteBool
 000AC3C0    mov         eax,[000B5B54];^gvar_000B6BF0:Boolean
 000AC3C5    mov         al,byte ptr [eax]
 000AC3C7    push        eax
 000AC3C8    mov         edx,0AC660;'Options'
 000AC3CD    mov         ecx,0AC86C;'Scope'
 000AC3D2    mov         eax,dword ptr [ebp-4]
 000AC3D5    mov         esi,dword ptr [eax]
 000AC3D7    call        dword ptr [esi+14];TCustomIniFile.WriteBool
 000AC3DA    mov         eax,[000B590C];^gvar_000B6CF4:AnsiString
 000AC3DF    mov         eax,dword ptr [eax]
 000AC3E1    push        eax
 000AC3E2    mov         edx,0AC660;'Options'
 000AC3E7    mov         ecx,0AC87C;'ConvTable'
 000AC3EC    mov         eax,dword ptr [ebp-4]
 000AC3EF    mov         esi,dword ptr [eax]
 000AC3F1    call        dword ptr [esi+4];TIniFile.WriteString
 000AC3F4    mov         eax,[000B5AD8];^gvar_000B7006:Boolean
 000AC3F9    mov         al,byte ptr [eax]
 000AC3FB    push        eax
 000AC3FC    mov         edx,0AC660;'Options'
 000AC401    mov         ecx,0AC890;'HideAddressRange'
 000AC406    mov         eax,dword ptr [ebp-4]
 000AC409    mov         esi,dword ptr [eax]
 000AC40B    call        dword ptr [esi+14];TCustomIniFile.WriteBool
 000AC40E    mov         eax,dword ptr [ebx+490];TFormMain.?f490:TMRUFiles
 000AC414    movzx       eax,byte ptr [eax+28];TMRUFiles.FileCount:byte
 000AC418    push        eax
 000AC419    mov         edx,0AC660;'Options'
 000AC41E    mov         ecx,0AC8AC;'MRU'
 000AC423    mov         eax,dword ptr [ebp-4]
 000AC426    mov         esi,dword ptr [eax]
 000AC428    call        dword ptr [esi+0C];TCustomIniFile.WriteInteger
 000AC42B    mov         eax,[000B5648];^gvar_000B7007:Boolean
 000AC430    mov         al,byte ptr [eax]
 000AC432    push        eax
 000AC433    mov         edx,0AC660;'Options'
 000AC438    mov         ecx,0AC8B8;'ShowGrids'
 000AC43D    mov         eax,dword ptr [ebp-4]
 000AC440    mov         esi,dword ptr [eax]
 000AC442    call        dword ptr [esi+14];TCustomIniFile.WriteBool
 000AC445    mov         eax,[000B5B4C];^gvar_000B7013:Boolean
 000AC44A    mov         al,byte ptr [eax]
 000AC44C    push        eax
 000AC44D    mov         edx,0AC660;'Options'
 000AC452    mov         ecx,0AC8CC;'BlankForCC'
 000AC457    mov         eax,dword ptr [ebp-4]
 000AC45A    mov         esi,dword ptr [eax]
 000AC45C    call        dword ptr [esi+14];TCustomIniFile.WriteBool
 000AC45F    mov         eax,dword ptr [ebx+47C];TFormMain.DataInspector1:TMenuItem
 000AC465    mov         al,byte ptr [eax+2C];TMenuItem.Checked:Boolean
 000AC468    push        eax
 000AC469    mov         edx,0AC660;'Options'
 000AC46E    mov         ecx,0AC8E0;'ShowDataInsp'
 000AC473    mov         eax,dword ptr [ebp-4]
 000AC476    mov         ebx,dword ptr [eax]
 000AC478    call        dword ptr [ebx+14];TCustomIniFile.WriteBool
 000AC47B    mov         eax,[000B59FC];^gvar_000B700A:Boolean
 000AC480    mov         al,byte ptr [eax]
 000AC482    push        eax
 000AC483    mov         ecx,0AC8F8;'short'
 000AC488    mov         edx,0AC908;'DataInsp'
 000AC48D    mov         eax,dword ptr [ebp-4]
 000AC490    mov         ebx,dword ptr [eax]
 000AC492    call        dword ptr [ebx+14];TCustomIniFile.WriteBool
 000AC495    mov         eax,[000B57A8];^gvar_000B700B:Boolean
 000AC49A    mov         al,byte ptr [eax]
 000AC49C    push        eax
 000AC49D    mov         edx,0AC908;'DataInsp'
 000AC4A2    mov         ecx,0AC91C;'byte'
 000AC4A7    mov         eax,dword ptr [ebp-4]
 000AC4AA    mov         ebx,dword ptr [eax]
 000AC4AC    call        dword ptr [ebx+14];TCustomIniFile.WriteBool
 000AC4AF    mov         eax,[000B5B18];^gvar_000B700C:Boolean
 000AC4B4    mov         al,byte ptr [eax]
 000AC4B6    push        eax
 000AC4B7    mov         edx,0AC908;'DataInsp'
 000AC4BC    mov         ecx,0AC92C;'word'
 000AC4C1    mov         eax,dword ptr [ebp-4]
 000AC4C4    mov         ebx,dword ptr [eax]
 000AC4C6    call        dword ptr [ebx+14];TCustomIniFile.WriteBool
 000AC4C9    mov         eax,[000B5920];^gvar_000B700D:Boolean
 000AC4CE    mov         al,byte ptr [eax]
 000AC4D0    push        eax
 000AC4D1    mov         edx,0AC908;'DataInsp'
 000AC4D6    mov         ecx,0AC93C;'int'
 000AC4DB    mov         eax,dword ptr [ebp-4]
 000AC4DE    mov         ebx,dword ptr [eax]
 000AC4E0    call        dword ptr [ebx+14];TCustomIniFile.WriteBool
 000AC4E3    mov         eax,[000B56D0];^gvar_000B700E:Boolean
 000AC4E8    mov         al,byte ptr [eax]
 000AC4EA    push        eax
 000AC4EB    mov         edx,0AC908;'DataInsp'
 000AC4F0    mov         ecx,0AC948;'long'
 000AC4F5    mov         eax,dword ptr [ebp-4]
 000AC4F8    mov         ebx,dword ptr [eax]
 000AC4FA    call        dword ptr [ebx+14];TCustomIniFile.WriteBool
 000AC4FD    mov         eax,[000B5664];^gvar_000B700F:Boolean
 000AC502    mov         al,byte ptr [eax]
 000AC504    push        eax
 000AC505    mov         edx,0AC908;'DataInsp'
 000AC50A    mov         ecx,0AC958;'single'
 000AC50F    mov         eax,dword ptr [ebp-4]
 000AC512    mov         ebx,dword ptr [eax]
 000AC514    call        dword ptr [ebx+14];TCustomIniFile.WriteBool
 000AC517    mov         eax,[000B59CC];^gvar_000B7010:Boolean
 000AC51C    mov         al,byte ptr [eax]
 000AC51E    push        eax
 000AC51F    mov         edx,0AC908;'DataInsp'
 000AC524    mov         ecx,0AC968;'double'
 000AC529    mov         eax,dword ptr [ebp-4]
 000AC52C    mov         ebx,dword ptr [eax]
 000AC52E    call        dword ptr [ebx+14];TCustomIniFile.WriteBool
 000AC531    mov         eax,[000B5980];^gvar_000B7011:Boolean
 000AC536    mov         al,byte ptr [eax]
 000AC538    push        eax
 000AC539    mov         edx,0AC908;'DataInsp'
 000AC53E    mov         ecx,0AC978;'bin'
 000AC543    mov         eax,dword ptr [ebp-4]
 000AC546    mov         ebx,dword ptr [eax]
 000AC548    call        dword ptr [ebx+14];TCustomIniFile.WriteBool
 000AC54B    mov         eax,[000B5A00];^gvar_000B7012:Boolean
 000AC550    mov         al,byte ptr [eax]
 000AC552    push        eax
 000AC553    mov         edx,0AC908;'DataInsp'
 000AC558    mov         ecx,0AC984;'BlockSize'
 000AC55D    mov         eax,dword ptr [ebp-4]
 000AC560    mov         ebx,dword ptr [eax]
 000AC562    call        dword ptr [ebx+14];TCustomIniFile.WriteBool
 000AC565    xor         eax,eax
 000AC567    pop         edx
 000AC568    pop         ecx
 000AC569    pop         ecx
 000AC56A    mov         dword ptr fs:[eax],edx
>000AC56D    jmp         000AC58E
>000AC56F    jmp         @HandleAnyException
 000AC574    lea         edx,[ebp-8]
 000AC577    mov         eax,819
 000AC57C    call        LoadStr;'Error writing XVI32.INI'
 000AC581    mov         eax,dword ptr [ebp-8]
 000AC584    call        0008D0A8
 000AC589    call        @DoneExcept
 000AC58E    xor         eax,eax
 000AC590    pop         edx
 000AC591    pop         ecx
 000AC592    pop         ecx
 000AC593    mov         dword ptr fs:[eax],edx
 000AC596    push        0AC5AB
 000AC59B    mov         eax,dword ptr [ebp-4]
 000AC59E    call        TObject.Free
 000AC5A3    ret
>000AC5A4    jmp         @HandleFinally
>000AC5A9    jmp         000AC59B
 000AC5AB    xor         eax,eax
 000AC5AD    pop         edx
 000AC5AE    pop         ecx
 000AC5AF    pop         ecx
 000AC5B0    mov         dword ptr fs:[eax],edx
 000AC5B3    push        0AC5D3
 000AC5B8    lea         eax,[ebp-10C]
 000AC5BE    call        @LStrClr
 000AC5C3    lea         eax,[ebp-8]
 000AC5C6    call        @LStrClr
 000AC5CB    ret
>000AC5CC    jmp         @HandleFinally
>000AC5D1    jmp         000AC5B8
 000AC5D3    pop         edi
 000AC5D4    pop         esi
 000AC5D5    pop         ebx
 000AC5D6    mov         esp,ebp
 000AC5D8    pop         ebp
 000AC5D9    ret
*}
end;

//000AC990
procedure sub_000AC990(?:TFormMain);
begin
{*
 000AC990    push        ebx
 000AC991    push        esi
 000AC992    mov         ebx,eax
 000AC994    mov         eax,[000B5A20];^gvar_000B6CFC:Boolean
 000AC999    cmp         byte ptr [eax],0
>000AC99C    je          000AC9FE
 000AC99E    mov         eax,[000B5AD8];^gvar_000B7006:Boolean
 000AC9A3    cmp         byte ptr [eax],0
>000AC9A6    je          000AC9B7
 000AC9A8    xor         edx,edx
 000AC9AA    mov         eax,dword ptr [ebx+310];TFormMain.CMStrGridText:TCMStrGrid
 000AC9B0    call        TControl.SetLeft
>000AC9B5    jmp         000AC9D9
 000AC9B7    push        5
 000AC9B9    call        user32.GetSystemMetrics
 000AC9BE    mov         edx,eax
 000AC9C0    mov         esi,dword ptr [ebx+420];TFormMain.CMStrGridAddr:TCMStrGrid
 000AC9C6    mov         eax,dword ptr [esi+30];TCMStrGrid.Left:Integer
 000AC9C9    add         eax,dword ptr [esi+38];TCMStrGrid.Width:Integer
 000AC9CC    add         edx,eax
 000AC9CE    mov         eax,dword ptr [ebx+310];TFormMain.CMStrGridText:TCMStrGrid
 000AC9D4    call        TControl.SetLeft
 000AC9D9    push        5
 000AC9DB    call        user32.GetSystemMetrics
 000AC9E0    mov         edx,eax
 000AC9E2    mov         esi,dword ptr [ebx+310];TFormMain.CMStrGridText:TCMStrGrid
 000AC9E8    mov         eax,dword ptr [esi+30];TCMStrGrid.Left:Integer
 000AC9EB    add         eax,dword ptr [esi+38];TCMStrGrid.Width:Integer
 000AC9EE    add         edx,eax
 000AC9F0    mov         eax,dword ptr [ebx+314];TFormMain.CMStrGridHex:TCMStrGrid
 000AC9F6    call        TControl.SetLeft
 000AC9FB    pop         esi
 000AC9FC    pop         ebx
 000AC9FD    ret
 000AC9FE    mov         eax,[000B5AD8];^gvar_000B7006:Boolean
 000ACA03    cmp         byte ptr [eax],0
>000ACA06    je          000ACA17
 000ACA08    xor         edx,edx
 000ACA0A    mov         eax,dword ptr [ebx+314];TFormMain.CMStrGridHex:TCMStrGrid
 000ACA10    call        TControl.SetLeft
>000ACA15    jmp         000ACA39
 000ACA17    push        5
 000ACA19    call        user32.GetSystemMetrics
 000ACA1E    mov         edx,eax
 000ACA20    mov         esi,dword ptr [ebx+420];TFormMain.CMStrGridAddr:TCMStrGrid
 000ACA26    mov         eax,dword ptr [esi+30];TCMStrGrid.Left:Integer
 000ACA29    add         eax,dword ptr [esi+38];TCMStrGrid.Width:Integer
 000ACA2C    add         edx,eax
 000ACA2E    mov         eax,dword ptr [ebx+314];TFormMain.CMStrGridHex:TCMStrGrid
 000ACA34    call        TControl.SetLeft
 000ACA39    push        5
 000ACA3B    call        user32.GetSystemMetrics
 000ACA40    mov         edx,eax
 000ACA42    mov         esi,dword ptr [ebx+314];TFormMain.CMStrGridHex:TCMStrGrid
 000ACA48    mov         eax,dword ptr [esi+30];TCMStrGrid.Left:Integer
 000ACA4B    add         eax,dword ptr [esi+38];TCMStrGrid.Width:Integer
 000ACA4E    add         edx,eax
 000ACA50    mov         eax,dword ptr [ebx+310];TFormMain.CMStrGridText:TCMStrGrid
 000ACA56    call        TControl.SetLeft
 000ACA5B    pop         esi
 000ACA5C    pop         ebx
 000ACA5D    ret
*}
end;

//000ACA60
procedure TFormMain.FormResize(Sender:TObject);
begin
{*
 000ACA60    push        ebx
 000ACA61    push        esi
 000ACA62    push        edi
 000ACA63    add         esp,0FFFFFFF8
 000ACA66    mov         ebx,eax
 000ACA68    mov         edx,dword ptr [ebx+38];TFormMain.Width:Integer
 000ACA6B    mov         eax,ebx
 000ACA6D    call        000AB204
 000ACA72    mov         esi,eax
 000ACA74    mov         edx,dword ptr [ebx+3C];TFormMain.Height:Integer
 000ACA77    mov         eax,ebx
 000ACA79    call        000AB2BC
 000ACA7E    mov         edi,eax
 000ACA80    mov         dword ptr [esp],esi
 000ACA83    mov         dword ptr [esp+4],8
 000ACA8B    mov         eax,esp
 000ACA8D    mov         edx,1
 000ACA92    call        000752A4
 000ACA97    mov         esi,eax
 000ACA99    mov         dword ptr [esp],edi
 000ACA9C    mov         dword ptr [esp+4],8
 000ACAA4    mov         eax,esp
 000ACAA6    mov         edx,1
 000ACAAB    call        000752A4
 000ACAB0    mov         edi,eax
 000ACAB2    mov         ecx,edi
 000ACAB4    mov         edx,esi
 000ACAB6    mov         eax,ebx
 000ACAB8    call        000AE0E8
 000ACABD    pop         ecx
 000ACABE    pop         edx
 000ACABF    pop         edi
 000ACAC0    pop         esi
 000ACAC1    pop         ebx
 000ACAC2    ret
*}
end;

//000ACAC4
procedure sub_000ACAC4(?:TFormMain);
begin
{*
 000ACAC4    push        ebp
 000ACAC5    mov         ebp,esp
 000ACAC7    add         esp,0FFFFFF68
 000ACACD    push        ebx
 000ACACE    xor         edx,edx
 000ACAD0    mov         dword ptr [ebp-98],edx
 000ACAD6    mov         dword ptr [ebp-90],edx
 000ACADC    mov         dword ptr [ebp-94],edx
 000ACAE2    mov         ebx,eax
 000ACAE4    xor         eax,eax
 000ACAE6    push        ebp
 000ACAE7    push        0ACD7B
 000ACAEC    push        dword ptr fs:[eax]
 000ACAEF    mov         dword ptr fs:[eax],esp
 000ACAF2    mov         eax,[000B5BEC];^gvar_000B6BB4
 000ACAF7    mov         byte ptr [eax],1
 000ACAFA    mov         eax,dword ptr [ebx+2EC]
 000ACB00    mov         dword ptr [ebp-80],eax
 000ACB03    mov         eax,dword ptr [ebx+3A0]
 000ACB09    mov         dword ptr [ebp-7C],eax
 000ACB0C    mov         eax,dword ptr [ebx+2F0]
 000ACB12    mov         dword ptr [ebp-78],eax
 000ACB15    mov         eax,dword ptr [ebx+344]
 000ACB1B    mov         dword ptr [ebp-74],eax
 000ACB1E    mov         eax,dword ptr [ebx+410]
 000ACB24    mov         dword ptr [ebp-70],eax
 000ACB27    mov         eax,dword ptr [ebx+3AC]
 000ACB2D    mov         dword ptr [ebp-6C],eax
 000ACB30    mov         eax,dword ptr [ebx+3BC]
 000ACB36    mov         dword ptr [ebp-68],eax
 000ACB39    mov         eax,dword ptr [ebx+318]
 000ACB3F    mov         dword ptr [ebp-64],eax
 000ACB42    mov         eax,dword ptr [ebx+320]
 000ACB48    mov         dword ptr [ebp-60],eax
 000ACB4B    mov         eax,dword ptr [ebx+334]
 000ACB51    mov         dword ptr [ebp-5C],eax
 000ACB54    mov         eax,dword ptr [ebx+338]
 000ACB5A    mov         dword ptr [ebp-58],eax
 000ACB5D    mov         eax,dword ptr [ebx+3F4]
 000ACB63    mov         dword ptr [ebp-54],eax
 000ACB66    mov         eax,dword ptr [ebx+3C8]
 000ACB6C    mov         dword ptr [ebp-50],eax
 000ACB6F    mov         eax,dword ptr [ebx+3CC]
 000ACB75    mov         dword ptr [ebp-4C],eax
 000ACB78    mov         eax,dword ptr [ebx+33C]
 000ACB7E    mov         dword ptr [ebp-48],eax
 000ACB81    mov         eax,dword ptr [ebx+34C]
 000ACB87    mov         dword ptr [ebp-44],eax
 000ACB8A    mov         eax,dword ptr [ebx+35C]
 000ACB90    mov         dword ptr [ebp-40],eax
 000ACB93    mov         eax,dword ptr [ebx+370]
 000ACB99    mov         dword ptr [ebp-3C],eax
 000ACB9C    mov         eax,dword ptr [ebx+374]
 000ACBA2    mov         dword ptr [ebp-38],eax
 000ACBA5    mov         eax,dword ptr [ebx+41C]
 000ACBAB    mov         dword ptr [ebp-34],eax
 000ACBAE    mov         eax,dword ptr [ebx+480]
 000ACBB4    mov         dword ptr [ebp-30],eax
 000ACBB7    mov         eax,dword ptr [ebx+3A4]
 000ACBBD    mov         dword ptr [ebp-2C],eax
 000ACBC0    mov         eax,dword ptr [ebx+48C]
 000ACBC6    mov         dword ptr [ebp-28],eax
 000ACBC9    mov         eax,dword ptr [ebx+37C]
 000ACBCF    mov         dword ptr [ebp-24],eax
 000ACBD2    mov         eax,dword ptr [ebx+388]
 000ACBD8    mov         dword ptr [ebp-20],eax
 000ACBDB    mov         eax,dword ptr [ebx+390]
 000ACBE1    mov         dword ptr [ebp-1C],eax
 000ACBE4    mov         eax,dword ptr [ebx+404]
 000ACBEA    mov         dword ptr [ebp-18],eax
 000ACBED    mov         eax,dword ptr [ebx+3D8]
 000ACBF3    mov         dword ptr [ebp-14],eax
 000ACBF6    mov         eax,dword ptr [ebx+3E8]
 000ACBFC    mov         dword ptr [ebp-10],eax
 000ACBFF    mov         eax,dword ptr [ebx+424]
 000ACC05    mov         dword ptr [ebp-0C],eax
 000ACC08    mov         eax,dword ptr [ebx+428]
 000ACC0E    mov         dword ptr [ebp-8],eax
 000ACC11    mov         eax,dword ptr [ebx+42C]
 000ACC17    mov         dword ptr [ebp-4],eax
 000ACC1A    lea         eax,[ebp-80]
 000ACC1D    mov         cl,1
 000ACC1F    mov         edx,1F
 000ACC24    call        00099514
 000ACC29    mov         eax,[000B5994];^gvar_000B7008
 000ACC2E    cmp         byte ptr [eax],0
>000ACC31    je          000ACC5D
 000ACC33    mov         eax,dword ptr [ebx+2EC]
 000ACC39    mov         dword ptr [ebp-88],eax
 000ACC3F    mov         eax,dword ptr [ebx+3A0]
 000ACC45    mov         dword ptr [ebp-84],eax
 000ACC4B    lea         eax,[ebp-88]
 000ACC51    xor         ecx,ecx
 000ACC53    mov         edx,1
 000ACC58    call        00099514
 000ACC5D    mov         eax,dword ptr [ebx+398]
 000ACC63    mov         dword ptr [ebp-8C],eax
 000ACC69    lea         eax,[ebp-8C]
 000ACC6F    xor         ecx,ecx
 000ACC71    xor         edx,edx
 000ACC73    call        00099514
 000ACC78    mov         ecx,dword ptr ds:[0B5988];^gvar_000B6BE9
 000ACC7E    mov         cl,byte ptr [ecx]
 000ACC80    xor         cl,1
 000ACC83    mov         eax,dword ptr [ebx+484]
 000ACC89    mov         dword ptr [ebp-8C],eax
 000ACC8F    lea         eax,[ebp-8C]
 000ACC95    xor         edx,edx
 000ACC97    call        00099514
 000ACC9C    mov         eax,[000B5984];^gvar_000B6B84
 000ACCA1    mov         dword ptr [eax],1
 000ACCA7    xor         eax,eax
 000ACCA9    call        00099D98
 000ACCAE    mov         eax,[000B5778];^gvar_000B6BA5
 000ACCB3    mov         byte ptr [eax],0
 000ACCB6    mov         eax,[000B5888];^gvar_000B6B9C
 000ACCBB    mov         dword ptr [eax],1
 000ACCC1    mov         eax,[000B5990];^gvar_000B6B94
 000ACCC6    xor         edx,edx
 000ACCC8    mov         dword ptr [eax],edx
 000ACCCA    mov         eax,[000B5C1C];^gvar_000B6B98
 000ACCCF    xor         edx,edx
 000ACCD1    mov         dword ptr [eax],edx
 000ACCD3    lea         edx,[ebp-94]
 000ACCD9    mov         eax,[000B5B50];^gvar_000B6B78:AnsiString
 000ACCDE    mov         eax,dword ptr [eax]
 000ACCE0    call        ExtractFileName
 000ACCE5    mov         ecx,dword ptr [ebp-94]
 000ACCEB    lea         eax,[ebp-90]
 000ACCF1    mov         edx,0ACD90;'XVI32 - '
 000ACCF6    call        @LStrCat3
 000ACCFB    mov         edx,dword ptr [ebp-90]
 000ACD01    mov         eax,ebx
 000ACD03    call        TControl.SetText
 000ACD08    lea         edx,[ebp-98]
 000ACD0E    mov         eax,ebx
 000ACD10    call        TControl.GetText
 000ACD15    mov         edx,dword ptr [ebp-98]
 000ACD1B    mov         eax,[000B59E8];^Application:TApplication
 000ACD20    mov         eax,dword ptr [eax]
 000ACD22    call        TApplication.SetTitle
 000ACD27    mov         eax,[000B5984];^gvar_000B6B84
 000ACD2C    mov         eax,dword ptr [eax]
 000ACD2E    xor         ecx,ecx
 000ACD30    mov         dl,1
 000ACD32    call        000998B0
 000ACD37    xor         edx,edx
 000ACD39    xor         eax,eax
 000ACD3B    call        00098750
 000ACD40    call        000983B8
 000ACD45    mov         dl,1
 000ACD47    mov         eax,dword ptr [ebx+4C8]
 000ACD4D    mov         ecx,dword ptr [eax]
 000ACD4F    call        dword ptr [ecx+60]
 000ACD52    xor         eax,eax
 000ACD54    pop         edx
 000ACD55    pop         ecx
 000ACD56    pop         ecx
 000ACD57    mov         dword ptr fs:[eax],edx
 000ACD5A    push        0ACD82
 000ACD5F    lea         eax,[ebp-98]
 000ACD65    call        @LStrClr
 000ACD6A    lea         eax,[ebp-94]
 000ACD70    mov         edx,2
 000ACD75    call        @LStrArrayClr
 000ACD7A    ret
>000ACD7B    jmp         @HandleFinally
>000ACD80    jmp         000ACD5F
 000ACD82    pop         ebx
 000ACD83    mov         esp,ebp
 000ACD85    pop         ebp
 000ACD86    ret
*}
end;

//000ACD9C
{*procedure sub_000ACD9C(?:TFormMain; ?:TObject; ?:?);
begin
 000ACD9C    push        ebp
 000ACD9D    mov         ebp,esp
 000ACD9F    add         esp,0FFFFFFE4
 000ACDA2    push        ebx
 000ACDA3    push        esi
 000ACDA4    push        edi
 000ACDA5    xor         ebx,ebx
 000ACDA7    mov         dword ptr [ebp-10],ebx
 000ACDAA    mov         dword ptr [ebp-0C],ebx
 000ACDAD    mov         dword ptr [ebp-1C],ebx
 000ACDB0    mov         dword ptr [ebp-4],ecx
 000ACDB3    mov         edi,edx
 000ACDB5    mov         esi,eax
 000ACDB7    mov         eax,dword ptr [ebp-4]
 000ACDBA    call        @LStrAddRef
 000ACDBF    xor         eax,eax
 000ACDC1    push        ebp
 000ACDC2    push        0AD00A
 000ACDC7    push        dword ptr fs:[eax]
 000ACDCA    mov         dword ptr fs:[eax],esp
 000ACDCD    lea         eax,[ebp-0C]
 000ACDD0    push        eax
 000ACDD1    mov         ebx,edi
 000ACDD3    mov         eax,dword ptr [ebx+8]
 000ACDD6    mov         ecx,5
 000ACDDB    mov         edx,1
 000ACDE0    call        @LStrCopy
 000ACDE5    mov         eax,dword ptr [ebp-0C]
 000ACDE8    mov         edx,0AD020;'__MRU'
 000ACDED    call        @LStrCmp
>000ACDF2    jne         000ACE06
 000ACDF4    lea         edx,[ebp-5]
 000ACDF7    mov         eax,esi
 000ACDF9    call        000AD130
 000ACDFE    test        al,al
>000ACE00    je          000ACFDC
 000ACE06    mov         eax,dword ptr [ebp-4]
 000ACE09    call        0009B9FC
 000ACE0E    test        al,al
>000ACE10    je          000ACE3F
 000ACE12    lea         edx,[ebp-10]
 000ACE15    mov         eax,857
 000ACE1A    call        LoadStr;'Accessing network, please wait (may take a minute)...'
 000ACE1F    mov         eax,dword ptr [ebp-10]
 000ACE22    push        eax
 000ACE23    mov         eax,dword ptr [esi+2C4];TFormMain.StatusBar1:TStatusBar
 000ACE29    mov         eax,dword ptr [eax+1EC];TStatusBar.Panels:TStatusPanels
 000ACE2F    mov         edx,3
 000ACE34    call        TCoolBands.GetItem
 000ACE39    pop         edx
 000ACE3A    call        TStatusPanel.SetText
 000ACE3F    lea         eax,[ebp-0C]
 000ACE42    push        eax
 000ACE43    mov         eax,dword ptr [ebx+8]
 000ACE46    mov         ecx,5
 000ACE4B    mov         edx,1
 000ACE50    call        @LStrCopy
 000ACE55    mov         eax,dword ptr [ebp-0C]
 000ACE58    mov         edx,0AD020;'__MRU'
 000ACE5D    call        @LStrCmp
>000ACE62    jne         000ACE6C
 000ACE64    mov         eax,[000B5994];^gvar_000B7008
 000ACE69    mov         byte ptr [eax],0
 000ACE6C    mov         ecx,1
 000ACE71    xor         edx,edx
 000ACE73    mov         eax,dword ptr [ebp-4]
 000ACE76    call        00098DCC
 000ACE7B    mov         ebx,eax
 000ACE7D    cmp         ebx,20
>000ACE80    je          000ACE87
 000ACE82    cmp         ebx,5
>000ACE85    jne         000ACEE0
 000ACE87    mov         eax,[000B5994];^gvar_000B7008
 000ACE8C    cmp         byte ptr [eax],0
>000ACE8F    jne         000ACEE0
 000ACE91    lea         eax,[ebp-10]
 000ACE94    push        eax
 000ACE95    lea         edx,[ebp-1C]
 000ACE98    mov         eax,dword ptr [ebp-4]
 000ACE9B    call        ExtractFileName
 000ACEA0    mov         eax,dword ptr [ebp-1C]
 000ACEA3    mov         dword ptr [ebp-18],eax
 000ACEA6    mov         byte ptr [ebp-14],0B
 000ACEAA    lea         edx,[ebp-18]
 000ACEAD    xor         ecx,ecx
 000ACEAF    mov         eax,7D0
 000ACEB4    call        FmtLoadStr;'%s: access denied or opened by another application.
Try to open in Read Only mode?'
 000ACEB9    mov         eax,dword ptr [ebp-10]
 000ACEBC    call        0008D0C4
 000ACEC1    cmp         ax,6
>000ACEC5    jne         000ACEE0
 000ACEC7    mov         eax,[000B5994];^gvar_000B7008
 000ACECC    mov         byte ptr [eax],1
 000ACECF    mov         ecx,1
 000ACED4    xor         edx,edx
 000ACED6    mov         eax,dword ptr [ebp-4]
 000ACED9    call        00098DCC
 000ACEDE    mov         ebx,eax
 000ACEE0    test        ebx,ebx
>000ACEE2    jne         000ACFD3
 000ACEE8    lea         eax,[ebp-0C]
 000ACEEB    push        eax
 000ACEEC    mov         eax,dword ptr [edi+8]
 000ACEEF    mov         ecx,5
 000ACEF4    mov         edx,1
 000ACEF9    call        @LStrCopy
 000ACEFE    mov         eax,dword ptr [ebp-0C]
 000ACF01    mov         edx,0AD020;'__MRU'
 000ACF06    call        @LStrCmp
>000ACF0B    je          000ACF1D
 000ACF0D    mov         edx,dword ptr [ebp-4]
 000ACF10    mov         eax,dword ptr [esi+490];TFormMain.?f490:TMRUFiles
 000ACF16    call        0008868C
>000ACF1B    jmp         000ACF25
 000ACF1D    mov         eax,[000B5988];^gvar_000B6BE9
 000ACF22    mov         byte ptr [eax],0
 000ACF25    mov         eax,[000B5B50];^gvar_000B6B78:AnsiString
 000ACF2A    mov         edx,dword ptr [ebp-4]
 000ACF2D    call        @LStrAsg
 000ACF32    lea         edx,[ebp-10]
 000ACF35    mov         eax,dword ptr [ebp-4]
 000ACF38    call        ExtractFileDir
 000ACF3D    mov         edx,dword ptr [ebp-10]
 000ACF40    mov         eax,[000B5A10];^gvar_000B6BE4:AnsiString
 000ACF45    call        @LStrAsg
 000ACF4A    mov         eax,[000B5994];^gvar_000B7008
 000ACF4F    cmp         byte ptr [eax],0
>000ACF52    je          000ACF83
 000ACF54    lea         edx,[ebp-10]
 000ACF57    mov         eax,831
 000ACF5C    call        LoadStr;'File opened in Read Only mode!'
 000ACF61    mov         eax,dword ptr [ebp-10]
 000ACF64    push        eax
 000ACF65    mov         eax,dword ptr [esi+2C4];TFormMain.StatusBar1:TStatusBar
 000ACF6B    mov         eax,dword ptr [eax+1EC];TStatusBar.Panels:TStatusPanels
 000ACF71    mov         edx,3
 000ACF76    call        TCoolBands.GetItem
 000ACF7B    pop         edx
 000ACF7C    call        TStatusPanel.SetText
>000ACF81    jmp         000ACFCA
 000ACF83    mov         eax,[000B5B50];^gvar_000B6B78:AnsiString
 000ACF88    mov         eax,dword ptr [eax]
 000ACF8A    call        FileGetAttr
 000ACF8F    and         eax,1
 000ACF92    dec         eax
>000ACF93    jne         000ACFCA
 000ACF95    mov         eax,[000B5994];^gvar_000B7008
 000ACF9A    mov         byte ptr [eax],1
 000ACF9D    lea         edx,[ebp-10]
 000ACFA0    mov         eax,832
 000ACFA5    call        LoadStr;'File is in Read Only mode!'
 000ACFAA    mov         eax,dword ptr [ebp-10]
 000ACFAD    push        eax
 000ACFAE    mov         eax,dword ptr [esi+2C4];TFormMain.StatusBar1:TStatusBar
 000ACFB4    mov         eax,dword ptr [eax+1EC];TStatusBar.Panels:TStatusPanels
 000ACFBA    mov         edx,3
 000ACFBF    call        TCoolBands.GetItem
 000ACFC4    pop         edx
 000ACFC5    call        TStatusPanel.SetText
 000ACFCA    mov         eax,esi
 000ACFCC    call        000ACAC4
>000ACFD1    jmp         000ACFDC
 000ACFD3    mov         edx,edi
 000ACFD5    mov         eax,esi
 000ACFD7    call        TFormMain.Close1Click
 000ACFDC    xor         eax,eax
 000ACFDE    pop         edx
 000ACFDF    pop         ecx
 000ACFE0    pop         ecx
 000ACFE1    mov         dword ptr fs:[eax],edx
 000ACFE4    push        0AD011
 000ACFE9    lea         eax,[ebp-1C]
 000ACFEC    call        @LStrClr
 000ACFF1    lea         eax,[ebp-10]
 000ACFF4    call        @LStrClr
 000ACFF9    lea         eax,[ebp-0C]
 000ACFFC    call        @LStrClr
 000AD001    lea         eax,[ebp-4]
 000AD004    call        @LStrClr
 000AD009    ret
>000AD00A    jmp         @HandleFinally
>000AD00F    jmp         000ACFE9
 000AD011    pop         edi
 000AD012    pop         esi
 000AD013    pop         ebx
 000AD014    mov         esp,ebp
 000AD016    pop         ebp
 000AD017    ret
end;*}

//000AD028
procedure TFormMain.Info1Click(Sender:TObject);
begin
{*
 000AD028    push        ebp
 000AD029    mov         ebp,esp
 000AD02B    add         esp,0FFFFFFCC
 000AD02E    push        ebx
 000AD02F    xor         ecx,ecx
 000AD031    mov         dword ptr [ebp-4],ecx
 000AD034    mov         ebx,eax
 000AD036    xor         eax,eax
 000AD038    push        ebp
 000AD039    push        0AD124
 000AD03E    push        dword ptr fs:[eax]
 000AD041    mov         dword ptr fs:[eax],esp
 000AD044    mov         ecx,ebx
 000AD046    mov         dl,1
 000AD048    mov         eax,[000A0978];TFormAbout2
 000AD04D    call        TCustomForm.Create;TFormAbout2.Create
 000AD052    mov         edx,dword ptr ds:[0B5ADC];^gvar_000B7064:TFormAbout2
 000AD058    mov         dword ptr [edx],eax
 000AD05A    xor         eax,eax
 000AD05C    push        ebp
 000AD05D    push        0AD107
 000AD062    push        dword ptr fs:[eax]
 000AD065    mov         dword ptr fs:[eax],esp
 000AD068    lea         eax,[ebp-4]
 000AD06B    push        eax
 000AD06C    mov         eax,[000B5BA0];^gvar_000B6BAC:Single
 000AD071    fild        dword ptr [eax]
 000AD073    call        @INT
 000AD078    fstp        tbyte ptr [ebp-20]
 000AD07B    wait
 000AD07C    lea         eax,[ebp-20]
 000AD07F    mov         dword ptr [ebp-14],eax
 000AD082    mov         byte ptr [ebp-10],3
 000AD086    mov         eax,[000B5790];^gvar_000B6B70:TCMDynArray
 000AD08B    mov         eax,dword ptr [eax]
 000AD08D    mov         eax,dword ptr [eax+0C]
 000AD090    mov         dword ptr [ebp-28],eax
 000AD093    xor         eax,eax
 000AD095    mov         dword ptr [ebp-24],eax
 000AD098    fild        qword ptr [ebp-28]
 000AD09B    call        @INT
 000AD0A0    fstp        tbyte ptr [ebp-34]
 000AD0A3    wait
 000AD0A4    lea         eax,[ebp-34]
 000AD0A7    mov         dword ptr [ebp-0C],eax
 000AD0AA    mov         byte ptr [ebp-8],3
 000AD0AE    lea         edx,[ebp-14]
 000AD0B1    mov         ecx,1
 000AD0B6    mov         eax,7DA
 000AD0BB    call        FmtLoadStr;'Current file size: %.0n bytes
Memory allocated: %.0n bytes'
 000AD0C0    mov         edx,dword ptr [ebp-4]
 000AD0C3    mov         eax,[000B5ADC];^gvar_000B7064:TFormAbout2
 000AD0C8    mov         eax,dword ptr [eax]
 000AD0CA    mov         eax,dword ptr [eax+2D4]
 000AD0D0    call        TControl.SetText
 000AD0D5    mov         eax,[000B5ADC];^gvar_000B7064:TFormAbout2
 000AD0DA    mov         eax,dword ptr [eax]
 000AD0DC    mov         edx,dword ptr [eax]
 000AD0DE    call        dword ptr [edx+0CC]
 000AD0E4    xor         eax,eax
 000AD0E6    pop         edx
 000AD0E7    pop         ecx
 000AD0E8    pop         ecx
 000AD0E9    mov         dword ptr fs:[eax],edx
 000AD0EC    push        0AD10E
 000AD0F1    mov         eax,[000B5ADC];^gvar_000B7064:TFormAbout2
 000AD0F6    mov         eax,dword ptr [eax]
 000AD0F8    call        TCustomForm.Release
 000AD0FD    mov         eax,[000B5ADC];^gvar_000B7064:TFormAbout2
 000AD102    xor         edx,edx
 000AD104    mov         dword ptr [eax],edx
 000AD106    ret
>000AD107    jmp         @HandleFinally
>000AD10C    jmp         000AD0F1
 000AD10E    xor         eax,eax
 000AD110    pop         edx
 000AD111    pop         ecx
 000AD112    pop         ecx
 000AD113    mov         dword ptr fs:[eax],edx
 000AD116    push        0AD12B
 000AD11B    lea         eax,[ebp-4]
 000AD11E    call        @LStrClr
 000AD123    ret
>000AD124    jmp         @HandleFinally
>000AD129    jmp         000AD11B
 000AD12B    pop         ebx
 000AD12C    mov         esp,ebp
 000AD12E    pop         ebp
 000AD12F    ret
*}
end;

//000AD130
{*function sub_000AD130(?:TFormMain; ?:?):?;
begin
 000AD130    push        ebp
 000AD131    mov         ebp,esp
 000AD133    add         esp,0FFFFFFF0
 000AD136    push        ebx
 000AD137    push        esi
 000AD138    xor         ecx,ecx
 000AD13A    mov         dword ptr [ebp-4],ecx
 000AD13D    mov         dword ptr [ebp-10],ecx
 000AD140    mov         esi,edx
 000AD142    mov         ebx,eax
 000AD144    xor         eax,eax
 000AD146    push        ebp
 000AD147    push        0AD223
 000AD14C    push        dword ptr fs:[eax]
 000AD14F    mov         dword ptr fs:[eax],esp
 000AD152    mov         byte ptr [esi],0
 000AD155    mov         eax,[000B5778];^gvar_000B6BA5
 000AD15A    cmp         byte ptr [eax],0
>000AD15D    je          000AD169
 000AD15F    mov         eax,[000B5BEC];^gvar_000B6BB4
 000AD164    cmp         byte ptr [eax],0
>000AD167    jne         000AD170
 000AD169    mov         bl,1
>000AD16B    jmp         000AD205
 000AD170    lea         eax,[ebp-4]
 000AD173    push        eax
 000AD174    lea         edx,[ebp-10]
 000AD177    mov         eax,[000B5B50];^gvar_000B6B78:AnsiString
 000AD17C    mov         eax,dword ptr [eax]
 000AD17E    call        ExtractFileName
 000AD183    mov         eax,dword ptr [ebp-10]
 000AD186    mov         dword ptr [ebp-0C],eax
 000AD189    mov         byte ptr [ebp-8],0B
 000AD18D    lea         edx,[ebp-0C]
 000AD190    xor         ecx,ecx
 000AD192    mov         eax,7D9
 000AD197    call        FmtLoadStr;'%s modified. Save now?'
 000AD19C    mov         eax,dword ptr [ebp-4]
 000AD19F    call        0008D0E0
 000AD1A4    sub         ax,6
>000AD1A8    je          000AD1B1
 000AD1AA    dec         ax
>000AD1AD    je          000AD1FF
>000AD1AF    jmp         000AD203
 000AD1B1    mov         eax,[000B5988];^gvar_000B6BE9
 000AD1B6    cmp         byte ptr [eax],0
>000AD1B9    je          000AD1C6
 000AD1BB    mov         eax,ebx
 000AD1BD    call        000AD234
 000AD1C2    mov         ebx,eax
>000AD1C4    jmp         000AD1FB
 000AD1C6    mov         eax,[000B5994];^gvar_000B7008
 000AD1CB    cmp         byte ptr [eax],0
>000AD1CE    je          000AD1DB
 000AD1D0    mov         eax,ebx
 000AD1D2    call        000AD234
 000AD1D7    mov         ebx,eax
>000AD1D9    jmp         000AD1FB
 000AD1DB    mov         eax,[000B5790];^gvar_000B6B70:TCMDynArray
 000AD1E0    mov         eax,dword ptr [eax]
 000AD1E2    mov         eax,dword ptr [eax+0C]
 000AD1E5    push        eax
 000AD1E6    mov         eax,[000B5B50];^gvar_000B6B78:AnsiString
 000AD1EB    mov         eax,dword ptr [eax]
 000AD1ED    mov         ecx,1
 000AD1F2    xor         edx,edx
 000AD1F4    call        000991C8
 000AD1F9    mov         ebx,eax
 000AD1FB    mov         byte ptr [esi],bl
>000AD1FD    jmp         000AD205
 000AD1FF    mov         bl,1
>000AD201    jmp         000AD205
 000AD203    xor         ebx,ebx
 000AD205    xor         eax,eax
 000AD207    pop         edx
 000AD208    pop         ecx
 000AD209    pop         ecx
 000AD20A    mov         dword ptr fs:[eax],edx
 000AD20D    push        0AD22A
 000AD212    lea         eax,[ebp-10]
 000AD215    call        @LStrClr
 000AD21A    lea         eax,[ebp-4]
 000AD21D    call        @LStrClr
 000AD222    ret
>000AD223    jmp         @HandleFinally
>000AD228    jmp         000AD212
 000AD22A    mov         eax,ebx
 000AD22C    pop         esi
 000AD22D    pop         ebx
 000AD22E    mov         esp,ebp
 000AD230    pop         ebp
 000AD231    ret
end;*}

//000AD234
{*function sub_000AD234(?:TFormMain):?;
begin
 000AD234    push        ebp
 000AD235    mov         ebp,esp
 000AD237    xor         ecx,ecx
 000AD239    push        ecx
 000AD23A    push        ecx
 000AD23B    push        ecx
 000AD23C    push        ecx
 000AD23D    push        ecx
 000AD23E    push        ebx
 000AD23F    push        esi
 000AD240    mov         esi,eax
 000AD242    xor         eax,eax
 000AD244    push        ebp
 000AD245    push        0AD39D
 000AD24A    push        dword ptr fs:[eax]
 000AD24D    mov         dword ptr fs:[eax],esp
 000AD250    mov         eax,[000B5894];^gvar_000B7070:TFormOSE
 000AD255    mov         eax,dword ptr [eax]
 000AD257    mov         edx,dword ptr [eax+2D0]
 000AD25D    mov         eax,[000B5894];^gvar_000B7070:TFormOSE
 000AD262    mov         eax,dword ptr [eax]
 000AD264    call        TCustomForm.SetActiveControl
 000AD269    mov         eax,[000B5A10];^gvar_000B6BE4:AnsiString
 000AD26E    push        eax
 000AD26F    push        0AD3B4;'*.*,*.exe'
 000AD274    push        3F
 000AD276    push        0
 000AD278    push        0
 000AD27A    push        0
 000AD27C    push        0AD3C8;'Favorites'
 000AD281    lea         edx,[ebp-4]
 000AD284    mov         eax,141
 000AD289    call        LoadStr;'Save file as'
 000AD28E    mov         ecx,dword ptr [ebp-4]
 000AD291    mov         eax,[000B5894];^gvar_000B7070:TFormOSE
 000AD296    mov         eax,dword ptr [eax]
 000AD298    mov         edx,1
 000AD29D    call        000A1204
 000AD2A2    dec         eax
 000AD2A3    sete        bl
 000AD2A6    test        bl,bl
>000AD2A8    je          000AD37A
 000AD2AE    mov         eax,[000B5790];^gvar_000B6B70:TCMDynArray
 000AD2B3    mov         eax,dword ptr [eax]
 000AD2B5    mov         eax,dword ptr [eax+0C]
 000AD2B8    push        eax
 000AD2B9    mov         eax,[000B5894];^gvar_000B7070:TFormOSE
 000AD2BE    mov         eax,dword ptr [eax]
 000AD2C0    mov         eax,dword ptr [eax+2DC]
 000AD2C6    mov         ecx,1
 000AD2CB    xor         edx,edx
 000AD2CD    call        000991C8
 000AD2D2    mov         eax,[000B5B50];^gvar_000B6B78:AnsiString
 000AD2D7    mov         edx,dword ptr ds:[0B5894];^gvar_000B7070:TFormOSE
 000AD2DD    mov         edx,dword ptr [edx]
 000AD2DF    mov         edx,dword ptr [edx+2DC]
 000AD2E5    call        @LStrAsg
 000AD2EA    mov         edx,dword ptr ds:[0B5B50];^gvar_000B6B78:AnsiString
 000AD2F0    mov         edx,dword ptr [edx]
 000AD2F2    mov         eax,dword ptr [esi+490];TFormMain.?f490:TMRUFiles
 000AD2F8    call        0008868C
 000AD2FD    lea         edx,[ebp-8]
 000AD300    mov         eax,[000B5B50];^gvar_000B6B78:AnsiString
 000AD305    mov         eax,dword ptr [eax]
 000AD307    call        ExtractFileName
 000AD30C    mov         ecx,dword ptr [ebp-8]
 000AD30F    lea         eax,[ebp-4]
 000AD312    mov         edx,0AD3DC;'XVI32 - '
 000AD317    call        @LStrCat3
 000AD31C    mov         edx,dword ptr [ebp-4]
 000AD31F    mov         eax,esi
 000AD321    call        TControl.SetText
 000AD326    lea         edx,[ebp-0C]
 000AD329    mov         eax,esi
 000AD32B    call        TControl.GetText
 000AD330    mov         edx,dword ptr [ebp-0C]
 000AD333    mov         eax,[000B59E8];^Application:TApplication
 000AD338    mov         eax,dword ptr [eax]
 000AD33A    call        TApplication.SetTitle
 000AD33F    mov         eax,[000B5988];^gvar_000B6BE9
 000AD344    mov         byte ptr [eax],0
 000AD347    mov         eax,[000B5994];^gvar_000B7008
 000AD34C    cmp         byte ptr [eax],0
>000AD34F    je          000AD37A
 000AD351    mov         eax,[000B5994];^gvar_000B7008
 000AD356    mov         byte ptr [eax],0
 000AD359    mov         eax,dword ptr [esi+2EC];TFormMain.Save1:TMenuItem
 000AD35F    mov         dword ptr [ebp-14],eax
 000AD362    mov         eax,dword ptr [esi+3A0];TFormMain.CMBtnSave:TCMBtn
 000AD368    mov         dword ptr [ebp-10],eax
 000AD36B    lea         eax,[ebp-14]
 000AD36E    mov         cl,1
 000AD370    mov         edx,1
 000AD375    call        00099514
 000AD37A    xor         eax,eax
 000AD37C    pop         edx
 000AD37D    pop         ecx
 000AD37E    pop         ecx
 000AD37F    mov         dword ptr fs:[eax],edx
 000AD382    push        0AD3A4
 000AD387    lea         eax,[ebp-0C]
 000AD38A    call        @LStrClr
 000AD38F    lea         eax,[ebp-8]
 000AD392    mov         edx,2
 000AD397    call        @LStrArrayClr
 000AD39C    ret
>000AD39D    jmp         @HandleFinally
>000AD3A2    jmp         000AD387
 000AD3A4    mov         eax,ebx
 000AD3A6    pop         esi
 000AD3A7    pop         ebx
 000AD3A8    mov         esp,ebp
 000AD3AA    pop         ebp
 000AD3AB    ret
end;*}

//000AD3E8
procedure TFormMain.New1Click(Sender:TObject);
begin
{*
 000AD3E8    push        ebp
 000AD3E9    mov         ebp,esp
 000AD3EB    add         esp,0FFFFFFF8
 000AD3EE    push        ebx
 000AD3EF    xor         ecx,ecx
 000AD3F1    mov         dword ptr [ebp-8],ecx
 000AD3F4    mov         ebx,eax
 000AD3F6    xor         eax,eax
 000AD3F8    push        ebp
 000AD3F9    push        0AD496
 000AD3FE    push        dword ptr fs:[eax]
 000AD401    mov         dword ptr fs:[eax],esp
 000AD404    lea         edx,[ebp-1]
 000AD407    mov         eax,ebx
 000AD409    call        000AD130
 000AD40E    test        al,al
>000AD410    je          000AD480
 000AD412    mov         eax,[000B5988];^gvar_000B6BE9
 000AD417    mov         byte ptr [eax],1
 000AD41A    mov         eax,[000B581C];^gvar_000B6BEC
 000AD41F    inc         dword ptr [eax]
 000AD421    lea         edx,[ebp-8]
 000AD424    mov         eax,[000B581C];^gvar_000B6BEC
 000AD429    mov         eax,dword ptr [eax]
 000AD42B    call        IntToStr
 000AD430    mov         ecx,dword ptr [ebp-8]
 000AD433    mov         eax,[000B5B50];^gvar_000B6B78:AnsiString
 000AD438    mov         edx,0AD4AC;'NoName'
 000AD43D    call        @LStrCat3
 000AD442    mov         eax,[000B5BB4];^gvar_000B6BE8:Boolean
 000AD447    cmp         byte ptr [eax],0
>000AD44A    je          000AD465
 000AD44C    mov         eax,[000B5BA0];^gvar_000B6BAC:Single
 000AD451    mov         dword ptr [eax],1
 000AD457    mov         dl,1A
 000AD459    mov         eax,1
 000AD45E    call        000981B8
>000AD463    jmp         000AD46A
 000AD465    call        00098864
 000AD46A    mov         eax,1
 000AD46F    call        000981DC
 000AD474    call        00098350
 000AD479    mov         eax,ebx
 000AD47B    call        000ACAC4
 000AD480    xor         eax,eax
 000AD482    pop         edx
 000AD483    pop         ecx
 000AD484    pop         ecx
 000AD485    mov         dword ptr fs:[eax],edx
 000AD488    push        0AD49D
 000AD48D    lea         eax,[ebp-8]
 000AD490    call        @LStrClr
 000AD495    ret
>000AD496    jmp         @HandleFinally
>000AD49B    jmp         000AD48D
 000AD49D    pop         ebx
 000AD49E    pop         ecx
 000AD49F    pop         ecx
 000AD4A0    pop         ebp
 000AD4A1    ret
*}
end;

//000AD4B4
procedure TFormMain.Open1Click(Sender:TObject);
begin
{*
 000AD4B4    push        ebp
 000AD4B5    mov         ebp,esp
 000AD4B7    add         esp,0FFFFFFF8
 000AD4BA    push        ebx
 000AD4BB    push        esi
 000AD4BC    xor         ecx,ecx
 000AD4BE    mov         dword ptr [ebp-8],ecx
 000AD4C1    mov         esi,edx
 000AD4C3    mov         ebx,eax
 000AD4C5    xor         eax,eax
 000AD4C7    push        ebp
 000AD4C8    push        0AD5ED
 000AD4CD    push        dword ptr fs:[eax]
 000AD4D0    mov         dword ptr fs:[eax],esp
 000AD4D3    lea         edx,[ebp-1]
 000AD4D6    mov         eax,ebx
 000AD4D8    call        000AD130
 000AD4DD    test        al,al
>000AD4DF    je          000AD5D7
 000AD4E5    mov         eax,[000B5A10];^gvar_000B6BE4:AnsiString
 000AD4EA    mov         eax,dword ptr [eax]
 000AD4EC    call        0009B9FC
 000AD4F1    test        al,al
>000AD4F3    je          000AD522
 000AD4F5    lea         edx,[ebp-8]
 000AD4F8    mov         eax,857
 000AD4FD    call        LoadStr;'Accessing network, please wait (may take a minute)...'
 000AD502    mov         eax,dword ptr [ebp-8]
 000AD505    push        eax
 000AD506    mov         eax,dword ptr [ebx+2C4];TFormMain.StatusBar1:TStatusBar
 000AD50C    mov         eax,dword ptr [eax+1EC];TStatusBar.Panels:TStatusPanels
 000AD512    mov         edx,3
 000AD517    call        TCoolBands.GetItem
 000AD51C    pop         edx
 000AD51D    call        TStatusPanel.SetText
 000AD522    mov         eax,[000B5BDC];^Screen:TScreen
 000AD527    mov         eax,dword ptr [eax]
 000AD529    mov         dx,0FFF5
 000AD52D    call        TScreen.SetCursor
 000AD532    xor         eax,eax
 000AD534    push        ebp
 000AD535    push        0AD5D0
 000AD53A    push        dword ptr fs:[eax]
 000AD53D    mov         dword ptr fs:[eax],esp
 000AD540    mov         eax,[000B5A10];^gvar_000B6BE4:AnsiString
 000AD545    push        eax
 000AD546    push        0AD604;'*.*,*.exe'
 000AD54B    push        3F
 000AD54D    push        0
 000AD54F    push        0
 000AD551    push        0
 000AD553    push        0AD618;'Favorites'
 000AD558    lea         edx,[ebp-8]
 000AD55B    mov         eax,13F
 000AD560    call        LoadStr;'Open file'
 000AD565    mov         ecx,dword ptr [ebp-8]
 000AD568    mov         eax,[000B5894];^gvar_000B7070:TFormOSE
 000AD56D    mov         eax,dword ptr [eax]
 000AD56F    xor         edx,edx
 000AD571    call        000A1204
 000AD576    dec         eax
>000AD577    jne         000AD5B4
 000AD579    mov         eax,[000B5894];^gvar_000B7070:TFormOSE
 000AD57E    mov         eax,dword ptr [eax]
 000AD580    mov         eax,dword ptr [eax+2C8]
 000AD586    mov         edx,dword ptr [eax]
 000AD588    call        dword ptr [edx+0B8]
 000AD58E    mov         edx,dword ptr ds:[0B5994];^gvar_000B7008
 000AD594    mov         byte ptr [edx],al
 000AD596    mov         eax,[000B5894];^gvar_000B7070:TFormOSE
 000AD59B    mov         eax,dword ptr [eax]
 000AD59D    mov         ecx,dword ptr [eax+2DC]
 000AD5A3    mov         edx,esi
 000AD5A5    mov         eax,ebx
 000AD5A7    call        000ACD9C
 000AD5AC    mov         eax,[000B5988];^gvar_000B6BE9
 000AD5B1    mov         byte ptr [eax],0
 000AD5B4    xor         eax,eax
 000AD5B6    pop         edx
 000AD5B7    pop         ecx
 000AD5B8    pop         ecx
 000AD5B9    mov         dword ptr fs:[eax],edx
 000AD5BC    push        0AD5D7
 000AD5C1    mov         eax,[000B5BDC];^Screen:TScreen
 000AD5C6    mov         eax,dword ptr [eax]
 000AD5C8    xor         edx,edx
 000AD5CA    call        TScreen.SetCursor
 000AD5CF    ret
>000AD5D0    jmp         @HandleFinally
>000AD5D5    jmp         000AD5C1
 000AD5D7    xor         eax,eax
 000AD5D9    pop         edx
 000AD5DA    pop         ecx
 000AD5DB    pop         ecx
 000AD5DC    mov         dword ptr fs:[eax],edx
 000AD5DF    push        0AD5F4
 000AD5E4    lea         eax,[ebp-8]
 000AD5E7    call        @LStrClr
 000AD5EC    ret
>000AD5ED    jmp         @HandleFinally
>000AD5F2    jmp         000AD5E4
 000AD5F4    pop         esi
 000AD5F5    pop         ebx
 000AD5F6    pop         ecx
 000AD5F7    pop         ecx
 000AD5F8    pop         ebp
 000AD5F9    ret
*}
end;

//000AD624
procedure TFormMain.ModusOverwrite1Click(Sender:TObject);
begin
{*
 000AD624    push        ebp
 000AD625    mov         ebp,esp
 000AD627    push        0
 000AD629    push        ebx
 000AD62A    mov         ebx,eax
 000AD62C    xor         eax,eax
 000AD62E    push        ebp
 000AD62F    push        0AD6DA
 000AD634    push        dword ptr fs:[eax]
 000AD637    mov         dword ptr fs:[eax],esp
 000AD63A    mov         eax,[000B5A0C];^gvar_000B6BA6
 000AD63F    mov         al,byte ptr [eax]
 000AD641    xor         al,1
 000AD643    mov         edx,dword ptr ds:[0B5A0C];^gvar_000B6BA6
 000AD649    mov         byte ptr [edx],al
 000AD64B    mov         edx,dword ptr ds:[0B5A0C];^gvar_000B6BA6
 000AD651    mov         dl,byte ptr [edx]
 000AD653    mov         eax,dword ptr [ebx+300];TFormMain.ModusOverwrite1:TMenuItem
 000AD659    call        TMenuItem.SetChecked
 000AD65E    mov         eax,[000B5A0C];^gvar_000B6BA6
 000AD663    cmp         byte ptr [eax],0
>000AD666    je          000AD697
 000AD668    lea         edx,[ebp-4]
 000AD66B    mov         eax,7E0
 000AD670    call        LoadStr;'Overwrite'
 000AD675    mov         eax,dword ptr [ebp-4]
 000AD678    push        eax
 000AD679    mov         eax,dword ptr [ebx+2C4];TFormMain.StatusBar1:TStatusBar
 000AD67F    mov         eax,dword ptr [eax+1EC];TStatusBar.Panels:TStatusPanels
 000AD685    mov         edx,2
 000AD68A    call        TCoolBands.GetItem
 000AD68F    pop         edx
 000AD690    call        TStatusPanel.SetText
>000AD695    jmp         000AD6C4
 000AD697    lea         edx,[ebp-4]
 000AD69A    mov         eax,7DF
 000AD69F    call        LoadStr;'Insert'
 000AD6A4    mov         eax,dword ptr [ebp-4]
 000AD6A7    push        eax
 000AD6A8    mov         eax,dword ptr [ebx+2C4];TFormMain.StatusBar1:TStatusBar
 000AD6AE    mov         eax,dword ptr [eax+1EC];TStatusBar.Panels:TStatusPanels
 000AD6B4    mov         edx,2
 000AD6B9    call        TCoolBands.GetItem
 000AD6BE    pop         edx
 000AD6BF    call        TStatusPanel.SetText
 000AD6C4    xor         eax,eax
 000AD6C6    pop         edx
 000AD6C7    pop         ecx
 000AD6C8    pop         ecx
 000AD6C9    mov         dword ptr fs:[eax],edx
 000AD6CC    push        0AD6E1
 000AD6D1    lea         eax,[ebp-4]
 000AD6D4    call        @LStrClr
 000AD6D9    ret
>000AD6DA    jmp         @HandleFinally
>000AD6DF    jmp         000AD6D1
 000AD6E1    pop         ebx
 000AD6E2    pop         ecx
 000AD6E3    pop         ebp
 000AD6E4    ret
*}
end;

//000AD6E8
procedure TFormMain.Decode1Click(Sender:TObject);
begin
{*
 000AD6E8    push        ebp
 000AD6E9    mov         ebp,esp
 000AD6EB    mov         ecx,7
 000AD6F0    push        0
 000AD6F2    push        0
 000AD6F4    dec         ecx
>000AD6F5    jne         000AD6F0
 000AD6F7    push        ecx
 000AD6F8    xor         eax,eax
 000AD6FA    push        ebp
 000AD6FB    push        0AD980
 000AD700    push        dword ptr fs:[eax]
 000AD703    mov         dword ptr fs:[eax],esp
 000AD706    mov         eax,[000B5BA0];^gvar_000B6BAC:Single
 000AD70B    cmp         dword ptr [eax],0
>000AD70E    je          000AD958
 000AD714    lea         eax,[ebp-0C]
 000AD717    push        eax
 000AD718    lea         eax,[ebp-10]
 000AD71B    push        eax
 000AD71C    lea         eax,[ebp-14]
 000AD71F    push        eax
 000AD720    lea         eax,[ebp-18]
 000AD723    push        eax
 000AD724    call        000981C4
 000AD729    lea         ecx,[ebp-8]
 000AD72C    lea         edx,[ebp-4]
 000AD72F    call        0009B560
 000AD734    lea         eax,[ebp-20]
 000AD737    push        eax
 000AD738    call        000981C4
 000AD73D    call        000981AC
 000AD742    lea         edx,[ebp-34]
 000AD745    call        00074C9C
 000AD74A    mov         eax,dword ptr [ebp-34]
 000AD74D    mov         dword ptr [ebp-30],eax
 000AD750    mov         byte ptr [ebp-2C],0B
 000AD754    mov         eax,dword ptr [ebp-4]
 000AD757    mov         dword ptr [ebp-28],eax
 000AD75A    mov         byte ptr [ebp-24],0B
 000AD75E    lea         edx,[ebp-30]
 000AD761    mov         ecx,1
 000AD766    mov         eax,7F7
 000AD76B    call        FmtLoadStr;'%s as shortint: %s'
 000AD770    call        000981C4
 000AD775    lea         ecx,[ebp-1C]
 000AD778    mov         edx,2
 000AD77D    call        00098B64
 000AD782    test        al,al
>000AD784    je          000AD818
 000AD78A    push        dword ptr [ebp-20]
 000AD78D    push        0AD994;#13+#10
 000AD792    lea         eax,[ebp-34]
 000AD795    push        eax
 000AD796    lea         ecx,[ebp-38]
 000AD799    mov         dl,1
 000AD79B    mov         eax,dword ptr [ebp-1C]
 000AD79E    call        00074D04
 000AD7A3    mov         eax,dword ptr [ebp-38]
 000AD7A6    mov         dword ptr [ebp-30],eax
 000AD7A9    mov         byte ptr [ebp-2C],0B
 000AD7AD    mov         eax,dword ptr [ebp-8]
 000AD7B0    mov         dword ptr [ebp-28],eax
 000AD7B3    mov         byte ptr [ebp-24],0B
 000AD7B7    lea         edx,[ebp-30]
 000AD7BA    mov         ecx,1
 000AD7BF    mov         eax,7F8
 000AD7C4    call        FmtLoadStr;'%s as word: %s'
 000AD7C9    push        dword ptr [ebp-34]
 000AD7CC    push        0AD994;#13+#10
 000AD7D1    lea         eax,[ebp-38]
 000AD7D4    push        eax
 000AD7D5    lea         ecx,[ebp-3C]
 000AD7D8    mov         dl,1
 000AD7DA    mov         eax,dword ptr [ebp-1C]
 000AD7DD    call        00074D04
 000AD7E2    mov         eax,dword ptr [ebp-3C]
 000AD7E5    mov         dword ptr [ebp-30],eax
 000AD7E8    mov         byte ptr [ebp-2C],0B
 000AD7EC    mov         eax,dword ptr [ebp-0C]
 000AD7EF    mov         dword ptr [ebp-28],eax
 000AD7F2    mov         byte ptr [ebp-24],0B
 000AD7F6    lea         edx,[ebp-30]
 000AD7F9    mov         ecx,1
 000AD7FE    mov         eax,7F9
 000AD803    call        FmtLoadStr;'%s as integer: %s'
 000AD808    push        dword ptr [ebp-38]
 000AD80B    lea         eax,[ebp-20]
 000AD80E    mov         edx,5
 000AD813    call        @LStrCatN
 000AD818    call        000981C4
 000AD81D    lea         ecx,[ebp-1C]
 000AD820    mov         edx,4
 000AD825    call        00098B64
 000AD82A    test        al,al
>000AD82C    je          000AD8C0
 000AD832    push        dword ptr [ebp-20]
 000AD835    push        0AD994;#13+#10
 000AD83A    lea         eax,[ebp-34]
 000AD83D    push        eax
 000AD83E    lea         ecx,[ebp-38]
 000AD841    mov         dl,1
 000AD843    mov         eax,dword ptr [ebp-1C]
 000AD846    call        00074D04
 000AD84B    mov         eax,dword ptr [ebp-38]
 000AD84E    mov         dword ptr [ebp-30],eax
 000AD851    mov         byte ptr [ebp-2C],0B
 000AD855    mov         eax,dword ptr [ebp-10]
 000AD858    mov         dword ptr [ebp-28],eax
 000AD85B    mov         byte ptr [ebp-24],0B
 000AD85F    lea         edx,[ebp-30]
 000AD862    mov         ecx,1
 000AD867    mov         eax,7FA
 000AD86C    call        FmtLoadStr;'%s as longint: %s'
 000AD871    push        dword ptr [ebp-34]
 000AD874    push        0AD994;#13+#10
 000AD879    lea         eax,[ebp-38]
 000AD87C    push        eax
 000AD87D    lea         ecx,[ebp-3C]
 000AD880    mov         dl,1
 000AD882    mov         eax,dword ptr [ebp-1C]
 000AD885    call        00074D04
 000AD88A    mov         eax,dword ptr [ebp-3C]
 000AD88D    mov         dword ptr [ebp-30],eax
 000AD890    mov         byte ptr [ebp-2C],0B
 000AD894    mov         eax,dword ptr [ebp-14]
 000AD897    mov         dword ptr [ebp-28],eax
 000AD89A    mov         byte ptr [ebp-24],0B
 000AD89E    lea         edx,[ebp-30]
 000AD8A1    mov         ecx,1
 000AD8A6    mov         eax,82F
 000AD8AB    call        FmtLoadStr;'%s as 32 bit IEEE single: %s'
 000AD8B0    push        dword ptr [ebp-38]
 000AD8B3    lea         eax,[ebp-20]
 000AD8B6    mov         edx,5
 000AD8BB    call        @LStrCatN
 000AD8C0    call        000981C4
 000AD8C5    lea         ecx,[ebp-1C]
 000AD8C8    mov         edx,8
 000AD8CD    call        00098B64
 000AD8D2    test        al,al
>000AD8D4    je          000AD925
 000AD8D6    push        dword ptr [ebp-20]
 000AD8D9    push        0AD994;#13+#10
 000AD8DE    lea         eax,[ebp-34]
 000AD8E1    push        eax
 000AD8E2    lea         ecx,[ebp-38]
 000AD8E5    mov         dl,1
 000AD8E7    mov         eax,dword ptr [ebp-1C]
 000AD8EA    call        00074D04
 000AD8EF    mov         eax,dword ptr [ebp-38]
 000AD8F2    mov         dword ptr [ebp-30],eax
 000AD8F5    mov         byte ptr [ebp-2C],0B
 000AD8F9    mov         eax,dword ptr [ebp-18]
 000AD8FC    mov         dword ptr [ebp-28],eax
 000AD8FF    mov         byte ptr [ebp-24],0B
 000AD903    lea         edx,[ebp-30]
 000AD906    mov         ecx,1
 000AD90B    mov         eax,830
 000AD910    call        FmtLoadStr;'%s as 64 bit IEEE double: %s'
 000AD915    push        dword ptr [ebp-34]
 000AD918    lea         eax,[ebp-20]
 000AD91B    mov         edx,3
 000AD920    call        @LStrCatN
 000AD925    mov         eax,[000B5A50];^gvar_000B6BC5:Longint
 000AD92A    cmp         byte ptr [eax],0
>000AD92D    jne         000AD93E
 000AD92F    lea         edx,[ebp-1C]
 000AD932    mov         eax,803
 000AD937    call        LoadStr;'Byte order: little-endian (Intel)'
>000AD93C    jmp         000AD94B
 000AD93E    lea         edx,[ebp-1C]
 000AD941    mov         eax,804
 000AD946    call        LoadStr;'Byte order: big-endian (Motorola)'
 000AD94B    xor         ecx,ecx
 000AD94D    mov         edx,dword ptr [ebp-20]
 000AD950    mov         eax,dword ptr [ebp-1C]
 000AD953    call        0008D880
 000AD958    xor         eax,eax
 000AD95A    pop         edx
 000AD95B    pop         ecx
 000AD95C    pop         ecx
 000AD95D    mov         dword ptr fs:[eax],edx
 000AD960    push        0AD987
 000AD965    lea         eax,[ebp-3C]
 000AD968    mov         edx,3
 000AD96D    call        @LStrArrayClr
 000AD972    lea         eax,[ebp-20]
 000AD975    mov         edx,8
 000AD97A    call        @LStrArrayClr
 000AD97F    ret
>000AD980    jmp         @HandleFinally
>000AD985    jmp         000AD965
 000AD987    mov         esp,ebp
 000AD989    pop         ebp
 000AD98A    ret
*}
end;

//000AD998
{*procedure sub_000AD998(?:TFormMain; ?:?);
begin
 000AD998    push        ebp
 000AD999    mov         ebp,esp
 000AD99B    add         esp,0FFFFFFEC
 000AD99E    push        ebx
 000AD99F    xor         ecx,ecx
 000AD9A1    mov         dword ptr [ebp-14],ecx
 000AD9A4    mov         dword ptr [ebp-4],edx
 000AD9A7    mov         ebx,eax
 000AD9A9    mov         eax,dword ptr [ebp-4]
 000AD9AC    call        @LStrAddRef
 000AD9B1    xor         eax,eax
 000AD9B3    push        ebp
 000AD9B4    push        0ADC33
 000AD9B9    push        dword ptr fs:[eax]
 000AD9BC    mov         dword ptr fs:[eax],esp
 000AD9BF    mov         ecx,ebx
 000AD9C1    mov         dl,1
 000AD9C3    mov         eax,[0009E1BC];TFormEncode
 000AD9C8    call        TCustomForm.Create;TFormEncode.Create
 000AD9CD    mov         edx,dword ptr ds:[0B5A70];^gvar_000B7040:TFormEncode
 000AD9D3    mov         dword ptr [edx],eax
 000AD9D5    xor         eax,eax
 000AD9D7    push        ebp
 000AD9D8    push        0ADC0E
 000AD9DD    push        dword ptr fs:[eax]
 000AD9E0    mov         dword ptr fs:[eax],esp
 000AD9E3    mov         edx,dword ptr ds:[0B5910];^gvar_000B7004:Longint
 000AD9E9    movzx       edx,byte ptr [edx]
 000AD9EC    mov         eax,[000B5A70];^gvar_000B7040:TFormEncode
 000AD9F1    mov         eax,dword ptr [eax]
 000AD9F3    mov         eax,dword ptr [eax+2D4]
 000AD9F9    call        TCustomRadioGroup.SetItemIndex
 000AD9FE    push        2
 000ADA00    mov         eax,[000B5A70];^gvar_000B7040:TFormEncode
 000ADA05    mov         eax,dword ptr [eax]
 000ADA07    mov         eax,dword ptr [eax+2E4]
 000ADA0D    mov         dword ptr [ebp-10],eax
 000ADA10    mov         eax,[000B5A70];^gvar_000B7040:TFormEncode
 000ADA15    mov         eax,dword ptr [eax]
 000ADA17    mov         eax,dword ptr [eax+2E8]
 000ADA1D    mov         dword ptr [ebp-0C],eax
 000ADA20    mov         eax,[000B5A70];^gvar_000B7040:TFormEncode
 000ADA25    mov         eax,dword ptr [eax]
 000ADA27    mov         eax,dword ptr [eax+2DC]
 000ADA2D    mov         dword ptr [ebp-8],eax
 000ADA30    lea         ecx,[ebp-10]
 000ADA33    mov         edx,dword ptr ds:[0B5A34];^gvar_000B7005:Longint
 000ADA39    movzx       edx,byte ptr [edx]
 000ADA3C    mov         al,1
 000ADA3E    call        00087F3C
 000ADA43    mov         eax,[000B5A50];^gvar_000B6BC5:Longint
 000ADA48    cmp         byte ptr [eax],0
>000ADA4B    jne         000ADA71
 000ADA4D    lea         edx,[ebp-14]
 000ADA50    mov         eax,803
 000ADA55    call        LoadStr;'Byte order: little-endian (Intel)'
 000ADA5A    mov         edx,dword ptr [ebp-14]
 000ADA5D    mov         eax,[000B5A70];^gvar_000B7040:TFormEncode
 000ADA62    mov         eax,dword ptr [eax]
 000ADA64    mov         eax,dword ptr [eax+2EC]
 000ADA6A    call        TControl.SetText
>000ADA6F    jmp         000ADA93
 000ADA71    lea         edx,[ebp-14]
 000ADA74    mov         eax,804
 000ADA79    call        LoadStr;'Byte order: big-endian (Motorola)'
 000ADA7E    mov         edx,dword ptr [ebp-14]
 000ADA81    mov         eax,[000B5A70];^gvar_000B7040:TFormEncode
 000ADA86    mov         eax,dword ptr [eax]
 000ADA88    mov         eax,dword ptr [eax+2EC]
 000ADA8E    call        TControl.SetText
 000ADA93    cmp         dword ptr [ebp-4],0
>000ADA97    je          000ADAAE
 000ADA99    mov         eax,[000B5A70];^gvar_000B7040:TFormEncode
 000ADA9E    mov         eax,dword ptr [eax]
 000ADAA0    mov         eax,dword ptr [eax+2F8]
 000ADAA6    mov         edx,dword ptr [ebp-4]
 000ADAA9    call        TControl.SetText
 000ADAAE    mov         eax,[000B5A70];^gvar_000B7040:TFormEncode
 000ADAB3    mov         eax,dword ptr [eax]
 000ADAB5    mov         edx,dword ptr [eax]
 000ADAB7    call        dword ptr [edx+0CC]
 000ADABD    dec         eax
>000ADABE    jne         000ADB8F
 000ADAC4    mov         eax,0ADC48;'Writing encoded number...'
 000ADAC9    call        000986CC
 000ADACE    mov         eax,[000B5BA0];^gvar_000B6BAC:Single
 000ADAD3    cmp         dword ptr [eax],0
>000ADAD6    jne         000ADB21
 000ADAD8    mov         eax,[000B5A70];^gvar_000B7040:TFormEncode
 000ADADD    mov         eax,dword ptr [eax]
 000ADADF    movzx       eax,byte ptr [eax+2FC]
 000ADAE6    mov         edx,dword ptr ds:[0B5BA0];^gvar_000B6BAC:Single
 000ADAEC    mov         dword ptr [edx],eax
 000ADAEE    lea         eax,[ebp-14]
 000ADAF1    mov         edx,dword ptr ds:[0B5A70];^gvar_000B7040:TFormEncode
 000ADAF7    mov         edx,dword ptr [edx]
 000ADAF9    add         edx,2FC
 000ADAFF    call        @LStrFromString
 000ADB04    mov         edx,dword ptr [ebp-14]
 000ADB07    mov         eax,1
 000ADB0C    call        000988E0
 000ADB11    xor         ecx,ecx
 000ADB13    mov         dl,1
 000ADB15    mov         eax,1
 000ADB1A    call        000998B0
>000ADB1F    jmp         000ADB82
 000ADB21    mov         eax,[000B5A70];^gvar_000B7040:TFormEncode
 000ADB26    mov         eax,dword ptr [eax]
 000ADB28    cmp         byte ptr [eax+305],0
>000ADB2F    je          000ADB58
 000ADB31    lea         eax,[ebp-14]
 000ADB34    mov         edx,dword ptr ds:[0B5A70];^gvar_000B7040:TFormEncode
 000ADB3A    mov         edx,dword ptr [edx]
 000ADB3C    add         edx,2FC
 000ADB42    call        @LStrFromString
 000ADB47    mov         eax,dword ptr [ebp-14]
 000ADB4A    push        eax
 000ADB4B    call        000981C4
 000ADB50    pop         edx
 000ADB51    call        000988E0
>000ADB56    jmp         000ADB82
 000ADB58    lea         eax,[ebp-14]
 000ADB5B    mov         edx,dword ptr ds:[0B5A70];^gvar_000B7040:TFormEncode
 000ADB61    mov         edx,dword ptr [edx]
 000ADB63    add         edx,2FC
 000ADB69    call        @LStrFromString
 000ADB6E    mov         eax,dword ptr [ebp-14]
 000ADB71    push        eax
 000ADB72    call        000981C4
 000ADB77    mov         edx,1
 000ADB7C    pop         ecx
 000ADB7D    call        00098A74
 000ADB82    call        00099890
 000ADB87    mov         eax,[000B5778];^gvar_000B6BA5
 000ADB8C    mov         byte ptr [eax],1
 000ADB8F    mov         eax,[000B5A70];^gvar_000B7040:TFormEncode
 000ADB94    mov         eax,dword ptr [eax]
 000ADB96    mov         eax,dword ptr [eax+2D4]
 000ADB9C    mov         al,byte ptr [eax+1F8]
 000ADBA2    mov         edx,dword ptr ds:[0B5910];^gvar_000B7004:Longint
 000ADBA8    mov         byte ptr [edx],al
 000ADBAA    mov         eax,[000B5A70];^gvar_000B7040:TFormEncode
 000ADBAF    mov         eax,dword ptr [eax]
 000ADBB1    mov         eax,dword ptr [eax+2E4]
 000ADBB7    mov         dword ptr [ebp-10],eax
 000ADBBA    mov         eax,[000B5A70];^gvar_000B7040:TFormEncode
 000ADBBF    mov         eax,dword ptr [eax]
 000ADBC1    mov         eax,dword ptr [eax+2E8]
 000ADBC7    mov         dword ptr [ebp-0C],eax
 000ADBCA    mov         eax,[000B5A70];^gvar_000B7040:TFormEncode
 000ADBCF    mov         eax,dword ptr [eax]
 000ADBD1    mov         eax,dword ptr [eax+2DC]
 000ADBD7    mov         dword ptr [ebp-8],eax
 000ADBDA    lea         eax,[ebp-10]
 000ADBDD    mov         edx,2
 000ADBE2    call        00087FB4
 000ADBE7    mov         edx,dword ptr ds:[0B5A34];^gvar_000B7005:Longint
 000ADBED    mov         byte ptr [edx],al
 000ADBEF    xor         eax,eax
 000ADBF1    pop         edx
 000ADBF2    pop         ecx
 000ADBF3    pop         ecx
 000ADBF4    mov         dword ptr fs:[eax],edx
 000ADBF7    push        0ADC15
 000ADBFC    call        000986F4
 000ADC01    mov         eax,[000B5A70];^gvar_000B7040:TFormEncode
 000ADC06    mov         eax,dword ptr [eax]
 000ADC08    call        TCustomForm.Release
 000ADC0D    ret
>000ADC0E    jmp         @HandleFinally
>000ADC13    jmp         000ADBFC
 000ADC15    xor         eax,eax
 000ADC17    pop         edx
 000ADC18    pop         ecx
 000ADC19    pop         ecx
 000ADC1A    mov         dword ptr fs:[eax],edx
 000ADC1D    push        0ADC3A
 000ADC22    lea         eax,[ebp-14]
 000ADC25    call        @LStrClr
 000ADC2A    lea         eax,[ebp-4]
 000ADC2D    call        @LStrClr
 000ADC32    ret
>000ADC33    jmp         @HandleFinally
>000ADC38    jmp         000ADC22
 000ADC3A    pop         ebx
 000ADC3B    mov         esp,ebp
 000ADC3D    pop         ebp
 000ADC3E    ret
end;*}

//000ADC64
procedure TFormMain.Encode1Click(Sender:TObject);
begin
{*
 000ADC64    xor         edx,edx
 000ADC66    call        000AD998
 000ADC6B    ret
*}
end;

//000ADC6C
{*procedure sub_000ADC6C(?:TMenuItem; ?:?);
begin
 000ADC6C    push        ebp
 000ADC6D    mov         ebp,esp
 000ADC6F    push        ebx
 000ADC70    push        esi
 000ADC71    push        edi
 000ADC72    mov         edi,eax
 000ADC74    cmp         dword ptr [edi+0C],1
>000ADC78    jne         000ADC83
 000ADC7A    xor         edx,edx
 000ADC7C    mov         eax,edi
 000ADC7E    call        TMenuItem.SetEnabled
 000ADC83    mov         eax,edi
 000ADC85    call        TMenuItem.GetCount
 000ADC8A    mov         ebx,eax
 000ADC8C    dec         ebx
 000ADC8D    test        ebx,ebx
>000ADC8F    jl          000ADCAB
 000ADC91    inc         ebx
 000ADC92    xor         esi,esi
 000ADC94    mov         eax,dword ptr [ebp+8]
 000ADC97    push        eax
 000ADC98    mov         edx,esi
 000ADC9A    mov         eax,edi
 000ADC9C    call        TMenuItem.GetItem
 000ADCA1    call        000ADC6C
 000ADCA6    pop         ecx
 000ADCA7    inc         esi
 000ADCA8    dec         ebx
>000ADCA9    jne         000ADC94
 000ADCAB    pop         edi
 000ADCAC    pop         esi
 000ADCAD    pop         ebx
 000ADCAE    pop         ebp
 000ADCAF    ret
end;*}

//000ADCB0
procedure sub_000ADCB0(?:TFormMain);
begin
{*
 000ADCB0    push        ebp
 000ADCB1    mov         ebp,esp
 000ADCB3    push        ebx
 000ADCB4    push        esi
 000ADCB5    push        edi
 000ADCB6    mov         edi,eax
 000ADCB8    mov         eax,dword ptr [edi+2CC]
 000ADCBE    mov         eax,dword ptr [eax+28]
 000ADCC1    call        TMenuItem.GetCount
 000ADCC6    mov         esi,eax
 000ADCC8    dec         esi
 000ADCC9    test        esi,esi
>000ADCCB    jl          000ADCEB
 000ADCCD    inc         esi
 000ADCCE    xor         ebx,ebx
 000ADCD0    push        ebp
 000ADCD1    mov         eax,dword ptr [edi+2CC]
 000ADCD7    mov         eax,dword ptr [eax+28]
 000ADCDA    mov         edx,ebx
 000ADCDC    call        TMenuItem.GetItem
 000ADCE1    call        000ADC6C
 000ADCE6    pop         ecx
 000ADCE7    inc         ebx
 000ADCE8    dec         esi
>000ADCE9    jne         000ADCD0
 000ADCEB    mov         eax,edi
 000ADCED    call        TComponent.GetComponentCount
 000ADCF2    mov         esi,eax
 000ADCF4    dec         esi
 000ADCF5    test        esi,esi
>000ADCF7    jl          000ADD37
 000ADCF9    inc         esi
 000ADCFA    xor         ebx,ebx
 000ADCFC    mov         edx,ebx
 000ADCFE    mov         eax,edi
 000ADD00    call        TComponent.GetComponent
 000ADD05    mov         edx,dword ptr ds:[89F04];TCMBtn
 000ADD0B    call        @IsClass
 000ADD10    test        al,al
>000ADD12    je          000ADD33
 000ADD14    mov         edx,ebx
 000ADD16    mov         eax,edi
 000ADD18    call        TComponent.GetComponent
 000ADD1D    cmp         dword ptr [eax+0C],1;TComponent.Tag:Integer
>000ADD21    jne         000ADD33
 000ADD23    mov         edx,ebx
 000ADD25    mov         eax,edi
 000ADD27    call        TComponent.GetComponent
 000ADD2C    xor         edx,edx
 000ADD2E    call        TCMBtn.SetEnabled
 000ADD33    inc         ebx
 000ADD34    dec         esi
>000ADD35    jne         000ADCFC
 000ADD37    pop         edi
 000ADD38    pop         esi
 000ADD39    pop         ebx
 000ADD3A    pop         ebp
 000ADD3B    ret
*}
end;

//000ADD3C
procedure sub_000ADD3C(?:TFormMain; ?:Integer);
begin
{*
 000ADD3C    push        ebp
 000ADD3D    mov         ebp,esp
 000ADD3F    add         esp,0FFFFFFAC
 000ADD42    push        ebx
 000ADD43    push        esi
 000ADD44    push        edi
 000ADD45    xor         ecx,ecx
 000ADD47    mov         dword ptr [ebp-18],ecx
 000ADD4A    mov         ebx,edx
 000ADD4C    mov         esi,eax
 000ADD4E    xor         eax,eax
 000ADD50    push        ebp
 000ADD51    push        0AE089
 000ADD56    push        dword ptr fs:[eax]
 000ADD59    mov         dword ptr fs:[eax],esp
 000ADD5C    mov         eax,dword ptr [esi+310]
 000ADD62    mov         eax,dword ptr [eax+58]
 000ADD65    mov         edx,ebx
 000ADD67    call        TFont.SetSize
 000ADD6C    mov         eax,dword ptr [esi+314]
 000ADD72    mov         eax,dword ptr [eax+58]
 000ADD75    mov         edx,ebx
 000ADD77    call        TFont.SetSize
 000ADD7C    mov         eax,dword ptr [esi+420]
 000ADD82    mov         eax,dword ptr [eax+58]
 000ADD85    mov         edx,ebx
 000ADD87    call        TFont.SetSize
 000ADD8C    mov         eax,dword ptr [esi+310]
 000ADD92    mov         edx,dword ptr [eax]
 000ADD94    call        dword ptr [edx+7C]
 000ADD97    mov         eax,dword ptr [esi+314]
 000ADD9D    mov         edx,dword ptr [eax]
 000ADD9F    call        dword ptr [edx+7C]
 000ADDA2    mov         eax,dword ptr [esi+420]
 000ADDA8    mov         edx,dword ptr [eax]
 000ADDAA    call        dword ptr [edx+7C]
 000ADDAD    xor         eax,eax
 000ADDAF    mov         dword ptr [ebp-4],eax
 000ADDB2    xor         eax,eax
 000ADDB4    mov         dword ptr [ebp-0C],eax
 000ADDB7    mov         bl,58
 000ADDB9    mov         byte ptr [ebp-11],58
 000ADDBD    mov         dword ptr [ebp-10],10
 000ADDC4    mov         edi,dword ptr ds:[0B57D4];^gvar_000B55E4
 000ADDCA    inc         edi
 000ADDCB    lea         eax,[ebp-18]
 000ADDCE    mov         dl,byte ptr [edi]
 000ADDD0    call        @LStrFromChar
 000ADDD5    mov         edx,dword ptr [ebp-18]
 000ADDD8    mov         eax,dword ptr [esi+310]
 000ADDDE    mov         eax,dword ptr [eax+1EC]
 000ADDE4    call        TCanvas.TextWidth
 000ADDE9    mov         dword ptr [ebp-8],eax
 000ADDEC    lea         eax,[ebp-18]
 000ADDEF    mov         dl,byte ptr [edi]
 000ADDF1    call        @LStrFromChar
 000ADDF6    mov         edx,dword ptr [ebp-18]
 000ADDF9    mov         eax,dword ptr [esi+310]
 000ADDFF    mov         eax,dword ptr [eax+1EC]
 000ADE05    call        TCanvas.TextHeight
 000ADE0A    mov         edx,dword ptr [ebp-8]
 000ADE0D    cmp         edx,dword ptr [ebp-4]
>000ADE10    jle         000ADE1A
 000ADE12    mov         edx,dword ptr [ebp-8]
 000ADE15    mov         dword ptr [ebp-4],edx
 000ADE18    mov         bl,byte ptr [edi]
 000ADE1A    cmp         eax,dword ptr [ebp-0C]
>000ADE1D    jle         000ADE27
 000ADE1F    mov         dword ptr [ebp-0C],eax
 000ADE22    mov         al,byte ptr [edi]
 000ADE24    mov         byte ptr [ebp-11],al
 000ADE27    inc         edi
 000ADE28    dec         dword ptr [ebp-10]
>000ADE2B    jne         000ADDCB
 000ADE2D    lea         eax,[ebp-18]
 000ADE30    mov         edx,ebx
 000ADE32    call        @LStrFromChar
 000ADE37    mov         edx,dword ptr [ebp-18]
 000ADE3A    mov         edi,dword ptr [esi+310]
 000ADE40    mov         eax,dword ptr [edi+1EC]
 000ADE46    call        TCanvas.TextWidth
 000ADE4B    mov         edx,eax
 000ADE4D    add         edx,4
 000ADE50    mov         eax,edi
 000ADE52    call        TCustomGrid.SetDefaultColWidth
 000ADE57    lea         eax,[ebp-1C]
 000ADE5A    mov         edx,ebx
 000ADE5C    mov         byte ptr [eax+1],dl
 000ADE5F    mov         byte ptr [eax],1
 000ADE62    lea         edx,[ebp-1C]
 000ADE65    lea         eax,[ebp-20]
 000ADE68    call        @PStrCpy
 000ADE6D    lea         eax,[ebp-24]
 000ADE70    mov         edx,ebx
 000ADE72    mov         byte ptr [eax+1],dl
 000ADE75    mov         byte ptr [eax],1
 000ADE78    lea         edx,[ebp-24]
 000ADE7B    lea         eax,[ebp-20]
 000ADE7E    mov         cl,2
 000ADE80    call        @PStrNCat
 000ADE85    lea         edx,[ebp-20]
 000ADE88    lea         eax,[ebp-18]
 000ADE8B    call        @LStrFromString
 000ADE90    mov         edx,dword ptr [ebp-18]
 000ADE93    mov         edi,dword ptr [esi+314]
 000ADE99    mov         eax,dword ptr [edi+1EC]
 000ADE9F    call        TCanvas.TextWidth
 000ADEA4    mov         edx,eax
 000ADEA6    add         edx,4
 000ADEA9    mov         eax,edi
 000ADEAB    call        TCustomGrid.SetDefaultColWidth
 000ADEB0    lea         eax,[ebp-1C]
 000ADEB3    mov         edx,ebx
 000ADEB5    mov         byte ptr [eax+1],dl
 000ADEB8    mov         byte ptr [eax],1
 000ADEBB    lea         edx,[ebp-1C]
 000ADEBE    lea         eax,[ebp-20]
 000ADEC1    call        @PStrCpy
 000ADEC6    lea         eax,[ebp-24]
 000ADEC9    mov         edx,ebx
 000ADECB    mov         byte ptr [eax+1],dl
 000ADECE    mov         byte ptr [eax],1
 000ADED1    lea         edx,[ebp-24]
 000ADED4    lea         eax,[ebp-20]
 000ADED7    mov         cl,2
 000ADED9    call        @PStrNCat
 000ADEDE    lea         edx,[ebp-20]
 000ADEE1    lea         eax,[ebp-28]
 000ADEE4    call        @PStrCpy
 000ADEE9    lea         eax,[ebp-24]
 000ADEEC    mov         edx,ebx
 000ADEEE    mov         byte ptr [eax+1],dl
 000ADEF1    mov         byte ptr [eax],1
 000ADEF4    lea         edx,[ebp-24]
 000ADEF7    lea         eax,[ebp-28]
 000ADEFA    mov         cl,3
 000ADEFC    call        @PStrNCat
 000ADF01    lea         edx,[ebp-28]
 000ADF04    lea         eax,[ebp-30]
 000ADF07    call        @PStrCpy
 000ADF0C    lea         eax,[ebp-24]
 000ADF0F    mov         edx,ebx
 000ADF11    mov         byte ptr [eax+1],dl
 000ADF14    mov         byte ptr [eax],1
 000ADF17    lea         edx,[ebp-24]
 000ADF1A    lea         eax,[ebp-30]
 000ADF1D    mov         cl,4
 000ADF1F    call        @PStrNCat
 000ADF24    lea         edx,[ebp-30]
 000ADF27    lea         eax,[ebp-38]
 000ADF2A    call        @PStrCpy
 000ADF2F    lea         eax,[ebp-24]
 000ADF32    mov         edx,ebx
 000ADF34    mov         byte ptr [eax+1],dl
 000ADF37    mov         byte ptr [eax],1
 000ADF3A    lea         edx,[ebp-24]
 000ADF3D    lea         eax,[ebp-38]
 000ADF40    mov         cl,5
 000ADF42    call        @PStrNCat
 000ADF47    lea         edx,[ebp-38]
 000ADF4A    lea         eax,[ebp-40]
 000ADF4D    call        @PStrCpy
 000ADF52    lea         eax,[ebp-24]
 000ADF55    mov         edx,ebx
 000ADF57    mov         byte ptr [eax+1],dl
 000ADF5A    mov         byte ptr [eax],1
 000ADF5D    lea         edx,[ebp-24]
 000ADF60    lea         eax,[ebp-40]
 000ADF63    mov         cl,6
 000ADF65    call        @PStrNCat
 000ADF6A    lea         edx,[ebp-40]
 000ADF6D    lea         eax,[ebp-48]
 000ADF70    call        @PStrCpy
 000ADF75    lea         eax,[ebp-24]
 000ADF78    mov         edx,ebx
 000ADF7A    mov         byte ptr [eax+1],dl
 000ADF7D    mov         byte ptr [eax],1
 000ADF80    lea         edx,[ebp-24]
 000ADF83    lea         eax,[ebp-48]
 000ADF86    mov         cl,7
 000ADF88    call        @PStrNCat
 000ADF8D    lea         edx,[ebp-48]
 000ADF90    lea         eax,[ebp-54]
 000ADF93    call        @PStrCpy
 000ADF98    lea         eax,[ebp-24]
 000ADF9B    mov         edx,ebx
 000ADF9D    mov         byte ptr [eax+1],dl
 000ADFA0    mov         byte ptr [eax],1
 000ADFA3    lea         edx,[ebp-24]
 000ADFA6    lea         eax,[ebp-54]
 000ADFA9    mov         cl,8
 000ADFAB    call        @PStrNCat
 000ADFB0    lea         edx,[ebp-54]
 000ADFB3    lea         eax,[ebp-18]
 000ADFB6    call        @LStrFromString
 000ADFBB    mov         edx,dword ptr [ebp-18]
 000ADFBE    mov         edi,dword ptr [esi+420]
 000ADFC4    mov         eax,dword ptr [edi+1EC]
 000ADFCA    call        TCanvas.TextWidth
 000ADFCF    mov         edx,eax
 000ADFD1    add         edx,4
 000ADFD4    mov         eax,edi
 000ADFD6    call        TCustomGrid.SetDefaultColWidth
 000ADFDB    lea         eax,[ebp-18]
 000ADFDE    mov         dl,byte ptr [ebp-11]
 000ADFE1    call        @LStrFromChar
 000ADFE6    mov         edx,dword ptr [ebp-18]
 000ADFE9    mov         ebx,dword ptr [esi+310]
 000ADFEF    mov         eax,dword ptr [ebx+1EC]
 000ADFF5    call        TCanvas.TextHeight
 000ADFFA    mov         edx,eax
 000ADFFC    add         edx,4
 000ADFFF    mov         eax,ebx
 000AE001    call        TCustomGrid.SetDefaultRowHeight
 000AE006    lea         eax,[ebp-18]
 000AE009    mov         dl,byte ptr [ebp-11]
 000AE00C    call        @LStrFromChar
 000AE011    mov         edx,dword ptr [ebp-18]
 000AE014    mov         ebx,dword ptr [esi+314]
 000AE01A    mov         eax,dword ptr [ebx+1EC]
 000AE020    call        TCanvas.TextHeight
 000AE025    mov         edx,eax
 000AE027    add         edx,4
 000AE02A    mov         eax,ebx
 000AE02C    call        TCustomGrid.SetDefaultRowHeight
 000AE031    lea         eax,[ebp-18]
 000AE034    mov         dl,byte ptr [ebp-11]
 000AE037    call        @LStrFromChar
 000AE03C    mov         edx,dword ptr [ebp-18]
 000AE03F    mov         ebx,dword ptr [esi+420]
 000AE045    mov         eax,dword ptr [ebx+1EC]
 000AE04B    call        TCanvas.TextHeight
 000AE050    mov         edx,eax
 000AE052    add         edx,4
 000AE055    mov         eax,ebx
 000AE057    call        TCustomGrid.SetDefaultRowHeight
 000AE05C    mov         ecx,dword ptr ds:[0B578C];^gvar_000B6B68:Longint
 000AE062    mov         ecx,dword ptr [ecx]
 000AE064    mov         edx,dword ptr ds:[0B5868];^gvar_000B6B64:Longint
 000AE06A    mov         edx,dword ptr [edx]
 000AE06C    mov         eax,esi
 000AE06E    call        000AE0E8
 000AE073    xor         eax,eax
 000AE075    pop         edx
 000AE076    pop         ecx
 000AE077    pop         ecx
 000AE078    mov         dword ptr fs:[eax],edx
 000AE07B    push        0AE090
 000AE080    lea         eax,[ebp-18]
 000AE083    call        @LStrClr
 000AE088    ret
>000AE089    jmp         @HandleFinally
>000AE08E    jmp         000AE080
 000AE090    pop         edi
 000AE091    pop         esi
 000AE092    pop         ebx
 000AE093    mov         esp,ebp
 000AE095    pop         ebp
 000AE096    ret
*}
end;

//000AE098
{*procedure sub_000AE098(?:TFormMain; ?:?);
begin
 000AE098    push        ebx
 000AE099    push        esi
 000AE09A    mov         esi,edx
 000AE09C    mov         ebx,eax
 000AE09E    mov         eax,dword ptr [ebx+310];TFormMain.CMStrGridText:TCMStrGrid
 000AE0A4    mov         eax,dword ptr [eax+58];TCMStrGrid.FFont:TFont
 000AE0A7    mov         edx,esi
 000AE0A9    call        TFont.SetName
 000AE0AE    mov         eax,dword ptr [ebx+314];TFormMain.CMStrGridHex:TCMStrGrid
 000AE0B4    mov         eax,dword ptr [eax+58];TCMStrGrid.FFont:TFont
 000AE0B7    mov         edx,esi
 000AE0B9    call        TFont.SetName
 000AE0BE    mov         eax,dword ptr [ebx+420];TFormMain.CMStrGridAddr:TCMStrGrid
 000AE0C4    mov         eax,dword ptr [eax+58];TCMStrGrid.FFont:TFont
 000AE0C7    mov         edx,esi
 000AE0C9    call        TFont.SetName
 000AE0CE    mov         eax,dword ptr [ebx+314];TFormMain.CMStrGridHex:TCMStrGrid
 000AE0D4    mov         eax,dword ptr [eax+58];TCMStrGrid.FFont:TFont
 000AE0D7    call        TFont.GetSize
 000AE0DC    mov         edx,eax
 000AE0DE    mov         eax,ebx
 000AE0E0    call        000ADD3C
 000AE0E5    pop         esi
 000AE0E6    pop         ebx
 000AE0E7    ret
end;*}

//000AE0E8
{*procedure sub_000AE0E8(?:TFormMain; ?:Longint; ?:?);
begin
 000AE0E8    push        ebx
 000AE0E9    push        esi
 000AE0EA    push        edi
 000AE0EB    push        ebp
 000AE0EC    push        ecx
 000AE0ED    mov         esi,ecx
 000AE0EF    mov         ebp,edx
 000AE0F1    mov         ebx,eax
 000AE0F3    call        000981C4
 000AE0F8    mov         dword ptr [esp],eax
 000AE0FB    mov         edi,dword ptr [ebx+310];TFormMain.CMStrGridText:TCMStrGrid
 000AE101    mov         edx,ebp
 000AE103    mov         eax,edi
 000AE105    call        TCustomGrid.SetColCount
 000AE10A    mov         edx,esi
 000AE10C    mov         eax,edi
 000AE10E    call        TCustomGrid.SetRowCount
 000AE113    mov         edx,ebp
 000AE115    mov         eax,edi
 000AE117    call        000892DC
 000AE11C    mov         edx,eax
 000AE11E    mov         eax,edi
 000AE120    call        TControl.SetWidth
 000AE125    mov         edx,esi
 000AE127    mov         eax,edi
 000AE129    call        000892F4
 000AE12E    mov         edx,eax
 000AE130    mov         eax,edi
 000AE132    call        TControl.SetHeight
 000AE137    mov         edi,dword ptr [ebx+314];TFormMain.CMStrGridHex:TCMStrGrid
 000AE13D    mov         edx,ebp
 000AE13F    mov         eax,edi
 000AE141    call        TCustomGrid.SetColCount
 000AE146    mov         edx,esi
 000AE148    mov         eax,edi
 000AE14A    call        TCustomGrid.SetRowCount
 000AE14F    mov         edx,ebp
 000AE151    mov         eax,edi
 000AE153    call        000892DC
 000AE158    mov         edx,eax
 000AE15A    mov         eax,edi
 000AE15C    call        TControl.SetWidth
 000AE161    mov         edx,esi
 000AE163    mov         eax,edi
 000AE165    call        000892F4
 000AE16A    mov         edx,eax
 000AE16C    mov         eax,edi
 000AE16E    call        TControl.SetHeight
 000AE173    mov         edi,dword ptr [ebx+420];TFormMain.CMStrGridAddr:TCMStrGrid
 000AE179    mov         eax,[000B5AD8];^gvar_000B7006:Boolean
 000AE17E    cmp         byte ptr [eax],0
>000AE181    je          000AE18E
 000AE183    xor         edx,edx
 000AE185    mov         eax,edi
 000AE187    call        TControl.SetWidth
>000AE18C    jmp         000AE1AC
 000AE18E    mov         edx,esi
 000AE190    mov         eax,edi
 000AE192    call        TCustomGrid.SetRowCount
 000AE197    mov         edx,1
 000AE19C    mov         eax,edi
 000AE19E    call        000892DC
 000AE1A3    mov         edx,eax
 000AE1A5    mov         eax,edi
 000AE1A7    call        TControl.SetWidth
 000AE1AC    mov         edx,esi
 000AE1AE    mov         eax,edi
 000AE1B0    call        000892F4
 000AE1B5    mov         edx,eax
 000AE1B7    mov         eax,edi
 000AE1B9    call        TControl.SetHeight
 000AE1BE    mov         eax,[000B5A20];^gvar_000B6CFC:Boolean
 000AE1C3    cmp         byte ptr [eax],0
>000AE1C6    je          000AE23A
 000AE1C8    mov         eax,[000B5AD8];^gvar_000B7006:Boolean
 000AE1CD    cmp         byte ptr [eax],0
>000AE1D0    jne         000AE1F4
 000AE1D2    push        5
 000AE1D4    call        user32.GetSystemMetrics
 000AE1D9    mov         edx,eax
 000AE1DB    mov         edi,dword ptr [ebx+420];TFormMain.CMStrGridAddr:TCMStrGrid
 000AE1E1    mov         eax,dword ptr [edi+30];TCMStrGrid.Left:Integer
 000AE1E4    add         eax,dword ptr [edi+38];TCMStrGrid.Width:Integer
 000AE1E7    add         edx,eax
 000AE1E9    mov         eax,dword ptr [ebx+310];TFormMain.CMStrGridText:TCMStrGrid
 000AE1EF    call        TControl.SetLeft
 000AE1F4    push        5
 000AE1F6    call        user32.GetSystemMetrics
 000AE1FB    mov         edx,eax
 000AE1FD    mov         edi,dword ptr [ebx+310];TFormMain.CMStrGridText:TCMStrGrid
 000AE203    mov         eax,dword ptr [edi+30];TCMStrGrid.Left:Integer
 000AE206    add         eax,dword ptr [edi+38];TCMStrGrid.Width:Integer
 000AE209    add         edx,eax
 000AE20B    mov         eax,dword ptr [ebx+314];TFormMain.CMStrGridHex:TCMStrGrid
 000AE211    call        TControl.SetLeft
 000AE216    push        5
 000AE218    call        user32.GetSystemMetrics
 000AE21D    mov         edx,eax
 000AE21F    mov         edi,dword ptr [ebx+314];TFormMain.CMStrGridHex:TCMStrGrid
 000AE225    mov         eax,dword ptr [edi+30];TCMStrGrid.Left:Integer
 000AE228    add         eax,dword ptr [edi+38];TCMStrGrid.Width:Integer
 000AE22B    add         edx,eax
 000AE22D    mov         eax,dword ptr [ebx+4C8];TFormMain.?f4C8:TCMScrollBar
 000AE233    call        TControl.SetLeft
>000AE238    jmp         000AE2AA
 000AE23A    mov         eax,[000B5AD8];^gvar_000B7006:Boolean
 000AE23F    cmp         byte ptr [eax],0
>000AE242    jne         000AE266
 000AE244    push        5
 000AE246    call        user32.GetSystemMetrics
 000AE24B    mov         edx,eax
 000AE24D    mov         edi,dword ptr [ebx+420];TFormMain.CMStrGridAddr:TCMStrGrid
 000AE253    mov         eax,dword ptr [edi+30];TCMStrGrid.Left:Integer
 000AE256    add         eax,dword ptr [edi+38];TCMStrGrid.Width:Integer
 000AE259    add         edx,eax
 000AE25B    mov         eax,dword ptr [ebx+314];TFormMain.CMStrGridHex:TCMStrGrid
 000AE261    call        TControl.SetLeft
 000AE266    push        5
 000AE268    call        user32.GetSystemMetrics
 000AE26D    mov         edx,eax
 000AE26F    mov         edi,dword ptr [ebx+314];TFormMain.CMStrGridHex:TCMStrGrid
 000AE275    mov         eax,dword ptr [edi+30];TCMStrGrid.Left:Integer
 000AE278    add         eax,dword ptr [edi+38];TCMStrGrid.Width:Integer
 000AE27B    add         edx,eax
 000AE27D    mov         eax,dword ptr [ebx+310];TFormMain.CMStrGridText:TCMStrGrid
 000AE283    call        TControl.SetLeft
 000AE288    push        5
 000AE28A    call        user32.GetSystemMetrics
 000AE28F    mov         edx,eax
 000AE291    mov         edi,dword ptr [ebx+310];TFormMain.CMStrGridText:TCMStrGrid
 000AE297    mov         eax,dword ptr [edi+30];TCMStrGrid.Left:Integer
 000AE29A    add         eax,dword ptr [edi+38];TCMStrGrid.Width:Integer
 000AE29D    add         edx,eax
 000AE29F    mov         eax,dword ptr [ebx+4C8];TFormMain.?f4C8:TCMScrollBar
 000AE2A5    call        TControl.SetLeft
 000AE2AA    mov         edx,ebp
 000AE2AC    mov         eax,ebx
 000AE2AE    call        000AB134
 000AE2B3    mov         edx,eax
 000AE2B5    mov         eax,ebx
 000AE2B7    call        TControl.SetWidth
 000AE2BC    mov         edx,esi
 000AE2BE    mov         eax,ebx
 000AE2C0    call        000AB1AC
 000AE2C5    mov         edx,eax
 000AE2C7    mov         eax,ebx
 000AE2C9    call        TControl.SetHeight
 000AE2CE    mov         eax,dword ptr [ebx+310];TFormMain.CMStrGridText:TCMStrGrid
 000AE2D4    mov         edx,dword ptr [eax+3C];TCMStrGrid.Height:Integer
 000AE2D7    dec         edx
 000AE2D8    mov         eax,dword ptr [ebx+4C8];TFormMain.?f4C8:TCMScrollBar
 000AE2DE    call        TControl.SetHeight
 000AE2E3    mov         eax,[000B5868];^gvar_000B6B64:Longint
 000AE2E8    mov         dword ptr [eax],ebp
 000AE2EA    mov         eax,[000B578C];^gvar_000B6B68:Longint
 000AE2EF    mov         dword ptr [eax],esi
 000AE2F1    mov         eax,[000B578C];^gvar_000B6B68:Longint
 000AE2F6    mov         eax,dword ptr [eax]
 000AE2F8    mov         edx,dword ptr ds:[0B5868];^gvar_000B6B64:Longint
 000AE2FE    imul        dword ptr [edx]
 000AE300    mov         edx,dword ptr ds:[0B59E0];^gvar_000B6BB0:Integer
 000AE306    mov         dword ptr [edx],eax
 000AE308    mov         edx,dword ptr ds:[0B5868];^gvar_000B6B64:Longint
 000AE30E    mov         edx,dword ptr [edx]
 000AE310    mov         eax,dword ptr [ebx+4C8];TFormMain.?f4C8:TCMScrollBar
 000AE316    mov         dword ptr [eax+200],edx;TCMScrollBar.SmallChange:TCMScrollBarInc
 000AE31C    mov         edx,dword ptr ds:[0B59E0];^gvar_000B6BB0:Integer
 000AE322    mov         edx,dword ptr [edx]
 000AE324    mov         ecx,dword ptr ds:[0B5868];^gvar_000B6B64:Longint
 000AE32A    sub         edx,dword ptr [ecx]
 000AE32C    mov         dword ptr [eax+204],edx;TCMScrollBar.LargeChange:TCMScrollBarInc
 000AE332    xor         ecx,ecx
 000AE334    mov         dl,1
 000AE336    mov         eax,dword ptr [esp]
 000AE339    call        000998B0
 000AE33E    pop         edx
 000AE33F    pop         ebp
 000AE340    pop         edi
 000AE341    pop         esi
 000AE342    pop         ebx
 000AE343    ret
end;*}

//000AE344
{*procedure sub_000AE344(?:TFormMain; ?:?; ?:?);
begin
 000AE344    push        ebx
 000AE345    push        esi
 000AE346    mov         ebx,ecx
 000AE348    mov         esi,eax
 000AE34A    test        dl,dl
>000AE34C    je          000AE35D
 000AE34E    xor         edx,edx
 000AE350    mov         eax,dword ptr [esi+2C8];TFormMain.Panel1:TPanel
 000AE356    call        TControl.SetHeight
>000AE35B    jmp         000AE370
 000AE35D    mov         edx,dword ptr ds:[0B5C18];^gvar_000B6BD0:Integer
 000AE363    mov         edx,dword ptr [edx]
 000AE365    mov         eax,dword ptr [esi+2C8];TFormMain.Panel1:TPanel
 000AE36B    call        TControl.SetHeight
 000AE370    mov         eax,dword ptr [esi+2C8];TFormMain.Panel1:TPanel
 000AE376    mov         edx,dword ptr [eax+3C];TPanel.Height:Integer
 000AE379    inc         edx
 000AE37A    mov         eax,dword ptr [esi+310];TFormMain.CMStrGridText:TCMStrGrid
 000AE380    call        TControl.SetTop
 000AE385    mov         eax,dword ptr [esi+2C8];TFormMain.Panel1:TPanel
 000AE38B    mov         edx,dword ptr [eax+3C];TPanel.Height:Integer
 000AE38E    inc         edx
 000AE38F    mov         eax,dword ptr [esi+314];TFormMain.CMStrGridHex:TCMStrGrid
 000AE395    call        TControl.SetTop
 000AE39A    mov         eax,dword ptr [esi+2C8];TFormMain.Panel1:TPanel
 000AE3A0    mov         edx,dword ptr [eax+3C];TPanel.Height:Integer
 000AE3A3    inc         edx
 000AE3A4    mov         eax,dword ptr [esi+420];TFormMain.CMStrGridAddr:TCMStrGrid
 000AE3AA    call        TControl.SetTop
 000AE3AF    test        bl,bl
>000AE3B1    je          000AE3CA
 000AE3B3    mov         ecx,dword ptr ds:[0B578C];^gvar_000B6B68:Longint
 000AE3B9    mov         ecx,dword ptr [ecx]
 000AE3BB    mov         edx,dword ptr ds:[0B5868];^gvar_000B6B64:Longint
 000AE3C1    mov         edx,dword ptr [edx]
 000AE3C3    mov         eax,esi
 000AE3C5    call        000AE0E8
 000AE3CA    mov         eax,dword ptr [esi+2C8];TFormMain.Panel1:TPanel
 000AE3D0    mov         edx,dword ptr [eax+3C];TPanel.Height:Integer
 000AE3D3    add         edx,2
 000AE3D6    mov         eax,dword ptr [esi+4C8];TFormMain.?f4C8:TCMScrollBar
 000AE3DC    call        TControl.SetTop
 000AE3E1    pop         esi
 000AE3E2    pop         ebx
 000AE3E3    ret
end;*}

//000AE3E4
{*procedure sub_000AE3E4(?:TFormMain; ?:?; ?:?);
begin
 000AE3E4    push        ebx
 000AE3E5    push        esi
 000AE3E6    push        edi
 000AE3E7    mov         ebx,ecx
 000AE3E9    mov         edi,eax
 000AE3EB    test        dl,dl
>000AE3ED    je          000AE3FE
 000AE3EF    xor         edx,edx
 000AE3F1    mov         eax,dword ptr [edi+420];TFormMain.CMStrGridAddr:TCMStrGrid
 000AE3F7    call        TControl.SetWidth
>000AE3FC    jmp         000AE419
 000AE3FE    mov         edx,1
 000AE403    mov         esi,dword ptr [edi+420];TFormMain.CMStrGridAddr:TCMStrGrid
 000AE409    mov         eax,esi
 000AE40B    call        000892DC
 000AE410    mov         edx,eax
 000AE412    mov         eax,esi
 000AE414    call        TControl.SetWidth
 000AE419    mov         eax,[000B5A20];^gvar_000B6CFC:Boolean
 000AE41E    cmp         byte ptr [eax],0
>000AE421    je          000AE482
 000AE423    mov         eax,[000B5AD8];^gvar_000B7006:Boolean
 000AE428    cmp         byte ptr [eax],0
>000AE42B    je          000AE43C
 000AE42D    xor         edx,edx
 000AE42F    mov         eax,dword ptr [edi+310];TFormMain.CMStrGridText:TCMStrGrid
 000AE435    call        TControl.SetLeft
>000AE43A    jmp         000AE45E
 000AE43C    push        5
 000AE43E    call        user32.GetSystemMetrics
 000AE443    mov         edx,eax
 000AE445    mov         esi,dword ptr [edi+420];TFormMain.CMStrGridAddr:TCMStrGrid
 000AE44B    mov         eax,dword ptr [esi+30];TCMStrGrid.Left:Integer
 000AE44E    add         eax,dword ptr [esi+38];TCMStrGrid.Width:Integer
 000AE451    add         edx,eax
 000AE453    mov         eax,dword ptr [edi+310];TFormMain.CMStrGridText:TCMStrGrid
 000AE459    call        TControl.SetLeft
 000AE45E    push        5
 000AE460    call        user32.GetSystemMetrics
 000AE465    mov         edx,eax
 000AE467    mov         esi,dword ptr [edi+310];TFormMain.CMStrGridText:TCMStrGrid
 000AE46D    mov         eax,dword ptr [esi+30];TCMStrGrid.Left:Integer
 000AE470    add         eax,dword ptr [esi+38];TCMStrGrid.Width:Integer
 000AE473    add         edx,eax
 000AE475    mov         eax,dword ptr [edi+314];TFormMain.CMStrGridHex:TCMStrGrid
 000AE47B    call        TControl.SetLeft
>000AE480    jmp         000AE4DF
 000AE482    mov         eax,[000B5AD8];^gvar_000B7006:Boolean
 000AE487    cmp         byte ptr [eax],0
>000AE48A    je          000AE49B
 000AE48C    xor         edx,edx
 000AE48E    mov         eax,dword ptr [edi+314];TFormMain.CMStrGridHex:TCMStrGrid
 000AE494    call        TControl.SetLeft
>000AE499    jmp         000AE4BD
 000AE49B    push        5
 000AE49D    call        user32.GetSystemMetrics
 000AE4A2    mov         edx,eax
 000AE4A4    mov         esi,dword ptr [edi+420];TFormMain.CMStrGridAddr:TCMStrGrid
 000AE4AA    mov         eax,dword ptr [esi+30];TCMStrGrid.Left:Integer
 000AE4AD    add         eax,dword ptr [esi+38];TCMStrGrid.Width:Integer
 000AE4B0    add         edx,eax
 000AE4B2    mov         eax,dword ptr [edi+314];TFormMain.CMStrGridHex:TCMStrGrid
 000AE4B8    call        TControl.SetLeft
 000AE4BD    push        5
 000AE4BF    call        user32.GetSystemMetrics
 000AE4C4    mov         edx,eax
 000AE4C6    mov         esi,dword ptr [edi+314];TFormMain.CMStrGridHex:TCMStrGrid
 000AE4CC    mov         eax,dword ptr [esi+30];TCMStrGrid.Left:Integer
 000AE4CF    add         eax,dword ptr [esi+38];TCMStrGrid.Width:Integer
 000AE4D2    add         edx,eax
 000AE4D4    mov         eax,dword ptr [edi+310];TFormMain.CMStrGridText:TCMStrGrid
 000AE4DA    call        TControl.SetLeft
 000AE4DF    test        bl,bl
>000AE4E1    je          000AE511
 000AE4E3    mov         ecx,dword ptr ds:[0B578C];^gvar_000B6B68:Longint
 000AE4E9    mov         ecx,dword ptr [ecx]
 000AE4EB    mov         edx,dword ptr ds:[0B5868];^gvar_000B6B64:Longint
 000AE4F1    mov         edx,dword ptr [edx]
 000AE4F3    mov         eax,edi
 000AE4F5    call        000AE0E8
 000AE4FA    mov         eax,dword ptr [edi+314];TFormMain.CMStrGridHex:TCMStrGrid
 000AE500    mov         eax,dword ptr [eax+58];TCMStrGrid.FFont:TFont
 000AE503    call        TFont.GetSize
 000AE508    mov         edx,eax
 000AE50A    mov         eax,edi
 000AE50C    call        000ADD3C
 000AE511    pop         edi
 000AE512    pop         esi
 000AE513    pop         ebx
 000AE514    ret
end;*}

//000AE518
{*procedure sub_000AE518(?:TFormMain; ?:?);
begin
 000AE518    push        ebx
 000AE519    push        esi
 000AE51A    mov         ebx,eax
 000AE51C    test        dl,dl
>000AE51E    je          000AE57A
 000AE520    mov         esi,dword ptr [ebx+420];TFormMain.CMStrGridAddr:TCMStrGrid
 000AE526    mov         dx,word ptr ds:[0AE5D0];0xC gvar_000AE5D0
 000AE52D    not         edx
 000AE52F    and         dx,word ptr [esi+228];TCMStrGrid.FOptions:TGridOptions
 000AE536    mov         eax,esi
 000AE538    call        TCustomGrid.SetOptions
 000AE53D    mov         esi,dword ptr [ebx+314];TFormMain.CMStrGridHex:TCMStrGrid
 000AE543    mov         dx,word ptr ds:[0AE5D0];0xC gvar_000AE5D0
 000AE54A    not         edx
 000AE54C    and         dx,word ptr [esi+228];TCMStrGrid.FOptions:TGridOptions
 000AE553    mov         eax,esi
 000AE555    call        TCustomGrid.SetOptions
 000AE55A    mov         ebx,dword ptr [ebx+310];TFormMain.CMStrGridText:TCMStrGrid
 000AE560    mov         dx,word ptr ds:[0AE5D0];0xC gvar_000AE5D0
 000AE567    not         edx
 000AE569    and         dx,word ptr [ebx+228];TCMStrGrid.FOptions:TGridOptions
 000AE570    mov         eax,ebx
 000AE572    call        TCustomGrid.SetOptions
 000AE577    pop         esi
 000AE578    pop         ebx
 000AE579    ret
 000AE57A    mov         esi,dword ptr [ebx+420];TFormMain.CMStrGridAddr:TCMStrGrid
 000AE580    mov         dx,word ptr [esi+228];TCMStrGrid.FOptions:TGridOptions
 000AE587    or          dx,word ptr ds:[0AE5D0];0xC gvar_000AE5D0
 000AE58E    mov         eax,esi
 000AE590    call        TCustomGrid.SetOptions
 000AE595    mov         esi,dword ptr [ebx+314];TFormMain.CMStrGridHex:TCMStrGrid
 000AE59B    mov         dx,word ptr [esi+228];TCMStrGrid.FOptions:TGridOptions
 000AE5A2    or          dx,word ptr ds:[0AE5D0];0xC gvar_000AE5D0
 000AE5A9    mov         eax,esi
 000AE5AB    call        TCustomGrid.SetOptions
 000AE5B0    mov         ebx,dword ptr [ebx+310];TFormMain.CMStrGridText:TCMStrGrid
 000AE5B6    mov         dx,word ptr [ebx+228];TCMStrGrid.FOptions:TGridOptions
 000AE5BD    or          dx,word ptr ds:[0AE5D0];0xC gvar_000AE5D0
 000AE5C4    mov         eax,ebx
 000AE5C6    call        TCustomGrid.SetOptions
 000AE5CB    pop         esi
 000AE5CC    pop         ebx
 000AE5CD    ret
end;*}

//000AE5D4
procedure TFormMain.Exit1Click(Sender:TObject);
begin
{*
 000AE5D4    call        TCustomForm.Close
 000AE5D9    ret
*}
end;

//000AE5DC
procedure TFormMain.ModusText1Click(Sender:TObject);
begin
{*
 000AE5DC    push        ebx
 000AE5DD    mov         ebx,eax
 000AE5DF    mov         eax,[000B5B00];^gvar_000B6BA4
 000AE5E4    mov         al,byte ptr [eax]
 000AE5E6    xor         al,1
 000AE5E8    mov         edx,dword ptr ds:[0B5B00];^gvar_000B6BA4
 000AE5EE    mov         byte ptr [edx],al
 000AE5F0    mov         edx,dword ptr ds:[0B5B00];^gvar_000B6BA4
 000AE5F6    mov         dl,byte ptr [edx]
 000AE5F8    mov         eax,dword ptr [ebx+2FC];TFormMain.ModusText1:TMenuItem
 000AE5FE    call        TMenuItem.SetChecked
 000AE603    mov         eax,[000B5B00];^gvar_000B6BA4
 000AE608    cmp         byte ptr [eax],0
>000AE60B    je          000AE6AF
 000AE611    xor         edx,edx
 000AE613    mov         eax,dword ptr [ebx+310];TFormMain.CMStrGridText:TCMStrGrid
 000AE619    call        TCMStrGrid.SetSlaveGrid
 000AE61E    xor         edx,edx
 000AE620    mov         eax,dword ptr [ebx+314];TFormMain.CMStrGridHex:TCMStrGrid
 000AE626    call        TCMStrGrid.SetSlaveGrid
 000AE62B    mov         dl,1
 000AE62D    mov         eax,dword ptr [ebx+310];TFormMain.CMStrGridText:TCMStrGrid
 000AE633    mov         ecx,dword ptr [eax]
 000AE635    call        dword ptr [ecx+60];TControl.SetEnabled
 000AE638    mov         edx,80000005
 000AE63D    mov         eax,dword ptr [ebx+310];TFormMain.CMStrGridText:TCMStrGrid
 000AE643    call        TControl.SetColor
 000AE648    mov         eax,dword ptr [ebx+310];TFormMain.CMStrGridText:TCMStrGrid
 000AE64E    mov         eax,dword ptr [eax+58];TCMStrGrid.FFont:TFont
 000AE651    mov         edx,80000008
 000AE656    call        TFont.SetColor
 000AE65B    xor         edx,edx
 000AE65D    mov         eax,dword ptr [ebx+314];TFormMain.CMStrGridHex:TCMStrGrid
 000AE663    mov         ecx,dword ptr [eax]
 000AE665    call        dword ptr [ecx+60];TControl.SetEnabled
 000AE668    mov         edx,8000000F
 000AE66D    mov         eax,dword ptr [ebx+314];TFormMain.CMStrGridHex:TCMStrGrid
 000AE673    call        TControl.SetColor
 000AE678    mov         eax,dword ptr [ebx+314];TFormMain.CMStrGridHex:TCMStrGrid
 000AE67E    mov         eax,dword ptr [eax+58];TCMStrGrid.FFont:TFont
 000AE681    mov         edx,80000012
 000AE686    call        TFont.SetColor
 000AE68B    mov         eax,dword ptr [ebx+310];TFormMain.CMStrGridText:TCMStrGrid
 000AE691    mov         edx,dword ptr [eax]
 000AE693    call        dword ptr [edx+0B4];TWinControl.SetFocus
 000AE699    mov         edx,dword ptr [ebx+314];TFormMain.CMStrGridHex:TCMStrGrid
 000AE69F    mov         eax,dword ptr [ebx+310];TFormMain.CMStrGridText:TCMStrGrid
 000AE6A5    call        TCMStrGrid.SetSlaveGrid
>000AE6AA    jmp         000AE748
 000AE6AF    xor         edx,edx
 000AE6B1    mov         eax,dword ptr [ebx+310];TFormMain.CMStrGridText:TCMStrGrid
 000AE6B7    call        TCMStrGrid.SetSlaveGrid
 000AE6BC    xor         edx,edx
 000AE6BE    mov         eax,dword ptr [ebx+314];TFormMain.CMStrGridHex:TCMStrGrid
 000AE6C4    call        TCMStrGrid.SetSlaveGrid
 000AE6C9    xor         edx,edx
 000AE6CB    mov         eax,dword ptr [ebx+310];TFormMain.CMStrGridText:TCMStrGrid
 000AE6D1    mov         ecx,dword ptr [eax]
 000AE6D3    call        dword ptr [ecx+60];TControl.SetEnabled
 000AE6D6    mov         edx,8000000F
 000AE6DB    mov         eax,dword ptr [ebx+310];TFormMain.CMStrGridText:TCMStrGrid
 000AE6E1    call        TControl.SetColor
 000AE6E6    mov         eax,dword ptr [ebx+310];TFormMain.CMStrGridText:TCMStrGrid
 000AE6EC    mov         eax,dword ptr [eax+58];TCMStrGrid.FFont:TFont
 000AE6EF    mov         edx,80000012
 000AE6F4    call        TFont.SetColor
 000AE6F9    mov         dl,1
 000AE6FB    mov         eax,dword ptr [ebx+314];TFormMain.CMStrGridHex:TCMStrGrid
 000AE701    mov         ecx,dword ptr [eax]
 000AE703    call        dword ptr [ecx+60];TControl.SetEnabled
 000AE706    mov         edx,80000005
 000AE70B    mov         eax,dword ptr [ebx+314];TFormMain.CMStrGridHex:TCMStrGrid
 000AE711    call        TControl.SetColor
 000AE716    mov         eax,dword ptr [ebx+314];TFormMain.CMStrGridHex:TCMStrGrid
 000AE71C    mov         eax,dword ptr [eax+58];TCMStrGrid.FFont:TFont
 000AE71F    mov         edx,80000008
 000AE724    call        TFont.SetColor
 000AE729    mov         eax,dword ptr [ebx+314];TFormMain.CMStrGridHex:TCMStrGrid
 000AE72F    mov         edx,dword ptr [eax]
 000AE731    call        dword ptr [edx+0B4];TWinControl.SetFocus
 000AE737    mov         edx,dword ptr [ebx+310];TFormMain.CMStrGridText:TCMStrGrid
 000AE73D    mov         eax,dword ptr [ebx+314];TFormMain.CMStrGridHex:TCMStrGrid
 000AE743    call        TCMStrGrid.SetSlaveGrid
 000AE748    call        000983B8
 000AE74D    mov         eax,ebx
 000AE74F    call        000B2DE8
 000AE754    pop         ebx
 000AE755    ret
*}
end;

//000AE758
{*procedure TFormMain.ScrollBar1Scroll(?:?; ?:?; ?:?);
begin
 000AE758    push        ebp
 000AE759    mov         ebp,esp
 000AE75B    cmp         cl,8
>000AE75E    jne         000AE7C5
 000AE760    xor         eax,eax
 000AE762    call        000985E8
 000AE767    mov         eax,[000B5BA0];^gvar_000B6BAC:Single
 000AE76C    mov         eax,dword ptr [eax]
 000AE76E    mov         edx,dword ptr ds:[0B59E0];^gvar_000B6BB0:Integer
 000AE774    sub         eax,dword ptr [edx]
 000AE776    inc         eax
 000AE777    mov         edx,dword ptr [ebp+8]
 000AE77A    cmp         eax,dword ptr [edx]
>000AE77C    jg          000AE785
 000AE77E    call        00099A28
>000AE783    jmp         000AE7CF
 000AE785    mov         eax,dword ptr [ebp+8]
 000AE788    mov         eax,dword ptr [eax]
 000AE78A    mov         edx,dword ptr ds:[0B5868];^gvar_000B6B64:Longint
 000AE790    cmp         eax,dword ptr [edx]
>000AE792    jge         000AE79B
 000AE794    call        00099A04
>000AE799    jmp         000AE7CF
 000AE79B    mov         eax,dword ptr [ebp+8]
 000AE79E    mov         eax,dword ptr [eax]
 000AE7A0    dec         eax
 000AE7A1    mov         edx,dword ptr ds:[0B5868];^gvar_000B6B64:Longint
 000AE7A7    mov         ecx,dword ptr [edx]
 000AE7A9    cdq
 000AE7AA    idiv        eax,ecx
 000AE7AC    mov         edx,dword ptr ds:[0B5868];^gvar_000B6B64:Longint
 000AE7B2    imul        dword ptr [edx]
 000AE7B4    inc         eax
 000AE7B5    xor         ecx,ecx
 000AE7B7    mov         dl,1
 000AE7B9    call        000998B0
 000AE7BE    call        000983B8
>000AE7C3    jmp         000AE7CF
 000AE7C5    mov         eax,0AE7DC;'Scrolling...'
 000AE7CA    call        000985E8
 000AE7CF    pop         ebp
 000AE7D0    ret         4
end;*}

//000AE7EC
procedure sub_000AE7EC(?:TFormMain; ?:Char);
begin
{*
 000AE7EC    push        ebp
 000AE7ED    mov         ebp,esp
 000AE7EF    add         esp,0FFFFFFF8
 000AE7F2    push        ebx
 000AE7F3    push        esi
 000AE7F4    push        edi
 000AE7F5    xor         ecx,ecx
 000AE7F7    mov         dword ptr [ebp-8],ecx
 000AE7FA    mov         byte ptr [ebp-1],dl
 000AE7FD    mov         esi,eax
 000AE7FF    xor         eax,eax
 000AE801    push        ebp
 000AE802    push        0AE905
 000AE807    push        dword ptr fs:[eax]
 000AE80A    mov         dword ptr fs:[eax],esp
 000AE80D    call        000981C4
 000AE812    mov         edi,eax
 000AE814    mov         ebx,dword ptr [esi+310]
 000AE81A    mov         al,byte ptr [ebp-1]
 000AE81D    call        00099A90
 000AE822    mov         edx,eax
 000AE824    lea         eax,[ebp-8]
 000AE827    call        @LStrFromChar
 000AE82C    mov         eax,dword ptr [ebp-8]
 000AE82F    push        eax
 000AE830    mov         ecx,dword ptr [ebx+20C]
 000AE836    mov         edx,dword ptr [ebx+208]
 000AE83C    mov         eax,ebx
 000AE83E    call        TStringGrid.SetCells
 000AE843    mov         ebx,dword ptr [esi+314]
 000AE849    lea         edx,[ebp-8]
 000AE84C    mov         al,byte ptr [ebp-1]
 000AE84F    call        00074C9C
 000AE854    mov         eax,dword ptr [ebp-8]
 000AE857    push        eax
 000AE858    mov         ecx,dword ptr [ebx+20C]
 000AE85E    mov         edx,dword ptr [ebx+208]
 000AE864    mov         eax,ebx
 000AE866    call        TStringGrid.SetCells
 000AE86B    mov         eax,[000B5BA0];^gvar_000B6BAC:Single
 000AE870    cmp         dword ptr [eax],0
>000AE873    jne         000AE894
 000AE875    mov         dl,byte ptr [ebp-1]
 000AE878    mov         eax,1
 000AE87D    call        000981B8
 000AE882    mov         eax,[000B5BA0];^gvar_000B6BAC:Single
 000AE887    mov         dword ptr [eax],1
 000AE88D    call        000983B8
>000AE892    jmp         000AE8CD
 000AE894    mov         eax,[000B5A0C];^gvar_000B6BA6
 000AE899    cmp         byte ptr [eax],0
>000AE89C    je          000AE8C0
 000AE89E    mov         dl,byte ptr [ebp-1]
 000AE8A1    mov         eax,edi
 000AE8A3    call        000981B8
 000AE8A8    mov         eax,[000B5634];^gvar_000B6B50:TFormInspect
 000AE8AD    cmp         dword ptr [eax],0
>000AE8B0    je          000AE8CD
 000AE8B2    mov         eax,[000B5634];^gvar_000B6B50:TFormInspect
 000AE8B7    mov         eax,dword ptr [eax]
 000AE8B9    call        00093834
>000AE8BE    jmp         000AE8CD
 000AE8C0    mov         al,byte ptr [ebp-1]
 000AE8C3    call        000989B4
 000AE8C8    call        00099890
 000AE8CD    mov         ax,27
 000AE8D1    call        00098804
 000AE8D6    mov         eax,[000B5778];^gvar_000B6BA5
 000AE8DB    mov         byte ptr [eax],1
 000AE8DE    mov         eax,[000B5A0C];^gvar_000B6BA6
 000AE8E3    cmp         byte ptr [eax],0
>000AE8E6    jne         000AE8EF
 000AE8E8    mov         eax,edi
 000AE8EA    call        00099E68
 000AE8EF    xor         eax,eax
 000AE8F1    pop         edx
 000AE8F2    pop         ecx
 000AE8F3    pop         ecx
 000AE8F4    mov         dword ptr fs:[eax],edx
 000AE8F7    push        0AE90C
 000AE8FC    lea         eax,[ebp-8]
 000AE8FF    call        @LStrClr
 000AE904    ret
>000AE905    jmp         @HandleFinally
>000AE90A    jmp         000AE8FC
 000AE90C    pop         edi
 000AE90D    pop         esi
 000AE90E    pop         ebx
 000AE90F    pop         ecx
 000AE910    pop         ecx
 000AE911    pop         ebp
 000AE912    ret
*}
end;

//000AE914
procedure sub_000AE914;
begin
{*
 000AE914    mov         eax,[000B5868];^gvar_000B6B64:Longint
 000AE919    mov         eax,dword ptr [eax]
 000AE91B    mov         edx,dword ptr ds:[0B5984];^gvar_000B6B84
 000AE921    add         dword ptr [edx],eax
 000AE923    mov         eax,[000B5984];^gvar_000B6B84
 000AE928    mov         eax,dword ptr [eax]
 000AE92A    xor         ecx,ecx
 000AE92C    xor         edx,edx
 000AE92E    call        000998B0
 000AE933    call        000981C4
 000AE938    mov         edx,dword ptr ds:[0B5BA0];^gvar_000B6BAC:Single
 000AE93E    cmp         eax,dword ptr [edx]
>000AE940    jle         000AE969
 000AE942    mov         eax,[000B5BA0];^gvar_000B6BAC:Single
 000AE947    mov         eax,dword ptr [eax]
 000AE949    mov         edx,dword ptr ds:[0B5984];^gvar_000B6B84
 000AE94F    sub         eax,dword ptr [edx]
 000AE951    mov         edx,dword ptr ds:[0B5708];^gvar_000B6B80:Integer
 000AE957    mov         edx,dword ptr [edx]
 000AE959    mov         ecx,dword ptr ds:[0B5868];^gvar_000B6B64:Longint
 000AE95F    imul        edx,dword ptr [ecx]
 000AE962    sub         eax,edx
 000AE964    call        0009870C
 000AE969    call        000983B8
 000AE96E    ret
*}
end;

//000AE970
procedure sub_000AE970;
begin
{*
 000AE970    mov         eax,[000B5868];^gvar_000B6B64:Longint
 000AE975    mov         eax,dword ptr [eax]
 000AE977    mov         edx,dword ptr ds:[0B5984];^gvar_000B6B84
 000AE97D    sub         dword ptr [edx],eax
 000AE97F    mov         eax,[000B5984];^gvar_000B6B84
 000AE984    mov         eax,dword ptr [eax]
 000AE986    xor         ecx,ecx
 000AE988    xor         edx,edx
 000AE98A    call        000998B0
 000AE98F    call        000983B8
 000AE994    ret
*}
end;

//000AE998
procedure TFormMain.CMStrGridTextKeyDown(Sender:TObject; var Key:Word; Shift:TShiftState);
begin
{*
 000AE998    push        ebp
 000AE999    mov         ebp,esp
 000AE99B    add         esp,0FFFFFFF0
 000AE99E    push        ebx
 000AE99F    push        esi
 000AE9A0    push        edi
 000AE9A1    xor         ebx,ebx
 000AE9A3    mov         dword ptr [ebp-10],ebx
 000AE9A6    mov         ebx,ecx
 000AE9A8    mov         edi,edx
 000AE9AA    mov         esi,eax
 000AE9AC    xor         eax,eax
 000AE9AE    push        ebp
 000AE9AF    push        0AEE96
 000AE9B4    push        dword ptr fs:[eax]
 000AE9B7    mov         dword ptr fs:[eax],esp
 000AE9BA    mov         eax,[000B5BEC];^gvar_000B6BB4
 000AE9BF    cmp         byte ptr [eax],0
>000AE9C2    je          000AEA62
 000AE9C8    mov         eax,[000B5BA0];^gvar_000B6BAC:Single
 000AE9CD    cmp         dword ptr [eax],0
>000AE9D0    jne         000AEA62
 000AE9D6    mov         eax,dword ptr [esi+314];TFormMain.CMStrGridHex:TCMStrGrid
 000AE9DC    cmp         edi,eax
>000AE9DE    jne         000AEA31
 000AE9E0    cmp         word ptr [ebx],1B
>000AE9E4    jne         000AEA31
 000AE9E6    mov         dword ptr [ebp-0C],eax
 000AE9E9    lea         eax,[ebp-10]
 000AE9EC    push        eax
 000AE9ED    mov         eax,dword ptr [ebp-0C]
 000AE9F0    mov         ecx,dword ptr [eax+20C];TCMStrGrid.FCurrent:Longint
 000AE9F6    mov         eax,dword ptr [ebp-0C]
 000AE9F9    mov         edx,dword ptr [eax+208];TCMStrGrid.FCurrent:TGridCoord
 000AE9FF    mov         eax,dword ptr [ebp-0C]
 000AEA02    call        TStringGrid.GetCells
 000AEA07    mov         eax,dword ptr [ebp-10]
 000AEA0A    call        @LStrLen
 000AEA0F    dec         eax
>000AEA10    jne         000AEA31
 000AEA12    push        0AEEB0;' '
 000AEA17    mov         eax,dword ptr [ebp-0C]
 000AEA1A    mov         ecx,dword ptr [eax+20C];TCMStrGrid.FCurrent:Longint
 000AEA20    mov         eax,dword ptr [ebp-0C]
 000AEA23    mov         edx,dword ptr [eax+208];TCMStrGrid.FCurrent:TGridCoord
 000AEA29    mov         eax,dword ptr [ebp-0C]
 000AEA2C    call        TStringGrid.SetCells
 000AEA31    cmp         word ptr [ebx],9
>000AEA35    jne         000AEA4A
 000AEA37    mov         edx,edi
 000AEA39    mov         eax,esi
 000AEA3B    call        TFormMain.ModusText1Click
 000AEA40    mov         word ptr [ebx],0
>000AEA45    jmp         000AEE80
 000AEA4A    cmp         word ptr [ebx],2D
>000AEA4E    jne         000AEE80
 000AEA54    mov         edx,edi
 000AEA56    mov         eax,esi
 000AEA58    call        TFormMain.ModusOverwrite1Click
>000AEA5D    jmp         000AEE80
 000AEA62    test        byte ptr [ebp+8],1
>000AEA66    je          000AEAD6
 000AEA68    mov         eax,[000B5678];^gvar_000B6BC4
 000AEA6D    cmp         byte ptr [eax],0
>000AEA70    jne         000AEAD6
 000AEA72    mov         ax,word ptr [ebx]
 000AEA75    sub         ax,10
>000AEA79    je          000AEA84
 000AEA7B    add         eax,0FFFFFFEF
 000AEA7E    sub         ax,8
>000AEA82    jae         000AEAD6
 000AEA84    mov         ax,word ptr [ebx]
 000AEA87    sub         ax,21
>000AEA8B    je          000AEA9A
 000AEA8D    add         eax,0FFFFFFFD
 000AEA90    sub         ax,3
>000AEA94    jb          000AEA9A
 000AEA96    xor         eax,eax
>000AEA98    jmp         000AEA9C
 000AEA9A    mov         al,1
 000AEA9C    mov         dx,word ptr [ebx]
 000AEA9F    add         edx,0FFFFFFDE
 000AEAA2    sub         dx,2
>000AEAA6    jb          000AEAB5
 000AEAA8    add         edx,0FFFFFFFD
 000AEAAB    sub         dx,2
>000AEAAF    jb          000AEAB5
 000AEAB1    xor         edx,edx
>000AEAB3    jmp         000AEAB7
 000AEAB5    mov         dl,1
 000AEAB7    or          al,dl
>000AEAB9    je          000AEAC4
 000AEABB    mov         al,1
 000AEABD    call        00099ADC
>000AEAC2    jmp         000AEAD6
 000AEAC4    call        00099AA8
 000AEAC9    test        al,al
>000AEACB    je          000AEAD6
 000AEACD    mov         edx,edi
 000AEACF    mov         eax,esi
 000AEAD1    call        TFormMain.Blockunmark1Click
 000AEAD6    cmp         word ptr [ebx],2D
>000AEADA    jne         000AEAEA
 000AEADC    mov         edx,edi
 000AEADE    mov         eax,esi
 000AEAE0    call        TFormMain.ModusOverwrite1Click
>000AEAE5    jmp         000AEE78
 000AEAEA    cmp         word ptr [ebx],9
>000AEAEE    jne         000AEB03
 000AEAF0    mov         edx,edi
 000AEAF2    mov         eax,esi
 000AEAF4    call        TFormMain.ModusText1Click
 000AEAF9    mov         word ptr [ebx],0
>000AEAFE    jmp         000AEE78
 000AEB03    cmp         word ptr [ebx],28
>000AEB07    jne         000AEB38
 000AEB09    mov         eax,[000B5708];^gvar_000B6B80:Integer
 000AEB0E    mov         eax,dword ptr [eax]
 000AEB10    mov         edx,dword ptr ds:[0B578C];^gvar_000B6B68:Longint
 000AEB16    mov         edx,dword ptr [edx]
 000AEB18    dec         edx
 000AEB19    cmp         eax,edx
>000AEB1B    jne         000AEB38
 000AEB1D    mov         eax,[000B5720];^gvar_000B6B88
 000AEB22    mov         eax,dword ptr [eax]
 000AEB24    mov         edx,dword ptr ds:[0B5BA0];^gvar_000B6BAC:Single
 000AEB2A    cmp         eax,dword ptr [edx]
>000AEB2C    jge         000AEB38
 000AEB2E    call        000AE914
>000AEB33    jmp         000AEE78
 000AEB38    cmp         word ptr [ebx],28
>000AEB3C    jne         000AEB94
 000AEB3E    mov         eax,[000B5720];^gvar_000B6B88
 000AEB43    mov         eax,dword ptr [eax]
 000AEB45    mov         edx,dword ptr ds:[0B5BA0];^gvar_000B6BAC:Single
 000AEB4B    cmp         eax,dword ptr [edx]
>000AEB4D    jne         000AEB94
 000AEB4F    lea         ecx,[ebp-8]
 000AEB52    lea         edx,[ebp-4]
 000AEB55    mov         eax,[000B5720];^gvar_000B6B88
 000AEB5A    mov         eax,dword ptr [eax]
 000AEB5C    call        00099A4C
 000AEB61    mov         eax,[000B5708];^gvar_000B6B80:Integer
 000AEB66    mov         eax,dword ptr [eax]
 000AEB68    mov         edx,dword ptr [ebp-8]
 000AEB6B    dec         edx
 000AEB6C    cmp         eax,edx
>000AEB6E    jne         000AEE78
 000AEB74    mov         eax,[000B5774];^gvar_000B6B7C
 000AEB79    mov         eax,dword ptr [eax]
 000AEB7B    cmp         eax,dword ptr [ebp-4]
>000AEB7E    jle         000AEE78
 000AEB84    mov         edx,dword ptr [ebp-8]
 000AEB87    mov         eax,dword ptr [ebp-4]
 000AEB8A    call        00098750
>000AEB8F    jmp         000AEE78
 000AEB94    cmp         word ptr [ebx],26
>000AEB98    jne         000AEBC1
 000AEB9A    mov         eax,[000B5708];^gvar_000B6B80:Integer
 000AEB9F    cmp         dword ptr [eax],0
>000AEBA2    jne         000AEBC1
 000AEBA4    mov         eax,[000B5984];^gvar_000B6B84
 000AEBA9    mov         eax,dword ptr [eax]
 000AEBAB    mov         edx,dword ptr ds:[0B5868];^gvar_000B6B64:Longint
 000AEBB1    sub         eax,dword ptr [edx]
 000AEBB3    test        eax,eax
>000AEBB5    jle         000AEBC1
 000AEBB7    call        000AE970
>000AEBBC    jmp         000AEE78
 000AEBC1    cmp         word ptr [ebx],27
>000AEBC5    jne         000AEC16
 000AEBC7    mov         eax,[000B5708];^gvar_000B6B80:Integer
 000AEBCC    mov         eax,dword ptr [eax]
 000AEBCE    mov         edx,dword ptr ds:[0B578C];^gvar_000B6B68:Longint
 000AEBD4    mov         edx,dword ptr [edx]
 000AEBD6    dec         edx
 000AEBD7    cmp         eax,edx
>000AEBD9    jne         000AEC16
 000AEBDB    mov         eax,[000B5774];^gvar_000B6B7C
 000AEBE0    mov         eax,dword ptr [eax]
 000AEBE2    mov         edx,dword ptr ds:[0B5868];^gvar_000B6B64:Longint
 000AEBE8    mov         edx,dword ptr [edx]
 000AEBEA    dec         edx
 000AEBEB    cmp         eax,edx
>000AEBED    jne         000AEC16
 000AEBEF    mov         eax,[000B5720];^gvar_000B6B88
 000AEBF4    mov         eax,dword ptr [eax]
 000AEBF6    mov         edx,dword ptr ds:[0B5BA0];^gvar_000B6BAC:Single
 000AEBFC    cmp         eax,dword ptr [edx]
>000AEBFE    jge         000AEC16
 000AEC00    mov         word ptr [ebx],0
 000AEC05    call        000AE914
 000AEC0A    xor         eax,eax
 000AEC0C    call        0009870C
>000AEC11    jmp         000AEE78
 000AEC16    cmp         word ptr [ebx],27
>000AEC1A    jne         000AEC46
 000AEC1C    mov         eax,[000B5720];^gvar_000B6B88
 000AEC21    mov         eax,dword ptr [eax]
 000AEC23    mov         edx,dword ptr ds:[0B5BA0];^gvar_000B6BAC:Single
 000AEC29    cmp         eax,dword ptr [edx]
>000AEC2B    jne         000AEC46
 000AEC2D    call        000981C4
 000AEC32    mov         edx,dword ptr ds:[0B5BA0];^gvar_000B6BAC:Single
 000AEC38    cmp         eax,dword ptr [edx]
>000AEC3A    jne         000AEC46
 000AEC3C    mov         word ptr [ebx],0
>000AEC41    jmp         000AEE78
 000AEC46    cmp         word ptr [ebx],25
>000AEC4A    jne         000AEC8F
 000AEC4C    mov         eax,[000B5708];^gvar_000B6B80:Integer
 000AEC51    cmp         dword ptr [eax],0
>000AEC54    jne         000AEC8F
 000AEC56    mov         eax,[000B5774];^gvar_000B6B7C
 000AEC5B    cmp         dword ptr [eax],0
>000AEC5E    jne         000AEC8F
 000AEC60    mov         eax,[000B5984];^gvar_000B6B84
 000AEC65    mov         eax,dword ptr [eax]
 000AEC67    mov         edx,dword ptr ds:[0B5868];^gvar_000B6B64:Longint
 000AEC6D    sub         eax,dword ptr [edx]
 000AEC6F    test        eax,eax
>000AEC71    jle         000AEC8F
 000AEC73    mov         word ptr [ebx],0
 000AEC78    call        000AE970
 000AEC7D    mov         eax,[000B5868];^gvar_000B6B64:Longint
 000AEC82    mov         eax,dword ptr [eax]
 000AEC84    dec         eax
 000AEC85    call        0009870C
>000AEC8A    jmp         000AEE78
 000AEC8F    cmp         word ptr [ebx],22
>000AEC93    jne         000AECBB
 000AEC95    test        byte ptr [ebp+8],4
>000AEC99    je          000AECBB
 000AEC9B    mov         eax,[000B5720];^gvar_000B6B88
 000AECA0    mov         eax,dword ptr [eax]
 000AECA2    mov         edx,dword ptr ds:[0B5BA0];^gvar_000B6BAC:Single
 000AECA8    cmp         eax,dword ptr [edx]
>000AECAA    jg          000AECBB
 000AECAC    mov         word ptr [ebx],0
 000AECB1    call        00099A28
>000AECB6    jmp         000AEE78
 000AECBB    cmp         word ptr [ebx],21
>000AECBF    jne         000AECE0
 000AECC1    test        byte ptr [ebp+8],4
>000AECC5    je          000AECE0
 000AECC7    mov         eax,[000B5984];^gvar_000B6B84
 000AECCC    cmp         dword ptr [eax],1
>000AECCF    jl          000AECE0
 000AECD1    mov         word ptr [ebx],0
 000AECD6    call        00099A04
>000AECDB    jmp         000AEE78
 000AECE0    cmp         word ptr [ebx],22
>000AECE4    jne         000AED4B
 000AECE6    mov         eax,[000B5720];^gvar_000B6B88
 000AECEB    mov         eax,dword ptr [eax]
 000AECED    mov         edx,dword ptr ds:[0B5BA0];^gvar_000B6BAC:Single
 000AECF3    cmp         eax,dword ptr [edx]
>000AECF5    jge         000AED4B
 000AECF7    mov         word ptr [ebx],0
 000AECFC    mov         eax,[000B5720];^gvar_000B6B88
 000AED01    mov         eax,dword ptr [eax]
 000AED03    mov         edx,dword ptr ds:[0B5868];^gvar_000B6B64:Longint
 000AED09    sub         eax,dword ptr [edx]
 000AED0B    inc         eax
 000AED0C    xor         ecx,ecx
 000AED0E    xor         edx,edx
 000AED10    call        000998B0
 000AED15    call        000981C4
 000AED1A    mov         edx,dword ptr ds:[0B5BA0];^gvar_000B6BAC:Single
 000AED20    cmp         eax,dword ptr [edx]
>000AED22    jle         000AED41
 000AED24    lea         ecx,[ebp-8]
 000AED27    lea         edx,[ebp-4]
 000AED2A    mov         eax,[000B5720];^gvar_000B6B88
 000AED2F    mov         eax,dword ptr [eax]
 000AED31    call        00099A4C
 000AED36    mov         edx,dword ptr [ebp-8]
 000AED39    mov         eax,dword ptr [ebp-4]
 000AED3C    call        00098750
 000AED41    call        000983B8
>000AED46    jmp         000AEE78
 000AED4B    cmp         word ptr [ebx],21
>000AED4F    jne         000AED8A
 000AED51    mov         eax,[000B5984];^gvar_000B6B84
 000AED56    cmp         dword ptr [eax],1
>000AED59    jle         000AED8A
 000AED5B    mov         word ptr [ebx],0
 000AED60    mov         eax,[000B5984];^gvar_000B6B84
 000AED65    mov         eax,dword ptr [eax]
 000AED67    mov         edx,dword ptr ds:[0B59E0];^gvar_000B6BB0:Integer
 000AED6D    sub         eax,dword ptr [edx]
 000AED6F    mov         edx,dword ptr ds:[0B5868];^gvar_000B6B64:Longint
 000AED75    add         eax,dword ptr [edx]
 000AED77    xor         ecx,ecx
 000AED79    xor         edx,edx
 000AED7B    call        000998B0
 000AED80    call        000983B8
>000AED85    jmp         000AEE78
 000AED8A    cmp         word ptr [ebx],23
>000AED8E    jne         000AEDE6
 000AED90    mov         eax,[000B5720];^gvar_000B6B88
 000AED95    mov         eax,dword ptr [eax]
 000AED97    mov         edx,dword ptr ds:[0B5BA0];^gvar_000B6BAC:Single
 000AED9D    cmp         eax,dword ptr [edx]
>000AED9F    jne         000AEDE6
 000AEDA1    lea         ecx,[ebp-8]
 000AEDA4    lea         edx,[ebp-4]
 000AEDA7    mov         eax,[000B5720];^gvar_000B6B88
 000AEDAC    mov         eax,dword ptr [eax]
 000AEDAE    call        00099A4C
 000AEDB3    test        byte ptr [ebp+8],4
>000AEDB7    je          000AEDC9
 000AEDB9    mov         edx,dword ptr [ebp-8]
 000AEDBC    mov         eax,dword ptr [ebp-4]
 000AEDBF    call        00098750
>000AEDC4    jmp         000AEE78
 000AEDC9    mov         eax,[000B5708];^gvar_000B6B80:Integer
 000AEDCE    mov         eax,dword ptr [eax]
 000AEDD0    cmp         eax,dword ptr [ebp-8]
>000AEDD3    jne         000AEE78
 000AEDD9    mov         eax,dword ptr [ebp-4]
 000AEDDC    call        0009870C
>000AEDE1    jmp         000AEE78
 000AEDE6    cmp         edi,dword ptr [esi+314];TFormMain.CMStrGridHex:TCMStrGrid
>000AEDEC    jne         000AEE4F
 000AEDEE    cmp         word ptr [ebx],1B
>000AEDF2    jne         000AEE4F
 000AEDF4    mov         ebx,dword ptr [esi+314];TFormMain.CMStrGridHex:TCMStrGrid
 000AEDFA    lea         eax,[ebp-10]
 000AEDFD    push        eax
 000AEDFE    mov         ecx,dword ptr [ebx+20C];TCMStrGrid.FCurrent:Longint
 000AEE04    mov         edx,dword ptr [ebx+208];TCMStrGrid.FCurrent:TGridCoord
 000AEE0A    mov         eax,dword ptr [esi+314];TFormMain.CMStrGridHex:TCMStrGrid
 000AEE10    call        TStringGrid.GetCells
 000AEE15    mov         eax,dword ptr [ebp-10]
 000AEE18    call        @LStrLen
 000AEE1D    dec         eax
>000AEE1E    jne         000AEE78
 000AEE20    call        000981C4
 000AEE25    call        000981AC
 000AEE2A    lea         edx,[ebp-10]
 000AEE2D    call        00074C9C
 000AEE32    mov         eax,dword ptr [ebp-10]
 000AEE35    push        eax
 000AEE36    mov         ecx,dword ptr [ebx+20C];TCMStrGrid.FCurrent:Longint
 000AEE3C    mov         edx,dword ptr [ebx+208];TCMStrGrid.FCurrent:TGridCoord
 000AEE42    mov         eax,dword ptr [esi+314];TFormMain.CMStrGridHex:TCMStrGrid
 000AEE48    call        TStringGrid.SetCells
>000AEE4D    jmp         000AEE78
 000AEE4F    cmp         word ptr [ebx],2E
>000AEE53    jne         000AEE5C
 000AEE55    call        0009A194
>000AEE5A    jmp         000AEE78
 000AEE5C    cmp         word ptr [ebx],8
>000AEE60    jne         000AEE78
 000AEE62    call        000981C4
 000AEE67    dec         eax
>000AEE68    jle         000AEE78
 000AEE6A    mov         ax,25
 000AEE6E    call        000987A4
 000AEE73    call        0009A194
 000AEE78    mov         eax,[000B5678];^gvar_000B6BC4
 000AEE7D    mov         byte ptr [eax],0
 000AEE80    xor         eax,eax
 000AEE82    pop         edx
 000AEE83    pop         ecx
 000AEE84    pop         ecx
 000AEE85    mov         dword ptr fs:[eax],edx
 000AEE88    push        0AEE9D
 000AEE8D    lea         eax,[ebp-10]
 000AEE90    call        @LStrClr
 000AEE95    ret
>000AEE96    jmp         @HandleFinally
>000AEE9B    jmp         000AEE8D
 000AEE9D    pop         edi
 000AEE9E    pop         esi
 000AEE9F    pop         ebx
 000AEEA0    mov         esp,ebp
 000AEEA2    pop         ebp
 000AEEA3    ret         4
*}
end;

//000AEEB4
procedure TFormMain.CMStrGridTextKeyUp(Sender:TObject; var Key:Word; Shift:TShiftState);
begin
{*
 000AEEB4    push        ebp
 000AEEB5    mov         ebp,esp
 000AEEB7    mov         eax,[000B5BA0];^gvar_000B6BAC:Single
 000AEEBC    cmp         dword ptr [eax],0
>000AEEBF    je          000AEEF5
 000AEEC1    test        byte ptr [ebp+8],1
>000AEEC5    je          000AEEF5
 000AEEC7    mov         ax,word ptr [ecx]
 000AEECA    add         eax,0FFFFFFDF
 000AEECD    sub         ax,8
>000AEED1    jae         000AEEF5
 000AEED3    mov         ax,word ptr [ecx]
 000AEED6    add         eax,0FFFFFFDE
 000AEED9    sub         ax,2
>000AEEDD    jb          000AEEEC
 000AEEDF    add         eax,0FFFFFFFD
 000AEEE2    sub         ax,2
>000AEEE6    jb          000AEEEC
 000AEEE8    xor         edx,edx
>000AEEEA    jmp         000AEEEE
 000AEEEC    mov         dl,1
 000AEEEE    mov         al,1
 000AEEF0    call        00099ADC
 000AEEF5    pop         ebp
 000AEEF6    ret         4
*}
end;

//000AEEFC
procedure TFormMain.CMStrGridTextKeyPress(Sender:TObject; var Key:Char);
begin
{*
 000AEEFC    push        ebp
 000AEEFD    mov         ebp,esp
 000AEEFF    push        0
 000AEF01    push        0
 000AEF03    push        ebx
 000AEF04    push        esi
 000AEF05    push        edi
 000AEF06    mov         esi,ecx
 000AEF08    mov         ebx,eax
 000AEF0A    xor         eax,eax
 000AEF0C    push        ebp
 000AEF0D    push        0AF00F
 000AEF12    push        dword ptr fs:[eax]
 000AEF15    mov         dword ptr fs:[eax],esp
 000AEF18    mov         eax,[000B5BEC];^gvar_000B6BB4
 000AEF1D    cmp         byte ptr [eax],0
>000AEF20    je          000AEFF4
 000AEF26    cmp         edx,dword ptr [ebx+310];TFormMain.CMStrGridText:TCMStrGrid
>000AEF2C    jne         000AEF41
 000AEF2E    cmp         byte ptr [esi],20
>000AEF31    jb          000AEF41
 000AEF33    mov         dl,byte ptr [esi]
 000AEF35    mov         eax,ebx
 000AEF37    call        000AE7EC
>000AEF3C    jmp         000AEFF4
 000AEF41    mov         edi,dword ptr [ebx+314];TFormMain.CMStrGridHex:TCMStrGrid
 000AEF47    cmp         edx,edi
>000AEF49    jne         000AEFF4
 000AEF4F    mov         al,byte ptr [esi]
 000AEF51    add         al,0D0
 000AEF53    sub         al,0A
>000AEF55    jb          000AEF67
 000AEF57    add         al,0F9
 000AEF59    sub         al,6
>000AEF5B    jb          000AEF67
 000AEF5D    add         al,0E6
 000AEF5F    sub         al,6
>000AEF61    jae         000AEFF4
 000AEF67    mov         al,byte ptr [esi]
 000AEF69    call        UpCase
 000AEF6E    mov         byte ptr [esi],al
 000AEF70    lea         eax,[ebp-4]
 000AEF73    push        eax
 000AEF74    mov         ecx,dword ptr [edi+20C];TCMStrGrid.FCurrent:Longint
 000AEF7A    mov         edx,dword ptr [edi+208];TCMStrGrid.FCurrent:TGridCoord
 000AEF80    mov         eax,edi
 000AEF82    call        TStringGrid.GetCells
 000AEF87    mov         eax,dword ptr [ebp-4]
 000AEF8A    call        @LStrLen
 000AEF8F    dec         eax
>000AEF90    jne         000AEFD3
 000AEF92    lea         eax,[ebp-4]
 000AEF95    push        eax
 000AEF96    mov         ecx,dword ptr [edi+20C];TCMStrGrid.FCurrent:Longint
 000AEF9C    mov         edx,dword ptr [edi+208];TCMStrGrid.FCurrent:TGridCoord
 000AEFA2    mov         eax,edi
 000AEFA4    call        TStringGrid.GetCells
 000AEFA9    lea         eax,[ebp-4]
 000AEFAC    push        eax
 000AEFAD    lea         eax,[ebp-8]
 000AEFB0    mov         dl,byte ptr [esi]
 000AEFB2    call        @LStrFromChar
 000AEFB7    mov         edx,dword ptr [ebp-8]
 000AEFBA    pop         eax
 000AEFBB    call        @LStrCat
 000AEFC0    mov         eax,dword ptr [ebp-4]
 000AEFC3    call        00074EA8
 000AEFC8    mov         edx,eax
 000AEFCA    mov         eax,ebx
 000AEFCC    call        000AE7EC
>000AEFD1    jmp         000AEFF4
 000AEFD3    lea         eax,[ebp-4]
 000AEFD6    mov         dl,byte ptr [esi]
 000AEFD8    call        @LStrFromChar
 000AEFDD    mov         eax,dword ptr [ebp-4]
 000AEFE0    push        eax
 000AEFE1    mov         ecx,dword ptr [edi+20C];TCMStrGrid.FCurrent:Longint
 000AEFE7    mov         edx,dword ptr [edi+208];TCMStrGrid.FCurrent:TGridCoord
 000AEFED    mov         eax,edi
 000AEFEF    call        TStringGrid.SetCells
 000AEFF4    xor         eax,eax
 000AEFF6    pop         edx
 000AEFF7    pop         ecx
 000AEFF8    pop         ecx
 000AEFF9    mov         dword ptr fs:[eax],edx
 000AEFFC    push        0AF016
 000AF001    lea         eax,[ebp-8]
 000AF004    mov         edx,2
 000AF009    call        @LStrArrayClr
 000AF00E    ret
>000AF00F    jmp         @HandleFinally
>000AF014    jmp         000AF001
 000AF016    pop         edi
 000AF017    pop         esi
 000AF018    pop         ebx
 000AF019    pop         ecx
 000AF01A    pop         ecx
 000AF01B    pop         ebp
 000AF01C    ret
*}
end;

//000AF020
{*procedure TFormMain.CMStrGridTextHexSelectCell(?:TCMStrGrid; ?:TMouseButton; ?:?; ?:?);
begin
 000AF020    push        ebp
 000AF021    mov         ebp,esp
 000AF023    add         esp,0FFFFFFF8
 000AF026    push        ebx
 000AF027    push        esi
 000AF028    push        edi
 000AF029    xor         ebx,ebx
 000AF02B    mov         dword ptr [ebp-8],ebx
 000AF02E    mov         ebx,ecx
 000AF030    mov         dword ptr [ebp-4],edx
 000AF033    mov         edi,eax
 000AF035    mov         esi,dword ptr [ebp+0C]
 000AF038    xor         eax,eax
 000AF03A    push        ebp
 000AF03B    push        0AF112
 000AF040    push        dword ptr fs:[eax]
 000AF043    mov         dword ptr fs:[eax],esp
 000AF046    mov         eax,[000B5984];^gvar_000B6B84
 000AF04B    mov         eax,dword ptr [eax]
 000AF04D    mov         edx,dword ptr ds:[0B5868];^gvar_000B6B64:Longint
 000AF053    mov         edx,dword ptr [edx]
 000AF055    imul        edx,esi
 000AF058    add         eax,edx
 000AF05A    add         eax,ebx
 000AF05C    test        ebx,ebx
>000AF05E    jl          000AF064
 000AF060    test        esi,esi
>000AF062    jge         000AF06F
 000AF064    mov         eax,dword ptr [ebp+8]
 000AF067    mov         byte ptr [eax],0
>000AF06A    jmp         000AF0FC
 000AF06F    mov         edx,dword ptr ds:[0B5BA0];^gvar_000B6BAC:Single
 000AF075    cmp         eax,dword ptr [edx]
>000AF077    jle         000AF081
 000AF079    mov         eax,dword ptr [ebp+8]
 000AF07C    mov         byte ptr [eax],0
>000AF07F    jmp         000AF0FC
 000AF081    mov         eax,dword ptr [edi+314];TFormMain.CMStrGridHex:TCMStrGrid
 000AF087    cmp         eax,dword ptr [ebp-4]
>000AF08A    jne         000AF0E9
 000AF08C    lea         eax,[ebp-8]
 000AF08F    push        eax
 000AF090    mov         ecx,dword ptr ds:[0B5708];^gvar_000B6B80:Integer
 000AF096    mov         ecx,dword ptr [ecx]
 000AF098    mov         edx,dword ptr ds:[0B5774];^gvar_000B6B7C
 000AF09E    mov         edx,dword ptr [edx]
 000AF0A0    mov         eax,dword ptr [edi+314];TFormMain.CMStrGridHex:TCMStrGrid
 000AF0A6    call        TStringGrid.GetCells
 000AF0AB    mov         eax,dword ptr [ebp-8]
 000AF0AE    call        @LStrLen
 000AF0B3    dec         eax
>000AF0B4    jne         000AF0E9
 000AF0B6    call        000981C4
 000AF0BB    call        000981AC
 000AF0C0    lea         edx,[ebp-8]
 000AF0C3    call        00074C9C
 000AF0C8    mov         eax,dword ptr [ebp-8]
 000AF0CB    push        eax
 000AF0CC    mov         ecx,dword ptr ds:[0B5708];^gvar_000B6B80:Integer
 000AF0D2    mov         ecx,dword ptr [ecx]
 000AF0D4    mov         edx,dword ptr ds:[0B5774];^gvar_000B6B7C
 000AF0DA    mov         edx,dword ptr [edx]
 000AF0DC    mov         eax,dword ptr [edi+314];TFormMain.CMStrGridHex:TCMStrGrid
 000AF0E2    call        TStringGrid.SetCells
>000AF0E7    jmp         000AF0FC
 000AF0E9    mov         eax,[000B5774];^gvar_000B6B7C
 000AF0EE    mov         dword ptr [eax],ebx
 000AF0F0    mov         eax,[000B5708];^gvar_000B6B80:Integer
 000AF0F5    mov         dword ptr [eax],esi
 000AF0F7    call        000983B8
 000AF0FC    xor         eax,eax
 000AF0FE    pop         edx
 000AF0FF    pop         ecx
 000AF100    pop         ecx
 000AF101    mov         dword ptr fs:[eax],edx
 000AF104    push        0AF119
 000AF109    lea         eax,[ebp-8]
 000AF10C    call        @LStrClr
 000AF111    ret
>000AF112    jmp         @HandleFinally
>000AF117    jmp         000AF109
 000AF119    pop         edi
 000AF11A    pop         esi
 000AF11B    pop         ebx
 000AF11C    pop         ecx
 000AF11D    pop         ecx
 000AF11E    pop         ebp
 000AF11F    ret         8
end;*}

//000AF124
{*procedure TFormMain.CMStrGridTextHexDrawCell(?:?; ?:?; ?:?);
begin
 000AF124    push        ebp
 000AF125    mov         ebp,esp
 000AF127    add         esp,0FFFFFFE8
 000AF12A    push        ebx
 000AF12B    push        esi
 000AF12C    push        edi
 000AF12D    xor         ebx,ebx
 000AF12F    mov         dword ptr [ebp-18],ebx
 000AF132    mov         esi,dword ptr [ebp+0C]
 000AF135    lea         edi,[ebp-14]
 000AF138    push        ecx
 000AF139    mov         ecx,4
 000AF13E    rep movs    dword ptr [edi],dword ptr [esi]
 000AF140    pop         ecx
 000AF141    mov         esi,ecx
 000AF143    mov         dword ptr [ebp-4],edx
 000AF146    xor         eax,eax
 000AF148    push        ebp
 000AF149    push        0AF1DF
 000AF14E    push        dword ptr fs:[eax]
 000AF151    mov         dword ptr fs:[eax],esp
 000AF154    mov         eax,[000B5984];^gvar_000B6B84
 000AF159    mov         eax,dword ptr [eax]
 000AF15B    mov         edx,dword ptr ds:[0B5868];^gvar_000B6B64:Longint
 000AF161    mov         edx,dword ptr [edx]
 000AF163    imul        edx,dword ptr [ebp+10]
 000AF167    add         eax,edx
 000AF169    add         eax,esi
 000AF16B    mov         edx,dword ptr ds:[0B586C];^gvar_000B6B8C:dword
 000AF171    cmp         eax,dword ptr [edx]
>000AF173    jl          000AF1C9
 000AF175    mov         edx,dword ptr ds:[0B5970];^gvar_000B6B90
 000AF17B    cmp         eax,dword ptr [edx]
>000AF17D    jg          000AF1C9
 000AF17F    mov         eax,[000B5BEC];^gvar_000B6BB4
 000AF184    cmp         byte ptr [eax],0
>000AF187    je          000AF1C9
 000AF189    mov         edi,dword ptr [ebp-4]
 000AF18C    mov         ebx,dword ptr [edi+1EC]
 000AF192    mov         edx,dword ptr ds:[0B5BC4];^gvar_000B6BA8:Longint
 000AF198    mov         edx,dword ptr [edx]
 000AF19A    mov         eax,dword ptr [ebx+0C]
 000AF19D    call        TFont.SetColor
 000AF1A2    lea         eax,[ebp-18]
 000AF1A5    push        eax
 000AF1A6    mov         ecx,dword ptr [ebp+10]
 000AF1A9    mov         edx,esi
 000AF1AB    mov         eax,edi
 000AF1AD    call        TStringGrid.GetCells
 000AF1B2    mov         eax,dword ptr [ebp-18]
 000AF1B5    push        eax
 000AF1B6    mov         ecx,dword ptr [ebp-10]
 000AF1B9    add         ecx,2
 000AF1BC    mov         edx,dword ptr [ebp-14]
 000AF1BF    add         edx,2
 000AF1C2    mov         eax,ebx
 000AF1C4    call        TCanvas.TextOut
 000AF1C9    xor         eax,eax
 000AF1CB    pop         edx
 000AF1CC    pop         ecx
 000AF1CD    pop         ecx
 000AF1CE    mov         dword ptr fs:[eax],edx
 000AF1D1    push        0AF1E6
 000AF1D6    lea         eax,[ebp-18]
 000AF1D9    call        @LStrClr
 000AF1DE    ret
>000AF1DF    jmp         @HandleFinally
>000AF1E4    jmp         000AF1D6
 000AF1E6    pop         edi
 000AF1E7    pop         esi
 000AF1E8    pop         ebx
 000AF1E9    mov         esp,ebp
 000AF1EB    pop         ebp
 000AF1EC    ret         0C
end;*}

//000AF1F0
procedure TFormMain.Save1Click(Sender:TObject);
begin
{*
 000AF1F0    push        ebp
 000AF1F1    mov         ebp,esp
 000AF1F3    push        0
 000AF1F5    push        ebx
 000AF1F6    push        esi
 000AF1F7    mov         esi,edx
 000AF1F9    mov         ebx,eax
 000AF1FB    xor         eax,eax
 000AF1FD    push        ebp
 000AF1FE    push        0AF2D0
 000AF203    push        dword ptr fs:[eax]
 000AF206    mov         dword ptr fs:[eax],esp
 000AF209    mov         eax,[000B5A10];^gvar_000B6BE4:AnsiString
 000AF20E    mov         eax,dword ptr [eax]
 000AF210    call        0009B9FC
 000AF215    test        al,al
>000AF217    je          000AF246
 000AF219    lea         edx,[ebp-4]
 000AF21C    mov         eax,857
 000AF221    call        LoadStr;'Accessing network, please wait (may take a minute)...'
 000AF226    mov         eax,dword ptr [ebp-4]
 000AF229    push        eax
 000AF22A    mov         eax,dword ptr [ebx+2C4];TFormMain.StatusBar1:TStatusBar
 000AF230    mov         eax,dword ptr [eax+1EC];TStatusBar.Panels:TStatusPanels
 000AF236    mov         edx,3
 000AF23B    call        TCoolBands.GetItem
 000AF240    pop         edx
 000AF241    call        TStatusPanel.SetText
 000AF246    mov         eax,[000B5BDC];^Screen:TScreen
 000AF24B    mov         eax,dword ptr [eax]
 000AF24D    mov         dx,0FFF5
 000AF251    call        TScreen.SetCursor
 000AF256    xor         eax,eax
 000AF258    push        ebp
 000AF259    push        0AF2B3
 000AF25E    push        dword ptr fs:[eax]
 000AF261    mov         dword ptr fs:[eax],esp
 000AF264    mov         eax,[000B5988];^gvar_000B6BE9
 000AF269    cmp         byte ptr [eax],0
>000AF26C    je          000AF279
 000AF26E    mov         edx,esi
 000AF270    mov         eax,ebx
 000AF272    call        TFormMain.SaveAs1Click
>000AF277    jmp         000AF297
 000AF279    mov         eax,[000B5790];^gvar_000B6B70:TCMDynArray
 000AF27E    mov         eax,dword ptr [eax]
 000AF280    mov         eax,dword ptr [eax+0C]
 000AF283    push        eax
 000AF284    mov         eax,[000B5B50];^gvar_000B6B78:AnsiString
 000AF289    mov         eax,dword ptr [eax]
 000AF28B    mov         ecx,1
 000AF290    xor         edx,edx
 000AF292    call        000991C8
 000AF297    xor         eax,eax
 000AF299    pop         edx
 000AF29A    pop         ecx
 000AF29B    pop         ecx
 000AF29C    mov         dword ptr fs:[eax],edx
 000AF29F    push        0AF2BA
 000AF2A4    mov         eax,[000B5BDC];^Screen:TScreen
 000AF2A9    mov         eax,dword ptr [eax]
 000AF2AB    xor         edx,edx
 000AF2AD    call        TScreen.SetCursor
 000AF2B2    ret
>000AF2B3    jmp         @HandleFinally
>000AF2B8    jmp         000AF2A4
 000AF2BA    xor         eax,eax
 000AF2BC    pop         edx
 000AF2BD    pop         ecx
 000AF2BE    pop         ecx
 000AF2BF    mov         dword ptr fs:[eax],edx
 000AF2C2    push        0AF2D7
 000AF2C7    lea         eax,[ebp-4]
 000AF2CA    call        @LStrClr
 000AF2CF    ret
>000AF2D0    jmp         @HandleFinally
>000AF2D5    jmp         000AF2C7
 000AF2D7    pop         esi
 000AF2D8    pop         ebx
 000AF2D9    pop         ecx
 000AF2DA    pop         ebp
 000AF2DB    ret
*}
end;

//000AF2DC
procedure TFormMain.SaveAs1Click(Sender:TObject);
begin
{*
 000AF2DC    push        ebp
 000AF2DD    mov         ebp,esp
 000AF2DF    push        0
 000AF2E1    push        ebx
 000AF2E2    mov         ebx,eax
 000AF2E4    xor         eax,eax
 000AF2E6    push        ebp
 000AF2E7    push        0AF38D
 000AF2EC    push        dword ptr fs:[eax]
 000AF2EF    mov         dword ptr fs:[eax],esp
 000AF2F2    mov         eax,[000B5A10];^gvar_000B6BE4:AnsiString
 000AF2F7    mov         eax,dword ptr [eax]
 000AF2F9    call        0009B9FC
 000AF2FE    test        al,al
>000AF300    je          000AF32F
 000AF302    lea         edx,[ebp-4]
 000AF305    mov         eax,857
 000AF30A    call        LoadStr;'Accessing network, please wait (may take a minute)...'
 000AF30F    mov         eax,dword ptr [ebp-4]
 000AF312    push        eax
 000AF313    mov         eax,dword ptr [ebx+2C4];TFormMain.StatusBar1:TStatusBar
 000AF319    mov         eax,dword ptr [eax+1EC];TStatusBar.Panels:TStatusPanels
 000AF31F    mov         edx,3
 000AF324    call        TCoolBands.GetItem
 000AF329    pop         edx
 000AF32A    call        TStatusPanel.SetText
 000AF32F    mov         eax,[000B5BDC];^Screen:TScreen
 000AF334    mov         eax,dword ptr [eax]
 000AF336    mov         dx,0FFF5
 000AF33A    call        TScreen.SetCursor
 000AF33F    xor         eax,eax
 000AF341    push        ebp
 000AF342    push        0AF370
 000AF347    push        dword ptr fs:[eax]
 000AF34A    mov         dword ptr fs:[eax],esp
 000AF34D    mov         eax,ebx
 000AF34F    call        000AD234
 000AF354    xor         eax,eax
 000AF356    pop         edx
 000AF357    pop         ecx
 000AF358    pop         ecx
 000AF359    mov         dword ptr fs:[eax],edx
 000AF35C    push        0AF377
 000AF361    mov         eax,[000B5BDC];^Screen:TScreen
 000AF366    mov         eax,dword ptr [eax]
 000AF368    xor         edx,edx
 000AF36A    call        TScreen.SetCursor
 000AF36F    ret
>000AF370    jmp         @HandleFinally
>000AF375    jmp         000AF361
 000AF377    xor         eax,eax
 000AF379    pop         edx
 000AF37A    pop         ecx
 000AF37B    pop         ecx
 000AF37C    mov         dword ptr fs:[eax],edx
 000AF37F    push        0AF394
 000AF384    lea         eax,[ebp-4]
 000AF387    call        @LStrClr
 000AF38C    ret
>000AF38D    jmp         @HandleFinally
>000AF392    jmp         000AF384
 000AF394    pop         ebx
 000AF395    pop         ecx
 000AF396    pop         ebp
 000AF397    ret
*}
end;

//000AF398
procedure TFormMain.Close1Click(Sender:TObject);
begin
{*
 000AF398    push        ebp
 000AF399    mov         ebp,esp
 000AF39B    add         esp,0FFFFFFEC
 000AF39E    push        ebx
 000AF39F    push        esi
 000AF3A0    push        edi
 000AF3A1    xor         ecx,ecx
 000AF3A3    mov         dword ptr [ebp-14],ecx
 000AF3A6    mov         edi,eax
 000AF3A8    xor         eax,eax
 000AF3AA    push        ebp
 000AF3AB    push        0AF4B8
 000AF3B0    push        dword ptr fs:[eax]
 000AF3B3    mov         dword ptr fs:[eax],esp
 000AF3B6    lea         edx,[ebp-1]
 000AF3B9    mov         eax,edi
 000AF3BB    call        000AD130
 000AF3C0    test        al,al
>000AF3C2    je          000AF4A2
 000AF3C8    mov         edx,0AF4D0;'XVI32'
 000AF3CD    mov         eax,edi
 000AF3CF    call        TControl.SetText
 000AF3D4    lea         edx,[ebp-14]
 000AF3D7    mov         eax,edi
 000AF3D9    call        TControl.GetText
 000AF3DE    mov         edx,dword ptr [ebp-14]
 000AF3E1    mov         eax,[000B59E8];^Application:TApplication
 000AF3E6    mov         eax,dword ptr [eax]
 000AF3E8    call        TApplication.SetTitle
 000AF3ED    mov         eax,edi
 000AF3EF    call        000ADCB0
 000AF3F4    mov         eax,[000B5BEC];^gvar_000B6BB4
 000AF3F9    mov         byte ptr [eax],0
 000AF3FC    mov         eax,[000B5BA0];^gvar_000B6BAC:Single
 000AF401    xor         edx,edx
 000AF403    mov         dword ptr [eax],edx
 000AF405    mov         eax,dword ptr [edi+310];TFormMain.CMStrGridText:TCMStrGrid
 000AF40B    mov         dword ptr [ebp-8],eax
 000AF40E    mov         eax,dword ptr [ebp-8]
 000AF411    mov         ebx,dword ptr [eax+22C];TCMStrGrid.FRowCount:Longint
 000AF417    dec         ebx
 000AF418    test        ebx,ebx
>000AF41A    jl          000AF432
 000AF41C    inc         ebx
 000AF41D    xor         esi,esi
 000AF41F    mov         edx,esi
 000AF421    mov         eax,dword ptr [ebp-8]
 000AF424    call        TStringGrid.GetRows
 000AF429    mov         edx,dword ptr [eax]
 000AF42B    call        dword ptr [edx+40];TStrings.Clear
 000AF42E    inc         esi
 000AF42F    dec         ebx
>000AF430    jne         000AF41F
 000AF432    mov         eax,dword ptr [edi+314];TFormMain.CMStrGridHex:TCMStrGrid
 000AF438    mov         dword ptr [ebp-0C],eax
 000AF43B    mov         eax,dword ptr [ebp-0C]
 000AF43E    mov         ebx,dword ptr [eax+22C];TCMStrGrid.FRowCount:Longint
 000AF444    dec         ebx
 000AF445    test        ebx,ebx
>000AF447    jl          000AF45F
 000AF449    inc         ebx
 000AF44A    xor         esi,esi
 000AF44C    mov         edx,esi
 000AF44E    mov         eax,dword ptr [ebp-0C]
 000AF451    call        TStringGrid.GetRows
 000AF456    mov         edx,dword ptr [eax]
 000AF458    call        dword ptr [edx+40];TStrings.Clear
 000AF45B    inc         esi
 000AF45C    dec         ebx
>000AF45D    jne         000AF44C
 000AF45F    mov         eax,dword ptr [edi+420];TFormMain.CMStrGridAddr:TCMStrGrid
 000AF465    mov         dword ptr [ebp-10],eax
 000AF468    mov         eax,dword ptr [ebp-10]
 000AF46B    mov         ebx,dword ptr [eax+22C];TCMStrGrid.FRowCount:Longint
 000AF471    dec         ebx
 000AF472    test        ebx,ebx
>000AF474    jl          000AF48C
 000AF476    inc         ebx
 000AF477    xor         esi,esi
 000AF479    mov         edx,esi
 000AF47B    mov         eax,dword ptr [ebp-10]
 000AF47E    call        TStringGrid.GetRows
 000AF483    mov         edx,dword ptr [eax]
 000AF485    call        dword ptr [edx+40];TStrings.Clear
 000AF488    inc         esi
 000AF489    dec         ebx
>000AF48A    jne         000AF479
 000AF48C    xor         edx,edx
 000AF48E    xor         eax,eax
 000AF490    call        00098750
 000AF495    mov         eax,dword ptr [edi+4C8];TFormMain.?f4C8:TCMScrollBar
 000AF49B    xor         edx,edx
 000AF49D    mov         ecx,dword ptr [eax]
 000AF49F    call        dword ptr [ecx+60];TControl.SetEnabled
 000AF4A2    xor         eax,eax
 000AF4A4    pop         edx
 000AF4A5    pop         ecx
 000AF4A6    pop         ecx
 000AF4A7    mov         dword ptr fs:[eax],edx
 000AF4AA    push        0AF4BF
 000AF4AF    lea         eax,[ebp-14]
 000AF4B2    call        @LStrClr
 000AF4B7    ret
>000AF4B8    jmp         @HandleFinally
>000AF4BD    jmp         000AF4AF
 000AF4BF    pop         edi
 000AF4C0    pop         esi
 000AF4C1    pop         ebx
 000AF4C2    mov         esp,ebp
 000AF4C4    pop         ebp
 000AF4C5    ret
*}
end;

//000AF4D8
procedure TFormMain.Blockunmark1Click(Sender:TObject);
begin
{*
 000AF4D8    mov         al,1
 000AF4DA    call        00099D98
 000AF4DF    ret
*}
end;

//000AF4E0
procedure TFormMain.Blockmark1Click(Sender:TObject);
begin
{*
 000AF4E0    mov         eax,[000B5BEC];^gvar_000B6BB4
 000AF4E5    cmp         byte ptr [eax],0
>000AF4E8    je          000AF4FD
 000AF4EA    mov         eax,[000B5BA0];^gvar_000B6BAC:Single
 000AF4EF    cmp         dword ptr [eax],0
>000AF4F2    jle         000AF4FD
 000AF4F4    mov         dl,1
 000AF4F6    xor         eax,eax
 000AF4F8    call        00099ADC
 000AF4FD    ret
*}
end;

//000AF500
procedure TFormMain.Deletefromcursor1Click(Sender:TObject);
begin
{*
 000AF500    call        0009A2C0
 000AF505    ret
*}
end;

//000AF508
procedure TFormMain.Deletetocursor1Click(Sender:TObject);
begin
{*
 000AF508    call        0009A348
 000AF50D    ret
*}
end;

//000AF510
procedure TFormMain.Blockdelete1Click(Sender:TObject);
begin
{*
 000AF510    call        00099EE8
 000AF515    ret
*}
end;

//000AF518
procedure TFormMain.Blocknchars1Click(Sender:TObject);
begin
{*
 000AF518    push        ebp
 000AF519    mov         ebp,esp
 000AF51B    add         esp,0FFFFFFD0
 000AF51E    push        ebx
 000AF51F    mov         ebx,eax
 000AF521    mov         ecx,ebx
 000AF523    mov         dl,1
 000AF525    mov         eax,[0009D100];TFormBlockN
 000AF52A    call        TCustomForm.Create;TFormBlockN.Create
 000AF52F    mov         edx,dword ptr ds:[0B58B0];^gvar_000B7024:TFormBlockN
 000AF535    mov         dword ptr [edx],eax
 000AF537    xor         eax,eax
 000AF539    push        ebp
 000AF53A    push        0AF652
 000AF53F    push        dword ptr fs:[eax]
 000AF542    mov         dword ptr fs:[eax],esp
 000AF545    mov         eax,[000B58B0];^gvar_000B7024:TFormBlockN
 000AF54A    mov         eax,dword ptr [eax]
 000AF54C    mov         edx,dword ptr [eax]
 000AF54E    call        dword ptr [edx+0CC]
 000AF554    dec         eax
>000AF555    jne         000AF638
 000AF55B    call        000981C4
 000AF560    mov         edx,dword ptr ds:[0B586C];^gvar_000B6B8C:dword
 000AF566    mov         dword ptr [edx],eax
 000AF568    mov         eax,[000B586C];^gvar_000B6B8C:dword
 000AF56D    mov         eax,dword ptr [eax]
 000AF56F    mov         edx,dword ptr ds:[0B58B0];^gvar_000B7024:TFormBlockN
 000AF575    mov         edx,dword ptr [edx]
 000AF577    add         eax,dword ptr [edx+2E4]
 000AF57D    dec         eax
 000AF57E    mov         edx,dword ptr ds:[0B5970];^gvar_000B6B90
 000AF584    mov         dword ptr [edx],eax
 000AF586    mov         eax,dword ptr [ebx+31C];TFormMain.Blockunmark1:TMenuItem
 000AF58C    mov         dword ptr [ebp-30],eax
 000AF58F    mov         eax,dword ptr [ebx+324];TFormMain.Blockdelete1:TMenuItem
 000AF595    mov         dword ptr [ebp-2C],eax
 000AF598    mov         eax,dword ptr [ebx+3FC];TFormMain.CMBtnDel:TCMBtn
 000AF59E    mov         dword ptr [ebp-28],eax
 000AF5A1    mov         eax,dword ptr [ebx+3EC];TFormMain.CMBtnCut:TCMBtn
 000AF5A7    mov         dword ptr [ebp-24],eax
 000AF5AA    mov         eax,dword ptr [ebx+3F0];TFormMain.CMBtnCopy:TCMBtn
 000AF5B0    mov         dword ptr [ebp-20],eax
 000AF5B3    mov         eax,dword ptr [ebx+328];TFormMain.Blockcopy1:TMenuItem
 000AF5B9    mov         dword ptr [ebp-1C],eax
 000AF5BC    mov         eax,dword ptr [ebx+3A8];TFormMain.Blockcopyovwr1:TMenuItem
 000AF5C2    mov         dword ptr [ebp-18],eax
 000AF5C5    mov         eax,dword ptr [ebx+32C];TFormMain.Blockmove1:TMenuItem
 000AF5CB    mov         dword ptr [ebp-14],eax
 000AF5CE    mov         eax,dword ptr [ebx+3C4];TFormMain.Writeblock1:TMenuItem
 000AF5D4    mov         dword ptr [ebp-10],eax
 000AF5D7    mov         eax,dword ptr [ebx+3E0];TFormMain.Cut1:TMenuItem
 000AF5DD    mov         dword ptr [ebp-0C],eax
 000AF5E0    mov         eax,dword ptr [ebx+3E4];TFormMain.Copy1:TMenuItem
 000AF5E6    mov         dword ptr [ebp-8],eax
 000AF5E9    mov         eax,dword ptr [ebx+40C];TFormMain.Copyhex1:TMenuItem
 000AF5EF    mov         dword ptr [ebp-4],eax
 000AF5F2    lea         eax,[ebp-30]
 000AF5F5    mov         cl,1
 000AF5F7    mov         edx,0B
 000AF5FC    call        00099514
 000AF601    mov         eax,dword ptr [ebx+310];TFormMain.CMStrGridText:TCMStrGrid
 000AF607    mov         edx,dword ptr [eax]
 000AF609    call        dword ptr [edx+78];TWinControl.Invalidate
 000AF60C    mov         eax,dword ptr [ebx+314];TFormMain.CMStrGridHex:TCMStrGrid
 000AF612    mov         edx,dword ptr [eax]
 000AF614    call        dword ptr [edx+78];TWinControl.Invalidate
 000AF617    mov         eax,dword ptr [ebx+420];TFormMain.CMStrGridAddr:TCMStrGrid
 000AF61D    mov         edx,dword ptr [eax]
 000AF61F    call        dword ptr [edx+78];TWinControl.Invalidate
 000AF622    mov         eax,[000B5634];^gvar_000B6B50:TFormInspect
 000AF627    cmp         dword ptr [eax],0
>000AF62A    je          000AF638
 000AF62C    mov         eax,[000B5634];^gvar_000B6B50:TFormInspect
 000AF631    mov         eax,dword ptr [eax]
 000AF633    call        00093834
 000AF638    xor         eax,eax
 000AF63A    pop         edx
 000AF63B    pop         ecx
 000AF63C    pop         ecx
 000AF63D    mov         dword ptr fs:[eax],edx
 000AF640    push        0AF659
 000AF645    mov         eax,[000B58B0];^gvar_000B7024:TFormBlockN
 000AF64A    mov         eax,dword ptr [eax]
 000AF64C    call        TCustomForm.Release
 000AF651    ret
>000AF652    jmp         @HandleFinally
>000AF657    jmp         000AF645
 000AF659    pop         ebx
 000AF65A    mov         esp,ebp
 000AF65C    pop         ebp
 000AF65D    ret
*}
end;

//000AF660
procedure TFormMain.Goto1Click(Sender:TObject);
begin
{*
 000AF660    push        ebp
 000AF661    mov         ebp,esp
 000AF663    push        ebx
 000AF664    mov         ebx,eax
 000AF666    mov         ecx,ebx
 000AF668    mov         dl,1
 000AF66A    mov         eax,[0009D608];TFormGoto
 000AF66F    call        TCustomForm.Create;TFormGoto.Create
 000AF674    mov         edx,dword ptr ds:[0B5BF8];^gvar_000B702C:TFormGoto
 000AF67A    mov         dword ptr [edx],eax
 000AF67C    xor         eax,eax
 000AF67E    push        ebp
 000AF67F    push        0AF701
 000AF684    push        dword ptr fs:[eax]
 000AF687    mov         dword ptr fs:[eax],esp
 000AF68A    mov         edx,dword ptr ds:[0B57B0];^gvar_000B6BC8:Longint
 000AF690    mov         edx,dword ptr [edx]
 000AF692    mov         eax,[000B5BF8];^gvar_000B702C:TFormGoto
 000AF697    mov         eax,dword ptr [eax]
 000AF699    mov         eax,dword ptr [eax+2D8]
 000AF69F    call        TCustomRadioGroup.SetItemIndex
 000AF6A4    mov         eax,[000B5BF8];^gvar_000B702C:TFormGoto
 000AF6A9    mov         eax,dword ptr [eax]
 000AF6AB    mov         edx,dword ptr [eax]
 000AF6AD    call        dword ptr [edx+0CC]
 000AF6B3    dec         eax
>000AF6B4    jne         000AF6E7
 000AF6B6    mov         eax,[000B5BF8];^gvar_000B702C:TFormGoto
 000AF6BB    mov         eax,dword ptr [eax]
 000AF6BD    mov         eax,dword ptr [eax+2D8]
 000AF6C3    mov         eax,dword ptr [eax+1F8]
 000AF6C9    mov         edx,dword ptr ds:[0B57B0];^gvar_000B6BC8:Longint
 000AF6CF    mov         dword ptr [edx],eax
 000AF6D1    mov         eax,[000B5BF8];^gvar_000B702C:TFormGoto
 000AF6D6    mov         eax,dword ptr [eax]
 000AF6D8    mov         eax,dword ptr [eax+2E8]
 000AF6DE    mov         cl,1
 000AF6E0    mov         dl,1
 000AF6E2    call        000998B0
 000AF6E7    xor         eax,eax
 000AF6E9    pop         edx
 000AF6EA    pop         ecx
 000AF6EB    pop         ecx
 000AF6EC    mov         dword ptr fs:[eax],edx
 000AF6EF    push        0AF708
 000AF6F4    mov         eax,[000B5BF8];^gvar_000B702C:TFormGoto
 000AF6F9    mov         eax,dword ptr [eax]
 000AF6FB    call        TCustomForm.Release
 000AF700    ret
>000AF701    jmp         @HandleFinally
>000AF706    jmp         000AF6F4
 000AF708    pop         ebx
 000AF709    pop         ebp
 000AF70A    ret
*}
end;

//000AF70C
procedure TFormMain.Jumpwidth1Click(Sender:TObject);
begin
{*
 000AF70C    push        ebp
 000AF70D    mov         ebp,esp
 000AF70F    add         esp,0FFFFFFF8
 000AF712    push        ebx
 000AF713    mov         ebx,eax
 000AF715    mov         ecx,ebx
 000AF717    mov         dl,1
 000AF719    mov         eax,[0009DC48];TFormJump
 000AF71E    call        TCustomForm.Create;TFormJump.Create
 000AF723    mov         edx,dword ptr ds:[0B5650];^gvar_000B7034:TFormJump
 000AF729    mov         dword ptr [edx],eax
 000AF72B    xor         eax,eax
 000AF72D    push        ebp
 000AF72E    push        0AF7BE
 000AF733    push        dword ptr fs:[eax]
 000AF736    mov         dword ptr fs:[eax],esp
 000AF739    mov         eax,[000B5650];^gvar_000B7034:TFormJump
 000AF73E    mov         eax,dword ptr [eax]
 000AF740    mov         edx,dword ptr [eax]
 000AF742    call        dword ptr [edx+0CC]
 000AF748    dec         eax
>000AF749    jne         000AF783
 000AF74B    mov         eax,[000B5650];^gvar_000B7034:TFormJump
 000AF750    mov         eax,dword ptr [eax]
 000AF752    mov         eax,dword ptr [eax+2E0]
 000AF758    mov         edx,dword ptr ds:[0B56BC];^gvar_000B6BA0
 000AF75E    mov         dword ptr [edx],eax
 000AF760    mov         eax,dword ptr [ebx+350];TFormMain.Jumpdown1:TMenuItem
 000AF766    mov         dword ptr [ebp-8],eax
 000AF769    mov         eax,dword ptr [ebx+354];TFormMain.Jumpup1:TMenuItem
 000AF76F    mov         dword ptr [ebp-4],eax
 000AF772    lea         eax,[ebp-8]
 000AF775    mov         cl,1
 000AF777    mov         edx,1
 000AF77C    call        00099514
>000AF781    jmp         000AF7A4
 000AF783    mov         eax,dword ptr [ebx+350];TFormMain.Jumpdown1:TMenuItem
 000AF789    mov         dword ptr [ebp-8],eax
 000AF78C    mov         eax,dword ptr [ebx+354];TFormMain.Jumpup1:TMenuItem
 000AF792    mov         dword ptr [ebp-4],eax
 000AF795    lea         eax,[ebp-8]
 000AF798    xor         ecx,ecx
 000AF79A    mov         edx,1
 000AF79F    call        00099514
 000AF7A4    xor         eax,eax
 000AF7A6    pop         edx
 000AF7A7    pop         ecx
 000AF7A8    pop         ecx
 000AF7A9    mov         dword ptr fs:[eax],edx
 000AF7AC    push        0AF7C5
 000AF7B1    mov         eax,[000B5650];^gvar_000B7034:TFormJump
 000AF7B6    mov         eax,dword ptr [eax]
 000AF7B8    call        TCustomForm.Release
 000AF7BD    ret
>000AF7BE    jmp         @HandleFinally
>000AF7C3    jmp         000AF7B1
 000AF7C5    pop         ebx
 000AF7C6    pop         ecx
 000AF7C7    pop         ecx
 000AF7C8    pop         ebp
 000AF7C9    ret
*}
end;

//000AF7CC
procedure TFormMain.Jumpdown1Click(Sender:TObject);
begin
{*
 000AF7CC    push        ebp
 000AF7CD    mov         ebp,esp
 000AF7CF    push        0
 000AF7D1    xor         eax,eax
 000AF7D3    push        ebp
 000AF7D4    push        0AF839
 000AF7D9    push        dword ptr fs:[eax]
 000AF7DC    mov         dword ptr fs:[eax],esp
 000AF7DF    call        000981C4
 000AF7E4    mov         edx,dword ptr ds:[0B56BC];^gvar_000B6BA0
 000AF7EA    add         eax,dword ptr [edx]
 000AF7EC    mov         edx,dword ptr ds:[0B5BA0];^gvar_000B6BAC:Single
 000AF7F2    cmp         eax,dword ptr [edx]
>000AF7F4    jg          000AF80E
 000AF7F6    call        000981C4
 000AF7FB    mov         edx,dword ptr ds:[0B56BC];^gvar_000B6BA0
 000AF801    add         eax,dword ptr [edx]
 000AF803    mov         cl,1
 000AF805    mov         dl,1
 000AF807    call        000998B0
>000AF80C    jmp         000AF823
 000AF80E    lea         edx,[ebp-4]
 000AF811    mov         eax,7F2
 000AF816    call        LoadStr;'Address invalid'
 000AF81B    mov         eax,dword ptr [ebp-4]
 000AF81E    call        0008D0A8
 000AF823    xor         eax,eax
 000AF825    pop         edx
 000AF826    pop         ecx
 000AF827    pop         ecx
 000AF828    mov         dword ptr fs:[eax],edx
 000AF82B    push        0AF840
 000AF830    lea         eax,[ebp-4]
 000AF833    call        @LStrClr
 000AF838    ret
>000AF839    jmp         @HandleFinally
>000AF83E    jmp         000AF830
 000AF840    pop         ecx
 000AF841    pop         ebp
 000AF842    ret
*}
end;

//000AF844
procedure TFormMain.Jumpup1Click(Sender:TObject);
begin
{*
 000AF844    push        ebp
 000AF845    mov         ebp,esp
 000AF847    push        0
 000AF849    xor         eax,eax
 000AF84B    push        ebp
 000AF84C    push        0AF8AB
 000AF851    push        dword ptr fs:[eax]
 000AF854    mov         dword ptr fs:[eax],esp
 000AF857    call        000981C4
 000AF85C    mov         edx,dword ptr ds:[0B56BC];^gvar_000B6BA0
 000AF862    sub         eax,dword ptr [edx]
 000AF864    test        eax,eax
>000AF866    jle         000AF880
 000AF868    call        000981C4
 000AF86D    mov         edx,dword ptr ds:[0B56BC];^gvar_000B6BA0
 000AF873    sub         eax,dword ptr [edx]
 000AF875    mov         cl,1
 000AF877    mov         dl,1
 000AF879    call        000998B0
>000AF87E    jmp         000AF895
 000AF880    lea         edx,[ebp-4]
 000AF883    mov         eax,7F2
 000AF888    call        LoadStr;'Address invalid'
 000AF88D    mov         eax,dword ptr [ebp-4]
 000AF890    call        0008D0A8
 000AF895    xor         eax,eax
 000AF897    pop         edx
 000AF898    pop         ecx
 000AF899    pop         ecx
 000AF89A    mov         dword ptr fs:[eax],edx
 000AF89D    push        0AF8B2
 000AF8A2    lea         eax,[ebp-4]
 000AF8A5    call        @LStrClr
 000AF8AA    ret
>000AF8AB    jmp         @HandleFinally
>000AF8B0    jmp         000AF8A2
 000AF8B2    pop         ecx
 000AF8B3    pop         ebp
 000AF8B4    ret
*}
end;

//000AF8B8
procedure TFormMain.Rememberaddress1Click(Sender:TObject);
begin
{*
 000AF8B8    push        ebx
 000AF8B9    add         esp,0FFFFFFF8
 000AF8BC    mov         ebx,eax
 000AF8BE    call        000981C4
 000AF8C3    mov         edx,dword ptr ds:[0B5888];^gvar_000B6B9C
 000AF8C9    mov         dword ptr [edx],eax
 000AF8CB    mov         eax,dword ptr [ebx+360];TFormMain.Gotoremembered1:TMenuItem
 000AF8D1    mov         dword ptr [esp],eax
 000AF8D4    mov         eax,dword ptr [ebx+364];TFormMain.Displaydifference1:TMenuItem
 000AF8DA    mov         dword ptr [esp+4],eax
 000AF8DE    mov         eax,esp
 000AF8E0    mov         cl,1
 000AF8E2    mov         edx,1
 000AF8E7    call        00099514
 000AF8EC    pop         ecx
 000AF8ED    pop         edx
 000AF8EE    pop         ebx
 000AF8EF    ret
*}
end;

//000AF8F0
procedure TFormMain.Gotoremembered1Click(Sender:TObject);
begin
{*
 000AF8F0    push        ebp
 000AF8F1    mov         ebp,esp
 000AF8F3    push        0
 000AF8F5    xor         eax,eax
 000AF8F7    push        ebp
 000AF8F8    push        0AF95B
 000AF8FD    push        dword ptr fs:[eax]
 000AF900    mov         dword ptr fs:[eax],esp
 000AF903    mov         eax,[000B5888];^gvar_000B6B9C
 000AF908    cmp         dword ptr [eax],0
>000AF90B    jle         000AF930
 000AF90D    mov         eax,[000B5888];^gvar_000B6B9C
 000AF912    mov         eax,dword ptr [eax]
 000AF914    mov         edx,dword ptr ds:[0B5BA0];^gvar_000B6BAC:Single
 000AF91A    cmp         eax,dword ptr [edx]
>000AF91C    jg          000AF930
 000AF91E    mov         eax,[000B5888];^gvar_000B6B9C
 000AF923    mov         eax,dword ptr [eax]
 000AF925    mov         cl,1
 000AF927    mov         dl,1
 000AF929    call        000998B0
>000AF92E    jmp         000AF945
 000AF930    lea         edx,[ebp-4]
 000AF933    mov         eax,7F2
 000AF938    call        LoadStr;'Address invalid'
 000AF93D    mov         eax,dword ptr [ebp-4]
 000AF940    call        0008D0A8
 000AF945    xor         eax,eax
 000AF947    pop         edx
 000AF948    pop         ecx
 000AF949    pop         ecx
 000AF94A    mov         dword ptr fs:[eax],edx
 000AF94D    push        0AF962
 000AF952    lea         eax,[ebp-4]
 000AF955    call        @LStrClr
 000AF95A    ret
>000AF95B    jmp         @HandleFinally
>000AF960    jmp         000AF952
 000AF962    pop         ecx
 000AF963    pop         ebp
 000AF964    ret
*}
end;

//000AF968
procedure TFormMain.Displaydifference1Click(Sender:TObject);
begin
{*
 000AF968    push        ebp
 000AF969    mov         ebp,esp
 000AF96B    add         esp,0FFFFFFC4
 000AF96E    push        ebx
 000AF96F    xor         ecx,ecx
 000AF971    mov         dword ptr [ebp-8],ecx
 000AF974    mov         dword ptr [ebp-3C],ecx
 000AF977    mov         dword ptr [ebp-4],ecx
 000AF97A    xor         eax,eax
 000AF97C    push        ebp
 000AF97D    push        0AFA7A
 000AF982    push        dword ptr fs:[eax]
 000AF985    mov         dword ptr fs:[eax],esp
 000AF988    call        000981C4
 000AF98D    mov         ebx,eax
 000AF98F    mov         eax,[000B5888];^gvar_000B6B9C
 000AF994    sub         ebx,dword ptr [eax]
 000AF996    lea         eax,[ebp-8]
 000AF999    push        eax
 000AF99A    mov         eax,[000B5B1C];^gvar_000B55F8:Longint
 000AF99F    mov         eax,dword ptr [eax]
 000AF9A1    mov         edx,dword ptr ds:[0B5888];^gvar_000B6B9C
 000AF9A7    add         eax,dword ptr [edx]
 000AF9A9    dec         eax
 000AF9AA    mov         dword ptr [ebp-1C],eax
 000AF9AD    fild        dword ptr [ebp-1C]
 000AF9B0    call        @INT
 000AF9B5    fstp        tbyte ptr [ebp-28]
 000AF9B8    wait
 000AF9B9    lea         eax,[ebp-28]
 000AF9BC    mov         dword ptr [ebp-18],eax
 000AF9BF    mov         byte ptr [ebp-14],3
 000AF9C3    mov         dword ptr [ebp-2C],ebx
 000AF9C6    fild        dword ptr [ebp-2C]
 000AF9C9    call        @INT
 000AF9CE    fstp        tbyte ptr [ebp-38]
 000AF9D1    wait
 000AF9D2    lea         eax,[ebp-38]
 000AF9D5    mov         dword ptr [ebp-10],eax
 000AF9D8    mov         byte ptr [ebp-0C],3
 000AF9DC    lea         edx,[ebp-18]
 000AF9DF    mov         ecx,1
 000AF9E4    mov         eax,7F3
 000AF9E9    call        FmtLoadStr;'Remembered address dec: %.0n
Difference dec: %.0n'
 000AF9EE    push        dword ptr [ebp-8]
 000AF9F1    push        0AFA90;#13+#10
 000AF9F6    lea         eax,[ebp-3C]
 000AF9F9    push        eax
 000AF9FA    mov         eax,[000B5B1C];^gvar_000B55F8:Longint
 000AF9FF    mov         eax,dword ptr [eax]
 000AFA01    mov         edx,dword ptr ds:[0B5888];^gvar_000B6B9C
 000AFA07    add         eax,dword ptr [edx]
 000AFA09    dec         eax
 000AFA0A    mov         dword ptr [ebp-18],eax
 000AFA0D    mov         byte ptr [ebp-14],0
 000AFA11    mov         dword ptr [ebp-10],ebx
 000AFA14    mov         byte ptr [ebp-0C],0
 000AFA18    lea         edx,[ebp-18]
 000AFA1B    mov         ecx,1
 000AFA20    mov         eax,7F4
 000AFA25    call        FmtLoadStr;'Remembered address hex: %x
Difference hex: %x'
 000AFA2A    push        dword ptr [ebp-3C]
 000AFA2D    lea         eax,[ebp-4]
 000AFA30    mov         edx,3
 000AFA35    call        @LStrCatN
 000AFA3A    lea         edx,[ebp-8]
 000AFA3D    mov         eax,856
 000AFA42    call        LoadStr;'Information'
 000AFA47    mov         eax,dword ptr [ebp-8]
 000AFA4A    mov         ecx,0E
 000AFA4F    mov         edx,dword ptr [ebp-4]
 000AFA52    call        0008D880
 000AFA57    xor         eax,eax
 000AFA59    pop         edx
 000AFA5A    pop         ecx
 000AFA5B    pop         ecx
 000AFA5C    mov         dword ptr fs:[eax],edx
 000AFA5F    push        0AFA81
 000AFA64    lea         eax,[ebp-3C]
 000AFA67    call        @LStrClr
 000AFA6C    lea         eax,[ebp-8]
 000AFA6F    mov         edx,2
 000AFA74    call        @LStrArrayClr
 000AFA79    ret
>000AFA7A    jmp         @HandleFinally
>000AFA7F    jmp         000AFA64
 000AFA81    pop         ebx
 000AFA82    mov         esp,ebp
 000AFA84    pop         ebp
 000AFA85    ret
*}
end;

//000AFA94
procedure TFormMain.Blockcopy1Click(Sender:TObject);
begin
{*
 000AFA94    push        ebp
 000AFA95    mov         ebp,esp
 000AFA97    add         esp,0FFFFFFF8
 000AFA9A    push        ebx
 000AFA9B    push        esi
 000AFA9C    push        edi
 000AFA9D    xor         ecx,ecx
 000AFA9F    mov         dword ptr [ebp-4],ecx
 000AFAA2    mov         edi,edx
 000AFAA4    mov         esi,eax
 000AFAA6    xor         eax,eax
 000AFAA8    push        ebp
 000AFAA9    push        0AFC94
 000AFAAE    push        dword ptr fs:[eax]
 000AFAB1    mov         dword ptr fs:[eax],esp
 000AFAB4    call        000981C4
 000AFAB9    mov         ebx,eax
 000AFABB    mov         eax,[000B586C];^gvar_000B6B8C:dword
 000AFAC0    cmp         dword ptr [eax],0
>000AFAC3    je          000AFACF
 000AFAC5    mov         eax,[000B5970];^gvar_000B6B90
 000AFACA    cmp         dword ptr [eax],0
>000AFACD    jne         000AFAE9
 000AFACF    lea         edx,[ebp-4]
 000AFAD2    mov         eax,7E7
 000AFAD7    call        LoadStr;'No block marked'
 000AFADC    mov         eax,dword ptr [ebp-4]
 000AFADF    call        0008D0A8
>000AFAE4    jmp         000AFC7E
 000AFAE9    mov         eax,[000B586C];^gvar_000B6B8C:dword
 000AFAEE    cmp         ebx,dword ptr [eax]
>000AFAF0    jle         000AFB15
 000AFAF2    mov         eax,[000B5970];^gvar_000B6B90
 000AFAF7    cmp         ebx,dword ptr [eax]
>000AFAF9    jg          000AFB15
 000AFAFB    lea         edx,[ebp-4]
 000AFAFE    mov         eax,7EA
 000AFB03    call        LoadStr;'Can't copy or move within block
(use clipboard if necessary)'
 000AFB08    mov         eax,dword ptr [ebp-4]
 000AFB0B    call        0008D0A8
>000AFB10    jmp         000AFC7E
 000AFB15    cmp         edi,dword ptr [esi+328];TFormMain.Blockcopy1:TMenuItem
>000AFB1B    je          000AFB40
 000AFB1D    mov         eax,[000B586C];^gvar_000B6B8C:dword
 000AFB22    cmp         ebx,dword ptr [eax]
>000AFB24    jne         000AFB40
 000AFB26    lea         edx,[ebp-4]
 000AFB29    mov         eax,81C
 000AFB2E    call        LoadStr;'Block remains on same position'
 000AFB33    mov         eax,dword ptr [ebp-4]
 000AFB36    call        0008D08C
>000AFB3B    jmp         000AFC7E
 000AFB40    cmp         edi,dword ptr [esi+32C];TFormMain.Blockmove1:TMenuItem
>000AFB46    jne         000AFB6E
 000AFB48    mov         eax,[000B5970];^gvar_000B6B90
 000AFB4D    mov         eax,dword ptr [eax]
 000AFB4F    inc         eax
 000AFB50    cmp         ebx,eax
>000AFB52    jne         000AFB6E
 000AFB54    lea         edx,[ebp-4]
 000AFB57    mov         eax,81C
 000AFB5C    call        LoadStr;'Block remains on same position'
 000AFB61    mov         eax,dword ptr [ebp-4]
 000AFB64    call        0008D08C
>000AFB69    jmp         000AFC7E
 000AFB6E    cmp         edi,dword ptr [esi+3A8];TFormMain.Blockcopyovwr1:TMenuItem
>000AFB74    jne         000AFBAB
 000AFB76    mov         eax,[000B5970];^gvar_000B6B90
 000AFB7B    mov         eax,dword ptr [eax]
 000AFB7D    add         eax,ebx
 000AFB7F    mov         edx,dword ptr ds:[0B586C];^gvar_000B6B8C:dword
 000AFB85    sub         eax,dword ptr [edx]
 000AFB87    mov         edx,dword ptr ds:[0B5BA0];^gvar_000B6BAC:Single
 000AFB8D    cmp         eax,dword ptr [edx]
>000AFB8F    jle         000AFBAB
 000AFB91    lea         edx,[ebp-4]
 000AFB94    mov         eax,7EC
 000AFB99    call        LoadStr;'Can't overwrite beyond end of file'
 000AFB9E    mov         eax,dword ptr [ebp-4]
 000AFBA1    call        0008D0A8
>000AFBA6    jmp         000AFC7E
 000AFBAB    cmp         edi,dword ptr [esi+3A8];TFormMain.Blockcopyovwr1:TMenuItem
 000AFBB1    setne       al
 000AFBB4    call        00099FE0
 000AFBB9    test        al,al
>000AFBBB    jne         000AFBD7
 000AFBBD    lea         edx,[ebp-4]
 000AFBC0    mov         eax,7D4
 000AFBC5    call        LoadStr;'Can't allocate additional memory
to perform operation'
 000AFBCA    mov         eax,dword ptr [ebp-4]
 000AFBCD    call        0008D0A8
>000AFBD2    jmp         000AFC7E
 000AFBD7    mov         eax,dword ptr [esi+398];TFormMain.Replaceundo1:TMenuItem
 000AFBDD    mov         dword ptr [ebp-8],eax
 000AFBE0    lea         eax,[ebp-8]
 000AFBE3    xor         ecx,ecx
 000AFBE5    xor         edx,edx
 000AFBE7    call        00099514
 000AFBEC    cmp         edi,dword ptr [esi+32C];TFormMain.Blockmove1:TMenuItem
>000AFBF2    je          000AFC14
 000AFBF4    mov         eax,ebx
 000AFBF6    call        00099ECC
 000AFBFB    call        0009958C
 000AFC00    mov         edx,dword ptr ds:[0B5720];^gvar_000B6B88
 000AFC06    mov         dword ptr [edx],eax
 000AFC08    call        00099890
 000AFC0D    call        000983B8
>000AFC12    jmp         000AFC7E
 000AFC14    mov         eax,[000B586C];^gvar_000B6B8C:dword
 000AFC19    cmp         ebx,dword ptr [eax]
>000AFC1B    jge         000AFC2A
 000AFC1D    mov         eax,[000B5970];^gvar_000B6B90
 000AFC22    mov         eax,dword ptr [eax]
 000AFC24    inc         eax
 000AFC25    call        00099ECC
 000AFC2A    mov         edx,dword ptr ds:[0B5970];^gvar_000B6B90
 000AFC30    mov         edx,dword ptr [edx]
 000AFC32    mov         eax,[000B586C];^gvar_000B6B8C:dword
 000AFC37    sub         edx,dword ptr [eax]
 000AFC39    inc         edx
 000AFC3A    mov         eax,[000B586C];^gvar_000B6B8C:dword
 000AFC3F    mov         eax,dword ptr [eax]
 000AFC41    call        0009A0E0
 000AFC46    mov         eax,[000B586C];^gvar_000B6B8C:dword
 000AFC4B    cmp         ebx,dword ptr [eax]
>000AFC4D    jge         000AFC58
 000AFC4F    mov         eax,ebx
 000AFC51    call        00099ECC
>000AFC56    jmp         000AFC73
 000AFC58    mov         eax,[000B5970];^gvar_000B6B90
 000AFC5D    mov         eax,dword ptr [eax]
 000AFC5F    mov         edx,dword ptr ds:[0B586C];^gvar_000B6B8C:dword
 000AFC65    sub         eax,dword ptr [edx]
 000AFC67    push        eax
 000AFC68    mov         eax,ebx
 000AFC6A    pop         edx
 000AFC6B    sub         eax,edx
 000AFC6D    dec         eax
 000AFC6E    call        00099ECC
 000AFC73    mov         cl,1
 000AFC75    mov         dl,1
 000AFC77    mov         eax,ebx
 000AFC79    call        000998B0
 000AFC7E    xor         eax,eax
 000AFC80    pop         edx
 000AFC81    pop         ecx
 000AFC82    pop         ecx
 000AFC83    mov         dword ptr fs:[eax],edx
 000AFC86    push        0AFC9B
 000AFC8B    lea         eax,[ebp-4]
 000AFC8E    call        @LStrClr
 000AFC93    ret
>000AFC94    jmp         @HandleFinally
>000AFC99    jmp         000AFC8B
 000AFC9B    pop         edi
 000AFC9C    pop         esi
 000AFC9D    pop         ebx
 000AFC9E    pop         ecx
 000AFC9F    pop         ecx
 000AFCA0    pop         ebp
 000AFCA1    ret
*}
end;

//000AFCA4
{*procedure sub_000AFCA4(?:TFormMain; ?:?);
begin
 000AFCA4    push        ebp
 000AFCA5    mov         ebp,esp
 000AFCA7    xor         ecx,ecx
 000AFCA9    push        ecx
 000AFCAA    push        ecx
 000AFCAB    push        ecx
 000AFCAC    push        ecx
 000AFCAD    push        ebx
 000AFCAE    push        esi
 000AFCAF    push        edi
 000AFCB0    mov         edi,edx
 000AFCB2    mov         ebx,eax
 000AFCB4    xor         eax,eax
 000AFCB6    push        ebp
 000AFCB7    push        0B05C9
 000AFCBC    push        dword ptr fs:[eax]
 000AFCBF    mov         dword ptr fs:[eax],esp
 000AFCC2    mov         ecx,ebx
 000AFCC4    mov         dl,1
 000AFCC6    mov         eax,[00092A0C];TFormOpt
 000AFCCB    call        TCustomForm.Create;TFormOpt.Create
 000AFCD0    mov         edx,dword ptr ds:[0B5928];^gvar_000B6B48:TFormOpt
 000AFCD6    mov         dword ptr [edx],eax
 000AFCD8    xor         edx,edx
 000AFCDA    push        ebp
 000AFCDB    push        0B059C
 000AFCE0    push        dword ptr fs:[edx]
 000AFCE3    mov         dword ptr fs:[edx],esp
 000AFCE6    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000AFCEB    mov         eax,dword ptr [eax]
 000AFCED    mov         edx,7
 000AFCF2    call        0008806C
 000AFCF7    mov         dword ptr [ebp-4],eax
 000AFCFA    mov         eax,dword ptr [ebx+310]
 000AFD00    mov         eax,dword ptr [eax+58]
 000AFD03    call        TFont.GetSize
 000AFD08    mov         edx,eax
 000AFD0A    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000AFD0F    mov         eax,dword ptr [eax]
 000AFD11    mov         eax,dword ptr [eax+2DC]
 000AFD17    call        TSpinEdit.SetValue
 000AFD1C    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000AFD21    mov         eax,dword ptr [eax]
 000AFD23    mov         eax,dword ptr [eax+2DC]
 000AFD29    mov         dword ptr [eax+208],18
 000AFD33    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000AFD38    mov         eax,dword ptr [eax]
 000AFD3A    mov         eax,dword ptr [eax+2E4]
 000AFD40    mov         dword ptr [eax+204],8
 000AFD4A    mov         eax,[000B5BDC];^Screen:TScreen
 000AFD4F    mov         eax,dword ptr [eax]
 000AFD51    call        TScreen.GetWidth
 000AFD56    mov         edx,eax
 000AFD58    mov         eax,ebx
 000AFD5A    call        000AB204
 000AFD5F    mov         edx,dword ptr ds:[0B5928];^gvar_000B6B48:TFormOpt
 000AFD65    mov         edx,dword ptr [edx]
 000AFD67    mov         esi,dword ptr [edx+2E4]
 000AFD6D    mov         dword ptr [esi+208],eax
 000AFD73    mov         eax,dword ptr [ebx+310]
 000AFD79    mov         edx,dword ptr [eax+1FC]
 000AFD7F    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000AFD84    mov         eax,esi
 000AFD86    call        TSpinEdit.SetValue
 000AFD8B    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000AFD90    mov         eax,dword ptr [eax]
 000AFD92    mov         eax,dword ptr [eax+2EC]
 000AFD98    mov         dword ptr [eax+204],8
 000AFDA2    mov         eax,[000B5BDC];^Screen:TScreen
 000AFDA7    mov         eax,dword ptr [eax]
 000AFDA9    call        TScreen.GetHeight
 000AFDAE    mov         edx,eax
 000AFDB0    mov         eax,ebx
 000AFDB2    call        000AB2BC
 000AFDB7    mov         edx,dword ptr ds:[0B5928];^gvar_000B6B48:TFormOpt
 000AFDBD    mov         edx,dword ptr [edx]
 000AFDBF    mov         esi,dword ptr [edx+2EC]
 000AFDC5    mov         dword ptr [esi+208],eax
 000AFDCB    mov         eax,dword ptr [ebx+310]
 000AFDD1    mov         edx,dword ptr [eax+22C]
 000AFDD7    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000AFDDC    mov         eax,esi
 000AFDDE    call        TSpinEdit.SetValue
 000AFDE3    mov         eax,dword ptr [ebx+490]
 000AFDE9    xor         edx,edx
 000AFDEB    mov         dl,byte ptr [eax+28]
 000AFDEE    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000AFDF3    mov         eax,dword ptr [eax]
 000AFDF5    mov         eax,dword ptr [eax+310]
 000AFDFB    call        TSpinEdit.SetValue
 000AFE00    mov         edx,dword ptr ds:[0B5A50];^gvar_000B6BC5:Longint
 000AFE06    movzx       edx,byte ptr [edx]
 000AFE09    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000AFE0E    mov         eax,dword ptr [eax]
 000AFE10    mov         eax,dword ptr [eax+364]
 000AFE16    call        TCustomRadioGroup.SetItemIndex
 000AFE1B    mov         edx,dword ptr ds:[0B5B1C];^gvar_000B55F8:Longint
 000AFE21    mov         edx,dword ptr [edx]
 000AFE23    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000AFE28    mov         eax,dword ptr [eax]
 000AFE2A    mov         eax,dword ptr [eax+300]
 000AFE30    call        TCustomRadioGroup.SetItemIndex
 000AFE35    mov         edx,dword ptr ds:[0B58D8];^gvar_000B6BCD:Boolean
 000AFE3B    mov         dl,byte ptr [edx]
 000AFE3D    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000AFE42    mov         eax,dword ptr [eax]
 000AFE44    mov         eax,dword ptr [eax+304]
 000AFE4A    mov         ecx,dword ptr [eax]
 000AFE4C    call        dword ptr [ecx+0BC]
 000AFE52    mov         edx,dword ptr ds:[0B5648];^gvar_000B7007:Boolean
 000AFE58    mov         dl,byte ptr [edx]
 000AFE5A    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000AFE5F    mov         eax,dword ptr [eax]
 000AFE61    mov         eax,dword ptr [eax+36C]
 000AFE67    mov         ecx,dword ptr [eax]
 000AFE69    call        dword ptr [ecx+0BC]
 000AFE6F    mov         edx,dword ptr ds:[0B5B4C];^gvar_000B7013:Boolean
 000AFE75    mov         dl,byte ptr [edx]
 000AFE77    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000AFE7C    mov         eax,dword ptr [eax]
 000AFE7E    mov         eax,dword ptr [eax+370]
 000AFE84    mov         ecx,dword ptr [eax]
 000AFE86    call        dword ptr [ecx+0BC]
 000AFE8C    mov         edx,dword ptr ds:[0B59FC];^gvar_000B700A:Boolean
 000AFE92    mov         dl,byte ptr [edx]
 000AFE94    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000AFE99    mov         eax,dword ptr [eax]
 000AFE9B    mov         eax,dword ptr [eax+340]
 000AFEA1    mov         ecx,dword ptr [eax]
 000AFEA3    call        dword ptr [ecx+0BC]
 000AFEA9    mov         edx,dword ptr ds:[0B57A8];^gvar_000B700B:Boolean
 000AFEAF    mov         dl,byte ptr [edx]
 000AFEB1    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000AFEB6    mov         eax,dword ptr [eax]
 000AFEB8    mov         eax,dword ptr [eax+360]
 000AFEBE    mov         ecx,dword ptr [eax]
 000AFEC0    call        dword ptr [ecx+0BC]
 000AFEC6    mov         edx,dword ptr ds:[0B5664];^gvar_000B700F:Boolean
 000AFECC    mov         dl,byte ptr [edx]
 000AFECE    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000AFED3    mov         eax,dword ptr [eax]
 000AFED5    mov         eax,dword ptr [eax+344]
 000AFEDB    mov         ecx,dword ptr [eax]
 000AFEDD    call        dword ptr [ecx+0BC]
 000AFEE3    mov         edx,dword ptr ds:[0B5B18];^gvar_000B700C:Boolean
 000AFEE9    mov         dl,byte ptr [edx]
 000AFEEB    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000AFEF0    mov         eax,dword ptr [eax]
 000AFEF2    mov         eax,dword ptr [eax+348]
 000AFEF8    mov         ecx,dword ptr [eax]
 000AFEFA    call        dword ptr [ecx+0BC]
 000AFF00    mov         edx,dword ptr ds:[0B59CC];^gvar_000B7010:Boolean
 000AFF06    mov         dl,byte ptr [edx]
 000AFF08    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000AFF0D    mov         eax,dword ptr [eax]
 000AFF0F    mov         eax,dword ptr [eax+34C]
 000AFF15    mov         ecx,dword ptr [eax]
 000AFF17    call        dword ptr [ecx+0BC]
 000AFF1D    mov         edx,dword ptr ds:[0B5920];^gvar_000B700D:Boolean
 000AFF23    mov         dl,byte ptr [edx]
 000AFF25    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000AFF2A    mov         eax,dword ptr [eax]
 000AFF2C    mov         eax,dword ptr [eax+350]
 000AFF32    mov         ecx,dword ptr [eax]
 000AFF34    call        dword ptr [ecx+0BC]
 000AFF3A    mov         edx,dword ptr ds:[0B5980];^gvar_000B7011:Boolean
 000AFF40    mov         dl,byte ptr [edx]
 000AFF42    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000AFF47    mov         eax,dword ptr [eax]
 000AFF49    mov         eax,dword ptr [eax+354]
 000AFF4F    mov         ecx,dword ptr [eax]
 000AFF51    call        dword ptr [ecx+0BC]
 000AFF57    mov         edx,dword ptr ds:[0B56D0];^gvar_000B700E:Boolean
 000AFF5D    mov         dl,byte ptr [edx]
 000AFF5F    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000AFF64    mov         eax,dword ptr [eax]
 000AFF66    mov         eax,dword ptr [eax+358]
 000AFF6C    mov         ecx,dword ptr [eax]
 000AFF6E    call        dword ptr [ecx+0BC]
 000AFF74    mov         edx,dword ptr ds:[0B5A00];^gvar_000B7012:Boolean
 000AFF7A    mov         dl,byte ptr [edx]
 000AFF7C    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000AFF81    mov         eax,dword ptr [eax]
 000AFF83    mov         eax,dword ptr [eax+35C]
 000AFF89    mov         ecx,dword ptr [eax]
 000AFF8B    call        dword ptr [ecx+0BC]
 000AFF91    mov         edx,dword ptr ds:[0B5AD8];^gvar_000B7006:Boolean
 000AFF97    mov         dl,byte ptr [edx]
 000AFF99    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000AFF9E    mov         eax,dword ptr [eax]
 000AFFA0    mov         eax,dword ptr [eax+338]
 000AFFA6    mov         ecx,dword ptr [eax]
 000AFFA8    call        dword ptr [ecx+0BC]
 000AFFAE    mov         edx,dword ptr ds:[0B5744];^gvar_000B6BDA:Boolean
 000AFFB4    mov         dl,byte ptr [edx]
 000AFFB6    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000AFFBB    mov         eax,dword ptr [eax]
 000AFFBD    mov         eax,dword ptr [eax+308]
 000AFFC3    mov         ecx,dword ptr [eax]
 000AFFC5    call        dword ptr [ecx+0BC]
 000AFFCB    mov         edx,dword ptr ds:[0B5BB4];^gvar_000B6BE8:Boolean
 000AFFD1    mov         dl,byte ptr [edx]
 000AFFD3    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000AFFD8    mov         eax,dword ptr [eax]
 000AFFDA    mov         eax,dword ptr [eax+31C]
 000AFFE0    mov         ecx,dword ptr [eax]
 000AFFE2    call        dword ptr [ecx+0BC]
 000AFFE8    mov         edx,dword ptr ds:[0B5A20];^gvar_000B6CFC:Boolean
 000AFFEE    mov         dl,byte ptr [edx]
 000AFFF0    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000AFFF5    mov         eax,dword ptr [eax]
 000AFFF7    mov         eax,dword ptr [eax+324]
 000AFFFD    mov         ecx,dword ptr [eax]
 000AFFFF    call        dword ptr [ecx+0BC]
 000B0005    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000B000A    mov         eax,dword ptr [eax]
 000B000C    mov         esi,dword ptr [eax+318]
 000B0012    lea         edx,[ebp-8]
 000B0015    mov         eax,[000B5BC4];^gvar_000B6BA8:Longint
 000B001A    mov         eax,dword ptr [eax]
 000B001C    call        ColorToString
 000B0021    mov         edx,dword ptr [ebp-8]
 000B0024    mov         eax,dword ptr [esi+1EC]
 000B002A    mov         ecx,dword ptr [eax]
 000B002C    call        dword ptr [ecx+50]
 000B002F    mov         edx,eax
 000B0031    mov         eax,esi
 000B0033    call        TCustomComboBox.SetItemIndex
 000B0038    cmp         edi,0FFFFFFFF
>000B003B    jle         000B0051
 000B003D    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000B0042    mov         eax,dword ptr [eax]
 000B0044    mov         eax,dword ptr [eax+2C8]
 000B004A    mov         edx,edi
 000B004C    call        000880DC
 000B0051    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000B0056    mov         eax,dword ptr [eax]
 000B0058    mov         edx,dword ptr [eax]
 000B005A    call        dword ptr [edx+0CC]
 000B0060    dec         eax
>000B0061    jne         000B0582
 000B0067    lea         edx,[ebp-0C]
 000B006A    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000B006F    mov         eax,dword ptr [eax]
 000B0071    mov         eax,dword ptr [eax+2F8]
 000B0077    call        TControl.GetText
 000B007C    mov         eax,dword ptr [ebp-0C]
 000B007F    push        eax
 000B0080    lea         edx,[ebp-10]
 000B0083    mov         eax,dword ptr [ebx+310]
 000B0089    mov         eax,dword ptr [eax+58]
 000B008C    call        TFont.GetName
 000B0091    mov         edx,dword ptr [ebp-10]
 000B0094    pop         eax
 000B0095    call        @LStrCmp
>000B009A    je          000B00BB
 000B009C    lea         edx,[ebp-0C]
 000B009F    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000B00A4    mov         eax,dword ptr [eax]
 000B00A6    mov         eax,dword ptr [eax+2F8]
 000B00AC    call        TControl.GetText
 000B00B1    mov         edx,dword ptr [ebp-0C]
 000B00B4    mov         eax,ebx
 000B00B6    call        000AE098
 000B00BB    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000B00C0    mov         eax,dword ptr [eax]
 000B00C2    mov         eax,dword ptr [eax+370]
 000B00C8    mov         edx,dword ptr [eax]
 000B00CA    call        dword ptr [edx+0B8]
 000B00D0    mov         edx,dword ptr ds:[0B5B4C];^gvar_000B7013:Boolean
 000B00D6    cmp         al,byte ptr [edx]
>000B00D8    je          000B0112
 000B00DA    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000B00DF    mov         eax,dword ptr [eax]
 000B00E1    mov         eax,dword ptr [eax+370]
 000B00E7    mov         edx,dword ptr [eax]
 000B00E9    call        dword ptr [edx+0B8]
 000B00EF    mov         edx,dword ptr ds:[0B5B4C];^gvar_000B7013:Boolean
 000B00F5    mov         byte ptr [edx],al
 000B00F7    call        0009958C
 000B00FC    mov         edx,dword ptr ds:[0B5720];^gvar_000B6B88
 000B0102    mov         dword ptr [edx],eax
 000B0104    xor         edx,edx
 000B0106    xor         eax,eax
 000B0108    call        000996A4
 000B010D    call        000983B8
 000B0112    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000B0117    mov         eax,dword ptr [eax]
 000B0119    mov         eax,dword ptr [eax+2DC]
 000B011F    call        TSpinEdit.GetValue
 000B0124    mov         esi,eax
 000B0126    mov         eax,dword ptr [ebx+310]
 000B012C    mov         eax,dword ptr [eax+58]
 000B012F    call        TFont.GetSize
 000B0134    cmp         esi,eax
>000B0136    je          000B0153
 000B0138    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000B013D    mov         eax,dword ptr [eax]
 000B013F    mov         eax,dword ptr [eax+2DC]
 000B0145    call        TSpinEdit.GetValue
 000B014A    mov         edx,eax
 000B014C    mov         eax,ebx
 000B014E    call        000ADD3C
 000B0153    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000B0158    mov         eax,dword ptr [eax]
 000B015A    mov         eax,dword ptr [eax+2E4]
 000B0160    call        TSpinEdit.GetValue
 000B0165    mov         edx,dword ptr ds:[0B5868];^gvar_000B6B64:Longint
 000B016B    cmp         eax,dword ptr [edx]
>000B016D    jne         000B018B
 000B016F    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000B0174    mov         eax,dword ptr [eax]
 000B0176    mov         eax,dword ptr [eax+2EC]
 000B017C    call        TSpinEdit.GetValue
 000B0181    mov         edx,dword ptr ds:[0B578C];^gvar_000B6B68:Longint
 000B0187    cmp         eax,dword ptr [edx]
>000B0189    je          000B01BA
 000B018B    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000B0190    mov         eax,dword ptr [eax]
 000B0192    mov         eax,dword ptr [eax+2EC]
 000B0198    call        TSpinEdit.GetValue
 000B019D    push        eax
 000B019E    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000B01A3    mov         eax,dword ptr [eax]
 000B01A5    mov         eax,dword ptr [eax+2E4]
 000B01AB    call        TSpinEdit.GetValue
 000B01B0    mov         edx,eax
 000B01B2    mov         eax,ebx
 000B01B4    pop         ecx
 000B01B5    call        000AE0E8
 000B01BA    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000B01BF    mov         eax,dword ptr [eax]
 000B01C1    mov         eax,dword ptr [eax+338]
 000B01C7    mov         edx,dword ptr [eax]
 000B01C9    call        dword ptr [edx+0B8]
 000B01CF    mov         edx,dword ptr ds:[0B5AD8];^gvar_000B7006:Boolean
 000B01D5    cmp         al,byte ptr [edx]
>000B01D7    je          000B0207
 000B01D9    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000B01DE    mov         eax,dword ptr [eax]
 000B01E0    mov         eax,dword ptr [eax+338]
 000B01E6    mov         edx,dword ptr [eax]
 000B01E8    call        dword ptr [edx+0B8]
 000B01EE    mov         edx,dword ptr ds:[0B5AD8];^gvar_000B7006:Boolean
 000B01F4    mov         byte ptr [edx],al
 000B01F6    mov         edx,dword ptr ds:[0B5AD8];^gvar_000B7006:Boolean
 000B01FC    mov         dl,byte ptr [edx]
 000B01FE    mov         cl,1
 000B0200    mov         eax,ebx
 000B0202    call        000AE3E4
 000B0207    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000B020C    mov         eax,dword ptr [eax]
 000B020E    mov         eax,dword ptr [eax+304]
 000B0214    mov         edx,dword ptr [eax]
 000B0216    call        dword ptr [edx+0B8]
 000B021C    mov         edx,dword ptr ds:[0B58D8];^gvar_000B6BCD:Boolean
 000B0222    cmp         al,byte ptr [edx]
>000B0224    je          000B0254
 000B0226    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000B022B    mov         eax,dword ptr [eax]
 000B022D    mov         eax,dword ptr [eax+304]
 000B0233    mov         edx,dword ptr [eax]
 000B0235    call        dword ptr [edx+0B8]
 000B023B    mov         edx,dword ptr ds:[0B58D8];^gvar_000B6BCD:Boolean
 000B0241    mov         byte ptr [edx],al
 000B0243    mov         edx,dword ptr ds:[0B58D8];^gvar_000B6BCD:Boolean
 000B0249    mov         dl,byte ptr [edx]
 000B024B    mov         cl,1
 000B024D    mov         eax,ebx
 000B024F    call        000AE344
 000B0254    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000B0259    mov         eax,dword ptr [eax]
 000B025B    mov         eax,dword ptr [eax+31C]
 000B0261    mov         edx,dword ptr [eax]
 000B0263    call        dword ptr [edx+0B8]
 000B0269    mov         edx,dword ptr ds:[0B5BB4];^gvar_000B6BE8:Boolean
 000B026F    cmp         al,byte ptr [edx]
>000B0271    je          000B0290
 000B0273    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000B0278    mov         eax,dword ptr [eax]
 000B027A    mov         eax,dword ptr [eax+31C]
 000B0280    mov         edx,dword ptr [eax]
 000B0282    call        dword ptr [edx+0B8]
 000B0288    mov         edx,dword ptr ds:[0B5BB4];^gvar_000B6BE8:Boolean
 000B028E    mov         byte ptr [edx],al
 000B0290    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000B0295    mov         eax,dword ptr [eax]
 000B0297    mov         eax,dword ptr [eax+324]
 000B029D    mov         edx,dword ptr [eax]
 000B029F    call        dword ptr [edx+0B8]
 000B02A5    mov         edx,dword ptr ds:[0B5A20];^gvar_000B6CFC:Boolean
 000B02AB    cmp         al,byte ptr [edx]
>000B02AD    je          000B02D3
 000B02AF    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000B02B4    mov         eax,dword ptr [eax]
 000B02B6    mov         eax,dword ptr [eax+324]
 000B02BC    mov         edx,dword ptr [eax]
 000B02BE    call        dword ptr [edx+0B8]
 000B02C4    mov         edx,dword ptr ds:[0B5A20];^gvar_000B6CFC:Boolean
 000B02CA    mov         byte ptr [edx],al
 000B02CC    mov         eax,ebx
 000B02CE    call        000AC990
 000B02D3    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000B02D8    mov         eax,dword ptr [eax]
 000B02DA    mov         eax,dword ptr [eax+36C]
 000B02E0    mov         edx,dword ptr [eax]
 000B02E2    call        dword ptr [edx+0B8]
 000B02E8    mov         edx,dword ptr ds:[0B5648];^gvar_000B7007:Boolean
 000B02EE    cmp         al,byte ptr [edx]
>000B02F0    je          000B0321
 000B02F2    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000B02F7    mov         eax,dword ptr [eax]
 000B02F9    mov         eax,dword ptr [eax+36C]
 000B02FF    mov         edx,dword ptr [eax]
 000B0301    call        dword ptr [edx+0B8]
 000B0307    mov         edx,dword ptr ds:[0B5648];^gvar_000B7007:Boolean
 000B030D    mov         byte ptr [edx],al
 000B030F    mov         edx,dword ptr ds:[0B5648];^gvar_000B7007:Boolean
 000B0315    mov         dl,byte ptr [edx]
 000B0317    xor         dl,1
 000B031A    mov         eax,ebx
 000B031C    call        000AE518
 000B0321    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000B0326    mov         eax,dword ptr [eax]
 000B0328    mov         esi,dword ptr [eax+318]
 000B032E    lea         edx,[ebp-8]
 000B0331    mov         eax,[000B5BC4];^gvar_000B6BA8:Longint
 000B0336    mov         eax,dword ptr [eax]
 000B0338    call        ColorToString
 000B033D    mov         edx,dword ptr [ebp-8]
 000B0340    mov         eax,dword ptr [esi+1EC]
 000B0346    mov         ecx,dword ptr [eax]
 000B0348    call        dword ptr [ecx+50]
 000B034B    mov         edi,eax
 000B034D    mov         eax,esi
 000B034F    call        TCustomComboBox.GetItemIndex
 000B0354    cmp         edi,eax
>000B0356    je          000B0388
 000B0358    mov         eax,esi
 000B035A    call        TCustomComboBox.GetItemIndex
 000B035F    mov         edx,eax
 000B0361    lea         ecx,[ebp-8]
 000B0364    mov         eax,dword ptr [esi+1EC]
 000B036A    mov         esi,dword ptr [eax]
 000B036C    call        dword ptr [esi+0C]
 000B036F    mov         eax,dword ptr [ebp-8]
 000B0372    call        StringToColor
 000B0377    mov         edx,dword ptr ds:[0B5BC4];^gvar_000B6BA8:Longint
 000B037D    mov         dword ptr [edx],eax
 000B037F    xor         edx,edx
 000B0381    xor         eax,eax
 000B0383    call        000996A4
 000B0388    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000B038D    mov         eax,dword ptr [eax]
 000B038F    mov         eax,dword ptr [eax+310]
 000B0395    call        TSpinEdit.GetValue
 000B039A    mov         esi,dword ptr [ebx+490]
 000B03A0    xor         edx,edx
 000B03A2    mov         dl,byte ptr [esi+28]
 000B03A5    cmp         eax,edx
>000B03A7    je          000B03C4
 000B03A9    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000B03AE    mov         eax,dword ptr [eax]
 000B03B0    mov         eax,dword ptr [eax+310]
 000B03B6    call        TSpinEdit.GetValue
 000B03BB    mov         edx,eax
 000B03BD    mov         eax,esi
 000B03BF    call        TMRUFiles.SetFileCount
 000B03C4    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000B03C9    mov         eax,dword ptr [eax]
 000B03CB    mov         eax,dword ptr [eax+308]
 000B03D1    mov         edx,dword ptr [eax]
 000B03D3    call        dword ptr [edx+0B8]
 000B03D9    mov         edx,dword ptr ds:[0B5744];^gvar_000B6BDA:Boolean
 000B03DF    cmp         al,byte ptr [edx]
>000B03E1    je          000B0400
 000B03E3    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000B03E8    mov         eax,dword ptr [eax]
 000B03EA    mov         eax,dword ptr [eax+308]
 000B03F0    mov         edx,dword ptr [eax]
 000B03F2    call        dword ptr [edx+0B8]
 000B03F8    mov         edx,dword ptr ds:[0B5744];^gvar_000B6BDA:Boolean
 000B03FE    mov         byte ptr [edx],al
 000B0400    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000B0405    mov         eax,dword ptr [eax]
 000B0407    mov         eax,dword ptr [eax+364]
 000B040D    mov         al,byte ptr [eax+1F8]
 000B0413    mov         edx,dword ptr ds:[0B5A50];^gvar_000B6BC5:Longint
 000B0419    mov         byte ptr [edx],al
 000B041B    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000B0420    mov         eax,dword ptr [eax]
 000B0422    mov         eax,dword ptr [eax+300]
 000B0428    mov         eax,dword ptr [eax+1F8]
 000B042E    mov         edx,dword ptr ds:[0B5B1C];^gvar_000B55F8:Longint
 000B0434    mov         dword ptr [edx],eax
 000B0436    mov         eax,ebx
 000B0438    call        000B2DE8
 000B043D    mov         eax,[000B5AD8];^gvar_000B7006:Boolean
 000B0442    cmp         byte ptr [eax],0
>000B0445    jne         000B044C
 000B0447    call        00099678
 000B044C    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000B0451    mov         eax,dword ptr [eax]
 000B0453    mov         eax,dword ptr [eax+340]
 000B0459    mov         edx,dword ptr [eax]
 000B045B    call        dword ptr [edx+0B8]
 000B0461    mov         edx,dword ptr ds:[0B59FC];^gvar_000B700A:Boolean
 000B0467    mov         byte ptr [edx],al
 000B0469    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000B046E    mov         eax,dword ptr [eax]
 000B0470    mov         eax,dword ptr [eax+360]
 000B0476    mov         edx,dword ptr [eax]
 000B0478    call        dword ptr [edx+0B8]
 000B047E    mov         edx,dword ptr ds:[0B57A8];^gvar_000B700B:Boolean
 000B0484    mov         byte ptr [edx],al
 000B0486    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000B048B    mov         eax,dword ptr [eax]
 000B048D    mov         eax,dword ptr [eax+344]
 000B0493    mov         edx,dword ptr [eax]
 000B0495    call        dword ptr [edx+0B8]
 000B049B    mov         edx,dword ptr ds:[0B5664];^gvar_000B700F:Boolean
 000B04A1    mov         byte ptr [edx],al
 000B04A3    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000B04A8    mov         eax,dword ptr [eax]
 000B04AA    mov         eax,dword ptr [eax+348]
 000B04B0    mov         edx,dword ptr [eax]
 000B04B2    call        dword ptr [edx+0B8]
 000B04B8    mov         edx,dword ptr ds:[0B5B18];^gvar_000B700C:Boolean
 000B04BE    mov         byte ptr [edx],al
 000B04C0    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000B04C5    mov         eax,dword ptr [eax]
 000B04C7    mov         eax,dword ptr [eax+34C]
 000B04CD    mov         edx,dword ptr [eax]
 000B04CF    call        dword ptr [edx+0B8]
 000B04D5    mov         edx,dword ptr ds:[0B59CC];^gvar_000B7010:Boolean
 000B04DB    mov         byte ptr [edx],al
 000B04DD    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000B04E2    mov         eax,dword ptr [eax]
 000B04E4    mov         eax,dword ptr [eax+350]
 000B04EA    mov         edx,dword ptr [eax]
 000B04EC    call        dword ptr [edx+0B8]
 000B04F2    mov         edx,dword ptr ds:[0B5920];^gvar_000B700D:Boolean
 000B04F8    mov         byte ptr [edx],al
 000B04FA    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000B04FF    mov         eax,dword ptr [eax]
 000B0501    mov         eax,dword ptr [eax+354]
 000B0507    mov         edx,dword ptr [eax]
 000B0509    call        dword ptr [edx+0B8]
 000B050F    mov         edx,dword ptr ds:[0B5980];^gvar_000B7011:Boolean
 000B0515    mov         byte ptr [edx],al
 000B0517    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000B051C    mov         eax,dword ptr [eax]
 000B051E    mov         eax,dword ptr [eax+358]
 000B0524    mov         edx,dword ptr [eax]
 000B0526    call        dword ptr [edx+0B8]
 000B052C    mov         edx,dword ptr ds:[0B56D0];^gvar_000B700E:Boolean
 000B0532    mov         byte ptr [edx],al
 000B0534    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000B0539    mov         eax,dword ptr [eax]
 000B053B    mov         eax,dword ptr [eax+35C]
 000B0541    mov         edx,dword ptr [eax]
 000B0543    call        dword ptr [edx+0B8]
 000B0549    mov         edx,dword ptr ds:[0B5A00];^gvar_000B7012:Boolean
 000B054F    mov         byte ptr [edx],al
 000B0551    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000B0556    mov         eax,dword ptr [eax]
 000B0558    mov         edx,7
 000B055D    call        0008806C
 000B0562    cmp         eax,dword ptr [ebp-4]
>000B0565    je          000B057D
 000B0567    mov         eax,[000B5634];^gvar_000B6B50:TFormInspect
 000B056C    cmp         dword ptr [eax],0
>000B056F    je          000B057D
 000B0571    mov         eax,[000B5634];^gvar_000B6B50:TFormInspect
 000B0576    mov         eax,dword ptr [eax]
 000B0578    call        00093A70
 000B057D    call        000983B8
 000B0582    xor         eax,eax
 000B0584    pop         edx
 000B0585    pop         ecx
 000B0586    pop         ecx
 000B0587    mov         dword ptr fs:[eax],edx
 000B058A    push        0B05A3
 000B058F    mov         eax,[000B5928];^gvar_000B6B48:TFormOpt
 000B0594    mov         eax,dword ptr [eax]
 000B0596    call        TCustomForm.Release
 000B059B    ret
>000B059C    jmp         @HandleFinally
>000B05A1    jmp         000B058F
 000B05A3    xor         eax,eax
 000B05A5    pop         edx
 000B05A6    pop         ecx
 000B05A7    pop         ecx
 000B05A8    mov         dword ptr fs:[eax],edx
 000B05AB    push        0B05D0
 000B05B0    lea         eax,[ebp-10]
 000B05B3    call        @LStrClr
 000B05B8    lea         eax,[ebp-0C]
 000B05BB    call        @LStrClr
 000B05C0    lea         eax,[ebp-8]
 000B05C3    call        @LStrClr
 000B05C8    ret
>000B05C9    jmp         @HandleFinally
>000B05CE    jmp         000B05B0
 000B05D0    pop         edi
 000B05D1    pop         esi
 000B05D2    pop         ebx
 000B05D3    mov         esp,ebp
 000B05D5    pop         ebp
 000B05D6    ret
end;*}

//000B05D8
procedure TFormMain.Options1Click(Sender:TObject);
begin
{*
 000B05D8    or          edx,0FFFFFFFF
 000B05DB    call        000AFCA4
 000B05E0    ret
*}
end;

//000B05E4
procedure TFormMain.Findagaindown1Click(Sender:TObject);
begin
{*
 000B05E4    push        ebp
 000B05E5    mov         ebp,esp
 000B05E7    add         esp,0FFFFFFF0
 000B05EA    push        ebx
 000B05EB    xor         ecx,ecx
 000B05ED    mov         dword ptr [ebp-0C],ecx
 000B05F0    mov         dword ptr [ebp-10],ecx
 000B05F3    mov         ebx,eax
 000B05F5    xor         eax,eax
 000B05F7    push        ebp
 000B05F8    push        0B06FE
 000B05FD    push        dword ptr fs:[eax]
 000B0600    mov         dword ptr fs:[eax],esp
 000B0603    test        edx,edx
>000B0605    jne         000B061A
 000B0607    mov         eax,[000B5B54];^gvar_000B6BF0:Boolean
 000B060C    cmp         byte ptr [eax],0
>000B060F    jne         000B061A
 000B0611    mov         dword ptr [ebp-8],1
>000B0618    jmp         000B0622
 000B061A    call        000981C4
 000B061F    mov         dword ptr [ebp-8],eax
 000B0622    lea         edx,[ebp-0C]
 000B0625    mov         eax,7FD
 000B062A    call        LoadStr;'Searching...'
 000B062F    mov         eax,dword ptr [ebp-0C]
 000B0632    push        eax
 000B0633    lea         edx,[ebp-10]
 000B0636    mov         eax,7FF
 000B063B    call        LoadStr;'Current file position'
 000B0640    mov         eax,dword ptr [ebp-10]
 000B0643    push        eax
 000B0644    push        1
 000B0646    push        1
 000B0648    mov         ecx,ebx
 000B064A    mov         dl,1
 000B064C    mov         eax,[0008C62C];TProgressBox
 000B0651    call        TProgressBox.Create;TProgressBox.Create
 000B0656    mov         edx,dword ptr ds:[0B5A9C];^gvar_000B6D00:TProgressBox
 000B065C    mov         dword ptr [edx],eax
 000B065E    xor         eax,eax
 000B0660    push        ebp
 000B0661    push        0B06AD
 000B0666    push        dword ptr fs:[eax]
 000B0669    mov         dword ptr fs:[eax],esp
 000B066C    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000B0671    mov         eax,dword ptr [eax]
 000B0673    call        TCustomForm.Show
 000B0678    push        1
 000B067A    push        0
 000B067C    lea         ecx,[ebp-2]
 000B067F    lea         edx,[ebp-1]
 000B0682    lea         eax,[ebp-8]
 000B0685    call        0009A450
 000B068A    xor         eax,eax
 000B068C    pop         edx
 000B068D    pop         ecx
 000B068E    pop         ecx
 000B068F    mov         dword ptr fs:[eax],edx
 000B0692    push        0B06B4
 000B0697    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000B069C    mov         eax,dword ptr [eax]
 000B069E    call        TObject.Free
 000B06A3    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000B06A8    xor         edx,edx
 000B06AA    mov         dword ptr [eax],edx
 000B06AC    ret
>000B06AD    jmp         @HandleFinally
>000B06B2    jmp         000B0697
 000B06B4    cmp         byte ptr [ebp-2],0
>000B06B8    jne         000B06E3
 000B06BA    cmp         byte ptr [ebp-1],0
>000B06BE    jne         000B06D7
 000B06C0    lea         edx,[ebp-0C]
 000B06C3    mov         eax,7FE
 000B06C8    call        LoadStr;'String not found'
 000B06CD    mov         eax,dword ptr [ebp-0C]
 000B06D0    call        0008D08C
>000B06D5    jmp         000B06E3
 000B06D7    mov         cl,1
 000B06D9    mov         dl,1
 000B06DB    mov         eax,dword ptr [ebp-8]
 000B06DE    call        000998B0
 000B06E3    xor         eax,eax
 000B06E5    pop         edx
 000B06E6    pop         ecx
 000B06E7    pop         ecx
 000B06E8    mov         dword ptr fs:[eax],edx
 000B06EB    push        0B0705
 000B06F0    lea         eax,[ebp-10]
 000B06F3    mov         edx,2
 000B06F8    call        @LStrArrayClr
 000B06FD    ret
>000B06FE    jmp         @HandleFinally
>000B0703    jmp         000B06F0
 000B0705    pop         ebx
 000B0706    mov         esp,ebp
 000B0708    pop         ebp
 000B0709    ret
*}
end;

//000B070C
procedure TFormMain.Findagainup1Click(Sender:TObject);
begin
{*
 000B070C    push        ebp
 000B070D    mov         ebp,esp
 000B070F    add         esp,0FFFFFFF0
 000B0712    push        ebx
 000B0713    xor         ecx,ecx
 000B0715    mov         dword ptr [ebp-0C],ecx
 000B0718    mov         dword ptr [ebp-10],ecx
 000B071B    mov         ebx,eax
 000B071D    xor         eax,eax
 000B071F    push        ebp
 000B0720    push        0B0825
 000B0725    push        dword ptr fs:[eax]
 000B0728    mov         dword ptr fs:[eax],esp
 000B072B    test        edx,edx
>000B072D    jne         000B0745
 000B072F    mov         eax,[000B5B54];^gvar_000B6BF0:Boolean
 000B0734    cmp         byte ptr [eax],0
>000B0737    jne         000B0745
 000B0739    mov         eax,[000B5BA0];^gvar_000B6BAC:Single
 000B073E    mov         eax,dword ptr [eax]
 000B0740    mov         dword ptr [ebp-8],eax
>000B0743    jmp         000B074D
 000B0745    call        000981C4
 000B074A    mov         dword ptr [ebp-8],eax
 000B074D    lea         edx,[ebp-0C]
 000B0750    mov         eax,7FD
 000B0755    call        LoadStr;'Searching...'
 000B075A    mov         eax,dword ptr [ebp-0C]
 000B075D    push        eax
 000B075E    lea         edx,[ebp-10]
 000B0761    mov         eax,7FF
 000B0766    call        LoadStr;'Current file position'
 000B076B    mov         eax,dword ptr [ebp-10]
 000B076E    push        eax
 000B076F    push        1
 000B0771    push        1
 000B0773    mov         ecx,ebx
 000B0775    mov         dl,1
 000B0777    mov         eax,[0008C62C];TProgressBox
 000B077C    call        TProgressBox.Create;TProgressBox.Create
 000B0781    mov         edx,dword ptr ds:[0B5A9C];^gvar_000B6D00:TProgressBox
 000B0787    mov         dword ptr [edx],eax
 000B0789    xor         eax,eax
 000B078B    push        ebp
 000B078C    push        0B07D4
 000B0791    push        dword ptr fs:[eax]
 000B0794    mov         dword ptr fs:[eax],esp
 000B0797    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000B079C    mov         eax,dword ptr [eax]
 000B079E    call        TCustomForm.Show
 000B07A3    lea         ecx,[ebp-2]
 000B07A6    lea         edx,[ebp-1]
 000B07A9    lea         eax,[ebp-8]
 000B07AC    call        0009A540
 000B07B1    xor         eax,eax
 000B07B3    pop         edx
 000B07B4    pop         ecx
 000B07B5    pop         ecx
 000B07B6    mov         dword ptr fs:[eax],edx
 000B07B9    push        0B07DB
 000B07BE    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000B07C3    mov         eax,dword ptr [eax]
 000B07C5    call        TObject.Free
 000B07CA    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000B07CF    xor         edx,edx
 000B07D1    mov         dword ptr [eax],edx
 000B07D3    ret
>000B07D4    jmp         @HandleFinally
>000B07D9    jmp         000B07BE
 000B07DB    cmp         byte ptr [ebp-2],0
>000B07DF    jne         000B080A
 000B07E1    cmp         byte ptr [ebp-1],0
>000B07E5    jne         000B07FE
 000B07E7    lea         edx,[ebp-0C]
 000B07EA    mov         eax,7FE
 000B07EF    call        LoadStr;'String not found'
 000B07F4    mov         eax,dword ptr [ebp-0C]
 000B07F7    call        0008D08C
>000B07FC    jmp         000B080A
 000B07FE    mov         cl,1
 000B0800    mov         dl,1
 000B0802    mov         eax,dword ptr [ebp-8]
 000B0805    call        000998B0
 000B080A    xor         eax,eax
 000B080C    pop         edx
 000B080D    pop         ecx
 000B080E    pop         ecx
 000B080F    mov         dword ptr fs:[eax],edx
 000B0812    push        0B082C
 000B0817    lea         eax,[ebp-10]
 000B081A    mov         edx,2
 000B081F    call        @LStrArrayClr
 000B0824    ret
>000B0825    jmp         @HandleFinally
>000B082A    jmp         000B0817
 000B082C    pop         ebx
 000B082D    mov         esp,ebp
 000B082F    pop         ebp
 000B0830    ret
*}
end;

//000B0834
procedure TFormMain.Find1Click(Sender:TObject);
begin
{*
 000B0834    push        ebp
 000B0835    mov         ebp,esp
 000B0837    add         esp,0FFFFFFF4
 000B083A    push        ebx
 000B083B    xor         ecx,ecx
 000B083D    mov         dword ptr [ebp-4],ecx
 000B0840    mov         ebx,eax
 000B0842    xor         eax,eax
 000B0844    push        ebp
 000B0845    push        0B0B55
 000B084A    push        dword ptr fs:[eax]
 000B084D    mov         dword ptr fs:[eax],esp
 000B0850    mov         ecx,ebx
 000B0852    mov         dl,1
 000B0854    mov         eax,[0009E8D8];TFormFind
 000B0859    call        TCustomForm.Create;TFormFind.Create
 000B085E    mov         edx,dword ptr ds:[0B573C];^gvar_000B7048:TFormFind
 000B0864    mov         dword ptr [edx],eax
 000B0866    xor         eax,eax
 000B0868    push        ebp
 000B0869    push        0B0B38
 000B086E    push        dword ptr fs:[eax]
 000B0871    mov         dword ptr fs:[eax],esp
 000B0874    lea         edx,[ebp-4]
 000B0877    mov         eax,800
 000B087C    call        LoadStr;'Find'
 000B0881    mov         edx,dword ptr [ebp-4]
 000B0884    mov         eax,[000B573C];^gvar_000B7048:TFormFind
 000B0889    mov         eax,dword ptr [eax]
 000B088B    call        TControl.SetText
 000B0890    mov         edx,dword ptr ds:[0B5AA4];^gvar_000B6BB5:Boolean
 000B0896    mov         dl,byte ptr [edx]
 000B0898    mov         eax,[000B573C];^gvar_000B7048:TFormFind
 000B089D    mov         eax,dword ptr [eax]
 000B089F    mov         eax,dword ptr [eax+2D8]
 000B08A5    mov         ecx,dword ptr [eax]
 000B08A7    call        dword ptr [ecx+0BC]
 000B08AD    mov         edx,dword ptr ds:[0B5794];^gvar_000B6BC6:Boolean
 000B08B3    mov         dl,byte ptr [edx]
 000B08B5    mov         eax,[000B573C];^gvar_000B7048:TFormFind
 000B08BA    mov         eax,dword ptr [eax]
 000B08BC    mov         eax,dword ptr [eax+2E8]
 000B08C2    mov         ecx,dword ptr [eax]
 000B08C4    call        dword ptr [ecx+0BC]
 000B08CA    lea         eax,[ebp-4]
 000B08CD    mov         edx,dword ptr ds:[0B5C04];^gvar_000B6BC7:AnsiString
 000B08D3    mov         dl,byte ptr [edx]
 000B08D5    call        @LStrFromChar
 000B08DA    mov         edx,dword ptr [ebp-4]
 000B08DD    mov         eax,[000B573C];^gvar_000B7048:TFormFind
 000B08E2    mov         eax,dword ptr [eax]
 000B08E4    mov         eax,dword ptr [eax+2EC]
 000B08EA    call        TCMByteEdit.SetASCII
 000B08EF    lea         eax,[ebp-4]
 000B08F2    mov         edx,dword ptr ds:[0B5C04];^gvar_000B6BC7:AnsiString
 000B08F8    mov         dl,byte ptr [edx]
 000B08FA    call        @LStrFromChar
 000B08FF    mov         edx,dword ptr [ebp-4]
 000B0902    mov         eax,[000B573C];^gvar_000B7048:TFormFind
 000B0907    mov         eax,dword ptr [eax]
 000B0909    mov         eax,dword ptr [eax+2F0]
 000B090F    call        TControl.SetText
 000B0914    mov         edx,dword ptr ds:[0B5A4C];^gvar_000B6BD4:Boolean
 000B091A    mov         dl,byte ptr [edx]
 000B091C    mov         eax,[000B573C];^gvar_000B7048:TFormFind
 000B0921    mov         eax,dword ptr [eax]
 000B0923    mov         eax,dword ptr [eax+314]
 000B0929    mov         ecx,dword ptr [eax]
 000B092B    call        dword ptr [ecx+0BC]
 000B0931    mov         edx,dword ptr ds:[0B58B4];^gvar_000B6BD8:Boolean
 000B0937    mov         dl,byte ptr [edx]
 000B0939    mov         eax,[000B573C];^gvar_000B7048:TFormFind
 000B093E    mov         eax,dword ptr [eax]
 000B0940    mov         eax,dword ptr [eax+31C]
 000B0946    mov         ecx,dword ptr [eax]
 000B0948    call        dword ptr [ecx+0BC]
 000B094E    mov         edx,dword ptr ds:[0B59EC];^gvar_000B6BCC:Boolean
 000B0954    mov         dl,byte ptr [edx]
 000B0956    xor         dl,1
 000B0959    mov         eax,[000B573C];^gvar_000B7048:TFormFind
 000B095E    mov         eax,dword ptr [eax]
 000B0960    mov         eax,dword ptr [eax+2E4]
 000B0966    mov         ecx,dword ptr [eax]
 000B0968    call        dword ptr [ecx+0BC]
 000B096E    mov         edx,dword ptr ds:[0B5B54];^gvar_000B6BF0:Boolean
 000B0974    mov         dl,byte ptr [edx]
 000B0976    xor         dl,1
 000B0979    mov         eax,[000B573C];^gvar_000B7048:TFormFind
 000B097E    mov         eax,dword ptr [eax]
 000B0980    mov         eax,dword ptr [eax+300]
 000B0986    mov         ecx,dword ptr [eax]
 000B0988    call        dword ptr [ecx+0BC]
 000B098E    mov         eax,[000B573C];^gvar_000B7048:TFormFind
 000B0993    mov         eax,dword ptr [eax]
 000B0995    mov         edx,dword ptr [eax]
 000B0997    call        dword ptr [edx+0CC]
 000B099D    dec         eax
>000B099E    jne         000B0ADC
 000B09A4    mov         eax,[000B573C];^gvar_000B7048:TFormFind
 000B09A9    mov         eax,dword ptr [eax]
 000B09AB    mov         eax,dword ptr [eax+2D8]
 000B09B1    mov         edx,dword ptr [eax]
 000B09B3    call        dword ptr [edx+0B8]
 000B09B9    mov         edx,dword ptr ds:[0B5AA4];^gvar_000B6BB5:Boolean
 000B09BF    mov         byte ptr [edx],al
 000B09C1    mov         eax,[000B573C];^gvar_000B7048:TFormFind
 000B09C6    mov         eax,dword ptr [eax]
 000B09C8    mov         eax,dword ptr [eax+2E8]
 000B09CE    mov         edx,dword ptr [eax]
 000B09D0    call        dword ptr [edx+0B8]
 000B09D6    mov         edx,dword ptr ds:[0B5794];^gvar_000B6BC6:Boolean
 000B09DC    mov         byte ptr [edx],al
 000B09DE    lea         edx,[ebp-4]
 000B09E1    mov         eax,[000B573C];^gvar_000B7048:TFormFind
 000B09E6    mov         eax,dword ptr [eax]
 000B09E8    mov         eax,dword ptr [eax+2EC]
 000B09EE    call        TCMByteEdit.GetASCII
 000B09F3    mov         eax,dword ptr [ebp-4]
 000B09F6    mov         al,byte ptr [eax]
 000B09F8    mov         edx,dword ptr ds:[0B5C04];^gvar_000B6BC7:AnsiString
 000B09FE    mov         byte ptr [edx],al
 000B0A00    mov         eax,[000B573C];^gvar_000B7048:TFormFind
 000B0A05    mov         eax,dword ptr [eax]
 000B0A07    mov         eax,dword ptr [eax+314]
 000B0A0D    mov         edx,dword ptr [eax]
 000B0A0F    call        dword ptr [edx+0B8]
 000B0A15    mov         edx,dword ptr ds:[0B5A4C];^gvar_000B6BD4:Boolean
 000B0A1B    mov         byte ptr [edx],al
 000B0A1D    mov         eax,[000B573C];^gvar_000B7048:TFormFind
 000B0A22    mov         eax,dword ptr [eax]
 000B0A24    mov         eax,dword ptr [eax+2E0]
 000B0A2A    mov         edx,dword ptr [eax]
 000B0A2C    call        dword ptr [edx+0B8]
 000B0A32    mov         edx,dword ptr ds:[0B59EC];^gvar_000B6BCC:Boolean
 000B0A38    mov         byte ptr [edx],al
 000B0A3A    mov         eax,[000B573C];^gvar_000B7048:TFormFind
 000B0A3F    mov         eax,dword ptr [eax]
 000B0A41    mov         eax,dword ptr [eax+31C]
 000B0A47    mov         edx,dword ptr [eax]
 000B0A49    call        dword ptr [edx+0B8]
 000B0A4F    mov         edx,dword ptr ds:[0B58B4];^gvar_000B6BD8:Boolean
 000B0A55    mov         byte ptr [edx],al
 000B0A57    mov         eax,[000B573C];^gvar_000B7048:TFormFind
 000B0A5C    mov         eax,dword ptr [eax]
 000B0A5E    mov         eax,dword ptr [eax+2FC]
 000B0A64    mov         edx,dword ptr [eax]
 000B0A66    call        dword ptr [edx+0B8]
 000B0A6C    mov         edx,dword ptr ds:[0B5B54];^gvar_000B6BF0:Boolean
 000B0A72    mov         byte ptr [edx],al
 000B0A74    mov         eax,[000B57E4];^gvar_000B6BB8:AnsiString
 000B0A79    mov         edx,dword ptr ds:[0B573C];^gvar_000B7048:TFormFind
 000B0A7F    mov         edx,dword ptr [edx]
 000B0A81    mov         edx,dword ptr [edx+320]
 000B0A87    call        @LStrAsg
 000B0A8C    mov         eax,[000B573C];^gvar_000B7048:TFormFind
 000B0A91    mov         eax,dword ptr [eax]
 000B0A93    mov         eax,dword ptr [eax+2E0]
 000B0A99    mov         edx,dword ptr [eax]
 000B0A9B    call        dword ptr [edx+0B8]
 000B0AA1    test        al,al
>000B0AA3    je          000B0AB0
 000B0AA5    xor         edx,edx
 000B0AA7    mov         eax,ebx
 000B0AA9    call        TFormMain.Findagaindown1Click
>000B0AAE    jmp         000B0AB9
 000B0AB0    xor         edx,edx
 000B0AB2    mov         eax,ebx
 000B0AB4    call        TFormMain.Findagainup1Click
 000B0AB9    mov         eax,dword ptr [ebx+380];TFormMain.Findagaindown1:TMenuItem
 000B0ABF    mov         dword ptr [ebp-0C],eax
 000B0AC2    mov         eax,dword ptr [ebx+384];TFormMain.Findagainup1:TMenuItem
 000B0AC8    mov         dword ptr [ebp-8],eax
 000B0ACB    lea         eax,[ebp-0C]
 000B0ACE    mov         cl,1
 000B0AD0    mov         edx,1
 000B0AD5    call        00099514
>000B0ADA    jmp         000B0AFD
 000B0ADC    mov         eax,dword ptr [ebx+380];TFormMain.Findagaindown1:TMenuItem
 000B0AE2    mov         dword ptr [ebp-0C],eax
 000B0AE5    mov         eax,dword ptr [ebx+384];TFormMain.Findagainup1:TMenuItem
 000B0AEB    mov         dword ptr [ebp-8],eax
 000B0AEE    lea         eax,[ebp-0C]
 000B0AF1    xor         ecx,ecx
 000B0AF3    mov         edx,1
 000B0AF8    call        00099514
 000B0AFD    mov         eax,dword ptr [ebx+394];TFormMain.Replaceagaindown1:TMenuItem
 000B0B03    mov         dword ptr [ebp-0C],eax
 000B0B06    mov         eax,dword ptr [ebx+398];TFormMain.Replaceundo1:TMenuItem
 000B0B0C    mov         dword ptr [ebp-8],eax
 000B0B0F    lea         eax,[ebp-0C]
 000B0B12    xor         ecx,ecx
 000B0B14    mov         edx,1
 000B0B19    call        00099514
 000B0B1E    xor         eax,eax
 000B0B20    pop         edx
 000B0B21    pop         ecx
 000B0B22    pop         ecx
 000B0B23    mov         dword ptr fs:[eax],edx
 000B0B26    push        0B0B3F
 000B0B2B    mov         eax,[000B573C];^gvar_000B7048:TFormFind
 000B0B30    mov         eax,dword ptr [eax]
 000B0B32    call        TCustomForm.Release
 000B0B37    ret
>000B0B38    jmp         @HandleFinally
>000B0B3D    jmp         000B0B2B
 000B0B3F    xor         eax,eax
 000B0B41    pop         edx
 000B0B42    pop         ecx
 000B0B43    pop         ecx
 000B0B44    mov         dword ptr fs:[eax],edx
 000B0B47    push        0B0B5C
 000B0B4C    lea         eax,[ebp-4]
 000B0B4F    call        @LStrClr
 000B0B54    ret
>000B0B55    jmp         @HandleFinally
>000B0B5A    jmp         000B0B4C
 000B0B5C    pop         ebx
 000B0B5D    mov         esp,ebp
 000B0B5F    pop         ebp
 000B0B60    ret
*}
end;

//000B0B64
procedure TFormMain.Count1Click(Sender:TObject);
begin
{*
 000B0B64    push        ebp
 000B0B65    mov         ebp,esp
 000B0B67    add         esp,0FFFFFFDC
 000B0B6A    push        ebx
 000B0B6B    xor         ecx,ecx
 000B0B6D    mov         dword ptr [ebp-0C],ecx
 000B0B70    mov         dword ptr [ebp-10],ecx
 000B0B73    mov         ebx,eax
 000B0B75    xor         eax,eax
 000B0B77    push        ebp
 000B0B78    push        0B0F32
 000B0B7D    push        dword ptr fs:[eax]
 000B0B80    mov         dword ptr fs:[eax],esp
 000B0B83    mov         ecx,ebx
 000B0B85    mov         dl,1
 000B0B87    mov         eax,[0009E8D8];TFormFind
 000B0B8C    call        TCustomForm.Create;TFormFind.Create
 000B0B91    mov         edx,dword ptr ds:[0B573C];^gvar_000B7048:TFormFind
 000B0B97    mov         dword ptr [edx],eax
 000B0B99    xor         eax,eax
 000B0B9B    push        ebp
 000B0B9C    push        0B0F10
 000B0BA1    push        dword ptr fs:[eax]
 000B0BA4    mov         dword ptr fs:[eax],esp
 000B0BA7    lea         edx,[ebp-0C]
 000B0BAA    mov         eax,801
 000B0BAF    call        LoadStr;'Count'
 000B0BB4    mov         edx,dword ptr [ebp-0C]
 000B0BB7    mov         eax,[000B573C];^gvar_000B7048:TFormFind
 000B0BBC    mov         eax,dword ptr [eax]
 000B0BBE    call        TControl.SetText
 000B0BC3    mov         edx,dword ptr ds:[0B5AA4];^gvar_000B6BB5:Boolean
 000B0BC9    mov         dl,byte ptr [edx]
 000B0BCB    mov         eax,[000B573C];^gvar_000B7048:TFormFind
 000B0BD0    mov         eax,dword ptr [eax]
 000B0BD2    mov         eax,dword ptr [eax+2D8]
 000B0BD8    mov         ecx,dword ptr [eax]
 000B0BDA    call        dword ptr [ecx+0BC]
 000B0BE0    mov         edx,dword ptr ds:[0B5794];^gvar_000B6BC6:Boolean
 000B0BE6    mov         dl,byte ptr [edx]
 000B0BE8    mov         eax,[000B573C];^gvar_000B7048:TFormFind
 000B0BED    mov         eax,dword ptr [eax]
 000B0BEF    mov         eax,dword ptr [eax+2E8]
 000B0BF5    mov         ecx,dword ptr [eax]
 000B0BF7    call        dword ptr [ecx+0BC]
 000B0BFD    lea         eax,[ebp-0C]
 000B0C00    mov         edx,dword ptr ds:[0B5C04];^gvar_000B6BC7:AnsiString
 000B0C06    mov         dl,byte ptr [edx]
 000B0C08    call        @LStrFromChar
 000B0C0D    mov         edx,dword ptr [ebp-0C]
 000B0C10    mov         eax,[000B573C];^gvar_000B7048:TFormFind
 000B0C15    mov         eax,dword ptr [eax]
 000B0C17    mov         eax,dword ptr [eax+2EC]
 000B0C1D    call        TCMByteEdit.SetASCII
 000B0C22    lea         eax,[ebp-0C]
 000B0C25    mov         edx,dword ptr ds:[0B5C04];^gvar_000B6BC7:AnsiString
 000B0C2B    mov         dl,byte ptr [edx]
 000B0C2D    call        @LStrFromChar
 000B0C32    mov         edx,dword ptr [ebp-0C]
 000B0C35    mov         eax,[000B573C];^gvar_000B7048:TFormFind
 000B0C3A    mov         eax,dword ptr [eax]
 000B0C3C    mov         eax,dword ptr [eax+2F0]
 000B0C42    call        TControl.SetText
 000B0C47    mov         edx,dword ptr ds:[0B5A4C];^gvar_000B6BD4:Boolean
 000B0C4D    mov         dl,byte ptr [edx]
 000B0C4F    mov         eax,[000B573C];^gvar_000B7048:TFormFind
 000B0C54    mov         eax,dword ptr [eax]
 000B0C56    mov         eax,dword ptr [eax+314]
 000B0C5C    mov         ecx,dword ptr [eax]
 000B0C5E    call        dword ptr [ecx+0BC]
 000B0C64    mov         edx,dword ptr ds:[0B58B4];^gvar_000B6BD8:Boolean
 000B0C6A    mov         dl,byte ptr [edx]
 000B0C6C    mov         eax,[000B573C];^gvar_000B7048:TFormFind
 000B0C71    mov         eax,dword ptr [eax]
 000B0C73    mov         eax,dword ptr [eax+31C]
 000B0C79    mov         ecx,dword ptr [eax]
 000B0C7B    call        dword ptr [ecx+0BC]
 000B0C81    mov         edx,dword ptr ds:[0B59EC];^gvar_000B6BCC:Boolean
 000B0C87    mov         dl,byte ptr [edx]
 000B0C89    xor         dl,1
 000B0C8C    mov         eax,[000B573C];^gvar_000B7048:TFormFind
 000B0C91    mov         eax,dword ptr [eax]
 000B0C93    mov         eax,dword ptr [eax+2E4]
 000B0C99    mov         ecx,dword ptr [eax]
 000B0C9B    call        dword ptr [ecx+0BC]
 000B0CA1    mov         edx,dword ptr ds:[0B5B54];^gvar_000B6BF0:Boolean
 000B0CA7    mov         dl,byte ptr [edx]
 000B0CA9    xor         dl,1
 000B0CAC    mov         eax,[000B573C];^gvar_000B7048:TFormFind
 000B0CB1    mov         eax,dword ptr [eax]
 000B0CB3    mov         eax,dword ptr [eax+300]
 000B0CB9    mov         ecx,dword ptr [eax]
 000B0CBB    call        dword ptr [ecx+0BC]
 000B0CC1    mov         eax,[000B573C];^gvar_000B7048:TFormFind
 000B0CC6    mov         eax,dword ptr [eax]
 000B0CC8    mov         edx,dword ptr [eax]
 000B0CCA    call        dword ptr [edx+0CC]
 000B0CD0    dec         eax
>000B0CD1    jne         000B0EF6
 000B0CD7    mov         eax,[000B573C];^gvar_000B7048:TFormFind
 000B0CDC    mov         eax,dword ptr [eax]
 000B0CDE    mov         eax,dword ptr [eax+2D8]
 000B0CE4    mov         edx,dword ptr [eax]
 000B0CE6    call        dword ptr [edx+0B8]
 000B0CEC    mov         edx,dword ptr ds:[0B5AA4];^gvar_000B6BB5:Boolean
 000B0CF2    mov         byte ptr [edx],al
 000B0CF4    mov         eax,[000B573C];^gvar_000B7048:TFormFind
 000B0CF9    mov         eax,dword ptr [eax]
 000B0CFB    mov         eax,dword ptr [eax+2E8]
 000B0D01    mov         edx,dword ptr [eax]
 000B0D03    call        dword ptr [edx+0B8]
 000B0D09    mov         edx,dword ptr ds:[0B5794];^gvar_000B6BC6:Boolean
 000B0D0F    mov         byte ptr [edx],al
 000B0D11    lea         edx,[ebp-0C]
 000B0D14    mov         eax,[000B573C];^gvar_000B7048:TFormFind
 000B0D19    mov         eax,dword ptr [eax]
 000B0D1B    mov         eax,dword ptr [eax+2EC]
 000B0D21    call        TCMByteEdit.GetASCII
 000B0D26    mov         eax,dword ptr [ebp-0C]
 000B0D29    mov         al,byte ptr [eax]
 000B0D2B    mov         edx,dword ptr ds:[0B5C04];^gvar_000B6BC7:AnsiString
 000B0D31    mov         byte ptr [edx],al
 000B0D33    mov         eax,[000B573C];^gvar_000B7048:TFormFind
 000B0D38    mov         eax,dword ptr [eax]
 000B0D3A    mov         eax,dword ptr [eax+314]
 000B0D40    mov         edx,dword ptr [eax]
 000B0D42    call        dword ptr [edx+0B8]
 000B0D48    mov         edx,dword ptr ds:[0B5A4C];^gvar_000B6BD4:Boolean
 000B0D4E    mov         byte ptr [edx],al
 000B0D50    mov         eax,[000B573C];^gvar_000B7048:TFormFind
 000B0D55    mov         eax,dword ptr [eax]
 000B0D57    mov         eax,dword ptr [eax+31C]
 000B0D5D    mov         edx,dword ptr [eax]
 000B0D5F    call        dword ptr [edx+0B8]
 000B0D65    mov         edx,dword ptr ds:[0B58B4];^gvar_000B6BD8:Boolean
 000B0D6B    mov         byte ptr [edx],al
 000B0D6D    mov         eax,[000B573C];^gvar_000B7048:TFormFind
 000B0D72    mov         eax,dword ptr [eax]
 000B0D74    mov         eax,dword ptr [eax+2E0]
 000B0D7A    mov         edx,dword ptr [eax]
 000B0D7C    call        dword ptr [edx+0B8]
 000B0D82    mov         edx,dword ptr ds:[0B59EC];^gvar_000B6BCC:Boolean
 000B0D88    mov         byte ptr [edx],al
 000B0D8A    mov         eax,[000B573C];^gvar_000B7048:TFormFind
 000B0D8F    mov         eax,dword ptr [eax]
 000B0D91    mov         eax,dword ptr [eax+2FC]
 000B0D97    mov         edx,dword ptr [eax]
 000B0D99    call        dword ptr [edx+0B8]
 000B0D9F    mov         edx,dword ptr ds:[0B5B54];^gvar_000B6BF0:Boolean
 000B0DA5    mov         byte ptr [edx],al
 000B0DA7    mov         eax,[000B57E4];^gvar_000B6BB8:AnsiString
 000B0DAC    mov         edx,dword ptr ds:[0B573C];^gvar_000B7048:TFormFind
 000B0DB2    mov         edx,dword ptr [edx]
 000B0DB4    mov         edx,dword ptr [edx+320]
 000B0DBA    call        @LStrAsg
 000B0DBF    mov         eax,[000B5B54];^gvar_000B6BF0:Boolean
 000B0DC4    cmp         byte ptr [eax],0
>000B0DC7    jne         000B0DE4
 000B0DC9    mov         eax,[000B59EC];^gvar_000B6BCC:Boolean
 000B0DCE    cmp         byte ptr [eax],0
>000B0DD1    je          000B0DDA
 000B0DD3    mov         ebx,1
>000B0DD8    jmp         000B0DEB
 000B0DDA    mov         ebx,dword ptr ds:[0B5BA0];^gvar_000B6BAC:Single
 000B0DE0    mov         ebx,dword ptr [ebx]
>000B0DE2    jmp         000B0DEB
 000B0DE4    call        000981C4
 000B0DE9    mov         ebx,eax
 000B0DEB    lea         edx,[ebp-0C]
 000B0DEE    mov         eax,7FD
 000B0DF3    call        LoadStr;'Searching...'
 000B0DF8    mov         eax,dword ptr [ebp-0C]
 000B0DFB    push        eax
 000B0DFC    lea         edx,[ebp-10]
 000B0DFF    mov         eax,7FF
 000B0E04    call        LoadStr;'Current file position'
 000B0E09    mov         eax,dword ptr [ebp-10]
 000B0E0C    push        eax
 000B0E0D    push        1
 000B0E0F    push        1
 000B0E11    mov         ecx,dword ptr ds:[0B70A4];gvar_000B70A4:TFormMain
 000B0E17    mov         dl,1
 000B0E19    mov         eax,[0008C62C];TProgressBox
 000B0E1E    call        TProgressBox.Create;TProgressBox.Create
 000B0E23    mov         edx,dword ptr ds:[0B5A9C];^gvar_000B6D00:TProgressBox
 000B0E29    mov         dword ptr [edx],eax
 000B0E2B    xor         eax,eax
 000B0E2D    push        ebp
 000B0E2E    push        0B0E8A
 000B0E33    push        dword ptr fs:[eax]
 000B0E36    mov         dword ptr fs:[eax],esp
 000B0E39    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000B0E3E    mov         eax,dword ptr [eax]
 000B0E40    call        TCustomForm.Show
 000B0E45    mov         eax,[000B573C];^gvar_000B7048:TFormFind
 000B0E4A    mov         eax,dword ptr [eax]
 000B0E4C    mov         eax,dword ptr [eax+2E0]
 000B0E52    mov         edx,dword ptr [eax]
 000B0E54    call        dword ptr [edx+0B8]
 000B0E5A    lea         ecx,[ebp-4]
 000B0E5D    mov         edx,ebx
 000B0E5F    call        0009A5A4
 000B0E64    mov         byte ptr [ebp-5],al
 000B0E67    xor         eax,eax
 000B0E69    pop         edx
 000B0E6A    pop         ecx
 000B0E6B    pop         ecx
 000B0E6C    mov         dword ptr fs:[eax],edx
 000B0E6F    push        0B0E91
 000B0E74    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000B0E79    mov         eax,dword ptr [eax]
 000B0E7B    call        TObject.Free
 000B0E80    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000B0E85    xor         edx,edx
 000B0E87    mov         dword ptr [eax],edx
 000B0E89    ret
>000B0E8A    jmp         @HandleFinally
>000B0E8F    jmp         000B0E74
 000B0E91    cmp         byte ptr [ebp-5],0
>000B0E95    je          000B0EF6
 000B0E97    mov         eax,[000B5990];^gvar_000B6B94
 000B0E9C    cmp         dword ptr [eax],0
>000B0E9F    jle         000B0EB1
 000B0EA1    mov         eax,[000B5990];^gvar_000B6B94
 000B0EA6    mov         eax,dword ptr [eax]
 000B0EA8    mov         cl,1
 000B0EAA    mov         dl,1
 000B0EAC    call        000998B0
 000B0EB1    lea         eax,[ebp-0C]
 000B0EB4    push        eax
 000B0EB5    fild        dword ptr [ebp-4]
 000B0EB8    call        @INT
 000B0EBD    fstp        tbyte ptr [ebp-24]
 000B0EC0    wait
 000B0EC1    lea         eax,[ebp-24]
 000B0EC4    mov         dword ptr [ebp-18],eax
 000B0EC7    mov         byte ptr [ebp-14],3
 000B0ECB    lea         edx,[ebp-18]
 000B0ECE    xor         ecx,ecx
 000B0ED0    mov         eax,802
 000B0ED5    call        FmtLoadStr;'Occurences found:
%.0n'
 000B0EDA    mov         eax,dword ptr [ebp-0C]
 000B0EDD    push        eax
 000B0EDE    lea         edx,[ebp-10]
 000B0EE1    mov         eax,856
 000B0EE6    call        LoadStr;'Information'
 000B0EEB    mov         eax,dword ptr [ebp-10]
 000B0EEE    xor         ecx,ecx
 000B0EF0    pop         edx
 000B0EF1    call        0008D880
 000B0EF6    xor         eax,eax
 000B0EF8    pop         edx
 000B0EF9    pop         ecx
 000B0EFA    pop         ecx
 000B0EFB    mov         dword ptr fs:[eax],edx
 000B0EFE    push        0B0F17
 000B0F03    mov         eax,[000B573C];^gvar_000B7048:TFormFind
 000B0F08    mov         eax,dword ptr [eax]
 000B0F0A    call        TCustomForm.Release
 000B0F0F    ret
>000B0F10    jmp         @HandleFinally
>000B0F15    jmp         000B0F03
 000B0F17    xor         eax,eax
 000B0F19    pop         edx
 000B0F1A    pop         ecx
 000B0F1B    pop         ecx
 000B0F1C    mov         dword ptr fs:[eax],edx
 000B0F1F    push        0B0F39
 000B0F24    lea         eax,[ebp-10]
 000B0F27    mov         edx,2
 000B0F2C    call        @LStrArrayClr
 000B0F31    ret
>000B0F32    jmp         @HandleFinally
>000B0F37    jmp         000B0F24
 000B0F39    pop         ebx
 000B0F3A    mov         esp,ebp
 000B0F3C    pop         ebp
 000B0F3D    ret
*}
end;

//000B0F40
{*procedure sub_000B0F40(?:TFormMain; ?:TObject; ?:?; ?:?);
begin
 000B0F40    push        ebp
 000B0F41    mov         ebp,esp
 000B0F43    add         esp,0FFFFFFE4
 000B0F46    push        ebx
 000B0F47    xor         ebx,ebx
 000B0F49    mov         dword ptr [ebp-14],ebx
 000B0F4C    mov         dword ptr [ebp-18],ebx
 000B0F4F    mov         dword ptr [ebp-0C],ecx
 000B0F52    mov         dword ptr [ebp-8],edx
 000B0F55    mov         dword ptr [ebp-4],eax
 000B0F58    xor         eax,eax
 000B0F5A    push        ebp
 000B0F5B    push        0B10EE
 000B0F60    push        dword ptr fs:[eax]
 000B0F63    mov         dword ptr fs:[eax],esp
 000B0F66    lea         edx,[ebp-14]
 000B0F69    mov         eax,80B
 000B0F6E    call        LoadStr;'Replacing...'
 000B0F73    mov         eax,dword ptr [ebp-14]
 000B0F76    push        eax
 000B0F77    lea         edx,[ebp-18]
 000B0F7A    mov         eax,7FD
 000B0F7F    call        LoadStr;'Searching...'
 000B0F84    mov         eax,dword ptr [ebp-18]
 000B0F87    push        eax
 000B0F88    push        1
 000B0F8A    push        1
 000B0F8C    mov         ecx,dword ptr [ebp-4]
 000B0F8F    mov         dl,1
 000B0F91    mov         eax,[0008C62C];TProgressBox
 000B0F96    call        TProgressBox.Create;TProgressBox.Create
 000B0F9B    mov         edx,dword ptr ds:[0B5A9C];^gvar_000B6D00:TProgressBox
 000B0FA1    mov         dword ptr [edx],eax
 000B0FA3    xor         eax,eax
 000B0FA5    push        ebp
 000B0FA6    push        0B1000
 000B0FAB    push        dword ptr fs:[eax]
 000B0FAE    mov         dword ptr fs:[eax],esp
 000B0FB1    xor         eax,eax
 000B0FB3    call        000986CC
 000B0FB8    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000B0FBD    mov         eax,dword ptr [eax]
 000B0FBF    call        TCustomForm.Show
 000B0FC4    lea         eax,[ebp-0F]
 000B0FC7    push        eax
 000B0FC8    push        1
 000B0FCA    lea         ecx,[ebp-0E]
 000B0FCD    lea         edx,[ebp-0D]
 000B0FD0    lea         eax,[ebp-0C]
 000B0FD3    call        0009A6F0
 000B0FD8    xor         eax,eax
 000B0FDA    pop         edx
 000B0FDB    pop         ecx
 000B0FDC    pop         ecx
 000B0FDD    mov         dword ptr fs:[eax],edx
 000B0FE0    push        0B1007
 000B0FE5    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000B0FEA    mov         eax,dword ptr [eax]
 000B0FEC    call        TObject.Free
 000B0FF1    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000B0FF6    xor         edx,edx
 000B0FF8    mov         dword ptr [eax],edx
 000B0FFA    call        000986F4
 000B0FFF    ret
>000B1000    jmp         @HandleFinally
>000B1005    jmp         000B0FE5
 000B1007    cmp         byte ptr [ebp-0F],0
>000B100B    jne         000B10D3
 000B1011    cmp         byte ptr [ebp-0D],0
>000B1015    jne         000B1056
 000B1017    mov         eax,dword ptr [ebp-4]
 000B101A    mov         eax,dword ptr [eax+3A4]
 000B1020    cmp         eax,dword ptr [ebp-8]
>000B1023    jne         000B103F
 000B1025    lea         edx,[ebp-14]
 000B1028    mov         eax,817
 000B102D    call        LoadStr;'File is not a
Borland Pascal 7.0 executable'
 000B1032    mov         eax,dword ptr [ebp-14]
 000B1035    call        0008D08C
>000B103A    jmp         000B10D3
 000B103F    lea         edx,[ebp-14]
 000B1042    mov         eax,7FE
 000B1047    call        LoadStr;'String not found'
 000B104C    mov         eax,dword ptr [ebp-14]
 000B104F    call        0008D08C
>000B1054    jmp         000B10D3
 000B1056    cmp         byte ptr [ebp-0E],0
>000B105A    je          000B10D3
 000B105C    mov         eax,[000B57E4];^gvar_000B6BB8:AnsiString
 000B1061    mov         eax,dword ptr [eax]
 000B1063    call        @LStrLen
 000B1068    mov         ebx,eax
 000B106A    mov         eax,[000B5B10];^gvar_000B6BC0:AnsiString
 000B106F    mov         eax,dword ptr [eax]
 000B1071    call        @LStrLen
 000B1076    cmp         ebx,eax
>000B1078    je          000B1086
 000B107A    mov         eax,[000B5C1C];^gvar_000B6B98
 000B107F    mov         eax,dword ptr [eax]
 000B1081    call        00099E68
 000B1086    mov         eax,dword ptr [ebp-4]
 000B1089    mov         eax,dword ptr [eax+398]
 000B108F    mov         dword ptr [ebp-1C],eax
 000B1092    lea         eax,[ebp-1C]
 000B1095    mov         cl,1
 000B1097    xor         edx,edx
 000B1099    call        00099514
 000B109E    cmp         byte ptr [ebp+8],0
>000B10A2    je          000B10B0
 000B10A4    mov         cl,1
 000B10A6    mov         dl,1
 000B10A8    mov         eax,dword ptr [ebp-0C]
 000B10AB    call        000998B0
 000B10B0    mov         eax,dword ptr [ebp-4]
 000B10B3    mov         eax,dword ptr [eax+3A4]
 000B10B9    cmp         eax,dword ptr [ebp-8]
>000B10BC    jne         000B10D3
 000B10BE    lea         edx,[ebp-14]
 000B10C1    mov         eax,818
 000B10C6    call        LoadStr;'File successfully patched'
 000B10CB    mov         eax,dword ptr [ebp-14]
 000B10CE    call        0008D08C
 000B10D3    xor         eax,eax
 000B10D5    pop         edx
 000B10D6    pop         ecx
 000B10D7    pop         ecx
 000B10D8    mov         dword ptr fs:[eax],edx
 000B10DB    push        0B10F5
 000B10E0    lea         eax,[ebp-18]
 000B10E3    mov         edx,2
 000B10E8    call        @LStrArrayClr
 000B10ED    ret
>000B10EE    jmp         @HandleFinally
>000B10F3    jmp         000B10E0
 000B10F5    pop         ebx
 000B10F6    mov         esp,ebp
 000B10F8    pop         ebp
 000B10F9    ret         4
end;*}

//000B10FC
procedure TFormMain.Replaceagaindown1Click(Sender:TObject);
begin
{*
 000B10FC    push        ebx
 000B10FD    push        esi
 000B10FE    mov         esi,edx
 000B1100    mov         ebx,eax
 000B1102    test        esi,esi
>000B1104    jne         000B1123
 000B1106    mov         eax,[000B5B54];^gvar_000B6BF0:Boolean
 000B110B    cmp         byte ptr [eax],0
>000B110E    jne         000B1123
 000B1110    push        1
 000B1112    mov         ecx,1
 000B1117    mov         edx,esi
 000B1119    mov         eax,ebx
 000B111B    call        000B0F40
 000B1120    pop         esi
 000B1121    pop         ebx
 000B1122    ret
 000B1123    push        1
 000B1125    call        000981C4
 000B112A    mov         ecx,eax
 000B112C    mov         edx,esi
 000B112E    mov         eax,ebx
 000B1130    call        000B0F40
 000B1135    pop         esi
 000B1136    pop         ebx
 000B1137    ret
*}
end;

//000B1138
{*procedure sub_000B1138(?:?);
begin
 000B1138    push        ebp
 000B1139    mov         ebp,esp
 000B113B    add         esp,0FFFFFFD8
 000B113E    push        ebx
 000B113F    xor         eax,eax
 000B1141    mov         dword ptr [ebp-10],eax
 000B1144    mov         dword ptr [ebp-14],eax
 000B1147    xor         eax,eax
 000B1149    push        ebp
 000B114A    push        0B12A9
 000B114F    push        dword ptr fs:[eax]
 000B1152    mov         dword ptr fs:[eax],esp
 000B1155    mov         eax,[000B5B54];^gvar_000B6BF0:Boolean
 000B115A    cmp         byte ptr [eax],0
>000B115D    jne         000B1166
 000B115F    mov         ebx,1
>000B1164    jmp         000B11A6
 000B1166    mov         eax,[000B5B10];^gvar_000B6BC0:AnsiString
 000B116B    mov         eax,dword ptr [eax]
 000B116D    call        @LStrLen
 000B1172    test        eax,eax
>000B1174    jle         000B119F
 000B1176    mov         eax,[000B5B10];^gvar_000B6BC0:AnsiString
 000B117B    mov         eax,dword ptr [eax]
 000B117D    call        @LStrLen
 000B1182    mov         ebx,eax
 000B1184    mov         eax,[000B5C1C];^gvar_000B6B98
 000B1189    add         ebx,dword ptr [eax]
 000B118B    dec         ebx
 000B118C    call        000981C4
 000B1191    cmp         ebx,eax
>000B1193    jne         000B119F
 000B1195    call        000981C4
 000B119A    mov         ebx,eax
 000B119C    inc         ebx
>000B119D    jmp         000B11A6
 000B119F    call        000981C4
 000B11A4    mov         ebx,eax
 000B11A6    lea         edx,[ebp-10]
 000B11A9    mov         eax,80B
 000B11AE    call        LoadStr;'Replacing...'
 000B11B3    mov         eax,dword ptr [ebp-10]
 000B11B6    push        eax
 000B11B7    lea         edx,[ebp-14]
 000B11BA    mov         eax,7FD
 000B11BF    call        LoadStr;'Searching...'
 000B11C4    mov         eax,dword ptr [ebp-14]
 000B11C7    push        eax
 000B11C8    push        1
 000B11CA    push        1
 000B11CC    mov         eax,dword ptr [ebp+8]
 000B11CF    mov         ecx,dword ptr [eax-4]
 000B11D2    mov         dl,1
 000B11D4    mov         eax,[0008C62C];TProgressBox
 000B11D9    call        TProgressBox.Create;TProgressBox.Create
 000B11DE    mov         edx,dword ptr ds:[0B5A9C];^gvar_000B6D00:TProgressBox
 000B11E4    mov         dword ptr [edx],eax
 000B11E6    xor         eax,eax
 000B11E8    push        ebp
 000B11E9    push        0B1242
 000B11EE    push        dword ptr fs:[eax]
 000B11F1    mov         dword ptr fs:[eax],esp
 000B11F4    xor         eax,eax
 000B11F6    call        000986CC
 000B11FB    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000B1200    mov         eax,dword ptr [eax]
 000B1202    call        TCustomForm.Show
 000B1207    lea         eax,[ebp-9]
 000B120A    push        eax
 000B120B    push        1
 000B120D    lea         ecx,[ebp-8]
 000B1210    lea         edx,[ebp-4]
 000B1213    mov         eax,ebx
 000B1215    call        0009AE24
 000B121A    xor         eax,eax
 000B121C    pop         edx
 000B121D    pop         ecx
 000B121E    pop         ecx
 000B121F    mov         dword ptr fs:[eax],edx
 000B1222    push        0B1249
 000B1227    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000B122C    mov         eax,dword ptr [eax]
 000B122E    call        TObject.Free
 000B1233    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000B1238    xor         edx,edx
 000B123A    mov         dword ptr [eax],edx
 000B123C    call        000986F4
 000B1241    ret
>000B1242    jmp         @HandleFinally
>000B1247    jmp         000B1227
 000B1249    lea         eax,[ebp-10]
 000B124C    push        eax
 000B124D    fild        dword ptr [ebp-8]
 000B1250    call        @INT
 000B1255    fstp        tbyte ptr [ebp-28]
 000B1258    wait
 000B1259    lea         eax,[ebp-28]
 000B125C    mov         dword ptr [ebp-1C],eax
 000B125F    mov         byte ptr [ebp-18],3
 000B1263    lea         edx,[ebp-1C]
 000B1266    xor         ecx,ecx
 000B1268    mov         eax,80F
 000B126D    call        FmtLoadStr;'Occurences replaced:
%.0n'
 000B1272    mov         eax,dword ptr [ebp-10]
 000B1275    push        eax
 000B1276    lea         edx,[ebp-14]
 000B1279    mov         eax,856
 000B127E    call        LoadStr;'Information'
 000B1283    mov         eax,dword ptr [ebp-14]
 000B1286    xor         ecx,ecx
 000B1288    pop         edx
 000B1289    call        0008D880
 000B128E    xor         eax,eax
 000B1290    pop         edx
 000B1291    pop         ecx
 000B1292    pop         ecx
 000B1293    mov         dword ptr fs:[eax],edx
 000B1296    push        0B12B0
 000B129B    lea         eax,[ebp-14]
 000B129E    mov         edx,2
 000B12A3    call        @LStrArrayClr
 000B12A8    ret
>000B12A9    jmp         @HandleFinally
>000B12AE    jmp         000B129B
 000B12B0    pop         ebx
 000B12B1    mov         esp,ebp
 000B12B3    pop         ebp
 000B12B4    ret
end;*}

//000B12B8
procedure TFormMain.Replace1Click(Sender:TObject);
begin
{*
 000B12B8    push        ebp
 000B12B9    mov         ebp,esp
 000B12BB    add         esp,0FFFFFFEC
 000B12BE    xor         ecx,ecx
 000B12C0    mov         dword ptr [ebp-8],ecx
 000B12C3    mov         dword ptr [ebp-4],eax
 000B12C6    xor         eax,eax
 000B12C8    push        ebp
 000B12C9    push        0B15DF
 000B12CE    push        dword ptr fs:[eax]
 000B12D1    mov         dword ptr fs:[eax],esp
 000B12D4    mov         ecx,dword ptr [ebp-4]
 000B12D7    mov         dl,1
 000B12D9    mov         eax,[0009F254];TFormReplace
 000B12DE    call        TCustomForm.Create;TFormReplace.Create
 000B12E3    mov         edx,dword ptr ds:[0B5BCC];^gvar_000B7050:TFormReplace
 000B12E9    mov         dword ptr [edx],eax
 000B12EB    xor         eax,eax
 000B12ED    push        ebp
 000B12EE    push        0B15C2
 000B12F3    push        dword ptr fs:[eax]
 000B12F6    mov         dword ptr fs:[eax],esp
 000B12F9    mov         edx,dword ptr ds:[0B5AA4];^gvar_000B6BB5:Boolean
 000B12FF    mov         dl,byte ptr [edx]
 000B1301    mov         eax,[000B5BCC];^gvar_000B7050:TFormReplace
 000B1306    mov         eax,dword ptr [eax]
 000B1308    mov         eax,dword ptr [eax+2E0]
 000B130E    mov         ecx,dword ptr [eax]
 000B1310    call        dword ptr [ecx+0BC]
 000B1316    mov         edx,dword ptr ds:[0B5794];^gvar_000B6BC6:Boolean
 000B131C    mov         dl,byte ptr [edx]
 000B131E    mov         eax,[000B5BCC];^gvar_000B7050:TFormReplace
 000B1323    mov         eax,dword ptr [eax]
 000B1325    mov         eax,dword ptr [eax+2E4]
 000B132B    mov         ecx,dword ptr [eax]
 000B132D    call        dword ptr [ecx+0BC]
 000B1333    lea         eax,[ebp-8]
 000B1336    mov         edx,dword ptr ds:[0B5C04];^gvar_000B6BC7:AnsiString
 000B133C    mov         dl,byte ptr [edx]
 000B133E    call        @LStrFromChar
 000B1343    mov         edx,dword ptr [ebp-8]
 000B1346    mov         eax,[000B5BCC];^gvar_000B7050:TFormReplace
 000B134B    mov         eax,dword ptr [eax]
 000B134D    mov         eax,dword ptr [eax+2E8]
 000B1353    call        TCMByteEdit.SetASCII
 000B1358    lea         eax,[ebp-8]
 000B135B    mov         edx,dword ptr ds:[0B5C04];^gvar_000B6BC7:AnsiString
 000B1361    mov         dl,byte ptr [edx]
 000B1363    call        @LStrFromChar
 000B1368    mov         edx,dword ptr [ebp-8]
 000B136B    mov         eax,[000B5BCC];^gvar_000B7050:TFormReplace
 000B1370    mov         eax,dword ptr [eax]
 000B1372    mov         eax,dword ptr [eax+2EC]
 000B1378    call        TControl.SetText
 000B137D    mov         edx,dword ptr ds:[0B58BC];^gvar_000B6BD5:Boolean
 000B1383    mov         dl,byte ptr [edx]
 000B1385    mov         eax,[000B5BCC];^gvar_000B7050:TFormReplace
 000B138A    mov         eax,dword ptr [eax]
 000B138C    mov         eax,dword ptr [eax+2FC]
 000B1392    mov         ecx,dword ptr [eax]
 000B1394    call        dword ptr [ecx+0BC]
 000B139A    mov         edx,dword ptr ds:[0B5A4C];^gvar_000B6BD4:Boolean
 000B13A0    mov         dl,byte ptr [edx]
 000B13A2    mov         eax,[000B5BCC];^gvar_000B7050:TFormReplace
 000B13A7    mov         eax,dword ptr [eax]
 000B13A9    mov         eax,dword ptr [eax+2CC]
 000B13AF    mov         ecx,dword ptr [eax]
 000B13B1    call        dword ptr [ecx+0BC]
 000B13B7    mov         edx,dword ptr ds:[0B58B4];^gvar_000B6BD8:Boolean
 000B13BD    mov         dl,byte ptr [edx]
 000B13BF    mov         eax,[000B5BCC];^gvar_000B7050:TFormReplace
 000B13C4    mov         eax,dword ptr [eax]
 000B13C6    mov         eax,dword ptr [eax+334]
 000B13CC    mov         ecx,dword ptr [eax]
 000B13CE    call        dword ptr [ecx+0BC]
 000B13D4    mov         edx,dword ptr ds:[0B5AD4];^gvar_000B6BD9:Boolean
 000B13DA    mov         dl,byte ptr [edx]
 000B13DC    mov         eax,[000B5BCC];^gvar_000B7050:TFormReplace
 000B13E1    mov         eax,dword ptr [eax]
 000B13E3    mov         eax,dword ptr [eax+338]
 000B13E9    mov         ecx,dword ptr [eax]
 000B13EB    call        dword ptr [ecx+0BC]
 000B13F1    mov         edx,dword ptr ds:[0B5B54];^gvar_000B6BF0:Boolean
 000B13F7    mov         dl,byte ptr [edx]
 000B13F9    xor         dl,1
 000B13FC    mov         eax,[000B5BCC];^gvar_000B7050:TFormReplace
 000B1401    mov         eax,dword ptr [eax]
 000B1403    mov         eax,dword ptr [eax+310]
 000B1409    mov         ecx,dword ptr [eax]
 000B140B    call        dword ptr [ecx+0BC]
 000B1411    mov         eax,[000B5BCC];^gvar_000B7050:TFormReplace
 000B1416    mov         eax,dword ptr [eax]
 000B1418    mov         edx,dword ptr [eax]
 000B141A    call        dword ptr [edx+0CC]
 000B1420    dec         eax
>000B1421    jne         000B1581
 000B1427    mov         eax,[000B5BCC];^gvar_000B7050:TFormReplace
 000B142C    mov         eax,dword ptr [eax]
 000B142E    mov         eax,dword ptr [eax+2E0]
 000B1434    mov         edx,dword ptr [eax]
 000B1436    call        dword ptr [edx+0B8]
 000B143C    mov         edx,dword ptr ds:[0B5AA4];^gvar_000B6BB5:Boolean
 000B1442    mov         byte ptr [edx],al
 000B1444    mov         eax,[000B5BCC];^gvar_000B7050:TFormReplace
 000B1449    mov         eax,dword ptr [eax]
 000B144B    mov         eax,dword ptr [eax+2E4]
 000B1451    mov         edx,dword ptr [eax]
 000B1453    call        dword ptr [edx+0B8]
 000B1459    mov         edx,dword ptr ds:[0B5794];^gvar_000B6BC6:Boolean
 000B145F    mov         byte ptr [edx],al
 000B1461    lea         edx,[ebp-8]
 000B1464    mov         eax,[000B5BCC];^gvar_000B7050:TFormReplace
 000B1469    mov         eax,dword ptr [eax]
 000B146B    mov         eax,dword ptr [eax+2E8]
 000B1471    call        TCMByteEdit.GetASCII
 000B1476    mov         eax,dword ptr [ebp-8]
 000B1479    mov         al,byte ptr [eax]
 000B147B    mov         edx,dword ptr ds:[0B5C04];^gvar_000B6BC7:AnsiString
 000B1481    mov         byte ptr [edx],al
 000B1483    mov         eax,[000B5BCC];^gvar_000B7050:TFormReplace
 000B1488    mov         eax,dword ptr [eax]
 000B148A    mov         eax,dword ptr [eax+2CC]
 000B1490    mov         edx,dword ptr [eax]
 000B1492    call        dword ptr [edx+0B8]
 000B1498    mov         edx,dword ptr ds:[0B5A4C];^gvar_000B6BD4:Boolean
 000B149E    mov         byte ptr [edx],al
 000B14A0    mov         eax,[000B5BCC];^gvar_000B7050:TFormReplace
 000B14A5    mov         eax,dword ptr [eax]
 000B14A7    mov         eax,dword ptr [eax+2FC]
 000B14AD    mov         edx,dword ptr [eax]
 000B14AF    call        dword ptr [edx+0B8]
 000B14B5    mov         edx,dword ptr ds:[0B58BC];^gvar_000B6BD5:Boolean
 000B14BB    mov         byte ptr [edx],al
 000B14BD    mov         eax,[000B5BCC];^gvar_000B7050:TFormReplace
 000B14C2    mov         eax,dword ptr [eax]
 000B14C4    mov         eax,dword ptr [eax+334]
 000B14CA    mov         edx,dword ptr [eax]
 000B14CC    call        dword ptr [edx+0B8]
 000B14D2    mov         edx,dword ptr ds:[0B58B4];^gvar_000B6BD8:Boolean
 000B14D8    mov         byte ptr [edx],al
 000B14DA    mov         eax,[000B5BCC];^gvar_000B7050:TFormReplace
 000B14DF    mov         eax,dword ptr [eax]
 000B14E1    mov         eax,dword ptr [eax+338]
 000B14E7    mov         edx,dword ptr [eax]
 000B14E9    call        dword ptr [edx+0B8]
 000B14EF    mov         edx,dword ptr ds:[0B5AD4];^gvar_000B6BD9:Boolean
 000B14F5    mov         byte ptr [edx],al
 000B14F7    mov         eax,[000B5BCC];^gvar_000B7050:TFormReplace
 000B14FC    mov         eax,dword ptr [eax]
 000B14FE    mov         eax,dword ptr [eax+30C]
 000B1504    mov         edx,dword ptr [eax]
 000B1506    call        dword ptr [edx+0B8]
 000B150C    mov         edx,dword ptr ds:[0B5B54];^gvar_000B6BF0:Boolean
 000B1512    mov         byte ptr [edx],al
 000B1514    mov         eax,[000B57E4];^gvar_000B6BB8:AnsiString
 000B1519    mov         edx,dword ptr ds:[0B5BCC];^gvar_000B7050:TFormReplace
 000B151F    mov         edx,dword ptr [edx]
 000B1521    mov         edx,dword ptr [edx+33C]
 000B1527    call        @LStrAsg
 000B152C    mov         eax,[000B5B10];^gvar_000B6BC0:AnsiString
 000B1531    mov         edx,dword ptr ds:[0B5BCC];^gvar_000B7050:TFormReplace
 000B1537    mov         edx,dword ptr [edx]
 000B1539    mov         edx,dword ptr [edx+340]
 000B153F    call        @LStrAsg
 000B1544    mov         eax,[000B5BCC];^gvar_000B7050:TFormReplace
 000B1549    mov         eax,dword ptr [eax]
 000B154B    cmp         byte ptr [eax+344],0
>000B1552    je          000B155D
 000B1554    push        ebp
 000B1555    call        000B1138
 000B155A    pop         ecx
>000B155B    jmp         000B1567
 000B155D    xor         edx,edx
 000B155F    mov         eax,dword ptr [ebp-4]
 000B1562    call        TFormMain.Replaceagaindown1Click
 000B1567    mov         eax,dword ptr [ebp-4]
 000B156A    mov         eax,dword ptr [eax+394];TFormMain.Replaceagaindown1:TMenuItem
 000B1570    mov         dword ptr [ebp-0C],eax
 000B1573    lea         eax,[ebp-0C]
 000B1576    mov         cl,1
 000B1578    xor         edx,edx
 000B157A    call        00099514
>000B157F    jmp         000B15A8
 000B1581    mov         eax,dword ptr [ebp-4]
 000B1584    mov         eax,dword ptr [eax+394];TFormMain.Replaceagaindown1:TMenuItem
 000B158A    mov         dword ptr [ebp-14],eax
 000B158D    mov         eax,dword ptr [ebp-4]
 000B1590    mov         eax,dword ptr [eax+398];TFormMain.Replaceundo1:TMenuItem
 000B1596    mov         dword ptr [ebp-10],eax
 000B1599    lea         eax,[ebp-14]
 000B159C    xor         ecx,ecx
 000B159E    mov         edx,1
 000B15A3    call        00099514
 000B15A8    xor         eax,eax
 000B15AA    pop         edx
 000B15AB    pop         ecx
 000B15AC    pop         ecx
 000B15AD    mov         dword ptr fs:[eax],edx
 000B15B0    push        0B15C9
 000B15B5    mov         eax,[000B5BCC];^gvar_000B7050:TFormReplace
 000B15BA    mov         eax,dword ptr [eax]
 000B15BC    call        TCustomForm.Release
 000B15C1    ret
>000B15C2    jmp         @HandleFinally
>000B15C7    jmp         000B15B5
 000B15C9    xor         eax,eax
 000B15CB    pop         edx
 000B15CC    pop         ecx
 000B15CD    pop         ecx
 000B15CE    mov         dword ptr fs:[eax],edx
 000B15D1    push        0B15E6
 000B15D6    lea         eax,[ebp-8]
 000B15D9    call        @LStrClr
 000B15DE    ret
>000B15DF    jmp         @HandleFinally
>000B15E4    jmp         000B15D6
 000B15E6    mov         esp,ebp
 000B15E8    pop         ebp
 000B15E9    ret
*}
end;

//000B15EC
procedure TFormMain.Replaceundo1Click(Sender:TObject);
begin
{*
 000B15EC    push        ebp
 000B15ED    mov         ebp,esp
 000B15EF    push        ecx
 000B15F0    push        ebx
 000B15F1    mov         ebx,eax
 000B15F3    xor         eax,eax
 000B15F5    call        000986CC
 000B15FA    xor         eax,eax
 000B15FC    push        ebp
 000B15FD    push        0B1635
 000B1602    push        dword ptr fs:[eax]
 000B1605    mov         dword ptr fs:[eax],esp
 000B1608    call        0009A8AC
 000B160D    mov         eax,dword ptr [ebx+398];TFormMain.Replaceundo1:TMenuItem
 000B1613    mov         dword ptr [ebp-4],eax
 000B1616    lea         eax,[ebp-4]
 000B1619    xor         ecx,ecx
 000B161B    xor         edx,edx
 000B161D    call        00099514
 000B1622    xor         eax,eax
 000B1624    pop         edx
 000B1625    pop         ecx
 000B1626    pop         ecx
 000B1627    mov         dword ptr fs:[eax],edx
 000B162A    push        0B163C
 000B162F    call        000986F4
 000B1634    ret
>000B1635    jmp         @HandleFinally
>000B163A    jmp         000B162F
 000B163C    pop         ebx
 000B163D    pop         ecx
 000B163E    pop         ebp
 000B163F    ret
*}
end;

//000B1640
procedure TFormMain.Patch1Click(Sender:TObject);
begin
{*
 000B1640    push        ebp
 000B1641    mov         ebp,esp
 000B1643    add         esp,0FFFFFFF4
 000B1646    push        ebx
 000B1647    push        esi
 000B1648    xor         ecx,ecx
 000B164A    mov         dword ptr [ebp-4],ecx
 000B164D    mov         esi,edx
 000B164F    mov         ebx,eax
 000B1651    xor         eax,eax
 000B1653    push        ebp
 000B1654    push        0B16DE
 000B1659    push        dword ptr fs:[eax]
 000B165C    mov         dword ptr fs:[eax],esp
 000B165F    lea         ecx,[ebp-4]
 000B1662    xor         edx,edx
 000B1664    mov         eax,0B16F4;'F7D0F7D2B937'
 000B1669    call        00074ED4
 000B166E    mov         edx,dword ptr [ebp-4]
 000B1671    mov         eax,[000B57E4];^gvar_000B6BB8:AnsiString
 000B1676    call        @LStrAsg
 000B167B    lea         ecx,[ebp-4]
 000B167E    xor         edx,edx
 000B1680    mov         eax,0B170C;'F7D0F7D2B97E'
 000B1685    call        00074ED4
 000B168A    mov         edx,dword ptr [ebp-4]
 000B168D    mov         eax,[000B5B10];^gvar_000B6BC0:AnsiString
 000B1692    call        @LStrAsg
 000B1697    push        0
 000B1699    mov         ecx,1
 000B169E    mov         edx,esi
 000B16A0    mov         eax,ebx
 000B16A2    call        000B0F40
 000B16A7    mov         eax,dword ptr [ebx+394];TFormMain.Replaceagaindown1:TMenuItem
 000B16AD    mov         dword ptr [ebp-0C],eax
 000B16B0    mov         eax,dword ptr [ebx+398];TFormMain.Replaceundo1:TMenuItem
 000B16B6    mov         dword ptr [ebp-8],eax
 000B16B9    lea         eax,[ebp-0C]
 000B16BC    xor         ecx,ecx
 000B16BE    mov         edx,1
 000B16C3    call        00099514
 000B16C8    xor         eax,eax
 000B16CA    pop         edx
 000B16CB    pop         ecx
 000B16CC    pop         ecx
 000B16CD    mov         dword ptr fs:[eax],edx
 000B16D0    push        0B16E5
 000B16D5    lea         eax,[ebp-4]
 000B16D8    call        @LStrClr
 000B16DD    ret
>000B16DE    jmp         @HandleFinally
>000B16E3    jmp         000B16D5
 000B16E5    pop         esi
 000B16E6    pop         ebx
 000B16E7    mov         esp,ebp
 000B16E9    pop         ebp
 000B16EA    ret
*}
end;

//000B171C
procedure TFormMain.Shredderdata1Click(Sender:TObject);
begin
{*
 000B171C    push        ebp
 000B171D    mov         ebp,esp
 000B171F    push        0
 000B1721    push        0
 000B1723    push        ebx
 000B1724    mov         ebx,eax
 000B1726    xor         eax,eax
 000B1728    push        ebp
 000B1729    push        0B1828
 000B172E    push        dword ptr fs:[eax]
 000B1731    mov         dword ptr fs:[eax],esp
 000B1734    lea         edx,[ebp-4]
 000B1737    mov         eax,863
 000B173C    call        LoadStr;'Overwrite all bytes with binary zeroes!
Undo not possible.
Are you sure?'
 000B1741    mov         eax,dword ptr [ebp-4]
 000B1744    call        0008D0C4
 000B1749    cmp         ax,6
>000B174D    jne         000B180D
 000B1753    lea         edx,[ebp-4]
 000B1756    mov         eax,862
 000B175B    call        LoadStr;'Shreddering data...'
 000B1760    mov         eax,dword ptr [ebp-4]
 000B1763    push        eax
 000B1764    lea         edx,[ebp-8]
 000B1767    mov         eax,862
 000B176C    call        LoadStr;'Shreddering data...'
 000B1771    mov         eax,dword ptr [ebp-8]
 000B1774    push        eax
 000B1775    push        0
 000B1777    push        0
 000B1779    mov         ecx,ebx
 000B177B    mov         dl,1
 000B177D    mov         eax,[0008C62C];TProgressBox
 000B1782    call        TProgressBox.Create;TProgressBox.Create
 000B1787    mov         edx,dword ptr ds:[0B5A9C];^gvar_000B6D00:TProgressBox
 000B178D    mov         dword ptr [edx],eax
 000B178F    xor         eax,eax
 000B1791    push        ebp
 000B1792    push        0B17F6
 000B1797    push        dword ptr fs:[eax]
 000B179A    mov         dword ptr fs:[eax],esp
 000B179D    xor         eax,eax
 000B179F    call        000986CC
 000B17A4    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000B17A9    mov         eax,dword ptr [eax]
 000B17AB    call        TCustomForm.Show
 000B17B0    mov         edx,dword ptr ds:[0B5BA0];^gvar_000B6BAC:Single
 000B17B6    mov         edx,dword ptr [edx]
 000B17B8    mov         eax,[000B59C0];^gvar_000B6B6C
 000B17BD    mov         eax,dword ptr [eax]
 000B17BF    xor         ecx,ecx
 000B17C1    call        @FillChar
 000B17C6    mov         eax,[000B5778];^gvar_000B6BA5
 000B17CB    mov         byte ptr [eax],1
 000B17CE    xor         eax,eax
 000B17D0    pop         edx
 000B17D1    pop         ecx
 000B17D2    pop         ecx
 000B17D3    mov         dword ptr fs:[eax],edx
 000B17D6    push        0B17FD
 000B17DB    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000B17E0    mov         eax,dword ptr [eax]
 000B17E2    call        TObject.Free
 000B17E7    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000B17EC    xor         edx,edx
 000B17EE    mov         dword ptr [eax],edx
 000B17F0    call        000986F4
 000B17F5    ret
>000B17F6    jmp         @HandleFinally
>000B17FB    jmp         000B17DB
 000B17FD    mov         eax,[000B5984];^gvar_000B6B84
 000B1802    mov         eax,dword ptr [eax]
 000B1804    mov         cl,1
 000B1806    xor         edx,edx
 000B1808    call        000998B0
 000B180D    xor         eax,eax
 000B180F    pop         edx
 000B1810    pop         ecx
 000B1811    pop         ecx
 000B1812    mov         dword ptr fs:[eax],edx
 000B1815    push        0B182F
 000B181A    lea         eax,[ebp-8]
 000B181D    mov         edx,2
 000B1822    call        @LStrArrayClr
 000B1827    ret
>000B1828    jmp         @HandleFinally
>000B182D    jmp         000B181A
 000B182F    pop         ebx
 000B1830    pop         ecx
 000B1831    pop         ecx
 000B1832    pop         ebp
 000B1833    ret
*}
end;

//000B1834
procedure TFormMain.Insert1Click(Sender:TObject);
begin
{*
 000B1834    push        ebp
 000B1835    mov         ebp,esp
 000B1837    push        0
 000B1839    push        ebx
 000B183A    mov         ebx,eax
 000B183C    xor         eax,eax
 000B183E    push        ebp
 000B183F    push        0B19AF
 000B1844    push        dword ptr fs:[eax]
 000B1847    mov         dword ptr fs:[eax],esp
 000B184A    mov         ecx,ebx
 000B184C    mov         dl,1
 000B184E    mov         eax,[000A158C];TFormIns
 000B1853    call        TCustomForm.Create;TFormIns.Create
 000B1858    mov         edx,dword ptr ds:[0B5818];^gvar_000B7078:TFormIns
 000B185E    mov         dword ptr [edx],eax
 000B1860    xor         eax,eax
 000B1862    push        ebp
 000B1863    push        0B1992
 000B1868    push        dword ptr fs:[eax]
 000B186B    mov         dword ptr fs:[eax],esp
 000B186E    mov         edx,dword ptr ds:[0B5AF8];^gvar_000B6BD6:Boolean
 000B1874    mov         dl,byte ptr [edx]
 000B1876    mov         eax,[000B5818];^gvar_000B7078:TFormIns
 000B187B    mov         eax,dword ptr [eax]
 000B187D    mov         eax,dword ptr [eax+300]
 000B1883    mov         ecx,dword ptr [eax]
 000B1885    call        dword ptr [ecx+0BC]
 000B188B    mov         edx,dword ptr ds:[0B5958];^gvar_000B6BD7:Boolean
 000B1891    mov         dl,byte ptr [edx]
 000B1893    mov         eax,[000B5818];^gvar_000B7078:TFormIns
 000B1898    mov         eax,dword ptr [eax]
 000B189A    mov         eax,dword ptr [eax+304]
 000B18A0    mov         ecx,dword ptr [eax]
 000B18A2    call        dword ptr [ecx+0BC]
 000B18A8    mov         eax,[000B5818];^gvar_000B7078:TFormIns
 000B18AD    mov         eax,dword ptr [eax]
 000B18AF    mov         dword ptr [eax+310],32
 000B18B9    mov         eax,[000B5818];^gvar_000B7078:TFormIns
 000B18BE    mov         eax,dword ptr [eax]
 000B18C0    mov         edx,dword ptr [eax]
 000B18C2    call        dword ptr [edx+0CC]
 000B18C8    dec         eax
>000B18C9    jne         000B1978
 000B18CF    mov         eax,[000B5818];^gvar_000B7078:TFormIns
 000B18D4    mov         eax,dword ptr [eax]
 000B18D6    mov         eax,dword ptr [eax+300]
 000B18DC    mov         edx,dword ptr [eax]
 000B18DE    call        dword ptr [edx+0B8]
 000B18E4    mov         edx,dword ptr ds:[0B5AF8];^gvar_000B6BD6:Boolean
 000B18EA    mov         byte ptr [edx],al
 000B18EC    mov         eax,[000B5818];^gvar_000B7078:TFormIns
 000B18F1    mov         eax,dword ptr [eax]
 000B18F3    mov         eax,dword ptr [eax+304]
 000B18F9    mov         edx,dword ptr [eax]
 000B18FB    call        dword ptr [edx+0B8]
 000B1901    mov         edx,dword ptr ds:[0B5958];^gvar_000B6BD7:Boolean
 000B1907    mov         byte ptr [edx],al
 000B1909    call        000981C4
 000B190E    mov         ebx,eax
 000B1910    lea         edx,[ebp-4]
 000B1913    mov         eax,7EE
 000B1918    call        LoadStr;'Insert...'
 000B191D    mov         eax,dword ptr [ebp-4]
 000B1920    call        000986CC
 000B1925    xor         eax,eax
 000B1927    push        ebp
 000B1928    push        0B1971
 000B192D    push        dword ptr fs:[eax]
 000B1930    mov         dword ptr fs:[eax],esp
 000B1933    mov         eax,[000B5818];^gvar_000B7078:TFormIns
 000B1938    mov         eax,dword ptr [eax]
 000B193A    mov         ecx,dword ptr [eax+308]
 000B1940    mov         eax,[000B5818];^gvar_000B7078:TFormIns
 000B1945    mov         eax,dword ptr [eax]
 000B1947    mov         edx,dword ptr [eax+30C]
 000B194D    mov         eax,ebx
 000B194F    call        00098A74
 000B1954    call        000981C4
 000B1959    call        00099E68
 000B195E    xor         eax,eax
 000B1960    pop         edx
 000B1961    pop         ecx
 000B1962    pop         ecx
 000B1963    mov         dword ptr fs:[eax],edx
 000B1966    push        0B1978
 000B196B    call        000986F4
 000B1970    ret
>000B1971    jmp         @HandleFinally
>000B1976    jmp         000B196B
 000B1978    xor         eax,eax
 000B197A    pop         edx
 000B197B    pop         ecx
 000B197C    pop         ecx
 000B197D    mov         dword ptr fs:[eax],edx
 000B1980    push        0B1999
 000B1985    mov         eax,[000B5818];^gvar_000B7078:TFormIns
 000B198A    mov         eax,dword ptr [eax]
 000B198C    call        TCustomForm.Release
 000B1991    ret
>000B1992    jmp         @HandleFinally
>000B1997    jmp         000B1985
 000B1999    xor         eax,eax
 000B199B    pop         edx
 000B199C    pop         ecx
 000B199D    pop         ecx
 000B199E    mov         dword ptr fs:[eax],edx
 000B19A1    push        0B19B6
 000B19A6    lea         eax,[ebp-4]
 000B19A9    call        @LStrClr
 000B19AE    ret
>000B19AF    jmp         @HandleFinally
>000B19B4    jmp         000B19A6
 000B19B6    pop         ebx
 000B19B7    pop         ecx
 000B19B8    pop         ebp
 000B19B9    ret
*}
end;

//000B19BC
procedure TFormMain.Overwritestring1Click(Sender:TObject);
begin
{*
 000B19BC    push        ebp
 000B19BD    mov         ebp,esp
 000B19BF    push        0
 000B19C1    push        ebx
 000B19C2    mov         ebx,eax
 000B19C4    xor         eax,eax
 000B19C6    push        ebp
 000B19C7    push        0B1B80
 000B19CC    push        dword ptr fs:[eax]
 000B19CF    mov         dword ptr fs:[eax],esp
 000B19D2    mov         ecx,ebx
 000B19D4    mov         dl,1
 000B19D6    mov         eax,[000A158C];TFormIns
 000B19DB    call        TCustomForm.Create;TFormIns.Create
 000B19E0    mov         edx,dword ptr ds:[0B5818];^gvar_000B7078:TFormIns
 000B19E6    mov         dword ptr [edx],eax
 000B19E8    lea         edx,[ebp-4]
 000B19EB    mov         eax,7E0
 000B19F0    call        LoadStr;'Overwrite'
 000B19F5    mov         edx,dword ptr [ebp-4]
 000B19F8    mov         eax,[000B5818];^gvar_000B7078:TFormIns
 000B19FD    mov         eax,dword ptr [eax]
 000B19FF    call        TControl.SetText
 000B1A04    lea         edx,[ebp-4]
 000B1A07    mov         eax,7E0
 000B1A0C    call        LoadStr;'Overwrite'
 000B1A11    mov         edx,dword ptr [ebp-4]
 000B1A14    mov         eax,[000B5818];^gvar_000B7078:TFormIns
 000B1A19    mov         eax,dword ptr [eax]
 000B1A1B    mov         eax,dword ptr [eax+2C4]
 000B1A21    call        TControl.SetText
 000B1A26    mov         eax,[000B5818];^gvar_000B7078:TFormIns
 000B1A2B    mov         eax,dword ptr [eax]
 000B1A2D    mov         eax,dword ptr [eax+2D4]
 000B1A33    xor         edx,edx
 000B1A35    call        TControl.SetVisible
 000B1A3A    mov         edx,dword ptr ds:[0B5AF8];^gvar_000B6BD6:Boolean
 000B1A40    mov         dl,byte ptr [edx]
 000B1A42    mov         eax,[000B5818];^gvar_000B7078:TFormIns
 000B1A47    mov         eax,dword ptr [eax]
 000B1A49    mov         eax,dword ptr [eax+300]
 000B1A4F    mov         ecx,dword ptr [eax]
 000B1A51    call        dword ptr [ecx+0BC]
 000B1A57    mov         edx,dword ptr ds:[0B5958];^gvar_000B6BD7:Boolean
 000B1A5D    mov         dl,byte ptr [edx]
 000B1A5F    mov         eax,[000B5818];^gvar_000B7078:TFormIns
 000B1A64    mov         eax,dword ptr [eax]
 000B1A66    mov         eax,dword ptr [eax+304]
 000B1A6C    mov         ecx,dword ptr [eax]
 000B1A6E    call        dword ptr [ecx+0BC]
 000B1A74    mov         eax,[000B5818];^gvar_000B7078:TFormIns
 000B1A79    mov         eax,dword ptr [eax]
 000B1A7B    mov         dword ptr [eax+310],48
 000B1A85    xor         eax,eax
 000B1A87    push        ebp
 000B1A88    push        0B1B63
 000B1A8D    push        dword ptr fs:[eax]
 000B1A90    mov         dword ptr fs:[eax],esp
 000B1A93    mov         eax,[000B5818];^gvar_000B7078:TFormIns
 000B1A98    mov         eax,dword ptr [eax]
 000B1A9A    mov         edx,dword ptr [eax]
 000B1A9C    call        dword ptr [edx+0CC]
 000B1AA2    dec         eax
>000B1AA3    jne         000B1B49
 000B1AA9    mov         eax,[000B5818];^gvar_000B7078:TFormIns
 000B1AAE    mov         eax,dword ptr [eax]
 000B1AB0    mov         eax,dword ptr [eax+300]
 000B1AB6    mov         edx,dword ptr [eax]
 000B1AB8    call        dword ptr [edx+0B8]
 000B1ABE    mov         edx,dword ptr ds:[0B5AF8];^gvar_000B6BD6:Boolean
 000B1AC4    mov         byte ptr [edx],al
 000B1AC6    mov         eax,[000B5818];^gvar_000B7078:TFormIns
 000B1ACB    mov         eax,dword ptr [eax]
 000B1ACD    mov         eax,dword ptr [eax+304]
 000B1AD3    mov         edx,dword ptr [eax]
 000B1AD5    call        dword ptr [edx+0B8]
 000B1ADB    mov         edx,dword ptr ds:[0B5958];^gvar_000B6BD7:Boolean
 000B1AE1    mov         byte ptr [edx],al
 000B1AE3    lea         edx,[ebp-4]
 000B1AE6    mov         eax,7EE
 000B1AEB    call        LoadStr;'Insert...'
 000B1AF0    mov         eax,dword ptr [ebp-4]
 000B1AF3    call        000986CC
 000B1AF8    xor         eax,eax
 000B1AFA    push        ebp
 000B1AFB    push        0B1B42
 000B1B00    push        dword ptr fs:[eax]
 000B1B03    mov         dword ptr fs:[eax],esp
 000B1B06    call        000981C4
 000B1B0B    mov         edx,dword ptr ds:[0B5818];^gvar_000B7078:TFormIns
 000B1B11    mov         edx,dword ptr [edx]
 000B1B13    mov         edx,dword ptr [edx+308]
 000B1B19    call        000988E0
 000B1B1E    test        al,al
>000B1B20    je          000B1B2F
 000B1B22    call        00099890
 000B1B27    mov         eax,[000B5778];^gvar_000B6BA5
 000B1B2C    mov         byte ptr [eax],1
 000B1B2F    xor         eax,eax
 000B1B31    pop         edx
 000B1B32    pop         ecx
 000B1B33    pop         ecx
 000B1B34    mov         dword ptr fs:[eax],edx
 000B1B37    push        0B1B49
 000B1B3C    call        000986F4
 000B1B41    ret
>000B1B42    jmp         @HandleFinally
>000B1B47    jmp         000B1B3C
 000B1B49    xor         eax,eax
 000B1B4B    pop         edx
 000B1B4C    pop         ecx
 000B1B4D    pop         ecx
 000B1B4E    mov         dword ptr fs:[eax],edx
 000B1B51    push        0B1B6A
 000B1B56    mov         eax,[000B5818];^gvar_000B7078:TFormIns
 000B1B5B    mov         eax,dword ptr [eax]
 000B1B5D    call        TCustomForm.Release
 000B1B62    ret
>000B1B63    jmp         @HandleFinally
>000B1B68    jmp         000B1B56
 000B1B6A    xor         eax,eax
 000B1B6C    pop         edx
 000B1B6D    pop         ecx
 000B1B6E    pop         ecx
 000B1B6F    mov         dword ptr fs:[eax],edx
 000B1B72    push        0B1B87
 000B1B77    lea         eax,[ebp-4]
 000B1B7A    call        @LStrClr
 000B1B7F    ret
>000B1B80    jmp         @HandleFinally
>000B1B85    jmp         000B1B77
 000B1B87    pop         ebx
 000B1B88    pop         ecx
 000B1B89    pop         ebp
 000B1B8A    ret
*}
end;

//000B1B8C
procedure TFormMain.Insertfile1Click(Sender:TObject);
begin
{*
 000B1B8C    push        ebp
 000B1B8D    mov         ebp,esp
 000B1B8F    add         esp,0FFFFFFEC
 000B1B92    push        ebx
 000B1B93    xor         ecx,ecx
 000B1B95    mov         dword ptr [ebp-0C],ecx
 000B1B98    xor         eax,eax
 000B1B9A    push        ebp
 000B1B9B    push        0B1D26
 000B1BA0    push        dword ptr fs:[eax]
 000B1BA3    mov         dword ptr fs:[eax],esp
 000B1BA6    mov         eax,[000B5A10];^gvar_000B6BE4:AnsiString
 000B1BAB    push        eax
 000B1BAC    push        0B1D3C;'*.*,*.exe'
 000B1BB1    push        3F
 000B1BB3    push        0
 000B1BB5    push        0
 000B1BB7    push        0
 000B1BB9    push        0B1D50;'Favorites'
 000B1BBE    lea         edx,[ebp-0C]
 000B1BC1    mov         eax,13F
 000B1BC6    call        LoadStr;'Open file'
 000B1BCB    mov         ecx,dword ptr [ebp-0C]
 000B1BCE    mov         eax,[000B5894];^gvar_000B7070:TFormOSE
 000B1BD3    mov         eax,dword ptr [eax]
 000B1BD5    xor         edx,edx
 000B1BD7    call        000A1204
 000B1BDC    dec         eax
>000B1BDD    jne         000B1D10
 000B1BE3    mov         eax,[000B5894];^gvar_000B7070:TFormOSE
 000B1BE8    mov         eax,dword ptr [eax]
 000B1BEA    mov         eax,dword ptr [eax+2DC]
 000B1BF0    call        00079CC0
 000B1BF5    mov         dword ptr [ebp-4],eax
 000B1BF8    call        000981C4
 000B1BFD    mov         dword ptr [ebp-8],eax
 000B1C00    cmp         dword ptr [ebp-4],0
>000B1C04    jg          000B1C3A
 000B1C06    lea         eax,[ebp-0C]
 000B1C09    push        eax
 000B1C0A    mov         eax,[000B5894];^gvar_000B7070:TFormOSE
 000B1C0F    mov         eax,dword ptr [eax]
 000B1C11    mov         eax,dword ptr [eax+2DC]
 000B1C17    mov         dword ptr [ebp-14],eax
 000B1C1A    mov         byte ptr [ebp-10],0B
 000B1C1E    lea         edx,[ebp-14]
 000B1C21    xor         ecx,ecx
 000B1C23    mov         eax,7D2
 000B1C28    call        FmtLoadStr;'File is empty:
%s'
 000B1C2D    mov         eax,dword ptr [ebp-0C]
 000B1C30    call        0008D0A8
>000B1C35    jmp         000B1D10
 000B1C3A    mov         eax,dword ptr [ebp-4]
 000B1C3D    call        0009820C
 000B1C42    test        al,al
>000B1C44    jne         000B1C60
 000B1C46    lea         edx,[ebp-0C]
 000B1C49    mov         eax,7D4
 000B1C4E    call        LoadStr;'Can't allocate additional memory
to perform operation'
 000B1C53    mov         eax,dword ptr [ebp-0C]
 000B1C56    call        0008D0A8
>000B1C5B    jmp         000B1D10
 000B1C60    xor         eax,eax
 000B1C62    push        ebp
 000B1C63    push        0B1D09
 000B1C68    push        dword ptr fs:[eax]
 000B1C6B    mov         dword ptr fs:[eax],esp
 000B1C6E    xor         eax,eax
 000B1C70    call        000986CC
 000B1C75    mov         edx,dword ptr [ebp-4]
 000B1C78    mov         eax,dword ptr [ebp-8]
 000B1C7B    call        00098898
 000B1C80    test        al,al
>000B1C82    jne         000B1C9B
 000B1C84    lea         edx,[ebp-0C]
 000B1C87    mov         eax,7D4
 000B1C8C    call        LoadStr;'Can't allocate additional memory
to perform operation'
 000B1C91    mov         eax,dword ptr [ebp-0C]
 000B1C94    call        0008D0A8
>000B1C99    jmp         000B1CE2
 000B1C9B    mov         ebx,dword ptr ds:[0B5994];^gvar_000B7008
 000B1CA1    mov         bl,byte ptr [ebx]
 000B1CA3    mov         eax,[000B5994];^gvar_000B7008
 000B1CA8    mov         byte ptr [eax],0
 000B1CAB    mov         eax,[000B5894];^gvar_000B7070:TFormOSE
 000B1CB0    mov         eax,dword ptr [eax]
 000B1CB2    mov         eax,dword ptr [eax+2DC]
 000B1CB8    mov         ecx,dword ptr [ebp-8]
 000B1CBB    mov         dl,1
 000B1CBD    call        00098DCC
 000B1CC2    test        eax,eax
>000B1CC4    je          000B1CD3
 000B1CC6    mov         edx,dword ptr [ebp-4]
 000B1CC9    mov         eax,dword ptr [ebp-8]
 000B1CCC    call        0009A0E0
>000B1CD1    jmp         000B1CDB
 000B1CD3    mov         eax,[000B5778];^gvar_000B6BA5
 000B1CD8    mov         byte ptr [eax],1
 000B1CDB    mov         eax,[000B5994];^gvar_000B7008
 000B1CE0    mov         byte ptr [eax],bl
 000B1CE2    xor         eax,eax
 000B1CE4    pop         edx
 000B1CE5    pop         ecx
 000B1CE6    pop         ecx
 000B1CE7    mov         dword ptr fs:[eax],edx
 000B1CEA    push        0B1D10
 000B1CEF    mov         eax,dword ptr [ebp-8]
 000B1CF2    add         eax,dword ptr [ebp-4]
 000B1CF5    xor         ecx,ecx
 000B1CF7    mov         dl,1
 000B1CF9    call        000998B0
 000B1CFE    call        000983B8
 000B1D03    call        000986F4
 000B1D08    ret
>000B1D09    jmp         @HandleFinally
>000B1D0E    jmp         000B1CEF
 000B1D10    xor         eax,eax
 000B1D12    pop         edx
 000B1D13    pop         ecx
 000B1D14    pop         ecx
 000B1D15    mov         dword ptr fs:[eax],edx
 000B1D18    push        0B1D2D
 000B1D1D    lea         eax,[ebp-0C]
 000B1D20    call        @LStrClr
 000B1D25    ret
>000B1D26    jmp         @HandleFinally
>000B1D2B    jmp         000B1D1D
 000B1D2D    pop         ebx
 000B1D2E    mov         esp,ebp
 000B1D30    pop         ebp
 000B1D31    ret
*}
end;

//000B1D5C
procedure TFormMain.Writeblock1Click(Sender:TObject);
begin
{*
 000B1D5C    push        ebp
 000B1D5D    mov         ebp,esp
 000B1D5F    push        0
 000B1D61    xor         eax,eax
 000B1D63    push        ebp
 000B1D64    push        0B1E02
 000B1D69    push        dword ptr fs:[eax]
 000B1D6C    mov         dword ptr fs:[eax],esp
 000B1D6F    mov         eax,[000B586C];^gvar_000B6B8C:dword
 000B1D74    cmp         dword ptr [eax],0
>000B1D77    je          000B1DEC
 000B1D79    mov         eax,[000B5970];^gvar_000B6B90
 000B1D7E    cmp         dword ptr [eax],0
>000B1D81    je          000B1DEC
 000B1D83    mov         eax,[000B5A10];^gvar_000B6BE4:AnsiString
 000B1D88    push        eax
 000B1D89    push        0B1E14;'*.*,*.exe'
 000B1D8E    push        3F
 000B1D90    push        0
 000B1D92    push        0
 000B1D94    push        0
 000B1D96    push        0B1E28;'Favorites'
 000B1D9B    lea         edx,[ebp-4]
 000B1D9E    mov         eax,141
 000B1DA3    call        LoadStr;'Save file as'
 000B1DA8    mov         ecx,dword ptr [ebp-4]
 000B1DAB    mov         eax,[000B5894];^gvar_000B7070:TFormOSE
 000B1DB0    mov         eax,dword ptr [eax]
 000B1DB2    mov         edx,1
 000B1DB7    call        000A1204
 000B1DBC    dec         eax
>000B1DBD    jne         000B1DEC
 000B1DBF    mov         eax,[000B5970];^gvar_000B6B90
 000B1DC4    mov         eax,dword ptr [eax]
 000B1DC6    mov         edx,dword ptr ds:[0B586C];^gvar_000B6B8C:dword
 000B1DCC    sub         eax,dword ptr [edx]
 000B1DCE    inc         eax
 000B1DCF    push        eax
 000B1DD0    mov         ecx,dword ptr ds:[0B586C];^gvar_000B6B8C:dword
 000B1DD6    mov         ecx,dword ptr [ecx]
 000B1DD8    mov         eax,[000B5894];^gvar_000B7070:TFormOSE
 000B1DDD    mov         eax,dword ptr [eax]
 000B1DDF    mov         eax,dword ptr [eax+2DC]
 000B1DE5    mov         dl,1
 000B1DE7    call        000991C8
 000B1DEC    xor         eax,eax
 000B1DEE    pop         edx
 000B1DEF    pop         ecx
 000B1DF0    pop         ecx
 000B1DF1    mov         dword ptr fs:[eax],edx
 000B1DF4    push        0B1E09
 000B1DF9    lea         eax,[ebp-4]
 000B1DFC    call        @LStrClr
 000B1E01    ret
>000B1E02    jmp         @HandleFinally
>000B1E07    jmp         000B1DF9
 000B1E09    pop         ecx
 000B1E0A    pop         ebp
 000B1E0B    ret
*}
end;

//000B1E34
procedure TFormMain.Cut1Click(Sender:TObject);
begin
{*
 000B1E34    push        ebp
 000B1E35    mov         ebp,esp
 000B1E37    add         esp,0FFFFFEE4
 000B1E3D    push        ebx
 000B1E3E    push        esi
 000B1E3F    push        edi
 000B1E40    xor         ecx,ecx
 000B1E42    mov         dword ptr [ebp-1C],ecx
 000B1E45    mov         dword ptr [ebp-8],edx
 000B1E48    mov         dword ptr [ebp-4],eax
 000B1E4B    xor         eax,eax
 000B1E4D    push        ebp
 000B1E4E    push        0B2062
 000B1E53    push        dword ptr fs:[eax]
 000B1E56    mov         dword ptr fs:[eax],esp
 000B1E59    mov         eax,[000B586C];^gvar_000B6B8C:dword
 000B1E5E    cmp         dword ptr [eax],0
>000B1E61    je          000B1E6D
 000B1E63    mov         eax,[000B5970];^gvar_000B6B90
 000B1E68    cmp         dword ptr [eax],0
>000B1E6B    jne         000B1E87
 000B1E6D    lea         edx,[ebp-1C]
 000B1E70    mov         eax,7E7
 000B1E75    call        LoadStr;'No block marked'
 000B1E7A    mov         eax,dword ptr [ebp-1C]
 000B1E7D    call        0008D0A8
>000B1E82    jmp         000B204C
 000B1E87    lea         edx,[ebp-1C]
 000B1E8A    mov         eax,7ED
 000B1E8F    call        LoadStr;'Copy data to clipboard'
 000B1E94    mov         eax,dword ptr [ebp-1C]
 000B1E97    call        000986CC
 000B1E9C    call        000981C4
 000B1EA1    mov         dword ptr [ebp-10],eax
 000B1EA4    mov         eax,dword ptr [ebp-4]
 000B1EA7    call        TWinControl.GetHandle
 000B1EAC    push        eax
 000B1EAD    call        user32.OpenClipboard
 000B1EB2    call        user32.EmptyClipboard
 000B1EB7    test        eax,eax
>000B1EB9    jne         000B1EC2
 000B1EBB    push        0
 000B1EBD    call        user32.MessageBeep
 000B1EC2    xor         edx,edx
 000B1EC4    push        ebp
 000B1EC5    push        0B2045
 000B1ECA    push        dword ptr fs:[edx]
 000B1ECD    mov         dword ptr fs:[edx],esp
 000B1ED0    mov         eax,[000B5970];^gvar_000B6B90
 000B1ED5    mov         eax,dword ptr [eax]
 000B1ED7    mov         edx,dword ptr ds:[0B586C];^gvar_000B6B8C:dword
 000B1EDD    sub         eax,dword ptr [edx]
 000B1EDF    add         eax,5
 000B1EE2    push        eax
 000B1EE3    push        2
 000B1EE5    call        kernel32.GlobalAlloc
 000B1EEA    mov         dword ptr [ebp-0C],eax
 000B1EED    xor         edx,edx
 000B1EEF    push        ebp
 000B1EF0    push        0B1FC3
 000B1EF5    push        dword ptr fs:[edx]
 000B1EF8    mov         dword ptr fs:[edx],esp
 000B1EFB    mov         eax,dword ptr [ebp-0C]
 000B1EFE    push        eax
 000B1EFF    call        kernel32.GlobalLock
 000B1F04    mov         ebx,eax
 000B1F06    xor         eax,eax
 000B1F08    push        ebp
 000B1F09    push        0B1FB2
 000B1F0E    push        dword ptr fs:[eax]
 000B1F11    mov         dword ptr fs:[eax],esp
 000B1F14    mov         eax,[000B5970];^gvar_000B6B90
 000B1F19    mov         eax,dword ptr [eax]
 000B1F1B    mov         edx,dword ptr ds:[0B586C];^gvar_000B6B8C:dword
 000B1F21    sub         eax,dword ptr [edx]
 000B1F23    inc         eax
 000B1F24    lea         edx,[ebp-1C]
 000B1F27    call        000749A8
 000B1F2C    mov         edx,dword ptr [ebp-1C]
 000B1F2F    lea         eax,[ebp-11C]
 000B1F35    mov         ecx,0FF
 000B1F3A    call        @LStrToString
 000B1F3F    lea         edx,[ebp-11C]
 000B1F45    lea         eax,[ebp-15]
 000B1F48    mov         cl,4
 000B1F4A    call        @PStrNCpy
 000B1F4F    mov         edx,ebx
 000B1F51    lea         eax,[ebp-14]
 000B1F54    mov         ecx,4
 000B1F59    call        Move
 000B1F5E    mov         ecx,dword ptr ds:[0B5970];^gvar_000B6B90
 000B1F64    mov         ecx,dword ptr [ecx]
 000B1F66    mov         eax,[000B586C];^gvar_000B6B8C:dword
 000B1F6B    sub         ecx,dword ptr [eax]
 000B1F6D    inc         ecx
 000B1F6E    mov         eax,[000B586C];^gvar_000B6B8C:dword
 000B1F73    mov         eax,dword ptr [eax]
 000B1F75    mov         edx,dword ptr ds:[0B59C0];^gvar_000B6B6C
 000B1F7B    mov         edx,dword ptr [edx]
 000B1F7D    lea         eax,[edx+eax-1]
 000B1F81    lea         edx,[ebx+4]
 000B1F84    call        Move
 000B1F89    mov         eax,dword ptr [ebp-0C]
 000B1F8C    push        eax
 000B1F8D    mov         eax,[000B5618];^gvar_000B6B74:Longword
 000B1F92    movzx       eax,word ptr [eax]
 000B1F95    push        eax
 000B1F96    call        user32.SetClipboardData
 000B1F9B    xor         eax,eax
 000B1F9D    pop         edx
 000B1F9E    pop         ecx
 000B1F9F    pop         ecx
 000B1FA0    mov         dword ptr fs:[eax],edx
 000B1FA3    push        0B1FB9
 000B1FA8    mov         eax,dword ptr [ebp-0C]
 000B1FAB    push        eax
 000B1FAC    call        kernel32.GlobalUnlock
 000B1FB1    ret
>000B1FB2    jmp         @HandleFinally
>000B1FB7    jmp         000B1FA8
 000B1FB9    xor         eax,eax
 000B1FBB    pop         edx
 000B1FBC    pop         ecx
 000B1FBD    pop         ecx
 000B1FBE    mov         dword ptr fs:[eax],edx
>000B1FC1    jmp         000B1FEB
>000B1FC3    jmp         @HandleAnyException
 000B1FC8    mov         eax,dword ptr [ebp-0C]
 000B1FCB    push        eax
 000B1FCC    call        kernel32.GlobalFree
 000B1FD1    lea         edx,[ebp-1C]
 000B1FD4    mov         eax,80C
 000B1FD9    call        LoadStr;'Can't copy data to clipboard'
 000B1FDE    mov         eax,dword ptr [ebp-1C]
 000B1FE1    call        0008D0A8
 000B1FE6    call        @DoneExcept
 000B1FEB    mov         eax,dword ptr [ebp-4]
 000B1FEE    mov         eax,dword ptr [eax+3E0];TFormMain.Cut1:TMenuItem
 000B1FF4    cmp         eax,dword ptr [ebp-8]
>000B1FF7    je          000B2007
 000B1FF9    mov         eax,dword ptr [ebp-4]
 000B1FFC    mov         eax,dword ptr [eax+3EC];TFormMain.CMBtnCut:TCMBtn
 000B2002    cmp         eax,dword ptr [ebp-8]
>000B2005    jne         000B202D
 000B2007    lea         edx,[ebp-1C]
 000B200A    mov         eax,7EF
 000B200F    call        LoadStr;'Delete...'
 000B2014    mov         eax,dword ptr [ebp-1C]
 000B2017    call        000986CC
 000B201C    call        00099EE8
 000B2021    mov         cl,1
 000B2023    mov         dl,1
 000B2025    mov         eax,dword ptr [ebp-10]
 000B2028    call        000998B0
 000B202D    xor         eax,eax
 000B202F    pop         edx
 000B2030    pop         ecx
 000B2031    pop         ecx
 000B2032    mov         dword ptr fs:[eax],edx
 000B2035    push        0B204C
 000B203A    call        user32.CloseClipboard
 000B203F    call        000986F4
 000B2044    ret
>000B2045    jmp         @HandleFinally
>000B204A    jmp         000B203A
 000B204C    xor         eax,eax
 000B204E    pop         edx
 000B204F    pop         ecx
 000B2050    pop         ecx
 000B2051    mov         dword ptr fs:[eax],edx
 000B2054    push        0B2069
 000B2059    lea         eax,[ebp-1C]
 000B205C    call        @LStrClr
 000B2061    ret
>000B2062    jmp         @HandleFinally
>000B2067    jmp         000B2059
 000B2069    pop         edi
 000B206A    pop         esi
 000B206B    pop         ebx
 000B206C    mov         esp,ebp
 000B206E    pop         ebp
 000B206F    ret
*}
end;

//000B2070
{*procedure sub_000B2070(?:?);
begin
 000B2070    push        ebp
 000B2071    mov         ebp,esp
 000B2073    push        ebx
 000B2074    push        esi
 000B2075    push        edi
 000B2076    mov         edi,dword ptr [ebp+8]
 000B2079    dec         edi
 000B207A    mov         eax,dword ptr [ebp+8]
 000B207D    mov         esi,dword ptr [eax-8]
 000B2080    xor         ebx,ebx
 000B2082    mov         edx,edi
 000B2084    mov         eax,dword ptr [ebp+8]
 000B2087    mov         eax,dword ptr [eax-0C]
 000B208A    add         eax,ebx
 000B208C    mov         ecx,1
 000B2091    call        Move
 000B2096    mov         dl,byte ptr [edi]
 000B2098    mov         eax,esi
 000B209A    call        000981B8
 000B209F    inc         esi
 000B20A0    inc         ebx
 000B20A1    mov         eax,dword ptr [ebp+8]
 000B20A4    cmp         ebx,dword ptr [eax-10]
>000B20A7    je          000B20AE
 000B20A9    cmp         byte ptr [edi],0
>000B20AC    jne         000B2082
 000B20AE    cmp         byte ptr [edi],0
>000B20B1    jne         000B20B4
 000B20B3    dec         ebx
 000B20B4    mov         eax,dword ptr [ebp+8]
 000B20B7    cmp         ebx,dword ptr [eax-10]
>000B20BA    jge         000B20CC
 000B20BC    mov         eax,dword ptr [ebp+8]
 000B20BF    mov         edx,dword ptr [eax-10]
 000B20C2    sub         edx,ebx
 000B20C4    mov         eax,esi
 000B20C6    dec         eax
 000B20C7    call        0009A0E0
 000B20CC    pop         edi
 000B20CD    pop         esi
 000B20CE    pop         ebx
 000B20CF    pop         ebp
 000B20D0    ret
end;*}

//000B20D4
procedure TFormMain.Paste1Click(Sender:TObject);
begin
{*
 000B20D4    push        ebp
 000B20D5    mov         ebp,esp
 000B20D7    add         esp,0FFFFFFE0
 000B20DA    push        ebx
 000B20DB    xor         ecx,ecx
 000B20DD    mov         dword ptr [ebp-20],ecx
 000B20E0    mov         ebx,eax
 000B20E2    xor         eax,eax
 000B20E4    push        ebp
 000B20E5    push        0B2296
 000B20EA    push        dword ptr fs:[eax]
 000B20ED    mov         dword ptr fs:[eax],esp
 000B20F0    xor         eax,eax
 000B20F2    call        000986CC
 000B20F7    mov         eax,ebx
 000B20F9    call        TWinControl.GetHandle
 000B20FE    push        eax
 000B20FF    call        user32.OpenClipboard
 000B2104    xor         edx,edx
 000B2106    push        ebp
 000B2107    push        0B2258
 000B210C    push        dword ptr fs:[edx]
 000B210F    mov         dword ptr fs:[edx],esp
 000B2112    mov         bl,1
 000B2114    mov         eax,[000B5618];^gvar_000B6B74:Longword
 000B2119    movzx       eax,word ptr [eax]
 000B211C    push        eax
 000B211D    call        user32.GetClipboardData
 000B2122    mov         dword ptr [ebp-14],eax
 000B2125    cmp         dword ptr [ebp-14],0
>000B2129    jne         000B2137
 000B212B    xor         ebx,ebx
 000B212D    push        1
 000B212F    call        user32.GetClipboardData
 000B2134    mov         dword ptr [ebp-14],eax
 000B2137    cmp         dword ptr [ebp-14],0
>000B213B    jne         000B2147
 000B213D    call        @TryFinallyExit
>000B2142    jmp         000B2280
 000B2147    mov         eax,dword ptr [ebp-14]
 000B214A    push        eax
 000B214B    call        kernel32.GlobalLock
 000B2150    test        eax,eax
>000B2152    jne         000B215E
 000B2154    call        @TryFinallyExit
>000B2159    jmp         000B2280
 000B215E    mov         dword ptr [ebp-0C],eax
 000B2161    test        bl,bl
>000B2163    je          000B218C
 000B2165    lea         edx,[ebp-18]
 000B2168    mov         eax,dword ptr [ebp-0C]
 000B216B    mov         ecx,4
 000B2170    call        Move
 000B2175    mov         al,byte ptr [ebp-15]
 000B2178    push        eax
 000B2179    mov         cl,byte ptr [ebp-16]
 000B217C    mov         dl,byte ptr [ebp-17]
 000B217F    mov         al,byte ptr [ebp-18]
 000B2182    call        00074874
 000B2187    mov         dword ptr [ebp-10],eax
>000B218A    jmp         000B2198
 000B218C    mov         eax,dword ptr [ebp-14]
 000B218F    push        eax
 000B2190    call        kernel32.GlobalSize
 000B2195    mov         dword ptr [ebp-10],eax
 000B2198    call        000981C4
 000B219D    mov         dword ptr [ebp-8],eax
 000B21A0    mov         edx,dword ptr [ebp-10]
 000B21A3    mov         eax,dword ptr [ebp-8]
 000B21A6    call        00098898
 000B21AB    test        al,al
>000B21AD    jne         000B21CE
 000B21AF    lea         edx,[ebp-20]
 000B21B2    mov         eax,7FC
 000B21B7    call        LoadStr;'Not enough memory allocated
for this operation'
 000B21BC    mov         eax,dword ptr [ebp-20]
 000B21BF    call        0008D0A8
 000B21C4    call        @TryFinallyExit
>000B21C9    jmp         000B2280
 000B21CE    lea         edx,[ebp-20]
 000B21D1    mov         eax,7EB
 000B21D6    call        LoadStr;'Paste data from clipboard'
 000B21DB    mov         eax,dword ptr [ebp-20]
 000B21DE    call        000986CC
 000B21E3    xor         eax,eax
 000B21E5    push        ebp
 000B21E6    push        0B2239
 000B21EB    push        dword ptr fs:[eax]
 000B21EE    mov         dword ptr fs:[eax],esp
 000B21F1    test        bl,bl
>000B21F3    je          000B2213
 000B21F5    mov         eax,[000B59C0];^gvar_000B6B6C
 000B21FA    mov         eax,dword ptr [eax]
 000B21FC    mov         edx,dword ptr [ebp-8]
 000B21FF    lea         edx,[eax+edx-1]
 000B2203    mov         eax,dword ptr [ebp-0C]
 000B2206    add         eax,4
 000B2209    mov         ecx,dword ptr [ebp-10]
 000B220C    call        Move
>000B2211    jmp         000B221A
 000B2213    push        ebp
 000B2214    call        000B2070
 000B2219    pop         ecx
 000B221A    mov         eax,[000B5778];^gvar_000B6BA5
 000B221F    mov         byte ptr [eax],1
 000B2222    xor         eax,eax
 000B2224    pop         edx
 000B2225    pop         ecx
 000B2226    pop         ecx
 000B2227    mov         dword ptr fs:[eax],edx
 000B222A    push        0B2240
 000B222F    mov         eax,dword ptr [ebp-14]
 000B2232    push        eax
 000B2233    call        kernel32.GlobalUnlock
 000B2238    ret
>000B2239    jmp         @HandleFinally
>000B223E    jmp         000B222F
 000B2240    xor         eax,eax
 000B2242    pop         edx
 000B2243    pop         ecx
 000B2244    pop         ecx
 000B2245    mov         dword ptr fs:[eax],edx
 000B2248    push        0B225F
 000B224D    call        user32.CloseClipboard
 000B2252    call        000986F4
 000B2257    ret
>000B2258    jmp         @HandleFinally
>000B225D    jmp         000B224D
 000B225F    call        0009958C
 000B2264    mov         edx,dword ptr ds:[0B5720];^gvar_000B6B88
 000B226A    mov         dword ptr [edx],eax
 000B226C    call        000981C4
 000B2271    call        00099E68
 000B2276    call        00099890
 000B227B    call        000983B8
 000B2280    xor         eax,eax
 000B2282    pop         edx
 000B2283    pop         ecx
 000B2284    pop         ecx
 000B2285    mov         dword ptr fs:[eax],edx
 000B2288    push        0B229D
 000B228D    lea         eax,[ebp-20]
 000B2290    call        @LStrClr
 000B2295    ret
>000B2296    jmp         @HandleFinally
>000B229B    jmp         000B228D
 000B229D    pop         ebx
 000B229E    mov         esp,ebp
 000B22A0    pop         ebp
 000B22A1    ret
*}
end;

//000B22A4
procedure TFormMain.Pastefromhexstring1Click(Sender:TObject);
begin
{*
 000B22A4    push        ebp
 000B22A5    mov         ebp,esp
 000B22A7    push        0
 000B22A9    push        0
 000B22AB    push        ebx
 000B22AC    xor         eax,eax
 000B22AE    push        ebp
 000B22AF    push        0B23CC
 000B22B4    push        dword ptr fs:[eax]
 000B22B7    mov         dword ptr fs:[eax],esp
 000B22BA    xor         eax,eax
 000B22BC    call        000986CC
 000B22C1    xor         eax,eax
 000B22C3    push        ebp
 000B22C4    push        0B2389
 000B22C9    push        dword ptr fs:[eax]
 000B22CC    mov         dword ptr fs:[eax],esp
 000B22CF    call        Clipboard
 000B22D4    lea         edx,[ebp-8]
 000B22D7    call        TClipboard.GetAsText
 000B22DC    mov         eax,dword ptr [ebp-8]
 000B22DF    lea         edx,[ebp-4]
 000B22E2    call        Trim
 000B22E7    lea         eax,[ebp-8]
 000B22EA    push        eax
 000B22EB    mov         ecx,1
 000B22F0    mov         edx,3
 000B22F5    mov         eax,dword ptr [ebp-4]
 000B22F8    call        @LStrCopy
 000B22FD    mov         eax,dword ptr [ebp-8]
 000B2300    mov         edx,0B23E0;' '
 000B2305    call        @LStrCmp
 000B230A    sete        bl
 000B230D    mov         edx,ebx
 000B230F    mov         eax,dword ptr [ebp-4]
 000B2312    call        00074DB0
 000B2317    test        al,al
>000B2319    jne         000B2337
 000B231B    lea         edx,[ebp-8]
 000B231E    mov         eax,833
 000B2323    call        LoadStr;'Clipboard doesn't contain hex string!'
 000B2328    mov         eax,dword ptr [ebp-8]
 000B232B    call        0008D0A8
 000B2330    call        @TryFinallyExit
>000B2335    jmp         000B23B1
 000B2337    lea         edx,[ebp-8]
 000B233A    mov         eax,7EB
 000B233F    call        LoadStr;'Paste data from clipboard'
 000B2344    mov         eax,dword ptr [ebp-8]
 000B2347    call        000986CC
 000B234C    lea         ecx,[ebp-8]
 000B234F    mov         edx,ebx
 000B2351    mov         eax,dword ptr [ebp-4]
 000B2354    call        00074ED4
 000B2359    mov         edx,dword ptr [ebp-8]
 000B235C    lea         eax,[ebp-4]
 000B235F    call        @LStrLAsg
 000B2364    call        000981C4
 000B2369    mov         ecx,dword ptr [ebp-4]
 000B236C    mov         edx,1
 000B2371    call        00098A74
 000B2376    xor         eax,eax
 000B2378    pop         edx
 000B2379    pop         ecx
 000B237A    pop         ecx
 000B237B    mov         dword ptr fs:[eax],edx
 000B237E    push        0B2390
 000B2383    call        000986F4
 000B2388    ret
>000B2389    jmp         @HandleFinally
>000B238E    jmp         000B2383
 000B2390    call        0009958C
 000B2395    mov         edx,dword ptr ds:[0B5720];^gvar_000B6B88
 000B239B    mov         dword ptr [edx],eax
 000B239D    call        000981C4
 000B23A2    call        00099E68
 000B23A7    call        00099890
 000B23AC    call        000983B8
 000B23B1    xor         eax,eax
 000B23B3    pop         edx
 000B23B4    pop         ecx
 000B23B5    pop         ecx
 000B23B6    mov         dword ptr fs:[eax],edx
 000B23B9    push        0B23D3
 000B23BE    lea         eax,[ebp-8]
 000B23C1    mov         edx,2
 000B23C6    call        @LStrArrayClr
 000B23CB    ret
>000B23CC    jmp         @HandleFinally
>000B23D1    jmp         000B23BE
 000B23D3    pop         ebx
 000B23D4    pop         ecx
 000B23D5    pop         ecx
 000B23D6    pop         ebp
 000B23D7    ret
*}
end;

//000B23E4
procedure sub_000B23E4(?:TFormMain);
begin
{*
 000B23E4    push        ebp
 000B23E5    mov         ebp,esp
 000B23E7    add         esp,0FFFFFFE8
 000B23EA    push        ebx
 000B23EB    push        esi
 000B23EC    xor         edx,edx
 000B23EE    mov         dword ptr [ebp-4],edx
 000B23F1    mov         esi,eax
 000B23F3    xor         eax,eax
 000B23F5    push        ebp
 000B23F6    push        0B24DB
 000B23FB    push        dword ptr fs:[eax]
 000B23FE    mov         dword ptr fs:[eax],esp
 000B2401    call        user32.GetClipboardOwner
 000B2406    mov         ebx,eax
 000B2408    mov         eax,[000B59E8];^Application:TApplication
 000B240D    mov         eax,dword ptr [eax]
 000B240F    cmp         ebx,dword ptr [eax+24];TApplication.FHandle:HWND
>000B2412    je          000B2423
 000B2414    mov         eax,esi
 000B2416    call        TWinControl.GetHandle
 000B241B    cmp         ebx,eax
>000B241D    jne         000B24C5
 000B2423    mov         eax,esi
 000B2425    call        TWinControl.GetHandle
 000B242A    push        eax
 000B242B    call        user32.OpenClipboard
 000B2430    xor         eax,eax
 000B2432    push        ebp
 000B2433    push        0B24BE
 000B2438    push        dword ptr fs:[eax]
 000B243B    mov         dword ptr fs:[eax],esp
 000B243E    mov         eax,[000B5618];^gvar_000B6B74:Longword
 000B2443    movzx       eax,word ptr [eax]
 000B2446    push        eax
 000B2447    call        user32.GetClipboardData
 000B244C    mov         ebx,eax
 000B244E    test        ebx,ebx
>000B2450    jne         000B245B
 000B2452    push        1
 000B2454    call        user32.GetClipboardData
 000B2459    mov         ebx,eax
 000B245B    test        ebx,ebx
>000B245D    jbe         000B24AB
 000B245F    push        ebx
 000B2460    call        kernel32.GlobalSize
 000B2465    cmp         eax,200
>000B246A    jbe         000B24AB
 000B246C    lea         eax,[ebp-4]
 000B246F    push        eax
 000B2470    fld         tbyte ptr ds:[0B24E8];512:Extended
 000B2476    call        @INT
 000B247B    fstp        tbyte ptr [ebp-18]
 000B247E    wait
 000B247F    lea         eax,[ebp-18]
 000B2482    mov         dword ptr [ebp-0C],eax
 000B2485    mov         byte ptr [ebp-8],3
 000B2489    lea         edx,[ebp-0C]
 000B248C    xor         ecx,ecx
 000B248E    mov         eax,7E3
 000B2493    call        FmtLoadStr;'Clipboard contains more than %.0n bytes data.
Empty clipboard now?'
 000B2498    mov         eax,dword ptr [ebp-4]
 000B249B    call        0008D0C4
 000B24A0    cmp         ax,6
>000B24A4    jne         000B24AB
 000B24A6    call        user32.EmptyClipboard
 000B24AB    xor         eax,eax
 000B24AD    pop         edx
 000B24AE    pop         ecx
 000B24AF    pop         ecx
 000B24B0    mov         dword ptr fs:[eax],edx
 000B24B3    push        0B24C5
 000B24B8    call        user32.CloseClipboard
 000B24BD    ret
>000B24BE    jmp         @HandleFinally
>000B24C3    jmp         000B24B8
 000B24C5    xor         eax,eax
 000B24C7    pop         edx
 000B24C8    pop         ecx
 000B24C9    pop         ecx
 000B24CA    mov         dword ptr fs:[eax],edx
 000B24CD    push        0B24E2
 000B24D2    lea         eax,[ebp-4]
 000B24D5    call        @LStrClr
 000B24DA    ret
>000B24DB    jmp         @HandleFinally
>000B24E0    jmp         000B24D2
 000B24E2    pop         esi
 000B24E3    pop         ebx
 000B24E4    mov         esp,ebp
 000B24E6    pop         ebp
 000B24E7    ret
*}
end;

//000B24F4
procedure TFormMain.CMBtnWhatsClick;
begin
{*
 000B24F4    push        ebx
 000B24F5    mov         ebx,eax
 000B24F7    push        0
 000B24F9    push        0F180
 000B24FE    push        112
 000B2503    mov         eax,ebx
 000B2505    call        TWinControl.GetHandle
 000B250A    push        eax
 000B250B    call        user32.PostMessageA
 000B2510    pop         ebx
 000B2511    ret
*}
end;

//000B2514
procedure TFormMain.Contents1Click(Sender:TObject);
begin
{*
 000B2514    push        ebp
 000B2515    mov         ebp,esp
 000B2517    push        0
 000B2519    push        0
 000B251B    xor         eax,eax
 000B251D    push        ebp
 000B251E    push        0B258A
 000B2523    push        dword ptr fs:[eax]
 000B2526    mov         dword ptr fs:[eax],esp
 000B2529    push        5
 000B252B    push        0
 000B252D    push        0
 000B252F    lea         edx,[ebp-8]
 000B2532    mov         eax,[000B59E8];^Application:TApplication
 000B2537    mov         eax,dword ptr [eax]
 000B2539    call        TApplication.GetExeName
 000B253E    mov         eax,dword ptr [ebp-8]
 000B2541    lea         edx,[ebp-4]
 000B2544    call        ExtractFilePath
 000B2549    lea         eax,[ebp-4]
 000B254C    mov         edx,0B25A0;'XVI32U.CHM'
 000B2551    call        @LStrCat
 000B2556    mov         eax,dword ptr [ebp-4]
 000B2559    call        @LStrToPChar
 000B255E    push        eax
 000B255F    push        0B25AC
 000B2564    call        user32.GetDesktopWindow
 000B2569    push        eax
 000B256A    call        shell32.ShellExecuteA
 000B256F    xor         eax,eax
 000B2571    pop         edx
 000B2572    pop         ecx
 000B2573    pop         ecx
 000B2574    mov         dword ptr fs:[eax],edx
 000B2577    push        0B2591
 000B257C    lea         eax,[ebp-8]
 000B257F    mov         edx,2
 000B2584    call        @LStrArrayClr
 000B2589    ret
>000B258A    jmp         @HandleFinally
>000B258F    jmp         000B257C
 000B2591    pop         ecx
 000B2592    pop         ecx
 000B2593    pop         ebp
 000B2594    ret
*}
end;

//000B25B4
{*function sub_000B25B4(?:?; ?:?; ?:?; ?:?):?;
begin
 000B25B4    push        ebp
 000B25B5    mov         ebp,esp
 000B25B7    add         esp,0FFFFFFEC
 000B25BA    push        ebx
 000B25BB    push        esi
 000B25BC    mov         ebx,ecx
 000B25BE    mov         esi,eax
 000B25C0    cmp         dx,1
>000B25C4    jne         000B25FC
 000B25C6    mov         eax,ebx
 000B25C8    sub         eax,8
>000B25CB    je          000B25DA
 000B25CD    add         eax,0FFFFFFE1
 000B25D0    sub         eax,2
>000B25D3    jb          000B25DA
 000B25D5    sub         eax,1D
>000B25D8    jne         000B25FC
 000B25DA    mov         eax,dword ptr [ebp+8]
 000B25DD    mov         byte ptr [eax],0
 000B25E0    mov         byte ptr [ebp-1],0
 000B25E4    mov         eax,[000B59E8];^Application:TApplication
 000B25E9    mov         eax,dword ptr [eax]
 000B25EB    mov         ecx,ebx
 000B25ED    mov         edx,8
 000B25F2    call        TApplication.HelpCommand
>000B25F7    jmp         000B2690
 000B25FC    cmp         dx,1
>000B2600    jne         000B2686
 000B2606    cmp         ebx,3E7
>000B260C    jne         000B2686
 000B260E    lea         eax,[ebp-0C]
 000B2611    push        eax
 000B2612    call        user32.GetCursorPos
 000B2617    lea         ecx,[ebp-14]
 000B261A    lea         edx,[ebp-0C]
 000B261D    mov         eax,esi
 000B261F    call        TControl.ScreenToClient
 000B2624    mov         eax,dword ptr [ebp-14]
 000B2627    mov         dword ptr [ebp-0C],eax
 000B262A    mov         eax,dword ptr [ebp-10]
 000B262D    mov         dword ptr [ebp-8],eax
 000B2630    mov         edx,dword ptr [ebp-0C]
 000B2633    mov         eax,dword ptr [esi+2C4]
 000B2639    call        00087DAC
 000B263E    sub         eax,1
>000B2641    jb          000B264D
>000B2643    je          000B2654
 000B2645    dec         eax
>000B2646    je          000B265B
 000B2648    dec         eax
>000B2649    je          000B2662
>000B264B    jmp         000B2667
 000B264D    mov         ebx,23
>000B2652    jmp         000B2667
 000B2654    mov         ebx,24
>000B2659    jmp         000B2667
 000B265B    mov         ebx,25
>000B2660    jmp         000B2667
 000B2662    mov         ebx,26
 000B2667    mov         eax,dword ptr [ebp+8]
 000B266A    mov         byte ptr [eax],0
 000B266D    mov         byte ptr [ebp-1],0
 000B2671    mov         eax,[000B59E8];^Application:TApplication
 000B2676    mov         eax,dword ptr [eax]
 000B2678    mov         ecx,ebx
 000B267A    mov         edx,8
 000B267F    call        TApplication.HelpCommand
>000B2684    jmp         000B2690
 000B2686    mov         byte ptr [ebp-1],1
 000B268A    mov         eax,dword ptr [ebp+8]
 000B268D    mov         byte ptr [eax],1
 000B2690    mov         al,byte ptr [ebp-1]
 000B2693    pop         esi
 000B2694    pop         ebx
 000B2695    mov         esp,ebp
 000B2697    pop         ebp
 000B2698    ret         4
end;*}

//000B269C
procedure TFormMain.Charconversion1Click(Sender:TObject);
begin
{*
 000B269C    push        ebp
 000B269D    mov         ebp,esp
 000B269F    add         esp,0FFFFFFE4
 000B26A2    push        ebx
 000B26A3    xor         ecx,ecx
 000B26A5    mov         dword ptr [ebp-8],ecx
 000B26A8    mov         ebx,eax
 000B26AA    xor         eax,eax
 000B26AC    push        ebp
 000B26AD    push        0B2782
 000B26B2    push        dword ptr fs:[eax]
 000B26B5    mov         dword ptr fs:[eax],esp
 000B26B8    mov         ecx,ebx
 000B26BA    mov         dl,1
 000B26BC    mov         eax,[000A1E44];TFormCharTable
 000B26C1    call        TCustomForm.Create;TFormCharTable.Create
 000B26C6    mov         edx,dword ptr ds:[0B5AA0];^gvar_000B7080:TFormCharTable
 000B26CC    mov         dword ptr [edx],eax
 000B26CE    xor         edx,edx
 000B26D0    push        ebp
 000B26D1    push        0B2765
 000B26D6    push        dword ptr fs:[edx]
 000B26D9    mov         dword ptr fs:[edx],esp
 000B26DC    mov         eax,[000B5AA0];^gvar_000B7080:TFormCharTable
 000B26E1    mov         eax,dword ptr [eax]
 000B26E3    mov         edx,dword ptr [eax]
 000B26E5    call        dword ptr [edx+0CC]
 000B26EB    dec         eax
>000B26EC    jne         000B274B
 000B26EE    mov         eax,[000B5AA0];^gvar_000B7080:TFormCharTable
 000B26F3    mov         eax,dword ptr [eax]
 000B26F5    mov         eax,dword ptr [eax+2D4]
 000B26FB    mov         eax,dword ptr [eax+1F8]
 000B2701    sub         eax,1
>000B2704    jae         000B270D
 000B2706    call        000981C4
>000B270B    jmp         000B2712
 000B270D    mov         eax,1
 000B2712    lea         edx,[ebp-4]
 000B2715    call        0009B42C
 000B271A    lea         eax,[ebp-8]
 000B271D    push        eax
 000B271E    fild        dword ptr [ebp-4]
 000B2721    call        @INT
 000B2726    fstp        tbyte ptr [ebp-1C]
 000B2729    wait
 000B272A    lea         eax,[ebp-1C]
 000B272D    mov         dword ptr [ebp-10],eax
 000B2730    mov         byte ptr [ebp-0C],3
 000B2734    lea         edx,[ebp-10]
 000B2737    xor         ecx,ecx
 000B2739    mov         eax,80F
 000B273E    call        FmtLoadStr;'Occurences replaced:
%.0n'
 000B2743    mov         eax,dword ptr [ebp-8]
 000B2746    call        0008D08C
 000B274B    xor         eax,eax
 000B274D    pop         edx
 000B274E    pop         ecx
 000B274F    pop         ecx
 000B2750    mov         dword ptr fs:[eax],edx
 000B2753    push        0B276C
 000B2758    mov         eax,[000B5AA0];^gvar_000B7080:TFormCharTable
 000B275D    mov         eax,dword ptr [eax]
 000B275F    call        TCustomForm.Release
 000B2764    ret
>000B2765    jmp         @HandleFinally
>000B276A    jmp         000B2758
 000B276C    xor         eax,eax
 000B276E    pop         edx
 000B276F    pop         ecx
 000B2770    pop         ecx
 000B2771    mov         dword ptr fs:[eax],edx
 000B2774    push        0B2789
 000B2779    lea         eax,[ebp-8]
 000B277C    call        @LStrClr
 000B2781    ret
>000B2782    jmp         @HandleFinally
>000B2787    jmp         000B2779
 000B2789    pop         ebx
 000B278A    mov         esp,ebp
 000B278C    pop         ebp
 000B278D    ret
*}
end;

//000B2790
procedure TFormMain.Copyhex1Click(Sender:TObject);
begin
{*
 000B2790    push        ebp
 000B2791    mov         ebp,esp
 000B2793    add         esp,0FFFFFFDC
 000B2796    push        ebx
 000B2797    push        esi
 000B2798    push        edi
 000B2799    xor         ecx,ecx
 000B279B    mov         dword ptr [ebp-0C],ecx
 000B279E    mov         dword ptr [ebp-24],ecx
 000B27A1    mov         dword ptr [ebp-4],ecx
 000B27A4    xor         eax,eax
 000B27A6    push        ebp
 000B27A7    push        0B29CC
 000B27AC    push        dword ptr fs:[eax]
 000B27AF    mov         dword ptr fs:[eax],esp
 000B27B2    mov         eax,[000B586C];^gvar_000B6B8C:dword
 000B27B7    cmp         dword ptr [eax],0
>000B27BA    je          000B27C6
 000B27BC    mov         eax,[000B5970];^gvar_000B6B90
 000B27C1    cmp         dword ptr [eax],0
>000B27C4    jne         000B27E0
 000B27C6    lea         edx,[ebp-0C]
 000B27C9    mov         eax,7E7
 000B27CE    call        LoadStr;'No block marked'
 000B27D3    mov         eax,dword ptr [ebp-0C]
 000B27D6    call        0008D0A8
>000B27DB    jmp         000B29A6
 000B27E0    mov         eax,[000B5970];^gvar_000B6B90
 000B27E5    mov         eax,dword ptr [eax]
 000B27E7    mov         edx,dword ptr ds:[0B586C];^gvar_000B6B8C:dword
 000B27ED    sub         eax,dword ptr [edx]
 000B27EF    inc         eax
 000B27F0    lea         ebx,[eax+eax*2]
 000B27F3    dec         ebx
 000B27F4    cmp         ebx,8000
>000B27FA    jle         000B283A
 000B27FC    lea         eax,[ebp-0C]
 000B27FF    push        eax
 000B2800    fld         tbyte ptr ds:[0B29DC];32768:Extended
 000B2806    call        @INT
 000B280B    fstp        tbyte ptr [ebp-20]
 000B280E    wait
 000B280F    lea         eax,[ebp-20]
 000B2812    mov         dword ptr [ebp-14],eax
 000B2815    mov         byte ptr [ebp-10],3
 000B2819    lea         edx,[ebp-14]
 000B281C    xor         ecx,ecx
 000B281E    mov         eax,824
 000B2823    call        FmtLoadStr;'Copy more than %.0n bytes text
 to clipboard?'
 000B2828    mov         eax,dword ptr [ebp-0C]
 000B282B    call        0008D0C4
 000B2830    cmp         ax,6
>000B2834    jne         000B29A6
 000B283A    lea         edx,[ebp-0C]
 000B283D    mov         eax,7ED
 000B2842    call        LoadStr;'Copy data to clipboard'
 000B2847    mov         eax,dword ptr [ebp-0C]
 000B284A    push        eax
 000B284B    lea         edx,[ebp-24]
 000B284E    mov         eax,7FF
 000B2853    call        LoadStr;'Current file position'
 000B2858    mov         eax,dword ptr [ebp-24]
 000B285B    push        eax
 000B285C    push        1
 000B285E    push        1
 000B2860    mov         ecx,dword ptr ds:[0B70A4];gvar_000B70A4:TFormMain
 000B2866    mov         dl,1
 000B2868    mov         eax,[0008C62C];TProgressBox
 000B286D    call        TProgressBox.Create;TProgressBox.Create
 000B2872    mov         edx,dword ptr ds:[0B5A9C];^gvar_000B6D00:TProgressBox
 000B2878    mov         dword ptr [edx],eax
 000B287A    xor         eax,eax
 000B287C    push        ebp
 000B287D    push        0B299F
 000B2882    push        dword ptr fs:[eax]
 000B2885    mov         dword ptr fs:[eax],esp
 000B2888    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000B288D    mov         eax,dword ptr [eax]
 000B288F    call        TCustomForm.Show
 000B2894    lea         eax,[ebx+1]
 000B2897    call        StrAlloc
 000B289C    mov         dword ptr [ebp-8],eax
 000B289F    xor         esi,esi
 000B28A1    mov         ebx,dword ptr ds:[0B586C];^gvar_000B6B8C:dword
 000B28A7    mov         ebx,dword ptr [ebx]
 000B28A9    mov         edi,dword ptr ds:[0B5970];^gvar_000B6B90
 000B28AF    mov         edi,dword ptr [edi]
 000B28B1    sub         edi,ebx
>000B28B3    jl          000B2943
 000B28B9    inc         edi
 000B28BA    mov         eax,ebx
 000B28BC    call        000981AC
 000B28C1    lea         edx,[ebp-4]
 000B28C4    call        00074C9C
 000B28C9    mov         eax,[000B5970];^gvar_000B6B90
 000B28CE    cmp         ebx,dword ptr [eax]
>000B28D0    jge         000B28DF
 000B28D2    lea         eax,[ebp-4]
 000B28D5    mov         edx,0B29F0;' '
 000B28DA    call        @LStrCat
 000B28DF    mov         eax,dword ptr [ebp-4]
 000B28E2    call        @LStrLen
 000B28E7    push        eax
 000B28E8    lea         eax,[ebp-4]
 000B28EB    call        UniqueString
 000B28F0    mov         edx,dword ptr [ebp-8]
 000B28F3    add         edx,esi
 000B28F5    pop         ecx
 000B28F6    call        Move
 000B28FB    mov         eax,dword ptr [ebp-4]
 000B28FE    call        @LStrLen
 000B2903    add         esi,eax
 000B2905    mov         eax,ebx
 000B2907    mov         ecx,64
 000B290C    cdq
 000B290D    idiv        eax,ecx
 000B290F    test        edx,edx
>000B2911    jne         000B293B
 000B2913    push        5
 000B2915    mov         ecx,dword ptr ds:[0B5970];^gvar_000B6B90
 000B291B    mov         ecx,dword ptr [ecx]
 000B291D    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000B2922    mov         eax,dword ptr [eax]
 000B2924    mov         edx,ebx
 000B2926    call        0008E1A4
 000B292B    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000B2930    mov         eax,dword ptr [eax]
 000B2932    cmp         byte ptr [eax+2DC],0
>000B2939    jne         000B2943
 000B293B    inc         ebx
 000B293C    dec         edi
>000B293D    jne         000B28BA
 000B2943    mov         eax,dword ptr [ebp-8]
 000B2946    mov         byte ptr [eax+esi],0
 000B294A    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000B294F    mov         eax,dword ptr [eax]
 000B2951    cmp         byte ptr [eax+2DC],0
>000B2958    jne         000B2974
 000B295A    lea         eax,[ebp-0C]
 000B295D    mov         edx,dword ptr [ebp-8]
 000B2960    call        @LStrFromPChar
 000B2965    mov         eax,dword ptr [ebp-0C]
 000B2968    push        eax
 000B2969    call        Clipboard
 000B296E    pop         edx
 000B296F    call        TClipboard.SetAsText
 000B2974    xor         eax,eax
 000B2976    pop         edx
 000B2977    pop         ecx
 000B2978    pop         ecx
 000B2979    mov         dword ptr fs:[eax],edx
 000B297C    push        0B29A6
 000B2981    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000B2986    mov         eax,dword ptr [eax]
 000B2988    call        TObject.Free
 000B298D    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000B2992    xor         edx,edx
 000B2994    mov         dword ptr [eax],edx
 000B2996    mov         eax,dword ptr [ebp-8]
 000B2999    call        StrDispose
 000B299E    ret
>000B299F    jmp         @HandleFinally
>000B29A4    jmp         000B2981
 000B29A6    xor         eax,eax
 000B29A8    pop         edx
 000B29A9    pop         ecx
 000B29AA    pop         ecx
 000B29AB    mov         dword ptr fs:[eax],edx
 000B29AE    push        0B29D3
 000B29B3    lea         eax,[ebp-24]
 000B29B6    call        @LStrClr
 000B29BB    lea         eax,[ebp-0C]
 000B29BE    call        @LStrClr
 000B29C3    lea         eax,[ebp-4]
 000B29C6    call        @LStrClr
 000B29CB    ret
>000B29CC    jmp         @HandleFinally
>000B29D1    jmp         000B29B3
 000B29D3    pop         edi
 000B29D4    pop         esi
 000B29D5    pop         ebx
 000B29D6    mov         esp,ebp
 000B29D8    pop         ebp
 000B29D9    ret
*}
end;

//000B29F4
procedure TFormMain.Print1Click(Sender:TObject);
begin
{*
 000B29F4    push        ebp
 000B29F5    mov         ebp,esp
 000B29F7    push        0
 000B29F9    push        ebx
 000B29FA    mov         ebx,eax
 000B29FC    xor         eax,eax
 000B29FE    push        ebp
 000B29FF    push        0B2ABF
 000B2A04    push        dword ptr fs:[eax]
 000B2A07    mov         dword ptr fs:[eax],esp
 000B2A0A    mov         ecx,ebx
 000B2A0C    mov         dl,1
 000B2A0E    mov         eax,[000A337C];TFormPrint
 000B2A13    call        TCustomForm.Create;TFormPrint.Create
 000B2A18    mov         edx,dword ptr ds:[0B57EC];^gvar_000B708C:TFormPrint
 000B2A1E    mov         dword ptr [edx],eax
 000B2A20    xor         eax,eax
 000B2A22    push        ebp
 000B2A23    push        0B2AA2
 000B2A28    push        dword ptr fs:[eax]
 000B2A2B    mov         dword ptr fs:[eax],esp
 000B2A2E    lea         edx,[ebp-4]
 000B2A31    mov         eax,825
 000B2A36    call        LoadStr;'Print'
 000B2A3B    mov         edx,dword ptr [ebp-4]
 000B2A3E    mov         eax,[000B57EC];^gvar_000B708C:TFormPrint
 000B2A43    mov         eax,dword ptr [eax]
 000B2A45    call        TControl.SetText
 000B2A4A    call        00099AA8
 000B2A4F    test        al,al
>000B2A51    je          000B2A6A
 000B2A53    mov         eax,[000B57EC];^gvar_000B708C:TFormPrint
 000B2A58    mov         eax,dword ptr [eax]
 000B2A5A    mov         eax,dword ptr [eax+2DC]
 000B2A60    mov         dl,1
 000B2A62    mov         ecx,dword ptr [eax]
 000B2A64    call        dword ptr [ecx+0BC]
 000B2A6A    mov         eax,[000B57EC];^gvar_000B708C:TFormPrint
 000B2A6F    mov         eax,dword ptr [eax]
 000B2A71    mov         edx,dword ptr [eax]
 000B2A73    call        dword ptr [edx+0CC]
 000B2A79    dec         eax
>000B2A7A    jne         000B2A88
 000B2A7C    mov         eax,[000B57EC];^gvar_000B708C:TFormPrint
 000B2A81    mov         eax,dword ptr [eax]
 000B2A83    call        000A3D58
 000B2A88    xor         eax,eax
 000B2A8A    pop         edx
 000B2A8B    pop         ecx
 000B2A8C    pop         ecx
 000B2A8D    mov         dword ptr fs:[eax],edx
 000B2A90    push        0B2AA9
 000B2A95    mov         eax,[000B57EC];^gvar_000B708C:TFormPrint
 000B2A9A    mov         eax,dword ptr [eax]
 000B2A9C    call        TCustomForm.Release
 000B2AA1    ret
>000B2AA2    jmp         @HandleFinally
>000B2AA7    jmp         000B2A95
 000B2AA9    xor         eax,eax
 000B2AAB    pop         edx
 000B2AAC    pop         ecx
 000B2AAD    pop         ecx
 000B2AAE    mov         dword ptr fs:[eax],edx
 000B2AB1    push        0B2AC6
 000B2AB6    lea         eax,[ebp-4]
 000B2AB9    call        @LStrClr
 000B2ABE    ret
>000B2ABF    jmp         @HandleFinally
>000B2AC4    jmp         000B2AB6
 000B2AC6    pop         ebx
 000B2AC7    pop         ecx
 000B2AC8    pop         ebp
 000B2AC9    ret
*}
end;

//000B2ACC
procedure TFormMain.FormMouseDown(Sender:TObject; Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);
begin
{*
 000B2ACC    push        ebp
 000B2ACD    mov         ebp,esp
 000B2ACF    add         esp,0FFFFFFDC
 000B2AD2    push        ebx
 000B2AD3    push        esi
 000B2AD4    mov         esi,edx
 000B2AD6    mov         ebx,eax
 000B2AD8    mov         eax,dword ptr [ebx+310];TFormMain.CMStrGridText:TCMStrGrid
 000B2ADE    mov         edx,dword ptr [eax]
 000B2AE0    call        dword ptr [edx+50];TGroupBox.GetEnabled
 000B2AE3    test        al,al
>000B2AE5    jne         000B2B94
 000B2AEB    mov         eax,dword ptr [ebx+310];TFormMain.CMStrGridText:TCMStrGrid
 000B2AF1    call        0008F4F4
 000B2AF6    test        al,al
>000B2AF8    je          000B2B94
 000B2AFE    mov         edx,esi
 000B2B00    mov         eax,ebx
 000B2B02    call        TFormMain.ModusText1Click
 000B2B07    lea         ecx,[ebp-10]
 000B2B0A    mov         edx,dword ptr [ebp+8]
 000B2B0D    mov         eax,dword ptr [ebp+0C]
 000B2B10    call        Point
 000B2B15    lea         ecx,[ebp-24]
 000B2B18    lea         edx,[ebp-10]
 000B2B1B    mov         eax,ebx
 000B2B1D    call        TControl.ClientToScreen
 000B2B22    lea         edx,[ebp-24]
 000B2B25    lea         ecx,[ebp-1C]
 000B2B28    mov         eax,dword ptr [ebx+310];TFormMain.CMStrGridText:TCMStrGrid
 000B2B2E    call        TControl.ScreenToClient
 000B2B33    mov         eax,dword ptr [ebp-1C]
 000B2B36    mov         dword ptr [ebp-10],eax
 000B2B39    mov         eax,dword ptr [ebp-18]
 000B2B3C    mov         dword ptr [ebp-0C],eax
 000B2B3F    lea         eax,[ebp-4]
 000B2B42    push        eax
 000B2B43    lea         eax,[ebp-8]
 000B2B46    push        eax
 000B2B47    mov         ecx,dword ptr [ebp-0C]
 000B2B4A    mov         edx,dword ptr [ebp-10]
 000B2B4D    mov         eax,dword ptr [ebx+310];TFormMain.CMStrGridText:TCMStrGrid
 000B2B53    call        TDrawGrid.MouseToCell
 000B2B58    mov         byte ptr [ebp-11],1
 000B2B5C    mov         eax,dword ptr [ebp-8]
 000B2B5F    push        eax
 000B2B60    lea         eax,[ebp-11]
 000B2B63    push        eax
 000B2B64    mov         ecx,dword ptr [ebp-4]
 000B2B67    mov         edx,dword ptr [ebx+310];TFormMain.CMStrGridText:TCMStrGrid
 000B2B6D    mov         eax,ebx
 000B2B6F    call        TFormMain.CMStrGridTextHexSelectCell
 000B2B74    cmp         byte ptr [ebp-11],0
>000B2B78    je          000B2C47
 000B2B7E    mov         ecx,dword ptr [ebp-8]
 000B2B81    mov         edx,dword ptr [ebp-4]
 000B2B84    mov         eax,dword ptr [ebx+310];TFormMain.CMStrGridText:TCMStrGrid
 000B2B8A    call        000892A8
>000B2B8F    jmp         000B2C47
 000B2B94    mov         eax,dword ptr [ebx+314];TFormMain.CMStrGridHex:TCMStrGrid
 000B2B9A    mov         edx,dword ptr [eax]
 000B2B9C    call        dword ptr [edx+50];TGroupBox.GetEnabled
 000B2B9F    test        al,al
>000B2BA1    jne         000B2C47
 000B2BA7    mov         eax,dword ptr [ebx+314];TFormMain.CMStrGridHex:TCMStrGrid
 000B2BAD    call        0008F4F4
 000B2BB2    test        al,al
>000B2BB4    je          000B2C47
 000B2BBA    mov         edx,esi
 000B2BBC    mov         eax,ebx
 000B2BBE    call        TFormMain.ModusText1Click
 000B2BC3    lea         ecx,[ebp-10]
 000B2BC6    mov         edx,dword ptr [ebp+8]
 000B2BC9    mov         eax,dword ptr [ebp+0C]
 000B2BCC    call        Point
 000B2BD1    lea         ecx,[ebp-24]
 000B2BD4    lea         edx,[ebp-10]
 000B2BD7    mov         eax,ebx
 000B2BD9    call        TControl.ClientToScreen
 000B2BDE    lea         edx,[ebp-24]
 000B2BE1    lea         ecx,[ebp-1C]
 000B2BE4    mov         eax,dword ptr [ebx+314];TFormMain.CMStrGridHex:TCMStrGrid
 000B2BEA    call        TControl.ScreenToClient
 000B2BEF    mov         eax,dword ptr [ebp-1C]
 000B2BF2    mov         dword ptr [ebp-10],eax
 000B2BF5    mov         eax,dword ptr [ebp-18]
 000B2BF8    mov         dword ptr [ebp-0C],eax
 000B2BFB    lea         eax,[ebp-4]
 000B2BFE    push        eax
 000B2BFF    lea         eax,[ebp-8]
 000B2C02    push        eax
 000B2C03    mov         ecx,dword ptr [ebp-0C]
 000B2C06    mov         edx,dword ptr [ebp-10]
 000B2C09    mov         eax,dword ptr [ebx+314];TFormMain.CMStrGridHex:TCMStrGrid
 000B2C0F    call        TDrawGrid.MouseToCell
 000B2C14    mov         byte ptr [ebp-11],1
 000B2C18    mov         eax,dword ptr [ebp-8]
 000B2C1B    push        eax
 000B2C1C    lea         eax,[ebp-11]
 000B2C1F    push        eax
 000B2C20    mov         ecx,dword ptr [ebp-4]
 000B2C23    mov         edx,dword ptr [ebx+314];TFormMain.CMStrGridHex:TCMStrGrid
 000B2C29    mov         eax,ebx
 000B2C2B    call        TFormMain.CMStrGridTextHexSelectCell
 000B2C30    cmp         byte ptr [ebp-11],0
>000B2C34    je          000B2C47
 000B2C36    mov         ecx,dword ptr [ebp-8]
 000B2C39    mov         edx,dword ptr [ebp-4]
 000B2C3C    mov         eax,dword ptr [ebx+314];TFormMain.CMStrGridHex:TCMStrGrid
 000B2C42    call        000892A8
 000B2C47    pop         esi
 000B2C48    pop         ebx
 000B2C49    mov         esp,ebp
 000B2C4B    pop         ebp
 000B2C4C    ret         0C
*}
end;

//000B2C50
procedure TFormMain.Bitmanipulation1Click(Sender:TObject);
begin
{*
 000B2C50    push        ebp
 000B2C51    mov         ebp,esp
 000B2C53    push        ebx
 000B2C54    mov         ebx,eax
 000B2C56    mov         eax,[000B5BA0];^gvar_000B6BAC:Single
 000B2C5B    cmp         dword ptr [eax],0
>000B2C5E    je          000B2CDA
 000B2C60    mov         ecx,ebx
 000B2C62    mov         dl,1
 000B2C64    mov         eax,[000A5470];TFormBit
 000B2C69    call        TCustomForm.Create;TFormBit.Create
 000B2C6E    mov         edx,dword ptr ds:[0B5AF0];^gvar_000B7094:TFormBit
 000B2C74    mov         dword ptr [edx],eax
 000B2C76    xor         eax,eax
 000B2C78    push        ebp
 000B2C79    push        0B2CD3
 000B2C7E    push        dword ptr fs:[eax]
 000B2C81    mov         dword ptr fs:[eax],esp
 000B2C84    call        000981C4
 000B2C89    call        000981AC
 000B2C8E    mov         edx,dword ptr ds:[0B5AF0];^gvar_000B7094:TFormBit
 000B2C94    mov         edx,dword ptr [edx]
 000B2C96    mov         byte ptr [edx+308],al
 000B2C9C    mov         eax,[000B5AF0];^gvar_000B7094:TFormBit
 000B2CA1    mov         eax,dword ptr [eax]
 000B2CA3    xor         edx,edx
 000B2CA5    call        TFormBit.ButtonRereadClick
 000B2CAA    mov         eax,[000B5AF0];^gvar_000B7094:TFormBit
 000B2CAF    mov         eax,dword ptr [eax]
 000B2CB1    mov         edx,dword ptr [eax]
 000B2CB3    call        dword ptr [edx+0CC]
 000B2CB9    xor         eax,eax
 000B2CBB    pop         edx
 000B2CBC    pop         ecx
 000B2CBD    pop         ecx
 000B2CBE    mov         dword ptr fs:[eax],edx
 000B2CC1    push        0B2CDA
 000B2CC6    mov         eax,[000B5AF0];^gvar_000B7094:TFormBit
 000B2CCB    mov         eax,dword ptr [eax]
 000B2CCD    call        TCustomForm.Release
 000B2CD2    ret
>000B2CD3    jmp         @HandleFinally
>000B2CD8    jmp         000B2CC6
 000B2CDA    pop         ebx
 000B2CDB    pop         ebp
 000B2CDC    ret
*}
end;

//000B2CE0
procedure TFormMain.File1Click(Sender:TObject);
begin
{*
 000B2CE0    mov         edx,dword ptr ds:[0B5BA0];^gvar_000B6BAC:Single
 000B2CE6    cmp         dword ptr [edx],0
 000B2CE9    setg        dl
 000B2CEC    mov         eax,dword ptr [eax+410];TFormMain.Print1:TMenuItem
 000B2CF2    call        TMenuItem.SetEnabled
 000B2CF7    ret
*}
end;

//000B2CF8
procedure TFormMain.Edit1Click(Sender:TObject);
begin
{*
 000B2CF8    push        ebx
 000B2CF9    mov         ebx,eax
 000B2CFB    mov         eax,[000B5BA0];^gvar_000B6BAC:Single
 000B2D00    cmp         dword ptr [eax],0
 000B2D03    setg        dl
 000B2D06    mov         eax,dword ptr [ebx+334];TFormMain.Deletefromcursor1:TMenuItem
 000B2D0C    call        TMenuItem.SetEnabled
 000B2D11    mov         eax,[000B5BA0];^gvar_000B6BAC:Single
 000B2D16    cmp         dword ptr [eax],0
 000B2D19    setg        dl
 000B2D1C    mov         eax,dword ptr [ebx+338];TFormMain.Deletetocursor1:TMenuItem
 000B2D22    call        TMenuItem.SetEnabled
 000B2D27    pop         ebx
 000B2D28    ret
*}
end;

//000B2D2C
procedure TFormMain.Address1Click(Sender:TObject);
begin
{*
 000B2D2C    push        ebx
 000B2D2D    mov         ebx,eax
 000B2D2F    mov         eax,[000B5BA0];^gvar_000B6BAC:Single
 000B2D34    cmp         dword ptr [eax],0
 000B2D37    setg        dl
 000B2D3A    mov         eax,dword ptr [ebx+35C];TFormMain.Rememberaddress1:TMenuItem
 000B2D40    call        TMenuItem.SetEnabled
 000B2D45    mov         eax,[000B5BA0];^gvar_000B6BAC:Single
 000B2D4A    cmp         dword ptr [eax],0
 000B2D4D    setg        dl
 000B2D50    mov         eax,dword ptr [ebx+360];TFormMain.Gotoremembered1:TMenuItem
 000B2D56    call        TMenuItem.SetEnabled
 000B2D5B    mov         eax,[000B5BA0];^gvar_000B6BAC:Single
 000B2D60    cmp         dword ptr [eax],0
 000B2D63    setg        dl
 000B2D66    mov         eax,dword ptr [ebx+364];TFormMain.Displaydifference1:TMenuItem
 000B2D6C    call        TMenuItem.SetEnabled
 000B2D71    pop         ebx
 000B2D72    ret
*}
end;

//000B2D74
procedure TFormMain.Tools1Click(Sender:TObject);
begin
{*
 000B2D74    push        ebx
 000B2D75    mov         ebx,eax
 000B2D77    mov         eax,[000B5BA0];^gvar_000B6BAC:Single
 000B2D7C    cmp         dword ptr [eax],0
 000B2D7F    setg        dl
 000B2D82    mov         eax,dword ptr [ebx+370];TFormMain.Decode1:TMenuItem
 000B2D88    call        TMenuItem.SetEnabled
 000B2D8D    mov         eax,[000B5BA0];^gvar_000B6BAC:Single
 000B2D92    cmp         dword ptr [eax],0
 000B2D95    setg        dl
 000B2D98    mov         eax,dword ptr [ebx+41C];TFormMain.Bitmanipulation1:TMenuItem
 000B2D9E    call        TMenuItem.SetEnabled
 000B2DA3    mov         eax,[000B5BA0];^gvar_000B6BAC:Single
 000B2DA8    cmp         dword ptr [eax],0
 000B2DAB    setg        dl
 000B2DAE    mov         eax,dword ptr [ebx+480];TFormMain.CalculateCRC321:TMenuItem
 000B2DB4    call        TMenuItem.SetEnabled
 000B2DB9    mov         eax,[000B5BA0];^gvar_000B6BAC:Single
 000B2DBE    cmp         dword ptr [eax],0
 000B2DC1    setg        dl
 000B2DC4    mov         eax,dword ptr [ebx+3A4];TFormMain.Patch1:TMenuItem
 000B2DCA    call        TMenuItem.SetEnabled
 000B2DCF    mov         eax,[000B5BA0];^gvar_000B6BAC:Single
 000B2DD4    cmp         dword ptr [eax],0
 000B2DD7    setg        dl
 000B2DDA    mov         eax,dword ptr [ebx+48C];TFormMain.Shredderdata1:TMenuItem
 000B2DE0    call        TMenuItem.SetEnabled
 000B2DE5    pop         ebx
 000B2DE6    ret
*}
end;

//000B2DE8
procedure sub_000B2DE8(?:TFormMain);
begin
{*
 000B2DE8    push        ebp
 000B2DE9    mov         ebp,esp
 000B2DEB    add         esp,0FFFFFFD0
 000B2DEE    push        ebx
 000B2DEF    push        esi
 000B2DF0    push        edi
 000B2DF1    xor         edx,edx
 000B2DF3    mov         dword ptr [ebp-18],edx
 000B2DF6    mov         dword ptr [ebp-4],edx
 000B2DF9    mov         dword ptr [ebp-8],edx
 000B2DFC    mov         dword ptr [ebp-0C],edx
 000B2DFF    mov         esi,eax
 000B2E01    xor         eax,eax
 000B2E03    push        ebp
 000B2E04    push        0B2FEA
 000B2E09    push        dword ptr fs:[eax]
 000B2E0C    mov         dword ptr fs:[eax],esp
 000B2E0F    mov         eax,dword ptr [esi+4A0];TFormMain.?f4A0:TStringList
 000B2E15    mov         edx,dword ptr [eax]
 000B2E17    call        dword ptr [edx+14];TStringList.GetCount
 000B2E1A    test        eax,eax
 000B2E1C    setg        dl
 000B2E1F    mov         eax,dword ptr [esi+434];TFormMain.Remove1:TMenuItem
 000B2E25    call        TMenuItem.SetEnabled
 000B2E2A    mov         eax,dword ptr [esi+4A0];TFormMain.?f4A0:TStringList
 000B2E30    mov         edx,dword ptr [eax]
 000B2E32    call        dword ptr [edx+14];TStringList.GetCount
 000B2E35    test        eax,eax
 000B2E37    setg        dl
 000B2E3A    mov         eax,dword ptr [esi+438];TFormMain.Removeall1:TMenuItem
 000B2E40    call        TMenuItem.SetEnabled
 000B2E45    mov         eax,dword ptr [esi+4A0];TFormMain.?f4A0:TStringList
 000B2E4B    mov         edx,dword ptr [eax]
 000B2E4D    call        dword ptr [edx+14];TStringList.GetCount
 000B2E50    test        eax,eax
 000B2E52    setg        dl
 000B2E55    mov         eax,dword ptr [esi+468];TFormMain.Savetofile1:TMenuItem
 000B2E5B    call        TMenuItem.SetEnabled
 000B2E60    mov         eax,dword ptr [esi+4A0];TFormMain.?f4A0:TStringList
 000B2E66    mov         edx,dword ptr [eax]
 000B2E68    call        dword ptr [edx+14];TStringList.GetCount
 000B2E6B    test        eax,eax
 000B2E6D    setg        dl
 000B2E70    mov         eax,dword ptr [esi+43C];TFormMain.Bookmarkdivi:TMenuItem
 000B2E76    call        TMenuItem.SetVisible
 000B2E7B    mov         eax,dword ptr [esi+4A0];TFormMain.?f4A0:TStringList
 000B2E81    mov         edx,dword ptr [eax]
 000B2E83    call        dword ptr [edx+14];TStringList.GetCount
 000B2E86    dec         eax
 000B2E87    test        eax,eax
>000B2E89    jl          000B2FA1
 000B2E8F    inc         eax
 000B2E90    mov         dword ptr [ebp-14],eax
 000B2E93    xor         ebx,ebx
 000B2E95    lea         ecx,[ebp-4]
 000B2E98    mov         edx,ebx
 000B2E9A    mov         eax,dword ptr [esi+4A0];TFormMain.?f4A0:TStringList
 000B2EA0    mov         edi,dword ptr [eax]
 000B2EA2    call        dword ptr [edi+0C];TStringList.Get
 000B2EA5    mov         edx,dword ptr [ebp-4]
 000B2EA8    mov         eax,0B3000;' '
 000B2EAD    call        @LStrPos
 000B2EB2    mov         edi,eax
 000B2EB4    lea         eax,[ebp-8]
 000B2EB7    push        eax
 000B2EB8    mov         ecx,edi
 000B2EBA    dec         ecx
 000B2EBB    mov         edx,1
 000B2EC0    mov         eax,dword ptr [ebp-4]
 000B2EC3    call        @LStrCopy
 000B2EC8    mov         eax,dword ptr [ebp-8]
 000B2ECB    call        StrToInt
 000B2ED0    mov         edx,dword ptr ds:[0B5B1C];^gvar_000B55F8:Longint
 000B2ED6    add         eax,dword ptr [edx]
 000B2ED8    dec         eax
 000B2ED9    mov         dword ptr [ebp-10],eax
 000B2EDC    lea         eax,[ebp-0C]
 000B2EDF    push        eax
 000B2EE0    mov         eax,dword ptr [ebp-4]
 000B2EE3    call        @LStrLen
 000B2EE8    mov         ecx,eax
 000B2EEA    sub         ecx,edi
 000B2EEC    lea         edx,[edi+1]
 000B2EEF    mov         eax,dword ptr [ebp-4]
 000B2EF2    call        @LStrCopy
 000B2EF7    mov         eax,[000B5B00];^gvar_000B6BA4
 000B2EFC    cmp         byte ptr [eax],0
>000B2EFF    je          000B2F46
 000B2F01    lea         eax,[ebp-18]
 000B2F04    push        eax
 000B2F05    lea         eax,[ebx+1]
 000B2F08    mov         dword ptr [ebp-30],eax
 000B2F0B    mov         byte ptr [ebp-2C],0
 000B2F0F    mov         eax,dword ptr [ebp-10]
 000B2F12    mov         dword ptr [ebp-28],eax
 000B2F15    mov         byte ptr [ebp-24],0
 000B2F19    mov         eax,dword ptr [ebp-0C]
 000B2F1C    mov         dword ptr [ebp-20],eax
 000B2F1F    mov         byte ptr [ebp-1C],0B
 000B2F23    lea         edx,[ebp-30]
 000B2F26    mov         ecx,2
 000B2F2B    mov         eax,0B300C;'&%d %d: %s'
 000B2F30    call        Format
 000B2F35    mov         edx,dword ptr [ebp-18]
 000B2F38    mov         eax,dword ptr [esi+ebx*4+4A4]
 000B2F3F    call        TMenuItem.SetCaption
>000B2F44    jmp         000B2F89
 000B2F46    lea         eax,[ebp-18]
 000B2F49    push        eax
 000B2F4A    lea         eax,[ebx+1]
 000B2F4D    mov         dword ptr [ebp-30],eax
 000B2F50    mov         byte ptr [ebp-2C],0
 000B2F54    mov         eax,dword ptr [ebp-10]
 000B2F57    mov         dword ptr [ebp-28],eax
 000B2F5A    mov         byte ptr [ebp-24],0
 000B2F5E    mov         eax,dword ptr [ebp-0C]
 000B2F61    mov         dword ptr [ebp-20],eax
 000B2F64    mov         byte ptr [ebp-1C],0B
 000B2F68    lea         edx,[ebp-30]
 000B2F6B    mov         ecx,2
 000B2F70    mov         eax,0B3020;'&%d $%x: %s'
 000B2F75    call        Format
 000B2F7A    mov         edx,dword ptr [ebp-18]
 000B2F7D    mov         eax,dword ptr [esi+ebx*4+4A4]
 000B2F84    call        TMenuItem.SetCaption
 000B2F89    mov         dl,1
 000B2F8B    mov         eax,dword ptr [esi+ebx*4+4A4]
 000B2F92    call        TMenuItem.SetVisible
 000B2F97    inc         ebx
 000B2F98    dec         dword ptr [ebp-14]
>000B2F9B    jne         000B2E95
 000B2FA1    mov         eax,dword ptr [esi+4A0];TFormMain.?f4A0:TStringList
 000B2FA7    mov         edx,dword ptr [eax]
 000B2FA9    call        dword ptr [edx+14];TStringList.GetCount
 000B2FAC    mov         ebx,eax
 000B2FAE    cmp         ebx,8
>000B2FB1    jg          000B2FC7
 000B2FB3    xor         edx,edx
 000B2FB5    mov         eax,dword ptr [esi+ebx*4+4A4]
 000B2FBC    call        TMenuItem.SetVisible
 000B2FC1    inc         ebx
 000B2FC2    cmp         ebx,9
>000B2FC5    jne         000B2FB3
 000B2FC7    xor         eax,eax
 000B2FC9    pop         edx
 000B2FCA    pop         ecx
 000B2FCB    pop         ecx
 000B2FCC    mov         dword ptr fs:[eax],edx
 000B2FCF    push        0B2FF1
 000B2FD4    lea         eax,[ebp-18]
 000B2FD7    call        @LStrClr
 000B2FDC    lea         eax,[ebp-0C]
 000B2FDF    mov         edx,3
 000B2FE4    call        @LStrArrayClr
 000B2FE9    ret
>000B2FEA    jmp         @HandleFinally
>000B2FEF    jmp         000B2FD4
 000B2FF1    pop         edi
 000B2FF2    pop         esi
 000B2FF3    pop         ebx
 000B2FF4    mov         esp,ebp
 000B2FF6    pop         ebp
 000B2FF7    ret
*}
end;

//000B302C
procedure TFormMain.BookmarkClick(Sender:TObject);
begin
{*
 000B302C    push        ebp
 000B302D    mov         ebp,esp
 000B302F    push        0
 000B3031    push        0
 000B3033    push        0
 000B3035    push        ebx
 000B3036    push        esi
 000B3037    mov         ebx,edx
 000B3039    mov         esi,eax
 000B303B    xor         eax,eax
 000B303D    push        ebp
 000B303E    push        0B3125
 000B3043    push        dword ptr fs:[eax]
 000B3046    mov         dword ptr fs:[eax],esp
 000B3049    mov         eax,ebx
 000B304B    mov         edx,dword ptr ds:[4FE44];TMenuItem
 000B3051    call        @AsClass
 000B3056    mov         edx,dword ptr [eax+24];TMenuItem.Caption:String
 000B3059    lea         eax,[ebp-4]
 000B305C    call        @LStrLAsg
 000B3061    lea         eax,[ebp-0C]
 000B3064    push        eax
 000B3065    mov         ecx,1
 000B306A    mov         edx,2
 000B306F    mov         eax,dword ptr [ebp-4]
 000B3072    call        @LStrCopy
 000B3077    mov         eax,dword ptr [ebp-0C]
 000B307A    call        StrToInt
 000B307F    dec         eax
 000B3080    mov         dword ptr [ebp-8],eax
 000B3083    lea         ecx,[ebp-4]
 000B3086    mov         edx,dword ptr [ebp-8]
 000B3089    mov         eax,dword ptr [esi+4A0];TFormMain.?f4A0:TStringList
 000B308F    mov         ebx,dword ptr [eax]
 000B3091    call        dword ptr [ebx+0C];TStringList.Get
 000B3094    lea         eax,[ebp-4]
 000B3097    push        eax
 000B3098    mov         edx,dword ptr [ebp-4]
 000B309B    mov         eax,0B313C;' '
 000B30A0    call        @LStrPos
 000B30A5    mov         ecx,eax
 000B30A7    dec         ecx
 000B30A8    mov         edx,1
 000B30AD    mov         eax,dword ptr [ebp-4]
 000B30B0    call        @LStrCopy
 000B30B5    mov         eax,dword ptr [ebp-4]
 000B30B8    call        StrToInt
 000B30BD    cmp         eax,1
>000B30C0    jl          000B30CC
 000B30C2    mov         edx,dword ptr ds:[0B5BA0];^gvar_000B6BAC:Single
 000B30C8    cmp         eax,dword ptr [edx]
>000B30CA    jle         000B30FE
 000B30CC    lea         edx,[ebp-0C]
 000B30CF    mov         eax,834
 000B30D4    call        LoadStr;'Bookmark invalid. Remove from list?'
 000B30D9    mov         eax,dword ptr [ebp-0C]
 000B30DC    call        0008D0C4
 000B30E1    cmp         ax,6
>000B30E5    jne         000B3107
 000B30E7    mov         edx,dword ptr [ebp-8]
 000B30EA    mov         eax,dword ptr [esi+4A0];TFormMain.?f4A0:TStringList
 000B30F0    mov         ecx,dword ptr [eax]
 000B30F2    call        dword ptr [ecx+44];TStringList.Delete
 000B30F5    mov         eax,esi
 000B30F7    call        000B2DE8
>000B30FC    jmp         000B3107
 000B30FE    mov         cl,1
 000B3100    mov         dl,1
 000B3102    call        000998B0
 000B3107    xor         eax,eax
 000B3109    pop         edx
 000B310A    pop         ecx
 000B310B    pop         ecx
 000B310C    mov         dword ptr fs:[eax],edx
 000B310F    push        0B312C
 000B3114    lea         eax,[ebp-0C]
 000B3117    call        @LStrClr
 000B311C    lea         eax,[ebp-4]
 000B311F    call        @LStrClr
 000B3124    ret
>000B3125    jmp         @HandleFinally
>000B312A    jmp         000B3114
 000B312C    pop         esi
 000B312D    pop         ebx
 000B312E    mov         esp,ebp
 000B3130    pop         ebp
 000B3131    ret
*}
end;

//000B3140
procedure TFormMain.Add1Click(Sender:TObject);
begin
{*
 000B3140    push        ebp
 000B3141    mov         ebp,esp
 000B3143    xor         ecx,ecx
 000B3145    push        ecx
 000B3146    push        ecx
 000B3147    push        ecx
 000B3148    push        ecx
 000B3149    push        ecx
 000B314A    push        ecx
 000B314B    push        ebx
 000B314C    mov         ebx,eax
 000B314E    xor         eax,eax
 000B3150    push        ebp
 000B3151    push        0B3229
 000B3156    push        dword ptr fs:[eax]
 000B3159    mov         dword ptr fs:[eax],esp
 000B315C    mov         eax,dword ptr [ebx+4A0];TFormMain.?f4A0:TStringList
 000B3162    mov         edx,dword ptr [eax]
 000B3164    call        dword ptr [edx+14];TStringList.GetCount
 000B3167    cmp         eax,9
>000B316A    jl          000B3186
 000B316C    lea         edx,[ebp-8]
 000B316F    mov         eax,837
 000B3174    call        LoadStr;'Maximum number of bookmarks reached!'
 000B3179    mov         eax,dword ptr [ebp-8]
 000B317C    call        0008D0A8
>000B3181    jmp         000B3206
 000B3186    lea         eax,[ebp-4]
 000B3189    call        @LStrClr
 000B318E    lea         edx,[ebp-8]
 000B3191    mov         eax,835
 000B3196    call        LoadStr;'Add new bookmark for current address'
 000B319B    mov         eax,dword ptr [ebp-8]
 000B319E    lea         ecx,[ebp-4]
 000B31A1    mov         edx,0B3240;'Name:'
 000B31A6    call        InputQuery
 000B31AB    test        al,al
>000B31AD    je          000B3206
 000B31AF    lea         eax,[ebp-0C]
 000B31B2    push        eax
 000B31B3    call        000981C4
 000B31B8    mov         dword ptr [ebp-14],eax
 000B31BB    mov         byte ptr [ebp-10],0
 000B31BF    lea         edx,[ebp-14]
 000B31C2    xor         ecx,ecx
 000B31C4    mov         eax,0B3250;'%d'
 000B31C9    call        Format
 000B31CE    push        dword ptr [ebp-0C]
 000B31D1    push        0B325C;' '
 000B31D6    lea         edx,[ebp-18]
 000B31D9    mov         eax,dword ptr [ebp-4]
 000B31DC    call        Trim
 000B31E1    push        dword ptr [ebp-18]
 000B31E4    lea         eax,[ebp-8]
 000B31E7    mov         edx,3
 000B31EC    call        @LStrCatN
 000B31F1    mov         edx,dword ptr [ebp-8]
 000B31F4    mov         eax,dword ptr [ebx+4A0];TFormMain.?f4A0:TStringList
 000B31FA    mov         ecx,dword ptr [eax]
 000B31FC    call        dword ptr [ecx+34];TStringList.Add
 000B31FF    mov         eax,ebx
 000B3201    call        000B2DE8
 000B3206    xor         eax,eax
 000B3208    pop         edx
 000B3209    pop         ecx
 000B320A    pop         ecx
 000B320B    mov         dword ptr fs:[eax],edx
 000B320E    push        0B3230
 000B3213    lea         eax,[ebp-18]
 000B3216    call        @LStrClr
 000B321B    lea         eax,[ebp-0C]
 000B321E    mov         edx,3
 000B3223    call        @LStrArrayClr
 000B3228    ret
>000B3229    jmp         @HandleFinally
>000B322E    jmp         000B3213
 000B3230    pop         ebx
 000B3231    mov         esp,ebp
 000B3233    pop         ebp
 000B3234    ret
*}
end;

//000B3260
procedure TFormMain.Remove1Click(Sender:TObject);
begin
{*
 000B3260    push        ebp
 000B3261    mov         ebp,esp
 000B3263    add         esp,0FFFFFFF0
 000B3266    push        ebx
 000B3267    push        esi
 000B3268    xor         ecx,ecx
 000B326A    mov         dword ptr [ebp-10],ecx
 000B326D    mov         dword ptr [ebp-4],eax
 000B3270    xor         eax,eax
 000B3272    push        ebp
 000B3273    push        0B3351
 000B3278    push        dword ptr fs:[eax]
 000B327B    mov         dword ptr fs:[eax],esp
 000B327E    mov         dl,1
 000B3280    mov         eax,[0001F340];TStringList
 000B3285    call        TObject.Create;TStringList.Create
 000B328A    mov         dword ptr [ebp-0C],eax
 000B328D    xor         eax,eax
 000B328F    push        ebp
 000B3290    push        0B3334
 000B3295    push        dword ptr fs:[eax]
 000B3298    mov         dword ptr fs:[eax],esp
 000B329B    mov         ebx,1
 000B32A0    mov         eax,dword ptr [ebp-4]
 000B32A3    mov         esi,dword ptr [eax+ebx*4+4A0]
 000B32AA    cmp         byte ptr [esi+30],0
>000B32AE    je          000B32CE
 000B32B0    mov         eax,dword ptr [ebp-4]
 000B32B3    mov         eax,dword ptr [esi+24]
 000B32B6    lea         ecx,[ebp-10]
 000B32B9    mov         edx,3
 000B32BE    call        00075144
 000B32C3    mov         edx,dword ptr [ebp-10]
 000B32C6    mov         eax,dword ptr [ebp-0C]
 000B32C9    mov         ecx,dword ptr [eax]
 000B32CB    call        dword ptr [ecx+34];TStringList.Add
 000B32CE    inc         ebx
 000B32CF    cmp         ebx,0A
>000B32D2    jne         000B32A0
 000B32D4    xor         eax,eax
 000B32D6    mov         dword ptr [ebp-8],eax
 000B32D9    lea         eax,[ebp-8]
 000B32DC    push        eax
 000B32DD    push        0
 000B32DF    lea         edx,[ebp-10]
 000B32E2    mov         eax,836
 000B32E7    call        LoadStr;'Remove bookmark'
 000B32EC    mov         eax,dword ptr [ebp-10]
 000B32EF    xor         ecx,ecx
 000B32F1    mov         edx,dword ptr [ebp-0C]
 000B32F4    call        0008D4C8
 000B32F9    test        al,al
>000B32FB    je          000B3316
 000B32FD    mov         eax,dword ptr [ebp-4]
 000B3300    mov         eax,dword ptr [eax+4A0];TFormMain.?f4A0:TStringList
 000B3306    mov         edx,dword ptr [ebp-8]
 000B3309    mov         ecx,dword ptr [eax]
 000B330B    call        dword ptr [ecx+44];TStringList.Delete
 000B330E    mov         eax,dword ptr [ebp-4]
 000B3311    call        000B2DE8
 000B3316    xor         eax,eax
 000B3318    pop         edx
 000B3319    pop         ecx
 000B331A    pop         ecx
 000B331B    mov         dword ptr fs:[eax],edx
 000B331E    push        0B333B
 000B3323    mov         eax,dword ptr [ebp-0C]
 000B3326    call        TObject.Free
 000B332B    mov         eax,dword ptr [ebp-4]
 000B332E    call        000B2DE8
 000B3333    ret
>000B3334    jmp         @HandleFinally
>000B3339    jmp         000B3323
 000B333B    xor         eax,eax
 000B333D    pop         edx
 000B333E    pop         ecx
 000B333F    pop         ecx
 000B3340    mov         dword ptr fs:[eax],edx
 000B3343    push        0B3358
 000B3348    lea         eax,[ebp-10]
 000B334B    call        @LStrClr
 000B3350    ret
>000B3351    jmp         @HandleFinally
>000B3356    jmp         000B3348
 000B3358    pop         esi
 000B3359    pop         ebx
 000B335A    mov         esp,ebp
 000B335C    pop         ebp
 000B335D    ret
*}
end;

//000B3360
procedure TFormMain.Removeall1Click(Sender:TObject);
begin
{*
 000B3360    push        ebx
 000B3361    mov         ebx,eax
 000B3363    mov         eax,dword ptr [ebx+4A0];TFormMain.?f4A0:TStringList
 000B3369    mov         edx,dword ptr [eax]
 000B336B    call        dword ptr [edx+40];TStringList.Clear
 000B336E    mov         eax,ebx
 000B3370    call        000B2DE8
 000B3375    pop         ebx
 000B3376    ret
*}
end;

//000B3378
procedure TFormMain.Savetofile1Click(Sender:TObject);
begin
{*
 000B3378    push        ebp
 000B3379    mov         ebp,esp
 000B337B    push        0
 000B337D    push        0
 000B337F    push        ebx
 000B3380    mov         ebx,eax
 000B3382    xor         eax,eax
 000B3384    push        ebp
 000B3385    push        0B3417
 000B338A    push        dword ptr fs:[eax]
 000B338D    mov         dword ptr fs:[eax],esp
 000B3390    lea         edx,[ebp-8]
 000B3393    mov         eax,[000B59E8];^Application:TApplication
 000B3398    mov         eax,dword ptr [eax]
 000B339A    call        TApplication.GetExeName
 000B339F    mov         eax,dword ptr [ebp-8]
 000B33A2    lea         edx,[ebp-4]
 000B33A5    call        ExtractFileDir
 000B33AA    lea         eax,[ebp-4]
 000B33AD    push        eax
 000B33AE    push        0B342C;'*.xbm'
 000B33B3    push        3F
 000B33B5    push        0
 000B33B7    push        0
 000B33B9    push        0
 000B33BB    push        0B343C;'Favorites'
 000B33C0    lea         edx,[ebp-8]
 000B33C3    mov         eax,838
 000B33C8    call        LoadStr;'Save bookmarks'
 000B33CD    mov         ecx,dword ptr [ebp-8]
 000B33D0    mov         eax,[000B5894];^gvar_000B7070:TFormOSE
 000B33D5    mov         eax,dword ptr [eax]
 000B33D7    mov         edx,1
 000B33DC    call        000A1204
 000B33E1    dec         eax
>000B33E2    jne         000B33FC
 000B33E4    mov         eax,[000B5894];^gvar_000B7070:TFormOSE
 000B33E9    mov         eax,dword ptr [eax]
 000B33EB    mov         edx,dword ptr [eax+2DC]
 000B33F1    mov         eax,dword ptr [ebx+4A0];TFormMain.?f4A0:TStringList
 000B33F7    mov         ecx,dword ptr [eax]
 000B33F9    call        dword ptr [ecx+64];TStrings.SaveToFile
 000B33FC    xor         eax,eax
 000B33FE    pop         edx
 000B33FF    pop         ecx
 000B3400    pop         ecx
 000B3401    mov         dword ptr fs:[eax],edx
 000B3404    push        0B341E
 000B3409    lea         eax,[ebp-8]
 000B340C    mov         edx,2
 000B3411    call        @LStrArrayClr
 000B3416    ret
>000B3417    jmp         @HandleFinally
>000B341C    jmp         000B3409
 000B341E    pop         ebx
 000B341F    pop         ecx
 000B3420    pop         ecx
 000B3421    pop         ebp
 000B3422    ret
*}
end;

//000B3448
procedure TFormMain.Loadfromfile1Click(Sender:TObject);
begin
{*
 000B3448    push        ebp
 000B3449    mov         ebp,esp
 000B344B    push        0
 000B344D    push        0
 000B344F    push        ebx
 000B3450    mov         ebx,eax
 000B3452    xor         eax,eax
 000B3454    push        ebp
 000B3455    push        0B34EB
 000B345A    push        dword ptr fs:[eax]
 000B345D    mov         dword ptr fs:[eax],esp
 000B3460    lea         edx,[ebp-8]
 000B3463    mov         eax,[000B59E8];^Application:TApplication
 000B3468    mov         eax,dword ptr [eax]
 000B346A    call        TApplication.GetExeName
 000B346F    mov         eax,dword ptr [ebp-8]
 000B3472    lea         edx,[ebp-4]
 000B3475    call        ExtractFileDir
 000B347A    lea         eax,[ebp-4]
 000B347D    push        eax
 000B347E    push        0B3500;'*.xbm'
 000B3483    push        3F
 000B3485    push        0
 000B3487    push        0
 000B3489    push        0
 000B348B    push        0B3510;'Favorites'
 000B3490    lea         edx,[ebp-8]
 000B3493    mov         eax,839
 000B3498    call        LoadStr;'Load bookmarks'
 000B349D    mov         ecx,dword ptr [ebp-8]
 000B34A0    mov         eax,[000B5894];^gvar_000B7070:TFormOSE
 000B34A5    mov         eax,dword ptr [eax]
 000B34A7    xor         edx,edx
 000B34A9    call        000A1204
 000B34AE    dec         eax
>000B34AF    jne         000B34D0
 000B34B1    mov         eax,[000B5894];^gvar_000B7070:TFormOSE
 000B34B6    mov         eax,dword ptr [eax]
 000B34B8    mov         edx,dword ptr [eax+2DC]
 000B34BE    mov         eax,dword ptr [ebx+4A0];TFormMain.?f4A0:TStringList
 000B34C4    mov         ecx,dword ptr [eax]
 000B34C6    call        dword ptr [ecx+58];TStrings.LoadFromFile
 000B34C9    mov         eax,ebx
 000B34CB    call        000B2DE8
 000B34D0    xor         eax,eax
 000B34D2    pop         edx
 000B34D3    pop         ecx
 000B34D4    pop         ecx
 000B34D5    mov         dword ptr fs:[eax],edx
 000B34D8    push        0B34F2
 000B34DD    lea         eax,[ebp-8]
 000B34E0    mov         edx,2
 000B34E5    call        @LStrArrayClr
 000B34EA    ret
>000B34EB    jmp         @HandleFinally
>000B34F0    jmp         000B34DD
 000B34F2    pop         ebx
 000B34F3    pop         ecx
 000B34F4    pop         ecx
 000B34F5    pop         ebp
 000B34F6    ret
*}
end;

//000B351C
procedure TFormMain.Bookmarks1Click(Sender:TObject);
begin
{*
 000B351C    mov         edx,dword ptr ds:[0B5BA0];^gvar_000B6BAC:Single
 000B3522    cmp         dword ptr [edx],0
 000B3525    setg        dl
 000B3528    mov         eax,dword ptr [eax+430];TFormMain.Add1:TMenuItem
 000B352E    call        TMenuItem.SetEnabled
 000B3533    ret
*}
end;

//000B3534
procedure TFormMain.Editor1Click(Sender:TObject);
begin
{*
 000B3534    mov         eax,[000B5AAC];^gvar_000B709C:TFormScript
 000B3539    mov         eax,dword ptr [eax]
 000B353B    mov         byte ptr [eax+3A4],0
 000B3542    mov         edx,dword ptr ds:[0B5BEC];^gvar_000B6BB4
 000B3548    mov         dl,byte ptr [edx]
 000B354A    mov         eax,[000B5AAC];^gvar_000B709C:TFormScript
 000B354F    mov         eax,dword ptr [eax]
 000B3551    mov         eax,dword ptr [eax+2D0]
 000B3557    mov         ecx,dword ptr [eax]
 000B3559    call        dword ptr [ecx+60]
 000B355C    mov         eax,[000B5AAC];^gvar_000B709C:TFormScript
 000B3561    mov         eax,dword ptr [eax]
 000B3563    mov         edx,dword ptr [eax]
 000B3565    call        dword ptr [edx+0CC]
 000B356B    ret
*}
end;

//000B356C
procedure TFormMain.Executeactive1Click(Sender:TObject);
begin
{*
 000B356C    mov         eax,[000B5BEC];^gvar_000B6BB4
 000B3571    cmp         byte ptr [eax],0
>000B3574    je          000B35AF
 000B3576    mov         eax,[000B5AAC];^gvar_000B709C:TFormScript
 000B357B    mov         eax,dword ptr [eax]
 000B357D    mov         eax,dword ptr [eax+2CC]
 000B3583    mov         eax,dword ptr [eax+204]
 000B3589    mov         edx,dword ptr [eax]
 000B358B    call        dword ptr [edx+14]
 000B358E    test        eax,eax
>000B3590    je          000B35AF
 000B3592    mov         eax,[000B5AAC];^gvar_000B709C:TFormScript
 000B3597    mov         eax,dword ptr [eax]
 000B3599    mov         byte ptr [eax+3A4],1
 000B35A0    mov         eax,[000B5AAC];^gvar_000B709C:TFormScript
 000B35A5    mov         eax,dword ptr [eax]
 000B35A7    mov         edx,dword ptr [eax]
 000B35A9    call        dword ptr [edx+0CC]
 000B35AF    ret
*}
end;

//000B35B0
procedure TFormMain.Script1Click(Sender:TObject);
begin
{*
 000B35B0    push        ebx
 000B35B1    mov         ebx,eax
 000B35B3    mov         eax,[000B5BEC];^gvar_000B6BB4
 000B35B8    cmp         byte ptr [eax],0
>000B35BB    je          000B35D9
 000B35BD    mov         eax,[000B5AAC];^gvar_000B709C:TFormScript
 000B35C2    mov         eax,dword ptr [eax]
 000B35C4    mov         eax,dword ptr [eax+2CC]
 000B35CA    mov         eax,dword ptr [eax+204]
 000B35D0    mov         edx,dword ptr [eax]
 000B35D2    call        dword ptr [edx+14]
 000B35D5    test        eax,eax
>000B35D7    jg          000B35DD
 000B35D9    xor         edx,edx
>000B35DB    jmp         000B35DF
 000B35DD    mov         dl,1
 000B35DF    mov         eax,dword ptr [ebx+478];TFormMain.Executeactive1:TMenuItem
 000B35E5    call        TMenuItem.SetEnabled
 000B35EA    pop         ebx
 000B35EB    ret
*}
end;

//000B35EC
procedure TFormMain.DataInspector1Click(Sender:TObject);
begin
{*
 000B35EC    push        ebx
 000B35ED    mov         ebx,eax
 000B35EF    test        edx,edx
>000B35F1    je          000B3604
 000B35F3    mov         eax,dword ptr [ebx+47C];TFormMain.DataInspector1:TMenuItem
 000B35F9    mov         dl,byte ptr [eax+2C];TMenuItem.Checked:Boolean
 000B35FC    xor         dl,1
 000B35FF    call        TMenuItem.SetChecked
 000B3604    mov         eax,dword ptr [ebx+47C];TFormMain.DataInspector1:TMenuItem
 000B360A    cmp         byte ptr [eax+2C],0;TMenuItem.Checked:Boolean
>000B360E    je          000B3617
 000B3610    call        00093D60
 000B3615    pop         ebx
 000B3616    ret
 000B3617    call        00093DB0
 000B361C    pop         ebx
 000B361D    ret
*}
end;

//000B3620
procedure TFormMain.CalculateCRC321Click(Sender:TObject);
begin
{*
 000B3620    push        ebp
 000B3621    mov         ebp,esp
 000B3623    add         esp,0FFFFFFD0
 000B3626    xor         ecx,ecx
 000B3628    mov         dword ptr [ebp-10],ecx
 000B362B    mov         dword ptr [ebp-24],ecx
 000B362E    mov         dword ptr [ebp-30],ecx
 000B3631    mov         dword ptr [ebp-0C],ecx
 000B3634    xor         eax,eax
 000B3636    push        ebp
 000B3637    push        0B380E
 000B363C    push        dword ptr fs:[eax]
 000B363F    mov         dword ptr fs:[eax],esp
 000B3642    lea         eax,[ebp-6]
 000B3645    push        eax
 000B3646    mov         eax,[000B70A4];gvar_000B70A4:TFormMain
 000B364B    push        eax
 000B364C    push        0B3824;'CRC16/32 of file...'
 000B3651    lea         edx,[ebp-10]
 000B3654    mov         eax,7FF
 000B3659    call        LoadStr;'Current file position'
 000B365E    mov         eax,dword ptr [ebp-10]
 000B3661    push        eax
 000B3662    lea         ecx,[ebp-4]
 000B3665    mov         edx,dword ptr ds:[0B5BA0];^gvar_000B6BAC:Single
 000B366B    mov         edx,dword ptr [edx]
 000B366D    mov         eax,[000B59C0];^gvar_000B6B6C
 000B3672    mov         eax,dword ptr [eax]
 000B3674    call        0008E328
 000B3679    test        al,al
>000B367B    je          000B37E3
 000B3681    lea         eax,[ebp-10]
 000B3684    push        eax
 000B3685    mov         eax,[000B5B50];^gvar_000B6B78:AnsiString
 000B368A    mov         eax,dword ptr [eax]
 000B368C    mov         dword ptr [ebp-20],eax
 000B368F    mov         byte ptr [ebp-1C],0B
 000B3693    mov         eax,[000B5BA0];^gvar_000B6BAC:Single
 000B3698    mov         eax,dword ptr [eax]
 000B369A    mov         dword ptr [ebp-18],eax
 000B369D    mov         byte ptr [ebp-14],0
 000B36A1    lea         edx,[ebp-20]
 000B36A4    mov         ecx,1
 000B36A9    mov         eax,0B3840;'File: %s (%d Bytes)'
 000B36AE    call        Format
 000B36B3    push        dword ptr [ebp-10]
 000B36B6    push        0B385C;#13+#10
 000B36BB    lea         eax,[ebp-24]
 000B36BE    push        eax
 000B36BF    mov         eax,dword ptr [ebp-4]
 000B36C2    mov         dword ptr [ebp-2C],eax
 000B36C5    mov         byte ptr [ebp-28],0
 000B36C9    lea         edx,[ebp-2C]
 000B36CC    xor         ecx,ecx
 000B36CE    mov         eax,0B3868;'CRC32 (PKZIP) of file: %x'
 000B36D3    call        Format
 000B36D8    push        dword ptr [ebp-24]
 000B36DB    push        0B385C;#13+#10
 000B36E0    lea         eax,[ebp-30]
 000B36E3    push        eax
 000B36E4    movzx       eax,word ptr [ebp-6]
 000B36E8    mov         dword ptr [ebp-2C],eax
 000B36EB    mov         byte ptr [ebp-28],0
 000B36EF    lea         edx,[ebp-2C]
 000B36F2    xor         ecx,ecx
 000B36F4    mov         eax,0B388C;'CRC16 (Standard) of file: %x'
 000B36F9    call        Format
 000B36FE    push        dword ptr [ebp-30]
 000B3701    lea         eax,[ebp-0C]
 000B3704    mov         edx,5
 000B3709    call        @LStrCatN
 000B370E    mov         eax,[000B586C];^gvar_000B6B8C:dword
 000B3713    cmp         dword ptr [eax],0
>000B3716    jle         000B37D4
 000B371C    mov         eax,[000B5970];^gvar_000B6B90
 000B3721    cmp         dword ptr [eax],0
>000B3724    jle         000B37D4
 000B372A    lea         eax,[ebp-6]
 000B372D    push        eax
 000B372E    mov         eax,[000B70A4];gvar_000B70A4:TFormMain
 000B3733    push        eax
 000B3734    push        0B38B4;'CRC16/32 of block...'
 000B3739    lea         edx,[ebp-10]
 000B373C    mov         eax,7FF
 000B3741    call        LoadStr;'Current file position'
 000B3746    mov         eax,dword ptr [ebp-10]
 000B3749    push        eax
 000B374A    mov         edx,dword ptr ds:[0B5970];^gvar_000B6B90
 000B3750    mov         edx,dword ptr [edx]
 000B3752    mov         eax,[000B586C];^gvar_000B6B8C:dword
 000B3757    sub         edx,dword ptr [eax]
 000B3759    inc         edx
 000B375A    mov         eax,[000B586C];^gvar_000B6B8C:dword
 000B375F    mov         eax,dword ptr [eax]
 000B3761    mov         ecx,dword ptr ds:[0B59C0];^gvar_000B6B6C
 000B3767    mov         ecx,dword ptr [ecx]
 000B3769    lea         eax,[ecx+eax-1]
 000B376D    lea         ecx,[ebp-4]
 000B3770    call        0008E328
 000B3775    test        al,al
>000B3777    je          000B37E3
 000B3779    push        dword ptr [ebp-0C]
 000B377C    push        0B385C;#13+#10
 000B3781    lea         eax,[ebp-10]
 000B3784    push        eax
 000B3785    mov         eax,dword ptr [ebp-4]
 000B3788    mov         dword ptr [ebp-2C],eax
 000B378B    mov         byte ptr [ebp-28],0
 000B378F    lea         edx,[ebp-2C]
 000B3792    xor         ecx,ecx
 000B3794    mov         eax,0B38D4;'CRC32 (PKZIP) of selected block: %x'
 000B3799    call        Format
 000B379E    push        dword ptr [ebp-10]
 000B37A1    push        0B385C;#13+#10
 000B37A6    lea         eax,[ebp-24]
 000B37A9    push        eax
 000B37AA    movzx       eax,word ptr [ebp-6]
 000B37AE    mov         dword ptr [ebp-2C],eax
 000B37B1    mov         byte ptr [ebp-28],0
 000B37B5    lea         edx,[ebp-2C]
 000B37B8    xor         ecx,ecx
 000B37BA    mov         eax,0B3900;'CRC16 (Standard) of selected block: %x'
 000B37BF    call        Format
 000B37C4    push        dword ptr [ebp-24]
 000B37C7    lea         eax,[ebp-0C]
 000B37CA    mov         edx,5
 000B37CF    call        @LStrCatN
 000B37D4    xor         ecx,ecx
 000B37D6    mov         edx,dword ptr [ebp-0C]
 000B37D9    mov         eax,0B3930;'CRC16/32'
 000B37DE    call        0008D880
 000B37E3    xor         eax,eax
 000B37E5    pop         edx
 000B37E6    pop         ecx
 000B37E7    pop         ecx
 000B37E8    mov         dword ptr fs:[eax],edx
 000B37EB    push        0B3815
 000B37F0    lea         eax,[ebp-30]
 000B37F3    call        @LStrClr
 000B37F8    lea         eax,[ebp-24]
 000B37FB    call        @LStrClr
 000B3800    lea         eax,[ebp-10]
 000B3803    mov         edx,2
 000B3808    call        @LStrArrayClr
 000B380D    ret
>000B380E    jmp         @HandleFinally
>000B3813    jmp         000B37F0
 000B3815    mov         esp,ebp
 000B3817    pop         ebp
 000B3818    ret
*}
end;

//000B393C
procedure TFormMain.Reload1Click(Sender:TObject);
begin
{*
 000B393C    push        ebx
 000B393D    push        esi
 000B393E    push        ecx
 000B393F    mov         esi,edx
 000B3941    mov         ebx,eax
 000B3943    mov         edx,esp
 000B3945    mov         eax,ebx
 000B3947    call        000AD130
 000B394C    test        al,al
>000B394E    je          000B3967
 000B3950    cmp         byte ptr [esp],0
>000B3954    jne         000B3967
 000B3956    mov         ecx,dword ptr ds:[0B5B50];^gvar_000B6B78:AnsiString
 000B395C    mov         ecx,dword ptr [ecx]
 000B395E    mov         edx,esi
 000B3960    mov         eax,ebx
 000B3962    call        000ACD9C
 000B3967    pop         edx
 000B3968    pop         esi
 000B3969    pop         ebx
 000B396A    ret
*}
end;

//000B396C
procedure TFormMain.Donate1Click(Sender:TObject);
begin
{*
 000B396C    mov         eax,[000B5ADC];^gvar_000B7064:TFormAbout2
 000B3971    mov         eax,dword ptr [eax]
 000B3973    call        000A0E44
 000B3978    ret
*}
end;

end.