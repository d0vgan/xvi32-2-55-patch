//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit comobj;

interface

uses
  SysUtils, Classes;

type
  EOleError = class(Exception)
  end;
  EOleSysError = class(EOleError)
  public
    FErrorCode:Integer;//fC
    constructor Create(const Message:AnsiString; ErrorCode:Integer; HelpContext:Integer);//0008E834
  end;
  EOleException = class(EOleSysError)
  public
    FSource:String;//f10
    FHelpFile:String;//f14
    constructor Create(const Message:AnsiString; ErrorCode:Integer; const Source:AnsiString; const HelpFile:AnsiString; HelpContext:Integer);//0008E904
  end;
    function TrimPunctuation(const S:AnsiString):AnsiString;//0008E7E4
    procedure OleError(ErrorCode:HRESULT);//0008E99C
    procedure OleCheck(Result:HRESULT);//0008E9B8
    procedure LoadComExProcs;//0008E9D0
    procedure SafeCallError(ErrorCode:Integer; ErrorAddr:Pointer);//0008EAD4
    procedure DispatchInvoke(const Dispatch:IDispatch; CallDesc:PCallDesc; DispIDs:PDispIDList; Params:Pointer; Result:PVariant);//0008EBD4
    procedure RaiseNameException;//0008EED0
    procedure GetIDsOfNames(const Dispatch:IDispatch; Names:PChar; NameCount:Integer; DispIDs:PDispIDList);//0008EF40
    procedure RaiseException;//0008F020
    procedure VarDispInvoke(Result:PVariant; const Instance:Variant; CallDesc:PCallDesc; Params:Pointer); cdecl;//0008F074
    procedure DispCallError(Status:Integer; var ExcepInfo:TExcepInfo; ErrorAddr:Pointer; FinalizeExcepInfo:Boolean);//0008F0F4
    procedure DispatchInvokeError(Status:Integer; const ExcepInfo:TExcepInfo);//0008F1C8
    procedure ClearExcepInfo(var ExcepInfo:TExcepInfo);//0008F1D4
    procedure DispCall(const Dispatch:IDispatch; CallDesc:PCallDesc; DispID:Integer; NamedArgDispIDs:Pointer; Params:Pointer; Result:Pointer); stdcall;//0008F1E4
    procedure DispCallByID(Result:Pointer; const Dispatch:IDispatch; DispDesc:PDispDesc; Params:Pointer); cdecl;//0008F2CC
    procedure InitComObj;//0008F3A8

implementation

//0008E7E4
function TrimPunctuation(const S:AnsiString):AnsiString;
begin
{*
 0008E7E4    push        ebx
 0008E7E5    push        esi
 0008E7E6    mov         ebx,edx
 0008E7E8    mov         esi,eax
 0008E7EA    mov         eax,ebx
 0008E7EC    mov         edx,esi
 0008E7EE    call        @LStrLAsg
 0008E7F3    mov         eax,dword ptr [ebx]
 0008E7F5    call        AnsiLastChar
 0008E7FA    mov         esi,eax
>0008E7FC    jmp         0008E819
 0008E7FE    mov         eax,dword ptr [ebx]
 0008E800    call        @LStrToPChar
 0008E805    mov         edx,esi
 0008E807    sub         edx,eax
 0008E809    mov         eax,ebx
 0008E80B    call        @LStrSetLength
 0008E810    mov         eax,dword ptr [ebx]
 0008E812    call        AnsiLastChar
 0008E817    mov         esi,eax
 0008E819    mov         eax,dword ptr [ebx]
 0008E81B    call        @LStrLen
 0008E820    test        eax,eax
>0008E822    jle         0008E82E
 0008E824    mov         al,byte ptr [esi]
 0008E826    sub         al,21
>0008E828    jb          0008E7FE
 0008E82A    sub         al,0D
>0008E82C    je          0008E7FE
 0008E82E    pop         esi
 0008E82F    pop         ebx
 0008E830    ret
*}
end;

//0008E834
constructor EOleSysError.Create(const Message:AnsiString; ErrorCode:Integer; HelpContext:Integer);
begin
{*
 0008E834    push        ebp
 0008E835    mov         ebp,esp
 0008E837    add         esp,0FFFFFFEC
 0008E83A    push        ebx
 0008E83B    push        esi
 0008E83C    push        edi
 0008E83D    xor         ebx,ebx
 0008E83F    mov         dword ptr [ebp-0C],ebx
 0008E842    mov         dword ptr [ebp-8],ebx
 0008E845    test        dl,dl
>0008E847    je          0008E851
 0008E849    add         esp,0FFFFFFF0
 0008E84C    call        @ClassCreate
 0008E851    mov         edi,ecx
 0008E853    mov         byte ptr [ebp-1],dl
 0008E856    mov         ebx,eax
 0008E858    mov         esi,dword ptr [ebp+0C]
 0008E85B    xor         eax,eax
 0008E85D    push        ebp
 0008E85E    push        8E8DB
 0008E863    push        dword ptr fs:[eax]
 0008E866    mov         dword ptr fs:[eax],esp
 0008E869    lea         eax,[ebp-8]
 0008E86C    mov         edx,edi
 0008E86E    call        @LStrLAsg
 0008E873    cmp         dword ptr [ebp-8],0
>0008E877    jne         0008E8AD
 0008E879    lea         edx,[ebp-8]
 0008E87C    mov         eax,esi
 0008E87E    call        SysErrorMessage
 0008E883    cmp         dword ptr [ebp-8],0
>0008E887    jne         0008E8AD
 0008E889    push        0
 0008E88B    lea         edx,[ebp-0C]
 0008E88E    mov         eax,[000B56FC];^SOleError:TResStringRec
 0008E893    call        LoadResString
 0008E898    mov         edx,dword ptr [ebp-0C]
 0008E89B    mov         dword ptr [ebp-14],esi
 0008E89E    mov         byte ptr [ebp-10],0
 0008E8A2    lea         ecx,[ebp-14]
 0008E8A5    lea         eax,[ebp-8]
 0008E8A8    call        FmtStr
 0008E8AD    mov         eax,dword ptr [ebp+8]
 0008E8B0    push        eax
 0008E8B1    mov         ecx,dword ptr [ebp-8]
 0008E8B4    xor         edx,edx
 0008E8B6    mov         eax,ebx
 0008E8B8    call        Exception.CreateHelp
 0008E8BD    mov         dword ptr [ebx+0C],esi
 0008E8C0    xor         eax,eax
 0008E8C2    pop         edx
 0008E8C3    pop         ecx
 0008E8C4    pop         ecx
 0008E8C5    mov         dword ptr fs:[eax],edx
 0008E8C8    push        8E8E2
 0008E8CD    lea         eax,[ebp-0C]
 0008E8D0    mov         edx,2
 0008E8D5    call        @LStrArrayClr
 0008E8DA    ret
>0008E8DB    jmp         @HandleFinally
>0008E8E0    jmp         0008E8CD
 0008E8E2    mov         eax,ebx
 0008E8E4    cmp         byte ptr [ebp-1],0
>0008E8E8    je          0008E8F9
 0008E8EA    call        @AfterConstruction
 0008E8EF    pop         dword ptr fs:[0]
 0008E8F6    add         esp,0C
 0008E8F9    mov         eax,ebx
 0008E8FB    pop         edi
 0008E8FC    pop         esi
 0008E8FD    pop         ebx
 0008E8FE    mov         esp,ebp
 0008E900    pop         ebp
 0008E901    ret         8
*}
end;

