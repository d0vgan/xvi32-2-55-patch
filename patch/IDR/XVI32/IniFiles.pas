//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit IniFiles;

interface

uses
  SysUtils, Classes;

type
  TCustomIniFile = class(TObject)
  public
    FFileName:String;//f4
    procedure ReadString; virtual; abstract;//v0//000129A8
    procedure WriteString; virtual; abstract;//v4//000129A8
    function ReadInteger(const Section:AnsiString; const Ident:AnsiString; Default:Longint):Longint; virtual;//v8//00077A10
    procedure WriteInteger(const Section:AnsiString; const Ident:AnsiString; Value:Longint); virtual;//vC//00077AD4
    function ReadBool(const Section:AnsiString; const Ident:AnsiString; Default:Boolean):Boolean; virtual;//v10//00077B30
    procedure WriteBool(const Section:AnsiString; const Ident:AnsiString; Value:Boolean); virtual;//v14//00077FD8
    function ReadDate(const Section:AnsiString; const Name:AnsiString; Default:TDateTime):TDateTime; virtual;//v18//00077B5C
    function ReadDateTime(const Section:AnsiString; const Name:AnsiString; Default:TDateTime):TDateTime; virtual;//v1C//00077C14
    function ReadFloat(const Section:AnsiString; const Name:AnsiString; Default:Double):Double; virtual;//v20//00077CCC
    function ReadTime(const Section:AnsiString; const Name:AnsiString; Default:TDateTime):TDateTime; virtual;//v24//00077D84
    procedure WriteDate(const Section:AnsiString; const Name:AnsiString; Value:TDateTime); virtual;//v28//00077E3C
    procedure WriteDateTime(const Section:AnsiString; const Name:AnsiString; Value:TDateTime); virtual;//v2C//00077E9C
    procedure WriteFloat(const Section:AnsiString; const Name:AnsiString; Value:Double); virtual;//v30//00077EFC
    procedure WriteTime(const Section:AnsiString; const Name:AnsiString; Value:TDateTime); virtual;//v34//00077F60
    procedure ReadSection; virtual; abstract;//v38//000129A8
    procedure ReadSections; virtual; abstract;//v3C//000129A8
    procedure ReadSectionValues; virtual; abstract;//v40//000129A8
    procedure EraseSection; virtual; abstract;//v44//000129A8
    procedure DeleteKey; virtual; abstract;//v48//000129A8
    procedure UpdateFile; virtual; abstract;//v4C//000129A8
    constructor Create(const FileName:AnsiString);//000779D4
  end;
  TIniFile = class(TCustomIniFile)
  public
    function ReadString(const Section:AnsiString; const Ident:AnsiString; const Default:AnsiString):AnsiString; virtual;//v0//00077FF4
    procedure WriteString(const Section:AnsiString; const Ident:AnsiString; const Value:AnsiString); virtual;//v4//00078054
    procedure ReadSection(const Section:AnsiString; Strings:TStrings); virtual;//v38//000781F8
    procedure ReadSections(Strings:TStrings); virtual;//v3C//000780F8
    procedure ReadSectionValues(const Section:AnsiString; Strings:TStrings); virtual;//v40//00078300
    procedure EraseSection(const Section:AnsiString); virtual;//v44//00078420
    procedure DeleteKey(const Section:AnsiString; const Ident:AnsiString); virtual;//v48//000784B4
    procedure UpdateFile; virtual;//v4C//000784E4
  end;
    function ReadInteger(const Section:AnsiString; const Ident:AnsiString; Default:Longint):Longint;//00077A10
    procedure WriteInteger(const Section:AnsiString; const Ident:AnsiString; Value:Longint);//00077AD4
    function ReadBool(const Section:AnsiString; const Ident:AnsiString; Default:Boolean):Boolean;//00077B30
    function ReadDate(const Section:AnsiString; const Name:AnsiString; Default:TDateTime):TDateTime;//00077B5C
    function ReadDateTime(const Section:AnsiString; const Name:AnsiString; Default:TDateTime):TDateTime;//00077C14
    function ReadFloat(const Section:AnsiString; const Name:AnsiString; Default:Double):Double;//00077CCC
    function ReadTime(const Section:AnsiString; const Name:AnsiString; Default:TDateTime):TDateTime;//00077D84
    procedure WriteDate(const Section:AnsiString; const Name:AnsiString; Value:TDateTime);//00077E3C
    procedure WriteDateTime(const Section:AnsiString; const Name:AnsiString; Value:TDateTime);//00077E9C
    procedure WriteFloat(const Section:AnsiString; const Name:AnsiString; Value:Double);//00077EFC
    procedure WriteTime(const Section:AnsiString; const Name:AnsiString; Value:TDateTime);//00077F60
    procedure WriteBool(const Section:AnsiString; const Ident:AnsiString; Value:Boolean);//00077FD8
    function ReadString(const Section:AnsiString; const Ident:AnsiString; const Default:AnsiString):AnsiString;//00077FF4
    procedure WriteString(const Section:AnsiString; const Ident:AnsiString; const Value:AnsiString);//00078054
    procedure ReadSections(Strings:TStrings);//000780F8
    procedure ReadSection(const Section:AnsiString; Strings:TStrings);//000781F8
    procedure ReadSectionValues(const Section:AnsiString; Strings:TStrings);//00078300
    procedure EraseSection(const Section:AnsiString);//00078420
    procedure DeleteKey(const Section:AnsiString; const Ident:AnsiString);//000784B4
    procedure UpdateFile;//000784E4

implementation

//000779D4
constructor TCustomIniFile.Create(const FileName:AnsiString);
begin
{*
 000779D4    push        ebx
 000779D5    push        esi
 000779D6    push        edi
 000779D7    test        dl,dl
>000779D9    je          000779E3
 000779DB    add         esp,0FFFFFFF0
 000779DE    call        @ClassCreate
 000779E3    mov         esi,ecx
 000779E5    mov         ebx,edx
 000779E7    mov         edi,eax
 000779E9    lea         eax,[edi+4]
 000779EC    mov         edx,esi
 000779EE    call        @LStrAsg
 000779F3    mov         eax,edi
 000779F5    test        bl,bl
>000779F7    je          00077A08
 000779F9    call        @AfterConstruction
 000779FE    pop         dword ptr fs:[0]
 00077A05    add         esp,0C
 00077A08    mov         eax,edi
 00077A0A    pop         edi
 00077A0B    pop         esi
 00077A0C    pop         ebx
 00077A0D    ret
*}
end;

