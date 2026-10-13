//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit68;

interface

uses
  SysUtils, Classes;

type
  TCMDynArray = class(TObject)
    constructor Create;//0009057C
  end;
  TQSearch = class(TObject)
  public
    f4:String;//f4
    f8:String;//f8
    constructor Create;//000906DC
  end;
    //function sub_000905C0(?:?; ?:?; ?:?):?;//000905C0
    //function sub_00090628(?:?; ?:?; ?:?):?;//00090628
    //function sub_00090684(?:?; ?:?):?;//00090684
    //procedure sub_0009078C(?:?);//0009078C
    //procedure sub_000908FC(?:?; ?:?; ?:?; ?:?; ?:?);//000908FC
    //function sub_000909EC(?:?; ?:?; ?:?):Boolean;//000909EC
    //function sub_00090A08(?:?; ?:?; ?:?):?;//00090A08
    //function sub_00090A60(?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?):?;//00090A60
    //function sub_00090B64(?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?):?;//00090B64

implementation

//0009057C
constructor TCMDynArray.Create;
begin
{*
 0009057C    push        ebx
 0009057D    push        esi
 0009057E    push        edi
 0009057F    test        dl,dl
>00090581    je          0009058B
 00090583    add         esp,0FFFFFFF0
 00090586    call        @ClassCreate
 0009058B    mov         esi,ecx
 0009058D    mov         ebx,edx
 0009058F    mov         edi,eax
 00090591    xor         edx,edx
 00090593    mov         eax,edi
 00090595    call        TObject.Create
 0009059A    mov         dword ptr [edi+4],esi
 0009059D    xor         eax,eax
 0009059F    mov         dword ptr [edi+0C],eax
 000905A2    mov         eax,edi
 000905A4    test        bl,bl
>000905A6    je          000905B7
 000905A8    call        @AfterConstruction
 000905AD    pop         dword ptr fs:[0]
 000905B4    add         esp,0C
 000905B7    mov         eax,edi
 000905B9    pop         edi
 000905BA    pop         esi
 000905BB    pop         ebx
 000905BC    ret
*}
end;

//000905C0
{*function sub_000905C0(?:?; ?:?; ?:?):?;
begin
 000905C0    push        ebp
 000905C1    mov         ebp,esp
 000905C3    push        ecx
 000905C4    push        ebx
 000905C5    push        esi
 000905C6    push        edi
 000905C7    mov         edi,edx
 000905C9    mov         ebx,eax
 000905CB    mov         byte ptr [ebp-1],0
 000905CF    mov         esi,ecx
 000905D1    mov         dword ptr [ebx+8],esi
 000905D4    test        esi,esi
>000905D6    jbe         00090615
 000905D8    xor         eax,eax
 000905DA    push        ebp
 000905DB    push        90609
 000905E0    push        dword ptr fs:[eax]
 000905E3    mov         dword ptr fs:[eax],esp
 000905E6    mov         eax,esi
 000905E8    imul        dword ptr [ebx+4]
 000905EB    call        @GetMem
 000905F0    mov         dword ptr [edi],eax
 000905F2    mov         eax,dword ptr [ebx+8]
 000905F5    imul        dword ptr [ebx+4]
 000905F8    mov         dword ptr [ebx+0C],eax
 000905FB    mov         byte ptr [ebp-1],1
 000905FF    xor         eax,eax
 00090601    pop         edx
 00090602    pop         ecx
 00090603    pop         ecx
 00090604    mov         dword ptr fs:[eax],edx
>00090607    jmp         0009061E
>00090609    jmp         @HandleAnyException
 0009060E    call        @DoneExcept
>00090613    jmp         0009061E
 00090615    xor         eax,eax
 00090617    mov         dword ptr [edi],eax
 00090619    xor         eax,eax
 0009061B    mov         dword ptr [ebx+8],eax
 0009061E    mov         al,byte ptr [ebp-1]
 00090621    pop         edi
 00090622    pop         esi
 00090623    pop         ebx
 00090624    pop         ecx
 00090625    pop         ebp
 00090626    ret
end;*}

