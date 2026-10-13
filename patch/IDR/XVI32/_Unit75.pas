//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit75;

interface

uses
  SysUtils, Classes;

    procedure sub_00098084;//00098084
    procedure sub_00098120;//00098120
    //function sub_000981AC(?:dword):?;//000981AC
    //procedure sub_000981B8(?:?; ?:?);//000981B8
    //function sub_000981C4:?;//000981C4
    //procedure sub_000981DC(?:?);//000981DC
    //function sub_0009820C(?:Integer):?;//0009820C
    //function sub_00098350(?:?):?;//00098350
    procedure sub_000983B8;//000983B8
    procedure sub_000985E8(?:AnsiString);//000985E8
    procedure sub_000986CC(?:AnsiString);//000986CC
    procedure sub_000986F4;//000986F4
    //procedure sub_0009870C(?:?);//0009870C
    //procedure sub_00098750(?:?; ?:?);//00098750
    //procedure sub_000987A4(?:?);//000987A4
    //procedure sub_00098804(?:?);//00098804
    procedure sub_00098864;//00098864
    //function sub_00098898(?:?; ?:Integer):?;//00098898
    //function sub_000988E0(?:dword; ?:AnsiString):?;//000988E0
    //procedure sub_000989B4(?:?);//000989B4
    //function sub_00098A74(?:dword; ?:?; ?:AnsiString):?;//00098A74
    //function sub_00098B64(?:?; ?:?; ?:?):?;//00098B64
    //function sub_00098BB8(?:dword; ?:AnsiString; ?:?; ?:?):?;//00098BB8
    //procedure sub_00098C90(?:?);//00098C90
    //function sub_00098DCC(?:?; ?:?; ?:?):?;//00098DCC
    //procedure sub_00099090(?:?);//00099090
    //function sub_000991C8(?:?; ?:?; ?:?; ?:?):?;//000991C8
    //procedure sub_00099514(?:TMenuItem; ?:?; ?:?);//00099514
    //function sub_0009958C:?;//0009958C
    //procedure sub_000995A8(?:?);//000995A8
    procedure sub_00099678;//00099678
    //procedure sub_000996A4(?:?; ?:?);//000996A4
    procedure sub_00099890;//00099890
    //procedure sub_000998B0(?:dword; ?:?; ?:?);//000998B0
    procedure sub_000999AC;//000999AC
    procedure sub_00099A04;//00099A04
    procedure sub_00099A28;//00099A28
    //procedure sub_00099A4C(?:?; ?:?; ?:?);//00099A4C
    //function sub_00099A90(?:?):?;//00099A90
    //function sub_00099AA0(?:?; ?:?):?;//00099AA0
    //function sub_00099AA8:?;//00099AA8
    //function sub_00099AC0:?;//00099AC0
    //procedure sub_00099ADC(?:?; ?:?);//00099ADC
    //procedure sub_00099D98(?:?);//00099D98
    //procedure sub_00099E68(?:?);//00099E68
    //procedure sub_00099ECC(?:?);//00099ECC
    //function sub_00099EE8:?;//00099EE8
    //function sub_00099FE0(?:?):?;//00099FE0
    //function sub_0009A0E0(?:?; ?:?):?;//0009A0E0
    procedure sub_0009A194;//0009A194
    procedure sub_0009A2C0;//0009A2C0
    procedure sub_0009A348;//0009A348
    //procedure sub_0009A450(?:?; ?:?; ?:?; ?:?; ?:?);//0009A450
    //procedure sub_0009A540(?:?; ?:?; ?:?);//0009A540
    //function sub_0009A5A4(?:?; ?:?; ?:?):?;//0009A5A4
    //procedure sub_0009A620(?:?);//0009A620
    //function sub_0009A6A0(?:?):?;//0009A6A0
    //procedure sub_0009A6F0(?:?; ?:?; ?:?; ?:?; ?:?);//0009A6F0
    procedure sub_0009A8AC;//0009A8AC
    //function sub_0009A9D4(?:?; ?:?; ?:?):?;//0009A9D4
    //procedure sub_0009AA30(?:?; ?:?; ?:?; ?:?);//0009AA30
    //procedure sub_0009AB00(?:?; ?:?; ?:?; ?:?);//0009AB00
    //procedure sub_0009ACD8(?:?; ?:?; ?:?; ?:?);//0009ACD8
    //procedure sub_0009AE24(?:?; ?:?; ?:?; ?:?; ?:?);//0009AE24
    //function sub_0009AF40(?:?):?;//0009AF40
    //function sub_0009B070(?:String):?;//0009B070
    procedure sub_0009B244;//0009B244
    procedure sub_0009B254(?:TCMByteEdit);//0009B254
    procedure sub_0009B3A4;//0009B3A4
    //function sub_0009B42C(?:dword; ?:?):?;//0009B42C
    //procedure sub_0009B560(?:dword; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?);//0009B560
    //function sub_0009B904(?:?; ?:?):?;//0009B904
    //function sub_0009B9FC(?:?):?;//0009B9FC

implementation

//00098084
procedure sub_00098084;
begin
{*
 00098084    push        ebp
 00098085    mov         ebp,esp
 00098087    push        0
 00098089    xor         eax,eax
 0009808B    push        ebp
 0009808C    push        98116
 00098091    push        dword ptr fs:[eax]
 00098094    mov         dword ptr fs:[eax],esp
 00098097    lea         edx,[ebp-4]
 0009809A    mov         eax,81A
 0009809F    call        LoadStr;'Allocating memory'
 000980A4    mov         eax,dword ptr [ebp-4]
 000980A7    call        000986CC
 000980AC    mov         ecx,1
 000980B1    mov         dl,1
 000980B3    mov         eax,[000904B4];TCMDynArray
 000980B8    call        TCMDynArray.Create;TCMDynArray.Create
 000980BD    mov         [000B6B70],eax;gvar_000B6B70:TCMDynArray
 000980C2    mov         edx,0B6B6C;gvar_000B6B6C
 000980C7    mov         ecx,80000
 000980CC    mov         eax,[000B6B70];gvar_000B6B70:TCMDynArray
 000980D1    call        000905C0
 000980D6    test        al,al
>000980D8    jne         000980FB
 000980DA    lea         edx,[ebp-4]
 000980DD    mov         eax,7F5
 000980E2    call        LoadStr;'Error allocating memory.
Program terminated.'
 000980E7    mov         eax,dword ptr [ebp-4]
 000980EA    call        0008D0A8
 000980EF    mov         eax,[000B59E8];^Application:TApplication
 000980F4    mov         eax,dword ptr [eax]
 000980F6    call        TApplication.Terminate
 000980FB    call        000986F4
 00098100    xor         eax,eax
 00098102    pop         edx
 00098103    pop         ecx
 00098104    pop         ecx
 00098105    mov         dword ptr fs:[eax],edx
 00098108    push        9811D
 0009810D    lea         eax,[ebp-4]
 00098110    call        @LStrClr
 00098115    ret
>00098116    jmp         @HandleFinally
>0009811B    jmp         0009810D
 0009811D    pop         ecx
 0009811E    pop         ebp
 0009811F    ret
*}
end;

//00098120
procedure sub_00098120;
begin
{*
 00098120    push        ebp
 00098121    mov         ebp,esp
 00098123    push        0
 00098125    xor         eax,eax
 00098127    push        ebp
 00098128    push        981A1
 0009812D    push        dword ptr fs:[eax]
 00098130    mov         dword ptr fs:[eax],esp
 00098133    lea         edx,[ebp-4]
 00098136    mov         eax,81B
 0009813B    call        LoadStr;'Releasing memory'
 00098140    mov         eax,dword ptr [ebp-4]
 00098143    call        000986CC
 00098148    mov         edx,0B6B6C;gvar_000B6B6C
 0009814D    mov         eax,[000B6B70];gvar_000B6B70:TCMDynArray
 00098152    call        00090684
 00098157    test        al,al
>00098159    jne         0009817C
 0009815B    lea         edx,[ebp-4]
 0009815E    mov         eax,7F6
 00098163    call        LoadStr;'Error deallocating memory.
Program terminated.'
 00098168    mov         eax,dword ptr [ebp-4]
 0009816B    call        0008D0A8
 00098170    mov         eax,[000B59E8];^Application:TApplication
 00098175    mov         eax,dword ptr [eax]
 00098177    call        TApplication.Terminate
 0009817C    mov         eax,[000B6B70];gvar_000B6B70:TCMDynArray
 00098181    call        TObject.Free
 00098186    call        000986F4
 0009818B    xor         eax,eax
 0009818D    pop         edx
 0009818E    pop         ecx
 0009818F    pop         ecx
 00098190    mov         dword ptr fs:[eax],edx
 00098193    push        981A8
 00098198    lea         eax,[ebp-4]
 0009819B    call        @LStrClr
 000981A0    ret
>000981A1    jmp         @HandleFinally
>000981A6    jmp         00098198
 000981A8    pop         ecx
 000981A9    pop         ebp
 000981AA    ret
*}
end;

//000981AC
{*function sub_000981AC(?:dword):?;
begin
 000981AC    mov         edx,dword ptr ds:[0B6B6C];gvar_000B6B6C
 000981B2    mov         al,byte ptr [edx+eax-1]
 000981B6    ret
end;*}

//000981B8
{*procedure sub_000981B8(?:?; ?:?);
begin
 000981B8    mov         ecx,dword ptr ds:[0B6B6C];gvar_000B6B6C
 000981BE    mov         byte ptr [ecx+eax-1],dl
 000981C2    ret
end;*}

//000981C4
{*function sub_000981C4:?;
begin
 000981C4    mov         eax,[000B6B80];gvar_000B6B80:Integer
 000981C9    imul        dword ptr ds:[0B6B64];gvar_000B6B64:Longint
 000981CF    add         eax,dword ptr ds:[0B6B84];gvar_000B6B84
 000981D5    add         eax,dword ptr ds:[0B6B7C];gvar_000B6B7C
 000981DB    ret
end;*}

//000981DC
{*procedure sub_000981DC(?:?);
begin
 000981DC    add         esp,0FFFFFFF8
 000981DF    mov         dword ptr [esp],80000
 000981E6    test        eax,eax
>000981E8    jns         000981EF
 000981EA    add         eax,1FFFF
 000981EF    sar         eax,11
 000981F2    inc         eax
 000981F3    shl         eax,11
 000981F6    mov         dword ptr [esp+4],eax
 000981FA    mov         eax,esp
 000981FC    mov         edx,1
 00098201    call        000752A4
 00098206    pop         ecx
 00098207    pop         edx
 00098208    ret
end;*}

//0009820C
{*function sub_0009820C(?:Integer):?;
begin
 0009820C    push        ebp
 0009820D    mov         ebp,esp
 0009820F    push        0
 00098211    push        ebx
 00098212    mov         ebx,eax
 00098214    xor         eax,eax
 00098216    push        ebp
 00098217    push        98340
 0009821C    push        dword ptr fs:[eax]
 0009821F    mov         dword ptr fs:[eax],esp
 00098222    test        ebx,ebx
>00098224    jne         0009822D
 00098226    mov         bl,1
>00098228    jmp         0009832A
 0009822D    test        ebx,ebx
>0009822F    jle         000982B5
 00098235    mov         eax,ebx
 00098237    cdq
 00098238    push        edx
 00098239    push        eax
 0009823A    mov         eax,[000B6B70];gvar_000B6B70:TCMDynArray
 0009823F    mov         eax,dword ptr [eax+0C]
 00098242    xor         edx,edx
 00098244    push        edx
 00098245    push        eax
 00098246    mov         eax,[000B6BAC];gvar_000B6BAC:Single
 0009824B    cdq
 0009824C    sub         dword ptr [esp],eax
 0009824F    sbb         dword ptr [esp+4],edx
 00098253    pop         eax
 00098254    pop         edx
 00098255    cmp         edx,dword ptr [esp+4]
>00098259    jne         00098264
 0009825B    cmp         eax,dword ptr [esp]
 0009825E    pop         edx
 0009825F    pop         eax
>00098260    jb          0009826F
>00098262    jmp         00098268
 00098264    pop         edx
 00098265    pop         eax
>00098266    jl          0009826F
 00098268    mov         bl,1
>0009826A    jmp         0009832A
 0009826F    lea         edx,[ebp-4]
 00098272    mov         eax,81A
 00098277    call        LoadStr;'Allocating memory'
 0009827C    mov         eax,dword ptr [ebp-4]
 0009827F    call        000986CC
 00098284    add         ebx,dword ptr ds:[0B6BAC];gvar_000B6BAC:Single
 0009828A    test        ebx,ebx
>0009828C    jns         00098294
 0009828E    add         ebx,1FFFF
 00098294    sar         ebx,11
 00098297    inc         ebx
 00098298    mov         ecx,ebx
 0009829A    shl         ecx,11
 0009829D    mov         edx,0B6B6C;gvar_000B6B6C
 000982A2    mov         eax,[000B6B70];gvar_000B6B70:TCMDynArray
 000982A7    call        00090628
 000982AC    mov         ebx,eax
 000982AE    call        000986F4
>000982B3    jmp         0009832A
 000982B5    mov         eax,[000B6B70];gvar_000B6B70:TCMDynArray
 000982BA    cmp         dword ptr [eax+0C],80000
>000982C1    ja          000982C7
 000982C3    mov         bl,1
>000982C5    jmp         0009832A
 000982C7    lea         edx,[ebp-4]
 000982CA    mov         eax,81B
 000982CF    call        LoadStr;'Releasing memory'
 000982D4    mov         eax,dword ptr [ebp-4]
 000982D7    call        000986CC
 000982DC    mov         eax,[000B6BAC];gvar_000B6BAC:Single
 000982E1    add         eax,ebx
 000982E3    test        eax,eax
>000982E5    jns         000982EC
 000982E7    add         eax,1FFFF
 000982EC    sar         eax,11
 000982EF    inc         eax
 000982F0    shl         eax,11
 000982F3    cmp         eax,80000
>000982F8    jg          00098312
 000982FA    mov         edx,0B6B6C;gvar_000B6B6C
 000982FF    mov         ecx,80000
 00098304    mov         eax,[000B6B70];gvar_000B6B70:TCMDynArray
 00098309    call        00090628
 0009830E    mov         ebx,eax
>00098310    jmp         00098325
 00098312    mov         ecx,eax
 00098314    mov         edx,0B6B6C;gvar_000B6B6C
 00098319    mov         eax,[000B6B70];gvar_000B6B70:TCMDynArray
 0009831E    call        00090628
 00098323    mov         ebx,eax
 00098325    call        000986F4
 0009832A    xor         eax,eax
 0009832C    pop         edx
 0009832D    pop         ecx
 0009832E    pop         ecx
 0009832F    mov         dword ptr fs:[eax],edx
 00098332    push        98347
 00098337    lea         eax,[ebp-4]
 0009833A    call        @LStrClr
 0009833F    ret
>00098340    jmp         @HandleFinally
>00098345    jmp         00098337
 00098347    mov         eax,ebx
 00098349    pop         ebx
 0009834A    pop         ecx
 0009834B    pop         ebp
 0009834C    ret
end;*}

//00098350
{*function sub_00098350(?:?):?;
begin
 00098350    push        ebp
 00098351    mov         ebp,esp
 00098353    push        0
 00098355    push        ebx
 00098356    mov         ebx,eax
 00098358    xor         eax,eax
 0009835A    push        ebp
 0009835B    push        983A9
 00098360    push        dword ptr fs:[eax]
 00098363    mov         dword ptr fs:[eax],esp
 00098366    lea         edx,[ebp-4]
 00098369    mov         eax,81A
 0009836E    call        LoadStr;'Allocating memory'
 00098373    mov         eax,dword ptr [ebp-4]
 00098376    call        000986CC
 0009837B    mov         edx,0B6B6C;gvar_000B6B6C
 00098380    mov         ecx,ebx
 00098382    mov         eax,[000B6B70];gvar_000B6B70:TCMDynArray
 00098387    call        00090628
 0009838C    mov         ebx,eax
 0009838E    call        000986F4
 00098393    xor         eax,eax
 00098395    pop         edx
 00098396    pop         ecx
 00098397    pop         ecx
 00098398    mov         dword ptr fs:[eax],edx
 0009839B    push        983B0
 000983A0    lea         eax,[ebp-4]
 000983A3    call        @LStrClr
 000983A8    ret
>000983A9    jmp         @HandleFinally
>000983AE    jmp         000983A0
 000983B0    mov         eax,ebx
 000983B2    pop         ebx
 000983B3    pop         ecx
 000983B4    pop         ebp
 000983B5    ret
end;*}

//000983B8
procedure sub_000983B8;
begin
{*
 000983B8    push        ebp
 000983B9    mov         ebp,esp
 000983BB    add         esp,0FFFFFFE4
 000983BE    push        ebx
 000983BF    push        esi
 000983C0    xor         eax,eax
 000983C2    mov         dword ptr [ebp-4],eax
 000983C5    xor         eax,eax
 000983C7    push        ebp
 000983C8    push        985D9
 000983CD    push        dword ptr fs:[eax]
 000983D0    mov         dword ptr fs:[eax],esp
 000983D3    cmp         byte ptr ds:[0B6BB4],0;gvar_000B6BB4
>000983DA    je          000983EE
 000983DC    cmp         dword ptr ds:[0B6BAC],0;gvar_000B6BAC:Single
>000983E3    je          000983EE
 000983E5    cmp         dword ptr ds:[0B6B6C],0;gvar_000B6B6C
>000983EC    jne         00098466
 000983EE    mov         eax,[000B5784];^gvar_000B70A4:TFormMain
 000983F3    mov         eax,dword ptr [eax]
 000983F5    mov         eax,dword ptr [eax+2C4]
 000983FB    mov         eax,dword ptr [eax+1EC]
 00098401    xor         edx,edx
 00098403    call        TCoolBands.GetItem
 00098408    xor         edx,edx
 0009840A    call        TStatusPanel.SetText
 0009840F    mov         eax,[000B5784];^gvar_000B70A4:TFormMain
 00098414    mov         eax,dword ptr [eax]
 00098416    mov         eax,dword ptr [eax+2C4]
 0009841C    mov         eax,dword ptr [eax+1EC]
 00098422    mov         edx,1
 00098427    call        TCoolBands.GetItem
 0009842C    xor         edx,edx
 0009842E    call        TStatusPanel.SetText
 00098433    push        0
 00098435    push        0
 00098437    mov         eax,[000B5784];^gvar_000B70A4:TFormMain
 0009843C    mov         eax,dword ptr [eax]
 0009843E    mov         eax,dword ptr [eax+4C8]
 00098444    xor         ecx,ecx
 00098446    xor         edx,edx
 00098448    call        0008C280
 0009844D    mov         eax,[000B5784];^gvar_000B70A4:TFormMain
 00098452    mov         eax,dword ptr [eax]
 00098454    mov         eax,dword ptr [eax+420]
 0009845A    xor         edx,edx
 0009845C    call        TCustomGrid.SetRow
>00098461    jmp         000985AD
 00098466    call        000981C4
 0009846B    mov         ebx,eax
 0009846D    mov         esi,dword ptr ds:[0B55F8];0x1 gvar_000B55F8:Longint
 00098473    add         esi,ebx
 00098475    dec         esi
 00098476    cmp         byte ptr ds:[0B6BA4],0;gvar_000B6BA4
>0009847D    je          000984D1
 0009847F    lea         eax,[ebp-4]
 00098482    push        eax
 00098483    mov         dword ptr [ebp-10],esi
 00098486    fild        dword ptr [ebp-10]
 00098489    call        @INT
 0009848E    fstp        tbyte ptr [ebp-1C]
 00098491    wait
 00098492    lea         eax,[ebp-1C]
 00098495    mov         dword ptr [ebp-0C],eax
 00098498    mov         byte ptr [ebp-8],3
 0009849C    lea         edx,[ebp-0C]
 0009849F    xor         ecx,ecx
 000984A1    mov         eax,7DD
 000984A6    call        FmtLoadStr;'Adr. dec: %.0n'
 000984AB    mov         eax,dword ptr [ebp-4]
 000984AE    push        eax
 000984AF    mov         eax,[000B5784];^gvar_000B70A4:TFormMain
 000984B4    mov         eax,dword ptr [eax]
 000984B6    mov         eax,dword ptr [eax+2C4]
 000984BC    mov         eax,dword ptr [eax+1EC]
 000984C2    xor         edx,edx
 000984C4    call        TCoolBands.GetItem
 000984C9    pop         edx
 000984CA    call        TStatusPanel.SetText
>000984CF    jmp         0009850F
 000984D1    lea         eax,[ebp-4]
 000984D4    push        eax
 000984D5    mov         dword ptr [ebp-0C],esi
 000984D8    mov         byte ptr [ebp-8],0
 000984DC    lea         edx,[ebp-0C]
 000984DF    xor         ecx,ecx
 000984E1    mov         eax,7DC
 000984E6    call        FmtLoadStr;'Adr. hex: %x'
 000984EB    mov         eax,dword ptr [ebp-4]
 000984EE    push        eax
 000984EF    mov         eax,[000B5784];^gvar_000B70A4:TFormMain
 000984F4    mov         eax,dword ptr [eax]
 000984F6    mov         eax,dword ptr [eax+2C4]
 000984FC    mov         eax,dword ptr [eax+1EC]
 00098502    xor         edx,edx
 00098504    call        TCoolBands.GetItem
 00098509    pop         edx
 0009850A    call        TStatusPanel.SetText
 0009850F    lea         eax,[ebp-4]
 00098512    push        eax
 00098513    mov         eax,ebx
 00098515    call        000981AC
 0009851A    and         eax,0FF
 0009851F    mov         dword ptr [ebp-0C],eax
 00098522    mov         byte ptr [ebp-8],0
 00098526    lea         edx,[ebp-0C]
 00098529    xor         ecx,ecx
 0009852B    mov         eax,7DE
 00098530    call        FmtLoadStr;'Char dec: %d'
 00098535    mov         eax,dword ptr [ebp-4]
 00098538    push        eax
 00098539    mov         eax,[000B5784];^gvar_000B70A4:TFormMain
 0009853E    mov         eax,dword ptr [eax]
 00098540    mov         eax,dword ptr [eax+2C4]
 00098546    mov         eax,dword ptr [eax+1EC]
 0009854C    mov         edx,1
 00098551    call        TCoolBands.GetItem
 00098556    pop         edx
 00098557    call        TStatusPanel.SetText
 0009855C    mov         eax,[000B6BAC];gvar_000B6BAC:Single
 00098561    push        eax
 00098562    mov         eax,[000B6BB0];gvar_000B6BB0:Integer
 00098567    push        eax
 00098568    mov         eax,[000B5784];^gvar_000B70A4:TFormMain
 0009856D    mov         eax,dword ptr [eax]
 0009856F    mov         eax,dword ptr [eax+4C8]
 00098575    mov         ecx,1
 0009857A    mov         edx,ebx
 0009857C    call        0008C280
 00098581    cmp         byte ptr ds:[0B7006],0;gvar_000B7006:Boolean
>00098588    jne         000985AD
 0009858A    mov         eax,ebx
 0009858C    sub         eax,dword ptr ds:[0B6B84];gvar_000B6B84
 00098592    cdq
 00098593    idiv        eax,dword ptr ds:[0B6B64];gvar_000B6B64:Longint
 00098599    mov         edx,eax
 0009859B    mov         eax,[000B5784];^gvar_000B70A4:TFormMain
 000985A0    mov         eax,dword ptr [eax]
 000985A2    mov         eax,dword ptr [eax+420]
 000985A8    call        TCustomGrid.SetRow
 000985AD    mov         eax,[000B5634];^gvar_000B6B50:TFormInspect
 000985B2    cmp         dword ptr [eax],0
>000985B5    je          000985C3
 000985B7    mov         eax,[000B5634];^gvar_000B6B50:TFormInspect
 000985BC    mov         eax,dword ptr [eax]
 000985BE    call        00093834
 000985C3    xor         eax,eax
 000985C5    pop         edx
 000985C6    pop         ecx
 000985C7    pop         ecx
 000985C8    mov         dword ptr fs:[eax],edx
 000985CB    push        985E0
 000985D0    lea         eax,[ebp-4]
 000985D3    call        @LStrClr
 000985D8    ret
>000985D9    jmp         @HandleFinally
>000985DE    jmp         000985D0
 000985E0    pop         esi
 000985E1    pop         ebx
 000985E2    mov         esp,ebp
 000985E4    pop         ebp
 000985E5    ret
*}
end;

//000985E8
procedure sub_000985E8(?:AnsiString);
begin
{*
 000985E8    push        ebp
 000985E9    mov         ebp,esp
 000985EB    push        0
 000985ED    push        ebx
 000985EE    push        esi
 000985EF    mov         esi,eax
 000985F1    xor         eax,eax
 000985F3    push        ebp
 000985F4    push        986BD
 000985F9    push        dword ptr fs:[eax]
 000985FC    mov         dword ptr fs:[eax],esp
 000985FF    mov         eax,[000B5BDC];^Screen:TScreen
 00098604    mov         eax,dword ptr [eax]
 00098606    mov         ebx,dword ptr [eax+60];TScreen.FActiveForm:TForm
 00098609    mov         eax,[000B5784];^gvar_000B70A4:TFormMain
 0009860E    cmp         ebx,dword ptr [eax]
>00098610    jne         0009866F
 00098612    lea         eax,[ebp-4]
 00098615    push        eax
 00098616    mov         eax,[000B5784];^gvar_000B70A4:TFormMain
 0009861B    mov         eax,dword ptr [eax]
 0009861D    mov         ebx,dword ptr [eax+2C4]
 00098623    mov         eax,ebx
 00098625    mov         edx,3
 0009862A    call        00087DF0
 0009862F    mov         ecx,eax
 00098631    sub         ecx,0A
 00098634    mov         eax,[000B5784];^gvar_000B70A4:TFormMain
 00098639    mov         edx,dword ptr [ebx+1F0]
 0009863F    mov         eax,esi
 00098641    call        00087C20
 00098646    mov         eax,dword ptr [ebp-4]
 00098649    push        eax
 0009864A    mov         eax,[000B5784];^gvar_000B70A4:TFormMain
 0009864F    mov         eax,dword ptr [eax]
 00098651    mov         eax,dword ptr [eax+2C4]
 00098657    mov         eax,dword ptr [eax+1EC]
 0009865D    mov         edx,3
 00098662    call        TCoolBands.GetItem
 00098667    pop         edx
 00098668    call        TStatusPanel.SetText
>0009866D    jmp         000986A7
 0009866F    mov         eax,[000B5BDC];^Screen:TScreen
 00098674    mov         eax,ebx
 00098676    mov         edx,dword ptr ds:[947C8];TFormPreview
 0009867C    call        @IsClass
 00098681    test        al,al
>00098683    je          000986A7
 00098685    mov         eax,[000B5BDC];^Screen:TScreen
 0009868A    mov         eax,dword ptr [ebx+2D0]
 00098690    mov         eax,dword ptr [eax+1EC]
 00098696    mov         edx,1
 0009869B    call        TCoolBands.GetItem
 000986A0    mov         edx,esi
 000986A2    call        TStatusPanel.SetText
 000986A7    xor         eax,eax
 000986A9    pop         edx
 000986AA    pop         ecx
 000986AB    pop         ecx
 000986AC    mov         dword ptr fs:[eax],edx
 000986AF    push        986C4
 000986B4    lea         eax,[ebp-4]
 000986B7    call        @LStrClr
 000986BC    ret
>000986BD    jmp         @HandleFinally
>000986C2    jmp         000986B4
 000986C4    pop         esi
 000986C5    pop         ebx
 000986C6    pop         ecx
 000986C7    pop         ebp
 000986C8    ret
*}
end;

//000986CC
procedure sub_000986CC(?:AnsiString);
begin
{*
 000986CC    push        ebx
 000986CD    mov         ebx,eax
 000986CF    mov         eax,[000B5BDC];^Screen:TScreen
 000986D4    mov         eax,dword ptr [eax]
 000986D6    mov         dx,0FFF5
 000986DA    call        TScreen.SetCursor
 000986DF    mov         eax,ebx
 000986E1    call        000985E8
 000986E6    mov         eax,[000B59E8];^Application:TApplication
 000986EB    mov         eax,dword ptr [eax]
 000986ED    call        TApplication.ProcessMessages
 000986F2    pop         ebx
 000986F3    ret
*}
end;

//000986F4
procedure sub_000986F4;
begin
{*
 000986F4    mov         eax,[000B5BDC];^Screen:TScreen
 000986F9    mov         eax,dword ptr [eax]
 000986FB    xor         edx,edx
 000986FD    call        TScreen.SetCursor
 00098702    xor         eax,eax
 00098704    call        000985E8
 00098709    ret
*}
end;

