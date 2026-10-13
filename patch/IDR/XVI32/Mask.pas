//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit Mask;

interface

uses
  SysUtils, Classes;

type
  EDBEditError = class(Exception)
  end;
  TCustomMaskEdit = class(TCustomEdit)
  public
    FEditMask:String;//f204
    FMaskBlank:Char;//f208
    FMaxChars:Integer;//f20C
    FMaskSave:Boolean;//f210
    FMaskState:TMaskedState;//f211
    FCaretPos:Integer;//f214
    FBtnDownX:Integer;//f218
    FOldValue:String;//f21C
    constructor Create(AOwner:TComponent); virtual;//v2C//0007A934
    //function vD8:?; virtual;//vD8//0007B358
    procedure Reset; virtual;//vDC//0007B35C
    function Validate(const Value:AnsiString; var Pos:Integer):Boolean; virtual;//vE0//0007C318
    procedure ValidateError; virtual;//vE4//0007BC04
    procedure ValidateEdit; virtual;//vE8//0007BB64
    procedure WMSetFocus(var Message:TWMSetFocus); message WM_SETFOCUS;//0007AB70
    procedure WMLButtonDown(var Message:TWMLButtonDown); message WM_LBUTTONDOWN;//0007AAF4
    procedure WMLButtonUp(var Message:TWMLButtonUp); message WM_LBUTTONUP;//0007AB10
    procedure WMCut(var Message:TMessage); message WM_CUT;//0007ADF0
    procedure WMPaste(var Message:TMessage); message WM_PASTE;//0007AE24
    procedure CMTextChanged(var Message:TMessage); message CM_TEXTCHANGED;//0007BA68
    procedure CMEnter(var Message:TCMEnter); message CM_ENTER;//0007B9D8
    procedure CMExit(var Message:TCMExit); message CM_EXIT;//0007BB30
    procedure CMWantSpecialKey(var Message:TCMWantSpecialKey); message CM_WANTSPECIALKEY;//0007BAF8
    procedure KeyPress(var Key:Char); dynamic;//0007AAB8
    procedure KeyUp(var Key:Word; Shift:TShiftState); dynamic;//0007AA74
    procedure KeyDown(var Key:Word; Shift:TShiftState); dynamic;//0007A984
    procedure SetEditText(const Value:AnsiString);//0007AB90
    function GetEditText:AnsiString;//0007ABF8
    function GetTextLen:Integer;//0007AC0C
    function GetText:AnsiString;//0007AC5C
    procedure SetText(const Value:AnsiString);//0007ACE8
    function GetMasked:Boolean;//0007AF0C
    procedure ReformatText(const NewMask:AnsiString);//0007AF1C
    procedure SetEditMask(const Value:AnsiString);//0007AFDC
    function GetMaxLength:Integer;//0007B0A8
    procedure SetMaxLength(Value:Integer);//0007B0B0
    procedure GetSel(var SelStart:Integer; var SelStop:Integer);//0007B0E0
    procedure SetSel(SelStart:Integer; SelStop:Integer);//0007B104
    procedure SetCursor(Pos:Integer);//0007B128
    procedure CheckCursor;//0007B318
    function CharKeys(var CharCode:Char):Boolean;//0007B384
    procedure ArrowKeys(CharCode:Word; Shift:TShiftState);//0007B55C
    procedure CursorInc(CursorPos:Integer; Incr:Integer);//0007B73C
    procedure CursorDec(CursorPos:Integer);//0007B774
    function GetNextEditChar(Offset:Integer):Integer;//0007B790
    function GetPriorEditChar(Offset:Integer):Integer;//0007B7B8
    procedure HomeEndKeys(CharCode:Word; Shift:TShiftState);//0007B7EC
    procedure DeleteKeys(CharCode:Word);//0007B8BC
    function AddEditFormat(const Value:AnsiString; Active:Boolean):AnsiString;//0007BCA4
    function RemoveEditFormat(const Value:AnsiString):AnsiString;//0007BCEC
    function InputChar(var NewChar:Char; Offset:Integer):Boolean;//0007BEC0
    function DoInputChar(var NewChar:Char; MaskOffset:Integer):Boolean;//0007C050
    function DeleteSelection(var Value:AnsiString; Offset:Integer; Len:Integer):Boolean;//0007C3CC
    function InputString(var Value:AnsiString; const NewValue:AnsiString; Offset:Integer):Integer;//0007C464
    function FindLiteralChar(MaskOffset:Integer; InChar:Char):Integer;//0007C728
  end;
    function MaskGetCharType(const EditMask:AnsiString; MaskOffset:Integer):TMaskCharType;//0007A028
    function MaskGetCurrentDirectives(const EditMask:AnsiString; MaskOffset:Integer):TMaskDirectives;//0007A17C
    function MaskIntlLiteralToChar(IChar:Char):Char;//0007A1F8
    function MaskDoFormatText(const EditMask:AnsiString; const Value:AnsiString; Blank:Char):AnsiString;//0007A218
    function MaskGetMaskSave(const EditMask:AnsiString):Boolean;//0007A430
    function MaskGetMaskBlank(const EditMask:AnsiString):Char;//0007A4B0
    function MaskOffsetToOffset(const EditMask:AnsiString; MaskOffset:Integer):Integer;//0007A51C
    function OffsetToMaskOffset(const EditMask:AnsiString; Offset:Integer):Integer;//0007A554
    function IsLiteralChar(const EditMask:AnsiString; Offset:Integer):Boolean;//0007A5B0
    function PadSubField(const EditMask:AnsiString; const Value:AnsiString; StartFld:Integer; StopFld:Integer; Len:Integer; Blank:Char):AnsiString;//0007A5D8
    function PadInputLiterals(const EditMask:AnsiString; const Value:AnsiString; Blank:Char):AnsiString;//0007A768
    constructor Create(AOwner:TComponent);//0007A934
    procedure KeyDown(var Key:Word; Shift:TShiftState);//0007A984
    procedure KeyUp(var Key:Word; Shift:TShiftState);//0007AA74
    procedure KeyPress(var Key:Char);//0007AAB8
    procedure WMLButtonDown(var Message:TWMLButtonDown);//0007AAF4
    procedure WMLButtonUp(var Message:TWMLButtonUp);//0007AB10
    procedure WMSetFocus(var Message:TWMSetFocus);//0007AB70
    procedure WMCut(var Message:TMessage);//0007ADF0
    procedure WMPaste(var Message:TMessage);//0007AE24
    //function sub_0007B358:?;//0007B358
    procedure Reset;//0007B35C
    procedure CMEnter(var Message:TCMEnter);//0007B9D8
    procedure CMTextChanged(var Message:TMessage);//0007BA68
    procedure CMWantSpecialKey(var Message:TCMWantSpecialKey);//0007BAF8
    procedure CMExit(var Message:TCMExit);//0007BB30
    procedure ValidateEdit;//0007BB64
    procedure ValidateError;//0007BC04
    function IsKatakana(const Chr:Byte):Boolean;//0007BF5C
    function TestChar(NewChar:Char):Boolean;//0007BF78
    function Validate(const Value:AnsiString; var Pos:Integer):Boolean;//0007C318

implementation

//0007A028
function MaskGetCharType(const EditMask:AnsiString; MaskOffset:Integer):TMaskCharType;
begin
{*
 0007A028    push        ebx
 0007A029    push        esi
 0007A02A    push        edi
 0007A02B    push        ecx
 0007A02C    mov         edi,edx
 0007A02E    mov         esi,eax
 0007A030    mov         bl,1
 0007A032    mov         byte ptr [esp],0
 0007A036    mov         eax,esi
 0007A038    call        @LStrLen
 0007A03D    cmp         edi,eax
>0007A03F    jg          0007A048
 0007A041    mov         al,byte ptr [esi+edi-1]
 0007A045    mov         byte ptr [esp],al
 0007A048    mov         eax,esi
 0007A04A    call        @LStrLen
 0007A04F    cmp         edi,eax
>0007A051    jle         0007A05A
 0007A053    xor         ebx,ebx
>0007A055    jmp         0007A173
 0007A05A    mov         edx,edi
 0007A05C    mov         eax,esi
 0007A05E    call        ByteType
 0007A063    test        al,al
>0007A065    je          0007A06E
 0007A067    mov         bl,1
>0007A069    jmp         0007A173
 0007A06E    cmp         edi,1
>0007A071    jle         0007A0AB
 0007A073    cmp         byte ptr [esi+edi-2],5C
>0007A078    jne         0007A0AB
 0007A07A    mov         edx,edi
 0007A07C    dec         edx
 0007A07D    mov         eax,esi
 0007A07F    call        ByteType
 0007A084    test        al,al
>0007A086    jne         0007A0AB
 0007A088    cmp         edi,2
>0007A08B    jle         0007A0A4
 0007A08D    cmp         byte ptr [esi+edi-3],5C
>0007A092    jne         0007A0A4
 0007A094    mov         edx,edi
 0007A096    sub         edx,2
 0007A099    mov         eax,esi
 0007A09B    call        ByteType
 0007A0A0    test        al,al
>0007A0A2    je          0007A0AB
 0007A0A4    mov         bl,1
>0007A0A6    jmp         0007A173
 0007A0AB    mov         al,byte ptr [esp]
 0007A0AE    cmp         al,byte ptr ds:[0B4DF4]
>0007A0B4    jne         0007A0D7
 0007A0B6    mov         eax,esi
 0007A0B8    call        @LStrLen
 0007A0BD    cmp         eax,4
>0007A0C0    jl          0007A0D7
 0007A0C2    mov         eax,esi
 0007A0C4    call        @LStrLen
 0007A0C9    sub         eax,4
 0007A0CC    cmp         edi,eax
>0007A0CE    jle         0007A0D7
 0007A0D0    mov         bl,6
>0007A0D2    jmp         0007A173
 0007A0D7    mov         eax,esi
 0007A0D9    call        @LStrLen
 0007A0DE    cmp         eax,4
>0007A0E1    jl          0007A11D
 0007A0E3    mov         eax,esi
 0007A0E5    call        @LStrLen
 0007A0EA    sub         eax,4
 0007A0ED    cmp         edi,eax
>0007A0EF    jle         0007A11D
 0007A0F1    mov         al,byte ptr [esi+edi-2]
 0007A0F5    cmp         al,byte ptr ds:[0B4DF4]
>0007A0FB    jne         0007A11D
 0007A0FD    cmp         edi,2
>0007A100    jle         0007A119
 0007A102    cmp         byte ptr [esi+edi-3],5C
>0007A107    jne         0007A119
 0007A109    mov         edx,edi
 0007A10B    sub         edx,2
 0007A10E    mov         eax,esi
 0007A110    call        ByteType
 0007A115    cmp         al,2
>0007A117    jne         0007A11D
 0007A119    mov         bl,7
>0007A11B    jmp         0007A173
 0007A11D    mov         al,byte ptr [esp]
 0007A120    sub         al,2F
>0007A122    je          0007A128
 0007A124    sub         al,0B
>0007A126    jne         0007A12C
 0007A128    mov         bl,2
>0007A12A    jmp         0007A173
 0007A12C    mov         al,byte ptr [esp]
 0007A12F    sub         al,21
>0007A131    je          0007A13F
 0007A133    sub         al,1B
>0007A135    je          0007A13F
 0007A137    sub         al,2
>0007A139    je          0007A13F
 0007A13B    sub         al,1E
>0007A13D    jne         0007A143
 0007A13F    mov         bl,3
>0007A141    jmp         0007A173
 0007A143    mov         al,byte ptr [esp]
 0007A146    sub         al,23
>0007A148    je          0007A15A
 0007A14A    sub         al,16
>0007A14C    je          0007A15A
 0007A14E    sub         al,28
>0007A150    je          0007A15A
 0007A152    sub         al,2
>0007A154    je          0007A15A
 0007A156    sub         al,9
>0007A158    jne         0007A15E
 0007A15A    mov         bl,5
>0007A15C    jmp         0007A173
 0007A15E    mov         al,byte ptr [esp]
 0007A161    sub         al,30
>0007A163    je          0007A171
 0007A165    sub         al,11
>0007A167    je          0007A171
 0007A169    sub         al,2
>0007A16B    je          0007A171
 0007A16D    sub         al,9
>0007A16F    jne         0007A173
 0007A171    mov         bl,4
 0007A173    mov         eax,ebx
 0007A175    pop         edx
 0007A176    pop         edi
 0007A177    pop         esi
 0007A178    pop         ebx
 0007A179    ret
*}
end;

//0007A17C
function MaskGetCurrentDirectives(const EditMask:AnsiString; MaskOffset:Integer):TMaskDirectives;
begin
{*
 0007A17C    push        ebx
 0007A17D    push        esi
 0007A17E    push        edi
 0007A17F    push        ebp
 0007A180    push        ecx
 0007A181    mov         dword ptr [esp],edx
 0007A184    mov         edi,eax
 0007A186    mov         bl,byte ptr ds:[7A1F4]
 0007A18C    mov         eax,edi
 0007A18E    call        @LStrLen
 0007A193    mov         esi,eax
 0007A195    test        esi,esi
>0007A197    jle         0007A1DB
 0007A199    mov         ebp,1
 0007A19E    mov         al,byte ptr [edi+ebp-1]
 0007A1A2    cmp         al,21
>0007A1A4    jne         0007A1AB
 0007A1A6    or          bl,1
>0007A1A9    jmp         0007A1D7
 0007A1AB    cmp         al,3E
>0007A1AD    jne         0007A1C8
 0007A1AF    cmp         ebp,dword ptr [esp]
>0007A1B2    jge         0007A1C8
 0007A1B4    and         bl,0FB
 0007A1B7    cmp         ebp,1
>0007A1BA    jle         0007A1C3
 0007A1BC    cmp         byte ptr [edi+ebp-2],3C
>0007A1C1    je          0007A1D7
 0007A1C3    or          bl,2
>0007A1C6    jmp         0007A1D7
 0007A1C8    cmp         al,3C
>0007A1CA    jne         0007A1D7
 0007A1CC    cmp         ebp,dword ptr [esp]
>0007A1CF    jge         0007A1D7
 0007A1D1    and         bl,0FD
 0007A1D4    or          bl,4
 0007A1D7    inc         ebp
 0007A1D8    dec         esi
>0007A1D9    jne         0007A19E
 0007A1DB    mov         edx,dword ptr [esp]
 0007A1DE    mov         eax,edi
 0007A1E0    call        MaskGetCharType
 0007A1E5    cmp         al,1
>0007A1E7    jne         0007A1EC
 0007A1E9    or          bl,8
 0007A1EC    mov         eax,ebx
 0007A1EE    pop         edx
 0007A1EF    pop         ebp
 0007A1F0    pop         edi
 0007A1F1    pop         esi
 0007A1F2    pop         ebx
 0007A1F3    ret
*}
end;

//0007A1F8
function MaskIntlLiteralToChar(IChar:Char):Char;
begin
{*
 0007A1F8    mov         edx,eax
 0007A1FA    sub         al,2F
>0007A1FC    je          0007A20D
 0007A1FE    sub         al,0B
>0007A200    jne         0007A215
 0007A202    mov         edx,dword ptr ds:[0B5638];TimeSeparator:Char
 0007A208    mov         dl,byte ptr [edx]
 0007A20A    mov         eax,edx
 0007A20C    ret
 0007A20D    mov         edx,dword ptr ds:[0B5760];DateSeparator:Char
 0007A213    mov         dl,byte ptr [edx]
 0007A215    mov         eax,edx
 0007A217    ret
*}
end;

//0007A218
function MaskDoFormatText(const EditMask:AnsiString; const Value:AnsiString; Blank:Char):AnsiString;
begin
{*
 0007A218    push        ebp
 0007A219    mov         ebp,esp
 0007A21B    add         esp,0FFFFFFDC
 0007A21E    push        ebx
 0007A21F    push        esi
 0007A220    xor         ebx,ebx
 0007A222    mov         dword ptr [ebp-1C],ebx
 0007A225    mov         dword ptr [ebp-20],ebx
 0007A228    mov         dword ptr [ebp-24],ebx
 0007A22B    mov         byte ptr [ebp-5],cl
 0007A22E    mov         esi,edx
 0007A230    mov         dword ptr [ebp-4],eax
 0007A233    mov         ebx,dword ptr [ebp+8]
 0007A236    xor         eax,eax
 0007A238    push        ebp
 0007A239    push        7A41F
 0007A23E    push        dword ptr fs:[eax]
 0007A241    mov         dword ptr fs:[eax],esp
 0007A244    mov         eax,ebx
 0007A246    mov         edx,esi
 0007A248    call        @LStrLAsg
 0007A24D    mov         edx,1
 0007A252    mov         eax,dword ptr [ebp-4]
 0007A255    call        MaskGetCurrentDirectives
 0007A25A    mov         byte ptr [ebp-11],al
 0007A25D    test        byte ptr [ebp-11],1
>0007A261    jne         0007A330
 0007A267    mov         dword ptr [ebp-10],1
 0007A26E    mov         eax,dword ptr [ebp-4]
 0007A271    call        @LStrLen
 0007A276    test        eax,eax
>0007A278    jle         0007A404
 0007A27E    mov         dword ptr [ebp-18],eax
 0007A281    mov         esi,1
 0007A286    mov         edx,esi
 0007A288    mov         eax,dword ptr [ebp-4]
 0007A28B    call        MaskGetCharType
 0007A290    mov         edx,eax
 0007A292    dec         edx
 0007A293    sub         dl,2
>0007A296    jae         0007A2F7
 0007A298    lea         eax,[ebp-1C]
 0007A29B    push        eax
 0007A29C    mov         ecx,dword ptr [ebp-10]
 0007A29F    dec         ecx
 0007A2A0    mov         eax,dword ptr [ebx]
 0007A2A2    mov         edx,1
 0007A2A7    call        @LStrCopy
 0007A2AC    push        dword ptr [ebp-1C]
 0007A2AF    mov         eax,dword ptr [ebp-4]
 0007A2B2    mov         al,byte ptr [eax+esi-1]
 0007A2B6    call        MaskIntlLiteralToChar
 0007A2BB    mov         edx,eax
 0007A2BD    lea         eax,[ebp-20]
 0007A2C0    call        @LStrFromChar
 0007A2C5    push        dword ptr [ebp-20]
 0007A2C8    lea         eax,[ebp-24]
 0007A2CB    push        eax
 0007A2CC    mov         eax,dword ptr [ebx]
 0007A2CE    call        @LStrLen
 0007A2D3    mov         ecx,eax
 0007A2D5    sub         ecx,dword ptr [ebp-10]
 0007A2D8    inc         ecx
 0007A2D9    mov         eax,dword ptr [ebx]
 0007A2DB    mov         edx,dword ptr [ebp-10]
 0007A2DE    call        @LStrCopy
 0007A2E3    push        dword ptr [ebp-24]
 0007A2E6    mov         eax,ebx
 0007A2E8    mov         edx,3
 0007A2ED    call        @LStrCatN
 0007A2F2    inc         dword ptr [ebp-10]
>0007A2F5    jmp         0007A321
 0007A2F7    add         al,0FC
 0007A2F9    sub         al,2
>0007A2FB    jae         0007A321
 0007A2FD    mov         eax,dword ptr [ebx]
 0007A2FF    call        @LStrLen
 0007A304    cmp         eax,dword ptr [ebp-10]
>0007A307    jge         0007A31E
 0007A309    lea         eax,[ebp-1C]
 0007A30C    mov         dl,byte ptr [ebp-5]
 0007A30F    call        @LStrFromChar
 0007A314    mov         edx,dword ptr [ebp-1C]
 0007A317    mov         eax,ebx
 0007A319    call        @LStrCat
 0007A31E    inc         dword ptr [ebp-10]
 0007A321    inc         esi
 0007A322    dec         dword ptr [ebp-18]
>0007A325    jne         0007A286
>0007A32B    jmp         0007A404
 0007A330    mov         eax,dword ptr [ebx]
 0007A332    call        @LStrLen
 0007A337    mov         dword ptr [ebp-10],eax
 0007A33A    mov         eax,dword ptr [ebp-4]
 0007A33D    call        @LStrLen
 0007A342    dec         eax
 0007A343    test        eax,eax
>0007A345    jl          0007A404
 0007A34B    inc         eax
 0007A34C    mov         dword ptr [ebp-18],eax
 0007A34F    mov         dword ptr [ebp-0C],0
 0007A356    mov         eax,dword ptr [ebp-4]
 0007A359    call        @LStrLen
 0007A35E    mov         esi,eax
 0007A360    sub         esi,dword ptr [ebp-0C]
 0007A363    mov         edx,esi
 0007A365    mov         eax,dword ptr [ebp-4]
 0007A368    call        MaskGetCharType
 0007A36D    mov         edx,eax
 0007A36F    dec         edx
 0007A370    sub         dl,2
>0007A373    jae         0007A3D0
 0007A375    lea         eax,[ebp-1C]
 0007A378    push        eax
 0007A379    mov         eax,dword ptr [ebx]
 0007A37B    mov         ecx,dword ptr [ebp-10]
 0007A37E    mov         edx,1
 0007A383    call        @LStrCopy
 0007A388    push        dword ptr [ebp-1C]
 0007A38B    mov         eax,dword ptr [ebp-4]
 0007A38E    mov         al,byte ptr [eax+esi-1]
 0007A392    call        MaskIntlLiteralToChar
 0007A397    mov         edx,eax
 0007A399    lea         eax,[ebp-20]
 0007A39C    call        @LStrFromChar
 0007A3A1    push        dword ptr [ebp-20]
 0007A3A4    lea         eax,[ebp-24]
 0007A3A7    push        eax
 0007A3A8    mov         eax,dword ptr [ebx]
 0007A3AA    call        @LStrLen
 0007A3AF    mov         ecx,eax
 0007A3B1    sub         ecx,dword ptr [ebp-10]
 0007A3B4    mov         edx,dword ptr [ebp-10]
 0007A3B7    inc         edx
 0007A3B8    mov         eax,dword ptr [ebx]
 0007A3BA    call        @LStrCopy
 0007A3BF    push        dword ptr [ebp-24]
 0007A3C2    mov         eax,ebx
 0007A3C4    mov         edx,3
 0007A3C9    call        @LStrCatN
>0007A3CE    jmp         0007A3F8
 0007A3D0    add         al,0FC
 0007A3D2    sub         al,2
>0007A3D4    jae         0007A3F8
 0007A3D6    cmp         dword ptr [ebp-10],1
>0007A3DA    jge         0007A3F5
 0007A3DC    lea         eax,[ebp-1C]
 0007A3DF    mov         dl,byte ptr [ebp-5]
 0007A3E2    call        @LStrFromChar
 0007A3E7    mov         edx,dword ptr [ebp-1C]
 0007A3EA    mov         ecx,dword ptr [ebx]
 0007A3EC    mov         eax,ebx
 0007A3EE    call        @LStrCat3
>0007A3F3    jmp         0007A3F8
 0007A3F5    dec         dword ptr [ebp-10]
 0007A3F8    inc         dword ptr [ebp-0C]
 0007A3FB    dec         dword ptr [ebp-18]
>0007A3FE    jne         0007A356
 0007A404    xor         eax,eax
 0007A406    pop         edx
 0007A407    pop         ecx
 0007A408    pop         ecx
 0007A409    mov         dword ptr fs:[eax],edx
 0007A40C    push        7A426
 0007A411    lea         eax,[ebp-24]
 0007A414    mov         edx,3
 0007A419    call        @LStrArrayClr
 0007A41E    ret
>0007A41F    jmp         @HandleFinally
>0007A424    jmp         0007A411
 0007A426    pop         esi
 0007A427    pop         ebx
 0007A428    mov         esp,ebp
 0007A42A    pop         ebp
 0007A42B    ret         4
*}
end;

