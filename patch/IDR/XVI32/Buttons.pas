//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit Buttons;

interface

uses
  SysUtils, Classes, Graphics, Buttons;

type
  TButtonLayout = (blGlyphLeft, blGlyphRight, blGlyphTop, blGlyphBottom);
  TButtonStyle = (bsAutoDetect, bsWin31, bsNew);
  TSpeedButton = class(TGraphicControl)
  public
    GroupIndex:Integer;//f118
    FGlyph:Pointer;//f11C
    Down:Boolean;//f120
    FDragging:Boolean;//f121
    AllowAllUp:Boolean;//f122
    Layout:TButtonLayout;//f123
    Spacing:Integer;//f124
    Transparent:Boolean;//f128
    Margin:Integer;//f12C
    Flat:Boolean;//f130
    FMouseInControl:Boolean;//f131
    FState:TButtonState;//f132
    destructor Destroy; virtual;//00072BD4
    procedure Loaded; virtual;//vC//00072EB8
    constructor Create(AOwner:TComponent); virtual;//v2C//00072B14
    procedure Paint; virtual;//v88//00072C0C
    procedure WMLButtonDblClk(var Message:TWMLButtonDown); message WM_LBUTTONDBLCLK;//000732A8
    //procedure CMDialogChar(?:?); message CM_DIALOGCHAR;//00073348
    procedure CMEnabledChanged(var Message:TMessage); message CM_ENABLEDCHANGED;//000732CC
    procedure CMFontChanged(var Message:TMessage); message CM_FONTCHANGED;//000733E0
    procedure CMTextChanged; message CM_TEXTCHANGED;//000733E8
    procedure CMMouseEnter(var Message:TMessage); message CM_MOUSEENTER;//00073414
    procedure CMMouseLeave(var Message:TMessage); message CM_MOUSELEAVE;//0007345C
    procedure CMButtonPressed(var Message:TMessage); message CM_BUTTONPRESSED;//000732FC
    procedure CMSysColorChange(var Message:TMessage); message CM_SYSCOLORCHANGE;//000733F0
    procedure MouseUp(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer); dynamic;//00072FDC
    procedure MouseMove(Shift:TShiftState; X:Integer; Y:Integer); dynamic;//00072F3C
    procedure MouseDown(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer); dynamic;//00072EE4
    procedure Click; dynamic;//000730C8
    procedure ActionChange(Sender:TObject; CheckDefaults:Boolean); dynamic;//0007352C
    procedure UpdateTracking;//00072E54
    procedure SetGlyph(Value:TBitmap);//000730F0
    function GetNumGlyphs:TNumGlyphs;//00073108
    procedure SetNumGlyphs(Value:TNumGlyphs);//00073114
    procedure GlyphChanged(Sender:TObject);//00073140
    procedure UpdateExclusive;//00073148
    procedure SetDown(Value:Boolean);//00073180
    procedure SetFlat(Value:Boolean);//000731EC
    procedure SetGroupIndex(Value:Integer);//00073200
    procedure SetLayout(Value:TButtonLayout);//00073214
    procedure SetMargin(Value:Integer);//00073228
    procedure SetSpacing(Value:Integer);//00073244
    procedure SetTransparent(Value:Boolean);//00073258
    procedure SetAllowAllUp(Value:Boolean);//00073294
    function GetGlyph:TBitmap;//00073A5C
  end;
  TBitBtnKind = (bkCustom, bkOK, bkCancel, bkHelp, bkYes, bkNo, bkClose, bkAbort, bkRetry, bkIgnore, bkAll);
  TBitBtn = class(TButton)
  public
    FCanvas:TCanvas;//f1F8
    FGlyph:Pointer;//f1FC
    Style:TButtonStyle;//f200
    FKind:TBitBtnKind;//f201
    Layout:TButtonLayout;//f202
    Spacing:Integer;//f204
    Margin:Integer;//f208
    IsFocused:Boolean;//f20C
    FModifiedGlyph:Boolean;//f20D
    destructor Destroy; virtual;//0007364C
    constructor Create(AOwner:TComponent); virtual;//v2C//000735A4
    procedure CreateHandle; virtual;//v90//00073688
    procedure CreateParams(var Params:TCreateParams); virtual;//v94//000736B4
    procedure SetButtonStyle(ADefault:Boolean); virtual;//vC0//000736C4
    procedure WMLButtonDblClk(var Message:TWMLButtonDblClk); message WM_LBUTTONDBLCLK;//00073A14
    procedure CMEnabledChanged(var Message:TMessage); message CM_ENABLEDCHANGED;//00073A00
    procedure CMFontChanged(var Message:TMessage); message CM_FONTCHANGED;//000739EC
    procedure CNDrawItem(var Message:TWMDrawItem); dynamic;//00073754
    procedure CNMeasureItem(var Message:TWMMeasureItem); dynamic;//00073744
    procedure Click; dynamic;//000736D8
    procedure ActionChange(Sender:TObject; CheckDefaults:Boolean); dynamic;//00073D9C
    function GetGlyph:TBitmap;//000730E4
    procedure DrawItem(const DrawItemStruct:TDrawItemStruct);//00073760
    procedure SetGlyph(Value:TBitmap);//00073A3C
    procedure GlyphChanged(Sender:TObject);//00073A68
    function IsCustom(Value:Boolean):Boolean;//00073A70
    procedure SetStyle(Value:TButtonStyle);//00073A84
    procedure SetKind(Value:TBitBtnKind);//00073A98
    function IsCustomCaption(Value:TCaption):Boolean;//00073BA8
    function GetKind:TBitBtnKind;//00073C24
    procedure SetLayout(Value:TButtonLayout);//00073C90
    function GetNumGlyphs:TNumGlyphs;//00073CA4
    procedure SetNumGlyphs(Value:TNumGlyphs);//00073CB0
    procedure SetSpacing(Value:Integer);//00073CDC
    procedure SetMargin(Value:Integer);//00073CF0
  end;
  TGlyphList = class(TImageList)
  public
    Used:TBits;//f70
    FCount:Integer;//f74
    destructor Destroy; virtual;//00071C50
    constructor CreateSize(AWidth:Integer; AHeight:Integer);//00071C00
    function AllocateIndex:Integer;//00071C80
    function AddMasked(Image:TBitmap; MaskColor:TColor):Integer;//00071CC0
    procedure Delete(Index:Integer);//00071CEC
  end;
  TGlyphCache = class(TObject)
  public
    GlyphLists:TList;//f4
    constructor Create;//00071D14
    destructor Destroy;//00071D58
    function GetList(AWidth:Integer; AHeight:Integer):TGlyphList;//00071D88
    procedure ReturnList(List:TGlyphList);//00071DE8
    function Empty:Boolean;//00071E08
  end;
  TButtonGlyph = class(TObject)
  public
    FOriginal:TBitmap;//f4
    FGlyphList:TGlyphList;//f8
    FIndexs:array[TButtonState] of System.Integer;//fC
    FTransparentColor:TColor;//f1C
    FNumGlyphs:TNumGlyphs;//f20
    FOnChange:TNotifyEvent;//f24
    constructor Create;//00071E14
    destructor Destroy;//00071EA8
    procedure Invalidate;//00071F04
    procedure GlyphChanged(Sender:TObject);//00071F4C
    procedure SetGlyph(Value:TBitmap);//00071F7C
    procedure SetNumGlyphs(Value:TNumGlyphs);//00071FF4
    function CreateButtonGlyph(State:TButtonState):Integer;//0007201C
    procedure DrawButtonGlyph(Canvas:TCanvas; const GlyphPos:TPoint; State:TButtonState; Transparent:Boolean);//000725F4
    procedure DrawButtonText(Canvas:TCanvas; const Caption:AnsiString; TextBounds:TRect; State:TButtonState; BiDiFlags:Longint);//000726B0
    procedure CalcButtonLayout(Canvas:TCanvas; const Client:TRect; const Offset:TPoint; const Caption:AnsiString; Layout:TButtonLayout; Margin:Integer; Spacing:Integer; var GlyphPos:TPoint; var TextBounds:TRect; BiDiFlags:Longint);//00072794
    function Draw(Canvas:TCanvas; const Client:TRect; const Offset:TPoint; const Caption:AnsiString; Layout:TButtonLayout; Margin:Integer; Spacing:Integer; State:TButtonState; Transparent:Boolean; BiDiFlags:Longint):TRect;//00072AA4
  end;
    procedure _NF__19C;//000719AC
    function GetBitBtnGlyph(Kind:TBitBtnKind):TBitmap;//00071A04
    destructor Destroy;//00071C50
    constructor Create(AOwner:TComponent);//00072B14
    destructor Destroy;//00072BD4
    procedure Paint;//00072C0C
    procedure Loaded;//00072EB8
    procedure MouseDown(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);//00072EE4
    procedure MouseMove(Shift:TShiftState; X:Integer; Y:Integer);//00072F3C
    procedure MouseUp(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);//00072FDC
    procedure Click;//000730C8
    procedure GetPalette;//000730D0
    procedure WMLButtonDblClk(var Message:TWMLButtonDown);//000732A8
    procedure CMEnabledChanged(var Message:TMessage);//000732CC
    procedure CMButtonPressed(var Message:TMessage);//000732FC
    //procedure CMDialogChar(?:?);//00073348
    procedure CMFontChanged(var Message:TMessage);//000733E0
    procedure CMTextChanged;//000733E8
    procedure CMSysColorChange(var Message:TMessage);//000733F0
    procedure CMMouseEnter(var Message:TMessage);//00073414
    procedure CMMouseLeave(var Message:TMessage);//0007345C
    procedure CopyImage(ImageList:TCustomImageList; Index:Integer);//0007349C
    procedure ActionChange(Sender:TObject; CheckDefaults:Boolean);//0007352C
    constructor Create(AOwner:TComponent);//000735A4
    destructor Destroy;//0007364C
    procedure CreateHandle;//00073688
    procedure CreateParams(var Params:TCreateParams);//000736B4
    procedure SetButtonStyle(ADefault:Boolean);//000736C4
    procedure Click;//000736D8
    procedure CNMeasureItem(var Message:TWMMeasureItem);//00073744
    procedure CNDrawItem(var Message:TWMDrawItem);//00073754
    procedure CMFontChanged(var Message:TMessage);//000739EC
    procedure CMEnabledChanged(var Message:TMessage);//00073A00
    procedure WMLButtonDblClk(var Message:TWMLButtonDblClk);//00073A14
    procedure GetPalette;//00073A28
    procedure CopyImage(ImageList:TCustomImageList; Index:Integer);//00073D0C
    procedure ActionChange(Sender:TObject; CheckDefaults:Boolean);//00073D9C
    procedure DestroyLocals;//00073E14
    procedure _NF__309;//00073E30

implementation

//000719AC
procedure _NF__19C;
begin
{*
 000719AC    inc         edx
 000719AD    inc         edx
 000719AE    dec         edi
 000719AF    dec         ebx
 000719B0    add         byte ptr [eax],al
 000719B2    add         byte ptr [eax],al
 000719B4    inc         edx
 000719B5    inc         edx
 000719B6    inc         ebx
 000719B7    inc         ecx
 000719B8    dec         esi
 000719B9    inc         ebx
 000719BA    inc         ebp
 000719BB    dec         esp
 000719BC    add         byte ptr [eax],al
 000719BE    add         byte ptr [eax],al
 000719C0    inc         edx
 000719C1    inc         edx
 000719C2    dec         eax
 000719C3    inc         ebp
 000719C4    dec         esp
 000719C5    push        eax
 000719C6    add         byte ptr [eax],al
 000719C8    inc         edx
 000719C9    inc         edx
 000719CA    pop         ecx
 000719CB    inc         ebp
 000719CC    push        ebx
 000719CD    add         byte ptr [eax],al
 000719CF    add         byte ptr [edx+42],al
 000719D2    dec         esi
 000719D3    dec         edi
 000719D4    add         byte ptr [eax],al
 000719D6    add         byte ptr [eax],al
 000719D8    inc         edx
 000719D9    inc         edx
 000719DA    inc         ebx
 000719DB    dec         esp
 000719DC    dec         edi
 000719DD    push        ebx
 000719DE    inc         ebp
 000719DF    add         byte ptr [edx+42],al
 000719E2    inc         ecx
 000719E3    inc         edx
 000719E4    dec         edi
 000719E5    push        edx
 000719E6    push        esp
 000719E7    add         byte ptr [edx+42],al
 000719EA    push        edx
 000719EB    inc         ebp
 000719EC    push        esp
 000719ED    push        edx
 000719EE    pop         ecx
 000719EF    add         byte ptr [edx+42],al
 000719F2    dec         ecx
 000719F3    inc         edi
 000719F4    dec         esi
 000719F5    dec         edi
 000719F6    push        edx
 000719F7    inc         ebp
 000719F8    add         byte ptr [eax],al
 000719FA    add         byte ptr [eax],al
 000719FC    inc         edx
 000719FD    inc         edx
 000719FE    inc         ecx
 000719FF    dec         esp
 00071A00    dec         esp
 00071A01    add         byte ptr [eax],al
 00071A03    add         byte ptr [ebp-75],dl;{GetBitBtnGlyph:TBitmap}
*}
end;

//00071A04
function GetBitBtnGlyph(Kind:TBitBtnKind):TBitmap;
begin
{*
 00071A04    push        ebp
 00071A05    mov         ebp,esp
 00071A07    push        0
 00071A09    push        ebx
 00071A0A    push        esi
 00071A0B    mov         ebx,eax
 00071A0D    xor         eax,eax
 00071A0F    push        ebp
 00071A10    push        71A84
 00071A15    push        dword ptr fs:[eax]
 00071A18    mov         dword ptr fs:[eax],esp
 00071A1B    mov         esi,ebx
 00071A1D    and         esi,7F
 00071A20    cmp         dword ptr [esi*4+0B6858],0
>00071A28    jne         00071A67
 00071A2A    mov         dl,1
 00071A2C    mov         eax,[00028F70];TBitmap
 00071A31    call        TBitmap.Create
 00071A36    mov         dword ptr [esi*4+0B6858],eax
 00071A3D    lea         eax,[ebp-4]
 00071A40    mov         edx,dword ptr [esi*4+0B4D18]
 00071A47    call        @LStrFromPChar
 00071A4C    mov         ecx,dword ptr [ebp-4]
 00071A4F    mov         edx,dword ptr ds:[0B5950];^HInstance:Longword
 00071A55    mov         edx,dword ptr [edx]
 00071A57    xor         eax,eax
 00071A59    mov         al,bl
 00071A5B    mov         eax,dword ptr [eax*4+0B6858]
 00071A62    call        TBitmap.LoadFromResourceName
 00071A67    mov         ebx,dword ptr [esi*4+0B6858]
 00071A6E    xor         eax,eax
 00071A70    pop         edx
 00071A71    pop         ecx
 00071A72    pop         ecx
 00071A73    mov         dword ptr fs:[eax],edx
 00071A76    push        71A8B
 00071A7B    lea         eax,[ebp-4]
 00071A7E    call        @LStrClr
 00071A83    ret
>00071A84    jmp         @HandleFinally
>00071A89    jmp         00071A7B
 00071A8B    mov         eax,ebx
 00071A8D    pop         esi
 00071A8E    pop         ebx
 00071A8F    pop         ecx
 00071A90    pop         ebp
 00071A91    ret
*}
end;

//00071C00
constructor TGlyphList.CreateSize(AWidth:Integer; AHeight:Integer);
begin
{*
 00071C00    push        ebp
 00071C01    mov         ebp,esp
 00071C03    push        ebx
 00071C04    push        esi
 00071C05    test        dl,dl
>00071C07    je          00071C11
 00071C09    add         esp,0FFFFFFF0
 00071C0C    call        @ClassCreate
 00071C11    mov         ebx,edx
 00071C13    mov         esi,eax
 00071C15    mov         eax,dword ptr [ebp+8]
 00071C18    push        eax
 00071C19    xor         edx,edx
 00071C1B    mov         eax,esi
 00071C1D    call        TCustomImageList.CreateSize
 00071C22    mov         dl,1
 00071C24    mov         eax,[0001EF80];TBits
 00071C29    call        TObject.Create
 00071C2E    mov         dword ptr [esi+70],eax
 00071C31    mov         eax,esi
 00071C33    test        bl,bl
>00071C35    je          00071C46
 00071C37    call        @AfterConstruction
 00071C3C    pop         dword ptr fs:[0]
 00071C43    add         esp,0C
 00071C46    mov         eax,esi
 00071C48    pop         esi
 00071C49    pop         ebx
 00071C4A    pop         ebp
 00071C4B    ret         4
*}
end;

//00071C50
destructor TGlyphList.Destroy;
begin
{*
 00071C50    push        ebx
 00071C51    push        esi
 00071C52    call        @BeforeDestruction
 00071C57    mov         ebx,edx
 00071C59    mov         esi,eax
 00071C5B    mov         eax,dword ptr [esi+70]
 00071C5E    call        TObject.Free
 00071C63    mov         edx,ebx
 00071C65    and         dl,0FC
 00071C68    mov         eax,esi
 00071C6A    call        TCustomImageList.Destroy
 00071C6F    test        bl,bl
>00071C71    jle         00071C7A
 00071C73    mov         eax,esi
 00071C75    call        @ClassDestroy
 00071C7A    pop         esi
 00071C7B    pop         ebx
 00071C7C    ret
*}
end;

//00071C80
function TGlyphList.AllocateIndex:Integer;
begin
{*
 00071C80    push        ebx
 00071C81    push        esi
 00071C82    mov         ebx,eax
 00071C84    mov         eax,dword ptr [ebx+70]
 00071C87    call        TBits.OpenBit
 00071C8C    mov         esi,eax
 00071C8E    mov         eax,dword ptr [ebx+70]
 00071C91    cmp         esi,dword ptr [eax+4]
>00071C94    jl          00071CAE
 00071C96    xor         ecx,ecx
 00071C98    xor         edx,edx
 00071C9A    mov         eax,ebx
 00071C9C    call        TCustomImageList.Add
 00071CA1    mov         esi,eax
 00071CA3    lea         edx,[esi+1]
 00071CA6    mov         eax,dword ptr [ebx+70]
 00071CA9    call        TBits.SetSize
 00071CAE    mov         cl,1
 00071CB0    mov         edx,esi
 00071CB2    mov         eax,dword ptr [ebx+70]
 00071CB5    call        TBits.SetBit
 00071CBA    mov         eax,esi
 00071CBC    pop         esi
 00071CBD    pop         ebx
 00071CBE    ret
*}
end;

//00071CC0
function TGlyphList.AddMasked(Image:TBitmap; MaskColor:TColor):Integer;
begin
{*
 00071CC0    push        ebx
 00071CC1    push        esi
 00071CC2    push        edi
 00071CC3    push        ebp
 00071CC4    mov         ebp,ecx
 00071CC6    mov         edi,edx
 00071CC8    mov         ebx,eax
 00071CCA    mov         eax,ebx
 00071CCC    call        TGlyphList.AllocateIndex
 00071CD1    mov         esi,eax
 00071CD3    push        ebp
 00071CD4    mov         ecx,edi
 00071CD6    mov         edx,esi
 00071CD8    mov         eax,ebx
 00071CDA    call        TCustomImageList.ReplaceMasked
 00071CDF    inc         dword ptr [ebx+74]
 00071CE2    mov         eax,esi
 00071CE4    pop         ebp
 00071CE5    pop         edi
 00071CE6    pop         esi
 00071CE7    pop         ebx
 00071CE8    ret
*}
end;

