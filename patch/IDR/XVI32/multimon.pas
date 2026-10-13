//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit multimon;

interface

uses
  SysUtils, Classes;

    function InitAnApi(mmAPI:TMultiMonApi; ApiStub:Pointer; ApiName:AnsiString):Pointer;//00031B04
    function _GetSystemMetrics(nIndex:Integer):Integer; stdcall;//00031BEC
    function xMonitorFromRect(lprcScreenCoords:PRect; dwFlags:DWORD):HMONITOR; stdcall;//00031C74
    function xMonitorFromWindow(hWnd:HWND; dwFlags:DWORD):HMONITOR; stdcall;//00031D00
    function xMonitorFromPoint(ptScreenCoords:TPoint; dwFlags:DWORD):HMONITOR; stdcall;//00031D94
    function xGetMonitorInfoA(hMonitor:HMONITOR; lpMonitorInfo:PMonitorInfoA):Boolean; stdcall;//00031E24
    function xGetMonitorInfoW(hMonitor:HMONITOR; lpMonitorInfo:PMonitorInfoW):Boolean; stdcall;//00031EFC
    function xGetMonitorInfo(hMonitor:HMONITOR; lpMonitorInfo:PMonitorInfoA):Boolean; stdcall;//00031FD4
    function xEnumDisplayMonitors(hdcOptionalForPainting:HDC; lprcEnumMonitorsThatIntersect:PRect; lpfnEnumProc:TMonitorEnumProc; dwData:LPARAM):Boolean; stdcall;//000320AC
    procedure InitMultiMonStubs;//000321DC

implementation

//00031B04
function InitAnApi(mmAPI:TMultiMonApi; ApiStub:Pointer; ApiName:AnsiString):Pointer;
begin
{*
 00031B04    push        ebp
 00031B05    mov         ebp,esp
 00031B07    push        ecx
 00031B08    push        ebx
 00031B09    push        esi
 00031B0A    push        edi
 00031B0B    mov         dword ptr [ebp-4],ecx
 00031B0E    mov         edi,edx
 00031B10    mov         ebx,eax
 00031B12    mov         eax,dword ptr [ebp-4]
 00031B15    call        @LStrAddRef
 00031B1A    xor         eax,eax
 00031B1C    push        ebp
 00031B1D    push        31BC3
 00031B22    push        dword ptr fs:[eax]
 00031B25    mov         dword ptr fs:[eax],esp
 00031B28    xor         esi,esi
 00031B2A    xor         eax,eax
 00031B2C    mov         al,bl
 00031B2E    cmp         byte ptr [eax+0B66C8],0
>00031B35    jne         00031BAD
 00031B37    cmp         dword ptr ds:[0B66C4],0
>00031B3E    je          00031B8D
 00031B40    test        bl,bl
>00031B42    jne         00031B75
 00031B44    cmp         byte ptr ds:[0B66D0],0
>00031B4B    jne         00031B75
 00031B4D    mov         ecx,31BDC;'GetMonitorInfoA'
 00031B52    mov         edx,dword ptr ds:[0B66B8]
 00031B58    mov         al,4
 00031B5A    call        InitAnApi
 00031B5F    mov         [000B66B8],eax
 00031B64    cmp         byte ptr ds:[0B66D0],0
>00031B6B    jne         00031B75
 00031B6D    lea         eax,[ebp-4]
 00031B70    call        @LStrClr
 00031B75    mov         eax,dword ptr [ebp-4]
 00031B78    call        @LStrToPChar
 00031B7D    push        eax
 00031B7E    mov         eax,[000B66C4]
 00031B83    push        eax
 00031B84    call        kernel32.GetProcAddress
 00031B89    mov         esi,eax
>00031B8B    jmp         00031B8F
 00031B8D    xor         esi,esi
 00031B8F    test        esi,esi
>00031B91    jne         00031B97
 00031B93    mov         esi,edi
>00031B95    jmp         00031BA2
 00031B97    test        bl,bl
>00031B99    je          00031BA2
 00031B9B    mov         byte ptr ds:[0B66D0],1
 00031BA2    xor         eax,eax
 00031BA4    mov         al,bl
 00031BA6    mov         byte ptr [eax+0B66C8],1
 00031BAD    xor         eax,eax
 00031BAF    pop         edx
 00031BB0    pop         ecx
 00031BB1    pop         ecx
 00031BB2    mov         dword ptr fs:[eax],edx
 00031BB5    push        31BCA
 00031BBA    lea         eax,[ebp-4]
 00031BBD    call        @LStrClr
 00031BC2    ret
>00031BC3    jmp         @HandleFinally
>00031BC8    jmp         00031BBA
 00031BCA    mov         eax,esi
 00031BCC    pop         edi
 00031BCD    pop         esi
 00031BCE    pop         ebx
 00031BCF    pop         ecx
 00031BD0    pop         ebp
 00031BD1    ret
*}
end;

