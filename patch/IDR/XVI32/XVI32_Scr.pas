//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit XVI32_Scr;

interface

uses
  SysUtils, Classes, ExtCtrls, StdCtrls, Cmbtn40, Menus;

type
  TFormScript = class(TForm)
  published
    PanelBottom:TPanel;//f2C4
    PanelTop:TPanel;//f2C8
    MemoScript:TMemo;//f2CC
    ButtonExecute:TButton;//f2D0
    ButtonClose:TButton;//f2D4
    ButtonHelp:TButton;//f2D8
    ButtonSyntax:TButton;//f2DC
    CMBtnOpen:TCMBtn;//f2E0
    CMBtnSave:TCMBtn;//f2E4
    MainMenu1:TMainMenu;//f2E8
    Script1:TMenuItem;//f2EC
    Open1:TMenuItem;//f2F0
    Save1:TMenuItem;//f2F4
    Saveas1:TMenuItem;//f2F8
    N1:TMenuItem;//f2FC
    Exit1:TMenuItem;//f300
    Insertcommand1:TMenuItem;//f304
    REM2:TMenuItem;//f308
    ADR2:TMenuItem;//f30C
    ADR3:TMenuItem;//f310
    ADR1:TMenuItem;//f314
    VERIFYhexstring1:TMenuItem;//f318
    DELADRdecorhexcount1:TMenuItem;//f31C
    OVERWRITEhexstring1:TMenuItem;//f320
    INSERThexstring1:TMenuItem;//f324
    JOKERONhexchar1:TMenuItem;//f328
    JOKEROFF1:TMenuItem;//f32C
    REPLhexstringBYhexstring1:TMenuItem;//f330
    REPLACEALLhexstringBYhexstring1:TMenuItem;//f334
    MSGmessage1:TMenuItem;//f338
    QUIT1:TMenuItem;//f33C
    FINDhexstring1:TMenuItem;//f340
    ADREOFgotoendoffile1:TMenuItem;//f344
    CHARCONxctfilename1:TMenuItem;//f348
    REPLACEASCstringBYstring1:TMenuItem;//f34C
    REPLACEALLASCstringBYstring1:TMenuItem;//f350
    FINDASCstring1:TMenuItem;//f354
    Address1:TMenuItem;//f358
    Find1:TMenuItem;//f35C
    Replace1:TMenuItem;//f360
    Joker1:TMenuItem;//f364
    Bitwiseoperations1:TMenuItem;//f368
    BITNOT1:TMenuItem;//f36C
    BITANDhexbyte1:TMenuItem;//f370
    BITORhexbyte1:TMenuItem;//f374
    BITXORhexbyte1:TMenuItem;//f378
    BITSHLbitcount1:TMenuItem;//f37C
    BITSHRbitcount1:TMenuItem;//f380
    procedure InsertCommandClick(Sender:TObject);//000A6B6C
    procedure Exit1Click(Sender:TObject);//000A66C8
    procedure Saveas1Click(Sender:TObject);//000A66C0
    procedure FormShow(Sender:TObject);//000A9828
    procedure FormCloseQuery(Sender:TObject; var CanClose:Boolean);//000A62DC
    procedure FormDestroy(Sender:TObject);//000A63C0
    procedure ButtonSyntaxClick(Sender:TObject);//000A69F8
    procedure ButtonExecuteClick(Sender:TObject);//000A67F0
    procedure ButtonHelpClick(Sender:TObject);//000A66D0
    procedure Save1Click(Sender:TObject);//000A6694
    procedure Open1Click(Sender:TObject);//000A640C
    procedure FormCreate(Sender:TObject);//000A62F8
  public
    f384:dword;//f384
    f388:byte;//f388
    f389:byte;//f389
    f38C:String;//f38C
    f390:String;//f390
    f394:String;//f394
    f39C:String;//f39C
    f3A0:String;//f3A0
    f3A4:byte;//f3A4
  end;
    //function sub_000A6098(?:TFormScript):?;//000A6098
    //function sub_000A6194(?:TFormScript):?;//000A6194
    procedure sub_000A650C(?:TFormScript; ?:AnsiString);//000A650C
    //procedure sub_000A66E4(?:TFormScript; ?:?);//000A66E4
    procedure sub_000A6D44(?:TFormScript; ?:AnsiString);//000A6D44
    //function sub_000A6E0C(?:TFormScript; ?:AnsiString; ?:AnsiString; ?:?; ?:?):?;//000A6E0C
    //procedure sub_000A6F34(?:TFormScript; ?:AnsiString; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?);//000A6F34
    //procedure sub_000A7044(?:TFormScript; ?:dword; ?:?);//000A7044
    //procedure sub_000A7124(?:TFormScript; ?:String; ?:AnsiString; ?:?; ?:?; ?:?; ?:?);//000A7124
    //procedure sub_000A72D4(?:TFormScript; ?:String; ?:TStringList; ?:?);//000A72D4
    //procedure sub_000A74B8(?:?; ?:?; ?:?; ?:?; ?:?);//000A74B8
    //procedure sub_000A7564(?:?);//000A7564
    //procedure sub_000A75C0(?:TFormScript; ?:?; ?:?);//000A75C0
    //procedure sub_000A7774(?:TFormScript; ?:?; ?:?);//000A7774
    //procedure sub_000A7898(?:TFormScript; ?:?; ?:?);//000A7898
    //procedure sub_000A79B8(?:TFormScript; ?:?; ?:AnsiString; ?:?; ?:?);//000A79B8
    //procedure sub_000A7C54(?:TFormScript; ?:String; ?:?);//000A7C54
    //function sub_000A7E18(?:?):?;//000A7E18
    //function sub_000A7E58(?:TFormScript; ?:TStrings; ?:?):?;//000A7E58

implementation

{$R *.DFM}

//000A6098
{*function sub_000A6098(?:TFormScript):?;
begin
 000A6098    push        ebp
 000A6099    mov         ebp,esp
 000A609B    add         esp,0FFFFFFF0
 000A609E    push        ebx
 000A609F    xor         edx,edx
 000A60A1    mov         dword ptr [ebp-4],edx
 000A60A4    mov         dword ptr [ebp-10],edx
 000A60A7    mov         ebx,eax
 000A60A9    xor         eax,eax
 000A60AB    push        ebp
 000A60AC    push        0A6183
 000A60B1    push        dword ptr fs:[eax]
 000A60B4    mov         dword ptr fs:[eax],esp
 000A60B7    mov         eax,dword ptr [ebx+2CC]
 000A60BD    call        TCustomEdit.GetModified
 000A60C2    test        al,al
>000A60C4    jne         000A60CD
 000A60C6    mov         bl,1
>000A60C8    jmp         000A6165
 000A60CD    mov         eax,[000B5644];^gvar_000B6CF8:AnsiString
 000A60D2    cmp         dword ptr [eax],0
>000A60D5    jne         000A60EE
 000A60D7    lea         edx,[ebp-4]
 000A60DA    mov         eax,84A
 000A60DF    call        LoadStr;'Script modified. Save now to file?'
 000A60E4    mov         eax,dword ptr [ebp-4]
 000A60E7    call        0008D0E0
>000A60EC    jmp         000A6122
 000A60EE    lea         eax,[ebp-4]
 000A60F1    push        eax
 000A60F2    lea         edx,[ebp-10]
 000A60F5    mov         eax,[000B5644];^gvar_000B6CF8:AnsiString
 000A60FA    mov         eax,dword ptr [eax]
 000A60FC    call        ExtractFileName
 000A6101    mov         eax,dword ptr [ebp-10]
 000A6104    mov         dword ptr [ebp-0C],eax
 000A6107    mov         byte ptr [ebp-8],0B
 000A610B    lea         edx,[ebp-0C]
 000A610E    xor         ecx,ecx
 000A6110    mov         eax,7E9
 000A6115    call        FmtLoadStr;'Script %s modified.
Save now?'
 000A611A    mov         eax,dword ptr [ebp-4]
 000A611D    call        0008D0E0
 000A6122    sub         ax,6
>000A6126    je          000A612F
 000A6128    dec         ax
>000A612B    je          000A615F
>000A612D    jmp         000A6163
 000A612F    mov         eax,[000B5644];^gvar_000B6CF8:AnsiString
 000A6134    cmp         dword ptr [eax],0
>000A6137    jne         000A6142
 000A6139    mov         eax,ebx
 000A613B    call        000A6194
>000A6140    jmp         000A614B
 000A6142    xor         edx,edx
 000A6144    mov         eax,ebx
 000A6146    call        TFormScript.Save1Click
 000A614B    mov         eax,dword ptr [ebx+2CC]
 000A6151    call        TCustomEdit.GetModified
 000A6156    test        al,al
 000A6158    sete        al
 000A615B    mov         ebx,eax
>000A615D    jmp         000A6165
 000A615F    mov         bl,1
>000A6161    jmp         000A6165
 000A6163    xor         ebx,ebx
 000A6165    xor         eax,eax
 000A6167    pop         edx
 000A6168    pop         ecx
 000A6169    pop         ecx
 000A616A    mov         dword ptr fs:[eax],edx
 000A616D    push        0A618A
 000A6172    lea         eax,[ebp-10]
 000A6175    call        @LStrClr
 000A617A    lea         eax,[ebp-4]
 000A617D    call        @LStrClr
 000A6182    ret
>000A6183    jmp         @HandleFinally
>000A6188    jmp         000A6172
 000A618A    mov         eax,ebx
 000A618C    pop         ebx
 000A618D    mov         esp,ebp
 000A618F    pop         ebp
 000A6190    ret
end;*}

//000A6194
{*function sub_000A6194(?:TFormScript):?;
begin
 000A6194    push        ebp
 000A6195    mov         ebp,esp
 000A6197    push        0
 000A6199    push        0
 000A619B    push        0
 000A619D    push        ebx
 000A619E    push        esi
 000A619F    mov         esi,eax
 000A61A1    xor         eax,eax
 000A61A3    push        ebp
 000A61A4    push        0A629D
 000A61A9    push        dword ptr fs:[eax]
 000A61AC    mov         dword ptr fs:[eax],esp
 000A61AF    mov         eax,[000B5894];^gvar_000B7070:TFormOSE
 000A61B4    mov         eax,dword ptr [eax]
 000A61B6    mov         edx,dword ptr [eax+2D0]
 000A61BC    mov         eax,[000B5894];^gvar_000B7070:TFormOSE
 000A61C1    mov         eax,dword ptr [eax]
 000A61C3    call        TCustomForm.SetActiveControl
 000A61C8    mov         eax,[000B5A10];^gvar_000B6BE4:AnsiString
 000A61CD    push        eax
 000A61CE    push        0A62B4;'*.xsc'
 000A61D3    push        3F
 000A61D5    push        0
 000A61D7    push        0
 000A61D9    push        0
 000A61DB    push        0A62C4;'Favorites'
 000A61E0    lea         edx,[ebp-4]
 000A61E3    mov         eax,84B
 000A61E8    call        LoadStr;'Save XVIscript'
 000A61ED    mov         ecx,dword ptr [ebp-4]
 000A61F0    mov         eax,[000B5894];^gvar_000B7070:TFormOSE
 000A61F5    mov         eax,dword ptr [eax]
 000A61F7    mov         edx,1
 000A61FC    call        000A1204
 000A6201    dec         eax
 000A6202    sete        bl
 000A6205    test        bl,bl
>000A6207    je          000A6282
 000A6209    mov         eax,[000B5644];^gvar_000B6CF8:AnsiString
 000A620E    mov         edx,dword ptr ds:[0B5894];^gvar_000B7070:TFormOSE
 000A6214    mov         edx,dword ptr [edx]
 000A6216    mov         edx,dword ptr [edx+2DC]
 000A621C    call        @LStrAsg
 000A6221    lea         edx,[ebp-8]
 000A6224    mov         eax,849
 000A6229    call        LoadStr;'XVIscript interpreter'
 000A622E    push        dword ptr [ebp-8]
 000A6231    push        0A62D8;' - '
 000A6236    lea         edx,[ebp-0C]
 000A6239    mov         eax,[000B5644];^gvar_000B6CF8:AnsiString
 000A623E    mov         eax,dword ptr [eax]
 000A6240    call        ExtractFileName
 000A6245    push        dword ptr [ebp-0C]
 000A6248    lea         eax,[ebp-4]
 000A624B    mov         edx,3
 000A6250    call        @LStrCatN
 000A6255    mov         edx,dword ptr [ebp-4]
 000A6258    mov         eax,esi
 000A625A    call        TControl.SetText
 000A625F    xor         edx,edx
 000A6261    mov         eax,esi
 000A6263    call        TFormScript.Save1Click
 000A6268    mov         dl,1
 000A626A    mov         eax,dword ptr [esi+2F4]
 000A6270    call        TMenuItem.SetEnabled
 000A6275    mov         dl,1
 000A6277    mov         eax,dword ptr [esi+2E4]
 000A627D    call        TCMBtn.SetEnabled
 000A6282    xor         eax,eax
 000A6284    pop         edx
 000A6285    pop         ecx
 000A6286    pop         ecx
 000A6287    mov         dword ptr fs:[eax],edx
 000A628A    push        0A62A4
 000A628F    lea         eax,[ebp-0C]
 000A6292    mov         edx,3
 000A6297    call        @LStrArrayClr
 000A629C    ret
>000A629D    jmp         @HandleFinally
>000A62A2    jmp         000A628F
 000A62A4    mov         eax,ebx
 000A62A6    pop         esi
 000A62A7    pop         ebx
 000A62A8    mov         esp,ebp
 000A62AA    pop         ebp
 000A62AB    ret
end;*}

//000A62DC
procedure TFormScript.FormCloseQuery(Sender:TObject; var CanClose:Boolean);
begin
{*
 000A62DC    push        ebx
 000A62DD    push        esi
 000A62DE    mov         esi,ecx
 000A62E0    mov         ebx,eax
 000A62E2    cmp         byte ptr [ebx+3A4],0;TFormScript.?f3A4:byte
>000A62E9    jne         000A62F4
 000A62EB    mov         eax,ebx
 000A62ED    call        000A6098
 000A62F2    mov         byte ptr [esi],al
 000A62F4    pop         esi
 000A62F5    pop         ebx
 000A62F6    ret
*}
end;

//000A62F8
procedure TFormScript.FormCreate(Sender:TObject);
begin
{*
 000A62F8    push        ebp
 000A62F9    mov         ebp,esp
 000A62FB    push        0
 000A62FD    push        ebx
 000A62FE    mov         ebx,eax
 000A6300    xor         eax,eax
 000A6302    push        ebp
 000A6303    push        0A63A5
 000A6308    push        dword ptr fs:[eax]
 000A630B    mov         dword ptr fs:[eax],esp
 000A630E    mov         byte ptr [ebx+3A4],0;TFormScript.?f3A4:byte
 000A6315    mov         eax,ebx
 000A6317    call        00087964
 000A631C    lea         eax,[ebp-4]
 000A631F    call        00086D5C
 000A6324    mov         edx,dword ptr [ebp-4]
 000A6327    mov         eax,ebx
 000A6329    call        00087868
 000A632E    lea         edx,[ebp-4]
 000A6331    mov         eax,849
 000A6336    call        LoadStr;'XVIscript interpreter'
 000A633B    mov         edx,dword ptr [ebp-4]
 000A633E    mov         eax,ebx
 000A6340    call        TControl.SetText
 000A6345    push        0A63B0;'OPEN'
 000A634A    mov         eax,[000B5950];^HInstance:Longword
 000A634F    mov         eax,dword ptr [eax]
 000A6351    push        eax
 000A6352    call        user32.LoadBitmapA
 000A6357    mov         edx,eax
 000A6359    mov         eax,dword ptr [ebx+2E0];TFormScript.CMBtnOpen:TCMBtn
 000A635F    mov         eax,dword ptr [eax+20C];TCMBtn.Glyph:TBitmap
 000A6365    call        TBitmap.SetHandle
 000A636A    push        0A63B8;'SAVE'
 000A636F    mov         eax,[000B5950];^HInstance:Longword
 000A6374    mov         eax,dword ptr [eax]
 000A6376    push        eax
 000A6377    call        user32.LoadBitmapA
 000A637C    mov         edx,eax
 000A637E    mov         eax,dword ptr [ebx+2E4];TFormScript.CMBtnSave:TCMBtn
 000A6384    mov         eax,dword ptr [eax+20C];TCMBtn.Glyph:TBitmap
 000A638A    call        TBitmap.SetHandle
 000A638F    xor         eax,eax
 000A6391    pop         edx
 000A6392    pop         ecx
 000A6393    pop         ecx
 000A6394    mov         dword ptr fs:[eax],edx
 000A6397    push        0A63AC
 000A639C    lea         eax,[ebp-4]
 000A639F    call        @LStrClr
 000A63A4    ret
>000A63A5    jmp         @HandleFinally
>000A63AA    jmp         000A639C
 000A63AC    pop         ebx
 000A63AD    pop         ecx
 000A63AE    pop         ebp
 000A63AF    ret
*}
end;

//000A63C0
procedure TFormScript.FormDestroy(Sender:TObject);
begin
{*
 000A63C0    push        ebp
 000A63C1    mov         ebp,esp
 000A63C3    push        0
 000A63C5    push        ebx
 000A63C6    mov         ebx,eax
 000A63C8    xor         eax,eax
 000A63CA    push        ebp
 000A63CB    push        0A63FE
 000A63D0    push        dword ptr fs:[eax]
 000A63D3    mov         dword ptr fs:[eax],esp
 000A63D6    lea         eax,[ebp-4]
 000A63D9    call        00086D5C
 000A63DE    mov         edx,dword ptr [ebp-4]
 000A63E1    mov         eax,ebx
 000A63E3    call        000876D8
 000A63E8    xor         eax,eax
 000A63EA    pop         edx
 000A63EB    pop         ecx
 000A63EC    pop         ecx
 000A63ED    mov         dword ptr fs:[eax],edx
 000A63F0    push        0A6405
 000A63F5    lea         eax,[ebp-4]
 000A63F8    call        @LStrClr
 000A63FD    ret
>000A63FE    jmp         @HandleFinally
>000A6403    jmp         000A63F5
 000A6405    pop         ebx
 000A6406    pop         ecx
 000A6407    pop         ebp
 000A6408    ret
*}
end;

//000A640C
procedure TFormScript.Open1Click(Sender:TObject);
begin
{*
 000A640C    push        ebp
 000A640D    mov         ebp,esp
 000A640F    push        0
 000A6411    push        0
 000A6413    push        ebx
 000A6414    mov         ebx,eax
 000A6416    xor         eax,eax
 000A6418    push        ebp
 000A6419    push        0A64DB
 000A641E    push        dword ptr fs:[eax]
 000A6421    mov         dword ptr fs:[eax],esp
 000A6424    mov         eax,ebx
 000A6426    call        000A6098
 000A642B    test        al,al
>000A642D    je          000A64C0
 000A6433    lea         edx,[ebp-8]
 000A6436    mov         eax,[000B59E8];^Application:TApplication
 000A643B    mov         eax,dword ptr [eax]
 000A643D    call        TApplication.GetExeName
 000A6442    mov         eax,dword ptr [ebp-8]
 000A6445    lea         edx,[ebp-4]
 000A6448    call        ExtractFileDir
 000A644D    mov         eax,[000B5894];^gvar_000B7070:TFormOSE
 000A6452    mov         eax,dword ptr [eax]
 000A6454    mov         eax,dword ptr [eax+2C8]
 000A645A    xor         edx,edx
 000A645C    mov         ecx,dword ptr [eax]
 000A645E    call        dword ptr [ecx+60]
 000A6461    lea         eax,[ebp-4]
 000A6464    push        eax
 000A6465    push        0A64F0;'*.xsc'
 000A646A    push        3F
 000A646C    push        0
 000A646E    push        0
 000A6470    push        0
 000A6472    push        0A6500;'Favorites'
 000A6477    lea         edx,[ebp-8]
 000A647A    mov         eax,84C
 000A647F    call        LoadStr;'Load XVIscript'
 000A6484    mov         ecx,dword ptr [ebp-8]
 000A6487    mov         eax,[000B5894];^gvar_000B7070:TFormOSE
 000A648C    mov         eax,dword ptr [eax]
 000A648E    xor         edx,edx
 000A6490    call        000A1204
 000A6495    dec         eax
>000A6496    jne         000A64AC
 000A6498    mov         eax,[000B5894];^gvar_000B7070:TFormOSE
 000A649D    mov         eax,dword ptr [eax]
 000A649F    mov         edx,dword ptr [eax+2DC]
 000A64A5    mov         eax,ebx
 000A64A7    call        000A650C
 000A64AC    mov         eax,[000B5894];^gvar_000B7070:TFormOSE
 000A64B1    mov         eax,dword ptr [eax]
 000A64B3    mov         eax,dword ptr [eax+2C8]
 000A64B9    mov         dl,1
 000A64BB    mov         ecx,dword ptr [eax]
 000A64BD    call        dword ptr [ecx+60]
 000A64C0    xor         eax,eax
 000A64C2    pop         edx
 000A64C3    pop         ecx
 000A64C4    pop         ecx
 000A64C5    mov         dword ptr fs:[eax],edx
 000A64C8    push        0A64E2
 000A64CD    lea         eax,[ebp-8]
 000A64D0    mov         edx,2
 000A64D5    call        @LStrArrayClr
 000A64DA    ret
>000A64DB    jmp         @HandleFinally
>000A64E0    jmp         000A64CD
 000A64E2    pop         ebx
 000A64E3    pop         ecx
 000A64E4    pop         ecx
 000A64E5    pop         ebp
 000A64E6    ret
*}
end;

//000A650C
procedure sub_000A650C(?:TFormScript; ?:AnsiString);
begin
{*
 000A650C    push        ebp
 000A650D    mov         ebp,esp
 000A650F    add         esp,0FFFFFFE4
 000A6512    push        ebx
 000A6513    push        esi
 000A6514    push        edi
 000A6515    xor         ecx,ecx
 000A6517    mov         dword ptr [ebp-0C],ecx
 000A651A    mov         dword ptr [ebp-10],ecx
 000A651D    mov         dword ptr [ebp-14],ecx
 000A6520    mov         dword ptr [ebp-8],edx
 000A6523    mov         dword ptr [ebp-4],eax
 000A6526    xor         eax,eax
 000A6528    push        ebp
 000A6529    push        0A6677
 000A652E    push        dword ptr fs:[eax]
 000A6531    mov         dword ptr fs:[eax],esp
 000A6534    xor         eax,eax
 000A6536    push        ebp
 000A6537    push        0A65DF
 000A653C    push        dword ptr fs:[eax]
 000A653F    mov         dword ptr fs:[eax],esp
 000A6542    mov         eax,dword ptr [ebp-4]
 000A6545    mov         eax,dword ptr [eax+2CC];TFormScript.MemoScript:TMemo
 000A654B    mov         eax,dword ptr [eax+204];TMemo.FLines:TStrings
 000A6551    mov         edx,dword ptr [ebp-8]
 000A6554    mov         ecx,dword ptr [eax]
 000A6556    call        dword ptr [ecx+58];TStrings.LoadFromFile
 000A6559    mov         eax,[000B5644];^gvar_000B6CF8:AnsiString
 000A655E    mov         edx,dword ptr [ebp-8]
 000A6561    call        @LStrAsg
 000A6566    lea         edx,[ebp-10]
 000A6569    mov         eax,849
 000A656E    call        LoadStr;'XVIscript interpreter'
 000A6573    push        dword ptr [ebp-10]
 000A6576    push        0A6690;' - '
 000A657B    lea         edx,[ebp-14]
 000A657E    mov         eax,[000B5644];^gvar_000B6CF8:AnsiString
 000A6583    mov         eax,dword ptr [eax]
 000A6585    call        ExtractFileName
 000A658A    push        dword ptr [ebp-14]
 000A658D    lea         eax,[ebp-0C]
 000A6590    mov         edx,3
 000A6595    call        @LStrCatN
 000A659A    mov         edx,dword ptr [ebp-0C]
 000A659D    mov         eax,dword ptr [ebp-4]
 000A65A0    call        TControl.SetText
 000A65A5    mov         eax,dword ptr [ebp-4]
 000A65A8    mov         eax,dword ptr [eax+2CC];TFormScript.MemoScript:TMemo
 000A65AE    xor         edx,edx
 000A65B0    call        TCustomEdit.SetModified
 000A65B5    mov         eax,dword ptr [ebp-4]
 000A65B8    mov         eax,dword ptr [eax+2F4];TFormScript.Save1:TMenuItem
 000A65BE    mov         dl,1
 000A65C0    call        TMenuItem.SetEnabled
 000A65C5    mov         eax,dword ptr [ebp-4]
 000A65C8    mov         eax,dword ptr [eax+2E4];TFormScript.CMBtnSave:TCMBtn
 000A65CE    mov         dl,1
 000A65D0    call        TCMBtn.SetEnabled
 000A65D5    xor         eax,eax
 000A65D7    pop         edx
 000A65D8    pop         ecx
 000A65D9    pop         ecx
 000A65DA    mov         dword ptr fs:[eax],edx
>000A65DD    jmp         000A665C
>000A65DF    jmp         @HandleAnyException
 000A65E4    mov         eax,[000B5644];^gvar_000B6CF8:AnsiString
 000A65E9    call        @LStrClr
 000A65EE    lea         edx,[ebp-0C]
 000A65F1    mov         eax,849
 000A65F6    call        LoadStr;'XVIscript interpreter'
 000A65FB    mov         edx,dword ptr [ebp-0C]
 000A65FE    mov         eax,dword ptr [ebp-4]
 000A6601    call        TControl.SetText
 000A6606    mov         eax,dword ptr [ebp-4]
 000A6609    mov         eax,dword ptr [eax+2F4];TFormScript.Save1:TMenuItem
 000A660F    xor         edx,edx
 000A6611    call        TMenuItem.SetEnabled
 000A6616    mov         eax,dword ptr [ebp-4]
 000A6619    mov         eax,dword ptr [eax+2E4];TFormScript.CMBtnSave:TCMBtn
 000A661F    xor         edx,edx
 000A6621    call        TCMBtn.SetEnabled
 000A6626    lea         eax,[ebp-0C]
 000A6629    push        eax
 000A662A    mov         eax,dword ptr [ebp-8]
 000A662D    mov         dword ptr [ebp-1C],eax
 000A6630    mov         byte ptr [ebp-18],0B
 000A6634    lea         edx,[ebp-1C]
 000A6637    xor         ecx,ecx
 000A6639    mov         eax,851
 000A663E    call        FmtLoadStr;'Error reading XVIscript file
%s'
 000A6643    mov         ecx,dword ptr [ebp-0C]
 000A6646    mov         dl,1
 000A6648    mov         eax,[000176E8];Exception
 000A664D    call        Exception.Create;Exception.Create
 000A6652    call        @RaiseExcept
 000A6657    call        @DoneExcept
 000A665C    xor         eax,eax
 000A665E    pop         edx
 000A665F    pop         ecx
 000A6660    pop         ecx
 000A6661    mov         dword ptr fs:[eax],edx
 000A6664    push        0A667E
 000A6669    lea         eax,[ebp-14]
 000A666C    mov         edx,3
 000A6671    call        @LStrArrayClr
 000A6676    ret
>000A6677    jmp         @HandleFinally
>000A667C    jmp         000A6669
 000A667E    pop         edi
 000A667F    pop         esi
 000A6680    pop         ebx
 000A6681    mov         esp,ebp
 000A6683    pop         ebp
 000A6684    ret
*}
end;