//00090628
{*function sub_00090628(?:?; ?:?; ?:?):?;
begin
 00090628    push        ebp
 00090629    mov         ebp,esp
 0009062B    push        ecx
 0009062C    push        ebx
 0009062D    push        esi
 0009062E    push        edi
 0009062F    mov         esi,ecx
 00090631    mov         ebx,eax
 00090633    mov         byte ptr [ebp-1],0
 00090637    test        esi,esi
>00090639    jb          00090679
 0009063B    xor         ecx,ecx
 0009063D    push        ebp
 0009063E    push        9066F
 00090643    push        dword ptr fs:[ecx]
 00090646    mov         dword ptr fs:[ecx],esp
 00090649    mov         eax,edx
 0009064B    mov         edx,dword ptr [ebx+4]
 0009064E    imul        edx,esi
 00090651    call        @ReallocMem
 00090656    mov         eax,esi
 00090658    mov         dword ptr [ebx+8],eax
 0009065B    imul        dword ptr [ebx+4]
 0009065E    mov         dword ptr [ebx+0C],eax
 00090661    mov         byte ptr [ebp-1],1
 00090665    xor         eax,eax
 00090667    pop         edx
 00090668    pop         ecx
 00090669    pop         ecx
 0009066A    mov         dword ptr fs:[eax],edx
>0009066D    jmp         00090679
>0009066F    jmp         @HandleAnyException
 00090674    call        @DoneExcept
 00090679    mov         al,byte ptr [ebp-1]
 0009067C    pop         edi
 0009067D    pop         esi
 0009067E    pop         ebx
 0009067F    pop         ecx
 00090680    pop         ebp
 00090681    ret
end;*}

//00090684
{*function sub_00090684(?:?; ?:?):?;
begin
 00090684    push        ebp
 00090685    mov         ebp,esp
 00090687    push        ecx
 00090688    push        ebx
 00090689    push        esi
 0009068A    push        edi
 0009068B    mov         esi,edx
 0009068D    mov         ebx,eax
 0009068F    mov         byte ptr [ebp-1],0
 00090693    xor         eax,eax
 00090695    push        ebp
 00090696    push        906C6
 0009069B    push        dword ptr fs:[eax]
 0009069E    mov         dword ptr fs:[eax],esp
 000906A1    mov         edx,dword ptr [ebx+8]
 000906A4    imul        edx,dword ptr [ebx+4]
 000906A8    mov         eax,dword ptr [esi]
 000906AA    call        @FreeMem
 000906AF    xor         eax,eax
 000906B1    mov         dword ptr [ebx+0C],eax
 000906B4    xor         eax,eax
 000906B6    mov         dword ptr [esi],eax
 000906B8    mov         byte ptr [ebp-1],1
 000906BC    xor         eax,eax
 000906BE    pop         edx
 000906BF    pop         ecx
 000906C0    pop         ecx
 000906C1    mov         dword ptr fs:[eax],edx
>000906C4    jmp         000906D0
>000906C6    jmp         @HandleAnyException
 000906CB    call        @DoneExcept
 000906D0    mov         al,byte ptr [ebp-1]
 000906D3    pop         edi
 000906D4    pop         esi
 000906D5    pop         ebx
 000906D6    pop         ecx
 000906D7    pop         ebp
 000906D8    ret
end;*}