//00071CEC
procedure TGlyphList.Delete(Index:Integer);
begin
{*
 00071CEC    push        ebx
 00071CED    push        esi
 00071CEE    mov         esi,edx
 00071CF0    mov         ebx,eax
 00071CF2    mov         edx,esi
 00071CF4    mov         eax,dword ptr [ebx+70]
 00071CF7    call        TBits.GetBit
 00071CFC    test        al,al
>00071CFE    je          00071D0F
 00071D00    dec         dword ptr [ebx+74]
 00071D03    xor         ecx,ecx
 00071D05    mov         edx,esi
 00071D07    mov         eax,dword ptr [ebx+70]
 00071D0A    call        TBits.SetBit
 00071D0F    pop         esi
 00071D10    pop         ebx
 00071D11    ret
*}
end;

//00071D14
constructor TGlyphCache.Create;
begin
{*
 00071D14    push        ebx
 00071D15    push        esi
 00071D16    test        dl,dl
>00071D18    je          00071D22
 00071D1A    add         esp,0FFFFFFF0
 00071D1D    call        @ClassCreate
 00071D22    mov         ebx,edx
 00071D24    mov         esi,eax
 00071D26    xor         edx,edx
 00071D28    mov         eax,esi
 00071D2A    call        TObject.Create
 00071D2F    mov         dl,1
 00071D31    mov         eax,[0001EEC4];TList
 00071D36    call        TObject.Create
 00071D3B    mov         dword ptr [esi+4],eax
 00071D3E    mov         eax,esi
 00071D40    test        bl,bl
>00071D42    je          00071D53
 00071D44    call        @AfterConstruction
 00071D49    pop         dword ptr fs:[0]
 00071D50    add         esp,0C
 00071D53    mov         eax,esi
 00071D55    pop         esi
 00071D56    pop         ebx
 00071D57    ret
*}
end;

//00071D58
destructor TGlyphCache.Destroy;
begin
{*
 00071D58    push        ebx
 00071D59    push        esi
 00071D5A    call        @BeforeDestruction
 00071D5F    mov         ebx,edx
 00071D61    mov         esi,eax
 00071D63    mov         eax,dword ptr [esi+4]
 00071D66    call        TObject.Free
 00071D6B    mov         edx,ebx
 00071D6D    and         dl,0FC
 00071D70    mov         eax,esi
 00071D72    call        TObject.Destroy
 00071D77    test        bl,bl
>00071D79    jle         00071D82
 00071D7B    mov         eax,esi
 00071D7D    call        @ClassDestroy
 00071D82    pop         esi
 00071D83    pop         ebx
 00071D84    ret
*}
end;

//00071D88
function TGlyphCache.GetList(AWidth:Integer; AHeight:Integer):TGlyphList;
begin
{*
 00071D88    push        ebx
 00071D89    push        esi
 00071D8A    push        edi
 00071D8B    push        ebp
 00071D8C    push        ecx
 00071D8D    mov         dword ptr [esp],ecx
 00071D90    mov         ebp,edx
 00071D92    mov         edi,eax
 00071D94    mov         eax,dword ptr [edi+4]
 00071D97    mov         esi,dword ptr [eax+8]
 00071D9A    dec         esi
 00071D9B    cmp         esi,0
>00071D9E    jl          00071DBF
 00071DA0    mov         eax,dword ptr [edi+4]
 00071DA3    mov         edx,esi
 00071DA5    call        TList.Get
 00071DAA    mov         ebx,eax
 00071DAC    cmp         ebp,dword ptr [ebx+28]
>00071DAF    jne         00071DB9
 00071DB1    mov         eax,dword ptr [esp]
 00071DB4    cmp         eax,dword ptr [ebx+24]
>00071DB7    je          00071DDD
 00071DB9    dec         esi
 00071DBA    cmp         esi,0FFFFFFFF
>00071DBD    jne         00071DA0
 00071DBF    mov         eax,dword ptr [esp]
 00071DC2    push        eax
 00071DC3    mov         ecx,ebp
 00071DC5    mov         dl,1
 00071DC7    mov         eax,[00071A94];TGlyphList
 00071DCC    call        TGlyphList.CreateSize
 00071DD1    mov         ebx,eax
 00071DD3    mov         eax,dword ptr [edi+4]
 00071DD6    mov         edx,ebx
 00071DD8    call        TList.Add
 00071DDD    mov         eax,ebx
 00071DDF    pop         edx
 00071DE0    pop         ebp
 00071DE1    pop         edi
 00071DE2    pop         esi
 00071DE3    pop         ebx
 00071DE4    ret
*}
end;

//00071DE8
procedure TGlyphCache.ReturnList(List:TGlyphList);
begin
{*
 00071DE8    push        ebx
 00071DE9    mov         ebx,edx
 00071DEB    test        ebx,ebx
>00071DED    je          00071E06
 00071DEF    cmp         dword ptr [ebx+74],0
>00071DF3    jne         00071E06
 00071DF5    mov         edx,ebx
 00071DF7    mov         eax,dword ptr [eax+4]
 00071DFA    call        TList.Remove
 00071DFF    mov         eax,ebx
 00071E01    call        TObject.Free
 00071E06    pop         ebx
 00071E07    ret
*}
end;

//00071E08
function TGlyphCache.Empty:Boolean;
begin
{*
 00071E08    mov         eax,dword ptr [eax+4]
 00071E0B    cmp         dword ptr [eax+8],0
 00071E0F    sete        al
 00071E12    ret
*}
end;

//00071E14
constructor TButtonGlyph.Create;
begin
{*
 00071E14    push        ebp
 00071E15    mov         ebp,esp
 00071E17    push        ecx
 00071E18    push        ebx
 00071E19    push        esi
 00071E1A    test        dl,dl
>00071E1C    je          00071E26
 00071E1E    add         esp,0FFFFFFF0
 00071E21    call        @ClassCreate
 00071E26    mov         byte ptr [ebp-1],dl
 00071E29    mov         ebx,eax
 00071E2B    xor         edx,edx
 00071E2D    mov         eax,ebx
 00071E2F    call        TObject.Create
 00071E34    mov         dl,1
 00071E36    mov         eax,[00028F70];TBitmap
 00071E3B    call        TBitmap.Create
 00071E40    mov         esi,eax
 00071E42    mov         dword ptr [ebx+4],esi
 00071E45    mov         dword ptr [esi+8],ebx
 00071E48    mov         dword ptr [esi+4],71F4C;TButtonGlyph.GlyphChanged
 00071E4F    mov         dword ptr [ebx+1C],8080
 00071E56    mov         byte ptr [ebx+20],1
 00071E5A    xor         eax,eax
 00071E5C    xor         edx,edx
 00071E5E    mov         dl,al
 00071E60    mov         dword ptr [ebx+edx*4+0C],0FFFFFFFF
 00071E68    inc         eax
 00071E69    cmp         al,4
>00071E6B    jne         00071E5C
 00071E6D    cmp         dword ptr ds:[0B4D9C],0
>00071E74    jne         00071E87
 00071E76    mov         dl,1
 00071E78    mov         eax,[00071B4C];TGlyphCache
 00071E7D    call        TGlyphCache.Create
 00071E82    mov         [000B4D9C],eax
 00071E87    mov         eax,ebx
 00071E89    cmp         byte ptr [ebp-1],0
>00071E8D    je          00071E9E
 00071E8F    call        @AfterConstruction
 00071E94    pop         dword ptr fs:[0]
 00071E9B    add         esp,0C
 00071E9E    mov         eax,ebx
 00071EA0    pop         esi
 00071EA1    pop         ebx
 00071EA2    pop         ecx
 00071EA3    pop         ebp
 00071EA4    ret
*}
end;

//00071EA8
destructor TButtonGlyph.Destroy;
begin
{*
 00071EA8    push        ebx
 00071EA9    push        esi
 00071EAA    call        @BeforeDestruction
 00071EAF    mov         ebx,edx
 00071EB1    mov         esi,eax
 00071EB3    mov         eax,dword ptr [esi+4]
 00071EB6    call        TObject.Free
 00071EBB    mov         eax,esi
 00071EBD    call        TButtonGlyph.Invalidate
 00071EC2    cmp         dword ptr ds:[0B4D9C],0
>00071EC9    je          00071EEA
 00071ECB    mov         eax,[000B4D9C]
 00071ED0    call        TGlyphCache.Empty
 00071ED5    test        al,al
>00071ED7    je          00071EEA
 00071ED9    mov         eax,[000B4D9C]
 00071EDE    call        TObject.Free
 00071EE3    xor         eax,eax
 00071EE5    mov         [000B4D9C],eax
 00071EEA    mov         edx,ebx
 00071EEC    and         dl,0FC
 00071EEF    mov         eax,esi
 00071EF1    call        TObject.Destroy
 00071EF6    test        bl,bl
>00071EF8    jle         00071F01
 00071EFA    mov         eax,esi
 00071EFC    call        @ClassDestroy
 00071F01    pop         esi
 00071F02    pop         ebx
 00071F03    ret
*}
end;

//00071F04
procedure TButtonGlyph.Invalidate;
begin
{*
 00071F04    push        ebx
 00071F05    push        esi
 00071F06    push        edi
 00071F07    mov         esi,eax
 00071F09    xor         ebx,ebx
 00071F0B    mov         edi,ebx
 00071F0D    and         edi,7F
 00071F10    mov         eax,dword ptr [esi+edi*4+0C]
 00071F14    cmp         eax,0FFFFFFFF
>00071F17    je          00071F27
 00071F19    xor         edx,edx
 00071F1B    mov         dl,bl
 00071F1D    mov         edx,eax
 00071F1F    mov         eax,dword ptr [esi+8]
 00071F22    call        TGlyphList.Delete
 00071F27    mov         dword ptr [esi+edi*4+0C],0FFFFFFFF
 00071F2F    inc         ebx
 00071F30    cmp         bl,4
>00071F33    jne         00071F0B
 00071F35    mov         edx,dword ptr [esi+8]
 00071F38    mov         eax,[000B4D9C]
 00071F3D    call        TGlyphCache.ReturnList
 00071F42    xor         eax,eax
 00071F44    mov         dword ptr [esi+8],eax
 00071F47    pop         edi
 00071F48    pop         esi
 00071F49    pop         ebx
 00071F4A    ret
*}
end;

//00071F4C
procedure TButtonGlyph.GlyphChanged(Sender:TObject);
begin
{*
 00071F4C    push        ebx
 00071F4D    push        esi
 00071F4E    mov         ebx,eax
 00071F50    mov         esi,dword ptr [ebx+4]
 00071F53    cmp         edx,esi
>00071F55    jne         00071F77
 00071F57    mov         eax,esi
 00071F59    call        TBitmap.GetTransparentColor
 00071F5E    mov         dword ptr [ebx+1C],eax
 00071F61    mov         eax,ebx
 00071F63    call        TButtonGlyph.Invalidate
 00071F68    cmp         word ptr [ebx+26],0
>00071F6D    je          00071F77
 00071F6F    mov         edx,ebx
 00071F71    mov         eax,dword ptr [ebx+28]
 00071F74    call        dword ptr [ebx+24]
 00071F77    pop         esi
 00071F78    pop         ebx
 00071F79    ret
*}
end;

//00071F7C
procedure TButtonGlyph.SetGlyph(Value:TBitmap);
begin
{*
 00071F7C    push        ebx
 00071F7D    push        esi
 00071F7E    mov         ebx,edx
 00071F80    mov         esi,eax
 00071F82    mov         eax,esi
 00071F84    call        TButtonGlyph.Invalidate
 00071F89    mov         edx,ebx
 00071F8B    mov         eax,dword ptr [esi+4]
 00071F8E    mov         ecx,dword ptr [eax]
 00071F90    call        dword ptr [ecx+8]
 00071F93    test        ebx,ebx
>00071F95    je          00071FEF
 00071F97    mov         eax,ebx
 00071F99    mov         edx,dword ptr [eax]
 00071F9B    call        dword ptr [edx+20]
 00071F9E    test        eax,eax
>00071FA0    jle         00071FEF
 00071FA2    mov         eax,ebx
 00071FA4    call        TBitmap.GetTransparentColor
 00071FA9    mov         dword ptr [esi+1C],eax
 00071FAC    mov         eax,ebx
 00071FAE    mov         edx,dword ptr [eax]
 00071FB0    call        dword ptr [edx+2C]
 00071FB3    push        eax
 00071FB4    mov         eax,ebx
 00071FB6    mov         edx,dword ptr [eax]
 00071FB8    call        dword ptr [edx+20]
 00071FBB    pop         edx
 00071FBC    xchg        eax,edx
 00071FBD    mov         ecx,edx
 00071FBF    cdq
 00071FC0    idiv        eax,ecx
 00071FC2    test        edx,edx
>00071FC4    jne         00071FEF
 00071FC6    mov         eax,ebx
 00071FC8    mov         edx,dword ptr [eax]
 00071FCA    call        dword ptr [edx+2C]
 00071FCD    push        eax
 00071FCE    mov         eax,ebx
 00071FD0    mov         edx,dword ptr [eax]
 00071FD2    call        dword ptr [edx+20]
 00071FD5    pop         edx
 00071FD6    xchg        eax,edx
 00071FD7    mov         ecx,edx
 00071FD9    cdq
 00071FDA    idiv        eax,ecx
 00071FDC    cmp         eax,4
>00071FDF    jle         00071FE6
 00071FE1    mov         eax,1
 00071FE6    mov         edx,eax
 00071FE8    mov         eax,esi
 00071FEA    call        TButtonGlyph.SetNumGlyphs
 00071FEF    pop         esi
 00071FF0    pop         ebx
 00071FF1    ret
*}
end;

//00071FF4
procedure TButtonGlyph.SetNumGlyphs(Value:TNumGlyphs);
begin
{*
 00071FF4    push        ebx
 00071FF5    push        esi
 00071FF6    mov         ebx,edx
 00071FF8    mov         esi,eax
 00071FFA    cmp         bl,byte ptr [esi+20]
>00071FFD    je          00072017
 00071FFF    test        bl,bl
>00072001    jbe         00072017
 00072003    mov         eax,esi
 00072005    call        TButtonGlyph.Invalidate
 0007200A    mov         byte ptr [esi+20],bl
 0007200D    mov         edx,dword ptr [esi+4]
 00072010    mov         eax,esi
 00072012    call        TButtonGlyph.GlyphChanged
 00072017    pop         esi
 00072018    pop         ebx
 00072019    ret
*}
end;