//0007A430
function MaskGetMaskSave(const EditMask:AnsiString):Boolean;
begin
{*
 0007A430    push        ebx
 0007A431    push        esi
 0007A432    push        edi
 0007A433    push        ebp
 0007A434    push        ecx
 0007A435    mov         esi,eax
 0007A437    mov         byte ptr [esp],1
 0007A43B    mov         eax,esi
 0007A43D    call        @LStrLen
 0007A442    cmp         eax,4
>0007A445    jl          0007A4A6
 0007A447    or          ebp,0FFFFFFFF
 0007A44A    or          edi,0FFFFFFFF
 0007A44D    mov         eax,esi
 0007A44F    call        @LStrLen
 0007A454    mov         ebx,eax
 0007A456    mov         edx,ebx
 0007A458    mov         eax,esi
 0007A45A    call        MaskGetCharType
 0007A45F    cmp         al,6
>0007A461    jne         0007A46D
 0007A463    test        ebp,ebp
>0007A465    jge         0007A46B
 0007A467    mov         ebp,ebx
>0007A469    jmp         0007A46D
 0007A46B    mov         edi,ebx
 0007A46D    dec         ebx
 0007A46E    test        ebx,ebx
>0007A470    jle         0007A484
 0007A472    mov         eax,esi
 0007A474    call        @LStrLen
 0007A479    sub         eax,4
 0007A47C    cmp         ebx,eax
>0007A47E    jl          0007A484
 0007A480    test        edi,edi
>0007A482    jl          0007A456
 0007A484    test        edi,edi
>0007A486    jge         0007A48A
 0007A488    mov         edi,ebp
 0007A48A    mov         eax,esi
 0007A48C    call        @LStrLen
 0007A491    cmp         edi,eax
>0007A493    je          0007A4A6
 0007A495    mov         al,byte ptr [esi+edi]
 0007A498    cmp         al,byte ptr ds:[0B4DF8]
 0007A49E    sete        al
 0007A4A1    xor         al,1
 0007A4A3    mov         byte ptr [esp],al
 0007A4A6    mov         al,byte ptr [esp]
 0007A4A9    pop         edx
 0007A4AA    pop         ebp
 0007A4AB    pop         edi
 0007A4AC    pop         esi
 0007A4AD    pop         ebx
 0007A4AE    ret
*}
end;

//0007A4B0
function MaskGetMaskBlank(const EditMask:AnsiString):Char;
begin
{*
 0007A4B0    push        ebx
 0007A4B1    push        esi
 0007A4B2    mov         esi,eax
 0007A4B4    mov         bl,byte ptr ds:[0B4DF0]
 0007A4BA    mov         eax,esi
 0007A4BC    call        @LStrLen
 0007A4C1    cmp         eax,4
>0007A4C4    jl          0007A514
 0007A4C6    mov         eax,esi
 0007A4C8    call        @LStrLen
 0007A4CD    mov         edx,eax
 0007A4CF    dec         edx
 0007A4D0    mov         eax,esi
 0007A4D2    call        MaskGetCharType
 0007A4D7    cmp         al,6
>0007A4D9    jne         0007A514
 0007A4DB    mov         eax,esi
 0007A4DD    call        @LStrLen
 0007A4E2    mov         edx,eax
 0007A4E4    sub         edx,2
 0007A4E7    mov         eax,esi
 0007A4E9    call        MaskGetCharType
 0007A4EE    cmp         al,6
>0007A4F0    je          0007A509
 0007A4F2    mov         eax,esi
 0007A4F4    call        @LStrLen
 0007A4F9    mov         edx,eax
 0007A4FB    sub         edx,3
 0007A4FE    mov         eax,esi
 0007A500    call        MaskGetCharType
 0007A505    cmp         al,6
>0007A507    jne         0007A514
 0007A509    mov         eax,esi
 0007A50B    call        @LStrLen
 0007A510    mov         bl,byte ptr [esi+eax-1]
 0007A514    mov         eax,ebx
 0007A516    pop         esi
 0007A517    pop         ebx
 0007A518    ret
*}
end;

//0007A51C
function MaskOffsetToOffset(const EditMask:AnsiString; MaskOffset:Integer):Integer;
begin
{*
 0007A51C    push        ebx
 0007A51D    push        esi
 0007A51E    push        edi
 0007A51F    push        ebp
 0007A520    push        ecx
 0007A521    mov         dword ptr [esp],edx
 0007A524    mov         edi,eax
 0007A526    xor         ebp,ebp
 0007A528    mov         ebx,dword ptr [esp]
 0007A52B    test        ebx,ebx
>0007A52D    jle         0007A54C
 0007A52F    mov         esi,1
 0007A534    mov         edx,esi
 0007A536    mov         eax,edi
 0007A538    call        MaskGetCharType
 0007A53D    sub         al,3
>0007A53F    je          0007A548
 0007A541    add         al,0FD
 0007A543    sub         al,2
>0007A545    jb          0007A548
 0007A547    inc         ebp
 0007A548    inc         esi
 0007A549    dec         ebx
>0007A54A    jne         0007A534
 0007A54C    mov         eax,ebp
 0007A54E    pop         edx
 0007A54F    pop         ebp
 0007A550    pop         edi
 0007A551    pop         esi
 0007A552    pop         ebx
 0007A553    ret
*}
end;

//0007A554
function OffsetToMaskOffset(const EditMask:AnsiString; Offset:Integer):Integer;
begin
{*
 0007A554    push        ebx
 0007A555    push        esi
 0007A556    push        edi
 0007A557    push        ebp
 0007A558    push        ecx
 0007A559    mov         ebx,edx
 0007A55B    mov         edi,eax
 0007A55D    mov         eax,edi
 0007A55F    call        @LStrLen
 0007A564    mov         edx,eax
 0007A566    mov         eax,edi
 0007A568    call        MaskOffsetToOffset
 0007A56D    cmp         eax,ebx
>0007A56F    jge         0007A576
 0007A571    or          ebp,0FFFFFFFF
>0007A574    jmp         0007A5A8
 0007A576    xor         ebp,ebp
 0007A578    mov         dword ptr [esp],ebx
 0007A57B    mov         eax,edi
 0007A57D    call        @LStrLen
 0007A582    mov         ebx,eax
 0007A584    test        ebx,ebx
>0007A586    jle         0007A5A8
 0007A588    mov         esi,1
 0007A58D    inc         ebp
 0007A58E    mov         edx,esi
 0007A590    mov         eax,edi
 0007A592    call        MaskGetCharType
 0007A597    cmp         al,3
>0007A599    je          0007A5A4
 0007A59B    dec         dword ptr [esp]
 0007A59E    cmp         dword ptr [esp],0
>0007A5A2    jl          0007A5A8
 0007A5A4    inc         esi
 0007A5A5    dec         ebx
>0007A5A6    jne         0007A58D
 0007A5A8    mov         eax,ebp
 0007A5AA    pop         edx
 0007A5AB    pop         ebp
 0007A5AC    pop         edi
 0007A5AD    pop         esi
 0007A5AE    pop         ebx
 0007A5AF    ret
*}
end;

//0007A5B0
function IsLiteralChar(const EditMask:AnsiString; Offset:Integer):Boolean;
begin
{*
 0007A5B0    push        ebx
 0007A5B1    push        esi
 0007A5B2    mov         esi,eax
 0007A5B4    xor         ebx,ebx
 0007A5B6    mov         eax,esi
 0007A5B8    call        OffsetToMaskOffset
 0007A5BD    test        eax,eax
>0007A5BF    jl          0007A5D0
 0007A5C1    mov         edx,eax
 0007A5C3    mov         eax,esi
 0007A5C5    call        MaskGetCharType
 0007A5CA    dec         eax
 0007A5CB    sub         al,2
 0007A5CD    setb        bl
 0007A5D0    mov         eax,ebx
 0007A5D2    pop         esi
 0007A5D3    pop         ebx
 0007A5D4    ret
*}
end;

//0007A5D8
function PadSubField(const EditMask:AnsiString; const Value:AnsiString; StartFld:Integer; StopFld:Integer; Len:Integer; Blank:Char):AnsiString;
begin
{*
 0007A5D8    push        ebp
 0007A5D9    mov         ebp,esp
 0007A5DB    add         esp,0FFFFFFE8
 0007A5DE    push        ebx
 0007A5DF    push        esi
 0007A5E0    push        edi
 0007A5E1    xor         ebx,ebx
 0007A5E3    mov         dword ptr [ebp-14],ebx
 0007A5E6    mov         dword ptr [ebp-18],ebx
 0007A5E9    mov         dword ptr [ebp-8],ecx
 0007A5EC    mov         edi,edx
 0007A5EE    mov         dword ptr [ebp-4],eax
 0007A5F1    mov         ebx,dword ptr [ebp+8]
 0007A5F4    mov         esi,dword ptr [ebp+14]
 0007A5F7    xor         eax,eax
 0007A5F9    push        ebp
 0007A5FA    push        7A757
 0007A5FF    push        dword ptr fs:[eax]
 0007A602    mov         dword ptr fs:[eax],esp
 0007A605    mov         eax,esi
 0007A607    sub         eax,dword ptr [ebp-8]
 0007A60A    cmp         eax,dword ptr [ebp+10]
>0007A60D    jge         0007A693
 0007A613    mov         edx,1
 0007A618    mov         eax,dword ptr [ebp-4]
 0007A61B    call        MaskGetCurrentDirectives
 0007A620    mov         byte ptr [ebp-9],al
 0007A623    mov         eax,esi
 0007A625    dec         eax
 0007A626    mov         dword ptr [ebp-10],eax
 0007A629    test        byte ptr [ebp-9],1
>0007A62D    je          0007A636
 0007A62F    mov         eax,dword ptr [ebp-8]
 0007A632    dec         eax
 0007A633    mov         dword ptr [ebp-10],eax
 0007A636    push        ebx
 0007A637    mov         ecx,dword ptr [ebp-10]
 0007A63A    mov         edx,1
 0007A63F    mov         eax,edi
 0007A641    call        @LStrCopy
 0007A646    sub         esi,dword ptr [ebp-8]
 0007A649    mov         eax,dword ptr [ebp+10]
 0007A64C    sub         eax,esi
 0007A64E    test        eax,eax
>0007A650    jle         0007A66C
 0007A652    mov         esi,eax
 0007A654    lea         eax,[ebp-14]
 0007A657    mov         dl,byte ptr [ebp+0C]
 0007A65A    call        @LStrFromChar
 0007A65F    mov         edx,dword ptr [ebp-14]
 0007A662    mov         eax,ebx
 0007A664    call        @LStrCat
 0007A669    dec         esi
>0007A66A    jne         0007A654
 0007A66C    lea         eax,[ebp-14]
 0007A66F    push        eax
 0007A670    mov         eax,edi
 0007A672    call        @LStrLen
 0007A677    mov         ecx,eax
 0007A679    mov         edx,dword ptr [ebp-10]
 0007A67C    inc         edx
 0007A67D    mov         eax,edi
 0007A67F    call        @LStrCopy
 0007A684    mov         edx,dword ptr [ebp-14]
 0007A687    mov         eax,ebx
 0007A689    call        @LStrCat
>0007A68E    jmp         0007A73C
 0007A693    mov         eax,esi
 0007A695    sub         eax,dword ptr [ebp-8]
 0007A698    cmp         eax,dword ptr [ebp+10]
>0007A69B    jle         0007A733
 0007A6A1    mov         edx,1
 0007A6A6    mov         eax,dword ptr [ebp-4]
 0007A6A9    call        MaskGetCurrentDirectives
 0007A6AE    mov         byte ptr [ebp-9],al
 0007A6B1    test        byte ptr [ebp-9],1
>0007A6B5    je          0007A6F5
 0007A6B7    lea         eax,[ebp-14]
 0007A6BA    push        eax
 0007A6BB    mov         eax,edi
 0007A6BD    call        @LStrLen
 0007A6C2    mov         ecx,eax
 0007A6C4    mov         edx,esi
 0007A6C6    sub         edx,dword ptr [ebp+10]
 0007A6C9    mov         eax,edi
 0007A6CB    call        @LStrCopy
 0007A6D0    mov         eax,dword ptr [ebp-14]
 0007A6D3    push        eax
 0007A6D4    lea         eax,[ebp-18]
 0007A6D7    push        eax
 0007A6D8    mov         ecx,dword ptr [ebp-8]
 0007A6DB    dec         ecx
 0007A6DC    mov         edx,1
 0007A6E1    mov         eax,edi
 0007A6E3    call        @LStrCopy
 0007A6E8    mov         edx,dword ptr [ebp-18]
 0007A6EB    mov         eax,ebx
 0007A6ED    pop         ecx
 0007A6EE    call        @LStrCat3
>0007A6F3    jmp         0007A73C
 0007A6F5    lea         eax,[ebp-14]
 0007A6F8    push        eax
 0007A6F9    mov         eax,edi
 0007A6FB    call        @LStrLen
 0007A700    mov         ecx,eax
 0007A702    mov         edx,esi
 0007A704    mov         eax,edi
 0007A706    call        @LStrCopy
 0007A70B    mov         eax,dword ptr [ebp-14]
 0007A70E    push        eax
 0007A70F    lea         eax,[ebp-18]
 0007A712    push        eax
 0007A713    mov         ecx,dword ptr [ebp-8]
 0007A716    add         ecx,dword ptr [ebp+10]
 0007A719    dec         ecx
 0007A71A    mov         edx,1
 0007A71F    mov         eax,edi
 0007A721    call        @LStrCopy
 0007A726    mov         edx,dword ptr [ebp-18]
 0007A729    mov         eax,ebx
 0007A72B    pop         ecx
 0007A72C    call        @LStrCat3
>0007A731    jmp         0007A73C
 0007A733    mov         eax,ebx
 0007A735    mov         edx,edi
 0007A737    call        @LStrLAsg
 0007A73C    xor         eax,eax
 0007A73E    pop         edx
 0007A73F    pop         ecx
 0007A740    pop         ecx
 0007A741    mov         dword ptr fs:[eax],edx
 0007A744    push        7A75E
 0007A749    lea         eax,[ebp-18]
 0007A74C    mov         edx,2
 0007A751    call        @LStrArrayClr
 0007A756    ret
>0007A757    jmp         @HandleFinally
>0007A75C    jmp         0007A749
 0007A75E    pop         edi
 0007A75F    pop         esi
 0007A760    pop         ebx
 0007A761    mov         esp,ebp
 0007A763    pop         ebp
 0007A764    ret         10
*}
end;

//0007A768
function PadInputLiterals(const EditMask:AnsiString; const Value:AnsiString; Blank:Char):AnsiString;
begin
{*
 0007A768    push        ebp
 0007A769    mov         ebp,esp
 0007A76B    add         esp,0FFFFFFE0
 0007A76E    push        ebx
 0007A76F    push        esi
 0007A770    push        edi
 0007A771    xor         ebx,ebx
 0007A773    mov         dword ptr [ebp-20],ebx
 0007A776    mov         byte ptr [ebp-1],cl
 0007A779    mov         edi,edx
 0007A77B    mov         esi,eax
 0007A77D    mov         ebx,dword ptr [ebp+8]
 0007A780    xor         eax,eax
 0007A782    push        ebp
 0007A783    push        7A923
 0007A788    push        dword ptr fs:[eax]
 0007A78B    mov         dword ptr fs:[eax],esp
 0007A78E    xor         eax,eax
 0007A790    mov         dword ptr [ebp-8],eax
 0007A793    mov         eax,ebx
 0007A795    mov         edx,edi
 0007A797    call        @LStrLAsg
 0007A79C    mov         eax,esi
 0007A79E    call        @LStrLen
 0007A7A3    test        eax,eax
>0007A7A5    jle         0007A87B
 0007A7AB    mov         dword ptr [ebp-18],eax
 0007A7AE    mov         dword ptr [ebp-14],1
 0007A7B5    mov         edx,dword ptr [ebp-14]
 0007A7B8    mov         eax,esi
 0007A7BA    call        MaskGetCharType
 0007A7BF    dec         eax
 0007A7C0    sub         al,2
>0007A7C2    jae         0007A86F
 0007A7C8    mov         edx,dword ptr [ebp-14]
 0007A7CB    mov         eax,esi
 0007A7CD    call        MaskOffsetToOffset
 0007A7D2    mov         dword ptr [ebp-10],eax
 0007A7D5    mov         eax,dword ptr [ebx]
 0007A7D7    call        @LStrLen
 0007A7DC    inc         eax
 0007A7DD    mov         dword ptr [ebp-0C],eax
 0007A7E0    mov         edi,dword ptr [ebp-8]
 0007A7E3    inc         edi
 0007A7E4    mov         eax,dword ptr [ebx]
 0007A7E6    call        @LStrLen
 0007A7EB    sub         eax,edi
>0007A7ED    jl          0007A812
 0007A7EF    inc         eax
 0007A7F0    mov         dword ptr [ebp-1C],eax
 0007A7F3    mov         eax,dword ptr [ebp-14]
 0007A7F6    mov         al,byte ptr [esi+eax-1]
 0007A7FA    call        MaskIntlLiteralToChar
 0007A7FF    mov         edx,dword ptr [ebx]
 0007A801    cmp         al,byte ptr [edx+edi-1]
>0007A805    jne         0007A80C
 0007A807    mov         dword ptr [ebp-0C],edi
>0007A80A    jmp         0007A812
 0007A80C    inc         edi
 0007A80D    dec         dword ptr [ebp-1C]
>0007A810    jne         0007A7F3
 0007A812    mov         eax,dword ptr [ebx]
 0007A814    call        @LStrLen
 0007A819    cmp         eax,dword ptr [ebp-0C]
>0007A81C    jge         0007A83E
 0007A81E    mov         eax,dword ptr [ebp-14]
 0007A821    mov         al,byte ptr [esi+eax-1]
 0007A825    call        MaskIntlLiteralToChar
 0007A82A    mov         edx,eax
 0007A82C    lea         eax,[ebp-20]
 0007A82F    call        @LStrFromChar
 0007A834    mov         edx,dword ptr [ebp-20]
 0007A837    mov         eax,ebx
 0007A839    call        @LStrCat
 0007A83E    mov         eax,dword ptr [ebp-0C]
 0007A841    push        eax
 0007A842    mov         edi,dword ptr [ebp-8]
 0007A845    inc         edi
 0007A846    mov         eax,dword ptr [ebp-10]
 0007A849    sub         eax,edi
 0007A84B    push        eax
 0007A84C    mov         al,byte ptr [ebp-1]
 0007A84F    push        eax
 0007A850    lea         eax,[ebp-20]
 0007A853    push        eax
 0007A854    mov         ecx,edi
 0007A856    mov         edx,dword ptr [ebx]
 0007A858    mov         eax,esi
 0007A85A    call        PadSubField
 0007A85F    mov         edx,dword ptr [ebp-20]
 0007A862    mov         eax,ebx
 0007A864    call        @LStrLAsg
 0007A869    mov         eax,dword ptr [ebp-10]
 0007A86C    mov         dword ptr [ebp-8],eax
 0007A86F    inc         dword ptr [ebp-14]
 0007A872    dec         dword ptr [ebp-18]
>0007A875    jne         0007A7B5
 0007A87B    mov         eax,esi
 0007A87D    call        @LStrLen
 0007A882    mov         edx,eax
 0007A884    mov         eax,esi
 0007A886    call        MaskOffsetToOffset
 0007A88B    mov         edi,eax
 0007A88D    mov         eax,dword ptr [ebx]
 0007A88F    call        @LStrLen
 0007A894    cmp         edi,eax
>0007A896    je          0007A8C4
 0007A898    mov         eax,dword ptr [ebx]
 0007A89A    call        @LStrLen
 0007A89F    inc         eax
 0007A8A0    push        eax
 0007A8A1    sub         edi,dword ptr [ebp-8]
 0007A8A4    push        edi
 0007A8A5    mov         al,byte ptr [ebp-1]
 0007A8A8    push        eax
 0007A8A9    lea         eax,[ebp-20]
 0007A8AC    push        eax
 0007A8AD    mov         ecx,dword ptr [ebp-8]
 0007A8B0    inc         ecx
 0007A8B1    mov         edx,dword ptr [ebx]
 0007A8B3    mov         eax,esi
 0007A8B5    call        PadSubField
 0007A8BA    mov         edx,dword ptr [ebp-20]
 0007A8BD    mov         eax,ebx
 0007A8BF    call        @LStrLAsg
 0007A8C4    mov         eax,dword ptr [ebx]
 0007A8C6    call        @LStrLen
 0007A8CB    test        eax,eax
>0007A8CD    jle         0007A90D
 0007A8CF    mov         dword ptr [ebp-18],eax
 0007A8D2    mov         dword ptr [ebp-10],1
 0007A8D9    mov         eax,dword ptr [ebx]
 0007A8DB    mov         edx,dword ptr [ebp-10]
 0007A8DE    cmp         byte ptr [eax+edx-1],20
>0007A8E3    jne         0007A905
 0007A8E5    mov         edx,dword ptr [ebp-10]
 0007A8E8    dec         edx
 0007A8E9    mov         eax,esi
 0007A8EB    call        IsLiteralChar
 0007A8F0    test        al,al
>0007A8F2    jne         0007A905
 0007A8F4    mov         eax,ebx
 0007A8F6    call        UniqueString
 0007A8FB    mov         edx,dword ptr [ebp-10]
 0007A8FE    mov         cl,byte ptr [ebp-1]
 0007A901    mov         byte ptr [eax+edx-1],cl
 0007A905    inc         dword ptr [ebp-10]
 0007A908    dec         dword ptr [ebp-18]
>0007A90B    jne         0007A8D9
 0007A90D    xor         eax,eax
 0007A90F    pop         edx
 0007A910    pop         ecx
 0007A911    pop         ecx
 0007A912    mov         dword ptr fs:[eax],edx
 0007A915    push        7A92A
 0007A91A    lea         eax,[ebp-20]
 0007A91D    call        @LStrClr
 0007A922    ret
>0007A923    jmp         @HandleFinally
>0007A928    jmp         0007A91A
 0007A92A    pop         edi
 0007A92B    pop         esi
 0007A92C    pop         ebx
 0007A92D    mov         esp,ebp
 0007A92F    pop         ebp
 0007A930    ret         4
*}
end;

