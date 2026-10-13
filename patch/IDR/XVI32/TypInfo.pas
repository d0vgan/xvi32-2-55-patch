//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit TypInfo;

interface

uses
  SysUtils, Classes;

    function GetTypeData(TypeInfo:PTypeInfo):PTypeData;//0001DFD8
    function GetEnumName(TypeInfo:PTypeInfo; Value:Integer):AnsiString;//0001DFE4
    function GetEnumValue(TypeInfo:PTypeInfo; const Name:AnsiString):Integer;//0001E0B4
    function GetPropInfo(TypeInfo:PTypeInfo; const PropName:AnsiString):PPropInfo;//0001E100
    procedure GetPropInfos(TypeInfo:PTypeInfo; PropList:PPropList);//0001E16C
    function IsStoredProp(Instance:TObject; PropInfo:PPropInfo):Boolean;//0001E1C0
    function GetOrdProp(Instance:TObject; PropInfo:PPropInfo):Longint;//0001E1F0
    procedure SetOrdProp(Instance:TObject; PropInfo:PPropInfo; Value:Longint);//0001E264
    procedure GetShortStrProp(Instance:TObject; PropInfo:PPropInfo; var Value:ShortString; const _Dv_:$0..-$1);//0001E2C0
    procedure SetShortStrProp(Instance:TObject; PropInfo:PPropInfo; const Value:ShortString);//0001E304
    procedure GetShortStrPropAsLongStr(Instance:TObject; PropInfo:PPropInfo; var Value:AnsiString);//0001E358
    procedure SetShortStrPropAsLongStr(Instance:TObject; PropInfo:PPropInfo; const Value:AnsiString);//0001E380
    procedure AssignLongStr(var Dest:AnsiString; const Source:AnsiString);//0001E3B4
    procedure GetLongStrProp(Instance:TObject; PropInfo:PPropInfo; var Value:AnsiString);//0001E3C8
    procedure SetLongStrProp(Instance:TObject; PropInfo:PPropInfo; const Value:AnsiString);//0001E408
    procedure AssignWideStr(var Dest:WideString; const Source:WideString);//0001E448
    procedure GetWideStrProp(Instance:TObject; PropInfo:PPropInfo; var Value:WideString);//0001E45C
    procedure SetWideStrProp(Instance:TObject; PropInfo:PPropInfo; const Value:WideString);//0001E49C
    procedure GetWideStrPropAsLongStr(Instance:TObject; PropInfo:PPropInfo; var Value:AnsiString);//0001E4DC
    procedure SetWideStrPropAsLongStr(Instance:TObject; PropInfo:PPropInfo; const Value:AnsiString);//0001E528
    function GetStrProp(Instance:TObject; PropInfo:PPropInfo):AnsiString;//0001E580
    procedure SetStrProp(Instance:TObject; PropInfo:PPropInfo; const Value:AnsiString);//0001E5C0
    function GetFloatProp(Instance:TObject; PropInfo:PPropInfo):Extended;//0001E5EC
    procedure SetFloatProp(Instance:TObject; PropInfo:PPropInfo; Value:Extended);//0001E664
    procedure AssignVariant(var Dest:Variant; const Source:Variant);//0001E6FC
    function GetVariantProp(Instance:TObject; PropInfo:PPropInfo):Variant;//0001E710
    procedure SetVariantProp(Instance:TObject; PropInfo:PPropInfo; const Value:Variant);//0001E750
    function GetMethodProp(Instance:TObject; PropInfo:PPropInfo):TMethod;//0001E790
    procedure SetMethodProp(Instance:TObject; PropInfo:PPropInfo; const Value:TMethod);//0001E7D0

implementation

//0001DFD8
function GetTypeData(TypeInfo:PTypeInfo):PTypeData;
begin
{*
 0001DFD8    xor         edx,edx
 0001DFDA    mov         dl,byte ptr [eax+1]
 0001DFDD    lea         eax,[eax+edx+2]
 0001DFE1    ret
*}
end;

//0001DFE4
function GetEnumName(TypeInfo:PTypeInfo; Value:Integer):AnsiString;
begin
{*
 0001DFE4    push        ebp
 0001DFE5    mov         ebp,esp
 0001DFE7    push        0
 0001DFE9    push        ebx
 0001DFEA    push        esi
 0001DFEB    push        edi
 0001DFEC    mov         edi,ecx
 0001DFEE    mov         esi,edx
 0001DFF0    mov         ebx,eax
 0001DFF2    xor         eax,eax
 0001DFF4    push        ebp
 0001DFF5    push        1E099
 0001DFFA    push        dword ptr fs:[eax]
 0001DFFD    mov         dword ptr fs:[eax],esp
 0001E000    cmp         ebx,dword ptr ds:[11000];Boolean
>0001E006    jne         0001E046
 0001E008    mov         eax,edi
 0001E00A    mov         edx,esi
 0001E00C    and         edx,7F
 0001E00F    mov         edx,dword ptr [edx*4+0B4350];^'False'
 0001E016    call        @LStrLAsg
 0001E01B    mov         eax,[000B5B7C]
 0001E020    mov         eax,dword ptr [eax]
 0001E022    mov         edx,1E0B0;'0x'
 0001E027    call        CompareText
 0001E02C    test        eax,eax
>0001E02E    jne         0001E083
 0001E030    lea         edx,[ebp-4]
 0001E033    mov         eax,dword ptr [edi]
 0001E035    call        LowerCase
 0001E03A    mov         edx,dword ptr [ebp-4]
 0001E03D    mov         eax,edi
 0001E03F    call        @LStrLAsg
>0001E044    jmp         0001E083
 0001E046    mov         eax,ebx
 0001E048    call        GetTypeData
 0001E04D    mov         eax,dword ptr [eax+9]
 0001E050    mov         eax,dword ptr [eax]
 0001E052    call        GetTypeData
 0001E057    cmp         dword ptr [eax+1],0
>0001E05B    jge         0001E067
 0001E05D    test        esi,esi
 0001E05F    setne       dl
 0001E062    and         edx,7F
 0001E065    mov         esi,edx
 0001E067    lea         ebx,[eax+0D]
 0001E06A    test        esi,esi
>0001E06C    je          0001E07A
 0001E06E    xor         eax,eax
 0001E070    mov         al,byte ptr [ebx]
 0001E072    inc         eax
 0001E073    add         ebx,eax
 0001E075    dec         esi
 0001E076    test        esi,esi
>0001E078    jne         0001E06E
 0001E07A    mov         eax,edi
 0001E07C    mov         edx,ebx
 0001E07E    call        @LStrFromString
 0001E083    xor         eax,eax
 0001E085    pop         edx
 0001E086    pop         ecx
 0001E087    pop         ecx
 0001E088    mov         dword ptr fs:[eax],edx
 0001E08B    push        1E0A0
 0001E090    lea         eax,[ebp-4]
 0001E093    call        @LStrClr
 0001E098    ret
>0001E099    jmp         @HandleFinally
>0001E09E    jmp         0001E090
 0001E0A0    pop         edi
 0001E0A1    pop         esi
 0001E0A2    pop         ebx
 0001E0A3    pop         ecx
 0001E0A4    pop         ebp
 0001E0A5    ret
*}
end;

