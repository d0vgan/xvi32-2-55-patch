//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit Dialogs;

interface

uses
  SysUtils, Classes;

type
  TCommonDialog = class(TComponent)
  public
    Ctl3D:Boolean;//f24
    FDefWndProc:Pointer;//f28
    HelpContext:THelpContext;//f2C
    FHandle:HWND;//f30
    FObjectInstance:Pointer;//f34
    FTemplate:PChar;//f38
    OnClose:TNotifyEvent;//f3C
    OnShow:TNotifyEvent;//f44
    procedure DefaultHandler(var Message:void ); virtual;//000641CC
    destructor Destroy; virtual;//00064170
    constructor Create(AOwner:TComponent); virtual;//v2C//00064128
    procedure WndProc(var Message:TMessage); virtual;//v30//00064250
    function MessageHook(var Msg:TMessage):Boolean; virtual;//v34//000641A4
    function TaskModalDialog(DialogFunc:Pointer; var DialogData:void ):BOOL; virtual;//v38//000642A0
    procedure Execute; virtual; abstract;//v3C//000129A8
    procedure WMDestroy(var Message:TWMDestroy); message WM_DESTROY;//00064258
    procedure WMNCDestroy(var Message:TWMNCDestroy); message WM_NCDESTROY;//0006428C
    procedure WMInitDialog(var Message:TWMInitDialog); message WM_INITDIALOG;//00064274
    procedure DoShow; dynamic;//0006437C
    procedure DoClose; dynamic;//00064368
    procedure MainWndProc(var Message:TMessage);//00064204
  end;
  TOpenOption = (ofReadOnly, ofOverwritePrompt, ofHideReadOnly, ofNoChangeDir, ofShowHelp, ofNoValidate, ofAllowMultiSelect, ofExtensionDifferent, ofPathMustExist, ofFileMustExist, ofCreatePrompt, ofShareAware, ofNoReadOnlyReturn, ofNoTestFileCreate, ofNoNetworkButton, ofNoLongNames, ofOldStyleDialog, ofNoDereferenceLinks, ofEnableIncludeNotify, ofEnableSizing);
  TOpenOptions = set of TOpenOption;
  TOpenDialog = class(TCommonDialog)
  public
    FHistoryList:TStrings;//f4C
    Options:TOpenOptions;//f50
    Filter:String;//f54
    FilterIndex:Integer;//f58
    FCurrentFilterIndex:Integer;//f5C
    InitialDir:String;//f60
    Title:String;//f64
    DefaultExt:String;//f68
    FileName:TFileName;//f6C
    FFiles:TStrings;//f70
    FFileEditStyle:TFileEditStyle;//f74
    OnSelectionChange:TNotifyEvent;//f78
    OnFolderChange:TNotifyEvent;//f80
    OnTypeChange:TNotifyEvent;//f88
    OnCanClose:TCloseQueryEvent;//f90
    destructor Destroy; virtual;//00064480
    procedure DefineProperties(Filer:TFiler); virtual;//v4//00064668
    constructor Create(AOwner:TComponent); virtual;//v2C//00064414
    procedure WndProc(var Message:TMessage); virtual;//v30//000644E0
    function Execute:Boolean; virtual;//v3C//00064C28
    function GetStaticRect:TRect; virtual;//v40//00064B14
    procedure DoTypeChange; dynamic;//0006460C
    procedure DoFolderChange; dynamic;//000645EC
    procedure DoSelectionChange; dynamic;//000645D8
    procedure DoCanClose; dynamic;//000645B0
    function CanClose(var OpenFileName:TOpenFilename):Boolean;//000644B8
    procedure ReadFileEditStyle(Reader:TReader);//0006462C
    function DoExecute(Func:Pointer):BOOL;//000646FC
    procedure GetFileNames(var OpenFileName:TOpenFilename);//00064A5C
    function GetFileName:TFileName;//00064B68
    function GetFilterIndex:Integer;//00064BC0
    procedure SetInitialDir(const Value:AnsiString);//00064BD0
  end;
  TSaveDialog = class(TOpenDialog)
  published
    procedure Execute;//00064C40
  public
    procedure Execute; virtual;//v3C//00064C40
  end;
  TMessageForm = class(TForm)
    constructor CreateNew(AOwner:TComponent);//00064E0C
    procedure HelpButtonClick(Sender:TObject);//00064E84
  end;
    procedure CenterWindow(Wnd:HWND);//00063FF4
    function DialogHook(Wnd:HWND; Msg:UINT; WParam:WPARAM; LParam:LPARAM):UINT; stdcall;//0006408C
    constructor Create(AOwner:TComponent);//00064128
    destructor Destroy;//00064170
    function MessageHook(var Msg:TMessage):Boolean;//000641A4
    procedure DefaultHandler(var Message:void );//000641CC
    procedure WndProc(var Message:TMessage);//00064250
    procedure WMDestroy(var Message:TWMDestroy);//00064258
    procedure WMInitDialog(var Message:TWMInitDialog);//00064274
    procedure WMNCDestroy(var Message:TWMNCDestroy);//0006428C
    function TaskModalDialog(DialogFunc:Pointer; var DialogData:void ):BOOL;//000642A0
    procedure DoClose;//00064368
    procedure DoShow;//0006437C
    function ExplorerHook(Wnd:HWND; Msg:UINT; WParam:WPARAM; LParam:LPARAM):UINT; stdcall;//00064390
    constructor Create(AOwner:TComponent);//00064414
    destructor Destroy;//00064480
    procedure WndProc(var Message:TMessage);//000644E0
    procedure DoCanClose;//000645B0
    procedure DoSelectionChange;//000645D8
    procedure DoFolderChange;//000645EC
    procedure DoTypeChange;//0006460C
    procedure DefineProperties(Filer:TFiler);//00064668
    function AllocFilterStr(const S:AnsiString):AnsiString;//000646AC
    function ExtractFileName(P:PChar; var S:TFileName):PChar;//00064914
    procedure ExtractFileNames(P:PChar);//0006495C
    function GetStaticRect:TRect;//00064B14
    function Execute:Boolean;//00064C28
    function Max(I:Integer; J:Integer):Integer;//00064C58
    function GetAveCharSize(Canvas:TCanvas):TPoint;//00064C60
    function CreateMessageDialog(const Msg:AnsiString; DlgType:TMsgDlgType; Buttons:TMsgDlgButtons):TForm;//00064F40
    function MessageDlg(const Msg:AnsiString; DlgType:TMsgDlgType; Buttons:TMsgDlgButtons; HelpCtx:Longint):Integer;//000654AC
    function MessageDlgPos(const Msg:AnsiString; DlgType:TMsgDlgType; Buttons:TMsgDlgButtons; HelpCtx:Longint; X:Integer; Y:Integer):Integer;//000654CC
    function MessageDlgPosHelp(const Msg:AnsiString; DlgType:TMsgDlgType; Buttons:TMsgDlgButtons; HelpCtx:Longint; X:Integer; Y:Integer; const HelpFileName:AnsiString):Integer;//000654F0
    procedure ShowMessage(const Msg:AnsiString);//000655A4
    procedure ShowMessagePos(const Msg:AnsiString; X:Integer; Y:Integer);//000655B0
    function InputQuery(const ACaption:AnsiString; const APrompt:AnsiString; var Value:AnsiString):Boolean;//000655C8
    procedure InitGlobals;//000658C0
    procedure _NF__45E;//0006595C

implementation

//00063FF4
procedure CenterWindow(Wnd:HWND);
begin
{*
 00063FF4    push        ebx
 00063FF5    push        esi
 00063FF6    push        edi
 00063FF7    add         esp,0FFFFFFF0
 00063FFA    mov         esi,eax
 00063FFC    push        esp
 00063FFD    push        esi
 00063FFE    call        user32.GetWindowRect
 00064003    mov         eax,[000B59E8];^Application:TApplication
 00064008    mov         eax,dword ptr [eax]
 0006400A    mov         eax,dword ptr [eax+30]
 0006400D    test        eax,eax
>0006400F    je          00064020
 00064011    mov         edx,dword ptr ds:[0B59E8];^Application:TApplication
 00064017    call        TCustomForm.GetMonitor
 0006401C    mov         ebx,eax
>0006401E    jmp         00064030
 00064020    mov         eax,[000B5BDC];^Screen:TScreen
 00064025    mov         eax,dword ptr [eax]
 00064027    xor         edx,edx
 00064029    call        TScreen.GetMonitor
 0006402E    mov         ebx,eax
 00064030    push        15
 00064032    push        0
 00064034    push        0
 00064036    mov         eax,ebx
 00064038    call        TMonitor.GetTop
 0006403D    mov         edi,eax
 0006403F    mov         eax,ebx
 00064041    call        TMonitor.GetHeight
 00064046    sub         eax,dword ptr [esp+18]
 0006404A    add         eax,dword ptr [esp+10]
 0006404E    mov         ecx,3
 00064053    cdq
 00064054    idiv        eax,ecx
 00064056    add         edi,eax
 00064058    push        edi
 00064059    mov         eax,ebx
 0006405B    call        TMonitor.GetLeft
 00064060    mov         edi,eax
 00064062    mov         eax,ebx
 00064064    call        TMonitor.GetWidth
 00064069    sub         eax,dword ptr [esp+18]
 0006406D    add         eax,dword ptr [esp+10]
 00064071    sar         eax,1
>00064073    jns         00064078
 00064075    adc         eax,0
 00064078    add         edi,eax
 0006407A    push        edi
 0006407B    push        0
 0006407D    push        esi
 0006407E    call        user32.SetWindowPos
 00064083    add         esp,10
 00064086    pop         edi
 00064087    pop         esi
 00064088    pop         ebx
 00064089    ret
*}
end;

//0006408C
function DialogHook(Wnd:HWND; Msg:UINT; WParam:WPARAM; LParam:LPARAM):UINT; stdcall;
begin
{*
 0006408C    push        ebp
 0006408D    mov         ebp,esp
 0006408F    push        ebx
 00064090    push        esi
 00064091    push        edi
 00064092    mov         esi,dword ptr [ebp+0C]
 00064095    mov         ebx,dword ptr [ebp+8]
 00064098    xor         edi,edi
 0006409A    mov         eax,esi
 0006409C    sub         eax,2
>0006409F    je          0006410D
 000640A1    sub         eax,10E
>000640A6    jne         0006411D
 000640A8    cmp         byte ptr ds:[0B680C],0
>000640AF    je          000640C3
 000640B1    mov         dx,0FFFF
 000640B5    mov         eax,ebx
 000640B7    call        Subclass3DDlg
 000640BC    mov         al,1
 000640BE    call        SetAutoSubClass
 000640C3    mov         eax,ebx
 000640C5    call        CenterWindow
 000640CA    mov         eax,[000B4AF8]
 000640CF    mov         dword ptr [eax+30],ebx
 000640D2    mov         eax,[000B4AF8]
 000640D7    mov         eax,dword ptr [eax+34]
 000640DA    push        eax
 000640DB    push        0FC
 000640DD    push        ebx
 000640DE    call        user32.SetWindowLongA
 000640E3    mov         edx,dword ptr ds:[0B4AF8]
 000640E9    mov         dword ptr [edx+28],eax
 000640EC    mov         eax,dword ptr [ebp+14]
 000640EF    push        eax
 000640F0    mov         eax,dword ptr [ebp+10]
 000640F3    push        eax
 000640F4    push        esi
 000640F5    push        ebx
 000640F6    mov         eax,[000B4AF8]
 000640FB    mov         eax,dword ptr [eax+34]
 000640FE    push        eax
 000640FF    call        user32.CallWindowProcA
 00064104    xor         eax,eax
 00064106    mov         [000B4AF8],eax
>0006410B    jmp         0006411D
 0006410D    cmp         byte ptr ds:[0B680C],0
>00064114    je          0006411D
 00064116    xor         eax,eax
 00064118    call        SetAutoSubClass
 0006411D    mov         eax,edi
 0006411F    pop         edi
 00064120    pop         esi
 00064121    pop         ebx
 00064122    pop         ebp
 00064123    ret         10
*}
end;

//00064128
constructor TCommonDialog.Create(AOwner:TComponent);
begin
{*
 00064128    push        ebx
 00064129    push        esi
 0006412A    test        dl,dl
>0006412C    je          00064136
 0006412E    add         esp,0FFFFFFF0
 00064131    call        @ClassCreate
 00064136    mov         ebx,edx
 00064138    mov         esi,eax
 0006413A    xor         edx,edx
 0006413C    mov         eax,esi
 0006413E    call        TComponent.Create
 00064143    mov         byte ptr [esi+24],1
 00064147    push        esi
 00064148    push        64204;TCommonDialog.MainWndProc
 0006414D    call        MakeObjectInstance
 00064152    mov         dword ptr [esi+34],eax
 00064155    mov         eax,esi
 00064157    test        bl,bl
>00064159    je          0006416A
 0006415B    call        @AfterConstruction
 00064160    pop         dword ptr fs:[0]
 00064167    add         esp,0C
 0006416A    mov         eax,esi
 0006416C    pop         esi
 0006416D    pop         ebx
 0006416E    ret
*}
end;