//0008E904
constructor EOleException.Create(const Message:AnsiString; ErrorCode:Integer; const Source:AnsiString; const HelpFile:AnsiString; HelpContext:Integer);
begin
{*
 0008E904    push        ebp
 0008E905    mov         ebp,esp
 0008E907    push        0
 0008E909    push        ebx
 0008E90A    push        esi
 0008E90B    push        edi
 0008E90C    test        dl,dl
>0008E90E    je          0008E918
 0008E910    add         esp,0FFFFFFF0
 0008E913    call        @ClassCreate
 0008E918    mov         esi,ecx
 0008E91A    mov         ebx,edx
 0008E91C    mov         edi,eax
 0008E91E    xor         eax,eax
 0008E920    push        ebp
 0008E921    push        8E976
 0008E926    push        dword ptr fs:[eax]
 0008E929    mov         dword ptr fs:[eax],esp
 0008E92C    mov         eax,dword ptr [ebp+14]
 0008E92F    push        eax
 0008E930    mov         eax,dword ptr [ebp+8]
 0008E933    push        eax
 0008E934    lea         edx,[ebp-4]
 0008E937    mov         eax,esi
 0008E939    call        TrimPunctuation
 0008E93E    mov         ecx,dword ptr [ebp-4]
 0008E941    xor         edx,edx
 0008E943    mov         eax,edi
 0008E945    call        EOleSysError.Create
 0008E94A    lea         eax,[edi+10]
 0008E94D    mov         edx,dword ptr [ebp+10]
 0008E950    call        @LStrAsg
 0008E955    lea         eax,[edi+14]
 0008E958    mov         edx,dword ptr [ebp+0C]
 0008E95B    call        @LStrAsg
 0008E960    xor         eax,eax
 0008E962    pop         edx
 0008E963    pop         ecx
 0008E964    pop         ecx
 0008E965    mov         dword ptr fs:[eax],edx
 0008E968    push        8E97D
 0008E96D    lea         eax,[ebp-4]
 0008E970    call        @LStrClr
 0008E975    ret
>0008E976    jmp         @HandleFinally
>0008E97B    jmp         0008E96D
 0008E97D    mov         eax,edi
 0008E97F    test        bl,bl
>0008E981    je          0008E992
 0008E983    call        @AfterConstruction
 0008E988    pop         dword ptr fs:[0]
 0008E98F    add         esp,0C
 0008E992    mov         eax,edi
 0008E994    pop         edi
 0008E995    pop         esi
 0008E996    pop         ebx
 0008E997    pop         ecx
 0008E998    pop         ebp
 0008E999    ret         10
*}
end;

//0008E99C
procedure OleError(ErrorCode:HRESULT);
begin
{*
 0008E99C    push        ebx
 0008E99D    mov         ebx,eax
 0008E99F    push        ebx
 0008E9A0    push        0
 0008E9A2    xor         ecx,ecx
 0008E9A4    mov         dl,1
 0008E9A6    mov         eax,[0008E6E0];EOleSysError
 0008E9AB    call        EOleSysError.Create
 0008E9B0    call        @RaiseExcept
 0008E9B5    pop         ebx
 0008E9B6    ret
*}
end;

//0008E9B8
procedure OleCheck(Result:HRESULT);
begin
{*
 0008E9B8    push        ebx
 0008E9B9    mov         ebx,eax
 0008E9BB    mov         eax,ebx
 0008E9BD    call        Succeeded
 0008E9C2    test        al,al
>0008E9C4    jne         0008E9CD
 0008E9C6    mov         eax,ebx
 0008E9C8    call        OleError
 0008E9CD    pop         ebx
 0008E9CE    ret
*}
end;

//0008E9D0
procedure LoadComExProcs;
begin
{*
 0008E9D0    push        ebx
 0008E9D1    push        8EA44
 0008E9D6    call        kernel32.GetModuleHandleA
 0008E9DB    mov         ebx,eax
 0008E9DD    test        ebx,ebx
>0008E9DF    je          0008EA41
 0008E9E1    push        8EA50
 0008E9E6    push        ebx
 0008E9E7    call        kernel32.GetProcAddress
 0008E9EC    mov         [000B55A4],eax
 0008E9F1    push        8EA64
 0008E9F6    push        ebx
 0008E9F7    call        kernel32.GetProcAddress
 0008E9FC    mov         [000B55A8],eax
 0008EA01    push        8EA74
 0008EA06    push        ebx
 0008EA07    call        kernel32.GetProcAddress
 0008EA0C    mov         [000B55AC],eax
 0008EA11    push        8EA8C
 0008EA16    push        ebx
 0008EA17    call        kernel32.GetProcAddress
 0008EA1C    mov         [000B55B0],eax
 0008EA21    push        8EAA4
 0008EA26    push        ebx
 0008EA27    call        kernel32.GetProcAddress
 0008EA2C    mov         [000B55B4],eax
 0008EA31    push        8EABC
 0008EA36    push        ebx
 0008EA37    call        kernel32.GetProcAddress
 0008EA3C    mov         [000B55B8],eax
 0008EA41    pop         ebx
 0008EA42    ret
*}
end;