//0001E0B4
function GetEnumValue(TypeInfo:PTypeInfo; const Name:AnsiString):Integer;
begin
{*
 0001E0B4    push        ebx
 0001E0B5    push        esi
 0001E0B6    push        edi
 0001E0B7    test        edx,edx
>0001E0B9    je          0001E0F6
 0001E0BB    xor         ecx,ecx
 0001E0BD    mov         cl,byte ptr [eax+1]
 0001E0C0    mov         eax,dword ptr [eax+ecx+0B]
 0001E0C4    mov         eax,dword ptr [eax]
 0001E0C6    mov         cl,byte ptr [eax+1]
 0001E0C9    lea         esi,[eax+ecx+0F]
 0001E0CD    mov         edi,dword ptr [eax+ecx+7]
 0001E0D1    xor         eax,eax
 0001E0D3    mov         cl,byte ptr [esi]
 0001E0D5    cmp         ecx,dword ptr [edx-4]
>0001E0D8    jne         0001E0ED
 0001E0DA    mov         bl,byte ptr [edx+ecx-1]
 0001E0DE    xor         bl,byte ptr [esi+ecx]
 0001E0E1    test        bl,0DF
>0001E0E4    jne         0001E0EB
 0001E0E6    dec         ecx
>0001E0E7    jne         0001E0DA
>0001E0E9    jmp         0001E0F9
 0001E0EB    mov         cl,byte ptr [esi]
 0001E0ED    inc         eax
 0001E0EE    lea         esi,[esi+ecx+1]
 0001E0F2    cmp         eax,edi
>0001E0F4    jle         0001E0D3
 0001E0F6    or          eax,0FFFFFFFF
 0001E0F9    pop         edi
 0001E0FA    pop         esi
 0001E0FB    pop         ebx
 0001E0FC    ret
*}
end;

//0001E100
function GetPropInfo(TypeInfo:PTypeInfo; const PropName:AnsiString):PPropInfo;
begin
{*
 0001E100    push        ebx
 0001E101    push        esi
 0001E102    push        edi
 0001E103    mov         ecx,edx
 0001E105    or          edx,edx
>0001E107    je          0001E114
 0001E109    mov         cl,byte ptr [edx-4]
 0001E10C    mov         ch,byte ptr [edx]
 0001E10E    and         ecx,0DFFF
 0001E114    xor         ebx,ebx
 0001E116    mov         bl,byte ptr [eax+1]
 0001E119    lea         esi,[eax+ebx+2]
 0001E11D    mov         bl,byte ptr [esi+0A]
 0001E120    movzx       edi,word ptr [esi+ebx+0B]
 0001E125    test        edi,edi
>0001E127    je          0001E141
 0001E129    lea         eax,[esi+ebx+0D]
 0001E12D    mov         bx,word ptr [eax+1A]
 0001E131    and         bh,0DF
 0001E134    cmp         ebx,ecx
>0001E136    je          0001E156
 0001E138    mov         bh,0
 0001E13A    dec         edi
 0001E13B    lea         eax,[eax+ebx+1B]
>0001E13F    jne         0001E12D
 0001E141    mov         eax,dword ptr [esi+4]
 0001E144    test        eax,eax
>0001E146    je          0001E168
 0001E148    mov         eax,dword ptr [eax]
>0001E14A    jmp         0001E114
 0001E14C    mov         ch,byte ptr [edx]
 0001E14E    and         ch,0DF
 0001E151    mov         bl,byte ptr [eax+1A]
>0001E154    jmp         0001E138
 0001E156    mov         bh,0
 0001E158    mov         ch,byte ptr [edx+ebx-1]
 0001E15C    xor         ch,byte ptr [eax+ebx+1A]
 0001E160    test        ch,0DF
>0001E163    jne         0001E14C
 0001E165    dec         ebx
>0001E166    jne         0001E158
 0001E168    pop         edi
 0001E169    pop         esi
 0001E16A    pop         ebx
 0001E16B    ret
*}
end;

