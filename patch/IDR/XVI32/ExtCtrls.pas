//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit ExtCtrls;

interface

uses
  SysUtils, Classes, Graphics;

type
  TPaintBox = class(TGraphicControl)
  public
    OnPaint:TNotifyEvent;//f118
    constructor Create(AOwner:TComponent); virtual;//v2C//000622AC
    procedure Paint; virtual;//v88//00062308
  end;
  TImage = class(TGraphicControl)
  public
    Picture:TPicture;//f118
    OnProgress:TProgressEvent;//f11C
    Stretch:Boolean;//f124
    Center:Boolean;//f125
    IncrementalDisplay:Boolean;//f126
    Transparent:Boolean;//f127
    FDrawing:Boolean;//f128
    destructor Destroy; virtual;//00062410
    constructor Create(AOwner:TComponent); virtual;//v2C//0006237C
    function CanAutoSize(var NewWidth:Integer; var NewHeight:Integer):Boolean; virtual;//v38//00062834
    procedure Paint; virtual;//v88//000624FC
    procedure Progress(Sender:TObject; Stage:TProgressStage; PercentDone:Byte; RedrawNow:Boolean; const R:TRect; const Msg:AnsiString); dynamic;//00062654
    procedure GetPalette; dynamic;//00062440
    function DestRect:TRect;//0006245C
    function DoPaletteChange:Boolean;//000625BC
    procedure SetCenter(Value:Boolean);//000626C0
    procedure SetPicture(Value:TPicture);//000626D8
    procedure SetStretch(Value:Boolean);//000626E8
    procedure SetTransparent(Value:Boolean);//00062700
    procedure PictureChanged(Sender:TObject);//00062718
  end;
  TTimer = class(TComponent)
  public
    Interval:Cardinal;//f24
    FWindowHandle:HWND;//f28
    OnTimer:TNotifyEvent;//f2C
    Enabled:Boolean;//f34
    destructor Destroy; virtual;//000628EC
    constructor Create(AOwner:TComponent); virtual;//v2C//0006289C
    procedure Timer; dynamic;//00062A5C
    procedure WndProc(var Msg:TMessage);//00062924
    procedure UpdateTimer;//00062998
    procedure SetEnabled(Value:Boolean);//00062A24
    procedure SetInterval(Value:Cardinal);//00062A34
    procedure SetOnTimer(Value:TNotifyEvent);//00062A44
  end;
  TCustomPanel = class(TCustomControl)
  public
    FAutoSizeDocking:Boolean;//f1F0
    FBevelInner:TBevelCut;//f1F1
    FBevelOuter:TBevelCut;//f1F2
    FBevelWidth:TBevelWidth;//f1F4
    FBorderWidth:TBorderWidth;//f1F8
    FBorderStyle:TBorderStyle;//f1FC
    FFullRepaint:Boolean;//f1FD
    FLocked:Boolean;//f1FE
    FAlignment:TAlignment;//f1FF
    constructor Create(AOwner:TComponent); virtual;//v2C//00062A70
    function CanAutoSize(var NewWidth:Integer; var NewHeight:Integer):Boolean; virtual;//v38//00063084
    procedure AdjustClientRect(var Rect:TRect); virtual;//v88//00062EEC
    procedure CreateParams(var Params:TCreateParams); virtual;//v94//00062B08
    procedure Paint; virtual;//vB8//00062CF0
    procedure WMWindowPosChanged(var Message:TWMWindowPosChanged); message WM_WINDOWPOSCHANGED;//00062BB8
    procedure CMCtl3DChanged(var Message:TMessage); message CM_CTL3DCHANGED;//00062B78
    procedure CMTextChanged; message CM_TEXTCHANGED;//00062B70
    procedure CMIsToolControl(var Message:TMessage); message CM_ISTOOLCONTROL;//00062BA4
    procedure CMDockClient(var Message:TCMDockClient); message CM_DOCKCLIENT;//00062F44
    procedure CMBorderChanged(var Message:TMessage); message CM_BORDERCHANGED;//00062B5C
    procedure sub_0004310C; dynamic;//00062EE4
    procedure SetAlignment(Value:TAlignment);//00062E54
    procedure SetBevelInner(Value:TBevelCut);//00062E60
    procedure SetBevelOuter(Value:TBevelCut);//00062E7C
    procedure SetBevelWidth(Value:TBevelWidth);//00062E98
    procedure SetBorderWidth(Value:TBorderWidth);//00062EB4
    procedure SetBorderStyle(Value:TBorderStyle);//00062ED0
  end;
  TPanel = class(TCustomPanel)
  end;
  TCustomRadioGroup = class(TCustomGroupBox)
  public
    FButtons:TList;//f1F0
    FItems:TStrings;//f1F4
    FItemIndex:Integer;//f1F8
    FColumns:Integer;//f1FC
    FReading:Boolean;//f200
    FUpdating:Boolean;//f201
    destructor Destroy; virtual;//00063450
    procedure ReadState(Reader:TReader); virtual;//v14//000636AC
    constructor Create(AOwner:TComponent); virtual;//v2C//000633C0
    //function vBC:?; virtual;//vBC//00063914
    procedure WMSize(var Message:TMessage); message WM_SIZE;//00063900
    procedure CMEnabledChanged(var Message:TMessage); message CM_ENABLEDCHANGED;//000638AC
    procedure CMFontChanged(var Message:TMessage); message CM_FONTCHANGED;//000638EC
    procedure FlipChildren(AllLevels:Boolean); dynamic;//0006349C
    procedure GetChildren(Proc:TGetChildProc; Root:TComponent); dynamic;//00063918
    procedure ArrangeButtons;//000634A0
    procedure ButtonClick(Sender:TObject);//00063638
    procedure ItemsChange(Sender:TObject);//00063670
    procedure SetButtonCount(Value:Integer);//000636D0
    procedure SetColumns(Value:Integer);//00063710
    procedure SetItemIndex(Value:Integer);//00063748
    procedure SetItems(Value:TStrings);//000637C4
    procedure UpdateButtons;//000637D4
  end;
  TRadioGroup = class(TCustomRadioGroup)
  end;
  TGroupButton = class(TRadioButton)
  public
    FInClick:Boolean;//f1F4
    destructor Destroy; virtual;//0006328C
    procedure CNCommand(var Message:TWMCommand); dynamic;//000632C4
    procedure KeyPress(var Key:Char); dynamic;//00063354
    procedure KeyDown(var Key:Word; Shift:TShiftState); dynamic;//00063394
    constructor InternalCreate(RadioGroup:TCustomRadioGroup);//00063208
  end;
    procedure DoRect;//00062188
    procedure Frame3D(Canvas:TCanvas; var Rect:TRect; TopColor:TColor; BottomColor:TColor; Width:Integer);//0006224C
    constructor Create(AOwner:TComponent);//000622AC
    procedure Paint;//00062308
    constructor Create(AOwner:TComponent);//0006237C
    destructor Destroy;//00062410
    procedure GetPalette;//00062440
    procedure Paint;//000624FC
    procedure Progress(Sender:TObject; Stage:TProgressStage; PercentDone:Byte; RedrawNow:Boolean; const R:TRect; const Msg:AnsiString);//00062654
    function CanAutoSize(var NewWidth:Integer; var NewHeight:Integer):Boolean;//00062834
    constructor Create(AOwner:TComponent);//0006289C
    destructor Destroy;//000628EC
    procedure Timer;//00062A5C
    constructor Create(AOwner:TComponent);//00062A70
    procedure CreateParams(var Params:TCreateParams);//00062B08
    procedure CMBorderChanged(var Message:TMessage);//00062B5C
    procedure CMTextChanged;//00062B70
    procedure CMCtl3DChanged(var Message:TMessage);//00062B78
    procedure CMIsToolControl(var Message:TMessage);//00062BA4
    procedure WMWindowPosChanged(var Message:TWMWindowPosChanged);//00062BB8
    procedure AdjustColors(Bevel:TBevelCut);//00062CB8
    procedure Paint;//00062CF0
    procedure sub_0004310C;//00062EE4
    procedure AdjustClientRect(var Rect:TRect);//00062EEC
    procedure CMDockClient(var Message:TCMDockClient);//00062F44
    function CanAutoSize(var NewWidth:Integer; var NewHeight:Integer):Boolean;//00063084
    destructor Destroy;//0006328C
    procedure CNCommand(var Message:TWMCommand);//000632C4
    procedure KeyPress(var Key:Char);//00063354
    procedure KeyDown(var Key:Word; Shift:TShiftState);//00063394
    constructor Create(AOwner:TComponent);//000633C0
    destructor Destroy;//00063450
    procedure FlipChildren(AllLevels:Boolean);//0006349C
    procedure ReadState(Reader:TReader);//000636AC
    procedure CMEnabledChanged(var Message:TMessage);//000638AC
    procedure CMFontChanged(var Message:TMessage);//000638EC
    procedure WMSize(var Message:TMessage);//00063900
    //function sub_00063914:?;//00063914
    procedure GetChildren(Proc:TGetChildProc; Root:TComponent);//00063918

implementation

//00062188
procedure DoRect;
begin
{*
 00062188    push        ebp
 00062189    mov         ebp,esp
 0006218B    add         esp,0FFFFFFD8
 0006218E    push        ebx
 0006218F    mov         ebx,dword ptr [ebp+8]
 00062192    mov         ebx,dword ptr [ebx-4]
 00062195    mov         eax,dword ptr [ebx+8]
 00062198    mov         dword ptr [ebp-8],eax
 0006219B    mov         eax,dword ptr [ebx+4]
 0006219E    mov         dword ptr [ebp-4],eax
 000621A1    mov         eax,dword ptr [ebx]
 000621A3    mov         dword ptr [ebp-10],eax
 000621A6    mov         eax,dword ptr [ebx+0C]
 000621A9    mov         dword ptr [ebp-0C],eax
 000621AC    mov         eax,dword ptr [ebp+8]
 000621AF    mov         edx,dword ptr [eax-0C]
 000621B2    mov         eax,dword ptr [ebp+8]
 000621B5    mov         eax,dword ptr [eax-8]
 000621B8    mov         eax,dword ptr [eax+10]
 000621BB    call        TPen.SetColor
 000621C0    mov         eax,dword ptr [ebp-10]
 000621C3    mov         dword ptr [ebp-28],eax
 000621C6    mov         eax,dword ptr [ebp-0C]
 000621C9    mov         dword ptr [ebp-24],eax
 000621CC    mov         eax,dword ptr [ebx]
 000621CE    mov         dword ptr [ebp-20],eax
 000621D1    mov         eax,dword ptr [ebx+4]
 000621D4    mov         dword ptr [ebp-1C],eax
 000621D7    mov         eax,dword ptr [ebp-8]
 000621DA    mov         dword ptr [ebp-18],eax
 000621DD    mov         eax,dword ptr [ebp-4]
 000621E0    mov         dword ptr [ebp-14],eax
 000621E3    lea         edx,[ebp-28]
 000621E6    mov         eax,dword ptr [ebp+8]
 000621E9    mov         eax,dword ptr [eax-8]
 000621EC    mov         ecx,2
 000621F1    call        TCanvas.Polyline
 000621F6    mov         eax,dword ptr [ebp+8]
 000621F9    mov         edx,dword ptr [eax+0C]
 000621FC    mov         eax,dword ptr [ebp+8]
 000621FF    mov         eax,dword ptr [eax-8]
 00062202    mov         eax,dword ptr [eax+10]
 00062205    call        TPen.SetColor
 0006220A    dec         dword ptr [ebp-10]
 0006220D    mov         eax,dword ptr [ebp-8]
 00062210    mov         dword ptr [ebp-28],eax
 00062213    mov         eax,dword ptr [ebp-4]
 00062216    mov         dword ptr [ebp-24],eax
 00062219    mov         eax,dword ptr [ebx+8]
 0006221C    mov         dword ptr [ebp-20],eax
 0006221F    mov         eax,dword ptr [ebx+0C]
 00062222    mov         dword ptr [ebp-1C],eax
 00062225    mov         eax,dword ptr [ebp-10]
 00062228    mov         dword ptr [ebp-18],eax
 0006222B    mov         eax,dword ptr [ebp-0C]
 0006222E    mov         dword ptr [ebp-14],eax
 00062231    lea         edx,[ebp-28]
 00062234    mov         eax,dword ptr [ebp+8]
 00062237    mov         eax,dword ptr [eax-8]
 0006223A    mov         ecx,2
 0006223F    call        TCanvas.Polyline
 00062244    pop         ebx
 00062245    mov         esp,ebp
 00062247    pop         ebp
 00062248    ret
*}
end;