//00077A10
function TCustomIniFile.ReadInteger(const Section:AnsiString; const Ident:AnsiString; Default:Longint):Longint;
begin
{*
 00077A10    push        ebp
 00077A11    mov         ebp,esp
 00077A13    push        0
 00077A15    push        0
 00077A17    push        0
 00077A19    push        ebx
 00077A1A    push        esi
 00077A1B    mov         dword ptr [ebp-4],ecx
 00077A1E    mov         esi,edx
 00077A20    mov         ebx,eax
 00077A22    xor         eax,eax
 00077A24    push        ebp
 00077A25    push        77AB4
 00077A2A    push        dword ptr fs:[eax]
 00077A2D    mov         dword ptr fs:[eax],esp
 00077A30    push        0
 00077A32    lea         eax,[ebp-8]
 00077A35    push        eax
 00077A36    mov         ecx,dword ptr [ebp-4]
 00077A39    mov         edx,esi
 00077A3B    mov         eax,ebx
 00077A3D    mov         ebx,dword ptr [eax]
 00077A3F    call        dword ptr [ebx]
 00077A41    mov         eax,dword ptr [ebp-8]
 00077A44    call        @LStrLen
 00077A49    cmp         eax,2
>00077A4C    jle         00077A8C
 00077A4E    mov         eax,dword ptr [ebp-8]
 00077A51    cmp         byte ptr [eax],30
>00077A54    jne         00077A8C
 00077A56    mov         eax,dword ptr [ebp-8]
 00077A59    mov         bl,byte ptr [eax+1]
 00077A5C    cmp         bl,58
>00077A5F    je          00077A66
 00077A61    cmp         bl,78
>00077A64    jne         00077A8C
 00077A66    lea         eax,[ebp-0C]
 00077A69    push        eax
 00077A6A    mov         ecx,7FFFFFFF
 00077A6F    mov         edx,3
 00077A74    mov         eax,dword ptr [ebp-8]
 00077A77    call        @LStrCopy
 00077A7C    mov         ecx,dword ptr [ebp-0C]
 00077A7F    lea         eax,[ebp-8]
 00077A82    mov         edx,77AD0;'$'
 00077A87    call        @LStrCat3
 00077A8C    mov         edx,dword ptr [ebp+8]
 00077A8F    mov         eax,dword ptr [ebp-8]
 00077A92    call        StrToIntDef
 00077A97    mov         ebx,eax
 00077A99    xor         eax,eax
 00077A9B    pop         edx
 00077A9C    pop         ecx
 00077A9D    pop         ecx
 00077A9E    mov         dword ptr fs:[eax],edx
 00077AA1    push        77ABB
 00077AA6    lea         eax,[ebp-0C]
 00077AA9    mov         edx,2
 00077AAE    call        @LStrArrayClr
 00077AB3    ret
>00077AB4    jmp         @HandleFinally
>00077AB9    jmp         00077AA6
 00077ABB    mov         eax,ebx
 00077ABD    pop         esi
 00077ABE    pop         ebx
 00077ABF    mov         esp,ebp
 00077AC1    pop         ebp
 00077AC2    ret         4
*}
end;

//00077AD4
procedure TCustomIniFile.WriteInteger(const Section:AnsiString; const Ident:AnsiString; Value:Longint);
begin
{*
 00077AD4    push        ebp
 00077AD5    mov         ebp,esp
 00077AD7    push        0
 00077AD9    push        ebx
 00077ADA    push        esi
 00077ADB    push        edi
 00077ADC    mov         edi,ecx
 00077ADE    mov         esi,edx
 00077AE0    mov         ebx,eax
 00077AE2    xor         eax,eax
 00077AE4    push        ebp
 00077AE5    push        77B20
 00077AEA    push        dword ptr fs:[eax]
 00077AED    mov         dword ptr fs:[eax],esp
 00077AF0    lea         edx,[ebp-4]
 00077AF3    mov         eax,dword ptr [ebp+8]
 00077AF6    call        IntToStr
 00077AFB    mov         eax,dword ptr [ebp-4]
 00077AFE    push        eax
 00077AFF    mov         ecx,edi
 00077B01    mov         edx,esi
 00077B03    mov         eax,ebx
 00077B05    mov         ebx,dword ptr [eax]
 00077B07    call        dword ptr [ebx+4]
 00077B0A    xor         eax,eax
 00077B0C    pop         edx
 00077B0D    pop         ecx
 00077B0E    pop         ecx
 00077B0F    mov         dword ptr fs:[eax],edx
 00077B12    push        77B27
 00077B17    lea         eax,[ebp-4]
 00077B1A    call        @LStrClr
 00077B1F    ret
>00077B20    jmp         @HandleFinally
>00077B25    jmp         00077B17
 00077B27    pop         edi
 00077B28    pop         esi
 00077B29    pop         ebx
 00077B2A    pop         ecx
 00077B2B    pop         ebp
 00077B2C    ret         4
*}
end;

//00077B30
function TCustomIniFile.ReadBool(const Section:AnsiString; const Ident:AnsiString; Default:Boolean):Boolean;
begin
{*
 00077B30    push        ebp
 00077B31    mov         ebp,esp
 00077B33    push        ecx
 00077B34    push        ebx
 00077B35    push        esi
 00077B36    mov         dword ptr [ebp-4],ecx
 00077B39    mov         esi,edx
 00077B3B    mov         ebx,eax
 00077B3D    xor         eax,eax
 00077B3F    mov         al,byte ptr [ebp+8]
 00077B42    push        eax
 00077B43    mov         ecx,dword ptr [ebp-4]
 00077B46    mov         edx,esi
 00077B48    mov         eax,ebx
 00077B4A    mov         ebx,dword ptr [eax]
 00077B4C    call        dword ptr [ebx+8]
 00077B4F    test        eax,eax
 00077B51    setne       al
 00077B54    pop         esi
 00077B55    pop         ebx
 00077B56    pop         ecx
 00077B57    pop         ebp
 00077B58    ret         4
*}
end;