//00064170
destructor TCommonDialog.Destroy;
begin
{*
 00064170    push        ebx
 00064171    push        esi
 00064172    call        @BeforeDestruction
 00064177    mov         ebx,edx
 00064179    mov         esi,eax
 0006417B    mov         eax,dword ptr [esi+34]
 0006417E    test        eax,eax
>00064180    je          00064187
 00064182    call        FreeObjectInstance
 00064187    mov         edx,ebx
 00064189    and         dl,0FC
 0006418C    mov         eax,esi
 0006418E    call        TComponent.Destroy
 00064193    test        bl,bl
>00064195    jle         0006419E
 00064197    mov         eax,esi
 00064199    call        @ClassDestroy
 0006419E    pop         esi
 0006419F    pop         ebx
 000641A0    ret
*}
end;

//000641A4
function TCommonDialog.MessageHook(var Msg:TMessage):Boolean;
begin
{*
 000641A4    xor         ecx,ecx
 000641A6    mov         edx,dword ptr [edx]
 000641A8    cmp         edx,dword ptr ds:[0B6804]
>000641AE    jne         000641C9
 000641B0    cmp         dword ptr [eax+2C],0
>000641B4    je          000641C9
 000641B6    mov         edx,dword ptr ds:[0B59E8];^Application:TApplication
 000641BC    mov         edx,dword ptr [edx]
 000641BE    mov         eax,dword ptr [eax+2C]
 000641C1    xchg        eax,edx
 000641C2    call        TApplication.HelpContext
 000641C7    mov         cl,1
 000641C9    mov         eax,ecx
 000641CB    ret
*}
end;

//000641CC
procedure TCommonDialog.DefaultHandler(var Message:void );
begin
{*
 000641CC    push        ebx
 000641CD    push        esi
 000641CE    push        edi
 000641CF    mov         esi,edx
 000641D1    mov         ebx,eax
 000641D3    mov         edi,dword ptr [ebx+30]
 000641D6    test        edi,edi
>000641D8    je          000641F4
 000641DA    mov         eax,dword ptr [esi+8]
 000641DD    push        eax
 000641DE    mov         eax,dword ptr [esi+4]
 000641E1    push        eax
 000641E2    mov         eax,dword ptr [esi]
 000641E4    push        eax
 000641E5    push        edi
 000641E6    mov         eax,dword ptr [ebx+28]
 000641E9    push        eax
 000641EA    call        user32.CallWindowProcA
 000641EF    mov         dword ptr [esi+0C],eax
>000641F2    jmp         000641FD
 000641F4    mov         edx,esi
 000641F6    mov         eax,ebx
 000641F8    call        TObject.DefaultHandler
 000641FD    pop         edi
 000641FE    pop         esi
 000641FF    pop         ebx
 00064200    ret
*}
end;

//00064204
procedure TCommonDialog.MainWndProc(var Message:TMessage);
begin
{*
 00064204    push        ebp
 00064205    mov         ebp,esp
 00064207    push        ecx
 00064208    push        ebx
 00064209    push        esi
 0006420A    push        edi
 0006420B    mov         dword ptr [ebp-4],eax
 0006420E    xor         eax,eax
 00064210    push        ebp
 00064211    push        6422E
 00064216    push        dword ptr fs:[eax]
 00064219    mov         dword ptr fs:[eax],esp
 0006421C    mov         eax,dword ptr [ebp-4]
 0006421F    mov         ecx,dword ptr [eax]
 00064221    call        dword ptr [ecx+30]
 00064224    xor         eax,eax
 00064226    pop         edx
 00064227    pop         ecx
 00064228    pop         ecx
 00064229    mov         dword ptr fs:[eax],edx
>0006422C    jmp         00064247
>0006422E    jmp         @HandleAnyException
 00064233    mov         eax,[000B59E8];^Application:TApplication
 00064238    mov         eax,dword ptr [eax]
 0006423A    mov         edx,dword ptr [ebp-4]
 0006423D    call        TApplication.HandleException
 00064242    call        @DoneExcept
 00064247    pop         edi
 00064248    pop         esi
 00064249    pop         ebx
 0006424A    pop         ecx
 0006424B    pop         ebp
 0006424C    ret
*}
end;

//00064250
procedure TCommonDialog.WndProc(var Message:TMessage);
begin
{*
 00064250    mov         ecx,dword ptr [eax]
 00064252    call        dword ptr [ecx-14]
 00064255    ret
*}
end;

//00064258
procedure TCommonDialog.WMDestroy(var Message:TWMDestroy);
begin
{*
 00064258    push        ebx
 00064259    push        esi
 0006425A    mov         esi,eax
 0006425C    mov         eax,esi
 0006425E    mov         ecx,dword ptr [eax]
 00064260    call        dword ptr [ecx-10]
 00064263    mov         eax,esi
 00064265    mov         bx,0FFF0
 00064269    call        @CallDynaInst
 0006426E    pop         esi
 0006426F    pop         ebx
 00064270    ret
*}
end;

//00064274
procedure TCommonDialog.WMInitDialog(var Message:TWMInitDialog);
begin
{*
 00064274    push        ebx
 00064275    push        esi
 00064276    mov         esi,edx
 00064278    mov         bx,0FFEF
 0006427C    call        @CallDynaInst
 00064281    xor         eax,eax
 00064283    mov         dword ptr [esi+0C],eax
 00064286    pop         esi
 00064287    pop         ebx
 00064288    ret
*}
end;

//0006428C
procedure TCommonDialog.WMNCDestroy(var Message:TWMNCDestroy);
begin
{*
 0006428C    push        esi
 0006428D    mov         esi,eax
 0006428F    mov         eax,esi
 00064291    mov         ecx,dword ptr [eax]
 00064293    call        dword ptr [ecx-10]
 00064296    xor         eax,eax
 00064298    mov         dword ptr [esi+30],eax
 0006429B    pop         esi
 0006429C    ret
*}
end;

//000642A0
function TCommonDialog.TaskModalDialog(DialogFunc:Pointer; var DialogData:void ):BOOL;
begin
{*
 000642A0    push        ebp
 000642A1    mov         ebp,esp
 000642A3    add         esp,0FFFFFFF0
 000642A6    push        ebx
 000642A7    push        esi
 000642A8    mov         esi,ecx
 000642AA    mov         ebx,edx
 000642AC    mov         dword ptr [ebp-4],eax
 000642AF    call        user32.GetActiveWindow
 000642B4    mov         dword ptr [ebp-0C],eax
 000642B7    xor         eax,eax
 000642B9    call        DisableTaskWindows
 000642BE    mov         dword ptr [ebp-10],eax
 000642C1    xor         eax,eax
 000642C3    push        ebp
 000642C4    push        64358
 000642C9    push        dword ptr fs:[eax]
 000642CC    mov         dword ptr fs:[eax],esp
 000642CF    mov         eax,dword ptr [ebp-4]
 000642D2    push        eax
 000642D3    mov         eax,dword ptr [eax]
 000642D5    mov         eax,dword ptr [eax+34]
 000642D8    push        eax
 000642D9    mov         eax,[000B59E8];^Application:TApplication
 000642DE    mov         eax,dword ptr [eax]
 000642E0    call        TApplication.HookMainWindow
 000642E5    xor         eax,eax
 000642E7    push        ebp
 000642E8    push        64332
 000642ED    push        dword ptr fs:[eax]
 000642F0    mov         dword ptr fs:[eax],esp
 000642F3    mov         eax,dword ptr [ebp-4]
 000642F6    mov         [000B4AF8],eax
 000642FB    push        esi
 000642FC    call        ebx
 000642FE    mov         dword ptr [ebp-8],eax
 00064301    mov         eax,[000B5BC0]
 00064306    mov         ax,word ptr [eax]
 00064309    call        Set8087CW
 0006430E    xor         eax,eax
 00064310    pop         edx
 00064311    pop         ecx
 00064312    pop         ecx
 00064313    mov         dword ptr fs:[eax],edx
 00064316    push        64339
 0006431B    mov         eax,dword ptr [ebp-4]
 0006431E    push        eax
 0006431F    mov         eax,dword ptr [eax]
 00064321    mov         eax,dword ptr [eax+34]
 00064324    push        eax
 00064325    mov         eax,[000B59E8];^Application:TApplication
 0006432A    mov         eax,dword ptr [eax]
 0006432C    call        TApplication.UnhookMainWindow
 00064331    ret
>00064332    jmp         @HandleFinally
>00064337    jmp         0006431B
 00064339    xor         eax,eax
 0006433B    pop         edx
 0006433C    pop         ecx
 0006433D    pop         ecx
 0006433E    mov         dword ptr fs:[eax],edx
 00064341    push        6435F
 00064346    mov         eax,dword ptr [ebp-10]
 00064349    call        EnableTaskWindows
 0006434E    mov         eax,dword ptr [ebp-0C]
 00064351    push        eax
 00064352    call        user32.SetActiveWindow
 00064357    ret
>00064358    jmp         @HandleFinally
>0006435D    jmp         00064346
 0006435F    mov         eax,dword ptr [ebp-8]
 00064362    pop         esi
 00064363    pop         ebx
 00064364    mov         esp,ebp
 00064366    pop         ebp
 00064367    ret
*}
end;

//00064368
procedure TCommonDialog.DoClose;
begin
{*
 00064368    push        ebx
 00064369    cmp         word ptr [eax+3E],0
>0006436E    je          0006437A
 00064370    mov         ebx,eax
 00064372    mov         edx,eax
 00064374    mov         eax,dword ptr [ebx+40]
 00064377    call        dword ptr [ebx+3C]
 0006437A    pop         ebx
 0006437B    ret
*}
end;

//0006437C
procedure TCommonDialog.DoShow;
begin
{*
 0006437C    push        ebx
 0006437D    cmp         word ptr [eax+46],0
>00064382    je          0006438E
 00064384    mov         ebx,eax
 00064386    mov         edx,eax
 00064388    mov         eax,dword ptr [ebx+48]
 0006438B    call        dword ptr [ebx+44]
 0006438E    pop         ebx
 0006438F    ret
*}
end;

//00064390
function ExplorerHook(Wnd:HWND; Msg:UINT; WParam:WPARAM; LParam:LPARAM):UINT; stdcall;
begin
{*
 00064390    push        ebp
 00064391    mov         ebp,esp
 00064393    push        ecx
 00064394    push        ebx
 00064395    push        esi
 00064396    push        edi
 00064397    mov         edi,dword ptr [ebp+14]
 0006439A    mov         ebx,dword ptr [ebp+0C]
 0006439D    mov         esi,dword ptr [ebp+8]
 000643A0    xor         eax,eax
 000643A2    mov         dword ptr [ebp-4],eax
 000643A5    cmp         ebx,110
>000643AB    jne         000643ED
 000643AD    mov         eax,[000B4AF8]
 000643B2    mov         dword ptr [eax+30],esi
 000643B5    mov         eax,[000B4AF8]
 000643BA    mov         eax,dword ptr [eax+34]
 000643BD    push        eax
 000643BE    push        0FC
 000643C0    push        esi
 000643C1    call        user32.SetWindowLongA
 000643C6    mov         edx,dword ptr ds:[0B4AF8]
 000643CC    mov         dword ptr [edx+28],eax
 000643CF    push        edi
 000643D0    mov         eax,dword ptr [ebp+10]
 000643D3    push        eax
 000643D4    push        ebx
 000643D5    push        esi
 000643D6    mov         eax,[000B4AF8]
 000643DB    mov         eax,dword ptr [eax+34]
 000643DE    push        eax
 000643DF    call        user32.CallWindowProcA
 000643E4    xor         eax,eax
 000643E6    mov         [000B4AF8],eax
>000643EB    jmp         00064408
 000643ED    cmp         ebx,4E
>000643F0    jne         00064408
 000643F2    cmp         dword ptr [edi+8],0FFFFFDA7
>000643F9    jne         00064408
 000643FB    push        0F8
 000643FD    push        esi
 000643FE    call        user32.GetWindowLongA
 00064403    call        CenterWindow
 00064408    mov         eax,dword ptr [ebp-4]
 0006440B    pop         edi
 0006440C    pop         esi
 0006440D    pop         ebx
 0006440E    pop         ecx
 0006440F    pop         ebp
 00064410    ret         10
*}
end;

//00064414
constructor TOpenDialog.Create(AOwner:TComponent);
begin
{*
 00064414    push        ebx
 00064415    push        esi
 00064416    test        dl,dl
>00064418    je          00064422
 0006441A    add         esp,0FFFFFFF0
 0006441D    call        @ClassCreate
 00064422    mov         ebx,edx
 00064424    mov         esi,eax
 00064426    xor         edx,edx
 00064428    mov         eax,esi
 0006442A    call        TCommonDialog.Create
 0006442F    mov         dl,1
 00064431    mov         eax,[0001F340];TStringList
 00064436    call        TObject.Create
 0006443B    mov         dword ptr [esi+4C],eax
 0006443E    mov         eax,[0006447C]
 00064443    mov         dword ptr [esi+50],eax
 00064446    mov         dl,1
 00064448    mov         eax,[0001F340];TStringList
 0006444D    call        TObject.Create
 00064452    mov         dword ptr [esi+70],eax
 00064455    mov         dword ptr [esi+58],1
 0006445C    mov         byte ptr [esi+74],0
 00064460    mov         eax,esi
 00064462    test        bl,bl
>00064464    je          00064475
 00064466    call        @AfterConstruction
 0006446B    pop         dword ptr fs:[0]
 00064472    add         esp,0C
 00064475    mov         eax,esi
 00064477    pop         esi
 00064478    pop         ebx
 00064479    ret
*}
end;

