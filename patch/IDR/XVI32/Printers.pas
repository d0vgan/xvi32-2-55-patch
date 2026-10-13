//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit Printers;

interface

uses
  SysUtils, Classes, Graphics, Printers;

type
  EPrinter = class(Exception)
  end;
  TPrinterOrientation = (poPortrait, poLandscape);
  TPrinter = class(TObject)
  public
    FCanvas:TCanvas;//f4
    FFonts:TStrings;//f8
    FPageNumber:Integer;//fC
    FPrinters:TStrings;//f10
    FPrinterIndex:Integer;//f14
    FTitle:String;//f18
    FPrinting:Boolean;//f1C
    FAborted:Boolean;//f1D
    FCapabilities:TPrinterCapabilities;//f1E
    State:TPrinterState;//f1F
    DC:HDC;//f20
    DevMode:PDeviceMode;//f24
    DeviceMode:THandle;//f28
    FPrinterHandle:THandle;//f2C
    constructor Create;//000327E4
    destructor Destroy;//00032820
    procedure SetState(Value:TPrinterState);//0003289C
    procedure CheckPrinting(Value:Boolean);//000329C8
    procedure Abort;//00032A30
    procedure BeginDoc;//00032A5C
    procedure EndDoc;//00032AF8
    procedure NewPage;//00032B2C
    procedure GetPrinter(ADevice:PChar; ADriver:PChar; APort:PChar; var ADeviceMode:THandle);//00032B5C
    procedure SetPrinterCapabilities(Value:Integer);//00032BC8
    procedure SetPrinter(ADevice:PChar; ADriver:PChar; APort:PChar; ADeviceMode:THandle);//00032C04
    function GetCanvas:TCanvas;//00032E4C
    function GetHandle:HDC;//00032E6C
    function GetNumCopies:Integer;//00032E80
    procedure SetNumCopies(Value:Integer);//00032EE4
    function GetOrientation:TPrinterOrientation;//00032F5C
    procedure SetOrientation(Value:TPrinterOrientation);//00032FC8
    function GetPrinterIndex:Integer;//0003304C
    procedure SetPrinterIndex(Value:Integer);//00033064
    function GetPrinters:TStrings;//000330FC
    procedure SetToDefaultPrinter;//00033338
    procedure FreePrinters;//000334E0
    procedure FreeFonts;//00033524
  end;
  TPrinterDevice = class(TObject)
  public
    Driver:String;//f4
    Device:String;//f8
    Port:String;//fC
    constructor Create(ADriver:PChar; ADevice:PChar; APort:PChar);//00032550
    function IsEqual(ADriver:PChar; ADevice:PChar; APort:PChar):Boolean;//000325B0
  end;
  TPrinterCanvas = class(TCanvas)
  published
    procedure UpdateFont;//0003279C
    procedure Changing;//0003277C
    procedure CreateHandle;//00032758
  public
    Printer:TPrinter;//f54
    procedure Changing; virtual;//v10//0003277C
    procedure CreateHandle; virtual;//v14//00032758
    constructor Create(APrinter:TPrinter);//0003271C
  end;
    function FetchStr(var Str:PChar):PChar;//00032460
    procedure RaiseError(const Msg:AnsiString);//00032494
    function AbortProc(Prn:HDC; Error:Integer):BOOL; stdcall;//000324AC
    function Printer:TPrinter;//00033538

implementation

//00032460
function FetchStr(var Str:PChar):PChar;
begin
{*
 00032460    push        esi
 00032461    mov         esi,dword ptr [eax]
 00032463    cmp         dword ptr [eax],0
>00032466    je          0003248D
 00032468    mov         edx,dword ptr [eax]
>0003246A    jmp         0003246D
 0003246C    inc         edx
 0003246D    cmp         byte ptr [edx],20
>00032470    je          0003246C
 00032472    mov         esi,edx
>00032474    jmp         00032477
 00032476    inc         edx
 00032477    mov         cl,byte ptr [edx]
 00032479    test        cl,cl
>0003247B    je          00032482
 0003247D    cmp         cl,2C
>00032480    jne         00032476
 00032482    cmp         byte ptr [edx],2C
>00032485    jne         0003248B
 00032487    mov         byte ptr [edx],0
 0003248A    inc         edx
 0003248B    mov         dword ptr [eax],edx
 0003248D    mov         eax,esi
 0003248F    pop         esi
 00032490    ret
*}
end;

//00032494
procedure RaiseError(const Msg:AnsiString);
begin
{*
 00032494    push        ebx
 00032495    mov         ebx,eax
 00032497    mov         ecx,ebx
 00032499    mov         dl,1
 0003249B    mov         eax,[00032360];EPrinter
 000324A0    call        Exception.Create
 000324A5    call        @RaiseExcept
 000324AA    pop         ebx
 000324AB    ret
*}
end;

//000324AC
function AbortProc(Prn:HDC; Error:Integer):BOOL; stdcall;
begin
{*
 000324AC    push        ebp
 000324AD    mov         ebp,esp
 000324AF    mov         eax,[000B59E8];^Application:TApplication
 000324B4    mov         eax,dword ptr [eax]
 000324B6    call        TApplication.ProcessMessages
 000324BB    mov         eax,[000B466C]
 000324C0    mov         al,byte ptr [eax+1D]
 000324C3    xor         al,1
 000324C5    neg         al
 000324C7    sbb         eax,eax
 000324C9    pop         ebp
 000324CA    ret         8
*}
end;

//00032550
constructor TPrinterDevice.Create(ADriver:PChar; ADevice:PChar; APort:PChar);
begin
{*
 00032550    push        ebp
 00032551    mov         ebp,esp
 00032553    push        ebx
 00032554    push        esi
 00032555    push        edi
 00032556    test        dl,dl
>00032558    je          00032562
 0003255A    add         esp,0FFFFFFF0
 0003255D    call        @ClassCreate
 00032562    mov         esi,ecx
 00032564    mov         ebx,edx
 00032566    mov         edi,eax
 00032568    xor         edx,edx
 0003256A    mov         eax,edi
 0003256C    call        TObject.Create
 00032571    lea         eax,[edi+4]
 00032574    mov         edx,esi
 00032576    call        @LStrFromPChar
 0003257B    lea         eax,[edi+8]
 0003257E    mov         edx,dword ptr [ebp+0C]
 00032581    call        @LStrFromPChar
 00032586    lea         eax,[edi+0C]
 00032589    mov         edx,dword ptr [ebp+8]
 0003258C    call        @LStrFromPChar
 00032591    mov         eax,edi
 00032593    test        bl,bl
>00032595    je          000325A6
 00032597    call        @AfterConstruction
 0003259C    pop         dword ptr fs:[0]
 000325A3    add         esp,0C
 000325A6    mov         eax,edi
 000325A8    pop         edi
 000325A9    pop         esi
 000325AA    pop         ebx
 000325AB    pop         ebp
 000325AC    ret         8
*}
end;

//000325B0
function TPrinterDevice.IsEqual(ADriver:PChar; ADevice:PChar; APort:PChar):Boolean;
begin
{*
 000325B0    push        ebp
 000325B1    mov         ebp,esp
 000325B3    push        0
 000325B5    push        ebx
 000325B6    push        esi
 000325B7    mov         esi,ecx
 000325B9    mov         ebx,eax
 000325BB    xor         eax,eax
 000325BD    push        ebp
 000325BE    push        3261C
 000325C3    push        dword ptr fs:[eax]
 000325C6    mov         dword ptr fs:[eax],esp
 000325C9    lea         eax,[ebp-4]
 000325CC    mov         edx,esi
 000325CE    call        @LStrFromPChar
 000325D3    mov         edx,dword ptr [ebp-4]
 000325D6    mov         eax,dword ptr [ebx+8]
 000325D9    call        @LStrCmp
>000325DE    jne         000325FE
 000325E0    cmp         dword ptr [ebx+0C],0
>000325E4    je          00032602
 000325E6    lea         eax,[ebp-4]
 000325E9    mov         edx,dword ptr [ebp+8]
 000325EC    call        @LStrFromPChar
 000325F1    mov         edx,dword ptr [ebp-4]
 000325F4    mov         eax,dword ptr [ebx+0C]
 000325F7    call        @LStrCmp
>000325FC    je          00032602
 000325FE    xor         eax,eax
>00032600    jmp         00032604
 00032602    mov         al,1
 00032604    mov         ebx,eax
 00032606    xor         eax,eax
 00032608    pop         edx
 00032609    pop         ecx
 0003260A    pop         ecx
 0003260B    mov         dword ptr fs:[eax],edx
 0003260E    push        32623
 00032613    lea         eax,[ebp-4]
 00032616    call        @LStrClr
 0003261B    ret
>0003261C    jmp         @HandleFinally
>00032621    jmp         00032613
 00032623    mov         eax,ebx
 00032625    pop         esi
 00032626    pop         ebx
 00032627    pop         ecx
 00032628    pop         ebp
 00032629    ret         4
*}
end;

