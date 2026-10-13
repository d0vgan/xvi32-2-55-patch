//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit Spin;

interface

uses
  SysUtils, Classes, Spin, Controls, ExtCtrls;

type
  TSpinButton = class(TWinControl)
  public
    FUpButton:TTimerSpeedButton;//f1EC
    FDownButton:TTimerSpeedButton;//f1F0
    FFocusedButton:TTimerSpeedButton;//f1F4
    FocusControl:TWinControl;//f1F8
    OnUpClick:TNotifyEvent;//f1FC
    OnDownClick:TNotifyEvent;//f204
    procedure Loaded; virtual;//vC//000920B4
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//00091D60
    constructor Create(AOwner:TComponent); virtual;//v2C//00091C5C
    procedure SetBounds(ALeft:Integer; ATop:Integer; AWidth:Integer; AHeight:Integer); virtual;//v80//00091DF8
    procedure WMSize(var Message:TWMSize); message WM_SIZE;//00091E3C
    procedure WMSetFocus(var Message:TWMSetFocus); message WM_SETFOCUS;//00091E9C
    procedure WMKillFocus(var Message:TWMKillFocus); message WM_KILLFOCUS;//00091EC8
    procedure WMGetDlgCode(var Message:TWMGetDlgCode); message WM_GETDLGCODE;//000920AC
    procedure KeyDown(var Key:Word; Shift:TShiftState); dynamic;//00091EF4
    function CreateButton:TTimerSpeedButton;//00091CFC
    procedure AdjustSize(var W:Integer; var H:Integer);//00091D90
    procedure BtnMouseDown(Sender:TObject; Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);//00091F60
    procedure BtnClick(Sender:TObject);//00091FEC
    procedure SetFocusBtn(Btn:TTimerSpeedButton);//00092030
    procedure GetUpGlyph;//00092108
    procedure SetUpGlyph(Value:TBitmap);//00092114
    function GetUpNumGlyphs:TNumGlyphs;//00092170
    procedure SetUpNumGlyphs(Value:TNumGlyphs);//0009217C
    procedure GetDownGlyph;//00092188
    procedure SetDownGlyph(Value:TBitmap);//00092194
    function GetDownNumGlyphs:TNumGlyphs;//000921F4
    procedure SetDownNumGlyphs(Value:TNumGlyphs);//00092200
  end;
  TSpinEdit = class(TCustomEdit)
  public
    MinValue:Integer;//f204
    MaxValue:Integer;//f208
    Increment:Integer;//f20C
    FButton:TSpinButton;//f210
    EditorEnabled:Boolean;//f214
    destructor Destroy; virtual;//00092304
    constructor Create(AOwner:TComponent); virtual;//v2C//0009220C
    procedure CreateParams(var Params:TCreateParams); virtual;//v94//00092440
    procedure CreateWnd; virtual;//v9C//0009245C
    function IsValidChar(Key:Char):Boolean; virtual;//vD8//000923B0
    procedure UpClick(Sender:TObject); virtual;//vDC//00092600
    procedure DownClick(Sender:TObject); virtual;//vE0//00092630
    procedure WMSize(var Message:TWMSize); message WM_SIZE;//000924F0
    procedure WMPaste(var Message:TWMPaste); message WM_CUT;//00092680
    procedure WMCut(var Message:TWMCut); message WM_PASTE;//00092660
    procedure CMEnter(var Message:TCMGotFocus); message CM_ENTER;//000927E4
    procedure CMExit(var Message:TCMExit); message CM_EXIT;//000926A0
    procedure KeyPress(var Key:Char); dynamic;//0009237C
    procedure KeyDown(var Key:Word; Shift:TShiftState); dynamic;//0009233C
    procedure GetChildren(Proc:TGetChildProc; Root:TComponent); dynamic;//00092334
    procedure SetEditRect;//00092470
    function GetMinHeight:Integer;//00092590
    function GetValue:Longint;//000926DC
    procedure SetValue(NewValue:Longint);//00092764
    function CheckValue(NewValue:Longint):Longint;//000927BC
  end;
  TTimerSpeedButton = class(TSpeedButton)
  public
    FRepeatTimer:TTimer;//f134
    FTimeBtnState:TTimeBtnState;//f138
    destructor Destroy; virtual;//0009280C
    procedure Paint; virtual;//v88//0009296C
    procedure MouseUp(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer); dynamic;//000928B8
    procedure MouseDown(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer); dynamic;//00092840
    procedure TimerExpired(Sender:TObject);//000928EC
  end;
    constructor Create(AOwner:TComponent);//00091C5C
    procedure Notification(AComponent:TComponent; Operation:TOperation);//00091D60
    procedure SetBounds(ALeft:Integer; ATop:Integer; AWidth:Integer; AHeight:Integer);//00091DF8
    procedure WMSize(var Message:TWMSize);//00091E3C
    procedure WMSetFocus(var Message:TWMSetFocus);//00091E9C
    procedure WMKillFocus(var Message:TWMKillFocus);//00091EC8
    procedure KeyDown(var Key:Word; Shift:TShiftState);//00091EF4
    procedure WMGetDlgCode(var Message:TWMGetDlgCode);//000920AC
    procedure Loaded;//000920B4
    constructor Create(AOwner:TComponent);//0009220C
    destructor Destroy;//00092304
    procedure GetChildren(Proc:TGetChildProc; Root:TComponent);//00092334
    procedure KeyDown(var Key:Word; Shift:TShiftState);//0009233C
    procedure KeyPress(var Key:Char);//0009237C
    function IsValidChar(Key:Char):Boolean;//000923B0
    procedure CreateParams(var Params:TCreateParams);//00092440
    procedure CreateWnd;//0009245C
    procedure WMSize(var Message:TWMSize);//000924F0
    procedure UpClick(Sender:TObject);//00092600
    procedure DownClick(Sender:TObject);//00092630
    procedure WMCut(var Message:TWMCut);//00092660
    procedure WMPaste(var Message:TWMPaste);//00092680
    procedure CMExit(var Message:TCMExit);//000926A0
    procedure CMEnter(var Message:TCMGotFocus);//000927E4
    destructor Destroy;//0009280C
    procedure MouseDown(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);//00092840
    procedure MouseUp(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);//000928B8
    procedure Paint;//0009296C

implementation

//00091C5C
constructor TSpinButton.Create(AOwner:TComponent);
begin
{*
 00091C5C    push        ebx
 00091C5D    push        esi
 00091C5E    test        dl,dl
>00091C60    je          00091C6A
 00091C62    add         esp,0FFFFFFF0
 00091C65    call        @ClassCreate
 00091C6A    mov         ebx,edx
 00091C6C    mov         esi,eax
 00091C6E    xor         edx,edx
 00091C70    mov         eax,esi
 00091C72    call        TWinControl.Create
 00091C77    mov         eax,[00091CF4]
 00091C7C    not         eax
 00091C7E    and         eax,dword ptr [esi+40]
 00091C81    or          eax,dword ptr ds:[91CF8]
 00091C87    mov         dword ptr [esi+40],eax
 00091C8A    mov         eax,esi
 00091C8C    call        TSpinButton.CreateButton
 00091C91    mov         dword ptr [esi+1EC],eax
 00091C97    mov         eax,esi
 00091C99    call        TSpinButton.CreateButton
 00091C9E    mov         dword ptr [esi+1F0],eax
 00091CA4    xor         edx,edx
 00091CA6    mov         eax,esi
 00091CA8    call        TSpinButton.SetUpGlyph
 00091CAD    xor         edx,edx
 00091CAF    mov         eax,esi
 00091CB1    call        TSpinButton.SetDownGlyph
 00091CB6    mov         edx,14
 00091CBB    mov         eax,esi
 00091CBD    call        TControl.SetWidth
 00091CC2    mov         edx,19
 00091CC7    mov         eax,esi
 00091CC9    call        TControl.SetHeight
 00091CCE    mov         eax,dword ptr [esi+1EC]
 00091CD4    mov         dword ptr [esi+1F4],eax
 00091CDA    mov         eax,esi
 00091CDC    test        bl,bl
>00091CDE    je          00091CEF
 00091CE0    call        @AfterConstruction
 00091CE5    pop         dword ptr fs:[0]
 00091CEC    add         esp,0C
 00091CEF    mov         eax,esi
 00091CF1    pop         esi
 00091CF2    pop         ebx
 00091CF3    ret
*}
end;