//0006224C
procedure Frame3D(Canvas:TCanvas; var Rect:TRect; TopColor:TColor; BottomColor:TColor; Width:Integer);
begin
{*
 0006224C    push        ebp
 0006224D    mov         ebp,esp
 0006224F    add         esp,0FFFFFFF4
 00062252    push        ebx
 00062253    mov         dword ptr [ebp-0C],ecx
 00062256    mov         dword ptr [ebp-4],edx
 00062259    mov         dword ptr [ebp-8],eax
 0006225C    mov         ebx,dword ptr [ebp+8]
 0006225F    mov         eax,dword ptr [ebp-8]
 00062262    mov         eax,dword ptr [eax+10]
 00062265    mov         edx,1
 0006226A    call        TPen.SetWidth
 0006226F    mov         eax,dword ptr [ebp-4]
 00062272    dec         dword ptr [eax+0C]
 00062275    mov         eax,dword ptr [ebp-4]
 00062278    dec         dword ptr [eax+8]
 0006227B    test        ebx,ebx
>0006227D    jle         00062298
 0006227F    dec         ebx
 00062280    push        ebp
 00062281    call        DoRect
 00062286    pop         ecx
 00062287    push        0FF
 00062289    push        0FF
 0006228B    mov         eax,dword ptr [ebp-4]
 0006228E    push        eax
 0006228F    call        user32.InflateRect
 00062294    test        ebx,ebx
>00062296    jg          0006227F
 00062298    mov         eax,dword ptr [ebp-4]
 0006229B    inc         dword ptr [eax+0C]
 0006229E    mov         eax,dword ptr [ebp-4]
 000622A1    inc         dword ptr [eax+8]
 000622A4    pop         ebx
 000622A5    mov         esp,ebp
 000622A7    pop         ebp
 000622A8    ret         8
*}
end;

//000622AC
constructor TPaintBox.Create(AOwner:TComponent);
begin
{*
 000622AC    push        ebx
 000622AD    push        esi
 000622AE    test        dl,dl
>000622B0    je          000622BA
 000622B2    add         esp,0FFFFFFF0
 000622B5    call        @ClassCreate
 000622BA    mov         ebx,edx
 000622BC    mov         esi,eax
 000622BE    xor         edx,edx
 000622C0    mov         eax,esi
 000622C2    call        TGraphicControl.Create
 000622C7    mov         eax,[00062304]
 000622CC    or          eax,dword ptr [esi+40]
 000622CF    mov         dword ptr [esi+40],eax
 000622D2    mov         edx,69
 000622D7    mov         eax,esi
 000622D9    call        TControl.SetWidth
 000622DE    mov         edx,69
 000622E3    mov         eax,esi
 000622E5    call        TControl.SetHeight
 000622EA    mov         eax,esi
 000622EC    test        bl,bl
>000622EE    je          000622FF
 000622F0    call        @AfterConstruction
 000622F5    pop         dword ptr fs:[0]
 000622FC    add         esp,0C
 000622FF    mov         eax,esi
 00062301    pop         esi
 00062302    pop         ebx
 00062303    ret
*}
end;

//00062308
procedure TPaintBox.Paint;
begin
{*
 00062308    push        ebx
 00062309    push        esi
 0006230A    mov         ebx,eax
 0006230C    mov         edx,dword ptr [ebx+58]
 0006230F    mov         eax,dword ptr [ebx+114]
 00062315    call        TCanvas.SetFont
 0006231A    mov         eax,dword ptr [ebx+114]
 00062320    mov         eax,dword ptr [eax+14]
 00062323    mov         edx,dword ptr [ebx+64]
 00062326    call        TBrush.SetColor
 0006232B    test        byte ptr [ebx+20],10
>0006232F    je          0006235E
 00062331    mov         esi,dword ptr [ebx+114]
 00062337    mov         dl,1
 00062339    mov         eax,dword ptr [esi+10]
 0006233C    call        TPen.SetStyle
 00062341    mov         dl,1
 00062343    mov         eax,dword ptr [esi+14]
 00062346    call        TBrush.SetStyle
 0006234B    mov         eax,dword ptr [ebx+38]
 0006234E    push        eax
 0006234F    mov         eax,dword ptr [ebx+3C]
 00062352    push        eax
 00062353    xor         ecx,ecx
 00062355    xor         edx,edx
 00062357    mov         eax,esi
 00062359    call        TCanvas.Rectangle
 0006235E    cmp         word ptr [ebx+11A],0
>00062366    je          00062376
 00062368    mov         edx,ebx
 0006236A    mov         eax,dword ptr [ebx+11C]
 00062370    call        dword ptr [ebx+118]
 00062376    pop         esi
 00062377    pop         ebx
 00062378    ret
*}
end;

//0006237C
constructor TImage.Create(AOwner:TComponent);
begin
{*
 0006237C    push        ebp
 0006237D    mov         ebp,esp
 0006237F    push        ecx
 00062380    push        ebx
 00062381    push        esi
 00062382    test        dl,dl
>00062384    je          0006238E
 00062386    add         esp,0FFFFFFF0
 00062389    call        @ClassCreate
 0006238E    mov         byte ptr [ebp-1],dl
 00062391    mov         ebx,eax
 00062393    xor         edx,edx
 00062395    mov         eax,ebx
 00062397    call        TGraphicControl.Create
 0006239C    mov         eax,[0006240C]
 000623A1    or          eax,dword ptr [ebx+40]
 000623A4    mov         dword ptr [ebx+40],eax
 000623A7    mov         dl,1
 000623A9    mov         eax,[00028CCC];TPicture
 000623AE    call        TPicture.Create
 000623B3    mov         esi,eax
 000623B5    mov         dword ptr [ebx+118],esi
 000623BB    mov         dword ptr [esi+0C],ebx
 000623BE    mov         dword ptr [esi+8],62718;TImage.PictureChanged
 000623C5    mov         dword ptr [esi+18],ebx
 000623C8    mov         eax,ebx
 000623CA    mov         dx,0FFCE
 000623CE    call        @FindDynaInst
 000623D3    mov         dword ptr [esi+14],eax
 000623D6    mov         edx,69
 000623DB    mov         eax,ebx
 000623DD    call        TControl.SetHeight
 000623E2    mov         edx,69
 000623E7    mov         eax,ebx
 000623E9    call        TControl.SetWidth
 000623EE    mov         eax,ebx
 000623F0    cmp         byte ptr [ebp-1],0
>000623F4    je          00062405
 000623F6    call        @AfterConstruction
 000623FB    pop         dword ptr fs:[0]
 00062402    add         esp,0C
 00062405    mov         eax,ebx
 00062407    pop         esi
 00062408    pop         ebx
 00062409    pop         ecx
 0006240A    pop         ebp
 0006240B    ret
*}
end;

//00062410
destructor TImage.Destroy;
begin
{*
 00062410    push        ebx
 00062411    push        esi
 00062412    call        @BeforeDestruction
 00062417    mov         ebx,edx
 00062419    mov         esi,eax
 0006241B    mov         eax,dword ptr [esi+118]
 00062421    call        TObject.Free
 00062426    mov         edx,ebx
 00062428    and         dl,0FC
 0006242B    mov         eax,esi
 0006242D    call        TGraphicControl.Destroy
 00062432    test        bl,bl
>00062434    jle         0006243D
 00062436    mov         eax,esi
 00062438    call        @ClassDestroy
 0006243D    pop         esi
 0006243E    pop         ebx
 0006243F    ret
*}
end;

//00062440
procedure TImage.GetPalette;
begin
{*
 00062440    xor         edx,edx
 00062442    mov         ecx,dword ptr [eax+118]
 00062448    mov         ecx,dword ptr [ecx+4]
 0006244B    test        ecx,ecx
>0006244D    je          00062458
 0006244F    mov         eax,ecx
 00062451    mov         edx,dword ptr [eax]
 00062453    call        dword ptr [edx+24]
 00062456    mov         edx,eax
 00062458    mov         eax,edx
 0006245A    ret
*}
end;

//0006245C
function TImage.DestRect:TRect;
begin
{*
 0006245C    push        ebx
 0006245D    push        esi
 0006245E    mov         esi,edx
 00062460    mov         ebx,eax
 00062462    cmp         byte ptr [ebx+124],0
>00062469    je          00062477
 0006246B    mov         edx,esi
 0006246D    mov         eax,ebx
 0006246F    mov         ecx,dword ptr [eax]
 00062471    call        dword ptr [ecx+44]
 00062474    pop         esi
 00062475    pop         ebx
 00062476    ret
 00062477    cmp         byte ptr [ebx+125],0
>0006247E    je          000624D3
 00062480    mov         eax,dword ptr [ebx+118]
 00062486    call        TPicture.GetHeight
 0006248B    push        eax
 0006248C    push        esi
 0006248D    mov         eax,dword ptr [ebx+118]
 00062493    call        TPicture.GetHeight
 00062498    mov         edx,dword ptr [ebx+3C]
 0006249B    sub         edx,eax
 0006249D    sar         edx,1
>0006249F    jns         000624A4
 000624A1    adc         edx,0
 000624A4    push        edx
 000624A5    mov         eax,dword ptr [ebx+118]
 000624AB    call        TPicture.GetWidth
 000624B0    mov         edx,dword ptr [ebx+38]
 000624B3    sub         edx,eax
 000624B5    sar         edx,1
>000624B7    jns         000624BC
 000624B9    adc         edx,0
 000624BC    push        edx
 000624BD    mov         eax,dword ptr [ebx+118]
 000624C3    call        TPicture.GetWidth
 000624C8    mov         ecx,eax
 000624CA    pop         eax
 000624CB    pop         edx
 000624CC    call        Bounds
>000624D1    jmp         000624F6
 000624D3    mov         eax,dword ptr [ebx+118]
 000624D9    call        TPicture.GetHeight
 000624DE    push        eax
 000624DF    push        esi
 000624E0    mov         eax,dword ptr [ebx+118]
 000624E6    call        TPicture.GetWidth
 000624EB    mov         ecx,eax
 000624ED    xor         edx,edx
 000624EF    xor         eax,eax
 000624F1    call        Rect
 000624F6    pop         esi
 000624F7    pop         ebx
 000624F8    ret
*}
end;

//000624FC
procedure TImage.Paint;
begin
{*
 000624FC    push        ebp
 000624FD    mov         ebp,esp
 000624FF    add         esp,0FFFFFFE8
 00062502    push        ebx
 00062503    mov         dword ptr [ebp-4],eax
 00062506    mov         eax,dword ptr [ebp-4]
 00062509    test        byte ptr [eax+20],10
>0006250D    je          00062545
 0006250F    mov         eax,dword ptr [ebp-4]
 00062512    mov         ebx,dword ptr [eax+114]
 00062518    mov         eax,dword ptr [ebx+10]
 0006251B    mov         dl,1
 0006251D    call        TPen.SetStyle
 00062522    mov         eax,dword ptr [ebx+14]
 00062525    mov         dl,1
 00062527    call        TBrush.SetStyle
 0006252C    mov         eax,dword ptr [ebp-4]
 0006252F    mov         eax,dword ptr [eax+38]
 00062532    push        eax
 00062533    mov         eax,dword ptr [ebp-4]
 00062536    mov         eax,dword ptr [eax+3C]
 00062539    push        eax
 0006253A    xor         ecx,ecx
 0006253C    xor         edx,edx
 0006253E    mov         eax,ebx
 00062540    call        TCanvas.Rectangle
 00062545    mov         eax,dword ptr [ebp-4]
 00062548    mov         al,byte ptr [eax+128]
 0006254E    mov         byte ptr [ebp-5],al
 00062551    mov         eax,dword ptr [ebp-4]
 00062554    mov         byte ptr [eax+128],1
 0006255B    xor         eax,eax
 0006255D    push        ebp
 0006255E    push        625AD
 00062563    push        dword ptr fs:[eax]
 00062566    mov         dword ptr fs:[eax],esp
 00062569    mov         eax,dword ptr [ebp-4]
 0006256C    mov         ebx,dword ptr [eax+114]
 00062572    lea         edx,[ebp-18]
 00062575    mov         eax,dword ptr [ebp-4]
 00062578    call        TImage.DestRect
 0006257D    lea         edx,[ebp-18]
 00062580    mov         eax,dword ptr [ebp-4]
 00062583    mov         eax,dword ptr [eax+118]
 00062589    mov         ecx,dword ptr [eax+4]
 0006258C    mov         eax,ebx
 0006258E    call        TCanvas.StretchDraw
 00062593    xor         eax,eax
 00062595    pop         edx
 00062596    pop         ecx
 00062597    pop         ecx
 00062598    mov         dword ptr fs:[eax],edx
 0006259B    push        625B4
 000625A0    mov         eax,dword ptr [ebp-4]
 000625A3    mov         dl,byte ptr [ebp-5]
 000625A6    mov         byte ptr [eax+128],dl
 000625AC    ret
>000625AD    jmp         @HandleFinally
>000625B2    jmp         000625A0
 000625B4    pop         ebx
 000625B5    mov         esp,ebp
 000625B7    pop         ebp
 000625B8    ret
*}
end;