//0003271C
constructor TPrinterCanvas.Create(APrinter:TPrinter);
begin
{*
 0003271C    push        ebx
 0003271D    push        esi
 0003271E    push        edi
 0003271F    test        dl,dl
>00032721    je          0003272B
 00032723    add         esp,0FFFFFFF0
 00032726    call        @ClassCreate
 0003272B    mov         esi,ecx
 0003272D    mov         ebx,edx
 0003272F    mov         edi,eax
 00032731    xor         edx,edx
 00032733    mov         eax,edi
 00032735    call        TCanvas.Create
 0003273A    mov         dword ptr [edi+54],esi
 0003273D    mov         eax,edi
 0003273F    test        bl,bl
>00032741    je          00032752
 00032743    call        @AfterConstruction
 00032748    pop         dword ptr fs:[0]
 0003274F    add         esp,0C
 00032752    mov         eax,edi
 00032754    pop         edi
 00032755    pop         esi
 00032756    pop         ebx
 00032757    ret
*}
end;

//00032758
procedure TPrinterCanvas.CreateHandle;
begin
{*
 00032758    push        ebx
 00032759    mov         ebx,eax
 0003275B    mov         dl,1
 0003275D    mov         eax,dword ptr [ebx+54]
 00032760    call        TPrinter.SetState
 00032765    mov         eax,ebx
 00032767    call        TPrinterCanvas.UpdateFont
 0003276C    mov         eax,dword ptr [ebx+54]
 0003276F    mov         edx,dword ptr [eax+20]
 00032772    mov         eax,ebx
 00032774    call        TCanvas.SetHandle
 00032779    pop         ebx
 0003277A    ret
*}
end;

//0003277C
procedure TPrinterCanvas.Changing;
begin
{*
 0003277C    push        ebx
 0003277D    mov         ebx,eax
 0003277F    mov         dl,1
 00032781    mov         eax,dword ptr [ebx+54]
 00032784    call        TPrinter.CheckPrinting
 00032789    mov         eax,ebx
 0003278B    call        TCanvas.Changing
 00032790    mov         eax,ebx
 00032792    call        TPrinterCanvas.UpdateFont
 00032797    pop         ebx
 00032798    ret
*}
end;

//0003279C
procedure TPrinterCanvas.UpdateFont;
begin
{*
 0003279C    push        ebx
 0003279D    push        esi
 0003279E    push        edi
 0003279F    mov         ebx,eax
 000327A1    push        5A
 000327A3    mov         eax,dword ptr [ebx+54]
 000327A6    mov         eax,dword ptr [eax+20]
 000327A9    push        eax
 000327AA    call        gdi32.GetDeviceCaps
 000327AF    mov         esi,dword ptr [ebx+0C]
 000327B2    cmp         eax,dword ptr [esi+18]
>000327B5    je          000327DD
 000327B7    mov         eax,esi
 000327B9    call        TFont.GetSize
 000327BE    mov         esi,eax
 000327C0    push        5A
 000327C2    mov         eax,dword ptr [ebx+54]
 000327C5    mov         eax,dword ptr [eax+20]
 000327C8    push        eax
 000327C9    call        gdi32.GetDeviceCaps
 000327CE    mov         edi,dword ptr [ebx+0C]
 000327D1    mov         dword ptr [edi+18],eax
 000327D4    mov         edx,esi
 000327D6    mov         eax,edi
 000327D8    call        TFont.SetSize
 000327DD    pop         edi
 000327DE    pop         esi
 000327DF    pop         ebx
 000327E0    ret
*}
end;

//000327E4
constructor TPrinter.Create;
begin
{*
 000327E4    push        ebx
 000327E5    push        esi
 000327E6    test        dl,dl
>000327E8    je          000327F2
 000327EA    add         esp,0FFFFFFF0
 000327ED    call        @ClassCreate
 000327F2    mov         ebx,edx
 000327F4    mov         esi,eax
 000327F6    xor         edx,edx
 000327F8    mov         eax,esi
 000327FA    call        TObject.Create
 000327FF    mov         dword ptr [esi+14],0FFFFFFFF
 00032806    mov         eax,esi
 00032808    test        bl,bl
>0003280A    je          0003281B
 0003280C    call        @AfterConstruction
 00032811    pop         dword ptr fs:[0]
 00032818    add         esp,0C
 0003281B    mov         eax,esi
 0003281D    pop         esi
 0003281E    pop         ebx
 0003281F    ret
*}
end;

//00032820
destructor TPrinter.Destroy;
begin
{*
 00032820    push        ebx
 00032821    push        esi
 00032822    call        @BeforeDestruction
 00032827    mov         ebx,edx
 00032829    mov         esi,eax
 0003282B    cmp         byte ptr [esi+1C],0
>0003282F    je          00032838
 00032831    mov         eax,esi
 00032833    call        TPrinter.EndDoc
 00032838    xor         edx,edx
 0003283A    mov         eax,esi
 0003283C    call        TPrinter.SetState
 00032841    mov         eax,esi
 00032843    call        TPrinter.FreePrinters
 00032848    mov         eax,esi
 0003284A    call        TPrinter.FreeFonts
 0003284F    mov         eax,dword ptr [esi+4]
 00032852    call        TObject.Free
 00032857    mov         eax,dword ptr [esi+2C]
 0003285A    test        eax,eax
>0003285C    je          00032864
 0003285E    push        eax
 0003285F    call        winspool.ClosePrinter
 00032864    mov         eax,dword ptr [esi+28]
 00032867    test        eax,eax
>00032869    je          0003287F
 0003286B    push        eax
 0003286C    call        kernel32.GlobalUnlock
 00032871    mov         eax,dword ptr [esi+28]
 00032874    push        eax
 00032875    call        kernel32.GlobalFree
 0003287A    xor         eax,eax
 0003287C    mov         dword ptr [esi+28],eax
 0003287F    mov         edx,ebx
 00032881    and         dl,0FC
 00032884    mov         eax,esi
 00032886    call        TObject.Destroy
 0003288B    test        bl,bl
>0003288D    jle         00032896
 0003288F    mov         eax,esi
 00032891    call        @ClassDestroy
 00032896    pop         esi
 00032897    pop         ebx
 00032898    ret
*}
end;