//00031BEC
function _GetSystemMetrics(nIndex:Integer):Integer; stdcall;
begin
{*
 00031BEC    push        ebp
 00031BED    mov         ebp,esp
 00031BEF    push        ebx
 00031BF0    mov         ebx,dword ptr [ebp+8]
 00031BF3    cmp         byte ptr ds:[0B66C8],0
>00031BFA    jne         00031C1C
 00031BFC    mov         ecx,31C60;'GetSystemMetrics'
 00031C01    mov         edx,dword ptr ds:[0B66A0];gvar_000B66A0
 00031C07    xor         eax,eax
 00031C09    call        InitAnApi
 00031C0E    mov         [000B66A0],eax;gvar_000B66A0
 00031C13    push        ebx
 00031C14    call        dword ptr ds:[0B66A0]
>00031C1A    jmp         00031C53
 00031C1C    or          eax,0FFFFFFFF
 00031C1F    mov         edx,ebx
 00031C21    add         edx,0FFFFFFB4
 00031C24    sub         edx,2
>00031C27    jb          00031C3B
>00031C29    je          00031C3F
 00031C2B    dec         edx
>00031C2C    je          00031C43
 00031C2E    dec         edx
 00031C2F    sub         edx,2
>00031C32    jae         00031C48
 00031C34    mov         eax,1
>00031C39    jmp         00031C48
 00031C3B    xor         eax,eax
>00031C3D    jmp         00031C48
 00031C3F    xor         ebx,ebx
>00031C41    jmp         00031C48
 00031C43    mov         ebx,1
 00031C48    cmp         eax,0FFFFFFFF
>00031C4B    jne         00031C53
 00031C4D    push        ebx
 00031C4E    call        user32.GetSystemMetrics
 00031C53    pop         ebx
 00031C54    pop         ebp
 00031C55    ret         4
*}
end;

//00031C74
function xMonitorFromRect(lprcScreenCoords:PRect; dwFlags:DWORD):HMONITOR; stdcall;
begin
{*
 00031C74    push        ebp
 00031C75    mov         ebp,esp
 00031C77    push        ebx
 00031C78    push        esi
 00031C79    push        edi
 00031C7A    mov         edi,dword ptr [ebp+0C]
 00031C7D    mov         ebx,dword ptr [ebp+8]
 00031C80    cmp         byte ptr ds:[0B66CA],0
>00031C87    jne         00031CAC
 00031C89    mov         ecx,31CF0;'MonitorFromRect'
 00031C8E    mov         edx,dword ptr ds:[0B66A8]
 00031C94    mov         al,2
 00031C96    call        InitAnApi
 00031C9B    mov         [000B66A8],eax
 00031CA0    push        edi
 00031CA1    push        ebx
 00031CA2    call        dword ptr ds:[0B66A8]
 00031CA8    mov         esi,eax
>00031CAA    jmp         00031CDE
 00031CAC    xor         esi,esi
 00031CAE    mov         eax,edi
 00031CB0    test        al,3
>00031CB2    je          00031CDE
 00031CB4    cmp         dword ptr [ebx+8],0
>00031CB8    jle         00031CDE
 00031CBA    cmp         dword ptr [ebx+0C],0
>00031CBE    jle         00031CDE
 00031CC0    push        0
 00031CC2    call        dword ptr ds:[0B66A0]
 00031CC8    cmp         eax,dword ptr [ebx]
>00031CCA    jle         00031CDE
 00031CCC    push        1
 00031CCE    call        dword ptr ds:[0B66A0]
 00031CD4    cmp         eax,dword ptr [ebx+4]
>00031CD7    jle         00031CDE
 00031CD9    mov         esi,12340042
 00031CDE    mov         eax,esi
 00031CE0    pop         edi
 00031CE1    pop         esi
 00031CE2    pop         ebx
 00031CE3    pop         ebp
 00031CE4    ret         8
*}
end;

