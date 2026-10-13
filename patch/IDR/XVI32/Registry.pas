//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit Registry;

interface

uses
  SysUtils, Classes;

type
  ERegistryException = class(Exception)
  end;
  TRegistry = class(TObject)
  public
    FCurrentKey:HKEY;//f4
    FRootKey:HKEY;//f8
    FLazyWrite:Boolean;//fC
    FCurrentPath:String;//f10
    FCloseRootKey:Boolean;//f14
    constructor Create;//00089520
    destructor Destroy;//0008955C
    procedure CloseKey;//00089588
    procedure SetRootKey(Value:HKEY);//000895B8
    procedure ChangeKey(Value:HKEY; const Path:AnsiString);//000895E4
    function GetBaseKey(Relative:Boolean):HKEY;//00089608
    procedure SetCurrentKey(Value:HKEY);//0008961C
    function OpenKey(const Key:AnsiString; CanCreate:Boolean):Boolean;//00089620
    function GetDataInfo(const ValueName:AnsiString; var Value:TRegDataInfo):Boolean;//00089744
    function GetDataSize(const ValueName:AnsiString):Integer;//00089794
    function ReadString(const Name:AnsiString):AnsiString;//000897BC
    function GetData(const Name:AnsiString; Buffer:Pointer; BufSize:Integer; var RegData:TRegDataType):Integer;//00089834
    function ValueExists(const Name:AnsiString):Boolean;//000898E4
    function GetKey(const Key:AnsiString):HKEY;//000898F4
  end;
  TRegIniFile = class(TRegistry)
  public
    FFileName:String;//f18
    constructor Create(const FileName:AnsiString);//0008998C
    function ReadString(const Section:AnsiString; const Ident:AnsiString; const Default:AnsiString):AnsiString;//000899DC
  end;
    procedure ReadError(const Name:AnsiString);//00089478
    function IsRelative(const Value:AnsiString):Boolean;//000894E4
    function DataTypeToRegData(Value:Integer):TRegDataType;//000894F8

implementation

//00089478
procedure ReadError(const Name:AnsiString);
begin
{*
 00089478    push        ebp
 00089479    mov         ebp,esp
 0008947B    add         esp,0FFFFFFF4
 0008947E    push        ebx
 0008947F    xor         edx,edx
 00089481    mov         dword ptr [ebp-0C],edx
 00089484    mov         ebx,eax
 00089486    xor         eax,eax
 00089488    push        ebp
 00089489    push        894D8
 0008948E    push        dword ptr fs:[eax]
 00089491    mov         dword ptr fs:[eax],esp
 00089494    mov         dword ptr [ebp-8],ebx
 00089497    mov         byte ptr [ebp-4],0B
 0008949B    lea         eax,[ebp-8]
 0008949E    push        eax
 0008949F    push        0
 000894A1    lea         edx,[ebp-0C]
 000894A4    mov         eax,[000B585C];^SInvalidRegType:TResStringRec
 000894A9    call        LoadResString
 000894AE    mov         ecx,dword ptr [ebp-0C]
 000894B1    mov         dl,1
 000894B3    mov         eax,[00089344];ERegistryException
 000894B8    call        Exception.CreateFmt
 000894BD    call        @RaiseExcept
 000894C2    xor         eax,eax
 000894C4    pop         edx
 000894C5    pop         ecx
 000894C6    pop         ecx
 000894C7    mov         dword ptr fs:[eax],edx
 000894CA    push        894DF
 000894CF    lea         eax,[ebp-0C]
 000894D2    call        @LStrClr
 000894D7    ret
>000894D8    jmp         @HandleFinally
>000894DD    jmp         000894CF
 000894DF    pop         ebx
 000894E0    mov         esp,ebp
 000894E2    pop         ebp
 000894E3    ret
*}
end;

//000894E4
function IsRelative(const Value:AnsiString):Boolean;
begin
{*
 000894E4    push        ebx
 000894E5    mov         ebx,eax
 000894E7    test        ebx,ebx
>000894E9    je          000894F4
 000894EB    cmp         byte ptr [ebx],5C
>000894EE    jne         000894F4
 000894F0    xor         eax,eax
 000894F2    pop         ebx
 000894F3    ret
 000894F4    mov         al,1
 000894F6    pop         ebx
 000894F7    ret
*}
end;

