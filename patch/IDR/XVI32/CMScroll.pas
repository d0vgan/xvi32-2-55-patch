//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit CMScroll;

interface

uses
  SysUtils, Classes, XVI32_Main;

type
  TCMScrollBar = class(TWinControl)
  public
    Kind:TScrollBarKind;//f1EC
    PageSize:Cardinal;//f1F0
    Position:Integer;//f1F4
    Min:Integer;//f1F8
    Max:Integer;//f1FC
    SmallChange:TCMScrollBarInc;//f200
    LargeChange:TCMScrollBarInc;//f204
    OnChange:TNotifyEvent;//f208
    f20A:word;//f20A
    f20C:dword;//f20C
    OnScroll:TScrollEvent;//f210
    f212:word;//f212
    f214:TFormMain;//f214
    constructor Create(AOwner:TComponent); virtual;//v2C//0008C100
    procedure CreateParams(var Params:TCreateParams); virtual;//v94//0008C1A4
    procedure CreateWnd; virtual;//v9C//0008C1E4
    procedure sub_0008C5AC; dynamic;//0008C5AC
    procedure sub_0008C5B4; dynamic;//0008C5B4
    //procedure sub_0008C450(?:?); dynamic;//0008C450
    procedure sub_0008C430; dynamic;//0008C430
    procedure SetKind(Value:TScrollBarKind);//0008C244
    procedure SetPosition(Value:Integer);//0008C3C0
    procedure SetMin(Value:Integer);//0008C3DC
    procedure SetMax(Value:Integer);//0008C3F8
    procedure SetPageSize(Value:Cardinal);//0008C414
  end;
    constructor Create(AOwner:TComponent);//0008C100
    procedure CreateParams(var Params:TCreateParams);//0008C1A4
    procedure CreateWnd;//0008C1E4
    //procedure sub_0008C280(?:TCMScrollBar; ?:Integer; ?:Integer; ?:?; ?:?);//0008C280
    procedure sub_0008C430;//0008C430
    //procedure sub_0008C450(?:?);//0008C450
    //procedure sub_0008C470(?:TCMScrollBar; ?:?);//0008C470
    procedure sub_0008C5AC;//0008C5AC
    procedure sub_0008C5B4;//0008C5B4

implementation

//0008C100
constructor TCMScrollBar.Create(AOwner:TComponent);
begin
{*
 0008C100    push        ebx
 0008C101    push        esi
 0008C102    test        dl,dl
>0008C104    je          0008C10E
 0008C106    add         esp,0FFFFFFF0
 0008C109    call        @ClassCreate
 0008C10E    mov         ebx,edx
 0008C110    mov         esi,eax
 0008C112    xor         edx,edx
 0008C114    mov         eax,esi
 0008C116    call        TWinControl.Create
 0008C11B    mov         byte ptr [esi+1EC],0;TCMScrollBar.Kind:TScrollBarKind
 0008C122    mov         edx,79
 0008C127    mov         eax,esi
 0008C129    call        TControl.SetWidth
 0008C12E    push        3
 0008C130    call        user32.GetSystemMetrics
 0008C135    mov         edx,eax
 0008C137    mov         eax,esi
 0008C139    call        TControl.SetHeight
 0008C13E    mov         eax,[0008C1A0];0x90 gvar_0008C1A0
 0008C143    mov         dword ptr [esi+40],eax;TCMScrollBar.FControlStyle:TControlStyle
 0008C146    mov         dl,1
 0008C148    mov         eax,esi
 0008C14A    call        TWinControl.SetTabStop
 0008C14F    xor         eax,eax
 0008C151    mov         dword ptr [esi+1F4],eax;TCMScrollBar.Position:Integer
 0008C157    xor         eax,eax
 0008C159    mov         dword ptr [esi+1F8],eax;TCMScrollBar.Min:Integer
 0008C15F    mov         dword ptr [esi+1FC],64;TCMScrollBar.Max:Integer
 0008C169    mov         dword ptr [esi+200],1;TCMScrollBar.SmallChange:TCMScrollBarInc
 0008C173    mov         dword ptr [esi+204],1;TCMScrollBar.LargeChange:TCMScrollBarInc
 0008C17D    xor         eax,eax
 0008C17F    mov         dword ptr [esi+1F0],eax;TCMScrollBar.PageSize:Cardinal
 0008C185    mov         eax,esi
 0008C187    test        bl,bl
>0008C189    je          0008C19A
 0008C18B    call        @AfterConstruction
 0008C190    pop         dword ptr fs:[0]
 0008C197    add         esp,0C
 0008C19A    mov         eax,esi
 0008C19C    pop         esi
 0008C19D    pop         ebx
 0008C19E    ret
*}
end;

