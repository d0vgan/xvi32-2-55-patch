//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit CMHstBtn;

interface

uses
  SysUtils, Classes, Menus, StdCtrls;

type
  TSelectStrEvent = procedure(Sender:TObject; var s:String; var Accept:Boolean) of object;;
  TCMHistoryBtn = class(TSpeedButton)
  public
    OnDblClick:TNotifyEvent;//f134
    Items:TStrings;//f13C
    f140:TPopupMenu;//f140
    Edit:TCustomEdit;//f144
    CaseSensitive:Boolean;//f148
    HistoryCount:Integer;//f14C
    IniSection:String;//f150
    ColorHistoryBack:TColor;//f154
    ColorHistoryText:TColor;//f158
    ColorHLHistoryBack:TColor;//f15C
    ColorHLHistoryText:TColor;//f160
    OnAdd:TSelectStrEvent;//f164
    f166:word;//f166
    f168:dword;//f168
    OnSelect:TSelectStrEvent;//f16C
    f174:TKeyEvent;//f174
    f178:dword;//f178
    f17C:TNotifyEvent;//f17C
    f180:dword;//f180
    destructor Destroy; virtual;//0009C1CC
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//0009CC54
    procedure SetName(const Value:TComponentName); virtual;//v18//0009CE14
    constructor Create(AOwner:TComponent); virtual;//v2C//0009C08C
    //procedure v8C(?:?); virtual;//v8C//0009CC84
    function IsStoredColorHistoryBack(Value:TColor):Boolean;//0009C210
    function IsStoredColorHistoryText(Value:TColor):Boolean;//0009C220
    function IsStoredColorHLHistoryBack(Value:TColor):Boolean;//0009C230
    function IsStoredColorHLHistoryText(Value:TColor):Boolean;//0009C240
    function IsStoredHistoryCount(Value:Integer):Boolean;//0009C250
    procedure SetEdit(Value:TCustomEdit);//0009C260
    procedure SetHistoryCount(Value:Integer);//0009C86C
    procedure SetItems(Value:TStrings);//0009CC44
  end;
    //procedure sub_0009BEB4(?:?; ?:?);//0009BEB4
    //function sub_0009BF3C(?:?):?;//0009BF3C
    //procedure sub_0009C014(?:?; ?:?);//0009C014
    constructor Create(AOwner:TComponent);//0009C08C
    destructor Destroy;//0009C1CC
    //procedure sub_0009C3F4(?:?);//0009C3F4
    procedure sub_0009C51C(?:TCMHistoryBtn);//0009C51C
    //procedure sub_0009C558(?:?);//0009C558
    procedure sub_0009C880(?:TCMHistoryBtn);//0009C880
    //procedure sub_0009C958(?:?; ?:TIniFile);//0009C958
    //procedure sub_0009CA08(?:?; ?:TIniFile);//0009CA08
    //procedure sub_0009CAE4(?:TCMHistoryBtn; ?:?);//0009CAE4
    //procedure sub_0009CB94(?:TCMHistoryBtn; ?:?);//0009CB94
    procedure Notification(AComponent:TComponent; Operation:TOperation);//0009CC54
    //procedure sub_0009CC84(?:?);//0009CC84
    procedure SetName(const Value:TComponentName);//0009CE14

implementation

//0009BEB4
{*procedure sub_0009BEB4(?:?; ?:?);
begin
 0009BEB4    push        ebp
 0009BEB5    mov         ebp,esp
 0009BEB7    push        ecx
 0009BEB8    push        ebx
 0009BEB9    push        esi
 0009BEBA    mov         esi,edx
 0009BEBC    mov         dword ptr [ebp-4],eax
 0009BEBF    mov         eax,dword ptr [ebp-4]
 0009BEC2    call        @LStrAddRef
 0009BEC7    xor         eax,eax
 0009BEC9    push        ebp
 0009BECA    push        9BF22
 0009BECF    push        dword ptr fs:[eax]
 0009BED2    mov         dword ptr fs:[eax],esp
 0009BED5    mov         edx,dword ptr [ebp-4]
 0009BED8    mov         eax,9BF38;'='
 0009BEDD    call        @LStrPos
 0009BEE2    mov         ebx,eax
 0009BEE4    test        ebx,ebx
>0009BEE6    jne         0009BEF4
 0009BEE8    mov         eax,esi
 0009BEEA    mov         edx,dword ptr [ebp-4]
 0009BEED    call        @LStrLAsg
>0009BEF2    jmp         0009BF0C
 0009BEF4    push        esi
 0009BEF5    mov         eax,dword ptr [ebp-4]
 0009BEF8    call        @LStrLen
 0009BEFD    mov         ecx,eax
 0009BEFF    sub         ecx,ebx
 0009BF01    lea         edx,[ebx+1]
 0009BF04    mov         eax,dword ptr [ebp-4]
 0009BF07    call        @LStrCopy
 0009BF0C    xor         eax,eax
 0009BF0E    pop         edx
 0009BF0F    pop         ecx
 0009BF10    pop         ecx
 0009BF11    mov         dword ptr fs:[eax],edx
 0009BF14    push        9BF29
 0009BF19    lea         eax,[ebp-4]
 0009BF1C    call        @LStrClr
 0009BF21    ret
>0009BF22    jmp         @HandleFinally
>0009BF27    jmp         0009BF19
 0009BF29    pop         esi
 0009BF2A    pop         ebx
 0009BF2B    pop         ecx
 0009BF2C    pop         ebp
 0009BF2D    ret
end;*}

//0009BF3C
{*function sub_0009BF3C(?:?):?;
begin
 0009BF3C    push        ebp
 0009BF3D    mov         ebp,esp
 0009BF3F    push        0
 0009BF41    push        0
 0009BF43    push        0
 0009BF45    push        ebx
 0009BF46    push        esi
 0009BF47    push        edi
 0009BF48    mov         ebx,eax
 0009BF4A    xor         eax,eax
 0009BF4C    push        ebp
 0009BF4D    push        9C002
 0009BF52    push        dword ptr fs:[eax]
 0009BF55    mov         dword ptr fs:[eax],esp
 0009BF58    mov         eax,ebx
 0009BF5A    call        TStrings.BeginUpdate
 0009BF5F    mov         eax,ebx
 0009BF61    mov         edx,dword ptr [eax]
 0009BF63    call        dword ptr [edx+14]
 0009BF66    dec         eax
 0009BF67    test        eax,eax
>0009BF69    jl          0009BFDD
 0009BF6B    inc         eax
 0009BF6C    mov         dword ptr [ebp-8],eax
 0009BF6F    xor         esi,esi
 0009BF71    lea         ecx,[ebp-0C]
 0009BF74    mov         edx,esi
 0009BF76    mov         eax,ebx
 0009BF78    mov         edi,dword ptr [eax]
 0009BF7A    call        dword ptr [edi+0C]
 0009BF7D    mov         eax,dword ptr [ebp-0C]
 0009BF80    lea         edx,[ebp-4]
 0009BF83    call        0009BEB4
 0009BF88    mov         eax,dword ptr [ebp-4]
 0009BF8B    call        @LStrLen
 0009BF90    dec         eax
>0009BF91    jle         0009BFCB
 0009BF93    mov         eax,dword ptr [ebp-4]
 0009BF96    cmp         byte ptr [eax],22
>0009BF99    jne         0009BFCB
 0009BF9B    mov         eax,dword ptr [ebp-4]
 0009BF9E    call        @LStrLen
 0009BFA3    mov         edx,dword ptr [ebp-4]
 0009BFA6    cmp         byte ptr [edx+eax-1],22
>0009BFAB    jne         0009BFCB
 0009BFAD    lea         eax,[ebp-4]
 0009BFB0    push        eax
 0009BFB1    mov         eax,dword ptr [ebp-4]
 0009BFB4    call        @LStrLen
 0009BFB9    mov         ecx,eax
 0009BFBB    sub         ecx,2
 0009BFBE    mov         edx,2
 0009BFC3    mov         eax,dword ptr [ebp-4]
 0009BFC6    call        @LStrCopy
 0009BFCB    mov         ecx,dword ptr [ebp-4]
 0009BFCE    mov         edx,esi
 0009BFD0    mov         eax,ebx
 0009BFD2    mov         edi,dword ptr [eax]
 0009BFD4    call        dword ptr [edi+20]
 0009BFD7    inc         esi
 0009BFD8    dec         dword ptr [ebp-8]
>0009BFDB    jne         0009BF71
 0009BFDD    mov         eax,ebx
 0009BFDF    call        TStrings.EndUpdate
 0009BFE4    xor         eax,eax
 0009BFE6    pop         edx
 0009BFE7    pop         ecx
 0009BFE8    pop         ecx
 0009BFE9    mov         dword ptr fs:[eax],edx
 0009BFEC    push        9C009
 0009BFF1    lea         eax,[ebp-0C]
 0009BFF4    call        @LStrClr
 0009BFF9    lea         eax,[ebp-4]
 0009BFFC    call        @LStrClr
 0009C001    ret
>0009C002    jmp         @HandleFinally
>0009C007    jmp         0009BFF1
 0009C009    mov         eax,ebx
 0009C00B    pop         edi
 0009C00C    pop         esi
 0009C00D    pop         ebx
 0009C00E    mov         esp,ebp
 0009C010    pop         ebp
 0009C011    ret
end;*}