//0009870C
{*procedure sub_0009870C(?:?);
begin
 0009870C    push        ebx
 0009870D    mov         ebx,eax
 0009870F    cmp         byte ptr ds:[0B6BA4],0;gvar_000B6BA4
>00098716    je          0009872E
 00098718    mov         eax,[000B5784];^gvar_000B70A4:TFormMain
 0009871D    mov         eax,dword ptr [eax]
 0009871F    mov         eax,dword ptr [eax+310]
 00098725    mov         edx,ebx
 00098727    call        TCustomGrid.SetCol
>0009872C    jmp         00098742
 0009872E    mov         eax,[000B5784];^gvar_000B70A4:TFormMain
 00098733    mov         eax,dword ptr [eax]
 00098735    mov         eax,dword ptr [eax+314]
 0009873B    mov         edx,ebx
 0009873D    call        TCustomGrid.SetCol
 00098742    mov         dword ptr ds:[0B6B7C],ebx;gvar_000B6B7C
 00098748    call        000983B8
 0009874D    pop         ebx
 0009874E    ret
end;*}

//00098750
{*procedure sub_00098750(?:?; ?:?);
begin
 00098750    push        ebx
 00098751    push        esi
 00098752    mov         esi,edx
 00098754    mov         ebx,eax
 00098756    cmp         byte ptr ds:[0B6BA4],0;gvar_000B6BA4
>0009875D    je          00098777
 0009875F    mov         eax,[000B5784];^gvar_000B70A4:TFormMain
 00098764    mov         eax,dword ptr [eax]
 00098766    mov         eax,dword ptr [eax+310]
 0009876C    mov         ecx,esi
 0009876E    mov         edx,ebx
 00098770    call        000892A8
>00098775    jmp         0009878D
 00098777    mov         eax,[000B5784];^gvar_000B70A4:TFormMain
 0009877C    mov         eax,dword ptr [eax]
 0009877E    mov         eax,dword ptr [eax+314]
 00098784    mov         ecx,esi
 00098786    mov         edx,ebx
 00098788    call        000892A8
 0009878D    mov         dword ptr ds:[0B6B7C],ebx;gvar_000B6B7C
 00098793    mov         dword ptr ds:[0B6B80],esi;gvar_000B6B80:Integer
 00098799    call        000983B8
 0009879E    pop         esi
 0009879F    pop         ebx
 000987A0    ret
end;*}

//000987A4
{*procedure sub_000987A4(?:?);
begin
 000987A4    push        ebx
 000987A5    mov         ebx,eax
 000987A7    mov         byte ptr ds:[0B6BC4],1;gvar_000B6BC4
 000987AE    cmp         byte ptr ds:[0B6BA4],0;gvar_000B6BA4
>000987B5    je          000987DC
 000987B7    push        0
 000987B9    movzx       eax,bx
 000987BC    push        eax
 000987BD    push        100
 000987C2    mov         eax,[000B5784];^gvar_000B70A4:TFormMain
 000987C7    mov         eax,dword ptr [eax]
 000987C9    mov         eax,dword ptr [eax+310]
 000987CF    call        TWinControl.GetHandle
 000987D4    push        eax
 000987D5    call        user32.SendMessageA
 000987DA    pop         ebx
 000987DB    ret
 000987DC    push        0
 000987DE    movzx       eax,bx
 000987E1    push        eax
 000987E2    push        100
 000987E7    mov         eax,[000B5784];^gvar_000B70A4:TFormMain
 000987EC    mov         eax,dword ptr [eax]
 000987EE    mov         eax,dword ptr [eax+314]
 000987F4    call        TWinControl.GetHandle
 000987F9    push        eax
 000987FA    call        user32.SendMessageA
 000987FF    pop         ebx
 00098800    ret
end;*}

//00098804
{*procedure sub_00098804(?:?);
begin
 00098804    push        ebx
 00098805    mov         ebx,eax
 00098807    mov         byte ptr ds:[0B6BC4],1;gvar_000B6BC4
 0009880E    cmp         byte ptr ds:[0B6BA4],0;gvar_000B6BA4
>00098815    je          0009883C
 00098817    push        0
 00098819    movzx       eax,bx
 0009881C    push        eax
 0009881D    push        100
 00098822    mov         eax,[000B5784];^gvar_000B70A4:TFormMain
 00098827    mov         eax,dword ptr [eax]
 00098829    mov         eax,dword ptr [eax+310]
 0009882F    call        TWinControl.GetHandle
 00098834    push        eax
 00098835    call        user32.PostMessageA
 0009883A    pop         ebx
 0009883B    ret
 0009883C    push        0
 0009883E    movzx       eax,bx
 00098841    push        eax
 00098842    push        100
 00098847    mov         eax,[000B5784];^gvar_000B70A4:TFormMain
 0009884C    mov         eax,dword ptr [eax]
 0009884E    mov         eax,dword ptr [eax+314]
 00098854    call        TWinControl.GetHandle
 00098859    push        eax
 0009885A    call        user32.PostMessageA
 0009885F    pop         ebx
 00098860    ret
end;*}

//00098864
procedure sub_00098864;
begin
{*
 00098864    xor         eax,eax
 00098866    mov         [000B6BAC],eax;gvar_000B6BAC:Single
 0009886B    mov         al,1
 0009886D    call        00099D98
 00098872    xor         ecx,ecx
 00098874    mov         dl,1
 00098876    mov         eax,1
 0009887B    call        000998B0
 00098880    mov         eax,[000B5784];^gvar_000B70A4:TFormMain
 00098885    mov         eax,dword ptr [eax]
 00098887    mov         eax,dword ptr [eax+430]
 0009888D    xor         edx,edx
 0009888F    call        TMenuItem.SetEnabled
 00098894    ret
*}
end;

//00098898
{*function sub_00098898(?:?; ?:Integer):?;
begin
 00098898    push        ebx
 00098899    push        esi
 0009889A    push        edi
 0009889B    mov         edi,edx
 0009889D    mov         esi,eax
 0009889F    xor         ebx,ebx
 000988A1    mov         eax,edi
 000988A3    call        0009820C
 000988A8    test        al,al
>000988AA    je          000988D8
 000988AC    lea         eax,[edi+esi]
 000988AF    mov         edx,dword ptr ds:[0B6B6C];gvar_000B6B6C
 000988B5    lea         edx,[edx+eax-1]
 000988B9    mov         ecx,dword ptr ds:[0B6BAC];gvar_000B6BAC:Single
 000988BF    sub         ecx,esi
 000988C1    inc         ecx
 000988C2    mov         eax,[000B6B6C];gvar_000B6B6C
 000988C7    lea         eax,[eax+esi-1]
 000988CB    call        Move
 000988D0    add         dword ptr ds:[0B6BAC],edi;gvar_000B6BAC:Single
 000988D6    mov         bl,1
 000988D8    mov         eax,ebx
 000988DA    pop         edi
 000988DB    pop         esi
 000988DC    pop         ebx
 000988DD    ret
end;*}

//000988E0
{*function sub_000988E0(?:dword; ?:AnsiString):?;
begin
 000988E0    push        ebp
 000988E1    mov         ebp,esp
 000988E3    add         esp,0FFFFFFEC
 000988E6    push        ebx
 000988E7    push        esi
 000988E8    push        edi
 000988E9    xor         ecx,ecx
 000988EB    mov         dword ptr [ebp-0C],ecx
 000988EE    mov         dword ptr [ebp-8],edx
 000988F1    mov         dword ptr [ebp-4],eax
 000988F4    xor         eax,eax
 000988F6    push        ebp
 000988F7    push        989A3
 000988FC    push        dword ptr fs:[eax]
 000988FF    mov         dword ptr fs:[eax],esp
 00098902    xor         ebx,ebx
 00098904    mov         eax,dword ptr [ebp-8]
 00098907    call        @LStrLen
 0009890C    add         eax,dword ptr [ebp-4]
 0009890F    dec         eax
 00098910    cmp         eax,dword ptr ds:[0B6BAC];gvar_000B6BAC:Single
>00098916    jle         0009892F
 00098918    lea         edx,[ebp-0C]
 0009891B    mov         eax,7EC
 00098920    call        LoadStr;'Can't overwrite beyond end of file'
 00098925    mov         eax,dword ptr [ebp-0C]
 00098928    call        0008D0A8
>0009892D    jmp         0009898D
 0009892F    mov         esi,dword ptr [ebp-4]
 00098932    mov         eax,dword ptr [ebp-8]
 00098935    call        @LStrLen
 0009893A    mov         ebx,eax
 0009893C    test        ebx,ebx
>0009893E    jle         00098958
 00098940    mov         edi,1
 00098945    mov         eax,dword ptr [ebp-8]
 00098948    mov         dl,byte ptr [eax+edi-1]
 0009894C    mov         eax,esi
 0009894E    call        000981B8
 00098953    inc         esi
 00098954    inc         edi
 00098955    dec         ebx
>00098956    jne         00098945
 00098958    mov         eax,dword ptr [ebp-8]
 0009895B    call        @LStrLen
 00098960    add         eax,dword ptr [ebp-4]
 00098963    mov         dword ptr [ebp-14],eax
 00098966    mov         eax,[000B6BAC];gvar_000B6BAC:Single
 0009896B    mov         dword ptr [ebp-10],eax
 0009896E    lea         eax,[ebp-14]
 00098971    mov         edx,1
 00098976    call        00075288
 0009897B    mov         cl,1
 0009897D    mov         dl,1
 0009897F    call        000998B0
 00098984    mov         byte ptr ds:[0B6BA5],1;gvar_000B6BA5
 0009898B    mov         bl,1
 0009898D    xor         eax,eax
 0009898F    pop         edx
 00098990    pop         ecx
 00098991    pop         ecx
 00098992    mov         dword ptr fs:[eax],edx
 00098995    push        989AA
 0009899A    lea         eax,[ebp-0C]
 0009899D    call        @LStrClr
 000989A2    ret
>000989A3    jmp         @HandleFinally
>000989A8    jmp         0009899A
 000989AA    mov         eax,ebx
 000989AC    pop         edi
 000989AD    pop         esi
 000989AE    pop         ebx
 000989AF    mov         esp,ebp
 000989B1    pop         ebp
 000989B2    ret
end;*}

//000989B4
{*procedure sub_000989B4(?:?);
begin
 000989B4    push        ebp
 000989B5    mov         ebp,esp
 000989B7    push        0
 000989B9    push        ebx
 000989BA    push        esi
 000989BB    push        edi
 000989BC    mov         ebx,eax
 000989BE    xor         eax,eax
 000989C0    push        ebp
 000989C1    push        98A64
 000989C6    push        dword ptr fs:[eax]
 000989C9    mov         dword ptr fs:[eax],esp
 000989CC    mov         eax,1
 000989D1    call        0009820C
 000989D6    test        al,al
>000989D8    jne         000989F1
 000989DA    lea         edx,[ebp-4]
 000989DD    mov         eax,7D4
 000989E2    call        LoadStr;'Can't allocate additional memory
to perform operation'
 000989E7    mov         eax,dword ptr [ebp-4]
 000989EA    call        0008D0A8
>000989EF    jmp         00098A4E
 000989F1    lea         edx,[ebp-4]
 000989F4    mov         eax,7EE
 000989F9    call        LoadStr;'Insert...'
 000989FE    mov         eax,dword ptr [ebp-4]
 00098A01    call        000986CC
 00098A06    mov         edi,dword ptr ds:[0B6BAC];gvar_000B6BAC:Single
 00098A0C    call        000981C4
 00098A11    mov         esi,eax
 00098A13    sub         esi,edi
>00098A15    jg          00098A2D
 00098A17    dec         esi
 00098A18    mov         eax,edi
 00098A1A    call        000981AC
 00098A1F    mov         edx,eax
 00098A21    lea         eax,[edi+1]
 00098A24    call        000981B8
 00098A29    dec         edi
 00098A2A    inc         esi
>00098A2B    jne         00098A18
 00098A2D    inc         dword ptr ds:[0B6BAC];gvar_000B6BAC:Single
 00098A33    call        000981C4
 00098A38    mov         edx,ebx
 00098A3A    call        000981B8
 00098A3F    call        0009958C
 00098A44    mov         [000B6B88],eax;gvar_000B6B88
 00098A49    call        000986F4
 00098A4E    xor         eax,eax
 00098A50    pop         edx
 00098A51    pop         ecx
 00098A52    pop         ecx
 00098A53    mov         dword ptr fs:[eax],edx
 00098A56    push        98A6B
 00098A5B    lea         eax,[ebp-4]
 00098A5E    call        @LStrClr
 00098A63    ret
>00098A64    jmp         @HandleFinally
>00098A69    jmp         00098A5B
 00098A6B    pop         edi
 00098A6C    pop         esi
 00098A6D    pop         ebx
 00098A6E    pop         ecx
 00098A6F    pop         ebp
 00098A70    ret
end;*}

//00098A74
{*function sub_00098A74(?:dword; ?:?; ?:AnsiString):?;
begin
 00098A74    push        ebp
 00098A75    mov         ebp,esp
 00098A77    add         esp,0FFFFFFE4
 00098A7A    push        ebx
 00098A7B    push        esi
 00098A7C    push        edi
 00098A7D    xor         ebx,ebx
 00098A7F    mov         dword ptr [ebp-14],ebx
 00098A82    mov         dword ptr [ebp-0C],ecx
 00098A85    mov         dword ptr [ebp-8],edx
 00098A88    mov         dword ptr [ebp-4],eax
 00098A8B    xor         eax,eax
 00098A8D    push        ebp
 00098A8E    push        98B52
 00098A93    push        dword ptr fs:[eax]
 00098A96    mov         dword ptr fs:[eax],esp
 00098A99    xor         ebx,ebx
 00098A9B    mov         eax,dword ptr [ebp-0C]
 00098A9E    call        @LStrLen
 00098AA3    mov         edx,eax
 00098AA5    imul        edx,dword ptr [ebp-8]
 00098AA9    mov         eax,dword ptr [ebp-4]
 00098AAC    call        00098898
 00098AB1    test        al,al
>00098AB3    jne         00098ACC
 00098AB5    lea         edx,[ebp-14]
 00098AB8    mov         eax,7D4
 00098ABD    call        LoadStr;'Can't allocate additional memory
to perform operation'
 00098AC2    mov         eax,dword ptr [ebp-14]
 00098AC5    call        0008D0A8
>00098ACA    jmp         00098B3C
 00098ACC    mov         esi,dword ptr [ebp-4]
 00098ACF    mov         eax,dword ptr [ebp-8]
 00098AD2    test        eax,eax
>00098AD4    jle         00098B04
 00098AD6    mov         dword ptr [ebp-10],eax
 00098AD9    mov         eax,dword ptr [ebp-0C]
 00098ADC    call        @LStrLen
 00098AE1    mov         ebx,eax
 00098AE3    test        ebx,ebx
>00098AE5    jle         00098AFF
 00098AE7    mov         edi,1
 00098AEC    mov         eax,dword ptr [ebp-0C]
 00098AEF    mov         dl,byte ptr [eax+edi-1]
 00098AF3    mov         eax,esi
 00098AF5    call        000981B8
 00098AFA    inc         esi
 00098AFB    inc         edi
 00098AFC    dec         ebx
>00098AFD    jne         00098AEC
 00098AFF    dec         dword ptr [ebp-10]
>00098B02    jne         00098AD9
 00098B04    mov         eax,dword ptr [ebp-0C]
 00098B07    call        @LStrLen
 00098B0C    imul        dword ptr [ebp-8]
 00098B0F    add         eax,dword ptr [ebp-4]
 00098B12    mov         dword ptr [ebp-1C],eax
 00098B15    mov         eax,[000B6BAC];gvar_000B6BAC:Single
 00098B1A    mov         dword ptr [ebp-18],eax
 00098B1D    lea         eax,[ebp-1C]
 00098B20    mov         edx,1
 00098B25    call        00075288
 00098B2A    mov         cl,1
 00098B2C    mov         dl,1
 00098B2E    call        000998B0
 00098B33    mov         byte ptr ds:[0B6BA5],1;gvar_000B6BA5
 00098B3A    mov         bl,1
 00098B3C    xor         eax,eax
 00098B3E    pop         edx
 00098B3F    pop         ecx
 00098B40    pop         ecx
 00098B41    mov         dword ptr fs:[eax],edx
 00098B44    push        98B59
 00098B49    lea         eax,[ebp-14]
 00098B4C    call        @LStrClr
 00098B51    ret
>00098B52    jmp         @HandleFinally
>00098B57    jmp         00098B49
 00098B59    mov         eax,ebx
 00098B5B    pop         edi
 00098B5C    pop         esi
 00098B5D    pop         ebx
 00098B5E    mov         esp,ebp
 00098B60    pop         ebp
 00098B61    ret
end;*}

//00098B64
{*function sub_00098B64(?:?; ?:?; ?:?):?;
begin
 00098B64    push        ebx
 00098B65    push        esi
 00098B66    push        edi
 00098B67    push        ebp
 00098B68    mov         edi,ecx
 00098B6A    mov         ebx,edx
 00098B6C    mov         ebp,eax
 00098B6E    mov         eax,edi
 00098B70    call        @LStrClr
 00098B75    xor         eax,eax
 00098B77    lea         edx,[ebx+ebp]
 00098B7A    dec         edx
 00098B7B    cmp         edx,dword ptr ds:[0B6BAC];gvar_000B6BAC:Single
>00098B81    jg          00098BB3
 00098B83    mov         eax,edi
 00098B85    mov         edx,ebx
 00098B87    call        @LStrSetLength
 00098B8C    mov         esi,ebx
 00098B8E    test        esi,esi
>00098B90    jle         00098BB1
 00098B92    mov         ebx,1
 00098B97    lea         eax,[ebx+ebp]
 00098B9A    dec         eax
 00098B9B    call        000981AC
 00098BA0    push        eax
 00098BA1    mov         eax,edi
 00098BA3    call        UniqueString
 00098BA8    pop         edx
 00098BA9    mov         byte ptr [eax+ebx-1],dl
 00098BAD    inc         ebx
 00098BAE    dec         esi
>00098BAF    jne         00098B97
 00098BB1    mov         al,1
 00098BB3    pop         ebp
 00098BB4    pop         edi
 00098BB5    pop         esi
 00098BB6    pop         ebx
 00098BB7    ret
end;*}

//00098BB8
{*function sub_00098BB8(?:dword; ?:AnsiString; ?:?; ?:?):?;
begin
 00098BB8    push        ebp
 00098BB9    mov         ebp,esp
 00098BBB    add         esp,0FFFFFFF4
 00098BBE    push        ebx
 00098BBF    push        esi
 00098BC0    push        edi
 00098BC1    xor         ebx,ebx
 00098BC3    mov         dword ptr [ebp-0C],ebx
 00098BC6    mov         byte ptr [ebp-1],cl
 00098BC9    mov         esi,edx
 00098BCB    mov         edi,eax
 00098BCD    xor         eax,eax
 00098BCF    push        ebp
 00098BD0    push        98C7C
 00098BD5    push        dword ptr fs:[eax]
 00098BD8    mov         dword ptr fs:[eax],esp
 00098BDB    cmp         byte ptr [ebp+8],0
>00098BDF    je          00098BFA
 00098BE1    mov         dword ptr [ebp-8],3
 00098BE8    mov         eax,esi
 00098BEA    call        @LStrLen
 00098BEF    inc         eax
 00098BF0    mov         ecx,3
 00098BF5    cdq
 00098BF6    idiv        eax,ecx
>00098BF8    jmp         00098C0F
 00098BFA    mov         dword ptr [ebp-8],2
 00098C01    mov         eax,esi
 00098C03    call        @LStrLen
 00098C08    sar         eax,1
>00098C0A    jns         00098C0F
 00098C0C    adc         eax,0
 00098C0F    mov         byte ptr [ebp-2],0
 00098C13    add         eax,edi
 00098C15    dec         eax
 00098C16    cmp         eax,dword ptr ds:[0B6BAC];gvar_000B6BAC:Single
>00098C1C    jg          00098C66
 00098C1E    mov         ebx,1
>00098C23    jmp         00098C57
 00098C25    mov         al,byte ptr [esi+ebx-1]
 00098C29    cmp         al,byte ptr [ebp-1]
>00098C2C    je          00098C53
 00098C2E    mov         eax,edi
 00098C30    call        000981AC
 00098C35    lea         edx,[ebp-0C]
 00098C38    call        00074C9C
 00098C3D    mov         eax,dword ptr [ebp-0C]
 00098C40    mov         al,byte ptr [eax]
 00098C42    cmp         al,byte ptr [esi+ebx-1]
>00098C46    jne         00098C66
 00098C48    mov         eax,dword ptr [ebp-0C]
 00098C4B    mov         al,byte ptr [eax+1]
 00098C4E    cmp         al,byte ptr [esi+ebx]
>00098C51    jne         00098C66
 00098C53    add         ebx,dword ptr [ebp-8]
 00098C56    inc         edi
 00098C57    mov         eax,esi
 00098C59    call        @LStrLen
 00098C5E    cmp         ebx,eax
>00098C60    jl          00098C25
 00098C62    mov         byte ptr [ebp-2],1
 00098C66    xor         eax,eax
 00098C68    pop         edx
 00098C69    pop         ecx
 00098C6A    pop         ecx
 00098C6B    mov         dword ptr fs:[eax],edx
 00098C6E    push        98C83
 00098C73    lea         eax,[ebp-0C]
 00098C76    call        @LStrClr
 00098C7B    ret
>00098C7C    jmp         @HandleFinally
>00098C81    jmp         00098C73
 00098C83    mov         al,byte ptr [ebp-2]
 00098C86    pop         edi
 00098C87    pop         esi
 00098C88    pop         ebx
 00098C89    mov         esp,ebp
 00098C8B    pop         ebp
 00098C8C    ret         4
end;*}

//00098C90
{*procedure sub_00098C90(?:?);
begin
 00098C90    push        ebp
 00098C91    mov         ebp,esp
 00098C93    add         esp,0FFFFFFF8
 00098C96    push        ebx
 00098C97    push        esi
 00098C98    push        edi
 00098C99    mov         eax,dword ptr [ebp+8]
 00098C9C    mov         eax,dword ptr [eax-4]
 00098C9F    mov         edx,dword ptr [ebp+8]
 00098CA2    sub         eax,dword ptr [edx-8]
 00098CA5    mov         dword ptr [ebp-8],eax
 00098CA8    mov         dword ptr [ebp-4],20000
 00098CAF    lea         eax,[ebp-8]
 00098CB2    mov         edx,1
 00098CB7    call        00075288
 00098CBC    mov         edx,dword ptr [ebp+8]
 00098CBF    mov         dword ptr [edx-0C],eax
 00098CC2    mov         eax,dword ptr [ebp+8]
 00098CC5    xor         edx,edx
 00098CC7    mov         dword ptr [eax-10],edx
 00098CCA    mov         eax,dword ptr [ebp+8]
 00098CCD    cmp         dword ptr [eax-0C],0
>00098CD1    jle         00098D61
 00098CD7    xor         edx,edx
 00098CD9    push        ebp
 00098CDA    push        98D2E
 00098CDF    push        dword ptr fs:[edx]
 00098CE2    mov         dword ptr fs:[edx],esp
 00098CE5    mov         eax,dword ptr [ebp+8]
 00098CE8    mov         eax,dword ptr [eax-18]
 00098CEB    mov         edx,dword ptr ds:[0B6B6C];gvar_000B6B6C
 00098CF1    lea         edx,[edx+eax-1]
 00098CF5    mov         eax,dword ptr [ebp+8]
 00098CF8    mov         ecx,dword ptr [eax-0C]
 00098CFB    mov         eax,dword ptr [ebp+8]
 00098CFE    mov         eax,dword ptr [eax-14]
 00098D01    call        FileRead
 00098D06    mov         edx,dword ptr [ebp+8]
 00098D09    mov         dword ptr [edx-10],eax
 00098D0C    mov         eax,dword ptr [ebp+8]
 00098D0F    mov         eax,dword ptr [eax-10]
 00098D12    mov         edx,dword ptr [ebp+8]
 00098D15    cmp         eax,dword ptr [edx-0C]
>00098D18    je          00098D24
 00098D1A    mov         eax,dword ptr [ebp+8]
 00098D1D    mov         dword ptr [eax-1C],7D5
 00098D24    xor         eax,eax
 00098D26    pop         edx
 00098D27    pop         ecx
 00098D28    pop         ecx
 00098D29    mov         dword ptr fs:[eax],edx
>00098D2C    jmp         00098D61
>00098D2E    jmp         @HandleOnException
 00098D33    dd          2
 00098D37    dd          0001785C;EInOutError
 00098D3B    dd          00098D47
 00098D3F    dd          00000000
 00098D43    dd          00098D52
 00098D47    mov         eax,dword ptr [eax+0C];EInOutError........ErrorCode:Integer
 00098D4A    mov         edx,dword ptr [ebp+8]
 00098D4D    mov         dword ptr [edx-1C],eax
>00098D50    jmp         00098D5C
 00098D52    mov         eax,dword ptr [ebp+8]
 00098D55    mov         dword ptr [eax-1C],7D5
 00098D5C    call        @DoneExcept
 00098D61    mov         eax,dword ptr [ebp+8]
 00098D64    mov         eax,dword ptr [eax-10]
 00098D67    mov         edx,dword ptr [ebp+8]
 00098D6A    add         dword ptr [edx-8],eax
 00098D6D    mov         eax,dword ptr [ebp+8]
 00098D70    mov         eax,dword ptr [eax-10]
 00098D73    mov         edx,dword ptr [ebp+8]
 00098D76    add         dword ptr [edx-18],eax
 00098D79    push        5
 00098D7B    mov         eax,dword ptr [ebp+8]
 00098D7E    mov         ecx,dword ptr [eax-4]
 00098D81    mov         eax,dword ptr [ebp+8]
 00098D84    mov         edx,dword ptr [eax-8]
 00098D87    mov         eax,[000B6D00];gvar_000B6D00:TProgressBox
 00098D8C    call        0008E1A4
 00098D91    mov         eax,[000B6D00];gvar_000B6D00:TProgressBox
 00098D96    cmp         byte ptr [eax+2DC],0
>00098D9D    je          00098DA9
 00098D9F    mov         eax,dword ptr [ebp+8]
 00098DA2    mov         dword ptr [eax-1C],7DB
 00098DA9    mov         eax,dword ptr [ebp+8]
 00098DAC    mov         eax,dword ptr [eax-8]
 00098DAF    mov         edx,dword ptr [ebp+8]
 00098DB2    cmp         eax,dword ptr [edx-4]
>00098DB5    je          00098DC4
 00098DB7    mov         eax,dword ptr [ebp+8]
 00098DBA    cmp         dword ptr [eax-1C],0
>00098DBE    jle         00098C99
 00098DC4    pop         edi
 00098DC5    pop         esi
 00098DC6    pop         ebx
 00098DC7    pop         ecx
 00098DC8    pop         ecx
 00098DC9    pop         ebp
 00098DCA    ret
end;*}