//00064480
destructor TOpenDialog.Destroy;
begin
{*
 00064480    push        ebx
 00064481    push        esi
 00064482    call        @BeforeDestruction
 00064487    mov         ebx,edx
 00064489    mov         esi,eax
 0006448B    mov         eax,dword ptr [esi+70]
 0006448E    call        TObject.Free
 00064493    mov         eax,dword ptr [esi+4C]
 00064496    call        TObject.Free
 0006449B    mov         edx,ebx
 0006449D    and         dl,0FC
 000644A0    mov         eax,esi
 000644A2    call        TCommonDialog.Destroy
 000644A7    test        bl,bl
>000644A9    jle         000644B2
 000644AB    mov         eax,esi
 000644AD    call        @ClassDestroy
 000644B2    pop         esi
 000644B3    pop         ebx
 000644B4    ret
*}
end;

//000644B8
function TOpenDialog.CanClose(var OpenFileName:TOpenFilename):Boolean;
begin
{*
 000644B8    push        ebx
 000644B9    push        esi
 000644BA    mov         esi,eax
 000644BC    mov         eax,esi
 000644BE    call        TOpenDialog.GetFileNames
 000644C3    mov         eax,esi
 000644C5    mov         bx,0FFEE
 000644C9    call        @CallDynaInst
 000644CE    mov         ebx,eax
 000644D0    mov         eax,dword ptr [esi+70]
 000644D3    mov         edx,dword ptr [eax]
 000644D5    call        dword ptr [edx+40]
 000644D8    mov         eax,ebx
 000644DA    pop         esi
 000644DB    pop         ebx
 000644DC    ret
*}
end;

//000644E0
procedure TOpenDialog.WndProc(var Message:TMessage);
begin
{*
 000644E0    push        ebx
 000644E1    push        esi
 000644E2    push        edi
 000644E3    mov         esi,edx
 000644E5    mov         edi,eax
 000644E7    xor         eax,eax
 000644E9    mov         dword ptr [esi+0C],eax
 000644EC    mov         eax,dword ptr [esi]
 000644EE    cmp         eax,110
>000644F3    jne         000644FF
 000644F5    test        byte ptr [edi+52],1
>000644F9    je          000645AC
 000644FF    cmp         eax,4E
>00064502    jne         000645A3
 00064508    mov         ebx,dword ptr [esi+8]
 0006450B    mov         eax,dword ptr [ebx+8]
 0006450E    add         eax,25F
 00064513    cmp         eax,6
>00064516    ja          000645A3
 0006451C    jmp         dword ptr [eax*4+64523]
 0006451C    dd          0006458A
 0006451C    dd          0006453F
 0006451C    dd          000645A3
 0006451C    dd          000645A3
 0006451C    dd          0006457D
 0006451C    dd          00064570
 0006451C    dd          00064563
 0006453F    mov         edx,dword ptr [ebx+0C]
 00064542    mov         eax,edi
 00064544    call        TOpenDialog.CanClose
 00064549    test        al,al
>0006454B    jne         000645A3
 0006454D    mov         eax,1
 00064552    mov         dword ptr [esi+0C],eax
 00064555    push        eax
 00064556    push        0
 00064558    mov         eax,dword ptr [edi+30]
 0006455B    push        eax
 0006455C    call        user32.SetWindowLongA
>00064561    jmp         000645AC
 00064563    mov         eax,edi
 00064565    mov         bx,0FFEF
 00064569    call        @CallDynaInst
>0006456E    jmp         000645A3
 00064570    mov         eax,edi
 00064572    mov         bx,0FFED
 00064576    call        @CallDynaInst
>0006457B    jmp         000645A3
 0006457D    mov         eax,edi
 0006457F    mov         bx,0FFEC
 00064583    call        @CallDynaInst
>00064588    jmp         000645A3
 0006458A    mov         eax,dword ptr [ebx+0C]
 0006458D    mov         eax,dword ptr [eax+18]
 00064590    cmp         eax,dword ptr [edi+5C]
>00064593    je          000645A3
 00064595    mov         dword ptr [edi+5C],eax
 00064598    mov         eax,edi
 0006459A    mov         bx,0FFEB
 0006459E    call        @CallDynaInst
 000645A3    mov         edx,esi
 000645A5    mov         eax,edi
 000645A7    call        TCommonDialog.WndProc
 000645AC    pop         edi
 000645AD    pop         esi
 000645AE    pop         ebx
 000645AF    ret
*}
end;

//000645B0
procedure TOpenDialog.DoCanClose;
begin
{*
 000645B0    push        ebx
 000645B1    push        ecx
 000645B2    mov         byte ptr [esp],1
 000645B6    cmp         word ptr [eax+92],0
>000645BE    je          000645D2
 000645C0    mov         ecx,esp
 000645C2    mov         ebx,eax
 000645C4    mov         edx,eax
 000645C6    mov         eax,dword ptr [ebx+94]
 000645CC    call        dword ptr [ebx+90]
 000645D2    mov         al,byte ptr [esp]
 000645D5    pop         edx
 000645D6    pop         ebx
 000645D7    ret
*}
end;

//000645D8
procedure TOpenDialog.DoSelectionChange;
begin
{*
 000645D8    push        ebx
 000645D9    cmp         word ptr [eax+7A],0
>000645DE    je          000645EA
 000645E0    mov         ebx,eax
 000645E2    mov         edx,eax
 000645E4    mov         eax,dword ptr [ebx+7C]
 000645E7    call        dword ptr [ebx+78]
 000645EA    pop         ebx
 000645EB    ret
*}
end;

//000645EC
procedure TOpenDialog.DoFolderChange;
begin
{*
 000645EC    push        ebx
 000645ED    cmp         word ptr [eax+82],0
>000645F5    je          00064607
 000645F7    mov         ebx,eax
 000645F9    mov         edx,eax
 000645FB    mov         eax,dword ptr [ebx+84]
 00064601    call        dword ptr [ebx+80]
 00064607    pop         ebx
 00064608    ret
*}
end;

//0006460C
procedure TOpenDialog.DoTypeChange;
begin
{*
 0006460C    push        ebx
 0006460D    cmp         word ptr [eax+8A],0
>00064615    je          00064627
 00064617    mov         ebx,eax
 00064619    mov         edx,eax
 0006461B    mov         eax,dword ptr [ebx+8C]
 00064621    call        dword ptr [ebx+88]
 00064627    pop         ebx
 00064628    ret
*}
end;

//0006462C
procedure TOpenDialog.ReadFileEditStyle(Reader:TReader);
begin
{*
 0006462C    push        ebp
 0006462D    mov         ebp,esp
 0006462F    push        0
 00064631    xor         eax,eax
 00064633    push        ebp
 00064634    push        6465E
 00064639    push        dword ptr fs:[eax]
 0006463C    mov         dword ptr fs:[eax],esp
 0006463F    lea         eax,[ebp-4]
 00064642    xchg        eax,edx
 00064643    call        TReader.ReadIdent
 00064648    xor         eax,eax
 0006464A    pop         edx
 0006464B    pop         ecx
 0006464C    pop         ecx
 0006464D    mov         dword ptr fs:[eax],edx
 00064650    push        64665
 00064655    lea         eax,[ebp-4]
 00064658    call        @LStrClr
 0006465D    ret
>0006465E    jmp         @HandleFinally
>00064663    jmp         00064655
 00064665    pop         ecx
 00064666    pop         ebp
 00064667    ret
*}
end;

//00064668
procedure TOpenDialog.DefineProperties(Filer:TFiler);
begin
{*
 00064668    push        ebx
 00064669    push        esi
 0006466A    mov         esi,edx
 0006466C    mov         ebx,eax
 0006466E    mov         edx,esi
 00064670    mov         eax,ebx
 00064672    call        TComponent.DefineProperties
 00064677    push        ebx
 00064678    push        6462C;TOpenDialog.ReadFileEditStyle
 0006467D    push        0
 0006467F    push        0
 00064681    xor         ecx,ecx
 00064683    mov         edx,6469C;'FileEditStyle'
 00064688    mov         eax,esi
 0006468A    mov         ebx,dword ptr [eax]
 0006468C    call        dword ptr [ebx]
 0006468E    pop         esi
 0006468F    pop         ebx
 00064690    ret
*}
end;

//000646AC
function AllocFilterStr(const S:AnsiString):AnsiString;
begin
{*
 000646AC    push        ebx
 000646AD    push        esi
 000646AE    mov         ebx,edx
 000646B0    mov         esi,eax
 000646B2    mov         eax,ebx
 000646B4    call        @LStrClr
 000646B9    test        esi,esi
>000646BB    je          000646EC
 000646BD    mov         eax,ebx
 000646BF    mov         ecx,646F8;#0
 000646C4    mov         edx,esi
 000646C6    call        @LStrCat3
 000646CB    mov         eax,dword ptr [ebx]
 000646CD    call        @LStrToPChar
 000646D2    mov         dl,7C
 000646D4    call        AnsiStrScan
 000646D9    test        eax,eax
>000646DB    je          000646EC
 000646DD    mov         byte ptr [eax],0
 000646E0    inc         eax
 000646E1    mov         dl,7C
 000646E3    call        AnsiStrScan
 000646E8    test        eax,eax
>000646EA    jne         000646DD
 000646EC    pop         esi
 000646ED    pop         ebx
 000646EE    ret
*}
end;

