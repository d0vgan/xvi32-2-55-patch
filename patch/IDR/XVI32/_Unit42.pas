//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit42;

interface

uses
  SysUtils, Classes;

    //function sub_00074084(?:?; ?:AnsiString; ?:TStringList):?;//00074084
    //procedure sub_0007414C(?:String; ?:AnsiString; ?:AnsiString; ?:?);//0007414C
    //function sub_000741F8(?:?; ?:?; ?:?):?;//000741F8
    //procedure sub_00074258(?:AnsiString; ?:?);//00074258
    //function sub_000742A0(?:AnsiString; ?:?):?;//000742A0
    //procedure sub_0007435C(?:?; ?:?);//0007435C
    //procedure sub_000743E4(?:?; ?:Integer; ?:?);//000743E4
    //function sub_0007446C(?:TStringList; ?:?):?;//0007446C
    //function sub_00074524:?;//00074524
    //function sub_00074590:?;//00074590
    //function sub_000745FC:?;//000745FC
    //function sub_0007466C:?;//0007466C
    //function sub_00074674:?;//00074674
    //function sub_00074758:?;//00074758
    //function sub_0007483C(?:?):?;//0007483C
    //function sub_0007484C(?:?; ?:?):?;//0007484C
    //function sub_00074860(?:?; ?:?):?;//00074860
    //function sub_00074874(?:void ; ?:?; ?:?; ?:?):?;//00074874
    //procedure sub_00074890(?:?; ?:?; ?:?; ?:?);//00074890
    //procedure sub_000748B4(?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?);//000748B4
    //procedure sub_000748F8(?:?; ?:?);//000748F8
    //procedure sub_00074910(?:?; ?:?);//00074910
    //procedure sub_0007495C(?:?; ?:?);//0007495C
    //procedure sub_000749A8(?:?; ?:?);//000749A8
    //procedure sub_00074A3C(?:?; ?:?; ?:?; ?:?; ?:?);//00074A3C
    //procedure sub_00074AD0(?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?);//00074AD0
    //procedure sub_00074BF4(?:AnsiString; ?:?; ?:?);//00074BF4
    //procedure sub_00074C9C(?:?; ?:AnsiString);//00074C9C
    //procedure sub_00074D04(?:AnsiString; ?:?; ?:?);//00074D04
    //function sub_00074DB0(?:?; ?:?):?;//00074DB0
    //function sub_00074EA8(?:AnsiString):?;//00074EA8
    //procedure sub_00074ED4(?:AnsiString; ?:?; ?:?);//00074ED4
    //function sub_00074FA4:?;//00074FA4
    //function sub_0007507C(?:?):?;//0007507C
    //procedure sub_000750FC(?:?; ?:?);//000750FC
    //procedure sub_00075108(?:?; ?:?; ?:?);//00075108
    //procedure sub_00075144(?:?; ?:?; ?:?);//00075144
    //procedure sub_00075168(?:AnsiString; ?:?; ?:?);//00075168
    //procedure sub_00075190(?:String; ?:?; ?:?);//00075190
    //procedure sub_000751B4(?:?; ?:?);//000751B4
    //function sub_00075200(?:?; ?:?):Boolean;//00075200
    //function sub_00075210(?:?; ?:?; ?:?):?;//00075210
    //procedure sub_00075230(?:?; ?:?);//00075230
    //function sub_00075288(?:String; ?:?):?;//00075288
    //function sub_000752A4(?:?; ?:?):?;//000752A4
    //function sub_000752C0(?:?):?;//000752C0
    //function sub_00075350(?:String):?;//00075350
    procedure sub_00075398;//00075398
    //procedure sub_00075424(?:String; ?:AnsiString; ?:?; ?:?; ?:?);//00075424
    //procedure sub_0007556C(?:String; ?:?; ?:?);//0007556C
    //procedure sub_000755F4(?:?; ?:Integer);//000755F4

implementation

//00074084
{*function sub_00074084(?:?; ?:AnsiString; ?:TStringList):?;
begin
 00074084    push        ebp
 00074085    mov         ebp,esp
 00074087    add         esp,0FFFFFFF4
 0007408A    push        ebx
 0007408B    push        esi
 0007408C    xor         ebx,ebx
 0007408E    mov         dword ptr [ebp-0C],ebx
 00074091    mov         esi,ecx
 00074093    mov         dword ptr [ebp-8],edx
 00074096    mov         dword ptr [ebp-4],eax
 00074099    mov         eax,dword ptr [ebp-4]
 0007409C    call        @LStrAddRef
 000740A1    mov         eax,dword ptr [ebp-8]
 000740A4    call        @LStrAddRef
 000740A9    xor         eax,eax
 000740AB    push        ebp
 000740AC    push        7413D
 000740B1    push        dword ptr fs:[eax]
 000740B4    mov         dword ptr fs:[eax],esp
 000740B7    cmp         dword ptr [ebp-4],0
>000740BB    je          00074120
 000740BD    mov         edx,dword ptr [ebp-4]
 000740C0    mov         eax,dword ptr [ebp-8]
 000740C3    call        @LStrPos
 000740C8    mov         ebx,eax
 000740CA    test        ebx,ebx
>000740CC    jne         000740DA
 000740CE    mov         edx,dword ptr [ebp-4]
 000740D1    mov         eax,esi
 000740D3    mov         ecx,dword ptr [eax]
 000740D5    call        dword ptr [ecx+34]
>000740D8    jmp         000740F8
 000740DA    lea         eax,[ebp-0C]
 000740DD    push        eax
 000740DE    mov         ecx,ebx
 000740E0    dec         ecx
 000740E1    mov         edx,1
 000740E6    mov         eax,dword ptr [ebp-4]
 000740E9    call        @LStrCopy
 000740EE    mov         edx,dword ptr [ebp-0C]
 000740F1    mov         eax,esi
 000740F3    mov         ecx,dword ptr [eax]
 000740F5    call        dword ptr [ecx+34]
 000740F8    lea         eax,[ebp-4]
 000740FB    push        eax
 000740FC    mov         eax,dword ptr [ebp-4]
 000740FF    call        @LStrLen
 00074104    sub         eax,ebx
 00074106    push        eax
 00074107    mov         eax,dword ptr [ebp-8]
 0007410A    call        @LStrLen
 0007410F    mov         edx,eax
 00074111    add         edx,ebx
 00074113    mov         eax,dword ptr [ebp-4]
 00074116    pop         ecx
 00074117    call        @LStrCopy
 0007411C    test        ebx,ebx
>0007411E    jne         000740BD
 00074120    mov         ebx,esi
 00074122    xor         eax,eax
 00074124    pop         edx
 00074125    pop         ecx
 00074126    pop         ecx
 00074127    mov         dword ptr fs:[eax],edx
 0007412A    push        74144
 0007412F    lea         eax,[ebp-0C]
 00074132    mov         edx,3
 00074137    call        @LStrArrayClr
 0007413C    ret
>0007413D    jmp         @HandleFinally
>00074142    jmp         0007412F
 00074144    mov         eax,ebx
 00074146    pop         esi
 00074147    pop         ebx
 00074148    mov         esp,ebp
 0007414A    pop         ebp
 0007414B    ret
end;*}

//0007414C
{*procedure sub_0007414C(?:String; ?:AnsiString; ?:AnsiString; ?:?);
begin
 0007414C    push        ebp
 0007414D    mov         ebp,esp
 0007414F    add         esp,0FFFFFFF8
 00074152    push        ebx
 00074153    push        esi
 00074154    push        edi
 00074155    xor         ebx,ebx
 00074157    mov         dword ptr [ebp-8],ebx
 0007415A    mov         edi,ecx
 0007415C    mov         esi,edx
 0007415E    mov         dword ptr [ebp-4],eax
 00074161    mov         eax,dword ptr [ebp-4]
 00074164    call        @LStrAddRef
 00074169    xor         eax,eax
 0007416B    push        ebp
 0007416C    push        741E6
 00074171    push        dword ptr fs:[eax]
 00074174    mov         dword ptr fs:[eax],esp
 00074177    mov         eax,edi
 00074179    mov         edx,dword ptr [ebp-4]
 0007417C    call        @LStrAsg
 00074181    mov         eax,dword ptr [ebp+8]
 00074184    call        @LStrClr
 00074189    mov         edx,dword ptr [ebp-4]
 0007418C    mov         eax,esi
 0007418E    call        @LStrPos
 00074193    mov         ebx,eax
 00074195    test        ebx,ebx
>00074197    jle         000741CB
 00074199    push        edi
 0007419A    mov         ecx,ebx
 0007419C    dec         ecx
 0007419D    mov         edx,1
 000741A2    mov         eax,dword ptr [ebp-4]
 000741A5    call        @LStrCopy
 000741AA    mov         eax,esi
 000741AC    call        @LStrLen
 000741B1    mov         edx,eax
 000741B3    add         edx,ebx
 000741B5    lea         ecx,[ebp-8]
 000741B8    mov         eax,dword ptr [ebp-4]
 000741BB    call        00075190
 000741C0    mov         edx,dword ptr [ebp-8]
 000741C3    mov         eax,dword ptr [ebp+8]
 000741C6    call        @LStrAsg
 000741CB    xor         eax,eax
 000741CD    pop         edx
 000741CE    pop         ecx
 000741CF    pop         ecx
 000741D0    mov         dword ptr fs:[eax],edx
 000741D3    push        741ED
 000741D8    lea         eax,[ebp-8]
 000741DB    mov         edx,2
 000741E0    call        @LStrArrayClr
 000741E5    ret
>000741E6    jmp         @HandleFinally
>000741EB    jmp         000741D8
 000741ED    pop         edi
 000741EE    pop         esi
 000741EF    pop         ebx
 000741F0    pop         ecx
 000741F1    pop         ecx
 000741F2    pop         ebp
 000741F3    ret         4
end;*}

//000741F8
{*function sub_000741F8(?:?; ?:?; ?:?):?;
begin
 000741F8    push        ebp
 000741F9    mov         ebp,esp
 000741FB    add         esp,0FFFFFFE8
 000741FE    mov         edx,dword ptr [ebp+8]
 00074201    mov         dword ptr [ebp-8],edx
 00074204    mov         edx,dword ptr [ebp+0C]
 00074207    mov         dword ptr [ebp-4],edx
 0007420A    test        al,al
>0007420C    jb          0007424A
 0007420E    xor         edx,edx
 00074210    mov         dword ptr [ebp-10],edx
 00074213    mov         dword ptr [ebp-0C],3FF00000
 0007421A    test        al,al
>0007421C    jbe         0007422F
 0007421E    fld         qword ptr [ebp-10]
 00074221    fmul        dword ptr ds:[74254];10:Single
 00074227    fstp        qword ptr [ebp-10]
 0007422A    wait
 0007422B    dec         al
>0007422D    jne         0007421E
 0007422F    fld         qword ptr [ebp-8]
 00074232    fmul        qword ptr [ebp-10]
 00074235    call        @ROUND
 0007423A    mov         dword ptr [ebp-18],eax
 0007423D    mov         dword ptr [ebp-14],edx
 00074240    fild        qword ptr [ebp-18]
 00074243    fdiv        qword ptr [ebp-10]
 00074246    fstp        qword ptr [ebp-8]
 00074249    wait
 0007424A    fld         qword ptr [ebp-8]
 0007424D    mov         esp,ebp
 0007424F    pop         ebp
 00074250    ret         8
end;*}