//00098DCC
{*function sub_00098DCC(?:?; ?:?; ?:?):?;
begin
 00098DCC    push        ebp
 00098DCD    mov         ebp,esp
 00098DCF    add         esp,0FFFFFFC8
 00098DD2    push        ebx
 00098DD3    push        esi
 00098DD4    push        edi
 00098DD5    xor         ebx,ebx
 00098DD7    mov         dword ptr [ebp-28],ebx
 00098DDA    mov         dword ptr [ebp-2C],ebx
 00098DDD    mov         dword ptr [ebp-38],ebx
 00098DE0    mov         dword ptr [ebp-18],ecx
 00098DE3    mov         byte ptr [ebp-21],dl
 00098DE6    mov         dword ptr [ebp-20],eax
 00098DE9    xor         eax,eax
 00098DEB    push        ebp
 00098DEC    push        99073
 00098DF1    push        dword ptr fs:[eax]
 00098DF4    mov         dword ptr fs:[eax],esp
 00098DF7    xor         eax,eax
 00098DF9    mov         dword ptr [ebp-1C],eax
 00098DFC    mov         eax,dword ptr [ebp-20]
 00098DFF    call        00079CC0
 00098E04    mov         dword ptr [ebp-4],eax
 00098E07    mov         al,byte ptr [ebp-21]
 00098E0A    or          al,byte ptr ds:[0B7008];gvar_000B7008
>00098E10    je          00098E19
 00098E12    mov         esi,40
>00098E17    jmp         00098E1E
 00098E19    mov         esi,20
 00098E1E    mov         bl,byte ptr [ebp-21]
 00098E21    xor         bl,1
 00098E24    test        bl,bl
>00098E26    je          00098E45
 00098E28    mov         eax,dword ptr [ebp-4]
 00098E2B    call        000981DC
 00098E30    call        00098350
 00098E35    test        al,al
>00098E37    jne         00098E45
 00098E39    mov         dword ptr [ebp-1C],7D4
>00098E40    jmp         00098FA6
 00098E45    test        bl,bl
>00098E47    je          00098E50
 00098E49    mov         dword ptr [ebp-18],1
 00098E50    xor         edx,edx
 00098E52    push        ebp
 00098E53    push        98E98
 00098E58    push        dword ptr fs:[edx]
 00098E5B    mov         dword ptr fs:[edx],esp
 00098E5E    mov         edx,esi
 00098E60    mov         eax,dword ptr [ebp-20]
 00098E63    call        FileOpen
 00098E68    mov         dword ptr [ebp-14],eax
 00098E6B    cmp         dword ptr [ebp-14],0
>00098E6F    jg          00098E7B
 00098E71    call        kernel32.GetLastError
 00098E76    mov         dword ptr [ebp-1C],eax
>00098E79    jmp         00098E8E
 00098E7B    test        bl,bl
>00098E7D    je          00098E8E
 00098E7F    mov         eax,dword ptr [ebp-20]
 00098E82    call        00090D20
 00098E87    fstp        qword ptr ds:[0B6BDC];gvar_000B6BDC:Double
 00098E8D    wait
 00098E8E    xor         eax,eax
 00098E90    pop         edx
 00098E91    pop         ecx
 00098E92    pop         ecx
 00098E93    mov         dword ptr fs:[eax],edx
>00098E96    jmp         00098EC5
>00098E98    jmp         @HandleOnException
 00098E9D    dd          2
 00098EA1    dd          0001785C;EInOutError
 00098EA5    dd          00098EB1
 00098EA9    dd          00000000
 00098EAD    dd          00098EB9
 00098EB1    mov         eax,dword ptr [eax+0C];EInOutError.........ErrorCode:Integer
 00098EB4    mov         dword ptr [ebp-1C],eax
>00098EB7    jmp         00098EC0
 00098EB9    mov         dword ptr [ebp-1C],7D3
 00098EC0    call        @DoneExcept
 00098EC5    cmp         dword ptr [ebp-1C],0
>00098EC9    jne         00098F55
 00098ECF    xor         eax,eax
 00098ED1    mov         dword ptr [ebp-8],eax
 00098ED4    lea         edx,[ebp-28]
 00098ED7    mov         eax,7E4
 00098EDC    call        LoadStr;'Reading file'
 00098EE1    mov         eax,dword ptr [ebp-28]
 00098EE4    push        eax
 00098EE5    lea         edx,[ebp-2C]
 00098EE8    mov         eax,dword ptr [ebp-20]
 00098EEB    call        ExtractFileName
 00098EF0    mov         eax,dword ptr [ebp-2C]
 00098EF3    push        eax
 00098EF4    push        1
 00098EF6    push        1
 00098EF8    call        00088008
 00098EFD    mov         ecx,eax
 00098EFF    mov         dl,1
 00098F01    mov         eax,[0008C62C];TProgressBox
 00098F06    call        TProgressBox.Create;TProgressBox.Create
 00098F0B    mov         [000B6D00],eax;gvar_000B6D00:TProgressBox
 00098F10    xor         eax,eax
 00098F12    push        ebp
 00098F13    push        98F4E
 00098F18    push        dword ptr fs:[eax]
 00098F1B    mov         dword ptr fs:[eax],esp
 00098F1E    mov         eax,[000B6D00];gvar_000B6D00:TProgressBox
 00098F23    call        TCustomForm.Show
 00098F28    push        ebp
 00098F29    call        00098C90
 00098F2E    pop         ecx
 00098F2F    xor         eax,eax
 00098F31    pop         edx
 00098F32    pop         ecx
 00098F33    pop         ecx
 00098F34    mov         dword ptr fs:[eax],edx
 00098F37    push        98F55
 00098F3C    mov         eax,[000B6D00];gvar_000B6D00:TProgressBox
 00098F41    call        TObject.Free
 00098F46    xor         eax,eax
 00098F48    mov         [000B6D00],eax;gvar_000B6D00:TProgressBox
 00098F4D    ret
>00098F4E    jmp         @HandleFinally
>00098F53    jmp         00098F3C
 00098F55    xor         edx,edx
 00098F57    push        ebp
 00098F58    push        98F75
 00098F5D    push        dword ptr fs:[edx]
 00098F60    mov         dword ptr fs:[edx],esp
 00098F63    mov         eax,dword ptr [ebp-14]
 00098F66    call        FileClose
 00098F6B    xor         eax,eax
 00098F6D    pop         edx
 00098F6E    pop         ecx
 00098F6F    pop         ecx
 00098F70    mov         dword ptr fs:[eax],edx
>00098F73    jmp         00098FA6
>00098F75    jmp         @HandleOnException
 00098F7A    dd          1
 00098F7E    dd          0001785C;EInOutError
 00098F82    dd          00098F86
 00098F86    cmp         dword ptr [ebp-1C],0
>00098F8A    jne         00098F94
 00098F8C    mov         eax,dword ptr [eax+0C];EInOutError..........ErrorCode:Integer
 00098F8F    mov         dword ptr [ebp-1C],eax
>00098F92    jmp         00098FA1
 00098F94    cmp         dword ptr [ebp-1C],0
>00098F98    jne         00098FA1
 00098F9A    mov         dword ptr [ebp-1C],7D6
 00098FA1    call        @DoneExcept
 00098FA6    cmp         dword ptr [ebp-1C],0
>00098FAA    jle         0009903C
 00098FB0    cmp         dword ptr [ebp-1C],0FA
>00098FB7    jge         0009900E
 00098FB9    lea         eax,[ebp-2C]
 00098FBC    push        eax
 00098FBD    lea         edx,[ebp-38]
 00098FC0    mov         eax,dword ptr [ebp-20]
 00098FC3    call        ExtractFileName
 00098FC8    mov         eax,dword ptr [ebp-38]
 00098FCB    mov         dword ptr [ebp-34],eax
 00098FCE    mov         byte ptr [ebp-30],0B
 00098FD2    lea         edx,[ebp-34]
 00098FD5    xor         ecx,ecx
 00098FD7    mov         eax,7D5
 00098FDC    call        FmtLoadStr;'Error reading
%s'
 00098FE1    push        dword ptr [ebp-2C]
 00098FE4    push        9908C;#13+#10
 00098FE9    lea         edx,[ebp-38]
 00098FEC    mov         eax,dword ptr [ebp-1C]
 00098FEF    call        0008E4DC
 00098FF4    push        dword ptr [ebp-38]
 00098FF7    lea         eax,[ebp-28]
 00098FFA    mov         edx,3
 00098FFF    call        @LStrCatN
 00099004    mov         eax,dword ptr [ebp-28]
 00099007    call        0008D0A8
>0009900C    jmp         0009903C
 0009900E    lea         eax,[ebp-28]
 00099011    push        eax
 00099012    lea         edx,[ebp-2C]
 00099015    mov         eax,dword ptr [ebp-20]
 00099018    call        ExtractFileName
 0009901D    mov         eax,dword ptr [ebp-2C]
 00099020    mov         dword ptr [ebp-34],eax
 00099023    mov         byte ptr [ebp-30],0B
 00099027    lea         edx,[ebp-34]
 0009902A    xor         ecx,ecx
 0009902C    mov         eax,dword ptr [ebp-1C]
 0009902F    call        FmtLoadStr;'Floating point division by zero'
 00099034    mov         eax,dword ptr [ebp-28]
 00099037    call        0008D0A8
 0009903C    cmp         dword ptr [ebp-1C],0
>00099040    jne         00099050
 00099042    cmp         byte ptr [ebp-21],0
>00099046    jne         00099050
 00099048    mov         eax,dword ptr [ebp-8]
 0009904B    mov         [000B6BAC],eax;gvar_000B6BAC:Single
 00099050    xor         eax,eax
 00099052    pop         edx
 00099053    pop         ecx
 00099054    pop         ecx
 00099055    mov         dword ptr fs:[eax],edx
 00099058    push        9907A
 0009905D    lea         eax,[ebp-38]
 00099060    call        @LStrClr
 00099065    lea         eax,[ebp-2C]
 00099068    mov         edx,2
 0009906D    call        @LStrArrayClr
 00099072    ret
>00099073    jmp         @HandleFinally
>00099078    jmp         0009905D
 0009907A    mov         eax,dword ptr [ebp-1C]
 0009907D    pop         edi
 0009907E    pop         esi
 0009907F    pop         ebx
 00099080    mov         esp,ebp
 00099082    pop         ebp
 00099083    ret
end;*}

//00099090
{*procedure sub_00099090(?:?);
begin
 00099090    push        ebp
 00099091    mov         ebp,esp
 00099093    add         esp,0FFFFFFF8
 00099096    push        ebx
 00099097    push        esi
 00099098    push        edi
 00099099    mov         eax,dword ptr [ebp+8]
 0009909C    mov         eax,dword ptr [eax+8]
 0009909F    mov         edx,dword ptr [ebp+8]
 000990A2    sub         eax,dword ptr [edx-8]
 000990A5    mov         dword ptr [ebp-8],eax
 000990A8    mov         dword ptr [ebp-4],20000
 000990AF    lea         eax,[ebp-8]
 000990B2    mov         edx,1
 000990B7    call        00075288
 000990BC    mov         edx,dword ptr [ebp+8]
 000990BF    mov         dword ptr [edx-0C],eax
 000990C2    mov         eax,dword ptr [ebp+8]
 000990C5    cmp         dword ptr [eax-0C],0
>000990C9    jle         000991A0
 000990CF    xor         edx,edx
 000990D1    push        ebp
 000990D2    push        99119
 000990D7    push        dword ptr fs:[edx]
 000990DA    mov         dword ptr fs:[edx],esp
 000990DD    mov         eax,dword ptr [ebp+8]
 000990E0    add         eax,0FFFFFFFC
 000990E3    push        eax
 000990E4    mov         eax,dword ptr [ebp+8]
 000990E7    mov         eax,dword ptr [eax-15C]
 000990ED    mov         edx,dword ptr ds:[0B6B6C];gvar_000B6B6C
 000990F3    lea         edx,[edx+eax-1]
 000990F7    mov         eax,dword ptr [ebp+8]
 000990FA    mov         ecx,dword ptr [eax-0C]
 000990FD    mov         eax,dword ptr [ebp+8]
 00099100    add         eax,0FFFFFEA8
 00099105    call        @BlockWrite
 0009910A    call        @_IOTest
 0009910F    xor         eax,eax
 00099111    pop         edx
 00099112    pop         ecx
 00099113    pop         ecx
 00099114    mov         dword ptr fs:[eax],edx
>00099117    jmp         00099152
>00099119    jmp         @HandleOnException
 0009911E    dd          2
 00099122    dd          0001785C;EInOutError
 00099126    dd          00099132
 0009912A    dd          00000000
 0009912E    dd          00099140
 00099132    mov         eax,dword ptr [eax+0C];EInOutError...........ErrorCode:Integer
 00099135    mov         edx,dword ptr [ebp+8]
 00099138    mov         dword ptr [edx-160],eax
>0009913E    jmp         0009914D
 00099140    mov         eax,dword ptr [ebp+8]
 00099143    mov         dword ptr [eax-160],7D7
 0009914D    call        @DoneExcept
 00099152    mov         eax,dword ptr [ebp+8]
 00099155    mov         eax,dword ptr [eax-4]
 00099158    mov         edx,dword ptr [ebp+8]
 0009915B    add         dword ptr [edx-8],eax
 0009915E    mov         eax,dword ptr [ebp+8]
 00099161    mov         eax,dword ptr [eax-4]
 00099164    mov         edx,dword ptr [ebp+8]
 00099167    add         dword ptr [edx-15C],eax
 0009916D    push        5
 0009916F    mov         eax,dword ptr [ebp+8]
 00099172    mov         ecx,dword ptr [eax+8]
 00099175    mov         eax,dword ptr [ebp+8]
 00099178    mov         edx,dword ptr [eax-8]
 0009917B    mov         eax,[000B6D00];gvar_000B6D00:TProgressBox
 00099180    call        0008E1A4
 00099185    mov         eax,[000B6D00];gvar_000B6D00:TProgressBox
 0009918A    cmp         byte ptr [eax+2DC],0
>00099191    je          000991A0
 00099193    mov         eax,dword ptr [ebp+8]
 00099196    mov         dword ptr [eax-160],80A
 000991A0    mov         eax,dword ptr [ebp+8]
 000991A3    mov         eax,dword ptr [eax-8]
 000991A6    mov         edx,dword ptr [ebp+8]
 000991A9    cmp         eax,dword ptr [edx+8]
>000991AC    je          000991BE
 000991AE    mov         eax,dword ptr [ebp+8]
 000991B1    cmp         dword ptr [eax-160],0
>000991B8    jle         00099099
 000991BE    pop         edi
 000991BF    pop         esi
 000991C0    pop         ebx
 000991C1    pop         ecx
 000991C2    pop         ecx
 000991C3    pop         ebp
 000991C4    ret
end;*}

//000991C8
{*function sub_000991C8(?:?; ?:?; ?:?; ?:?):?;
begin
 000991C8    push        ebp
 000991C9    mov         ebp,esp
 000991CB    add         esp,0FFFFFE84
 000991D1    push        ebx
 000991D2    push        esi
 000991D3    push        edi
 000991D4    xor         ebx,ebx
 000991D6    mov         dword ptr [ebp-16C],ebx
 000991DC    mov         dword ptr [ebp-170],ebx
 000991E2    mov         dword ptr [ebp-17C],ebx
 000991E8    mov         dword ptr [ebp-15C],ecx
 000991EE    mov         byte ptr [ebp-165],dl
 000991F4    mov         dword ptr [ebp-164],eax
 000991FA    xor         eax,eax
 000991FC    push        ebp
 000991FD    push        994F5
 00099202    push        dword ptr fs:[eax]
 00099205    mov         dword ptr fs:[eax],esp
 00099208    mov         eax,[000B5AC8];^gvar_000B604A
 0009920D    mov         byte ptr [eax],1
 00099210    xor         eax,eax
 00099212    mov         dword ptr [ebp-160],eax
 00099218    xor         edx,edx
 0009921A    push        ebp
 0009921B    push        99256
 00099220    push        dword ptr fs:[edx]
 00099223    mov         dword ptr fs:[edx],esp
 00099226    mov         edx,dword ptr [ebp-164]
 0009922C    lea         eax,[ebp-158]
 00099232    call        @Assign
 00099237    mov         edx,1
 0009923C    lea         eax,[ebp-158]
 00099242    call        @RewritFile
 00099247    call        @_IOTest
 0009924C    xor         eax,eax
 0009924E    pop         edx
 0009924F    pop         ecx
 00099250    pop         ecx
 00099251    mov         dword ptr fs:[eax],edx
>00099254    jmp         00099289
>00099256    jmp         @HandleOnException
 0009925B    dd          2
 0009925F    dd          0001785C;EInOutError
 00099263    dd          0009926F
 00099267    dd          00000000
 0009926B    dd          0009927A
 0009926F    mov         eax,dword ptr [eax+0C];EInOutError............ErrorCode:Integer
 00099272    mov         dword ptr [ebp-160],eax
>00099278    jmp         00099284
 0009927A    mov         dword ptr [ebp-160],7D3
 00099284    call        @DoneExcept
 00099289    cmp         dword ptr [ebp-160],0
>00099290    jne         00099346
 00099296    cmp         byte ptr [ebp-165],0
>0009929D    jne         000992B1
 0009929F    mov         dword ptr [ebp-15C],1
 000992A9    mov         eax,[000B6BAC];gvar_000B6BAC:Single
 000992AE    mov         dword ptr [ebp+8],eax
 000992B1    xor         eax,eax
 000992B3    mov         dword ptr [ebp-8],eax
 000992B6    lea         edx,[ebp-16C]
 000992BC    mov         eax,809
 000992C1    call        LoadStr;'Writing file'
 000992C6    mov         eax,dword ptr [ebp-16C]
 000992CC    push        eax
 000992CD    lea         edx,[ebp-170]
 000992D3    mov         eax,dword ptr [ebp-164]
 000992D9    call        ExtractFileName
 000992DE    mov         eax,dword ptr [ebp-170]
 000992E4    push        eax
 000992E5    push        1
 000992E7    push        1
 000992E9    call        00088008
 000992EE    mov         ecx,eax
 000992F0    mov         dl,1
 000992F2    mov         eax,[0008C62C];TProgressBox
 000992F7    call        TProgressBox.Create;TProgressBox.Create
 000992FC    mov         [000B6D00],eax;gvar_000B6D00:TProgressBox
 00099301    xor         eax,eax
 00099303    push        ebp
 00099304    push        9933F
 00099309    push        dword ptr fs:[eax]
 0009930C    mov         dword ptr fs:[eax],esp
 0009930F    mov         eax,[000B6D00];gvar_000B6D00:TProgressBox
 00099314    call        TCustomForm.Show
 00099319    push        ebp
 0009931A    call        00099090
 0009931F    pop         ecx
 00099320    xor         eax,eax
 00099322    pop         edx
 00099323    pop         ecx
 00099324    pop         ecx
 00099325    mov         dword ptr fs:[eax],edx
 00099328    push        99346
 0009932D    mov         eax,[000B6D00];gvar_000B6D00:TProgressBox
 00099332    call        TObject.Free
 00099337    xor         eax,eax
 00099339    mov         [000B6D00],eax;gvar_000B6D00:TProgressBox
 0009933E    ret
>0009933F    jmp         @HandleFinally
>00099344    jmp         0009932D
 00099346    xor         edx,edx
 00099348    push        ebp
 00099349    push        9936E
 0009934E    push        dword ptr fs:[edx]
 00099351    mov         dword ptr fs:[edx],esp
 00099354    lea         eax,[ebp-158]
 0009935A    call        @Close
 0009935F    call        @_IOTest
 00099364    xor         eax,eax
 00099366    pop         edx
 00099367    pop         ecx
 00099368    pop         ecx
 00099369    mov         dword ptr fs:[eax],edx
>0009936C    jmp         000993AB
>0009936E    jmp         @HandleOnException
 00099373    dd          1
 00099377    dd          0001785C;EInOutError
 0009937B    dd          0009937F
 0009937F    cmp         dword ptr [ebp-160],0
>00099386    jne         00099393
 00099388    mov         eax,dword ptr [eax+0C];EInOutError.............ErrorCode:Integer
 0009938B    mov         dword ptr [ebp-160],eax
>00099391    jmp         000993A6
 00099393    cmp         dword ptr [ebp-160],0
>0009939A    jne         000993A6
 0009939C    mov         dword ptr [ebp-160],7D6
 000993A6    call        @DoneExcept
 000993AB    cmp         dword ptr [ebp-160],0
>000993B2    jne         000993F1
 000993B4    cmp         byte ptr [ebp-165],0
>000993BB    jne         000994C2
 000993C1    mov         byte ptr ds:[0B6BA5],0;gvar_000B6BA5
 000993C8    cmp         byte ptr ds:[0B6BDA],0;gvar_000B6BDA:Boolean
>000993CF    je          000994C2
 000993D5    push        dword ptr ds:[0B6BE0]
 000993DB    push        dword ptr ds:[0B6BDC];gvar_000B6BDC:Double
 000993E1    mov         eax,dword ptr [ebp-164]
 000993E7    call        00090D40
>000993EC    jmp         000994C2
 000993F1    cmp         dword ptr [ebp-160],0FA
>000993FB    jge         00099479
 000993FD    lea         eax,[ebp-170]
 00099403    push        eax
 00099404    lea         edx,[ebp-17C]
 0009940A    mov         eax,dword ptr [ebp-164]
 00099410    call        ExtractFileName
 00099415    mov         eax,dword ptr [ebp-17C]
 0009941B    mov         dword ptr [ebp-178],eax
 00099421    mov         byte ptr [ebp-174],0B
 00099428    lea         edx,[ebp-178]
 0009942E    xor         ecx,ecx
 00099430    mov         eax,7D7
 00099435    call        FmtLoadStr;'Error writing
%s'
 0009943A    push        dword ptr [ebp-170]
 00099440    push        99510;#13+#10
 00099445    lea         edx,[ebp-17C]
 0009944B    mov         eax,dword ptr [ebp-160]
 00099451    call        0008E4DC
 00099456    push        dword ptr [ebp-17C]
 0009945C    lea         eax,[ebp-16C]
 00099462    mov         edx,3
 00099467    call        @LStrCatN
 0009946C    mov         eax,dword ptr [ebp-16C]
 00099472    call        0008D0A8
>00099477    jmp         000994C2
 00099479    lea         eax,[ebp-16C]
 0009947F    push        eax
 00099480    lea         edx,[ebp-170]
 00099486    mov         eax,dword ptr [ebp-164]
 0009948C    call        ExtractFileName
 00099491    mov         eax,dword ptr [ebp-170]
 00099497    mov         dword ptr [ebp-178],eax
 0009949D    mov         byte ptr [ebp-174],0B
 000994A4    lea         edx,[ebp-178]
 000994AA    xor         ecx,ecx
 000994AC    mov         eax,dword ptr [ebp-160]
 000994B2    call        FmtLoadStr
 000994B7    mov         eax,dword ptr [ebp-16C]
 000994BD    call        0008D0A8
 000994C2    cmp         dword ptr [ebp-160],0
 000994C9    sete        bl
 000994CC    xor         eax,eax
 000994CE    pop         edx
 000994CF    pop         ecx
 000994D0    pop         ecx
 000994D1    mov         dword ptr fs:[eax],edx
 000994D4    push        994FC
 000994D9    lea         eax,[ebp-17C]
 000994DF    call        @LStrClr
 000994E4    lea         eax,[ebp-170]
 000994EA    mov         edx,2
 000994EF    call        @LStrArrayClr
 000994F4    ret
>000994F5    jmp         @HandleFinally
>000994FA    jmp         000994D9
 000994FC    mov         eax,ebx
 000994FE    pop         edi
 000994FF    pop         esi
 00099500    pop         ebx
 00099501    mov         esp,ebp
 00099503    pop         ebp
 00099504    ret         4
end;*}

//00099514
{*procedure sub_00099514(?:TMenuItem; ?:?; ?:?);
begin
 00099514    push        ebp
 00099515    mov         ebp,esp
 00099517    push        ecx
 00099518    push        ebx
 00099519    push        esi
 0009951A    push        edi
 0009951B    mov         ebx,edx
 0009951D    test        ebx,ebx
>0009951F    js          00099528
 00099521    mov         esi,dword ptr [eax+ebx*4]
 00099524    dec         ebx
 00099525    push        esi
>00099526    jns         00099521
 00099528    mov         eax,esp
 0009952A    mov         byte ptr [ebp-1],cl
 0009952D    mov         esi,edx
 0009952F    test        esi,esi
>00099531    jl          0009957C
 00099533    inc         esi
 00099534    mov         ebx,eax
 00099536    mov         edi,dword ptr [ebx]
 00099538    cmp         dword ptr [edi+0C],2
>0009953C    je          00099576
 0009953E    mov         eax,edi
 00099540    mov         edx,dword ptr ds:[4FE44];TMenuItem
 00099546    call        @IsClass
 0009954B    test        al,al
>0009954D    je          0009955B
 0009954F    mov         dl,byte ptr [ebp-1]
 00099552    mov         eax,edi
 00099554    call        TMenuItem.SetEnabled
>00099559    jmp         00099576
 0009955B    mov         eax,edi
 0009955D    mov         edx,dword ptr ds:[89F04];TCMBtn
 00099563    call        @IsClass
 00099568    test        al,al
>0009956A    je          00099576
 0009956C    mov         dl,byte ptr [ebp-1]
 0009956F    mov         eax,edi
 00099571    call        TCMBtn.SetEnabled
 00099576    add         ebx,4
 00099579    dec         esi
>0009957A    jne         00099536
 0009957C    mov         edi,dword ptr [ebp-10]
 0009957F    mov         esi,dword ptr [ebp-0C]
 00099582    mov         ebx,dword ptr [ebp-8]
 00099585    mov         esp,ebp
 00099587    pop         ebp
 00099588    ret
end;*}

//0009958C
{*function sub_0009958C:?;
begin
 0009958C    mov         eax,[000B6B84];gvar_000B6B84
 00099591    add         eax,dword ptr ds:[0B6BB0];gvar_000B6BB0:Integer
 00099597    dec         eax
 00099598    cmp         eax,dword ptr ds:[0B6BAC];gvar_000B6BAC:Single
>0009959E    jle         000995A5
 000995A0    mov         eax,[000B6BAC];gvar_000B6BAC:Single
 000995A5    ret
end;*}

//000995A8
{*procedure sub_000995A8(?:?);
begin
 000995A8    push        ebp
 000995A9    mov         ebp,esp
 000995AB    add         esp,0FFFFFFF4
 000995AE    push        ebx
 000995AF    xor         edx,edx
 000995B1    mov         dword ptr [ebp-4],edx
 000995B4    mov         ebx,eax
 000995B6    xor         eax,eax
 000995B8    push        ebp
 000995B9    push        9965F
 000995BE    push        dword ptr fs:[eax]
 000995C1    mov         dword ptr fs:[eax],esp
 000995C4    lea         eax,[ebp-4]
 000995C7    push        eax
 000995C8    mov         eax,[000B5784];^gvar_000B70A4:TFormMain
 000995CD    mov         eax,dword ptr [eax]
 000995CF    mov         eax,dword ptr [eax+314]
 000995D5    mov         ecx,ebx
 000995D7    xor         edx,edx
 000995D9    call        TStringGrid.GetCells
 000995DE    cmp         dword ptr [ebp-4],0
>000995E2    jne         000995FE
 000995E4    push        0
 000995E6    mov         eax,[000B5784];^gvar_000B70A4:TFormMain
 000995EB    mov         eax,dword ptr [eax]
 000995ED    mov         eax,dword ptr [eax+420]
 000995F3    mov         ecx,ebx
 000995F5    xor         edx,edx
 000995F7    call        TStringGrid.SetCells
>000995FC    jmp         00099649
 000995FE    lea         eax,[ebp-4]
 00099601    push        eax
 00099602    mov         eax,[000B55F8];0x1 gvar_000B55F8:Longint
 00099607    add         eax,dword ptr ds:[0B6B84];gvar_000B6B84
 0009960D    mov         edx,ebx
 0009960F    imul        edx,dword ptr ds:[0B6B64];gvar_000B6B64:Longint
 00099616    add         eax,edx
 00099618    dec         eax
 00099619    mov         dword ptr [ebp-0C],eax
 0009961C    mov         byte ptr [ebp-8],0
 00099620    lea         edx,[ebp-0C]
 00099623    xor         ecx,ecx
 00099625    mov         eax,99674;'%8x'
 0009962A    call        Format
 0009962F    mov         eax,dword ptr [ebp-4]
 00099632    push        eax
 00099633    mov         eax,[000B5784];^gvar_000B70A4:TFormMain
 00099638    mov         eax,dword ptr [eax]
 0009963A    mov         eax,dword ptr [eax+420]
 00099640    mov         ecx,ebx
 00099642    xor         edx,edx
 00099644    call        TStringGrid.SetCells
 00099649    xor         eax,eax
 0009964B    pop         edx
 0009964C    pop         ecx
 0009964D    pop         ecx
 0009964E    mov         dword ptr fs:[eax],edx
 00099651    push        99666
 00099656    lea         eax,[ebp-4]
 00099659    call        @LStrClr
 0009965E    ret
>0009965F    jmp         @HandleFinally
>00099664    jmp         00099656
 00099666    pop         ebx
 00099667    mov         esp,ebp
 00099669    pop         ebp
 0009966A    ret
end;*}

//00099678
procedure sub_00099678;
begin
{*
 00099678    push        ebx
 00099679    push        esi
 0009967A    mov         eax,[000B5784];^gvar_000B70A4:TFormMain
 0009967F    mov         eax,dword ptr [eax]
 00099681    mov         eax,dword ptr [eax+314]
 00099687    mov         ebx,dword ptr [eax+22C]
 0009968D    dec         ebx
 0009968E    test        ebx,ebx
>00099690    jl          000996A0
 00099692    inc         ebx
 00099693    xor         esi,esi
 00099695    mov         eax,esi
 00099697    call        000995A8
 0009969C    inc         esi
 0009969D    dec         ebx
>0009969E    jne         00099695
 000996A0    pop         esi
 000996A1    pop         ebx
 000996A2    ret
*}
end;