//000906DC
constructor TQSearch.Create;
begin
{*
 000906DC    push        ebp
 000906DD    mov         ebp,esp
 000906DF    push        0
 000906E1    push        0
 000906E3    push        0
 000906E5    push        ebx
 000906E6    push        esi
 000906E7    test        dl,dl
>000906E9    je          000906F3
 000906EB    add         esp,0FFFFFFF0
 000906EE    call        @ClassCreate
 000906F3    mov         byte ptr [ebp-1],dl
 000906F6    mov         esi,eax
 000906F8    xor         eax,eax
 000906FA    push        ebp
 000906FB    push        90763
 00090700    push        dword ptr fs:[eax]
 00090703    mov         dword ptr fs:[eax],esp
 00090706    xor         edx,edx
 00090708    mov         eax,esi
 0009070A    call        TObject.Create
 0009070F    xor         ebx,ebx
 00090711    lea         eax,[ebp-0C]
 00090714    mov         edx,ebx
 00090716    call        @LStrFromChar
 0009071B    mov         eax,dword ptr [ebp-0C]
 0009071E    lea         edx,[ebp-8]
 00090721    call        AnsiUpperCase
 00090726    mov         eax,dword ptr [ebp-8]
 00090729    mov         al,byte ptr [eax]
 0009072B    xor         edx,edx
 0009072D    mov         dl,bl
 0009072F    mov         byte ptr [esi+edx+814],al
 00090736    inc         ebx
 00090737    test        bl,bl
>00090739    jne         00090711
 0009073B    lea         eax,[esi+4]
 0009073E    call        @LStrClr
 00090743    xor         eax,eax
 00090745    mov         dword ptr [esi+0C],eax
 00090748    xor         eax,eax
 0009074A    pop         edx
 0009074B    pop         ecx
 0009074C    pop         ecx
 0009074D    mov         dword ptr fs:[eax],edx
 00090750    push        9076A
 00090755    lea         eax,[ebp-0C]
 00090758    mov         edx,2
 0009075D    call        @LStrArrayClr
 00090762    ret
>00090763    jmp         @HandleFinally
>00090768    jmp         00090755
 0009076A    mov         eax,esi
 0009076C    cmp         byte ptr [ebp-1],0
>00090770    je          00090781
 00090772    call        @AfterConstruction
 00090777    pop         dword ptr fs:[0]
 0009077E    add         esp,0C
 00090781    mov         eax,esi
 00090783    pop         esi
 00090784    pop         ebx
 00090785    mov         esp,ebp
 00090787    pop         ebp
 00090788    ret
*}
end;