//00074258
{*procedure sub_00074258(?:AnsiString; ?:?);
begin
 00074258    push        ebx
 00074259    push        esi
 0007425A    push        edi
 0007425B    push        ebp
 0007425C    push        ecx
 0007425D    mov         dword ptr [esp],edx
 00074260    mov         edi,eax
 00074262    mov         eax,dword ptr [esp]
 00074265    mov         edx,edi
 00074267    call        @LStrLAsg
 0007426C    mov         eax,edi
 0007426E    call        @LStrLen
 00074273    mov         ebp,eax
 00074275    inc         ebp
 00074276    mov         esi,ebp
 00074278    dec         esi
 00074279    test        esi,esi
>0007427B    jle         0007429A
 0007427D    mov         ebx,1
 00074282    mov         eax,dword ptr [esp]
 00074285    call        UniqueString
 0007428A    mov         edx,ebp
 0007428C    sub         edx,ebx
 0007428E    mov         dl,byte ptr [edi+edx-1]
 00074292    mov         byte ptr [eax+ebx-1],dl
 00074296    inc         ebx
 00074297    dec         esi
>00074298    jne         00074282
 0007429A    pop         edx
 0007429B    pop         ebp
 0007429C    pop         edi
 0007429D    pop         esi
 0007429E    pop         ebx
 0007429F    ret
end;*}

//000742A0
{*function sub_000742A0(?:AnsiString; ?:?):?;
begin
 000742A0    push        ebp
 000742A1    mov         ebp,esp
 000742A3    add         esp,0FFFFFFF4
 000742A6    push        ebx
 000742A7    xor         ecx,ecx
 000742A9    mov         dword ptr [ebp-0C],ecx
 000742AC    mov         dword ptr [ebp-8],edx
 000742AF    mov         dword ptr [ebp-4],eax
 000742B2    mov         eax,dword ptr [ebp-4]
 000742B5    call        @LStrAddRef
 000742BA    mov         eax,dword ptr [ebp-8]
 000742BD    call        @LStrAddRef
 000742C2    xor         eax,eax
 000742C4    push        ebp
 000742C5    push        7434B
 000742CA    push        dword ptr fs:[eax]
 000742CD    mov         dword ptr fs:[eax],esp
 000742D0    mov         eax,dword ptr [ebp-8]
 000742D3    call        @LStrLen
 000742D8    mov         ebx,eax
 000742DA    mov         eax,dword ptr [ebp-4]
 000742DD    call        @LStrLen
 000742E2    cmp         ebx,eax
>000742E4    jge         000742EA
 000742E6    xor         ebx,ebx
>000742E8    jmp         00074330
 000742EA    mov         eax,dword ptr [ebp-8]
 000742ED    call        @LStrLen
 000742F2    mov         ebx,eax
 000742F4    mov         eax,dword ptr [ebp-4]
 000742F7    call        @LStrLen
 000742FC    sub         ebx,eax
 000742FE    inc         ebx
 000742FF    cmp         ebx,1
>00074302    jl          0007432E
 00074304    lea         eax,[ebp-0C]
 00074307    push        eax
 00074308    mov         eax,dword ptr [ebp-4]
 0007430B    call        @LStrLen
 00074310    mov         ecx,eax
 00074312    mov         edx,ebx
 00074314    mov         eax,dword ptr [ebp-8]
 00074317    call        @LStrCopy
 0007431C    mov         eax,dword ptr [ebp-0C]
 0007431F    mov         edx,dword ptr [ebp-4]
 00074322    call        @LStrCmp
>00074327    je          00074330
 00074329    dec         ebx
 0007432A    test        ebx,ebx
>0007432C    jne         00074304
 0007432E    xor         ebx,ebx
 00074330    xor         eax,eax
 00074332    pop         edx
 00074333    pop         ecx
 00074334    pop         ecx
 00074335    mov         dword ptr fs:[eax],edx
 00074338    push        74352
 0007433D    lea         eax,[ebp-0C]
 00074340    mov         edx,3
 00074345    call        @LStrArrayClr
 0007434A    ret
>0007434B    jmp         @HandleFinally
>00074350    jmp         0007433D
 00074352    mov         eax,ebx
 00074354    pop         ebx
 00074355    mov         esp,ebp
 00074357    pop         ebp
 00074358    ret
end;*}

//0007435C
{*procedure sub_0007435C(?:?; ?:?);
begin
 0007435C    push        ebp
 0007435D    mov         ebp,esp
 0007435F    push        ecx
 00074360    push        ebx
 00074361    push        esi
 00074362    mov         esi,edx
 00074364    mov         dword ptr [ebp-4],eax
 00074367    mov         eax,dword ptr [ebp-4]
 0007436A    call        @LStrAddRef
 0007436F    xor         eax,eax
 00074371    push        ebp
 00074372    push        743CA
 00074377    push        dword ptr fs:[eax]
 0007437A    mov         dword ptr fs:[eax],esp
 0007437D    mov         edx,dword ptr [ebp-4]
 00074380    mov         eax,743E0;'='
 00074385    call        @LStrPos
 0007438A    mov         ebx,eax
 0007438C    test        ebx,ebx
>0007438E    jne         0007439C
 00074390    mov         eax,esi
 00074392    mov         edx,dword ptr [ebp-4]
 00074395    call        @LStrLAsg
>0007439A    jmp         000743B4
 0007439C    push        esi
 0007439D    mov         eax,dword ptr [ebp-4]
 000743A0    call        @LStrLen
 000743A5    mov         ecx,eax
 000743A7    sub         ecx,ebx
 000743A9    lea         edx,[ebx+1]
 000743AC    mov         eax,dword ptr [ebp-4]
 000743AF    call        @LStrCopy
 000743B4    xor         eax,eax
 000743B6    pop         edx
 000743B7    pop         ecx
 000743B8    pop         ecx
 000743B9    mov         dword ptr fs:[eax],edx
 000743BC    push        743D1
 000743C1    lea         eax,[ebp-4]
 000743C4    call        @LStrClr
 000743C9    ret
>000743CA    jmp         @HandleFinally
>000743CF    jmp         000743C1
 000743D1    pop         esi
 000743D2    pop         ebx
 000743D3    pop         ecx
 000743D4    pop         ebp
 000743D5    ret
end;*}

//000743E4
{*procedure sub_000743E4(?:?; ?:Integer; ?:?);
begin
 000743E4    push        ebp
 000743E5    mov         ebp,esp
 000743E7    push        ecx
 000743E8    push        ebx
 000743E9    push        esi
 000743EA    mov         esi,ecx
 000743EC    mov         ebx,edx
 000743EE    mov         dword ptr [ebp-4],eax
 000743F1    mov         eax,dword ptr [ebp-4]
 000743F4    call        @LStrAddRef
 000743F9    xor         eax,eax
 000743FB    push        ebp
 000743FC    push        74454
 00074401    push        dword ptr fs:[eax]
 00074404    mov         dword ptr fs:[eax],esp
 00074407    mov         eax,dword ptr [ebp-4]
 0007440A    call        @LStrLen
 0007440F    cmp         ebx,eax
>00074411    jle         0007442E
>00074413    jmp         00074422
 00074415    lea         eax,[ebp-4]
 00074418    mov         edx,74468;' '
 0007441D    call        @LStrCat
 00074422    mov         eax,dword ptr [ebp-4]
 00074425    call        @LStrLen
 0007442A    cmp         ebx,eax
>0007442C    jg          00074415
 0007442E    push        esi
 0007442F    mov         ecx,ebx
 00074431    mov         edx,1
 00074436    mov         eax,dword ptr [ebp-4]
 00074439    call        @LStrCopy
 0007443E    xor         eax,eax
 00074440    pop         edx
 00074441    pop         ecx
 00074442    pop         ecx
 00074443    mov         dword ptr fs:[eax],edx
 00074446    push        7445B
 0007444B    lea         eax,[ebp-4]
 0007444E    call        @LStrClr
 00074453    ret
>00074454    jmp         @HandleFinally
>00074459    jmp         0007444B
 0007445B    pop         esi
 0007445C    pop         ebx
 0007445D    pop         ecx
 0007445E    pop         ebp
 0007445F    ret
end;*}

//0007446C
{*function sub_0007446C(?:TStringList; ?:?):?;
begin
 0007446C    push        ebp
 0007446D    mov         ebp,esp
 0007446F    add         esp,0FFFFFFF0
 00074472    push        ebx
 00074473    push        esi
 00074474    push        edi
 00074475    xor         ecx,ecx
 00074477    mov         dword ptr [ebp-10],ecx
 0007447A    mov         dword ptr [ebp-8],ecx
 0007447D    mov         byte ptr [ebp-1],dl
 00074480    mov         ebx,eax
 00074482    xor         eax,eax
 00074484    push        ebp
 00074485    push        74513
 0007448A    push        dword ptr fs:[eax]
 0007448D    mov         dword ptr fs:[eax],esp
 00074490    mov         eax,ebx
 00074492    call        TStrings.BeginUpdate
 00074497    mov         eax,ebx
 00074499    mov         edx,dword ptr [eax]
 0007449B    call        dword ptr [edx+14]
 0007449E    dec         eax
 0007449F    test        eax,eax
>000744A1    jl          000744EE
 000744A3    inc         eax
 000744A4    mov         dword ptr [ebp-0C],eax
 000744A7    xor         esi,esi
 000744A9    lea         ecx,[ebp-10]
 000744AC    mov         edx,esi
 000744AE    mov         eax,ebx
 000744B0    mov         edi,dword ptr [eax]
 000744B2    call        dword ptr [edi+0C]
 000744B5    mov         eax,dword ptr [ebp-10]
 000744B8    lea         edx,[ebp-8]
 000744BB    call        0007435C
 000744C0    cmp         byte ptr [ebp-1],0
>000744C4    je          000744DC
 000744C6    lea         edx,[ebp-10]
 000744C9    mov         eax,dword ptr [ebp-8]
 000744CC    call        000751B4
 000744D1    mov         edx,dword ptr [ebp-10]
 000744D4    lea         eax,[ebp-8]
 000744D7    call        @LStrLAsg
 000744DC    mov         ecx,dword ptr [ebp-8]
 000744DF    mov         edx,esi
 000744E1    mov         eax,ebx
 000744E3    mov         edi,dword ptr [eax]
 000744E5    call        dword ptr [edi+20]
 000744E8    inc         esi
 000744E9    dec         dword ptr [ebp-0C]
>000744EC    jne         000744A9
 000744EE    mov         eax,ebx
 000744F0    call        TStrings.EndUpdate
 000744F5    xor         eax,eax
 000744F7    pop         edx
 000744F8    pop         ecx
 000744F9    pop         ecx
 000744FA    mov         dword ptr fs:[eax],edx
 000744FD    push        7451A
 00074502    lea         eax,[ebp-10]
 00074505    call        @LStrClr
 0007450A    lea         eax,[ebp-8]
 0007450D    call        @LStrClr
 00074512    ret
>00074513    jmp         @HandleFinally
>00074518    jmp         00074502
 0007451A    mov         eax,ebx
 0007451C    pop         edi
 0007451D    pop         esi
 0007451E    pop         ebx
 0007451F    mov         esp,ebp
 00074521    pop         ebp
 00074522    ret
end;*}