//0003289C
procedure TPrinter.SetState(Value:TPrinterState);
begin
{*
 0003289C    push        ebp
 0003289D    mov         ebp,esp
 0003289F    add         esp,0FFFFFFF8
 000328A2    push        ebx
 000328A3    push        esi
 000328A4    push        edi
 000328A5    xor         ecx,ecx
 000328A7    mov         dword ptr [ebp-8],ecx
 000328AA    mov         ebx,edx
 000328AC    mov         esi,eax
 000328AE    xor         eax,eax
 000328B0    push        ebp
 000328B1    push        329BA
 000328B6    push        dword ptr fs:[eax]
 000328B9    mov         dword ptr fs:[eax],esp
 000328BC    mov         al,byte ptr [esi+1F]
 000328BF    cmp         bl,al
>000328C1    je          000329A4
 000328C7    xor         edi,edi
 000328C9    mov         edx,ebx
 000328CB    sub         dl,1
>000328CE    jb          000328D8
>000328D0    je          000328FF
 000328D2    dec         dl
>000328D4    je          0003290E
>000328D6    jmp         0003292E
 000328D8    xor         edx,edx
 000328DA    mov         eax,esi
 000328DC    call        TPrinter.CheckPrinting
 000328E1    mov         eax,dword ptr [esi+4]
 000328E4    test        eax,eax
>000328E6    je          000328EF
 000328E8    xor         edx,edx
 000328EA    call        TCanvas.SetHandle
 000328EF    mov         eax,dword ptr [esi+20]
 000328F2    push        eax
 000328F3    call        gdi32.DeleteDC
 000328F8    xor         eax,eax
 000328FA    mov         dword ptr [esi+20],eax
>000328FD    jmp         0003292E
 000328FF    cmp         al,2
>00032901    je          000329A4
 00032907    mov         edi,169B8;gdi32.CreateICA:HDC
>0003290C    jmp         0003292E
 0003290E    mov         eax,dword ptr [esi+4]
 00032911    test        eax,eax
>00032913    je          0003291C
 00032915    xor         edx,edx
 00032917    call        TCanvas.SetHandle
 0003291C    mov         eax,dword ptr [esi+20]
 0003291F    test        eax,eax
>00032921    je          00032929
 00032923    push        eax
 00032924    call        gdi32.DeleteDC
 00032929    mov         edi,16988;gdi32.CreateDCA:HDC
 0003292E    test        edi,edi
>00032930    je          000329A1
 00032932    mov         eax,esi
 00032934    call        TPrinter.GetPrinterIndex
 00032939    push        eax
 0003293A    mov         eax,esi
 0003293C    call        TPrinter.GetPrinters
 00032941    pop         edx
 00032942    mov         ecx,dword ptr [eax]
 00032944    call        dword ptr [ecx+18]
 00032947    mov         dword ptr [ebp-4],eax
 0003294A    mov         eax,dword ptr [esi+24]
 0003294D    push        eax
 0003294E    mov         eax,dword ptr [ebp-4]
 00032951    mov         eax,dword ptr [eax+0C]
 00032954    call        @LStrToPChar
 00032959    push        eax
 0003295A    mov         eax,dword ptr [ebp-4]
 0003295D    mov         eax,dword ptr [eax+8]
 00032960    call        @LStrToPChar
 00032965    push        eax
 00032966    mov         eax,dword ptr [ebp-4]
 00032969    mov         eax,dword ptr [eax+4]
 0003296C    call        @LStrToPChar
 00032971    push        eax
 00032972    call        edi
 00032974    mov         dword ptr [esi+20],eax
 00032977    cmp         dword ptr [esi+20],0
>0003297B    jne         00032992
 0003297D    lea         edx,[ebp-8]
 00032980    mov         eax,[000B5ABC];^SInvalidPrinter:TResStringRec
 00032985    call        LoadResString
 0003298A    mov         eax,dword ptr [ebp-8]
 0003298D    call        RaiseError
 00032992    mov         eax,dword ptr [esi+4]
 00032995    test        eax,eax
>00032997    je          000329A1
 00032999    mov         edx,dword ptr [esi+20]
 0003299C    call        TCanvas.SetHandle
 000329A1    mov         byte ptr [esi+1F],bl
 000329A4    xor         eax,eax
 000329A6    pop         edx
 000329A7    pop         ecx
 000329A8    pop         ecx
 000329A9    mov         dword ptr fs:[eax],edx
 000329AC    push        329C1
 000329B1    lea         eax,[ebp-8]
 000329B4    call        @LStrClr
 000329B9    ret
>000329BA    jmp         @HandleFinally
>000329BF    jmp         000329B1
 000329C1    pop         edi
 000329C2    pop         esi
 000329C3    pop         ebx
 000329C4    pop         ecx
 000329C5    pop         ecx
 000329C6    pop         ebp
 000329C7    ret
*}
end;

//000329C8
procedure TPrinter.CheckPrinting(Value:Boolean);
begin
{*
 000329C8    push        ebp
 000329C9    mov         ebp,esp
 000329CB    push        0
 000329CD    xor         ecx,ecx
 000329CF    push        ebp
 000329D0    push        32A26
 000329D5    push        dword ptr fs:[ecx]
 000329D8    mov         dword ptr fs:[ecx],esp
 000329DB    cmp         dl,byte ptr [eax+1C]
>000329DE    je          00032A10
 000329E0    test        dl,dl
>000329E2    je          000329FB
 000329E4    lea         edx,[ebp-4]
 000329E7    mov         eax,[000B5B6C];^SNotPrinting:TResStringRec
 000329EC    call        LoadResString
 000329F1    mov         eax,dword ptr [ebp-4]
 000329F4    call        RaiseError
>000329F9    jmp         00032A10
 000329FB    lea         edx,[ebp-4]
 000329FE    mov         eax,[000B5918];^SPrinting:TResStringRec
 00032A03    call        LoadResString
 00032A08    mov         eax,dword ptr [ebp-4]
 00032A0B    call        RaiseError
 00032A10    xor         eax,eax
 00032A12    pop         edx
 00032A13    pop         ecx
 00032A14    pop         ecx
 00032A15    mov         dword ptr fs:[eax],edx
 00032A18    push        32A2D
 00032A1D    lea         eax,[ebp-4]
 00032A20    call        @LStrClr
 00032A25    ret
>00032A26    jmp         @HandleFinally
>00032A2B    jmp         00032A1D
 00032A2D    pop         ecx
 00032A2E    pop         ebp
 00032A2F    ret
*}
end;

//00032A30
procedure TPrinter.Abort;
begin
{*
 00032A30    push        ebx
 00032A31    mov         ebx,eax
 00032A33    mov         dl,1
 00032A35    mov         eax,ebx
 00032A37    call        TPrinter.CheckPrinting
 00032A3C    mov         eax,ebx
 00032A3E    call        TPrinter.GetCanvas
 00032A43    call        TCanvas.GetHandle
 00032A48    push        eax
 00032A49    call        gdi32.AbortDoc
 00032A4E    mov         byte ptr [ebx+1D],1
 00032A52    mov         eax,ebx
 00032A54    call        TPrinter.EndDoc
 00032A59    pop         ebx
 00032A5A    ret
*}
end;

//00032A5C
procedure TPrinter.BeginDoc;
begin
{*
 00032A5C    push        ebx
 00032A5D    add         esp,0FFFFFFCC
 00032A60    mov         ebx,eax
 00032A62    xor         edx,edx
 00032A64    mov         eax,ebx
 00032A66    call        TPrinter.CheckPrinting
 00032A6B    mov         dl,2
 00032A6D    mov         eax,ebx
 00032A6F    call        TPrinter.SetState
 00032A74    mov         eax,ebx
 00032A76    call        TPrinter.GetCanvas
 00032A7B    call        TCanvas.Refresh
 00032A80    mov         eax,ebx
 00032A82    call        TPrinter.GetCanvas
 00032A87    call        TPrinterCanvas.UpdateFont
 00032A8C    mov         byte ptr [ebx+1C],1
 00032A90    mov         byte ptr [ebx+1D],0
 00032A94    mov         dword ptr [ebx+0C],1
 00032A9B    mov         eax,esp
 00032A9D    mov         ecx,1F
 00032AA2    mov         edx,dword ptr [ebx+18]
 00032AA5    call        StrPLCopy
 00032AAA    lea         eax,[esp+20]
 00032AAE    xor         ecx,ecx
 00032AB0    mov         edx,14
 00032AB5    call        @FillChar
 00032ABA    mov         dword ptr [esp+20],14
 00032AC2    mov         eax,esp
 00032AC4    mov         dword ptr [esp+24],eax
 00032AC8    xor         eax,eax
 00032ACA    mov         dword ptr [esp+28],eax
 00032ACE    push        324AC;AbortProc:BOOL
 00032AD3    mov         eax,dword ptr [ebx+20]
 00032AD6    push        eax
 00032AD7    call        gdi32.SetAbortProc
 00032ADC    lea         eax,[esp+20]
 00032AE0    push        eax
 00032AE1    mov         eax,dword ptr [ebx+20]
 00032AE4    push        eax
 00032AE5    call        gdi32.StartDocA
 00032AEA    mov         eax,dword ptr [ebx+20]
 00032AED    push        eax
 00032AEE    call        gdi32.StartPage
 00032AF3    add         esp,34
 00032AF6    pop         ebx
 00032AF7    ret
*}
end;

//00032AF8
procedure TPrinter.EndDoc;
begin
{*
 00032AF8    push        ebx
 00032AF9    mov         ebx,eax
 00032AFB    mov         dl,1
 00032AFD    mov         eax,ebx
 00032AFF    call        TPrinter.CheckPrinting
 00032B04    mov         eax,dword ptr [ebx+20]
 00032B07    push        eax
 00032B08    call        gdi32.EndPage
 00032B0D    cmp         byte ptr [ebx+1D],0
>00032B11    jne         00032B1C
 00032B13    mov         eax,dword ptr [ebx+20]
 00032B16    push        eax
 00032B17    call        gdi32.EndDoc
 00032B1C    mov         byte ptr [ebx+1C],0
 00032B20    mov         byte ptr [ebx+1D],0
 00032B24    xor         eax,eax
 00032B26    mov         dword ptr [ebx+0C],eax
 00032B29    pop         ebx
 00032B2A    ret
*}
end;