//000A6694
procedure TFormScript.Save1Click(Sender:TObject);
begin
{*
 000A6694    push        ebx
 000A6695    mov         ebx,eax
 000A6697    mov         edx,dword ptr ds:[0B5644];^gvar_000B6CF8:AnsiString
 000A669D    mov         edx,dword ptr [edx]
 000A669F    mov         eax,dword ptr [ebx+2CC];TFormScript.MemoScript:TMemo
 000A66A5    mov         eax,dword ptr [eax+204];TMemo.FLines:TStrings
 000A66AB    mov         ecx,dword ptr [eax]
 000A66AD    call        dword ptr [ecx+64];TStrings.SaveToFile
 000A66B0    xor         edx,edx
 000A66B2    mov         eax,dword ptr [ebx+2CC];TFormScript.MemoScript:TMemo
 000A66B8    call        TCustomEdit.SetModified
 000A66BD    pop         ebx
 000A66BE    ret
*}
end;

//000A66C0
procedure TFormScript.Saveas1Click(Sender:TObject);
begin
{*
 000A66C0    call        000A6194
 000A66C5    ret
*}
end;

//000A66C8
procedure TFormScript.Exit1Click(Sender:TObject);
begin
{*
 000A66C8    call        TCustomForm.Close
 000A66CD    ret
*}
end;

//000A66D0
procedure TFormScript.ButtonHelpClick(Sender:TObject);
begin
{*
 000A66D0    mov         eax,[000B59E8];^Application:TApplication
 000A66D5    mov         eax,dword ptr [eax]
 000A66D7    mov         edx,47
 000A66DC    call        TApplication.HelpContext
 000A66E1    ret
*}
end;

//000A66E4
{*procedure sub_000A66E4(?:TFormScript; ?:?);
begin
 000A66E4    push        ebp
 000A66E5    mov         ebp,esp
 000A66E7    add         esp,0FFFFFFF4
 000A66EA    push        ebx
 000A66EB    push        esi
 000A66EC    push        edi
 000A66ED    xor         ecx,ecx
 000A66EF    mov         dword ptr [ebp-0C],ecx
 000A66F2    mov         dword ptr [ebp-4],edx
 000A66F5    mov         esi,eax
 000A66F7    xor         eax,eax
 000A66F9    push        ebp
 000A66FA    push        0A67E2
 000A66FF    push        dword ptr fs:[eax]
 000A6702    mov         dword ptr fs:[eax],esp
 000A6705    cmp         dword ptr [ebp-4],0
>000A6709    jl          000A67CC
 000A670F    mov         eax,dword ptr [esi+2CC]
 000A6715    mov         eax,dword ptr [eax+204]
 000A671B    mov         edx,dword ptr [eax]
 000A671D    call        dword ptr [edx+14]
 000A6720    cmp         eax,dword ptr [ebp-4]
>000A6723    jle         000A67CC
 000A6729    xor         edx,edx
 000A672B    mov         eax,dword ptr [esi+2CC]
 000A6731    mov         ecx,dword ptr [eax]
 000A6733    call        dword ptr [ecx+0CC]
 000A6739    mov         ebx,dword ptr [ebp-4]
 000A673C    dec         ebx
 000A673D    test        ebx,ebx
>000A673F    jl          000A6793
 000A6741    inc         ebx
 000A6742    mov         dword ptr [ebp-8],0
 000A6749    lea         ecx,[ebp-0C]
 000A674C    mov         eax,dword ptr [esi+2CC]
 000A6752    mov         eax,dword ptr [eax+204]
 000A6758    mov         edx,dword ptr [ebp-8]
 000A675B    mov         edi,dword ptr [eax]
 000A675D    call        dword ptr [edi+0C]
 000A6760    mov         eax,dword ptr [ebp-0C]
 000A6763    call        @LStrLen
 000A6768    mov         edi,eax
 000A676A    mov         eax,dword ptr [esi+2CC]
 000A6770    mov         edx,dword ptr [eax]
 000A6772    call        dword ptr [edx+0C0]
 000A6778    add         edi,eax
 000A677A    mov         edx,edi
 000A677C    add         edx,2
 000A677F    mov         eax,dword ptr [esi+2CC]
 000A6785    mov         ecx,dword ptr [eax]
 000A6787    call        dword ptr [ecx+0CC]
 000A678D    inc         dword ptr [ebp-8]
 000A6790    dec         ebx
>000A6791    jne         000A6749
 000A6793    lea         ecx,[ebp-0C]
 000A6796    mov         ebx,dword ptr [esi+2CC]
 000A679C    mov         eax,dword ptr [ebx+204]
 000A67A2    mov         edx,dword ptr [ebp-4]
 000A67A5    mov         edi,dword ptr [eax]
 000A67A7    call        dword ptr [edi+0C]
 000A67AA    mov         eax,dword ptr [ebp-0C]
 000A67AD    call        @LStrLen
 000A67B2    mov         edx,eax
 000A67B4    mov         eax,ebx
 000A67B6    mov         ecx,dword ptr [eax]
 000A67B8    call        dword ptr [ecx+0C8]
 000A67BE    mov         eax,dword ptr [esi+2CC]
 000A67C4    mov         edx,dword ptr [eax]
 000A67C6    call        dword ptr [edx+0B4]
 000A67CC    xor         eax,eax
 000A67CE    pop         edx
 000A67CF    pop         ecx
 000A67D0    pop         ecx
 000A67D1    mov         dword ptr fs:[eax],edx
 000A67D4    push        0A67E9
 000A67D9    lea         eax,[ebp-0C]
 000A67DC    call        @LStrClr
 000A67E1    ret
>000A67E2    jmp         @HandleFinally
>000A67E7    jmp         000A67D9
 000A67E9    pop         edi
 000A67EA    pop         esi
 000A67EB    pop         ebx
 000A67EC    mov         esp,ebp
 000A67EE    pop         ebp
 000A67EF    ret
end;*}

//000A67F0
procedure TFormScript.ButtonExecuteClick(Sender:TObject);
begin
{*
 000A67F0    push        ebp
 000A67F1    mov         ebp,esp
 000A67F3    add         esp,0FFFFFFF0
 000A67F6    push        ebx
 000A67F7    push        esi
 000A67F8    push        edi
 000A67F9    xor         ecx,ecx
 000A67FB    mov         dword ptr [ebp-10],ecx
 000A67FE    mov         dword ptr [ebp-4],eax
 000A6801    xor         eax,eax
 000A6803    push        ebp
 000A6804    push        0A69DC
 000A6809    push        dword ptr fs:[eax]
 000A680C    mov         dword ptr fs:[eax],esp
 000A680F    mov         eax,dword ptr [ebp-4]
 000A6812    mov         eax,dword ptr [eax+2CC];TFormScript.MemoScript:TMemo
 000A6818    mov         eax,dword ptr [eax+204];TMemo.FLines:TStrings
 000A681E    mov         edx,dword ptr [eax]
 000A6820    call        dword ptr [edx+14];TStrings.GetCount
 000A6823    test        eax,eax
>000A6825    je          000A69C6
 000A682B    mov         eax,dword ptr [ebp-4]
 000A682E    mov         byte ptr [eax+388],1;TFormScript.?f388:byte
 000A6835    mov         eax,dword ptr [ebp-4]
 000A6838    mov         byte ptr [eax+389],1;TFormScript.?f389:byte
 000A683F    xor         eax,eax
 000A6841    push        ebp
 000A6842    push        0A6942
 000A6847    push        dword ptr fs:[eax]
 000A684A    mov         dword ptr fs:[eax],esp
 000A684D    push        0
 000A684F    push        0A69F4;' '
 000A6854    push        1
 000A6856    push        1
 000A6858    call        00088008
 000A685D    mov         ecx,eax
 000A685F    mov         dl,1
 000A6861    mov         eax,[0008C62C];TProgressBox
 000A6866    call        TProgressBox.Create;TProgressBox.Create
 000A686B    mov         edx,dword ptr ds:[0B5A9C];^gvar_000B6D00:TProgressBox
 000A6871    mov         dword ptr [edx],eax
 000A6873    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000A6878    mov         eax,dword ptr [eax]
 000A687A    call        TCustomForm.Show
 000A687F    xor         eax,eax
 000A6881    push        ebp
 000A6882    push        0A68EF
 000A6887    push        dword ptr fs:[eax]
 000A688A    mov         dword ptr fs:[eax],esp
 000A688D    lea         ecx,[ebp-8]
 000A6890    mov         eax,dword ptr [ebp-4]
 000A6893    mov         eax,dword ptr [eax+2CC];TFormScript.MemoScript:TMemo
 000A6899    mov         edx,dword ptr [eax+204];TMemo.FLines:TStrings
 000A689F    mov         eax,dword ptr [ebp-4]
 000A68A2    call        000A7E58
 000A68A7    xor         al,1
 000A68A9    mov         byte ptr [ebp-9],al
 000A68AC    cmp         byte ptr [ebp-9],0
>000A68B0    jne         000A68E5
 000A68B2    mov         eax,dword ptr [ebp-4]
 000A68B5    mov         byte ptr [eax+388],0;TFormScript.?f388:byte
 000A68BC    mov         eax,dword ptr [ebp-4]
 000A68BF    mov         byte ptr [eax+389],0;TFormScript.?f389:byte
 000A68C6    lea         ecx,[ebp-8]
 000A68C9    mov         eax,dword ptr [ebp-4]
 000A68CC    mov         eax,dword ptr [eax+2CC];TFormScript.MemoScript:TMemo
 000A68D2    mov         edx,dword ptr [eax+204];TMemo.FLines:TStrings
 000A68D8    mov         eax,dword ptr [ebp-4]
 000A68DB    call        000A7E58
 000A68E0    xor         al,1
 000A68E2    mov         byte ptr [ebp-9],al
 000A68E5    xor         eax,eax
 000A68E7    pop         edx
 000A68E8    pop         ecx
 000A68E9    pop         ecx
 000A68EA    mov         dword ptr fs:[eax],edx
>000A68ED    jmp         000A6915
>000A68EF    jmp         @HandleAnyException
 000A68F4    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000A68F9    mov         eax,dword ptr [eax]
 000A68FB    call        TCustomForm.Hide
 000A6900    mov         edx,dword ptr [ebp-8]
 000A6903    mov         eax,dword ptr [ebp-4]
 000A6906    call        000A66E4
 000A690B    call        @RaiseAgain
 000A6910    call        @DoneExcept
 000A6915    xor         eax,eax
 000A6917    pop         edx
 000A6918    pop         ecx
 000A6919    pop         ecx
 000A691A    mov         dword ptr fs:[eax],edx
 000A691D    push        0A6949
 000A6922    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000A6927    cmp         dword ptr [eax],0
>000A692A    je          000A6941
 000A692C    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000A6931    mov         eax,dword ptr [eax]
 000A6933    call        TObject.Free
 000A6938    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000A693D    xor         edx,edx
 000A693F    mov         dword ptr [eax],edx
 000A6941    ret
>000A6942    jmp         @HandleFinally
>000A6947    jmp         000A6922
 000A6949    mov         eax,[000B5A1C];^gvar_000B7009
 000A694E    cmp         byte ptr [eax],0
>000A6951    je          000A6989
 000A6953    mov         eax,[000B5778];^gvar_000B6BA5
 000A6958    cmp         byte ptr [eax],0
>000A695B    je          000A697B
 000A695D    mov         eax,[000B5790];^gvar_000B6B70:TCMDynArray
 000A6962    mov         eax,dword ptr [eax]
 000A6964    mov         eax,dword ptr [eax+0C]
 000A6967    push        eax
 000A6968    mov         eax,[000B5B50];^gvar_000B6B78:AnsiString
 000A696D    mov         eax,dword ptr [eax]
 000A696F    mov         ecx,1
 000A6974    xor         edx,edx
 000A6976    call        000991C8
 000A697B    mov         eax,[000B59E8];^Application:TApplication
 000A6980    mov         eax,dword ptr [eax]
 000A6982    call        TApplication.Terminate
>000A6987    jmp         000A69C6
 000A6989    mov         eax,dword ptr [ebp-4]
 000A698C    cmp         byte ptr [eax+3A4],0;TFormScript.?f3A4:byte
>000A6993    je          000A69AB
 000A6995    push        0
 000A6997    push        0
 000A6999    push        10
 000A699B    mov         eax,dword ptr [ebp-4]
 000A699E    call        TWinControl.GetHandle
 000A69A3    push        eax
 000A69A4    call        user32.PostMessageA
>000A69A9    jmp         000A69C6
 000A69AB    cmp         byte ptr [ebp-9],0
>000A69AF    jne         000A69C6
 000A69B1    lea         edx,[ebp-10]
 000A69B4    mov         eax,853
 000A69B9    call        LoadStr;'Script executed successfully!'
 000A69BE    mov         eax,dword ptr [ebp-10]
 000A69C1    call        0008D08C
 000A69C6    xor         eax,eax
 000A69C8    pop         edx
 000A69C9    pop         ecx
 000A69CA    pop         ecx
 000A69CB    mov         dword ptr fs:[eax],edx
 000A69CE    push        0A69E3
 000A69D3    lea         eax,[ebp-10]
 000A69D6    call        @LStrClr
 000A69DB    ret
>000A69DC    jmp         @HandleFinally
>000A69E1    jmp         000A69D3
 000A69E3    pop         edi
 000A69E4    pop         esi
 000A69E5    pop         ebx
 000A69E6    mov         esp,ebp
 000A69E8    pop         ebp
 000A69E9    ret
*}
end;

//000A69F8
procedure TFormScript.ButtonSyntaxClick(Sender:TObject);
begin
{*
 000A69F8    push        ebp
 000A69F9    mov         ebp,esp
 000A69FB    add         esp,0FFFFFFF0
 000A69FE    push        ebx
 000A69FF    push        esi
 000A6A00    push        edi
 000A6A01    xor         ecx,ecx
 000A6A03    mov         dword ptr [ebp-10],ecx
 000A6A06    mov         dword ptr [ebp-4],eax
 000A6A09    xor         eax,eax
 000A6A0B    push        ebp
 000A6A0C    push        0A6B50
 000A6A11    push        dword ptr fs:[eax]
 000A6A14    mov         dword ptr fs:[eax],esp
 000A6A17    mov         eax,dword ptr [ebp-4]
 000A6A1A    mov         eax,dword ptr [eax+2CC];TFormScript.MemoScript:TMemo
 000A6A20    mov         eax,dword ptr [eax+204];TMemo.FLines:TStrings
 000A6A26    mov         edx,dword ptr [eax]
 000A6A28    call        dword ptr [edx+14];TStrings.GetCount
 000A6A2B    test        eax,eax
>000A6A2D    je          000A6B3A
 000A6A33    mov         eax,dword ptr [ebp-4]
 000A6A36    mov         byte ptr [eax+388],1;TFormScript.?f388:byte
 000A6A3D    mov         eax,dword ptr [ebp-4]
 000A6A40    mov         byte ptr [eax+389],0;TFormScript.?f389:byte
 000A6A47    mov         byte ptr [ebp-9],0
 000A6A4B    xor         edx,edx
 000A6A4D    push        ebp
 000A6A4E    push        0A6B10
 000A6A53    push        dword ptr fs:[edx]
 000A6A56    mov         dword ptr fs:[edx],esp
 000A6A59    push        0
 000A6A5B    push        0A6B68;' '
 000A6A60    push        1
 000A6A62    push        1
 000A6A64    call        00088008
 000A6A69    mov         ecx,eax
 000A6A6B    mov         dl,1
 000A6A6D    mov         eax,[0008C62C];TProgressBox
 000A6A72    call        TProgressBox.Create;TProgressBox.Create
 000A6A77    mov         edx,dword ptr ds:[0B5A9C];^gvar_000B6D00:TProgressBox
 000A6A7D    mov         dword ptr [edx],eax
 000A6A7F    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000A6A84    mov         eax,dword ptr [eax]
 000A6A86    call        TCustomForm.Show
 000A6A8B    xor         edx,edx
 000A6A8D    push        ebp
 000A6A8E    push        0A6AC7
 000A6A93    push        dword ptr fs:[edx]
 000A6A96    mov         dword ptr fs:[edx],esp
 000A6A99    lea         ecx,[ebp-8]
 000A6A9C    mov         eax,dword ptr [ebp-4]
 000A6A9F    mov         eax,dword ptr [eax+2CC];TFormScript.MemoScript:TMemo
 000A6AA5    mov         edx,dword ptr [eax+204];TMemo.FLines:TStrings
 000A6AAB    mov         eax,dword ptr [ebp-4]
 000A6AAE    call        000A7E58
 000A6AB3    xor         al,1
 000A6AB5    test        al,al
>000A6AB7    jne         000A6ABD
 000A6AB9    mov         byte ptr [ebp-9],1
 000A6ABD    xor         eax,eax
 000A6ABF    pop         edx
 000A6AC0    pop         ecx
 000A6AC1    pop         ecx
 000A6AC2    mov         dword ptr fs:[eax],edx
>000A6AC5    jmp         000A6AED
>000A6AC7    jmp         @HandleAnyException
 000A6ACC    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000A6AD1    mov         eax,dword ptr [eax]
 000A6AD3    call        TCustomForm.Hide
 000A6AD8    mov         edx,dword ptr [ebp-8]
 000A6ADB    mov         eax,dword ptr [ebp-4]
 000A6ADE    call        000A66E4
 000A6AE3    call        @RaiseAgain
 000A6AE8    call        @DoneExcept
 000A6AED    xor         eax,eax
 000A6AEF    pop         edx
 000A6AF0    pop         ecx
 000A6AF1    pop         ecx
 000A6AF2    mov         dword ptr fs:[eax],edx
 000A6AF5    push        0A6B17
 000A6AFA    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000A6AFF    mov         eax,dword ptr [eax]
 000A6B01    call        TObject.Free
 000A6B06    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000A6B0B    xor         edx,edx
 000A6B0D    mov         dword ptr [eax],edx
 000A6B0F    ret
>000A6B10    jmp         @HandleFinally
>000A6B15    jmp         000A6AFA
 000A6B17    cmp         byte ptr [ebp-9],0
>000A6B1B    je          000A6B32
 000A6B1D    lea         edx,[ebp-10]
 000A6B20    mov         eax,848
 000A6B25    call        LoadStr;'Syntax check passed without errors.
Note: During execution, run time errors may occur.'
 000A6B2A    mov         eax,dword ptr [ebp-10]
 000A6B2D    call        ShowMessage
 000A6B32    mov         eax,dword ptr [ebp-4]
 000A6B35    call        TControl.BringToFront
 000A6B3A    xor         eax,eax
 000A6B3C    pop         edx
 000A6B3D    pop         ecx
 000A6B3E    pop         ecx
 000A6B3F    mov         dword ptr fs:[eax],edx
 000A6B42    push        0A6B57
 000A6B47    lea         eax,[ebp-10]
 000A6B4A    call        @LStrClr
 000A6B4F    ret
>000A6B50    jmp         @HandleFinally
>000A6B55    jmp         000A6B47
 000A6B57    pop         edi
 000A6B58    pop         esi
 000A6B59    pop         ebx
 000A6B5A    mov         esp,ebp
 000A6B5C    pop         ebp
 000A6B5D    ret
*}
end;

//000A6B6C
procedure TFormScript.InsertCommandClick(Sender:TObject);
begin
{*
 000A6B6C    push        ebp
 000A6B6D    mov         ebp,esp
 000A6B6F    push        0
 000A6B71    push        0
 000A6B73    push        0
 000A6B75    push        ebx
 000A6B76    push        esi
 000A6B77    push        edi
 000A6B78    mov         esi,edx
 000A6B7A    mov         ebx,eax
 000A6B7C    xor         eax,eax
 000A6B7E    push        ebp
 000A6B7F    push        0A6D0F
 000A6B84    push        dword ptr fs:[eax]
 000A6B87    mov         dword ptr fs:[eax],esp
 000A6B8A    lea         eax,[ebp-4]
 000A6B8D    mov         edx,dword ptr [esi+24]
 000A6B90    call        @LStrLAsg
 000A6B95    mov         edx,dword ptr [ebp-4]
 000A6B98    mov         eax,0A6D28;'&'
 000A6B9D    call        @LStrPos
 000A6BA2    mov         esi,eax
 000A6BA4    lea         eax,[ebp-4]
 000A6BA7    mov         ecx,1
 000A6BAC    mov         edx,esi
 000A6BAE    call        @LStrDelete
 000A6BB3    mov         edx,dword ptr [ebp-4]
 000A6BB6    mov         eax,0A6D34;' ('
 000A6BBB    call        @LStrPos
 000A6BC0    mov         esi,eax
 000A6BC2    test        esi,esi
>000A6BC4    jle         000A6BDA
 000A6BC6    lea         eax,[ebp-4]
 000A6BC9    push        eax
 000A6BCA    mov         ecx,esi
 000A6BCC    dec         ecx
 000A6BCD    mov         edx,1
 000A6BD2    mov         eax,dword ptr [ebp-4]
 000A6BD5    call        @LStrCopy
 000A6BDA    push        0
 000A6BDC    mov         eax,dword ptr [ebx+2CC];TFormScript.MemoScript:TMemo
 000A6BE2    mov         edx,dword ptr [eax]
 000A6BE4    call        dword ptr [edx+0C0];TCustomEdit.GetSelStart
 000A6BEA    push        eax
 000A6BEB    push        0C9
 000A6BF0    mov         eax,dword ptr [ebx+2CC];TFormScript.MemoScript:TMemo
 000A6BF6    call        TWinControl.GetHandle
 000A6BFB    push        eax
 000A6BFC    call        user32.SendMessageA
 000A6C01    mov         esi,eax
 000A6C03    xor         edx,edx
 000A6C05    mov         eax,dword ptr [ebx+2CC];TFormScript.MemoScript:TMemo
 000A6C0B    call        TCustomEdit.SetSelText
 000A6C10    mov         eax,dword ptr [ebx+2CC];TFormScript.MemoScript:TMemo
 000A6C16    mov         eax,dword ptr [eax+204];TMemo.FLines:TStrings
 000A6C1C    mov         edx,dword ptr [eax]
 000A6C1E    call        dword ptr [edx+14];TStrings.GetCount
 000A6C21    cmp         esi,eax
>000A6C23    jge         000A6C64
 000A6C25    lea         ecx,[ebp-0C]
 000A6C28    mov         eax,dword ptr [ebx+2CC];TFormScript.MemoScript:TMemo
 000A6C2E    mov         eax,dword ptr [eax+204];TMemo.FLines:TStrings
 000A6C34    mov         edx,esi
 000A6C36    mov         edi,dword ptr [eax]
 000A6C38    call        dword ptr [edi+0C];TStrings.Get
 000A6C3B    mov         eax,dword ptr [ebp-0C]
 000A6C3E    lea         edx,[ebp-8]
 000A6C41    call        Trim
 000A6C46    cmp         dword ptr [ebp-8],0
>000A6C4A    jne         000A6C64
 000A6C4C    mov         eax,dword ptr [ebx+2CC];TFormScript.MemoScript:TMemo
 000A6C52    mov         eax,dword ptr [eax+204];TMemo.FLines:TStrings
 000A6C58    mov         ecx,dword ptr [ebp-4]
 000A6C5B    mov         edx,esi
 000A6C5D    mov         edi,dword ptr [eax]
 000A6C5F    call        dword ptr [edi+20];TStrings.Put
>000A6C62    jmp         000A6C7A
 000A6C64    mov         eax,dword ptr [ebx+2CC];TFormScript.MemoScript:TMemo
 000A6C6A    mov         eax,dword ptr [eax+204];TMemo.FLines:TStrings
 000A6C70    mov         ecx,dword ptr [ebp-4]
 000A6C73    mov         edx,esi
 000A6C75    mov         edi,dword ptr [eax]
 000A6C77    call        dword ptr [edi+54];TStrings.Insert
 000A6C7A    mov         eax,dword ptr [ebx+2CC];TFormScript.MemoScript:TMemo
 000A6C80    mov         edx,dword ptr [eax]
 000A6C82    call        dword ptr [edx+0C0];TCustomEdit.GetSelStart
 000A6C88    mov         edi,eax
 000A6C8A    push        0
 000A6C8C    push        esi
 000A6C8D    push        0BB
 000A6C92    mov         eax,dword ptr [ebx+2CC];TFormScript.MemoScript:TMemo
 000A6C98    call        TWinControl.GetHandle
 000A6C9D    push        eax
 000A6C9E    call        user32.SendMessageA
 000A6CA3    sub         edi,eax
 000A6CA5    mov         edx,dword ptr [ebp-4]
 000A6CA8    mov         eax,0A6D40;' '
 000A6CAD    call        @LStrPos
 000A6CB2    mov         esi,eax
 000A6CB4    test        esi,esi
>000A6CB6    jle         000A6CF4
 000A6CB8    mov         eax,dword ptr [ebx+2CC];TFormScript.MemoScript:TMemo
 000A6CBE    mov         edx,dword ptr [eax]
 000A6CC0    call        dword ptr [edx+0C0];TCustomEdit.GetSelStart
 000A6CC6    mov         edx,eax
 000A6CC8    sub         edx,edi
 000A6CCA    add         edx,esi
 000A6CCC    mov         eax,dword ptr [ebx+2CC];TFormScript.MemoScript:TMemo
 000A6CD2    mov         ecx,dword ptr [eax]
 000A6CD4    call        dword ptr [ecx+0CC];TCustomEdit.SetSelStart
 000A6CDA    mov         eax,dword ptr [ebp-4]
 000A6CDD    call        @LStrLen
 000A6CE2    mov         edx,eax
 000A6CE4    sub         edx,esi
 000A6CE6    mov         eax,dword ptr [ebx+2CC];TFormScript.MemoScript:TMemo
 000A6CEC    mov         ecx,dword ptr [eax]
 000A6CEE    call        dword ptr [ecx+0C8];TCustomEdit.SetSelLength
 000A6CF4    xor         eax,eax
 000A6CF6    pop         edx
 000A6CF7    pop         ecx
 000A6CF8    pop         ecx
 000A6CF9    mov         dword ptr fs:[eax],edx
 000A6CFC    push        0A6D16
 000A6D01    lea         eax,[ebp-0C]
 000A6D04    mov         edx,3
 000A6D09    call        @LStrArrayClr
 000A6D0E    ret
>000A6D0F    jmp         @HandleFinally
>000A6D14    jmp         000A6D01
 000A6D16    pop         edi
 000A6D17    pop         esi
 000A6D18    pop         ebx
 000A6D19    mov         esp,ebp
 000A6D1B    pop         ebp
 000A6D1C    ret
*}
end;