//0001E16C
procedure GetPropInfos(TypeInfo:PTypeInfo; PropList:PPropList);
begin
{*
 0001E16C    push        ebx
 0001E16D    push        esi
 0001E16E    push        edi
 0001E16F    xor         ecx,ecx
 0001E171    mov         esi,eax
 0001E173    mov         cl,byte ptr [eax+1]
 0001E176    mov         edi,edx
 0001E178    xor         eax,eax
 0001E17A    movzx       ecx,word ptr [esi+ecx+0A]
 0001E17F    rep stos    dword ptr [edi]
 0001E181    mov         cl,byte ptr [esi+1]
 0001E184    lea         esi,[esi+ecx+2]
 0001E188    mov         cl,byte ptr [esi+0A]
 0001E18B    movzx       eax,word ptr [esi+ecx+0B]
 0001E190    test        eax,eax
>0001E192    je          0001E1AF
 0001E194    lea         edi,[esi+ecx+0D]
 0001E198    movzx       ebx,word ptr [edi+18]
 0001E19C    mov         cl,byte ptr [edi+1A]
 0001E19F    cmp         dword ptr [edx+ebx*4],0
>0001E1A3    jne         0001E1A8
 0001E1A5    mov         dword ptr [edx+ebx*4],edi
 0001E1A8    lea         edi,[edi+ecx+1B]
 0001E1AC    dec         eax
>0001E1AD    jne         0001E198
 0001E1AF    mov         esi,dword ptr [esi+4]
 0001E1B2    xor         ecx,ecx
 0001E1B4    test        esi,esi
>0001E1B6    je          0001E1BC
 0001E1B8    mov         esi,dword ptr [esi]
>0001E1BA    jmp         0001E181
 0001E1BC    pop         edi
 0001E1BD    pop         esi
 0001E1BE    pop         ebx
 0001E1BF    ret
*}
end;

//0001E1C0
function IsStoredProp(Instance:TObject; PropInfo:PPropInfo):Boolean;
begin
{*
 0001E1C0    mov         ecx,dword ptr [edx+0C]
 0001E1C3    test        ecx,0FFFFFF00
>0001E1C9    je          0001E1EA
 0001E1CB    cmp         byte ptr [edx+0F],0FE
 0001E1CF    mov         edx,dword ptr [edx+10]
>0001E1D2    jb          0001E1DE
>0001E1D4    ja          0001E1E1
 0001E1D6    movsx       ecx,cx
 0001E1D9    add         ecx,dword ptr [eax]
 0001E1DB    call        dword ptr [ecx]
 0001E1DD    ret
 0001E1DE    call        ecx
 0001E1E0    ret
 0001E1E1    and         ecx,0FFFFFF
 0001E1E7    mov         cl,byte ptr [eax+ecx]
 0001E1EA    mov         al,cl
 0001E1EC    ret
*}
end;

//0001E1F0
function GetOrdProp(Instance:TObject; PropInfo:PPropInfo):Longint;
begin
{*
 0001E1F0    push        ebx
 0001E1F1    push        edi
 0001E1F2    mov         edi,dword ptr [edx]
 0001E1F4    mov         edi,dword ptr [edi]
 0001E1F6    mov         bl,4
 0001E1F8    cmp         byte ptr [edi],7
>0001E1FB    je          0001E206
 0001E1FD    xor         ecx,ecx
 0001E1FF    mov         cl,byte ptr [edi+1]
 0001E202    mov         bl,byte ptr [edi+ecx+2]
 0001E206    mov         ecx,dword ptr [edx+4]
 0001E209    cmp         byte ptr [edx+7],0FE
 0001E20D    mov         edx,dword ptr [edx+10]
>0001E210    jb          0001E21D
>0001E212    ja          0001E221
 0001E214    movsx       ecx,cx
 0001E217    add         ecx,dword ptr [eax]
 0001E219    call        dword ptr [ecx]
>0001E21B    jmp         0001E23A
 0001E21D    call        ecx
>0001E21F    jmp         0001E23A
 0001E221    and         ecx,0FFFFFF
 0001E227    add         ecx,eax
 0001E229    mov         al,byte ptr [ecx]
 0001E22B    cmp         bl,2
>0001E22E    jb          0001E23A
 0001E230    mov         ax,word ptr [ecx]
 0001E233    cmp         bl,4
>0001E236    jb          0001E23A
 0001E238    mov         eax,dword ptr [ecx]
 0001E23A    cmp         bl,4
>0001E23D    jae         0001E25E
 0001E23F    cmp         bl,2
>0001E242    jae         0001E254
 0001E244    cmp         bl,0
 0001E247    movsx       eax,al
>0001E24A    je          0001E25E
 0001E24C    and         eax,0FF
 0001E251    pop         edi
 0001E252    pop         ebx
 0001E253    ret
 0001E254    movsx       eax,ax
>0001E257    je          0001E25E
 0001E259    and         eax,0FFFF
 0001E25E    pop         edi
 0001E25F    pop         ebx
 0001E260    ret
*}
end;

//0001E264
procedure SetOrdProp(Instance:TObject; PropInfo:PPropInfo; Value:Longint);
begin
{*
 0001E264    push        ebx
 0001E265    push        esi
 0001E266    push        edi
 0001E267    mov         edi,edx
 0001E269    mov         esi,dword ptr [edi]
 0001E26B    mov         esi,dword ptr [esi]
 0001E26D    mov         bl,4
 0001E26F    cmp         byte ptr [esi],7
>0001E272    je          0001E27D
 0001E274    xor         ebx,ebx
 0001E276    mov         bl,byte ptr [esi+1]
 0001E279    mov         bl,byte ptr [esi+ebx+2]
 0001E27D    mov         edx,dword ptr [edi+10]
 0001E280    cmp         edx,80000000
>0001E286    jne         0001E28A
 0001E288    mov         edx,ecx
 0001E28A    mov         esi,dword ptr [edi+8]
 0001E28D    cmp         byte ptr [edi+0B],0FE
>0001E291    ja          0001E2A2
>0001E293    jb          0001E29E
 0001E295    movsx       esi,si
 0001E298    add         esi,dword ptr [eax]
 0001E29A    call        dword ptr [esi]
>0001E29C    jmp         0001E2BB
 0001E29E    call        esi
>0001E2A0    jmp         0001E2BB
 0001E2A2    and         esi,0FFFFFF
 0001E2A8    add         eax,esi
 0001E2AA    mov         byte ptr [eax],cl
 0001E2AC    cmp         bl,2
>0001E2AF    jb          0001E2BB
 0001E2B1    mov         word ptr [eax],cx
 0001E2B4    cmp         bl,4
>0001E2B7    jb          0001E2BB
 0001E2B9    mov         dword ptr [eax],ecx
 0001E2BB    pop         edi
 0001E2BC    pop         esi
 0001E2BD    pop         ebx
 0001E2BE    ret
*}
end;