//0008EAD4
procedure SafeCallError(ErrorCode:Integer; ErrorAddr:Pointer);
begin
{*
 0008EAD4    push        ebp
 0008EAD5    mov         ebp,esp
 0008EAD7    xor         ecx,ecx
 0008EAD9    push        ecx
 0008EADA    push        ecx
 0008EADB    push        ecx
 0008EADC    push        ecx
 0008EADD    push        ecx
 0008EADE    push        ecx
 0008EADF    push        ecx
 0008EAE0    push        ecx
 0008EAE1    push        ebx
 0008EAE2    push        esi
 0008EAE3    mov         esi,edx
 0008EAE5    mov         ebx,eax
 0008EAE7    xor         eax,eax
 0008EAE9    push        ebp
 0008EAEA    push        8EBC4
 0008EAEF    push        dword ptr fs:[eax]
 0008EAF2    mov         dword ptr fs:[eax],esp
 0008EAF5    xor         eax,eax
 0008EAF7    mov         dword ptr [ebp-14],eax
 0008EAFA    lea         eax,[ebp-4]
 0008EAFD    call        @IntfClear
 0008EB02    push        eax
 0008EB03    push        0
 0008EB05    call        oleaut32.GetErrorInfo
 0008EB0A    test        eax,eax
>0008EB0C    jne         0008EB51
 0008EB0E    lea         eax,[ebp-8]
 0008EB11    call        @WStrClr
 0008EB16    push        eax
 0008EB17    mov         eax,dword ptr [ebp-4]
 0008EB1A    push        eax
 0008EB1B    mov         eax,dword ptr [eax]
 0008EB1D    call        dword ptr [eax+10]
 0008EB20    lea         eax,[ebp-0C]
 0008EB23    call        @WStrClr
 0008EB28    push        eax
 0008EB29    mov         eax,dword ptr [ebp-4]
 0008EB2C    push        eax
 0008EB2D    mov         eax,dword ptr [eax]
 0008EB2F    call        dword ptr [eax+14]
 0008EB32    lea         eax,[ebp-10]
 0008EB35    call        @WStrClr
 0008EB3A    push        eax
 0008EB3B    mov         eax,dword ptr [ebp-4]
 0008EB3E    push        eax
 0008EB3F    mov         eax,dword ptr [eax]
 0008EB41    call        dword ptr [eax+18]
 0008EB44    lea         eax,[ebp-14]
 0008EB47    push        eax
 0008EB48    mov         eax,dword ptr [ebp-4]
 0008EB4B    push        eax
 0008EB4C    mov         eax,dword ptr [eax]
 0008EB4E    call        dword ptr [eax+1C]
 0008EB51    push        esi
 0008EB52    push        ebx
 0008EB53    lea         eax,[ebp-18]
 0008EB56    mov         edx,dword ptr [ebp-8]
 0008EB59    call        @LStrFromWStr
 0008EB5E    mov         eax,dword ptr [ebp-18]
 0008EB61    push        eax
 0008EB62    lea         eax,[ebp-1C]
 0008EB65    mov         edx,dword ptr [ebp-10]
 0008EB68    call        @LStrFromWStr
 0008EB6D    mov         eax,dword ptr [ebp-1C]
 0008EB70    push        eax
 0008EB71    mov         eax,dword ptr [ebp-14]
 0008EB74    push        eax
 0008EB75    lea         eax,[ebp-20]
 0008EB78    mov         edx,dword ptr [ebp-0C]
 0008EB7B    call        @LStrFromWStr
 0008EB80    mov         ecx,dword ptr [ebp-20]
 0008EB83    mov         dl,1
 0008EB85    mov         eax,[0008E73C];EOleException
 0008EB8A    call        EOleException.Create
>0008EB8F    jmp         @RaiseExcept
 0008EB94    xor         eax,eax
 0008EB96    pop         edx
 0008EB97    pop         ecx
 0008EB98    pop         ecx
 0008EB99    mov         dword ptr fs:[eax],edx
 0008EB9C    push        8EBCB
 0008EBA1    lea         eax,[ebp-20]
 0008EBA4    mov         edx,3
 0008EBA9    call        @LStrArrayClr
 0008EBAE    lea         eax,[ebp-10]
 0008EBB1    mov         edx,3
 0008EBB6    call        @WStrArrayClr
 0008EBBB    lea         eax,[ebp-4]
 0008EBBE    call        @IntfClear
 0008EBC3    ret
>0008EBC4    jmp         @HandleFinally
>0008EBC9    jmp         0008EBA1
 0008EBCB    pop         esi
 0008EBCC    pop         ebx
 0008EBCD    mov         esp,ebp
 0008EBCF    pop         ebp
 0008EBD0    ret
*}
end;