//0009C014
{*procedure sub_0009C014(?:?; ?:?);
begin
 0009C014    push        ebp
 0009C015    mov         ebp,esp
 0009C017    push        0
 0009C019    push        ebx
 0009C01A    push        esi
 0009C01B    mov         esi,edx
 0009C01D    mov         ebx,eax
 0009C01F    xor         eax,eax
 0009C021    push        ebp
 0009C022    push        9C070
 0009C027    push        dword ptr fs:[eax]
 0009C02A    mov         dword ptr fs:[eax],esp
 0009C02D    test        ebx,ebx
>0009C02F    jne         0009C051
 0009C031    lea         edx,[ebp-4]
 0009C034    mov         eax,[000B59E8];^Application:TApplication
 0009C039    mov         eax,dword ptr [eax]
 0009C03B    call        TApplication.GetExeName
 0009C040    mov         eax,dword ptr [ebp-4]
 0009C043    mov         ecx,esi
 0009C045    mov         edx,9C084;'.ini'
 0009C04A    call        ChangeFileExt
>0009C04F    jmp         0009C05A
 0009C051    mov         eax,esi
 0009C053    mov         edx,ebx
 0009C055    call        @LStrLAsg
 0009C05A    xor         eax,eax
 0009C05C    pop         edx
 0009C05D    pop         ecx
 0009C05E    pop         ecx
 0009C05F    mov         dword ptr fs:[eax],edx
 0009C062    push        9C077
 0009C067    lea         eax,[ebp-4]
 0009C06A    call        @LStrClr
 0009C06F    ret
>0009C070    jmp         @HandleFinally
>0009C075    jmp         0009C067
 0009C077    pop         esi
 0009C078    pop         ebx
 0009C079    pop         ecx
 0009C07A    pop         ebp
 0009C07B    ret
end;*}

//0009C08C
constructor TCMHistoryBtn.Create(AOwner:TComponent);
begin
{*
 0009C08C    push        ebp
 0009C08D    mov         ebp,esp
 0009C08F    push        ecx
 0009C090    push        ebx
 0009C091    push        esi
 0009C092    test        dl,dl
>0009C094    je          0009C09E
 0009C096    add         esp,0FFFFFFF0
 0009C099    call        @ClassCreate
 0009C09E    mov         byte ptr [ebp-1],dl
 0009C0A1    mov         ebx,eax
 0009C0A3    xor         edx,edx
 0009C0A5    mov         eax,ebx
 0009C0A7    call        TSpeedButton.Create
 0009C0AC    mov         edx,12
 0009C0B1    mov         eax,ebx
 0009C0B3    call        TControl.SetWidth
 0009C0B8    mov         edx,9C1B4;'Marlett'
 0009C0BD    mov         eax,dword ptr [ebx+58];TCMHistoryBtn.FFont:TFont
 0009C0C0    call        TFont.SetName
 0009C0C5    mov         edx,9
 0009C0CA    mov         eax,dword ptr [ebx+58];TCMHistoryBtn.FFont:TFont
 0009C0CD    call        TFont.SetSize
 0009C0D2    mov         edx,9C1C4;'6'
 0009C0D7    mov         eax,ebx
 0009C0D9    call        TControl.SetText
 0009C0DE    mov         dword ptr [ebx+108],ebx;TCMHistoryBtn.?f108:TMessageForm
 0009C0E4    mov         dword ptr [ebx+104],9C558;TCMHistoryBtn.FOnClick:TNotifyEvent sub_0009C558
 0009C0EE    mov         eax,[0009C1C8];0x80 gvar_0009C1C8
 0009C0F3    not         eax
 0009C0F5    and         eax,dword ptr [ebx+40];TCMHistoryBtn.FControlStyle:TControlStyle
 0009C0F8    mov         dword ptr [ebx+40],eax;TCMHistoryBtn.FControlStyle:TControlStyle
 0009C0FB    mov         dl,1
 0009C0FD    mov         eax,ebx
 0009C0FF    call        TControl.SetVisible
 0009C104    test        byte ptr [ebx+20],10;TCMHistoryBtn.FComponentState:TComponentState
>0009C108    jne         0009C12B
 0009C10A    mov         ecx,ebx
 0009C10C    mov         dl,1
 0009C10E    mov         eax,[00050454];TPopupMenu
 0009C113    call        TPopupMenu.Create;TPopupMenu.Create
 0009C118    mov         esi,eax
 0009C11A    mov         dword ptr [ebx+140],esi;TCMHistoryBtn.?f140:TPopupMenu
 0009C120    mov         dl,1
 0009C122    mov         eax,esi
 0009C124    call        TMenu.SetOwnerDraw
>0009C129    jmp         0009C133
 0009C12B    xor         eax,eax
 0009C12D    mov         dword ptr [ebx+140],eax;TCMHistoryBtn.?f140:TPopupMenu
 0009C133    mov         dl,1
 0009C135    mov         eax,[0001F340];TStringList
 0009C13A    call        TObject.Create;TStringList.Create
 0009C13F    mov         dword ptr [ebx+13C],eax;TCMHistoryBtn.Items:TStrings
 0009C145    mov         eax,[000B55FC];0x8 gvar_000B55FC
 0009C14A    mov         dword ptr [ebx+14C],eax;TCMHistoryBtn.HistoryCount:Integer
 0009C150    lea         eax,[ebx+150];TCMHistoryBtn.IniSection:String
 0009C156    call        @LStrClr
 0009C15B    mov         byte ptr [ebx+148],1;TCMHistoryBtn.CaseSensitive:Boolean
 0009C162    mov         eax,[000B5600];0x8000000F gvar_000B5600
 0009C167    mov         dword ptr [ebx+154],eax;TCMHistoryBtn.ColorHistoryBack:TColor
 0009C16D    mov         eax,[000B5604];0x80000012 gvar_000B5604
 0009C172    mov         dword ptr [ebx+158],eax;TCMHistoryBtn.ColorHistoryText:TColor
 0009C178    mov         eax,[000B5608];0x8000000D gvar_000B5608
 0009C17D    mov         dword ptr [ebx+15C],eax;TCMHistoryBtn.ColorHLHistoryBack:TColor
 0009C183    mov         eax,[000B560C];0x8000000E gvar_000B560C
 0009C188    mov         dword ptr [ebx+160],eax;TCMHistoryBtn.ColorHLHistoryText:TColor
 0009C18E    mov         eax,ebx
 0009C190    cmp         byte ptr [ebp-1],0
>0009C194    je          0009C1A5
 0009C196    call        @AfterConstruction
 0009C19B    pop         dword ptr fs:[0]
 0009C1A2    add         esp,0C
 0009C1A5    mov         eax,ebx
 0009C1A7    pop         esi
 0009C1A8    pop         ebx
 0009C1A9    pop         ecx
 0009C1AA    pop         ebp
 0009C1AB    ret
*}
end;