//00032B2C
procedure TPrinter.NewPage;
begin
{*
 00032B2C    push        ebx
 00032B2D    mov         ebx,eax
 00032B2F    mov         dl,1
 00032B31    mov         eax,ebx
 00032B33    call        TPrinter.CheckPrinting
 00032B38    mov         eax,dword ptr [ebx+20]
 00032B3B    push        eax
 00032B3C    call        gdi32.EndPage
 00032B41    mov         eax,dword ptr [ebx+20]
 00032B44    push        eax
 00032B45    call        gdi32.StartPage
 00032B4A    inc         dword ptr [ebx+0C]
 00032B4D    mov         eax,ebx
 00032B4F    call        TPrinter.GetCanvas
 00032B54    call        TCanvas.Refresh
 00032B59    pop         ebx
 00032B5A    ret
*}
end;

//00032B5C
procedure TPrinter.GetPrinter(ADevice:PChar; ADriver:PChar; APort:PChar; var ADeviceMode:THandle);
begin
{*
 00032B5C    push        ebp
 00032B5D    mov         ebp,esp
 00032B5F    push        ecx
 00032B60    push        ebx
 00032B61    push        esi
 00032B62    push        edi
 00032B63    mov         dword ptr [ebp-4],ecx
 00032B66    mov         edi,edx
 00032B68    mov         ebx,eax
 00032B6A    mov         eax,ebx
 00032B6C    call        TPrinter.GetPrinterIndex
 00032B71    push        eax
 00032B72    mov         eax,ebx
 00032B74    call        TPrinter.GetPrinters
 00032B79    pop         edx
 00032B7A    mov         ecx,dword ptr [eax]
 00032B7C    call        dword ptr [ecx+18]
 00032B7F    mov         esi,eax
 00032B81    mov         eax,dword ptr [esi+8]
 00032B84    call        @LStrToPChar
 00032B89    mov         edx,eax
 00032B8B    mov         eax,edi
 00032B8D    call        StrCopy
 00032B92    mov         eax,dword ptr [esi+4]
 00032B95    call        @LStrToPChar
 00032B9A    mov         edx,eax
 00032B9C    mov         eax,dword ptr [ebp-4]
 00032B9F    call        StrCopy
 00032BA4    mov         eax,dword ptr [esi+0C]
 00032BA7    call        @LStrToPChar
 00032BAC    mov         edx,eax
 00032BAE    mov         eax,dword ptr [ebp+0C]
 00032BB1    call        StrCopy
 00032BB6    mov         eax,dword ptr [ebp+8]
 00032BB9    mov         edx,dword ptr [ebx+28]
 00032BBC    mov         dword ptr [eax],edx
 00032BBE    pop         edi
 00032BBF    pop         esi
 00032BC0    pop         ebx
 00032BC1    pop         ecx
 00032BC2    pop         ebp
 00032BC3    ret         8
*}
end;

//00032BC8
procedure TPrinter.SetPrinterCapabilities(Value:Integer);
begin
{*
 00032BC8    push        ebx
 00032BC9    push        esi
 00032BCA    mov         esi,edx
 00032BCC    mov         ebx,eax
 00032BCE    mov         al,[00032C00]
 00032BD3    mov         byte ptr [ebx+1E],al
 00032BD6    test        esi,1
>00032BDC    je          00032BE2
 00032BDE    or          byte ptr [ebx+1E],2
 00032BE2    test        esi,100
>00032BE8    je          00032BEE
 00032BEA    or          byte ptr [ebx+1E],1
 00032BEE    test        esi,8000
>00032BF4    je          00032BFA
 00032BF6    or          byte ptr [ebx+1E],4
 00032BFA    pop         esi
 00032BFB    pop         ebx
 00032BFC    ret
*}
end;

//00032C04
procedure TPrinter.SetPrinter(ADevice:PChar; ADriver:PChar; APort:PChar; ADeviceMode:THandle);
begin
{*
 00032C04    push        ebp
 00032C05    mov         ebp,esp
 00032C07    add         esp,0FFFFFF3C
 00032C0D    push        ebx
 00032C0E    push        esi
 00032C0F    push        edi
 00032C10    xor         ebx,ebx
 00032C12    mov         dword ptr [ebp-0B0],ebx
 00032C18    mov         dword ptr [ebp-0B4],ebx
 00032C1E    mov         dword ptr [ebp-8],ecx
 00032C21    mov         dword ptr [ebp-4],edx
 00032C24    mov         ebx,eax
 00032C26    mov         esi,dword ptr [ebp+8]
 00032C29    xor         eax,eax
 00032C2B    push        ebp
 00032C2C    push        32E3B
 00032C31    push        dword ptr fs:[eax]
 00032C34    mov         dword ptr fs:[eax],esp
 00032C37    xor         edx,edx
 00032C39    mov         eax,ebx
 00032C3B    call        TPrinter.CheckPrinting
 00032C40    mov         eax,dword ptr [ebx+28]
 00032C43    cmp         esi,eax
>00032C45    je          00032C5D
 00032C47    test        eax,eax
>00032C49    je          00032C5A
 00032C4B    push        eax
 00032C4C    call        kernel32.GlobalUnlock
 00032C51    mov         eax,dword ptr [ebx+28]
 00032C54    push        eax
 00032C55    call        kernel32.GlobalFree
 00032C5A    mov         dword ptr [ebx+28],esi
 00032C5D    mov         esi,dword ptr [ebx+28]
 00032C60    test        esi,esi
>00032C62    je          00032C79
 00032C64    push        esi
 00032C65    call        kernel32.GlobalLock
 00032C6A    mov         edi,eax
 00032C6C    mov         dword ptr [ebx+24],edi
 00032C6F    mov         edx,dword ptr [edi+28]
 00032C72    mov         eax,ebx
 00032C74    call        TPrinter.SetPrinterCapabilities
 00032C79    mov         eax,ebx
 00032C7B    call        TPrinter.FreeFonts
 00032C80    mov         eax,dword ptr [ebx+2C]
 00032C83    test        eax,eax
>00032C85    je          00032C92
 00032C87    push        eax
 00032C88    call        winspool.ClosePrinter
 00032C8D    xor         eax,eax
 00032C8F    mov         dword ptr [ebx+2C],eax
 00032C92    xor         edx,edx
 00032C94    mov         eax,ebx
 00032C96    call        TPrinter.SetState
 00032C9B    mov         dword ptr [ebp-0C],0FFFFFFFF
 00032CA2    mov         eax,ebx
 00032CA4    call        TPrinter.GetPrinters
 00032CA9    mov         dword ptr [ebp-10],eax
 00032CAC    mov         eax,dword ptr [ebp-10]
 00032CAF    mov         edx,dword ptr [eax]
 00032CB1    call        dword ptr [edx+14]
 00032CB4    mov         edi,eax
 00032CB6    dec         edi
 00032CB7    test        edi,edi
>00032CB9    jl          00032CF9
 00032CBB    inc         edi
 00032CBC    xor         esi,esi
 00032CBE    mov         eax,dword ptr [ebp+0C]
 00032CC1    push        eax
 00032CC2    mov         edx,esi
 00032CC4    mov         eax,dword ptr [ebp-10]
 00032CC7    mov         ecx,dword ptr [eax]
 00032CC9    call        dword ptr [ecx+18]
 00032CCC    mov         ecx,dword ptr [ebp-4]
 00032CCF    mov         edx,dword ptr [ebp-8]
 00032CD2    call        TPrinterDevice.IsEqual
 00032CD7    test        al,al
>00032CD9    je          00032CF5
 00032CDB    mov         edx,esi
 00032CDD    mov         eax,dword ptr [ebp-10]
 00032CE0    mov         ecx,dword ptr [eax]
 00032CE2    call        dword ptr [ecx+18]
 00032CE5    add         eax,0C
 00032CE8    mov         edx,dword ptr [ebp+0C]
 00032CEB    call        @LStrFromPChar
 00032CF0    mov         dword ptr [ebp-0C],esi
>00032CF3    jmp         00032CF9
 00032CF5    inc         esi
 00032CF6    dec         edi
>00032CF7    jne         00032CBE
 00032CF9    cmp         dword ptr [ebp-0C],0FFFFFFFF
>00032CFD    jne         00032D7E
 00032CFF    mov         eax,dword ptr [ebx+10]
 00032D02    mov         edx,dword ptr [eax]
 00032D04    call        dword ptr [edx+14]
 00032D07    mov         dword ptr [ebp-0C],eax
 00032D0A    mov         eax,dword ptr [ebp-4]
 00032D0D    push        eax
 00032D0E    mov         eax,dword ptr [ebp+0C]
 00032D11    push        eax
 00032D12    mov         ecx,dword ptr [ebp-8]
 00032D15    mov         dl,1
 00032D17    mov         eax,[000324D0];TPrinterDevice
 00032D1C    call        TPrinterDevice.Create
 00032D21    push        eax
 00032D22    lea         eax,[ebp-0B0]
 00032D28    push        eax
 00032D29    lea         edx,[ebp-0B4]
 00032D2F    mov         eax,[000B570C];^SDeviceOnPort:TResStringRec
 00032D34    call        LoadResString
 00032D39    mov         eax,dword ptr [ebp-0B4]
 00032D3F    mov         edx,dword ptr [ebp-4]
 00032D42    mov         dword ptr [ebp-0C4],edx
 00032D48    mov         byte ptr [ebp-0C0],6
 00032D4F    mov         edx,dword ptr [ebp+0C]
 00032D52    mov         dword ptr [ebp-0BC],edx
 00032D58    mov         byte ptr [ebp-0B8],6
 00032D5F    lea         edx,[ebp-0C4]
 00032D65    mov         ecx,1
 00032D6A    call        Format
 00032D6F    mov         edx,dword ptr [ebp-0B0]
 00032D75    mov         eax,dword ptr [ebx+10]
 00032D78    pop         ecx
 00032D79    mov         esi,dword ptr [eax]
 00032D7B    call        dword ptr [esi+38]
 00032D7E    mov         eax,dword ptr [ebp-0C]
 00032D81    mov         dword ptr [ebx+14],eax
 00032D84    push        0
 00032D86    lea         eax,[ebx+2C]
 00032D89    push        eax
 00032D8A    mov         eax,dword ptr [ebp-4]
 00032D8D    push        eax
 00032D8E    call        winspool.OpenPrinterA
 00032D93    test        eax,eax
>00032D95    je          00032E1D
 00032D9B    cmp         dword ptr [ebx+28],0
>00032D9F    jne         00032E0A
 00032DA1    push        0
 00032DA3    lea         eax,[ebp-0AC]
 00032DA9    push        eax
 00032DAA    lea         eax,[ebp-0AC]
 00032DB0    push        eax
 00032DB1    mov         eax,dword ptr [ebp-4]
 00032DB4    push        eax
 00032DB5    mov         eax,dword ptr [ebx+2C]
 00032DB8    push        eax
 00032DB9    push        0
 00032DBB    call        winspool.DocumentPropertiesA
 00032DC0    push        eax
 00032DC1    push        42
 00032DC3    call        kernel32.GlobalAlloc
 00032DC8    mov         esi,eax
 00032DCA    mov         dword ptr [ebx+28],esi
 00032DCD    test        esi,esi
>00032DCF    je          00032E0A
 00032DD1    push        esi
 00032DD2    call        kernel32.GlobalLock
 00032DD7    mov         edi,eax
 00032DD9    mov         dword ptr [ebx+24],edi
 00032DDC    push        2
 00032DDE    push        edi
 00032DDF    push        edi
 00032DE0    mov         eax,dword ptr [ebp-4]
 00032DE3    push        eax
 00032DE4    mov         eax,dword ptr [ebx+2C]
 00032DE7    push        eax
 00032DE8    push        0
 00032DEA    call        winspool.DocumentPropertiesA
 00032DEF    test        eax,eax
>00032DF1    jge         00032E0A
 00032DF3    mov         eax,dword ptr [ebx+28]
 00032DF6    push        eax
 00032DF7    call        kernel32.GlobalUnlock
 00032DFC    mov         eax,dword ptr [ebx+28]
 00032DFF    push        eax
 00032E00    call        kernel32.GlobalFree
 00032E05    xor         eax,eax
 00032E07    mov         dword ptr [ebx+28],eax
 00032E0A    cmp         dword ptr [ebx+28],0
>00032E0E    je          00032E1D
 00032E10    mov         eax,dword ptr [ebx+24]
 00032E13    mov         edx,dword ptr [eax+28]
 00032E16    mov         eax,ebx
 00032E18    call        TPrinter.SetPrinterCapabilities
 00032E1D    xor         eax,eax
 00032E1F    pop         edx
 00032E20    pop         ecx
 00032E21    pop         ecx
 00032E22    mov         dword ptr fs:[eax],edx
 00032E25    push        32E42
 00032E2A    lea         eax,[ebp-0B4]
 00032E30    mov         edx,2
 00032E35    call        @LStrArrayClr
 00032E3A    ret
>00032E3B    jmp         @HandleFinally
>00032E40    jmp         00032E2A
 00032E42    pop         edi
 00032E43    pop         esi
 00032E44    pop         ebx
 00032E45    mov         esp,ebp
 00032E47    pop         ebp
 00032E48    ret         8
*}
end;