//0007201C
function TButtonGlyph.CreateButtonGlyph(State:TButtonState):Integer;
begin
{*
 0007201C    push        ebp
 0007201D    mov         ebp,esp
 0007201F    add         esp,0FFFFFFC8
 00072022    push        ebx
 00072023    push        esi
 00072024    push        edi
 00072025    mov         byte ptr [ebp-5],dl
 00072028    mov         dword ptr [ebp-4],eax
 0007202B    cmp         byte ptr [ebp-5],2
>0007202F    jne         0007203E
 00072031    mov         eax,dword ptr [ebp-4]
 00072034    cmp         byte ptr [eax+20],3
>00072038    jae         0007203E
 0007203A    mov         byte ptr [ebp-5],0
 0007203E    xor         eax,eax
 00072040    mov         al,byte ptr [ebp-5]
 00072043    mov         edx,dword ptr [ebp-4]
 00072046    mov         ebx,dword ptr [edx+eax*4+0C]
 0007204A    cmp         ebx,0FFFFFFFF
>0007204D    jne         000725E9
 00072053    mov         eax,dword ptr [ebp-4]
 00072056    mov         eax,dword ptr [eax+4]
 00072059    mov         edx,dword ptr [eax]
 0007205B    call        dword ptr [edx+2C]
 0007205E    mov         esi,eax
 00072060    mov         eax,dword ptr [ebp-4]
 00072063    mov         eax,dword ptr [eax+4]
 00072066    mov         edx,dword ptr [eax]
 00072068    call        dword ptr [edx+20]
 0007206B    or          esi,eax
>0007206D    je          000725E9
 00072073    mov         eax,dword ptr [ebp-4]
 00072076    mov         eax,dword ptr [eax+4]
 00072079    mov         edx,dword ptr [eax]
 0007207B    call        dword ptr [edx+2C]
 0007207E    mov         edx,dword ptr [ebp-4]
 00072081    movzx       edx,byte ptr [edx+20]
 00072085    mov         ecx,edx
 00072087    cdq
 00072088    idiv        eax,ecx
 0007208A    mov         edi,eax
 0007208C    mov         eax,dword ptr [ebp-4]
 0007208F    mov         eax,dword ptr [eax+4]
 00072092    mov         edx,dword ptr [eax]
 00072094    call        dword ptr [edx+20]
 00072097    mov         esi,eax
 00072099    mov         eax,dword ptr [ebp-4]
 0007209C    cmp         dword ptr [eax+8],0
>000720A0    jne         000720D0
 000720A2    cmp         dword ptr ds:[0B4D9C],0
>000720A9    jne         000720BC
 000720AB    mov         dl,1
 000720AD    mov         eax,[00071B4C];TGlyphCache
 000720B2    call        TGlyphCache.Create
 000720B7    mov         [000B4D9C],eax
 000720BC    mov         ecx,esi
 000720BE    mov         edx,edi
 000720C0    mov         eax,[000B4D9C]
 000720C5    call        TGlyphCache.GetList
 000720CA    mov         edx,dword ptr [ebp-4]
 000720CD    mov         dword ptr [edx+8],eax
 000720D0    mov         dl,1
 000720D2    mov         eax,[00028F70];TBitmap
 000720D7    call        TBitmap.Create
 000720DC    mov         dword ptr [ebp-0C],eax
 000720DF    xor         eax,eax
 000720E1    push        ebp
 000720E2    push        725CB
 000720E7    push        dword ptr fs:[eax]
 000720EA    mov         dword ptr fs:[eax],esp
 000720ED    mov         edx,edi
 000720EF    mov         eax,dword ptr [ebp-0C]
 000720F2    mov         ecx,dword ptr [eax]
 000720F4    call        dword ptr [ecx+40]
 000720F7    mov         edx,esi
 000720F9    mov         eax,dword ptr [ebp-0C]
 000720FC    mov         ecx,dword ptr [eax]
 000720FE    call        dword ptr [ecx+34]
 00072101    push        esi
 00072102    lea         eax,[ebp-28]
 00072105    push        eax
 00072106    mov         ecx,edi
 00072108    xor         edx,edx
 0007210A    xor         eax,eax
 0007210C    call        Rect
 00072111    mov         eax,dword ptr [ebp-0C]
 00072114    call        TBitmap.GetCanvas
 00072119    mov         eax,dword ptr [eax+14]
 0007211C    mov         edx,8000000F
 00072121    call        TBrush.SetColor
 00072126    mov         eax,dword ptr [ebp-4]
 00072129    mov         eax,dword ptr [eax+4]
 0007212C    mov         edx,dword ptr [eax]
 0007212E    call        dword ptr [edx+24]
 00072131    call        CopyPalette
 00072136    mov         edx,eax
 00072138    mov         eax,dword ptr [ebp-0C]
 0007213B    mov         ecx,dword ptr [eax]
 0007213D    call        dword ptr [ecx+38]
 00072140    mov         bl,byte ptr [ebp-5]
 00072143    mov         eax,dword ptr [ebp-4]
 00072146    cmp         bl,byte ptr [eax+20]
>00072149    jl          0007214D
 0007214B    xor         ebx,ebx
 0007214D    push        esi
 0007214E    lea         eax,[ebp-38]
 00072151    push        eax
 00072152    xor         ecx,ecx
 00072154    mov         cl,bl
 00072156    inc         ecx
 00072157    imul        ecx,edi
 0007215A    xor         eax,eax
 0007215C    mov         al,bl
 0007215E    imul        edi
 00072160    xor         edx,edx
 00072162    call        Rect
 00072167    mov         al,byte ptr [ebp-5]
 0007216A    sub         al,1
>0007216C    jb          00072179
>0007216E    je          000721EF
 00072170    dec         eax
 00072171    sub         al,2
>00072173    jae         000725B5
 00072179    lea         eax,[ebp-38]
 0007217C    push        eax
 0007217D    mov         eax,dword ptr [ebp-4]
 00072180    mov         eax,dword ptr [eax+4]
 00072183    call        TBitmap.GetCanvas
 00072188    push        eax
 00072189    mov         eax,dword ptr [ebp-0C]
 0007218C    call        TBitmap.GetCanvas
 00072191    lea         edx,[ebp-28]
 00072194    pop         ecx
 00072195    call        TCanvas.CopyRect
 0007219A    mov         eax,dword ptr [ebp-4]
 0007219D    mov         eax,dword ptr [eax+4]
 000721A0    cmp         byte ptr [eax+28],1
>000721A4    jne         000721CB
 000721A6    mov         eax,dword ptr [ebp-4]
 000721A9    mov         ecx,dword ptr [eax+1C]
 000721AC    mov         eax,dword ptr [ebp-4]
 000721AF    mov         eax,dword ptr [eax+8]
 000721B2    mov         edx,dword ptr [ebp-0C]
 000721B5    call        TGlyphList.AddMasked
 000721BA    xor         edx,edx
 000721BC    mov         dl,byte ptr [ebp-5]
 000721BF    mov         ecx,dword ptr [ebp-4]
 000721C2    mov         dword ptr [ecx+edx*4+0C],eax
>000721C6    jmp         000725B5
 000721CB    mov         eax,dword ptr [ebp-4]
 000721CE    mov         eax,dword ptr [eax+8]
 000721D1    mov         ecx,20000000
 000721D6    mov         edx,dword ptr [ebp-0C]
 000721D9    call        TGlyphList.AddMasked
 000721DE    xor         edx,edx
 000721E0    mov         dl,byte ptr [ebp-5]
 000721E3    mov         ecx,dword ptr [ebp-4]
 000721E6    mov         dword ptr [ecx+edx*4+0C],eax
>000721EA    jmp         000725B5
 000721EF    xor         eax,eax
 000721F1    mov         dword ptr [ebp-14],eax
 000721F4    xor         eax,eax
 000721F6    mov         dword ptr [ebp-10],eax
 000721F9    xor         eax,eax
 000721FB    push        ebp
 000721FC    push        7258F
 00072201    push        dword ptr fs:[eax]
 00072204    mov         dword ptr fs:[eax],esp
 00072207    mov         dl,1
 00072209    mov         eax,[00028F70];TBitmap
 0007220E    call        TBitmap.Create
 00072213    mov         dword ptr [ebp-14],eax
 00072216    mov         dl,1
 00072218    mov         eax,[00028F70];TBitmap
 0007221D    call        TBitmap.Create
 00072222    mov         dword ptr [ebp-10],eax
 00072225    mov         eax,dword ptr [ebp-4]
 00072228    mov         edx,dword ptr [eax+4]
 0007222B    mov         eax,dword ptr [ebp-10]
 0007222E    mov         ecx,dword ptr [eax]
 00072230    call        dword ptr [ecx+8]
 00072233    mov         dl,1
 00072235    mov         eax,dword ptr [ebp-10]
 00072238    mov         ecx,dword ptr [eax]
 0007223A    call        dword ptr [ecx+68]
 0007223D    mov         eax,dword ptr [ebp-4]
 00072240    cmp         byte ptr [eax+20],1
>00072244    jbe         00072422
 0007224A    mov         eax,dword ptr [ebp-0C]
 0007224D    call        TBitmap.GetCanvas
 00072252    mov         dword ptr [ebp-18],eax
 00072255    lea         eax,[ebp-38]
 00072258    push        eax
 00072259    mov         eax,dword ptr [ebp-10]
 0007225C    call        TBitmap.GetCanvas
 00072261    mov         ecx,eax
 00072263    lea         edx,[ebp-28]
 00072266    mov         eax,dword ptr [ebp-18]
 00072269    call        TCanvas.CopyRect
 0007226E    mov         dl,1
 00072270    mov         eax,dword ptr [ebp-14]
 00072273    call        TBitmap.SetMonochrome
 00072278    mov         edx,edi
 0007227A    mov         eax,dword ptr [ebp-14]
 0007227D    mov         ecx,dword ptr [eax]
 0007227F    call        dword ptr [ecx+40]
 00072282    mov         edx,esi
 00072284    mov         eax,dword ptr [ebp-14]
 00072287    mov         ecx,dword ptr [eax]
 00072289    call        dword ptr [ecx+34]
 0007228C    mov         eax,dword ptr [ebp-10]
 0007228F    call        TBitmap.GetCanvas
 00072294    mov         eax,dword ptr [eax+14]
 00072297    mov         edx,0FFFFFF
 0007229C    call        TBrush.SetColor
 000722A1    lea         eax,[ebp-38]
 000722A4    push        eax
 000722A5    mov         eax,dword ptr [ebp-10]
 000722A8    call        TBitmap.GetCanvas
 000722AD    push        eax
 000722AE    mov         eax,dword ptr [ebp-14]
 000722B1    call        TBitmap.GetCanvas
 000722B6    lea         edx,[ebp-28]
 000722B9    pop         ecx
 000722BA    call        TCanvas.CopyRect
 000722BF    mov         eax,dword ptr [ebp-18]
 000722C2    mov         eax,dword ptr [eax+14]
 000722C5    mov         edx,80000014
 000722CA    call        TBrush.SetColor
 000722CF    mov         eax,dword ptr [ebp-18]
 000722D2    call        TCanvas.GetHandle
 000722D7    mov         ebx,eax
 000722D9    push        0
 000722DB    push        ebx
 000722DC    call        gdi32.SetTextColor
 000722E1    push        0FFFFFF
 000722E6    push        ebx
 000722E7    call        gdi32.SetBkColor
 000722EC    push        0E20746
 000722F1    push        0
 000722F3    push        0
 000722F5    mov         eax,dword ptr [ebp-14]
 000722F8    call        TBitmap.GetCanvas
 000722FD    call        TCanvas.GetHandle
 00072302    push        eax
 00072303    push        esi
 00072304    push        edi
 00072305    push        0
 00072307    push        0
 00072309    push        ebx
 0007230A    call        gdi32.BitBlt
 0007230F    mov         eax,dword ptr [ebp-10]
 00072312    call        TBitmap.GetCanvas
 00072317    mov         eax,dword ptr [eax+14]
 0007231A    mov         edx,808080
 0007231F    call        TBrush.SetColor
 00072324    lea         eax,[ebp-38]
 00072327    push        eax
 00072328    mov         eax,dword ptr [ebp-10]
 0007232B    call        TBitmap.GetCanvas
 00072330    push        eax
 00072331    mov         eax,dword ptr [ebp-14]
 00072334    call        TBitmap.GetCanvas
 00072339    lea         edx,[ebp-28]
 0007233C    pop         ecx
 0007233D    call        TCanvas.CopyRect
 00072342    mov         eax,dword ptr [ebp-18]
 00072345    mov         eax,dword ptr [eax+14]
 00072348    mov         edx,80000010
 0007234D    call        TBrush.SetColor
 00072352    mov         eax,dword ptr [ebp-18]
 00072355    call        TCanvas.GetHandle
 0007235A    mov         ebx,eax
 0007235C    push        0
 0007235E    push        ebx
 0007235F    call        gdi32.SetTextColor
 00072364    push        0FFFFFF
 00072369    push        ebx
 0007236A    call        gdi32.SetBkColor
 0007236F    push        0E20746
 00072374    push        0
 00072376    push        0
 00072378    mov         eax,dword ptr [ebp-14]
 0007237B    call        TBitmap.GetCanvas
 00072380    call        TCanvas.GetHandle
 00072385    push        eax
 00072386    push        esi
 00072387    push        edi
 00072388    push        0
 0007238A    push        0
 0007238C    push        ebx
 0007238D    call        gdi32.BitBlt
 00072392    mov         eax,dword ptr [ebp-4]
 00072395    mov         eax,dword ptr [eax+1C]
 00072398    call        ColorToRGB
 0007239D    push        eax
 0007239E    mov         eax,dword ptr [ebp-10]
 000723A1    call        TBitmap.GetCanvas
 000723A6    mov         eax,dword ptr [eax+14]
 000723A9    pop         edx
 000723AA    call        TBrush.SetColor
 000723AF    lea         eax,[ebp-38]
 000723B2    push        eax
 000723B3    mov         eax,dword ptr [ebp-10]
 000723B6    call        TBitmap.GetCanvas
 000723BB    push        eax
 000723BC    mov         eax,dword ptr [ebp-14]
 000723BF    call        TBitmap.GetCanvas
 000723C4    lea         edx,[ebp-28]
 000723C7    pop         ecx
 000723C8    call        TCanvas.CopyRect
 000723CD    mov         eax,dword ptr [ebp-18]
 000723D0    mov         eax,dword ptr [eax+14]
 000723D3    mov         edx,8000000F
 000723D8    call        TBrush.SetColor
 000723DD    mov         eax,dword ptr [ebp-18]
 000723E0    call        TCanvas.GetHandle
 000723E5    mov         ebx,eax
 000723E7    push        0
 000723E9    push        ebx
 000723EA    call        gdi32.SetTextColor
 000723EF    push        0FFFFFF
 000723F4    push        ebx
 000723F5    call        gdi32.SetBkColor
 000723FA    push        0E20746
 000723FF    push        0
 00072401    push        0
 00072403    mov         eax,dword ptr [ebp-14]
 00072406    call        TBitmap.GetCanvas
 0007240B    call        TCanvas.GetHandle
 00072410    push        eax
 00072411    push        esi
 00072412    push        edi
 00072413    push        0
 00072415    push        0
 00072417    push        ebx
 00072418    call        gdi32.BitBlt
>0007241D    jmp         00072571
 00072422    mov         eax,dword ptr [ebp-4]
 00072425    mov         edx,dword ptr [eax+4]
 00072428    mov         eax,dword ptr [ebp-14]
 0007242B    mov         ecx,dword ptr [eax]
 0007242D    call        dword ptr [ecx+8]
 00072430    mov         dl,1
 00072432    mov         eax,dword ptr [ebp-14]
 00072435    mov         ecx,dword ptr [eax]
 00072437    call        dword ptr [ecx+68]
 0007243A    mov         eax,dword ptr [ebp-14]
 0007243D    call        TBitmap.GetCanvas
 00072442    mov         eax,dword ptr [eax+14]
 00072445    xor         edx,edx
 00072447    call        TBrush.SetColor
 0007244C    mov         edx,edi
 0007244E    mov         eax,dword ptr [ebp-14]
 00072451    mov         ecx,dword ptr [eax]
 00072453    call        dword ptr [ecx+40]
 00072456    mov         eax,dword ptr [ebp-14]
 00072459    call        TBitmap.GetMonochrome
 0007245E    test        al,al
>00072460    je          00072496
 00072462    mov         eax,dword ptr [ebp-14]
 00072465    call        TBitmap.GetCanvas
 0007246A    mov         eax,dword ptr [eax+0C]
 0007246D    mov         edx,0FFFFFF
 00072472    call        TFont.SetColor
 00072477    xor         edx,edx
 00072479    mov         eax,dword ptr [ebp-14]
 0007247C    call        TBitmap.SetMonochrome
 00072481    mov         eax,dword ptr [ebp-14]
 00072484    call        TBitmap.GetCanvas
 00072489    mov         eax,dword ptr [eax+14]
 0007248C    mov         edx,0FFFFFF
 00072491    call        TBrush.SetColor
 00072496    mov         dl,1
 00072498    mov         eax,dword ptr [ebp-14]
 0007249B    call        TBitmap.SetMonochrome
 000724A0    mov         eax,dword ptr [ebp-0C]
 000724A3    call        TBitmap.GetCanvas
 000724A8    mov         ebx,eax
 000724AA    mov         eax,dword ptr [ebx+14]
 000724AD    mov         edx,8000000F
 000724B2    call        TBrush.SetColor
 000724B7    lea         edx,[ebp-28]
 000724BA    mov         eax,ebx
 000724BC    call        TCanvas.FillRect
 000724C1    mov         eax,dword ptr [ebx+14]
 000724C4    mov         edx,80000014
 000724C9    call        TBrush.SetColor
 000724CE    push        0
 000724D0    mov         eax,ebx
 000724D2    call        TCanvas.GetHandle
 000724D7    push        eax
 000724D8    call        gdi32.SetTextColor
 000724DD    push        0FFFFFF
 000724E2    mov         eax,ebx
 000724E4    call        TCanvas.GetHandle
 000724E9    push        eax
 000724EA    call        gdi32.SetBkColor
 000724EF    push        0E20746
 000724F4    push        0
 000724F6    push        0
 000724F8    mov         eax,dword ptr [ebp-14]
 000724FB    call        TBitmap.GetCanvas
 00072500    call        TCanvas.GetHandle
 00072505    push        eax
 00072506    push        esi
 00072507    push        edi
 00072508    push        1
 0007250A    push        1
 0007250C    mov         eax,ebx
 0007250E    call        TCanvas.GetHandle
 00072513    push        eax
 00072514    call        gdi32.BitBlt
 00072519    mov         eax,dword ptr [ebx+14]
 0007251C    mov         edx,80000010
 00072521    call        TBrush.SetColor
 00072526    push        0
 00072528    mov         eax,ebx
 0007252A    call        TCanvas.GetHandle
 0007252F    push        eax
 00072530    call        gdi32.SetTextColor
 00072535    push        0FFFFFF
 0007253A    mov         eax,ebx
 0007253C    call        TCanvas.GetHandle
 00072541    push        eax
 00072542    call        gdi32.SetBkColor
 00072547    push        0E20746
 0007254C    push        0
 0007254E    push        0
 00072550    mov         eax,dword ptr [ebp-14]
 00072553    call        TBitmap.GetCanvas
 00072558    call        TCanvas.GetHandle
 0007255D    push        eax
 0007255E    push        esi
 0007255F    push        edi
 00072560    push        0
 00072562    push        0
 00072564    mov         eax,ebx
 00072566    call        TCanvas.GetHandle
 0007256B    push        eax
 0007256C    call        gdi32.BitBlt
 00072571    xor         eax,eax
 00072573    pop         edx
 00072574    pop         ecx
 00072575    pop         ecx
 00072576    mov         dword ptr fs:[eax],edx
 00072579    push        72596
 0007257E    mov         eax,dword ptr [ebp-10]
 00072581    call        TObject.Free
 00072586    mov         eax,dword ptr [ebp-14]
 00072589    call        TObject.Free
 0007258E    ret
>0007258F    jmp         @HandleFinally
>00072594    jmp         0007257E
 00072596    mov         eax,dword ptr [ebp-4]
 00072599    mov         eax,dword ptr [eax+8]
 0007259C    mov         ecx,20000000
 000725A1    mov         edx,dword ptr [ebp-0C]
 000725A4    call        TGlyphList.AddMasked
 000725A9    xor         edx,edx
 000725AB    mov         dl,byte ptr [ebp-5]
 000725AE    mov         ecx,dword ptr [ebp-4]
 000725B1    mov         dword ptr [ecx+edx*4+0C],eax
 000725B5    xor         eax,eax
 000725B7    pop         edx
 000725B8    pop         ecx
 000725B9    pop         ecx
 000725BA    mov         dword ptr fs:[eax],edx
 000725BD    push        725D2
 000725C2    mov         eax,dword ptr [ebp-0C]
 000725C5    call        TObject.Free
 000725CA    ret
>000725CB    jmp         @HandleFinally
>000725D0    jmp         000725C2
 000725D2    xor         eax,eax
 000725D4    mov         al,byte ptr [ebp-5]
 000725D7    mov         edx,dword ptr [ebp-4]
 000725DA    mov         ebx,dword ptr [edx+eax*4+0C]
 000725DE    mov         eax,dword ptr [ebp-4]
 000725E1    mov         eax,dword ptr [eax+4]
 000725E4    call        TBitmap.Dormant
 000725E9    mov         eax,ebx
 000725EB    pop         edi
 000725EC    pop         esi
 000725ED    pop         ebx
 000725EE    mov         esp,ebp
 000725F0    pop         ebp
 000725F1    ret
*}
end;

//000725F4
procedure TButtonGlyph.DrawButtonGlyph(Canvas:TCanvas; const GlyphPos:TPoint; State:TButtonState; Transparent:Boolean);
begin
{*
 000725F4    push        ebp
 000725F5    mov         ebp,esp
 000725F7    push        ecx
 000725F8    push        ebx
 000725F9    push        esi
 000725FA    push        edi
 000725FB    mov         esi,ecx
 000725FD    mov         dword ptr [ebp-4],edx
 00072600    mov         ebx,eax
 00072602    cmp         dword ptr [ebx+4],0
>00072606    je          000726A6
 0007260C    mov         eax,dword ptr [ebx+4]
 0007260F    mov         edx,dword ptr [eax]
 00072611    call        dword ptr [edx+2C]
 00072614    test        eax,eax
>00072616    je          000726A6
 0007261C    mov         eax,dword ptr [ebx+4]
 0007261F    mov         edx,dword ptr [eax]
 00072621    call        dword ptr [edx+20]
 00072624    test        eax,eax
>00072626    je          000726A6
 00072628    mov         dl,byte ptr [ebp+0C]
 0007262B    mov         eax,ebx
 0007262D    call        TButtonGlyph.CreateButtonGlyph
 00072632    mov         edi,eax
 00072634    cmp         byte ptr [ebp+8],0
>00072638    jne         00072640
 0007263A    cmp         byte ptr [ebp+0C],3
>0007263E    jne         00072671
 00072640    push        1
 00072642    push        1FFFFFFF
 00072647    push        1FFFFFFF
 0007264C    push        0
 0007264E    push        0
 00072650    mov         eax,dword ptr [esi+4]
 00072653    push        eax
 00072654    mov         eax,dword ptr [esi]
 00072656    push        eax
 00072657    mov         eax,dword ptr [ebp-4]
 0007265A    call        TCanvas.GetHandle
 0007265F    push        eax
 00072660    push        edi
 00072661    mov         eax,dword ptr [ebx+8]
 00072664    call        TCustomImageList.GetHandle
 00072669    push        eax
 0007266A    call        comctl32.ImageList_DrawEx
>0007266F    jmp         000726A6
 00072671    push        0
 00072673    push        1FFFFFFF
 00072678    mov         eax,8000000F
 0007267D    call        ColorToRGB
 00072682    push        eax
 00072683    push        0
 00072685    push        0
 00072687    mov         eax,dword ptr [esi+4]
 0007268A    push        eax
 0007268B    mov         eax,dword ptr [esi]
 0007268D    push        eax
 0007268E    mov         eax,dword ptr [ebp-4]
 00072691    call        TCanvas.GetHandle
 00072696    push        eax
 00072697    push        edi
 00072698    mov         eax,dword ptr [ebx+8]
 0007269B    call        TCustomImageList.GetHandle
 000726A0    push        eax
 000726A1    call        comctl32.ImageList_DrawEx
 000726A6    pop         edi
 000726A7    pop         esi
 000726A8    pop         ebx
 000726A9    pop         ecx
 000726AA    pop         ebp
 000726AB    ret         8
*}
end;