//0009078C
{*procedure sub_0009078C(?:?);
begin
 0009078C    push        ebp
 0009078D    mov         ebp,esp
 0009078F    push        0
 00090791    push        ebx
 00090792    push        esi
 00090793    push        edi
 00090794    mov         ebx,eax
 00090796    xor         eax,eax
 00090798    push        ebp
 00090799    push        908ED
 0009079E    push        dword ptr fs:[eax]
 000907A1    mov         dword ptr fs:[eax],esp
 000907A4    cmp         byte ptr [ebx+10],0
>000907A8    jne         000907B5
 000907AA    lea         edx,[ebp-4]
 000907AD    mov         eax,dword ptr [ebx+4]
 000907B0    call        AnsiLowerCase
 000907B5    mov         eax,dword ptr [ebx+0C]
 000907B8    mov         edx,eax
 000907BA    inc         edx
 000907BB    cmp         byte ptr [ebx+11],0
>000907BF    je          000907E4
>000907C1    jmp         000907D8
 000907C3    mov         ecx,dword ptr [ebx+4]
 000907C6    mov         cl,byte ptr [ecx+eax-1]
 000907CA    cmp         cl,byte ptr [ebx+12]
>000907CD    jne         000907D7
 000907CF    mov         edx,dword ptr [ebx+0C]
 000907D2    sub         edx,eax
 000907D4    inc         edx
>000907D5    jmp         000907D8
 000907D7    dec         eax
 000907D8    test        eax,eax
>000907DA    jle         000907E4
 000907DC    mov         ecx,dword ptr [ebx+0C]
 000907DF    inc         ecx
 000907E0    cmp         edx,ecx
>000907E2    je          000907C3
 000907E4    xor         eax,eax
 000907E6    xor         ecx,ecx
 000907E8    mov         cl,al
 000907EA    mov         dword ptr [ebx+ecx*4+14],edx
 000907EE    inc         eax
 000907EF    cmp         eax,100
>000907F4    jne         000907E6
 000907F6    mov         esi,dword ptr [ebx+0C]
 000907F9    test        esi,esi
>000907FB    jle         0009084E
 000907FD    mov         eax,1
 00090802    mov         ecx,dword ptr [ebx+0C]
 00090805    sub         ecx,eax
 00090807    inc         ecx
 00090808    cmp         edx,ecx
>0009080A    jle         0009084A
 0009080C    cmp         byte ptr [ebx+10],0
>00090810    je          00090826
 00090812    mov         ecx,dword ptr [ebx+0C]
 00090815    sub         ecx,eax
 00090817    inc         ecx
 00090818    mov         edi,dword ptr [ebx+4]
 0009081B    movzx       edi,byte ptr [edi+eax-1]
 00090820    mov         dword ptr [ebx+edi*4+14],ecx
>00090824    jmp         0009084A
 00090826    mov         ecx,dword ptr [ebx+0C]
 00090829    sub         ecx,eax
 0009082B    inc         ecx
 0009082C    mov         edi,dword ptr [ebx+8]
 0009082F    movzx       edi,byte ptr [edi+eax-1]
 00090834    mov         dword ptr [ebx+edi*4+14],ecx
 00090838    mov         ecx,dword ptr [ebx+0C]
 0009083B    sub         ecx,eax
 0009083D    inc         ecx
 0009083E    mov         edi,dword ptr [ebp-4]
 00090841    movzx       edi,byte ptr [edi+eax-1]
 00090846    mov         dword ptr [ebx+edi*4+14],ecx
 0009084A    inc         eax
 0009084B    dec         esi
>0009084C    jne         00090802
 0009084E    mov         edx,dword ptr [ebx+0C]
 00090851    inc         edx
 00090852    cmp         byte ptr [ebx+11],0
>00090856    je          0009087C
 00090858    mov         eax,1
>0009085D    jmp         00090870
 0009085F    mov         ecx,dword ptr [ebx+4]
 00090862    mov         cl,byte ptr [ecx+eax-1]
 00090866    cmp         cl,byte ptr [ebx+12]
>00090869    jne         0009086F
 0009086B    mov         edx,eax
>0009086D    jmp         00090870
 0009086F    inc         eax
 00090870    mov         esi,dword ptr [ebx+0C]
 00090873    cmp         eax,esi
>00090875    jg          0009087C
 00090877    inc         esi
 00090878    cmp         edx,esi
>0009087A    je          0009085F
 0009087C    xor         eax,eax
 0009087E    xor         ecx,ecx
 00090880    mov         cl,al
 00090882    mov         dword ptr [ebx+ecx*4+414],edx
 00090889    inc         eax
 0009088A    cmp         eax,100
>0009088F    jne         0009087E
 00090891    mov         eax,dword ptr [ebx+0C]
 00090894    cmp         eax,1
>00090897    jl          000908D7
 00090899    cmp         edx,eax
>0009089B    jle         000908D2
 0009089D    cmp         byte ptr [ebx+10],0
>000908A1    je          000908B4
 000908A3    mov         ecx,dword ptr [ebx+4]
 000908A6    movzx       ecx,byte ptr [ecx+eax-1]
 000908AB    mov         dword ptr [ebx+ecx*4+414],eax
>000908B2    jmp         000908D2
 000908B4    mov         ecx,dword ptr [ebx+8]
 000908B7    movzx       ecx,byte ptr [ecx+eax-1]
 000908BC    mov         dword ptr [ebx+ecx*4+414],eax
 000908C3    mov         ecx,dword ptr [ebp-4]
 000908C6    movzx       ecx,byte ptr [ecx+eax-1]
 000908CB    mov         dword ptr [ebx+ecx*4+414],eax
 000908D2    dec         eax
 000908D3    test        eax,eax
>000908D5    jne         00090899
 000908D7    xor         eax,eax
 000908D9    pop         edx
 000908DA    pop         ecx
 000908DB    pop         ecx
 000908DC    mov         dword ptr fs:[eax],edx
 000908DF    push        908F4
 000908E4    lea         eax,[ebp-4]
 000908E7    call        @LStrClr
 000908EC    ret
>000908ED    jmp         @HandleFinally
>000908F2    jmp         000908E4
 000908F4    pop         edi
 000908F5    pop         esi
 000908F6    pop         ebx
 000908F7    pop         ecx
 000908F8    pop         ebp
 000908F9    ret
end;*}

