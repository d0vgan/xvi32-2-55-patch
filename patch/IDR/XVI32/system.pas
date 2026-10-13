//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit system;

interface

uses
  SysUtils, Classes;

type
  Boolean = (False, True);
  TObject = class()
    function ClassType:TClass;//00012D6C
    function ClassName:ShortString;//00012D70
    function ClassNameIs(const Name:AnsiString):Boolean;//00012D84
    function ClassParent:TClass;//00012DAC
    constructor Create;//00012DF4
    procedure Free;//00012E24
    function InitInstance(Instance:Pointer):TObject;//00012E30
    function GetInterface(const IID:TGUID; var Obj:void ):Boolean;//00012EB8
    function GetInterfaceEntry(const IID:TGUID):PInterfaceEntry;//00012F58
    function ClassInfo:Pointer;//00013030
    function MethodAddress(const Name:ShortString):Pointer;//00013070
    function MethodName(Address:Pointer):ShortString;//000130C0
    function FieldAddress(const Name:ShortString):Pointer;//00013100
  end;
  TInterfacedObject = class(TObject)
  public
    FRefCount:Integer;//f4
    function QueryInterface(const IID:TGUID; var Obj:Pointer):HRESULT; stdcall;//00015668
    function _AddRef:Integer; stdcall;//00015690
    function _Release:Integer; stdcall;//000156A4
  end;
    function CloseHandle:LongBool; stdcall;//00011238
    function CreateFileA(dwDesiredAccess:Longword; dwShareMode:Longword; lpSecurityAttributes:PSecurityAttributes; dwCreationDisposition:Longword; dwFlagsAndAttributes:Longword; hTemplateFile:Longword):Longword; stdcall;//00011240
    function GetFileType:Longword; stdcall;//00011248
    function GetFileSize(lpFileSizeHigh:Pointer):Longword; stdcall;//00011250
    function GetStdHandle:Longword; stdcall;//00011258
    procedure RaiseException(dwExceptionFlags:Longword; nNumberOfArguments:Longword; lpArguments:PDWORD); stdcall;//00011260
    function ReadFile(var Buffer:void ; nNumberOfBytesToRead:Longword; var lpNumberOfBytesRead:Longword; lpOverlapped:POverlapped):LongBool; stdcall;//00011268
    procedure RtlUnwind;//00011270
    function SetEndOfFile:LongBool; stdcall;//00011278
    function SetFilePointer(lDistanceToMove:Longint; lpDistanceToMoveHigh:Pointer; dwMoveMethod:Longword):Longword; stdcall;//00011280
    function WriteFile(const Buffer:void ; nNumberOfBytesToWrite:Longword; var lpNumberOfBytesWritten:Longword; lpOverlapped:POverlapped):LongBool; stdcall;//00011288
    procedure ExitProcess; stdcall;//00011290
    function MessageBoxA(lpText:PAnsiChar; lpCaption:PAnsiChar; uType:Longword):Integer; stdcall;//00011298
    function FreeLibrary:LongBool; stdcall;//000112A0
    function GetCommandLineA:PAnsiChar;//000112A8
    function GetLastError:Integer;//000112B0
    function GetLocaleInfoA(LCType:Longword; lpLCData:PAnsiChar; cchData:Integer):Integer; stdcall;//000112B8
    function GetModuleFileNameA(lpFilename:PAnsiChar; nSize:Longword):Longword; stdcall;//000112C0
    procedure GetStartupInfoA; stdcall;//000112C8
    function GetThreadLocale:Integer;//000112D0
    function LoadLibraryExA(hFile:Longword; dwFlags:Longword):HINST; stdcall;//000112D8
    function LoadStringA(uID:Longword; lpBuffer:PAnsiChar; nBufferMax:Integer):Integer; stdcall;//000112E0
    function lstrcpyA(lpString2:PAnsiChar):PAnsiChar; stdcall;//000112E8
    function lstrlenA:Integer; stdcall;//000112F0
    function MultiByteToWideChar(Flags:Integer; MBStr:PAnsiChar; MBCount:Integer; WCStr:PWideChar; WCCount:Integer):Integer; stdcall;//000112F8
    function RegCloseKey:Integer; stdcall;//00011300
    function RegOpenKeyExA(lpSubKey:PAnsiChar; ulOptions:Longword; samDesired:Longword; var phkResult:HKEY):Longint; stdcall;//00011308
    function RegQueryValueExA(lpValueName:PAnsiChar; lpReserved:Pointer; lpType:PDWORD; lpData:PByte; lpcbData:PDWORD):Longint; stdcall;//00011310
    function WideCharToMultiByte(Flags:Integer; WCStr:PWideChar; WCCount:Integer; MBStr:PAnsiChar; MBCount:Integer; DefaultChar:PAnsiChar; UsedDefaultChar:Pointer):Integer; stdcall;//00011318
    function VirtualQuery(var lpBuffer:TMemInfo; dwLength:Integer):Integer; stdcall;//00011320
    function SysAllocStringLen(Len:Integer):PWideChar; stdcall;//00011328
    function SysReAllocStringLen(psz:PWideChar; len:Integer):Integer; stdcall;//00011330
    procedure SysFreeString; stdcall;//00011338
    function SysStringLen:Integer; stdcall;//00011340
    function VariantClear:HRESULT; stdcall;//00011348
    function VariantCopyInd(const vargSrc:OleVariant):HRESULT; stdcall;//00011350
    function VariantChangeTypeEx(const vargSrc:OleVariant; lcid:DWORD; wFlags:Word; vt:Word):HRESULT; stdcall;//00011358
    function InterlockedIncrement:Integer; stdcall;//00011360
    function InterlockedDecrement:Integer; stdcall;//00011368
    function GetCmdShow:Integer;//00011370
    function LocalAlloc(uBytes:Longword):Longword; stdcall;//00011394
    function LocalFree:Pointer; stdcall;//0001139C
    function VirtualAlloc(dwSize:Integer; flAllocationType:Integer; flProtect:Integer):Pointer; stdcall;//000113A4
    function VirtualFree(dwSize:Integer; dwFreeType:Integer):LongBool; stdcall;//000113AC
    procedure InitializeCriticalSection; stdcall;//000113B4
    procedure EnterCriticalSection; stdcall;//000113BC
    procedure LeaveCriticalSection; stdcall;//000113C4
    procedure DeleteCriticalSection; stdcall;//000113CC
    function GetBlockDesc:PBlockDesc;//000113D4
    procedure MakeEmpty(bd:PBlockDesc);//00011424
    function AddBlockAfter(prev:PBlockDesc; const b:TBlock):Boolean;//0001142C
    procedure DeleteBlock(bd:PBlockDesc);//0001145C
    function MergeBlockAfter(prev:PBlockDesc; const b:TBlock):TBlock;//00011474
    function RemoveBlock(bd:PBlockDesc; const b:TBlock):Boolean;//000114E8
    function GetSpace(minSize:Integer):TBlock;//00011578
    function GetSpaceAt(addr:PAnsiChar; minSize:Integer):TBlock;//000115DC
    function FreeSpace(addr:Pointer; maxSize:Integer):TBlock;//00011654
    function Commit(addr:Pointer; minSize:Integer):TBlock;//0001170C
    function Decommit(addr:Pointer; maxSize:Integer):TBlock;//000117A0
    function GetCommitted(minSize:Integer):TBlock;//00011820
    function GetCommittedAt(addr:PAnsiChar; minSize:Integer):TBlock;//000118B0
    function FreeCommitted(addr:PAnsiChar; maxSize:Integer):TBlock;//000119D4
    function InitAllocator:Boolean;//00011A60
    procedure UninitAllocator;//00011B24
    procedure DeleteFree(f:PFree);//00011C04
    function FindCommitted(addr:PAnsiChar):PBlockDesc;//00011C68
    procedure FillBeforeGap(a:PAnsiChar; size:Integer);//00011C98
    procedure InternalFreeMem(a:PAnsiChar);//00011CC8
    procedure FillAfterGap(a:PAnsiChar; size:Integer);//00011CEC
    function FillerSizeBeforeGap(a:PAnsiChar):Integer;//00011D14
    function FillerSizeAfterGap(a:PAnsiChar):Integer;//00011D84
    function DecommitFree(a:PAnsiChar; size:Integer):Boolean;//00011DBC
    procedure InsertFree(a:Pointer; size:Integer);//00011E54
    procedure FreeCurAlloc;//00011EDC
    function MergeCommit(b:TBlock):Boolean;//00011F28
    function NewCommit(minSize:Integer):Boolean;//00011FB4
    function NewCommitAt(addr:Pointer; minSize:Integer):Boolean;//00011FE0
    function SearchSmallBlocks(size:Integer):PFree;//00012014
    function TryHarder(size:Integer):Pointer;//00012040
    function SysGetMem(Size:Integer):Pointer;//00012134
    function SysFreeMem(P:Pointer):Integer;//000122BC
    function ResizeInPlace(p:Pointer; newSize:Integer):Boolean;//00012460
    function SysReallocMem(P:Pointer; Size:Integer):Pointer;//00012630
    function @GetMem(size:Integer):Pointer;//000126F4
    function @FreeMem(p:Pointer):Integer;//0001270C
    function @ReallocMem(var P:Pointer; NewSize:Integer):Pointer;//00012724
    function RaiseList:Pointer;//00012774
    procedure Error(errorCode:Byte);//00012780
    procedure @_IOTest;//000127C4
    procedure SetInOutRes(NewValue:Integer);//000127E4
    procedure InOutError;//000127F4
    function IOResult:Integer;//00012800
    procedure Move(const Source:void ; var Dest:void ; Count:Integer);//00012818
    function GetParamStr(P:PAnsiChar; var Param:AnsiString):PAnsiChar;//00012858
    function ParamStr(Index:Integer):String;//000128D0
    function UpCase(Ch:Char):Char;//00012928
    procedure Set8087CW(NewCW:Word);//00012938
    procedure @COS;//00012948
    procedure @INT;//00012958
    procedure @SIN;//00012970
    procedure @ROUND;//00012980
    function @TRUNC(X:Extended):Int64;//0001298C
    procedure @AbstractError;//000129A8
    procedure @PStrNCat(Dest:PShortString; Source:PShortString; MaxLen:Byte);//000129C4
    procedure @PStrCpy(Dest:PShortString; Source:PShortString);//000129F4
    procedure @PStrNCpy(Dest:PShortString; Source:PShortString; MaxLen:Byte);//00012A10
    procedure @PStrCmp(S1:PShortString; S2:PShortString);//00012A40
    procedure @AStrCmp(S1:PShortString; S2:PShortString; Bytes:Integer);//00012AC4
    procedure @FillChar(var dst:Pointer; cnt:Integer; val:Char);//00012B34
    function @ValLong(s:AnsiString; var code:Integer):Longint;//00012B54
    procedure @_CToPasStr;//00012C20
    procedure @_CLenToPasStr;//00012C38
    function GetKeyboardType:Integer; stdcall;//00012C5C
    function @isNECWindows:Boolean;//00012C64
    procedure @FpuMaskInit;//00012C94
    procedure @FpuInit;//00012D58
    procedure @BoundErr;//00012D64
    function NewInstance:TObject;//00012DB8
    procedure FreeInstance;//00012DCC
    destructor Destroy;//00012E14
    function InvokeImplGetter(Self:TObject; ImplGetter:Integer):IUnknown;//00012E88
    function @IsClass(Child:TObject; Parent:TClass):Boolean;//00012F9C
    function @AsClass(child:TObject; parent:TClass):TObject;//00012FB4
    procedure GetDynaMethod;//00012FD0
    procedure @CallDynaInst;//00013000
    procedure @FindDynaInst;//00013018
    function SafeCallException(ExceptObject:TObject; ExceptAddr:Pointer):HRESULT;//00013034
    procedure DefaultHandler(var Message:void );//0001303C
    procedure AfterConstruction;//00013040
    procedure BeforeDestruction;//00013044
    procedure Dispatch(var Message:void );//00013048
    procedure @ClassCreate;//00013150
    procedure @ClassDestroy;//000131A0
    procedure @AfterConstruction;//000131A8
    procedure @BeforeDestruction;//000131B0
    procedure NotifyReRaise;//000131C0
    procedure NotifyNonDelphiException;//000131DC
    procedure NotifyExcept;//000131FC
    procedure NotifyOnExcept;//00013210
    procedure NotifyAnyExcept;//00013224
    procedure CheckJmp;//00013238
    procedure NotifyExceptFinally;//00013258
    procedure NotifyTerminate;//00013280
    procedure NotifyUnhandled;//0001329C
    procedure @HandleAnyException;//000132BC
    procedure @HandleOnException;//0001338C
    procedure @HandleFinally;//000134C4
    procedure @RaiseExcept;//000134FC
    procedure @RaiseAgain;//00013518
    procedure @DoneExcept;//0001356C
    procedure @TryFinallyExit;//0001359C
    procedure RunErrorAt(ErrCode:Integer; ErrorAddr:Pointer);//000135B4
    procedure MapToRunError(P:PExceptionRecord); stdcall;//000135C0
    procedure @ExceptionHandler;//00013660
    procedure SetExceptionHandler;//000136DC
    procedure UnsetExceptionHandler;//000136FC
    procedure FInitUnits;//00013724
    procedure InitUnits;//00013784
    procedure @StartExe;//000137E4
    procedure @InitResStringImports;//00013814
    procedure @InitImports;//00013830
    procedure MakeErrorMessage;//00013850
    procedure ExitDll;//000138A0
    procedure @Halt0;//000138D4
    procedure @Halt;//000139EC
    procedure @RunError;//000139F8
    procedure @LStrClr(var S:AnsiString);//00013A04
    procedure @LStrArrayClr(var StrArray:Pointer; Count:Integer);//00013A28
    procedure @LStrAsg(var Dest:AnsiString; Source:AnsiString);//00013A58
    procedure @LStrLAsg(var Dest:AnsiString; const Source:AnsiString);//00013A9C
    procedure @NewAnsiString;//00013AC4
    procedure @LStrFromPCharLen(var Dest:AnsiString; Source:PAnsiChar; Length:Integer);//00013AE8
    procedure @LStrFromPWCharLen(var Dest:AnsiString; Source:PWideChar; Length:Integer);//00013B18
    procedure @LStrFromChar(var Dest:AnsiString; Source:AnsiChar);//00013BA8
    procedure @LStrFromPChar(var Dest:AnsiString; Source:PAnsiChar);//00013BB8
    procedure @LStrFromPWChar(var Dest:AnsiString; Source:PWideChar);//00013BE8
    procedure @LStrFromString(var Dest:AnsiString; const Source:ShortString);//00013C24
    procedure @LStrFromArray(var Dest:AnsiString; Source:PAnsiChar; Length:Integer);//00013C30
    procedure @LStrFromWStr(var Dest:AnsiString; const Source:WideString);//00013C48
    procedure @LStrToString(var Dest:ShortString; const Source:AnsiString; MaxLen:Integer);//00013C5C
    function @LStrLen(S:AnsiString):Integer;//00013C80
    procedure @LStrCat(var Dest:AnsiString; Source:AnsiString);//00013C88
    procedure @LStrCat3(var Dest:AnsiString; Source1:AnsiString; Source2:AnsiString);//00013CCC
    procedure @LStrCatN(var Dest:AnsiString; ArgCnt:Integer);//00013D40
    //function @LStrCmp(Left:AnsiString; Right:AnsiString):?;//00013D90
    function @LStrAddRef(var S:AnsiString):Pointer;//00013E34
    function @LStrToPChar(S:AnsiString):PChar;//00013E44
    procedure UniqueString(var str:AnsiString);//00013E50
    function @LStrCopy(const S:AnsiString; Index:Integer; Count:Integer):AnsiString;//00013E84
    procedure @LStrDelete(var S:AnsiString; Index:Integer; Count:Integer);//00013EC4
    procedure @LStrInsert(const Source:AnsiString; var S:AnsiString; Index:Integer);//00013F0C
    function @LStrPos(const Substr:AnsiString; const S:AnsiString):Integer;//00013F68
    procedure @LStrSetLength(var S:AnsiString; NewLen:Integer);//00013FB0
    procedure @Write0Bool(var T:TTextRec; Val:Boolean);//00014014
    procedure @WriteBool(var T:TTextRec; Val:Boolean; Width:Longint);//0001401C
    procedure @ReadLString(var T:TTextRec; var S:AnsiString);//0001403C
    procedure WStrError;//000140A8
    procedure WStrSet(var S:WideString; P:PWideChar);//000140B0
    procedure @WStrClr(var S:WideString);//000140C0
    procedure @WStrArrayClr(var StrArray:Pointer; Count:Integer);//000140D8
    procedure @WStrAsg(var Dest:WideString; Source:WideString);//000140FC
    procedure @WStrFromPCharLen(var Dest:WideString; Source:PAnsiChar; Length:Integer);//00014120
    procedure @WStrFromPWCharLen(var Dest:WideString; Source:PWideChar; Length:Integer);//000141A4
    procedure @WStrFromLStr(var Dest:WideString; const Source:AnsiString);//000141C8
    function @WStrLen(S:WideString):Integer;//000141D8
    function @NewWideString(Length:Integer):PWideChar;//000141E4
    procedure @WStrSetLength(var S:WideString; NewLen:Integer);//000141FC
    procedure @AddRefRecord;//00014240
    procedure @AddRefArray;//0001426C
    procedure @AddRef;//00014300
    procedure @FinalizeRecord;//0001430C
    procedure @FinalizeArray;//00014338
    procedure @Finalize;//00014418
    procedure @CopyRecord(Dest:Pointer; Source:Pointer; TypeInfo:Pointer);//00014424
    procedure @CopyArray(Dest:Pointer; Source:Pointer; TypeInfo:Pointer; Cnt:Integer);//00014540
    procedure @New;//00014634
    procedure @Dispose;//00014648
    procedure WideCharLenToStrVar(Source:PWideChar; SourceLen:Integer; var Dest:AnsiString);//00014658
    procedure OleStrToStrVar(Source:PWideChar; var Dest:AnsiString);//000146E4
    function StringToOleStr(const Source:AnsiString):PWideChar;//00014708
    procedure @DispInvokeError;//0001478C
    procedure VarCastError;//00014794
    procedure VarInvalidOp;//0001479C
    procedure @VarClear(var V:Variant);//000147A4
    procedure @VarCopy(var Dest:Variant; const Source:Variant);//000147E8
    procedure AnyChangeType(var Dest:Variant; Source:Variant; DestType:Word);//00014880
    //function sub_000148EC(?:?; ?:?):?;//000148EC
    procedure VarChangeType(var Dest:Variant; const Source:Variant; DestType:Word);//00014904
    procedure VarOleStrToString(var Dest:Variant; const Source:Variant);//000149A8
    procedure VarStringToOleStr(var Dest:Variant; const Source:Variant);//000149D8
    procedure @VarCast(var Dest:Variant; const Source:Variant; VarType:Integer);//000149F8
    procedure @VarToInt;//00014AEC
    procedure @VarToBool;//00014B58
    procedure @VarToReal;//00014B8C
    procedure @VarToCurr;//00014BE8
    procedure @VarToLStr(var S:AnsiString; const V:Variant);//00014C44
    procedure @VarToWStr(var S:WideString; const V:Variant);//00014C80
    procedure @VarFromLStr(var V:Variant; const Value:AnsiString);//00014CB8
    procedure @VarFromWStr(var V:Variant; const Value:WideString);//00014CF8
    function VarCompareString(const S1:AnsiString; const S2:AnsiString):Integer;//00014D2C
    function VarCmpStr(const V1:Variant; const V2:Variant):Integer;//00014D5C
    function AnyCmp(var Dest:Variant; const Source:Variant):Integer;//00014DC4
    procedure @VarCmp;//00014E58
    procedure @VarClr;//00014F68
    procedure @VarAddRef;//00014F70
    function VarType(const V:Variant):Integer;//00014F94
    function VarIsEmpty(const V:Variant):Boolean;//00014F98
    function VarIsArray(const A:Variant):Boolean;//00014FBC
    function @DynArrayLength(Arr:Pointer):Longint;//00014FC4
    function @DynArrayHigh(Arr:Pointer):Longint;//00014FCC
    procedure CopyArray(dest:Pointer; source:Pointer; typeInfo:Pointer; cnt:Integer);//00014FD4
    procedure FinalizeArray(p:Pointer; typeInfo:Pointer; cnt:Integer);//00014FE4
    procedure DynArrayClear(var arr:Pointer; typeInfo:PDynArrayTypeInfo);//00014FEC
    procedure DynArraySetLength(var arr:Pointer; typeInfo:PDynArrayTypeInfo; dimCnt:Longint; lenVec:PLongint);//00014FF4
    procedure @DynArraySetLength(var Arr:Pointer; TypeInfo:PDynArrayTypeInfo; DimCnt:Longint; LengthVec:Longint);//00015180
    procedure @DynArrayClear(var Arr:Pointer; TypeInfo:PDynArrayTypeInfo);//0001518C
    procedure @DynArrayAsg(var Dest:Pointer; Source:Pointer; TypeInfo:PDynArrayTypeInfo);//000151C8
    function FindHInstance(Address:Pointer):Integer;//000151F0
    function FindClassHInstance(ClassType:TClass):Integer;//00015218
    function FindResourceHInstance(Instance:Cardinal):Integer;//00015220
    function LoadResourceModule(ModuleName:PAnsiChar):Integer;//00015244
    procedure EnumResourceModules(Func:TEnumModuleFunc; Data:Pointer);//0001543C
    procedure AddModuleUnloadProc(Proc:TModuleUnloadProc);//00015464
    procedure RemoveModuleUnloadProc(Proc:TModuleUnloadProc);//00015484
    procedure NotifyModuleUnload(HInstance:Integer);//000154E4
    procedure RegisterModule(LibModule:PLibModule);//00015540
    procedure UnregisterModule(LibModule:PLibModule);//00015550
    function LoadResString(ResStringRec:PResStringRec):String;//000155C0
    procedure @IntfClear(var Dest:IUnknown);//00015618
    procedure @IntfCopy(var Dest:IUnknown; const Source:IUnknown);//00015630
    procedure @IntfAddRef(const Dest:IUnknown);//0001564C
    procedure BeforeDestruction;//00015658
    function GetCurrentThreadId:Longword;//000156CC
    procedure _DF_;//000156D4
    function @Assign(var F:TFileRec; S:AnsiString):Integer;//000158D6
    procedure @_Flush(var F:Text);//0001592C
    procedure @Flush(var F:TFileRec);//00015951
    function @BlockWrite(var F:TFileRec; buffer:Pointer; recCnt:Longint; var recsWritten:Longint):Longint;//00015978
    procedure @Close(var F:TFileRec);//000159DC
    function @EofText(var T:TTextRec):Boolean;//00015A18
    function @ReadChar(var T:TTextRec):Char;//00015A4C
    procedure @ReadString(var T:TTextRec; S:PShortString; MaxLen:Longint);//00015AC0
    procedure @ReadCString(var T:TTextRec; S:PAnsiChar; MaxLen:Longint);//00015ACB
    //procedure sub_00015AD7(?:?; ?:?; ?:?);//00015AD7
    procedure @ReadLn(var T:TTextRec);//00015B58
    procedure _DF_;//00015B80
    function @ResetText(var T:TTextRec):Integer;//00015BBB
    function @RewritText(var T:TTextRec):Integer;//00015BC2
    procedure _DF_;//00015BD0
    function @ResetFile(var F:TFileRec; RecSize:Longint):Integer;//00015CD1
    function @RewritFile(var F:TFileRec; RecSize:Longint):Integer;//00015CE8
    procedure @WriteBytes;//00015D08
    procedure @WriteSpaces;//00015D73
    procedure @Write0String(var T:TTextRec; S:ShortString);//00015DAC
    procedure @WriteString(var T:TTextRec; S:ShortString; Width:Longint);//00015DB6
    procedure @WriteLn(var T:TTextRec);//00015DD3
    procedure @Write0Char(var T:TTextRec; C:AnsiChar);//00015DE7
    procedure @WriteChar(var T:TTextRec; C:AnsiChar; Width:Integer);//00015E39
    procedure @Write0CString(var T:TTextRec; S:PAnsiChar);//00015E50
    procedure @WriteCString(var T:TTextRec; S:PAnsiChar; Width:Longint);//00015E54
    procedure FPower10;//00015E80
    procedure @_llmul;//00016154
    procedure @_llmulo;//00016177
    procedure @_lldiv;//0001619A
    procedure @_lldivo;//00016212
    procedure @_lludiv;//00016244
    procedure @_llmod;//0001628D
    procedure @_llmodo;//00016307
    procedure @_llumod;//00016339
    procedure @_llshl;//00016387
    procedure @_llushr;//000163BF

implementation

//00011238
function kernel32.CloseHandle:LongBool; stdcall;
begin
{*
 00011238    jmp         dword ptr ds:[0B8208]
*}
end;

//00011240
function kernel32.CreateFileA(dwDesiredAccess:Longword; dwShareMode:Longword; lpSecurityAttributes:PSecurityAttributes; dwCreationDisposition:Longword; dwFlagsAndAttributes:Longword; hTemplateFile:Longword):Longword; stdcall;
begin
{*
 00011240    jmp         dword ptr ds:[0B8204]
*}
end;

//00011248
function kernel32.GetFileType:Longword; stdcall;
begin
{*
 00011248    jmp         dword ptr ds:[0B8200]
*}
end;

//00011250
function kernel32.GetFileSize(lpFileSizeHigh:Pointer):Longword; stdcall;
begin
{*
 00011250    jmp         dword ptr ds:[0B81FC]
*}
end;

//00011258
function kernel32.GetStdHandle:Longword; stdcall;
begin
{*
 00011258    jmp         dword ptr ds:[0B81F8]
*}
end;

//00011260
procedure kernel32.RaiseException(dwExceptionFlags:Longword; nNumberOfArguments:Longword; lpArguments:PDWORD); stdcall;
begin
{*
 00011260    jmp         dword ptr ds:[0B81F4]
*}
end;

//00011268
function kernel32.ReadFile(var Buffer:void ; nNumberOfBytesToRead:Longword; var lpNumberOfBytesRead:Longword; lpOverlapped:POverlapped):LongBool; stdcall;
begin
{*
 00011268    jmp         dword ptr ds:[0B81F0]
*}
end;

//00011270
procedure kernel32.RtlUnwind;
begin
{*
 00011270    jmp         dword ptr ds:[0B81EC]
*}
end;

//00011278
function kernel32.SetEndOfFile:LongBool; stdcall;
begin
{*
 00011278    jmp         dword ptr ds:[0B81E8]
*}
end;

//00011280
function kernel32.SetFilePointer(lDistanceToMove:Longint; lpDistanceToMoveHigh:Pointer; dwMoveMethod:Longword):Longword; stdcall;
begin
{*
 00011280    jmp         dword ptr ds:[0B81E4]
*}
end;

//00011288
function kernel32.WriteFile(const Buffer:void ; nNumberOfBytesToWrite:Longword; var lpNumberOfBytesWritten:Longword; lpOverlapped:POverlapped):LongBool; stdcall;
begin
{*
 00011288    jmp         dword ptr ds:[0B81E0]
*}
end;

//00011290
procedure kernel32.ExitProcess; stdcall;
begin
{*
 00011290    jmp         dword ptr ds:[0B81DC]
*}
end;

//00011298
function user32.MessageBoxA(lpText:PAnsiChar; lpCaption:PAnsiChar; uType:Longword):Integer; stdcall;
begin
{*
 00011298    jmp         dword ptr ds:[0B8218]
*}
end;

//000112A0
function kernel32.FreeLibrary:LongBool; stdcall;
begin
{*
 000112A0    jmp         dword ptr ds:[0B81D8]
*}
end;

//000112A8
function kernel32.GetCommandLineA:PAnsiChar;
begin
{*
 000112A8    jmp         dword ptr ds:[0B81D4]
*}
end;

//000112B0
function kernel32.GetLastError:Integer;
begin
{*
 000112B0    jmp         dword ptr ds:[0B81D0]
*}
end;

//000112B8
function kernel32.GetLocaleInfoA(LCType:Longword; lpLCData:PAnsiChar; cchData:Integer):Integer; stdcall;
begin
{*
 000112B8    jmp         dword ptr ds:[0B81CC]
*}
end;

//000112C0
function kernel32.GetModuleFileNameA(lpFilename:PAnsiChar; nSize:Longword):Longword; stdcall;
begin
{*
 000112C0    jmp         dword ptr ds:[0B81C8]
*}
end;

//000112C8
procedure kernel32.GetStartupInfoA; stdcall;
begin
{*
 000112C8    jmp         dword ptr ds:[0B81C4]
*}
end;

//000112D0
function kernel32.GetThreadLocale:Integer;
begin
{*
 000112D0    jmp         dword ptr ds:[0B81C0]
*}
end;

//000112D8
function kernel32.LoadLibraryExA(hFile:Longword; dwFlags:Longword):HINST; stdcall;
begin
{*
 000112D8    jmp         dword ptr ds:[0B81BC]
*}
end;

//000112E0
function user32.LoadStringA(uID:Longword; lpBuffer:PAnsiChar; nBufferMax:Integer):Integer; stdcall;
begin
{*
 000112E0    jmp         dword ptr ds:[0B8214]
*}
end;

//000112E8
function kernel32.lstrcpyA(lpString2:PAnsiChar):PAnsiChar; stdcall;
begin
{*
 000112E8    jmp         dword ptr ds:[0B81B8]
*}
end;

//000112F0
function kernel32.lstrlenA:Integer; stdcall;
begin
{*
 000112F0    jmp         dword ptr ds:[0B81B4]
*}
end;

//000112F8
function kernel32.MultiByteToWideChar(Flags:Integer; MBStr:PAnsiChar; MBCount:Integer; WCStr:PWideChar; WCCount:Integer):Integer; stdcall;
begin
{*
 000112F8    jmp         dword ptr ds:[0B81B0]
*}
end;

//00011300
function advapi32.RegCloseKey:Integer; stdcall;
begin
{*
 00011300    jmp         dword ptr ds:[0B8228]
*}
end;

//00011308
function advapi32.RegOpenKeyExA(lpSubKey:PAnsiChar; ulOptions:Longword; samDesired:Longword; var phkResult:HKEY):Longint; stdcall;
begin
{*
 00011308    jmp         dword ptr ds:[0B8224]
*}
end;

//00011310
function advapi32.RegQueryValueExA(lpValueName:PAnsiChar; lpReserved:Pointer; lpType:PDWORD; lpData:PByte; lpcbData:PDWORD):Longint; stdcall;
begin
{*
 00011310    jmp         dword ptr ds:[0B8220]
*}
end;

//00011318
function kernel32.WideCharToMultiByte(Flags:Integer; WCStr:PWideChar; WCCount:Integer; MBStr:PAnsiChar; MBCount:Integer; DefaultChar:PAnsiChar; UsedDefaultChar:Pointer):Integer; stdcall;
begin
{*
 00011318    jmp         dword ptr ds:[0B81AC]
*}
end;

//00011320
function kernel32.VirtualQuery(var lpBuffer:TMemInfo; dwLength:Integer):Integer; stdcall;
begin
{*
 00011320    jmp         dword ptr ds:[0B81A8]
*}
end;

//00011328
function oleaut32.SysAllocStringLen(Len:Integer):PWideChar; stdcall;
begin
{*
 00011328    jmp         dword ptr ds:[0B8248]
*}
end;

//00011330
function oleaut32.SysReAllocStringLen(psz:PWideChar; len:Integer):Integer; stdcall;
begin
{*
 00011330    jmp         dword ptr ds:[0B8244]
*}
end;

//00011338
procedure oleaut32.SysFreeString; stdcall;
begin
{*
 00011338    jmp         dword ptr ds:[0B8240]
*}
end;

//00011340
function oleaut32.SysStringLen:Integer; stdcall;
begin
{*
 00011340    jmp         dword ptr ds:[0B823C]
*}
end;

//00011348
function oleaut32.VariantClear:HRESULT; stdcall;
begin
{*
 00011348    jmp         dword ptr ds:[0B8238]
*}
end;

//00011350
function oleaut32.VariantCopyInd(const vargSrc:OleVariant):HRESULT; stdcall;
begin
{*
 00011350    jmp         dword ptr ds:[0B8234]
*}
end;

//00011358
function oleaut32.VariantChangeTypeEx(const vargSrc:OleVariant; lcid:DWORD; wFlags:Word; vt:Word):HRESULT; stdcall;
begin
{*
 00011358    jmp         dword ptr ds:[0B8230]
*}
end;

//00011360
function kernel32.InterlockedIncrement:Integer; stdcall;
begin
{*
 00011360    jmp         dword ptr ds:[0B81A4]
*}
end;

//00011368
function kernel32.InterlockedDecrement:Integer; stdcall;
begin
{*
 00011368    jmp         dword ptr ds:[0B81A0]
*}
end;

//00011370
function GetCmdShow:Integer;
begin
{*
 00011370    push        ebx
 00011371    add         esp,0FFFFFFBC
 00011374    mov         ebx,0A
 00011379    push        esp
 0001137A    call        kernel32.GetStartupInfoA
 0001137F    test        byte ptr [esp+2C],1
>00011384    je          0001138B
 00011386    movzx       ebx,word ptr [esp+30]
 0001138B    mov         eax,ebx
 0001138D    add         esp,44
 00011390    pop         ebx
 00011391    ret
*}
end;

//00011394
function kernel32.LocalAlloc(uBytes:Longword):Longword; stdcall;
begin
{*
 00011394    jmp         dword ptr ds:[0B819C]
*}
end;

//0001139C
function kernel32.LocalFree:Pointer; stdcall;
begin
{*
 0001139C    jmp         dword ptr ds:[0B8198]
*}
end;

//000113A4
function kernel32.VirtualAlloc(dwSize:Integer; flAllocationType:Integer; flProtect:Integer):Pointer; stdcall;
begin
{*
 000113A4    jmp         dword ptr ds:[0B8194]
*}
end;

//000113AC
function kernel32.VirtualFree(dwSize:Integer; dwFreeType:Integer):LongBool; stdcall;
begin
{*
 000113AC    jmp         dword ptr ds:[0B8190]
*}
end;

//000113B4
procedure kernel32.InitializeCriticalSection; stdcall;
begin
{*
 000113B4    jmp         dword ptr ds:[0B818C]
*}
end;

//000113BC
procedure kernel32.EnterCriticalSection; stdcall;
begin
{*
 000113BC    jmp         dword ptr ds:[0B8188]
*}
end;

//000113C4
procedure kernel32.LeaveCriticalSection; stdcall;
begin
{*
 000113C4    jmp         dword ptr ds:[0B8184]
*}
end;

//000113CC
procedure kernel32.DeleteCriticalSection; stdcall;
begin
{*
 000113CC    jmp         dword ptr ds:[0B8180]
*}
end;

//000113D4
function GetBlockDesc:PBlockDesc;
begin
{*
 000113D4    push        ebx
 000113D5    push        esi
 000113D6    mov         esi,0B6454
 000113DB    cmp         dword ptr [esi],0
>000113DE    jne         0001141A
 000113E0    push        644
 000113E5    push        0
 000113E7    call        kernel32.LocalAlloc
 000113EC    mov         ecx,eax
 000113EE    test        ecx,ecx
>000113F0    jne         000113F7
 000113F2    xor         eax,eax
 000113F4    pop         esi
 000113F5    pop         ebx
 000113F6    ret
 000113F7    mov         eax,[000B6450]
 000113FC    mov         dword ptr [ecx],eax
 000113FE    mov         dword ptr ds:[0B6450],ecx
 00011404    xor         edx,edx
 00011406    mov         eax,edx
 00011408    add         eax,eax
 0001140A    lea         eax,[ecx+eax*8+4]
 0001140E    mov         ebx,dword ptr [esi]
 00011410    mov         dword ptr [eax],ebx
 00011412    mov         dword ptr [esi],eax
 00011414    inc         edx
 00011415    cmp         edx,64
>00011418    jne         00011406
 0001141A    mov         eax,dword ptr [esi]
 0001141C    mov         edx,dword ptr [eax]
 0001141E    mov         dword ptr [esi],edx
 00011420    pop         esi
 00011421    pop         ebx
 00011422    ret
*}
end;

//00011424
procedure MakeEmpty(bd:PBlockDesc);
begin
{*
 00011424    mov         dword ptr [eax],eax
 00011426    mov         dword ptr [eax+4],eax
 00011429    ret
*}
end;

//0001142C
function AddBlockAfter(prev:PBlockDesc; const b:TBlock):Boolean;
begin
{*
 0001142C    push        ebx
 0001142D    push        esi
 0001142E    mov         esi,edx
 00011430    mov         ebx,eax
 00011432    call        GetBlockDesc
 00011437    test        eax,eax
>00011439    jne         00011440
 0001143B    xor         eax,eax
 0001143D    pop         esi
 0001143E    pop         ebx
 0001143F    ret
 00011440    mov         edx,dword ptr [esi]
 00011442    mov         dword ptr [eax+8],edx
 00011445    mov         edx,dword ptr [esi+4]
 00011448    mov         dword ptr [eax+0C],edx
 0001144B    mov         edx,dword ptr [ebx]
 0001144D    mov         dword ptr [eax],edx
 0001144F    mov         dword ptr [eax+4],ebx
 00011452    mov         dword ptr [edx+4],eax
 00011455    mov         dword ptr [ebx],eax
 00011457    mov         al,1
 00011459    pop         esi
 0001145A    pop         ebx
 0001145B    ret
*}
end;

//0001145C
procedure DeleteBlock(bd:PBlockDesc);
begin
{*
 0001145C    mov         edx,dword ptr [eax+4]
 0001145F    mov         ecx,dword ptr [eax]
 00011461    mov         dword ptr [edx],ecx
 00011463    mov         dword ptr [ecx+4],edx
 00011466    mov         edx,dword ptr ds:[0B6454]
 0001146C    mov         dword ptr [eax],edx
 0001146E    mov         [000B6454],eax
 00011473    ret
*}
end;

//00011474
function MergeBlockAfter(prev:PBlockDesc; const b:TBlock):TBlock;
begin
{*
 00011474    push        ebx
 00011475    push        esi
 00011476    push        edi
 00011477    push        ebp
 00011478    push        ecx
 00011479    mov         esi,ecx
 0001147B    mov         dword ptr [esp],edx
 0001147E    mov         ebp,eax
 00011480    mov         ebx,dword ptr [ebp]
 00011483    mov         eax,dword ptr [esp]
 00011486    mov         edx,dword ptr [eax]
 00011488    mov         dword ptr [esi],edx
 0001148A    mov         edx,dword ptr [eax+4]
 0001148D    mov         dword ptr [esi+4],edx
 00011490    mov         edi,dword ptr [ebx]
 00011492    mov         eax,dword ptr [ebx+8]
 00011495    mov         edx,eax
 00011497    add         edx,dword ptr [ebx+0C]
 0001149A    cmp         edx,dword ptr [esi]
>0001149C    jne         000114B2
 0001149E    mov         eax,ebx
 000114A0    call        DeleteBlock
 000114A5    mov         eax,dword ptr [ebx+8]
 000114A8    mov         dword ptr [esi],eax
 000114AA    mov         eax,dword ptr [ebx+0C]
 000114AD    add         dword ptr [esi+4],eax
>000114B0    jmp         000114C8
 000114B2    mov         edx,dword ptr [esi]
 000114B4    add         edx,dword ptr [esi+4]
 000114B7    cmp         eax,edx
>000114B9    jne         000114C8
 000114BB    mov         eax,ebx
 000114BD    call        DeleteBlock
 000114C2    mov         eax,dword ptr [ebx+0C]
 000114C5    add         dword ptr [esi+4],eax
 000114C8    mov         ebx,edi
 000114CA    cmp         ebp,ebx
>000114CC    jne         00011490
 000114CE    mov         edx,esi
 000114D0    mov         eax,ebp
 000114D2    call        AddBlockAfter
 000114D7    test        al,al
>000114D9    jne         000114DF
 000114DB    xor         eax,eax
 000114DD    mov         dword ptr [esi],eax
 000114DF    pop         edx
 000114E0    pop         ebp
 000114E1    pop         edi
 000114E2    pop         esi
 000114E3    pop         ebx
 000114E4    ret
*}
end;

//000114E8
function RemoveBlock(bd:PBlockDesc; const b:TBlock):Boolean;
begin
{*
 000114E8    push        ebx
 000114E9    push        esi
 000114EA    push        edi
 000114EB    push        ebp
 000114EC    add         esp,0FFFFFFF8
 000114EF    mov         ebx,eax
 000114F1    mov         edi,ebx
 000114F3    mov         esi,dword ptr [edx]
 000114F5    mov         eax,dword ptr [ebx+8]
 000114F8    cmp         esi,eax
>000114FA    jb          00011568
 000114FC    mov         ecx,esi
 000114FE    add         ecx,dword ptr [edx+4]
 00011501    mov         ebp,eax
 00011503    add         ebp,dword ptr [ebx+0C]
 00011506    cmp         ecx,ebp
>00011508    ja          00011568
 0001150A    cmp         esi,eax
>0001150C    jne         00011529
 0001150E    mov         eax,dword ptr [edx+4]
 00011511    add         dword ptr [ebx+8],eax
 00011514    mov         eax,dword ptr [edx+4]
 00011517    sub         dword ptr [ebx+0C],eax
 0001151A    cmp         dword ptr [ebx+0C],0
>0001151E    jne         00011564
 00011520    mov         eax,ebx
 00011522    call        DeleteBlock
>00011527    jmp         00011564
 00011529    mov         ecx,dword ptr [edx]
 0001152B    mov         esi,dword ptr [edx+4]
 0001152E    add         ecx,esi
 00011530    mov         edi,eax
 00011532    add         edi,dword ptr [ebx+0C]
 00011535    cmp         ecx,edi
>00011537    jne         0001153E
 00011539    sub         dword ptr [ebx+0C],esi
>0001153C    jmp         00011564
 0001153E    mov         ecx,dword ptr [edx]
 00011540    add         ecx,dword ptr [edx+4]
 00011543    mov         dword ptr [esp],ecx
 00011546    sub         edi,ecx
 00011548    mov         dword ptr [esp+4],edi
 0001154C    mov         edx,dword ptr [edx]
 0001154E    sub         edx,eax
 00011550    mov         dword ptr [ebx+0C],edx
 00011553    mov         edx,esp
 00011555    mov         eax,ebx
 00011557    call        AddBlockAfter
 0001155C    test        al,al
>0001155E    jne         00011564
 00011560    xor         eax,eax
>00011562    jmp         00011570
 00011564    mov         al,1
>00011566    jmp         00011570
 00011568    mov         ebx,dword ptr [ebx]
 0001156A    cmp         edi,ebx
>0001156C    jne         000114F3
 0001156E    xor         eax,eax
 00011570    pop         ecx
 00011571    pop         edx
 00011572    pop         ebp
 00011573    pop         edi
 00011574    pop         esi
 00011575    pop         ebx
 00011576    ret
*}
end;

//00011578
function GetSpace(minSize:Integer):TBlock;
begin
{*
 00011578    push        ebx
 00011579    push        esi
 0001157A    push        edi
 0001157B    mov         ebx,edx
 0001157D    mov         esi,eax
 0001157F    cmp         esi,100000
>00011585    jge         0001158E
 00011587    mov         esi,100000
>0001158C    jmp         0001159A
 0001158E    add         esi,0FFFF
 00011594    and         esi,0FFFF0000
 0001159A    mov         dword ptr [ebx+4],esi
 0001159D    push        1
 0001159F    push        2000
 000115A4    push        esi
 000115A5    push        0
 000115A7    call        kernel32.VirtualAlloc
 000115AC    mov         edi,eax
 000115AE    mov         dword ptr [ebx],edi
 000115B0    test        edi,edi
>000115B2    je          000115D7
 000115B4    mov         edx,ebx
 000115B6    mov         eax,0B6458
 000115BB    call        AddBlockAfter
 000115C0    test        al,al
>000115C2    jne         000115D7
 000115C4    push        8000
 000115C9    push        0
 000115CB    mov         eax,dword ptr [ebx]
 000115CD    push        eax
 000115CE    call        kernel32.VirtualFree
 000115D3    xor         eax,eax
 000115D5    mov         dword ptr [ebx],eax
 000115D7    pop         edi
 000115D8    pop         esi
 000115D9    pop         ebx
 000115DA    ret
*}
end;

//000115DC
function GetSpaceAt(addr:PAnsiChar; minSize:Integer):TBlock;
begin
{*
 000115DC    push        ebx
 000115DD    push        esi
 000115DE    push        edi
 000115DF    push        ebp
 000115E0    mov         ebx,ecx
 000115E2    mov         esi,edx
 000115E4    mov         ebp,eax
 000115E6    mov         dword ptr [ebx+4],100000
 000115ED    push        4
 000115EF    push        2000
 000115F4    push        100000
 000115F9    push        ebp
 000115FA    call        kernel32.VirtualAlloc
 000115FF    mov         edi,eax
 00011601    mov         dword ptr [ebx],edi
 00011603    test        edi,edi
>00011605    jne         00011626
 00011607    add         esi,0FFFF
 0001160D    and         esi,0FFFF0000
 00011613    mov         dword ptr [ebx+4],esi
 00011616    push        4
 00011618    push        2000
 0001161D    push        esi
 0001161E    push        ebp
 0001161F    call        kernel32.VirtualAlloc
 00011624    mov         dword ptr [ebx],eax
 00011626    cmp         dword ptr [ebx],0
>00011629    je          0001164E
 0001162B    mov         edx,ebx
 0001162D    mov         eax,0B6458
 00011632    call        AddBlockAfter
 00011637    test        al,al
>00011639    jne         0001164E
 0001163B    push        8000
 00011640    push        0
 00011642    mov         eax,dword ptr [ebx]
 00011644    push        eax
 00011645    call        kernel32.VirtualFree
 0001164A    xor         eax,eax
 0001164C    mov         dword ptr [ebx],eax
 0001164E    pop         ebp
 0001164F    pop         edi
 00011650    pop         esi
 00011651    pop         ebx
 00011652    ret
*}
end;

//00011654
function FreeSpace(addr:Pointer; maxSize:Integer):TBlock;
begin
{*
 00011654    push        ebx
 00011655    push        esi
 00011656    push        edi
 00011657    push        ebp
 00011658    add         esp,0FFFFFFEC
 0001165B    mov         dword ptr [esp+4],ecx
 0001165F    mov         dword ptr [esp],edx
 00011662    mov         dword ptr [esp+8],0FFFFFFFF
 0001166A    xor         edx,edx
 0001166C    mov         dword ptr [esp+0C],edx
 00011670    mov         ebp,eax
 00011672    mov         eax,dword ptr [esp]
 00011675    add         eax,ebp
 00011677    mov         dword ptr [esp+10],eax
 0001167B    mov         ebx,dword ptr ds:[0B6458]
>00011681    jmp         000116D4
 00011683    mov         edi,dword ptr [ebx]
 00011685    mov         esi,dword ptr [ebx+8]
 00011688    cmp         ebp,esi
>0001168A    ja          000116D2
 0001168C    mov         eax,esi
 0001168E    add         eax,dword ptr [ebx+0C]
 00011691    cmp         eax,dword ptr [esp+10]
>00011695    ja          000116D2
 00011697    cmp         esi,dword ptr [esp+8]
>0001169B    jae         000116A1
 0001169D    mov         dword ptr [esp+8],esi
 000116A1    mov         eax,esi
 000116A3    add         eax,dword ptr [ebx+0C]
 000116A6    cmp         eax,dword ptr [esp+0C]
>000116AA    jbe         000116B0
 000116AC    mov         dword ptr [esp+0C],eax
 000116B0    push        8000
 000116B5    push        0
 000116B7    push        esi
 000116B8    call        kernel32.VirtualFree
 000116BD    test        eax,eax
>000116BF    jne         000116CB
 000116C1    mov         dword ptr ds:[0B6434],1
 000116CB    mov         eax,ebx
 000116CD    call        DeleteBlock
 000116D2    mov         ebx,edi
 000116D4    cmp         ebx,0B6458
>000116DA    jne         00011683
 000116DC    mov         eax,dword ptr [esp+4]
 000116E0    xor         edx,edx
 000116E2    mov         dword ptr [eax],edx
 000116E4    cmp         dword ptr [esp+0C],0
>000116E9    je          00011704
 000116EB    mov         eax,dword ptr [esp+4]
 000116EF    mov         edx,dword ptr [esp+8]
 000116F3    mov         dword ptr [eax],edx
 000116F5    mov         eax,dword ptr [esp+0C]
 000116F9    sub         eax,dword ptr [esp+8]
 000116FD    mov         edx,dword ptr [esp+4]
 00011701    mov         dword ptr [edx+4],eax
 00011704    add         esp,14
 00011707    pop         ebp
 00011708    pop         edi
 00011709    pop         esi
 0001170A    pop         ebx
 0001170B    ret
*}
end;

//0001170C
function Commit(addr:Pointer; minSize:Integer):TBlock;
begin
{*
 0001170C    push        ebx
 0001170D    push        esi
 0001170E    push        edi
 0001170F    push        ebp
 00011710    add         esp,0FFFFFFF4
 00011713    mov         dword ptr [esp+4],ecx
 00011717    mov         dword ptr [esp],edx
 0001171A    mov         edx,eax
 0001171C    mov         ebp,edx
 0001171E    and         ebp,0FFFFF000
 00011724    add         edx,dword ptr [esp]
 00011727    add         edx,0FFF
 0001172D    and         edx,0FFFFF000
 00011733    mov         dword ptr [esp+8],edx
 00011737    mov         eax,dword ptr [esp+4]
 0001173B    mov         dword ptr [eax],ebp
 0001173D    mov         eax,dword ptr [esp+8]
 00011741    sub         eax,ebp
 00011743    mov         edx,dword ptr [esp+4]
 00011747    mov         dword ptr [edx+4],eax
 0001174A    mov         esi,dword ptr ds:[0B6458]
>00011750    jmp         0001178E
 00011752    mov         ebx,dword ptr [esi+8]
 00011755    mov         edi,dword ptr [esi+0C]
 00011758    add         edi,ebx
 0001175A    cmp         ebp,ebx
>0001175C    jbe         00011760
 0001175E    mov         ebx,ebp
 00011760    cmp         edi,dword ptr [esp+8]
>00011764    jbe         0001176A
 00011766    mov         edi,dword ptr [esp+8]
 0001176A    cmp         edi,ebx
>0001176C    jbe         0001178C
 0001176E    push        4
 00011770    push        1000
 00011775    sub         edi,ebx
 00011777    push        edi
 00011778    push        ebx
 00011779    call        kernel32.VirtualAlloc
 0001177E    test        eax,eax
>00011780    jne         0001178C
 00011782    mov         eax,dword ptr [esp+4]
 00011786    xor         edx,edx
 00011788    mov         dword ptr [eax],edx
>0001178A    jmp         00011796
 0001178C    mov         esi,dword ptr [esi]
 0001178E    cmp         esi,0B6458
>00011794    jne         00011752
 00011796    add         esp,0C
 00011799    pop         ebp
 0001179A    pop         edi
 0001179B    pop         esi
 0001179C    pop         ebx
 0001179D    ret
*}
end;

//000117A0
function Decommit(addr:Pointer; maxSize:Integer):TBlock;
begin
{*
 000117A0    push        ebx
 000117A1    push        esi
 000117A2    push        edi
 000117A3    push        ebp
 000117A4    push        ecx
 000117A5    mov         ebx,eax
 000117A7    mov         esi,ebx
 000117A9    add         esi,0FFF
 000117AF    and         esi,0FFFFF000
 000117B5    mov         dword ptr [esp],esi
 000117B8    mov         ebp,ebx
 000117BA    add         ebp,edx
 000117BC    and         ebp,0FFFFF000
 000117C2    mov         eax,dword ptr [esp]
 000117C5    mov         dword ptr [ecx],eax
 000117C7    mov         eax,ebp
 000117C9    sub         eax,dword ptr [esp]
 000117CC    mov         dword ptr [ecx+4],eax
 000117CF    mov         esi,dword ptr ds:[0B6458]
>000117D5    jmp         0001180F
 000117D7    mov         ebx,dword ptr [esi+8]
 000117DA    mov         edi,dword ptr [esi+0C]
 000117DD    add         edi,ebx
 000117DF    cmp         ebx,dword ptr [esp]
>000117E2    jae         000117E7
 000117E4    mov         ebx,dword ptr [esp]
 000117E7    cmp         ebp,edi
>000117E9    jae         000117ED
 000117EB    mov         edi,ebp
 000117ED    cmp         edi,ebx
>000117EF    jbe         0001180D
 000117F1    push        4000
 000117F6    sub         edi,ebx
 000117F8    push        edi
 000117F9    push        ebx
 000117FA    call        kernel32.VirtualFree
 000117FF    test        eax,eax
>00011801    jne         0001180D
 00011803    mov         dword ptr ds:[0B6434],2
 0001180D    mov         esi,dword ptr [esi]
 0001180F    cmp         esi,0B6458
>00011815    jne         000117D7
 00011817    pop         edx
 00011818    pop         ebp
 00011819    pop         edi
 0001181A    pop         esi
 0001181B    pop         ebx
 0001181C    ret
*}
end;

//00011820
function GetCommitted(minSize:Integer):TBlock;
begin
{*
 00011820    push        ebx
 00011821    push        esi
 00011822    push        edi
 00011823    push        ebp
 00011824    add         esp,0FFFFFFF8
 00011827    mov         esi,edx
 00011829    mov         edi,eax
 0001182B    mov         ebp,0B6468
 00011830    add         edi,3FFF
 00011836    and         edi,0FFFFC000
 0001183C    mov         ebx,dword ptr [ebp]
>0001183F    jmp         00011874
 00011841    cmp         edi,dword ptr [ebx+0C]
>00011844    jg          00011872
 00011846    mov         ecx,esi
 00011848    mov         edx,edi
 0001184A    mov         eax,dword ptr [ebx+8]
 0001184D    call        Commit
 00011852    cmp         dword ptr [esi],0
>00011855    je          000118A7
 00011857    mov         eax,dword ptr [esi+4]
 0001185A    add         dword ptr [ebx+8],eax
 0001185D    mov         eax,dword ptr [esi+4]
 00011860    sub         dword ptr [ebx+0C],eax
 00011863    cmp         dword ptr [ebx+0C],0
>00011867    jne         000118A7
 00011869    mov         eax,ebx
 0001186B    call        DeleteBlock
>00011870    jmp         000118A7
 00011872    mov         ebx,dword ptr [ebx]
 00011874    cmp         ebx,ebp
>00011876    jne         00011841
 00011878    mov         edx,esi
 0001187A    mov         eax,edi
 0001187C    call        GetSpace
 00011881    cmp         dword ptr [esi],0
>00011884    je          000118A7
 00011886    mov         ecx,esp
 00011888    mov         edx,esi
 0001188A    mov         eax,ebp
 0001188C    call        MergeBlockAfter
 00011891    cmp         dword ptr [esp],0
>00011895    jne         0001183C
 00011897    mov         ecx,esp
 00011899    mov         edx,dword ptr [esi+4]
 0001189C    mov         eax,dword ptr [esi]
 0001189E    call        FreeSpace
 000118A3    xor         eax,eax
 000118A5    mov         dword ptr [esi],eax
 000118A7    pop         ecx
 000118A8    pop         edx
 000118A9    pop         ebp
 000118AA    pop         edi
 000118AB    pop         esi
 000118AC    pop         ebx
 000118AD    ret
*}
end;

//000118B0
function GetCommittedAt(addr:PAnsiChar; minSize:Integer):TBlock;
begin
{*
 000118B0    push        ebx
 000118B1    push        esi
 000118B2    push        edi
 000118B3    push        ebp
 000118B4    add         esp,0FFFFFFEC
 000118B7    mov         dword ptr [esp],ecx
 000118BA    mov         edi,edx
 000118BC    mov         esi,eax
 000118BE    mov         ebp,0B6468
 000118C3    add         edi,3FFF
 000118C9    and         edi,0FFFFC000
 000118CF    mov         ebx,dword ptr [ebp]
>000118D2    jmp         000118D6
 000118D4    mov         ebx,dword ptr [ebx]
 000118D6    cmp         ebx,ebp
>000118D8    je          000118DF
 000118DA    cmp         esi,dword ptr [ebx+8]
>000118DD    jne         000118D4
 000118DF    cmp         esi,dword ptr [ebx+8]
>000118E2    jne         0001193B
 000118E4    cmp         edi,dword ptr [ebx+0C]
>000118E7    jle         00011983
 000118ED    lea         ecx,[esp+4]
 000118F1    mov         edx,edi
 000118F3    sub         edx,dword ptr [ebx+0C]
 000118F6    mov         eax,dword ptr [ebx+8]
 000118F9    add         eax,dword ptr [ebx+0C]
 000118FC    call        GetSpaceAt
 00011901    cmp         dword ptr [esp+4],0
>00011906    je          0001193B
 00011908    lea         ecx,[esp+0C]
 0001190C    lea         edx,[esp+4]
 00011910    mov         eax,ebp
 00011912    call        MergeBlockAfter
 00011917    cmp         dword ptr [esp+0C],0
>0001191C    jne         000118CF
 0001191E    lea         ecx,[esp+0C]
 00011922    mov         edx,dword ptr [esp+8]
 00011926    mov         eax,dword ptr [esp+4]
 0001192A    call        FreeSpace
 0001192F    mov         eax,dword ptr [esp]
 00011932    xor         edx,edx
 00011934    mov         dword ptr [eax],edx
>00011936    jmp         000119CB
 0001193B    lea         ecx,[esp+4]
 0001193F    mov         edx,edi
 00011941    mov         eax,esi
 00011943    call        GetSpaceAt
 00011948    cmp         dword ptr [esp+4],0
>0001194D    je          00011983
 0001194F    lea         ecx,[esp+0C]
 00011953    lea         edx,[esp+4]
 00011957    mov         eax,ebp
 00011959    call        MergeBlockAfter
 0001195E    cmp         dword ptr [esp+0C],0
>00011963    jne         000118CF
 00011969    lea         ecx,[esp+0C]
 0001196D    mov         edx,dword ptr [esp+8]
 00011971    mov         eax,dword ptr [esp+4]
 00011975    call        FreeSpace
 0001197A    mov         eax,dword ptr [esp]
 0001197D    xor         edx,edx
 0001197F    mov         dword ptr [eax],edx
>00011981    jmp         000119CB
 00011983    mov         ebp,dword ptr [ebx+8]
 00011986    cmp         esi,ebp
>00011988    jne         000119C4
 0001198A    cmp         edi,dword ptr [ebx+0C]
>0001198D    jg          000119C4
 0001198F    mov         ecx,dword ptr [esp]
 00011992    mov         edx,edi
 00011994    mov         eax,ebp
 00011996    call        Commit
 0001199B    mov         eax,dword ptr [esp]
 0001199E    cmp         dword ptr [eax],0
>000119A1    je          000119CB
 000119A3    mov         eax,dword ptr [esp]
 000119A6    mov         eax,dword ptr [eax+4]
 000119A9    add         dword ptr [ebx+8],eax
 000119AC    mov         eax,dword ptr [esp]
 000119AF    mov         eax,dword ptr [eax+4]
 000119B2    sub         dword ptr [ebx+0C],eax
 000119B5    cmp         dword ptr [ebx+0C],0
>000119B9    jne         000119CB
 000119BB    mov         eax,ebx
 000119BD    call        DeleteBlock
>000119C2    jmp         000119CB
 000119C4    mov         eax,dword ptr [esp]
 000119C7    xor         edx,edx
 000119C9    mov         dword ptr [eax],edx
 000119CB    add         esp,14
 000119CE    pop         ebp
 000119CF    pop         edi
 000119D0    pop         esi
 000119D1    pop         ebx
 000119D2    ret
*}
end;

//000119D4
function FreeCommitted(addr:PAnsiChar; maxSize:Integer):TBlock;
begin
{*
 000119D4    push        ebx
 000119D5    push        esi
 000119D6    push        edi
 000119D7    add         esp,0FFFFFFEC
 000119DA    mov         edi,ecx
 000119DC    mov         dword ptr [esp],edx
 000119DF    lea         ebx,[eax+3FFF]
 000119E5    and         ebx,0FFFFC000
 000119EB    mov         esi,dword ptr [esp]
 000119EE    add         esi,eax
 000119F0    and         esi,0FFFFC000
 000119F6    cmp         ebx,esi
>000119F8    jae         00011A55
 000119FA    mov         ecx,edi
 000119FC    mov         edx,esi
 000119FE    sub         edx,ebx
 00011A00    mov         eax,ebx
 00011A02    call        Decommit
 00011A07    lea         ecx,[esp+4]
 00011A0B    mov         edx,edi
 00011A0D    mov         eax,0B6468
 00011A12    call        MergeBlockAfter
 00011A17    mov         ebx,dword ptr [esp+4]
 00011A1B    test        ebx,ebx
>00011A1D    je          00011A3E
 00011A1F    lea         ecx,[esp+0C]
 00011A23    mov         edx,dword ptr [esp+8]
 00011A27    mov         eax,ebx
 00011A29    call        FreeSpace
 00011A2E    mov         eax,dword ptr [esp+0C]
 00011A32    mov         dword ptr [esp+4],eax
 00011A36    mov         eax,dword ptr [esp+10]
 00011A3A    mov         dword ptr [esp+8],eax
 00011A3E    cmp         dword ptr [esp+4],0
>00011A43    je          00011A59
 00011A45    lea         edx,[esp+4]
 00011A49    mov         eax,0B6468
 00011A4E    call        RemoveBlock
>00011A53    jmp         00011A59
 00011A55    xor         eax,eax
 00011A57    mov         dword ptr [edi],eax
 00011A59    add         esp,14
 00011A5C    pop         edi
 00011A5D    pop         esi
 00011A5E    pop         ebx
 00011A5F    ret
*}
end;

//00011A60
function InitAllocator:Boolean;
begin
{*
 00011A60    push        ebp
 00011A61    mov         ebp,esp
 00011A63    xor         edx,edx
 00011A65    push        ebp
 00011A66    push        11B16
 00011A6B    push        dword ptr fs:[edx]
 00011A6E    mov         dword ptr fs:[edx],esp
 00011A71    push        0B6438
 00011A76    call        kernel32.InitializeCriticalSection
 00011A7B    cmp         byte ptr ds:[0B6049],0
>00011A82    je          00011A8E
 00011A84    push        0B6438
 00011A89    call        kernel32.EnterCriticalSection
 00011A8E    mov         eax,0B6458
 00011A93    call        MakeEmpty
 00011A98    mov         eax,0B6468
 00011A9D    call        MakeEmpty
 00011AA2    mov         eax,0B6494
 00011AA7    call        MakeEmpty
 00011AAC    push        0FF8
 00011AB1    push        0
 00011AB3    call        kernel32.LocalAlloc
 00011AB8    mov         [000B6490],eax
 00011ABD    cmp         dword ptr ds:[0B6490],0
>00011AC4    je          00011AF5
 00011AC6    mov         eax,3
 00011ACB    mov         edx,dword ptr ds:[0B6490]
 00011AD1    xor         ecx,ecx
 00011AD3    mov         dword ptr [edx+eax*4-0C],ecx
 00011AD7    inc         eax
 00011AD8    cmp         eax,401
>00011ADD    jne         00011ACB
 00011ADF    mov         eax,0B6478
 00011AE4    mov         dword ptr [eax+4],eax
 00011AE7    mov         dword ptr [eax],eax
 00011AE9    mov         [000B6484],eax
 00011AEE    mov         byte ptr ds:[0B6430],1
 00011AF5    xor         eax,eax
 00011AF7    pop         edx
 00011AF8    pop         ecx
 00011AF9    pop         ecx
 00011AFA    mov         dword ptr fs:[eax],edx
 00011AFD    push        11B1D
 00011B02    cmp         byte ptr ds:[0B6049],0
>00011B09    je          00011B15
 00011B0B    push        0B6438
 00011B10    call        kernel32.LeaveCriticalSection
 00011B15    ret
>00011B16    jmp         @HandleFinally
>00011B1B    jmp         00011B02
 00011B1D    mov         al,[000B6430]
 00011B22    pop         ebp
 00011B23    ret
*}
end;

//00011B24
procedure UninitAllocator;
begin
{*
 00011B24    push        ebp
 00011B25    mov         ebp,esp
 00011B27    push        ebx
 00011B28    cmp         byte ptr ds:[0B6430],0
>00011B2F    je          00011C01
 00011B35    xor         edx,edx
 00011B37    push        ebp
 00011B38    push        11BFA
 00011B3D    push        dword ptr fs:[edx]
 00011B40    mov         dword ptr fs:[edx],esp
 00011B43    cmp         byte ptr ds:[0B6049],0
>00011B4A    je          00011B56
 00011B4C    push        0B6438
 00011B51    call        kernel32.EnterCriticalSection
 00011B56    mov         byte ptr ds:[0B6430],0
 00011B5D    mov         eax,[000B6490]
 00011B62    push        eax
 00011B63    call        kernel32.LocalFree
 00011B68    xor         eax,eax
 00011B6A    mov         [000B6490],eax
 00011B6F    mov         ebx,dword ptr ds:[0B6458]
>00011B75    jmp         00011B89
 00011B77    push        8000
 00011B7C    push        0
 00011B7E    mov         eax,dword ptr [ebx+8]
 00011B81    push        eax
 00011B82    call        kernel32.VirtualFree
 00011B87    mov         ebx,dword ptr [ebx]
 00011B89    cmp         ebx,0B6458
>00011B8F    jne         00011B77
 00011B91    mov         eax,0B6458
 00011B96    call        MakeEmpty
 00011B9B    mov         eax,0B6468
 00011BA0    call        MakeEmpty
 00011BA5    mov         eax,0B6494
 00011BAA    call        MakeEmpty
 00011BAF    mov         eax,[000B6450]
 00011BB4    test        eax,eax
>00011BB6    je          00011BCF
 00011BB8    mov         edx,dword ptr [eax]
 00011BBA    mov         dword ptr ds:[0B6450],edx
 00011BC0    push        eax
 00011BC1    call        kernel32.LocalFree
 00011BC6    mov         eax,[000B6450]
 00011BCB    test        eax,eax
>00011BCD    jne         00011BB8
 00011BCF    xor         eax,eax
 00011BD1    pop         edx
 00011BD2    pop         ecx
 00011BD3    pop         ecx
 00011BD4    mov         dword ptr fs:[eax],edx
 00011BD7    push        11C01
 00011BDC    cmp         byte ptr ds:[0B6049],0
>00011BE3    je          00011BEF
 00011BE5    push        0B6438
 00011BEA    call        kernel32.LeaveCriticalSection
 00011BEF    push        0B6438
 00011BF4    call        kernel32.DeleteCriticalSection
 00011BF9    ret
>00011BFA    jmp         @HandleFinally
>00011BFF    jmp         00011BDC
 00011C01    pop         ebx
 00011C02    pop         ebp
 00011C03    ret
*}
end;

//00011C04
procedure DeleteFree(f:PFree);
begin
{*
 00011C04    push        ebx
 00011C05    cmp         eax,dword ptr ds:[0B6484]
>00011C0B    jne         00011C16
 00011C0D    mov         edx,dword ptr [eax+4]
 00011C10    mov         dword ptr ds:[0B6484],edx
 00011C16    mov         edx,dword ptr [eax+4]
 00011C19    mov         ecx,dword ptr [eax+8]
 00011C1C    cmp         ecx,1000
>00011C22    jg          00011C5C
 00011C24    cmp         eax,edx
>00011C26    jne         00011C3F
 00011C28    test        ecx,ecx
>00011C2A    jns         00011C2F
 00011C2C    add         ecx,3
 00011C2F    sar         ecx,2
 00011C32    mov         eax,[000B6490]
 00011C37    xor         edx,edx
 00011C39    mov         dword ptr [eax+ecx*4-0C],edx
>00011C3D    jmp         00011C63
 00011C3F    test        ecx,ecx
>00011C41    jns         00011C46
 00011C43    add         ecx,3
 00011C46    sar         ecx,2
 00011C49    mov         ebx,dword ptr ds:[0B6490]
 00011C4F    mov         dword ptr [ebx+ecx*4-0C],edx
 00011C53    mov         eax,dword ptr [eax]
 00011C55    mov         dword ptr [edx],eax
 00011C57    mov         dword ptr [eax+4],edx
 00011C5A    pop         ebx
 00011C5B    ret
 00011C5C    mov         eax,dword ptr [eax]
 00011C5E    mov         dword ptr [edx],eax
 00011C60    mov         dword ptr [eax+4],edx
 00011C63    pop         ebx
 00011C64    ret
*}
end;

//00011C68
function FindCommitted(addr:PAnsiChar):PBlockDesc;
begin
{*
 00011C68    mov         edx,dword ptr ds:[0B6494]
>00011C6E    jmp         00011C80
 00011C70    mov         ecx,dword ptr [edx+8]
 00011C73    cmp         eax,ecx
>00011C75    jb          00011C7E
 00011C77    add         ecx,dword ptr [edx+0C]
 00011C7A    cmp         eax,ecx
>00011C7C    jb          00011C94
 00011C7E    mov         edx,dword ptr [edx]
 00011C80    cmp         edx,0B6494
>00011C86    jne         00011C70
 00011C88    mov         dword ptr ds:[0B6434],3
 00011C92    xor         edx,edx
 00011C94    mov         eax,edx
 00011C96    ret
*}
end;

//00011C98
procedure FillBeforeGap(a:PAnsiChar; size:Integer);
begin
{*
 00011C98    push        ebx
 00011C99    mov         ecx,edx
 00011C9B    sub         ecx,4
 00011C9E    lea         ebx,[ecx+eax]
 00011CA1    cmp         edx,10
>00011CA4    jl          00011CB5
 00011CA6    mov         dword ptr [ebx],80000007
 00011CAC    mov         edx,ecx
 00011CAE    call        InsertFree
 00011CB3    pop         ebx
 00011CB4    ret
 00011CB5    cmp         edx,4
>00011CB8    jl          00011CC6
 00011CBA    mov         ecx,edx
 00011CBC    or          ecx,80000002
 00011CC2    mov         dword ptr [eax],ecx
 00011CC4    mov         dword ptr [ebx],ecx
 00011CC6    pop         ebx
 00011CC7    ret
*}
end;

//00011CC8
procedure InternalFreeMem(a:PAnsiChar);
begin
{*
 00011CC8    inc         dword ptr ds:[0B6424]
 00011CCE    mov         edx,eax
 00011CD0    sub         edx,4
 00011CD3    mov         edx,dword ptr [edx]
 00011CD5    and         edx,7FFFFFFC
 00011CDB    sub         edx,4
 00011CDE    add         dword ptr ds:[0B6428],edx
 00011CE4    call        SysFreeMem
 00011CE9    ret
*}
end;

//00011CEC
procedure FillAfterGap(a:PAnsiChar; size:Integer);
begin
{*
 00011CEC    cmp         edx,0C
>00011CEF    jl          00011CFF
 00011CF1    or          edx,2
 00011CF4    mov         dword ptr [eax],edx
 00011CF6    add         eax,4
 00011CF9    call        InternalFreeMem
 00011CFE    ret
 00011CFF    cmp         edx,4
>00011D02    jl          00011D0E
 00011D04    mov         ecx,edx
 00011D06    or          ecx,80000002
 00011D0C    mov         dword ptr [eax],ecx
 00011D0E    add         eax,edx
 00011D10    and         dword ptr [eax],0FFFFFFFE
 00011D13    ret
*}
end;

//00011D14
function FillerSizeBeforeGap(a:PAnsiChar):Integer;
begin
{*
 00011D14    push        ebx
 00011D15    push        esi
 00011D16    mov         edx,eax
 00011D18    sub         edx,4
 00011D1B    mov         edx,dword ptr [edx]
 00011D1D    mov         ecx,edx
 00011D1F    and         ecx,80000002
 00011D25    cmp         ecx,80000002
>00011D2B    je          00011D37
 00011D2D    mov         dword ptr ds:[0B6434],4
 00011D37    mov         ebx,edx
 00011D39    and         ebx,7FFFFFFC
 00011D3F    sub         eax,ebx
 00011D41    mov         ecx,eax
 00011D43    xor         edx,dword ptr [ecx]
 00011D45    test        edx,0FFFFFFFE
>00011D4B    je          00011D57
 00011D4D    mov         dword ptr ds:[0B6434],5
 00011D57    test        byte ptr [ecx],1
>00011D5A    je          00011D7C
 00011D5C    mov         edx,eax
 00011D5E    sub         edx,0C
 00011D61    mov         esi,dword ptr [edx+8]
 00011D64    sub         eax,esi
 00011D66    cmp         esi,dword ptr [eax+8]
>00011D69    je          00011D75
 00011D6B    mov         dword ptr ds:[0B6434],6
 00011D75    call        DeleteFree
 00011D7A    add         ebx,esi
 00011D7C    mov         eax,ebx
 00011D7E    pop         esi
 00011D7F    pop         ebx
 00011D80    ret
*}
end;

//00011D84
function FillerSizeAfterGap(a:PAnsiChar):Integer;
begin
{*
 00011D84    push        ebx
 00011D85    push        esi
 00011D86    push        edi
 00011D87    mov         ebx,eax
 00011D89    xor         edi,edi
 00011D8B    mov         eax,dword ptr [ebx]
 00011D8D    test        eax,80000000
>00011D92    je          00011D9F
 00011D94    and         eax,7FFFFFFC
 00011D99    add         edi,eax
 00011D9B    add         ebx,eax
 00011D9D    mov         eax,dword ptr [ebx]
 00011D9F    test        al,2
>00011DA1    jne         00011DB6
 00011DA3    mov         esi,ebx
 00011DA5    mov         eax,esi
 00011DA7    call        DeleteFree
 00011DAC    mov         eax,dword ptr [esi+8]
 00011DAF    add         edi,eax
 00011DB1    add         ebx,eax
 00011DB3    and         dword ptr [ebx],0FFFFFFFE
 00011DB6    mov         eax,edi
 00011DB8    pop         edi
 00011DB9    pop         esi
 00011DBA    pop         ebx
 00011DBB    ret
*}
end;

//00011DBC
function DecommitFree(a:PAnsiChar; size:Integer):Boolean;
begin
{*
 00011DBC    push        ebx
 00011DBD    push        esi
 00011DBE    push        edi
 00011DBF    push        ebp
 00011DC0    add         esp,0FFFFFFF8
 00011DC3    mov         edi,edx
 00011DC5    mov         esi,eax
 00011DC7    mov         eax,esi
 00011DC9    call        FindCommitted
 00011DCE    mov         ebx,eax
 00011DD0    mov         ebp,dword ptr [ebx+8]
 00011DD3    mov         eax,ebp
 00011DD5    add         eax,dword ptr [ebx+0C]
 00011DD8    mov         edx,eax
 00011DDA    lea         ecx,[edi+esi]
 00011DDD    sub         edx,ecx
 00011DDF    cmp         edx,0C
>00011DE2    jg          00011DE8
 00011DE4    mov         edi,eax
 00011DE6    sub         edi,esi
 00011DE8    mov         eax,esi
 00011DEA    sub         eax,ebp
 00011DEC    cmp         eax,0C
>00011DEF    jge         00011E03
 00011DF1    mov         ecx,esp
 00011DF3    mov         edx,esi
 00011DF5    sub         edx,dword ptr [ebx+8]
 00011DF8    add         edx,edi
 00011DFA    mov         eax,ebp
 00011DFC    call        FreeCommitted
>00011E01    jmp         00011E12
 00011E03    mov         ecx,esp
 00011E05    mov         edx,edi
 00011E07    sub         edx,4
 00011E0A    lea         eax,[esi+4]
 00011E0D    call        FreeCommitted
 00011E12    mov         ebp,dword ptr [esp]
 00011E15    test        ebp,ebp
>00011E17    jne         00011E1D
 00011E19    xor         eax,eax
>00011E1B    jmp         00011E4D
 00011E1D    mov         edx,ebp
 00011E1F    sub         edx,esi
 00011E21    mov         eax,esi
 00011E23    call        FillBeforeGap
 00011E28    mov         eax,ebp
 00011E2A    add         eax,dword ptr [esp+4]
 00011E2E    mov         edx,dword ptr [ebx+8]
 00011E31    add         edx,dword ptr [ebx+0C]
 00011E34    cmp         eax,edx
>00011E36    jae         00011E42
 00011E38    lea         edx,[edi+esi]
 00011E3B    sub         edx,eax
 00011E3D    call        FillAfterGap
 00011E42    mov         edx,esp
 00011E44    mov         eax,ebx
 00011E46    call        RemoveBlock
 00011E4B    mov         al,1
 00011E4D    pop         ecx
 00011E4E    pop         edx
 00011E4F    pop         ebp
 00011E50    pop         edi
 00011E51    pop         esi
 00011E52    pop         ebx
 00011E53    ret
*}
end;

//00011E54
procedure InsertFree(a:Pointer; size:Integer);
begin
{*
 00011E54    push        ebx
 00011E55    push        esi
 00011E56    push        edi
 00011E57    mov         esi,edx
 00011E59    mov         edi,eax
 00011E5B    mov         ebx,edi
 00011E5D    mov         dword ptr [ebx+8],esi
 00011E60    mov         eax,ebx
 00011E62    add         eax,esi
 00011E64    sub         eax,0C
 00011E67    mov         dword ptr [eax+8],esi
 00011E6A    cmp         esi,1000
>00011E70    jg          00011EA9
 00011E72    mov         edx,esi
 00011E74    test        edx,edx
>00011E76    jns         00011E7B
 00011E78    add         edx,3
 00011E7B    sar         edx,2
 00011E7E    mov         eax,[000B6490]
 00011E83    mov         eax,dword ptr [eax+edx*4-0C]
 00011E87    test        eax,eax
>00011E89    jne         00011E9B
 00011E8B    mov         eax,[000B6490]
 00011E90    mov         dword ptr [eax+edx*4-0C],ebx
 00011E94    mov         dword ptr [ebx+4],ebx
 00011E97    mov         dword ptr [ebx],ebx
>00011E99    jmp         00011ED5
 00011E9B    mov         edx,dword ptr [eax]
 00011E9D    mov         dword ptr [ebx+4],eax
 00011EA0    mov         dword ptr [ebx],edx
 00011EA2    mov         dword ptr [eax],ebx
 00011EA4    mov         dword ptr [edx+4],ebx
>00011EA7    jmp         00011ED5
 00011EA9    cmp         esi,3C00
>00011EAF    jl          00011EBE
 00011EB1    mov         edx,esi
 00011EB3    mov         eax,edi
 00011EB5    call        DecommitFree
 00011EBA    test        al,al
>00011EBC    jne         00011ED5
 00011EBE    mov         eax,[000B6484]
 00011EC3    mov         dword ptr ds:[0B6484],ebx
 00011EC9    mov         edx,dword ptr [eax]
 00011ECB    mov         dword ptr [ebx+4],eax
 00011ECE    mov         dword ptr [ebx],edx
 00011ED0    mov         dword ptr [eax],ebx
 00011ED2    mov         dword ptr [edx+4],ebx
 00011ED5    pop         edi
 00011ED6    pop         esi
 00011ED7    pop         ebx
 00011ED8    ret
*}
end;

//00011EDC
procedure FreeCurAlloc;
begin
{*
 00011EDC    cmp         dword ptr ds:[0B6488],0
>00011EE3    jle         00011F25
 00011EE5    cmp         dword ptr ds:[0B6488],0C
>00011EEC    jge         00011EFA
 00011EEE    mov         dword ptr ds:[0B6434],7
>00011EF8    jmp         00011F25
 00011EFA    mov         eax,[000B6488]
 00011EFF    or          eax,2
 00011F02    mov         edx,dword ptr ds:[0B648C]
 00011F08    mov         dword ptr [edx],eax
 00011F0A    mov         eax,[000B648C]
 00011F0F    add         eax,4
 00011F12    call        InternalFreeMem
 00011F17    xor         eax,eax
 00011F19    mov         [000B648C],eax
 00011F1E    xor         eax,eax
 00011F20    mov         [000B6488],eax
 00011F25    ret
*}
end;

//00011F28
function MergeCommit(b:TBlock):Boolean;
begin
{*
 00011F28    push        ebx
 00011F29    push        esi
 00011F2A    push        edi
 00011F2B    add         esp,0FFFFFFF0
 00011F2E    mov         esi,eax
 00011F30    lea         edi,[esp]
 00011F33    movs        dword ptr [edi],dword ptr [esi]
 00011F34    movs        dword ptr [edi],dword ptr [esi]
 00011F35    mov         edi,esp
 00011F37    call        FreeCurAlloc
 00011F3C    lea         ecx,[esp+8]
 00011F40    mov         edx,edi
 00011F42    mov         eax,0B6494
 00011F47    call        MergeBlockAfter
 00011F4C    mov         ebx,dword ptr [esp+8]
 00011F50    test        ebx,ebx
>00011F52    jne         00011F58
 00011F54    xor         eax,eax
>00011F56    jmp         00011FAA
 00011F58    mov         eax,dword ptr [edi]
 00011F5A    cmp         ebx,eax
>00011F5C    jae         00011F68
 00011F5E    call        FillerSizeBeforeGap
 00011F63    sub         dword ptr [edi],eax
 00011F65    add         dword ptr [edi+4],eax
 00011F68    mov         eax,dword ptr [edi]
 00011F6A    add         eax,dword ptr [edi+4]
 00011F6D    mov         esi,ebx
 00011F6F    add         esi,dword ptr [esp+0C]
 00011F73    cmp         eax,esi
>00011F75    jae         00011F7F
 00011F77    call        FillerSizeAfterGap
 00011F7C    add         dword ptr [edi+4],eax
 00011F7F    mov         eax,dword ptr [edi]
 00011F81    add         eax,dword ptr [edi+4]
 00011F84    cmp         esi,eax
>00011F86    jne         00011F99
 00011F88    sub         eax,4
 00011F8B    mov         edx,4
 00011F90    call        FillBeforeGap
 00011F95    sub         dword ptr [edi+4],4
 00011F99    mov         eax,dword ptr [edi]
 00011F9B    mov         [000B648C],eax
 00011FA0    mov         eax,dword ptr [edi+4]
 00011FA3    mov         [000B6488],eax
 00011FA8    mov         al,1
 00011FAA    add         esp,10
 00011FAD    pop         edi
 00011FAE    pop         esi
 00011FAF    pop         ebx
 00011FB0    ret
*}
end;

//00011FB4
function NewCommit(minSize:Integer):Boolean;
begin
{*
 00011FB4    push        ebx
 00011FB5    add         esp,0FFFFFFF8
 00011FB8    mov         ebx,eax
 00011FBA    mov         edx,esp
 00011FBC    lea         eax,[ebx+4]
 00011FBF    call        GetCommitted
 00011FC4    cmp         dword ptr [esp],0
>00011FC8    je          00011FD5
 00011FCA    mov         eax,esp
 00011FCC    call        MergeCommit
 00011FD1    test        al,al
>00011FD3    jne         00011FD9
 00011FD5    xor         eax,eax
>00011FD7    jmp         00011FDB
 00011FD9    mov         al,1
 00011FDB    pop         ecx
 00011FDC    pop         edx
 00011FDD    pop         ebx
 00011FDE    ret
*}
end;

//00011FE0
function NewCommitAt(addr:Pointer; minSize:Integer):Boolean;
begin
{*
 00011FE0    push        ebx
 00011FE1    push        esi
 00011FE2    add         esp,0FFFFFFF8
 00011FE5    mov         esi,edx
 00011FE7    mov         ebx,eax
 00011FE9    mov         ecx,esp
 00011FEB    lea         edx,[esi+4]
 00011FEE    mov         eax,ebx
 00011FF0    call        GetCommittedAt
 00011FF5    cmp         dword ptr [esp],0
>00011FF9    je          00012006
 00011FFB    mov         eax,esp
 00011FFD    call        MergeCommit
 00012002    test        al,al
>00012004    jne         0001200A
 00012006    xor         eax,eax
>00012008    jmp         0001200C
 0001200A    mov         al,1
 0001200C    pop         ecx
 0001200D    pop         edx
 0001200E    pop         esi
 0001200F    pop         ebx
 00012010    ret
*}
end;

//00012014
function SearchSmallBlocks(size:Integer):PFree;
begin
{*
 00012014    xor         edx,edx
 00012016    test        eax,eax
>00012018    jns         0001201D
 0001201A    add         eax,3
 0001201D    sar         eax,2
 00012020    cmp         eax,400
>00012025    jg          0001203D
 00012027    mov         edx,dword ptr ds:[0B6490]
 0001202D    mov         edx,dword ptr [edx+eax*4-0C]
 00012031    test        edx,edx
>00012033    jne         0001203D
 00012035    inc         eax
 00012036    cmp         eax,401
>0001203B    jne         00012027
 0001203D    mov         eax,edx
 0001203F    ret
*}
end;

//00012040
function TryHarder(size:Integer):Pointer;
begin
{*
 00012040    push        ebx
 00012041    push        esi
 00012042    push        edi
 00012043    push        ebp
 00012044    mov         esi,eax
 00012046    mov         edi,0B6484
 0001204B    mov         ebp,0B6488
 00012050    mov         ebx,dword ptr ds:[0B647C]
 00012056    cmp         esi,dword ptr [ebx+8]
>00012059    jle         000120E3
 0001205F    mov         ebx,dword ptr [edi]
 00012061    mov         eax,dword ptr [ebx+8]
 00012064    cmp         esi,eax
>00012066    jle         000120E3
 00012068    mov         dword ptr [ebx+8],esi
 0001206B    mov         ebx,dword ptr [ebx+4]
 0001206E    cmp         esi,dword ptr [ebx+8]
>00012071    jg          0001206B
 00012073    mov         edx,dword ptr [edi]
 00012075    mov         dword ptr [edx+8],eax
 00012078    cmp         ebx,dword ptr [edi]
>0001207A    je          00012080
 0001207C    mov         dword ptr [edi],ebx
>0001207E    jmp         000120E3
 00012080    cmp         esi,1000
>00012086    jg          00012095
 00012088    mov         eax,esi
 0001208A    call        SearchSmallBlocks
 0001208F    mov         ebx,eax
 00012091    test        ebx,ebx
>00012093    jne         000120E3
 00012095    mov         eax,esi
 00012097    call        NewCommit
 0001209C    test        al,al
>0001209E    jne         000120A7
 000120A0    xor         eax,eax
>000120A2    jmp         0001212F
 000120A7    cmp         esi,dword ptr [ebp]
>000120AA    jg          00012050
 000120AC    sub         dword ptr [ebp],esi
 000120AF    cmp         dword ptr [ebp],0C
>000120B3    jge         000120BD
 000120B5    add         esi,dword ptr [ebp]
 000120B8    xor         eax,eax
 000120BA    mov         dword ptr [ebp],eax
 000120BD    mov         eax,[000B648C]
 000120C2    add         dword ptr ds:[0B648C],esi
 000120C8    mov         edx,esi
 000120CA    or          edx,2
 000120CD    mov         dword ptr [eax],edx
 000120CF    add         eax,4
 000120D2    inc         dword ptr ds:[0B6424]
 000120D8    sub         esi,4
 000120DB    add         dword ptr ds:[0B6428],esi
>000120E1    jmp         0001212F
 000120E3    mov         eax,ebx
 000120E5    call        DeleteFree
 000120EA    mov         edx,dword ptr [ebx+8]
 000120ED    mov         eax,edx
 000120EF    sub         eax,esi
 000120F1    cmp         eax,0C
>000120F4    jl          00012102
 000120F6    mov         edx,ebx
 000120F8    add         edx,esi
 000120FA    xchg        eax,edx
 000120FB    call        InsertFree
>00012100    jmp         00012114
 00012102    mov         esi,edx
 00012104    cmp         ebx,dword ptr [edi]
>00012106    jne         0001210D
 00012108    mov         eax,dword ptr [ebx+4]
 0001210B    mov         dword ptr [edi],eax
 0001210D    mov         eax,ebx
 0001210F    add         eax,esi
 00012111    and         dword ptr [eax],0FFFFFFFE
 00012114    mov         eax,ebx
 00012116    mov         edx,esi
 00012118    or          edx,2
 0001211B    mov         dword ptr [eax],edx
 0001211D    add         eax,4
 00012120    inc         dword ptr ds:[0B6424]
 00012126    sub         esi,4
 00012129    add         dword ptr ds:[0B6428],esi
 0001212F    pop         ebp
 00012130    pop         edi
 00012131    pop         esi
 00012132    pop         ebx
 00012133    ret
*}
end;

//00012134
function SysGetMem(Size:Integer):Pointer;
begin
{*
 00012134    push        ebp
 00012135    mov         ebp,esp
 00012137    add         esp,0FFFFFFF8
 0001213A    push        ebx
 0001213B    push        esi
 0001213C    push        edi
 0001213D    mov         ebx,eax
 0001213F    cmp         byte ptr ds:[0B6430],0
>00012146    jne         0001215B
 00012148    call        InitAllocator
 0001214D    test        al,al
>0001214F    jne         0001215B
 00012151    xor         eax,eax
 00012153    mov         dword ptr [ebp-4],eax
>00012156    jmp         000122AF
 0001215B    xor         ecx,ecx
 0001215D    push        ebp
 0001215E    push        122A8
 00012163    push        dword ptr fs:[ecx]
 00012166    mov         dword ptr fs:[ecx],esp
 00012169    cmp         byte ptr ds:[0B6049],0
>00012170    je          0001217C
 00012172    push        0B6438
 00012177    call        kernel32.EnterCriticalSection
 0001217C    add         ebx,7
 0001217F    and         ebx,0FFFFFFFC
 00012182    cmp         ebx,0C
>00012185    jge         0001218C
 00012187    mov         ebx,0C
 0001218C    cmp         ebx,1000
>00012192    jg          0001222B
 00012198    mov         eax,ebx
 0001219A    test        eax,eax
>0001219C    jns         000121A1
 0001219E    add         eax,3
 000121A1    sar         eax,2
 000121A4    mov         edx,dword ptr ds:[0B6490]
 000121AA    mov         edx,dword ptr [edx+eax*4-0C]
 000121AE    test        edx,edx
>000121B0    je          0001222B
 000121B2    mov         esi,edx
 000121B4    mov         eax,esi
 000121B6    add         eax,ebx
 000121B8    and         dword ptr [eax],0FFFFFFFE
 000121BB    mov         eax,dword ptr [edx+4]
 000121BE    cmp         edx,eax
>000121C0    jne         000121DC
 000121C2    mov         eax,ebx
 000121C4    test        eax,eax
>000121C6    jns         000121CB
 000121C8    add         eax,3
 000121CB    sar         eax,2
 000121CE    mov         ecx,dword ptr ds:[0B6490]
 000121D4    xor         edi,edi
 000121D6    mov         dword ptr [ecx+eax*4-0C],edi
>000121DA    jmp         00012202
 000121DC    mov         ecx,ebx
 000121DE    test        ecx,ecx
>000121E0    jns         000121E5
 000121E2    add         ecx,3
 000121E5    sar         ecx,2
 000121E8    mov         edi,dword ptr ds:[0B6490]
 000121EE    mov         dword ptr [edi+ecx*4-0C],eax
 000121F2    mov         ecx,dword ptr [edx]
 000121F4    mov         dword ptr [ebp-8],ecx
 000121F7    mov         ecx,dword ptr [ebp-8]
 000121FA    mov         dword ptr [ecx+4],eax
 000121FD    mov         ecx,dword ptr [ebp-8]
 00012200    mov         dword ptr [eax],ecx
 00012202    mov         eax,esi
 00012204    mov         edx,dword ptr [edx+8]
 00012207    or          edx,2
 0001220A    mov         dword ptr [eax],edx
 0001220C    add         eax,4
 0001220F    mov         dword ptr [ebp-4],eax
 00012212    inc         dword ptr ds:[0B6424]
 00012218    sub         ebx,4
 0001221B    add         dword ptr ds:[0B6428],ebx
 00012221    call        @TryFinallyExit
>00012226    jmp         000122AF
 0001222B    cmp         ebx,dword ptr ds:[0B6488]
>00012231    jg          0001227D
 00012233    sub         dword ptr ds:[0B6488],ebx
 00012239    cmp         dword ptr ds:[0B6488],0C
>00012240    jge         0001224F
 00012242    add         ebx,dword ptr ds:[0B6488]
 00012248    xor         eax,eax
 0001224A    mov         [000B6488],eax
 0001224F    mov         eax,[000B648C]
 00012254    add         dword ptr ds:[0B648C],ebx
 0001225A    mov         edx,ebx
 0001225C    or          edx,2
 0001225F    mov         dword ptr [eax],edx
 00012261    add         eax,4
 00012264    mov         dword ptr [ebp-4],eax
 00012267    inc         dword ptr ds:[0B6424]
 0001226D    sub         ebx,4
 00012270    add         dword ptr ds:[0B6428],ebx
 00012276    call        @TryFinallyExit
>0001227B    jmp         000122AF
 0001227D    mov         eax,ebx
 0001227F    call        TryHarder
 00012284    mov         dword ptr [ebp-4],eax
 00012287    xor         eax,eax
 00012289    pop         edx
 0001228A    pop         ecx
 0001228B    pop         ecx
 0001228C    mov         dword ptr fs:[eax],edx
 0001228F    push        122AF
 00012294    cmp         byte ptr ds:[0B6049],0
>0001229B    je          000122A7
 0001229D    push        0B6438
 000122A2    call        kernel32.LeaveCriticalSection
 000122A7    ret
>000122A8    jmp         @HandleFinally
>000122AD    jmp         00012294
 000122AF    mov         eax,dword ptr [ebp-4]
 000122B2    pop         edi
 000122B3    pop         esi
 000122B4    pop         ebx
 000122B5    pop         ecx
 000122B6    pop         ecx
 000122B7    pop         ebp
 000122B8    ret
*}
end;

//000122BC
function SysFreeMem(P:Pointer):Integer;
begin
{*
 000122BC    push        ebp
 000122BD    mov         ebp,esp
 000122BF    push        ecx
 000122C0    push        ebx
 000122C1    push        esi
 000122C2    push        edi
 000122C3    mov         ebx,eax
 000122C5    xor         eax,eax
 000122C7    mov         [000B6434],eax
 000122CC    cmp         byte ptr ds:[0B6430],0
>000122D3    jne         000122F4
 000122D5    call        InitAllocator
 000122DA    test        al,al
>000122DC    jne         000122F4
 000122DE    mov         dword ptr ds:[0B6434],8
 000122E8    mov         dword ptr [ebp-4],8
>000122EF    jmp         00012455
 000122F4    xor         ecx,ecx
 000122F6    push        ebp
 000122F7    push        1244E
 000122FC    push        dword ptr fs:[ecx]
 000122FF    mov         dword ptr fs:[ecx],esp
 00012302    cmp         byte ptr ds:[0B6049],0
>00012309    je          00012315
 0001230B    push        0B6438
 00012310    call        kernel32.EnterCriticalSection
 00012315    mov         esi,ebx
 00012317    sub         esi,4
 0001231A    mov         ebx,dword ptr [esi]
 0001231C    test        bl,2
>0001231F    jne         00012330
 00012321    mov         dword ptr ds:[0B6434],9
>0001232B    jmp         00012425
 00012330    dec         dword ptr ds:[0B6424]
 00012336    mov         eax,ebx
 00012338    and         eax,7FFFFFFC
 0001233D    sub         eax,4
 00012340    sub         dword ptr ds:[0B6428],eax
 00012346    test        bl,1
>00012349    je          00012390
 0001234B    mov         eax,esi
 0001234D    sub         eax,0C
 00012350    mov         edx,dword ptr [eax+8]
 00012353    cmp         edx,0C
>00012356    jl          00012360
 00012358    test        edx,80000003
>0001235E    je          0001236F
 00012360    mov         dword ptr ds:[0B6434],0A
>0001236A    jmp         00012425
 0001236F    mov         eax,esi
 00012371    sub         eax,edx
 00012373    cmp         edx,dword ptr [eax+8]
>00012376    je          00012387
 00012378    mov         dword ptr ds:[0B6434],0A
>00012382    jmp         00012425
 00012387    add         ebx,edx
 00012389    mov         esi,eax
 0001238B    call        DeleteFree
 00012390    and         ebx,7FFFFFFC
 00012396    mov         eax,esi
 00012398    add         eax,ebx
 0001239A    mov         edi,eax
 0001239C    cmp         edi,dword ptr ds:[0B648C]
>000123A2    jne         000123D0
 000123A4    sub         dword ptr ds:[0B648C],ebx
 000123AA    add         dword ptr ds:[0B6488],ebx
 000123B0    cmp         dword ptr ds:[0B6488],3C00
>000123BA    jle         000123C1
 000123BC    call        FreeCurAlloc
 000123C1    xor         eax,eax
 000123C3    mov         dword ptr [ebp-4],eax
 000123C6    call        @TryFinallyExit
>000123CB    jmp         00012455
 000123D0    mov         edx,dword ptr [eax]
 000123D2    test        dl,2
>000123D5    je          000123F3
 000123D7    and         edx,7FFFFFFC
 000123DD    cmp         edx,4
>000123E0    jge         000123EE
 000123E2    mov         dword ptr ds:[0B6434],0B
>000123EC    jmp         00012425
 000123EE    or          dword ptr [eax],1
>000123F1    jmp         0001241C
 000123F3    mov         eax,edi
 000123F5    cmp         dword ptr [eax+4],0
>000123F9    je          00012406
 000123FB    cmp         dword ptr [eax],0
>000123FE    je          00012406
 00012400    cmp         dword ptr [eax+8],0C
>00012404    jge         00012412
 00012406    mov         dword ptr ds:[0B6434],0B
>00012410    jmp         00012425
 00012412    mov         edx,dword ptr [eax+8]
 00012415    add         ebx,edx
 00012417    call        DeleteFree
 0001241C    mov         edx,ebx
 0001241E    mov         eax,esi
 00012420    call        InsertFree
 00012425    mov         eax,[000B6434]
 0001242A    mov         dword ptr [ebp-4],eax
 0001242D    xor         eax,eax
 0001242F    pop         edx
 00012430    pop         ecx
 00012431    pop         ecx
 00012432    mov         dword ptr fs:[eax],edx
 00012435    push        12455
 0001243A    cmp         byte ptr ds:[0B6049],0
>00012441    je          0001244D
 00012443    push        0B6438
 00012448    call        kernel32.LeaveCriticalSection
 0001244D    ret
>0001244E    jmp         @HandleFinally
>00012453    jmp         0001243A
 00012455    mov         eax,dword ptr [ebp-4]
 00012458    pop         edi
 00012459    pop         esi
 0001245A    pop         ebx
 0001245B    pop         ecx
 0001245C    pop         ebp
 0001245D    ret
*}
end;

//00012460
function ResizeInPlace(p:Pointer; newSize:Integer):Boolean;
begin
{*
 00012460    push        ebx
 00012461    push        esi
 00012462    push        edi
 00012463    push        ebp
 00012464    add         esp,0FFFFFFF8
 00012467    mov         esi,edx
 00012469    add         esi,7
 0001246C    and         esi,0FFFFFFFC
 0001246F    cmp         esi,0C
>00012472    jge         00012479
 00012474    mov         esi,0C
 00012479    mov         ebp,eax
 0001247B    sub         ebp,4
 0001247E    mov         edi,dword ptr [ebp]
 00012481    and         edi,7FFFFFFC
 00012487    mov         eax,ebp
 00012489    add         eax,edi
 0001248B    mov         ebx,eax
 0001248D    cmp         edi,esi
>0001248F    jl          00012518
 00012495    mov         edx,edi
 00012497    sub         edx,esi
 00012499    mov         dword ptr [esp],edx
 0001249C    cmp         ebx,dword ptr ds:[0B648C]
>000124A2    jne         000124DC
 000124A4    mov         eax,dword ptr [esp]
 000124A7    sub         dword ptr ds:[0B648C],eax
 000124AD    mov         eax,dword ptr [esp]
 000124B0    add         dword ptr ds:[0B6488],eax
 000124B6    cmp         dword ptr ds:[0B6488],0C
>000124BD    jge         0001260F
 000124C3    mov         eax,dword ptr [esp]
 000124C6    add         dword ptr ds:[0B648C],eax
 000124CC    mov         eax,dword ptr [esp]
 000124CF    sub         dword ptr ds:[0B6488],eax
 000124D5    mov         esi,edi
>000124D7    jmp         0001260F
 000124DC    mov         ebx,eax
 000124DE    test        byte ptr [ebx],2
>000124E1    jne         000124F0
 000124E3    mov         eax,ebx
 000124E5    mov         edx,dword ptr [eax+8]
 000124E8    add         dword ptr [esp],edx
 000124EB    call        DeleteFree
 000124F0    cmp         dword ptr [esp],0C
>000124F4    jl          00012511
 000124F6    mov         ebx,ebp
 000124F8    add         ebx,esi
 000124FA    mov         eax,dword ptr [esp]
 000124FD    or          eax,2
 00012500    mov         dword ptr [ebx],eax
 00012502    mov         eax,ebx
 00012504    add         eax,4
 00012507    call        InternalFreeMem
>0001250C    jmp         0001260F
 00012511    mov         esi,edi
>00012513    jmp         0001260F
 00012518    mov         eax,esi
 0001251A    sub         eax,edi
 0001251C    mov         dword ptr [esp+4],eax
 00012520    cmp         ebx,dword ptr ds:[0B648C]
>00012526    jne         0001258F
 00012528    mov         eax,[000B6488]
 0001252D    cmp         eax,dword ptr [esp+4]
>00012531    jl          00012586
 00012533    mov         eax,dword ptr [esp+4]
 00012537    sub         dword ptr ds:[0B6488],eax
 0001253D    mov         eax,dword ptr [esp+4]
 00012541    add         dword ptr ds:[0B648C],eax
 00012547    cmp         dword ptr ds:[0B6488],0C
>0001254E    jge         00012568
 00012550    mov         eax,[000B6488]
 00012555    add         dword ptr ds:[0B648C],eax
 0001255B    add         esi,dword ptr ds:[0B6488]
 00012561    xor         eax,eax
 00012563    mov         [000B6488],eax
 00012568    mov         eax,esi
 0001256A    sub         eax,edi
 0001256C    add         dword ptr ds:[0B6428],eax
 00012572    mov         eax,dword ptr [ebp]
 00012575    and         eax,80000003
 0001257A    or          esi,eax
 0001257C    mov         dword ptr [ebp],esi
 0001257F    mov         al,1
>00012581    jmp         00012628
 00012586    call        FreeCurAlloc
 0001258B    mov         ebx,ebp
 0001258D    add         ebx,edi
 0001258F    test        byte ptr [ebx],2
>00012592    jne         000125E1
 00012594    mov         edx,ebx
 00012596    mov         eax,edx
 00012598    mov         ecx,dword ptr [eax+8]
 0001259B    mov         dword ptr [esp],ecx
 0001259E    mov         ecx,dword ptr [esp]
 000125A1    cmp         ecx,dword ptr [esp+4]
>000125A5    jge         000125B5
 000125A7    add         edx,dword ptr [esp]
 000125AA    mov         ebx,edx
 000125AC    mov         eax,dword ptr [esp]
 000125AF    sub         dword ptr [esp+4],eax
>000125B3    jmp         000125E1
 000125B5    call        DeleteFree
 000125BA    mov         eax,dword ptr [esp+4]
 000125BE    sub         dword ptr [esp],eax
 000125C1    cmp         dword ptr [esp],0C
>000125C5    jl          000125D5
 000125C7    mov         eax,ebp
 000125C9    add         eax,esi
 000125CB    mov         edx,dword ptr [esp]
 000125CE    call        InsertFree
>000125D3    jmp         0001260F
 000125D5    add         esi,dword ptr [esp]
 000125D8    mov         ebx,ebp
 000125DA    add         ebx,esi
 000125DC    and         dword ptr [ebx],0FFFFFFFE
>000125DF    jmp         0001260F
 000125E1    mov         eax,dword ptr [ebx]
 000125E3    test        eax,80000000
>000125E8    je          0001260B
 000125EA    and         eax,7FFFFFFC
 000125EF    add         eax,ebx
 000125F1    mov         ebx,eax
 000125F3    mov         edx,dword ptr [esp+4]
 000125F7    mov         eax,ebx
 000125F9    call        NewCommitAt
 000125FE    test        al,al
>00012600    je          0001260B
 00012602    mov         ebx,ebp
 00012604    add         ebx,edi
>00012606    jmp         00012518
 0001260B    xor         eax,eax
>0001260D    jmp         00012628
 0001260F    mov         eax,esi
 00012611    sub         eax,edi
 00012613    add         dword ptr ds:[0B6428],eax
 00012619    mov         eax,dword ptr [ebp]
 0001261C    and         eax,80000003
 00012621    or          esi,eax
 00012623    mov         dword ptr [ebp],esi
 00012626    mov         al,1
 00012628    pop         ecx
 00012629    pop         edx
 0001262A    pop         ebp
 0001262B    pop         edi
 0001262C    pop         esi
 0001262D    pop         ebx
 0001262E    ret
*}
end;

//00012630
function SysReallocMem(P:Pointer; Size:Integer):Pointer;
begin
{*
 00012630    push        ebp
 00012631    mov         ebp,esp
 00012633    push        ecx
 00012634    push        ebx
 00012635    push        esi
 00012636    push        edi
 00012637    mov         esi,edx
 00012639    mov         ebx,eax
 0001263B    cmp         byte ptr ds:[0B6430],0
>00012642    jne         00012657
 00012644    call        InitAllocator
 00012649    test        al,al
>0001264B    jne         00012657
 0001264D    xor         eax,eax
 0001264F    mov         dword ptr [ebp-4],eax
>00012652    jmp         000126E8
 00012657    xor         edx,edx
 00012659    push        ebp
 0001265A    push        126E1
 0001265F    push        dword ptr fs:[edx]
 00012662    mov         dword ptr fs:[edx],esp
 00012665    cmp         byte ptr ds:[0B6049],0
>0001266C    je          00012678
 0001266E    push        0B6438
 00012673    call        kernel32.EnterCriticalSection
 00012678    mov         edx,esi
 0001267A    mov         eax,ebx
 0001267C    call        ResizeInPlace
 00012681    test        al,al
>00012683    je          0001268A
 00012685    mov         dword ptr [ebp-4],ebx
>00012688    jmp         000126C0
 0001268A    mov         eax,esi
 0001268C    call        SysGetMem
 00012691    mov         edi,eax
 00012693    mov         eax,ebx
 00012695    sub         eax,4
 00012698    mov         eax,dword ptr [eax]
 0001269A    and         eax,7FFFFFFC
 0001269F    sub         eax,4
 000126A2    cmp         esi,eax
>000126A4    jge         000126A8
 000126A6    mov         eax,esi
 000126A8    test        edi,edi
>000126AA    je          000126BD
 000126AC    mov         edx,edi
 000126AE    mov         ecx,ebx
 000126B0    xchg        eax,ecx
 000126B1    call        Move
 000126B6    mov         eax,ebx
 000126B8    call        SysFreeMem
 000126BD    mov         dword ptr [ebp-4],edi
 000126C0    xor         eax,eax
 000126C2    pop         edx
 000126C3    pop         ecx
 000126C4    pop         ecx
 000126C5    mov         dword ptr fs:[eax],edx
 000126C8    push        126E8
 000126CD    cmp         byte ptr ds:[0B6049],0
>000126D4    je          000126E0
 000126D6    push        0B6438
 000126DB    call        kernel32.LeaveCriticalSection
 000126E0    ret
>000126E1    jmp         @HandleFinally
>000126E6    jmp         000126CD
 000126E8    mov         eax,dword ptr [ebp-4]
 000126EB    pop         edi
 000126EC    pop         esi
 000126ED    pop         ebx
 000126EE    pop         ecx
 000126EF    pop         ebp
 000126F0    ret
*}
end;

//000126F4
function @GetMem(size:Integer):Pointer;
begin
{*
 000126F4    test        eax,eax
>000126F6    je          00012702
 000126F8    call        dword ptr ds:[0B401C]
 000126FE    or          eax,eax
>00012700    je          00012703
 00012702    ret
 00012703    mov         al,1
>00012705    jmp         Error
 0001270A    ret
*}
end;

//0001270C
function @FreeMem(p:Pointer):Integer;
begin
{*
 0001270C    test        eax,eax
>0001270E    je          0001271A
 00012710    call        dword ptr ds:[0B4020]
 00012716    or          eax,eax
>00012718    jne         0001271B
 0001271A    ret
 0001271B    mov         al,2
>0001271D    jmp         Error
 00012722    ret
*}
end;

//00012724
function @ReallocMem(var P:Pointer; NewSize:Integer):Pointer;
begin
{*
 00012724    mov         ecx,dword ptr [eax]
 00012726    test        ecx,ecx
>00012728    je          0001275C
 0001272A    test        edx,edx
>0001272C    je          00012746
 0001272E    push        eax
 0001272F    mov         eax,ecx
 00012731    call        dword ptr ds:[0B4024]
 00012737    pop         ecx
 00012738    or          eax,eax
>0001273A    je          00012755
 0001273C    mov         dword ptr [ecx],eax
 0001273E    ret
 0001273F    mov         al,2
>00012741    jmp         Error
 00012746    mov         dword ptr [eax],edx
 00012748    mov         eax,ecx
 0001274A    call        dword ptr ds:[0B4020]
 00012750    or          eax,eax
>00012752    jne         0001273F
 00012754    ret
 00012755    mov         al,1
>00012757    jmp         Error
 0001275C    test        edx,edx
>0001275E    je          00012770
 00012760    push        eax
 00012761    mov         eax,edx
 00012763    call        dword ptr ds:[0B401C]
 00012769    pop         ecx
 0001276A    or          eax,eax
>0001276C    je          00012755
 0001276E    mov         dword ptr [ecx],eax
 00012770    ret
*}
end;

//00012774
function RaiseList:Pointer;
begin
{*
 00012774    call        @GetTls
 00012779    mov         eax,dword ptr [eax+0];{RaiseListPtr:Pointer}
 0001277F    ret
*}
end;

//00012780
procedure Error(errorCode:Byte);
begin
{*
 00012780    and         eax,7F
 00012783    mov         ecx,dword ptr ds:[0B6004]
 00012789    test        ecx,ecx
>0001278B    je          00012790
 0001278D    pop         edx
 0001278E    call        ecx
 00012790    dec         eax
 00012791    mov         al,byte ptr [eax+127A9]
>00012797    jns         000127A4
 00012799    call        @GetTls
 0001279E    mov         eax,dword ptr [eax+4];{InOutRes:Integer}
>000127A4    jmp         @RunError
 000127A9    retf
 000127AA    int         3
 000127AB    enter       0D7C9,0CF
 000127AF    enter       0CECD,0DB
 000127B3    fmul        st,st(2)
 000127B5    ???
 000127B6    fcmovu      st,st(4)
 000127B8    fstp        st(6)
 000127BA    fnstsw      al
 000127BC    loope       000127A1
 000127BE    add         ah,ah
 000127C0    in          eax,0C3
 000127C2    mov         eax,eax
 000127C4    push        eax
 000127C5    push        edx
 000127C6    push        ecx
 000127C7    call        @GetTls
 000127CC    cmp         dword ptr [eax+4],0;{InOutRes:Integer}
 000127D3    pop         ecx
 000127D4    pop         edx
 000127D5    pop         eax
>000127D6    jne         000127D9
 000127D8    ret
 000127D9    xor         eax,eax
>000127DB    jmp         Error
 000127E0    ret
*}
end;

//000127C4
procedure @_IOTest;
begin
{*
 000127C4    push        eax
 000127C5    push        edx
 000127C6    push        ecx
 000127C7    call        @GetTls
 000127CC    cmp         dword ptr [eax+4],0;{InOutRes:Integer}
 000127D3    pop         ecx
 000127D4    pop         edx
 000127D5    pop         eax
>000127D6    jne         000127D9
 000127D8    ret
 000127D9    xor         eax,eax
>000127DB    jmp         Error
 000127E0    ret
*}
end;

//000127E4
procedure SetInOutRes(NewValue:Integer);
begin
{*
 000127E4    push        eax
 000127E5    call        @GetTls
 000127EA    pop         dword ptr [eax+4];{InOutRes:Integer}
 000127F0    ret
*}
end;

//000127F4
procedure InOutError;
begin
{*
 000127F4    call        kernel32.GetLastError
>000127F9    jmp         SetInOutRes
 000127FE    ret
*}
end;

//00012800
function IOResult:Integer;
begin
{*
 00012800    call        @GetTls
 00012805    xor         edx,edx
 00012807    mov         ecx,dword ptr [eax+4];{InOutRes:Integer}
 0001280D    mov         dword ptr [eax+4],edx;{InOutRes:Integer}
 00012813    mov         eax,ecx
 00012815    ret
*}
end;

//00012818
procedure Move(const Source:void ; var Dest:void ; Count:Integer);
begin
{*
 00012818    push        esi
 00012819    push        edi
 0001281A    mov         esi,eax
 0001281C    mov         edi,edx
 0001281E    mov         eax,ecx
 00012820    cmp         edi,esi
>00012822    ja          00012837
>00012824    je          00012855
 00012826    sar         ecx,2
>00012829    js          00012855
 0001282B    rep movs    dword ptr [edi],dword ptr [esi]
 0001282D    mov         ecx,eax
 0001282F    and         ecx,3
 00012832    rep movs    byte ptr [edi],byte ptr [esi]
 00012834    pop         edi
 00012835    pop         esi
 00012836    ret
 00012837    lea         esi,[esi+ecx-4]
 0001283B    lea         edi,[edi+ecx-4]
 0001283F    sar         ecx,2
>00012842    js          00012855
 00012844    std
 00012845    rep movs    dword ptr [edi],dword ptr [esi]
 00012847    mov         ecx,eax
 00012849    and         ecx,3
 0001284C    add         esi,3
 0001284F    add         edi,3
 00012852    rep movs    byte ptr [edi],byte ptr [esi]
 00012854    cld
 00012855    pop         edi
 00012856    pop         esi
 00012857    ret
*}
end;

//00012858
function GetParamStr(P:PAnsiChar; var Param:AnsiString):PAnsiChar;
begin
{*
 00012858    push        ebx
 00012859    push        esi
 0001285A    add         esp,0FFFFF004
 00012860    push        eax
 00012861    mov         esi,edx
 00012863    mov         ebx,eax
>00012865    jmp         00012868
 00012867    inc         ebx
 00012868    mov         al,byte ptr [ebx]
 0001286A    test        al,al
>0001286C    je          00012872
 0001286E    cmp         al,20
>00012870    jbe         00012867
 00012872    cmp         byte ptr [ebx],22
>00012875    jne         00012882
 00012877    cmp         byte ptr [ebx+1],22
>0001287B    jne         00012882
 0001287D    add         ebx,2
>00012880    jmp         00012868
 00012882    xor         eax,eax
>00012884    jmp         000128AB
 00012886    cmp         dl,22
>00012889    jne         000128A6
 0001288B    inc         ebx
>0001288C    jmp         00012893
 0001288E    mov         byte ptr [esp+eax],dl
 00012891    inc         eax
 00012892    inc         ebx
 00012893    mov         dl,byte ptr [ebx]
 00012895    test        dl,dl
>00012897    je          0001289E
 00012899    cmp         dl,22
>0001289C    jne         0001288E
 0001289E    cmp         byte ptr [ebx],0
>000128A1    je          000128AB
 000128A3    inc         ebx
>000128A4    jmp         000128AB
 000128A6    mov         byte ptr [esp+eax],dl
 000128A9    inc         eax
 000128AA    inc         ebx
 000128AB    mov         dl,byte ptr [ebx]
 000128AD    cmp         dl,20
>000128B0    jbe         000128B9
 000128B2    cmp         eax,1000
>000128B7    jl          00012886
 000128B9    mov         edx,esp
 000128BB    mov         ecx,esi
 000128BD    xchg        eax,ecx
 000128BE    call        @LStrFromPCharLen
 000128C3    mov         eax,ebx
 000128C5    add         esp,1000
 000128CB    pop         esi
 000128CC    pop         ebx
 000128CD    ret
*}
end;

//000128D0
function ParamStr(Index:Integer):String;
begin
{*
 000128D0    push        ebx
 000128D1    push        esi
 000128D2    push        edi
 000128D3    add         esp,0FFFFFEF8
 000128D9    mov         esi,edx
 000128DB    mov         ebx,eax
 000128DD    test        ebx,ebx
>000128DF    jne         000128FF
 000128E1    push        105
 000128E6    lea         eax,[esp+4]
 000128EA    push        eax
 000128EB    push        0
 000128ED    call        kernel32.GetModuleFileNameA
 000128F2    mov         ecx,eax
 000128F4    mov         edx,esp
 000128F6    mov         eax,esi
 000128F8    call        @LStrFromPCharLen
>000128FD    jmp         0001291D
 000128FF    call        kernel32.GetCommandLineA
 00012904    mov         edi,eax
 00012906    mov         edx,esi
 00012908    mov         eax,edi
 0001290A    call        GetParamStr
 0001290F    mov         edi,eax
 00012911    test        ebx,ebx
>00012913    je          0001291D
 00012915    cmp         dword ptr [esi],0
>00012918    je          0001291D
 0001291A    dec         ebx
>0001291B    jmp         00012906
 0001291D    add         esp,108
 00012923    pop         edi
 00012924    pop         esi
 00012925    pop         ebx
 00012926    ret
*}
end;

//00012928
function UpCase(Ch:Char):Char;
begin
{*
 00012928    cmp         al,61
>0001292B    jb          00012935
 0001292D    cmp         al,7A
>00012930    ja          00012935
 00012932    sub         al,20
 00012935    ret
*}
end;

//00012938
procedure Set8087CW(NewCW:Word);
begin
{*
 00012938    mov         word ptr ds:[0B4000],ax
 0001293F    fldcw       word ptr ds:[0B4000]
 00012945    ret
*}
end;

//00012948
procedure @COS;
begin
{*
 00012948    fcos
 0001294A    fnstsw      al
 0001294C    sahf
>0001294D    jp          00012950
 0001294F    ret
 00012950    fstp        st(0)
 00012952    fldz
 00012954    ret
*}
end;

//00012958
procedure @INT;
begin
{*
 00012958    sub         esp,4
 0001295B    wait
 0001295C    fnstcw      word ptr [esp]
 0001295F    wait
 00012960    fldcw       word ptr ds:[0B4028]
 00012966    frndint
 00012968    wait
 00012969    fldcw       word ptr [esp]
 0001296C    add         esp,4
 0001296F    ret
*}
end;

//00012970
procedure @SIN;
begin
{*
 00012970    fsin
 00012972    fnstsw      al
 00012974    sahf
>00012975    jp          00012978
 00012977    ret
 00012978    fstp        st(0)
 0001297A    fldz
 0001297C    ret
*}
end;

//00012980
procedure @ROUND;
begin
{*
 00012980    sub         esp,8
 00012983    fistp       qword ptr [esp]
 00012986    wait
 00012987    pop         eax
 00012988    pop         edx
 00012989    ret
*}
end;

//0001298C
function @TRUNC(X:Extended):Int64;
begin
{*
 0001298C    sub         esp,0C
 0001298F    wait
 00012990    fnstcw      word ptr [esp]
 00012993    wait
 00012994    fldcw       word ptr ds:[0B4028]
 0001299A    fistp       qword ptr [esp+4]
 0001299E    wait
 0001299F    fldcw       word ptr [esp]
 000129A2    pop         ecx
 000129A3    pop         eax
 000129A4    pop         edx
 000129A5    ret
*}
end;

//000129A8
procedure @AbstractError;
begin
{*
 000129A8    cmp         dword ptr ds:[0B601C],0
>000129AF    je          000129B7
 000129B1    call        dword ptr ds:[0B601C]
 000129B7    mov         eax,0D2
>000129BC    jmp         @RunError
 000129C1    ret
*}
end;

//000129C4
procedure @PStrNCat(Dest:PShortString; Source:PShortString; MaxLen:Byte);
begin
{*
 000129C4    push        esi
 000129C5    push        edi
 000129C6    mov         edi,eax
 000129C8    xor         eax,eax
 000129CA    mov         al,byte ptr [edi]
 000129CC    mov         esi,edx
 000129CE    xor         edx,edx
 000129D0    mov         dl,byte ptr [esi]
 000129D2    inc         esi
 000129D3    add         al,dl
>000129D5    jb          000129E9
 000129D7    cmp         al,cl
>000129D9    ja          000129E9
 000129DB    mov         ecx,edx
 000129DD    mov         dl,byte ptr [edi]
 000129DF    mov         byte ptr [edi],al
 000129E1    inc         edi
 000129E2    add         edi,edx
 000129E4    rep movs    byte ptr [edi],byte ptr [esi]
 000129E6    pop         edi
 000129E7    pop         esi
 000129E8    ret
 000129E9    mov         al,cl
 000129EB    sub         cl,byte ptr [edi]
>000129ED    jbe         000129E6
 000129EF    mov         dl,cl
>000129F1    jmp         000129DB
 000129F3    ret
*}
end;

//000129F4
procedure @PStrCpy(Dest:PShortString; Source:PShortString);
begin
{*
 000129F4    xor         ecx,ecx
 000129F6    push        esi
 000129F7    push        edi
 000129F8    mov         cl,byte ptr [edx]
 000129FA    mov         edi,eax
 000129FC    inc         ecx
 000129FD    mov         esi,edx
 000129FF    mov         eax,ecx
 00012A01    shr         ecx,2
 00012A04    and         eax,3
 00012A07    rep movs    dword ptr [edi],dword ptr [esi]
 00012A09    mov         ecx,eax
 00012A0B    rep movs    byte ptr [edi],byte ptr [esi]
 00012A0D    pop         edi
 00012A0E    pop         esi
 00012A0F    ret
*}
end;

//00012A10
procedure @PStrNCpy(Dest:PShortString; Source:PShortString; MaxLen:Byte);
begin
{*
 00012A10    push        esi
 00012A11    push        edi
 00012A12    mov         edi,eax
 00012A14    xor         eax,eax
 00012A16    mov         esi,edx
 00012A18    mov         al,byte ptr [edx]
 00012A1A    cmp         al,cl
>00012A1C    ja          00012A30
 00012A1E    inc         eax
 00012A1F    mov         ecx,eax
 00012A21    and         eax,3
 00012A24    shr         ecx,2
 00012A27    rep movs    dword ptr [edi],dword ptr [esi]
 00012A29    mov         ecx,eax
 00012A2B    rep movs    byte ptr [edi],byte ptr [esi]
 00012A2D    pop         edi
 00012A2E    pop         esi
 00012A2F    ret
 00012A30    mov         byte ptr [edi],cl
 00012A32    inc         esi
 00012A33    inc         edi
 00012A34    and         ecx,0FF
 00012A3A    rep movs    byte ptr [edi],byte ptr [esi]
 00012A3C    pop         edi
 00012A3D    pop         esi
 00012A3E    ret
*}
end;

//00012A40
procedure @PStrCmp(S1:PShortString; S2:PShortString);
begin
{*
 00012A40    push        ebx
 00012A41    push        esi
 00012A42    push        edi
 00012A43    mov         esi,eax
 00012A45    mov         edi,edx
 00012A47    xor         eax,eax
 00012A49    xor         edx,edx
 00012A4B    mov         al,byte ptr [esi]
 00012A4D    mov         dl,byte ptr [edi]
 00012A4F    inc         esi
 00012A50    inc         edi
 00012A51    sub         eax,edx
>00012A53    ja          00012A57
 00012A55    add         edx,eax
 00012A57    push        edx
 00012A58    shr         edx,2
>00012A5B    je          00012A83
 00012A5D    mov         ecx,dword ptr [esi]
 00012A5F    mov         ebx,dword ptr [edi]
 00012A61    cmp         ecx,ebx
>00012A63    jne         00012AA9
 00012A65    dec         edx
>00012A66    je          00012A7D
 00012A68    mov         ecx,dword ptr [esi+4]
 00012A6B    mov         ebx,dword ptr [edi+4]
 00012A6E    cmp         ecx,ebx
>00012A70    jne         00012AA9
 00012A72    add         esi,8
 00012A75    add         edi,8
 00012A78    dec         edx
>00012A79    jne         00012A5D
>00012A7B    jmp         00012A83
 00012A7D    add         esi,4
 00012A80    add         edi,4
 00012A83    pop         edx
 00012A84    and         edx,3
>00012A87    je          00012AA5
 00012A89    mov         cl,byte ptr [esi]
 00012A8B    cmp         cl,byte ptr [edi]
>00012A8D    jne         00012ABE
 00012A8F    dec         edx
>00012A90    je          00012AA5
 00012A92    mov         cl,byte ptr [esi+1]
 00012A95    cmp         cl,byte ptr [edi+1]
>00012A98    jne         00012ABE
 00012A9A    dec         edx
>00012A9B    je          00012AA5
 00012A9D    mov         cl,byte ptr [esi+2]
 00012AA0    cmp         cl,byte ptr [edi+2]
>00012AA3    jne         00012ABE
 00012AA5    add         eax,eax
>00012AA7    jmp         00012ABE
 00012AA9    pop         edx
 00012AAA    cmp         cl,bl
>00012AAC    jne         00012ABE
 00012AAE    cmp         ch,bh
>00012AB0    jne         00012ABE
 00012AB2    shr         ecx,10
 00012AB5    shr         ebx,10
 00012AB8    cmp         cl,bl
>00012ABA    jne         00012ABE
 00012ABC    cmp         ch,bh
 00012ABE    pop         edi
 00012ABF    pop         esi
 00012AC0    pop         ebx
 00012AC1    ret
*}
end;

//00012AC4
procedure @AStrCmp(S1:PShortString; S2:PShortString; Bytes:Integer);
begin
{*
 00012AC4    push        ebx
 00012AC5    push        esi
 00012AC6    push        ecx
 00012AC7    mov         esi,ecx
 00012AC9    shr         esi,2
>00012ACC    je          00012AF4
 00012ACE    mov         ecx,dword ptr [eax]
 00012AD0    mov         ebx,dword ptr [edx]
 00012AD2    cmp         ecx,ebx
>00012AD4    jne         00012B1B
 00012AD6    dec         esi
>00012AD7    je          00012AEE
 00012AD9    mov         ecx,dword ptr [eax+4]
 00012ADC    mov         ebx,dword ptr [edx+4]
 00012ADF    cmp         ecx,ebx
>00012AE1    jne         00012B1B
 00012AE3    add         eax,8
 00012AE6    add         edx,8
 00012AE9    dec         esi
>00012AEA    jne         00012ACE
>00012AEC    jmp         00012AF4
 00012AEE    add         eax,4
 00012AF1    add         edx,4
 00012AF4    pop         esi
 00012AF5    and         esi,3
>00012AF8    je          00012B30
 00012AFA    mov         cl,byte ptr [eax]
 00012AFC    cmp         cl,byte ptr [edx]
>00012AFE    jne         00012B30
 00012B00    dec         esi
>00012B01    je          00012B16
 00012B03    mov         cl,byte ptr [eax+1]
 00012B06    cmp         cl,byte ptr [edx+1]
>00012B09    jne         00012B30
 00012B0B    dec         esi
>00012B0C    je          00012B16
 00012B0E    mov         cl,byte ptr [eax+2]
 00012B11    cmp         cl,byte ptr [edx+2]
>00012B14    jne         00012B30
 00012B16    xor         eax,eax
 00012B18    pop         esi
 00012B19    pop         ebx
 00012B1A    ret
 00012B1B    pop         esi
 00012B1C    cmp         cl,bl
>00012B1E    jne         00012B30
 00012B20    cmp         ch,bh
>00012B22    jne         00012B30
 00012B24    shr         ecx,10
 00012B27    shr         ebx,10
 00012B2A    cmp         cl,bl
>00012B2C    jne         00012B30
 00012B2E    cmp         ch,bh
 00012B30    pop         esi
 00012B31    pop         ebx
 00012B32    ret
*}
end;

//00012B34
procedure @FillChar(var dst:Pointer; cnt:Integer; val:Char);
begin
{*
 00012B34    push        edi
 00012B35    mov         edi,eax
 00012B37    mov         ch,cl
 00012B39    mov         eax,ecx
 00012B3B    shl         eax,10
 00012B3E    mov         ax,cx
 00012B41    mov         ecx,edx
 00012B43    sar         ecx,2
>00012B46    js          00012B51
 00012B48    rep stos    dword ptr [edi]
 00012B4A    mov         ecx,edx
 00012B4C    and         ecx,3
 00012B4F    rep stos    byte ptr [edi]
 00012B51    pop         edi
 00012B52    ret
*}
end;

//00012B54
function @ValLong(s:AnsiString; var code:Integer):Longint;
begin
{*
 00012B54    push        ebx
 00012B55    push        esi
 00012B56    push        edi
 00012B57    mov         esi,eax
 00012B59    push        eax
 00012B5A    test        eax,eax
>00012B5C    je          00012BD1
 00012B5E    xor         eax,eax
 00012B60    xor         ebx,ebx
 00012B62    mov         edi,0CCCCCCC
 00012B67    mov         bl,byte ptr [esi]
 00012B69    inc         esi
 00012B6A    cmp         bl,20
>00012B6D    je          00012B67
 00012B6F    mov         ch,0
 00012B71    cmp         bl,2D
>00012B74    je          00012BDF
 00012B76    cmp         bl,2B
>00012B79    je          00012BE1
 00012B7B    cmp         bl,24
>00012B7E    je          00012BE6
 00012B80    cmp         bl,78
>00012B83    je          00012BE6
 00012B85    cmp         bl,58
>00012B88    je          00012BE6
 00012B8A    cmp         bl,30
>00012B8D    jne         00012BA2
 00012B8F    mov         bl,byte ptr [esi]
 00012B91    inc         esi
 00012B92    cmp         bl,78
>00012B95    je          00012BE6
 00012B97    cmp         bl,58
>00012B9A    je          00012BE6
 00012B9C    test        bl,bl
>00012B9E    je          00012BC0
>00012BA0    jmp         00012BA6
 00012BA2    test        bl,bl
>00012BA4    je          00012BDA
 00012BA6    sub         bl,30
 00012BA9    cmp         bl,9
>00012BAC    ja          00012BDA
 00012BAE    cmp         eax,edi
>00012BB0    ja          00012BDA
 00012BB2    lea         eax,[eax+eax*4]
 00012BB5    add         eax,eax
 00012BB7    add         eax,ebx
 00012BB9    mov         bl,byte ptr [esi]
 00012BBB    inc         esi
 00012BBC    test        bl,bl
>00012BBE    jne         00012BA6
 00012BC0    dec         ch
>00012BC2    je          00012BD4
 00012BC4    test        eax,eax
>00012BC6    jl          00012BDA
 00012BC8    pop         ecx
 00012BC9    xor         esi,esi
 00012BCB    mov         dword ptr [edx],esi
 00012BCD    pop         edi
 00012BCE    pop         esi
 00012BCF    pop         ebx
 00012BD0    ret
 00012BD1    inc         esi
>00012BD2    jmp         00012BDA
 00012BD4    neg         eax
>00012BD6    jle         00012BC8
>00012BD8    js          00012BC8
 00012BDA    pop         ebx
 00012BDB    sub         esi,ebx
>00012BDD    jmp         00012BCB
 00012BDF    inc         ch
 00012BE1    mov         bl,byte ptr [esi]
 00012BE3    inc         esi
>00012BE4    jmp         00012BA2
 00012BE6    mov         edi,0FFFFFFF
 00012BEB    mov         bl,byte ptr [esi]
 00012BED    inc         esi
 00012BEE    test        bl,bl
>00012BF0    je          00012BD1
 00012BF2    cmp         bl,61
>00012BF5    jb          00012BFA
 00012BF7    sub         bl,20
 00012BFA    sub         bl,30
 00012BFD    cmp         bl,9
>00012C00    jbe         00012C0D
 00012C02    sub         bl,11
 00012C05    cmp         bl,5
>00012C08    ja          00012BDA
 00012C0A    add         bl,0A
 00012C0D    cmp         eax,edi
>00012C0F    ja          00012BDA
 00012C11    shl         eax,4
 00012C14    add         eax,ebx
 00012C16    mov         bl,byte ptr [esi]
 00012C18    inc         esi
 00012C19    test        bl,bl
>00012C1B    jne         00012BF2
>00012C1D    jmp         00012BC8
 00012C1F    ret
*}
end;

//00012C20
procedure @_CToPasStr;
begin
{*
 00012C20    push        eax
 00012C21    mov         cl,0FF
 00012C23    mov         ch,byte ptr [edx]
 00012C25    inc         edx
 00012C26    test        ch,ch
>00012C28    je          00012C31
 00012C2A    inc         eax
 00012C2B    mov         byte ptr [eax],ch
 00012C2D    dec         cl
>00012C2F    jne         00012C23
 00012C31    pop         edx
 00012C32    sub         eax,edx
 00012C34    mov         byte ptr [edx],al
 00012C36    ret
*}
end;

//00012C38
procedure @_CLenToPasStr;
begin
{*
 00012C38    push        ebx
 00012C39    push        eax
 00012C3A    cmp         ecx,0FF
>00012C40    jbe         00012C47
 00012C42    mov         ecx,0FF
 00012C47    mov         bl,byte ptr [edx]
 00012C49    inc         edx
 00012C4A    test        bl,bl
>00012C4C    je          00012C54
 00012C4E    inc         eax
 00012C4F    mov         byte ptr [eax],bl
 00012C51    dec         ecx
>00012C52    jne         00012C47
 00012C54    pop         edx
 00012C55    sub         eax,edx
 00012C57    mov         byte ptr [edx],al
 00012C59    pop         ebx
 00012C5A    ret
*}
end;

//00012C5C
function user32.GetKeyboardType:Integer; stdcall;
begin
{*
 00012C5C    jmp         dword ptr ds:[0B8210]
*}
end;

//00012C64
function @isNECWindows:Boolean;
begin
{*
 00012C64    push        ebx
 00012C65    xor         ebx,ebx
 00012C67    push        0
 00012C69    call        user32.GetKeyboardType
 00012C6E    cmp         eax,7
>00012C71    jne         00012C8F
 00012C73    push        1
 00012C75    call        user32.GetKeyboardType
 00012C7A    and         eax,0FF00
 00012C7F    cmp         eax,0D00
>00012C84    je          00012C8D
 00012C86    cmp         eax,400
>00012C8B    jne         00012C8F
 00012C8D    mov         bl,1
 00012C8F    mov         eax,ebx
 00012C91    pop         ebx
 00012C92    ret
*}
end;

//00012C94
procedure @FpuMaskInit;
begin
{*
 00012C94    push        ebp
 00012C95    mov         ebp,esp
 00012C97    add         esp,0FFFFFFF4
 00012C9A    movzx       eax,word ptr ds:[0B4000]
 00012CA1    mov         dword ptr [ebp-8],eax
 00012CA4    lea         eax,[ebp-4]
 00012CA7    push        eax
 00012CA8    push        1
 00012CAA    push        0
 00012CAC    push        12D2C
 00012CB1    push        80000002
 00012CB6    call        advapi32.RegOpenKeyExA
 00012CBB    test        eax,eax
>00012CBD    jne         00012D0C
 00012CBF    xor         eax,eax
 00012CC1    push        ebp
 00012CC2    push        12D05
 00012CC7    push        dword ptr fs:[eax]
 00012CCA    mov         dword ptr fs:[eax],esp
 00012CCD    mov         dword ptr [ebp-0C],4
 00012CD4    lea         eax,[ebp-0C]
 00012CD7    push        eax
 00012CD8    lea         eax,[ebp-8]
 00012CDB    push        eax
 00012CDC    push        0
 00012CDE    push        0
 00012CE0    push        12D48
 00012CE5    mov         eax,dword ptr [ebp-4]
 00012CE8    push        eax
 00012CE9    call        advapi32.RegQueryValueExA
 00012CEE    xor         eax,eax
 00012CF0    pop         edx
 00012CF1    pop         ecx
 00012CF2    pop         ecx
 00012CF3    mov         dword ptr fs:[eax],edx
 00012CF6    push        12D0C
 00012CFB    mov         eax,dword ptr [ebp-4]
 00012CFE    push        eax
 00012CFF    call        advapi32.RegCloseKey
 00012D04    ret
>00012D05    jmp         @HandleFinally
>00012D0A    jmp         00012CFB
 00012D0C    mov         ax,[000B4000]
 00012D12    and         ax,0FFC0
 00012D16    mov         dx,word ptr [ebp-8]
 00012D1A    and         dx,3F
 00012D1E    or          ax,dx
 00012D21    mov         [000B4000],ax
 00012D27    mov         esp,ebp
 00012D29    pop         ebp
 00012D2A    ret
*}
end;

//00012D58
procedure @FpuInit;
begin
{*
 00012D58    fninit
 00012D5A    wait
 00012D5B    fldcw       word ptr ds:[0B4000]
 00012D61    ret
*}
end;

//00012D64
procedure @BoundErr;
begin
{*
 00012D64    mov         al,4
>00012D66    jmp         Error
 00012D6B    ret
*}
end;

//00012D6C
function TObject.ClassType:TClass;
begin
{*
 00012D6C    mov         eax,dword ptr [eax]
 00012D6E    ret
*}
end;

//00012D70
function TObject.ClassName:ShortString;
begin
{*
 00012D70    push        esi
 00012D71    push        edi
 00012D72    mov         edi,edx
 00012D74    mov         esi,dword ptr [eax-2C]
 00012D77    xor         ecx,ecx
 00012D79    mov         cl,byte ptr [esi]
 00012D7B    inc         ecx
 00012D7C    rep movs    byte ptr [edi],byte ptr [esi]
 00012D7E    pop         edi
 00012D7F    pop         esi
 00012D80    ret
*}
end;

//00012D84
function TObject.ClassNameIs(const Name:AnsiString):Boolean;
begin
{*
 00012D84    push        ebx
 00012D85    xor         ebx,ebx
 00012D87    or          edx,edx
>00012D89    je          00012DA7
 00012D8B    mov         eax,dword ptr [eax-2C]
 00012D8E    xor         ecx,ecx
 00012D90    mov         cl,byte ptr [eax]
 00012D92    cmp         ecx,dword ptr [edx-4]
>00012D95    jne         00012DA7
 00012D97    dec         edx
 00012D98    mov         bh,byte ptr [eax+ecx]
 00012D9B    xor         bh,byte ptr [edx+ecx]
 00012D9E    and         bh,0DF
>00012DA1    jne         00012DA7
 00012DA3    dec         ecx
>00012DA4    jne         00012D98
 00012DA6    inc         ebx
 00012DA7    mov         al,bl
 00012DA9    pop         ebx
 00012DAA    ret
*}
end;

//00012DAC
function TObject.ClassParent:TClass;
begin
{*
 00012DAC    mov         eax,dword ptr [eax-24]
 00012DAF    test        eax,eax
>00012DB1    je          00012DB5
 00012DB3    mov         eax,dword ptr [eax]
 00012DB5    ret
*}
end;

//00012DB8
function TObject.NewInstance:TObject;
begin
{*
 00012DB8    push        eax
 00012DB9    mov         eax,dword ptr [eax-28]
 00012DBC    call        @GetMem
 00012DC1    mov         edx,eax
 00012DC3    pop         eax
>00012DC4    jmp         TObject.InitInstance
 00012DC9    ret
*}
end;

//00012DCC
procedure TObject.FreeInstance;
begin
{*
 00012DCC    push        ebx
 00012DCD    push        esi
 00012DCE    mov         ebx,eax
 00012DD0    mov         esi,eax
 00012DD2    mov         esi,dword ptr [esi]
 00012DD4    mov         edx,dword ptr [esi-40]
 00012DD7    mov         esi,dword ptr [esi-24]
 00012DDA    test        edx,edx
>00012DDC    je          00012DE5
 00012DDE    call        @FinalizeRecord
 00012DE3    mov         eax,ebx
 00012DE5    test        esi,esi
>00012DE7    jne         00012DD2
 00012DE9    call        @FreeMem
 00012DEE    pop         esi
 00012DEF    pop         ebx
 00012DF0    ret
*}
end;

//00012DF4
constructor TObject.Create;
begin
{*
 00012DF4    test        dl,dl
>00012DF6    je          00012E00
 00012DF8    add         esp,0FFFFFFF0
 00012DFB    call        @ClassCreate
 00012E00    test        dl,dl
>00012E02    je          00012E13
 00012E04    call        @AfterConstruction
 00012E09    pop         dword ptr fs:[0]
 00012E10    add         esp,0C
 00012E13    ret
*}
end;

//00012E14
destructor TObject.Destroy;
begin
{*
 00012E14    call        @BeforeDestruction
 00012E19    test        dl,dl
>00012E1B    jle         00012E22
 00012E1D    call        @ClassDestroy
 00012E22    ret
*}
end;

//00012E24
procedure TObject.Free;
begin
{*
 00012E24    test        eax,eax
>00012E26    je          00012E2F
 00012E28    mov         ecx,dword ptr [eax]
 00012E2A    mov         dl,1
 00012E2C    call        dword ptr [ecx-4]
 00012E2F    ret
*}
end;

//00012E30
function TObject.InitInstance(Instance:Pointer):TObject;
begin
{*
 00012E30    push        ebx
 00012E31    push        esi
 00012E32    push        edi
 00012E33    mov         ebx,eax
 00012E35    mov         edi,edx
 00012E37    stos        dword ptr [edi]
 00012E38    mov         ecx,dword ptr [ebx-28]
 00012E3B    xor         eax,eax
 00012E3D    push        ecx
 00012E3E    shr         ecx,2
 00012E41    dec         ecx
 00012E42    rep stos    dword ptr [edi]
 00012E44    pop         ecx
 00012E45    and         ecx,3
 00012E48    rep stos    byte ptr [edi]
 00012E4A    mov         eax,edx
 00012E4C    mov         edx,esp
 00012E4E    mov         ecx,dword ptr [ebx-48]
 00012E51    test        ecx,ecx
>00012E53    je          00012E56
 00012E55    push        ecx
 00012E56    mov         ebx,dword ptr [ebx-24]
 00012E59    test        ebx,ebx
>00012E5B    je          00012E61
 00012E5D    mov         ebx,dword ptr [ebx]
>00012E5F    jmp         00012E4E
 00012E61    cmp         esp,edx
>00012E63    je          00012E82
 00012E65    pop         ebx
 00012E66    mov         ecx,dword ptr [ebx]
 00012E68    add         ebx,4
 00012E6B    mov         esi,dword ptr [ebx+10]
 00012E6E    test        esi,esi
>00012E70    je          00012E78
 00012E72    mov         edi,dword ptr [ebx+14]
 00012E75    mov         dword ptr [eax+edi],esi
 00012E78    add         ebx,1C
 00012E7B    dec         ecx
>00012E7C    jne         00012E6B
 00012E7E    cmp         esp,edx
>00012E80    jne         00012E65
 00012E82    pop         edi
 00012E83    pop         esi
 00012E84    pop         ebx
 00012E85    ret
*}
end;

//00012E88
function InvokeImplGetter(Self:TObject; ImplGetter:Integer):IUnknown;
begin
{*
 00012E88    xchg        ecx,edx
 00012E8A    cmp         ecx,0FF000000
>00012E90    jae         00012EA3
 00012E92    cmp         ecx,0FE000000
>00012E98    jb          00012EA1
 00012E9A    movsx       ecx,cx
 00012E9D    add         ecx,dword ptr [eax]
 00012E9F    jmp         dword ptr [ecx]
 00012EA1    jmp         ecx
 00012EA3    and         ecx,0FFFFFF
 00012EA9    add         ecx,eax
 00012EAB    mov         eax,edx
 00012EAD    mov         edx,dword ptr [ecx]
>00012EAF    jmp         @IntfCopy
 00012EB4    ret
*}
end;

//00012EB8
function TObject.GetInterface(const IID:TGUID; var Obj:void ):Boolean;
begin
{*
 00012EB8    push        ebp
 00012EB9    mov         ebp,esp
 00012EBB    add         esp,0FFFFFFF8
 00012EBE    push        ebx
 00012EBF    push        esi
 00012EC0    push        edi
 00012EC1    xor         ebx,ebx
 00012EC3    mov         dword ptr [ebp-8],ebx
 00012EC6    mov         edi,ecx
 00012EC8    mov         dword ptr [ebp-4],edx
 00012ECB    mov         esi,eax
 00012ECD    xor         eax,eax
 00012ECF    push        ebp
 00012ED0    push        12F46
 00012ED5    push        dword ptr fs:[eax]
 00012ED8    mov         dword ptr fs:[eax],esp
 00012EDB    mov         edx,dword ptr [ebp-4]
 00012EDE    mov         eax,dword ptr [esi]
 00012EE0    call        TObject.GetInterfaceEntry
 00012EE5    mov         ebx,eax
 00012EE7    test        ebx,ebx
>00012EE9    je          00012F2A
 00012EEB    mov         eax,dword ptr [ebx+14]
 00012EEE    test        eax,eax
>00012EF0    je          00012EF8
 00012EF2    add         esi,eax
 00012EF4    mov         dword ptr [edi],esi
>00012EF6    jmp         00012F0F
 00012EF8    lea         ecx,[ebp-8]
 00012EFB    mov         edx,dword ptr [ebx+18]
 00012EFE    mov         eax,esi
 00012F00    call        InvokeImplGetter
 00012F05    mov         edx,dword ptr [ebp-8]
 00012F08    mov         eax,edi
 00012F0A    call        @IntfCopy
 00012F0F    cmp         dword ptr [edi],0
>00012F12    je          00012F26
 00012F14    cmp         dword ptr [ebx+14],0
>00012F18    je          00012F22
 00012F1A    mov         eax,dword ptr [edi]
 00012F1C    push        eax
 00012F1D    mov         eax,dword ptr [eax]
 00012F1F    call        dword ptr [eax+4]
 00012F22    mov         bl,1
>00012F24    jmp         00012F30
 00012F26    xor         ebx,ebx
>00012F28    jmp         00012F30
 00012F2A    xor         eax,eax
 00012F2C    mov         dword ptr [edi],eax
 00012F2E    xor         ebx,ebx
 00012F30    xor         eax,eax
 00012F32    pop         edx
 00012F33    pop         ecx
 00012F34    pop         ecx
 00012F35    mov         dword ptr fs:[eax],edx
 00012F38    push        12F4D
 00012F3D    lea         eax,[ebp-8]
 00012F40    call        @IntfClear
 00012F45    ret
>00012F46    jmp         @HandleFinally
>00012F4B    jmp         00012F3D
 00012F4D    mov         eax,ebx
 00012F4F    pop         edi
 00012F50    pop         esi
 00012F51    pop         ebx
 00012F52    pop         ecx
 00012F53    pop         ecx
 00012F54    pop         ebp
 00012F55    ret
*}
end;

//00012F58
function TObject.GetInterfaceEntry(const IID:TGUID):PInterfaceEntry;
begin
{*
 00012F58    push        ebx
 00012F59    push        esi
 00012F5A    mov         ebx,eax
 00012F5C    mov         eax,dword ptr [ebx-48]
 00012F5F    test        eax,eax
>00012F61    je          00012F8C
 00012F63    mov         ecx,dword ptr [eax]
 00012F65    add         eax,4
 00012F68    mov         esi,dword ptr [edx]
 00012F6A    cmp         esi,dword ptr [eax]
>00012F6C    jne         00012F86
 00012F6E    mov         esi,dword ptr [edx+4]
 00012F71    cmp         esi,dword ptr [eax+4]
>00012F74    jne         00012F86
 00012F76    mov         esi,dword ptr [edx+8]
 00012F79    cmp         esi,dword ptr [eax+8]
>00012F7C    jne         00012F86
 00012F7E    mov         esi,dword ptr [edx+0C]
 00012F81    cmp         esi,dword ptr [eax+0C]
>00012F84    je          00012F99
 00012F86    add         eax,1C
 00012F89    dec         ecx
>00012F8A    jne         00012F68
 00012F8C    mov         ebx,dword ptr [ebx-24]
 00012F8F    test        ebx,ebx
>00012F91    je          00012F97
 00012F93    mov         ebx,dword ptr [ebx]
>00012F95    jmp         00012F5C
 00012F97    xor         eax,eax
 00012F99    pop         esi
 00012F9A    pop         ebx
 00012F9B    ret
*}
end;

//00012F9C
function @IsClass(Child:TObject; Parent:TClass):Boolean;
begin
{*
 00012F9C    test        eax,eax
>00012F9E    je          00012FB0
 00012FA0    mov         eax,dword ptr [eax]
 00012FA2    cmp         eax,edx
>00012FA4    je          00012FAE
 00012FA6    mov         eax,dword ptr [eax-24]
 00012FA9    test        eax,eax
>00012FAB    jne         00012FA0
 00012FAD    ret
 00012FAE    mov         al,1
 00012FB0    ret
*}
end;

//00012FB4
function @AsClass(child:TObject; parent:TClass):TObject;
begin
{*
 00012FB4    test        eax,eax
>00012FB6    je          00012FCE
 00012FB8    mov         ecx,eax
 00012FBA    mov         ecx,dword ptr [ecx]
 00012FBC    cmp         ecx,edx
>00012FBE    je          00012FCE
 00012FC0    mov         ecx,dword ptr [ecx-24]
 00012FC3    test        ecx,ecx
>00012FC5    jne         00012FBA
 00012FC7    mov         al,0A
>00012FC9    jmp         Error
 00012FCE    ret
*}
end;

//00012FD0
procedure GetDynaMethod;
begin
{*
 00012FD0    push        edi
 00012FD1    xchg        eax,ebx
>00012FD2    jmp         00012FD6
 00012FD4    mov         ebx,dword ptr [ebx]
 00012FD6    mov         edi,dword ptr [ebx-30]
 00012FD9    test        edi,edi
>00012FDB    je          00012FEA
 00012FDD    movzx       ecx,word ptr [edi]
 00012FE0    push        ecx
 00012FE1    add         edi,2
 00012FE4    repne scas  word ptr [edi]
>00012FE7    je          00012FF3
 00012FE9    pop         ecx
 00012FEA    mov         ebx,dword ptr [ebx-24]
 00012FED    test        ebx,ebx
>00012FEF    jne         00012FD4
 00012FF1    pop         edi
 00012FF2    ret
 00012FF3    pop         eax
 00012FF4    add         eax,eax
 00012FF6    sub         eax,ecx
 00012FF8    mov         ebx,dword ptr [edi+eax*2-4]
 00012FFC    pop         edi
 00012FFD    ret
*}
end;

//00013000
procedure @CallDynaInst;
begin
{*
 00013000    push        eax
 00013001    push        ecx
 00013002    mov         eax,dword ptr [eax]
 00013004    call        GetDynaMethod
 00013009    pop         ecx
 0001300A    pop         eax
>0001300B    je          0001300F
 0001300D    jmp         ebx
 0001300F    pop         ecx
>00013010    jmp         @AbstractError
 00013015    ret
*}
end;

//00013018
procedure @FindDynaInst;
begin
{*
 00013018    push        ebx
 00013019    mov         ebx,edx
 0001301B    mov         eax,dword ptr [eax]
 0001301D    call        GetDynaMethod
 00013022    mov         eax,ebx
 00013024    pop         ebx
>00013025    jne         0001302D
 00013027    pop         ecx
>00013028    jmp         @AbstractError
 0001302D    ret
*}
end;

//00013030
function TObject.ClassInfo:Pointer;
begin
{*
 00013030    mov         eax,dword ptr [eax-3C]
 00013033    ret
*}
end;

//00013034
function TObject.SafeCallException(ExceptObject:TObject; ExceptAddr:Pointer):HRESULT;
begin
{*
 00013034    mov         eax,8000FFFF
 00013039    ret
*}
end;

//0001303C
procedure TObject.DefaultHandler(var Message:void );
begin
{*
 0001303C    ret
*}
end;

//00013040
procedure TList.AfterConstruction;
begin
{*
 00013040    ret
*}
end;

//00013044
procedure TList.BeforeDestruction;
begin
{*
 00013044    ret
*}
end;

//00013048
procedure TObject.Dispatch(var Message:void );
begin
{*
 00013048    push        ebx
 00013049    mov         bx,word ptr [edx]
 0001304C    or          bx,bx
>0001304F    je          00013068
 00013051    cmp         bx,0C000
>00013056    jae         00013068
 00013058    push        eax
 00013059    mov         eax,dword ptr [eax]
 0001305B    call        GetDynaMethod
 00013060    pop         eax
>00013061    je          00013068
 00013063    mov         ecx,ebx
 00013065    pop         ebx
 00013066    jmp         ecx
 00013068    pop         ebx
 00013069    mov         ecx,dword ptr [eax]
 0001306B    jmp         dword ptr [ecx-10]
 0001306E    ret
*}
end;

//00013070
function TObject.MethodAddress(const Name:ShortString):Pointer;
begin
{*
 00013070    push        ebx
 00013071    push        esi
 00013072    push        edi
 00013073    xor         ecx,ecx
 00013075    xor         edi,edi
 00013077    mov         bl,byte ptr [edx]
>00013079    jmp         0001307D
 0001307B    mov         eax,dword ptr [eax]
 0001307D    mov         esi,dword ptr [eax-34]
 00013080    test        esi,esi
>00013082    je          00013099
 00013084    mov         di,word ptr [esi]
 00013087    add         esi,2
 0001308A    mov         cl,byte ptr [esi+6]
 0001308D    cmp         cl,bl
>0001308F    je          000130A6
 00013091    mov         cx,word ptr [esi]
 00013094    add         esi,ecx
 00013096    dec         edi
>00013097    jne         0001308A
 00013099    mov         eax,dword ptr [eax-24]
 0001309C    test        eax,eax
>0001309E    jne         0001307B
>000130A0    jmp         000130BA
 000130A2    mov         bl,byte ptr [edx]
>000130A4    jmp         00013091
 000130A6    mov         ch,0
 000130A8    mov         bl,byte ptr [esi+ecx+6]
 000130AC    xor         bl,byte ptr [edx+ecx]
 000130AF    and         bl,0DF
>000130B2    jne         000130A2
 000130B4    dec         ecx
>000130B5    jne         000130A8
 000130B7    mov         eax,dword ptr [esi+2]
 000130BA    pop         edi
 000130BB    pop         esi
 000130BC    pop         ebx
 000130BD    ret
*}
end;

//000130C0
function TObject.MethodName(Address:Pointer):ShortString;
begin
{*
 000130C0    push        ebx
 000130C1    push        esi
 000130C2    push        edi
 000130C3    mov         edi,ecx
 000130C5    xor         ebx,ebx
 000130C7    xor         ecx,ecx
>000130C9    jmp         000130CD
 000130CB    mov         eax,dword ptr [eax]
 000130CD    mov         esi,dword ptr [eax-34]
 000130D0    test        esi,esi
>000130D2    je          000130E7
 000130D4    mov         cx,word ptr [esi]
 000130D7    add         esi,2
 000130DA    cmp         edx,dword ptr [esi+2]
>000130DD    je          000130F2
 000130DF    mov         bx,word ptr [esi]
 000130E2    add         esi,ebx
 000130E4    dec         ecx
>000130E5    jne         000130DA
 000130E7    mov         eax,dword ptr [eax-24]
 000130EA    test        eax,eax
>000130EC    jne         000130CB
 000130EE    mov         byte ptr [edi],al
>000130F0    jmp         000130FC
 000130F2    add         esi,6
 000130F5    xor         ecx,ecx
 000130F7    mov         cl,byte ptr [esi]
 000130F9    inc         ecx
 000130FA    rep movs    byte ptr [edi],byte ptr [esi]
 000130FC    pop         edi
 000130FD    pop         esi
 000130FE    pop         ebx
 000130FF    ret
*}
end;

//00013100
function TObject.FieldAddress(const Name:ShortString):Pointer;
begin
{*
 00013100    push        ebx
 00013101    push        esi
 00013102    push        edi
 00013103    xor         ecx,ecx
 00013105    xor         edi,edi
 00013107    mov         bl,byte ptr [edx]
 00013109    push        eax
 0001310A    mov         eax,dword ptr [eax]
 0001310C    mov         esi,dword ptr [eax-38]
 0001310F    test        esi,esi
>00013111    je          00013127
 00013113    mov         di,word ptr [esi]
 00013116    add         esi,6
 00013119    mov         cl,byte ptr [esi+6]
 0001311C    cmp         cl,bl
>0001311E    je          00013138
 00013120    lea         esi,[esi+ecx+7]
 00013124    dec         edi
>00013125    jne         00013119
 00013127    mov         eax,dword ptr [eax-24]
 0001312A    test        eax,eax
>0001312C    jne         0001310A
 0001312E    pop         edx
>0001312F    jmp         0001314C
 00013131    mov         bl,byte ptr [edx]
 00013133    mov         cl,byte ptr [esi+6]
>00013136    jmp         00013120
 00013138    mov         bl,byte ptr [esi+ecx+6]
 0001313C    xor         bl,byte ptr [edx+ecx]
 0001313F    and         bl,0DF
>00013142    jne         00013131
 00013144    dec         ecx
>00013145    jne         00013138
 00013147    mov         eax,dword ptr [esi]
 00013149    pop         edx
 0001314A    add         eax,edx
 0001314C    pop         edi
 0001314D    pop         esi
 0001314E    pop         ebx
 0001314F    ret
*}
end;

//00013150
procedure @ClassCreate;
begin
{*
 00013150    push        edx
 00013151    push        ecx
 00013152    push        ebx
 00013153    test        dl,dl
>00013155    jl          0001315A
 00013157    call        dword ptr [eax-0C]
 0001315A    xor         edx,edx
 0001315C    lea         ecx,[esp+10]
 00013160    mov         ebx,dword ptr fs:[edx]
 00013163    mov         dword ptr [ecx],ebx
 00013165    mov         dword ptr [ecx+8],ebp
 00013168    mov         dword ptr [ecx+4],13179
 0001316F    mov         dword ptr [ecx+0C],eax
 00013172    mov         dword ptr fs:[edx],ecx
 00013175    pop         ebx
 00013176    pop         ecx
 00013177    pop         edx
 00013178    ret
*}
end;

//000131A0
procedure @ClassDestroy;
begin
{*
 000131A0    mov         edx,dword ptr [eax]
 000131A2    call        dword ptr [edx-8]
 000131A5    ret
*}
end;

//000131A8
procedure @AfterConstruction;
begin
{*
 000131A8    push        eax
 000131A9    mov         edx,dword ptr [eax]
 000131AB    call        dword ptr [edx-1C]
 000131AE    pop         eax
 000131AF    ret
*}
end;

//000131B0
procedure @BeforeDestruction;
begin
{*
 000131B0    test        dl,dl
>000131B2    jg          000131B5
 000131B4    ret
 000131B5    push        eax
 000131B6    push        edx
 000131B7    mov         edx,dword ptr [eax]
 000131B9    call        dword ptr [edx-18]
 000131BC    pop         edx
 000131BD    pop         eax
 000131BE    ret
*}
end;

//000131C0
procedure NotifyReRaise;
begin
{*
 000131C0    cmp         byte ptr ds:[0B4008],1
>000131C7    jbe         000131D9
 000131C9    push        0
 000131CB    push        0
 000131CD    push        0
 000131CF    push        0EEDFADF
 000131D4    call        kernel32.RaiseException
 000131D9    ret
*}
end;

//000131DC
procedure NotifyNonDelphiException;
begin
{*
 000131DC    cmp         byte ptr ds:[0B4008],0
>000131E3    je          000131FB
 000131E5    push        eax
 000131E6    push        eax
 000131E7    push        edx
 000131E8    push        esp
 000131E9    push        2
 000131EB    push        0
 000131ED    push        0EEDFAE4
 000131F2    call        kernel32.RaiseException
 000131F7    add         esp,8
 000131FA    pop         eax
 000131FB    ret
*}
end;

//000131FC
procedure NotifyExcept;
begin
{*
 000131FC    push        esp
 000131FD    push        1
 000131FF    push        0
 00013201    push        0EEDFAE0
 00013206    call        kernel32.RaiseException
 0001320B    add         esp,4
 0001320E    pop         eax
 0001320F    ret
*}
end;

//00013210
procedure NotifyOnExcept;
begin
{*
 00013210    cmp         byte ptr ds:[0B4008],1
>00013217    jbe         00013222
 00013219    push        eax
 0001321A    push        dword ptr [ebx+4]
>0001321D    jmp         NotifyExcept
 00013222    ret
*}
end;

//00013224
procedure NotifyAnyExcept;
begin
{*
 00013224    cmp         byte ptr ds:[0B4008],1
>0001322B    jbe         00013234
 0001322D    push        eax
 0001322E    push        ebx
>0001322F    jmp         NotifyExcept
 00013234    ret
*}
end;

//00013238
procedure CheckJmp;
begin
{*
 00013238    test        ecx,ecx
>0001323A    je          00013255
 0001323C    mov         eax,dword ptr [ecx+1]
 0001323F    cmp         byte ptr [ecx],0E9
>00013242    je          00013250
 00013244    cmp         byte ptr [ecx],0EB
>00013247    jne         00013255
 00013249    movsx       eax,al
 0001324C    inc         ecx
 0001324D    inc         ecx
>0001324E    jmp         00013253
 00013250    add         ecx,5
 00013253    add         ecx,eax
 00013255    ret
*}
end;

//00013258
procedure NotifyExceptFinally;
begin
{*
 00013258    cmp         byte ptr ds:[0B4008],1
>0001325F    jbe         0001327D
 00013261    push        eax
 00013262    push        edx
 00013263    push        ecx
 00013264    call        CheckJmp
 00013269    push        ecx
 0001326A    push        esp
 0001326B    push        1
 0001326D    push        0
 0001326F    push        0EEDFAE1
 00013274    call        kernel32.RaiseException
 00013279    pop         ecx
 0001327A    pop         ecx
 0001327B    pop         edx
 0001327C    pop         eax
 0001327D    ret
*}
end;

//00013280
procedure NotifyTerminate;
begin
{*
 00013280    cmp         byte ptr ds:[0B4008],1
>00013287    jbe         0001329A
 00013289    push        edx
 0001328A    push        esp
 0001328B    push        1
 0001328D    push        0
 0001328F    push        0EEDFAE2
 00013294    call        kernel32.RaiseException
 00013299    pop         edx
 0001329A    ret
*}
end;

//0001329C
procedure NotifyUnhandled;
begin
{*
 0001329C    push        eax
 0001329D    push        edx
 0001329E    cmp         byte ptr ds:[0B4008],1
>000132A5    jbe         000132B6
 000132A7    push        esp
 000132A8    push        2
 000132AA    push        0
 000132AC    push        0EEDFAE3
 000132B1    call        kernel32.RaiseException
 000132B6    pop         edx
 000132B7    pop         eax
 000132B8    ret
*}
end;

//000132BC
procedure @HandleAnyException;
begin
{*
 000132BC    mov         eax,dword ptr [esp+4]
 000132C0    test        dword ptr [eax+4],6
>000132C7    jne         00013386
 000132CD    cmp         dword ptr [eax],0EEDFADE
 000132D3    mov         edx,dword ptr [eax+18]
 000132D6    mov         ecx,dword ptr [eax+14]
>000132D9    je          00013317
 000132DB    cld
 000132DC    call        @FpuInit
 000132E1    mov         edx,dword ptr ds:[0B600C]
 000132E7    test        edx,edx
>000132E9    je          00013386
 000132EF    call        edx
 000132F1    test        eax,eax
>000132F3    je          00013386
 000132F9    mov         edx,dword ptr [esp+0C]
 000132FD    mov         ecx,dword ptr [esp+4]
 00013301    cmp         dword ptr [ecx],0EEFFACE
>00013307    je          0001330E
 00013309    call        NotifyNonDelphiException
 0001330E    mov         edx,eax
 00013310    mov         eax,dword ptr [esp+4]
 00013314    mov         ecx,dword ptr [eax+0C]
 00013317    or          dword ptr [eax+4],2
 0001331B    push        ebx
 0001331C    xor         ebx,ebx
 0001331E    push        esi
 0001331F    push        edi
 00013320    push        ebp
 00013321    mov         ebx,dword ptr fs:[ebx]
 00013324    push        ebx
 00013325    push        eax
 00013326    push        edx
 00013327    push        ecx
 00013328    mov         edx,dword ptr [esp+28]
 0001332C    push        0
 0001332E    push        eax
 0001332F    push        1333A
 00013334    push        edx
 00013335    call        kernel32.RtlUnwind
 0001333A    mov         edi,dword ptr [esp+28]
 0001333E    call        @GetTls
 00013343    push        dword ptr [eax+0];{RaiseListPtr:Pointer}
 00013349    mov         dword ptr [eax+0],esp;{RaiseListPtr:Pointer}
 0001334F    mov         ebp,dword ptr [edi+8]
 00013352    mov         ebx,dword ptr [edi+4]
 00013355    mov         dword ptr [edi+4],13366
 0001335C    add         ebx,5
 0001335F    call        NotifyAnyExcept
 00013364    jmp         ebx
>00013366    jmp         @HandleFinally
 0001336B    call        @GetTls
 00013370    mov         ecx,dword ptr [eax+0];{RaiseListPtr:Pointer}
 00013376    mov         edx,dword ptr [ecx]
 00013378    mov         dword ptr [eax+0],edx;{RaiseListPtr:Pointer}
 0001337E    mov         eax,dword ptr [ecx+8]
>00013381    jmp         TObject.Free
 00013386    mov         eax,1
 0001338B    ret
*}
end;

//0001338C
procedure @HandleOnException;
begin
{*
 0001338C    mov         eax,dword ptr [esp+4]
 00013390    test        dword ptr [eax+4],6
>00013397    jne         000134BB
 0001339D    cmp         dword ptr [eax],0EEDFADE
>000133A3    je          000133C4
 000133A5    cld
 000133A6    call        @FpuInit
 000133AB    mov         edx,dword ptr ds:[0B6008]
 000133B1    test        edx,edx
>000133B3    je          000134BB
 000133B9    call        edx
 000133BB    test        eax,eax
>000133BD    jne         000133C9
>000133BF    jmp         000134BB
 000133C4    mov         eax,dword ptr [eax+18]
 000133C7    mov         eax,dword ptr [eax]
 000133C9    mov         edx,dword ptr [esp+8]
 000133CD    push        ebx
 000133CE    push        esi
 000133CF    push        edi
 000133D0    push        ebp
 000133D1    mov         ecx,dword ptr [edx+4]
 000133D4    mov         ebx,dword ptr [ecx+5]
 000133D7    lea         esi,[ecx+9]
 000133DA    mov         ebp,eax
 000133DC    mov         eax,dword ptr [esi]
 000133DE    test        eax,eax
>000133E0    je          00013425
 000133E2    mov         edi,ebp
>000133E4    jmp         000133E8
 000133E6    mov         edi,dword ptr [edi]
 000133E8    mov         eax,dword ptr [eax]
 000133EA    cmp         eax,edi
>000133EC    je          00013425
 000133EE    mov         ecx,dword ptr [eax-28]
 000133F1    cmp         ecx,dword ptr [edi-28]
>000133F4    jne         0001340D
 000133F6    mov         eax,dword ptr [eax-2C]
 000133F9    mov         edx,dword ptr [edi-2C]
 000133FC    xor         ecx,ecx
 000133FE    mov         cl,byte ptr [eax]
 00013400    cmp         cl,byte ptr [edx]
>00013402    jne         0001340D
 00013404    inc         eax
 00013405    inc         edx
 00013406    call        @AStrCmp
>0001340B    je          00013425
 0001340D    mov         edi,dword ptr [edi-24]
 00013410    mov         eax,dword ptr [esi]
 00013412    test        edi,edi
>00013414    jne         000133E6
 00013416    add         esi,8
 00013419    dec         ebx
>0001341A    jne         000133DC
 0001341C    pop         ebp
 0001341D    pop         edi
 0001341E    pop         esi
 0001341F    pop         ebx
>00013420    jmp         000134BB
 00013425    mov         eax,dword ptr [esp+14]
 00013429    cmp         dword ptr [eax],0EEDFADE
 0001342F    mov         edx,dword ptr [eax+18]
 00013432    mov         ecx,dword ptr [eax+14]
>00013435    je          0001344F
 00013437    call        dword ptr ds:[0B600C]
 0001343D    mov         edx,dword ptr [esp+1C]
 00013441    call        NotifyNonDelphiException
 00013446    mov         edx,eax
 00013448    mov         eax,dword ptr [esp+14]
 0001344C    mov         ecx,dword ptr [eax+0C]
 0001344F    xor         ebx,ebx
 00013451    mov         ebx,dword ptr fs:[ebx]
 00013454    push        ebx
 00013455    push        eax
 00013456    push        edx
 00013457    push        ecx
 00013458    mov         edx,dword ptr [esp+28]
 0001345C    or          dword ptr [eax+4],2
 00013460    push        esi
 00013461    push        0
 00013463    push        eax
 00013464    push        1346F
 00013469    push        edx
 0001346A    call        kernel32.RtlUnwind
 0001346F    pop         ebx
 00013470    mov         edi,dword ptr [esp+28]
 00013474    call        @GetTls
 00013479    push        dword ptr [eax+0];{RaiseListPtr:Pointer}
 0001347F    mov         dword ptr [eax+0],esp;{RaiseListPtr:Pointer}
 00013485    mov         ebp,dword ptr [edi+8]
 00013488    mov         dword ptr [edi+4],1349B
 0001348F    mov         eax,dword ptr [esp+8]
 00013493    call        NotifyOnExcept
 00013498    jmp         dword ptr [ebx+4]
>0001349B    jmp         @HandleFinally
 000134A0    call        @GetTls
 000134A5    mov         ecx,dword ptr [eax+0];{RaiseListPtr:Pointer}
 000134AB    mov         edx,dword ptr [ecx]
 000134AD    mov         dword ptr [eax+0],edx;{RaiseListPtr:Pointer}
 000134B3    mov         eax,dword ptr [ecx+8]
>000134B6    jmp         TObject.Free
 000134BB    mov         eax,1
 000134C0    ret
*}
end;

//000134C4
procedure @HandleFinally;
begin
{*
 000134C4    mov         eax,dword ptr [esp+4]
 000134C8    mov         edx,dword ptr [esp+8]
 000134CC    test        dword ptr [eax+4],6
>000134D3    je          000134F4
 000134D5    mov         ecx,dword ptr [edx+4]
 000134D8    mov         dword ptr [edx+4],134F4
 000134DF    push        ebx
 000134E0    push        esi
 000134E1    push        edi
 000134E2    push        ebp
 000134E3    mov         ebp,dword ptr [edx+8]
 000134E6    add         ecx,5
 000134E9    call        NotifyExceptFinally
 000134EE    call        ecx
 000134F0    pop         ebp
 000134F1    pop         edi
 000134F2    pop         esi
 000134F3    pop         ebx
 000134F4    mov         eax,1
 000134F9    ret
*}
end;

//000134FC
procedure @RaiseExcept;
begin
{*
 000134FC    pop         edx
 000134FD    push        esp
 000134FE    push        ebp
 000134FF    push        edi
 00013500    push        esi
 00013501    push        ebx
 00013502    push        eax
 00013503    push        edx
 00013504    push        esp
 00013505    push        7
 00013507    push        1
 00013509    push        0EEDFADE
 0001350E    push        edx
>0001350F    jmp         kernel32.RaiseException
 00013514    ret
*}
end;

//00013518
procedure @RaiseAgain;
begin
{*
 00013518    mov         eax,dword ptr [esp+30]
 0001351C    mov         dword ptr [eax+4],13563
 00013523    call        @GetTls
 00013528    mov         edx,dword ptr [eax+0];{RaiseListPtr:Pointer}
 0001352E    mov         ecx,dword ptr [edx]
 00013530    mov         dword ptr [eax+0],ecx;{RaiseListPtr:Pointer}
 00013536    mov         eax,dword ptr [edx+0C]
 00013539    and         dword ptr [eax+4],0FFFFFFFD
 0001353D    cmp         dword ptr [eax],0EEDFADE
>00013543    je          00013552
 00013545    mov         eax,dword ptr [edx+8]
 00013548    call        TObject.Free
 0001354D    call        NotifyReRaise
 00013552    xor         eax,eax
 00013554    add         esp,14
 00013557    mov         edx,dword ptr fs:[eax]
 0001355A    pop         ecx
 0001355B    mov         edx,dword ptr [edx]
 0001355D    mov         dword ptr [ecx],edx
 0001355F    pop         ebp
 00013560    pop         edi
 00013561    pop         esi
 00013562    pop         ebx
 00013563    mov         eax,1
 00013568    ret
*}
end;

//0001356C
procedure @DoneExcept;
begin
{*
 0001356C    call        @GetTls
 00013571    mov         edx,dword ptr [eax+0];{RaiseListPtr:Pointer}
 00013577    mov         ecx,dword ptr [edx]
 00013579    mov         dword ptr [eax+0],ecx;{RaiseListPtr:Pointer}
 0001357F    mov         eax,dword ptr [edx+8]
 00013582    call        TObject.Free
 00013587    pop         edx
 00013588    mov         esp,dword ptr [esp+2C]
 0001358C    xor         eax,eax
 0001358E    pop         ecx
 0001358F    mov         dword ptr fs:[eax],ecx
 00013592    pop         eax
 00013593    pop         ebp
 00013594    call        NotifyTerminate
 00013599    jmp         edx
 0001359B    ret
*}
end;

//0001359C
procedure @TryFinallyExit;
begin
{*
 0001359C    xor         edx,edx
 0001359E    mov         ecx,dword ptr [esp+8]
 000135A2    mov         eax,dword ptr [esp+4]
 000135A6    add         ecx,5
 000135A9    mov         dword ptr fs:[edx],eax
 000135AC    call        ecx
 000135AE    ret         0C
*}
end;

//000135B4
procedure RunErrorAt(ErrCode:Integer; ErrorAddr:Pointer);
begin
{*
 000135B4    mov         dword ptr [esp],edx
>000135B7    jmp         @RunError
 000135BC    ret
*}
end;

//000135C0
procedure MapToRunError(P:PExceptionRecord); stdcall;
begin
{*
 000135C0    push        ebp
 000135C1    mov         ebp,esp
 000135C3    mov         edx,dword ptr [ebp+8]
 000135C6    mov         eax,dword ptr [edx]
 000135C8    cmp         eax,0C0000092
>000135CD    jg          000135FB
>000135CF    je          0001362D
 000135D1    cmp         eax,0C000008E
>000135D6    jg          000135ED
>000135D8    je          00013631
 000135DA    sub         eax,0C0000005
>000135DF    je          0001363D
 000135E1    sub         eax,87
>000135E6    je          00013625
 000135E8    dec         eax
>000135E9    je          00013639
>000135EB    jmp         0001364D
 000135ED    add         eax,3FFFFF71
 000135F2    sub         eax,2
>000135F5    jb          0001362D
>000135F7    je          00013629
>000135F9    jmp         0001364D
 000135FB    cmp         eax,0C0000096
>00013600    jg          00013613
>00013602    je          00013641
 00013604    sub         eax,0C0000093
>00013609    je          00013639
 0001360B    dec         eax
>0001360C    je          00013621
 0001360E    dec         eax
>0001360F    je          00013635
>00013611    jmp         0001364D
 00013613    sub         eax,0C00000FD
>00013618    je          00013649
 0001361A    sub         eax,3D
>0001361D    je          00013645
>0001361F    jmp         0001364D
 00013621    mov         al,0C8
>00013623    jmp         0001364F
 00013625    mov         al,0C9
>00013627    jmp         0001364F
 00013629    mov         al,0CD
>0001362B    jmp         0001364F
 0001362D    mov         al,0CF
>0001362F    jmp         0001364F
 00013631    mov         al,0C8
>00013633    jmp         0001364F
 00013635    mov         al,0D7
>00013637    jmp         0001364F
 00013639    mov         al,0CE
>0001363B    jmp         0001364F
 0001363D    mov         al,0D8
>0001363F    jmp         0001364F
 00013641    mov         al,0DA
>00013643    jmp         0001364F
 00013645    mov         al,0D9
>00013647    jmp         0001364F
 00013649    mov         al,0CA
>0001364B    jmp         0001364F
 0001364D    mov         al,0FF
 0001364F    and         eax,0FF
 00013654    mov         edx,dword ptr [edx+0C]
 00013657    call        RunErrorAt
 0001365C    pop         ebp
 0001365D    ret         4
*}
end;

//00013660
procedure @ExceptionHandler;
begin
{*
 00013660    mov         eax,dword ptr [esp+4]
 00013664    test        dword ptr [eax+4],6
>0001366B    jne         000136D9
 0001366D    cld
 0001366E    call        @FpuInit
 00013673    mov         edx,dword ptr [esp+8]
 00013677    push        0
 00013679    push        eax
 0001367A    push        13685
 0001367F    push        edx
 00013680    call        kernel32.RtlUnwind
 00013685    mov         ebx,dword ptr [esp+4]
 00013689    cmp         dword ptr [ebx],0EEDFADE
 0001368F    mov         edx,dword ptr [ebx+14]
 00013692    mov         eax,dword ptr [ebx+18]
>00013695    je          000136B4
 00013697    mov         edx,dword ptr ds:[0B600C]
 0001369D    test        edx,edx
>0001369F    je          000135C0
 000136A5    mov         eax,ebx
 000136A7    call        edx
 000136A9    test        eax,eax
>000136AB    je          000135C0
 000136B1    mov         edx,dword ptr [ebx+0C]
 000136B4    call        NotifyUnhandled
 000136B9    mov         ecx,dword ptr ds:[0B6000]
 000136BF    test        ecx,ecx
>000136C1    je          000136C5
 000136C3    call        ecx
 000136C5    mov         ecx,dword ptr [esp+4]
 000136C9    mov         eax,0D9
 000136CE    mov         edx,dword ptr [ecx+14]
 000136D1    mov         dword ptr [esp],edx
>000136D4    jmp         @RunError
 000136D9    xor         eax,eax
 000136DB    ret
*}
end;

//000136DC
procedure SetExceptionHandler;
begin
{*
 000136DC    xor         edx,edx
 000136DE    lea         eax,[ebp-0C]
 000136E1    mov         ecx,dword ptr fs:[edx]
 000136E4    mov         dword ptr fs:[edx],eax
 000136E7    mov         dword ptr [eax],ecx
 000136E9    mov         dword ptr [eax+4],13660;@ExceptionHandler
 000136F0    mov         dword ptr [eax+8],ebp
 000136F3    mov         dword ptr ds:[0B64A8],eax
 000136F9    ret
*}
end;

//000136FC
procedure UnsetExceptionHandler;
begin
{*
 000136FC    xor         edx,edx
 000136FE    mov         eax,dword ptr ds:[0B64A8]
 00013704    mov         ecx,dword ptr fs:[edx]
 00013707    cmp         eax,ecx
>00013709    jne         00013713
 0001370B    mov         eax,dword ptr [eax]
 0001370D    mov         dword ptr fs:[edx],eax
 00013710    ret
 00013711    mov         ecx,dword ptr [ecx]
 00013713    cmp         ecx,0FFFFFFFF
>00013716    je          00013720
 00013718    cmp         dword ptr [ecx],eax
>0001371A    jne         00013711
 0001371C    mov         eax,dword ptr [eax]
 0001371E    mov         dword ptr [ecx],eax
 00013720    ret
*}
end;

//00013724
procedure FInitUnits;
begin
{*
 00013724    push        ebp
 00013725    mov         ebp,esp
 00013727    push        ebx
 00013728    push        esi
 00013729    push        edi
 0001372A    mov         edi,0B64A4
 0001372F    mov         eax,dword ptr [edi+8]
 00013732    test        eax,eax
>00013734    je          0001377E
 00013736    mov         ebx,dword ptr [edi+0C]
 00013739    mov         esi,dword ptr [eax+4]
 0001373C    xor         edx,edx
 0001373E    push        ebp
 0001373F    push        1376A
 00013744    push        dword ptr fs:[edx]
 00013747    mov         dword ptr fs:[edx],esp
 0001374A    test        ebx,ebx
>0001374C    jle         00013760
 0001374E    dec         ebx
 0001374F    mov         dword ptr [edi+0C],ebx
 00013752    mov         eax,dword ptr [esi+ebx*8+4]
 00013756    test        eax,eax
>00013758    je          0001375C
 0001375A    call        eax
 0001375C    test        ebx,ebx
>0001375E    jg          0001374E
 00013760    xor         eax,eax
 00013762    pop         edx
 00013763    pop         ecx
 00013764    pop         ecx
 00013765    mov         dword ptr fs:[eax],edx
>00013768    jmp         0001377E
>0001376A    jmp         @HandleAnyException
 0001376F    call        FInitUnits
 00013774    call        @RaiseAgain
 00013779    call        @DoneExcept
 0001377E    pop         edi
 0001377F    pop         esi
 00013780    pop         ebx
 00013781    pop         ebp
 00013782    ret
*}
end;

//00013784
procedure InitUnits;
begin
{*
 00013784    push        ebp
 00013785    mov         ebp,esp
 00013787    push        ebx
 00013788    push        esi
 00013789    push        edi
 0001378A    mov         eax,[000B64AC]
 0001378F    test        eax,eax
>00013791    je          000137DE
 00013793    mov         esi,dword ptr [eax]
 00013795    xor         ebx,ebx
 00013797    mov         edi,dword ptr [eax+4]
 0001379A    xor         edx,edx
 0001379C    push        ebp
 0001379D    push        137CA
 000137A2    push        dword ptr fs:[edx]
 000137A5    mov         dword ptr fs:[edx],esp
 000137A8    cmp         esi,ebx
>000137AA    jle         000137C0
 000137AC    mov         eax,dword ptr [edi+ebx*8]
 000137AF    inc         ebx
 000137B0    mov         dword ptr ds:[0B64B0],ebx
 000137B6    test        eax,eax
>000137B8    je          000137BC
 000137BA    call        eax
 000137BC    cmp         esi,ebx
>000137BE    jg          000137AC
 000137C0    xor         eax,eax
 000137C2    pop         edx
 000137C3    pop         ecx
 000137C4    pop         ecx
 000137C5    mov         dword ptr fs:[eax],edx
>000137C8    jmp         000137DE
>000137CA    jmp         @HandleAnyException
 000137CF    call        FInitUnits
 000137D4    call        @RaiseAgain
 000137D9    call        @DoneExcept
 000137DE    pop         edi
 000137DF    pop         esi
 000137E0    pop         ebx
 000137E1    pop         ebp
 000137E2    ret
*}
end;

//000137E4
procedure @StartExe;
begin
{*
 000137E4    mov         dword ptr ds:[0B64AC],eax
 000137EA    xor         eax,eax
 000137EC    mov         dword ptr ds:[0B64B0],eax
 000137F2    mov         dword ptr ds:[0B64B4],edx
 000137F8    mov         eax,dword ptr [edx+4]
 000137FB    mov         dword ptr ds:[0B6020],eax
 00013801    call        SetExceptionHandler
 00013806    mov         byte ptr ds:[0B6028],0
 0001380D    call        InitUnits
 00013812    ret
*}
end;

//00013814
procedure @InitResStringImports;
begin
{*
 00013814    push        ebx
 00013815    push        esi
 00013816    mov         ebx,dword ptr [eax]
 00013818    lea         esi,[eax+4]
 0001381B    mov         eax,dword ptr [esi+4]
 0001381E    mov         edx,dword ptr [esi]
 00013820    mov         eax,dword ptr [eax]
 00013822    call        LoadResString
 00013827    add         esi,8
 0001382A    dec         ebx
>0001382B    jne         0001381B
 0001382D    pop         esi
 0001382E    pop         ebx
 0001382F    ret
*}
end;

//00013830
procedure @InitImports;
begin
{*
 00013830    push        ebx
 00013831    push        esi
 00013832    mov         ebx,dword ptr [eax]
 00013834    lea         esi,[eax+4]
 00013837    mov         eax,dword ptr [esi+4]
 0001383A    mov         edx,dword ptr [esi]
 0001383C    mov         ecx,dword ptr [esi+8]
 0001383F    mov         eax,dword ptr [eax]
 00013841    add         eax,ecx
 00013843    mov         dword ptr [edx],eax
 00013845    add         esi,0C
 00013848    dec         ebx
>00013849    jne         00013837
 0001384B    pop         esi
 0001384C    pop         ebx
 0001384D    ret
*}
end;

//00013850
procedure MakeErrorMessage;
begin
{*
 00013850    push        ebx
 00013851    mov         eax,dword ptr ds:[0B6038];gvar_000B6038
 00013857    mov         ebx,0B403C
 0001385C    mov         ecx,0A
 00013861    xor         edx,edx
 00013863    div         eax,ecx
 00013865    add         dl,30
 00013868    mov         byte ptr [ebx],dl
 0001386A    dec         ebx
 0001386B    test        eax,eax
>0001386D    jne         00013861
 0001386F    mov         eax,dword ptr ds:[0B6040];gvar_000B6040
 00013875    call        FindHInstance
 0001387A    mov         edx,dword ptr ds:[0B6040];gvar_000B6040
 00013880    xchg        eax,edx
 00013881    sub         eax,edx
 00013883    mov         ebx,0B4048
 00013888    mov         edx,eax
 0001388A    and         edx,0F
 0001388D    mov         dl,byte ptr [edx+0B4054]
 00013893    mov         byte ptr [ebx],dl
 00013895    dec         ebx
 00013896    shr         eax,4
>00013899    jne         00013888
 0001389B    pop         ebx
 0001389C    ret
*}
end;

//000138A0
procedure ExitDll;
begin
{*
 000138A0    mov         edi,0B64A4
 000138A5    mov         ebx,dword ptr ds:[0B64BC]
 000138AB    mov         ebp,dword ptr ds:[0B64B8]
 000138B1    push        dword ptr [edi+1C]
 000138B4    push        dword ptr [edi+20]
 000138B7    mov         esi,dword ptr [edi]
 000138B9    mov         ecx,0B
 000138BE    rep movs    dword ptr [edi],dword ptr [esi]
 000138C0    pop         edi
 000138C1    pop         esi
 000138C2    xor         eax,eax
 000138C4    xchg        eax,dword ptr ds:[0B6038];gvar_000B6038
 000138CA    neg         eax
 000138CC    sbb         eax,eax
 000138CE    inc         eax
 000138CF    leave
 000138D0    ret         0C
*}
end;

//000138D4
procedure @Halt0;
begin
{*
 000138D4    push        ebx
 000138D5    push        esi
 000138D6    push        edi
 000138D7    push        ebp
 000138D8    mov         ebx,0B64A4
 000138DD    mov         esi,0B6038;gvar_000B6038
 000138E2    mov         edi,0B603C
 000138E7    cmp         byte ptr [ebx+24],0
>000138EB    jne         00013903
 000138ED    cmp         dword ptr [edi],0
>000138F0    je          00013903
 000138F2    mov         edx,dword ptr [edi]
 000138F4    mov         eax,edx
 000138F6    xor         edx,edx
 000138F8    mov         dword ptr [edi],edx
 000138FA    mov         ebp,eax
 000138FC    call        ebp
 000138FE    cmp         dword ptr [edi],0
>00013901    jne         000138F2
 00013903    cmp         dword ptr ds:[0B6040],0;gvar_000B6040
>0001390A    je          0001394A
 0001390C    call        MakeErrorMessage
 00013911    cmp         byte ptr ds:[0B6048],0
>00013918    je          00013930
 0001391A    mov         edx,0B402C
 0001391F    mov         eax,0B621C;gvar_000B621C:TFileRec
 00013924    call        @Write0CString
 00013929    call        @WriteLn
>0001392E    jmp         00013943
 00013930    push        0
 00013932    push        0B404C
 00013937    push        0B402C
 0001393C    push        0
 0001393E    call        user32.MessageBoxA
 00013943    xor         eax,eax
 00013945    mov         [000B6040],eax;gvar_000B6040
 0001394A    cmp         byte ptr [ebx+24],2
>0001394E    jne         0001395A
 00013950    cmp         dword ptr [esi],0
>00013953    jne         0001395A
 00013955    xor         eax,eax
 00013957    mov         dword ptr [ebx+0C],eax
 0001395A    call        FInitUnits
 0001395F    cmp         byte ptr [ebx+24],1
>00013963    jbe         0001396A
 00013965    cmp         dword ptr [esi],0
>00013968    je          00013987
 0001396A    mov         eax,dword ptr [ebx+10]
 0001396D    test        eax,eax
>0001396F    je          00013987
 00013971    call        UnregisterModule
 00013976    mov         eax,dword ptr [ebx+10]
 00013979    mov         edx,dword ptr [eax+10]
 0001397C    cmp         edx,dword ptr [eax+4]
>0001397F    je          00013987
 00013981    push        edx
 00013982    call        kernel32.FreeLibrary
 00013987    call        UnsetExceptionHandler
 0001398C    cmp         byte ptr [ebx+24],1
>00013990    jne         00013995
 00013992    call        dword ptr [ebx+28]
 00013995    cmp         byte ptr [ebx+24],0
>00013999    je          000139A0
 0001399B    call        ExitDll
 000139A0    cmp         dword ptr [ebx],0
>000139A3    jne         000139AD
 000139A5    mov         eax,dword ptr [esi]
 000139A7    push        eax
 000139A8    call        kernel32.ExitProcess
 000139AD    mov         eax,dword ptr [ebx]
 000139AF    push        esi
 000139B0    mov         esi,eax
 000139B2    mov         edi,ebx
 000139B4    mov         ecx,0B
 000139B9    rep movs    dword ptr [edi],dword ptr [esi]
 000139BB    pop         esi
>000139BC    jmp         0001394A
 000139BE    push        eax
 000139BF    outs        dl,dword ptr [esi]
>000139C0    jb          00013A36
 000139C2    imul        ebp,dword ptr [edi+6E],6F432073
>000139C9    jo          00013A44
>000139CB    jb          00013A36
 000139CD    push        63282074
 000139D3    sub         dword ptr [eax],esp
 000139D5    xor         dword ptr [ecx],edi
 000139D7    cmp         byte ptr [ebx],dh
 000139D9    sub         al,39
 000139DB    aaa
 000139DC    and         byte ptr [edx+6F],al
>000139DF    jb          00013A4D
 000139E1    popad
 000139E2    outs        dl,byte ptr [esi]
 000139E3    add         byte ptr fs:[ebp+5F],bl
 000139E7    pop         esi
 000139E8    pop         ebx
 000139E9    ret
 000139EA    mov         eax,eax
 000139EC    mov         dword ptr ds:[0B6038],eax;gvar_000B6038
>000139F2    jmp         @Halt0
 000139F7    ret
 000139F8    pop         dword ptr ds:[0B6040];gvar_000B6040
>000139FE    jmp         @Halt
 00013A03    ret
 00013A04    mov         edx,dword ptr [eax]
 00013A06    test        edx,edx
>00013A08    je          00013A25
 00013A0A    mov         dword ptr [eax],0
 00013A10    mov         ecx,dword ptr [edx-8]
 00013A13    dec         ecx
>00013A14    jl          00013A25
 00013A16    mov         dword ptr [edx-8],ecx
>00013A19    jne         00013A25
 00013A1B    push        eax
 00013A1C    lea         eax,[edx-8]
 00013A1F    call        @FreeMem
 00013A24    pop         eax
 00013A25    ret
 00013A26    mov         eax,eax
 00013A28    push        ebx
 00013A29    push        esi
 00013A2A    mov         ebx,eax
 00013A2C    mov         esi,edx
 00013A2E    mov         edx,dword ptr [ebx]
 00013A30    test        edx,edx
>00013A32    je          00013A4D
 00013A34    mov         dword ptr [ebx],0
 00013A3A    mov         ecx,dword ptr [edx-8]
 00013A3D    dec         ecx
>00013A3E    jl          00013A4D
 00013A40    mov         dword ptr [edx-8],ecx
>00013A43    jne         00013A4D
 00013A45    lea         eax,[edx-8]
 00013A48    call        @FreeMem
 00013A4D    add         ebx,4
 00013A50    dec         esi
>00013A51    jne         00013A2E
 00013A53    pop         esi
 00013A54    pop         ebx
 00013A55    ret
*}
end;

//000139EC
procedure @Halt;
begin
{*
 000139EC    mov         dword ptr ds:[0B6038],eax;gvar_000B6038
>000139F2    jmp         @Halt0
 000139F7    ret
*}
end;

//000139F8
procedure @RunError;
begin
{*
 000139F8    pop         dword ptr ds:[0B6040];gvar_000B6040
>000139FE    jmp         @Halt
 00013A03    ret
*}
end;

//00013A04
procedure @LStrClr(var S:AnsiString);
begin
{*
 00013A04    mov         edx,dword ptr [eax]
 00013A06    test        edx,edx
>00013A08    je          00013A25
 00013A0A    mov         dword ptr [eax],0
 00013A10    mov         ecx,dword ptr [edx-8]
 00013A13    dec         ecx
>00013A14    jl          00013A25
 00013A16    mov         dword ptr [edx-8],ecx
>00013A19    jne         00013A25
 00013A1B    push        eax
 00013A1C    lea         eax,[edx-8]
 00013A1F    call        @FreeMem
 00013A24    pop         eax
 00013A25    ret
*}
end;

//00013A28
procedure @LStrArrayClr(var StrArray:Pointer; Count:Integer);
begin
{*
 00013A28    push        ebx
 00013A29    push        esi
 00013A2A    mov         ebx,eax
 00013A2C    mov         esi,edx
 00013A2E    mov         edx,dword ptr [ebx]
 00013A30    test        edx,edx
>00013A32    je          00013A4D
 00013A34    mov         dword ptr [ebx],0
 00013A3A    mov         ecx,dword ptr [edx-8]
 00013A3D    dec         ecx
>00013A3E    jl          00013A4D
 00013A40    mov         dword ptr [edx-8],ecx
>00013A43    jne         00013A4D
 00013A45    lea         eax,[edx-8]
 00013A48    call        @FreeMem
 00013A4D    add         ebx,4
 00013A50    dec         esi
>00013A51    jne         00013A2E
 00013A53    pop         esi
 00013A54    pop         ebx
 00013A55    ret
*}
end;

//00013A58
procedure @LStrAsg(var Dest:AnsiString; Source:AnsiString);
begin
{*
 00013A58    test        edx,edx
>00013A5A    je          00013A7F
 00013A5C    mov         ecx,dword ptr [edx-8]
 00013A5F    inc         ecx
>00013A60    jg          00013A7C
 00013A62    push        eax
 00013A63    push        edx
 00013A64    mov         eax,dword ptr [edx-4]
 00013A67    call        @NewAnsiString
 00013A6C    mov         edx,eax
 00013A6E    pop         eax
 00013A6F    push        edx
 00013A70    mov         ecx,dword ptr [eax-4]
 00013A73    call        Move
 00013A78    pop         edx
 00013A79    pop         eax
>00013A7A    jmp         00013A7F
 00013A7C    mov         dword ptr [edx-8],ecx
 00013A7F    xchg        edx,dword ptr [eax]
 00013A81    test        edx,edx
>00013A83    je          00013A98
 00013A85    mov         ecx,dword ptr [edx-8]
 00013A88    dec         ecx
>00013A89    jl          00013A98
 00013A8B    mov         dword ptr [edx-8],ecx
>00013A8E    jne         00013A98
 00013A90    lea         eax,[edx-8]
 00013A93    call        @FreeMem
 00013A98    ret
*}
end;

//00013A9C
procedure @LStrLAsg(var Dest:AnsiString; const Source:AnsiString);
begin
{*
 00013A9C    test        edx,edx
>00013A9E    je          00013AA9
 00013AA0    mov         ecx,dword ptr [edx-8]
 00013AA3    inc         ecx
>00013AA4    jle         00013AA9
 00013AA6    mov         dword ptr [edx-8],ecx
 00013AA9    xchg        edx,dword ptr [eax]
 00013AAB    test        edx,edx
>00013AAD    je          00013AC2
 00013AAF    mov         ecx,dword ptr [edx-8]
 00013AB2    dec         ecx
>00013AB3    jl          00013AC2
 00013AB5    mov         dword ptr [edx-8],ecx
>00013AB8    jne         00013AC2
 00013ABA    lea         eax,[edx-8]
 00013ABD    call        @FreeMem
 00013AC2    ret
*}
end;

//00013AC4
procedure @NewAnsiString;
begin
{*
 00013AC4    test        eax,eax
>00013AC6    jle         00013AE4
 00013AC8    push        eax
 00013AC9    add         eax,9
 00013ACC    call        @GetMem
 00013AD1    add         eax,8
 00013AD4    pop         edx
 00013AD5    mov         dword ptr [eax-4],edx
 00013AD8    mov         dword ptr [eax-8],1
 00013ADF    mov         byte ptr [eax+edx],0
 00013AE3    ret
 00013AE4    xor         eax,eax
 00013AE6    ret
*}
end;

//00013AE8
procedure @LStrFromPCharLen(var Dest:AnsiString; Source:PAnsiChar; Length:Integer);
begin
{*
 00013AE8    push        ebx
 00013AE9    push        esi
 00013AEA    push        edi
 00013AEB    mov         ebx,eax
 00013AED    mov         esi,edx
 00013AEF    mov         edi,ecx
 00013AF1    mov         eax,edi
 00013AF3    call        @NewAnsiString
 00013AF8    mov         ecx,edi
 00013AFA    mov         edi,eax
 00013AFC    test        esi,esi
>00013AFE    je          00013B09
 00013B00    mov         edx,eax
 00013B02    mov         eax,esi
 00013B04    call        Move
 00013B09    mov         eax,ebx
 00013B0B    call        @LStrClr
 00013B10    mov         dword ptr [ebx],edi
 00013B12    pop         edi
 00013B13    pop         esi
 00013B14    pop         ebx
 00013B15    ret
*}
end;

//00013B18
procedure @LStrFromPWCharLen(var Dest:AnsiString; Source:PWideChar; Length:Integer);
begin
{*
 00013B18    push        ebx
 00013B19    push        esi
 00013B1A    push        edi
 00013B1B    push        ebp
 00013B1C    add         esp,0FFFFF800
 00013B22    mov         ebx,ecx
 00013B24    mov         ebp,edx
 00013B26    mov         edi,eax
 00013B28    test        ebx,ebx
>00013B2A    jg          00013B35
 00013B2C    mov         eax,edi
 00013B2E    call        @LStrClr
>00013B33    jmp         00013B9C
 00013B35    cmp         ebx,400
>00013B3B    jge         00013B69
 00013B3D    push        0
 00013B3F    push        0
 00013B41    push        800
 00013B46    lea         eax,[esp+0C]
 00013B4A    push        eax
 00013B4B    push        ebx
 00013B4C    push        ebp
 00013B4D    push        0
 00013B4F    push        0
 00013B51    call        kernel32.WideCharToMultiByte
 00013B56    mov         esi,eax
 00013B58    test        esi,esi
>00013B5A    jle         00013B69
 00013B5C    mov         edx,esp
 00013B5E    mov         eax,edi
 00013B60    mov         ecx,esi
 00013B62    call        @LStrFromPCharLen
>00013B67    jmp         00013B9C
 00013B69    push        0
 00013B6B    push        0
 00013B6D    push        0
 00013B6F    push        0
 00013B71    push        ebx
 00013B72    push        ebp
 00013B73    push        0
 00013B75    push        0
 00013B77    call        kernel32.WideCharToMultiByte
 00013B7C    mov         esi,eax
 00013B7E    mov         eax,edi
 00013B80    mov         ecx,esi
 00013B82    xor         edx,edx
 00013B84    call        @LStrFromPCharLen
 00013B89    push        0
 00013B8B    push        0
 00013B8D    push        esi
 00013B8E    mov         eax,dword ptr [edi]
 00013B90    push        eax
 00013B91    push        ebx
 00013B92    push        ebp
 00013B93    push        0
 00013B95    push        0
 00013B97    call        kernel32.WideCharToMultiByte
 00013B9C    add         esp,800
 00013BA2    pop         ebp
 00013BA3    pop         edi
 00013BA4    pop         esi
 00013BA5    pop         ebx
 00013BA6    ret
*}
end;

//00013BA8
procedure @LStrFromChar(var Dest:AnsiString; Source:AnsiChar);
begin
{*
 00013BA8    push        edx
 00013BA9    mov         edx,esp
 00013BAB    mov         ecx,1
 00013BB0    call        @LStrFromPCharLen
 00013BB5    pop         edx
 00013BB6    ret
*}
end;

//00013BB8
procedure @LStrFromPChar(var Dest:AnsiString; Source:PAnsiChar);
begin
{*
 00013BB8    xor         ecx,ecx
 00013BBA    test        edx,edx
>00013BBC    je          00013BDF
 00013BBE    push        edx
 00013BBF    cmp         cl,byte ptr [edx]
>00013BC1    je          00013BDA
 00013BC3    cmp         cl,byte ptr [edx+1]
>00013BC6    je          00013BD9
 00013BC8    cmp         cl,byte ptr [edx+2]
>00013BCB    je          00013BD8
 00013BCD    cmp         cl,byte ptr [edx+3]
>00013BD0    je          00013BD7
 00013BD2    add         edx,4
>00013BD5    jmp         00013BBF
 00013BD7    inc         edx
 00013BD8    inc         edx
 00013BD9    inc         edx
 00013BDA    mov         ecx,edx
 00013BDC    pop         edx
 00013BDD    sub         ecx,edx
>00013BDF    jmp         @LStrFromPCharLen
 00013BE4    ret
*}
end;

//00013BE8
procedure @LStrFromPWChar(var Dest:AnsiString; Source:PWideChar);
begin
{*
 00013BE8    xor         ecx,ecx
 00013BEA    test        edx,edx
>00013BEC    je          00013C1B
 00013BEE    push        edx
 00013BEF    cmp         cx,word ptr [edx]
>00013BF2    je          00013C14
 00013BF4    cmp         cx,word ptr [edx+2]
>00013BF8    je          00013C11
 00013BFA    cmp         cx,word ptr [edx+4]
>00013BFE    je          00013C0E
 00013C00    cmp         cx,word ptr [edx+6]
>00013C04    je          00013C0B
 00013C06    add         edx,8
>00013C09    jmp         00013BEF
 00013C0B    add         edx,2
 00013C0E    add         edx,2
 00013C11    add         edx,2
 00013C14    mov         ecx,edx
 00013C16    pop         edx
 00013C17    sub         ecx,edx
 00013C19    shr         ecx,1
>00013C1B    jmp         @LStrFromPWCharLen
 00013C20    ret
*}
end;

//00013C24
procedure @LStrFromString(var Dest:AnsiString; const Source:ShortString);
begin
{*
 00013C24    xor         ecx,ecx
 00013C26    mov         cl,byte ptr [edx]
 00013C28    inc         edx
>00013C29    jmp         @LStrFromPCharLen
 00013C2E    ret
*}
end;

//00013C30
procedure @LStrFromArray(var Dest:AnsiString; Source:PAnsiChar; Length:Integer);
begin
{*
 00013C30    push        edi
 00013C31    push        eax
 00013C32    push        ecx
 00013C33    mov         edi,edx
 00013C35    xor         eax,eax
 00013C37    repne scas  byte ptr [edi]
>00013C39    jne         00013C3D
 00013C3B    not         ecx
 00013C3D    pop         eax
 00013C3E    add         ecx,eax
 00013C40    pop         eax
 00013C41    pop         edi
>00013C42    jmp         @LStrFromPCharLen
 00013C47    ret
*}
end;

//00013C48
procedure @LStrFromWStr(var Dest:AnsiString; const Source:WideString);
begin
{*
 00013C48    xor         ecx,ecx
 00013C4A    test        edx,edx
>00013C4C    je          00013C53
 00013C4E    mov         ecx,dword ptr [edx-4]
 00013C51    shr         ecx,1
>00013C53    jmp         @LStrFromPWCharLen
 00013C58    ret
*}
end;

//00013C5C
procedure @LStrToString(var Dest:ShortString; const Source:AnsiString; MaxLen:Integer);
begin
{*
 00013C5C    push        ebx
 00013C5D    test        edx,edx
>00013C5F    je          00013C79
 00013C61    mov         ebx,dword ptr [edx-4]
 00013C64    test        ebx,ebx
>00013C66    je          00013C79
 00013C68    cmp         ecx,ebx
>00013C6A    jl          00013C6E
 00013C6C    mov         ecx,ebx
 00013C6E    mov         byte ptr [eax],cl
 00013C70    inc         eax
 00013C71    xchg        eax,edx
 00013C72    call        Move
 00013C77    pop         ebx
 00013C78    ret
 00013C79    mov         byte ptr [eax],0
 00013C7C    pop         ebx
 00013C7D    ret
*}
end;

//00013C80
function @LStrLen(S:AnsiString):Integer;
begin
{*
 00013C80    test        eax,eax
>00013C82    je          00013C87
 00013C84    mov         eax,dword ptr [eax-4]
 00013C87    ret
*}
end;

//00013C88
procedure @LStrCat(var Dest:AnsiString; Source:AnsiString);
begin
{*
 00013C88    test        edx,edx
>00013C8A    je          00013CCB
 00013C8C    mov         ecx,dword ptr [eax]
 00013C8E    test        ecx,ecx
>00013C90    je          00013A58
 00013C96    push        ebx
 00013C97    push        esi
 00013C98    push        edi
 00013C99    mov         ebx,eax
 00013C9B    mov         esi,edx
 00013C9D    mov         edi,dword ptr [ecx-4]
 00013CA0    mov         edx,dword ptr [esi-4]
 00013CA3    add         edx,edi
 00013CA5    cmp         esi,ecx
>00013CA7    je          00013CC0
 00013CA9    call        @LStrSetLength
 00013CAE    mov         eax,esi
 00013CB0    mov         ecx,dword ptr [esi-4]
 00013CB3    mov         edx,dword ptr [ebx]
 00013CB5    add         edx,edi
 00013CB7    call        Move
 00013CBC    pop         edi
 00013CBD    pop         esi
 00013CBE    pop         ebx
 00013CBF    ret
 00013CC0    call        @LStrSetLength
 00013CC5    mov         eax,dword ptr [ebx]
 00013CC7    mov         ecx,edi
>00013CC9    jmp         00013CB3
 00013CCB    ret
*}
end;

//00013CCC
procedure @LStrCat3(var Dest:AnsiString; Source1:AnsiString; Source2:AnsiString);
begin
{*
 00013CCC    test        edx,edx
>00013CCE    je          00013D31
 00013CD0    test        ecx,ecx
>00013CD2    je          00013A58
 00013CD8    cmp         edx,dword ptr [eax]
>00013CDA    je          00013D38
 00013CDC    cmp         ecx,dword ptr [eax]
>00013CDE    je          00013CEE
 00013CE0    push        eax
 00013CE1    push        ecx
 00013CE2    call        @LStrAsg
 00013CE7    pop         edx
 00013CE8    pop         eax
>00013CE9    jmp         @LStrCat
 00013CEE    push        ebx
 00013CEF    push        esi
 00013CF0    push        edi
 00013CF1    mov         ebx,edx
 00013CF3    mov         esi,ecx
 00013CF5    push        eax
 00013CF6    mov         eax,dword ptr [ebx-4]
 00013CF9    add         eax,dword ptr [esi-4]
 00013CFC    call        @NewAnsiString
 00013D01    mov         edi,eax
 00013D03    mov         edx,eax
 00013D05    mov         eax,ebx
 00013D07    mov         ecx,dword ptr [ebx-4]
 00013D0A    call        Move
 00013D0F    mov         edx,edi
 00013D11    mov         eax,esi
 00013D13    mov         ecx,dword ptr [esi-4]
 00013D16    add         edx,dword ptr [ebx-4]
 00013D19    call        Move
 00013D1E    pop         eax
 00013D1F    mov         edx,edi
 00013D21    test        edi,edi
>00013D23    je          00013D28
 00013D25    dec         dword ptr [edi-8]
 00013D28    call        @LStrAsg
 00013D2D    pop         edi
 00013D2E    pop         esi
 00013D2F    pop         ebx
 00013D30    ret
 00013D31    mov         edx,ecx
>00013D33    jmp         @LStrAsg
 00013D38    mov         edx,ecx
>00013D3A    jmp         @LStrCat
 00013D3F    ret
*}
end;

//00013D40
procedure @LStrCatN(var Dest:AnsiString; ArgCnt:Integer);
begin
{*
 00013D40    push        ebx
 00013D41    push        esi
 00013D42    push        edx
 00013D43    push        eax
 00013D44    mov         ebx,edx
 00013D46    xor         eax,eax
 00013D48    mov         ecx,dword ptr [esp+edx*4+10]
 00013D4C    test        ecx,ecx
>00013D4E    je          00013D53
 00013D50    add         eax,dword ptr [ecx-4]
 00013D53    dec         edx
>00013D54    jne         00013D48
 00013D56    call        @NewAnsiString
 00013D5B    push        eax
 00013D5C    mov         esi,eax
 00013D5E    mov         eax,dword ptr [esp+ebx*4+14]
 00013D62    mov         edx,esi
 00013D64    test        eax,eax
>00013D66    je          00013D72
 00013D68    mov         ecx,dword ptr [eax-4]
 00013D6B    add         esi,ecx
 00013D6D    call        Move
 00013D72    dec         ebx
>00013D73    jne         00013D5E
 00013D75    pop         edx
 00013D76    pop         eax
 00013D77    test        edx,edx
>00013D79    je          00013D7E
 00013D7B    dec         dword ptr [edx-8]
 00013D7E    call        @LStrAsg
 00013D83    pop         edx
 00013D84    pop         esi
 00013D85    pop         ebx
 00013D86    pop         eax
 00013D87    lea         esp,[esp+edx*4]
 00013D8A    jmp         eax
 00013D8C    ret
*}
end;

//00013D90
{*function @LStrCmp(Left:AnsiString; Right:AnsiString):?;
begin
 00013D90    push        ebx
 00013D91    push        esi
 00013D92    push        edi
 00013D93    mov         esi,eax
 00013D95    mov         edi,edx
 00013D97    cmp         eax,edx
>00013D99    je          00013E2E
 00013D9F    test        esi,esi
>00013DA1    je          00013E0B
 00013DA3    test        edi,edi
>00013DA5    je          00013E12
 00013DA7    mov         eax,dword ptr [esi-4]
 00013DAA    mov         edx,dword ptr [edi-4]
 00013DAD    sub         eax,edx
>00013DAF    ja          00013DB3
 00013DB1    add         edx,eax
 00013DB3    push        edx
 00013DB4    shr         edx,2
>00013DB7    je          00013DDF
 00013DB9    mov         ecx,dword ptr [esi]
 00013DBB    mov         ebx,dword ptr [edi]
 00013DBD    cmp         ecx,ebx
>00013DBF    jne         00013E19
 00013DC1    dec         edx
>00013DC2    je          00013DD9
 00013DC4    mov         ecx,dword ptr [esi+4]
 00013DC7    mov         ebx,dword ptr [edi+4]
 00013DCA    cmp         ecx,ebx
>00013DCC    jne         00013E19
 00013DCE    add         esi,8
 00013DD1    add         edi,8
 00013DD4    dec         edx
>00013DD5    jne         00013DB9
>00013DD7    jmp         00013DDF
 00013DD9    add         esi,4
 00013DDC    add         edi,4
 00013DDF    pop         edx
 00013DE0    and         edx,3
>00013DE3    je          00013E07
 00013DE5    mov         ecx,dword ptr [esi]
 00013DE7    mov         ebx,dword ptr [edi]
 00013DE9    cmp         cl,bl
>00013DEB    jne         00013E2E
 00013DED    dec         edx
>00013DEE    je          00013E07
 00013DF0    cmp         ch,bh
>00013DF2    jne         00013E2E
 00013DF4    dec         edx
>00013DF5    je          00013E07
 00013DF7    and         ebx,0FF0000
 00013DFD    and         ecx,0FF0000
 00013E03    cmp         ecx,ebx
>00013E05    jne         00013E2E
 00013E07    add         eax,eax
>00013E09    jmp         00013E2E
 00013E0B    mov         edx,dword ptr [edi-4]
 00013E0E    sub         eax,edx
>00013E10    jmp         00013E2E
 00013E12    mov         eax,dword ptr [esi-4]
 00013E15    sub         eax,edx
>00013E17    jmp         00013E2E
 00013E19    pop         edx
 00013E1A    cmp         cl,bl
>00013E1C    jne         00013E2E
 00013E1E    cmp         ch,bh
>00013E20    jne         00013E2E
 00013E22    shr         ecx,10
 00013E25    shr         ebx,10
 00013E28    cmp         cl,bl
>00013E2A    jne         00013E2E
 00013E2C    cmp         ch,bh
 00013E2E    pop         edi
 00013E2F    pop         esi
 00013E30    pop         ebx
 00013E31    ret
end;*}

//00013E34
function @LStrAddRef(var S:AnsiString):Pointer;
begin
{*
 00013E34    test        eax,eax
>00013E36    je          00013E41
 00013E38    mov         edx,dword ptr [eax-8]
 00013E3B    inc         edx
>00013E3C    jle         00013E41
 00013E3E    mov         dword ptr [eax-8],edx
 00013E41    ret
*}
end;

//00013E44
function @LStrToPChar(S:AnsiString):PChar;
begin
{*
 00013E44    test        eax,eax
>00013E46    je          00013E4A
 00013E48    ret
 00013E49    add         byte ptr [eax+13E49],bh
 00013E4F    ret
*}
end;

//00013E50
procedure UniqueString(var str:AnsiString);
begin
{*
 00013E50    mov         edx,dword ptr [eax]
 00013E52    test        edx,edx
>00013E54    je          00013E81
 00013E56    mov         ecx,dword ptr [edx-8]
 00013E59    dec         ecx
>00013E5A    je          00013E81
 00013E5C    push        ebx
 00013E5D    mov         ebx,eax
 00013E5F    mov         eax,dword ptr [edx-4]
 00013E62    call        @NewAnsiString
 00013E67    mov         edx,eax
 00013E69    mov         eax,dword ptr [ebx]
 00013E6B    mov         dword ptr [ebx],edx
 00013E6D    mov         ecx,dword ptr [eax-8]
 00013E70    dec         ecx
>00013E71    jl          00013E76
 00013E73    mov         dword ptr [eax-8],ecx
 00013E76    mov         ecx,dword ptr [eax-4]
 00013E79    call        Move
 00013E7E    mov         edx,dword ptr [ebx]
 00013E80    pop         ebx
 00013E81    mov         eax,edx
 00013E83    ret
*}
end;

//00013E84
function @LStrCopy(const S:AnsiString; Index:Integer; Count:Integer):AnsiString;
begin
{*
 00013E84    push        ebx
 00013E85    test        eax,eax
>00013E87    je          00013EB6
 00013E89    mov         ebx,dword ptr [eax-4]
 00013E8C    test        ebx,ebx
>00013E8E    je          00013EB6
 00013E90    dec         edx
>00013E91    jl          00013EAE
 00013E93    cmp         edx,ebx
>00013E95    jge         00013EB6
 00013E97    sub         ebx,edx
 00013E99    test        ecx,ecx
>00013E9B    jl          00013EB6
 00013E9D    cmp         ecx,ebx
>00013E9F    jg          00013EB2
 00013EA1    add         edx,eax
 00013EA3    mov         eax,dword ptr [esp+8]
 00013EA7    call        @LStrFromPCharLen
>00013EAC    jmp         00013EBF
 00013EAE    xor         edx,edx
>00013EB0    jmp         00013E97
 00013EB2    mov         ecx,ebx
>00013EB4    jmp         00013EA1
 00013EB6    mov         eax,dword ptr [esp+8]
 00013EBA    call        @LStrClr
 00013EBF    pop         ebx
 00013EC0    ret         4
*}
end;

//00013EC4
procedure @LStrDelete(var S:AnsiString; Index:Integer; Count:Integer);
begin
{*
 00013EC4    push        ebx
 00013EC5    push        esi
 00013EC6    push        edi
 00013EC7    mov         ebx,eax
 00013EC9    mov         esi,edx
 00013ECB    mov         edi,ecx
 00013ECD    call        UniqueString
 00013ED2    mov         edx,dword ptr [ebx]
 00013ED4    test        edx,edx
>00013ED6    je          00013F08
 00013ED8    mov         ecx,dword ptr [edx-4]
 00013EDB    dec         esi
>00013EDC    jl          00013F08
 00013EDE    cmp         esi,ecx
>00013EE0    jge         00013F08
 00013EE2    test        edi,edi
>00013EE4    jle         00013F08
 00013EE6    sub         ecx,esi
 00013EE8    cmp         edi,ecx
>00013EEA    jle         00013EEE
 00013EEC    mov         edi,ecx
 00013EEE    sub         ecx,edi
 00013EF0    add         edx,esi
 00013EF2    lea         eax,[edx+edi]
 00013EF5    call        Move
 00013EFA    mov         edx,dword ptr [ebx]
 00013EFC    mov         eax,ebx
 00013EFE    mov         edx,dword ptr [edx-4]
 00013F01    sub         edx,edi
 00013F03    call        @LStrSetLength
 00013F08    pop         edi
 00013F09    pop         esi
 00013F0A    pop         ebx
 00013F0B    ret
*}
end;

//00013F0C
procedure @LStrInsert(const Source:AnsiString; var S:AnsiString; Index:Integer);
begin
{*
 00013F0C    test        eax,eax
>00013F0E    je          00013F66
 00013F10    push        ebx
 00013F11    push        esi
 00013F12    push        edi
 00013F13    push        ebp
 00013F14    mov         ebx,eax
 00013F16    mov         esi,edx
 00013F18    mov         edi,ecx
 00013F1A    mov         edx,dword ptr [edx]
 00013F1C    push        edx
 00013F1D    test        edx,edx
>00013F1F    je          00013F24
 00013F21    mov         edx,dword ptr [edx-4]
 00013F24    dec         edi
>00013F25    jge         00013F29
 00013F27    xor         edi,edi
 00013F29    cmp         edi,edx
>00013F2B    jle         00013F2F
 00013F2D    mov         edi,edx
 00013F2F    mov         ebp,dword ptr [ebx-4]
 00013F32    mov         eax,esi
 00013F34    add         edx,ebp
 00013F36    call        @LStrSetLength
 00013F3B    pop         eax
 00013F3C    cmp         eax,ebx
>00013F3E    jne         00013F42
 00013F40    mov         ebx,dword ptr [esi]
 00013F42    mov         eax,dword ptr [esi]
 00013F44    lea         edx,[edi+ebp]
 00013F47    mov         ecx,dword ptr [eax-4]
 00013F4A    sub         ecx,edx
 00013F4C    add         edx,eax
 00013F4E    add         eax,edi
 00013F50    call        Move
 00013F55    mov         eax,ebx
 00013F57    mov         edx,dword ptr [esi]
 00013F59    mov         ecx,ebp
 00013F5B    add         edx,edi
 00013F5D    call        Move
 00013F62    pop         ebp
 00013F63    pop         edi
 00013F64    pop         esi
 00013F65    pop         ebx
 00013F66    ret
*}
end;

//00013F68
function @LStrPos(const Substr:AnsiString; const S:AnsiString):Integer;
begin
{*
 00013F68    test        eax,eax
>00013F6A    je          00013FAC
 00013F6C    test        edx,edx
>00013F6E    je          00013FA1
 00013F70    push        ebx
 00013F71    push        esi
 00013F72    push        edi
 00013F73    mov         esi,eax
 00013F75    mov         edi,edx
 00013F77    mov         ecx,dword ptr [edi-4]
 00013F7A    push        edi
 00013F7B    mov         edx,dword ptr [esi-4]
 00013F7E    dec         edx
>00013F7F    js          00013F9C
 00013F81    mov         al,byte ptr [esi]
 00013F83    inc         esi
 00013F84    sub         ecx,edx
>00013F86    jle         00013F9C
 00013F88    repne scas  byte ptr [edi]
>00013F8A    jne         00013F9C
 00013F8C    mov         ebx,ecx
 00013F8E    push        esi
 00013F8F    push        edi
 00013F90    mov         ecx,edx
 00013F92    repe cmps   byte ptr [esi],byte ptr [edi]
 00013F94    pop         edi
 00013F95    pop         esi
>00013F96    je          00013FA4
 00013F98    mov         ecx,ebx
>00013F9A    jmp         00013F88
 00013F9C    pop         edx
 00013F9D    xor         eax,eax
>00013F9F    jmp         00013FA9
 00013FA1    xor         eax,eax
 00013FA3    ret
 00013FA4    pop         edx
 00013FA5    mov         eax,edi
 00013FA7    sub         eax,edx
 00013FA9    pop         edi
 00013FAA    pop         esi
 00013FAB    pop         ebx
 00013FAC    ret
*}
end;

//00013FB0
procedure @LStrSetLength(var S:AnsiString; NewLen:Integer);
begin
{*
 00013FB0    push        ebx
 00013FB1    push        esi
 00013FB2    push        edi
 00013FB3    mov         ebx,eax
 00013FB5    mov         esi,edx
 00013FB7    xor         edi,edi
 00013FB9    test        edx,edx
>00013FBB    je          00014005
 00013FBD    mov         eax,dword ptr [ebx]
 00013FBF    test        eax,eax
>00013FC1    je          00013FE6
 00013FC3    cmp         dword ptr [eax-8],1
>00013FC7    jne         00013FE6
 00013FC9    sub         eax,8
 00013FCC    add         edx,9
 00013FCF    push        eax
 00013FD0    mov         eax,esp
 00013FD2    call        @ReallocMem
 00013FD7    pop         eax
 00013FD8    add         eax,8
 00013FDB    mov         dword ptr [ebx],eax
 00013FDD    mov         dword ptr [eax-4],esi
 00013FE0    mov         byte ptr [eax+esi],0
>00013FE4    jmp         0001400E
 00013FE6    mov         eax,edx
 00013FE8    call        @NewAnsiString
 00013FED    mov         edi,eax
 00013FEF    mov         eax,dword ptr [ebx]
 00013FF1    test        eax,eax
>00013FF3    je          00014005
 00013FF5    mov         edx,edi
 00013FF7    mov         ecx,dword ptr [eax-4]
 00013FFA    cmp         ecx,esi
>00013FFC    jl          00014000
 00013FFE    mov         ecx,esi
 00014000    call        Move
 00014005    mov         eax,ebx
 00014007    call        @LStrClr
 0001400C    mov         dword ptr [ebx],edi
 0001400E    pop         edi
 0001400F    pop         esi
 00014010    pop         ebx
 00014011    ret
*}
end;

//00014014
procedure @Write0Bool(var T:TTextRec; Val:Boolean);
begin
{*
 00014014    xor         ecx,ecx
>00014016    jmp         @WriteBool
 0001401B    ret
*}
end;

//0001401C
procedure @WriteBool(var T:TTextRec; Val:Boolean; Width:Longint);
begin
{*
 0001401C    push        ebx
 0001401D    mov         ebx,edx
 0001401F    mov         edx,ecx
 00014021    xor         ecx,ecx
 00014023    test        ebx,ebx
>00014025    je          0001402C
 00014027    mov         ecx,dword ptr [ebx-4]
 0001402A    sub         edx,ecx
 0001402C    push        ecx
 0001402D    call        @WriteSpaces
 00014032    pop         ecx
 00014033    mov         edx,ebx
 00014035    pop         ebx
>00014036    jmp         @WriteBytes
 0001403B    ret
*}
end;

//0001403C
procedure @ReadLString(var T:TTextRec; var S:AnsiString);
begin
{*
 0001403C    push        ebx
 0001403D    push        esi
 0001403E    mov         ebx,eax
 00014040    mov         esi,edx
 00014042    mov         eax,edx
 00014044    call        @LStrClr
 00014049    sub         esp,100
 0001404F    mov         eax,ebx
 00014051    mov         edx,esp
 00014053    mov         ecx,0FF
 00014058    call        @ReadString
 0001405D    mov         eax,esi
 0001405F    mov         edx,esp
 00014061    call        @LStrFromString
 00014066    cmp         byte ptr [esp],0FF
>0001406A    jne         0001409D
 0001406C    mov         eax,ebx
 0001406E    mov         edx,esp
 00014070    mov         ecx,0FF
 00014075    call        @ReadString
 0001407A    mov         edx,esp
 0001407C    push        0
 0001407E    mov         eax,esp
 00014080    call        @LStrFromString
 00014085    mov         eax,esi
 00014087    mov         edx,dword ptr [esp]
 0001408A    call        @LStrCat
 0001408F    mov         eax,esp
 00014091    call        @LStrClr
 00014096    pop         eax
 00014097    cmp         byte ptr [esp],0FF
>0001409B    je          0001406C
 0001409D    add         esp,100
 000140A3    pop         esi
 000140A4    pop         ebx
 000140A5    ret
*}
end;

//000140A8
procedure WStrError;
begin
{*
 000140A8    mov         al,1
>000140AA    jmp         Error
 000140AF    ret
*}
end;

//000140B0
procedure WStrSet(var S:WideString; P:PWideChar);
begin
{*
 000140B0    mov         ecx,dword ptr [eax]
 000140B2    mov         dword ptr [eax],edx
 000140B4    test        ecx,ecx
>000140B6    je          000140BE
 000140B8    push        ecx
 000140B9    call        oleaut32.SysFreeString
 000140BE    ret
*}
end;

//000140C0
procedure @WStrClr(var S:WideString);
begin
{*
 000140C0    mov         edx,dword ptr [eax]
 000140C2    test        edx,edx
>000140C4    je          000140D4
 000140C6    mov         dword ptr [eax],0
 000140CC    push        eax
 000140CD    push        edx
 000140CE    call        oleaut32.SysFreeString
 000140D3    pop         eax
 000140D4    ret
*}
end;

//000140D8
procedure @WStrArrayClr(var StrArray:Pointer; Count:Integer);
begin
{*
 000140D8    push        ebx
 000140D9    push        esi
 000140DA    mov         ebx,eax
 000140DC    mov         esi,edx
 000140DE    mov         eax,dword ptr [ebx]
 000140E0    test        eax,eax
>000140E2    je          000140F0
 000140E4    mov         dword ptr [ebx],0
 000140EA    push        eax
 000140EB    call        oleaut32.SysFreeString
 000140F0    add         ebx,4
 000140F3    dec         esi
>000140F4    jne         000140DE
 000140F6    pop         esi
 000140F7    pop         ebx
 000140F8    ret
*}
end;

//000140FC
procedure @WStrAsg(var Dest:WideString; Source:WideString);
begin
{*
 000140FC    test        edx,edx
>000140FE    je          000140C0
 00014104    mov         ecx,dword ptr [edx-4]
 00014107    shr         ecx,1
>00014109    je          000140C0
 0001410F    push        ecx
 00014110    push        edx
 00014111    push        eax
 00014112    call        oleaut32.SysReAllocStringLen
 00014117    test        eax,eax
>00014119    je          000140A8
 0001411F    ret
*}
end;

//00014120
procedure @WStrFromPCharLen(var Dest:WideString; Source:PAnsiChar; Length:Integer);
begin
{*
 00014120    push        ebx
 00014121    push        esi
 00014122    push        edi
 00014123    push        ebp
 00014124    add         esp,0FFFFF800
 0001412A    mov         ebx,ecx
 0001412C    mov         ebp,edx
 0001412E    mov         edi,eax
 00014130    test        ebx,ebx
>00014132    jg          0001413D
 00014134    mov         eax,edi
 00014136    call        @WStrClr
>0001413B    jmp         00014198
 0001413D    cmp         ebx,400
>00014143    jge         0001416D
 00014145    push        400
 0001414A    lea         eax,[esp+4]
 0001414E    push        eax
 0001414F    push        ebx
 00014150    push        ebp
 00014151    push        0
 00014153    push        0
 00014155    call        kernel32.MultiByteToWideChar
 0001415A    mov         esi,eax
 0001415C    test        esi,esi
>0001415E    jle         0001416D
 00014160    mov         edx,esp
 00014162    mov         eax,edi
 00014164    mov         ecx,esi
 00014166    call        @WStrFromPWCharLen
>0001416B    jmp         00014198
 0001416D    push        0
 0001416F    push        0
 00014171    push        ebx
 00014172    push        ebp
 00014173    push        0
 00014175    push        0
 00014177    call        kernel32.MultiByteToWideChar
 0001417C    mov         esi,eax
 0001417E    mov         eax,edi
 00014180    mov         ecx,esi
 00014182    xor         edx,edx
 00014184    call        @WStrFromPWCharLen
 00014189    push        esi
 0001418A    mov         eax,dword ptr [edi]
 0001418C    push        eax
 0001418D    push        ebx
 0001418E    push        ebp
 0001418F    push        0
 00014191    push        0
 00014193    call        kernel32.MultiByteToWideChar
 00014198    add         esp,800
 0001419E    pop         ebp
 0001419F    pop         edi
 000141A0    pop         esi
 000141A1    pop         ebx
 000141A2    ret
*}
end;

//000141A4
procedure @WStrFromPWCharLen(var Dest:WideString; Source:PWideChar; Length:Integer);
begin
{*
 000141A4    test        ecx,ecx
>000141A6    je          000140C0
 000141AC    push        eax
 000141AD    push        ecx
 000141AE    push        edx
 000141AF    call        oleaut32.SysAllocStringLen
 000141B4    test        eax,eax
>000141B6    je          000140A8
 000141BC    pop         edx
 000141BD    push        dword ptr [edx]
 000141BF    mov         dword ptr [edx],eax
 000141C1    call        oleaut32.SysFreeString
 000141C6    ret
*}
end;

//000141C8
procedure @WStrFromLStr(var Dest:WideString; const Source:AnsiString);
begin
{*
 000141C8    xor         ecx,ecx
 000141CA    test        edx,edx
>000141CC    je          000141D1
 000141CE    mov         ecx,dword ptr [edx-4]
>000141D1    jmp         @WStrFromPCharLen
 000141D6    ret
*}
end;

//000141D8
function @WStrLen(S:WideString):Integer;
begin
{*
 000141D8    test        eax,eax
>000141DA    je          000141E1
 000141DC    mov         eax,dword ptr [eax-4]
 000141DF    shr         eax,1
 000141E1    ret
*}
end;

//000141E4
function @NewWideString(Length:Integer):PWideChar;
begin
{*
 000141E4    test        eax,eax
>000141E6    je          000141F8
 000141E8    push        eax
 000141E9    push        0
 000141EB    call        oleaut32.SysAllocStringLen
 000141F0    test        eax,eax
>000141F2    je          000140A8
 000141F8    ret
*}
end;

//000141FC
procedure @WStrSetLength(var S:WideString; NewLen:Integer);
begin
{*
 000141FC    push        ebx
 000141FD    push        esi
 000141FE    push        edi
 000141FF    mov         esi,edx
 00014201    mov         edi,eax
 00014203    xor         ebx,ebx
 00014205    test        esi,esi
>00014207    jle         00014230
 00014209    mov         eax,esi
 0001420B    call        @NewWideString
 00014210    mov         ebx,eax
 00014212    mov         eax,dword ptr [edi]
 00014214    call        @WStrLen
 00014219    test        eax,eax
>0001421B    jle         00014230
 0001421D    cmp         esi,eax
>0001421F    jge         00014223
 00014221    mov         eax,esi
 00014223    mov         ecx,eax
 00014225    add         ecx,ecx
 00014227    mov         edx,ebx
 00014229    mov         eax,dword ptr [edi]
 0001422B    call        Move
 00014230    mov         eax,edi
 00014232    mov         edx,ebx
 00014234    call        WStrSet
 00014239    pop         edi
 0001423A    pop         esi
 0001423B    pop         ebx
 0001423C    ret
*}
end;

//00014240
procedure @AddRefRecord;
begin
{*
 00014240    xor         ecx,ecx
 00014242    push        ebx
 00014243    mov         cl,byte ptr [edx+1]
 00014246    push        esi
 00014247    push        edi
 00014248    mov         ebx,eax
 0001424A    lea         esi,[edx+ecx+0A]
 0001424E    mov         edi,dword ptr [edx+ecx+6]
 00014252    mov         edx,dword ptr [esi]
 00014254    mov         eax,dword ptr [esi+4]
 00014257    add         eax,ebx
 00014259    mov         edx,dword ptr [edx]
 0001425B    call        @AddRef
 00014260    add         esi,8
 00014263    dec         edi
>00014264    jg          00014252
 00014266    pop         edi
 00014267    pop         esi
 00014268    pop         ebx
 00014269    ret
*}
end;

//0001426C
procedure @AddRefArray;
begin
{*
 0001426C    push        ebx
 0001426D    push        esi
 0001426E    push        edi
 0001426F    mov         ebx,eax
 00014271    mov         esi,edx
 00014273    mov         edi,ecx
 00014275    xor         edx,edx
 00014277    mov         al,byte ptr [esi]
 00014279    mov         dl,byte ptr [esi+1]
 0001427C    xor         ecx,ecx
 0001427E    cmp         al,0A
>00014281    je          000142AB
 00014283    cmp         al,0B
>00014286    je          000142AB
 00014288    cmp         al,0C
>0001428B    je          000142B5
 0001428D    cmp         al,0D
>00014290    je          000142C8
 00014292    cmp         al,0E
>00014295    je          000142E6
 00014297    cmp         al,0F
>0001429A    je          000142AB
 0001429C    cmp         al,11
>0001429F    je          000142AB
 000142A1    mov         al,2
 000142A3    pop         edi
 000142A4    pop         esi
 000142A5    pop         ebx
>000142A6    jmp         Error
 000142AB    mov         dword ptr [ebx],ecx
 000142AD    add         ebx,4
 000142B0    dec         edi
>000142B1    jg          000142AB
>000142B3    jmp         000142FA
 000142B5    mov         dword ptr [ebx],ecx
 000142B7    mov         dword ptr [ebx+4],ecx
 000142BA    mov         dword ptr [ebx+8],ecx
 000142BD    mov         dword ptr [ebx+0C],ecx
 000142C0    add         ebx,10
 000142C3    dec         edi
>000142C4    jg          000142B5
>000142C6    jmp         000142FA
 000142C8    push        ebp
 000142C9    mov         ebp,edx
 000142CB    mov         edx,dword ptr [esi+ebp+0A]
 000142CF    mov         eax,ebx
 000142D1    add         ebx,dword ptr [esi+ebp+2]
 000142D5    mov         ecx,dword ptr [esi+ebp+6]
 000142D9    mov         edx,dword ptr [edx]
 000142DB    call        @AddRefArray
 000142E0    dec         edi
>000142E1    jg          000142CB
 000142E3    pop         ebp
>000142E4    jmp         000142FA
 000142E6    push        ebp
 000142E7    mov         ebp,edx
 000142E9    mov         eax,ebx
 000142EB    add         ebx,dword ptr [esi+ebp+2]
 000142EF    mov         edx,esi
 000142F1    call        @AddRefRecord
 000142F6    dec         edi
>000142F7    jg          000142E9
 000142F9    pop         ebp
 000142FA    pop         edi
 000142FB    pop         esi
 000142FC    pop         ebx
 000142FD    ret
*}
end;

//00014300
procedure @AddRef;
begin
{*
 00014300    mov         ecx,1
>00014305    jmp         @AddRefArray
 0001430A    ret
*}
end;

//0001430C
procedure @FinalizeRecord;
begin
{*
 0001430C    xor         ecx,ecx
 0001430E    push        ebx
 0001430F    mov         cl,byte ptr [edx+1]
 00014312    push        esi
 00014313    push        edi
 00014314    mov         ebx,eax
 00014316    lea         esi,[edx+ecx+0A]
 0001431A    mov         edi,dword ptr [edx+ecx+6]
 0001431E    mov         edx,dword ptr [esi]
 00014320    mov         eax,dword ptr [esi+4]
 00014323    add         eax,ebx
 00014325    mov         edx,dword ptr [edx]
 00014327    call        @Finalize
 0001432C    add         esi,8
 0001432F    dec         edi
>00014330    jg          0001431E
 00014332    mov         eax,ebx
 00014334    pop         edi
 00014335    pop         esi
 00014336    pop         ebx
 00014337    ret
*}
end;

//00014338
procedure @FinalizeArray;
begin
{*
 00014338    push        eax
 00014339    push        ebx
 0001433A    push        esi
 0001433B    push        edi
 0001433C    mov         ebx,eax
 0001433E    mov         esi,edx
 00014340    mov         edi,ecx
 00014342    xor         edx,edx
 00014344    mov         al,byte ptr [esi]
 00014346    mov         dl,byte ptr [esi+1]
 00014349    cmp         al,0A
>0001434C    je          0001437F
 0001434E    cmp         al,0B
>00014351    je          00014399
 00014353    cmp         al,0C
>00014356    je          000143B0
 00014358    cmp         al,0D
>0001435B    je          000143BF
 0001435D    cmp         al,0E
>00014360    je          000143DD
 00014362    cmp         al,0F
>00014365    je          000143F3
 0001436B    cmp         al,11
>0001436E    je          00014402
 00014374    pop         edi
 00014375    pop         esi
 00014376    pop         ebx
 00014377    pop         eax
 00014378    mov         al,2
>0001437A    jmp         Error
 0001437F    cmp         ecx,1
 00014382    mov         eax,ebx
>00014384    jg          00014390
 00014386    call        @LStrClr
>0001438B    jmp         00014411
 00014390    mov         edx,ecx
 00014392    call        @LStrArrayClr
>00014397    jmp         00014411
 00014399    cmp         ecx,1
 0001439C    mov         eax,ebx
>0001439E    jg          000143A7
 000143A0    call        @WStrClr
>000143A5    jmp         00014411
 000143A7    mov         edx,ecx
 000143A9    call        @WStrArrayClr
>000143AE    jmp         00014411
 000143B0    mov         eax,ebx
 000143B2    add         ebx,10
 000143B5    call        @VarClr
 000143BA    dec         edi
>000143BB    jg          000143B0
>000143BD    jmp         00014411
 000143BF    push        ebp
 000143C0    mov         ebp,edx
 000143C2    mov         edx,dword ptr [esi+ebp+0A]
 000143C6    mov         eax,ebx
 000143C8    add         ebx,dword ptr [esi+ebp+2]
 000143CC    mov         ecx,dword ptr [esi+ebp+6]
 000143D0    mov         edx,dword ptr [edx]
 000143D2    call        @FinalizeArray
 000143D7    dec         edi
>000143D8    jg          000143C2
 000143DA    pop         ebp
>000143DB    jmp         00014411
 000143DD    push        ebp
 000143DE    mov         ebp,edx
 000143E0    mov         eax,ebx
 000143E2    add         ebx,dword ptr [esi+ebp+2]
 000143E6    mov         edx,esi
 000143E8    call        @FinalizeRecord
 000143ED    dec         edi
>000143EE    jg          000143E0
 000143F0    pop         ebp
>000143F1    jmp         00014411
 000143F3    mov         eax,ebx
 000143F5    add         ebx,4
 000143F8    call        @IntfClear
 000143FD    dec         edi
>000143FE    jg          000143F3
>00014400    jmp         00014411
 00014402    mov         eax,ebx
 00014404    mov         edx,esi
 00014406    add         ebx,4
 00014409    call        @DynArrayClear
 0001440E    dec         edi
>0001440F    jg          00014402
 00014411    pop         edi
 00014412    pop         esi
 00014413    pop         ebx
 00014414    pop         eax
 00014415    ret
*}
end;

//00014418
procedure @Finalize;
begin
{*
 00014418    mov         ecx,1
>0001441D    jmp         @FinalizeArray
 00014422    ret
*}
end;

//00014424
procedure @CopyRecord(Dest:Pointer; Source:Pointer; TypeInfo:Pointer);
begin
{*
 00014424    push        ebx
 00014425    push        esi
 00014426    push        edi
 00014427    push        ebp
 00014428    mov         ebx,eax
 0001442A    mov         esi,edx
 0001442C    xor         eax,eax
 0001442E    mov         al,byte ptr [ecx+1]
 00014431    lea         edi,[ecx+eax+0A]
 00014435    mov         ebp,dword ptr [edi-4]
 00014438    xor         eax,eax
 0001443A    mov         ecx,dword ptr [edi-8]
 0001443D    push        ecx
 0001443E    mov         ecx,dword ptr [edi+4]
 00014441    sub         ecx,eax
>00014443    jle         00014450
 00014445    mov         edx,eax
 00014447    add         eax,esi
 00014449    add         edx,ebx
 0001444B    call        Move
 00014450    mov         eax,dword ptr [edi+4]
 00014453    mov         edx,dword ptr [edi]
 00014455    mov         edx,dword ptr [edx]
 00014457    mov         cl,byte ptr [edx]
 00014459    cmp         cl,0A
>0001445C    je          0001448F
 0001445E    cmp         cl,0B
>00014461    je          000144A0
 00014463    cmp         cl,0C
>00014466    je          000144B1
 00014468    cmp         cl,0D
>0001446B    je          000144C2
 0001446D    cmp         cl,0E
>00014470    je          000144E2
 00014472    cmp         cl,0F
>00014475    je          000144FB
 0001447B    cmp         cl,11
>0001447E    je          0001450C
 00014484    mov         al,2
 00014486    pop         ebp
 00014487    pop         edi
 00014488    pop         esi
 00014489    pop         ebx
>0001448A    jmp         Error
 0001448F    mov         edx,dword ptr [esi+eax]
 00014492    add         eax,ebx
 00014494    call        @LStrAsg
 00014499    mov         eax,4
>0001449E    jmp         0001451D
 000144A0    mov         edx,dword ptr [esi+eax]
 000144A3    add         eax,ebx
 000144A5    call        @WStrAsg
 000144AA    mov         eax,4
>000144AF    jmp         0001451D
 000144B1    lea         edx,[esi+eax]
 000144B4    add         eax,ebx
 000144B6    call        @VarCopy
 000144BB    mov         eax,10
>000144C0    jmp         0001451D
 000144C2    xor         ecx,ecx
 000144C4    mov         cl,byte ptr [edx+1]
 000144C7    push        dword ptr [edx+ecx+2]
 000144CB    push        dword ptr [edx+ecx+6]
 000144CF    mov         ecx,dword ptr [edx+ecx+0A]
 000144D3    mov         ecx,dword ptr [ecx]
 000144D5    lea         edx,[esi+eax]
 000144D8    add         eax,ebx
 000144DA    call        @CopyArray
 000144DF    pop         eax
>000144E0    jmp         0001451D
 000144E2    xor         ecx,ecx
 000144E4    mov         cl,byte ptr [edx+1]
 000144E7    mov         ecx,dword ptr [edx+ecx+2]
 000144EB    push        ecx
 000144EC    mov         ecx,edx
 000144EE    lea         edx,[esi+eax]
 000144F1    add         eax,ebx
 000144F3    call        @CopyRecord
 000144F8    pop         eax
>000144F9    jmp         0001451D
 000144FB    mov         edx,dword ptr [esi+eax]
 000144FE    add         eax,ebx
 00014500    call        @IntfCopy
 00014505    mov         eax,4
>0001450A    jmp         0001451D
 0001450C    mov         ecx,edx
 0001450E    mov         edx,dword ptr [esi+eax]
 00014511    add         eax,ebx
 00014513    call        @DynArrayAsg
 00014518    mov         eax,4
 0001451D    add         eax,dword ptr [edi+4]
 00014520    add         edi,8
 00014523    dec         ebp
>00014524    jne         0001443E
 0001452A    pop         ecx
 0001452B    sub         ecx,eax
>0001452D    jle         00014539
 0001452F    lea         edx,[ebx+eax]
 00014532    add         eax,esi
 00014534    call        Move
 00014539    pop         ebp
 0001453A    pop         edi
 0001453B    pop         esi
 0001453C    pop         ebx
 0001453D    ret
*}
end;

//00014540
procedure @CopyArray(Dest:Pointer; Source:Pointer; TypeInfo:Pointer; Cnt:Integer);
begin
{*
 00014540    push        ebx
 00014541    push        esi
 00014542    push        edi
 00014543    push        ebp
 00014544    mov         ebx,eax
 00014546    mov         esi,edx
 00014548    mov         edi,ecx
 0001454A    mov         ebp,dword ptr [esp+14]
 0001454E    mov         cl,byte ptr [edi]
 00014550    cmp         cl,0A
>00014553    je          00014586
 00014555    cmp         cl,0B
>00014558    je          0001459D
 0001455A    cmp         cl,0C
>0001455D    je          000145B1
 0001455F    cmp         cl,0D
>00014562    je          000145C5
 00014564    cmp         cl,0E
>00014567    je          000145E6
 00014569    cmp         cl,0F
>0001456C    je          00014603
 00014572    cmp         cl,11
>00014575    je          00014617
 0001457B    mov         al,2
 0001457D    pop         ebp
 0001457E    pop         edi
 0001457F    pop         esi
 00014580    pop         ebx
>00014581    jmp         Error
 00014586    mov         eax,ebx
 00014588    mov         edx,dword ptr [esi]
 0001458A    call        @LStrAsg
 0001458F    add         ebx,4
 00014592    add         esi,4
 00014595    dec         ebp
>00014596    jne         00014586
>00014598    jmp         0001462B
 0001459D    mov         eax,ebx
 0001459F    mov         edx,dword ptr [esi]
 000145A1    call        @WStrAsg
 000145A6    add         ebx,4
 000145A9    add         esi,4
 000145AC    dec         ebp
>000145AD    jne         0001459D
>000145AF    jmp         0001462B
 000145B1    mov         eax,ebx
 000145B3    mov         edx,esi
 000145B5    call        @VarCopy
 000145BA    add         ebx,10
 000145BD    add         esi,10
 000145C0    dec         ebp
>000145C1    jne         000145B1
>000145C3    jmp         0001462B
 000145C5    xor         ecx,ecx
 000145C7    mov         cl,byte ptr [edi+1]
 000145CA    lea         edi,[edi+ecx+2]
 000145CE    mov         eax,ebx
 000145D0    mov         edx,esi
 000145D2    mov         ecx,dword ptr [edi+8]
 000145D5    push        dword ptr [edi+4]
 000145D8    call        @CopyArray
 000145DD    add         ebx,dword ptr [edi]
 000145DF    add         esi,dword ptr [edi]
 000145E1    dec         ebp
>000145E2    jne         000145CE
>000145E4    jmp         0001462B
 000145E6    mov         eax,ebx
 000145E8    mov         edx,esi
 000145EA    mov         ecx,edi
 000145EC    call        @CopyRecord
 000145F1    xor         eax,eax
 000145F3    mov         al,byte ptr [edi+1]
 000145F6    add         ebx,dword ptr [edi+eax+2]
 000145FA    add         esi,dword ptr [edi+eax+2]
 000145FE    dec         ebp
>000145FF    jne         000145E6
>00014601    jmp         0001462B
 00014603    mov         eax,ebx
 00014605    mov         edx,dword ptr [esi]
 00014607    call        @IntfCopy
 0001460C    add         ebx,4
 0001460F    add         esi,4
 00014612    dec         ebp
>00014613    jne         00014603
>00014615    jmp         0001462B
 00014617    mov         eax,ebx
 00014619    mov         edx,dword ptr [esi]
 0001461B    mov         ecx,edi
 0001461D    call        @DynArrayAsg
 00014622    add         ebx,4
 00014625    add         esi,4
 00014628    dec         ebp
>00014629    jne         00014617
 0001462B    pop         ebp
 0001462C    pop         edi
 0001462D    pop         esi
 0001462E    pop         ebx
 0001462F    ret         4
*}
end;

//00014634
procedure @New;
begin
{*
 00014634    push        edx
 00014635    call        @GetMem
 0001463A    pop         edx
 0001463B    test        eax,eax
>0001463D    je          00014646
 0001463F    push        eax
 00014640    call        @AddRef
 00014645    pop         eax
 00014646    ret
*}
end;

//00014648
procedure @Dispose;
begin
{*
 00014648    push        eax
 00014649    call        @Finalize
 0001464E    pop         eax
 0001464F    call        @FreeMem
 00014654    ret
*}
end;

//00014658
procedure WideCharLenToStrVar(Source:PWideChar; SourceLen:Integer; var Dest:AnsiString);
begin
{*
 00014658    push        ebx
 00014659    push        esi
 0001465A    push        edi
 0001465B    push        ebp
 0001465C    add         esp,0FFFFF800
 00014662    mov         esi,ecx
 00014664    mov         ebx,edx
 00014666    mov         edi,eax
 00014668    test        ebx,ebx
>0001466A    jne         00014675
 0001466C    mov         eax,esi
 0001466E    call        @LStrClr
>00014673    jmp         000146D6
 00014675    cmp         ebx,400
>0001467B    jge         000146A3
 0001467D    push        0
 0001467F    push        0
 00014681    push        800
 00014686    lea         eax,[esp+0C]
 0001468A    push        eax
 0001468B    push        ebx
 0001468C    push        edi
 0001468D    push        0
 0001468F    push        0
 00014691    call        kernel32.WideCharToMultiByte
 00014696    mov         ecx,eax
 00014698    mov         edx,esp
 0001469A    mov         eax,esi
 0001469C    call        @LStrFromPCharLen
>000146A1    jmp         000146D6
 000146A3    push        0
 000146A5    push        0
 000146A7    push        0
 000146A9    push        0
 000146AB    push        ebx
 000146AC    push        edi
 000146AD    push        0
 000146AF    push        0
 000146B1    call        kernel32.WideCharToMultiByte
 000146B6    mov         ebp,eax
 000146B8    mov         eax,esi
 000146BA    mov         ecx,ebp
 000146BC    xor         edx,edx
 000146BE    call        @LStrFromPCharLen
 000146C3    push        0
 000146C5    push        0
 000146C7    push        ebp
 000146C8    mov         eax,dword ptr [esi]
 000146CA    push        eax
 000146CB    push        ebx
 000146CC    push        edi
 000146CD    push        0
 000146CF    push        0
 000146D1    call        kernel32.WideCharToMultiByte
 000146D6    add         esp,800
 000146DC    pop         ebp
 000146DD    pop         edi
 000146DE    pop         esi
 000146DF    pop         ebx
 000146E0    ret
*}
end;

//000146E4
procedure OleStrToStrVar(Source:PWideChar; var Dest:AnsiString);
begin
{*
 000146E4    push        ebx
 000146E5    push        esi
 000146E6    push        0
 000146E8    mov         esi,edx
 000146EA    mov         ebx,eax
 000146EC    mov         dword ptr [esp],ebx
 000146EF    mov         eax,dword ptr [esp]
 000146F2    push        eax
 000146F3    call        oleaut32.SysStringLen
 000146F8    mov         edx,eax
 000146FA    mov         ecx,esi
 000146FC    mov         eax,ebx
 000146FE    call        WideCharLenToStrVar
 00014703    pop         edx
 00014704    pop         esi
 00014705    pop         ebx
 00014706    ret
*}
end;

//00014708
function StringToOleStr(const Source:AnsiString):PWideChar;
begin
{*
 00014708    push        ebx
 00014709    push        esi
 0001470A    push        edi
 0001470B    push        ebp
 0001470C    add         esp,0FFFFF800
 00014712    mov         ebx,eax
 00014714    mov         eax,ebx
 00014716    call        @LStrLen
 0001471B    mov         esi,eax
 0001471D    mov         eax,ebx
 0001471F    call        @LStrLen
 00014724    cmp         eax,400
>00014729    jge         00014756
 0001472B    push        400
 00014730    lea         eax,[esp+4]
 00014734    push        eax
 00014735    push        esi
 00014736    mov         eax,ebx
 00014738    call        @LStrToPChar
 0001473D    push        eax
 0001473E    push        0
 00014740    push        0
 00014742    call        kernel32.MultiByteToWideChar
 00014747    push        eax
 00014748    lea         eax,[esp+4]
 0001474C    push        eax
 0001474D    call        oleaut32.SysAllocStringLen
 00014752    mov         edi,eax
>00014754    jmp         0001477E
 00014756    push        0
 00014758    push        0
 0001475A    push        esi
 0001475B    push        ebx
 0001475C    push        0
 0001475E    push        0
 00014760    call        kernel32.MultiByteToWideChar
 00014765    mov         ebp,eax
 00014767    push        ebp
 00014768    push        0
 0001476A    call        oleaut32.SysAllocStringLen
 0001476F    mov         edi,eax
 00014771    push        ebp
 00014772    push        edi
 00014773    push        esi
 00014774    push        ebx
 00014775    push        0
 00014777    push        0
 00014779    call        kernel32.MultiByteToWideChar
 0001477E    mov         eax,edi
 00014780    add         esp,800
 00014786    pop         ebp
 00014787    pop         edi
 00014788    pop         esi
 00014789    pop         ebx
 0001478A    ret
*}
end;

//0001478C
procedure @DispInvokeError;
begin
{*
 0001478C    mov         al,11
>0001478E    jmp         Error
 00014793    ret
*}
end;

//00014794
procedure VarCastError;
begin
{*
 00014794    mov         al,0F
>00014796    jmp         Error
 0001479B    ret
*}
end;

//0001479C
procedure VarInvalidOp;
begin
{*
 0001479C    mov         al,10
>0001479E    jmp         Error
 000147A3    ret
*}
end;

//000147A4
procedure @VarClear(var V:Variant);
begin
{*
 000147A4    xor         edx,edx
 000147A6    mov         dx,word ptr [eax]
 000147A9    test        edx,4000
>000147AF    jne         000147D9
 000147B1    cmp         edx,8
>000147B4    jb          000147D9
 000147B6    cmp         edx,100
>000147BC    je          000147CC
 000147BE    cmp         edx,101
>000147C4    jne         000147DF
 000147C6    jmp         dword ptr ds:[0B63E8]
 000147CC    mov         word ptr [eax],0
 000147D1    add         eax,8
>000147D4    jmp         @LStrClr
 000147D9    mov         word ptr [eax],0
 000147DE    ret
 000147DF    push        eax
 000147E0    call        oleaut32.VariantClear
 000147E5    ret
*}
end;

//000147E8
procedure @VarCopy(var Dest:Variant; const Source:Variant);
begin
{*
 000147E8    cmp         eax,edx
>000147EA    je          0001487F
 000147F0    cmp         word ptr [eax],8
>000147F4    jb          00014820
 000147F6    push        eax
 000147F7    push        edx
 000147F8    cmp         word ptr [eax],100
>000147FD    je          00014816
 000147FF    cmp         word ptr [eax],101
>00014804    je          0001480E
 00014806    push        eax
 00014807    call        oleaut32.VariantClear
>0001480C    jmp         0001481E
 0001480E    call        dword ptr ds:[0B63E8]
>00014814    jmp         0001481E
 00014816    add         eax,8
 00014819    call        @LStrClr
 0001481E    pop         edx
 0001481F    pop         eax
 00014820    cmp         word ptr [edx],8
>00014824    jae         00014837
 00014826    mov         ecx,dword ptr [edx]
 00014828    mov         dword ptr [eax],ecx
 0001482A    mov         ecx,dword ptr [edx+8]
 0001482D    mov         dword ptr [eax+8],ecx
 00014830    mov         ecx,dword ptr [edx+0C]
 00014833    mov         dword ptr [eax+0C],ecx
 00014836    ret
 00014837    cmp         word ptr [edx],100
>0001483C    je          00014852
 0001483E    cmp         word ptr [edx],101
>00014843    jne         0001486B
 00014845    push        eax
 00014846    call        00014826
 0001484B    pop         eax
 0001484C    jmp         dword ptr ds:[0B63F0]
 00014852    mov         edx,dword ptr [edx+8]
 00014855    or          edx,edx
>00014857    je          00014862
 00014859    mov         ecx,dword ptr [edx-8]
 0001485C    inc         ecx
>0001485D    jle         00014862
 0001485F    mov         dword ptr [edx-8],ecx
 00014862    mov         word ptr [eax],100
 00014867    mov         dword ptr [eax+8],edx
 0001486A    ret
 0001486B    mov         word ptr [eax],0
 00014870    push        edx
 00014871    push        eax
 00014872    call        oleaut32.VariantCopyInd
 00014877    or          eax,eax
>00014879    jne         0001479C
 0001487F    ret
*}
end;

//00014880
procedure AnyChangeType(var Dest:Variant; Source:Variant; DestType:Word);
begin
{*
 00014880    push        ebp
 00014881    mov         ebp,esp
 00014883    add         esp,0FFFFFFF0
 00014886    push        ebx
 00014887    push        esi
 00014888    push        edi
 00014889    mov         esi,edx
 0001488B    lea         edi,[ebp-10]
 0001488E    push        ecx
 0001488F    mov         ecx,4
 00014894    rep movs    dword ptr [edi],dword ptr [esi]
 00014896    pop         ecx
 00014897    mov         esi,ecx
 00014899    mov         ebx,eax
 0001489B    lea         eax,[ebp-10]
 0001489E    call        @VarAddRef
 000148A3    xor         eax,eax
 000148A5    push        ebp
 000148A6    push        148DC
 000148AB    push        dword ptr fs:[eax]
 000148AE    mov         dword ptr fs:[eax],esp
 000148B1    lea         eax,[ebp-10]
 000148B4    call        dword ptr ds:[0B63EC]
 000148BA    lea         edx,[ebp-10]
 000148BD    mov         eax,ebx
 000148BF    mov         ecx,esi
 000148C1    call        VarChangeType
 000148C6    xor         eax,eax
 000148C8    pop         edx
 000148C9    pop         ecx
 000148CA    pop         ecx
 000148CB    mov         dword ptr fs:[eax],edx
 000148CE    push        148E3
 000148D3    lea         eax,[ebp-10]
 000148D6    call        @VarClr
 000148DB    ret
>000148DC    jmp         @HandleFinally
>000148E1    jmp         000148D3
 000148E3    pop         edi
 000148E4    pop         esi
 000148E5    pop         ebx
 000148E6    mov         esp,ebp
 000148E8    pop         ebp
 000148E9    ret
*}
end;

//000148EC
{*function sub_000148EC(?:?; ?:?):?;
begin
 000148EC    push        ebx
 000148ED    xor         ebx,ebx
 000148EF    cmp         word ptr [edx],101
>000148F4    jne         000148FD
 000148F6    call        AnyChangeType
 000148FB    mov         bl,1
 000148FD    mov         eax,ebx
 000148FF    pop         ebx
 00014900    ret
end;*}

//00014904
procedure VarChangeType(var Dest:Variant; const Source:Variant; DestType:Word);
begin
{*
 00014904    push        ebp
 00014905    mov         ebp,esp
 00014907    add         esp,0FFFFFFF0
 0001490A    push        ebx
 0001490B    push        esi
 0001490C    push        edi
 0001490D    mov         edi,ecx
 0001490F    mov         esi,edx
 00014911    mov         ebx,eax
 00014913    mov         ax,word ptr [ebx]
 00014916    sub         ax,100
>0001491A    je          00014923
 0001491C    dec         ax
>0001491F    je          0001496D
>00014921    jmp         0001497A
 00014923    mov         edx,esi
 00014925    mov         eax,ebx
 00014927    mov         ecx,edi
 00014929    call        000148EC
 0001492E    test        al,al
>00014930    jne         000149A1
 00014932    mov         word ptr [ebp-10],0
 00014938    push        edi
 00014939    push        0
 0001493B    push        400
 00014940    push        esi
 00014941    lea         eax,[ebp-10]
 00014944    push        eax
 00014945    call        oleaut32.VariantChangeTypeEx
 0001494A    test        eax,eax
>0001494C    je          00014953
 0001494E    call        VarCastError
 00014953    mov         eax,ebx
 00014955    call        @VarClear
 0001495A    mov         eax,dword ptr [ebp-10]
 0001495D    mov         dword ptr [ebx],eax
 0001495F    mov         eax,dword ptr [ebp-8]
 00014962    mov         dword ptr [ebx+8],eax
 00014965    mov         eax,dword ptr [ebp-4]
 00014968    mov         dword ptr [ebx+0C],eax
>0001496B    jmp         000149A1
 0001496D    mov         edx,esi
 0001496F    mov         eax,ebx
 00014971    mov         ecx,edi
 00014973    call        AnyChangeType
>00014978    jmp         000149A1
 0001497A    mov         edx,esi
 0001497C    mov         eax,ebx
 0001497E    mov         ecx,edi
 00014980    call        000148EC
 00014985    test        al,al
>00014987    jne         000149A1
 00014989    push        edi
 0001498A    push        0
 0001498C    push        400
 00014991    push        esi
 00014992    push        ebx
 00014993    call        oleaut32.VariantChangeTypeEx
 00014998    test        eax,eax
>0001499A    je          000149A1
 0001499C    call        VarCastError
 000149A1    pop         edi
 000149A2    pop         esi
 000149A3    pop         ebx
 000149A4    mov         esp,ebp
 000149A6    pop         ebp
 000149A7    ret
*}
end;

//000149A8
procedure VarOleStrToString(var Dest:Variant; const Source:Variant);
begin
{*
 000149A8    push        ebp
 000149A9    mov         ebp,esp
 000149AB    push        ecx
 000149AC    push        ebx
 000149AD    mov         ebx,eax
 000149AF    xor         eax,eax
 000149B1    mov         dword ptr [ebp-4],eax
 000149B4    mov         eax,dword ptr [edx+8]
 000149B7    lea         edx,[ebp-4]
 000149BA    call        OleStrToStrVar
 000149BF    mov         eax,ebx
 000149C1    call        @VarClear
 000149C6    mov         word ptr [ebx],100
 000149CB    mov         eax,dword ptr [ebp-4]
 000149CE    mov         dword ptr [ebx+8],eax
 000149D1    pop         ebx
 000149D2    pop         ecx
 000149D3    pop         ebp
 000149D4    ret
*}
end;

//000149D8
procedure VarStringToOleStr(var Dest:Variant; const Source:Variant);
begin
{*
 000149D8    push        ebx
 000149D9    push        esi
 000149DA    mov         ebx,eax
 000149DC    mov         eax,dword ptr [edx+8]
 000149DF    call        StringToOleStr
 000149E4    mov         esi,eax
 000149E6    mov         eax,ebx
 000149E8    call        @VarClear
 000149ED    mov         word ptr [ebx],8
 000149F2    mov         dword ptr [ebx+8],esi
 000149F5    pop         esi
 000149F6    pop         ebx
 000149F7    ret
*}
end;

//000149F8
procedure @VarCast(var Dest:Variant; const Source:Variant; VarType:Integer);
begin
{*
 000149F8    push        ebp
 000149F9    mov         ebp,esp
 000149FB    add         esp,0FFFFFFEC
 000149FE    push        ebx
 000149FF    mov         dword ptr [ebp-14],eax
 00014A02    mov         ax,word ptr [edx]
 00014A05    mov         ebx,ecx
 00014A07    cmp         bx,ax
>00014A0A    jne         00014A19
 00014A0C    mov         eax,dword ptr [ebp-14]
 00014A0F    call        @VarCopy
>00014A14    jmp         00014AE7
 00014A19    cmp         ax,100
>00014A1D    jne         00014A78
 00014A1F    cmp         bx,8
>00014A23    jne         00014A32
 00014A25    mov         eax,dword ptr [ebp-14]
 00014A28    call        VarStringToOleStr
>00014A2D    jmp         00014AE7
 00014A32    mov         word ptr [ebp-10],0
 00014A38    lea         eax,[ebp-10]
 00014A3B    call        VarStringToOleStr
 00014A40    xor         eax,eax
 00014A42    push        ebp
 00014A43    push        14A71
 00014A48    push        dword ptr fs:[eax]
 00014A4B    mov         dword ptr fs:[eax],esp
 00014A4E    lea         edx,[ebp-10]
 00014A51    mov         eax,dword ptr [ebp-14]
 00014A54    mov         ecx,ebx
 00014A56    call        VarChangeType
 00014A5B    xor         eax,eax
 00014A5D    pop         edx
 00014A5E    pop         ecx
 00014A5F    pop         ecx
 00014A60    mov         dword ptr fs:[eax],edx
 00014A63    push        14AE7
 00014A68    lea         eax,[ebp-10]
 00014A6B    call        @VarClear
 00014A70    ret
>00014A71    jmp         @HandleFinally
>00014A76    jmp         00014A68
 00014A78    cmp         bx,100
>00014A7D    jne         00014ADD
 00014A7F    cmp         ax,101
>00014A83    je          00014ADD
 00014A85    cmp         ax,8
>00014A89    jne         00014A95
 00014A8B    mov         eax,dword ptr [ebp-14]
 00014A8E    call        VarOleStrToString
>00014A93    jmp         00014AE7
 00014A95    mov         word ptr [ebp-10],0
 00014A9B    lea         eax,[ebp-10]
 00014A9E    mov         cx,8
 00014AA2    call        VarChangeType
 00014AA7    xor         eax,eax
 00014AA9    push        ebp
 00014AAA    push        14AD6
 00014AAF    push        dword ptr fs:[eax]
 00014AB2    mov         dword ptr fs:[eax],esp
 00014AB5    lea         edx,[ebp-10]
 00014AB8    mov         eax,dword ptr [ebp-14]
 00014ABB    call        VarOleStrToString
 00014AC0    xor         eax,eax
 00014AC2    pop         edx
 00014AC3    pop         ecx
 00014AC4    pop         ecx
 00014AC5    mov         dword ptr fs:[eax],edx
 00014AC8    push        14AE7
 00014ACD    lea         eax,[ebp-10]
 00014AD0    call        @VarClear
 00014AD5    ret
>00014AD6    jmp         @HandleFinally
>00014ADB    jmp         00014ACD
 00014ADD    mov         eax,dword ptr [ebp-14]
 00014AE0    mov         ecx,ebx
 00014AE2    call        VarChangeType
 00014AE7    pop         ebx
 00014AE8    mov         esp,ebp
 00014AEA    pop         ebp
 00014AEB    ret
*}
end;

//00014AEC
procedure @VarToInt;
begin
{*
 00014AEC    xor         edx,edx
 00014AEE    mov         dx,word ptr [eax]
 00014AF1    cmp         edx,3
>00014AF4    je          00014B2E
 00014AF6    cmp         edx,2
>00014AF9    je          00014B32
 00014AFB    cmp         edx,11
>00014AFE    je          00014B37
 00014B00    cmp         edx,5
>00014B03    je          00014B4C
 00014B05    cmp         edx,4
>00014B08    je          00014B47
 00014B0A    cmp         edx,6
>00014B0D    je          00014B3C
 00014B0F    sub         esp,10
 00014B12    mov         word ptr [esp],0
 00014B18    mov         edx,eax
 00014B1A    mov         eax,esp
 00014B1C    mov         ecx,3
 00014B21    call        @VarCast
 00014B26    mov         eax,dword ptr [esp+8]
 00014B2A    add         esp,10
 00014B2D    ret
 00014B2E    mov         eax,dword ptr [eax+8]
 00014B31    ret
 00014B32    movsx       eax,word ptr [eax+8]
 00014B36    ret
 00014B37    movzx       eax,byte ptr [eax+8]
 00014B3B    ret
 00014B3C    fild        qword ptr [eax+8]
 00014B3F    fdiv        dword ptr ds:[0B40B8]
>00014B45    jmp         00014B4F
 00014B47    fld         dword ptr [eax+8]
>00014B4A    jmp         00014B4F
 00014B4C    fld         qword ptr [eax+8]
 00014B4F    push        eax
 00014B50    fistp       dword ptr [esp]
 00014B53    wait
 00014B54    pop         eax
 00014B55    ret
*}
end;

//00014B58
procedure @VarToBool;
begin
{*
 00014B58    cmp         word ptr [eax],0B
>00014B5C    je          00014B7F
 00014B5E    sub         esp,10
 00014B61    mov         word ptr [esp],0
 00014B67    mov         edx,eax
 00014B69    mov         eax,esp
 00014B6B    mov         ecx,0B
 00014B70    call        @VarCast
 00014B75    mov         ax,word ptr [esp+8]
 00014B7A    add         esp,10
>00014B7D    jmp         00014B83
 00014B7F    mov         ax,word ptr [eax+8]
 00014B83    neg         ax
 00014B86    sbb         eax,eax
 00014B88    neg         eax
 00014B8A    ret
*}
end;

//00014B8C
procedure @VarToReal;
begin
{*
 00014B8C    xor         edx,edx
 00014B8E    mov         dx,word ptr [eax]
 00014B91    cmp         edx,5
>00014B94    je          00014BCE
 00014B96    cmp         edx,4
>00014B99    je          00014BD2
 00014B9B    cmp         edx,6
>00014B9E    je          00014BD6
 00014BA0    cmp         edx,3
>00014BA3    je          00014BE0
 00014BA5    cmp         edx,2
>00014BA8    je          00014BE4
 00014BAA    cmp         edx,7
>00014BAD    je          00014BCE
 00014BAF    sub         esp,10
 00014BB2    mov         word ptr [esp],0
 00014BB8    mov         edx,eax
 00014BBA    mov         eax,esp
 00014BBC    mov         ecx,5
 00014BC1    call        @VarCast
 00014BC6    fld         qword ptr [esp+8]
 00014BCA    add         esp,10
 00014BCD    ret
 00014BCE    fld         qword ptr [eax+8]
 00014BD1    ret
 00014BD2    fld         dword ptr [eax+8]
 00014BD5    ret
 00014BD6    fild        qword ptr [eax+8]
 00014BD9    fdiv        dword ptr ds:[0B40B8]
 00014BDF    ret
 00014BE0    fild        dword ptr [eax+8]
 00014BE3    ret
 00014BE4    fild        word ptr [eax+8]
 00014BE7    ret
*}
end;

//00014BE8
procedure @VarToCurr;
begin
{*
 00014BE8    xor         edx,edx
 00014BEA    mov         dx,word ptr [eax]
 00014BED    cmp         edx,6
>00014BF0    je          00014C25
 00014BF2    cmp         edx,5
>00014BF5    je          00014C29
 00014BF7    cmp         edx,4
>00014BFA    je          00014C2E
 00014BFC    cmp         edx,3
>00014BFF    je          00014C33
 00014C01    cmp         edx,2
>00014C04    je          00014C38
 00014C06    sub         esp,10
 00014C09    mov         word ptr [esp],0
 00014C0F    mov         edx,eax
 00014C11    mov         eax,esp
 00014C13    mov         ecx,6
 00014C18    call        @VarCast
 00014C1D    fild        qword ptr [esp+8]
 00014C21    add         esp,10
 00014C24    ret
 00014C25    fild        qword ptr [eax+8]
 00014C28    ret
 00014C29    fld         qword ptr [eax+8]
>00014C2C    jmp         00014C3B
 00014C2E    fld         dword ptr [eax+8]
>00014C31    jmp         00014C3B
 00014C33    fild        dword ptr [eax+8]
>00014C36    jmp         00014C3B
 00014C38    fild        word ptr [eax+8]
 00014C3B    fmul        dword ptr ds:[0B40B8]
 00014C41    ret
*}
end;

//00014C44
procedure @VarToLStr(var S:AnsiString; const V:Variant);
begin
{*
 00014C44    cmp         word ptr [edx],100
>00014C49    jne         00014C53
 00014C4B    mov         edx,dword ptr [edx+8]
>00014C4E    jmp         @LStrAsg
 00014C53    push        ebx
 00014C54    mov         ebx,eax
 00014C56    sub         esp,10
 00014C59    mov         word ptr [esp],0
 00014C5F    mov         eax,esp
 00014C61    mov         ecx,100
 00014C66    call        @VarCast
 00014C6B    mov         eax,ebx
 00014C6D    call        @LStrClr
 00014C72    mov         eax,dword ptr [esp+8]
 00014C76    mov         dword ptr [ebx],eax
 00014C78    add         esp,10
 00014C7B    pop         ebx
 00014C7C    ret
*}
end;

//00014C80
procedure @VarToWStr(var S:WideString; const V:Variant);
begin
{*
 00014C80    cmp         word ptr [edx],8
>00014C84    jne         00014C8E
 00014C86    mov         edx,dword ptr [edx+8]
>00014C89    jmp         @WStrAsg
 00014C8E    push        ebx
 00014C8F    mov         ebx,eax
 00014C91    sub         esp,10
 00014C94    mov         word ptr [esp],0
 00014C9A    mov         eax,esp
 00014C9C    mov         ecx,8
 00014CA1    call        @VarCast
 00014CA6    mov         eax,ebx
 00014CA8    mov         edx,dword ptr [esp+8]
 00014CAC    call        WStrSet
 00014CB1    add         esp,10
 00014CB4    pop         ebx
 00014CB5    ret
*}
end;

//00014CB8
procedure @VarFromLStr(var V:Variant; const Value:AnsiString);
begin
{*
 00014CB8    cmp         word ptr [eax],8
>00014CBC    jb          00014CC7
 00014CBE    push        eax
 00014CBF    push        edx
 00014CC0    call        @VarClear
 00014CC5    pop         edx
 00014CC6    pop         eax
 00014CC7    test        edx,edx
>00014CC9    je          00014CEE
 00014CCB    mov         ecx,dword ptr [edx-8]
 00014CCE    inc         ecx
>00014CCF    jle         00014CD6
 00014CD1    mov         dword ptr [edx-8],ecx
>00014CD4    jmp         00014CEE
 00014CD6    push        eax
 00014CD7    push        edx
 00014CD8    mov         eax,dword ptr [edx-4]
 00014CDB    call        @NewAnsiString
 00014CE0    mov         edx,eax
 00014CE2    pop         eax
 00014CE3    push        edx
 00014CE4    mov         ecx,dword ptr [edx-4]
 00014CE7    call        Move
 00014CEC    pop         edx
 00014CED    pop         eax
 00014CEE    mov         word ptr [eax],100
 00014CF3    mov         dword ptr [eax+8],edx
 00014CF6    ret
*}
end;

//00014CF8
procedure @VarFromWStr(var V:Variant; const Value:WideString);
begin
{*
 00014CF8    push        eax
 00014CF9    cmp         word ptr [eax],8
>00014CFD    jb          00014D06
 00014CFF    push        edx
 00014D00    call        @VarClear
 00014D05    pop         edx
 00014D06    xor         eax,eax
 00014D08    test        edx,edx
>00014D0A    je          00014D22
 00014D0C    mov         eax,dword ptr [edx-4]
 00014D0F    shr         eax,1
>00014D11    je          00014D22
 00014D13    push        eax
 00014D14    push        edx
 00014D15    call        oleaut32.SysAllocStringLen
 00014D1A    test        eax,eax
>00014D1C    je          000140A8
 00014D22    pop         edx
 00014D23    mov         word ptr [edx],8
 00014D28    mov         dword ptr [edx+8],eax
 00014D2B    ret
*}
end;

//00014D2C
function VarCompareString(const S1:AnsiString; const S2:AnsiString):Integer;
begin
{*
 00014D2C    push        esi
 00014D2D    push        edi
 00014D2E    mov         esi,eax
 00014D30    mov         edi,edx
 00014D32    or          eax,eax
>00014D34    je          00014D39
 00014D36    mov         eax,dword ptr [eax-4]
 00014D39    or          edx,edx
>00014D3B    je          00014D40
 00014D3D    mov         edx,dword ptr [edx-4]
 00014D40    mov         ecx,eax
 00014D42    cmp         ecx,edx
>00014D44    jbe         00014D48
 00014D46    mov         ecx,edx
 00014D48    cmp         ecx,ecx
 00014D4A    repe cmps   byte ptr [esi],byte ptr [edi]
>00014D4C    je          00014D56
 00014D4E    movzx       eax,byte ptr [esi-1]
 00014D52    movzx       edx,byte ptr [edi-1]
 00014D56    sub         eax,edx
 00014D58    pop         edi
 00014D59    pop         esi
 00014D5A    ret
*}
end;

//00014D5C
function VarCmpStr(const V1:Variant; const V2:Variant):Integer;
begin
{*
 00014D5C    push        ebp
 00014D5D    mov         ebp,esp
 00014D5F    push        0
 00014D61    push        0
 00014D63    push        ebx
 00014D64    push        esi
 00014D65    mov         esi,edx
 00014D67    mov         ebx,eax
 00014D69    xor         eax,eax
 00014D6B    push        ebp
 00014D6C    push        14DB5
 00014D71    push        dword ptr fs:[eax]
 00014D74    mov         dword ptr fs:[eax],esp
 00014D77    lea         eax,[ebp-4]
 00014D7A    mov         edx,esi
 00014D7C    call        @VarToLStr
 00014D81    mov         eax,dword ptr [ebp-4]
 00014D84    push        eax
 00014D85    lea         eax,[ebp-8]
 00014D88    mov         edx,ebx
 00014D8A    call        @VarToLStr
 00014D8F    mov         eax,dword ptr [ebp-8]
 00014D92    pop         edx
 00014D93    call        VarCompareString
 00014D98    mov         ebx,eax
 00014D9A    xor         eax,eax
 00014D9C    pop         edx
 00014D9D    pop         ecx
 00014D9E    pop         ecx
 00014D9F    mov         dword ptr fs:[eax],edx
 00014DA2    push        14DBC
 00014DA7    lea         eax,[ebp-8]
 00014DAA    mov         edx,2
 00014DAF    call        @LStrArrayClr
 00014DB4    ret
>00014DB5    jmp         @HandleFinally
>00014DBA    jmp         00014DA7
 00014DBC    mov         eax,ebx
 00014DBE    pop         esi
 00014DBF    pop         ebx
 00014DC0    pop         ecx
 00014DC1    pop         ecx
 00014DC2    pop         ebp
 00014DC3    ret
*}
end;

//00014DC4
function AnyCmp(var Dest:Variant; const Source:Variant):Integer;
begin
{*
 00014DC4    push        ebp
 00014DC5    mov         ebp,esp
 00014DC7    xor         ecx,ecx
 00014DC9    push        ecx
 00014DCA    push        ecx
 00014DCB    push        ecx
 00014DCC    push        ecx
 00014DCD    push        ecx
 00014DCE    push        ecx
 00014DCF    push        ecx
 00014DD0    push        ebx
 00014DD1    push        esi
 00014DD2    mov         ebx,edx
 00014DD4    mov         dword ptr [ebp-4],eax
 00014DD7    lea         esi,[ebp-0C]
 00014DDA    xor         eax,eax
 00014DDC    push        ebp
 00014DDD    push        14E46
 00014DE2    push        dword ptr fs:[eax]
 00014DE5    mov         dword ptr fs:[eax],esp
 00014DE8    push        dword ptr [ebp-4]
 00014DEB    mov         dword ptr [ebp-8],ebx
 00014DEE    mov         eax,dword ptr [ebp-4]
 00014DF1    cmp         word ptr [eax],101
>00014DF6    jne         00014E01
 00014DF8    mov         eax,dword ptr [ebp-4]
 00014DFB    call        dword ptr ds:[0B63EC]
 00014E01    cmp         word ptr [ebx],101
>00014E06    jne         00014E21
 00014E08    lea         eax,[ebp-1C]
 00014E0B    mov         edx,ebx
 00014E0D    call        @VarCopy
 00014E12    lea         eax,[ebp-1C]
 00014E15    call        dword ptr ds:[0B63EC]
 00014E1B    lea         eax,[ebp-1C]
 00014E1E    mov         dword ptr [ebp-8],eax
 00014E21    mov         edx,dword ptr [ebp-8]
 00014E24    pop         eax
 00014E25    call        @VarCmp
 00014E2A    pushf
 00014E2C    pop         eax
 00014E2D    mov         dword ptr [ebp-0C],eax
 00014E30    xor         eax,eax
 00014E32    pop         edx
 00014E33    pop         ecx
 00014E34    pop         ecx
 00014E35    mov         dword ptr fs:[eax],edx
 00014E38    push        14E4D
 00014E3D    lea         eax,[ebp-1C]
 00014E40    call        @VarClr
 00014E45    ret
>00014E46    jmp         @HandleFinally
>00014E4B    jmp         00014E3D
 00014E4D    mov         eax,dword ptr [esi]
 00014E4F    pop         esi
 00014E50    pop         ebx
 00014E51    mov         esp,ebp
 00014E53    pop         ebp
 00014E54    ret
*}
end;

//00014E58
procedure @VarCmp;
begin
{*
 00014E58    push        esi
 00014E59    push        edi
 00014E5A    mov         edi,eax
 00014E5C    mov         esi,edx
 00014E5E    mov         eax,dword ptr [edi]
 00014E60    mov         edx,dword ptr [esi]
 00014E62    and         eax,0FFF
 00014E67    and         edx,0FFF
 00014E6D    cmp         eax,11
>00014E70    jbe         00014E7E
 00014E72    cmp         eax,100
>00014E77    jne         00014EAD
 00014E79    mov         eax,8
 00014E7E    cmp         edx,11
>00014E81    jbe         00014E90
 00014E83    cmp         edx,100
>00014E89    jne         00014EAB
 00014E8B    mov         edx,8
 00014E90    mov         al,byte ptr [eax+0B4064]
 00014E96    mov         dl,byte ptr [edx+0B4064]
 00014E9C    movzx       ecx,byte ptr [edx+eax*8+0B4078]
 00014EA4    jmp         dword ptr [ecx*4+14EBF]
 00014EAB    mov         eax,edx
 00014EAD    cmp         eax,101
>00014EB2    jne         00014EDF
 00014EB4    pop         edi
 00014EB5    pop         esi
 00014EB6    call        AnyCmp
 00014EBB    push        eax
 00014EBC    popf
 00014EBE    ret
 00014EBF    ???
 00014EC0    dec         esi
 00014EC1    add         dword ptr [eax],eax
 00014EC3    out         4E,al
 00014EC5    add         dword ptr [eax],eax
>00014EC7    jmp         00014F17
 00014EC9    add         dword ptr [eax],eax
 00014ECB    std
 00014ECC    dec         esi
 00014ECD    add         dword ptr [eax],eax
 00014ECF    sub         dword ptr [edi+1],ecx
 00014ED2    add         byte ptr [ebp+4F],al
 00014ED5    add         dword ptr [eax],eax
 00014ED7    push        esp
 00014ED8    dec         edi
 00014ED9    add         dword ptr [eax],eax
 00014EDB    std
 00014EDC    dec         esi
 00014EDD    add         dword ptr [eax],eax
 00014EDF    pop         edi
 00014EE0    pop         esi
>00014EE1    jmp         VarInvalidOp
 00014EE6    cmp         al,dl
 00014EE8    pop         edi
 00014EE9    pop         esi
 00014EEA    ret
 00014EEB    mov         eax,esi
 00014EED    call        @VarToInt
 00014EF2    xchg        eax,edi
 00014EF3    call        @VarToInt
 00014EF8    cmp         eax,edi
 00014EFA    pop         edi
 00014EFB    pop         esi
 00014EFC    ret
 00014EFD    mov         eax,edi
 00014EFF    call        @VarToReal
 00014F04    sub         esp,0C
 00014F07    fstp        tbyte ptr [esp]
 00014F0A    mov         eax,esi
 00014F0C    call        @VarToReal
 00014F11    fld         tbyte ptr [esp]
 00014F14    add         esp,0C
 00014F17    fcompp
 00014F19    fnstsw      al
 00014F1B    mov         al,ah
 00014F1D    and         ax,4001
 00014F21    ror         al,1
 00014F23    or          ah,al
 00014F25    sahf
 00014F26    pop         edi
 00014F27    pop         esi
 00014F28    ret
*}
end;

//00014F68
procedure @VarClr;
begin
{*
 00014F68    push        eax
 00014F69    call        @VarClear
 00014F6E    pop         eax
 00014F6F    ret
*}
end;

//00014F70
procedure @VarAddRef;
begin
{*
 00014F70    cmp         word ptr [eax],8
>00014F74    jb          00014F90
 00014F76    push        dword ptr [eax+0C]
 00014F79    push        dword ptr [eax+8]
 00014F7C    push        dword ptr [eax+4]
 00014F7F    push        dword ptr [eax]
 00014F81    mov         word ptr [eax],0
 00014F86    mov         edx,esp
 00014F88    call        @VarCopy
 00014F8D    add         esp,10
 00014F90    ret
*}
end;

//00014F94
function VarType(const V:Variant):Integer;
begin
{*
 00014F94    movzx       eax,word ptr [eax]
 00014F97    ret
*}
end;

//00014F98
function VarIsEmpty(const V:Variant):Boolean;
begin
{*
 00014F98    cmp         word ptr [eax],0
>00014F9C    je          00014FB6
 00014F9E    mov         dx,word ptr [eax]
 00014FA1    cmp         dx,9
>00014FA5    je          00014FAD
 00014FA7    cmp         dx,0D
>00014FAB    jne         00014FB3
 00014FAD    cmp         dword ptr [eax+8],0
>00014FB1    je          00014FB6
 00014FB3    xor         eax,eax
 00014FB5    ret
 00014FB6    mov         al,1
 00014FB8    ret
*}
end;

//00014FBC
function VarIsArray(const A:Variant):Boolean;
begin
{*
 00014FBC    test        byte ptr [eax+1],20
 00014FC0    setne       al
 00014FC3    ret
*}
end;

//00014FC4
function @DynArrayLength(Arr:Pointer):Longint;
begin
{*
 00014FC4    test        eax,eax
>00014FC6    je          00014FCB
 00014FC8    mov         eax,dword ptr [eax-4]
 00014FCB    ret
*}
end;

//00014FCC
function @DynArrayHigh(Arr:Pointer):Longint;
begin
{*
 00014FCC    call        @DynArrayLength
 00014FD1    dec         eax
 00014FD2    ret
*}
end;

//00014FD4
procedure CopyArray(dest:Pointer; source:Pointer; typeInfo:Pointer; cnt:Integer);
begin
{*
 00014FD4    push        ebp
 00014FD5    mov         ebp,esp
 00014FD7    push        dword ptr [ebp+8]
 00014FDA    call        @CopyArray
 00014FDF    pop         ebp
 00014FE0    ret         4
*}
end;

//00014FE4
procedure FinalizeArray(p:Pointer; typeInfo:Pointer; cnt:Integer);
begin
{*
>00014FE4    jmp         @FinalizeArray
 00014FE9    ret
*}
end;

//00014FEC
procedure DynArrayClear(var arr:Pointer; typeInfo:PDynArrayTypeInfo);
begin
{*
 00014FEC    call        @DynArrayClear
 00014FF1    ret
*}
end;

//00014FF4
procedure DynArraySetLength(var arr:Pointer; typeInfo:PDynArrayTypeInfo; dimCnt:Longint; lenVec:PLongint);
begin
{*
 00014FF4    push        ebp
 00014FF5    mov         ebp,esp
 00014FF7    add         esp,0FFFFFFE0
 00014FFA    push        ebx
 00014FFB    push        esi
 00014FFC    push        edi
 00014FFD    mov         dword ptr [ebp-8],ecx
 00015000    mov         esi,edx
 00015002    mov         dword ptr [ebp-4],eax
 00015005    mov         ebx,dword ptr [ebp-4]
 00015008    mov         ebx,dword ptr [ebx]
 0001500A    mov         eax,dword ptr [ebp+8]
 0001500D    mov         edi,dword ptr [eax]
 0001500F    test        edi,edi
>00015011    jg          0001502D
 00015013    test        edi,edi
>00015015    jge         0001501E
 00015017    mov         al,4
 00015019    call        Error
 0001501E    mov         eax,dword ptr [ebp-4]
 00015021    mov         edx,esi
 00015023    call        DynArrayClear
>00015028    jmp         00015175
 0001502D    xor         eax,eax
 0001502F    mov         dword ptr [ebp-10],eax
 00015032    test        ebx,ebx
>00015034    je          00015041
 00015036    sub         ebx,4
 00015039    mov         eax,dword ptr [ebx]
 0001503B    mov         dword ptr [ebp-10],eax
 0001503E    sub         ebx,4
 00015041    xor         eax,eax
 00015043    mov         al,byte ptr [esi+1]
 00015046    add         esi,eax
 00015048    mov         eax,dword ptr [esi+2]
 0001504B    mov         dword ptr [ebp-18],eax
 0001504E    mov         eax,dword ptr [esi+6]
 00015051    test        eax,eax
>00015053    je          00015059
 00015055    mov         esi,dword ptr [eax]
>00015057    jmp         0001505B
 00015059    xor         esi,esi
 0001505B    mov         eax,edi
 0001505D    imul        dword ptr [ebp-18]
 00015060    mov         dword ptr [ebp-1C],eax
 00015063    mov         eax,dword ptr [ebp-1C]
 00015066    cdq
 00015067    idiv        eax,edi
 00015069    cmp         eax,dword ptr [ebp-18]
>0001506C    je          00015075
 0001506E    mov         al,4
 00015070    call        Error
 00015075    add         dword ptr [ebp-1C],8
 00015079    test        ebx,ebx
>0001507B    je          00015082
 0001507D    cmp         dword ptr [ebx],1
>00015080    jne         000150B7
 00015082    mov         dword ptr [ebp-20],ebx
 00015085    cmp         edi,dword ptr [ebp-10]
>00015088    jge         000150A7
 0001508A    test        esi,esi
>0001508C    je          000150A7
 0001508E    mov         eax,ebx
 00015090    add         eax,8
 00015093    mov         edx,edi
 00015095    imul        edx,dword ptr [ebp-18]
 00015099    add         eax,edx
 0001509B    mov         ecx,dword ptr [ebp-10]
 0001509E    sub         ecx,edi
 000150A0    mov         edx,esi
 000150A2    call        FinalizeArray
 000150A7    lea         eax,[ebp-20]
 000150AA    mov         edx,dword ptr [ebp-1C]
 000150AD    call        @ReallocMem
 000150B2    mov         ebx,dword ptr [ebp-20]
>000150B5    jmp         00015115
 000150B7    dec         dword ptr [ebx]
 000150B9    mov         eax,dword ptr [ebp-1C]
 000150BC    call        @GetMem
 000150C1    mov         ebx,eax
 000150C3    mov         eax,dword ptr [ebp-10]
 000150C6    mov         dword ptr [ebp-14],eax
 000150C9    cmp         edi,dword ptr [ebp-14]
>000150CC    jge         000150D1
 000150CE    mov         dword ptr [ebp-14],edi
 000150D1    test        esi,esi
>000150D3    je          000150FF
 000150D5    mov         edx,dword ptr [ebp-14]
 000150D8    imul        edx,dword ptr [ebp-18]
 000150DC    mov         eax,ebx
 000150DE    add         eax,8
 000150E1    xor         ecx,ecx
 000150E3    call        @FillChar
 000150E8    mov         eax,dword ptr [ebp-14]
 000150EB    push        eax
 000150EC    mov         edx,dword ptr [ebp-4]
 000150EF    mov         edx,dword ptr [edx]
 000150F1    mov         eax,ebx
 000150F3    add         eax,8
 000150F6    mov         ecx,esi
 000150F8    call        CopyArray
>000150FD    jmp         00015115
 000150FF    mov         ecx,dword ptr [ebp-14]
 00015102    imul        ecx,dword ptr [ebp-18]
 00015106    mov         edx,ebx
 00015108    add         edx,8
 0001510B    mov         eax,dword ptr [ebp-4]
 0001510E    mov         eax,dword ptr [eax]
 00015110    call        Move
 00015115    mov         dword ptr [ebx],1
 0001511B    add         ebx,4
 0001511E    mov         dword ptr [ebx],edi
 00015120    add         ebx,4
 00015123    mov         edx,edi
 00015125    sub         edx,dword ptr [ebp-10]
 00015128    imul        edx,dword ptr [ebp-18]
 0001512C    mov         eax,dword ptr [ebp-18]
 0001512F    imul        eax,dword ptr [ebp-10]
 00015133    add         eax,ebx
 00015135    xor         ecx,ecx
 00015137    call        @FillChar
 0001513C    cmp         dword ptr [ebp-8],1
>00015140    jle         00015170
 00015142    add         dword ptr [ebp+8],4
 00015146    dec         dword ptr [ebp-8]
 00015149    dec         edi
 0001514A    test        edi,edi
>0001514C    jl          00015170
 0001514E    inc         edi
 0001514F    mov         dword ptr [ebp-0C],0
 00015156    mov         eax,dword ptr [ebp+8]
 00015159    push        eax
 0001515A    mov         eax,dword ptr [ebp-0C]
 0001515D    lea         eax,[ebx+eax*4]
 00015160    mov         ecx,dword ptr [ebp-8]
 00015163    mov         edx,esi
 00015165    call        DynArraySetLength
 0001516A    inc         dword ptr [ebp-0C]
 0001516D    dec         edi
>0001516E    jne         00015156
 00015170    mov         eax,dword ptr [ebp-4]
 00015173    mov         dword ptr [eax],ebx
 00015175    pop         edi
 00015176    pop         esi
 00015177    pop         ebx
 00015178    mov         esp,ebp
 0001517A    pop         ebp
 0001517B    ret         4
*}
end;

//00015180
procedure @DynArraySetLength(var Arr:Pointer; TypeInfo:PDynArrayTypeInfo; DimCnt:Longint; LengthVec:Longint);
begin
{*
 00015180    push        esp
 00015181    add         dword ptr [esp],4
 00015185    call        DynArraySetLength
 0001518A    ret
*}
end;

//0001518C
procedure @DynArrayClear(var Arr:Pointer; TypeInfo:PDynArrayTypeInfo);
begin
{*
 0001518C    mov         ecx,dword ptr [eax]
 0001518E    test        ecx,ecx
>00015190    je          000151C4
 00015192    mov         dword ptr [eax],0
 00015198    dec         dword ptr [ecx-8]
>0001519B    jne         000151C4
 0001519D    push        eax
 0001519E    mov         eax,ecx
 000151A0    xor         ecx,ecx
 000151A2    mov         cl,byte ptr [edx+1]
 000151A5    mov         edx,dword ptr [edx+ecx+6]
 000151A9    test        edx,edx
>000151AB    je          000151BB
 000151AD    mov         ecx,dword ptr [eax-4]
 000151B0    test        ecx,ecx
>000151B2    je          000151BB
 000151B4    mov         edx,dword ptr [edx]
 000151B6    call        @FinalizeArray
 000151BB    sub         eax,8
 000151BE    call        @FreeMem
 000151C3    pop         eax
 000151C4    ret
*}
end;

//000151C8
procedure @DynArrayAsg(var Dest:Pointer; Source:Pointer; TypeInfo:PDynArrayTypeInfo);
begin
{*
 000151C8    push        ebx
 000151C9    mov         ebx,dword ptr [eax]
 000151CB    test        edx,edx
>000151CD    je          000151D2
 000151CF    inc         dword ptr [edx-8]
 000151D2    test        ebx,ebx
>000151D4    je          000151E9
 000151D6    dec         dword ptr [ebx-8]
>000151D9    jne         000151E9
 000151DB    push        eax
 000151DC    push        edx
 000151DD    mov         edx,ecx
 000151DF    inc         dword ptr [ebx-8]
 000151E2    call        @DynArrayClear
 000151E7    pop         edx
 000151E8    pop         eax
 000151E9    mov         dword ptr [eax],edx
 000151EB    pop         ebx
 000151EC    ret
*}
end;

//000151F0
function FindHInstance(Address:Pointer):Integer;
begin
{*
 000151F0    add         esp,0FFFFFFE4
 000151F3    push        1C
 000151F5    lea         edx,[esp+4]
 000151F9    push        edx
 000151FA    push        eax
 000151FB    call        kernel32.VirtualQuery
 00015200    cmp         dword ptr [esp+10],1000
>00015208    jne         00015210
 0001520A    mov         eax,dword ptr [esp+4]
>0001520E    jmp         00015212
 00015210    xor         eax,eax
 00015212    add         esp,1C
 00015215    ret
*}
end;

//00015218
function FindClassHInstance(ClassType:TClass):Integer;
begin
{*
 00015218    call        FindHInstance
 0001521D    ret
*}
end;

//00015220
function FindResourceHInstance(Instance:Cardinal):Integer;
begin
{*
 00015220    mov         edx,dword ptr ds:[0B4014]
 00015226    test        edx,edx
>00015228    je          00015243
 0001522A    cmp         eax,dword ptr [edx+4]
>0001522D    je          00015239
 0001522F    cmp         eax,dword ptr [edx+8]
>00015232    je          00015239
 00015234    cmp         eax,dword ptr [edx+0C]
>00015237    jne         0001523D
 00015239    mov         eax,dword ptr [edx+10]
 0001523C    ret
 0001523D    mov         edx,dword ptr [edx]
 0001523F    test        edx,edx
>00015241    jne         0001522A
 00015243    ret
*}
end;

//00015244
function LoadResourceModule(ModuleName:PAnsiChar):Integer;
begin
{*
 00015244    push        ebp
 00015245    mov         ebp,esp
 00015247    add         esp,0FFFFFEE0
 0001524D    push        ebx
 0001524E    push        esi
 0001524F    mov         dword ptr [ebp-4],eax
 00015252    push        105
 00015257    lea         eax,[ebp-11D]
 0001525D    push        eax
 0001525E    push        0
 00015260    call        kernel32.GetModuleFileNameA
 00015265    mov         byte ptr [ebp-12],0
 00015269    lea         eax,[ebp-8]
 0001526C    push        eax
 0001526D    push        0F003F
 00015272    push        0
 00015274    push        153FC
 00015279    push        80000001
 0001527E    call        advapi32.RegOpenKeyExA
 00015283    test        eax,eax
>00015285    je          000152A5
 00015287    lea         eax,[ebp-8]
 0001528A    push        eax
 0001528B    push        0F003F
 00015290    push        0
 00015292    push        15418
 00015297    push        80000001
 0001529C    call        advapi32.RegOpenKeyExA
 000152A1    test        eax,eax
>000152A3    jne         00015312
 000152A5    xor         eax,eax
 000152A7    push        ebp
 000152A8    push        1530B
 000152AD    push        dword ptr fs:[eax]
 000152B0    mov         dword ptr fs:[eax],esp
 000152B3    mov         dword ptr [ebp-18],5
 000152BA    lea         eax,[ebp-18]
 000152BD    push        eax
 000152BE    lea         eax,[ebp-12]
 000152C1    push        eax
 000152C2    push        0
 000152C4    push        0
 000152C6    lea         eax,[ebp-11D]
 000152CC    push        eax
 000152CD    mov         eax,dword ptr [ebp-8]
 000152D0    push        eax
 000152D1    call        advapi32.RegQueryValueExA
 000152D6    test        eax,eax
>000152D8    je          000152F4
 000152DA    lea         eax,[ebp-18]
 000152DD    push        eax
 000152DE    lea         eax,[ebp-12]
 000152E1    push        eax
 000152E2    push        0
 000152E4    push        0
 000152E6    push        15438
 000152EB    mov         eax,dword ptr [ebp-8]
 000152EE    push        eax
 000152EF    call        advapi32.RegQueryValueExA
 000152F4    xor         eax,eax
 000152F6    pop         edx
 000152F7    pop         ecx
 000152F8    pop         ecx
 000152F9    mov         dword ptr fs:[eax],edx
 000152FC    push        15312
 00015301    mov         eax,dword ptr [ebp-8]
 00015304    push        eax
 00015305    call        advapi32.RegCloseKey
 0001530A    ret
>0001530B    jmp         @HandleFinally
>00015310    jmp         00015301
 00015312    mov         eax,dword ptr [ebp-4]
 00015315    push        eax
 00015316    lea         eax,[ebp-11D]
 0001531C    push        eax
 0001531D    call        kernel32.lstrcpyA
 00015322    push        5
 00015324    lea         eax,[ebp-0D]
 00015327    push        eax
 00015328    push        3
 0001532A    call        kernel32.GetThreadLocale
 0001532F    push        eax
 00015330    call        kernel32.GetLocaleInfoA
 00015335    xor         esi,esi
 00015337    cmp         byte ptr [ebp-11D],0
>0001533E    je          000153F3
 00015344    cmp         byte ptr [ebp-0D],0
>00015348    jne         00015354
 0001534A    cmp         byte ptr [ebp-12],0
>0001534E    je          000153F3
 00015354    lea         eax,[ebp-11D]
 0001535A    push        eax
 0001535B    call        kernel32.lstrlenA
 00015360    mov         ebx,eax
 00015362    lea         eax,[ebp-11D]
 00015368    add         ebx,eax
>0001536A    jmp         0001536D
 0001536C    dec         ebx
 0001536D    cmp         byte ptr [ebx],2E
>00015370    je          0001537C
 00015372    lea         eax,[ebp-11D]
 00015378    cmp         ebx,eax
>0001537A    jne         0001536C
 0001537C    lea         eax,[ebp-11D]
 00015382    cmp         ebx,eax
>00015384    je          000153F3
 00015386    inc         ebx
 00015387    cmp         byte ptr [ebp-12],0
>0001538B    je          000153A9
 0001538D    lea         eax,[ebp-12]
 00015390    push        eax
 00015391    push        ebx
 00015392    call        kernel32.lstrcpyA
 00015397    push        2
 00015399    push        0
 0001539B    lea         eax,[ebp-11D]
 000153A1    push        eax
 000153A2    call        kernel32.LoadLibraryExA
 000153A7    mov         esi,eax
 000153A9    test        esi,esi
>000153AB    jne         000153F3
 000153AD    cmp         byte ptr [ebp-0D],0
>000153B1    je          000153F3
 000153B3    lea         eax,[ebp-0D]
 000153B6    push        eax
 000153B7    push        ebx
 000153B8    call        kernel32.lstrcpyA
 000153BD    push        2
 000153BF    push        0
 000153C1    lea         eax,[ebp-11D]
 000153C7    push        eax
 000153C8    call        kernel32.LoadLibraryExA
 000153CD    mov         esi,eax
 000153CF    test        esi,esi
>000153D1    jne         000153F3
 000153D3    mov         byte ptr [ebp-0B],0
 000153D7    lea         eax,[ebp-0D]
 000153DA    push        eax
 000153DB    push        ebx
 000153DC    call        kernel32.lstrcpyA
 000153E1    push        2
 000153E3    push        0
 000153E5    lea         eax,[ebp-11D]
 000153EB    push        eax
 000153EC    call        kernel32.LoadLibraryExA
 000153F1    mov         esi,eax
 000153F3    mov         eax,esi
 000153F5    pop         esi
 000153F6    pop         ebx
 000153F7    mov         esp,ebp
 000153F9    pop         ebp
 000153FA    ret
*}
end;

//0001543C
procedure EnumResourceModules(Func:TEnumModuleFunc; Data:Pointer);
begin
{*
 0001543C    push        ebx
 0001543D    push        esi
 0001543E    push        edi
 0001543F    mov         edi,edx
 00015441    mov         esi,eax
 00015443    mov         ebx,dword ptr ds:[0B4014]
 00015449    test        ebx,ebx
>0001544B    je          0001545E
 0001544D    mov         edx,edi
 0001544F    mov         eax,dword ptr [ebx+10]
 00015452    call        esi
 00015454    test        al,al
>00015456    je          0001545E
 00015458    mov         ebx,dword ptr [ebx]
 0001545A    test        ebx,ebx
>0001545C    jne         0001544D
 0001545E    pop         edi
 0001545F    pop         esi
 00015460    pop         ebx
 00015461    ret
*}
end;

//00015464
procedure AddModuleUnloadProc(Proc:TModuleUnloadProc);
begin
{*
 00015464    push        ebx
 00015465    mov         ebx,eax
 00015467    mov         eax,8
 0001546C    call        @GetMem
 00015471    mov         edx,dword ptr ds:[0B4018]
 00015477    mov         dword ptr [eax],edx
 00015479    mov         dword ptr [eax+4],ebx
 0001547C    mov         [000B4018],eax
 00015481    pop         ebx
 00015482    ret
*}
end;

//00015484
procedure RemoveModuleUnloadProc(Proc:TModuleUnloadProc);
begin
{*
 00015484    push        ebx
 00015485    push        esi
 00015486    mov         esi,dword ptr ds:[0B4018]
 0001548C    test        esi,esi
>0001548E    je          000154B2
 00015490    mov         edx,dword ptr [esi+4]
 00015493    cmp         edx,eax
>00015495    jne         000154B2
 00015497    mov         eax,[000B4018]
 0001549C    mov         eax,dword ptr [eax]
 0001549E    mov         [000B4018],eax
 000154A3    mov         edx,8
 000154A8    mov         eax,esi
 000154AA    call        @FreeMem
 000154AF    pop         esi
 000154B0    pop         ebx
 000154B1    ret
 000154B2    mov         edx,esi
 000154B4    test        edx,edx
>000154B6    je          000154DF
 000154B8    mov         ecx,dword ptr [edx]
 000154BA    test        ecx,ecx
>000154BC    je          000154D9
 000154BE    mov         ebx,dword ptr [ecx+4]
 000154C1    cmp         ebx,eax
>000154C3    jne         000154D9
 000154C5    mov         esi,ecx
 000154C7    mov         eax,dword ptr [ecx]
 000154C9    mov         dword ptr [edx],eax
 000154CB    mov         edx,8
 000154D0    mov         eax,esi
 000154D2    call        @FreeMem
>000154D7    jmp         000154DF
 000154D9    mov         edx,dword ptr [edx]
 000154DB    test        edx,edx
>000154DD    jne         000154B8
 000154DF    pop         esi
 000154E0    pop         ebx
 000154E1    ret
*}
end;

//000154E4
procedure NotifyModuleUnload(HInstance:Integer);
begin
{*
 000154E4    push        ebp
 000154E5    mov         ebp,esp
 000154E7    add         esp,0FFFFFFF8
 000154EA    push        ebx
 000154EB    push        esi
 000154EC    push        edi
 000154ED    mov         dword ptr [ebp-4],eax
 000154F0    mov         eax,[000B4018]
 000154F5    mov         dword ptr [ebp-8],eax
 000154F8    cmp         dword ptr [ebp-8],0
>000154FC    je          00015537
 000154FE    xor         eax,eax
 00015500    push        ebp
 00015501    push        1551F
 00015506    push        dword ptr fs:[eax]
 00015509    mov         dword ptr fs:[eax],esp
 0001550C    mov         ebx,dword ptr [ebp-8]
 0001550F    mov         eax,dword ptr [ebp-4]
 00015512    call        dword ptr [ebx+4]
 00015515    xor         eax,eax
 00015517    pop         edx
 00015518    pop         ecx
 00015519    pop         ecx
 0001551A    mov         dword ptr fs:[eax],edx
>0001551D    jmp         00015529
>0001551F    jmp         @HandleAnyException
 00015524    call        @DoneExcept
 00015529    mov         eax,dword ptr [ebp-8]
 0001552C    mov         eax,dword ptr [eax]
 0001552E    mov         dword ptr [ebp-8],eax
 00015531    cmp         dword ptr [ebp-8],0
>00015535    jne         000154FE
 00015537    pop         edi
 00015538    pop         esi
 00015539    pop         ebx
 0001553A    pop         ecx
 0001553B    pop         ecx
 0001553C    pop         ebp
 0001553D    ret
*}
end;

//00015540
procedure RegisterModule(LibModule:PLibModule);
begin
{*
 00015540    mov         edx,dword ptr ds:[0B4014]
 00015546    mov         dword ptr [eax],edx
 00015548    mov         [000B4014],eax
 0001554D    ret
*}
end;

//00015550
procedure UnregisterModule(LibModule:PLibModule);
begin
{*
 00015550    push        ebp
 00015551    mov         ebp,esp
 00015553    push        ecx
 00015554    mov         dword ptr [ebp-4],eax
 00015557    xor         edx,edx
 00015559    push        ebp
 0001555A    push        155B4
 0001555F    push        dword ptr fs:[edx]
 00015562    mov         dword ptr fs:[edx],esp
 00015565    mov         eax,dword ptr [ebp-4]
 00015568    mov         eax,dword ptr [eax+4]
 0001556B    call        NotifyModuleUnload
 00015570    xor         eax,eax
 00015572    pop         edx
 00015573    pop         ecx
 00015574    pop         ecx
 00015575    mov         dword ptr fs:[eax],edx
 00015578    push        155BB
 0001557D    mov         eax,dword ptr [ebp-4]
 00015580    cmp         eax,dword ptr ds:[0B4014]
>00015586    jne         00015594
 00015588    mov         eax,dword ptr [ebp-4]
 0001558B    mov         eax,dword ptr [eax]
 0001558D    mov         [000B4014],eax
>00015592    jmp         000155B3
 00015594    mov         eax,[000B4014]
 00015599    test        eax,eax
>0001559B    je          000155B3
 0001559D    mov         edx,dword ptr [eax]
 0001559F    cmp         edx,dword ptr [ebp-4]
>000155A2    jne         000155AD
 000155A4    mov         edx,dword ptr [ebp-4]
 000155A7    mov         edx,dword ptr [edx]
 000155A9    mov         dword ptr [eax],edx
>000155AB    jmp         000155B3
 000155AD    mov         eax,dword ptr [eax]
 000155AF    test        eax,eax
>000155B1    jne         0001559D
 000155B3    ret
>000155B4    jmp         @HandleFinally
>000155B9    jmp         0001557D
 000155BB    pop         ecx
 000155BC    pop         ebp
 000155BD    ret
*}
end;

//000155C0
function LoadResString(ResStringRec:PResStringRec):String;
begin
{*
 000155C0    push        ebx
 000155C1    push        esi
 000155C2    add         esp,0FFFFFC00
 000155C8    mov         esi,edx
 000155CA    mov         ebx,eax
 000155CC    test        ebx,ebx
>000155CE    je          0001560D
 000155D0    cmp         dword ptr [ebx+4],10000
>000155D7    jge         00015603
 000155D9    push        400
 000155DE    lea         eax,[esp+4]
 000155E2    push        eax
 000155E3    mov         eax,dword ptr [ebx+4]
 000155E6    push        eax
 000155E7    mov         eax,dword ptr [ebx]
 000155E9    mov         eax,dword ptr [eax]
 000155EB    call        FindResourceHInstance
 000155F0    push        eax
 000155F1    call        user32.LoadStringA
 000155F6    mov         ecx,eax
 000155F8    mov         edx,esp
 000155FA    mov         eax,esi
 000155FC    call        @LStrFromPCharLen
>00015601    jmp         0001560D
 00015603    mov         eax,esi
 00015605    mov         edx,dword ptr [ebx+4]
 00015608    call        @LStrFromPChar
 0001560D    add         esp,400
 00015613    pop         esi
 00015614    pop         ebx
 00015615    ret
*}
end;

//00015618
procedure @IntfClear(var Dest:IUnknown);
begin
{*
 00015618    mov         edx,dword ptr [eax]
 0001561A    test        edx,edx
>0001561C    je          0001562C
 0001561E    mov         dword ptr [eax],0
 00015624    push        eax
 00015625    push        edx
 00015626    mov         eax,dword ptr [edx]
 00015628    call        dword ptr [eax+8]
 0001562B    pop         eax
 0001562C    ret
*}
end;

//00015630
procedure @IntfCopy(var Dest:IUnknown; const Source:IUnknown);
begin
{*
 00015630    mov         ecx,dword ptr [eax]
 00015632    mov         dword ptr [eax],edx
 00015634    test        edx,edx
>00015636    je          00015640
 00015638    push        ecx
 00015639    push        edx
 0001563A    mov         eax,dword ptr [edx]
 0001563C    call        dword ptr [eax+4]
 0001563F    pop         ecx
 00015640    test        ecx,ecx
>00015642    je          0001564A
 00015644    push        ecx
 00015645    mov         eax,dword ptr [ecx]
 00015647    call        dword ptr [eax+8]
 0001564A    ret
*}
end;

//0001564C
procedure @IntfAddRef(const Dest:IUnknown);
begin
{*
 0001564C    test        eax,eax
>0001564E    je          00015656
 00015650    push        eax
 00015651    mov         eax,dword ptr [eax]
 00015653    call        dword ptr [eax+4]
 00015656    ret
*}
end;

//00015658
procedure TInterfacedObject.BeforeDestruction;
begin
{*
 00015658    cmp         dword ptr [eax+4],0
>0001565C    je          00015665
 0001565E    mov         al,2
 00015660    call        Error
 00015665    ret
*}
end;

//00015668
function TInterfacedObject.QueryInterface(const IID:TGUID; var Obj:Pointer):HRESULT; stdcall;
begin
{*
 00015668    push        ebp
 00015669    mov         ebp,esp
 0001566B    push        ebx
 0001566C    mov         ebx,dword ptr [ebp+8]
 0001566F    mov         ecx,dword ptr [ebp+10]
 00015672    mov         edx,dword ptr [ebp+0C]
 00015675    mov         eax,ebx
 00015677    call        TObject.GetInterface
 0001567C    test        al,al
>0001567E    je          00015684
 00015680    xor         eax,eax
>00015682    jmp         00015689
 00015684    mov         eax,80004002
 00015689    pop         ebx
 0001568A    pop         ebp
 0001568B    ret         0C
*}
end;

//00015690
function TInterfacedObject._AddRef:Integer; stdcall;
begin
{*
 00015690    push        ebp
 00015691    mov         ebp,esp
 00015693    mov         eax,dword ptr [ebp+8]
 00015696    add         eax,4
 00015699    push        eax
 0001569A    call        kernel32.InterlockedIncrement
 0001569F    pop         ebp
 000156A0    ret         4
*}
end;

//000156A4
function TInterfacedObject._Release:Integer; stdcall;
begin
{*
 000156A4    push        ebp
 000156A5    mov         ebp,esp
 000156A7    push        ebx
 000156A8    push        esi
 000156A9    mov         ebx,dword ptr [ebp+8]
 000156AC    lea         eax,[ebx+4]
 000156AF    push        eax
 000156B0    call        kernel32.InterlockedDecrement
 000156B5    mov         esi,eax
 000156B7    test        esi,esi
>000156B9    jne         000156C4
 000156BB    mov         dl,1
 000156BD    mov         eax,ebx
 000156BF    mov         ecx,dword ptr [eax]
 000156C1    call        dword ptr [ecx-4]
 000156C4    mov         eax,esi
 000156C6    pop         esi
 000156C7    pop         ebx
 000156C8    pop         ebp
 000156C9    ret         4
*}
end;

//000156CC
function kernel32.GetCurrentThreadId:Longword;
begin
{*
 000156CC    jmp         dword ptr ds:[0B817C]
*}
end;

//000156D4
procedure _DF_;
begin
{*
 000156D4    xor         edx,edx
 000156D6    mov         dword ptr [eax+10],edx
 000156D9    mov         dword ptr [eax+0C],edx
 000156DC    push        edx
 000156DD    lea         edx,[eax+10]
 000156E0    push        edx
 000156E1    push        dword ptr [eax+8]
 000156E4    push        dword ptr [eax+14]
 000156E7    push        dword ptr [eax]
 000156E9    call        kernel32.ReadFile
 000156EE    test        eax,eax
>000156F0    je          000156F5
 000156F2    xor         eax,eax
 000156F4    ret
 000156F5    call        kernel32.GetLastError
 000156FA    cmp         eax,6D
>000156FD    je          000156F2
 000156FF    ret
*}
end;

//000158D6
function @Assign(var F:TFileRec; S:AnsiString):Integer;
begin
{*
 000158D6    lea         ecx,[eax+14C]
 000158DC    mov         dword ptr [eax+14],ecx
 000158DF    xor         ecx,ecx
 000158E1    mov         dword ptr [eax],ecx
 000158E3    mov         dword ptr [eax+4],0D7B0
 000158EA    mov         dword ptr [eax+8],80
 000158F1    mov         dword ptr [eax+0C],ecx
 000158F4    mov         dword ptr [eax+10],ecx
 000158F7    mov         dword ptr [eax+18],15748
 000158FE    mov         dword ptr [eax+1C],ecx
 00015901    mov         dword ptr [eax+20],ecx
 00015904    mov         dword ptr [eax+24],ecx
 00015907    lea         eax,[eax+48]
 0001590A    test        edx,edx
>0001590C    je          00015929
 0001590E    mov         ch,82
 00015910    mov         cl,byte ptr [edx]
 00015912    inc         edx
 00015913    mov         byte ptr [eax],cl
 00015915    inc         eax
 00015916    test        cl,cl
>00015918    je          0001592B
 0001591A    mov         cl,byte ptr [edx]
 0001591C    inc         edx
 0001591D    mov         byte ptr [eax],cl
 0001591F    inc         eax
 00015920    test        cl,cl
>00015922    je          0001592B
 00015924    dec         ch
>00015926    jne         00015910
 00015928    dec         eax
 00015929    mov         byte ptr [eax],ch
 0001592B    ret
*}
end;

//0001592C
procedure @_Flush(var F:Text);
begin
{*
 0001592C    mov         edx,dword ptr [eax+4]
 0001592F    cmp         edx,0D7B2
>00015935    jne         0001593F
 00015937    call        dword ptr [eax+1C]
 0001593A    test        eax,eax
>0001593C    jne         0001594C
 0001593E    ret
 0001593F    cmp         edx,0D7B1
>00015945    je          0001593E
 00015947    mov         eax,67
>0001594C    jmp         SetInOutRes
*}
end;

//00015951
procedure @Flush(var F:TFileRec);
begin
{*
 00015951    mov         edx,dword ptr [eax+4]
 00015954    cmp         edx,0D7B2
>0001595A    jne         00015964
 0001595C    call        dword ptr [eax+20]
 0001595F    test        eax,eax
>00015961    jne         00015971
 00015963    ret
 00015964    cmp         edx,0D7B1
>0001596A    je          00015963
 0001596C    mov         eax,67
>00015971    jmp         SetInOutRes
*}
end;

//00015978
function @BlockWrite(var F:TFileRec; buffer:Pointer; recCnt:Longint; var recsWritten:Longint):Longint;
begin
{*
 00015978    push        ebx
 00015979    push        esi
 0001597A    mov         ebx,eax
 0001597C    mov         esi,edx
 0001597E    mov         eax,dword ptr [eax+4]
 00015981    sub         eax,0D7B2
 00015986    cmp         eax,1
>00015989    ja          000159D3
 0001598B    push        ecx
 0001598C    push        0
 0001598E    mov         eax,esp
 00015990    push        0
 00015992    push        eax
 00015993    mov         eax,dword ptr [ebx+8]
 00015996    mul         eax,ecx
 00015998    push        eax
 00015999    push        esi
 0001599A    push        dword ptr [ebx]
 0001599C    call        kernel32.WriteFile
 000159A1    dec         eax
 000159A2    pop         eax
 000159A3    pop         ecx
>000159A4    jne         000159C5
 000159A6    xor         edx,edx
 000159A8    div         eax,dword ptr [ebx+8]
 000159AB    mov         edx,dword ptr [esp+0C]
 000159AF    test        edx,edx
>000159B1    je          000159BA
 000159B3    mov         dword ptr [edx],eax
 000159B5    pop         esi
 000159B6    pop         ebx
 000159B7    ret         4
 000159BA    cmp         eax,ecx
>000159BC    je          000159B5
 000159BE    mov         eax,65
>000159C3    jmp         000159CA
 000159C5    call        kernel32.GetLastError
 000159CA    call        SetInOutRes
 000159CF    xor         eax,eax
>000159D1    jmp         000159B5
 000159D3    mov         eax,67
>000159D8    jmp         000159CA
 000159DA    mov         eax,eax
 000159DC    push        ebx
 000159DD    mov         ebx,eax
 000159DF    mov         edx,dword ptr [eax+4]
 000159E2    sub         edx,0D7B1
>000159E8    je          000159F8
 000159EA    cmp         edx,2
>000159ED    ja          00015A08
 000159EF    call        dword ptr [eax+1C]
 000159F2    test        eax,eax
>000159F4    jne         00015A01
 000159F6    mov         eax,ebx
 000159F8    call        dword ptr [ebx+24]
 000159FB    test        eax,eax
>000159FD    jne         00015A01
 000159FF    pop         ebx
 00015A00    ret
 00015A01    call        SetInOutRes
>00015A06    jmp         000159FF
 00015A08    cmp         eax,0B6050;gvar_000B6050:TFileRec
>00015A0D    je          000159FF
 00015A0F    mov         eax,67
>00015A14    jmp         00015A01
 00015A16    mov         eax,eax
 00015A18    cmp         dword ptr [eax+4],0D7B1
>00015A1F    jne         00015A39
 00015A21    mov         edx,dword ptr [eax+0C]
 00015A24    cmp         edx,dword ptr [eax+10]
>00015A27    jae         00015A39
 00015A29    add         edx,dword ptr [eax+14]
 00015A2C    mov         al,0
 00015A2E    mov         cl,byte ptr [edx]
 00015A30    cmp         cl,1A
>00015A33    je          00015A36
 00015A35    ret
 00015A36    mov         al,1
 00015A38    ret
 00015A39    push        eax
 00015A3A    call        @ReadChar
 00015A3F    pop         edx
 00015A40    cmp         al,1A
>00015A42    je          00015A36
 00015A44    dec         dword ptr [edx+0C]
 00015A47    mov         al,0
 00015A49    ret
*}
end;

//000159DC
procedure @Close(var F:TFileRec);
begin
{*
 000159DC    push        ebx
 000159DD    mov         ebx,eax
 000159DF    mov         edx,dword ptr [eax+4]
 000159E2    sub         edx,0D7B1
>000159E8    je          000159F8
 000159EA    cmp         edx,2
>000159ED    ja          00015A08
 000159EF    call        dword ptr [eax+1C]
 000159F2    test        eax,eax
>000159F4    jne         00015A01
 000159F6    mov         eax,ebx
 000159F8    call        dword ptr [ebx+24]
 000159FB    test        eax,eax
>000159FD    jne         00015A01
 000159FF    pop         ebx
 00015A00    ret
 00015A01    call        SetInOutRes
>00015A06    jmp         000159FF
 00015A08    cmp         eax,0B6050;gvar_000B6050:TFileRec
>00015A0D    je          000159FF
 00015A0F    mov         eax,67
>00015A14    jmp         00015A01
 00015A16    mov         eax,eax
 00015A18    cmp         dword ptr [eax+4],0D7B1
>00015A1F    jne         00015A39
 00015A21    mov         edx,dword ptr [eax+0C]
 00015A24    cmp         edx,dword ptr [eax+10]
>00015A27    jae         00015A39
 00015A29    add         edx,dword ptr [eax+14]
 00015A2C    mov         al,0
 00015A2E    mov         cl,byte ptr [edx]
 00015A30    cmp         cl,1A
>00015A33    je          00015A36
 00015A35    ret
 00015A36    mov         al,1
 00015A38    ret
 00015A39    push        eax
 00015A3A    call        @ReadChar
 00015A3F    pop         edx
 00015A40    cmp         al,1A
>00015A42    je          00015A36
 00015A44    dec         dword ptr [edx+0C]
 00015A47    mov         al,0
 00015A49    ret
*}
end;

//00015A18
function @EofText(var T:TTextRec):Boolean;
begin
{*
 00015A18    cmp         dword ptr [eax+4],0D7B1
>00015A1F    jne         00015A39
 00015A21    mov         edx,dword ptr [eax+0C]
 00015A24    cmp         edx,dword ptr [eax+10]
>00015A27    jae         00015A39
 00015A29    add         edx,dword ptr [eax+14]
 00015A2C    mov         al,0
 00015A2E    mov         cl,byte ptr [edx]
 00015A30    cmp         cl,1A
>00015A33    je          00015A36
 00015A35    ret
 00015A36    mov         al,1
 00015A38    ret
 00015A39    push        eax
 00015A3A    call        @ReadChar
 00015A3F    pop         edx
 00015A40    cmp         al,1A
>00015A42    je          00015A36
 00015A44    dec         dword ptr [edx+0C]
 00015A47    mov         al,0
 00015A49    ret
*}
end;

//00015A4C
function @ReadChar(var T:TTextRec):Char;
begin
{*
 00015A4C    cmp         dword ptr [eax+4],0D7B1
>00015A53    jne         00015A6F
 00015A55    mov         edx,dword ptr [eax+0C]
 00015A58    cmp         edx,dword ptr [eax+10]
>00015A5B    jae         00015A98
 00015A5D    mov         ecx,dword ptr [eax+14]
 00015A60    mov         cl,byte ptr [ecx+edx]
 00015A63    cmp         cl,1A
>00015A66    je          00015A6C
 00015A68    inc         edx
 00015A69    mov         dword ptr [eax+0C],edx
 00015A6C    mov         al,cl
 00015A6E    ret
 00015A6F    cmp         eax,0B6050;gvar_000B6050:TFileRec
>00015A74    je          00015A83
 00015A76    mov         eax,68
 00015A7B    call        SetInOutRes
 00015A80    mov         al,1A
 00015A82    ret
 00015A83    call        @ResetText
 00015A88    mov         eax,0B6050;gvar_000B6050:TFileRec
 00015A8D    cmp         dword ptr [eax+4],0D7B1
>00015A94    je          00015A55
>00015A96    jmp         00015A76
 00015A98    push        eax
 00015A99    call        dword ptr [eax+1C]
 00015A9C    test        eax,eax
>00015A9E    jne         00015AB6
 00015AA0    pop         eax
 00015AA1    mov         edx,dword ptr [eax+0C]
 00015AA4    cmp         edx,dword ptr [eax+10]
>00015AA7    jb          00015A5D
 00015AA9    mov         ecx,dword ptr [eax+14]
 00015AAC    mov         byte ptr [ecx+edx],1A
 00015AB0    inc         dword ptr [eax+10]
 00015AB3    mov         al,1A
 00015AB5    ret
 00015AB6    call        SetInOutRes
 00015ABB    pop         eax
 00015ABC    mov         al,1A
 00015ABE    ret
*}
end;

//00015AC0
procedure @ReadString(var T:TTextRec; S:PShortString; MaxLen:Longint);
begin
{*
 00015AC0    push        edx
 00015AC1    inc         edx
 00015AC2    call        00015AD7
 00015AC7    pop         edx
 00015AC8    mov         byte ptr [edx],cl
 00015ACA    ret
*}
end;

//00015ACB
procedure @ReadCString(var T:TTextRec; S:PAnsiChar; MaxLen:Longint);
begin
{*
 00015ACB    push        edx
 00015ACC    call        00015AD7
 00015AD1    pop         edx
 00015AD2    mov         byte ptr [edx+ecx],0
 00015AD6    ret
*}
end;

//00015AD7
{*procedure sub_00015AD7(?:?; ?:?; ?:?);
begin
 00015AD7    push        ebx
 00015AD8    push        esi
 00015AD9    push        edi
 00015ADA    push        ecx
 00015ADB    mov         ebx,eax
 00015ADD    mov         esi,ecx
 00015ADF    mov         edi,edx
 00015AE1    cmp         dword ptr [ebx+4],0D7B1
>00015AE8    jne         00015B32
 00015AEA    test        esi,esi
>00015AEC    jle         00015B14
 00015AEE    mov         edx,dword ptr [ebx+0C]
 00015AF1    mov         ecx,dword ptr [ebx+10]
 00015AF4    sub         ecx,edx
 00015AF6    add         edx,dword ptr [ebx+14]
 00015AF9    dec         ecx
>00015AFA    jl          00015B1B
 00015AFC    mov         al,byte ptr [edx]
 00015AFE    inc         edx
 00015AFF    cmp         al,1A
>00015B01    je          00015B14
 00015B03    cmp         al,0D
>00015B05    je          00015B0D
 00015B07    stos        byte ptr [edi]
 00015B08    dec         esi
>00015B09    jg          00015AF9
>00015B0B    jmp         00015B0E
 00015B0D    dec         edx
 00015B0E    sub         edx,dword ptr [ebx+14]
 00015B11    mov         dword ptr [ebx+0C],edx
 00015B14    pop         ecx
 00015B15    sub         ecx,esi
 00015B17    pop         edi
 00015B18    pop         esi
 00015B19    pop         ebx
 00015B1A    ret
 00015B1B    mov         dword ptr [ebx+0C],edx
 00015B1E    mov         eax,ebx
 00015B20    call        @ReadChar
 00015B25    mov         edx,dword ptr [ebx+0C]
 00015B28    mov         ecx,dword ptr [ebx+10]
 00015B2B    sub         ecx,edx
 00015B2D    add         edx,dword ptr [ebx+14]
>00015B30    jmp         00015AFF
 00015B32    cmp         eax,0B6050;gvar_000B6050:TFileRec
>00015B37    je          00015B45
 00015B39    mov         eax,68
 00015B3E    call        SetInOutRes
>00015B43    jmp         00015B14
 00015B45    call        @ResetText
 00015B4A    cmp         dword ptr [ebx+4],0D7B1
>00015B51    je          00015AEA
>00015B53    jmp         00015B39
 00015B55    lea         eax,[eax]
 00015B58    push        ebx
 00015B59    mov         ebx,eax
 00015B5B    mov         eax,ebx
 00015B5D    call        @ReadChar
 00015B62    cmp         al,1A
>00015B64    je          00015B7E
 00015B66    cmp         al,0D
>00015B68    jne         00015B5B
 00015B6A    mov         eax,ebx
 00015B6C    call        @ReadChar
 00015B71    cmp         al,0A
>00015B73    je          00015B7C
 00015B75    cmp         al,1A
>00015B77    je          00015B7E
 00015B79    dec         dword ptr [ebx+0C]
 00015B7C    pop         ebx
 00015B7D    ret
 00015B7E    pop         ebx
 00015B7F    ret
end;*}

//00015B58
procedure @ReadLn(var T:TTextRec);
begin
{*
 00015B58    push        ebx
 00015B59    mov         ebx,eax
 00015B5B    mov         eax,ebx
 00015B5D    call        @ReadChar
 00015B62    cmp         al,1A
>00015B64    je          00015B7E
 00015B66    cmp         al,0D
>00015B68    jne         00015B5B
 00015B6A    mov         eax,ebx
 00015B6C    call        @ReadChar
 00015B71    cmp         al,0A
>00015B73    je          00015B7C
 00015B75    cmp         al,1A
>00015B77    je          00015B7E
 00015B79    dec         dword ptr [ebx+0C]
 00015B7C    pop         ebx
 00015B7D    ret
 00015B7E    pop         ebx
 00015B7F    ret
*}
end;

//00015B80
procedure _DF_;
begin
{*
 00015B80    push        ebx
 00015B81    push        esi
 00015B82    mov         esi,eax
 00015B84    mov         ebx,edx
 00015B86    mov         edx,dword ptr [esi+4]
 00015B89    sub         edx,0D7B0
>00015B8F    je          00015B9B
 00015B91    cmp         edx,3
>00015B94    ja          00015BAF
 00015B96    call        @Close
 00015B9B    mov         eax,esi
 00015B9D    mov         dword ptr [esi+4],ebx
 00015BA0    call        dword ptr [esi+18]
 00015BA3    test        eax,eax
>00015BA5    je          00015BAC
 00015BA7    call        SetInOutRes
 00015BAC    pop         esi
 00015BAD    pop         ebx
 00015BAE    ret
 00015BAF    mov         eax,66
 00015BB4    call        SetInOutRes
>00015BB9    jmp         00015BAC
*}
end;

//00015BBB
function @ResetText(var T:TTextRec):Integer;
begin
{*
 00015BBB    mov         edx,0D7B1
>00015BC0    jmp         _DF_
*}
end;

//00015BC2
function @RewritText(var T:TTextRec):Integer;
begin
{*
 00015BC2    mov         edx,0D7B2
>00015BC7    jmp         _DF_
*}
end;

//00015BD0
procedure _DF_;
begin
{*
 00015BD0    push        ebx
 00015BD1    push        esi
 00015BD2    push        edi
 00015BD3    mov         ebx,eax
 00015BD5    mov         esi,edx
 00015BD7    mov         edi,ecx
 00015BD9    mov         edx,dword ptr [ebx+4]
 00015BDC    sub         edx,0D7B0
>00015BE2    je          00015BF9
 00015BE4    cmp         edx,3
>00015BE7    ja          00015C97
 00015BED    call        dword ptr [ebx+24]
 00015BF0    test        eax,eax
>00015BF2    je          00015BF9
 00015BF4    call        SetInOutRes
 00015BF9    mov         dword ptr [ebx+4],0D7B3
 00015C00    mov         dword ptr [ebx+8],esi
 00015C03    mov         dword ptr [ebx+24],15CF2
 00015C0A    mov         dword ptr [ebx+1C],15C7B
 00015C11    cmp         byte ptr [ebx+48],0
>00015C15    je          00015C7E
 00015C17    mov         eax,0C0000000
 00015C1C    mov         dl,byte ptr ds:[0B604A];gvar_000B604A
 00015C22    and         edx,70
 00015C25    shr         edx,2
 00015C28    mov         edx,dword ptr [edx+15CB1]
 00015C2E    mov         ecx,2
 00015C33    sub         edi,3
>00015C36    je          00015C5B
 00015C38    mov         ecx,3
 00015C3D    inc         edi
>00015C3E    je          00015C5B
 00015C40    mov         eax,40000000
 00015C45    inc         edi
 00015C46    mov         dword ptr [ebx+4],0D7B2
>00015C4D    je          00015C5B
 00015C4F    mov         eax,80000000
 00015C54    mov         dword ptr [ebx+4],0D7B1
 00015C5B    push        0
 00015C5D    push        80
 00015C62    push        ecx
 00015C63    push        0
 00015C65    push        edx
 00015C66    push        eax
 00015C67    lea         eax,[ebx+48]
 00015C6A    push        eax
 00015C6B    call        kernel32.CreateFileA
 00015C70    cmp         eax,0FFFFFFFF
>00015C73    je          00015C9E
 00015C75    mov         dword ptr [ebx],eax
 00015C77    pop         edi
 00015C78    pop         esi
 00015C79    pop         ebx
 00015C7A    ret
 00015C7B    xor         eax,eax
 00015C7D    ret
 00015C7E    mov         dword ptr [ebx+24],15C7B
 00015C85    cmp         edi,3
>00015C88    je          00015C8E
 00015C8A    push        0F6
>00015C8C    jmp         00015C90
 00015C8E    push        0F5
 00015C90    call        kernel32.GetStdHandle
>00015C95    jmp         00015C70
 00015C97    mov         eax,66
>00015C9C    jmp         00015CAA
 00015C9E    mov         dword ptr [ebx+4],0D7B0
 00015CA5    call        kernel32.GetLastError
 00015CAA    call        SetInOutRes
>00015CAF    jmp         00015C77
 00015CB1    add         eax,dword ptr [eax]
 00015CB3    add         byte ptr [eax],al
 00015CB5    add         byte ptr [eax],al
 00015CB7    add         byte ptr [eax],al
 00015CB9    add         dword ptr [eax],eax
 00015CBB    add         byte ptr [eax],al
 00015CBD    add         al,byte ptr [eax]
 00015CBF    add         byte ptr [eax],al
 00015CC1    add         eax,dword ptr [eax]
 00015CC3    add         byte ptr [eax],al
 00015CC5    add         byte ptr [eax],al
 00015CC7    add         byte ptr [eax],al
 00015CC9    add         byte ptr [eax],al
 00015CCB    add         byte ptr [eax],al
 00015CCD    add         byte ptr [eax],al
 00015CCF    add         byte ptr [eax],al
*}
end;

//00015CD1
function @ResetFile(var F:TFileRec; RecSize:Longint):Integer;
begin
{*
 00015CD1    xor         ecx,ecx
 00015CD3    mov         cl,byte ptr ds:[0B604A];gvar_000B604A
 00015CD9    and         cl,3
 00015CDC    cmp         cl,2
>00015CDF    jbe         00015CE3
 00015CE1    mov         cl,2
>00015CE3    jmp         _DF_
*}
end;

//00015CE8
function @RewritFile(var F:TFileRec; RecSize:Longint):Integer;
begin
{*
 00015CE8    mov         ecx,3
>00015CED    jmp         _DF_
 00015CF2    push        dword ptr [eax]
 00015CF4    mov         dword ptr [eax+4],0D7B0
 00015CFB    call        kernel32.CloseHandle
 00015D00    dec         eax
>00015D01    jne         000127F4
 00015D07    ret
*}
end;

//00015D08
procedure @WriteBytes;
begin
{*
 00015D08    push        esi
 00015D09    push        edi
 00015D0A    mov         esi,edx
 00015D0C    cmp         dword ptr [eax+4],0D7B2
>00015D13    jne         00015D43
 00015D15    mov         edi,dword ptr [eax+14]
 00015D18    add         edi,dword ptr [eax+0C]
 00015D1B    mov         edx,dword ptr [eax+8]
 00015D1E    sub         edx,dword ptr [eax+0C]
 00015D21    cmp         edx,ecx
>00015D23    jg          00015D3B
 00015D25    add         dword ptr [eax+0C],edx
 00015D28    sub         ecx,edx
 00015D2A    push        eax
 00015D2B    push        ecx
 00015D2C    mov         ecx,edx
 00015D2E    rep movs    byte ptr [edi],byte ptr [esi]
 00015D30    call        dword ptr [eax+1C]
 00015D33    test        eax,eax
>00015D35    jne         00015D6A
 00015D37    pop         ecx
 00015D38    pop         eax
>00015D39    jmp         00015D15
 00015D3B    add         dword ptr [eax+0C],ecx
 00015D3E    rep movs    byte ptr [edi],byte ptr [esi]
 00015D40    pop         edi
 00015D41    pop         esi
 00015D42    ret
 00015D43    cmp         eax,0B621C;gvar_000B621C:TFileRec
>00015D48    jne         00015D5E
 00015D4A    push        ecx
 00015D4B    push        edx
 00015D4C    push        eax
 00015D4D    call        @RewritText
 00015D52    pop         eax
 00015D53    pop         edx
 00015D54    pop         ecx
 00015D55    cmp         dword ptr [eax+4],0D7B2
>00015D5C    je          00015D15
 00015D5E    mov         eax,69
 00015D63    call        SetInOutRes
>00015D68    jmp         00015D40
 00015D6A    call        SetInOutRes
 00015D6F    pop         ecx
 00015D70    pop         eax
>00015D71    jmp         00015D40
 00015D73    mov         ecx,edx
 00015D75    mov         edx,0B40BC
 00015D7A    cmp         ecx,40
>00015D7D    jle         00015DA0
 00015D7F    sub         ecx,40
 00015D82    push        eax
 00015D83    push        ecx
 00015D84    mov         ecx,40
 00015D89    call        @WriteBytes
 00015D8E    call        @GetTls
 00015D93    cmp         dword ptr [eax+4],0;{InOutRes:Integer}
>00015D9A    jne         00015DA9
 00015D9C    pop         ecx
 00015D9D    pop         eax
>00015D9E    jmp         00015D75
 00015DA0    test        ecx,ecx
>00015DA2    jg          00015D08
 00015DA8    ret
 00015DA9    pop         ecx
 00015DAA    pop         eax
 00015DAB    ret
*}
end;

//00015D73
procedure @WriteSpaces;
begin
{*
 00015D73    mov         ecx,edx
 00015D75    mov         edx,0B40BC
 00015D7A    cmp         ecx,40
>00015D7D    jle         00015DA0
 00015D7F    sub         ecx,40
 00015D82    push        eax
 00015D83    push        ecx
 00015D84    mov         ecx,40
 00015D89    call        @WriteBytes
 00015D8E    call        @GetTls
 00015D93    cmp         dword ptr [eax+4],0;{InOutRes:Integer}
>00015D9A    jne         00015DA9
 00015D9C    pop         ecx
 00015D9D    pop         eax
>00015D9E    jmp         00015D75
 00015DA0    test        ecx,ecx
>00015DA2    jg          00015D08
 00015DA8    ret
 00015DA9    pop         ecx
 00015DAA    pop         eax
 00015DAB    ret
*}
end;

//00015DAC
procedure @Write0String(var T:TTextRec; S:ShortString);
begin
{*
 00015DAC    xor         ecx,ecx
 00015DAE    mov         cl,byte ptr [edx]
 00015DB0    inc         edx
>00015DB1    jmp         @WriteBytes
*}
end;

//00015DB6
procedure @WriteString(var T:TTextRec; S:ShortString; Width:Longint);
begin
{*
 00015DB6    push        ebx
 00015DB7    xor         ebx,ebx
 00015DB9    mov         bl,byte ptr [edx]
 00015DBB    sub         ecx,ebx
>00015DBD    jle         00015DCA
 00015DBF    push        eax
 00015DC0    push        edx
 00015DC1    mov         edx,ecx
 00015DC3    call        @WriteSpaces
 00015DC8    pop         edx
 00015DC9    pop         eax
 00015DCA    mov         ecx,ebx
 00015DCC    pop         ebx
 00015DCD    inc         edx
>00015DCE    jmp         @WriteBytes
*}
end;

//00015DD3
procedure @WriteLn(var T:TTextRec);
begin
{*
 00015DD3    mov         edx,0B40FC
 00015DD8    mov         ecx,2
 00015DDD    call        @WriteBytes
>00015DE2    jmp         @Flush
*}
end;

//00015DE7
procedure @Write0Char(var T:TTextRec; C:AnsiChar);
begin
{*
 00015DE7    cmp         dword ptr [eax+4],0D7B2
>00015DEE    jne         00015E0E
 00015DF0    mov         ecx,dword ptr [eax+0C]
 00015DF3    cmp         ecx,dword ptr [eax+8]
>00015DF6    jge         00015E01
 00015DF8    add         ecx,dword ptr [eax+14]
 00015DFB    mov         byte ptr [ecx],dl
 00015DFD    inc         dword ptr [eax+0C]
 00015E00    ret
 00015E01    push        eax
 00015E02    push        edx
 00015E03    call        dword ptr [eax+1C]
 00015E06    test        eax,eax
>00015E08    jne         00015E31
 00015E0A    pop         edx
 00015E0B    pop         eax
>00015E0C    jmp         00015DF0
 00015E0E    cmp         eax,0B621C;gvar_000B621C:TFileRec
>00015E13    jne         00015E27
 00015E15    push        edx
 00015E16    push        eax
 00015E17    call        @RewritText
 00015E1C    pop         eax
 00015E1D    pop         edx
 00015E1E    cmp         dword ptr [eax+4],0D7B2
>00015E25    je          00015DF0
 00015E27    mov         eax,69
>00015E2C    jmp         SetInOutRes
 00015E31    call        SetInOutRes
 00015E36    pop         edx
 00015E37    pop         eax
 00015E38    ret
*}
end;

//00015E39
procedure @WriteChar(var T:TTextRec; C:AnsiChar; Width:Integer);
begin
{*
 00015E39    push        edx
 00015E3A    lea         edx,[ecx-1]
 00015E3D    call        @WriteSpaces
 00015E42    mov         edx,esp
 00015E44    mov         ecx,1
 00015E49    call        @WriteBytes
 00015E4E    pop         edx
 00015E4F    ret
*}
end;

//00015E50
procedure @Write0CString(var T:TTextRec; S:PAnsiChar);
begin
{*
 00015E50    xor         ecx,ecx
>00015E52    jmp         @WriteCString
*}
end;

//00015E54
procedure @WriteCString(var T:TTextRec; S:PAnsiChar; Width:Longint);
begin
{*
 00015E54    push        esi
 00015E55    push        edi
 00015E56    mov         esi,eax
 00015E58    push        ecx
 00015E59    mov         edi,edx
 00015E5B    or          ecx,0FFFFFFFF
 00015E5E    mov         al,0
 00015E60    repne scas  byte ptr [edi]
 00015E62    not         ecx
 00015E64    dec         ecx
 00015E65    mov         edi,edx
 00015E67    pop         edx
 00015E68    sub         edx,ecx
 00015E6A    mov         eax,esi
 00015E6C    push        ecx
 00015E6D    call        @WriteSpaces
 00015E72    pop         ecx
 00015E73    mov         eax,esi
 00015E75    mov         edx,edi
 00015E77    pop         edi
 00015E78    pop         esi
>00015E79    jmp         @WriteBytes
*}
end;

//00015E80
procedure FPower10;
begin
{*
 00015E80    test        eax,eax
>00015E82    jl          00015ECC
>00015E84    je          00015ECB
 00015E86    cmp         eax,1400
>00015E8B    jge         00015F10
 00015E91    mov         edx,eax
 00015E93    and         edx,1F
 00015E96    lea         edx,[edx+edx*4]
 00015E99    fld         tbyte ptr [edx*2+15F24]
 00015EA0    fmulp       st(1),st
 00015EA2    shr         eax,5
>00015EA5    je          00015ECB
 00015EA7    mov         edx,eax
 00015EA9    and         edx,0F
>00015EAC    je          00015EBA
 00015EAE    lea         edx,[edx+edx*4]
 00015EB1    fld         tbyte ptr [edx*2+1605A]
 00015EB8    fmulp       st(1),st
 00015EBA    shr         eax,4
>00015EBD    je          00015ECB
 00015EBF    lea         eax,[eax+eax*4]
 00015EC2    fld         tbyte ptr [eax*2+160F0]
 00015EC9    fmulp       st(1),st
 00015ECB    ret
 00015ECC    neg         eax
 00015ECE    cmp         eax,1400
>00015ED3    jge         00015F17
 00015ED5    mov         edx,eax
 00015ED7    and         edx,1F
 00015EDA    lea         edx,[edx+edx*4]
 00015EDD    fld         tbyte ptr [edx*2+15F24]
 00015EE4    fdivp       st(1),st
 00015EE6    shr         eax,5
>00015EE9    je          00015ECB
 00015EEB    mov         edx,eax
 00015EED    and         edx,0F
>00015EF0    je          00015EFE
 00015EF2    lea         edx,[edx+edx*4]
 00015EF5    fld         tbyte ptr [edx*2+1605A]
 00015EFC    fdivp       st(1),st
 00015EFE    shr         eax,4
>00015F01    je          00015ECB
 00015F03    lea         eax,[eax+eax*4]
 00015F06    fld         tbyte ptr [eax*2+160F0]
 00015F0D    fdivp       st(1),st
 00015F0F    ret
 00015F10    fld         tbyte ptr ds:[15F1A]
 00015F16    ret
 00015F17    fldz
 00015F19    ret
*}
end;

//00016154
procedure @_llmul;
begin
{*
 00016154    push        edx
 00016155    push        eax
 00016156    mov         eax,dword ptr [esp+10]
 0001615A    mul         eax,dword ptr [esp]
 0001615D    mov         ecx,eax
 0001615F    mov         eax,dword ptr [esp+4]
 00016163    mul         eax,dword ptr [esp+0C]
 00016167    add         ecx,eax
 00016169    mov         eax,dword ptr [esp]
 0001616C    mul         eax,dword ptr [esp+0C]
 00016170    add         edx,ecx
 00016172    pop         ecx
 00016173    pop         ecx
 00016174    ret         8
*}
end;

//00016177
procedure @_llmulo;
begin
{*
 00016177    push        edx
 00016178    push        eax
 00016179    mov         eax,dword ptr [esp+10]
 0001617D    mul         eax,dword ptr [esp]
 00016180    mov         ecx,eax
 00016182    mov         eax,dword ptr [esp+4]
 00016186    mul         eax,dword ptr [esp+0C]
 0001618A    add         ecx,eax
 0001618C    mov         eax,dword ptr [esp]
 0001618F    mul         eax,dword ptr [esp+0C]
 00016193    add         edx,ecx
 00016195    pop         ecx
 00016196    pop         ecx
 00016197    ret         8
*}
end;

//0001619A
procedure @_lldiv;
begin
{*
 0001619A    push        ebp
 0001619B    push        ebx
 0001619C    push        esi
 0001619D    push        edi
 0001619E    xor         edi,edi
 000161A0    mov         ebx,dword ptr [esp+14]
 000161A4    mov         ecx,dword ptr [esp+18]
 000161A8    or          ecx,ecx
>000161AA    jne         000161B4
 000161AC    or          edx,edx
>000161AE    je          0001620C
 000161B0    or          ebx,ebx
>000161B2    je          0001620C
 000161B4    or          edx,edx
>000161B6    jns         000161C2
 000161B8    neg         edx
 000161BA    neg         eax
 000161BC    sbb         edx,0
 000161BF    or          edi,1
 000161C2    or          ecx,ecx
>000161C4    jns         000161D0
 000161C6    neg         ecx
 000161C8    neg         ebx
 000161CA    sbb         ecx,0
 000161CD    xor         edi,1
 000161D0    mov         ebp,ecx
 000161D2    mov         ecx,40
 000161D7    push        edi
 000161D8    xor         edi,edi
 000161DA    xor         esi,esi
 000161DC    shl         eax,1
 000161DE    rcl         edx,1
 000161E0    rcl         esi,1
 000161E2    rcl         edi,1
 000161E4    cmp         edi,ebp
>000161E6    jb          000161F3
>000161E8    ja          000161EE
 000161EA    cmp         esi,ebx
>000161EC    jb          000161F3
 000161EE    sub         esi,ebx
 000161F0    sbb         edi,ebp
 000161F2    inc         eax
 000161F3    loop        000161DC
 000161F5    pop         ebx
 000161F6    test        ebx,1
>000161FC    je          00016205
 000161FE    neg         edx
 00016200    neg         eax
 00016202    sbb         edx,0
 00016205    pop         edi
 00016206    pop         esi
 00016207    pop         ebx
 00016208    pop         ebp
 00016209    ret         8
 0001620C    div         eax,ebx
 0001620E    xor         edx,edx
>00016210    jmp         00016205
 00016212    push        esi
 00016213    mov         esi,dword ptr [esp+0C]
 00016217    and         esi,dword ptr [esp+8]
 0001621B    cmp         esi,0FFFFFFFF
>0001621E    jne         00016231
 00016220    mov         esi,eax
 00016222    or          esi,edx
 00016224    cmp         esi,80000000
>0001622A    jne         00016231
 0001622C    mov         eax,esi
 0001622E    pop         esi
 0001622F    dec         eax
 00016230    ret
 00016231    pop         esi
 00016232    push        dword ptr [esp+8]
 00016236    push        dword ptr [esp+8]
 0001623A    call        @_lldiv
 0001623F    and         eax,eax
 00016241    ret         8
*}
end;

//00016212
procedure @_lldivo;
begin
{*
 00016212    push        esi
 00016213    mov         esi,dword ptr [esp+0C]
 00016217    and         esi,dword ptr [esp+8]
 0001621B    cmp         esi,0FFFFFFFF
>0001621E    jne         00016231
 00016220    mov         esi,eax
 00016222    or          esi,edx
 00016224    cmp         esi,80000000
>0001622A    jne         00016231
 0001622C    mov         eax,esi
 0001622E    pop         esi
 0001622F    dec         eax
 00016230    ret
 00016231    pop         esi
 00016232    push        dword ptr [esp+8]
 00016236    push        dword ptr [esp+8]
 0001623A    call        @_lldiv
 0001623F    and         eax,eax
 00016241    ret         8
*}
end;

//00016244
procedure @_lludiv;
begin
{*
 00016244    push        ebp
 00016245    push        ebx
 00016246    push        esi
 00016247    push        edi
 00016248    mov         ebx,dword ptr [esp+14]
 0001624C    mov         ecx,dword ptr [esp+18]
 00016250    or          ecx,ecx
>00016252    jne         0001625C
 00016254    or          edx,edx
>00016256    je          00016287
 00016258    or          ebx,ebx
>0001625A    je          00016287
 0001625C    mov         ebp,ecx
 0001625E    mov         ecx,40
 00016263    xor         edi,edi
 00016265    xor         esi,esi
 00016267    shl         eax,1
 00016269    rcl         edx,1
 0001626B    rcl         esi,1
 0001626D    rcl         edi,1
 0001626F    cmp         edi,ebp
>00016271    jb          0001627E
>00016273    ja          00016279
 00016275    cmp         esi,ebx
>00016277    jb          0001627E
 00016279    sub         esi,ebx
 0001627B    sbb         edi,ebp
 0001627D    inc         eax
 0001627E    loop        00016267
 00016280    pop         edi
 00016281    pop         esi
 00016282    pop         ebx
 00016283    pop         ebp
 00016284    ret         8
 00016287    div         eax,ebx
 00016289    xor         edx,edx
>0001628B    jmp         00016280
 0001628D    push        ebp
 0001628E    push        ebx
 0001628F    push        esi
 00016290    push        edi
 00016291    xor         edi,edi
 00016293    mov         ebx,dword ptr [esp+14]
 00016297    mov         ecx,dword ptr [esp+18]
 0001629B    or          ecx,ecx
>0001629D    jne         000162A7
 0001629F    or          edx,edx
>000162A1    je          00016300
 000162A3    or          ebx,ebx
>000162A5    je          00016300
 000162A7    or          edx,edx
>000162A9    jns         000162B5
 000162AB    neg         edx
 000162AD    neg         eax
 000162AF    sbb         edx,0
 000162B2    or          edi,1
 000162B5    or          ecx,ecx
>000162B7    jns         000162C0
 000162B9    neg         ecx
 000162BB    neg         ebx
 000162BD    sbb         ecx,0
 000162C0    mov         ebp,ecx
 000162C2    mov         ecx,40
 000162C7    push        edi
 000162C8    xor         edi,edi
 000162CA    xor         esi,esi
 000162CC    shl         eax,1
 000162CE    rcl         edx,1
 000162D0    rcl         esi,1
 000162D2    rcl         edi,1
 000162D4    cmp         edi,ebp
>000162D6    jb          000162E3
>000162D8    ja          000162DE
 000162DA    cmp         esi,ebx
>000162DC    jb          000162E3
 000162DE    sub         esi,ebx
 000162E0    sbb         edi,ebp
 000162E2    inc         eax
 000162E3    loop        000162CC
 000162E5    mov         eax,esi
 000162E7    mov         edx,edi
 000162E9    pop         ebx
 000162EA    test        ebx,1
>000162F0    je          000162F9
 000162F2    neg         edx
 000162F4    neg         eax
 000162F6    sbb         edx,0
 000162F9    pop         edi
 000162FA    pop         esi
 000162FB    pop         ebx
 000162FC    pop         ebp
 000162FD    ret         8
 00016300    div         eax,ebx
 00016302    xchg        eax,edx
 00016303    xor         edx,edx
>00016305    jmp         000162F9
 00016307    push        esi
 00016308    mov         esi,dword ptr [esp+0C]
 0001630C    and         esi,dword ptr [esp+8]
 00016310    cmp         esi,0FFFFFFFF
>00016313    jne         00016326
 00016315    mov         esi,eax
 00016317    or          esi,edx
 00016319    cmp         esi,80000000
>0001631F    jne         00016326
 00016321    mov         eax,esi
 00016323    pop         esi
 00016324    dec         eax
 00016325    ret
 00016326    pop         esi
 00016327    push        dword ptr [esp+8]
 0001632B    push        dword ptr [esp+8]
 0001632F    call        @_llmod
 00016334    and         eax,eax
 00016336    ret         8
*}
end;

//0001628D
procedure @_llmod;
begin
{*
 0001628D    push        ebp
 0001628E    push        ebx
 0001628F    push        esi
 00016290    push        edi
 00016291    xor         edi,edi
 00016293    mov         ebx,dword ptr [esp+14]
 00016297    mov         ecx,dword ptr [esp+18]
 0001629B    or          ecx,ecx
>0001629D    jne         000162A7
 0001629F    or          edx,edx
>000162A1    je          00016300
 000162A3    or          ebx,ebx
>000162A5    je          00016300
 000162A7    or          edx,edx
>000162A9    jns         000162B5
 000162AB    neg         edx
 000162AD    neg         eax
 000162AF    sbb         edx,0
 000162B2    or          edi,1
 000162B5    or          ecx,ecx
>000162B7    jns         000162C0
 000162B9    neg         ecx
 000162BB    neg         ebx
 000162BD    sbb         ecx,0
 000162C0    mov         ebp,ecx
 000162C2    mov         ecx,40
 000162C7    push        edi
 000162C8    xor         edi,edi
 000162CA    xor         esi,esi
 000162CC    shl         eax,1
 000162CE    rcl         edx,1
 000162D0    rcl         esi,1
 000162D2    rcl         edi,1
 000162D4    cmp         edi,ebp
>000162D6    jb          000162E3
>000162D8    ja          000162DE
 000162DA    cmp         esi,ebx
>000162DC    jb          000162E3
 000162DE    sub         esi,ebx
 000162E0    sbb         edi,ebp
 000162E2    inc         eax
 000162E3    loop        000162CC
 000162E5    mov         eax,esi
 000162E7    mov         edx,edi
 000162E9    pop         ebx
 000162EA    test        ebx,1
>000162F0    je          000162F9
 000162F2    neg         edx
 000162F4    neg         eax
 000162F6    sbb         edx,0
 000162F9    pop         edi
 000162FA    pop         esi
 000162FB    pop         ebx
 000162FC    pop         ebp
 000162FD    ret         8
 00016300    div         eax,ebx
 00016302    xchg        eax,edx
 00016303    xor         edx,edx
>00016305    jmp         000162F9
 00016307    push        esi
 00016308    mov         esi,dword ptr [esp+0C]
 0001630C    and         esi,dword ptr [esp+8]
 00016310    cmp         esi,0FFFFFFFF
>00016313    jne         00016326
 00016315    mov         esi,eax
 00016317    or          esi,edx
 00016319    cmp         esi,80000000
>0001631F    jne         00016326
 00016321    mov         eax,esi
 00016323    pop         esi
 00016324    dec         eax
 00016325    ret
 00016326    pop         esi
 00016327    push        dword ptr [esp+8]
 0001632B    push        dword ptr [esp+8]
 0001632F    call        @_llmod
 00016334    and         eax,eax
 00016336    ret         8
*}
end;

//00016307
procedure @_llmodo;
begin
{*
 00016307    push        esi
 00016308    mov         esi,dword ptr [esp+0C]
 0001630C    and         esi,dword ptr [esp+8]
 00016310    cmp         esi,0FFFFFFFF
>00016313    jne         00016326
 00016315    mov         esi,eax
 00016317    or          esi,edx
 00016319    cmp         esi,80000000
>0001631F    jne         00016326
 00016321    mov         eax,esi
 00016323    pop         esi
 00016324    dec         eax
 00016325    ret
 00016326    pop         esi
 00016327    push        dword ptr [esp+8]
 0001632B    push        dword ptr [esp+8]
 0001632F    call        @_llmod
 00016334    and         eax,eax
 00016336    ret         8
*}
end;

//00016339
procedure @_llumod;
begin
{*
 00016339    push        ebp
 0001633A    push        ebx
 0001633B    push        esi
 0001633C    push        edi
 0001633D    mov         ebx,dword ptr [esp+14]
 00016341    mov         ecx,dword ptr [esp+18]
 00016345    or          ecx,ecx
>00016347    jne         00016351
 00016349    or          edx,edx
>0001634B    je          00016380
 0001634D    or          ebx,ebx
>0001634F    je          00016380
 00016351    mov         ebp,ecx
 00016353    mov         ecx,40
 00016358    xor         edi,edi
 0001635A    xor         esi,esi
 0001635C    shl         eax,1
 0001635E    rcl         edx,1
 00016360    rcl         esi,1
 00016362    rcl         edi,1
 00016364    cmp         edi,ebp
>00016366    jb          00016373
>00016368    ja          0001636E
 0001636A    cmp         esi,ebx
>0001636C    jb          00016373
 0001636E    sub         esi,ebx
 00016370    sbb         edi,ebp
 00016372    inc         eax
 00016373    loop        0001635C
 00016375    mov         eax,esi
 00016377    mov         edx,edi
 00016379    pop         edi
 0001637A    pop         esi
 0001637B    pop         ebx
 0001637C    pop         ebp
 0001637D    ret         8
 00016380    div         eax,ebx
 00016382    xchg        eax,edx
 00016383    xor         edx,edx
>00016385    jmp         00016379
 00016387    cmp         cl,20
>0001638A    jl          0001639D
 0001638C    cmp         cl,40
>0001638F    jl          00016396
 00016391    xor         edx,edx
 00016393    xor         eax,eax
 00016395    ret
 00016396    mov         edx,eax
 00016398    shl         edx,cl
 0001639A    xor         eax,eax
 0001639C    ret
 0001639D    shld        edx,eax,cl
 000163A0    shl         eax,cl
 000163A2    ret
*}
end;

//00016387
procedure @_llshl;
begin
{*
 00016387    cmp         cl,20
>0001638A    jl          0001639D
 0001638C    cmp         cl,40
>0001638F    jl          00016396
 00016391    xor         edx,edx
 00016393    xor         eax,eax
 00016395    ret
 00016396    mov         edx,eax
 00016398    shl         edx,cl
 0001639A    xor         eax,eax
 0001639C    ret
 0001639D    shld        edx,eax,cl
 000163A0    shl         eax,cl
 000163A2    ret
*}
end;

//000163BF
procedure @_llushr;
begin
{*
 000163BF    cmp         cl,20
>000163C2    jl          000163D5
 000163C4    cmp         cl,40
>000163C7    jl          000163CE
 000163C9    xor         edx,edx
 000163CB    xor         eax,eax
 000163CD    ret
 000163CE    mov         eax,edx
 000163D0    xor         edx,edx
 000163D2    shr         eax,cl
 000163D4    ret
 000163D5    shrd        eax,edx,cl
 000163D8    shr         edx,cl
 000163DA    ret
*}
end;

Initialization
//00016444
{*
 00016444    push        ebp
 00016445    mov         ebp,esp
 00016447    xor         eax,eax
 00016449    push        ebp
 0001644A    push        1652C
 0001644F    push        dword ptr fs:[eax]
 00016452    mov         dword ptr fs:[eax],esp
 00016455    sub         dword ptr ds:[0B642C],1
>0001645C    jae         0001651E
 00016462    xor         eax,eax
 00016464    mov         [000B6038],eax;gvar_000B6038
 00016469    xor         eax,eax
 0001646B    mov         [000B6040],eax;gvar_000B6040
 00016470    xor         eax,eax
 00016472    mov         [000B6044],eax;gvar_000B6044
 00016477    mov         byte ptr ds:[0B604A],2;gvar_000B604A
 0001647E    mov         byte ptr ds:[0B604B],2;gvar_000B604B
 00016485    mov         byte ptr ds:[0B604C],3;gvar_000B604C
 0001648C    mov         word ptr ds:[0B63F4],0;gvar_000B63F4
 00016495    mov         word ptr ds:[0B6404],1;gvar_000B6404
 0001649E    mov         word ptr ds:[0B6414],0A;gvar_000B6414
 000164A7    mov         dword ptr ds:[0B641C],80020004;gvar_000B641C
 000164B1    mov         dword ptr ds:[0B63E8],1479C
 000164BB    mov         dword ptr ds:[0B63EC],14794
 000164C5    mov         dword ptr ds:[0B63F0],1479C
 000164CF    call        @isNECWindows
 000164D4    test        al,al
>000164D6    je          000164DD
 000164D8    call        @FpuMaskInit
 000164DD    call        @FpuInit
 000164E2    mov         eax,0B6050;gvar_000B6050:TFileRec
 000164E7    mov         edx,16538
 000164EC    call        @Assign
 000164F1    mov         eax,0B621C;gvar_000B621C:TFileRec
 000164F6    mov         edx,16538
 000164FB    call        @Assign
 00016500    call        kernel32.GetCommandLineA
 00016505    mov         [000B6030],eax;gvar_000B6030:PAnsiChar
 0001650A    call        GetCmdShow
 0001650F    mov         [000B602C],eax;gvar_000B602C:Integer
 00016514    call        kernel32.GetCurrentThreadId
 00016519    mov         [000B6024],eax;gvar_000B6024:Longword
 0001651E    xor         eax,eax
 00016520    pop         edx
 00016521    pop         ecx
 00016522    pop         ecx
 00016523    mov         dword ptr fs:[eax],edx
 00016526    push        16533
 0001652B    ret
>0001652C    jmp         @HandleFinally
>00016531    jmp         0001652B
 00016533    pop         ebp
 00016534    ret
*}
Finalization
//000163DC
{*
 000163DC    push        ebp
 000163DD    mov         ebp,esp
 000163DF    xor         eax,eax
 000163E1    push        ebp
 000163E2    push        1643A
 000163E7    push        dword ptr fs:[eax]
 000163EA    mov         dword ptr fs:[eax],esp
 000163ED    inc         dword ptr ds:[0B642C]
>000163F3    jne         0001642C
 000163F5    mov         eax,0B6050;gvar_000B6050:TFileRec
 000163FA    call        @Close
 000163FF    mov         eax,0B621C;gvar_000B621C:TFileRec
 00016404    call        @Close
 00016409    call        UninitAllocator
 0001640E    mov         eax,0B6414;gvar_000B6414
 00016413    call        @VarClr
 00016418    mov         eax,0B6404;gvar_000B6404
 0001641D    call        @VarClr
 00016422    mov         eax,0B63F4;gvar_000B63F4
 00016427    call        @VarClr
 0001642C    xor         eax,eax
 0001642E    pop         edx
 0001642F    pop         ecx
 00016430    pop         ecx
 00016431    mov         dword ptr fs:[eax],edx
 00016434    push        16441
 00016439    ret
>0001643A    jmp         @HandleFinally
>0001643F    jmp         00016439
 00016441    pop         ebp
 00016442    ret
*}
end.