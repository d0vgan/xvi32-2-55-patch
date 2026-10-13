//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit DsgnIntf;

interface

uses
  SysUtils, Classes;

type
  TPropertyEditor = class(TObject)
  public
    FDesigner:IFormDesigner;//f4
    FPropList:PInstPropList;//f8
    FPropCount:Integer;//fC
    destructor Destroy; virtual;//00089C10
    procedure v0; virtual;//v0//00089C3C
    function AllEqual:Boolean; virtual;//v4//00089C40
    function AutoFill:Boolean; virtual;//v8//00089D3C
    procedure Edit; virtual;//vC//00089C48
    function GetEditLimit:Integer; virtual;//v14//00089D4C
    function GetName:AnsiString; virtual;//v18//00089D54
    procedure GetProperties(Proc:TGetPropEditProc); virtual;//v1C//00089D70
    function GetValue:AnsiString; virtual;//v20//00089D78
    procedure GetValues(Proc:TGetStrProc); virtual;//v24//00089D8C
    procedure v28; virtual;//v28//00089D94
    procedure v2C; virtual;//v2C//00089D98
  end;
    destructor Destroy;//00089C10
    procedure sub_00089C3C;//00089C3C
    function AllEqual:Boolean;//00089C40
    procedure Edit;//00089C48
    function AutoFill:Boolean;//00089D3C
    function GetAttributes:TPropertyAttributes;//00089D40
    function GetEditLimit:Integer;//00089D4C
    function GetName:AnsiString;//00089D54
    procedure GetProperties(Proc:TGetPropEditProc);//00089D70
    function GetValue:AnsiString;//00089D78
    procedure GetValues(Proc:TGetStrProc);//00089D8C
    procedure sub_00089D94;//00089D94
    procedure sub_00089D98;//00089D98

implementation

//00089C10
destructor TPropertyEditor.Destroy;
begin
{*
 00089C10    push        ebx
 00089C11    push        esi
 00089C12    call        @BeforeDestruction
 00089C17    mov         ebx,edx
 00089C19    mov         esi,eax
 00089C1B    mov         eax,dword ptr [esi+8]
 00089C1E    test        eax,eax
>00089C20    je          00089C2D
 00089C22    mov         edx,dword ptr [esi+0C]
 00089C25    shl         edx,3
 00089C28    call        @FreeMem
 00089C2D    test        bl,bl
>00089C2F    jle         00089C38
 00089C31    mov         eax,esi
 00089C33    call        @ClassDestroy
 00089C38    pop         esi
 00089C39    pop         ebx
 00089C3A    ret
*}
end;

//00089C3C
procedure sub_00089C3C;
begin
{*
 00089C3C    ret
*}
end;

//00089C40
function TPropertyEditor.AllEqual:Boolean;
begin
{*
 00089C40    cmp         dword ptr [eax+0C],1
 00089C44    sete        al
 00089C47    ret
*}
end;

//00089C48
procedure TPropertyEditor.Edit;
begin
{*
 00089C48    push        ebp
 00089C49    mov         ebp,esp
 00089C4B    add         esp,0FFFFFFF0
 00089C4E    push        ebx
 00089C4F    push        esi
 00089C50    xor         edx,edx
 00089C52    mov         dword ptr [ebp-10],edx
 00089C55    mov         ebx,eax
 00089C57    xor         eax,eax
 00089C59    push        ebp
 00089C5A    push        89D2D
 00089C5F    push        dword ptr fs:[eax]
 00089C62    mov         dword ptr fs:[eax],esp
 00089C65    mov         dl,1
 00089C67    mov         eax,[0001F340];TStringList
 00089C6C    call        TObject.Create
 00089C71    mov         dword ptr [ebp-4],eax
 00089C74    mov         eax,ebx
 00089C76    mov         edx,dword ptr [eax]
 00089C78    call        dword ptr [edx+10]
 00089C7B    test        al,20
 00089C7D    setne       dl
 00089C80    mov         eax,dword ptr [ebp-4]
 00089C83    call        TStringList.SetSorted
 00089C88    xor         eax,eax
 00089C8A    push        ebp
 00089C8B    push        89D10
 00089C90    push        dword ptr fs:[eax]
 00089C93    mov         dword ptr fs:[eax],esp
 00089C96    mov         eax,dword ptr [ebp-4]
 00089C99    mov         dword ptr [ebp-8],eax
 00089C9C    mov         eax,dword ptr [eax]
 00089C9E    mov         eax,dword ptr [eax+34]
 00089CA1    mov         dword ptr [ebp-0C],eax
 00089CA4    push        dword ptr [ebp-8]
 00089CA7    push        dword ptr [ebp-0C]
 00089CAA    mov         eax,ebx
 00089CAC    mov         edx,dword ptr [eax]
 00089CAE    call        dword ptr [edx+24]
 00089CB1    mov         eax,dword ptr [ebp-4]
 00089CB4    mov         edx,dword ptr [eax]
 00089CB6    call        dword ptr [edx+14]
 00089CB9    test        eax,eax
>00089CBB    jle         00089CFA
 00089CBD    lea         edx,[ebp-10]
 00089CC0    mov         eax,ebx
 00089CC2    mov         ecx,dword ptr [eax]
 00089CC4    call        dword ptr [ecx+20]
 00089CC7    mov         edx,dword ptr [ebp-10]
 00089CCA    mov         eax,dword ptr [ebp-4]
 00089CCD    mov         ecx,dword ptr [eax]
 00089CCF    call        dword ptr [ecx+50]
 00089CD2    mov         esi,eax
 00089CD4    inc         esi
 00089CD5    mov         eax,dword ptr [ebp-4]
 00089CD8    mov         edx,dword ptr [eax]
 00089CDA    call        dword ptr [edx+14]
 00089CDD    cmp         esi,eax
>00089CDF    jne         00089CE3
 00089CE1    xor         esi,esi
 00089CE3    lea         ecx,[ebp-10]
 00089CE6    mov         edx,esi
 00089CE8    mov         eax,dword ptr [ebp-4]
 00089CEB    mov         esi,dword ptr [eax]
 00089CED    call        dword ptr [esi+0C]
 00089CF0    mov         edx,dword ptr [ebp-10]
 00089CF3    mov         eax,ebx
 00089CF5    mov         ecx,dword ptr [eax]
 00089CF7    call        dword ptr [ecx+2C]
 00089CFA    xor         eax,eax
 00089CFC    pop         edx
 00089CFD    pop         ecx
 00089CFE    pop         ecx
 00089CFF    mov         dword ptr fs:[eax],edx
 00089D02    push        89D17
 00089D07    mov         eax,dword ptr [ebp-4]
 00089D0A    call        TObject.Free
 00089D0F    ret
>00089D10    jmp         @HandleFinally
>00089D15    jmp         00089D07
 00089D17    xor         eax,eax
 00089D19    pop         edx
 00089D1A    pop         ecx
 00089D1B    pop         ecx
 00089D1C    mov         dword ptr fs:[eax],edx
 00089D1F    push        89D34
 00089D24    lea         eax,[ebp-10]
 00089D27    call        @LStrClr
 00089D2C    ret
>00089D2D    jmp         @HandleFinally
>00089D32    jmp         00089D24
 00089D34    pop         esi
 00089D35    pop         ebx
 00089D36    mov         esp,ebp
 00089D38    pop         ebp
 00089D39    ret
*}
end;