//00074524
{*function sub_00074524:?;
begin
 00074524    push        ebp
 00074525    mov         ebp,esp
 00074527    push        0
 00074529    push        ebx
 0007452A    xor         edx,edx
 0007452C    push        ebp
 0007452D    push        74583
 00074532    push        dword ptr fs:[edx]
 00074535    mov         dword ptr fs:[edx],esp
 00074538    call        StrToInt
 0007453D    test        eax,eax
>0007453F    jl          00074548
 00074541    cmp         eax,0FF
>00074546    jle         0007456B
 00074548    lea         edx,[ebp-4]
 0007454B    mov         eax,0FF91
 00074550    call        LoadStr;'List index out of bounds (%d)'
 00074555    mov         ecx,dword ptr [ebp-4]
 00074558    mov         dl,1
 0007455A    mov         eax,[00017A1C];ERangeError
 0007455F    call        Exception.Create;ERangeError.Create
 00074564    call        @RaiseExcept
>00074569    jmp         0007456D
 0007456B    mov         ebx,eax
 0007456D    xor         eax,eax
 0007456F    pop         edx
 00074570    pop         ecx
 00074571    pop         ecx
 00074572    mov         dword ptr fs:[eax],edx
 00074575    push        7458A
 0007457A    lea         eax,[ebp-4]
 0007457D    call        @LStrClr
 00074582    ret
>00074583    jmp         @HandleFinally
>00074588    jmp         0007457A
 0007458A    mov         eax,ebx
 0007458C    pop         ebx
 0007458D    pop         ecx
 0007458E    pop         ebp
 0007458F    ret
end;*}

//00074590
{*function sub_00074590:?;
begin
 00074590    push        ebp
 00074591    mov         ebp,esp
 00074593    push        0
 00074595    push        ebx
 00074596    xor         edx,edx
 00074598    push        ebp
 00074599    push        745EF
 0007459E    push        dword ptr fs:[edx]
 000745A1    mov         dword ptr fs:[edx],esp
 000745A4    call        StrToInt
 000745A9    test        eax,eax
>000745AB    jl          000745B4
 000745AD    cmp         eax,0FFFF
>000745B2    jle         000745D7
 000745B4    lea         edx,[ebp-4]
 000745B7    mov         eax,0FF91
 000745BC    call        LoadStr;'List index out of bounds (%d)'
 000745C1    mov         ecx,dword ptr [ebp-4]
 000745C4    mov         dl,1
 000745C6    mov         eax,[00017A1C];ERangeError
 000745CB    call        Exception.Create;ERangeError.Create
 000745D0    call        @RaiseExcept
>000745D5    jmp         000745D9
 000745D7    mov         ebx,eax
 000745D9    xor         eax,eax
 000745DB    pop         edx
 000745DC    pop         ecx
 000745DD    pop         ecx
 000745DE    mov         dword ptr fs:[eax],edx
 000745E1    push        745F6
 000745E6    lea         eax,[ebp-4]
 000745E9    call        @LStrClr
 000745EE    ret
>000745EF    jmp         @HandleFinally
>000745F4    jmp         000745E6
 000745F6    mov         eax,ebx
 000745F8    pop         ebx
 000745F9    pop         ecx
 000745FA    pop         ebp
 000745FB    ret
end;*}

//000745FC
{*function sub_000745FC:?;
begin
 000745FC    push        ebp
 000745FD    mov         ebp,esp
 000745FF    push        0
 00074601    push        ebx
 00074602    xor         edx,edx
 00074604    push        ebp
 00074605    push        7465E
 0007460A    push        dword ptr fs:[edx]
 0007460D    mov         dword ptr fs:[edx],esp
 00074610    call        StrToInt
 00074615    cmp         eax,0FFFF8000
>0007461A    jl          00074623
 0007461C    cmp         eax,7FFF
>00074621    jle         00074646
 00074623    lea         edx,[ebp-4]
 00074626    mov         eax,0FF91
 0007462B    call        LoadStr;'List index out of bounds (%d)'
 00074630    mov         ecx,dword ptr [ebp-4]
 00074633    mov         dl,1
 00074635    mov         eax,[00017A1C];ERangeError
 0007463A    call        Exception.Create;ERangeError.Create
 0007463F    call        @RaiseExcept
>00074644    jmp         00074648
 00074646    mov         ebx,eax
 00074648    xor         eax,eax
 0007464A    pop         edx
 0007464B    pop         ecx
 0007464C    pop         ecx
 0007464D    mov         dword ptr fs:[eax],edx
 00074650    push        74665
 00074655    lea         eax,[ebp-4]
 00074658    call        @LStrClr
 0007465D    ret
>0007465E    jmp         @HandleFinally
>00074663    jmp         00074655
 00074665    mov         eax,ebx
 00074667    pop         ebx
 00074668    pop         ecx
 00074669    pop         ebp
 0007466A    ret
end;*}

//0007466C
{*function sub_0007466C:?;
begin
 0007466C    call        StrToInt
 00074671    ret
end;*}

//00074674
{*function sub_00074674:?;
begin
 00074674    push        ebp
 00074675    mov         ebp,esp
 00074677    add         esp,0FFFFFFEC
 0007467A    xor         edx,edx
 0007467C    mov         dword ptr [ebp-14],edx
 0007467F    xor         edx,edx
 00074681    push        ebp
 00074682    push        7472B
 00074687    push        dword ptr fs:[edx]
 0007468A    mov         dword ptr fs:[edx],esp
 0007468D    call        StrToFloat
 00074692    fstp        tbyte ptr [ebp-0E]
 00074695    wait
 00074696    fld         tbyte ptr [ebp-0E]
 00074699    fcomp       dword ptr ds:[7473C];0:Single
 0007469F    fnstsw      al
 000746A1    sahf
>000746A2    je          000746D9
 000746A4    fld         tbyte ptr [ebp-0E]
 000746A7    fabs
 000746A9    fld         tbyte ptr ds:[74740];1,5E-45:Extended
 000746AF    fcompp
 000746B1    fnstsw      al
 000746B3    sahf
>000746B4    jbe         000746D9
 000746B6    lea         edx,[ebp-14]
 000746B9    mov         eax,0FF96
 000746BE    call        LoadStr;'Tab position incompatible with current tab style'
 000746C3    mov         ecx,dword ptr [ebp-14]
 000746C6    mov         dl,1
 000746C8    mov         eax,[00017C30];EUnderflow
 000746CD    call        Exception.Create;EUnderflow.Create
 000746D2    call        @RaiseExcept
>000746D7    jmp         00074715
 000746D9    fld         tbyte ptr [ebp-0E]
 000746DC    fabs
 000746DE    fld         tbyte ptr ds:[7474C];3,4E38:Extended
 000746E4    fcompp
 000746E6    fnstsw      al
 000746E8    sahf
>000746E9    jae         0007470E
 000746EB    lea         edx,[ebp-14]
 000746EE    mov         eax,0FF95
 000746F3    call        LoadStr;'String list does not allow duplicates'
 000746F8    mov         ecx,dword ptr [ebp-14]
 000746FB    mov         dl,1
 000746FD    mov         eax,[00017BD8];EOverflow
 00074702    call        Exception.Create;EOverflow.Create
 00074707    call        @RaiseExcept
>0007470C    jmp         00074715
 0007470E    fld         tbyte ptr [ebp-0E]
 00074711    fstp        dword ptr [ebp-4]
 00074714    wait
 00074715    xor         eax,eax
 00074717    pop         edx
 00074718    pop         ecx
 00074719    pop         ecx
 0007471A    mov         dword ptr fs:[eax],edx
 0007471D    push        74732
 00074722    lea         eax,[ebp-14]
 00074725    call        @LStrClr
 0007472A    ret
>0007472B    jmp         @HandleFinally
>00074730    jmp         00074722
 00074732    fld         dword ptr [ebp-4]
 00074735    mov         esp,ebp
 00074737    pop         ebp
 00074738    ret
end;*}

//00074758
{*function sub_00074758:?;
begin
 00074758    push        ebp
 00074759    mov         ebp,esp
 0007475B    add         esp,0FFFFFFE8
 0007475E    xor         edx,edx
 00074760    mov         dword ptr [ebp-18],edx
 00074763    xor         edx,edx
 00074765    push        ebp
 00074766    push        7480F
 0007476B    push        dword ptr fs:[edx]
 0007476E    mov         dword ptr fs:[edx],esp
 00074771    call        StrToFloat
 00074776    fstp        tbyte ptr [ebp-12]
 00074779    wait
 0007477A    fld         tbyte ptr [ebp-12]
 0007477D    fcomp       dword ptr ds:[74820];0:Single
 00074783    fnstsw      al
 00074785    sahf
>00074786    je          000747BD
 00074788    fld         tbyte ptr [ebp-12]
 0007478B    fabs
 0007478D    fld         tbyte ptr ds:[74824];5E-324:Extended
 00074793    fcompp
 00074795    fnstsw      al
 00074797    sahf
>00074798    jbe         000747BD
 0007479A    lea         edx,[ebp-18]
 0007479D    mov         eax,0FF96
 000747A2    call        LoadStr;'Tab position incompatible with current tab style'
 000747A7    mov         ecx,dword ptr [ebp-18]
 000747AA    mov         dl,1
 000747AC    mov         eax,[00017C30];EUnderflow
 000747B1    call        Exception.Create;EUnderflow.Create
 000747B6    call        @RaiseExcept
>000747BB    jmp         000747F9
 000747BD    fld         tbyte ptr [ebp-12]
 000747C0    fabs
 000747C2    fld         tbyte ptr ds:[74830];1,7E308:Extended
 000747C8    fcompp
 000747CA    fnstsw      al
 000747CC    sahf
>000747CD    jae         000747F2
 000747CF    lea         edx,[ebp-18]
 000747D2    mov         eax,0FF95
 000747D7    call        LoadStr;'String list does not allow duplicates'
 000747DC    mov         ecx,dword ptr [ebp-18]
 000747DF    mov         dl,1
 000747E1    mov         eax,[00017BD8];EOverflow
 000747E6    call        Exception.Create;EOverflow.Create
 000747EB    call        @RaiseExcept
>000747F0    jmp         000747F9
 000747F2    fld         tbyte ptr [ebp-12]
 000747F5    fstp        qword ptr [ebp-8]
 000747F8    wait
 000747F9    xor         eax,eax
 000747FB    pop         edx
 000747FC    pop         ecx
 000747FD    pop         ecx
 000747FE    mov         dword ptr fs:[eax],edx
 00074801    push        74816
 00074806    lea         eax,[ebp-18]
 00074809    call        @LStrClr
 0007480E    ret
>0007480F    jmp         @HandleFinally
>00074814    jmp         00074806
 00074816    fld         qword ptr [ebp-8]
 00074819    mov         esp,ebp
 0007481B    pop         ebp
 0007481C    ret
end;*}

//0007483C
{*function sub_0007483C(?:?):?;
begin
 0007483C    push        ebp
 0007483D    mov         ebp,esp
 0007483F    push        ecx
 00074840    mov         byte ptr [ebp-1],al
 00074843    mov         al,byte ptr [ebp-1]
 00074846    pop         ecx
 00074847    pop         ebp
 00074848    ret
end;*}