//000646FC
function TOpenDialog.DoExecute(Func:Pointer):BOOL;
begin
{*
 000646FC    push        ebp
 000646FD    mov         ebp,esp
 000646FF    add         esp,0FFFFFFA4
 00064702    push        ebx
 00064703    push        esi
 00064704    xor         ecx,ecx
 00064706    mov         dword ptr [ebp-8],ecx
 00064709    mov         dword ptr [ebp-0C],ecx
 0006470C    mov         dword ptr [ebp-10],ecx
 0006470F    mov         dword ptr [ebp-4],edx
 00064712    mov         ebx,eax
 00064714    xor         eax,eax
 00064716    push        ebp
 00064717    push        64905
 0006471C    push        dword ptr fs:[eax]
 0006471F    mov         dword ptr fs:[eax],esp
 00064722    mov         eax,dword ptr [ebx+70]
 00064725    mov         edx,dword ptr [eax]
 00064727    call        dword ptr [edx+40]
 0006472A    lea         eax,[ebp-5C]
 0006472D    xor         ecx,ecx
 0006472F    mov         edx,4C
 00064734    call        @FillChar
 00064739    mov         dword ptr [ebp-5C],4C
 00064740    mov         eax,[000B5950];^HInstance:Longword
 00064745    mov         eax,dword ptr [eax]
 00064747    mov         dword ptr [ebp-54],eax
 0006474A    lea         edx,[ebp-8]
 0006474D    mov         eax,dword ptr [ebx+54]
 00064750    call        AllocFilterStr
 00064755    mov         eax,dword ptr [ebp-8]
 00064758    call        @LStrToPChar
 0006475D    mov         dword ptr [ebp-50],eax
 00064760    mov         eax,dword ptr [ebx+58]
 00064763    mov         dword ptr [ebp-44],eax
 00064766    mov         dword ptr [ebx+5C],eax
 00064769    test        byte ptr [ebx+50],40
>0006476D    je          00064778
 0006476F    mov         dword ptr [ebp-3C],0FFEF
>00064776    jmp         0006477F
 00064778    mov         dword ptr [ebp-3C],104
 0006477F    mov         edx,dword ptr [ebp-3C]
 00064782    add         edx,2
 00064785    lea         eax,[ebp-0C]
 00064788    call        @LStrSetLength
 0006478D    mov         eax,dword ptr [ebp-0C]
 00064790    call        @LStrToPChar
 00064795    mov         esi,eax
 00064797    mov         dword ptr [ebp-40],esi
 0006479A    mov         edx,dword ptr [ebp-3C]
 0006479D    add         edx,2
 000647A0    mov         eax,esi
 000647A2    xor         ecx,ecx
 000647A4    call        @FillChar
 000647A9    mov         eax,dword ptr [ebx+6C]
 000647AC    call        @LStrToPChar
 000647B1    mov         edx,eax
 000647B3    mov         ecx,dword ptr [ebp-3C]
 000647B6    mov         eax,dword ptr [ebp-40]
 000647B9    call        StrLCopy
 000647BE    mov         eax,dword ptr [ebx+60]
 000647C1    call        @LStrToPChar
 000647C6    mov         dword ptr [ebp-30],eax
 000647C9    mov         eax,dword ptr [ebx+64]
 000647CC    call        @LStrToPChar
 000647D1    mov         dword ptr [ebp-2C],eax
 000647D4    mov         al,byte ptr [ebx+24]
 000647D7    mov         [000B680C],al
 000647DC    mov         dword ptr [ebp-28],20
 000647E3    xor         eax,eax
 000647E5    mov         esi,0B4B00
 000647EA    mov         edx,eax
 000647EC    cmp         dl,1F
>000647EF    ja          000647F8
 000647F1    and         edx,7F
 000647F4    bt          dword ptr [ebx+50],edx
>000647F8    jae         000647FF
 000647FA    mov         edx,dword ptr [esi]
 000647FC    or          dword ptr [ebp-28],edx
 000647FF    inc         eax
 00064800    add         esi,4
 00064803    cmp         al,14
>00064805    jne         000647EA
 00064807    mov         eax,[000B58C0];NewStyleControls:Boolean
 0006480C    cmp         byte ptr [eax],0
>0006480F    je          0006481A
 00064811    xor         dword ptr [ebp-28],80000
>00064818    jmp         00064821
 0006481A    and         dword ptr [ebp-28],0FFF7FFFF
 00064821    lea         eax,[ebp-10]
 00064824    mov         edx,dword ptr [ebx+68]
 00064827    call        @LStrLAsg
 0006482C    cmp         dword ptr [ebp-10],0
>00064830    jne         00064855
 00064832    test        byte ptr [ebp-26],8
>00064836    jne         00064855
 00064838    lea         edx,[ebp-10]
 0006483B    mov         eax,dword ptr [ebx+6C]
 0006483E    call        ExtractFileExt
 00064843    lea         eax,[ebp-10]
 00064846    mov         ecx,1
 0006484B    mov         edx,1
 00064850    call        @LStrDelete
 00064855    cmp         dword ptr [ebp-10],0
>00064859    je          00064866
 0006485B    mov         eax,dword ptr [ebp-10]
 0006485E    call        @LStrToPChar
 00064863    mov         dword ptr [ebp-20],eax
 00064866    test        byte ptr [ebx+52],1
>0006486A    jne         00064876
 0006486C    mov         eax,[000B58C0];NewStyleControls:Boolean
 00064871    cmp         byte ptr [eax],0
>00064874    jne         0006487F
 00064876    mov         dword ptr [ebp-18],6408C;DialogHook:UINT
>0006487D    jmp         00064886
 0006487F    mov         dword ptr [ebp-18],64390;ExplorerHook:UINT
 00064886    mov         eax,dword ptr [ebx+38]
 00064889    test        eax,eax
>0006488B    je          00064894
 0006488D    or          dword ptr [ebp-28],40
 00064891    mov         dword ptr [ebp-14],eax
 00064894    mov         eax,[000B59E8];^Application:TApplication
 00064899    mov         eax,dword ptr [eax]
 0006489B    mov         eax,dword ptr [eax+24]
 0006489E    mov         dword ptr [ebp-58],eax
 000648A1    lea         ecx,[ebp-5C]
 000648A4    mov         edx,dword ptr [ebp-4]
 000648A7    mov         eax,ebx
 000648A9    mov         esi,dword ptr [eax]
 000648AB    call        dword ptr [esi+38]
 000648AE    mov         esi,eax
 000648B0    test        esi,esi
>000648B2    je          000648EA
 000648B4    lea         edx,[ebp-5C]
 000648B7    mov         eax,ebx
 000648B9    call        TOpenDialog.GetFileNames
 000648BE    test        byte ptr [ebp-27],4
>000648C2    je          000648CD
 000648C4    or          dword ptr [ebx+50],80
>000648CB    jmp         000648D4
 000648CD    and         dword ptr [ebx+50],0FFFFFF7F
 000648D4    test        byte ptr [ebp-28],1
>000648D8    je          000648E0
 000648DA    or          dword ptr [ebx+50],1
>000648DE    jmp         000648E4
 000648E0    and         dword ptr [ebx+50],0FFFFFFFE
 000648E4    mov         eax,dword ptr [ebp-44]
 000648E7    mov         dword ptr [ebx+58],eax
 000648EA    xor         eax,eax
 000648EC    pop         edx
 000648ED    pop         ecx
 000648EE    pop         ecx
 000648EF    mov         dword ptr fs:[eax],edx
 000648F2    push        6490C
 000648F7    lea         eax,[ebp-10]
 000648FA    mov         edx,3
 000648FF    call        @LStrArrayClr
 00064904    ret
>00064905    jmp         @HandleFinally
>0006490A    jmp         000648F7
 0006490C    mov         eax,esi
 0006490E    pop         esi
 0006490F    pop         ebx
 00064910    mov         esp,ebp
 00064912    pop         ebp
 00064913    ret
*}
end;

//00064914
function ExtractFileName(P:PChar; var S:TFileName):PChar;
begin
{*
 00064914    push        ebp
 00064915    mov         ebp,esp
 00064917    push        ebx
 00064918    push        esi
 00064919    push        edi
 0006491A    mov         edi,edx
 0006491C    mov         esi,eax
 0006491E    mov         eax,dword ptr [ebp+8]
 00064921    mov         dl,byte ptr [eax-1]
 00064924    mov         eax,esi
 00064926    call        AnsiStrScan
 0006492B    mov         ebx,eax
 0006492D    test        ebx,ebx
>0006492F    jne         00064945
 00064931    mov         eax,edi
 00064933    mov         edx,esi
 00064935    call        @LStrFromPChar
 0006493A    mov         eax,esi
 0006493C    call        StrEnd
 00064941    mov         ebx,eax
>00064943    jmp         00064953
 00064945    mov         ecx,ebx
 00064947    sub         ecx,esi
 00064949    mov         eax,edi
 0006494B    mov         edx,esi
 0006494D    call        @LStrFromPCharLen
 00064952    inc         ebx
 00064953    mov         eax,ebx
 00064955    pop         edi
 00064956    pop         esi
 00064957    pop         ebx
 00064958    pop         ebp
 00064959    ret
*}
end;

//0006495C
procedure ExtractFileNames(P:PChar);
begin
{*
 0006495C    push        ebp
 0006495D    mov         ebp,esp
 0006495F    push        0
 00064961    push        0
 00064963    push        ebx
 00064964    mov         ebx,eax
 00064966    xor         eax,eax
 00064968    push        ebp
 00064969    push        64A41
 0006496E    push        dword ptr fs:[eax]
 00064971    mov         dword ptr fs:[eax],esp
 00064974    mov         eax,dword ptr [ebp+8]
 00064977    push        eax
 00064978    lea         edx,[ebp-4]
 0006497B    mov         eax,ebx
 0006497D    call        ExtractFileName
 00064982    pop         ecx
 00064983    mov         ebx,eax
 00064985    mov         eax,dword ptr [ebp+8]
 00064988    push        eax
 00064989    lea         edx,[ebp-8]
 0006498C    mov         eax,ebx
 0006498E    call        ExtractFileName
 00064993    pop         ecx
 00064994    mov         ebx,eax
 00064996    cmp         dword ptr [ebp-8],0
>0006499A    jne         000649AF
 0006499C    mov         eax,dword ptr [ebp+8]
 0006499F    mov         eax,dword ptr [eax-8]
 000649A2    mov         eax,dword ptr [eax+70]
 000649A5    mov         edx,dword ptr [ebp-4]
 000649A8    mov         ecx,dword ptr [eax]
 000649AA    call        dword ptr [ecx+34]
>000649AD    jmp         00064A26
 000649AF    mov         eax,dword ptr [ebp-4]
 000649B2    call        AnsiLastChar
 000649B7    cmp         byte ptr [eax],5C
>000649BA    je          000649C9
 000649BC    lea         eax,[ebp-4]
 000649BF    mov         edx,64A58;'\'
 000649C4    call        @LStrCat
 000649C9    mov         eax,dword ptr [ebp-8]
 000649CC    cmp         byte ptr [eax],5C
>000649CF    je          000649FE
 000649D1    mov         eax,dword ptr [ebp-8]
 000649D4    call        @LStrLen
 000649D9    cmp         eax,3
>000649DC    jle         000649F0
 000649DE    mov         eax,dword ptr [ebp-8]
 000649E1    cmp         byte ptr [eax+1],3A
>000649E5    jne         000649F0
 000649E7    mov         eax,dword ptr [ebp-8]
 000649EA    cmp         byte ptr [eax+2],5C
>000649EE    je          000649FE
 000649F0    lea         eax,[ebp-8]
 000649F3    mov         ecx,dword ptr [ebp-8]
 000649F6    mov         edx,dword ptr [ebp-4]
 000649F9    call        @LStrCat3
 000649FE    mov         eax,dword ptr [ebp+8]
 00064A01    mov         eax,dword ptr [eax-8]
 00064A04    mov         eax,dword ptr [eax+70]
 00064A07    mov         edx,dword ptr [ebp-8]
 00064A0A    mov         ecx,dword ptr [eax]
 00064A0C    call        dword ptr [ecx+34]
 00064A0F    mov         eax,dword ptr [ebp+8]
 00064A12    push        eax
 00064A13    lea         edx,[ebp-8]
 00064A16    mov         eax,ebx
 00064A18    call        ExtractFileName
 00064A1D    pop         ecx
 00064A1E    mov         ebx,eax
 00064A20    cmp         dword ptr [ebp-8],0
>00064A24    jne         000649C9
 00064A26    xor         eax,eax
 00064A28    pop         edx
 00064A29    pop         ecx
 00064A2A    pop         ecx
 00064A2B    mov         dword ptr fs:[eax],edx
 00064A2E    push        64A48
 00064A33    lea         eax,[ebp-8]
 00064A36    mov         edx,2
 00064A3B    call        @LStrArrayClr
 00064A40    ret
>00064A41    jmp         @HandleFinally
>00064A46    jmp         00064A33
 00064A48    pop         ebx
 00064A49    pop         ecx
 00064A4A    pop         ecx
 00064A4B    pop         ebp
 00064A4C    ret
*}
end;

//00064A5C
procedure TOpenDialog.GetFileNames(var OpenFileName:TOpenFilename);
begin
{*
 00064A5C    push        ebp
 00064A5D    mov         ebp,esp
 00064A5F    add         esp,0FFFFFFF4
 00064A62    push        ebx
 00064A63    xor         ecx,ecx
 00064A65    mov         dword ptr [ebp-0C],ecx
 00064A68    mov         dword ptr [ebp-8],eax
 00064A6B    xor         eax,eax
 00064A6D    push        ebp
 00064A6E    push        64B07
 00064A73    push        dword ptr fs:[eax]
 00064A76    mov         dword ptr fs:[eax],esp
 00064A79    mov         byte ptr [ebp-1],0
 00064A7D    mov         eax,dword ptr [ebp-8]
 00064A80    test        byte ptr [eax+50],40
>00064A84    je          00064A9D
 00064A86    mov         eax,dword ptr [ebp-8]
 00064A89    test        byte ptr [eax+52],1
>00064A8D    jne         00064A99
 00064A8F    mov         eax,[000B58C0];NewStyleControls:Boolean
 00064A94    cmp         byte ptr [eax],0
>00064A97    jne         00064A9D
 00064A99    mov         byte ptr [ebp-1],20
 00064A9D    mov         eax,dword ptr [ebp-8]
 00064AA0    test        byte ptr [eax+50],40
>00064AA4    je          00064AD0
 00064AA6    push        ebp
 00064AA7    mov         eax,dword ptr [edx+1C]
 00064AAA    call        ExtractFileNames
 00064AAF    pop         ecx
 00064AB0    lea         ecx,[ebp-0C]
 00064AB3    mov         eax,dword ptr [ebp-8]
 00064AB6    mov         eax,dword ptr [eax+70]
 00064AB9    xor         edx,edx
 00064ABB    mov         ebx,dword ptr [eax]
 00064ABD    call        dword ptr [ebx+0C]
 00064AC0    mov         edx,dword ptr [ebp-0C]
 00064AC3    mov         eax,dword ptr [ebp-8]
 00064AC6    add         eax,6C
 00064AC9    call        @LStrAsg
>00064ACE    jmp         00064AF1
 00064AD0    push        ebp
 00064AD1    mov         eax,dword ptr [edx+1C]
 00064AD4    mov         edx,dword ptr [ebp-8]
 00064AD7    add         edx,6C
 00064ADA    call        ExtractFileName
 00064ADF    pop         ecx
 00064AE0    mov         eax,dword ptr [ebp-8]
 00064AE3    mov         edx,dword ptr [eax+6C]
 00064AE6    mov         eax,dword ptr [ebp-8]
 00064AE9    mov         eax,dword ptr [eax+70]
 00064AEC    mov         ecx,dword ptr [eax]
 00064AEE    call        dword ptr [ecx+34]
 00064AF1    xor         eax,eax
 00064AF3    pop         edx
 00064AF4    pop         ecx
 00064AF5    pop         ecx
 00064AF6    mov         dword ptr fs:[eax],edx
 00064AF9    push        64B0E
 00064AFE    lea         eax,[ebp-0C]
 00064B01    call        @LStrClr
 00064B06    ret
>00064B07    jmp         @HandleFinally
>00064B0C    jmp         00064AFE
 00064B0E    pop         ebx
 00064B0F    mov         esp,ebp
 00064B11    pop         ebp
 00064B12    ret
*}
end;

