//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit Gauges;

interface

uses
  SysUtils, Classes;

type
  TGaugeKind = (gkText, gkHorizontalBar, gkVerticalBar, gkPie, gkNeedle);
  TGauge = class(TGraphicControl)
  public
    MinValue:Integer;//f118
    MaxValue:Integer;//f11C
    Progress:Integer;//f120
    Kind:TGaugeKind;//f124
    ShowText:Boolean;//f125
    BorderStyle:TBorderStyle;//f126
    ForeColor:TColor;//f128
    BackColor:TColor;//f12C
    constructor Create(AOwner:TComponent); virtual;//v2C//00078B50
    procedure Paint; virtual;//v88//00078C14
    function GetPercentDone:Longint;//00078BF0
    procedure PaintBackground(AnImage:TBitmap);//00078DBC
    procedure PaintAsText(AnImage:TBitmap; PaintRect:TRect);//00078E10
    procedure PaintAsNothing(AnImage:TBitmap; PaintRect:TRect);//00078F74
    procedure PaintAsBar(AnImage:TBitmap; PaintRect:TRect);//00078FB4
    procedure PaintAsPie(AnImage:TBitmap; PaintRect:TRect);//000790B8
    procedure PaintAsNeedle(AnImage:TBitmap; PaintRect:TRect);//00079214
    procedure SetGaugeKind(Value:TGaugeKind);//000793A0
    procedure SetShowText(Value:Boolean);//000793B4
    procedure SetBorderStyle(Value:TBorderStyle);//000793C8
    procedure SetForeColor(Value:TColor);//000793DC
    procedure SetBackColor(Value:TColor);//000793F0
    procedure SetMinValue(Value:Longint);//00079404
    procedure SetMaxValue(Value:Longint);//000794B4
    procedure SetProgress(Value:Longint);//00079564
  end;
  TBltBitmap = class(TBitmap)
  published
    procedure MakeLike(ATemplate:TBitmap);//00078A5C
  end;
    function SolveForX(Y:Longint; Z:Longint):Longint;//00078AE0
    function SolveForY(X:Longint; Z:Longint):Longint;//00078B18
    constructor Create(AOwner:TComponent);//00078B50
    procedure Paint;//00078C14

implementation

//00078A5C
procedure TBltBitmap.MakeLike(ATemplate:TBitmap);
begin
{*
 00078A5C    push        ebx
 00078A5D    push        esi
 00078A5E    add         esp,0FFFFFFF0
 00078A61    mov         esi,edx
 00078A63    mov         ebx,eax
 00078A65    mov         eax,esi
 00078A67    mov         edx,dword ptr [eax]
 00078A69    call        dword ptr [edx+2C]
 00078A6C    mov         edx,eax
 00078A6E    mov         eax,ebx
 00078A70    mov         ecx,dword ptr [eax]
 00078A72    call        dword ptr [ecx+40]
 00078A75    mov         eax,esi
 00078A77    mov         edx,dword ptr [eax]
 00078A79    call        dword ptr [edx+20]
 00078A7C    mov         edx,eax
 00078A7E    mov         eax,ebx
 00078A80    mov         ecx,dword ptr [eax]
 00078A82    call        dword ptr [ecx+34]
 00078A85    mov         eax,ebx
 00078A87    call        TBitmap.GetCanvas
 00078A8C    mov         eax,dword ptr [eax+14]
 00078A8F    mov         edx,80000006
 00078A94    call        TBrush.SetColor
 00078A99    mov         eax,ebx
 00078A9B    call        TBitmap.GetCanvas
 00078AA0    mov         eax,dword ptr [eax+14]
 00078AA3    xor         edx,edx
 00078AA5    call        TBrush.SetStyle
 00078AAA    mov         eax,ebx
 00078AAC    mov         edx,dword ptr [eax]
 00078AAE    call        dword ptr [edx+20]
 00078AB1    push        eax
 00078AB2    lea         eax,[esp+4]
 00078AB6    push        eax
 00078AB7    mov         eax,ebx
 00078AB9    mov         edx,dword ptr [eax]
 00078ABB    call        dword ptr [edx+2C]
 00078ABE    mov         ecx,eax
 00078AC0    xor         edx,edx
 00078AC2    xor         eax,eax
 00078AC4    call        Rect
 00078AC9    push        esp
 00078ACA    mov         eax,ebx
 00078ACC    call        TBitmap.GetCanvas
 00078AD1    pop         edx
 00078AD2    call        TCanvas.FillRect
 00078AD7    add         esp,10
 00078ADA    pop         esi
 00078ADB    pop         ebx
 00078ADC    ret
*}
end;

//00078AE0
function SolveForX(Y:Longint; Z:Longint):Longint;
begin
{*
 00078AE0    push        ebx
 00078AE1    push        esi
 00078AE2    add         esp,0FFFFFFF8
 00078AE5    mov         esi,edx
 00078AE7    mov         ebx,eax
 00078AE9    mov         dword ptr [esp],esi
 00078AEC    fild        dword ptr [esp]
 00078AEF    mov         dword ptr [esp+4],ebx
 00078AF3    fild        dword ptr [esp+4]
 00078AF7    fld         tbyte ptr ds:[78B0C]
 00078AFD    fmulp       st(1),st
 00078AFF    fmulp       st(1),st
 00078B01    call        @TRUNC
 00078B06    pop         ecx
 00078B07    pop         edx
 00078B08    pop         esi
 00078B09    pop         ebx
 00078B0A    ret
*}
end;

