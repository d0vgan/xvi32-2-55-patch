//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit CMkomp40;

interface

uses
  SysUtils, Classes, Controls;

type
  TCMRadioBtn = class(TRadioButton)
  public
    AutoDisable:Boolean;//f1F4
    AutoColor:Boolean;//f1F5
    Control:TControl;//f1F8
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//00076290
    constructor Create(AOwner:TComponent); virtual;//v2C//00076110
    procedure sub_00076248; dynamic;//00076248
    procedure SetControl(Value:TControl);//0007625C
  end;
  TCMNumEdit = class(TEdit)
  public
    DigitsFrac:byte;//f204
    DigitsInt:byte;//f205
    Min:Extended;//f206
    f20A:dword;//f20A
    f20E:word;//f20E
    Max:Extended;//f210
    f214:dword;//f214
    f218:word;//f218
    f21A:Extended;//f21A
    f21E:dword;//f21E
    f222:word;//f222
    Value:Extended;//f224
    f228:dword;//f228
    f22C:word;//f22C
    Hex:Boolean;//f22E
    constructor Create(AOwner:TComponent); virtual;//v2C//000762C0
    procedure KeyPress(Key:Char); dynamic;//00076A90
    procedure DoExit; dynamic;//000766D4
    procedure DoEnter; dynamic;//000766A8
    //procedure SetValue(Value:Extended; ?:Extended; ?:?; ?:?);//00076858
    procedure SetDigitsFrac(Value:Byte);//0007694C
    procedure SetDigitsInt(Value:Byte);//00076980
    procedure SetHex(Value:Boolean);//000769A4
    //procedure SetMin(Value:Extended; ?:Extended; ?:?; ?:?);//000769C8
    //procedure SetMax(Value:Extended; ?:Extended; ?:?; ?:?);//00076A2C
  end;
  TCMByteEdit = class(TCustomEdit)
  public
    f204:TStringList;//f204
    MaxBytes:Cardinal;//f208
    destructor Destroy; virtual;//00076E78
    constructor Create(AOwner:TComponent); virtual;//v2C//00076E28
    procedure Change; dynamic;//000770DC
    procedure KeyPress(Key:Char); dynamic;//0007754C
    procedure KeyUp(Key:Word; Shift:TShiftState); dynamic;//000776C4
    procedure SetASCII(Value:AnsiString);//00076EA8
    procedure GetASCII(?:AnsiString);//00076F10
    procedure SetMaxBytes(Value:Cardinal);//00076FC4
  end;
    constructor Create(AOwner:TComponent);//00076110
    procedure sub_00076154(?:TCMRadioBtn);//00076154
    procedure sub_00076248;//00076248
    procedure Notification(AComponent:TComponent; Operation:TOperation);//00076290
    constructor Create(AOwner:TComponent);//000762C0
    procedure sub_0007634C(?:TCMNumEdit);//0007634C
    //function sub_0007652C(?:TCMNumEdit):?;//0007652C
    procedure DoEnter;//000766A8
    procedure DoExit;//000766D4
    procedure KeyPress(Key:Char);//00076A90
    constructor Create(AOwner:TComponent);//00076E28
    destructor Destroy;//00076E78
    //function sub_00076FEC(?:TCMByteEdit):?;//00076FEC
    procedure Change;//000770DC
    procedure KeyPress(Key:Char);//0007754C
    procedure KeyUp(Key:Word; Shift:TShiftState);//000776C4

implementation

//00076110
constructor TCMRadioBtn.Create(AOwner:TComponent);
begin
{*
 00076110    push        ebx
 00076111    push        esi
 00076112    test        dl,dl
>00076114    je          0007611E
 00076116    add         esp,0FFFFFFF0
 00076119    call        @ClassCreate
 0007611E    mov         ebx,edx
 00076120    mov         esi,eax
 00076122    xor         edx,edx
 00076124    mov         eax,esi
 00076126    call        TRadioButton.Create
 0007612B    mov         byte ptr [esi+1F4],1;TCMRadioBtn.AutoDisable:Boolean
 00076132    mov         byte ptr [esi+1F5],1;TCMRadioBtn.AutoColor:Boolean
 00076139    mov         eax,esi
 0007613B    test        bl,bl
>0007613D    je          0007614E
 0007613F    call        @AfterConstruction
 00076144    pop         dword ptr fs:[0]
 0007614B    add         esp,0C
 0007614E    mov         eax,esi
 00076150    pop         esi
 00076151    pop         ebx
 00076152    ret
*}
end;

//00076154
procedure sub_00076154(?:TCMRadioBtn);
begin
{*
 00076154    push        ebp
 00076155    mov         ebp,esp
 00076157    push        ecx
 00076158    push        ebx
 00076159    push        esi
 0007615A    push        edi
 0007615B    mov         dword ptr [ebp-4],eax
 0007615E    mov         eax,dword ptr [ebp-4]
 00076161    mov         ebx,dword ptr [eax+1F8]
 00076167    test        ebx,ebx
>00076169    je          00076241
 0007616F    mov         eax,dword ptr [ebp-4]
 00076172    cmp         byte ptr [eax+1F4],0
>00076179    je          0007618F
 0007617B    mov         eax,dword ptr [ebp-4]
 0007617E    mov         edx,dword ptr [eax]
 00076180    call        dword ptr [edx+0B8]
 00076186    mov         edx,eax
 00076188    mov         eax,ebx
 0007618A    mov         ecx,dword ptr [eax]
 0007618C    call        dword ptr [ecx+60]
 0007618F    xor         eax,eax
 00076191    push        ebp
 00076192    push        761F4
 00076197    push        dword ptr fs:[eax]
 0007619A    mov         dword ptr fs:[eax],esp
 0007619D    mov         eax,dword ptr [ebp-4]
 000761A0    mov         eax,dword ptr [eax+1F8]
 000761A6    mov         edx,dword ptr [eax]
 000761A8    call        dword ptr [edx+50]
 000761AB    test        al,al
>000761AD    je          000761EA
 000761AF    mov         eax,dword ptr [ebp-4]
 000761B2    mov         eax,dword ptr [eax+1F8]
 000761B8    mov         edx,dword ptr ds:[3F0BC];TWinControl
 000761BE    call        @IsClass
 000761C3    test        al,al
>000761C5    je          000761EA
 000761C7    mov         eax,dword ptr [ebp-4]
 000761CA    mov         eax,dword ptr [eax+1F8]
 000761D0    call        TWinControl.HandleAllocated
 000761D5    test        al,al
>000761D7    je          000761EA
 000761D9    mov         eax,dword ptr [ebp-4]
 000761DC    mov         eax,dword ptr [eax+1F8]
 000761E2    mov         edx,dword ptr [eax]
 000761E4    call        dword ptr [edx+0B4]
 000761EA    xor         eax,eax
 000761EC    pop         edx
 000761ED    pop         ecx
 000761EE    pop         ecx
 000761EF    mov         dword ptr fs:[eax],edx
>000761F2    jmp         000761FE
>000761F4    jmp         @HandleAnyException
 000761F9    call        @DoneExcept
 000761FE    mov         eax,dword ptr [ebp-4]
 00076201    cmp         byte ptr [eax+1F5],0
>00076208    je          00076241
 0007620A    mov         eax,dword ptr [ebp-4]
 0007620D    mov         edx,dword ptr [eax]
 0007620F    call        dword ptr [edx+0B8]
 00076215    test        al,al
>00076217    je          0007622E
 00076219    mov         eax,dword ptr [ebp-4]
 0007621C    mov         eax,dword ptr [eax+1F8]
 00076222    mov         edx,80000005
 00076227    call        TControl.SetColor
>0007622C    jmp         00076241
 0007622E    mov         eax,dword ptr [ebp-4]
 00076231    mov         eax,dword ptr [eax+1F8]
 00076237    mov         edx,8000000F
 0007623C    call        TControl.SetColor
 00076241    pop         edi
 00076242    pop         esi
 00076243    pop         ebx
 00076244    pop         ecx
 00076245    pop         ebp
 00076246    ret
*}
end;

//00076248
procedure TCMRadioBtn.sub_00076248;
begin
{*
 00076248    push        esi
 00076249    mov         esi,eax
 0007624B    mov         eax,esi
 0007624D    mov         ecx,dword ptr [eax]
 0007624F    call        dword ptr [ecx-10];TWinControl.DefaultHandler
 00076252    mov         eax,esi
 00076254    call        00076154
 00076259    pop         esi
 0007625A    ret
*}
end;

//0007625C
procedure TCMRadioBtn.SetControl(Value:TControl);
begin
{*
 0007625C    push        ebx
 0007625D    push        esi
 0007625E    mov         ebx,edx
 00076260    mov         esi,eax
 00076262    mov         eax,ebx
 00076264    mov         edx,dword ptr ds:[75654];TCMRadioBtn
 0007626A    call        @IsClass
 0007626F    test        al,al
>00076271    jne         0007628D
 00076273    mov         dword ptr [esi+1F8],ebx;TCMRadioBtn.Control:TControl
 00076279    test        ebx,ebx
>0007627B    je          0007628D
 0007627D    mov         edx,esi
 0007627F    mov         eax,ebx
 00076281    call        TComponent.FreeNotification
 00076286    mov         eax,esi
 00076288    call        00076154
 0007628D    pop         esi
 0007628E    pop         ebx
 0007628F    ret
*}
end;

//00076290
procedure TCMRadioBtn.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 00076290    push        ebx
 00076291    push        esi
 00076292    push        edi
 00076293    mov         ebx,ecx
 00076295    mov         esi,edx
 00076297    mov         edi,eax
 00076299    mov         ecx,ebx
 0007629B    mov         edx,esi
 0007629D    mov         eax,edi
 0007629F    call        TControl.Notification
 000762A4    cmp         bl,1
>000762A7    jne         000762B9
 000762A9    cmp         esi,dword ptr [edi+1F8];TCMRadioBtn.Control:TControl
>000762AF    jne         000762B9
 000762B1    xor         eax,eax
 000762B3    mov         dword ptr [edi+1F8],eax;TCMRadioBtn.Control:TControl
 000762B9    pop         edi
 000762BA    pop         esi
 000762BB    pop         ebx
 000762BC    ret
*}
end;

//000762C0
constructor TCMNumEdit.Create(AOwner:TComponent);
begin
{*
 000762C0    push        ebx
 000762C1    push        esi
 000762C2    test        dl,dl
>000762C4    je          000762CE
 000762C6    add         esp,0FFFFFFF0
 000762C9    call        @ClassCreate
 000762CE    mov         ebx,edx
 000762D0    mov         esi,eax
 000762D2    xor         edx,edx
 000762D4    mov         eax,esi
 000762D6    call        TCustomEdit.Create
 000762DB    mov         byte ptr [esi+205],8;TCMNumEdit.DigitsInt:byte
 000762E2    mov         byte ptr [esi+204],0;TCMNumEdit.DigitsFrac:byte
 000762E9    xor         eax,eax
 000762EB    mov         dword ptr [esi+206],eax;TCMNumEdit.Min:Extended
 000762F1    mov         dword ptr [esi+20A],eax;TCMNumEdit.?f20A:dword
 000762F7    mov         word ptr [esi+20E],ax;TCMNumEdit.?f20E:word
 000762FE    mov         dword ptr [esi+210],0CCCCCCCD;TCMNumEdit.Max:Extended
 00076308    mov         dword ptr [esi+214],0BEBC1FFC;TCMNumEdit.?f214:dword
 00076312    mov         word ptr [esi+218],4019;TCMNumEdit.?f218:word
 0007631B    mov         byte ptr [esi+22E],0;TCMNumEdit.Hex:Boolean
 00076322    push        0
 00076324    push        0
 00076326    push        0
 00076328    mov         eax,esi
 0007632A    call        TCMNumEdit.SetValue
 0007632F    mov         eax,esi
 00076331    test        bl,bl
>00076333    je          00076344
 00076335    call        @AfterConstruction
 0007633A    pop         dword ptr fs:[0]
 00076341    add         esp,0C
 00076344    mov         eax,esi
 00076346    pop         esi
 00076347    pop         ebx
 00076348    ret
*}
end;