//000625BC
function TImage.DoPaletteChange:Boolean;
begin
{*
 000625BC    push        ebx
 000625BD    push        esi
 000625BE    push        edi
 000625BF    push        ebp
 000625C0    mov         ebp,eax
 000625C2    xor         ebx,ebx
 000625C4    mov         eax,dword ptr [ebp+118]
 000625CA    mov         esi,dword ptr [eax+4]
 000625CD    cmp         byte ptr [ebp+47],0
>000625D1    je          0006264C
 000625D3    test        byte ptr [ebp+20],1
>000625D7    jne         0006264C
 000625D9    test        esi,esi
>000625DB    je          0006264C
 000625DD    cmp         byte ptr [esi+16],0
>000625E1    je          0006264C
 000625E3    mov         eax,esi
 000625E5    mov         edx,dword ptr [eax]
 000625E7    call        dword ptr [edx+24]
 000625EA    test        eax,eax
>000625EC    jne         000625F4
 000625EE    mov         byte ptr [esi+16],0
>000625F2    jmp         0006264C
 000625F4    mov         eax,ebp
 000625F6    call        GetParentForm
 000625FB    mov         edi,eax
 000625FD    test        edi,edi
>000625FF    je          0006264C
 00062601    cmp         byte ptr [edi+20E],0
>00062608    je          0006264C
 0006260A    mov         eax,edi
 0006260C    call        TWinControl.HandleAllocated
 00062611    test        al,al
>00062613    je          0006264C
 00062615    cmp         byte ptr [ebp+128],0
>0006261C    je          00062630
 0006261E    push        0
 00062620    xor         ecx,ecx
 00062622    mov         edx,30F
 00062627    mov         eax,edi
 00062629    call        TControl.Perform
>0006262E    jmp         00062646
 00062630    push        0
 00062632    push        0
 00062634    push        30F
 00062639    mov         eax,edi
 0006263B    call        TWinControl.GetHandle
 00062640    push        eax
 00062641    call        user32.PostMessageA
 00062646    mov         bl,1
 00062648    mov         byte ptr [esi+16],0
 0006264C    mov         eax,ebx
 0006264E    pop         ebp
 0006264F    pop         edi
 00062650    pop         esi
 00062651    pop         ebx
 00062652    ret
*}
end;

//00062654
procedure TImage.Progress(Sender:TObject; Stage:TProgressStage; PercentDone:Byte; RedrawNow:Boolean; const R:TRect; const Msg:AnsiString);
begin
{*
 00062654    push        ebp
 00062655    mov         ebp,esp
 00062657    push        ecx
 00062658    push        ebx
 00062659    push        esi
 0006265A    push        edi
 0006265B    mov         byte ptr [ebp-1],cl
 0006265E    mov         edi,edx
 00062660    mov         esi,eax
 00062662    mov         ebx,dword ptr [ebp+10]
 00062665    test        byte ptr [esi+126],bl
>0006266B    je          0006268E
 0006266D    mov         eax,esi
 0006266F    call        TImage.DoPaletteChange
 00062674    test        al,al
>00062676    je          00062684
 00062678    mov         eax,esi
 0006267A    mov         edx,dword ptr [eax]
 0006267C    call        dword ptr [edx+84]
>00062682    jmp         0006268E
 00062684    mov         eax,esi
 00062686    mov         edx,dword ptr [eax]
 00062688    call        dword ptr [edx+88]
 0006268E    cmp         word ptr [esi+11E],0
>00062696    je          000626B6
 00062698    mov         al,byte ptr [ebp+14]
 0006269B    push        eax
 0006269C    push        ebx
 0006269D    mov         eax,dword ptr [ebp+0C]
 000626A0    push        eax
 000626A1    mov         eax,dword ptr [ebp+8]
 000626A4    push        eax
 000626A5    mov         cl,byte ptr [ebp-1]
 000626A8    mov         edx,edi
 000626AA    mov         eax,dword ptr [esi+120]
 000626B0    call        dword ptr [esi+11C]
 000626B6    pop         edi
 000626B7    pop         esi
 000626B8    pop         ebx
 000626B9    pop         ecx
 000626BA    pop         ebp
 000626BB    ret         10
*}
end;

//000626C0
procedure TImage.SetCenter(Value:Boolean);
begin
{*
 000626C0    cmp         dl,byte ptr [eax+125]
>000626C6    je          000626D5
 000626C8    mov         byte ptr [eax+125],dl
 000626CE    mov         edx,eax
 000626D0    call        TImage.PictureChanged
 000626D5    ret
*}
end;

//000626D8
procedure TImage.SetPicture(Value:TPicture);
begin
{*
 000626D8    push        esi
 000626D9    mov         esi,eax
 000626DB    mov         eax,dword ptr [esi+118]
 000626E1    mov         ecx,dword ptr [eax]
 000626E3    call        dword ptr [ecx+8]
 000626E6    pop         esi
 000626E7    ret
*}
end;

//000626E8
procedure TImage.SetStretch(Value:Boolean);
begin
{*
 000626E8    cmp         dl,byte ptr [eax+124]
>000626EE    je          000626FD
 000626F0    mov         byte ptr [eax+124],dl
 000626F6    mov         edx,eax
 000626F8    call        TImage.PictureChanged
 000626FD    ret
*}
end;

//00062700
procedure TImage.SetTransparent(Value:Boolean);
begin
{*
 00062700    cmp         dl,byte ptr [eax+127]
>00062706    je          00062715
 00062708    mov         byte ptr [eax+127],dl
 0006270E    mov         edx,eax
 00062710    call        TImage.PictureChanged
 00062715    ret
*}
end;

//00062718
procedure TImage.PictureChanged(Sender:TObject);
begin
{*
 00062718    push        ebx
 00062719    push        esi
 0006271A    mov         ebx,eax
 0006271C    cmp         byte ptr [ebx+4C],0
>00062720    je          00062768
 00062722    mov         eax,dword ptr [ebx+118]
 00062728    call        TPicture.GetWidth
 0006272D    test        eax,eax
>0006272F    jle         00062768
 00062731    mov         eax,dword ptr [ebx+118]
 00062737    call        TPicture.GetHeight
 0006273C    test        eax,eax
>0006273E    jle         00062768
 00062740    mov         eax,dword ptr [ebx+118]
 00062746    call        TPicture.GetWidth
 0006274B    push        eax
 0006274C    mov         eax,dword ptr [ebx+118]
 00062752    call        TPicture.GetHeight
 00062757    push        eax
 00062758    mov         ecx,dword ptr [ebx+34]
 0006275B    mov         edx,dword ptr [ebx+30]
 0006275E    mov         eax,ebx
 00062760    mov         esi,dword ptr [eax]
 00062762    call        dword ptr [esi+80]
 00062768    mov         eax,dword ptr [ebx+118]
 0006276E    mov         esi,dword ptr [eax+4]
 00062771    test        esi,esi
>00062773    je          0006280E
 00062779    mov         eax,esi
 0006277B    mov         edx,dword ptr ds:[28E34];TMetafile
 00062781    call        @IsClass
 00062786    test        al,al
>00062788    jne         000627A8
 0006278A    mov         eax,esi
 0006278C    mov         edx,dword ptr ds:[290B0];TIcon
 00062792    call        @IsClass
 00062797    test        al,al
>00062799    jne         000627A8
 0006279B    mov         dl,byte ptr [ebx+127]
 000627A1    mov         eax,esi
 000627A3    mov         ecx,dword ptr [eax]
 000627A5    call        dword ptr [ecx+3C]
 000627A8    mov         eax,esi
 000627AA    mov         edx,dword ptr [eax]
 000627AC    call        dword ptr [edx+28]
 000627AF    test        al,al
>000627B1    jne         000627E1
 000627B3    cmp         byte ptr [ebx+124],0
>000627BA    jne         000627D4
 000627BC    mov         eax,esi
 000627BE    mov         edx,dword ptr [eax]
 000627C0    call        dword ptr [edx+2C]
 000627C3    cmp         eax,dword ptr [ebx+38]
>000627C6    jl          000627E1
 000627C8    mov         eax,esi
 000627CA    mov         edx,dword ptr [eax]
 000627CC    call        dword ptr [edx+20]
 000627CF    cmp         eax,dword ptr [ebx+3C]
>000627D2    jl          000627E1
 000627D4    mov         eax,[00062830]
 000627D9    or          eax,dword ptr [ebx+40]
 000627DC    mov         dword ptr [ebx+40],eax
>000627DF    jmp         000627EE
 000627E1    mov         eax,[00062830]
 000627E6    not         eax
 000627E8    and         eax,dword ptr [ebx+40]
 000627EB    mov         dword ptr [ebx+40],eax
 000627EE    mov         eax,ebx
 000627F0    call        TImage.DoPaletteChange
 000627F5    test        al,al
>000627F7    je          0006281B
 000627F9    cmp         byte ptr [ebx+128],0
>00062800    je          0006281B
 00062802    mov         eax,ebx
 00062804    mov         edx,dword ptr [eax]
 00062806    call        dword ptr [edx+84]
>0006280C    jmp         0006281B
 0006280E    mov         eax,[00062830]
 00062813    not         eax
 00062815    and         eax,dword ptr [ebx+40]
 00062818    mov         dword ptr [ebx+40],eax
 0006281B    cmp         byte ptr [ebx+128],0
>00062822    jne         0006282B
 00062824    mov         eax,ebx
 00062826    mov         edx,dword ptr [eax]
 00062828    call        dword ptr [edx+78]
 0006282B    pop         esi
 0006282C    pop         ebx
 0006282D    ret
*}
end;

//00062834
function TImage.CanAutoSize(var NewWidth:Integer; var NewHeight:Integer):Boolean;
begin
{*
 00062834    push        ebx
 00062835    push        esi
 00062836    push        edi
 00062837    push        ebp
 00062838    mov         ebp,ecx
 0006283A    mov         edi,edx
 0006283C    mov         esi,eax
 0006283E    mov         bl,1
 00062840    test        byte ptr [esi+20],10
>00062844    je          00062864
 00062846    mov         eax,dword ptr [esi+118]
 0006284C    call        TPicture.GetWidth
 00062851    test        eax,eax
>00062853    jle         00062893
 00062855    mov         eax,dword ptr [esi+118]
 0006285B    call        TPicture.GetHeight
 00062860    test        eax,eax
>00062862    jle         00062893
 00062864    mov         al,byte ptr [esi+4B]
 00062867    test        al,al
>00062869    je          00062871
 0006286B    add         al,0FD
 0006286D    sub         al,2
>0006286F    jae         0006287E
 00062871    mov         eax,dword ptr [esi+118]
 00062877    call        TPicture.GetWidth
 0006287C    mov         dword ptr [edi],eax
 0006287E    mov         al,byte ptr [esi+4B]
 00062881    sub         al,3
>00062883    jae         00062893
 00062885    mov         eax,dword ptr [esi+118]
 0006288B    call        TPicture.GetHeight
 00062890    mov         dword ptr [ebp],eax
 00062893    mov         eax,ebx
 00062895    pop         ebp
 00062896    pop         edi
 00062897    pop         esi
 00062898    pop         ebx
 00062899    ret
*}
end;

//0006289C
constructor TTimer.Create(AOwner:TComponent);
begin
{*
 0006289C    push        ebx
 0006289D    push        esi
 0006289E    test        dl,dl
>000628A0    je          000628AA
 000628A2    add         esp,0FFFFFFF0
 000628A5    call        @ClassCreate
 000628AA    mov         ebx,edx
 000628AC    mov         esi,eax
 000628AE    xor         edx,edx
 000628B0    mov         eax,esi
 000628B2    call        TComponent.Create
 000628B7    mov         byte ptr [esi+34],1
 000628BB    mov         dword ptr [esi+24],3E8
 000628C2    push        esi
 000628C3    push        62924;TTimer.WndProc
 000628C8    call        AllocateHWnd
 000628CD    mov         dword ptr [esi+28],eax
 000628D0    mov         eax,esi
 000628D2    test        bl,bl
>000628D4    je          000628E5
 000628D6    call        @AfterConstruction
 000628DB    pop         dword ptr fs:[0]
 000628E2    add         esp,0C
 000628E5    mov         eax,esi
 000628E7    pop         esi
 000628E8    pop         ebx
 000628E9    ret
*}
end;