//000A6D44
procedure sub_000A6D44(?:TFormScript; ?:AnsiString);
begin
{*
 000A6D44    push        ebp
 000A6D45    mov         ebp,esp
 000A6D47    push        0
 000A6D49    push        0
 000A6D4B    push        ebx
 000A6D4C    push        esi
 000A6D4D    mov         esi,edx
 000A6D4F    mov         ebx,eax
 000A6D51    xor         eax,eax
 000A6D53    push        ebp
 000A6D54    push        0A6DF3
 000A6D59    push        dword ptr fs:[eax]
 000A6D5C    mov         dword ptr fs:[eax],esp
 000A6D5F    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000A6D64    cmp         dword ptr [eax],0
>000A6D67    je          000A6D75
 000A6D69    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000A6D6E    mov         eax,dword ptr [eax]
 000A6D70    call        TCustomForm.Hide
 000A6D75    cmp         byte ptr [ebx+388],0
>000A6D7C    je          000A6DC5
 000A6D7E    cmp         byte ptr [ebx+389],0
>000A6D85    je          000A6DC5
 000A6D87    push        esi
 000A6D88    push        0A6E08;#13+#10
 000A6D8D    push        0A6E08;#13+#10
 000A6D92    lea         edx,[ebp-8]
 000A6D95    mov         eax,847
 000A6D9A    call        LoadStr;'File was NOT yet changed by interpreter'
 000A6D9F    push        dword ptr [ebp-8]
 000A6DA2    lea         eax,[ebp-4]
 000A6DA5    mov         edx,4
 000A6DAA    call        @LStrCatN
 000A6DAF    mov         ecx,dword ptr [ebp-4]
 000A6DB2    mov         dl,1
 000A6DB4    mov         eax,[000176E8];Exception
 000A6DB9    call        Exception.Create;Exception.Create
 000A6DBE    call        @RaiseExcept
>000A6DC3    jmp         000A6DD8
 000A6DC5    mov         ecx,esi
 000A6DC7    mov         dl,1
 000A6DC9    mov         eax,[000176E8];Exception
 000A6DCE    call        Exception.Create;Exception.Create
 000A6DD3    call        @RaiseExcept
 000A6DD8    xor         eax,eax
 000A6DDA    pop         edx
 000A6DDB    pop         ecx
 000A6DDC    pop         ecx
 000A6DDD    mov         dword ptr fs:[eax],edx
 000A6DE0    push        0A6DFA
 000A6DE5    lea         eax,[ebp-8]
 000A6DE8    mov         edx,2
 000A6DED    call        @LStrArrayClr
 000A6DF2    ret
>000A6DF3    jmp         @HandleFinally
>000A6DF8    jmp         000A6DE5
 000A6DFA    pop         esi
 000A6DFB    pop         ebx
 000A6DFC    pop         ecx
 000A6DFD    pop         ecx
 000A6DFE    pop         ebp
 000A6DFF    ret
*}
end;

//000A6E0C
{*function sub_000A6E0C(?:TFormScript; ?:AnsiString; ?:AnsiString; ?:?; ?:?):?;
begin
 000A6E0C    push        ebp
 000A6E0D    mov         ebp,esp
 000A6E0F    add         esp,0FFFFFFD8
 000A6E12    push        ebx
 000A6E13    push        esi
 000A6E14    push        edi
 000A6E15    xor         ebx,ebx
 000A6E17    mov         dword ptr [ebp-14],ebx
 000A6E1A    mov         dword ptr [ebp-18],ebx
 000A6E1D    mov         dword ptr [ebp-0C],ecx
 000A6E20    mov         dword ptr [ebp-8],edx
 000A6E23    mov         dword ptr [ebp-4],eax
 000A6E26    mov         ebx,dword ptr [ebp+8]
 000A6E29    mov         eax,dword ptr [ebp-8]
 000A6E2C    call        @LStrAddRef
 000A6E31    xor         eax,eax
 000A6E33    push        ebp
 000A6E34    push        0A6F12
 000A6E39    push        dword ptr fs:[eax]
 000A6E3C    mov         dword ptr fs:[eax],esp
 000A6E3F    lea         edx,[ebp-14]
 000A6E42    mov         eax,dword ptr [ebp-8]
 000A6E45    call        Trim
 000A6E4A    cmp         dword ptr [ebp-14],0
>000A6E4E    jne         000A6E5E
 000A6E50    test        ebx,ebx
>000A6E52    je          000A6E5E
 000A6E54    lea         eax,[ebp-8]
 000A6E57    mov         edx,ebx
 000A6E59    call        @LStrLAsg
 000A6E5E    xor         eax,eax
 000A6E60    push        ebp
 000A6E61    push        0A6E8C
 000A6E66    push        dword ptr fs:[eax]
 000A6E69    mov         dword ptr fs:[eax],esp
 000A6E6C    lea         edx,[ebp-14]
 000A6E6F    mov         eax,dword ptr [ebp-8]
 000A6E72    call        UpperCase
 000A6E77    mov         eax,dword ptr [ebp-14]
 000A6E7A    call        StrToInt
 000A6E7F    mov         dword ptr [ebp-10],eax
 000A6E82    xor         eax,eax
 000A6E84    pop         edx
 000A6E85    pop         ecx
 000A6E86    pop         ecx
 000A6E87    mov         dword ptr fs:[eax],edx
>000A6E8A    jmp         000A6EEF
>000A6E8C    jmp         @HandleAnyException
 000A6E91    lea         eax,[ebp-18]
 000A6E94    push        eax
 000A6E95    mov         eax,dword ptr [ebp+0C]
 000A6E98    inc         eax
 000A6E99    mov         dword ptr [ebp-28],eax
 000A6E9C    mov         byte ptr [ebp-24],0
 000A6EA0    mov         eax,dword ptr [ebp-4]
 000A6EA3    mov         eax,dword ptr [eax+38C]
 000A6EA9    mov         dword ptr [ebp-20],eax
 000A6EAC    mov         byte ptr [ebp-1C],0B
 000A6EB0    lea         edx,[ebp-28]
 000A6EB3    mov         ecx,1
 000A6EB8    mov         eax,83A
 000A6EBD    call        FmtLoadStr;'Error in line number %d:
%s'
 000A6EC2    push        dword ptr [ebp-18]
 000A6EC5    push        0A6F30;#13+#10
 000A6ECA    push        0A6F30;#13+#10
 000A6ECF    push        dword ptr [ebp-0C]
 000A6ED2    lea         eax,[ebp-14]
 000A6ED5    mov         edx,4
 000A6EDA    call        @LStrCatN
 000A6EDF    mov         edx,dword ptr [ebp-14]
 000A6EE2    mov         eax,dword ptr [ebp-4]
 000A6EE5    call        000A6D44
 000A6EEA    call        @DoneExcept
 000A6EEF    xor         eax,eax
 000A6EF1    pop         edx
 000A6EF2    pop         ecx
 000A6EF3    pop         ecx
 000A6EF4    mov         dword ptr fs:[eax],edx
 000A6EF7    push        0A6F19
 000A6EFC    lea         eax,[ebp-18]
 000A6EFF    mov         edx,2
 000A6F04    call        @LStrArrayClr
 000A6F09    lea         eax,[ebp-8]
 000A6F0C    call        @LStrClr
 000A6F11    ret
>000A6F12    jmp         @HandleFinally
>000A6F17    jmp         000A6EFC
 000A6F19    mov         eax,dword ptr [ebp-10]
 000A6F1C    pop         edi
 000A6F1D    pop         esi
 000A6F1E    pop         ebx
 000A6F1F    mov         esp,ebp
 000A6F21    pop         ebp
 000A6F22    ret         8
end;*}

//000A6F34
{*procedure sub_000A6F34(?:TFormScript; ?:AnsiString; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?);
begin
 000A6F34    push        ebp
 000A6F35    mov         ebp,esp
 000A6F37    add         esp,0FFFFFFE0
 000A6F3A    push        ebx
 000A6F3B    push        esi
 000A6F3C    push        edi
 000A6F3D    xor         ebx,ebx
 000A6F3F    mov         dword ptr [ebp-0C],ebx
 000A6F42    mov         dword ptr [ebp-10],ebx
 000A6F45    mov         esi,ecx
 000A6F47    mov         dword ptr [ebp-8],edx
 000A6F4A    mov         dword ptr [ebp-4],eax
 000A6F4D    mov         ebx,dword ptr [ebp+8]
 000A6F50    mov         eax,dword ptr [ebp-8]
 000A6F53    call        @LStrAddRef
 000A6F58    xor         eax,eax
 000A6F5A    push        ebp
 000A6F5B    push        0A7027
 000A6F60    push        dword ptr fs:[eax]
 000A6F63    mov         dword ptr fs:[eax],esp
 000A6F66    xor         eax,eax
 000A6F68    push        ebp
 000A6F69    push        0A6FA9
 000A6F6E    push        dword ptr fs:[eax]
 000A6F71    mov         dword ptr fs:[eax],esp
 000A6F74    cmp         byte ptr [ebp+0C],0
>000A6F78    je          000A6F89
 000A6F7A    cmp         dword ptr [ebp-8],0
>000A6F7E    jne         000A6F89
 000A6F80    mov         eax,ebx
 000A6F82    call        @LStrClr
>000A6F87    jmp         000A6F96
 000A6F89    mov         ecx,ebx
 000A6F8B    mov         dl,byte ptr [ebp+14]
 000A6F8E    mov         eax,dword ptr [ebp-8]
 000A6F91    call        00074ED4
 000A6F96    mov         eax,dword ptr [ebx]
 000A6F98    call        @LStrLen
 000A6F9D    mov         dword ptr [esi],eax
 000A6F9F    xor         eax,eax
 000A6FA1    pop         edx
 000A6FA2    pop         ecx
 000A6FA3    pop         ecx
 000A6FA4    mov         dword ptr fs:[eax],edx
>000A6FA7    jmp         000A700C
>000A6FA9    jmp         @HandleAnyException
 000A6FAE    lea         eax,[ebp-10]
 000A6FB1    push        eax
 000A6FB2    mov         eax,dword ptr [ebp+10]
 000A6FB5    inc         eax
 000A6FB6    mov         dword ptr [ebp-20],eax
 000A6FB9    mov         byte ptr [ebp-1C],0
 000A6FBD    mov         eax,dword ptr [ebp-4]
 000A6FC0    mov         eax,dword ptr [eax+38C]
 000A6FC6    mov         dword ptr [ebp-18],eax
 000A6FC9    mov         byte ptr [ebp-14],0B
 000A6FCD    lea         edx,[ebp-20]
 000A6FD0    mov         ecx,1
 000A6FD5    mov         eax,83A
 000A6FDA    call        FmtLoadStr;'Error in line number %d:
%s'
 000A6FDF    push        dword ptr [ebp-10]
 000A6FE2    push        0A7040;#13+#10
 000A6FE7    push        0A7040;#13+#10
 000A6FEC    push        dword ptr [ebp+18]
 000A6FEF    lea         eax,[ebp-0C]
 000A6FF2    mov         edx,4
 000A6FF7    call        @LStrCatN
 000A6FFC    mov         edx,dword ptr [ebp-0C]
 000A6FFF    mov         eax,dword ptr [ebp-4]
 000A7002    call        000A6D44
 000A7007    call        @DoneExcept
 000A700C    xor         eax,eax
 000A700E    pop         edx
 000A700F    pop         ecx
 000A7010    pop         ecx
 000A7011    mov         dword ptr fs:[eax],edx
 000A7014    push        0A702E
 000A7019    lea         eax,[ebp-10]
 000A701C    mov         edx,3
 000A7021    call        @LStrArrayClr
 000A7026    ret
>000A7027    jmp         @HandleFinally
>000A702C    jmp         000A7019
 000A702E    pop         edi
 000A702F    pop         esi
 000A7030    pop         ebx
 000A7031    mov         esp,ebp
 000A7033    pop         ebp
 000A7034    ret         14
end;*}

//000A7044
{*procedure sub_000A7044(?:TFormScript; ?:dword; ?:?);
begin
 000A7044    push        ebp
 000A7045    mov         ebp,esp
 000A7047    add         esp,0FFFFFFDC
 000A704A    push        ebx
 000A704B    push        esi
 000A704C    push        edi
 000A704D    xor         ebx,ebx
 000A704F    mov         dword ptr [ebp-4],ebx
 000A7052    mov         dword ptr [ebp-8],ebx
 000A7055    mov         dword ptr [ebp-1C],ebx
 000A7058    mov         edi,ecx
 000A705A    mov         ebx,edx
 000A705C    mov         esi,eax
 000A705E    xor         eax,eax
 000A7060    push        ebp
 000A7061    push        0A710A
 000A7066    push        dword ptr fs:[eax]
 000A7069    mov         dword ptr fs:[eax],esp
 000A706C    cmp         ebx,1
>000A706F    jl          000A707A
 000A7071    mov         eax,[000B5BA0];^gvar_000B6BAC:Single
 000A7076    cmp         ebx,dword ptr [eax]
>000A7078    jle         000A70E7
 000A707A    lea         eax,[ebp-8]
 000A707D    push        eax
 000A707E    inc         edi
 000A707F    mov         dword ptr [ebp-18],edi
 000A7082    mov         byte ptr [ebp-14],0
 000A7086    mov         eax,dword ptr [esi+38C]
 000A708C    mov         dword ptr [ebp-10],eax
 000A708F    mov         byte ptr [ebp-0C],0B
 000A7093    lea         edx,[ebp-18]
 000A7096    mov         ecx,1
 000A709B    mov         eax,83A
 000A70A0    call        FmtLoadStr;'Error in line number %d:
%s'
 000A70A5    push        dword ptr [ebp-8]
 000A70A8    push        0A7120;#13+#10
 000A70AD    push        0A7120;#13+#10
 000A70B2    lea         eax,[ebp-1C]
 000A70B5    push        eax
 000A70B6    dec         ebx
 000A70B7    mov         dword ptr [ebp-24],ebx
 000A70BA    mov         byte ptr [ebp-20],0
 000A70BE    lea         edx,[ebp-24]
 000A70C1    xor         ecx,ecx
 000A70C3    mov         eax,844
 000A70C8    call        FmtLoadStr;'Can't go to address: $%x'
 000A70CD    push        dword ptr [ebp-1C]
 000A70D0    lea         eax,[ebp-4]
 000A70D3    mov         edx,4
 000A70D8    call        @LStrCatN
 000A70DD    mov         edx,dword ptr [ebp-4]
 000A70E0    mov         eax,esi
 000A70E2    call        000A6D44
 000A70E7    xor         eax,eax
 000A70E9    pop         edx
 000A70EA    pop         ecx
 000A70EB    pop         ecx
 000A70EC    mov         dword ptr fs:[eax],edx
 000A70EF    push        0A7111
 000A70F4    lea         eax,[ebp-1C]
 000A70F7    call        @LStrClr
 000A70FC    lea         eax,[ebp-8]
 000A70FF    mov         edx,2
 000A7104    call        @LStrArrayClr
 000A7109    ret
>000A710A    jmp         @HandleFinally
>000A710F    jmp         000A70F4
 000A7111    pop         edi
 000A7112    pop         esi
 000A7113    pop         ebx
 000A7114    mov         esp,ebp
 000A7116    pop         ebp
 000A7117    ret
end;*}

//000A7124
{*procedure sub_000A7124(?:TFormScript; ?:String; ?:AnsiString; ?:?; ?:?; ?:?; ?:?);
begin
 000A7124    push        ebp
 000A7125    mov         ebp,esp
 000A7127    add         esp,0FFFFFFD8
 000A712A    push        ebx
 000A712B    push        esi
 000A712C    push        edi
 000A712D    xor         ebx,ebx
 000A712F    mov         dword ptr [ebp-8],ebx
 000A7132    mov         dword ptr [ebp-0C],ebx
 000A7135    mov         dword ptr [ebp-20],ebx
 000A7138    mov         dword ptr [ebp-4],ecx
 000A713B    mov         esi,edx
 000A713D    mov         edi,eax
 000A713F    xor         eax,eax
 000A7141    push        ebp
 000A7142    push        0A729A
 000A7147    push        dword ptr fs:[eax]
 000A714A    mov         dword ptr fs:[eax],esp
 000A714D    lea         edx,[ebp-8]
 000A7150    mov         eax,esi
 000A7152    call        UpperCase
 000A7157    mov         edx,dword ptr [ebp-8]
 000A715A    mov         eax,0A72B4;' BY '
 000A715F    call        @LStrPos
 000A7164    mov         ebx,eax
 000A7166    cmp         byte ptr [ebp+8],0
>000A716A    je          000A7189
 000A716C    test        ebx,ebx
>000A716E    jne         000A7189
 000A7170    lea         edx,[ebp-8]
 000A7173    mov         eax,esi
 000A7175    call        UpperCase
 000A717A    mov         edx,dword ptr [ebp-8]
 000A717D    mov         eax,0A72C4;' BY'
 000A7182    call        @LStrPos
 000A7187    mov         ebx,eax
 000A7189    test        ebx,ebx
>000A718B    jne         000A7212
 000A7191    mov         eax,dword ptr [ebp-4]
 000A7194    call        @LStrClr
 000A7199    mov         eax,dword ptr [ebp+14]
 000A719C    call        @LStrClr
 000A71A1    lea         eax,[ebp-0C]
 000A71A4    push        eax
 000A71A5    mov         eax,dword ptr [ebp+10]
 000A71A8    inc         eax
 000A71A9    mov         dword ptr [ebp-1C],eax
 000A71AC    mov         byte ptr [ebp-18],0
 000A71B0    mov         eax,dword ptr [edi+38C]
 000A71B6    mov         dword ptr [ebp-14],eax
 000A71B9    mov         byte ptr [ebp-10],0B
 000A71BD    lea         edx,[ebp-1C]
 000A71C0    mov         ecx,1
 000A71C5    mov         eax,83A
 000A71CA    call        FmtLoadStr;'Error in line number %d:
%s'
 000A71CF    push        dword ptr [ebp-0C]
 000A71D2    push        0A72D0;#13+#10
 000A71D7    push        0A72D0;#13+#10
 000A71DC    lea         eax,[ebp-20]
 000A71DF    push        eax
 000A71E0    mov         dword ptr [ebp-28],esi
 000A71E3    mov         byte ptr [ebp-24],0B
 000A71E7    lea         edx,[ebp-28]
 000A71EA    xor         ecx,ecx
 000A71EC    mov         eax,83F
 000A71F1    call        FmtLoadStr;'Invalid REPLACE ... BY ... command!'
 000A71F6    push        dword ptr [ebp-20]
 000A71F9    lea         eax,[ebp-8]
 000A71FC    mov         edx,4
 000A7201    call        @LStrCatN
 000A7206    mov         edx,dword ptr [ebp-8]
 000A7209    mov         eax,edi
 000A720B    call        000A6D44
>000A7210    jmp         000A7277
 000A7212    mov         eax,dword ptr [ebp-4]
 000A7215    push        eax
 000A7216    mov         ecx,ebx
 000A7218    dec         ecx
 000A7219    mov         edx,1
 000A721E    mov         eax,esi
 000A7220    call        @LStrCopy
 000A7225    mov         eax,dword ptr [ebp+14]
 000A7228    push        eax
 000A7229    mov         eax,esi
 000A722B    call        @LStrLen
 000A7230    mov         ecx,eax
 000A7232    sub         ecx,ebx
 000A7234    sub         ecx,3
 000A7237    lea         edx,[ebx+4]
 000A723A    mov         eax,esi
 000A723C    call        @LStrCopy
 000A7241    cmp         byte ptr [ebp+0C],0
>000A7245    je          000A7277
 000A7247    lea         edx,[ebp-8]
 000A724A    mov         eax,dword ptr [ebp-4]
 000A724D    mov         eax,dword ptr [eax]
 000A724F    call        Trim
 000A7254    mov         edx,dword ptr [ebp-8]
 000A7257    mov         eax,dword ptr [ebp-4]
 000A725A    call        @LStrAsg
 000A725F    lea         edx,[ebp-8]
 000A7262    mov         eax,dword ptr [ebp+14]
 000A7265    mov         eax,dword ptr [eax]
 000A7267    call        Trim
 000A726C    mov         edx,dword ptr [ebp-8]
 000A726F    mov         eax,dword ptr [ebp+14]
 000A7272    call        @LStrAsg
 000A7277    xor         eax,eax
 000A7279    pop         edx
 000A727A    pop         ecx
 000A727B    pop         ecx
 000A727C    mov         dword ptr fs:[eax],edx
 000A727F    push        0A72A1
 000A7284    lea         eax,[ebp-20]
 000A7287    call        @LStrClr
 000A728C    lea         eax,[ebp-0C]
 000A728F    mov         edx,2
 000A7294    call        @LStrArrayClr
 000A7299    ret
>000A729A    jmp         @HandleFinally
>000A729F    jmp         000A7284
 000A72A1    pop         edi
 000A72A2    pop         esi
 000A72A3    pop         ebx
 000A72A4    mov         esp,ebp
 000A72A6    pop         ebp
 000A72A7    ret         10
end;*}