//0007634C
procedure sub_0007634C(?:TCMNumEdit);
begin
{*
 0007634C    push        ebp
 0007634D    mov         ebp,esp
 0007634F    xor         ecx,ecx
 00076351    push        ecx
 00076352    push        ecx
 00076353    push        ecx
 00076354    push        ecx
 00076355    push        ecx
 00076356    push        ebx
 00076357    push        esi
 00076358    push        edi
 00076359    mov         dword ptr [ebp-4],eax
 0007635C    xor         eax,eax
 0007635E    push        ebp
 0007635F    push        76511
 00076364    push        dword ptr fs:[eax]
 00076367    mov         dword ptr fs:[eax],esp
 0007636A    lea         edx,[ebp-8]
 0007636D    mov         eax,dword ptr [ebp-4]
 00076370    call        TControl.GetText
 00076375    cmp         dword ptr [ebp-8],0
>00076379    je          000764EE
 0007637F    mov         eax,dword ptr [ebp-4]
 00076382    cmp         byte ptr [eax+22E],0
>00076389    je          00076414
 0007638F    xor         eax,eax
 00076391    push        ebp
 00076392    push        763CA
 00076397    push        dword ptr fs:[eax]
 0007639A    mov         dword ptr fs:[eax],esp
 0007639D    lea         edx,[ebp-8]
 000763A0    mov         eax,dword ptr [ebp-4]
 000763A3    call        TControl.GetText
 000763A8    mov         eax,dword ptr [ebp-8]
 000763AB    call        StrToInt
 000763B0    mov         dword ptr [ebp-0C],eax
 000763B3    fild        dword ptr [ebp-0C]
 000763B6    mov         eax,dword ptr [ebp-4]
 000763B9    fstp        tbyte ptr [eax+224]
 000763BF    wait
 000763C0    xor         eax,eax
 000763C2    pop         edx
 000763C3    pop         ecx
 000763C4    pop         ecx
 000763C5    mov         dword ptr fs:[eax],edx
>000763C8    jmp         000763D4
>000763CA    jmp         @HandleAnyException
 000763CF    call        @DoneExcept
 000763D4    lea         edx,[ebp-8]
 000763D7    mov         eax,dword ptr [ebp-4]
 000763DA    call        TControl.GetText
 000763DF    mov         eax,dword ptr [ebp-8]
 000763E2    call        StrToInt
 000763E7    lea         ecx,[ebp-14]
 000763EA    mov         edx,1
 000763EF    call        IntToHex
 000763F4    mov         ecx,dword ptr [ebp-14]
 000763F7    lea         eax,[ebp-10]
 000763FA    mov         edx,76528;'$'
 000763FF    call        @LStrCat3
 00076404    mov         edx,dword ptr [ebp-10]
 00076407    mov         eax,dword ptr [ebp-4]
 0007640A    call        TControl.SetText
>0007640F    jmp         000764EE
 00076414    lea         edx,[ebp-8]
 00076417    mov         eax,dword ptr [ebp-4]
 0007641A    call        TControl.GetText
 0007641F    mov         eax,dword ptr [ebp-8]
 00076422    call        @LStrLen
 00076427    test        eax,eax
>00076429    jle         00076464
 0007642B    lea         edx,[ebp-8]
 0007642E    mov         eax,dword ptr [ebp-4]
 00076431    call        TControl.GetText
 00076436    mov         eax,dword ptr [ebp-8]
 00076439    cmp         byte ptr [eax],24
>0007643C    jne         00076464
 0007643E    lea         edx,[ebp-8]
 00076441    mov         eax,dword ptr [ebp-4]
 00076444    call        TControl.GetText
 00076449    mov         eax,dword ptr [ebp-8]
 0007644C    call        StrToInt
 00076451    lea         edx,[ebp-10]
 00076454    call        IntToStr
 00076459    mov         edx,dword ptr [ebp-10]
 0007645C    mov         eax,dword ptr [ebp-4]
 0007645F    call        TControl.SetText
 00076464    xor         eax,eax
 00076466    push        ebp
 00076467    push        76499
 0007646C    push        dword ptr fs:[eax]
 0007646F    mov         dword ptr fs:[eax],esp
 00076472    lea         edx,[ebp-8]
 00076475    mov         eax,dword ptr [ebp-4]
 00076478    call        TControl.GetText
 0007647D    mov         eax,dword ptr [ebp-8]
 00076480    call        000752C0
 00076485    mov         eax,dword ptr [ebp-4]
 00076488    fstp        tbyte ptr [eax+224]
 0007648E    wait
 0007648F    xor         eax,eax
 00076491    pop         edx
 00076492    pop         ecx
 00076493    pop         ecx
 00076494    mov         dword ptr fs:[eax],edx
>00076497    jmp         000764A3
>00076499    jmp         @HandleAnyException
 0007649E    call        @DoneExcept
 000764A3    mov         eax,dword ptr [ebp-4]
 000764A6    mov         dx,word ptr [eax+22C]
 000764AD    push        edx
 000764AE    push        dword ptr [eax+228]
 000764B4    push        dword ptr [eax+224]
 000764BA    lea         eax,[ebp-10]
 000764BD    push        eax
 000764BE    mov         eax,dword ptr [ebp-4]
 000764C1    xor         edx,edx
 000764C3    mov         dl,byte ptr [eax+205]
 000764C9    mov         eax,dword ptr [ebp-4]
 000764CC    mov         bl,byte ptr [eax+204]
 000764D2    xor         eax,eax
 000764D4    mov         al,bl
 000764D6    add         edx,eax
 000764D8    xor         ecx,ecx
 000764DA    mov         cl,bl
 000764DC    mov         al,2
 000764DE    call        FloatToStrF
 000764E3    mov         edx,dword ptr [ebp-10]
 000764E6    mov         eax,dword ptr [ebp-4]
 000764E9    call        TControl.SetText
 000764EE    xor         eax,eax
 000764F0    pop         edx
 000764F1    pop         ecx
 000764F2    pop         ecx
 000764F3    mov         dword ptr fs:[eax],edx
 000764F6    push        76518
 000764FB    lea         eax,[ebp-14]
 000764FE    mov         edx,2
 00076503    call        @LStrArrayClr
 00076508    lea         eax,[ebp-8]
 0007650B    call        @LStrClr
 00076510    ret
>00076511    jmp         @HandleFinally
>00076516    jmp         000764FB
 00076518    pop         edi
 00076519    pop         esi
 0007651A    pop         ebx
 0007651B    mov         esp,ebp
 0007651D    pop         ebp
 0007651E    ret
*}
end;

//0007652C
{*function sub_0007652C(?:TCMNumEdit):?;
begin
 0007652C    push        ebp
 0007652D    mov         ebp,esp
 0007652F    add         esp,0FFFFFFE8
 00076532    push        ebx
 00076533    push        esi
 00076534    push        edi
 00076535    xor         edx,edx
 00076537    mov         dword ptr [ebp-18],edx
 0007653A    mov         dword ptr [ebp-10],edx
 0007653D    mov         esi,eax
 0007653F    xor         eax,eax
 00076541    push        ebp
 00076542    push        76698
 00076547    push        dword ptr fs:[eax]
 0007654A    mov         dword ptr fs:[eax],esp
 0007654D    mov         bl,1
 0007654F    xor         eax,eax
 00076551    push        ebp
 00076552    push        7666E
 00076557    push        dword ptr fs:[eax]
 0007655A    mov         dword ptr fs:[eax],esp
 0007655D    cmp         byte ptr [esi+22E],0
>00076564    je          00076584
 00076566    lea         edx,[ebp-10]
 00076569    mov         eax,esi
 0007656B    call        TControl.GetText
 00076570    mov         eax,dword ptr [ebp-10]
 00076573    call        StrToInt
 00076578    mov         dword ptr [ebp-14],eax
 0007657B    fild        dword ptr [ebp-14]
 0007657E    fstp        tbyte ptr [ebp-0A]
 00076581    wait
>00076582    jmp         0007659A
 00076584    lea         edx,[ebp-10]
 00076587    mov         eax,esi
 00076589    call        TControl.GetText
 0007658E    mov         eax,dword ptr [ebp-10]
 00076591    call        000752C0
 00076596    fstp        tbyte ptr [ebp-0A]
 00076599    wait
 0007659A    fld         tbyte ptr [ebp-0A]
 0007659D    fld         tbyte ptr [esi+206]
 000765A3    fcompp
 000765A5    fnstsw      al
 000765A7    sahf
>000765A8    jbe         000765D2
 000765AA    mov         eax,dword ptr [esi+206]
 000765B0    mov         dword ptr [esi+224],eax
 000765B6    mov         eax,dword ptr [esi+20A]
 000765BC    mov         dword ptr [esi+228],eax
 000765C2    mov         ax,word ptr [esi+20E]
 000765C9    mov         word ptr [esi+22C],ax
>000765D0    jmp         00076637
 000765D2    fld         tbyte ptr [ebp-0A]
 000765D5    fld         tbyte ptr [esi+210]
 000765DB    fcompp
 000765DD    fnstsw      al
 000765DF    sahf
>000765E0    jae         0007660A
 000765E2    mov         eax,dword ptr [esi+210]
 000765E8    mov         dword ptr [esi+224],eax
 000765EE    mov         eax,dword ptr [esi+214]
 000765F4    mov         dword ptr [esi+228],eax
 000765FA    mov         ax,word ptr [esi+218]
 00076601    mov         word ptr [esi+22C],ax
>00076608    jmp         00076637
 0007660A    fld         tbyte ptr [esi+224]
 00076610    fld         tbyte ptr [ebp-0A]
 00076613    fcompp
 00076615    fnstsw      al
 00076617    sahf
>00076618    je          00076637
 0007661A    mov         eax,dword ptr [ebp-0A]
 0007661D    mov         dword ptr [esi+224],eax
 00076623    mov         eax,dword ptr [ebp-6]
 00076626    mov         dword ptr [esi+228],eax
 0007662C    mov         ax,word ptr [ebp-2]
 00076630    mov         word ptr [esi+22C],ax
 00076637    mov         ax,word ptr [esi+22C]
 0007663E    push        eax
 0007663F    push        dword ptr [esi+228]
 00076645    push        dword ptr [esi+224]
 0007664B    lea         eax,[ebp-18]
 0007664E    call        FloatToStr
 00076653    mov         edx,dword ptr [ebp-18]
 00076656    mov         eax,esi
 00076658    call        TControl.SetText
 0007665D    mov         eax,esi
 0007665F    call        0007634C
 00076664    xor         eax,eax
 00076666    pop         edx
 00076667    pop         ecx
 00076668    pop         ecx
 00076669    mov         dword ptr fs:[eax],edx
>0007666C    jmp         0007667A
>0007666E    jmp         @HandleAnyException
 00076673    xor         ebx,ebx
 00076675    call        @DoneExcept
 0007667A    xor         eax,eax
 0007667C    pop         edx
 0007667D    pop         ecx
 0007667E    pop         ecx
 0007667F    mov         dword ptr fs:[eax],edx
 00076682    push        7669F
 00076687    lea         eax,[ebp-18]
 0007668A    call        @LStrClr
 0007668F    lea         eax,[ebp-10]
 00076692    call        @LStrClr
 00076697    ret
>00076698    jmp         @HandleFinally
>0007669D    jmp         00076687
 0007669F    mov         eax,ebx
 000766A1    pop         edi
 000766A2    pop         esi
 000766A3    pop         ebx
 000766A4    mov         esp,ebp
 000766A6    pop         ebp
 000766A7    ret
end;*}