//0007A934
constructor TCustomMaskEdit.Create(AOwner:TComponent);
begin
{*
 0007A934    push        ebx
 0007A935    push        esi
 0007A936    test        dl,dl
>0007A938    je          0007A942
 0007A93A    add         esp,0FFFFFFF0
 0007A93D    call        @ClassCreate
 0007A942    mov         ebx,edx
 0007A944    mov         esi,eax
 0007A946    xor         edx,edx
 0007A948    mov         eax,esi
 0007A94A    call        TCustomEdit.Create
 0007A94F    mov         al,[0007A980]
 0007A954    mov         byte ptr [esi+211],al
 0007A95A    mov         al,[000B4DF0]
 0007A95F    mov         byte ptr [esi+208],al
 0007A965    mov         eax,esi
 0007A967    test        bl,bl
>0007A969    je          0007A97A
 0007A96B    call        @AfterConstruction
 0007A970    pop         dword ptr fs:[0]
 0007A977    add         esp,0C
 0007A97A    mov         eax,esi
 0007A97C    pop         esi
 0007A97D    pop         ebx
 0007A97E    ret
*}
end;

//0007A984
procedure TCustomMaskEdit.KeyDown(var Key:Word; Shift:TShiftState);
begin
{*
 0007A984    push        ebx
 0007A985    push        esi
 0007A986    push        ecx
 0007A987    mov         byte ptr [esp],cl
 0007A98A    mov         ebx,edx
 0007A98C    mov         esi,eax
 0007A98E    mov         edx,ebx
 0007A990    mov         cl,byte ptr [esp]
 0007A993    mov         eax,esi
 0007A995    call        TWinControl.KeyDown
 0007A99A    mov         eax,esi
 0007A99C    call        TCustomMaskEdit.GetMasked
 0007A9A1    test        al,al
>0007A9A3    je          0007AA65
 0007A9A9    cmp         word ptr [ebx],0
>0007A9AD    je          0007AA65
 0007A9B3    test        byte ptr [esp],2
>0007A9B7    jne         0007AA65
 0007A9BD    cmp         word ptr [ebx],25
>0007A9C1    je          0007A9C9
 0007A9C3    cmp         word ptr [ebx],27
>0007A9C7    jne         0007A9ED
 0007A9C9    mov         dx,word ptr [ebx]
 0007A9CC    mov         cl,byte ptr [esp]
 0007A9CF    mov         eax,esi
 0007A9D1    call        TCustomMaskEdit.ArrowKeys
 0007A9D6    test        byte ptr [esp],1
>0007A9DA    jne         0007AA65
 0007A9E0    test        byte ptr [esp],4
>0007A9E4    jne         0007AA65
 0007A9E6    mov         word ptr [ebx],0
>0007A9EB    jmp         0007AA65
 0007A9ED    cmp         word ptr [ebx],26
>0007A9F1    je          0007A9F9
 0007A9F3    cmp         word ptr [ebx],28
>0007A9F7    jne         0007AA00
 0007A9F9    mov         word ptr [ebx],0
>0007A9FE    jmp         0007AA65
 0007AA00    cmp         word ptr [ebx],24
>0007AA04    je          0007AA0C
 0007AA06    cmp         word ptr [ebx],23
>0007AA0A    jne         0007AA20
 0007AA0C    mov         dx,word ptr [ebx]
 0007AA0F    mov         cl,byte ptr [esp]
 0007AA12    mov         eax,esi
 0007AA14    call        TCustomMaskEdit.HomeEndKeys
 0007AA19    mov         word ptr [ebx],0
>0007AA1E    jmp         0007AA65
 0007AA20    cmp         word ptr [ebx],2E
>0007AA24    jne         0007AA39
 0007AA26    mov         al,byte ptr [esp]
 0007AA29    and         al,byte ptr ds:[7AA6C]
 0007AA2F    mov         dl,byte ptr ds:[7AA70]
 0007AA35    cmp         dl,al
>0007AA37    je          0007AA3F
 0007AA39    cmp         word ptr [ebx],8
>0007AA3D    jne         0007AA5E
 0007AA3F    mov         eax,esi
 0007AA41    mov         edx,dword ptr [eax]
 0007AA43    call        dword ptr [edx+0D8]
 0007AA49    test        al,al
>0007AA4B    je          0007AA57
 0007AA4D    mov         dx,word ptr [ebx]
 0007AA50    mov         eax,esi
 0007AA52    call        TCustomMaskEdit.DeleteKeys
 0007AA57    mov         word ptr [ebx],0
>0007AA5C    jmp         0007AA65
 0007AA5E    mov         eax,esi
 0007AA60    call        TCustomMaskEdit.CheckCursor
 0007AA65    pop         edx
 0007AA66    pop         esi
 0007AA67    pop         ebx
 0007AA68    ret
*}
end;

//0007AA74
procedure TCustomMaskEdit.KeyUp(var Key:Word; Shift:TShiftState);
begin
{*
 0007AA74    push        ebx
 0007AA75    push        esi
 0007AA76    push        ecx
 0007AA77    mov         byte ptr [esp],cl
 0007AA7A    mov         esi,edx
 0007AA7C    mov         ebx,eax
 0007AA7E    mov         edx,esi
 0007AA80    mov         cl,byte ptr [esp]
 0007AA83    mov         eax,ebx
 0007AA85    call        TWinControl.KeyUp
 0007AA8A    mov         eax,ebx
 0007AA8C    call        TCustomMaskEdit.GetMasked
 0007AA91    test        al,al
>0007AA93    je          0007AAB4
 0007AA95    cmp         word ptr [esi],0
>0007AA99    je          0007AAB4
 0007AA9B    cmp         word ptr [esi],25
>0007AA9F    je          0007AAA7
 0007AAA1    cmp         word ptr [esi],27
>0007AAA5    jne         0007AAB4
 0007AAA7    test        byte ptr [esp],4
>0007AAAB    je          0007AAB4
 0007AAAD    mov         eax,ebx
 0007AAAF    call        TCustomMaskEdit.CheckCursor
 0007AAB4    pop         edx
 0007AAB5    pop         esi
 0007AAB6    pop         ebx
 0007AAB7    ret
*}
end;

//0007AAB8
procedure TCustomMaskEdit.KeyPress(var Key:Char);
begin
{*
 0007AAB8    push        ebx
 0007AAB9    push        esi
 0007AABA    mov         ebx,edx
 0007AABC    mov         esi,eax
 0007AABE    mov         edx,ebx
 0007AAC0    mov         eax,esi
 0007AAC2    call        TWinControl.KeyPress
 0007AAC7    mov         eax,esi
 0007AAC9    call        TCustomMaskEdit.GetMasked
 0007AACE    test        al,al
>0007AAD0    je          0007AAF1
 0007AAD2    cmp         byte ptr [ebx],0
>0007AAD5    je          0007AAF1
 0007AAD7    mov         al,byte ptr [ebx]
 0007AAD9    sub         al,3
>0007AADB    je          0007AAF1
 0007AADD    sub         al,13
>0007AADF    je          0007AAF1
 0007AAE1    sub         al,2
>0007AAE3    je          0007AAF1
 0007AAE5    mov         edx,ebx
 0007AAE7    mov         eax,esi
 0007AAE9    call        TCustomMaskEdit.CharKeys
 0007AAEE    mov         byte ptr [ebx],0
 0007AAF1    pop         esi
 0007AAF2    pop         ebx
 0007AAF3    ret
*}
end;

//0007AAF4
procedure TCustomMaskEdit.WMLButtonDown(var Message:TWMLButtonDown);
begin
{*
 0007AAF4    push        ebx
 0007AAF5    push        esi
 0007AAF6    mov         esi,edx
 0007AAF8    mov         ebx,eax
 0007AAFA    mov         edx,esi
 0007AAFC    mov         eax,ebx
 0007AAFE    call        TControl.WMLButtonDown
 0007AB03    movsx       eax,word ptr [esi+8]
 0007AB07    mov         dword ptr [ebx+218],eax
 0007AB0D    pop         esi
 0007AB0E    pop         ebx
 0007AB0F    ret
*}
end;

//0007AB10
procedure TCustomMaskEdit.WMLButtonUp(var Message:TWMLButtonUp);
begin
{*
 0007AB10    push        ebx
 0007AB11    push        esi
 0007AB12    add         esp,0FFFFFFF8
 0007AB15    mov         esi,edx
 0007AB17    mov         ebx,eax
 0007AB19    mov         edx,esi
 0007AB1B    mov         eax,ebx
 0007AB1D    call        TControl.WMLButtonUp
 0007AB22    mov         eax,ebx
 0007AB24    call        TCustomMaskEdit.GetMasked
 0007AB29    test        al,al
>0007AB2B    je          0007AB69
 0007AB2D    lea         ecx,[esp+4]
 0007AB31    mov         edx,esp
 0007AB33    mov         eax,ebx
 0007AB35    call        TCustomMaskEdit.GetSel
 0007AB3A    mov         eax,dword ptr [esp]
 0007AB3D    mov         dword ptr [ebx+214],eax
 0007AB43    mov         eax,dword ptr [esp]
 0007AB46    cmp         eax,dword ptr [esp+4]
>0007AB4A    je          0007AB62
 0007AB4C    movsx       eax,word ptr [esi+8]
 0007AB50    cmp         eax,dword ptr [ebx+218]
>0007AB56    jle         0007AB62
 0007AB58    mov         eax,dword ptr [esp+4]
 0007AB5C    mov         dword ptr [ebx+214],eax
 0007AB62    mov         eax,ebx
 0007AB64    call        TCustomMaskEdit.CheckCursor
 0007AB69    pop         ecx
 0007AB6A    pop         edx
 0007AB6B    pop         esi
 0007AB6C    pop         ebx
 0007AB6D    ret
*}
end;

//0007AB70
procedure TCustomMaskEdit.WMSetFocus(var Message:TWMSetFocus);
begin
{*
 0007AB70    push        ebx
 0007AB71    mov         ebx,eax
 0007AB73    mov         eax,ebx
 0007AB75    call        TWinControl.WMSetFocus
 0007AB7A    mov         eax,ebx
 0007AB7C    call        TCustomMaskEdit.GetMasked
 0007AB81    test        al,al
>0007AB83    je          0007AB8C
 0007AB85    mov         eax,ebx
 0007AB87    call        TCustomMaskEdit.CheckCursor
 0007AB8C    pop         ebx
 0007AB8D    ret
*}
end;

//0007AB90
procedure TCustomMaskEdit.SetEditText(const Value:AnsiString);
begin
{*
 0007AB90    push        ebp
 0007AB91    mov         ebp,esp
 0007AB93    push        0
 0007AB95    push        ebx
 0007AB96    push        esi
 0007AB97    mov         esi,edx
 0007AB99    mov         ebx,eax
 0007AB9B    xor         eax,eax
 0007AB9D    push        ebp
 0007AB9E    push        7ABEC
 0007ABA3    push        dword ptr fs:[eax]
 0007ABA6    mov         dword ptr fs:[eax],esp
 0007ABA9    lea         edx,[ebp-4]
 0007ABAC    mov         eax,ebx
 0007ABAE    call        TCustomMaskEdit.GetEditText
 0007ABB3    mov         eax,dword ptr [ebp-4]
 0007ABB6    mov         edx,esi
 0007ABB8    call        @LStrCmp
>0007ABBD    je          0007ABD6
 0007ABBF    mov         eax,esi
 0007ABC1    call        @LStrToPChar
 0007ABC6    mov         edx,eax
 0007ABC8    mov         eax,ebx
 0007ABCA    call        TControl.SetTextBuf
 0007ABCF    mov         eax,ebx
 0007ABD1    call        TCustomMaskEdit.CheckCursor
 0007ABD6    xor         eax,eax
 0007ABD8    pop         edx
 0007ABD9    pop         ecx
 0007ABDA    pop         ecx
 0007ABDB    mov         dword ptr fs:[eax],edx
 0007ABDE    push        7ABF3
 0007ABE3    lea         eax,[ebp-4]
 0007ABE6    call        @LStrClr
 0007ABEB    ret
>0007ABEC    jmp         @HandleFinally
>0007ABF1    jmp         0007ABE3
 0007ABF3    pop         esi
 0007ABF4    pop         ebx
 0007ABF5    pop         ecx
 0007ABF6    pop         ebp
 0007ABF7    ret
*}
end;

//0007ABF8
function TCustomMaskEdit.GetEditText:AnsiString;
begin
{*
 0007ABF8    push        ebx
 0007ABF9    push        esi
 0007ABFA    mov         esi,edx
 0007ABFC    mov         ebx,eax
 0007ABFE    mov         edx,esi
 0007AC00    mov         eax,ebx
 0007AC02    call        TControl.GetText
 0007AC07    pop         esi
 0007AC08    pop         ebx
 0007AC09    ret
*}
end;

//0007AC0C
function TCustomMaskEdit.GetTextLen:Integer;
begin
{*
 0007AC0C    push        ebp
 0007AC0D    mov         ebp,esp
 0007AC0F    push        0
 0007AC11    push        ebx
 0007AC12    mov         ebx,eax
 0007AC14    xor         eax,eax
 0007AC16    push        ebp
 0007AC17    push        7AC4C
 0007AC1C    push        dword ptr fs:[eax]
 0007AC1F    mov         dword ptr fs:[eax],esp
 0007AC22    lea         edx,[ebp-4]
 0007AC25    mov         eax,ebx
 0007AC27    call        TCustomMaskEdit.GetText
 0007AC2C    mov         eax,dword ptr [ebp-4]
 0007AC2F    call        @LStrLen
 0007AC34    mov         ebx,eax
 0007AC36    xor         eax,eax
 0007AC38    pop         edx
 0007AC39    pop         ecx
 0007AC3A    pop         ecx
 0007AC3B    mov         dword ptr fs:[eax],edx
 0007AC3E    push        7AC53
 0007AC43    lea         eax,[ebp-4]
 0007AC46    call        @LStrClr
 0007AC4B    ret
>0007AC4C    jmp         @HandleFinally
>0007AC51    jmp         0007AC43
 0007AC53    mov         eax,ebx
 0007AC55    pop         ebx
 0007AC56    pop         ecx
 0007AC57    pop         ebp
 0007AC58    ret
*}
end;

//0007AC5C
function TCustomMaskEdit.GetText:AnsiString;
begin
{*
 0007AC5C    push        ebp
 0007AC5D    mov         ebp,esp
 0007AC5F    push        0
 0007AC61    push        ebx
 0007AC62    push        esi
 0007AC63    mov         esi,edx
 0007AC65    mov         ebx,eax
 0007AC67    xor         eax,eax
 0007AC69    push        ebp
 0007AC6A    push        7ACD9
 0007AC6F    push        dword ptr fs:[eax]
 0007AC72    mov         dword ptr fs:[eax],esp
 0007AC75    mov         eax,ebx
 0007AC77    call        TCustomMaskEdit.GetMasked
 0007AC7C    test        al,al
>0007AC7E    jne         0007AC8B
 0007AC80    mov         edx,esi
 0007AC82    mov         eax,ebx
 0007AC84    call        TControl.GetText
>0007AC89    jmp         0007ACC3
 0007AC8B    lea         edx,[ebp-4]
 0007AC8E    mov         eax,ebx
 0007AC90    call        TCustomMaskEdit.GetEditText
 0007AC95    mov         edx,dword ptr [ebp-4]
 0007AC98    mov         ecx,esi
 0007AC9A    mov         eax,ebx
 0007AC9C    call        TCustomMaskEdit.RemoveEditFormat
 0007ACA1    cmp         byte ptr [ebx+210],0
>0007ACA8    je          0007ACC3
 0007ACAA    lea         eax,[ebp-4]
 0007ACAD    push        eax
 0007ACAE    mov         edx,dword ptr [esi]
 0007ACB0    xor         ecx,ecx
 0007ACB2    mov         eax,ebx
 0007ACB4    call        TCustomMaskEdit.AddEditFormat
 0007ACB9    mov         edx,dword ptr [ebp-4]
 0007ACBC    mov         eax,esi
 0007ACBE    call        @LStrLAsg
 0007ACC3    xor         eax,eax
 0007ACC5    pop         edx
 0007ACC6    pop         ecx
 0007ACC7    pop         ecx
 0007ACC8    mov         dword ptr fs:[eax],edx
 0007ACCB    push        7ACE0
 0007ACD0    lea         eax,[ebp-4]
 0007ACD3    call        @LStrClr
 0007ACD8    ret
>0007ACD9    jmp         @HandleFinally
>0007ACDE    jmp         0007ACD0
 0007ACE0    pop         esi
 0007ACE1    pop         ebx
 0007ACE2    pop         ecx
 0007ACE3    pop         ebp
 0007ACE4    ret
*}
end;

//0007ACE8
procedure TCustomMaskEdit.SetText(const Value:AnsiString);
begin
{*
 0007ACE8    push        ebp
 0007ACE9    mov         ebp,esp
 0007ACEB    push        0
 0007ACED    push        0
 0007ACEF    push        0
 0007ACF1    push        ebx
 0007ACF2    push        esi
 0007ACF3    mov         esi,edx
 0007ACF5    mov         ebx,eax
 0007ACF7    xor         eax,eax
 0007ACF9    push        ebp
 0007ACFA    push        7ADE3
 0007ACFF    push        dword ptr fs:[eax]
 0007AD02    mov         dword ptr fs:[eax],esp
 0007AD05    mov         eax,ebx
 0007AD07    call        TCustomMaskEdit.GetMasked
 0007AD0C    test        al,al
>0007AD0E    jne         0007AD1E
 0007AD10    mov         edx,esi
 0007AD12    mov         eax,ebx
 0007AD14    call        TControl.SetText
>0007AD19    jmp         0007ADC5
 0007AD1E    lea         eax,[ebp-4]
 0007AD21    mov         edx,esi
 0007AD23    call        @LStrLAsg
 0007AD28    cmp         byte ptr [ebx+210],0
>0007AD2F    je          0007AD56
 0007AD31    lea         eax,[ebp-0C]
 0007AD34    push        eax
 0007AD35    mov         cl,byte ptr [ebx+208]
 0007AD3B    mov         edx,dword ptr [ebp-4]
 0007AD3E    mov         eax,dword ptr [ebx+204]
 0007AD44    call        PadInputLiterals
 0007AD49    mov         edx,dword ptr [ebp-0C]
 0007AD4C    lea         eax,[ebp-4]
 0007AD4F    call        @LStrLAsg
>0007AD54    jmp         0007AD71
 0007AD56    lea         eax,[ebp-0C]
 0007AD59    push        eax
 0007AD5A    mov         cl,1
 0007AD5C    mov         edx,dword ptr [ebp-4]
 0007AD5F    mov         eax,ebx
 0007AD61    call        TCustomMaskEdit.AddEditFormat
 0007AD66    mov         edx,dword ptr [ebp-0C]
 0007AD69    lea         eax,[ebp-4]
 0007AD6C    call        @LStrLAsg
 0007AD71    test        byte ptr [ebx+211],4
>0007AD78    jne         0007ADBB
 0007AD7A    test        byte ptr [ebx+20],10
>0007AD7E    je          0007ADBB
 0007AD80    test        byte ptr [ebx+20],1
>0007AD84    jne         0007ADBB
 0007AD86    lea         ecx,[ebp-8]
 0007AD89    mov         edx,dword ptr [ebp-4]
 0007AD8C    mov         eax,ebx
 0007AD8E    mov         esi,dword ptr [eax]
 0007AD90    call        dword ptr [esi+0E0]
 0007AD96    test        al,al
>0007AD98    jne         0007ADBB
 0007AD9A    lea         edx,[ebp-0C]
 0007AD9D    mov         eax,[000B56C0];^SMaskErr:TResStringRec
 0007ADA2    call        LoadResString
 0007ADA7    mov         ecx,dword ptr [ebp-0C]
 0007ADAA    mov         dl,1
 0007ADAC    mov         eax,[00079DF8];EDBEditError
 0007ADB1    call        Exception.Create
 0007ADB6    call        @RaiseExcept
 0007ADBB    mov         edx,dword ptr [ebp-4]
 0007ADBE    mov         eax,ebx
 0007ADC0    call        TCustomMaskEdit.SetEditText
 0007ADC5    xor         eax,eax
 0007ADC7    pop         edx
 0007ADC8    pop         ecx
 0007ADC9    pop         ecx
 0007ADCA    mov         dword ptr fs:[eax],edx
 0007ADCD    push        7ADEA
 0007ADD2    lea         eax,[ebp-0C]
 0007ADD5    call        @LStrClr
 0007ADDA    lea         eax,[ebp-4]
 0007ADDD    call        @LStrClr
 0007ADE2    ret
>0007ADE3    jmp         @HandleFinally
>0007ADE8    jmp         0007ADD2
 0007ADEA    pop         esi
 0007ADEB    pop         ebx
 0007ADEC    mov         esp,ebp
 0007ADEE    pop         ebp
 0007ADEF    ret
*}
end;