//000A72D4
{*procedure sub_000A72D4(?:TFormScript; ?:String; ?:TStringList; ?:?);
begin
 000A72D4    push        ebp
 000A72D5    mov         ebp,esp
 000A72D7    add         esp,0FFFFFFC8
 000A72DA    push        ebx
 000A72DB    push        esi
 000A72DC    push        edi
 000A72DD    xor         ebx,ebx
 000A72DF    mov         dword ptr [ebp-18],ebx
 000A72E2    mov         dword ptr [ebp-1C],ebx
 000A72E5    mov         dword ptr [ebp-30],ebx
 000A72E8    mov         dword ptr [ebp-0C],ebx
 000A72EB    mov         dword ptr [ebp-10],ebx
 000A72EE    mov         dword ptr [ebp-8],ecx
 000A72F1    mov         dword ptr [ebp-4],edx
 000A72F4    mov         esi,eax
 000A72F6    mov         edi,dword ptr [ebp+8]
 000A72F9    mov         eax,dword ptr [ebp-4]
 000A72FC    call        @LStrAddRef
 000A7301    xor         eax,eax
 000A7303    push        ebp
 000A7304    push        0A748F
 000A7309    push        dword ptr fs:[eax]
 000A730C    mov         dword ptr fs:[eax],esp
 000A730F    lea         edx,[ebp-18]
 000A7312    mov         eax,dword ptr [ebp-4]
 000A7315    call        UpperCase
 000A731A    mov         edx,dword ptr [ebp-18]
 000A731D    lea         eax,[ebp-4]
 000A7320    call        @LStrLAsg
 000A7325    mov         edx,dword ptr [ebp-4]
 000A7328    mov         eax,0A74A8;'OR'
 000A732D    call        @LStrPos
 000A7332    mov         ebx,eax
 000A7334    test        ebx,ebx
>000A7336    jne         000A7345
 000A7338    lea         eax,[ebp-0C]
 000A733B    mov         edx,dword ptr [ebp-4]
 000A733E    call        @LStrLAsg
>000A7343    jmp         000A7396
 000A7345    lea         eax,[ebp-18]
 000A7348    push        eax
 000A7349    mov         ecx,ebx
 000A734B    dec         ecx
 000A734C    mov         edx,1
 000A7351    mov         eax,dword ptr [ebp-4]
 000A7354    call        @LStrCopy
 000A7359    mov         eax,dword ptr [ebp-18]
 000A735C    lea         edx,[ebp-0C]
 000A735F    call        Trim
 000A7364    lea         eax,[ebp-1C]
 000A7367    push        eax
 000A7368    mov         eax,dword ptr [ebp-4]
 000A736B    call        @LStrLen
 000A7370    mov         ecx,eax
 000A7372    sub         ecx,ebx
 000A7374    dec         ecx
 000A7375    lea         edx,[ebx+2]
 000A7378    mov         eax,dword ptr [ebp-4]
 000A737B    call        @LStrCopy
 000A7380    mov         eax,dword ptr [ebp-1C]
 000A7383    lea         edx,[ebp-18]
 000A7386    call        Trim
 000A738B    mov         edx,dword ptr [ebp-18]
 000A738E    lea         eax,[ebp-4]
 000A7391    call        @LStrLAsg
 000A7396    cmp         dword ptr [ebp-0C],0
>000A739A    jne         000A73FD
 000A739C    lea         eax,[ebp-1C]
 000A739F    push        eax
 000A73A0    lea         eax,[edi+1]
 000A73A3    mov         dword ptr [ebp-2C],eax
 000A73A6    mov         byte ptr [ebp-28],0
 000A73AA    mov         eax,dword ptr [esi+38C]
 000A73B0    mov         dword ptr [ebp-24],eax
 000A73B3    mov         byte ptr [ebp-20],0B
 000A73B7    lea         edx,[ebp-2C]
 000A73BA    mov         ecx,1
 000A73BF    mov         eax,83A
 000A73C4    call        FmtLoadStr;'Error in line number %d:
%s'
 000A73C9    push        dword ptr [ebp-1C]
 000A73CC    push        0A74B4;#13+#10
 000A73D1    push        0A74B4;#13+#10
 000A73D6    lea         edx,[ebp-30]
 000A73D9    mov         eax,840
 000A73DE    call        LoadStr;'Invalid VERIFY command!'
 000A73E3    push        dword ptr [ebp-30]
 000A73E6    lea         eax,[ebp-18]
 000A73E9    mov         edx,4
 000A73EE    call        @LStrCatN
 000A73F3    mov         edx,dword ptr [ebp-18]
 000A73F6    mov         eax,esi
 000A73F8    call        000A6D44
 000A73FD    lea         ecx,[ebp-10]
 000A7400    mov         dl,3F
 000A7402    mov         eax,dword ptr [ebp-0C]
 000A7405    call        00074BF4
 000A740A    lea         eax,[ebp-1C]
 000A740D    push        eax
 000A740E    mov         eax,dword ptr [esi+390]
 000A7414    mov         dword ptr [ebp-38],eax
 000A7417    mov         byte ptr [ebp-34],0B
 000A741B    lea         edx,[ebp-38]
 000A741E    xor         ecx,ecx
 000A7420    mov         eax,83D
 000A7425    call        FmtLoadStr;'Invalid Hex String:
%s'
 000A742A    mov         eax,dword ptr [ebp-1C]
 000A742D    push        eax
 000A742E    push        0
 000A7430    push        edi
 000A7431    push        0
 000A7433    lea         eax,[ebp-18]
 000A7436    push        eax
 000A7437    lea         ecx,[ebp-14]
 000A743A    mov         edx,dword ptr [ebp-10]
 000A743D    mov         eax,esi
 000A743F    call        000A6F34
 000A7444    mov         edx,dword ptr [ebp-0C]
 000A7447    mov         eax,dword ptr [ebp-8]
 000A744A    mov         ecx,dword ptr [eax]
 000A744C    call        dword ptr [ecx+34]
 000A744F    test        ebx,ebx
>000A7451    jne         000A7325
 000A7457    xor         eax,eax
 000A7459    pop         edx
 000A745A    pop         ecx
 000A745B    pop         ecx
 000A745C    mov         dword ptr fs:[eax],edx
 000A745F    push        0A7496
 000A7464    lea         eax,[ebp-30]
 000A7467    call        @LStrClr
 000A746C    lea         eax,[ebp-1C]
 000A746F    mov         edx,2
 000A7474    call        @LStrArrayClr
 000A7479    lea         eax,[ebp-10]
 000A747C    mov         edx,2
 000A7481    call        @LStrArrayClr
 000A7486    lea         eax,[ebp-4]
 000A7489    call        @LStrClr
 000A748E    ret
>000A748F    jmp         @HandleFinally
>000A7494    jmp         000A7464
 000A7496    pop         edi
 000A7497    pop         esi
 000A7498    pop         ebx
 000A7499    mov         esp,ebp
 000A749B    pop         ebp
 000A749C    ret         4
end;*}

//000A74B8
{*procedure sub_000A74B8(?:?; ?:?; ?:?; ?:?; ?:?);
begin
 000A74B8    push        ebp
 000A74B9    mov         ebp,esp
 000A74BB    push        ecx
 000A74BC    push        ebx
 000A74BD    push        esi
 000A74BE    mov         byte ptr [ebp-1],cl
 000A74C1    mov         ebx,edx
 000A74C3    mov         esi,eax
 000A74C5    mov         eax,[000B5AA4];^gvar_000B6BB5:Boolean
 000A74CA    mov         al,byte ptr [eax]
 000A74CC    mov         byte ptr [esi+398],al
 000A74D2    mov         eax,[000B5B54];^gvar_000B6BF0:Boolean
 000A74D7    mov         al,byte ptr [eax]
 000A74D9    mov         byte ptr [esi+39A],al
 000A74DF    mov         eax,[000B5794];^gvar_000B6BC6:Boolean
 000A74E4    mov         al,byte ptr [eax]
 000A74E6    mov         byte ptr [esi+399],al
 000A74EC    mov         eax,[000B5C04];^gvar_000B6BC7:AnsiString
 000A74F1    mov         al,byte ptr [eax]
 000A74F3    mov         byte ptr [esi+39B],al
 000A74F9    lea         eax,[esi+39C]
 000A74FF    mov         edx,dword ptr ds:[0B57E4];^gvar_000B6BB8:AnsiString
 000A7505    mov         edx,dword ptr [edx]
 000A7507    call        @LStrAsg
 000A750C    lea         eax,[esi+3A0]
 000A7512    mov         edx,dword ptr ds:[0B5B10];^gvar_000B6BC0:AnsiString
 000A7518    mov         edx,dword ptr [edx]
 000A751A    call        @LStrAsg
 000A751F    mov         eax,[000B5AA4];^gvar_000B6BB5:Boolean
 000A7524    mov         byte ptr [eax],1
 000A7527    mov         eax,[000B5B54];^gvar_000B6BF0:Boolean
 000A752C    mov         byte ptr [eax],1
 000A752F    mov         eax,[000B5794];^gvar_000B6BC6:Boolean
 000A7534    mov         byte ptr [eax],bl
 000A7536    mov         eax,[000B5C04];^gvar_000B6BC7:AnsiString
 000A753B    mov         dl,byte ptr [ebp-1]
 000A753E    mov         byte ptr [eax],dl
 000A7540    mov         eax,[000B57E4];^gvar_000B6BB8:AnsiString
 000A7545    mov         edx,dword ptr [ebp+0C]
 000A7548    call        @LStrAsg
 000A754D    mov         eax,[000B5B10];^gvar_000B6BC0:AnsiString
 000A7552    mov         edx,dword ptr [ebp+8]
 000A7555    call        @LStrAsg
 000A755A    pop         esi
 000A755B    pop         ebx
 000A755C    pop         ecx
 000A755D    pop         ebp
 000A755E    ret         8
end;*}

//000A7564
{*procedure sub_000A7564(?:?);
begin
 000A7564    push        ebx
 000A7565    mov         ebx,eax
 000A7567    mov         eax,[000B5AA4];^gvar_000B6BB5:Boolean
 000A756C    mov         dl,byte ptr [ebx+398]
 000A7572    mov         byte ptr [eax],dl
 000A7574    mov         eax,[000B5B54];^gvar_000B6BF0:Boolean
 000A7579    mov         dl,byte ptr [ebx+39A]
 000A757F    mov         byte ptr [eax],dl
 000A7581    mov         eax,[000B5794];^gvar_000B6BC6:Boolean
 000A7586    mov         dl,byte ptr [ebx+399]
 000A758C    mov         byte ptr [eax],dl
 000A758E    mov         eax,[000B5C04];^gvar_000B6BC7:AnsiString
 000A7593    mov         dl,byte ptr [ebx+39B]
 000A7599    mov         byte ptr [eax],dl
 000A759B    mov         eax,[000B57E4];^gvar_000B6BB8:AnsiString
 000A75A0    mov         edx,dword ptr [ebx+39C]
 000A75A6    call        @LStrAsg
 000A75AB    mov         eax,[000B5B10];^gvar_000B6BC0:AnsiString
 000A75B0    mov         edx,dword ptr [ebx+3A0]
 000A75B6    call        @LStrAsg
 000A75BB    pop         ebx
 000A75BC    ret
end;*}

//000A75C0
{*procedure sub_000A75C0(?:TFormScript; ?:?; ?:?);
begin
 000A75C0    push        ebp
 000A75C1    mov         ebp,esp
 000A75C3    add         esp,0FFFFFFD0
 000A75C6    push        ebx
 000A75C7    xor         ebx,ebx
 000A75C9    mov         dword ptr [ebp-10],ebx
 000A75CC    mov         dword ptr [ebp-14],ebx
 000A75CF    mov         dword ptr [ebp-28],ebx
 000A75D2    mov         dword ptr [ebp-4],eax
 000A75D5    xor         eax,eax
 000A75D7    push        ebp
 000A75D8    push        0A775A
 000A75DD    push        dword ptr fs:[eax]
 000A75E0    mov         dword ptr fs:[eax],esp
 000A75E3    mov         eax,dword ptr [ebp+0C]
 000A75E6    push        eax
 000A75E7    push        0
 000A75E9    mov         eax,dword ptr [ebp-4]
 000A75EC    call        000A74B8
 000A75F1    lea         edx,[ebp-10]
 000A75F4    mov         eax,7FD
 000A75F9    call        LoadStr;'Searching...'
 000A75FE    mov         edx,dword ptr [ebp-10]
 000A7601    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000A7606    mov         eax,dword ptr [eax]
 000A7608    call        0008E140
 000A760D    lea         edx,[ebp-10]
 000A7610    mov         eax,7FF
 000A7615    call        LoadStr;'Current file position'
 000A761A    mov         edx,dword ptr [ebp-10]
 000A761D    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000A7622    mov         eax,dword ptr [eax]
 000A7624    mov         ecx,1
 000A7629    call        0008E154
 000A762E    xor         eax,eax
 000A7630    push        ebp
 000A7631    push        0A767C
 000A7636    push        dword ptr fs:[eax]
 000A7639    mov         dword ptr fs:[eax],esp
 000A763C    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000A7641    mov         eax,dword ptr [eax]
 000A7643    call        TCustomForm.Show
 000A7648    mov         eax,dword ptr [ebp-4]
 000A764B    mov         eax,dword ptr [eax+384]
 000A7651    mov         dword ptr [ebp-0C],eax
 000A7654    push        0
 000A7656    push        0
 000A7658    lea         ecx,[ebp-6]
 000A765B    lea         edx,[ebp-5]
 000A765E    lea         eax,[ebp-0C]
 000A7661    call        0009A450
 000A7666    xor         eax,eax
 000A7668    pop         edx
 000A7669    pop         ecx
 000A766A    pop         ecx
 000A766B    mov         dword ptr fs:[eax],edx
 000A766E    push        0A7683
 000A7673    mov         eax,dword ptr [ebp-4]
 000A7676    call        000A7564
 000A767B    ret
>000A767C    jmp         @HandleFinally
>000A7681    jmp         000A7673
 000A7683    cmp         byte ptr [ebp-6],0
>000A7687    je          000A76A6
 000A7689    lea         edx,[ebp-10]
 000A768C    mov         eax,84D
 000A7691    call        LoadStr;'User abort!'
 000A7696    mov         edx,dword ptr [ebp-10]
 000A7699    mov         eax,dword ptr [ebp-4]
 000A769C    call        000A6D44
>000A76A1    jmp         000A7737
 000A76A6    cmp         byte ptr [ebp-5],0
>000A76AA    je          000A76BA
 000A76AC    mov         eax,dword ptr [ebp-4]
 000A76AF    mov         edx,dword ptr [ebp-0C]
 000A76B2    mov         dword ptr [eax+384],edx
>000A76B8    jmp         000A7737
 000A76BA    lea         eax,[ebp-14]
 000A76BD    push        eax
 000A76BE    mov         eax,dword ptr [ebp+8]
 000A76C1    inc         eax
 000A76C2    mov         dword ptr [ebp-24],eax
 000A76C5    mov         byte ptr [ebp-20],0
 000A76C9    mov         eax,dword ptr [ebp-4]
 000A76CC    mov         eax,dword ptr [eax+38C]
 000A76D2    mov         dword ptr [ebp-1C],eax
 000A76D5    mov         byte ptr [ebp-18],0B
 000A76D9    lea         edx,[ebp-24]
 000A76DC    mov         ecx,1
 000A76E1    mov         eax,83A
 000A76E6    call        FmtLoadStr;'Error in line number %d:
%s'
 000A76EB    push        dword ptr [ebp-14]
 000A76EE    push        0A7770;#13+#10
 000A76F3    push        0A7770;#13+#10
 000A76F8    lea         eax,[ebp-28]
 000A76FB    push        eax
 000A76FC    mov         eax,dword ptr [ebp-4]
 000A76FF    mov         eax,dword ptr [eax+384]
 000A7705    dec         eax
 000A7706    mov         dword ptr [ebp-30],eax
 000A7709    mov         byte ptr [ebp-2C],0
 000A770D    lea         edx,[ebp-30]
 000A7710    xor         ecx,ecx
 000A7712    mov         eax,84E
 000A7717    call        FmtLoadStr;'FIND: string not found beginning
at address $%x'
 000A771C    push        dword ptr [ebp-28]
 000A771F    lea         eax,[ebp-10]
 000A7722    mov         edx,4
 000A7727    call        @LStrCatN
 000A772C    mov         edx,dword ptr [ebp-10]
 000A772F    mov         eax,dword ptr [ebp-4]
 000A7732    call        000A6D44
 000A7737    xor         eax,eax
 000A7739    pop         edx
 000A773A    pop         ecx
 000A773B    pop         ecx
 000A773C    mov         dword ptr fs:[eax],edx
 000A773F    push        0A7761
 000A7744    lea         eax,[ebp-28]
 000A7747    call        @LStrClr
 000A774C    lea         eax,[ebp-14]
 000A774F    mov         edx,2
 000A7754    call        @LStrArrayClr
 000A7759    ret
>000A775A    jmp         @HandleFinally
>000A775F    jmp         000A7744
 000A7761    pop         ebx
 000A7762    mov         esp,ebp
 000A7764    pop         ebp
 000A7765    ret         8
end;*}

//000A7774
{*procedure sub_000A7774(?:TFormScript; ?:?; ?:?);
begin
 000A7774    push        ebp
 000A7775    mov         ebp,esp
 000A7777    add         esp,0FFFFFFF0
 000A777A    push        ebx
 000A777B    xor         ebx,ebx
 000A777D    mov         dword ptr [ebp-10],ebx
 000A7780    mov         dword ptr [ebp-4],eax
 000A7783    xor         eax,eax
 000A7785    push        ebp
 000A7786    push        0A7887
 000A778B    push        dword ptr fs:[eax]
 000A778E    mov         dword ptr fs:[eax],esp
 000A7791    mov         eax,dword ptr [ebp+0C]
 000A7794    push        eax
 000A7795    mov         eax,dword ptr [ebp+8]
 000A7798    push        eax
 000A7799    mov         eax,dword ptr [ebp-4]
 000A779C    call        000A74B8
 000A77A1    lea         edx,[ebp-10]
 000A77A4    mov         eax,80B
 000A77A9    call        LoadStr;'Replacing...'
 000A77AE    mov         edx,dword ptr [ebp-10]
 000A77B1    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000A77B6    mov         eax,dword ptr [eax]
 000A77B8    call        0008E140
 000A77BD    lea         edx,[ebp-10]
 000A77C0    mov         eax,7FD
 000A77C5    call        LoadStr;'Searching...'
 000A77CA    mov         edx,dword ptr [ebp-10]
 000A77CD    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000A77D2    mov         eax,dword ptr [eax]
 000A77D4    mov         ecx,1
 000A77D9    call        0008E154
 000A77DE    xor         eax,eax
 000A77E0    push        ebp
 000A77E1    push        0A783A
 000A77E6    push        dword ptr fs:[eax]
 000A77E9    mov         dword ptr fs:[eax],esp
 000A77EC    xor         eax,eax
 000A77EE    call        000986CC
 000A77F3    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000A77F8    mov         eax,dword ptr [eax]
 000A77FA    call        TCustomForm.Show
 000A77FF    mov         eax,dword ptr [ebp-4]
 000A7802    mov         eax,dword ptr [eax+384]
 000A7808    mov         dword ptr [ebp-0C],eax
 000A780B    lea         eax,[ebp-7]
 000A780E    push        eax
 000A780F    push        0
 000A7811    lea         ecx,[ebp-6]
 000A7814    lea         edx,[ebp-5]
 000A7817    lea         eax,[ebp-0C]
 000A781A    call        0009A6F0
 000A781F    xor         eax,eax
 000A7821    pop         edx
 000A7822    pop         ecx
 000A7823    pop         ecx
 000A7824    mov         dword ptr fs:[eax],edx
 000A7827    push        0A7841
 000A782C    mov         eax,dword ptr [ebp-4]
 000A782F    call        000A7564
 000A7834    call        000986F4
 000A7839    ret
>000A783A    jmp         @HandleFinally
>000A783F    jmp         000A782C
 000A7841    cmp         byte ptr [ebp-7],0
>000A7845    je          000A785F
 000A7847    lea         edx,[ebp-10]
 000A784A    mov         eax,84D
 000A784F    call        LoadStr;'User abort!'
 000A7854    mov         edx,dword ptr [ebp-10]
 000A7857    mov         eax,dword ptr [ebp-4]
 000A785A    call        000A6D44
 000A785F    cmp         byte ptr [ebp-6],0
>000A7863    je          000A7871
 000A7865    mov         eax,dword ptr [ebp-4]
 000A7868    mov         edx,dword ptr [ebp-0C]
 000A786B    mov         dword ptr [eax+384],edx
 000A7871    xor         eax,eax
 000A7873    pop         edx
 000A7874    pop         ecx
 000A7875    pop         ecx
 000A7876    mov         dword ptr fs:[eax],edx
 000A7879    push        0A788E
 000A787E    lea         eax,[ebp-10]
 000A7881    call        @LStrClr
 000A7886    ret
>000A7887    jmp         @HandleFinally
>000A788C    jmp         000A787E
 000A788E    pop         ebx
 000A788F    mov         esp,ebp
 000A7891    pop         ebp
 000A7892    ret         8
end;*}

//000A7898
{*procedure sub_000A7898(?:TFormScript; ?:?; ?:?);
begin
 000A7898    push        ebp
 000A7899    mov         ebp,esp
 000A789B    add         esp,0FFFFFFEC
 000A789E    push        ebx
 000A789F    xor         ebx,ebx
 000A78A1    mov         dword ptr [ebp-14],ebx
 000A78A4    mov         dword ptr [ebp-4],eax
 000A78A7    xor         eax,eax
 000A78A9    push        ebp
 000A78AA    push        0A79A7
 000A78AF    push        dword ptr fs:[eax]
 000A78B2    mov         dword ptr fs:[eax],esp
 000A78B5    mov         eax,dword ptr [ebp+0C]
 000A78B8    push        eax
 000A78B9    mov         eax,dword ptr [ebp+8]
 000A78BC    push        eax
 000A78BD    mov         eax,dword ptr [ebp-4]
 000A78C0    call        000A74B8
 000A78C5    lea         edx,[ebp-14]
 000A78C8    mov         eax,80B
 000A78CD    call        LoadStr;'Replacing...'
 000A78D2    mov         edx,dword ptr [ebp-14]
 000A78D5    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000A78DA    mov         eax,dword ptr [eax]
 000A78DC    call        0008E140
 000A78E1    lea         edx,[ebp-14]
 000A78E4    mov         eax,7FD
 000A78E9    call        LoadStr;'Searching...'
 000A78EE    mov         edx,dword ptr [ebp-14]
 000A78F1    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000A78F6    mov         eax,dword ptr [eax]
 000A78F8    mov         ecx,1
 000A78FD    call        0008E154
 000A7902    xor         edx,edx
 000A7904    push        ebp
 000A7905    push        0A7958
 000A790A    push        dword ptr fs:[edx]
 000A790D    mov         dword ptr fs:[edx],esp
 000A7910    xor         eax,eax
 000A7912    call        000986CC
 000A7917    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000A791C    mov         eax,dword ptr [eax]
 000A791E    call        TCustomForm.Show
 000A7923    mov         eax,dword ptr [ebp-4]
 000A7926    mov         eax,dword ptr [eax+384]
 000A792C    lea         edx,[ebp-0D]
 000A792F    push        edx
 000A7930    push        0
 000A7932    lea         ecx,[ebp-0C]
 000A7935    lea         edx,[ebp-8]
 000A7938    call        0009AE24
 000A793D    xor         eax,eax
 000A793F    pop         edx
 000A7940    pop         ecx
 000A7941    pop         ecx
 000A7942    mov         dword ptr fs:[eax],edx
 000A7945    push        0A795F
 000A794A    call        000986F4
 000A794F    mov         eax,dword ptr [ebp-4]
 000A7952    call        000A7564
 000A7957    ret
>000A7958    jmp         @HandleFinally
>000A795D    jmp         000A794A
 000A795F    cmp         byte ptr [ebp-0D],0
>000A7963    je          000A797D
 000A7965    lea         edx,[ebp-14]
 000A7968    mov         eax,84D
 000A796D    call        LoadStr;'User abort!'
 000A7972    mov         edx,dword ptr [ebp-14]
 000A7975    mov         eax,dword ptr [ebp-4]
 000A7978    call        000A6D44
 000A797D    cmp         dword ptr [ebp-0C],0
>000A7981    jle         000A7991
 000A7983    call        000981C4
 000A7988    mov         edx,dword ptr [ebp-4]
 000A798B    mov         dword ptr [edx+384],eax
 000A7991    xor         eax,eax
 000A7993    pop         edx
 000A7994    pop         ecx
 000A7995    pop         ecx
 000A7996    mov         dword ptr fs:[eax],edx
 000A7999    push        0A79AE
 000A799E    lea         eax,[ebp-14]
 000A79A1    call        @LStrClr
 000A79A6    ret
>000A79A7    jmp         @HandleFinally
>000A79AC    jmp         000A799E
 000A79AE    pop         ebx
 000A79AF    mov         esp,ebp
 000A79B1    pop         ebp
 000A79B2    ret         8
end;*}