//000996A4
{*procedure sub_000996A4(?:?; ?:?);
begin
 000996A4    push        ebp
 000996A5    mov         ebp,esp
 000996A7    add         esp,0FFFFFFF8
 000996AA    push        ebx
 000996AB    push        esi
 000996AC    push        edi
 000996AD    xor         ecx,ecx
 000996AF    mov         dword ptr [ebp-8],ecx
 000996B2    mov         byte ptr [ebp-1],dl
 000996B5    mov         ebx,eax
 000996B7    xor         eax,eax
 000996B9    push        ebp
 000996BA    push        99881
 000996BF    push        dword ptr fs:[eax]
 000996C2    mov         dword ptr fs:[eax],esp
 000996C5    cmp         byte ptr ds:[0B6BB4],0;gvar_000B6BB4
>000996CC    je          0009986B
 000996D2    movzx       edi,byte ptr [ebp-1]
 000996D6    mov         esi,dword ptr ds:[0B6B68];gvar_000B6B68:Longint
 000996DC    sub         esi,edi
>000996DE    jl          00099717
 000996E0    inc         esi
 000996E1    mov         eax,[000B5784];^gvar_000B70A4:TFormMain
 000996E6    mov         eax,dword ptr [eax]
 000996E8    mov         eax,dword ptr [eax+310]
 000996EE    mov         edx,edi
 000996F0    call        TStringGrid.GetRows
 000996F5    call        TStrings.BeginUpdate
 000996FA    mov         eax,[000B5784];^gvar_000B70A4:TFormMain
 000996FF    mov         eax,dword ptr [eax]
 00099701    mov         eax,dword ptr [eax+314]
 00099707    mov         edx,edi
 00099709    call        TStringGrid.GetRows
 0009970E    call        TStrings.BeginUpdate
 00099713    inc         edi
 00099714    dec         esi
>00099715    jne         000996E1
 00099717    movzx       edi,byte ptr [ebp-1]
 0009971B    imul        edi,dword ptr ds:[0B6B64];gvar_000B6B64:Longint
 00099722    add         edi,dword ptr ds:[0B6B84];gvar_000B6B84
 00099728    xor         eax,eax
 0009972A    mov         al,bl
 0009972C    add         edi,eax
 0009972E    mov         esi,dword ptr ds:[0B6B84];gvar_000B6B84
 00099734    add         esi,dword ptr ds:[0B6BB0];gvar_000B6BB0:Integer
 0009973A    dec         esi
 0009973B    sub         esi,edi
>0009973D    jl          00099826
 00099743    inc         esi
 00099744    cmp         edi,dword ptr ds:[0B6B88];gvar_000B6B88
>0009974A    jg          000997BF
 0009974C    mov         eax,edi
 0009974E    call        000981AC
 00099753    call        00099A90
 00099758    mov         edx,eax
 0009975A    lea         eax,[ebp-8]
 0009975D    call        @LStrFromChar
 00099762    mov         eax,dword ptr [ebp-8]
 00099765    push        eax
 00099766    xor         ecx,ecx
 00099768    mov         cl,byte ptr [ebp-1]
 0009976B    xor         edx,edx
 0009976D    mov         dl,bl
 0009976F    mov         eax,[000B5784];^gvar_000B70A4:TFormMain
 00099774    mov         eax,dword ptr [eax]
 00099776    mov         eax,dword ptr [eax+310]
 0009977C    call        TStringGrid.SetCells
 00099781    mov         eax,edi
 00099783    call        000981AC
 00099788    and         eax,0FF
 0009978D    lea         eax,[eax+eax*2]
 00099790    lea         edx,[eax+0B6D04];gvar_000B6D04:PShortString
 00099796    lea         eax,[ebp-8]
 00099799    call        @LStrFromString
 0009979E    mov         eax,dword ptr [ebp-8]
 000997A1    push        eax
 000997A2    xor         ecx,ecx
 000997A4    mov         cl,byte ptr [ebp-1]
 000997A7    xor         edx,edx
 000997A9    mov         dl,bl
 000997AB    mov         eax,[000B5784];^gvar_000B70A4:TFormMain
 000997B0    mov         eax,dword ptr [eax]
 000997B2    mov         eax,dword ptr [eax+314]
 000997B8    call        TStringGrid.SetCells
>000997BD    jmp         000997F9
 000997BF    push        0
 000997C1    xor         ecx,ecx
 000997C3    mov         cl,byte ptr [ebp-1]
 000997C6    xor         edx,edx
 000997C8    mov         dl,bl
 000997CA    mov         eax,[000B5784];^gvar_000B70A4:TFormMain
 000997CF    mov         eax,dword ptr [eax]
 000997D1    mov         eax,dword ptr [eax+310]
 000997D7    call        TStringGrid.SetCells
 000997DC    push        0
 000997DE    xor         ecx,ecx
 000997E0    mov         cl,byte ptr [ebp-1]
 000997E3    xor         edx,edx
 000997E5    mov         dl,bl
 000997E7    mov         eax,[000B5784];^gvar_000B70A4:TFormMain
 000997EC    mov         eax,dword ptr [eax]
 000997EE    mov         eax,dword ptr [eax+314]
 000997F4    call        TStringGrid.SetCells
 000997F9    inc         ebx
 000997FA    xor         eax,eax
 000997FC    mov         al,bl
 000997FE    cmp         eax,dword ptr ds:[0B6B64];gvar_000B6B64:Longint
>00099804    jne         0009981E
 00099806    cmp         byte ptr ds:[0B7006],0;gvar_000B7006:Boolean
>0009980D    jne         00099819
 0009980F    xor         eax,eax
 00099811    mov         al,byte ptr [ebp-1]
 00099814    call        000995A8
 00099819    xor         ebx,ebx
 0009981B    inc         byte ptr [ebp-1]
 0009981E    inc         edi
 0009981F    dec         esi
>00099820    jne         00099744
 00099826    movzx       edi,byte ptr [ebp-1]
 0009982A    mov         esi,dword ptr ds:[0B6B68];gvar_000B6B68:Longint
 00099830    sub         esi,edi
>00099832    jl          0009986B
 00099834    inc         esi
 00099835    mov         eax,[000B5784];^gvar_000B70A4:TFormMain
 0009983A    mov         eax,dword ptr [eax]
 0009983C    mov         eax,dword ptr [eax+310]
 00099842    mov         edx,edi
 00099844    call        TStringGrid.GetRows
 00099849    call        TStrings.EndUpdate
 0009984E    mov         eax,[000B5784];^gvar_000B70A4:TFormMain
 00099853    mov         eax,dword ptr [eax]
 00099855    mov         eax,dword ptr [eax+314]
 0009985B    mov         edx,edi
 0009985D    call        TStringGrid.GetRows
 00099862    call        TStrings.EndUpdate
 00099867    inc         edi
 00099868    dec         esi
>00099869    jne         00099835
 0009986B    xor         eax,eax
 0009986D    pop         edx
 0009986E    pop         ecx
 0009986F    pop         ecx
 00099870    mov         dword ptr fs:[eax],edx
 00099873    push        99888
 00099878    lea         eax,[ebp-8]
 0009987B    call        @LStrClr
 00099880    ret
>00099881    jmp         @HandleFinally
>00099886    jmp         00099878
 00099888    pop         edi
 00099889    pop         esi
 0009988A    pop         ebx
 0009988B    pop         ecx
 0009988C    pop         ecx
 0009988D    pop         ebp
 0009988E    ret
end;*}

//00099890
procedure sub_00099890;
begin
{*
 00099890    call        0009958C
 00099895    mov         [000B6B88],eax;gvar_000B6B88
 0009989A    mov         dl,byte ptr ds:[0B6B80];gvar_000B6B80:Integer
 000998A0    mov         al,[000B6B7C];gvar_000B6B7C
 000998A5    call        000996A4
 000998AA    call        000983B8
 000998AF    ret
*}
end;

//000998B0
{*procedure sub_000998B0(?:dword; ?:?; ?:?);
begin
 000998B0    push        ebx
 000998B1    push        esi
 000998B2    mov         ebx,edx
 000998B4    mov         esi,eax
 000998B6    cmp         byte ptr ds:[0B6BB4],0;gvar_000B6BB4
>000998BD    je          000999A8
 000998C3    cmp         dword ptr ds:[0B6B6C],0;gvar_000B6B6C
>000998CA    je          000999A8
 000998D0    cmp         esi,1
>000998D3    jge         000998DC
 000998D5    mov         esi,1
>000998DA    jmp         000998EA
 000998DC    cmp         esi,dword ptr ds:[0B6BAC];gvar_000B6BAC:Single
>000998E2    jle         000998EA
 000998E4    mov         esi,dword ptr ds:[0B6BAC];gvar_000B6BAC:Single
 000998EA    mov         eax,[000B6B88];gvar_000B6B88
 000998EF    cmp         eax,dword ptr ds:[0B6BAC];gvar_000B6BAC:Single
>000998F5    jle         00099901
 000998F7    mov         eax,[000B6BAC];gvar_000B6BAC:Single
 000998FC    mov         [000B6B88],eax;gvar_000B6B88
 00099901    test        cl,cl
>00099903    je          00099915
 00099905    cmp         esi,dword ptr ds:[0B6B84];gvar_000B6B84
>0009990B    jl          00099915
 0009990D    cmp         esi,dword ptr ds:[0B6B88];gvar_000B6B88
>00099913    jle         00099970
 00099915    mov         eax,[000B6BAC];gvar_000B6BAC:Single
 0009991A    sub         eax,dword ptr ds:[0B6BB0];gvar_000B6BB0:Integer
 00099920    inc         eax
 00099921    cmp         esi,eax
>00099923    jl          0009992C
 00099925    call        000999AC
>0009992A    jmp         00099970
 0009992C    mov         eax,esi
 0009992E    cdq
 0009992F    idiv        eax,dword ptr ds:[0B6B64];gvar_000B6B64:Longint
 00099935    test        edx,edx
>00099937    jne         00099951
 00099939    mov         eax,esi
 0009993B    cdq
 0009993C    idiv        eax,dword ptr ds:[0B6B64];gvar_000B6B64:Longint
 00099942    dec         eax
 00099943    imul        dword ptr ds:[0B6B64];gvar_000B6B64:Longint
 00099949    inc         eax
 0009994A    mov         [000B6B84],eax;gvar_000B6B84
>0009994F    jmp         00099966
 00099951    mov         eax,esi
 00099953    cdq
 00099954    idiv        eax,dword ptr ds:[0B6B64];gvar_000B6B64:Longint
 0009995A    imul        dword ptr ds:[0B6B64];gvar_000B6B64:Longint
 00099960    inc         eax
 00099961    mov         [000B6B84],eax;gvar_000B6B84
 00099966    call        0009958C
 0009996B    mov         [000B6B88],eax;gvar_000B6B88
 00099970    test        bl,bl
>00099972    je          00099995
 00099974    mov         ecx,0B6B80;gvar_000B6B80:Integer
 00099979    mov         edx,0B6B7C;gvar_000B6B7C
 0009997E    mov         eax,esi
 00099980    call        00099A4C
 00099985    mov         edx,dword ptr ds:[0B6B80];gvar_000B6B80:Integer
 0009998B    mov         eax,[000B6B7C];gvar_000B6B7C
 00099990    call        00098750
 00099995    xor         edx,edx
 00099997    xor         eax,eax
 00099999    call        000996A4
 0009999E    call        00099890
 000999A3    call        000983B8
 000999A8    pop         esi
 000999A9    pop         ebx
 000999AA    ret
end;*}

//000999AC
procedure sub_000999AC;
begin
{*
 000999AC    mov         eax,[000B6BAC];gvar_000B6BAC:Single
 000999B1    mov         [000B6B88],eax;gvar_000B6B88
 000999B6    mov         eax,[000B6B88];gvar_000B6B88
 000999BB    cmp         eax,dword ptr ds:[0B6BB0];gvar_000B6BB0:Integer
>000999C1    jle         000999F9
 000999C3    mov         eax,[000B6B88];gvar_000B6B88
 000999C8    sub         eax,dword ptr ds:[0B6BB0];gvar_000B6BB0:Integer
 000999CE    inc         eax
 000999CF    mov         [000B6B84],eax;gvar_000B6B84
 000999D4    mov         eax,[000B6BAC];gvar_000B6BAC:Single
 000999D9    cdq
 000999DA    idiv        eax,dword ptr ds:[0B6B64];gvar_000B6B64:Longint
 000999E0    mov         ecx,edx
 000999E2    test        ecx,ecx
>000999E4    je          00099A03
 000999E6    mov         eax,[000B6B84];gvar_000B6B84
 000999EB    add         eax,dword ptr ds:[0B6B64];gvar_000B6B64:Longint
 000999F1    sub         eax,ecx
 000999F3    mov         [000B6B84],eax;gvar_000B6B84
 000999F8    ret
 000999F9    mov         dword ptr ds:[0B6B84],1;gvar_000B6B84
 00099A03    ret
*}
end;

//00099A04
procedure sub_00099A04;
begin
{*
 00099A04    call        0009958C
 00099A09    mov         [000B6B88],eax;gvar_000B6B88
 00099A0E    xor         ecx,ecx
 00099A10    mov         dl,1
 00099A12    mov         eax,1
 00099A17    call        000998B0
 00099A1C    xor         edx,edx
 00099A1E    xor         eax,eax
 00099A20    call        00098750
 00099A25    ret
*}
end;

//00099A28
procedure sub_00099A28;
begin
{*
 00099A28    call        000999AC
 00099A2D    xor         ecx,ecx
 00099A2F    mov         dl,1
 00099A31    mov         eax,[000B6B88];gvar_000B6B88
 00099A36    call        000998B0
 00099A3B    mov         edx,dword ptr ds:[0B6B80];gvar_000B6B80:Integer
 00099A41    mov         eax,[000B6B7C];gvar_000B6B7C
 00099A46    call        00098750
 00099A4B    ret
*}
end;

//00099A4C
{*procedure sub_00099A4C(?:?; ?:?; ?:?);
begin
 00099A4C    push        ebx
 00099A4D    push        esi
 00099A4E    push        edi
 00099A4F    mov         esi,edx
 00099A51    mov         ebx,eax
 00099A53    cmp         ebx,dword ptr ds:[0B6B84];gvar_000B6B84
>00099A59    jle         00099A63
 00099A5B    cmp         ebx,dword ptr ds:[0B6B88];gvar_000B6B88
>00099A61    jle         00099A6D
 00099A63    xor         eax,eax
 00099A65    mov         dword ptr [esi],eax
 00099A67    xor         eax,eax
 00099A69    mov         dword ptr [ecx],eax
>00099A6B    jmp         00099A8C
 00099A6D    mov         edi,ebx
 00099A6F    sub         edi,dword ptr ds:[0B6B84];gvar_000B6B84
 00099A75    mov         eax,edi
 00099A77    cdq
 00099A78    idiv        eax,dword ptr ds:[0B6B64];gvar_000B6B64:Longint
 00099A7E    mov         dword ptr [ecx],eax
 00099A80    mov         eax,dword ptr [ecx]
 00099A82    imul        dword ptr ds:[0B6B64];gvar_000B6B64:Longint
 00099A88    sub         edi,eax
 00099A8A    mov         dword ptr [esi],edi
 00099A8C    pop         edi
 00099A8D    pop         esi
 00099A8E    pop         ebx
 00099A8F    ret
end;*}

//00099A90
{*function sub_00099A90(?:?):?;
begin
 00099A90    cmp         byte ptr ds:[0B7013],0;gvar_000B7013:Boolean
>00099A97    je          00099A9F
 00099A99    cmp         al,20
>00099A9B    jae         00099A9F
 00099A9D    mov         al,20
 00099A9F    ret
end;*}

//00099AA0
{*function sub_00099AA0(?:?; ?:?):?;
begin
 00099AA0    cmp         al,20
>00099AA2    jae         00099AA6
 00099AA4    mov         eax,edx
 00099AA6    ret
end;*}

//00099AA8
{*function sub_00099AA8:?;
begin
 00099AA8    cmp         dword ptr ds:[0B6B8C],0;gvar_000B6B8C:dword
>00099AAF    je          00099ABA
 00099AB1    cmp         dword ptr ds:[0B6B90],0;gvar_000B6B90
>00099AB8    jne         00099ABD
 00099ABA    xor         eax,eax
 00099ABC    ret
 00099ABD    mov         al,1
 00099ABF    ret
end;*}

//00099AC0
{*function sub_00099AC0:?;
begin
 00099AC0    call        00099AA8
 00099AC5    test        al,al
>00099AC7    je          00099AD6
 00099AC9    mov         eax,[000B6B90];gvar_000B6B90
 00099ACE    sub         eax,dword ptr ds:[0B6B8C];gvar_000B6B8C:dword
 00099AD4    inc         eax
 00099AD5    ret
 00099AD6    xor         eax,eax
 00099AD8    ret
end;*}

//00099ADC
{*procedure sub_00099ADC(?:?; ?:?);
begin
 00099ADC    push        ebx
 00099ADD    push        esi
 00099ADE    push        edi
 00099ADF    add         esp,0FFFFFFCC
 00099AE2    mov         byte ptr [esp],dl
 00099AE5    mov         ebx,eax
 00099AE7    mov         edi,dword ptr ds:[0B5784];^gvar_000B70A4:TFormMain
 00099AED    mov         eax,dword ptr [edi]
 00099AEF    mov         eax,dword ptr [eax+31C]
 00099AF5    mov         dword ptr [esp+4],eax
 00099AF9    lea         eax,[esp+4]
 00099AFD    mov         cl,1
 00099AFF    xor         edx,edx
 00099B01    call        00099514
 00099B06    call        000981C4
 00099B0B    mov         esi,eax
 00099B0D    cmp         dword ptr ds:[0B6B8C],0;gvar_000B6B8C:dword
>00099B14    jne         00099B43
 00099B16    cmp         dword ptr ds:[0B6B90],0;gvar_000B6B90
>00099B1D    jne         00099B43
 00099B1F    mov         dword ptr ds:[0B6B8C],esi;gvar_000B6B8C:dword
 00099B25    mov         byte ptr ds:[0B7018],0;gvar_000B7018
 00099B2C    test        bl,bl
>00099B2E    je          00099C21
 00099B34    mov         eax,[000B6B8C];gvar_000B6B8C:dword
 00099B39    mov         [000B6B90],eax;gvar_000B6B90
>00099B3E    jmp         00099C21
 00099B43    test        bl,bl
>00099B45    jne         00099B83
 00099B47    call        00099AA8
 00099B4C    test        al,al
>00099B4E    je          00099B83
 00099B50    mov         dword ptr ds:[0B6B8C],esi;gvar_000B6B8C:dword
 00099B56    xor         eax,eax
 00099B58    mov         [000B6B90],eax;gvar_000B6B90
 00099B5D    mov         byte ptr ds:[0B7018],0;gvar_000B7018
 00099B64    mov         eax,dword ptr [edi]
 00099B66    mov         eax,dword ptr [eax+310]
 00099B6C    mov         edx,dword ptr [eax]
 00099B6E    call        dword ptr [edx+78]
 00099B71    mov         eax,dword ptr [edi]
 00099B73    mov         eax,dword ptr [eax+314]
 00099B79    mov         edx,dword ptr [eax]
 00099B7B    call        dword ptr [edx+78]
>00099B7E    jmp         00099C21
 00099B83    cmp         byte ptr [esp],0
>00099B87    je          00099BC8
 00099B89    cmp         esi,dword ptr ds:[0B6B90];gvar_000B6B90
>00099B8F    jge         00099BA0
 00099B91    mov         dword ptr ds:[0B6B8C],esi;gvar_000B6B8C:dword
 00099B97    mov         byte ptr ds:[0B7018],0FF;gvar_000B7018
>00099B9E    jmp         00099C05
 00099BA0    cmp         byte ptr ds:[0B7018],0FF;gvar_000B7018
>00099BA7    jne         00099BC0
 00099BA9    cmp         esi,dword ptr ds:[0B6B90];gvar_000B6B90
>00099BAF    jne         00099BC0
 00099BB1    mov         byte ptr ds:[0B7018],0;gvar_000B7018
 00099BB8    mov         dword ptr ds:[0B6B8C],esi;gvar_000B6B8C:dword
>00099BBE    jmp         00099C05
 00099BC0    mov         dword ptr ds:[0B6B90],esi;gvar_000B6B90
>00099BC6    jmp         00099C05
 00099BC8    cmp         esi,dword ptr ds:[0B6B8C];gvar_000B6B8C:dword
>00099BCE    jle         00099BDF
 00099BD0    mov         dword ptr ds:[0B6B90],esi;gvar_000B6B90
 00099BD6    mov         byte ptr ds:[0B7018],1;gvar_000B7018
>00099BDD    jmp         00099C05
 00099BDF    cmp         byte ptr ds:[0B7018],1;gvar_000B7018
>00099BE6    jne         00099BFF
 00099BE8    cmp         esi,dword ptr ds:[0B6B8C];gvar_000B6B8C:dword
>00099BEE    jne         00099BFF
 00099BF0    mov         byte ptr ds:[0B7018],0;gvar_000B7018
 00099BF7    mov         dword ptr ds:[0B6B90],esi;gvar_000B6B90
>00099BFD    jmp         00099C05
 00099BFF    mov         dword ptr ds:[0B6B8C],esi;gvar_000B6B8C:dword
 00099C05    mov         eax,[000B6B8C];gvar_000B6B8C:dword
 00099C0A    cmp         eax,dword ptr ds:[0B6B90];gvar_000B6B90
>00099C10    jle         00099C21
 00099C12    mov         edx,0B6B90;gvar_000B6B90
 00099C17    mov         eax,0B6B8C;gvar_000B6B8C:dword
 00099C1C    call        000750FC
 00099C21    call        00099AA8
 00099C26    test        al,al
>00099C28    je          00099CE3
 00099C2E    mov         eax,dword ptr [edi]
 00099C30    mov         eax,dword ptr [eax+310]
 00099C36    mov         edx,dword ptr [eax]
 00099C38    call        dword ptr [edx+78]
 00099C3B    mov         eax,dword ptr [edi]
 00099C3D    mov         eax,dword ptr [eax+314]
 00099C43    mov         edx,dword ptr [eax]
 00099C45    call        dword ptr [edx+78]
 00099C48    mov         eax,dword ptr [edi]
 00099C4A    mov         eax,dword ptr [eax+324]
 00099C50    mov         dword ptr [esp+8],eax
 00099C54    mov         eax,dword ptr [edi]
 00099C56    mov         eax,dword ptr [eax+3FC]
 00099C5C    mov         dword ptr [esp+0C],eax
 00099C60    mov         eax,dword ptr [edi]
 00099C62    mov         eax,dword ptr [eax+3EC]
 00099C68    mov         dword ptr [esp+10],eax
 00099C6C    mov         eax,dword ptr [edi]
 00099C6E    mov         eax,dword ptr [eax+3F0]
 00099C74    mov         dword ptr [esp+14],eax
 00099C78    mov         eax,dword ptr [edi]
 00099C7A    mov         eax,dword ptr [eax+328]
 00099C80    mov         dword ptr [esp+18],eax
 00099C84    mov         eax,dword ptr [edi]
 00099C86    mov         eax,dword ptr [eax+3A8]
 00099C8C    mov         dword ptr [esp+1C],eax
 00099C90    mov         eax,dword ptr [edi]
 00099C92    mov         eax,dword ptr [eax+32C]
 00099C98    mov         dword ptr [esp+20],eax
 00099C9C    mov         eax,dword ptr [edi]
 00099C9E    mov         eax,dword ptr [eax+3C4]
 00099CA4    mov         dword ptr [esp+24],eax
 00099CA8    mov         eax,dword ptr [edi]
 00099CAA    mov         eax,dword ptr [eax+3E0]
 00099CB0    mov         dword ptr [esp+28],eax
 00099CB4    mov         eax,dword ptr [edi]
 00099CB6    mov         eax,dword ptr [eax+3E4]
 00099CBC    mov         dword ptr [esp+2C],eax
 00099CC0    mov         eax,dword ptr [edi]
 00099CC2    mov         eax,dword ptr [eax+40C]
 00099CC8    mov         dword ptr [esp+30],eax
 00099CCC    lea         eax,[esp+8]
 00099CD0    mov         cl,1
 00099CD2    mov         edx,0A
 00099CD7    call        00099514
 00099CDC    mov         bl,1
>00099CDE    jmp         00099D79
 00099CE3    mov         eax,dword ptr [edi]
 00099CE5    mov         eax,dword ptr [eax+324]
 00099CEB    mov         dword ptr [esp+8],eax
 00099CEF    mov         eax,dword ptr [edi]
 00099CF1    mov         eax,dword ptr [eax+3FC]
 00099CF7    mov         dword ptr [esp+0C],eax
 00099CFB    mov         eax,dword ptr [edi]
 00099CFD    mov         eax,dword ptr [eax+3EC]
 00099D03    mov         dword ptr [esp+10],eax
 00099D07    mov         eax,dword ptr [edi]
 00099D09    mov         eax,dword ptr [eax+3F0]
 00099D0F    mov         dword ptr [esp+14],eax
 00099D13    mov         eax,dword ptr [edi]
 00099D15    mov         eax,dword ptr [eax+328]
 00099D1B    mov         dword ptr [esp+18],eax
 00099D1F    mov         eax,dword ptr [edi]
 00099D21    mov         eax,dword ptr [eax+3A8]
 00099D27    mov         dword ptr [esp+1C],eax
 00099D2B    mov         eax,dword ptr [edi]
 00099D2D    mov         eax,dword ptr [eax+32C]
 00099D33    mov         dword ptr [esp+20],eax
 00099D37    mov         eax,dword ptr [edi]
 00099D39    mov         eax,dword ptr [eax+3C4]
 00099D3F    mov         dword ptr [esp+24],eax
 00099D43    mov         eax,dword ptr [edi]
 00099D45    mov         eax,dword ptr [eax+3E0]
 00099D4B    mov         dword ptr [esp+28],eax
 00099D4F    mov         eax,dword ptr [edi]
 00099D51    mov         eax,dword ptr [eax+3E4]
 00099D57    mov         dword ptr [esp+2C],eax
 00099D5B    mov         eax,dword ptr [edi]
 00099D5D    mov         eax,dword ptr [eax+40C]
 00099D63    mov         dword ptr [esp+30],eax
 00099D67    lea         eax,[esp+8]
 00099D6B    xor         ecx,ecx
 00099D6D    mov         edx,0A
 00099D72    call        00099514
 00099D77    xor         ebx,ebx
 00099D79    mov         eax,[000B5634];^gvar_000B6B50:TFormInspect
 00099D7E    cmp         dword ptr [eax],0
>00099D81    je          00099D8F
 00099D83    mov         eax,[000B5634];^gvar_000B6B50:TFormInspect
 00099D88    mov         eax,dword ptr [eax]
 00099D8A    call        00093834
 00099D8F    mov         eax,ebx
 00099D91    add         esp,34
 00099D94    pop         edi
 00099D95    pop         esi
 00099D96    pop         ebx
 00099D97    ret
end;*}

//00099D98
{*procedure sub_00099D98(?:?);
begin
 00099D98    push        ebx
 00099D99    push        esi
 00099D9A    add         esp,0FFFFFFDC
 00099D9D    mov         ebx,eax
 00099D9F    mov         esi,dword ptr ds:[0B5784];^gvar_000B70A4:TFormMain
 00099DA5    xor         eax,eax
 00099DA7    mov         [000B6B8C],eax;gvar_000B6B8C:dword
 00099DAC    xor         eax,eax
 00099DAE    mov         [000B6B90],eax;gvar_000B6B90
 00099DB3    mov         eax,dword ptr [esi]
 00099DB5    mov         eax,dword ptr [eax+31C]
 00099DBB    mov         dword ptr [esp],eax
 00099DBE    mov         eax,dword ptr [esi]
 00099DC0    mov         eax,dword ptr [eax+324]
 00099DC6    mov         dword ptr [esp+4],eax
 00099DCA    mov         eax,dword ptr [esi]
 00099DCC    mov         eax,dword ptr [eax+3FC]
 00099DD2    mov         dword ptr [esp+8],eax
 00099DD6    mov         eax,dword ptr [esi]
 00099DD8    mov         eax,dword ptr [eax+3EC]
 00099DDE    mov         dword ptr [esp+0C],eax
 00099DE2    mov         eax,dword ptr [esi]
 00099DE4    mov         eax,dword ptr [eax+3F0]
 00099DEA    mov         dword ptr [esp+10],eax
 00099DEE    mov         eax,dword ptr [esi]
 00099DF0    mov         eax,dword ptr [eax+328]
 00099DF6    mov         dword ptr [esp+14],eax
 00099DFA    mov         eax,dword ptr [esi]
 00099DFC    mov         eax,dword ptr [eax+3A8]
 00099E02    mov         dword ptr [esp+18],eax
 00099E06    mov         eax,dword ptr [esi]
 00099E08    mov         eax,dword ptr [eax+32C]
 00099E0E    mov         dword ptr [esp+1C],eax
 00099E12    mov         eax,dword ptr [esi]
 00099E14    mov         eax,dword ptr [eax+3C4]
 00099E1A    mov         dword ptr [esp+20],eax
 00099E1E    mov         eax,esp
 00099E20    xor         ecx,ecx
 00099E22    mov         edx,8
 00099E27    call        00099514
 00099E2C    mov         eax,dword ptr [esi]
 00099E2E    mov         eax,dword ptr [eax+310]
 00099E34    mov         edx,dword ptr [eax]
 00099E36    call        dword ptr [edx+78]
 00099E39    mov         eax,dword ptr [esi]
 00099E3B    mov         eax,dword ptr [eax+314]
 00099E41    mov         edx,dword ptr [eax]
 00099E43    call        dword ptr [edx+78]
 00099E46    test        bl,bl
>00099E48    je          00099E60
 00099E4A    mov         eax,[000B5634];^gvar_000B6B50:TFormInspect
 00099E4F    cmp         dword ptr [eax],0
>00099E52    je          00099E60
 00099E54    mov         eax,[000B5634];^gvar_000B6B50:TFormInspect
 00099E59    mov         eax,dword ptr [eax]
 00099E5B    call        00093834
 00099E60    add         esp,24
 00099E63    pop         esi
 00099E64    pop         ebx
 00099E65    ret
end;*}