//000894F8
function DataTypeToRegData(Value:Integer):TRegDataType;
begin
{*
 000894F8    cmp         eax,1
>000894FB    jne         00089500
 000894FD    mov         al,1
 000894FF    ret
 00089500    cmp         eax,2
>00089503    jne         00089509
 00089505    mov         al,2
>00089507    jmp         0008951D
 00089509    cmp         eax,4
>0008950C    jne         00089512
 0008950E    mov         al,3
>00089510    jmp         0008951D
 00089512    cmp         eax,3
>00089515    jne         0008951B
 00089517    mov         al,4
>00089519    jmp         0008951D
 0008951B    xor         eax,eax
 0008951D    ret
*}
end;

//00089520
constructor TRegistry.Create;
begin
{*
 00089520    push        ebx
 00089521    push        esi
 00089522    test        dl,dl
>00089524    je          0008952E
 00089526    add         esp,0FFFFFFF0
 00089529    call        @ClassCreate
 0008952E    mov         ebx,edx
 00089530    mov         esi,eax
 00089532    mov         edx,80000001
 00089537    mov         eax,esi
 00089539    call        TRegistry.SetRootKey
 0008953E    mov         byte ptr [esi+0C],1
 00089542    mov         eax,esi
 00089544    test        bl,bl
>00089546    je          00089557
 00089548    call        @AfterConstruction
 0008954D    pop         dword ptr fs:[0]
 00089554    add         esp,0C
 00089557    mov         eax,esi
 00089559    pop         esi
 0008955A    pop         ebx
 0008955B    ret
*}
end;

//0008955C
destructor TRegistry.Destroy;
begin
{*
 0008955C    push        ebx
 0008955D    push        esi
 0008955E    call        @BeforeDestruction
 00089563    mov         ebx,edx
 00089565    mov         esi,eax
 00089567    mov         eax,esi
 00089569    call        TRegistry.CloseKey
 0008956E    mov         edx,ebx
 00089570    and         dl,0FC
 00089573    mov         eax,esi
 00089575    call        TObject.Destroy
 0008957A    test        bl,bl
>0008957C    jle         00089585
 0008957E    mov         eax,esi
 00089580    call        @ClassDestroy
 00089585    pop         esi
 00089586    pop         ebx
 00089587    ret
*}
end;

//00089588
procedure TRegistry.CloseKey;
begin
{*
 00089588    push        ebx
 00089589    mov         ebx,eax
 0008958B    mov         eax,dword ptr [ebx+4]
 0008958E    test        eax,eax
>00089590    je          000895B3
 00089592    cmp         byte ptr [ebx+0C],0
>00089596    je          000895A0
 00089598    push        eax
 00089599    call        advapi32.RegCloseKey
>0008959E    jmp         000895A6
 000895A0    push        eax
 000895A1    call        advapi32.RegFlushKey
 000895A6    xor         eax,eax
 000895A8    mov         dword ptr [ebx+4],eax
 000895AB    lea         eax,[ebx+10]
 000895AE    call        @LStrClr
 000895B3    pop         ebx
 000895B4    ret
*}
end;

//000895B8
procedure TRegistry.SetRootKey(Value:HKEY);
begin
{*
 000895B8    push        ebx
 000895B9    push        esi
 000895BA    mov         esi,edx
 000895BC    mov         ebx,eax
 000895BE    mov         eax,dword ptr [ebx+8]
 000895C1    cmp         esi,eax
>000895C3    je          000895DF
 000895C5    cmp         byte ptr [ebx+14],0
>000895C9    je          000895D5
 000895CB    push        eax
 000895CC    call        advapi32.RegCloseKey
 000895D1    mov         byte ptr [ebx+14],0
 000895D5    mov         dword ptr [ebx+8],esi
 000895D8    mov         eax,ebx
 000895DA    call        TRegistry.CloseKey
 000895DF    pop         esi
 000895E0    pop         ebx
 000895E1    ret
*}
end;