//0008C1A4
procedure TCMScrollBar.CreateParams(var Params:TCreateParams);
begin
{*
 0008C1A4    push        ebx
 0008C1A5    push        esi
 0008C1A6    mov         esi,edx
 0008C1A8    mov         ebx,eax
 0008C1AA    mov         edx,esi
 0008C1AC    mov         eax,ebx
 0008C1AE    call        TWinControl.CreateParams
 0008C1B3    mov         ecx,8C1D8;'SCROLLBAR'
 0008C1B8    mov         edx,esi
 0008C1BA    mov         eax,ebx
 0008C1BC    call        TWinControl.CreateSubClass
 0008C1C1    xor         eax,eax
 0008C1C3    mov         al,byte ptr [ebx+1EC];TCMScrollBar.Kind:TScrollBarKind
 0008C1C9    mov         eax,dword ptr [eax*4+0B4EF0]
 0008C1D0    or          dword ptr [esi+4],eax;TCreateParams.Style:DWORD
 0008C1D3    pop         esi
 0008C1D4    pop         ebx
 0008C1D5    ret
*}
end;

//0008C1E4
procedure TCMScrollBar.CreateWnd;
begin
{*
 0008C1E4    push        ebx
 0008C1E5    add         esp,0FFFFFFE4
 0008C1E8    mov         ebx,eax
 0008C1EA    mov         eax,ebx
 0008C1EC    call        TWinControl.CreateWnd
 0008C1F1    mov         dword ptr [esp],1C
 0008C1F8    mov         dword ptr [esp+4],7
 0008C200    mov         eax,dword ptr [ebx+1F0];TCMScrollBar.PageSize:Cardinal
 0008C206    mov         dword ptr [esp+10],eax
 0008C20A    mov         eax,dword ptr [ebx+1F8];TCMScrollBar.Min:Integer
 0008C210    mov         dword ptr [esp+8],eax
 0008C214    mov         eax,dword ptr [ebx+1FC];TCMScrollBar.Max:Integer
 0008C21A    mov         dword ptr [esp+0C],eax
 0008C21E    mov         eax,dword ptr [ebx+1F4];TCMScrollBar.Position:Integer
 0008C224    mov         dword ptr [esp+14],eax
 0008C228    push        0FF
 0008C22A    lea         eax,[esp+4]
 0008C22E    push        eax
 0008C22F    push        2
 0008C231    mov         eax,ebx
 0008C233    call        TWinControl.GetHandle
 0008C238    push        eax
 0008C239    call        user32.SetScrollInfo
 0008C23E    add         esp,1C
 0008C241    pop         ebx
 0008C242    ret
*}
end;