//00099E68
{*procedure sub_00099E68(?:?);
begin
 00099E68    push        ebp
 00099E69    mov         ebp,esp
 00099E6B    push        0
 00099E6D    push        ebx
 00099E6E    mov         ebx,eax
 00099E70    xor         eax,eax
 00099E72    push        ebp
 00099E73    push        99EC1
 00099E78    push        dword ptr fs:[eax]
 00099E7B    mov         dword ptr fs:[eax],esp
 00099E7E    call        00099AA8
 00099E83    test        al,al
>00099E85    je          00099EAB
 00099E87    cmp         ebx,dword ptr ds:[0B6B90];gvar_000B6B90
>00099E8D    jg          00099EAB
 00099E8F    lea         edx,[ebp-4]
 00099E92    mov         eax,7E5
 00099E97    call        LoadStr;'Block no longer valid'
 00099E9C    mov         eax,dword ptr [ebp-4]
 00099E9F    call        0008D08C
 00099EA4    mov         al,1
 00099EA6    call        00099D98
 00099EAB    xor         eax,eax
 00099EAD    pop         edx
 00099EAE    pop         ecx
 00099EAF    pop         ecx
 00099EB0    mov         dword ptr fs:[eax],edx
 00099EB3    push        99EC8
 00099EB8    lea         eax,[ebp-4]
 00099EBB    call        @LStrClr
 00099EC0    ret
>00099EC1    jmp         @HandleFinally
>00099EC6    jmp         00099EB8
 00099EC8    pop         ebx
 00099EC9    pop         ecx
 00099ECA    pop         ebp
 00099ECB    ret
end;*}

//00099ECC
{*procedure sub_00099ECC(?:?);
begin
 00099ECC    mov         edx,dword ptr ds:[0B6B90];gvar_000B6B90
 00099ED2    add         edx,eax
 00099ED4    sub         edx,dword ptr ds:[0B6B8C];gvar_000B6B8C:dword
 00099EDA    mov         dword ptr ds:[0B6B90],edx;gvar_000B6B90
 00099EE0    mov         [000B6B8C],eax;gvar_000B6B8C:dword
 00099EE5    ret
end;*}

//00099EE8
{*function sub_00099EE8:?;
begin
 00099EE8    push        ebp
 00099EE9    mov         ebp,esp
 00099EEB    add         esp,0FFFFFFF8
 00099EEE    push        ebx
 00099EEF    xor         eax,eax
 00099EF1    mov         dword ptr [ebp-4],eax
 00099EF4    xor         eax,eax
 00099EF6    push        ebp
 00099EF7    push        99FD1
 00099EFC    push        dword ptr fs:[eax]
 00099EFF    mov         dword ptr fs:[eax],esp
 00099F02    xor         ebx,ebx
 00099F04    cmp         dword ptr ds:[0B6B8C],1;gvar_000B6B8C:dword
>00099F0B    jne         00099F24
 00099F0D    mov         eax,[000B6B90];gvar_000B6B90
 00099F12    cmp         eax,dword ptr ds:[0B6BAC];gvar_000B6BAC:Single
>00099F18    jne         00099F24
 00099F1A    call        00098864
>00099F1F    jmp         00099FBB
 00099F24    cmp         dword ptr ds:[0B6B8C],0;gvar_000B6B8C:dword
>00099F2B    je          00099F36
 00099F2D    cmp         dword ptr ds:[0B6B90],0;gvar_000B6B90
>00099F34    jne         00099F4D
 00099F36    lea         edx,[ebp-4]
 00099F39    mov         eax,7E7
 00099F3E    call        LoadStr;'No block marked'
 00099F43    mov         eax,dword ptr [ebp-4]
 00099F46    call        0008D0A8
>00099F4B    jmp         00099FBB
 00099F4D    mov         eax,[000B5784];^gvar_000B70A4:TFormMain
 00099F52    mov         eax,dword ptr [eax]
 00099F54    mov         eax,dword ptr [eax+398]
 00099F5A    mov         dword ptr [ebp-8],eax
 00099F5D    lea         eax,[ebp-8]
 00099F60    xor         ecx,ecx
 00099F62    xor         edx,edx
 00099F64    call        00099514
 00099F69    lea         edx,[ebp-4]
 00099F6C    mov         eax,7EF
 00099F71    call        LoadStr;'Delete...'
 00099F76    mov         eax,dword ptr [ebp-4]
 00099F79    call        000986CC
 00099F7E    mov         edx,dword ptr ds:[0B6B90];gvar_000B6B90
 00099F84    sub         edx,dword ptr ds:[0B6B8C];gvar_000B6B8C:dword
 00099F8A    inc         edx
 00099F8B    mov         eax,[000B6B8C];gvar_000B6B8C:dword
 00099F90    call        0009A0E0
 00099F95    mov         byte ptr ds:[0B6BA5],1;gvar_000B6BA5
 00099F9C    mov         ebx,dword ptr ds:[0B6B8C];gvar_000B6B8C:dword
 00099FA2    mov         al,1
 00099FA4    call        00099D98
 00099FA9    mov         cl,1
 00099FAB    mov         dl,1
 00099FAD    mov         eax,ebx
 00099FAF    call        000998B0
 00099FB4    call        000986F4
 00099FB9    mov         bl,1
 00099FBB    xor         eax,eax
 00099FBD    pop         edx
 00099FBE    pop         ecx
 00099FBF    pop         ecx
 00099FC0    mov         dword ptr fs:[eax],edx
 00099FC3    push        99FD8
 00099FC8    lea         eax,[ebp-4]
 00099FCB    call        @LStrClr
 00099FD0    ret
>00099FD1    jmp         @HandleFinally
>00099FD6    jmp         00099FC8
 00099FD8    mov         eax,ebx
 00099FDA    pop         ebx
 00099FDB    pop         ecx
 00099FDC    pop         ecx
 00099FDD    pop         ebp
 00099FDE    ret
end;*}

//00099FE0
{*function sub_00099FE0(?:?):?;
begin
 00099FE0    push        ebp
 00099FE1    mov         ebp,esp
 00099FE3    add         esp,0FFFFFFF8
 00099FE6    push        ebx
 00099FE7    push        esi
 00099FE8    push        edi
 00099FE9    xor         edx,edx
 00099FEB    mov         dword ptr [ebp-8],edx
 00099FEE    mov         ebx,eax
 00099FF0    xor         eax,eax
 00099FF2    push        ebp
 00099FF3    push        9A0CD
 00099FF8    push        dword ptr fs:[eax]
 00099FFB    mov         dword ptr fs:[eax],esp
 00099FFE    call        000981C4
 0009A003    mov         edi,eax
 0009A005    mov         byte ptr [ebp-1],0
 0009A009    lea         edx,[ebp-8]
 0009A00C    mov         eax,7F0
 0009A011    call        LoadStr;'Copy...'
 0009A016    mov         eax,dword ptr [ebp-8]
 0009A019    call        000986CC
 0009A01E    xor         eax,eax
 0009A020    push        ebp
 0009A021    push        9A0B0
 0009A026    push        dword ptr fs:[eax]
 0009A029    mov         dword ptr fs:[eax],esp
 0009A02C    test        bl,bl
>0009A02E    je          0009A04F
 0009A030    mov         edx,dword ptr ds:[0B6B90];gvar_000B6B90
 0009A036    sub         edx,dword ptr ds:[0B6B8C];gvar_000B6B8C:dword
 0009A03C    inc         edx
 0009A03D    mov         eax,edi
 0009A03F    call        00098898
 0009A044    test        al,al
>0009A046    jne         0009A04F
 0009A048    call        @TryFinallyExit
>0009A04D    jmp         0009A0B7
 0009A04F    test        bl,bl
>0009A051    je          0009A064
 0009A053    cmp         edi,dword ptr ds:[0B6B8C];gvar_000B6B8C:dword
>0009A059    jg          0009A064
 0009A05B    mov         esi,dword ptr ds:[0B6B90];gvar_000B6B90
 0009A061    inc         esi
>0009A062    jmp         0009A06A
 0009A064    mov         esi,dword ptr ds:[0B6B8C];gvar_000B6B8C:dword
 0009A06A    mov         ebx,dword ptr ds:[0B6B90];gvar_000B6B90
 0009A070    add         ebx,edi
 0009A072    sub         ebx,dword ptr ds:[0B6B8C];gvar_000B6B8C:dword
 0009A078    sub         ebx,edi
>0009A07A    jl          0009A092
 0009A07C    inc         ebx
 0009A07D    mov         eax,esi
 0009A07F    call        000981AC
 0009A084    mov         edx,eax
 0009A086    mov         eax,edi
 0009A088    call        000981B8
 0009A08D    inc         esi
 0009A08E    inc         edi
 0009A08F    dec         ebx
>0009A090    jne         0009A07D
 0009A092    mov         byte ptr [ebp-1],1
 0009A096    mov         byte ptr ds:[0B6BA5],1;gvar_000B6BA5
 0009A09D    xor         eax,eax
 0009A09F    pop         edx
 0009A0A0    pop         ecx
 0009A0A1    pop         ecx
 0009A0A2    mov         dword ptr fs:[eax],edx
 0009A0A5    push        9A0B7
 0009A0AA    call        000986F4
 0009A0AF    ret
>0009A0B0    jmp         @HandleFinally
>0009A0B5    jmp         0009A0AA
 0009A0B7    xor         eax,eax
 0009A0B9    pop         edx
 0009A0BA    pop         ecx
 0009A0BB    pop         ecx
 0009A0BC    mov         dword ptr fs:[eax],edx
 0009A0BF    push        9A0D4
 0009A0C4    lea         eax,[ebp-8]
 0009A0C7    call        @LStrClr
 0009A0CC    ret
>0009A0CD    jmp         @HandleFinally
>0009A0D2    jmp         0009A0C4
 0009A0D4    mov         al,byte ptr [ebp-1]
 0009A0D7    pop         edi
 0009A0D8    pop         esi
 0009A0D9    pop         ebx
 0009A0DA    pop         ecx
 0009A0DB    pop         ecx
 0009A0DC    pop         ebp
 0009A0DD    ret
end;*}

//0009A0E0
{*function sub_0009A0E0(?:?; ?:?):?;
begin
 0009A0E0    push        ebp
 0009A0E1    mov         ebp,esp
 0009A0E3    push        0
 0009A0E5    push        ebx
 0009A0E6    push        esi
 0009A0E7    push        edi
 0009A0E8    mov         edi,edx
 0009A0EA    mov         esi,eax
 0009A0EC    xor         eax,eax
 0009A0EE    push        ebp
 0009A0EF    push        9A182
 0009A0F4    push        dword ptr fs:[eax]
 0009A0F7    mov         dword ptr fs:[eax],esp
 0009A0FA    lea         edx,[ebp-4]
 0009A0FD    mov         eax,7EF
 0009A102    call        LoadStr;'Delete...'
 0009A107    mov         eax,dword ptr [ebp-4]
 0009A10A    call        000986CC
 0009A10F    lea         eax,[edi+esi]
 0009A112    mov         edx,eax
 0009A114    dec         edx
 0009A115    cmp         edx,dword ptr ds:[0B6BAC];gvar_000B6BAC:Single
>0009A11B    jle         0009A121
 0009A11D    xor         ebx,ebx
>0009A11F    jmp         0009A167
 0009A121    cmp         edi,dword ptr ds:[0B6BAC];gvar_000B6BAC:Single
>0009A127    jne         0009A132
 0009A129    call        00098864
 0009A12E    mov         bl,1
>0009A130    jmp         0009A167
 0009A132    mov         edx,dword ptr ds:[0B6B6C];gvar_000B6B6C
 0009A138    lea         eax,[edx+eax-1]
 0009A13C    mov         ecx,dword ptr ds:[0B6BAC];gvar_000B6BAC:Single
 0009A142    sub         ecx,esi
 0009A144    sub         ecx,edi
 0009A146    inc         ecx
 0009A147    mov         edx,dword ptr ds:[0B6B6C];gvar_000B6B6C
 0009A14D    lea         edx,[edx+esi-1]
 0009A151    call        Move
 0009A156    mov         eax,edi
 0009A158    neg         eax
 0009A15A    call        0009820C
 0009A15F    mov         ebx,eax
 0009A161    sub         dword ptr ds:[0B6BAC],edi;gvar_000B6BAC:Single
 0009A167    call        000986F4
 0009A16C    xor         eax,eax
 0009A16E    pop         edx
 0009A16F    pop         ecx
 0009A170    pop         ecx
 0009A171    mov         dword ptr fs:[eax],edx
 0009A174    push        9A189
 0009A179    lea         eax,[ebp-4]
 0009A17C    call        @LStrClr
 0009A181    ret
>0009A182    jmp         @HandleFinally
>0009A187    jmp         0009A179
 0009A189    mov         eax,ebx
 0009A18B    pop         edi
 0009A18C    pop         esi
 0009A18D    pop         ebx
 0009A18E    pop         ecx
 0009A18F    pop         ebp
 0009A190    ret
end;*}

//0009A194
procedure sub_0009A194;
begin
{*
 0009A194    push        ebp
 0009A195    mov         ebp,esp
 0009A197    add         esp,0FFFFFFF8
 0009A19A    push        ebx
 0009A19B    push        esi
 0009A19C    push        edi
 0009A19D    xor         eax,eax
 0009A19F    mov         dword ptr [ebp-4],eax
 0009A1A2    xor         eax,eax
 0009A1A4    push        ebp
 0009A1A5    push        9A2B0
 0009A1AA    push        dword ptr fs:[eax]
 0009A1AD    mov         dword ptr fs:[eax],esp
 0009A1B0    cmp         dword ptr ds:[0B6BAC],1;gvar_000B6BAC:Single
>0009A1B7    jne         0009A1C3
 0009A1B9    call        00098864
>0009A1BE    jmp         0009A29A
 0009A1C3    lea         edx,[ebp-4]
 0009A1C6    mov         eax,7EF
 0009A1CB    call        LoadStr;'Delete...'
 0009A1D0    mov         eax,dword ptr [ebp-4]
 0009A1D3    call        000986CC
 0009A1D8    call        000981C4
 0009A1DD    mov         edi,eax
 0009A1DF    mov         eax,[000B5784];^gvar_000B70A4:TFormMain
 0009A1E4    mov         eax,dword ptr [eax]
 0009A1E6    mov         eax,dword ptr [eax+398]
 0009A1EC    cmp         byte ptr [eax+2D],0
>0009A1F0    je          0009A223
 0009A1F2    mov         eax,[000B6BC0];gvar_000B6BC0:AnsiString
 0009A1F7    call        @LStrLen
 0009A1FC    add         eax,dword ptr ds:[0B6B98];gvar_000B6B98
 0009A202    dec         eax
 0009A203    cmp         edi,eax
>0009A205    jg          0009A223
 0009A207    mov         eax,[000B5784];^gvar_000B70A4:TFormMain
 0009A20C    mov         eax,dword ptr [eax]
 0009A20E    mov         eax,dword ptr [eax+398]
 0009A214    mov         dword ptr [ebp-8],eax
 0009A217    lea         eax,[ebp-8]
 0009A21A    xor         ecx,ecx
 0009A21C    xor         edx,edx
 0009A21E    call        00099514
 0009A223    lea         ebx,[edi+1]
 0009A226    mov         esi,dword ptr ds:[0B6BAC];gvar_000B6BAC:Single
 0009A22C    sub         esi,ebx
>0009A22E    jl          0009A246
 0009A230    inc         esi
 0009A231    mov         eax,ebx
 0009A233    call        000981AC
 0009A238    mov         edx,eax
 0009A23A    mov         eax,ebx
 0009A23C    dec         eax
 0009A23D    call        000981B8
 0009A242    inc         ebx
 0009A243    dec         esi
>0009A244    jne         0009A231
 0009A246    dec         dword ptr ds:[0B6BAC];gvar_000B6BAC:Single
 0009A24C    call        0009958C
 0009A251    mov         [000B6B88],eax;gvar_000B6B88
 0009A256    mov         byte ptr ds:[0B6BA5],1;gvar_000B6BA5
 0009A25D    call        00099890
 0009A262    cmp         edi,dword ptr ds:[0B6BAC];gvar_000B6BAC:Single
>0009A268    jle         0009A28E
 0009A26A    mov         ecx,0B6B80;gvar_000B6B80:Integer
 0009A26F    mov         edx,0B6B7C;gvar_000B6B7C
 0009A274    mov         eax,[000B6BAC];gvar_000B6BAC:Single
 0009A279    call        00099A4C
 0009A27E    mov         edx,dword ptr ds:[0B6B80];gvar_000B6B80:Integer
 0009A284    mov         eax,[000B6B7C];gvar_000B6B7C
 0009A289    call        00098750
 0009A28E    mov         eax,edi
 0009A290    call        00099E68
 0009A295    call        000986F4
 0009A29A    xor         eax,eax
 0009A29C    pop         edx
 0009A29D    pop         ecx
 0009A29E    pop         ecx
 0009A29F    mov         dword ptr fs:[eax],edx
 0009A2A2    push        9A2B7
 0009A2A7    lea         eax,[ebp-4]
 0009A2AA    call        @LStrClr
 0009A2AF    ret
>0009A2B0    jmp         @HandleFinally
>0009A2B5    jmp         0009A2A7
 0009A2B7    pop         edi
 0009A2B8    pop         esi
 0009A2B9    pop         ebx
 0009A2BA    pop         ecx
 0009A2BB    pop         ecx
 0009A2BC    pop         ebp
 0009A2BD    ret
*}
end;

//0009A2C0
procedure sub_0009A2C0;
begin
{*
 0009A2C0    push        ebx
 0009A2C1    push        ecx
 0009A2C2    call        000981C4
 0009A2C7    mov         ebx,eax
 0009A2C9    cmp         ebx,1
>0009A2CC    jne         0009A2D6
 0009A2CE    call        00098864
 0009A2D3    pop         edx
 0009A2D4    pop         ebx
 0009A2D5    ret
 0009A2D6    cmp         ebx,dword ptr ds:[0B6BAC];gvar_000B6BAC:Single
>0009A2DC    jne         0009A2E5
 0009A2DE    call        0009A194
>0009A2E3    jmp         0009A343
 0009A2E5    mov         eax,[000B5784];^gvar_000B70A4:TFormMain
 0009A2EA    mov         eax,dword ptr [eax]
 0009A2EC    mov         eax,dword ptr [eax+398]
 0009A2F2    cmp         byte ptr [eax+2D],0
>0009A2F6    je          0009A328
 0009A2F8    mov         eax,[000B6BC0];gvar_000B6BC0:AnsiString
 0009A2FD    call        @LStrLen
 0009A302    add         eax,dword ptr ds:[0B6B98];gvar_000B6B98
 0009A308    dec         eax
 0009A309    cmp         ebx,eax
>0009A30B    jg          0009A328
 0009A30D    mov         eax,[000B5784];^gvar_000B70A4:TFormMain
 0009A312    mov         eax,dword ptr [eax]
 0009A314    mov         eax,dword ptr [eax+398]
 0009A31A    mov         dword ptr [esp],eax
 0009A31D    mov         eax,esp
 0009A31F    xor         ecx,ecx
 0009A321    xor         edx,edx
 0009A323    call        00099514
 0009A328    mov         eax,ebx
 0009A32A    dec         eax
 0009A32B    mov         [000B6BAC],eax;gvar_000B6BAC:Single
 0009A330    mov         byte ptr ds:[0B6BA5],1;gvar_000B6BA5
 0009A337    call        00099A28
 0009A33C    mov         eax,ebx
 0009A33E    call        00099E68
 0009A343    pop         edx
 0009A344    pop         ebx
 0009A345    ret
*}
end;

//0009A348
procedure sub_0009A348;
begin
{*
 0009A348    push        ebp
 0009A349    mov         ebp,esp
 0009A34B    add         esp,0FFFFFFF8
 0009A34E    push        ebx
 0009A34F    push        esi
 0009A350    push        edi
 0009A351    xor         eax,eax
 0009A353    mov         dword ptr [ebp-8],eax
 0009A356    xor         eax,eax
 0009A358    push        ebp
 0009A359    push        9A410
 0009A35E    push        dword ptr fs:[eax]
 0009A361    mov         dword ptr fs:[eax],esp
 0009A364    call        000981C4
 0009A369    mov         ebx,eax
 0009A36B    cmp         dword ptr ds:[0B6BAC],0;gvar_000B6BAC:Single
>0009A372    je          0009A3FA
 0009A378    cmp         ebx,dword ptr ds:[0B6BAC];gvar_000B6BAC:Single
>0009A37E    jne         0009A387
 0009A380    call        00098864
>0009A385    jmp         0009A3FA
 0009A387    mov         eax,[000B5784];^gvar_000B70A4:TFormMain
 0009A38C    mov         eax,dword ptr [eax]
 0009A38E    mov         eax,dword ptr [eax+398]
 0009A394    mov         dword ptr [ebp-4],eax
 0009A397    lea         eax,[ebp-4]
 0009A39A    xor         ecx,ecx
 0009A39C    xor         edx,edx
 0009A39E    call        00099514
 0009A3A3    lea         edx,[ebp-8]
 0009A3A6    mov         eax,7EF
 0009A3AB    call        LoadStr;'Delete...'
 0009A3B0    mov         eax,dword ptr [ebp-8]
 0009A3B3    call        000986CC
 0009A3B8    lea         esi,[ebx+1]
 0009A3BB    mov         edi,dword ptr ds:[0B6BAC];gvar_000B6BAC:Single
 0009A3C1    sub         edi,esi
>0009A3C3    jl          0009A3DC
 0009A3C5    inc         edi
 0009A3C6    mov         eax,esi
 0009A3C8    call        000981AC
 0009A3CD    mov         edx,eax
 0009A3CF    mov         eax,esi
 0009A3D1    sub         eax,ebx
 0009A3D3    call        000981B8
 0009A3D8    inc         esi
 0009A3D9    dec         edi
>0009A3DA    jne         0009A3C6
 0009A3DC    sub         dword ptr ds:[0B6BAC],ebx;gvar_000B6BAC:Single
 0009A3E2    mov         byte ptr ds:[0B6BA5],1;gvar_000B6BA5
 0009A3E9    call        00099A04
 0009A3EE    mov         eax,ebx
 0009A3F0    call        00099E68
 0009A3F5    call        000986F4
 0009A3FA    xor         eax,eax
 0009A3FC    pop         edx
 0009A3FD    pop         ecx
 0009A3FE    pop         ecx
 0009A3FF    mov         dword ptr fs:[eax],edx
 0009A402    push        9A417
 0009A407    lea         eax,[ebp-8]
 0009A40A    call        @LStrClr
 0009A40F    ret
>0009A410    jmp         @HandleFinally
>0009A415    jmp         0009A407
 0009A417    pop         edi
 0009A418    pop         esi
 0009A419    pop         ebx
 0009A41A    pop         ecx
 0009A41B    pop         ecx
 0009A41C    pop         ebp
 0009A41D    ret
*}
end;

//0009A450
{*procedure sub_0009A450(?:?; ?:?; ?:?; ?:?; ?:?);
begin
 0009A450    push        ebp
 0009A451    mov         ebp,esp
 0009A453    push        ecx
 0009A454    push        ebx
 0009A455    push        esi
 0009A456    push        edi
 0009A457    mov         edi,ecx
 0009A459    mov         esi,edx
 0009A45B    mov         ebx,eax
 0009A45D    mov         byte ptr [esi],0
 0009A460    mov         byte ptr [edi],0
 0009A463    mov         eax,[000B6BB8];gvar_000B6BB8:AnsiString
 0009A468    call        @LStrLen
 0009A46D    mov         dword ptr [ebp-4],eax
 0009A470    mov         eax,[000B6BC0];gvar_000B6BC0:AnsiString
 0009A475    call        @LStrLen
 0009A47A    cmp         byte ptr [ebp+0C],0
>0009A47E    je          0009A4B4
 0009A480    cmp         byte ptr [ebp+8],0
>0009A484    je          0009A494
 0009A486    mov         edx,dword ptr [ebx]
 0009A488    cmp         edx,dword ptr ds:[0B6B98];gvar_000B6B98
>0009A48E    jne         0009A494
 0009A490    test        eax,eax
>0009A492    je          0009A4B4
 0009A494    mov         edx,dword ptr [ebx]
 0009A496    add         eax,dword ptr ds:[0B6B98];gvar_000B6B98
 0009A49C    dec         eax
 0009A49D    cmp         edx,eax
>0009A49F    jne         0009A4A5
 0009A4A1    inc         dword ptr [ebx]
>0009A4A3    jmp         0009A4B4
 0009A4A5    mov         eax,dword ptr [ebx]
 0009A4A7    cmp         eax,dword ptr ds:[0B6B94];gvar_000B6B94
>0009A4AD    jne         0009A4B4
 0009A4AF    mov         eax,dword ptr [ebp-4]
 0009A4B2    add         dword ptr [ebx],eax
 0009A4B4    mov         eax,dword ptr [ebx]
 0009A4B6    push        eax
 0009A4B7    mov         eax,[000B6BAC];gvar_000B6BAC:Single
 0009A4BC    push        eax
 0009A4BD    mov         al,[000B6BB5];gvar_000B6BB5:Boolean
 0009A4C2    push        eax
 0009A4C3    mov         al,[000B6BC6];gvar_000B6BC6:Boolean
 0009A4C8    push        eax
 0009A4C9    mov         al,[000B6BC7];gvar_000B6BC7:AnsiString
 0009A4CE    push        eax
 0009A4CF    push        9A420
 0009A4D4    push        edi
 0009A4D5    mov         ecx,dword ptr ds:[0B6B6C];gvar_000B6B6C
 0009A4DB    mov         edx,dword ptr ds:[0B6BB8];gvar_000B6BB8:AnsiString
 0009A4E1    mov         eax,[000B701C];gvar_000B701C:TQSearch
 0009A4E6    call        00090A60
 0009A4EB    mov         dword ptr [ebx],eax
 0009A4ED    cmp         dword ptr [ebx],0
 0009A4F0    setg        byte ptr [esi]
 0009A4F3    cmp         byte ptr [esi],0
>0009A4F6    je          0009A4FF
 0009A4F8    mov         eax,dword ptr [ebx]
 0009A4FA    mov         [000B6B94],eax;gvar_000B6B94
 0009A4FF    pop         edi
 0009A500    pop         esi
 0009A501    pop         ebx
 0009A502    pop         ecx
 0009A503    pop         ebp
 0009A504    ret         8
end;*}

//0009A540
{*procedure sub_0009A540(?:?; ?:?; ?:?);
begin
 0009A540    push        ebx
 0009A541    push        esi
 0009A542    push        edi
 0009A543    mov         edi,ecx
 0009A545    mov         esi,edx
 0009A547    mov         ebx,eax
 0009A549    mov         eax,dword ptr [ebx]
 0009A54B    cmp         eax,dword ptr ds:[0B6B94];gvar_000B6B94
>0009A551    jne         0009A555
 0009A553    dec         dword ptr [ebx]
 0009A555    mov         byte ptr [edi],0
 0009A558    push        1
 0009A55A    mov         eax,dword ptr [ebx]
 0009A55C    push        eax
 0009A55D    mov         al,[000B6BB5];gvar_000B6BB5:Boolean
 0009A562    push        eax
 0009A563    mov         al,[000B6BC6];gvar_000B6BC6:Boolean
 0009A568    push        eax
 0009A569    mov         al,[000B6BC7];gvar_000B6BC7:AnsiString
 0009A56E    push        eax
 0009A56F    push        9A508
 0009A574    push        edi
 0009A575    mov         ecx,dword ptr ds:[0B6B6C];gvar_000B6B6C
 0009A57B    mov         edx,dword ptr ds:[0B6BB8];gvar_000B6BB8:AnsiString
 0009A581    mov         eax,[000B701C];gvar_000B701C:TQSearch
 0009A586    call        00090B64
 0009A58B    mov         dword ptr [ebx],eax
 0009A58D    cmp         dword ptr [ebx],0
 0009A590    setg        byte ptr [esi]
 0009A593    cmp         byte ptr [esi],0
>0009A596    je          0009A59F
 0009A598    mov         eax,dword ptr [ebx]
 0009A59A    mov         [000B6B94],eax;gvar_000B6B94
 0009A59F    pop         edi
 0009A5A0    pop         esi
 0009A5A1    pop         ebx
 0009A5A2    ret
end;*}