//00091CFC
function TSpinButton.CreateButton:TTimerSpeedButton;
begin
{*
 00091CFC    push        ebx
 00091CFD    push        esi
 00091CFE    mov         esi,eax
 00091D00    mov         ecx,esi
 00091D02    mov         dl,1
 00091D04    mov         eax,[00091B3C];TTimerSpeedButton
 00091D09    call        TSpeedButton.Create
 00091D0E    mov         ebx,eax
 00091D10    mov         dword ptr [ebx+108],esi
 00091D16    mov         dword ptr [ebx+104],91FEC;TSpinButton.BtnClick
 00091D20    mov         dword ptr [ebx+0B8],esi
 00091D26    mov         dword ptr [ebx+0B4],91F60;TSpinButton.BtnMouseDown
 00091D30    mov         dl,1
 00091D32    mov         eax,ebx
 00091D34    call        TControl.SetVisible
 00091D39    mov         dl,1
 00091D3B    mov         eax,ebx
 00091D3D    mov         ecx,dword ptr [eax]
 00091D3F    call        dword ptr [ecx+60]
 00091D42    mov         al,[00091D5C]
 00091D47    mov         byte ptr [ebx+138],al
 00091D4D    mov         edx,esi
 00091D4F    mov         eax,ebx
 00091D51    mov         ecx,dword ptr [eax]
 00091D53    call        dword ptr [ecx+64]
 00091D56    mov         eax,ebx
 00091D58    pop         esi
 00091D59    pop         ebx
 00091D5A    ret
*}
end;

//00091D60
procedure TSpinButton.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 00091D60    push        ebx
 00091D61    push        esi
 00091D62    push        edi
 00091D63    mov         ebx,ecx
 00091D65    mov         esi,edx
 00091D67    mov         edi,eax
 00091D69    mov         ecx,ebx
 00091D6B    mov         edx,esi
 00091D6D    mov         eax,edi
 00091D6F    call        TControl.Notification
 00091D74    cmp         bl,1
>00091D77    jne         00091D89
 00091D79    cmp         esi,dword ptr [edi+1F8]
>00091D7F    jne         00091D89
 00091D81    xor         eax,eax
 00091D83    mov         dword ptr [edi+1F8],eax
 00091D89    pop         edi
 00091D8A    pop         esi
 00091D8B    pop         ebx
 00091D8C    ret
*}
end;

//00091D90
procedure TSpinButton.AdjustSize(var W:Integer; var H:Integer);
begin
{*
 00091D90    push        ebx
 00091D91    push        esi
 00091D92    push        edi
 00091D93    push        ebp
 00091D94    mov         edi,ecx
 00091D96    mov         esi,edx
 00091D98    mov         ebx,eax
 00091D9A    mov         eax,dword ptr [ebx+1EC]
 00091DA0    test        eax,eax
>00091DA2    je          00091DF3
 00091DA4    test        byte ptr [ebx+20],1
>00091DA8    jne         00091DF3
 00091DAA    cmp         dword ptr [esi],0F
>00091DAD    jge         00091DB5
 00091DAF    mov         dword ptr [esi],0F
 00091DB5    mov         edx,dword ptr [esi]
 00091DB7    push        edx
 00091DB8    mov         edx,dword ptr [edi]
 00091DBA    sar         edx,1
>00091DBC    jns         00091DC1
 00091DBE    adc         edx,0
 00091DC1    push        edx
 00091DC2    xor         ecx,ecx
 00091DC4    xor         edx,edx
 00091DC6    mov         ebp,dword ptr [eax]
 00091DC8    call        dword ptr [ebp+80]
 00091DCE    mov         edx,dword ptr [esi]
 00091DD0    push        edx
 00091DD1    mov         edx,dword ptr [edi]
 00091DD3    mov         eax,dword ptr [ebx+1EC]
 00091DD9    mov         eax,dword ptr [eax+3C]
 00091DDC    sub         edx,eax
 00091DDE    inc         edx
 00091DDF    push        edx
 00091DE0    mov         ecx,eax
 00091DE2    dec         ecx
 00091DE3    xor         edx,edx
 00091DE5    mov         eax,dword ptr [ebx+1F0]
 00091DEB    mov         ebx,dword ptr [eax]
 00091DED    call        dword ptr [ebx+80]
 00091DF3    pop         ebp
 00091DF4    pop         edi
 00091DF5    pop         esi
 00091DF6    pop         ebx
 00091DF7    ret
*}
end;

//00091DF8
procedure TSpinButton.SetBounds(ALeft:Integer; ATop:Integer; AWidth:Integer; AHeight:Integer);
begin
{*
 00091DF8    push        ebp
 00091DF9    mov         ebp,esp
 00091DFB    add         esp,0FFFFFFF8
 00091DFE    push        ebx
 00091DFF    push        esi
 00091E00    push        edi
 00091E01    mov         edi,ecx
 00091E03    mov         esi,edx
 00091E05    mov         ebx,eax
 00091E07    mov         eax,dword ptr [ebp+0C]
 00091E0A    mov         dword ptr [ebp-4],eax
 00091E0D    mov         eax,dword ptr [ebp+8]
 00091E10    mov         dword ptr [ebp-8],eax
 00091E13    lea         ecx,[ebp-8]
 00091E16    lea         edx,[ebp-4]
 00091E19    mov         eax,ebx
 00091E1B    call        TSpinButton.AdjustSize
 00091E20    mov         eax,dword ptr [ebp-4]
 00091E23    push        eax
 00091E24    mov         eax,dword ptr [ebp-8]
 00091E27    push        eax
 00091E28    mov         ecx,edi
 00091E2A    mov         edx,esi
 00091E2C    mov         eax,ebx
 00091E2E    call        TWinControl.SetBounds
 00091E33    pop         edi
 00091E34    pop         esi
 00091E35    pop         ebx
 00091E36    pop         ecx
 00091E37    pop         ecx
 00091E38    pop         ebp
 00091E39    ret         8
*}
end;