//0007ADF0
procedure TCustomMaskEdit.WMCut(var Message:TMessage);
begin
{*
 0007ADF0    push        ebx
 0007ADF1    push        esi
 0007ADF2    mov         esi,edx
 0007ADF4    mov         ebx,eax
 0007ADF6    mov         eax,ebx
 0007ADF8    call        TCustomMaskEdit.GetMasked
 0007ADFD    test        al,al
>0007ADFF    jne         0007AE0D
 0007AE01    mov         edx,esi
 0007AE03    mov         eax,ebx
 0007AE05    mov         ecx,dword ptr [eax]
 0007AE07    call        dword ptr [ecx-10]
 0007AE0A    pop         esi
 0007AE0B    pop         ebx
 0007AE0C    ret
 0007AE0D    mov         eax,ebx
 0007AE0F    call        TCustomEdit.CopyToClipboard
 0007AE14    mov         dx,2E
 0007AE18    mov         eax,ebx
 0007AE1A    call        TCustomMaskEdit.DeleteKeys
 0007AE1F    pop         esi
 0007AE20    pop         ebx
 0007AE21    ret
*}
end;

//0007AE24
procedure TCustomMaskEdit.WMPaste(var Message:TMessage);
begin
{*
 0007AE24    push        ebp
 0007AE25    mov         ebp,esp
 0007AE27    add         esp,0FFFFFFF0
 0007AE2A    push        ebx
 0007AE2B    push        esi
 0007AE2C    xor         ecx,ecx
 0007AE2E    mov         dword ptr [ebp-4],ecx
 0007AE31    mov         dword ptr [ebp-8],ecx
 0007AE34    mov         esi,edx
 0007AE36    mov         ebx,eax
 0007AE38    xor         eax,eax
 0007AE3A    push        ebp
 0007AE3B    push        7AEFE
 0007AE40    push        dword ptr fs:[eax]
 0007AE43    mov         dword ptr fs:[eax],esp
 0007AE46    mov         eax,ebx
 0007AE48    call        TCustomMaskEdit.GetMasked
 0007AE4D    test        al,al
>0007AE4F    je          0007AE5A
 0007AE51    cmp         byte ptr [ebx+1F2],0
>0007AE58    je          0007AE65
 0007AE5A    mov         edx,esi
 0007AE5C    mov         eax,ebx
 0007AE5E    mov         ecx,dword ptr [eax]
 0007AE60    call        dword ptr [ecx-10]
>0007AE63    jmp         0007AEE3
 0007AE65    call        Clipboard
 0007AE6A    call        TClipboard.Open
 0007AE6F    call        Clipboard
 0007AE74    lea         edx,[ebp-4]
 0007AE77    call        TClipboard.GetAsText
 0007AE7C    call        Clipboard
 0007AE81    call        TClipboard.Close
 0007AE86    lea         ecx,[ebp-10]
 0007AE89    lea         edx,[ebp-0C]
 0007AE8C    mov         eax,ebx
 0007AE8E    call        TCustomMaskEdit.GetSel
 0007AE93    lea         edx,[ebp-8]
 0007AE96    mov         eax,ebx
 0007AE98    call        TCustomMaskEdit.GetEditText
 0007AE9D    mov         eax,dword ptr [ebp-10]
 0007AEA0    sub         eax,dword ptr [ebp-0C]
 0007AEA3    push        eax
 0007AEA4    lea         edx,[ebp-8]
 0007AEA7    mov         ecx,dword ptr [ebp-0C]
 0007AEAA    mov         eax,ebx
 0007AEAC    call        TCustomMaskEdit.DeleteSelection
 0007AEB1    mov         edx,dword ptr [ebp-8]
 0007AEB4    mov         eax,ebx
 0007AEB6    call        TCustomMaskEdit.SetEditText
 0007AEBB    mov         eax,dword ptr [ebp-0C]
 0007AEBE    push        eax
 0007AEBF    lea         edx,[ebp-8]
 0007AEC2    mov         ecx,dword ptr [ebp-4]
 0007AEC5    mov         eax,ebx
 0007AEC7    call        TCustomMaskEdit.InputString
 0007AECC    mov         dword ptr [ebp-0C],eax
 0007AECF    mov         edx,dword ptr [ebp-8]
 0007AED2    mov         eax,ebx
 0007AED4    call        TCustomMaskEdit.SetEditText
 0007AED9    mov         edx,dword ptr [ebp-0C]
 0007AEDC    mov         eax,ebx
 0007AEDE    call        TCustomMaskEdit.SetCursor
 0007AEE3    xor         eax,eax
 0007AEE5    pop         edx
 0007AEE6    pop         ecx
 0007AEE7    pop         ecx
 0007AEE8    mov         dword ptr fs:[eax],edx
 0007AEEB    push        7AF05
 0007AEF0    lea         eax,[ebp-8]
 0007AEF3    mov         edx,2
 0007AEF8    call        @LStrArrayClr
 0007AEFD    ret
>0007AEFE    jmp         @HandleFinally
>0007AF03    jmp         0007AEF0
 0007AF05    pop         esi
 0007AF06    pop         ebx
 0007AF07    mov         esp,ebp
 0007AF09    pop         ebp
 0007AF0A    ret
*}
end;

//0007AF0C
function TCustomMaskEdit.GetMasked:Boolean;
begin
{*
 0007AF0C    push        ebx
 0007AF0D    mov         ebx,eax
 0007AF0F    cmp         dword ptr [ebx+204],0
 0007AF16    setne       al
 0007AF19    pop         ebx
 0007AF1A    ret
*}
end;

//0007AF1C
procedure TCustomMaskEdit.ReformatText(const NewMask:AnsiString);
begin
{*
 0007AF1C    push        ebp
 0007AF1D    mov         ebp,esp
 0007AF1F    push        0
 0007AF21    push        0
 0007AF23    push        ebx
 0007AF24    push        esi
 0007AF25    mov         esi,edx
 0007AF27    mov         ebx,eax
 0007AF29    xor         eax,eax
 0007AF2B    push        ebp
 0007AF2C    push        7AFCF
 0007AF31    push        dword ptr fs:[eax]
 0007AF34    mov         dword ptr fs:[eax],esp
 0007AF37    lea         edx,[ebp-8]
 0007AF3A    mov         eax,ebx
 0007AF3C    call        TCustomMaskEdit.GetEditText
 0007AF41    mov         edx,dword ptr [ebp-8]
 0007AF44    lea         ecx,[ebp-4]
 0007AF47    mov         eax,ebx
 0007AF49    call        TCustomMaskEdit.RemoveEditFormat
 0007AF4E    lea         eax,[ebx+204]
 0007AF54    mov         edx,esi
 0007AF56    call        @LStrAsg
 0007AF5B    mov         eax,esi
 0007AF5D    call        @LStrLen
 0007AF62    mov         edx,eax
 0007AF64    mov         eax,dword ptr [ebx+204]
 0007AF6A    call        MaskOffsetToOffset
 0007AF6F    mov         dword ptr [ebx+20C],eax
 0007AF75    mov         eax,esi
 0007AF77    call        MaskGetMaskSave
 0007AF7C    mov         byte ptr [ebx+210],al
 0007AF82    mov         eax,esi
 0007AF84    call        MaskGetMaskBlank
 0007AF89    mov         byte ptr [ebx+208],al
 0007AF8F    lea         eax,[ebp-8]
 0007AF92    push        eax
 0007AF93    mov         cl,1
 0007AF95    mov         edx,dword ptr [ebp-4]
 0007AF98    mov         eax,ebx
 0007AF9A    call        TCustomMaskEdit.AddEditFormat
 0007AF9F    mov         edx,dword ptr [ebp-8]
 0007AFA2    lea         eax,[ebp-4]
 0007AFA5    call        @LStrLAsg
 0007AFAA    mov         edx,dword ptr [ebp-4]
 0007AFAD    mov         eax,ebx
 0007AFAF    call        TCustomMaskEdit.SetEditText
 0007AFB4    xor         eax,eax
 0007AFB6    pop         edx
 0007AFB7    pop         ecx
 0007AFB8    pop         ecx
 0007AFB9    mov         dword ptr fs:[eax],edx
 0007AFBC    push        7AFD6
 0007AFC1    lea         eax,[ebp-8]
 0007AFC4    mov         edx,2
 0007AFC9    call        @LStrArrayClr
 0007AFCE    ret
>0007AFCF    jmp         @HandleFinally
>0007AFD4    jmp         0007AFC1
 0007AFD6    pop         esi
 0007AFD7    pop         ebx
 0007AFD8    pop         ecx
 0007AFD9    pop         ecx
 0007AFDA    pop         ebp
 0007AFDB    ret
*}
end;

//0007AFDC
procedure TCustomMaskEdit.SetEditMask(const Value:AnsiString);
begin
{*
 0007AFDC    push        ebx
 0007AFDD    push        esi
 0007AFDE    add         esp,0FFFFFFF8
 0007AFE1    mov         esi,edx
 0007AFE3    mov         ebx,eax
 0007AFE5    mov         eax,esi
 0007AFE7    mov         edx,dword ptr [ebx+204]
 0007AFED    call        @LStrCmp
>0007AFF2    je          0007B0A0
 0007AFF8    test        byte ptr [ebx+20],10
>0007AFFC    je          0007B011
 0007AFFE    test        esi,esi
>0007B000    je          0007B011
 0007B002    test        byte ptr [ebx+20],1
>0007B006    jne         0007B011
 0007B008    xor         edx,edx
 0007B00A    mov         eax,ebx
 0007B00C    call        TCustomMaskEdit.SetEditText
 0007B011    mov         eax,ebx
 0007B013    call        TWinControl.HandleAllocated
 0007B018    test        al,al
>0007B01A    je          0007B029
 0007B01C    lea         ecx,[esp+4]
 0007B020    mov         edx,esp
 0007B022    mov         eax,ebx
 0007B024    call        TCustomMaskEdit.GetSel
 0007B029    mov         edx,esi
 0007B02B    mov         eax,ebx
 0007B02D    call        TCustomMaskEdit.ReformatText
 0007B032    and         byte ptr [ebx+211],0FE
 0007B039    cmp         dword ptr [ebx+204],0
>0007B040    je          0007B049
 0007B042    or          byte ptr [ebx+211],1
 0007B049    xor         edx,edx
 0007B04B    mov         eax,ebx
 0007B04D    call        TCustomEdit.SetMaxLength
 0007B052    mov         eax,ebx
 0007B054    call        TCustomMaskEdit.GetMasked
 0007B059    test        al,al
>0007B05B    je          0007B073
 0007B05D    cmp         dword ptr [ebx+20C],0
>0007B064    jle         0007B073
 0007B066    mov         edx,dword ptr [ebx+20C]
 0007B06C    mov         eax,ebx
 0007B06E    call        TCustomEdit.SetMaxLength
 0007B073    mov         eax,ebx
 0007B075    call        TWinControl.HandleAllocated
 0007B07A    test        al,al
>0007B07C    je          0007B0A0
 0007B07E    mov         eax,ebx
 0007B080    call        TWinControl.GetHandle
 0007B085    mov         esi,eax
 0007B087    call        user32.GetFocus
 0007B08C    cmp         esi,eax
>0007B08E    jne         0007B0A0
 0007B090    test        byte ptr [ebx+20],10
>0007B094    jne         0007B0A0
 0007B096    mov         edx,dword ptr [esp]
 0007B099    mov         eax,ebx
 0007B09B    call        TCustomMaskEdit.SetCursor
 0007B0A0    pop         ecx
 0007B0A1    pop         edx
 0007B0A2    pop         esi
 0007B0A3    pop         ebx
 0007B0A4    ret
*}
end;

//0007B0A8
function TCustomMaskEdit.GetMaxLength:Integer;
begin
{*
 0007B0A8    mov         eax,dword ptr [eax+1EC]
 0007B0AE    ret
*}
end;

//0007B0B0
procedure TCustomMaskEdit.SetMaxLength(Value:Integer);
begin
{*
 0007B0B0    push        ebx
 0007B0B1    push        esi
 0007B0B2    mov         esi,edx
 0007B0B4    mov         ebx,eax
 0007B0B6    mov         eax,ebx
 0007B0B8    call        TCustomMaskEdit.GetMasked
 0007B0BD    test        al,al
>0007B0BF    jne         0007B0CD
 0007B0C1    mov         edx,esi
 0007B0C3    mov         eax,ebx
 0007B0C5    call        TCustomEdit.SetMaxLength
 0007B0CA    pop         esi
 0007B0CB    pop         ebx
 0007B0CC    ret
 0007B0CD    mov         edx,dword ptr [ebx+20C]
 0007B0D3    mov         eax,ebx
 0007B0D5    call        TCustomEdit.SetMaxLength
 0007B0DA    pop         esi
 0007B0DB    pop         ebx
 0007B0DC    ret
*}
end;

//0007B0E0
procedure TCustomMaskEdit.GetSel(var SelStart:Integer; var SelStop:Integer);
begin
{*
 0007B0E0    push        ebx
 0007B0E1    push        esi
 0007B0E2    push        edi
 0007B0E3    mov         edi,ecx
 0007B0E5    mov         esi,edx
 0007B0E7    mov         ebx,eax
 0007B0E9    push        edi
 0007B0EA    push        esi
 0007B0EB    push        0B0
 0007B0F0    mov         eax,ebx
 0007B0F2    call        TWinControl.GetHandle
 0007B0F7    push        eax
 0007B0F8    call        user32.SendMessageA
 0007B0FD    pop         edi
 0007B0FE    pop         esi
 0007B0FF    pop         ebx
 0007B100    ret
*}
end;

//0007B104
procedure TCustomMaskEdit.SetSel(SelStart:Integer; SelStop:Integer);
begin
{*
 0007B104    push        ebx
 0007B105    push        esi
 0007B106    push        edi
 0007B107    mov         edi,ecx
 0007B109    mov         esi,edx
 0007B10B    mov         ebx,eax
 0007B10D    push        edi
 0007B10E    push        esi
 0007B10F    push        0B1
 0007B114    mov         eax,ebx
 0007B116    call        TWinControl.GetHandle
 0007B11B    push        eax
 0007B11C    call        user32.SendMessageA
 0007B121    pop         edi
 0007B122    pop         esi
 0007B123    pop         ebx
 0007B124    ret
*}
end;

//0007B128
procedure TCustomMaskEdit.SetCursor(Pos:Integer);
begin
{*
 0007B128    push        ebp
 0007B129    mov         ebp,esp
 0007B12B    add         esp,0FFFFFDFC
 0007B131    push        ebx
 0007B132    push        esi
 0007B133    push        edi
 0007B134    xor         ecx,ecx
 0007B136    mov         dword ptr [ebp-204],ecx
 0007B13C    mov         ebx,edx
 0007B13E    mov         esi,eax
 0007B140    xor         eax,eax
 0007B142    push        ebp
 0007B143    push        7B30A
 0007B148    push        dword ptr fs:[eax]
 0007B14B    mov         dword ptr fs:[eax],esp
 0007B14E    cmp         ebx,1
>0007B151    jl          0007B172
 0007B153    lea         edx,[ebp-204]
 0007B159    mov         eax,esi
 0007B15B    call        TCustomMaskEdit.GetEditText
 0007B160    mov         eax,dword ptr [ebp-204]
 0007B166    mov         edx,ebx
 0007B168    call        ByteType
 0007B16D    cmp         al,1
>0007B16F    jne         0007B172
 0007B171    dec         ebx
 0007B172    mov         edi,ebx
 0007B174    mov         eax,esi
 0007B176    call        TCustomMaskEdit.GetMasked
 0007B17B    test        al,al
>0007B17D    je          0007B2AA
 0007B183    test        edi,edi
>0007B185    jge         0007B189
 0007B187    xor         edi,edi
 0007B189    lea         ebx,[edi+1]
 0007B18C    lea         edx,[ebp-204]
 0007B192    mov         eax,esi
 0007B194    call        TCustomMaskEdit.GetEditText
 0007B199    mov         eax,dword ptr [ebp-204]
 0007B19F    call        @LStrLen
 0007B1A4    cmp         ebx,eax
>0007B1A6    jge         0007B1D0
 0007B1A8    lea         edx,[ebp-204]
 0007B1AE    mov         eax,esi
 0007B1B0    call        TCustomMaskEdit.GetEditText
 0007B1B5    mov         eax,dword ptr [ebp-204]
 0007B1BB    mov         al,byte ptr [eax+ebx-1]
 0007B1BF    mov         edx,dword ptr ds:[0B5BE8]
 0007B1C5    and         eax,0FF
 0007B1CA    bt          dword ptr [edx],eax
>0007B1CD    jae         0007B1D0
 0007B1CF    inc         ebx
 0007B1D0    mov         eax,dword ptr [esi+20C]
 0007B1D6    cmp         edi,eax
>0007B1D8    jl          0007B1DE
 0007B1DA    mov         edi,eax
 0007B1DC    mov         ebx,edi
 0007B1DE    mov         ecx,ebx
 0007B1E0    mov         edx,ebx
 0007B1E2    mov         eax,esi
 0007B1E4    call        TCustomMaskEdit.SetSel
 0007B1E9    cmp         ebx,edi
>0007B1EB    je          0007B2A2
 0007B1F1    lea         eax,[ebp-100]
 0007B1F7    push        eax
 0007B1F8    call        user32.GetKeyboardState
 0007B1FD    mov         edx,100
 0007B202    lea         eax,[ebp-200]
 0007B208    mov         byte ptr [eax],0
 0007B20B    inc         eax
 0007B20C    dec         edx
>0007B20D    jne         0007B208
 0007B20F    mov         byte ptr [ebp-1F0],81
 0007B216    mov         eax,esi
 0007B218    mov         bx,0FFCF
 0007B21C    call        @CallDynaInst
 0007B221    and         eax,7F
 0007B224    movzx       eax,word ptr [eax*2+0B4DFC]
 0007B22C    mov         byte ptr [ebp+eax-200],81
 0007B234    lea         eax,[ebp-200]
 0007B23A    push        eax
 0007B23B    call        user32.SetKeyboardState
 0007B240    push        1
 0007B242    mov         eax,esi
 0007B244    mov         bx,0FFCF
 0007B248    call        @CallDynaInst
 0007B24D    and         eax,7F
 0007B250    movzx       eax,word ptr [eax*2+0B4DFC]
 0007B258    push        eax
 0007B259    push        100
 0007B25E    mov         eax,esi
 0007B260    call        TWinControl.GetHandle
 0007B265    push        eax
 0007B266    call        user32.SendMessageA
 0007B26B    push        1
 0007B26D    mov         eax,esi
 0007B26F    mov         bx,0FFCF
 0007B273    call        @CallDynaInst
 0007B278    and         eax,7F
 0007B27B    movzx       eax,word ptr [eax*2+0B4DFC]
 0007B283    push        eax
 0007B284    push        101
 0007B289    mov         eax,esi
 0007B28B    call        TWinControl.GetHandle
 0007B290    push        eax
 0007B291    call        user32.SendMessageA
 0007B296    lea         eax,[ebp-100]
 0007B29C    push        eax
 0007B29D    call        user32.SetKeyboardState
 0007B2A2    mov         dword ptr [esi+214],edi
>0007B2A8    jmp         0007B2F1
 0007B2AA    test        edi,edi
>0007B2AC    jge         0007B2B0
 0007B2AE    xor         edi,edi
 0007B2B0    lea         edx,[ebp-204]
 0007B2B6    mov         eax,esi
 0007B2B8    call        TCustomMaskEdit.GetEditText
 0007B2BD    mov         eax,dword ptr [ebp-204]
 0007B2C3    call        @LStrLen
 0007B2C8    cmp         edi,eax
>0007B2CA    jl          0007B2E6
 0007B2CC    lea         edx,[ebp-204]
 0007B2D2    mov         eax,esi
 0007B2D4    call        TCustomMaskEdit.GetEditText
 0007B2D9    mov         eax,dword ptr [ebp-204]
 0007B2DF    call        @LStrLen
 0007B2E4    mov         edi,eax
 0007B2E6    mov         ecx,edi
 0007B2E8    mov         edx,edi
 0007B2EA    mov         eax,esi
 0007B2EC    call        TCustomMaskEdit.SetSel
 0007B2F1    xor         eax,eax
 0007B2F3    pop         edx
 0007B2F4    pop         ecx
 0007B2F5    pop         ecx
 0007B2F6    mov         dword ptr fs:[eax],edx
 0007B2F9    push        7B311
 0007B2FE    lea         eax,[ebp-204]
 0007B304    call        @LStrClr
 0007B309    ret
>0007B30A    jmp         @HandleFinally
>0007B30F    jmp         0007B2FE
 0007B311    pop         edi
 0007B312    pop         esi
 0007B313    pop         ebx
 0007B314    mov         esp,ebp
 0007B316    pop         ebp
 0007B317    ret
*}
end;