//0009C1CC
destructor TCMHistoryBtn.Destroy;
begin
{*
 0009C1CC    push        ebx
 0009C1CD    push        esi
 0009C1CE    call        @BeforeDestruction
 0009C1D3    mov         ebx,edx
 0009C1D5    mov         esi,eax
 0009C1D7    mov         eax,dword ptr [esi+13C];TCMHistoryBtn.Items:TStrings
 0009C1DD    call        TObject.Free
 0009C1E2    mov         eax,esi
 0009C1E4    call        0009C51C
 0009C1E9    mov         eax,dword ptr [esi+140];TCMHistoryBtn.?f140:TPopupMenu
 0009C1EF    call        TObject.Free
 0009C1F4    mov         edx,ebx
 0009C1F6    and         dl,0FC
 0009C1F9    mov         eax,esi
 0009C1FB    call        TSpeedButton.Destroy
 0009C200    test        bl,bl
>0009C202    jle         0009C20B
 0009C204    mov         eax,esi
 0009C206    call        @ClassDestroy
 0009C20B    pop         esi
 0009C20C    pop         ebx
 0009C20D    ret
*}
end;

//0009C210
function TCMHistoryBtn.IsStoredColorHistoryBack(Value:TColor):Boolean;
begin
{*
 0009C210    mov         eax,dword ptr [eax+154];TCMHistoryBtn.ColorHistoryBack:TColor
 0009C216    cmp         eax,dword ptr ds:[0B5600];0x8000000F gvar_000B5600
 0009C21C    setne       al
 0009C21F    ret
*}
end;

//0009C220
function TCMHistoryBtn.IsStoredColorHistoryText(Value:TColor):Boolean;
begin
{*
 0009C220    mov         eax,dword ptr [eax+158];TCMHistoryBtn.ColorHistoryText:TColor
 0009C226    cmp         eax,dword ptr ds:[0B5604];0x80000012 gvar_000B5604
 0009C22C    setne       al
 0009C22F    ret
*}
end;

//0009C230
function TCMHistoryBtn.IsStoredColorHLHistoryBack(Value:TColor):Boolean;
begin
{*
 0009C230    mov         eax,dword ptr [eax+15C];TCMHistoryBtn.ColorHLHistoryBack:TColor
 0009C236    cmp         eax,dword ptr ds:[0B5608];0x8000000D gvar_000B5608
 0009C23C    setne       al
 0009C23F    ret
*}
end;

//0009C240
function TCMHistoryBtn.IsStoredColorHLHistoryText(Value:TColor):Boolean;
begin
{*
 0009C240    mov         eax,dword ptr [eax+160];TCMHistoryBtn.ColorHLHistoryText:TColor
 0009C246    cmp         eax,dword ptr ds:[0B560C];0x8000000E gvar_000B560C
 0009C24C    setne       al
 0009C24F    ret
*}
end;

//0009C250
function TCMHistoryBtn.IsStoredHistoryCount(Value:Integer):Boolean;
begin
{*
 0009C250    mov         eax,dword ptr [eax+14C];TCMHistoryBtn.HistoryCount:Integer
 0009C256    cmp         eax,dword ptr ds:[0B55FC];0x8 gvar_000B55FC
 0009C25C    setne       al
 0009C25F    ret
*}
end;