//00077B5C
function TCustomIniFile.ReadDate(const Section:AnsiString; const Name:AnsiString; Default:TDateTime):TDateTime;
begin
{*
 00077B5C    push        ebp
 00077B5D    mov         ebp,esp
 00077B5F    add         esp,0FFFFFFF0
 00077B62    push        ebx
 00077B63    push        esi
 00077B64    push        edi
 00077B65    xor         ebx,ebx
 00077B67    mov         dword ptr [ebp-10],ebx
 00077B6A    mov         dword ptr [ebp-4],ecx
 00077B6D    mov         esi,edx
 00077B6F    mov         ebx,eax
 00077B71    xor         eax,eax
 00077B73    push        ebp
 00077B74    push        77C01
 00077B79    push        dword ptr fs:[eax]
 00077B7C    mov         dword ptr fs:[eax],esp
 00077B7F    push        0
 00077B81    lea         eax,[ebp-10]
 00077B84    push        eax
 00077B85    mov         ecx,dword ptr [ebp-4]
 00077B88    mov         edx,esi
 00077B8A    mov         eax,ebx
 00077B8C    mov         ebx,dword ptr [eax]
 00077B8E    call        dword ptr [ebx]
 00077B90    mov         eax,dword ptr [ebp+8]
 00077B93    mov         dword ptr [ebp-0C],eax
 00077B96    mov         eax,dword ptr [ebp+0C]
 00077B99    mov         dword ptr [ebp-8],eax
 00077B9C    cmp         dword ptr [ebp-10],0
>00077BA0    je          00077BEB
 00077BA2    xor         eax,eax
 00077BA4    push        ebp
 00077BA5    push        77BC6
 00077BAA    push        dword ptr fs:[eax]
 00077BAD    mov         dword ptr fs:[eax],esp
 00077BB0    mov         eax,dword ptr [ebp-10]
 00077BB3    call        StrToDate
 00077BB8    fstp        qword ptr [ebp-0C]
 00077BBB    wait
 00077BBC    xor         eax,eax
 00077BBE    pop         edx
 00077BBF    pop         ecx
 00077BC0    pop         ecx
 00077BC1    mov         dword ptr fs:[eax],edx
>00077BC4    jmp         00077BEB
>00077BC6    jmp         @HandleOnException
 00077BCB    dd          2
 00077BCF    dd          00017D40;EConvertError
 00077BD3    dd          00077BE6
 00077BD7    dd          00000000
 00077BDB    dd          00077BE1
>00077BDF    jmp         00077BE6
 00077BE1    call        @RaiseAgain
 00077BE6    call        @DoneExcept
 00077BEB    xor         eax,eax
 00077BED    pop         edx
 00077BEE    pop         ecx
 00077BEF    pop         ecx
 00077BF0    mov         dword ptr fs:[eax],edx
 00077BF3    push        77C08
 00077BF8    lea         eax,[ebp-10]
 00077BFB    call        @LStrClr
 00077C00    ret
>00077C01    jmp         @HandleFinally
>00077C06    jmp         00077BF8
 00077C08    fld         qword ptr [ebp-0C]
 00077C0B    pop         edi
 00077C0C    pop         esi
 00077C0D    pop         ebx
 00077C0E    mov         esp,ebp
 00077C10    pop         ebp
 00077C11    ret         8
*}
end;

//00077C14
function TCustomIniFile.ReadDateTime(const Section:AnsiString; const Name:AnsiString; Default:TDateTime):TDateTime;
begin
{*
 00077C14    push        ebp
 00077C15    mov         ebp,esp
 00077C17    add         esp,0FFFFFFF0
 00077C1A    push        ebx
 00077C1B    push        esi
 00077C1C    push        edi
 00077C1D    xor         ebx,ebx
 00077C1F    mov         dword ptr [ebp-10],ebx
 00077C22    mov         dword ptr [ebp-4],ecx
 00077C25    mov         esi,edx
 00077C27    mov         ebx,eax
 00077C29    xor         eax,eax
 00077C2B    push        ebp
 00077C2C    push        77CB9
 00077C31    push        dword ptr fs:[eax]
 00077C34    mov         dword ptr fs:[eax],esp
 00077C37    push        0
 00077C39    lea         eax,[ebp-10]
 00077C3C    push        eax
 00077C3D    mov         ecx,dword ptr [ebp-4]
 00077C40    mov         edx,esi
 00077C42    mov         eax,ebx
 00077C44    mov         ebx,dword ptr [eax]
 00077C46    call        dword ptr [ebx]
 00077C48    mov         eax,dword ptr [ebp+8]
 00077C4B    mov         dword ptr [ebp-0C],eax
 00077C4E    mov         eax,dword ptr [ebp+0C]
 00077C51    mov         dword ptr [ebp-8],eax
 00077C54    cmp         dword ptr [ebp-10],0
>00077C58    je          00077CA3
 00077C5A    xor         eax,eax
 00077C5C    push        ebp
 00077C5D    push        77C7E
 00077C62    push        dword ptr fs:[eax]
 00077C65    mov         dword ptr fs:[eax],esp
 00077C68    mov         eax,dword ptr [ebp-10]
 00077C6B    call        StrToDateTime
 00077C70    fstp        qword ptr [ebp-0C]
 00077C73    wait
 00077C74    xor         eax,eax
 00077C76    pop         edx
 00077C77    pop         ecx
 00077C78    pop         ecx
 00077C79    mov         dword ptr fs:[eax],edx
>00077C7C    jmp         00077CA3
>00077C7E    jmp         @HandleOnException
 00077C83    dd          2
 00077C87    dd          00017D40;EConvertError
 00077C8B    dd          00077C9E
 00077C8F    dd          00000000
 00077C93    dd          00077C99
>00077C97    jmp         00077C9E
 00077C99    call        @RaiseAgain
 00077C9E    call        @DoneExcept
 00077CA3    xor         eax,eax
 00077CA5    pop         edx
 00077CA6    pop         ecx
 00077CA7    pop         ecx
 00077CA8    mov         dword ptr fs:[eax],edx
 00077CAB    push        77CC0
 00077CB0    lea         eax,[ebp-10]
 00077CB3    call        @LStrClr
 00077CB8    ret
>00077CB9    jmp         @HandleFinally
>00077CBE    jmp         00077CB0
 00077CC0    fld         qword ptr [ebp-0C]
 00077CC3    pop         edi
 00077CC4    pop         esi
 00077CC5    pop         ebx
 00077CC6    mov         esp,ebp
 00077CC8    pop         ebp
 00077CC9    ret         8
*}
end;

//00077CCC
function TCustomIniFile.ReadFloat(const Section:AnsiString; const Name:AnsiString; Default:Double):Double;
begin
{*
 00077CCC    push        ebp
 00077CCD    mov         ebp,esp
 00077CCF    add         esp,0FFFFFFF0
 00077CD2    push        ebx
 00077CD3    push        esi
 00077CD4    push        edi
 00077CD5    xor         ebx,ebx
 00077CD7    mov         dword ptr [ebp-10],ebx
 00077CDA    mov         dword ptr [ebp-4],ecx
 00077CDD    mov         esi,edx
 00077CDF    mov         ebx,eax
 00077CE1    xor         eax,eax
 00077CE3    push        ebp
 00077CE4    push        77D71
 00077CE9    push        dword ptr fs:[eax]
 00077CEC    mov         dword ptr fs:[eax],esp
 00077CEF    push        0
 00077CF1    lea         eax,[ebp-10]
 00077CF4    push        eax
 00077CF5    mov         ecx,dword ptr [ebp-4]
 00077CF8    mov         edx,esi
 00077CFA    mov         eax,ebx
 00077CFC    mov         ebx,dword ptr [eax]
 00077CFE    call        dword ptr [ebx]
 00077D00    mov         eax,dword ptr [ebp+8]
 00077D03    mov         dword ptr [ebp-0C],eax
 00077D06    mov         eax,dword ptr [ebp+0C]
 00077D09    mov         dword ptr [ebp-8],eax
 00077D0C    cmp         dword ptr [ebp-10],0
>00077D10    je          00077D5B
 00077D12    xor         eax,eax
 00077D14    push        ebp
 00077D15    push        77D36
 00077D1A    push        dword ptr fs:[eax]
 00077D1D    mov         dword ptr fs:[eax],esp
 00077D20    mov         eax,dword ptr [ebp-10]
 00077D23    call        StrToFloat
 00077D28    fstp        qword ptr [ebp-0C]
 00077D2B    wait
 00077D2C    xor         eax,eax
 00077D2E    pop         edx
 00077D2F    pop         ecx
 00077D30    pop         ecx
 00077D31    mov         dword ptr fs:[eax],edx
>00077D34    jmp         00077D5B
>00077D36    jmp         @HandleOnException
 00077D3B    dd          2
 00077D3F    dd          00017D40;EConvertError
 00077D43    dd          00077D56
 00077D47    dd          00000000
 00077D4B    dd          00077D51
>00077D4F    jmp         00077D56
 00077D51    call        @RaiseAgain
 00077D56    call        @DoneExcept
 00077D5B    xor         eax,eax
 00077D5D    pop         edx
 00077D5E    pop         ecx
 00077D5F    pop         ecx
 00077D60    mov         dword ptr fs:[eax],edx
 00077D63    push        77D78
 00077D68    lea         eax,[ebp-10]
 00077D6B    call        @LStrClr
 00077D70    ret
>00077D71    jmp         @HandleFinally
>00077D76    jmp         00077D68
 00077D78    fld         qword ptr [ebp-0C]
 00077D7B    pop         edi
 00077D7C    pop         esi
 00077D7D    pop         ebx
 00077D7E    mov         esp,ebp
 00077D80    pop         ebp
 00077D81    ret         8
*}
end;