//0007B318
procedure TCustomMaskEdit.CheckCursor;
begin
{*
 0007B318    push        ebx
 0007B319    add         esp,0FFFFFFF8
 0007B31C    mov         ebx,eax
 0007B31E    mov         eax,ebx
 0007B320    call        TWinControl.HandleAllocated
 0007B325    test        al,al
>0007B327    je          0007B354
 0007B329    mov         eax,ebx
 0007B32B    call        TCustomMaskEdit.GetMasked
 0007B330    test        al,al
>0007B332    je          0007B354
 0007B334    lea         ecx,[esp+4]
 0007B338    mov         edx,esp
 0007B33A    mov         eax,ebx
 0007B33C    call        TCustomMaskEdit.GetSel
 0007B341    mov         eax,dword ptr [esp]
 0007B344    cmp         eax,dword ptr [esp+4]
>0007B348    jne         0007B354
 0007B34A    mov         edx,dword ptr [esp]
 0007B34D    mov         eax,ebx
 0007B34F    call        TCustomMaskEdit.SetCursor
 0007B354    pop         ecx
 0007B355    pop         edx
 0007B356    pop         ebx
 0007B357    ret
*}
end;

//0007B358
{*function sub_0007B358:?;
begin
 0007B358    mov         al,1
 0007B35A    ret
end;*}

//0007B35C
procedure TCustomMaskEdit.Reset;
begin
{*
 0007B35C    push        ebx
 0007B35D    mov         ebx,eax
 0007B35F    mov         eax,ebx
 0007B361    call        TCustomEdit.GetModified
 0007B366    test        al,al
>0007B368    je          0007B380
 0007B36A    mov         edx,dword ptr [ebx+21C]
 0007B370    mov         eax,ebx
 0007B372    call        TCustomMaskEdit.SetEditText
 0007B377    xor         edx,edx
 0007B379    mov         eax,ebx
 0007B37B    call        TCustomEdit.SetModified
 0007B380    pop         ebx
 0007B381    ret
*}
end;

//0007B384
function TCustomMaskEdit.CharKeys(var CharCode:Char):Boolean;
begin
{*
 0007B384    push        ebp
 0007B385    mov         ebp,esp
 0007B387    add         esp,0FFFFFFC8
 0007B38A    push        ebx
 0007B38B    push        esi
 0007B38C    xor         ecx,ecx
 0007B38E    mov         dword ptr [ebp-10],ecx
 0007B391    mov         ebx,edx
 0007B393    mov         esi,eax
 0007B395    xor         eax,eax
 0007B397    push        ebp
 0007B398    push        7B549
 0007B39D    push        dword ptr fs:[eax]
 0007B3A0    mov         dword ptr fs:[eax],esp
 0007B3A3    mov         byte ptr [ebp-1],0
 0007B3A7    xor         eax,eax
 0007B3A9    mov         al,byte ptr [ebx]
 0007B3AB    cmp         ax,1B
>0007B3AF    jne         0007B3C0
 0007B3B1    mov         eax,esi
 0007B3B3    mov         edx,dword ptr [eax]
 0007B3B5    call        dword ptr [edx+0DC]
>0007B3BB    jmp         0007B533
 0007B3C0    mov         eax,esi
 0007B3C2    mov         edx,dword ptr [eax]
 0007B3C4    call        dword ptr [edx+0D8]
 0007B3CA    test        al,al
>0007B3CC    je          0007B533
 0007B3D2    cmp         byte ptr [esi+1F2],0
>0007B3D9    jne         0007B533
 0007B3DF    xor         eax,eax
 0007B3E1    mov         al,byte ptr [ebx]
 0007B3E3    cmp         ax,8
>0007B3E7    je          0007B533
 0007B3ED    cmp         ax,0D
>0007B3F1    jne         0007B402
 0007B3F3    mov         eax,esi
 0007B3F5    mov         edx,dword ptr [eax]
 0007B3F7    call        dword ptr [edx+0E8]
>0007B3FD    jmp         0007B533
 0007B402    lea         ecx,[ebp-0C]
 0007B405    lea         edx,[ebp-8]
 0007B408    mov         eax,esi
 0007B40A    call        TCustomMaskEdit.GetSel
 0007B40F    mov         eax,dword ptr [ebp-0C]
 0007B412    sub         eax,dword ptr [ebp-8]
 0007B415    dec         eax
>0007B416    jle         0007B43A
 0007B418    mov         dx,2E
 0007B41C    mov         eax,esi
 0007B41E    call        TCustomMaskEdit.DeleteKeys
 0007B423    mov         edx,dword ptr [ebp-8]
 0007B426    mov         eax,esi
 0007B428    call        TCustomMaskEdit.GetNextEditChar
 0007B42D    mov         dword ptr [ebp-8],eax
 0007B430    mov         edx,dword ptr [ebp-8]
 0007B433    mov         eax,esi
 0007B435    call        TCustomMaskEdit.SetCursor
 0007B43A    mov         al,byte ptr [ebx]
 0007B43C    mov         edx,dword ptr ds:[0B5BE8]
 0007B442    and         eax,0FF
 0007B447    bt          dword ptr [edx],eax
>0007B44A    jae         0007B47C
 0007B44C    push        1
 0007B44E    push        102
 0007B453    push        102
 0007B458    mov         eax,esi
 0007B45A    call        TWinControl.GetHandle
 0007B45F    push        eax
 0007B460    lea         eax,[ebp-2C]
 0007B463    push        eax
 0007B464    call        user32.PeekMessageA
 0007B469    test        eax,eax
>0007B46B    je          0007B47C
 0007B46D    cmp         dword ptr [ebp-28],12
>0007B471    jne         0007B47C
 0007B473    mov         eax,dword ptr [ebp-24]
 0007B476    push        eax
 0007B477    call        user32.PostQuitMessage
 0007B47C    mov         edx,ebx
 0007B47E    mov         ecx,dword ptr [ebp-8]
 0007B481    mov         eax,esi
 0007B483    call        TCustomMaskEdit.InputChar
 0007B488    mov         byte ptr [ebp-1],al
 0007B48B    cmp         byte ptr [ebp-1],0
>0007B48F    je          0007B533
 0007B495    mov         al,byte ptr [ebx]
 0007B497    mov         edx,dword ptr ds:[0B5BE8]
 0007B49D    and         eax,0FF
 0007B4A2    bt          dword ptr [edx],eax
>0007B4A5    jae         0007B4F3
 0007B4A7    lea         eax,[ebp-30]
 0007B4AA    mov         dl,byte ptr [ebx]
 0007B4AC    mov         byte ptr [eax+1],dl
 0007B4AF    mov         byte ptr [eax],1
 0007B4B2    lea         edx,[ebp-30]
 0007B4B5    lea         eax,[ebp-34]
 0007B4B8    call        @PStrCpy
 0007B4BD    lea         eax,[ebp-38]
 0007B4C0    mov         dl,byte ptr [ebp-24]
 0007B4C3    mov         byte ptr [eax+1],dl
 0007B4C6    mov         byte ptr [eax],1
 0007B4C9    lea         edx,[ebp-38]
 0007B4CC    lea         eax,[ebp-34]
 0007B4CF    mov         cl,2
 0007B4D1    call        @PStrNCat
 0007B4D6    lea         edx,[ebp-34]
 0007B4D9    lea         eax,[ebp-10]
 0007B4DC    call        @LStrFromString
 0007B4E1    mov         ecx,dword ptr [ebp-8]
 0007B4E4    add         ecx,2
 0007B4E7    mov         edx,dword ptr [ebp-8]
 0007B4EA    mov         eax,esi
 0007B4EC    call        TCustomMaskEdit.SetSel
>0007B4F1    jmp         0007B4FD
 0007B4F3    lea         eax,[ebp-10]
 0007B4F6    mov         dl,byte ptr [ebx]
 0007B4F8    call        @LStrFromChar
 0007B4FD    mov         eax,dword ptr [ebp-10]
 0007B500    call        @LStrToPChar
 0007B505    push        eax
 0007B506    push        0
 0007B508    push        0C2
 0007B50D    mov         eax,esi
 0007B50F    call        TWinControl.GetHandle
 0007B514    push        eax
 0007B515    call        user32.SendMessageA
 0007B51A    lea         ecx,[ebp-0C]
 0007B51D    lea         edx,[ebp-8]
 0007B520    mov         eax,esi
 0007B522    call        TCustomMaskEdit.GetSel
 0007B527    xor         ecx,ecx
 0007B529    mov         edx,dword ptr [ebp-8]
 0007B52C    mov         eax,esi
 0007B52E    call        TCustomMaskEdit.CursorInc
 0007B533    xor         eax,eax
 0007B535    pop         edx
 0007B536    pop         ecx
 0007B537    pop         ecx
 0007B538    mov         dword ptr fs:[eax],edx
 0007B53B    push        7B550
 0007B540    lea         eax,[ebp-10]
 0007B543    call        @LStrClr
 0007B548    ret
>0007B549    jmp         @HandleFinally
>0007B54E    jmp         0007B540
 0007B550    mov         al,byte ptr [ebp-1]
 0007B553    pop         esi
 0007B554    pop         ebx
 0007B555    mov         esp,ebp
 0007B557    pop         ebp
 0007B558    ret
*}
end;

//0007B55C
procedure TCustomMaskEdit.ArrowKeys(CharCode:Word; Shift:TShiftState);
begin
{*
 0007B55C    push        ebp
 0007B55D    mov         ebp,esp
 0007B55F    add         esp,0FFFFFFF0
 0007B562    push        ebx
 0007B563    push        esi
 0007B564    xor         ebx,ebx
 0007B566    mov         dword ptr [ebp-10],ebx
 0007B569    mov         byte ptr [ebp-1],cl
 0007B56C    mov         esi,edx
 0007B56E    mov         ebx,eax
 0007B570    xor         eax,eax
 0007B572    push        ebp
 0007B573    push        7B72E
 0007B578    push        dword ptr fs:[eax]
 0007B57B    mov         dword ptr fs:[eax],esp
 0007B57E    test        byte ptr [ebp-1],4
>0007B582    jne         0007B718
 0007B588    lea         ecx,[ebp-0C]
 0007B58B    lea         edx,[ebp-8]
 0007B58E    mov         eax,ebx
 0007B590    call        TCustomMaskEdit.GetSel
 0007B595    test        byte ptr [ebp-1],1
>0007B599    je          0007B62F
 0007B59F    cmp         si,27
>0007B5A3    jne         0007B5E4
 0007B5A5    inc         dword ptr [ebx+214]
 0007B5AB    mov         eax,dword ptr [ebp-8]
 0007B5AE    inc         eax
 0007B5AF    cmp         eax,dword ptr [ebp-0C]
>0007B5B2    jne         0007B5C7
 0007B5B4    mov         ecx,dword ptr [ebp-0C]
 0007B5B7    mov         edx,dword ptr [ebp-8]
 0007B5BA    mov         eax,ebx
 0007B5BC    call        TCustomMaskEdit.SetSel
 0007B5C1    inc         dword ptr [ebx+214]
 0007B5C7    mov         eax,dword ptr [ebx+20C]
 0007B5CD    cmp         eax,dword ptr [ebx+214]
>0007B5D3    jge         0007B718
 0007B5D9    mov         dword ptr [ebx+214],eax
>0007B5DF    jmp         0007B718
 0007B5E4    dec         dword ptr [ebx+214]
 0007B5EA    mov         eax,dword ptr [ebp-8]
 0007B5ED    add         eax,2
 0007B5F0    cmp         eax,dword ptr [ebp-0C]
>0007B5F3    jne         0007B615
 0007B5F5    mov         eax,dword ptr [ebx+214]
 0007B5FB    cmp         eax,dword ptr [ebp-8]
>0007B5FE    jle         0007B615
 0007B600    mov         eax,dword ptr [ebp-8]
 0007B603    inc         eax
 0007B604    mov         ecx,eax
 0007B606    mov         edx,eax
 0007B608    mov         eax,ebx
 0007B60A    call        TCustomMaskEdit.SetSel
 0007B60F    dec         dword ptr [ebx+214]
 0007B615    cmp         dword ptr [ebx+214],0
>0007B61C    jge         0007B718
 0007B622    xor         eax,eax
 0007B624    mov         dword ptr [ebx+214],eax
>0007B62A    jmp         0007B718
 0007B62F    mov         eax,dword ptr [ebp-0C]
 0007B632    sub         eax,dword ptr [ebp-8]
 0007B635    dec         eax
>0007B636    jle         0007B6AF
 0007B638    mov         eax,dword ptr [ebp-0C]
 0007B63B    sub         eax,dword ptr [ebp-8]
 0007B63E    cmp         eax,2
>0007B641    jne         0007B68F
 0007B643    lea         edx,[ebp-10]
 0007B646    mov         eax,ebx
 0007B648    call        TCustomMaskEdit.GetEditText
 0007B64D    mov         eax,dword ptr [ebp-10]
 0007B650    mov         edx,dword ptr [ebp-8]
 0007B653    mov         al,byte ptr [eax+edx]
 0007B656    mov         edx,dword ptr ds:[0B5BE8]
 0007B65C    and         eax,0FF
 0007B661    bt          dword ptr [edx],eax
>0007B664    jae         0007B68F
 0007B666    cmp         si,25
>0007B66A    jne         0007B67B
 0007B66C    mov         edx,dword ptr [ebp-8]
 0007B66F    mov         eax,ebx
 0007B671    call        TCustomMaskEdit.CursorDec
>0007B676    jmp         0007B718
 0007B67B    mov         ecx,2
 0007B680    mov         edx,dword ptr [ebp-8]
 0007B683    mov         eax,ebx
 0007B685    call        TCustomMaskEdit.CursorInc
>0007B68A    jmp         0007B718
 0007B68F    mov         eax,dword ptr [ebp-0C]
 0007B692    cmp         eax,dword ptr [ebx+214]
>0007B698    jne         0007B6A0
 0007B69A    dec         dword ptr [ebx+214]
 0007B6A0    mov         edx,dword ptr [ebx+214]
 0007B6A6    mov         eax,ebx
 0007B6A8    call        TCustomMaskEdit.SetCursor
>0007B6AD    jmp         0007B718
 0007B6AF    cmp         si,25
>0007B6B3    jne         0007B6C1
 0007B6B5    mov         edx,dword ptr [ebp-8]
 0007B6B8    mov         eax,ebx
 0007B6BA    call        TCustomMaskEdit.CursorDec
>0007B6BF    jmp         0007B718
 0007B6C1    mov         eax,dword ptr [ebp-0C]
 0007B6C4    cmp         eax,dword ptr [ebp-8]
>0007B6C7    jne         0007B6D5
 0007B6C9    mov         edx,dword ptr [ebp-8]
 0007B6CC    mov         eax,ebx
 0007B6CE    call        TCustomMaskEdit.SetCursor
>0007B6D3    jmp         0007B718
 0007B6D5    lea         edx,[ebp-10]
 0007B6D8    mov         eax,ebx
 0007B6DA    call        TCustomMaskEdit.GetEditText
 0007B6DF    mov         eax,dword ptr [ebp-10]
 0007B6E2    mov         edx,dword ptr [ebp-8]
 0007B6E5    mov         al,byte ptr [eax+edx]
 0007B6E8    mov         edx,dword ptr ds:[0B5BE8]
 0007B6EE    and         eax,0FF
 0007B6F3    bt          dword ptr [edx],eax
>0007B6F6    jae         0007B709
 0007B6F8    mov         ecx,2
 0007B6FD    mov         edx,dword ptr [ebp-8]
 0007B700    mov         eax,ebx
 0007B702    call        TCustomMaskEdit.CursorInc
>0007B707    jmp         0007B718
 0007B709    mov         ecx,1
 0007B70E    mov         edx,dword ptr [ebp-8]
 0007B711    mov         eax,ebx
 0007B713    call        TCustomMaskEdit.CursorInc
 0007B718    xor         eax,eax
 0007B71A    pop         edx
 0007B71B    pop         ecx
 0007B71C    pop         ecx
 0007B71D    mov         dword ptr fs:[eax],edx
 0007B720    push        7B735
 0007B725    lea         eax,[ebp-10]
 0007B728    call        @LStrClr
 0007B72D    ret
>0007B72E    jmp         @HandleFinally
>0007B733    jmp         0007B725
 0007B735    pop         esi
 0007B736    pop         ebx
 0007B737    mov         esp,ebp
 0007B739    pop         ebp
 0007B73A    ret
*}
end;

//0007B73C
procedure TCustomMaskEdit.CursorInc(CursorPos:Integer; Incr:Integer);
begin
{*
 0007B73C    push        ebx
 0007B73D    push        esi
 0007B73E    push        edi
 0007B73F    mov         edi,edx
 0007B741    mov         esi,eax
 0007B743    lea         ebx,[ecx+edi]
 0007B746    mov         edx,ebx
 0007B748    mov         eax,esi
 0007B74A    call        TCustomMaskEdit.GetNextEditChar
 0007B74F    mov         ebx,eax
 0007B751    mov         edx,ebx
 0007B753    mov         eax,dword ptr [esi+204]
 0007B759    call        IsLiteralChar
 0007B75E    test        al,al
>0007B760    je          0007B764
 0007B762    mov         ebx,edi
 0007B764    mov         edx,ebx
 0007B766    mov         eax,esi
 0007B768    call        TCustomMaskEdit.SetCursor
 0007B76D    pop         edi
 0007B76E    pop         esi
 0007B76F    pop         ebx
 0007B770    ret
*}
end;

//0007B774
procedure TCustomMaskEdit.CursorDec(CursorPos:Integer);
begin
{*
 0007B774    push        ebx
 0007B775    mov         ebx,eax
 0007B777    mov         eax,edx
 0007B779    dec         eax
 0007B77A    mov         edx,eax
 0007B77C    mov         eax,ebx
 0007B77E    call        TCustomMaskEdit.GetPriorEditChar
 0007B783    mov         edx,eax
 0007B785    mov         eax,ebx
 0007B787    call        TCustomMaskEdit.SetCursor
 0007B78C    pop         ebx
 0007B78D    ret
*}
end;

//0007B790
function TCustomMaskEdit.GetNextEditChar(Offset:Integer):Integer;
begin
{*
 0007B790    push        ebx
 0007B791    push        esi
 0007B792    mov         esi,eax
 0007B794    mov         ebx,edx
>0007B796    jmp         0007B799
 0007B798    inc         ebx
 0007B799    cmp         ebx,dword ptr [esi+20C]
>0007B79F    jge         0007B7B2
 0007B7A1    mov         edx,ebx
 0007B7A3    mov         eax,dword ptr [esi+204]
 0007B7A9    call        IsLiteralChar
 0007B7AE    test        al,al
>0007B7B0    jne         0007B798
 0007B7B2    mov         eax,ebx
 0007B7B4    pop         esi
 0007B7B5    pop         ebx
 0007B7B6    ret
*}
end;

//0007B7B8
function TCustomMaskEdit.GetPriorEditChar(Offset:Integer):Integer;
begin
{*
 0007B7B8    push        ebx
 0007B7B9    push        esi
 0007B7BA    mov         esi,eax
 0007B7BC    mov         ebx,edx
>0007B7BE    jmp         0007B7C1
 0007B7C0    dec         ebx
 0007B7C1    test        ebx,ebx
>0007B7C3    jl          0007B7D6
 0007B7C5    mov         edx,ebx
 0007B7C7    mov         eax,dword ptr [esi+204]
 0007B7CD    call        IsLiteralChar
 0007B7D2    test        al,al
>0007B7D4    jne         0007B7C0
 0007B7D6    test        ebx,ebx
>0007B7D8    jge         0007B7E5
 0007B7DA    mov         edx,ebx
 0007B7DC    mov         eax,esi
 0007B7DE    call        TCustomMaskEdit.GetNextEditChar
 0007B7E3    mov         ebx,eax
 0007B7E5    mov         eax,ebx
 0007B7E7    pop         esi
 0007B7E8    pop         ebx
 0007B7E9    ret
*}
end;