//0001E2C0
procedure GetShortStrProp(Instance:TObject; PropInfo:PPropInfo; var Value:ShortString; const _Dv_:$0..-$1);
begin
{*
 0001E2C0    push        ebp
 0001E2C1    mov         ebp,esp
 0001E2C3    push        esi
 0001E2C4    push        edi
 0001E2C5    mov         edi,edx
 0001E2C7    mov         edx,dword ptr [edi+10]
 0001E2CA    cmp         edx,80000000
>0001E2D0    jne         0001E2D4
 0001E2D2    mov         edx,ecx
 0001E2D4    mov         esi,dword ptr [edi+4]
 0001E2D7    cmp         byte ptr [edi+7],0FE
>0001E2DB    ja          0001E2EC
>0001E2DD    jb          0001E2E8
 0001E2DF    movsx       esi,si
 0001E2E2    add         esi,dword ptr [eax]
 0001E2E4    call        dword ptr [esi]
>0001E2E6    jmp         0001E2FD
 0001E2E8    call        esi
>0001E2EA    jmp         0001E2FD
 0001E2EC    and         esi,0FFFFFF
 0001E2F2    add         esi,eax
 0001E2F4    mov         edi,ecx
 0001E2F6    xor         ecx,ecx
 0001E2F8    mov         cl,byte ptr [esi]
 0001E2FA    inc         ecx
 0001E2FB    rep movs    byte ptr [edi],byte ptr [esi]
 0001E2FD    pop         edi
 0001E2FE    pop         esi
 0001E2FF    pop         ebp
 0001E300    ret         4
*}
end;

//0001E304
procedure SetShortStrProp(Instance:TObject; PropInfo:PPropInfo; const Value:ShortString);
begin
{*
 0001E304    push        esi
 0001E305    push        edi
 0001E306    mov         esi,edx
 0001E308    mov         edx,dword ptr [esi+10]
 0001E30B    cmp         edx,80000000
>0001E311    jne         0001E315
 0001E313    mov         edx,ecx
 0001E315    mov         edi,dword ptr [esi+8]
 0001E318    cmp         byte ptr [esi+0B],0FE
>0001E31C    ja          0001E32F
>0001E31E    jb          0001E32A
 0001E320    movsx       edi,di
 0001E323    add         edi,dword ptr [eax]
 0001E325    call        dword ptr [edi]
 0001E327    pop         edi
 0001E328    pop         esi
 0001E329    ret
 0001E32A    call        edi
 0001E32C    pop         edi
 0001E32D    pop         esi
 0001E32E    ret
 0001E32F    and         edi,0FFFFFF
 0001E335    add         edi,eax
 0001E337    mov         eax,dword ptr [esi]
 0001E339    mov         eax,dword ptr [eax]
 0001E33B    mov         esi,ecx
 0001E33D    xor         ecx,ecx
 0001E33F    mov         cl,byte ptr [eax+1]
 0001E342    mov         cl,byte ptr [eax+ecx+2]
 0001E346    lods        byte ptr [esi]
 0001E347    cmp         al,cl
>0001E349    jb          0001E34D
 0001E34B    mov         al,cl
 0001E34D    stos        byte ptr [edi]
 0001E34E    mov         cl,al
 0001E350    rep movs    byte ptr [edi],byte ptr [esi]
 0001E352    pop         edi
 0001E353    pop         esi
 0001E354    ret
*}
end;

//0001E358
procedure GetShortStrPropAsLongStr(Instance:TObject; PropInfo:PPropInfo; var Value:AnsiString);
begin
{*
 0001E358    push        ebx
 0001E359    add         esp,0FFFFFF00
 0001E35F    mov         ebx,ecx
 0001E361    push        0FF
 0001E366    lea         ecx,[esp+4]
 0001E36A    call        GetShortStrProp
 0001E36F    mov         eax,ebx
 0001E371    mov         edx,esp
 0001E373    call        @LStrFromString
 0001E378    add         esp,100
 0001E37E    pop         ebx
 0001E37F    ret
*}
end;

//0001E380
procedure SetShortStrPropAsLongStr(Instance:TObject; PropInfo:PPropInfo; const Value:AnsiString);
begin
{*
 0001E380    push        ebx
 0001E381    push        esi
 0001E382    push        edi
 0001E383    add         esp,0FFFFFF00
 0001E389    mov         edi,ecx
 0001E38B    mov         esi,edx
 0001E38D    mov         ebx,eax
 0001E38F    mov         eax,esp
 0001E391    mov         edx,edi
 0001E393    mov         ecx,0FF
 0001E398    call        @LStrToString
 0001E39D    mov         ecx,esp
 0001E39F    mov         edx,esi
 0001E3A1    mov         eax,ebx
 0001E3A3    call        SetShortStrProp
 0001E3A8    add         esp,100
 0001E3AE    pop         edi
 0001E3AF    pop         esi
 0001E3B0    pop         ebx
 0001E3B1    ret
*}
end;

//0001E3B4
procedure AssignLongStr(var Dest:AnsiString; const Source:AnsiString);
begin
{*
 0001E3B4    push        ebx
 0001E3B5    push        esi
 0001E3B6    mov         esi,edx
 0001E3B8    mov         ebx,eax
 0001E3BA    mov         eax,ebx
 0001E3BC    mov         edx,esi
 0001E3BE    call        @LStrAsg
 0001E3C3    pop         esi
 0001E3C4    pop         ebx
 0001E3C5    ret
*}
end;