//000726B0
procedure TButtonGlyph.DrawButtonText(Canvas:TCanvas; const Caption:AnsiString; TextBounds:TRect; State:TButtonState; BiDiFlags:Longint);
begin
{*
 000726B0    push        ebp
 000726B1    mov         ebp,esp
 000726B3    add         esp,0FFFFFFF0
 000726B6    push        ebx
 000726B7    push        esi
 000726B8    push        edi
 000726B9    mov         esi,dword ptr [ebp+10]
 000726BC    lea         edi,[ebp-10]
 000726BF    push        ecx
 000726C0    mov         ecx,4
 000726C5    rep movs    dword ptr [edi],dword ptr [esi]
 000726C7    pop         ecx
 000726C8    mov         esi,ecx
 000726CA    mov         ebx,edx
 000726CC    mov         edi,dword ptr [ebp+8]
 000726CF    mov         dl,1
 000726D1    mov         eax,dword ptr [ebx+14]
 000726D4    call        TBrush.SetStyle
 000726D9    cmp         byte ptr [ebp+0C],1
>000726DD    jne         00072765
 000726E3    push        1
 000726E5    push        1
 000726E7    lea         eax,[ebp-10]
 000726EA    push        eax
 000726EB    call        user32.OffsetRect
 000726F0    mov         edx,80000014
 000726F5    mov         eax,dword ptr [ebx+0C]
 000726F8    call        TFont.SetColor
 000726FD    mov         eax,edi
 000726FF    or          eax,5
 00072702    push        eax
 00072703    lea         eax,[ebp-10]
 00072706    push        eax
 00072707    mov         eax,esi
 00072709    call        @LStrLen
 0007270E    push        eax
 0007270F    mov         eax,esi
 00072711    call        @LStrToPChar
 00072716    push        eax
 00072717    mov         eax,ebx
 00072719    call        TCanvas.GetHandle
 0007271E    push        eax
 0007271F    call        user32.DrawTextA
 00072724    push        0FF
 00072726    push        0FF
 00072728    lea         eax,[ebp-10]
 0007272B    push        eax
 0007272C    call        user32.OffsetRect
 00072731    mov         edx,80000010
 00072736    mov         eax,dword ptr [ebx+0C]
 00072739    call        TFont.SetColor
 0007273E    or          edi,5
 00072741    push        edi
 00072742    lea         eax,[ebp-10]
 00072745    push        eax
 00072746    mov         eax,esi
 00072748    call        @LStrLen
 0007274D    push        eax
 0007274E    mov         eax,esi
 00072750    call        @LStrToPChar
 00072755    push        eax
 00072756    mov         eax,ebx
 00072758    call        TCanvas.GetHandle
 0007275D    push        eax
 0007275E    call        user32.DrawTextA
>00072763    jmp         0007278A
 00072765    or          edi,5
 00072768    push        edi
 00072769    lea         eax,[ebp-10]
 0007276C    push        eax
 0007276D    mov         eax,esi
 0007276F    call        @LStrLen
 00072774    push        eax
 00072775    mov         eax,esi
 00072777    call        @LStrToPChar
 0007277C    push        eax
 0007277D    mov         eax,ebx
 0007277F    call        TCanvas.GetHandle
 00072784    push        eax
 00072785    call        user32.DrawTextA
 0007278A    pop         edi
 0007278B    pop         esi
 0007278C    pop         ebx
 0007278D    mov         esp,ebp
 0007278F    pop         ebp
 00072790    ret         0C
*}
end;

//00072794
procedure TButtonGlyph.CalcButtonLayout(Canvas:TCanvas; const Client:TRect; const Offset:TPoint; const Caption:AnsiString; Layout:TButtonLayout; Margin:Integer; Spacing:Integer; var GlyphPos:TPoint; var TextBounds:TRect; BiDiFlags:Longint);
begin
{*
 00072794    push        ebp
 00072795    mov         ebp,esp
 00072797    add         esp,0FFFFFFC0
 0007279A    push        ebx
 0007279B    push        esi
 0007279C    push        edi
 0007279D    mov         ebx,ecx
 0007279F    mov         dword ptr [ebp-8],edx
 000727A2    mov         dword ptr [ebp-4],eax
 000727A5    mov         edi,dword ptr [ebp+0C]
 000727A8    mov         esi,dword ptr [ebp+10]
 000727AB    mov         eax,dword ptr [ebp+8]
 000727AE    and         eax,2
 000727B1    cmp         eax,2
>000727B4    jne         000727CC
 000727B6    cmp         byte ptr [ebp+1C],0
>000727BA    jne         000727C2
 000727BC    mov         byte ptr [ebp+1C],1
>000727C0    jmp         000727CC
 000727C2    cmp         byte ptr [ebp+1C],1
>000727C6    jne         000727CC
 000727C8    mov         byte ptr [ebp+1C],0
 000727CC    mov         edx,dword ptr [ebx+0C]
 000727CF    sub         edx,dword ptr [ebx+4]
 000727D2    mov         eax,dword ptr [ebx+8]
 000727D5    sub         eax,dword ptr [ebx]
 000727D7    lea         ecx,[ebp-18]
 000727DA    call        Point
 000727DF    mov         eax,dword ptr [ebp-4]
 000727E2    cmp         dword ptr [eax+4],0
>000727E6    je          00072816
 000727E8    mov         eax,dword ptr [ebp-4]
 000727EB    mov         eax,dword ptr [eax+4]
 000727EE    mov         edx,dword ptr [eax]
 000727F0    call        dword ptr [edx+20]
 000727F3    push        eax
 000727F4    mov         eax,dword ptr [ebp-4]
 000727F7    mov         eax,dword ptr [eax+4]
 000727FA    mov         edx,dword ptr [eax]
 000727FC    call        dword ptr [edx+2C]
 000727FF    mov         edx,dword ptr [ebp-4]
 00072802    movzx       edx,byte ptr [edx+20]
 00072806    mov         ecx,edx
 00072808    cdq
 00072809    idiv        eax,ecx
 0007280B    lea         ecx,[ebp-20]
 0007280E    pop         edx
 0007280F    call        Point
>00072814    jmp         00072822
 00072816    lea         ecx,[ebp-20]
 00072819    xor         edx,edx
 0007281B    xor         eax,eax
 0007281D    call        Point
 00072822    mov         eax,dword ptr [ebp+20]
 00072825    call        @LStrLen
 0007282A    test        eax,eax
>0007282C    jle         0007288F
 0007282E    push        0
 00072830    lea         eax,[ebp-40]
 00072833    push        eax
 00072834    mov         ecx,dword ptr [ebx+8]
 00072837    sub         ecx,dword ptr [ebx]
 00072839    xor         edx,edx
 0007283B    xor         eax,eax
 0007283D    call        Rect
 00072842    push        esi
 00072843    push        edi
 00072844    lea         esi,[ebp-40]
 00072847    mov         ecx,4
 0007284C    rep movs    dword ptr [edi],dword ptr [esi]
 0007284E    pop         edi
 0007284F    pop         esi
 00072850    mov         eax,dword ptr [ebp+8]
 00072853    or          eax,400
 00072858    push        eax
 00072859    push        edi
 0007285A    mov         eax,dword ptr [ebp+20]
 0007285D    call        @LStrLen
 00072862    push        eax
 00072863    mov         eax,dword ptr [ebp+20]
 00072866    call        @LStrToPChar
 0007286B    push        eax
 0007286C    mov         eax,dword ptr [ebp-8]
 0007286F    call        TCanvas.GetHandle
 00072874    push        eax
 00072875    call        user32.DrawTextA
 0007287A    mov         edx,dword ptr [edi+0C]
 0007287D    sub         edx,dword ptr [edi+4]
 00072880    mov         eax,dword ptr [edi+8]
 00072883    sub         eax,dword ptr [edi]
 00072885    lea         ecx,[ebp-28]
 00072888    call        Point
>0007288D    jmp         000728BA
 0007288F    push        0
 00072891    lea         eax,[ebp-40]
 00072894    push        eax
 00072895    xor         ecx,ecx
 00072897    xor         edx,edx
 00072899    xor         eax,eax
 0007289B    call        Rect
 000728A0    push        esi
 000728A1    push        edi
 000728A2    lea         esi,[ebp-40]
 000728A5    mov         ecx,4
 000728AA    rep movs    dword ptr [edi],dword ptr [esi]
 000728AC    pop         edi
 000728AD    pop         esi
 000728AE    lea         ecx,[ebp-28]
 000728B1    xor         edx,edx
 000728B3    xor         eax,eax
 000728B5    call        Point
 000728BA    mov         al,byte ptr [ebp+1C]
 000728BD    sub         al,2
>000728BF    jae         000728E4
 000728C1    mov         eax,dword ptr [ebp-14]
 000728C4    mov         edx,eax
 000728C6    sub         edx,dword ptr [ebp-1C]
 000728C9    inc         edx
 000728CA    sar         edx,1
>000728CC    jns         000728D1
 000728CE    adc         edx,0
 000728D1    mov         dword ptr [esi+4],edx
 000728D4    sub         eax,dword ptr [ebp-24]
 000728D7    inc         eax
 000728D8    sar         eax,1
>000728DA    jns         000728DF
 000728DC    adc         eax,0
 000728DF    mov         dword ptr [ebp-0C],eax
>000728E2    jmp         00072904
 000728E4    mov         eax,dword ptr [ebp-18]
 000728E7    mov         edx,eax
 000728E9    sub         edx,dword ptr [ebp-20]
 000728EC    inc         edx
 000728ED    sar         edx,1
>000728EF    jns         000728F4
 000728F1    adc         edx,0
 000728F4    mov         dword ptr [esi],edx
 000728F6    sub         eax,dword ptr [ebp-28]
 000728F9    inc         eax
 000728FA    sar         eax,1
>000728FC    jns         00072901
 000728FE    adc         eax,0
 00072901    mov         dword ptr [ebp-10],eax
 00072904    cmp         dword ptr [ebp-28],0
>00072908    je          00072910
 0007290A    cmp         dword ptr [ebp-20],0
>0007290E    jne         00072915
 00072910    xor         eax,eax
 00072912    mov         dword ptr [ebp+14],eax
 00072915    cmp         dword ptr [ebp+18],0FFFFFFFF
>00072919    jne         000729B6
 0007291F    cmp         dword ptr [ebp+14],0FFFFFFFF
>00072923    jne         0007296F
 00072925    lea         ecx,[ebp-30]
 00072928    mov         edx,dword ptr [ebp-1C]
 0007292B    add         edx,dword ptr [ebp-24]
 0007292E    mov         eax,dword ptr [ebp-20]
 00072931    add         eax,dword ptr [ebp-28]
 00072934    call        Point
 00072939    mov         al,byte ptr [ebp+1C]
 0007293C    sub         al,2
>0007293E    jae         00072953
 00072940    mov         eax,dword ptr [ebp-18]
 00072943    sub         eax,dword ptr [ebp-30]
 00072946    mov         ecx,3
 0007294B    cdq
 0007294C    idiv        eax,ecx
 0007294E    mov         dword ptr [ebp+18],eax
>00072951    jmp         00072964
 00072953    mov         eax,dword ptr [ebp-14]
 00072956    sub         eax,dword ptr [ebp-2C]
 00072959    mov         ecx,3
 0007295E    cdq
 0007295F    idiv        eax,ecx
 00072961    mov         dword ptr [ebp+18],eax
 00072964    mov         eax,dword ptr [ebp+18]
 00072967    mov         dword ptr [ebp+14],eax
>0007296A    jmp         00072A05
 0007296F    lea         ecx,[ebp-30]
 00072972    mov         edx,dword ptr [ebp-1C]
 00072975    add         edx,dword ptr [ebp+14]
 00072978    add         edx,dword ptr [ebp-24]
 0007297B    mov         eax,dword ptr [ebp-20]
 0007297E    add         eax,dword ptr [ebp+14]
 00072981    add         eax,dword ptr [ebp-28]
 00072984    call        Point
 00072989    mov         al,byte ptr [ebp+1C]
 0007298C    sub         al,2
>0007298E    jae         000729A3
 00072990    mov         eax,dword ptr [ebp-18]
 00072993    sub         eax,dword ptr [ebp-30]
 00072996    inc         eax
 00072997    sar         eax,1
>00072999    jns         0007299E
 0007299B    adc         eax,0
 0007299E    mov         dword ptr [ebp+18],eax
>000729A1    jmp         00072A05
 000729A3    mov         eax,dword ptr [ebp-14]
 000729A6    sub         eax,dword ptr [ebp-2C]
 000729A9    inc         eax
 000729AA    sar         eax,1
>000729AC    jns         000729B1
 000729AE    adc         eax,0
 000729B1    mov         dword ptr [ebp+18],eax
>000729B4    jmp         00072A05
 000729B6    cmp         dword ptr [ebp+14],0FFFFFFFF
>000729BA    jne         00072A05
 000729BC    mov         eax,dword ptr [ebp+18]
 000729BF    add         eax,dword ptr [ebp-1C]
 000729C2    mov         edx,dword ptr [ebp-14]
 000729C5    sub         edx,eax
 000729C7    mov         eax,dword ptr [ebp+18]
 000729CA    add         eax,dword ptr [ebp-20]
 000729CD    push        eax
 000729CE    mov         eax,dword ptr [ebp-18]
 000729D1    pop         ecx
 000729D2    sub         eax,ecx
 000729D4    lea         ecx,[ebp-30]
 000729D7    call        Point
 000729DC    mov         al,byte ptr [ebp+1C]
 000729DF    sub         al,2
>000729E1    jae         000729F5
 000729E3    mov         eax,dword ptr [ebp-30]
 000729E6    sub         eax,dword ptr [ebp-28]
 000729E9    sar         eax,1
>000729EB    jns         000729F0
 000729ED    adc         eax,0
 000729F0    mov         dword ptr [ebp+14],eax
>000729F3    jmp         00072A05
 000729F5    mov         eax,dword ptr [ebp-2C]
 000729F8    sub         eax,dword ptr [ebp-24]
 000729FB    sar         eax,1
>000729FD    jns         00072A02
 000729FF    adc         eax,0
 00072A02    mov         dword ptr [ebp+14],eax
 00072A05    mov         al,byte ptr [ebp+1C]
 00072A08    sub         al,1
>00072A0A    jb          00072A18
>00072A0C    je          00072A28
 00072A0E    dec         al
>00072A10    je          00072A3E
 00072A12    dec         al
>00072A14    je          00072A4F
>00072A16    jmp         00072A64
 00072A18    mov         eax,dword ptr [ebp+18]
 00072A1B    mov         dword ptr [esi],eax
 00072A1D    add         eax,dword ptr [ebp-20]
 00072A20    add         eax,dword ptr [ebp+14]
 00072A23    mov         dword ptr [ebp-10],eax
>00072A26    jmp         00072A64
 00072A28    mov         eax,dword ptr [ebp-18]
 00072A2B    sub         eax,dword ptr [ebp+18]
 00072A2E    sub         eax,dword ptr [ebp-20]
 00072A31    mov         dword ptr [esi],eax
 00072A33    sub         eax,dword ptr [ebp+14]
 00072A36    sub         eax,dword ptr [ebp-28]
 00072A39    mov         dword ptr [ebp-10],eax
>00072A3C    jmp         00072A64
 00072A3E    mov         eax,dword ptr [ebp+18]
 00072A41    mov         dword ptr [esi+4],eax
 00072A44    add         eax,dword ptr [ebp-1C]
 00072A47    add         eax,dword ptr [ebp+14]
 00072A4A    mov         dword ptr [ebp-0C],eax
>00072A4D    jmp         00072A64
 00072A4F    mov         eax,dword ptr [ebp-14]
 00072A52    sub         eax,dword ptr [ebp+18]
 00072A55    sub         eax,dword ptr [ebp-1C]
 00072A58    mov         dword ptr [esi+4],eax
 00072A5B    sub         eax,dword ptr [ebp+14]
 00072A5E    sub         eax,dword ptr [ebp-24]
 00072A61    mov         dword ptr [ebp-0C],eax
 00072A64    mov         eax,dword ptr [ebx]
 00072A66    mov         edx,dword ptr [ebp+24]
 00072A69    add         eax,dword ptr [edx]
 00072A6B    add         dword ptr [esi],eax
 00072A6D    mov         eax,dword ptr [ebx+4]
 00072A70    mov         edx,dword ptr [ebp+24]
 00072A73    add         eax,dword ptr [edx+4]
 00072A76    add         dword ptr [esi+4],eax
 00072A79    mov         edx,dword ptr [ebx+4]
 00072A7C    add         edx,dword ptr [ebp-0C]
 00072A7F    mov         eax,dword ptr [ebp+24]
 00072A82    mov         eax,dword ptr [eax]
 00072A84    add         edx,eax
 00072A86    push        edx
 00072A87    mov         edx,dword ptr [ebx]
 00072A89    add         edx,dword ptr [ebp-10]
 00072A8C    mov         ecx,dword ptr [ebp+24]
 00072A8F    add         edx,eax
 00072A91    push        edx
 00072A92    push        edi
 00072A93    call        user32.OffsetRect
 00072A98    pop         edi
 00072A99    pop         esi
 00072A9A    pop         ebx
 00072A9B    mov         esp,ebp
 00072A9D    pop         ebp
 00072A9E    ret         20
*}
end;

//00072AA4
function TButtonGlyph.Draw(Canvas:TCanvas; const Client:TRect; const Offset:TPoint; const Caption:AnsiString; Layout:TButtonLayout; Margin:Integer; Spacing:Integer; State:TButtonState; Transparent:Boolean; BiDiFlags:Longint):TRect;
begin
{*
 00072AA4    push        ebp
 00072AA5    mov         ebp,esp
 00072AA7    add         esp,0FFFFFFF4
 00072AAA    push        ebx
 00072AAB    push        esi
 00072AAC    push        edi
 00072AAD    mov         dword ptr [ebp-4],ecx
 00072AB0    mov         esi,edx
 00072AB2    mov         ebx,eax
 00072AB4    mov         edi,dword ptr [ebp+24]
 00072AB7    mov         eax,dword ptr [ebp+28]
 00072ABA    push        eax
 00072ABB    push        edi
 00072ABC    mov         al,byte ptr [ebp+20]
 00072ABF    push        eax
 00072AC0    mov         eax,dword ptr [ebp+1C]
 00072AC3    push        eax
 00072AC4    mov         eax,dword ptr [ebp+18]
 00072AC7    push        eax
 00072AC8    lea         eax,[ebp-0C]
 00072ACB    push        eax
 00072ACC    mov         eax,dword ptr [ebp+8]
 00072ACF    push        eax
 00072AD0    mov         eax,dword ptr [ebp+0C]
 00072AD3    push        eax
 00072AD4    mov         ecx,dword ptr [ebp-4]
 00072AD7    mov         edx,esi
 00072AD9    mov         eax,ebx
 00072ADB    call        TButtonGlyph.CalcButtonLayout
 00072AE0    mov         al,byte ptr [ebp+14]
 00072AE3    push        eax
 00072AE4    mov         al,byte ptr [ebp+10]
 00072AE7    push        eax
 00072AE8    lea         ecx,[ebp-0C]
 00072AEB    mov         edx,esi
 00072AED    mov         eax,ebx
 00072AEF    call        TButtonGlyph.DrawButtonGlyph
 00072AF4    mov         eax,dword ptr [ebp+8]
 00072AF7    push        eax
 00072AF8    mov         al,byte ptr [ebp+14]
 00072AFB    push        eax
 00072AFC    mov         eax,dword ptr [ebp+0C]
 00072AFF    push        eax
 00072B00    mov         ecx,edi
 00072B02    mov         edx,esi
 00072B04    mov         eax,ebx
 00072B06    call        TButtonGlyph.DrawButtonText
 00072B0B    pop         edi
 00072B0C    pop         esi
 00072B0D    pop         ebx
 00072B0E    mov         esp,ebp
 00072B10    pop         ebp
 00072B11    ret         24
*}
end;