//000A79B8
{*procedure sub_000A79B8(?:TFormScript; ?:?; ?:AnsiString; ?:?; ?:?);
begin
 000A79B8    push        ebp
 000A79B9    mov         ebp,esp
 000A79BB    add         esp,0FFFFFFDC
 000A79BE    push        ebx
 000A79BF    push        esi
 000A79C0    xor         ebx,ebx
 000A79C2    mov         dword ptr [ebp-0C],ebx
 000A79C5    mov         dword ptr [ebp-10],ebx
 000A79C8    mov         dword ptr [ebp-24],ebx
 000A79CB    mov         byte ptr [ebp-6],cl
 000A79CE    mov         byte ptr [ebp-5],dl
 000A79D1    mov         dword ptr [ebp-4],eax
 000A79D4    xor         eax,eax
 000A79D6    push        ebp
 000A79D7    push        0A7C38
 000A79DC    push        dword ptr fs:[eax]
 000A79DF    mov         dword ptr fs:[eax],esp
 000A79E2    mov         eax,dword ptr [ebp-4]
 000A79E5    mov         eax,dword ptr [eax+384]
 000A79EB    add         eax,dword ptr [ebp+0C]
 000A79EE    dec         eax
 000A79EF    mov         edx,dword ptr ds:[0B5BA0];^gvar_000B6BAC:Single
 000A79F5    cmp         eax,dword ptr [edx]
>000A79F7    jle         000A7A5F
 000A79F9    lea         eax,[ebp-10]
 000A79FC    push        eax
 000A79FD    mov         eax,dword ptr [ebp+8]
 000A7A00    inc         eax
 000A7A01    mov         dword ptr [ebp-20],eax
 000A7A04    mov         byte ptr [ebp-1C],0
 000A7A08    mov         eax,dword ptr [ebp-4]
 000A7A0B    mov         eax,dword ptr [eax+38C]
 000A7A11    mov         dword ptr [ebp-18],eax
 000A7A14    mov         byte ptr [ebp-14],0B
 000A7A18    lea         edx,[ebp-20]
 000A7A1B    mov         ecx,1
 000A7A20    mov         eax,83A
 000A7A25    call        FmtLoadStr;'Error in line number %d:
%s'
 000A7A2A    push        dword ptr [ebp-10]
 000A7A2D    push        0A7C50;#13+#10
 000A7A32    push        0A7C50;#13+#10
 000A7A37    lea         edx,[ebp-24]
 000A7A3A    mov         eax,843
 000A7A3F    call        LoadStr;'Can't write beyond end of file'
 000A7A44    push        dword ptr [ebp-24]
 000A7A47    lea         eax,[ebp-0C]
 000A7A4A    mov         edx,4
 000A7A4F    call        @LStrCatN
 000A7A54    mov         edx,dword ptr [ebp-0C]
 000A7A57    mov         eax,dword ptr [ebp-4]
 000A7A5A    call        000A6D44
 000A7A5F    cmp         dword ptr [ebp+0C],0C8
 000A7A66    setg        byte ptr [ebp-7]
 000A7A6A    mov         byte ptr [ebp-8],0
 000A7A6E    cmp         byte ptr [ebp-7],0
>000A7A72    je          000A7AAF
 000A7A74    lea         edx,[ebp-0C]
 000A7A77    mov         eax,85B
 000A7A7C    call        LoadStr;'Bitwise operation'
 000A7A81    mov         edx,dword ptr [ebp-0C]
 000A7A84    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000A7A89    mov         eax,dword ptr [eax]
 000A7A8B    call        0008E140
 000A7A90    lea         eax,[ebp-0C]
 000A7A93    mov         dl,byte ptr [ebp-5]
 000A7A96    call        @LStrFromChar
 000A7A9B    mov         edx,dword ptr [ebp-0C]
 000A7A9E    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000A7AA3    mov         eax,dword ptr [eax]
 000A7AA5    mov         ecx,1
 000A7AAA    call        0008E154
 000A7AAF    xor         edx,edx
 000A7AB1    push        ebp
 000A7AB2    push        0A7BF0
 000A7AB7    push        dword ptr fs:[edx]
 000A7ABA    mov         dword ptr fs:[edx],esp
 000A7ABD    xor         eax,eax
 000A7ABF    call        000986CC
 000A7AC4    cmp         byte ptr [ebp-7],0
>000A7AC8    je          000A7AD6
 000A7ACA    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000A7ACF    mov         eax,dword ptr [eax]
 000A7AD1    call        TCustomForm.Show
 000A7AD6    mov         ebx,dword ptr [ebp+0C]
 000A7AD9    test        ebx,ebx
>000A7ADB    jle         000A7B9C
 000A7AE1    mov         esi,1
 000A7AE6    cmp         byte ptr [ebp-7],0
>000A7AEA    je          000A7AFF
 000A7AEC    push        5
 000A7AEE    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000A7AF3    mov         eax,dword ptr [eax]
 000A7AF5    mov         ecx,dword ptr [ebp+0C]
 000A7AF8    mov         edx,esi
 000A7AFA    call        0008E1A4
 000A7AFF    mov         eax,dword ptr [ebp-4]
 000A7B02    mov         eax,dword ptr [eax+384]
 000A7B08    call        000981AC
 000A7B0D    xor         edx,edx
 000A7B0F    mov         dl,byte ptr [ebp-5]
 000A7B12    add         edx,0FFFFFFBF
 000A7B15    cmp         edx,17
>000A7B18    ja          000A7B71
 000A7B1A    mov         dl,byte ptr [edx+0A7B27]
 000A7B20    jmp         dword ptr [edx*4+0A7B3F]
 000A7B20    db          2
 000A7B20    db          0
 000A7B20    db          0
 000A7B20    db          0
 000A7B20    db          0
 000A7B20    db          0
 000A7B20    db          0
 000A7B20    db          0
 000A7B20    db          0
 000A7B20    db          0
 000A7B20    db          0
 000A7B20    db          5
 000A7B20    db          0
 000A7B20    db          1
 000A7B20    db          3
 000A7B20    db          0
 000A7B20    db          0
 000A7B20    db          0
 000A7B20    db          0
 000A7B20    db          0
 000A7B20    db          0
 000A7B20    db          0
 000A7B20    db          0
 000A7B20    db          4
 000A7B20    dd          000A7B71
 000A7B20    dd          000A7B57
 000A7B20    dd          000A7B5B
 000A7B20    dd          000A7B60
 000A7B20    dd          000A7B65
 000A7B20    dd          000A7B6A
 000A7B57    not         al
>000A7B59    jmp         000A7B7B
 000A7B5B    and         al,byte ptr [ebp-6]
>000A7B5E    jmp         000A7B7B
 000A7B60    or          al,byte ptr [ebp-6]
>000A7B63    jmp         000A7B7B
 000A7B65    xor         al,byte ptr [ebp-6]
>000A7B68    jmp         000A7B7B
 000A7B6A    mov         cl,byte ptr [ebp-6]
 000A7B6D    shl         al,cl
>000A7B6F    jmp         000A7B7B
 000A7B71    mov         cl,byte ptr [ebp-6]
 000A7B74    and         eax,0FF
 000A7B79    shr         eax,cl
 000A7B7B    mov         edx,eax
 000A7B7D    mov         eax,dword ptr [ebp-4]
 000A7B80    mov         eax,dword ptr [eax+384]
 000A7B86    call        000981B8
 000A7B8B    mov         eax,dword ptr [ebp-4]
 000A7B8E    inc         dword ptr [eax+384]
 000A7B94    inc         esi
 000A7B95    dec         ebx
>000A7B96    jne         000A7AE6
 000A7B9C    mov         eax,[000B5778];^gvar_000B6BA5
 000A7BA1    mov         byte ptr [eax],1
 000A7BA4    mov         eax,dword ptr [ebp-4]
 000A7BA7    mov         eax,dword ptr [eax+384]
 000A7BAD    mov         edx,dword ptr ds:[0B5BA0];^gvar_000B6BAC:Single
 000A7BB3    cmp         eax,dword ptr [edx]
>000A7BB5    jle         000A7BC7
 000A7BB7    mov         eax,[000B5BA0];^gvar_000B6BAC:Single
 000A7BBC    mov         eax,dword ptr [eax]
 000A7BBE    mov         edx,dword ptr [ebp-4]
 000A7BC1    mov         dword ptr [edx+384],eax
 000A7BC7    xor         eax,eax
 000A7BC9    pop         edx
 000A7BCA    pop         ecx
 000A7BCB    pop         ecx
 000A7BCC    mov         dword ptr fs:[eax],edx
 000A7BCF    push        0A7BF7
 000A7BD4    cmp         byte ptr [ebp-7],0
>000A7BD8    je          000A7BEA
 000A7BDA    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000A7BDF    mov         eax,dword ptr [eax]
 000A7BE1    mov         al,byte ptr [eax+2DC]
 000A7BE7    mov         byte ptr [ebp-8],al
 000A7BEA    call        000986F4
 000A7BEF    ret
>000A7BF0    jmp         @HandleFinally
>000A7BF5    jmp         000A7BD4
 000A7BF7    cmp         byte ptr [ebp-8],0
>000A7BFB    je          000A7C15
 000A7BFD    lea         edx,[ebp-0C]
 000A7C00    mov         eax,84D
 000A7C05    call        LoadStr;'User abort!'
 000A7C0A    mov         edx,dword ptr [ebp-0C]
 000A7C0D    mov         eax,dword ptr [ebp-4]
 000A7C10    call        000A6D44
 000A7C15    xor         eax,eax
 000A7C17    pop         edx
 000A7C18    pop         ecx
 000A7C19    pop         ecx
 000A7C1A    mov         dword ptr fs:[eax],edx
 000A7C1D    push        0A7C3F
 000A7C22    lea         eax,[ebp-24]
 000A7C25    call        @LStrClr
 000A7C2A    lea         eax,[ebp-10]
 000A7C2D    mov         edx,2
 000A7C32    call        @LStrArrayClr
 000A7C37    ret
>000A7C38    jmp         @HandleFinally
>000A7C3D    jmp         000A7C22
 000A7C3F    pop         esi
 000A7C40    pop         ebx
 000A7C41    mov         esp,ebp
 000A7C43    pop         ebp
 000A7C44    ret         8
end;*}

//000A7C54
{*procedure sub_000A7C54(?:TFormScript; ?:String; ?:?);
begin
 000A7C54    push        ebp
 000A7C55    mov         ebp,esp
 000A7C57    add         esp,0FFFFFFDC
 000A7C5A    push        ebx
 000A7C5B    push        esi
 000A7C5C    push        edi
 000A7C5D    xor         ebx,ebx
 000A7C5F    mov         dword ptr [ebp-0C],ebx
 000A7C62    mov         dword ptr [ebp-20],ebx
 000A7C65    mov         dword ptr [ebp-24],ebx
 000A7C68    mov         dword ptr [ebp-4],ecx
 000A7C6B    mov         ebx,edx
 000A7C6D    xor         eax,eax
 000A7C6F    push        ebp
 000A7C70    push        0A7DFC
 000A7C75    push        dword ptr fs:[eax]
 000A7C78    mov         dword ptr fs:[eax],esp
 000A7C7B    mov         eax,dword ptr [ebp-4]
 000A7C7E    mov         edx,ebx
 000A7C80    call        @LStrLAsg
 000A7C85    mov         edx,dword ptr [ebp-4]
 000A7C88    mov         edx,dword ptr [edx]
 000A7C8A    mov         eax,0A7E14;'%'
 000A7C8F    call        @LStrPos
 000A7C94    mov         dword ptr [ebp-8],eax
 000A7C97    cmp         dword ptr [ebp-8],0
>000A7C9B    je          000A7DD9
 000A7CA1    xor         eax,eax
 000A7CA3    push        ebp
 000A7CA4    push        0A7CDA
 000A7CA9    push        dword ptr fs:[eax]
 000A7CAC    mov         dword ptr fs:[eax],esp
 000A7CAF    lea         eax,[ebp-0C]
 000A7CB2    push        eax
 000A7CB3    mov         edx,dword ptr [ebp-8]
 000A7CB6    inc         edx
 000A7CB7    mov         eax,dword ptr [ebp-4]
 000A7CBA    mov         eax,dword ptr [eax]
 000A7CBC    mov         ecx,1
 000A7CC1    call        @LStrCopy
 000A7CC6    mov         eax,dword ptr [ebp-0C]
 000A7CC9    call        StrToInt
 000A7CCE    mov         ebx,eax
 000A7CD0    xor         eax,eax
 000A7CD2    pop         edx
 000A7CD3    pop         ecx
 000A7CD4    pop         ecx
 000A7CD5    mov         dword ptr fs:[eax],edx
>000A7CD8    jmp         000A7D37
>000A7CDA    jmp         @HandleAnyException
 000A7CDF    lea         eax,[ebp-0C]
 000A7CE2    push        eax
 000A7CE3    mov         byte ptr [ebp-1C],25
 000A7CE7    mov         byte ptr [ebp-18],2
 000A7CEB    lea         eax,[ebp-20]
 000A7CEE    push        eax
 000A7CEF    mov         edx,dword ptr [ebp-8]
 000A7CF2    inc         edx
 000A7CF3    mov         eax,dword ptr [ebp-4]
 000A7CF6    mov         eax,dword ptr [eax]
 000A7CF8    mov         ecx,1
 000A7CFD    call        @LStrCopy
 000A7D02    mov         eax,dword ptr [ebp-20]
 000A7D05    mov         dword ptr [ebp-14],eax
 000A7D08    mov         byte ptr [ebp-10],0B
 000A7D0C    lea         edx,[ebp-1C]
 000A7D0F    mov         ecx,1
 000A7D14    mov         eax,84F
 000A7D19    call        FmtLoadStr;'Invalid parameter %s%s'
 000A7D1E    mov         ecx,dword ptr [ebp-0C]
 000A7D21    mov         dl,1
 000A7D23    mov         eax,[000176E8];Exception
 000A7D28    call        Exception.Create;Exception.Create
 000A7D2D    call        @RaiseExcept
 000A7D32    call        @DoneExcept
 000A7D37    lea         edx,[ebp-0C]
 000A7D3A    lea         esi,[ebx+2]
 000A7D3D    mov         eax,esi
 000A7D3F    call        ParamStr
 000A7D44    cmp         dword ptr [ebp-0C],0
>000A7D48    jne         000A7D85
 000A7D4A    lea         eax,[ebp-0C]
 000A7D4D    push        eax
 000A7D4E    mov         byte ptr [ebp-1C],25
 000A7D52    mov         byte ptr [ebp-18],2
 000A7D56    mov         dword ptr [ebp-14],ebx
 000A7D59    mov         byte ptr [ebp-10],0
 000A7D5D    lea         edx,[ebp-1C]
 000A7D60    mov         ecx,1
 000A7D65    mov         eax,850
 000A7D6A    call        FmtLoadStr;'Missing run-time parameter for %s%d'
 000A7D6F    mov         ecx,dword ptr [ebp-0C]
 000A7D72    mov         dl,1
 000A7D74    mov         eax,[000176E8];Exception
 000A7D79    call        Exception.Create;Exception.Create
 000A7D7E    call        @RaiseExcept
>000A7D83    jmp         000A7DCF
 000A7D85    lea         eax,[ebp-0C]
 000A7D88    push        eax
 000A7D89    mov         ecx,dword ptr [ebp-8]
 000A7D8C    dec         ecx
 000A7D8D    mov         eax,dword ptr [ebp-4]
 000A7D90    mov         eax,dword ptr [eax]
 000A7D92    mov         edx,1
 000A7D97    call        @LStrCopy
 000A7D9C    push        dword ptr [ebp-0C]
 000A7D9F    lea         edx,[ebp-20]
 000A7DA2    mov         eax,esi
 000A7DA4    call        ParamStr
 000A7DA9    push        dword ptr [ebp-20]
 000A7DAC    lea         ecx,[ebp-24]
 000A7DAF    mov         edx,dword ptr [ebp-8]
 000A7DB2    add         edx,2
 000A7DB5    mov         eax,dword ptr [ebp-4]
 000A7DB8    mov         eax,dword ptr [eax]
 000A7DBA    call        00075190
 000A7DBF    push        dword ptr [ebp-24]
 000A7DC2    mov         eax,dword ptr [ebp-4]
 000A7DC5    mov         edx,3
 000A7DCA    call        @LStrCatN
 000A7DCF    cmp         dword ptr [ebp-8],0
>000A7DD3    jne         000A7C85
 000A7DD9    xor         eax,eax
 000A7DDB    pop         edx
 000A7DDC    pop         ecx
 000A7DDD    pop         ecx
 000A7DDE    mov         dword ptr fs:[eax],edx
 000A7DE1    push        0A7E03
 000A7DE6    lea         eax,[ebp-24]
 000A7DE9    mov         edx,2
 000A7DEE    call        @LStrArrayClr
 000A7DF3    lea         eax,[ebp-0C]
 000A7DF6    call        @LStrClr
 000A7DFB    ret
>000A7DFC    jmp         @HandleFinally
>000A7E01    jmp         000A7DE6
 000A7E03    pop         edi
 000A7E04    pop         esi
 000A7E05    pop         ebx
 000A7E06    mov         esp,ebp
 000A7E08    pop         ebp
 000A7E09    ret
end;*}

//000A7E18
{*function sub_000A7E18(?:?):?;
begin
 000A7E18    push        ebp
 000A7E19    mov         ebp,esp
 000A7E1B    mov         eax,dword ptr [ebp+8]
 000A7E1E    mov         eax,dword ptr [eax-4]
 000A7E21    cmp         byte ptr [eax+388],0
>000A7E28    je          000A7E48
 000A7E2A    mov         eax,dword ptr [ebp+8]
 000A7E2D    mov         eax,dword ptr [eax-4]
 000A7E30    mov         edx,dword ptr [eax+390]
 000A7E36    mov         eax,0A7E54;'%'
 000A7E3B    call        @LStrPos
 000A7E40    test        eax,eax
>000A7E42    jle         000A7E48
 000A7E44    mov         al,1
 000A7E46    pop         ebp
 000A7E47    ret
 000A7E48    xor         eax,eax
 000A7E4A    pop         ebp
 000A7E4B    ret
end;*}