//00031D00
function xMonitorFromWindow(hWnd:HWND; dwFlags:DWORD):HMONITOR; stdcall;
begin
{*
 00031D00    push        ebp
 00031D01    mov         ebp,esp
 00031D03    add         esp,0FFFFFFD4
 00031D06    push        ebx
 00031D07    push        esi
 00031D08    mov         ebx,dword ptr [ebp+0C]
 00031D0B    mov         esi,dword ptr [ebp+8]
 00031D0E    cmp         byte ptr ds:[0B66C9],0
>00031D15    jne         00031D38
 00031D17    mov         ecx,31D80;'MonitorFromWindow'
 00031D1C    mov         edx,dword ptr ds:[0B66A4]
 00031D22    mov         al,1
 00031D24    call        InitAnApi
 00031D29    mov         [000B66A4],eax
 00031D2E    push        ebx
 00031D2F    push        esi
 00031D30    call        dword ptr ds:[0B66A4]
>00031D36    jmp         00031D6E
 00031D38    test        bl,3
>00031D3B    je          00031D44
 00031D3D    mov         eax,12340042
>00031D42    jmp         00031D6E
 00031D44    push        esi
 00031D45    call        user32.IsIconic
 00031D4A    test        eax,eax
>00031D4C    je          00031D5A
 00031D4E    lea         eax,[ebp-2C]
 00031D51    push        eax
 00031D52    push        esi
 00031D53    call        user32.GetWindowPlacement
>00031D58    jmp         00031D64
 00031D5A    lea         eax,[ebp-10]
 00031D5D    push        eax
 00031D5E    push        esi
 00031D5F    call        user32.GetWindowRect
 00031D64    push        ebx
 00031D65    lea         eax,[ebp-10]
 00031D68    push        eax
 00031D69    call        xMonitorFromRect
 00031D6E    pop         esi
 00031D6F    pop         ebx
 00031D70    mov         esp,ebp
 00031D72    pop         ebp
 00031D73    ret         8
*}
end;

//00031D94
function xMonitorFromPoint(ptScreenCoords:TPoint; dwFlags:DWORD):HMONITOR; stdcall;
begin
{*
 00031D94    push        ebp
 00031D95    mov         ebp,esp
 00031D97    push        ebx
 00031D98    push        esi
 00031D99    mov         esi,dword ptr [ebp+10]
 00031D9C    cmp         byte ptr ds:[0B66CB],0
>00031DA3    jne         00031DCD
 00031DA5    mov         ecx,31E10;'MonitorFromPoint'
 00031DAA    mov         edx,dword ptr ds:[0B66AC]
 00031DB0    mov         al,3
 00031DB2    call        InitAnApi
 00031DB7    mov         [000B66AC],eax
 00031DBC    push        esi
 00031DBD    push        dword ptr [ebp+0C]
 00031DC0    push        dword ptr [ebp+8]
 00031DC3    call        dword ptr ds:[0B66AC]
 00031DC9    mov         ebx,eax
>00031DCB    jmp         00031E00
 00031DCD    xor         ebx,ebx
 00031DCF    mov         eax,esi
 00031DD1    test        al,3
>00031DD3    je          00031E00
 00031DD5    cmp         dword ptr [ebp+8],0
>00031DD9    jl          00031E00
 00031DDB    push        0
 00031DDD    call        dword ptr ds:[0B66A0]
 00031DE3    cmp         eax,dword ptr [ebp+8]
>00031DE6    jle         00031E00
 00031DE8    cmp         dword ptr [ebp+0C],0
>00031DEC    jl          00031E00
 00031DEE    push        1
 00031DF0    call        dword ptr ds:[0B66A0]
 00031DF6    cmp         eax,dword ptr [ebp+0C]
>00031DF9    jle         00031E00
 00031DFB    mov         ebx,12340042
 00031E00    mov         eax,ebx
 00031E02    pop         esi
 00031E03    pop         ebx
 00031E04    pop         ebp
 00031E05    ret         0C
*}
end;