//00064B14
function TOpenDialog.GetStaticRect:TRect;
begin
{*
 00064B14    push        ebx
 00064B15    push        esi
 00064B16    push        edi
 00064B17    mov         esi,edx
 00064B19    mov         ebx,eax
 00064B1B    mov         edi,dword ptr [ebx+30]
 00064B1E    test        edi,edi
>00064B20    je          00064B53
 00064B22    test        byte ptr [ebx+52],1
>00064B26    jne         00064B4A
 00064B28    push        esi
 00064B29    push        45F
 00064B2E    push        edi
 00064B2F    call        user32.GetDlgItem
 00064B34    push        eax
 00064B35    call        user32.GetWindowRect
 00064B3A    push        2
 00064B3C    push        esi
 00064B3D    mov         eax,dword ptr [ebx+30]
 00064B40    push        eax
 00064B41    push        0
 00064B43    call        user32.MapWindowPoints
>00064B48    jmp         00064B61
 00064B4A    push        esi
 00064B4B    push        edi
 00064B4C    call        user32.GetClientRect
>00064B51    jmp         00064B61
 00064B53    push        0
 00064B55    push        esi
 00064B56    xor         ecx,ecx
 00064B58    xor         edx,edx
 00064B5A    xor         eax,eax
 00064B5C    call        Rect
 00064B61    pop         edi
 00064B62    pop         esi
 00064B63    pop         ebx
 00064B64    ret
*}
end;

//00064B68
function TOpenDialog.GetFileName:TFileName;
begin
{*
 00064B68    push        ebx
 00064B69    push        esi
 00064B6A    add         esp,0FFFFFEF8
 00064B70    mov         esi,edx
 00064B72    mov         ebx,eax
 00064B74    mov         eax,[000B58C0];NewStyleControls:Boolean
 00064B79    cmp         byte ptr [eax],0
>00064B7C    je          00064BAB
 00064B7E    cmp         dword ptr [ebx+30],0
>00064B82    je          00064BAB
 00064B84    mov         eax,esp
 00064B86    push        eax
 00064B87    push        105
 00064B8C    push        465
 00064B91    mov         eax,dword ptr [ebx+30]
 00064B94    push        eax
 00064B95    call        user32.GetParent
 00064B9A    push        eax
 00064B9B    call        user32.SendMessageA
 00064BA0    mov         edx,esi
 00064BA2    mov         eax,esp
 00064BA4    call        StrPas
>00064BA9    jmp         00064BB5
 00064BAB    mov         eax,esi
 00064BAD    mov         edx,dword ptr [ebx+6C]
 00064BB0    call        @LStrLAsg
 00064BB5    add         esp,108
 00064BBB    pop         esi
 00064BBC    pop         ebx
 00064BBD    ret
*}
end;

//00064BC0
function TOpenDialog.GetFilterIndex:Integer;
begin
{*
 00064BC0    cmp         dword ptr [eax+30],0
>00064BC4    je          00064BCA
 00064BC6    mov         eax,dword ptr [eax+5C]
 00064BC9    ret
 00064BCA    mov         eax,dword ptr [eax+58]
 00064BCD    ret
*}
end;

//00064BD0
procedure TOpenDialog.SetInitialDir(const Value:AnsiString);
begin
{*
 00064BD0    push        ebx
 00064BD1    push        esi
 00064BD2    push        edi
 00064BD3    mov         esi,edx
 00064BD5    mov         edi,eax
 00064BD7    mov         eax,esi
 00064BD9    call        @LStrLen
 00064BDE    mov         ebx,eax
 00064BE0    cmp         ebx,1
>00064BE3    jle         00064C06
 00064BE5    mov         edx,ebx
 00064BE7    mov         eax,esi
 00064BE9    call        IsPathDelimiter
 00064BEE    test        al,al
>00064BF0    je          00064C06
 00064BF2    mov         ecx,ebx
 00064BF4    dec         ecx
 00064BF5    mov         edx,esi
 00064BF7    mov         eax,64C24;':'
 00064BFC    call        IsDelimiter
 00064C01    test        al,al
>00064C03    jne         00064C06
 00064C05    dec         ebx
 00064C06    lea         eax,[edi+60]
 00064C09    push        eax
 00064C0A    mov         ecx,ebx
 00064C0C    mov         edx,1
 00064C11    mov         eax,esi
 00064C13    call        @LStrCopy
 00064C18    pop         edi
 00064C19    pop         esi
 00064C1A    pop         ebx
 00064C1B    ret
*}
end;

//00064C28
function TOpenDialog.Execute:Boolean;
begin
{*
 00064C28    push        ebx
 00064C29    mov         ebx,eax
 00064C2B    mov         edx,604AC;comdlg32.GetOpenFileNameA:BOOL
 00064C30    mov         eax,ebx
 00064C32    call        TOpenDialog.DoExecute
 00064C37    neg         eax
 00064C39    sbb         eax,eax
 00064C3B    neg         eax
 00064C3D    pop         ebx
 00064C3E    ret
*}
end;

//00064C40
procedure TSaveDialog.Execute;
begin
{*
 00064C40    push        ebx
 00064C41    mov         ebx,eax
 00064C43    mov         edx,604B4;comdlg32.GetSaveFileNameA:BOOL
 00064C48    mov         eax,ebx
 00064C4A    call        TOpenDialog.DoExecute
 00064C4F    neg         eax
 00064C51    sbb         eax,eax
 00064C53    neg         eax
 00064C55    pop         ebx
 00064C56    ret
*}
end;

//00064C58
function Max(I:Integer; J:Integer):Integer;
begin
{*
 00064C58    cmp         edx,eax
>00064C5A    jl          00064C5E
 00064C5C    mov         eax,edx
 00064C5E    ret
*}
end;

//00064C60
function GetAveCharSize(Canvas:TCanvas):TPoint;
begin
{*
 00064C60    push        ebx
 00064C61    push        esi
 00064C62    add         esp,0FFFFFFCC
 00064C65    mov         ebx,edx
 00064C67    mov         esi,eax
 00064C69    xor         eax,eax
 00064C6B    mov         edx,esp
 00064C6D    lea         ecx,[eax+41]
 00064C70    mov         byte ptr [edx],cl
 00064C72    inc         eax
 00064C73    inc         edx
 00064C74    cmp         eax,1A
>00064C77    jne         00064C6D
 00064C79    xor         eax,eax
 00064C7B    lea         edx,[esp+1A]
 00064C7F    lea         ecx,[eax+61]
 00064C82    mov         byte ptr [edx],cl
 00064C84    inc         eax
 00064C85    inc         edx
 00064C86    cmp         eax,1A
>00064C89    jne         00064C7F
 00064C8B    push        ebx
 00064C8C    push        34
 00064C8E    lea         eax,[esp+8]
 00064C92    push        eax
 00064C93    mov         eax,esi
 00064C95    call        TCanvas.GetHandle
 00064C9A    push        eax
 00064C9B    call        gdi32.GetTextExtentPointA
 00064CA0    mov         eax,dword ptr [ebx]
 00064CA2    mov         ecx,34
 00064CA7    cdq
 00064CA8    idiv        eax,ecx
 00064CAA    mov         dword ptr [ebx],eax
 00064CAC    add         esp,34
 00064CAF    pop         esi
 00064CB0    pop         ebx
 00064CB1    ret
*}
end;

//00064E0C
constructor TMessageForm.CreateNew(AOwner:TComponent);
begin
{*
 00064E0C    push        ebp
 00064E0D    mov         ebp,esp
 00064E0F    add         esp,0FFFFFEAC
 00064E15    push        ebx
 00064E16    push        esi
 00064E17    test        dl,dl
>00064E19    je          00064E23
 00064E1B    add         esp,0FFFFFFF0
 00064E1E    call        @ClassCreate
 00064E23    mov         ebx,edx
 00064E25    mov         esi,eax
 00064E27    push        0
 00064E29    xor         edx,edx
 00064E2B    mov         eax,esi
 00064E2D    call        TCustomForm.CreateNew
 00064E32    mov         dword ptr [ebp-154],154
 00064E3C    push        0
 00064E3E    lea         eax,[ebp-154]
 00064E44    push        eax
 00064E45    push        0
 00064E47    push        29
 00064E49    call        user32.SystemParametersInfoA
 00064E4E    test        eax,eax
>00064E50    je          00064E65
 00064E52    lea         eax,[ebp-3C]
 00064E55    push        eax
 00064E56    call        gdi32.CreateFontIndirectA
 00064E5B    mov         edx,eax
 00064E5D    mov         eax,dword ptr [esi+58]
 00064E60    call        TFont.SetHandle
 00064E65    mov         eax,esi
 00064E67    test        bl,bl
>00064E69    je          00064E7A
 00064E6B    call        @AfterConstruction
 00064E70    pop         dword ptr fs:[0]
 00064E77    add         esp,0C
 00064E7A    mov         eax,esi
 00064E7C    pop         esi
 00064E7D    pop         ebx
 00064E7E    mov         esp,ebp
 00064E80    pop         ebp
 00064E81    ret
*}
end;

//00064E84
procedure TMessageForm.HelpButtonClick(Sender:TObject);
begin
{*
 00064E84    mov         edx,dword ptr ds:[0B59E8];^Application:TApplication
 00064E8A    mov         edx,dword ptr [edx]
 00064E8C    mov         eax,dword ptr [eax+144]
 00064E92    xchg        eax,edx
 00064E93    call        TApplication.HelpContext
 00064E98    ret
*}
end;

