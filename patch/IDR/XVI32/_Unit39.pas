//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit39;

interface

uses
  SysUtils, Classes;

    procedure DragAcceptFiles(Accept:BOOL); stdcall;//00073F0C
    procedure DragFinish; stdcall;//00073F14
    function DragQueryFileA(FileIndex:UINT; FileName:PAnsiChar; cb:UINT):UINT; stdcall;//00073F1C
    function FindExecutableA(Directory:PAnsiChar; Result:PAnsiChar):HINST; stdcall;//00073F24
    function ShellExecuteA(Operation:PAnsiChar; FileName:PAnsiChar; Parameters:PAnsiChar; Directory:PAnsiChar; ShowCmd:Integer):HINST; stdcall;//00073F2C

implementation

//00073F0C
procedure shell32.DragAcceptFiles(Accept:BOOL); stdcall;
begin
{*
 00073F0C    jmp         dword ptr ds:[0B889C]
*}
end;

//00073F14
procedure shell32.DragFinish; stdcall;
begin
{*
 00073F14    jmp         dword ptr ds:[0B8898]
*}
end;

//00073F1C
function shell32.DragQueryFileA(FileIndex:UINT; FileName:PAnsiChar; cb:UINT):UINT; stdcall;
begin
{*
 00073F1C    jmp         dword ptr ds:[0B8894]
*}
end;

//00073F24
function shell32.FindExecutableA(Directory:PAnsiChar; Result:PAnsiChar):HINST; stdcall;
begin
{*
 00073F24    jmp         dword ptr ds:[0B8890]
*}
end;

//00073F2C
function shell32.ShellExecuteA(Operation:PAnsiChar; FileName:PAnsiChar; Parameters:PAnsiChar; Directory:PAnsiChar; ShowCmd:Integer):HINST; stdcall;
begin
{*
 00073F2C    jmp         dword ptr ds:[0B888C]
*}
end;

end.