//00091E3C
procedure TSpinButton.WMSize(var Message:TWMSize);
begin
{*
 00091E3C    push        ebx
 00091E3D    push        esi
 00091E3E    add         esp,0FFFFFFF8
 00091E41    mov         esi,edx
 00091E43    mov         ebx,eax
 00091E45    mov         edx,esi
 00091E47    mov         eax,ebx
 00091E49    call        TWinControl.WMSize
 00091E4E    mov         eax,dword ptr [ebx+38]
 00091E51    mov         dword ptr [esp],eax
 00091E54    mov         eax,dword ptr [ebx+3C]
 00091E57    mov         dword ptr [esp+4],eax
 00091E5B    lea         ecx,[esp+4]
 00091E5F    mov         edx,esp
 00091E61    mov         eax,ebx
 00091E63    call        TSpinButton.AdjustSize
 00091E68    mov         eax,dword ptr [esp]
 00091E6B    cmp         eax,dword ptr [ebx+38]
>00091E6E    jne         00091E79
 00091E70    mov         eax,dword ptr [esp+4]
 00091E74    cmp         eax,dword ptr [ebx+3C]
>00091E77    je          00091E8F
 00091E79    mov         eax,dword ptr [esp]
 00091E7C    push        eax
 00091E7D    mov         eax,dword ptr [esp+8]
 00091E81    push        eax
 00091E82    mov         ecx,dword ptr [ebx+34]
 00091E85    mov         edx,dword ptr [ebx+30]
 00091E88    mov         eax,ebx
 00091E8A    call        TWinControl.SetBounds
 00091E8F    xor         eax,eax
 00091E91    mov         dword ptr [esi+0C],eax
 00091E94    pop         ecx
 00091E95    pop         edx
 00091E96    pop         esi
 00091E97    pop         ebx
 00091E98    ret
*}
end;

//00091E9C
procedure TSpinButton.WMSetFocus(var Message:TWMSetFocus);
begin
{*
 00091E9C    push        ebx
 00091E9D    push        esi
 00091E9E    mov         ebx,eax
 00091EA0    mov         esi,dword ptr [ebx+1F4]
 00091EA6    mov         al,byte ptr [esi+138]
 00091EAC    or          al,byte ptr ds:[91EC4]
 00091EB2    mov         byte ptr [esi+138],al
 00091EB8    mov         eax,esi
 00091EBA    mov         edx,dword ptr [eax]
 00091EBC    call        dword ptr [edx+78]
 00091EBF    pop         esi
 00091EC0    pop         ebx
 00091EC1    ret
*}
end;

//00091EC8
procedure TSpinButton.WMKillFocus(var Message:TWMKillFocus);
begin
{*
 00091EC8    push        ebx
 00091EC9    push        esi
 00091ECA    mov         ebx,eax
 00091ECC    mov         esi,dword ptr [ebx+1F4]
 00091ED2    mov         al,[00091EF0]
 00091ED7    not         eax
 00091ED9    and         al,byte ptr [esi+138]
 00091EDF    mov         byte ptr [esi+138],al
 00091EE5    mov         eax,esi
 00091EE7    mov         edx,dword ptr [eax]
 00091EE9    call        dword ptr [edx+78]
 00091EEC    pop         esi
 00091EED    pop         ebx
 00091EEE    ret
*}
end;

//00091EF4
procedure TSpinButton.KeyDown(var Key:Word; Shift:TShiftState);
begin
{*
 00091EF4    push        ebx
 00091EF5    push        esi
 00091EF6    mov         esi,eax
 00091EF8    mov         ax,word ptr [edx]
 00091EFB    sub         ax,20
>00091EFF    je          00091F4D
 00091F01    sub         ax,6
>00091F05    je          00091F0F
 00091F07    sub         ax,2
>00091F0B    je          00091F2E
>00091F0D    jmp         00091F5C
 00091F0F    mov         edx,dword ptr [esi+1EC]
 00091F15    mov         eax,esi
 00091F17    call        TSpinButton.SetFocusBtn
 00091F1C    mov         eax,dword ptr [esi+1EC]
 00091F22    mov         bx,0FFEC
 00091F26    call        @CallDynaInst
 00091F2B    pop         esi
 00091F2C    pop         ebx
 00091F2D    ret
 00091F2E    mov         edx,dword ptr [esi+1F0]
 00091F34    mov         eax,esi
 00091F36    call        TSpinButton.SetFocusBtn
 00091F3B    mov         eax,dword ptr [esi+1F0]
 00091F41    mov         bx,0FFEC
 00091F45    call        @CallDynaInst
 00091F4A    pop         esi
 00091F4B    pop         ebx
 00091F4C    ret
 00091F4D    mov         eax,dword ptr [esi+1F4]
 00091F53    mov         bx,0FFEC
 00091F57    call        @CallDynaInst
 00091F5C    pop         esi
 00091F5D    pop         ebx
 00091F5E    ret
*}
end;

//00091F60
procedure TSpinButton.BtnMouseDown(Sender:TObject; Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);
begin
{*
 00091F60    push        ebp
 00091F61    mov         ebp,esp
 00091F63    push        ebx
 00091F64    push        esi
 00091F65    mov         esi,eax
 00091F67    test        cl,cl
>00091F69    jne         00091FE6
 00091F6B    mov         eax,esi
 00091F6D    call        TSpinButton.SetFocusBtn
 00091F72    mov         ebx,dword ptr [esi+1F8]
 00091F78    test        ebx,ebx
>00091F7A    je          00091FB6
 00091F7C    cmp         byte ptr [ebx+178],0
>00091F83    je          00091FB6
 00091F85    mov         eax,ebx
 00091F87    call        TWinControl.CanFocus
 00091F8C    test        al,al
>00091F8E    je          00091FB6
 00091F90    mov         eax,dword ptr [esi+1F8]
 00091F96    call        TWinControl.GetHandle
 00091F9B    mov         ebx,eax
 00091F9D    call        user32.GetFocus
 00091FA2    cmp         ebx,eax
>00091FA4    je          00091FB6
 00091FA6    mov         eax,dword ptr [esi+1F8]
 00091FAC    mov         edx,dword ptr [eax]
 00091FAE    call        dword ptr [edx+0B4]
>00091FB4    jmp         00091FE6
 00091FB6    cmp         byte ptr [esi+178],0
>00091FBD    je          00091FE6
 00091FBF    mov         eax,esi
 00091FC1    call        TWinControl.GetHandle
 00091FC6    mov         ebx,eax
 00091FC8    call        user32.GetFocus
 00091FCD    cmp         ebx,eax
>00091FCF    je          00091FE6
 00091FD1    mov         eax,esi
 00091FD3    call        TWinControl.CanFocus
 00091FD8    test        al,al
>00091FDA    je          00091FE6
 00091FDC    mov         eax,esi
 00091FDE    mov         edx,dword ptr [eax]
 00091FE0    call        dword ptr [edx+0B4]
 00091FE6    pop         esi
 00091FE7    pop         ebx
 00091FE8    pop         ebp
 00091FE9    ret         0C
*}
end;

//00091FEC
procedure TSpinButton.BtnClick(Sender:TObject);
begin
{*
 00091FEC    push        ebx
 00091FED    cmp         edx,dword ptr [eax+1EC]
>00091FF3    jne         00092011
 00091FF5    cmp         word ptr [eax+1FE],0
>00091FFD    je          0009202B
 00091FFF    mov         ebx,eax
 00092001    mov         edx,eax
 00092003    mov         eax,dword ptr [ebx+200]
 00092009    call        dword ptr [ebx+1FC]
 0009200F    pop         ebx
 00092010    ret
 00092011    cmp         word ptr [eax+206],0
>00092019    je          0009202B
 0009201B    mov         ebx,eax
 0009201D    mov         edx,eax
 0009201F    mov         eax,dword ptr [ebx+208]
 00092025    call        dword ptr [ebx+204]
 0009202B    pop         ebx
 0009202C    ret
*}
end;