//0007484C
{*function sub_0007484C(?:?; ?:?):?;
begin
 0007484C    push        ebp
 0007484D    mov         ebp,esp
 0007484F    push        ecx
 00074850    mov         byte ptr [ebp-2],al
 00074853    mov         byte ptr [ebp-1],dl
 00074856    mov         ax,word ptr [ebp-2]
 0007485A    pop         ecx
 0007485B    pop         ebp
 0007485C    ret
end;*}

//00074860
{*function sub_00074860(?:?; ?:?):?;
begin
 00074860    push        ebp
 00074861    mov         ebp,esp
 00074863    push        ecx
 00074864    mov         byte ptr [ebp-2],al
 00074867    mov         byte ptr [ebp-1],dl
 0007486A    mov         ax,word ptr [ebp-2]
 0007486E    pop         ecx
 0007486F    pop         ebp
 00074870    ret
end;*}

//00074874
{*function sub_00074874(?:void ; ?:?; ?:?; ?:?):?;
begin
 00074874    push        ebp
 00074875    mov         ebp,esp
 00074877    push        ecx
 00074878    mov         byte ptr [ebp-4],al
 0007487B    mov         byte ptr [ebp-3],dl
 0007487E    mov         byte ptr [ebp-2],cl
 00074881    mov         al,byte ptr [ebp+8]
 00074884    mov         byte ptr [ebp-1],al
 00074887    mov         eax,dword ptr [ebp-4]
 0007488A    pop         ecx
 0007488B    pop         ebp
 0007488C    ret         4
end;*}

//00074890
{*procedure sub_00074890(?:?; ?:?; ?:?; ?:?);
begin
 00074890    push        ebp
 00074891    mov         ebp,esp
 00074893    add         esp,0FFFFFFF8
 00074896    mov         byte ptr [ebp-4],al
 00074899    mov         byte ptr [ebp-3],dl
 0007489C    mov         byte ptr [ebp-2],cl
 0007489F    mov         al,byte ptr [ebp+8]
 000748A2    mov         byte ptr [ebp-1],al
 000748A5    mov         eax,dword ptr [ebp-4]
 000748A8    mov         dword ptr [ebp-8],eax
 000748AB    fld         dword ptr [ebp-8]
 000748AE    pop         ecx
 000748AF    pop         ecx
 000748B0    pop         ebp
 000748B1    ret         4
end;*}

//000748B4
{*procedure sub_000748B4(?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?);
begin
 000748B4    push        ebp
 000748B5    mov         ebp,esp
 000748B7    add         esp,0FFFFFFF0
 000748BA    mov         byte ptr [ebp-8],al
 000748BD    mov         byte ptr [ebp-7],dl
 000748C0    mov         byte ptr [ebp-6],cl
 000748C3    mov         al,byte ptr [ebp+18]
 000748C6    mov         byte ptr [ebp-5],al
 000748C9    mov         al,byte ptr [ebp+14]
 000748CC    mov         byte ptr [ebp-4],al
 000748CF    mov         al,byte ptr [ebp+10]
 000748D2    mov         byte ptr [ebp-3],al
 000748D5    mov         al,byte ptr [ebp+0C]
 000748D8    mov         byte ptr [ebp-2],al
 000748DB    mov         al,byte ptr [ebp+8]
 000748DE    mov         byte ptr [ebp-1],al
 000748E1    mov         eax,dword ptr [ebp-8]
 000748E4    mov         dword ptr [ebp-10],eax
 000748E7    mov         eax,dword ptr [ebp-4]
 000748EA    mov         dword ptr [ebp-0C],eax
 000748ED    fld         qword ptr [ebp-10]
 000748F0    mov         esp,ebp
 000748F2    pop         ebp
 000748F3    ret         14
end;*}

//000748F8
{*procedure sub_000748F8(?:?; ?:?);
begin
 000748F8    push        ebp
 000748F9    mov         ebp,esp
 000748FB    push        ecx
 000748FC    push        ebx
 000748FD    mov         ebx,edx
 000748FF    mov         byte ptr [ebp-1],al
 00074902    mov         eax,ebx
 00074904    mov         dl,byte ptr [ebp-1]
 00074907    call        @LStrFromChar
 0007490C    pop         ebx
 0007490D    pop         ecx
 0007490E    pop         ebp
 0007490F    ret
end;*}

//00074910
{*procedure sub_00074910(?:?; ?:?);
begin
 00074910    push        ebp
 00074911    mov         ebp,esp
 00074913    add         esp,0FFFFFFF0
 00074916    push        ebx
 00074917    mov         ebx,edx
 00074919    mov         word ptr [ebp-2],ax
 0007491D    lea         eax,[ebp-8]
 00074920    mov         dl,byte ptr [ebp-2]
 00074923    mov         byte ptr [eax+1],dl
 00074926    mov         byte ptr [eax],1
 00074929    lea         edx,[ebp-8]
 0007492C    lea         eax,[ebp-0C]
 0007492F    call        @PStrCpy
 00074934    lea         eax,[ebp-10]
 00074937    mov         dl,byte ptr [ebp-1]
 0007493A    mov         byte ptr [eax+1],dl
 0007493D    mov         byte ptr [eax],1
 00074940    lea         edx,[ebp-10]
 00074943    lea         eax,[ebp-0C]
 00074946    mov         cl,2
 00074948    call        @PStrNCat
 0007494D    lea         edx,[ebp-0C]
 00074950    mov         eax,ebx
 00074952    call        @LStrFromString
 00074957    pop         ebx
 00074958    mov         esp,ebp
 0007495A    pop         ebp
 0007495B    ret
end;*}

//0007495C
{*procedure sub_0007495C(?:?; ?:?);
begin
 0007495C    push        ebp
 0007495D    mov         ebp,esp
 0007495F    add         esp,0FFFFFFF0
 00074962    push        ebx
 00074963    mov         ebx,edx
 00074965    mov         word ptr [ebp-2],ax
 00074969    lea         eax,[ebp-8]
 0007496C    mov         dl,byte ptr [ebp-2]
 0007496F    mov         byte ptr [eax+1],dl
 00074972    mov         byte ptr [eax],1
 00074975    lea         edx,[ebp-8]
 00074978    lea         eax,[ebp-0C]
 0007497B    call        @PStrCpy
 00074980    lea         eax,[ebp-10]
 00074983    mov         dl,byte ptr [ebp-1]
 00074986    mov         byte ptr [eax+1],dl
 00074989    mov         byte ptr [eax],1
 0007498C    lea         edx,[ebp-10]
 0007498F    lea         eax,[ebp-0C]
 00074992    mov         cl,2
 00074994    call        @PStrNCat
 00074999    lea         edx,[ebp-0C]
 0007499C    mov         eax,ebx
 0007499E    call        @LStrFromString
 000749A3    pop         ebx
 000749A4    mov         esp,ebp
 000749A6    pop         ebp
 000749A7    ret
end;*}

//000749A8
{*procedure sub_000749A8(?:?; ?:?);
begin
 000749A8    push        ebp
 000749A9    mov         ebp,esp
 000749AB    add         esp,0FFFFFFE4
 000749AE    push        ebx
 000749AF    mov         ebx,edx
 000749B1    mov         dword ptr [ebp-4],eax
 000749B4    lea         eax,[ebp-8]
 000749B7    mov         dl,byte ptr [ebp-4]
 000749BA    mov         byte ptr [eax+1],dl
 000749BD    mov         byte ptr [eax],1
 000749C0    lea         edx,[ebp-8]
 000749C3    lea         eax,[ebp-0C]
 000749C6    call        @PStrCpy
 000749CB    lea         eax,[ebp-10]
 000749CE    mov         dl,byte ptr [ebp-3]
 000749D1    mov         byte ptr [eax+1],dl
 000749D4    mov         byte ptr [eax],1
 000749D7    lea         edx,[ebp-10]
 000749DA    lea         eax,[ebp-0C]
 000749DD    mov         cl,2
 000749DF    call        @PStrNCat
 000749E4    lea         edx,[ebp-0C]
 000749E7    lea         eax,[ebp-14]
 000749EA    call        @PStrCpy
 000749EF    lea         eax,[ebp-10]
 000749F2    mov         dl,byte ptr [ebp-2]
 000749F5    mov         byte ptr [eax+1],dl
 000749F8    mov         byte ptr [eax],1
 000749FB    lea         edx,[ebp-10]
 000749FE    lea         eax,[ebp-14]
 00074A01    mov         cl,3
 00074A03    call        @PStrNCat
 00074A08    lea         edx,[ebp-14]
 00074A0B    lea         eax,[ebp-1C]
 00074A0E    call        @PStrCpy
 00074A13    lea         eax,[ebp-10]
 00074A16    mov         dl,byte ptr [ebp-1]
 00074A19    mov         byte ptr [eax+1],dl
 00074A1C    mov         byte ptr [eax],1
 00074A1F    lea         edx,[ebp-10]
 00074A22    lea         eax,[ebp-1C]
 00074A25    mov         cl,4
 00074A27    call        @PStrNCat
 00074A2C    lea         edx,[ebp-1C]
 00074A2F    mov         eax,ebx
 00074A31    call        @LStrFromString
 00074A36    pop         ebx
 00074A37    mov         esp,ebp
 00074A39    pop         ebp
 00074A3A    ret
end;*}

//00074A3C
{*procedure sub_00074A3C(?:?; ?:?; ?:?; ?:?; ?:?);
begin
 00074A3C    push        ebp
 00074A3D    mov         ebp,esp
 00074A3F    add         esp,0FFFFFFE8
 00074A42    push        ebx
 00074A43    mov         ebx,eax
 00074A45    lea         eax,[ebp-4]
 00074A48    mov         dl,byte ptr [ebp+8]
 00074A4B    mov         byte ptr [eax+1],dl
 00074A4E    mov         byte ptr [eax],1
 00074A51    lea         edx,[ebp-4]
 00074A54    lea         eax,[ebp-8]
 00074A57    call        @PStrCpy
 00074A5C    lea         eax,[ebp-0C]
 00074A5F    mov         dl,byte ptr [ebp+9]
 00074A62    mov         byte ptr [eax+1],dl
 00074A65    mov         byte ptr [eax],1
 00074A68    lea         edx,[ebp-0C]
 00074A6B    lea         eax,[ebp-8]
 00074A6E    mov         cl,2
 00074A70    call        @PStrNCat
 00074A75    lea         edx,[ebp-8]
 00074A78    lea         eax,[ebp-10]
 00074A7B    call        @PStrCpy
 00074A80    lea         eax,[ebp-0C]
 00074A83    mov         dl,byte ptr [ebp+0A]
 00074A86    mov         byte ptr [eax+1],dl
 00074A89    mov         byte ptr [eax],1
 00074A8C    lea         edx,[ebp-0C]
 00074A8F    lea         eax,[ebp-10]
 00074A92    mov         cl,3
 00074A94    call        @PStrNCat
 00074A99    lea         edx,[ebp-10]
 00074A9C    lea         eax,[ebp-18]
 00074A9F    call        @PStrCpy
 00074AA4    lea         eax,[ebp-0C]
 00074AA7    mov         dl,byte ptr [ebp+0B]
 00074AAA    mov         byte ptr [eax+1],dl
 00074AAD    mov         byte ptr [eax],1
 00074AB0    lea         edx,[ebp-0C]
 00074AB3    lea         eax,[ebp-18]
 00074AB6    mov         cl,4
 00074AB8    call        @PStrNCat
 00074ABD    lea         edx,[ebp-18]
 00074AC0    mov         eax,ebx
 00074AC2    call        @LStrFromString
 00074AC7    pop         ebx
 00074AC8    mov         esp,ebp
 00074ACA    pop         ebp
 00074ACB    ret         4
end;*}