//000766A8
procedure TCMNumEdit.DoEnter;
begin
{*
 000766A8    mov         edx,dword ptr [eax+224];TCMNumEdit.Value:Extended
 000766AE    mov         dword ptr [eax+21A],edx;TCMNumEdit.?f21A:Extended
 000766B4    mov         edx,dword ptr [eax+228];TCMNumEdit.?f228:dword
 000766BA    mov         dword ptr [eax+21E],edx;TCMNumEdit.?f21E:dword
 000766C0    mov         dx,word ptr [eax+22C];TCMNumEdit.?f22C:word
 000766C7    mov         word ptr [eax+222],dx;TCMNumEdit.?f222:word
 000766CE    call        TWinControl.DoEnter
 000766D3    ret
*}
end;

//000766D4
procedure TCMNumEdit.DoExit;
begin
{*
 000766D4    push        ebp
 000766D5    mov         ebp,esp
 000766D7    push        0
 000766D9    push        0
 000766DB    push        0
 000766DD    push        ebx
 000766DE    push        esi
 000766DF    push        edi
 000766E0    mov         dword ptr [ebp-4],eax
 000766E3    xor         eax,eax
 000766E5    push        ebp
 000766E6    push        7683C
 000766EB    push        dword ptr fs:[eax]
 000766EE    mov         dword ptr fs:[eax],esp
 000766F1    mov         eax,dword ptr [ebp-4]
 000766F4    cmp         byte ptr [eax+22E],0;TCMNumEdit.Hex:Boolean
>000766FB    jne         00076723
 000766FD    lea         edx,[ebp-8]
 00076700    mov         eax,dword ptr [ebp-4]
 00076703    call        TControl.GetText
 00076708    mov         edx,dword ptr [ebp-8]
 0007670B    mov         eax,76854;'$'
 00076710    call        @LStrPos
 00076715    test        eax,eax
>00076717    jle         00076723
 00076719    mov         dl,1
 0007671B    mov         eax,dword ptr [ebp-4]
 0007671E    call        TCMNumEdit.SetHex
 00076723    mov         eax,dword ptr [ebp-4]
 00076726    cmp         byte ptr [eax+22E],0;TCMNumEdit.Hex:Boolean
>0007672D    je          00076771
 0007672F    lea         edx,[ebp-8]
 00076732    mov         eax,dword ptr [ebp-4]
 00076735    call        TControl.GetText
 0007673A    mov         edx,dword ptr [ebp-8]
 0007673D    mov         eax,76854;'$'
 00076742    call        @LStrPos
 00076747    test        eax,eax
>00076749    jne         00076771
 0007674B    lea         edx,[ebp-8]
 0007674E    mov         eax,dword ptr [ebp-4]
 00076751    call        TControl.GetText
 00076756    mov         ecx,dword ptr [ebp-8]
 00076759    lea         eax,[ebp-0C]
 0007675C    mov         edx,76854;'$'
 00076761    call        @LStrCat3
 00076766    mov         edx,dword ptr [ebp-0C]
 00076769    mov         eax,dword ptr [ebp-4]
 0007676C    call        TControl.SetText
 00076771    mov         eax,dword ptr [ebp-4]
 00076774    call        0007652C
 00076779    test        al,al
>0007677B    jne         0007680E
 00076781    mov         eax,dword ptr [ebp-4]
 00076784    mov         dx,word ptr [eax+222];TCMNumEdit.?f222:word
 0007678B    push        edx
 0007678C    push        dword ptr [eax+21E];TCMNumEdit.?f21E:dword
 00076792    push        dword ptr [eax+21A];TCMNumEdit.?f21A:Extended
 00076798    mov         eax,dword ptr [ebp-4]
 0007679B    call        TCMNumEdit.SetValue
 000767A0    mov         eax,dword ptr [ebp-4]
 000767A3    call        TCustomEdit.SelectAll
 000767A8    xor         eax,eax
 000767AA    push        ebp
 000767AB    push        767DD
 000767B0    push        dword ptr fs:[eax]
 000767B3    mov         dword ptr fs:[eax],esp
 000767B6    mov         eax,[000B5BDC];^Screen:TScreen
 000767BB    mov         eax,dword ptr [eax]
 000767BD    mov         eax,dword ptr [eax+60];TScreen.FActiveForm:TForm
 000767C0    mov         eax,dword ptr [eax+200];TForm.FActiveControl:TWinControl
 000767C6    mov         edx,dword ptr ds:[36984];TButton
 000767CC    call        @AsClass
 000767D1    mov         ebx,eax
 000767D3    xor         eax,eax
 000767D5    pop         edx
 000767D6    pop         ecx
 000767D7    pop         ecx
 000767D8    mov         dword ptr fs:[eax],edx
>000767DB    jmp         000767F4
>000767DD    jmp         @HandleAnyException
 000767E2    xor         ebx,ebx
 000767E4    mov         eax,dword ptr [ebp-4]
 000767E7    mov         edx,dword ptr [eax]
 000767E9    call        dword ptr [edx+0B4];TWinControl.SetFocus
 000767EF    call        @DoneExcept
 000767F4    test        ebx,ebx
>000767F6    je          00076816
 000767F8    cmp         dword ptr [ebx+1F4],1
>000767FF    jne         00076816
 00076801    mov         eax,dword ptr [ebp-4]
 00076804    mov         edx,dword ptr [eax]
 00076806    call        dword ptr [edx+0B4];TWinControl.SetFocus
>0007680C    jmp         00076816
 0007680E    mov         eax,dword ptr [ebp-4]
 00076811    call        0007634C
 00076816    mov         eax,dword ptr [ebp-4]
 00076819    call        TWinControl.DoExit
 0007681E    xor         eax,eax
 00076820    pop         edx
 00076821    pop         ecx
 00076822    pop         ecx
 00076823    mov         dword ptr fs:[eax],edx
 00076826    push        76843
 0007682B    lea         eax,[ebp-0C]
 0007682E    call        @LStrClr
 00076833    lea         eax,[ebp-8]
 00076836    call        @LStrClr
 0007683B    ret
>0007683C    jmp         @HandleFinally
>00076841    jmp         0007682B
 00076843    pop         edi
 00076844    pop         esi
 00076845    pop         ebx
 00076846    mov         esp,ebp
 00076848    pop         ebp
 00076849    ret
*}
end;

//00076858
{*procedure TCMNumEdit.SetValue(Value:Extended; ?:Extended; ?:?; ?:?);
begin
 00076858    push        ebp
 00076859    mov         ebp,esp
 0007685B    push        0
 0007685D    push        ebx
 0007685E    mov         ebx,eax
 00076860    xor         eax,eax
 00076862    push        ebp
 00076863    push        7693E
 00076868    push        dword ptr fs:[eax]
 0007686B    mov         dword ptr fs:[eax],esp
 0007686E    fld         tbyte ptr [ebp+8]
 00076871    fld         tbyte ptr [ebx+210];TCMNumEdit.Max:Extended
 00076877    fcompp
 00076879    fnstsw      al
 0007687B    sahf
>0007687C    jae         000768A6
 0007687E    mov         eax,dword ptr [ebx+210];TCMNumEdit.Max:Extended
 00076884    mov         dword ptr [ebx+224],eax;TCMNumEdit.Value:Extended
 0007688A    mov         eax,dword ptr [ebx+214];TCMNumEdit.?f214:dword
 00076890    mov         dword ptr [ebx+228],eax;TCMNumEdit.?f228:dword
 00076896    mov         ax,word ptr [ebx+218];TCMNumEdit.?f218:word
 0007689D    mov         word ptr [ebx+22C],ax;TCMNumEdit.?f22C:word
>000768A4    jmp         000768FB
 000768A6    fld         tbyte ptr [ebp+8]
 000768A9    fld         tbyte ptr [ebx+206];TCMNumEdit.Min:Extended
 000768AF    fcompp
 000768B1    fnstsw      al
 000768B3    sahf
>000768B4    jbe         000768DE
 000768B6    mov         eax,dword ptr [ebx+206];TCMNumEdit.Min:Extended
 000768BC    mov         dword ptr [ebx+224],eax;TCMNumEdit.Value:Extended
 000768C2    mov         eax,dword ptr [ebx+20A];TCMNumEdit.?f20A:dword
 000768C8    mov         dword ptr [ebx+228],eax;TCMNumEdit.?f228:dword
 000768CE    mov         ax,word ptr [ebx+20E];TCMNumEdit.?f20E:word
 000768D5    mov         word ptr [ebx+22C],ax;TCMNumEdit.?f22C:word
>000768DC    jmp         000768FB
 000768DE    mov         eax,dword ptr [ebp+8]
 000768E1    mov         dword ptr [ebx+224],eax;TCMNumEdit.Value:Extended
 000768E7    mov         eax,dword ptr [ebp+0C]
 000768EA    mov         dword ptr [ebx+228],eax;TCMNumEdit.?f228:dword
 000768F0    mov         ax,word ptr [ebp+10]
 000768F4    mov         word ptr [ebx+22C],ax;TCMNumEdit.?f22C:word
 000768FB    mov         ax,word ptr [ebx+22C];TCMNumEdit.?f22C:word
 00076902    push        eax
 00076903    push        dword ptr [ebx+228];TCMNumEdit.?f228:dword
 00076909    push        dword ptr [ebx+224];TCMNumEdit.Value:Extended
 0007690F    lea         eax,[ebp-4]
 00076912    call        FloatToStr
 00076917    mov         edx,dword ptr [ebp-4]
 0007691A    mov         eax,ebx
 0007691C    call        TControl.SetText
 00076921    mov         eax,ebx
 00076923    call        0007634C
 00076928    xor         eax,eax
 0007692A    pop         edx
 0007692B    pop         ecx
 0007692C    pop         ecx
 0007692D    mov         dword ptr fs:[eax],edx
 00076930    push        76945
 00076935    lea         eax,[ebp-4]
 00076938    call        @LStrClr
 0007693D    ret
>0007693E    jmp         @HandleFinally
>00076943    jmp         00076935
 00076945    pop         ebx
 00076946    pop         ecx
 00076947    pop         ebp
 00076948    ret         0C
end;*}

//0007694C
procedure TCMNumEdit.SetDigitsFrac(Value:Byte);
begin
{*
 0007694C    cmp         byte ptr [eax+22E],0;TCMNumEdit.Hex:Boolean
>00076953    je          0007695B
 00076955    test        dl,dl
>00076957    je          0007695B
 00076959    xor         edx,edx
 0007695B    cmp         dl,byte ptr [eax+204];TCMNumEdit.DigitsFrac:byte
>00076961    je          0007697C
 00076963    cmp         dl,12
>00076966    jbe         00076971
 00076968    mov         byte ptr [eax+204],12;TCMNumEdit.DigitsFrac:byte
>0007696F    jmp         00076977
 00076971    mov         byte ptr [eax+204],dl;TCMNumEdit.DigitsFrac:byte
 00076977    call        0007634C
 0007697C    ret
*}
end;

