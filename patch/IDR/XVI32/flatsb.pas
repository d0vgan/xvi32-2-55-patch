//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit flatsb;

interface

uses
  SysUtils, Classes;

    function FlatSB_SetScrollProp(p1:HWND; index:Integer; newValue:Integer; p4:BOOL):BOOL; stdcall;//0003359C
    function InitializeFlatSB(hWnd:HWND):BOOL; stdcall;//000335D0
    procedure InitFlatSB;//000335F8

implementation

//0003359C
function FlatSB_SetScrollProp(p1:HWND; index:Integer; newValue:Integer; p4:BOOL):BOOL; stdcall;
begin
{*
 0003359C    push        ebp
 0003359D    mov         ebp,esp
 0003359F    cmp         dword ptr ds:[0B670C],0
>000335A6    je          000335C2
 000335A8    mov         eax,dword ptr [ebp+14]
 000335AB    push        eax
 000335AC    mov         eax,dword ptr [ebp+10]
 000335AF    push        eax
 000335B0    mov         eax,dword ptr [ebp+0C]
 000335B3    push        eax
 000335B4    mov         eax,dword ptr [ebp+8]
 000335B7    push        eax
 000335B8    call        dword ptr ds:[0B670C]
 000335BE    test        eax,eax
>000335C0    jne         000335C6
 000335C2    xor         eax,eax
>000335C4    jmp         000335C8
 000335C6    mov         al,1
 000335C8    neg         al
 000335CA    sbb         eax,eax
 000335CC    pop         ebp
 000335CD    ret         10
*}
end;

//000335D0
function InitializeFlatSB(hWnd:HWND):BOOL; stdcall;
begin
{*
 000335D0    push        ebp
 000335D1    mov         ebp,esp
 000335D3    cmp         dword ptr ds:[0B6710],0
>000335DA    je          000335EA
 000335DC    mov         eax,dword ptr [ebp+8]
 000335DF    push        eax
 000335E0    call        dword ptr ds:[0B6710]
 000335E6    test        eax,eax
>000335E8    jne         000335EE
 000335EA    xor         eax,eax
>000335EC    jmp         000335F0
 000335EE    mov         al,1
 000335F0    neg         al
 000335F2    sbb         eax,eax
 000335F4    pop         ebp
 000335F5    ret         4
*}
end;

//000335F8
procedure InitFlatSB;
begin
{*
 000335F8    push        ebx
 000335F9    push        esi
 000335FA    push        3375C
 000335FF    call        kernel32.GetModuleHandleA
 00033604    mov         ebx,eax
 00033606    test        ebx,ebx
>00033608    je          00033756
 0003360E    push        3376C
 00033613    push        ebx
 00033614    call        kernel32.GetProcAddress
 00033619    mov         [000B6710],eax
 0003361E    push        33780
 00033623    push        ebx
 00033624    call        kernel32.GetProcAddress
 00033629    mov         [000B6714],eax
 0003362E    push        33794
 00033633    push        ebx
 00033634    call        kernel32.GetProcAddress
 00033639    mov         [000B6708],eax
 0003363E    push        337AC
 00033643    push        ebx
 00033644    call        kernel32.GetProcAddress
 00033649    mov         [000B670C],eax
 0003364E    push        337C4
 00033653    push        ebx
 00033654    call        kernel32.GetProcAddress
 00033659    mov         esi,eax
 0003365B    mov         dword ptr ds:[0B66E4],esi
 00033661    test        esi,esi
>00033663    jne         0003366F
 00033665    mov         eax,16D20;user32.EnableScrollBar:LongBool
 0003366A    mov         [000B66E4],eax
 0003366F    push        337DC
 00033674    push        ebx
 00033675    call        kernel32.GetProcAddress
 0003367A    mov         esi,eax
 0003367C    mov         dword ptr ds:[0B66E8],esi
 00033682    test        esi,esi
>00033684    jne         00033690
 00033686    mov         eax,17118;user32.ShowScrollBar:LongBool
 0003368B    mov         [000B66E8],eax
 00033690    push        337F4
 00033695    push        ebx
 00033696    call        kernel32.GetProcAddress
 0003369B    mov         esi,eax
 0003369D    mov         dword ptr ds:[0B66EC],esi
 000336A3    test        esi,esi
>000336A5    jne         000336B1
 000336A7    mov         eax,16E88;user32.GetScrollRange:LongBool
 000336AC    mov         [000B66EC],eax
 000336B1    push        3380C
 000336B6    push        ebx
 000336B7    call        kernel32.GetProcAddress
 000336BC    mov         esi,eax
 000336BE    mov         dword ptr ds:[0B66F0],esi
 000336C4    test        esi,esi
>000336C6    jne         000336D2
 000336C8    mov         eax,16E78;user32.GetScrollInfo:LongBool
 000336CD    mov         [000B66F0],eax
 000336D2    push        33824
 000336D7    push        ebx
 000336D8    call        kernel32.GetProcAddress
 000336DD    mov         esi,eax
 000336DF    mov         dword ptr ds:[0B66F4],esi
 000336E5    test        esi,esi
>000336E7    jne         000336F3
 000336E9    mov         eax,16E80;user32.GetScrollPos:Integer
 000336EE    mov         [000B66F4],eax
 000336F3    push        33838
 000336F8    push        ebx
 000336F9    call        kernel32.GetProcAddress
 000336FE    mov         esi,eax
 00033700    mov         dword ptr ds:[0B66F8],esi
 00033706    test        esi,esi
>00033708    jne         00033714
 0003370A    mov         eax,170C0;user32.SetScrollPos:Integer
 0003370F    mov         [000B66F8],eax
 00033714    push        3384C
 00033719    push        ebx
 0003371A    call        kernel32.GetProcAddress
 0003371F    mov         esi,eax
 00033721    mov         dword ptr ds:[0B66FC],esi
 00033727    test        esi,esi
>00033729    jne         00033735
 0003372B    mov         eax,170B8;user32.SetScrollInfo:Integer
 00033730    mov         [000B66FC],eax
 00033735    push        33864
 0003373A    push        ebx
 0003373B    call        kernel32.GetProcAddress
 00033740    mov         esi,eax
 00033742    mov         dword ptr ds:[0B6700],esi
 00033748    test        esi,esi
>0003374A    jne         00033756
 0003374C    mov         eax,170C8;user32.SetScrollRange:LongBool
 00033751    mov         [000B6700],eax
 00033756    pop         esi
 00033757    pop         ebx
 00033758    ret
*}
end;

Initialization
//000338AC
{*
 000338AC    sub         dword ptr ds:[0B6704],1
>000338B3    jae         000338BA
 000338B5    call        InitFlatSB
 000338BA    ret
*}
Finalization
end.