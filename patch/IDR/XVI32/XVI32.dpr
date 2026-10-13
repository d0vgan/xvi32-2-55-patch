//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
program XVI32;

uses
  SysUtils, Classes;

{$R *.res}

//000B3CE4
begin
{*
 000B3CE4    push        ebp
 000B3CE5    mov         ebp,esp
 000B3CE7    add         esp,0FFFFFFF4
 000B3CEA    mov         eax,0B39DC
 000B3CEF    call        @InitExe
 000B3CF4    mov         eax,[000B59E8];^Application:TApplication
 000B3CF9    mov         eax,dword ptr [eax]
 000B3CFB    call        TApplication.Initialize
 000B3D00    mov         ecx,dword ptr ds:[0B5784];^gvar_000B70A4:TFormMain
 000B3D06    mov         eax,[000B59E8];^Application:TApplication
 000B3D0B    mov         eax,dword ptr [eax]
 000B3D0D    mov         edx,dword ptr ds:[0A9870];TFormMain
 000B3D13    call        TApplication.CreateForm
 000B3D18    mov         ecx,dword ptr ds:[0B5894];^gvar_000B7070:TFormOSE
 000B3D1E    mov         eax,[000B59E8];^Application:TApplication
 000B3D23    mov         eax,dword ptr [eax]
 000B3D25    mov         edx,dword ptr ds:[0A0F10];TFormOSE
 000B3D2B    call        TApplication.CreateForm
 000B3D30    mov         ecx,dword ptr ds:[0B5AAC];^gvar_000B709C:TFormScript
 000B3D36    mov         eax,[000B59E8];^Application:TApplication
 000B3D3B    mov         eax,dword ptr [eax]
 000B3D3D    mov         edx,dword ptr ds:[0A5A74];TFormScript
 000B3D43    call        TApplication.CreateForm
 000B3D48    mov         eax,[000B59E8];^Application:TApplication
 000B3D4D    mov         eax,dword ptr [eax]
 000B3D4F    call        TApplication.Run
 000B3D54    call        @Halt0
*}
end.