//00077D84
function TCustomIniFile.ReadTime(const Section:AnsiString; const Name:AnsiString; Default:TDateTime):TDateTime;
begin
{*
 00077D84    push        ebp
 00077D85    mov         ebp,esp
 00077D87    add         esp,0FFFFFFF0
 00077D8A    push        ebx
 00077D8B    push        esi
 00077D8C    push        edi
 00077D8D    xor         ebx,ebx
 00077D8F    mov         dword ptr [ebp-10],ebx
 00077D92    mov         dword ptr [ebp-4],ecx
 00077D95    mov         esi,edx
 00077D97    mov         ebx,eax
 00077D99    xor         eax,eax
 00077D9B    push        ebp
 00077D9C    push        77E29
 00077DA1    push        dword ptr fs:[eax]
 00077DA4    mov         dword ptr fs:[eax],esp
 00077DA7    push        0
 00077DA9    lea         eax,[ebp-10]
 00077DAC    push        eax
 00077DAD    mov         ecx,dword ptr [ebp-4]
 00077DB0    mov         edx,esi
 00077DB2    mov         eax,ebx
 00077DB4    mov         ebx,dword ptr [eax]
 00077DB6    call        dword ptr [ebx]
 00077DB8    mov         eax,dword ptr [ebp+8]
 00077DBB    mov         dword ptr [ebp-0C],eax
 00077DBE    mov         eax,dword ptr [ebp+0C]
 00077DC1    mov         dword ptr [ebp-8],eax
 00077DC4    cmp         dword ptr [ebp-10],0
>00077DC8    je          00077E13
 00077DCA    xor         eax,eax
 00077DCC    push        ebp
 00077DCD    push        77DEE
 00077DD2    push        dword ptr fs:[eax]
 00077DD5    mov         dword ptr fs:[eax],esp
 00077DD8    mov         eax,dword ptr [ebp-10]
 00077DDB    call        StrToTime
 00077DE0    fstp        qword ptr [ebp-0C]
 00077DE3    wait
 00077DE4    xor         eax,eax
 00077DE6    pop         edx
 00077DE7    pop         ecx
 00077DE8    pop         ecx
 00077DE9    mov         dword ptr fs:[eax],edx
>00077DEC    jmp         00077E13
>00077DEE    jmp         @HandleOnException
 00077DF3    dd          2
 00077DF7    dd          00017D40;EConvertError
 00077DFB    dd          00077E0E
 00077DFF    dd          00000000
 00077E03    dd          00077E09
>00077E07    jmp         00077E0E
 00077E09    call        @RaiseAgain
 00077E0E    call        @DoneExcept
 00077E13    xor         eax,eax
 00077E15    pop         edx
 00077E16    pop         ecx
 00077E17    pop         ecx
 00077E18    mov         dword ptr fs:[eax],edx
 00077E1B    push        77E30
 00077E20    lea         eax,[ebp-10]
 00077E23    call        @LStrClr
 00077E28    ret
>00077E29    jmp         @HandleFinally
>00077E2E    jmp         00077E20
 00077E30    fld         qword ptr [ebp-0C]
 00077E33    pop         edi
 00077E34    pop         esi
 00077E35    pop         ebx
 00077E36    mov         esp,ebp
 00077E38    pop         ebp
 00077E39    ret         8
*}
end;

//00077E3C
procedure TCustomIniFile.WriteDate(const Section:AnsiString; const Name:AnsiString; Value:TDateTime);
begin
{*
 00077E3C    push        ebp
 00077E3D    mov         ebp,esp
 00077E3F    push        0
 00077E41    push        ebx
 00077E42    push        esi
 00077E43    push        edi
 00077E44    mov         edi,ecx
 00077E46    mov         esi,edx
 00077E48    mov         ebx,eax
 00077E4A    xor         eax,eax
 00077E4C    push        ebp
 00077E4D    push        77E8B
 00077E52    push        dword ptr fs:[eax]
 00077E55    mov         dword ptr fs:[eax],esp
 00077E58    push        dword ptr [ebp+0C]
 00077E5B    push        dword ptr [ebp+8]
 00077E5E    lea         eax,[ebp-4]
 00077E61    call        DateToStr
 00077E66    mov         eax,dword ptr [ebp-4]
 00077E69    push        eax
 00077E6A    mov         ecx,edi
 00077E6C    mov         edx,esi
 00077E6E    mov         eax,ebx
 00077E70    mov         ebx,dword ptr [eax]
 00077E72    call        dword ptr [ebx+4]
 00077E75    xor         eax,eax
 00077E77    pop         edx
 00077E78    pop         ecx
 00077E79    pop         ecx
 00077E7A    mov         dword ptr fs:[eax],edx
 00077E7D    push        77E92
 00077E82    lea         eax,[ebp-4]
 00077E85    call        @LStrClr
 00077E8A    ret
>00077E8B    jmp         @HandleFinally
>00077E90    jmp         00077E82
 00077E92    pop         edi
 00077E93    pop         esi
 00077E94    pop         ebx
 00077E95    pop         ecx
 00077E96    pop         ebp
 00077E97    ret         8
*}
end;