//0007B7EC
procedure TCustomMaskEdit.HomeEndKeys(CharCode:Word; Shift:TShiftState);
begin
{*
 0007B7EC    push        ebx
 0007B7ED    push        esi
 0007B7EE    add         esp,0FFFFFFF4
 0007B7F1    mov         byte ptr [esp],cl
 0007B7F4    mov         esi,edx
 0007B7F6    mov         ebx,eax
 0007B7F8    lea         ecx,[esp+8]
 0007B7FC    lea         edx,[esp+4]
 0007B800    mov         eax,ebx
 0007B802    call        TCustomMaskEdit.GetSel
 0007B807    cmp         si,24
>0007B80B    jne         0007B85C
 0007B80D    test        byte ptr [esp],1
>0007B811    je          0007B849
 0007B813    mov         eax,dword ptr [esp+4]
 0007B817    cmp         eax,dword ptr [ebx+214]
>0007B81D    je          0007B833
 0007B81F    mov         eax,dword ptr [esp+4]
 0007B823    inc         eax
 0007B824    cmp         eax,dword ptr [esp+8]
>0007B828    je          0007B833
 0007B82A    mov         eax,dword ptr [esp+4]
 0007B82E    inc         eax
 0007B82F    mov         dword ptr [esp+8],eax
 0007B833    mov         ecx,dword ptr [esp+8]
 0007B837    xor         edx,edx
 0007B839    mov         eax,ebx
 0007B83B    call        TCustomMaskEdit.SetSel
 0007B840    mov         eax,ebx
 0007B842    call        TCustomMaskEdit.CheckCursor
>0007B847    jmp         0007B852
 0007B849    xor         edx,edx
 0007B84B    mov         eax,ebx
 0007B84D    call        TCustomMaskEdit.SetCursor
 0007B852    xor         eax,eax
 0007B854    mov         dword ptr [ebx+214],eax
>0007B85A    jmp         0007B8B5
 0007B85C    test        byte ptr [esp],1
>0007B860    je          0007B89C
 0007B862    mov         eax,dword ptr [esp+8]
 0007B866    cmp         eax,dword ptr [ebx+214]
>0007B86C    je          0007B882
 0007B86E    mov         eax,dword ptr [esp+4]
 0007B872    inc         eax
 0007B873    cmp         eax,dword ptr [esp+8]
>0007B877    je          0007B882
 0007B879    mov         eax,dword ptr [esp+8]
 0007B87D    dec         eax
 0007B87E    mov         dword ptr [esp+4],eax
 0007B882    mov         ecx,dword ptr [ebx+20C]
 0007B888    mov         edx,dword ptr [esp+4]
 0007B88C    mov         eax,ebx
 0007B88E    call        TCustomMaskEdit.SetSel
 0007B893    mov         eax,ebx
 0007B895    call        TCustomMaskEdit.CheckCursor
>0007B89A    jmp         0007B8A9
 0007B89C    mov         edx,dword ptr [ebx+20C]
 0007B8A2    mov         eax,ebx
 0007B8A4    call        TCustomMaskEdit.SetCursor
 0007B8A9    mov         eax,dword ptr [ebx+20C]
 0007B8AF    mov         dword ptr [ebx+214],eax
 0007B8B5    add         esp,0C
 0007B8B8    pop         esi
 0007B8B9    pop         ebx
 0007B8BA    ret
*}
end;

//0007B8BC
procedure TCustomMaskEdit.DeleteKeys(CharCode:Word);
begin
{*
 0007B8BC    push        ebp
 0007B8BD    mov         ebp,esp
 0007B8BF    add         esp,0FFFFFFF4
 0007B8C2    push        ebx
 0007B8C3    push        esi
 0007B8C4    push        edi
 0007B8C5    xor         ecx,ecx
 0007B8C7    mov         dword ptr [ebp-0C],ecx
 0007B8CA    mov         esi,edx
 0007B8CC    mov         ebx,eax
 0007B8CE    lea         edi,[ebp-4]
 0007B8D1    xor         eax,eax
 0007B8D3    push        ebp
 0007B8D4    push        7B9C8
 0007B8D9    push        dword ptr fs:[eax]
 0007B8DC    mov         dword ptr fs:[eax],esp
 0007B8DF    cmp         byte ptr [ebx+1F2],0
>0007B8E6    jne         0007B9B2
 0007B8EC    lea         ecx,[ebp-8]
 0007B8EF    mov         edx,edi
 0007B8F1    mov         eax,ebx
 0007B8F3    call        TCustomMaskEdit.GetSel
 0007B8F8    mov         eax,dword ptr [ebp-8]
 0007B8FB    sub         eax,dword ptr [edi]
 0007B8FD    dec         eax
>0007B8FE    jg          0007B925
 0007B900    cmp         si,8
>0007B904    jne         0007B925
 0007B906    mov         esi,dword ptr [edi]
 0007B908    mov         edx,dword ptr [edi]
 0007B90A    mov         eax,ebx
 0007B90C    call        TCustomMaskEdit.CursorDec
 0007B911    lea         ecx,[ebp-8]
 0007B914    mov         edx,edi
 0007B916    mov         eax,ebx
 0007B918    call        TCustomMaskEdit.GetSel
 0007B91D    cmp         esi,dword ptr [edi]
>0007B91F    je          0007B9B2
 0007B925    mov         eax,dword ptr [ebp-8]
 0007B928    sub         eax,dword ptr [edi]
 0007B92A    dec         eax
>0007B92B    jl          0007B9B2
 0007B931    lea         edx,[ebp-0C]
 0007B934    mov         eax,ebx
 0007B936    call        TCustomMaskEdit.GetEditText
 0007B93B    mov         eax,dword ptr [ebp-8]
 0007B93E    sub         eax,dword ptr [edi]
 0007B940    push        eax
 0007B941    lea         edx,[ebp-0C]
 0007B944    mov         ecx,dword ptr [edi]
 0007B946    mov         eax,ebx
 0007B948    call        TCustomMaskEdit.DeleteSelection
 0007B94D    lea         eax,[ebp-0C]
 0007B950    push        eax
 0007B951    mov         ecx,dword ptr [ebp-8]
 0007B954    sub         ecx,dword ptr [edi]
 0007B956    mov         edx,dword ptr [edi]
 0007B958    inc         edx
 0007B959    mov         eax,dword ptr [ebp-0C]
 0007B95C    call        @LStrCopy
 0007B961    mov         eax,dword ptr [ebp-0C]
 0007B964    call        @LStrToPChar
 0007B969    push        eax
 0007B96A    push        0
 0007B96C    push        0C2
 0007B971    mov         eax,ebx
 0007B973    call        TWinControl.GetHandle
 0007B978    push        eax
 0007B979    call        user32.SendMessageA
 0007B97E    mov         eax,dword ptr [ebp-8]
 0007B981    sub         eax,dword ptr [edi]
 0007B983    dec         eax
>0007B984    je          0007B99C
 0007B986    mov         edx,dword ptr [edi]
 0007B988    mov         eax,ebx
 0007B98A    call        TCustomMaskEdit.GetNextEditChar
 0007B98F    mov         dword ptr [edi],eax
 0007B991    mov         edx,dword ptr [edi]
 0007B993    mov         eax,ebx
 0007B995    call        TCustomMaskEdit.SetCursor
>0007B99A    jmp         0007B9B2
 0007B99C    lea         ecx,[ebp-8]
 0007B99F    mov         edx,edi
 0007B9A1    mov         eax,ebx
 0007B9A3    call        TCustomMaskEdit.GetSel
 0007B9A8    mov         edx,dword ptr [edi]
 0007B9AA    dec         edx
 0007B9AB    mov         eax,ebx
 0007B9AD    call        TCustomMaskEdit.SetCursor
 0007B9B2    xor         eax,eax
 0007B9B4    pop         edx
 0007B9B5    pop         ecx
 0007B9B6    pop         ecx
 0007B9B7    mov         dword ptr fs:[eax],edx
 0007B9BA    push        7B9CF
 0007B9BF    lea         eax,[ebp-0C]
 0007B9C2    call        @LStrClr
 0007B9C7    ret
>0007B9C8    jmp         @HandleFinally
>0007B9CD    jmp         0007B9BF
 0007B9CF    pop         edi
 0007B9D0    pop         esi
 0007B9D1    pop         ebx
 0007B9D2    mov         esp,ebp
 0007B9D4    pop         ebp
 0007B9D5    ret
*}
end;

//0007B9D8
procedure TCustomMaskEdit.CMEnter(var Message:TCMEnter);
begin
{*
 0007B9D8    push        ebp
 0007B9D9    mov         ebp,esp
 0007B9DB    push        0
 0007B9DD    push        ebx
 0007B9DE    push        esi
 0007B9DF    mov         esi,edx
 0007B9E1    mov         ebx,eax
 0007B9E3    xor         eax,eax
 0007B9E5    push        ebp
 0007B9E6    push        7BA5B
 0007B9EB    push        dword ptr fs:[eax]
 0007B9EE    mov         dword ptr fs:[eax],esp
 0007B9F1    mov         eax,ebx
 0007B9F3    call        TCustomMaskEdit.GetMasked
 0007B9F8    test        al,al
>0007B9FA    je          0007BA3C
 0007B9FC    test        byte ptr [ebx+20],10
>0007BA00    jne         0007BA3C
 0007BA02    test        byte ptr [ebx+211],2
>0007BA09    jne         0007BA2C
 0007BA0B    lea         edx,[ebp-4]
 0007BA0E    mov         eax,ebx
 0007BA10    call        TCustomMaskEdit.GetEditText
 0007BA15    mov         edx,dword ptr [ebp-4]
 0007BA18    lea         eax,[ebx+21C]
 0007BA1E    call        @LStrAsg
 0007BA23    mov         edx,esi
 0007BA25    mov         eax,ebx
 0007BA27    call        TCustomEdit.CMEnter
 0007BA2C    and         byte ptr [ebx+211],0FD
 0007BA33    mov         eax,ebx
 0007BA35    call        TCustomMaskEdit.CheckCursor
>0007BA3A    jmp         0007BA45
 0007BA3C    mov         edx,esi
 0007BA3E    mov         eax,ebx
 0007BA40    call        TCustomEdit.CMEnter
 0007BA45    xor         eax,eax
 0007BA47    pop         edx
 0007BA48    pop         ecx
 0007BA49    pop         ecx
 0007BA4A    mov         dword ptr fs:[eax],edx
 0007BA4D    push        7BA62
 0007BA52    lea         eax,[ebp-4]
 0007BA55    call        @LStrClr
 0007BA5A    ret
>0007BA5B    jmp         @HandleFinally
>0007BA60    jmp         0007BA52
 0007BA62    pop         esi
 0007BA63    pop         ebx
 0007BA64    pop         ecx
 0007BA65    pop         ebp
 0007BA66    ret
*}
end;

//0007BA68
procedure TCustomMaskEdit.CMTextChanged(var Message:TMessage);
begin
{*
 0007BA68    push        ebp
 0007BA69    mov         ebp,esp
 0007BA6B    add         esp,0FFFFFFF4
 0007BA6E    push        ebx
 0007BA6F    xor         ecx,ecx
 0007BA71    mov         dword ptr [ebp-0C],ecx
 0007BA74    mov         ebx,eax
 0007BA76    xor         eax,eax
 0007BA78    push        ebp
 0007BA79    push        7BAE9
 0007BA7E    push        dword ptr fs:[eax]
 0007BA81    mov         dword ptr fs:[eax],esp
 0007BA84    mov         eax,ebx
 0007BA86    call        TCustomEdit.CMTextChanged
 0007BA8B    lea         edx,[ebp-0C]
 0007BA8E    mov         eax,ebx
 0007BA90    call        TCustomMaskEdit.GetEditText
 0007BA95    mov         edx,dword ptr [ebp-0C]
 0007BA98    lea         eax,[ebx+21C]
 0007BA9E    call        @LStrAsg
 0007BAA3    mov         eax,ebx
 0007BAA5    call        TWinControl.HandleAllocated
 0007BAAA    test        al,al
>0007BAAC    je          0007BAD3
 0007BAAE    lea         ecx,[ebp-8]
 0007BAB1    lea         edx,[ebp-4]
 0007BAB4    mov         eax,ebx
 0007BAB6    call        TCustomMaskEdit.GetSel
 0007BABB    mov         edx,dword ptr [ebp-4]
 0007BABE    mov         eax,ebx
 0007BAC0    call        TCustomMaskEdit.GetNextEditChar
 0007BAC5    cmp         eax,dword ptr [ebp-4]
>0007BAC8    je          0007BAD3
 0007BACA    mov         edx,eax
 0007BACC    mov         eax,ebx
 0007BACE    call        TCustomMaskEdit.SetCursor
 0007BAD3    xor         eax,eax
 0007BAD5    pop         edx
 0007BAD6    pop         ecx
 0007BAD7    pop         ecx
 0007BAD8    mov         dword ptr fs:[eax],edx
 0007BADB    push        7BAF0
 0007BAE0    lea         eax,[ebp-0C]
 0007BAE3    call        @LStrClr
 0007BAE8    ret
>0007BAE9    jmp         @HandleFinally
>0007BAEE    jmp         0007BAE0
 0007BAF0    pop         ebx
 0007BAF1    mov         esp,ebp
 0007BAF3    pop         ebp
 0007BAF4    ret
*}
end;

//0007BAF8
procedure TCustomMaskEdit.CMWantSpecialKey(var Message:TCMWantSpecialKey);
begin
{*
 0007BAF8    push        ebx
 0007BAF9    push        esi
 0007BAFA    mov         esi,edx
 0007BAFC    mov         ebx,eax
 0007BAFE    mov         edx,esi
 0007BB00    mov         eax,ebx
 0007BB02    mov         ecx,dword ptr [eax]
 0007BB04    call        dword ptr [ecx-10]
 0007BB07    cmp         word ptr [esi+4],1B
>0007BB0C    jne         0007BB2B
 0007BB0E    mov         eax,ebx
 0007BB10    call        TCustomMaskEdit.GetMasked
 0007BB15    test        al,al
>0007BB17    je          0007BB2B
 0007BB19    mov         eax,ebx
 0007BB1B    call        TCustomEdit.GetModified
 0007BB20    test        al,al
>0007BB22    je          0007BB2B
 0007BB24    mov         dword ptr [esi+0C],1
 0007BB2B    pop         esi
 0007BB2C    pop         ebx
 0007BB2D    ret
*}
end;

//0007BB30
procedure TCustomMaskEdit.CMExit(var Message:TCMExit);
begin
{*
 0007BB30    push        ebx
 0007BB31    push        esi
 0007BB32    mov         esi,edx
 0007BB34    mov         ebx,eax
 0007BB36    mov         eax,ebx
 0007BB38    call        TCustomMaskEdit.GetMasked
 0007BB3D    test        al,al
>0007BB3F    je          0007BB58
 0007BB41    test        byte ptr [ebx+20],10
>0007BB45    jne         0007BB58
 0007BB47    mov         eax,ebx
 0007BB49    mov         edx,dword ptr [eax]
 0007BB4B    call        dword ptr [edx+0E8]
 0007BB51    mov         eax,ebx
 0007BB53    call        TCustomMaskEdit.CheckCursor
 0007BB58    mov         edx,esi
 0007BB5A    mov         eax,ebx
 0007BB5C    call        TWinControl.CMExit
 0007BB61    pop         esi
 0007BB62    pop         ebx
 0007BB63    ret
*}
end;

//0007BB64
procedure TCustomMaskEdit.ValidateEdit;
begin
{*
 0007BB64    push        ebp
 0007BB65    mov         ebp,esp
 0007BB67    add         esp,0FFFFFFF8
 0007BB6A    push        ebx
 0007BB6B    push        esi
 0007BB6C    xor         edx,edx
 0007BB6E    mov         dword ptr [ebp-4],edx
 0007BB71    mov         esi,eax
 0007BB73    xor         eax,eax
 0007BB75    push        ebp
 0007BB76    push        7BBF6
 0007BB7B    push        dword ptr fs:[eax]
 0007BB7E    mov         dword ptr fs:[eax],esp
 0007BB81    lea         edx,[ebp-4]
 0007BB84    mov         eax,esi
 0007BB86    call        TCustomMaskEdit.GetEditText
 0007BB8B    mov         eax,esi
 0007BB8D    call        TCustomMaskEdit.GetMasked
 0007BB92    test        al,al
>0007BB94    je          0007BBE0
 0007BB96    mov         eax,esi
 0007BB98    call        TCustomEdit.GetModified
 0007BB9D    test        al,al
>0007BB9F    je          0007BBE0
 0007BBA1    lea         ecx,[ebp-8]
 0007BBA4    mov         edx,dword ptr [ebp-4]
 0007BBA7    mov         eax,esi
 0007BBA9    mov         ebx,dword ptr [eax]
 0007BBAB    call        dword ptr [ebx+0E0]
 0007BBB1    test        al,al
>0007BBB3    jne         0007BBE0
 0007BBB5    test        byte ptr [esi+20],10
>0007BBB9    jne         0007BBCC
 0007BBBB    or          byte ptr [esi+211],2
 0007BBC2    mov         eax,esi
 0007BBC4    mov         edx,dword ptr [eax]
 0007BBC6    call        dword ptr [edx+0B4]
 0007BBCC    mov         edx,dword ptr [ebp-8]
 0007BBCF    mov         eax,esi
 0007BBD1    call        TCustomMaskEdit.SetCursor
 0007BBD6    mov         eax,esi
 0007BBD8    mov         edx,dword ptr [eax]
 0007BBDA    call        dword ptr [edx+0E4]
 0007BBE0    xor         eax,eax
 0007BBE2    pop         edx
 0007BBE3    pop         ecx
 0007BBE4    pop         ecx
 0007BBE5    mov         dword ptr fs:[eax],edx
 0007BBE8    push        7BBFD
 0007BBED    lea         eax,[ebp-4]
 0007BBF0    call        @LStrClr
 0007BBF5    ret
>0007BBF6    jmp         @HandleFinally
>0007BBFB    jmp         0007BBED
 0007BBFD    pop         esi
 0007BBFE    pop         ebx
 0007BBFF    pop         ecx
 0007BC00    pop         ecx
 0007BC01    pop         ebp
 0007BC02    ret
*}
end;

//0007BC04
procedure TCustomMaskEdit.ValidateError;
begin
{*
 0007BC04    push        ebp
 0007BC05    mov         ebp,esp
 0007BC07    xor         ecx,ecx
 0007BC09    push        ecx
 0007BC0A    push        ecx
 0007BC0B    push        ecx
 0007BC0C    push        ecx
 0007BC0D    push        ecx
 0007BC0E    push        ebx
 0007BC0F    mov         ebx,eax
 0007BC11    xor         eax,eax
 0007BC13    push        ebp
 0007BC14    push        7BC98
 0007BC19    push        dword ptr fs:[eax]
 0007BC1C    mov         dword ptr fs:[eax],esp
 0007BC1F    push        0
 0007BC21    call        user32.MessageBeep
 0007BC26    lea         eax,[ebp-4]
 0007BC29    mov         edx,dword ptr [ebx+204]
 0007BC2F    call        @LStrLAsg
 0007BC34    lea         eax,[ebp-8]
 0007BC37    push        eax
 0007BC38    lea         edx,[ebp-0C]
 0007BC3B    mov         eax,[000B5B80];^SMaskEditErr:TResStringRec
 0007BC40    call        LoadResString
 0007BC45    mov         eax,dword ptr [ebp-0C]
 0007BC48    push        eax
 0007BC49    mov         eax,dword ptr [ebp-4]
 0007BC4C    mov         dword ptr [ebp-14],eax
 0007BC4F    mov         byte ptr [ebp-10],0B
 0007BC53    lea         edx,[ebp-14]
 0007BC56    xor         ecx,ecx
 0007BC58    pop         eax
 0007BC59    call        Format
 0007BC5E    mov         edx,dword ptr [ebp-8]
 0007BC61    lea         eax,[ebp-4]
 0007BC64    call        @LStrLAsg
 0007BC69    mov         ecx,dword ptr [ebp-4]
 0007BC6C    mov         dl,1
 0007BC6E    mov         eax,[00079DF8];EDBEditError
 0007BC73    call        Exception.Create
 0007BC78    call        @RaiseExcept
 0007BC7D    xor         eax,eax
 0007BC7F    pop         edx
 0007BC80    pop         ecx
 0007BC81    pop         ecx
 0007BC82    mov         dword ptr fs:[eax],edx
 0007BC85    push        7BC9F
 0007BC8A    lea         eax,[ebp-0C]
 0007BC8D    mov         edx,3
 0007BC92    call        @LStrArrayClr
 0007BC97    ret
>0007BC98    jmp         @HandleFinally
>0007BC9D    jmp         0007BC8A
 0007BC9F    pop         ebx
 0007BCA0    mov         esp,ebp
 0007BCA2    pop         ebp
 0007BCA3    ret
*}
end;

//0007BCA4
function TCustomMaskEdit.AddEditFormat(const Value:AnsiString; Active:Boolean):AnsiString;
begin
{*
 0007BCA4    push        ebp
 0007BCA5    mov         ebp,esp
 0007BCA7    push        ecx
 0007BCA8    push        ebx
 0007BCA9    push        esi
 0007BCAA    push        edi
 0007BCAB    mov         byte ptr [ebp-1],cl
 0007BCAE    mov         esi,edx
 0007BCB0    mov         ebx,eax
 0007BCB2    mov         edi,dword ptr [ebp+8]
 0007BCB5    cmp         byte ptr [ebp-1],0
>0007BCB9    jne         0007BCCD
 0007BCBB    push        edi
 0007BCBC    mov         cl,20
 0007BCBE    mov         edx,esi
 0007BCC0    mov         eax,dword ptr [ebx+204]
 0007BCC6    call        MaskDoFormatText
>0007BCCB    jmp         0007BCE1
 0007BCCD    push        edi
 0007BCCE    mov         cl,byte ptr [ebx+208]
 0007BCD4    mov         edx,esi
 0007BCD6    mov         eax,dword ptr [ebx+204]
 0007BCDC    call        MaskDoFormatText
 0007BCE1    pop         edi
 0007BCE2    pop         esi
 0007BCE3    pop         ebx
 0007BCE4    pop         ecx
 0007BCE5    pop         ebp
 0007BCE6    ret         4
*}
end;