//00076980
procedure TCMNumEdit.SetDigitsInt(Value:Byte);
begin
{*
 00076980    cmp         dl,byte ptr [eax+205];TCMNumEdit.DigitsInt:byte
>00076986    je          000769A1
 00076988    cmp         dl,12
>0007698B    jbe         00076996
 0007698D    mov         byte ptr [eax+205],12;TCMNumEdit.DigitsInt:byte
>00076994    jmp         0007699C
 00076996    mov         byte ptr [eax+205],dl;TCMNumEdit.DigitsInt:byte
 0007699C    call        0007634C
 000769A1    ret
*}
end;

//000769A4
procedure TCMNumEdit.SetHex(Value:Boolean);
begin
{*
 000769A4    cmp         dl,byte ptr [eax+22E];TCMNumEdit.Hex:Boolean
>000769AA    je          000769C4
 000769AC    mov         ecx,edx
 000769AE    mov         byte ptr [eax+22E],cl;TCMNumEdit.Hex:Boolean
 000769B4    test        cl,cl
>000769B6    je          000769BF
 000769B8    mov         byte ptr [eax+204],0;TCMNumEdit.DigitsFrac:byte
 000769BF    call        0007634C
 000769C4    ret
*}
end;

//000769C8
{*procedure TCMNumEdit.SetMin(Value:Extended; ?:Extended; ?:?; ?:?);
begin
 000769C8    push        ebp
 000769C9    mov         ebp,esp
 000769CB    mov         edx,eax
 000769CD    fld         tbyte ptr [edx+206];TCMNumEdit.Min:Extended
 000769D3    fld         tbyte ptr [ebp+8]
 000769D6    fcompp
 000769D8    fnstsw      al
 000769DA    sahf
>000769DB    je          00076A25
 000769DD    fld         tbyte ptr [ebp+8]
 000769E0    fld         tbyte ptr [edx+210];TCMNumEdit.Max:Extended
 000769E6    fcompp
 000769E8    fnstsw      al
 000769EA    sahf
>000769EB    jb          00076A0A
 000769ED    mov         eax,dword ptr [ebp+8]
 000769F0    mov         dword ptr [edx+206],eax;TCMNumEdit.Min:Extended
 000769F6    mov         eax,dword ptr [ebp+0C]
 000769F9    mov         dword ptr [edx+20A],eax;TCMNumEdit.?f20A:dword
 000769FF    mov         ax,word ptr [ebp+10]
 00076A03    mov         word ptr [edx+20E],ax;TCMNumEdit.?f20E:word
 00076A0A    mov         ax,word ptr [edx+22C];TCMNumEdit.?f22C:word
 00076A11    push        eax
 00076A12    push        dword ptr [edx+228];TCMNumEdit.?f228:dword
 00076A18    push        dword ptr [edx+224];TCMNumEdit.Value:Extended
 00076A1E    mov         eax,edx
 00076A20    call        TCMNumEdit.SetValue
 00076A25    pop         ebp
 00076A26    ret         0C
end;*}

//00076A2C
{*procedure TCMNumEdit.SetMax(Value:Extended; ?:Extended; ?:?; ?:?);
begin
 00076A2C    push        ebp
 00076A2D    mov         ebp,esp
 00076A2F    mov         edx,eax
 00076A31    fld         tbyte ptr [edx+210];TCMNumEdit.Max:Extended
 00076A37    fld         tbyte ptr [ebp+8]
 00076A3A    fcompp
 00076A3C    fnstsw      al
 00076A3E    sahf
>00076A3F    je          00076A89
 00076A41    fld         tbyte ptr [edx+206];TCMNumEdit.Min:Extended
 00076A47    fld         tbyte ptr [ebp+8]
 00076A4A    fcompp
 00076A4C    fnstsw      al
 00076A4E    sahf
>00076A4F    jb          00076A6E
 00076A51    mov         eax,dword ptr [ebp+8]
 00076A54    mov         dword ptr [edx+210],eax;TCMNumEdit.Max:Extended
 00076A5A    mov         eax,dword ptr [ebp+0C]
 00076A5D    mov         dword ptr [edx+214],eax;TCMNumEdit.?f214:dword
 00076A63    mov         ax,word ptr [ebp+10]
 00076A67    mov         word ptr [edx+218],ax;TCMNumEdit.?f218:word
 00076A6E    mov         ax,word ptr [edx+22C];TCMNumEdit.?f22C:word
 00076A75    push        eax
 00076A76    push        dword ptr [edx+228];TCMNumEdit.?f228:dword
 00076A7C    push        dword ptr [edx+224];TCMNumEdit.Value:Extended
 00076A82    mov         eax,edx
 00076A84    call        TCMNumEdit.SetValue
 00076A89    pop         ebp
 00076A8A    ret         0C
end;*}