//000628EC
destructor TTimer.Destroy;
begin
{*
 000628EC    push        ebx
 000628ED    push        esi
 000628EE    call        @BeforeDestruction
 000628F3    mov         ebx,edx
 000628F5    mov         esi,eax
 000628F7    mov         byte ptr [esi+34],0
 000628FB    mov         eax,esi
 000628FD    call        TTimer.UpdateTimer
 00062902    mov         eax,dword ptr [esi+28]
 00062905    call        DeallocateHWnd
 0006290A    mov         edx,ebx
 0006290C    and         dl,0FC
 0006290F    mov         eax,esi
 00062911    call        TComponent.Destroy
 00062916    test        bl,bl
>00062918    jle         00062921
 0006291A    mov         eax,esi
 0006291C    call        @ClassDestroy
 00062921    pop         esi
 00062922    pop         ebx
 00062923    ret
*}
end;

//00062924
procedure TTimer.WndProc(var Msg:TMessage);
begin
{*
 00062924    push        ebp
 00062925    mov         ebp,esp
 00062927    push        ecx
 00062928    push        ebx
 00062929    push        esi
 0006292A    push        edi
 0006292B    mov         ebx,edx
 0006292D    mov         dword ptr [ebp-4],eax
 00062930    mov         esi,dword ptr [ebx]
 00062932    cmp         esi,113
>00062938    jne         00062979
 0006293A    xor         eax,eax
 0006293C    push        ebp
 0006293D    push        6295E
 00062942    push        dword ptr fs:[eax]
 00062945    mov         dword ptr fs:[eax],esp
 00062948    mov         eax,dword ptr [ebp-4]
 0006294B    mov         bx,0FFF0
 0006294F    call        @CallDynaInst
 00062954    xor         eax,eax
 00062956    pop         edx
 00062957    pop         ecx
 00062958    pop         ecx
 00062959    mov         dword ptr fs:[eax],edx
>0006295C    jmp         00062991
>0006295E    jmp         @HandleAnyException
 00062963    mov         eax,[000B59E8];^Application:TApplication
 00062968    mov         eax,dword ptr [eax]
 0006296A    mov         edx,dword ptr [ebp-4]
 0006296D    call        TApplication.HandleException
 00062972    call        @DoneExcept
>00062977    jmp         00062991
 00062979    mov         eax,dword ptr [ebx+8]
 0006297C    push        eax
 0006297D    mov         eax,dword ptr [ebx+4]
 00062980    push        eax
 00062981    push        esi
 00062982    mov         eax,dword ptr [ebp-4]
 00062985    mov         eax,dword ptr [eax+28]
 00062988    push        eax
 00062989    call        user32.DefWindowProcA
 0006298E    mov         dword ptr [ebx+0C],eax
 00062991    pop         edi
 00062992    pop         esi
 00062993    pop         ebx
 00062994    pop         ecx
 00062995    pop         ebp
 00062996    ret
*}
end;

//00062998
procedure TTimer.UpdateTimer;
begin
{*
 00062998    push        ebp
 00062999    mov         ebp,esp
 0006299B    push        0
 0006299D    push        ebx
 0006299E    push        esi
 0006299F    mov         ebx,eax
 000629A1    xor         eax,eax
 000629A3    push        ebp
 000629A4    push        62A17
 000629A9    push        dword ptr fs:[eax]
 000629AC    mov         dword ptr fs:[eax],esp
 000629AF    push        1
 000629B1    mov         eax,dword ptr [ebx+28]
 000629B4    push        eax
 000629B5    call        user32.KillTimer
 000629BA    mov         esi,dword ptr [ebx+24]
 000629BD    test        esi,esi
>000629BF    je          00062A01
 000629C1    cmp         byte ptr [ebx+34],0
>000629C5    je          00062A01
 000629C7    cmp         word ptr [ebx+2E],0
>000629CC    je          00062A01
 000629CE    push        0
 000629D0    push        esi
 000629D1    push        1
 000629D3    mov         eax,dword ptr [ebx+28]
 000629D6    push        eax
 000629D7    call        user32.SetTimer
 000629DC    test        eax,eax
>000629DE    jne         00062A01
 000629E0    lea         edx,[ebp-4]
 000629E3    mov         eax,[000B5BD8];^SNoTimers:TResStringRec
 000629E8    call        LoadResString
 000629ED    mov         ecx,dword ptr [ebp-4]
 000629F0    mov         dl,1
 000629F2    mov         eax,[0001EE08];EOutOfResources
 000629F7    call        Exception.Create
 000629FC    call        @RaiseExcept
 00062A01    xor         eax,eax
 00062A03    pop         edx
 00062A04    pop         ecx
 00062A05    pop         ecx
 00062A06    mov         dword ptr fs:[eax],edx
 00062A09    push        62A1E
 00062A0E    lea         eax,[ebp-4]
 00062A11    call        @LStrClr
 00062A16    ret
>00062A17    jmp         @HandleFinally
>00062A1C    jmp         00062A0E
 00062A1E    pop         esi
 00062A1F    pop         ebx
 00062A20    pop         ecx
 00062A21    pop         ebp
 00062A22    ret
*}
end;

//00062A24
procedure TTimer.SetEnabled(Value:Boolean);
begin
{*
 00062A24    cmp         dl,byte ptr [eax+34]
>00062A27    je          00062A31
 00062A29    mov         byte ptr [eax+34],dl
 00062A2C    call        TTimer.UpdateTimer
 00062A31    ret
*}
end;

//00062A34
procedure TTimer.SetInterval(Value:Cardinal);
begin
{*
 00062A34    cmp         edx,dword ptr [eax+24]
>00062A37    je          00062A41
 00062A39    mov         dword ptr [eax+24],edx
 00062A3C    call        TTimer.UpdateTimer
 00062A41    ret
*}
end;

//00062A44
procedure TTimer.SetOnTimer(Value:TNotifyEvent);
begin
{*
 00062A44    push        ebp
 00062A45    mov         ebp,esp
 00062A47    mov         edx,dword ptr [ebp+8]
 00062A4A    mov         dword ptr [eax+2C],edx
 00062A4D    mov         edx,dword ptr [ebp+0C]
 00062A50    mov         dword ptr [eax+30],edx
 00062A53    call        TTimer.UpdateTimer
 00062A58    pop         ebp
 00062A59    ret         8
*}
end;

//00062A5C
procedure TTimer.Timer;
begin
{*
 00062A5C    push        ebx
 00062A5D    cmp         word ptr [eax+2E],0
>00062A62    je          00062A6E
 00062A64    mov         ebx,eax
 00062A66    mov         edx,eax
 00062A68    mov         eax,dword ptr [ebx+30]
 00062A6B    call        dword ptr [ebx+2C]
 00062A6E    pop         ebx
 00062A6F    ret
*}
end;

//00062A70
constructor TCustomPanel.Create(AOwner:TComponent);
begin
{*
 00062A70    push        ebx
 00062A71    push        esi
 00062A72    test        dl,dl
>00062A74    je          00062A7E
 00062A76    add         esp,0FFFFFFF0
 00062A79    call        @ClassCreate
 00062A7E    mov         ebx,edx
 00062A80    mov         esi,eax
 00062A82    xor         edx,edx
 00062A84    mov         eax,esi
 00062A86    call        TCustomControl.Create
 00062A8B    mov         eax,[00062B04]
 00062A90    mov         dword ptr [esi+40],eax
 00062A93    mov         edx,0B9
 00062A98    mov         eax,esi
 00062A9A    call        TControl.SetWidth
 00062A9F    mov         edx,29
 00062AA4    mov         eax,esi
 00062AA6    call        TControl.SetHeight
 00062AAB    mov         byte ptr [esi+1FF],2
 00062AB2    mov         dl,2
 00062AB4    mov         eax,esi
 00062AB6    call        TCustomPanel.SetBevelOuter
 00062ABB    mov         edx,1
 00062AC0    mov         eax,esi
 00062AC2    call        TCustomPanel.SetBevelWidth
 00062AC7    mov         byte ptr [esi+1FC],0
 00062ACE    mov         edx,8000000F
 00062AD3    mov         eax,esi
 00062AD5    call        TControl.SetColor
 00062ADA    mov         byte ptr [esi+1FD],1
 00062AE1    mov         dl,1
 00062AE3    mov         eax,esi
 00062AE5    call        TWinControl.SetUseDockManager
 00062AEA    mov         eax,esi
 00062AEC    test        bl,bl
>00062AEE    je          00062AFF
 00062AF0    call        @AfterConstruction
 00062AF5    pop         dword ptr fs:[0]
 00062AFC    add         esp,0C
 00062AFF    mov         eax,esi
 00062B01    pop         esi
 00062B02    pop         ebx
 00062B03    ret
*}
end;

//00062B08
procedure TCustomPanel.CreateParams(var Params:TCreateParams);
begin
{*
 00062B08    push        ebx
 00062B09    push        esi
 00062B0A    mov         esi,edx
 00062B0C    mov         ebx,eax
 00062B0E    mov         edx,esi
 00062B10    mov         eax,ebx
 00062B12    call        TWinControl.CreateParams
 00062B17    xor         eax,eax
 00062B19    mov         al,byte ptr [ebx+1FC]
 00062B1F    mov         eax,dword ptr [eax*4+0B4AE4]
 00062B26    or          dword ptr [esi+4],eax
 00062B29    mov         eax,[000B58C0];NewStyleControls:Boolean
 00062B2E    cmp         byte ptr [eax],0
>00062B31    je          00062B53
 00062B33    cmp         byte ptr [ebx+12C],0
>00062B3A    je          00062B53
 00062B3C    cmp         byte ptr [ebx+1FC],1
>00062B43    jne         00062B53
 00062B45    and         dword ptr [esi+4],0FF7FFFFF
 00062B4C    or          dword ptr [esi+8],200
 00062B53    and         dword ptr [esi+24],0FFFFFFFC
 00062B57    pop         esi
 00062B58    pop         ebx
 00062B59    ret
*}
end;

//00062B5C
procedure TCustomPanel.CMBorderChanged(var Message:TMessage);
begin
{*
 00062B5C    push        esi
 00062B5D    mov         esi,eax
 00062B5F    mov         eax,esi
 00062B61    call        TWinControl.CMBorderChanged
 00062B66    mov         eax,esi
 00062B68    mov         edx,dword ptr [eax]
 00062B6A    call        dword ptr [edx+78]
 00062B6D    pop         esi
 00062B6E    ret
*}
end;

//00062B70
procedure TCustomPanel.CMTextChanged;
begin
{*
 00062B70    mov         edx,dword ptr [eax]
 00062B72    call        dword ptr [edx+78];TWinControl.Invalidate
 00062B75    ret
*}
end;

//00062B78
procedure TCustomPanel.CMCtl3DChanged(var Message:TMessage);
begin
{*
 00062B78    push        ebx
 00062B79    push        esi
 00062B7A    mov         esi,edx
 00062B7C    mov         ebx,eax
 00062B7E    mov         eax,[000B58C0];NewStyleControls:Boolean
 00062B83    cmp         byte ptr [eax],0
>00062B86    je          00062B98
 00062B88    cmp         byte ptr [ebx+1FC],1
>00062B8F    jne         00062B98
 00062B91    mov         eax,ebx
 00062B93    call        TWinControl.RecreateWnd
 00062B98    mov         edx,esi
 00062B9A    mov         eax,ebx
 00062B9C    call        TWinControl.CMCtl3DChanged
 00062BA1    pop         esi
 00062BA2    pop         ebx
 00062BA3    ret
*}
end;

//00062BA4
procedure TCustomPanel.CMIsToolControl(var Message:TMessage);
begin
{*
 00062BA4    cmp         byte ptr [eax+1FE],0
>00062BAB    jne         00062BB4
 00062BAD    mov         dword ptr [edx+0C],1
 00062BB4    ret
*}
end;