//0009A5A4
{*function sub_0009A5A4(?:?; ?:?; ?:?):?;
begin
 0009A5A4    push        ebx
 0009A5A5    push        esi
 0009A5A6    push        edi
 0009A5A7    push        ebp
 0009A5A8    add         esp,0FFFFFFF8
 0009A5AB    mov         edi,ecx
 0009A5AD    mov         dword ptr [esp],edx
 0009A5B0    mov         ebx,eax
 0009A5B2    lea         ebp,[esp+5]
 0009A5B6    xor         eax,eax
 0009A5B8    mov         dword ptr [edi],eax
 0009A5BA    mov         eax,[000B6BB8];gvar_000B6BB8:AnsiString
 0009A5BF    call        @LStrLen
 0009A5C4    mov         esi,eax
 0009A5C6    test        bl,bl
>0009A5C8    je          0009A5DF
 0009A5CA    push        0
 0009A5CC    push        0
 0009A5CE    mov         ecx,ebp
 0009A5D0    lea         edx,[esp+0C]
 0009A5D4    lea         eax,[esp+8]
 0009A5D8    call        0009A450
>0009A5DD    jmp         0009A5EC
 0009A5DF    mov         ecx,ebp
 0009A5E1    lea         edx,[esp+4]
 0009A5E5    mov         eax,esp
 0009A5E7    call        0009A540
 0009A5EC    mov         al,byte ptr [ebp]
 0009A5EF    xor         al,1
 0009A5F1    and         al,byte ptr [esp+4]
>0009A5F5    je          0009A605
 0009A5F7    inc         dword ptr [edi]
 0009A5F9    test        bl,bl
>0009A5FB    je          0009A602
 0009A5FD    add         dword ptr [esp],esi
>0009A600    jmp         0009A605
 0009A602    sub         dword ptr [esp],esi
 0009A605    cmp         byte ptr [ebp],0
>0009A609    jne         0009A612
 0009A60B    cmp         byte ptr [esp+4],0
>0009A610    jne         0009A5C6
 0009A612    mov         al,byte ptr [ebp]
 0009A615    xor         al,1
 0009A617    pop         ecx
 0009A618    pop         edx
 0009A619    pop         ebp
 0009A61A    pop         edi
 0009A61B    pop         esi
 0009A61C    pop         ebx
 0009A61D    ret
end;*}

//0009A620
{*procedure sub_0009A620(?:?);
begin
 0009A620    push        ebp
 0009A621    mov         ebp,esp
 0009A623    push        0
 0009A625    push        ebx
 0009A626    push        esi
 0009A627    push        edi
 0009A628    mov         edi,eax
 0009A62A    xor         eax,eax
 0009A62C    push        ebp
 0009A62D    push        9A691
 0009A632    push        dword ptr fs:[eax]
 0009A635    mov         dword ptr fs:[eax],esp
 0009A638    mov         eax,0B6BBC;gvar_000B6BBC:AnsiString
 0009A63D    call        @LStrClr
 0009A642    mov         eax,[000B6BB8];gvar_000B6BB8:AnsiString
 0009A647    call        @LStrLen
 0009A64C    mov         ebx,eax
 0009A64E    test        ebx,ebx
>0009A650    jle         0009A67B
 0009A652    mov         esi,1
 0009A657    lea         eax,[esi+edi]
 0009A65A    dec         eax
 0009A65B    call        000981AC
 0009A660    mov         edx,eax
 0009A662    lea         eax,[ebp-4]
 0009A665    call        @LStrFromChar
 0009A66A    mov         edx,dword ptr [ebp-4]
 0009A66D    mov         eax,0B6BBC;gvar_000B6BBC:AnsiString
 0009A672    call        @LStrCat
 0009A677    inc         esi
 0009A678    dec         ebx
>0009A679    jne         0009A657
 0009A67B    xor         eax,eax
 0009A67D    pop         edx
 0009A67E    pop         ecx
 0009A67F    pop         ecx
 0009A680    mov         dword ptr fs:[eax],edx
 0009A683    push        9A698
 0009A688    lea         eax,[ebp-4]
 0009A68B    call        @LStrClr
 0009A690    ret
>0009A691    jmp         @HandleFinally
>0009A696    jmp         0009A688
 0009A698    pop         edi
 0009A699    pop         esi
 0009A69A    pop         ebx
 0009A69B    pop         ecx
 0009A69C    pop         ebp
 0009A69D    ret
end;*}

//0009A6A0
{*function sub_0009A6A0(?:?):?;
begin
 0009A6A0    push        ebx
 0009A6A1    push        esi
 0009A6A2    push        edi
 0009A6A3    mov         ebx,eax
 0009A6A5    mov         eax,[000B6BC0];gvar_000B6BC0:AnsiString
 0009A6AA    call        @LStrLen
 0009A6AF    add         eax,ebx
 0009A6B1    dec         eax
 0009A6B2    cmp         eax,dword ptr ds:[0B6BAC];gvar_000B6BAC:Single
>0009A6B8    jle         0009A6BE
 0009A6BA    xor         eax,eax
>0009A6BC    jmp         0009A6EC
 0009A6BE    mov         esi,ebx
 0009A6C0    mov         eax,[000B6BC0];gvar_000B6BC0:AnsiString
 0009A6C5    call        @LStrLen
 0009A6CA    mov         ebx,eax
 0009A6CC    test        ebx,ebx
>0009A6CE    jle         0009A6EA
 0009A6D0    mov         edi,1
 0009A6D5    mov         eax,[000B6BC0];gvar_000B6BC0:AnsiString
 0009A6DA    mov         dl,byte ptr [eax+edi-1]
 0009A6DE    mov         eax,esi
 0009A6E0    call        000981B8
 0009A6E5    inc         esi
 0009A6E6    inc         edi
 0009A6E7    dec         ebx
>0009A6E8    jne         0009A6D5
 0009A6EA    mov         al,1
 0009A6EC    pop         edi
 0009A6ED    pop         esi
 0009A6EE    pop         ebx
 0009A6EF    ret
end;*}

//0009A6F0
{*procedure sub_0009A6F0(?:?; ?:?; ?:?; ?:?; ?:?);
begin
 0009A6F0    push        ebp
 0009A6F1    mov         ebp,esp
 0009A6F3    add         esp,0FFFFFFF8
 0009A6F6    push        ebx
 0009A6F7    push        esi
 0009A6F8    push        edi
 0009A6F9    xor         ebx,ebx
 0009A6FB    mov         dword ptr [ebp-8],ebx
 0009A6FE    mov         dword ptr [ebp-4],ecx
 0009A701    mov         esi,edx
 0009A703    mov         ebx,eax
 0009A705    mov         edi,dword ptr [ebp+0C]
 0009A708    xor         eax,eax
 0009A70A    push        ebp
 0009A70B    push        9A899
 0009A710    push        dword ptr fs:[eax]
 0009A713    mov         dword ptr fs:[eax],esp
 0009A716    mov         byte ptr [esi],0
 0009A719    mov         eax,dword ptr [ebp-4]
 0009A71C    mov         byte ptr [eax],0
 0009A71F    mov         byte ptr [edi],0
 0009A722    mov         eax,[000B6BB8];gvar_000B6BB8:AnsiString
 0009A727    call        @LStrLen
 0009A72C    add         eax,dword ptr [ebx]
 0009A72E    dec         eax
 0009A72F    cmp         eax,dword ptr ds:[0B6BAC];gvar_000B6BAC:Single
>0009A735    jg          0009A883
 0009A73B    mov         al,byte ptr [ebp+8]
 0009A73E    push        eax
 0009A73F    push        1
 0009A741    mov         ecx,edi
 0009A743    mov         edx,esi
 0009A745    mov         eax,ebx
 0009A747    call        0009A450
 0009A74C    cmp         byte ptr [esi],0
>0009A74F    je          0009A883
 0009A755    cmp         byte ptr [edi],0
>0009A758    jne         0009A883
 0009A75E    cmp         dword ptr ds:[0B6D00],0;gvar_000B6D00:TProgressBox
>0009A765    je          0009A792
 0009A767    lea         edx,[ebp-8]
 0009A76A    mov         eax,810
 0009A76F    call        LoadStr;'Replacing'
 0009A774    mov         edx,dword ptr [ebp-8]
 0009A777    mov         ecx,1
 0009A77C    mov         eax,[000B6D00];gvar_000B6D00:TProgressBox
 0009A781    call        0008E154
 0009A786    xor         edx,edx
 0009A788    mov         eax,[000B6D00];gvar_000B6D00:TProgressBox
 0009A78D    call        0008E238
 0009A792    mov         eax,dword ptr [ebx]
 0009A794    call        0009A620
 0009A799    mov         eax,[000B6BC0];gvar_000B6BC0:AnsiString
 0009A79E    call        @LStrLen
 0009A7A3    mov         esi,eax
 0009A7A5    mov         eax,[000B6BB8];gvar_000B6BB8:AnsiString
 0009A7AA    call        @LStrLen
 0009A7AF    cmp         esi,eax
>0009A7B1    jle         0009A7F0
 0009A7B3    mov         eax,[000B6BC0];gvar_000B6BC0:AnsiString
 0009A7B8    call        @LStrLen
 0009A7BD    push        eax
 0009A7BE    mov         eax,[000B6BB8];gvar_000B6BB8:AnsiString
 0009A7C3    call        @LStrLen
 0009A7C8    pop         edx
 0009A7C9    sub         edx,eax
 0009A7CB    mov         eax,dword ptr [ebx]
 0009A7CD    call        00098898
 0009A7D2    test        al,al
>0009A7D4    jne         0009A844
 0009A7D6    lea         edx,[ebp-8]
 0009A7D9    mov         eax,7D4
 0009A7DE    call        LoadStr;'Can't allocate additional memory
to perform operation'
 0009A7E3    mov         eax,dword ptr [ebp-8]
 0009A7E6    call        0008D0A8
>0009A7EB    jmp         0009A883
 0009A7F0    mov         eax,[000B6BC0];gvar_000B6BC0:AnsiString
 0009A7F5    call        @LStrLen
 0009A7FA    mov         esi,eax
 0009A7FC    mov         eax,[000B6BB8];gvar_000B6BB8:AnsiString
 0009A801    call        @LStrLen
 0009A806    cmp         esi,eax
>0009A808    jge         0009A844
 0009A80A    mov         eax,[000B6BB8];gvar_000B6BB8:AnsiString
 0009A80F    call        @LStrLen
 0009A814    push        eax
 0009A815    mov         eax,[000B6BC0];gvar_000B6BC0:AnsiString
 0009A81A    call        @LStrLen
 0009A81F    pop         edx
 0009A820    sub         edx,eax
 0009A822    mov         eax,dword ptr [ebx]
 0009A824    call        0009A0E0
 0009A829    test        al,al
>0009A82B    jne         0009A844
 0009A82D    lea         edx,[ebp-8]
 0009A830    mov         eax,814
 0009A835    call        LoadStr;'Invalid operation'
 0009A83A    mov         eax,dword ptr [ebp-8]
 0009A83D    call        0008D0A8
>0009A842    jmp         0009A883
 0009A844    mov         eax,dword ptr [ebx]
 0009A846    call        0009A6A0
 0009A84B    mov         eax,dword ptr [ebx]
 0009A84D    mov         [000B6B94],eax;gvar_000B6B94
 0009A852    mov         eax,dword ptr [ebx]
 0009A854    mov         [000B6B98],eax;gvar_000B6B98
 0009A859    mov         byte ptr ds:[0B6BA5],1;gvar_000B6BA5
 0009A860    mov         eax,dword ptr [ebp-4]
 0009A863    mov         byte ptr [eax],1
 0009A866    mov         eax,[000B6BC0];gvar_000B6BC0:AnsiString
 0009A86B    call        @LStrLen
 0009A870    test        eax,eax
>0009A872    jle         0009A883
 0009A874    mov         eax,[000B6BC0];gvar_000B6BC0:AnsiString
 0009A879    call        @LStrLen
 0009A87E    add         eax,dword ptr [ebx]
 0009A880    dec         eax
 0009A881    mov         dword ptr [ebx],eax
 0009A883    xor         eax,eax
 0009A885    pop         edx
 0009A886    pop         ecx
 0009A887    pop         ecx
 0009A888    mov         dword ptr fs:[eax],edx
 0009A88B    push        9A8A0
 0009A890    lea         eax,[ebp-8]
 0009A893    call        @LStrClr
 0009A898    ret
>0009A899    jmp         @HandleFinally
>0009A89E    jmp         0009A890
 0009A8A0    pop         edi
 0009A8A1    pop         esi
 0009A8A2    pop         ebx
 0009A8A3    pop         ecx
 0009A8A4    pop         ecx
 0009A8A5    pop         ebp
 0009A8A6    ret         8
end;*}

//0009A8AC
procedure sub_0009A8AC;
begin
{*
 0009A8AC    push        ebp
 0009A8AD    mov         ebp,esp
 0009A8AF    push        0
 0009A8B1    push        0
 0009A8B3    push        0
 0009A8B5    push        ebx
 0009A8B6    xor         eax,eax
 0009A8B8    push        ebp
 0009A8B9    push        9A9C7
 0009A8BE    push        dword ptr fs:[eax]
 0009A8C1    mov         dword ptr fs:[eax],esp
 0009A8C4    mov         cl,1
 0009A8C6    xor         edx,edx
 0009A8C8    mov         eax,[000B6B98];gvar_000B6B98
 0009A8CD    call        000998B0
 0009A8D2    mov         eax,[000B6BC0];gvar_000B6BC0:AnsiString
 0009A8D7    call        @LStrLen
 0009A8DC    test        eax,eax
>0009A8DE    jne         0009A933
 0009A8E0    mov         eax,[000B6BB8];gvar_000B6BB8:AnsiString
 0009A8E5    call        @LStrLen
 0009A8EA    call        0009820C
 0009A8EF    test        al,al
>0009A8F1    jne         0009A90D
 0009A8F3    lea         edx,[ebp-0C]
 0009A8F6    mov         eax,7D4
 0009A8FB    call        LoadStr;'Can't allocate additional memory
to perform operation'
 0009A900    mov         eax,dword ptr [ebp-0C]
 0009A903    call        0008D0A8
>0009A908    jmp         0009A9A9
 0009A90D    mov         eax,[000B6BB8];gvar_000B6BB8:AnsiString
 0009A912    call        @LStrLen
 0009A917    mov         ebx,eax
 0009A919    cmp         ebx,1
>0009A91C    jl          0009A994
 0009A91E    mov         eax,[000B6BBC];gvar_000B6BBC:AnsiString
 0009A923    mov         al,byte ptr [eax+ebx-1]
 0009A927    call        000989B4
 0009A92C    dec         ebx
 0009A92D    test        ebx,ebx
>0009A92F    jne         0009A91E
>0009A931    jmp         0009A994
 0009A933    lea         eax,[ebp-4]
 0009A936    mov         edx,dword ptr ds:[0B6BB8];gvar_000B6BB8:AnsiString
 0009A93C    call        @LStrLAsg
 0009A941    mov         eax,0B6BB8;gvar_000B6BB8:AnsiString
 0009A946    mov         edx,dword ptr ds:[0B6BC0];gvar_000B6BC0:AnsiString
 0009A94C    call        @LStrAsg
 0009A951    mov         eax,0B6BC0;gvar_000B6BC0:AnsiString
 0009A956    mov         edx,dword ptr ds:[0B6BBC];gvar_000B6BBC:AnsiString
 0009A95C    call        @LStrAsg
 0009A961    lea         eax,[ebp-7]
 0009A964    push        eax
 0009A965    push        0
 0009A967    lea         ecx,[ebp-6]
 0009A96A    lea         edx,[ebp-5]
 0009A96D    mov         eax,0B6B98;gvar_000B6B98
 0009A972    call        0009A6F0
 0009A977    mov         eax,0B6BC0;gvar_000B6BC0:AnsiString
 0009A97C    mov         edx,dword ptr ds:[0B6BB8];gvar_000B6BB8:AnsiString
 0009A982    call        @LStrAsg
 0009A987    mov         eax,0B6BB8;gvar_000B6BB8:AnsiString
 0009A98C    mov         edx,dword ptr [ebp-4]
 0009A98F    call        @LStrAsg
 0009A994    mov         cl,1
 0009A996    mov         dl,1
 0009A998    mov         eax,[000B6B98];gvar_000B6B98
 0009A99D    call        000998B0
 0009A9A2    xor         eax,eax
 0009A9A4    mov         [000B6B98],eax;gvar_000B6B98
 0009A9A9    xor         eax,eax
 0009A9AB    pop         edx
 0009A9AC    pop         ecx
 0009A9AD    pop         ecx
 0009A9AE    mov         dword ptr fs:[eax],edx
 0009A9B1    push        9A9CE
 0009A9B6    lea         eax,[ebp-0C]
 0009A9B9    call        @LStrClr
 0009A9BE    lea         eax,[ebp-4]
 0009A9C1    call        @LStrClr
 0009A9C6    ret
>0009A9C7    jmp         @HandleFinally
>0009A9CC    jmp         0009A9B6
 0009A9CE    pop         ebx
 0009A9CF    mov         esp,ebp
 0009A9D1    pop         ebp
 0009A9D2    ret
*}
end;

//0009A9D4
{*function sub_0009A9D4(?:?; ?:?; ?:?):?;
begin
 0009A9D4    push        ebx
 0009A9D5    push        esi
 0009A9D6    push        edi
 0009A9D7    cmp         eax,1
>0009A9DA    jl          0009A9F5
 0009A9DC    cmp         edx,dword ptr ds:[0B6BAC];gvar_000B6BAC:Single
>0009A9E2    jg          0009A9F5
 0009A9E4    cmp         ecx,1
>0009A9E7    jl          0009A9F5
 0009A9E9    cmp         ecx,dword ptr ds:[0B6BAC];gvar_000B6BAC:Single
>0009A9EF    jg          0009A9F5
 0009A9F1    cmp         edx,eax
>0009A9F3    jge         0009A9F9
 0009A9F5    xor         eax,eax
>0009A9F7    jmp         0009AA2C
 0009A9F9    lea         ebx,[edx+ecx]
 0009A9FC    sub         ebx,eax
 0009A9FE    cmp         ebx,dword ptr ds:[0B6BAC];gvar_000B6BAC:Single
>0009AA04    jle         0009AA0A
 0009AA06    xor         eax,eax
>0009AA08    jmp         0009AA2C
 0009AA0A    mov         esi,ecx
 0009AA0C    mov         edi,eax
 0009AA0E    mov         ebx,edx
 0009AA10    sub         ebx,edi
>0009AA12    jl          0009AA2A
 0009AA14    inc         ebx
 0009AA15    mov         eax,edi
 0009AA17    call        000981AC
 0009AA1C    mov         edx,eax
 0009AA1E    mov         eax,esi
 0009AA20    call        000981B8
 0009AA25    inc         esi
 0009AA26    inc         edi
 0009AA27    dec         ebx
>0009AA28    jne         0009AA15
 0009AA2A    mov         al,1
 0009AA2C    pop         edi
 0009AA2D    pop         esi
 0009AA2E    pop         ebx
 0009AA2F    ret
end;*}

//0009AA30
{*procedure sub_0009AA30(?:?; ?:?; ?:?; ?:?);
begin
 0009AA30    push        ebp
 0009AA31    mov         ebp,esp
 0009AA33    add         esp,0FFFFFFF4
 0009AA36    push        ebx
 0009AA37    push        esi
 0009AA38    push        edi
 0009AA39    xor         ebx,ebx
 0009AA3B    mov         dword ptr [ebp-0C],ebx
 0009AA3E    mov         dword ptr [ebp-4],ecx
 0009AA41    mov         edi,edx
 0009AA43    mov         ebx,eax
 0009AA45    mov         esi,dword ptr [ebp+8]
 0009AA48    xor         eax,eax
 0009AA4A    push        ebp
 0009AA4B    push        9AAEE
 0009AA50    push        dword ptr fs:[eax]
 0009AA53    mov         dword ptr fs:[eax],esp
 0009AA56    cmp         dword ptr ds:[0B6D00],0;gvar_000B6D00:TProgressBox
>0009AA5D    je          0009AA7E
 0009AA5F    lea         edx,[ebp-0C]
 0009AA62    mov         eax,811
 0009AA67    call        LoadStr;'Searching and replacing'
 0009AA6C    mov         edx,dword ptr [ebp-0C]
 0009AA6F    mov         ecx,1
 0009AA74    mov         eax,[000B6D00];gvar_000B6D00:TProgressBox
 0009AA79    call        0008E154
 0009AA7E    push        0
 0009AA80    push        1
 0009AA82    mov         ecx,esi
 0009AA84    lea         edx,[ebp-5]
 0009AA87    mov         eax,ebx
 0009AA89    call        0009A450
 0009AA8E    mov         al,byte ptr [esi]
 0009AA90    xor         al,1
 0009AA92    and         al,byte ptr [ebp-5]
>0009AA95    je          0009AACD
 0009AA97    mov         eax,dword ptr [ebx]
 0009AA99    call        0009A620
 0009AA9E    mov         eax,dword ptr [ebx]
 0009AAA0    call        0009A6A0
 0009AAA5    mov         eax,dword ptr [ebp-4]
 0009AAA8    inc         dword ptr [eax]
 0009AAAA    cmp         dword ptr [edi],0
>0009AAAD    jne         0009AAB3
 0009AAAF    mov         eax,dword ptr [ebx]
 0009AAB1    mov         dword ptr [edi],eax
 0009AAB3    mov         eax,dword ptr [ebx]
 0009AAB5    mov         [000B6B98],eax;gvar_000B6B98
 0009AABA    mov         eax,dword ptr [ebx]
 0009AABC    mov         [000B6B94],eax;gvar_000B6B94
 0009AAC1    mov         eax,[000B6BB8];gvar_000B6BB8:AnsiString
 0009AAC6    call        @LStrLen
 0009AACB    add         dword ptr [ebx],eax
 0009AACD    cmp         byte ptr [esi],0
>0009AAD0    jne         0009AAD8
 0009AAD2    cmp         byte ptr [ebp-5],0
>0009AAD6    jne         0009AA7E
 0009AAD8    xor         eax,eax
 0009AADA    pop         edx
 0009AADB    pop         ecx
 0009AADC    pop         ecx
 0009AADD    mov         dword ptr fs:[eax],edx
 0009AAE0    push        9AAF5
 0009AAE5    lea         eax,[ebp-0C]
 0009AAE8    call        @LStrClr
 0009AAED    ret
>0009AAEE    jmp         @HandleFinally
>0009AAF3    jmp         0009AAE5
 0009AAF5    pop         edi
 0009AAF6    pop         esi
 0009AAF7    pop         ebx
 0009AAF8    mov         esp,ebp
 0009AAFA    pop         ebp
 0009AAFB    ret         4
end;*}

//0009AB00
{*procedure sub_0009AB00(?:?; ?:?; ?:?; ?:?);
begin
 0009AB00    push        ebp
 0009AB01    mov         ebp,esp
 0009AB03    add         esp,0FFFFFFE4
 0009AB06    push        ebx
 0009AB07    push        esi
 0009AB08    push        edi
 0009AB09    xor         ebx,ebx
 0009AB0B    mov         dword ptr [ebp-1C],ebx
 0009AB0E    mov         dword ptr [ebp-8],ecx
 0009AB11    mov         dword ptr [ebp-4],edx
 0009AB14    mov         ebx,eax
 0009AB16    mov         edi,dword ptr [ebp+8]
 0009AB19    xor         eax,eax
 0009AB1B    push        ebp
 0009AB1C    push        9ACC7
 0009AB21    push        dword ptr fs:[eax]
 0009AB24    mov         dword ptr fs:[eax],esp
 0009AB27    cmp         dword ptr ds:[0B6D00],0;gvar_000B6D00:TProgressBox
>0009AB2E    je          0009AB4F
 0009AB30    lea         edx,[ebp-1C]
 0009AB33    mov         eax,812
 0009AB38    call        LoadStr;'Step 1: Counting'
 0009AB3D    mov         edx,dword ptr [ebp-1C]
 0009AB40    mov         ecx,1
 0009AB45    mov         eax,[000B6D00];gvar_000B6D00:TProgressBox
 0009AB4A    call        0008E154
 0009AB4F    lea         ecx,[ebp-0C]
 0009AB52    mov         edx,dword ptr [ebx]
 0009AB54    mov         al,1
 0009AB56    call        0009A5A4
 0009AB5B    xor         al,1
 0009AB5D    mov         byte ptr [edi],al
 0009AB5F    cmp         byte ptr [edi],0
>0009AB62    jne         0009ACB1
 0009AB68    mov         eax,[000B6BC0];gvar_000B6BC0:AnsiString
 0009AB6D    call        @LStrLen
 0009AB72    mov         esi,eax
 0009AB74    mov         eax,[000B6BB8];gvar_000B6BB8:AnsiString
 0009AB79    call        @LStrLen
 0009AB7E    sub         esi,eax
 0009AB80    mov         dword ptr [ebp-14],esi
 0009AB83    mov         esi,dword ptr [ebp-0C]
 0009AB86    imul        esi,dword ptr [ebp-14]
 0009AB8A    mov         eax,esi
 0009AB8C    call        0009820C
 0009AB91    test        al,al
>0009AB93    jne         0009ABAF
 0009AB95    lea         edx,[ebp-1C]
 0009AB98    mov         eax,7D4
 0009AB9D    call        LoadStr;'Can't allocate additional memory
to perform operation'
 0009ABA2    mov         eax,dword ptr [ebp-1C]
 0009ABA5    call        0008D0A8
>0009ABAA    jmp         0009ACB1
 0009ABAF    cmp         dword ptr ds:[0B6D00],0;gvar_000B6D00:TProgressBox
>0009ABB6    je          0009ABD7
 0009ABB8    lea         edx,[ebp-1C]
 0009ABBB    mov         eax,813
 0009ABC0    call        LoadStr;'Step 2: Replacing'
 0009ABC5    mov         edx,dword ptr [ebp-1C]
 0009ABC8    mov         ecx,1
 0009ABCD    mov         eax,[000B6D00];gvar_000B6D00:TProgressBox
 0009ABD2    call        0008E154
 0009ABD7    mov         edx,dword ptr [ebp-0C]
 0009ABDA    imul        edx,dword ptr [ebp-14]
 0009ABDE    mov         eax,dword ptr [ebx]
 0009ABE0    call        00098898
 0009ABE5    mov         esi,dword ptr [ebx]
 0009ABE7    mov         eax,dword ptr [ebp-0C]
 0009ABEA    imul        dword ptr [ebp-14]
 0009ABED    add         dword ptr [ebx],eax
 0009ABEF    mov         eax,dword ptr [ebx]
 0009ABF1    mov         dword ptr [ebp-10],eax
 0009ABF4    push        0
 0009ABF6    push        1
 0009ABF8    mov         ecx,edi
 0009ABFA    lea         edx,[ebp-15]
 0009ABFD    mov         eax,ebx
 0009ABFF    call        0009A450
 0009AC04    mov         al,byte ptr [edi]
 0009AC06    xor         al,1
 0009AC08    and         al,byte ptr [ebp-15]
>0009AC0B    je          0009AC6C
 0009AC0D    mov         eax,dword ptr [ebx]
 0009AC0F    call        0009A620
 0009AC14    mov         edx,dword ptr [ebx]
 0009AC16    dec         edx
 0009AC17    mov         ecx,esi
 0009AC19    mov         eax,dword ptr [ebp-10]
 0009AC1C    call        0009A9D4
 0009AC21    test        al,al
>0009AC23    je          0009AC2A
 0009AC25    add         esi,dword ptr [ebx]
 0009AC27    sub         esi,dword ptr [ebp-10]
 0009AC2A    mov         eax,esi
 0009AC2C    call        0009A6A0
 0009AC31    mov         eax,dword ptr [ebp-8]
 0009AC34    inc         dword ptr [eax]
 0009AC36    mov         eax,dword ptr [ebp-4]
 0009AC39    cmp         dword ptr [eax],0
>0009AC3C    jne         0009AC43
 0009AC3E    mov         eax,dword ptr [ebp-4]
 0009AC41    mov         dword ptr [eax],esi
 0009AC43    mov         dword ptr ds:[0B6B98],esi;gvar_000B6B98
 0009AC49    mov         dword ptr ds:[0B6B94],esi;gvar_000B6B94
 0009AC4F    mov         eax,[000B6BC0];gvar_000B6BC0:AnsiString
 0009AC54    call        @LStrLen
 0009AC59    add         esi,eax
 0009AC5B    mov         eax,[000B6BB8];gvar_000B6BB8:AnsiString
 0009AC60    call        @LStrLen
 0009AC65    add         dword ptr [ebx],eax
 0009AC67    mov         eax,dword ptr [ebx]
 0009AC69    mov         dword ptr [ebp-10],eax
 0009AC6C    cmp         byte ptr [edi],0
>0009AC6F    jne         0009AC85
 0009AC71    cmp         byte ptr [ebp-15],0
>0009AC75    je          0009AC85
 0009AC77    mov         eax,dword ptr [ebp-8]
 0009AC7A    mov         eax,dword ptr [eax]
 0009AC7C    cmp         eax,dword ptr [ebp-0C]
>0009AC7F    jne         0009ABF4
 0009AC85    cmp         esi,dword ptr [ebp-10]
>0009AC88    je          0009AC9A
 0009AC8A    mov         ecx,esi
 0009AC8C    mov         edx,dword ptr ds:[0B6BAC];gvar_000B6BAC:Single
 0009AC92    mov         eax,dword ptr [ebp-10]
 0009AC95    call        0009A9D4
 0009AC9A    cmp         byte ptr [edi],0
>0009AC9D    je          0009ACB1
 0009AC9F    mov         eax,dword ptr [ebp-8]
 0009ACA2    mov         edx,dword ptr [ebp-0C]
 0009ACA5    sub         edx,dword ptr [eax]
 0009ACA7    imul        edx,dword ptr [ebp-14]
 0009ACAB    sub         dword ptr ds:[0B6BAC],edx;gvar_000B6BAC:Single
 0009ACB1    xor         eax,eax
 0009ACB3    pop         edx
 0009ACB4    pop         ecx
 0009ACB5    pop         ecx
 0009ACB6    mov         dword ptr fs:[eax],edx
 0009ACB9    push        9ACCE
 0009ACBE    lea         eax,[ebp-1C]
 0009ACC1    call        @LStrClr
 0009ACC6    ret
>0009ACC7    jmp         @HandleFinally
>0009ACCC    jmp         0009ACBE
 0009ACCE    pop         edi
 0009ACCF    pop         esi
 0009ACD0    pop         ebx
 0009ACD1    mov         esp,ebp
 0009ACD3    pop         ebp
 0009ACD4    ret         4
end;*}