//0008C244
procedure TCMScrollBar.SetKind(Value:TScrollBarKind);
begin
{*
 0008C244    push        ebx
 0008C245    push        esi
 0008C246    mov         ebx,eax
 0008C248    cmp         dl,byte ptr [ebx+1EC];TCMScrollBar.Kind:TScrollBarKind
>0008C24E    je          0008C27B
 0008C250    mov         byte ptr [ebx+1EC],dl;TCMScrollBar.Kind:TScrollBarKind
 0008C256    test        byte ptr [ebx+20],1;TCMScrollBar.FComponentState:TComponentState
>0008C25A    jne         0008C274
 0008C25C    mov         eax,dword ptr [ebx+3C];TCMScrollBar.Height:Integer
 0008C25F    push        eax
 0008C260    mov         eax,dword ptr [ebx+38];TCMScrollBar.Width:Integer
 0008C263    push        eax
 0008C264    mov         ecx,dword ptr [ebx+34];TCMScrollBar.Top:Integer
 0008C267    mov         edx,dword ptr [ebx+30];TCMScrollBar.Left:Integer
 0008C26A    mov         eax,ebx
 0008C26C    mov         esi,dword ptr [eax]
 0008C26E    call        dword ptr [esi+80];TWinControl.SetBounds
 0008C274    mov         eax,ebx
 0008C276    call        TWinControl.RecreateWnd
 0008C27B    pop         esi
 0008C27C    pop         ebx
 0008C27D    ret
*}
end;

//0008C280
{*procedure sub_0008C280(?:TCMScrollBar; ?:Integer; ?:Integer; ?:?; ?:?);
begin
 0008C280    push        ebp
 0008C281    mov         ebp,esp
 0008C283    add         esp,0FFFFFFE0
 0008C286    push        ebx
 0008C287    push        esi
 0008C288    push        edi
 0008C289    mov         edi,ecx
 0008C28B    mov         dword ptr [ebp-4],edx
 0008C28E    mov         ebx,eax
 0008C290    mov         esi,dword ptr [ebp+0C]
 0008C293    cmp         edi,esi
>0008C295    jg          0008C3B7
 0008C29B    mov         eax,dword ptr [ebp+8]
 0008C29E    xor         edx,edx
 0008C2A0    push        edx
 0008C2A1    push        eax
 0008C2A2    mov         ecx,esi
 0008C2A4    sub         ecx,edi
 0008C2A6    inc         ecx
 0008C2A7    mov         eax,ecx
 0008C2A9    cdq
 0008C2AA    cmp         edx,dword ptr [esp+4]
>0008C2AE    jne         0008C2B9
 0008C2B0    cmp         eax,dword ptr [esp]
 0008C2B3    pop         edx
 0008C2B4    pop         eax
>0008C2B5    jae         0008C2C0
>0008C2B7    jmp         0008C2BD
 0008C2B9    pop         edx
 0008C2BA    pop         eax
>0008C2BB    jge         0008C2C0
 0008C2BD    mov         dword ptr [ebp+8],ecx
 0008C2C0    cmp         edi,dword ptr [ebp-4]
>0008C2C3    jle         0008C2C8
 0008C2C5    mov         dword ptr [ebp-4],edi
 0008C2C8    cmp         dword ptr [ebp+8],1
>0008C2CC    jbe         0008C30B
 0008C2CE    mov         eax,dword ptr [ebp-4]
 0008C2D1    cdq
 0008C2D2    push        edx
 0008C2D3    push        eax
 0008C2D4    mov         eax,esi
 0008C2D6    cdq
 0008C2D7    push        edx
 0008C2D8    push        eax
 0008C2D9    mov         eax,dword ptr [ebp+8]
 0008C2DC    xor         edx,edx
 0008C2DE    sub         dword ptr [esp],eax
 0008C2E1    sbb         dword ptr [esp+4],edx
 0008C2E5    pop         eax
 0008C2E6    pop         edx
 0008C2E7    add         eax,1
 0008C2EA    adc         edx,0
 0008C2ED    cmp         edx,dword ptr [esp+4]
>0008C2F1    jne         0008C2FC
 0008C2F3    cmp         eax,dword ptr [esp]
 0008C2F6    pop         edx
 0008C2F7    pop         eax
>0008C2F8    jae         0008C313
>0008C2FA    jmp         0008C300
 0008C2FC    pop         edx
 0008C2FD    pop         eax
>0008C2FE    jge         0008C313
 0008C300    mov         eax,esi
 0008C302    sub         eax,dword ptr [ebp+8]
 0008C305    inc         eax
 0008C306    mov         dword ptr [ebp-4],eax
>0008C309    jmp         0008C313
 0008C30B    cmp         esi,dword ptr [ebp-4]
>0008C30E    jge         0008C313
 0008C310    mov         dword ptr [ebp-4],esi
 0008C313    xor         eax,eax
 0008C315    mov         dword ptr [ebp-1C],eax
 0008C318    cmp         edi,dword ptr [ebx+1F8]
>0008C31E    jne         0008C328
 0008C320    cmp         esi,dword ptr [ebx+1FC]
>0008C326    je          0008C32C
 0008C328    or          dword ptr [ebp-1C],1
 0008C32C    mov         eax,dword ptr [ebx+1F4]
 0008C332    cmp         eax,dword ptr [ebp-4]
>0008C335    je          0008C33B
 0008C337    or          dword ptr [ebp-1C],4
 0008C33B    mov         eax,dword ptr [ebx+1F0]
 0008C341    cmp         eax,dword ptr [ebp+8]
>0008C344    je          0008C34A
 0008C346    or          dword ptr [ebp-1C],2
 0008C34A    mov         dword ptr [ebp-20],1C
 0008C351    mov         eax,dword ptr [ebp-4]
 0008C354    mov         dword ptr [ebp-0C],eax
 0008C357    mov         dword ptr [ebp-18],edi
 0008C35A    mov         dword ptr [ebp-14],esi
 0008C35D    mov         eax,dword ptr [ebp+8]
 0008C360    mov         dword ptr [ebp-10],eax
 0008C363    mov         eax,ebx
 0008C365    call        TWinControl.HandleAllocated
 0008C36A    test        al,al
>0008C36C    je          0008C383
 0008C36E    push        0FF
 0008C370    lea         eax,[ebp-20]
 0008C373    push        eax
 0008C374    push        2
 0008C376    mov         eax,ebx
 0008C378    call        TWinControl.GetHandle
 0008C37D    push        eax
 0008C37E    call        user32.SetScrollInfo
 0008C383    mov         dword ptr [ebx+1F8],edi
 0008C389    mov         dword ptr [ebx+1FC],esi
 0008C38F    mov         eax,dword ptr [ebp+8]
 0008C392    mov         dword ptr [ebx+1F0],eax
 0008C398    mov         eax,dword ptr [ebx+1F4]
 0008C39E    cmp         eax,dword ptr [ebp-4]
>0008C3A1    je          0008C3B7
 0008C3A3    mov         eax,dword ptr [ebp-4]
 0008C3A6    mov         dword ptr [ebx+1F4],eax
 0008C3AC    mov         eax,ebx
 0008C3AE    mov         bx,0FFB8
 0008C3B2    call        @CallDynaInst
 0008C3B7    pop         edi
 0008C3B8    pop         esi
 0008C3B9    pop         ebx
 0008C3BA    mov         esp,ebp
 0008C3BC    pop         ebp
 0008C3BD    ret         8
end;*}