//000908FC
{*procedure sub_000908FC(?:?; ?:?; ?:?; ?:?; ?:?);
begin
 000908FC    push        ebp
 000908FD    mov         ebp,esp
 000908FF    push        0
 00090901    push        ebx
 00090902    push        esi
 00090903    push        edi
 00090904    mov         ebx,ecx
 00090906    mov         esi,edx
 00090908    mov         edi,eax
 0009090A    xor         eax,eax
 0009090C    push        ebp
 0009090D    push        909DB
 00090912    push        dword ptr fs:[eax]
 00090915    mov         dword ptr fs:[eax],esp
 00090918    mov         eax,esi
 0009091A    call        @LStrLen
 0009091F    mov         dword ptr [edi+0C],eax
 00090922    lea         eax,[edi+4]
 00090925    mov         edx,esi
 00090927    call        @LStrAsg
 0009092C    mov         byte ptr [edi+10],bl
 0009092F    mov         al,byte ptr [ebp+0C]
 00090932    mov         byte ptr [edi+11],al
 00090935    mov         al,byte ptr [ebp+8]
 00090938    mov         byte ptr [edi+12],al
 0009093B    cmp         byte ptr [edi+10],0
>0009093F    jne         00090956
 00090941    lea         edx,[ebp-4]
 00090944    mov         eax,esi
 00090946    call        AnsiUpperCase
 0009094B    mov         edx,dword ptr [ebp-4]
 0009094E    lea         eax,[edi+8]
 00090951    call        @LStrAsg
 00090956    xor         eax,eax
 00090958    mov         al,byte ptr [edi+10]
 0009095B    add         eax,eax
 0009095D    lea         eax,[eax+eax*4]
 00090960    xor         edx,edx
 00090962    mov         dl,byte ptr [edi+11]
 00090965    add         eax,edx
 00090967    sub         eax,1
>0009096A    jb          00090978
>0009096C    je          0009098A
 0009096E    sub         eax,9
>00090971    je          0009099C
 00090973    dec         eax
>00090974    je          000909AE
>00090976    jmp         000909BE
 00090978    mov         dword ptr [edi+918],edi
 0009097E    mov         dword ptr [edi+914],909EC;sub_000909EC
>00090988    jmp         000909BE
 0009098A    mov         dword ptr [edi+918],edi
 00090990    mov         dword ptr [edi+914],90A08;sub_00090A08
>0009099A    jmp         000909BE
 0009099C    mov         dword ptr [edi+918],edi
 000909A2    mov         dword ptr [edi+914],90A34
>000909AC    jmp         000909BE
 000909AE    mov         dword ptr [edi+918],edi
 000909B4    mov         dword ptr [edi+914],90A40
 000909BE    mov         eax,edi
 000909C0    call        0009078C
 000909C5    xor         eax,eax
 000909C7    pop         edx
 000909C8    pop         ecx
 000909C9    pop         ecx
 000909CA    mov         dword ptr fs:[eax],edx
 000909CD    push        909E2
 000909D2    lea         eax,[ebp-4]
 000909D5    call        @LStrClr
 000909DA    ret
>000909DB    jmp         @HandleFinally
>000909E0    jmp         000909D2
 000909E2    pop         edi
 000909E3    pop         esi
 000909E4    pop         ebx
 000909E5    pop         ecx
 000909E6    pop         ebp
 000909E7    ret         8
end;*}