//00092030
procedure TSpinButton.SetFocusBtn(Btn:TTimerSpeedButton);
begin
{*
 00092030    push        ebx
 00092031    push        esi
 00092032    push        edi
 00092033    mov         esi,edx
 00092035    mov         ebx,eax
 00092037    cmp         byte ptr [ebx+178],0
>0009203E    je          000920A3
 00092040    mov         eax,ebx
 00092042    call        TWinControl.CanFocus
 00092047    test        al,al
>00092049    je          000920A3
 0009204B    cmp         esi,dword ptr [ebx+1F4]
>00092051    je          000920A3
 00092053    mov         edi,dword ptr [ebx+1F4]
 00092059    mov         al,[000920A8]
 0009205E    not         eax
 00092060    and         al,byte ptr [edi+138]
 00092066    mov         byte ptr [edi+138],al
 0009206C    mov         dword ptr [ebx+1F4],esi
 00092072    mov         eax,ebx
 00092074    call        TWinControl.GetHandle
 00092079    mov         esi,eax
 0009207B    call        user32.GetFocus
 00092080    cmp         esi,eax
>00092082    jne         000920A3
 00092084    mov         esi,dword ptr [ebx+1F4]
 0009208A    mov         al,byte ptr [esi+138]
 00092090    or          al,byte ptr ds:[920A8]
 00092096    mov         byte ptr [esi+138],al
 0009209C    mov         eax,ebx
 0009209E    mov         edx,dword ptr [eax]
 000920A0    call        dword ptr [edx+78]
 000920A3    pop         edi
 000920A4    pop         esi
 000920A5    pop         ebx
 000920A6    ret
*}
end;

//000920AC
procedure TSpinButton.WMGetDlgCode(var Message:TWMGetDlgCode);
begin
{*
 000920AC    mov         dword ptr [edx+0C],1
 000920B3    ret
*}
end;

//000920B4
procedure TSpinButton.Loaded;
begin
{*
 000920B4    push        ebx
 000920B5    add         esp,0FFFFFFF8
 000920B8    mov         ebx,eax
 000920BA    mov         eax,ebx
 000920BC    call        TControl.Loaded
 000920C1    mov         eax,dword ptr [ebx+38]
 000920C4    mov         dword ptr [esp],eax
 000920C7    mov         eax,dword ptr [ebx+3C]
 000920CA    mov         dword ptr [esp+4],eax
 000920CE    lea         ecx,[esp+4]
 000920D2    mov         edx,esp
 000920D4    mov         eax,ebx
 000920D6    call        TSpinButton.AdjustSize
 000920DB    mov         eax,dword ptr [esp]
 000920DE    cmp         eax,dword ptr [ebx+38]
>000920E1    jne         000920EC
 000920E3    mov         eax,dword ptr [esp+4]
 000920E7    cmp         eax,dword ptr [ebx+3C]
>000920EA    je          00092102
 000920EC    mov         eax,dword ptr [esp]
 000920EF    push        eax
 000920F0    mov         eax,dword ptr [esp+8]
 000920F4    push        eax
 000920F5    mov         ecx,dword ptr [ebx+34]
 000920F8    mov         edx,dword ptr [ebx+30]
 000920FB    mov         eax,ebx
 000920FD    call        TWinControl.SetBounds
 00092102    pop         ecx
 00092103    pop         edx
 00092104    pop         ebx
 00092105    ret
*}
end;

//00092108
procedure TSpinButton.GetUpGlyph;
begin
{*
 00092108    mov         eax,dword ptr [eax+1EC];TSpinButton.FUpButton:TTimerSpeedButton
 0009210E    call        TBitBtn.GetGlyph
 00092113    ret
*}
end;

//00092114
procedure TSpinButton.SetUpGlyph(Value:TBitmap);
begin
{*
 00092114    push        ebx
 00092115    mov         ebx,eax
 00092117    test        edx,edx
>00092119    je          00092128
 0009211B    mov         eax,dword ptr [ebx+1EC]
 00092121    call        TSpeedButton.SetGlyph
 00092126    pop         ebx
 00092127    ret
 00092128    push        92168
 0009212D    mov         eax,[000B5950];^HInstance:Longword
 00092132    mov         eax,dword ptr [eax]
 00092134    push        eax
 00092135    call        user32.LoadBitmapA
 0009213A    push        eax
 0009213B    mov         eax,dword ptr [ebx+1EC]
 00092141    call        TBitBtn.GetGlyph
 00092146    pop         edx
 00092147    call        TBitmap.SetHandle
 0009214C    mov         dl,1
 0009214E    mov         eax,dword ptr [ebx+1EC]
 00092154    call        TSpeedButton.SetNumGlyphs
 00092159    mov         eax,dword ptr [ebx+1EC]
 0009215F    mov         edx,dword ptr [eax]
 00092161    call        dword ptr [edx+78]
 00092164    pop         ebx
 00092165    ret
*}
end;

//00092170
function TSpinButton.GetUpNumGlyphs:TNumGlyphs;
begin
{*
 00092170    mov         eax,dword ptr [eax+1EC]
 00092176    call        TSpeedButton.GetNumGlyphs
 0009217B    ret
*}
end;

//0009217C
procedure TSpinButton.SetUpNumGlyphs(Value:TNumGlyphs);
begin
{*
 0009217C    mov         eax,dword ptr [eax+1EC]
 00092182    call        TSpeedButton.SetNumGlyphs
 00092187    ret
*}
end;

//00092188
procedure TSpinButton.GetDownGlyph;
begin
{*
 00092188    mov         eax,dword ptr [eax+1F0];TSpinButton.FDownButton:TTimerSpeedButton
 0009218E    call        TBitBtn.GetGlyph
 00092193    ret
*}
end;

//00092194
procedure TSpinButton.SetDownGlyph(Value:TBitmap);
begin
{*
 00092194    push        ebx
 00092195    mov         ebx,eax
 00092197    test        edx,edx
>00092199    je          000921A8
 0009219B    mov         eax,dword ptr [ebx+1F0]
 000921A1    call        TSpeedButton.SetGlyph
 000921A6    pop         ebx
 000921A7    ret
 000921A8    push        921E8
 000921AD    mov         eax,[000B5950];^HInstance:Longword
 000921B2    mov         eax,dword ptr [eax]
 000921B4    push        eax
 000921B5    call        user32.LoadBitmapA
 000921BA    push        eax
 000921BB    mov         eax,dword ptr [ebx+1F0]
 000921C1    call        TBitBtn.GetGlyph
 000921C6    pop         edx
 000921C7    call        TBitmap.SetHandle
 000921CC    mov         dl,1
 000921CE    mov         eax,dword ptr [ebx+1EC]
 000921D4    call        TSpeedButton.SetNumGlyphs
 000921D9    mov         eax,dword ptr [ebx+1F0]
 000921DF    mov         edx,dword ptr [eax]
 000921E1    call        dword ptr [edx+78]
 000921E4    pop         ebx
 000921E5    ret
*}
end;

//000921F4
function TSpinButton.GetDownNumGlyphs:TNumGlyphs;
begin
{*
 000921F4    mov         eax,dword ptr [eax+1F0]
 000921FA    call        TSpeedButton.GetNumGlyphs
 000921FF    ret
*}
end;

//00092200
procedure TSpinButton.SetDownNumGlyphs(Value:TNumGlyphs);
begin
{*
 00092200    mov         eax,dword ptr [eax+1F0]
 00092206    call        TSpeedButton.SetNumGlyphs
 0009220B    ret
*}
end;