//0008C3C0
procedure TCMScrollBar.SetPosition(Value:Integer);
begin
{*
 0008C3C0    mov         ecx,dword ptr [eax+1FC];TCMScrollBar.Max:Integer
 0008C3C6    push        ecx
 0008C3C7    mov         ecx,dword ptr [eax+1F0];TCMScrollBar.PageSize:Cardinal
 0008C3CD    push        ecx
 0008C3CE    mov         ecx,dword ptr [eax+1F8];TCMScrollBar.Min:Integer
 0008C3D4    call        0008C280
 0008C3D9    ret
*}
end;

//0008C3DC
procedure TCMScrollBar.SetMin(Value:Integer);
begin
{*
 0008C3DC    mov         ecx,dword ptr [eax+1FC];TCMScrollBar.Max:Integer
 0008C3E2    push        ecx
 0008C3E3    mov         ecx,dword ptr [eax+1F0];TCMScrollBar.PageSize:Cardinal
 0008C3E9    push        ecx
 0008C3EA    mov         ecx,edx
 0008C3EC    mov         edx,dword ptr [eax+1F4];TCMScrollBar.Position:Integer
 0008C3F2    call        0008C280
 0008C3F7    ret
*}
end;

//0008C3F8
procedure TCMScrollBar.SetMax(Value:Integer);
begin
{*
 0008C3F8    push        edx
 0008C3F9    mov         edx,dword ptr [eax+1F0];TCMScrollBar.PageSize:Cardinal
 0008C3FF    push        edx
 0008C400    mov         ecx,dword ptr [eax+1F8];TCMScrollBar.Min:Integer
 0008C406    mov         edx,dword ptr [eax+1F4];TCMScrollBar.Position:Integer
 0008C40C    call        0008C280
 0008C411    ret
*}
end;

