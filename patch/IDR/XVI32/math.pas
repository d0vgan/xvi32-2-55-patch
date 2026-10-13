//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit math;

interface

uses
  SysUtils, Classes;

    function Min(A:Integer; B:Integer):Integer;//000322C0
    function Max(A:Integer; B:Integer):Integer;//000322C8

implementation

//000322C0
function Min(A:Integer; B:Integer):Integer;
begin
{*
 000322C0    cmp         edx,eax
>000322C2    jg          000322C6
 000322C4    mov         eax,edx
 000322C6    ret
*}
end;

//000322C8
function Max(A:Integer; B:Integer):Integer;
begin
{*
 000322C8    cmp         edx,eax
>000322CA    jl          000322CE
 000322CC    mov         eax,edx
 000322CE    ret
*}
end;

end.