//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit activex;

interface

uses
  SysUtils, Classes;

type
  tagEXCEPINFO = tagEXCEPINFO = record//size=20
f4:WideString;//f4
f8:WideString;//f8
fC:WideString;//fC
end;;
    function IsEqualGUID(const guid2:TGUID):Boolean; stdcall;//0001DAD0
    function CoInitialize:HRESULT; stdcall;//0001DAD8
    procedure CoUninitialize;//0001DAE0
    function CoCreateInstance(unkOuter:IUnknown; dwClsContext:Longint; const iid:TGUID; var pv:void ):HRESULT; stdcall;//0001DAE8
    procedure SysFreeString; stdcall;//0001DAF0
    function GetErrorInfo(var errinfo:IErrorInfo):HRESULT; stdcall;//0001DAF8
    function Succeeded(Res:HRESULT):Boolean;//0001DB00

implementation

//0001DAD0
function ole32.IsEqualGUID(const guid2:TGUID):Boolean; stdcall;
begin
{*
 0001DAD0    jmp         dword ptr ds:[0B87F4]
*}
end;

//0001DAD8
function ole32.CoInitialize:HRESULT; stdcall;
begin
{*
 0001DAD8    jmp         dword ptr ds:[0B87F0]
*}
end;

//0001DAE0
procedure ole32.CoUninitialize;
begin
{*
 0001DAE0    jmp         dword ptr ds:[0B87EC]
*}
end;

//0001DAE8
function ole32.CoCreateInstance(unkOuter:IUnknown; dwClsContext:Longint; const iid:TGUID; var pv:void ):HRESULT; stdcall;
begin
{*
 0001DAE8    jmp         dword ptr ds:[0B87E8]
*}
end;

//0001DAF0
procedure oleaut32.SysFreeString; stdcall;
begin
{*
 0001DAF0    jmp         dword ptr ds:[0B8800]
*}
end;

//0001DAF8
function oleaut32.GetErrorInfo(var errinfo:IErrorInfo):HRESULT; stdcall;
begin
{*
 0001DAF8    jmp         dword ptr ds:[0B87FC]
*}
end;

//0001DB00
function Succeeded(Res:HRESULT):Boolean;
begin
{*
 0001DB00    test        eax,80000000
 0001DB05    sete        al
 0001DB08    ret
*}
end;

end.