//00077E9C
procedure TCustomIniFile.WriteDateTime(const Section:AnsiString; const Name:AnsiString; Value:TDateTime);
begin
{*
 00077E9C    push        ebp
 00077E9D    mov         ebp,esp
 00077E9F    push        0
 00077EA1    push        ebx
 00077EA2    push        esi
 00077EA3    push        edi
 00077EA4    mov         edi,ecx
 00077EA6    mov         esi,edx
 00077EA8    mov         ebx,eax
 00077EAA    xor         eax,eax
 00077EAC    push        ebp
 00077EAD    push        77EEB
 00077EB2    push        dword ptr fs:[eax]
 00077EB5    mov         dword ptr fs:[eax],esp
 00077EB8    push        dword ptr [ebp+0C]
 00077EBB    push        dword ptr [ebp+8]
 00077EBE    lea         eax,[ebp-4]
 00077EC1    call        DateTimeToStr
 00077EC6    mov         eax,dword ptr [ebp-4]
 00077EC9    push        eax
 00077ECA    mov         ecx,edi
 00077ECC    mov         edx,esi
 00077ECE    mov         eax,ebx
 00077ED0    mov         ebx,dword ptr [eax]
 00077ED2    call        dword ptr [ebx+4]
 00077ED5    xor         eax,eax
 00077ED7    pop         edx
 00077ED8    pop         ecx
 00077ED9    pop         ecx
 00077EDA    mov         dword ptr fs:[eax],edx
 00077EDD    push        77EF2
 00077EE2    lea         eax,[ebp-4]
 00077EE5    call        @LStrClr
 00077EEA    ret
>00077EEB    jmp         @HandleFinally
>00077EF0    jmp         00077EE2
 00077EF2    pop         edi
 00077EF3    pop         esi
 00077EF4    pop         ebx
 00077EF5    pop         ecx
 00077EF6    pop         ebp
 00077EF7    ret         8
*}
end;

//00077EFC
procedure TCustomIniFile.WriteFloat(const Section:AnsiString; const Name:AnsiString; Value:Double);
begin
{*
 00077EFC    push        ebp
 00077EFD    mov         ebp,esp
 00077EFF    push        0
 00077F01    push        ebx
 00077F02    push        esi
 00077F03    push        edi
 00077F04    mov         edi,ecx
 00077F06    mov         esi,edx
 00077F08    mov         ebx,eax
 00077F0A    xor         eax,eax
 00077F0C    push        ebp
 00077F0D    push        77F4F
 00077F12    push        dword ptr fs:[eax]
 00077F15    mov         dword ptr fs:[eax],esp
 00077F18    fld         qword ptr [ebp+8]
 00077F1B    add         esp,0FFFFFFF4
 00077F1E    fstp        tbyte ptr [esp]
 00077F21    wait
 00077F22    lea         eax,[ebp-4]
 00077F25    call        FloatToStr
 00077F2A    mov         eax,dword ptr [ebp-4]
 00077F2D    push        eax
 00077F2E    mov         ecx,edi
 00077F30    mov         edx,esi
 00077F32    mov         eax,ebx
 00077F34    mov         ebx,dword ptr [eax]
 00077F36    call        dword ptr [ebx+4]
 00077F39    xor         eax,eax
 00077F3B    pop         edx
 00077F3C    pop         ecx
 00077F3D    pop         ecx
 00077F3E    mov         dword ptr fs:[eax],edx
 00077F41    push        77F56
 00077F46    lea         eax,[ebp-4]
 00077F49    call        @LStrClr
 00077F4E    ret
>00077F4F    jmp         @HandleFinally
>00077F54    jmp         00077F46
 00077F56    pop         edi
 00077F57    pop         esi
 00077F58    pop         ebx
 00077F59    pop         ecx
 00077F5A    pop         ebp
 00077F5B    ret         8
*}
end;

//00077F60
procedure TCustomIniFile.WriteTime(const Section:AnsiString; const Name:AnsiString; Value:TDateTime);
begin
{*
 00077F60    push        ebp
 00077F61    mov         ebp,esp
 00077F63    push        0
 00077F65    push        ebx
 00077F66    push        esi
 00077F67    push        edi
 00077F68    mov         edi,ecx
 00077F6A    mov         esi,edx
 00077F6C    mov         ebx,eax
 00077F6E    xor         eax,eax
 00077F70    push        ebp
 00077F71    push        77FAF
 00077F76    push        dword ptr fs:[eax]
 00077F79    mov         dword ptr fs:[eax],esp
 00077F7C    push        dword ptr [ebp+0C]
 00077F7F    push        dword ptr [ebp+8]
 00077F82    lea         eax,[ebp-4]
 00077F85    call        TimeToStr
 00077F8A    mov         eax,dword ptr [ebp-4]
 00077F8D    push        eax
 00077F8E    mov         ecx,edi
 00077F90    mov         edx,esi
 00077F92    mov         eax,ebx
 00077F94    mov         ebx,dword ptr [eax]
 00077F96    call        dword ptr [ebx+4]
 00077F99    xor         eax,eax
 00077F9B    pop         edx
 00077F9C    pop         ecx
 00077F9D    pop         ecx
 00077F9E    mov         dword ptr fs:[eax],edx
 00077FA1    push        77FB6
 00077FA6    lea         eax,[ebp-4]
 00077FA9    call        @LStrClr
 00077FAE    ret
>00077FAF    jmp         @HandleFinally
>00077FB4    jmp         00077FA6
 00077FB6    pop         edi
 00077FB7    pop         esi
 00077FB8    pop         ebx
 00077FB9    pop         ecx
 00077FBA    pop         ebp
 00077FBB    ret         8
*}
end;

//00077FD8
procedure TCustomIniFile.WriteBool(const Section:AnsiString; const Ident:AnsiString; Value:Boolean);
begin
{*
 00077FD8    push        ebp
 00077FD9    mov         ebp,esp
 00077FDB    push        ebx
 00077FDC    xor         ebx,ebx
 00077FDE    mov         bl,byte ptr [ebp+8]
 00077FE1    mov         ebx,dword ptr [ebx*4+0B4DE8]
 00077FE8    push        ebx
 00077FE9    mov         ebx,dword ptr [eax]
 00077FEB    call        dword ptr [ebx+4]
 00077FEE    pop         ebx
 00077FEF    pop         ebp
 00077FF0    ret         4
*}
end;

//00077FF4
function TIniFile.ReadString(const Section:AnsiString; const Ident:AnsiString; const Default:AnsiString):AnsiString;
begin
{*
 00077FF4    push        ebp
 00077FF5    mov         ebp,esp
 00077FF7    add         esp,0FFFFF800
 00077FFD    push        ebx
 00077FFE    push        esi
 00077FFF    push        edi
 00078000    mov         edi,ecx
 00078002    mov         esi,edx
 00078004    mov         ebx,eax
 00078006    mov         eax,dword ptr [ebx+4]
 00078009    call        @LStrToPChar
 0007800E    push        eax
 0007800F    push        800
 00078014    lea         eax,[ebp-800]
 0007801A    push        eax
 0007801B    mov         eax,dword ptr [ebp+0C]
 0007801E    call        @LStrToPChar
 00078023    push        eax
 00078024    mov         eax,edi
 00078026    call        @LStrToPChar
 0007802B    push        eax
 0007802C    mov         eax,esi
 0007802E    call        @LStrToPChar
 00078033    push        eax
 00078034    call        kernel32.GetPrivateProfileStringA
 00078039    mov         ecx,eax
 0007803B    lea         edx,[ebp-800]
 00078041    mov         eax,dword ptr [ebp+8]
 00078044    call        @LStrFromPCharLen
 00078049    pop         edi
 0007804A    pop         esi
 0007804B    pop         ebx
 0007804C    mov         esp,ebp
 0007804E    pop         ebp
 0007804F    ret         8
*}
end;