//0009220C
constructor TSpinEdit.Create(AOwner:TComponent);
begin
{*
 0009220C    push        ebp
 0009220D    mov         ebp,esp
 0009220F    push        ecx
 00092210    push        ebx
 00092211    push        esi
 00092212    test        dl,dl
>00092214    je          0009221E
 00092216    add         esp,0FFFFFFF0
 00092219    call        @ClassCreate
 0009221E    mov         byte ptr [ebp-1],dl
 00092221    mov         ebx,eax
 00092223    xor         edx,edx
 00092225    mov         eax,ebx
 00092227    call        TCustomEdit.Create
 0009222C    mov         ecx,ebx
 0009222E    mov         dl,1
 00092230    mov         eax,[00090E6C];TSpinButton
 00092235    call        TSpinButton.Create
 0009223A    mov         esi,eax
 0009223C    mov         dword ptr [ebx+210],esi
 00092242    mov         edx,0F
 00092247    mov         eax,esi
 00092249    call        TControl.SetWidth
 0009224E    mov         edx,11
 00092253    mov         eax,dword ptr [ebx+210]
 00092259    call        TControl.SetHeight
 0009225E    mov         dl,1
 00092260    mov         eax,dword ptr [ebx+210]
 00092266    call        TControl.SetVisible
 0009226B    mov         edx,ebx
 0009226D    mov         eax,dword ptr [ebx+210]
 00092273    mov         ecx,dword ptr [eax]
 00092275    call        dword ptr [ecx+64]
 00092278    mov         eax,dword ptr [ebx+210]
 0009227E    mov         dword ptr [eax+1F8],ebx
 00092284    mov         dword ptr [eax+200],ebx
 0009228A    mov         edx,dword ptr [ebx]
 0009228C    mov         edx,dword ptr [edx+0DC]
 00092292    mov         dword ptr [eax+1FC],edx
 00092298    mov         dword ptr [eax+208],ebx
 0009229E    mov         edx,dword ptr [ebx]
 000922A0    mov         edx,dword ptr [edx+0E0]
 000922A6    mov         dword ptr [eax+204],edx
 000922AC    mov         edx,922FC;'0'
 000922B1    mov         eax,ebx
 000922B3    call        TControl.SetText
 000922B8    mov         eax,[00092300]
 000922BD    not         eax
 000922BF    and         eax,dword ptr [ebx+40]
 000922C2    mov         dword ptr [ebx+40],eax
 000922C5    mov         dword ptr [ebx+20C],1
 000922CF    mov         byte ptr [ebx+214],1
 000922D6    mov         eax,ebx
 000922D8    cmp         byte ptr [ebp-1],0
>000922DC    je          000922ED
 000922DE    call        @AfterConstruction
 000922E3    pop         dword ptr fs:[0]
 000922EA    add         esp,0C
 000922ED    mov         eax,ebx
 000922EF    pop         esi
 000922F0    pop         ebx
 000922F1    pop         ecx
 000922F2    pop         ebp
 000922F3    ret
*}
end;

//00092304
destructor TSpinEdit.Destroy;
begin
{*
 00092304    push        ebx
 00092305    push        esi
 00092306    call        @BeforeDestruction
 0009230B    mov         ebx,edx
 0009230D    mov         esi,eax
 0009230F    xor         eax,eax
 00092311    mov         dword ptr [esi+210],eax
 00092317    mov         edx,ebx
 00092319    and         dl,0FC
 0009231C    mov         eax,esi
 0009231E    call        TWinControl.Destroy
 00092323    test        bl,bl
>00092325    jle         0009232E
 00092327    mov         eax,esi
 00092329    call        @ClassDestroy
 0009232E    pop         esi
 0009232F    pop         ebx
 00092330    ret
*}
end;

//00092334
procedure TSpinEdit.GetChildren(Proc:TGetChildProc; Root:TComponent);
begin
{*
 00092334    push        ebp
 00092335    mov         ebp,esp
 00092337    pop         ebp
 00092338    ret         8
*}
end;

//0009233C
procedure TSpinEdit.KeyDown(var Key:Word; Shift:TShiftState);
begin
{*
 0009233C    push        ebx
 0009233D    push        esi
 0009233E    push        ecx
 0009233F    mov         byte ptr [esp],cl
 00092342    mov         esi,edx
 00092344    mov         ebx,eax
 00092346    cmp         word ptr [esi],26
>0009234A    jne         0009235A
 0009234C    mov         edx,ebx
 0009234E    mov         eax,ebx
 00092350    mov         ecx,dword ptr [eax]
 00092352    call        dword ptr [ecx+0DC]
>00092358    jmp         0009236C
 0009235A    cmp         word ptr [esi],28
>0009235E    jne         0009236C
 00092360    mov         edx,ebx
 00092362    mov         eax,ebx
 00092364    mov         ecx,dword ptr [eax]
 00092366    call        dword ptr [ecx+0E0]
 0009236C    mov         edx,esi
 0009236E    mov         cl,byte ptr [esp]
 00092371    mov         eax,ebx
 00092373    call        TWinControl.KeyDown
 00092378    pop         edx
 00092379    pop         esi
 0009237A    pop         ebx
 0009237B    ret
*}
end;

//0009237C
procedure TSpinEdit.KeyPress(var Key:Char);
begin
{*
 0009237C    push        ebx
 0009237D    push        esi
 0009237E    mov         ebx,edx
 00092380    mov         esi,eax
 00092382    mov         dl,byte ptr [ebx]
 00092384    mov         eax,esi
 00092386    mov         ecx,dword ptr [eax]
 00092388    call        dword ptr [ecx+0D8]
 0009238E    test        al,al
>00092390    jne         0009239C
 00092392    mov         byte ptr [ebx],0
 00092395    push        0
 00092397    call        user32.MessageBeep
 0009239C    cmp         byte ptr [ebx],0
>0009239F    je          000923AA
 000923A1    mov         edx,ebx
 000923A3    mov         eax,esi
 000923A5    call        TWinControl.KeyPress
 000923AA    pop         esi
 000923AB    pop         ebx
 000923AC    ret
*}
end;

//000923B0
function TSpinEdit.IsValidChar(Key:Char):Boolean;
begin
{*
 000923B0    push        ebx
 000923B1    push        esi
 000923B2    push        edi
 000923B3    add         esp,0FFFFFFE0
 000923B6    mov         ebx,edx
 000923B8    mov         esi,eax
 000923BA    push        esi
 000923BB    mov         esi,92420
 000923C0    lea         edi,[esp+4]
 000923C4    mov         ecx,8
 000923C9    rep movs    dword ptr [edi],dword ptr [esi]
 000923CB    pop         esi
 000923CC    mov         eax,[000B5BAC];^gvar_000B64FB:Char
 000923D1    mov         al,byte ptr [eax]
 000923D3    and         eax,0FF
 000923D8    bts         dword ptr [esp],eax
 000923DC    mov         eax,ebx
 000923DE    and         eax,0FF
 000923E3    bt          dword ptr [esp],eax
>000923E7    jb          000923F7
 000923E9    cmp         bl,20
>000923EC    jae         000923F3
 000923EE    cmp         bl,0D
>000923F1    jne         000923F7
 000923F3    xor         eax,eax
>000923F5    jmp         000923F9
 000923F7    mov         al,1
 000923F9    mov         dl,byte ptr [esi+214]
 000923FF    xor         dl,1
 00092402    test        dl,al
>00092404    je          00092417
 00092406    cmp         bl,20
>00092409    jae         00092415
 0009240B    cmp         bl,8
>0009240E    je          00092415
 00092410    cmp         bl,2E
>00092413    jne         00092417
 00092415    xor         eax,eax
 00092417    add         esp,20
 0009241A    pop         edi
 0009241B    pop         esi
 0009241C    pop         ebx
 0009241D    ret
*}
end;

