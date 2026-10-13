//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit49;

interface

uses
  SysUtils, Classes;


implementation

Initialization
Finalization
//0007CA48
{*
 0007CA48    push        ebp
 0007CA49    mov         ebp,esp
 0007CA4B    xor         eax,eax
 0007CA4D    push        ebp
 0007CA4E    push        7CA84
 0007CA53    push        dword ptr fs:[eax]
 0007CA56    mov         dword ptr fs:[eax],esp
 0007CA59    inc         dword ptr ds:[0B6AB8]
>0007CA5F    jne         0007CA76
 0007CA61    mov         eax,0B4E00;^'Unknown'
 0007CA66    mov         ecx,1E
 0007CA6B    mov         edx,dword ptr ds:[110CC];String
 0007CA71    call        @FinalizeArray
 0007CA76    xor         eax,eax
 0007CA78    pop         edx
 0007CA79    pop         ecx
 0007CA7A    pop         ecx
 0007CA7B    mov         dword ptr fs:[eax],edx
 0007CA7E    push        7CA8B
 0007CA83    ret
>0007CA84    jmp         @HandleFinally
>0007CA89    jmp         0007CA83
 0007CA8B    pop         ebp
 0007CA8C    ret
*}
end.