//00062BB8
procedure TCustomPanel.WMWindowPosChanged(var Message:TWMWindowPosChanged);
begin
{*
 00062BB8    push        ebp
 00062BB9    mov         ebp,esp
 00062BBB    add         esp,0FFFFFFEC
 00062BBE    push        ebx
 00062BBF    push        esi
 00062BC0    push        edi
 00062BC1    xor         ecx,ecx
 00062BC3    mov         dword ptr [ebp-14],ecx
 00062BC6    mov         edi,edx
 00062BC8    mov         ebx,eax
 00062BCA    xor         eax,eax
 00062BCC    push        ebp
 00062BCD    push        62CA8
 00062BD2    push        dword ptr fs:[eax]
 00062BD5    mov         dword ptr fs:[eax],esp
 00062BD8    cmp         byte ptr [ebx+1FD],0
>00062BDF    jne         00062BF1
 00062BE1    lea         edx,[ebp-14]
 00062BE4    mov         eax,ebx
 00062BE6    call        TControl.GetText
 00062BEB    cmp         dword ptr [ebp-14],0
>00062BEF    je          00062BFD
 00062BF1    mov         eax,ebx
 00062BF3    mov         edx,dword ptr [eax]
 00062BF5    call        dword ptr [edx+78]
>00062BF8    jmp         00062C89
 00062BFD    mov         esi,dword ptr [ebx+1F8]
 00062C03    cmp         byte ptr [ebx+1F1],0
>00062C0A    je          00062C12
 00062C0C    add         esi,dword ptr [ebx+1F4]
 00062C12    cmp         byte ptr [ebx+1F2],0
>00062C19    je          00062C21
 00062C1B    add         esi,dword ptr [ebx+1F4]
 00062C21    test        esi,esi
>00062C23    jle         00062C89
 00062C25    mov         eax,dword ptr [ebx+38]
 00062C28    mov         dword ptr [ebp-8],eax
 00062C2B    mov         eax,dword ptr [ebx+3C]
 00062C2E    mov         dword ptr [ebp-4],eax
 00062C31    mov         eax,dword ptr [edi+8]
 00062C34    mov         eax,dword ptr [eax+10]
 00062C37    cmp         eax,dword ptr [ebp-8]
>00062C3A    je          00062C5D
 00062C3C    xor         eax,eax
 00062C3E    mov         dword ptr [ebp-0C],eax
 00062C41    mov         eax,dword ptr [ebp-8]
 00062C44    sub         eax,esi
 00062C46    dec         eax
 00062C47    mov         dword ptr [ebp-10],eax
 00062C4A    push        0FF
 00062C4C    lea         eax,[ebp-10]
 00062C4F    push        eax
 00062C50    mov         eax,ebx
 00062C52    call        TWinControl.GetHandle
 00062C57    push        eax
 00062C58    call        user32.InvalidateRect
 00062C5D    mov         eax,dword ptr [edi+8]
 00062C60    mov         eax,dword ptr [eax+14]
 00062C63    cmp         eax,dword ptr [ebp-4]
>00062C66    je          00062C89
 00062C68    xor         eax,eax
 00062C6A    mov         dword ptr [ebp-10],eax
 00062C6D    mov         eax,dword ptr [ebp-4]
 00062C70    sub         eax,esi
 00062C72    dec         eax
 00062C73    mov         dword ptr [ebp-0C],eax
 00062C76    push        0FF
 00062C78    lea         eax,[ebp-10]
 00062C7B    push        eax
 00062C7C    mov         eax,ebx
 00062C7E    call        TWinControl.GetHandle
 00062C83    push        eax
 00062C84    call        user32.InvalidateRect
 00062C89    mov         edx,edi
 00062C8B    mov         eax,ebx
 00062C8D    call        TWinControl.WMWindowPosChanged
 00062C92    xor         eax,eax
 00062C94    pop         edx
 00062C95    pop         ecx
 00062C96    pop         ecx
 00062C97    mov         dword ptr fs:[eax],edx
 00062C9A    push        62CAF
 00062C9F    lea         eax,[ebp-14]
 00062CA2    call        @LStrClr
 00062CA7    ret
>00062CA8    jmp         @HandleFinally
>00062CAD    jmp         00062C9F
 00062CAF    pop         edi
 00062CB0    pop         esi
 00062CB1    pop         ebx
 00062CB2    mov         esp,ebp
 00062CB4    pop         ebp
 00062CB5    ret
*}
end;

//00062CB8
procedure AdjustColors(Bevel:TBevelCut);
begin
{*
 00062CB8    push        ebp
 00062CB9    mov         ebp,esp
 00062CBB    mov         edx,dword ptr [ebp+8]
 00062CBE    mov         dword ptr [edx-4],80000014
 00062CC5    cmp         al,1
>00062CC7    jne         00062CD3
 00062CC9    mov         edx,dword ptr [ebp+8]
 00062CCC    mov         dword ptr [edx-4],80000010
 00062CD3    mov         edx,dword ptr [ebp+8]
 00062CD6    mov         dword ptr [edx-8],80000010
 00062CDD    cmp         al,1
>00062CDF    jne         00062CEB
 00062CE1    mov         eax,dword ptr [ebp+8]
 00062CE4    mov         dword ptr [eax-8],80000014
 00062CEB    pop         ebp
 00062CEC    ret
*}
end;

//00062CF0
procedure TCustomPanel.Paint;
begin
{*
 00062CF0    push        ebp
 00062CF1    mov         ebp,esp
 00062CF3    add         esp,0FFFFFFE4
 00062CF6    push        ebx
 00062CF7    push        esi
 00062CF8    push        edi
 00062CF9    xor         edx,edx
 00062CFB    mov         dword ptr [ebp-1C],edx
 00062CFE    mov         ebx,eax
 00062D00    xor         eax,eax
 00062D02    push        ebp
 00062D03    push        62E39
 00062D08    push        dword ptr fs:[eax]
 00062D0B    mov         dword ptr fs:[eax],esp
 00062D0E    lea         edx,[ebp-18]
 00062D11    mov         eax,ebx
 00062D13    mov         ecx,dword ptr [eax]
 00062D15    call        dword ptr [ecx+44]
 00062D18    mov         al,byte ptr [ebx+1F2]
 00062D1E    test        al,al
>00062D20    je          00062D45
 00062D22    push        ebp
 00062D23    call        AdjustColors
 00062D28    pop         ecx
 00062D29    mov         eax,dword ptr [ebp-8]
 00062D2C    push        eax
 00062D2D    mov         eax,dword ptr [ebx+1F4]
 00062D33    push        eax
 00062D34    lea         edx,[ebp-18]
 00062D37    mov         ecx,dword ptr [ebp-4]
 00062D3A    mov         eax,dword ptr [ebx+1EC]
 00062D40    call        Frame3D
 00062D45    mov         eax,dword ptr [ebx+64]
 00062D48    push        eax
 00062D49    mov         edx,dword ptr [ebx+1F8]
 00062D4F    push        edx
 00062D50    lea         edx,[ebp-18]
 00062D53    mov         ecx,eax
 00062D55    mov         eax,dword ptr [ebx+1EC]
 00062D5B    call        Frame3D
 00062D60    mov         al,byte ptr [ebx+1F1]
 00062D66    test        al,al
>00062D68    je          00062D8D
 00062D6A    push        ebp
 00062D6B    call        AdjustColors
 00062D70    pop         ecx
 00062D71    mov         eax,dword ptr [ebp-8]
 00062D74    push        eax
 00062D75    mov         eax,dword ptr [ebx+1F4]
 00062D7B    push        eax
 00062D7C    lea         edx,[ebp-18]
 00062D7F    mov         ecx,dword ptr [ebp-4]
 00062D82    mov         eax,dword ptr [ebx+1EC]
 00062D88    call        Frame3D
 00062D8D    mov         esi,dword ptr [ebx+1EC]
 00062D93    mov         edx,dword ptr [ebx+64]
 00062D96    mov         eax,dword ptr [esi+14]
 00062D99    call        TBrush.SetColor
 00062D9E    lea         edx,[ebp-18]
 00062DA1    mov         eax,esi
 00062DA3    call        TCanvas.FillRect
 00062DA8    mov         dl,1
 00062DAA    mov         eax,dword ptr [esi+14]
 00062DAD    call        TBrush.SetStyle
 00062DB2    mov         edx,dword ptr [ebx+58]
 00062DB5    mov         eax,esi
 00062DB7    call        TCanvas.SetFont
 00062DBC    mov         edx,62E50;'W'
 00062DC1    mov         eax,esi
 00062DC3    call        TCanvas.TextHeight
 00062DC8    mov         edx,dword ptr [ebp-0C]
 00062DCB    add         edx,dword ptr [ebp-14]
 00062DCE    sub         edx,eax
 00062DD0    sar         edx,1
>00062DD2    jns         00062DD7
 00062DD4    adc         edx,0
 00062DD7    mov         dword ptr [ebp-14],edx
 00062DDA    add         eax,edx
 00062DDC    mov         dword ptr [ebp-0C],eax
 00062DDF    xor         eax,eax
 00062DE1    mov         al,byte ptr [ebx+1FF]
 00062DE7    mov         edi,dword ptr [eax*4+0B4AEC]
 00062DEE    or          edi,44
 00062DF1    mov         edx,edi
 00062DF3    mov         eax,ebx
 00062DF5    call        TControl.DrawTextBiDiModeFlags
 00062DFA    mov         edi,eax
 00062DFC    push        edi
 00062DFD    lea         eax,[ebp-18]
 00062E00    push        eax
 00062E01    push        0FF
 00062E03    lea         edx,[ebp-1C]
 00062E06    mov         eax,ebx
 00062E08    call        TControl.GetText
 00062E0D    mov         eax,dword ptr [ebp-1C]
 00062E10    call        @LStrToPChar
 00062E15    push        eax
 00062E16    mov         eax,esi
 00062E18    call        TCanvas.GetHandle
 00062E1D    push        eax
 00062E1E    call        user32.DrawTextA
 00062E23    xor         eax,eax
 00062E25    pop         edx
 00062E26    pop         ecx
 00062E27    pop         ecx
 00062E28    mov         dword ptr fs:[eax],edx
 00062E2B    push        62E40
 00062E30    lea         eax,[ebp-1C]
 00062E33    call        @LStrClr
 00062E38    ret
>00062E39    jmp         @HandleFinally
>00062E3E    jmp         00062E30
 00062E40    pop         edi
 00062E41    pop         esi
 00062E42    pop         ebx
 00062E43    mov         esp,ebp
 00062E45    pop         ebp
 00062E46    ret
*}
end;

//00062E54
procedure TCustomPanel.SetAlignment(Value:TAlignment);
begin
{*
 00062E54    mov         byte ptr [eax+1FF],dl
 00062E5A    mov         edx,dword ptr [eax]
 00062E5C    call        dword ptr [edx+78]
 00062E5F    ret
*}
end;

//00062E60
procedure TCustomPanel.SetBevelInner(Value:TBevelCut);
begin
{*
 00062E60    push        ebx
 00062E61    mov         ebx,eax
 00062E63    mov         byte ptr [ebx+1F1],dl
 00062E69    mov         eax,ebx
 00062E6B    call        TWinControl.Realign
 00062E70    mov         eax,ebx
 00062E72    mov         edx,dword ptr [eax]
 00062E74    call        dword ptr [edx+78]
 00062E77    pop         ebx
 00062E78    ret
*}
end;

//00062E7C
procedure TCustomPanel.SetBevelOuter(Value:TBevelCut);
begin
{*
 00062E7C    push        ebx
 00062E7D    mov         ebx,eax
 00062E7F    mov         byte ptr [ebx+1F2],dl
 00062E85    mov         eax,ebx
 00062E87    call        TWinControl.Realign
 00062E8C    mov         eax,ebx
 00062E8E    mov         edx,dword ptr [eax]
 00062E90    call        dword ptr [edx+78]
 00062E93    pop         ebx
 00062E94    ret
*}
end;

//00062E98
procedure TCustomPanel.SetBevelWidth(Value:TBevelWidth);
begin
{*
 00062E98    push        ebx
 00062E99    mov         ebx,eax
 00062E9B    mov         dword ptr [ebx+1F4],edx
 00062EA1    mov         eax,ebx
 00062EA3    call        TWinControl.Realign
 00062EA8    mov         eax,ebx
 00062EAA    mov         edx,dword ptr [eax]
 00062EAC    call        dword ptr [edx+78]
 00062EAF    pop         ebx
 00062EB0    ret
*}
end;