//0001E3C8
procedure GetLongStrProp(Instance:TObject; PropInfo:PPropInfo; var Value:AnsiString);
begin
{*
 0001E3C8    push        esi
 0001E3C9    push        edi
 0001E3CA    mov         edi,edx
 0001E3CC    mov         edx,dword ptr [edi+10]
 0001E3CF    cmp         edx,80000000
>0001E3D5    jne         0001E3D9
 0001E3D7    mov         edx,ecx
 0001E3D9    mov         esi,dword ptr [edi+4]
 0001E3DC    cmp         byte ptr [edi+7],0FE
>0001E3E0    ja          0001E3F3
>0001E3E2    jb          0001E3EE
 0001E3E4    movsx       esi,si
 0001E3E7    add         esi,dword ptr [eax]
 0001E3E9    call        dword ptr [esi]
 0001E3EB    pop         edi
 0001E3EC    pop         esi
 0001E3ED    ret
 0001E3EE    call        esi
 0001E3F0    pop         edi
 0001E3F1    pop         esi
 0001E3F2    ret
 0001E3F3    and         esi,0FFFFFF
 0001E3F9    mov         edx,dword ptr [eax+esi]
 0001E3FC    mov         eax,ecx
 0001E3FE    call        AssignLongStr
 0001E403    pop         edi
 0001E404    pop         esi
 0001E405    ret
*}
end;

//0001E408
procedure SetLongStrProp(Instance:TObject; PropInfo:PPropInfo; const Value:AnsiString);
begin
{*
 0001E408    push        esi
 0001E409    push        edi
 0001E40A    mov         esi,edx
 0001E40C    mov         edx,dword ptr [esi+10]
 0001E40F    cmp         edx,80000000
>0001E415    jne         0001E419
 0001E417    mov         edx,ecx
 0001E419    mov         edi,dword ptr [esi+8]
 0001E41C    cmp         byte ptr [esi+0B],0FE
>0001E420    ja          0001E433
>0001E422    jb          0001E42E
 0001E424    movsx       edi,di
 0001E427    add         edi,dword ptr [eax]
 0001E429    call        dword ptr [edi]
 0001E42B    pop         edi
 0001E42C    pop         esi
 0001E42D    ret
 0001E42E    call        edi
 0001E430    pop         edi
 0001E431    pop         esi
 0001E432    ret
 0001E433    and         edi,0FFFFFF
 0001E439    add         eax,edi
 0001E43B    mov         edx,ecx
 0001E43D    call        AssignLongStr
 0001E442    pop         edi
 0001E443    pop         esi
 0001E444    ret
*}
end;

//0001E448
procedure AssignWideStr(var Dest:WideString; const Source:WideString);
begin
{*
 0001E448    push        ebx
 0001E449    push        esi
 0001E44A    mov         esi,edx
 0001E44C    mov         ebx,eax
 0001E44E    mov         eax,ebx
 0001E450    mov         edx,esi
 0001E452    call        @WStrAsg
 0001E457    pop         esi
 0001E458    pop         ebx
 0001E459    ret
*}
end;

//0001E45C
procedure GetWideStrProp(Instance:TObject; PropInfo:PPropInfo; var Value:WideString);
begin
{*
 0001E45C    push        esi
 0001E45D    push        edi
 0001E45E    mov         edi,edx
 0001E460    mov         edx,dword ptr [edi+10]
 0001E463    cmp         edx,80000000
>0001E469    jne         0001E46D
 0001E46B    mov         edx,ecx
 0001E46D    mov         esi,dword ptr [edi+4]
 0001E470    cmp         byte ptr [edi+7],0FE
>0001E474    ja          0001E487
>0001E476    jb          0001E482
 0001E478    movsx       esi,si
 0001E47B    add         esi,dword ptr [eax]
 0001E47D    call        dword ptr [esi]
 0001E47F    pop         edi
 0001E480    pop         esi
 0001E481    ret
 0001E482    call        esi
 0001E484    pop         edi
 0001E485    pop         esi
 0001E486    ret
 0001E487    and         esi,0FFFFFF
 0001E48D    mov         edx,dword ptr [eax+esi]
 0001E490    mov         eax,ecx
 0001E492    call        AssignWideStr
 0001E497    pop         edi
 0001E498    pop         esi
 0001E499    ret
*}
end;

//0001E49C
procedure SetWideStrProp(Instance:TObject; PropInfo:PPropInfo; const Value:WideString);
begin
{*
 0001E49C    push        esi
 0001E49D    push        edi
 0001E49E    mov         esi,edx
 0001E4A0    mov         edx,dword ptr [esi+10]
 0001E4A3    cmp         edx,80000000
>0001E4A9    jne         0001E4AD
 0001E4AB    mov         edx,ecx
 0001E4AD    mov         edi,dword ptr [esi+8]
 0001E4B0    cmp         byte ptr [esi+0B],0FE
>0001E4B4    ja          0001E4C7
>0001E4B6    jb          0001E4C2
 0001E4B8    movsx       edi,di
 0001E4BB    add         edi,dword ptr [eax]
 0001E4BD    call        dword ptr [edi]
 0001E4BF    pop         edi
 0001E4C0    pop         esi
 0001E4C1    ret
 0001E4C2    call        edi
 0001E4C4    pop         edi
 0001E4C5    pop         esi
 0001E4C6    ret
 0001E4C7    and         edi,0FFFFFF
 0001E4CD    add         eax,edi
 0001E4CF    mov         edx,ecx
 0001E4D1    call        AssignWideStr
 0001E4D6    pop         edi
 0001E4D7    pop         esi
 0001E4D8    ret
*}
end;