//00092440
procedure TSpinEdit.CreateParams(var Params:TCreateParams);
begin
{*
 00092440    push        ebx
 00092441    mov         ebx,edx
 00092443    mov         edx,ebx
 00092445    call        TCustomEdit.CreateParams
 0009244A    mov         eax,dword ptr [ebx+4]
 0009244D    or          eax,4
 00092450    or          eax,2000000
 00092455    mov         dword ptr [ebx+4],eax
 00092458    pop         ebx
 00092459    ret
*}
end;

//0009245C
procedure TSpinEdit.CreateWnd;
begin
{*
 0009245C    push        ebx
 0009245D    mov         ebx,eax
 0009245F    mov         eax,ebx
 00092461    call        TCustomEdit.CreateWnd
 00092466    mov         eax,ebx
 00092468    call        TSpinEdit.SetEditRect
 0009246D    pop         ebx
 0009246E    ret
*}
end;

//00092470
procedure TSpinEdit.SetEditRect;
begin
{*
 00092470    push        ebx
 00092471    add         esp,0FFFFFFF0
 00092474    mov         ebx,eax
 00092476    mov         eax,esp
 00092478    push        eax
 00092479    push        0
 0009247B    push        0B2
 00092480    mov         eax,ebx
 00092482    call        TWinControl.GetHandle
 00092487    push        eax
 00092488    call        user32.SendMessageA
 0009248D    mov         eax,ebx
 0009248F    call        TControl.GetClientHeight
 00092494    inc         eax
 00092495    mov         dword ptr [esp+0C],eax
 00092499    mov         eax,ebx
 0009249B    call        TControl.GetClientWidth
 000924A0    mov         edx,dword ptr [ebx+210]
 000924A6    sub         eax,dword ptr [edx+38]
 000924A9    sub         eax,2
 000924AC    mov         dword ptr [esp+8],eax
 000924B0    xor         eax,eax
 000924B2    mov         dword ptr [esp+4],eax
 000924B6    xor         eax,eax
 000924B8    mov         dword ptr [esp],eax
 000924BB    mov         eax,esp
 000924BD    push        eax
 000924BE    push        0
 000924C0    push        0B4
 000924C5    mov         eax,ebx
 000924C7    call        TWinControl.GetHandle
 000924CC    push        eax
 000924CD    call        user32.SendMessageA
 000924D2    mov         eax,esp
 000924D4    push        eax
 000924D5    push        0
 000924D7    push        0B2
 000924DC    mov         eax,ebx
 000924DE    call        TWinControl.GetHandle
 000924E3    push        eax
 000924E4    call        user32.SendMessageA
 000924E9    add         esp,10
 000924EC    pop         ebx
 000924ED    ret
*}
end;

//000924F0
procedure TSpinEdit.WMSize(var Message:TWMSize);
begin
{*
 000924F0    push        ebx
 000924F1    push        esi
 000924F2    push        edi
 000924F3    mov         esi,eax
 000924F5    mov         eax,esi
 000924F7    call        TWinControl.WMSize
 000924FC    mov         eax,esi
 000924FE    call        TSpinEdit.GetMinHeight
 00092503    cmp         eax,dword ptr [esi+3C]
>00092506    jle         00092513
 00092508    mov         edx,eax
 0009250A    mov         eax,esi
 0009250C    call        TControl.SetHeight
>00092511    jmp         0009258A
 00092513    cmp         dword ptr [esi+210],0
>0009251A    je          0009258A
 0009251C    mov         eax,[000B58C0];NewStyleControls:Boolean
 00092521    cmp         byte ptr [eax],0
>00092524    je          0009255A
 00092526    cmp         byte ptr [esi+12C],0
>0009252D    je          0009255A
 0009252F    mov         edx,dword ptr [esi+210]
 00092535    mov         edi,dword ptr [edx+38]
 00092538    push        edi
 00092539    mov         edx,dword ptr [esi+3C]
 0009253C    sub         edx,5
 0009253F    push        edx
 00092540    mov         eax,dword ptr [esi+210]
 00092546    mov         edx,dword ptr [esi+38]
 00092549    sub         edx,edi
 0009254B    sub         edx,5
 0009254E    xor         ecx,ecx
 00092550    mov         ebx,dword ptr [eax]
 00092552    call        dword ptr [ebx+80]
>00092558    jmp         00092583
 0009255A    mov         edx,dword ptr [esi+210]
 00092560    mov         edi,dword ptr [edx+38]
 00092563    push        edi
 00092564    mov         edx,dword ptr [esi+3C]
 00092567    sub         edx,3
 0009256A    push        edx
 0009256B    mov         eax,dword ptr [esi+210]
 00092571    mov         edx,dword ptr [esi+38]
 00092574    sub         edx,edi
 00092576    mov         ecx,1
 0009257B    mov         ebx,dword ptr [eax]
 0009257D    call        dword ptr [ebx+80]
 00092583    mov         eax,esi
 00092585    call        TSpinEdit.SetEditRect
 0009258A    pop         edi
 0009258B    pop         esi
 0009258C    pop         ebx
 0009258D    ret
*}
end;

//00092590
function TSpinEdit.GetMinHeight:Integer;
begin
{*
 00092590    push        ebx
 00092591    push        esi
 00092592    add         esp,0FFFFFF90
 00092595    mov         esi,eax
 00092597    push        0
 00092599    call        user32.GetDC
 0009259E    mov         ebx,eax
 000925A0    push        esp
 000925A1    push        ebx
 000925A2    call        gdi32.GetTextMetricsA
 000925A7    mov         eax,dword ptr [esi+58]
 000925AA    call        TFont.GetHandle
 000925AF    push        eax
 000925B0    push        ebx
 000925B1    call        gdi32.SelectObject
 000925B6    mov         esi,eax
 000925B8    lea         eax,[esp+38]
 000925BC    push        eax
 000925BD    push        ebx
 000925BE    call        gdi32.GetTextMetricsA
 000925C3    push        esi
 000925C4    push        ebx
 000925C5    call        gdi32.SelectObject
 000925CA    push        ebx
 000925CB    push        0
 000925CD    call        user32.ReleaseDC
 000925D2    mov         ebx,dword ptr [esp]
 000925D5    mov         esi,dword ptr [esp+38]
 000925D9    cmp         ebx,esi
>000925DB    jle         000925DF
 000925DD    mov         ebx,esi
 000925DF    push        6
 000925E1    call        user32.GetSystemMetrics
 000925E6    shl         eax,2
 000925E9    test        ebx,ebx
>000925EB    jns         000925F0
 000925ED    add         ebx,3
 000925F0    sar         ebx,2
 000925F3    add         ebx,esi
 000925F5    add         eax,ebx
 000925F7    add         eax,2
 000925FA    add         esp,70
 000925FD    pop         esi
 000925FE    pop         ebx
 000925FF    ret
*}
end;

//00092600
procedure TSpinEdit.UpClick(Sender:TObject);
begin
{*
 00092600    push        ebx
 00092601    mov         ebx,eax
 00092603    cmp         byte ptr [ebx+1F2],0
>0009260A    je          00092615
 0009260C    push        0
 0009260E    call        user32.MessageBeep
 00092613    pop         ebx
 00092614    ret
 00092615    mov         eax,ebx
 00092617    call        TSpinEdit.GetValue
 0009261C    mov         edx,eax
 0009261E    add         edx,dword ptr [ebx+20C]
 00092624    mov         eax,ebx
 00092626    call        TSpinEdit.SetValue
 0009262B    pop         ebx
 0009262C    ret
*}
end;