//000895E4
procedure TRegistry.ChangeKey(Value:HKEY; const Path:AnsiString);
begin
{*
 000895E4    push        ebx
 000895E5    push        esi
 000895E6    push        edi
 000895E7    mov         edi,ecx
 000895E9    mov         esi,edx
 000895EB    mov         ebx,eax
 000895ED    mov         eax,ebx
 000895EF    call        TRegistry.CloseKey
 000895F4    mov         dword ptr [ebx+4],esi
 000895F7    lea         eax,[ebx+10]
 000895FA    mov         edx,edi
 000895FC    call        @LStrAsg
 00089601    pop         edi
 00089602    pop         esi
 00089603    pop         ebx
 00089604    ret
*}
end;

//00089608
function TRegistry.GetBaseKey(Relative:Boolean):HKEY;
begin
{*
 00089608    mov         ecx,dword ptr [eax+4]
 0008960B    test        ecx,ecx
>0008960D    je          00089613
 0008960F    test        dl,dl
>00089611    jne         00089617
 00089613    mov         eax,dword ptr [eax+8]
 00089616    ret
 00089617    mov         eax,ecx
 00089619    ret
*}
end;

//0008961C
procedure TRegistry.SetCurrentKey(Value:HKEY);
begin
{*
 0008961C    mov         dword ptr [eax+4],edx
 0008961F    ret
*}
end;

//00089620
function TRegistry.OpenKey(const Key:AnsiString; CanCreate:Boolean):Boolean;
begin
{*
 00089620    push        ebp
 00089621    mov         ebp,esp
 00089623    add         esp,0FFFFFFF0
 00089626    push        ebx
 00089627    push        esi
 00089628    xor         ebx,ebx
 0008962A    mov         dword ptr [ebp-0C],ebx
 0008962D    mov         byte ptr [ebp-1],cl
 00089630    mov         ebx,edx
 00089632    mov         esi,eax
 00089634    xor         eax,eax
 00089636    push        ebp
 00089637    push        89727
 0008963C    push        dword ptr fs:[eax]
 0008963F    mov         dword ptr fs:[eax],esp
 00089642    lea         eax,[ebp-0C]
 00089645    mov         edx,ebx
 00089647    call        @LStrLAsg
 0008964C    mov         eax,dword ptr [ebp-0C]
 0008964F    call        IsRelative
 00089654    mov         ebx,eax
 00089656    test        bl,bl
>00089658    jne         0008966C
 0008965A    lea         eax,[ebp-0C]
 0008965D    mov         ecx,1
 00089662    mov         edx,1
 00089667    call        @LStrDelete
 0008966C    xor         eax,eax
 0008966E    mov         dword ptr [ebp-8],eax
 00089671    cmp         byte ptr [ebp-1],0
>00089675    je          0008967D
 00089677    cmp         dword ptr [ebp-0C],0
>0008967B    jne         000896A8
 0008967D    lea         eax,[ebp-8]
 00089680    push        eax
 00089681    push        0F003F
 00089686    push        0
 00089688    mov         eax,dword ptr [ebp-0C]
 0008968B    call        @LStrToPChar
 00089690    push        eax
 00089691    mov         edx,ebx
 00089693    mov         eax,esi
 00089695    call        TRegistry.GetBaseKey
 0008969A    push        eax
 0008969B    call        advapi32.RegOpenKeyExA
 000896A0    test        eax,eax
 000896A2    sete        byte ptr [ebp-2]
>000896A6    jmp         000896DB
 000896A8    lea         eax,[ebp-10]
 000896AB    push        eax
 000896AC    lea         eax,[ebp-8]
 000896AF    push        eax
 000896B0    push        0
 000896B2    push        0F003F
 000896B7    push        0
 000896B9    push        0
 000896BB    push        0
 000896BD    mov         eax,dword ptr [ebp-0C]
 000896C0    call        @LStrToPChar
 000896C5    push        eax
 000896C6    mov         edx,ebx
 000896C8    mov         eax,esi
 000896CA    call        TRegistry.GetBaseKey
 000896CF    push        eax
 000896D0    call        advapi32.RegCreateKeyExA
 000896D5    test        eax,eax
 000896D7    sete        byte ptr [ebp-2]
 000896DB    cmp         byte ptr [ebp-2],0
>000896DF    je          00089711
 000896E1    cmp         dword ptr [esi+4],0
 000896E5    setne       al
 000896E8    test        al,bl
>000896EA    je          00089704
 000896EC    push        dword ptr [esi+10]
 000896EF    push        89740;'\'
 000896F4    push        dword ptr [ebp-0C]
 000896F7    lea         eax,[ebp-0C]
 000896FA    mov         edx,3
 000896FF    call        @LStrCatN
 00089704    mov         ecx,dword ptr [ebp-0C]
 00089707    mov         edx,dword ptr [ebp-8]
 0008970A    mov         eax,esi
 0008970C    call        TRegistry.ChangeKey
 00089711    xor         eax,eax
 00089713    pop         edx
 00089714    pop         ecx
 00089715    pop         ecx
 00089716    mov         dword ptr fs:[eax],edx
 00089719    push        8972E
 0008971E    lea         eax,[ebp-0C]
 00089721    call        @LStrClr
 00089726    ret
>00089727    jmp         @HandleFinally
>0008972C    jmp         0008971E
 0008972E    mov         al,byte ptr [ebp-2]
 00089731    pop         esi
 00089732    pop         ebx
 00089733    mov         esp,ebp
 00089735    pop         ebp
 00089736    ret
*}
end;