//00076A90
procedure TCMNumEdit.KeyPress(Key:Char);
begin
{*
 00076A90    push        ebp
 00076A91    mov         ebp,esp
 00076A93    xor         ecx,ecx
 00076A95    push        ecx
 00076A96    push        ecx
 00076A97    push        ecx
 00076A98    push        ecx
 00076A99    push        ecx
 00076A9A    push        ecx
 00076A9B    push        ebx
 00076A9C    push        esi
 00076A9D    push        edi
 00076A9E    mov         ebx,edx
 00076AA0    mov         esi,eax
 00076AA2    xor         eax,eax
 00076AA4    push        ebp
 00076AA5    push        76E08
 00076AAA    push        dword ptr fs:[eax]
 00076AAD    mov         dword ptr fs:[eax],esp
 00076AB0    mov         al,byte ptr [ebx]
 00076AB2    call        UpCase
 00076AB7    mov         byte ptr [ebx],al
 00076AB9    cmp         byte ptr [ebx],0D
>00076ABC    jne         00076ACD
 00076ABE    mov         eax,esi
 00076AC0    call        0007652C
 00076AC5    mov         byte ptr [ebx],0
>00076AC8    jmp         00076DD7
 00076ACD    cmp         byte ptr [ebx],8
>00076AD0    je          00076DD7
 00076AD6    mov         al,byte ptr [ebx]
 00076AD8    sub         al,3
>00076ADA    je          00076DD7
 00076AE0    sub         al,13
>00076AE2    je          00076DD7
 00076AE8    sub         al,2
>00076AEA    je          00076DD7
 00076AF0    cmp         byte ptr [ebx],1B
>00076AF3    jne         00076B1C
 00076AF5    mov         ax,word ptr [esi+222];TCMNumEdit.?f222:word
 00076AFC    push        eax
 00076AFD    push        dword ptr [esi+21E];TCMNumEdit.?f21E:dword
 00076B03    push        dword ptr [esi+21A];TCMNumEdit.?f21A:Extended
 00076B09    mov         eax,esi
 00076B0B    call        TCMNumEdit.SetValue
 00076B10    mov         eax,esi
 00076B12    call        TCustomEdit.SelectAll
>00076B17    jmp         00076DD7
 00076B1C    cmp         byte ptr [ebx],20
>00076B1F    ja          00076B29
 00076B21    mov         byte ptr [ebx],0
>00076B24    jmp         00076DD7
 00076B29    cmp         byte ptr [esi+22E],0;TCMNumEdit.Hex:Boolean
>00076B30    je          00076B68
 00076B32    lea         eax,[ebp-8]
 00076B35    mov         edx,dword ptr ds:[0B57D0];^'0123456789ABCDEFÈ'+#7
 00076B3B    mov         ecx,10
 00076B40    call        @LStrFromArray
 00076B45    mov         eax,dword ptr [ebp-8]
 00076B48    push        eax
 00076B49    lea         eax,[ebp-0C]
 00076B4C    mov         dl,byte ptr [ebx]
 00076B4E    call        @LStrFromChar
 00076B53    mov         eax,dword ptr [ebp-0C]
 00076B56    pop         edx
 00076B57    call        @LStrPos
 00076B5C    test        eax,eax
>00076B5E    jne         00076B68
 00076B60    mov         byte ptr [ebx],0
>00076B63    jmp         00076DD7
 00076B68    cmp         byte ptr [esi+22E],0;TCMNumEdit.Hex:Boolean
>00076B6F    jne         00076B94
 00076B71    cmp         byte ptr [ebx],30
>00076B74    jb          00076B7B
 00076B76    cmp         byte ptr [ebx],39
>00076B79    jbe         00076B94
 00076B7B    mov         al,byte ptr [ebx]
 00076B7D    mov         edx,dword ptr ds:[0B5BAC];^gvar_000B64FB:Char
 00076B83    cmp         al,byte ptr [edx]
>00076B85    je          00076B94
 00076B87    cmp         byte ptr [ebx],2D
>00076B8A    je          00076B94
 00076B8C    mov         byte ptr [ebx],0
>00076B8F    jmp         00076DD7
 00076B94    mov         al,byte ptr [ebx]
 00076B96    mov         edx,dword ptr ds:[0B5BAC];^gvar_000B64FB:Char
 00076B9C    cmp         al,byte ptr [edx]
>00076B9E    jne         00076BB1
 00076BA0    cmp         byte ptr [esi+204],0;TCMNumEdit.DigitsFrac:byte
>00076BA7    jne         00076BB1
 00076BA9    mov         byte ptr [ebx],0
>00076BAC    jmp         00076DD7
 00076BB1    mov         al,byte ptr [ebx]
 00076BB3    mov         edx,dword ptr ds:[0B5BAC];^gvar_000B64FB:Char
 00076BB9    cmp         al,byte ptr [edx]
>00076BBB    jne         00076BF0
 00076BBD    lea         edx,[ebp-10]
 00076BC0    mov         eax,esi
 00076BC2    call        TControl.GetText
 00076BC7    mov         eax,dword ptr [ebp-10]
 00076BCA    push        eax
 00076BCB    lea         eax,[ebp-8]
 00076BCE    mov         edx,dword ptr ds:[0B5BAC];^gvar_000B64FB:Char
 00076BD4    mov         dl,byte ptr [edx]
 00076BD6    call        @LStrFromChar
 00076BDB    mov         eax,dword ptr [ebp-8]
 00076BDE    pop         edx
 00076BDF    call        @LStrPos
 00076BE4    test        eax,eax
>00076BE6    jle         00076BF0
 00076BE8    mov         byte ptr [ebx],0
>00076BEB    jmp         00076DD7
 00076BF0    cmp         byte ptr [ebx],2D
>00076BF3    jne         00076C17
 00076BF5    fld         tbyte ptr [esi+206];TCMNumEdit.Min:Extended
 00076BFB    fcomp       dword ptr ds:[76E18];0:Single
 00076C01    fnstsw      al
 00076C03    sahf
>00076C04    jae         00076C0F
 00076C06    cmp         byte ptr [esi+22E],0;TCMNumEdit.Hex:Boolean
>00076C0D    je          00076C17
 00076C0F    mov         byte ptr [ebx],0
>00076C12    jmp         00076DD7
 00076C17    cmp         byte ptr [ebx],2D
>00076C1A    jne         00076C3F
 00076C1C    lea         edx,[ebp-10]
 00076C1F    mov         eax,esi
 00076C21    call        TControl.GetText
 00076C26    mov         edx,dword ptr [ebp-10]
 00076C29    mov         eax,76E24;'-'
 00076C2E    call        @LStrPos
 00076C33    test        eax,eax
>00076C35    jle         00076C3F
 00076C37    mov         byte ptr [ebx],0
>00076C3A    jmp         00076DD7
 00076C3F    lea         eax,[ebp-10]
 00076C42    push        eax
 00076C43    mov         eax,esi
 00076C45    mov         edx,dword ptr [eax]
 00076C47    call        dword ptr [edx+0C0];TCustomEdit.GetSelStart
 00076C4D    push        eax
 00076C4E    lea         edx,[ebp-14]
 00076C51    mov         eax,esi
 00076C53    call        TControl.GetText
 00076C58    mov         eax,dword ptr [ebp-14]
 00076C5B    mov         edx,1
 00076C60    pop         ecx
 00076C61    call        @LStrCopy
 00076C66    push        dword ptr [ebp-10]
 00076C69    lea         eax,[ebp-8]
 00076C6C    mov         dl,byte ptr [ebx]
 00076C6E    call        @LStrFromChar
 00076C73    push        dword ptr [ebp-8]
 00076C76    lea         eax,[ebp-14]
 00076C79    push        eax
 00076C7A    mov         eax,esi
 00076C7C    mov         edx,dword ptr [eax]
 00076C7E    call        dword ptr [edx+0C0];TCustomEdit.GetSelStart
 00076C84    mov         edi,eax
 00076C86    mov         eax,esi
 00076C88    mov         edx,dword ptr [eax]
 00076C8A    call        dword ptr [edx+0BC];TCustomEdit.GetSelLength
 00076C90    add         edi,eax
 00076C92    inc         edi
 00076C93    push        edi
 00076C94    lea         edx,[ebp-18]
 00076C97    mov         eax,esi
 00076C99    call        TControl.GetText
 00076C9E    mov         eax,dword ptr [ebp-18]
 00076CA1    mov         ecx,1F4
 00076CA6    pop         edx
 00076CA7    call        @LStrCopy
 00076CAC    push        dword ptr [ebp-14]
 00076CAF    lea         eax,[ebp-4]
 00076CB2    mov         edx,3
 00076CB7    call        @LStrCatN
 00076CBC    cmp         byte ptr [ebx],2D
>00076CBF    jne         00076CD9
 00076CC1    mov         edx,dword ptr [ebp-4]
 00076CC4    mov         eax,76E24;'-'
 00076CC9    call        @LStrPos
 00076CCE    dec         eax
>00076CCF    je          00076CD9
 00076CD1    mov         byte ptr [ebx],0
>00076CD4    jmp         00076DD7
 00076CD9    lea         eax,[ebp-8]
 00076CDC    mov         edx,dword ptr ds:[0B5BAC];^gvar_000B64FB:Char
 00076CE2    mov         dl,byte ptr [edx]
 00076CE4    call        @LStrFromChar
 00076CE9    mov         eax,dword ptr [ebp-8]
 00076CEC    mov         edx,dword ptr [ebp-4]
 00076CEF    call        @LStrPos
 00076CF4    test        eax,eax
>00076CF6    jle         00076D33
 00076CF8    lea         eax,[ebp-8]
 00076CFB    mov         edx,dword ptr ds:[0B5BAC];^gvar_000B64FB:Char
 00076D01    mov         dl,byte ptr [edx]
 00076D03    call        @LStrFromChar
 00076D08    mov         eax,dword ptr [ebp-8]
 00076D0B    mov         edx,dword ptr [ebp-4]
 00076D0E    call        @LStrPos
 00076D13    push        eax
 00076D14    mov         eax,dword ptr [ebp-4]
 00076D17    call        @LStrLen
 00076D1C    pop         edx
 00076D1D    sub         eax,edx
 00076D1F    xor         edx,edx
 00076D21    mov         dl,byte ptr [esi+204];TCMNumEdit.DigitsFrac:byte
 00076D27    cmp         eax,edx
>00076D29    jle         00076D33
 00076D2B    mov         byte ptr [ebx],0
>00076D2E    jmp         00076DD7
 00076D33    lea         eax,[ebp-8]
 00076D36    mov         edx,dword ptr ds:[0B5BAC];^gvar_000B64FB:Char
 00076D3C    mov         dl,byte ptr [edx]
 00076D3E    call        @LStrFromChar
 00076D43    mov         eax,dword ptr [ebp-8]
 00076D46    mov         edx,dword ptr [ebp-4]
 00076D49    call        @LStrPos
 00076D4E    test        eax,eax
>00076D50    jle         00076D90
 00076D52    lea         eax,[ebp-8]
 00076D55    mov         edx,dword ptr ds:[0B5BAC];^gvar_000B64FB:Char
 00076D5B    mov         dl,byte ptr [edx]
 00076D5D    call        @LStrFromChar
 00076D62    mov         eax,dword ptr [ebp-8]
 00076D65    mov         edx,dword ptr [ebp-4]
 00076D68    call        @LStrPos
 00076D6D    mov         edi,eax
 00076D6F    mov         edx,dword ptr [ebp-4]
 00076D72    mov         eax,76E24;'-'
 00076D77    call        @LStrPos
 00076D7C    sub         edi,eax
 00076D7E    xor         eax,eax
 00076D80    mov         al,byte ptr [esi+205];TCMNumEdit.DigitsInt:byte
 00076D86    inc         eax
 00076D87    cmp         edi,eax
>00076D89    jle         00076D90
 00076D8B    mov         byte ptr [ebx],0
>00076D8E    jmp         00076DD7
 00076D90    lea         eax,[ebp-8]
 00076D93    mov         edx,dword ptr ds:[0B5BAC];^gvar_000B64FB:Char
 00076D99    mov         dl,byte ptr [edx]
 00076D9B    call        @LStrFromChar
 00076DA0    mov         eax,dword ptr [ebp-8]
 00076DA3    mov         edx,dword ptr [ebp-4]
 00076DA6    call        @LStrPos
 00076DAB    test        eax,eax
>00076DAD    jne         00076DD7
 00076DAF    mov         edx,dword ptr [ebp-4]
 00076DB2    mov         eax,76E24;'-'
 00076DB7    call        @LStrPos
 00076DBC    push        eax
 00076DBD    mov         eax,dword ptr [ebp-4]
 00076DC0    call        @LStrLen
 00076DC5    pop         edx
 00076DC6    sub         eax,edx
 00076DC8    xor         edx,edx
 00076DCA    mov         dl,byte ptr [esi+205];TCMNumEdit.DigitsInt:byte
 00076DD0    cmp         eax,edx
>00076DD2    jle         00076DD7
 00076DD4    mov         byte ptr [ebx],0
 00076DD7    mov         edx,ebx
 00076DD9    mov         eax,esi
 00076DDB    call        TWinControl.KeyPress
 00076DE0    xor         eax,eax
 00076DE2    pop         edx
 00076DE3    pop         ecx
 00076DE4    pop         ecx
 00076DE5    mov         dword ptr fs:[eax],edx
 00076DE8    push        76E0F
 00076DED    lea         eax,[ebp-18]
 00076DF0    mov         edx,3
 00076DF5    call        @LStrArrayClr
 00076DFA    lea         eax,[ebp-0C]
 00076DFD    mov         edx,3
 00076E02    call        @LStrArrayClr
 00076E07    ret
>00076E08    jmp         @HandleFinally
>00076E0D    jmp         00076DED
 00076E0F    pop         edi
 00076E10    pop         esi
 00076E11    pop         ebx
 00076E12    mov         esp,ebp
 00076E14    pop         ebp
 00076E15    ret
*}
end;

//00076E28
constructor TCMByteEdit.Create(AOwner:TComponent);
begin
{*
 00076E28    push        ebx
 00076E29    push        esi
 00076E2A    test        dl,dl
>00076E2C    je          00076E36
 00076E2E    add         esp,0FFFFFFF0
 00076E31    call        @ClassCreate
 00076E36    mov         ebx,edx
 00076E38    mov         esi,eax
 00076E3A    xor         edx,edx
 00076E3C    mov         eax,esi
 00076E3E    call        TCustomEdit.Create
 00076E43    mov         dl,1
 00076E45    mov         eax,[0001F340];TStringList
 00076E4A    call        TObject.Create;TStringList.Create
 00076E4F    mov         dword ptr [esi+204],eax;TCMByteEdit.?f204:TStringList
 00076E55    xor         eax,eax
 00076E57    mov         dword ptr [esi+208],eax;TCMByteEdit.MaxBytes:Cardinal
 00076E5D    mov         eax,esi
 00076E5F    test        bl,bl
>00076E61    je          00076E72
 00076E63    call        @AfterConstruction
 00076E68    pop         dword ptr fs:[0]
 00076E6F    add         esp,0C
 00076E72    mov         eax,esi
 00076E74    pop         esi
 00076E75    pop         ebx
 00076E76    ret
*}
end;

//00076E78
destructor TCMByteEdit.Destroy;
begin
{*
 00076E78    push        ebx
 00076E79    push        esi
 00076E7A    call        @BeforeDestruction
 00076E7F    mov         ebx,edx
 00076E81    mov         esi,eax
 00076E83    mov         eax,dword ptr [esi+204];TCMByteEdit.?f204:TStringList
 00076E89    call        TObject.Free
 00076E8E    mov         edx,ebx
 00076E90    and         dl,0FC
 00076E93    mov         eax,esi
 00076E95    call        TWinControl.Destroy
 00076E9A    test        bl,bl
>00076E9C    jle         00076EA5
 00076E9E    mov         eax,esi
 00076EA0    call        @ClassDestroy
 00076EA5    pop         esi
 00076EA6    pop         ebx
 00076EA7    ret
*}
end;

//00076EA8
procedure TCMByteEdit.SetASCII(Value:AnsiString);
begin
{*
 00076EA8    push        ebp
 00076EA9    mov         ebp,esp
 00076EAB    add         esp,0FFFFFFF8
 00076EAE    push        ebx
 00076EAF    xor         ecx,ecx
 00076EB1    mov         dword ptr [ebp-8],ecx
 00076EB4    mov         dword ptr [ebp-4],edx
 00076EB7    mov         ebx,eax
 00076EB9    mov         eax,dword ptr [ebp-4]
 00076EBC    call        @LStrAddRef
 00076EC1    xor         eax,eax
 00076EC3    push        ebp
 00076EC4    push        76F01
 00076EC9    push        dword ptr fs:[eax]
 00076ECC    mov         dword ptr fs:[eax],esp
 00076ECF    lea         ecx,[ebp-8]
 00076ED2    mov         dl,1
 00076ED4    mov         eax,dword ptr [ebp-4]
 00076ED7    call        00074D04
 00076EDC    mov         edx,dword ptr [ebp-8]
 00076EDF    mov         eax,ebx
 00076EE1    call        TControl.SetText
 00076EE6    xor         eax,eax
 00076EE8    pop         edx
 00076EE9    pop         ecx
 00076EEA    pop         ecx
 00076EEB    mov         dword ptr fs:[eax],edx
 00076EEE    push        76F08
 00076EF3    lea         eax,[ebp-8]
 00076EF6    mov         edx,2
 00076EFB    call        @LStrArrayClr
 00076F00    ret
>00076F01    jmp         @HandleFinally
>00076F06    jmp         00076EF3
 00076F08    pop         ebx
 00076F09    pop         ecx
 00076F0A    pop         ecx
 00076F0B    pop         ebp
 00076F0C    ret
*}
end;