//00072B14
constructor TSpeedButton.Create(AOwner:TComponent);
begin
{*
 00072B14    push        ebp
 00072B15    mov         ebp,esp
 00072B17    push        ecx
 00072B18    push        ebx
 00072B19    push        esi
 00072B1A    test        dl,dl
>00072B1C    je          00072B26
 00072B1E    add         esp,0FFFFFFF0
 00072B21    call        @ClassCreate
 00072B26    mov         esi,ecx
 00072B28    mov         byte ptr [ebp-1],dl
 00072B2B    mov         ebx,eax
 00072B2D    mov         dl,1
 00072B2F    mov         eax,[00071BA4];TButtonGlyph
 00072B34    call        TButtonGlyph.Create
 00072B39    mov         dword ptr [ebx+11C],eax
 00072B3F    mov         eax,dword ptr [ebx+11C]
 00072B45    mov         dword ptr [eax+28],ebx
 00072B48    mov         dword ptr [eax+24],73140;TSpeedButton.GlyphChanged
 00072B4F    mov         ecx,esi
 00072B51    xor         edx,edx
 00072B53    mov         eax,ebx
 00072B55    call        TGraphicControl.Create
 00072B5A    push        17
 00072B5C    push        16
 00072B5E    xor         ecx,ecx
 00072B60    xor         edx,edx
 00072B62    mov         eax,ebx
 00072B64    mov         esi,dword ptr [eax]
 00072B66    call        dword ptr [esi+80]
 00072B6C    mov         eax,[00072BD0]
 00072B71    mov         dword ptr [ebx+40],eax
 00072B74    mov         dl,1
 00072B76    mov         eax,ebx
 00072B78    call        TControl.SetParentFont
 00072B7D    mov         edx,8000000F
 00072B82    mov         eax,ebx
 00072B84    call        TControl.SetColor
 00072B89    mov         dword ptr [ebx+124],4
 00072B93    mov         dword ptr [ebx+12C],0FFFFFFFF
 00072B9D    mov         byte ptr [ebx+123],0
 00072BA4    mov         byte ptr [ebx+128],1
 00072BAB    inc         dword ptr ds:[0B4DA0]
 00072BB1    mov         eax,ebx
 00072BB3    cmp         byte ptr [ebp-1],0
>00072BB7    je          00072BC8
 00072BB9    call        @AfterConstruction
 00072BBE    pop         dword ptr fs:[0]
 00072BC5    add         esp,0C
 00072BC8    mov         eax,ebx
 00072BCA    pop         esi
 00072BCB    pop         ebx
 00072BCC    pop         ecx
 00072BCD    pop         ebp
 00072BCE    ret
*}
end;

//00072BD4
destructor TSpeedButton.Destroy;
begin
{*
 00072BD4    push        ebx
 00072BD5    push        esi
 00072BD6    call        @BeforeDestruction
 00072BDB    mov         ebx,edx
 00072BDD    mov         esi,eax
 00072BDF    dec         dword ptr ds:[0B4DA0]
 00072BE5    mov         edx,ebx
 00072BE7    and         dl,0FC
 00072BEA    mov         eax,esi
 00072BEC    call        TGraphicControl.Destroy
 00072BF1    mov         eax,dword ptr [esi+11C]
 00072BF7    call        TObject.Free
 00072BFC    test        bl,bl
>00072BFE    jle         00072C07
 00072C00    mov         eax,esi
 00072C02    call        @ClassDestroy
 00072C07    pop         esi
 00072C08    pop         ebx
 00072C09    ret
*}
end;

//00072C0C
procedure TSpeedButton.Paint;
begin
{*
 00072C0C    push        ebp
 00072C0D    mov         ebp,esp
 00072C0F    add         esp,0FFFFFFD4
 00072C12    push        ebx
 00072C13    push        esi
 00072C14    xor         edx,edx
 00072C16    mov         dword ptr [ebp-2C],edx
 00072C19    mov         ebx,eax
 00072C1B    xor         eax,eax
 00072C1D    push        ebp
 00072C1E    push        72E44
 00072C23    push        dword ptr fs:[eax]
 00072C26    mov         dword ptr fs:[eax],esp
 00072C29    mov         eax,ebx
 00072C2B    mov         edx,dword ptr [eax]
 00072C2D    call        dword ptr [edx+50]
 00072C30    test        al,al
>00072C32    jne         00072C44
 00072C34    mov         byte ptr [ebx+132],1
 00072C3B    mov         byte ptr [ebx+121],0
>00072C42    jmp         00072C6F
 00072C44    cmp         byte ptr [ebx+132],1
>00072C4B    jne         00072C6F
 00072C4D    cmp         byte ptr [ebx+120],0
>00072C54    je          00072C68
 00072C56    cmp         dword ptr [ebx+118],0
>00072C5D    je          00072C68
 00072C5F    mov         byte ptr [ebx+132],3
>00072C66    jmp         00072C6F
 00072C68    mov         byte ptr [ebx+132],0
 00072C6F    mov         edx,dword ptr [ebx+58]
 00072C72    mov         eax,dword ptr [ebx+114]
 00072C78    call        TCanvas.SetFont
 00072C7D    mov         eax,dword ptr [ebx+3C]
 00072C80    push        eax
 00072C81    lea         eax,[ebp-18]
 00072C84    push        eax
 00072C85    mov         ecx,dword ptr [ebx+38]
 00072C88    xor         edx,edx
 00072C8A    xor         eax,eax
 00072C8C    call        Rect
 00072C91    cmp         byte ptr [ebx+130],0
>00072C98    jne         00072CCE
 00072C9A    mov         esi,2010
 00072C9F    mov         al,byte ptr [ebx+132]
 00072CA5    add         al,0FE
 00072CA7    sub         al,2
>00072CA9    jae         00072CB1
 00072CAB    or          esi,200
 00072CB1    push        esi
 00072CB2    push        4
 00072CB4    lea         eax,[ebp-18]
 00072CB7    push        eax
 00072CB8    mov         eax,dword ptr [ebx+114]
 00072CBE    call        TCanvas.GetHandle
 00072CC3    push        eax
 00072CC4    call        user32.DrawFrameControl
>00072CC9    jmp         00072D69
 00072CCE    mov         al,byte ptr [ebx+132]
 00072CD4    add         al,0FE
 00072CD6    sub         al,2
>00072CD8    jb          00072CF2
 00072CDA    cmp         byte ptr [ebx+131],0
>00072CE1    je          00072CEC
 00072CE3    cmp         byte ptr [ebx+132],1
>00072CEA    jne         00072CF2
 00072CEC    test        byte ptr [ebx+20],10
>00072CF0    je          00072D34
 00072CF2    xor         eax,eax
 00072CF4    mov         al,byte ptr [ebx+128]
 00072CFA    mov         eax,dword ptr [eax*4+0B4DAC]
 00072D01    or          eax,0F
 00072D04    push        eax
 00072D05    mov         al,byte ptr [ebx+132]
 00072D0B    add         al,0FE
 00072D0D    sub         al,2
 00072D0F    setb        al
 00072D12    and         eax,7F
 00072D15    mov         eax,dword ptr [eax*4+0B4DA4]
 00072D1C    push        eax
 00072D1D    lea         eax,[ebp-18]
 00072D20    push        eax
 00072D21    mov         eax,dword ptr [ebx+114]
 00072D27    call        TCanvas.GetHandle
 00072D2C    push        eax
 00072D2D    call        user32.DrawEdge
>00072D32    jmp         00072D5C
 00072D34    cmp         byte ptr [ebx+128],0
>00072D3B    jne         00072D5C
 00072D3D    mov         eax,dword ptr [ebx+114]
 00072D43    mov         eax,dword ptr [eax+14]
 00072D46    mov         edx,dword ptr [ebx+64]
 00072D49    call        TBrush.SetColor
 00072D4E    lea         edx,[ebp-18]
 00072D51    mov         eax,dword ptr [ebx+114]
 00072D57    call        TCanvas.FillRect
 00072D5C    push        0FF
 00072D5E    push        0FF
 00072D60    lea         eax,[ebp-18]
 00072D63    push        eax
 00072D64    call        user32.InflateRect
 00072D69    mov         al,byte ptr [ebx+132]
 00072D6F    add         al,0FE
 00072D71    sub         al,2
>00072D73    jae         00072DCD
 00072D75    cmp         byte ptr [ebx+132],3
>00072D7C    jne         00072DBD
 00072D7E    cmp         byte ptr [ebx+130],0
>00072D85    je          00072D90
 00072D87    cmp         byte ptr [ebx+131],0
>00072D8E    jne         00072DBD
 00072D90    mov         edx,80000014
 00072D95    mov         eax,8000000F
 00072D9A    call        AllocPatternBitmap
 00072D9F    mov         edx,eax
 00072DA1    mov         eax,dword ptr [ebx+114]
 00072DA7    mov         eax,dword ptr [eax+14]
 00072DAA    call        TBrush.SetBitmap
 00072DAF    lea         edx,[ebp-18]
 00072DB2    mov         eax,dword ptr [ebx+114]
 00072DB8    call        TCanvas.FillRect
 00072DBD    mov         dword ptr [ebp-8],1
 00072DC4    mov         dword ptr [ebp-4],1
>00072DCB    jmp         00072DD7
 00072DCD    xor         eax,eax
 00072DCF    mov         dword ptr [ebp-8],eax
 00072DD2    xor         eax,eax
 00072DD4    mov         dword ptr [ebp-4],eax
 00072DD7    lea         eax,[ebp-8]
 00072DDA    push        eax
 00072DDB    lea         edx,[ebp-2C]
 00072DDE    mov         eax,ebx
 00072DE0    call        TControl.GetText
 00072DE5    mov         eax,dword ptr [ebp-2C]
 00072DE8    push        eax
 00072DE9    mov         al,byte ptr [ebx+123]
 00072DEF    push        eax
 00072DF0    mov         eax,dword ptr [ebx+12C]
 00072DF6    push        eax
 00072DF7    mov         eax,dword ptr [ebx+124]
 00072DFD    push        eax
 00072DFE    mov         al,byte ptr [ebx+132]
 00072E04    push        eax
 00072E05    mov         al,byte ptr [ebx+128]
 00072E0B    push        eax
 00072E0C    xor         edx,edx
 00072E0E    mov         eax,ebx
 00072E10    call        TControl.DrawTextBiDiModeFlags
 00072E15    push        eax
 00072E16    lea         eax,[ebp-28]
 00072E19    push        eax
 00072E1A    lea         ecx,[ebp-18]
 00072E1D    mov         edx,dword ptr [ebx+114]
 00072E23    mov         eax,dword ptr [ebx+11C]
 00072E29    call        TButtonGlyph.Draw
 00072E2E    xor         eax,eax
 00072E30    pop         edx
 00072E31    pop         ecx
 00072E32    pop         ecx
 00072E33    mov         dword ptr fs:[eax],edx
 00072E36    push        72E4B
 00072E3B    lea         eax,[ebp-2C]
 00072E3E    call        @LStrClr
 00072E43    ret
>00072E44    jmp         @HandleFinally
>00072E49    jmp         00072E3B
 00072E4B    pop         esi
 00072E4C    pop         ebx
 00072E4D    mov         esp,ebp
 00072E4F    pop         ebp
 00072E50    ret
*}
end;

//00072E54
procedure TSpeedButton.UpdateTracking;
begin
{*
 00072E54    push        ebx
 00072E55    push        esi
 00072E56    add         esp,0FFFFFFF8
 00072E59    mov         esi,eax
 00072E5B    cmp         byte ptr [esi+130],0
>00072E62    je          00072EB2
 00072E64    mov         eax,esi
 00072E66    mov         edx,dword ptr [eax]
 00072E68    call        dword ptr [edx+50]
 00072E6B    test        al,al
>00072E6D    je          00072EB2
 00072E6F    push        esp
 00072E70    call        user32.GetCursorPos
 00072E75    mov         eax,esp
 00072E77    mov         dl,1
 00072E79    call        FindDragTarget
 00072E7E    cmp         esi,eax
 00072E80    sete        bl
 00072E83    xor         bl,1
 00072E86    mov         byte ptr [esi+131],bl
 00072E8C    test        bl,bl
>00072E8E    je          00072EA2
 00072E90    push        0
 00072E92    xor         ecx,ecx
 00072E94    mov         edx,0B014
 00072E99    mov         eax,esi
 00072E9B    call        TControl.Perform
>00072EA0    jmp         00072EB2
 00072EA2    push        0
 00072EA4    xor         ecx,ecx
 00072EA6    mov         edx,0B013
 00072EAB    mov         eax,esi
 00072EAD    call        TControl.Perform
 00072EB2    pop         ecx
 00072EB3    pop         edx
 00072EB4    pop         esi
 00072EB5    pop         ebx
 00072EB6    ret
*}
end;

//00072EB8
procedure TSpeedButton.Loaded;
begin
{*
 00072EB8    push        ebx
 00072EB9    mov         ebx,eax
 00072EBB    mov         eax,ebx
 00072EBD    call        TControl.Loaded
 00072EC2    mov         eax,ebx
 00072EC4    mov         edx,dword ptr [eax]
 00072EC6    call        dword ptr [edx+50]
 00072EC9    test        al,al
>00072ECB    je          00072ED1
 00072ECD    xor         eax,eax
>00072ECF    jmp         00072ED3
 00072ED1    mov         al,1
 00072ED3    mov         edx,eax
 00072ED5    mov         eax,dword ptr [ebx+11C]
 00072EDB    call        TButtonGlyph.CreateButtonGlyph
 00072EE0    pop         ebx
 00072EE1    ret
*}
end;

//00072EE4
procedure TSpeedButton.MouseDown(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);
begin
{*
 00072EE4    push        ebp
 00072EE5    mov         ebp,esp
 00072EE7    push        ecx
 00072EE8    push        ebx
 00072EE9    push        esi
 00072EEA    mov         byte ptr [ebp-1],cl
 00072EED    mov         ebx,edx
 00072EEF    mov         esi,eax
 00072EF1    mov         eax,dword ptr [ebp+0C]
 00072EF4    push        eax
 00072EF5    mov         eax,dword ptr [ebp+8]
 00072EF8    push        eax
 00072EF9    mov         cl,byte ptr [ebp-1]
 00072EFC    mov         edx,ebx
 00072EFE    mov         eax,esi
 00072F00    call        TControl.MouseDown
 00072F05    test        bl,bl
>00072F07    jne         00072F32
 00072F09    mov         eax,esi
 00072F0B    mov         edx,dword ptr [eax]
 00072F0D    call        dword ptr [edx+50]
 00072F10    test        al,al
>00072F12    je          00072F32
 00072F14    cmp         byte ptr [esi+120],0
>00072F1B    jne         00072F2B
 00072F1D    mov         byte ptr [esi+132],2
 00072F24    mov         eax,esi
 00072F26    mov         edx,dword ptr [eax]
 00072F28    call        dword ptr [edx+78]
 00072F2B    mov         byte ptr [esi+121],1
 00072F32    pop         esi
 00072F33    pop         ebx
 00072F34    pop         ecx
 00072F35    pop         ebp
 00072F36    ret         8
*}
end;

//00072F3C
procedure TSpeedButton.MouseMove(Shift:TShiftState; X:Integer; Y:Integer);
begin
{*
 00072F3C    push        ebp
 00072F3D    mov         ebp,esp
 00072F3F    push        ecx
 00072F40    push        ebx
 00072F41    push        esi
 00072F42    push        edi
 00072F43    mov         esi,ecx
 00072F45    mov         byte ptr [ebp-1],dl
 00072F48    mov         ebx,eax
 00072F4A    mov         edi,dword ptr [ebp+8]
 00072F4D    push        edi
 00072F4E    mov         ecx,esi
 00072F50    mov         dl,byte ptr [ebp-1]
 00072F53    mov         eax,ebx
 00072F55    call        TControl.MouseMove
 00072F5A    cmp         byte ptr [ebx+121],0
>00072F61    je          00072FC4
 00072F63    cmp         byte ptr [ebx+120],0
>00072F6A    jne         00072F72
 00072F6C    mov         byte ptr [ebp-2],0
>00072F70    jmp         00072F76
 00072F72    mov         byte ptr [ebp-2],3
 00072F76    test        esi,esi
>00072F78    jl          00072FA7
 00072F7A    mov         eax,ebx
 00072F7C    call        TControl.GetClientWidth
 00072F81    cmp         esi,eax
>00072F83    jge         00072FA7
 00072F85    test        edi,edi
>00072F87    jl          00072FA7
 00072F89    mov         eax,ebx
 00072F8B    call        TControl.GetClientHeight
 00072F90    cmp         edi,eax
>00072F92    jg          00072FA7
 00072F94    cmp         byte ptr [ebx+120],0
>00072F9B    je          00072FA3
 00072F9D    mov         byte ptr [ebp-2],3
>00072FA1    jmp         00072FA7
 00072FA3    mov         byte ptr [ebp-2],2
 00072FA7    mov         al,byte ptr [ebp-2]
 00072FAA    cmp         al,byte ptr [ebx+132]
>00072FB0    je          00072FD4
 00072FB2    mov         al,byte ptr [ebp-2]
 00072FB5    mov         byte ptr [ebx+132],al
 00072FBB    mov         eax,ebx
 00072FBD    mov         edx,dword ptr [eax]
 00072FBF    call        dword ptr [edx+78]
>00072FC2    jmp         00072FD4
 00072FC4    cmp         byte ptr [ebx+131],0
>00072FCB    jne         00072FD4
 00072FCD    mov         eax,ebx
 00072FCF    call        TSpeedButton.UpdateTracking
 00072FD4    pop         edi
 00072FD5    pop         esi
 00072FD6    pop         ebx
 00072FD7    pop         ecx
 00072FD8    pop         ebp
 00072FD9    ret         4
*}
end;

//00072FDC
procedure TSpeedButton.MouseUp(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);
begin
{*
 00072FDC    push        ebp
 00072FDD    mov         ebp,esp
 00072FDF    push        ecx
 00072FE0    push        ebx
 00072FE1    push        esi
 00072FE2    push        edi
 00072FE3    mov         byte ptr [ebp-2],cl
 00072FE6    mov         byte ptr [ebp-1],dl
 00072FE9    mov         esi,eax
 00072FEB    mov         edi,dword ptr [ebp+8]
 00072FEE    mov         ebx,dword ptr [ebp+0C]
 00072FF1    push        ebx
 00072FF2    push        edi
 00072FF3    mov         cl,byte ptr [ebp-2]
 00072FF6    mov         dl,byte ptr [ebp-1]
 00072FF9    mov         eax,esi
 00072FFB    call        TControl.MouseUp
 00073000    cmp         byte ptr [esi+121],0
>00073007    je          000730BD
 0007300D    mov         byte ptr [esi+121],0
 00073014    test        ebx,ebx
>00073016    jl          00073032
 00073018    mov         eax,esi
 0007301A    call        TControl.GetClientWidth
 0007301F    cmp         ebx,eax
>00073021    jge         00073032
 00073023    test        edi,edi
>00073025    jl          00073032
 00073027    mov         eax,esi
 00073029    call        TControl.GetClientHeight
 0007302E    cmp         edi,eax
>00073030    jle         00073036
 00073032    xor         eax,eax
>00073034    jmp         00073038
 00073036    mov         al,1
 00073038    mov         ebx,eax
 0007303A    cmp         dword ptr [esi+118],0
>00073041    jne         0007306A
 00073043    mov         byte ptr [esi+132],0
 0007304A    mov         byte ptr [esi+131],0
 00073051    test        bl,bl
>00073053    je          000730A7
 00073055    mov         al,byte ptr [esi+132]
 0007305B    add         al,0FE
 0007305D    sub         al,2
>0007305F    jb          000730A7
 00073061    mov         eax,esi
 00073063    mov         edx,dword ptr [eax]
 00073065    call        dword ptr [edx+78]
>00073068    jmp         000730A7
 0007306A    test        bl,bl
>0007306C    je          00073090
 0007306E    mov         dl,byte ptr [esi+120]
 00073074    xor         dl,1
 00073077    mov         eax,esi
 00073079    call        TSpeedButton.SetDown
 0007307E    cmp         byte ptr [esi+120],0
>00073085    je          000730A7
 00073087    mov         eax,esi
 00073089    mov         edx,dword ptr [eax]
 0007308B    call        dword ptr [edx+7C]
>0007308E    jmp         000730A7
 00073090    cmp         byte ptr [esi+120],0
>00073097    je          000730A0
 00073099    mov         byte ptr [esi+132],3
 000730A0    mov         eax,esi
 000730A2    mov         edx,dword ptr [eax]
 000730A4    call        dword ptr [edx+7C]
 000730A7    test        bl,bl
>000730A9    je          000730B6
 000730AB    mov         eax,esi
 000730AD    mov         bx,0FFEC
 000730B1    call        @CallDynaInst
 000730B6    mov         eax,esi
 000730B8    call        TSpeedButton.UpdateTracking
 000730BD    pop         edi
 000730BE    pop         esi
 000730BF    pop         ebx
 000730C0    pop         ecx
 000730C1    pop         ebp
 000730C2    ret         8
*}
end;