//00062EB4
procedure TCustomPanel.SetBorderWidth(Value:TBorderWidth);
begin
{*
 00062EB4    push        ebx
 00062EB5    mov         ebx,eax
 00062EB7    mov         dword ptr [ebx+1F8],edx
 00062EBD    mov         eax,ebx
 00062EBF    call        TWinControl.Realign
 00062EC4    mov         eax,ebx
 00062EC6    mov         edx,dword ptr [eax]
 00062EC8    call        dword ptr [edx+78]
 00062ECB    pop         ebx
 00062ECC    ret
*}
end;

//00062ED0
procedure TCustomPanel.SetBorderStyle(Value:TBorderStyle);
begin
{*
 00062ED0    cmp         dl,byte ptr [eax+1FC]
>00062ED6    je          00062EE3
 00062ED8    mov         byte ptr [eax+1FC],dl
 00062EDE    call        TWinControl.RecreateWnd
 00062EE3    ret
*}
end;

//00062EE4
procedure TCustomPanel.sub_0004310C;
begin
{*
 00062EE4    mov         al,byte ptr [eax+1FF];TCustomPanel.FAlignment:TAlignment
 00062EEA    ret
*}
end;

//00062EEC
procedure TCustomPanel.AdjustClientRect(var Rect:TRect);
begin
{*
 00062EEC    push        ebx
 00062EED    push        esi
 00062EEE    mov         esi,edx
 00062EF0    mov         ebx,eax
 00062EF2    mov         edx,esi
 00062EF4    mov         eax,ebx
 00062EF6    call        TWinControl.AdjustClientRect
 00062EFB    mov         eax,dword ptr [ebx+1F8]
 00062F01    neg         eax
 00062F03    push        eax
 00062F04    mov         edx,dword ptr [ebx+1F8]
 00062F0A    neg         edx
 00062F0C    push        eax
 00062F0D    push        esi
 00062F0E    call        user32.InflateRect
 00062F13    xor         eax,eax
 00062F15    cmp         byte ptr [ebx+1F2],0
>00062F1C    je          00062F24
 00062F1E    add         eax,dword ptr [ebx+1F4]
 00062F24    cmp         byte ptr [ebx+1F1],0
>00062F2B    je          00062F33
 00062F2D    add         eax,dword ptr [ebx+1F4]
 00062F33    mov         edx,eax
 00062F35    neg         edx
 00062F37    push        edx
 00062F38    neg         eax
 00062F3A    push        edx
 00062F3B    push        esi
 00062F3C    call        user32.InflateRect
 00062F41    pop         esi
 00062F42    pop         ebx
 00062F43    ret
*}
end;

//00062F44
procedure TCustomPanel.CMDockClient(var Message:TCMDockClient);
begin
{*
 00062F44    push        ebp
 00062F45    mov         ebp,esp
 00062F47    add         esp,0FFFFFFE8
 00062F4A    push        ebx
 00062F4B    push        esi
 00062F4C    push        edi
 00062F4D    mov         dword ptr [ebp-8],edx
 00062F50    mov         dword ptr [ebp-4],eax
 00062F53    mov         eax,dword ptr [ebp-4]
 00062F56    cmp         byte ptr [eax+4C],0
>00062F5A    je          0006306F
 00062F60    mov         eax,dword ptr [ebp-4]
 00062F63    mov         byte ptr [eax+1F0],1
 00062F6A    xor         edx,edx
 00062F6C    push        ebp
 00062F6D    push        63068
 00062F72    push        dword ptr fs:[edx]
 00062F75    mov         dword ptr fs:[edx],esp
 00062F78    mov         eax,dword ptr [ebp-8]
 00062F7B    mov         eax,dword ptr [eax+4]
 00062F7E    lea         esi,[eax+38]
 00062F81    lea         edi,[ebp-18]
 00062F84    mov         ecx,4
 00062F89    rep movs    dword ptr [edi],dword ptr [esi]
 00062F8B    mov         eax,dword ptr [ebp-4]
 00062F8E    mov         al,byte ptr [eax+4B]
 00062F91    dec         al
>00062F93    je          00062FF5
 00062F95    dec         al
>00062F97    je          0006300E
 00062F99    dec         al
>00062F9B    je          00062FA6
 00062F9D    dec         al
>00062F9F    je          00062FC3
>00062FA1    jmp         0006303E
 00062FA6    mov         eax,dword ptr [ebp-4]
 00062FA9    cmp         dword ptr [eax+38],0
>00062FAD    jne         0006303E
 00062FB3    mov         edx,dword ptr [ebp-10]
 00062FB6    sub         edx,dword ptr [ebp-18]
 00062FB9    mov         eax,dword ptr [ebp-4]
 00062FBC    call        TControl.SetWidth
>00062FC1    jmp         0006303E
 00062FC3    mov         eax,dword ptr [ebp-4]
 00062FC6    cmp         dword ptr [eax+38],0
>00062FCA    jne         0006303E
 00062FCC    mov         eax,dword ptr [ebp-10]
 00062FCF    sub         eax,dword ptr [ebp-18]
 00062FD2    push        eax
 00062FD3    mov         edx,dword ptr [ebp-4]
 00062FD6    mov         edx,dword ptr [edx+3C]
 00062FD9    push        edx
 00062FDA    mov         edx,dword ptr [ebp-4]
 00062FDD    mov         ecx,dword ptr [edx+34]
 00062FE0    mov         edx,dword ptr [ebp-4]
 00062FE3    mov         edx,dword ptr [edx+30]
 00062FE6    sub         edx,eax
 00062FE8    mov         eax,dword ptr [ebp-4]
 00062FEB    mov         ebx,dword ptr [eax]
 00062FED    call        dword ptr [ebx+80]
>00062FF3    jmp         0006303E
 00062FF5    mov         eax,dword ptr [ebp-4]
 00062FF8    cmp         dword ptr [eax+3C],0
>00062FFC    jne         0006303E
 00062FFE    mov         edx,dword ptr [ebp-0C]
 00063001    sub         edx,dword ptr [ebp-14]
 00063004    mov         eax,dword ptr [ebp-4]
 00063007    call        TControl.SetHeight
>0006300C    jmp         0006303E
 0006300E    mov         eax,dword ptr [ebp-4]
 00063011    cmp         dword ptr [eax+3C],0
>00063015    jne         0006303E
 00063017    mov         eax,dword ptr [ebp-0C]
 0006301A    sub         eax,dword ptr [ebp-14]
 0006301D    mov         edx,dword ptr [ebp-4]
 00063020    mov         edx,dword ptr [edx+38]
 00063023    push        edx
 00063024    push        eax
 00063025    mov         edx,dword ptr [ebp-4]
 00063028    mov         ecx,dword ptr [edx+34]
 0006302B    sub         ecx,eax
 0006302D    mov         eax,dword ptr [ebp-4]
 00063030    mov         edx,dword ptr [eax+30]
 00063033    mov         eax,dword ptr [ebp-4]
 00063036    mov         ebx,dword ptr [eax]
 00063038    call        dword ptr [ebx+80]
 0006303E    mov         edx,dword ptr [ebp-8]
 00063041    mov         eax,dword ptr [ebp-4]
 00063044    call        TWinControl.CMDockClient
 00063049    call        @TryFinallyExit
>0006304E    jmp         0006307A
 00063050    xor         eax,eax
 00063052    pop         edx
 00063053    pop         ecx
 00063054    pop         ecx
 00063055    mov         dword ptr fs:[eax],edx
 00063058    push        6306F
 0006305D    mov         eax,dword ptr [ebp-4]
 00063060    mov         byte ptr [eax+1F0],0
 00063067    ret
>00063068    jmp         @HandleFinally
>0006306D    jmp         0006305D
 0006306F    mov         edx,dword ptr [ebp-8]
 00063072    mov         eax,dword ptr [ebp-4]
 00063075    call        TWinControl.CMDockClient
 0006307A    pop         edi
 0006307B    pop         esi
 0006307C    pop         ebx
 0006307D    mov         esp,ebp
 0006307F    pop         ebp
 00063080    ret
*}
end;

//00063084
function TCustomPanel.CanAutoSize(var NewWidth:Integer; var NewHeight:Integer):Boolean;
begin
{*
 00063084    push        ebx
 00063085    push        esi
 00063086    push        edi
 00063087    mov         edi,ecx
 00063089    mov         esi,edx
 0006308B    mov         ebx,eax
 0006308D    cmp         byte ptr [ebx+1F0],0
>00063094    jne         000630A5
 00063096    mov         ecx,edi
 00063098    mov         edx,esi
 0006309A    mov         eax,ebx
 0006309C    call        TWinControl.CanAutoSize
 000630A1    test        al,al
>000630A3    jne         000630A9
 000630A5    xor         eax,eax
>000630A7    jmp         000630AB
 000630A9    mov         al,1
 000630AB    pop         edi
 000630AC    pop         esi
 000630AD    pop         ebx
 000630AE    ret
*}
end;

//00063208
constructor TGroupButton.InternalCreate(RadioGroup:TCustomRadioGroup);
begin
{*
 00063208    push        ebx
 00063209    push        esi
 0006320A    push        edi
 0006320B    test        dl,dl
>0006320D    je          00063217
 0006320F    add         esp,0FFFFFFF0
 00063212    call        @ClassCreate
 00063217    mov         esi,ecx
 00063219    mov         ebx,edx
 0006321B    mov         edi,eax
 0006321D    mov         ecx,esi
 0006321F    xor         edx,edx
 00063221    mov         eax,edi
 00063223    call        TRadioButton.Create
 00063228    mov         edx,edi
 0006322A    mov         eax,dword ptr [esi+1F0]
 00063230    call        TList.Add
 00063235    xor         edx,edx
 00063237    mov         eax,edi
 00063239    call        TControl.SetVisible
 0006323E    mov         eax,esi
 00063240    mov         edx,dword ptr [eax]
 00063242    call        dword ptr [edx+50]
 00063245    mov         edx,eax
 00063247    mov         eax,edi
 00063249    mov         ecx,dword ptr [eax]
 0006324B    call        dword ptr [ecx+60]
 0006324E    xor         edx,edx
 00063250    mov         eax,edi
 00063252    call        TControl.SetParentShowHint
 00063257    mov         dword ptr [edi+108],esi
 0006325D    mov         dword ptr [edi+104],63638;TCustomRadioGroup.ButtonClick
 00063267    mov         edx,esi
 00063269    mov         eax,edi
 0006326B    mov         ecx,dword ptr [eax]
 0006326D    call        dword ptr [ecx+64]
 00063270    mov         eax,edi
 00063272    test        bl,bl
>00063274    je          00063285
 00063276    call        @AfterConstruction
 0006327B    pop         dword ptr fs:[0]
 00063282    add         esp,0C
 00063285    mov         eax,edi
 00063287    pop         edi
 00063288    pop         esi
 00063289    pop         ebx
 0006328A    ret
*}
end;

//0006328C
destructor TGroupButton.Destroy;
begin
{*
 0006328C    push        ebx
 0006328D    push        esi
 0006328E    call        @BeforeDestruction
 00063293    mov         ebx,edx
 00063295    mov         esi,eax
 00063297    mov         eax,dword ptr [esi+4]
 0006329A    mov         eax,dword ptr [eax+1F0]
 000632A0    mov         edx,esi
 000632A2    call        TList.Remove
 000632A7    mov         edx,ebx
 000632A9    and         dl,0FC
 000632AC    mov         eax,esi
 000632AE    call        TWinControl.Destroy
 000632B3    test        bl,bl
>000632B5    jle         000632BE
 000632B7    mov         eax,esi
 000632B9    call        @ClassDestroy
 000632BE    pop         esi
 000632BF    pop         ebx
 000632C0    ret
*}
end;