//00076F10
procedure TCMByteEdit.GetASCII(?:AnsiString);
begin
{*
 00076F10    push        ebp
 00076F11    mov         ebp,esp
 00076F13    add         esp,0FFFFFFF0
 00076F16    push        ebx
 00076F17    push        esi
 00076F18    push        edi
 00076F19    xor         ecx,ecx
 00076F1B    mov         dword ptr [ebp-0C],ecx
 00076F1E    mov         dword ptr [ebp-10],ecx
 00076F21    mov         esi,edx
 00076F23    mov         dword ptr [ebp-4],eax
 00076F26    xor         eax,eax
 00076F28    push        ebp
 00076F29    push        76FB5
 00076F2E    push        dword ptr fs:[eax]
 00076F31    mov         dword ptr fs:[eax],esp
 00076F34    mov         eax,esi
 00076F36    call        @LStrClr
 00076F3B    mov         eax,dword ptr [ebp-4]
 00076F3E    call        00076FEC
 00076F43    test        al,al
>00076F45    je          00076F9A
 00076F47    mov         eax,dword ptr [ebp-4]
 00076F4A    mov         eax,dword ptr [eax+204];TCMByteEdit.?f204:TStringList
 00076F50    mov         edx,dword ptr [eax]
 00076F52    call        dword ptr [edx+14];TStringList.GetCount
 00076F55    mov         ebx,eax
 00076F57    dec         ebx
 00076F58    test        ebx,ebx
>00076F5A    jl          00076F9A
 00076F5C    inc         ebx
 00076F5D    mov         dword ptr [ebp-8],0
 00076F64    lea         ecx,[ebp-10]
 00076F67    mov         eax,dword ptr [ebp-4]
 00076F6A    mov         eax,dword ptr [eax+204];TCMByteEdit.?f204:TStringList
 00076F70    mov         edx,dword ptr [ebp-8]
 00076F73    mov         edi,dword ptr [eax]
 00076F75    call        dword ptr [edi+0C];TStringList.Get
 00076F78    mov         eax,dword ptr [ebp-10]
 00076F7B    call        0007507C
 00076F80    mov         edx,eax
 00076F82    lea         eax,[ebp-0C]
 00076F85    call        @LStrFromChar
 00076F8A    mov         edx,dword ptr [ebp-0C]
 00076F8D    mov         eax,esi
 00076F8F    call        @LStrCat
 00076F94    inc         dword ptr [ebp-8]
 00076F97    dec         ebx
>00076F98    jne         00076F64
 00076F9A    xor         eax,eax
 00076F9C    pop         edx
 00076F9D    pop         ecx
 00076F9E    pop         ecx
 00076F9F    mov         dword ptr fs:[eax],edx
 00076FA2    push        76FBC
 00076FA7    lea         eax,[ebp-10]
 00076FAA    mov         edx,2
 00076FAF    call        @LStrArrayClr
 00076FB4    ret
>00076FB5    jmp         @HandleFinally
>00076FBA    jmp         00076FA7
 00076FBC    pop         edi
 00076FBD    pop         esi
 00076FBE    pop         ebx
 00076FBF    mov         esp,ebp
 00076FC1    pop         ebp
 00076FC2    ret
*}
end;

//00076FC4
procedure TCMByteEdit.SetMaxBytes(Value:Cardinal);
begin
{*
 00076FC4    cmp         edx,dword ptr [eax+208];TCMByteEdit.MaxBytes:Cardinal
>00076FCA    je          00076FEA
 00076FCC    mov         ecx,edx
 00076FCE    mov         dword ptr [eax+208],ecx;TCMByteEdit.MaxBytes:Cardinal
 00076FD4    test        ecx,ecx
>00076FD6    jne         00076FE1
 00076FD8    xor         edx,edx
 00076FDA    call        TCustomEdit.SetMaxLength
>00076FDF    jmp         00076FEA
 00076FE1    lea         edx,[ecx+ecx*2]
 00076FE4    dec         edx
 00076FE5    call        TCustomEdit.SetMaxLength
 00076FEA    ret
*}
end;

//00076FEC
{*function sub_00076FEC(?:TCMByteEdit):?;
begin
 00076FEC    push        ebp
 00076FED    mov         ebp,esp
 00076FEF    add         esp,0FFFFFFF0
 00076FF2    push        ebx
 00076FF3    push        esi
 00076FF4    push        edi
 00076FF5    xor         edx,edx
 00076FF7    mov         dword ptr [ebp-10],edx
 00076FFA    mov         dword ptr [ebp-0C],edx
 00076FFD    mov         ebx,eax
 00076FFF    xor         eax,eax
 00077001    push        ebp
 00077002    push        770BF
 00077007    push        dword ptr fs:[eax]
 0007700A    mov         dword ptr fs:[eax],esp
 0007700D    lea         edx,[ebp-0C]
 00077010    mov         eax,ebx
 00077012    call        TControl.GetText
 00077017    mov         eax,dword ptr [ebp-0C]
 0007701A    mov         dl,1
 0007701C    call        00074DB0
 00077021    mov         byte ptr [ebp-1],al
 00077024    cmp         byte ptr [ebp-1],0
>00077028    je          000770A1
 0007702A    mov         eax,dword ptr [ebx+204];TCMByteEdit.?f204:TStringList
 00077030    mov         edx,dword ptr [eax]
 00077032    call        dword ptr [edx+40];TStringList.Clear
 00077035    lea         edx,[ebp-0C]
 00077038    mov         eax,ebx
 0007703A    call        TControl.GetText
 0007703F    mov         eax,dword ptr [ebp-0C]
 00077042    lea         edx,[ebp-10]
 00077045    call        Trim
 0007704A    mov         eax,dword ptr [ebp-10]
 0007704D    mov         ecx,dword ptr [ebx+204];TCMByteEdit.?f204:TStringList
 00077053    mov         edx,770D8;' '
 00077058    call        00074084
 0007705D    mov         eax,dword ptr [ebx+204];TCMByteEdit.?f204:TStringList
 00077063    mov         edx,dword ptr [eax]
 00077065    call        dword ptr [edx+14];TStringList.GetCount
 00077068    mov         esi,eax
 0007706A    dec         esi
 0007706B    test        esi,esi
>0007706D    jl          000770A1
 0007706F    inc         esi
 00077070    mov         dword ptr [ebp-8],0
 00077077    lea         ecx,[ebp-10]
 0007707A    mov         edx,dword ptr [ebp-8]
 0007707D    mov         eax,dword ptr [ebx+204];TCMByteEdit.?f204:TStringList
 00077083    mov         edi,dword ptr [eax]
 00077085    call        dword ptr [edi+0C];TStringList.Get
 00077088    mov         eax,dword ptr [ebp-10]
 0007708B    call        @LStrLen
 00077090    cmp         eax,2
>00077093    je          0007709B
 00077095    mov         byte ptr [ebp-1],0
>00077099    jmp         000770A1
 0007709B    inc         dword ptr [ebp-8]
 0007709E    dec         esi
>0007709F    jne         00077077
 000770A1    xor         eax,eax
 000770A3    pop         edx
 000770A4    pop         ecx
 000770A5    pop         ecx
 000770A6    mov         dword ptr fs:[eax],edx
 000770A9    push        770C6
 000770AE    lea         eax,[ebp-10]
 000770B1    call        @LStrClr
 000770B6    lea         eax,[ebp-0C]
 000770B9    call        @LStrClr
 000770BE    ret
>000770BF    jmp         @HandleFinally
>000770C4    jmp         000770AE
 000770C6    mov         al,byte ptr [ebp-1]
 000770C9    pop         edi
 000770CA    pop         esi
 000770CB    pop         ebx
 000770CC    mov         esp,ebp
 000770CE    pop         ebp
 000770CF    ret
end;*}