//000730C8
procedure TSpeedButton.Click;
begin
{*
 000730C8    call        TControl.Click
 000730CD    ret
*}
end;

//000730D0
procedure TBitBtn.GetPalette;
begin
{*
 000730D0    push        ebx
 000730D1    mov         ebx,eax
 000730D3    mov         eax,ebx
 000730D5    call        TBitBtn.GetGlyph
 000730DA    mov         edx,dword ptr [eax]
 000730DC    call        dword ptr [edx+24]
 000730DF    pop         ebx
 000730E0    ret
*}
end;

//000730E4
function TBitBtn.GetGlyph:TBitmap;
begin
{*
 000730E4    mov         eax,dword ptr [eax+11C]
 000730EA    mov         eax,dword ptr [eax+4]
 000730ED    ret
*}
end;

//000730F0
procedure TSpeedButton.SetGlyph(Value:TBitmap);
begin
{*
 000730F0    push        ebx
 000730F1    mov         ebx,eax
 000730F3    mov         eax,dword ptr [ebx+11C]
 000730F9    call        TButtonGlyph.SetGlyph
 000730FE    mov         eax,ebx
 00073100    mov         edx,dword ptr [eax]
 00073102    call        dword ptr [edx+78]
 00073105    pop         ebx
 00073106    ret
*}
end;

//00073108
function TSpeedButton.GetNumGlyphs:TNumGlyphs;
begin
{*
 00073108    mov         eax,dword ptr [eax+11C]
 0007310E    mov         al,byte ptr [eax+20]
 00073111    ret
*}
end;

//00073114
procedure TSpeedButton.SetNumGlyphs(Value:TNumGlyphs);
begin
{*
 00073114    push        ebx
 00073115    mov         ebx,eax
 00073117    test        dl,dl
>00073119    jae         0007311F
 0007311B    mov         dl,1
>0007311D    jmp         00073126
 0007311F    cmp         dl,4
>00073122    jbe         00073126
 00073124    mov         dl,4
 00073126    mov         eax,dword ptr [ebx+11C]
 0007312C    cmp         dl,byte ptr [eax+20]
>0007312F    je          0007313D
 00073131    call        TButtonGlyph.SetNumGlyphs
 00073136    mov         eax,ebx
 00073138    mov         edx,dword ptr [eax]
 0007313A    call        dword ptr [edx+78]
 0007313D    pop         ebx
 0007313E    ret
*}
end;

//00073140
procedure TSpeedButton.GlyphChanged(Sender:TObject);
begin
{*
 00073140    mov         edx,dword ptr [eax]
 00073142    call        dword ptr [edx+78]
 00073145    ret
*}
end;

//00073148
procedure TSpeedButton.UpdateExclusive;
begin
{*
 00073148    add         esp,0FFFFFFF0
 0007314B    mov         edx,dword ptr [eax+118]
 00073151    test        edx,edx
>00073153    je          0007317A
 00073155    cmp         dword ptr [eax+24],0
>00073159    je          0007317A
 0007315B    mov         dword ptr [esp],0B018
 00073162    mov         dword ptr [esp+4],edx
 00073166    mov         dword ptr [esp+8],eax
 0007316A    xor         edx,edx
 0007316C    mov         dword ptr [esp+0C],edx
 00073170    mov         edx,esp
 00073172    mov         eax,dword ptr [eax+24]
 00073175    call        TWinControl.Broadcast
 0007317A    add         esp,10
 0007317D    ret
*}
end;

//00073180
procedure TSpeedButton.SetDown(Value:Boolean);
begin
{*
 00073180    push        ebx
 00073181    push        esi
 00073182    mov         ebx,edx
 00073184    mov         esi,eax
 00073186    cmp         dword ptr [esi+118],0
>0007318D    jne         00073191
 0007318F    xor         ebx,ebx
 00073191    cmp         bl,byte ptr [esi+120]
>00073197    je          000731E7
 00073199    cmp         byte ptr [esi+120],0
>000731A0    je          000731AB
 000731A2    cmp         byte ptr [esi+122],0
>000731A9    je          000731E7
 000731AB    mov         byte ptr [esi+120],bl
 000731B1    test        bl,bl
>000731B3    je          000731CE
 000731B5    cmp         byte ptr [esi+132],0
>000731BC    jne         000731C5
 000731BE    mov         eax,esi
 000731C0    mov         edx,dword ptr [eax]
 000731C2    call        dword ptr [edx+78]
 000731C5    mov         byte ptr [esi+132],3
>000731CC    jmp         000731DC
 000731CE    mov         byte ptr [esi+132],0
 000731D5    mov         eax,esi
 000731D7    mov         edx,dword ptr [eax]
 000731D9    call        dword ptr [edx+7C]
 000731DC    test        bl,bl
>000731DE    je          000731E7
 000731E0    mov         eax,esi
 000731E2    call        TSpeedButton.UpdateExclusive
 000731E7    pop         esi
 000731E8    pop         ebx
 000731E9    ret
*}
end;

//000731EC
procedure TSpeedButton.SetFlat(Value:Boolean);
begin
{*
 000731EC    cmp         dl,byte ptr [eax+130]
>000731F2    je          000731FF
 000731F4    mov         byte ptr [eax+130],dl
 000731FA    mov         edx,dword ptr [eax]
 000731FC    call        dword ptr [edx+78]
 000731FF    ret
*}
end;

//00073200
procedure TSpeedButton.SetGroupIndex(Value:Integer);
begin
{*
 00073200    cmp         edx,dword ptr [eax+118]
>00073206    je          00073213
 00073208    mov         dword ptr [eax+118],edx
 0007320E    call        TSpeedButton.UpdateExclusive
 00073213    ret
*}
end;

//00073214
procedure TSpeedButton.SetLayout(Value:TButtonLayout);
begin
{*
 00073214    cmp         dl,byte ptr [eax+123]
>0007321A    je          00073227
 0007321C    mov         byte ptr [eax+123],dl
 00073222    mov         edx,dword ptr [eax]
 00073224    call        dword ptr [edx+78]
 00073227    ret
*}
end;

//00073228
procedure TSpeedButton.SetMargin(Value:Integer);
begin
{*
 00073228    cmp         edx,dword ptr [eax+12C]
>0007322E    je          00073240
 00073230    cmp         edx,0FFFFFFFF
>00073233    jl          00073240
 00073235    mov         dword ptr [eax+12C],edx
 0007323B    mov         edx,dword ptr [eax]
 0007323D    call        dword ptr [edx+78]
 00073240    ret
*}
end;

//00073244
procedure TSpeedButton.SetSpacing(Value:Integer);
begin
{*
 00073244    cmp         edx,dword ptr [eax+124]
>0007324A    je          00073257
 0007324C    mov         dword ptr [eax+124],edx
 00073252    mov         edx,dword ptr [eax]
 00073254    call        dword ptr [edx+78]
 00073257    ret
*}
end;

//00073258
procedure TSpeedButton.SetTransparent(Value:Boolean);
begin
{*
 00073258    push        ebx
 00073259    mov         ebx,eax
 0007325B    cmp         dl,byte ptr [ebx+128]
>00073261    je          0007328E
 00073263    mov         byte ptr [ebx+128],dl
 00073269    test        dl,dl
>0007326B    je          0007327C
 0007326D    mov         eax,[00073290]
 00073272    not         eax
 00073274    and         eax,dword ptr [ebx+40]
 00073277    mov         dword ptr [ebx+40],eax
>0007327A    jmp         00073287
 0007327C    mov         eax,[00073290]
 00073281    or          eax,dword ptr [ebx+40]
 00073284    mov         dword ptr [ebx+40],eax
 00073287    mov         eax,ebx
 00073289    mov         edx,dword ptr [eax]
 0007328B    call        dword ptr [edx+78]
 0007328E    pop         ebx
 0007328F    ret
*}
end;

//00073294
procedure TSpeedButton.SetAllowAllUp(Value:Boolean);
begin
{*
 00073294    cmp         dl,byte ptr [eax+122]
>0007329A    je          000732A7
 0007329C    mov         byte ptr [eax+122],dl
 000732A2    call        TSpeedButton.UpdateExclusive
 000732A7    ret
*}
end;

//000732A8
procedure TSpeedButton.WMLButtonDblClk(var Message:TWMLButtonDown);
begin
{*
 000732A8    push        ebx
 000732A9    push        esi
 000732AA    mov         esi,eax
 000732AC    mov         eax,esi
 000732AE    call        TControl.WMLButtonDblClk
 000732B3    cmp         byte ptr [esi+120],0
>000732BA    je          000732C7
 000732BC    mov         eax,esi
 000732BE    mov         bx,0FFEB
 000732C2    call        @CallDynaInst
 000732C7    pop         esi
 000732C8    pop         ebx
 000732C9    ret
*}
end;

//000732CC
procedure TSpeedButton.CMEnabledChanged(var Message:TMessage);
begin
{*
 000732CC    push        ebx
 000732CD    mov         ebx,eax
 000732CF    mov         eax,ebx
 000732D1    mov         edx,dword ptr [eax]
 000732D3    call        dword ptr [edx+50]
 000732D6    and         eax,7F
 000732D9    mov         dl,byte ptr [eax+0B4DB4]
 000732DF    mov         eax,dword ptr [ebx+11C]
 000732E5    call        TButtonGlyph.CreateButtonGlyph
 000732EA    mov         eax,ebx
 000732EC    call        TSpeedButton.UpdateTracking
 000732F1    mov         eax,ebx
 000732F3    mov         edx,dword ptr [eax]
 000732F5    call        dword ptr [edx+7C]
 000732F8    pop         ebx
 000732F9    ret
*}
end;

//000732FC
procedure TSpeedButton.CMButtonPressed(var Message:TMessage);
begin
{*
 000732FC    push        ebx
 000732FD    push        esi
 000732FE    mov         ebx,eax
 00073300    mov         eax,dword ptr [edx+4]
 00073303    cmp         eax,dword ptr [ebx+118]
>00073309    jne         00073345
 0007330B    mov         esi,dword ptr [edx+8]
 0007330E    cmp         ebx,esi
>00073310    je          00073345
 00073312    cmp         byte ptr [esi+120],0
>00073319    je          00073339
 0007331B    cmp         byte ptr [ebx+120],0
>00073322    je          00073339
 00073324    mov         byte ptr [ebx+120],0
 0007332B    mov         byte ptr [ebx+132],0
 00073332    mov         eax,ebx
 00073334    mov         edx,dword ptr [eax]
 00073336    call        dword ptr [edx+78]
 00073339    mov         al,byte ptr [esi+122]
 0007333F    mov         byte ptr [ebx+122],al
 00073345    pop         esi
 00073346    pop         ebx
 00073347    ret
*}
end;

//00073348
{*procedure TSpeedButton.CMDialogChar(?:?);
begin
 00073348    push        ebp
 00073349    mov         ebp,esp
 0007334B    push        0
 0007334D    push        ebx
 0007334E    push        esi
 0007334F    push        edi
 00073350    mov         edi,edx
 00073352    mov         esi,eax
 00073354    xor         eax,eax
 00073356    push        ebp
 00073357    push        733D2
 0007335C    push        dword ptr fs:[eax]
 0007335F    mov         dword ptr fs:[eax],esp
 00073362    lea         edx,[ebp-4]
 00073365    mov         eax,esi
 00073367    call        TControl.GetText
 0007336C    mov         edx,dword ptr [ebp-4]
 0007336F    mov         ax,word ptr [edi+4]
 00073373    call        IsAccel
 00073378    test        al,al
>0007337A    je          000733B3
 0007337C    mov         eax,esi
 0007337E    mov         edx,dword ptr [eax]
 00073380    call        dword ptr [edx+50];TGroupBox.GetEnabled
 00073383    test        al,al
>00073385    je          000733B3
 00073387    cmp         byte ptr [esi+47],0;TSpeedButton.FVisible:Boolean
>0007338B    je          000733B3
 0007338D    cmp         dword ptr [esi+24],0;TSpeedButton.FParent:TWinControl
>00073391    je          000733B3
 00073393    mov         eax,dword ptr [esi+24];TSpeedButton.FParent:TWinControl
 00073396    cmp         byte ptr [eax+16C],0;TWinControl.FShowing:Boolean
>0007339D    je          000733B3
 0007339F    mov         eax,esi
 000733A1    mov         bx,0FFEC
 000733A5    call        @CallDynaInst;TSpeedButton.Click
 000733AA    mov         dword ptr [edi+0C],1
>000733B1    jmp         000733BC
 000733B3    mov         edx,edi
 000733B5    mov         eax,esi
 000733B7    mov         ecx,dword ptr [eax]
 000733B9    call        dword ptr [ecx-10];TControl.DefaultHandler
 000733BC    xor         eax,eax
 000733BE    pop         edx
 000733BF    pop         ecx
 000733C0    pop         ecx
 000733C1    mov         dword ptr fs:[eax],edx
 000733C4    push        733D9
 000733C9    lea         eax,[ebp-4]
 000733CC    call        @LStrClr
 000733D1    ret
>000733D2    jmp         @HandleFinally
>000733D7    jmp         000733C9
 000733D9    pop         edi
 000733DA    pop         esi
 000733DB    pop         ebx
 000733DC    pop         ecx
 000733DD    pop         ebp
 000733DE    ret
end;*}

//000733E0
procedure TSpeedButton.CMFontChanged(var Message:TMessage);
begin
{*
 000733E0    mov         edx,dword ptr [eax]
 000733E2    call        dword ptr [edx+78];TControl.Invalidate
 000733E5    ret
*}
end;

//000733E8
procedure TSpeedButton.CMTextChanged;
begin
{*
 000733E8    mov         edx,dword ptr [eax]
 000733EA    call        dword ptr [edx+78];TControl.Invalidate
 000733ED    ret
*}
end;

//000733F0
procedure TSpeedButton.CMSysColorChange(var Message:TMessage);
begin
{*
 000733F0    push        ebx
 000733F1    push        esi
 000733F2    mov         ebx,eax
 000733F4    mov         esi,dword ptr [ebx+11C]
 000733FA    mov         eax,esi
 000733FC    call        TButtonGlyph.Invalidate
 00073401    mov         dl,byte ptr [ebx+132]
 00073407    mov         eax,esi
 00073409    call        TButtonGlyph.CreateButtonGlyph
 0007340E    pop         esi
 0007340F    pop         ebx
 00073410    ret
*}
end;

//00073414
procedure TSpeedButton.CMMouseEnter(var Message:TMessage);
begin
{*
 00073414    push        ebx
 00073415    mov         ebx,eax
 00073417    mov         eax,ebx
 00073419    call        TControl.CMMouseEnter
 0007341E    cmp         byte ptr [ebx+130],0
>00073425    je          00073458
 00073427    cmp         byte ptr [ebx+131],0
>0007342E    jne         00073458
 00073430    mov         eax,ebx
 00073432    mov         edx,dword ptr [eax]
 00073434    call        dword ptr [edx+50]
 00073437    test        al,al
>00073439    je          00073458
 0007343B    cmp         byte ptr [ebx+4D],1
>0007343F    je          00073458
 00073441    call        user32.GetCapture
 00073446    test        eax,eax
>00073448    jne         00073458
 0007344A    mov         byte ptr [ebx+131],1
 00073451    mov         eax,ebx
 00073453    mov         edx,dword ptr [eax]
 00073455    call        dword ptr [edx+7C]
 00073458    pop         ebx
 00073459    ret
*}
end;

//0007345C
procedure TSpeedButton.CMMouseLeave(var Message:TMessage);
begin
{*
 0007345C    push        ebx
 0007345D    mov         ebx,eax
 0007345F    mov         eax,ebx
 00073461    call        TControl.CMMouseLeave
 00073466    cmp         byte ptr [ebx+130],0
>0007346D    je          0007349A
 0007346F    cmp         byte ptr [ebx+131],0
>00073476    je          0007349A
 00073478    mov         eax,ebx
 0007347A    mov         edx,dword ptr [eax]
 0007347C    call        dword ptr [edx+50]
 0007347F    test        al,al
>00073481    je          0007349A
 00073483    cmp         byte ptr [ebx+121],0
>0007348A    jne         0007349A
 0007348C    mov         byte ptr [ebx+131],0
 00073493    mov         eax,ebx
 00073495    mov         edx,dword ptr [eax]
 00073497    call        dword ptr [edx+78]
 0007349A    pop         ebx
 0007349B    ret
*}
end;

//0007349C
procedure CopyImage(ImageList:TCustomImageList; Index:Integer);
begin
{*
 0007349C    push        ebp
 0007349D    mov         ebp,esp
 0007349F    add         esp,0FFFFFFF0
 000734A2    push        ebx
 000734A3    push        esi
 000734A4    push        edi
 000734A5    mov         edi,edx
 000734A7    mov         esi,eax
 000734A9    mov         eax,dword ptr [ebp+8]
 000734AC    mov         eax,dword ptr [eax-4]
 000734AF    call        TBitBtn.GetGlyph
 000734B4    mov         ebx,eax
 000734B6    mov         edx,dword ptr [esi+28]
 000734B9    mov         eax,ebx
 000734BB    mov         ecx,dword ptr [eax]
 000734BD    call        dword ptr [ecx+40]
 000734C0    mov         edx,dword ptr [esi+24]
 000734C3    mov         eax,ebx
 000734C5    mov         ecx,dword ptr [eax]
 000734C7    call        dword ptr [ecx+34]
 000734CA    mov         eax,ebx
 000734CC    call        TBitmap.GetCanvas
 000734D1    mov         eax,dword ptr [eax+14]
 000734D4    mov         edx,0FF00FF
 000734D9    call        TBrush.SetColor
 000734DE    mov         eax,ebx
 000734E0    mov         edx,dword ptr [eax]
 000734E2    call        dword ptr [edx+20]
 000734E5    push        eax
 000734E6    lea         eax,[ebp-10]
 000734E9    push        eax
 000734EA    mov         eax,ebx
 000734EC    mov         edx,dword ptr [eax]
 000734EE    call        dword ptr [edx+2C]
 000734F1    mov         ecx,eax
 000734F3    xor         edx,edx
 000734F5    xor         eax,eax
 000734F7    call        Rect
 000734FC    lea         eax,[ebp-10]
 000734FF    push        eax
 00073500    mov         eax,ebx
 00073502    call        TBitmap.GetCanvas
 00073507    pop         edx
 00073508    call        TCanvas.FillRect
 0007350D    push        0
 0007350F    push        edi
 00073510    push        1
 00073512    mov         eax,ebx
 00073514    call        TBitmap.GetCanvas
 00073519    mov         edx,eax
 0007351B    xor         ecx,ecx
 0007351D    mov         eax,esi
 0007351F    call        TCustomImageList.Draw
 00073524    pop         edi
 00073525    pop         esi
 00073526    pop         ebx
 00073527    mov         esp,ebp
 00073529    pop         ebp
 0007352A    ret
*}
end;