//0008EBD4
procedure DispatchInvoke(const Dispatch:IDispatch; CallDesc:PCallDesc; DispIDs:PDispIDList; Params:Pointer; Result:PVariant);
begin
{*
 0008EBD4    push        ebp
 0008EBD5    mov         ebp,esp
 0008EBD7    add         esp,0FFFFF9B0
 0008EBDD    push        ebx
 0008EBDE    push        esi
 0008EBDF    push        edi
 0008EBE0    mov         dword ptr [ebp-8],ecx
 0008EBE3    mov         esi,edx
 0008EBE5    mov         dword ptr [ebp-4],eax
 0008EBE8    lea         eax,[ebp-50]
 0008EBEB    mov         edx,dword ptr ds:[1DA9C];tagEXCEPINFO
 0008EBF1    call        @AddRefRecord
 0008EBF6    xor         eax,eax
 0008EBF8    push        ebp
 0008EBF9    push        8EEC0
 0008EBFE    push        dword ptr fs:[eax]
 0008EC01    mov         dword ptr fs:[eax],esp
 0008EC04    xor         eax,eax
 0008EC06    mov         dword ptr [ebp-14],eax
 0008EC09    xor         ecx,ecx
 0008EC0B    push        ebp
 0008EC0C    push        8EE9D
 0008EC11    push        dword ptr fs:[ecx]
 0008EC14    mov         dword ptr fs:[ecx],esp
 0008EC17    xor         eax,eax
 0008EC19    mov         al,byte ptr [esi+1]
 0008EC1C    mov         dword ptr [ebp-10],eax
 0008EC1F    cmp         dword ptr [ebp-10],0
>0008EC23    je          0008EDB6
 0008EC29    mov         eax,dword ptr [ebp+0C]
 0008EC2C    mov         dword ptr [ebp-18],eax
 0008EC2F    mov         eax,dword ptr [ebp-10]
 0008EC32    add         eax,eax
 0008EC34    lea         edi,[ebp+eax*8-650]
 0008EC3B    xor         ebx,ebx
 0008EC3D    sub         edi,10
 0008EC40    mov         al,byte ptr [esi+ebx+3]
 0008EC44    mov         edx,eax
 0008EC46    and         dl,7F
 0008EC49    and         edx,0FF
 0008EC4F    mov         dword ptr [ebp-0C],edx
 0008EC52    and         al,80
 0008EC54    cmp         dword ptr [ebp-0C],0A
>0008EC58    jne         0008EC6C
 0008EC5A    mov         dword ptr [edi],0A
 0008EC60    mov         dword ptr [edi+8],80020004
>0008EC67    jmp         0008EDAC
 0008EC6C    cmp         dword ptr [ebp-0C],48
>0008EC70    jne         0008ECDA
 0008EC72    mov         edx,dword ptr [ebp-14]
 0008EC75    lea         edx,[ebp+edx*8-250]
 0008EC7C    mov         dword ptr [ebp-1C],edx
 0008EC7F    test        al,al
>0008EC81    je          0008ECAD
 0008EC83    mov         eax,dword ptr [ebp-18]
 0008EC86    mov         eax,dword ptr [eax]
 0008EC88    mov         eax,dword ptr [eax]
 0008EC8A    call        StringToOleStr
 0008EC8F    mov         edx,dword ptr [ebp-1C]
 0008EC92    mov         dword ptr [edx],eax
 0008EC94    mov         eax,dword ptr [ebp-18]
 0008EC97    mov         eax,dword ptr [eax]
 0008EC99    mov         edx,dword ptr [ebp-1C]
 0008EC9C    mov         dword ptr [edx+4],eax
 0008EC9F    mov         dword ptr [edi],4008
 0008ECA5    mov         eax,dword ptr [ebp-1C]
 0008ECA8    mov         dword ptr [edi+8],eax
>0008ECAB    jmp         0008ECD2
 0008ECAD    mov         eax,dword ptr [ebp-18]
 0008ECB0    mov         eax,dword ptr [eax]
 0008ECB2    call        StringToOleStr
 0008ECB7    mov         edx,dword ptr [ebp-1C]
 0008ECBA    mov         dword ptr [edx],eax
 0008ECBC    mov         eax,dword ptr [ebp-1C]
 0008ECBF    xor         edx,edx
 0008ECC1    mov         dword ptr [eax+4],edx
 0008ECC4    mov         dword ptr [edi],8
 0008ECCA    mov         eax,dword ptr [ebp-1C]
 0008ECCD    mov         eax,dword ptr [eax]
 0008ECCF    mov         dword ptr [edi+8],eax
 0008ECD2    inc         dword ptr [ebp-14]
>0008ECD5    jmp         0008EDA8
 0008ECDA    test        al,al
>0008ECDC    je          0008ED1D
 0008ECDE    cmp         dword ptr [ebp-0C],0C
>0008ECE2    jne         0008ED06
 0008ECE4    mov         eax,dword ptr [ebp-18]
 0008ECE7    mov         eax,dword ptr [eax]
 0008ECE9    cmp         word ptr [eax],100
>0008ECEE    jne         0008ED06
 0008ECF0    mov         eax,dword ptr [ebp-18]
 0008ECF3    mov         eax,dword ptr [eax]
 0008ECF5    mov         edx,eax
 0008ECF7    mov         eax,dword ptr [ebp-18]
 0008ECFA    mov         eax,dword ptr [eax]
 0008ECFC    mov         ecx,8
 0008ED01    call        @VarCast
 0008ED06    mov         eax,dword ptr [ebp-0C]
 0008ED09    or          eax,4000
 0008ED0E    mov         dword ptr [edi],eax
 0008ED10    mov         eax,dword ptr [ebp-18]
 0008ED13    mov         eax,dword ptr [eax]
 0008ED15    mov         dword ptr [edi+8],eax
>0008ED18    jmp         0008EDA8
 0008ED1D    cmp         dword ptr [ebp-0C],0C
>0008ED21    jne         0008ED83
 0008ED23    mov         eax,dword ptr [ebp-18]
 0008ED26    cmp         word ptr [eax],100
>0008ED2B    jne         0008ED67
 0008ED2D    mov         eax,dword ptr [ebp-14]
 0008ED30    lea         eax,[ebp+eax*8-250]
 0008ED37    mov         dword ptr [ebp-20],eax
 0008ED3A    mov         eax,dword ptr [ebp-18]
 0008ED3D    mov         eax,dword ptr [eax]
 0008ED3F    mov         eax,dword ptr [eax+8]
 0008ED42    call        StringToOleStr
 0008ED47    mov         edx,dword ptr [ebp-20]
 0008ED4A    mov         dword ptr [edx],eax
 0008ED4C    mov         eax,dword ptr [ebp-20]
 0008ED4F    xor         edx,edx
 0008ED51    mov         dword ptr [eax+4],edx
 0008ED54    mov         dword ptr [edi],8
 0008ED5A    mov         eax,dword ptr [ebp-20]
 0008ED5D    mov         eax,dword ptr [eax]
 0008ED5F    mov         dword ptr [edi+8],eax
 0008ED62    inc         dword ptr [ebp-14]
>0008ED65    jmp         0008EDA8
 0008ED67    mov         edx,dword ptr [eax]
 0008ED69    mov         dword ptr [edi],edx
 0008ED6B    mov         edx,dword ptr [eax+4]
 0008ED6E    mov         dword ptr [edi+4],edx
 0008ED71    mov         edx,dword ptr [eax+8]
 0008ED74    mov         dword ptr [edi+8],edx
 0008ED77    mov         eax,dword ptr [eax+0C]
 0008ED7A    mov         dword ptr [edi+0C],eax
 0008ED7D    add         dword ptr [ebp-18],0C
>0008ED81    jmp         0008EDA8
 0008ED83    mov         eax,dword ptr [ebp-0C]
 0008ED86    mov         dword ptr [edi],eax
 0008ED88    mov         eax,dword ptr [ebp-18]
 0008ED8B    mov         eax,dword ptr [eax]
 0008ED8D    mov         dword ptr [edi+8],eax
 0008ED90    cmp         dword ptr [ebp-0C],5
>0008ED94    jl          0008EDA8
 0008ED96    cmp         dword ptr [ebp-0C],7
>0008ED9A    jg          0008EDA8
 0008ED9C    add         dword ptr [ebp-18],4
 0008EDA0    mov         eax,dword ptr [ebp-18]
 0008EDA3    mov         eax,dword ptr [eax]
 0008EDA5    mov         dword ptr [edi+0C],eax
 0008EDA8    add         dword ptr [ebp-18],4
 0008EDAC    inc         ebx
 0008EDAD    cmp         ebx,dword ptr [ebp-10]
>0008EDB0    jne         0008EC3D
 0008EDB6    lea         eax,[ebp-650]
 0008EDBC    mov         dword ptr [ebp-30],eax
 0008EDBF    mov         eax,dword ptr [ebp-8]
 0008EDC2    add         eax,4
 0008EDC5    mov         dword ptr [ebp-2C],eax
 0008EDC8    mov         eax,dword ptr [ebp-10]
 0008EDCB    mov         dword ptr [ebp-28],eax
 0008EDCE    xor         eax,eax
 0008EDD0    mov         al,byte ptr [esi+2]
 0008EDD3    mov         dword ptr [ebp-24],eax
 0008EDD6    mov         eax,dword ptr [ebp-8]
 0008EDD9    mov         edx,dword ptr [eax]
 0008EDDB    xor         eax,eax
 0008EDDD    mov         al,byte ptr [esi]
 0008EDDF    cmp         eax,4
>0008EDE2    jne         0008EE0C
 0008EDE4    mov         ecx,dword ptr [ebp-650]
 0008EDEA    and         ecx,0FFF
 0008EDF0    cmp         ecx,9
>0008EDF3    jne         0008EDFA
 0008EDF5    mov         eax,8
 0008EDFA    mov         ecx,dword ptr [ebp-8]
 0008EDFD    mov         dword ptr [ecx],0FFFFFFFD
 0008EE03    sub         dword ptr [ebp-2C],4
 0008EE07    inc         dword ptr [ebp-24]
>0008EE0A    jmp         0008EE22
 0008EE0C    cmp         eax,1
>0008EE0F    jne         0008EE22
 0008EE11    cmp         dword ptr [ebp-10],0
>0008EE15    jne         0008EE22
 0008EE17    cmp         dword ptr [ebp+8],0
>0008EE1B    je          0008EE22
 0008EE1D    mov         eax,3
 0008EE22    push        0
 0008EE24    lea         ecx,[ebp-50]
 0008EE27    push        ecx
 0008EE28    mov         ecx,dword ptr [ebp+8]
 0008EE2B    push        ecx
 0008EE2C    lea         ecx,[ebp-30]
 0008EE2F    push        ecx
 0008EE30    push        eax
 0008EE31    push        0
 0008EE33    mov         eax,[000B569C]
 0008EE38    push        eax
 0008EE39    push        edx
 0008EE3A    mov         eax,dword ptr [ebp-4]
 0008EE3D    push        eax
 0008EE3E    mov         eax,dword ptr [eax]
 0008EE40    call        dword ptr [eax+18]
 0008EE43    test        eax,eax
>0008EE45    je          0008EE4F
 0008EE47    lea         edx,[ebp-50]
 0008EE4A    call        DispatchInvokeError
 0008EE4F    mov         ebx,dword ptr [ebp-14]
 0008EE52    test        ebx,ebx
>0008EE54    je          0008EE76
 0008EE56    dec         ebx
 0008EE57    lea         eax,[ebp+ebx*8-250]
 0008EE5E    mov         edx,dword ptr [eax+4]
 0008EE61    test        edx,edx
>0008EE63    je          0008EE72
 0008EE65    mov         ecx,dword ptr [eax]
 0008EE67    mov         eax,edx
 0008EE69    mov         edx,eax
 0008EE6B    mov         eax,ecx
 0008EE6D    call        OleStrToStrVar
 0008EE72    test        ebx,ebx
>0008EE74    jne         0008EE56
 0008EE76    xor         eax,eax
 0008EE78    pop         edx
 0008EE79    pop         ecx
 0008EE7A    pop         ecx
 0008EE7B    mov         dword ptr fs:[eax],edx
 0008EE7E    push        8EEA4
 0008EE83    mov         ebx,dword ptr [ebp-14]
 0008EE86    test        ebx,ebx
>0008EE88    je          0008EE9C
 0008EE8A    dec         ebx
 0008EE8B    mov         eax,dword ptr [ebp+ebx*8-250]
 0008EE92    push        eax
 0008EE93    call        oleaut32.SysFreeString
 0008EE98    test        ebx,ebx
>0008EE9A    jne         0008EE8A
 0008EE9C    ret
>0008EE9D    jmp         @HandleFinally
>0008EEA2    jmp         0008EE83
 0008EEA4    xor         eax,eax
 0008EEA6    pop         edx
 0008EEA7    pop         ecx
 0008EEA8    pop         ecx
 0008EEA9    mov         dword ptr fs:[eax],edx
 0008EEAC    push        8EEC7
 0008EEB1    lea         eax,[ebp-50]
 0008EEB4    mov         edx,dword ptr ds:[1DA9C];tagEXCEPINFO
 0008EEBA    call        @FinalizeRecord
 0008EEBF    ret
>0008EEC0    jmp         @HandleFinally
>0008EEC5    jmp         0008EEB1
 0008EEC7    pop         edi
 0008EEC8    pop         esi
 0008EEC9    pop         ebx
 0008EECA    mov         esp,ebp
 0008EECC    pop         ebp
 0008EECD    ret         8
*}
end;