//00064F40
function CreateMessageDialog(const Msg:AnsiString; DlgType:TMsgDlgType; Buttons:TMsgDlgButtons):TForm;
begin
{*
 00064F40    push        ebp
 00064F41    mov         ebp,esp
 00064F43    add         esp,0FFFFFF9C
 00064F46    push        ebx
 00064F47    push        esi
 00064F48    push        edi
 00064F49    xor         ebx,ebx
 00064F4B    mov         dword ptr [ebp-64],ebx
 00064F4E    mov         word ptr [ebp-7],cx
 00064F52    mov         byte ptr [ebp-5],dl
 00064F55    mov         dword ptr [ebp-4],eax
 00064F58    xor         eax,eax
 00064F5A    push        ebp
 00064F5B    push        65479
 00064F60    push        dword ptr fs:[eax]
 00064F63    mov         dword ptr fs:[eax],esp
 00064F66    mov         ecx,dword ptr ds:[0B59E8];^Application:TApplication
 00064F6C    mov         ecx,dword ptr [ecx]
 00064F6E    mov         dl,1
 00064F70    mov         eax,[00064CB4];TMessageForm
 00064F75    call        TMessageForm.CreateNew
 00064F7A    mov         dword ptr [ebp-0C],eax
 00064F7D    mov         eax,[000B59E8];^Application:TApplication
 00064F82    mov         eax,dword ptr [eax]
 00064F84    mov         dl,byte ptr [eax+28]
 00064F87    mov         eax,dword ptr [ebp-0C]
 00064F8A    mov         ecx,dword ptr [eax]
 00064F8C    call        dword ptr [ecx+6C]
 00064F8F    mov         dl,3
 00064F91    mov         eax,dword ptr [ebp-0C]
 00064F94    call        TCustomForm.SetBorderStyle
 00064F99    mov         eax,dword ptr [ebp-0C]
 00064F9C    call        TCustomForm.GetCanvas
 00064FA1    mov         edx,dword ptr [ebp-0C]
 00064FA4    mov         edx,dword ptr [edx+58]
 00064FA7    call        TCanvas.SetFont
 00064FAC    mov         eax,dword ptr [ebp-0C]
 00064FAF    call        TCustomForm.GetCanvas
 00064FB4    lea         edx,[ebp-14]
 00064FB7    call        GetAveCharSize
 00064FBC    push        4
 00064FBE    mov         ebx,dword ptr [ebp-14]
 00064FC1    push        ebx
 00064FC2    push        8
 00064FC4    call        kernel32.MulDiv
 00064FC9    mov         dword ptr [ebp-18],eax
 00064FCC    push        8
 00064FCE    mov         esi,dword ptr [ebp-10]
 00064FD1    push        esi
 00064FD2    push        8
 00064FD4    call        kernel32.MulDiv
 00064FD9    mov         dword ptr [ebp-1C],eax
 00064FDC    push        4
 00064FDE    push        ebx
 00064FDF    push        0A
 00064FE1    call        kernel32.MulDiv
 00064FE6    mov         dword ptr [ebp-20],eax
 00064FE9    push        8
 00064FEB    push        esi
 00064FEC    push        0A
 00064FEE    call        kernel32.MulDiv
 00064FF3    mov         dword ptr [ebp-24],eax
 00064FF6    push        4
 00064FF8    push        ebx
 00064FF9    push        32
 00064FFB    call        kernel32.MulDiv
 00065000    mov         dword ptr [ebp-28],eax
 00065003    xor         ebx,ebx
 00065005    mov         esi,0B6810
 0006500A    mov         dword ptr [ebp-4C],0B4BA4;^SMsgDlgYes:TResStringRec
 00065011    mov         eax,ebx
 00065013    cmp         al,0F
>00065015    ja          0006501E
 00065017    and         eax,7F
 0006501A    bt          dword ptr [ebp-7],eax
>0006501E    jae         00065088
 00065020    cmp         dword ptr [esi],0
>00065023    jne         0006507E
 00065025    push        0
 00065027    lea         eax,[ebp-60]
 0006502A    push        eax
 0006502B    xor         ecx,ecx
 0006502D    xor         edx,edx
 0006502F    xor         eax,eax
 00065031    call        Rect
 00065036    mov         eax,dword ptr [ebp-0C]
 00065039    call        TControl.DrawTextBiDiModeFlagsReadingOnly
 0006503E    or          eax,420
 00065043    push        eax
 00065044    lea         eax,[ebp-60]
 00065047    push        eax
 00065048    push        0FF
 0006504A    lea         edx,[ebp-64]
 0006504D    mov         eax,dword ptr [ebp-4C]
 00065050    mov         eax,dword ptr [eax]
 00065052    call        LoadResString
 00065057    mov         eax,dword ptr [ebp-64]
 0006505A    call        @LStrToPChar
 0006505F    push        eax
 00065060    mov         eax,dword ptr [ebp-0C]
 00065063    call        TCustomForm.GetCanvas
 00065068    call        TCanvas.GetHandle
 0006506D    push        eax
 0006506E    call        user32.DrawTextA
 00065073    mov         eax,dword ptr [ebp-58]
 00065076    sub         eax,dword ptr [ebp-60]
 00065079    add         eax,8
 0006507C    mov         dword ptr [esi],eax
 0006507E    mov         eax,dword ptr [esi]
 00065080    cmp         eax,dword ptr [ebp-28]
>00065083    jle         00065088
 00065085    mov         dword ptr [ebp-28],eax
 00065088    inc         ebx
 00065089    add         dword ptr [ebp-4C],4
 0006508D    add         esi,4
 00065090    cmp         bl,0B
>00065093    jne         00065011
 00065099    push        8
 0006509B    mov         eax,dword ptr [ebp-10]
 0006509E    push        eax
 0006509F    push        0E
 000650A1    call        kernel32.MulDiv
 000650A6    mov         dword ptr [ebp-2C],eax
 000650A9    push        4
 000650AB    mov         eax,dword ptr [ebp-14]
 000650AE    push        eax
 000650AF    push        4
 000650B1    call        kernel32.MulDiv
 000650B6    mov         dword ptr [ebp-30],eax
 000650B9    push        0
 000650BB    mov         eax,[000B5BDC];^Screen:TScreen
 000650C0    mov         eax,dword ptr [eax]
 000650C2    call        TScreen.GetWidth
 000650C7    sar         eax,1
>000650C9    jns         000650CE
 000650CB    adc         eax,0
 000650CE    push        eax
 000650CF    push        0
 000650D1    push        0
 000650D3    lea         eax,[ebp-60]
 000650D6    push        eax
 000650D7    call        user32.SetRect
 000650DC    mov         eax,dword ptr [ebp-0C]
 000650DF    call        TControl.DrawTextBiDiModeFlagsReadingOnly
 000650E4    or          eax,450
 000650E9    push        eax
 000650EA    lea         eax,[ebp-60]
 000650ED    push        eax
 000650EE    mov         eax,dword ptr [ebp-4]
 000650F1    call        @LStrLen
 000650F6    push        eax
 000650F7    mov         eax,dword ptr [ebp-4]
 000650FA    call        @LStrToPChar
 000650FF    push        eax
 00065100    mov         eax,dword ptr [ebp-0C]
 00065103    call        TCustomForm.GetCanvas
 00065108    call        TCanvas.GetHandle
 0006510D    push        eax
 0006510E    call        user32.DrawTextA
 00065113    xor         eax,eax
 00065115    mov         al,byte ptr [ebp-5]
 00065118    mov         edi,dword ptr [eax*4+0B4B64]
 0006511F    mov         eax,dword ptr [ebp-58]
 00065122    mov         dword ptr [ebp-34],eax
 00065125    mov         eax,dword ptr [ebp-54]
 00065128    mov         dword ptr [ebp-38],eax
 0006512B    test        edi,edi
>0006512D    je          00065145
 0006512F    mov         eax,dword ptr [ebp-20]
 00065132    add         eax,20
 00065135    add         dword ptr [ebp-34],eax
 00065138    cmp         dword ptr [ebp-38],20
>0006513C    jge         00065145
 0006513E    mov         dword ptr [ebp-38],20
 00065145    xor         eax,eax
 00065147    xor         ebx,ebx
 00065149    mov         edx,ebx
 0006514B    cmp         dl,0F
>0006514E    ja          00065157
 00065150    and         edx,7F
 00065153    bt          dword ptr [ebp-7],edx
>00065157    jae         0006515A
 00065159    inc         eax
 0006515A    inc         ebx
 0006515B    cmp         bl,0B
>0006515E    jne         00065149
 00065160    xor         esi,esi
 00065162    test        eax,eax
>00065164    je          00065172
 00065166    mov         esi,dword ptr [ebp-28]
 00065169    imul        esi,eax
 0006516C    dec         eax
 0006516D    imul        dword ptr [ebp-30]
 00065170    add         esi,eax
 00065172    mov         edx,esi
 00065174    mov         eax,dword ptr [ebp-34]
 00065177    call        Max
 0006517C    mov         edx,eax
 0006517E    mov         eax,dword ptr [ebp-18]
 00065181    add         eax,eax
 00065183    add         edx,eax
 00065185    mov         eax,dword ptr [ebp-0C]
 00065188    call        TCustomForm.SetClientWidth
 0006518D    mov         edx,dword ptr [ebp-38]
 00065190    add         edx,dword ptr [ebp-2C]
 00065193    add         edx,dword ptr [ebp-24]
 00065196    mov         eax,dword ptr [ebp-1C]
 00065199    add         eax,eax
 0006519B    add         edx,eax
 0006519D    mov         eax,dword ptr [ebp-0C]
 000651A0    call        TCustomForm.SetClientHeight
 000651A5    mov         eax,[000B5BDC];^Screen:TScreen
 000651AA    mov         eax,dword ptr [eax]
 000651AC    call        TScreen.GetWidth
 000651B1    mov         edx,eax
 000651B3    sar         edx,1
>000651B5    jns         000651BA
 000651B7    adc         edx,0
 000651BA    mov         eax,dword ptr [ebp-0C]
 000651BD    mov         eax,dword ptr [eax+38]
 000651C0    sar         eax,1
>000651C2    jns         000651C7
 000651C4    adc         eax,0
 000651C7    sub         edx,eax
 000651C9    mov         eax,dword ptr [ebp-0C]
 000651CC    call        TControl.SetLeft
 000651D1    mov         eax,[000B5BDC];^Screen:TScreen
 000651D6    mov         eax,dword ptr [eax]
 000651D8    call        TScreen.GetHeight
 000651DD    mov         edx,eax
 000651DF    sar         edx,1
>000651E1    jns         000651E6
 000651E3    adc         edx,0
 000651E6    mov         eax,dword ptr [ebp-0C]
 000651E9    mov         eax,dword ptr [eax+3C]
 000651EC    sar         eax,1
>000651EE    jns         000651F3
 000651F0    adc         eax,0
 000651F3    sub         edx,eax
 000651F5    mov         eax,dword ptr [ebp-0C]
 000651F8    call        TControl.SetTop
 000651FD    cmp         byte ptr [ebp-5],4
>00065201    je          00065224
 00065203    lea         edx,[ebp-64]
 00065206    xor         eax,eax
 00065208    mov         al,byte ptr [ebp-5]
 0006520B    mov         eax,dword ptr [eax*4+0B4B50];^SMsgDlgWarning:TResStringRec
 00065212    call        LoadResString
 00065217    mov         edx,dword ptr [ebp-64]
 0006521A    mov         eax,dword ptr [ebp-0C]
 0006521D    call        TControl.SetText
>00065222    jmp         0006523E
 00065224    lea         edx,[ebp-64]
 00065227    mov         eax,[000B59E8];^Application:TApplication
 0006522C    mov         eax,dword ptr [eax]
 0006522E    call        TApplication.GetTitle
 00065233    mov         edx,dword ptr [ebp-64]
 00065236    mov         eax,dword ptr [ebp-0C]
 00065239    call        TControl.SetText
 0006523E    test        edi,edi
>00065240    je          00065297
 00065242    mov         ecx,dword ptr [ebp-0C]
 00065245    mov         dl,1
 00065247    mov         eax,[000609C4];TImage
 0006524C    call        TImage.Create
 00065251    mov         ebx,eax
 00065253    mov         edx,65494;'Image'
 00065258    mov         eax,ebx
 0006525A    mov         ecx,dword ptr [eax]
 0006525C    call        dword ptr [ecx+18]
 0006525F    mov         edx,dword ptr [ebp-0C]
 00065262    mov         eax,ebx
 00065264    mov         ecx,dword ptr [eax]
 00065266    call        dword ptr [ecx+64]
 00065269    push        edi
 0006526A    push        0
 0006526C    call        user32.LoadIconA
 00065271    push        eax
 00065272    mov         eax,dword ptr [ebx+118]
 00065278    call        TPicture.GetIcon
 0006527D    pop         edx
 0006527E    call        TIcon.SetHandle
 00065283    push        20
 00065285    push        20
 00065287    mov         ecx,dword ptr [ebp-1C]
 0006528A    mov         edx,dword ptr [ebp-18]
 0006528D    mov         eax,ebx
 0006528F    mov         ebx,dword ptr [eax]
 00065291    call        dword ptr [ebx+80]
 00065297    mov         ecx,dword ptr [ebp-0C]
 0006529A    mov         dl,1
 0006529C    mov         eax,[00034260];TLabel
 000652A1    call        TCustomLabel.Create
 000652A6    mov         edi,eax
 000652A8    mov         edx,654A4;'Message'
 000652AD    mov         eax,edi
 000652AF    mov         ecx,dword ptr [eax]
 000652B1    call        dword ptr [ecx+18]
 000652B4    mov         edx,dword ptr [ebp-0C]
 000652B7    mov         eax,edi
 000652B9    mov         ecx,dword ptr [eax]
 000652BB    call        dword ptr [ecx+64]
 000652BE    mov         dl,1
 000652C0    mov         eax,edi
 000652C2    call        TCustomLabel.SetWordWrap
 000652C7    mov         edx,dword ptr [ebp-4]
 000652CA    mov         eax,edi
 000652CC    call        TControl.SetText
 000652D1    lea         edx,[ebp-60]
 000652D4    mov         eax,edi
 000652D6    call        TControl.SetBoundsRect
 000652DB    mov         eax,dword ptr [ebp-0C]
 000652DE    mov         dl,byte ptr [eax+4F]
 000652E1    mov         eax,edi
 000652E3    mov         ecx,dword ptr [eax]
 000652E5    call        dword ptr [ecx+6C]
 000652E8    mov         eax,dword ptr [ebp-34]
 000652EB    sub         eax,dword ptr [ebp-58]
 000652EE    add         eax,dword ptr [ebp-18]
 000652F1    mov         dword ptr [ebp-40],eax
 000652F4    mov         eax,edi
 000652F6    mov         bx,0FFCF
 000652FA    call        @CallDynaInst
 000652FF    test        al,al
>00065301    je          00065314
 00065303    mov         eax,dword ptr [ebp-0C]
 00065306    call        TControl.GetClientWidth
 0006530B    sub         eax,dword ptr [ebp-40]
 0006530E    sub         eax,dword ptr [edi+38]
 00065311    mov         dword ptr [ebp-40],eax
 00065314    mov         eax,dword ptr [ebp-58]
 00065317    push        eax
 00065318    mov         eax,dword ptr [ebp-54]
 0006531B    push        eax
 0006531C    mov         ecx,dword ptr [ebp-1C]
 0006531F    mov         edx,dword ptr [ebp-40]
 00065322    mov         eax,edi
 00065324    mov         ebx,dword ptr [eax]
 00065326    call        dword ptr [ebx+80]
 0006532C    test        byte ptr [ebp-7],4
>00065330    je          00065338
 00065332    mov         byte ptr [ebp-41],2
>00065336    jmp         00065348
 00065338    test        byte ptr [ebp-7],1
>0006533C    je          00065344
 0006533E    mov         byte ptr [ebp-41],0
>00065342    jmp         00065348
 00065344    mov         byte ptr [ebp-41],5
 00065348    test        byte ptr [ebp-7],8
>0006534C    je          00065354
 0006534E    mov         byte ptr [ebp-42],3
>00065352    jmp         00065364
 00065354    test        byte ptr [ebp-7],2
>00065358    je          00065360
 0006535A    mov         byte ptr [ebp-42],1
>0006535E    jmp         00065364
 00065360    mov         byte ptr [ebp-42],2
 00065364    mov         eax,dword ptr [ebp-0C]
 00065367    call        TControl.GetClientWidth
 0006536C    sub         eax,esi
 0006536E    sar         eax,1
>00065370    jns         00065375
 00065372    adc         eax,0
 00065375    mov         dword ptr [ebp-3C],eax
 00065378    xor         ebx,ebx
 0006537A    mov         dword ptr [ebp-4C],0B4B78
 00065381    mov         esi,0B4BA4;^SMsgDlgYes:TResStringRec
 00065386    mov         dword ptr [ebp-50],0B4BD0
 0006538D    mov         eax,ebx
 0006538F    cmp         al,0F
>00065391    ja          0006539A
 00065393    and         eax,7F
 00065396    bt          dword ptr [ebp-7],eax
>0006539A    jae         0006544E
 000653A0    mov         ecx,dword ptr [ebp-0C]
 000653A3    mov         dl,1
 000653A5    mov         eax,[00036984];TButton
 000653AA    call        TButton.Create
 000653AF    mov         dword ptr [ebp-48],eax
 000653B2    mov         eax,dword ptr [ebp-4C]
 000653B5    mov         edx,dword ptr [eax]
 000653B7    mov         eax,dword ptr [ebp-48]
 000653BA    mov         ecx,dword ptr [eax]
 000653BC    call        dword ptr [ecx+18]
 000653BF    mov         edx,dword ptr [ebp-0C]
 000653C2    mov         eax,dword ptr [ebp-48]
 000653C5    mov         ecx,dword ptr [eax]
 000653C7    call        dword ptr [ecx+64]
 000653CA    lea         edx,[ebp-64]
 000653CD    mov         eax,dword ptr [esi]
 000653CF    call        LoadResString
 000653D4    mov         edx,dword ptr [ebp-64]
 000653D7    mov         eax,dword ptr [ebp-48]
 000653DA    call        TControl.SetText
 000653DF    mov         eax,dword ptr [ebp-50]
 000653E2    mov         eax,dword ptr [eax]
 000653E4    mov         edx,dword ptr [ebp-48]
 000653E7    mov         dword ptr [edx+1F4],eax
 000653ED    cmp         bl,byte ptr [ebp-41]
>000653F0    jne         000653FC
 000653F2    mov         dl,1
 000653F4    mov         eax,dword ptr [ebp-48]
 000653F7    call        TButton.SetDefault
 000653FC    cmp         bl,byte ptr [ebp-42]
>000653FF    jne         0006540B
 00065401    mov         eax,dword ptr [ebp-48]
 00065404    mov         byte ptr [eax+1F1],1
 0006540B    mov         eax,dword ptr [ebp-28]
 0006540E    push        eax
 0006540F    mov         eax,dword ptr [ebp-2C]
 00065412    push        eax
 00065413    mov         ecx,dword ptr [ebp-38]
 00065416    add         ecx,dword ptr [ebp-1C]
 00065419    add         ecx,dword ptr [ebp-24]
 0006541C    mov         edx,dword ptr [ebp-3C]
 0006541F    mov         eax,dword ptr [ebp-48]
 00065422    mov         edi,dword ptr [eax]
 00065424    call        dword ptr [edi+80]
 0006542A    mov         eax,dword ptr [ebp-28]
 0006542D    add         eax,dword ptr [ebp-30]
 00065430    add         dword ptr [ebp-3C],eax
 00065433    cmp         bl,0A
>00065436    jne         0006544E
 00065438    mov         eax,dword ptr [ebp-48]
 0006543B    mov         edx,dword ptr [ebp-0C]
 0006543E    mov         dword ptr [eax+108],edx
 00065444    mov         dword ptr [eax+104],64E84;TMessageForm.HelpButtonClick
 0006544E    inc         ebx
 0006544F    add         dword ptr [ebp-50],4
 00065453    add         esi,4
 00065456    add         dword ptr [ebp-4C],4
 0006545A    cmp         bl,0B
>0006545D    jne         0006538D
 00065463    xor         eax,eax
 00065465    pop         edx
 00065466    pop         ecx
 00065467    pop         ecx
 00065468    mov         dword ptr fs:[eax],edx
 0006546B    push        65480
 00065470    lea         eax,[ebp-64]
 00065473    call        @LStrClr
 00065478    ret
>00065479    jmp         @HandleFinally
>0006547E    jmp         00065470
 00065480    mov         eax,dword ptr [ebp-0C]
 00065483    pop         edi
 00065484    pop         esi
 00065485    pop         ebx
 00065486    mov         esp,ebp
 00065488    pop         ebp
 00065489    ret
*}
end;

