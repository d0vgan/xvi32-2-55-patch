//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit _Unit23;

interface

uses
  SysUtils, Classes;

    function ClosePrinter:BOOL; stdcall;//00032308
    function DocumentPropertiesA(hPrinter:THandle; pDeviceName:PAnsiChar; const pDevModeOutput:TDeviceModeA; var pDevModeInput:TDeviceModeA; fMode:DWORD):Longint; stdcall;//00032310
    function EnumPrintersA(Name:PAnsiChar; Level:DWORD; pPrinterEnum:Pointer; cbBuf:DWORD; var pcbNeeded:DWORD; var pcReturned:DWORD):BOOL; stdcall;//00032318
    function OpenPrinterA(var phPrinter:THandle; pDefault:PPrinterDefaultsA):BOOL; stdcall;//00032320

implementation

//00032308
function winspool.ClosePrinter:BOOL; stdcall;
begin
{*
 00032308    jmp         dword ptr ds:[0B8878]
*}
end;

//00032310
function winspool.DocumentPropertiesA(hPrinter:THandle; pDeviceName:PAnsiChar; const pDevModeOutput:TDeviceModeA; var pDevModeInput:TDeviceModeA; fMode:DWORD):Longint; stdcall;
begin
{*
 00032310    jmp         dword ptr ds:[0B8874]
*}
end;

//00032318
function winspool.EnumPrintersA(Name:PAnsiChar; Level:DWORD; pPrinterEnum:Pointer; cbBuf:DWORD; var pcbNeeded:DWORD; var pcReturned:DWORD):BOOL; stdcall;
begin
{*
 00032318    jmp         dword ptr ds:[0B8870]
*}
end;

//00032320
function winspool.OpenPrinterA(var phPrinter:THandle; pDefault:PPrinterDefaultsA):BOOL; stdcall;
begin
{*
 00032320    jmp         dword ptr ds:[0B886C]
*}
end;

end.