//00031E24
function xGetMonitorInfoA(hMonitor:HMONITOR; lpMonitorInfo:PMonitorInfoA):Boolean; stdcall;
begin
{*
 00031E24    push        ebp
 00031E25    mov         ebp,esp
 00031E27    add         esp,0FFFFFFF0
 00031E2A    push        ebx
 00031E2B    push        esi
 00031E2C    push        edi
 00031E2D    mov         esi,dword ptr [ebp+0C]
 00031E30    mov         edi,dword ptr [ebp+8]
 00031E33    cmp         byte ptr ds:[0B66CD],0
>00031E3A    jne         00031E5F
 00031E3C    mov         ecx,31EE4;'GetMonitorInfoA'
 00031E41    mov         edx,dword ptr ds:[0B66B0]
 00031E47    mov         al,5
 00031E49    call        InitAnApi
 00031E4E    mov         [000B66B0],eax
 00031E53    push        esi
 00031E54    push        edi
 00031E55    call        dword ptr ds:[0B66B0]
 00031E5B    mov         ebx,eax
>00031E5D    jmp         00031ED0
 00031E5F    xor         ebx,ebx
 00031E61    cmp         edi,12340042
>00031E67    jne         00031ED0
 00031E69    test        esi,esi
>00031E6B    je          00031ED0
 00031E6D    cmp         dword ptr [esi],28
>00031E70    jb          00031ED0
 00031E72    push        0
 00031E74    lea         eax,[ebp-10]
 00031E77    push        eax
 00031E78    push        0
 00031E7A    push        30
 00031E7C    call        user32.SystemParametersInfoA
 00031E81    test        eax,eax
>00031E83    je          00031ED0
 00031E85    xor         eax,eax
 00031E87    mov         dword ptr [esi+4],eax
 00031E8A    xor         eax,eax
 00031E8C    mov         dword ptr [esi+8],eax
 00031E8F    push        0
 00031E91    call        dword ptr ds:[0B66A0]
 00031E97    mov         dword ptr [esi+0C],eax
 00031E9A    push        1
 00031E9C    call        dword ptr ds:[0B66A0]
 00031EA2    mov         dword ptr [esi+10],eax
 00031EA5    push        esi
 00031EA6    lea         edi,[esi+14]
 00031EA9    lea         esi,[ebp-10]
 00031EAC    mov         ecx,4
 00031EB1    rep movs    dword ptr [edi],dword ptr [esi]
 00031EB3    pop         esi
 00031EB4    mov         dword ptr [esi+24],1
 00031EBB    cmp         dword ptr [esi],4C
>00031EBE    jb          00031ECE
 00031EC0    push        31EF4
 00031EC5    lea         eax,[esi+28]
 00031EC8    push        eax
 00031EC9    call        kernel32.lstrcpyA
 00031ECE    mov         bl,1
 00031ED0    mov         eax,ebx
 00031ED2    pop         edi
 00031ED3    pop         esi
 00031ED4    pop         ebx
 00031ED5    mov         esp,ebp
 00031ED7    pop         ebp
 00031ED8    ret         8
*}
end;