//00078B18
function SolveForY(X:Longint; Z:Longint):Longint;
begin
{*
 00078B18    push        ebx
 00078B19    push        esi
 00078B1A    add         esp,0FFFFFFF8
 00078B1D    mov         ebx,edx
 00078B1F    mov         esi,eax
 00078B21    test        ebx,ebx
>00078B23    jne         00078B29
 00078B25    xor         eax,eax
>00078B27    jmp         00078B44
 00078B29    mov         dword ptr [esp],esi
 00078B2C    fild        dword ptr [esp]
 00078B2F    fmul        dword ptr ds:[78B4C]
 00078B35    mov         dword ptr [esp+4],ebx
 00078B39    fild        dword ptr [esp+4]
 00078B3D    fdivp       st(1),st
 00078B3F    call        @TRUNC
 00078B44    pop         ecx
 00078B45    pop         edx
 00078B46    pop         esi
 00078B47    pop         ebx
 00078B48    ret
*}
end;

//00078B50
constructor TGauge.Create(AOwner:TComponent);
begin
{*
 00078B50    push        ebx
 00078B51    push        esi
 00078B52    test        dl,dl
>00078B54    je          00078B5E
 00078B56    add         esp,0FFFFFFF0
 00078B59    call        @ClassCreate
 00078B5E    mov         ebx,edx
 00078B60    mov         esi,eax
 00078B62    xor         edx,edx
 00078B64    mov         eax,esi
 00078B66    call        TGraphicControl.Create
 00078B6B    mov         eax,[00078BEC]
 00078B70    or          eax,dword ptr [esi+40]
 00078B73    mov         dword ptr [esi+40],eax
 00078B76    xor         eax,eax
 00078B78    mov         dword ptr [esi+118],eax
 00078B7E    mov         dword ptr [esi+11C],64
 00078B88    xor         eax,eax
 00078B8A    mov         dword ptr [esi+120],eax
 00078B90    mov         byte ptr [esi+124],1
 00078B97    mov         byte ptr [esi+125],1
 00078B9E    mov         byte ptr [esi+126],1
 00078BA5    xor         eax,eax
 00078BA7    mov         dword ptr [esi+128],eax
 00078BAD    mov         dword ptr [esi+12C],0FFFFFF
 00078BB7    mov         edx,64
 00078BBC    mov         eax,esi
 00078BBE    call        TControl.SetWidth
 00078BC3    mov         edx,64
 00078BC8    mov         eax,esi
 00078BCA    call        TControl.SetHeight
 00078BCF    mov         eax,esi
 00078BD1    test        bl,bl
>00078BD3    je          00078BE4
 00078BD5    call        @AfterConstruction
 00078BDA    pop         dword ptr fs:[0]
 00078BE1    add         esp,0C
 00078BE4    mov         eax,esi
 00078BE6    pop         esi
 00078BE7    pop         ebx
 00078BE8    ret
*}
end;

//00078BF0
function TGauge.GetPercentDone:Longint;
begin
{*
 00078BF0    push        ebx
 00078BF1    mov         ecx,dword ptr [eax+120]
 00078BF7    mov         edx,dword ptr [eax+118]
 00078BFD    sub         ecx,edx
 00078BFF    mov         ebx,dword ptr [eax+11C]
 00078C05    sub         ebx,edx
 00078C07    mov         edx,ebx
 00078C09    mov         eax,ecx
 00078C0B    call        SolveForY
 00078C10    pop         ebx
 00078C11    ret
*}
end;