//00089744
function TRegistry.GetDataInfo(const ValueName:AnsiString; var Value:TRegDataInfo):Boolean;
begin
{*
 00089744    push        ebx
 00089745    push        esi
 00089746    push        edi
 00089747    push        ebp
 00089748    push        ecx
 00089749    mov         ebp,ecx
 0008974B    mov         edi,edx
 0008974D    mov         esi,eax
 0008974F    mov         eax,ebp
 00089751    xor         ecx,ecx
 00089753    mov         edx,8
 00089758    call        @FillChar
 0008975D    lea         eax,[ebp+4]
 00089760    push        eax
 00089761    push        0
 00089763    lea         eax,[esp+8]
 00089767    push        eax
 00089768    push        0
 0008976A    mov         eax,edi
 0008976C    call        @LStrToPChar
 00089771    push        eax
 00089772    mov         eax,dword ptr [esi+4]
 00089775    push        eax
 00089776    call        advapi32.RegQueryValueExA
 0008977B    test        eax,eax
 0008977D    sete        bl
 00089780    mov         eax,dword ptr [esp]
 00089783    call        DataTypeToRegData
 00089788    mov         byte ptr [ebp],al
 0008978B    mov         eax,ebx
 0008978D    pop         edx
 0008978E    pop         ebp
 0008978F    pop         edi
 00089790    pop         esi
 00089791    pop         ebx
 00089792    ret
*}
end;

//00089794
function TRegistry.GetDataSize(const ValueName:AnsiString):Integer;
begin
{*
 00089794    push        ebx
 00089795    push        esi
 00089796    add         esp,0FFFFFFF8
 00089799    mov         esi,edx
 0008979B    mov         ebx,eax
 0008979D    mov         ecx,esp
 0008979F    mov         edx,esi
 000897A1    mov         eax,ebx
 000897A3    call        TRegistry.GetDataInfo
 000897A8    test        al,al
>000897AA    je          000897B2
 000897AC    mov         eax,dword ptr [esp+4]
>000897B0    jmp         000897B5
 000897B2    or          eax,0FFFFFFFF
 000897B5    pop         ecx
 000897B6    pop         edx
 000897B7    pop         esi
 000897B8    pop         ebx
 000897B9    ret
*}
end;