//00078054
procedure TIniFile.WriteString(const Section:AnsiString; const Ident:AnsiString; const Value:AnsiString);
begin
{*
 00078054    push        ebp
 00078055    mov         ebp,esp
 00078057    add         esp,0FFFFFFF4
 0007805A    push        ebx
 0007805B    push        esi
 0007805C    push        edi
 0007805D    xor         ebx,ebx
 0007805F    mov         dword ptr [ebp-0C],ebx
 00078062    mov         edi,ecx
 00078064    mov         esi,edx
 00078066    mov         ebx,eax
 00078068    xor         eax,eax
 0007806A    push        ebp
 0007806B    push        780E8
 00078070    push        dword ptr fs:[eax]
 00078073    mov         dword ptr fs:[eax],esp
 00078076    mov         eax,dword ptr [ebx+4]
 00078079    call        @LStrToPChar
 0007807E    push        eax
 0007807F    mov         eax,dword ptr [ebp+8]
 00078082    call        @LStrToPChar
 00078087    push        eax
 00078088    mov         eax,edi
 0007808A    call        @LStrToPChar
 0007808F    push        eax
 00078090    mov         eax,esi
 00078092    call        @LStrToPChar
 00078097    push        eax
 00078098    call        kernel32.WritePrivateProfileStringA
 0007809D    test        eax,eax
>0007809F    jne         000780D2
 000780A1    mov         eax,dword ptr [ebx+4]
 000780A4    mov         dword ptr [ebp-8],eax
 000780A7    mov         byte ptr [ebp-4],0B
 000780AB    lea         eax,[ebp-8]
 000780AE    push        eax
 000780AF    push        0
 000780B1    lea         edx,[ebp-0C]
 000780B4    mov         eax,[000B5AC0];^SIniFileWriteError:TResStringRec
 000780B9    call        LoadResString
 000780BE    mov         ecx,dword ptr [ebp-0C]
 000780C1    mov         dl,1
 000780C3    mov         eax,[000176E8];Exception
 000780C8    call        Exception.CreateFmt
 000780CD    call        @RaiseExcept
 000780D2    xor         eax,eax
 000780D4    pop         edx
 000780D5    pop         ecx
 000780D6    pop         ecx
 000780D7    mov         dword ptr fs:[eax],edx
 000780DA    push        780EF
 000780DF    lea         eax,[ebp-0C]
 000780E2    call        @LStrClr
 000780E7    ret
>000780E8    jmp         @HandleFinally
>000780ED    jmp         000780DF
 000780EF    pop         edi
 000780F0    pop         esi
 000780F1    pop         ebx
 000780F2    mov         esp,ebp
 000780F4    pop         ebp
 000780F5    ret         4
*}
end;

//000780F8
procedure TIniFile.ReadSections(Strings:TStrings);
begin
{*
 000780F8    push        ebp
 000780F9    mov         ebp,esp
 000780FB    add         esp,0FFFFFFF4
 000780FE    push        ebx
 000780FF    xor         ecx,ecx
 00078101    mov         dword ptr [ebp-0C],ecx
 00078104    mov         dword ptr [ebp-4],edx
 00078107    mov         ebx,eax
 00078109    xor         eax,eax
 0007810B    push        ebp
 0007810C    push        781EA
 00078111    push        dword ptr fs:[eax]
 00078114    mov         dword ptr fs:[eax],esp
 00078117    mov         eax,4000
 0007811C    call        @GetMem
 00078121    mov         dword ptr [ebp-8],eax
 00078124    xor         eax,eax
 00078126    push        ebp
 00078127    push        781CD
 0007812C    push        dword ptr fs:[eax]
 0007812F    mov         dword ptr fs:[eax],esp
 00078132    mov         eax,dword ptr [ebp-4]
 00078135    call        TStrings.BeginUpdate
 0007813A    xor         eax,eax
 0007813C    push        ebp
 0007813D    push        781B0
 00078142    push        dword ptr fs:[eax]
 00078145    mov         dword ptr fs:[eax],esp
 00078148    mov         eax,dword ptr [ebp-4]
 0007814B    mov         edx,dword ptr [eax]
 0007814D    call        dword ptr [edx+40]
 00078150    mov         eax,dword ptr [ebx+4]
 00078153    call        @LStrToPChar
 00078158    push        eax
 00078159    push        4000
 0007815E    mov         eax,dword ptr [ebp-8]
 00078161    push        eax
 00078162    push        0
 00078164    push        0
 00078166    push        0
 00078168    call        kernel32.GetPrivateProfileStringA
 0007816D    test        eax,eax
>0007816F    je          0007819A
 00078171    mov         ebx,dword ptr [ebp-8]
>00078174    jmp         00078195
 00078176    lea         eax,[ebp-0C]
 00078179    mov         edx,ebx
 0007817B    call        @LStrFromPChar
 00078180    mov         edx,dword ptr [ebp-0C]
 00078183    mov         eax,dword ptr [ebp-4]
 00078186    mov         ecx,dword ptr [eax]
 00078188    call        dword ptr [ecx+34]
 0007818B    mov         eax,ebx
 0007818D    call        StrLen
 00078192    inc         eax
 00078193    add         ebx,eax
 00078195    cmp         byte ptr [ebx],0
>00078198    jne         00078176
 0007819A    xor         eax,eax
 0007819C    pop         edx
 0007819D    pop         ecx
 0007819E    pop         ecx
 0007819F    mov         dword ptr fs:[eax],edx
 000781A2    push        781B7
 000781A7    mov         eax,dword ptr [ebp-4]
 000781AA    call        TStrings.EndUpdate
 000781AF    ret
>000781B0    jmp         @HandleFinally
>000781B5    jmp         000781A7
 000781B7    xor         eax,eax
 000781B9    pop         edx
 000781BA    pop         ecx
 000781BB    pop         ecx
 000781BC    mov         dword ptr fs:[eax],edx
 000781BF    push        781D4
 000781C4    mov         eax,dword ptr [ebp-8]
 000781C7    call        @FreeMem
 000781CC    ret
>000781CD    jmp         @HandleFinally
>000781D2    jmp         000781C4
 000781D4    xor         eax,eax
 000781D6    pop         edx
 000781D7    pop         ecx
 000781D8    pop         ecx
 000781D9    mov         dword ptr fs:[eax],edx
 000781DC    push        781F1
 000781E1    lea         eax,[ebp-0C]
 000781E4    call        @LStrClr
 000781E9    ret
>000781EA    jmp         @HandleFinally
>000781EF    jmp         000781E1
 000781F1    pop         ebx
 000781F2    mov         esp,ebp
 000781F4    pop         ebp
 000781F5    ret
*}
end;