//00074AD0
{*procedure sub_00074AD0(?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?);
begin
 00074AD0    push        ebp
 00074AD1    mov         ebp,esp
 00074AD3    add         esp,0FFFFFFC4
 00074AD6    push        ebx
 00074AD7    mov         ebx,eax
 00074AD9    lea         eax,[ebp-4]
 00074ADC    mov         dl,byte ptr [ebp+8]
 00074ADF    mov         byte ptr [eax+1],dl
 00074AE2    mov         byte ptr [eax],1
 00074AE5    lea         edx,[ebp-4]
 00074AE8    lea         eax,[ebp-8]
 00074AEB    call        @PStrCpy
 00074AF0    lea         eax,[ebp-0C]
 00074AF3    mov         dl,byte ptr [ebp+9]
 00074AF6    mov         byte ptr [eax+1],dl
 00074AF9    mov         byte ptr [eax],1
 00074AFC    lea         edx,[ebp-0C]
 00074AFF    lea         eax,[ebp-8]
 00074B02    mov         cl,2
 00074B04    call        @PStrNCat
 00074B09    lea         edx,[ebp-8]
 00074B0C    lea         eax,[ebp-10]
 00074B0F    call        @PStrCpy
 00074B14    lea         eax,[ebp-0C]
 00074B17    mov         dl,byte ptr [ebp+0A]
 00074B1A    mov         byte ptr [eax+1],dl
 00074B1D    mov         byte ptr [eax],1
 00074B20    lea         edx,[ebp-0C]
 00074B23    lea         eax,[ebp-10]
 00074B26    mov         cl,3
 00074B28    call        @PStrNCat
 00074B2D    lea         edx,[ebp-10]
 00074B30    lea         eax,[ebp-18]
 00074B33    call        @PStrCpy
 00074B38    lea         eax,[ebp-0C]
 00074B3B    mov         dl,byte ptr [ebp+0B]
 00074B3E    mov         byte ptr [eax+1],dl
 00074B41    mov         byte ptr [eax],1
 00074B44    lea         edx,[ebp-0C]
 00074B47    lea         eax,[ebp-18]
 00074B4A    mov         cl,4
 00074B4C    call        @PStrNCat
 00074B51    lea         edx,[ebp-18]
 00074B54    lea         eax,[ebp-20]
 00074B57    call        @PStrCpy
 00074B5C    lea         eax,[ebp-0C]
 00074B5F    mov         dl,byte ptr [ebp+0C]
 00074B62    mov         byte ptr [eax+1],dl
 00074B65    mov         byte ptr [eax],1
 00074B68    lea         edx,[ebp-0C]
 00074B6B    lea         eax,[ebp-20]
 00074B6E    mov         cl,5
 00074B70    call        @PStrNCat
 00074B75    lea         edx,[ebp-20]
 00074B78    lea         eax,[ebp-28]
 00074B7B    call        @PStrCpy
 00074B80    lea         eax,[ebp-0C]
 00074B83    mov         dl,byte ptr [ebp+0D]
 00074B86    mov         byte ptr [eax+1],dl
 00074B89    mov         byte ptr [eax],1
 00074B8C    lea         edx,[ebp-0C]
 00074B8F    lea         eax,[ebp-28]
 00074B92    mov         cl,6
 00074B94    call        @PStrNCat
 00074B99    lea         edx,[ebp-28]
 00074B9C    lea         eax,[ebp-30]
 00074B9F    call        @PStrCpy
 00074BA4    lea         eax,[ebp-0C]
 00074BA7    mov         dl,byte ptr [ebp+0E]
 00074BAA    mov         byte ptr [eax+1],dl
 00074BAD    mov         byte ptr [eax],1
 00074BB0    lea         edx,[ebp-0C]
 00074BB3    lea         eax,[ebp-30]
 00074BB6    mov         cl,7
 00074BB8    call        @PStrNCat
 00074BBD    lea         edx,[ebp-30]
 00074BC0    lea         eax,[ebp-3C]
 00074BC3    call        @PStrCpy
 00074BC8    lea         eax,[ebp-0C]
 00074BCB    mov         dl,byte ptr [ebp+0F]
 00074BCE    mov         byte ptr [eax+1],dl
 00074BD1    mov         byte ptr [eax],1
 00074BD4    lea         edx,[ebp-0C]
 00074BD7    lea         eax,[ebp-3C]
 00074BDA    mov         cl,8
 00074BDC    call        @PStrNCat
 00074BE1    lea         edx,[ebp-3C]
 00074BE4    mov         eax,ebx
 00074BE6    call        @LStrFromString
 00074BEB    pop         ebx
 00074BEC    mov         esp,ebp
 00074BEE    pop         ebp
 00074BEF    ret         8
end;*}

//00074BF4
{*procedure sub_00074BF4(?:AnsiString; ?:?; ?:?);
begin
 00074BF4    push        ebp
 00074BF5    mov         ebp,esp
 00074BF7    add         esp,0FFFFFFF4
 00074BFA    push        ebx
 00074BFB    push        esi
 00074BFC    push        edi
 00074BFD    xor         ebx,ebx
 00074BFF    mov         dword ptr [ebp-0C],ebx
 00074C02    mov         dword ptr [ebp-8],ecx
 00074C05    mov         byte ptr [ebp-1],dl
 00074C08    mov         esi,eax
 00074C0A    xor         eax,eax
 00074C0C    push        ebp
 00074C0D    push        74C8B
 00074C12    push        dword ptr fs:[eax]
 00074C15    mov         dword ptr fs:[eax],esp
 00074C18    mov         eax,dword ptr [ebp-8]
 00074C1B    call        @LStrClr
 00074C20    mov         ebx,1
 00074C25    mov         eax,esi
 00074C27    call        @LStrLen
 00074C2C    mov         edi,eax
 00074C2E    cmp         edi,ebx
>00074C30    jl          00074C75
 00074C32    cmp         byte ptr [esi+ebx-1],20
>00074C37    jne         00074C3C
 00074C39    inc         ebx
>00074C3A    jmp         00074C71
 00074C3C    mov         al,byte ptr [esi+ebx-1]
 00074C40    cmp         al,byte ptr [ebp-1]
>00074C43    jne         00074C56
 00074C45    cmp         edi,ebx
>00074C47    jle         00074C56
 00074C49    mov         al,byte ptr [esi+ebx]
 00074C4C    cmp         al,byte ptr [ebp-1]
>00074C4F    jne         00074C56
 00074C51    add         ebx,2
>00074C54    jmp         00074C71
 00074C56    lea         eax,[ebp-0C]
 00074C59    mov         dl,byte ptr [esi+ebx-1]
 00074C5D    call        @LStrFromChar
 00074C62    mov         edx,dword ptr [ebp-0C]
 00074C65    mov         eax,dword ptr [ebp-8]
 00074C68    call        @LStrCat
 00074C6D    mov         eax,dword ptr [ebp-8]
 00074C70    inc         ebx
 00074C71    cmp         edi,ebx
>00074C73    jge         00074C32
 00074C75    xor         eax,eax
 00074C77    pop         edx
 00074C78    pop         ecx
 00074C79    pop         ecx
 00074C7A    mov         dword ptr fs:[eax],edx
 00074C7D    push        74C92
 00074C82    lea         eax,[ebp-0C]
 00074C85    call        @LStrClr
 00074C8A    ret
>00074C8B    jmp         @HandleFinally
>00074C90    jmp         00074C82
 00074C92    pop         edi
 00074C93    pop         esi
 00074C94    pop         ebx
 00074C95    mov         esp,ebp
 00074C97    pop         ebp
 00074C98    ret
end;*}

//00074C9C
{*procedure sub_00074C9C(?:?; ?:AnsiString);
begin
 00074C9C    push        ebx
 00074C9D    push        esi
 00074C9E    add         esp,0FFFFFFF4
 00074CA1    mov         esi,edx
 00074CA3    mov         ebx,eax
 00074CA5    mov         eax,esp
 00074CA7    mov         edx,ebx
 00074CA9    and         dl,0F0
 00074CAC    and         edx,0FF
 00074CB2    shr         edx,4
 00074CB5    mov         dl,byte ptr [edx+0B4DD8];'0123456789ABCDEFÈ'+#7
 00074CBB    mov         byte ptr [eax+1],dl
 00074CBE    mov         byte ptr [eax],1
 00074CC1    mov         edx,esp
 00074CC3    lea         eax,[esp+4]
 00074CC7    call        @PStrCpy
 00074CCC    lea         eax,[esp+8]
 00074CD0    and         bl,0F
 00074CD3    xor         edx,edx
 00074CD5    mov         dl,bl
 00074CD7    mov         dl,byte ptr [edx+0B4DD8];'0123456789ABCDEFÈ'+#7
 00074CDD    mov         byte ptr [eax+1],dl
 00074CE0    mov         byte ptr [eax],1
 00074CE3    lea         edx,[esp+8]
 00074CE7    lea         eax,[esp+4]
 00074CEB    mov         cl,2
 00074CED    call        @PStrNCat
 00074CF2    lea         edx,[esp+4]
 00074CF6    mov         eax,esi
 00074CF8    call        @LStrFromString
 00074CFD    add         esp,0C
 00074D00    pop         esi
 00074D01    pop         ebx
 00074D02    ret
end;*}

//00074D04
{*procedure sub_00074D04(?:AnsiString; ?:?; ?:?);
begin
 00074D04    push        ebp
 00074D05    mov         ebp,esp
 00074D07    add         esp,0FFFFFFF4
 00074D0A    push        ebx
 00074D0B    push        esi
 00074D0C    push        edi
 00074D0D    xor         ebx,ebx
 00074D0F    mov         dword ptr [ebp-0C],ebx
 00074D12    mov         ebx,ecx
 00074D14    mov         byte ptr [ebp-5],dl
 00074D17    mov         dword ptr [ebp-4],eax
 00074D1A    xor         eax,eax
 00074D1C    push        ebp
 00074D1D    push        74D93
 00074D22    push        dword ptr fs:[eax]
 00074D25    mov         dword ptr fs:[eax],esp
 00074D28    mov         eax,ebx
 00074D2A    call        @LStrClr
 00074D2F    mov         eax,dword ptr [ebp-4]
 00074D32    call        @LStrLen
 00074D37    mov         edi,eax
 00074D39    test        edi,edi
>00074D3B    jle         00074D7D
 00074D3D    mov         esi,1
 00074D42    lea         edx,[ebp-0C]
 00074D45    mov         eax,dword ptr [ebp-4]
 00074D48    mov         al,byte ptr [eax+esi-1]
 00074D4C    call        00074C9C
 00074D51    mov         edx,dword ptr [ebp-0C]
 00074D54    mov         eax,ebx
 00074D56    call        @LStrCat
 00074D5B    cmp         byte ptr [ebp-5],0
>00074D5F    je          00074D79
 00074D61    mov         eax,dword ptr [ebp-4]
 00074D64    call        @LStrLen
 00074D69    cmp         esi,eax
>00074D6B    jge         00074D79
 00074D6D    mov         eax,ebx
 00074D6F    mov         edx,74DAC;' '
 00074D74    call        @LStrCat
 00074D79    inc         esi
 00074D7A    dec         edi
>00074D7B    jne         00074D42
 00074D7D    xor         eax,eax
 00074D7F    pop         edx
 00074D80    pop         ecx
 00074D81    pop         ecx
 00074D82    mov         dword ptr fs:[eax],edx
 00074D85    push        74D9A
 00074D8A    lea         eax,[ebp-0C]
 00074D8D    call        @LStrClr
 00074D92    ret
>00074D93    jmp         @HandleFinally
>00074D98    jmp         00074D8A
 00074D9A    pop         edi
 00074D9B    pop         esi
 00074D9C    pop         ebx
 00074D9D    mov         esp,ebp
 00074D9F    pop         ebp
 00074DA0    ret
end;*}