//0009ACD8
{*procedure sub_0009ACD8(?:?; ?:?; ?:?; ?:?);
begin
 0009ACD8    push        ebp
 0009ACD9    mov         ebp,esp
 0009ACDB    add         esp,0FFFFFFEC
 0009ACDE    push        ebx
 0009ACDF    push        esi
 0009ACE0    push        edi
 0009ACE1    xor         ebx,ebx
 0009ACE3    mov         dword ptr [ebp-14],ebx
 0009ACE6    mov         dword ptr [ebp-8],ecx
 0009ACE9    mov         dword ptr [ebp-4],edx
 0009ACEC    mov         esi,eax
 0009ACEE    mov         edi,dword ptr [ebp+8]
 0009ACF1    xor         eax,eax
 0009ACF3    push        ebp
 0009ACF4    push        9AE12
 0009ACF9    push        dword ptr fs:[eax]
 0009ACFC    mov         dword ptr fs:[eax],esp
 0009ACFF    cmp         dword ptr ds:[0B6D00],0;gvar_000B6D00:TProgressBox
>0009AD06    je          0009AD27
 0009AD08    lea         edx,[ebp-14]
 0009AD0B    mov         eax,811
 0009AD10    call        LoadStr;'Searching and replacing'
 0009AD15    mov         edx,dword ptr [ebp-14]
 0009AD18    mov         ecx,1
 0009AD1D    mov         eax,[000B6D00];gvar_000B6D00:TProgressBox
 0009AD22    call        0008E154
 0009AD27    mov         eax,dword ptr [esi]
 0009AD29    mov         dword ptr [ebp-0C],eax
 0009AD2C    mov         ebx,dword ptr [esi]
 0009AD2E    push        0
 0009AD30    push        1
 0009AD32    mov         ecx,edi
 0009AD34    lea         edx,[ebp-0D]
 0009AD37    mov         eax,esi
 0009AD39    call        0009A450
 0009AD3E    mov         al,byte ptr [edi]
 0009AD40    xor         al,1
 0009AD42    and         al,byte ptr [ebp-0D]
>0009AD45    je          0009ADA6
 0009AD47    mov         eax,dword ptr [esi]
 0009AD49    call        0009A620
 0009AD4E    mov         edx,dword ptr [esi]
 0009AD50    dec         edx
 0009AD51    mov         ecx,ebx
 0009AD53    mov         eax,dword ptr [ebp-0C]
 0009AD56    call        0009A9D4
 0009AD5B    test        al,al
>0009AD5D    je          0009AD64
 0009AD5F    add         ebx,dword ptr [esi]
 0009AD61    sub         ebx,dword ptr [ebp-0C]
 0009AD64    mov         eax,ebx
 0009AD66    call        0009A6A0
 0009AD6B    mov         eax,dword ptr [ebp-8]
 0009AD6E    inc         dword ptr [eax]
 0009AD70    mov         eax,dword ptr [ebp-4]
 0009AD73    cmp         dword ptr [eax],0
>0009AD76    jne         0009AD7D
 0009AD78    mov         eax,dword ptr [ebp-4]
 0009AD7B    mov         dword ptr [eax],ebx
 0009AD7D    mov         dword ptr ds:[0B6B98],ebx;gvar_000B6B98
 0009AD83    mov         dword ptr ds:[0B6B94],ebx;gvar_000B6B94
 0009AD89    mov         eax,[000B6BC0];gvar_000B6BC0:AnsiString
 0009AD8E    call        @LStrLen
 0009AD93    add         ebx,eax
 0009AD95    mov         eax,[000B6BB8];gvar_000B6BB8:AnsiString
 0009AD9A    call        @LStrLen
 0009AD9F    add         dword ptr [esi],eax
 0009ADA1    mov         eax,dword ptr [esi]
 0009ADA3    mov         dword ptr [ebp-0C],eax
 0009ADA6    cmp         byte ptr [edi],0
>0009ADA9    jne         0009ADB5
 0009ADAB    cmp         byte ptr [ebp-0D],0
>0009ADAF    jne         0009AD2E
 0009ADB5    cmp         ebx,dword ptr [ebp-0C]
>0009ADB8    je          0009ADCA
 0009ADBA    mov         ecx,ebx
 0009ADBC    mov         edx,dword ptr ds:[0B6BAC];gvar_000B6BAC:Single
 0009ADC2    mov         eax,dword ptr [ebp-0C]
 0009ADC5    call        0009A9D4
 0009ADCA    mov         eax,[000B6BB8];gvar_000B6BB8:AnsiString
 0009ADCF    call        @LStrLen
 0009ADD4    mov         ebx,eax
 0009ADD6    mov         eax,[000B6BC0];gvar_000B6BC0:AnsiString
 0009ADDB    call        @LStrLen
 0009ADE0    sub         ebx,eax
 0009ADE2    mov         eax,dword ptr [ebp-8]
 0009ADE5    imul        ebx,dword ptr [eax]
 0009ADE8    sub         dword ptr ds:[0B6BAC],ebx;gvar_000B6BAC:Single
 0009ADEE    cmp         dword ptr ds:[0B6BAC],0;gvar_000B6BAC:Single
>0009ADF5    jne         0009ADFC
 0009ADF7    call        00098864
 0009ADFC    xor         eax,eax
 0009ADFE    pop         edx
 0009ADFF    pop         ecx
 0009AE00    pop         ecx
 0009AE01    mov         dword ptr fs:[eax],edx
 0009AE04    push        9AE19
 0009AE09    lea         eax,[ebp-14]
 0009AE0C    call        @LStrClr
 0009AE11    ret
>0009AE12    jmp         @HandleFinally
>0009AE17    jmp         0009AE09
 0009AE19    pop         edi
 0009AE1A    pop         esi
 0009AE1B    pop         ebx
 0009AE1C    mov         esp,ebp
 0009AE1E    pop         ebp
 0009AE1F    ret         4
end;*}

//0009AE24
{*procedure sub_0009AE24(?:?; ?:?; ?:?; ?:?; ?:?);
begin
 0009AE24    push        ebp
 0009AE25    mov         ebp,esp
 0009AE27    push        ecx
 0009AE28    push        ebx
 0009AE29    push        esi
 0009AE2A    push        edi
 0009AE2B    mov         ebx,ecx
 0009AE2D    mov         esi,edx
 0009AE2F    mov         dword ptr [ebp-4],eax
 0009AE32    mov         edi,dword ptr [ebp+0C]
 0009AE35    cmp         byte ptr [ebp+8],0
>0009AE39    je          0009AE8A
 0009AE3B    cmp         byte ptr ds:[0B6BF0],0;gvar_000B6BF0:Boolean
>0009AE42    jne         0009AE4D
 0009AE44    mov         dword ptr [ebp-4],1
>0009AE4B    jmp         0009AE8A
 0009AE4D    mov         eax,[000B6BC0];gvar_000B6BC0:AnsiString
 0009AE52    call        @LStrLen
 0009AE57    test        eax,eax
>0009AE59    jle         0009AE82
 0009AE5B    mov         eax,[000B6BC0];gvar_000B6BC0:AnsiString
 0009AE60    call        @LStrLen
 0009AE65    add         eax,dword ptr ds:[0B6B98];gvar_000B6B98
 0009AE6B    dec         eax
 0009AE6C    push        eax
 0009AE6D    call        000981C4
 0009AE72    pop         edx
 0009AE73    cmp         edx,eax
>0009AE75    jne         0009AE82
 0009AE77    call        000981C4
 0009AE7C    inc         eax
 0009AE7D    mov         dword ptr [ebp-4],eax
>0009AE80    jmp         0009AE8A
 0009AE82    call        000981C4
 0009AE87    mov         dword ptr [ebp-4],eax
 0009AE8A    xor         eax,eax
 0009AE8C    mov         dword ptr [esi],eax
 0009AE8E    xor         eax,eax
 0009AE90    mov         dword ptr [ebx],eax
 0009AE92    mov         byte ptr [edi],0
 0009AE95    mov         eax,[000B6BB8];gvar_000B6BB8:AnsiString
 0009AE9A    call        @LStrLen
 0009AE9F    push        eax
 0009AEA0    mov         eax,[000B6BC0];gvar_000B6BC0:AnsiString
 0009AEA5    call        @LStrLen
 0009AEAA    pop         edx
 0009AEAB    cmp         edx,eax
>0009AEAD    jne         0009AEBE
 0009AEAF    push        edi
 0009AEB0    mov         ecx,ebx
 0009AEB2    mov         edx,esi
 0009AEB4    lea         eax,[ebp-4]
 0009AEB7    call        0009AA30
>0009AEBC    jmp         0009AEF4
 0009AEBE    mov         eax,[000B6BB8];gvar_000B6BB8:AnsiString
 0009AEC3    call        @LStrLen
 0009AEC8    push        eax
 0009AEC9    mov         eax,[000B6BC0];gvar_000B6BC0:AnsiString
 0009AECE    call        @LStrLen
 0009AED3    pop         edx
 0009AED4    cmp         edx,eax
>0009AED6    jge         0009AEE7
 0009AED8    push        edi
 0009AED9    mov         ecx,ebx
 0009AEDB    mov         edx,esi
 0009AEDD    lea         eax,[ebp-4]
 0009AEE0    call        0009AB00
>0009AEE5    jmp         0009AEF4
 0009AEE7    push        edi
 0009AEE8    mov         ecx,ebx
 0009AEEA    mov         edx,esi
 0009AEEC    lea         eax,[ebp-4]
 0009AEEF    call        0009ACD8
 0009AEF4    cmp         dword ptr [ebx],0
>0009AEF7    jle         0009AF38
 0009AEF9    mov         byte ptr ds:[0B6BA5],1;gvar_000B6BA5
 0009AF00    mov         eax,[000B6BC0];gvar_000B6BC0:AnsiString
 0009AF05    call        @LStrLen
 0009AF0A    test        eax,eax
>0009AF0C    jne         0009AF1E
 0009AF0E    mov         cl,1
 0009AF10    mov         dl,1
 0009AF12    mov         eax,[000B6B94];gvar_000B6B94
 0009AF17    call        000998B0
>0009AF1C    jmp         0009AF38
 0009AF1E    mov         eax,[000B6BC0];gvar_000B6BC0:AnsiString
 0009AF23    call        @LStrLen
 0009AF28    add         eax,dword ptr ds:[0B6B94];gvar_000B6B94
 0009AF2E    dec         eax
 0009AF2F    mov         cl,1
 0009AF31    mov         dl,1
 0009AF33    call        000998B0
 0009AF38    pop         edi
 0009AF39    pop         esi
 0009AF3A    pop         ebx
 0009AF3B    pop         ecx
 0009AF3C    pop         ebp
 0009AF3D    ret         8
end;*}

//0009AF40
{*function sub_0009AF40(?:?):?;
begin
 0009AF40    push        ebp
 0009AF41    mov         ebp,esp
 0009AF43    add         esp,0FFFFFE1C
 0009AF49    push        ebx
 0009AF4A    push        esi
 0009AF4B    push        edi
 0009AF4C    xor         edx,edx
 0009AF4E    mov         dword ptr [ebp-1D4],edx
 0009AF54    mov         dword ptr [ebp-4],eax
 0009AF57    mov         eax,dword ptr [ebp-4]
 0009AF5A    call        @LStrAddRef
 0009AF5F    xor         eax,eax
 0009AF61    push        ebp
 0009AF62    push        9B04C
 0009AF67    push        dword ptr fs:[eax]
 0009AF6A    mov         dword ptr fs:[eax],esp
 0009AF6D    xor         eax,eax
 0009AF6F    push        ebp
 0009AF70    push        9B01F
 0009AF75    push        dword ptr fs:[eax]
 0009AF78    mov         dword ptr fs:[eax],esp
 0009AF7B    mov         edx,dword ptr [ebp-4]
 0009AF7E    lea         eax,[ebp-1D0]
 0009AF84    call        @Assign
 0009AF89    lea         eax,[ebp-1D0]
 0009AF8F    call        @RewritText
 0009AF94    call        @_IOTest
 0009AF99    xor         ebx,ebx
 0009AF9B    mov         esi,0B6BF4;gvar_000B6BF4
 0009AFA0    cmp         bl,byte ptr [esi]
>0009AFA2    je          0009AFFD
 0009AFA4    lea         eax,[ebp-1D4]
 0009AFAA    push        eax
 0009AFAB    xor         eax,eax
 0009AFAD    mov         al,bl
 0009AFAF    mov         dword ptr [ebp-1E4],eax
 0009AFB5    mov         byte ptr [ebp-1E0],0
 0009AFBC    xor         eax,eax
 0009AFBE    mov         al,byte ptr [esi]
 0009AFC0    mov         dword ptr [ebp-1DC],eax
 0009AFC6    mov         byte ptr [ebp-1D8],0
 0009AFCD    lea         edx,[ebp-1E4]
 0009AFD3    mov         ecx,1
 0009AFD8    mov         eax,9B064;'%2.2x;%2.2x'
 0009AFDD    call        Format
 0009AFE2    mov         edx,dword ptr [ebp-1D4]
 0009AFE8    lea         eax,[ebp-1D0]
 0009AFEE    call        @Write0Bool
 0009AFF3    call        @WriteLn
 0009AFF8    call        @_IOTest
 0009AFFD    inc         ebx
 0009AFFE    inc         esi
 0009AFFF    test        bl,bl
>0009B001    jne         0009AFA0
 0009B003    lea         eax,[ebp-1D0]
 0009B009    call        @Close
 0009B00E    call        @_IOTest
 0009B013    mov         bl,1
 0009B015    xor         eax,eax
 0009B017    pop         edx
 0009B018    pop         ecx
 0009B019    pop         ecx
 0009B01A    mov         dword ptr fs:[eax],edx
>0009B01D    jmp         0009B02B
>0009B01F    jmp         @HandleAnyException
 0009B024    xor         ebx,ebx
 0009B026    call        @DoneExcept
 0009B02B    xor         eax,eax
 0009B02D    pop         edx
 0009B02E    pop         ecx
 0009B02F    pop         ecx
 0009B030    mov         dword ptr fs:[eax],edx
 0009B033    push        9B053
 0009B038    lea         eax,[ebp-1D4]
 0009B03E    call        @LStrClr
 0009B043    lea         eax,[ebp-4]
 0009B046    call        @LStrClr
 0009B04B    ret
>0009B04C    jmp         @HandleFinally
>0009B051    jmp         0009B038
 0009B053    mov         eax,ebx
 0009B055    pop         edi
 0009B056    pop         esi
 0009B057    pop         ebx
 0009B058    mov         esp,ebp
 0009B05A    pop         ebp
 0009B05B    ret
end;*}

//0009B070
{*function sub_0009B070(?:String):?;
begin
 0009B070    push        ebp
 0009B071    mov         ebp,esp
 0009B073    add         esp,0FFFFFE28
 0009B079    push        ebx
 0009B07A    push        esi
 0009B07B    push        edi
 0009B07C    xor         edx,edx
 0009B07E    mov         dword ptr [ebp-1D8],edx
 0009B084    mov         dword ptr [ebp-8],edx
 0009B087    mov         dword ptr [ebp-4],eax
 0009B08A    mov         eax,dword ptr [ebp-4]
 0009B08D    call        @LStrAddRef
 0009B092    lea         esi,[ebp-1D4]
 0009B098    xor         eax,eax
 0009B09A    push        ebp
 0009B09B    push        9B225
 0009B0A0    push        dword ptr fs:[eax]
 0009B0A3    mov         dword ptr fs:[eax],esp
 0009B0A6    call        0009B244
 0009B0AB    xor         eax,eax
 0009B0AD    push        ebp
 0009B0AE    push        9B1F3
 0009B0B3    push        dword ptr fs:[eax]
 0009B0B6    mov         dword ptr fs:[eax],esp
 0009B0B9    mov         edx,dword ptr [ebp-4]
 0009B0BC    mov         eax,esi
 0009B0BE    call        @Assign
 0009B0C3    mov         eax,esi
 0009B0C5    call        @ResetText
 0009B0CA    call        @_IOTest
>0009B0CF    jmp         0009B1C7
 0009B0D4    lea         edx,[ebp-8]
 0009B0D7    mov         eax,esi
 0009B0D9    call        @ReadLString
 0009B0DE    mov         eax,esi
 0009B0E0    call        @ReadLn
 0009B0E5    call        @_IOTest
 0009B0EA    mov         edx,dword ptr [ebp-8]
 0009B0ED    mov         eax,9B240;';'
 0009B0F2    call        @LStrPos
 0009B0F7    mov         ebx,eax
 0009B0F9    cmp         ebx,3
>0009B0FC    jne         0009B15F
 0009B0FE    mov         eax,dword ptr [ebp-8]
 0009B101    call        @LStrLen
 0009B106    cmp         eax,5
>0009B109    jne         0009B15F
 0009B10B    lea         eax,[ebp-1D8]
 0009B111    push        eax
 0009B112    mov         ecx,2
 0009B117    mov         edx,1
 0009B11C    mov         eax,dword ptr [ebp-8]
 0009B11F    call        @LStrCopy
 0009B124    mov         eax,dword ptr [ebp-1D8]
 0009B12A    xor         edx,edx
 0009B12C    call        00074DB0
 0009B131    test        al,al
>0009B133    je          0009B15F
 0009B135    lea         eax,[ebp-1D8]
 0009B13B    push        eax
 0009B13C    mov         ecx,2
 0009B141    mov         edx,4
 0009B146    mov         eax,dword ptr [ebp-8]
 0009B149    call        @LStrCopy
 0009B14E    mov         eax,dword ptr [ebp-1D8]
 0009B154    xor         edx,edx
 0009B156    call        00074DB0
 0009B15B    test        al,al
>0009B15D    jne         0009B172
 0009B15F    xor         ecx,ecx
 0009B161    mov         dl,1
 0009B163    mov         eax,[000176E8];Exception
 0009B168    call        Exception.Create;Exception.Create
 0009B16D    call        @RaiseExcept
 0009B172    lea         eax,[ebp-1D8]
 0009B178    push        eax
 0009B179    mov         ecx,2
 0009B17E    mov         edx,4
 0009B183    mov         eax,dword ptr [ebp-8]
 0009B186    call        @LStrCopy
 0009B18B    mov         eax,dword ptr [ebp-1D8]
 0009B191    call        0007507C
 0009B196    mov         ebx,eax
 0009B198    lea         eax,[ebp-1D8]
 0009B19E    push        eax
 0009B19F    mov         ecx,2
 0009B1A4    mov         edx,1
 0009B1A9    mov         eax,dword ptr [ebp-8]
 0009B1AC    call        @LStrCopy
 0009B1B1    mov         eax,dword ptr [ebp-1D8]
 0009B1B7    call        0007507C
 0009B1BC    and         eax,0FF
 0009B1C1    mov         byte ptr [eax+0B6BF4],bl;gvar_000B6BF4
 0009B1C7    mov         eax,esi
 0009B1C9    call        @EofText
 0009B1CE    call        @_IOTest
 0009B1D3    test        al,al
>0009B1D5    je          0009B0D4
 0009B1DB    mov         eax,esi
 0009B1DD    call        @Close
 0009B1E2    call        @_IOTest
 0009B1E7    mov         bl,1
 0009B1E9    xor         eax,eax
 0009B1EB    pop         edx
 0009B1EC    pop         ecx
 0009B1ED    pop         ecx
 0009B1EE    mov         dword ptr fs:[eax],edx
>0009B1F1    jmp         0009B1FF
>0009B1F3    jmp         @HandleAnyException
 0009B1F8    xor         ebx,ebx
 0009B1FA    call        @DoneExcept
 0009B1FF    xor         eax,eax
 0009B201    pop         edx
 0009B202    pop         ecx
 0009B203    pop         ecx
 0009B204    mov         dword ptr fs:[eax],edx
 0009B207    push        9B22C
 0009B20C    lea         eax,[ebp-1D8]
 0009B212    call        @LStrClr
 0009B217    lea         eax,[ebp-8]
 0009B21A    mov         edx,2
 0009B21F    call        @LStrArrayClr
 0009B224    ret
>0009B225    jmp         @HandleFinally
>0009B22A    jmp         0009B20C
 0009B22C    mov         eax,ebx
 0009B22E    pop         edi
 0009B22F    pop         esi
 0009B230    pop         ebx
 0009B231    mov         esp,ebp
 0009B233    pop         ebp
 0009B234    ret
end;*}

//0009B244
procedure sub_0009B244;
begin
{*
 0009B244    xor         edx,edx
 0009B246    mov         eax,0B6BF4;gvar_000B6BF4
 0009B24B    mov         byte ptr [eax],dl
 0009B24D    inc         edx
 0009B24E    inc         eax
 0009B24F    test        dl,dl
>0009B251    jne         0009B24B
 0009B253    ret
*}
end;

//0009B254
procedure sub_0009B254(?:TCMByteEdit);
begin
{*
 0009B254    push        ebp
 0009B255    mov         ebp,esp
 0009B257    xor         ecx,ecx
 0009B259    push        ecx
 0009B25A    push        ecx
 0009B25B    push        ecx
 0009B25C    push        ecx
 0009B25D    push        ecx
 0009B25E    push        ecx
 0009B25F    push        ebx
 0009B260    push        esi
 0009B261    push        edi
 0009B262    mov         dword ptr [ebp-4],eax
 0009B265    xor         eax,eax
 0009B267    push        ebp
 0009B268    push        9B388
 0009B26D    push        dword ptr fs:[eax]
 0009B270    mov         dword ptr fs:[eax],esp
 0009B273    lea         edx,[ebp-10]
 0009B276    mov         eax,dword ptr [ebp-4]
 0009B279    call        TControl.GetText
 0009B27E    mov         eax,dword ptr [ebp-10]
 0009B281    call        @LStrLen
 0009B286    mov         dword ptr [ebp-8],eax
 0009B289    mov         eax,dword ptr [ebp-4]
 0009B28C    mov         edx,dword ptr [eax]
 0009B28E    call        dword ptr [edx+0C0]
 0009B294    cmp         eax,dword ptr [ebp-8]
>0009B297    jl          0009B35D
 0009B29D    lea         edx,[ebp-0C]
 0009B2A0    mov         eax,dword ptr [ebp-4]
 0009B2A3    call        TCMByteEdit.GetASCII
 0009B2A8    call        000981C4
 0009B2AD    mov         ebx,eax
 0009B2AF    mov         eax,dword ptr [ebp-0C]
 0009B2B2    call        @LStrLen
 0009B2B7    mov         esi,eax
 0009B2B9    test        esi,esi
>0009B2BB    jle         0009B2E3
 0009B2BD    mov         edi,1
 0009B2C2    mov         eax,ebx
 0009B2C4    call        000981AC
 0009B2C9    mov         edx,dword ptr [ebp-0C]
 0009B2CC    cmp         al,byte ptr [edx+edi-1]
>0009B2D0    jne         0009B35D
 0009B2D6    inc         ebx
 0009B2D7    cmp         ebx,dword ptr ds:[0B6BAC];gvar_000B6BAC:Single
>0009B2DD    jg          0009B35D
 0009B2DF    inc         edi
 0009B2E0    dec         esi
>0009B2E1    jne         0009B2C2
 0009B2E3    call        000981C4
 0009B2E8    mov         ebx,eax
 0009B2EA    mov         eax,dword ptr [ebp-8]
 0009B2ED    inc         eax
 0009B2EE    mov         ecx,3
 0009B2F3    cdq
 0009B2F4    idiv        eax,ecx
 0009B2F6    add         ebx,eax
 0009B2F8    cmp         ebx,dword ptr ds:[0B6BAC];gvar_000B6BAC:Single
>0009B2FE    jg          0009B35D
 0009B300    lea         edx,[ebp-14]
 0009B303    mov         eax,dword ptr [ebp-4]
 0009B306    call        TControl.GetText
 0009B30B    push        dword ptr [ebp-14]
 0009B30E    push        9B3A0;' '
 0009B313    mov         eax,ebx
 0009B315    call        000981AC
 0009B31A    lea         edx,[ebp-18]
 0009B31D    call        00074C9C
 0009B322    push        dword ptr [ebp-18]
 0009B325    lea         eax,[ebp-10]
 0009B328    mov         edx,3
 0009B32D    call        @LStrCatN
 0009B332    mov         edx,dword ptr [ebp-10]
 0009B335    mov         eax,dword ptr [ebp-4]
 0009B338    call        TControl.SetText
 0009B33D    lea         edx,[ebp-10]
 0009B340    mov         eax,dword ptr [ebp-4]
 0009B343    call        TControl.GetText
 0009B348    mov         eax,dword ptr [ebp-10]
 0009B34B    call        @LStrLen
 0009B350    mov         edx,eax
 0009B352    mov         eax,dword ptr [ebp-4]
 0009B355    mov         ecx,dword ptr [eax]
 0009B357    call        dword ptr [ecx+0CC]
 0009B35D    xor         eax,eax
 0009B35F    pop         edx
 0009B360    pop         ecx
 0009B361    pop         ecx
 0009B362    mov         dword ptr fs:[eax],edx
 0009B365    push        9B38F
 0009B36A    lea         eax,[ebp-18]
 0009B36D    call        @LStrClr
 0009B372    lea         eax,[ebp-14]
 0009B375    mov         edx,2
 0009B37A    call        @LStrArrayClr
 0009B37F    lea         eax,[ebp-0C]
 0009B382    call        @LStrClr
 0009B387    ret
>0009B388    jmp         @HandleFinally
>0009B38D    jmp         0009B36A
 0009B38F    pop         edi
 0009B390    pop         esi
 0009B391    pop         ebx
 0009B392    mov         esp,ebp
 0009B394    pop         ebp
 0009B395    ret
*}
end;

//0009B3A4
procedure sub_0009B3A4;
begin
{*
 0009B3A4    push        ebp
 0009B3A5    mov         ebp,esp
 0009B3A7    add         esp,0FFFFFEFC
 0009B3AD    push        ebx
 0009B3AE    push        esi
 0009B3AF    xor         eax,eax
 0009B3B1    mov         dword ptr [ebp-104],eax
 0009B3B7    xor         eax,eax
 0009B3B9    push        ebp
 0009B3BA    push        9B41F
 0009B3BF    push        dword ptr fs:[eax]
 0009B3C2    mov         dword ptr fs:[eax],esp
 0009B3C5    xor         ebx,ebx
 0009B3C7    mov         esi,0B6D04;gvar_000B6D04:PShortString
 0009B3CC    lea         edx,[ebp-104]
 0009B3D2    mov         eax,ebx
 0009B3D4    call        00074C9C
 0009B3D9    mov         edx,dword ptr [ebp-104]
 0009B3DF    lea         eax,[ebp-100]
 0009B3E5    mov         ecx,0FF
 0009B3EA    call        @LStrToString
 0009B3EF    lea         edx,[ebp-100]
 0009B3F5    mov         eax,esi
 0009B3F7    mov         cl,2
 0009B3F9    call        @PStrNCpy
 0009B3FE    inc         ebx
 0009B3FF    add         esi,3
 0009B402    test        bl,bl
>0009B404    jne         0009B3CC
 0009B406    xor         eax,eax
 0009B408    pop         edx
 0009B409    pop         ecx
 0009B40A    pop         ecx
 0009B40B    mov         dword ptr fs:[eax],edx
 0009B40E    push        9B426
 0009B413    lea         eax,[ebp-104]
 0009B419    call        @LStrClr
 0009B41E    ret
>0009B41F    jmp         @HandleFinally
>0009B424    jmp         0009B413
 0009B426    pop         esi
 0009B427    pop         ebx
 0009B428    mov         esp,ebp
 0009B42A    pop         ebp
 0009B42B    ret
*}
end;