//00032E4C
function TPrinter.GetCanvas:TCanvas;
begin
{*
 00032E4C    push        ebx
 00032E4D    mov         ebx,eax
 00032E4F    cmp         dword ptr [ebx+4],0
>00032E53    jne         00032E66
 00032E55    mov         ecx,ebx
 00032E57    mov         dl,1
 00032E59    mov         eax,[0003262C];TPrinterCanvas
 00032E5E    call        TPrinterCanvas.Create
 00032E63    mov         dword ptr [ebx+4],eax
 00032E66    mov         eax,dword ptr [ebx+4]
 00032E69    pop         ebx
 00032E6A    ret
*}
end;

//00032E6C
function TPrinter.GetHandle:HDC;
begin
{*
 00032E6C    push        ebx
 00032E6D    mov         ebx,eax
 00032E6F    mov         dl,1
 00032E71    mov         eax,ebx
 00032E73    call        TPrinter.SetState
 00032E78    mov         eax,dword ptr [ebx+20]
 00032E7B    pop         ebx
 00032E7C    ret
*}
end;

//00032E80
function TPrinter.GetNumCopies:Integer;
begin
{*
 00032E80    push        ebp
 00032E81    mov         ebp,esp
 00032E83    push        0
 00032E85    push        ebx
 00032E86    mov         ebx,eax
 00032E88    xor         eax,eax
 00032E8A    push        ebp
 00032E8B    push        32ED7
 00032E90    push        dword ptr fs:[eax]
 00032E93    mov         dword ptr fs:[eax],esp
 00032E96    mov         eax,ebx
 00032E98    call        TPrinter.GetPrinterIndex
 00032E9D    cmp         dword ptr [ebx+28],0
>00032EA1    jne         00032EB8
 00032EA3    lea         edx,[ebp-4]
 00032EA6    mov         eax,[000B5BFC];^SInvalidPrinterOp:TResStringRec
 00032EAB    call        LoadResString
 00032EB0    mov         eax,dword ptr [ebp-4]
 00032EB3    call        RaiseError
 00032EB8    mov         eax,dword ptr [ebx+24]
 00032EBB    movsx       eax,word ptr [eax+36]
 00032EBF    mov         ebx,eax
 00032EC1    xor         eax,eax
 00032EC3    pop         edx
 00032EC4    pop         ecx
 00032EC5    pop         ecx
 00032EC6    mov         dword ptr fs:[eax],edx
 00032EC9    push        32EDE
 00032ECE    lea         eax,[ebp-4]
 00032ED1    call        @LStrClr
 00032ED6    ret
>00032ED7    jmp         @HandleFinally
>00032EDC    jmp         00032ECE
 00032EDE    mov         eax,ebx
 00032EE0    pop         ebx
 00032EE1    pop         ecx
 00032EE2    pop         ebp
 00032EE3    ret
*}
end;

//00032EE4
procedure TPrinter.SetNumCopies(Value:Integer);
begin
{*
 00032EE4    push        ebp
 00032EE5    mov         ebp,esp
 00032EE7    push        0
 00032EE9    push        ebx
 00032EEA    push        esi
 00032EEB    mov         esi,edx
 00032EED    mov         ebx,eax
 00032EEF    xor         eax,eax
 00032EF1    push        ebp
 00032EF2    push        32F4E
 00032EF7    push        dword ptr fs:[eax]
 00032EFA    mov         dword ptr fs:[eax],esp
 00032EFD    xor         edx,edx
 00032EFF    mov         eax,ebx
 00032F01    call        TPrinter.CheckPrinting
 00032F06    mov         eax,ebx
 00032F08    call        TPrinter.GetPrinterIndex
 00032F0D    cmp         dword ptr [ebx+28],0
>00032F11    jne         00032F28
 00032F13    lea         edx,[ebp-4]
 00032F16    mov         eax,[000B5BFC];^SInvalidPrinterOp:TResStringRec
 00032F1B    call        LoadResString
 00032F20    mov         eax,dword ptr [ebp-4]
 00032F23    call        RaiseError
 00032F28    xor         edx,edx
 00032F2A    mov         eax,ebx
 00032F2C    call        TPrinter.SetState
 00032F31    mov         eax,dword ptr [ebx+24]
 00032F34    mov         word ptr [eax+36],si
 00032F38    xor         eax,eax
 00032F3A    pop         edx
 00032F3B    pop         ecx
 00032F3C    pop         ecx
 00032F3D    mov         dword ptr fs:[eax],edx
 00032F40    push        32F55
 00032F45    lea         eax,[ebp-4]
 00032F48    call        @LStrClr
 00032F4D    ret
>00032F4E    jmp         @HandleFinally
>00032F53    jmp         00032F45
 00032F55    pop         esi
 00032F56    pop         ebx
 00032F57    pop         ecx
 00032F58    pop         ebp
 00032F59    ret
*}
end;