//0009C260
procedure TCMHistoryBtn.SetEdit(Value:TCustomEdit);
begin
{*
 0009C260    push        ebx
 0009C261    push        esi
 0009C262    push        edi
 0009C263    push        ebp
 0009C264    add         esp,0FFFFFFF0
 0009C267    mov         edi,edx
 0009C269    mov         ebx,eax
 0009C26B    test        edi,edi
>0009C26D    je          0009C2FC
 0009C273    mov         eax,dword ptr [ebx+24];TCMHistoryBtn.FParent:TWinControl
 0009C276    call        TWinControl.GetControlCount
 0009C27B    mov         ebp,eax
 0009C27D    dec         ebp
 0009C27E    test        ebp,ebp
>0009C280    jl          0009C2FC
 0009C282    inc         ebp
 0009C283    xor         esi,esi
 0009C285    mov         edx,esi
 0009C287    mov         eax,dword ptr [ebx+24];TCMHistoryBtn.FParent:TWinControl
 0009C28A    call        TWinControl.GetControl
 0009C28F    mov         edx,dword ptr ds:[9BBC4];TCMHistoryBtn
 0009C295    call        @IsClass
 0009C29A    test        al,al
>0009C29C    je          0009C2F8
 0009C29E    mov         edx,esi
 0009C2A0    mov         eax,dword ptr [ebx+24];TCMHistoryBtn.FParent:TWinControl
 0009C2A3    call        TWinControl.GetControl
 0009C2A8    cmp         ebx,eax
>0009C2AA    je          0009C2F8
 0009C2AC    mov         edx,esi
 0009C2AE    mov         eax,dword ptr [ebx+24];TCMHistoryBtn.FParent:TWinControl
 0009C2B1    call        TWinControl.GetControl
 0009C2B6    cmp         edi,dword ptr [eax+144]
>0009C2BC    jne         0009C2F8
 0009C2BE    mov         eax,dword ptr [edi+8];TCustomEdit.Name:TComponentName
 0009C2C1    mov         dword ptr [esp],eax
 0009C2C4    mov         byte ptr [esp+4],0B
 0009C2C9    mov         edx,esi
 0009C2CB    mov         eax,dword ptr [ebx+24];TCMHistoryBtn.FParent:TWinControl
 0009C2CE    call        TWinControl.GetControl
 0009C2D3    mov         eax,dword ptr [eax+8];TControl.Name:TComponentName
 0009C2D6    mov         dword ptr [esp+8],eax
 0009C2DA    mov         byte ptr [esp+0C],0B
 0009C2DF    push        esp
 0009C2E0    push        1
 0009C2E2    mov         ecx,9C3D8;'%s is already linked to %s'
 0009C2E7    mov         dl,1
 0009C2E9    mov         eax,[000176E8];Exception
 0009C2EE    call        Exception.CreateFmt;Exception.Create
 0009C2F3    call        @RaiseExcept
 0009C2F8    inc         esi
 0009C2F9    dec         ebp
>0009C2FA    jne         0009C285
 0009C2FC    cmp         dword ptr [ebx+144],0;TCMHistoryBtn.Edit:TCustomEdit
>0009C303    je          0009C30D
 0009C305    xor         eax,eax
 0009C307    mov         dword ptr [ebx+144],eax;TCMHistoryBtn.Edit:TCustomEdit
 0009C30D    test        edi,edi
>0009C30F    je          0009C3C7
 0009C315    mov         eax,dword ptr [edi+24];TCustomEdit.FParent:TWinControl
 0009C318    cmp         eax,dword ptr [ebx+24];TCMHistoryBtn.FParent:TWinControl
>0009C31B    jne         0009C3C7
 0009C321    mov         eax,edi
 0009C323    mov         dword ptr [ebx+144],eax;TCMHistoryBtn.Edit:TCustomEdit
 0009C329    mov         edx,dword ptr [eax+30];TCustomEdit.Left:Integer
 0009C32C    add         edx,dword ptr [eax+38];TCustomEdit.Width:Integer
 0009C32F    mov         eax,ebx
 0009C331    call        TControl.SetLeft
 0009C336    mov         eax,dword ptr [ebx+144];TCMHistoryBtn.Edit:TCustomEdit
 0009C33C    mov         edx,dword ptr [eax+34];TCustomEdit.Top:Integer
 0009C33F    mov         eax,ebx
 0009C341    call        TControl.SetTop
 0009C346    mov         eax,dword ptr [ebx+144];TCMHistoryBtn.Edit:TCustomEdit
 0009C34C    mov         edx,dword ptr [eax+3C];TCustomEdit.Height:Integer
 0009C34F    mov         eax,ebx
 0009C351    call        TControl.SetHeight
 0009C356    mov         edx,ebx
 0009C358    mov         eax,edi
 0009C35A    call        TComponent.FreeNotification
 0009C35F    test        byte ptr [ebx+20],10;TCMHistoryBtn.FComponentState:TComponentState
>0009C363    jne         0009C3C7
 0009C365    mov         eax,dword ptr [ebx+144];TCMHistoryBtn.Edit:TCustomEdit
 0009C36B    mov         edx,dword ptr [eax+1B0];TCustomEdit.FOnKeyDown:TKeyEvent
 0009C371    mov         dword ptr [ebx+174],edx;TCMHistoryBtn.?f174:TKeyEvent
 0009C377    mov         edx,dword ptr [eax+1B4];TCustomEdit.?f1B4:TCMHistoryBtn
 0009C37D    mov         dword ptr [ebx+178],edx;TCMHistoryBtn.?f178:dword
 0009C383    mov         eax,dword ptr [ebx+144];TCMHistoryBtn.Edit:TCustomEdit
 0009C389    mov         edx,dword ptr [eax+1A0];TCustomEdit.FOnExit:TNotifyEvent
 0009C38F    mov         dword ptr [ebx+17C],edx;TCMHistoryBtn.?f17C:TNotifyEvent
 0009C395    mov         edx,dword ptr [eax+1A4];TCustomEdit.?f1A4:TCMHistoryBtn
 0009C39B    mov         dword ptr [ebx+180],edx;TCMHistoryBtn.?f180:dword
 0009C3A1    mov         eax,dword ptr [ebx+144];TCMHistoryBtn.Edit:TCustomEdit
 0009C3A7    mov         dword ptr [eax+1B4],ebx;TCustomEdit.?f1B4:TCMHistoryBtn
 0009C3AD    mov         dword ptr [eax+1B0],9C6D0;TCustomEdit.FOnKeyDown:TKeyEvent
 0009C3B7    mov         dword ptr [eax+1A4],ebx;TCustomEdit.?f1A4:TCMHistoryBtn
 0009C3BD    mov         dword ptr [eax+1A0],9CDA0;TCustomEdit.FOnExit:TNotifyEvent
 0009C3C7    add         esp,10
 0009C3CA    pop         ebp
 0009C3CB    pop         edi
 0009C3CC    pop         esi
 0009C3CD    pop         ebx
 0009C3CE    ret
*}
end;

//0009C3F4
{*procedure sub_0009C3F4(?:?);
begin
 0009C3F4    push        ebp
 0009C3F5    mov         ebp,esp
 0009C3F7    xor         ecx,ecx
 0009C3F9    push        ecx
 0009C3FA    push        ecx
 0009C3FB    push        ecx
 0009C3FC    push        ecx
 0009C3FD    push        ecx
 0009C3FE    push        ebx
 0009C3FF    push        esi
 0009C400    mov         ebx,eax
 0009C402    xor         eax,eax
 0009C404    push        ebp
 0009C405    push        9C4F6
 0009C40A    push        dword ptr fs:[eax]
 0009C40D    mov         dword ptr fs:[eax],esp
 0009C410    cmp         dword ptr [ebx+140],0
>0009C417    je          0009C4DB
 0009C41D    mov         eax,ebx
 0009C41F    call        0009C51C
 0009C424    mov         eax,dword ptr [ebx+13C]
 0009C42A    mov         edx,dword ptr [eax]
 0009C42C    call        dword ptr [edx+14]
 0009C42F    dec         eax
 0009C430    test        eax,eax
>0009C432    jl          0009C4DB
 0009C438    inc         eax
 0009C439    mov         dword ptr [ebp-8],eax
 0009C43C    mov         dword ptr [ebp-4],0
 0009C443    push        1
 0009C445    push        ebx
 0009C446    push        9C5E0
 0009C44B    push        0
 0009C44D    lea         edx,[ebp-10]
 0009C450    mov         eax,dword ptr [ebp-4]
 0009C453    call        IntToStr
 0009C458    mov         ecx,dword ptr [ebp-10]
 0009C45B    lea         eax,[ebp-0C]
 0009C45E    mov         edx,9C50C;'M'
 0009C463    call        @LStrCat3
 0009C468    mov         eax,dword ptr [ebp-0C]
 0009C46B    push        eax
 0009C46C    push        9C518;' '
 0009C471    lea         ecx,[ebp-14]
 0009C474    mov         edx,dword ptr [ebp-4]
 0009C477    mov         eax,dword ptr [ebx+13C]
 0009C47D    mov         esi,dword ptr [eax]
 0009C47F    call        dword ptr [esi+0C]
 0009C482    push        dword ptr [ebp-14]
 0009C485    push        9C518;' '
 0009C48A    lea         eax,[ebp-10]
 0009C48D    mov         edx,3
 0009C492    call        @LStrCatN
 0009C497    mov         eax,dword ptr [ebp-10]
 0009C49A    xor         ecx,ecx
 0009C49C    xor         edx,edx
 0009C49E    call        NewItem
 0009C4A3    mov         dword ptr [eax+80],ebx;TMenuItem.?f80:dword
 0009C4A9    mov         dword ptr [eax+7C],9CEC4;TMenuItem.OnDrawItem:TMenuDrawItemEvent
 0009C4B0    mov         dword ptr [eax+88],ebx;TMenuItem.?f88:dword
 0009C4B6    mov         dword ptr [eax+84],9CFF4;TMenuItem.OnMeasureItem:TMenuMeasureItemEvent
 0009C4C0    mov         edx,dword ptr [ebx+140]
 0009C4C6    mov         edx,dword ptr [edx+28]
 0009C4C9    xchg        eax,edx
 0009C4CA    call        TMenuItem.Add
 0009C4CF    inc         dword ptr [ebp-4]
 0009C4D2    dec         dword ptr [ebp-8]
>0009C4D5    jne         0009C443
 0009C4DB    xor         eax,eax
 0009C4DD    pop         edx
 0009C4DE    pop         ecx
 0009C4DF    pop         ecx
 0009C4E0    mov         dword ptr fs:[eax],edx
 0009C4E3    push        9C4FD
 0009C4E8    lea         eax,[ebp-14]
 0009C4EB    mov         edx,3
 0009C4F0    call        @LStrArrayClr
 0009C4F5    ret
>0009C4F6    jmp         @HandleFinally
>0009C4FB    jmp         0009C4E8
 0009C4FD    pop         esi
 0009C4FE    pop         ebx
 0009C4FF    mov         esp,ebp
 0009C501    pop         ebp
 0009C502    ret
end;*}