//000632C4
procedure TGroupButton.CNCommand(var Message:TWMCommand);
begin
{*
 000632C4    push        ebp
 000632C5    mov         ebp,esp
 000632C7    push        ecx
 000632C8    push        ebx
 000632C9    push        esi
 000632CA    push        edi
 000632CB    mov         ebx,edx
 000632CD    mov         dword ptr [ebp-4],eax
 000632D0    mov         eax,dword ptr [ebp-4]
 000632D3    cmp         byte ptr [eax+1F4],0
>000632DA    jne         0006334C
 000632DC    mov         eax,dword ptr [ebp-4]
 000632DF    mov         byte ptr [eax+1F4],1
 000632E6    xor         eax,eax
 000632E8    push        ebp
 000632E9    push        63329
 000632EE    push        dword ptr fs:[eax]
 000632F1    mov         dword ptr fs:[eax],esp
 000632F4    mov         si,word ptr [ebx+6]
 000632F8    test        si,si
>000632FB    je          00063303
 000632FD    cmp         si,5
>00063301    jne         0006331F
 00063303    mov         eax,dword ptr [ebp-4]
 00063306    mov         eax,dword ptr [eax+24]
 00063309    mov         edx,dword ptr [eax]
 0006330B    call        dword ptr [edx+0BC]
 00063311    test        al,al
>00063313    je          0006331F
 00063315    mov         edx,ebx
 00063317    mov         eax,dword ptr [ebp-4]
 0006331A    call        TRadioButton.CNCommand
 0006331F    xor         eax,eax
 00063321    pop         edx
 00063322    pop         ecx
 00063323    pop         ecx
 00063324    mov         dword ptr fs:[eax],edx
>00063327    jmp         00063342
>00063329    jmp         @HandleAnyException
 0006332E    mov         eax,[000B59E8];^Application:TApplication
 00063333    mov         eax,dword ptr [eax]
 00063335    mov         edx,dword ptr [ebp-4]
 00063338    call        TApplication.HandleException
 0006333D    call        @DoneExcept
 00063342    mov         eax,dword ptr [ebp-4]
 00063345    mov         byte ptr [eax+1F4],0
 0006334C    pop         edi
 0006334D    pop         esi
 0006334E    pop         ebx
 0006334F    pop         ecx
 00063350    pop         ebp
 00063351    ret
*}
end;

//00063354
procedure TGroupButton.KeyPress(var Key:Char);
begin
{*
 00063354    push        ebx
 00063355    push        esi
 00063356    push        edi
 00063357    mov         esi,edx
 00063359    mov         edi,eax
 0006335B    mov         edx,esi
 0006335D    mov         eax,edi
 0006335F    call        TWinControl.KeyPress
 00063364    mov         edx,esi
 00063366    mov         eax,dword ptr [edi+24]
 00063369    mov         bx,0FFBF
 0006336D    call        @CallDynaInst
 00063372    cmp         byte ptr [esi],8
>00063375    je          0006337C
 00063377    cmp         byte ptr [esi],20
>0006337A    jne         0006338E
 0006337C    mov         eax,dword ptr [edi+24]
 0006337F    mov         edx,dword ptr [eax]
 00063381    call        dword ptr [edx+0BC]
 00063387    test        al,al
>00063389    jne         0006338E
 0006338B    mov         byte ptr [esi],0
 0006338E    pop         edi
 0006338F    pop         esi
 00063390    pop         ebx
 00063391    ret
*}
end;

//00063394
procedure TGroupButton.KeyDown(var Key:Word; Shift:TShiftState);
begin
{*
 00063394    push        ebx
 00063395    push        esi
 00063396    push        ecx
 00063397    mov         byte ptr [esp],cl
 0006339A    mov         esi,edx
 0006339C    mov         ebx,eax
 0006339E    mov         edx,esi
 000633A0    mov         cl,byte ptr [esp]
 000633A3    mov         eax,ebx
 000633A5    call        TWinControl.KeyDown
 000633AA    mov         edx,esi
 000633AC    mov         cl,byte ptr [esp]
 000633AF    mov         eax,dword ptr [ebx+24]
 000633B2    mov         bx,0FFC1
 000633B6    call        @CallDynaInst
 000633BB    pop         edx
 000633BC    pop         esi
 000633BD    pop         ebx
 000633BE    ret
*}
end;

//000633C0
constructor TCustomRadioGroup.Create(AOwner:TComponent);
begin
{*
 000633C0    push        ebp
 000633C1    mov         ebp,esp
 000633C3    push        ecx
 000633C4    push        ebx
 000633C5    push        esi
 000633C6    test        dl,dl
>000633C8    je          000633D2
 000633CA    add         esp,0FFFFFFF0
 000633CD    call        @ClassCreate
 000633D2    mov         byte ptr [ebp-1],dl
 000633D5    mov         ebx,eax
 000633D7    xor         edx,edx
 000633D9    mov         eax,ebx
 000633DB    call        TCustomGroupBox.Create
 000633E0    mov         eax,[0006344C]
 000633E5    mov         dword ptr [ebx+40],eax
 000633E8    mov         dl,1
 000633EA    mov         eax,[0001EEC4];TList
 000633EF    call        TObject.Create
 000633F4    mov         dword ptr [ebx+1F0],eax
 000633FA    mov         dl,1
 000633FC    mov         eax,[0001F340];TStringList
 00063401    call        TObject.Create
 00063406    mov         esi,eax
 00063408    mov         dword ptr [ebx+1F4],esi
 0006340E    mov         dword ptr [esi+20],ebx
 00063411    mov         dword ptr [esi+1C],63670;TCustomRadioGroup.ItemsChange
 00063418    mov         dword ptr [ebx+1F8],0FFFFFFFF
 00063422    mov         dword ptr [ebx+1FC],1
 0006342C    mov         eax,ebx
 0006342E    cmp         byte ptr [ebp-1],0
>00063432    je          00063443
 00063434    call        @AfterConstruction
 00063439    pop         dword ptr fs:[0]
 00063440    add         esp,0C
 00063443    mov         eax,ebx
 00063445    pop         esi
 00063446    pop         ebx
 00063447    pop         ecx
 00063448    pop         ebp
 00063449    ret
*}
end;

//00063450
destructor TCustomRadioGroup.Destroy;
begin
{*
 00063450    push        ebx
 00063451    push        esi
 00063452    call        @BeforeDestruction
 00063457    mov         ebx,edx
 00063459    mov         esi,eax
 0006345B    xor         edx,edx
 0006345D    mov         eax,esi
 0006345F    call        TCustomRadioGroup.SetButtonCount
 00063464    mov         eax,dword ptr [esi+1F4]
 0006346A    xor         edx,edx
 0006346C    mov         dword ptr [eax+1C],edx
 0006346F    mov         dword ptr [eax+20],edx
 00063472    call        TObject.Free
 00063477    mov         eax,dword ptr [esi+1F0]
 0006347D    call        TObject.Free
 00063482    mov         edx,ebx
 00063484    and         dl,0FC
 00063487    mov         eax,esi
 00063489    call        TCustomControl.Destroy
 0006348E    test        bl,bl
>00063490    jle         00063499
 00063492    mov         eax,esi
 00063494    call        @ClassDestroy
 00063499    pop         esi
 0006349A    pop         ebx
 0006349B    ret
*}
end;

//0006349C
procedure TCustomRadioGroup.FlipChildren(AllLevels:Boolean);
begin
{*
 0006349C    ret
*}
end;

//000634A0
procedure TCustomRadioGroup.ArrangeButtons;
begin
{*
 000634A0    push        ebp
 000634A1    mov         ebp,esp
 000634A3    add         esp,0FFFFFFA8
 000634A6    push        ebx
 000634A7    push        esi
 000634A8    push        edi
 000634A9    mov         esi,eax
 000634AB    mov         eax,dword ptr [esi+1F0]
 000634B1    cmp         dword ptr [eax+8],0
>000634B5    je          00063630
 000634BB    cmp         byte ptr [esi+200],0
>000634C2    jne         00063630
 000634C8    push        0
 000634CA    call        user32.GetDC
 000634CF    mov         ebx,eax
 000634D1    mov         eax,dword ptr [esi+58]
 000634D4    call        TFont.GetHandle
 000634D9    push        eax
 000634DA    push        ebx
 000634DB    call        gdi32.SelectObject
 000634E0    mov         edi,eax
 000634E2    lea         eax,[ebp-58]
 000634E5    push        eax
 000634E6    push        ebx
 000634E7    call        gdi32.GetTextMetricsA
 000634EC    push        edi
 000634ED    push        ebx
 000634EE    call        gdi32.SelectObject
 000634F3    push        ebx
 000634F4    push        0
 000634F6    call        user32.ReleaseDC
 000634FB    mov         eax,dword ptr [esi+1F0]
 00063501    mov         ebx,dword ptr [eax+8]
 00063504    mov         eax,ebx
 00063506    mov         ecx,dword ptr [esi+1FC]
 0006350C    add         eax,ecx
 0006350E    dec         eax
 0006350F    cdq
 00063510    idiv        eax,ecx
 00063512    mov         dword ptr [ebp-4],eax
 00063515    mov         eax,dword ptr [esi+38]
 00063518    sub         eax,0A
 0006351B    cdq
 0006351C    idiv        eax,ecx
 0006351E    mov         dword ptr [ebp-8],eax
 00063521    mov         eax,dword ptr [esi+3C]
 00063524    mov         ecx,dword ptr [ebp-58]
 00063527    sub         eax,ecx
 00063529    sub         eax,5
 0006352C    mov         dword ptr [ebp-14],eax
 0006352F    mov         eax,dword ptr [ebp-14]
 00063532    cdq
 00063533    idiv        eax,dword ptr [ebp-4]
 00063536    mov         dword ptr [ebp-0C],eax
 00063539    mov         eax,dword ptr [ebp-14]
 0006353C    cdq
 0006353D    idiv        eax,dword ptr [ebp-4]
 00063540    sar         edx,1
>00063542    jns         00063547
 00063544    adc         edx,0
 00063547    inc         ecx
 00063548    add         edx,ecx
 0006354A    mov         dword ptr [ebp-10],edx
 0006354D    push        ebx
 0006354E    call        user32.BeginDeferWindowPos
 00063553    mov         dword ptr [ebp-18],eax
 00063556    xor         eax,eax
 00063558    push        ebp
 00063559    push        63629
 0006355E    push        dword ptr fs:[eax]
 00063561    mov         dword ptr fs:[eax],esp
 00063564    mov         eax,dword ptr [esi+1F0]
 0006356A    mov         eax,dword ptr [eax+8]
 0006356D    dec         eax
 0006356E    test        eax,eax
>00063570    jl          00063612
 00063576    inc         eax
 00063577    mov         dword ptr [ebp-20],eax
 0006357A    mov         dword ptr [ebp-14],0
 00063581    mov         eax,dword ptr [esi+1F0]
 00063587    mov         edx,dword ptr [ebp-14]
 0006358A    call        TList.Get
 0006358F    mov         edi,eax
 00063591    mov         dl,byte ptr [esi+4F]
 00063594    mov         eax,edi
 00063596    mov         ecx,dword ptr [eax]
 00063598    call        dword ptr [ecx+6C]
 0006359B    mov         eax,dword ptr [ebp-14]
 0006359E    cdq
 0006359F    idiv        eax,dword ptr [ebp-4]
 000635A2    imul        dword ptr [ebp-8]
 000635A5    add         eax,8
 000635A8    mov         dword ptr [ebp-1C],eax
 000635AB    mov         eax,edi
 000635AD    mov         bx,0FFCF
 000635B1    call        @CallDynaInst
 000635B6    test        al,al
>000635B8    je          000635CA
 000635BA    mov         eax,esi
 000635BC    call        TControl.GetClientWidth
 000635C1    sub         eax,dword ptr [ebp-1C]
 000635C4    sub         eax,dword ptr [ebp-8]
 000635C7    mov         dword ptr [ebp-1C],eax
 000635CA    push        14
 000635CC    mov         eax,dword ptr [ebp-0C]
 000635CF    push        eax
 000635D0    mov         eax,dword ptr [ebp-8]
 000635D3    push        eax
 000635D4    mov         eax,dword ptr [ebp-14]
 000635D7    cdq
 000635D8    idiv        eax,dword ptr [ebp-4]
 000635DB    imul        edx,dword ptr [ebp-0C]
 000635DF    add         edx,dword ptr [ebp-10]
 000635E2    push        edx
 000635E3    mov         eax,dword ptr [ebp-1C]
 000635E6    push        eax
 000635E7    push        0
 000635E9    mov         eax,edi
 000635EB    call        TWinControl.GetHandle
 000635F0    push        eax
 000635F1    mov         eax,dword ptr [ebp-18]
 000635F4    push        eax
 000635F5    call        user32.DeferWindowPos
 000635FA    mov         dword ptr [ebp-18],eax
 000635FD    mov         dl,1
 000635FF    mov         eax,edi
 00063601    call        TControl.SetVisible
 00063606    inc         dword ptr [ebp-14]
 00063609    dec         dword ptr [ebp-20]
>0006360C    jne         00063581
 00063612    xor         eax,eax
 00063614    pop         edx
 00063615    pop         ecx
 00063616    pop         ecx
 00063617    mov         dword ptr fs:[eax],edx
 0006361A    push        63630
 0006361F    mov         eax,dword ptr [ebp-18]
 00063622    push        eax
 00063623    call        user32.EndDeferWindowPos
 00063628    ret
>00063629    jmp         @HandleFinally
>0006362E    jmp         0006361F
 00063630    pop         edi
 00063631    pop         esi
 00063632    pop         ebx
 00063633    mov         esp,ebp
 00063635    pop         ebp
 00063636    ret
*}
end;