//000654AC
function MessageDlg(const Msg:AnsiString; DlgType:TMsgDlgType; Buttons:TMsgDlgButtons; HelpCtx:Longint):Integer;
begin
{*
 000654AC    push        ebp
 000654AD    mov         ebp,esp
 000654AF    push        ecx
 000654B0    mov         word ptr [ebp-2],cx
 000654B4    mov         ecx,dword ptr [ebp+8]
 000654B7    push        ecx
 000654B8    push        0FF
 000654BA    push        0FF
 000654BC    push        0
 000654BE    mov         cx,word ptr [ebp-2]
 000654C2    call        MessageDlgPosHelp
 000654C7    pop         ecx
 000654C8    pop         ebp
 000654C9    ret         4
*}
end;

//000654CC
function MessageDlgPos(const Msg:AnsiString; DlgType:TMsgDlgType; Buttons:TMsgDlgButtons; HelpCtx:Longint; X:Integer; Y:Integer):Integer;
begin
{*
 000654CC    push        ebp
 000654CD    mov         ebp,esp
 000654CF    push        ecx
 000654D0    mov         word ptr [ebp-2],cx
 000654D4    mov         ecx,dword ptr [ebp+10]
 000654D7    push        ecx
 000654D8    mov         ecx,dword ptr [ebp+0C]
 000654DB    push        ecx
 000654DC    mov         ecx,dword ptr [ebp+8]
 000654DF    push        ecx
 000654E0    push        0
 000654E2    mov         cx,word ptr [ebp-2]
 000654E6    call        MessageDlgPosHelp
 000654EB    pop         ecx
 000654EC    pop         ebp
 000654ED    ret         0C
*}
end;

//000654F0
function MessageDlgPosHelp(const Msg:AnsiString; DlgType:TMsgDlgType; Buttons:TMsgDlgButtons; HelpCtx:Longint; X:Integer; Y:Integer; const HelpFileName:AnsiString):Integer;
begin
{*
 000654F0    push        ebp
 000654F1    mov         ebp,esp
 000654F3    add         esp,0FFFFFFF4
 000654F6    push        ebx
 000654F7    push        esi
 000654F8    mov         word ptr [ebp-3],cx
 000654FC    mov         byte ptr [ebp-1],dl
 000654FF    mov         esi,dword ptr [ebp+0C]
 00065502    mov         ebx,dword ptr [ebp+10]
 00065505    mov         cx,word ptr [ebp-3]
 00065509    mov         dl,byte ptr [ebp-1]
 0006550C    call        CreateMessageDialog
 00065511    mov         dword ptr [ebp-0C],eax
 00065514    xor         eax,eax
 00065516    push        ebp
 00065517    push        65590
 0006551C    push        dword ptr fs:[eax]
 0006551F    mov         dword ptr fs:[eax],esp
 00065522    mov         eax,dword ptr [ebp-0C]
 00065525    mov         edx,dword ptr [ebp+14]
 00065528    mov         dword ptr [eax+144],edx
 0006552E    mov         eax,dword ptr [ebp-0C]
 00065531    add         eax,21C
 00065536    mov         edx,dword ptr [ebp+8]
 00065539    call        @LStrAsg
 0006553E    test        ebx,ebx
>00065540    jl          0006554C
 00065542    mov         edx,ebx
 00065544    mov         eax,dword ptr [ebp-0C]
 00065547    call        TControl.SetLeft
 0006554C    test        esi,esi
>0006554E    jl          0006555A
 00065550    mov         edx,esi
 00065552    mov         eax,dword ptr [ebp-0C]
 00065555    call        TControl.SetTop
 0006555A    test        esi,esi
>0006555C    jge         0006556C
 0006555E    test        ebx,ebx
>00065560    jge         0006556C
 00065562    mov         dl,4
 00065564    mov         eax,dword ptr [ebp-0C]
 00065567    call        TCustomForm.SetPosition
 0006556C    mov         eax,dword ptr [ebp-0C]
 0006556F    mov         edx,dword ptr [eax]
 00065571    call        dword ptr [edx+0CC]
 00065577    mov         dword ptr [ebp-8],eax
 0006557A    xor         eax,eax
 0006557C    pop         edx
 0006557D    pop         ecx
 0006557E    pop         ecx
 0006557F    mov         dword ptr fs:[eax],edx
 00065582    push        65597
 00065587    mov         eax,dword ptr [ebp-0C]
 0006558A    call        TObject.Free
 0006558F    ret
>00065590    jmp         @HandleFinally
>00065595    jmp         00065587
 00065597    mov         eax,dword ptr [ebp-8]
 0006559A    pop         esi
 0006559B    pop         ebx
 0006559C    mov         esp,ebp
 0006559E    pop         ebp
 0006559F    ret         10
*}
end;

//000655A4
procedure ShowMessage(const Msg:AnsiString);
begin
{*
 000655A4    or          ecx,0FFFFFFFF
 000655A7    or          edx,0FFFFFFFF
 000655AA    call        ShowMessagePos
 000655AF    ret
*}
end;

//000655B0
procedure ShowMessagePos(const Msg:AnsiString; X:Integer; Y:Integer);
begin
{*
 000655B0    push        0
 000655B2    push        edx
 000655B3    push        ecx
 000655B4    mov         dl,4
 000655B6    mov         cx,word ptr ds:[655C4]
 000655BD    call        MessageDlgPos
 000655C2    ret
*}
end;