//0008EED0
procedure RaiseNameException;
begin
{*
 0008EED0    push        ebp
 0008EED1    mov         ebp,esp
 0008EED3    add         esp,0FFFFFFF4
 0008EED6    xor         eax,eax
 0008EED8    mov         dword ptr [ebp-0C],eax
 0008EEDB    xor         eax,eax
 0008EEDD    push        ebp
 0008EEDE    push        8EF33
 0008EEE3    push        dword ptr fs:[eax]
 0008EEE6    mov         dword ptr fs:[eax],esp
 0008EEE9    mov         eax,dword ptr [ebp+8]
 0008EEEC    mov         eax,dword ptr [eax-4]
 0008EEEF    mov         dword ptr [ebp-8],eax
 0008EEF2    mov         byte ptr [ebp-4],6
 0008EEF6    lea         eax,[ebp-8]
 0008EEF9    push        eax
 0008EEFA    push        0
 0008EEFC    lea         edx,[ebp-0C]
 0008EEFF    mov         eax,[000B5A90];^SNoMethod:TResStringRec
 0008EF04    call        LoadResString
 0008EF09    mov         ecx,dword ptr [ebp-0C]
 0008EF0C    mov         dl,1
 0008EF0E    mov         eax,[0008E688];EOleError
 0008EF13    call        Exception.CreateFmt
 0008EF18    call        @RaiseExcept
 0008EF1D    xor         eax,eax
 0008EF1F    pop         edx
 0008EF20    pop         ecx
 0008EF21    pop         ecx
 0008EF22    mov         dword ptr fs:[eax],edx
 0008EF25    push        8EF3A
 0008EF2A    lea         eax,[ebp-0C]
 0008EF2D    call        @LStrClr
 0008EF32    ret
>0008EF33    jmp         @HandleFinally
>0008EF38    jmp         0008EF2A
 0008EF3A    mov         esp,ebp
 0008EF3C    pop         ebp
 0008EF3D    ret
*}
end;

//0008EF40
procedure GetIDsOfNames(const Dispatch:IDispatch; Names:PChar; NameCount:Integer; DispIDs:PDispIDList);
begin
{*
 0008EF40    push        ebp
 0008EF41    mov         ebp,esp
 0008EF43    add         esp,0FFFFFFE4
 0008EF46    push        ebx
 0008EF47    push        esi
 0008EF48    push        edi
 0008EF49    mov         dword ptr [ebp-0C],ecx
 0008EF4C    mov         dword ptr [ebp-4],edx
 0008EF4F    mov         dword ptr [ebp-1C],eax
 0008EF52    mov         ebx,dword ptr [ebp-4]
 0008EF55    xor         edi,edi
 0008EF57    mov         dword ptr [ebp-8],esp
 0008EF5A    mov         eax,dword ptr [ebp-0C]
 0008EF5D    inc         eax
 0008EF5E    shl         eax,2
 0008EF61    sub         esp,eax
 0008EF63    lea         eax,[ebp-10]
 0008EF66    mov         dword ptr [eax],esp
 0008EF68    mov         eax,ebx
 0008EF6A    call        StrLen
 0008EF6F    mov         esi,eax
 0008EF71    push        0
 0008EF73    push        0
 0008EF75    push        esi
 0008EF76    push        ebx
 0008EF77    push        0
 0008EF79    push        0
 0008EF7B    call        kernel32.MultiByteToWideChar
 0008EF80    inc         eax
 0008EF81    mov         dword ptr [ebp-14],eax
 0008EF84    mov         eax,dword ptr [ebp-14]
 0008EF87    add         eax,eax
 0008EF89    add         eax,3
 0008EF8C    and         eax,0FFFFFFFC
 0008EF8F    sub         esp,eax
 0008EF91    lea         eax,[ebp-18]
 0008EF94    mov         dword ptr [eax],esp
 0008EF96    test        edi,edi
>0008EF98    jne         0008EFA4
 0008EF9A    mov         eax,dword ptr [ebp-10]
 0008EF9D    mov         edx,dword ptr [ebp-18]
 0008EFA0    mov         dword ptr [eax],edx
>0008EFA2    jmp         0008EFB2
 0008EFA4    mov         eax,dword ptr [ebp-0C]
 0008EFA7    sub         eax,edi
 0008EFA9    mov         edx,dword ptr [ebp-10]
 0008EFAC    mov         ecx,dword ptr [ebp-18]
 0008EFAF    mov         dword ptr [edx+eax*4],ecx
 0008EFB2    mov         eax,dword ptr [ebp-14]
 0008EFB5    push        eax
 0008EFB6    mov         eax,dword ptr [ebp-18]
 0008EFB9    push        eax
 0008EFBA    push        esi
 0008EFBB    push        ebx
 0008EFBC    push        0
 0008EFBE    push        0
 0008EFC0    call        kernel32.MultiByteToWideChar
 0008EFC5    mov         eax,dword ptr [ebp-18]
 0008EFC8    mov         edx,dword ptr [ebp-14]
 0008EFCB    mov         word ptr [eax+edx*2-2],0
 0008EFD2    inc         esi
 0008EFD3    add         ebx,esi
 0008EFD5    inc         edi
 0008EFD6    cmp         edi,dword ptr [ebp-0C]
>0008EFD9    jne         0008EF68
 0008EFDB    mov         eax,dword ptr [ebp+8]
 0008EFDE    push        eax
 0008EFDF    call        kernel32.GetThreadLocale
 0008EFE4    push        eax
 0008EFE5    mov         eax,dword ptr [ebp-0C]
 0008EFE8    push        eax
 0008EFE9    mov         eax,dword ptr [ebp-10]
 0008EFEC    push        eax
 0008EFED    mov         eax,[000B569C]
 0008EFF2    push        eax
 0008EFF3    mov         eax,dword ptr [ebp-1C]
 0008EFF6    push        eax
 0008EFF7    mov         eax,dword ptr [eax]
 0008EFF9    call        dword ptr [eax+14]
 0008EFFC    cmp         eax,80020006
>0008F001    jne         0008F00C
 0008F003    push        ebp
 0008F004    call        RaiseNameException
 0008F009    pop         ecx
>0008F00A    jmp         0008F011
 0008F00C    call        OleCheck
 0008F011    mov         esp,dword ptr [ebp-8]
 0008F014    pop         edi
 0008F015    pop         esi
 0008F016    pop         ebx
 0008F017    mov         esp,ebp
 0008F019    pop         ebp
 0008F01A    ret         4
*}
end;