//000770DC
procedure TCMByteEdit.Change;
begin
{*
 000770DC    push        ebp
 000770DD    mov         ebp,esp
 000770DF    mov         ecx,5
 000770E4    push        0
 000770E6    push        0
 000770E8    dec         ecx
>000770E9    jne         000770E4
 000770EB    push        ebx
 000770EC    push        esi
 000770ED    push        edi
 000770EE    mov         ebx,eax
 000770F0    xor         eax,eax
 000770F2    push        ebp
 000770F3    push        77532
 000770F8    push        dword ptr fs:[eax]
 000770FB    mov         dword ptr fs:[eax],esp
 000770FE    mov         eax,ebx
 00077100    call        TWinControl.HandleAllocated
 00077105    test        al,al
>00077107    je          000774FA
 0007710D    mov         eax,ebx
 0007710F    mov         edx,dword ptr [eax]
 00077111    call        dword ptr [edx+0C0];TCustomEdit.GetSelStart
 00077117    mov         dword ptr [ebp-4],eax
 0007711A    lea         edx,[ebp-14]
 0007711D    mov         eax,ebx
 0007711F    call        TControl.GetText
 00077124    mov         eax,dword ptr [ebp-14]
 00077127    call        @LStrLen
 0007712C    cmp         eax,dword ptr [ebp-4]
 0007712F    sete        byte ptr [ebp-5]
 00077133    lea         edx,[ebp-14]
 00077136    mov         eax,ebx
 00077138    call        TControl.GetText
 0007713D    mov         eax,dword ptr [ebp-14]
 00077140    call        @LStrLen
 00077145    cmp         eax,dword ptr [ebp-4]
>00077148    jle         00077177
 0007714A    lea         edx,[ebp-14]
 0007714D    mov         eax,ebx
 0007714F    call        TControl.GetText
 00077154    mov         eax,dword ptr [ebp-14]
 00077157    mov         edx,dword ptr [ebp-4]
 0007715A    cmp         byte ptr [eax+edx-1],20
>0007715F    je          00077177
 00077161    lea         edx,[ebp-18]
 00077164    mov         eax,ebx
 00077166    call        TControl.GetText
 0007716B    mov         eax,dword ptr [ebp-18]
 0007716E    mov         edx,dword ptr [ebp-4]
 00077171    cmp         byte ptr [eax+edx],20
>00077175    jne         0007717B
 00077177    xor         eax,eax
>00077179    jmp         0007717D
 0007717B    mov         al,1
 0007717D    mov         byte ptr [ebp-6],al
 00077180    mov         eax,dword ptr [ebx+204];TCMByteEdit.?f204:TStringList
 00077186    mov         edx,dword ptr [eax]
 00077188    call        dword ptr [edx+40];TStringList.Clear
 0007718B    lea         edx,[ebp-14]
 0007718E    mov         eax,ebx
 00077190    call        TControl.GetText
 00077195    mov         eax,dword ptr [ebp-14]
 00077198    lea         edx,[ebp-1C]
 0007719B    call        Trim
 000771A0    mov         eax,dword ptr [ebp-1C]
 000771A3    mov         ecx,dword ptr [ebx+204];TCMByteEdit.?f204:TStringList
 000771A9    mov         edx,77548;' '
 000771AE    call        00074084
 000771B3    lea         eax,[ebp-0C]
 000771B6    call        @LStrClr
 000771BB    mov         eax,dword ptr [ebx+204];TCMByteEdit.?f204:TStringList
 000771C1    mov         edx,dword ptr [eax]
 000771C3    call        dword ptr [edx+14];TStringList.GetCount
 000771C6    dec         eax
 000771C7    test        eax,eax
>000771C9    jl          000773A6
 000771CF    inc         eax
 000771D0    mov         dword ptr [ebp-10],eax
 000771D3    xor         esi,esi
 000771D5    lea         ecx,[ebp-1C]
 000771D8    mov         edx,esi
 000771DA    mov         eax,dword ptr [ebx+204];TCMByteEdit.?f204:TStringList
 000771E0    mov         edi,dword ptr [eax]
 000771E2    call        dword ptr [edi+0C];TStringList.Get
 000771E5    cmp         dword ptr [ebp-1C],0
>000771E9    je          0007739C
 000771EF    lea         ecx,[ebp-1C]
 000771F2    mov         edx,esi
 000771F4    mov         eax,dword ptr [ebx+204];TCMByteEdit.?f204:TStringList
 000771FA    mov         edi,dword ptr [eax]
 000771FC    call        dword ptr [edi+0C];TStringList.Get
 000771FF    mov         eax,dword ptr [ebp-1C]
 00077202    call        @LStrLen
 00077207    cmp         eax,4
>0007720A    jne         00077278
 0007720C    push        dword ptr [ebp-0C]
 0007720F    lea         eax,[ebp-1C]
 00077212    push        eax
 00077213    lea         ecx,[ebp-20]
 00077216    mov         edx,esi
 00077218    mov         eax,dword ptr [ebx+204];TCMByteEdit.?f204:TStringList
 0007721E    mov         edi,dword ptr [eax]
 00077220    call        dword ptr [edi+0C];TStringList.Get
 00077223    mov         eax,dword ptr [ebp-20]
 00077226    mov         ecx,2
 0007722B    mov         edx,1
 00077230    call        @LStrCopy
 00077235    push        dword ptr [ebp-1C]
 00077238    push        77548;' '
 0007723D    lea         eax,[ebp-20]
 00077240    push        eax
 00077241    lea         ecx,[ebp-24]
 00077244    mov         edx,esi
 00077246    mov         eax,dword ptr [ebx+204];TCMByteEdit.?f204:TStringList
 0007724C    mov         edi,dword ptr [eax]
 0007724E    call        dword ptr [edi+0C];TStringList.Get
 00077251    mov         eax,dword ptr [ebp-24]
 00077254    mov         ecx,2
 00077259    mov         edx,3
 0007725E    call        @LStrCopy
 00077263    push        dword ptr [ebp-20]
 00077266    lea         eax,[ebp-0C]
 00077269    mov         edx,4
 0007726E    call        @LStrCatN
>00077273    jmp         0007738F
 00077278    lea         ecx,[ebp-1C]
 0007727B    mov         edx,esi
 0007727D    mov         eax,dword ptr [ebx+204];TCMByteEdit.?f204:TStringList
 00077283    mov         edi,dword ptr [eax]
 00077285    call        dword ptr [edi+0C];TStringList.Get
 00077288    mov         eax,dword ptr [ebp-1C]
 0007728B    call        @LStrLen
 00077290    cmp         eax,3
>00077293    jne         00077374
 00077299    cmp         byte ptr [ebp-6],0
>0007729D    je          0007730B
 0007729F    push        dword ptr [ebp-0C]
 000772A2    lea         eax,[ebp-1C]
 000772A5    push        eax
 000772A6    lea         ecx,[ebp-20]
 000772A9    mov         edx,esi
 000772AB    mov         eax,dword ptr [ebx+204];TCMByteEdit.?f204:TStringList
 000772B1    mov         edi,dword ptr [eax]
 000772B3    call        dword ptr [edi+0C];TStringList.Get
 000772B6    mov         eax,dword ptr [ebp-20]
 000772B9    mov         ecx,1
 000772BE    mov         edx,1
 000772C3    call        @LStrCopy
 000772C8    push        dword ptr [ebp-1C]
 000772CB    push        77548;' '
 000772D0    lea         eax,[ebp-20]
 000772D3    push        eax
 000772D4    lea         ecx,[ebp-24]
 000772D7    mov         edx,esi
 000772D9    mov         eax,dword ptr [ebx+204];TCMByteEdit.?f204:TStringList
 000772DF    mov         edi,dword ptr [eax]
 000772E1    call        dword ptr [edi+0C];TStringList.Get
 000772E4    mov         eax,dword ptr [ebp-24]
 000772E7    mov         ecx,2
 000772EC    mov         edx,2
 000772F1    call        @LStrCopy
 000772F6    push        dword ptr [ebp-20]
 000772F9    lea         eax,[ebp-0C]
 000772FC    mov         edx,4
 00077301    call        @LStrCatN
>00077306    jmp         0007738F
 0007730B    push        dword ptr [ebp-0C]
 0007730E    lea         eax,[ebp-1C]
 00077311    push        eax
 00077312    lea         ecx,[ebp-20]
 00077315    mov         edx,esi
 00077317    mov         eax,dword ptr [ebx+204];TCMByteEdit.?f204:TStringList
 0007731D    mov         edi,dword ptr [eax]
 0007731F    call        dword ptr [edi+0C];TStringList.Get
 00077322    mov         eax,dword ptr [ebp-20]
 00077325    mov         ecx,2
 0007732A    mov         edx,1
 0007732F    call        @LStrCopy
 00077334    push        dword ptr [ebp-1C]
 00077337    push        77548;' '
 0007733C    lea         eax,[ebp-20]
 0007733F    push        eax
 00077340    lea         ecx,[ebp-24]
 00077343    mov         edx,esi
 00077345    mov         eax,dword ptr [ebx+204];TCMByteEdit.?f204:TStringList
 0007734B    mov         edi,dword ptr [eax]
 0007734D    call        dword ptr [edi+0C];TStringList.Get
 00077350    mov         eax,dword ptr [ebp-24]
 00077353    mov         ecx,1
 00077358    mov         edx,3
 0007735D    call        @LStrCopy
 00077362    push        dword ptr [ebp-20]
 00077365    lea         eax,[ebp-0C]
 00077368    mov         edx,4
 0007736D    call        @LStrCatN
>00077372    jmp         0007738F
 00077374    lea         ecx,[ebp-1C]
 00077377    mov         edx,esi
 00077379    mov         eax,dword ptr [ebx+204];TCMByteEdit.?f204:TStringList
 0007737F    mov         edi,dword ptr [eax]
 00077381    call        dword ptr [edi+0C];TStringList.Get
 00077384    mov         edx,dword ptr [ebp-1C]
 00077387    lea         eax,[ebp-0C]
 0007738A    call        @LStrCat
 0007738F    lea         eax,[ebp-0C]
 00077392    mov         edx,77548;' '
 00077397    call        @LStrCat
 0007739C    inc         esi
 0007739D    dec         dword ptr [ebp-10]
>000773A0    jne         000771D5
 000773A6    lea         edx,[ebp-1C]
 000773A9    mov         eax,dword ptr [ebp-0C]
 000773AC    call        Trim
 000773B1    mov         edx,dword ptr [ebp-1C]
 000773B4    mov         eax,ebx
 000773B6    call        TControl.SetText
 000773BB    cmp         byte ptr [ebp-6],0
>000773BF    je          000773D0
 000773C1    mov         edx,dword ptr [ebp-4]
 000773C4    mov         eax,ebx
 000773C6    mov         ecx,dword ptr [eax]
 000773C8    call        dword ptr [ecx+0CC];TCustomEdit.SetSelStart
>000773CE    jmp         00077420
 000773D0    cmp         byte ptr [ebp-5],0
>000773D4    jne         00077403
 000773D6    lea         edx,[ebp-14]
 000773D9    mov         eax,ebx
 000773DB    call        TControl.GetText
 000773E0    mov         eax,dword ptr [ebp-14]
 000773E3    call        @LStrLen
 000773E8    cmp         eax,dword ptr [ebp-4]
>000773EB    jle         00077413
 000773ED    lea         edx,[ebp-14]
 000773F0    mov         eax,ebx
 000773F2    call        TControl.GetText
 000773F7    mov         eax,dword ptr [ebp-14]
 000773FA    mov         edx,dword ptr [ebp-4]
 000773FD    cmp         byte ptr [eax+edx],20
>00077401    jne         00077413
 00077403    mov         edx,dword ptr [ebp-4]
 00077406    inc         edx
 00077407    mov         eax,ebx
 00077409    mov         ecx,dword ptr [eax]
 0007740B    call        dword ptr [ecx+0CC];TCustomEdit.SetSelStart
>00077411    jmp         00077420
 00077413    mov         edx,dword ptr [ebp-4]
 00077416    mov         eax,ebx
 00077418    mov         ecx,dword ptr [eax]
 0007741A    call        dword ptr [ecx+0CC];TCustomEdit.SetSelStart
 00077420    mov         eax,ebx
 00077422    mov         edx,dword ptr [eax]
 00077424    call        dword ptr [edx+0C0];TCustomEdit.GetSelStart
 0007742A    cmp         eax,2
>0007742D    jle         000774A8
 0007742F    mov         eax,ebx
 00077431    mov         edx,dword ptr [eax]
 00077433    call        dword ptr [edx+0C0];TCustomEdit.GetSelStart
 00077439    mov         esi,eax
 0007743B    lea         edx,[ebp-14]
 0007743E    mov         eax,ebx
 00077440    call        TControl.GetText
 00077445    mov         eax,dword ptr [ebp-14]
 00077448    cmp         byte ptr [eax+esi-3],20
>0007744D    jne         000774A8
 0007744F    mov         eax,ebx
 00077451    mov         edx,dword ptr [eax]
 00077453    call        dword ptr [edx+0C0];TCustomEdit.GetSelStart
 00077459    mov         esi,eax
 0007745B    lea         edx,[ebp-18]
 0007745E    mov         eax,ebx
 00077460    call        TControl.GetText
 00077465    mov         eax,dword ptr [ebp-18]
 00077468    cmp         byte ptr [eax+esi-2],20
>0007746D    je          000774A8
 0007746F    mov         eax,ebx
 00077471    mov         edx,dword ptr [eax]
 00077473    call        dword ptr [edx+0C0];TCustomEdit.GetSelStart
 00077479    mov         esi,eax
 0007747B    lea         edx,[ebp-28]
 0007747E    mov         eax,ebx
 00077480    call        TControl.GetText
 00077485    mov         eax,dword ptr [ebp-28]
 00077488    cmp         byte ptr [eax+esi-1],20
>0007748D    jne         000774A8
 0007748F    mov         eax,ebx
 00077491    mov         edx,dword ptr [eax]
 00077493    call        dword ptr [edx+0C0];TCustomEdit.GetSelStart
 00077499    mov         edx,eax
 0007749B    dec         edx
 0007749C    mov         eax,ebx
 0007749E    mov         ecx,dword ptr [eax]
 000774A0    call        dword ptr [ecx+0CC];TCustomEdit.SetSelStart
>000774A6    jmp         000774F3
 000774A8    mov         eax,ebx
 000774AA    mov         edx,dword ptr [eax]
 000774AC    call        dword ptr [edx+0C0];TCustomEdit.GetSelStart
 000774B2    cmp         eax,2
>000774B5    jne         000774F3
 000774B7    lea         edx,[ebp-14]
 000774BA    mov         eax,ebx
 000774BC    call        TControl.GetText
 000774C1    mov         eax,dword ptr [ebp-14]
 000774C4    cmp         byte ptr [eax],20
>000774C7    je          000774F3
 000774C9    lea         edx,[ebp-18]
 000774CC    mov         eax,ebx
 000774CE    call        TControl.GetText
 000774D3    mov         eax,dword ptr [ebp-18]
 000774D6    cmp         byte ptr [eax+1],20
>000774DA    jne         000774F3
 000774DC    mov         eax,ebx
 000774DE    mov         edx,dword ptr [eax]
 000774E0    call        dword ptr [edx+0C0];TCustomEdit.GetSelStart
 000774E6    mov         edx,eax
 000774E8    dec         edx
 000774E9    mov         eax,ebx
 000774EB    mov         ecx,dword ptr [eax]
 000774ED    call        dword ptr [ecx+0CC];TCustomEdit.SetSelStart
 000774F3    mov         eax,ebx
 000774F5    call        TCustomEdit.Change
 000774FA    xor         eax,eax
 000774FC    pop         edx
 000774FD    pop         ecx
 000774FE    pop         ecx
 000774FF    mov         dword ptr fs:[eax],edx
 00077502    push        77539
 00077507    lea         eax,[ebp-28]
 0007750A    call        @LStrClr
 0007750F    lea         eax,[ebp-24]
 00077512    mov         edx,3
 00077517    call        @LStrArrayClr
 0007751C    lea         eax,[ebp-18]
 0007751F    mov         edx,2
 00077524    call        @LStrArrayClr
 00077529    lea         eax,[ebp-0C]
 0007752C    call        @LStrClr
 00077531    ret
>00077532    jmp         @HandleFinally
>00077537    jmp         00077507
 00077539    pop         edi
 0007753A    pop         esi
 0007753B    pop         ebx
 0007753C    mov         esp,ebp
 0007753E    pop         ebp
 0007753F    ret
*}
end;