//000655C8
function InputQuery(const ACaption:AnsiString; const APrompt:AnsiString; var Value:AnsiString):Boolean;
begin
{*
 000655C8    push        ebp
 000655C9    mov         ebp,esp
 000655CB    add         esp,0FFFFFFD8
 000655CE    push        ebx
 000655CF    push        esi
 000655D0    push        edi
 000655D1    xor         ebx,ebx
 000655D3    mov         dword ptr [ebp-28],ebx
 000655D6    mov         dword ptr [ebp-24],ebx
 000655D9    mov         dword ptr [ebp-8],ecx
 000655DC    mov         dword ptr [ebp-4],edx
 000655DF    mov         ebx,eax
 000655E1    xor         eax,eax
 000655E3    push        ebp
 000655E4    push        658AD
 000655E9    push        dword ptr fs:[eax]
 000655EC    mov         dword ptr fs:[eax],esp
 000655EF    mov         byte ptr [ebp-9],0
 000655F3    mov         ecx,dword ptr ds:[0B59E8];^Application:TApplication
 000655F9    mov         ecx,dword ptr [ecx]
 000655FB    mov         dl,1
 000655FD    mov         eax,[000554E4];TForm
 00065602    call        TCustomForm.Create
 00065607    mov         dword ptr [ebp-10],eax
 0006560A    xor         eax,eax
 0006560C    push        ebp
 0006560D    push        65888
 00065612    push        dword ptr fs:[eax]
 00065615    mov         dword ptr fs:[eax],esp
 00065618    mov         eax,dword ptr [ebp-10]
 0006561B    call        TCustomForm.GetCanvas
 00065620    mov         edx,dword ptr [ebp-10]
 00065623    mov         edx,dword ptr [edx+58]
 00065626    call        TCanvas.SetFont
 0006562B    mov         eax,dword ptr [ebp-10]
 0006562E    call        TCustomForm.GetCanvas
 00065633    lea         edx,[ebp-18]
 00065636    call        GetAveCharSize
 0006563B    mov         dl,3
 0006563D    mov         eax,dword ptr [ebp-10]
 00065640    call        TCustomForm.SetBorderStyle
 00065645    mov         edx,ebx
 00065647    mov         eax,dword ptr [ebp-10]
 0006564A    call        TControl.SetText
 0006564F    push        4
 00065651    mov         eax,dword ptr [ebp-18]
 00065654    push        eax
 00065655    push        0B4
 0006565A    call        kernel32.MulDiv
 0006565F    mov         edx,eax
 00065661    mov         eax,dword ptr [ebp-10]
 00065664    call        TCustomForm.SetClientWidth
 00065669    push        8
 0006566B    mov         edi,dword ptr [ebp-14]
 0006566E    push        edi
 0006566F    push        3F
 00065671    call        kernel32.MulDiv
 00065676    mov         edx,eax
 00065678    mov         eax,dword ptr [ebp-10]
 0006567B    call        TCustomForm.SetClientHeight
 00065680    mov         dl,4
 00065682    mov         eax,dword ptr [ebp-10]
 00065685    call        TCustomForm.SetPosition
 0006568A    mov         ecx,dword ptr [ebp-10]
 0006568D    mov         dl,1
 0006568F    mov         eax,[00034260];TLabel
 00065694    call        TCustomLabel.Create
 00065699    mov         esi,eax
 0006569B    mov         edx,dword ptr [ebp-10]
 0006569E    mov         eax,esi
 000656A0    mov         ecx,dword ptr [eax]
 000656A2    call        dword ptr [ecx+64]
 000656A5    mov         dl,1
 000656A7    mov         eax,esi
 000656A9    mov         ecx,dword ptr [eax]
 000656AB    call        dword ptr [ecx+90]
 000656B1    push        4
 000656B3    mov         eax,dword ptr [ebp-18]
 000656B6    push        eax
 000656B7    push        8
 000656B9    call        kernel32.MulDiv
 000656BE    mov         edx,eax
 000656C0    mov         eax,esi
 000656C2    call        TControl.SetLeft
 000656C7    push        8
 000656C9    push        edi
 000656CA    push        8
 000656CC    call        kernel32.MulDiv
 000656D1    mov         edx,eax
 000656D3    mov         eax,esi
 000656D5    call        TControl.SetTop
 000656DA    mov         edx,dword ptr [ebp-4]
 000656DD    mov         eax,esi
 000656DF    call        TControl.SetText
 000656E4    mov         ecx,dword ptr [ebp-10]
 000656E7    mov         dl,1
 000656E9    mov         eax,[00034A68];TEdit
 000656EE    call        TCustomEdit.Create
 000656F3    mov         ebx,eax
 000656F5    mov         edx,dword ptr [ebp-10]
 000656F8    mov         eax,ebx
 000656FA    mov         ecx,dword ptr [eax]
 000656FC    call        dword ptr [ecx+64]
 000656FF    mov         edx,dword ptr [esi+30]
 00065702    mov         eax,ebx
 00065704    call        TControl.SetLeft
 00065709    push        8
 0006570B    push        edi
 0006570C    push        13
 0006570E    call        kernel32.MulDiv
 00065713    mov         edx,eax
 00065715    mov         eax,ebx
 00065717    call        TControl.SetTop
 0006571C    push        4
 0006571E    mov         eax,dword ptr [ebp-18]
 00065721    push        eax
 00065722    push        0A4
 00065727    call        kernel32.MulDiv
 0006572C    mov         edx,eax
 0006572E    mov         eax,ebx
 00065730    call        TControl.SetWidth
 00065735    mov         edx,0FF
 0006573A    mov         eax,ebx
 0006573C    call        TCustomEdit.SetMaxLength
 00065741    mov         edx,dword ptr [ebp-8]
 00065744    mov         edx,dword ptr [edx]
 00065746    mov         eax,ebx
 00065748    call        TControl.SetText
 0006574D    mov         eax,ebx
 0006574F    call        TCustomEdit.SelectAll
 00065754    push        8
 00065756    push        edi
 00065757    push        29
 00065759    call        kernel32.MulDiv
 0006575E    mov         esi,eax
 00065760    push        4
 00065762    mov         eax,dword ptr [ebp-18]
 00065765    push        eax
 00065766    push        32
 00065768    call        kernel32.MulDiv
 0006576D    mov         dword ptr [ebp-1C],eax
 00065770    push        8
 00065772    push        edi
 00065773    push        0E
 00065775    call        kernel32.MulDiv
 0006577A    mov         dword ptr [ebp-20],eax
 0006577D    mov         ecx,dword ptr [ebp-10]
 00065780    mov         dl,1
 00065782    mov         eax,[00036984];TButton
 00065787    call        TButton.Create
 0006578C    mov         edi,eax
 0006578E    mov         edx,dword ptr [ebp-10]
 00065791    mov         eax,edi
 00065793    mov         ecx,dword ptr [eax]
 00065795    call        dword ptr [ecx+64]
 00065798    lea         edx,[ebp-24]
 0006579B    mov         eax,[000B5948];^SMsgDlgOK:TResStringRec
 000657A0    call        LoadResString
 000657A5    mov         edx,dword ptr [ebp-24]
 000657A8    mov         eax,edi
 000657AA    call        TControl.SetText
 000657AF    mov         dword ptr [edi+1F4],1
 000657B9    mov         dl,1
 000657BB    mov         eax,edi
 000657BD    call        TButton.SetDefault
 000657C2    mov         eax,dword ptr [ebp-1C]
 000657C5    push        eax
 000657C6    mov         eax,dword ptr [ebp-20]
 000657C9    push        eax
 000657CA    push        4
 000657CC    mov         eax,dword ptr [ebp-18]
 000657CF    push        eax
 000657D0    push        26
 000657D2    call        kernel32.MulDiv
 000657D7    mov         edx,eax
 000657D9    mov         ecx,esi
 000657DB    mov         eax,edi
 000657DD    mov         edi,dword ptr [eax]
 000657DF    call        dword ptr [edi+80]
 000657E5    mov         ecx,dword ptr [ebp-10]
 000657E8    mov         dl,1
 000657EA    mov         eax,[00036984];TButton
 000657EF    call        TButton.Create
 000657F4    mov         edi,eax
 000657F6    mov         edx,dword ptr [ebp-10]
 000657F9    mov         eax,edi
 000657FB    mov         ecx,dword ptr [eax]
 000657FD    call        dword ptr [ecx+64]
 00065800    lea         edx,[ebp-24]
 00065803    mov         eax,[000B5848];^SCancelButton:TResStringRec
 00065808    call        LoadResString
 0006580D    mov         edx,dword ptr [ebp-24]
 00065810    mov         eax,edi
 00065812    call        TControl.SetText
 00065817    mov         dword ptr [edi+1F4],2
 00065821    mov         byte ptr [edi+1F1],1
 00065828    mov         eax,dword ptr [ebp-1C]
 0006582B    push        eax
 0006582C    mov         eax,dword ptr [ebp-20]
 0006582F    push        eax
 00065830    push        4
 00065832    mov         eax,dword ptr [ebp-18]
 00065835    push        eax
 00065836    push        5C
 00065838    call        kernel32.MulDiv
 0006583D    mov         edx,eax
 0006583F    mov         ecx,esi
 00065841    mov         eax,edi
 00065843    mov         esi,dword ptr [eax]
 00065845    call        dword ptr [esi+80]
 0006584B    mov         eax,dword ptr [ebp-10]
 0006584E    mov         edx,dword ptr [eax]
 00065850    call        dword ptr [edx+0CC]
 00065856    dec         eax
>00065857    jne         00065872
 00065859    lea         edx,[ebp-28]
 0006585C    mov         eax,ebx
 0006585E    call        TControl.GetText
 00065863    mov         edx,dword ptr [ebp-28]
 00065866    mov         eax,dword ptr [ebp-8]
 00065869    call        @LStrAsg
 0006586E    mov         byte ptr [ebp-9],1
 00065872    xor         eax,eax
 00065874    pop         edx
 00065875    pop         ecx
 00065876    pop         ecx
 00065877    mov         dword ptr fs:[eax],edx
 0006587A    push        6588F
 0006587F    mov         eax,dword ptr [ebp-10]
 00065882    call        TObject.Free
 00065887    ret
>00065888    jmp         @HandleFinally
>0006588D    jmp         0006587F
 0006588F    xor         eax,eax
 00065891    pop         edx
 00065892    pop         ecx
 00065893    pop         ecx
 00065894    mov         dword ptr fs:[eax],edx
 00065897    push        658B4
 0006589C    lea         eax,[ebp-28]
 0006589F    call        @LStrClr
 000658A4    lea         eax,[ebp-24]
 000658A7    call        @LStrClr
 000658AC    ret
>000658AD    jmp         @HandleFinally
>000658B2    jmp         0006589C
 000658B4    mov         al,byte ptr [ebp-9]
 000658B7    pop         edi
 000658B8    pop         esi
 000658B9    pop         ebx
 000658BA    mov         esp,ebp
 000658BC    pop         ebp
 000658BD    ret
*}
end;

//000658C0
procedure InitGlobals;
begin
{*
 000658C0    add         esp,0FFFFFFD0
 000658C3    push        65924
 000658C8    call        user32.RegisterWindowMessageA
 000658CD    mov         [000B6804],eax
 000658D2    push        65934
 000658D7    call        user32.RegisterWindowMessageA
 000658DC    mov         [000B6808],eax
 000658E1    push        1
 000658E3    mov         eax,[000B5950];^HInstance:Longword
 000658E8    mov         eax,dword ptr [eax]
 000658EA    mov         dword ptr [esp+24],eax
 000658EE    mov         byte ptr [esp+28],0
 000658F3    call        kernel32.GetCurrentThreadId
 000658F8    mov         dword ptr [esp+2C],eax
 000658FC    mov         byte ptr [esp+30],0
 00065901    lea         ecx,[esp+24]
 00065905    mov         edx,65948
 0006590A    lea         eax,[esp+4]
 0006590E    call        StrFmt
 00065913    push        eax
 00065914    call        kernel32.GlobalAddAtomA
 00065919    mov         [000B4AFC],ax
 0006591F    add         esp,30
 00065922    ret
*}
end;

//0006595C
procedure _NF__45E;
begin
{*
 0006595C    sldt        word ptr [eax]
 0006595F    add         ah,cl
 00065961    dec         ebx
 00065962    or          eax,dword ptr [eax]
 00065964    push        0B56
 00065969    add         byte ptr [eax],al
 0006596B    add         al,cl
 0006596D    dec         ebx
 0006596E    or          eax,dword ptr [eax]
 00065970    pushfd
 00065971    pop         ecx
 00065972    or          eax,dword ptr [eax]
 00065974    add         byte ptr [eax],al
 00065976    add         byte ptr [eax],al
 00065978    les         ecx,fword ptr [ebx+0B]
 0006597B    add         byte ptr [eax],dh
 0006597D    push        esi
 0006597E    or          eax,dword ptr [eax]
 00065980    add         byte ptr [eax],al
 00065982    add         byte ptr [eax],al
 00065984    ror         byte ptr [ebx+0B],0
 00065988    cmp         byte ptr [ebx+0B],bl
 0006598B    add         byte ptr [eax],al
 0006598D    add         byte ptr [eax],al
 0006598F    add         byte ptr [ebx+ecx*2+59BC000B],bh
 00065996    or          eax,dword ptr [eax]
 00065998    add         byte ptr [eax],al
 0006599A    add         byte ptr [eax],al
 0006599C    mov         eax,24000B4B
 000659A1    pop         ecx
 000659A2    or          eax,dword ptr [eax]
 000659A4    add         byte ptr [eax],al
 000659A6    add         byte ptr [eax],al
 000659A8    mov         ah,4B
 000659AA    or          eax,dword ptr [eax]
 000659AC    test        byte ptr [edx+0B],bl
 000659AF    add         byte ptr [eax],al
 000659B1    add         byte ptr [eax],al
 000659B3    add         byte ptr [eax+48000B4B],dh
 000659B9    pop         eax
 000659BA    or          eax,dword ptr [eax]
 000659BC    add         byte ptr [eax],al
 000659BE    add         byte ptr [eax],al
 000659C0    lods        byte ptr [esi]
 000659C1    dec         ebx
 000659C2    or          eax,dword ptr [eax]
 000659C4    dec         eax
 000659C5    pop         ecx
 000659C6    or          eax,dword ptr [eax]
 000659C8    add         byte ptr [eax],al
 000659CA    add         byte ptr [eax],al
 000659CC    test        al,4B
 000659CE    or          eax,dword ptr [eax]
>000659D0    je          00065A2A
 000659D2    or          eax,dword ptr [eax]
 000659D4    add         byte ptr [eax],al
 000659D6    add         byte ptr [eax],al
 000659D8    movs        byte ptr [edi],byte ptr [esi]
 000659D9    dec         ebx
 000659DA    or          eax,dword ptr [eax]
 000659DC    mov         eax,0B5B
 000659E1    add         byte ptr [eax],al
 000659E3    add         byte ptr [ebx+ecx*2+0B],bl
 000659E7    add         al,ah
 000659E9    push        esi
 000659EA    or          eax,dword ptr [eax]
 000659EC    add         byte ptr [eax],al
 000659EE    add         byte ptr [eax],al
 000659F0    pop         eax
 000659F1    dec         ebx
 000659F2    or          eax,dword ptr [eax]
 000659F4    adc         al,5B
 000659F6    or          eax,dword ptr [eax]
 000659F8    add         byte ptr [eax],al
 000659FA    add         byte ptr [eax],al
 000659FC    push        esp
 000659FD    dec         ebx
 000659FE    or          eax,dword ptr [eax]
>00065A00    jo          00065A5D
 00065A02    or          eax,dword ptr [eax]
 00065A04    add         byte ptr [eax],al
 00065A06    add         byte ptr [eax],al
 00065A08    push        eax
 00065A09    dec         ebx
 00065A0A    or          eax,dword ptr [eax]
 00065A0C    int         3
 00065A0D    pop         eax
 00065A0E    or          eax,dword ptr [eax]
 00065A10    add         byte ptr [eax],al
 00065A12    add         byte ptr [eax],al
*}
end;

Initialization
//00065A70
{*
 00065A70    sub         dword ptr ds:[0B6800],1
>00065A77    jae         00065A88
 00065A79    mov         eax,6595C;_NF__45E
 00065A7E    call        @InitImports
 00065A83    call        InitGlobals
 00065A88    ret
*}
Finalization
//00065A14
{*
 00065A14    push        ebp
 00065A15    mov         ebp,esp
 00065A17    xor         eax,eax
 00065A19    push        ebp
 00065A1A    push        65A66
 00065A1F    push        dword ptr fs:[eax]
 00065A22    mov         dword ptr fs:[eax],esp
 00065A25    inc         dword ptr ds:[0B6800]
>00065A2B    jne         00065A58
 00065A2D    cmp         word ptr ds:[0B4AFC],0
>00065A35    je          00065A43
 00065A37    mov         ax,[000B4AFC]
 00065A3D    push        eax
 00065A3E    call        kernel32.GlobalDeleteAtom
 00065A43    mov         eax,0B4B78
 00065A48    mov         ecx,0B
 00065A4D    mov         edx,dword ptr ds:[110CC];String
 00065A53    call        @FinalizeArray
 00065A58    xor         eax,eax
 00065A5A    pop         edx
 00065A5B    pop         ecx
 00065A5C    pop         ecx
 00065A5D    mov         dword ptr fs:[eax],edx
 00065A60    push        65A6D
 00065A65    ret
>00065A66    jmp         @HandleFinally
>00065A6B    jmp         00065A65
 00065A6D    pop         ebp
 00065A6E    ret
*}
end.