//00074DB0
{*function sub_00074DB0(?:?; ?:?):?;
begin
 00074DB0    push        ebp
 00074DB1    mov         ebp,esp
 00074DB3    push        0
 00074DB5    push        0
 00074DB7    push        0
 00074DB9    push        ebx
 00074DBA    push        esi
 00074DBB    push        edi
 00074DBC    mov         byte ptr [ebp-1],dl
 00074DBF    mov         edi,eax
 00074DC1    xor         eax,eax
 00074DC3    push        ebp
 00074DC4    push        74E94
 00074DC9    push        dword ptr fs:[eax]
 00074DCC    mov         dword ptr fs:[eax],esp
 00074DCF    mov         byte ptr [ebp-2],0
 00074DD3    cmp         byte ptr [ebp-1],0
>00074DD7    je          00074DF1
 00074DD9    mov         eax,edi
 00074DDB    call        @LStrLen
 00074DE0    inc         eax
 00074DE1    mov         ecx,3
 00074DE6    cdq
 00074DE7    idiv        eax,ecx
 00074DE9    test        edx,edx
>00074DEB    jne         00074E79
 00074DF1    cmp         byte ptr [ebp-1],0
>00074DF5    jne         00074E0E
 00074DF7    mov         eax,edi
 00074DF9    call        @LStrLen
 00074DFE    and         eax,80000001
>00074E03    jns         00074E0A
 00074E05    dec         eax
 00074E06    or          eax,0FFFFFFFE
 00074E09    inc         eax
 00074E0A    test        eax,eax
>00074E0C    jne         00074E79
 00074E0E    mov         eax,edi
 00074E10    call        @LStrLen
 00074E15    mov         esi,eax
 00074E17    test        esi,esi
>00074E19    jle         00074E75
 00074E1B    mov         ebx,1
 00074E20    cmp         byte ptr [ebp-1],0
>00074E24    je          00074E3B
 00074E26    mov         eax,ebx
 00074E28    mov         ecx,3
 00074E2D    cdq
 00074E2E    idiv        eax,ecx
 00074E30    test        edx,edx
>00074E32    jne         00074E3B
 00074E34    cmp         byte ptr [edi+ebx-1],20
>00074E39    je          00074E71
 00074E3B    mov         al,byte ptr [edi+ebx-1]
 00074E3F    call        UpCase
 00074E44    mov         edx,eax
 00074E46    lea         eax,[ebp-8]
 00074E49    call        @LStrFromChar
 00074E4E    mov         eax,dword ptr [ebp-8]
 00074E51    push        eax
 00074E52    lea         eax,[ebp-0C]
 00074E55    mov         edx,0B4DD8;'0123456789ABCDEFÈ'+#7
 00074E5A    mov         ecx,10
 00074E5F    call        @LStrFromArray
 00074E64    mov         edx,dword ptr [ebp-0C]
 00074E67    pop         eax
 00074E68    call        @LStrPos
 00074E6D    test        eax,eax
>00074E6F    je          00074E79
 00074E71    inc         ebx
 00074E72    dec         esi
>00074E73    jne         00074E20
 00074E75    mov         byte ptr [ebp-2],1
 00074E79    xor         eax,eax
 00074E7B    pop         edx
 00074E7C    pop         ecx
 00074E7D    pop         ecx
 00074E7E    mov         dword ptr fs:[eax],edx
 00074E81    push        74E9B
 00074E86    lea         eax,[ebp-0C]
 00074E89    mov         edx,2
 00074E8E    call        @LStrArrayClr
 00074E93    ret
>00074E94    jmp         @HandleFinally
>00074E99    jmp         00074E86
 00074E9B    mov         al,byte ptr [ebp-2]
 00074E9E    pop         edi
 00074E9F    pop         esi
 00074EA0    pop         ebx
 00074EA1    mov         esp,ebp
 00074EA3    pop         ebp
 00074EA4    ret
end;*}

//00074EA8
{*function sub_00074EA8(?:AnsiString):?;
begin
 00074EA8    push        ebx
 00074EA9    push        esi
 00074EAA    mov         ebx,eax
 00074EAC    mov         al,byte ptr [ebx]
 00074EAE    call        00074FA4
 00074EB3    and         eax,0FF
 00074EB8    mov         esi,eax
 00074EBA    shl         esi,4
 00074EBD    mov         al,byte ptr [ebx+1]
 00074EC0    call        00074FA4
 00074EC5    and         eax,0FF
 00074ECA    add         esi,eax
 00074ECC    mov         eax,esi
 00074ECE    pop         esi
 00074ECF    pop         ebx
 00074ED0    ret
end;*}

//00074ED4
{*procedure sub_00074ED4(?:AnsiString; ?:?; ?:?);
begin
 00074ED4    push        ebp
 00074ED5    mov         ebp,esp
 00074ED7    add         esp,0FFFFFFF8
 00074EDA    push        ebx
 00074EDB    push        esi
 00074EDC    push        edi
 00074EDD    xor         ebx,ebx
 00074EDF    mov         dword ptr [ebp-8],ebx
 00074EE2    mov         edi,ecx
 00074EE4    mov         byte ptr [ebp-1],dl
 00074EE7    mov         esi,eax
 00074EE9    xor         eax,eax
 00074EEB    push        ebp
 00074EEC    push        74F93
 00074EF1    push        dword ptr fs:[eax]
 00074EF4    mov         dword ptr fs:[eax],esp
 00074EF7    mov         eax,edi
 00074EF9    call        @LStrClr
 00074EFE    mov         ebx,1
>00074F03    jmp         00074F6F
 00074F05    mov         al,byte ptr [esi+ebx-1]
 00074F09    call        00074FA4
 00074F0E    and         eax,0FF
 00074F13    shl         eax,4
 00074F16    push        eax
 00074F17    mov         al,byte ptr [esi+ebx]
 00074F1A    call        00074FA4
 00074F1F    and         eax,0FF
 00074F24    pop         edx
 00074F25    add         edx,eax
 00074F27    lea         eax,[ebp-8]
 00074F2A    call        @LStrFromChar
 00074F2F    mov         edx,dword ptr [ebp-8]
 00074F32    mov         eax,edi
 00074F34    call        @LStrCat
 00074F39    cmp         byte ptr [ebp-1],0
>00074F3D    je          00074F6C
 00074F3F    mov         eax,esi
 00074F41    call        @LStrLen
 00074F46    lea         edx,[ebx+2]
 00074F49    cmp         eax,edx
>00074F4B    jl          00074F67
 00074F4D    cmp         byte ptr [esi+ebx+1],20
>00074F52    je          00074F67
 00074F54    xor         ecx,ecx
 00074F56    mov         dl,1
 00074F58    mov         eax,[000176E8];Exception
 00074F5D    call        Exception.Create;Exception.Create
 00074F62    call        @RaiseExcept
 00074F67    add         ebx,3
>00074F6A    jmp         00074F6F
 00074F6C    add         ebx,2
 00074F6F    mov         eax,esi
 00074F71    call        @LStrLen
 00074F76    lea         edx,[ebx+1]
 00074F79    cmp         eax,edx
>00074F7B    jge         00074F05
 00074F7D    xor         eax,eax
 00074F7F    pop         edx
 00074F80    pop         ecx
 00074F81    pop         ecx
 00074F82    mov         dword ptr fs:[eax],edx
 00074F85    push        74F9A
 00074F8A    lea         eax,[ebp-8]
 00074F8D    call        @LStrClr
 00074F92    ret
>00074F93    jmp         @HandleFinally
>00074F98    jmp         00074F8A
 00074F9A    pop         edi
 00074F9B    pop         esi
 00074F9C    pop         ebx
 00074F9D    pop         ecx
 00074F9E    pop         ecx
 00074F9F    pop         ebp
 00074FA0    ret
end;*}

//00074FA4
{*function sub_00074FA4:?;
begin
 00074FA4    call        UpCase
 00074FA9    and         eax,0FF
 00074FAE    add         eax,0FFFFFFD0
 00074FB1    cmp         eax,16
>00074FB4    ja          0007504D
 00074FBA    jmp         dword ptr [eax*4+74FC1]
 00074FBA    dd          0007501D
 00074FBA    dd          00075020
 00074FBA    dd          00075023
 00074FBA    dd          00075026
 00074FBA    dd          00075029
 00074FBA    dd          0007502C
 00074FBA    dd          0007502F
 00074FBA    dd          00075032
 00074FBA    dd          00075035
 00074FBA    dd          00075038
 00074FBA    dd          0007504D
 00074FBA    dd          0007504D
 00074FBA    dd          0007504D
 00074FBA    dd          0007504D
 00074FBA    dd          0007504D
 00074FBA    dd          0007504D
 00074FBA    dd          0007504D
 00074FBA    dd          0007503B
 00074FBA    dd          0007503E
 00074FBA    dd          00075041
 00074FBA    dd          00075044
 00074FBA    dd          00075047
 00074FBA    dd          0007504A
 0007501D    xor         eax,eax
 0007501F    ret
 00075020    mov         al,1
 00075022    ret
 00075023    mov         al,2
 00075025    ret
 00075026    mov         al,3
 00075028    ret
 00075029    mov         al,4
 0007502B    ret
 0007502C    mov         al,5
 0007502E    ret
 0007502F    mov         al,6
 00075031    ret
 00075032    mov         al,7
 00075034    ret
 00075035    mov         al,8
 00075037    ret
 00075038    mov         al,9
 0007503A    ret
 0007503B    mov         al,0A
 0007503D    ret
 0007503E    mov         al,0B
 00075040    ret
 00075041    mov         al,0C
 00075043    ret
 00075044    mov         al,0D
 00075046    ret
 00075047    mov         al,0E
 00075049    ret
 0007504A    mov         al,0F
 0007504C    ret
 0007504D    mov         ecx,7506C;'Not a hex char'
 00075052    mov         dl,1
 00075054    mov         eax,[000176E8];Exception
 00075059    call        Exception.Create;Exception.Create
 0007505E    call        @RaiseExcept
 00075063    ret
end;*}

