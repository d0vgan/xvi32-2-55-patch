//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit63;

interface

uses
  SysUtils, Classes;

    //procedure sub_0008E4DC(?:Integer; ?:?);//0008E4DC

implementation

//0008E4DC
{*procedure sub_0008E4DC(?:Integer; ?:?);
begin
 0008E4DC    push        ebp
 0008E4DD    mov         ebp,esp
 0008E4DF    push        0
 0008E4E1    push        0
 0008E4E3    push        ebx
 0008E4E4    push        esi
 0008E4E5    mov         esi,edx
 0008E4E7    mov         ebx,eax
 0008E4E9    xor         eax,eax
 0008E4EB    push        ebp
 0008E4EC    push        8E553
 0008E4F1    push        dword ptr fs:[eax]
 0008E4F4    mov         dword ptr fs:[eax],esp
 0008E4F7    cmp         ebx,0DC
>0008E4FD    jge         0008E531
 0008E4FF    push        8E568;'Error '
 0008E504    lea         edx,[ebp-4]
 0008E507    mov         eax,ebx
 0008E509    call        IntToStr
 0008E50E    push        dword ptr [ebp-4]
 0008E511    push        8E578;': '
 0008E516    lea         edx,[ebp-8]
 0008E519    mov         eax,ebx
 0008E51B    call        LoadStr
 0008E520    push        dword ptr [ebp-8]
 0008E523    mov         eax,esi
 0008E525    mov         edx,4
 0008E52A    call        @LStrCatN
>0008E52F    jmp         0008E538
 0008E531    mov         eax,esi
 0008E533    call        @LStrClr
 0008E538    xor         eax,eax
 0008E53A    pop         edx
 0008E53B    pop         ecx
 0008E53C    pop         ecx
 0008E53D    mov         dword ptr fs:[eax],edx
 0008E540    push        8E55A
 0008E545    lea         eax,[ebp-8]
 0008E548    mov         edx,2
 0008E54D    call        @LStrArrayClr
 0008E552    ret
>0008E553    jmp         @HandleFinally
>0008E558    jmp         0008E545
 0008E55A    pop         esi
 0008E55B    pop         ebx
 0008E55C    pop         ecx
 0008E55D    pop         ecx
 0008E55E    pop         ebp
 0008E55F    ret
end;*}

Initialization
//0008E5B8
{*
 0008E5B8    push        ebp
 0008E5B9    mov         ebp,esp
 0008E5BB    add         esp,0FFFFFF00
 0008E5C1    sub         dword ptr ds:[0B6B10],1
>0008E5C8    jae         0008E5FB
 0008E5CA    lea         eax,[ebp-100]
 0008E5D0    mov         edx,dword ptr ds:[0B5824];^gvar_000B6500
 0008E5D6    mov         edx,dword ptr [edx]
 0008E5D8    mov         ecx,0FF
 0008E5DD    call        @LStrToString
 0008E5E2    lea         edx,[ebp-100]
 0008E5E8    mov         eax,0B6B04;gvar_000B6B04:PShortString
 0008E5ED    mov         cl,0A
 0008E5EF    call        @PStrNCpy
 0008E5F4    mov         byte ptr ds:[0B6B0F],0;gvar_000B6B0F
 0008E5FB    mov         esp,ebp
 0008E5FD    pop         ebp
 0008E5FE    ret
*}
Finalization
//0008E57C
{*
 0008E57C    push        ebp
 0008E57D    mov         ebp,esp
 0008E57F    xor         eax,eax
 0008E581    push        ebp
 0008E582    push        8E5AD
 0008E587    push        dword ptr fs:[eax]
 0008E58A    mov         dword ptr fs:[eax],esp
 0008E58D    inc         dword ptr ds:[0B6B10]
>0008E593    jne         0008E59F
 0008E595    mov         eax,0B55A0;^'chmaas@handshake.de'
 0008E59A    call        @LStrClr
 0008E59F    xor         eax,eax
 0008E5A1    pop         edx
 0008E5A2    pop         ecx
 0008E5A3    pop         ecx
 0008E5A4    mov         dword ptr fs:[eax],edx
 0008E5A7    push        8E5B4
 0008E5AC    ret
>0008E5AD    jmp         @HandleFinally
>0008E5B2    jmp         0008E5AC
 0008E5B4    pop         ebp
 0008E5B5    ret
*}
end.