//0008C414
procedure TCMScrollBar.SetPageSize(Value:Cardinal);
begin
{*
 0008C414    mov         ecx,dword ptr [eax+1FC];TCMScrollBar.Max:Integer
 0008C41A    push        ecx
 0008C41B    push        edx
 0008C41C    mov         ecx,dword ptr [eax+1F8];TCMScrollBar.Min:Integer
 0008C422    mov         edx,dword ptr [eax+1F4];TCMScrollBar.Position:Integer
 0008C428    call        0008C280
 0008C42D    ret
*}
end;

//0008C430
procedure TCMScrollBar.sub_0008C430;
begin
{*
 0008C430    push        ebx
 0008C431    cmp         word ptr [eax+20A],0;TCMScrollBar.?f20A:word
>0008C439    je          0008C44B
 0008C43B    mov         ebx,eax
 0008C43D    mov         edx,eax
 0008C43F    mov         eax,dword ptr [ebx+20C];TCMScrollBar.?f20C:dword
 0008C445    call        dword ptr [ebx+208];TCMScrollBar.OnChange
 0008C44B    pop         ebx
 0008C44C    ret
*}
end;

//0008C450
{*procedure TCMScrollBar.sub_0008C450(?:?);
begin
 0008C450    push        ebx
 0008C451    cmp         word ptr [eax+212],0;TCMScrollBar.?f212:word
>0008C459    je          0008C46E
 0008C45B    push        ecx
 0008C45C    mov         ebx,eax
 0008C45E    mov         ecx,edx
 0008C460    mov         edx,eax
 0008C462    mov         eax,dword ptr [ebx+214];TCMScrollBar.?f214:TFormMain
 0008C468    call        dword ptr [ebx+210];TCMScrollBar.OnScroll
 0008C46E    pop         ebx
 0008C46F    ret
end;*}