//0007352C
procedure TSpeedButton.ActionChange(Sender:TObject; CheckDefaults:Boolean);
begin
{*
 0007352C    push        ebp
 0007352D    mov         ebp,esp
 0007352F    push        ecx
 00073530    push        ebx
 00073531    push        esi
 00073532    mov         ebx,edx
 00073534    mov         dword ptr [ebp-4],eax
 00073537    mov         edx,ebx
 00073539    mov         eax,dword ptr [ebp-4]
 0007353C    call        TControl.ActionChange
 00073541    mov         eax,ebx
 00073543    mov         edx,dword ptr ds:[4D3E8];TCustomAction
 00073549    call        @IsClass
 0007354E    test        al,al
>00073550    je          0007359C
 00073552    mov         eax,dword ptr [ebp-4]
 00073555    call        TBitBtn.GetGlyph
 0007355A    mov         edx,dword ptr [eax]
 0007355C    call        dword ptr [edx+1C];TBitmap.GetEmpty
 0007355F    test        al,al
>00073561    je          0007359C
 00073563    cmp         dword ptr [ebx+44],0
>00073567    je          0007359C
 00073569    mov         eax,dword ptr [ebx+44]
 0007356C    cmp         dword ptr [eax+2C],0
>00073570    je          0007359C
 00073572    cmp         dword ptr [ebx+5C],0
>00073576    jl          0007359C
 00073578    mov         esi,ebx
 0007357A    mov         eax,dword ptr [esi+44]
 0007357D    mov         eax,dword ptr [eax+2C]
 00073580    call        TCustomImageList.GetCount
 00073585    cmp         eax,dword ptr [esi+5C]
>00073588    jle         0007359C
 0007358A    push        ebp
 0007358B    mov         eax,ebx
 0007358D    mov         edx,dword ptr [eax+5C]
 00073590    mov         eax,dword ptr [eax+44]
 00073593    mov         eax,dword ptr [eax+2C]
 00073596    call        CopyImage
 0007359B    pop         ecx
 0007359C    pop         esi
 0007359D    pop         ebx
 0007359E    pop         ecx
 0007359F    pop         ebp
 000735A0    ret
*}
end;

//000735A4
constructor TBitBtn.Create(AOwner:TComponent);
begin
{*
 000735A4    push        ebx
 000735A5    push        esi
 000735A6    push        edi
 000735A7    test        dl,dl
>000735A9    je          000735B3
 000735AB    add         esp,0FFFFFFF0
 000735AE    call        @ClassCreate
 000735B3    mov         esi,ecx
 000735B5    mov         ebx,edx
 000735B7    mov         edi,eax
 000735B9    mov         dl,1
 000735BB    mov         eax,[00071BA4];TButtonGlyph
 000735C0    call        TButtonGlyph.Create
 000735C5    mov         dword ptr [edi+1FC],eax
 000735CB    mov         eax,dword ptr [edi+1FC]
 000735D1    mov         dword ptr [eax+28],edi
 000735D4    mov         dword ptr [eax+24],73A68;TBitBtn.GlyphChanged
 000735DB    mov         ecx,esi
 000735DD    xor         edx,edx
 000735DF    mov         eax,edi
 000735E1    call        TButton.Create
 000735E6    mov         dl,1
 000735E8    mov         eax,[00028A60];TCanvas
 000735ED    call        TCanvas.Create
 000735F2    mov         dword ptr [edi+1F8],eax
 000735F8    mov         byte ptr [edi+200],0
 000735FF    mov         byte ptr [edi+201],0
 00073606    mov         byte ptr [edi+202],0
 0007360D    mov         dword ptr [edi+204],4
 00073617    mov         dword ptr [edi+208],0FFFFFFFF
 00073621    mov         eax,[00073648]
 00073626    or          eax,dword ptr [edi+40]
 00073629    mov         dword ptr [edi+40],eax
 0007362C    mov         eax,edi
 0007362E    test        bl,bl
>00073630    je          00073641
 00073632    call        @AfterConstruction
 00073637    pop         dword ptr fs:[0]
 0007363E    add         esp,0C
 00073641    mov         eax,edi
 00073643    pop         edi
 00073644    pop         esi
 00073645    pop         ebx
 00073646    ret
*}
end;

//0007364C
destructor TBitBtn.Destroy;
begin
{*
 0007364C    push        ebx
 0007364D    push        esi
 0007364E    call        @BeforeDestruction
 00073653    mov         ebx,edx
 00073655    mov         esi,eax
 00073657    mov         edx,ebx
 00073659    and         dl,0FC
 0007365C    mov         eax,esi
 0007365E    call        TWinControl.Destroy
 00073663    mov         eax,dword ptr [esi+1FC]
 00073669    call        TObject.Free
 0007366E    mov         eax,dword ptr [esi+1F8]
 00073674    call        TObject.Free
 00073679    test        bl,bl
>0007367B    jle         00073684
 0007367D    mov         eax,esi
 0007367F    call        @ClassDestroy
 00073684    pop         esi
 00073685    pop         ebx
 00073686    ret
*}
end;

//00073688
procedure TBitBtn.CreateHandle;
begin
{*
 00073688    push        ebx
 00073689    push        esi
 0007368A    mov         esi,eax
 0007368C    mov         eax,esi
 0007368E    mov         edx,dword ptr [eax]
 00073690    call        dword ptr [edx+50]
 00073693    test        al,al
>00073695    je          0007369B
 00073697    xor         ebx,ebx
>00073699    jmp         0007369D
 0007369B    mov         bl,1
 0007369D    mov         eax,esi
 0007369F    call        TWinControl.CreateHandle
 000736A4    mov         edx,ebx
 000736A6    mov         eax,dword ptr [esi+1FC]
 000736AC    call        TButtonGlyph.CreateButtonGlyph
 000736B1    pop         esi
 000736B2    pop         ebx
 000736B3    ret
*}
end;

//000736B4
procedure TBitBtn.CreateParams(var Params:TCreateParams);
begin
{*
 000736B4    push        ebx
 000736B5    mov         ebx,edx
 000736B7    mov         edx,ebx
 000736B9    call        TButton.CreateParams
 000736BE    or          dword ptr [ebx+4],0B
 000736C2    pop         ebx
 000736C3    ret
*}
end;

//000736C4
procedure TBitBtn.SetButtonStyle(ADefault:Boolean);
begin
{*
 000736C4    cmp         dl,byte ptr [eax+20C]
>000736CA    je          000736D7
 000736CC    mov         byte ptr [eax+20C],dl
 000736D2    call        TControl.Refresh
 000736D7    ret
*}
end;

//000736D8
procedure TBitBtn.Click;
begin
{*
 000736D8    push        ebx
 000736D9    mov         ebx,eax
 000736DB    mov         al,byte ptr [ebx+201]
 000736E1    sub         al,3
>000736E3    je          00073704
 000736E5    sub         al,3
>000736E7    jne         0007373B
 000736E9    mov         eax,ebx
 000736EB    call        GetParentForm
 000736F0    test        eax,eax
>000736F2    je          000736FB
 000736F4    call        TCustomForm.Close
>000736F9    jmp         00073742
 000736FB    mov         eax,ebx
 000736FD    call        TButton.Click
 00073702    pop         ebx
 00073703    ret
 00073704    mov         eax,ebx
>00073706    jmp         0007370B
 00073708    mov         eax,dword ptr [eax+24]
 0007370B    test        eax,eax
>0007370D    je          00073718
 0007370F    cmp         dword ptr [eax+144],0
>00073716    je          00073708
 00073718    test        eax,eax
>0007371A    je          00073732
 0007371C    mov         edx,dword ptr ds:[0B59E8];^Application:TApplication
 00073722    mov         edx,dword ptr [edx]
 00073724    mov         eax,dword ptr [eax+144]
 0007372A    xchg        eax,edx
 0007372B    call        TApplication.HelpContext
>00073730    jmp         00073742
 00073732    mov         eax,ebx
 00073734    call        TButton.Click
 00073739    pop         ebx
 0007373A    ret
 0007373B    mov         eax,ebx
 0007373D    call        TButton.Click
 00073742    pop         ebx
 00073743    ret
*}
end;

//00073744
procedure TBitBtn.CNMeasureItem(var Message:TWMMeasureItem);
begin
{*
 00073744    mov         edx,dword ptr [edx+8]
 00073747    mov         ecx,dword ptr [eax+38]
 0007374A    mov         dword ptr [edx+0C],ecx
 0007374D    mov         eax,dword ptr [eax+3C]
 00073750    mov         dword ptr [edx+10],eax
 00073753    ret
*}
end;

//00073754
procedure TBitBtn.CNDrawItem(var Message:TWMDrawItem);
begin
{*
 00073754    mov         edx,dword ptr [edx+8]
 00073757    call        TBitBtn.DrawItem
 0007375C    ret
*}
end;

//00073760
procedure TBitBtn.DrawItem(const DrawItemStruct:TDrawItemStruct);
begin
{*
 00073760    push        ebp
 00073761    mov         ebp,esp
 00073763    add         esp,0FFFFFFCC
 00073766    push        ebx
 00073767    push        esi
 00073768    push        edi
 00073769    xor         ecx,ecx
 0007376B    mov         dword ptr [ebp-34],ecx
 0007376E    mov         esi,edx
 00073770    mov         edi,eax
 00073772    xor         eax,eax
 00073774    push        ebp
 00073775    push        739DD
 0007377A    push        dword ptr fs:[eax]
 0007377D    mov         dword ptr fs:[eax],esp
 00073780    mov         edx,dword ptr [esi+18]
 00073783    mov         eax,dword ptr [edi+1F8]
 00073789    call        TCanvas.SetHandle
 0007378E    lea         edx,[ebp-18]
 00073791    mov         eax,edi
 00073793    mov         ecx,dword ptr [eax]
 00073795    call        dword ptr [ecx+44]
 00073798    mov         eax,dword ptr [esi+10]
 0007379B    test        al,1
 0007379D    setne       bl
 000737A0    test        al,10
 000737A2    setne       byte ptr [ebp-1]
 000737A6    mov         eax,edi
 000737A8    mov         edx,dword ptr [eax]
 000737AA    call        dword ptr [edx+50]
 000737AD    test        al,al
>000737AF    jne         000737B7
 000737B1    mov         byte ptr [ebp-2],1
>000737B5    jmp         000737C5
 000737B7    test        bl,bl
>000737B9    je          000737C1
 000737BB    mov         byte ptr [ebp-2],2
>000737BF    jmp         000737C5
 000737C1    mov         byte ptr [ebp-2],0
 000737C5    mov         dword ptr [ebp-8],2010
 000737CC    test        bl,bl
>000737CE    je          000737D7
 000737D0    or          dword ptr [ebp-8],200
 000737D7    test        byte ptr [esi+10],4
>000737DB    je          000737E4
 000737DD    or          dword ptr [ebp-8],100
 000737E4    mov         al,byte ptr [edi+20C]
 000737EA    or          al,byte ptr [ebp-1]
>000737ED    je          0007384B
 000737EF    mov         eax,dword ptr [edi+1F8]
 000737F5    mov         eax,dword ptr [eax+10]
 000737F8    mov         edx,80000006
 000737FD    call        TPen.SetColor
 00073802    mov         eax,dword ptr [edi+1F8]
 00073808    mov         eax,dword ptr [eax+10]
 0007380B    mov         edx,1
 00073810    call        TPen.SetWidth
 00073815    mov         eax,dword ptr [edi+1F8]
 0007381B    mov         eax,dword ptr [eax+14]
 0007381E    mov         dl,1
 00073820    call        TBrush.SetStyle
 00073825    mov         eax,dword ptr [ebp-10]
 00073828    push        eax
 00073829    mov         eax,dword ptr [ebp-0C]
 0007382C    push        eax
 0007382D    mov         ecx,dword ptr [ebp-14]
 00073830    mov         edx,dword ptr [ebp-18]
 00073833    mov         eax,dword ptr [edi+1F8]
 00073839    call        TCanvas.Rectangle
 0007383E    push        0FF
 00073840    push        0FF
 00073842    lea         eax,[ebp-18]
 00073845    push        eax
 00073846    call        user32.InflateRect
 0007384B    test        bl,bl
>0007384D    je          000738B0
 0007384F    mov         eax,dword ptr [edi+1F8]
 00073855    mov         eax,dword ptr [eax+10]
 00073858    mov         edx,80000010
 0007385D    call        TPen.SetColor
 00073862    mov         eax,dword ptr [edi+1F8]
 00073868    mov         eax,dword ptr [eax+10]
 0007386B    mov         edx,1
 00073870    call        TPen.SetWidth
 00073875    mov         eax,dword ptr [edi+1F8]
 0007387B    mov         eax,dword ptr [eax+14]
 0007387E    mov         edx,8000000F
 00073883    call        TBrush.SetColor
 00073888    mov         eax,dword ptr [ebp-10]
 0007388B    push        eax
 0007388C    mov         eax,dword ptr [ebp-0C]
 0007388F    push        eax
 00073890    mov         ecx,dword ptr [ebp-14]
 00073893    mov         edx,dword ptr [ebp-18]
 00073896    mov         eax,dword ptr [edi+1F8]
 0007389C    call        TCanvas.Rectangle
 000738A1    push        0FF
 000738A3    push        0FF
 000738A5    lea         eax,[ebp-18]
 000738A8    push        eax
 000738A9    call        user32.InflateRect
>000738AE    jmp         000738C3
 000738B0    mov         eax,dword ptr [ebp-8]
 000738B3    push        eax
 000738B4    push        4
 000738B6    lea         eax,[ebp-18]
 000738B9    push        eax
 000738BA    mov         eax,dword ptr [esi+18]
 000738BD    push        eax
 000738BE    call        user32.DrawFrameControl
 000738C3    cmp         byte ptr [edi+20C],0
>000738CA    je          000738E3
 000738CC    lea         edx,[ebp-18]
 000738CF    mov         eax,edi
 000738D1    mov         ecx,dword ptr [eax]
 000738D3    call        dword ptr [ecx+44]
 000738D6    push        0FF
 000738D8    push        0FF
 000738DA    lea         eax,[ebp-18]
 000738DD    push        eax
 000738DE    call        user32.InflateRect
 000738E3    mov         edx,dword ptr [edi+58]
 000738E6    mov         eax,dword ptr [edi+1F8]
 000738EC    call        TCanvas.SetFont
 000738F1    test        bl,bl
>000738F3    je          00073902
 000738F5    push        1
 000738F7    push        1
 000738F9    lea         eax,[ebp-18]
 000738FC    push        eax
 000738FD    call        user32.OffsetRect
 00073902    lea         ecx,[ebp-30]
 00073905    xor         edx,edx
 00073907    xor         eax,eax
 00073909    call        Point
 0007390E    lea         eax,[ebp-30]
 00073911    push        eax
 00073912    lea         edx,[ebp-34]
 00073915    mov         eax,edi
 00073917    call        TControl.GetText
 0007391C    mov         eax,dword ptr [ebp-34]
 0007391F    push        eax
 00073920    mov         al,byte ptr [edi+202]
 00073926    push        eax
 00073927    mov         eax,dword ptr [edi+208]
 0007392D    push        eax
 0007392E    mov         eax,dword ptr [edi+204]
 00073934    push        eax
 00073935    mov         al,byte ptr [ebp-2]
 00073938    push        eax
 00073939    push        0
 0007393B    xor         edx,edx
 0007393D    mov         eax,edi
 0007393F    call        TControl.DrawTextBiDiModeFlags
 00073944    push        eax
 00073945    lea         eax,[ebp-28]
 00073948    push        eax
 00073949    lea         ecx,[ebp-18]
 0007394C    mov         edx,dword ptr [edi+1F8]
 00073952    mov         eax,dword ptr [edi+1FC]
 00073958    call        TButtonGlyph.Draw
 0007395D    mov         al,byte ptr [edi+20C]
 00073963    and         al,byte ptr [ebp-1]
>00073966    je          000739BA
 00073968    lea         edx,[ebp-18]
 0007396B    mov         eax,edi
 0007396D    mov         ecx,dword ptr [eax]
 0007396F    call        dword ptr [ecx+44]
 00073972    push        0FC
 00073974    push        0FC
 00073976    lea         eax,[ebp-18]
 00073979    push        eax
 0007397A    call        user32.InflateRect
 0007397F    mov         eax,dword ptr [edi+1F8]
 00073985    mov         eax,dword ptr [eax+10]
 00073988    mov         edx,80000006
 0007398D    call        TPen.SetColor
 00073992    mov         eax,dword ptr [edi+1F8]
 00073998    mov         eax,dword ptr [eax+14]
 0007399B    mov         edx,8000000F
 000739A0    call        TBrush.SetColor
 000739A5    lea         eax,[ebp-18]
 000739A8    push        eax
 000739A9    mov         eax,dword ptr [edi+1F8]
 000739AF    call        TCanvas.GetHandle
 000739B4    push        eax
 000739B5    call        user32.DrawFocusRect
 000739BA    xor         edx,edx
 000739BC    mov         eax,dword ptr [edi+1F8]
 000739C2    call        TCanvas.SetHandle
 000739C7    xor         eax,eax
 000739C9    pop         edx
 000739CA    pop         ecx
 000739CB    pop         ecx
 000739CC    mov         dword ptr fs:[eax],edx
 000739CF    push        739E4
 000739D4    lea         eax,[ebp-34]
 000739D7    call        @LStrClr
 000739DC    ret
>000739DD    jmp         @HandleFinally
>000739E2    jmp         000739D4
 000739E4    pop         edi
 000739E5    pop         esi
 000739E6    pop         ebx
 000739E7    mov         esp,ebp
 000739E9    pop         ebp
 000739EA    ret
*}
end;

//000739EC
procedure TBitBtn.CMFontChanged(var Message:TMessage);
begin
{*
 000739EC    push        esi
 000739ED    mov         esi,eax
 000739EF    mov         eax,esi
 000739F1    call        TWinControl.CMFontChanged
 000739F6    mov         eax,esi
 000739F8    mov         edx,dword ptr [eax]
 000739FA    call        dword ptr [edx+78]
 000739FD    pop         esi
 000739FE    ret
*}
end;

//00073A00
procedure TBitBtn.CMEnabledChanged(var Message:TMessage);
begin
{*
 00073A00    push        esi
 00073A01    mov         esi,eax
 00073A03    mov         eax,esi
 00073A05    call        TWinControl.CMEnabledChanged
 00073A0A    mov         eax,esi
 00073A0C    mov         edx,dword ptr [eax]
 00073A0E    call        dword ptr [edx+78]
 00073A11    pop         esi
 00073A12    ret
*}
end;

//00073A14
procedure TBitBtn.WMLButtonDblClk(var Message:TWMLButtonDblClk);
begin
{*
 00073A14    mov         ecx,dword ptr [edx+8]
 00073A17    push        ecx
 00073A18    mov         ecx,dword ptr [edx+4]
 00073A1B    mov         edx,201
 00073A20    call        TControl.Perform
 00073A25    ret
*}
end;

//00073A28
procedure TSpeedButton.GetPalette;
begin
{*
 00073A28    push        ebx
 00073A29    mov         ebx,eax
 00073A2B    mov         eax,ebx
 00073A2D    call        TSpeedButton.GetGlyph
 00073A32    mov         edx,dword ptr [eax]
 00073A34    call        dword ptr [edx+24]
 00073A37    pop         ebx
 00073A38    ret
*}
end;

//00073A3C
procedure TBitBtn.SetGlyph(Value:TBitmap);
begin
{*
 00073A3C    push        ebx
 00073A3D    mov         ebx,eax
 00073A3F    mov         eax,dword ptr [ebx+1FC]
 00073A45    call        TButtonGlyph.SetGlyph
 00073A4A    mov         byte ptr [ebx+20D],1
 00073A51    mov         eax,ebx
 00073A53    mov         edx,dword ptr [eax]
 00073A55    call        dword ptr [edx+78]
 00073A58    pop         ebx
 00073A59    ret
*}
end;

//00073A5C
function TSpeedButton.GetGlyph:TBitmap;
begin
{*
 00073A5C    mov         eax,dword ptr [eax+1FC]
 00073A62    mov         eax,dword ptr [eax+4]
 00073A65    ret
*}
end;

//00073A68
procedure TBitBtn.GlyphChanged(Sender:TObject);
begin
{*
 00073A68    mov         edx,dword ptr [eax]
 00073A6A    call        dword ptr [edx+78]
 00073A6D    ret
*}
end;