//00078C14
procedure TGauge.Paint;
begin
{*
 00078C14    push        ebp
 00078C15    mov         ebp,esp
 00078C17    add         esp,0FFFFFFE4
 00078C1A    mov         dword ptr [ebp-4],eax
 00078C1D    mov         dl,1
 00078C1F    mov         eax,[00028F70];TBitmap
 00078C24    call        TBitmap.Create
 00078C29    mov         dword ptr [ebp-8],eax
 00078C2C    xor         edx,edx
 00078C2E    push        ebp
 00078C2F    push        78DAE
 00078C34    push        dword ptr fs:[edx]
 00078C37    mov         dword ptr fs:[edx],esp
 00078C3A    mov         eax,dword ptr [ebp-4]
 00078C3D    mov         edx,dword ptr [eax+3C]
 00078C40    mov         eax,dword ptr [ebp-8]
 00078C43    mov         ecx,dword ptr [eax]
 00078C45    call        dword ptr [ecx+34]
 00078C48    mov         eax,dword ptr [ebp-4]
 00078C4B    mov         edx,dword ptr [eax+38]
 00078C4E    mov         eax,dword ptr [ebp-8]
 00078C51    mov         ecx,dword ptr [eax]
 00078C53    call        dword ptr [ecx+40]
 00078C56    mov         edx,dword ptr [ebp-8]
 00078C59    mov         eax,dword ptr [ebp-4]
 00078C5C    call        TGauge.PaintBackground
 00078C61    lea         edx,[ebp-1C]
 00078C64    mov         eax,dword ptr [ebp-4]
 00078C67    mov         ecx,dword ptr [eax]
 00078C69    call        dword ptr [ecx+44]
 00078C6C    mov         eax,dword ptr [ebp-4]
 00078C6F    cmp         byte ptr [eax+126],1
>00078C76    jne         00078C85
 00078C78    push        0FF
 00078C7A    push        0FF
 00078C7C    lea         eax,[ebp-1C]
 00078C7F    push        eax
 00078C80    call        user32.InflateRect
 00078C85    mov         dl,1
 00078C87    mov         eax,[00078964];TBltBitmap
 00078C8C    call        TBitmap.Create
 00078C91    mov         dword ptr [ebp-0C],eax
 00078C94    xor         eax,eax
 00078C96    push        ebp
 00078C97    push        78D72
 00078C9C    push        dword ptr fs:[eax]
 00078C9F    mov         dword ptr fs:[eax],esp
 00078CA2    mov         edx,dword ptr [ebp-8]
 00078CA5    mov         eax,dword ptr [ebp-0C]
 00078CA8    call        TBltBitmap.MakeLike
 00078CAD    mov         edx,dword ptr [ebp-0C]
 00078CB0    mov         eax,dword ptr [ebp-4]
 00078CB3    call        TGauge.PaintBackground
 00078CB8    mov         eax,dword ptr [ebp-4]
 00078CBB    mov         al,byte ptr [eax+124]
 00078CC1    sub         al,1
>00078CC3    jb          00078CD1
 00078CC5    sub         al,2
>00078CC7    jb          00078CE1
>00078CC9    je          00078CF1
 00078CCB    dec         al
>00078CCD    je          00078D01
>00078CCF    jmp         00078D0F
 00078CD1    lea         ecx,[ebp-1C]
 00078CD4    mov         edx,dword ptr [ebp-0C]
 00078CD7    mov         eax,dword ptr [ebp-4]
 00078CDA    call        TGauge.PaintAsNothing
>00078CDF    jmp         00078D0F
 00078CE1    lea         ecx,[ebp-1C]
 00078CE4    mov         edx,dword ptr [ebp-0C]
 00078CE7    mov         eax,dword ptr [ebp-4]
 00078CEA    call        TGauge.PaintAsBar
>00078CEF    jmp         00078D0F
 00078CF1    lea         ecx,[ebp-1C]
 00078CF4    mov         edx,dword ptr [ebp-0C]
 00078CF7    mov         eax,dword ptr [ebp-4]
 00078CFA    call        TGauge.PaintAsPie
>00078CFF    jmp         00078D0F
 00078D01    lea         ecx,[ebp-1C]
 00078D04    mov         edx,dword ptr [ebp-0C]
 00078D07    mov         eax,dword ptr [ebp-4]
 00078D0A    call        TGauge.PaintAsNeedle
 00078D0F    mov         eax,dword ptr [ebp-8]
 00078D12    call        TBitmap.GetCanvas
 00078D17    mov         dword ptr [eax+20],660046
 00078D1E    mov         eax,dword ptr [ebp-0C]
 00078D21    push        eax
 00078D22    mov         eax,dword ptr [ebp-8]
 00078D25    call        TBitmap.GetCanvas
 00078D2A    xor         ecx,ecx
 00078D2C    xor         edx,edx
 00078D2E    call        TCanvas.Draw
 00078D33    mov         eax,dword ptr [ebp-8]
 00078D36    call        TBitmap.GetCanvas
 00078D3B    mov         dword ptr [eax+20],0CC0020
 00078D42    mov         eax,dword ptr [ebp-4]
 00078D45    cmp         byte ptr [eax+125],0
>00078D4C    je          00078D5C
 00078D4E    lea         ecx,[ebp-1C]
 00078D51    mov         edx,dword ptr [ebp-8]
 00078D54    mov         eax,dword ptr [ebp-4]
 00078D57    call        TGauge.PaintAsText
 00078D5C    xor         eax,eax
 00078D5E    pop         edx
 00078D5F    pop         ecx
 00078D60    pop         ecx
 00078D61    mov         dword ptr fs:[eax],edx
 00078D64    push        78D79
 00078D69    mov         eax,dword ptr [ebp-0C]
 00078D6C    call        TObject.Free
 00078D71    ret
>00078D72    jmp         @HandleFinally
>00078D77    jmp         00078D69
 00078D79    mov         eax,dword ptr [ebp-4]
 00078D7C    mov         eax,dword ptr [eax+114]
 00078D82    mov         dword ptr [eax+20],0CC0020
 00078D89    mov         edx,dword ptr [ebp-8]
 00078D8C    push        edx
 00078D8D    xor         ecx,ecx
 00078D8F    xor         edx,edx
 00078D91    call        TCanvas.Draw
 00078D96    xor         eax,eax
 00078D98    pop         edx
 00078D99    pop         ecx
 00078D9A    pop         ecx
 00078D9B    mov         dword ptr fs:[eax],edx
 00078D9E    push        78DB5
 00078DA3    mov         dl,1
 00078DA5    mov         eax,dword ptr [ebp-8]
 00078DA8    mov         ecx,dword ptr [eax]
 00078DAA    call        dword ptr [ecx-4]
 00078DAD    ret
>00078DAE    jmp         @HandleFinally
>00078DB3    jmp         00078DA3
 00078DB5    mov         esp,ebp
 00078DB7    pop         ebp
 00078DB8    ret
*}
end;

//00078DBC
procedure TGauge.PaintBackground(AnImage:TBitmap);
begin
{*
 00078DBC    push        ebx
 00078DBD    push        esi
 00078DBE    push        edi
 00078DBF    add         esp,0FFFFFFF0
 00078DC2    mov         edi,edx
 00078DC4    mov         esi,eax
 00078DC6    mov         eax,edi
 00078DC8    call        TBitmap.GetCanvas
 00078DCD    mov         ebx,eax
 00078DCF    mov         dword ptr [ebx+20],42
 00078DD6    mov         eax,dword ptr [esi+3C]
 00078DD9    push        eax
 00078DDA    lea         eax,[esp+4]
 00078DDE    push        eax
 00078DDF    mov         ecx,dword ptr [esi+38]
 00078DE2    xor         edx,edx
 00078DE4    xor         eax,eax
 00078DE6    call        Rect
 00078DEB    push        esp
 00078DEC    mov         eax,edi
 00078DEE    call        TBitmap.GetCanvas
 00078DF3    mov         ecx,eax
 00078DF5    lea         edx,[esp+4]
 00078DF9    mov         eax,ebx
 00078DFB    call        TCanvas.CopyRect
 00078E00    mov         dword ptr [ebx+20],0CC0020
 00078E07    add         esp,10
 00078E0A    pop         edi
 00078E0B    pop         esi
 00078E0C    pop         ebx
 00078E0D    ret
*}
end;