//0008C470
{*procedure sub_0008C470(?:TCMScrollBar; ?:?);
begin
 0008C470    push        ebx
 0008C471    push        esi
 0008C472    push        edi
 0008C473    add         esp,0FFFFFFE0
 0008C476    mov         ebx,edx
 0008C478    mov         esi,eax
 0008C47A    mov         eax,dword ptr [esi+1F4]
 0008C480    mov         dword ptr [esp],eax
 0008C483    xor         eax,eax
 0008C485    mov         al,byte ptr [ebx+4]
 0008C488    cmp         eax,7
>0008C48B    ja          0008C525
 0008C491    jmp         dword ptr [eax*4+8C498]
 0008C491    dd          0008C4B8
 0008C491    dd          0008C4C3
 0008C491    dd          0008C4CE
 0008C491    dd          0008C4D9
 0008C491    dd          0008C525
 0008C491    dd          0008C4E4
 0008C491    dd          0008C511
 0008C491    dd          0008C51C
 0008C4B8    mov         eax,dword ptr [esi+200]
 0008C4BE    sub         dword ptr [esp],eax
>0008C4C1    jmp         0008C525
 0008C4C3    mov         eax,dword ptr [esi+200]
 0008C4C9    add         dword ptr [esp],eax
>0008C4CC    jmp         0008C525
 0008C4CE    mov         eax,dword ptr [esi+204]
 0008C4D4    sub         dword ptr [esp],eax
>0008C4D7    jmp         0008C525
 0008C4D9    mov         eax,dword ptr [esi+204]
 0008C4DF    add         dword ptr [esp],eax
>0008C4E2    jmp         0008C525
 0008C4E4    mov         dword ptr [esp+4],1C
 0008C4EC    mov         dword ptr [esp+8],10
 0008C4F4    lea         eax,[esp+4]
 0008C4F8    push        eax
 0008C4F9    push        2
 0008C4FB    mov         eax,esi
 0008C4FD    call        TWinControl.GetHandle
 0008C502    push        eax
 0008C503    call        user32.GetScrollInfo
 0008C508    mov         eax,dword ptr [esp+1C]
 0008C50C    mov         dword ptr [esp],eax
>0008C50F    jmp         0008C525
 0008C511    mov         eax,dword ptr [esi+1F8]
 0008C517    mov         dword ptr [esp],eax
>0008C51A    jmp         0008C525
 0008C51C    mov         eax,dword ptr [esi+1FC]
 0008C522    mov         dword ptr [esp],eax
 0008C525    mov         eax,dword ptr [esi+1F8]
 0008C52B    cmp         eax,dword ptr [esp]
>0008C52E    jle         0008C533
 0008C530    mov         dword ptr [esp],eax
 0008C533    mov         ecx,dword ptr [esi+1F0]
 0008C539    cmp         ecx,1
>0008C53C    jbe         0008C57D
 0008C53E    mov         eax,dword ptr [esp]
 0008C541    cdq
 0008C542    push        edx
 0008C543    push        eax
 0008C544    mov         edi,dword ptr [esi+1FC]
 0008C54A    mov         eax,edi
 0008C54C    cdq
 0008C54D    push        edx
 0008C54E    push        eax
 0008C54F    mov         eax,ecx
 0008C551    xor         edx,edx
 0008C553    sub         dword ptr [esp],eax
 0008C556    sbb         dword ptr [esp+4],edx
 0008C55A    pop         eax
 0008C55B    pop         edx
 0008C55C    add         eax,1
 0008C55F    adc         edx,0
 0008C562    cmp         edx,dword ptr [esp+4]
>0008C566    jne         0008C571
 0008C568    cmp         eax,dword ptr [esp]
 0008C56B    pop         edx
 0008C56C    pop         eax
>0008C56D    jae         0008C58B
>0008C56F    jmp         0008C575
 0008C571    pop         edx
 0008C572    pop         eax
>0008C573    jge         0008C58B
 0008C575    sub         edi,ecx
 0008C577    inc         edi
 0008C578    mov         dword ptr [esp],edi
>0008C57B    jmp         0008C58B
 0008C57D    mov         eax,dword ptr [esi+1FC]
 0008C583    cmp         eax,dword ptr [esp]
>0008C586    jge         0008C58B
 0008C588    mov         dword ptr [esp],eax
 0008C58B    mov         ecx,esp
 0008C58D    mov         dl,byte ptr [ebx+4]
 0008C590    mov         eax,esi
 0008C592    mov         bx,0FFB7
 0008C596    call        @CallDynaInst
 0008C59B    mov         edx,dword ptr [esp]
 0008C59E    mov         eax,esi
 0008C5A0    call        TCMScrollBar.SetPosition
 0008C5A5    add         esp,20
 0008C5A8    pop         edi
 0008C5A9    pop         esi
 0008C5AA    pop         ebx
 0008C5AB    ret
end;*}

//0008C5AC
procedure TCMScrollBar.sub_0008C5AC;
begin
{*
 0008C5AC    call        0008C470
 0008C5B1    ret
*}
end;

//0008C5B4
procedure TCMScrollBar.sub_0008C5B4;
begin
{*
 0008C5B4    call        0008C470
 0008C5B9    ret
*}
end;

end.