//00032F5C
function TPrinter.GetOrientation:TPrinterOrientation;
begin
{*
 00032F5C    push        ebp
 00032F5D    mov         ebp,esp
 00032F5F    push        0
 00032F61    push        ebx
 00032F62    mov         ebx,eax
 00032F64    xor         eax,eax
 00032F66    push        ebp
 00032F67    push        32FBA
 00032F6C    push        dword ptr fs:[eax]
 00032F6F    mov         dword ptr fs:[eax],esp
 00032F72    mov         eax,ebx
 00032F74    call        TPrinter.GetPrinterIndex
 00032F79    cmp         dword ptr [ebx+28],0
>00032F7D    jne         00032F94
 00032F7F    lea         edx,[ebp-4]
 00032F82    mov         eax,[000B5BFC];^SInvalidPrinterOp:TResStringRec
 00032F87    call        LoadResString
 00032F8C    mov         eax,dword ptr [ebp-4]
 00032F8F    call        RaiseError
 00032F94    mov         eax,dword ptr [ebx+24]
 00032F97    cmp         word ptr [eax+2C],1
>00032F9C    jne         00032FA2
 00032F9E    xor         ebx,ebx
>00032FA0    jmp         00032FA4
 00032FA2    mov         bl,1
 00032FA4    xor         eax,eax
 00032FA6    pop         edx
 00032FA7    pop         ecx
 00032FA8    pop         ecx
 00032FA9    mov         dword ptr fs:[eax],edx
 00032FAC    push        32FC1
 00032FB1    lea         eax,[ebp-4]
 00032FB4    call        @LStrClr
 00032FB9    ret
>00032FBA    jmp         @HandleFinally
>00032FBF    jmp         00032FB1
 00032FC1    mov         eax,ebx
 00032FC3    pop         ebx
 00032FC4    pop         ecx
 00032FC5    pop         ebp
 00032FC6    ret
*}
end;

//00032FC8
procedure TPrinter.SetOrientation(Value:TPrinterOrientation);
begin
{*
 00032FC8    push        ebp
 00032FC9    mov         ebp,esp
 00032FCB    push        0
 00032FCD    push        ebx
 00032FCE    push        esi
 00032FCF    mov         ebx,edx
 00032FD1    mov         esi,eax
 00032FD3    xor         eax,eax
 00032FD5    push        ebp
 00032FD6    push        3303E
 00032FDB    push        dword ptr fs:[eax]
 00032FDE    mov         dword ptr fs:[eax],esp
 00032FE1    xor         edx,edx
 00032FE3    mov         eax,esi
 00032FE5    call        TPrinter.CheckPrinting
 00032FEA    mov         eax,esi
 00032FEC    call        TPrinter.GetPrinterIndex
 00032FF1    cmp         dword ptr [esi+28],0
>00032FF5    jne         0003300C
 00032FF7    lea         edx,[ebp-4]
 00032FFA    mov         eax,[000B5BFC];^SInvalidPrinterOp:TResStringRec
 00032FFF    call        LoadResString
 00033004    mov         eax,dword ptr [ebp-4]
 00033007    call        RaiseError
 0003300C    xor         edx,edx
 0003300E    mov         eax,esi
 00033010    call        TPrinter.SetState
 00033015    xor         eax,eax
 00033017    mov         al,bl
 00033019    mov         ax,word ptr [eax*4+0B4670]
 00033021    mov         edx,dword ptr [esi+24]
 00033024    mov         word ptr [edx+2C],ax
 00033028    xor         eax,eax
 0003302A    pop         edx
 0003302B    pop         ecx
 0003302C    pop         ecx
 0003302D    mov         dword ptr fs:[eax],edx
 00033030    push        33045
 00033035    lea         eax,[ebp-4]
 00033038    call        @LStrClr
 0003303D    ret
>0003303E    jmp         @HandleFinally
>00033043    jmp         00033035
 00033045    pop         esi
 00033046    pop         ebx
 00033047    pop         ecx
 00033048    pop         ebp
 00033049    ret
*}
end;

//0003304C
function TPrinter.GetPrinterIndex:Integer;
begin
{*
 0003304C    push        ebx
 0003304D    mov         ebx,eax
 0003304F    cmp         dword ptr [ebx+14],0FFFFFFFF
>00033053    jne         0003305C
 00033055    mov         eax,ebx
 00033057    call        TPrinter.SetToDefaultPrinter
 0003305C    mov         eax,dword ptr [ebx+14]
 0003305F    pop         ebx
 00033060    ret
*}
end;

//00033064
procedure TPrinter.SetPrinterIndex(Value:Integer);
begin
{*
 00033064    push        ebp
 00033065    mov         ebp,esp
 00033067    push        0
 00033069    push        ebx
 0003306A    push        esi
 0003306B    mov         esi,edx
 0003306D    mov         ebx,eax
 0003306F    xor         eax,eax
 00033071    push        ebp
 00033072    push        330F0
 00033077    push        dword ptr fs:[eax]
 0003307A    mov         dword ptr fs:[eax],esp
 0003307D    xor         edx,edx
 0003307F    mov         eax,ebx
 00033081    call        TPrinter.CheckPrinting
 00033086    cmp         esi,0FFFFFFFF
>00033089    je          00033095
 0003308B    mov         eax,ebx
 0003308D    call        TPrinter.GetPrinterIndex
 00033092    inc         eax
>00033093    jne         0003309E
 00033095    mov         eax,ebx
 00033097    call        TPrinter.SetToDefaultPrinter
>0003309C    jmp         000330C7
 0003309E    test        esi,esi
>000330A0    jl          000330B2
 000330A2    mov         eax,ebx
 000330A4    call        TPrinter.GetPrinters
 000330A9    mov         edx,dword ptr [eax]
 000330AB    call        dword ptr [edx+14]
 000330AE    cmp         esi,eax
>000330B0    jl          000330C7
 000330B2    lea         edx,[ebp-4]
 000330B5    mov         eax,[000B59DC];^SPrinterIndexError:TResStringRec
 000330BA    call        LoadResString
 000330BF    mov         eax,dword ptr [ebp-4]
 000330C2    call        RaiseError
 000330C7    mov         dword ptr [ebx+14],esi
 000330CA    mov         eax,ebx
 000330CC    call        TPrinter.FreeFonts
 000330D1    xor         edx,edx
 000330D3    mov         eax,ebx
 000330D5    call        TPrinter.SetState
 000330DA    xor         eax,eax
 000330DC    pop         edx
 000330DD    pop         ecx
 000330DE    pop         ecx
 000330DF    mov         dword ptr fs:[eax],edx
 000330E2    push        330F7
 000330E7    lea         eax,[ebp-4]
 000330EA    call        @LStrClr
 000330EF    ret
>000330F0    jmp         @HandleFinally
>000330F5    jmp         000330E7
 000330F7    pop         esi
 000330F8    pop         ebx
 000330F9    pop         ecx
 000330FA    pop         ebp
 000330FB    ret
*}
end;

