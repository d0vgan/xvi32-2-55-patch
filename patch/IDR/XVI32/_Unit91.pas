//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit91;

interface

uses
  SysUtils, Classes;

    //procedure sub_000A3248(?:?);//000A3248
    //function sub_000A32E4:?;//000A32E4

implementation

//000A3248
{*procedure sub_000A3248(?:?);
begin
 000A3248    push        ebp
 000A3249    mov         ebp,esp
 000A324B    push        ecx
 000A324C    push        ebx
 000A324D    push        esi
 000A324E    push        edi
 000A324F    mov         dword ptr [ebp-4],eax
 000A3252    call        Printer
 000A3257    call        TPrinter.GetPrinters
 000A325C    mov         edx,dword ptr [eax]
 000A325E    call        dword ptr [edx+14];TStrings.GetCount
 000A3261    test        eax,eax
>000A3263    jle         000A32D4
 000A3265    xor         eax,eax
 000A3267    push        ebp
 000A3268    push        0A32C0
 000A326D    push        dword ptr fs:[eax]
 000A3270    mov         dword ptr fs:[eax],esp
 000A3273    call        Printer
 000A3278    call        TPrinter.GetPrinterIndex
 000A327D    mov         ebx,eax
 000A327F    call        Printer
 000A3284    or          edx,0FFFFFFFF
 000A3287    call        TPrinter.SetPrinterIndex
 000A328C    call        Printer
 000A3291    call        TPrinter.GetPrinterIndex
 000A3296    push        eax
 000A3297    call        Printer
 000A329C    call        TPrinter.GetPrinters
 000A32A1    mov         ecx,dword ptr [ebp-4]
 000A32A4    pop         edx
 000A32A5    mov         esi,dword ptr [eax]
 000A32A7    call        dword ptr [esi+0C];TStrings.Get
 000A32AA    call        Printer
 000A32AF    mov         edx,ebx
 000A32B1    call        TPrinter.SetPrinterIndex
 000A32B6    xor         eax,eax
 000A32B8    pop         edx
 000A32B9    pop         ecx
 000A32BA    pop         ecx
 000A32BB    mov         dword ptr fs:[eax],edx
>000A32BE    jmp         000A32DC
>000A32C0    jmp         @HandleAnyException
 000A32C5    mov         eax,dword ptr [ebp-4]
 000A32C8    call        @LStrClr
 000A32CD    call        @DoneExcept
>000A32D2    jmp         000A32DC
 000A32D4    mov         eax,dword ptr [ebp-4]
 000A32D7    call        @LStrClr
 000A32DC    pop         edi
 000A32DD    pop         esi
 000A32DE    pop         ebx
 000A32DF    pop         ecx
 000A32E0    pop         ebp
 000A32E1    ret
end;*}

//000A32E4
{*function sub_000A32E4:?;
begin
 000A32E4    push        ebp
 000A32E5    mov         ebp,esp
 000A32E7    push        0
 000A32E9    push        ebx
 000A32EA    xor         eax,eax
 000A32EC    push        ebp
 000A32ED    push        0A3335
 000A32F2    push        dword ptr fs:[eax]
 000A32F5    mov         dword ptr fs:[eax],esp
 000A32F8    lea         eax,[ebp-4]
 000A32FB    call        000A3248
 000A3300    cmp         dword ptr [ebp-4],0
>000A3304    jne         000A330B
 000A3306    or          ebx,0FFFFFFFF
>000A3309    jmp         000A331F
 000A330B    call        Printer
 000A3310    call        TPrinter.GetPrinters
 000A3315    mov         edx,dword ptr [ebp-4]
 000A3318    mov         ecx,dword ptr [eax]
 000A331A    call        dword ptr [ecx+50];TStrings.IndexOf
 000A331D    mov         ebx,eax
 000A331F    xor         eax,eax
 000A3321    pop         edx
 000A3322    pop         ecx
 000A3323    pop         ecx
 000A3324    mov         dword ptr fs:[eax],edx
 000A3327    push        0A333C
 000A332C    lea         eax,[ebp-4]
 000A332F    call        @LStrClr
 000A3334    ret
>000A3335    jmp         @HandleFinally
>000A333A    jmp         000A332C
 000A333C    mov         eax,ebx
 000A333E    pop         ebx
 000A333F    pop         ecx
 000A3340    pop         ebp
 000A3341    ret
end;*}

end.