//00078E10
procedure TGauge.PaintAsText(AnImage:TBitmap; PaintRect:TRect);
begin
{*
 00078E10    push        ebp
 00078E11    mov         ebp,esp
 00078E13    add         esp,0FFFFFFE0
 00078E16    push        ebx
 00078E17    push        esi
 00078E18    push        edi
 00078E19    xor         ebx,ebx
 00078E1B    mov         dword ptr [ebp-4],ebx
 00078E1E    mov         esi,ecx
 00078E20    lea         edi,[ebp-18]
 00078E23    mov         ecx,4
 00078E28    rep movs    dword ptr [edi],dword ptr [esi]
 00078E2A    mov         edi,edx
 00078E2C    mov         esi,eax
 00078E2E    xor         eax,eax
 00078E30    push        ebp
 00078E31    push        78F55
 00078E36    push        dword ptr fs:[eax]
 00078E39    mov         dword ptr fs:[eax],esp
 00078E3C    mov         dl,1
 00078E3E    mov         eax,[00078964];TBltBitmap
 00078E43    call        TBitmap.Create
 00078E48    mov         dword ptr [ebp-8],eax
 00078E4B    xor         edx,edx
 00078E4D    push        ebp
 00078E4E    push        78F38
 00078E53    push        dword ptr fs:[edx]
 00078E56    mov         dword ptr fs:[edx],esp
 00078E59    mov         edx,edi
 00078E5B    mov         eax,dword ptr [ebp-8]
 00078E5E    call        TBltBitmap.MakeLike
 00078E63    mov         edx,dword ptr [ebp-8]
 00078E66    mov         eax,esi
 00078E68    call        TGauge.PaintBackground
 00078E6D    lea         eax,[ebp-4]
 00078E70    push        eax
 00078E71    mov         eax,esi
 00078E73    call        TGauge.GetPercentDone
 00078E78    mov         dword ptr [ebp-20],eax
 00078E7B    mov         byte ptr [ebp-1C],0
 00078E7F    lea         edx,[ebp-20]
 00078E82    xor         ecx,ecx
 00078E84    mov         eax,78F6C;'%d%%'
 00078E89    call        Format
 00078E8E    mov         eax,dword ptr [ebp-8]
 00078E91    call        TBitmap.GetCanvas
 00078E96    mov         ebx,eax
 00078E98    mov         eax,dword ptr [ebx+14]
 00078E9B    mov         dl,1
 00078E9D    call        TBrush.SetStyle
 00078EA2    mov         edx,dword ptr [esi+58]
 00078EA5    mov         eax,ebx
 00078EA7    call        TCanvas.SetFont
 00078EAC    mov         eax,dword ptr [ebx+0C]
 00078EAF    mov         edx,0FFFFFF
 00078EB4    call        TFont.SetColor
 00078EB9    mov         edx,dword ptr [ebp-4]
 00078EBC    mov         eax,ebx
 00078EBE    call        TCanvas.TextWidth
 00078EC3    mov         esi,dword ptr [ebp-10]
 00078EC6    sub         esi,dword ptr [ebp-18]
 00078EC9    inc         esi
 00078ECA    sub         esi,eax
 00078ECC    sar         esi,1
>00078ECE    jns         00078ED3
 00078ED0    adc         esi,0
 00078ED3    mov         edx,dword ptr [ebp-4]
 00078ED6    mov         eax,ebx
 00078ED8    call        TCanvas.TextHeight
 00078EDD    push        eax
 00078EDE    mov         eax,dword ptr [ebp-0C]
 00078EE1    sub         eax,dword ptr [ebp-14]
 00078EE4    inc         eax
 00078EE5    pop         edx
 00078EE6    sub         eax,edx
 00078EE8    sar         eax,1
>00078EEA    jns         00078EEF
 00078EEC    adc         eax,0
 00078EEF    push        eax
 00078EF0    mov         eax,dword ptr [ebp-4]
 00078EF3    push        eax
 00078EF4    mov         ecx,esi
 00078EF6    lea         edx,[ebp-18]
 00078EF9    mov         eax,ebx
 00078EFB    call        TCanvas.TextRect
 00078F00    mov         eax,edi
 00078F02    call        TBitmap.GetCanvas
 00078F07    mov         dword ptr [eax+20],660046
 00078F0E    mov         eax,dword ptr [ebp-8]
 00078F11    push        eax
 00078F12    mov         eax,edi
 00078F14    call        TBitmap.GetCanvas
 00078F19    xor         ecx,ecx
 00078F1B    xor         edx,edx
 00078F1D    call        TCanvas.Draw
 00078F22    xor         eax,eax
 00078F24    pop         edx
 00078F25    pop         ecx
 00078F26    pop         ecx
 00078F27    mov         dword ptr fs:[eax],edx
 00078F2A    push        78F3F
 00078F2F    mov         eax,dword ptr [ebp-8]
 00078F32    call        TObject.Free
 00078F37    ret
>00078F38    jmp         @HandleFinally
>00078F3D    jmp         00078F2F
 00078F3F    xor         eax,eax
 00078F41    pop         edx
 00078F42    pop         ecx
 00078F43    pop         ecx
 00078F44    mov         dword ptr fs:[eax],edx
 00078F47    push        78F5C
 00078F4C    lea         eax,[ebp-4]
 00078F4F    call        @LStrClr
 00078F54    ret
>00078F55    jmp         @HandleFinally
>00078F5A    jmp         00078F4C
 00078F5C    pop         edi
 00078F5D    pop         esi
 00078F5E    pop         ebx
 00078F5F    mov         esp,ebp
 00078F61    pop         ebp
 00078F62    ret
*}
end;