//000781F8
procedure TIniFile.ReadSection(const Section:AnsiString; Strings:TStrings);
begin
{*
 000781F8    push        ebp
 000781F9    mov         ebp,esp
 000781FB    add         esp,0FFFFFFF4
 000781FE    push        ebx
 000781FF    push        esi
 00078200    xor         ebx,ebx
 00078202    mov         dword ptr [ebp-0C],ebx
 00078205    mov         dword ptr [ebp-4],ecx
 00078208    mov         esi,edx
 0007820A    mov         ebx,eax
 0007820C    xor         eax,eax
 0007820E    push        ebp
 0007820F    push        782F3
 00078214    push        dword ptr fs:[eax]
 00078217    mov         dword ptr fs:[eax],esp
 0007821A    mov         eax,4000
 0007821F    call        @GetMem
 00078224    mov         dword ptr [ebp-8],eax
 00078227    xor         eax,eax
 00078229    push        ebp
 0007822A    push        782D6
 0007822F    push        dword ptr fs:[eax]
 00078232    mov         dword ptr fs:[eax],esp
 00078235    mov         eax,dword ptr [ebp-4]
 00078238    call        TStrings.BeginUpdate
 0007823D    xor         eax,eax
 0007823F    push        ebp
 00078240    push        782B9
 00078245    push        dword ptr fs:[eax]
 00078248    mov         dword ptr fs:[eax],esp
 0007824B    mov         eax,dword ptr [ebp-4]
 0007824E    mov         edx,dword ptr [eax]
 00078250    call        dword ptr [edx+40]
 00078253    mov         eax,dword ptr [ebx+4]
 00078256    call        @LStrToPChar
 0007825B    push        eax
 0007825C    push        4000
 00078261    mov         eax,dword ptr [ebp-8]
 00078264    push        eax
 00078265    push        0
 00078267    push        0
 00078269    mov         eax,esi
 0007826B    call        @LStrToPChar
 00078270    push        eax
 00078271    call        kernel32.GetPrivateProfileStringA
 00078276    test        eax,eax
>00078278    je          000782A3
 0007827A    mov         ebx,dword ptr [ebp-8]
>0007827D    jmp         0007829E
 0007827F    lea         eax,[ebp-0C]
 00078282    mov         edx,ebx
 00078284    call        @LStrFromPChar
 00078289    mov         edx,dword ptr [ebp-0C]
 0007828C    mov         eax,dword ptr [ebp-4]
 0007828F    mov         ecx,dword ptr [eax]
 00078291    call        dword ptr [ecx+34]
 00078294    mov         eax,ebx
 00078296    call        StrLen
 0007829B    inc         eax
 0007829C    add         ebx,eax
 0007829E    cmp         byte ptr [ebx],0
>000782A1    jne         0007827F
 000782A3    xor         eax,eax
 000782A5    pop         edx
 000782A6    pop         ecx
 000782A7    pop         ecx
 000782A8    mov         dword ptr fs:[eax],edx
 000782AB    push        782C0
 000782B0    mov         eax,dword ptr [ebp-4]
 000782B3    call        TStrings.EndUpdate
 000782B8    ret
>000782B9    jmp         @HandleFinally
>000782BE    jmp         000782B0
 000782C0    xor         eax,eax
 000782C2    pop         edx
 000782C3    pop         ecx
 000782C4    pop         ecx
 000782C5    mov         dword ptr fs:[eax],edx
 000782C8    push        782DD
 000782CD    mov         eax,dword ptr [ebp-8]
 000782D0    call        @FreeMem
 000782D5    ret
>000782D6    jmp         @HandleFinally
>000782DB    jmp         000782CD
 000782DD    xor         eax,eax
 000782DF    pop         edx
 000782E0    pop         ecx
 000782E1    pop         ecx
 000782E2    mov         dword ptr fs:[eax],edx
 000782E5    push        782FA
 000782EA    lea         eax,[ebp-0C]
 000782ED    call        @LStrClr
 000782F2    ret
>000782F3    jmp         @HandleFinally
>000782F8    jmp         000782EA
 000782FA    pop         esi
 000782FB    pop         ebx
 000782FC    mov         esp,ebp
 000782FE    pop         ebp
 000782FF    ret
*}
end;

//00078300
procedure TIniFile.ReadSectionValues(const Section:AnsiString; Strings:TStrings);
begin
{*
 00078300    push        ebp
 00078301    mov         ebp,esp
 00078303    add         esp,0FFFFFFE8
 00078306    push        ebx
 00078307    push        esi
 00078308    push        edi
 00078309    xor         ebx,ebx
 0007830B    mov         dword ptr [ebp-14],ebx
 0007830E    mov         dword ptr [ebp-18],ebx
 00078311    mov         dword ptr [ebp-0C],ecx
 00078314    mov         dword ptr [ebp-8],edx
 00078317    mov         dword ptr [ebp-4],eax
 0007831A    xor         eax,eax
 0007831C    push        ebp
 0007831D    push        78411
 00078322    push        dword ptr fs:[eax]
 00078325    mov         dword ptr fs:[eax],esp
 00078328    mov         dl,1
 0007832A    mov         eax,[0001F340];TStringList
 0007832F    call        TObject.Create
 00078334    mov         dword ptr [ebp-10],eax
 00078337    xor         eax,eax
 00078339    push        ebp
 0007833A    push        783EF
 0007833F    push        dword ptr fs:[eax]
 00078342    mov         dword ptr fs:[eax],esp
 00078345    mov         ecx,dword ptr [ebp-10]
 00078348    mov         edx,dword ptr [ebp-8]
 0007834B    mov         eax,dword ptr [ebp-4]
 0007834E    mov         ebx,dword ptr [eax]
 00078350    call        dword ptr [ebx+38]
 00078353    mov         eax,dword ptr [ebp-0C]
 00078356    call        TStrings.BeginUpdate
 0007835B    xor         eax,eax
 0007835D    push        ebp
 0007835E    push        783D2
 00078363    push        dword ptr fs:[eax]
 00078366    mov         dword ptr fs:[eax],esp
 00078369    mov         eax,dword ptr [ebp-10]
 0007836C    mov         edx,dword ptr [eax]
 0007836E    call        dword ptr [edx+14]
 00078371    mov         esi,eax
 00078373    dec         esi
 00078374    test        esi,esi
>00078376    jl          000783BC
 00078378    inc         esi
 00078379    xor         ebx,ebx
 0007837B    push        0
 0007837D    lea         eax,[ebp-14]
 00078380    push        eax
 00078381    lea         ecx,[ebp-18]
 00078384    mov         edx,ebx
 00078386    mov         eax,dword ptr [ebp-10]
 00078389    mov         edi,dword ptr [eax]
 0007838B    call        dword ptr [edi+0C]
 0007838E    mov         ecx,dword ptr [ebp-18]
 00078391    mov         edx,dword ptr [ebp-8]
 00078394    mov         eax,dword ptr [ebp-4]
 00078397    mov         edi,dword ptr [eax]
 00078399    call        dword ptr [edi]
 0007839B    mov         eax,dword ptr [ebp-14]
 0007839E    push        eax
 0007839F    lea         ecx,[ebp-18]
 000783A2    mov         edx,ebx
 000783A4    mov         eax,dword ptr [ebp-10]
 000783A7    mov         edi,dword ptr [eax]
 000783A9    call        dword ptr [edi+0C]
 000783AC    mov         edx,dword ptr [ebp-18]
 000783AF    mov         eax,dword ptr [ebp-0C]
 000783B2    pop         ecx
 000783B3    call        TStrings.SetValue
 000783B8    inc         ebx
 000783B9    dec         esi
>000783BA    jne         0007837B
 000783BC    xor         eax,eax
 000783BE    pop         edx
 000783BF    pop         ecx
 000783C0    pop         ecx
 000783C1    mov         dword ptr fs:[eax],edx
 000783C4    push        783D9
 000783C9    mov         eax,dword ptr [ebp-0C]
 000783CC    call        TStrings.EndUpdate
 000783D1    ret
>000783D2    jmp         @HandleFinally
>000783D7    jmp         000783C9
 000783D9    xor         eax,eax
 000783DB    pop         edx
 000783DC    pop         ecx
 000783DD    pop         ecx
 000783DE    mov         dword ptr fs:[eax],edx
 000783E1    push        783F6
 000783E6    mov         eax,dword ptr [ebp-10]
 000783E9    call        TObject.Free
 000783EE    ret
>000783EF    jmp         @HandleFinally
>000783F4    jmp         000783E6
 000783F6    xor         eax,eax
 000783F8    pop         edx
 000783F9    pop         ecx
 000783FA    pop         ecx
 000783FB    mov         dword ptr fs:[eax],edx
 000783FE    push        78418
 00078403    lea         eax,[ebp-18]
 00078406    mov         edx,2
 0007840B    call        @LStrArrayClr
 00078410    ret
>00078411    jmp         @HandleFinally
>00078416    jmp         00078403
 00078418    pop         edi
 00078419    pop         esi
 0007841A    pop         ebx
 0007841B    mov         esp,ebp
 0007841D    pop         ebp
 0007841E    ret
*}
end;