//00031EFC
function xGetMonitorInfoW(hMonitor:HMONITOR; lpMonitorInfo:PMonitorInfoW):Boolean; stdcall;
begin
{*
 00031EFC    push        ebp
 00031EFD    mov         ebp,esp
 00031EFF    add         esp,0FFFFFFF0
 00031F02    push        ebx
 00031F03    push        esi
 00031F04    push        edi
 00031F05    mov         esi,dword ptr [ebp+0C]
 00031F08    mov         edi,dword ptr [ebp+8]
 00031F0B    cmp         byte ptr ds:[0B66CE],0
>00031F12    jne         00031F37
 00031F14    mov         ecx,31FBC;'GetMonitorInfoW'
 00031F19    mov         edx,dword ptr ds:[0B66B4]
 00031F1F    mov         al,6
 00031F21    call        InitAnApi
 00031F26    mov         [000B66B4],eax
 00031F2B    push        esi
 00031F2C    push        edi
 00031F2D    call        dword ptr ds:[0B66B4]
 00031F33    mov         ebx,eax
>00031F35    jmp         00031FA8
 00031F37    xor         ebx,ebx
 00031F39    cmp         edi,12340042
>00031F3F    jne         00031FA8
 00031F41    test        esi,esi
>00031F43    je          00031FA8
 00031F45    cmp         dword ptr [esi],28
>00031F48    jb          00031FA8
 00031F4A    push        0
 00031F4C    lea         eax,[ebp-10]
 00031F4F    push        eax
 00031F50    push        0
 00031F52    push        30
 00031F54    call        user32.SystemParametersInfoA
 00031F59    test        eax,eax
>00031F5B    je          00031FA8
 00031F5D    xor         eax,eax
 00031F5F    mov         dword ptr [esi+4],eax
 00031F62    xor         eax,eax
 00031F64    mov         dword ptr [esi+8],eax
 00031F67    push        0
 00031F69    call        dword ptr ds:[0B66A0]
 00031F6F    mov         dword ptr [esi+0C],eax
 00031F72    push        1
 00031F74    call        dword ptr ds:[0B66A0]
 00031F7A    mov         dword ptr [esi+10],eax
 00031F7D    push        esi
 00031F7E    lea         edi,[esi+14]
 00031F81    lea         esi,[ebp-10]
 00031F84    mov         ecx,4
 00031F89    rep movs    dword ptr [edi],dword ptr [esi]
 00031F8B    pop         esi
 00031F8C    mov         dword ptr [esi+24],1
 00031F93    cmp         dword ptr [esi],4C
>00031F96    jb          00031FA6
 00031F98    push        31FCC
 00031F9D    lea         eax,[esi+28]
 00031FA0    push        eax
 00031FA1    call        kernel32.lstrcpyA
 00031FA6    mov         bl,1
 00031FA8    mov         eax,ebx
 00031FAA    pop         edi
 00031FAB    pop         esi
 00031FAC    pop         ebx
 00031FAD    mov         esp,ebp
 00031FAF    pop         ebp
 00031FB0    ret         8
*}
end;