//00078F74
procedure TGauge.PaintAsNothing(AnImage:TBitmap; PaintRect:TRect);
begin
{*
 00078F74    push        ebx
 00078F75    push        esi
 00078F76    push        edi
 00078F77    add         esp,0FFFFFFF0
 00078F7A    mov         esi,ecx
 00078F7C    lea         edi,[esp]
 00078F7F    mov         ecx,4
 00078F84    rep movs    dword ptr [edi],dword ptr [esi]
 00078F86    mov         esi,edx
 00078F88    mov         ebx,eax
 00078F8A    mov         eax,esi
 00078F8C    call        TBitmap.GetCanvas
 00078F91    mov         eax,dword ptr [eax+14]
 00078F94    mov         edx,dword ptr [ebx+12C]
 00078F9A    call        TBrush.SetColor
 00078F9F    mov         eax,esi
 00078FA1    call        TBitmap.GetCanvas
 00078FA6    mov         edx,esp
 00078FA8    call        TCanvas.FillRect
 00078FAD    add         esp,10
 00078FB0    pop         edi
 00078FB1    pop         esi
 00078FB2    pop         ebx
 00078FB3    ret
*}
end;

//00078FB4
procedure TGauge.PaintAsBar(AnImage:TBitmap; PaintRect:TRect);
begin
{*
 00078FB4    push        ebx
 00078FB5    push        esi
 00078FB6    push        edi
 00078FB7    push        ebp
 00078FB8    add         esp,0FFFFFFDC
 00078FBB    mov         esi,ecx
 00078FBD    lea         edi,[esp+4]
 00078FC1    mov         ecx,4
 00078FC6    rep movs    dword ptr [edi],dword ptr [esi]
 00078FC8    mov         dword ptr [esp],edx
 00078FCB    mov         esi,eax
 00078FCD    mov         ebp,dword ptr [esp+0C]
 00078FD1    sub         ebp,dword ptr [esp+4]
 00078FD5    inc         ebp
 00078FD6    mov         edi,dword ptr [esp+10]
 00078FDA    sub         edi,dword ptr [esp+8]
 00078FDE    inc         edi
 00078FDF    mov         eax,dword ptr [esp]
 00078FE2    call        TBitmap.GetCanvas
 00078FE7    mov         ebx,eax
 00078FE9    mov         edx,dword ptr [esi+12C]
 00078FEF    mov         eax,dword ptr [ebx+14]
 00078FF2    call        TBrush.SetColor
 00078FF7    lea         edx,[esp+4]
 00078FFB    mov         eax,ebx
 00078FFD    call        TCanvas.FillRect
 00079002    mov         edx,dword ptr [esi+128]
 00079008    mov         eax,dword ptr [ebx+10]
 0007900B    call        TPen.SetColor
 00079010    mov         edx,1
 00079015    mov         eax,dword ptr [ebx+10]
 00079018    call        TPen.SetWidth
 0007901D    mov         edx,dword ptr [esi+128]
 00079023    mov         eax,dword ptr [ebx+14]
 00079026    call        TBrush.SetColor
 0007902B    mov         al,byte ptr [esi+124]
 00079031    dec         al
>00079033    je          0007903B
 00079035    dec         al
>00079037    je          00079077
>00079039    jmp         000790AE
 0007903B    mov         eax,esi
 0007903D    call        TGauge.GetPercentDone
 00079042    mov         edx,ebp
 00079044    call        SolveForX
 00079049    mov         esi,eax
 0007904B    cmp         ebp,esi
>0007904D    jge         00079051
 0007904F    mov         esi,ebp
 00079051    test        esi,esi
>00079053    jle         000790AE
 00079055    push        edi
 00079056    lea         eax,[esp+18]
 0007905A    push        eax
 0007905B    mov         ecx,esi
 0007905D    mov         edx,dword ptr [esp+10]
 00079061    mov         eax,dword ptr [esp+0C]
 00079065    call        Rect
 0007906A    lea         edx,[esp+14]
 0007906E    mov         eax,ebx
 00079070    call        TCanvas.FillRect
>00079075    jmp         000790AE
 00079077    mov         eax,esi
 00079079    call        TGauge.GetPercentDone
 0007907E    mov         edx,edi
 00079080    call        SolveForX
 00079085    mov         esi,eax
 00079087    cmp         edi,esi
>00079089    jg          0007908E
 0007908B    mov         esi,edi
 0007908D    dec         esi
 0007908E    push        edi
 0007908F    lea         eax,[esp+18]
 00079093    push        eax
 00079094    mov         edx,edi
 00079096    sub         edx,esi
 00079098    mov         ecx,ebp
 0007909A    mov         eax,dword ptr [esp+0C]
 0007909E    call        Rect
 000790A3    lea         edx,[esp+14]
 000790A7    mov         eax,ebx
 000790A9    call        TCanvas.FillRect
 000790AE    add         esp,24
 000790B1    pop         ebp
 000790B2    pop         edi
 000790B3    pop         esi
 000790B4    pop         ebx
 000790B5    ret
*}
end;