//000330FC
function TPrinter.GetPrinters:TStrings;
begin
{*
 000330FC    push        ebp
 000330FD    mov         ebp,esp
 000330FF    add         esp,0FFFFFFCC
 00033102    push        ebx
 00033103    push        esi
 00033104    push        edi
 00033105    xor         edx,edx
 00033107    mov         dword ptr [ebp-20],edx
 0003310A    mov         dword ptr [ebp-24],edx
 0003310D    mov         dword ptr [ebp-4],eax
 00033110    xor         eax,eax
 00033112    push        ebp
 00033113    push        33328
 00033118    push        dword ptr fs:[eax]
 0003311B    mov         dword ptr fs:[eax],esp
 0003311E    mov         eax,dword ptr [ebp-4]
 00033121    cmp         dword ptr [eax+10],0
>00033125    jne         00033307
 0003312B    mov         dl,1
 0003312D    mov         eax,[0001F340];TStringList
 00033132    call        TObject.Create
 00033137    mov         ebx,eax
 00033139    mov         eax,dword ptr [ebp-4]
 0003313C    mov         dword ptr [eax+10],ebx
 0003313F    mov         edi,ebx
 00033141    xor         edx,edx
 00033143    push        ebp
 00033144    push        332E5
 00033149    push        dword ptr fs:[edx]
 0003314C    mov         dword ptr fs:[edx],esp
 0003314F    mov         eax,[000B5C00]
 00033154    cmp         dword ptr [eax],2
>00033157    jne         00033162
 00033159    mov         esi,6
 0003315E    mov         bl,4
>00033160    jmp         00033169
 00033162    mov         esi,2
 00033167    mov         bl,5
 00033169    xor         eax,eax
 0003316B    mov         dword ptr [ebp-14],eax
 0003316E    lea         eax,[ebp-18]
 00033171    push        eax
 00033172    lea         eax,[ebp-14]
 00033175    push        eax
 00033176    push        0
 00033178    push        0
 0003317A    xor         eax,eax
 0003317C    mov         al,bl
 0003317E    push        eax
 0003317F    push        0
 00033181    push        esi
 00033182    call        winspool.EnumPrintersA
 00033187    cmp         dword ptr [ebp-14],0
>0003318B    jne         0003319A
 0003318D    xor         eax,eax
 0003318F    pop         edx
 00033190    pop         ecx
 00033191    pop         ecx
 00033192    mov         dword ptr fs:[eax],edx
>00033195    jmp         0003330D
 0003319A    mov         eax,dword ptr [ebp-14]
 0003319D    call        @GetMem
 000331A2    mov         dword ptr [ebp-0C],eax
 000331A5    xor         edx,edx
 000331A7    push        ebp
 000331A8    push        332D4
 000331AD    push        dword ptr fs:[edx]
 000331B0    mov         dword ptr fs:[edx],esp
 000331B3    lea         eax,[ebp-18]
 000331B6    push        eax
 000331B7    lea         eax,[ebp-14]
 000331BA    push        eax
 000331BB    mov         eax,dword ptr [ebp-14]
 000331BE    push        eax
 000331BF    mov         eax,dword ptr [ebp-0C]
 000331C2    push        eax
 000331C3    xor         eax,eax
 000331C5    mov         al,bl
 000331C7    push        eax
 000331C8    push        0
 000331CA    push        esi
 000331CB    call        winspool.EnumPrintersA
 000331D0    test        eax,eax
>000331D2    jne         000331E6
 000331D4    call        @TryFinallyExit
 000331D9    xor         eax,eax
 000331DB    pop         edx
 000331DC    pop         ecx
 000331DD    pop         ecx
 000331DE    mov         dword ptr fs:[eax],edx
>000331E1    jmp         0003330D
 000331E6    mov         eax,dword ptr [ebp-0C]
 000331E9    mov         dword ptr [ebp-10],eax
 000331EC    mov         eax,dword ptr [ebp-18]
 000331EF    dec         eax
 000331F0    test        eax,eax
>000331F2    jl          000332BB
 000331F8    inc         eax
 000331F9    mov         dword ptr [ebp-1C],eax
 000331FC    cmp         bl,4
>000331FF    jne         00033237
 00033201    mov         esi,dword ptr [ebp-10]
 00033204    mov         edi,dword ptr [esi]
 00033206    push        edi
 00033207    push        0
 00033209    xor         ecx,ecx
 0003320B    mov         dl,1
 0003320D    mov         eax,[000324D0];TPrinterDevice
 00033212    call        TPrinterDevice.Create
 00033217    push        eax
 00033218    lea         eax,[ebp-20]
 0003321B    mov         edx,edi
 0003321D    call        @LStrFromPChar
 00033222    mov         edx,dword ptr [ebp-20]
 00033225    mov         eax,dword ptr [ebp-4]
 00033228    mov         eax,dword ptr [eax+10]
 0003322B    pop         ecx
 0003322C    mov         esi,dword ptr [eax]
 0003322E    call        dword ptr [esi+38]
 00033231    add         dword ptr [ebp-10],0C
>00033235    jmp         000332B2
 00033237    mov         esi,dword ptr [ebp-10]
 0003323A    mov         eax,dword ptr [esi+4]
 0003323D    mov         dword ptr [ebp-8],eax
 00033240    lea         eax,[ebp-8]
 00033243    call        FetchStr
 00033248    mov         edi,eax
>0003324A    jmp         000332A9
 0003324C    mov         eax,dword ptr [esi]
 0003324E    push        eax
 0003324F    push        edi
 00033250    xor         ecx,ecx
 00033252    mov         dl,1
 00033254    mov         eax,[000324D0];TPrinterDevice
 00033259    call        TPrinterDevice.Create
 0003325E    push        eax
 0003325F    lea         eax,[ebp-20]
 00033262    push        eax
 00033263    lea         edx,[ebp-24]
 00033266    mov         eax,[000B570C];^SDeviceOnPort:TResStringRec
 0003326B    call        LoadResString
 00033270    mov         eax,dword ptr [ebp-24]
 00033273    mov         edx,dword ptr [esi]
 00033275    mov         dword ptr [ebp-34],edx
 00033278    mov         byte ptr [ebp-30],6
 0003327C    mov         dword ptr [ebp-2C],edi
 0003327F    mov         byte ptr [ebp-28],6
 00033283    lea         edx,[ebp-34]
 00033286    mov         ecx,1
 0003328B    call        Format
 00033290    mov         edx,dword ptr [ebp-20]
 00033293    mov         eax,dword ptr [ebp-4]
 00033296    mov         eax,dword ptr [eax+10]
 00033299    pop         ecx
 0003329A    mov         edi,dword ptr [eax]
 0003329C    call        dword ptr [edi+38]
 0003329F    lea         eax,[ebp-8]
 000332A2    call        FetchStr
 000332A7    mov         edi,eax
 000332A9    cmp         byte ptr [edi],0
>000332AC    jne         0003324C
 000332AE    add         dword ptr [ebp-10],14
 000332B2    dec         dword ptr [ebp-1C]
>000332B5    jne         000331FC
 000332BB    xor         eax,eax
 000332BD    pop         edx
 000332BE    pop         ecx
 000332BF    pop         ecx
 000332C0    mov         dword ptr fs:[eax],edx
 000332C3    push        332DB
 000332C8    mov         edx,dword ptr [ebp-14]
 000332CB    mov         eax,dword ptr [ebp-0C]
 000332CE    call        @FreeMem
 000332D3    ret
>000332D4    jmp         @HandleFinally
>000332D9    jmp         000332C8
 000332DB    xor         eax,eax
 000332DD    pop         edx
 000332DE    pop         ecx
 000332DF    pop         ecx
 000332E0    mov         dword ptr fs:[eax],edx
>000332E3    jmp         00033307
>000332E5    jmp         @HandleAnyException
 000332EA    mov         eax,dword ptr [ebp-4]
 000332ED    mov         eax,dword ptr [eax+10]
 000332F0    call        TObject.Free
 000332F5    mov         eax,dword ptr [ebp-4]
 000332F8    xor         edx,edx
 000332FA    mov         dword ptr [eax+10],edx
 000332FD    call        @RaiseAgain
 00033302    call        @DoneExcept
 00033307    mov         eax,dword ptr [ebp-4]
 0003330A    mov         edi,dword ptr [eax+10]
 0003330D    xor         eax,eax
 0003330F    pop         edx
 00033310    pop         ecx
 00033311    pop         ecx
 00033312    mov         dword ptr fs:[eax],edx
 00033315    push        3332F
 0003331A    lea         eax,[ebp-24]
 0003331D    mov         edx,2
 00033322    call        @LStrArrayClr
 00033327    ret
>00033328    jmp         @HandleFinally
>0003332D    jmp         0003331A
 0003332F    mov         eax,edi
 00033331    pop         edi
 00033332    pop         esi
 00033333    pop         ebx
 00033334    mov         esp,ebp
 00033336    pop         ebp
 00033337    ret
*}
end;