//0007BCEC
function TCustomMaskEdit.RemoveEditFormat(const Value:AnsiString):AnsiString;
begin
{*
 0007BCEC    push        ebp
 0007BCED    mov         ebp,esp
 0007BCEF    add         esp,0FFFFFFE8
 0007BCF2    push        ebx
 0007BCF3    push        esi
 0007BCF4    push        edi
 0007BCF5    xor         ebx,ebx
 0007BCF7    mov         dword ptr [ebp-14],ebx
 0007BCFA    mov         dword ptr [ebp-18],ebx
 0007BCFD    mov         esi,ecx
 0007BCFF    mov         ebx,edx
 0007BD01    mov         dword ptr [ebp-4],eax
 0007BD04    xor         eax,eax
 0007BD06    push        ebp
 0007BD07    push        7BEB2
 0007BD0C    push        dword ptr fs:[eax]
 0007BD0F    mov         dword ptr fs:[eax],esp
 0007BD12    mov         dword ptr [ebp-0C],1
 0007BD19    mov         eax,esi
 0007BD1B    mov         edx,ebx
 0007BD1D    call        @LStrLAsg
 0007BD22    mov         eax,dword ptr [ebp-4]
 0007BD25    mov         eax,dword ptr [eax+204]
 0007BD2B    call        @LStrLen
 0007BD30    mov         ebx,eax
 0007BD32    test        ebx,ebx
>0007BD34    jle         0007BDA4
 0007BD36    mov         edi,1
 0007BD3B    mov         eax,dword ptr [ebp-4]
 0007BD3E    mov         eax,dword ptr [eax+204]
 0007BD44    mov         edx,edi
 0007BD46    call        MaskGetCharType
 0007BD4B    mov         byte ptr [ebp-0D],al
 0007BD4E    mov         al,byte ptr [ebp-0D]
 0007BD51    dec         eax
 0007BD52    sub         al,2
>0007BD54    jae         0007BD94
 0007BD56    lea         eax,[ebp-14]
 0007BD59    push        eax
 0007BD5A    mov         eax,dword ptr [esi]
 0007BD5C    call        @LStrLen
 0007BD61    mov         ecx,eax
 0007BD63    sub         ecx,dword ptr [ebp-0C]
 0007BD66    mov         edx,dword ptr [ebp-0C]
 0007BD69    inc         edx
 0007BD6A    mov         eax,dword ptr [esi]
 0007BD6C    call        @LStrCopy
 0007BD71    mov         eax,dword ptr [ebp-14]
 0007BD74    push        eax
 0007BD75    lea         eax,[ebp-18]
 0007BD78    push        eax
 0007BD79    mov         ecx,dword ptr [ebp-0C]
 0007BD7C    dec         ecx
 0007BD7D    mov         eax,dword ptr [esi]
 0007BD7F    mov         edx,1
 0007BD84    call        @LStrCopy
 0007BD89    mov         edx,dword ptr [ebp-18]
 0007BD8C    mov         eax,esi
 0007BD8E    pop         ecx
 0007BD8F    call        @LStrCat3
 0007BD94    mov         al,byte ptr [ebp-0D]
 0007BD97    add         al,0FC
 0007BD99    sub         al,2
>0007BD9B    jae         0007BDA0
 0007BD9D    inc         dword ptr [ebp-0C]
 0007BDA0    inc         edi
 0007BDA1    dec         ebx
>0007BDA2    jne         0007BD3B
 0007BDA4    mov         eax,dword ptr [ebp-4]
 0007BDA7    mov         eax,dword ptr [eax+204]
 0007BDAD    mov         edx,1
 0007BDB2    call        MaskGetCurrentDirectives
 0007BDB7    mov         ebx,eax
 0007BDB9    test        bl,1
>0007BDBC    je          0007BE0F
 0007BDBE    mov         dword ptr [ebp-0C],1
 0007BDC5    mov         eax,dword ptr [esi]
 0007BDC7    call        @LStrLen
 0007BDCC    mov         ebx,eax
 0007BDCE    test        ebx,ebx
>0007BDD0    jle         0007BDEF
 0007BDD2    mov         edi,1
 0007BDD7    mov         eax,dword ptr [esi]
 0007BDD9    mov         al,byte ptr [eax+edi-1]
 0007BDDD    mov         edx,dword ptr [ebp-4]
 0007BDE0    cmp         al,byte ptr [edx+208]
>0007BDE6    jne         0007BDEF
 0007BDE8    inc         dword ptr [ebp-0C]
 0007BDEB    inc         edi
 0007BDEC    dec         ebx
>0007BDED    jne         0007BDD7
 0007BDEF    cmp         dword ptr [ebp-0C],1
>0007BDF3    je          0007BE4F
 0007BDF5    push        esi
 0007BDF6    mov         eax,dword ptr [esi]
 0007BDF8    call        @LStrLen
 0007BDFD    mov         ecx,eax
 0007BDFF    sub         ecx,dword ptr [ebp-0C]
 0007BE02    inc         ecx
 0007BE03    mov         eax,dword ptr [esi]
 0007BE05    mov         edx,dword ptr [ebp-0C]
 0007BE08    call        @LStrCopy
>0007BE0D    jmp         0007BE4F
 0007BE0F    mov         eax,dword ptr [esi]
 0007BE11    call        @LStrLen
 0007BE16    mov         dword ptr [ebp-8],eax
 0007BE19    mov         ebx,dword ptr [ebp-8]
 0007BE1C    test        ebx,ebx
>0007BE1E    jle         0007BE4F
 0007BE20    mov         edi,1
 0007BE25    mov         eax,dword ptr [ebp-8]
 0007BE28    sub         eax,edi
 0007BE2A    mov         edx,dword ptr [esi]
 0007BE2C    mov         al,byte ptr [edx+eax]
 0007BE2F    mov         edx,dword ptr [ebp-4]
 0007BE32    cmp         al,byte ptr [edx+208]
>0007BE38    jne         0007BE4F
 0007BE3A    mov         eax,dword ptr [esi]
 0007BE3C    call        @LStrLen
 0007BE41    mov         edx,eax
 0007BE43    dec         edx
 0007BE44    mov         eax,esi
 0007BE46    call        @LStrSetLength
 0007BE4B    inc         edi
 0007BE4C    dec         ebx
>0007BE4D    jne         0007BE25
 0007BE4F    mov         eax,dword ptr [ebp-4]
 0007BE52    cmp         byte ptr [eax+208],20
>0007BE59    je          0007BE97
 0007BE5B    mov         eax,dword ptr [esi]
 0007BE5D    call        @LStrLen
 0007BE62    mov         dword ptr [ebp-8],eax
 0007BE65    mov         ebx,dword ptr [ebp-8]
 0007BE68    test        ebx,ebx
>0007BE6A    jle         0007BE97
 0007BE6C    mov         edi,1
 0007BE71    mov         eax,dword ptr [esi]
 0007BE73    mov         al,byte ptr [eax+edi-1]
 0007BE77    mov         edx,dword ptr [ebp-4]
 0007BE7A    cmp         al,byte ptr [edx+208]
>0007BE80    jne         0007BE8E
 0007BE82    mov         eax,esi
 0007BE84    call        UniqueString
 0007BE89    mov         byte ptr [eax+edi-1],20
 0007BE8E    cmp         edi,dword ptr [ebp-8]
>0007BE91    jg          0007BE97
 0007BE93    inc         edi
 0007BE94    dec         ebx
>0007BE95    jne         0007BE71
 0007BE97    xor         eax,eax
 0007BE99    pop         edx
 0007BE9A    pop         ecx
 0007BE9B    pop         ecx
 0007BE9C    mov         dword ptr fs:[eax],edx
 0007BE9F    push        7BEB9
 0007BEA4    lea         eax,[ebp-18]
 0007BEA7    mov         edx,2
 0007BEAC    call        @LStrArrayClr
 0007BEB1    ret
>0007BEB2    jmp         @HandleFinally
>0007BEB7    jmp         0007BEA4
 0007BEB9    pop         edi
 0007BEBA    pop         esi
 0007BEBB    pop         ebx
 0007BEBC    mov         esp,ebp
 0007BEBE    pop         ebp
 0007BEBF    ret
*}
end;

//0007BEC0
function TCustomMaskEdit.InputChar(var NewChar:Char; Offset:Integer):Boolean;
begin
{*
 0007BEC0    push        ebx
 0007BEC1    push        esi
 0007BEC2    push        edi
 0007BEC3    push        ebp
 0007BEC4    push        ecx
 0007BEC5    mov         edi,ecx
 0007BEC7    mov         ebp,edx
 0007BEC9    mov         esi,eax
 0007BECB    mov         bl,1
 0007BECD    cmp         dword ptr [esi+204],0
>0007BED4    je          0007BF49
 0007BED6    xor         ebx,ebx
 0007BED8    mov         edx,edi
 0007BEDA    mov         eax,dword ptr [esi+204]
 0007BEE0    call        OffsetToMaskOffset
 0007BEE5    mov         edi,eax
 0007BEE7    test        edi,edi
>0007BEE9    jl          0007BF49
 0007BEEB    mov         edx,edi
 0007BEED    mov         eax,dword ptr [esi+204]
 0007BEF3    call        MaskGetCharType
 0007BEF8    mov         byte ptr [esp],al
 0007BEFB    mov         al,byte ptr [ebp]
 0007BEFE    mov         byte ptr [esp+1],al
 0007BF02    mov         edx,ebp
 0007BF04    mov         ecx,edi
 0007BF06    mov         eax,esi
 0007BF08    call        TCustomMaskEdit.DoInputChar
 0007BF0D    mov         ebx,eax
 0007BF0F    test        bl,bl
>0007BF11    jne         0007BF49
 0007BF13    mov         al,byte ptr [esp]
 0007BF16    add         al,0FC
 0007BF18    sub         al,2
>0007BF1A    jae         0007BF49
 0007BF1C    mov         cl,byte ptr [esp+1]
 0007BF20    mov         edx,edi
 0007BF22    mov         eax,esi
 0007BF24    call        TCustomMaskEdit.FindLiteralChar
 0007BF29    mov         edi,eax
 0007BF2B    test        edi,edi
>0007BF2D    jle         0007BF49
 0007BF2F    mov         edx,edi
 0007BF31    mov         eax,dword ptr [esi+204]
 0007BF37    call        MaskOffsetToOffset
 0007BF3C    mov         edi,eax
 0007BF3E    mov         edx,edi
 0007BF40    mov         eax,esi
 0007BF42    call        TCustomMaskEdit.SetCursor
>0007BF47    jmp         0007BF54
 0007BF49    test        bl,bl
>0007BF4B    jne         0007BF54
 0007BF4D    push        0
 0007BF4F    call        user32.MessageBeep
 0007BF54    mov         eax,ebx
 0007BF56    pop         edx
 0007BF57    pop         ebp
 0007BF58    pop         edi
 0007BF59    pop         esi
 0007BF5A    pop         ebx
 0007BF5B    ret
*}
end;

//0007BF5C
function IsKatakana(const Chr:Byte):Boolean;
begin
{*
 0007BF5C    mov         edx,dword ptr ds:[0B5C08];SysLocale:TSysLocale
 0007BF62    cmp         word ptr [edx+4],11
>0007BF67    jne         0007BF6F
 0007BF69    add         al,5F
 0007BF6B    sub         al,3F
>0007BF6D    jb          0007BF72
 0007BF6F    xor         eax,eax
 0007BF71    ret
 0007BF72    mov         al,1
 0007BF74    ret
*}
end;

//0007BF78
function TestChar(NewChar:Char):Boolean;
begin
{*
 0007BF78    push        ebp
 0007BF79    mov         ebp,esp
 0007BF7B    push        0
 0007BF7D    push        ebx
 0007BF7E    push        esi
 0007BF7F    mov         esi,dword ptr [ebp+8]
 0007BF82    add         esi,0FFFFFFFC
 0007BF85    xor         eax,eax
 0007BF87    push        ebp
 0007BF88    push        7C03F
 0007BF8D    push        dword ptr fs:[eax]
 0007BF90    mov         dword ptr fs:[eax],esp
 0007BF93    mov         eax,dword ptr [ebp+8]
 0007BF96    mov         edx,dword ptr [eax-8]
 0007BF99    mov         eax,dword ptr [esi]
 0007BF9B    mov         eax,dword ptr [eax+204]
 0007BFA1    call        MaskOffsetToOffset
 0007BFA6    mov         ebx,eax
 0007BFA8    mov         eax,dword ptr [esi]
 0007BFAA    mov         eax,dword ptr [eax+204]
 0007BFB0    call        @LStrLen
 0007BFB5    mov         edx,dword ptr [ebp+8]
 0007BFB8    cmp         eax,dword ptr [edx-8]
>0007BFBB    jle         0007C025
 0007BFBD    mov         eax,dword ptr [ebp+8]
 0007BFC0    mov         eax,dword ptr [eax-8]
 0007BFC3    mov         edx,dword ptr [esi]
 0007BFC5    mov         edx,dword ptr [edx+204]
 0007BFCB    mov         al,byte ptr [edx+eax-1]
 0007BFCF    call        UpCase
 0007BFD4    push        eax
 0007BFD5    mov         eax,dword ptr [ebp+8]
 0007BFD8    mov         eax,dword ptr [eax-8]
 0007BFDB    mov         edx,dword ptr [esi]
 0007BFDD    mov         edx,dword ptr [edx+204]
 0007BFE3    mov         al,byte ptr [edx+eax]
 0007BFE6    call        UpCase
 0007BFEB    pop         edx
 0007BFEC    cmp         dl,al
>0007BFEE    jne         0007C025
 0007BFF0    lea         edx,[ebp-4]
 0007BFF3    mov         eax,dword ptr [esi]
 0007BFF5    call        TCustomMaskEdit.GetEditText
 0007BFFA    mov         eax,dword ptr [ebp-4]
 0007BFFD    mov         edx,ebx
 0007BFFF    call        ByteType
 0007C004    cmp         al,2
>0007C006    je          0007C025
 0007C008    lea         edx,[ebp-4]
 0007C00B    mov         eax,dword ptr [esi]
 0007C00D    call        TCustomMaskEdit.GetEditText
 0007C012    mov         eax,dword ptr [ebp-4]
 0007C015    lea         edx,[ebx+1]
 0007C018    call        ByteType
 0007C01D    cmp         al,1
>0007C01F    je          0007C025
 0007C021    xor         eax,eax
>0007C023    jmp         0007C027
 0007C025    mov         al,1
 0007C027    mov         ebx,eax
 0007C029    xor         eax,eax
 0007C02B    pop         edx
 0007C02C    pop         ecx
 0007C02D    pop         ecx
 0007C02E    mov         dword ptr fs:[eax],edx
 0007C031    push        7C046
 0007C036    lea         eax,[ebp-4]
 0007C039    call        @LStrClr
 0007C03E    ret
>0007C03F    jmp         @HandleFinally
>0007C044    jmp         0007C036
 0007C046    mov         eax,ebx
 0007C048    pop         esi
 0007C049    pop         ebx
 0007C04A    pop         ecx
 0007C04B    pop         ebp
 0007C04C    ret
*}
end;

//0007C050
function TCustomMaskEdit.DoInputChar(var NewChar:Char; MaskOffset:Integer):Boolean;
begin
{*
 0007C050    push        ebp
 0007C051    mov         ebp,esp
 0007C053    add         esp,0FFFFFFEC
 0007C056    push        ebx
 0007C057    xor         ebx,ebx
 0007C059    mov         dword ptr [ebp-14],ebx
 0007C05C    mov         dword ptr [ebp-10],ebx
 0007C05F    mov         dword ptr [ebp-8],ecx
 0007C062    mov         ebx,edx
 0007C064    mov         dword ptr [ebp-4],eax
 0007C067    xor         eax,eax
 0007C069    push        ebp
 0007C06A    push        7C2FD
 0007C06F    push        dword ptr fs:[eax]
 0007C072    mov         dword ptr fs:[eax],esp
 0007C075    mov         byte ptr [ebp-9],1
 0007C079    mov         eax,dword ptr [ebp-4]
 0007C07C    mov         eax,dword ptr [eax+204]
 0007C082    mov         edx,dword ptr [ebp-8]
 0007C085    call        MaskGetCharType
 0007C08A    dec         eax
 0007C08B    sub         al,2
>0007C08D    jae         0007C0AB
 0007C08F    mov         eax,dword ptr [ebp-4]
 0007C092    mov         eax,dword ptr [eax+204]
 0007C098    mov         edx,dword ptr [ebp-8]
 0007C09B    mov         al,byte ptr [eax+edx-1]
 0007C09F    call        MaskIntlLiteralToChar
 0007C0A4    mov         byte ptr [ebx],al
>0007C0A6    jmp         0007C2E2
 0007C0AB    mov         eax,dword ptr [ebp-4]
 0007C0AE    mov         eax,dword ptr [eax+204]
 0007C0B4    mov         edx,dword ptr [ebp-8]
 0007C0B7    call        MaskGetCurrentDirectives
 0007C0BC    mov         byte ptr [ebp-0A],al
 0007C0BF    mov         eax,dword ptr [ebp-4]
 0007C0C2    mov         eax,dword ptr [eax+204]
 0007C0C8    mov         edx,dword ptr [ebp-8]
 0007C0CB    movzx       eax,byte ptr [eax+edx-1]
 0007C0D0    cmp         eax,43
>0007C0D3    jg          0007C0F8
>0007C0D5    je          0007C166
 0007C0DB    sub         eax,23
>0007C0DE    je          0007C134
 0007C0E0    sub         eax,0D
>0007C0E3    je          0007C11D
 0007C0E5    sub         eax,9
>0007C0E8    je          0007C11D
 0007C0EA    sub         eax,8
>0007C0ED    je          0007C1FD
>0007C0F3    jmp         0007C2E2
 0007C0F8    sub         eax,4C
>0007C0FB    je          0007C1FD
 0007C101    sub         eax,15
>0007C104    je          0007C1FD
 0007C10A    sub         eax,2
>0007C10D    je          0007C166
 0007C10F    sub         eax,9
>0007C112    je          0007C1FD
>0007C118    jmp         0007C2E2
 0007C11D    cmp         byte ptr [ebx],30
>0007C120    jb          0007C12B
 0007C122    cmp         byte ptr [ebx],39
>0007C125    jbe         0007C2E2
 0007C12B    mov         byte ptr [ebp-9],0
>0007C12F    jmp         0007C2E2
 0007C134    cmp         byte ptr [ebx],30
>0007C137    jb          0007C142
 0007C139    cmp         byte ptr [ebx],39
>0007C13C    jbe         0007C2E2
 0007C142    cmp         byte ptr [ebx],20
>0007C145    je          0007C2E2
 0007C14B    cmp         byte ptr [ebx],2B
>0007C14E    je          0007C2E2
 0007C154    cmp         byte ptr [ebx],2D
>0007C157    je          0007C2E2
 0007C15D    mov         byte ptr [ebp-9],0
>0007C161    jmp         0007C2E2
 0007C166    mov         al,byte ptr [ebx]
 0007C168    mov         edx,dword ptr ds:[0B5BE8]
 0007C16E    and         eax,0FF
 0007C173    bt          dword ptr [edx],eax
>0007C176    jae         0007C18E
 0007C178    push        ebp
 0007C179    mov         al,byte ptr [ebx]
 0007C17B    call        TestChar
 0007C180    pop         ecx
 0007C181    test        al,al
>0007C183    je          0007C18E
 0007C185    mov         byte ptr [ebp-9],0
>0007C189    jmp         0007C2E2
 0007C18E    mov         al,byte ptr [ebx]
 0007C190    push        eax
 0007C191    call        user32.IsCharAlphaA
 0007C196    test        eax,eax
>0007C198    je          0007C2E2
 0007C19E    lea         eax,[ebp-10]
 0007C1A1    mov         edx,7C314;' '
 0007C1A6    call        @LStrLAsg
 0007C1AB    lea         eax,[ebp-10]
 0007C1AE    call        UniqueString
 0007C1B3    mov         dl,byte ptr [ebx]
 0007C1B5    mov         byte ptr [eax],dl
 0007C1B7    test        byte ptr [ebp-0A],2
>0007C1BB    je          0007C1D5
 0007C1BD    lea         edx,[ebp-14]
 0007C1C0    mov         eax,dword ptr [ebp-10]
 0007C1C3    call        AnsiUpperCase
 0007C1C8    mov         edx,dword ptr [ebp-14]
 0007C1CB    lea         eax,[ebp-10]
 0007C1CE    call        @LStrLAsg
>0007C1D3    jmp         0007C1F1
 0007C1D5    test        byte ptr [ebp-0A],4
>0007C1D9    je          0007C1F1
 0007C1DB    lea         edx,[ebp-14]
 0007C1DE    mov         eax,dword ptr [ebp-10]
 0007C1E1    call        AnsiLowerCase
 0007C1E6    mov         edx,dword ptr [ebp-14]
 0007C1E9    lea         eax,[ebp-10]
 0007C1EC    call        @LStrLAsg
 0007C1F1    mov         eax,dword ptr [ebp-10]
 0007C1F4    mov         al,byte ptr [eax]
 0007C1F6    mov         byte ptr [ebx],al
>0007C1F8    jmp         0007C2E2
 0007C1FD    mov         al,byte ptr [ebx]
 0007C1FF    mov         edx,dword ptr ds:[0B5BE8]
 0007C205    and         eax,0FF
 0007C20A    bt          dword ptr [edx],eax
>0007C20D    jae         0007C229
 0007C20F    push        ebp
 0007C210    mov         al,byte ptr [ebx]
 0007C212    call        TestChar
 0007C217    pop         ecx
 0007C218    test        al,al
>0007C21A    je          0007C2E2
 0007C220    mov         byte ptr [ebp-9],0
>0007C224    jmp         0007C2E2
 0007C229    lea         eax,[ebp-10]
 0007C22C    mov         edx,7C314;' '
 0007C231    call        @LStrLAsg
 0007C236    lea         eax,[ebp-10]
 0007C239    call        UniqueString
 0007C23E    mov         dl,byte ptr [ebx]
 0007C240    mov         byte ptr [eax],dl
 0007C242    mov         al,byte ptr [ebx]
 0007C244    call        IsKatakana
 0007C249    test        al,al
>0007C24B    je          0007C259
 0007C24D    mov         eax,dword ptr [ebp-10]
 0007C250    mov         al,byte ptr [eax]
 0007C252    mov         byte ptr [ebx],al
>0007C254    jmp         0007C2E2
 0007C259    mov         al,byte ptr [ebx]
 0007C25B    push        eax
 0007C25C    call        user32.IsCharAlphaA
 0007C261    test        eax,eax
>0007C263    jne         0007C2A1
 0007C265    mov         byte ptr [ebp-9],0
 0007C269    mov         eax,dword ptr [ebp-4]
 0007C26C    mov         eax,dword ptr [eax+204]
 0007C272    mov         edx,dword ptr [ebp-8]
 0007C275    cmp         byte ptr [eax+edx-1],41
>0007C27A    je          0007C28F
 0007C27C    mov         eax,dword ptr [ebp-4]
 0007C27F    mov         eax,dword ptr [eax+204]
 0007C285    mov         edx,dword ptr [ebp-8]
 0007C288    cmp         byte ptr [eax+edx-1],61
>0007C28D    jne         0007C2DB
 0007C28F    mov         al,byte ptr [ebx]
 0007C291    push        eax
 0007C292    call        user32.IsCharAlphaNumericA
 0007C297    test        eax,eax
>0007C299    je          0007C2DB
 0007C29B    mov         byte ptr [ebp-9],1
>0007C29F    jmp         0007C2DB
 0007C2A1    test        byte ptr [ebp-0A],2
>0007C2A5    je          0007C2BF
 0007C2A7    lea         edx,[ebp-14]
 0007C2AA    mov         eax,dword ptr [ebp-10]
 0007C2AD    call        AnsiUpperCase
 0007C2B2    mov         edx,dword ptr [ebp-14]
 0007C2B5    lea         eax,[ebp-10]
 0007C2B8    call        @LStrLAsg
>0007C2BD    jmp         0007C2DB
 0007C2BF    test        byte ptr [ebp-0A],4
>0007C2C3    je          0007C2DB
 0007C2C5    lea         edx,[ebp-14]
 0007C2C8    mov         eax,dword ptr [ebp-10]
 0007C2CB    call        AnsiLowerCase
 0007C2D0    mov         edx,dword ptr [ebp-14]
 0007C2D3    lea         eax,[ebp-10]
 0007C2D6    call        @LStrLAsg
 0007C2DB    mov         eax,dword ptr [ebp-10]
 0007C2DE    mov         al,byte ptr [eax]
 0007C2E0    mov         byte ptr [ebx],al
 0007C2E2    xor         eax,eax
 0007C2E4    pop         edx
 0007C2E5    pop         ecx
 0007C2E6    pop         ecx
 0007C2E7    mov         dword ptr fs:[eax],edx
 0007C2EA    push        7C304
 0007C2EF    lea         eax,[ebp-14]
 0007C2F2    mov         edx,2
 0007C2F7    call        @LStrArrayClr
 0007C2FC    ret
>0007C2FD    jmp         @HandleFinally
>0007C302    jmp         0007C2EF
 0007C304    mov         al,byte ptr [ebp-9]
 0007C307    pop         ebx
 0007C308    mov         esp,ebp
 0007C30A    pop         ebp
 0007C30B    ret
*}
end;