//0008F020
procedure RaiseException;
begin
{*
 0008F020    push        ebp
 0008F021    mov         ebp,esp
 0008F023    push        0
 0008F025    xor         eax,eax
 0008F027    push        ebp
 0008F028    push        8F06A
 0008F02D    push        dword ptr fs:[eax]
 0008F030    mov         dword ptr fs:[eax],esp
 0008F033    lea         edx,[ebp-4]
 0008F036    mov         eax,[000B5B34];^SVarNotObject:TResStringRec
 0008F03B    call        LoadResString
 0008F040    mov         ecx,dword ptr [ebp-4]
 0008F043    mov         dl,1
 0008F045    mov         eax,[0008E688];EOleError
 0008F04A    call        Exception.Create
 0008F04F    call        @RaiseExcept
 0008F054    xor         eax,eax
 0008F056    pop         edx
 0008F057    pop         ecx
 0008F058    pop         ecx
 0008F059    mov         dword ptr fs:[eax],edx
 0008F05C    push        8F071
 0008F061    lea         eax,[ebp-4]
 0008F064    call        @LStrClr
 0008F069    ret
>0008F06A    jmp         @HandleFinally
>0008F06F    jmp         0008F061
 0008F071    pop         ecx
 0008F072    pop         ebp
 0008F073    ret
*}
end;

//0008F074
procedure VarDispInvoke(Result:PVariant; const Instance:Variant; CallDesc:PCallDesc; Params:Pointer); cdecl;
begin
{*
 0008F074    push        ebp
 0008F075    mov         ebp,esp
 0008F077    add         esp,0FFFFFEFC
 0008F07D    push        ebx
 0008F07E    push        esi
 0008F07F    mov         ebx,dword ptr [ebp+10]
 0008F082    mov         eax,dword ptr [ebp+0C]
 0008F085    mov         esi,dword ptr [ebp+8]
 0008F088    mov         dx,word ptr [eax]
 0008F08B    cmp         dx,9
>0008F08F    jne         0008F099
 0008F091    mov         eax,dword ptr [eax+8]
 0008F094    mov         dword ptr [ebp-4],eax
>0008F097    jmp         0008F0AF
 0008F099    cmp         dx,4009
>0008F09E    jne         0008F0AA
 0008F0A0    mov         eax,dword ptr [eax+8]
 0008F0A3    mov         eax,dword ptr [eax]
 0008F0A5    mov         dword ptr [ebp-4],eax
>0008F0A8    jmp         0008F0AF
 0008F0AA    call        RaiseException
 0008F0AF    lea         eax,[ebp-104]
 0008F0B5    push        eax
 0008F0B6    xor         ecx,ecx
 0008F0B8    mov         cl,byte ptr [ebx+2]
 0008F0BB    inc         ecx
 0008F0BC    xor         eax,eax
 0008F0BE    mov         al,byte ptr [ebx+1]
 0008F0C1    lea         edx,[ebx+eax+3]
 0008F0C5    mov         eax,dword ptr [ebp-4]
 0008F0C8    call        GetIDsOfNames
 0008F0CD    test        esi,esi
>0008F0CF    je          0008F0D8
 0008F0D1    mov         eax,esi
 0008F0D3    call        @VarClear
 0008F0D8    lea         eax,[ebp+14]
 0008F0DB    push        eax
 0008F0DC    push        esi
 0008F0DD    lea         ecx,[ebp-104]
 0008F0E3    mov         edx,ebx
 0008F0E5    mov         eax,dword ptr [ebp-4]
 0008F0E8    call        DispatchInvoke
 0008F0ED    pop         esi
 0008F0EE    pop         ebx
 0008F0EF    mov         esp,ebp
 0008F0F1    pop         ebp
 0008F0F2    ret
*}
end;

//0008F0F4
procedure DispCallError(Status:Integer; var ExcepInfo:TExcepInfo; ErrorAddr:Pointer; FinalizeExcepInfo:Boolean);
begin
{*
 0008F0F4    push        ebp
 0008F0F5    mov         ebp,esp
 0008F0F7    push        0
 0008F0F9    push        0
 0008F0FB    push        0
 0008F0FD    push        0
 0008F0FF    push        ebx
 0008F100    push        esi
 0008F101    mov         dword ptr [ebp-4],ecx
 0008F104    mov         ebx,edx
 0008F106    xor         edx,edx
 0008F108    push        ebp
 0008F109    push        8F1B9
 0008F10E    push        dword ptr fs:[edx]
 0008F111    mov         dword ptr fs:[edx],esp
 0008F114    cmp         eax,80020009
>0008F119    jne         0008F172
 0008F11B    mov         eax,dword ptr [ebx+1C]
 0008F11E    push        eax
 0008F11F    lea         eax,[ebp-8]
 0008F122    mov         edx,dword ptr [ebx+4]
 0008F125    call        @LStrFromWStr
 0008F12A    mov         eax,dword ptr [ebp-8]
 0008F12D    push        eax
 0008F12E    lea         eax,[ebp-0C]
 0008F131    mov         edx,dword ptr [ebx+0C]
 0008F134    call        @LStrFromWStr
 0008F139    mov         eax,dword ptr [ebp-0C]
 0008F13C    push        eax
 0008F13D    mov         eax,dword ptr [ebx+10]
 0008F140    push        eax
 0008F141    lea         eax,[ebp-10]
 0008F144    mov         edx,dword ptr [ebx+8]
 0008F147    call        @LStrFromWStr
 0008F14C    mov         ecx,dword ptr [ebp-10]
 0008F14F    mov         dl,1
 0008F151    mov         eax,[0008E73C];EOleException
 0008F156    call        EOleException.Create
 0008F15B    mov         esi,eax
 0008F15D    cmp         byte ptr [ebp+8],0
>0008F161    je          0008F185
 0008F163    mov         eax,ebx
 0008F165    mov         edx,dword ptr ds:[1DA9C];tagEXCEPINFO
 0008F16B    call        @Finalize
>0008F170    jmp         0008F185
 0008F172    push        eax
 0008F173    push        0
 0008F175    xor         ecx,ecx
 0008F177    mov         dl,1
 0008F179    mov         eax,[0008E6E0];EOleSysError
 0008F17E    call        EOleSysError.Create
 0008F183    mov         esi,eax
 0008F185    cmp         dword ptr [ebp-4],0
>0008F189    je          0008F197
 0008F18B    push        dword ptr [ebp-4]
 0008F18E    mov         eax,esi
>0008F190    jmp         @RaiseExcept
>0008F195    jmp         0008F19E
 0008F197    mov         eax,esi
 0008F199    call        @RaiseExcept
 0008F19E    xor         eax,eax
 0008F1A0    pop         edx
 0008F1A1    pop         ecx
 0008F1A2    pop         ecx
 0008F1A3    mov         dword ptr fs:[eax],edx
 0008F1A6    push        8F1C0
 0008F1AB    lea         eax,[ebp-10]
 0008F1AE    mov         edx,3
 0008F1B3    call        @LStrArrayClr
 0008F1B8    ret
>0008F1B9    jmp         @HandleFinally
>0008F1BE    jmp         0008F1AB
 0008F1C0    pop         esi
 0008F1C1    pop         ebx
 0008F1C2    mov         esp,ebp
 0008F1C4    pop         ebp
 0008F1C5    ret         4
*}
end;