//00031FD4
function xGetMonitorInfo(hMonitor:HMONITOR; lpMonitorInfo:PMonitorInfoA):Boolean; stdcall;
begin
{*
 00031FD4    push        ebp
 00031FD5    mov         ebp,esp
 00031FD7    add         esp,0FFFFFFF0
 00031FDA    push        ebx
 00031FDB    push        esi
 00031FDC    push        edi
 00031FDD    mov         esi,dword ptr [ebp+0C]
 00031FE0    mov         edi,dword ptr [ebp+8]
 00031FE3    cmp         byte ptr ds:[0B66CC],0
>00031FEA    jne         0003200F
 00031FEC    mov         ecx,32094;'GetMonitorInfo'
 00031FF1    mov         edx,dword ptr ds:[0B66B8]
 00031FF7    mov         al,4
 00031FF9    call        InitAnApi
 00031FFE    mov         [000B66B8],eax
 00032003    push        esi
 00032004    push        edi
 00032005    call        dword ptr ds:[0B66B8]
 0003200B    mov         ebx,eax
>0003200D    jmp         00032080
 0003200F    xor         ebx,ebx
 00032011    cmp         edi,12340042
>00032017    jne         00032080
 00032019    test        esi,esi
>0003201B    je          00032080
 0003201D    cmp         dword ptr [esi],28
>00032020    jb          00032080
 00032022    push        0
 00032024    lea         eax,[ebp-10]
 00032027    push        eax
 00032028    push        0
 0003202A    push        30
 0003202C    call        user32.SystemParametersInfoA
 00032031    test        eax,eax
>00032033    je          00032080
 00032035    xor         eax,eax
 00032037    mov         dword ptr [esi+4],eax
 0003203A    xor         eax,eax
 0003203C    mov         dword ptr [esi+8],eax
 0003203F    push        0
 00032041    call        dword ptr ds:[0B66A0]
 00032047    mov         dword ptr [esi+0C],eax
 0003204A    push        1
 0003204C    call        dword ptr ds:[0B66A0]
 00032052    mov         dword ptr [esi+10],eax
 00032055    push        esi
 00032056    lea         edi,[esi+14]
 00032059    lea         esi,[ebp-10]
 0003205C    mov         ecx,4
 00032061    rep movs    dword ptr [edi],dword ptr [esi]
 00032063    pop         esi
 00032064    mov         dword ptr [esi+24],1
 0003206B    cmp         dword ptr [esi],4C
>0003206E    jb          0003207E
 00032070    push        320A4
 00032075    lea         eax,[esi+28]
 00032078    push        eax
 00032079    call        kernel32.lstrcpyA
 0003207E    mov         bl,1
 00032080    mov         eax,ebx
 00032082    pop         edi
 00032083    pop         esi
 00032084    pop         ebx
 00032085    mov         esp,ebp
 00032087    pop         ebp
 00032088    ret         8
*}
end;