//00092630
procedure TSpinEdit.DownClick(Sender:TObject);
begin
{*
 00092630    push        ebx
 00092631    mov         ebx,eax
 00092633    cmp         byte ptr [ebx+1F2],0
>0009263A    je          00092645
 0009263C    push        0
 0009263E    call        user32.MessageBeep
 00092643    pop         ebx
 00092644    ret
 00092645    mov         eax,ebx
 00092647    call        TSpinEdit.GetValue
 0009264C    mov         edx,eax
 0009264E    sub         edx,dword ptr [ebx+20C]
 00092654    mov         eax,ebx
 00092656    call        TSpinEdit.SetValue
 0009265B    pop         ebx
 0009265C    ret
*}
end;

//00092660
procedure TSpinEdit.WMCut(var Message:TWMCut);
begin
{*
 00092660    push        esi
 00092661    mov         esi,eax
 00092663    cmp         byte ptr [esi+214],0
>0009266A    je          0009267C
 0009266C    cmp         byte ptr [esi+1F2],0
>00092673    jne         0009267C
 00092675    mov         eax,esi
 00092677    mov         ecx,dword ptr [eax]
 00092679    call        dword ptr [ecx-10]
 0009267C    pop         esi
 0009267D    ret
*}
end;

//00092680
procedure TSpinEdit.WMPaste(var Message:TWMPaste);
begin
{*
 00092680    push        esi
 00092681    mov         esi,eax
 00092683    cmp         byte ptr [esi+214],0
>0009268A    je          0009269C
 0009268C    cmp         byte ptr [esi+1F2],0
>00092693    jne         0009269C
 00092695    mov         eax,esi
 00092697    mov         ecx,dword ptr [eax]
 00092699    call        dword ptr [ecx-10]
 0009269C    pop         esi
 0009269D    ret
*}
end;

//000926A0
procedure TSpinEdit.CMExit(var Message:TCMExit);
begin
{*
 000926A0    push        ebx
 000926A1    push        esi
 000926A2    mov         ebx,eax
 000926A4    mov         eax,ebx
 000926A6    call        TWinControl.CMExit
 000926AB    mov         eax,ebx
 000926AD    call        TSpinEdit.GetValue
 000926B2    mov         edx,eax
 000926B4    mov         eax,ebx
 000926B6    call        TSpinEdit.CheckValue
 000926BB    mov         esi,eax
 000926BD    mov         eax,ebx
 000926BF    call        TSpinEdit.GetValue
 000926C4    cmp         esi,eax
>000926C6    je          000926D8
 000926C8    mov         eax,ebx
 000926CA    call        TSpinEdit.GetValue
 000926CF    mov         edx,eax
 000926D1    mov         eax,ebx
 000926D3    call        TSpinEdit.SetValue
 000926D8    pop         esi
 000926D9    pop         ebx
 000926DA    ret
*}
end;

//000926DC
function TSpinEdit.GetValue:Longint;
begin
{*
 000926DC    push        ebp
 000926DD    mov         ebp,esp
 000926DF    add         esp,0FFFFFFF8
 000926E2    push        ebx
 000926E3    push        esi
 000926E4    push        edi
 000926E5    xor         edx,edx
 000926E7    mov         dword ptr [ebp-8],edx
 000926EA    mov         dword ptr [ebp-4],eax
 000926ED    xor         eax,eax
 000926EF    push        ebp
 000926F0    push        92751
 000926F5    push        dword ptr fs:[eax]
 000926F8    mov         dword ptr fs:[eax],esp
 000926FB    xor         eax,eax
 000926FD    push        ebp
 000926FE    push        92728
 00092703    push        dword ptr fs:[eax]
 00092706    mov         dword ptr fs:[eax],esp
 00092709    lea         edx,[ebp-8]
 0009270C    mov         eax,dword ptr [ebp-4]
 0009270F    call        TControl.GetText
 00092714    mov         eax,dword ptr [ebp-8]
 00092717    call        StrToInt
 0009271C    mov         ebx,eax
 0009271E    xor         eax,eax
 00092720    pop         edx
 00092721    pop         ecx
 00092722    pop         ecx
 00092723    mov         dword ptr fs:[eax],edx
>00092726    jmp         0009273B
>00092728    jmp         @HandleAnyException
 0009272D    mov         eax,dword ptr [ebp-4]
 00092730    mov         ebx,dword ptr [eax+204]
 00092736    call        @DoneExcept
 0009273B    xor         eax,eax
 0009273D    pop         edx
 0009273E    pop         ecx
 0009273F    pop         ecx
 00092740    mov         dword ptr fs:[eax],edx
 00092743    push        92758
 00092748    lea         eax,[ebp-8]
 0009274B    call        @LStrClr
 00092750    ret
>00092751    jmp         @HandleFinally
>00092756    jmp         00092748
 00092758    mov         eax,ebx
 0009275A    pop         edi
 0009275B    pop         esi
 0009275C    pop         ebx
 0009275D    pop         ecx
 0009275E    pop         ecx
 0009275F    pop         ebp
 00092760    ret
*}
end;

//00092764
procedure TSpinEdit.SetValue(NewValue:Longint);
begin
{*
 00092764    push        ebp
 00092765    mov         ebp,esp
 00092767    push        0
 00092769    push        ebx
 0009276A    push        esi
 0009276B    mov         esi,edx
 0009276D    mov         ebx,eax
 0009276F    xor         eax,eax
 00092771    push        ebp
 00092772    push        927AE
 00092777    push        dword ptr fs:[eax]
 0009277A    mov         dword ptr fs:[eax],esp
 0009277D    mov         edx,esi
 0009277F    mov         eax,ebx
 00092781    call        TSpinEdit.CheckValue
 00092786    lea         edx,[ebp-4]
 00092789    call        IntToStr
 0009278E    mov         edx,dword ptr [ebp-4]
 00092791    mov         eax,ebx
 00092793    call        TControl.SetText
 00092798    xor         eax,eax
 0009279A    pop         edx
 0009279B    pop         ecx
 0009279C    pop         ecx
 0009279D    mov         dword ptr fs:[eax],edx
 000927A0    push        927B5
 000927A5    lea         eax,[ebp-4]
 000927A8    call        @LStrClr
 000927AD    ret
>000927AE    jmp         @HandleFinally
>000927B3    jmp         000927A5
 000927B5    pop         esi
 000927B6    pop         ebx
 000927B7    pop         ecx
 000927B8    pop         ebp
 000927B9    ret
*}
end;

//000927BC
function TSpinEdit.CheckValue(NewValue:Longint):Longint;
begin
{*
 000927BC    push        esi
 000927BD    push        edi
 000927BE    mov         ecx,edx
 000927C0    mov         esi,dword ptr [eax+204]
 000927C6    mov         edi,dword ptr [eax+208]
 000927CC    cmp         esi,edi
>000927CE    je          000927DE
 000927D0    cmp         esi,edx
>000927D2    jle         000927D8
 000927D4    mov         ecx,esi
>000927D6    jmp         000927DE
 000927D8    cmp         edi,edx
>000927DA    jge         000927DE
 000927DC    mov         ecx,edi
 000927DE    mov         eax,ecx
 000927E0    pop         edi
 000927E1    pop         esi
 000927E2    ret
*}
end;

