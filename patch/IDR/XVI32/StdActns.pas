//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit StdActns;

interface

uses
  SysUtils, Classes;

type
  THintAction = class(TCustomAction)
  public
    constructor Create(AOwner:TComponent); virtual;//v2C//0003DE98
  end;
    constructor Create(AOwner:TComponent);//0003DE98

implementation

//0003DE98
constructor THintAction.Create(AOwner:TComponent);
begin
{*
 0003DE98    push        ebx
 0003DE99    push        esi
 0003DE9A    test        dl,dl
>0003DE9C    je          0003DEA6
 0003DE9E    add         esp,0FFFFFFF0
 0003DEA1    call        @ClassCreate
 0003DEA6    mov         ebx,edx
 0003DEA8    mov         esi,eax
 0003DEAA    xor         edx,edx
 0003DEAC    mov         eax,esi
 0003DEAE    call        TCustomAction.Create
 0003DEB3    mov         byte ptr [esi+48],0
 0003DEB7    mov         eax,esi
 0003DEB9    test        bl,bl
>0003DEBB    je          0003DECC
 0003DEBD    call        @AfterConstruction
 0003DEC2    pop         dword ptr fs:[0]
 0003DEC9    add         esp,0C
 0003DECC    mov         eax,esi
 0003DECE    pop         esi
 0003DECF    pop         ebx
 0003DED0    ret
*}
end;

end.