//000897BC
function TRegistry.ReadString(const Name:AnsiString):AnsiString;
begin
{*
 000897BC    push        ebx
 000897BD    push        esi
 000897BE    push        edi
 000897BF    push        ebp
 000897C0    push        ecx
 000897C1    mov         edi,ecx
 000897C3    mov         ebp,edx
 000897C5    mov         esi,eax
 000897C7    mov         edx,ebp
 000897C9    mov         eax,esi
 000897CB    call        TRegistry.GetDataSize
 000897D0    mov         ebx,eax
 000897D2    test        ebx,ebx
>000897D4    jle         00089825
 000897D6    mov         eax,edi
 000897D8    mov         ecx,ebx
 000897DA    xor         edx,edx
 000897DC    call        @LStrFromPCharLen
 000897E1    push        ebx
 000897E2    lea         eax,[esp+4]
 000897E6    push        eax
 000897E7    mov         eax,dword ptr [edi]
 000897E9    call        @LStrToPChar
 000897EE    mov         ecx,eax
 000897F0    mov         edx,ebp
 000897F2    mov         eax,esi
 000897F4    call        TRegistry.GetData
 000897F9    cmp         byte ptr [esp],1
>000897FD    je          00089805
 000897FF    cmp         byte ptr [esp],2
>00089803    jne         0008981C
 00089805    mov         eax,dword ptr [edi]
 00089807    call        @LStrToPChar
 0008980C    call        StrLen
 00089811    mov         edx,eax
 00089813    mov         eax,edi
 00089815    call        @LStrSetLength
>0008981A    jmp         0008982C
 0008981C    mov         eax,ebp
 0008981E    call        ReadError
>00089823    jmp         0008982C
 00089825    mov         eax,edi
 00089827    call        @LStrClr
 0008982C    pop         edx
 0008982D    pop         ebp
 0008982E    pop         edi
 0008982F    pop         esi
 00089830    pop         ebx
 00089831    ret
*}
end;

//00089834
function TRegistry.GetData(const Name:AnsiString; Buffer:Pointer; BufSize:Integer; var RegData:TRegDataType):Integer;
begin
{*
 00089834    push        ebp
 00089835    mov         ebp,esp
 00089837    add         esp,0FFFFFFF0
 0008983A    push        ebx
 0008983B    push        esi
 0008983C    push        edi
 0008983D    xor         ebx,ebx
 0008983F    mov         dword ptr [ebp-10],ebx
 00089842    mov         edi,ecx
 00089844    mov         esi,edx
 00089846    mov         ebx,eax
 00089848    xor         eax,eax
 0008984A    push        ebp
 0008984B    push        898CF
 00089850    push        dword ptr fs:[eax]
 00089853    mov         dword ptr fs:[eax],esp
 00089856    xor         eax,eax
 00089858    mov         dword ptr [ebp-4],eax
 0008985B    lea         eax,[ebp+0C]
 0008985E    push        eax
 0008985F    push        edi
 00089860    lea         eax,[ebp-4]
 00089863    push        eax
 00089864    push        0
 00089866    mov         eax,esi
 00089868    call        @LStrToPChar
 0008986D    push        eax
 0008986E    mov         eax,dword ptr [ebx+4]
 00089871    push        eax
 00089872    call        advapi32.RegQueryValueExA
 00089877    test        eax,eax
>00089879    je          000898A9
 0008987B    mov         dword ptr [ebp-0C],esi
 0008987E    mov         byte ptr [ebp-8],0B
 00089882    lea         eax,[ebp-0C]
 00089885    push        eax
 00089886    push        0
 00089888    lea         edx,[ebp-10]
 0008988B    mov         eax,[000B5C14];^SRegGetDataFailed:TResStringRec
 00089890    call        LoadResString
 00089895    mov         ecx,dword ptr [ebp-10]
 00089898    mov         dl,1
 0008989A    mov         eax,[00089344];ERegistryException
 0008989F    call        Exception.CreateFmt
 000898A4    call        @RaiseExcept
 000898A9    mov         ebx,dword ptr [ebp+0C]
 000898AC    mov         eax,dword ptr [ebp-4]
 000898AF    call        DataTypeToRegData
 000898B4    mov         edx,dword ptr [ebp+8]
 000898B7    mov         byte ptr [edx],al
 000898B9    xor         eax,eax
 000898BB    pop         edx
 000898BC    pop         ecx
 000898BD    pop         ecx
 000898BE    mov         dword ptr fs:[eax],edx
 000898C1    push        898D6
 000898C6    lea         eax,[ebp-10]
 000898C9    call        @LStrClr
 000898CE    ret
>000898CF    jmp         @HandleFinally
>000898D4    jmp         000898C6
 000898D6    mov         eax,ebx
 000898D8    pop         edi
 000898D9    pop         esi
 000898DA    pop         ebx
 000898DB    mov         esp,ebp
 000898DD    pop         ebp
 000898DE    ret         8
*}
end;