//00073A70
function TBitBtn.IsCustom(Value:Boolean):Boolean;
begin
{*
 00073A70    push        ebx
 00073A71    mov         ebx,eax
 00073A73    mov         eax,ebx
 00073A75    call        TBitBtn.GetKind
 00073A7A    test        al,al
 00073A7C    sete        al
 00073A7F    pop         ebx
 00073A80    ret
*}
end;

//00073A84
procedure TBitBtn.SetStyle(Value:TButtonStyle);
begin
{*
 00073A84    cmp         dl,byte ptr [eax+200]
>00073A8A    je          00073A97
 00073A8C    mov         byte ptr [eax+200],dl
 00073A92    mov         edx,dword ptr [eax]
 00073A94    call        dword ptr [edx+78]
 00073A97    ret
*}
end;

//00073A98
procedure TBitBtn.SetKind(Value:TBitBtnKind);
begin
{*
 00073A98    push        ebp
 00073A99    mov         ebp,esp
 00073A9B    push        0
 00073A9D    push        0
 00073A9F    push        ebx
 00073AA0    push        esi
 00073AA1    push        edi
 00073AA2    mov         ebx,edx
 00073AA4    mov         esi,eax
 00073AA6    xor         eax,eax
 00073AA8    push        ebp
 00073AA9    push        73B98
 00073AAE    push        dword ptr fs:[eax]
 00073AB1    mov         dword ptr fs:[eax],esp
 00073AB4    cmp         bl,byte ptr [esi+201]
>00073ABA    je          00073B7A
 00073AC0    test        bl,bl
>00073AC2    je          00073B6D
 00073AC8    mov         eax,ebx
 00073ACA    sub         al,1
>00073ACC    je          00073AD6
 00073ACE    sub         al,3
>00073AD0    je          00073AD6
 00073AD2    xor         edx,edx
>00073AD4    jmp         00073AD8
 00073AD6    mov         dl,1
 00073AD8    mov         eax,esi
 00073ADA    call        TButton.SetDefault
 00073ADF    mov         eax,ebx
 00073AE1    sub         al,2
>00073AE3    je          00073AED
 00073AE5    sub         al,3
>00073AE7    je          00073AED
 00073AE9    xor         eax,eax
>00073AEB    jmp         00073AEF
 00073AED    mov         al,1
 00073AEF    mov         byte ptr [esi+1F1],al
 00073AF5    test        byte ptr [esi+20],1
>00073AF9    je          00073B0B
 00073AFB    lea         edx,[ebp-4]
 00073AFE    mov         eax,esi
 00073B00    call        TControl.GetText
 00073B05    cmp         dword ptr [ebp-4],0
>00073B09    je          00073B11
 00073B0B    test        byte ptr [esi+20],1
>00073B0F    jne         00073B38
 00073B11    xor         eax,eax
 00073B13    mov         al,bl
 00073B15    mov         edi,dword ptr [eax*4+0B4D44]
 00073B1C    test        edi,edi
>00073B1E    je          00073B38
 00073B20    lea         edx,[ebp-8]
 00073B23    xor         eax,eax
 00073B25    mov         al,bl
 00073B27    mov         eax,edi
 00073B29    call        LoadResString
 00073B2E    mov         edx,dword ptr [ebp-8]
 00073B31    mov         eax,esi
 00073B33    call        TControl.SetText
 00073B38    xor         eax,eax
 00073B3A    mov         al,bl
 00073B3C    mov         eax,dword ptr [eax*4+0B4D70]
 00073B43    mov         dword ptr [esi+1F4],eax
 00073B49    mov         eax,ebx
 00073B4B    call        GetBitBtnGlyph
 00073B50    mov         edx,eax
 00073B52    mov         eax,dword ptr [esi+1FC]
 00073B58    call        TButtonGlyph.SetGlyph
 00073B5D    mov         dl,2
 00073B5F    mov         eax,esi
 00073B61    call        TBitBtn.SetNumGlyphs
 00073B66    mov         byte ptr [esi+20D],0
 00073B6D    mov         byte ptr [esi+201],bl
 00073B73    mov         eax,esi
 00073B75    mov         edx,dword ptr [eax]
 00073B77    call        dword ptr [edx+78]
 00073B7A    xor         eax,eax
 00073B7C    pop         edx
 00073B7D    pop         ecx
 00073B7E    pop         ecx
 00073B7F    mov         dword ptr fs:[eax],edx
 00073B82    push        73B9F
 00073B87    lea         eax,[ebp-8]
 00073B8A    call        @LStrClr
 00073B8F    lea         eax,[ebp-4]
 00073B92    call        @LStrClr
 00073B97    ret
>00073B98    jmp         @HandleFinally
>00073B9D    jmp         00073B87
 00073B9F    pop         edi
 00073BA0    pop         esi
 00073BA1    pop         ebx
 00073BA2    pop         ecx
 00073BA3    pop         ecx
 00073BA4    pop         ebp
 00073BA5    ret
*}
end;

//00073BA8
function TBitBtn.IsCustomCaption(Value:TCaption):Boolean;
begin
{*
 00073BA8    push        ebp
 00073BA9    mov         ebp,esp
 00073BAB    push        0
 00073BAD    push        0
 00073BAF    push        ebx
 00073BB0    mov         ebx,eax
 00073BB2    xor         eax,eax
 00073BB4    push        ebp
 00073BB5    push        73C13
 00073BBA    push        dword ptr fs:[eax]
 00073BBD    mov         dword ptr fs:[eax],esp
 00073BC0    lea         edx,[ebp-4]
 00073BC3    xor         eax,eax
 00073BC5    mov         al,byte ptr [ebx+201]
 00073BCB    mov         eax,dword ptr [eax*4+0B4D44]
 00073BD2    call        LoadResString
 00073BD7    mov         eax,dword ptr [ebp-4]
 00073BDA    push        eax
 00073BDB    lea         edx,[ebp-8]
 00073BDE    mov         eax,ebx
 00073BE0    call        TControl.GetText
 00073BE5    mov         eax,dword ptr [ebp-8]
 00073BE8    pop         edx
 00073BE9    call        AnsiCompareStr
 00073BEE    test        eax,eax
 00073BF0    setne       al
 00073BF3    mov         ebx,eax
 00073BF5    xor         eax,eax
 00073BF7    pop         edx
 00073BF8    pop         ecx
 00073BF9    pop         ecx
 00073BFA    mov         dword ptr fs:[eax],edx
 00073BFD    push        73C1A
 00073C02    lea         eax,[ebp-8]
 00073C05    call        @LStrClr
 00073C0A    lea         eax,[ebp-4]
 00073C0D    call        @LStrClr
 00073C12    ret
>00073C13    jmp         @HandleFinally
>00073C18    jmp         00073C02
 00073C1A    mov         eax,ebx
 00073C1C    pop         ebx
 00073C1D    pop         ecx
 00073C1E    pop         ecx
 00073C1F    pop         ebp
 00073C20    ret
*}
end;

//00073C24
function TBitBtn.GetKind:TBitBtnKind;
begin
{*
 00073C24    cmp         byte ptr [eax+201],0
>00073C2B    je          00073C89
 00073C2D    mov         dl,byte ptr [eax+201]
 00073C33    mov         ecx,edx
 00073C35    sub         cl,1
>00073C38    je          00073C43
 00073C3A    sub         cl,3
>00073C3D    je          00073C43
 00073C3F    xor         ecx,ecx
>00073C41    jmp         00073C45
 00073C43    mov         cl,1
 00073C45    xor         cl,byte ptr [eax+1F0]
>00073C4B    jne         00073C82
 00073C4D    mov         ecx,edx
 00073C4F    sub         cl,2
>00073C52    je          00073C5D
 00073C54    sub         cl,3
>00073C57    je          00073C5D
 00073C59    xor         ecx,ecx
>00073C5B    jmp         00073C5F
 00073C5D    mov         cl,1
 00073C5F    xor         cl,byte ptr [eax+1F1]
>00073C65    jne         00073C82
 00073C67    and         edx,7F
 00073C6A    mov         edx,dword ptr [edx*4+0B4D70]
 00073C71    cmp         edx,dword ptr [eax+1F4]
>00073C77    jne         00073C82
 00073C79    cmp         byte ptr [eax+20D],0
>00073C80    je          00073C89
 00073C82    mov         byte ptr [eax+201],0
 00073C89    mov         al,byte ptr [eax+201]
 00073C8F    ret
*}
end;

//00073C90
procedure TBitBtn.SetLayout(Value:TButtonLayout);
begin
{*
 00073C90    cmp         dl,byte ptr [eax+202]
>00073C96    je          00073CA3
 00073C98    mov         byte ptr [eax+202],dl
 00073C9E    mov         edx,dword ptr [eax]
 00073CA0    call        dword ptr [edx+78]
 00073CA3    ret
*}
end;

//00073CA4
function TBitBtn.GetNumGlyphs:TNumGlyphs;
begin
{*
 00073CA4    mov         eax,dword ptr [eax+1FC]
 00073CAA    mov         al,byte ptr [eax+20]
 00073CAD    ret
*}
end;

//00073CB0
procedure TBitBtn.SetNumGlyphs(Value:TNumGlyphs);
begin
{*
 00073CB0    push        ebx
 00073CB1    mov         ebx,eax
 00073CB3    test        dl,dl
>00073CB5    jae         00073CBB
 00073CB7    mov         dl,1
>00073CB9    jmp         00073CC2
 00073CBB    cmp         dl,4
>00073CBE    jbe         00073CC2
 00073CC0    mov         dl,4
 00073CC2    mov         eax,dword ptr [ebx+1FC]
 00073CC8    cmp         dl,byte ptr [eax+20]
>00073CCB    je          00073CD9
 00073CCD    call        TButtonGlyph.SetNumGlyphs
 00073CD2    mov         eax,ebx
 00073CD4    mov         edx,dword ptr [eax]
 00073CD6    call        dword ptr [edx+78]
 00073CD9    pop         ebx
 00073CDA    ret
*}
end;

//00073CDC
procedure TBitBtn.SetSpacing(Value:Integer);
begin
{*
 00073CDC    cmp         edx,dword ptr [eax+204]
>00073CE2    je          00073CEF
 00073CE4    mov         dword ptr [eax+204],edx
 00073CEA    mov         edx,dword ptr [eax]
 00073CEC    call        dword ptr [edx+78]
 00073CEF    ret
*}
end;

//00073CF0
procedure TBitBtn.SetMargin(Value:Integer);
begin
{*
 00073CF0    cmp         edx,dword ptr [eax+208]
>00073CF6    je          00073D08
 00073CF8    cmp         edx,0FFFFFFFF
>00073CFB    jl          00073D08
 00073CFD    mov         dword ptr [eax+208],edx
 00073D03    mov         edx,dword ptr [eax]
 00073D05    call        dword ptr [edx+78]
 00073D08    ret
*}
end;

//00073D0C
procedure CopyImage(ImageList:TCustomImageList; Index:Integer);
begin
{*
 00073D0C    push        ebp
 00073D0D    mov         ebp,esp
 00073D0F    add         esp,0FFFFFFF0
 00073D12    push        ebx
 00073D13    push        esi
 00073D14    push        edi
 00073D15    mov         edi,edx
 00073D17    mov         esi,eax
 00073D19    mov         eax,dword ptr [ebp+8]
 00073D1C    mov         eax,dword ptr [eax-4]
 00073D1F    call        TSpeedButton.GetGlyph
 00073D24    mov         ebx,eax
 00073D26    mov         edx,dword ptr [esi+28]
 00073D29    mov         eax,ebx
 00073D2B    mov         ecx,dword ptr [eax]
 00073D2D    call        dword ptr [ecx+40]
 00073D30    mov         edx,dword ptr [esi+24]
 00073D33    mov         eax,ebx
 00073D35    mov         ecx,dword ptr [eax]
 00073D37    call        dword ptr [ecx+34]
 00073D3A    mov         eax,ebx
 00073D3C    call        TBitmap.GetCanvas
 00073D41    mov         eax,dword ptr [eax+14]
 00073D44    mov         edx,0FF00FF
 00073D49    call        TBrush.SetColor
 00073D4E    mov         eax,ebx
 00073D50    mov         edx,dword ptr [eax]
 00073D52    call        dword ptr [edx+20]
 00073D55    push        eax
 00073D56    lea         eax,[ebp-10]
 00073D59    push        eax
 00073D5A    mov         eax,ebx
 00073D5C    mov         edx,dword ptr [eax]
 00073D5E    call        dword ptr [edx+2C]
 00073D61    mov         ecx,eax
 00073D63    xor         edx,edx
 00073D65    xor         eax,eax
 00073D67    call        Rect
 00073D6C    lea         eax,[ebp-10]
 00073D6F    push        eax
 00073D70    mov         eax,ebx
 00073D72    call        TBitmap.GetCanvas
 00073D77    pop         edx
 00073D78    call        TCanvas.FillRect
 00073D7D    push        0
 00073D7F    push        edi
 00073D80    push        1
 00073D82    mov         eax,ebx
 00073D84    call        TBitmap.GetCanvas
 00073D89    mov         edx,eax
 00073D8B    xor         ecx,ecx
 00073D8D    mov         eax,esi
 00073D8F    call        TCustomImageList.Draw
 00073D94    pop         edi
 00073D95    pop         esi
 00073D96    pop         ebx
 00073D97    mov         esp,ebp
 00073D99    pop         ebp
 00073D9A    ret
*}
end;

//00073D9C
procedure TBitBtn.ActionChange(Sender:TObject; CheckDefaults:Boolean);
begin
{*
 00073D9C    push        ebp
 00073D9D    mov         ebp,esp
 00073D9F    push        ecx
 00073DA0    push        ebx
 00073DA1    push        esi
 00073DA2    mov         ebx,edx
 00073DA4    mov         dword ptr [ebp-4],eax
 00073DA7    mov         edx,ebx
 00073DA9    mov         eax,dword ptr [ebp-4]
 00073DAC    call        TButtonControl.ActionChange
 00073DB1    mov         eax,ebx
 00073DB3    mov         edx,dword ptr ds:[4D3E8];TCustomAction
 00073DB9    call        @IsClass
 00073DBE    test        al,al
>00073DC0    je          00073E0C
 00073DC2    mov         eax,dword ptr [ebp-4]
 00073DC5    call        TSpeedButton.GetGlyph
 00073DCA    mov         edx,dword ptr [eax]
 00073DCC    call        dword ptr [edx+1C];TBitmap.GetEmpty
 00073DCF    test        al,al
>00073DD1    je          00073E0C
 00073DD3    cmp         dword ptr [ebx+44],0
>00073DD7    je          00073E0C
 00073DD9    mov         eax,dword ptr [ebx+44]
 00073DDC    cmp         dword ptr [eax+2C],0
>00073DE0    je          00073E0C
 00073DE2    cmp         dword ptr [ebx+5C],0
>00073DE6    jl          00073E0C
 00073DE8    mov         esi,ebx
 00073DEA    mov         eax,dword ptr [esi+44]
 00073DED    mov         eax,dword ptr [eax+2C]
 00073DF0    call        TCustomImageList.GetCount
 00073DF5    cmp         eax,dword ptr [esi+5C]
>00073DF8    jle         00073E0C
 00073DFA    push        ebp
 00073DFB    mov         eax,ebx
 00073DFD    mov         edx,dword ptr [eax+5C]
 00073E00    mov         eax,dword ptr [eax+44]
 00073E03    mov         eax,dword ptr [eax+2C]
 00073E06    call        CopyImage
 00073E0B    pop         ecx
 00073E0C    pop         esi
 00073E0D    pop         ebx
 00073E0E    pop         ecx
 00073E0F    pop         ebp
 00073E10    ret
*}
end;

//00073E14
procedure DestroyLocals;
begin
{*
 00073E14    push        ebx
 00073E15    push        esi
 00073E16    mov         bl,0B
 00073E18    mov         esi,0B6858
 00073E1D    mov         eax,dword ptr [esi]
 00073E1F    call        TObject.Free
 00073E24    add         esi,4
 00073E27    dec         bl
>00073E29    jne         00073E1D
 00073E2B    pop         esi
 00073E2C    pop         ebx
 00073E2D    ret
*}
end;

//00073E30
procedure _NF__309;
begin
{*
 00073E30    or          al,byte ptr [eax]
 00073E32    add         byte ptr [eax],al
 00073E34    ins         byte ptr [edi],dl
 00073E35    dec         ebp
 00073E36    or          eax,dword ptr [eax]
 00073E38    mov         word ptr [eax+0B],ds
 00073E3B    add         byte ptr [eax],al
 00073E3D    add         byte ptr [eax],al
 00073E3F    add         byte ptr [eax+4D],ch
 00073E42    or          eax,dword ptr [eax]
 00073E44    in          al,dl
 00073E45    push        esi
 00073E46    or          eax,dword ptr [eax]
 00073E48    add         byte ptr [eax],al
 00073E4A    add         byte ptr [eax],al
 00073E4C    dec         ebp
 00073E4E    or          eax,dword ptr [eax]
 00073E50    pop         eax
 00073E51    push        esi
 00073E52    or          eax,dword ptr [eax]
 00073E54    add         byte ptr [eax],al
 00073E56    add         byte ptr [eax],al
 00073E58    pushad
 00073E59    dec         ebp
 00073E5A    or          eax,dword ptr [eax]
 00073E5C    rcl         byte ptr [edi+0B],0
 00073E60    add         byte ptr [eax],al
 00073E62    add         byte ptr [eax],al
 00073E64    pop         esp
 00073E65    dec         ebp
 00073E66    or          eax,dword ptr [eax]
 00073E68    rcr         byte ptr [eax+0B],1
 00073E6B    add         byte ptr [eax],al
 00073E6D    add         byte ptr [eax],al
 00073E6F    add         byte ptr [eax+4D],bl
 00073E72    or          eax,dword ptr [eax]
 00073E74    mov         al,5B
 00073E76    or          eax,dword ptr [eax]
 00073E78    add         byte ptr [eax],al
 00073E7A    add         byte ptr [eax],al
 00073E7C    push        esp
 00073E7D    dec         ebp
 00073E7E    or          eax,dword ptr [eax]
 00073E80    adc         al,59
 00073E82    or          eax,dword ptr [eax]
 00073E84    add         byte ptr [eax],al
 00073E86    add         byte ptr [eax],al
 00073E88    push        eax
 00073E89    dec         ebp
 00073E8A    or          eax,dword ptr [eax]
 00073E8C    ???
 00073E8D    pop         ecx
 00073E8E    or          eax,dword ptr [eax]
 00073E90    add         byte ptr [eax],al
 00073E92    add         byte ptr [eax],al
 00073E94    dec         esp
 00073E95    dec         ebp
 00073E96    or          eax,dword ptr [eax]
 00073E98    xchg        eax,esp
 00073E99    pop         ebx
 00073E9A    or          eax,dword ptr [eax]
 00073E9C    add         byte ptr [eax],al
 00073E9E    add         byte ptr [eax],al
 00073EA0    dec         eax
 00073EA1    dec         ebp
 00073EA2    or          eax,dword ptr [eax]
 00073EA4    mov         byte ptr [esi+0B],dl
 00073EA7    add         byte ptr [eax],al
 00073EA9    add         byte ptr [eax],al
 00073EAB    add         byte ptr [ebp-75],dl
*}
end;

Initialization
//00073EE4
{*
 00073EE4    sub         dword ptr ds:[0B6854],1
>00073EEB    jae         00073F08
 00073EED    mov         eax,73E30;_NF__309
 00073EF2    call        @InitImports
 00073EF7    mov         eax,0B6858
 00073EFC    xor         ecx,ecx
 00073EFE    mov         edx,2C
 00073F03    call        @FillChar
 00073F08    ret
*}
Finalization
end.