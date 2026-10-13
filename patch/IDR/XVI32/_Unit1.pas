//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit1;

interface

uses
  SysUtils, Classes;

    function GetModuleFileNameA(lpFilename:PAnsiChar; nSize:Longword):Longword; stdcall;//0001653C
    function GetModuleHandleA:HINST; stdcall;//00016544
    function LocalAlloc(uBytes:Longword):Longword; stdcall;//0001654C
    function TlsGetValue:Pointer; stdcall;//00016554
    function TlsSetValue(TlsValue:Pointer):Boolean; stdcall;//0001655C
    procedure InitThreadTLS;//00016564
    procedure @GetTls;//000165B4
    procedure InitializeModule;//000165F8
    procedure @InitExe;//00016644

implementation

//0001653C
function kernel32.GetModuleFileNameA(lpFilename:PAnsiChar; nSize:Longword):Longword; stdcall;
begin
{*
 0001653C    jmp         dword ptr ds:[0B8260]
*}
end;

//00016544
function kernel32.GetModuleHandleA:HINST; stdcall;
begin
{*
 00016544    jmp         dword ptr ds:[0B825C]
*}
end;

//0001654C
function kernel32.LocalAlloc(uBytes:Longword):Longword; stdcall;
begin
{*
 0001654C    jmp         dword ptr ds:[0B8258]
*}
end;

//00016554
function kernel32.TlsGetValue:Pointer; stdcall;
begin
{*
 00016554    jmp         dword ptr ds:[0B8254]
*}
end;

//0001655C
function kernel32.TlsSetValue(TlsValue:Pointer):Boolean; stdcall;
begin
{*
 0001655C    jmp         dword ptr ds:[0B8250]
*}
end;

//00016564
procedure InitThreadTLS;
begin
{*
 00016564    push        ebx
 00016565    mov         eax,10
 0001656A    test        eax,eax
>0001656C    je          000165B1
 0001656E    cmp         dword ptr ds:[0B64D4],0
>00016575    jge         00016581
 00016577    mov         eax,0E2
 0001657C    call        @RunError
 00016581    push        10
 00016586    push        40
 00016588    call        kernel32.LocalAlloc
 0001658D    mov         ebx,eax
 0001658F    test        ebx,ebx
>00016591    jne         0001659F
 00016593    mov         eax,0E2
 00016598    call        @RunError
>0001659D    jmp         000165AB
 0001659F    push        ebx
 000165A0    mov         eax,[000B64D4]
 000165A5    push        eax
 000165A6    call        kernel32.TlsSetValue
 000165AB    mov         dword ptr ds:[0B64E4],ebx
 000165B1    pop         ebx
 000165B2    ret
*}
end;

//000165B4
procedure @GetTls;
begin
{*
 000165B4    mov         cl,byte ptr ds:[0B64D0]
 000165BA    mov         eax,dword ptr ds:[0B64D4]
 000165C0    test        cl,cl
>000165C2    jne         000165EC
 000165C4    mov         edx,dword ptr fs:[2C]
 000165CB    mov         eax,dword ptr [edx+eax*4]
 000165CE    ret
 000165CF    call        InitThreadTLS
 000165D4    mov         eax,dword ptr ds:[0B64D4]
 000165DA    push        eax
 000165DB    call        kernel32.TlsGetValue
 000165E0    test        eax,eax
>000165E2    je          000165E5
 000165E4    ret
 000165E5    mov         eax,dword ptr ds:[0B64E4]
 000165EB    ret
 000165EC    push        eax
 000165ED    call        kernel32.TlsGetValue
 000165F2    test        eax,eax
>000165F4    je          000165CF
 000165F6    ret
*}
end;

//000165F8
procedure InitializeModule;
begin
{*
 000165F8    push        ebx
 000165F9    add         esp,0FFFFFEF8
 000165FF    push        105
 00016604    lea         eax,[esp+4]
 00016608    push        eax
 00016609    mov         eax,[000B64DC];HInstance:Longword
 0001660E    push        eax
 0001660F    call        kernel32.GetModuleFileNameA
 00016614    mov         eax,esp
 00016616    call        LoadResourceModule
 0001661B    mov         ebx,eax
 0001661D    mov         dword ptr ds:[0B4110],ebx
 00016623    test        ebx,ebx
>00016625    jne         00016631
 00016627    mov         eax,[000B4104]
 0001662C    mov         [000B4110],eax
 00016631    mov         eax,0B4100
 00016636    call        RegisterModule
 0001663B    add         esp,108
 00016641    pop         ebx
 00016642    ret
*}
end;

//00016644
procedure @InitExe;
begin
{*
 00016644    push        eax
 00016645    push        0
 00016647    call        kernel32.GetModuleHandleA
 0001664C    mov         edx,0B4100
 00016651    push        edx
 00016652    mov         dword ptr ds:[0B64DC],eax;HInstance:Longword
 00016658    mov         dword ptr [edx+4],eax
 0001665B    mov         dword ptr [edx+8],0
 00016662    mov         dword ptr [edx+0C],0
 00016669    call        InitializeModule
 0001666E    pop         edx
 0001666F    pop         eax
 00016670    call        @StartExe
 00016675    ret
*}
end;

end.