//0001E4DC
procedure GetWideStrPropAsLongStr(Instance:TObject; PropInfo:PPropInfo; var Value:AnsiString);
begin
{*
 0001E4DC    push        ebp
 0001E4DD    mov         ebp,esp
 0001E4DF    push        0
 0001E4E1    push        ebx
 0001E4E2    mov         ebx,ecx
 0001E4E4    xor         ecx,ecx
 0001E4E6    push        ebp
 0001E4E7    push        1E51A
 0001E4EC    push        dword ptr fs:[ecx]
 0001E4EF    mov         dword ptr fs:[ecx],esp
 0001E4F2    lea         ecx,[ebp-4]
 0001E4F5    call        GetWideStrProp
 0001E4FA    mov         eax,ebx
 0001E4FC    mov         edx,dword ptr [ebp-4]
 0001E4FF    call        @LStrFromWStr
 0001E504    xor         eax,eax
 0001E506    pop         edx
 0001E507    pop         ecx
 0001E508    pop         ecx
 0001E509    mov         dword ptr fs:[eax],edx
 0001E50C    push        1E521
 0001E511    lea         eax,[ebp-4]
 0001E514    call        @WStrClr
 0001E519    ret
>0001E51A    jmp         @HandleFinally
>0001E51F    jmp         0001E511
 0001E521    pop         ebx
 0001E522    pop         ecx
 0001E523    pop         ebp
 0001E524    ret
*}
end;

//0001E528
procedure SetWideStrPropAsLongStr(Instance:TObject; PropInfo:PPropInfo; const Value:AnsiString);
begin
{*
 0001E528    push        ebp
 0001E529    mov         ebp,esp
 0001E52B    push        0
 0001E52D    push        ebx
 0001E52E    push        esi
 0001E52F    push        edi
 0001E530    mov         edi,ecx
 0001E532    mov         esi,edx
 0001E534    mov         ebx,eax
 0001E536    xor         eax,eax
 0001E538    push        ebp
 0001E539    push        1E570
 0001E53E    push        dword ptr fs:[eax]
 0001E541    mov         dword ptr fs:[eax],esp
 0001E544    lea         eax,[ebp-4]
 0001E547    mov         edx,edi
 0001E549    call        @WStrFromLStr
 0001E54E    mov         ecx,dword ptr [ebp-4]
 0001E551    mov         edx,esi
 0001E553    mov         eax,ebx
 0001E555    call        SetWideStrProp
 0001E55A    xor         eax,eax
 0001E55C    pop         edx
 0001E55D    pop         ecx
 0001E55E    pop         ecx
 0001E55F    mov         dword ptr fs:[eax],edx
 0001E562    push        1E577
 0001E567    lea         eax,[ebp-4]
 0001E56A    call        @WStrClr
 0001E56F    ret
>0001E570    jmp         @HandleFinally
>0001E575    jmp         0001E567
 0001E577    pop         edi
 0001E578    pop         esi
 0001E579    pop         ebx
 0001E57A    pop         ecx
 0001E57B    pop         ebp
 0001E57C    ret
*}
end;

//0001E580
function GetStrProp(Instance:TObject; PropInfo:PPropInfo):AnsiString;
begin
{*
 0001E580    push        ebx
 0001E581    mov         ebx,ecx
 0001E583    mov         ecx,dword ptr [edx]
 0001E585    mov         ecx,dword ptr [ecx]
 0001E587    mov         cl,byte ptr [ecx]
 0001E589    sub         cl,5
>0001E58C    je          0001E599
 0001E58E    sub         cl,5
>0001E591    je          0001E5A2
 0001E593    dec         cl
>0001E595    je          0001E5AB
>0001E597    jmp         0001E5B4
 0001E599    mov         ecx,ebx
 0001E59B    call        GetShortStrPropAsLongStr
 0001E5A0    pop         ebx
 0001E5A1    ret
 0001E5A2    mov         ecx,ebx
 0001E5A4    call        GetLongStrProp
 0001E5A9    pop         ebx
 0001E5AA    ret
 0001E5AB    mov         ecx,ebx
 0001E5AD    call        GetWideStrPropAsLongStr
 0001E5B2    pop         ebx
 0001E5B3    ret
 0001E5B4    mov         eax,ebx
 0001E5B6    call        @LStrClr
 0001E5BB    pop         ebx
 0001E5BC    ret
*}
end;

//0001E5C0
procedure SetStrProp(Instance:TObject; PropInfo:PPropInfo; const Value:AnsiString);
begin
{*
 0001E5C0    push        ebx
 0001E5C1    mov         ebx,dword ptr [edx]
 0001E5C3    mov         ebx,dword ptr [ebx]
 0001E5C5    mov         bl,byte ptr [ebx]
 0001E5C7    sub         bl,5
>0001E5CA    je          0001E5D7
 0001E5CC    sub         bl,5
>0001E5CF    je          0001E5DE
 0001E5D1    dec         bl
>0001E5D3    je          0001E5E5
>0001E5D5    jmp         0001E5EA
 0001E5D7    call        SetShortStrPropAsLongStr
 0001E5DC    pop         ebx
 0001E5DD    ret
 0001E5DE    call        SetLongStrProp
 0001E5E3    pop         ebx
 0001E5E4    ret
 0001E5E5    call        SetWideStrPropAsLongStr
 0001E5EA    pop         ebx
 0001E5EB    ret
*}
end;