//0009C51C
procedure sub_0009C51C(?:TCMHistoryBtn);
begin
{*
 0009C51C    push        ebx
 0009C51D    push        esi
 0009C51E    mov         esi,eax
 0009C520    mov         ebx,dword ptr [esi+140];TCMHistoryBtn.?f140:TPopupMenu
 0009C526    test        ebx,ebx
>0009C528    je          0009C555
 0009C52A    mov         eax,dword ptr [ebx+28];TPopupMenu.Items:TMenuItem
 0009C52D    call        TMenuItem.GetCount
 0009C532    dec         eax
 0009C533    cmp         eax,0
>0009C536    jl          0009C555
 0009C538    mov         ebx,eax
 0009C53A    mov         eax,dword ptr [esi+140];TCMHistoryBtn.?f140:TPopupMenu
 0009C540    mov         eax,dword ptr [eax+28];TPopupMenu.Items:TMenuItem
 0009C543    mov         edx,ebx
 0009C545    call        TMenuItem.GetItem
 0009C54A    call        TObject.Free
 0009C54F    dec         ebx
 0009C550    cmp         ebx,0FFFFFFFF
>0009C553    jne         0009C53A
 0009C555    pop         esi
 0009C556    pop         ebx
 0009C557    ret
*}
end;

//0009C558
{*procedure sub_0009C558(?:?);
begin
 0009C558    push        ebx
 0009C559    push        esi
 0009C55A    add         esp,0FFFFFFF0
 0009C55D    mov         ebx,eax
 0009C55F    test        byte ptr [ebx+20],10
>0009C563    jne         0009C5D9
 0009C565    cmp         dword ptr [ebx+144],0
>0009C56C    je          0009C5D9
 0009C56E    mov         eax,dword ptr [ebx+144]
 0009C574    mov         edx,dword ptr [eax]
 0009C576    call        dword ptr [edx+50]
 0009C579    test        al,al
>0009C57B    je          0009C5D9
 0009C57D    mov         eax,dword ptr [ebx+144]
 0009C583    mov         edx,dword ptr [eax]
 0009C585    call        dword ptr [edx+0B4]
 0009C58B    xor         eax,eax
 0009C58D    mov         dword ptr [esp],eax
 0009C590    mov         esi,dword ptr [ebx+144]
 0009C596    mov         eax,dword ptr [esi+3C]
 0009C599    mov         dword ptr [esp+4],eax
 0009C59D    lea         ecx,[esp+8]
 0009C5A1    mov         edx,esp
 0009C5A3    mov         eax,esi
 0009C5A5    call        TControl.ClientToScreen
 0009C5AA    mov         eax,dword ptr [esp+8]
 0009C5AE    mov         dword ptr [esp],eax
 0009C5B1    mov         eax,dword ptr [esp+0C]
 0009C5B5    mov         dword ptr [esp+4],eax
 0009C5B9    mov         eax,ebx
 0009C5BB    call        0009C880
 0009C5C0    mov         eax,ebx
 0009C5C2    call        0009C3F4
 0009C5C7    mov         ecx,dword ptr [esp+4]
 0009C5CB    mov         edx,dword ptr [esp]
 0009C5CE    mov         eax,dword ptr [ebx+140]
 0009C5D4    mov         ebx,dword ptr [eax]
 0009C5D6    call        dword ptr [ebx+3C]
 0009C5D9    add         esp,10
 0009C5DC    pop         esi
 0009C5DD    pop         ebx
 0009C5DE    ret
end;*}

//0009C86C
procedure TCMHistoryBtn.SetHistoryCount(Value:Integer);
begin
{*
 0009C86C    cmp         edx,dword ptr [eax+14C];TCMHistoryBtn.HistoryCount:Integer
>0009C872    je          0009C87F
 0009C874    mov         dword ptr [eax+14C],edx;TCMHistoryBtn.HistoryCount:Integer
 0009C87A    call        0009C880
 0009C87F    ret
*}
end;

//0009C880
procedure sub_0009C880(?:TCMHistoryBtn);
begin
{*
 0009C880    push        ebp
 0009C881    mov         ebp,esp
 0009C883    push        0
 0009C885    push        0
 0009C887    push        ebx
 0009C888    push        esi
 0009C889    push        edi
 0009C88A    mov         esi,eax
 0009C88C    xor         eax,eax
 0009C88E    push        ebp
 0009C88F    push        9C948
 0009C894    push        dword ptr fs:[eax]
 0009C897    mov         dword ptr fs:[eax],esp
 0009C89A    mov         eax,dword ptr [esi+13C];TCMHistoryBtn.Items:TStrings
 0009C8A0    mov         edx,dword ptr [eax]
 0009C8A2    call        dword ptr [edx+14];TStrings.GetCount
 0009C8A5    mov         ebx,eax
 0009C8A7    dec         ebx
 0009C8A8    cmp         ebx,1
>0009C8AB    jl          0009C8F0
 0009C8AD    lea         ecx,[ebp-4]
 0009C8B0    mov         edx,ebx
 0009C8B2    mov         eax,dword ptr [esi+13C];TCMHistoryBtn.Items:TStrings
 0009C8B8    mov         edi,dword ptr [eax]
 0009C8BA    call        dword ptr [edi+0C];TStrings.Get
 0009C8BD    mov         eax,dword ptr [ebp-4]
 0009C8C0    push        eax
 0009C8C1    lea         ecx,[ebp-8]
 0009C8C4    xor         edx,edx
 0009C8C6    mov         eax,dword ptr [esi+13C];TCMHistoryBtn.Items:TStrings
 0009C8CC    mov         edi,dword ptr [eax]
 0009C8CE    call        dword ptr [edi+0C];TStrings.Get
 0009C8D1    mov         edx,dword ptr [ebp-8]
 0009C8D4    pop         eax
 0009C8D5    call        @LStrCmp
>0009C8DA    jne         0009C8EB
 0009C8DC    mov         edx,ebx
 0009C8DE    mov         eax,dword ptr [esi+13C];TCMHistoryBtn.Items:TStrings
 0009C8E4    mov         ecx,dword ptr [eax]
 0009C8E6    call        dword ptr [ecx+44];TStrings.Delete
>0009C8E9    jmp         0009C8F0
 0009C8EB    dec         ebx
 0009C8EC    test        ebx,ebx
>0009C8EE    jne         0009C8AD
 0009C8F0    mov         eax,dword ptr [esi+13C];TCMHistoryBtn.Items:TStrings
 0009C8F6    mov         edx,dword ptr [eax]
 0009C8F8    call        dword ptr [edx+14];TStrings.GetCount
 0009C8FB    cmp         eax,dword ptr [esi+14C];TCMHistoryBtn.HistoryCount:Integer
>0009C901    jle         0009C92D
 0009C903    mov         eax,dword ptr [esi+13C];TCMHistoryBtn.Items:TStrings
 0009C909    mov         edx,dword ptr [eax]
 0009C90B    call        dword ptr [edx+14];TStrings.GetCount
 0009C90E    mov         ebx,eax
 0009C910    dec         ebx
 0009C911    mov         edi,dword ptr [esi+14C];TCMHistoryBtn.HistoryCount:Integer
 0009C917    sub         edi,ebx
>0009C919    jg          0009C92D
 0009C91B    dec         edi
 0009C91C    mov         edx,ebx
 0009C91E    mov         eax,dword ptr [esi+13C];TCMHistoryBtn.Items:TStrings
 0009C924    mov         ecx,dword ptr [eax]
 0009C926    call        dword ptr [ecx+44];TStrings.Delete
 0009C929    dec         ebx
 0009C92A    inc         edi
>0009C92B    jne         0009C91C
 0009C92D    xor         eax,eax
 0009C92F    pop         edx
 0009C930    pop         ecx
 0009C931    pop         ecx
 0009C932    mov         dword ptr fs:[eax],edx
 0009C935    push        9C94F
 0009C93A    lea         eax,[ebp-8]
 0009C93D    mov         edx,2
 0009C942    call        @LStrArrayClr
 0009C947    ret
>0009C948    jmp         @HandleFinally
>0009C94D    jmp         0009C93A
 0009C94F    pop         edi
 0009C950    pop         esi
 0009C951    pop         ebx
 0009C952    pop         ecx
 0009C953    pop         ecx
 0009C954    pop         ebp
 0009C955    ret
*}
end;