//0007C318
function TCustomMaskEdit.Validate(const Value:AnsiString; var Pos:Integer):Boolean;
begin
{*
 0007C318    push        ebx
 0007C319    push        esi
 0007C31A    push        edi
 0007C31B    push        ebp
 0007C31C    add         esp,0FFFFFFF0
 0007C31F    mov         dword ptr [esp+4],ecx
 0007C323    mov         dword ptr [esp],edx
 0007C326    mov         ebp,eax
 0007C328    mov         byte ptr [esp+8],1
 0007C32D    mov         dword ptr [esp+0C],1
 0007C335    mov         eax,dword ptr [ebp+204]
 0007C33B    call        @LStrLen
 0007C340    mov         esi,eax
 0007C342    test        esi,esi
>0007C344    jle         0007C3BE
 0007C346    mov         edi,1
 0007C34B    mov         eax,dword ptr [ebp+204]
 0007C351    mov         edx,edi
 0007C353    call        MaskGetCharType
 0007C358    mov         ebx,eax
 0007C35A    mov         eax,ebx
 0007C35C    dec         eax
 0007C35D    sub         al,2
>0007C35F    jb          0007C365
 0007C361    sub         al,2
>0007C363    jne         0007C36B
 0007C365    inc         dword ptr [esp+0C]
>0007C369    jmp         0007C3BA
 0007C36B    cmp         bl,4
>0007C36E    jne         0007C3BA
 0007C370    cmp         dword ptr [esp],0
>0007C374    je          0007C3BA
 0007C376    mov         eax,dword ptr [esp]
 0007C379    mov         edx,dword ptr [esp+0C]
 0007C37D    mov         al,byte ptr [eax+edx-1]
 0007C381    cmp         al,byte ptr [ebp+208]
>0007C387    je          0007C3A4
 0007C389    mov         eax,dword ptr [esp]
 0007C38C    mov         edx,dword ptr [esp+0C]
 0007C390    cmp         byte ptr [eax+edx-1],20
>0007C395    jne         0007C3B6
 0007C397    mov         eax,dword ptr [ebp+204]
 0007C39D    cmp         byte ptr [eax+edi-1],43
>0007C3A2    je          0007C3B6
 0007C3A4    mov         byte ptr [esp+8],0
 0007C3A9    mov         eax,dword ptr [esp+0C]
 0007C3AD    dec         eax
 0007C3AE    mov         edx,dword ptr [esp+4]
 0007C3B2    mov         dword ptr [edx],eax
>0007C3B4    jmp         0007C3BE
 0007C3B6    inc         dword ptr [esp+0C]
 0007C3BA    inc         edi
 0007C3BB    dec         esi
>0007C3BC    jne         0007C34B
 0007C3BE    mov         al,byte ptr [esp+8]
 0007C3C2    add         esp,10
 0007C3C5    pop         ebp
 0007C3C6    pop         edi
 0007C3C7    pop         esi
 0007C3C8    pop         ebx
 0007C3C9    ret
*}
end;

//0007C3CC
function TCustomMaskEdit.DeleteSelection(var Value:AnsiString; Offset:Integer; Len:Integer):Boolean;
begin
{*
 0007C3CC    push        ebp
 0007C3CD    mov         ebp,esp
 0007C3CF    add         esp,0FFFFFFEC
 0007C3D2    push        ebx
 0007C3D3    push        esi
 0007C3D4    push        edi
 0007C3D5    mov         dword ptr [ebp-8],ecx
 0007C3D8    mov         dword ptr [ebp-4],edx
 0007C3DB    mov         edi,eax
 0007C3DD    mov         eax,dword ptr [ebp+8]
 0007C3E0    mov         byte ptr [ebp-9],1
 0007C3E4    test        eax,eax
>0007C3E6    je          0007C456
 0007C3E8    mov         ebx,dword ptr [ebp-8]
 0007C3EB    inc         ebx
 0007C3EC    add         eax,ebx
 0007C3EE    mov         dword ptr [ebp-10],eax
 0007C3F1    mov         eax,dword ptr [edi+204]
 0007C3F7    mov         edx,dword ptr [ebp-8]
 0007C3FA    call        OffsetToMaskOffset
 0007C3FF    mov         esi,eax
 0007C401    test        esi,esi
>0007C403    jl          0007C456
 0007C405    mov         eax,dword ptr [edi+204]
 0007C40B    call        @LStrLen
 0007C410    sub         eax,esi
>0007C412    jl          0007C456
 0007C414    inc         eax
 0007C415    xchg        eax,esi
 0007C416    mov         dword ptr [ebp-14],eax
 0007C419    mov         eax,dword ptr [edi+204]
 0007C41F    mov         edx,dword ptr [ebp-14]
 0007C422    call        MaskGetCharType
 0007C427    mov         edx,eax
 0007C429    dec         edx
 0007C42A    sub         dl,2
>0007C42D    jae         0007C432
 0007C42F    inc         ebx
>0007C430    jmp         0007C44B
 0007C432    add         al,0FC
 0007C434    sub         al,2
>0007C436    jae         0007C44B
 0007C438    mov         eax,dword ptr [ebp-4]
 0007C43B    call        UniqueString
 0007C440    mov         dl,byte ptr [edi+208]
 0007C446    mov         byte ptr [eax+ebx-1],dl
 0007C44A    inc         ebx
 0007C44B    cmp         ebx,dword ptr [ebp-10]
>0007C44E    jge         0007C456
 0007C450    inc         dword ptr [ebp-14]
 0007C453    dec         esi
>0007C454    jne         0007C419
 0007C456    mov         al,byte ptr [ebp-9]
 0007C459    pop         edi
 0007C45A    pop         esi
 0007C45B    pop         ebx
 0007C45C    mov         esp,ebp
 0007C45E    pop         ebp
 0007C45F    ret         4
*}
end;

//0007C464
function TCustomMaskEdit.InputString(var Value:AnsiString; const NewValue:AnsiString; Offset:Integer):Integer;
begin
{*
 0007C464    push        ebp
 0007C465    mov         ebp,esp
 0007C467    add         esp,0FFFFFFE0
 0007C46A    push        ebx
 0007C46B    push        esi
 0007C46C    push        edi
 0007C46D    xor         ebx,ebx
 0007C46F    mov         dword ptr [ebp-18],ebx
 0007C472    mov         dword ptr [ebp-1C],ebx
 0007C475    mov         dword ptr [ebp-20],ebx
 0007C478    mov         dword ptr [ebp-10],ebx
 0007C47B    mov         edi,ecx
 0007C47D    mov         dword ptr [ebp-4],edx
 0007C480    mov         esi,eax
 0007C482    xor         eax,eax
 0007C484    push        ebp
 0007C485    push        7C715
 0007C48A    push        dword ptr fs:[eax]
 0007C48D    mov         dword ptr fs:[eax],esp
 0007C490    mov         eax,dword ptr [ebp+8]
 0007C493    mov         dword ptr [ebp-8],eax
 0007C496    test        edi,edi
>0007C498    je          0007C6F2
 0007C49E    mov         ebx,1
 0007C4A3    lea         eax,[ebp-10]
 0007C4A6    mov         edx,edi
 0007C4A8    call        @LStrLAsg
 0007C4AD    mov         edx,dword ptr [ebp+8]
 0007C4B0    mov         eax,dword ptr [esi+204]
 0007C4B6    call        OffsetToMaskOffset
 0007C4BB    mov         edi,eax
 0007C4BD    test        edi,edi
>0007C4BF    jl          0007C6F2
>0007C4C5    jmp         0007C5D4
 0007C4CA    mov         edx,edi
 0007C4CC    mov         eax,dword ptr [esi+204]
 0007C4D2    call        MaskGetCharType
 0007C4D7    mov         byte ptr [ebp-9],al
 0007C4DA    mov         al,byte ptr [ebp-9]
 0007C4DD    dec         eax
 0007C4DE    sub         al,2
>0007C4E0    jb          0007C4EB
 0007C4E2    dec         eax
 0007C4E3    sub         al,2
>0007C4E5    jae         0007C5BA
 0007C4EB    mov         eax,dword ptr [ebp-10]
 0007C4EE    mov         al,byte ptr [eax+ebx-1]
 0007C4F2    mov         byte ptr [ebp-11],al
 0007C4F5    lea         edx,[ebp-11]
 0007C4F8    mov         ecx,edi
 0007C4FA    mov         eax,esi
 0007C4FC    call        TCustomMaskEdit.DoInputChar
 0007C501    test        al,al
>0007C503    jne         0007C532
 0007C505    mov         eax,[000B5BE8]
 0007C50A    mov         dl,byte ptr [ebp-11]
 0007C50D    and         edx,0FF
 0007C513    bt          dword ptr [eax],edx
>0007C516    jae         0007C529
 0007C518    lea         eax,[ebp-10]
 0007C51B    call        UniqueString
 0007C520    mov         dl,byte ptr [esi+208]
 0007C526    mov         byte ptr [eax+ebx],dl
 0007C529    mov         al,byte ptr [esi+208]
 0007C52F    mov         byte ptr [ebp-11],al
 0007C532    mov         al,byte ptr [ebp-9]
 0007C535    dec         eax
 0007C536    sub         al,2
>0007C538    jae         0007C546
 0007C53A    mov         eax,dword ptr [ebp-10]
 0007C53D    mov         al,byte ptr [eax+ebx-1]
 0007C541    cmp         al,byte ptr [ebp-11]
>0007C544    jne         0007C56C
 0007C546    lea         eax,[ebp-10]
 0007C549    call        UniqueString
 0007C54E    mov         dl,byte ptr [ebp-11]
 0007C551    mov         byte ptr [eax+ebx-1],dl
 0007C555    mov         eax,[000B5BE8]
 0007C55A    mov         dl,byte ptr [ebp-11]
 0007C55D    and         edx,0FF
 0007C563    bt          dword ptr [eax],edx
>0007C566    jae         0007C5B9
 0007C568    inc         ebx
 0007C569    inc         edi
>0007C56A    jmp         0007C5B9
 0007C56C    lea         eax,[ebp-18]
 0007C56F    push        eax
 0007C570    mov         ecx,ebx
 0007C572    dec         ecx
 0007C573    mov         edx,1
 0007C578    mov         eax,dword ptr [ebp-10]
 0007C57B    call        @LStrCopy
 0007C580    push        dword ptr [ebp-18]
 0007C583    lea         eax,[ebp-1C]
 0007C586    mov         dl,byte ptr [ebp-11]
 0007C589    call        @LStrFromChar
 0007C58E    push        dword ptr [ebp-1C]
 0007C591    lea         eax,[ebp-20]
 0007C594    push        eax
 0007C595    mov         eax,dword ptr [ebp-10]
 0007C598    call        @LStrLen
 0007C59D    mov         ecx,eax
 0007C59F    mov         edx,ebx
 0007C5A1    mov         eax,dword ptr [ebp-10]
 0007C5A4    call        @LStrCopy
 0007C5A9    push        dword ptr [ebp-20]
 0007C5AC    lea         eax,[ebp-10]
 0007C5AF    mov         edx,3
 0007C5B4    call        @LStrCatN
 0007C5B9    inc         ebx
 0007C5BA    mov         eax,dword ptr [ebp+8]
 0007C5BD    add         eax,ebx
 0007C5BF    cmp         eax,dword ptr [esi+20C]
>0007C5C5    jg          0007C5E7
 0007C5C7    mov         eax,dword ptr [ebp-10]
 0007C5CA    call        @LStrLen
 0007C5CF    cmp         eax,ebx
>0007C5D1    jl          0007C5E7
 0007C5D3    inc         edi
 0007C5D4    mov         eax,dword ptr [esi+204]
 0007C5DA    call        @LStrLen
 0007C5DF    cmp         edi,eax
>0007C5E1    jle         0007C4CA
 0007C5E7    mov         eax,dword ptr [ebp-10]
 0007C5EA    call        @LStrLen
 0007C5EF    add         eax,dword ptr [ebp+8]
 0007C5F2    cmp         eax,dword ptr [esi+20C]
>0007C5F8    jge         0007C693
 0007C5FE    mov         eax,dword ptr [ebp-10]
 0007C601    call        @LStrLen
 0007C606    mov         edx,eax
 0007C608    add         edx,dword ptr [ebp+8]
 0007C60B    inc         edx
 0007C60C    mov         eax,dword ptr [ebp-4]
 0007C60F    mov         eax,dword ptr [eax]
 0007C611    call        ByteType
 0007C616    cmp         al,2
>0007C618    jne         0007C634
 0007C61A    lea         eax,[ebp-18]
 0007C61D    mov         dl,byte ptr [esi+208]
 0007C623    call        @LStrFromChar
 0007C628    mov         edx,dword ptr [ebp-18]
 0007C62B    lea         eax,[ebp-10]
 0007C62E    call        @LStrCat
 0007C633    inc         ebx
 0007C634    lea         eax,[ebp-18]
 0007C637    push        eax
 0007C638    mov         eax,dword ptr [ebp-4]
 0007C63B    mov         eax,dword ptr [eax]
 0007C63D    mov         ecx,dword ptr [ebp+8]
 0007C640    mov         edx,1
 0007C645    call        @LStrCopy
 0007C64A    push        dword ptr [ebp-18]
 0007C64D    push        dword ptr [ebp-10]
 0007C650    lea         eax,[ebp-1C]
 0007C653    push        eax
 0007C654    mov         eax,dword ptr [ebp-10]
 0007C657    call        @LStrLen
 0007C65C    add         eax,dword ptr [ebp+8]
 0007C65F    mov         edx,dword ptr [esi+20C]
 0007C665    sub         edx,eax
 0007C667    push        edx
 0007C668    mov         eax,dword ptr [ebp-10]
 0007C66B    call        @LStrLen
 0007C670    mov         edx,eax
 0007C672    add         edx,dword ptr [ebp+8]
 0007C675    inc         edx
 0007C676    mov         eax,dword ptr [ebp-4]
 0007C679    mov         eax,dword ptr [eax]
 0007C67B    pop         ecx
 0007C67C    call        @LStrCopy
 0007C681    push        dword ptr [ebp-1C]
 0007C684    mov         eax,dword ptr [ebp-4]
 0007C687    mov         edx,3
 0007C68C    call        @LStrCatN
>0007C691    jmp         0007C6EB
 0007C693    mov         edi,dword ptr [ebp+8]
 0007C696    mov         edx,dword ptr [esi+20C]
 0007C69C    sub         edx,dword ptr [ebp+8]
 0007C69F    mov         eax,dword ptr [ebp-10]
 0007C6A2    call        ByteType
 0007C6A7    cmp         al,1
>0007C6A9    jne         0007C6AC
 0007C6AB    inc         edi
 0007C6AC    lea         eax,[ebp-18]
 0007C6AF    push        eax
 0007C6B0    mov         ecx,dword ptr [esi+20C]
 0007C6B6    sub         ecx,edi
 0007C6B8    mov         edx,1
 0007C6BD    mov         eax,dword ptr [ebp-10]
 0007C6C0    call        @LStrCopy
 0007C6C5    mov         eax,dword ptr [ebp-18]
 0007C6C8    push        eax
 0007C6C9    lea         eax,[ebp-1C]
 0007C6CC    push        eax
 0007C6CD    mov         eax,dword ptr [ebp-4]
 0007C6D0    mov         eax,dword ptr [eax]
 0007C6D2    mov         ecx,dword ptr [ebp+8]
 0007C6D5    mov         edx,1
 0007C6DA    call        @LStrCopy
 0007C6DF    mov         edx,dword ptr [ebp-1C]
 0007C6E2    mov         eax,dword ptr [ebp-4]
 0007C6E5    pop         ecx
 0007C6E6    call        @LStrCat3
 0007C6EB    add         ebx,dword ptr [ebp+8]
 0007C6EE    dec         ebx
 0007C6EF    mov         dword ptr [ebp-8],ebx
 0007C6F2    xor         eax,eax
 0007C6F4    pop         edx
 0007C6F5    pop         ecx
 0007C6F6    pop         ecx
 0007C6F7    mov         dword ptr fs:[eax],edx
 0007C6FA    push        7C71C
 0007C6FF    lea         eax,[ebp-20]
 0007C702    mov         edx,3
 0007C707    call        @LStrArrayClr
 0007C70C    lea         eax,[ebp-10]
 0007C70F    call        @LStrClr
 0007C714    ret
>0007C715    jmp         @HandleFinally
>0007C71A    jmp         0007C6FF
 0007C71C    mov         eax,dword ptr [ebp-8]
 0007C71F    pop         edi
 0007C720    pop         esi
 0007C721    pop         ebx
 0007C722    mov         esp,ebp
 0007C724    pop         ebp
 0007C725    ret         4
*}
end;

//0007C728
function TCustomMaskEdit.FindLiteralChar(MaskOffset:Integer; InChar:Char):Integer;
begin
{*
 0007C728    push        ebx
 0007C729    push        esi
 0007C72A    push        edi
 0007C72B    push        ebp
 0007C72C    mov         ebx,ecx
 0007C72E    mov         edi,edx
 0007C730    mov         esi,eax
 0007C732    or          ebp,0FFFFFFFF
>0007C735    jmp         0007C76C
 0007C737    inc         edi
 0007C738    mov         edx,edi
 0007C73A    mov         eax,dword ptr [esi+204]
 0007C740    call        MaskGetCharType
 0007C745    mov         edx,eax
 0007C747    dec         edx
 0007C748    sub         dl,2
>0007C74B    jae         0007C76C
 0007C74D    mov         edx,dword ptr [esi+204]
 0007C753    mov         dl,byte ptr [edx+edi-1]
 0007C757    cmp         al,2
>0007C759    jne         0007C764
 0007C75B    mov         eax,edx
 0007C75D    call        MaskIntlLiteralToChar
 0007C762    mov         edx,eax
 0007C764    cmp         bl,dl
>0007C766    jne         0007C77B
 0007C768    mov         ebp,edi
>0007C76A    jmp         0007C77B
 0007C76C    mov         eax,dword ptr [esi+204]
 0007C772    call        @LStrLen
 0007C777    cmp         edi,eax
>0007C779    jl          0007C737
 0007C77B    mov         eax,ebp
 0007C77D    pop         ebp
 0007C77E    pop         edi
 0007C77F    pop         esi
 0007C780    pop         ebx
 0007C781    ret
*}
end;

end.