//0001E5EC
function GetFloatProp(Instance:TObject; PropInfo:PPropInfo):Extended;
begin
{*
 0001E5EC    mov         ecx,dword ptr [edx+4]
 0001E5EF    cmp         byte ptr [edx+7],0FE
>0001E5F3    ja          0001E644
 0001E5F5    push        edx
>0001E5F6    je          0001E5FF
 0001E5F8    mov         edx,dword ptr [edx+10]
 0001E5FB    call        ecx
>0001E5FD    jmp         0001E609
 0001E5FF    movsx       ecx,cx
 0001E602    add         ecx,dword ptr [eax]
 0001E604    mov         edx,dword ptr [edx+10]
 0001E607    call        dword ptr [ecx]
 0001E609    pop         edx
 0001E60A    mov         ecx,dword ptr [edx]
 0001E60C    mov         ecx,dword ptr [ecx]
 0001E60E    xor         edx,edx
 0001E610    mov         dl,byte ptr [ecx+1]
 0001E613    cmp         byte ptr [ecx+edx+2],4
>0001E618    je          0001E63D
 0001E61A    ret
 0001E61B    das
 0001E61C    out         1,al
 0001E61E    add         byte ptr [edx],dh
 0001E620    out         1,al
 0001E622    add         byte ptr ds:[380001E6],dh
 0001E628    out         1,al
 0001E62A    add         byte ptr [ebx],bh
 0001E62C    out         1,al
 0001E62E    add         cl,bl
 0001E630    add         bl,al
 0001E632    fld         qword ptr [eax]
 0001E634    ret
 0001E635    fld         tbyte ptr [eax]
 0001E637    ret
 0001E638    fild        qword ptr [eax]
 0001E63A    ret
 0001E63B    fild        qword ptr [eax]
 0001E63D    fdiv        dword ptr ds:[0B435C]
 0001E643    ret
 0001E644    and         ecx,0FFFFFF
 0001E64A    add         eax,ecx
 0001E64C    mov         ecx,dword ptr [edx]
 0001E64E    mov         ecx,dword ptr [ecx]
 0001E650    xor         edx,edx
 0001E652    mov         dl,byte ptr [ecx+1]
 0001E655    mov         dl,byte ptr [ecx+edx+2]
 0001E659    call        dword ptr [edx*4+1E61B]
 0001E660    ret
*}
end;

//0001E664
procedure SetFloatProp(Instance:TObject; PropInfo:PPropInfo; Value:Extended);
begin
{*
 0001E664    push        ebp
 0001E665    mov         ebp,esp
 0001E667    push        ebx
 0001E668    push        esi
 0001E669    xor         ebx,ebx
 0001E66B    mov         ecx,dword ptr [edx]
 0001E66D    mov         ecx,dword ptr [ecx]
 0001E66F    mov         bl,byte ptr [ecx+1]
 0001E672    mov         bl,byte ptr [ecx+ebx+2]
 0001E676    shl         ebx,2
 0001E679    fld         tbyte ptr [ebp+8]
 0001E67C    mov         ecx,dword ptr [edx+8]
 0001E67F    cmp         byte ptr [edx+0B],0FE
>0001E683    ja          0001E6E6
 0001E685    sub         esp,dword ptr [ebx+1E6A9]
 0001E68B    mov         esi,esp
 0001E68D    call        dword ptr [ebx+1E6BD]
 0001E693    cmp         byte ptr [edx+0B],0FE
 0001E697    mov         edx,dword ptr [edx+10]
>0001E69A    jb          0001E6A5
 0001E69C    movsx       ecx,cx
 0001E69F    add         ecx,dword ptr [eax]
 0001E6A1    call        dword ptr [ecx]
>0001E6A3    jmp         0001E6F5
 0001E6A5    call        ecx
>0001E6A7    jmp         0001E6F5
 0001E6A9    add         al,0
 0001E6AB    add         byte ptr [eax],al
 0001E6AD    or          byte ptr [eax],al
 0001E6AF    add         byte ptr [eax],al
 0001E6B1    or          al,0
 0001E6B3    add         byte ptr [eax],al
 0001E6B5    or          byte ptr [eax],al
 0001E6B7    add         byte ptr [eax],al
 0001E6B9    or          byte ptr [eax],al
 0001E6BB    add         byte ptr [eax],al
 0001E6BD    shl         esi,1
 0001E6BF    add         dword ptr [eax],eax
 0001E6C1    ???
 0001E6C2    out         1,al
 0001E6C4    add         bh,dl
 0001E6C6    out         1,al
 0001E6C8    add         dl,bl
 0001E6CA    out         1,al
 0001E6CC    add         ch,bl
 0001E6CE    out         1,al
 0001E6D0    add         cl,bl
 0001E6D2    push        ds
 0001E6D3    ret
 0001E6D4    fstp        qword ptr [esi]
 0001E6D6    ret
 0001E6D7    fstp        tbyte ptr [esi]
 0001E6D9    ret
 0001E6DA    fistp       qword ptr [esi]
 0001E6DC    ret
 0001E6DD    fmul        dword ptr ds:[0B435C]
 0001E6E3    fistp       qword ptr [esi]
 0001E6E5    ret
 0001E6E6    and         ecx,0FFFFFF
 0001E6EC    lea         esi,[eax+ecx]
 0001E6EF    call        dword ptr [ebx+1E6BD]
 0001E6F5    pop         esi
 0001E6F6    pop         ebx
 0001E6F7    pop         ebp
 0001E6F8    ret         0C
*}
end;

//0001E6FC
procedure AssignVariant(var Dest:Variant; const Source:Variant);
begin
{*
 0001E6FC    push        ebx
 0001E6FD    push        esi
 0001E6FE    mov         esi,edx
 0001E700    mov         ebx,eax
 0001E702    mov         eax,ebx
 0001E704    mov         edx,esi
 0001E706    call        @VarCopy
 0001E70B    pop         esi
 0001E70C    pop         ebx
 0001E70D    ret
*}
end;