//000909EC
{*function sub_000909EC(?:?; ?:?; ?:?):Boolean;
begin
 000909EC    push        ebx
 000909ED    mov         ebx,dword ptr [eax+8]
 000909F0    mov         cl,byte ptr [ebx+ecx-1]
 000909F4    and         edx,0FF
 000909FA    cmp         cl,byte ptr [eax+edx+814]
 00090A01    sete        al
 00090A04    pop         ebx
 00090A05    ret
end;*}

//00090A08
{*function sub_00090A08(?:?; ?:?; ?:?):?;
begin
 00090A08    push        ebx
 00090A09    mov         ebx,dword ptr [eax+4]
 00090A0C    mov         bl,byte ptr [ebx+ecx-1]
 00090A10    cmp         bl,byte ptr [eax+12]
>00090A13    je          00090A2F
 00090A15    and         edx,0FF
 00090A1B    mov         dl,byte ptr [eax+edx+814]
 00090A22    mov         eax,dword ptr [eax+8]
 00090A25    cmp         dl,byte ptr [eax+ecx-1]
>00090A29    je          00090A2F
 00090A2B    xor         eax,eax
 00090A2D    pop         ebx
 00090A2E    ret
 00090A2F    mov         al,1
 00090A31    pop         ebx
 00090A32    ret
end;*}

