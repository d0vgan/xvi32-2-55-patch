//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit27;

interface

uses
  SysUtils, Classes;

    function GetOpenFileNameA:BOOL; stdcall;//000604AC
    function GetSaveFileNameA:BOOL; stdcall;//000604B4

implementation

//000604AC
function comdlg32.GetOpenFileNameA:BOOL; stdcall;
begin
{*
 000604AC    jmp         dword ptr ds:[0B8884]
*}
end;

//000604B4
function comdlg32.GetSaveFileNameA:BOOL; stdcall;
begin
{*
 000604B4    jmp         dword ptr ds:[0B8880]
*}
end;

end.