//0001E710
function GetVariantProp(Instance:TObject; PropInfo:PPropInfo):Variant;
begin
{*
 0001E710    push        esi
 0001E711    push        edi
 0001E712    mov         edi,edx
 0001E714    mov         edx,dword ptr [edi+10]
 0001E717    cmp         edx,80000000
>0001E71D    jne         0001E721
 0001E71F    mov         edx,ecx
 0001E721    mov         esi,dword ptr [edi+4]
 0001E724    cmp         byte ptr [edi+7],0FE
>0001E728    ja          0001E73B
>0001E72A    jb          0001E736
 0001E72C    movsx       esi,si
 0001E72F    add         esi,dword ptr [eax]
 0001E731    call        dword ptr [esi]
 0001E733    pop         edi
 0001E734    pop         esi
 0001E735    ret
 0001E736    call        esi
 0001E738    pop         edi
 0001E739    pop         esi
 0001E73A    ret
 0001E73B    and         esi,0FFFFFF
 0001E741    lea         edx,[eax+esi]
 0001E744    mov         eax,ecx
 0001E746    call        AssignVariant
 0001E74B    pop         edi
 0001E74C    pop         esi
 0001E74D    ret
*}
end;

//0001E750
procedure SetVariantProp(Instance:TObject; PropInfo:PPropInfo; const Value:Variant);
begin
{*
 0001E750    push        esi
 0001E751    push        edi
 0001E752    mov         esi,edx
 0001E754    mov         edx,dword ptr [esi+10]
 0001E757    cmp         edx,80000000
>0001E75D    jne         0001E761
 0001E75F    mov         edx,ecx
 0001E761    mov         edi,dword ptr [esi+8]
 0001E764    cmp         byte ptr [esi+0B],0FE
>0001E768    ja          0001E77B
>0001E76A    jb          0001E776
 0001E76C    movsx       edi,di
 0001E76F    add         edi,dword ptr [eax]
 0001E771    call        dword ptr [edi]
 0001E773    pop         edi
 0001E774    pop         esi
 0001E775    ret
 0001E776    call        edi
 0001E778    pop         edi
 0001E779    pop         esi
 0001E77A    ret
 0001E77B    and         edi,0FFFFFF
 0001E781    add         eax,edi
 0001E783    mov         edx,ecx
 0001E785    call        AssignVariant
 0001E78A    pop         edi
 0001E78B    pop         esi
 0001E78C    ret
*}
end;

//0001E790
function GetMethodProp(Instance:TObject; PropInfo:PPropInfo):TMethod;
begin
{*
 0001E790    push        ebx
 0001E791    push        esi
 0001E792    mov         esi,edx
 0001E794    mov         edx,dword ptr [esi+10]
 0001E797    cmp         edx,80000000
>0001E79D    jne         0001E7A1
 0001E79F    mov         edx,ecx
 0001E7A1    mov         ebx,dword ptr [esi+4]
 0001E7A4    cmp         byte ptr [esi+7],0FE
>0001E7A8    ja          0001E7BB
>0001E7AA    jb          0001E7B6
 0001E7AC    movsx       ebx,bx
 0001E7AF    add         ebx,dword ptr [eax]
 0001E7B1    call        dword ptr [ebx]
 0001E7B3    pop         esi
 0001E7B4    pop         ebx
 0001E7B5    ret
 0001E7B6    call        ebx
 0001E7B8    pop         esi
 0001E7B9    pop         ebx
 0001E7BA    ret
 0001E7BB    and         ebx,0FFFFFF
 0001E7C1    add         eax,ebx
 0001E7C3    mov         edx,dword ptr [eax]
 0001E7C5    mov         ebx,dword ptr [eax+4]
 0001E7C8    mov         dword ptr [ecx],edx
 0001E7CA    mov         dword ptr [ecx+4],ebx
 0001E7CD    pop         esi
 0001E7CE    pop         ebx
 0001E7CF    ret
*}
end;

//0001E7D0
procedure SetMethodProp(Instance:TObject; PropInfo:PPropInfo; const Value:TMethod);
begin
{*
 0001E7D0    push        ebx
 0001E7D1    mov         ebx,dword ptr [edx+8]
 0001E7D4    cmp         byte ptr [edx+0B],0FE
>0001E7D8    ja          0001E7F1
 0001E7DA    mov         edx,dword ptr [edx+10]
 0001E7DD    push        dword ptr [ecx+4]
 0001E7E0    push        dword ptr [ecx]
>0001E7E2    jb          0001E7ED
 0001E7E4    movsx       ebx,bx
 0001E7E7    add         ebx,dword ptr [eax]
 0001E7E9    call        dword ptr [ebx]
 0001E7EB    pop         ebx
 0001E7EC    ret
 0001E7ED    call        ebx
 0001E7EF    pop         ebx
 0001E7F0    ret
 0001E7F1    and         ebx,0FFFFFF
 0001E7F7    add         eax,ebx
 0001E7F9    mov         edx,dword ptr [ecx]
 0001E7FB    mov         ebx,dword ptr [ecx+4]
 0001E7FE    mov         dword ptr [eax],edx
 0001E800    mov         dword ptr [eax+4],ebx
 0001E803    pop         ebx
 0001E804    ret
*}
end;

Initialization
Finalization
//0001E808
{*
 0001E808    push        ebp
 0001E809    mov         ebp,esp
 0001E80B    xor         eax,eax
 0001E80D    push        ebp
 0001E80E    push        1E84E
 0001E813    push        dword ptr fs:[eax]
 0001E816    mov         dword ptr fs:[eax],esp
 0001E819    inc         dword ptr ds:[0B6610]
>0001E81F    jne         0001E840
 0001E821    mov         eax,0B4358;^'.'
 0001E826    call        @LStrClr
 0001E82B    mov         eax,0B4350;^'False'
 0001E830    mov         ecx,2
 0001E835    mov         edx,dword ptr ds:[110CC];String
 0001E83B    call        @FinalizeArray
 0001E840    xor         eax,eax
 0001E842    pop         edx
 0001E843    pop         ecx
 0001E844    pop         ecx
 0001E845    mov         dword ptr fs:[eax],edx
 0001E848    push        1E855
 0001E84D    ret
>0001E84E    jmp         @HandleFinally
>0001E853    jmp         0001E84D
 0001E855    pop         ebp
 0001E856    ret
*}
end.