//000898E4
function TRegistry.ValueExists(const Name:AnsiString):Boolean;
begin
{*
 000898E4    add         esp,0FFFFFFF8
 000898E7    mov         ecx,esp
 000898E9    call        TRegistry.GetDataInfo
 000898EE    pop         ecx
 000898EF    pop         edx
 000898F0    ret
*}
end;

//000898F4
function TRegistry.GetKey(const Key:AnsiString):HKEY;
begin
{*
 000898F4    push        ebp
 000898F5    mov         ebp,esp
 000898F7    add         esp,0FFFFFFF8
 000898FA    push        ebx
 000898FB    push        esi
 000898FC    xor         ecx,ecx
 000898FE    mov         dword ptr [ebp-8],ecx
 00089901    mov         ebx,edx
 00089903    mov         esi,eax
 00089905    xor         eax,eax
 00089907    push        ebp
 00089908    push        8997B
 0008990D    push        dword ptr fs:[eax]
 00089910    mov         dword ptr fs:[eax],esp
 00089913    lea         eax,[ebp-8]
 00089916    mov         edx,ebx
 00089918    call        @LStrLAsg
 0008991D    mov         eax,dword ptr [ebp-8]
 00089920    call        IsRelative
 00089925    mov         ebx,eax
 00089927    test        bl,bl
>00089929    jne         0008993D
 0008992B    lea         eax,[ebp-8]
 0008992E    mov         ecx,1
 00089933    mov         edx,1
 00089938    call        @LStrDelete
 0008993D    xor         eax,eax
 0008993F    mov         dword ptr [ebp-4],eax
 00089942    lea         eax,[ebp-4]
 00089945    push        eax
 00089946    push        0F003F
 0008994B    push        0
 0008994D    mov         eax,dword ptr [ebp-8]
 00089950    call        @LStrToPChar
 00089955    push        eax
 00089956    mov         edx,ebx
 00089958    mov         eax,esi
 0008995A    call        TRegistry.GetBaseKey
 0008995F    push        eax
 00089960    call        advapi32.RegOpenKeyExA
 00089965    xor         eax,eax
 00089967    pop         edx
 00089968    pop         ecx
 00089969    pop         ecx
 0008996A    mov         dword ptr fs:[eax],edx
 0008996D    push        89982
 00089972    lea         eax,[ebp-8]
 00089975    call        @LStrClr
 0008997A    ret
>0008997B    jmp         @HandleFinally
>00089980    jmp         00089972
 00089982    mov         eax,dword ptr [ebp-4]
 00089985    pop         esi
 00089986    pop         ebx
 00089987    pop         ecx
 00089988    pop         ecx
 00089989    pop         ebp
 0008998A    ret
*}
end;

//0008998C
constructor TRegIniFile.Create(const FileName:AnsiString);
begin
{*
 0008998C    push        ebx
 0008998D    push        esi
 0008998E    push        edi
 0008998F    test        dl,dl
>00089991    je          0008999B
 00089993    add         esp,0FFFFFFF0
 00089996    call        @ClassCreate
 0008999B    mov         esi,ecx
 0008999D    mov         ebx,edx
 0008999F    mov         edi,eax
 000899A1    xor         edx,edx
 000899A3    mov         eax,edi
 000899A5    call        TRegistry.Create
 000899AA    lea         eax,[edi+18]
 000899AD    mov         edx,esi
 000899AF    call        @LStrAsg
 000899B4    mov         cl,1
 000899B6    mov         edx,esi
 000899B8    mov         eax,edi
 000899BA    call        TRegistry.OpenKey
 000899BF    mov         eax,edi
 000899C1    test        bl,bl
>000899C3    je          000899D4
 000899C5    call        @AfterConstruction
 000899CA    pop         dword ptr fs:[0]
 000899D1    add         esp,0C
 000899D4    mov         eax,edi
 000899D6    pop         edi
 000899D7    pop         esi
 000899D8    pop         ebx
 000899D9    ret
*}
end;