//000927E4
procedure TSpinEdit.CMEnter(var Message:TCMGotFocus);
begin
{*
 000927E4    push        ebx
 000927E5    push        esi
 000927E6    mov         esi,edx
 000927E8    mov         ebx,eax
 000927EA    cmp         byte ptr [ebx+1F4],0
>000927F1    je          00092800
 000927F3    test        byte ptr [ebx+44],1
>000927F7    jne         00092800
 000927F9    mov         eax,ebx
 000927FB    call        TCustomEdit.SelectAll
 00092800    mov         edx,esi
 00092802    mov         eax,ebx
 00092804    call        TCustomEdit.CMEnter
 00092809    pop         esi
 0009280A    pop         ebx
 0009280B    ret
*}
end;

//0009280C
destructor TTimerSpeedButton.Destroy;
begin
{*
 0009280C    push        ebx
 0009280D    push        esi
 0009280E    call        @BeforeDestruction
 00092813    mov         ebx,edx
 00092815    mov         esi,eax
 00092817    mov         eax,dword ptr [esi+134]
 0009281D    test        eax,eax
>0009281F    je          00092826
 00092821    call        TObject.Free
 00092826    mov         edx,ebx
 00092828    and         dl,0FC
 0009282B    mov         eax,esi
 0009282D    call        TSpeedButton.Destroy
 00092832    test        bl,bl
>00092834    jle         0009283D
 00092836    mov         eax,esi
 00092838    call        @ClassDestroy
 0009283D    pop         esi
 0009283E    pop         ebx
 0009283F    ret
*}
end;

//00092840
procedure TTimerSpeedButton.MouseDown(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);
begin
{*
 00092840    push        ebp
 00092841    mov         ebp,esp
 00092843    push        ecx
 00092844    push        ebx
 00092845    mov         byte ptr [ebp-1],cl
 00092848    mov         ebx,eax
 0009284A    mov         eax,dword ptr [ebp+0C]
 0009284D    push        eax
 0009284E    mov         eax,dword ptr [ebp+8]
 00092851    push        eax
 00092852    mov         cl,byte ptr [ebp-1]
 00092855    mov         eax,ebx
 00092857    call        TSpeedButton.MouseDown
 0009285C    test        byte ptr [ebx+138],2
>00092863    je          000928B0
 00092865    cmp         dword ptr [ebx+134],0
>0009286C    jne         00092882
 0009286E    mov         ecx,ebx
 00092870    mov         dl,1
 00092872    mov         eax,[00060EF4];TTimer
 00092877    call        TTimer.Create
 0009287C    mov         dword ptr [ebx+134],eax
 00092882    push        ebx
 00092883    push        928EC;TTimerSpeedButton.TimerExpired
 00092888    mov         eax,dword ptr [ebx+134]
 0009288E    call        TTimer.SetOnTimer
 00092893    mov         edx,190
 00092898    mov         eax,dword ptr [ebx+134]
 0009289E    call        TTimer.SetInterval
 000928A3    mov         dl,1
 000928A5    mov         eax,dword ptr [ebx+134]
 000928AB    call        TTimer.SetEnabled
 000928B0    pop         ebx
 000928B1    pop         ecx
 000928B2    pop         ebp
 000928B3    ret         8
*}
end;

//000928B8
procedure TTimerSpeedButton.MouseUp(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);
begin
{*
 000928B8    push        ebp
 000928B9    mov         ebp,esp
 000928BB    push        ecx
 000928BC    push        ebx
 000928BD    mov         byte ptr [ebp-1],cl
 000928C0    mov         ebx,eax
 000928C2    mov         eax,dword ptr [ebp+0C]
 000928C5    push        eax
 000928C6    mov         eax,dword ptr [ebp+8]
 000928C9    push        eax
 000928CA    mov         cl,byte ptr [ebp-1]
 000928CD    mov         eax,ebx
 000928CF    call        TSpeedButton.MouseUp
 000928D4    mov         eax,dword ptr [ebx+134]
 000928DA    test        eax,eax
>000928DC    je          000928E5
 000928DE    xor         edx,edx
 000928E0    call        TTimer.SetEnabled
 000928E5    pop         ebx
 000928E6    pop         ecx
 000928E7    pop         ebp
 000928E8    ret         8
*}
end;

//000928EC
procedure TTimerSpeedButton.TimerExpired(Sender:TObject);
begin
{*
 000928EC    push        ebp
 000928ED    mov         ebp,esp
 000928EF    push        ecx
 000928F0    push        ebx
 000928F1    push        esi
 000928F2    push        edi
 000928F3    mov         dword ptr [ebp-4],eax
 000928F6    mov         eax,dword ptr [ebp-4]
 000928F9    mov         eax,dword ptr [eax+134]
 000928FF    mov         edx,64
 00092904    call        TTimer.SetInterval
 00092909    mov         eax,dword ptr [ebp-4]
 0009290C    cmp         byte ptr [eax+132],2
>00092913    jne         00092964
 00092915    mov         eax,dword ptr [ebp-4]
 00092918    call        TControl.GetMouseCapture
 0009291D    test        al,al
>0009291F    je          00092964
 00092921    xor         eax,eax
 00092923    push        ebp
 00092924    push        92945
 00092929    push        dword ptr fs:[eax]
 0009292C    mov         dword ptr fs:[eax],esp
 0009292F    mov         eax,dword ptr [ebp-4]
 00092932    mov         bx,0FFEC
 00092936    call        @CallDynaInst
 0009293B    xor         eax,eax
 0009293D    pop         edx
 0009293E    pop         ecx
 0009293F    pop         ecx
 00092940    mov         dword ptr fs:[eax],edx
>00092943    jmp         00092964
>00092945    jmp         @HandleAnyException
 0009294A    mov         eax,dword ptr [ebp-4]
 0009294D    mov         eax,dword ptr [eax+134]
 00092953    xor         edx,edx
 00092955    call        TTimer.SetEnabled
 0009295A    call        @RaiseAgain
 0009295F    call        @DoneExcept
 00092964    pop         edi
 00092965    pop         esi
 00092966    pop         ebx
 00092967    pop         ecx
 00092968    pop         ebp
 00092969    ret
*}
end;

//0009296C
procedure TTimerSpeedButton.Paint;
begin
{*
 0009296C    push        ebx
 0009296D    add         esp,0FFFFFFF0
 00092970    mov         ebx,eax
 00092972    mov         eax,ebx
 00092974    call        TSpeedButton.Paint
 00092979    test        byte ptr [ebx+138],1
>00092980    je          000929CE
 00092982    mov         eax,dword ptr [ebx+3C]
 00092985    push        eax
 00092986    lea         eax,[esp+4]
 0009298A    push        eax
 0009298B    mov         ecx,dword ptr [ebx+38]
 0009298E    xor         edx,edx
 00092990    xor         eax,eax
 00092992    call        Bounds
 00092997    push        0FD
 00092999    push        0FD
 0009299B    lea         eax,[esp+8]
 0009299F    push        eax
 000929A0    call        user32.InflateRect
 000929A5    cmp         byte ptr [ebx+132],2
>000929AC    jne         000929BC
 000929AE    push        1
 000929B0    push        1
 000929B2    lea         eax,[esp+8]
 000929B6    push        eax
 000929B7    call        user32.OffsetRect
 000929BC    push        esp
 000929BD    mov         eax,dword ptr [ebx+114]
 000929C3    call        TCanvas.GetHandle
 000929C8    push        eax
 000929C9    call        user32.DrawFocusRect
 000929CE    add         esp,10
 000929D1    pop         ebx
 000929D2    ret
*}
end;

end.