//0007754C
procedure TCMByteEdit.KeyPress(Key:Char);
begin
{*
 0007754C    push        ebp
 0007754D    mov         ebp,esp
 0007754F    push        0
 00077551    push        0
 00077553    push        0
 00077555    push        ebx
 00077556    push        esi
 00077557    push        edi
 00077558    mov         ebx,edx
 0007755A    mov         esi,eax
 0007755C    xor         eax,eax
 0007755E    push        ebp
 0007755F    push        776B6
 00077564    push        dword ptr fs:[eax]
 00077567    mov         dword ptr fs:[eax],esp
 0007756A    mov         al,byte ptr [ebx]
 0007756C    call        UpCase
 00077571    mov         byte ptr [ebx],al
 00077573    cmp         byte ptr [ebx],8
>00077576    jne         000775DB
 00077578    mov         eax,esi
 0007757A    mov         edx,dword ptr [eax]
 0007757C    call        dword ptr [edx+0BC];TCustomEdit.GetSelLength
 00077582    mov         edi,eax
 00077584    lea         edx,[ebp-4]
 00077587    mov         eax,esi
 00077589    call        TControl.GetText
 0007758E    mov         eax,dword ptr [ebp-4]
 00077591    call        @LStrLen
 00077596    cmp         edi,eax
>00077598    je          00077692
 0007759E    mov         eax,esi
 000775A0    mov         edx,dword ptr [eax]
 000775A2    call        dword ptr [edx+0C0];TCustomEdit.GetSelStart
 000775A8    test        eax,eax
>000775AA    je          000775D3
 000775AC    mov         eax,esi
 000775AE    mov         edx,dword ptr [eax]
 000775B0    call        dword ptr [edx+0C0];TCustomEdit.GetSelStart
 000775B6    mov         edi,eax
 000775B8    lea         edx,[ebp-4]
 000775BB    mov         eax,esi
 000775BD    call        TControl.GetText
 000775C2    mov         eax,dword ptr [ebp-4]
 000775C5    call        @LStrLen
 000775CA    dec         eax
 000775CB    cmp         edi,eax
>000775CD    jge         00077692
 000775D3    mov         byte ptr [ebx],0
>000775D6    jmp         00077692
 000775DB    mov         al,byte ptr [ebx]
 000775DD    sub         al,3
>000775DF    je          00077692
 000775E5    sub         al,13
>000775E7    je          00077692
 000775ED    sub         al,2
>000775EF    je          00077692
 000775F5    mov         al,byte ptr [ebx]
 000775F7    sub         al,8
>000775F9    je          0007760F
 000775FB    add         al,0D8
 000775FD    sub         al,0A
>000775FF    jb          0007760F
 00077601    add         al,0F9
 00077603    sub         al,6
>00077605    jb          0007760F
 00077607    mov         byte ptr [ebx],0
>0007760A    jmp         00077692
 0007760F    mov         eax,esi
 00077611    mov         edx,dword ptr [eax]
 00077613    call        dword ptr [edx+0C0];TCustomEdit.GetSelStart
 00077619    dec         eax
>0007761A    jle         00077692
 0007761C    mov         eax,esi
 0007761E    mov         edx,dword ptr [eax]
 00077620    call        dword ptr [edx+0C0];TCustomEdit.GetSelStart
 00077626    mov         edi,eax
 00077628    lea         edx,[ebp-4]
 0007762B    mov         eax,esi
 0007762D    call        TControl.GetText
 00077632    mov         eax,dword ptr [ebp-4]
 00077635    cmp         byte ptr [eax+edi-2],20
>0007763A    je          00077692
 0007763C    mov         eax,esi
 0007763E    mov         edx,dword ptr [eax]
 00077640    call        dword ptr [edx+0C0];TCustomEdit.GetSelStart
 00077646    mov         edi,eax
 00077648    lea         edx,[ebp-8]
 0007764B    mov         eax,esi
 0007764D    call        TControl.GetText
 00077652    mov         eax,dword ptr [ebp-8]
 00077655    cmp         byte ptr [eax+edi-1],20
>0007765A    je          00077692
 0007765C    mov         eax,esi
 0007765E    mov         edx,dword ptr [eax]
 00077660    call        dword ptr [edx+0C0];TCustomEdit.GetSelStart
 00077666    mov         edi,eax
 00077668    lea         edx,[ebp-0C]
 0007766B    mov         eax,esi
 0007766D    call        TControl.GetText
 00077672    mov         eax,dword ptr [ebp-0C]
 00077675    cmp         byte ptr [eax+edi],20
>00077679    jne         00077692
 0007767B    mov         eax,esi
 0007767D    mov         edx,dword ptr [eax]
 0007767F    call        dword ptr [edx+0C0];TCustomEdit.GetSelStart
 00077685    mov         edx,eax
 00077687    inc         edx
 00077688    mov         eax,esi
 0007768A    mov         ecx,dword ptr [eax]
 0007768C    call        dword ptr [ecx+0CC];TCustomEdit.SetSelStart
 00077692    mov         edx,ebx
 00077694    mov         eax,esi
 00077696    call        TWinControl.KeyPress
 0007769B    xor         eax,eax
 0007769D    pop         edx
 0007769E    pop         ecx
 0007769F    pop         ecx
 000776A0    mov         dword ptr fs:[eax],edx
 000776A3    push        776BD
 000776A8    lea         eax,[ebp-0C]
 000776AB    mov         edx,3
 000776B0    call        @LStrArrayClr
 000776B5    ret
>000776B6    jmp         @HandleFinally
>000776BB    jmp         000776A8
 000776BD    pop         edi
 000776BE    pop         esi
 000776BF    pop         ebx
 000776C0    mov         esp,ebp
 000776C2    pop         ebp
 000776C3    ret
*}
end;

//000776C4
procedure TCMByteEdit.KeyUp(Key:Word; Shift:TShiftState);
begin
{*
 000776C4    push        ebp
 000776C5    mov         ebp,esp
 000776C7    push        0
 000776C9    push        0
 000776CB    push        0
 000776CD    push        0
 000776CF    push        0
 000776D1    push        0
 000776D3    push        ebx
 000776D4    push        esi
 000776D5    push        edi
 000776D6    mov         byte ptr [ebp-5],cl
 000776D9    mov         ebx,edx
 000776DB    mov         dword ptr [ebp-4],eax
 000776DE    xor         eax,eax
 000776E0    push        ebp
 000776E1    push        777F0
 000776E6    push        dword ptr fs:[eax]
 000776E9    mov         dword ptr fs:[eax],esp
 000776EC    cmp         word ptr [ebx],56
>000776F0    jne         000777C8
 000776F6    mov         al,[00077800];0x4 gvar_00077800
 000776FB    cmp         al,byte ptr [ebp-5]
>000776FE    jne         000777C8
 00077704    lea         edx,[ebp-14]
 00077707    mov         eax,dword ptr [ebp-4]
 0007770A    call        TControl.GetText
 0007770F    mov         eax,dword ptr [ebp-14]
 00077712    lea         edx,[ebp-10]
 00077715    call        Trim
 0007771A    mov         edx,dword ptr [ebp-10]
 0007771D    mov         eax,dword ptr [ebp-4]
 00077720    call        TControl.SetText
 00077725    lea         eax,[ebp-14]
 00077728    push        eax
 00077729    lea         edx,[ebp-18]
 0007772C    mov         eax,dword ptr [ebp-4]
 0007772F    call        TControl.GetText
 00077734    mov         eax,dword ptr [ebp-18]
 00077737    mov         ecx,1
 0007773C    mov         edx,3
 00077741    call        @LStrCopy
 00077746    mov         eax,dword ptr [ebp-14]
 00077749    mov         edx,7780C;' '
 0007774E    call        @LStrCmp
 00077753    sete        bl
 00077756    xor         eax,eax
 00077758    push        ebp
 00077759    push        7779E
 0007775E    push        dword ptr fs:[eax]
 00077761    mov         dword ptr fs:[eax],esp
 00077764    lea         edx,[ebp-14]
 00077767    mov         eax,dword ptr [ebp-4]
 0007776A    call        TControl.GetText
 0007776F    mov         eax,dword ptr [ebp-14]
 00077772    lea         ecx,[ebp-0C]
 00077775    mov         edx,ebx
 00077777    call        00074ED4
 0007777C    lea         ecx,[ebp-10]
 0007777F    mov         dl,1
 00077781    mov         eax,dword ptr [ebp-0C]
 00077784    call        00074D04
 00077789    mov         edx,dword ptr [ebp-10]
 0007778C    mov         eax,dword ptr [ebp-4]
 0007778F    call        TControl.SetText
 00077794    xor         eax,eax
 00077796    pop         edx
 00077797    pop         ecx
 00077798    pop         ecx
 00077799    mov         dword ptr fs:[eax],edx
>0007779C    jmp         000777C8
>0007779E    jmp         @HandleAnyException
 000777A3    xor         edx,edx
 000777A5    mov         eax,dword ptr [ebp-4]
 000777A8    call        TControl.SetText
 000777AD    mov         ecx,77818;'Pasted hex string invalid!'
 000777B2    mov         dl,1
 000777B4    mov         eax,[000176E8];Exception
 000777B9    call        Exception.Create;Exception.Create
 000777BE    call        @RaiseExcept
 000777C3    call        @DoneExcept
 000777C8    xor         eax,eax
 000777CA    pop         edx
 000777CB    pop         ecx
 000777CC    pop         ecx
 000777CD    mov         dword ptr fs:[eax],edx
 000777D0    push        777F7
 000777D5    lea         eax,[ebp-18]
 000777D8    mov         edx,2
 000777DD    call        @LStrArrayClr
 000777E2    lea         eax,[ebp-10]
 000777E5    mov         edx,2
 000777EA    call        @LStrArrayClr
 000777EF    ret
>000777F0    jmp         @HandleFinally
>000777F5    jmp         000777D5
 000777F7    pop         edi
 000777F8    pop         esi
 000777F9    pop         ebx
 000777FA    mov         esp,ebp
 000777FC    pop         ebp
 000777FD    ret
*}
end;

end.