//0008F1C8
procedure DispatchInvokeError(Status:Integer; const ExcepInfo:TExcepInfo);
begin
{*
 0008F1C8    push        0
 0008F1CA    xor         ecx,ecx
 0008F1CC    call        DispCallError
 0008F1D1    ret
*}
end;

//0008F1D4
procedure ClearExcepInfo(var ExcepInfo:TExcepInfo);
begin
{*
 0008F1D4    xor         ecx,ecx
 0008F1D6    mov         edx,20
 0008F1DB    call        @FillChar
 0008F1E0    ret
*}
end;

//0008F1E4
procedure DispCall(const Dispatch:IDispatch; CallDesc:PCallDesc; DispID:Integer; NamedArgDispIDs:Pointer; Params:Pointer; Result:Pointer); stdcall;
begin
{*
 0008F1E4    push        ebp
 0008F1E5    mov         ebp,esp
 0008F1E7    add         esp,0FFFFFFD0
 0008F1EA    push        ebx
 0008F1EB    push        esi
 0008F1EC    push        edi
 0008F1ED    mov         ebx,dword ptr [ebp+0C]
 0008F1F0    xor         edx,edx
 0008F1F2    mov         edi,esp
 0008F1F4    movzx       ecx,byte ptr [ebx+1]
 0008F1F8    mov         dword ptr [ebp-8],ecx
 0008F1FB    test        ecx,ecx
>0008F1FD    je          0008F24E
 0008F1FF    add         ebx,3
 0008F202    mov         esi,dword ptr [ebp+18]
 0008F205    movzx       eax,byte ptr [ebx]
 0008F208    test        al,80
>0008F20A    jne         0008F237
 0008F20C    cmp         al,0C
>0008F20F    je          0008F227
 0008F211    cmp         al,5
>0008F214    jb          0008F23F
 0008F216    cmp         al,7
>0008F219    ja          0008F23F
 0008F21B    push        dword ptr [esi+4]
 0008F21E    push        dword ptr [esi]
 0008F220    push        edx
 0008F221    push        eax
 0008F222    add         esi,8
>0008F225    jmp         0008F247
 0008F227    push        dword ptr [esi+0C]
 0008F22A    push        dword ptr [esi+8]
 0008F22D    push        dword ptr [esi+4]
 0008F230    push        dword ptr [esi]
 0008F232    add         esi,10
>0008F235    jmp         0008F247
 0008F237    and         al,7F
 0008F23A    or          eax,4000
 0008F23F    push        edx
 0008F240    push        dword ptr [esi]
 0008F242    push        edx
 0008F243    push        eax
 0008F244    add         esi,4
 0008F247    inc         ebx
 0008F248    dec         ecx
>0008F249    jne         0008F205
 0008F24B    mov         ebx,dword ptr [ebp+0C]
 0008F24E    mov         dword ptr [ebp-10],esp
 0008F251    movzx       eax,byte ptr [ebx+2]
 0008F255    mov         dword ptr [ebp-4],eax
 0008F258    test        eax,eax
>0008F25A    je          0008F266
 0008F25C    mov         esi,dword ptr [ebp+14]
 0008F25F    push        dword ptr [esi+eax*4-4]
 0008F263    dec         eax
>0008F264    jne         0008F25F
 0008F266    movzx       ecx,byte ptr [ebx]
 0008F269    cmp         ecx,4
>0008F26C    jne         0008F284
 0008F26E    push        0FD
 0008F270    inc         dword ptr [ebp-4]
 0008F273    cmp         byte ptr [ebx+3],9
>0008F277    je          0008F27F
 0008F279    cmp         byte ptr [ebx+3],0D
>0008F27D    jne         0008F284
 0008F27F    mov         ecx,8
 0008F284    mov         dword ptr [ebp-0C],esp
 0008F287    push        edx
 0008F288    lea         eax,[ebp-30]
 0008F28B    push        eax
 0008F28C    push        ecx
 0008F28D    push        edx
 0008F28E    call        ClearExcepInfo
 0008F293    pop         edx
 0008F294    pop         ecx
 0008F295    push        dword ptr [ebp+1C]
 0008F298    lea         eax,[ebp-10]
 0008F29B    push        eax
 0008F29C    push        ecx
 0008F29D    push        edx
 0008F29E    push        0B4340
 0008F2A3    push        dword ptr [ebp+10]
 0008F2A6    mov         eax,dword ptr [ebp+8]
 0008F2A9    push        eax
 0008F2AA    mov         eax,dword ptr [eax]
 0008F2AC    call        dword ptr [eax+18]
 0008F2AF    test        eax,eax
>0008F2B1    je          0008F2C1
 0008F2B3    lea         edx,[ebp-30]
 0008F2B6    mov         cl,1
 0008F2B8    push        ecx
 0008F2B9    mov         ecx,dword ptr [ebp+4]
>0008F2BC    jmp         DispCallError
 0008F2C1    mov         esp,edi
 0008F2C3    pop         edi
 0008F2C4    pop         esi
 0008F2C5    pop         ebx
 0008F2C6    mov         esp,ebp
 0008F2C8    pop         ebp
 0008F2C9    ret         18
*}
end;