//00090A60
{*function sub_00090A60(?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?):?;
begin
 00090A60    push        ebp
 00090A61    mov         ebp,esp
 00090A63    add         esp,0FFFFFFF0
 00090A66    push        ebx
 00090A67    push        esi
 00090A68    push        edi
 00090A69    mov         edi,ecx
 00090A6B    mov         esi,edx
 00090A6D    mov         dword ptr [ebp-4],eax
 00090A70    mov         ebx,dword ptr [ebp+18]
 00090A73    mov         eax,esi
 00090A75    call        @LStrLen
 00090A7A    test        eax,eax
>00090A7C    jne         00090A8A
 00090A7E    mov         dword ptr [ebp-8],0FFFFFFFE
>00090A85    jmp         00090B55
 00090A8A    mov         dword ptr [ebp-8],0FFFFFFFF
 00090A91    mov         eax,esi
 00090A93    mov         edx,dword ptr [ebp-4]
 00090A96    mov         edx,dword ptr [edx+4]
 00090A99    call        @LStrCmp
>00090A9E    jne         00090ABE
 00090AA0    mov         eax,dword ptr [ebp-4]
 00090AA3    cmp         bl,byte ptr [eax+10]
>00090AA6    jne         00090ABE
 00090AA8    mov         eax,dword ptr [ebp-4]
 00090AAB    mov         al,byte ptr [eax+11]
 00090AAE    cmp         al,byte ptr [ebp+14]
>00090AB1    jne         00090ABE
 00090AB3    mov         eax,dword ptr [ebp-4]
 00090AB6    mov         al,byte ptr [eax+12]
 00090AB9    cmp         al,byte ptr [ebp+10]
>00090ABC    je          00090AD2
 00090ABE    mov         al,byte ptr [ebp+14]
 00090AC1    push        eax
 00090AC2    mov         al,byte ptr [ebp+10]
 00090AC5    push        eax
 00090AC6    mov         ecx,ebx
 00090AC8    mov         edx,esi
 00090ACA    mov         eax,dword ptr [ebp-4]
 00090ACD    call        000908FC
 00090AD2    mov         dword ptr [ebp-10],edi
 00090AD5    mov         eax,dword ptr [ebp-4]
 00090AD8    mov         eax,dword ptr [eax+0C]
 00090ADB    add         eax,dword ptr [ebp+20]
 00090ADE    dec         eax
 00090ADF    mov         dword ptr [ebp-0C],eax
 00090AE2    mov         eax,dword ptr [ebp-0C]
 00090AE5    cmp         eax,dword ptr [ebp+1C]
>00090AE8    jg          00090B55
 00090AEA    mov         esi,dword ptr [ebp-0C]
 00090AED    mov         eax,dword ptr [ebp-4]
 00090AF0    mov         ebx,dword ptr [eax+0C]
>00090AF3    jmp         00090AF7
 00090AF5    dec         ebx
 00090AF6    dec         esi
 00090AF7    test        ebx,ebx
>00090AF9    jle         00090B17
 00090AFB    mov         eax,dword ptr [ebp-10]
 00090AFE    mov         dl,byte ptr [eax+esi-1]
 00090B02    mov         edi,dword ptr [ebp-4]
 00090B05    mov         ecx,ebx
 00090B07    mov         eax,dword ptr [edi+918]
 00090B0D    call        dword ptr [edi+914]
 00090B13    test        al,al
>00090B15    jne         00090AF5
 00090B17    test        ebx,ebx
>00090B19    jne         00090B21
 00090B1B    inc         esi
 00090B1C    mov         dword ptr [ebp-8],esi
>00090B1F    jmp         00090B55
 00090B21    mov         eax,dword ptr [ebp-10]
 00090B24    mov         edx,dword ptr [ebp-0C]
 00090B27    movzx       eax,byte ptr [eax+edx]
 00090B2B    mov         edx,dword ptr [ebp-4]
 00090B2E    mov         eax,dword ptr [edx+eax*4+14]
 00090B32    add         dword ptr [ebp-0C],eax
 00090B35    mov         edx,dword ptr [ebp+8]
 00090B38    mov         eax,dword ptr [ebp-0C]
 00090B3B    call        dword ptr [ebp+0C]
 00090B3E    mov         eax,dword ptr [ebp+8]
 00090B41    cmp         byte ptr [eax],0
>00090B44    je          00090B4D
 00090B46    mov         eax,dword ptr [ebp+1C]
 00090B49    inc         eax
 00090B4A    mov         dword ptr [ebp-0C],eax
 00090B4D    mov         eax,dword ptr [ebp-0C]
 00090B50    cmp         eax,dword ptr [ebp+1C]
>00090B53    jle         00090AEA
 00090B55    mov         eax,dword ptr [ebp-8]
 00090B58    pop         edi
 00090B59    pop         esi
 00090B5A    pop         ebx
 00090B5B    mov         esp,ebp
 00090B5D    pop         ebp
 00090B5E    ret         1C
end;*}

