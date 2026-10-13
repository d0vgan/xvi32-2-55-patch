//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit sysutils;

interface

uses
  SysUtils, Classes;

type
  TSearchRec = TSearchRec = record//size=158
fC:TFileName;//fC
end;;
  Exception = class(TObject)
  public
    FMessage:String;//f4
    FHelpContext:Integer;//f8
    constructor Create(const Msg:AnsiString);//0001B9B4
    constructor CreateFmt(const Msg:AnsiString; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1);//0001B9F0
    constructor CreateHelp(const Msg:AnsiString; AHelpContext:Integer);//0001BA70
  end;
  EAbort = class(Exception)
  end;
  EHeapException = class(Exception)
  public
    AllowFree:Boolean;//fC
    procedure FreeInstance;//0001BAB8
  end;
  EOutOfMemory = class(EHeapException)
  end;
  EInOutError = class(Exception)
  public
    ......ErrorCode:Integer;//fC
  end;
  EExternal = class(Exception)
  public
    ExceptionRecord:PExceptionRecord;//fC
  end;
  EExternalException = class(EExternal)
  end;
  EIntError = class(EExternal)
  end;
  EDivByZero = class(EIntError)
  end;
  ERangeError = class(EIntError)
  end;
  EIntOverflow = class(EIntError)
  end;
  EMathError = class(EExternal)
  end;
  EInvalidOp = class(EMathError)
  end;
  EZeroDivide = class(EMathError)
  end;
  EOverflow = class(EMathError)
  end;
  EUnderflow = class(EMathError)
  end;
  EInvalidPointer = class(EHeapException)
  end;
  EInvalidCast = class(Exception)
  end;
  EConvertError = class(Exception)
  end;
  EAccessViolation = class(EExternal)
  end;
  EPrivilege = class(EExternal)
  end;
  EStackOverflow = class(EExternal)
  end;
  EControlC = class(EExternal)
  end;
  EVariantError = class(Exception)
  end;
  EAssertionFailed = class(Exception)
  end;
  EAbstractError = class(Exception)
  end;
  EIntfCastError = class(Exception)
  end;
  EWin32Error = class(Exception)
  public
    ErrorCode:DWORD;//fC
  end;
  TActiveThreadArray = array of ?;
//elSize = 8;
  TMultiReadExclusiveWriteSynchronizer = class(TObject)
  public
    FLock:TRTLCriticalSection;//f4
    FReadExit:THandle;//f1C
    FCount:Integer;//f20
    FSaveReadCount:Integer;//f24
    FActiveThreads:TActiveThreadArray;//f28
    FWriteRequestorID:Integer;//f2C
    FReallocFlag:Integer;//f30
    FWriting:Boolean;//f34
    constructor Create;//0001CC0C
    destructor Destroy;//0001CC74
    function WriterIsOnlyReader:Boolean;//0001CCB4
    procedure BeginWrite;//0001CCF0
    procedure EndWrite;//0001CD3C
  end;
  TErrorRec = TErrorRec = record//size=8
f4:String;//f4
end;;
  TExceptRec = TExceptRec = record//size=8
f4:String;//f4
end;;
    procedure DivMod(Dividend:Integer; Divisor:Word; var Result:Word; var Remainder:Word);//00018188
    procedure ConvertError(const Ident:AnsiString);//000181A4
    procedure ConvertErrorFmt(const Ident:AnsiString; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1);//000181BC
    function AllocMem(Size:Cardinal):Pointer;//000181E0
    procedure DoExitProc;//00018200
    procedure AddExitProc(Proc:TProcedure);//0001822C
    function UpperCase(const S:AnsiString):AnsiString;//00018264
    function LowerCase(const S:AnsiString):AnsiString;//000182A0
    function CompareMem(P1:Pointer; P2:Pointer; Length:Integer):Boolean;//000182DC
    function CompareText(const S1:AnsiString; const S2:AnsiString):Integer;//000182FC
    function AnsiUpperCase(const S:AnsiString):AnsiString;//00018350
    function AnsiLowerCase(const S:AnsiString):AnsiString;//00018384
    function AnsiCompareStr(const S1:AnsiString; const S2:AnsiString):Integer;//000183B8
    function AnsiCompareText(const S1:AnsiString; const S2:AnsiString):Integer;//000183F0
    function AnsiStrLIComp(S1:PChar; S2:PChar; MaxLen:Cardinal):Integer;//00018428
    function Trim(const S:AnsiString):AnsiString;//00018448
    function TrimLeft(const S:AnsiString):AnsiString;//00018498
    function AdjustLineBreaks(const S:AnsiString):AnsiString;//000184CC
    function IsValidIdent(const Ident:AnsiString):Boolean;//00018598
    function IntToStr(Value:Integer):AnsiString;//000185FC
    function IntToHex(Value:Integer; Digits:Integer):AnsiString;//0001862C
    function StrToInt(const S:AnsiString):Integer;//00018668
    function StrToIntDef(const S:AnsiString; Default:Integer):Integer;//000186E0
    function EnumStringModules(Instance:Longint; Data:Pointer):Boolean;//000186F8
    function FindStringResource(Ident:Integer; Buffer:PChar; BufSize:Integer):Integer;//00018720
    function LoadStr(Ident:Integer):AnsiString;//00018748
    function FmtLoadStr(Ident:Integer; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1):AnsiString;//00018778
    function FileOpen(const FileName:AnsiString; Mode:Longword):Integer;//000187D4
    function FileCreate(const FileName:AnsiString):Integer;//00018814
    function FileRead(Handle:Integer; var Buffer:void ; Count:Longword):Integer;//00018838
    function FileWrite(Handle:Integer; const Buffer:void ; Count:Longword):Integer;//00018864
    function FileSeek(Handle:Integer; Offset:Integer; Origin:Integer):Integer;//00018890
    procedure FileClose(Handle:Integer);//0001889C
    function FileAge(const FileName:AnsiString):Integer;//000188A4
    function FileExists(const FileName:AnsiString):Boolean;//0001890C
    function FileSetDate(Handle:Integer; Age:Integer):Integer;//0001891C
    function FileGetAttr(const FileName:AnsiString):Integer;//00018974
    function FindMatchingFile(var F:TSearchRec):Integer;//00018988
    function FindFirst(const Path:AnsiString; Attr:Integer; var F:TSearchRec):Integer;//000189EC
    function FindNext(var F:TSearchRec):Integer;//00018A3C
    procedure FindClose(var F:TSearchRec);//00018A60
    function DeleteFile(const FileName:AnsiString):Boolean;//00018A70
    function AnsiLastChar(const S:AnsiString):PChar;//00018A88
    function LastDelimiter(const Delimiters:AnsiString; const S:AnsiString):Integer;//00018AB8
    function ChangeFileExt(const FileName:AnsiString; const Extension:AnsiString):AnsiString;//00018B08
    function ExtractFilePath(const FileName:AnsiString):AnsiString;//00018B9C
    function ExtractFileDir(const FileName:AnsiString):AnsiString;//00018BD0
    function ExtractFileDrive(const FileName:AnsiString):AnsiString;//00018C2C
    function ExtractFileName(const FileName:AnsiString):AnsiString;//00018CC0
    function ExtractFileExt(const FileName:AnsiString):AnsiString;//00018CF8
    function ExpandFileName(const FileName:AnsiString):AnsiString;//00018D40
    function BackfillGetDiskFreeSpaceEx(Directory:PChar; var FreeAvailable:TLargeInteger; var TotalSpace:TLargeInteger; TotalFree:PLargeInteger):BOOL; stdcall;//00018D7C
    function FileDateToDateTime(FileDate:Integer):TDateTime;//00018DF0
    function DateTimeToFileDate(DateTime:TDateTime):Integer;//00018E5C
    function StrLen(Str:PChar):Cardinal;//00018EEC
    function StrEnd(Str:PChar):PChar;//00018F04
    function StrMove(Dest:PChar; Source:PChar; Count:Cardinal):PChar;//00018F18
    function StrCopy(Dest:PChar; Source:PChar):PChar;//00018F54
    function StrECopy(Dest:PChar; Source:PChar):PChar;//00018F7C
    function StrLCopy(Dest:PChar; Source:PChar; MaxLen:Cardinal):PChar;//00018FA8
    function StrPCopy(Dest:PChar; const Source:AnsiString):PChar;//00018FDC
    function StrPLCopy(Dest:PChar; const Source:AnsiString; MaxLen:Cardinal):PChar;//00019000
    function StrCat(Dest:PChar; Source:PChar):PChar;//00019020
    function StrComp(Str1:PChar; Str2:PChar):Integer;//0001903C
    function StrLIComp(Str1:PChar; Str2:PChar; MaxLen:Cardinal):Integer;//00019060
    function StrScan(Str:PChar; Chr:Char):PChar;//000190A8
    function StrPos(Str1:PChar; Str2:PChar):PChar;//000190C8
    function StrPas(Str:PChar):AnsiString;//0001911C
    function StrAlloc(Size:Cardinal):PChar;//00019130
    function StrBufSize(Str:PChar):Cardinal;//00019144
    function StrNew(Str:PChar):PChar;//00019150
    procedure StrDispose(Str:PChar);//0001917C
    procedure FormatError(ErrorCode:Integer; Format:PChar; FmtLen:Cardinal);//0001918C
    procedure FormatVarToStr(var S:AnsiString; const V:Variant);//000191E4
    procedure FormatClearStr(var S:AnsiString);//000191F8
    function FormatBuf(var Buffer:void ; BufLen:Cardinal; const Format:void ; FmtLen:Cardinal; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1):Cardinal;//00019204
    function StrFmt(Buffer:PChar; Format:PChar; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1):PChar;//000195FC
    function StrLFmt(Buffer:PChar; MaxLen:Cardinal; Format:PChar; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1):PChar;//00019630
    function Format(const Format:AnsiString; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1):AnsiString;//00019664
    procedure FmtStr(var Result:AnsiString; const Format:AnsiString; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1);//00019678
    function FloatToStr(Value:Extended):AnsiString;//00019740
    function FloatToStrF(Format:TFloatFormat; Precision:Integer; Digits:Integer; Value:Extended):AnsiString;//00019770
    function StrToFloat(const S:AnsiString):Extended;//000197A8
    function DateTimeToTimeStamp(DateTime:TDateTime):TTimeStamp;//00019824
    function DoEncodeTime(Hour:Word; Min:Word; Sec:Word; MSec:Word; var Time:TDateTime):Boolean;//00019864
    function EncodeTime(Hour:Word; Min:Word; Sec:Word; MSec:Word):TDateTime;//000198D4
    procedure DecodeTime(var Hour:Word; var Min:Word; var Sec:Word; Time:TDateTime; var MSec:Word);//0001994C
    function IsLeapYear(Year:Word):Boolean;//000199A8
    function DoEncodeDate(Year:Word; Month:Word; Day:Word; var Date:TDateTime):Boolean;//000199E4
    function EncodeDate(Year:Word; Month:Word; Day:Word):TDateTime;//00019AAC
    procedure DecodeDate(var Year:Word; var Month:Word; var Day:Word; Date:TDateTime);//00019B20
    function DayOfWeek(Date:TDateTime):Integer;//00019C44
    //function sub_00019C6C:?;//00019C6C
    function CurrentYear:Word;//00019CBC
    procedure AppendChars(P:PChar; Count:Integer);//00019CD0
    procedure AppendString(const S:AnsiString);//00019D14
    procedure AppendNumber(Number:Integer; Digits:Integer);//00019D34
    procedure GetCount;//00019D80
    procedure GetDate;//00019DAC
    procedure GetTime;//00019DE4
    function ConvertEraString(const Count:Integer):AnsiString;//00019E24
    function ConvertYearString(const Count:Integer):AnsiString;//00019F90
    procedure AppendFormat(Format:PChar);//0001A098
    procedure DateTimeToString(var Result:AnsiString; const Format:AnsiString; DateTime:TDateTime);//0001A7CC
    function DateToStr(Date:TDateTime):AnsiString;//0001A828
    function TimeToStr(Time:TDateTime):AnsiString;//0001A840
    function DateTimeToStr(DateTime:TDateTime):AnsiString;//0001A858
    function FormatDateTime(const Format:AnsiString; DateTime:TDateTime):AnsiString;//0001A86C
    procedure ScanBlanks(const S:AnsiString; var Pos:Integer);//0001A880
    function ScanNumber(const S:AnsiString; var Pos:Integer; var Number:Word; var CharCount:Byte):Boolean;//0001A8A4
    function ScanString(const S:AnsiString; var Pos:Integer; const Symbol:AnsiString):Boolean;//0001A938
    function ScanChar(const S:AnsiString; var Pos:Integer; Ch:Char):Boolean;//0001A9C4
    function GetDateOrder(const DateFormat:AnsiString):TDateOrder;//0001A9FC
    procedure ScanToNumber(const S:AnsiString; var Pos:Integer);//0001AA48
    function GetEraYearOffset(const Name:AnsiString):Integer;//0001AA84
    function EraToYear(Year:Integer):Integer;//0001AAD8
    function ScanDate(const S:AnsiString; var Pos:Integer; var Date:TDateTime):Boolean;//0001AB34
    function ScanTime(const S:AnsiString; var Pos:Integer; var Time:TDateTime):Boolean;//0001AE6C
    function StrToDate(const S:AnsiString):TDateTime;//0001B028
    function StrToTime(const S:AnsiString):TDateTime;//0001B0B0
    function StrToDateTime(const S:AnsiString):TDateTime;//0001B138
    function SysErrorMessage(ErrorCode:Integer):AnsiString;//0001B228
    function GetLocaleStr(Locale:Integer; LocaleType:Integer; const Default:AnsiString):AnsiString;//0001B274
    function GetLocaleChar(Locale:Integer; LocaleType:Integer; Default:Char):Char;//0001B2C0
    function LocalGetLocaleStr(LocaleType:Integer; Index:Integer; const DefValues:array[$0..-$1] of System.Pointer; const _Dv_:$0..-$1):AnsiString;//0001B2E8
    procedure GetMonthDayNames;//0001B324
    function EnumEraNames(Names:PChar):BOOL; stdcall;//0001B440
    function EnumEraYearOffsets(YearOffsets:PChar):BOOL; stdcall;//0001B47C
    procedure GetEraNamesAndYearOffsets;//0001B4C4
    function TranslateDateFormat(const FormatStr:AnsiString):AnsiString;//0001B55C
    function ExceptObject:TObject;//0001B774
    function ExceptAddr:Pointer;//0001B78C
    function ConvertAddr(Address:Pointer):Pointer;//0001B7A4
    function ExceptionErrorMessage(ExceptObject:TObject; ExceptAddr:Pointer; Buffer:PChar; Size:Integer):Integer;//0001B7B0
    procedure ShowException(ExceptObject:TObject; ExceptAddr:Pointer);//0001B93C
    function CreateInOutError:EInOutError;//0001BAE4
    procedure ErrorHandler(ErrorCode:Integer; ErrorAddr:Pointer);//0001BBA8
    //function sub_0001BBEC(?:?; ?:?; ?:?):?;//0001BBEC
    procedure sub_0001BC98;//0001BC98
    procedure AssertErrorHandler(const Message:AnsiString; const Filename:AnsiString; LineNumber:Integer; ErrorAddr:Pointer);//0001BCA8
    procedure AbstractErrorHandler;//0001BCC4
    function MapException(P:PExceptionRecord):Byte;//0001BD30
    function GetExceptionClass(P:PExceptionRecord):ExceptClass;//0001BDB0
    function CreateAVObject:Exception;//0001BDC4
    function GetExceptionObject(P:PExceptionRecord):Exception;//0001BF78
    procedure ExceptHandler(ExceptObject:TObject; ExceptAddr:Pointer);//0001C044
    procedure InitExceptions;//0001C054
    procedure DoneExceptions;//0001C118
    procedure InitPlatformId;//0001C184
    function ByteTypeTest(P:PChar; Index:Integer):TMbcsByteType;//0001C1DC
    function ByteType(const S:AnsiString; Index:Integer):TMbcsByteType;//0001C254
    function StrByteType(Str:PChar; Index:Cardinal):TMbcsByteType;//0001C278
    function ByteToCharLen(const S:AnsiString; MaxLen:Integer):Integer;//0001C290
    function ByteToCharIndex(const S:AnsiString; Index:Integer):Integer;//0001C2B8
    procedure CountChars(const S:AnsiString; MaxChars:Integer; var CharCount:Integer; var ByteCount:Integer);//0001C308
    function CharToByteIndex(const S:AnsiString; Index:Integer):Integer;//0001C37C
    function CharToByteLen(const S:AnsiString; MaxLen:Integer):Integer;//0001C3E0
    function IsPathDelimiter(const S:AnsiString; Index:Integer):Boolean;//0001C440
    function IsDelimiter(const Delimiters:AnsiString; const S:AnsiString; Index:Integer):Boolean;//0001C474
    function AnsiPos(const Substr:AnsiString; const S:AnsiString):Integer;//0001C4B8
    function AnsiLowerCaseFileName(const S:AnsiString):AnsiString;//0001C4F0
    function AnsiStrPos(Str:PChar; SubStr:PChar):PChar;//0001C57C
    function AnsiStrRScan(Str:PChar; Chr:Char):PChar;//0001C61C
    function AnsiStrScan(Str:PChar; Chr:Char):PChar;//0001C644
    procedure InitSysLocale;//0001C684
    procedure GetFormatSettings;//0001C73C
    procedure RaiseLastWin32Error;//0001CAB0
    function Win32Check(RetVal:BOOL):BOOL;//0001CB64
    function CallTerminateProcs:Boolean;//0001CB74
    procedure FreeTerminateProcs;//0001CB90
    procedure InitDriveSpacePtr;//0001CBB0
    procedure _NF__7A3;//0001CD60
    procedure _NF__7A4;//0001CE54
    procedure _DF_;//0001D020
    function FloatToText(Buffer:PChar; const Value:void ; ValueType:TFloatValue; Format:TFloatFormat; Precision:Integer; Digits:Integer):Integer;//0001D042
    procedure sub_0001D199;//0001D199
    function FloatToTextFmt(Buffer:PChar; const Value:void ; ValueType:TFloatValue; Format:PChar):Integer;//0001D30B
    //procedure sub_0001D3D7(?:?);//0001D3D7
    //procedure sub_0001D412(?:?);//0001D412
    procedure sub_0001D4BD;//0001D4BD
    //function sub_0001D578:?;//0001D578
    procedure sub_0001D599;//0001D599
    procedure FloatToDecimal(var Result:TFloatRec; const Value:void ; ValueType:TFloatValue; Precision:Integer; Decimals:Integer);//0001D5DE
    procedure sub_0001D605;//0001D605
    procedure sub_0001D6FE;//0001D6FE
    function TextToFloat(Buffer:PChar; var Value:void ; ValueType:TFloatValue):Boolean;//0001D7CF
    //procedure sub_0001D87A(?:?);//0001D87A
    procedure sub_0001D885;//0001D885
    procedure sub_0001D8A1;//0001D8A1

implementation

//00018188
procedure DivMod(Dividend:Integer; Divisor:Word; var Result:Word; var Remainder:Word);
begin
{*
 00018188    push        ebp
 00018189    mov         ebp,esp
 0001818B    push        ebx
 0001818C    mov         ebx,edx
 0001818E    mov         edx,eax
 00018190    shr         edx,10
 00018193    div         ax,bx
 00018196    mov         ebx,dword ptr [ebp+8]
 00018199    mov         word ptr [ecx],ax
 0001819C    mov         word ptr [ebx],dx
 0001819F    pop         ebx
 000181A0    pop         ebp
 000181A1    ret         4
*}
end;

//000181A4
procedure ConvertError(const Ident:AnsiString);
begin
{*
 000181A4    push        ebx
 000181A5    mov         ebx,eax
 000181A7    mov         ecx,ebx
 000181A9    mov         dl,1
 000181AB    mov         eax,[00017D40];EConvertError
 000181B0    call        Exception.Create
 000181B5    call        @RaiseExcept
 000181BA    pop         ebx
 000181BB    ret
*}
end;

//000181BC
procedure ConvertErrorFmt(const Ident:AnsiString; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1);
begin
{*
 000181BC    push        ebx
 000181BD    push        esi
 000181BE    push        edi
 000181BF    mov         edi,ecx
 000181C1    mov         esi,edx
 000181C3    mov         ebx,eax
 000181C5    push        esi
 000181C6    push        edi
 000181C7    mov         ecx,ebx
 000181C9    mov         dl,1
 000181CB    mov         eax,[00017D40];EConvertError
 000181D0    call        Exception.CreateFmt
 000181D5    call        @RaiseExcept
 000181DA    pop         edi
 000181DB    pop         esi
 000181DC    pop         ebx
 000181DD    ret
*}
end;

//000181E0
function AllocMem(Size:Cardinal):Pointer;
begin
{*
 000181E0    push        ebx
 000181E1    push        esi
 000181E2    mov         ebx,eax
 000181E4    mov         eax,ebx
 000181E6    call        @GetMem
 000181EB    mov         esi,eax
 000181ED    mov         eax,esi
 000181EF    xor         ecx,ecx
 000181F1    mov         edx,ebx
 000181F3    call        @FillChar
 000181F8    mov         eax,esi
 000181FA    pop         esi
 000181FB    pop         ebx
 000181FC    ret
*}
end;

//00018200
procedure DoExitProc;
begin
{*
 00018200    push        ebx
 00018201    mov         eax,[000B418C]
 00018206    mov         edx,dword ptr [eax]
 00018208    mov         dword ptr ds:[0B418C],edx
 0001820E    mov         edx,dword ptr ds:[0B5670];ExitProc:Pointer
 00018214    mov         ecx,dword ptr [eax+4]
 00018217    mov         dword ptr [edx],ecx
 00018219    mov         ebx,dword ptr [eax+8]
 0001821C    mov         edx,0C
 00018221    call        @FreeMem
 00018226    call        ebx
 00018228    pop         ebx
 00018229    ret
*}
end;

//0001822C
procedure AddExitProc(Proc:TProcedure);
begin
{*
 0001822C    push        ebx
 0001822D    mov         ebx,eax
 0001822F    mov         eax,0C
 00018234    call        @GetMem
 00018239    mov         edx,dword ptr ds:[0B418C]
 0001823F    mov         dword ptr [eax],edx
 00018241    mov         edx,dword ptr ds:[0B5670];ExitProc:Pointer
 00018247    mov         edx,dword ptr [edx]
 00018249    mov         dword ptr [eax+4],edx
 0001824C    mov         dword ptr [eax+8],ebx
 0001824F    mov         [000B418C],eax
 00018254    mov         eax,[000B5670];ExitProc:Pointer
 00018259    mov         dword ptr [eax],18200;DoExitProc
 0001825F    pop         ebx
 00018260    ret
*}
end;

//00018264
function UpperCase(const S:AnsiString):AnsiString;
begin
{*
 00018264    push        ebx
 00018265    push        esi
 00018266    push        edi
 00018267    mov         edi,edx
 00018269    mov         esi,eax
 0001826B    mov         eax,esi
 0001826D    call        @LStrLen
 00018272    mov         ebx,eax
 00018274    mov         eax,edi
 00018276    mov         edx,ebx
 00018278    call        @LStrSetLength
 0001827D    mov         edx,esi
 0001827F    mov         esi,dword ptr [edi]
 00018281    test        ebx,ebx
>00018283    je          0001829A
 00018285    mov         al,byte ptr [edx]
 00018287    cmp         al,61
>00018289    jb          00018291
 0001828B    cmp         al,7A
>0001828D    ja          00018291
 0001828F    sub         al,20
 00018291    mov         byte ptr [esi],al
 00018293    inc         edx
 00018294    inc         esi
 00018295    dec         ebx
 00018296    test        ebx,ebx
>00018298    jne         00018285
 0001829A    pop         edi
 0001829B    pop         esi
 0001829C    pop         ebx
 0001829D    ret
*}
end;

//000182A0
function LowerCase(const S:AnsiString):AnsiString;
begin
{*
 000182A0    push        ebx
 000182A1    push        esi
 000182A2    push        edi
 000182A3    mov         edi,edx
 000182A5    mov         esi,eax
 000182A7    mov         eax,esi
 000182A9    call        @LStrLen
 000182AE    mov         ebx,eax
 000182B0    mov         eax,edi
 000182B2    mov         edx,ebx
 000182B4    call        @LStrSetLength
 000182B9    mov         edx,esi
 000182BB    mov         esi,dword ptr [edi]
 000182BD    test        ebx,ebx
>000182BF    je          000182D6
 000182C1    mov         al,byte ptr [edx]
 000182C3    cmp         al,41
>000182C5    jb          000182CD
 000182C7    cmp         al,5A
>000182C9    ja          000182CD
 000182CB    add         al,20
 000182CD    mov         byte ptr [esi],al
 000182CF    inc         edx
 000182D0    inc         esi
 000182D1    dec         ebx
 000182D2    test        ebx,ebx
>000182D4    jne         000182C1
 000182D6    pop         edi
 000182D7    pop         esi
 000182D8    pop         ebx
 000182D9    ret
*}
end;

//000182DC
function CompareMem(P1:Pointer; P2:Pointer; Length:Integer):Boolean;
begin
{*
 000182DC    push        esi
 000182DD    push        edi
 000182DE    mov         esi,eax
 000182E0    mov         edi,edx
 000182E2    mov         edx,ecx
 000182E4    xor         eax,eax
 000182E6    and         edx,3
 000182E9    shr         ecx,1
 000182EB    shr         ecx,1
 000182ED    repe cmps   dword ptr [esi],dword ptr [edi]
>000182EF    jne         000182F8
 000182F1    mov         ecx,edx
 000182F3    repe cmps   byte ptr [esi],byte ptr [edi]
>000182F5    jne         000182F8
 000182F7    inc         eax
 000182F8    pop         edi
 000182F9    pop         esi
 000182FA    ret
*}
end;

//000182FC
function CompareText(const S1:AnsiString; const S2:AnsiString):Integer;
begin
{*
 000182FC    push        esi
 000182FD    push        edi
 000182FE    push        ebx
 000182FF    mov         esi,eax
 00018301    mov         edi,edx
 00018303    or          eax,eax
>00018305    je          0001830A
 00018307    mov         eax,dword ptr [eax-4]
 0001830A    or          edx,edx
>0001830C    je          00018311
 0001830E    mov         edx,dword ptr [edx-4]
 00018311    mov         ecx,eax
 00018313    cmp         ecx,edx
>00018315    jbe         00018319
 00018317    mov         ecx,edx
 00018319    cmp         ecx,ecx
 0001831B    repe cmps   byte ptr [esi],byte ptr [edi]
>0001831D    je          00018349
 0001831F    mov         bl,byte ptr [esi-1]
 00018322    cmp         bl,61
>00018325    jb          0001832F
 00018327    cmp         bl,7A
>0001832A    ja          0001832F
 0001832C    sub         bl,20
 0001832F    mov         bh,byte ptr [edi-1]
 00018332    cmp         bh,61
>00018335    jb          0001833F
 00018337    cmp         bh,7A
>0001833A    ja          0001833F
 0001833C    sub         bh,20
 0001833F    cmp         bl,bh
>00018341    je          0001831B
 00018343    movzx       eax,bl
 00018346    movzx       edx,bh
 00018349    sub         eax,edx
 0001834B    pop         ebx
 0001834C    pop         edi
 0001834D    pop         esi
 0001834E    ret
*}
end;

//00018350
function AnsiUpperCase(const S:AnsiString):AnsiString;
begin
{*
 00018350    push        ebx
 00018351    push        esi
 00018352    push        edi
 00018353    mov         edi,edx
 00018355    mov         esi,eax
 00018357    mov         eax,esi
 00018359    call        @LStrLen
 0001835E    mov         ebx,eax
 00018360    mov         eax,esi
 00018362    call        @LStrToPChar
 00018367    mov         edx,eax
 00018369    mov         eax,edi
 0001836B    mov         ecx,ebx
 0001836D    call        @LStrFromPCharLen
 00018372    test        ebx,ebx
>00018374    jle         0001837F
 00018376    push        ebx
 00018377    mov         eax,dword ptr [edi]
 00018379    push        eax
 0001837A    call        user32.CharUpperBuffA
 0001837F    pop         edi
 00018380    pop         esi
 00018381    pop         ebx
 00018382    ret
*}
end;

//00018384
function AnsiLowerCase(const S:AnsiString):AnsiString;
begin
{*
 00018384    push        ebx
 00018385    push        esi
 00018386    push        edi
 00018387    mov         edi,edx
 00018389    mov         esi,eax
 0001838B    mov         eax,esi
 0001838D    call        @LStrLen
 00018392    mov         ebx,eax
 00018394    mov         eax,esi
 00018396    call        @LStrToPChar
 0001839B    mov         edx,eax
 0001839D    mov         eax,edi
 0001839F    mov         ecx,ebx
 000183A1    call        @LStrFromPCharLen
 000183A6    test        ebx,ebx
>000183A8    jle         000183B3
 000183AA    push        ebx
 000183AB    mov         eax,dword ptr [edi]
 000183AD    push        eax
 000183AE    call        user32.CharLowerBuffA
 000183B3    pop         edi
 000183B4    pop         esi
 000183B5    pop         ebx
 000183B6    ret
*}
end;

//000183B8
function AnsiCompareStr(const S1:AnsiString; const S2:AnsiString):Integer;
begin
{*
 000183B8    push        ebx
 000183B9    push        esi
 000183BA    mov         esi,edx
 000183BC    mov         ebx,eax
 000183BE    mov         eax,esi
 000183C0    call        @LStrLen
 000183C5    push        eax
 000183C6    mov         eax,esi
 000183C8    call        @LStrToPChar
 000183CD    push        eax
 000183CE    mov         eax,ebx
 000183D0    call        @LStrLen
 000183D5    push        eax
 000183D6    mov         eax,ebx
 000183D8    call        @LStrToPChar
 000183DD    push        eax
 000183DE    push        0
 000183E0    push        400
 000183E5    call        kernel32.CompareStringA
 000183EA    sub         eax,2
 000183ED    pop         esi
 000183EE    pop         ebx
 000183EF    ret
*}
end;

//000183F0
function AnsiCompareText(const S1:AnsiString; const S2:AnsiString):Integer;
begin
{*
 000183F0    push        ebx
 000183F1    push        esi
 000183F2    mov         esi,edx
 000183F4    mov         ebx,eax
 000183F6    mov         eax,esi
 000183F8    call        @LStrLen
 000183FD    push        eax
 000183FE    mov         eax,esi
 00018400    call        @LStrToPChar
 00018405    push        eax
 00018406    mov         eax,ebx
 00018408    call        @LStrLen
 0001840D    push        eax
 0001840E    mov         eax,ebx
 00018410    call        @LStrToPChar
 00018415    push        eax
 00018416    push        1
 00018418    push        400
 0001841D    call        kernel32.CompareStringA
 00018422    sub         eax,2
 00018425    pop         esi
 00018426    pop         ebx
 00018427    ret
*}
end;

//00018428
function AnsiStrLIComp(S1:PChar; S2:PChar; MaxLen:Cardinal):Integer;
begin
{*
 00018428    push        ebx
 00018429    push        esi
 0001842A    push        edi
 0001842B    mov         ebx,ecx
 0001842D    mov         edi,edx
 0001842F    mov         esi,eax
 00018431    push        ebx
 00018432    push        edi
 00018433    push        ebx
 00018434    push        esi
 00018435    push        1
 00018437    push        400
 0001843C    call        kernel32.CompareStringA
 00018441    sub         eax,2
 00018444    pop         edi
 00018445    pop         esi
 00018446    pop         ebx
 00018447    ret
*}
end;

//00018448
function Trim(const S:AnsiString):AnsiString;
begin
{*
 00018448    push        ebx
 00018449    push        esi
 0001844A    push        edi
 0001844B    push        ebp
 0001844C    mov         ebp,edx
 0001844E    mov         edi,eax
 00018450    mov         eax,edi
 00018452    call        @LStrLen
 00018457    mov         esi,eax
 00018459    mov         ebx,1
>0001845E    jmp         00018461
 00018460    inc         ebx
 00018461    cmp         esi,ebx
>00018463    jl          0001846C
 00018465    cmp         byte ptr [edi+ebx-1],20
>0001846A    jbe         00018460
 0001846C    cmp         esi,ebx
>0001846E    jge         0001847A
 00018470    mov         eax,ebp
 00018472    call        @LStrClr
>00018477    jmp         00018490
 00018479    dec         esi
 0001847A    cmp         byte ptr [edi+esi-1],20
>0001847F    jbe         00018479
 00018481    push        ebp
 00018482    mov         ecx,esi
 00018484    sub         ecx,ebx
 00018486    inc         ecx
 00018487    mov         edx,ebx
 00018489    mov         eax,edi
 0001848B    call        @LStrCopy
 00018490    pop         ebp
 00018491    pop         edi
 00018492    pop         esi
 00018493    pop         ebx
 00018494    ret
*}
end;

//00018498
function TrimLeft(const S:AnsiString):AnsiString;
begin
{*
 00018498    push        ebx
 00018499    push        esi
 0001849A    push        edi
 0001849B    mov         edi,edx
 0001849D    mov         esi,eax
 0001849F    mov         eax,esi
 000184A1    call        @LStrLen
 000184A6    mov         ebx,1
>000184AB    jmp         000184AE
 000184AD    inc         ebx
 000184AE    cmp         eax,ebx
>000184B0    jl          000184B9
 000184B2    cmp         byte ptr [esi+ebx-1],20
>000184B7    jbe         000184AD
 000184B9    push        edi
 000184BA    mov         ecx,7FFFFFFF
 000184BF    mov         edx,ebx
 000184C1    mov         eax,esi
 000184C3    call        @LStrCopy
 000184C8    pop         edi
 000184C9    pop         esi
 000184CA    pop         ebx
 000184CB    ret
*}
end;

//000184CC
function AdjustLineBreaks(const S:AnsiString):AnsiString;
begin
{*
 000184CC    push        ebx
 000184CD    push        esi
 000184CE    push        edi
 000184CF    push        ebp
 000184D0    push        ecx
 000184D1    mov         dword ptr [esp],edx
 000184D4    mov         ebp,eax
 000184D6    mov         ebx,ebp
 000184D8    mov         eax,ebp
 000184DA    call        @LStrLen
 000184DF    mov         esi,eax
 000184E1    add         esi,ebx
 000184E3    xor         edi,edi
 000184E5    cmp         esi,ebx
>000184E7    jbe         0001851C
 000184E9    mov         al,byte ptr [ebx]
 000184EB    mov         edx,eax
 000184ED    sub         dl,0A
>000184F0    je          000184F9
 000184F2    sub         dl,3
>000184F5    je          000184FC
>000184F7    jmp         00018508
 000184F9    inc         edi
>000184FA    jmp         00018517
 000184FC    cmp         byte ptr [ebx+1],0A
>00018500    jne         00018505
 00018502    inc         ebx
>00018503    jmp         00018517
 00018505    inc         edi
>00018506    jmp         00018517
 00018508    and         eax,0FF
 0001850D    bt          dword ptr ds:[0B4164],eax
>00018514    jae         00018517
 00018516    inc         ebx
 00018517    inc         ebx
 00018518    cmp         esi,ebx
>0001851A    ja          000184E9
 0001851C    test        edi,edi
>0001851E    jne         0001852C
 00018520    mov         eax,dword ptr [esp]
 00018523    mov         edx,ebp
 00018525    call        @LStrLAsg
>0001852A    jmp         00018592
 0001852C    mov         ebx,ebp
 0001852E    mov         ecx,esi
 00018530    sub         ecx,ebx
 00018532    add         ecx,edi
 00018534    mov         eax,dword ptr [esp]
 00018537    xor         edx,edx
 00018539    call        @LStrFromPCharLen
 0001853E    mov         edi,dword ptr [esp]
 00018541    mov         edi,dword ptr [edi]
 00018543    cmp         esi,ebx
>00018545    jbe         00018592
 00018547    mov         al,byte ptr [ebx]
 00018549    mov         edx,eax
 0001854B    sub         dl,0A
>0001854E    je          00018557
 00018550    sub         dl,3
>00018553    je          00018562
>00018555    jmp         00018573
 00018557    mov         byte ptr [edi],0D
 0001855A    inc         edi
 0001855B    mov         byte ptr [edi],0A
 0001855E    inc         edi
 0001855F    inc         ebx
>00018560    jmp         0001858E
 00018562    mov         byte ptr [edi],0D
 00018565    inc         edi
 00018566    mov         byte ptr [edi],0A
 00018569    inc         edi
 0001856A    inc         ebx
 0001856B    cmp         byte ptr [ebx],0A
>0001856E    jne         0001858E
 00018570    inc         ebx
>00018571    jmp         0001858E
 00018573    mov         edx,eax
 00018575    and         edx,0FF
 0001857B    bt          dword ptr ds:[0B4164],edx
>00018582    jae         00018588
 00018584    mov         byte ptr [edi],al
 00018586    inc         edi
 00018587    inc         ebx
 00018588    mov         al,byte ptr [ebx]
 0001858A    mov         byte ptr [edi],al
 0001858C    inc         edi
 0001858D    inc         ebx
 0001858E    cmp         esi,ebx
>00018590    ja          00018547
 00018592    pop         edx
 00018593    pop         ebp
 00018594    pop         edi
 00018595    pop         esi
 00018596    pop         ebx
 00018597    ret
*}
end;

//00018598
function IsValidIdent(const Ident:AnsiString):Boolean;
begin
{*
 00018598    push        ebx
 00018599    push        esi
 0001859A    push        edi
 0001859B    mov         esi,eax
 0001859D    xor         ebx,ebx
 0001859F    mov         eax,esi
 000185A1    call        @LStrLen
 000185A6    test        eax,eax
>000185A8    je          000185F5
 000185AA    mov         al,byte ptr [esi]
 000185AC    add         al,0BF
 000185AE    sub         al,1A
>000185B0    jb          000185BC
 000185B2    sub         al,4
>000185B4    je          000185BC
 000185B6    add         al,0FE
 000185B8    sub         al,1A
>000185BA    jae         000185F5
 000185BC    mov         eax,esi
 000185BE    call        @LStrLen
 000185C3    sub         eax,2
>000185C6    jl          000185F3
 000185C8    inc         eax
 000185C9    mov         edi,2
 000185CE    mov         dl,byte ptr [esi+edi-1]
 000185D2    add         dl,0D0
 000185D5    sub         dl,0A
>000185D8    jb          000185EF
 000185DA    add         dl,0F9
 000185DD    sub         dl,1A
>000185E0    jb          000185EF
 000185E2    sub         dl,4
>000185E5    je          000185EF
 000185E7    add         dl,0FE
 000185EA    sub         dl,1A
>000185ED    jae         000185F5
 000185EF    inc         edi
 000185F0    dec         eax
>000185F1    jne         000185CE
 000185F3    mov         bl,1
 000185F5    mov         eax,ebx
 000185F7    pop         edi
 000185F8    pop         esi
 000185F9    pop         ebx
 000185FA    ret
*}
end;

//000185FC
function IntToStr(Value:Integer):AnsiString;
begin
{*
 000185FC    add         esp,0FFFFFFF8
 000185FF    push        0
 00018601    mov         dword ptr [esp+4],eax
 00018605    mov         byte ptr [esp+8],0
 0001860A    lea         ecx,[esp+4]
 0001860E    mov         eax,edx
 00018610    mov         edx,18628;'%d'
 00018615    call        FmtStr
 0001861A    pop         ecx
 0001861B    pop         edx
 0001861C    ret
*}
end;

//0001862C
function IntToHex(Value:Integer; Digits:Integer):AnsiString;
begin
{*
 0001862C    add         esp,0FFFFFFF0
 0001862F    push        1
 00018631    mov         dword ptr [esp+4],edx
 00018635    mov         byte ptr [esp+8],0
 0001863A    mov         dword ptr [esp+0C],eax
 0001863E    mov         byte ptr [esp+10],0
 00018643    lea         eax,[esp+4]
 00018647    mov         edx,18660;'%.*x'
 0001864C    xchg        eax,ecx
 0001864D    call        FmtStr
 00018652    add         esp,10
 00018655    ret
*}
end;

//00018668
function StrToInt(const S:AnsiString):Integer;
begin
{*
 00018668    push        ebp
 00018669    mov         ebp,esp
 0001866B    add         esp,0FFFFFFF0
 0001866E    push        ebx
 0001866F    push        esi
 00018670    xor         edx,edx
 00018672    mov         dword ptr [ebp-8],edx
 00018675    mov         ebx,eax
 00018677    xor         eax,eax
 00018679    push        ebp
 0001867A    push        186D0
 0001867F    push        dword ptr fs:[eax]
 00018682    mov         dword ptr fs:[eax],esp
 00018685    lea         edx,[ebp-4]
 00018688    mov         eax,ebx
 0001868A    call        @ValLong
 0001868F    mov         esi,eax
 00018691    cmp         dword ptr [ebp-4],0
>00018695    je          000186BA
 00018697    lea         edx,[ebp-8]
 0001869A    mov         eax,[000B5838];^SInvalidInteger:TResStringRec
 0001869F    call        LoadResString
 000186A4    mov         eax,dword ptr [ebp-8]
 000186A7    push        eax
 000186A8    mov         dword ptr [ebp-10],ebx
 000186AB    mov         byte ptr [ebp-0C],0B
 000186AF    lea         edx,[ebp-10]
 000186B2    xor         ecx,ecx
 000186B4    pop         eax
 000186B5    call        ConvertErrorFmt
 000186BA    xor         eax,eax
 000186BC    pop         edx
 000186BD    pop         ecx
 000186BE    pop         ecx
 000186BF    mov         dword ptr fs:[eax],edx
 000186C2    push        186D7
 000186C7    lea         eax,[ebp-8]
 000186CA    call        @LStrClr
 000186CF    ret
>000186D0    jmp         @HandleFinally
>000186D5    jmp         000186C7
 000186D7    mov         eax,esi
 000186D9    pop         esi
 000186DA    pop         ebx
 000186DB    mov         esp,ebp
 000186DD    pop         ebp
 000186DE    ret
*}
end;

//000186E0
function StrToIntDef(const S:AnsiString; Default:Integer):Integer;
begin
{*
 000186E0    push        ebx
 000186E1    push        ecx
 000186E2    mov         ebx,edx
 000186E4    mov         edx,esp
 000186E6    call        @ValLong
 000186EB    cmp         dword ptr [esp],0
>000186EF    je          000186F3
 000186F1    mov         eax,ebx
 000186F3    pop         edx
 000186F4    pop         ebx
 000186F5    ret
*}
end;

//000186F8
function EnumStringModules(Instance:Longint; Data:Pointer):Boolean;
begin
{*
 000186F8    push        ebx
 000186F9    push        esi
 000186FA    push        edi
 000186FB    mov         edi,eax
 000186FD    mov         ebx,edx
 000186FF    mov         eax,dword ptr [ebx+8]
 00018702    push        eax
 00018703    mov         eax,dword ptr [ebx+4]
 00018706    push        eax
 00018707    mov         eax,dword ptr [ebx]
 00018709    push        eax
 0001870A    push        edi
 0001870B    call        user32.LoadStringA
 00018710    mov         esi,eax
 00018712    mov         dword ptr [ebx+0C],esi
 00018715    test        esi,esi
 00018717    sete        al
 0001871A    pop         edi
 0001871B    pop         esi
 0001871C    pop         ebx
 0001871D    ret
*}
end;

//00018720
function FindStringResource(Ident:Integer; Buffer:PChar; BufSize:Integer):Integer;
begin
{*
 00018720    add         esp,0FFFFFFF0
 00018723    mov         dword ptr [esp],eax
 00018726    mov         dword ptr [esp+4],edx
 0001872A    mov         dword ptr [esp+8],ecx
 0001872E    xor         eax,eax
 00018730    mov         dword ptr [esp+0C],eax
 00018734    mov         edx,esp
 00018736    mov         eax,186F8;EnumStringModules:Boolean
 0001873B    call        EnumResourceModules
 00018740    mov         eax,dword ptr [esp+0C]
 00018744    add         esp,10
 00018747    ret
*}
end;

//00018748
function LoadStr(Ident:Integer):AnsiString;
begin
{*
 00018748    push        ebx
 00018749    push        esi
 0001874A    add         esp,0FFFFFC00
 00018750    mov         esi,edx
 00018752    mov         ebx,eax
 00018754    mov         edx,esp
 00018756    mov         ecx,400
 0001875B    mov         eax,ebx
 0001875D    call        FindStringResource
 00018762    mov         ecx,eax
 00018764    mov         edx,esp
 00018766    mov         eax,esi
 00018768    call        @LStrFromPCharLen
 0001876D    add         esp,400
 00018773    pop         esi
 00018774    pop         ebx
 00018775    ret
*}
end;

//00018778
function FmtLoadStr(Ident:Integer; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1):AnsiString;
begin
{*
 00018778    push        ebp
 00018779    mov         ebp,esp
 0001877B    push        0
 0001877D    push        ebx
 0001877E    push        esi
 0001877F    push        edi
 00018780    mov         edi,ecx
 00018782    mov         esi,edx
 00018784    mov         ebx,eax
 00018786    xor         eax,eax
 00018788    push        ebp
 00018789    push        187C2
 0001878E    push        dword ptr fs:[eax]
 00018791    mov         dword ptr fs:[eax],esp
 00018794    push        edi
 00018795    lea         edx,[ebp-4]
 00018798    mov         eax,ebx
 0001879A    call        LoadStr
 0001879F    mov         edx,dword ptr [ebp-4]
 000187A2    mov         ecx,esi
 000187A4    mov         eax,dword ptr [ebp+8]
 000187A7    call        FmtStr
 000187AC    xor         eax,eax
 000187AE    pop         edx
 000187AF    pop         ecx
 000187B0    pop         ecx
 000187B1    mov         dword ptr fs:[eax],edx
 000187B4    push        187C9
 000187B9    lea         eax,[ebp-4]
 000187BC    call        @LStrClr
 000187C1    ret
>000187C2    jmp         @HandleFinally
>000187C7    jmp         000187B9
 000187C9    pop         edi
 000187CA    pop         esi
 000187CB    pop         ebx
 000187CC    pop         ecx
 000187CD    pop         ebp
 000187CE    ret         4
*}
end;

//000187D4
function FileOpen(const FileName:AnsiString; Mode:Longword):Integer;
begin
{*
 000187D4    push        ebx
 000187D5    push        esi
 000187D6    mov         ebx,edx
 000187D8    mov         esi,eax
 000187DA    push        0
 000187DC    push        80
 000187E1    push        3
 000187E3    push        0
 000187E5    mov         eax,ebx
 000187E7    and         eax,0F0
 000187EC    shr         eax,4
 000187EF    mov         eax,dword ptr [eax*4+0B419C]
 000187F6    push        eax
 000187F7    and         ebx,3
 000187FA    mov         eax,dword ptr [ebx*4+0B4190]
 00018801    push        eax
 00018802    mov         eax,esi
 00018804    call        @LStrToPChar
 00018809    push        eax
 0001880A    call        kernel32.CreateFileA
 0001880F    pop         esi
 00018810    pop         ebx
 00018811    ret
*}
end;

//00018814
function FileCreate(const FileName:AnsiString):Integer;
begin
{*
 00018814    push        ebx
 00018815    mov         ebx,eax
 00018817    push        0
 00018819    push        80
 0001881E    push        2
 00018820    push        0
 00018822    push        0
 00018824    push        0C0000000
 00018829    mov         eax,ebx
 0001882B    call        @LStrToPChar
 00018830    push        eax
 00018831    call        kernel32.CreateFileA
 00018836    pop         ebx
 00018837    ret
*}
end;

//00018838
function FileRead(Handle:Integer; var Buffer:void ; Count:Longword):Integer;
begin
{*
 00018838    push        ebx
 00018839    push        esi
 0001883A    push        edi
 0001883B    push        ecx
 0001883C    mov         edi,ecx
 0001883E    mov         esi,edx
 00018840    mov         ebx,eax
 00018842    push        0
 00018844    lea         eax,[esp+4]
 00018848    push        eax
 00018849    push        edi
 0001884A    push        esi
 0001884B    push        ebx
 0001884C    call        kernel32.ReadFile
 00018851    test        eax,eax
>00018853    jne         0001885C
 00018855    mov         dword ptr [esp],0FFFFFFFF
 0001885C    mov         eax,dword ptr [esp]
 0001885F    pop         edx
 00018860    pop         edi
 00018861    pop         esi
 00018862    pop         ebx
 00018863    ret
*}
end;

//00018864
function FileWrite(Handle:Integer; const Buffer:void ; Count:Longword):Integer;
begin
{*
 00018864    push        ebx
 00018865    push        esi
 00018866    push        edi
 00018867    push        ecx
 00018868    mov         edi,ecx
 0001886A    mov         esi,edx
 0001886C    mov         ebx,eax
 0001886E    push        0
 00018870    lea         eax,[esp+4]
 00018874    push        eax
 00018875    push        edi
 00018876    push        esi
 00018877    push        ebx
 00018878    call        kernel32.WriteFile
 0001887D    test        eax,eax
>0001887F    jne         00018888
 00018881    mov         dword ptr [esp],0FFFFFFFF
 00018888    mov         eax,dword ptr [esp]
 0001888B    pop         edx
 0001888C    pop         edi
 0001888D    pop         esi
 0001888E    pop         ebx
 0001888F    ret
*}
end;

//00018890
function FileSeek(Handle:Integer; Offset:Integer; Origin:Integer):Integer;
begin
{*
 00018890    push        ecx
 00018891    push        0
 00018893    push        edx
 00018894    push        eax
 00018895    call        kernel32.SetFilePointer
 0001889A    ret
*}
end;

//0001889C
procedure FileClose(Handle:Integer);
begin
{*
 0001889C    push        eax
 0001889D    call        kernel32.CloseHandle
 000188A2    ret
*}
end;

//000188A4
function FileAge(const FileName:AnsiString):Integer;
begin
{*
 000188A4    push        ebp
 000188A5    mov         ebp,esp
 000188A7    add         esp,0FFFFFEB4
 000188AD    push        ebx
 000188AE    mov         ebx,eax
 000188B0    lea         eax,[ebp-14C]
 000188B6    push        eax
 000188B7    mov         eax,ebx
 000188B9    call        @LStrToPChar
 000188BE    push        eax
 000188BF    call        kernel32.FindFirstFileA
 000188C4    cmp         eax,0FFFFFFFF
>000188C7    je          000188FD
 000188C9    push        eax
 000188CA    call        kernel32.FindClose
 000188CF    test        byte ptr [ebp-14C],10
>000188D6    jne         000188FD
 000188D8    lea         eax,[ebp-0C]
 000188DB    push        eax
 000188DC    lea         eax,[ebp-138]
 000188E2    push        eax
 000188E3    call        kernel32.FileTimeToLocalFileTime
 000188E8    lea         eax,[ebp-4]
 000188EB    push        eax
 000188EC    lea         eax,[ebp-2]
 000188EF    push        eax
 000188F0    lea         eax,[ebp-0C]
 000188F3    push        eax
 000188F4    call        kernel32.FileTimeToDosDateTime
 000188F9    test        eax,eax
>000188FB    jne         00018904
 000188FD    mov         dword ptr [ebp-4],0FFFFFFFF
 00018904    mov         eax,dword ptr [ebp-4]
 00018907    pop         ebx
 00018908    mov         esp,ebp
 0001890A    pop         ebp
 0001890B    ret
*}
end;

//0001890C
function FileExists(const FileName:AnsiString):Boolean;
begin
{*
 0001890C    push        ebx
 0001890D    mov         ebx,eax
 0001890F    mov         eax,ebx
 00018911    call        FileAge
 00018916    inc         eax
 00018917    setne       al
 0001891A    pop         ebx
 0001891B    ret
*}
end;

//0001891C
function FileSetDate(Handle:Integer; Age:Integer):Integer;
begin
{*
 0001891C    push        ebp
 0001891D    mov         ebp,esp
 0001891F    add         esp,0FFFFFFEC
 00018922    push        ebx
 00018923    push        esi
 00018924    mov         dword ptr [ebp-4],edx
 00018927    mov         esi,eax
 00018929    xor         ebx,ebx
 0001892B    lea         eax,[ebp-0C]
 0001892E    push        eax
 0001892F    mov         ax,word ptr [ebp-4]
 00018933    push        eax
 00018934    mov         ax,word ptr [ebp-2]
 00018938    push        eax
 00018939    call        kernel32.DosDateTimeToFileTime
 0001893E    test        eax,eax
>00018940    je          00018965
 00018942    lea         eax,[ebp-14]
 00018945    push        eax
 00018946    lea         eax,[ebp-0C]
 00018949    push        eax
 0001894A    call        kernel32.LocalFileTimeToFileTime
 0001894F    test        eax,eax
>00018951    je          00018965
 00018953    lea         eax,[ebp-14]
 00018956    push        eax
 00018957    push        0
 00018959    push        0
 0001895B    push        esi
 0001895C    call        kernel32.SetFileTime
 00018961    test        eax,eax
>00018963    jne         0001896C
 00018965    call        kernel32.GetLastError
 0001896A    mov         ebx,eax
 0001896C    mov         eax,ebx
 0001896E    pop         esi
 0001896F    pop         ebx
 00018970    mov         esp,ebp
 00018972    pop         ebp
 00018973    ret
*}
end;

//00018974
function FileGetAttr(const FileName:AnsiString):Integer;
begin
{*
 00018974    push        ebx
 00018975    mov         ebx,eax
 00018977    mov         eax,ebx
 00018979    call        @LStrToPChar
 0001897E    push        eax
 0001897F    call        kernel32.GetFileAttributesA
 00018984    pop         ebx
 00018985    ret
*}
end;

//00018988
function FindMatchingFile(var F:TSearchRec):Integer;
begin
{*
 00018988    push        ebx
 00018989    add         esp,0FFFFFFF8
 0001898C    mov         ebx,eax
>0001898E    jmp         000189A8
 00018990    lea         eax,[ebx+18]
 00018993    push        eax
 00018994    mov         eax,dword ptr [ebx+14]
 00018997    push        eax
 00018998    call        kernel32.FindNextFileA
 0001899D    test        eax,eax
>0001899F    jne         000189A8
 000189A1    call        kernel32.GetLastError
>000189A6    jmp         000189E7
 000189A8    mov         eax,dword ptr [ebx+18]
 000189AB    and         eax,dword ptr [ebx+10]
>000189AE    jne         00018990
 000189B0    push        esp
 000189B1    lea         eax,[ebx+2C]
 000189B4    push        eax
 000189B5    call        kernel32.FileTimeToLocalFileTime
 000189BA    push        ebx
 000189BB    lea         eax,[ebx+2]
 000189BE    push        eax
 000189BF    lea         eax,[esp+8]
 000189C3    push        eax
 000189C4    call        kernel32.FileTimeToDosDateTime
 000189C9    mov         eax,dword ptr [ebx+38]
 000189CC    mov         dword ptr [ebx+4],eax
 000189CF    mov         eax,dword ptr [ebx+18]
 000189D2    mov         dword ptr [ebx+8],eax
 000189D5    lea         eax,[ebx+0C]
 000189D8    lea         edx,[ebx+44]
 000189DB    mov         ecx,104
 000189E0    call        @LStrFromArray
 000189E5    xor         eax,eax
 000189E7    pop         ecx
 000189E8    pop         edx
 000189E9    pop         ebx
 000189EA    ret
*}
end;

//000189EC
function FindFirst(const Path:AnsiString; Attr:Integer; var F:TSearchRec):Integer;
begin
{*
 000189EC    push        ebx
 000189ED    push        esi
 000189EE    push        edi
 000189EF    mov         ebx,ecx
 000189F1    mov         edi,eax
 000189F3    not         edx
 000189F5    and         edx,1E
 000189F8    mov         dword ptr [ebx+10],edx
 000189FB    lea         eax,[ebx+18]
 000189FE    push        eax
 000189FF    mov         eax,edi
 00018A01    call        @LStrToPChar
 00018A06    push        eax
 00018A07    call        kernel32.FindFirstFileA
 00018A0C    mov         esi,eax
 00018A0E    mov         dword ptr [ebx+14],esi
 00018A11    cmp         esi,0FFFFFFFF
>00018A14    je          00018A2C
 00018A16    mov         eax,ebx
 00018A18    call        FindMatchingFile
 00018A1D    mov         esi,eax
 00018A1F    test        esi,esi
>00018A21    je          00018A33
 00018A23    mov         eax,ebx
 00018A25    call        FindClose
>00018A2A    jmp         00018A33
 00018A2C    call        kernel32.GetLastError
 00018A31    mov         esi,eax
 00018A33    mov         eax,esi
 00018A35    pop         edi
 00018A36    pop         esi
 00018A37    pop         ebx
 00018A38    ret
*}
end;

//00018A3C
function FindNext(var F:TSearchRec):Integer;
begin
{*
 00018A3C    push        ebx
 00018A3D    mov         ebx,eax
 00018A3F    lea         eax,[ebx+18]
 00018A42    push        eax
 00018A43    mov         eax,dword ptr [ebx+14]
 00018A46    push        eax
 00018A47    call        kernel32.FindNextFileA
 00018A4C    test        eax,eax
>00018A4E    je          00018A59
 00018A50    mov         eax,ebx
 00018A52    call        FindMatchingFile
 00018A57    pop         ebx
 00018A58    ret
 00018A59    call        kernel32.GetLastError
 00018A5E    pop         ebx
 00018A5F    ret
*}
end;

//00018A60
procedure FindClose(var F:TSearchRec);
begin
{*
 00018A60    mov         edx,dword ptr [eax+14]
 00018A63    cmp         edx,0FFFFFFFF
>00018A66    je          00018A6E
 00018A68    push        edx
 00018A69    call        kernel32.FindClose
 00018A6E    ret
*}
end;

//00018A70
function DeleteFile(const FileName:AnsiString):Boolean;
begin
{*
 00018A70    push        ebx
 00018A71    mov         ebx,eax
 00018A73    mov         eax,ebx
 00018A75    call        @LStrToPChar
 00018A7A    push        eax
 00018A7B    call        kernel32.DeleteFileA
 00018A80    neg         eax
 00018A82    sbb         eax,eax
 00018A84    neg         eax
 00018A86    pop         ebx
 00018A87    ret
*}
end;

//00018A88
function AnsiLastChar(const S:AnsiString):PChar;
begin
{*
 00018A88    push        ebx
 00018A89    push        esi
 00018A8A    push        edi
 00018A8B    mov         esi,eax
 00018A8D    mov         eax,esi
 00018A8F    call        @LStrLen
 00018A94    mov         ebx,eax
 00018A96    test        ebx,ebx
>00018A98    je          00018AAE
 00018A9A    lea         edi,[esi+ebx-1]
 00018A9E    mov         edx,ebx
 00018AA0    mov         eax,esi
 00018AA2    call        ByteType
 00018AA7    cmp         al,2
>00018AA9    jne         00018AB0
 00018AAB    dec         edi
>00018AAC    jmp         00018AB0
 00018AAE    xor         edi,edi
 00018AB0    mov         eax,edi
 00018AB2    pop         edi
 00018AB3    pop         esi
 00018AB4    pop         ebx
 00018AB5    ret
*}
end;

//00018AB8
function LastDelimiter(const Delimiters:AnsiString; const S:AnsiString):Integer;
begin
{*
 00018AB8    push        ebx
 00018AB9    push        esi
 00018ABA    push        edi
 00018ABB    push        ebp
 00018ABC    mov         esi,edx
 00018ABE    mov         ebx,eax
 00018AC0    mov         eax,esi
 00018AC2    call        @LStrLen
 00018AC7    mov         edi,eax
 00018AC9    mov         eax,ebx
 00018ACB    call        @LStrToPChar
 00018AD0    mov         ebp,eax
 00018AD2    test        edi,edi
>00018AD4    jle         00018AFE
 00018AD6    mov         bl,byte ptr [esi+edi-1]
 00018ADA    test        bl,bl
>00018ADC    je          00018AF9
 00018ADE    mov         edx,ebx
 00018AE0    mov         eax,ebp
 00018AE2    call        StrScan
 00018AE7    test        eax,eax
>00018AE9    je          00018AF9
 00018AEB    mov         edx,edi
 00018AED    mov         eax,esi
 00018AEF    call        ByteType
 00018AF4    cmp         al,2
>00018AF6    jne         00018AFE
 00018AF8    dec         edi
 00018AF9    dec         edi
 00018AFA    test        edi,edi
>00018AFC    jg          00018AD6
 00018AFE    mov         eax,edi
 00018B00    pop         ebp
 00018B01    pop         edi
 00018B02    pop         esi
 00018B03    pop         ebx
 00018B04    ret
*}
end;

//00018B08
function ChangeFileExt(const FileName:AnsiString; const Extension:AnsiString):AnsiString;
begin
{*
 00018B08    push        ebp
 00018B09    mov         ebp,esp
 00018B0B    add         esp,0FFFFFFF8
 00018B0E    push        ebx
 00018B0F    push        esi
 00018B10    push        edi
 00018B11    xor         ebx,ebx
 00018B13    mov         dword ptr [ebp-8],ebx
 00018B16    mov         dword ptr [ebp-4],ecx
 00018B19    mov         edi,edx
 00018B1B    mov         esi,eax
 00018B1D    xor         eax,eax
 00018B1F    push        ebp
 00018B20    push        18B7F
 00018B25    push        dword ptr fs:[eax]
 00018B28    mov         dword ptr fs:[eax],esp
 00018B2B    mov         edx,esi
 00018B2D    mov         eax,18B98;'.\:'
 00018B32    call        LastDelimiter
 00018B37    mov         ebx,eax
 00018B39    test        ebx,ebx
>00018B3B    je          00018B44
 00018B3D    cmp         byte ptr [esi+ebx-1],2E
>00018B42    je          00018B49
 00018B44    mov         ebx,7FFFFFFF
 00018B49    lea         eax,[ebp-8]
 00018B4C    push        eax
 00018B4D    mov         ecx,ebx
 00018B4F    dec         ecx
 00018B50    mov         edx,1
 00018B55    mov         eax,esi
 00018B57    call        @LStrCopy
 00018B5C    mov         edx,dword ptr [ebp-8]
 00018B5F    mov         eax,dword ptr [ebp-4]
 00018B62    mov         ecx,edi
 00018B64    call        @LStrCat3
 00018B69    xor         eax,eax
 00018B6B    pop         edx
 00018B6C    pop         ecx
 00018B6D    pop         ecx
 00018B6E    mov         dword ptr fs:[eax],edx
 00018B71    push        18B86
 00018B76    lea         eax,[ebp-8]
 00018B79    call        @LStrClr
 00018B7E    ret
>00018B7F    jmp         @HandleFinally
>00018B84    jmp         00018B76
 00018B86    pop         edi
 00018B87    pop         esi
 00018B88    pop         ebx
 00018B89    pop         ecx
 00018B8A    pop         ecx
 00018B8B    pop         ebp
 00018B8C    ret
*}
end;

//00018B9C
function ExtractFilePath(const FileName:AnsiString):AnsiString;
begin
{*
 00018B9C    push        ebx
 00018B9D    push        esi
 00018B9E    push        edi
 00018B9F    mov         edi,edx
 00018BA1    mov         ebx,eax
 00018BA3    mov         edx,ebx
 00018BA5    mov         eax,18BCC;'\:'
 00018BAA    call        LastDelimiter
 00018BAF    mov         esi,eax
 00018BB1    push        edi
 00018BB2    mov         ecx,esi
 00018BB4    mov         edx,1
 00018BB9    mov         eax,ebx
 00018BBB    call        @LStrCopy
 00018BC0    pop         edi
 00018BC1    pop         esi
 00018BC2    pop         ebx
 00018BC3    ret
*}
end;

//00018BD0
function ExtractFileDir(const FileName:AnsiString):AnsiString;
begin
{*
 00018BD0    push        ebx
 00018BD1    push        esi
 00018BD2    push        edi
 00018BD3    mov         edi,edx
 00018BD5    mov         esi,eax
 00018BD7    mov         edx,esi
 00018BD9    mov         eax,18C28;'\:'
 00018BDE    call        LastDelimiter
 00018BE3    mov         ebx,eax
 00018BE5    cmp         ebx,1
>00018BE8    jle         00018C0C
 00018BEA    cmp         byte ptr [esi+ebx-1],5C
>00018BEF    jne         00018C0C
 00018BF1    mov         al,byte ptr [esi+ebx-2]
 00018BF5    sub         al,3A
>00018BF7    je          00018BFD
 00018BF9    sub         al,22
>00018BFB    jne         00018C0B
 00018BFD    mov         edx,ebx
 00018BFF    dec         edx
 00018C00    mov         eax,esi
 00018C02    call        ByteType
 00018C07    cmp         al,2
>00018C09    jne         00018C0C
 00018C0B    dec         ebx
 00018C0C    push        edi
 00018C0D    mov         ecx,ebx
 00018C0F    mov         edx,1
 00018C14    mov         eax,esi
 00018C16    call        @LStrCopy
 00018C1B    pop         edi
 00018C1C    pop         esi
 00018C1D    pop         ebx
 00018C1E    ret
*}
end;

//00018C2C
function ExtractFileDrive(const FileName:AnsiString):AnsiString;
begin
{*
 00018C2C    push        ebx
 00018C2D    push        esi
 00018C2E    push        edi
 00018C2F    push        ebp
 00018C30    mov         ebp,edx
 00018C32    mov         ebx,eax
 00018C34    mov         eax,ebx
 00018C36    call        @LStrLen
 00018C3B    cmp         eax,2
>00018C3E    jl          00018C5A
 00018C40    cmp         byte ptr [ebx+1],3A
>00018C44    jne         00018C5A
 00018C46    push        ebp
 00018C47    mov         ecx,2
 00018C4C    mov         edx,1
 00018C51    mov         eax,ebx
 00018C53    call        @LStrCopy
>00018C58    jmp         00018CB8
 00018C5A    mov         eax,ebx
 00018C5C    call        @LStrLen
 00018C61    cmp         eax,2
>00018C64    jl          00018CB1
 00018C66    cmp         byte ptr [ebx],5C
>00018C69    jne         00018CB1
 00018C6B    cmp         byte ptr [ebx+1],5C
>00018C6F    jne         00018CB1
 00018C71    xor         edi,edi
 00018C73    mov         esi,3
>00018C78    jmp         00018C88
 00018C7A    cmp         byte ptr [ebx+esi-1],5C
>00018C7F    jne         00018C82
 00018C81    inc         edi
 00018C82    cmp         edi,2
>00018C85    jge         00018C88
 00018C87    inc         esi
 00018C88    mov         eax,ebx
 00018C8A    call        @LStrLen
 00018C8F    cmp         esi,eax
>00018C91    jge         00018C98
 00018C93    cmp         edi,2
>00018C96    jl          00018C7A
 00018C98    cmp         byte ptr [ebx+esi-1],5C
>00018C9D    jne         00018CA0
 00018C9F    dec         esi
 00018CA0    push        ebp
 00018CA1    mov         ecx,esi
 00018CA3    mov         edx,1
 00018CA8    mov         eax,ebx
 00018CAA    call        @LStrCopy
>00018CAF    jmp         00018CB8
 00018CB1    mov         eax,ebp
 00018CB3    call        @LStrClr
 00018CB8    pop         ebp
 00018CB9    pop         edi
 00018CBA    pop         esi
 00018CBB    pop         ebx
 00018CBC    ret
*}
end;

//00018CC0
function ExtractFileName(const FileName:AnsiString):AnsiString;
begin
{*
 00018CC0    push        ebx
 00018CC1    push        esi
 00018CC2    push        edi
 00018CC3    mov         edi,edx
 00018CC5    mov         ebx,eax
 00018CC7    mov         edx,ebx
 00018CC9    mov         eax,18CF4;'\:'
 00018CCE    call        LastDelimiter
 00018CD3    mov         esi,eax
 00018CD5    push        edi
 00018CD6    lea         edx,[esi+1]
 00018CD9    mov         ecx,7FFFFFFF
 00018CDE    mov         eax,ebx
 00018CE0    call        @LStrCopy
 00018CE5    pop         edi
 00018CE6    pop         esi
 00018CE7    pop         ebx
 00018CE8    ret
*}
end;

//00018CF8
function ExtractFileExt(const FileName:AnsiString):AnsiString;
begin
{*
 00018CF8    push        ebx
 00018CF9    push        esi
 00018CFA    push        edi
 00018CFB    mov         edi,edx
 00018CFD    mov         esi,eax
 00018CFF    mov         edx,esi
 00018D01    mov         eax,18D3C;'.\:'
 00018D06    call        LastDelimiter
 00018D0B    mov         ebx,eax
 00018D0D    test        ebx,ebx
>00018D0F    jle         00018D29
 00018D11    cmp         byte ptr [esi+ebx-1],2E
>00018D16    jne         00018D29
 00018D18    push        edi
 00018D19    mov         ecx,7FFFFFFF
 00018D1E    mov         edx,ebx
 00018D20    mov         eax,esi
 00018D22    call        @LStrCopy
>00018D27    jmp         00018D30
 00018D29    mov         eax,edi
 00018D2B    call        @LStrClr
 00018D30    pop         edi
 00018D31    pop         esi
 00018D32    pop         ebx
 00018D33    ret
*}
end;

//00018D40
function ExpandFileName(const FileName:AnsiString):AnsiString;
begin
{*
 00018D40    push        ebx
 00018D41    push        esi
 00018D42    add         esp,0FFFFFEF8
 00018D48    mov         esi,edx
 00018D4A    mov         ebx,eax
 00018D4C    push        esp
 00018D4D    lea         eax,[esp+8]
 00018D51    push        eax
 00018D52    push        104
 00018D57    mov         eax,ebx
 00018D59    call        @LStrToPChar
 00018D5E    push        eax
 00018D5F    call        kernel32.GetFullPathNameA
 00018D64    mov         ecx,eax
 00018D66    lea         edx,[esp+4]
 00018D6A    mov         eax,esi
 00018D6C    call        @LStrFromPCharLen
 00018D71    add         esp,108
 00018D77    pop         esi
 00018D78    pop         ebx
 00018D79    ret
*}
end;

//00018D7C
function BackfillGetDiskFreeSpaceEx(Directory:PChar; var FreeAvailable:TLargeInteger; var TotalSpace:TLargeInteger; TotalFree:PLargeInteger):BOOL; stdcall;
begin
{*
 00018D7C    push        ebp
 00018D7D    mov         ebp,esp
 00018D7F    add         esp,0FFFFFFE8
 00018D82    push        ebx
 00018D83    mov         eax,dword ptr [ebp+8]
 00018D86    test        eax,eax
>00018D88    jne         00018D8C
 00018D8A    xor         eax,eax
 00018D8C    lea         edx,[ebp-10]
 00018D8F    push        edx
 00018D90    lea         edx,[ebp-0C]
 00018D93    push        edx
 00018D94    lea         edx,[ebp-8]
 00018D97    push        edx
 00018D98    lea         edx,[ebp-4]
 00018D9B    push        edx
 00018D9C    push        eax
 00018D9D    call        kernel32.GetDiskFreeSpaceA
 00018DA2    mov         ebx,eax
 00018DA4    mov         eax,dword ptr [ebp-4]
 00018DA7    imul        dword ptr [ebp-8]
 00018DAA    xor         edx,edx
 00018DAC    mov         dword ptr [ebp-18],eax
 00018DAF    mov         dword ptr [ebp-14],edx
 00018DB2    mov         eax,dword ptr [ebp-0C]
 00018DB5    xor         edx,edx
 00018DB7    push        edx
 00018DB8    push        eax
 00018DB9    mov         eax,dword ptr [ebp-18]
 00018DBC    mov         edx,dword ptr [ebp-14]
 00018DBF    call        @_llmul
 00018DC4    mov         ecx,dword ptr [ebp+0C]
 00018DC7    mov         dword ptr [ecx],eax
 00018DC9    mov         dword ptr [ecx+4],edx
 00018DCC    mov         eax,dword ptr [ebp-10]
 00018DCF    xor         edx,edx
 00018DD1    push        edx
 00018DD2    push        eax
 00018DD3    mov         eax,dword ptr [ebp-18]
 00018DD6    mov         edx,dword ptr [ebp-14]
 00018DD9    call        @_llmul
 00018DDE    mov         ecx,dword ptr [ebp+10]
 00018DE1    mov         dword ptr [ecx],eax
 00018DE3    mov         dword ptr [ecx+4],edx
 00018DE6    mov         eax,ebx
 00018DE8    pop         ebx
 00018DE9    mov         esp,ebp
 00018DEB    pop         ebp
 00018DEC    ret         10
*}
end;

//00018DF0
function FileDateToDateTime(FileDate:Integer):TDateTime;
begin
{*
 00018DF0    push        ebp
 00018DF1    mov         ebp,esp
 00018DF3    add         esp,0FFFFFFEC
 00018DF6    push        ebx
 00018DF7    push        esi
 00018DF8    push        edi
 00018DF9    mov         dword ptr [ebp-4],eax
 00018DFC    mov         si,word ptr [ebp-2]
 00018E00    mov         ecx,esi
 00018E02    and         cx,1F
 00018E06    movzx       ebx,word ptr [ebp-2]
 00018E0A    mov         edx,ebx
 00018E0C    shr         edx,5
 00018E0F    and         dx,0F
 00018E13    mov         eax,ebx
 00018E15    shr         eax,9
 00018E18    add         ax,7BC
 00018E1C    call        EncodeDate
 00018E21    fstp        qword ptr [ebp-14]
 00018E24    wait
 00018E25    push        0
 00018E27    mov         cx,word ptr [ebp-4]
 00018E2B    and         cx,1F
 00018E2F    add         ecx,ecx
 00018E31    movzx       edi,word ptr [ebp-4]
 00018E35    mov         edx,edi
 00018E37    shr         edx,5
 00018E3A    and         dx,3F
 00018E3E    mov         eax,edi
 00018E40    shr         eax,0B
 00018E43    call        EncodeTime
 00018E48    fadd        qword ptr [ebp-14]
 00018E4B    fstp        qword ptr [ebp-0C]
 00018E4E    wait
 00018E4F    fld         qword ptr [ebp-0C]
 00018E52    pop         edi
 00018E53    pop         esi
 00018E54    pop         ebx
 00018E55    mov         esp,ebp
 00018E57    pop         ebp
 00018E58    ret
*}
end;

//00018E5C
function DateTimeToFileDate(DateTime:TDateTime):Integer;
begin
{*
 00018E5C    push        ebp
 00018E5D    mov         ebp,esp
 00018E5F    add         esp,0FFFFFFEC
 00018E62    push        dword ptr [ebp+0C]
 00018E65    push        dword ptr [ebp+8]
 00018E68    lea         ecx,[ebp-0A]
 00018E6B    lea         edx,[ebp-8]
 00018E6E    lea         eax,[ebp-6]
 00018E71    call        DecodeDate
 00018E76    cmp         word ptr [ebp-6],7BC
>00018E7C    jb          00018E86
 00018E7E    cmp         word ptr [ebp-6],833
>00018E84    jbe         00018E8D
 00018E86    xor         eax,eax
 00018E88    mov         dword ptr [ebp-4],eax
>00018E8B    jmp         00018EE1
 00018E8D    push        dword ptr [ebp+0C]
 00018E90    push        dword ptr [ebp+8]
 00018E93    lea         eax,[ebp-12]
 00018E96    push        eax
 00018E97    lea         ecx,[ebp-10]
 00018E9A    lea         edx,[ebp-0E]
 00018E9D    lea         eax,[ebp-0C]
 00018EA0    call        DecodeTime
 00018EA5    movzx       eax,word ptr [ebp-10]
 00018EA9    shr         eax,1
 00018EAB    mov         dx,word ptr [ebp-0E]
 00018EAF    shl         edx,5
 00018EB2    or          ax,dx
 00018EB5    mov         dx,word ptr [ebp-0C]
 00018EB9    shl         edx,0B
 00018EBC    or          ax,dx
 00018EBF    mov         word ptr [ebp-4],ax
 00018EC3    mov         ax,word ptr [ebp-8]
 00018EC7    shl         eax,5
 00018ECA    or          ax,word ptr [ebp-0A]
 00018ECE    mov         dx,word ptr [ebp-6]
 00018ED2    sub         dx,7BC
 00018ED7    shl         edx,9
 00018EDA    or          ax,dx
 00018EDD    mov         word ptr [ebp-2],ax
 00018EE1    mov         eax,dword ptr [ebp-4]
 00018EE4    mov         esp,ebp
 00018EE6    pop         ebp
 00018EE7    ret         8
*}
end;

//00018EEC
function StrLen(Str:PChar):Cardinal;
begin
{*
 00018EEC    mov         edx,edi
 00018EEE    mov         edi,eax
 00018EF0    mov         ecx,0FFFFFFFF
 00018EF5    xor         al,al
 00018EF7    repne scas  byte ptr [edi]
 00018EF9    mov         eax,0FFFFFFFE
 00018EFE    sub         eax,ecx
 00018F00    mov         edi,edx
 00018F02    ret
*}
end;

//00018F04
function StrEnd(Str:PChar):PChar;
begin
{*
 00018F04    mov         edx,edi
 00018F06    mov         edi,eax
 00018F08    mov         ecx,0FFFFFFFF
 00018F0D    xor         al,al
 00018F0F    repne scas  byte ptr [edi]
 00018F11    lea         eax,[edi-1]
 00018F14    mov         edi,edx
 00018F16    ret
*}
end;

//00018F18
function StrMove(Dest:PChar; Source:PChar; Count:Cardinal):PChar;
begin
{*
 00018F18    push        esi
 00018F19    push        edi
 00018F1A    mov         esi,edx
 00018F1C    mov         edi,eax
 00018F1E    mov         edx,ecx
 00018F20    cmp         edi,esi
>00018F22    ja          00018F35
>00018F24    je          00018F51
 00018F26    shr         ecx,2
 00018F29    rep movs    dword ptr [edi],dword ptr [esi]
 00018F2B    mov         ecx,edx
 00018F2D    and         ecx,3
 00018F30    rep movs    byte ptr [edi],byte ptr [esi]
 00018F32    pop         edi
 00018F33    pop         esi
 00018F34    ret
 00018F35    lea         esi,[esi+ecx-1]
 00018F39    lea         edi,[edi+ecx-1]
 00018F3D    and         ecx,3
 00018F40    std
 00018F41    rep movs    byte ptr [edi],byte ptr [esi]
 00018F43    sub         esi,3
 00018F46    sub         edi,3
 00018F49    mov         ecx,edx
 00018F4B    shr         ecx,2
 00018F4E    rep movs    dword ptr [edi],dword ptr [esi]
 00018F50    cld
 00018F51    pop         edi
 00018F52    pop         esi
 00018F53    ret
*}
end;

//00018F54
function StrCopy(Dest:PChar; Source:PChar):PChar;
begin
{*
 00018F54    push        edi
 00018F55    push        esi
 00018F56    mov         esi,eax
 00018F58    mov         edi,edx
 00018F5A    mov         ecx,0FFFFFFFF
 00018F5F    xor         al,al
 00018F61    repne scas  byte ptr [edi]
 00018F63    not         ecx
 00018F65    mov         edi,esi
 00018F67    mov         esi,edx
 00018F69    mov         edx,ecx
 00018F6B    mov         eax,edi
 00018F6D    shr         ecx,2
 00018F70    rep movs    dword ptr [edi],dword ptr [esi]
 00018F72    mov         ecx,edx
 00018F74    and         ecx,3
 00018F77    rep movs    byte ptr [edi],byte ptr [esi]
 00018F79    pop         esi
 00018F7A    pop         edi
 00018F7B    ret
*}
end;

//00018F7C
function StrECopy(Dest:PChar; Source:PChar):PChar;
begin
{*
 00018F7C    push        edi
 00018F7D    push        esi
 00018F7E    mov         esi,eax
 00018F80    mov         edi,edx
 00018F82    mov         ecx,0FFFFFFFF
 00018F87    xor         al,al
 00018F89    repne scas  byte ptr [edi]
 00018F8B    not         ecx
 00018F8D    mov         edi,esi
 00018F8F    mov         esi,edx
 00018F91    mov         edx,ecx
 00018F93    shr         ecx,2
 00018F96    rep movs    dword ptr [edi],dword ptr [esi]
 00018F98    mov         ecx,edx
 00018F9A    and         ecx,3
 00018F9D    rep movs    byte ptr [edi],byte ptr [esi]
 00018F9F    lea         eax,[edi-1]
 00018FA2    pop         esi
 00018FA3    pop         edi
 00018FA4    ret
*}
end;

//00018FA8
function StrLCopy(Dest:PChar; Source:PChar; MaxLen:Cardinal):PChar;
begin
{*
 00018FA8    push        edi
 00018FA9    push        esi
 00018FAA    push        ebx
 00018FAB    mov         esi,eax
 00018FAD    mov         edi,edx
 00018FAF    mov         ebx,ecx
 00018FB1    xor         al,al
 00018FB3    test        ecx,ecx
>00018FB5    je          00018FBC
 00018FB7    repne scas  byte ptr [edi]
>00018FB9    jne         00018FBC
 00018FBB    inc         ecx
 00018FBC    sub         ebx,ecx
 00018FBE    mov         edi,esi
 00018FC0    mov         esi,edx
 00018FC2    mov         edx,edi
 00018FC4    mov         ecx,ebx
 00018FC6    shr         ecx,2
 00018FC9    rep movs    dword ptr [edi],dword ptr [esi]
 00018FCB    mov         ecx,ebx
 00018FCD    and         ecx,3
 00018FD0    rep movs    byte ptr [edi],byte ptr [esi]
 00018FD2    stos        byte ptr [edi]
 00018FD3    mov         eax,edx
 00018FD5    pop         ebx
 00018FD6    pop         esi
 00018FD7    pop         edi
 00018FD8    ret
*}
end;

//00018FDC
function StrPCopy(Dest:PChar; const Source:AnsiString):PChar;
begin
{*
 00018FDC    push        ebx
 00018FDD    push        esi
 00018FDE    mov         ebx,edx
 00018FE0    mov         esi,eax
 00018FE2    mov         eax,ebx
 00018FE4    call        @LStrLen
 00018FE9    push        eax
 00018FEA    mov         eax,ebx
 00018FEC    call        @LStrToPChar
 00018FF1    mov         edx,eax
 00018FF3    mov         eax,esi
 00018FF5    pop         ecx
 00018FF6    call        StrLCopy
 00018FFB    pop         esi
 00018FFC    pop         ebx
 00018FFD    ret
*}
end;

//00019000
function StrPLCopy(Dest:PChar; const Source:AnsiString; MaxLen:Cardinal):PChar;
begin
{*
 00019000    push        ebx
 00019001    push        esi
 00019002    push        edi
 00019003    mov         edi,ecx
 00019005    mov         esi,edx
 00019007    mov         ebx,eax
 00019009    mov         eax,esi
 0001900B    call        @LStrToPChar
 00019010    mov         edx,eax
 00019012    mov         ecx,edi
 00019014    mov         eax,ebx
 00019016    call        StrLCopy
 0001901B    pop         edi
 0001901C    pop         esi
 0001901D    pop         ebx
 0001901E    ret
*}
end;

//00019020
function StrCat(Dest:PChar; Source:PChar):PChar;
begin
{*
 00019020    push        ebx
 00019021    push        esi
 00019022    mov         esi,edx
 00019024    mov         ebx,eax
 00019026    mov         eax,ebx
 00019028    call        StrEnd
 0001902D    mov         edx,esi
 0001902F    call        StrCopy
 00019034    mov         eax,ebx
 00019036    pop         esi
 00019037    pop         ebx
 00019038    ret
*}
end;

//0001903C
function StrComp(Str1:PChar; Str2:PChar):Integer;
begin
{*
 0001903C    push        edi
 0001903D    push        esi
 0001903E    mov         edi,edx
 00019040    mov         esi,eax
 00019042    mov         ecx,0FFFFFFFF
 00019047    xor         eax,eax
 00019049    repne scas  byte ptr [edi]
 0001904B    not         ecx
 0001904D    mov         edi,edx
 0001904F    xor         edx,edx
 00019051    repe cmps   byte ptr [esi],byte ptr [edi]
 00019053    mov         al,byte ptr [esi-1]
 00019056    mov         dl,byte ptr [edi-1]
 00019059    sub         eax,edx
 0001905B    pop         esi
 0001905C    pop         edi
 0001905D    ret
*}
end;

//00019060
function StrLIComp(Str1:PChar; Str2:PChar; MaxLen:Cardinal):Integer;
begin
{*
 00019060    push        edi
 00019061    push        esi
 00019062    push        ebx
 00019063    mov         edi,edx
 00019065    mov         esi,eax
 00019067    mov         ebx,ecx
 00019069    xor         eax,eax
 0001906B    or          ecx,ecx
>0001906D    je          000190A1
 0001906F    repne scas  byte ptr [edi]
 00019071    sub         ebx,ecx
 00019073    mov         ecx,ebx
 00019075    mov         edi,edx
 00019077    xor         edx,edx
 00019079    repe cmps   byte ptr [esi],byte ptr [edi]
>0001907B    je          000190A1
 0001907D    mov         al,byte ptr [esi-1]
 00019080    cmp         al,61
>00019083    jb          0001908D
 00019085    cmp         al,7A
>00019088    ja          0001908D
 0001908A    sub         al,20
 0001908D    mov         dl,byte ptr [edi-1]
 00019090    cmp         dl,61
>00019093    jb          0001909D
 00019095    cmp         dl,7A
>00019098    ja          0001909D
 0001909A    sub         dl,20
 0001909D    sub         eax,edx
>0001909F    je          00019079
 000190A1    pop         ebx
 000190A2    pop         esi
 000190A3    pop         edi
 000190A4    ret
*}
end;

//000190A8
function StrScan(Str:PChar; Chr:Char):PChar;
begin
{*
 000190A8    push        edi
 000190A9    push        eax
 000190AA    mov         edi,eax
 000190AC    mov         ecx,0FFFFFFFF
 000190B1    xor         al,al
 000190B3    repne scas  byte ptr [edi]
 000190B5    not         ecx
 000190B7    pop         edi
 000190B8    mov         al,dl
 000190BA    repne scas  byte ptr [edi]
 000190BC    mov         eax,0
>000190C1    jne         000190C6
 000190C3    mov         eax,edi
 000190C5    dec         eax
 000190C6    pop         edi
 000190C7    ret
*}
end;

//000190C8
function StrPos(Str1:PChar; Str2:PChar):PChar;
begin
{*
 000190C8    push        edi
 000190C9    push        esi
 000190CA    push        ebx
 000190CB    or          eax,eax
>000190CD    je          00019113
 000190CF    or          edx,edx
>000190D1    je          00019113
 000190D3    mov         ebx,eax
 000190D5    mov         edi,edx
 000190D7    xor         al,al
 000190D9    mov         ecx,0FFFFFFFF
 000190DE    repne scas  byte ptr [edi]
 000190E0    not         ecx
 000190E2    dec         ecx
>000190E3    je          00019113
 000190E5    mov         esi,ecx
 000190E7    mov         edi,ebx
 000190E9    mov         ecx,0FFFFFFFF
 000190EE    repne scas  byte ptr [edi]
 000190F0    not         ecx
 000190F2    sub         ecx,esi
>000190F4    jbe         00019113
 000190F6    mov         edi,ebx
 000190F8    lea         ebx,[esi-1]
 000190FB    mov         esi,edx
 000190FD    lods        byte ptr [esi]
 000190FE    repne scas  byte ptr [edi]
>00019100    jne         00019113
 00019102    mov         eax,ecx
 00019104    push        edi
 00019105    mov         ecx,ebx
 00019107    repe cmps   byte ptr [esi],byte ptr [edi]
 00019109    pop         edi
 0001910A    mov         ecx,eax
>0001910C    jne         000190FB
 0001910E    lea         eax,[edi-1]
>00019111    jmp         00019115
 00019113    xor         eax,eax
 00019115    pop         ebx
 00019116    pop         esi
 00019117    pop         edi
 00019118    ret
*}
end;

//0001911C
function StrPas(Str:PChar):AnsiString;
begin
{*
 0001911C    push        ebx
 0001911D    push        esi
 0001911E    mov         esi,edx
 00019120    mov         ebx,eax
 00019122    mov         eax,esi
 00019124    mov         edx,ebx
 00019126    call        @LStrFromPChar
 0001912B    pop         esi
 0001912C    pop         ebx
 0001912D    ret
*}
end;

//00019130
function StrAlloc(Size:Cardinal):PChar;
begin
{*
 00019130    push        ebx
 00019131    mov         ebx,eax
 00019133    add         ebx,4
 00019136    mov         eax,ebx
 00019138    call        @GetMem
 0001913D    mov         dword ptr [eax],ebx
 0001913F    add         eax,4
 00019142    pop         ebx
 00019143    ret
*}
end;

//00019144
function StrBufSize(Str:PChar):Cardinal;
begin
{*
 00019144    sub         eax,4
 00019147    mov         eax,dword ptr [eax]
 00019149    sub         eax,4
 0001914C    ret
*}
end;

//00019150
function StrNew(Str:PChar):PChar;
begin
{*
 00019150    push        ebx
 00019151    push        esi
 00019152    mov         ebx,eax
 00019154    test        ebx,ebx
>00019156    jne         0001915D
 00019158    xor         eax,eax
 0001915A    pop         esi
 0001915B    pop         ebx
 0001915C    ret
 0001915D    mov         eax,ebx
 0001915F    call        StrLen
 00019164    mov         esi,eax
 00019166    inc         esi
 00019167    mov         eax,esi
 00019169    call        StrAlloc
 0001916E    mov         ecx,esi
 00019170    mov         edx,ebx
 00019172    call        StrMove
 00019177    pop         esi
 00019178    pop         ebx
 00019179    ret
*}
end;

//0001917C
procedure StrDispose(Str:PChar);
begin
{*
 0001917C    test        eax,eax
>0001917E    je          0001918A
 00019180    sub         eax,4
 00019183    mov         edx,dword ptr [eax]
 00019185    call        @FreeMem
 0001918A    ret
*}
end;

//0001918C
procedure FormatError(ErrorCode:Integer; Format:PChar; FmtLen:Cardinal);
begin
{*
 0001918C    push        ebx
 0001918D    push        esi
 0001918E    push        edi
 0001918F    add         esp,0FFFFFFD8
 00019192    mov         ebx,ecx
 00019194    mov         esi,edx
 00019196    mov         edi,eax
 00019198    cmp         ebx,1F
>0001919B    jbe         000191A2
 0001919D    mov         ebx,1F
 000191A2    mov         edx,ebx
 000191A4    dec         edx
 000191A5    mov         eax,esi
 000191A7    call        StrByteType
 000191AC    cmp         al,1
>000191AE    jne         000191B1
 000191B0    dec         ebx
 000191B1    mov         eax,esp
 000191B3    mov         ecx,ebx
 000191B5    mov         edx,esi
 000191B7    call        StrMove
 000191BC    mov         byte ptr [esp+ebx],0
 000191C0    mov         eax,esp
 000191C2    mov         dword ptr [esp+20],eax
 000191C6    mov         byte ptr [esp+24],6
 000191CB    lea         edx,[esp+20]
 000191CF    mov         eax,dword ptr [edi*4+0B41B0]
 000191D6    xor         ecx,ecx
 000191D8    call        ConvertErrorFmt
 000191DD    add         esp,28
 000191E0    pop         edi
 000191E1    pop         esi
 000191E2    pop         ebx
 000191E3    ret
*}
end;

//000191E4
procedure FormatVarToStr(var S:AnsiString; const V:Variant);
begin
{*
 000191E4    push        ebx
 000191E5    push        esi
 000191E6    mov         esi,edx
 000191E8    mov         ebx,eax
 000191EA    mov         eax,ebx
 000191EC    mov         edx,esi
 000191EE    call        @VarToLStr
 000191F3    pop         esi
 000191F4    pop         ebx
 000191F5    ret
*}
end;

//000191F8
procedure FormatClearStr(var S:AnsiString);
begin
{*
 000191F8    push        ebx
 000191F9    mov         ebx,eax
 000191FB    mov         eax,ebx
 000191FD    call        @LStrClr
 00019202    pop         ebx
 00019203    ret
*}
end;

//00019204
function FormatBuf(var Buffer:void ; BufLen:Cardinal; const Format:void ; FmtLen:Cardinal; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1):Cardinal;
begin
{*
 00019204    push        ebp
 00019205    mov         ebp,esp
 00019207    add         esp,0FFFFFF8C
 0001920A    push        ebx
 0001920B    xor         ebx,ebx
 0001920D    mov         dword ptr [ebp-10],ebx
 00019210    push        ebx
 00019211    push        esi
 00019212    push        edi
 00019213    mov         edi,eax
 00019215    mov         esi,ecx
 00019217    add         ecx,dword ptr [ebp+10]
 0001921A    mov         dword ptr [ebp-4],edi
 0001921D    xor         eax,eax
 0001921F    mov         dword ptr [ebp-8],eax
 00019222    mov         dword ptr [ebp-0C],eax
 00019225    mov         dword ptr [ebp-10],eax
 00019228    or          edx,edx
>0001922A    je          0001923A
 0001922C    cmp         esi,ecx
>0001922E    je          0001923A
 00019230    lods        byte ptr [esi]
 00019231    cmp         al,25
>00019234    je          00019244
 00019236    stos        byte ptr [edi]
 00019237    dec         edx
>00019238    jne         0001922C
 0001923A    mov         eax,edi
 0001923C    sub         eax,dword ptr [ebp-4]
>0001923F    jmp         000195EC
 00019244    cmp         esi,ecx
>00019246    je          0001923A
 00019248    lods        byte ptr [esi]
 00019249    cmp         al,25
>0001924C    je          00019236
 0001924E    lea         ebx,[esi-2]
 00019251    mov         dword ptr [ebp-14],ebx
 00019254    mov         byte ptr [ebp-15],al
 00019257    cmp         al,2D
>0001925A    jne         00019261
 0001925C    cmp         esi,ecx
>0001925E    je          0001923A
 00019260    lods        byte ptr [esi]
 00019261    call        000192E6
 00019266    cmp         al,3A
>00019269    jne         00019275
 0001926B    mov         dword ptr [ebp-8],ebx
 0001926E    cmp         esi,ecx
>00019270    je          0001923A
 00019272    lods        byte ptr [esi]
>00019273    jmp         00019254
 00019275    mov         dword ptr [ebp-1C],ebx
 00019278    mov         ebx,0FFFFFFFF
 0001927D    cmp         al,2E
>00019280    jne         0001928C
 00019282    cmp         esi,ecx
>00019284    je          0001923A
 00019286    lods        byte ptr [esi]
 00019287    call        000192E6
 0001928C    mov         dword ptr [ebp-20],ebx
 0001928F    mov         dword ptr [ebp-24],esi
 00019292    push        ecx
 00019293    push        edx
 00019294    call        0001932F
 00019299    pop         edx
 0001929A    mov         ebx,dword ptr [ebp-1C]
 0001929D    sub         ebx,ecx
>0001929F    jae         000192A3
 000192A1    xor         ebx,ebx
 000192A3    cmp         byte ptr [ebp-15],2D
>000192A7    jne         000192B3
 000192A9    sub         edx,ecx
>000192AB    jae         000192B1
 000192AD    add         ecx,edx
 000192AF    xor         edx,edx
 000192B1    rep movs    byte ptr [edi],byte ptr [esi]
 000192B3    xchg        ecx,ebx
 000192B5    sub         edx,ecx
>000192B7    jae         000192BD
 000192B9    add         ecx,edx
 000192BB    xor         edx,edx
 000192BD    mov         al,20
 000192BF    rep stos    byte ptr [edi]
 000192C1    xchg        ecx,ebx
 000192C3    sub         edx,ecx
>000192C5    jae         000192CB
 000192C7    add         ecx,edx
 000192C9    xor         edx,edx
 000192CB    rep movs    byte ptr [edi],byte ptr [esi]
 000192CD    cmp         dword ptr [ebp-0C],0
>000192D1    je          000192DD
 000192D3    push        edx
 000192D4    lea         eax,[ebp-0C]
 000192D7    call        FormatClearStr
 000192DC    pop         edx
 000192DD    pop         ecx
 000192DE    mov         esi,dword ptr [ebp-24]
>000192E1    jmp         00019228
 000192E6    xor         ebx,ebx
 000192E8    cmp         al,2A
>000192EB    je          0001930F
 000192ED    cmp         al,30
>000192F0    jb          0001932E
 000192F2    cmp         al,39
>000192F5    ja          0001932E
 000192F7    imul        ebx,ebx,0A
 000192FA    sub         al,30
 000192FD    movzx       eax,al
 00019300    add         ebx,eax
 00019302    cmp         esi,ecx
>00019304    je          00019309
 00019306    lods        byte ptr [esi]
>00019307    jmp         000192ED
 00019309    pop         eax
>0001930A    jmp         0001923A
 0001930F    mov         eax,dword ptr [ebp-8]
 00019312    cmp         eax,dword ptr [ebp+8]
>00019315    ja          00019329
 00019317    inc         dword ptr [ebp-8]
 0001931A    mov         ebx,dword ptr [ebp+0C]
 0001931D    cmp         byte ptr [ebx+eax*8+4],0
 00019322    mov         ebx,dword ptr [ebx+eax*8]
>00019325    je          00019329
 00019327    xor         ebx,ebx
 00019329    cmp         esi,ecx
>0001932B    je          00019309
 0001932D    lods        byte ptr [esi]
 0001932E    ret
*}
end;

//000195FC
function StrFmt(Buffer:PChar; Format:PChar; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1):PChar;
begin
{*
 000195FC    push        ebp
 000195FD    mov         ebp,esp
 000195FF    push        ebx
 00019600    push        esi
 00019601    push        edi
 00019602    mov         edi,ecx
 00019604    mov         esi,edx
 00019606    mov         ebx,eax
 00019608    mov         eax,esi
 0001960A    call        StrLen
 0001960F    push        eax
 00019610    push        edi
 00019611    mov         eax,dword ptr [ebp+8]
 00019614    push        eax
 00019615    mov         ecx,esi
 00019617    mov         eax,ebx
 00019619    mov         edx,7FFFFFFF
 0001961E    call        FormatBuf
 00019623    mov         byte ptr [ebx+eax],0
 00019627    mov         eax,ebx
 00019629    pop         edi
 0001962A    pop         esi
 0001962B    pop         ebx
 0001962C    pop         ebp
 0001962D    ret         4
*}
end;

//00019630
function StrLFmt(Buffer:PChar; MaxLen:Cardinal; Format:PChar; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1):PChar;
begin
{*
 00019630    push        ebp
 00019631    mov         ebp,esp
 00019633    push        ebx
 00019634    push        esi
 00019635    push        edi
 00019636    mov         esi,ecx
 00019638    mov         edi,edx
 0001963A    mov         ebx,eax
 0001963C    mov         eax,esi
 0001963E    call        StrLen
 00019643    push        eax
 00019644    mov         eax,dword ptr [ebp+0C]
 00019647    push        eax
 00019648    mov         eax,dword ptr [ebp+8]
 0001964B    push        eax
 0001964C    mov         ecx,esi
 0001964E    mov         eax,ebx
 00019650    mov         edx,edi
 00019652    call        FormatBuf
 00019657    mov         byte ptr [ebx+eax],0
 0001965B    mov         eax,ebx
 0001965D    pop         edi
 0001965E    pop         esi
 0001965F    pop         ebx
 00019660    pop         ebp
 00019661    ret         8
*}
end;

//00019664
function Format(const Format:AnsiString; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1):AnsiString;
begin
{*
 00019664    push        ebp
 00019665    mov         ebp,esp
 00019667    push        ecx
 00019668    mov         ecx,dword ptr [ebp+8]
 0001966B    xchg        eax,ecx
 0001966C    xchg        edx,ecx
 0001966E    call        FmtStr
 00019673    pop         ebp
 00019674    ret         4
*}
end;

//00019678
procedure FmtStr(var Result:AnsiString; const Format:AnsiString; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1);
begin
{*
 00019678    push        ebp
 00019679    mov         ebp,esp
 0001967B    add         esp,0FFFFF004
 00019681    push        eax
 00019682    add         esp,0FFFFFFF4
 00019685    push        ebx
 00019686    push        esi
 00019687    mov         dword ptr [ebp-8],ecx
 0001968A    mov         dword ptr [ebp-4],edx
 0001968D    mov         esi,eax
 0001968F    mov         ebx,1002
 00019694    mov         eax,dword ptr [ebp-4]
 00019697    call        @LStrLen
 0001969C    mov         edx,ebx
 0001969E    test        edx,edx
>000196A0    jns         000196A5
 000196A2    add         edx,3
 000196A5    sar         edx,2
 000196A8    mov         ecx,ebx
 000196AA    sub         ecx,edx
 000196AC    cmp         eax,ecx
>000196AE    jge         000196D4
 000196B0    mov         eax,dword ptr [ebp-4]
 000196B3    call        @LStrLen
 000196B8    push        eax
 000196B9    mov         eax,dword ptr [ebp-8]
 000196BC    push        eax
 000196BD    mov         eax,dword ptr [ebp+8]
 000196C0    push        eax
 000196C1    mov         ecx,dword ptr [ebp-4]
 000196C4    mov         edx,ebx
 000196C6    dec         edx
 000196C7    lea         eax,[ebp-100A]
 000196CD    call        FormatBuf
>000196D2    jmp         000196E0
 000196D4    mov         eax,dword ptr [ebp-4]
 000196D7    call        @LStrLen
 000196DC    mov         ebx,eax
 000196DE    mov         eax,ebx
 000196E0    mov         edx,ebx
 000196E2    dec         edx
 000196E3    cmp         eax,edx
>000196E5    jl          0001972A
>000196E7    jmp         00019719
 000196E9    add         ebx,ebx
 000196EB    mov         eax,esi
 000196ED    call        @LStrClr
 000196F2    mov         eax,esi
 000196F4    mov         edx,ebx
 000196F6    call        @LStrSetLength
 000196FB    mov         eax,dword ptr [ebp-4]
 000196FE    call        @LStrLen
 00019703    push        eax
 00019704    mov         eax,dword ptr [ebp-8]
 00019707    push        eax
 00019708    mov         eax,dword ptr [ebp+8]
 0001970B    push        eax
 0001970C    mov         ecx,dword ptr [ebp-4]
 0001970F    mov         edx,ebx
 00019711    dec         edx
 00019712    mov         eax,dword ptr [esi]
 00019714    call        FormatBuf
 00019719    mov         edx,ebx
 0001971B    dec         edx
 0001971C    cmp         eax,edx
>0001971E    jge         000196E9
 00019720    mov         edx,esi
 00019722    xchg        eax,edx
 00019723    call        @LStrSetLength
>00019728    jmp         00019738
 0001972A    lea         edx,[ebp-100A]
 00019730    mov         ecx,esi
 00019732    xchg        eax,ecx
 00019733    call        @LStrFromPCharLen
 00019738    pop         esi
 00019739    pop         ebx
 0001973A    mov         esp,ebp
 0001973C    pop         ebp
 0001973D    ret         4
*}
end;

//00019740
function FloatToStr(Value:Extended):AnsiString;
begin
{*
 00019740    push        ebp
 00019741    mov         ebp,esp
 00019743    add         esp,0FFFFFFC0
 00019746    push        ebx
 00019747    mov         ebx,eax
 00019749    push        0
 0001974B    push        0F
 0001974D    push        0
 0001974F    lea         edx,[ebp+8]
 00019752    lea         eax,[ebp-40]
 00019755    xor         ecx,ecx
 00019757    call        FloatToText
 0001975C    mov         ecx,eax
 0001975E    lea         edx,[ebp-40]
 00019761    mov         eax,ebx
 00019763    call        @LStrFromPCharLen
 00019768    pop         ebx
 00019769    mov         esp,ebp
 0001976B    pop         ebp
 0001976C    ret         0C
*}
end;

//00019770
function FloatToStrF(Format:TFloatFormat; Precision:Integer; Digits:Integer; Value:Extended):AnsiString;
begin
{*
 00019770    push        ebp
 00019771    mov         ebp,esp
 00019773    add         esp,0FFFFFFC0
 00019776    push        ebx
 00019777    push        esi
 00019778    push        edi
 00019779    mov         edi,ecx
 0001977B    mov         esi,edx
 0001977D    mov         ebx,eax
 0001977F    push        ebx
 00019780    push        esi
 00019781    push        edi
 00019782    lea         edx,[ebp+0C]
 00019785    lea         eax,[ebp-40]
 00019788    xor         ecx,ecx
 0001978A    call        FloatToText
 0001978F    mov         ecx,eax
 00019791    lea         edx,[ebp-40]
 00019794    mov         eax,dword ptr [ebp+8]
 00019797    call        @LStrFromPCharLen
 0001979C    pop         edi
 0001979D    pop         esi
 0001979E    pop         ebx
 0001979F    mov         esp,ebp
 000197A1    pop         ebp
 000197A2    ret         10
*}
end;

//000197A8
function StrToFloat(const S:AnsiString):Extended;
begin
{*
 000197A8    push        ebp
 000197A9    mov         ebp,esp
 000197AB    add         esp,0FFFFFFE8
 000197AE    push        ebx
 000197AF    xor         edx,edx
 000197B1    mov         dword ptr [ebp-10],edx
 000197B4    mov         ebx,eax
 000197B6    xor         eax,eax
 000197B8    push        ebp
 000197B9    push        19812
 000197BE    push        dword ptr fs:[eax]
 000197C1    mov         dword ptr fs:[eax],esp
 000197C4    mov         eax,ebx
 000197C6    call        @LStrToPChar
 000197CB    lea         edx,[ebp-0A]
 000197CE    xor         ecx,ecx
 000197D0    call        TextToFloat
 000197D5    test        al,al
>000197D7    jne         000197FC
 000197D9    lea         edx,[ebp-10]
 000197DC    mov         eax,[000B571C];^SInvalidFloat:TResStringRec
 000197E1    call        LoadResString
 000197E6    mov         eax,dword ptr [ebp-10]
 000197E9    push        eax
 000197EA    mov         dword ptr [ebp-18],ebx
 000197ED    mov         byte ptr [ebp-14],0B
 000197F1    lea         edx,[ebp-18]
 000197F4    xor         ecx,ecx
 000197F6    pop         eax
 000197F7    call        ConvertErrorFmt
 000197FC    xor         eax,eax
 000197FE    pop         edx
 000197FF    pop         ecx
 00019800    pop         ecx
 00019801    mov         dword ptr fs:[eax],edx
 00019804    push        19819
 00019809    lea         eax,[ebp-10]
 0001980C    call        @LStrClr
 00019811    ret
>00019812    jmp         @HandleFinally
>00019817    jmp         00019809
 00019819    fld         tbyte ptr [ebp-0A]
 0001981C    pop         ebx
 0001981D    mov         esp,ebp
 0001981F    pop         ebp
 00019820    ret
*}
end;

//00019824
function DateTimeToTimeStamp(DateTime:TDateTime):TTimeStamp;
begin
{*
 00019824    push        ebp
 00019825    mov         ebp,esp
 00019827    mov         ecx,eax
 00019829    fld         qword ptr [ebp+8]
 0001982C    fmul        dword ptr ds:[0B41B8]
 00019832    sub         esp,8
 00019835    fistp       qword ptr [esp]
 00019838    wait
 00019839    pop         eax
 0001983A    pop         edx
 0001983B    or          edx,edx
>0001983D    jns         00019850
 0001983F    neg         edx
 00019841    neg         eax
 00019843    sbb         edx,0
 00019846    div         eax,dword ptr ds:[0B41BC]
 0001984C    neg         eax
>0001984E    jmp         00019856
 00019850    div         eax,dword ptr ds:[0B41BC]
 00019856    add         eax,0A955A
 0001985B    mov         dword ptr [ecx],edx
 0001985D    mov         dword ptr [ecx+4],eax
 00019860    pop         ebp
 00019861    ret         8
*}
end;

//00019864
function DoEncodeTime(Hour:Word; Min:Word; Sec:Word; MSec:Word; var Time:TDateTime):Boolean;
begin
{*
 00019864    push        ebp
 00019865    mov         ebp,esp
 00019867    add         esp,0FFFFFFF8
 0001986A    push        esi
 0001986B    mov         esi,dword ptr [ebp+0C]
 0001986E    mov         byte ptr [ebp-1],0
 00019872    cmp         ax,18
>00019876    jae         000198C5
 00019878    cmp         dx,3C
>0001987C    jae         000198C5
 0001987E    cmp         cx,3C
>00019882    jae         000198C5
 00019884    cmp         si,3E8
>00019889    jae         000198C5
 0001988B    movzx       eax,ax
 0001988E    imul        eax,eax,36EE80
 00019894    movzx       edx,dx
 00019897    imul        edx,edx,0EA60
 0001989D    add         eax,edx
 0001989F    movzx       edx,cx
 000198A2    imul        edx,edx,3E8
 000198A8    add         eax,edx
 000198AA    movzx       edx,si
 000198AD    add         eax,edx
 000198AF    mov         dword ptr [ebp-8],eax
 000198B2    fild        dword ptr [ebp-8]
 000198B5    fdiv        dword ptr ds:[198D0]
 000198BB    mov         eax,dword ptr [ebp+8]
 000198BE    fstp        qword ptr [eax]
 000198C0    wait
 000198C1    mov         byte ptr [ebp-1],1
 000198C5    mov         al,byte ptr [ebp-1]
 000198C8    pop         esi
 000198C9    pop         ecx
 000198CA    pop         ecx
 000198CB    pop         ebp
 000198CC    ret         8
*}
end;

//000198D4
function EncodeTime(Hour:Word; Min:Word; Sec:Word; MSec:Word):TDateTime;
begin
{*
 000198D4    push        ebp
 000198D5    mov         ebp,esp
 000198D7    add         esp,0FFFFFFF4
 000198DA    push        ebx
 000198DB    push        esi
 000198DC    push        edi
 000198DD    xor         ebx,ebx
 000198DF    mov         dword ptr [ebp-0C],ebx
 000198E2    mov         edi,ecx
 000198E4    mov         esi,edx
 000198E6    mov         ebx,eax
 000198E8    xor         eax,eax
 000198EA    push        ebp
 000198EB    push        19939
 000198F0    push        dword ptr fs:[eax]
 000198F3    mov         dword ptr fs:[eax],esp
 000198F6    mov         ax,word ptr [ebp+8]
 000198FA    push        eax
 000198FB    lea         eax,[ebp-8]
 000198FE    push        eax
 000198FF    mov         ecx,edi
 00019901    mov         edx,esi
 00019903    mov         eax,ebx
 00019905    call        DoEncodeTime
 0001990A    test        al,al
>0001990C    jne         00019923
 0001990E    lea         edx,[ebp-0C]
 00019911    mov         eax,[000B58F0];^STimeEncodeError:TResStringRec
 00019916    call        LoadResString
 0001991B    mov         eax,dword ptr [ebp-0C]
 0001991E    call        ConvertError
 00019923    xor         eax,eax
 00019925    pop         edx
 00019926    pop         ecx
 00019927    pop         ecx
 00019928    mov         dword ptr fs:[eax],edx
 0001992B    push        19940
 00019930    lea         eax,[ebp-0C]
 00019933    call        @LStrClr
 00019938    ret
>00019939    jmp         @HandleFinally
>0001993E    jmp         00019930
 00019940    fld         qword ptr [ebp-8]
 00019943    pop         edi
 00019944    pop         esi
 00019945    pop         ebx
 00019946    mov         esp,ebp
 00019948    pop         ebp
 00019949    ret         4
*}
end;

//0001994C
procedure DecodeTime(var Hour:Word; var Min:Word; var Sec:Word; Time:TDateTime; var MSec:Word);
begin
{*
 0001994C    push        ebp
 0001994D    mov         ebp,esp
 0001994F    add         esp,0FFFFFFF4
 00019952    push        ebx
 00019953    push        esi
 00019954    push        edi
 00019955    mov         edi,ecx
 00019957    mov         esi,edx
 00019959    mov         ebx,eax
 0001995B    lea         eax,[ebp-4]
 0001995E    push        eax
 0001995F    push        dword ptr [ebp+10]
 00019962    push        dword ptr [ebp+0C]
 00019965    lea         eax,[ebp-0C]
 00019968    call        DateTimeToTimeStamp
 0001996D    mov         eax,dword ptr [ebp-0C]
 00019970    lea         ecx,[ebp-2]
 00019973    mov         dx,0EA60
 00019977    call        DivMod
 0001997C    push        esi
 0001997D    mov         ecx,ebx
 0001997F    movzx       eax,word ptr [ebp-2]
 00019983    mov         dx,3C
 00019987    call        DivMod
 0001998C    mov         eax,dword ptr [ebp+8]
 0001998F    push        eax
 00019990    mov         ecx,edi
 00019992    movzx       eax,word ptr [ebp-4]
 00019996    mov         dx,3E8
 0001999A    call        DivMod
 0001999F    pop         edi
 000199A0    pop         esi
 000199A1    pop         ebx
 000199A2    mov         esp,ebp
 000199A4    pop         ebp
 000199A5    ret         0C
*}
end;

//000199A8
function IsLeapYear(Year:Word):Boolean;
begin
{*
 000199A8    push        ebx
 000199A9    push        esi
 000199AA    mov         ecx,eax
 000199AC    movzx       eax,cx
 000199AF    and         eax,3
 000199B2    test        eax,eax
>000199B4    jne         000199D7
 000199B6    movzx       ebx,cx
 000199B9    mov         eax,ebx
 000199BB    mov         esi,64
 000199C0    xor         edx,edx
 000199C2    div         eax,esi
 000199C4    test        edx,edx
>000199C6    jne         000199DC
 000199C8    mov         eax,ebx
 000199CA    mov         ecx,190
 000199CF    xor         edx,edx
 000199D1    div         eax,ecx
 000199D3    test        edx,edx
>000199D5    je          000199DC
 000199D7    xor         eax,eax
 000199D9    pop         esi
 000199DA    pop         ebx
 000199DB    ret
 000199DC    mov         al,1
 000199DE    pop         esi
 000199DF    pop         ebx
 000199E0    ret
*}
end;

//000199E4
function DoEncodeDate(Year:Word; Month:Word; Day:Word; var Date:TDateTime):Boolean;
begin
{*
 000199E4    push        ebp
 000199E5    mov         ebp,esp
 000199E7    add         esp,0FFFFFFF8
 000199EA    push        ebx
 000199EB    push        esi
 000199EC    push        edi
 000199ED    mov         ebx,ecx
 000199EF    mov         edi,edx
 000199F1    mov         word ptr [ebp-2],ax
 000199F5    mov         byte ptr [ebp-3],0
 000199F9    mov         ax,word ptr [ebp-2]
 000199FD    call        IsLeapYear
 00019A02    and         eax,7F
 00019A05    lea         eax,[eax+eax*2]
 00019A08    lea         esi,[eax*8+0B4134]
 00019A0F    cmp         word ptr [ebp-2],1
>00019A14    jb          00019AA0
 00019A1A    cmp         word ptr [ebp-2],270F
>00019A20    ja          00019AA0
 00019A22    cmp         di,1
>00019A26    jb          00019AA0
 00019A28    cmp         di,0C
>00019A2C    ja          00019AA0
 00019A2E    cmp         bx,1
>00019A32    jb          00019AA0
 00019A34    movzx       eax,di
 00019A37    cmp         bx,word ptr [esi+eax*2-2]
>00019A3C    ja          00019AA0
 00019A3E    movzx       eax,di
 00019A41    dec         eax
 00019A42    test        eax,eax
>00019A44    jle         00019A54
 00019A46    mov         ecx,1
 00019A4B    add         bx,word ptr [esi+ecx*2-2]
 00019A50    inc         ecx
 00019A51    dec         eax
>00019A52    jne         00019A4B
 00019A54    movzx       ecx,word ptr [ebp-2]
 00019A58    dec         ecx
 00019A59    mov         eax,ecx
 00019A5B    mov         esi,64
 00019A60    cdq
 00019A61    idiv        eax,esi
 00019A63    imul        esi,ecx,16D
 00019A69    mov         edx,ecx
 00019A6B    test        edx,edx
>00019A6D    jns         00019A72
 00019A6F    add         edx,3
 00019A72    sar         edx,2
 00019A75    add         esi,edx
 00019A77    sub         esi,eax
 00019A79    mov         eax,ecx
 00019A7B    mov         ecx,190
 00019A80    cdq
 00019A81    idiv        eax,ecx
 00019A83    add         esi,eax
 00019A85    movzx       eax,bx
 00019A88    add         esi,eax
 00019A8A    sub         esi,0A955A
 00019A90    mov         dword ptr [ebp-8],esi
 00019A93    fild        dword ptr [ebp-8]
 00019A96    mov         eax,dword ptr [ebp+8]
 00019A99    fstp        qword ptr [eax]
 00019A9B    wait
 00019A9C    mov         byte ptr [ebp-3],1
 00019AA0    mov         al,byte ptr [ebp-3]
 00019AA3    pop         edi
 00019AA4    pop         esi
 00019AA5    pop         ebx
 00019AA6    pop         ecx
 00019AA7    pop         ecx
 00019AA8    pop         ebp
 00019AA9    ret         4
*}
end;

//00019AAC
function EncodeDate(Year:Word; Month:Word; Day:Word):TDateTime;
begin
{*
 00019AAC    push        ebp
 00019AAD    mov         ebp,esp
 00019AAF    add         esp,0FFFFFFF4
 00019AB2    push        ebx
 00019AB3    push        esi
 00019AB4    push        edi
 00019AB5    xor         ebx,ebx
 00019AB7    mov         dword ptr [ebp-0C],ebx
 00019ABA    mov         edi,ecx
 00019ABC    mov         esi,edx
 00019ABE    mov         ebx,eax
 00019AC0    xor         eax,eax
 00019AC2    push        ebp
 00019AC3    push        19B0C
 00019AC8    push        dword ptr fs:[eax]
 00019ACB    mov         dword ptr fs:[eax],esp
 00019ACE    lea         eax,[ebp-8]
 00019AD1    push        eax
 00019AD2    mov         ecx,edi
 00019AD4    mov         edx,esi
 00019AD6    mov         eax,ebx
 00019AD8    call        DoEncodeDate
 00019ADD    test        al,al
>00019ADF    jne         00019AF6
 00019AE1    lea         edx,[ebp-0C]
 00019AE4    mov         eax,[000B5A38];^SDateEncodeError:TResStringRec
 00019AE9    call        LoadResString
 00019AEE    mov         eax,dword ptr [ebp-0C]
 00019AF1    call        ConvertError
 00019AF6    xor         eax,eax
 00019AF8    pop         edx
 00019AF9    pop         ecx
 00019AFA    pop         ecx
 00019AFB    mov         dword ptr fs:[eax],edx
 00019AFE    push        19B13
 00019B03    lea         eax,[ebp-0C]
 00019B06    call        @LStrClr
 00019B0B    ret
>00019B0C    jmp         @HandleFinally
>00019B11    jmp         00019B03
 00019B13    fld         qword ptr [ebp-8]
 00019B16    pop         edi
 00019B17    pop         esi
 00019B18    pop         ebx
 00019B19    mov         esp,ebp
 00019B1B    pop         ebp
 00019B1C    ret
*}
end;

//00019B20
procedure DecodeDate(var Year:Word; var Month:Word; var Day:Word; Date:TDateTime);
begin
{*
 00019B20    push        ebp
 00019B21    mov         ebp,esp
 00019B23    add         esp,0FFFFFFEC
 00019B26    push        ebx
 00019B27    push        esi
 00019B28    mov         dword ptr [ebp-8],ecx
 00019B2B    mov         dword ptr [ebp-4],edx
 00019B2E    mov         esi,eax
 00019B30    push        dword ptr [ebp+0C]
 00019B33    push        dword ptr [ebp+8]
 00019B36    lea         eax,[ebp-14]
 00019B39    call        DateTimeToTimeStamp
 00019B3E    mov         eax,dword ptr [ebp-10]
 00019B41    test        eax,eax
>00019B43    jg          00019B5F
 00019B45    mov         word ptr [esi],0
 00019B4A    mov         eax,dword ptr [ebp-4]
 00019B4D    mov         word ptr [eax],0
 00019B52    mov         eax,dword ptr [ebp-8]
 00019B55    mov         word ptr [eax],0
>00019B5A    jmp         00019C39
 00019B5F    dec         eax
 00019B60    mov         bx,1
 00019B64    cmp         eax,23AB1
>00019B69    jl          00019B7C
 00019B6B    sub         eax,23AB1
 00019B70    add         bx,190
 00019B75    cmp         eax,23AB1
>00019B7A    jge         00019B6B
 00019B7C    lea         edx,[ebp-0A]
 00019B7F    push        edx
 00019B80    lea         ecx,[ebp-0C]
 00019B83    mov         dx,8EAC
 00019B87    call        DivMod
 00019B8C    cmp         word ptr [ebp-0C],4
>00019B91    jne         00019B9D
 00019B93    dec         word ptr [ebp-0C]
 00019B97    add         word ptr [ebp-0A],8EAC
 00019B9D    imul        ax,word ptr [ebp-0C],64
 00019BA2    add         bx,ax
 00019BA5    lea         eax,[ebp-0A]
 00019BA8    push        eax
 00019BA9    lea         ecx,[ebp-0C]
 00019BAC    movzx       eax,word ptr [ebp-0A]
 00019BB0    mov         dx,5B5
 00019BB4    call        DivMod
 00019BB9    mov         ax,word ptr [ebp-0C]
 00019BBD    shl         eax,2
 00019BC0    add         bx,ax
 00019BC3    lea         eax,[ebp-0A]
 00019BC6    push        eax
 00019BC7    lea         ecx,[ebp-0C]
 00019BCA    movzx       eax,word ptr [ebp-0A]
 00019BCE    mov         dx,16D
 00019BD2    call        DivMod
 00019BD7    cmp         word ptr [ebp-0C],4
>00019BDC    jne         00019BE8
 00019BDE    dec         word ptr [ebp-0C]
 00019BE2    add         word ptr [ebp-0A],16D
 00019BE8    add         bx,word ptr [ebp-0C]
 00019BEC    mov         eax,ebx
 00019BEE    call        IsLeapYear
 00019BF3    and         eax,7F
 00019BF6    lea         eax,[eax+eax*2]
 00019BF9    lea         edx,[eax*8+0B4134]
 00019C00    mov         ax,1
 00019C04    movzx       ecx,ax
 00019C07    mov         cx,word ptr [edx+ecx*2-2]
 00019C0C    mov         word ptr [ebp-0C],cx
 00019C10    mov         cx,word ptr [ebp-0A]
 00019C14    cmp         cx,word ptr [ebp-0C]
>00019C18    jb          00019C25
 00019C1A    mov         cx,word ptr [ebp-0C]
 00019C1E    sub         word ptr [ebp-0A],cx
 00019C22    inc         eax
>00019C23    jmp         00019C04
 00019C25    mov         word ptr [esi],bx
 00019C28    mov         edx,dword ptr [ebp-4]
 00019C2B    mov         word ptr [edx],ax
 00019C2E    mov         ax,word ptr [ebp-0A]
 00019C32    inc         eax
 00019C33    mov         edx,dword ptr [ebp-8]
 00019C36    mov         word ptr [edx],ax
 00019C39    pop         esi
 00019C3A    pop         ebx
 00019C3B    mov         esp,ebp
 00019C3D    pop         ebp
 00019C3E    ret         8
*}
end;

//00019C44
function DayOfWeek(Date:TDateTime):Integer;
begin
{*
 00019C44    push        ebp
 00019C45    mov         ebp,esp
 00019C47    add         esp,0FFFFFFF8
 00019C4A    push        dword ptr [ebp+0C]
 00019C4D    push        dword ptr [ebp+8]
 00019C50    lea         eax,[ebp-8]
 00019C53    call        DateTimeToTimeStamp
 00019C58    mov         eax,dword ptr [ebp-4]
 00019C5B    mov         ecx,7
 00019C60    cdq
 00019C61    idiv        eax,ecx
 00019C63    mov         eax,edx
 00019C65    inc         eax
 00019C66    pop         ecx
 00019C67    pop         ecx
 00019C68    pop         ebp
 00019C69    ret         8
*}
end;

//00019C6C
{*function sub_00019C6C:?;
begin
 00019C6C    add         esp,0FFFFFFE0
 00019C6F    lea         eax,[esp+8]
 00019C73    push        eax
 00019C74    call        kernel32.GetLocalTime
 00019C79    mov         cx,word ptr [esp+0E]
 00019C7E    mov         dx,word ptr [esp+0A]
 00019C83    mov         ax,word ptr [esp+8]
 00019C88    call        EncodeDate
 00019C8D    fstp        qword ptr [esp+18]
 00019C91    wait
 00019C92    mov         ax,word ptr [esp+16]
 00019C97    push        eax
 00019C98    mov         cx,word ptr [esp+18]
 00019C9D    mov         dx,word ptr [esp+16]
 00019CA2    mov         ax,word ptr [esp+14]
 00019CA7    call        EncodeTime
 00019CAC    fadd        qword ptr [esp+18]
 00019CB0    fstp        qword ptr [esp]
 00019CB3    wait
 00019CB4    fld         qword ptr [esp]
 00019CB7    add         esp,20
 00019CBA    ret
end;*}

//00019CBC
function CurrentYear:Word;
begin
{*
 00019CBC    add         esp,0FFFFFFF0
 00019CBF    push        esp
 00019CC0    call        kernel32.GetLocalTime
 00019CC5    mov         ax,word ptr [esp]
 00019CC9    add         esp,10
 00019CCC    ret
*}
end;

//00019CD0
procedure AppendChars(P:PChar; Count:Integer);
begin
{*
 00019CD0    push        ebp
 00019CD1    mov         ebp,esp
 00019CD3    push        ebx
 00019CD4    mov         ecx,dword ptr [ebp+8]
 00019CD7    mov         ebx,100
 00019CDC    sub         ebx,dword ptr [ecx-104]
 00019CE2    cmp         edx,ebx
>00019CE4    jge         00019CE8
 00019CE6    mov         ebx,edx
 00019CE8    test        ebx,ebx
>00019CEA    je          00019D06
 00019CEC    mov         edx,dword ptr [ebp+8]
 00019CEF    mov         edx,dword ptr [edx-104]
 00019CF5    mov         ecx,dword ptr [ebp+8]
 00019CF8    lea         edx,[ecx+edx-100]
 00019CFF    mov         ecx,ebx
 00019D01    call        Move
 00019D06    mov         eax,dword ptr [ebp+8]
 00019D09    add         dword ptr [eax-104],ebx
 00019D0F    pop         ebx
 00019D10    pop         ebp
 00019D11    ret
*}
end;

//00019D14
procedure AppendString(const S:AnsiString);
begin
{*
 00019D14    push        ebp
 00019D15    mov         ebp,esp
 00019D17    push        ebx
 00019D18    mov         ebx,eax
 00019D1A    mov         eax,dword ptr [ebp+8]
 00019D1D    push        eax
 00019D1E    mov         eax,ebx
 00019D20    call        @LStrLen
 00019D25    mov         edx,eax
 00019D27    mov         eax,ebx
 00019D29    call        AppendChars
 00019D2E    pop         ecx
 00019D2F    pop         ebx
 00019D30    pop         ebp
 00019D31    ret
*}
end;

//00019D34
procedure AppendNumber(Number:Integer; Digits:Integer);
begin
{*
 00019D34    push        ebp
 00019D35    mov         ebp,esp
 00019D37    add         esp,0FFFFFFE0
 00019D3A    push        ebx
 00019D3B    push        esi
 00019D3C    mov         esi,edx
 00019D3E    mov         ebx,eax
 00019D40    mov         eax,dword ptr [ebp+8]
 00019D43    push        eax
 00019D44    push        4
 00019D46    mov         dword ptr [ebp-20],esi
 00019D49    mov         byte ptr [ebp-1C],0
 00019D4D    mov         dword ptr [ebp-18],ebx
 00019D50    mov         byte ptr [ebp-14],0
 00019D54    lea         eax,[ebp-20]
 00019D57    push        eax
 00019D58    push        1
 00019D5A    mov         ecx,0B41C0
 00019D5F    lea         eax,[ebp-10]
 00019D62    mov         edx,10
 00019D67    call        FormatBuf
 00019D6C    mov         edx,eax
 00019D6E    lea         eax,[ebp-10]
 00019D71    call        AppendChars
 00019D76    pop         ecx
 00019D77    pop         esi
 00019D78    pop         ebx
 00019D79    mov         esp,ebp
 00019D7B    pop         ebp
 00019D7C    ret
*}
end;

//00019D80
procedure GetCount;
begin
{*
 00019D80    push        ebp
 00019D81    mov         ebp,esp
 00019D83    push        ebx
 00019D84    mov         eax,dword ptr [ebp+8]
 00019D87    add         eax,0FFFFFFFC
 00019D8A    mov         edx,dword ptr [eax]
>00019D8C    jmp         00019D90
 00019D8E    inc         dword ptr [eax]
 00019D90    mov         ecx,dword ptr [eax]
 00019D92    mov         cl,byte ptr [ecx]
 00019D94    mov         ebx,dword ptr [ebp+8]
 00019D97    cmp         cl,byte ptr [ebx-5]
>00019D9A    je          00019D8E
 00019D9C    mov         eax,dword ptr [eax]
 00019D9E    sub         eax,edx
 00019DA0    inc         eax
 00019DA1    mov         edx,dword ptr [ebp+8]
 00019DA4    mov         dword ptr [edx-0C],eax
 00019DA7    pop         ebx
 00019DA8    pop         ebp
 00019DA9    ret
*}
end;

//00019DAC
procedure GetDate;
begin
{*
 00019DAC    push        ebp
 00019DAD    mov         ebp,esp
 00019DAF    mov         eax,dword ptr [ebp+8]
 00019DB2    cmp         byte ptr [eax-13],0
>00019DB6    jne         00019DE2
 00019DB8    mov         eax,dword ptr [ebp+8]
 00019DBB    mov         eax,dword ptr [eax+8]
 00019DBE    push        dword ptr [eax+0C]
 00019DC1    push        dword ptr [eax+8]
 00019DC4    mov         eax,dword ptr [ebp+8]
 00019DC7    lea         ecx,[eax-12]
 00019DCA    mov         eax,dword ptr [ebp+8]
 00019DCD    lea         edx,[eax-10]
 00019DD0    mov         eax,dword ptr [ebp+8]
 00019DD3    add         eax,0FFFFFFF2
 00019DD6    call        DecodeDate
 00019DDB    mov         eax,dword ptr [ebp+8]
 00019DDE    mov         byte ptr [eax-13],1
 00019DE2    pop         ebp
 00019DE3    ret
*}
end;

//00019DE4
procedure GetTime;
begin
{*
 00019DE4    push        ebp
 00019DE5    mov         ebp,esp
 00019DE7    mov         eax,dword ptr [ebp+8]
 00019DEA    cmp         byte ptr [eax-1D],0
>00019DEE    jne         00019E21
 00019DF0    mov         eax,dword ptr [ebp+8]
 00019DF3    mov         eax,dword ptr [eax+8]
 00019DF6    push        dword ptr [eax+0C]
 00019DF9    push        dword ptr [eax+8]
 00019DFC    mov         eax,dword ptr [ebp+8]
 00019DFF    add         eax,0FFFFFFE4
 00019E02    push        eax
 00019E03    mov         eax,dword ptr [ebp+8]
 00019E06    lea         ecx,[eax-1A]
 00019E09    mov         eax,dword ptr [ebp+8]
 00019E0C    lea         edx,[eax-18]
 00019E0F    mov         eax,dword ptr [ebp+8]
 00019E12    add         eax,0FFFFFFEA
 00019E15    call        DecodeTime
 00019E1A    mov         eax,dword ptr [ebp+8]
 00019E1D    mov         byte ptr [eax-1D],1
 00019E21    pop         ebp
 00019E22    ret
*}
end;

//00019E24
function ConvertEraString(const Count:Integer):AnsiString;
begin
{*
 00019E24    push        ebp
 00019E25    mov         ebp,esp
 00019E27    add         esp,0FFFFFEE8
 00019E2D    push        ebx
 00019E2E    push        esi
 00019E2F    xor         ecx,ecx
 00019E31    mov         dword ptr [ebp-118],ecx
 00019E37    mov         dword ptr [ebp-4],ecx
 00019E3A    mov         ebx,edx
 00019E3C    mov         esi,eax
 00019E3E    xor         eax,eax
 00019E40    push        ebp
 00019E41    push        19F76
 00019E46    push        dword ptr fs:[eax]
 00019E49    mov         dword ptr fs:[eax],esp
 00019E4C    mov         eax,ebx
 00019E4E    call        @LStrClr
 00019E53    mov         eax,dword ptr [ebp+8]
 00019E56    mov         ax,word ptr [eax-0E]
 00019E5A    mov         word ptr [ebp-14],ax
 00019E5E    mov         eax,dword ptr [ebp+8]
 00019E61    mov         ax,word ptr [eax-10]
 00019E65    mov         word ptr [ebp-12],ax
 00019E69    mov         eax,dword ptr [ebp+8]
 00019E6C    mov         ax,word ptr [eax-12]
 00019E70    mov         word ptr [ebp-0E],ax
 00019E74    lea         eax,[ebp-4]
 00019E77    mov         edx,19F8C;'gg'
 00019E7C    call        @LStrLAsg
 00019E81    push        100
 00019E86    lea         eax,[ebp-114]
 00019E8C    push        eax
 00019E8D    mov         eax,dword ptr [ebp-4]
 00019E90    call        @LStrToPChar
 00019E95    push        eax
 00019E96    lea         eax,[ebp-14]
 00019E99    push        eax
 00019E9A    push        4
 00019E9C    call        kernel32.GetThreadLocale
 00019EA1    push        eax
 00019EA2    call        kernel32.GetDateFormatA
 00019EA7    test        eax,eax
>00019EA9    je          00019F55
 00019EAF    mov         eax,ebx
 00019EB1    lea         edx,[ebp-114]
 00019EB7    mov         ecx,100
 00019EBC    call        @LStrFromArray
 00019EC1    dec         esi
>00019EC2    jne         00019F55
 00019EC8    mov         ax,[000B65B8]
 00019ECE    sub         ax,4
>00019ED2    je          00019EF7
 00019ED4    sub         ax,0D
>00019ED8    jne         00019F55
 00019EDA    push        ebx
 00019EDB    mov         eax,dword ptr [ebx]
 00019EDD    mov         edx,1
 00019EE2    call        CharToByteLen
 00019EE7    mov         ecx,eax
 00019EE9    mov         eax,dword ptr [ebx]
 00019EEB    mov         edx,1
 00019EF0    call        @LStrCopy
>00019EF5    jmp         00019F55
 00019EF7    cmp         word ptr ds:[0B65BA],1
>00019EFF    jne         00019F55
 00019F01    mov         eax,dword ptr [ebx]
 00019F03    call        @LStrLen
 00019F08    mov         edx,eax
 00019F0A    mov         eax,dword ptr [ebx]
 00019F0C    call        ByteToCharLen
 00019F11    cmp         eax,4
>00019F14    jne         00019F55
 00019F16    mov         eax,dword ptr [ebx]
 00019F18    mov         edx,3
 00019F1D    call        CharToByteIndex
 00019F22    mov         esi,eax
 00019F24    lea         eax,[ebp-114]
 00019F2A    add         esi,eax
 00019F2C    dec         esi
 00019F2D    lea         eax,[ebp-118]
 00019F33    mov         edx,esi
 00019F35    call        @LStrFromPChar
 00019F3A    mov         eax,dword ptr [ebp-118]
 00019F40    mov         edx,2
 00019F45    call        CharToByteLen
 00019F4A    mov         ecx,eax
 00019F4C    mov         eax,ebx
 00019F4E    mov         edx,esi
 00019F50    call        @LStrFromPCharLen
 00019F55    xor         eax,eax
 00019F57    pop         edx
 00019F58    pop         ecx
 00019F59    pop         ecx
 00019F5A    mov         dword ptr fs:[eax],edx
 00019F5D    push        19F7D
 00019F62    lea         eax,[ebp-118]
 00019F68    call        @LStrClr
 00019F6D    lea         eax,[ebp-4]
 00019F70    call        @LStrClr
 00019F75    ret
>00019F76    jmp         @HandleFinally
>00019F7B    jmp         00019F62
 00019F7D    pop         esi
 00019F7E    pop         ebx
 00019F7F    mov         esp,ebp
 00019F81    pop         ebp
 00019F82    ret
*}
end;

//00019F90
function ConvertYearString(const Count:Integer):AnsiString;
begin
{*
 00019F90    push        ebp
 00019F91    mov         ebp,esp
 00019F93    add         esp,0FFFFFEEC
 00019F99    push        ebx
 00019F9A    push        esi
 00019F9B    xor         ecx,ecx
 00019F9D    mov         dword ptr [ebp-4],ecx
 00019FA0    mov         ebx,edx
 00019FA2    mov         esi,eax
 00019FA4    xor         eax,eax
 00019FA6    push        ebp
 00019FA7    push        1A06E
 00019FAC    push        dword ptr fs:[eax]
 00019FAF    mov         dword ptr fs:[eax],esp
 00019FB2    mov         eax,ebx
 00019FB4    call        @LStrClr
 00019FB9    mov         eax,dword ptr [ebp+8]
 00019FBC    mov         ax,word ptr [eax-0E]
 00019FC0    mov         word ptr [ebp-14],ax
 00019FC4    mov         eax,dword ptr [ebp+8]
 00019FC7    mov         ax,word ptr [eax-10]
 00019FCB    mov         word ptr [ebp-12],ax
 00019FCF    mov         eax,dword ptr [ebp+8]
 00019FD2    mov         ax,word ptr [eax-12]
 00019FD6    mov         word ptr [ebp-0E],ax
 00019FDA    cmp         esi,2
>00019FDD    jg          00019FEE
 00019FDF    lea         eax,[ebp-4]
 00019FE2    mov         edx,1A084;'yy'
 00019FE7    call        @LStrLAsg
>00019FEC    jmp         00019FFB
 00019FEE    lea         eax,[ebp-4]
 00019FF1    mov         edx,1A090;'yyyy'
 00019FF6    call        @LStrLAsg
 00019FFB    push        100
 0001A000    lea         eax,[ebp-114]
 0001A006    push        eax
 0001A007    mov         eax,dword ptr [ebp-4]
 0001A00A    call        @LStrToPChar
 0001A00F    push        eax
 0001A010    lea         eax,[ebp-14]
 0001A013    push        eax
 0001A014    push        4
 0001A016    call        kernel32.GetThreadLocale
 0001A01B    push        eax
 0001A01C    call        kernel32.GetDateFormatA
 0001A021    test        eax,eax
>0001A023    je          0001A058
 0001A025    mov         eax,ebx
 0001A027    lea         edx,[ebp-114]
 0001A02D    mov         ecx,100
 0001A032    call        @LStrFromArray
 0001A037    dec         esi
>0001A038    jne         0001A058
 0001A03A    mov         eax,dword ptr [ebx]
 0001A03C    cmp         byte ptr [eax],30
>0001A03F    jne         0001A058
 0001A041    push        ebx
 0001A042    mov         eax,dword ptr [ebx]
 0001A044    call        @LStrLen
 0001A049    mov         ecx,eax
 0001A04B    dec         ecx
 0001A04C    mov         eax,dword ptr [ebx]
 0001A04E    mov         edx,2
 0001A053    call        @LStrCopy
 0001A058    xor         eax,eax
 0001A05A    pop         edx
 0001A05B    pop         ecx
 0001A05C    pop         ecx
 0001A05D    mov         dword ptr fs:[eax],edx
 0001A060    push        1A075
 0001A065    lea         eax,[ebp-4]
 0001A068    call        @LStrClr
 0001A06D    ret
>0001A06E    jmp         @HandleFinally
>0001A073    jmp         0001A065
 0001A075    pop         esi
 0001A076    pop         ebx
 0001A077    mov         esp,ebp
 0001A079    pop         ebp
 0001A07A    ret
*}
end;

//0001A098
procedure AppendFormat(Format:PChar);
begin
{*
 0001A098    push        ebp
 0001A099    mov         ebp,esp
 0001A09B    add         esp,0FFFFFFDC
 0001A09E    push        ebx
 0001A09F    push        esi
 0001A0A0    xor         edx,edx
 0001A0A2    mov         dword ptr [ebp-24],edx
 0001A0A5    mov         dword ptr [ebp-4],eax
 0001A0A8    xor         eax,eax
 0001A0AA    push        ebp
 0001A0AB    push        1A79B
 0001A0B0    push        dword ptr fs:[eax]
 0001A0B3    mov         dword ptr fs:[eax],esp
 0001A0B6    cmp         dword ptr [ebp-4],0
>0001A0BA    je          0001A785
 0001A0C0    mov         eax,dword ptr [ebp+8]
 0001A0C3    cmp         dword ptr [eax-108],2
>0001A0CA    jge         0001A785
 0001A0D0    mov         eax,dword ptr [ebp+8]
 0001A0D3    inc         dword ptr [eax-108]
 0001A0D9    mov         bl,20
 0001A0DB    mov         byte ptr [ebp-13],0
 0001A0DF    mov         byte ptr [ebp-1D],0
 0001A0E3    mov         byte ptr [ebp-1E],0
>0001A0E7    jmp         0001A76F
 0001A0EC    mov         byte ptr [ebp-5],al
 0001A0EF    inc         dword ptr [ebp-4]
 0001A0F2    mov         al,byte ptr [ebp-5]
 0001A0F5    and         eax,0FF
 0001A0FA    bt          dword ptr ds:[0B4164],eax
>0001A101    jae         0001A119
 0001A103    mov         eax,dword ptr [ebp-4]
 0001A106    cmp         byte ptr [eax],0
>0001A109    je          0001A77C
 0001A10F    inc         dword ptr [ebp-4]
 0001A112    mov         bl,20
>0001A114    jmp         0001A76F
 0001A119    mov         al,byte ptr [ebp-5]
 0001A11C    mov         edx,eax
 0001A11E    add         dl,9F
 0001A121    sub         dl,1A
>0001A124    jae         0001A128
 0001A126    sub         al,20
 0001A128    mov         edx,eax
 0001A12A    add         dl,0BF
 0001A12D    sub         dl,1A
>0001A130    jae         0001A13F
 0001A132    cmp         al,4D
>0001A134    jne         0001A13D
 0001A136    cmp         bl,48
>0001A139    jne         0001A13D
 0001A13B    mov         al,4E
 0001A13D    mov         ebx,eax
 0001A13F    and         eax,0FF
 0001A144    add         eax,0FFFFFFDE
 0001A147    cmp         eax,37
>0001A14A    ja          0001A75D
 0001A150    mov         al,byte ptr [eax+1A15D]
 0001A156    jmp         dword ptr [eax*4+1A195]
 0001A156    db          14
 0001A156    db          0
 0001A156    db          0
 0001A156    db          0
 0001A156    db          0
 0001A156    db          14
 0001A156    db          0
 0001A156    db          0
 0001A156    db          0
 0001A156    db          0
 0001A156    db          0
 0001A156    db          0
 0001A156    db          0
 0001A156    db          12
 0001A156    db          0
 0001A156    db          0
 0001A156    db          0
 0001A156    db          0
 0001A156    db          0
 0001A156    db          0
 0001A156    db          0
 0001A156    db          0
 0001A156    db          0
 0001A156    db          0
 0001A156    db          13
 0001A156    db          0
 0001A156    db          0
 0001A156    db          0
 0001A156    db          0
 0001A156    db          0
 0001A156    db          0
 0001A156    db          10
 0001A156    db          0
 0001A156    db          11
 0001A156    db          5
 0001A156    db          3
 0001A156    db          0
 0001A156    db          2
 0001A156    db          6
 0001A156    db          0
 0001A156    db          0
 0001A156    db          0
 0001A156    db          0
 0001A156    db          4
 0001A156    db          7
 0001A156    db          0
 0001A156    db          0
 0001A156    db          0
 0001A156    db          0
 0001A156    db          8
 0001A156    db          9
 0001A156    db          0
 0001A156    db          0
 0001A156    db          0
 0001A156    db          0
 0001A156    db          1
 0001A156    dd          0001A75D
 0001A156    dd          0001A1D1
 0001A156    dd          0001A220
 0001A156    dd          0001A24D
 0001A156    dd          0001A27A
 0001A156    dd          0001A2DF
 0001A156    dd          0001A386
 0001A156    dd          0001A482
 0001A156    dd          0001A4B3
 0001A156    dd          0001A4E4
 0001A156    dd          0001A519
 0001A156    dd          0001A686
 0001A156    dd          0001A6E4
 0001A156    dd          0001A6FA
 0001A156    dd          0001A710
 0001A1D1    push        ebp
 0001A1D2    call        GetCount
 0001A1D7    pop         ecx
 0001A1D8    push        ebp
 0001A1D9    call        GetDate
 0001A1DE    pop         ecx
 0001A1DF    cmp         dword ptr [ebp-0C],2
>0001A1E3    jg          0001A208
 0001A1E5    mov         eax,dword ptr [ebp+8]
 0001A1E8    push        eax
 0001A1E9    movzx       eax,word ptr [ebp-0E]
 0001A1ED    mov         ecx,64
 0001A1F2    xor         edx,edx
 0001A1F4    div         eax,ecx
 0001A1F6    mov         eax,edx
 0001A1F8    mov         edx,2
 0001A1FD    call        AppendNumber
 0001A202    pop         ecx
>0001A203    jmp         0001A76F
 0001A208    mov         eax,dword ptr [ebp+8]
 0001A20B    push        eax
 0001A20C    movzx       eax,word ptr [ebp-0E]
 0001A210    mov         edx,4
 0001A215    call        AppendNumber
 0001A21A    pop         ecx
>0001A21B    jmp         0001A76F
 0001A220    push        ebp
 0001A221    call        GetCount
 0001A226    pop         ecx
 0001A227    push        ebp
 0001A228    call        GetDate
 0001A22D    pop         ecx
 0001A22E    mov         eax,dword ptr [ebp+8]
 0001A231    push        eax
 0001A232    push        ebp
 0001A233    lea         edx,[ebp-24]
 0001A236    mov         eax,dword ptr [ebp-0C]
 0001A239    call        ConvertEraString
 0001A23E    pop         ecx
 0001A23F    mov         eax,dword ptr [ebp-24]
 0001A242    call        AppendString
 0001A247    pop         ecx
>0001A248    jmp         0001A76F
 0001A24D    push        ebp
 0001A24E    call        GetCount
 0001A253    pop         ecx
 0001A254    push        ebp
 0001A255    call        GetDate
 0001A25A    pop         ecx
 0001A25B    mov         eax,dword ptr [ebp+8]
 0001A25E    push        eax
 0001A25F    push        ebp
 0001A260    lea         edx,[ebp-24]
 0001A263    mov         eax,dword ptr [ebp-0C]
 0001A266    call        ConvertYearString
 0001A26B    pop         ecx
 0001A26C    mov         eax,dword ptr [ebp-24]
 0001A26F    call        AppendString
 0001A274    pop         ecx
>0001A275    jmp         0001A76F
 0001A27A    push        ebp
 0001A27B    call        GetCount
 0001A280    pop         ecx
 0001A281    push        ebp
 0001A282    call        GetDate
 0001A287    pop         ecx
 0001A288    mov         eax,dword ptr [ebp-0C]
 0001A28B    dec         eax
 0001A28C    sub         eax,2
>0001A28F    jb          0001A295
>0001A291    je          0001A2AB
>0001A293    jmp         0001A2C5
 0001A295    mov         eax,dword ptr [ebp+8]
 0001A298    push        eax
 0001A299    movzx       eax,word ptr [ebp-10]
 0001A29D    mov         edx,dword ptr [ebp-0C]
 0001A2A0    call        AppendNumber
 0001A2A5    pop         ecx
>0001A2A6    jmp         0001A76F
 0001A2AB    mov         eax,dword ptr [ebp+8]
 0001A2AE    push        eax
 0001A2AF    movzx       eax,word ptr [ebp-10]
 0001A2B3    mov         eax,dword ptr [eax*4+0B6518]
 0001A2BA    call        AppendString
 0001A2BF    pop         ecx
>0001A2C0    jmp         0001A76F
 0001A2C5    mov         eax,dword ptr [ebp+8]
 0001A2C8    push        eax
 0001A2C9    movzx       eax,word ptr [ebp-10]
 0001A2CD    mov         eax,dword ptr [eax*4+0B6548]
 0001A2D4    call        AppendString
 0001A2D9    pop         ecx
>0001A2DA    jmp         0001A76F
 0001A2DF    push        ebp
 0001A2E0    call        GetCount
 0001A2E5    pop         ecx
 0001A2E6    mov         eax,dword ptr [ebp-0C]
 0001A2E9    dec         eax
 0001A2EA    sub         eax,2
>0001A2ED    jb          0001A2F9
>0001A2EF    je          0001A316
 0001A2F1    dec         eax
>0001A2F2    je          0001A33A
 0001A2F4    dec         eax
>0001A2F5    je          0001A35E
>0001A2F7    jmp         0001A372
 0001A2F9    push        ebp
 0001A2FA    call        GetDate
 0001A2FF    pop         ecx
 0001A300    mov         eax,dword ptr [ebp+8]
 0001A303    push        eax
 0001A304    movzx       eax,word ptr [ebp-12]
 0001A308    mov         edx,dword ptr [ebp-0C]
 0001A30B    call        AppendNumber
 0001A310    pop         ecx
>0001A311    jmp         0001A76F
 0001A316    mov         eax,dword ptr [ebp+8]
 0001A319    push        eax
 0001A31A    mov         eax,dword ptr [ebp+8]
 0001A31D    push        dword ptr [eax+0C]
 0001A320    push        dword ptr [eax+8]
 0001A323    call        DayOfWeek
 0001A328    mov         eax,dword ptr [eax*4+0B6578]
 0001A32F    call        AppendString
 0001A334    pop         ecx
>0001A335    jmp         0001A76F
 0001A33A    mov         eax,dword ptr [ebp+8]
 0001A33D    push        eax
 0001A33E    mov         eax,dword ptr [ebp+8]
 0001A341    push        dword ptr [eax+0C]
 0001A344    push        dword ptr [eax+8]
 0001A347    call        DayOfWeek
 0001A34C    mov         eax,dword ptr [eax*4+0B6594]
 0001A353    call        AppendString
 0001A358    pop         ecx
>0001A359    jmp         0001A76F
 0001A35E    mov         eax,dword ptr [ebp+8]
 0001A361    push        eax
 0001A362    mov         eax,[000B6500];gvar_000B6500
 0001A367    call        AppendFormat
 0001A36C    pop         ecx
>0001A36D    jmp         0001A76F
 0001A372    mov         eax,dword ptr [ebp+8]
 0001A375    push        eax
 0001A376    mov         eax,[000B6504]
 0001A37B    call        AppendFormat
 0001A380    pop         ecx
>0001A381    jmp         0001A76F
 0001A386    push        ebp
 0001A387    call        GetCount
 0001A38C    pop         ecx
 0001A38D    push        ebp
 0001A38E    call        GetTime
 0001A393    pop         ecx
 0001A394    mov         byte ptr [ebp-1F],0
 0001A398    mov         esi,dword ptr [ebp-4]
>0001A39B    jmp         0001A437
 0001A3A0    and         eax,0FF
 0001A3A5    bt          dword ptr ds:[0B4164],eax
>0001A3AC    jae         0001A3BB
 0001A3AE    inc         esi
 0001A3AF    cmp         byte ptr [esi],0
>0001A3B2    je          0001A441
 0001A3B8    inc         esi
>0001A3B9    jmp         0001A437
 0001A3BB    xor         eax,eax
 0001A3BD    mov         al,byte ptr [esi]
 0001A3BF    cmp         eax,48
>0001A3C2    jg          0001A3D7
>0001A3C4    je          0001A441
 0001A3C6    sub         eax,22
>0001A3C9    je          0001A42E
 0001A3CB    sub         eax,5
>0001A3CE    je          0001A42E
 0001A3D0    sub         eax,1A
>0001A3D3    je          0001A3E3
>0001A3D5    jmp         0001A436
 0001A3D7    sub         eax,61
>0001A3DA    je          0001A3E3
 0001A3DC    sub         eax,7
>0001A3DF    je          0001A441
>0001A3E1    jmp         0001A436
 0001A3E3    cmp         byte ptr [ebp-1F],0
>0001A3E7    jne         0001A436
 0001A3E9    mov         edx,1A7A8
 0001A3EE    mov         ecx,5
 0001A3F3    mov         eax,esi
 0001A3F5    call        StrLIComp
 0001A3FA    test        eax,eax
>0001A3FC    je          0001A428
 0001A3FE    mov         edx,1A7B0
 0001A403    mov         ecx,3
 0001A408    mov         eax,esi
 0001A40A    call        StrLIComp
 0001A40F    test        eax,eax
>0001A411    je          0001A428
 0001A413    mov         edx,1A7B4
 0001A418    mov         ecx,4
 0001A41D    mov         eax,esi
 0001A41F    call        StrLIComp
 0001A424    test        eax,eax
>0001A426    jne         0001A441
 0001A428    mov         byte ptr [ebp-1E],1
>0001A42C    jmp         0001A441
 0001A42E    mov         al,byte ptr [ebp-1F]
 0001A431    xor         al,1
 0001A433    mov         byte ptr [ebp-1F],al
 0001A436    inc         esi
 0001A437    mov         al,byte ptr [esi]
 0001A439    test        al,al
>0001A43B    jne         0001A3A0
 0001A441    mov         ax,word ptr [ebp-16]
 0001A445    cmp         byte ptr [ebp-1E],0
>0001A449    je          0001A460
 0001A44B    test        ax,ax
>0001A44E    jne         0001A456
 0001A450    mov         ax,0C
>0001A454    jmp         0001A460
 0001A456    cmp         ax,0C
>0001A45A    jbe         0001A460
 0001A45C    sub         ax,0C
 0001A460    cmp         dword ptr [ebp-0C],2
>0001A464    jle         0001A46D
 0001A466    mov         dword ptr [ebp-0C],2
 0001A46D    mov         edx,dword ptr [ebp+8]
 0001A470    push        edx
 0001A471    movzx       eax,ax
 0001A474    mov         edx,dword ptr [ebp-0C]
 0001A477    call        AppendNumber
 0001A47C    pop         ecx
>0001A47D    jmp         0001A76F
 0001A482    push        ebp
 0001A483    call        GetCount
 0001A488    pop         ecx
 0001A489    push        ebp
 0001A48A    call        GetTime
 0001A48F    pop         ecx
 0001A490    cmp         dword ptr [ebp-0C],2
>0001A494    jle         0001A49D
 0001A496    mov         dword ptr [ebp-0C],2
 0001A49D    mov         eax,dword ptr [ebp+8]
 0001A4A0    push        eax
 0001A4A1    movzx       eax,word ptr [ebp-18]
 0001A4A5    mov         edx,dword ptr [ebp-0C]
 0001A4A8    call        AppendNumber
 0001A4AD    pop         ecx
>0001A4AE    jmp         0001A76F
 0001A4B3    push        ebp
 0001A4B4    call        GetCount
 0001A4B9    pop         ecx
 0001A4BA    push        ebp
 0001A4BB    call        GetTime
 0001A4C0    pop         ecx
 0001A4C1    cmp         dword ptr [ebp-0C],2
>0001A4C5    jle         0001A4CE
 0001A4C7    mov         dword ptr [ebp-0C],2
 0001A4CE    mov         eax,dword ptr [ebp+8]
 0001A4D1    push        eax
 0001A4D2    movzx       eax,word ptr [ebp-1A]
 0001A4D6    mov         edx,dword ptr [ebp-0C]
 0001A4D9    call        AppendNumber
 0001A4DE    pop         ecx
>0001A4DF    jmp         0001A76F
 0001A4E4    push        ebp
 0001A4E5    call        GetCount
 0001A4EA    pop         ecx
 0001A4EB    cmp         dword ptr [ebp-0C],1
>0001A4EF    jne         0001A505
 0001A4F1    mov         eax,dword ptr [ebp+8]
 0001A4F4    push        eax
 0001A4F5    mov         eax,[000B6514];gvar_000B6514
 0001A4FA    call        AppendFormat
 0001A4FF    pop         ecx
>0001A500    jmp         0001A76F
 0001A505    mov         eax,dword ptr [ebp+8]
 0001A508    push        eax
 0001A509    mov         eax,[000B6518]
 0001A50E    call        AppendFormat
 0001A513    pop         ecx
>0001A514    jmp         0001A76F
 0001A519    push        ebp
 0001A51A    call        GetTime
 0001A51F    pop         ecx
 0001A520    mov         esi,dword ptr [ebp-4]
 0001A523    dec         esi
 0001A524    mov         edx,1A7A8
 0001A529    mov         ecx,5
 0001A52E    mov         eax,esi
 0001A530    call        StrLIComp
 0001A535    test        eax,eax
>0001A537    jne         0001A561
 0001A539    cmp         word ptr [ebp-16],0C
>0001A53E    jb          0001A543
 0001A540    add         esi,3
 0001A543    mov         eax,dword ptr [ebp+8]
 0001A546    push        eax
 0001A547    mov         edx,2
 0001A54C    mov         eax,esi
 0001A54E    call        AppendChars
 0001A553    pop         ecx
 0001A554    add         dword ptr [ebp-4],4
 0001A558    mov         byte ptr [ebp-1E],1
>0001A55C    jmp         0001A76F
 0001A561    mov         edx,1A7B0
 0001A566    mov         ecx,3
 0001A56B    mov         eax,esi
 0001A56D    call        StrLIComp
 0001A572    test        eax,eax
>0001A574    jne         0001A59E
 0001A576    cmp         word ptr [ebp-16],0C
>0001A57B    jb          0001A580
 0001A57D    add         esi,2
 0001A580    mov         eax,dword ptr [ebp+8]
 0001A583    push        eax
 0001A584    mov         edx,1
 0001A589    mov         eax,esi
 0001A58B    call        AppendChars
 0001A590    pop         ecx
 0001A591    add         dword ptr [ebp-4],2
 0001A595    mov         byte ptr [ebp-1E],1
>0001A599    jmp         0001A76F
 0001A59E    mov         edx,1A7B4
 0001A5A3    mov         ecx,4
 0001A5A8    mov         eax,esi
 0001A5AA    call        StrLIComp
 0001A5AF    test        eax,eax
>0001A5B1    jne         0001A5E7
 0001A5B3    cmp         word ptr [ebp-16],0C
>0001A5B8    jae         0001A5CB
 0001A5BA    mov         eax,dword ptr [ebp+8]
 0001A5BD    push        eax
 0001A5BE    mov         eax,[000B650C]
 0001A5C3    call        AppendString
 0001A5C8    pop         ecx
>0001A5C9    jmp         0001A5DA
 0001A5CB    mov         eax,dword ptr [ebp+8]
 0001A5CE    push        eax
 0001A5CF    mov         eax,[000B6510]
 0001A5D4    call        AppendString
 0001A5D9    pop         ecx
 0001A5DA    add         dword ptr [ebp-4],3
 0001A5DE    mov         byte ptr [ebp-1E],1
>0001A5E2    jmp         0001A76F
 0001A5E7    mov         edx,1A7BC
 0001A5EC    mov         ecx,4
 0001A5F1    mov         eax,esi
 0001A5F3    call        StrLIComp
 0001A5F8    test        eax,eax
>0001A5FA    jne         0001A62B
 0001A5FC    push        ebp
 0001A5FD    call        GetDate
 0001A602    pop         ecx
 0001A603    mov         eax,dword ptr [ebp+8]
 0001A606    push        eax
 0001A607    mov         eax,dword ptr [ebp+8]
 0001A60A    push        dword ptr [eax+0C]
 0001A60D    push        dword ptr [eax+8]
 0001A610    call        DayOfWeek
 0001A615    mov         eax,dword ptr [eax*4+0B6594]
 0001A61C    call        AppendString
 0001A621    pop         ecx
 0001A622    add         dword ptr [ebp-4],3
>0001A626    jmp         0001A76F
 0001A62B    mov         edx,1A7C4
 0001A630    mov         ecx,3
 0001A635    mov         eax,esi
 0001A637    call        StrLIComp
 0001A63C    test        eax,eax
>0001A63E    jne         0001A66F
 0001A640    push        ebp
 0001A641    call        GetDate
 0001A646    pop         ecx
 0001A647    mov         eax,dword ptr [ebp+8]
 0001A64A    push        eax
 0001A64B    mov         eax,dword ptr [ebp+8]
 0001A64E    push        dword ptr [eax+0C]
 0001A651    push        dword ptr [eax+8]
 0001A654    call        DayOfWeek
 0001A659    mov         eax,dword ptr [eax*4+0B6578]
 0001A660    call        AppendString
 0001A665    pop         ecx
 0001A666    add         dword ptr [ebp-4],2
>0001A66A    jmp         0001A76F
 0001A66F    mov         eax,dword ptr [ebp+8]
 0001A672    push        eax
 0001A673    lea         eax,[ebp-5]
 0001A676    mov         edx,1
 0001A67B    call        AppendChars
 0001A680    pop         ecx
>0001A681    jmp         0001A76F
 0001A686    push        ebp
 0001A687    call        GetCount
 0001A68C    pop         ecx
 0001A68D    mov         eax,dword ptr [ebp+8]
 0001A690    push        eax
 0001A691    mov         eax,[000B6500];gvar_000B6500
 0001A696    call        AppendFormat
 0001A69B    pop         ecx
 0001A69C    push        ebp
 0001A69D    call        GetTime
 0001A6A2    pop         ecx
 0001A6A3    cmp         word ptr [ebp-16],0
>0001A6A8    jne         0001A6BC
 0001A6AA    cmp         word ptr [ebp-18],0
>0001A6AF    jne         0001A6BC
 0001A6B1    cmp         word ptr [ebp-1A],0
>0001A6B6    je          0001A76F
 0001A6BC    mov         eax,dword ptr [ebp+8]
 0001A6BF    push        eax
 0001A6C0    mov         eax,1A7C8
 0001A6C5    mov         edx,1
 0001A6CA    call        AppendChars
 0001A6CF    pop         ecx
 0001A6D0    mov         eax,dword ptr [ebp+8]
 0001A6D3    push        eax
 0001A6D4    mov         eax,[000B6518]
 0001A6D9    call        AppendFormat
 0001A6DE    pop         ecx
>0001A6DF    jmp         0001A76F
 0001A6E4    mov         eax,dword ptr [ebp+8]
 0001A6E7    push        eax
 0001A6E8    mov         eax,0B64FD
 0001A6ED    mov         edx,1
 0001A6F2    call        AppendChars
 0001A6F7    pop         ecx
>0001A6F8    jmp         0001A76F
 0001A6FA    mov         eax,dword ptr [ebp+8]
 0001A6FD    push        eax
 0001A6FE    mov         eax,0B6508
 0001A703    mov         edx,1
 0001A708    call        AppendChars
 0001A70D    pop         ecx
>0001A70E    jmp         0001A76F
 0001A710    mov         esi,dword ptr [ebp-4]
>0001A713    jmp         0001A731
 0001A715    and         eax,0FF
 0001A71A    bt          dword ptr ds:[0B4164],eax
>0001A721    jae         0001A72E
 0001A723    inc         dword ptr [ebp-4]
 0001A726    mov         eax,dword ptr [ebp-4]
 0001A729    cmp         byte ptr [eax],0
>0001A72C    je          0001A73F
 0001A72E    inc         dword ptr [ebp-4]
 0001A731    mov         eax,dword ptr [ebp-4]
 0001A734    mov         al,byte ptr [eax]
 0001A736    test        al,al
>0001A738    je          0001A73F
 0001A73A    cmp         al,byte ptr [ebp-5]
>0001A73D    jne         0001A715
 0001A73F    mov         eax,dword ptr [ebp+8]
 0001A742    push        eax
 0001A743    mov         edx,dword ptr [ebp-4]
 0001A746    sub         edx,esi
 0001A748    mov         eax,esi
 0001A74A    call        AppendChars
 0001A74F    pop         ecx
 0001A750    mov         eax,dword ptr [ebp-4]
 0001A753    cmp         byte ptr [eax],0
>0001A756    je          0001A76F
 0001A758    inc         dword ptr [ebp-4]
>0001A75B    jmp         0001A76F
 0001A75D    mov         eax,dword ptr [ebp+8]
 0001A760    push        eax
 0001A761    lea         eax,[ebp-5]
 0001A764    mov         edx,1
 0001A769    call        AppendChars
 0001A76E    pop         ecx
 0001A76F    mov         eax,dword ptr [ebp-4]
 0001A772    mov         al,byte ptr [eax]
 0001A774    test        al,al
>0001A776    jne         0001A0EC
 0001A77C    mov         eax,dword ptr [ebp+8]
 0001A77F    dec         dword ptr [eax-108]
 0001A785    xor         eax,eax
 0001A787    pop         edx
 0001A788    pop         ecx
 0001A789    pop         ecx
 0001A78A    mov         dword ptr fs:[eax],edx
 0001A78D    push        1A7A2
 0001A792    lea         eax,[ebp-24]
 0001A795    call        @LStrClr
 0001A79A    ret
>0001A79B    jmp         @HandleFinally
>0001A7A0    jmp         0001A792
 0001A7A2    pop         esi
 0001A7A3    pop         ebx
 0001A7A4    mov         esp,ebp
 0001A7A6    pop         ebp
 0001A7A7    ret
*}
end;

//0001A7CC
procedure DateTimeToString(var Result:AnsiString; const Format:AnsiString; DateTime:TDateTime);
begin
{*
 0001A7CC    push        ebp
 0001A7CD    mov         ebp,esp
 0001A7CF    add         esp,0FFFFFEF8
 0001A7D5    push        ebx
 0001A7D6    push        esi
 0001A7D7    mov         ebx,edx
 0001A7D9    mov         esi,eax
 0001A7DB    xor         eax,eax
 0001A7DD    mov         dword ptr [ebp-104],eax
 0001A7E3    xor         eax,eax
 0001A7E5    mov         dword ptr [ebp-108],eax
 0001A7EB    test        ebx,ebx
>0001A7ED    je          0001A7FA
 0001A7EF    push        ebp
 0001A7F0    mov         eax,ebx
 0001A7F2    call        AppendFormat
 0001A7F7    pop         ecx
>0001A7F8    jmp         0001A806
 0001A7FA    push        ebp
 0001A7FB    mov         eax,1A824
 0001A800    call        AppendFormat
 0001A805    pop         ecx
 0001A806    lea         edx,[ebp-100]
 0001A80C    mov         eax,esi
 0001A80E    mov         ecx,dword ptr [ebp-104]
 0001A814    call        @LStrFromPCharLen
 0001A819    pop         esi
 0001A81A    pop         ebx
 0001A81B    mov         esp,ebp
 0001A81D    pop         ebp
 0001A81E    ret         8
*}
end;

//0001A828
function DateToStr(Date:TDateTime):AnsiString;
begin
{*
 0001A828    push        ebp
 0001A829    mov         ebp,esp
 0001A82B    push        dword ptr [ebp+0C]
 0001A82E    push        dword ptr [ebp+8]
 0001A831    mov         edx,dword ptr ds:[0B6500];gvar_000B6500
 0001A837    call        DateTimeToString
 0001A83C    pop         ebp
 0001A83D    ret         8
*}
end;

//0001A840
function TimeToStr(Time:TDateTime):AnsiString;
begin
{*
 0001A840    push        ebp
 0001A841    mov         ebp,esp
 0001A843    push        dword ptr [ebp+0C]
 0001A846    push        dword ptr [ebp+8]
 0001A849    mov         edx,dword ptr ds:[0B6518]
 0001A84F    call        DateTimeToString
 0001A854    pop         ebp
 0001A855    ret         8
*}
end;

//0001A858
function DateTimeToStr(DateTime:TDateTime):AnsiString;
begin
{*
 0001A858    push        ebp
 0001A859    mov         ebp,esp
 0001A85B    push        dword ptr [ebp+0C]
 0001A85E    push        dword ptr [ebp+8]
 0001A861    xor         edx,edx
 0001A863    call        DateTimeToString
 0001A868    pop         ebp
 0001A869    ret         8
*}
end;

//0001A86C
function FormatDateTime(const Format:AnsiString; DateTime:TDateTime):AnsiString;
begin
{*
 0001A86C    push        ebp
 0001A86D    mov         ebp,esp
 0001A86F    push        dword ptr [ebp+0C]
 0001A872    push        dword ptr [ebp+8]
 0001A875    xchg        eax,edx
 0001A876    call        DateTimeToString
 0001A87B    pop         ebp
 0001A87C    ret         8
*}
end;

//0001A880
procedure ScanBlanks(const S:AnsiString; var Pos:Integer);
begin
{*
 0001A880    push        ebx
 0001A881    push        esi
 0001A882    push        edi
 0001A883    mov         edi,edx
 0001A885    mov         esi,eax
 0001A887    mov         ebx,dword ptr [edi]
>0001A889    jmp         0001A88C
 0001A88B    inc         ebx
 0001A88C    mov         eax,esi
 0001A88E    call        @LStrLen
 0001A893    cmp         ebx,eax
>0001A895    jg          0001A89E
 0001A897    cmp         byte ptr [esi+ebx-1],20
>0001A89C    je          0001A88B
 0001A89E    mov         dword ptr [edi],ebx
 0001A8A0    pop         edi
 0001A8A1    pop         esi
 0001A8A2    pop         ebx
 0001A8A3    ret
*}
end;

//0001A8A4
function ScanNumber(const S:AnsiString; var Pos:Integer; var Number:Word; var CharCount:Byte):Boolean;
begin
{*
 0001A8A4    push        ebp
 0001A8A5    mov         ebp,esp
 0001A8A7    add         esp,0FFFFFFF4
 0001A8AA    push        ebx
 0001A8AB    push        esi
 0001A8AC    push        edi
 0001A8AD    mov         dword ptr [ebp-8],ecx
 0001A8B0    mov         dword ptr [ebp-4],edx
 0001A8B3    mov         edi,eax
 0001A8B5    mov         byte ptr [ebp-9],0
 0001A8B9    mov         eax,dword ptr [ebp+8]
 0001A8BC    mov         byte ptr [eax],0
 0001A8BF    mov         edx,dword ptr [ebp-4]
 0001A8C2    mov         eax,edi
 0001A8C4    call        ScanBlanks
 0001A8C9    mov         ebx,dword ptr [ebp-4]
 0001A8CC    mov         ebx,dword ptr [ebx]
 0001A8CE    xor         esi,esi
>0001A8D0    jmp         0001A8E9
 0001A8D2    mov         eax,esi
 0001A8D4    add         eax,eax
 0001A8D6    lea         eax,[eax+eax*4]
 0001A8D9    xor         edx,edx
 0001A8DB    mov         dl,byte ptr [edi+ebx-1]
 0001A8DF    sub         dx,30
 0001A8E3    add         ax,dx
 0001A8E6    mov         esi,eax
 0001A8E8    inc         ebx
 0001A8E9    mov         eax,edi
 0001A8EB    call        @LStrLen
 0001A8F0    cmp         ebx,eax
>0001A8F2    jg          0001A905
 0001A8F4    mov         al,byte ptr [edi+ebx-1]
 0001A8F8    add         al,0D0
 0001A8FA    sub         al,0A
>0001A8FC    jae         0001A905
 0001A8FE    cmp         si,3E8
>0001A903    jb          0001A8D2
 0001A905    mov         eax,dword ptr [ebp-4]
 0001A908    cmp         ebx,dword ptr [eax]
>0001A90A    jle         0001A929
 0001A90C    mov         eax,ebx
 0001A90E    mov         edx,dword ptr [ebp-4]
 0001A911    mov         edx,dword ptr [edx]
 0001A913    sub         al,dl
 0001A915    mov         edx,dword ptr [ebp+8]
 0001A918    mov         byte ptr [edx],al
 0001A91A    mov         eax,dword ptr [ebp-4]
 0001A91D    mov         dword ptr [eax],ebx
 0001A91F    mov         eax,dword ptr [ebp-8]
 0001A922    mov         word ptr [eax],si
 0001A925    mov         byte ptr [ebp-9],1
 0001A929    mov         al,byte ptr [ebp-9]
 0001A92C    pop         edi
 0001A92D    pop         esi
 0001A92E    pop         ebx
 0001A92F    mov         esp,ebp
 0001A931    pop         ebp
 0001A932    ret         4
*}
end;

//0001A938
function ScanString(const S:AnsiString; var Pos:Integer; const Symbol:AnsiString):Boolean;
begin
{*
 0001A938    push        ebp
 0001A939    mov         ebp,esp
 0001A93B    add         esp,0FFFFFFF8
 0001A93E    push        ebx
 0001A93F    push        esi
 0001A940    push        edi
 0001A941    xor         ebx,ebx
 0001A943    mov         dword ptr [ebp-8],ebx
 0001A946    mov         edi,ecx
 0001A948    mov         esi,edx
 0001A94A    mov         dword ptr [ebp-4],eax
 0001A94D    xor         eax,eax
 0001A94F    push        ebp
 0001A950    push        1A9B1
 0001A955    push        dword ptr fs:[eax]
 0001A958    mov         dword ptr fs:[eax],esp
 0001A95B    xor         ebx,ebx
 0001A95D    test        edi,edi
>0001A95F    je          0001A99B
 0001A961    mov         edx,esi
 0001A963    mov         eax,dword ptr [ebp-4]
 0001A966    call        ScanBlanks
 0001A96B    lea         eax,[ebp-8]
 0001A96E    push        eax
 0001A96F    mov         eax,edi
 0001A971    call        @LStrLen
 0001A976    mov         ecx,eax
 0001A978    mov         edx,dword ptr [esi]
 0001A97A    mov         eax,dword ptr [ebp-4]
 0001A97D    call        @LStrCopy
 0001A982    mov         edx,dword ptr [ebp-8]
 0001A985    mov         eax,edi
 0001A987    call        AnsiCompareText
 0001A98C    test        eax,eax
>0001A98E    jne         0001A99B
 0001A990    mov         eax,edi
 0001A992    call        @LStrLen
 0001A997    add         dword ptr [esi],eax
 0001A999    mov         bl,1
 0001A99B    xor         eax,eax
 0001A99D    pop         edx
 0001A99E    pop         ecx
 0001A99F    pop         ecx
 0001A9A0    mov         dword ptr fs:[eax],edx
 0001A9A3    push        1A9B8
 0001A9A8    lea         eax,[ebp-8]
 0001A9AB    call        @LStrClr
 0001A9B0    ret
>0001A9B1    jmp         @HandleFinally
>0001A9B6    jmp         0001A9A8
 0001A9B8    mov         eax,ebx
 0001A9BA    pop         edi
 0001A9BB    pop         esi
 0001A9BC    pop         ebx
 0001A9BD    pop         ecx
 0001A9BE    pop         ecx
 0001A9BF    pop         ebp
 0001A9C0    ret
*}
end;

//0001A9C4
function ScanChar(const S:AnsiString; var Pos:Integer; Ch:Char):Boolean;
begin
{*
 0001A9C4    push        ebx
 0001A9C5    push        esi
 0001A9C6    push        edi
 0001A9C7    push        ecx
 0001A9C8    mov         byte ptr [esp],cl
 0001A9CB    mov         edi,edx
 0001A9CD    mov         esi,eax
 0001A9CF    xor         ebx,ebx
 0001A9D1    mov         edx,edi
 0001A9D3    mov         eax,esi
 0001A9D5    call        ScanBlanks
 0001A9DA    mov         eax,esi
 0001A9DC    call        @LStrLen
 0001A9E1    cmp         eax,dword ptr [edi]
>0001A9E3    jl          0001A9F4
 0001A9E5    mov         eax,dword ptr [edi]
 0001A9E7    mov         al,byte ptr [esi+eax-1]
 0001A9EB    cmp         al,byte ptr [esp]
>0001A9EE    jne         0001A9F4
 0001A9F0    inc         dword ptr [edi]
 0001A9F2    mov         bl,1
 0001A9F4    mov         eax,ebx
 0001A9F6    pop         edx
 0001A9F7    pop         edi
 0001A9F8    pop         esi
 0001A9F9    pop         ebx
 0001A9FA    ret
*}
end;

//0001A9FC
function GetDateOrder(const DateFormat:AnsiString):TDateOrder;
begin
{*
 0001A9FC    push        ebx
 0001A9FD    push        esi
 0001A9FE    push        edi
 0001A9FF    mov         esi,eax
 0001AA01    xor         ebx,ebx
 0001AA03    mov         edi,1
>0001AA08    jmp         0001AA33
 0001AA0A    mov         al,byte ptr [esi+edi-1]
 0001AA0E    and         al,0DF
 0001AA10    sub         al,44
>0001AA12    je          0001AA2E
 0001AA14    dec         al
>0001AA16    je          0001AA22
 0001AA18    sub         al,8
>0001AA1A    je          0001AA2A
 0001AA1C    sub         al,0C
>0001AA1E    je          0001AA26
>0001AA20    jmp         0001AA32
 0001AA22    mov         bl,2
>0001AA24    jmp         0001AA40
 0001AA26    mov         bl,2
>0001AA28    jmp         0001AA40
 0001AA2A    xor         ebx,ebx
>0001AA2C    jmp         0001AA40
 0001AA2E    mov         bl,1
>0001AA30    jmp         0001AA40
 0001AA32    inc         edi
 0001AA33    mov         eax,esi
 0001AA35    call        @LStrLen
 0001AA3A    cmp         edi,eax
>0001AA3C    jle         0001AA0A
 0001AA3E    xor         ebx,ebx
 0001AA40    mov         eax,ebx
 0001AA42    pop         edi
 0001AA43    pop         esi
 0001AA44    pop         ebx
 0001AA45    ret
*}
end;

//0001AA48
procedure ScanToNumber(const S:AnsiString; var Pos:Integer);
begin
{*
 0001AA48    push        ebx
 0001AA49    push        esi
 0001AA4A    mov         ebx,edx
 0001AA4C    mov         esi,eax
>0001AA4E    jmp         0001AA68
 0001AA50    mov         eax,dword ptr [ebx]
 0001AA52    mov         al,byte ptr [esi+eax-1]
 0001AA56    and         eax,0FF
 0001AA5B    bt          dword ptr ds:[0B4164],eax
>0001AA62    jae         0001AA66
 0001AA64    inc         dword ptr [ebx]
 0001AA66    inc         dword ptr [ebx]
 0001AA68    mov         eax,esi
 0001AA6A    call        @LStrLen
 0001AA6F    cmp         eax,dword ptr [ebx]
>0001AA71    jl          0001AA7F
 0001AA73    mov         eax,dword ptr [ebx]
 0001AA75    mov         al,byte ptr [esi+eax-1]
 0001AA79    add         al,0D0
 0001AA7B    sub         al,0A
>0001AA7D    jae         0001AA50
 0001AA7F    pop         esi
 0001AA80    pop         ebx
 0001AA81    ret
*}
end;

//0001AA84
function GetEraYearOffset(const Name:AnsiString):Integer;
begin
{*
 0001AA84    push        ebx
 0001AA85    push        esi
 0001AA86    push        edi
 0001AA87    push        ebp
 0001AA88    push        ecx
 0001AA89    mov         ebp,eax
 0001AA8B    xor         eax,eax
 0001AA8D    mov         dword ptr [esp],eax
 0001AA90    mov         edi,7
 0001AA95    mov         ebx,0B65C0
 0001AA9A    mov         esi,0B65DC
 0001AA9F    cmp         dword ptr [ebx],0
>0001AAA2    je          0001AACD
 0001AAA4    mov         eax,ebp
 0001AAA6    call        @LStrToPChar
 0001AAAB    push        eax
 0001AAAC    mov         eax,dword ptr [ebx]
 0001AAAE    call        @LStrToPChar
 0001AAB3    pop         edx
 0001AAB4    call        AnsiStrPos
 0001AAB9    test        eax,eax
>0001AABB    je          0001AAC4
 0001AABD    mov         eax,dword ptr [esi]
 0001AABF    mov         dword ptr [esp],eax
>0001AAC2    jmp         0001AACD
 0001AAC4    add         esi,4
 0001AAC7    add         ebx,4
 0001AACA    dec         edi
>0001AACB    jne         0001AA9F
 0001AACD    mov         eax,dword ptr [esp]
 0001AAD0    pop         edx
 0001AAD1    pop         ebp
 0001AAD2    pop         edi
 0001AAD3    pop         esi
 0001AAD4    pop         ebx
 0001AAD5    ret
*}
end;

//0001AAD8
function EraToYear(Year:Integer):Integer;
begin
{*
 0001AAD8    push        ebp
 0001AAD9    mov         ebp,esp
 0001AADB    push        ebx
 0001AADC    mov         ebx,eax
 0001AADE    cmp         word ptr ds:[0B65B8],12
>0001AAE6    jne         0001AB22
 0001AAE8    cmp         ebx,63
>0001AAEB    jg          0001AB11
 0001AAED    call        CurrentYear
 0001AAF2    movzx       ecx,ax
 0001AAF5    mov         eax,dword ptr [ebp+8]
 0001AAF8    mov         eax,dword ptr [eax-4]
 0001AAFB    cdq
 0001AAFC    xor         eax,edx
 0001AAFE    sub         eax,edx
 0001AB00    add         ecx,eax
 0001AB02    mov         eax,ecx
 0001AB04    mov         ecx,64
 0001AB09    cdq
 0001AB0A    idiv        eax,ecx
 0001AB0C    imul        eax,eax,64
 0001AB0F    add         ebx,eax
 0001AB11    mov         eax,dword ptr [ebp+8]
 0001AB14    cmp         dword ptr [eax-4],0
>0001AB18    jle         0001AB28
 0001AB1A    mov         eax,dword ptr [ebp+8]
 0001AB1D    neg         dword ptr [eax-4]
>0001AB20    jmp         0001AB28
 0001AB22    mov         eax,dword ptr [ebp+8]
 0001AB25    dec         dword ptr [eax-4]
 0001AB28    mov         eax,dword ptr [ebp+8]
 0001AB2B    mov         eax,dword ptr [eax-4]
 0001AB2E    add         eax,ebx
 0001AB30    pop         ebx
 0001AB31    pop         ebp
 0001AB32    ret
*}
end;

//0001AB34
function ScanDate(const S:AnsiString; var Pos:Integer; var Date:TDateTime):Boolean;
begin
{*
 0001AB34    push        ebp
 0001AB35    mov         ebp,esp
 0001AB37    add         esp,0FFFFFFE0
 0001AB3A    push        ebx
 0001AB3B    push        esi
 0001AB3C    push        edi
 0001AB3D    xor         ebx,ebx
 0001AB3F    mov         dword ptr [ebp-20],ebx
 0001AB42    mov         dword ptr [ebp-1C],ebx
 0001AB45    mov         dword ptr [ebp-8],ecx
 0001AB48    mov         ebx,edx
 0001AB4A    mov         esi,eax
 0001AB4C    xor         eax,eax
 0001AB4E    push        ebp
 0001AB4F    push        1AE40
 0001AB54    push        dword ptr fs:[eax]
 0001AB57    mov         dword ptr fs:[eax],esp
 0001AB5A    xor         edi,edi
 0001AB5C    mov         word ptr [ebp-12],0
 0001AB62    mov         word ptr [ebp-14],0
 0001AB68    mov         byte ptr [ebp-18],0
 0001AB6C    mov         byte ptr [ebp-9],0
 0001AB70    mov         eax,[000B6500];gvar_000B6500
 0001AB75    call        GetDateOrder
 0001AB7A    mov         byte ptr [ebp-0A],al
 0001AB7D    xor         eax,eax
 0001AB7F    mov         dword ptr [ebp-4],eax
 0001AB82    mov         eax,[000B6500];gvar_000B6500
 0001AB87    cmp         byte ptr [eax],67
>0001AB8A    jne         0001ABC0
 0001AB8C    mov         edx,ebx
 0001AB8E    mov         eax,esi
 0001AB90    call        ScanToNumber
 0001AB95    lea         eax,[ebp-20]
 0001AB98    push        eax
 0001AB99    mov         ecx,dword ptr [ebx]
 0001AB9B    dec         ecx
 0001AB9C    mov         edx,1
 0001ABA1    mov         eax,esi
 0001ABA3    call        @LStrCopy
 0001ABA8    mov         eax,dword ptr [ebp-20]
 0001ABAB    lea         edx,[ebp-1C]
 0001ABAE    call        Trim
 0001ABB3    mov         eax,dword ptr [ebp-1C]
 0001ABB6    call        GetEraYearOffset
 0001ABBB    mov         dword ptr [ebp-4],eax
>0001ABBE    jmp         0001ABDC
 0001ABC0    mov         edx,dword ptr ds:[0B6500];gvar_000B6500
 0001ABC6    mov         eax,1AE5C;'e'
 0001ABCB    call        AnsiPos
 0001ABD0    test        eax,eax
>0001ABD2    jle         0001ABDC
 0001ABD4    mov         eax,[000B65DC]
 0001ABD9    mov         dword ptr [ebp-4],eax
 0001ABDC    lea         eax,[ebp-15]
 0001ABDF    push        eax
 0001ABE0    lea         ecx,[ebp-0C]
 0001ABE3    mov         edx,ebx
 0001ABE5    mov         eax,esi
 0001ABE7    call        ScanNumber
 0001ABEC    test        al,al
>0001ABEE    je          0001AE25
 0001ABF4    mov         edx,ebx
 0001ABF6    mov         cl,byte ptr ds:[0B64FD]
 0001ABFC    mov         eax,esi
 0001ABFE    call        ScanChar
 0001AC03    test        al,al
>0001AC05    je          0001AE25
 0001AC0B    lea         eax,[ebp-16]
 0001AC0E    push        eax
 0001AC0F    lea         ecx,[ebp-0E]
 0001AC12    mov         edx,ebx
 0001AC14    mov         eax,esi
 0001AC16    call        ScanNumber
 0001AC1B    test        al,al
>0001AC1D    je          0001AE25
 0001AC23    mov         edx,ebx
 0001AC25    mov         cl,byte ptr ds:[0B64FD]
 0001AC2B    mov         eax,esi
 0001AC2D    call        ScanChar
 0001AC32    test        al,al
>0001AC34    je          0001AD08
 0001AC3A    lea         eax,[ebp-17]
 0001AC3D    push        eax
 0001AC3E    lea         ecx,[ebp-10]
 0001AC41    mov         edx,ebx
 0001AC43    mov         eax,esi
 0001AC45    call        ScanNumber
 0001AC4A    test        al,al
>0001AC4C    je          0001AE25
 0001AC52    mov         al,byte ptr [ebp-0A]
 0001AC55    sub         al,1
>0001AC57    jb          0001AC61
>0001AC59    je          0001AC7D
 0001AC5B    dec         al
>0001AC5D    je          0001AC99
>0001AC5F    jmp         0001ACB3
 0001AC61    mov         di,word ptr [ebp-10]
 0001AC65    mov         al,byte ptr [ebp-17]
 0001AC68    mov         byte ptr [ebp-18],al
 0001AC6B    mov         ax,word ptr [ebp-0C]
 0001AC6F    mov         word ptr [ebp-12],ax
 0001AC73    mov         ax,word ptr [ebp-0E]
 0001AC77    mov         word ptr [ebp-14],ax
>0001AC7B    jmp         0001ACB3
 0001AC7D    mov         di,word ptr [ebp-10]
 0001AC81    mov         al,byte ptr [ebp-17]
 0001AC84    mov         byte ptr [ebp-18],al
 0001AC87    mov         ax,word ptr [ebp-0E]
 0001AC8B    mov         word ptr [ebp-12],ax
 0001AC8F    mov         ax,word ptr [ebp-0C]
 0001AC93    mov         word ptr [ebp-14],ax
>0001AC97    jmp         0001ACB3
 0001AC99    mov         di,word ptr [ebp-0C]
 0001AC9D    mov         al,byte ptr [ebp-15]
 0001ACA0    mov         byte ptr [ebp-18],al
 0001ACA3    mov         ax,word ptr [ebp-0E]
 0001ACA7    mov         word ptr [ebp-12],ax
 0001ACAB    mov         ax,word ptr [ebp-10]
 0001ACAF    mov         word ptr [ebp-14],ax
 0001ACB3    cmp         dword ptr [ebp-4],0
>0001ACB7    jle         0001ACC7
 0001ACB9    push        ebp
 0001ACBA    movzx       eax,di
 0001ACBD    call        EraToYear
 0001ACC2    pop         ecx
 0001ACC3    mov         edi,eax
>0001ACC5    jmp         0001AD37
 0001ACC7    cmp         byte ptr [ebp-18],2
>0001ACCB    ja          0001AD37
 0001ACCD    call        CurrentYear
 0001ACD2    movzx       ecx,ax
 0001ACD5    movzx       eax,word ptr ds:[0B4130]
 0001ACDC    sub         ecx,eax
 0001ACDE    mov         eax,ecx
 0001ACE0    push        ecx
 0001ACE1    mov         ecx,64
 0001ACE6    cdq
 0001ACE7    idiv        eax,ecx
 0001ACE9    pop         ecx
 0001ACEA    imul        ax,ax,64
 0001ACEE    add         di,ax
 0001ACF1    cmp         word ptr ds:[0B4130],0
>0001ACF9    jbe         0001AD37
 0001ACFB    movzx       eax,di
 0001ACFE    cmp         ecx,eax
>0001AD00    jle         0001AD37
 0001AD02    add         di,64
>0001AD06    jmp         0001AD37
 0001AD08    call        CurrentYear
 0001AD0D    mov         edi,eax
 0001AD0F    cmp         byte ptr [ebp-0A],1
>0001AD13    jne         0001AD27
 0001AD15    mov         ax,word ptr [ebp-0C]
 0001AD19    mov         word ptr [ebp-14],ax
 0001AD1D    mov         ax,word ptr [ebp-0E]
 0001AD21    mov         word ptr [ebp-12],ax
>0001AD25    jmp         0001AD37
 0001AD27    mov         ax,word ptr [ebp-0C]
 0001AD2B    mov         word ptr [ebp-12],ax
 0001AD2F    mov         ax,word ptr [ebp-0E]
 0001AD33    mov         word ptr [ebp-14],ax
 0001AD37    mov         edx,ebx
 0001AD39    mov         cl,byte ptr ds:[0B64FD]
 0001AD3F    mov         eax,esi
 0001AD41    call        ScanChar
 0001AD46    mov         edx,ebx
 0001AD48    mov         eax,esi
 0001AD4A    call        ScanBlanks
 0001AD4F    cmp         byte ptr ds:[0B65BC],0
>0001AD56    je          0001AE0F
 0001AD5C    mov         edx,dword ptr ds:[0B6500];gvar_000B6500
 0001AD62    mov         eax,1AE68;'ddd'
 0001AD67    call        @LStrPos
 0001AD6C    test        eax,eax
>0001AD6E    je          0001AE0F
 0001AD74    mov         eax,[000B6514];gvar_000B6514
 0001AD79    mov         al,byte ptr [eax]
 0001AD7B    add         al,0D0
 0001AD7D    sub         al,0A
>0001AD7F    jae         0001AD93
 0001AD81    mov         edx,ebx
 0001AD83    mov         eax,esi
 0001AD85    call        ScanToNumber
>0001AD8A    jmp         0001AE0F
>0001AD8F    jmp         0001AD93
 0001AD91    inc         dword ptr [ebx]
 0001AD93    mov         eax,esi
 0001AD95    call        @LStrLen
 0001AD9A    cmp         eax,dword ptr [ebx]
>0001AD9C    jl          0001ADA7
 0001AD9E    mov         eax,dword ptr [ebx]
 0001ADA0    cmp         byte ptr [esi+eax-1],20
>0001ADA5    jne         0001AD91
 0001ADA7    mov         edx,ebx
 0001ADA9    mov         eax,esi
 0001ADAB    call        ScanBlanks
 0001ADB0    mov         eax,esi
 0001ADB2    call        @LStrLen
 0001ADB7    cmp         eax,dword ptr [ebx]
>0001ADB9    jl          0001AE0F
 0001ADBB    lea         eax,[ebp-20]
 0001ADBE    push        eax
 0001ADBF    mov         eax,[000B650C]
 0001ADC4    call        @LStrLen
 0001ADC9    mov         ecx,eax
 0001ADCB    mov         edx,dword ptr [ebx]
 0001ADCD    mov         eax,esi
 0001ADCF    call        @LStrCopy
 0001ADD4    mov         edx,dword ptr [ebp-20]
 0001ADD7    mov         eax,[000B650C]
 0001ADDC    call        AnsiCompareText
 0001ADE1    test        eax,eax
>0001ADE3    je          0001AE0F
 0001ADE5    lea         eax,[ebp-20]
 0001ADE8    push        eax
 0001ADE9    mov         eax,[000B6510]
 0001ADEE    call        @LStrLen
 0001ADF3    mov         ecx,eax
 0001ADF5    mov         edx,dword ptr [ebx]
 0001ADF7    mov         eax,esi
 0001ADF9    call        @LStrCopy
 0001ADFE    mov         edx,dword ptr [ebp-20]
 0001AE01    mov         eax,[000B6510]
 0001AE06    call        AnsiCompareText
 0001AE0B    test        eax,eax
>0001AE0D    jne         0001AD93
 0001AE0F    mov         eax,dword ptr [ebp-8]
 0001AE12    push        eax
 0001AE13    mov         cx,word ptr [ebp-14]
 0001AE17    mov         dx,word ptr [ebp-12]
 0001AE1B    mov         eax,edi
 0001AE1D    call        DoEncodeDate
 0001AE22    mov         byte ptr [ebp-9],al
 0001AE25    xor         eax,eax
 0001AE27    pop         edx
 0001AE28    pop         ecx
 0001AE29    pop         ecx
 0001AE2A    mov         dword ptr fs:[eax],edx
 0001AE2D    push        1AE47
 0001AE32    lea         eax,[ebp-20]
 0001AE35    mov         edx,2
 0001AE3A    call        @LStrArrayClr
 0001AE3F    ret
>0001AE40    jmp         @HandleFinally
>0001AE45    jmp         0001AE32
 0001AE47    mov         al,byte ptr [ebp-9]
 0001AE4A    pop         edi
 0001AE4B    pop         esi
 0001AE4C    pop         ebx
 0001AE4D    mov         esp,ebp
 0001AE4F    pop         ebp
 0001AE50    ret
*}
end;

//0001AE6C
function ScanTime(const S:AnsiString; var Pos:Integer; var Time:TDateTime):Boolean;
begin
{*
 0001AE6C    push        ebx
 0001AE6D    push        esi
 0001AE6E    push        edi
 0001AE6F    push        ebp
 0001AE70    add         esp,0FFFFFFF4
 0001AE73    mov         dword ptr [esp],ecx
 0001AE76    mov         esi,edx
 0001AE78    mov         ebp,eax
 0001AE7A    xor         ebx,ebx
 0001AE7C    or          edi,0FFFFFFFF
 0001AE7F    mov         edx,esi
 0001AE81    mov         ecx,dword ptr ds:[0B650C]
 0001AE87    mov         eax,ebp
 0001AE89    call        ScanString
 0001AE8E    test        al,al
>0001AE90    jne         0001AEA4
 0001AE92    mov         edx,esi
 0001AE94    mov         ecx,1B018;'AM'
 0001AE99    mov         eax,ebp
 0001AE9B    call        ScanString
 0001AEA0    test        al,al
>0001AEA2    je          0001AEA8
 0001AEA4    xor         edi,edi
>0001AEA6    jmp         0001AED2
 0001AEA8    mov         edx,esi
 0001AEAA    mov         ecx,dword ptr ds:[0B6510]
 0001AEB0    mov         eax,ebp
 0001AEB2    call        ScanString
 0001AEB7    test        al,al
>0001AEB9    jne         0001AECD
 0001AEBB    mov         edx,esi
 0001AEBD    mov         ecx,1B024;'PM'
 0001AEC2    mov         eax,ebp
 0001AEC4    call        ScanString
 0001AEC9    test        al,al
>0001AECB    je          0001AED2
 0001AECD    mov         edi,0C
 0001AED2    test        edi,edi
>0001AED4    jl          0001AEDF
 0001AED6    mov         edx,esi
 0001AED8    mov         eax,ebp
 0001AEDA    call        ScanBlanks
 0001AEDF    lea         eax,[esp+0A]
 0001AEE3    push        eax
 0001AEE4    lea         ecx,[esp+8]
 0001AEE8    mov         edx,esi
 0001AEEA    mov         eax,ebp
 0001AEEC    call        ScanNumber
 0001AEF1    test        al,al
>0001AEF3    je          0001B006
 0001AEF9    mov         word ptr [esp+6],0
 0001AF00    mov         edx,esi
 0001AF02    mov         cl,byte ptr ds:[0B6508]
 0001AF08    mov         eax,ebp
 0001AF0A    call        ScanChar
 0001AF0F    test        al,al
>0001AF11    je          0001AF2D
 0001AF13    lea         eax,[esp+0A]
 0001AF17    push        eax
 0001AF18    lea         ecx,[esp+0A]
 0001AF1C    mov         edx,esi
 0001AF1E    mov         eax,ebp
 0001AF20    call        ScanNumber
 0001AF25    test        al,al
>0001AF27    je          0001B006
 0001AF2D    mov         word ptr [esp+8],0
 0001AF34    mov         edx,esi
 0001AF36    mov         cl,byte ptr ds:[0B6508]
 0001AF3C    mov         eax,ebp
 0001AF3E    call        ScanChar
 0001AF43    test        al,al
>0001AF45    je          0001AF61
 0001AF47    lea         eax,[esp+0A]
 0001AF4B    push        eax
 0001AF4C    lea         ecx,[esp+0C]
 0001AF50    mov         edx,esi
 0001AF52    mov         eax,ebp
 0001AF54    call        ScanNumber
 0001AF59    test        al,al
>0001AF5B    je          0001B006
 0001AF61    test        edi,edi
>0001AF63    jge         0001AFB8
 0001AF65    mov         edx,esi
 0001AF67    mov         ecx,dword ptr ds:[0B650C]
 0001AF6D    mov         eax,ebp
 0001AF6F    call        ScanString
 0001AF74    test        al,al
>0001AF76    jne         0001AF8A
 0001AF78    mov         edx,esi
 0001AF7A    mov         ecx,1B018;'AM'
 0001AF7F    mov         eax,ebp
 0001AF81    call        ScanString
 0001AF86    test        al,al
>0001AF88    je          0001AF8E
 0001AF8A    xor         edi,edi
>0001AF8C    jmp         0001AFB8
 0001AF8E    mov         edx,esi
 0001AF90    mov         ecx,dword ptr ds:[0B6510]
 0001AF96    mov         eax,ebp
 0001AF98    call        ScanString
 0001AF9D    test        al,al
>0001AF9F    jne         0001AFB3
 0001AFA1    mov         edx,esi
 0001AFA3    mov         ecx,1B024;'PM'
 0001AFA8    mov         eax,ebp
 0001AFAA    call        ScanString
 0001AFAF    test        al,al
>0001AFB1    je          0001AFB8
 0001AFB3    mov         edi,0C
 0001AFB8    test        edi,edi
>0001AFBA    jl          0001AFE0
 0001AFBC    cmp         word ptr [esp+4],0
>0001AFC2    je          0001B006
 0001AFC4    cmp         word ptr [esp+4],0C
>0001AFCA    ja          0001B006
 0001AFCC    cmp         word ptr [esp+4],0C
>0001AFD2    jne         0001AFDB
 0001AFD4    mov         word ptr [esp+4],0
 0001AFDB    add         word ptr [esp+4],di
 0001AFE0    mov         edx,esi
 0001AFE2    mov         eax,ebp
 0001AFE4    call        ScanBlanks
 0001AFE9    push        0
 0001AFEB    mov         eax,dword ptr [esp+4]
 0001AFEF    push        eax
 0001AFF0    mov         cx,word ptr [esp+10]
 0001AFF5    mov         dx,word ptr [esp+0E]
 0001AFFA    mov         ax,word ptr [esp+0C]
 0001AFFF    call        DoEncodeTime
 0001B004    mov         ebx,eax
 0001B006    mov         eax,ebx
 0001B008    add         esp,0C
 0001B00B    pop         ebp
 0001B00C    pop         edi
 0001B00D    pop         esi
 0001B00E    pop         ebx
 0001B00F    ret
*}
end;

//0001B028
function StrToDate(const S:AnsiString):TDateTime;
begin
{*
 0001B028    push        ebp
 0001B029    mov         ebp,esp
 0001B02B    add         esp,0FFFFFFE8
 0001B02E    push        ebx
 0001B02F    xor         edx,edx
 0001B031    mov         dword ptr [ebp-10],edx
 0001B034    mov         ebx,eax
 0001B036    xor         eax,eax
 0001B038    push        ebp
 0001B039    push        1B0A1
 0001B03E    push        dword ptr fs:[eax]
 0001B041    mov         dword ptr fs:[eax],esp
 0001B044    mov         dword ptr [ebp-0C],1
 0001B04B    lea         ecx,[ebp-8]
 0001B04E    lea         edx,[ebp-0C]
 0001B051    mov         eax,ebx
 0001B053    call        ScanDate
 0001B058    test        al,al
>0001B05A    je          0001B068
 0001B05C    mov         eax,ebx
 0001B05E    call        @LStrLen
 0001B063    cmp         eax,dword ptr [ebp-0C]
>0001B066    jl          0001B08B
 0001B068    lea         edx,[ebp-10]
 0001B06B    mov         eax,[000B5904];^SInvalidDate:TResStringRec
 0001B070    call        LoadResString
 0001B075    mov         eax,dword ptr [ebp-10]
 0001B078    push        eax
 0001B079    mov         dword ptr [ebp-18],ebx
 0001B07C    mov         byte ptr [ebp-14],0B
 0001B080    lea         edx,[ebp-18]
 0001B083    xor         ecx,ecx
 0001B085    pop         eax
 0001B086    call        ConvertErrorFmt
 0001B08B    xor         eax,eax
 0001B08D    pop         edx
 0001B08E    pop         ecx
 0001B08F    pop         ecx
 0001B090    mov         dword ptr fs:[eax],edx
 0001B093    push        1B0A8
 0001B098    lea         eax,[ebp-10]
 0001B09B    call        @LStrClr
 0001B0A0    ret
>0001B0A1    jmp         @HandleFinally
>0001B0A6    jmp         0001B098
 0001B0A8    fld         qword ptr [ebp-8]
 0001B0AB    pop         ebx
 0001B0AC    mov         esp,ebp
 0001B0AE    pop         ebp
 0001B0AF    ret
*}
end;

//0001B0B0
function StrToTime(const S:AnsiString):TDateTime;
begin
{*
 0001B0B0    push        ebp
 0001B0B1    mov         ebp,esp
 0001B0B3    add         esp,0FFFFFFE8
 0001B0B6    push        ebx
 0001B0B7    xor         edx,edx
 0001B0B9    mov         dword ptr [ebp-10],edx
 0001B0BC    mov         ebx,eax
 0001B0BE    xor         eax,eax
 0001B0C0    push        ebp
 0001B0C1    push        1B129
 0001B0C6    push        dword ptr fs:[eax]
 0001B0C9    mov         dword ptr fs:[eax],esp
 0001B0CC    mov         dword ptr [ebp-0C],1
 0001B0D3    lea         ecx,[ebp-8]
 0001B0D6    lea         edx,[ebp-0C]
 0001B0D9    mov         eax,ebx
 0001B0DB    call        ScanTime
 0001B0E0    test        al,al
>0001B0E2    je          0001B0F0
 0001B0E4    mov         eax,ebx
 0001B0E6    call        @LStrLen
 0001B0EB    cmp         eax,dword ptr [ebp-0C]
>0001B0EE    jl          0001B113
 0001B0F0    lea         edx,[ebp-10]
 0001B0F3    mov         eax,[000B57B4];^SInvalidTime:TResStringRec
 0001B0F8    call        LoadResString
 0001B0FD    mov         eax,dword ptr [ebp-10]
 0001B100    push        eax
 0001B101    mov         dword ptr [ebp-18],ebx
 0001B104    mov         byte ptr [ebp-14],0B
 0001B108    lea         edx,[ebp-18]
 0001B10B    xor         ecx,ecx
 0001B10D    pop         eax
 0001B10E    call        ConvertErrorFmt
 0001B113    xor         eax,eax
 0001B115    pop         edx
 0001B116    pop         ecx
 0001B117    pop         ecx
 0001B118    mov         dword ptr fs:[eax],edx
 0001B11B    push        1B130
 0001B120    lea         eax,[ebp-10]
 0001B123    call        @LStrClr
 0001B128    ret
>0001B129    jmp         @HandleFinally
>0001B12E    jmp         0001B120
 0001B130    fld         qword ptr [ebp-8]
 0001B133    pop         ebx
 0001B134    mov         esp,ebp
 0001B136    pop         ebp
 0001B137    ret
*}
end;

//0001B138
function StrToDateTime(const S:AnsiString):TDateTime;
begin
{*
 0001B138    push        ebp
 0001B139    mov         ebp,esp
 0001B13B    add         esp,0FFFFFFD8
 0001B13E    push        ebx
 0001B13F    xor         edx,edx
 0001B141    mov         dword ptr [ebp-20],edx
 0001B144    mov         ebx,eax
 0001B146    xor         eax,eax
 0001B148    push        ebp
 0001B149    push        1B214
 0001B14E    push        dword ptr fs:[eax]
 0001B151    mov         dword ptr fs:[eax],esp
 0001B154    mov         dword ptr [ebp-0C],1
 0001B15B    xor         eax,eax
 0001B15D    mov         dword ptr [ebp-1C],eax
 0001B160    mov         dword ptr [ebp-18],eax
 0001B163    lea         ecx,[ebp-14]
 0001B166    lea         edx,[ebp-0C]
 0001B169    mov         eax,ebx
 0001B16B    call        ScanDate
 0001B170    test        al,al
>0001B172    je          0001B191
 0001B174    mov         eax,ebx
 0001B176    call        @LStrLen
 0001B17B    cmp         eax,dword ptr [ebp-0C]
>0001B17E    jl          0001B1DA
 0001B180    lea         ecx,[ebp-1C]
 0001B183    lea         edx,[ebp-0C]
 0001B186    mov         eax,ebx
 0001B188    call        ScanTime
 0001B18D    test        al,al
>0001B18F    jne         0001B1DA
 0001B191    mov         dword ptr [ebp-0C],1
 0001B198    lea         ecx,[ebp-8]
 0001B19B    lea         edx,[ebp-0C]
 0001B19E    mov         eax,ebx
 0001B1A0    call        ScanTime
 0001B1A5    test        al,al
>0001B1A7    je          0001B1B5
 0001B1A9    mov         eax,ebx
 0001B1AB    call        @LStrLen
 0001B1B0    cmp         eax,dword ptr [ebp-0C]
>0001B1B3    jl          0001B1FE
 0001B1B5    lea         edx,[ebp-20]
 0001B1B8    mov         eax,[000B567C];^SInvalidDateTime:TResStringRec
 0001B1BD    call        LoadResString
 0001B1C2    mov         eax,dword ptr [ebp-20]
 0001B1C5    push        eax
 0001B1C6    mov         dword ptr [ebp-28],ebx
 0001B1C9    mov         byte ptr [ebp-24],0B
 0001B1CD    lea         edx,[ebp-28]
 0001B1D0    xor         ecx,ecx
 0001B1D2    pop         eax
 0001B1D3    call        ConvertErrorFmt
>0001B1D8    jmp         0001B1FE
 0001B1DA    fld         qword ptr [ebp-14]
 0001B1DD    fcomp       dword ptr ds:[1B224]
 0001B1E3    fnstsw      al
 0001B1E5    sahf
>0001B1E6    jb          0001B1F4
 0001B1E8    fld         qword ptr [ebp-14]
 0001B1EB    fadd        qword ptr [ebp-1C]
 0001B1EE    fstp        qword ptr [ebp-8]
 0001B1F1    wait
>0001B1F2    jmp         0001B1FE
 0001B1F4    fld         qword ptr [ebp-14]
 0001B1F7    fsub        qword ptr [ebp-1C]
 0001B1FA    fstp        qword ptr [ebp-8]
 0001B1FD    wait
 0001B1FE    xor         eax,eax
 0001B200    pop         edx
 0001B201    pop         ecx
 0001B202    pop         ecx
 0001B203    mov         dword ptr fs:[eax],edx
 0001B206    push        1B21B
 0001B20B    lea         eax,[ebp-20]
 0001B20E    call        @LStrClr
 0001B213    ret
>0001B214    jmp         @HandleFinally
>0001B219    jmp         0001B20B
 0001B21B    fld         qword ptr [ebp-8]
 0001B21E    pop         ebx
 0001B21F    mov         esp,ebp
 0001B221    pop         ebp
 0001B222    ret
*}
end;

//0001B228
function SysErrorMessage(ErrorCode:Integer):AnsiString;
begin
{*
 0001B228    push        ebx
 0001B229    add         esp,0FFFFFF00
 0001B22F    mov         ebx,edx
 0001B231    push        0
 0001B233    push        100
 0001B238    lea         edx,[esp+8]
 0001B23C    push        edx
 0001B23D    push        0
 0001B23F    push        eax
 0001B240    push        0
 0001B242    push        3000
 0001B247    call        kernel32.FormatMessageA
>0001B24C    jmp         0001B24F
 0001B24E    dec         eax
 0001B24F    test        eax,eax
>0001B251    jle         0001B261
 0001B253    mov         dl,byte ptr [esp+eax-1]
 0001B257    sub         dl,21
>0001B25A    jb          0001B24E
 0001B25C    sub         dl,0D
>0001B25F    je          0001B24E
 0001B261    mov         edx,esp
 0001B263    mov         ecx,ebx
 0001B265    xchg        eax,ecx
 0001B266    call        @LStrFromPCharLen
 0001B26B    add         esp,100
 0001B271    pop         ebx
 0001B272    ret
*}
end;

//0001B274
function GetLocaleStr(Locale:Integer; LocaleType:Integer; const Default:AnsiString):AnsiString;
begin
{*
 0001B274    push        ebp
 0001B275    mov         ebp,esp
 0001B277    add         esp,0FFFFFF00
 0001B27D    push        ebx
 0001B27E    push        esi
 0001B27F    mov         esi,ecx
 0001B281    mov         ebx,dword ptr [ebp+8]
 0001B284    push        100
 0001B289    lea         ecx,[ebp-100]
 0001B28F    push        ecx
 0001B290    push        edx
 0001B291    push        eax
 0001B292    call        kernel32.GetLocaleInfoA
 0001B297    test        eax,eax
>0001B299    jle         0001B2AD
 0001B29B    mov         ecx,eax
 0001B29D    dec         ecx
 0001B29E    lea         edx,[ebp-100]
 0001B2A4    mov         eax,ebx
 0001B2A6    call        @LStrFromPCharLen
>0001B2AB    jmp         0001B2B6
 0001B2AD    mov         eax,ebx
 0001B2AF    mov         edx,esi
 0001B2B1    call        @LStrLAsg
 0001B2B6    pop         esi
 0001B2B7    pop         ebx
 0001B2B8    mov         esp,ebp
 0001B2BA    pop         ebp
 0001B2BB    ret         4
*}
end;

//0001B2C0
function GetLocaleChar(Locale:Integer; LocaleType:Integer; Default:Char):Char;
begin
{*
 0001B2C0    push        ebx
 0001B2C1    push        esi
 0001B2C2    push        edi
 0001B2C3    push        ecx
 0001B2C4    mov         ebx,ecx
 0001B2C6    mov         esi,edx
 0001B2C8    mov         edi,eax
 0001B2CA    push        2
 0001B2CC    lea         eax,[esp+4]
 0001B2D0    push        eax
 0001B2D1    push        esi
 0001B2D2    push        edi
 0001B2D3    call        kernel32.GetLocaleInfoA
 0001B2D8    test        eax,eax
>0001B2DA    jle         0001B2E1
 0001B2DC    mov         al,byte ptr [esp]
>0001B2DF    jmp         0001B2E3
 0001B2E1    mov         eax,ebx
 0001B2E3    pop         edx
 0001B2E4    pop         edi
 0001B2E5    pop         esi
 0001B2E6    pop         ebx
 0001B2E7    ret
*}
end;

//0001B2E8
function LocalGetLocaleStr(LocaleType:Integer; Index:Integer; const DefValues:array[$0..-$1] of System.Pointer; const _Dv_:$0..-$1):AnsiString;
begin
{*
 0001B2E8    push        ebp
 0001B2E9    mov         ebp,esp
 0001B2EB    push        ecx
 0001B2EC    push        ebx
 0001B2ED    push        esi
 0001B2EE    push        edi
 0001B2EF    mov         dword ptr [ebp-4],ecx
 0001B2F2    mov         edi,edx
 0001B2F4    mov         esi,eax
 0001B2F6    mov         ebx,dword ptr [ebp+8]
 0001B2F9    push        ebx
 0001B2FA    mov         eax,dword ptr [ebp+10]
 0001B2FD    mov         eax,dword ptr [eax-4]
 0001B300    xor         ecx,ecx
 0001B302    mov         edx,esi
 0001B304    call        GetLocaleStr
 0001B309    cmp         dword ptr [ebx],0
>0001B30C    jne         0001B31B
 0001B30E    mov         eax,dword ptr [ebp-4]
 0001B311    mov         eax,dword ptr [eax+edi*4]
 0001B314    mov         edx,ebx
 0001B316    call        LoadResString
 0001B31B    pop         edi
 0001B31C    pop         esi
 0001B31D    pop         ebx
 0001B31E    pop         ecx
 0001B31F    pop         ebp
 0001B320    ret         8
*}
end;

//0001B324
procedure GetMonthDayNames;
begin
{*
 0001B324    push        ebp
 0001B325    mov         ebp,esp
 0001B327    add         esp,0FFFFFFF4
 0001B32A    push        ebx
 0001B32B    push        esi
 0001B32C    push        edi
 0001B32D    xor         eax,eax
 0001B32F    mov         dword ptr [ebp-0C],eax
 0001B332    xor         eax,eax
 0001B334    push        ebp
 0001B335    push        1B432
 0001B33A    push        dword ptr fs:[eax]
 0001B33D    mov         dword ptr fs:[eax],esp
 0001B340    call        kernel32.GetThreadLocale
 0001B345    mov         dword ptr [ebp-4],eax
 0001B348    mov         ebx,1
 0001B34D    mov         esi,0B651C
 0001B352    mov         edi,0B654C
 0001B357    push        ebp
 0001B358    push        0B
 0001B35A    lea         eax,[ebp-0C]
 0001B35D    push        eax
 0001B35E    mov         ecx,0B41C4;^SShortMonthNameJan:TResStringRec
 0001B363    mov         edx,ebx
 0001B365    dec         edx
 0001B366    lea         eax,[ebx+44]
 0001B369    dec         eax
 0001B36A    call        LocalGetLocaleStr
 0001B36F    pop         ecx
 0001B370    mov         edx,dword ptr [ebp-0C]
 0001B373    mov         eax,esi
 0001B375    call        @LStrAsg
 0001B37A    push        ebp
 0001B37B    push        0B
 0001B37D    lea         eax,[ebp-0C]
 0001B380    push        eax
 0001B381    mov         ecx,0B41F4;^SLongMonthNameJan:TResStringRec
 0001B386    mov         edx,ebx
 0001B388    dec         edx
 0001B389    lea         eax,[ebx+38]
 0001B38C    dec         eax
 0001B38D    call        LocalGetLocaleStr
 0001B392    pop         ecx
 0001B393    mov         edx,dword ptr [ebp-0C]
 0001B396    mov         eax,edi
 0001B398    call        @LStrAsg
 0001B39D    inc         ebx
 0001B39E    add         edi,4
 0001B3A1    add         esi,4
 0001B3A4    cmp         ebx,0D
>0001B3A7    jne         0001B357
 0001B3A9    mov         ebx,1
 0001B3AE    mov         esi,0B657C
 0001B3B3    mov         edi,0B6598
 0001B3B8    lea         eax,[ebx+5]
 0001B3BB    mov         ecx,7
 0001B3C0    cdq
 0001B3C1    idiv        eax,ecx
 0001B3C3    mov         dword ptr [ebp-8],edx
 0001B3C6    push        ebp
 0001B3C7    push        6
 0001B3C9    lea         eax,[ebp-0C]
 0001B3CC    push        eax
 0001B3CD    mov         ecx,0B4224;^SShortDayNameSun:TResStringRec
 0001B3D2    mov         edx,ebx
 0001B3D4    dec         edx
 0001B3D5    mov         eax,dword ptr [ebp-8]
 0001B3D8    add         eax,31
 0001B3DB    call        LocalGetLocaleStr
 0001B3E0    pop         ecx
 0001B3E1    mov         edx,dword ptr [ebp-0C]
 0001B3E4    mov         eax,esi
 0001B3E6    call        @LStrAsg
 0001B3EB    push        ebp
 0001B3EC    push        6
 0001B3EE    lea         eax,[ebp-0C]
 0001B3F1    push        eax
 0001B3F2    mov         ecx,0B4240;^SLongDayNameSun:TResStringRec
 0001B3F7    mov         edx,ebx
 0001B3F9    dec         edx
 0001B3FA    mov         eax,dword ptr [ebp-8]
 0001B3FD    add         eax,2A
 0001B400    call        LocalGetLocaleStr
 0001B405    pop         ecx
 0001B406    mov         edx,dword ptr [ebp-0C]
 0001B409    mov         eax,edi
 0001B40B    call        @LStrAsg
 0001B410    inc         ebx
 0001B411    add         edi,4
 0001B414    add         esi,4
 0001B417    cmp         ebx,8
>0001B41A    jne         0001B3B8
 0001B41C    xor         eax,eax
 0001B41E    pop         edx
 0001B41F    pop         ecx
 0001B420    pop         ecx
 0001B421    mov         dword ptr fs:[eax],edx
 0001B424    push        1B439
 0001B429    lea         eax,[ebp-0C]
 0001B42C    call        @LStrClr
 0001B431    ret
>0001B432    jmp         @HandleFinally
>0001B437    jmp         0001B429
 0001B439    pop         edi
 0001B43A    pop         esi
 0001B43B    pop         ebx
 0001B43C    mov         esp,ebp
 0001B43E    pop         ebp
 0001B43F    ret
*}
end;

//0001B440
function EnumEraNames(Names:PChar):BOOL; stdcall;
begin
{*
 0001B440    push        ebp
 0001B441    mov         ebp,esp
 0001B443    push        ebx
 0001B444    push        esi
 0001B445    push        edi
 0001B446    mov         esi,dword ptr [ebp+8]
 0001B449    mov         edi,0B65C0
 0001B44E    mov         ebx,1
 0001B453    lea         eax,[edi+ebx*4-4]
 0001B457    mov         edx,esi
 0001B459    call        @LStrFromPChar
 0001B45E    mov         eax,dword ptr [edi+ebx*4-4]
 0001B462    call        @LStrLen
 0001B467    inc         eax
 0001B468    add         esi,eax
 0001B46A    inc         ebx
 0001B46B    cmp         byte ptr [esi],0
>0001B46E    jne         0001B453
 0001B470    xor         eax,eax
 0001B472    pop         edi
 0001B473    pop         esi
 0001B474    pop         ebx
 0001B475    pop         ebp
 0001B476    ret         4
*}
end;

//0001B47C
function EnumEraYearOffsets(YearOffsets:PChar):BOOL; stdcall;
begin
{*
 0001B47C    push        ebp
 0001B47D    mov         ebp,esp
 0001B47F    push        ecx
 0001B480    push        ebx
 0001B481    push        esi
 0001B482    push        edi
 0001B483    mov         ebx,dword ptr [ebp+8]
 0001B486    mov         edi,0B65DC
 0001B48B    mov         esi,1
 0001B490    lea         edx,[ebp-4]
 0001B493    mov         eax,ebx
 0001B495    call        @ValLong
 0001B49A    mov         dword ptr [edi+esi*4-4],eax
 0001B49E    cmp         dword ptr [ebp-4],0
>0001B4A2    je          0001B4AA
 0001B4A4    xor         eax,eax
 0001B4A6    mov         dword ptr [edi+esi*4-4],eax
 0001B4AA    mov         eax,ebx
 0001B4AC    call        StrLen
 0001B4B1    inc         eax
 0001B4B2    add         ebx,eax
 0001B4B4    inc         esi
 0001B4B5    cmp         byte ptr [ebx],0
>0001B4B8    jne         0001B490
 0001B4BA    xor         eax,eax
 0001B4BC    pop         edi
 0001B4BD    pop         esi
 0001B4BE    pop         ebx
 0001B4BF    pop         ecx
 0001B4C0    pop         ebp
 0001B4C1    ret         4
*}
end;

//0001B4C4
procedure GetEraNamesAndYearOffsets;
begin
{*
 0001B4C4    push        ebp
 0001B4C5    mov         ebp,esp
 0001B4C7    push        0
 0001B4C9    push        ebx
 0001B4CA    xor         eax,eax
 0001B4CC    push        ebp
 0001B4CD    push        1B545
 0001B4D2    push        dword ptr fs:[eax]
 0001B4D5    mov         dword ptr fs:[eax],esp
 0001B4D8    lea         eax,[ebp-4]
 0001B4DB    push        eax
 0001B4DC    call        kernel32.GetThreadLocale
 0001B4E1    mov         ecx,1B558;'1'
 0001B4E6    mov         edx,100B
 0001B4EB    call        GetLocaleStr
 0001B4F0    mov         eax,dword ptr [ebp-4]
 0001B4F3    mov         edx,1
 0001B4F8    call        StrToIntDef
 0001B4FD    mov         ebx,eax
 0001B4FF    mov         eax,ebx
 0001B501    add         eax,0FFFFFFFD
 0001B504    sub         eax,3
>0001B507    jae         0001B52F
 0001B509    push        4
 0001B50B    push        ebx
 0001B50C    call        kernel32.GetThreadLocale
 0001B511    push        eax
 0001B512    push        1B440;EnumEraNames:BOOL
 0001B517    call        kernel32.EnumCalendarInfoA
 0001B51C    push        3
 0001B51E    push        ebx
 0001B51F    call        kernel32.GetThreadLocale
 0001B524    push        eax
 0001B525    push        1B47C;EnumEraYearOffsets:BOOL
 0001B52A    call        kernel32.EnumCalendarInfoA
 0001B52F    xor         eax,eax
 0001B531    pop         edx
 0001B532    pop         ecx
 0001B533    pop         ecx
 0001B534    mov         dword ptr fs:[eax],edx
 0001B537    push        1B54C
 0001B53C    lea         eax,[ebp-4]
 0001B53F    call        @LStrClr
 0001B544    ret
>0001B545    jmp         @HandleFinally
>0001B54A    jmp         0001B53C
 0001B54C    pop         ebx
 0001B54D    pop         ecx
 0001B54E    pop         ebp
 0001B54F    ret
*}
end;

//0001B55C
function TranslateDateFormat(const FormatStr:AnsiString):AnsiString;
begin
{*
 0001B55C    push        ebp
 0001B55D    mov         ebp,esp
 0001B55F    push        0
 0001B561    push        ebx
 0001B562    push        esi
 0001B563    push        edi
 0001B564    mov         edi,edx
 0001B566    mov         esi,eax
 0001B568    xor         eax,eax
 0001B56A    push        ebp
 0001B56B    push        1B715
 0001B570    push        dword ptr fs:[eax]
 0001B573    mov         dword ptr fs:[eax],esp
 0001B576    mov         ebx,1
 0001B57B    mov         eax,edi
 0001B57D    call        @LStrClr
 0001B582    lea         eax,[ebp-4]
 0001B585    push        eax
 0001B586    call        kernel32.GetThreadLocale
 0001B58B    mov         ecx,1B72C;'1'
 0001B590    mov         edx,1009
 0001B595    call        GetLocaleStr
 0001B59A    mov         eax,dword ptr [ebp-4]
 0001B59D    mov         edx,1
 0001B5A2    call        StrToIntDef
 0001B5A7    add         eax,0FFFFFFFD
 0001B5AA    sub         eax,3
>0001B5AD    jb          0001B6F0
 0001B5B3    mov         ax,[000B65B8]
 0001B5B9    sub         ax,4
>0001B5BD    je          0001B5CC
 0001B5BF    add         eax,0FFFFFFF3
 0001B5C2    sub         ax,2
>0001B5C6    jb          0001B5CC
 0001B5C8    xor         eax,eax
>0001B5CA    jmp         0001B5CE
 0001B5CC    mov         al,1
 0001B5CE    test        al,al
>0001B5D0    je          0001B607
>0001B5D2    jmp         0001B5F7
 0001B5D4    mov         al,byte ptr [esi+ebx-1]
 0001B5D8    sub         al,47
>0001B5DA    je          0001B5F6
 0001B5DC    sub         al,20
>0001B5DE    je          0001B5F6
 0001B5E0    lea         eax,[ebp-4]
 0001B5E3    mov         dl,byte ptr [esi+ebx-1]
 0001B5E7    call        @LStrFromChar
 0001B5EC    mov         edx,dword ptr [ebp-4]
 0001B5EF    mov         eax,edi
 0001B5F1    call        @LStrCat
 0001B5F6    inc         ebx
 0001B5F7    mov         eax,esi
 0001B5F9    call        @LStrLen
 0001B5FE    cmp         ebx,eax
>0001B600    jle         0001B5D4
>0001B602    jmp         0001B6FF
 0001B607    mov         eax,edi
 0001B609    mov         edx,esi
 0001B60B    call        @LStrLAsg
>0001B610    jmp         0001B6FF
 0001B615    mov         al,byte ptr [esi+ebx-1]
 0001B619    and         eax,0FF
 0001B61E    bt          dword ptr ds:[0B4164],eax
>0001B625    jae         0001B64B
 0001B627    lea         eax,[ebp-4]
 0001B62A    push        eax
 0001B62B    mov         ecx,2
 0001B630    mov         edx,ebx
 0001B632    mov         eax,esi
 0001B634    call        @LStrCopy
 0001B639    mov         edx,dword ptr [ebp-4]
 0001B63C    mov         eax,edi
 0001B63E    call        @LStrCat
 0001B643    add         ebx,2
>0001B646    jmp         0001B6F0
 0001B64B    mov         edx,1B730
 0001B650    lea         eax,[esi+ebx-1]
 0001B654    mov         ecx,2
 0001B659    call        StrLIComp
 0001B65E    test        eax,eax
>0001B660    jne         0001B671
 0001B662    mov         eax,edi
 0001B664    mov         edx,1B73C;'ggg'
 0001B669    call        @LStrCat
 0001B66E    inc         ebx
>0001B66F    jmp         0001B6EF
 0001B671    mov         edx,1B740
 0001B676    lea         eax,[esi+ebx-1]
 0001B67A    mov         ecx,4
 0001B67F    call        StrLIComp
 0001B684    test        eax,eax
>0001B686    jne         0001B699
 0001B688    mov         eax,edi
 0001B68A    mov         edx,1B750;'eeee'
 0001B68F    call        @LStrCat
 0001B694    add         ebx,3
>0001B697    jmp         0001B6EF
 0001B699    mov         edx,1B758
 0001B69E    lea         eax,[esi+ebx-1]
 0001B6A2    mov         ecx,2
 0001B6A7    call        StrLIComp
 0001B6AC    test        eax,eax
>0001B6AE    jne         0001B6BF
 0001B6B0    mov         eax,edi
 0001B6B2    mov         edx,1B764;'ee'
 0001B6B7    call        @LStrCat
 0001B6BC    inc         ebx
>0001B6BD    jmp         0001B6EF
 0001B6BF    mov         al,byte ptr [esi+ebx-1]
 0001B6C3    sub         al,59
>0001B6C5    je          0001B6CB
 0001B6C7    sub         al,20
>0001B6C9    jne         0001B6D9
 0001B6CB    mov         eax,edi
 0001B6CD    mov         edx,1B770;'e'
 0001B6D2    call        @LStrCat
>0001B6D7    jmp         0001B6EF
 0001B6D9    lea         eax,[ebp-4]
 0001B6DC    mov         dl,byte ptr [esi+ebx-1]
 0001B6E0    call        @LStrFromChar
 0001B6E5    mov         edx,dword ptr [ebp-4]
 0001B6E8    mov         eax,edi
 0001B6EA    call        @LStrCat
 0001B6EF    inc         ebx
 0001B6F0    mov         eax,esi
 0001B6F2    call        @LStrLen
 0001B6F7    cmp         ebx,eax
>0001B6F9    jle         0001B615
 0001B6FF    xor         eax,eax
 0001B701    pop         edx
 0001B702    pop         ecx
 0001B703    pop         ecx
 0001B704    mov         dword ptr fs:[eax],edx
 0001B707    push        1B71C
 0001B70C    lea         eax,[ebp-4]
 0001B70F    call        @LStrClr
 0001B714    ret
>0001B715    jmp         @HandleFinally
>0001B71A    jmp         0001B70C
 0001B71C    pop         edi
 0001B71D    pop         esi
 0001B71E    pop         ebx
 0001B71F    pop         ecx
 0001B720    pop         ebp
 0001B721    ret
*}
end;

//0001B774
function ExceptObject:TObject;
begin
{*
 0001B774    call        RaiseList
 0001B779    test        eax,eax
>0001B77B    je          0001B786
 0001B77D    call        RaiseList
 0001B782    mov         eax,dword ptr [eax+8]
 0001B785    ret
 0001B786    xor         eax,eax
 0001B788    ret
*}
end;

//0001B78C
function ExceptAddr:Pointer;
begin
{*
 0001B78C    call        RaiseList
 0001B791    test        eax,eax
>0001B793    je          0001B79E
 0001B795    call        RaiseList
 0001B79A    mov         eax,dword ptr [eax+4]
 0001B79D    ret
 0001B79E    xor         eax,eax
 0001B7A0    ret
*}
end;

//0001B7A4
function ConvertAddr(Address:Pointer):Pointer;
begin
{*
 0001B7A4    test        eax,eax
>0001B7A6    je          0001B7AD
 0001B7A8    sub         eax,1000
 0001B7AD    ret
*}
end;

//0001B7B0
function ExceptionErrorMessage(ExceptObject:TObject; ExceptAddr:Pointer; Buffer:PChar; Size:Integer):Integer;
begin
{*
 0001B7B0    push        ebp
 0001B7B1    mov         ebp,esp
 0001B7B3    add         esp,0FFFFFBA8
 0001B7B9    push        ebx
 0001B7BA    push        esi
 0001B7BB    push        edi
 0001B7BC    mov         dword ptr [ebp-4],ecx
 0001B7BF    mov         ebx,edx
 0001B7C1    mov         esi,eax
 0001B7C3    push        1C
 0001B7C5    lea         eax,[ebp-330]
 0001B7CB    push        eax
 0001B7CC    push        ebx
 0001B7CD    call        kernel32.VirtualQuery
 0001B7D2    cmp         dword ptr [ebp-320],1000
>0001B7DC    jne         0001B7FA
 0001B7DE    push        105
 0001B7E3    lea         eax,[ebp-212]
 0001B7E9    push        eax
 0001B7EA    mov         eax,dword ptr [ebp-32C]
 0001B7F0    push        eax
 0001B7F1    call        kernel32.GetModuleFileNameA
 0001B7F6    test        eax,eax
>0001B7F8    jne         0001B81F
 0001B7FA    push        105
 0001B7FF    lea         eax,[ebp-212]
 0001B805    push        eax
 0001B806    mov         eax,[000B5950];^HInstance:Longword
 0001B80B    mov         eax,dword ptr [eax]
 0001B80D    push        eax
 0001B80E    call        kernel32.GetModuleFileNameA
 0001B813    mov         eax,ebx
 0001B815    call        ConvertAddr
 0001B81A    mov         dword ptr [ebp-8],eax
>0001B81D    jmp         0001B828
 0001B81F    sub         ebx,dword ptr [ebp-32C]
 0001B825    mov         dword ptr [ebp-8],ebx
 0001B828    lea         eax,[ebp-212]
 0001B82E    mov         dl,5C
 0001B830    call        AnsiStrRScan
 0001B835    mov         edx,eax
 0001B837    inc         edx
 0001B838    lea         eax,[ebp-10D]
 0001B83E    mov         ecx,104
 0001B843    call        StrLCopy
 0001B848    mov         ebx,1B934
 0001B84D    mov         edi,1B934
 0001B852    mov         eax,esi
 0001B854    mov         edx,dword ptr ds:[176E8];Exception
 0001B85A    call        @IsClass
 0001B85F    test        al,al
>0001B861    je          0001B884
 0001B863    mov         eax,dword ptr [esi+4]
 0001B866    call        @LStrToPChar
 0001B86B    mov         ebx,eax
 0001B86D    mov         eax,ebx
 0001B86F    call        StrLen
 0001B874    test        eax,eax
>0001B876    je          0001B884
 0001B878    cmp         byte ptr [ebx+eax-1],2E
>0001B87D    je          0001B884
 0001B87F    mov         edi,1B938
 0001B884    push        100
 0001B889    lea         eax,[ebp-312]
 0001B88F    push        eax
 0001B890    mov         eax,[000B5BC8];^SResString0:TResStringRec
 0001B895    mov         eax,dword ptr [eax+4]
 0001B898    push        eax
 0001B899    mov         eax,[000B5950];^HInstance:Longword
 0001B89E    mov         eax,dword ptr [eax]
 0001B8A0    call        FindResourceHInstance
 0001B8A5    push        eax
 0001B8A6    call        user32.LoadStringA
 0001B8AB    lea         edx,[ebp-458]
 0001B8B1    mov         eax,dword ptr [esi]
 0001B8B3    call        TObject.ClassName
 0001B8B8    lea         eax,[ebp-458]
 0001B8BE    mov         dword ptr [ebp-358],eax
 0001B8C4    mov         byte ptr [ebp-354],4
 0001B8CB    lea         eax,[ebp-10D]
 0001B8D1    mov         dword ptr [ebp-350],eax
 0001B8D7    mov         byte ptr [ebp-34C],6
 0001B8DE    mov         eax,dword ptr [ebp-8]
 0001B8E1    mov         dword ptr [ebp-348],eax
 0001B8E7    mov         byte ptr [ebp-344],5
 0001B8EE    mov         dword ptr [ebp-340],ebx
 0001B8F4    mov         byte ptr [ebp-33C],6
 0001B8FB    mov         dword ptr [ebp-338],edi
 0001B901    mov         byte ptr [ebp-334],6
 0001B908    lea         eax,[ebp-358]
 0001B90E    push        eax
 0001B90F    push        4
 0001B911    lea         ecx,[ebp-312]
 0001B917    mov         edx,dword ptr [ebp+8]
 0001B91A    mov         eax,dword ptr [ebp-4]
 0001B91D    call        StrLFmt
 0001B922    mov         eax,dword ptr [ebp-4]
 0001B925    call        StrLen
 0001B92A    pop         edi
 0001B92B    pop         esi
 0001B92C    pop         ebx
 0001B92D    mov         esp,ebp
 0001B92F    pop         ebp
 0001B930    ret         4
*}
end;

//0001B93C
procedure ShowException(ExceptObject:TObject; ExceptAddr:Pointer);
begin
{*
 0001B93C    add         esp,0FFFFFBC0
 0001B942    push        400
 0001B947    lea         ecx,[esp+44]
 0001B94B    call        ExceptionErrorMessage
 0001B950    mov         eax,[000B5A94];IsConsole:Boolean
 0001B955    cmp         byte ptr [eax],0
>0001B958    je          0001B974
 0001B95A    lea         edx,[esp+40]
 0001B95E    mov         eax,[000B57D8];^gvar_000B621C:TFileRec
 0001B963    call        @Write0CString
 0001B968    call        @WriteLn
 0001B96D    call        @_IOTest
>0001B972    jmp         0001B9AC
 0001B974    push        40
 0001B976    lea         eax,[esp+4]
 0001B97A    push        eax
 0001B97B    mov         eax,[000B5764];^SExceptTitle:TResStringRec
 0001B980    mov         eax,dword ptr [eax+4]
 0001B983    push        eax
 0001B984    mov         eax,[000B5950];^HInstance:Longword
 0001B989    mov         eax,dword ptr [eax]
 0001B98B    call        FindResourceHInstance
 0001B990    push        eax
 0001B991    call        user32.LoadStringA
 0001B996    push        2010
 0001B99B    lea         eax,[esp+4]
 0001B99F    push        eax
 0001B9A0    lea         eax,[esp+48]
 0001B9A4    push        eax
 0001B9A5    push        0
 0001B9A7    call        user32.MessageBoxA
 0001B9AC    add         esp,440
 0001B9B2    ret
*}
end;

//0001B9B4
constructor Exception.Create(const Msg:AnsiString);
begin
{*
 0001B9B4    push        ebx
 0001B9B5    push        esi
 0001B9B6    push        edi
 0001B9B7    test        dl,dl
>0001B9B9    je          0001B9C3
 0001B9BB    add         esp,0FFFFFFF0
 0001B9BE    call        @ClassCreate
 0001B9C3    mov         esi,ecx
 0001B9C5    mov         ebx,edx
 0001B9C7    mov         edi,eax
 0001B9C9    lea         eax,[edi+4]
 0001B9CC    mov         edx,esi
 0001B9CE    call        @LStrAsg
 0001B9D3    mov         eax,edi
 0001B9D5    test        bl,bl
>0001B9D7    je          0001B9E8
 0001B9D9    call        @AfterConstruction
 0001B9DE    pop         dword ptr fs:[0]
 0001B9E5    add         esp,0C
 0001B9E8    mov         eax,edi
 0001B9EA    pop         edi
 0001B9EB    pop         esi
 0001B9EC    pop         ebx
 0001B9ED    ret
*}
end;

//0001B9F0
constructor Exception.CreateFmt(const Msg:AnsiString; const Args:array[$0..-$1] of System.TVarRec; const _Dv_:$0..-$1);
begin
{*
 0001B9F0    push        ebp
 0001B9F1    mov         ebp,esp
 0001B9F3    push        0
 0001B9F5    push        ebx
 0001B9F6    push        esi
 0001B9F7    push        edi
 0001B9F8    test        dl,dl
>0001B9FA    je          0001BA04
 0001B9FC    add         esp,0FFFFFFF0
 0001B9FF    call        @ClassCreate
 0001BA04    mov         esi,ecx
 0001BA06    mov         ebx,edx
 0001BA08    mov         edi,eax
 0001BA0A    xor         eax,eax
 0001BA0C    push        ebp
 0001BA0D    push        1BA4A
 0001BA12    push        dword ptr fs:[eax]
 0001BA15    mov         dword ptr fs:[eax],esp
 0001BA18    lea         eax,[ebp-4]
 0001BA1B    push        eax
 0001BA1C    mov         edx,dword ptr [ebp+0C]
 0001BA1F    mov         ecx,dword ptr [ebp+8]
 0001BA22    mov         eax,esi
 0001BA24    call        Format
 0001BA29    mov         edx,dword ptr [ebp-4]
 0001BA2C    lea         eax,[edi+4]
 0001BA2F    call        @LStrAsg
 0001BA34    xor         eax,eax
 0001BA36    pop         edx
 0001BA37    pop         ecx
 0001BA38    pop         ecx
 0001BA39    mov         dword ptr fs:[eax],edx
 0001BA3C    push        1BA51
 0001BA41    lea         eax,[ebp-4]
 0001BA44    call        @LStrClr
 0001BA49    ret
>0001BA4A    jmp         @HandleFinally
>0001BA4F    jmp         0001BA41
 0001BA51    mov         eax,edi
 0001BA53    test        bl,bl
>0001BA55    je          0001BA66
 0001BA57    call        @AfterConstruction
 0001BA5C    pop         dword ptr fs:[0]
 0001BA63    add         esp,0C
 0001BA66    mov         eax,edi
 0001BA68    pop         edi
 0001BA69    pop         esi
 0001BA6A    pop         ebx
 0001BA6B    pop         ecx
 0001BA6C    pop         ebp
 0001BA6D    ret         8
*}
end;

//0001BA70
constructor Exception.CreateHelp(const Msg:AnsiString; AHelpContext:Integer);
begin
{*
 0001BA70    push        ebp
 0001BA71    mov         ebp,esp
 0001BA73    push        ebx
 0001BA74    push        esi
 0001BA75    push        edi
 0001BA76    test        dl,dl
>0001BA78    je          0001BA82
 0001BA7A    add         esp,0FFFFFFF0
 0001BA7D    call        @ClassCreate
 0001BA82    mov         esi,ecx
 0001BA84    mov         ebx,edx
 0001BA86    mov         edi,eax
 0001BA88    lea         eax,[edi+4]
 0001BA8B    mov         edx,esi
 0001BA8D    call        @LStrAsg
 0001BA92    mov         eax,dword ptr [ebp+8]
 0001BA95    mov         dword ptr [edi+8],eax
 0001BA98    mov         eax,edi
 0001BA9A    test        bl,bl
>0001BA9C    je          0001BAAD
 0001BA9E    call        @AfterConstruction
 0001BAA3    pop         dword ptr fs:[0]
 0001BAAA    add         esp,0C
 0001BAAD    mov         eax,edi
 0001BAAF    pop         edi
 0001BAB0    pop         esi
 0001BAB1    pop         ebx
 0001BAB2    pop         ebp
 0001BAB3    ret         4
*}
end;

//0001BAB8
procedure EHeapException.FreeInstance;
begin
{*
 0001BAB8    cmp         byte ptr [eax+0C],0
>0001BABC    je          0001BAC3
 0001BABE    call        TObject.FreeInstance
 0001BAC3    ret
*}
end;

//0001BAE4
function CreateInOutError:EInOutError;
begin
{*
 0001BAE4    push        ebp
 0001BAE5    mov         ebp,esp
 0001BAE7    add         esp,0FFFFFFF4
 0001BAEA    push        ebx
 0001BAEB    push        esi
 0001BAEC    xor         eax,eax
 0001BAEE    mov         dword ptr [ebp-0C],eax
 0001BAF1    xor         eax,eax
 0001BAF3    push        ebp
 0001BAF4    push        1BB79
 0001BAF9    push        dword ptr fs:[eax]
 0001BAFC    mov         dword ptr fs:[eax],esp
 0001BAFF    xor         ebx,ebx
 0001BB01    call        IOResult
 0001BB06    mov         esi,eax
>0001BB08    jmp         0001BB0B
 0001BB0A    inc         ebx
 0001BB0B    cmp         ebx,6
>0001BB0E    jg          0001BB19
 0001BB10    cmp         esi,dword ptr [ebx*8+0B425C]
>0001BB17    jne         0001BB0A
 0001BB19    cmp         ebx,6
>0001BB1C    jg          0001BB35
 0001BB1E    mov         ecx,dword ptr [ebx*8+0B4260]
 0001BB25    mov         dl,1
 0001BB27    mov         eax,[0001785C];EInOutError
 0001BB2C    call        Exception.Create
 0001BB31    mov         ebx,eax
>0001BB33    jmp         0001BB60
 0001BB35    mov         dword ptr [ebp-8],esi
 0001BB38    mov         byte ptr [ebp-4],0
 0001BB3C    lea         eax,[ebp-8]
 0001BB3F    push        eax
 0001BB40    push        0
 0001BB42    lea         edx,[ebp-0C]
 0001BB45    mov         eax,[000B5758];^SInOutError:TResStringRec
 0001BB4A    call        LoadResString
 0001BB4F    mov         ecx,dword ptr [ebp-0C]
 0001BB52    mov         dl,1
 0001BB54    mov         eax,[0001785C];EInOutError
 0001BB59    call        Exception.CreateFmt
 0001BB5E    mov         ebx,eax
 0001BB60    mov         dword ptr [ebx+0C],esi
 0001BB63    xor         eax,eax
 0001BB65    pop         edx
 0001BB66    pop         ecx
 0001BB67    pop         ecx
 0001BB68    mov         dword ptr fs:[eax],edx
 0001BB6B    push        1BB80
 0001BB70    lea         eax,[ebp-0C]
 0001BB73    call        @LStrClr
 0001BB78    ret
>0001BB79    jmp         @HandleFinally
>0001BB7E    jmp         0001BB70
 0001BB80    mov         eax,ebx
 0001BB82    pop         esi
 0001BB83    pop         ebx
 0001BB84    mov         esp,ebp
 0001BB86    pop         ebp
 0001BB87    ret
*}
end;

//0001BBA8
procedure ErrorHandler(ErrorCode:Integer; ErrorAddr:Pointer);
begin
{*
 0001BBA8    push        ebx
 0001BBA9    mov         ebx,edx
 0001BBAB    mov         edx,eax
 0001BBAD    dec         edx
>0001BBAE    je          0001BBBB
 0001BBB0    dec         edx
>0001BBB1    je          0001BBC2
 0001BBB3    dec         edx
 0001BBB4    sub         edx,15
>0001BBB7    jb          0001BBC9
>0001BBB9    jmp         0001BBDE
 0001BBBB    mov         eax,[000B6600]
>0001BBC0    jmp         0001BBE3
 0001BBC2    mov         eax,[000B6604]
>0001BBC7    jmp         0001BBE3
 0001BBC9    lea         eax,[eax*8+0B427C]
 0001BBD0    mov         ecx,dword ptr [eax+4]
 0001BBD3    mov         eax,dword ptr [eax]
 0001BBD5    mov         dl,1
 0001BBD7    call        Exception.Create
>0001BBDC    jmp         0001BBE3
 0001BBDE    call        CreateInOutError
 0001BBE3    push        ebx
>0001BBE4    jmp         @RaiseExcept
 0001BBE9    pop         ebx
 0001BBEA    ret
*}
end;

//0001BBEC
{*function sub_0001BBEC(?:?; ?:?; ?:?):?;
begin
 0001BBEC    push        ebp
 0001BBED    mov         ebp,esp
 0001BBEF    add         esp,0FFFFFFE0
 0001BBF2    push        ebx
 0001BBF3    push        esi
 0001BBF4    push        edi
 0001BBF5    xor         ebx,ebx
 0001BBF7    mov         dword ptr [ebp-20],ebx
 0001BBFA    mov         dword ptr [ebp-4],ebx
 0001BBFD    mov         edi,ecx
 0001BBFF    mov         esi,edx
 0001BC01    mov         ebx,eax
 0001BC03    xor         eax,eax
 0001BC05    push        ebp
 0001BC06    push        1BC88
 0001BC0B    push        dword ptr fs:[eax]
 0001BC0E    mov         dword ptr fs:[eax],esp
 0001BC11    test        ebx,ebx
>0001BC13    je          0001BC21
 0001BC15    lea         eax,[ebp-4]
 0001BC18    mov         edx,ebx
 0001BC1A    call        @LStrLAsg
>0001BC1F    jmp         0001BC2E
 0001BC21    lea         edx,[ebp-4]
 0001BC24    mov         eax,[000B5A48];^SAssertionFailed:TResStringRec
 0001BC29    call        LoadResString
 0001BC2E    mov         eax,dword ptr [ebp-4]
 0001BC31    mov         dword ptr [ebp-1C],eax
 0001BC34    mov         byte ptr [ebp-18],0B
 0001BC38    mov         dword ptr [ebp-14],esi
 0001BC3B    mov         byte ptr [ebp-10],0B
 0001BC3F    mov         dword ptr [ebp-0C],edi
 0001BC42    mov         byte ptr [ebp-8],0
 0001BC46    lea         eax,[ebp-1C]
 0001BC49    push        eax
 0001BC4A    push        2
 0001BC4C    lea         edx,[ebp-20]
 0001BC4F    mov         eax,[000B5B08];^SAssertError:TResStringRec
 0001BC54    call        LoadResString
 0001BC59    mov         ecx,dword ptr [ebp-20]
 0001BC5C    mov         dl,1
 0001BC5E    mov         eax,[00017F64];EAssertionFailed
 0001BC63    call        Exception.CreateFmt;EAssertionFailed.Create
 0001BC68    mov         ebx,eax
 0001BC6A    xor         eax,eax
 0001BC6C    pop         edx
 0001BC6D    pop         ecx
 0001BC6E    pop         ecx
 0001BC6F    mov         dword ptr fs:[eax],edx
 0001BC72    push        1BC8F
 0001BC77    lea         eax,[ebp-20]
 0001BC7A    call        @LStrClr
 0001BC7F    lea         eax,[ebp-4]
 0001BC82    call        @LStrClr
 0001BC87    ret
>0001BC88    jmp         @HandleFinally
>0001BC8D    jmp         0001BC77
 0001BC8F    mov         eax,ebx
 0001BC91    pop         edi
 0001BC92    pop         esi
 0001BC93    pop         ebx
 0001BC94    mov         esp,ebp
 0001BC96    pop         ebp
 0001BC97    ret
end;*}

//0001BC98
procedure sub_0001BC98;
begin
{*
 0001BC98    mov         esp,ecx
 0001BC9A    mov         dword ptr [esp],edx
 0001BC9D    mov         ebp,dword ptr [ebp]
>0001BCA0    jmp         @RaiseExcept
*}
end;

//0001BCA8
procedure AssertErrorHandler(const Message:AnsiString; const Filename:AnsiString; LineNumber:Integer; ErrorAddr:Pointer);
begin
{*
 0001BCA8    push        ebp
 0001BCA9    mov         ebp,esp
 0001BCAB    call        0001BBEC
 0001BCB0    lea         ecx,[ebp+8]
 0001BCB3    add         ecx,4
 0001BCB6    mov         edx,dword ptr [ebp+8]
 0001BCB9    call        0001BC98
 0001BCBE    pop         ebp
 0001BCBF    ret         4
*}
end;

//0001BCC4
procedure AbstractErrorHandler;
begin
{*
 0001BCC4    push        ebp
 0001BCC5    mov         ebp,esp
 0001BCC7    add         esp,0FFFFFFF4
 0001BCCA    xor         eax,eax
 0001BCCC    mov         dword ptr [ebp-0C],eax
 0001BCCF    xor         eax,eax
 0001BCD1    push        ebp
 0001BCD2    push        1BD23
 0001BCD7    push        dword ptr fs:[eax]
 0001BCDA    mov         dword ptr fs:[eax],esp
 0001BCDD    xor         eax,eax
 0001BCDF    mov         dword ptr [ebp-8],eax
 0001BCE2    mov         byte ptr [ebp-4],0B
 0001BCE6    lea         eax,[ebp-8]
 0001BCE9    push        eax
 0001BCEA    push        0
 0001BCEC    lea         edx,[ebp-0C]
 0001BCEF    mov         eax,[000B5788];^SAbstractError:TResStringRec
 0001BCF4    call        LoadResString
 0001BCF9    mov         ecx,dword ptr [ebp-0C]
 0001BCFC    mov         dl,1
 0001BCFE    mov         eax,[00017FC4];EAbstractError
 0001BD03    call        Exception.CreateFmt
 0001BD08    call        @RaiseExcept
 0001BD0D    xor         eax,eax
 0001BD0F    pop         edx
 0001BD10    pop         ecx
 0001BD11    pop         ecx
 0001BD12    mov         dword ptr fs:[eax],edx
 0001BD15    push        1BD2A
 0001BD1A    lea         eax,[ebp-0C]
 0001BD1D    call        @LStrClr
 0001BD22    ret
>0001BD23    jmp         @HandleFinally
>0001BD28    jmp         0001BD1A
 0001BD2A    mov         esp,ebp
 0001BD2C    pop         ebp
 0001BD2D    ret
*}
end;

//0001BD30
function MapException(P:PExceptionRecord):Byte;
begin
{*
 0001BD30    mov         eax,dword ptr [eax]
 0001BD32    cmp         eax,0C0000092
>0001BD37    jg          0001BD65
>0001BD39    je          0001BD94
 0001BD3B    cmp         eax,0C000008E
>0001BD40    jg          0001BD57
>0001BD42    je          0001BD97
 0001BD44    sub         eax,0C0000005
>0001BD49    je          0001BDA0
 0001BD4B    sub         eax,87
>0001BD50    je          0001BD8E
 0001BD52    dec         eax
>0001BD53    je          0001BD9D
>0001BD55    jmp         0001BDAC
 0001BD57    add         eax,3FFFFF71
 0001BD5C    sub         eax,2
>0001BD5F    jb          0001BD94
>0001BD61    je          0001BD9A
>0001BD63    jmp         0001BDAC
 0001BD65    cmp         eax,0C0000096
>0001BD6A    jg          0001BD7D
>0001BD6C    je          0001BDA3
 0001BD6E    sub         eax,0C0000093
>0001BD73    je          0001BD9D
 0001BD75    dec         eax
>0001BD76    je          0001BD8B
 0001BD78    dec         eax
>0001BD79    je          0001BD91
>0001BD7B    jmp         0001BDAC
 0001BD7D    sub         eax,0C00000FD
>0001BD82    je          0001BDA9
 0001BD84    sub         eax,3D
>0001BD87    je          0001BDA6
>0001BD89    jmp         0001BDAC
 0001BD8B    mov         al,3
 0001BD8D    ret
 0001BD8E    mov         al,4
 0001BD90    ret
 0001BD91    mov         al,5
 0001BD93    ret
 0001BD94    mov         al,6
 0001BD96    ret
 0001BD97    mov         al,7
 0001BD99    ret
 0001BD9A    mov         al,8
 0001BD9C    ret
 0001BD9D    mov         al,9
 0001BD9F    ret
 0001BDA0    mov         al,0B
 0001BDA2    ret
 0001BDA3    mov         al,0C
 0001BDA5    ret
 0001BDA6    mov         al,0D
 0001BDA8    ret
 0001BDA9    mov         al,0E
 0001BDAB    ret
 0001BDAC    mov         al,16
 0001BDAE    ret
*}
end;

//0001BDB0
function GetExceptionClass(P:PExceptionRecord):ExceptClass;
begin
{*
 0001BDB0    call        MapException
 0001BDB5    and         eax,0FF
 0001BDBA    mov         eax,dword ptr [eax*8+0B427C]
 0001BDC1    ret
*}
end;

//0001BDC4
function CreateAVObject:Exception;
begin
{*
 0001BDC4    push        ebp
 0001BDC5    mov         ebp,esp
 0001BDC7    add         esp,0FFFFFE98
 0001BDCD    push        ebx
 0001BDCE    push        esi
 0001BDCF    xor         eax,eax
 0001BDD1    mov         dword ptr [ebp-14C],eax
 0001BDD7    mov         dword ptr [ebp-150],eax
 0001BDDD    mov         dword ptr [ebp-4],eax
 0001BDE0    xor         eax,eax
 0001BDE2    push        ebp
 0001BDE3    push        1BF68
 0001BDE8    push        dword ptr fs:[eax]
 0001BDEB    mov         dword ptr fs:[eax],esp
 0001BDEE    mov         eax,dword ptr [ebp+8]
 0001BDF1    mov         ebx,dword ptr [eax-4]
 0001BDF4    cmp         dword ptr [ebx+14],0
>0001BDF8    jne         0001BE09
 0001BDFA    lea         edx,[ebp-4]
 0001BDFD    mov         eax,[000B5C0C];^SReadAccess:TResStringRec
 0001BE02    call        LoadResString
>0001BE07    jmp         0001BE16
 0001BE09    lea         edx,[ebp-4]
 0001BE0C    mov         eax,[000B59F8];^SWriteAccess:TResStringRec
 0001BE11    call        LoadResString
 0001BE16    mov         esi,dword ptr [ebx+18]
 0001BE19    push        1C
 0001BE1B    lea         eax,[ebp-20]
 0001BE1E    push        eax
 0001BE1F    mov         eax,dword ptr [ebx+0C]
 0001BE22    push        eax
 0001BE23    call        kernel32.VirtualQuery
 0001BE28    cmp         dword ptr [ebp-10],1000
>0001BE2F    jne         0001BEE8
 0001BE35    push        105
 0001BE3A    lea         eax,[ebp-125]
 0001BE40    push        eax
 0001BE41    mov         eax,dword ptr [ebp-1C]
 0001BE44    push        eax
 0001BE45    call        kernel32.GetModuleFileNameA
 0001BE4A    test        eax,eax
>0001BE4C    je          0001BEE8
 0001BE52    mov         eax,dword ptr [ebx+0C]
 0001BE55    mov         dword ptr [ebp-148],eax
 0001BE5B    mov         byte ptr [ebp-144],5
 0001BE62    lea         eax,[ebp-150]
 0001BE68    lea         edx,[ebp-125]
 0001BE6E    mov         ecx,105
 0001BE73    call        @LStrFromArray
 0001BE78    mov         eax,dword ptr [ebp-150]
 0001BE7E    lea         edx,[ebp-14C]
 0001BE84    call        ExtractFileName
 0001BE89    mov         eax,dword ptr [ebp-14C]
 0001BE8F    mov         dword ptr [ebp-140],eax
 0001BE95    mov         byte ptr [ebp-13C],0B
 0001BE9C    mov         eax,dword ptr [ebp-4]
 0001BE9F    mov         dword ptr [ebp-138],eax
 0001BEA5    mov         byte ptr [ebp-134],0B
 0001BEAC    mov         dword ptr [ebp-130],esi
 0001BEB2    mov         byte ptr [ebp-12C],5
 0001BEB9    lea         eax,[ebp-148]
 0001BEBF    push        eax
 0001BEC0    push        3
 0001BEC2    lea         edx,[ebp-150]
 0001BEC8    mov         eax,[000B5AB8];^SModuleAccessViolation:TResStringRec
 0001BECD    call        LoadResString
 0001BED2    mov         ecx,dword ptr [ebp-150]
 0001BED8    mov         dl,1
 0001BEDA    mov         eax,[00017D9C];EAccessViolation
 0001BEDF    call        Exception.CreateFmt
 0001BEE4    mov         ebx,eax
>0001BEE6    jmp         0001BF42
 0001BEE8    mov         eax,dword ptr [ebx+0C]
 0001BEEB    mov         dword ptr [ebp-168],eax
 0001BEF1    mov         byte ptr [ebp-164],5
 0001BEF8    mov         eax,dword ptr [ebp-4]
 0001BEFB    mov         dword ptr [ebp-160],eax
 0001BF01    mov         byte ptr [ebp-15C],0B
 0001BF08    mov         dword ptr [ebp-158],esi
 0001BF0E    mov         byte ptr [ebp-154],5
 0001BF15    lea         eax,[ebp-168]
 0001BF1B    push        eax
 0001BF1C    push        2
 0001BF1E    lea         edx,[ebp-14C]
 0001BF24    mov         eax,[000B5B48];^SAccessViolation:TResStringRec
 0001BF29    call        LoadResString
 0001BF2E    mov         ecx,dword ptr [ebp-14C]
 0001BF34    mov         dl,1
 0001BF36    mov         eax,[00017D9C];EAccessViolation
 0001BF3B    call        Exception.CreateFmt
 0001BF40    mov         ebx,eax
 0001BF42    xor         eax,eax
 0001BF44    pop         edx
 0001BF45    pop         ecx
 0001BF46    pop         ecx
 0001BF47    mov         dword ptr fs:[eax],edx
 0001BF4A    push        1BF6F
 0001BF4F    lea         eax,[ebp-150]
 0001BF55    mov         edx,2
 0001BF5A    call        @LStrArrayClr
 0001BF5F    lea         eax,[ebp-4]
 0001BF62    call        @LStrClr
 0001BF67    ret
>0001BF68    jmp         @HandleFinally
>0001BF6D    jmp         0001BF4F
 0001BF6F    mov         eax,ebx
 0001BF71    pop         esi
 0001BF72    pop         ebx
 0001BF73    mov         esp,ebp
 0001BF75    pop         ebp
 0001BF76    ret
*}
end;

//0001BF78
function GetExceptionObject(P:PExceptionRecord):Exception;
begin
{*
 0001BF78    push        ebp
 0001BF79    mov         ebp,esp
 0001BF7B    add         esp,0FFFFFFF0
 0001BF7E    push        ebx
 0001BF7F    xor         edx,edx
 0001BF81    mov         dword ptr [ebp-10],edx
 0001BF84    mov         dword ptr [ebp-4],eax
 0001BF87    xor         eax,eax
 0001BF89    push        ebp
 0001BF8A    push        1C033
 0001BF8F    push        dword ptr fs:[eax]
 0001BF92    mov         dword ptr fs:[eax],esp
 0001BF95    mov         eax,dword ptr [ebp-4]
 0001BF98    call        MapException
 0001BF9D    and         eax,0FF
 0001BFA2    mov         edx,eax
 0001BFA4    add         edx,0FFFFFFFD
 0001BFA7    sub         edx,8
>0001BFAA    jb          0001BFB4
>0001BFAC    je          0001BFCB
 0001BFAE    dec         edx
 0001BFAF    sub         edx,0A
>0001BFB2    jae         0001BFD6
 0001BFB4    lea         eax,[eax*8+0B427C]
 0001BFBB    mov         ecx,dword ptr [eax+4]
 0001BFBE    mov         eax,dword ptr [eax]
 0001BFC0    mov         dl,1
 0001BFC2    call        Exception.Create
 0001BFC7    mov         ebx,eax
>0001BFC9    jmp         0001C006
 0001BFCB    push        ebp
 0001BFCC    call        CreateAVObject
 0001BFD1    pop         ecx
 0001BFD2    mov         ebx,eax
>0001BFD4    jmp         0001C006
 0001BFD6    mov         eax,dword ptr [ebp-4]
 0001BFD9    mov         eax,dword ptr [eax]
 0001BFDB    mov         dword ptr [ebp-0C],eax
 0001BFDE    mov         byte ptr [ebp-8],0
 0001BFE2    lea         eax,[ebp-0C]
 0001BFE5    push        eax
 0001BFE6    push        0
 0001BFE8    lea         edx,[ebp-10]
 0001BFEB    mov         eax,[000B5660];^SExternalException:TResStringRec
 0001BFF0    call        LoadResString
 0001BFF5    mov         ecx,dword ptr [ebp-10]
 0001BFF8    mov         dl,1
 0001BFFA    mov         eax,[0001790C];EExternalException
 0001BFFF    call        Exception.CreateFmt
 0001C004    mov         ebx,eax
 0001C006    mov         eax,ebx
 0001C008    mov         edx,dword ptr ds:[178B4];EExternal
 0001C00E    call        @IsClass
 0001C013    test        al,al
>0001C015    je          0001C01D
 0001C017    mov         eax,dword ptr [ebp-4]
 0001C01A    mov         dword ptr [ebx+0C],eax
 0001C01D    xor         eax,eax
 0001C01F    pop         edx
 0001C020    pop         ecx
 0001C021    pop         ecx
 0001C022    mov         dword ptr fs:[eax],edx
 0001C025    push        1C03A
 0001C02A    lea         eax,[ebp-10]
 0001C02D    call        @LStrClr
 0001C032    ret
>0001C033    jmp         @HandleFinally
>0001C038    jmp         0001C02A
 0001C03A    mov         eax,ebx
 0001C03C    pop         ebx
 0001C03D    mov         esp,ebp
 0001C03F    pop         ebp
 0001C040    ret
*}
end;

//0001C044
procedure ExceptHandler(ExceptObject:TObject; ExceptAddr:Pointer);
begin
{*
 0001C044    call        ShowException
 0001C049    mov         eax,1
 0001C04E    call        @Halt
 0001C053    ret
*}
end;

//0001C054
procedure InitExceptions;
begin
{*
 0001C054    push        ebp
 0001C055    mov         ebp,esp
 0001C057    push        0
 0001C059    xor         eax,eax
 0001C05B    push        ebp
 0001C05C    push        1C10E
 0001C061    push        dword ptr fs:[eax]
 0001C064    mov         dword ptr fs:[eax],esp
 0001C067    lea         edx,[ebp-4]
 0001C06A    mov         eax,[000B5768];^SOutOfMemory:TResStringRec
 0001C06F    call        LoadResString
 0001C074    mov         ecx,dword ptr [ebp-4]
 0001C077    mov         dl,1
 0001C079    mov         eax,[00017800];EOutOfMemory
 0001C07E    call        Exception.Create
 0001C083    mov         [000B6600],eax
 0001C088    lea         edx,[ebp-4]
 0001C08B    mov         eax,[000B59A8];^SInvalidPointer:TResStringRec
 0001C090    call        LoadResString
 0001C095    mov         ecx,dword ptr [ebp-4]
 0001C098    mov         dl,1
 0001C09A    mov         eax,[00017C88];EInvalidPointer
 0001C09F    call        Exception.Create
 0001C0A4    mov         [000B6604],eax
 0001C0A9    mov         eax,[000B5674];ErrorProc:Pointer
 0001C0AE    mov         dword ptr [eax],1BBA8;ErrorHandler
 0001C0B4    mov         eax,[000B5828];ExceptProc:Pointer
 0001C0B9    mov         dword ptr [eax],1C044;ExceptHandler
 0001C0BF    mov         eax,[000B5740];ExceptionClass:TClass
 0001C0C4    mov         edx,dword ptr ds:[176E8];Exception
 0001C0CA    mov         dword ptr [eax],edx
 0001C0CC    mov         eax,[000B57FC];ExceptClsProc:Pointer
 0001C0D1    mov         dword ptr [eax],1BDB0;GetExceptionClass:ExceptClass
 0001C0D7    mov         eax,[000B5830];ExceptObjProc:Pointer
 0001C0DC    mov         dword ptr [eax],1BF78;GetExceptionObject:Exception
 0001C0E2    mov         eax,[000B59E4];AssertErrorProc:Pointer
 0001C0E7    mov         dword ptr [eax],1BCA8;AssertErrorHandler
 0001C0ED    mov         eax,[000B565C];AbstractErrorProc:Pointer
 0001C0F2    mov         dword ptr [eax],1BCC4;AbstractErrorHandler
 0001C0F8    xor         eax,eax
 0001C0FA    pop         edx
 0001C0FB    pop         ecx
 0001C0FC    pop         ecx
 0001C0FD    mov         dword ptr fs:[eax],edx
 0001C100    push        1C115
 0001C105    lea         eax,[ebp-4]
 0001C108    call        @LStrClr
 0001C10D    ret
>0001C10E    jmp         @HandleFinally
>0001C113    jmp         0001C105
 0001C115    pop         ecx
 0001C116    pop         ebp
 0001C117    ret
*}
end;

//0001C118
procedure DoneExceptions;
begin
{*
 0001C118    mov         eax,[000B6600]
 0001C11D    mov         byte ptr [eax+0C],1
 0001C121    mov         eax,[000B6600]
 0001C126    mov         edx,dword ptr [eax]
 0001C128    call        dword ptr [edx-8]
 0001C12B    xor         eax,eax
 0001C12D    mov         [000B6600],eax
 0001C132    mov         eax,[000B6604]
 0001C137    mov         byte ptr [eax+0C],1
 0001C13B    mov         eax,[000B6604]
 0001C140    call        TObject.Free
 0001C145    xor         eax,eax
 0001C147    mov         [000B6604],eax
 0001C14C    mov         eax,[000B5674];ErrorProc:Pointer
 0001C151    xor         edx,edx
 0001C153    mov         dword ptr [eax],edx
 0001C155    mov         eax,[000B5828];ExceptProc:Pointer
 0001C15A    xor         edx,edx
 0001C15C    mov         dword ptr [eax],edx
 0001C15E    mov         eax,[000B5740];ExceptionClass:TClass
 0001C163    xor         edx,edx
 0001C165    mov         dword ptr [eax],edx
 0001C167    mov         eax,[000B57FC];ExceptClsProc:Pointer
 0001C16C    xor         edx,edx
 0001C16E    mov         dword ptr [eax],edx
 0001C170    mov         eax,[000B5830];ExceptObjProc:Pointer
 0001C175    xor         edx,edx
 0001C177    mov         dword ptr [eax],edx
 0001C179    mov         eax,[000B59E4];AssertErrorProc:Pointer
 0001C17E    xor         edx,edx
 0001C180    mov         dword ptr [eax],edx
 0001C182    ret
*}
end;

//0001C184
procedure InitPlatformId;
begin
{*
 0001C184    add         esp,0FFFFFF6C
 0001C18A    mov         dword ptr [esp],94
 0001C191    push        esp
 0001C192    call        kernel32.GetVersionExA
 0001C197    test        eax,eax
>0001C199    je          0001C1D2
 0001C19B    mov         eax,dword ptr [esp+10]
 0001C19F    mov         [000B411C],eax
 0001C1A4    mov         eax,dword ptr [esp+4]
 0001C1A8    mov         [000B4120],eax
 0001C1AD    mov         eax,dword ptr [esp+8]
 0001C1B1    mov         [000B4124],eax
 0001C1B6    mov         eax,dword ptr [esp+0C]
 0001C1BA    mov         [000B4128],eax
 0001C1BF    mov         eax,0B412C
 0001C1C4    lea         edx,[esp+14]
 0001C1C8    mov         ecx,80
 0001C1CD    call        @LStrFromArray
 0001C1D2    add         esp,94
 0001C1D8    ret
*}
end;

//0001C1DC
function ByteTypeTest(P:PChar; Index:Integer):TMbcsByteType;
begin
{*
 0001C1DC    push        esi
 0001C1DD    push        edi
 0001C1DE    mov         edi,edx
 0001C1E0    xor         edx,edx
 0001C1E2    test        eax,eax
>0001C1E4    je          0001C24C
 0001C1E6    cmp         byte ptr [eax+edi],0
>0001C1EA    je          0001C24C
 0001C1EC    test        edi,edi
>0001C1EE    jne         0001C204
 0001C1F0    mov         al,byte ptr [eax]
 0001C1F2    and         eax,0FF
 0001C1F7    bt          dword ptr ds:[0B4164],eax
>0001C1FE    jae         0001C24C
 0001C200    mov         dl,1
>0001C202    jmp         0001C24C
 0001C204    mov         esi,edi
 0001C206    dec         esi
>0001C207    jmp         0001C20A
 0001C209    dec         esi
 0001C20A    test        esi,esi
>0001C20C    jl          0001C220
 0001C20E    mov         cl,byte ptr [eax+esi]
 0001C211    and         ecx,0FF
 0001C217    bt          dword ptr ds:[0B4164],ecx
>0001C21E    jb          0001C209
 0001C220    mov         ecx,edi
 0001C222    sub         ecx,esi
 0001C224    and         ecx,80000001
>0001C22A    jns         0001C231
 0001C22C    dec         ecx
 0001C22D    or          ecx,0FFFFFFFE
 0001C230    inc         ecx
 0001C231    test        ecx,ecx
>0001C233    jne         0001C239
 0001C235    mov         dl,2
>0001C237    jmp         0001C24C
 0001C239    mov         al,byte ptr [eax+edi]
 0001C23C    and         eax,0FF
 0001C241    bt          dword ptr ds:[0B4164],eax
>0001C248    jae         0001C24C
 0001C24A    mov         dl,1
 0001C24C    mov         eax,edx
 0001C24E    pop         edi
 0001C24F    pop         esi
 0001C250    ret
*}
end;

//0001C254
function ByteType(const S:AnsiString; Index:Integer):TMbcsByteType;
begin
{*
 0001C254    push        ebx
 0001C255    push        esi
 0001C256    mov         esi,edx
 0001C258    mov         ebx,eax
 0001C25A    xor         eax,eax
 0001C25C    cmp         byte ptr ds:[0B65BC],0
>0001C263    je          0001C274
 0001C265    mov         eax,ebx
 0001C267    call        @LStrToPChar
 0001C26C    mov         edx,esi
 0001C26E    dec         edx
 0001C26F    call        ByteTypeTest
 0001C274    pop         esi
 0001C275    pop         ebx
 0001C276    ret
*}
end;

//0001C278
function StrByteType(Str:PChar; Index:Cardinal):TMbcsByteType;
begin
{*
 0001C278    xor         ecx,ecx
 0001C27A    cmp         byte ptr ds:[0B65BC],0
>0001C281    je          0001C28A
 0001C283    call        ByteTypeTest
 0001C288    mov         ecx,eax
 0001C28A    mov         eax,ecx
 0001C28C    ret
*}
end;

//0001C290
function ByteToCharLen(const S:AnsiString; MaxLen:Integer):Integer;
begin
{*
 0001C290    push        ebx
 0001C291    push        esi
 0001C292    mov         esi,edx
 0001C294    mov         ebx,eax
 0001C296    mov         eax,ebx
 0001C298    call        @LStrLen
 0001C29D    cmp         esi,eax
>0001C29F    jle         0001C2AA
 0001C2A1    mov         eax,ebx
 0001C2A3    call        @LStrLen
 0001C2A8    mov         esi,eax
 0001C2AA    mov         edx,esi
 0001C2AC    mov         eax,ebx
 0001C2AE    call        ByteToCharIndex
 0001C2B3    pop         esi
 0001C2B4    pop         ebx
 0001C2B5    ret
*}
end;

//0001C2B8
function ByteToCharIndex(const S:AnsiString; Index:Integer):Integer;
begin
{*
 0001C2B8    push        ebx
 0001C2B9    push        esi
 0001C2BA    push        edi
 0001C2BB    mov         ebx,edx
 0001C2BD    mov         edi,eax
 0001C2BF    xor         esi,esi
 0001C2C1    test        ebx,ebx
>0001C2C3    jle         0001C300
 0001C2C5    mov         eax,edi
 0001C2C7    call        @LStrLen
 0001C2CC    cmp         ebx,eax
>0001C2CE    jg          0001C300
 0001C2D0    mov         esi,ebx
 0001C2D2    cmp         byte ptr ds:[0B65BC],0
>0001C2D9    je          0001C300
 0001C2DB    mov         eax,1
 0001C2E0    xor         esi,esi
 0001C2E2    cmp         ebx,eax
>0001C2E4    jl          0001C300
 0001C2E6    mov         dl,byte ptr [edi+eax-1]
 0001C2EA    and         edx,0FF
 0001C2F0    bt          dword ptr ds:[0B4164],edx
>0001C2F7    jae         0001C2FA
 0001C2F9    inc         eax
 0001C2FA    inc         eax
 0001C2FB    inc         esi
 0001C2FC    cmp         ebx,eax
>0001C2FE    jge         0001C2E6
 0001C300    mov         eax,esi
 0001C302    pop         edi
 0001C303    pop         esi
 0001C304    pop         ebx
 0001C305    ret
*}
end;

//0001C308
procedure CountChars(const S:AnsiString; MaxChars:Integer; var CharCount:Integer; var ByteCount:Integer);
begin
{*
 0001C308    push        ebp
 0001C309    mov         ebp,esp
 0001C30B    add         esp,0FFFFFFF8
 0001C30E    push        esi
 0001C30F    push        edi
 0001C310    mov         dword ptr [ebp-8],ecx
 0001C313    mov         dword ptr [ebp-4],edx
 0001C316    mov         esi,eax
 0001C318    mov         eax,esi
 0001C31A    call        @LStrLen
 0001C31F    mov         edi,eax
 0001C321    mov         edx,1
 0001C326    mov         eax,1
>0001C32B    jmp         0001C343
 0001C32D    inc         edx
 0001C32E    mov         cl,byte ptr [esi+eax-1]
 0001C332    and         ecx,0FF
 0001C338    bt          dword ptr ds:[0B4164],ecx
>0001C33F    jae         0001C342
 0001C341    inc         eax
 0001C342    inc         eax
 0001C343    cmp         edi,eax
>0001C345    jle         0001C34C
 0001C347    cmp         edx,dword ptr [ebp-4]
>0001C34A    jl          0001C32D
 0001C34C    cmp         edx,dword ptr [ebp-4]
>0001C34F    jne         0001C369
 0001C351    cmp         edi,eax
>0001C353    jle         0001C369
 0001C355    mov         cl,byte ptr [esi+eax-1]
 0001C359    and         ecx,0FF
 0001C35F    bt          dword ptr ds:[0B4164],ecx
>0001C366    jae         0001C369
 0001C368    inc         eax
 0001C369    mov         ecx,dword ptr [ebp-8]
 0001C36C    mov         dword ptr [ecx],edx
 0001C36E    mov         edx,dword ptr [ebp+8]
 0001C371    mov         dword ptr [edx],eax
 0001C373    pop         edi
 0001C374    pop         esi
 0001C375    pop         ecx
 0001C376    pop         ecx
 0001C377    pop         ebp
 0001C378    ret         4
*}
end;

//0001C37C
function CharToByteIndex(const S:AnsiString; Index:Integer):Integer;
begin
{*
 0001C37C    push        ebx
 0001C37D    push        esi
 0001C37E    add         esp,0FFFFFFF8
 0001C381    mov         ebx,edx
 0001C383    mov         esi,eax
 0001C385    xor         eax,eax
 0001C387    mov         dword ptr [esp],eax
 0001C38A    test        ebx,ebx
>0001C38C    jle         0001C3D8
 0001C38E    mov         eax,esi
 0001C390    call        @LStrLen
 0001C395    cmp         ebx,eax
>0001C397    jg          0001C3D8
 0001C399    cmp         ebx,1
>0001C39C    jle         0001C3D5
 0001C39E    cmp         byte ptr ds:[0B65BC],0
>0001C3A5    je          0001C3D5
 0001C3A7    push        esp
 0001C3A8    lea         ecx,[esp+8]
 0001C3AC    mov         edx,ebx
 0001C3AE    dec         edx
 0001C3AF    mov         eax,esi
 0001C3B1    call        CountChars
 0001C3B6    dec         ebx
 0001C3B7    cmp         ebx,dword ptr [esp+4]
>0001C3BB    jg          0001C3C9
 0001C3BD    mov         eax,esi
 0001C3BF    call        @LStrLen
 0001C3C4    cmp         eax,dword ptr [esp]
>0001C3C7    jg          0001C3D0
 0001C3C9    xor         eax,eax
 0001C3CB    mov         dword ptr [esp],eax
>0001C3CE    jmp         0001C3D8
 0001C3D0    inc         dword ptr [esp]
>0001C3D3    jmp         0001C3D8
 0001C3D5    mov         dword ptr [esp],ebx
 0001C3D8    mov         eax,dword ptr [esp]
 0001C3DB    pop         ecx
 0001C3DC    pop         edx
 0001C3DD    pop         esi
 0001C3DE    pop         ebx
 0001C3DF    ret
*}
end;

//0001C3E0
function CharToByteLen(const S:AnsiString; MaxLen:Integer):Integer;
begin
{*
 0001C3E0    push        ebx
 0001C3E1    push        esi
 0001C3E2    add         esp,0FFFFFFF8
 0001C3E5    mov         ebx,edx
 0001C3E7    mov         esi,eax
 0001C3E9    xor         eax,eax
 0001C3EB    mov         dword ptr [esp],eax
 0001C3EE    test        ebx,ebx
>0001C3F0    jle         0001C438
 0001C3F2    mov         eax,esi
 0001C3F4    call        @LStrLen
 0001C3F9    cmp         ebx,eax
>0001C3FB    jle         0001C406
 0001C3FD    mov         eax,esi
 0001C3FF    call        @LStrLen
 0001C404    mov         ebx,eax
 0001C406    cmp         byte ptr ds:[0B65BC],0
>0001C40D    je          0001C435
 0001C40F    push        esp
 0001C410    lea         ecx,[esp+8]
 0001C414    mov         edx,ebx
 0001C416    mov         eax,esi
 0001C418    call        CountChars
 0001C41D    mov         eax,esi
 0001C41F    call        @LStrLen
 0001C424    cmp         eax,dword ptr [esp]
>0001C427    jge         0001C438
 0001C429    mov         eax,esi
 0001C42B    call        @LStrLen
 0001C430    mov         dword ptr [esp],eax
>0001C433    jmp         0001C438
 0001C435    mov         dword ptr [esp],ebx
 0001C438    mov         eax,dword ptr [esp]
 0001C43B    pop         ecx
 0001C43C    pop         edx
 0001C43D    pop         esi
 0001C43E    pop         ebx
 0001C43F    ret
*}
end;

//0001C440
function IsPathDelimiter(const S:AnsiString; Index:Integer):Boolean;
begin
{*
 0001C440    push        ebx
 0001C441    push        esi
 0001C442    mov         ebx,edx
 0001C444    mov         esi,eax
 0001C446    test        ebx,ebx
>0001C448    jle         0001C469
 0001C44A    mov         eax,esi
 0001C44C    call        @LStrLen
 0001C451    cmp         ebx,eax
>0001C453    jg          0001C469
 0001C455    cmp         byte ptr [esi+ebx-1],5C
>0001C45A    jne         0001C469
 0001C45C    mov         edx,ebx
 0001C45E    mov         eax,esi
 0001C460    call        ByteType
 0001C465    test        al,al
>0001C467    je          0001C46E
 0001C469    xor         eax,eax
 0001C46B    pop         esi
 0001C46C    pop         ebx
 0001C46D    ret
 0001C46E    mov         al,1
 0001C470    pop         esi
 0001C471    pop         ebx
 0001C472    ret
*}
end;

//0001C474
function IsDelimiter(const Delimiters:AnsiString; const S:AnsiString; Index:Integer):Boolean;
begin
{*
 0001C474    push        ebx
 0001C475    push        esi
 0001C476    push        edi
 0001C477    push        ebp
 0001C478    mov         edi,ecx
 0001C47A    mov         esi,edx
 0001C47C    mov         ebp,eax
 0001C47E    xor         ebx,ebx
 0001C480    test        edi,edi
>0001C482    jle         0001C4B1
 0001C484    mov         eax,esi
 0001C486    call        @LStrLen
 0001C48B    cmp         edi,eax
>0001C48D    jg          0001C4B1
 0001C48F    mov         edx,edi
 0001C491    mov         eax,esi
 0001C493    call        ByteType
 0001C498    test        al,al
>0001C49A    jne         0001C4B1
 0001C49C    mov         eax,ebp
 0001C49E    call        @LStrToPChar
 0001C4A3    mov         dl,byte ptr [esi+edi-1]
 0001C4A7    call        StrScan
 0001C4AC    test        eax,eax
 0001C4AE    setne       bl
 0001C4B1    mov         eax,ebx
 0001C4B3    pop         ebp
 0001C4B4    pop         edi
 0001C4B5    pop         esi
 0001C4B6    pop         ebx
 0001C4B7    ret
*}
end;

//0001C4B8
function AnsiPos(const Substr:AnsiString; const S:AnsiString):Integer;
begin
{*
 0001C4B8    push        ebx
 0001C4B9    push        esi
 0001C4BA    push        edi
 0001C4BB    push        ebp
 0001C4BC    mov         esi,edx
 0001C4BE    mov         ebx,eax
 0001C4C0    xor         edi,edi
 0001C4C2    mov         eax,ebx
 0001C4C4    call        @LStrToPChar
 0001C4C9    push        eax
 0001C4CA    mov         eax,esi
 0001C4CC    call        @LStrToPChar
 0001C4D1    mov         ebp,eax
 0001C4D3    mov         eax,ebp
 0001C4D5    pop         edx
 0001C4D6    call        AnsiStrPos
 0001C4DB    mov         ebx,eax
 0001C4DD    test        ebx,ebx
>0001C4DF    je          0001C4E6
 0001C4E1    mov         edi,ebx
 0001C4E3    sub         edi,ebp
 0001C4E5    inc         edi
 0001C4E6    mov         eax,edi
 0001C4E8    pop         ebp
 0001C4E9    pop         edi
 0001C4EA    pop         esi
 0001C4EB    pop         ebx
 0001C4EC    ret
*}
end;

//0001C4F0
function AnsiLowerCaseFileName(const S:AnsiString):AnsiString;
begin
{*
 0001C4F0    push        ebx
 0001C4F1    push        esi
 0001C4F2    push        edi
 0001C4F3    push        ebp
 0001C4F4    mov         edi,edx
 0001C4F6    mov         esi,eax
 0001C4F8    cmp         byte ptr ds:[0B65BC],0
>0001C4FF    je          0001C56E
 0001C501    mov         eax,esi
 0001C503    call        @LStrLen
 0001C508    mov         ebp,eax
 0001C50A    mov         eax,edi
 0001C50C    mov         edx,ebp
 0001C50E    call        @LStrSetLength
 0001C513    mov         ebx,1
 0001C518    cmp         ebp,ebx
>0001C51A    jl          0001C577
 0001C51C    mov         eax,edi
 0001C51E    call        UniqueString
 0001C523    mov         dl,byte ptr [esi+ebx-1]
 0001C527    mov         byte ptr [eax+ebx-1],dl
 0001C52B    mov         al,byte ptr [esi+ebx-1]
 0001C52F    and         eax,0FF
 0001C534    bt          dword ptr ds:[0B4164],eax
>0001C53B    jae         0001C54F
 0001C53D    inc         ebx
 0001C53E    mov         eax,edi
 0001C540    call        UniqueString
 0001C545    mov         dl,byte ptr [esi+ebx-1]
 0001C549    mov         byte ptr [eax+ebx-1],dl
>0001C54D    jmp         0001C567
 0001C54F    mov         eax,dword ptr [edi]
 0001C551    mov         al,byte ptr [eax+ebx-1]
 0001C555    add         al,0BF
 0001C557    sub         al,1A
>0001C559    jae         0001C567
 0001C55B    mov         eax,edi
 0001C55D    call        UniqueString
 0001C562    add         byte ptr [eax+ebx-1],20
 0001C567    inc         ebx
 0001C568    cmp         ebp,ebx
>0001C56A    jge         0001C51C
>0001C56C    jmp         0001C577
 0001C56E    mov         edx,edi
 0001C570    mov         eax,esi
 0001C572    call        AnsiLowerCase
 0001C577    pop         ebp
 0001C578    pop         edi
 0001C579    pop         esi
 0001C57A    pop         ebx
 0001C57B    ret
*}
end;

//0001C57C
function AnsiStrPos(Str:PChar; SubStr:PChar):PChar;
begin
{*
 0001C57C    push        ebx
 0001C57D    push        esi
 0001C57E    push        edi
 0001C57F    push        ebp
 0001C580    add         esp,0FFFFFFF8
 0001C583    mov         ebp,edx
 0001C585    mov         esi,eax
 0001C587    xor         ebx,ebx
 0001C589    test        esi,esi
>0001C58B    je          0001C612
 0001C591    cmp         byte ptr [esi],0
>0001C594    je          0001C612
 0001C596    test        ebp,ebp
>0001C598    je          0001C612
 0001C59A    cmp         byte ptr [ebp],0
>0001C59E    je          0001C612
 0001C5A0    mov         eax,esi
 0001C5A2    call        StrLen
 0001C5A7    mov         dword ptr [esp],eax
 0001C5AA    mov         eax,ebp
 0001C5AC    call        StrLen
 0001C5B1    mov         edi,eax
 0001C5B3    mov         edx,ebp
 0001C5B5    mov         eax,esi
 0001C5B7    call        StrPos
 0001C5BC    mov         ebx,eax
>0001C5BE    jmp         0001C5FF
 0001C5C0    mov         edx,ebx
 0001C5C2    sub         edx,esi
 0001C5C4    mov         eax,esi
 0001C5C6    call        StrByteType
 0001C5CB    mov         byte ptr [esp+4],al
 0001C5CF    cmp         byte ptr [esp+4],2
>0001C5D4    je          0001C5EB
 0001C5D6    push        edi
 0001C5D7    push        ebp
 0001C5D8    push        edi
 0001C5D9    push        ebx
 0001C5DA    push        0
 0001C5DC    push        400
 0001C5E1    call        kernel32.CompareStringA
 0001C5E6    cmp         eax,2
>0001C5E9    je          0001C612
 0001C5EB    cmp         byte ptr [esp+4],1
>0001C5F0    jne         0001C5F3
 0001C5F2    inc         ebx
 0001C5F3    inc         ebx
 0001C5F4    mov         edx,ebp
 0001C5F6    mov         eax,ebx
 0001C5F8    call        StrPos
 0001C5FD    mov         ebx,eax
 0001C5FF    test        ebx,ebx
>0001C601    je          0001C610
 0001C603    mov         eax,ebx
 0001C605    sub         eax,esi
 0001C607    mov         edx,dword ptr [esp]
 0001C60A    sub         edx,eax
 0001C60C    cmp         edi,edx
>0001C60E    jbe         0001C5C0
 0001C610    xor         ebx,ebx
 0001C612    mov         eax,ebx
 0001C614    pop         ecx
 0001C615    pop         edx
 0001C616    pop         ebp
 0001C617    pop         edi
 0001C618    pop         esi
 0001C619    pop         ebx
 0001C61A    ret
*}
end;

//0001C61C
function AnsiStrRScan(Str:PChar; Chr:Char):PChar;
begin
{*
 0001C61C    push        ebx
 0001C61D    push        esi
 0001C61E    mov         ebx,edx
 0001C620    mov         edx,ebx
 0001C622    call        AnsiStrScan
 0001C627    mov         esi,eax
 0001C629    test        bl,bl
>0001C62B    je          0001C63F
 0001C62D    test        eax,eax
>0001C62F    je          0001C63F
 0001C631    mov         esi,eax
 0001C633    inc         eax
 0001C634    mov         edx,ebx
 0001C636    call        AnsiStrScan
 0001C63B    test        eax,eax
>0001C63D    jne         0001C631
 0001C63F    mov         eax,esi
 0001C641    pop         esi
 0001C642    pop         ebx
 0001C643    ret
*}
end;

//0001C644
function AnsiStrScan(Str:PChar; Chr:Char):PChar;
begin
{*
 0001C644    push        ebx
 0001C645    push        esi
 0001C646    push        edi
 0001C647    mov         ebx,edx
 0001C649    mov         esi,eax
 0001C64B    mov         edx,ebx
 0001C64D    mov         eax,esi
 0001C64F    call        StrScan
 0001C654    mov         edi,eax
 0001C656    test        edi,edi
>0001C658    je          0001C67E
 0001C65A    mov         edx,edi
 0001C65C    sub         edx,esi
 0001C65E    mov         eax,esi
 0001C660    call        StrByteType
 0001C665    sub         al,1
>0001C667    jb          0001C67E
>0001C669    je          0001C66D
>0001C66B    jmp         0001C66E
 0001C66D    inc         edi
 0001C66E    inc         edi
 0001C66F    mov         edx,ebx
 0001C671    mov         eax,edi
 0001C673    call        StrScan
 0001C678    mov         edi,eax
 0001C67A    test        edi,edi
>0001C67C    jne         0001C65A
 0001C67E    mov         eax,edi
 0001C680    pop         edi
 0001C681    pop         esi
 0001C682    pop         ebx
 0001C683    ret
*}
end;

//0001C684
procedure InitSysLocale;
begin
{*
 0001C684    push        ebx
 0001C685    push        esi
 0001C686    push        edi
 0001C687    push        ebp
 0001C688    add         esp,0FFFFFFE8
 0001C68B    mov         edi,0B4164
 0001C690    lea         ebp,[esp+4]
 0001C694    mov         esi,0B65B4
 0001C699    mov         dword ptr [esi],409
 0001C69F    mov         word ptr [esi+4],9
 0001C6A5    mov         word ptr [esi+6],1
 0001C6AB    call        kernel32.GetThreadLocale
 0001C6B0    test        eax,eax
>0001C6B2    je          0001C6B6
 0001C6B4    mov         dword ptr [esi],eax
 0001C6B6    test        ax,ax
>0001C6B9    je          0001C6D0
 0001C6BB    mov         edx,eax
 0001C6BD    and         dx,3FF
 0001C6C2    mov         word ptr [esi+4],dx
 0001C6C6    movzx       eax,ax
 0001C6C9    shr         eax,0A
 0001C6CC    mov         word ptr [esi+6],ax
 0001C6D0    push        4A
 0001C6D2    call        user32.GetSystemMetrics
 0001C6D7    test        eax,eax
 0001C6D9    setne       al
 0001C6DC    mov         byte ptr [esi+9],al
 0001C6DF    push        2A
 0001C6E1    call        user32.GetSystemMetrics
 0001C6E6    test        eax,eax
 0001C6E8    setne       bl
 0001C6EB    mov         byte ptr [esi+8],bl
 0001C6EE    test        bl,bl
>0001C6F0    je          0001C732
 0001C6F2    push        ebp
 0001C6F3    push        0
 0001C6F5    call        kernel32.GetCPInfo
 0001C6FA    xor         esi,esi
>0001C6FC    jmp         0001C723
 0001C6FE    mov         al,byte ptr [ebp+esi+6]
 0001C702    mov         bl,byte ptr [ebp+esi+7]
 0001C706    sub         bl,al
>0001C708    jb          0001C720
 0001C70A    inc         ebx
 0001C70B    mov         byte ptr [esp],al
 0001C70E    mov         al,byte ptr [esp]
 0001C711    and         eax,0FF
 0001C716    bts         dword ptr [edi],eax
 0001C719    inc         byte ptr [esp]
 0001C71C    dec         bl
>0001C71E    jne         0001C70E
 0001C720    add         esi,2
 0001C723    cmp         esi,0C
>0001C726    jge         0001C732
 0001C728    mov         al,byte ptr [ebp+esi+6]
 0001C72C    or          al,byte ptr [ebp+esi+7]
>0001C730    jne         0001C6FE
 0001C732    add         esp,18
 0001C735    pop         ebp
 0001C736    pop         edi
 0001C737    pop         esi
 0001C738    pop         ebx
 0001C739    ret
*}
end;

//0001C73C
procedure GetFormatSettings;
begin
{*
 0001C73C    push        ebp
 0001C73D    mov         ebp,esp
 0001C73F    xor         ecx,ecx
 0001C741    push        ecx
 0001C742    push        ecx
 0001C743    push        ecx
 0001C744    push        ecx
 0001C745    push        ecx
 0001C746    push        ebx
 0001C747    xor         eax,eax
 0001C749    push        ebp
 0001C74A    push        1CA02
 0001C74F    push        dword ptr fs:[eax]
 0001C752    mov         dword ptr fs:[eax],esp
 0001C755    call        InitSysLocale
 0001C75A    call        GetMonthDayNames
 0001C75F    cmp         byte ptr ds:[0B65BC],0
>0001C766    je          0001C76D
 0001C768    call        GetEraNamesAndYearOffsets
 0001C76D    call        kernel32.GetThreadLocale
 0001C772    mov         ebx,eax
 0001C774    lea         eax,[ebp-10]
 0001C777    push        eax
 0001C778    xor         ecx,ecx
 0001C77A    mov         edx,14
 0001C77F    mov         eax,ebx
 0001C781    call        GetLocaleStr
 0001C786    mov         edx,dword ptr [ebp-10]
 0001C789    mov         eax,0B64F4
 0001C78E    call        @LStrAsg
 0001C793    lea         eax,[ebp-10]
 0001C796    push        eax
 0001C797    mov         ecx,1CA18;'0'
 0001C79C    mov         edx,1B
 0001C7A1    mov         eax,ebx
 0001C7A3    call        GetLocaleStr
 0001C7A8    mov         eax,dword ptr [ebp-10]
 0001C7AB    xor         edx,edx
 0001C7AD    call        StrToIntDef
 0001C7B2    mov         [000B64F8],al
 0001C7B7    lea         eax,[ebp-10]
 0001C7BA    push        eax
 0001C7BB    mov         ecx,1CA18;'0'
 0001C7C0    mov         edx,1C
 0001C7C5    mov         eax,ebx
 0001C7C7    call        GetLocaleStr
 0001C7CC    mov         eax,dword ptr [ebp-10]
 0001C7CF    xor         edx,edx
 0001C7D1    call        StrToIntDef
 0001C7D6    mov         [000B64F9],al
 0001C7DB    mov         cl,2C
 0001C7DD    mov         edx,0F
 0001C7E2    mov         eax,ebx
 0001C7E4    call        GetLocaleChar
 0001C7E9    mov         [000B64FA],al;gvar_000B64FA
 0001C7EE    mov         cl,2E
 0001C7F0    mov         edx,0E
 0001C7F5    mov         eax,ebx
 0001C7F7    call        GetLocaleChar
 0001C7FC    mov         [000B64FB],al;gvar_000B64FB:Char
 0001C801    lea         eax,[ebp-10]
 0001C804    push        eax
 0001C805    mov         ecx,1CA18;'0'
 0001C80A    mov         edx,19
 0001C80F    mov         eax,ebx
 0001C811    call        GetLocaleStr
 0001C816    mov         eax,dword ptr [ebp-10]
 0001C819    xor         edx,edx
 0001C81B    call        StrToIntDef
 0001C820    mov         [000B64FC],al
 0001C825    mov         cl,2F
 0001C827    mov         edx,1D
 0001C82C    mov         eax,ebx
 0001C82E    call        GetLocaleChar
 0001C833    mov         [000B64FD],al
 0001C838    lea         eax,[ebp-14]
 0001C83B    push        eax
 0001C83C    mov         ecx,1CA24;'m/d/yy'
 0001C841    mov         edx,1F
 0001C846    mov         eax,ebx
 0001C848    call        GetLocaleStr
 0001C84D    mov         eax,dword ptr [ebp-14]
 0001C850    lea         edx,[ebp-10]
 0001C853    call        TranslateDateFormat
 0001C858    mov         edx,dword ptr [ebp-10]
 0001C85B    mov         eax,0B6500;gvar_000B6500
 0001C860    call        @LStrAsg
 0001C865    lea         eax,[ebp-14]
 0001C868    push        eax
 0001C869    mov         ecx,1CA34;'mmmm d, yyyy'
 0001C86E    mov         edx,20
 0001C873    mov         eax,ebx
 0001C875    call        GetLocaleStr
 0001C87A    mov         eax,dword ptr [ebp-14]
 0001C87D    lea         edx,[ebp-10]
 0001C880    call        TranslateDateFormat
 0001C885    mov         edx,dword ptr [ebp-10]
 0001C888    mov         eax,0B6504
 0001C88D    call        @LStrAsg
 0001C892    mov         cl,3A
 0001C894    mov         edx,1E
 0001C899    mov         eax,ebx
 0001C89B    call        GetLocaleChar
 0001C8A0    mov         [000B6508],al
 0001C8A5    lea         eax,[ebp-10]
 0001C8A8    push        eax
 0001C8A9    mov         ecx,1CA4C;'am'
 0001C8AE    mov         edx,28
 0001C8B3    mov         eax,ebx
 0001C8B5    call        GetLocaleStr
 0001C8BA    mov         edx,dword ptr [ebp-10]
 0001C8BD    mov         eax,0B650C
 0001C8C2    call        @LStrAsg
 0001C8C7    lea         eax,[ebp-10]
 0001C8CA    push        eax
 0001C8CB    mov         ecx,1CA58;'pm'
 0001C8D0    mov         edx,29
 0001C8D5    mov         eax,ebx
 0001C8D7    call        GetLocaleStr
 0001C8DC    mov         edx,dword ptr [ebp-10]
 0001C8DF    mov         eax,0B6510
 0001C8E4    call        @LStrAsg
 0001C8E9    lea         eax,[ebp-8]
 0001C8EC    call        @LStrClr
 0001C8F1    lea         eax,[ebp-0C]
 0001C8F4    call        @LStrClr
 0001C8F9    lea         eax,[ebp-10]
 0001C8FC    push        eax
 0001C8FD    mov         ecx,1CA18;'0'
 0001C902    mov         edx,25
 0001C907    mov         eax,ebx
 0001C909    call        GetLocaleStr
 0001C90E    mov         eax,dword ptr [ebp-10]
 0001C911    xor         edx,edx
 0001C913    call        StrToIntDef
 0001C918    test        eax,eax
>0001C91A    jne         0001C92B
 0001C91C    lea         eax,[ebp-4]
 0001C91F    mov         edx,1CA64;'h'
 0001C924    call        @LStrLAsg
>0001C929    jmp         0001C938
 0001C92B    lea         eax,[ebp-4]
 0001C92E    mov         edx,1CA70;'hh'
 0001C933    call        @LStrLAsg
 0001C938    lea         eax,[ebp-10]
 0001C93B    push        eax
 0001C93C    mov         ecx,1CA18;'0'
 0001C941    mov         edx,23
 0001C946    mov         eax,ebx
 0001C948    call        GetLocaleStr
 0001C94D    mov         eax,dword ptr [ebp-10]
 0001C950    xor         edx,edx
 0001C952    call        StrToIntDef
 0001C957    test        eax,eax
>0001C959    jne         0001C99A
 0001C95B    lea         eax,[ebp-10]
 0001C95E    push        eax
 0001C95F    mov         ecx,1CA18;'0'
 0001C964    mov         edx,1005
 0001C969    mov         eax,ebx
 0001C96B    call        GetLocaleStr
 0001C970    mov         eax,dword ptr [ebp-10]
 0001C973    xor         edx,edx
 0001C975    call        StrToIntDef
 0001C97A    test        eax,eax
>0001C97C    jne         0001C98D
 0001C97E    lea         eax,[ebp-0C]
 0001C981    mov         edx,1CA7C;' AMPM'
 0001C986    call        @LStrLAsg
>0001C98B    jmp         0001C99A
 0001C98D    lea         eax,[ebp-8]
 0001C990    mov         edx,1CA8C;'AMPM '
 0001C995    call        @LStrLAsg
 0001C99A    push        dword ptr [ebp-8]
 0001C99D    push        dword ptr [ebp-4]
 0001C9A0    push        1CA9C;':mm'
 0001C9A5    push        dword ptr [ebp-0C]
 0001C9A8    mov         eax,0B6514;gvar_000B6514
 0001C9AD    mov         edx,4
 0001C9B2    call        @LStrCatN
 0001C9B7    push        dword ptr [ebp-8]
 0001C9BA    push        dword ptr [ebp-4]
 0001C9BD    push        1CAA8;':mm:ss'
 0001C9C2    push        dword ptr [ebp-0C]
 0001C9C5    mov         eax,0B6518
 0001C9CA    mov         edx,4
 0001C9CF    call        @LStrCatN
 0001C9D4    mov         cl,2C
 0001C9D6    mov         edx,0C
 0001C9DB    mov         eax,ebx
 0001C9DD    call        GetLocaleChar
 0001C9E2    mov         [000B65F8],al
 0001C9E7    xor         eax,eax
 0001C9E9    pop         edx
 0001C9EA    pop         ecx
 0001C9EB    pop         ecx
 0001C9EC    mov         dword ptr fs:[eax],edx
 0001C9EF    push        1CA09
 0001C9F4    lea         eax,[ebp-14]
 0001C9F7    mov         edx,5
 0001C9FC    call        @LStrArrayClr
 0001CA01    ret
>0001CA02    jmp         @HandleFinally
>0001CA07    jmp         0001C9F4
 0001CA09    pop         ebx
 0001CA0A    mov         esp,ebp
 0001CA0C    pop         ebp
 0001CA0D    ret
*}
end;

//0001CAB0
procedure RaiseLastWin32Error;
begin
{*
 0001CAB0    push        ebp
 0001CAB1    mov         ebp,esp
 0001CAB3    add         esp,0FFFFFFE8
 0001CAB6    push        ebx
 0001CAB7    xor         eax,eax
 0001CAB9    mov         dword ptr [ebp-14],eax
 0001CABC    mov         dword ptr [ebp-18],eax
 0001CABF    xor         eax,eax
 0001CAC1    push        ebp
 0001CAC2    push        1CB56
 0001CAC7    push        dword ptr fs:[eax]
 0001CACA    mov         dword ptr fs:[eax],esp
 0001CACD    call        kernel32.GetLastError
 0001CAD2    mov         ebx,eax
 0001CAD4    test        ebx,ebx
>0001CAD6    je          0001CB17
 0001CAD8    mov         dword ptr [ebp-10],ebx
 0001CADB    mov         byte ptr [ebp-0C],0
 0001CADF    lea         edx,[ebp-14]
 0001CAE2    mov         eax,ebx
 0001CAE4    call        SysErrorMessage
 0001CAE9    mov         eax,dword ptr [ebp-14]
 0001CAEC    mov         dword ptr [ebp-8],eax
 0001CAEF    mov         byte ptr [ebp-4],0B
 0001CAF3    lea         eax,[ebp-10]
 0001CAF6    push        eax
 0001CAF7    push        1
 0001CAF9    lea         edx,[ebp-18]
 0001CAFC    mov         eax,[000B56A0];^SResString1:TResStringRec
 0001CB01    call        LoadResString
 0001CB06    mov         ecx,dword ptr [ebp-18]
 0001CB09    mov         dl,1
 0001CB0B    mov         eax,[0001807C];EWin32Error
 0001CB10    call        Exception.CreateFmt
>0001CB15    jmp         0001CB33
 0001CB17    lea         edx,[ebp-14]
 0001CB1A    mov         eax,[000B57F0];^SUnkWin32Error:TResStringRec
 0001CB1F    call        LoadResString
 0001CB24    mov         ecx,dword ptr [ebp-14]
 0001CB27    mov         dl,1
 0001CB29    mov         eax,[0001807C];EWin32Error
 0001CB2E    call        Exception.Create
 0001CB33    mov         dword ptr [eax+0C],ebx
 0001CB36    call        @RaiseExcept
 0001CB3B    xor         eax,eax
 0001CB3D    pop         edx
 0001CB3E    pop         ecx
 0001CB3F    pop         ecx
 0001CB40    mov         dword ptr fs:[eax],edx
 0001CB43    push        1CB5D
 0001CB48    lea         eax,[ebp-18]
 0001CB4B    mov         edx,2
 0001CB50    call        @LStrArrayClr
 0001CB55    ret
>0001CB56    jmp         @HandleFinally
>0001CB5B    jmp         0001CB48
 0001CB5D    pop         ebx
 0001CB5E    mov         esp,ebp
 0001CB60    pop         ebp
 0001CB61    ret
*}
end;

//0001CB64
function Win32Check(RetVal:BOOL):BOOL;
begin
{*
 0001CB64    push        ebx
 0001CB65    mov         ebx,eax
 0001CB67    test        ebx,ebx
>0001CB69    jne         0001CB70
 0001CB6B    call        RaiseLastWin32Error
 0001CB70    mov         eax,ebx
 0001CB72    pop         ebx
 0001CB73    ret
*}
end;

//0001CB74
function CallTerminateProcs:Boolean;
begin
{*
 0001CB74    push        ebx
 0001CB75    mov         al,1
 0001CB77    mov         ebx,dword ptr ds:[0B433C]
>0001CB7D    jmp         0001CB84
 0001CB7F    call        dword ptr [ebx+4]
 0001CB82    mov         ebx,dword ptr [ebx]
 0001CB84    test        al,al
>0001CB86    je          0001CB8C
 0001CB88    test        ebx,ebx
>0001CB8A    jne         0001CB7F
 0001CB8C    pop         ebx
 0001CB8D    ret
*}
end;

//0001CB90
procedure FreeTerminateProcs;
begin
{*
 0001CB90    push        ebx
 0001CB91    mov         ebx,0B433C
>0001CB96    jmp         0001CBA8
 0001CB98    mov         eax,dword ptr [ebx]
 0001CB9A    mov         edx,dword ptr [eax]
 0001CB9C    mov         dword ptr [ebx],edx
 0001CB9E    mov         edx,8
 0001CBA3    call        @FreeMem
 0001CBA8    cmp         dword ptr [ebx],0
>0001CBAB    jne         0001CB98
 0001CBAD    pop         ebx
 0001CBAE    ret
*}
end;

//0001CBB0
procedure InitDriveSpacePtr;
begin
{*
 0001CBB0    push        ebx
 0001CBB1    push        1CBE8
 0001CBB6    call        kernel32.GetModuleHandleA
 0001CBBB    mov         ebx,eax
 0001CBBD    test        ebx,ebx
>0001CBBF    je          0001CBD1
 0001CBC1    push        1CBF8
 0001CBC6    push        ebx
 0001CBC7    call        kernel32.GetProcAddress
 0001CBCC    mov         [000B4188],eax
 0001CBD1    cmp         dword ptr ds:[0B4188],0
>0001CBD8    jne         0001CBE4
 0001CBDA    mov         eax,18D7C;BackfillGetDiskFreeSpaceEx:BOOL
 0001CBDF    mov         [000B4188],eax
 0001CBE4    pop         ebx
 0001CBE5    ret
*}
end;

//0001CC0C
constructor TMultiReadExclusiveWriteSynchronizer.Create;
begin
{*
 0001CC0C    push        ebx
 0001CC0D    push        esi
 0001CC0E    test        dl,dl
>0001CC10    je          0001CC1A
 0001CC12    add         esp,0FFFFFFF0
 0001CC15    call        @ClassCreate
 0001CC1A    mov         ebx,edx
 0001CC1C    mov         esi,eax
 0001CC1E    xor         edx,edx
 0001CC20    mov         eax,esi
 0001CC22    call        TObject.Create
 0001CC27    lea         eax,[esi+4]
 0001CC2A    push        eax
 0001CC2B    call        kernel32.InitializeCriticalSection
 0001CC30    push        0
 0001CC32    push        0FF
 0001CC34    push        0FF
 0001CC36    push        0
 0001CC38    call        kernel32.CreateEventA
 0001CC3D    mov         dword ptr [esi+1C],eax
 0001CC40    push        4
 0001CC42    lea         eax,[esi+28]
 0001CC45    mov         ecx,1
 0001CC4A    mov         edx,dword ptr ds:[180E0];TActiveThreadArray
 0001CC50    call        @DynArraySetLength
 0001CC55    add         esp,4
 0001CC58    mov         eax,esi
 0001CC5A    test        bl,bl
>0001CC5C    je          0001CC6D
 0001CC5E    call        @AfterConstruction
 0001CC63    pop         dword ptr fs:[0]
 0001CC6A    add         esp,0C
 0001CC6D    mov         eax,esi
 0001CC6F    pop         esi
 0001CC70    pop         ebx
 0001CC71    ret
*}
end;

//0001CC74
destructor TMultiReadExclusiveWriteSynchronizer.Destroy;
begin
{*
 0001CC74    push        ebx
 0001CC75    push        esi
 0001CC76    call        @BeforeDestruction
 0001CC7B    mov         ebx,edx
 0001CC7D    mov         esi,eax
 0001CC7F    mov         eax,esi
 0001CC81    call        TMultiReadExclusiveWriteSynchronizer.BeginWrite
 0001CC86    mov         edx,ebx
 0001CC88    and         dl,0FC
 0001CC8B    mov         eax,esi
 0001CC8D    call        TObject.Destroy
 0001CC92    mov         eax,dword ptr [esi+1C]
 0001CC95    push        eax
 0001CC96    call        kernel32.CloseHandle
 0001CC9B    lea         eax,[esi+4]
 0001CC9E    push        eax
 0001CC9F    call        kernel32.DeleteCriticalSection
 0001CCA4    test        bl,bl
>0001CCA6    jle         0001CCAF
 0001CCA8    mov         eax,esi
 0001CCAA    call        @ClassDestroy
 0001CCAF    pop         esi
 0001CCB0    pop         ebx
 0001CCB1    ret
*}
end;

//0001CCB4
function TMultiReadExclusiveWriteSynchronizer.WriterIsOnlyReader:Boolean;
begin
{*
 0001CCB4    push        ebx
 0001CCB5    push        esi
 0001CCB6    mov         esi,eax
 0001CCB8    xor         eax,eax
 0001CCBA    cmp         dword ptr [esi+2C],0
>0001CCBE    je          0001CCEA
 0001CCC0    xor         ebx,ebx
 0001CCC2    mov         eax,dword ptr [esi+28]
 0001CCC5    call        @DynArrayHigh
 0001CCCA    mov         edx,eax
>0001CCCC    jmp         0001CCCF
 0001CCCE    inc         ebx
 0001CCCF    cmp         edx,ebx
>0001CCD1    jle         0001CCE5
 0001CCD3    mov         eax,dword ptr [esi+28]
 0001CCD6    mov         eax,dword ptr [eax+ebx*8]
 0001CCD9    test        eax,eax
>0001CCDB    je          0001CCCE
 0001CCDD    mov         ecx,dword ptr [esi+28]
 0001CCE0    cmp         eax,dword ptr [esi+2C]
>0001CCE3    je          0001CCCE
 0001CCE5    cmp         edx,ebx
 0001CCE7    setle       al
 0001CCEA    pop         esi
 0001CCEB    pop         ebx
 0001CCEC    ret
*}
end;

//0001CCF0
procedure TMultiReadExclusiveWriteSynchronizer.BeginWrite;
begin
{*
 0001CCF0    push        ebx
 0001CCF1    mov         ebx,eax
 0001CCF3    lea         eax,[ebx+4]
 0001CCF6    push        eax
 0001CCF7    call        kernel32.EnterCriticalSection
 0001CCFC    cmp         byte ptr [ebx+34],0
>0001CD00    jne         0001CD34
 0001CD02    call        kernel32.GetCurrentThreadId
 0001CD07    mov         dword ptr [ebx+2C],eax
 0001CD0A    mov         eax,ebx
 0001CD0C    call        TMultiReadExclusiveWriteSynchronizer.WriterIsOnlyReader
 0001CD11    test        al,al
>0001CD13    jne         0001CD20
 0001CD15    push        0FF
 0001CD17    mov         eax,dword ptr [ebx+1C]
 0001CD1A    push        eax
 0001CD1B    call        kernel32.WaitForSingleObject
 0001CD20    mov         eax,dword ptr [ebx+20]
 0001CD23    mov         dword ptr [ebx+24],eax
 0001CD26    xor         eax,eax
 0001CD28    mov         dword ptr [ebx+20],eax
 0001CD2B    xor         eax,eax
 0001CD2D    mov         dword ptr [ebx+2C],eax
 0001CD30    mov         byte ptr [ebx+34],1
 0001CD34    inc         dword ptr [ebx+20]
 0001CD37    pop         ebx
 0001CD38    ret
*}
end;

//0001CD3C
procedure TMultiReadExclusiveWriteSynchronizer.EndWrite;
begin
{*
 0001CD3C    dec         dword ptr [eax+20]
 0001CD3F    cmp         dword ptr [eax+20],0
>0001CD43    jne         0001CD54
 0001CD45    mov         edx,dword ptr [eax+24]
 0001CD48    mov         dword ptr [eax+20],edx
 0001CD4B    xor         edx,edx
 0001CD4D    mov         dword ptr [eax+24],edx
 0001CD50    mov         byte ptr [eax+34],0
 0001CD54    add         eax,4
 0001CD57    push        eax
 0001CD58    call        kernel32.LeaveCriticalSection
 0001CD5D    ret
*}
end;

//0001CD60
procedure _NF__7A3;
begin
{*
 0001CD60    push        ds
 0001CD61    add         byte ptr [eax],al
 0001CD63    add         byte ptr [eax],bh
 0001CD65    inc         ebx
 0001CD66    or          eax,dword ptr [eax]
 0001CD68    movs        byte ptr [edi],byte ptr [esi]
 0001CD69    pop         eax
 0001CD6A    or          eax,dword ptr [eax]
 0001CD6C    xor         byte ptr [ebx+0B],al
 0001CD6F    add         byte ptr [eax+56],ah
 0001CD72    or          eax,dword ptr [eax]
 0001CD74    sub         byte ptr [ebx+0B],al
 0001CD77    add         byte ptr [eax+5A],cl
 0001CD7A    or          eax,dword ptr [eax]
 0001CD7C    and         byte ptr [ebx+0B],al
 0001CD7F    add         byte ptr [eax+18000B5A],ch
 0001CD85    inc         ebx
 0001CD86    or          eax,dword ptr [eax]
 0001CD88    call        1001D8E4
 0001CD8D    inc         ebx
 0001CD8E    or          eax,dword ptr [eax]
 0001CD90    test        byte ptr [eax+0B],bl
 0001CD93    add         byte ptr [eax],cl
 0001CD95    inc         ebx
 0001CD96    or          eax,dword ptr [eax]
 0001CD98    adc         al,56
 0001CD9A    or          eax,dword ptr [eax]
 0001CD9C    add         byte ptr [ebx+0B],al
 0001CD9F    add         ah,ch
 0001CDA1    pop         eax
 0001CDA2    or          eax,dword ptr [eax]
 0001CDA4    clc
 0001CDA5    inc         edx
 0001CDA6    or          eax,dword ptr [eax]
 0001CDA8    dec         esp
 0001CDA9    pop         ecx
 0001CDAA    or          eax,dword ptr [eax]
 0001CDAC    lock inc    edx
 0001CDAE    or          eax,dword ptr [eax]
 0001CDB0    push        eax
 0001CDB1    pop         eax
 0001CDB2    or          eax,dword ptr [eax]
 0001CDB4    call        5801D8FB
 0001CDB9    pop         eax
 0001CDBA    or          eax,dword ptr [eax]
 0001CDBC    loopne      0001CE00
 0001CDBE    or          eax,dword ptr [eax]
 0001CDC0    pushad
 0001CDC1    pop         ebx
 0001CDC2    or          eax,dword ptr [eax]
 0001CDC4    fadd        dword ptr [edx+0B]
 0001CDC7    add         byte ptr [eax+5B],cl
 0001CDCA    or          eax,dword ptr [eax]
 0001CDCC    rol         byte ptr [edx+0B],1
 0001CDCF    add         ah,dl
 0001CDD1    pop         ebx
 0001CDD2    or          eax,dword ptr [eax]
 0001CDD4    enter       0B42,0
 0001CDD8    mov         al,59
 0001CDDA    or          eax,dword ptr [eax]
 0001CDDC    rol         byte ptr [edx+0B],0
>0001CDE0    js          0001CE3B
 0001CDE2    or          eax,dword ptr [eax]
 0001CDE4    mov         eax,0E4000B42
 0001CDE9    pop         ebx
 0001CDEA    or          eax,dword ptr [eax]
 0001CDEC    mov         al,42
 0001CDEE    or          eax,dword ptr [eax]
 0001CDF0    nop
 0001CDF1    pop         ebx
 0001CDF2    or          eax,dword ptr [eax]
 0001CDF4    test        al,42
 0001CDF6    or          eax,dword ptr [eax]
>0001CDF8    jo          0001CE52
 0001CDFA    or          eax,dword ptr [eax]
 0001CDFC    mov         al,[68000B42]
 0001CE01    pop         ebx
 0001CE02    or          eax,dword ptr [eax]
 0001CE04    cwde
 0001CE05    inc         edx
 0001CE06    or          eax,dword ptr [eax]
>0001CE08    je          0001CE65
 0001CE0A    or          eax,dword ptr [eax]
 0001CE0C    nop
 0001CE0D    inc         edx
 0001CE0E    or          eax,dword ptr [eax]
>0001CE10    jo          0001CE69
 0001CE12    or          eax,dword ptr [eax]
 0001CE14    mov         byte ptr [edx+0B],al
 0001CE17    add         byte ptr [eax],al
 0001CE19    push        edi
 0001CE1A    or          eax,dword ptr [eax]
 0001CE1C    add         byte ptr [edx+0B],0
 0001CE20    ins         byte ptr [edi],dl
 0001CE21    pop         ecx
 0001CE22    or          eax,dword ptr [eax]
>0001CE24    js          0001CE68
 0001CE26    or          eax,dword ptr [eax]
 0001CE28    inc         eax
 0001CE29    pop         edx
 0001CE2A    or          eax,dword ptr [eax]
>0001CE2C    jo          0001CE70
 0001CE2E    or          eax,dword ptr [eax]
 0001CE30    and         byte ptr [esi+0B],dl
 0001CE33    add         byte ptr [eax+42],ch
 0001CE36    or          eax,dword ptr [eax]
 0001CE38    pop         esp
 0001CE39    pop         ebx
 0001CE3A    or          eax,dword ptr [eax]
 0001CE3C    pushad
 0001CE3D    inc         edx
 0001CE3E    or          eax,dword ptr [eax]
 0001CE40    pop         eax
 0001CE42    or          eax,dword ptr [eax]
 0001CE44    mov         ah,41
 0001CE46    or          eax,dword ptr [eax]
>0001CE48    js          0001CEA2
 0001CE4A    or          eax,dword ptr [eax]
 0001CE4C    mov         al,41
 0001CE4E    or          eax,dword ptr [eax]
 0001CE50    adc         byte ptr [edi+0B],0
*}
end;

//0001CE54
procedure _NF__7A4;
begin
{*
 0001CE54    add         byte ptr es:[eax],al
 0001CE57    add         byte ptr [eax+42],bl
 0001CE5A    or          eax,dword ptr [eax]
 0001CE5C    xor         byte ptr [ebx+0B],bl
 0001CE5F    add         byte ptr [eax],al
 0001CE61    add         byte ptr [eax],al
 0001CE63    add         byte ptr [edx+eax*2+0B],dl
 0001CE67    add         byte ptr [esi+edx*2+0B],ch
 0001CE6B    add         byte ptr [eax],al
 0001CE6D    add         byte ptr [eax],al
 0001CE6F    add         byte ptr [eax+42],dl
 0001CE72    or          eax,dword ptr [eax]
 0001CE74    sub         byte ptr [edx+0B],bl
 0001CE77    add         byte ptr [eax],al
 0001CE79    add         byte ptr [eax],al
 0001CE7B    add         byte ptr [edx+eax*2+0B],cl
 0001CE7F    add         byte ptr [esi+edx*2],ch
 0001CE82    or          eax,dword ptr [eax]
 0001CE84    add         byte ptr [eax],al
 0001CE86    add         byte ptr [eax],al
 0001CE88    dec         eax
 0001CE89    inc         edx
 0001CE8A    or          eax,dword ptr [eax]
 0001CE8C    xor         al,57
 0001CE8E    or          eax,dword ptr [eax]
 0001CE90    add         byte ptr [eax],al
 0001CE92    add         byte ptr [eax],al
 0001CE94    inc         esp
 0001CE95    inc         edx
 0001CE96    or          eax,dword ptr [eax]
 0001CE98    sub         al,57
 0001CE9A    or          eax,dword ptr [eax]
 0001CE9C    add         byte ptr [eax],al
 0001CE9E    add         byte ptr [eax],al
 0001CEA0    inc         eax
 0001CEA1    inc         edx
 0001CEA2    or          eax,dword ptr [eax]
 0001CEA4    xchg        eax,esp
 0001CEA5    push        esi
 0001CEA6    or          eax,dword ptr [eax]
 0001CEA8    add         byte ptr [eax],al
 0001CEAA    add         byte ptr [eax],al
 0001CEAC    cmp         al,42
 0001CEAE    or          eax,dword ptr [eax]
 0001CEB0    pushad
 0001CEB1    pop         eax
 0001CEB2    or          eax,dword ptr [eax]
 0001CEB4    add         byte ptr [eax],al
 0001CEB6    add         byte ptr [eax],al
 0001CEB8    cmp         byte ptr [edx+0B],al
 0001CEBB    add         byte ptr [ecx+ebx*2+0B],ch
 0001CEC2    add         byte ptr [eax],al
 0001CEC4    xor         al,42
 0001CEC6    or          eax,dword ptr [eax]
 0001CEC8    xor         byte ptr [edi+0B],dl
 0001CECB    add         byte ptr [eax],al
 0001CECD    add         byte ptr [eax],al
 0001CECF    add         byte ptr [eax],dh
 0001CED1    inc         edx
 0001CED2    or          eax,dword ptr [eax]
 0001CED4    pop         ecx
 0001CED6    or          eax,dword ptr [eax]
 0001CED8    add         byte ptr [eax],al
 0001CEDA    add         byte ptr [eax],al
 0001CEDC    sub         al,42
 0001CEDE    or          eax,dword ptr [eax]
 0001CEE0    cwde
 0001CEE1    pop         edx
 0001CEE2    or          eax,dword ptr [eax]
 0001CEE4    add         byte ptr [eax],al
 0001CEE6    add         byte ptr [eax],al
 0001CEE8    sub         byte ptr [edx+0B],al
 0001CEEB    add         byte ptr [eax+0B5A],al
 0001CEF1    add         byte ptr [eax],al
 0001CEF3    add         byte ptr [edx+eax*2],ah
 0001CEF6    or          eax,dword ptr [eax]
 0001CEF8    rcr         byte ptr [ecx+0B],1
 0001CEFB    add         byte ptr [eax],al
 0001CEFD    add         byte ptr [eax],al
 0001CEFF    add         byte ptr [eax],ah
 0001CF01    inc         edx
 0001CF02    or          eax,dword ptr [eax]
 0001CF04    dec         esp
 0001CF05    pop         eax
 0001CF06    or          eax,dword ptr [eax]
 0001CF08    add         byte ptr [eax],al
 0001CF0A    add         byte ptr [eax],al
 0001CF0C    sbb         al,42
 0001CF0E    or          eax,dword ptr [eax]
 0001CF10    loopne      0001CF69
 0001CF12    or          eax,dword ptr [eax]
 0001CF14    add         byte ptr [eax],al
 0001CF16    add         byte ptr [eax],al
 0001CF18    sbb         byte ptr [edx+0B],al
 0001CF1B    add         byte ptr [eax],ch
 0001CF1D    push        esi
 0001CF1E    or          eax,dword ptr [eax]
 0001CF20    add         byte ptr [eax],al
 0001CF22    add         byte ptr [eax],al
 0001CF24    adc         al,42
 0001CF26    or          eax,dword ptr [eax]
>0001CF28    jl          0001CF84
 0001CF2A    or          eax,dword ptr [eax]
 0001CF2C    add         byte ptr [eax],al
 0001CF2E    add         byte ptr [eax],al
 0001CF30    adc         byte ptr [edx+0B],al
 0001CF33    add         byte ptr [ecx+ebx*2],bl
 0001CF36    or          eax,dword ptr [eax]
 0001CF38    add         byte ptr [eax],al
 0001CF3A    add         byte ptr [eax],al
 0001CF3C    or          al,42
 0001CF3E    or          eax,dword ptr [eax]
 0001CF40    enter       0B57,0
 0001CF44    add         byte ptr [eax],al
 0001CF46    add         byte ptr [eax],al
 0001CF48    or          byte ptr [edx+0B],al
 0001CF4B    add         al,ch
 0001CF4D    pop         eax
 0001CF4E    or          eax,dword ptr [eax]
 0001CF50    add         byte ptr [eax],al
 0001CF52    add         byte ptr [eax],al
 0001CF54    add         al,42
 0001CF56    or          eax,dword ptr [eax]
 0001CF58    mov         word ptr [ecx+0B],ds
 0001CF5B    add         byte ptr [eax],al
 0001CF5D    add         byte ptr [eax],al
 0001CF5F    add         byte ptr [eax],al
 0001CF61    inc         edx
 0001CF62    or          eax,dword ptr [eax]
 0001CF64    add         byte ptr [ecx+0B],bl
 0001CF67    add         byte ptr [eax],al
 0001CF69    add         byte ptr [eax],al
 0001CF6B    add         ah,bh
 0001CF6D    inc         ecx
 0001CF6E    or          eax,dword ptr [eax]
 0001CF70    adc         al,58
 0001CF72    or          eax,dword ptr [eax]
 0001CF74    add         byte ptr [eax],al
 0001CF76    add         byte ptr [eax],al
 0001CF78    clc
 0001CF79    inc         ecx
 0001CF7A    or          eax,dword ptr [eax]
 0001CF7C    and         al,56
 0001CF7E    or          eax,dword ptr [eax]
 0001CF80    add         byte ptr [eax],al
 0001CF82    add         byte ptr [eax],al
 0001CF84    hlt
 0001CF85    inc         ecx
 0001CF86    or          eax,dword ptr [eax]
 0001CF88    nop
 0001CF89    pop         eax
 0001CF8A    or          eax,dword ptr [eax]
 0001CF8C    add         byte ptr [eax],al
 0001CF8E    add         byte ptr [eax],al
 0001CF90    lock inc    ecx
 0001CF92    or          eax,dword ptr [eax]
>0001CF94    js          0001CFF1
 0001CF96    or          eax,dword ptr [eax]
 0001CF98    add         byte ptr [eax],al
 0001CF9A    add         byte ptr [eax],al
 0001CF9C    in          al,dl
 0001CF9D    inc         ecx
 0001CF9E    or          eax,dword ptr [eax]
 0001CFA0    or          al,5B
 0001CFA2    or          eax,dword ptr [eax]
 0001CFA4    add         byte ptr [eax],al
 0001CFA6    add         byte ptr [eax],al
 0001CFA8    call        6001DAEE
 0001CFAD    pop         ecx
 0001CFAE    or          eax,dword ptr [eax]
 0001CFB0    add         byte ptr [eax],al
 0001CFB2    add         byte ptr [eax],al
 0001CFB4    in          al,41
 0001CFB6    or          eax,dword ptr [eax]
 0001CFB8    ins         byte ptr [edi],dl
 0001CFB9    push        edi
 0001CFBA    or          eax,dword ptr [eax]
 0001CFBC    add         byte ptr [eax],al
 0001CFBE    add         byte ptr [eax],al
 0001CFC0    loopne      0001D003
 0001CFC2    or          eax,dword ptr [eax]
 0001CFC4    inc         eax
 0001CFC5    push        esi
 0001CFC6    or          eax,dword ptr [eax]
 0001CFC8    add         byte ptr [eax],al
 0001CFCA    add         byte ptr [eax],al
 0001CFCC    fadd        qword ptr [ecx+0B]
 0001CFCF    add         ah,bh
 0001CFD1    pop         edx
 0001CFD2    or          eax,dword ptr [eax]
 0001CFD4    add         byte ptr [eax],al
 0001CFD6    add         byte ptr [eax],al
 0001CFD8    fadd        dword ptr [ecx+0B]
 0001CFDB    add         byte ptr [eax],dl
 0001CFDD    pop         esp
 0001CFDE    or          eax,dword ptr [eax]
 0001CFE0    add         byte ptr [eax],al
 0001CFE2    add         byte ptr [eax],al
 0001CFE4    ???
 0001CFE5    inc         ecx
 0001CFE6    or          eax,dword ptr [eax]
 0001CFE8    lods        byte ptr [esi]
 0001CFE9    push        esi
 0001CFEA    or          eax,dword ptr [eax]
 0001CFEC    add         byte ptr [eax],al
 0001CFEE    add         byte ptr [eax],al
 0001CFF0    rol         byte ptr [ecx+0B],1
 0001CFF3    add         byte ptr [eax],dl
 0001CFF5    push        esi
 0001CFF6    or          eax,dword ptr [eax]
 0001CFF8    add         byte ptr [eax],al
 0001CFFA    add         byte ptr [eax],al
 0001CFFC    int         3
 0001CFFD    inc         ecx
 0001CFFE    or          eax,dword ptr [eax]
 0001D000    inc         esp
 0001D001    pop         ebx
 0001D002    or          eax,dword ptr [eax]
 0001D004    add         byte ptr [eax],al
 0001D006    add         byte ptr [eax],al
 0001D008    enter       0B41,0
 0001D00C    pop         esp
 0001D00D    pop         ecx
 0001D00E    or          eax,dword ptr [eax]
 0001D010    add         byte ptr [eax],al
 0001D012    add         byte ptr [eax],al
 0001D014    les         eax,fword ptr [ecx+0B]
 0001D017    add         byte ptr [eax+0B5B],ch
 0001D01D    add         byte ptr [eax],al
 0001D01F    add         byte ptr [edx],cl;{_DF_:Single}
*}
end;

//0001D020
procedure _DF_;
begin
{*
 0001D020    or          al,byte ptr [eax]
 0001D022    add         byte ptr [eax],al
 0001D024    add         byte ptr fs:[eax],al
 0001D027    add         al,ch
 0001D029    add         eax,dword ptr [eax]
 0001D02B    add         byte ptr [eax],dl
 0001D02D    daa
 0001D02E    add         byte ptr [eax],al
 0001D030    add         byte ptr [eax],al
 0001D032    inc         eax
>0001D033    jbe         0001D06F
 0001D035    imul        ecx,dword ptr [ebx],0DE
 0001D038    cmp         al,byte ptr [eax+3F]
 0001D03B    adc         ecx,dword ptr [ecx+4E]
 0001D03E    inc         esi
 0001D03F    dec         esi
 0001D040    inc         ecx
 0001D041    dec         esi
*}
end;

//0001D042
function FloatToText(Buffer:PChar; const Value:void ; ValueType:TFloatValue; Format:TFloatFormat; Precision:Integer; Digits:Integer):Integer;
begin
{*
 0001D042    push        ebp
 0001D043    mov         ebp,esp
 0001D045    sub         esp,1C
 0001D048    push        edi
 0001D049    push        esi
 0001D04A    push        ebx
 0001D04B    mov         dword ptr [ebp-4],eax
 0001D04E    mov         eax,13
 0001D053    cmp         cl,0
>0001D056    jne         0001D06F
 0001D058    mov         eax,dword ptr [ebp+0C]
 0001D05B    cmp         eax,2
>0001D05E    jge         0001D065
 0001D060    mov         eax,2
 0001D065    cmp         eax,12
>0001D068    jle         0001D06F
 0001D06A    mov         eax,12
 0001D06F    mov         dword ptr [ebp+0C],eax
 0001D072    push        eax
 0001D073    mov         eax,270F
 0001D078    cmp         byte ptr [ebp+10],2
>0001D07C    jb          0001D081
 0001D07E    mov         eax,dword ptr [ebp+8]
 0001D081    push        eax
 0001D082    lea         eax,[ebp-1C]
 0001D085    call        FloatToDecimal
 0001D08A    mov         edi,dword ptr [ebp-4]
 0001D08D    movzx       eax,word ptr [ebp-1C]
 0001D091    sub         eax,7FFF
 0001D096    cmp         eax,2
>0001D099    jae         0001D0AB
 0001D09B    lea         esi,[eax+eax*2+1D03C]
 0001D0A2    mov         ecx,3
 0001D0A7    rep movs    byte ptr [edi],byte ptr [esi]
>0001D0A9    jmp         0001D0CE
 0001D0AB    lea         esi,[ebp-19]
 0001D0AE    movzx       ebx,byte ptr [ebp+10]
 0001D0B2    cmp         bl,1
>0001D0B5    je          0001D0C7
 0001D0B7    cmp         bl,4
>0001D0BA    ja          0001D0C5
 0001D0BC    movsx       eax,word ptr [ebp-1C]
 0001D0C0    cmp         eax,dword ptr [ebp+0C]
>0001D0C3    jle         0001D0C7
 0001D0C5    mov         bl,0
 0001D0C7    call        dword ptr [ebx*4+1D0DC]
 0001D0CE    mov         eax,edi
 0001D0D0    sub         eax,dword ptr [ebp-4]
 0001D0D3    pop         ebx
 0001D0D4    pop         esi
 0001D0D5    pop         edi
 0001D0D6    mov         esp,ebp
 0001D0D8    pop         ebp
 0001D0D9    ret         0C
*}
end;

//0001D199
procedure sub_0001D199;
begin
{*
 0001D199    stos        byte ptr [edi]
 0001D19A    or          bl,bl
>0001D19C    jne         0001D1A2
 0001D19E    xor         edx,edx
>0001D1A0    jmp         0001D1AC
 0001D1A2    or          edx,edx
>0001D1A4    jge         0001D1AC
 0001D1A6    mov         al,2D
 0001D1A8    neg         edx
>0001D1AA    jmp         0001D1B2
 0001D1AC    or          ah,ah
>0001D1AE    je          0001D1B3
 0001D1B0    mov         al,ah
 0001D1B2    stos        byte ptr [edi]
 0001D1B3    xchg        eax,edx
 0001D1B4    push        eax
 0001D1B5    mov         ebx,esp
 0001D1B7    xor         edx,edx
 0001D1B9    div         eax,dword ptr ds:[1D020];_DF_:Single
 0001D1BF    add         dl,30
 0001D1C2    mov         byte ptr [ebx],dl
 0001D1C4    inc         ebx
 0001D1C5    dec         ecx
 0001D1C6    or          eax,eax
>0001D1C8    jne         0001D1B7
 0001D1CA    or          ecx,ecx
>0001D1CC    jg          0001D1B7
 0001D1CE    dec         ebx
 0001D1CF    mov         al,byte ptr [ebx]
 0001D1D1    stos        byte ptr [edi]
 0001D1D2    cmp         ebx,esp
>0001D1D4    jne         0001D1CE
 0001D1D6    pop         eax
 0001D1D7    ret
*}
end;

//0001D30B
function FloatToTextFmt(Buffer:PChar; const Value:void ; ValueType:TFloatValue; Format:PChar):Integer;
begin
{*
 0001D30B    push        ebp
 0001D30C    mov         ebp,esp
 0001D30E    sub         esp,40
 0001D311    push        edi
 0001D312    push        esi
 0001D313    push        ebx
 0001D314    mov         dword ptr [ebp-4],eax
 0001D317    mov         edi,edx
 0001D319    mov         ebx,ecx
 0001D31B    mov         ecx,2
 0001D320    cmp         bl,0
>0001D323    je          0001D334
 0001D325    mov         eax,dword ptr [edi]
 0001D327    or          eax,dword ptr [edi+4]
>0001D32A    je          0001D346
 0001D32C    mov         ecx,dword ptr [edi+4]
 0001D32F    shr         ecx,1F
>0001D332    jmp         0001D346
 0001D334    movzx       eax,word ptr [edi+8]
 0001D338    or          eax,dword ptr [edi]
 0001D33A    or          eax,dword ptr [edi+4]
>0001D33D    je          0001D346
 0001D33F    movzx       ecx,word ptr [edi+8]
 0001D343    shr         ecx,0F
 0001D346    call        0001D3D7
>0001D34B    je          0001D399
 0001D34D    call        0001D412
 0001D352    mov         eax,dword ptr [ebp-14]
 0001D355    mov         edx,270F
 0001D35A    cmp         byte ptr [ebp-0C],0
>0001D35E    jne         0001D36A
 0001D360    sub         eax,dword ptr [ebp-18]
 0001D363    mov         edx,eax
 0001D365    mov         eax,12
 0001D36A    push        eax
 0001D36B    push        edx
 0001D36C    lea         eax,[ebp-40]
 0001D36F    mov         edx,edi
 0001D371    mov         ecx,ebx
 0001D373    call        FloatToDecimal
 0001D378    mov         ax,word ptr [ebp-40]
 0001D37C    cmp         ax,8000
>0001D380    je          0001D399
 0001D382    cmp         ax,7FFF
>0001D386    je          0001D399
 0001D388    cmp         bl,0
>0001D38B    jne         0001D3AD
 0001D38D    cmp         ax,12
>0001D391    jle         0001D3AD
 0001D393    cmp         byte ptr [ebp-0C],0
>0001D397    jne         0001D3AD
 0001D399    push        0
 0001D39B    push        0F
 0001D39D    push        0
 0001D39F    mov         eax,dword ptr [ebp-4]
 0001D3A2    mov         edx,edi
 0001D3A4    mov         ecx,ebx
 0001D3A6    call        FloatToText
>0001D3AB    jmp         0001D3CE
 0001D3AD    cmp         byte ptr [ebp-3D],0
>0001D3B1    jne         0001D3C9
 0001D3B3    mov         ecx,2
 0001D3B8    call        0001D3D7
>0001D3BD    je          0001D399
 0001D3BF    cmp         esi,dword ptr [ebp-10]
>0001D3C2    je          0001D3C9
 0001D3C4    call        0001D412
 0001D3C9    call        0001D4BD
 0001D3CE    pop         ebx
 0001D3CF    pop         esi
 0001D3D0    pop         edi
 0001D3D1    mov         esp,ebp
 0001D3D3    pop         ebp
 0001D3D4    ret         4
*}
end;

//0001D3D7
{*procedure sub_0001D3D7(?:?);
begin
 0001D3D7    mov         esi,dword ptr [ebp+8]
 0001D3DA    jecxz       0001D3F9
 0001D3DC    lods        byte ptr [esi]
 0001D3DD    cmp         al,27
>0001D3DF    je          0001D405
 0001D3E1    cmp         al,22
>0001D3E3    je          0001D405
 0001D3E5    or          al,al
>0001D3E7    je          0001D3F9
 0001D3E9    cmp         al,3B
>0001D3EB    jne         0001D3DC
 0001D3ED    loop        0001D3DC
 0001D3EF    mov         al,byte ptr [esi]
 0001D3F1    or          al,al
>0001D3F3    je          0001D3F9
 0001D3F5    cmp         al,3B
>0001D3F7    jne         0001D404
 0001D3F9    mov         esi,dword ptr [ebp+8]
 0001D3FC    mov         al,byte ptr [esi]
 0001D3FE    or          al,al
>0001D400    je          0001D404
 0001D402    cmp         al,3B
 0001D404    ret
 0001D405    mov         ah,al
 0001D407    lods        byte ptr [esi]
 0001D408    cmp         al,ah
>0001D40A    je          0001D3DC
 0001D40C    or          al,al
>0001D40E    jne         0001D407
>0001D410    jmp         0001D3F9
 0001D412    push        ebx
 0001D413    mov         dword ptr [ebp-10],esi
 0001D416    mov         ebx,7FFF
 0001D41B    xor         ecx,ecx
 0001D41D    xor         edx,edx
 0001D41F    mov         dword ptr [ebp-18],0FFFFFFFF
 0001D426    mov         byte ptr [ebp-8],dl
 0001D429    mov         byte ptr [ebp-0C],dl
 0001D42C    lods        byte ptr [esi]
 0001D42D    cmp         al,23
>0001D42F    je          0001D457
 0001D431    cmp         al,30
>0001D433    je          0001D45A
 0001D435    cmp         al,2E
>0001D437    je          0001D465
 0001D439    cmp         al,2C
>0001D43B    je          0001D470
 0001D43D    cmp         al,27
>0001D43F    je          0001D476
 0001D441    cmp         al,22
>0001D443    je          0001D476
 0001D445    cmp         al,45
>0001D447    je          0001D483
 0001D449    cmp         al,65
>0001D44B    je          0001D483
 0001D44D    cmp         al,3B
>0001D44F    je          0001D497
 0001D451    or          al,al
>0001D453    jne         0001D42C
>0001D455    jmp         0001D497
 0001D457    inc         edx
>0001D458    jmp         0001D42C
 0001D45A    cmp         edx,ebx
>0001D45C    jge         0001D460
 0001D45E    mov         ebx,edx
 0001D460    inc         edx
 0001D461    mov         ecx,edx
>0001D463    jmp         0001D42C
 0001D465    cmp         dword ptr [ebp-18],0FFFFFFFF
>0001D469    jne         0001D42C
 0001D46B    mov         dword ptr [ebp-18],edx
>0001D46E    jmp         0001D42C
 0001D470    mov         byte ptr [ebp-8],1
>0001D474    jmp         0001D42C
 0001D476    mov         ah,al
 0001D478    lods        byte ptr [esi]
 0001D479    cmp         al,ah
>0001D47B    je          0001D42C
 0001D47D    or          al,al
>0001D47F    jne         0001D478
>0001D481    jmp         0001D497
 0001D483    lods        byte ptr [esi]
 0001D484    cmp         al,2D
>0001D486    je          0001D48C
 0001D488    cmp         al,2B
>0001D48A    jne         0001D42D
 0001D48C    mov         byte ptr [ebp-0C],1
 0001D490    lods        byte ptr [esi]
 0001D491    cmp         al,30
>0001D493    je          0001D490
>0001D495    jmp         0001D42D
 0001D497    mov         dword ptr [ebp-14],edx
 0001D49A    cmp         dword ptr [ebp-18],0FFFFFFFF
>0001D49E    jne         0001D4A3
 0001D4A0    mov         dword ptr [ebp-18],edx
 0001D4A3    mov         eax,dword ptr [ebp-18]
 0001D4A6    sub         eax,ecx
>0001D4A8    jle         0001D4AC
 0001D4AA    xor         eax,eax
 0001D4AC    mov         dword ptr [ebp-20],eax
 0001D4AF    mov         eax,dword ptr [ebp-18]
 0001D4B2    sub         eax,ebx
>0001D4B4    jge         0001D4B8
 0001D4B6    xor         eax,eax
 0001D4B8    mov         dword ptr [ebp-1C],eax
 0001D4BB    pop         ebx
 0001D4BC    ret
end;*}

//0001D412
{*procedure sub_0001D412(?:?);
begin
 0001D412    push        ebx
 0001D413    mov         dword ptr [ebp-10],esi
 0001D416    mov         ebx,7FFF
 0001D41B    xor         ecx,ecx
 0001D41D    xor         edx,edx
 0001D41F    mov         dword ptr [ebp-18],0FFFFFFFF
 0001D426    mov         byte ptr [ebp-8],dl
 0001D429    mov         byte ptr [ebp-0C],dl
 0001D42C    lods        byte ptr [esi]
 0001D42D    cmp         al,23
>0001D42F    je          0001D457
 0001D431    cmp         al,30
>0001D433    je          0001D45A
 0001D435    cmp         al,2E
>0001D437    je          0001D465
 0001D439    cmp         al,2C
>0001D43B    je          0001D470
 0001D43D    cmp         al,27
>0001D43F    je          0001D476
 0001D441    cmp         al,22
>0001D443    je          0001D476
 0001D445    cmp         al,45
>0001D447    je          0001D483
 0001D449    cmp         al,65
>0001D44B    je          0001D483
 0001D44D    cmp         al,3B
>0001D44F    je          0001D497
 0001D451    or          al,al
>0001D453    jne         0001D42C
>0001D455    jmp         0001D497
 0001D457    inc         edx
>0001D458    jmp         0001D42C
 0001D45A    cmp         edx,ebx
>0001D45C    jge         0001D460
 0001D45E    mov         ebx,edx
 0001D460    inc         edx
 0001D461    mov         ecx,edx
>0001D463    jmp         0001D42C
 0001D465    cmp         dword ptr [ebp-18],0FFFFFFFF
>0001D469    jne         0001D42C
 0001D46B    mov         dword ptr [ebp-18],edx
>0001D46E    jmp         0001D42C
 0001D470    mov         byte ptr [ebp-8],1
>0001D474    jmp         0001D42C
 0001D476    mov         ah,al
 0001D478    lods        byte ptr [esi]
 0001D479    cmp         al,ah
>0001D47B    je          0001D42C
 0001D47D    or          al,al
>0001D47F    jne         0001D478
>0001D481    jmp         0001D497
 0001D483    lods        byte ptr [esi]
 0001D484    cmp         al,2D
>0001D486    je          0001D48C
 0001D488    cmp         al,2B
>0001D48A    jne         0001D42D
 0001D48C    mov         byte ptr [ebp-0C],1
 0001D490    lods        byte ptr [esi]
 0001D491    cmp         al,30
>0001D493    je          0001D490
>0001D495    jmp         0001D42D
 0001D497    mov         dword ptr [ebp-14],edx
 0001D49A    cmp         dword ptr [ebp-18],0FFFFFFFF
>0001D49E    jne         0001D4A3
 0001D4A0    mov         dword ptr [ebp-18],edx
 0001D4A3    mov         eax,dword ptr [ebp-18]
 0001D4A6    sub         eax,ecx
>0001D4A8    jle         0001D4AC
 0001D4AA    xor         eax,eax
 0001D4AC    mov         dword ptr [ebp-20],eax
 0001D4AF    mov         eax,dword ptr [ebp-18]
 0001D4B2    sub         eax,ebx
>0001D4B4    jge         0001D4B8
 0001D4B6    xor         eax,eax
 0001D4B8    mov         dword ptr [ebp-1C],eax
 0001D4BB    pop         ebx
 0001D4BC    ret
end;*}

//0001D4BD
procedure sub_0001D4BD;
begin
{*
 0001D4BD    cmp         byte ptr [ebp-0C],0
>0001D4C1    je          0001D4CA
 0001D4C3    mov         eax,dword ptr [ebp-18]
 0001D4C6    xor         edx,edx
>0001D4C8    jmp         0001D4DD
 0001D4CA    movsx       eax,word ptr [ebp-40]
 0001D4CE    cmp         eax,dword ptr [ebp-18]
>0001D4D1    jg          0001D4D6
 0001D4D3    mov         eax,dword ptr [ebp-18]
 0001D4D6    movsx       edx,word ptr [ebp-40]
 0001D4DA    sub         edx,dword ptr [ebp-18]
 0001D4DD    mov         dword ptr [ebp-24],eax
 0001D4E0    mov         dword ptr [ebp-28],edx
 0001D4E3    mov         esi,dword ptr [ebp-10]
 0001D4E6    mov         edi,dword ptr [ebp-4]
 0001D4E9    lea         ebx,[ebp-3D]
 0001D4EC    cmp         byte ptr [ebp-3E],0
>0001D4F0    je          0001D4FA
 0001D4F2    cmp         esi,dword ptr [ebp+8]
>0001D4F5    jne         0001D4FA
 0001D4F7    mov         al,2D
 0001D4F9    stos        byte ptr [edi]
 0001D4FA    lods        byte ptr [esi]
 0001D4FB    cmp         al,23
>0001D4FD    je          0001D526
 0001D4FF    cmp         al,30
>0001D501    je          0001D526
 0001D503    cmp         al,2E
>0001D505    je          0001D4FA
 0001D507    cmp         al,2C
>0001D509    je          0001D4FA
 0001D50B    cmp         al,27
>0001D50D    je          0001D52D
 0001D50F    cmp         al,22
>0001D511    je          0001D52D
 0001D513    cmp         al,45
>0001D515    je          0001D53B
 0001D517    cmp         al,65
>0001D519    je          0001D53B
 0001D51B    cmp         al,3B
>0001D51D    je          0001D572
 0001D51F    or          al,al
>0001D521    je          0001D572
 0001D523    stos        byte ptr [edi]
>0001D524    jmp         0001D4FA
 0001D526    call        0001D578
>0001D52B    jmp         0001D4FA
 0001D52D    mov         ah,al
 0001D52F    lods        byte ptr [esi]
 0001D530    cmp         al,ah
>0001D532    je          0001D4FA
 0001D534    or          al,al
>0001D536    je          0001D572
 0001D538    stos        byte ptr [edi]
>0001D539    jmp         0001D52F
 0001D53B    mov         ah,byte ptr [esi]
 0001D53D    cmp         ah,2B
>0001D540    je          0001D549
 0001D542    cmp         ah,2D
>0001D545    jne         0001D523
 0001D547    xor         ah,ah
 0001D549    mov         ecx,0FFFFFFFF
 0001D54E    inc         ecx
 0001D54F    inc         esi
 0001D550    cmp         byte ptr [esi],30
>0001D553    je          0001D54E
 0001D555    cmp         ecx,4
>0001D558    jb          0001D55F
 0001D55A    mov         ecx,4
 0001D55F    push        ebx
 0001D560    mov         bl,byte ptr [ebp-3D]
 0001D563    movsx       edx,word ptr [ebp-40]
 0001D567    sub         edx,dword ptr [ebp-18]
 0001D56A    call        0001D199
 0001D56F    pop         ebx
>0001D570    jmp         0001D4FA
 0001D572    mov         eax,edi
 0001D574    sub         eax,dword ptr [ebp-4]
 0001D577    ret
*}
end;

//0001D578
{*function sub_0001D578:?;
begin
 0001D578    cmp         dword ptr [ebp-28],0
>0001D57C    je          0001D599
>0001D57E    jl          0001D58C
 0001D580    call        0001D599
 0001D585    dec         dword ptr [ebp-28]
>0001D588    jne         0001D580
>0001D58A    jmp         0001D599
 0001D58C    inc         dword ptr [ebp-28]
 0001D58F    mov         eax,dword ptr [ebp-24]
 0001D592    cmp         eax,dword ptr [ebp-1C]
>0001D595    jle         0001D5A9
>0001D597    jmp         0001D5DA
 0001D599    mov         al,byte ptr [ebx]
 0001D59B    inc         ebx
 0001D59C    or          al,al
>0001D59E    jne         0001D5AB
 0001D5A0    dec         ebx
 0001D5A1    mov         eax,dword ptr [ebp-24]
 0001D5A4    cmp         eax,dword ptr [ebp-20]
>0001D5A7    jle         0001D5DA
 0001D5A9    mov         al,30
 0001D5AB    cmp         dword ptr [ebp-24],0
>0001D5AF    jne         0001D5BC
 0001D5B1    mov         ah,al
 0001D5B3    mov         al,[000B64FB];gvar_000B64FB:Char
 0001D5B8    stos        word ptr [edi]
>0001D5BA    jmp         0001D5DA
 0001D5BC    stos        byte ptr [edi]
 0001D5BD    cmp         byte ptr [ebp-8],0
>0001D5C1    je          0001D5DA
 0001D5C3    mov         eax,dword ptr [ebp-24]
 0001D5C6    cmp         eax,1
>0001D5C9    jle         0001D5DA
 0001D5CB    mov         dl,3
 0001D5CD    div         al,dl
 0001D5CF    cmp         ah,1
>0001D5D2    jne         0001D5DA
 0001D5D4    mov         al,[000B64FA];gvar_000B64FA
 0001D5D9    stos        byte ptr [edi]
 0001D5DA    dec         dword ptr [ebp-24]
 0001D5DD    ret
end;*}

//0001D599
procedure sub_0001D599;
begin
{*
 0001D599    mov         al,byte ptr [ebx]
 0001D59B    inc         ebx
 0001D59C    or          al,al
>0001D59E    jne         0001D5AB
 0001D5A0    dec         ebx
 0001D5A1    mov         eax,dword ptr [ebp-24]
 0001D5A4    cmp         eax,dword ptr [ebp-20]
>0001D5A7    jle         0001D5DA
 0001D5A9    mov         al,30
 0001D5AB    cmp         dword ptr [ebp-24],0
>0001D5AF    jne         0001D5BC
 0001D5B1    mov         ah,al
 0001D5B3    mov         al,[000B64FB];gvar_000B64FB:Char
 0001D5B8    stos        word ptr [edi]
>0001D5BA    jmp         0001D5DA
 0001D5BC    stos        byte ptr [edi]
 0001D5BD    cmp         byte ptr [ebp-8],0
>0001D5C1    je          0001D5DA
 0001D5C3    mov         eax,dword ptr [ebp-24]
 0001D5C6    cmp         eax,1
>0001D5C9    jle         0001D5DA
 0001D5CB    mov         dl,3
 0001D5CD    div         al,dl
 0001D5CF    cmp         ah,1
>0001D5D2    jne         0001D5DA
 0001D5D4    mov         al,[000B64FA];gvar_000B64FA
 0001D5D9    stos        byte ptr [edi]
 0001D5DA    dec         dword ptr [ebp-24]
 0001D5DD    ret
*}
end;

//0001D5DE
procedure FloatToDecimal(var Result:TFloatRec; const Value:void ; ValueType:TFloatValue; Precision:Integer; Decimals:Integer);
begin
{*
 0001D5DE    push        ebp
 0001D5DF    mov         ebp,esp
 0001D5E1    sub         esp,1A
 0001D5E4    push        edi
 0001D5E5    push        esi
 0001D5E6    push        ebx
 0001D5E7    mov         ebx,eax
 0001D5E9    mov         esi,edx
 0001D5EB    cmp         cl,0
>0001D5EE    je          0001D5F7
 0001D5F0    call        0001D6FE
>0001D5F5    jmp         0001D5FC
 0001D5F7    call        0001D605
 0001D5FC    pop         ebx
 0001D5FD    pop         esi
 0001D5FE    pop         edi
 0001D5FF    mov         esp,ebp
 0001D601    pop         ebp
 0001D602    ret         8
*}
end;

//0001D605
procedure sub_0001D605;
begin
{*
 0001D605    mov         ax,word ptr [esi+8]
 0001D609    mov         edx,eax
 0001D60B    and         eax,7FFF
>0001D610    je          0001D622
 0001D612    cmp         eax,7FFF
>0001D617    jne         0001D62D
 0001D619    cmp         word ptr [esi+6],8000
>0001D61F    je          0001D624
 0001D621    inc         eax
 0001D622    xor         edx,edx
 0001D624    mov         byte ptr [ebx+3],0
>0001D628    jmp         0001D6EF
 0001D62D    fld         tbyte ptr [esi]
 0001D62F    sub         eax,3FFF
 0001D634    imul        eax,eax,4D10
 0001D63A    sar         eax,10
 0001D63D    inc         eax
 0001D63E    mov         dword ptr [ebp-8],eax
 0001D641    mov         eax,12
 0001D646    sub         eax,dword ptr [ebp-8]
 0001D649    fabs
 0001D64B    call        FPower10
 0001D650    frndint
 0001D652    fld         tbyte ptr ds:[1D030];1E18:Extended
 0001D658    fcomp       st(1)
 0001D65A    wait
 0001D65B    fnstsw      word ptr [ebp-4]
 0001D65E    wait
 0001D65F    test        word ptr [ebp-4],4100
>0001D665    je          0001D670
 0001D667    fidiv       dword ptr ds:[1D020];_DF_:Single
 0001D66D    inc         dword ptr [ebp-8]
 0001D670    fbstp       tbyte ptr [ebp-1A]
 0001D673    lea         edi,[ebx+3]
 0001D676    mov         edx,9
 0001D67B    wait
 0001D67C    mov         al,byte ptr [ebp+edx-1B]
 0001D680    mov         ah,al
 0001D682    shr         al,4
 0001D685    and         ah,0F
 0001D688    add         ax,3030
 0001D68C    stos        word ptr [edi]
 0001D68E    dec         edx
>0001D68F    jne         0001D67C
 0001D691    xor         al,al
 0001D693    stos        byte ptr [edi]
 0001D694    mov         edi,dword ptr [ebp-8]
 0001D697    add         edi,dword ptr [ebp+8]
>0001D69A    jns         0001D6A0
 0001D69C    xor         eax,eax
>0001D69E    jmp         0001D622
 0001D6A0    cmp         edi,dword ptr [ebp+0C]
>0001D6A3    jb          0001D6A8
 0001D6A5    mov         edi,dword ptr [ebp+0C]
 0001D6A8    cmp         edi,12
>0001D6AB    jae         0001D6D4
 0001D6AD    cmp         byte ptr [ebx+edi+3],35
>0001D6B2    jb          0001D6D9
 0001D6B4    mov         byte ptr [ebx+edi+3],0
 0001D6B9    dec         edi
>0001D6BA    js          0001D6C9
 0001D6BC    inc         byte ptr [ebx+edi+3]
 0001D6C0    cmp         byte ptr [ebx+edi+3],39
>0001D6C5    ja          0001D6B4
>0001D6C7    jmp         0001D6E8
 0001D6C9    mov         word ptr [ebx+3],31
 0001D6CF    inc         dword ptr [ebp-8]
>0001D6D2    jmp         0001D6E8
 0001D6D4    mov         edi,12
 0001D6D9    mov         byte ptr [ebx+edi+3],0
 0001D6DE    dec         edi
>0001D6DF    js          0001D6FA
 0001D6E1    cmp         byte ptr [ebx+edi+3],30
>0001D6E6    je          0001D6D9
 0001D6E8    mov         dx,word ptr [esi+8]
 0001D6EC    mov         eax,dword ptr [ebp-8]
 0001D6EF    shr         dx,0F
 0001D6F3    mov         word ptr [ebx],ax
 0001D6F6    mov         byte ptr [ebx+2],dl
 0001D6F9    ret
 0001D6FA    xor         edx,edx
>0001D6FC    jmp         0001D6EC
 0001D6FE    mov         eax,dword ptr [esi]
 0001D700    mov         edx,dword ptr [esi+4]
 0001D703    mov         ecx,eax
 0001D705    or          ecx,edx
>0001D707    je          0001D7C1
 0001D70D    or          edx,edx
>0001D70F    jns         0001D718
 0001D711    neg         edx
 0001D713    neg         eax
 0001D715    sbb         edx,0
 0001D718    xor         ecx,ecx
 0001D71A    mov         edi,dword ptr [ebp+8]
 0001D71D    or          edi,edi
>0001D71F    jge         0001D723
 0001D721    xor         edi,edi
 0001D723    cmp         edi,4
>0001D726    jl          0001D747
 0001D728    mov         edi,4
 0001D72D    inc         ecx
 0001D72E    sub         eax,0A7640000
 0001D733    sbb         edx,0DE0B6B3
>0001D739    jae         0001D72D
 0001D73B    dec         ecx
 0001D73C    add         eax,0A7640000
 0001D741    adc         edx,0DE0B6B3
 0001D747    mov         dword ptr [ebp-10],eax
 0001D74A    mov         dword ptr [ebp-0C],edx
 0001D74D    fild        qword ptr [ebp-10]
 0001D750    mov         edx,edi
 0001D752    mov         eax,4
 0001D757    sub         eax,edx
>0001D759    je          0001D762
 0001D75B    fidiv       dword ptr [eax*4+1D01C]
 0001D762    fbstp       tbyte ptr [ebp-1A]
 0001D765    lea         edi,[ebx+3]
 0001D768    wait
 0001D769    or          ecx,ecx
>0001D76B    jne         0001D788
 0001D76D    mov         ecx,9
 0001D772    mov         al,byte ptr [ebp+ecx-1B]
 0001D776    mov         ah,al
 0001D778    shr         al,4
>0001D77B    jne         0001D79B
 0001D77D    mov         al,ah
 0001D77F    and         al,0F
>0001D781    jne         0001D7A2
 0001D783    dec         ecx
>0001D784    jne         0001D772
>0001D786    jmp         0001D7C1
 0001D788    mov         al,cl
 0001D78A    add         al,30
 0001D78C    stos        byte ptr [edi]
 0001D78D    mov         ecx,9
 0001D792    mov         al,byte ptr [ebp+ecx-1B]
 0001D796    mov         ah,al
 0001D798    shr         al,4
 0001D79B    add         al,30
 0001D79D    stos        byte ptr [edi]
 0001D79E    mov         al,ah
 0001D7A0    and         al,0F
 0001D7A2    add         al,30
 0001D7A4    stos        byte ptr [edi]
 0001D7A5    dec         ecx
>0001D7A6    jne         0001D792
 0001D7A8    mov         eax,edi
 0001D7AA    lea         ecx,[ebx+edx+3]
 0001D7AE    sub         eax,ecx
 0001D7B0    mov         byte ptr [edi],0
 0001D7B3    dec         edi
 0001D7B4    cmp         byte ptr [edi],30
>0001D7B7    je          0001D7B0
 0001D7B9    mov         edx,dword ptr [esi+4]
 0001D7BC    shr         edx,1F
>0001D7BF    jmp         0001D7C8
 0001D7C1    xor         eax,eax
 0001D7C3    xor         edx,edx
 0001D7C5    mov         byte ptr [ebx+3],al
 0001D7C8    mov         word ptr [ebx],ax
 0001D7CB    mov         byte ptr [ebx+2],dl
 0001D7CE    ret
*}
end;

//0001D6FE
procedure sub_0001D6FE;
begin
{*
 0001D6FE    mov         eax,dword ptr [esi]
 0001D700    mov         edx,dword ptr [esi+4]
 0001D703    mov         ecx,eax
 0001D705    or          ecx,edx
>0001D707    je          0001D7C1
 0001D70D    or          edx,edx
>0001D70F    jns         0001D718
 0001D711    neg         edx
 0001D713    neg         eax
 0001D715    sbb         edx,0
 0001D718    xor         ecx,ecx
 0001D71A    mov         edi,dword ptr [ebp+8]
 0001D71D    or          edi,edi
>0001D71F    jge         0001D723
 0001D721    xor         edi,edi
 0001D723    cmp         edi,4
>0001D726    jl          0001D747
 0001D728    mov         edi,4
 0001D72D    inc         ecx
 0001D72E    sub         eax,0A7640000
 0001D733    sbb         edx,0DE0B6B3
>0001D739    jae         0001D72D
 0001D73B    dec         ecx
 0001D73C    add         eax,0A7640000
 0001D741    adc         edx,0DE0B6B3
 0001D747    mov         dword ptr [ebp-10],eax
 0001D74A    mov         dword ptr [ebp-0C],edx
 0001D74D    fild        qword ptr [ebp-10]
 0001D750    mov         edx,edi
 0001D752    mov         eax,4
 0001D757    sub         eax,edx
>0001D759    je          0001D762
 0001D75B    fidiv       dword ptr [eax*4+1D01C]
 0001D762    fbstp       tbyte ptr [ebp-1A]
 0001D765    lea         edi,[ebx+3]
 0001D768    wait
 0001D769    or          ecx,ecx
>0001D76B    jne         0001D788
 0001D76D    mov         ecx,9
 0001D772    mov         al,byte ptr [ebp+ecx-1B]
 0001D776    mov         ah,al
 0001D778    shr         al,4
>0001D77B    jne         0001D79B
 0001D77D    mov         al,ah
 0001D77F    and         al,0F
>0001D781    jne         0001D7A2
 0001D783    dec         ecx
>0001D784    jne         0001D772
>0001D786    jmp         0001D7C1
 0001D788    mov         al,cl
 0001D78A    add         al,30
 0001D78C    stos        byte ptr [edi]
 0001D78D    mov         ecx,9
 0001D792    mov         al,byte ptr [ebp+ecx-1B]
 0001D796    mov         ah,al
 0001D798    shr         al,4
 0001D79B    add         al,30
 0001D79D    stos        byte ptr [edi]
 0001D79E    mov         al,ah
 0001D7A0    and         al,0F
 0001D7A2    add         al,30
 0001D7A4    stos        byte ptr [edi]
 0001D7A5    dec         ecx
>0001D7A6    jne         0001D792
 0001D7A8    mov         eax,edi
 0001D7AA    lea         ecx,[ebx+edx+3]
 0001D7AE    sub         eax,ecx
 0001D7B0    mov         byte ptr [edi],0
 0001D7B3    dec         edi
 0001D7B4    cmp         byte ptr [edi],30
>0001D7B7    je          0001D7B0
 0001D7B9    mov         edx,dword ptr [esi+4]
 0001D7BC    shr         edx,1F
>0001D7BF    jmp         0001D7C8
 0001D7C1    xor         eax,eax
 0001D7C3    xor         edx,edx
 0001D7C5    mov         byte ptr [ebx+3],al
 0001D7C8    mov         word ptr [ebx],ax
 0001D7CB    mov         byte ptr [ebx+2],dl
 0001D7CE    ret
*}
end;

//0001D7CF
function TextToFloat(Buffer:PChar; var Value:void ; ValueType:TFloatValue):Boolean;
begin
{*
 0001D7CF    push        ebp
 0001D7D0    mov         ebp,esp
 0001D7D2    sub         esp,6
 0001D7D5    push        edi
 0001D7D6    push        esi
 0001D7D7    push        ebx
 0001D7D8    mov         esi,eax
 0001D7DA    mov         edi,edx
 0001D7DC    mov         ebx,ecx
 0001D7DE    wait
 0001D7DF    fnstcw      word ptr [ebp-6]
 0001D7E2    wait
 0001D7E3    fnclex
 0001D7E5    fldcw       word ptr ds:[1D03A]
 0001D7EB    fldz
 0001D7ED    call        0001D87A
 0001D7F2    mov         bh,byte ptr [esi]
 0001D7F4    cmp         bh,2B
>0001D7F7    je          0001D7FE
 0001D7F9    cmp         bh,2D
>0001D7FC    jne         0001D7FF
 0001D7FE    inc         esi
 0001D7FF    mov         ecx,esi
 0001D801    call        0001D885
 0001D806    xor         edx,edx
 0001D808    mov         al,byte ptr [esi]
 0001D80A    cmp         al,byte ptr ds:[0B64FB];gvar_000B64FB:Char
>0001D810    jne         0001D81A
 0001D812    inc         esi
 0001D813    call        0001D885
 0001D818    neg         edx
 0001D81A    cmp         ecx,esi
>0001D81C    je          0001D868
 0001D81E    mov         al,byte ptr [esi]
 0001D820    and         al,0DF
 0001D822    cmp         al,45
>0001D824    jne         0001D830
 0001D826    inc         esi
 0001D827    push        edx
 0001D828    call        0001D8A1
 0001D82D    pop         eax
 0001D82E    add         edx,eax
 0001D830    call        0001D87A
 0001D835    cmp         byte ptr [esi],0
>0001D838    jne         0001D868
 0001D83A    mov         eax,edx
 0001D83C    cmp         bl,1
>0001D83F    jne         0001D844
 0001D841    add         eax,4
 0001D844    call        FPower10
 0001D849    cmp         bh,2D
>0001D84C    jne         0001D850
 0001D84E    fchs
 0001D850    cmp         bl,0
>0001D853    je          0001D859
 0001D855    fistp       qword ptr [edi]
>0001D857    jmp         0001D85B
 0001D859    fstp        tbyte ptr [edi]
 0001D85B    wait
 0001D85C    fnstsw      al
 0001D85E    test        ax,9
>0001D862    jne         0001D86A
 0001D864    mov         al,1
>0001D866    jmp         0001D86C
 0001D868    fstp        st(0)
 0001D86A    xor         eax,eax
 0001D86C    wait
 0001D86D    fnclex
 0001D86F    fldcw       word ptr [ebp-6]
 0001D872    wait
 0001D873    pop         ebx
 0001D874    pop         esi
 0001D875    pop         edi
 0001D876    mov         esp,ebp
 0001D878    pop         ebp
 0001D879    ret
*}
end;

//0001D87A
{*procedure sub_0001D87A(?:?);
begin
 0001D87A    lods        byte ptr [esi]
 0001D87B    or          al,al
>0001D87D    je          0001D883
 0001D87F    cmp         al,20
>0001D881    je          0001D87A
 0001D883    dec         esi
 0001D884    ret
end;*}

//0001D885
procedure sub_0001D885;
begin
{*
 0001D885    xor         eax,eax
 0001D887    xor         edx,edx
 0001D889    lods        byte ptr [esi]
 0001D88A    sub         al,3A
 0001D88C    add         al,0A
>0001D88E    jae         0001D89F
 0001D890    fimul       dword ptr ds:[1D020];_DF_:Single
 0001D896    mov         dword ptr [ebp-4],eax
 0001D899    fiadd       dword ptr [ebp-4]
 0001D89C    inc         edx
>0001D89D    jmp         0001D889
 0001D89F    dec         esi
 0001D8A0    ret
*}
end;

//0001D8A1
procedure sub_0001D8A1;
begin
{*
 0001D8A1    xor         eax,eax
 0001D8A3    xor         edx,edx
 0001D8A5    mov         cl,byte ptr [esi]
 0001D8A7    cmp         cl,2B
>0001D8AA    je          0001D8B1
 0001D8AC    cmp         cl,2D
>0001D8AF    jne         0001D8B2
 0001D8B1    inc         esi
 0001D8B2    mov         al,byte ptr [esi]
 0001D8B4    sub         al,3A
 0001D8B6    add         al,0A
>0001D8B8    jae         0001D8C8
 0001D8BA    inc         esi
 0001D8BB    imul        edx,edx,0A
 0001D8BE    add         edx,eax
 0001D8C0    cmp         edx,1F4
>0001D8C6    jb          0001D8B2
 0001D8C8    cmp         cl,2D
>0001D8CB    jne         0001D8CF
 0001D8CD    neg         edx
 0001D8CF    ret
*}
end;

Initialization
//0001DA1C
{*
 0001DA1C    push        ebp
 0001DA1D    mov         ebp,esp
 0001DA1F    xor         eax,eax
 0001DA21    push        ebp
 0001DA22    push        1DA85
 0001DA27    push        dword ptr fs:[eax]
 0001DA2A    mov         dword ptr fs:[eax],esp
 0001DA2D    sub         dword ptr ds:[0B65FC],1
>0001DA34    jae         0001DA77
 0001DA36    mov         eax,1CD60;_NF__7A3
 0001DA3B    call        @InitResStringImports
 0001DA40    mov         eax,1CE54;_NF__7A4
 0001DA45    call        @InitImports
 0001DA4A    mov         eax,[000B5AE8];^ModuleIsCpp:Boolean
 0001DA4F    cmp         byte ptr [eax],0
>0001DA52    je          0001DA63
 0001DA54    mov         eax,0B4184
 0001DA59    mov         edx,1DA98;'0x'
 0001DA5E    call        @LStrAsg
 0001DA63    call        InitExceptions
 0001DA68    call        GetFormatSettings
 0001DA6D    call        InitPlatformId
 0001DA72    call        InitDriveSpacePtr
 0001DA77    xor         eax,eax
 0001DA79    pop         edx
 0001DA7A    pop         ecx
 0001DA7B    pop         ecx
 0001DA7C    mov         dword ptr fs:[eax],edx
 0001DA7F    push        1DA8C
 0001DA84    ret
>0001DA85    jmp         @HandleFinally
>0001DA8A    jmp         0001DA84
 0001DA8C    pop         ebp
 0001DA8D    ret
*}
Finalization
//0001D8D0
{*
 0001D8D0    push        ebp
 0001D8D1    mov         ebp,esp
 0001D8D3    xor         eax,eax
 0001D8D5    push        ebp
 0001D8D6    push        1DA11
 0001D8DB    push        dword ptr fs:[eax]
 0001D8DE    mov         dword ptr fs:[eax],esp
 0001D8E1    inc         dword ptr ds:[0B65FC]
>0001D8E7    jne         0001DA03
 0001D8ED    call        FreeTerminateProcs
 0001D8F2    call        DoneExceptions
 0001D8F7    mov         eax,0B4294
 0001D8FC    mov         ecx,15
 0001D901    mov         edx,dword ptr ds:[1BB88];TExceptRec
 0001D907    call        @FinalizeArray
 0001D90C    mov         eax,0B425C
 0001D911    mov         ecx,7
 0001D916    mov         edx,dword ptr ds:[1BAC4];TErrorRec
 0001D91C    call        @FinalizeArray
 0001D921    mov         eax,0B41B0
 0001D926    mov         ecx,2
 0001D92B    mov         edx,dword ptr ds:[110CC];String
 0001D931    call        @FinalizeArray
 0001D936    mov         eax,0B4184
 0001D93B    call        @LStrClr
 0001D940    mov         eax,0B65C0
 0001D945    mov         ecx,7
 0001D94A    mov         edx,dword ptr ds:[110CC];String
 0001D950    call        @FinalizeArray
 0001D955    mov         eax,0B6598
 0001D95A    mov         ecx,7
 0001D95F    mov         edx,dword ptr ds:[110CC];String
 0001D965    call        @FinalizeArray
 0001D96A    mov         eax,0B657C
 0001D96F    mov         ecx,7
 0001D974    mov         edx,dword ptr ds:[110CC];String
 0001D97A    call        @FinalizeArray
 0001D97F    mov         eax,0B654C
 0001D984    mov         ecx,0C
 0001D989    mov         edx,dword ptr ds:[110CC];String
 0001D98F    call        @FinalizeArray
 0001D994    mov         eax,0B651C
 0001D999    mov         ecx,0C
 0001D99E    mov         edx,dword ptr ds:[110CC];String
 0001D9A4    call        @FinalizeArray
 0001D9A9    mov         eax,0B6518
 0001D9AE    call        @LStrClr
 0001D9B3    mov         eax,0B6514;gvar_000B6514
 0001D9B8    call        @LStrClr
 0001D9BD    mov         eax,0B6510
 0001D9C2    call        @LStrClr
 0001D9C7    mov         eax,0B650C
 0001D9CC    call        @LStrClr
 0001D9D1    mov         eax,0B6504
 0001D9D6    call        @LStrClr
 0001D9DB    mov         eax,0B6500;gvar_000B6500
 0001D9E0    call        @LStrClr
 0001D9E5    mov         eax,0B64F4
 0001D9EA    call        @LStrClr
 0001D9EF    mov         eax,0B412C
 0001D9F4    call        @LStrClr
 0001D9F9    mov         eax,0B4118
 0001D9FE    call        @LStrClr
 0001DA03    xor         eax,eax
 0001DA05    pop         edx
 0001DA06    pop         ecx
 0001DA07    pop         ecx
 0001DA08    mov         dword ptr fs:[eax],edx
 0001DA0B    push        1DA18
 0001DA10    ret
>0001DA11    jmp         @HandleFinally
>0001DA16    jmp         0001DA10
 0001DA18    pop         ebp
 0001DA19    ret
*}
end.