//0008F2CC
procedure DispCallByID(Result:Pointer; const Dispatch:IDispatch; DispDesc:PDispDesc; Params:Pointer); cdecl;
begin
{*
 0008F2CC    push        ebp
 0008F2CD    mov         ebp,esp
 0008F2CF    push        ebx
 0008F2D0    mov         ebx,dword ptr [ebp+10]
 0008F2D3    xor         eax,eax
 0008F2D5    push        eax
 0008F2D6    push        eax
 0008F2D7    push        eax
 0008F2D8    push        eax
 0008F2D9    mov         eax,esp
 0008F2DB    push        eax
 0008F2DC    lea         eax,[ebp+14]
 0008F2DF    push        eax
 0008F2E0    push        eax
 0008F2E1    push        dword ptr [ebx]
 0008F2E3    lea         eax,[ebx+5]
 0008F2E6    push        eax
 0008F2E7    push        dword ptr [ebp+0C]
 0008F2EA    call        DispCall
 0008F2EF    movzx       eax,byte ptr [ebx+4]
 0008F2F3    mov         ebx,dword ptr [ebp+8]
 0008F2F6    jmp         dword ptr [eax*4+8F2FD]
 0008F2F6    dd          0008F3A2
 0008F2F6    dd          0008F3A2
 0008F2F6    dd          0008F39E
 0008F2F6    dd          0008F39E
 0008F2F6    dd          0008F341
 0008F2F6    dd          0008F347
 0008F2F6    dd          0008F34D
 0008F2F6    dd          0008F347
 0008F2F6    dd          0008F353
 0008F2F6    dd          0008F367
 0008F2F6    dd          0008F3A2
 0008F2F6    dd          0008F39E
 0008F2F6    dd          0008F37B
 0008F2F6    dd          0008F367
 0008F2F6    dd          0008F3A2
 0008F2F6    dd          0008F3A2
 0008F2F6    dd          0008F39E
 0008F341    fld         dword ptr [esp+8]
>0008F345    jmp         0008F3A2
 0008F347    fld         qword ptr [esp+8]
>0008F34B    jmp         0008F3A2
 0008F34D    fild        qword ptr [esp+8]
>0008F351    jmp         0008F3A2
 0008F353    mov         eax,dword ptr [ebx]
 0008F355    test        eax,eax
>0008F357    je          0008F35F
 0008F359    push        eax
 0008F35A    call        oleaut32.SysFreeString
 0008F35F    mov         eax,dword ptr [esp+8]
 0008F363    mov         dword ptr [ebx],eax
>0008F365    jmp         0008F3A2
 0008F367    mov         eax,dword ptr [ebx]
 0008F369    test        eax,eax
>0008F36B    je          0008F373
 0008F36D    push        eax
 0008F36E    mov         eax,dword ptr [eax]
 0008F370    call        dword ptr [eax+8]
 0008F373    mov         eax,dword ptr [esp+8]
 0008F377    mov         dword ptr [ebx],eax
>0008F379    jmp         0008F3A2
 0008F37B    mov         eax,ebx
 0008F37D    call        @VarClear
 0008F382    mov         eax,dword ptr [esp]
 0008F385    mov         dword ptr [ebx],eax
 0008F387    mov         eax,dword ptr [esp+4]
 0008F38B    mov         dword ptr [ebx+4],eax
 0008F38E    mov         eax,dword ptr [esp+8]
 0008F392    mov         dword ptr [ebx+8],eax
 0008F395    mov         eax,dword ptr [esp+0C]
 0008F399    mov         dword ptr [ebx+0C],eax
>0008F39C    jmp         0008F3A2
 0008F39E    mov         eax,dword ptr [esp+8]
 0008F3A2    add         esp,10
 0008F3A5    pop         ebx
 0008F3A6    pop         ebp
 0008F3A7    ret
*}
end;

//0008F3A8
procedure InitComObj;
begin
{*
 0008F3A8    cmp         dword ptr ds:[0B6B28],0
>0008F3AF    je          0008F3B7
 0008F3B1    call        dword ptr ds:[0B6B28]
 0008F3B7    cmp         dword ptr ds:[0B55BC],0FFFFFFFF
>0008F3BE    je          0008F40C
 0008F3C0    cmp         dword ptr ds:[0B55A8],0
>0008F3C7    je          0008F40C
 0008F3C9    mov         eax,[000B55BC]
 0008F3CE    push        eax
 0008F3CF    push        0
 0008F3D1    call        dword ptr ds:[0B55A8]
 0008F3D7    call        Succeeded
 0008F3DC    mov         [000B6B2C],al
 0008F3E1    mov         eax,[000B5754]
 0008F3E6    cmp         byte ptr [eax],0
>0008F3E9    jne         0008F401
 0008F3EB    test        byte ptr ds:[0B55BC],2
>0008F3F2    jne         0008F401
 0008F3F4    cmp         dword ptr ds:[0B55BC],0
>0008F3FB    je          0008F401
 0008F3FD    xor         eax,eax
>0008F3FF    jmp         0008F403
 0008F401    mov         al,1
 0008F403    mov         edx,dword ptr ds:[0B5754]
 0008F409    mov         byte ptr [edx],al
 0008F40B    ret
 0008F40C    push        0
 0008F40E    call        ole32.CoInitialize
 0008F413    call        Succeeded
 0008F418    mov         [000B6B2C],al
 0008F41D    ret
*}
end;

Initialization
//0008F4A0
{*
 0008F4A0    sub         dword ptr ds:[0B6B1C],1
>0008F4A7    jae         0008F4F0
 0008F4A9    call        LoadComExProcs
 0008F4AE    mov         eax,[000B5A30]
 0008F4B3    mov         dword ptr [eax],8F074;VarDispInvoke
 0008F4B9    mov         eax,[000B56D4]
 0008F4BE    mov         dword ptr [eax],8F2CC;DispCallByID
 0008F4C4    mov         eax,[000B5AB0];SafeCallErrorProc:Pointer
 0008F4C9    mov         dword ptr [eax],8EAD4;SafeCallError
 0008F4CF    mov         eax,[000B563C];IsLibrary:Boolean
 0008F4D4    cmp         byte ptr [eax],0
>0008F4D7    jne         0008F4F0
 0008F4D9    mov         eax,[000B58FC];InitProc:Pointer
 0008F4DE    mov         eax,dword ptr [eax]
 0008F4E0    mov         [000B6B28],eax
 0008F4E5    mov         eax,[000B58FC];InitProc:Pointer
 0008F4EA    mov         dword ptr [eax],8F3A8;InitComObj
 0008F4F0    ret
*}
Finalization
//0008F420
{*
 0008F420    push        ebp
 0008F421    mov         ebp,esp
 0008F423    xor         eax,eax
 0008F425    push        ebp
 0008F426    push        8F496
 0008F42B    push        dword ptr fs:[eax]
 0008F42E    mov         dword ptr fs:[eax],esp
 0008F431    inc         dword ptr ds:[0B6B1C]
>0008F437    jne         0008F488
 0008F439    mov         byte ptr ds:[0B6B20],1
 0008F440    mov         eax,[000B6B24]
 0008F445    call        TObject.Free
 0008F44A    mov         eax,[000B5AB0];SafeCallErrorProc:Pointer
 0008F44F    xor         edx,edx
 0008F451    mov         dword ptr [eax],edx
 0008F453    mov         eax,[000B56D4]
 0008F458    xor         edx,edx
 0008F45A    mov         dword ptr [eax],edx
 0008F45C    mov         eax,[000B5A30]
 0008F461    xor         edx,edx
 0008F463    mov         dword ptr [eax],edx
 0008F465    cmp         byte ptr ds:[0B6B2C],0
>0008F46C    je          0008F473
 0008F46E    call        ole32.CoUninitialize
 0008F473    mov         eax,0B55C0
 0008F478    mov         ecx,4
 0008F47D    mov         edx,dword ptr ds:[110CC];String
 0008F483    call        @FinalizeArray
 0008F488    xor         eax,eax
 0008F48A    pop         edx
 0008F48B    pop         ecx
 0008F48C    pop         ecx
 0008F48D    mov         dword ptr fs:[eax],edx
 0008F490    push        8F49D
 0008F495    ret
>0008F496    jmp         @HandleFinally
>0008F49B    jmp         0008F495
 0008F49D    pop         ebp
 0008F49E    ret
*}
end.