//00078420
procedure TIniFile.EraseSection(const Section:AnsiString);
begin
{*
 00078420    push        ebp
 00078421    mov         ebp,esp
 00078423    add         esp,0FFFFFFF4
 00078426    push        ebx
 00078427    push        esi
 00078428    xor         ecx,ecx
 0007842A    mov         dword ptr [ebp-0C],ecx
 0007842D    mov         esi,edx
 0007842F    mov         ebx,eax
 00078431    xor         eax,eax
 00078433    push        ebp
 00078434    push        784A4
 00078439    push        dword ptr fs:[eax]
 0007843C    mov         dword ptr fs:[eax],esp
 0007843F    mov         eax,dword ptr [ebx+4]
 00078442    call        @LStrToPChar
 00078447    push        eax
 00078448    push        0
 0007844A    push        0
 0007844C    mov         eax,esi
 0007844E    call        @LStrToPChar
 00078453    push        eax
 00078454    call        kernel32.WritePrivateProfileStringA
 00078459    test        eax,eax
>0007845B    jne         0007848E
 0007845D    mov         eax,dword ptr [ebx+4]
 00078460    mov         dword ptr [ebp-8],eax
 00078463    mov         byte ptr [ebp-4],0B
 00078467    lea         eax,[ebp-8]
 0007846A    push        eax
 0007846B    push        0
 0007846D    lea         edx,[ebp-0C]
 00078470    mov         eax,[000B5AC0];^SIniFileWriteError:TResStringRec
 00078475    call        LoadResString
 0007847A    mov         ecx,dword ptr [ebp-0C]
 0007847D    mov         dl,1
 0007847F    mov         eax,[000176E8];Exception
 00078484    call        Exception.CreateFmt
 00078489    call        @RaiseExcept
 0007848E    xor         eax,eax
 00078490    pop         edx
 00078491    pop         ecx
 00078492    pop         ecx
 00078493    mov         dword ptr fs:[eax],edx
 00078496    push        784AB
 0007849B    lea         eax,[ebp-0C]
 0007849E    call        @LStrClr
 000784A3    ret
>000784A4    jmp         @HandleFinally
>000784A9    jmp         0007849B
 000784AB    pop         esi
 000784AC    pop         ebx
 000784AD    mov         esp,ebp
 000784AF    pop         ebp
 000784B0    ret
*}
end;

//000784B4
procedure TIniFile.DeleteKey(const Section:AnsiString; const Ident:AnsiString);
begin
{*
 000784B4    push        ebx
 000784B5    push        esi
 000784B6    push        edi
 000784B7    mov         edi,ecx
 000784B9    mov         esi,edx
 000784BB    mov         ebx,eax
 000784BD    mov         eax,dword ptr [ebx+4]
 000784C0    call        @LStrToPChar
 000784C5    push        eax
 000784C6    push        0
 000784C8    mov         eax,edi
 000784CA    call        @LStrToPChar
 000784CF    push        eax
 000784D0    mov         eax,esi
 000784D2    call        @LStrToPChar
 000784D7    push        eax
 000784D8    call        kernel32.WritePrivateProfileStringA
 000784DD    pop         edi
 000784DE    pop         esi
 000784DF    pop         ebx
 000784E0    ret
*}
end;

//000784E4
procedure TIniFile.UpdateFile;
begin
{*
 000784E4    push        ebx
 000784E5    mov         ebx,eax
 000784E7    mov         eax,dword ptr [ebx+4]
 000784EA    call        @LStrToPChar
 000784EF    push        eax
 000784F0    push        0
 000784F2    push        0
 000784F4    push        0
 000784F6    call        kernel32.WritePrivateProfileStringA
 000784FB    pop         ebx
 000784FC    ret
*}
end;

Initialization
Finalization
//00078500
{*
 00078500    push        ebp
 00078501    mov         ebp,esp
 00078503    xor         eax,eax
 00078505    push        ebp
 00078506    push        7853C
 0007850B    push        dword ptr fs:[eax]
 0007850E    mov         dword ptr fs:[eax],esp
 00078511    inc         dword ptr ds:[0B6AA4]
>00078517    jne         0007852E
 00078519    mov         eax,0B4DE8
 0007851E    mov         ecx,2
 00078523    mov         edx,dword ptr ds:[110CC];String
 00078529    call        @FinalizeArray
 0007852E    xor         eax,eax
 00078530    pop         edx
 00078531    pop         ecx
 00078532    pop         ecx
 00078533    mov         dword ptr fs:[eax],edx
 00078536    push        78543
 0007853B    ret
>0007853C    jmp         @HandleFinally
>00078541    jmp         0007853B
 00078543    pop         ebp
 00078544    ret
*}
end.