//000A7E58
{*function sub_000A7E58(?:TFormScript; ?:TStrings; ?:?):?;
begin
 000A7E58    push        ebp
 000A7E59    mov         ebp,esp
 000A7E5B    push        ecx
 000A7E5C    mov         ecx,10
 000A7E61    push        0
 000A7E63    push        0
 000A7E65    dec         ecx
>000A7E66    jne         000A7E61
 000A7E68    push        ecx
 000A7E69    xchg        ecx,dword ptr [ebp-4]
 000A7E6C    push        ebx
 000A7E6D    push        esi
 000A7E6E    push        edi
 000A7E6F    mov         dword ptr [ebp-8],ecx
 000A7E72    mov         esi,edx
 000A7E74    mov         dword ptr [ebp-4],eax
 000A7E77    xor         eax,eax
 000A7E79    push        ebp
 000A7E7A    push        0A9582
 000A7E7F    push        dword ptr fs:[eax]
 000A7E82    mov         dword ptr fs:[eax],esp
 000A7E85    mov         byte ptr [ebp-9],1
 000A7E89    mov         byte ptr [ebp-0A],0
 000A7E8D    mov         byte ptr [ebp-0B],0
 000A7E91    mov         eax,dword ptr [ebp-4]
 000A7E94    mov         dword ptr [eax+384],1;TFormScript.?f384:dword
 000A7E9E    mov         dl,1
 000A7EA0    mov         eax,[0001F340];TStringList
 000A7EA5    call        TObject.Create;TStringList.Create
 000A7EAA    mov         dword ptr [ebp-10],eax
 000A7EAD    mov         eax,[000B5BDC];^Screen:TScreen
 000A7EB2    mov         eax,dword ptr [eax]
 000A7EB4    mov         dx,0FFF5
 000A7EB8    call        TScreen.SetCursor
 000A7EBD    xor         edx,edx
 000A7EBF    push        ebp
 000A7EC0    push        0A951E
 000A7EC5    push        dword ptr fs:[edx]
 000A7EC8    mov         dword ptr fs:[edx],esp
 000A7ECB    mov         eax,esi
 000A7ECD    mov         edx,dword ptr [eax]
 000A7ECF    call        dword ptr [edx+14];TStrings.GetCount
 000A7ED2    dec         eax
 000A7ED3    test        eax,eax
>000A7ED5    jl          000A94D4
 000A7EDB    inc         eax
 000A7EDC    mov         dword ptr [ebp-64],eax
 000A7EDF    mov         dword ptr [ebp-14],0
 000A7EE6    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000A7EEB    mov         eax,dword ptr [eax]
 000A7EED    cmp         byte ptr [eax+2DC],0
>000A7EF4    je          000A7F04
 000A7EF6    mov         byte ptr [ebp-9],0
 000A7EFA    call        @TryFinallyExit
>000A7EFF    jmp         000A9525
 000A7F04    mov         eax,dword ptr [ebp-4]
 000A7F07    cmp         byte ptr [eax+388],0;TFormScript.?f388:byte
>000A7F0E    je          000A7F23
 000A7F10    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000A7F15    mov         eax,dword ptr [eax]
 000A7F17    mov         edx,0A959C;'Script Syntax Check'
 000A7F1C    call        0008E140
>000A7F21    jmp         000A7F34
 000A7F23    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000A7F28    mov         eax,dword ptr [eax]
 000A7F2A    mov         edx,0A95B8;'Script Execution'
 000A7F2F    call        0008E140
 000A7F34    lea         eax,[ebp-68]
 000A7F37    push        eax
 000A7F38    mov         ebx,dword ptr [ebp-14]
 000A7F3B    inc         ebx
 000A7F3C    mov         dword ptr [ebp-78],ebx
 000A7F3F    mov         byte ptr [ebp-74],0
 000A7F43    mov         eax,esi
 000A7F45    mov         edx,dword ptr [eax]
 000A7F47    call        dword ptr [edx+14];TStrings.GetCount
 000A7F4A    mov         dword ptr [ebp-70],eax
 000A7F4D    mov         byte ptr [ebp-6C],0
 000A7F51    lea         edx,[ebp-78]
 000A7F54    mov         ecx,1
 000A7F59    mov         eax,0A95D4;'Line %d of %d'
 000A7F5E    call        Format
 000A7F63    mov         edx,dword ptr [ebp-68]
 000A7F66    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000A7F6B    mov         eax,dword ptr [eax]
 000A7F6D    mov         ecx,1
 000A7F72    call        0008E154
 000A7F77    push        1
 000A7F79    mov         eax,esi
 000A7F7B    mov         edx,dword ptr [eax]
 000A7F7D    call        dword ptr [edx+14];TStrings.GetCount
 000A7F80    mov         ecx,eax
 000A7F82    mov         edx,ebx
 000A7F84    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000A7F89    mov         eax,dword ptr [eax]
 000A7F8B    call        0008E1A4
 000A7F90    lea         ecx,[ebp-7C]
 000A7F93    mov         edx,dword ptr [ebp-14]
 000A7F96    mov         eax,esi
 000A7F98    mov         ebx,dword ptr [eax]
 000A7F9A    call        dword ptr [ebx+0C];TStrings.Get
 000A7F9D    mov         eax,dword ptr [ebp-7C]
 000A7FA0    lea         edx,[ebp-68]
 000A7FA3    call        Trim
 000A7FA8    mov         edx,dword ptr [ebp-68]
 000A7FAB    mov         eax,dword ptr [ebp-4]
 000A7FAE    add         eax,38C;TFormScript.?f38C:String
 000A7FB3    call        @LStrAsg
 000A7FB8    mov         eax,dword ptr [ebp-4]
 000A7FBB    cmp         dword ptr [eax+38C],0;TFormScript.?f38C:String
>000A7FC2    je          000A94C8
 000A7FC8    mov         eax,dword ptr [ebp-4]
 000A7FCB    mov         edx,dword ptr [eax+38C];TFormScript.?f38C:String
 000A7FD1    mov         eax,0A95EC;' '
 000A7FD6    call        @LStrPos
 000A7FDB    mov         ebx,eax
 000A7FDD    test        ebx,ebx
>000A7FDF    jne         000A8011
 000A7FE1    lea         eax,[ebp-44]
 000A7FE4    mov         edx,dword ptr [ebp-4]
 000A7FE7    mov         edx,dword ptr [edx+38C];TFormScript.?f38C:String
 000A7FED    call        @LStrLAsg
 000A7FF2    mov         eax,dword ptr [ebp-4]
 000A7FF5    add         eax,390;TFormScript.?f390:String
 000A7FFA    call        @LStrClr
 000A7FFF    mov         eax,dword ptr [ebp-4]
 000A8002    add         eax,394;TFormScript.?f394:String
 000A8007    call        @LStrClr
>000A800C    jmp         000A80BB
 000A8011    lea         eax,[ebp-44]
 000A8014    push        eax
 000A8015    mov         ecx,ebx
 000A8017    dec         ecx
 000A8018    mov         eax,dword ptr [ebp-4]
 000A801B    mov         eax,dword ptr [eax+38C];TFormScript.?f38C:String
 000A8021    mov         edx,1
 000A8026    call        @LStrCopy
 000A802B    lea         ecx,[ebp-7C]
 000A802E    lea         edx,[ebx+1]
 000A8031    mov         eax,dword ptr [ebp-4]
 000A8034    mov         eax,dword ptr [eax+38C];TFormScript.?f38C:String
 000A803A    call        00075190
 000A803F    mov         eax,dword ptr [ebp-7C]
 000A8042    lea         edx,[ebp-68]
 000A8045    call        Trim
 000A804A    mov         edx,dword ptr [ebp-68]
 000A804D    mov         eax,dword ptr [ebp-4]
 000A8050    add         eax,390;TFormScript.?f390:String
 000A8055    call        @LStrAsg
 000A805A    lea         ecx,[ebp-7C]
 000A805D    mov         edx,dword ptr [ebp-14]
 000A8060    mov         eax,esi
 000A8062    mov         ebx,dword ptr [eax]
 000A8064    call        dword ptr [ebx+0C];TStrings.Get
 000A8067    mov         eax,dword ptr [ebp-7C]
 000A806A    lea         edx,[ebp-68]
 000A806D    call        TrimLeft
 000A8072    mov         edx,dword ptr [ebp-68]
 000A8075    mov         eax,dword ptr [ebp-4]
 000A8078    add         eax,394;TFormScript.?f394:String
 000A807D    call        @LStrAsg
 000A8082    mov         eax,dword ptr [ebp-4]
 000A8085    mov         edx,dword ptr [eax+394];TFormScript.?f394:String
 000A808B    mov         eax,0A95EC;' '
 000A8090    call        @LStrPos
 000A8095    mov         ebx,eax
 000A8097    lea         ecx,[ebp-68]
 000A809A    lea         edx,[ebx+1]
 000A809D    mov         eax,dword ptr [ebp-4]
 000A80A0    mov         eax,dword ptr [eax+394];TFormScript.?f394:String
 000A80A6    call        00075190
 000A80AB    mov         edx,dword ptr [ebp-68]
 000A80AE    mov         eax,dword ptr [ebp-4]
 000A80B1    add         eax,394;TFormScript.?f394:String
 000A80B6    call        @LStrAsg
 000A80BB    lea         edx,[ebp-48]
 000A80BE    mov         eax,dword ptr [ebp-44]
 000A80C1    call        UpperCase
 000A80C6    mov         edx,dword ptr [ebp-44]
 000A80C9    mov         eax,0A95F8;';'
 000A80CE    call        @LStrPos
 000A80D3    dec         eax
>000A80D4    je          000A94C8
 000A80DA    lea         edx,[ebp-68]
 000A80DD    mov         eax,dword ptr [ebp-44]
 000A80E0    call        UpperCase
 000A80E5    mov         eax,dword ptr [ebp-68]
 000A80E8    mov         edx,0A9604;'REM'
 000A80ED    call        @LStrCmp
>000A80F2    je          000A94C8
 000A80F8    mov         eax,dword ptr [ebp-4]
 000A80FB    cmp         byte ptr [eax+388],0;TFormScript.?f388:byte
>000A8102    jne         000A814C
 000A8104    lea         ecx,[ebp-68]
 000A8107    mov         eax,dword ptr [ebp-4]
 000A810A    mov         edx,dword ptr [eax+390];TFormScript.?f390:String
 000A8110    mov         eax,dword ptr [ebp-4]
 000A8113    call        000A7C54
 000A8118    mov         edx,dword ptr [ebp-68]
 000A811B    mov         eax,dword ptr [ebp-4]
 000A811E    add         eax,390;TFormScript.?f390:String
 000A8123    call        @LStrAsg
 000A8128    lea         ecx,[ebp-68]
 000A812B    mov         eax,dword ptr [ebp-4]
 000A812E    mov         edx,dword ptr [eax+394];TFormScript.?f394:String
 000A8134    mov         eax,dword ptr [ebp-4]
 000A8137    call        000A7C54
 000A813C    mov         edx,dword ptr [ebp-68]
 000A813F    mov         eax,dword ptr [ebp-4]
 000A8142    add         eax,394;TFormScript.?f394:String
 000A8147    call        @LStrAsg
 000A814C    mov         eax,dword ptr [ebp-48]
 000A814F    mov         edx,0A9610;'EXIT'
 000A8154    call        @LStrCmp
>000A8159    jne         000A8170
 000A815B    mov         eax,dword ptr [ebp-4]
 000A815E    cmp         byte ptr [eax+388],0;TFormScript.?f388:byte
>000A8165    je          000A94D4
>000A816B    jmp         000A94C8
 000A8170    mov         eax,dword ptr [ebp-48]
 000A8173    mov         edx,0A9620;'MSG'
 000A8178    call        @LStrCmp
>000A817D    jne         000A8359
 000A8183    mov         eax,dword ptr [ebp-4]
 000A8186    cmp         byte ptr [eax+388],0;TFormScript.?f388:byte
>000A818D    jne         000A94C8
 000A8193    mov         eax,[000B5A1C];^gvar_000B7009
 000A8198    cmp         byte ptr [eax],0
>000A819B    jne         000A94C8
 000A81A1    push        0A962C;#13+#10
 000A81A6    lea         eax,[ebp-68]
 000A81A9    push        eax
 000A81AA    mov         eax,dword ptr [ebp-4]
 000A81AD    mov         eax,dword ptr [eax+390];TFormScript.?f390:String
 000A81B3    xor         ecx,ecx
 000A81B5    mov         edx,0A9638;'\n'
 000A81BA    call        00075424
 000A81BF    mov         edx,dword ptr [ebp-68]
 000A81C2    mov         eax,dword ptr [ebp-4]
 000A81C5    add         eax,390;TFormScript.?f390:String
 000A81CA    call        @LStrAsg
 000A81CF    lea         eax,[ebp-54]
 000A81D2    push        eax
 000A81D3    lea         eax,[ebp-58]
 000A81D6    push        eax
 000A81D7    lea         eax,[ebp-5C]
 000A81DA    push        eax
 000A81DB    lea         eax,[ebp-60]
 000A81DE    push        eax
 000A81DF    lea         ecx,[ebp-50]
 000A81E2    lea         edx,[ebp-4C]
 000A81E5    mov         eax,dword ptr [ebp-4]
 000A81E8    mov         eax,dword ptr [eax+384];TFormScript.?f384:dword
 000A81EE    call        0009B560
 000A81F3    mov         eax,dword ptr [ebp-4]
 000A81F6    mov         eax,dword ptr [eax+384];TFormScript.?f384:dword
 000A81FC    call        000981AC
 000A8201    and         eax,0FF
 000A8206    lea         edx,[ebp-7C]
 000A8209    call        IntToStr
 000A820E    mov         eax,dword ptr [ebp-7C]
 000A8211    push        eax
 000A8212    lea         eax,[ebp-68]
 000A8215    push        eax
 000A8216    mov         eax,dword ptr [ebp-4]
 000A8219    mov         eax,dword ptr [eax+390];TFormScript.?f390:String
 000A821F    xor         ecx,ecx
 000A8221    mov         edx,0A9644;'$BYTE'
 000A8226    call        00075424
 000A822B    mov         edx,dword ptr [ebp-68]
 000A822E    mov         eax,dword ptr [ebp-4]
 000A8231    add         eax,390;TFormScript.?f390:String
 000A8236    call        @LStrAsg
 000A823B    mov         eax,dword ptr [ebp-50]
 000A823E    push        eax
 000A823F    lea         eax,[ebp-68]
 000A8242    push        eax
 000A8243    mov         eax,dword ptr [ebp-4]
 000A8246    mov         eax,dword ptr [eax+390];TFormScript.?f390:String
 000A824C    xor         ecx,ecx
 000A824E    mov         edx,0A9654;'$WORD'
 000A8253    call        00075424
 000A8258    mov         edx,dword ptr [ebp-68]
 000A825B    mov         eax,dword ptr [ebp-4]
 000A825E    add         eax,390;TFormScript.?f390:String
 000A8263    call        @LStrAsg
 000A8268    mov         eax,dword ptr [ebp-54]
 000A826B    push        eax
 000A826C    lea         eax,[ebp-68]
 000A826F    push        eax
 000A8270    mov         eax,dword ptr [ebp-4]
 000A8273    mov         eax,dword ptr [eax+390];TFormScript.?f390:String
 000A8279    xor         ecx,ecx
 000A827B    mov         edx,0A9664;'$INT'
 000A8280    call        00075424
 000A8285    mov         edx,dword ptr [ebp-68]
 000A8288    mov         eax,dword ptr [ebp-4]
 000A828B    add         eax,390;TFormScript.?f390:String
 000A8290    call        @LStrAsg
 000A8295    mov         eax,dword ptr [ebp-58]
 000A8298    push        eax
 000A8299    lea         eax,[ebp-68]
 000A829C    push        eax
 000A829D    mov         eax,dword ptr [ebp-4]
 000A82A0    mov         eax,dword ptr [eax+390];TFormScript.?f390:String
 000A82A6    xor         ecx,ecx
 000A82A8    mov         edx,0A9674;'$LONG'
 000A82AD    call        00075424
 000A82B2    mov         edx,dword ptr [ebp-68]
 000A82B5    mov         eax,dword ptr [ebp-4]
 000A82B8    add         eax,390;TFormScript.?f390:String
 000A82BD    call        @LStrAsg
 000A82C2    mov         eax,dword ptr [ebp-5C]
 000A82C5    push        eax
 000A82C6    lea         eax,[ebp-68]
 000A82C9    push        eax
 000A82CA    mov         eax,dword ptr [ebp-4]
 000A82CD    mov         eax,dword ptr [eax+390];TFormScript.?f390:String
 000A82D3    xor         ecx,ecx
 000A82D5    mov         edx,0A9684;'$IEEE32'
 000A82DA    call        00075424
 000A82DF    mov         edx,dword ptr [ebp-68]
 000A82E2    mov         eax,dword ptr [ebp-4]
 000A82E5    add         eax,390;TFormScript.?f390:String
 000A82EA    call        @LStrAsg
 000A82EF    mov         eax,dword ptr [ebp-60]
 000A82F2    push        eax
 000A82F3    lea         eax,[ebp-68]
 000A82F6    push        eax
 000A82F7    mov         eax,dword ptr [ebp-4]
 000A82FA    mov         eax,dword ptr [eax+390];TFormScript.?f390:String
 000A8300    xor         ecx,ecx
 000A8302    mov         edx,0A9694;'$IEEE64'
 000A8307    call        00075424
 000A830C    mov         edx,dword ptr [ebp-68]
 000A830F    mov         eax,dword ptr [ebp-4]
 000A8312    add         eax,390;TFormScript.?f390:String
 000A8317    call        @LStrAsg
 000A831C    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000A8321    mov         eax,dword ptr [eax]
 000A8323    call        TCustomForm.Hide
 000A8328    lea         edx,[ebp-68]
 000A832B    mov         eax,856
 000A8330    call        LoadStr;'Information'
 000A8335    mov         eax,dword ptr [ebp-68]
 000A8338    mov         edx,dword ptr [ebp-4]
 000A833B    mov         edx,dword ptr [edx+390];TFormScript.?f390:String
 000A8341    xor         ecx,ecx
 000A8343    call        0008D880
 000A8348    mov         eax,[000B5A9C];^gvar_000B6D00:TProgressBox
 000A834D    mov         eax,dword ptr [eax]
 000A834F    call        TCustomForm.Show
>000A8354    jmp         000A94C8
 000A8359    mov         eax,dword ptr [ebp-48]
 000A835C    mov         edx,0A96A4;'BITNOT'
 000A8361    call        @LStrCmp
>000A8366    jne         000A83D4
 000A8368    mov         eax,dword ptr [ebp-14]
 000A836B    push        eax
 000A836C    push        0A96B4;'1'
 000A8371    lea         eax,[ebp-68]
 000A8374    push        eax
 000A8375    mov         eax,dword ptr [ebp-4]
 000A8378    mov         eax,dword ptr [eax+390];TFormScript.?f390:String
 000A837E    mov         dword ptr [ebp-84],eax
 000A8384    mov         byte ptr [ebp-80],0B
 000A8388    lea         edx,[ebp-84]
 000A838E    xor         ecx,ecx
 000A8390    mov         eax,83C
 000A8395    call        FmtLoadStr;'Invalid byte count: %s'
 000A839A    mov         ecx,dword ptr [ebp-68]
 000A839D    mov         eax,dword ptr [ebp-4]
 000A83A0    mov         edx,dword ptr [eax+390];TFormScript.?f390:String
 000A83A6    mov         eax,dword ptr [ebp-4]
 000A83A9    call        000A6E0C
 000A83AE    mov         edx,dword ptr [ebp-4]
 000A83B1    cmp         byte ptr [edx+388],0;TFormScript.?f388:byte
>000A83B8    jne         000A94C8
 000A83BE    push        eax
 000A83BF    mov         eax,dword ptr [ebp-14]
 000A83C2    push        eax
 000A83C3    xor         ecx,ecx
 000A83C5    mov         dl,4E
 000A83C7    mov         eax,dword ptr [ebp-4]
 000A83CA    call        000A79B8
>000A83CF    jmp         000A94C8
 000A83D4    mov         eax,dword ptr [ebp-48]
 000A83D7    mov         edx,0A96C0;'BITAND'
 000A83DC    call        @LStrCmp
>000A83E1    je          000A8405
 000A83E3    mov         eax,dword ptr [ebp-48]
 000A83E6    mov         edx,0A96D0;'BITOR'
 000A83EB    call        @LStrCmp
>000A83F0    je          000A8405
 000A83F2    mov         eax,dword ptr [ebp-48]
 000A83F5    mov         edx,0A96E0;'BITXOR'
 000A83FA    call        @LStrCmp
>000A83FF    jne         000A857F
 000A8405    push        ebp
 000A8406    call        000A7E18
 000A840B    pop         ecx
 000A840C    test        al,al
>000A840E    jne         000A94C8
 000A8414    lea         eax,[ebp-20]
 000A8417    push        eax
 000A8418    lea         ecx,[ebp-1C]
 000A841B    mov         eax,dword ptr [ebp-4]
 000A841E    mov         eax,dword ptr [eax+390];TFormScript.?f390:String
 000A8424    mov         edx,0A95EC;' '
 000A8429    call        0007414C
 000A842E    lea         eax,[ebp-7C]
 000A8431    push        eax
 000A8432    mov         eax,dword ptr [ebp-4]
 000A8435    mov         eax,dword ptr [eax+390];TFormScript.?f390:String
 000A843B    mov         dword ptr [ebp-84],eax
 000A8441    mov         byte ptr [ebp-80],0B
 000A8445    lea         edx,[ebp-84]
 000A844B    xor         ecx,ecx
 000A844D    mov         eax,83D
 000A8452    call        FmtLoadStr;'Invalid Hex String:
%s'
 000A8457    mov         eax,dword ptr [ebp-7C]
 000A845A    push        eax
 000A845B    push        1
 000A845D    mov         eax,dword ptr [ebp-14]
 000A8460    push        eax
 000A8461    push        0
 000A8463    lea         eax,[ebp-68]
 000A8466    push        eax
 000A8467    lea         ecx,[ebp-18]
 000A846A    mov         edx,dword ptr [ebp-1C]
 000A846D    mov         eax,dword ptr [ebp-4]
 000A8470    call        000A6F34
 000A8475    mov         edx,dword ptr [ebp-68]
 000A8478    lea         eax,[ebp-1C]
 000A847B    call        @LStrLAsg
 000A8480    cmp         dword ptr [ebp-18],1
>000A8484    je          000A8512
 000A848A    lea         eax,[ebp-7C]
 000A848D    push        eax
 000A848E    mov         eax,dword ptr [ebp-14]
 000A8491    inc         eax
 000A8492    mov         dword ptr [ebp-78],eax
 000A8495    mov         byte ptr [ebp-74],0
 000A8499    mov         eax,dword ptr [ebp-4]
 000A849C    mov         eax,dword ptr [eax+38C];TFormScript.?f38C:String
 000A84A2    mov         dword ptr [ebp-70],eax
 000A84A5    mov         byte ptr [ebp-6C],0B
 000A84A9    lea         edx,[ebp-78]
 000A84AC    mov         ecx,1
 000A84B1    mov         eax,83A
 000A84B6    call        FmtLoadStr;'Error in line number %d:
%s'
 000A84BB    push        dword ptr [ebp-7C]
 000A84BE    push        0A962C;#13+#10
 000A84C3    push        0A962C;#13+#10
 000A84C8    lea         eax,[ebp-88]
 000A84CE    push        eax
 000A84CF    mov         eax,dword ptr [ebp-4]
 000A84D2    mov         eax,dword ptr [eax+390];TFormScript.?f390:String
 000A84D8    mov         dword ptr [ebp-84],eax
 000A84DE    mov         byte ptr [ebp-80],0B
 000A84E2    lea         edx,[ebp-84]
 000A84E8    xor         ecx,ecx
 000A84EA    mov         eax,859
 000A84EF    call        FmtLoadStr;'Not a hex byte: %s'
 000A84F4    push        dword ptr [ebp-88]
 000A84FA    lea         eax,[ebp-68]
 000A84FD    mov         edx,4
 000A8502    call        @LStrCatN
 000A8507    mov         edx,dword ptr [ebp-68]
 000A850A    mov         eax,dword ptr [ebp-4]
 000A850D    call        000A6D44
 000A8512    mov         eax,dword ptr [ebp-14]
 000A8515    push        eax
 000A8516    push        0A96B4;'1'
 000A851B    lea         eax,[ebp-68]
 000A851E    push        eax
 000A851F    mov         eax,dword ptr [ebp-4]
 000A8522    mov         eax,dword ptr [eax+390];TFormScript.?f390:String
 000A8528    mov         dword ptr [ebp-84],eax
 000A852E    mov         byte ptr [ebp-80],0B
 000A8532    lea         edx,[ebp-84]
 000A8538    xor         ecx,ecx
 000A853A    mov         eax,83C
 000A853F    call        FmtLoadStr;'Invalid byte count: %s'
 000A8544    mov         ecx,dword ptr [ebp-68]
 000A8547    mov         edx,dword ptr [ebp-20]
 000A854A    mov         eax,dword ptr [ebp-4]
 000A854D    call        000A6E0C
 000A8552    mov         edx,dword ptr [ebp-4]
 000A8555    cmp         byte ptr [edx+388],0;TFormScript.?f388:byte
>000A855C    jne         000A94C8
 000A8562    push        eax
 000A8563    mov         eax,dword ptr [ebp-14]
 000A8566    push        eax
 000A8567    mov         eax,dword ptr [ebp-1C]
 000A856A    mov         cl,byte ptr [eax]
 000A856C    mov         eax,dword ptr [ebp-48]
 000A856F    mov         dl,byte ptr [eax+3]
 000A8572    mov         eax,dword ptr [ebp-4]
 000A8575    call        000A79B8
>000A857A    jmp         000A94C8
 000A857F    mov         eax,dword ptr [ebp-48]
 000A8582    mov         edx,0A96F0;'BITSHL'
 000A8587    call        @LStrCmp
>000A858C    je          000A85A1
 000A858E    mov         eax,dword ptr [ebp-48]
 000A8591    mov         edx,0A9700;'BITSHR'
 000A8596    call        @LStrCmp
>000A859B    jne         000A8708
 000A85A1    push        ebp
 000A85A2    call        000A7E18
 000A85A7    pop         ecx
 000A85A8    test        al,al
>000A85AA    jne         000A94C8
 000A85B0    lea         eax,[ebp-20]
 000A85B3    push        eax
 000A85B4    lea         ecx,[ebp-1C]
 000A85B7    mov         eax,dword ptr [ebp-4]
 000A85BA    mov         eax,dword ptr [eax+390];TFormScript.?f390:String
 000A85C0    mov         edx,0A95EC;' '
 000A85C5    call        0007414C
 000A85CA    mov         eax,dword ptr [ebp-14]
 000A85CD    push        eax
 000A85CE    push        0
 000A85D0    lea         eax,[ebp-68]
 000A85D3    push        eax
 000A85D4    mov         eax,dword ptr [ebp-4]
 000A85D7    mov         eax,dword ptr [eax+390];TFormScript.?f390:String
 000A85DD    mov         dword ptr [ebp-84],eax
 000A85E3    mov         byte ptr [ebp-80],0B
 000A85E7    lea         edx,[ebp-84]
 000A85ED    xor         ecx,ecx
 000A85EF    mov         eax,85A
 000A85F4    call        FmtLoadStr;'Invalid byte count: %s
(must be between 0 and 8)'
 000A85F9    mov         ecx,dword ptr [ebp-68]
 000A85FC    mov         edx,dword ptr [ebp-1C]
 000A85FF    mov         eax,dword ptr [ebp-4]
 000A8602    call        000A6E0C
 000A8607    mov         ebx,eax
 000A8609    test        ebx,ebx
>000A860B    jl          000A8616
 000A860D    cmp         ebx,8
>000A8610    jle         000A869E
 000A8616    lea         eax,[ebp-7C]
 000A8619    push        eax
 000A861A    mov         eax,dword ptr [ebp-14]
 000A861D    inc         eax
 000A861E    mov         dword ptr [ebp-78],eax
 000A8621    mov         byte ptr [ebp-74],0
 000A8625    mov         eax,dword ptr [ebp-4]
 000A8628    mov         eax,dword ptr [eax+38C];TFormScript.?f38C:String
 000A862E    mov         dword ptr [ebp-70],eax
 000A8631    mov         byte ptr [ebp-6C],0B
 000A8635    lea         edx,[ebp-78]
 000A8638    mov         ecx,1
 000A863D    mov         eax,83A
 000A8642    call        FmtLoadStr;'Error in line number %d:
%s'
 000A8647    push        dword ptr [ebp-7C]
 000A864A    push        0A962C;#13+#10
 000A864F    push        0A962C;#13+#10
 000A8654    lea         eax,[ebp-88]
 000A865A    push        eax
 000A865B    mov         eax,dword ptr [ebp-4]
 000A865E    mov         eax,dword ptr [eax+390];TFormScript.?f390:String
 000A8664    mov         dword ptr [ebp-84],eax
 000A866A    mov         byte ptr [ebp-80],0B
 000A866E    lea         edx,[ebp-84]
 000A8674    xor         ecx,ecx
 000A8676    mov         eax,85A
 000A867B    call        FmtLoadStr;'Invalid byte count: %s
(must be between 0 and 8)'
 000A8680    push        dword ptr [ebp-88]
 000A8686    lea         eax,[ebp-68]
 000A8689    mov         edx,4
 000A868E    call        @LStrCatN
 000A8693    mov         edx,dword ptr [ebp-68]
 000A8696    mov         eax,dword ptr [ebp-4]
 000A8699    call        000A6D44
 000A869E    mov         eax,dword ptr [ebp-14]
 000A86A1    push        eax
 000A86A2    push        0A96B4;'1'
 000A86A7    lea         eax,[ebp-68]
 000A86AA    push        eax
 000A86AB    mov         eax,dword ptr [ebp-4]
 000A86AE    mov         eax,dword ptr [eax+390];TFormScript.?f390:String
 000A86B4    mov         dword ptr [ebp-84],eax
 000A86BA    mov         byte ptr [ebp-80],0B
 000A86BE    lea         edx,[ebp-84]
 000A86C4    xor         ecx,ecx
 000A86C6    mov         eax,83C
 000A86CB    call        FmtLoadStr;'Invalid byte count: %s'
 000A86D0    mov         ecx,dword ptr [ebp-68]
 000A86D3    mov         edx,dword ptr [ebp-20]
 000A86D6    mov         eax,dword ptr [ebp-4]
 000A86D9    call        000A6E0C
 000A86DE    mov         edx,dword ptr [ebp-4]
 000A86E1    cmp         byte ptr [edx+388],0;TFormScript.?f388:byte
>000A86E8    jne         000A94C8
 000A86EE    push        eax
 000A86EF    mov         eax,dword ptr [ebp-14]
 000A86F2    push        eax
 000A86F3    mov         ecx,ebx
 000A86F5    mov         eax,dword ptr [ebp-48]
 000A86F8    mov         dl,byte ptr [eax+5]
 000A86FB    mov         eax,dword ptr [ebp-4]
 000A86FE    call        000A79B8
>000A8703    jmp         000A94C8
 000A8708    mov         eax,dword ptr [ebp-48]
 000A870B    mov         edx,0A9710;'CHARCON'
 000A8710    call        @LStrCmp
>000A8715    jne         000A878D
 000A8717    mov         eax,dword ptr [ebp-4]
 000A871A    cmp         byte ptr [eax+388],0;TFormScript.?f388:byte
>000A8721    jne         000A94C8
 000A8727    call        0009B244
 000A872C    mov         eax,dword ptr [ebp-4]
 000A872F    mov         eax,dword ptr [eax+390];TFormScript.?f390:String
 000A8735    call        0009B070
 000A873A    test        al,al
>000A873C    jne         000A8777
 000A873E    lea         eax,[ebp-68]
 000A8741    push        eax
 000A8742    mov         eax,dword ptr [ebp-4]
 000A8745    mov         eax,dword ptr [eax+390];TFormScript.?f390:String
 000A874B    mov         dword ptr [ebp-84],eax
 000A8751    mov         byte ptr [ebp-80],0B
 000A8755    lea         edx,[ebp-84]
 000A875B    xor         ecx,ecx
 000A875D    mov         eax,852
 000A8762    call        FmtLoadStr;'Error reading character conversion table
%s'
 000A8767    mov         edx,dword ptr [ebp-68]
 000A876A    mov         eax,dword ptr [ebp-4]
 000A876D    call        000A6D44
>000A8772    jmp         000A94C8
 000A8777    lea         edx,[ebp-40]
 000A877A    mov         eax,dword ptr [ebp-4]
 000A877D    mov         eax,dword ptr [eax+384];TFormScript.?f384:dword
 000A8783    call        0009B42C
>000A8788    jmp         000A94C8
 000A878D    mov         eax,dword ptr [ebp-48]
 000A8790    mov         edx,0A9720;'JOKEROFF'
 000A8795    call        @LStrCmp
>000A879A    jne         000A87A5
 000A879C    mov         byte ptr [ebp-0A],0
>000A87A0    jmp         000A94C8
 000A87A5    mov         eax,dword ptr [ebp-48]
 000A87A8    mov         edx,0A9734;'JOKERON'
 000A87AD    call        @LStrCmp
>000A87B2    jne         000A88C1
 000A87B8    push        ebp
 000A87B9    call        000A7E18
 000A87BE    pop         ecx
 000A87BF    test        al,al
>000A87C1    jne         000A94C8
 000A87C7    lea         eax,[ebp-68]
 000A87CA    push        eax
 000A87CB    mov         eax,dword ptr [ebp-4]
 000A87CE    mov         eax,dword ptr [eax+390];TFormScript.?f390:String
 000A87D4    mov         dword ptr [ebp-84],eax
 000A87DA    mov         byte ptr [ebp-80],0B
 000A87DE    lea         edx,[ebp-84]
 000A87E4    xor         ecx,ecx
 000A87E6    mov         eax,83D
 000A87EB    call        FmtLoadStr;'Invalid Hex String:
%s'
 000A87F0    mov         eax,dword ptr [ebp-68]
 000A87F3    push        eax
 000A87F4    push        1
 000A87F6    mov         eax,dword ptr [ebp-14]
 000A87F9    push        eax
 000A87FA    push        0
 000A87FC    lea         eax,[ebp-1C]
 000A87FF    push        eax
 000A8800    lea         ecx,[ebp-18]
 000A8803    mov         eax,dword ptr [ebp-4]
 000A8806    mov         edx,dword ptr [eax+390];TFormScript.?f390:String
 000A880C    mov         eax,dword ptr [ebp-4]
 000A880F    call        000A6F34
 000A8814    cmp         dword ptr [ebp-18],1
>000A8818    je          000A88A0
 000A881E    lea         eax,[ebp-7C]
 000A8821    push        eax
 000A8822    mov         eax,dword ptr [ebp-14]
 000A8825    inc         eax
 000A8826    mov         dword ptr [ebp-78],eax
 000A8829    mov         byte ptr [ebp-74],0
 000A882D    mov         eax,dword ptr [ebp-4]
 000A8830    mov         eax,dword ptr [eax+38C];TFormScript.?f38C:String
 000A8836    mov         dword ptr [ebp-70],eax
 000A8839    mov         byte ptr [ebp-6C],0B
 000A883D    lea         edx,[ebp-78]
 000A8840    mov         ecx,1
 000A8845    mov         eax,83A
 000A884A    call        FmtLoadStr;'Error in line number %d:
%s'
 000A884F    push        dword ptr [ebp-7C]
 000A8852    push        0A962C;#13+#10
 000A8857    push        0A962C;#13+#10
 000A885C    lea         eax,[ebp-88]
 000A8862    push        eax
 000A8863    mov         eax,dword ptr [ebp-44]
 000A8866    mov         dword ptr [ebp-84],eax
 000A886C    mov         byte ptr [ebp-80],0B
 000A8870    lea         edx,[ebp-84]
 000A8876    xor         ecx,ecx
 000A8878    mov         eax,846
 000A887D    call        FmtLoadStr;'Invalid joker character!'
 000A8882    push        dword ptr [ebp-88]
 000A8888    lea         eax,[ebp-68]
 000A888B    mov         edx,4
 000A8890    call        @LStrCatN
 000A8895    mov         edx,dword ptr [ebp-68]
 000A8898    mov         eax,dword ptr [ebp-4]
 000A889B    call        000A6D44
 000A88A0    mov         eax,dword ptr [ebp-4]
 000A88A3    cmp         byte ptr [eax+388],0;TFormScript.?f388:byte
>000A88AA    jne         000A94C8
 000A88B0    mov         byte ptr [ebp-0A],1
 000A88B4    mov         eax,dword ptr [ebp-1C]
 000A88B7    mov         al,byte ptr [eax]
 000A88B9    mov         byte ptr [ebp-0B],al
>000A88BC    jmp         000A94C8
 000A88C1    mov         eax,dword ptr [ebp-48]
 000A88C4    mov         edx,0A9744;'ADR'
 000A88C9    call        @LStrCmp
>000A88CE    jne         000A8954
 000A88D4    push        ebp
 000A88D5    call        000A7E18
 000A88DA    pop         ecx
 000A88DB    test        al,al
>000A88DD    jne         000A94C8
 000A88E3    mov         eax,dword ptr [ebp-14]
 000A88E6    push        eax
 000A88E7    push        0
 000A88E9    lea         eax,[ebp-68]
 000A88EC    push        eax
 000A88ED    mov         eax,dword ptr [ebp-4]
 000A88F0    mov         eax,dword ptr [eax+390];TFormScript.?f390:String
 000A88F6    mov         dword ptr [ebp-84],eax
 000A88FC    mov         byte ptr [ebp-80],0B
 000A8900    lea         edx,[ebp-84]
 000A8906    xor         ecx,ecx
 000A8908    mov         eax,83B
 000A890D    call        FmtLoadStr;'Invalid address indicated: %s'
 000A8912    mov         ecx,dword ptr [ebp-68]
 000A8915    mov         eax,dword ptr [ebp-4]
 000A8918    mov         edx,dword ptr [eax+390];TFormScript.?f390:String
 000A891E    mov         eax,dword ptr [ebp-4]
 000A8921    call        000A6E0C
 000A8926    mov         ebx,eax
 000A8928    inc         ebx
 000A8929    mov         eax,dword ptr [ebp-4]
 000A892C    mov         dword ptr [eax+384],ebx;TFormScript.?f384:dword
 000A8932    mov         eax,dword ptr [ebp-4]
 000A8935    cmp         byte ptr [eax+388],0;TFormScript.?f388:byte
>000A893C    jne         000A94C8
 000A8942    mov         edx,ebx
 000A8944    mov         ecx,dword ptr [ebp-14]
 000A8947    mov         eax,dword ptr [ebp-4]
 000A894A    call        000A7044
>000A894F    jmp         000A94C8
 000A8954    mov         eax,dword ptr [ebp-48]
 000A8957    mov         edx,0A9750;'ADREOF'
 000A895C    call        @LStrCmp
>000A8961    jne         000A8A2B
 000A8967    mov         eax,dword ptr [ebp-4]
 000A896A    cmp         dword ptr [eax+390],0;TFormScript.?f390:String
>000A8971    je          000A89F9
 000A8977    lea         eax,[ebp-7C]
 000A897A    push        eax
 000A897B    mov         eax,dword ptr [ebp-14]
 000A897E    inc         eax
 000A897F    mov         dword ptr [ebp-78],eax
 000A8982    mov         byte ptr [ebp-74],0
 000A8986    mov         eax,dword ptr [ebp-4]
 000A8989    mov         eax,dword ptr [eax+38C];TFormScript.?f38C:String
 000A898F    mov         dword ptr [ebp-70],eax
 000A8992    mov         byte ptr [ebp-6C],0B
 000A8996    lea         edx,[ebp-78]
 000A8999    mov         ecx,1
 000A899E    mov         eax,83A
 000A89A3    call        FmtLoadStr;'Error in line number %d:
%s'
 000A89A8    push        dword ptr [ebp-7C]
 000A89AB    push        0A962C;#13+#10
 000A89B0    push        0A962C;#13+#10
 000A89B5    lea         eax,[ebp-88]
 000A89BB    push        eax
 000A89BC    mov         eax,dword ptr [ebp-44]
 000A89BF    mov         dword ptr [ebp-84],eax
 000A89C5    mov         byte ptr [ebp-80],0B
 000A89C9    lea         edx,[ebp-84]
 000A89CF    xor         ecx,ecx
 000A89D1    mov         eax,858
 000A89D6    call        FmtLoadStr;'Command %s must not have parameter'
 000A89DB    push        dword ptr [ebp-88]
 000A89E1    lea         eax,[ebp-68]
 000A89E4    mov         edx,4
 000A89E9    call        @LStrCatN
 000A89EE    mov         edx,dword ptr [ebp-68]
 000A89F1    mov         eax,dword ptr [ebp-4]
 000A89F4    call        000A6D44
 000A89F9    mov         eax,dword ptr [ebp-4]
 000A89FC    cmp         byte ptr [eax+388],0;TFormScript.?f388:byte
>000A8A03    jne         000A94C8
 000A8A09    mov         eax,[000B5BA0];^gvar_000B6BAC:Single
 000A8A0E    mov         eax,dword ptr [eax]
 000A8A10    mov         edx,dword ptr [ebp-4]
 000A8A13    mov         dword ptr [edx+384],eax;TFormScript.?f384:dword
 000A8A19    mov         edx,eax
 000A8A1B    mov         ecx,dword ptr [ebp-14]
 000A8A1E    mov         eax,dword ptr [ebp-4]
 000A8A21    call        000A7044
>000A8A26    jmp         000A94C8
 000A8A2B    mov         eax,dword ptr [ebp-48]
 000A8A2E    mov         edx,0A9760;'ADR-'
 000A8A33    call        @LStrCmp
>000A8A38    jne         000A8AC2
 000A8A3E    push        ebp
 000A8A3F    call        000A7E18
 000A8A44    pop         ecx
 000A8A45    test        al,al
>000A8A47    jne         000A94C8
 000A8A4D    mov         eax,dword ptr [ebp-14]
 000A8A50    push        eax
 000A8A51    push        0
 000A8A53    lea         eax,[ebp-68]
 000A8A56    push        eax
 000A8A57    mov         eax,dword ptr [ebp-4]
 000A8A5A    mov         eax,dword ptr [eax+390];TFormScript.?f390:String
 000A8A60    mov         dword ptr [ebp-84],eax
 000A8A66    mov         byte ptr [ebp-80],0B
 000A8A6A    lea         edx,[ebp-84]
 000A8A70    xor         ecx,ecx
 000A8A72    mov         eax,83C
 000A8A77    call        FmtLoadStr;'Invalid byte count: %s'
 000A8A7C    mov         ecx,dword ptr [ebp-68]
 000A8A7F    mov         eax,dword ptr [ebp-4]
 000A8A82    mov         edx,dword ptr [eax+390];TFormScript.?f390:String
 000A8A88    mov         eax,dword ptr [ebp-4]
 000A8A8B    call        000A6E0C
 000A8A90    mov         edx,dword ptr [ebp-4]
 000A8A93    cmp         byte ptr [edx+388],0;TFormScript.?f388:byte
>000A8A9A    jne         000A94C8
 000A8AA0    mov         edx,dword ptr [ebp-4]
 000A8AA3    sub         dword ptr [edx+384],eax
 000A8AA9    mov         eax,dword ptr [ebp-4]
 000A8AAC    mov         edx,dword ptr [eax+384];TFormScript.?f384:dword
 000A8AB2    mov         ecx,dword ptr [ebp-14]
 000A8AB5    mov         eax,dword ptr [ebp-4]
 000A8AB8    call        000A7044
>000A8ABD    jmp         000A94C8
 000A8AC2    mov         eax,dword ptr [ebp-48]
 000A8AC5    mov         edx,0A9770;'ADR+'
 000A8ACA    call        @LStrCmp
>000A8ACF    jne         000A8B59
 000A8AD5    push        ebp
 000A8AD6    call        000A7E18
 000A8ADB    pop         ecx
 000A8ADC    test        al,al
>000A8ADE    jne         000A94C8
 000A8AE4    mov         eax,dword ptr [ebp-14]
 000A8AE7    push        eax
 000A8AE8    push        0
 000A8AEA    lea         eax,[ebp-68]
 000A8AED    push        eax
 000A8AEE    mov         eax,dword ptr [ebp-4]
 000A8AF1    mov         eax,dword ptr [eax+390];TFormScript.?f390:String
 000A8AF7    mov         dword ptr [ebp-84],eax
 000A8AFD    mov         byte ptr [ebp-80],0B
 000A8B01    lea         edx,[ebp-84]
 000A8B07    xor         ecx,ecx
 000A8B09    mov         eax,83C
 000A8B0E    call        FmtLoadStr;'Invalid byte count: %s'
 000A8B13    mov         ecx,dword ptr [ebp-68]
 000A8B16    mov         eax,dword ptr [ebp-4]
 000A8B19    mov         edx,dword ptr [eax+390];TFormScript.?f390:String
 000A8B1F    mov         eax,dword ptr [ebp-4]
 000A8B22    call        000A6E0C
 000A8B27    mov         edx,dword ptr [ebp-4]
 000A8B2A    cmp         byte ptr [edx+388],0;TFormScript.?f388:byte
>000A8B31    jne         000A94C8
 000A8B37    mov         edx,dword ptr [ebp-4]
 000A8B3A    add         dword ptr [edx+384],eax;TFormScript.?f384:dword
 000A8B40    mov         eax,dword ptr [ebp-4]
 000A8B43    mov         edx,dword ptr [eax+384];TFormScript.?f384:dword
 000A8B49    mov         ecx,dword ptr [ebp-14]
 000A8B4C    mov         eax,dword ptr [ebp-4]
 000A8B4F    call        000A7044
>000A8B54    jmp         000A94C8
 000A8B59    mov         eax,dword ptr [ebp-48]
 000A8B5C    mov         edx,0A9780;'DEL'
 000A8B61    call        @LStrCmp
>000A8B66    jne         000A8D1C
 000A8B6C    push        ebp
 000A8B6D    call        000A7E18
 000A8B72    pop         ecx
 000A8B73    test        al,al
>000A8B75    jne         000A94C8
 000A8B7B    mov         eax,dword ptr [ebp-14]
 000A8B7E    push        eax
 000A8B7F    push        0
 000A8B81    lea         eax,[ebp-68]
 000A8B84    push        eax
 000A8B85    mov         eax,dword ptr [ebp-4]
 000A8B88    mov         eax,dword ptr [eax+390];TFormScript.?f390:String
 000A8B8E    mov         dword ptr [ebp-84],eax
 000A8B94    mov         byte ptr [ebp-80],0B
 000A8B98    lea         edx,[ebp-84]
 000A8B9E    xor         ecx,ecx
 000A8BA0    mov         eax,83C
 000A8BA5    call        FmtLoadStr;'Invalid byte count: %s'
 000A8BAA    mov         ecx,dword ptr [ebp-68]
 000A8BAD    mov         eax,dword ptr [ebp-4]
 000A8BB0    mov         edx,dword ptr [eax+390];TFormScript.?f390:String
 000A8BB6    mov         eax,dword ptr [ebp-4]
 000A8BB9    call        000A6E0C
 000A8BBE    mov         ebx,eax
 000A8BC0    test        ebx,ebx
>000A8BC2    jg          000A8C50
 000A8BC8    lea         eax,[ebp-7C]
 000A8BCB    push        eax
 000A8BCC    mov         eax,dword ptr [ebp-14]
 000A8BCF    inc         eax
 000A8BD0    mov         dword ptr [ebp-78],eax
 000A8BD3    mov         byte ptr [ebp-74],0
 000A8BD7    mov         eax,dword ptr [ebp-4]
 000A8BDA    mov         eax,dword ptr [eax+38C];TFormScript.?f38C:String
 000A8BE0    mov         dword ptr [ebp-70],eax
 000A8BE3    mov         byte ptr [ebp-6C],0B
 000A8BE7    lea         edx,[ebp-78]
 000A8BEA    mov         ecx,1
 000A8BEF    mov         eax,83A
 000A8BF4    call        FmtLoadStr;'Error in line number %d:
%s'
 000A8BF9    push        dword ptr [ebp-7C]
 000A8BFC    push        0A962C;#13+#10
 000A8C01    push        0A962C;#13+#10
 000A8C06    lea         eax,[ebp-88]
 000A8C0C    push        eax
 000A8C0D    mov         eax,dword ptr [ebp-4]
 000A8C10    mov         eax,dword ptr [eax+390];TFormScript.?f390:String
 000A8C16    mov         dword ptr [ebp-84],eax
 000A8C1C    mov         byte ptr [ebp-80],0B
 000A8C20    lea         edx,[ebp-84]
 000A8C26    xor         ecx,ecx
 000A8C28    mov         eax,83C
 000A8C2D    call        FmtLoadStr;'Invalid byte count: %s'
 000A8C32    push        dword ptr [ebp-88]
 000A8C38    lea         eax,[ebp-68]
 000A8C3B    mov         edx,4
 000A8C40    call        @LStrCatN
 000A8C45    mov         edx,dword ptr [ebp-68]
 000A8C48    mov         eax,dword ptr [ebp-4]
 000A8C4B    call        000A6D44
 000A8C50    mov         eax,dword ptr [ebp-4]
 000A8C53    cmp         byte ptr [eax+388],0;TFormScript.?f388:byte
>000A8C5A    jne         000A94C8
 000A8C60    mov         eax,dword ptr [ebp-4]
 000A8C63    mov         eax,dword ptr [eax+384];TFormScript.?f384:dword
 000A8C69    add         eax,ebx
 000A8C6B    dec         eax
 000A8C6C    mov         edx,dword ptr ds:[0B5BA0];^gvar_000B6BAC:Single
 000A8C72    cmp         eax,dword ptr [edx]
>000A8C74    jle         000A8CE2
 000A8C76    lea         eax,[ebp-7C]
 000A8C79    push        eax
 000A8C7A    mov         eax,dword ptr [ebp-14]
 000A8C7D    inc         eax
 000A8C7E    mov         dword ptr [ebp-78],eax
 000A8C81    mov         byte ptr [ebp-74],0
 000A8C85    mov         eax,dword ptr [ebp-4]
 000A8C88    mov         eax,dword ptr [eax+38C];TFormScript.?f38C:String
 000A8C8E    mov         dword ptr [ebp-70],eax
 000A8C91    mov         byte ptr [ebp-6C],0B
 000A8C95    lea         edx,[ebp-78]
 000A8C98    mov         ecx,1
 000A8C9D    mov         eax,83A
 000A8CA2    call        FmtLoadStr;'Error in line number %d:
%s'
 000A8CA7    push        dword ptr [ebp-7C]
 000A8CAA    push        0A962C;#13+#10
 000A8CAF    push        0A962C;#13+#10
 000A8CB4    lea         edx,[ebp-88]
 000A8CBA    mov         eax,842
 000A8CBF    call        LoadStr;'Can't delete beyond end of file'
 000A8CC4    push        dword ptr [ebp-88]
 000A8CCA    lea         eax,[ebp-68]
 000A8CCD    mov         edx,4
 000A8CD2    call        @LStrCatN
 000A8CD7    mov         edx,dword ptr [ebp-68]
 000A8CDA    mov         eax,dword ptr [ebp-4]
 000A8CDD    call        000A6D44
 000A8CE2    mov         eax,dword ptr [ebp-4]
 000A8CE5    mov         eax,dword ptr [eax+384];TFormScript.?f384:dword
 000A8CEB    mov         edx,dword ptr ds:[0B586C];^gvar_000B6B8C:dword
 000A8CF1    mov         dword ptr [edx],eax
 000A8CF3    mov         eax,dword ptr [ebp-4]
 000A8CF6    add         ebx,dword ptr [eax+384];TFormScript.?f384:dword
 000A8CFC    dec         ebx
 000A8CFD    mov         eax,[000B5970];^gvar_000B6B90
 000A8D02    mov         dword ptr [eax],ebx
 000A8D04    call        00099EE8
 000A8D09    call        000981C4
 000A8D0E    mov         edx,dword ptr [ebp-4]
 000A8D11    mov         dword ptr [edx+384],eax;TFormScript.?f384:dword
>000A8D17    jmp         000A94C8
 000A8D1C    mov         eax,dword ptr [ebp-48]
 000A8D1F    mov         edx,0A978C;'OVERWRITE'
 000A8D24    call        @LStrCmp
>000A8D29    jne         000A8E69
 000A8D2F    push        ebp
 000A8D30    call        000A7E18
 000A8D35    pop         ecx
 000A8D36    test        al,al
>000A8D38    jne         000A94C8
 000A8D3E    lea         eax,[ebp-68]
 000A8D41    push        eax
 000A8D42    mov         eax,dword ptr [ebp-4]
 000A8D45    mov         eax,dword ptr [eax+390];TFormScript.?f390:String
 000A8D4B    mov         dword ptr [ebp-84],eax
 000A8D51    mov         byte ptr [ebp-80],0B
 000A8D55    lea         edx,[ebp-84]
 000A8D5B    xor         ecx,ecx
 000A8D5D    mov         eax,83D
 000A8D62    call        FmtLoadStr;'Invalid Hex String:
%s'
 000A8D67    mov         eax,dword ptr [ebp-68]
 000A8D6A    push        eax
 000A8D6B    push        1
 000A8D6D    mov         eax,dword ptr [ebp-14]
 000A8D70    push        eax
 000A8D71    push        0
 000A8D73    lea         eax,[ebp-1C]
 000A8D76    push        eax
 000A8D77    lea         ecx,[ebp-18]
 000A8D7A    mov         eax,dword ptr [ebp-4]
 000A8D7D    mov         edx,dword ptr [eax+390];TFormScript.?f390:String
 000A8D83    mov         eax,dword ptr [ebp-4]
 000A8D86    call        000A6F34
 000A8D8B    mov         eax,dword ptr [ebp-4]
 000A8D8E    cmp         byte ptr [eax+388],0;TFormScript.?f388:byte
>000A8D95    jne         000A94C8
 000A8D9B    mov         eax,dword ptr [ebp-4]
 000A8D9E    mov         eax,dword ptr [eax+384];TFormScript.?f384:dword
 000A8DA4    add         eax,dword ptr [ebp-18]
 000A8DA7    dec         eax
 000A8DA8    mov         edx,dword ptr ds:[0B5BA0];^gvar_000B6BAC:Single
 000A8DAE    cmp         eax,dword ptr [edx]
>000A8DB0    jle         000A8E1E
 000A8DB2    lea         eax,[ebp-7C]
 000A8DB5    push        eax
 000A8DB6    mov         eax,dword ptr [ebp-14]
 000A8DB9    inc         eax
 000A8DBA    mov         dword ptr [ebp-78],eax
 000A8DBD    mov         byte ptr [ebp-74],0
 000A8DC1    mov         eax,dword ptr [ebp-4]
 000A8DC4    mov         eax,dword ptr [eax+38C];TFormScript.?f38C:String
 000A8DCA    mov         dword ptr [ebp-70],eax
 000A8DCD    mov         byte ptr [ebp-6C],0B
 000A8DD1    lea         edx,[ebp-78]
 000A8DD4    mov         ecx,1
 000A8DD9    mov         eax,83A
 000A8DDE    call        FmtLoadStr;'Error in line number %d:
%s'
 000A8DE3    push        dword ptr [ebp-7C]
 000A8DE6    push        0A962C;#13+#10
 000A8DEB    push        0A962C;#13+#10
 000A8DF0    lea         edx,[ebp-88]
 000A8DF6    mov         eax,843
 000A8DFB    call        LoadStr;'Can't write beyond end of file'
 000A8E00    push        dword ptr [ebp-88]
 000A8E06    lea         eax,[ebp-68]
 000A8E09    mov         edx,4
 000A8E0E    call        @LStrCatN
 000A8E13    mov         edx,dword ptr [ebp-68]
 000A8E16    mov         eax,dword ptr [ebp-4]
 000A8E19    call        000A6D44
 000A8E1E    mov         eax,dword ptr [ebp-4]
 000A8E21    mov         eax,dword ptr [eax+384];TFormScript.?f384:dword
 000A8E27    mov         edx,dword ptr [ebp-1C]
 000A8E2A    call        000988E0
 000A8E2F    mov         eax,dword ptr [ebp-4]
 000A8E32    mov         eax,dword ptr [eax+384];TFormScript.?f384:dword
 000A8E38    add         eax,dword ptr [ebp-18]
 000A8E3B    mov         dword ptr [ebp-84],eax
 000A8E41    mov         eax,[000B5BA0];^gvar_000B6BAC:Single
 000A8E46    mov         eax,dword ptr [eax]
 000A8E48    mov         dword ptr [ebp-80],eax
 000A8E4B    lea         eax,[ebp-84]
 000A8E51    mov         edx,1
 000A8E56    call        00075288
 000A8E5B    mov         edx,dword ptr [ebp-4]
 000A8E5E    mov         dword ptr [edx+384],eax;TFormScript.?f384:dword
>000A8E64    jmp         000A94C8
 000A8E69    mov         eax,dword ptr [ebp-48]
 000A8E6C    mov         edx,0A97A0;'INSERT'
 000A8E71    call        @LStrCmp
>000A8E76    jne         000A8F78
 000A8E7C    push        ebp
 000A8E7D    call        000A7E18
 000A8E82    pop         ecx
 000A8E83    test        al,al
>000A8E85    jne         000A94C8
 000A8E8B    lea         eax,[ebp-68]
 000A8E8E    push        eax
 000A8E8F    mov         eax,dword ptr [ebp-4]
 000A8E92    mov         eax,dword ptr [eax+390];TFormScript.?f390:String
 000A8E98    mov         dword ptr [ebp-84],eax
 000A8E9E    mov         byte ptr [ebp-80],0B
 000A8EA2    lea         edx,[ebp-84]
 000A8EA8    xor         ecx,ecx
 000A8EAA    mov         eax,83D
 000A8EAF    call        FmtLoadStr;'Invalid Hex String:
%s'
 000A8EB4    mov         eax,dword ptr [ebp-68]
 000A8EB7    push        eax
 000A8EB8    push        1
 000A8EBA    mov         eax,dword ptr [ebp-14]
 000A8EBD    push        eax
 000A8EBE    push        0
 000A8EC0    lea         eax,[ebp-1C]
 000A8EC3    push        eax
 000A8EC4    lea         ecx,[ebp-18]
 000A8EC7    mov         eax,dword ptr [ebp-4]
 000A8ECA    mov         edx,dword ptr [eax+390];TFormScript.?f390:String
 000A8ED0    mov         eax,dword ptr [ebp-4]
 000A8ED3    call        000A6F34
 000A8ED8    mov         eax,dword ptr [ebp-4]
 000A8EDB    cmp         byte ptr [eax+388],0;TFormScript.?f388:byte
>000A8EE2    jne         000A94C8
 000A8EE8    mov         eax,dword ptr [ebp-4]
 000A8EEB    mov         eax,dword ptr [eax+384];TFormScript.?f384:dword
 000A8EF1    mov         ecx,dword ptr [ebp-1C]
 000A8EF4    mov         edx,1
 000A8EF9    call        00098A74
 000A8EFE    test        al,al
>000A8F00    jne         000A8F3E
 000A8F02    lea         eax,[ebp-68]
 000A8F05    push        eax
 000A8F06    mov         eax,dword ptr [ebp-14]
 000A8F09    inc         eax
 000A8F0A    mov         dword ptr [ebp-78],eax
 000A8F0D    mov         byte ptr [ebp-74],0
 000A8F11    mov         eax,dword ptr [ebp-4]
 000A8F14    mov         eax,dword ptr [eax+38C];TFormScript.?f38C:String
 000A8F1A    mov         dword ptr [ebp-70],eax
 000A8F1D    mov         byte ptr [ebp-6C],0B
 000A8F21    lea         edx,[ebp-78]
 000A8F24    mov         ecx,1
 000A8F29    mov         eax,83A
 000A8F2E    call        FmtLoadStr;'Error in line number %d:
%s'
 000A8F33    mov         edx,dword ptr [ebp-68]
 000A8F36    mov         eax,dword ptr [ebp-4]
 000A8F39    call        000A6D44
 000A8F3E    mov         eax,dword ptr [ebp-4]
 000A8F41    mov         eax,dword ptr [eax+384];TFormScript.?f384:dword
 000A8F47    add         eax,dword ptr [ebp-18]
 000A8F4A    mov         dword ptr [ebp-84],eax
 000A8F50    mov         eax,[000B5BA0];^gvar_000B6BAC:Single
 000A8F55    mov         eax,dword ptr [eax]
 000A8F57    mov         dword ptr [ebp-80],eax
 000A8F5A    lea         eax,[ebp-84]
 000A8F60    mov         edx,1
 000A8F65    call        00075288
 000A8F6A    mov         edx,dword ptr [ebp-4]
 000A8F6D    mov         dword ptr [edx+384],eax;TFormScript.?f384:dword
>000A8F73    jmp         000A94C8
 000A8F78    mov         eax,dword ptr [ebp-48]
 000A8F7B    mov         edx,0A97B0;'VERIFY'
 000A8F80    call        @LStrCmp
>000A8F85    jne         000A90A2
 000A8F8B    push        ebp
 000A8F8C    call        000A7E18
 000A8F91    pop         ecx
 000A8F92    test        al,al
>000A8F94    jne         000A94C8
 000A8F9A    mov         eax,dword ptr [ebp-10]
 000A8F9D    mov         edx,dword ptr [eax]
 000A8F9F    call        dword ptr [edx+40];TStringList.Clear
 000A8FA2    mov         eax,dword ptr [ebp-14]
 000A8FA5    push        eax
 000A8FA6    mov         eax,dword ptr [ebp-4]
 000A8FA9    mov         edx,dword ptr [eax+390];TFormScript.?f390:String
 000A8FAF    mov         ecx,dword ptr [ebp-10]
 000A8FB2    mov         eax,dword ptr [ebp-4]
 000A8FB5    call        000A72D4
 000A8FBA    mov         eax,dword ptr [ebp-4]
 000A8FBD    cmp         byte ptr [eax+388],0;TFormScript.?f388:byte
>000A8FC4    jne         000A94C8
 000A8FCA    mov         byte ptr [ebp-21],0
 000A8FCE    xor         ebx,ebx
>000A8FD0    jmp         000A8FF8
 000A8FD2    push        1
 000A8FD4    lea         ecx,[ebp-68]
 000A8FD7    mov         edx,ebx
 000A8FD9    mov         eax,dword ptr [ebp-10]
 000A8FDC    mov         edi,dword ptr [eax]
 000A8FDE    call        dword ptr [edi+0C];TStringList.Get
 000A8FE1    mov         edx,dword ptr [ebp-68]
 000A8FE4    mov         eax,dword ptr [ebp-4]
 000A8FE7    mov         eax,dword ptr [eax+384];TFormScript.?f384:dword
 000A8FED    mov         cl,3F
 000A8FEF    call        00098BB8
 000A8FF4    mov         byte ptr [ebp-21],al
 000A8FF7    inc         ebx
 000A8FF8    cmp         byte ptr [ebp-21],0
>000A8FFC    jne         000A900A
 000A8FFE    mov         eax,dword ptr [ebp-10]
 000A9001    mov         edx,dword ptr [eax]
 000A9003    call        dword ptr [edx+14];TStringList.GetCount
 000A9006    cmp         ebx,eax
>000A9008    jl          000A8FD2
 000A900A    cmp         byte ptr [ebp-21],0
>000A900E    jne         000A94C8
 000A9014    lea         eax,[ebp-7C]
 000A9017    push        eax
 000A9018    mov         eax,dword ptr [ebp-14]
 000A901B    inc         eax
 000A901C    mov         dword ptr [ebp-78],eax
 000A901F    mov         byte ptr [ebp-74],0
 000A9023    mov         eax,dword ptr [ebp-4]
 000A9026    mov         eax,dword ptr [eax+38C];TFormScript.?f38C:String
 000A902C    mov         dword ptr [ebp-70],eax
 000A902F    mov         byte ptr [ebp-6C],0B
 000A9033    lea         edx,[ebp-78]
 000A9036    mov         ecx,1
 000A903B    mov         eax,83A
 000A9040    call        FmtLoadStr;'Error in line number %d:
%s'
 000A9045    push        dword ptr [ebp-7C]
 000A9048    push        0A962C;#13+#10
 000A904D    push        0A962C;#13+#10
 000A9052    lea         eax,[ebp-88]
 000A9058    push        eax
 000A9059    mov         eax,dword ptr [ebp-4]
 000A905C    mov         eax,dword ptr [eax+384];TFormScript.?f384:dword
 000A9062    dec         eax
 000A9063    mov         dword ptr [ebp-84],eax
 000A9069    mov         byte ptr [ebp-80],0
 000A906D    lea         edx,[ebp-84]
 000A9073    xor         ecx,ecx
 000A9075    mov         eax,841
 000A907A    call        FmtLoadStr;'VERIFY failed; string(s) not found
at address $%x'
 000A907F    push        dword ptr [ebp-88]
 000A9085    lea         eax,[ebp-68]
 000A9088    mov         edx,4
 000A908D    call        @LStrCatN
 000A9092    mov         edx,dword ptr [ebp-68]
 000A9095    mov         eax,dword ptr [ebp-4]
 000A9098    call        000A6D44
>000A909D    jmp         000A94C8
 000A90A2    mov         eax,dword ptr [ebp-48]
 000A90A5    mov         edx,0A97C0;'FIND'
 000A90AA    call        @LStrCmp
>000A90AF    jne         000A913C
 000A90B5    push        ebp
 000A90B6    call        000A7E18
 000A90BB    pop         ecx
 000A90BC    test        al,al
>000A90BE    jne         000A94C8
 000A90C4    lea         eax,[ebp-68]
 000A90C7    push        eax
 000A90C8    mov         eax,dword ptr [ebp-4]
 000A90CB    mov         eax,dword ptr [eax+390];TFormScript.?f390:String
 000A90D1    mov         dword ptr [ebp-84],eax
 000A90D7    mov         byte ptr [ebp-80],0B
 000A90DB    lea         edx,[ebp-84]
 000A90E1    xor         ecx,ecx
 000A90E3    mov         eax,83D
 000A90E8    call        FmtLoadStr;'Invalid Hex String:
%s'
 000A90ED    mov         eax,dword ptr [ebp-68]
 000A90F0    push        eax
 000A90F1    push        1
 000A90F3    mov         eax,dword ptr [ebp-14]
 000A90F6    push        eax
 000A90F7    push        0
 000A90F9    lea         eax,[ebp-28]
 000A90FC    push        eax
 000A90FD    lea         ecx,[ebp-30]
 000A9100    mov         eax,dword ptr [ebp-4]
 000A9103    mov         edx,dword ptr [eax+390];TFormScript.?f390:String
 000A9109    mov         eax,dword ptr [ebp-4]
 000A910C    call        000A6F34
 000A9111    mov         eax,dword ptr [ebp-4]
 000A9114    cmp         byte ptr [eax+388],0;TFormScript.?f388:byte
>000A911B    jne         000A94C8
 000A9121    mov         eax,dword ptr [ebp-28]
 000A9124    push        eax
 000A9125    mov         eax,dword ptr [ebp-14]
 000A9128    push        eax
 000A9129    mov         cl,byte ptr [ebp-0B]
 000A912C    mov         dl,byte ptr [ebp-0A]
 000A912F    mov         eax,dword ptr [ebp-4]
 000A9132    call        000A75C0
>000A9137    jmp         000A94C8
 000A913C    mov         eax,dword ptr [ebp-48]
 000A913F    mov         edx,0A97D0;'FINDASC'
 000A9144    call        @LStrCmp
>000A9149    jne         000A9196
 000A914B    push        ebp
 000A914C    call        000A7E18
 000A9151    pop         ecx
 000A9152    test        al,al
>000A9154    jne         000A94C8
 000A915A    lea         eax,[ebp-28]
 000A915D    mov         edx,dword ptr [ebp-4]
 000A9160    mov         edx,dword ptr [edx+394];TFormScript.?f394:String
 000A9166    call        @LStrLAsg
 000A916B    mov         eax,dword ptr [ebp-4]
 000A916E    cmp         byte ptr [eax+388],0;TFormScript.?f388:byte
>000A9175    jne         000A94C8
 000A917B    mov         eax,dword ptr [ebp-28]
 000A917E    push        eax
 000A917F    mov         eax,dword ptr [ebp-14]
 000A9182    push        eax
 000A9183    mov         cl,byte ptr [ebp-0B]
 000A9186    mov         dl,byte ptr [ebp-0A]
 000A9189    mov         eax,dword ptr [ebp-4]
 000A918C    call        000A75C0
>000A9191    jmp         000A94C8
 000A9196    mov         eax,dword ptr [ebp-48]
 000A9199    mov         edx,0A97E0;'REPLACE'
 000A919E    call        @LStrCmp
>000A91A3    jne         000A9285
 000A91A9    push        ebp
 000A91AA    call        000A7E18
 000A91AF    pop         ecx
 000A91B0    test        al,al
>000A91B2    jne         000A94C8
 000A91B8    lea         eax,[ebp-3C]
 000A91BB    push        eax
 000A91BC    mov         eax,dword ptr [ebp-14]
 000A91BF    push        eax
 000A91C0    push        1
 000A91C2    push        1
 000A91C4    lea         ecx,[ebp-38]
 000A91C7    mov         eax,dword ptr [ebp-4]
 000A91CA    mov         edx,dword ptr [eax+390];TFormScript.?f390:String
 000A91D0    mov         eax,dword ptr [ebp-4]
 000A91D3    call        000A7124
 000A91D8    lea         eax,[ebp-68]
 000A91DB    push        eax
 000A91DC    mov         eax,dword ptr [ebp-38]
 000A91DF    mov         dword ptr [ebp-84],eax
 000A91E5    mov         byte ptr [ebp-80],0B
 000A91E9    lea         edx,[ebp-84]
 000A91EF    xor         ecx,ecx
 000A91F1    mov         eax,83D
 000A91F6    call        FmtLoadStr;'Invalid Hex String:
%s'
 000A91FB    mov         eax,dword ptr [ebp-68]
 000A91FE    push        eax
 000A91FF    push        1
 000A9201    mov         eax,dword ptr [ebp-14]
 000A9204    push        eax
 000A9205    push        0
 000A9207    lea         eax,[ebp-28]
 000A920A    push        eax
 000A920B    lea         ecx,[ebp-30]
 000A920E    mov         edx,dword ptr [ebp-38]
 000A9211    mov         eax,dword ptr [ebp-4]
 000A9214    call        000A6F34
 000A9219    lea         eax,[ebp-68]
 000A921C    push        eax
 000A921D    mov         eax,dword ptr [ebp-3C]
 000A9220    mov         dword ptr [ebp-84],eax
 000A9226    mov         byte ptr [ebp-80],0B
 000A922A    lea         edx,[ebp-84]
 000A9230    xor         ecx,ecx
 000A9232    mov         eax,83D
 000A9237    call        FmtLoadStr;'Invalid Hex String:
%s'
 000A923C    mov         eax,dword ptr [ebp-68]
 000A923F    push        eax
 000A9240    push        1
 000A9242    mov         eax,dword ptr [ebp-14]
 000A9245    push        eax
 000A9246    push        1
 000A9248    lea         eax,[ebp-2C]
 000A924B    push        eax
 000A924C    lea         ecx,[ebp-34]
 000A924F    mov         edx,dword ptr [ebp-3C]
 000A9252    mov         eax,dword ptr [ebp-4]
 000A9255    call        000A6F34
 000A925A    mov         eax,dword ptr [ebp-4]
 000A925D    cmp         byte ptr [eax+388],0;TFormScript.?f388:byte
>000A9264    jne         000A94C8
 000A926A    mov         eax,dword ptr [ebp-28]
 000A926D    push        eax
 000A926E    mov         eax,dword ptr [ebp-2C]
 000A9271    push        eax
 000A9272    mov         cl,byte ptr [ebp-0B]
 000A9275    mov         dl,byte ptr [ebp-0A]
 000A9278    mov         eax,dword ptr [ebp-4]
 000A927B    call        000A7774
>000A9280    jmp         000A94C8
 000A9285    mov         eax,dword ptr [ebp-48]
 000A9288    mov         edx,0A97F0;'REPLACEASC'
 000A928D    call        @LStrCmp
>000A9292    jne         000A92EE
 000A9294    push        ebp
 000A9295    call        000A7E18
 000A929A    pop         ecx
 000A929B    test        al,al
>000A929D    jne         000A94C8
 000A92A3    lea         eax,[ebp-2C]
 000A92A6    push        eax
 000A92A7    mov         eax,dword ptr [ebp-14]
 000A92AA    push        eax
 000A92AB    push        0
 000A92AD    push        1
 000A92AF    lea         ecx,[ebp-28]
 000A92B2    mov         eax,dword ptr [ebp-4]
 000A92B5    mov         edx,dword ptr [eax+394];TFormScript.?f394:String
 000A92BB    mov         eax,dword ptr [ebp-4]
 000A92BE    call        000A7124
 000A92C3    mov         eax,dword ptr [ebp-4]
 000A92C6    cmp         byte ptr [eax+388],0;TFormScript.?f388:byte
>000A92CD    jne         000A94C8
 000A92D3    mov         eax,dword ptr [ebp-28]
 000A92D6    push        eax
 000A92D7    mov         eax,dword ptr [ebp-2C]
 000A92DA    push        eax
 000A92DB    mov         cl,byte ptr [ebp-0B]
 000A92DE    mov         dl,byte ptr [ebp-0A]
 000A92E1    mov         eax,dword ptr [ebp-4]
 000A92E4    call        000A7774
>000A92E9    jmp         000A94C8
 000A92EE    mov         eax,dword ptr [ebp-48]
 000A92F1    mov         edx,0A9804;'REPLACEALLASC'
 000A92F6    call        @LStrCmp
>000A92FB    jne         000A9357
 000A92FD    push        ebp
 000A92FE    call        000A7E18
 000A9303    pop         ecx
 000A9304    test        al,al
>000A9306    jne         000A94C8
 000A930C    lea         eax,[ebp-2C]
 000A930F    push        eax
 000A9310    mov         eax,dword ptr [ebp-14]
 000A9313    push        eax
 000A9314    push        0
 000A9316    push        1
 000A9318    lea         ecx,[ebp-28]
 000A931B    mov         eax,dword ptr [ebp-4]
 000A931E    mov         edx,dword ptr [eax+394];TFormScript.?f394:String
 000A9324    mov         eax,dword ptr [ebp-4]
 000A9327    call        000A7124
 000A932C    mov         eax,dword ptr [ebp-4]
 000A932F    cmp         byte ptr [eax+388],0;TFormScript.?f388:byte
>000A9336    jne         000A94C8
 000A933C    mov         eax,dword ptr [ebp-28]
 000A933F    push        eax
 000A9340    mov         eax,dword ptr [ebp-2C]
 000A9343    push        eax
 000A9344    mov         cl,byte ptr [ebp-0B]
 000A9347    mov         dl,byte ptr [ebp-0A]
 000A934A    mov         eax,dword ptr [ebp-4]
 000A934D    call        000A7898
>000A9352    jmp         000A94C8
 000A9357    mov         eax,dword ptr [ebp-48]
 000A935A    mov         edx,0A981C;'REPLACEALL'
 000A935F    call        @LStrCmp
>000A9364    jne         000A9446
 000A936A    push        ebp
 000A936B    call        000A7E18
 000A9370    pop         ecx
 000A9371    test        al,al
>000A9373    jne         000A94C8
 000A9379    lea         eax,[ebp-3C]
 000A937C    push        eax
 000A937D    mov         eax,dword ptr [ebp-14]
 000A9380    push        eax
 000A9381    push        1
 000A9383    push        1
 000A9385    lea         ecx,[ebp-38]
 000A9388    mov         eax,dword ptr [ebp-4]
 000A938B    mov         edx,dword ptr [eax+390];TFormScript.?f390:String
 000A9391    mov         eax,dword ptr [ebp-4]
 000A9394    call        000A7124
 000A9399    lea         eax,[ebp-68]
 000A939C    push        eax
 000A939D    mov         eax,dword ptr [ebp-38]
 000A93A0    mov         dword ptr [ebp-84],eax
 000A93A6    mov         byte ptr [ebp-80],0B
 000A93AA    lea         edx,[ebp-84]
 000A93B0    xor         ecx,ecx
 000A93B2    mov         eax,83D
 000A93B7    call        FmtLoadStr;'Invalid Hex String:
%s'
 000A93BC    mov         eax,dword ptr [ebp-68]
 000A93BF    push        eax
 000A93C0    push        1
 000A93C2    mov         eax,dword ptr [ebp-14]
 000A93C5    push        eax
 000A93C6    push        0
 000A93C8    lea         eax,[ebp-28]
 000A93CB    push        eax
 000A93CC    lea         ecx,[ebp-30]
 000A93CF    mov         edx,dword ptr [ebp-38]
 000A93D2    mov         eax,dword ptr [ebp-4]
 000A93D5    call        000A6F34
 000A93DA    lea         eax,[ebp-68]
 000A93DD    push        eax
 000A93DE    mov         eax,dword ptr [ebp-3C]
 000A93E1    mov         dword ptr [ebp-84],eax
 000A93E7    mov         byte ptr [ebp-80],0B
 000A93EB    lea         edx,[ebp-84]
 000A93F1    xor         ecx,ecx
 000A93F3    mov         eax,83D
 000A93F8    call        FmtLoadStr;'Invalid Hex String:
%s'
 000A93FD    mov         eax,dword ptr [ebp-68]
 000A9400    push        eax
 000A9401    push        1
 000A9403    mov         eax,dword ptr [ebp-14]
 000A9406    push        eax
 000A9407    push        1
 000A9409    lea         eax,[ebp-2C]
 000A940C    push        eax
 000A940D    lea         ecx,[ebp-34]
 000A9410    mov         edx,dword ptr [ebp-3C]
 000A9413    mov         eax,dword ptr [ebp-4]
 000A9416    call        000A6F34
 000A941B    mov         eax,dword ptr [ebp-4]
 000A941E    cmp         byte ptr [eax+388],0;TFormScript.?f388:byte
>000A9425    jne         000A94C8
 000A942B    mov         eax,dword ptr [ebp-28]
 000A942E    push        eax
 000A942F    mov         eax,dword ptr [ebp-2C]
 000A9432    push        eax
 000A9433    mov         cl,byte ptr [ebp-0B]
 000A9436    mov         dl,byte ptr [ebp-0A]
 000A9439    mov         eax,dword ptr [ebp-4]
 000A943C    call        000A7898
>000A9441    jmp         000A94C8
 000A9446    lea         eax,[ebp-7C]
 000A9449    push        eax
 000A944A    mov         eax,dword ptr [ebp-14]
 000A944D    inc         eax
 000A944E    mov         dword ptr [ebp-78],eax
 000A9451    mov         byte ptr [ebp-74],0
 000A9455    mov         eax,dword ptr [ebp-4]
 000A9458    mov         eax,dword ptr [eax+38C];TFormScript.?f38C:String
 000A945E    mov         dword ptr [ebp-70],eax
 000A9461    mov         byte ptr [ebp-6C],0B
 000A9465    lea         edx,[ebp-78]
 000A9468    mov         ecx,1
 000A946D    mov         eax,83A
 000A9472    call        FmtLoadStr;'Error in line number %d:
%s'
 000A9477    push        dword ptr [ebp-7C]
 000A947A    push        0A962C;#13+#10
 000A947F    push        0A962C;#13+#10
 000A9484    lea         eax,[ebp-88]
 000A948A    push        eax
 000A948B    mov         eax,dword ptr [ebp-44]
 000A948E    mov         dword ptr [ebp-84],eax
 000A9494    mov         byte ptr [ebp-80],0B
 000A9498    lea         edx,[ebp-84]
 000A949E    xor         ecx,ecx
 000A94A0    mov         eax,83E
 000A94A5    call        FmtLoadStr;'Invalid command:
%s'
 000A94AA    push        dword ptr [ebp-88]
 000A94B0    lea         eax,[ebp-68]
 000A94B3    mov         edx,4
 000A94B8    call        @LStrCatN
 000A94BD    mov         edx,dword ptr [ebp-68]
 000A94C0    mov         eax,dword ptr [ebp-4]
 000A94C3    call        000A6D44
 000A94C8    inc         dword ptr [ebp-14]
 000A94CB    dec         dword ptr [ebp-64]
>000A94CE    jne         000A7EE6
 000A94D4    xor         eax,eax
 000A94D6    pop         edx
 000A94D7    pop         ecx
 000A94D8    pop         ecx
 000A94D9    mov         dword ptr fs:[eax],edx
 000A94DC    push        0A9525
 000A94E1    mov         eax,dword ptr [ebp-10]
 000A94E4    call        TObject.Free
 000A94E9    mov         eax,dword ptr [ebp-8]
 000A94EC    mov         edx,dword ptr [ebp-14]
 000A94EF    mov         dword ptr [eax],edx
 000A94F1    mov         eax,[000B5BDC];^Screen:TScreen
 000A94F6    mov         eax,dword ptr [eax]
 000A94F8    xor         edx,edx
 000A94FA    call        TScreen.SetCursor
 000A94FF    mov         eax,dword ptr [ebp-4]
 000A9502    cmp         byte ptr [eax+388],0;TFormScript.?f388:byte
>000A9509    jne         000A951D
 000A950B    mov         eax,dword ptr [ebp-4]
 000A950E    mov         eax,dword ptr [eax+384];TFormScript.?f384:dword
 000A9514    mov         cl,1
 000A9516    mov         dl,1
 000A9518    call        000998B0
 000A951D    ret
>000A951E    jmp         @HandleFinally
>000A9523    jmp         000A94E1
 000A9525    xor         eax,eax
 000A9527    pop         edx
 000A9528    pop         ecx
 000A9529    pop         ecx
 000A952A    mov         dword ptr fs:[eax],edx
 000A952D    push        0A9589
 000A9532    lea         eax,[ebp-88]
 000A9538    call        @LStrClr
 000A953D    lea         eax,[ebp-7C]
 000A9540    call        @LStrClr
 000A9545    lea         eax,[ebp-68]
 000A9548    call        @LStrClr
 000A954D    lea         eax,[ebp-60]
 000A9550    mov         edx,8
 000A9555    call        @LStrArrayClr
 000A955A    lea         eax,[ebp-3C]
 000A955D    mov         edx,2
 000A9562    call        @LStrArrayClr
 000A9567    lea         eax,[ebp-2C]
 000A956A    mov         edx,2
 000A956F    call        @LStrArrayClr
 000A9574    lea         eax,[ebp-20]
 000A9577    mov         edx,2
 000A957C    call        @LStrArrayClr
 000A9581    ret
>000A9582    jmp         @HandleFinally
>000A9587    jmp         000A9532
 000A9589    mov         al,byte ptr [ebp-9]
 000A958C    pop         edi
 000A958D    pop         esi
 000A958E    pop         ebx
 000A958F    mov         esp,ebp
 000A9591    pop         ebp
 000A9592    ret
end;*}

//000A9828
procedure TFormScript.FormShow(Sender:TObject);
begin
{*
 000A9828    cmp         byte ptr [eax+3A4],0;TFormScript.?f3A4:byte
>000A982F    je          000A9836
 000A9831    call        TFormScript.ButtonExecuteClick
 000A9836    ret
*}
end;

end.