//00033338
procedure TPrinter.SetToDefaultPrinter;
begin
{*
 00033338    push        ebp
 00033339    mov         ebp,esp
 0003333B    add         esp,0FFFFFF94
 0003333E    push        ebx
 0003333F    push        esi
 00033340    push        edi
 00033341    xor         edx,edx
 00033343    mov         dword ptr [ebp-6C],edx
 00033346    mov         dword ptr [ebp-4],eax
 00033349    xor         eax,eax
 0003334B    push        ebp
 0003334C    push        334BD
 00033351    push        dword ptr fs:[eax]
 00033354    mov         dword ptr fs:[eax],esp
 00033357    xor         eax,eax
 00033359    mov         dword ptr [ebp-8],eax
 0003335C    xor         eax,eax
 0003335E    mov         dword ptr [ebp-0C],eax
 00033361    lea         eax,[ebp-0C]
 00033364    push        eax
 00033365    lea         eax,[ebp-8]
 00033368    push        eax
 00033369    push        0
 0003336B    push        0
 0003336D    push        5
 0003336F    push        0
 00033371    push        1
 00033373    call        winspool.EnumPrintersA
 00033378    test        eax,eax
>0003337A    jne         0003338B
 0003337C    call        kernel32.GetLastError
 00033381    cmp         eax,7A
>00033384    je          0003338B
 00033386    call        RaiseLastWin32Error
 0003338B    mov         eax,dword ptr [ebp-8]
 0003338E    call        AllocMem
 00033393    mov         dword ptr [ebp-18],eax
 00033396    xor         eax,eax
 00033398    push        ebp
 00033399    push        3348B
 0003339E    push        dword ptr fs:[eax]
 000333A1    mov         dword ptr fs:[eax],esp
 000333A4    lea         eax,[ebp-0C]
 000333A7    push        eax
 000333A8    lea         eax,[ebp-8]
 000333AB    push        eax
 000333AC    mov         eax,dword ptr [ebp-8]
 000333AF    push        eax
 000333B0    mov         eax,dword ptr [ebp-18]
 000333B3    push        eax
 000333B4    push        5
 000333B6    push        0
 000333B8    push        1
 000333BA    call        winspool.EnumPrintersA
 000333BF    cmp         dword ptr [ebp-0C],0
>000333C3    jbe         000333CF
 000333C5    mov         eax,dword ptr [ebp-18]
 000333C8    mov         eax,dword ptr [eax]
 000333CA    mov         dword ptr [ebp-14],eax
>000333CD    jmp         000333FA
 000333CF    push        4F
 000333D1    lea         eax,[ebp-68]
 000333D4    push        eax
 000333D5    push        334CC
 000333DA    push        334D0
 000333DF    push        334D8
 000333E4    call        kernel32.GetProfileStringA
 000333E9    lea         eax,[ebp-68]
 000333EC    mov         dword ptr [ebp-10],eax
 000333EF    lea         eax,[ebp-10]
 000333F2    call        FetchStr
 000333F7    mov         dword ptr [ebp-14],eax
 000333FA    mov         eax,dword ptr [ebp-4]
 000333FD    call        TPrinter.GetPrinters
 00033402    mov         edi,eax
 00033404    mov         eax,edi
 00033406    mov         edx,dword ptr [eax]
 00033408    call        dword ptr [edx+14]
 0003340B    mov         esi,eax
 0003340D    dec         esi
 0003340E    test        esi,esi
>00033410    jl          00033475
 00033412    inc         esi
 00033413    xor         ebx,ebx
 00033415    mov         edx,ebx
 00033417    mov         eax,edi
 00033419    mov         ecx,dword ptr [eax]
 0003341B    call        dword ptr [ecx+18]
 0003341E    mov         eax,dword ptr [eax+8]
 00033421    push        eax
 00033422    lea         eax,[ebp-6C]
 00033425    mov         edx,dword ptr [ebp-14]
 00033428    call        @LStrFromPChar
 0003342D    mov         edx,dword ptr [ebp-6C]
 00033430    pop         eax
 00033431    call        @LStrCmp
>00033436    jne         00033471
 00033438    mov         edx,ebx
 0003343A    mov         eax,edi
 0003343C    mov         ecx,dword ptr [eax]
 0003343E    call        dword ptr [ecx+18]
 00033441    mov         ebx,eax
 00033443    mov         eax,dword ptr [ebx+0C]
 00033446    call        @LStrToPChar
 0003344B    push        eax
 0003344C    push        0
 0003344E    mov         eax,dword ptr [ebx+4]
 00033451    call        @LStrToPChar
 00033456    push        eax
 00033457    mov         eax,dword ptr [ebx+8]
 0003345A    call        @LStrToPChar
 0003345F    mov         edx,eax
 00033461    mov         eax,dword ptr [ebp-4]
 00033464    pop         ecx
 00033465    call        TPrinter.SetPrinter
 0003346A    call        @TryFinallyExit
>0003346F    jmp         000334A7
 00033471    inc         ebx
 00033472    dec         esi
>00033473    jne         00033415
 00033475    xor         eax,eax
 00033477    pop         edx
 00033478    pop         ecx
 00033479    pop         ecx
 0003347A    mov         dword ptr fs:[eax],edx
 0003347D    push        33492
 00033482    mov         eax,dword ptr [ebp-18]
 00033485    call        @FreeMem
 0003348A    ret
>0003348B    jmp         @HandleFinally
>00033490    jmp         00033482
 00033492    lea         edx,[ebp-6C]
 00033495    mov         eax,[000B577C];^SNoDefaultPrinter:TResStringRec
 0003349A    call        LoadResString
 0003349F    mov         eax,dword ptr [ebp-6C]
 000334A2    call        RaiseError
 000334A7    xor         eax,eax
 000334A9    pop         edx
 000334AA    pop         ecx
 000334AB    pop         ecx
 000334AC    mov         dword ptr fs:[eax],edx
 000334AF    push        334C4
 000334B4    lea         eax,[ebp-6C]
 000334B7    call        @LStrClr
 000334BC    ret
>000334BD    jmp         @HandleFinally
>000334C2    jmp         000334B4
 000334C4    pop         edi
 000334C5    pop         esi
 000334C6    pop         ebx
 000334C7    mov         esp,ebp
 000334C9    pop         ebp
 000334CA    ret
*}
end;

//000334E0
procedure TPrinter.FreePrinters;
begin
{*
 000334E0    push        ebx
 000334E1    push        esi
 000334E2    push        edi
 000334E3    mov         ebx,eax
 000334E5    mov         esi,dword ptr [ebx+10]
 000334E8    test        esi,esi
>000334EA    je          0003351D
 000334EC    mov         eax,esi
 000334EE    mov         edx,dword ptr [eax]
 000334F0    call        dword ptr [edx+14]
 000334F3    dec         eax
 000334F4    test        eax,eax
>000334F6    jl          00033510
 000334F8    inc         eax
 000334F9    mov         esi,eax
 000334FB    xor         edi,edi
 000334FD    mov         edx,edi
 000334FF    mov         eax,dword ptr [ebx+10]
 00033502    mov         ecx,dword ptr [eax]
 00033504    call        dword ptr [ecx+18]
 00033507    call        TObject.Free
 0003350C    inc         edi
 0003350D    dec         esi
>0003350E    jne         000334FD
 00033510    mov         eax,dword ptr [ebx+10]
 00033513    call        TObject.Free
 00033518    xor         eax,eax
 0003351A    mov         dword ptr [ebx+10],eax
 0003351D    pop         edi
 0003351E    pop         esi
 0003351F    pop         ebx
 00033520    ret
*}
end;

//00033524
procedure TPrinter.FreeFonts;
begin
{*
 00033524    push        ebx
 00033525    mov         ebx,eax
 00033527    mov         eax,dword ptr [ebx+8]
 0003352A    call        TObject.Free
 0003352F    xor         eax,eax
 00033531    mov         dword ptr [ebx+8],eax
 00033534    pop         ebx
 00033535    ret
*}
end;

//00033538
function Printer:TPrinter;
begin
{*
 00033538    cmp         dword ptr ds:[0B466C],0
>0003353F    jne         00033552
 00033541    mov         dl,1
 00033543    mov         eax,[000323F8];TPrinter
 00033548    call        TPrinter.Create
 0003354D    mov         [000B466C],eax
 00033552    mov         eax,[000B466C]
 00033557    ret
*}
end;

Initialization
Finalization
//00033558
{*
 00033558    push        ebp
 00033559    mov         ebp,esp
 0003355B    xor         eax,eax
 0003355D    push        ebp
 0003355E    push        33589
 00033563    push        dword ptr fs:[eax]
 00033566    mov         dword ptr fs:[eax],esp
 00033569    inc         dword ptr ds:[0B66E0]
>0003356F    jne         0003357B
 00033571    mov         eax,[000B466C]
 00033576    call        TObject.Free
 0003357B    xor         eax,eax
 0003357D    pop         edx
 0003357E    pop         ecx
 0003357F    pop         ecx
 00033580    mov         dword ptr fs:[eax],edx
 00033583    push        33590
 00033588    ret
>00033589    jmp         @HandleFinally
>0003358E    jmp         00033588
 00033590    pop         ebp
 00033591    ret
*}
end.