//0009C958
{*procedure sub_0009C958(?:?; ?:TIniFile);
begin
 0009C958    push        ebp
 0009C959    mov         ebp,esp
 0009C95B    push        0
 0009C95D    push        ebx
 0009C95E    push        esi
 0009C95F    mov         esi,edx
 0009C961    mov         ebx,eax
 0009C963    xor         eax,eax
 0009C965    push        ebp
 0009C966    push        9C9FC
 0009C96B    push        dword ptr fs:[eax]
 0009C96E    mov         dword ptr fs:[eax],esp
 0009C971    cmp         dword ptr [ebx+150],0
>0009C978    je          0009C9E6
 0009C97A    mov         eax,dword ptr [ebx+13C]
 0009C980    mov         edx,dword ptr [eax]
 0009C982    call        dword ptr [edx+40]
 0009C985    mov         ecx,dword ptr [ebx+13C]
 0009C98B    mov         edx,dword ptr [ebx+150]
 0009C991    mov         eax,esi
 0009C993    mov         esi,dword ptr [eax]
 0009C995    call        dword ptr [esi+40]
 0009C998    mov         eax,dword ptr [ebx+13C]
 0009C99E    call        0009BF3C
 0009C9A3    mov         eax,ebx
 0009C9A5    call        0009C880
 0009C9AA    test        byte ptr [ebx+20],10
>0009C9AE    jne         0009C9E6
 0009C9B0    cmp         dword ptr [ebx+144],0
>0009C9B7    je          0009C9E6
 0009C9B9    mov         eax,dword ptr [ebx+13C]
 0009C9BF    mov         edx,dword ptr [eax]
 0009C9C1    call        dword ptr [edx+14]
 0009C9C4    test        eax,eax
>0009C9C6    jle         0009C9E6
 0009C9C8    lea         ecx,[ebp-4]
 0009C9CB    xor         edx,edx
 0009C9CD    mov         eax,dword ptr [ebx+13C]
 0009C9D3    mov         esi,dword ptr [eax]
 0009C9D5    call        dword ptr [esi+0C]
 0009C9D8    mov         edx,dword ptr [ebp-4]
 0009C9DB    mov         eax,dword ptr [ebx+144]
 0009C9E1    call        TControl.SetText
 0009C9E6    xor         eax,eax
 0009C9E8    pop         edx
 0009C9E9    pop         ecx
 0009C9EA    pop         ecx
 0009C9EB    mov         dword ptr fs:[eax],edx
 0009C9EE    push        9CA03
 0009C9F3    lea         eax,[ebp-4]
 0009C9F6    call        @LStrClr
 0009C9FB    ret
>0009C9FC    jmp         @HandleFinally
>0009CA01    jmp         0009C9F3
 0009CA03    pop         esi
 0009CA04    pop         ebx
 0009CA05    pop         ecx
 0009CA06    pop         ebp
 0009CA07    ret
end;*}

//0009CA08
{*procedure sub_0009CA08(?:?; ?:TIniFile);
begin
 0009CA08    push        ebp
 0009CA09    mov         ebp,esp
 0009CA0B    add         esp,0FFFFFFF0
 0009CA0E    push        ebx
 0009CA0F    push        esi
 0009CA10    push        edi
 0009CA11    xor         ecx,ecx
 0009CA13    mov         dword ptr [ebp-0C],ecx
 0009CA16    mov         dword ptr [ebp-10],ecx
 0009CA19    mov         dword ptr [ebp-4],edx
 0009CA1C    mov         ebx,eax
 0009CA1E    xor         eax,eax
 0009CA20    push        ebp
 0009CA21    push        9CACA
 0009CA26    push        dword ptr fs:[eax]
 0009CA29    mov         dword ptr fs:[eax],esp
 0009CA2C    cmp         dword ptr [ebx+150],0
>0009CA33    je          0009CAAF
 0009CA35    mov         edx,dword ptr [ebx+150]
 0009CA3B    mov         eax,dword ptr [ebp-4]
 0009CA3E    mov         ecx,dword ptr [eax]
 0009CA40    call        dword ptr [ecx+44]
 0009CA43    mov         eax,ebx
 0009CA45    call        0009C880
 0009CA4A    mov         eax,dword ptr [ebx+13C]
 0009CA50    mov         edx,dword ptr [eax]
 0009CA52    call        dword ptr [edx+14]
 0009CA55    dec         eax
 0009CA56    test        eax,eax
>0009CA58    jl          0009CAAF
 0009CA5A    inc         eax
 0009CA5B    mov         dword ptr [ebp-8],eax
 0009CA5E    xor         esi,esi
 0009CA60    push        9CAE0;'"'
 0009CA65    lea         ecx,[ebp-10]
 0009CA68    mov         edx,esi
 0009CA6A    mov         eax,dword ptr [ebx+13C]
 0009CA70    mov         edi,dword ptr [eax]
 0009CA72    call        dword ptr [edi+0C]
 0009CA75    push        dword ptr [ebp-10]
 0009CA78    push        9CAE0;'"'
 0009CA7D    lea         eax,[ebp-0C]
 0009CA80    mov         edx,3
 0009CA85    call        @LStrCatN
 0009CA8A    mov         eax,dword ptr [ebp-0C]
 0009CA8D    push        eax
 0009CA8E    lea         edx,[ebp-10]
 0009CA91    mov         eax,esi
 0009CA93    call        IntToStr
 0009CA98    mov         ecx,dword ptr [ebp-10]
 0009CA9B    mov         edx,dword ptr [ebx+150]
 0009CAA1    mov         eax,dword ptr [ebp-4]
 0009CAA4    mov         edi,dword ptr [eax]
 0009CAA6    call        dword ptr [edi+4]
 0009CAA9    inc         esi
 0009CAAA    dec         dword ptr [ebp-8]
>0009CAAD    jne         0009CA60
 0009CAAF    xor         eax,eax
 0009CAB1    pop         edx
 0009CAB2    pop         ecx
 0009CAB3    pop         ecx
 0009CAB4    mov         dword ptr fs:[eax],edx
 0009CAB7    push        9CAD1
 0009CABC    lea         eax,[ebp-10]
 0009CABF    mov         edx,2
 0009CAC4    call        @LStrArrayClr
 0009CAC9    ret
>0009CACA    jmp         @HandleFinally
>0009CACF    jmp         0009CABC
 0009CAD1    pop         edi
 0009CAD2    pop         esi
 0009CAD3    pop         ebx
 0009CAD4    mov         esp,ebp
 0009CAD6    pop         ebp
 0009CAD7    ret
end;*}