//00063638
procedure TCustomRadioGroup.ButtonClick(Sender:TObject);
begin
{*
 00063638    push        ebx
 00063639    push        esi
 0006363A    mov         esi,edx
 0006363C    mov         ebx,eax
 0006363E    cmp         byte ptr [ebx+201],0
>00063645    jne         0006366C
 00063647    mov         edx,esi
 00063649    mov         eax,dword ptr [ebx+1F0]
 0006364F    call        TList.IndexOf
 00063654    mov         dword ptr [ebx+1F8],eax
 0006365A    mov         eax,ebx
 0006365C    call        TControl.Changed
 00063661    mov         eax,ebx
 00063663    mov         bx,0FFEC
 00063667    call        @CallDynaInst
 0006366C    pop         esi
 0006366D    pop         ebx
 0006366E    ret
*}
end;

//00063670
procedure TCustomRadioGroup.ItemsChange(Sender:TObject);
begin
{*
 00063670    push        ebx
 00063671    mov         ebx,eax
 00063673    cmp         byte ptr [ebx+200],0
>0006367A    jne         000636A8
 0006367C    mov         eax,dword ptr [ebx+1F4]
 00063682    mov         edx,dword ptr [eax]
 00063684    call        dword ptr [edx+14]
 00063687    cmp         eax,dword ptr [ebx+1F8]
>0006368D    jg          000636A1
 0006368F    mov         eax,dword ptr [ebx+1F4]
 00063695    mov         edx,dword ptr [eax]
 00063697    call        dword ptr [edx+14]
 0006369A    dec         eax
 0006369B    mov         dword ptr [ebx+1F8],eax
 000636A1    mov         eax,ebx
 000636A3    call        TCustomRadioGroup.UpdateButtons
 000636A8    pop         ebx
 000636A9    ret
*}
end;

//000636AC
procedure TCustomRadioGroup.ReadState(Reader:TReader);
begin
{*
 000636AC    push        ebx
 000636AD    mov         ebx,eax
 000636AF    mov         byte ptr [ebx+200],1
 000636B6    mov         eax,ebx
 000636B8    call        TWinControl.ReadState
 000636BD    mov         byte ptr [ebx+200],0
 000636C4    mov         eax,ebx
 000636C6    call        TCustomRadioGroup.UpdateButtons
 000636CB    pop         ebx
 000636CC    ret
*}
end;

//000636D0
procedure TCustomRadioGroup.SetButtonCount(Value:Integer);
begin
{*
 000636D0    push        ebx
 000636D1    push        esi
 000636D2    push        edi
 000636D3    mov         esi,edx
 000636D5    mov         ebx,eax
>000636D7    jmp         000636E7
 000636D9    mov         ecx,ebx
 000636DB    mov         dl,1
 000636DD    mov         eax,[000630B0];TGroupButton
 000636E2    call        TGroupButton.InternalCreate
 000636E7    mov         eax,dword ptr [ebx+1F0]
 000636ED    cmp         esi,dword ptr [eax+8]
>000636F0    jg          000636D9
>000636F2    jmp         00063700
 000636F4    mov         eax,edi
 000636F6    call        TList.Last
 000636FB    call        TObject.Free
 00063700    mov         edi,dword ptr [ebx+1F0]
 00063706    cmp         esi,dword ptr [edi+8]
>00063709    jl          000636F4
 0006370B    pop         edi
 0006370C    pop         esi
 0006370D    pop         ebx
 0006370E    ret
*}
end;

//00063710
procedure TCustomRadioGroup.SetColumns(Value:Integer);
begin
{*
 00063710    push        ebx
 00063711    mov         ebx,eax
 00063713    cmp         edx,1
>00063716    jge         0006371D
 00063718    mov         edx,1
 0006371D    cmp         edx,10
>00063720    jle         00063727
 00063722    mov         edx,10
 00063727    cmp         edx,dword ptr [ebx+1FC]
>0006372D    je          00063743
 0006372F    mov         dword ptr [ebx+1FC],edx
 00063735    mov         eax,ebx
 00063737    call        TCustomRadioGroup.ArrangeButtons
 0006373C    mov         eax,ebx
 0006373E    mov         edx,dword ptr [eax]
 00063740    call        dword ptr [edx+78]
 00063743    pop         ebx
 00063744    ret
*}
end;

//00063748
procedure TCustomRadioGroup.SetItemIndex(Value:Integer);
begin
{*
 00063748    push        ebx
 00063749    push        esi
 0006374A    push        edi
 0006374B    push        ebp
 0006374C    mov         esi,edx
 0006374E    mov         ebx,eax
 00063750    cmp         byte ptr [ebx+200],0
>00063757    je          00063761
 00063759    mov         dword ptr [ebx+1F8],esi
>0006375F    jmp         000637BD
 00063761    cmp         esi,0FFFFFFFF
>00063764    jge         00063769
 00063766    or          esi,0FFFFFFFF
 00063769    mov         ebp,dword ptr [ebx+1F0]
 0006376F    mov         eax,dword ptr [ebp+8]
 00063772    cmp         esi,eax
>00063774    jl          00063779
 00063776    mov         esi,eax
 00063778    dec         esi
 00063779    mov         edi,dword ptr [ebx+1F8]
 0006377F    cmp         esi,edi
>00063781    je          000637BD
 00063783    test        edi,edi
>00063785    jl          0006379A
 00063787    mov         edx,edi
 00063789    mov         eax,ebp
 0006378B    call        TList.Get
 00063790    xor         edx,edx
 00063792    mov         ecx,dword ptr [eax]
 00063794    call        dword ptr [ecx+0BC]
 0006379A    mov         edi,esi
 0006379C    mov         dword ptr [ebx+1F8],edi
 000637A2    test        edi,edi
>000637A4    jl          000637BD
 000637A6    mov         edx,edi
 000637A8    mov         eax,dword ptr [ebx+1F0]
 000637AE    call        TList.Get
 000637B3    mov         dl,1
 000637B5    mov         ecx,dword ptr [eax]
 000637B7    call        dword ptr [ecx+0BC]
 000637BD    pop         ebp
 000637BE    pop         edi
 000637BF    pop         esi
 000637C0    pop         ebx
 000637C1    ret
*}
end;

//000637C4
procedure TCustomRadioGroup.SetItems(Value:TStrings);
begin
{*
 000637C4    push        esi
 000637C5    mov         esi,eax
 000637C7    mov         eax,dword ptr [esi+1F4]
 000637CD    mov         ecx,dword ptr [eax]
 000637CF    call        dword ptr [ecx+8]
 000637D2    pop         esi
 000637D3    ret
*}
end;

//000637D4
procedure TCustomRadioGroup.UpdateButtons;
begin
{*
 000637D4    push        ebp
 000637D5    mov         ebp,esp
 000637D7    add         esp,0FFFFFFF8
 000637DA    push        ebx
 000637DB    push        esi
 000637DC    push        edi
 000637DD    xor         edx,edx
 000637DF    mov         dword ptr [ebp-8],edx
 000637E2    mov         ebx,eax
 000637E4    xor         eax,eax
 000637E6    push        ebp
 000637E7    push        6389D
 000637EC    push        dword ptr fs:[eax]
 000637EF    mov         dword ptr fs:[eax],esp
 000637F2    mov         eax,dword ptr [ebx+1F4]
 000637F8    mov         edx,dword ptr [eax]
 000637FA    call        dword ptr [edx+14]
 000637FD    mov         edx,eax
 000637FF    mov         eax,ebx
 00063801    call        TCustomRadioGroup.SetButtonCount
 00063806    mov         eax,dword ptr [ebx+1F0]
 0006380C    mov         eax,dword ptr [eax+8]
 0006380F    dec         eax
 00063810    test        eax,eax
>00063812    jl          00063847
 00063814    inc         eax
 00063815    mov         dword ptr [ebp-4],eax
 00063818    xor         esi,esi
 0006381A    lea         ecx,[ebp-8]
 0006381D    mov         edx,esi
 0006381F    mov         eax,dword ptr [ebx+1F4]
 00063825    mov         edi,dword ptr [eax]
 00063827    call        dword ptr [edi+0C]
 0006382A    mov         eax,dword ptr [ebp-8]
 0006382D    push        eax
 0006382E    mov         edx,esi
 00063830    mov         eax,dword ptr [ebx+1F0]
 00063836    call        TList.Get
 0006383B    pop         edx
 0006383C    call        TControl.SetText
 00063841    inc         esi
 00063842    dec         dword ptr [ebp-4]
>00063845    jne         0006381A
 00063847    cmp         dword ptr [ebx+1F8],0
>0006384E    jl          00063879
 00063850    mov         byte ptr [ebx+201],1
 00063857    mov         edx,dword ptr [ebx+1F8]
 0006385D    mov         eax,dword ptr [ebx+1F0]
 00063863    call        TList.Get
 00063868    mov         dl,1
 0006386A    mov         ecx,dword ptr [eax]
 0006386C    call        dword ptr [ecx+0BC]
 00063872    mov         byte ptr [ebx+201],0
 00063879    mov         eax,ebx
 0006387B    call        TCustomRadioGroup.ArrangeButtons
 00063880    mov         eax,ebx
 00063882    mov         edx,dword ptr [eax]
 00063884    call        dword ptr [edx+78]
 00063887    xor         eax,eax
 00063889    pop         edx
 0006388A    pop         ecx
 0006388B    pop         ecx
 0006388C    mov         dword ptr fs:[eax],edx
 0006388F    push        638A4
 00063894    lea         eax,[ebp-8]
 00063897    call        @LStrClr
 0006389C    ret
>0006389D    jmp         @HandleFinally
>000638A2    jmp         00063894
 000638A4    pop         edi
 000638A5    pop         esi
 000638A6    pop         ebx
 000638A7    pop         ecx
 000638A8    pop         ecx
 000638A9    pop         ebp
 000638AA    ret
*}
end;

//000638AC
procedure TCustomRadioGroup.CMEnabledChanged(var Message:TMessage);
begin
{*
 000638AC    push        ebx
 000638AD    push        esi
 000638AE    push        edi
 000638AF    mov         ebx,eax
 000638B1    mov         eax,ebx
 000638B3    call        TWinControl.CMEnabledChanged
 000638B8    mov         eax,dword ptr [ebx+1F0]
 000638BE    mov         esi,dword ptr [eax+8]
 000638C1    dec         esi
 000638C2    test        esi,esi
>000638C4    jl          000638E8
 000638C6    inc         esi
 000638C7    xor         edi,edi
 000638C9    mov         eax,ebx
 000638CB    mov         edx,dword ptr [eax]
 000638CD    call        dword ptr [edx+50]
 000638D0    push        eax
 000638D1    mov         edx,edi
 000638D3    mov         eax,dword ptr [ebx+1F0]
 000638D9    call        TList.Get
 000638DE    pop         edx
 000638DF    mov         ecx,dword ptr [eax]
 000638E1    call        dword ptr [ecx+60]
 000638E4    inc         edi
 000638E5    dec         esi
>000638E6    jne         000638C9
 000638E8    pop         edi
 000638E9    pop         esi
 000638EA    pop         ebx
 000638EB    ret
*}
end;

//000638EC
procedure TCustomRadioGroup.CMFontChanged(var Message:TMessage);
begin
{*
 000638EC    push        ebx
 000638ED    mov         ebx,eax
 000638EF    mov         eax,ebx
 000638F1    call        TWinControl.CMFontChanged
 000638F6    mov         eax,ebx
 000638F8    call        TCustomRadioGroup.ArrangeButtons
 000638FD    pop         ebx
 000638FE    ret
*}
end;

//00063900
procedure TCustomRadioGroup.WMSize(var Message:TMessage);
begin
{*
 00063900    push        ebx
 00063901    mov         ebx,eax
 00063903    mov         eax,ebx
 00063905    call        TCustomCheckBox.WMSize
 0006390A    mov         eax,ebx
 0006390C    call        TCustomRadioGroup.ArrangeButtons
 00063911    pop         ebx
 00063912    ret
*}
end;

//00063914
{*function sub_00063914:?;
begin
 00063914    mov         al,1
 00063916    ret
end;*}

//00063918
procedure TCustomRadioGroup.GetChildren(Proc:TGetChildProc; Root:TComponent);
begin
{*
 00063918    push        ebp
 00063919    mov         ebp,esp
 0006391B    pop         ebp
 0006391C    ret         8
*}
end;

end.