//0009B42C
{*function sub_0009B42C(?:dword; ?:?):?;
begin
 0009B42C    push        ebp
 0009B42D    mov         ebp,esp
 0009B42F    add         esp,0FFFFFFEC
 0009B432    push        ebx
 0009B433    push        esi
 0009B434    xor         ecx,ecx
 0009B436    mov         dword ptr [ebp-10],ecx
 0009B439    mov         dword ptr [ebp-14],ecx
 0009B43C    mov         dword ptr [ebp-4],edx
 0009B43F    mov         ebx,eax
 0009B441    xor         eax,eax
 0009B443    push        ebp
 0009B444    push        9B54E
 0009B449    push        dword ptr fs:[eax]
 0009B44C    mov         dword ptr fs:[eax],esp
 0009B44F    lea         edx,[ebp-10]
 0009B452    mov         eax,80B
 0009B457    call        LoadStr;'Replacing...'
 0009B45C    mov         eax,dword ptr [ebp-10]
 0009B45F    push        eax
 0009B460    lea         edx,[ebp-14]
 0009B463    mov         eax,7FF
 0009B468    call        LoadStr;'Current file position'
 0009B46D    mov         eax,dword ptr [ebp-14]
 0009B470    push        eax
 0009B471    push        1
 0009B473    push        1
 0009B475    call        00088008
 0009B47A    mov         ecx,eax
 0009B47C    mov         dl,1
 0009B47E    mov         eax,[0008C62C];TProgressBox
 0009B483    call        TProgressBox.Create;TProgressBox.Create
 0009B488    mov         dword ptr [ebp-0C],eax
 0009B48B    xor         ecx,ecx
 0009B48D    push        ebp
 0009B48E    push        9B52C
 0009B493    push        dword ptr fs:[ecx]
 0009B496    mov         dword ptr fs:[ecx],esp
 0009B499    mov         eax,dword ptr [ebp-0C]
 0009B49C    call        TCustomForm.Show
 0009B4A1    mov         eax,dword ptr [ebp-4]
 0009B4A4    xor         edx,edx
 0009B4A6    mov         dword ptr [eax],edx
 0009B4A8    mov         esi,dword ptr ds:[0B6BAC];gvar_000B6BAC:Single
 0009B4AE    sub         esi,ebx
>0009B4B0    jl          0009B503
 0009B4B2    inc         esi
 0009B4B3    mov         eax,ebx
 0009B4B5    call        000981AC
 0009B4BA    xor         edx,edx
 0009B4BC    mov         dl,al
 0009B4BE    mov         dl,byte ptr [edx+0B6BF4];gvar_000B6BF4
 0009B4C4    cmp         dl,al
>0009B4C6    je          0009B4D4
 0009B4C8    mov         eax,ebx
 0009B4CA    call        000981B8
 0009B4CF    mov         eax,dword ptr [ebp-4]
 0009B4D2    inc         dword ptr [eax]
 0009B4D4    mov         eax,dword ptr [ebp-4]
 0009B4D7    cmp         dword ptr [eax],0
 0009B4DA    setg        byte ptr ds:[0B6BA5];gvar_000B6BA5
 0009B4E1    push        5
 0009B4E3    mov         ecx,dword ptr ds:[0B6BAC];gvar_000B6BAC:Single
 0009B4E9    mov         edx,ebx
 0009B4EB    mov         eax,dword ptr [ebp-0C]
 0009B4EE    call        0008E1A4
 0009B4F3    mov         eax,dword ptr [ebp-0C]
 0009B4F6    cmp         byte ptr [eax+2DC],0;TProgressBox.?f2DC:byte
>0009B4FD    jne         0009B503
 0009B4FF    inc         ebx
 0009B500    dec         esi
>0009B501    jne         0009B4B3
 0009B503    mov         eax,dword ptr [ebp-0C]
 0009B506    mov         al,byte ptr [eax+2DC];TProgressBox.?f2DC:byte
 0009B50C    xor         al,1
 0009B50E    mov         byte ptr [ebp-5],al
 0009B511    call        00099890
 0009B516    xor         eax,eax
 0009B518    pop         edx
 0009B519    pop         ecx
 0009B51A    pop         ecx
 0009B51B    mov         dword ptr fs:[eax],edx
 0009B51E    push        9B533
 0009B523    mov         eax,dword ptr [ebp-0C]
 0009B526    call        TObject.Free
 0009B52B    ret
>0009B52C    jmp         @HandleFinally
>0009B531    jmp         0009B523
 0009B533    xor         eax,eax
 0009B535    pop         edx
 0009B536    pop         ecx
 0009B537    pop         ecx
 0009B538    mov         dword ptr fs:[eax],edx
 0009B53B    push        9B555
 0009B540    lea         eax,[ebp-14]
 0009B543    mov         edx,2
 0009B548    call        @LStrArrayClr
 0009B54D    ret
>0009B54E    jmp         @HandleFinally
>0009B553    jmp         0009B540
 0009B555    mov         al,byte ptr [ebp-5]
 0009B558    pop         esi
 0009B559    pop         ebx
 0009B55A    mov         esp,ebp
 0009B55C    pop         ebp
 0009B55D    ret
end;*}

//0009B560
{*procedure sub_0009B560(?:dword; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?);
begin
 0009B560    push        ebp
 0009B561    mov         ebp,esp
 0009B563    add         esp,0FFFFFFF0
 0009B566    push        ebx
 0009B567    push        esi
 0009B568    push        edi
 0009B569    xor         ebx,ebx
 0009B56B    mov         dword ptr [ebp-10],ebx
 0009B56E    mov         edi,ecx
 0009B570    mov         esi,edx
 0009B572    mov         dword ptr [ebp-4],eax
 0009B575    mov         ebx,dword ptr [ebp+14]
 0009B578    xor         eax,eax
 0009B57A    push        ebp
 0009B57B    push        9B8E1
 0009B580    push        dword ptr fs:[eax]
 0009B583    mov         dword ptr fs:[eax],esp
 0009B586    mov         eax,esi
 0009B588    call        @LStrClr
 0009B58D    mov         eax,edi
 0009B58F    call        @LStrClr
 0009B594    mov         eax,ebx
 0009B596    call        @LStrClr
 0009B59B    mov         eax,dword ptr [ebp+10]
 0009B59E    call        @LStrClr
 0009B5A3    mov         eax,dword ptr [ebp+0C]
 0009B5A6    call        @LStrClr
 0009B5AB    mov         eax,dword ptr [ebp+8]
 0009B5AE    call        @LStrClr
 0009B5B3    cmp         dword ptr ds:[0B6BAC],0;gvar_000B6BAC:Single
>0009B5BA    je          0009B8CB
 0009B5C0    mov         eax,dword ptr [ebp-4]
 0009B5C3    cmp         eax,dword ptr ds:[0B6BAC];gvar_000B6BAC:Single
>0009B5C9    jg          0009B8CB
 0009B5CF    mov         eax,dword ptr [ebp-4]
 0009B5D2    call        000981AC
 0009B5D7    mov         byte ptr [ebp-5],al
 0009B5DA    mov         al,byte ptr [ebp-5]
 0009B5DD    call        0007483C
 0009B5E2    movsx       eax,al
 0009B5E5    lea         edx,[ebp-10]
 0009B5E8    call        IntToStr
 0009B5ED    mov         edx,dword ptr [ebp-10]
 0009B5F0    mov         eax,esi
 0009B5F2    call        @LStrAsg
 0009B5F7    mov         eax,dword ptr [ebp-4]
 0009B5FA    cmp         eax,dword ptr ds:[0B6BAC];gvar_000B6BAC:Single
>0009B600    jge         0009B69D
 0009B606    mov         eax,dword ptr [ebp-4]
 0009B609    inc         eax
 0009B60A    call        000981AC
 0009B60F    mov         byte ptr [ebp-6],al
 0009B612    cmp         byte ptr ds:[0B6BC5],0;gvar_000B6BC5:Longint
>0009B619    jne         0009B65D
 0009B61B    mov         dl,byte ptr [ebp-6]
 0009B61E    mov         al,byte ptr [ebp-5]
 0009B621    call        00074860
 0009B626    movzx       eax,ax
 0009B629    lea         edx,[ebp-10]
 0009B62C    call        IntToStr
 0009B631    mov         edx,dword ptr [ebp-10]
 0009B634    mov         eax,edi
 0009B636    call        @LStrAsg
 0009B63B    mov         dl,byte ptr [ebp-6]
 0009B63E    mov         al,byte ptr [ebp-5]
 0009B641    call        0007484C
 0009B646    movsx       eax,ax
 0009B649    lea         edx,[ebp-10]
 0009B64C    call        IntToStr
 0009B651    mov         edx,dword ptr [ebp-10]
 0009B654    mov         eax,ebx
 0009B656    call        @LStrAsg
>0009B65B    jmp         0009B69D
 0009B65D    mov         dl,byte ptr [ebp-5]
 0009B660    mov         al,byte ptr [ebp-6]
 0009B663    call        00074860
 0009B668    movzx       eax,ax
 0009B66B    lea         edx,[ebp-10]
 0009B66E    call        IntToStr
 0009B673    mov         edx,dword ptr [ebp-10]
 0009B676    mov         eax,edi
 0009B678    call        @LStrAsg
 0009B67D    mov         dl,byte ptr [ebp-5]
 0009B680    mov         al,byte ptr [ebp-6]
 0009B683    call        0007484C
 0009B688    movsx       eax,ax
 0009B68B    lea         edx,[ebp-10]
 0009B68E    call        IntToStr
 0009B693    mov         edx,dword ptr [ebp-10]
 0009B696    mov         eax,ebx
 0009B698    call        @LStrAsg
 0009B69D    mov         eax,dword ptr [ebp-4]
 0009B6A0    add         eax,2
 0009B6A3    cmp         eax,dword ptr ds:[0B6BAC];gvar_000B6BAC:Single
>0009B6A9    jge         0009B7DA
 0009B6AF    call        000981AC
 0009B6B4    mov         byte ptr [ebp-7],al
 0009B6B7    mov         eax,dword ptr [ebp-4]
 0009B6BA    add         eax,3
 0009B6BD    call        000981AC
 0009B6C2    mov         byte ptr [ebp-8],al
 0009B6C5    cmp         byte ptr ds:[0B6BC5],0;gvar_000B6BC5:Longint
>0009B6CC    jne         0009B75A
 0009B6D2    mov         al,byte ptr [ebp-8]
 0009B6D5    push        eax
 0009B6D6    mov         cl,byte ptr [ebp-7]
 0009B6D9    mov         dl,byte ptr [ebp-6]
 0009B6DC    mov         al,byte ptr [ebp-5]
 0009B6DF    call        00074874
 0009B6E4    lea         edx,[ebp-10]
 0009B6E7    call        IntToStr
 0009B6EC    mov         edx,dword ptr [ebp-10]
 0009B6EF    mov         eax,dword ptr [ebp+10]
 0009B6F2    call        @LStrAsg
 0009B6F7    xor         eax,eax
 0009B6F9    push        ebp
 0009B6FA    push        9B73E
 0009B6FF    push        dword ptr fs:[eax]
 0009B702    mov         dword ptr fs:[eax],esp
 0009B705    mov         al,byte ptr [ebp-8]
 0009B708    push        eax
 0009B709    mov         cl,byte ptr [ebp-7]
 0009B70C    mov         dl,byte ptr [ebp-6]
 0009B70F    mov         al,byte ptr [ebp-5]
 0009B712    call        00074890
 0009B717    add         esp,0FFFFFFF4
 0009B71A    fstp        tbyte ptr [esp]
 0009B71D    wait
 0009B71E    lea         eax,[ebp-10]
 0009B721    call        FloatToStr
 0009B726    mov         edx,dword ptr [ebp-10]
 0009B729    mov         eax,dword ptr [ebp+0C]
 0009B72C    call        @LStrAsg
 0009B731    xor         eax,eax
 0009B733    pop         edx
 0009B734    pop         ecx
 0009B735    pop         ecx
 0009B736    mov         dword ptr fs:[eax],edx
>0009B739    jmp         0009B7DA
>0009B73E    jmp         @HandleAnyException
 0009B743    mov         eax,dword ptr [ebp+0C]
 0009B746    mov         edx,9B8FC;'INVALID'
 0009B74B    call        @LStrAsg
 0009B750    call        @DoneExcept
>0009B755    jmp         0009B7DA
 0009B75A    mov         al,byte ptr [ebp-5]
 0009B75D    push        eax
 0009B75E    mov         cl,byte ptr [ebp-6]
 0009B761    mov         dl,byte ptr [ebp-7]
 0009B764    mov         al,byte ptr [ebp-8]
 0009B767    call        00074874
 0009B76C    lea         edx,[ebp-10]
 0009B76F    call        IntToStr
 0009B774    mov         edx,dword ptr [ebp-10]
 0009B777    mov         eax,dword ptr [ebp+10]
 0009B77A    call        @LStrAsg
 0009B77F    xor         eax,eax
 0009B781    push        ebp
 0009B782    push        9B7C3
 0009B787    push        dword ptr fs:[eax]
 0009B78A    mov         dword ptr fs:[eax],esp
 0009B78D    mov         al,byte ptr [ebp-5]
 0009B790    push        eax
 0009B791    mov         cl,byte ptr [ebp-6]
 0009B794    mov         dl,byte ptr [ebp-7]
 0009B797    mov         al,byte ptr [ebp-8]
 0009B79A    call        00074890
 0009B79F    add         esp,0FFFFFFF4
 0009B7A2    fstp        tbyte ptr [esp]
 0009B7A5    wait
 0009B7A6    lea         eax,[ebp-10]
 0009B7A9    call        FloatToStr
 0009B7AE    mov         edx,dword ptr [ebp-10]
 0009B7B1    mov         eax,dword ptr [ebp+0C]
 0009B7B4    call        @LStrAsg
 0009B7B9    xor         eax,eax
 0009B7BB    pop         edx
 0009B7BC    pop         ecx
 0009B7BD    pop         ecx
 0009B7BE    mov         dword ptr fs:[eax],edx
>0009B7C1    jmp         0009B7DA
>0009B7C3    jmp         @HandleAnyException
 0009B7C8    mov         eax,dword ptr [ebp+0C]
 0009B7CB    mov         edx,9B8FC;'INVALID'
 0009B7D0    call        @LStrAsg
 0009B7D5    call        @DoneExcept
 0009B7DA    mov         esi,dword ptr [ebp-4]
 0009B7DD    add         esi,6
 0009B7E0    cmp         esi,dword ptr ds:[0B6BAC];gvar_000B6BAC:Single
>0009B7E6    jge         0009B8CB
 0009B7EC    mov         eax,dword ptr [ebp-4]
 0009B7EF    add         eax,4
 0009B7F2    call        000981AC
 0009B7F7    mov         ebx,eax
 0009B7F9    mov         eax,dword ptr [ebp-4]
 0009B7FC    add         eax,5
 0009B7FF    call        000981AC
 0009B804    mov         byte ptr [ebp-9],al
 0009B807    mov         eax,esi
 0009B809    call        000981AC
 0009B80E    mov         byte ptr [ebp-0A],al
 0009B811    mov         eax,dword ptr [ebp-4]
 0009B814    add         eax,7
 0009B817    call        000981AC
 0009B81C    mov         byte ptr [ebp-0B],al
 0009B81F    xor         eax,eax
 0009B821    push        ebp
 0009B822    push        9B8B4
 0009B827    push        dword ptr fs:[eax]
 0009B82A    mov         dword ptr fs:[eax],esp
 0009B82D    cmp         byte ptr ds:[0B6BC5],0;gvar_000B6BC5:Longint
>0009B834    jne         0009B871
 0009B836    mov         al,byte ptr [ebp-8]
 0009B839    push        eax
 0009B83A    push        ebx
 0009B83B    mov         al,byte ptr [ebp-9]
 0009B83E    push        eax
 0009B83F    mov         al,byte ptr [ebp-0A]
 0009B842    push        eax
 0009B843    mov         al,byte ptr [ebp-0B]
 0009B846    push        eax
 0009B847    mov         cl,byte ptr [ebp-7]
 0009B84A    mov         dl,byte ptr [ebp-6]
 0009B84D    mov         al,byte ptr [ebp-5]
 0009B850    call        000748B4
 0009B855    add         esp,0FFFFFFF4
 0009B858    fstp        tbyte ptr [esp]
 0009B85B    wait
 0009B85C    lea         eax,[ebp-10]
 0009B85F    call        FloatToStr
 0009B864    mov         edx,dword ptr [ebp-10]
 0009B867    mov         eax,dword ptr [ebp+8]
 0009B86A    call        @LStrAsg
>0009B86F    jmp         0009B8AA
 0009B871    push        ebx
 0009B872    mov         al,byte ptr [ebp-8]
 0009B875    push        eax
 0009B876    mov         al,byte ptr [ebp-7]
 0009B879    push        eax
 0009B87A    mov         al,byte ptr [ebp-6]
 0009B87D    push        eax
 0009B87E    mov         al,byte ptr [ebp-5]
 0009B881    push        eax
 0009B882    mov         cl,byte ptr [ebp-9]
 0009B885    mov         dl,byte ptr [ebp-0A]
 0009B888    mov         al,byte ptr [ebp-0B]
 0009B88B    call        000748B4
 0009B890    add         esp,0FFFFFFF4
 0009B893    fstp        tbyte ptr [esp]
 0009B896    wait
 0009B897    lea         eax,[ebp-10]
 0009B89A    call        FloatToStr
 0009B89F    mov         edx,dword ptr [ebp-10]
 0009B8A2    mov         eax,dword ptr [ebp+8]
 0009B8A5    call        @LStrAsg
 0009B8AA    xor         eax,eax
 0009B8AC    pop         edx
 0009B8AD    pop         ecx
 0009B8AE    pop         ecx
 0009B8AF    mov         dword ptr fs:[eax],edx
>0009B8B2    jmp         0009B8CB
>0009B8B4    jmp         @HandleAnyException
 0009B8B9    mov         eax,dword ptr [ebp+8]
 0009B8BC    mov         edx,9B8FC;'INVALID'
 0009B8C1    call        @LStrAsg
 0009B8C6    call        @DoneExcept
 0009B8CB    xor         eax,eax
 0009B8CD    pop         edx
 0009B8CE    pop         ecx
 0009B8CF    pop         ecx
 0009B8D0    mov         dword ptr fs:[eax],edx
 0009B8D3    push        9B8E8
 0009B8D8    lea         eax,[ebp-10]
 0009B8DB    call        @LStrClr
 0009B8E0    ret
>0009B8E1    jmp         @HandleFinally
>0009B8E6    jmp         0009B8D8
 0009B8E8    pop         edi
 0009B8E9    pop         esi
 0009B8EA    pop         ebx
 0009B8EB    mov         esp,ebp
 0009B8ED    pop         ebp
 0009B8EE    ret         10
end;*}

//0009B904
{*function sub_0009B904(?:?; ?:?):?;
begin
 0009B904    push        ebp
 0009B905    mov         ebp,esp
 0009B907    add         esp,0FFFFFEF0
 0009B90D    push        ebx
 0009B90E    push        esi
 0009B90F    push        edi
 0009B910    xor         ecx,ecx
 0009B912    mov         dword ptr [ebp-110],ecx
 0009B918    mov         ebx,edx
 0009B91A    mov         dword ptr [ebp-4],eax
 0009B91D    mov         eax,dword ptr [ebp-4]
 0009B920    call        @LStrAddRef
 0009B925    xor         eax,eax
 0009B927    push        ebp
 0009B928    push        9B9DE
 0009B92D    push        dword ptr fs:[eax]
 0009B930    mov         dword ptr fs:[eax],esp
 0009B933    mov         eax,ebx
 0009B935    call        @LStrClr
 0009B93A    mov         byte ptr [ebp-5],0
 0009B93E    mov         dword ptr [ebp-0C],100
 0009B945    mov         eax,dword ptr [ebp-4]
 0009B948    call        @LStrLen
 0009B94D    dec         eax
>0009B94E    jne         0009B95D
 0009B950    lea         eax,[ebp-4]
 0009B953    mov         edx,9B9F8;':'
 0009B958    call        @LStrCat
 0009B95D    xor         eax,eax
 0009B95F    push        ebp
 0009B960    push        9B9B3
 0009B965    push        dword ptr fs:[eax]
 0009B968    mov         dword ptr fs:[eax],esp
 0009B96B    lea         eax,[ebp-0C]
 0009B96E    push        eax
 0009B96F    lea         eax,[ebp-10C]
 0009B975    push        eax
 0009B976    mov         eax,dword ptr [ebp-4]
 0009B979    call        @LStrToPChar
 0009B97E    push        eax
 0009B97F    call        mpr.WNetGetConnectionA
 0009B984    lea         edx,[ebp-110]
 0009B98A    lea         eax,[ebp-10C]
 0009B990    call        StrPas
 0009B995    mov         edx,dword ptr [ebp-110]
 0009B99B    mov         eax,ebx
 0009B99D    call        @LStrAsg
 0009B9A2    cmp         dword ptr [ebx],0
 0009B9A5    setne       byte ptr [ebp-5]
 0009B9A9    xor         eax,eax
 0009B9AB    pop         edx
 0009B9AC    pop         ecx
 0009B9AD    pop         ecx
 0009B9AE    mov         dword ptr fs:[eax],edx
>0009B9B1    jmp         0009B9BD
>0009B9B3    jmp         @HandleAnyException
 0009B9B8    call        @DoneExcept
 0009B9BD    xor         eax,eax
 0009B9BF    pop         edx
 0009B9C0    pop         ecx
 0009B9C1    pop         ecx
 0009B9C2    mov         dword ptr fs:[eax],edx
 0009B9C5    push        9B9E5
 0009B9CA    lea         eax,[ebp-110]
 0009B9D0    call        @LStrClr
 0009B9D5    lea         eax,[ebp-4]
 0009B9D8    call        @LStrClr
 0009B9DD    ret
>0009B9DE    jmp         @HandleFinally
>0009B9E3    jmp         0009B9CA
 0009B9E5    mov         al,byte ptr [ebp-5]
 0009B9E8    pop         edi
 0009B9E9    pop         esi
 0009B9EA    pop         ebx
 0009B9EB    mov         esp,ebp
 0009B9ED    pop         ebp
 0009B9EE    ret
end;*}

//0009B9FC
{*function sub_0009B9FC(?:?):?;
begin
 0009B9FC    push        ebp
 0009B9FD    mov         ebp,esp
 0009B9FF    xor         ecx,ecx
 0009BA01    push        ecx
 0009BA02    push        ecx
 0009BA03    push        ecx
 0009BA04    push        ecx
 0009BA05    push        ebx
 0009BA06    mov         dword ptr [ebp-4],eax
 0009BA09    mov         eax,dword ptr [ebp-4]
 0009BA0C    call        @LStrAddRef
 0009BA11    xor         eax,eax
 0009BA13    push        ebp
 0009BA14    push        9BA9B
 0009BA19    push        dword ptr fs:[eax]
 0009BA1C    mov         dword ptr fs:[eax],esp
 0009BA1F    lea         edx,[ebp-8]
 0009BA22    mov         eax,dword ptr [ebp-4]
 0009BA25    call        ExtractFileDrive
 0009BA2A    cmp         dword ptr [ebp-8],0
>0009BA2E    jne         0009BA34
 0009BA30    xor         ebx,ebx
>0009BA32    jmp         0009BA80
 0009BA34    lea         eax,[ebp-10]
 0009BA37    push        eax
 0009BA38    mov         ecx,2
 0009BA3D    mov         edx,1
 0009BA42    mov         eax,dword ptr [ebp-8]
 0009BA45    call        @LStrCopy
 0009BA4A    mov         eax,dword ptr [ebp-10]
 0009BA4D    mov         edx,9BAB4;'\\'
 0009BA52    call        @LStrCmp
>0009BA57    jne         0009BA5D
 0009BA59    mov         bl,1
>0009BA5B    jmp         0009BA80
 0009BA5D    lea         eax,[ebp-10]
 0009BA60    push        eax
 0009BA61    mov         ecx,1
 0009BA66    mov         edx,1
 0009BA6B    mov         eax,dword ptr [ebp-8]
 0009BA6E    call        @LStrCopy
 0009BA73    mov         eax,dword ptr [ebp-10]
 0009BA76    lea         edx,[ebp-0C]
 0009BA79    call        0009B904
 0009BA7E    mov         ebx,eax
 0009BA80    xor         eax,eax
 0009BA82    pop         edx
 0009BA83    pop         ecx
 0009BA84    pop         ecx
 0009BA85    mov         dword ptr fs:[eax],edx
 0009BA88    push        9BAA2
 0009BA8D    lea         eax,[ebp-10]
 0009BA90    mov         edx,4
 0009BA95    call        @LStrArrayClr
 0009BA9A    ret
>0009BA9B    jmp         @HandleFinally
>0009BAA0    jmp         0009BA8D
 0009BAA2    mov         eax,ebx
 0009BAA4    pop         ebx
 0009BAA5    mov         esp,ebp
 0009BAA7    pop         ebp
 0009BAA8    ret
end;*}

Initialization
//0009BB38
{*
 0009BB38    push        ebp
 0009BB39    mov         ebp,esp
 0009BB3B    xor         eax,eax
 0009BB3D    push        ebp
 0009BB3E    push        9BB76
 0009BB43    push        dword ptr fs:[eax]
 0009BB46    mov         dword ptr fs:[eax],esp
 0009BB49    sub         dword ptr ds:[0B7014],1
>0009BB50    jae         0009BB68
 0009BB52    mov         dl,1
 0009BB54    mov         eax,[0009050C];TQSearch
 0009BB59    call        TQSearch.Create;TQSearch.Create
 0009BB5E    mov         [000B701C],eax;gvar_000B701C:TQSearch
 0009BB63    call        0009B3A4
 0009BB68    xor         eax,eax
 0009BB6A    pop         edx
 0009BB6B    pop         ecx
 0009BB6C    pop         ecx
 0009BB6D    mov         dword ptr fs:[eax],edx
 0009BB70    push        9BB7D
 0009BB75    ret
>0009BB76    jmp         @HandleFinally
>0009BB7B    jmp         0009BB75
 0009BB7D    pop         ebp
 0009BB7E    ret
*}
Finalization
//0009BAB8
{*
 0009BAB8    push        ebp
 0009BAB9    mov         ebp,esp
 0009BABB    xor         eax,eax
 0009BABD    push        ebp
 0009BABE    push        9BB2F
 0009BAC3    push        dword ptr fs:[eax]
 0009BAC6    mov         dword ptr fs:[eax],esp
 0009BAC9    inc         dword ptr ds:[0B7014]
>0009BACF    jne         0009BB21
 0009BAD1    mov         eax,[000B701C];gvar_000B701C:TQSearch
 0009BAD6    call        TObject.Free
 0009BADB    mov         eax,0B6CF8;gvar_000B6CF8:AnsiString
 0009BAE0    call        @LStrClr
 0009BAE5    mov         eax,0B6CF4;gvar_000B6CF4:AnsiString
 0009BAEA    call        @LStrClr
 0009BAEF    mov         eax,0B6BE4;gvar_000B6BE4:AnsiString
 0009BAF4    call        @LStrClr
 0009BAF9    mov         eax,0B6BC0;gvar_000B6BC0:AnsiString
 0009BAFE    call        @LStrClr
 0009BB03    mov         eax,0B6BBC;gvar_000B6BBC:AnsiString
 0009BB08    call        @LStrClr
 0009BB0D    mov         eax,0B6BB8;gvar_000B6BB8:AnsiString
 0009BB12    call        @LStrClr
 0009BB17    mov         eax,0B6B78;gvar_000B6B78:AnsiString
 0009BB1C    call        @LStrClr
 0009BB21    xor         eax,eax
 0009BB23    pop         edx
 0009BB24    pop         ecx
 0009BB25    pop         ecx
 0009BB26    mov         dword ptr fs:[eax],edx
 0009BB29    push        9BB36
 0009BB2E    ret
>0009BB2F    jmp         @HandleFinally
>0009BB34    jmp         0009BB2E
 0009BB36    pop         ebp
 0009BB37    ret
*}
end.