//0007507C
{*function sub_0007507C(?:?):?;
begin
 0007507C    push        ebp
 0007507D    mov         ebp,esp
 0007507F    add         esp,0FFFFFFF8
 00075082    push        ebx
 00075083    push        esi
 00075084    mov         dword ptr [ebp-4],eax
 00075087    mov         eax,dword ptr [ebp-4]
 0007508A    call        @LStrAddRef
 0007508F    xor         eax,eax
 00075091    push        ebp
 00075092    push        750ED
 00075097    push        dword ptr fs:[eax]
 0007509A    mov         dword ptr fs:[eax],esp
 0007509D    xor         esi,esi
 0007509F    mov         eax,dword ptr [ebp-4]
 000750A2    call        @LStrLen
 000750A7    mov         ebx,eax
 000750A9    test        bl,bl
>000750AB    jbe         000750D7
 000750AD    mov         byte ptr [ebp-5],1
 000750B1    xor         eax,eax
 000750B3    mov         al,byte ptr [ebp-5]
 000750B6    mov         edx,dword ptr [ebp-4]
 000750B9    mov         al,byte ptr [edx+eax-1]
 000750BD    call        00074FA4
 000750C2    and         eax,0FF
 000750C7    mov         edx,esi
 000750C9    shl         edx,4
 000750CC    add         eax,edx
 000750CE    mov         esi,eax
 000750D0    inc         byte ptr [ebp-5]
 000750D3    dec         bl
>000750D5    jne         000750B1
 000750D7    xor         eax,eax
 000750D9    pop         edx
 000750DA    pop         ecx
 000750DB    pop         ecx
 000750DC    mov         dword ptr fs:[eax],edx
 000750DF    push        750F4
 000750E4    lea         eax,[ebp-4]
 000750E7    call        @LStrClr
 000750EC    ret
>000750ED    jmp         @HandleFinally
>000750F2    jmp         000750E4
 000750F4    mov         eax,esi
 000750F6    pop         esi
 000750F7    pop         ebx
 000750F8    pop         ecx
 000750F9    pop         ecx
 000750FA    pop         ebp
 000750FB    ret
end;*}

//000750FC
{*procedure sub_000750FC(?:?; ?:?);
begin
 000750FC    push        ebx
 000750FD    mov         ecx,dword ptr [eax]
 000750FF    mov         ebx,dword ptr [edx]
 00075101    mov         dword ptr [eax],ebx
 00075103    mov         dword ptr [edx],ecx
 00075105    pop         ebx
 00075106    ret
end;*}

//00075108
{*procedure sub_00075108(?:?; ?:?; ?:?);
begin
 00075108    push        ebx
 00075109    push        esi
 0007510A    push        edi
 0007510B    mov         edi,ecx
 0007510D    mov         esi,edx
 0007510F    mov         ebx,eax
 00075111    mov         eax,ebx
 00075113    call        @LStrLen
 00075118    cmp         esi,eax
>0007511A    jl          00075127
 0007511C    mov         eax,edi
 0007511E    mov         edx,ebx
 00075120    call        @LStrLAsg
>00075125    jmp         0007513D
 00075127    push        edi
 00075128    mov         eax,ebx
 0007512A    call        @LStrLen
 0007512F    mov         edx,eax
 00075131    sub         edx,esi
 00075133    inc         edx
 00075134    mov         ecx,esi
 00075136    mov         eax,ebx
 00075138    call        @LStrCopy
 0007513D    pop         edi
 0007513E    pop         esi
 0007513F    pop         ebx
 00075140    ret
end;*}

//00075144
{*procedure sub_00075144(?:?; ?:?; ?:?);
begin
 00075144    push        ebx
 00075145    push        esi
 00075146    push        edi
 00075147    mov         edi,ecx
 00075149    mov         esi,edx
 0007514B    mov         ebx,eax
 0007514D    push        edi
 0007514E    mov         eax,ebx
 00075150    call        @LStrLen
 00075155    mov         ecx,eax
 00075157    sub         ecx,esi
 00075159    lea         edx,[esi+1]
 0007515C    mov         eax,ebx
 0007515E    call        @LStrCopy
 00075163    pop         edi
 00075164    pop         esi
 00075165    pop         ebx
 00075166    ret
end;*}

//00075168
{*procedure sub_00075168(?:AnsiString; ?:?; ?:?);
begin
 00075168    push        ebx
 00075169    push        esi
 0007516A    push        edi
 0007516B    mov         edi,ecx
 0007516D    mov         esi,edx
 0007516F    mov         ebx,eax
 00075171    push        edi
 00075172    mov         eax,ebx
 00075174    call        @LStrLen
 00075179    mov         ecx,eax
 0007517B    sub         ecx,esi
 0007517D    mov         edx,1
 00075182    mov         eax,ebx
 00075184    call        @LStrCopy
 00075189    pop         edi
 0007518A    pop         esi
 0007518B    pop         ebx
 0007518C    ret
end;*}

//00075190
{*procedure sub_00075190(?:String; ?:?; ?:?);
begin
 00075190    push        ebx
 00075191    push        esi
 00075192    push        edi
 00075193    mov         edi,ecx
 00075195    mov         esi,edx
 00075197    mov         ebx,eax
 00075199    push        edi
 0007519A    mov         eax,ebx
 0007519C    call        @LStrLen
 000751A1    mov         ecx,eax
 000751A3    sub         ecx,esi
 000751A5    inc         ecx
 000751A6    mov         edx,esi
 000751A8    mov         eax,ebx
 000751AA    call        @LStrCopy
 000751AF    pop         edi
 000751B0    pop         esi
 000751B1    pop         ebx
 000751B2    ret
end;*}

//000751B4
{*procedure sub_000751B4(?:?; ?:?);
begin
 000751B4    push        ebx
 000751B5    push        esi
 000751B6    mov         esi,edx
 000751B8    mov         ebx,eax
 000751BA    mov         eax,ebx
 000751BC    call        @LStrLen
 000751C1    dec         eax
>000751C2    jle         000751F3
 000751C4    cmp         byte ptr [ebx],22
>000751C7    jne         000751F3
 000751C9    mov         eax,ebx
 000751CB    call        @LStrLen
 000751D0    cmp         byte ptr [ebx+eax-1],22
>000751D5    jne         000751F3
 000751D7    push        esi
 000751D8    mov         eax,ebx
 000751DA    call        @LStrLen
 000751DF    mov         ecx,eax
 000751E1    sub         ecx,2
 000751E4    mov         edx,2
 000751E9    mov         eax,ebx
 000751EB    call        @LStrCopy
 000751F0    pop         esi
 000751F1    pop         ebx
 000751F2    ret
 000751F3    mov         eax,esi
 000751F5    mov         edx,ebx
 000751F7    call        @LStrLAsg
 000751FC    pop         esi
 000751FD    pop         ebx
 000751FE    ret
end;*}

//00075200
{*function sub_00075200(?:?; ?:?):Boolean;
begin
 00075200    mov         ecx,edx
 00075202    mov         edx,1
 00075207    shl         edx,cl
 00075209    test        edx,eax
 0007520B    setne       al
 0007520E    ret
end;*}

//00075210
{*function sub_00075210(?:?; ?:?; ?:?):?;
begin
 00075210    test        cl,cl
>00075212    je          00075220
 00075214    mov         ecx,edx
 00075216    mov         edx,1
 0007521B    shl         edx,cl
 0007521D    or          eax,edx
 0007521F    ret
 00075220    mov         ecx,edx
 00075222    mov         edx,1
 00075227    shl         edx,cl
 00075229    xor         edx,0FFFFFFFF
 0007522C    and         eax,edx
 0007522E    ret
end;*}

//00075230
{*procedure sub_00075230(?:?; ?:?);
begin
 00075230    push        ebx
 00075231    push        esi
 00075232    push        edi
 00075233    mov         edi,edx
 00075235    mov         ebx,eax
 00075237    mov         eax,edi
 00075239    mov         edx,7527C;'00000000'
 0007523E    call        @LStrLAsg
 00075243    xor         esi,esi
 00075245    mov         edx,esi
 00075247    xor         eax,eax
 00075249    mov         al,bl
 0007524B    call        00075200
 00075250    test        al,al
>00075252    je          00075267
 00075254    mov         eax,edi
 00075256    call        UniqueString
 0007525B    mov         edx,8
 00075260    sub         edx,esi
 00075262    mov         byte ptr [eax+edx-1],31
 00075267    inc         esi
 00075268    cmp         esi,8
>0007526B    jne         00075245
 0007526D    pop         edi
 0007526E    pop         esi
 0007526F    pop         ebx
 00075270    ret
end;*}

//00075288
{*function sub_00075288(?:String; ?:?):?;
begin
 00075288    push        esi
 00075289    mov         ecx,dword ptr [eax]
 0007528B    test        edx,edx
>0007528D    jle         000752A0
 0007528F    add         eax,4
 00075292    mov         esi,dword ptr [eax]
 00075294    cmp         ecx,esi
>00075296    jle         0007529A
 00075298    mov         ecx,esi
 0007529A    add         eax,4
 0007529D    dec         edx
>0007529E    jne         00075292
 000752A0    mov         eax,ecx
 000752A2    pop         esi
 000752A3    ret
end;*}

//000752A4
{*function sub_000752A4(?:?; ?:?):?;
begin
 000752A4    push        esi
 000752A5    mov         ecx,dword ptr [eax]
 000752A7    test        edx,edx
>000752A9    jle         000752BC
 000752AB    add         eax,4
 000752AE    mov         esi,dword ptr [eax]
 000752B0    cmp         ecx,esi
>000752B2    jge         000752B6
 000752B4    mov         ecx,esi
 000752B6    add         eax,4
 000752B9    dec         edx
>000752BA    jne         000752AE
 000752BC    mov         eax,ecx
 000752BE    pop         esi
 000752BF    ret
end;*}

//000752C0
{*function sub_000752C0(?:?):?;
begin
 000752C0    push        ebp
 000752C1    mov         ebp,esp
 000752C3    add         esp,0FFFFFFF0
 000752C6    push        ebx
 000752C7    push        esi
 000752C8    mov         dword ptr [ebp-4],eax
 000752CB    mov         eax,dword ptr [ebp-4]
 000752CE    call        @LStrAddRef
 000752D3    xor         eax,eax
 000752D5    push        ebp
 000752D6    push        7533D
 000752DB    push        dword ptr fs:[eax]
 000752DE    mov         dword ptr fs:[eax],esp
 000752E1    mov         eax,dword ptr [ebp-4]
 000752E4    call        @LStrLen
 000752E9    mov         esi,eax
 000752EB    test        esi,esi
>000752ED    jle         0007531B
 000752EF    mov         ebx,1
 000752F4    mov         eax,dword ptr [ebp-4]
 000752F7    mov         al,byte ptr [eax+ebx-1]
 000752FB    sub         al,2C
>000752FD    je          00075303
 000752FF    sub         al,2
>00075301    jne         00075317
 00075303    lea         eax,[ebp-4]
 00075306    call        UniqueString
 0007530B    mov         edx,dword ptr ds:[0B5BAC];^gvar_000B64FB:Char
 00075311    mov         dl,byte ptr [edx]
 00075313    mov         byte ptr [eax+ebx-1],dl
 00075317    inc         ebx
 00075318    dec         esi
>00075319    jne         000752F4
 0007531B    mov         eax,dword ptr [ebp-4]
 0007531E    call        StrToFloat
 00075323    fstp        tbyte ptr [ebp-0E]
 00075326    wait
 00075327    xor         eax,eax
 00075329    pop         edx
 0007532A    pop         ecx
 0007532B    pop         ecx
 0007532C    mov         dword ptr fs:[eax],edx
 0007532F    push        75344
 00075334    lea         eax,[ebp-4]
 00075337    call        @LStrClr
 0007533C    ret
>0007533D    jmp         @HandleFinally
>00075342    jmp         00075334
 00075344    fld         tbyte ptr [ebp-0E]
 00075347    pop         esi
 00075348    pop         ebx
 00075349    mov         esp,ebp
 0007534B    pop         ebp
 0007534C    ret
end;*}