//00090B64
{*function sub_00090B64(?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?; ?:?):?;
begin
 00090B64    push        ebp
 00090B65    mov         ebp,esp
 00090B67    add         esp,0FFFFFFEC
 00090B6A    push        ebx
 00090B6B    push        esi
 00090B6C    push        edi
 00090B6D    mov         edi,ecx
 00090B6F    mov         esi,edx
 00090B71    mov         dword ptr [ebp-4],eax
 00090B74    mov         ebx,dword ptr [ebp+18]
 00090B77    mov         eax,esi
 00090B79    call        @LStrLen
 00090B7E    test        eax,eax
>00090B80    jne         00090B8E
 00090B82    mov         dword ptr [ebp-8],0FFFFFFFE
>00090B89    jmp         00090C69
 00090B8E    mov         dword ptr [ebp-8],0FFFFFFFF
 00090B95    mov         eax,esi
 00090B97    mov         edx,dword ptr [ebp-4]
 00090B9A    mov         edx,dword ptr [edx+4]
 00090B9D    call        @LStrCmp
>00090BA2    jne         00090BC2
 00090BA4    mov         eax,dword ptr [ebp-4]
 00090BA7    cmp         bl,byte ptr [eax+10]
>00090BAA    jne         00090BC2
 00090BAC    mov         eax,dword ptr [ebp-4]
 00090BAF    mov         al,byte ptr [eax+11]
 00090BB2    cmp         al,byte ptr [ebp+14]
>00090BB5    jne         00090BC2
 00090BB7    mov         eax,dword ptr [ebp-4]
 00090BBA    mov         al,byte ptr [eax+12]
 00090BBD    cmp         al,byte ptr [ebp+10]
>00090BC0    je          00090BD6
 00090BC2    mov         al,byte ptr [ebp+14]
 00090BC5    push        eax
 00090BC6    mov         al,byte ptr [ebp+10]
 00090BC9    push        eax
 00090BCA    mov         ecx,ebx
 00090BCC    mov         edx,esi
 00090BCE    mov         eax,dword ptr [ebp-4]
 00090BD1    call        000908FC
 00090BD6    mov         dword ptr [ebp-14],edi
 00090BD9    mov         eax,dword ptr [ebp+1C]
 00090BDC    mov         dword ptr [ebp-0C],eax
 00090BDF    mov         eax,dword ptr [ebp-4]
 00090BE2    mov         eax,dword ptr [eax+0C]
 00090BE5    add         eax,dword ptr [ebp+20]
 00090BE8    dec         eax
 00090BE9    mov         dword ptr [ebp-10],eax
 00090BEC    mov         eax,dword ptr [ebp-0C]
 00090BEF    cmp         eax,dword ptr [ebp-10]
>00090BF2    jl          00090C69
 00090BF4    mov         esi,dword ptr [ebp-0C]
 00090BF7    mov         eax,dword ptr [ebp-4]
 00090BFA    mov         ebx,dword ptr [eax+0C]
>00090BFD    jmp         00090C01
 00090BFF    dec         ebx
 00090C00    dec         esi
 00090C01    test        ebx,ebx
>00090C03    jle         00090C21
 00090C05    mov         eax,dword ptr [ebp-14]
 00090C08    mov         dl,byte ptr [eax+esi-1]
 00090C0C    mov         edi,dword ptr [ebp-4]
 00090C0F    mov         ecx,ebx
 00090C11    mov         eax,dword ptr [edi+918]
 00090C17    call        dword ptr [edi+914]
 00090C1D    test        al,al
>00090C1F    jne         00090BFF
 00090C21    test        ebx,ebx
>00090C23    jne         00090C2B
 00090C25    inc         esi
 00090C26    mov         dword ptr [ebp-8],esi
>00090C29    jmp         00090C69
 00090C2B    mov         eax,dword ptr [ebp-4]
 00090C2E    mov         edx,dword ptr [ebp-0C]
 00090C31    sub         edx,dword ptr [eax+0C]
 00090C34    mov         eax,dword ptr [ebp-14]
 00090C37    movzx       eax,byte ptr [eax+edx-1]
 00090C3C    mov         edx,dword ptr [ebp-4]
 00090C3F    mov         eax,dword ptr [edx+eax*4+414]
 00090C46    sub         dword ptr [ebp-0C],eax
 00090C49    mov         edx,dword ptr [ebp+8]
 00090C4C    mov         eax,dword ptr [ebp-0C]
 00090C4F    call        dword ptr [ebp+0C]
 00090C52    mov         eax,dword ptr [ebp+8]
 00090C55    cmp         byte ptr [eax],0
>00090C58    je          00090C61
 00090C5A    mov         eax,dword ptr [ebp+20]
 00090C5D    dec         eax
 00090C5E    mov         dword ptr [ebp-0C],eax
 00090C61    mov         eax,dword ptr [ebp-0C]
 00090C64    cmp         eax,dword ptr [ebp-10]
>00090C67    jge         00090BF4
 00090C69    mov         eax,dword ptr [ebp-8]
 00090C6C    pop         edi
 00090C6D    pop         esi
 00090C6E    pop         ebx
 00090C6F    mov         esp,ebp
 00090C71    pop         ebp
 00090C72    ret         1C
end;*}

end.