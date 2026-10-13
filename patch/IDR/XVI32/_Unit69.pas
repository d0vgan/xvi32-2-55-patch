//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit69;

interface

uses
  SysUtils, Classes;

    //procedure sub_00090CB0(?:?; ?:?; ?:?);//00090CB0
    //function sub_00090D20(?:AnsiString):?;//00090D20
    //function sub_00090D40(?:?; ?:?; ?:?):?;//00090D40

implementation

//00090CB0
{*procedure sub_00090CB0(?:?; ?:?; ?:?);
begin
 00090CB0    push        ebp
 00090CB1    mov         ebp,esp
 00090CB3    add         esp,0FFFFFFE0
 00090CB6    push        ebx
 00090CB7    mov         ebx,eax
 00090CB9    push        dword ptr [ebp+0C]
 00090CBC    push        dword ptr [ebp+8]
 00090CBF    lea         ecx,[ebp-6]
 00090CC2    lea         edx,[ebp-4]
 00090CC5    lea         eax,[ebp-2]
 00090CC8    call        DecodeDate
 00090CCD    push        ebx
 00090CCE    movzx       eax,word ptr [ebp-2]
 00090CD2    mov         dword ptr [ebp-20],eax
 00090CD5    mov         byte ptr [ebp-1C],0
 00090CD9    movzx       eax,word ptr [ebp-4]
 00090CDD    mov         dword ptr [ebp-18],eax
 00090CE0    mov         byte ptr [ebp-14],0
 00090CE4    movzx       eax,word ptr [ebp-6]
 00090CE8    mov         dword ptr [ebp-10],eax
 00090CEB    mov         byte ptr [ebp-0C],0
 00090CEF    lea         edx,[ebp-20]
 00090CF2    mov         ecx,2
 00090CF7    mov         eax,90D10;'%4.4d%2.2d%2.2d'
 00090CFC    call        Format
 00090D01    pop         ebx
 00090D02    mov         esp,ebp
 00090D04    pop         ebp
 00090D05    ret         8
end;*}

//00090D20
{*function sub_00090D20(?:AnsiString):?;
begin
 00090D20    push        ebx
 00090D21    add         esp,0FFFFFFF8
 00090D24    mov         ebx,eax
 00090D26    mov         eax,ebx
 00090D28    call        FileAge
 00090D2D    call        FileDateToDateTime
 00090D32    fstp        qword ptr [esp]
 00090D35    wait
 00090D36    fld         qword ptr [esp]
 00090D39    pop         ecx
 00090D3A    pop         edx
 00090D3B    pop         ebx
 00090D3C    ret
end;*}

//00090D40
{*function sub_00090D40(?:?; ?:?; ?:?):?;
begin
 00090D40    push        ebp
 00090D41    mov         ebp,esp
 00090D43    push        0
 00090D45    push        ebx
 00090D46    mov         ebx,eax
 00090D48    xor         eax,eax
 00090D4A    push        ebp
 00090D4B    push        90DD6
 00090D50    push        dword ptr fs:[eax]
 00090D53    mov         dword ptr fs:[eax],esp
 00090D56    push        dword ptr [ebp+0C]
 00090D59    push        dword ptr [ebp+8]
 00090D5C    lea         eax,[ebp-4]
 00090D5F    call        00090CB0
 00090D64    mov         eax,dword ptr [ebp-4]
 00090D67    mov         edx,90DF0;'19800101'
 00090D6C    call        @LStrCmp
>00090D71    jae         00090D77
 00090D73    xor         ebx,ebx
>00090D75    jmp         00090DC0
 00090D77    mov         edx,41
 00090D7C    mov         eax,ebx
 00090D7E    call        FileOpen
 00090D83    mov         ebx,eax
 00090D85    call        IOResult
 00090D8A    test        eax,eax
>00090D8C    jne         00090D92
 00090D8E    test        ebx,ebx
>00090D90    jg          00090D96
 00090D92    xor         ebx,ebx
>00090D94    jmp         00090DC0
 00090D96    push        dword ptr [ebp+0C]
 00090D99    push        dword ptr [ebp+8]
 00090D9C    call        DateTimeToFileDate
 00090DA1    mov         edx,eax
 00090DA3    mov         eax,ebx
 00090DA5    call        FileSetDate
 00090DAA    mov         eax,ebx
 00090DAC    call        FileClose
 00090DB1    call        IOResult
 00090DB6    test        eax,eax
>00090DB8    je          00090DBE
 00090DBA    xor         ebx,ebx
>00090DBC    jmp         00090DC0
 00090DBE    mov         bl,1
 00090DC0    xor         eax,eax
 00090DC2    pop         edx
 00090DC3    pop         ecx
 00090DC4    pop         ecx
 00090DC5    mov         dword ptr fs:[eax],edx
 00090DC8    push        90DDD
 00090DCD    lea         eax,[ebp-4]
 00090DD0    call        @LStrClr
 00090DD5    ret
>00090DD6    jmp         @HandleFinally
>00090DDB    jmp         00090DCD
 00090DDD    mov         eax,ebx
 00090DDF    pop         ebx
 00090DE0    pop         ecx
 00090DE1    pop         ebp
 00090DE2    ret         8
end;*}

end.