//000790B8
procedure TGauge.PaintAsPie(AnImage:TBitmap; PaintRect:TRect);
begin
{*
 000790B8    push        ebx
 000790B9    push        esi
 000790BA    push        edi
 000790BB    push        ebp
 000790BC    add         esp,0FFFFFFD8
 000790BF    mov         esi,ecx
 000790C1    lea         edi,[esp+14]
 000790C5    mov         ecx,4
 000790CA    rep movs    dword ptr [edi],dword ptr [esi]
 000790CC    mov         dword ptr [esp],edx
 000790CF    mov         esi,eax
 000790D1    mov         edi,dword ptr [esp+1C]
 000790D5    sub         edi,dword ptr [esp+14]
 000790D9    mov         ebp,dword ptr [esp+20]
 000790DD    sub         ebp,dword ptr [esp+18]
 000790E1    cmp         byte ptr [esi+126],1
>000790E8    jne         000790EC
 000790EA    inc         edi
 000790EB    inc         ebp
 000790EC    mov         eax,dword ptr [esp]
 000790EF    call        TBitmap.GetCanvas
 000790F4    mov         ebx,eax
 000790F6    mov         edx,dword ptr [esi+64]
 000790F9    mov         eax,dword ptr [ebx+14]
 000790FC    call        TBrush.SetColor
 00079101    lea         edx,[esp+14]
 00079105    mov         eax,ebx
 00079107    call        TCanvas.FillRect
 0007910C    mov         edx,dword ptr [esi+12C]
 00079112    mov         eax,dword ptr [ebx+14]
 00079115    call        TBrush.SetColor
 0007911A    mov         edx,dword ptr [esi+128]
 00079120    mov         eax,dword ptr [ebx+10]
 00079123    call        TPen.SetColor
 00079128    mov         edx,1
 0007912D    mov         eax,dword ptr [ebx+10]
 00079130    call        TPen.SetWidth
 00079135    push        edi
 00079136    push        ebp
 00079137    mov         ecx,dword ptr [esp+20]
 0007913B    mov         edx,dword ptr [esp+1C]
 0007913F    mov         eax,ebx
 00079141    call        TCanvas.Ellipse
 00079146    mov         eax,esi
 00079148    call        TGauge.GetPercentDone
 0007914D    test        eax,eax
>0007914F    jle         000791F3
 00079155    mov         edx,dword ptr [esi+128]
 0007915B    mov         eax,dword ptr [ebx+14]
 0007915E    call        TBrush.SetColor
 00079163    mov         eax,edi
 00079165    sar         eax,1
>00079167    jns         0007916C
 00079169    adc         eax,0
 0007916C    mov         dword ptr [esp+4],eax
 00079170    mov         eax,ebp
 00079172    sar         eax,1
>00079174    jns         00079179
 00079176    adc         eax,0
 00079179    mov         dword ptr [esp+8],eax
 0007917D    mov         eax,esi
 0007917F    call        TGauge.GetPercentDone
 00079184    mov         dword ptr [esp+24],eax
 00079188    fild        dword ptr [esp+24]
 0007918C    fdiv        dword ptr ds:[791FC]
 00079192    fadd        dword ptr ds:[79200]
 00079198    fld         tbyte ptr ds:[79204]
 0007919E    fmulp       st(1),st
 000791A0    fstp        qword ptr [esp+0C]
 000791A4    wait
 000791A5    push        edi
 000791A6    push        ebp
 000791A7    fld         qword ptr [esp+14]
 000791AB    call        @COS
 000791B0    fsubr       dword ptr ds:[79210]
 000791B6    fild        dword ptr [esp+0C]
 000791BA    fmulp       st(1),st
 000791BC    call        @ROUND
 000791C1    push        eax
 000791C2    fld         qword ptr [esp+18]
 000791C6    call        @SIN
 000791CB    fsubr       dword ptr ds:[79210]
 000791D1    fild        dword ptr [esp+14]
 000791D5    fmulp       st(1),st
 000791D7    call        @ROUND
 000791DC    push        eax
 000791DD    mov         eax,dword ptr [esp+14]
 000791E1    push        eax
 000791E2    push        0
 000791E4    mov         ecx,dword ptr [esp+30]
 000791E8    mov         edx,dword ptr [esp+2C]
 000791EC    mov         eax,ebx
 000791EE    call        TCanvas.Pie
 000791F3    add         esp,28
 000791F6    pop         ebp
 000791F7    pop         edi
 000791F8    pop         esi
 000791F9    pop         ebx
 000791FA    ret
*}
end;