//000320AC
function xEnumDisplayMonitors(hdcOptionalForPainting:HDC; lprcEnumMonitorsThatIntersect:PRect; lpfnEnumProc:TMonitorEnumProc; dwData:LPARAM):Boolean; stdcall;
begin
{*
 000320AC    push        ebp
 000320AD    mov         ebp,esp
 000320AF    add         esp,0FFFFFFD4
 000320B2    push        ebx
 000320B3    push        esi
 000320B4    push        edi
 000320B5    mov         edi,dword ptr [ebp+0C]
 000320B8    mov         esi,dword ptr [ebp+8]
 000320BB    cmp         byte ptr ds:[0B66CF],0
>000320C2    jne         000320F2
 000320C4    mov         ecx,321C8;'EnumDisplayMonitors'
 000320C9    mov         edx,dword ptr ds:[0B66BC]
 000320CF    mov         al,7
 000320D1    call        InitAnApi
 000320D6    mov         [000B66BC],eax
 000320DB    mov         eax,dword ptr [ebp+14]
 000320DE    push        eax
 000320DF    mov         eax,dword ptr [ebp+10]
 000320E2    push        eax
 000320E3    push        edi
 000320E4    push        esi
 000320E5    call        dword ptr ds:[0B66BC]
 000320EB    mov         ebx,eax
>000320ED    jmp         000321B4
 000320F2    xor         ebx,ebx
 000320F4    cmp         dword ptr [ebp+10],0
>000320F8    je          000321B4
 000320FE    xor         eax,eax
 00032100    mov         dword ptr [ebp-1C],eax
 00032103    xor         eax,eax
 00032105    mov         dword ptr [ebp-18],eax
 00032108    push        0
 0003210A    call        dword ptr ds:[0B66A0]
 00032110    mov         dword ptr [ebp-14],eax
 00032113    push        1
 00032115    call        dword ptr ds:[0B66A0]
 0003211B    mov         dword ptr [ebp-10],eax
 0003211E    test        esi,esi
>00032120    je          00032187
 00032122    lea         eax,[ebp-2C]
 00032125    push        eax
 00032126    push        esi
 00032127    call        gdi32.GetClipBox
 0003212C    mov         dword ptr [ebp-0C],eax
 0003212F    lea         eax,[ebp-8]
 00032132    push        eax
 00032133    push        esi
 00032134    call        gdi32.GetDCOrgEx
 00032139    test        eax,eax
>0003213B    je          000321B4
 0003213D    mov         eax,dword ptr [ebp-4]
 00032140    neg         eax
 00032142    push        eax
 00032143    mov         eax,dword ptr [ebp-8]
 00032146    neg         eax
 00032148    push        eax
 00032149    lea         eax,[ebp-1C]
 0003214C    push        eax
 0003214D    call        user32.OffsetRect
 00032152    lea         eax,[ebp-2C]
 00032155    push        eax
 00032156    lea         eax,[ebp-1C]
 00032159    push        eax
 0003215A    lea         eax,[ebp-1C]
 0003215D    push        eax
 0003215E    call        user32.IntersectRect
 00032163    test        eax,eax
>00032165    je          0003216B
 00032167    test        edi,edi
>00032169    je          000321A1
 0003216B    push        edi
 0003216C    lea         eax,[ebp-1C]
 0003216F    push        eax
 00032170    lea         eax,[ebp-1C]
 00032173    push        eax
 00032174    call        user32.IntersectRect
 00032179    test        eax,eax
>0003217B    jne         000321A1
 0003217D    cmp         dword ptr [ebp-0C],1
>00032181    jne         000321B4
 00032183    mov         bl,1
>00032185    jmp         000321B4
 00032187    test        edi,edi
>00032189    je          000321A1
 0003218B    push        edi
 0003218C    lea         eax,[ebp-1C]
 0003218F    push        eax
 00032190    lea         eax,[ebp-1C]
 00032193    push        eax
 00032194    call        user32.IntersectRect
 00032199    test        eax,eax
>0003219B    jne         000321A1
 0003219D    mov         bl,1
>0003219F    jmp         000321B4
 000321A1    mov         eax,dword ptr [ebp+14]
 000321A4    push        eax
 000321A5    lea         eax,[ebp-1C]
 000321A8    push        eax
 000321A9    push        esi
 000321AA    push        12340042
 000321AF    call        dword ptr [ebp+10]
 000321B2    mov         ebx,eax
 000321B4    mov         eax,ebx
 000321B6    pop         edi
 000321B7    pop         esi
 000321B8    pop         ebx
 000321B9    mov         esp,ebp
 000321BB    pop         ebp
 000321BC    ret         10
*}
end;

//000321DC
procedure InitMultiMonStubs;
begin
{*
 000321DC    push        3223C
 000321E1    call        kernel32.GetModuleHandleA
 000321E6    mov         [000B66C4],eax
 000321EB    mov         dword ptr ds:[0B66A0],31BEC
 000321F5    mov         dword ptr ds:[0B66A4],31D00
 000321FF    mov         dword ptr ds:[0B66A8],31C74
 00032209    mov         dword ptr ds:[0B66AC],31D94
 00032213    mov         dword ptr ds:[0B66B0],31E24
 0003221D    mov         dword ptr ds:[0B66B4],31EFC
 00032227    mov         dword ptr ds:[0B66B8],31FD4
 00032231    mov         dword ptr ds:[0B66BC],320AC
 0003223B    ret
*}
end;

Initialization
//00032278
{*
 00032278    sub         dword ptr ds:[0B66C0],1
>0003227F    jae         00032286
 00032281    call        InitMultiMonStubs
 00032286    ret
*}
Finalization
end.