//00089D3C
function TPropertyEditor.AutoFill:Boolean;
begin
{*
 00089D3C    mov         al,1
 00089D3E    ret
*}
end;

//00089D40
function TDateProperty.GetAttributes:TPropertyAttributes;
begin
{*
 00089D40    mov         al,[00089D48]
 00089D45    ret
*}
end;

//00089D4C
function TPropertyEditor.GetEditLimit:Integer;
begin
{*
 00089D4C    mov         eax,0FF
 00089D51    ret
*}
end;

//00089D54
function TPropertyEditor.GetName:AnsiString;
begin
{*
 00089D54    push        ebx
 00089D55    push        esi
 00089D56    mov         esi,edx
 00089D58    mov         ebx,eax
 00089D5A    mov         eax,esi
 00089D5C    mov         edx,dword ptr [ebx+8]
 00089D5F    mov         edx,dword ptr [edx+4]
 00089D62    add         edx,1A
 00089D65    call        @LStrFromString
 00089D6A    pop         esi
 00089D6B    pop         ebx
 00089D6C    ret
*}
end;

//00089D70
procedure TPropertyEditor.GetProperties(Proc:TGetPropEditProc);
begin
{*
 00089D70    push        ebp
 00089D71    mov         ebp,esp
 00089D73    pop         ebp
 00089D74    ret         8
*}
end;

//00089D78
function TPropertyEditor.GetValue:AnsiString;
begin
{*
 00089D78    push        ebx
 00089D79    mov         ebx,edx
 00089D7B    mov         edx,ebx
 00089D7D    mov         eax,[000B57A0];^srUnknown:TResStringRec
 00089D82    call        LoadResString
 00089D87    pop         ebx
 00089D88    ret
*}
end;

//00089D8C
procedure TPropertyEditor.GetValues(Proc:TGetStrProc);
begin
{*
 00089D8C    push        ebp
 00089D8D    mov         ebp,esp
 00089D8F    pop         ebp
 00089D90    ret         8
*}
end;

//00089D94
procedure sub_00089D94;
begin
{*
 00089D94    ret
*}
end;

//00089D98
procedure sub_00089D98;
begin
{*
 00089D98    ret
*}
end;

Initialization
Finalization
//00089E5C
{*
 00089E5C    push        ebp
 00089E5D    mov         ebp,esp
 00089E5F    xor         eax,eax
 00089E61    push        ebp
 00089E62    push        89EC0
 00089E67    push        dword ptr fs:[eax]
 00089E6A    mov         dword ptr fs:[eax],esp
 00089E6D    inc         dword ptr ds:[0B6AE0]
>00089E73    jne         00089EB2
 00089E75    mov         eax,[000B4EB8]
 00089E7A    call        TObject.Free
 00089E7F    mov         eax,[000B4EB4]
 00089E84    call        TObject.Free
 00089E89    mov         eax,[000B4EEC]
 00089E8E    call        TObject.Free
 00089E93    mov         eax,[000B4EBC]
 00089E98    call        TObject.Free
 00089E9D    mov         eax,0B4EC0;^'mrNone'
 00089EA2    mov         ecx,0B
 00089EA7    mov         edx,dword ptr ds:[110CC];String
 00089EAD    call        @FinalizeArray
 00089EB2    xor         eax,eax
 00089EB4    pop         edx
 00089EB5    pop         ecx
 00089EB6    pop         ecx
 00089EB7    mov         dword ptr fs:[eax],edx
 00089EBA    push        89EC7
 00089EBF    ret
>00089EC0    jmp         @HandleFinally
>00089EC5    jmp         00089EBF
 00089EC7    pop         ebp
 00089EC8    ret
*}
end.