//0009CAE4
{*procedure sub_0009CAE4(?:TCMHistoryBtn; ?:?);
begin
 0009CAE4    push        ebp
 0009CAE5    mov         ebp,esp
 0009CAE7    add         esp,0FFFFFFF4
 0009CAEA    push        ebx
 0009CAEB    xor         ecx,ecx
 0009CAED    mov         dword ptr [ebp-0C],ecx
 0009CAF0    mov         dword ptr [ebp-4],edx
 0009CAF3    mov         ebx,eax
 0009CAF5    mov         eax,dword ptr [ebp-4]
 0009CAF8    call        @LStrAddRef
 0009CAFD    xor         eax,eax
 0009CAFF    push        ebp
 0009CB00    push        9CB86
 0009CB05    push        dword ptr fs:[eax]
 0009CB08    mov         dword ptr fs:[eax],esp
 0009CB0B    lea         edx,[ebp-0C]
 0009CB0E    mov         eax,dword ptr [ebp-4]
 0009CB11    call        0009C014
 0009CB16    mov         edx,dword ptr [ebp-0C]
 0009CB19    lea         eax,[ebp-4]
 0009CB1C    call        @LStrLAsg
 0009CB21    mov         ecx,dword ptr [ebp-4]
 0009CB24    mov         dl,1
 0009CB26    mov         eax,[0007792C];TIniFile
 0009CB2B    call        TCustomIniFile.Create;TIniFile.Create
 0009CB30    mov         dword ptr [ebp-8],eax
 0009CB33    xor         eax,eax
 0009CB35    push        ebp
 0009CB36    push        9CB61
 0009CB3B    push        dword ptr fs:[eax]
 0009CB3E    mov         dword ptr fs:[eax],esp
 0009CB41    mov         edx,dword ptr [ebp-8]
 0009CB44    mov         eax,ebx
 0009CB46    call        0009C958
 0009CB4B    xor         eax,eax
 0009CB4D    pop         edx
 0009CB4E    pop         ecx
 0009CB4F    pop         ecx
 0009CB50    mov         dword ptr fs:[eax],edx
 0009CB53    push        9CB68
 0009CB58    mov         eax,dword ptr [ebp-8]
 0009CB5B    call        TObject.Free
 0009CB60    ret
>0009CB61    jmp         @HandleFinally
>0009CB66    jmp         0009CB58
 0009CB68    xor         eax,eax
 0009CB6A    pop         edx
 0009CB6B    pop         ecx
 0009CB6C    pop         ecx
 0009CB6D    mov         dword ptr fs:[eax],edx
 0009CB70    push        9CB8D
 0009CB75    lea         eax,[ebp-0C]
 0009CB78    call        @LStrClr
 0009CB7D    lea         eax,[ebp-4]
 0009CB80    call        @LStrClr
 0009CB85    ret
>0009CB86    jmp         @HandleFinally
>0009CB8B    jmp         0009CB75
 0009CB8D    pop         ebx
 0009CB8E    mov         esp,ebp
 0009CB90    pop         ebp
 0009CB91    ret
end;*}

//0009CB94
{*procedure sub_0009CB94(?:TCMHistoryBtn; ?:?);
begin
 0009CB94    push        ebp
 0009CB95    mov         ebp,esp
 0009CB97    add         esp,0FFFFFFF4
 0009CB9A    push        ebx
 0009CB9B    xor         ecx,ecx
 0009CB9D    mov         dword ptr [ebp-0C],ecx
 0009CBA0    mov         dword ptr [ebp-4],edx
 0009CBA3    mov         ebx,eax
 0009CBA5    mov         eax,dword ptr [ebp-4]
 0009CBA8    call        @LStrAddRef
 0009CBAD    xor         eax,eax
 0009CBAF    push        ebp
 0009CBB0    push        9CC36
 0009CBB5    push        dword ptr fs:[eax]
 0009CBB8    mov         dword ptr fs:[eax],esp
 0009CBBB    lea         edx,[ebp-0C]
 0009CBBE    mov         eax,dword ptr [ebp-4]
 0009CBC1    call        0009C014
 0009CBC6    mov         edx,dword ptr [ebp-0C]
 0009CBC9    lea         eax,[ebp-4]
 0009CBCC    call        @LStrLAsg
 0009CBD1    mov         ecx,dword ptr [ebp-4]
 0009CBD4    mov         dl,1
 0009CBD6    mov         eax,[0007792C];TIniFile
 0009CBDB    call        TCustomIniFile.Create;TIniFile.Create
 0009CBE0    mov         dword ptr [ebp-8],eax
 0009CBE3    xor         eax,eax
 0009CBE5    push        ebp
 0009CBE6    push        9CC11
 0009CBEB    push        dword ptr fs:[eax]
 0009CBEE    mov         dword ptr fs:[eax],esp
 0009CBF1    mov         edx,dword ptr [ebp-8]
 0009CBF4    mov         eax,ebx
 0009CBF6    call        0009CA08
 0009CBFB    xor         eax,eax
 0009CBFD    pop         edx
 0009CBFE    pop         ecx
 0009CBFF    pop         ecx
 0009CC00    mov         dword ptr fs:[eax],edx
 0009CC03    push        9CC18
 0009CC08    mov         eax,dword ptr [ebp-8]
 0009CC0B    call        TObject.Free
 0009CC10    ret
>0009CC11    jmp         @HandleFinally
>0009CC16    jmp         0009CC08
 0009CC18    xor         eax,eax
 0009CC1A    pop         edx
 0009CC1B    pop         ecx
 0009CC1C    pop         ecx
 0009CC1D    mov         dword ptr fs:[eax],edx
 0009CC20    push        9CC3D
 0009CC25    lea         eax,[ebp-0C]
 0009CC28    call        @LStrClr
 0009CC2D    lea         eax,[ebp-4]
 0009CC30    call        @LStrClr
 0009CC35    ret
>0009CC36    jmp         @HandleFinally
>0009CC3B    jmp         0009CC25
 0009CC3D    pop         ebx
 0009CC3E    mov         esp,ebp
 0009CC40    pop         ebp
 0009CC41    ret
end;*}

//0009CC44
procedure TCMHistoryBtn.SetItems(Value:TStrings);
begin
{*
 0009CC44    push        esi
 0009CC45    mov         esi,eax
 0009CC47    mov         eax,dword ptr [esi+13C];TCMHistoryBtn.Items:TStrings
 0009CC4D    mov         ecx,dword ptr [eax]
 0009CC4F    call        dword ptr [ecx+8];TStrings.Assign
 0009CC52    pop         esi
 0009CC53    ret
*}
end;

//0009CC54
procedure TCMHistoryBtn.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 0009CC54    push        ebx
 0009CC55    push        esi
 0009CC56    push        edi
 0009CC57    mov         ebx,ecx
 0009CC59    mov         esi,edx
 0009CC5B    mov         edi,eax
 0009CC5D    mov         ecx,ebx
 0009CC5F    mov         edx,esi
 0009CC61    mov         eax,edi
 0009CC63    call        TControl.Notification
 0009CC68    cmp         bl,1
>0009CC6B    jne         0009CC7D
 0009CC6D    cmp         esi,dword ptr [edi+144];TCMHistoryBtn.Edit:TCustomEdit