//00079214
procedure TGauge.PaintAsNeedle(AnImage:TBitmap; PaintRect:TRect);
begin
{*
 00079214    push        ebx
 00079215    push        esi
 00079216    push        edi
 00079217    push        ebp
 00079218    add         esp,0FFFFFFD4
 0007921B    mov         esi,ecx
 0007921D    lea         edi,[esp+14]
 00079221    mov         ecx,4
 00079226    rep movs    dword ptr [edi],dword ptr [esi]
 00079228    mov         dword ptr [esp],edx
 0007922B    mov         esi,eax
 0007922D    mov         eax,dword ptr [esp+14]
 00079231    mov         edi,eax
 00079233    mov         edx,dword ptr [esp+18]
 00079237    mov         dword ptr [esp+0C],edx
 0007923B    mov         ebp,dword ptr [esp+1C]
 0007923F    sub         ebp,eax
 00079241    mov         eax,dword ptr [esp+20]
 00079245    sub         eax,edx
 00079247    mov         dword ptr [esp+10],eax
 0007924B    cmp         byte ptr [esi+126],1
>00079252    jne         00079259
 00079254    inc         ebp
 00079255    inc         dword ptr [esp+10]
 00079259    mov         eax,dword ptr [esp]
 0007925C    call        TBitmap.GetCanvas
 00079261    mov         ebx,eax
 00079263    mov         edx,dword ptr [esi+64]
 00079266    mov         eax,dword ptr [ebx+14]
 00079269    call        TBrush.SetColor
 0007926E    lea         edx,[esp+14]
 00079272    mov         eax,ebx
 00079274    call        TCanvas.FillRect
 00079279    mov         edx,dword ptr [esi+12C]
 0007927F    mov         eax,dword ptr [ebx+14]
 00079282    call        TBrush.SetColor
 00079287    mov         edx,dword ptr [esi+128]
 0007928D    mov         eax,dword ptr [ebx+10]
 00079290    call        TPen.SetColor
 00079295    mov         edx,1
 0007929A    mov         eax,dword ptr [ebx+10]
 0007929D    call        TPen.SetWidth
 000792A2    push        ebp
 000792A3    mov         edx,dword ptr [esp+14]
 000792A7    add         edx,edx
 000792A9    dec         edx
 000792AA    push        edx
 000792AB    lea         edx,[ebp+edi]
 000792AF    push        edx
 000792B0    mov         eax,dword ptr [esp+2C]
 000792B4    dec         eax
 000792B5    push        eax
 000792B6    push        edi
 000792B7    push        eax
 000792B8    mov         ecx,dword ptr [esp+24]
 000792BC    mov         edx,edi
 000792BE    mov         eax,ebx
 000792C0    call        TCanvas.Pie
 000792C5    mov         ecx,dword ptr [esp+20]
 000792C9    mov         edx,edi
 000792CB    mov         eax,ebx
 000792CD    call        TCanvas.MoveTo
 000792D2    lea         edx,[ebp+edi]
 000792D6    mov         ecx,dword ptr [esp+20]
 000792DA    mov         eax,ebx
 000792DC    call        TCanvas.LineTo
 000792E1    mov         eax,esi
 000792E3    call        TGauge.GetPercentDone
 000792E8    test        eax,eax
>000792EA    jle         00079384
 000792F0    mov         edx,dword ptr [esi+128]
 000792F6    mov         eax,dword ptr [ebx+10]
 000792F9    call        TPen.SetColor
 000792FE    mov         edi,dword ptr [esi+38]
 00079301    sar         edi,1
>00079303    jns         00079308
 00079305    adc         edi,0
 00079308    mov         ecx,dword ptr [esp+20]
 0007930C    dec         ecx
 0007930D    mov         edx,edi
 0007930F    mov         eax,ebx
 00079311    call        TCanvas.MoveTo
 00079316    mov         eax,esi
 00079318    call        TGauge.GetPercentDone
 0007931D    mov         dword ptr [esp+24],eax
 00079321    fild        dword ptr [esp+24]
 00079325    fdiv        dword ptr ds:[7938C]
 0007932B    fld         tbyte ptr ds:[79390]
 00079331    fmulp       st(1),st
 00079333    fstp        qword ptr [esp+4]
 00079337    wait
 00079338    fld         qword ptr [esp+4]
 0007933C    call        @SIN
 00079341    fsubr       dword ptr ds:[7939C]
 00079347    mov         eax,dword ptr [esp+20]
 0007934B    dec         eax
 0007934C    mov         dword ptr [esp+24],eax
 00079350    fild        dword ptr [esp+24]
 00079354    fmulp       st(1),st
 00079356    call        @ROUND
 0007935B    push        eax
 0007935C    fld         qword ptr [esp+8]
 00079360    call        @COS
 00079365    fsubr       dword ptr ds:[7939C]
 0007936B    mov         dword ptr [esp+2C],edi
 0007936F    fild        dword ptr [esp+2C]
 00079373    fmulp       st(1),st
 00079375    call        @ROUND
 0007937A    mov         edx,eax
 0007937C    mov         eax,ebx
 0007937E    pop         ecx
 0007937F    call        TCanvas.LineTo
 00079384    add         esp,2C
 00079387    pop         ebp
 00079388    pop         edi
 00079389    pop         esi
 0007938A    pop         ebx
 0007938B    ret
*}
end;

//000793A0
procedure TGauge.SetGaugeKind(Value:TGaugeKind);
begin
{*
 000793A0    cmp         dl,byte ptr [eax+124]
>000793A6    je          000793B3
 000793A8    mov         byte ptr [eax+124],dl
 000793AE    call        TControl.Refresh
 000793B3    ret
*}
end;

//000793B4
procedure TGauge.SetShowText(Value:Boolean);
begin
{*
 000793B4    cmp         dl,byte ptr [eax+125]
>000793BA    je          000793C7
 000793BC    mov         byte ptr [eax+125],dl
 000793C2    call        TControl.Refresh
 000793C7    ret
*}
end;

//000793C8
procedure TGauge.SetBorderStyle(Value:TBorderStyle);
begin
{*
 000793C8    cmp         dl,byte ptr [eax+126]
>000793CE    je          000793DB
 000793D0    mov         byte ptr [eax+126],dl
 000793D6    call        TControl.Refresh
 000793DB    ret
*}
end;

//000793DC
procedure TGauge.SetForeColor(Value:TColor);
begin
{*
 000793DC    cmp         edx,dword ptr [eax+128]
>000793E2    je          000793EF
 000793E4    mov         dword ptr [eax+128],edx
 000793EA    call        TControl.Refresh
 000793EF    ret
*}
end;

//000793F0
procedure TGauge.SetBackColor(Value:TColor);
begin
{*
 000793F0    cmp         edx,dword ptr [eax+12C]
>000793F6    je          00079403
 000793F8    mov         dword ptr [eax+12C],edx
 000793FE    call        TControl.Refresh
 00079403    ret
*}
end;