//000899DC
function TRegIniFile.ReadString(const Section:AnsiString; const Ident:AnsiString; const Default:AnsiString):AnsiString;
begin
{*
 000899DC    push        ebp
 000899DD    mov         ebp,esp
 000899DF    add         esp,0FFFFFFF4
 000899E2    push        ebx
 000899E3    push        esi
 000899E4    mov         esi,ecx
 000899E6    mov         dword ptr [ebp-4],eax
 000899E9    mov         ebx,dword ptr [ebp+8]
 000899EC    mov         eax,dword ptr [ebp-4]
 000899EF    call        TRegistry.GetKey
 000899F4    mov         dword ptr [ebp-8],eax
 000899F7    cmp         dword ptr [ebp-8],0
>000899FB    je          00089A95
 00089A01    xor         eax,eax
 00089A03    push        ebp
 00089A04    push        89A8E
 00089A09    push        dword ptr fs:[eax]
 00089A0C    mov         dword ptr fs:[eax],esp
 00089A0F    mov         eax,dword ptr [ebp-4]
 00089A12    mov         eax,dword ptr [eax+4]
 00089A15    mov         dword ptr [ebp-0C],eax
 00089A18    mov         edx,dword ptr [ebp-8]
 00089A1B    mov         eax,dword ptr [ebp-4]
 00089A1E    call        TRegistry.SetCurrentKey
 00089A23    xor         eax,eax
 00089A25    push        ebp
 00089A26    push        89A70
 00089A2B    push        dword ptr fs:[eax]
 00089A2E    mov         dword ptr fs:[eax],esp
 00089A31    mov         edx,esi
 00089A33    mov         eax,dword ptr [ebp-4]
 00089A36    call        TRegistry.ValueExists
 00089A3B    test        al,al
>00089A3D    je          00089A4D
 00089A3F    mov         ecx,ebx
 00089A41    mov         edx,esi
 00089A43    mov         eax,dword ptr [ebp-4]
 00089A46    call        TRegistry.ReadString
>00089A4B    jmp         00089A57
 00089A4D    mov         eax,ebx
 00089A4F    mov         edx,dword ptr [ebp+0C]
 00089A52    call        @LStrLAsg
 00089A57    xor         eax,eax
 00089A59    pop         edx
 00089A5A    pop         ecx
 00089A5B    pop         ecx
 00089A5C    mov         dword ptr fs:[eax],edx
 00089A5F    push        89A77
 00089A64    mov         edx,dword ptr [ebp-0C]
 00089A67    mov         eax,dword ptr [ebp-4]
 00089A6A    call        TRegistry.SetCurrentKey
 00089A6F    ret
>00089A70    jmp         @HandleFinally
>00089A75    jmp         00089A64
 00089A77    xor         eax,eax
 00089A79    pop         edx
 00089A7A    pop         ecx
 00089A7B    pop         ecx
 00089A7C    mov         dword ptr fs:[eax],edx
 00089A7F    push        89A9F
 00089A84    mov         eax,dword ptr [ebp-8]
 00089A87    push        eax
 00089A88    call        advapi32.RegCloseKey
 00089A8D    ret
>00089A8E    jmp         @HandleFinally
>00089A93    jmp         00089A84
 00089A95    mov         eax,ebx
 00089A97    mov         edx,dword ptr [ebp+0C]
 00089A9A    call        @LStrLAsg
 00089A9F    pop         esi
 00089AA0    pop         ebx
 00089AA1    mov         esp,ebp
 00089AA3    pop         ebp
 00089AA4    ret         8
*}
end;

Initialization
Finalization
//00089AC0
{*
 00089AC0    push        ebp
 00089AC1    mov         ebp,esp
 00089AC3    xor         eax,eax
 00089AC5    push        ebp
 00089AC6    push        89AFC
 00089ACB    push        dword ptr fs:[eax]
 00089ACE    mov         dword ptr fs:[eax],esp
 00089AD1    inc         dword ptr ds:[0B6ADC]
>00089AD7    jne         00089AEE
 00089AD9    mov         eax,0B4EAC
 00089ADE    mov         ecx,2
 00089AE3    mov         edx,dword ptr ds:[110CC];String
 00089AE9    call        @FinalizeArray
 00089AEE    xor         eax,eax
 00089AF0    pop         edx
 00089AF1    pop         ecx
 00089AF2    pop         ecx
 00089AF3    mov         dword ptr fs:[eax],edx
 00089AF6    push        89B03
 00089AFB    ret
>00089AFC    jmp         @HandleFinally
>00089B01    jmp         00089AFB
 00089B03    pop         ebp
 00089B04    ret
*}
end.