>0009CC73    jne         0009CC7D
 0009CC75    xor         eax,eax
 0009CC77    mov         dword ptr [edi+144],eax;TCMHistoryBtn.Edit:TCustomEdit
 0009CC7D    pop         edi
 0009CC7E    pop         esi
 0009CC7F    pop         ebx
 0009CC80    ret
*}
end;

//0009CC84
{*procedure sub_0009CC84(?:?);
begin
 0009CC84    push        ebp
 0009CC85    mov         ebp,esp
 0009CC87    add         esp,0FFFFFFEC
 0009CC8A    push        ebx
 0009CC8B    push        esi
 0009CC8C    push        edi
 0009CC8D    xor         ecx,ecx
 0009CC8F    mov         dword ptr [ebp-14],ecx
 0009CC92    mov         dword ptr [ebp-0C],ecx
 0009CC95    mov         esi,edx
 0009CC97    mov         ebx,eax
 0009CC99    xor         eax,eax
 0009CC9B    push        ebp
 0009CC9C    push        9CD92
 0009CCA1    push        dword ptr fs:[eax]
 0009CCA4    mov         dword ptr fs:[eax],esp
 0009CCA7    lea         eax,[ebp-0C]
 0009CCAA    mov         edx,esi
 0009CCAC    call        @LStrLAsg
 0009CCB1    cmp         dword ptr [ebp-0C],0
 0009CCB5    setne       byte ptr [ebp-5]
 0009CCB9    cmp         word ptr [ebx+166],0;TCMHistoryBtn.?f166:word
>0009CCC1    je          0009CCD8
 0009CCC3    lea         eax,[ebp-5]
 0009CCC6    push        eax
 0009CCC7    lea         ecx,[ebp-0C]
 0009CCCA    mov         edx,ebx
 0009CCCC    mov         eax,dword ptr [ebx+168];TCMHistoryBtn.?f168:dword
 0009CCD2    call        dword ptr [ebx+164];TCMHistoryBtn.OnAdd
 0009CCD8    cmp         byte ptr [ebp-5],0
>0009CCDC    je          0009CD74
 0009CCE2    cmp         byte ptr [ebx+148],0;TCMHistoryBtn.CaseSensitive:Boolean
>0009CCE9    je          0009CD34
 0009CCEB    mov         dword ptr [ebp-4],0FFFFFFFF
 0009CCF2    mov         eax,dword ptr [ebx+13C];TCMHistoryBtn.Items:TStrings
 0009CCF8    mov         edx,dword ptr [eax]
 0009CCFA    call        dword ptr [edx+14];TStrings.GetCount
 0009CCFD    dec         eax
 0009CCFE    test        eax,eax
>0009CD00    jl          0009CD45
 0009CD02    inc         eax
 0009CD03    mov         dword ptr [ebp-10],eax
 0009CD06    xor         esi,esi
 0009CD08    lea         ecx,[ebp-14]
 0009CD0B    mov         edx,esi
 0009CD0D    mov         eax,dword ptr [ebx+13C];TCMHistoryBtn.Items:TStrings
 0009CD13    mov         edi,dword ptr [eax]
 0009CD15    call        dword ptr [edi+0C];TStrings.Get
 0009CD18    mov         eax,dword ptr [ebp-14]
 0009CD1B    mov         edx,dword ptr [ebp-0C]
 0009CD1E    call        AnsiCompareStr
 0009CD23    test        eax,eax
>0009CD25    jne         0009CD2C
 0009CD27    mov         dword ptr [ebp-4],esi
>0009CD2A    jmp         0009CD45
 0009CD2C    inc         esi
 0009CD2D    dec         dword ptr [ebp-10]
>0009CD30    jne         0009CD08
>0009CD32    jmp         0009CD45
 0009CD34    mov         edx,dword ptr [ebp-0C]
 0009CD37    mov         eax,dword ptr [ebx+13C];TCMHistoryBtn.Items:TStrings
 0009CD3D    mov         ecx,dword ptr [eax]
 0009CD3F    call        dword ptr [ecx+50];TStrings.IndexOf
 0009CD42    mov         dword ptr [ebp-4],eax
 0009CD45    cmp         dword ptr [ebp-4],0FFFFFFFF
>0009CD49    jne         0009CD64
 0009CD4B    mov         ecx,dword ptr [ebp-0C]
 0009CD4E    xor         edx,edx
 0009CD50    mov         eax,dword ptr [ebx+13C];TCMHistoryBtn.Items:TStrings
 0009CD56    mov         esi,dword ptr [eax]
 0009CD58    call        dword ptr [esi+54];TStrings.Insert
 0009CD5B    mov         eax,ebx
 0009CD5D    call        0009C880
>0009CD62    jmp         0009CD74
 0009CD64    mov         ecx,dword ptr [ebp-4]
 0009CD67    xor         edx,edx
 0009CD69    mov         eax,dword ptr [ebx+13C];TCMHistoryBtn.Items:TStrings
 0009CD6F    mov         ebx,dword ptr [eax]
 0009CD71    call        dword ptr [ebx+48];TStrings.Exchange
 0009CD74    xor         eax,eax
 0009CD76    pop         edx
 0009CD77    pop         ecx
 0009CD78    pop         ecx
 0009CD79    mov         dword ptr fs:[eax],edx
 0009CD7C    push        9CD99
 0009CD81    lea         eax,[ebp-14]
 0009CD84    call        @LStrClr
 0009CD89    lea         eax,[ebp-0C]
 0009CD8C    call        @LStrClr
 0009CD91    ret
>0009CD92    jmp         @HandleFinally
>0009CD97    jmp         0009CD81
 0009CD99    pop         edi
 0009CD9A    pop         esi
 0009CD9B    pop         ebx
 0009CD9C    mov         esp,ebp
 0009CD9E    pop         ebp
 0009CD9F    ret
end;*}

//0009CE14
procedure TCMHistoryBtn.SetName(const Value:TComponentName);
begin
{*
 0009CE14    push        ebx
 0009CE15    push        esi
 0009CE16    mov         esi,edx
 0009CE18    mov         ebx,eax
 0009CE1A    test        byte ptr [ebx+20],10;TCMHistoryBtn.FComponentState:TComponentState
>0009CE1E    je          0009CE48
 0009CE20    cmp         dword ptr [ebx+150],0;TCMHistoryBtn.IniSection:String
>0009CE27    je          0009CE3B
 0009CE29    mov         edx,dword ptr [ebx+8];TCMHistoryBtn.Name:TComponentName
 0009CE2C    mov         eax,dword ptr [ebx+150];TCMHistoryBtn.IniSection:String
 0009CE32    call        AnsiCompareText
 0009CE37    test        eax,eax
>0009CE39    jne         0009CE48
 0009CE3B    lea         eax,[ebx+150];TCMHistoryBtn.IniSection:String
 0009CE41    mov         edx,esi
 0009CE43    call        @LStrAsg
 0009CE48    mov         edx,esi
 0009CE4A    mov         eax,ebx
 0009CE4C    call        TControl.SetName
 0009CE51    pop         esi
 0009CE52    pop         ebx
 0009CE53    ret
*}
end;

Initialization
//0009D0E0
{*
 0009D0E0    sub         dword ptr ds:[0B7020],1
>0009D0E7    jae         0009D0FD
 0009D0E9    mov         eax,[00050454];TPopupMenu
 0009D0EE    call        RegisterClass
 0009D0F3    mov         eax,[000348C4];TCustomEdit
 0009D0F8    call        RegisterClass
 0009D0FD    ret
*}
Finalization
end.