//00079404
procedure TGauge.SetMinValue(Value:Longint);
begin
{*
 00079404    push        ebp
 00079405    mov         ebp,esp
 00079407    add         esp,0FFFFFFEC
 0007940A    push        ebx
 0007940B    xor         ecx,ecx
 0007940D    mov         dword ptr [ebp-14],ecx
 00079410    mov         ebx,eax
 00079412    xor         eax,eax
 00079414    push        ebp
 00079415    push        794A7
 0007941A    push        dword ptr fs:[eax]
 0007941D    mov         dword ptr fs:[eax],esp
 00079420    cmp         edx,dword ptr [ebx+118]
>00079426    je          00079491
 00079428    cmp         edx,dword ptr [ebx+11C]
>0007942E    jle         00079476
 00079430    test        byte ptr [ebx+20],1
>00079434    jne         00079476
 00079436    mov         dword ptr [ebp-10],80000001
 0007943D    mov         byte ptr [ebp-0C],0
 00079441    mov         eax,dword ptr [ebx+11C]
 00079447    dec         eax
 00079448    mov         dword ptr [ebp-8],eax
 0007944B    mov         byte ptr [ebp-4],0
 0007944F    lea         eax,[ebp-10]
 00079452    push        eax
 00079453    push        1
 00079455    lea         edx,[ebp-14]
 00079458    mov         eax,[000B5898];^SOutOfRange:TResStringRec
 0007945D    call        LoadResString
 00079462    mov         ecx,dword ptr [ebp-14]
 00079465    mov         dl,1
 00079467    mov         eax,[0001EE64];EInvalidOperation
 0007946C    call        Exception.CreateFmt
 00079471    call        @RaiseExcept
 00079476    mov         dword ptr [ebx+118],edx
 0007947C    cmp         edx,dword ptr [ebx+120]
>00079482    jle         0007948A
 00079484    mov         dword ptr [ebx+120],edx
 0007948A    mov         eax,ebx
 0007948C    call        TControl.Refresh
 00079491    xor         eax,eax
 00079493    pop         edx
 00079494    pop         ecx
 00079495    pop         ecx
 00079496    mov         dword ptr fs:[eax],edx
 00079499    push        794AE
 0007949E    lea         eax,[ebp-14]
 000794A1    call        @LStrClr
 000794A6    ret
>000794A7    jmp         @HandleFinally
>000794AC    jmp         0007949E
 000794AE    pop         ebx
 000794AF    mov         esp,ebp
 000794B1    pop         ebp
 000794B2    ret
*}
end;

//000794B4
procedure TGauge.SetMaxValue(Value:Longint);
begin
{*
 000794B4    push        ebp
 000794B5    mov         ebp,esp
 000794B7    add         esp,0FFFFFFEC
 000794BA    push        ebx
 000794BB    xor         ecx,ecx
 000794BD    mov         dword ptr [ebp-14],ecx
 000794C0    mov         ebx,eax
 000794C2    xor         eax,eax
 000794C4    push        ebp
 000794C5    push        79557
 000794CA    push        dword ptr fs:[eax]
 000794CD    mov         dword ptr fs:[eax],esp
 000794D0    cmp         edx,dword ptr [ebx+11C]
>000794D6    je          00079541
 000794D8    cmp         edx,dword ptr [ebx+118]
>000794DE    jge         00079526
 000794E0    test        byte ptr [ebx+20],1
>000794E4    jne         00079526
 000794E6    mov         eax,dword ptr [ebx+118]
 000794EC    inc         eax
 000794ED    mov         dword ptr [ebp-10],eax
 000794F0    mov         byte ptr [ebp-0C],0
 000794F4    mov         dword ptr [ebp-8],7FFFFFFF
 000794FB    mov         byte ptr [ebp-4],0
 000794FF    lea         eax,[ebp-10]
 00079502    push        eax
 00079503    push        1
 00079505    lea         edx,[ebp-14]
 00079508    mov         eax,[000B5898];^SOutOfRange:TResStringRec
 0007950D    call        LoadResString
 00079512    mov         ecx,dword ptr [ebp-14]
 00079515    mov         dl,1
 00079517    mov         eax,[0001EE64];EInvalidOperation
 0007951C    call        Exception.CreateFmt
 00079521    call        @RaiseExcept
 00079526    mov         dword ptr [ebx+11C],edx
 0007952C    cmp         edx,dword ptr [ebx+120]
>00079532    jge         0007953A
 00079534    mov         dword ptr [ebx+120],edx
 0007953A    mov         eax,ebx
 0007953C    call        TControl.Refresh
 00079541    xor         eax,eax
 00079543    pop         edx
 00079544    pop         ecx
 00079545    pop         ecx
 00079546    mov         dword ptr fs:[eax],edx
 00079549    push        7955E
 0007954E    lea         eax,[ebp-14]
 00079551    call        @LStrClr
 00079556    ret
>00079557    jmp         @HandleFinally
>0007955C    jmp         0007954E
 0007955E    pop         ebx
 0007955F    mov         esp,ebp
 00079561    pop         ebp
 00079562    ret
*}
end;

//00079564
procedure TGauge.SetProgress(Value:Longint);
begin
{*
 00079564    push        ebx
 00079565    push        esi
 00079566    push        edi
 00079567    mov         esi,edx
 00079569    mov         ebx,eax
 0007956B    mov         eax,ebx
 0007956D    call        TGauge.GetPercentDone
 00079572    mov         edi,eax
 00079574    mov         eax,dword ptr [ebx+118]
 0007957A    cmp         esi,eax
>0007957C    jge         00079582
 0007957E    mov         esi,eax
>00079580    jmp         0007958E
 00079582    mov         eax,dword ptr [ebx+11C]
 00079588    cmp         esi,eax
>0007958A    jle         0007958E
 0007958C    mov         esi,eax
 0007958E    cmp         esi,dword ptr [ebx+120]
>00079594    je          000795AE
 00079596    mov         dword ptr [ebx+120],esi
 0007959C    mov         eax,ebx
 0007959E    call        TGauge.GetPercentDone
 000795A3    cmp         edi,eax
>000795A5    je          000795AE
 000795A7    mov         eax,ebx
 000795A9    call        TControl.Refresh
 000795AE    pop         edi
 000795AF    pop         esi
 000795B0    pop         ebx
 000795B1    ret
*}
end;

end.