//00075350
{*function sub_00075350(?:String):?;
begin
 00075350    push        ebx
 00075351    push        esi
 00075352    push        edi
 00075353    push        ebp
 00075354    mov         esi,eax
 00075356    xor         ebx,ebx
 00075358    mov         eax,esi
 0007535A    call        @LStrLen
 0007535F    mov         edi,eax
 00075361    test        edi,edi
>00075363    jle         00075390
 00075365    mov         eax,1
 0007536A    mov         dl,byte ptr [esi+eax-1]
 0007536E    mov         ebp,edx
 00075370    and         ebp,0FF
 00075376    mov         cl,byte ptr [ebp+0B689C];gvar_000B689C
 0007537C    cmp         cl,dl
>0007537E    jne         00075388
 00075380    cmp         dl,byte ptr [ebp+0B699C];gvar_000B699C
>00075386    je          0007538C
 00075388    mov         bl,1
>0007538A    jmp         00075390
 0007538C    inc         eax
 0007538D    dec         edi
>0007538E    jne         0007536A
 00075390    mov         eax,ebx
 00075392    pop         ebp
 00075393    pop         edi
 00075394    pop         esi
 00075395    pop         ebx
 00075396    ret
end;*}

//00075398
procedure sub_00075398;
begin
{*
 00075398    push        ebp
 00075399    mov         ebp,esp
 0007539B    push        0
 0007539D    push        0
 0007539F    push        ebx
 000753A0    push        esi
 000753A1    push        edi
 000753A2    xor         eax,eax
 000753A4    push        ebp
 000753A5    push        75416
 000753AA    push        dword ptr fs:[eax]
 000753AD    mov         dword ptr fs:[eax],esp
 000753B0    xor         ebx,ebx
 000753B2    mov         esi,0B689C;gvar_000B689C
 000753B7    mov         edi,0B699C;gvar_000B699C
 000753BC    lea         eax,[ebp-8]
 000753BF    mov         edx,ebx
 000753C1    call        @LStrFromChar
 000753C6    mov         eax,dword ptr [ebp-8]
 000753C9    lea         edx,[ebp-4]
 000753CC    call        AnsiUpperCase
 000753D1    mov         eax,dword ptr [ebp-4]
 000753D4    mov         al,byte ptr [eax]
 000753D6    mov         byte ptr [esi],al
 000753D8    lea         eax,[ebp-8]
 000753DB    mov         edx,ebx
 000753DD    call        @LStrFromChar
 000753E2    mov         eax,dword ptr [ebp-8]
 000753E5    lea         edx,[ebp-4]
 000753E8    call        AnsiLowerCase
 000753ED    mov         eax,dword ptr [ebp-4]
 000753F0    mov         al,byte ptr [eax]
 000753F2    mov         byte ptr [edi],al
 000753F4    inc         ebx
 000753F5    inc         edi
 000753F6    inc         esi
 000753F7    test        bl,bl
>000753F9    jne         000753BC
 000753FB    xor         eax,eax
 000753FD    pop         edx
 000753FE    pop         ecx
 000753FF    pop         ecx
 00075400    mov         dword ptr fs:[eax],edx
 00075403    push        7541D
 00075408    lea         eax,[ebp-8]
 0007540B    mov         edx,2
 00075410    call        @LStrArrayClr
 00075415    ret
>00075416    jmp         @HandleFinally
>0007541B    jmp         00075408
 0007541D    pop         edi
 0007541E    pop         esi
 0007541F    pop         ebx
 00075420    pop         ecx
 00075421    pop         ecx
 00075422    pop         ebp
 00075423    ret
*}
end;

//00075424
{*procedure sub_00075424(?:String; ?:AnsiString; ?:?; ?:?; ?:?);
begin
 00075424    push        ebp
 00075425    mov         ebp,esp
 00075427    add         esp,0FFFFFFF4
 0007542A    push        ebx
 0007542B    push        esi
 0007542C    push        edi
 0007542D    xor         ebx,ebx
 0007542F    mov         dword ptr [ebp-0C],ebx
 00075432    mov         dword ptr [ebp-8],ecx
 00075435    mov         esi,edx
 00075437    mov         dword ptr [ebp-4],eax
 0007543A    mov         edi,dword ptr [ebp+8]
 0007543D    mov         eax,dword ptr [ebp-4]
 00075440    call        @LStrAddRef
 00075445    xor         eax,eax
 00075447    push        ebp
 00075448    push        7555B
 0007544D    push        dword ptr fs:[eax]
 00075450    mov         dword ptr fs:[eax],esp
 00075453    mov         eax,edi
 00075455    call        @LStrClr
 0007545A    mov         edx,dword ptr [ebp-4]
 0007545D    mov         eax,esi
 0007545F    call        @LStrPos
 00075464    mov         ebx,eax
 00075466    test        ebx,ebx
>00075468    jle         00075533
 0007546E    mov         edx,dword ptr [ebp-4]
 00075471    mov         eax,dword ptr [ebp-8]
 00075474    call        @LStrPos
 00075479    push        eax
 0007547A    mov         eax,esi
 0007547C    call        @LStrLen
 00075481    add         eax,ebx
 00075483    pop         edx
 00075484    cmp         edx,eax
>00075486    jne         000754DE
 00075488    lea         eax,[ebp-0C]
 0007548B    push        eax
 0007548C    mov         eax,esi
 0007548E    call        @LStrLen
 00075493    add         eax,ebx
 00075495    push        eax
 00075496    mov         eax,dword ptr [ebp-8]
 00075499    call        @LStrLen
 0007549E    pop         ecx
 0007549F    add         ecx,eax
 000754A1    dec         ecx
 000754A2    mov         edx,1
 000754A7    mov         eax,dword ptr [ebp-4]
 000754AA    call        @LStrCopy
 000754AF    mov         edx,dword ptr [ebp-0C]
 000754B2    mov         eax,edi
 000754B4    call        @LStrCat
 000754B9    mov         eax,esi
 000754BB    call        @LStrLen
 000754C0    add         ebx,eax
 000754C2    mov         eax,dword ptr [ebp-8]
 000754C5    call        @LStrLen
 000754CA    add         ebx,eax
 000754CC    mov         ecx,ebx
 000754CE    dec         ecx
 000754CF    lea         eax,[ebp-4]
 000754D2    mov         edx,1
 000754D7    call        @LStrDelete
>000754DC    jmp         0007551F
 000754DE    push        dword ptr [edi]
 000754E0    lea         eax,[ebp-0C]
 000754E3    push        eax
 000754E4    mov         ecx,ebx
 000754E6    dec         ecx
 000754E7    mov         edx,1
 000754EC    mov         eax,dword ptr [ebp-4]
 000754EF    call        @LStrCopy
 000754F4    push        dword ptr [ebp-0C]
 000754F7    push        dword ptr [ebp+0C]
 000754FA    mov         eax,edi
 000754FC    mov         edx,3
 00075501    call        @LStrCatN
 00075506    mov         eax,esi
 00075508    call        @LStrLen
 0007550D    mov         ecx,eax
 0007550F    add         ecx,ebx
 00075511    dec         ecx
 00075512    lea         eax,[ebp-4]
 00075515    mov         edx,1
 0007551A    call        @LStrDelete
 0007551F    mov         edx,dword ptr [ebp-4]
 00075522    mov         eax,esi
 00075524    call        @LStrPos
 00075529    mov         ebx,eax
 0007552B    test        ebx,ebx
>0007552D    jg          0007546E
 00075533    mov         eax,edi
 00075535    mov         edx,dword ptr [ebp-4]
 00075538    call        @LStrCat
 0007553D    xor         eax,eax
 0007553F    pop         edx
 00075540    pop         ecx
 00075541    pop         ecx
 00075542    mov         dword ptr fs:[eax],edx
 00075545    push        75562
 0007554A    lea         eax,[ebp-0C]
 0007554D    call        @LStrClr
 00075552    lea         eax,[ebp-4]
 00075555    call        @LStrClr
 0007555A    ret
>0007555B    jmp         @HandleFinally
>00075560    jmp         0007554A
 00075562    pop         edi
 00075563    pop         esi
 00075564    pop         ebx
 00075565    mov         esp,ebp
 00075567    pop         ebp
 00075568    ret         8
end;*}

//0007556C
{*procedure sub_0007556C(?:String; ?:?; ?:?);
begin
 0007556C    push        ebx
 0007556D    push        esi
 0007556E    push        edi
 0007556F    push        ebp
 00075570    add         esp,0FFFFFFF4
 00075573    mov         ebp,ecx
 00075575    mov         byte ptr [esp+4],dl
 00075579    mov         dword ptr [esp],eax
 0007557C    mov         eax,dword ptr [esp]
 0007557F    call        @LStrLen
 00075584    mov         ebx,eax
 00075586    mov         edx,ebx
 00075588    add         edx,edx
 0007558A    mov         eax,ebp
 0007558C    call        @LStrSetLength
 00075591    cmp         byte ptr [esp+4],0
>00075596    je          000755A4
 00075598    mov         esi,1
 0007559D    mov         edi,2
>000755A2    jmp         000755AE
 000755A4    mov         edi,1
 000755A9    mov         esi,2
 000755AE    test        ebx,ebx
>000755B0    jle         000755E9
 000755B2    mov         dword ptr [esp+8],1
 000755BA    mov         eax,ebp
 000755BC    call        UniqueString
 000755C1    mov         edx,dword ptr [esp]
 000755C4    mov         ecx,dword ptr [esp+8]
 000755C8    mov         dl,byte ptr [edx+ecx-1]
 000755CC    mov         byte ptr [eax+esi-1],dl
 000755D0    add         esi,2
 000755D3    mov         eax,ebp
 000755D5    call        UniqueString
 000755DA    mov         byte ptr [eax+edi-1],0
 000755DF    add         edi,2
 000755E2    inc         dword ptr [esp+8]
 000755E6    dec         ebx
>000755E7    jne         000755BA
 000755E9    add         esp,0C
 000755EC    pop         ebp
 000755ED    pop         edi
 000755EE    pop         esi
 000755EF    pop         ebx
 000755F0    ret
end;*}

//000755F4
{*procedure sub_000755F4(?:?; ?:Integer);
begin
 000755F4    push        ebx
 000755F5    push        esi
 000755F6    mov         ecx,edx
 000755F8    mov         esi,eax
 000755FA    mov         eax,esi
 000755FC    cdq
 000755FD    idiv        eax,ecx
 000755FF    mov         ebx,eax
 00075601    mov         eax,esi
 00075603    cdq
 00075604    idiv        eax,ecx
 00075606    test        edx,edx
>00075608    jle         0007560B
 0007560A    inc         ebx
 0007560B    mov         eax,ebx
 0007560D    imul        ecx
 0007560F    pop         esi
 00075610    pop         ebx
 00075611    ret
end;*}

Initialization
//00075644
{*
 00075644    sub         dword ptr ds:[0B6A9C],1
>0007564B    jae         00075652
 0007564D    call        00075398
 00075652    ret
*}
Finalization
end.