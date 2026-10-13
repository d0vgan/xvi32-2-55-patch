//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit Classes;

interface

uses
  SysUtils, Classes;

type
  TAlignment = (taLeftJustify, taRightJustify, taCenter);
  TLeftRight = (taLeftJustify, taRightJustify);
  TBiDiMode = (bdLeftToRight, bdRightToLeft, bdRightToLeftNoAlign, bdRightToLeftReadingOnly);
  TNotifyEvent = procedure(Sender:TObject) of object;;
  THelpEvent = function(Command:Word; Data:Integer; var CallHelp:Boolean):Boolean of object;;
  EStreamError = class(Exception)
  end;
  EFCreateError = class(EStreamError)
  end;
  EFOpenError = class(EStreamError)
  end;
  EFilerError = class(EStreamError)
  end;
  EReadError = class(EFilerError)
  end;
  EWriteError = class(EFilerError)
  end;
  EClassNotFound = class(EFilerError)
  end;
  EResNotFound = class(Exception)
  end;
  EListError = class(Exception)
  end;
  EBitsError = class(Exception)
  end;
  EStringListError = class(Exception)
  end;
  EComponentError = class(Exception)
  end;
  EOutOfResources = class(EOutOfMemory)
  end;
  EInvalidOperation = class(Exception)
  end;
  TList = class(TObject)
  public
    FList:PPointerList;//f4
    FCount:Integer;//f8
    FCapacity:Integer;//fC
    destructor Destroy; virtual;//00020714
    procedure Grow; virtual;//v0//000208BC
    procedure Error(const Msg:AnsiString; Data:Integer); virtual;//v4//00020800
    procedure Clear; dynamic;//00020764
    function Add(Item:Pointer):Integer;//00020740
    procedure Delete(Index:Integer);//0002077C
    function Expand:TList;//00020838
    function First:Pointer;//00020850
    function Get(Index:Integer):Pointer;//00020858
    function IndexOf(Item:Pointer):Integer;//000208F0
    procedure Insert(Index:Integer; Item:Pointer);//00020910
    function Last:Pointer;//000209B0
    procedure Move(CurIndex:Integer; NewIndex:Integer);//000209BC
    procedure Put(Index:Integer; Item:Pointer);//00020A48
    function Remove(Item:Pointer):Integer;//00020AB0
    procedure SetCapacity(NewCapacity:Integer);//00020AD0
    procedure SetCount(NewCount:Integer);//00020B44
  end;
  TThreadList = class(TObject)
  public
    FList:TList;//f4
    FLock:TRTLCriticalSection;//f8
    constructor Create;//00020BD4
    destructor Destroy;//00020C24
    procedure Add(Item:Pointer);//00020CA0
    function LockList:TList;//00020D00
    procedure Remove(Item:Pointer);//00020D14
    procedure UnlockList;//00020D64
  end;
  TBits = class(TObject)
  public
    FSize:Integer;//f4
    FBits:Pointer;//f8
    destructor Destroy;//00020D70
    procedure Error;//00020DA0
    procedure SetSize(Value:Integer);//00020E00
    procedure SetBit(Index:Integer; Value:Boolean);//00020EA4
    function GetBit(Index:Integer):Boolean;//00020ED0
    function OpenBit:Integer;//00020EE8
  end;
  TPersistent = class(TObject)
  public
    procedure AssignTo(Dest:TPersistent); virtual;//v0//00021090
    procedure DefineProperties(Filer:TFiler); virtual;//v4//00021098
    procedure Assign(Source:TPersistent); virtual;//v8//00020F8C
    procedure GetNamePath; dynamic;//0002109C
    procedure sub_0002114C; dynamic;//0002114C
    procedure AssignError(Source:TPersistent);//00020FA0
  end;
  TCollectionItem = class(TPersistent)
  public
    FCollection:TCollection;//f4
    FID:Integer;//f8
    destructor Destroy; virtual;//00021188
    function GetDisplayName:AnsiString; virtual;//vC//000211F4
    procedure SetIndex(Value:Integer); virtual;//v10//00021304
    procedure SetDisplayName(const Value:AnsiString); virtual;//v14//000212FC
    constructor Create(Collection:TCollection); virtual;//v18//00021150
    procedure GetNamePath; dynamic;//0002121C
    procedure sub_0002114C; dynamic;//000212D0
    procedure Changed(AllItems:Boolean);//000211B8
    function GetIndex:Integer;//000211DC
    procedure SetCollection(Value:TCollection);//000212D4
  end;
  TCollection = class(TPersistent)
  public
    FItemClass:TCollectionItemClass;//f4
    FItems:TList;//f8
    FUpdateCount:Integer;//fC
    FNextID:Integer;//f10
    FPropName:String;//f14
    destructor Destroy; virtual;//00021374
    procedure Assign(Source:TPersistent); virtual;//v8//000213C4
    procedure vC; virtual;//vC//00021904
    procedure v10; virtual;//v10//00021908
    procedure v14; virtual;//v14//0002145C
    procedure EndUpdate; virtual;//v18//000214D8
    procedure GetItemAttr(Index:Integer; ItemIndex:Integer); dynamic;//00021524
    procedure GetAttr(Index:Integer); dynamic;//00021518
    procedure sub_00021514; dynamic;//00021514
    procedure GetNamePath; dynamic;//00021560
    constructor Create(ItemClass:TCollectionItemClass);//00021334
    function Add:TCollectionItem;//000213B8
    procedure Changed;//00021460
    procedure Clear;//00021470
    function FindItemID(ID:Integer):TCollectionItem;//000214E4
    function GetCount:Integer;//00021544
    function GetItem(Index:Integer):TCollectionItem;//0002154C
    function GetPropName:AnsiString;//00021628
    procedure InsertItem(Item:TCollectionItem);//00021840
    procedure RemoveItem(Item:TCollectionItem);//000218D8
  end;
  TStrings = class(TPersistent)
  public
    FUpdateCount:Integer;//f4
    FAdapter:IStringsAdapter;//f8
    destructor Destroy; virtual;//0002190C
    procedure DefineProperties(Filer:TFiler); virtual;//v4//00021B1C
    procedure Assign(Source:TPersistent); virtual;//v8//00021A3C
    procedure Get; virtual; abstract;//vC//000129A8
    procedure v10; virtual;//v10//00021D48
    procedure GetCount; virtual; abstract;//v14//000129A8
    //function v18:?; virtual;//v18//00021D9C
    function GetTextStr:AnsiString; virtual;//v1C//00021DF4
    procedure Put(Index:Integer; const S:AnsiString); virtual;//v20//0002228C
    procedure v24; virtual;//v24//000222BC
    procedure v28; virtual;//v28//00022424
    procedure SetTextStr(const Value:AnsiString); virtual;//v2C//000224AC
    procedure v30; virtual;//v30//0002256C
    function Add(const S:AnsiString):Integer; virtual;//v34//0002193C
    function AddObject(const S:AnsiString; AObject:TObject):Integer; virtual;//v38//00021960
    procedure AddStrings(Strings:TStrings); virtual;//v3C//00021984
    procedure Clear; virtual; abstract;//v40//000129A8
    procedure Delete; virtual; abstract;//v44//000129A8
    procedure Exchange(Index1:Integer; Index2:Integer); virtual;//v48//00021C60
    function GetText:PChar; virtual;//v4C//00021DA0
    function IndexOf(const S:AnsiString):Integer; virtual;//v50//00021F68
    procedure Insert; virtual; abstract;//v54//000129A8
    procedure LoadFromFile(const FileName:AnsiString); virtual;//v58//000220DC
    procedure LoadFromStream(Stream:TStream); virtual;//v5C//00022130
    procedure Move(CurIndex:Integer; NewIndex:Integer); virtual;//v60//000221DC
    procedure SaveToFile(const FileName:AnsiString); virtual;//v64//00022370
    procedure SaveToStream(Stream:TStream); virtual;//v68//000223C8
    procedure SetText(Text:PChar); virtual;//v6C//0002245C
    procedure BeginUpdate;//00021AAC
    procedure EndUpdate;//00021B68
    function Equals(Strings:TStrings):Boolean;//00021B7C
    procedure Error(const Msg:AnsiString; Data:Integer);//00021C28
    function GetName(Index:Integer):AnsiString;//00021D50
    function GetValue(const Name:AnsiString):AnsiString;//00021EDC
    function IndexOfName(const Name:AnsiString):Integer;//00021FE8
    procedure InsertObject(Index:Integer; const S:AnsiString; AObject:TObject);//000220AC
    procedure ReadData(Reader:TReader);//000222C0
    procedure SetStringsAdapter(const Value:IStringsAdapter);//00022428
    procedure SetValue(const Name:AnsiString; const Value:AnsiString);//00022570
    procedure WriteData(Writer:TWriter);//00022614
  end;
  TStringItem = TStringItem = record//size=8
f0:String;//f0
end;;
  TStringList = class(TStrings)
  public
    FList:PStringItemList;//fC
    FCount:Integer;//f10
    FCapacity:Integer;//f14
    FSorted:Boolean;//f18
    FDuplicates:TDuplicates;//f19
    FOnChange:TNotifyEvent;//f1C
    FOnChanging:TNotifyEvent;//f24
    destructor Destroy; virtual;//00022698
    function Get(Index:Integer):AnsiString; virtual;//vC//000229C4
    //function v10:?; virtual;//v10//00022A34
    //function GetCount:?; virtual;//v14//00022A38
    function GetObject(Index:Integer):TObject; virtual;//v18//00022A3C
    procedure Put(Index:Integer; const S:AnsiString); virtual;//v20//00022C04
    procedure PutObject(Index:Integer; AObject:TObject); virtual;//v24//00022CA0
    procedure SetCapacity(NewCapacity:Integer); virtual;//v28//00022DD4
    procedure SetUpdateState(Updating:Boolean); virtual;//v30//00022E0C
    function Add(const S:AnsiString):Integer; virtual;//v34//000226F4
    procedure Clear; virtual;//v40//000227C4
    procedure Delete(Index:Integer); virtual;//v44//000227FC
    procedure Exchange(Index1:Integer; Index2:Integer); virtual;//v48//0002289C
    function IndexOf(const S:AnsiString):Integer; virtual;//v50//00022AD8
    procedure Insert(Index:Integer; const S:AnsiString); virtual;//v54//00022B10
    procedure Changed; virtual;//v70//0002278C
    procedure Changing; virtual;//v74//000227A8
    function Find(const S:AnsiString; var Index:Integer):Boolean; virtual;//v78//0002295C
    procedure Sort; virtual;//v7C//00022E1C
    procedure ExchangeItems(Index1:Integer; Index2:Integer);//00022938
    procedure Grow;//00022AA4
    procedure InsertItem(Index:Integer; const S:AnsiString);//00022B9C
    procedure QuickSort(L:Integer; R:Integer);//00022D18
    procedure SetSorted(Value:Boolean);//00022DF0
  end;
  TStream = class(TObject)
  public
    procedure v0; virtual;//v0//00022E98
    procedure Read; virtual; abstract;//v4//000129A8
    procedure Write; virtual; abstract;//v8//000129A8
    procedure Seek; virtual; abstract;//vC//000129A8
    function GetPosition:Longint;//00022E48
    procedure SetPosition(Pos:Longint);//00022E58
    function GetSize:Longint;//00022E64
    procedure ReadBuffer(var Buffer:void ; Count:Longint);//00022E9C
    procedure WriteBuffer(const Buffer:void ; Count:Longint);//00022F18
    function ReadComponent(Instance:TComponent):TComponent;//00022F94
    procedure WriteComponent(Instance:TComponent);//00022FF4
    procedure WriteDescendent(Instance:TComponent; Ancestor:TComponent);//00022FFC
  end;
  THandleStream = class(TStream)
  public
    FHandle:Integer;//f4
    procedure SetSize(NewSize:Longint); virtual;//v0//00023084
    function Read(var Buffer:void ; Count:Longint):Longint; virtual;//v4//00023058
    function Write(const Buffer:void ; Count:Longint):Longint; virtual;//v8//00023068
    function Seek(Offset:Longint; Origin:Word):Longint; virtual;//vC//00023078
  end;
  TFileStream = class(THandleStream)
  public
    destructor Destroy; virtual;//000231A0
    constructor Create(const FileName:AnsiString; Mode:Word);//000230A4
  end;
  TCustomMemoryStream = class(TStream)
  public
    FMemory:Pointer;//f4
    FSize:Longint;//f8
    FPosition:Longint;//fC
    function Read(var Buffer:void ; Count:Longint):Longint; virtual;//v4//000231D0
    function Seek(Offset:Longint; Origin:Word):Longint; virtual;//vC//00023208
    procedure SetPointer(Ptr:Pointer; Size:Longint);//000231C8
  end;
  TMemoryStream = class(TCustomMemoryStream)
  public
    FCapacity:Longint;//f10
    procedure SetSize(NewSize:Longint); virtual;//v0//00023298
    function Write(const Buffer:void ; Count:Longint):Longint; virtual;//v8//00023384
    function Realloc(var NewCapacity:Longint):Pointer; virtual;//v10//000232C4
    procedure SetCapacity(NewCapacity:Longint);//00023270
    procedure Clear;//00023A04
  end;
  TResourceStream = class(TCustomMemoryStream)
  public
    HResInfo:HRSRC;//f10
    HGlobal:THandle;//f14
    destructor Destroy; virtual;//0002351C
    function Write(const Buffer:void ; Count:Longint):Longint; virtual;//v8//00023554
    constructor Create(Instance:THandle; const ResName:AnsiString; ResType:PChar);//000233D4
    procedure Initialize(Instance:THandle; Name:PChar; ResType:PChar);//000234B0
  end;
  TStreamAdapter = class(TInterfacedObject)
  public
    FStream:TStream;//fC
    FOwnership:TStreamOwnership;//f10
    destructor Destroy; virtual;//00027DE4
    function Read(pv:Pointer; cb:Longint; pcbRead:PLongint):HRESULT; virtual; stdcall;//v0//00027E1C
    function Write(pv:Pointer; cb:Longint; pcbWritten:PLongint):HRESULT; virtual; stdcall;//v4//00027E84
    function Seek(dlibMove:Largeint; dwOrigin:Longint; var libNewPosition:Largeint):HRESULT; virtual; stdcall;//v8//00027EEC
    function SetSize(libNewSize:Largeint):HRESULT; virtual; stdcall;//vC//00027F64
    function CopyTo(stm:IStream; cb:Largeint; var cbRead:Largeint; var cbWritten:Largeint):HRESULT; virtual; stdcall;//v10//00027FC8
    function Commit(grfCommitFlags:Longint):HRESULT; virtual; stdcall;//v14//000280CC
    function Revert:HRESULT; virtual;//v18//000280D8
    function LockRegion(libOffset:Largeint; cb:Largeint; dwLockType:Longint):HRESULT; virtual; stdcall;//v1C//000280E4
    function UnlockRegion(libOffset:Largeint; cb:Largeint; dwLockType:Longint):HRESULT; virtual; stdcall;//v20//000280F0
    function Stat(var statstg:TStatStg; grfStatFlag:Longint):HRESULT; virtual; stdcall;//v24//000280FC
    function Clone(var stm:IStream):HRESULT; virtual; stdcall;//v28//0002817C
    constructor Create(Stream:TStream; Ownership:TStreamOwnership);//00027D9C
  end;
  TFiler = class(TObject)
  public
    FStream:TStream;//f4
    FBuffer:Pointer;//f8
    FBufSize:Integer;//fC
    FBufPos:Integer;//f10
    FBufEnd:Integer;//f14
    FRoot:TComponent;//f18
    FAncestor:TPersistent;//f1C
    FIgnoreChildren:Boolean;//f20
    destructor Destroy; virtual;//000235F4
    procedure DefineProperty; virtual; abstract;//v0//000129A8
    procedure DefineBinaryProperty; virtual; abstract;//v4//000129A8
    procedure FlushBuffer; virtual; abstract;//v8//000129A8
    constructor Create(Stream:TStream; BufSize:Integer);//000235AC
  end;
  TReader = class(TFiler)
  public
    FOwner:TComponent;//f24
    FParent:TComponent;//f28
    FFixups:TList;//f2C
    FLoaded:TList;//f30
    FOnFindMethod:TFindMethodEvent;//f34
    FOnSetName:TSetNameEvent;//f3C
    FOnReferenceName:TReferenceNameEvent;//f44
    FOnAncestorNotFound:TAncestorNotFoundEvent;//f4C
    FOnError:TReaderError;//f54
    FCanHandleExcepts:Boolean;//f5C
    FPropName:String;//f60
    destructor Destroy; virtual;//00023B48
    procedure DefineProperty(const Name:AnsiString; ReadData:TReaderProc; WriteData:TWriterProc; HasData:Boolean); virtual;//v0//00023BA8
    procedure DefineBinaryProperty(const Name:AnsiString; ReadData:TStreamProc; WriteData:TStreamProc; HasData:Boolean); virtual;//v4//00023BDC
    procedure FlushBuffer; virtual;//v8//00023E54
    function Error(const Message:AnsiString):Boolean; virtual;//vC//00023CCC
    function FindMethod(Root:TComponent; const MethodName:AnsiString):Pointer; virtual;//v10//00023CEC
    procedure SetName(Component:TComponent; var Name:AnsiString); virtual;//v14//00025AE8
    procedure ReferenceName(var Name:AnsiString); virtual;//v18//00025AD0
    function FindAncestorComponent(const Name:AnsiString; ComponentClass:TPersistentClass):TComponent; virtual;//v1C//00025A10
    procedure ReadPrefix(var Flags:TFilerFlags; var AChildPos:Integer); virtual;//v20//0002484C
    procedure CheckValue(Value:TValueType);//00023B84
    function EndOfList:Boolean;//00023CB8
    procedure DoFixupReferences;//00023D54
    procedure FreeFixups;//00023E74
    function GetPosition:Longint;//00023EB0
    function NextValue:TValueType;//00023EC8
    procedure PropertyError;//00023ED8
    procedure Read(var Buf:void ; Count:Longint);//00023EE4
    procedure ReadBuffer;//00023F30
    function ReadBoolean:Boolean;//00023FA8
    function ReadChar:Char;//00023FBC
    procedure ReadCollection(Collection:TCollection);//00024040
    function ReadComponent(Component:TComponent):TComponent;//00024304
    procedure ReadData(Instance:TComponent);//00024484
    procedure ReadDataInner(Instance:TComponent);//000244F4
    function ReadFloat:Extended;//000245C4
    function ReadSingle:Single;//00024604
    function ReadCurrency:Currency;//00024644
    function ReadDate:TDateTime;//00024690
    function ReadIdent:AnsiString;//000246D0
    function ReadInteger:Longint;//000247D0
    procedure ReadListBegin;//0002483C
    procedure ReadListEnd;//00024844
    procedure ReadProperty(AInstance:TPersistent);//00024A00
    procedure ReadPropValue(Instance:TPersistent; PropInfo:Pointer);//00024F78
    function ReadRootComponent(Root:TComponent):TComponent;//00025250
    function ReadSet(SetType:Pointer):Integer;//000254C0
    procedure ReadSignature;//0002557C
    function ReadStr:AnsiString;//000255E4
    function ReadString:AnsiString;//00025620
    function ReadWideString:WideString;//00025680
    function ReadValue:TValueType;//000256C8
    procedure SkipSetBody;//000256DC
    procedure SkipValue;//00025828
    procedure SkipProperty;//00025928
    procedure SkipComponent(SkipHeader:Boolean);//00025970
  end;
  TWriter = class(TFiler)
  public
    FRootAncestor:TComponent;//f24
    FPropPath:String;//f28
    FAncestorList:TList;//f2C
    FAncestorPos:Integer;//f30
    FChildPos:Integer;//f34
    destructor Destroy; virtual;//00025B10
    procedure DefineProperty(const Name:AnsiString; ReadData:TReaderProc; WriteData:TWriterProc; HasData:Boolean); virtual;//v0//00025B48
    procedure DefineBinaryProperty(const Name:AnsiString; ReadData:TStreamProc; WriteData:TStreamProc; HasData:Boolean); virtual;//v4//00025B70
    procedure FlushBuffer; virtual;//v8//00025BAC
    procedure WriteData(Instance:TComponent); virtual;//vC//00025E1C
    procedure AddAncestor(Component:TComponent);//00025B3C
    function GetPosition:Longint;//00025B9C
    procedure SetPosition(Value:Longint);//00025BB4
    procedure Write(const Buf:void ; Count:Longint);//00025BEC
    procedure WriteBinary(WriteData:TStreamProc);//00025C38
    procedure WriteBuffer;//00025CC0
    procedure WriteBoolean(Value:Boolean);//00025CD8
    procedure WriteChar(Value:Char);//00025CEC
    procedure WriteCollection(Value:TCollection);//00025D3C
    procedure WriteComponent(Component:TComponent);//00025DE0
    procedure WriteDescendent(Root:TComponent; AAncestor:TComponent);//000260F0
    procedure WriteFloat(const Value:Extended);//00026114
    procedure WriteSingle(const Value:Single);//00026138
    procedure WriteCurrency(const Value:Currency);//0002615C
    procedure WriteDate(const Value:TDateTime);//00026180
    procedure WriteIdent(const Ident:AnsiString);//000261A4
    procedure WriteInteger(Value:Longint);//00026268
    procedure WriteListBegin;//000262DC
    procedure WriteListEnd;//000262E4
    procedure WritePrefix(Flags:TFilerFlags; AChildPos:Integer);//000262EC
    procedure WriteProperties(Instance:TPersistent);//00026330
    procedure WriteProperty(Instance:TPersistent; PropInfo:Pointer);//0002710C
    procedure WritePropName(const PropName:AnsiString);//000271B0
    procedure WriteSignature;//00027204
    procedure WriteStr(const Value:AnsiString);//00027214
    procedure WriteString(const Value:AnsiString);//0002725C
    procedure WriteWideString(const Value:WideString);//000272B8
    procedure WriteValue(Value:TValueType);//000272F4
  end;
  TComponent = class(TPersistent)
  public
    FOwner:TComponent;//f4
    Name:TComponentName;//f8
    Tag:Integer;//fC
    FComponents:TList;//f10
    FFreeNotifies:TList;//f14
    FDesignInfo:Longint;//f18
    FVCLComObject:Pointer;//f1C
    FComponentState:TComponentState;//f20
    FComponentStyle:TComponentStyle;//f21
    function SafeCallException(ExceptObject:TObject; ExceptAddr:Pointer):HRESULT; virtual;//00027ACC
    destructor Destroy; virtual;//00027370
    procedure DefineProperties(Filer:TFiler); virtual;//v4//00027638
    procedure Loaded; virtual;//vC//0002770C
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//000275CC
    procedure ReadState(Reader:TReader); virtual;//v14//00027718
    procedure SetName(const NewName:TComponentName); virtual;//v18//00027844
    procedure v1C; virtual;//v1C//00027AE4
    procedure ValidateRename(AComponent:TComponent; const CurName:AnsiString; const NewName:AnsiString); virtual;//v20//00027728
    //procedure v24(?:?); virtual;//v24//00027720
    function QueryInterface(const IID:TGUID; var Obj:Pointer):HRESULT; virtual; stdcall;//v28//00027AEC
    constructor Create(AOwner:TComponent); virtual;//v2C//00027324
    procedure UpdateAction(Action:TBasicAction); dynamic;//00027AA4
    procedure HasParent; dynamic;//000276BC
    procedure GetParentComponent; dynamic;//000276EC
    procedure ExecuteAction(Action:TBasicAction); dynamic;//00027A7C
    procedure sub_000277F0; dynamic;//000277F0
    procedure ValidateContainer(AComponent:TComponent); dynamic;//000277DC
    procedure Updated; dynamic;//00027700
    procedure Updating; dynamic;//000276F4
    procedure sub_000276F0; dynamic;//000276F0
    procedure sub_000276E8; dynamic;//000276E8
    procedure sub_000276CC; dynamic;//000276CC
    procedure sub_000276C8; dynamic;//000276C8
    procedure sub_000276C0; dynamic;//000276C0
    procedure GetNamePath; dynamic;//000276D0
    procedure sub_0002114C; dynamic;//000276E4
    procedure FreeNotification(AComponent:TComponent);//000273F4
    procedure ReadLeft(Reader:TReader);//00027440
    procedure ReadTop(Reader:TReader);//00027454
    procedure WriteLeft(Writer:TWriter);//00027468
    procedure WriteTop(Writer:TWriter);//00027474
    procedure Insert(AComponent:TComponent);//00027480
    procedure Remove(AComponent:TComponent);//000274AC
    procedure InsertComponent(AComponent:TComponent);//000274D4
    procedure RemoveComponent(AComponent:TComponent);//00027528
    procedure DestroyComponents;//00027568
    procedure Destroying;//00027594
    function FindComponent(const AName:AnsiString):TComponent;//000277F4
    procedure ChangeName(const NewName:TComponentName);//00027910
    function GetComponent(AIndex:Integer):TComponent;//00027924
    function GetComponentCount:Integer;//00027990
    procedure SetComponentIndex(Value:Integer);//000279A0
    procedure SetDesigning(Value:Boolean);//000279F4
    procedure SetReference(Enable:Boolean);//00027A34
  end;
  TBasicActionLink = class(TObject)
  public
    FOnChange:TNotifyEvent;//f4
    FAction:TBasicAction;//fC
    destructor Destroy; virtual;//00027B74
    procedure v0; virtual;//v0//00027B70
    procedure Change; virtual;//v4//00027BA8
    function IsOnExecuteLinked:Boolean; virtual;//v8//00027BFC
    procedure SetAction(Value:TBasicAction); virtual;//vC//00027BD0
    procedure v10; virtual;//v10//00027C00
    constructor Create(AClient:TObject); virtual;//v14//00027B2C
    function Update:Boolean; virtual;//v18//00027C08
    procedure Execute; dynamic;//00027BC0
  end;
  TBasicAction = class(TComponent)
  public
    FOnChange:TNotifyEvent;//f24
    FOnExecute:TNotifyEvent;//f2C
    FOnUpdate:TNotifyEvent;//f34
    FClients:TList;//f3C
    destructor Destroy; virtual;//00027C58
    constructor Create(AOwner:TComponent); virtual;//v2C//00027C14
    procedure Change; virtual;//v30//00027D3C
    procedure SetOnExecute(Value:TNotifyEvent); virtual;//v34//00027CE8
    //function v38:?; virtual;//v38//00027CA4
    procedure v3C; virtual;//v3C//00027CAC
    procedure v40; virtual;//v40//00027CA8
    function Update:Boolean; virtual;//v44//00027CCC
    procedure Execute; dynamic;//00027CB0
    procedure RegisterChanges(Value:TBasicActionLink);//00027D50
    procedure UnRegisterChanges(Value:TBasicActionLink);//00027D5C
  end;
  TIdentMapEntry = TIdentMapEntry = record//size=8
f4:String;//f4
end;;
  TIntConst = class(TObject)
  public
    IntegerType:PTypeInfo;//f4
    IdentToInt:TIdentToInt;//f8
    IntToIdent:TIntToIdent;//fC
    constructor Create(AIntegerType:PTypeInfo; AIdentToInt:TIdentToInt; AIntToIdent:TIntToIdent);//000201E8
  end;
  TPropFixup = class(TObject)
  public
    FInstance:TPersistent;//f4
    FInstanceRoot:TComponent;//f8
    FPropInfo:PPropInfo;//fC
    FRootName:String;//f10
    FName:String;//f14
    constructor Create(Instance:TPersistent; InstanceRoot:TComponent; PropInfo:PPropInfo; const RootName:AnsiString; const Name:AnsiString);//00023690
  end;
    function Point(AX:Integer; AY:Integer):TPoint;//0001FCE4
    function SmallPoint(AX:Smallint; AY:Smallint):TSmallPoint;//0001FCEC
    function Rect(ALeft:Integer; ATop:Integer; ARight:Integer; ABottom:Integer):TRect;//0001FCFC
    function Bounds(ALeft:Integer; ATop:Integer; AWidth:Integer; AHeight:Integer):TRect;//0001FD18
    function GetFieldClassTable(AClass:TClass):PFieldClassTable;//0001FD34
    procedure ClassNotFound(const ClassName:AnsiString);//0001FD40
    function GetClass(const AClassName:AnsiString):TPersistentClass;//0001FDC4
    function FindClass(const ClassName:AnsiString):TPersistentClass;//0001FE74
    function FindFieldClass(Instance:TObject; const ClassName:AnsiString):TPersistentClass;//0001FE94
    procedure RegisterClass(AClass:TPersistentClass);//0001FF60
    procedure RegisterClasses(AClasses:array[$0..-$1] of TPersistentClass; const _Dv_:$0..-$1);//00020084
    procedure UnRegisterClass(AClass:TPersistentClass);//000200B8
    procedure UnRegisterModuleClasses(Module:HMODULE);//000200C8
    procedure RegisterIntegerConsts(IntegerType:Pointer; IdentToInt:TIdentToInt; IntToIdent:TIntToIdent);//00020220
    function IdentToInt(const Ident:AnsiString; var Int:Longint; const Map:array[$0..-$1] of TIdentMapEntry; const _Dv_:$0..-$1):Boolean;//0002024C
    function IntToIdent(Int:Longint; var Ident:AnsiString; const Map:array[$0..-$1] of TIdentMapEntry; const _Dv_:$0..-$1):Boolean;//0002028C
    function InternalReadComponentRes(const ResName:AnsiString; HInst:THandle; var Instance:TComponent):Boolean;//000202D0
    procedure BeginGlobalLoading;//00020358
    procedure NotifyGlobalLoading;//000203B8
    procedure EndGlobalLoading;//000203F0
    function InitComponent(ClassType:TClass):Boolean;//00020470
    function InitInheritedComponent(Instance:TComponent; RootAncestor:TClass):Boolean;//00020518
    procedure WriteCollection(Stream:TStream; Collection:TCollection);//000205A8
    function CollectionsEqual(C1:TCollection; C2:TCollection):Boolean;//00020600
    destructor Destroy;//00020714
    procedure Clear;//00020764
    function ReturnAddr:Pointer;//000207FC
    procedure Error(const Msg:AnsiString; Data:Integer);//00020800
    procedure Grow;//000208BC
    function Min(X:Integer; Y:Integer):Integer;//00020DF4
    destructor Destroy;//00020F60
    procedure Assign(Source:TPersistent);//00020F8C
    procedure AssignTo(Dest:TPersistent);//00021090
    procedure DefineProperties(Filer:TFiler);//00021098
    procedure GetNamePath;//0002109C
    procedure sub_0002114C;//0002114C
    constructor Create(Collection:TCollection);//00021150
    destructor Destroy;//00021188
    function GetDisplayName:AnsiString;//000211F4
    procedure GetNamePath;//0002121C
    procedure sub_0002114C;//000212D0
    procedure SetDisplayName(const Value:AnsiString);//000212FC
    procedure SetIndex(Value:Integer);//00021304
    destructor Destroy;//00021374
    procedure Assign(Source:TPersistent);//000213C4
    procedure sub_0002145C;//0002145C
    procedure EndUpdate;//000214D8
    procedure sub_00021514;//00021514
    procedure GetAttr(Index:Integer);//00021518
    procedure GetItemAttr(Index:Integer; ItemIndex:Integer);//00021524
    procedure GetNamePath;//00021560
    procedure GetDesigner(Obj:TPersistent; var Result:IDesignerNotify);//00021744
    procedure NotifyDesigner(Self:TPersistent; Item:TPersistent; Operation:TOperation);//000217DC
    procedure sub_00021904;//00021904
    procedure sub_00021908;//00021908
    destructor Destroy;//0002190C
    function Add(const S:AnsiString):Integer;//0002193C
    function AddObject(const S:AnsiString; AObject:TObject):Integer;//00021960
    procedure AddStrings(Strings:TStrings);//00021984
    procedure Assign(Source:TPersistent);//00021A3C
    function DoWrite:Boolean;//00021AC4
    procedure DefineProperties(Filer:TFiler);//00021B1C
    //function sub_00021C24:?;//00021C24
    procedure Exchange(Index1:Integer; Index2:Integer);//00021C60
    procedure sub_00021D48;//00021D48
    //function sub_00021D9C:?;//00021D9C
    function GetText:PChar;//00021DA0
    function GetTextStr:AnsiString;//00021DF4
    function IndexOf(const S:AnsiString):Integer;//00021F68
    procedure LoadFromFile(const FileName:AnsiString);//000220DC
    procedure LoadFromStream(Stream:TStream);//00022130
    procedure Move(CurIndex:Integer; NewIndex:Integer);//000221DC
    procedure Put(Index:Integer; const S:AnsiString);//0002228C
    procedure sub_000222BC;//000222BC
    procedure SaveToFile(const FileName:AnsiString);//00022370
    procedure SaveToStream(Stream:TStream);//000223C8
    procedure sub_00022424;//00022424
    procedure SetText(Text:PChar);//0002245C
    procedure SetTextStr(const Value:AnsiString);//000224AC
    procedure sub_0002256C;//0002256C
    destructor Destroy;//00022698
    function Add(const S:AnsiString):Integer;//000226F4
    procedure Changed;//0002278C
    procedure Changing;//000227A8
    procedure Clear;//000227C4
    procedure Delete(Index:Integer);//000227FC
    procedure Exchange(Index1:Integer; Index2:Integer);//0002289C
    function Find(const S:AnsiString; var Index:Integer):Boolean;//0002295C
    function Get(Index:Integer):AnsiString;//000229C4
    //function sub_00022A34:?;//00022A34
    //function GetCount:?;//00022A38
    function GetObject(Index:Integer):TObject;//00022A3C
    function IndexOf(const S:AnsiString):Integer;//00022AD8
    procedure Insert(Index:Integer; const S:AnsiString);//00022B10
    procedure Put(Index:Integer; const S:AnsiString);//00022C04
    procedure PutObject(Index:Integer; AObject:TObject);//00022CA0
    procedure SetCapacity(NewCapacity:Integer);//00022DD4
    procedure SetUpdateState(Updating:Boolean);//00022E0C
    procedure Sort;//00022E1C
    procedure sub_00022E98;//00022E98
    function Read(var Buffer:void ; Count:Longint):Longint;//00023058
    function Write(const Buffer:void ; Count:Longint):Longint;//00023068
    function Seek(Offset:Longint; Origin:Word):Longint;//00023078
    procedure SetSize(NewSize:Longint);//00023084
    destructor Destroy;//000231A0
    function Read(var Buffer:void ; Count:Longint):Longint;//000231D0
    function Seek(Offset:Longint; Origin:Word):Longint;//00023208
    destructor Destroy;//0002322C
    procedure RemoveFixups(Instance:TPersistent);//00023258
    procedure SetSize(NewSize:Longint);//00023298
    function Realloc(var NewCapacity:Longint):Pointer;//000232C4
    function Write(const Buffer:void ; Count:Longint):Longint;//00023384
    procedure Error;//0002342C
    destructor Destroy;//0002351C
    function Write(const Buffer:void ; Count:Longint):Longint;//00023554
    destructor Destroy;//000235F4
    procedure AddFinished(Instance:TPersistent);//000236E8
    procedure AddNotFinished(Instance:TPersistent);//00023720
    procedure GlobalFixupReferences;//00023768
    procedure RemoveFixupReferences(Root:TComponent; const RootName:AnsiString);//00023958
    procedure ReadError(const Ident:AnsiString);//00023A88
    procedure PropValueError;//00023AA0
    procedure PropertyNotFound;//00023AE8
    function EnumValue(EnumType:PTypeInfo; const EnumName:AnsiString):Integer;//00023B30
    destructor Destroy;//00023B48
    procedure DefineProperty(const Name:AnsiString; ReadData:TReaderProc; WriteData:TWriterProc; HasData:Boolean);//00023BA8
    procedure DefineBinaryProperty(const Name:AnsiString; ReadData:TStreamProc; WriteData:TStreamProc; HasData:Boolean);//00023BDC
    function Error(const Message:AnsiString):Boolean;//00023CCC
    function FindMethod(Root:TComponent; const MethodName:AnsiString):Pointer;//00023CEC
    procedure FlushBuffer;//00023E54
    function ComponentCreated:Boolean;//000240EC
    function Recover(var Component:TComponent):Boolean;//0002410C
    procedure CreateComponent;//0002416C
    procedure SetCompName;//000241E4
    procedure FindExistingComponent;//0002425C
    procedure ReadPrefix(var Flags:TFilerFlags; var AChildPos:Integer);//0002484C
    procedure HandleException(E:Exception);//0002488C
    procedure PropPathError;//000249AC
    procedure SetIntIdent(Instance:TPersistent; PropInfo:Pointer; const Ident:AnsiString);//00024BD4
    procedure SetObjectIdent(Instance:TPersistent; PropInfo:Pointer; const Ident:AnsiString);//00024C88
    procedure ReadVariantProp;//00024D74
    function FindUniqueName(const Name:AnsiString):AnsiString;//000251E0
    procedure SkipList;//00025724
    procedure SkipBytes(Count:Longint);//0002574C
    procedure SkipBinary;//000257A0
    procedure SkipCollection;//000257C8
    function FindAncestorComponent(const Name:AnsiString; ComponentClass:TPersistentClass):TComponent;//00025A10
    procedure ReferenceName(var Name:AnsiString);//00025AD0
    procedure SetName(Component:TComponent; var Name:AnsiString);//00025AE8
    destructor Destroy;//00025B10
    procedure DefineProperty(const Name:AnsiString; ReadData:TReaderProc; WriteData:TWriterProc; HasData:Boolean);//00025B48
    procedure DefineBinaryProperty(const Name:AnsiString; ReadData:TStreamProc; WriteData:TStreamProc; HasData:Boolean);//00025B70
    procedure FlushBuffer;//00025BAC
    function FindAncestor(const Name:AnsiString):TComponent;//00025D90
    procedure WriteData(Instance:TComponent);//00025E1C
    function AncestorValid:Boolean;//000263F8
    procedure WritePropPath;//00026444
    procedure WriteSet(Value:Longint);//00026498
    procedure WriteIntProp(IntType:PTypeInfo; Value:Longint);//0002652C
    procedure WriteCollectionProp(Collection:TCollection);//00026604
    function IsDefaultValue:Boolean;//000266A8
    procedure WriteOrdProp;//000266F8
    function IsDefaultValue:Boolean;//000267CC
    procedure WriteFloatProp;//00026824
    function IsDefault:Boolean;//00026870
    procedure WriteStrProp;//000268F4
    function IsDefault:Boolean;//00026960
    function GetComponentValue(Component:TComponent):AnsiString;//000269F0
    procedure WriteObjectProp;//00026A90
    function IsDefaultValue:Boolean;//00026CB4
    procedure WriteMethodProp;//00026D38
    function IsDefaultValue:Boolean;//00026DEC
    procedure WriteVariantProp;//00026E78
    procedure FreeThreadWindow;//00027308
    constructor Create(AOwner:TComponent);//00027324
    destructor Destroy;//00027370
    procedure Notification(AComponent:TComponent; Operation:TOperation);//000275CC
    procedure DefineProperties(Filer:TFiler);//00027638
    procedure HasParent;//000276BC
    procedure sub_000276C0;//000276C0
    procedure sub_000276C8;//000276C8
    procedure sub_000276CC;//000276CC
    procedure GetNamePath;//000276D0
    procedure sub_0002114C;//000276E4
    procedure sub_000276E8;//000276E8
    procedure GetParentComponent;//000276EC
    procedure sub_000276F0;//000276F0
    procedure Updating;//000276F4
    procedure Updated;//00027700
    procedure Loaded;//0002770C
    procedure ReadState(Reader:TReader);//00027718
    //procedure sub_00027720(?:?);//00027720
    procedure ValidateRename(AComponent:TComponent; const CurName:AnsiString; const NewName:AnsiString);//00027728
    procedure ValidateContainer(AComponent:TComponent);//000277DC
    procedure sub_000277F0;//000277F0
    procedure SetName(const NewName:TComponentName);//00027844
    procedure ExecuteAction(Action:TBasicAction);//00027A7C
    procedure UpdateAction(Action:TBasicAction);//00027AA4
    function SafeCallException(ExceptObject:TObject; ExceptAddr:Pointer):HRESULT;//00027ACC
    procedure sub_00027AE4;//00027AE4
    function QueryInterface(const IID:TGUID; var Obj:Pointer):HRESULT; stdcall;//00027AEC
    constructor Create(AClient:TObject);//00027B2C
    procedure sub_00027B70;//00027B70
    destructor Destroy;//00027B74
    procedure Change;//00027BA8
    procedure Execute;//00027BC0
    procedure SetAction(Value:TBasicAction);//00027BD0
    function IsOnExecuteLinked:Boolean;//00027BFC
    procedure sub_00027C00;//00027C00
    function Update:Boolean;//00027C08
    constructor Create(AOwner:TComponent);//00027C14
    destructor Destroy;//00027C58
    //function sub_00027CA4:?;//00027CA4
    procedure sub_00027CA8;//00027CA8
    procedure sub_00027CAC;//00027CAC
    procedure Execute;//00027CB0
    function Update:Boolean;//00027CCC
    procedure SetOnExecute(Value:TNotifyEvent);//00027CE8
    procedure Change;//00027D3C
    destructor Destroy;//00027DE4
    function Read(pv:Pointer; cb:Longint; pcbRead:PLongint):HRESULT; stdcall;//00027E1C
    function Write(pv:Pointer; cb:Longint; pcbWritten:PLongint):HRESULT; stdcall;//00027E84
    function Seek(dlibMove:Largeint; dwOrigin:Longint; var libNewPosition:Largeint):HRESULT; stdcall;//00027EEC
    function SetSize(libNewSize:Largeint):HRESULT; stdcall;//00027F64
    function CopyTo(stm:IStream; cb:Largeint; var cbRead:Largeint; var cbWritten:Largeint):HRESULT; stdcall;//00027FC8
    function Commit(grfCommitFlags:Longint):HRESULT; stdcall;//000280CC
    function Revert:HRESULT; stdcall;//000280D8
    function LockRegion(libOffset:Largeint; cb:Largeint; dwLockType:Longint):HRESULT; stdcall;//000280E4
    function UnlockRegion(libOffset:Largeint; cb:Largeint; dwLockType:Longint):HRESULT; stdcall;//000280F0
    function Stat(var statstg:TStatStg; grfStatFlag:Longint):HRESULT; stdcall;//000280FC
    function Clone(var stm:IStream):HRESULT; stdcall;//0002817C
    procedure FreeIntConstList;//00028194
    procedure ModuleUnload(Instance:Longint);//00028200

implementation

//0001FCE4
function Point(AX:Integer; AY:Integer):TPoint;
begin
{*
 0001FCE4    mov         dword ptr [ecx],eax
 0001FCE6    mov         dword ptr [ecx+4],edx
 0001FCE9    ret
*}
end;

//0001FCEC
function SmallPoint(AX:Smallint; AY:Smallint):TSmallPoint;
begin
{*
 0001FCEC    push        ecx
 0001FCED    mov         word ptr [esp],ax
 0001FCF1    mov         word ptr [esp+2],dx
 0001FCF6    mov         eax,dword ptr [esp]
 0001FCF9    pop         edx
 0001FCFA    ret
*}
end;

//0001FCFC
function Rect(ALeft:Integer; ATop:Integer; ARight:Integer; ABottom:Integer):TRect;
begin
{*
 0001FCFC    push        ebp
 0001FCFD    mov         ebp,esp
 0001FCFF    push        ebx
 0001FD00    mov         ebx,dword ptr [ebp+8]
 0001FD03    mov         dword ptr [ebx],eax
 0001FD05    mov         dword ptr [ebx+4],edx
 0001FD08    mov         dword ptr [ebx+8],ecx
 0001FD0B    mov         eax,dword ptr [ebp+0C]
 0001FD0E    mov         dword ptr [ebx+0C],eax
 0001FD11    pop         ebx
 0001FD12    pop         ebp
 0001FD13    ret         8
*}
end;

//0001FD18
function Bounds(ALeft:Integer; ATop:Integer; AWidth:Integer; AHeight:Integer):TRect;
begin
{*
 0001FD18    push        ebp
 0001FD19    mov         ebp,esp
 0001FD1B    push        ebx
 0001FD1C    mov         ebx,dword ptr [ebp+8]
 0001FD1F    mov         dword ptr [ebx],eax
 0001FD21    mov         dword ptr [ebx+4],edx
 0001FD24    add         ecx,eax
 0001FD26    mov         dword ptr [ebx+8],ecx
 0001FD29    add         edx,dword ptr [ebp+0C]
 0001FD2C    mov         dword ptr [ebx+0C],edx
 0001FD2F    pop         ebx
 0001FD30    pop         ebp
 0001FD31    ret         8
*}
end;

//0001FD34
function GetFieldClassTable(AClass:TClass):PFieldClassTable;
begin
{*
 0001FD34    mov         eax,dword ptr [eax-38]
 0001FD37    or          eax,eax
>0001FD39    je          0001FD3E
 0001FD3B    mov         eax,dword ptr [eax+2]
 0001FD3E    ret
*}
end;

//0001FD40
procedure ClassNotFound(const ClassName:AnsiString);
begin
{*
 0001FD40    push        ebp
 0001FD41    mov         ebp,esp
 0001FD43    add         esp,0FFFFFFF0
 0001FD46    push        ebx
 0001FD47    xor         edx,edx
 0001FD49    mov         dword ptr [ebp-4],edx
 0001FD4C    mov         dword ptr [ebp-8],edx
 0001FD4F    mov         ebx,eax
 0001FD51    xor         eax,eax
 0001FD53    push        ebp
 0001FD54    push        1FDB5
 0001FD59    push        dword ptr fs:[eax]
 0001FD5C    mov         dword ptr fs:[eax],esp
 0001FD5F    lea         eax,[ebp-4]
 0001FD62    push        eax
 0001FD63    lea         edx,[ebp-8]
 0001FD66    mov         eax,[000B5B3C];^SClassNotFound:TResStringRec
 0001FD6B    call        LoadResString
 0001FD70    mov         eax,dword ptr [ebp-8]
 0001FD73    push        eax
 0001FD74    mov         dword ptr [ebp-10],ebx
 0001FD77    mov         byte ptr [ebp-0C],0B
 0001FD7B    lea         edx,[ebp-10]
 0001FD7E    xor         ecx,ecx
 0001FD80    pop         eax
 0001FD81    call        Format
 0001FD86    mov         ecx,dword ptr [ebp-4]
 0001FD89    mov         dl,1
 0001FD8B    mov         eax,[0001EBE4];EClassNotFound
 0001FD90    call        Exception.Create
 0001FD95    call        @RaiseExcept
 0001FD9A    xor         eax,eax
 0001FD9C    pop         edx
 0001FD9D    pop         ecx
 0001FD9E    pop         ecx
 0001FD9F    mov         dword ptr fs:[eax],edx
 0001FDA2    push        1FDBC
 0001FDA7    lea         eax,[ebp-8]
 0001FDAA    mov         edx,2
 0001FDAF    call        @LStrArrayClr
 0001FDB4    ret
>0001FDB5    jmp         @HandleFinally
>0001FDBA    jmp         0001FDA7
 0001FDBC    pop         ebx
 0001FDBD    mov         esp,ebp
 0001FDBF    pop         ebp
 0001FDC0    ret
*}
end;

//0001FDC4
function GetClass(const AClassName:AnsiString):TPersistentClass;
begin
{*
 0001FDC4    push        ebp
 0001FDC5    mov         ebp,esp
 0001FDC7    add         esp,0FFFFFFF8
 0001FDCA    push        ebx
 0001FDCB    push        esi
 0001FDCC    push        edi
 0001FDCD    mov         dword ptr [ebp-4],eax
 0001FDD0    mov         eax,[000B6620]
 0001FDD5    call        TThreadList.LockList
 0001FDDA    mov         edi,eax
 0001FDDC    xor         eax,eax
 0001FDDE    push        ebp
 0001FDDF    push        1FE61
 0001FDE4    push        dword ptr fs:[eax]
 0001FDE7    mov         dword ptr fs:[eax],esp
 0001FDEA    mov         esi,dword ptr [edi+8]
 0001FDED    dec         esi
 0001FDEE    test        esi,esi
>0001FDF0    jl          0001FE1B
 0001FDF2    inc         esi
 0001FDF3    xor         ebx,ebx
 0001FDF5    mov         edx,ebx
 0001FDF7    mov         eax,edi
 0001FDF9    call        TList.Get
 0001FDFE    mov         dword ptr [ebp-8],eax
 0001FE01    mov         edx,dword ptr [ebp-4]
 0001FE04    mov         eax,dword ptr [ebp-8]
 0001FE07    call        TObject.ClassNameIs
 0001FE0C    test        al,al
>0001FE0E    je          0001FE17
 0001FE10    call        @TryFinallyExit
>0001FE15    jmp         0001FE68
 0001FE17    inc         ebx
 0001FE18    dec         esi
>0001FE19    jne         0001FDF5
 0001FE1B    mov         edx,dword ptr [ebp-4]
 0001FE1E    mov         eax,[000B6624]
 0001FE23    mov         ecx,dword ptr [eax]
 0001FE25    call        dword ptr [ecx+50]
 0001FE28    mov         ebx,eax
 0001FE2A    test        ebx,ebx
>0001FE2C    jl          0001FE44
 0001FE2E    mov         edx,ebx
 0001FE30    mov         eax,[000B6624]
 0001FE35    mov         ecx,dword ptr [eax]
 0001FE37    call        dword ptr [ecx+18]
 0001FE3A    mov         dword ptr [ebp-8],eax
 0001FE3D    call        @TryFinallyExit
>0001FE42    jmp         0001FE68
 0001FE44    xor         eax,eax
 0001FE46    mov         dword ptr [ebp-8],eax
 0001FE49    xor         eax,eax
 0001FE4B    pop         edx
 0001FE4C    pop         ecx
 0001FE4D    pop         ecx
 0001FE4E    mov         dword ptr fs:[eax],edx
 0001FE51    push        1FE68
 0001FE56    mov         eax,[000B6620]
 0001FE5B    call        TThreadList.UnlockList
 0001FE60    ret
>0001FE61    jmp         @HandleFinally
>0001FE66    jmp         0001FE56
 0001FE68    mov         eax,dword ptr [ebp-8]
 0001FE6B    pop         edi
 0001FE6C    pop         esi
 0001FE6D    pop         ebx
 0001FE6E    pop         ecx
 0001FE6F    pop         ecx
 0001FE70    pop         ebp
 0001FE71    ret
*}
end;

//0001FE74
function FindClass(const ClassName:AnsiString):TPersistentClass;
begin
{*
 0001FE74    push        ebx
 0001FE75    push        esi
 0001FE76    mov         esi,eax
 0001FE78    mov         eax,esi
 0001FE7A    call        GetClass
 0001FE7F    mov         ebx,eax
 0001FE81    test        ebx,ebx
>0001FE83    jne         0001FE8C
 0001FE85    mov         eax,esi
 0001FE87    call        ClassNotFound
 0001FE8C    mov         eax,ebx
 0001FE8E    pop         esi
 0001FE8F    pop         ebx
 0001FE90    ret
*}
end;

//0001FE94
function FindFieldClass(Instance:TObject; const ClassName:AnsiString):TPersistentClass;
begin
{*
 0001FE94    push        ebp
 0001FE95    mov         ebp,esp
 0001FE97    add         esp,0FFFFFEF0
 0001FE9D    push        ebx
 0001FE9E    push        esi
 0001FE9F    push        edi
 0001FEA0    xor         ecx,ecx
 0001FEA2    mov         dword ptr [ebp-10],ecx
 0001FEA5    mov         dword ptr [ebp-4],edx
 0001FEA8    xor         edx,edx
 0001FEAA    push        ebp
 0001FEAB    push        1FF4D
 0001FEB0    push        dword ptr fs:[edx]
 0001FEB3    mov         dword ptr fs:[edx],esp
 0001FEB6    call        TObject.ClassType
 0001FEBB    mov         dword ptr [ebp-0C],eax
>0001FEBE    jmp         0001FF22
 0001FEC0    mov         eax,dword ptr [ebp-0C]
 0001FEC3    call        GetFieldClassTable
 0001FEC8    mov         esi,eax
 0001FECA    test        esi,esi
>0001FECC    je          0001FF17
 0001FECE    movsx       ebx,word ptr [esi]
 0001FED1    dec         ebx
 0001FED2    test        ebx,ebx
>0001FED4    jl          0001FF17
 0001FED6    inc         ebx
 0001FED7    mov         dword ptr [ebp-8],0
 0001FEDE    mov         eax,dword ptr [ebp-8]
 0001FEE1    mov         eax,dword ptr [esi+eax*4+2]
 0001FEE5    mov         edi,dword ptr [eax]
 0001FEE7    lea         edx,[ebp-110]
 0001FEED    mov         eax,edi
 0001FEEF    call        TObject.ClassName
 0001FEF4    lea         edx,[ebp-110]
 0001FEFA    lea         eax,[ebp-10]
 0001FEFD    call        @LStrFromString
 0001FF02    mov         eax,dword ptr [ebp-10]
 0001FF05    mov         edx,dword ptr [ebp-4]
 0001FF08    call        CompareText
 0001FF0D    test        eax,eax
>0001FF0F    je          0001FF37
 0001FF11    inc         dword ptr [ebp-8]
 0001FF14    dec         ebx
>0001FF15    jne         0001FEDE
 0001FF17    mov         eax,dword ptr [ebp-0C]
 0001FF1A    call        TObject.ClassParent
 0001FF1F    mov         dword ptr [ebp-0C],eax
 0001FF22    mov         eax,dword ptr [ebp-0C]
 0001FF25    cmp         eax,dword ptr ds:[1EFD4];TPersistent
>0001FF2B    jne         0001FEC0
 0001FF2D    mov         eax,dword ptr [ebp-4]
 0001FF30    call        FindClass
 0001FF35    mov         edi,eax
 0001FF37    xor         eax,eax
 0001FF39    pop         edx
 0001FF3A    pop         ecx
 0001FF3B    pop         ecx
 0001FF3C    mov         dword ptr fs:[eax],edx
 0001FF3F    push        1FF54
 0001FF44    lea         eax,[ebp-10]
 0001FF47    call        @LStrClr
 0001FF4C    ret
>0001FF4D    jmp         @HandleFinally
>0001FF52    jmp         0001FF44
 0001FF54    mov         eax,edi
 0001FF56    pop         edi
 0001FF57    pop         esi
 0001FF58    pop         ebx
 0001FF59    mov         esp,ebp
 0001FF5B    pop         ebp
 0001FF5C    ret
*}
end;

//0001FF60
procedure RegisterClass(AClass:TPersistentClass);
begin
{*
 0001FF60    push        ebp
 0001FF61    mov         ebp,esp
 0001FF63    add         esp,0FFFFFEF0
 0001FF69    push        ebx
 0001FF6A    push        esi
 0001FF6B    xor         edx,edx
 0001FF6D    mov         dword ptr [ebp-110],edx
 0001FF73    mov         dword ptr [ebp-4],edx
 0001FF76    mov         ebx,eax
 0001FF78    xor         eax,eax
 0001FF7A    push        ebp
 0001FF7B    push        20076
 0001FF80    push        dword ptr fs:[eax]
 0001FF83    mov         dword ptr fs:[eax],esp
 0001FF86    mov         eax,[000B6620]
 0001FF8B    call        TThreadList.LockList
 0001FF90    mov         esi,eax
 0001FF92    xor         eax,eax
 0001FF94    push        ebp
 0001FF95    push        2004E
 0001FF9A    push        dword ptr fs:[eax]
 0001FF9D    mov         dword ptr fs:[eax],esp
>0001FFA0    jmp         00020026
 0001FFA5    lea         edx,[ebp-104]
 0001FFAB    mov         eax,ebx
 0001FFAD    call        TObject.ClassName
 0001FFB2    lea         edx,[ebp-104]
 0001FFB8    lea         eax,[ebp-4]
 0001FFBB    call        @LStrFromString
 0001FFC0    mov         eax,dword ptr [ebp-4]
 0001FFC3    call        GetClass
 0001FFC8    test        eax,eax
>0001FFCA    je          0002000C
 0001FFCC    mov         eax,dword ptr [ebp-4]
 0001FFCF    mov         dword ptr [ebp-10C],eax
 0001FFD5    mov         byte ptr [ebp-108],0B
 0001FFDC    lea         eax,[ebp-10C]
 0001FFE2    push        eax
 0001FFE3    push        0
 0001FFE5    lea         edx,[ebp-110]
 0001FFEB    mov         eax,[000B5A24];^SDuplicateClass:TResStringRec
 0001FFF0    call        LoadResString
 0001FFF5    mov         ecx,dword ptr [ebp-110]
 0001FFFB    mov         dl,1
 0001FFFD    mov         eax,[0001EADC];EFilerError
 00020002    call        Exception.CreateFmt
 00020007    call        @RaiseExcept
 0002000C    mov         edx,ebx
 0002000E    mov         eax,esi
 00020010    call        TList.Add
 00020015    cmp         ebx,dword ptr ds:[1EFD4];TPersistent
>0002001B    je          00020036
 0002001D    mov         eax,ebx
 0002001F    call        TObject.ClassParent
 00020024    mov         ebx,eax
 00020026    mov         edx,ebx
 00020028    mov         eax,esi
 0002002A    call        TList.IndexOf
 0002002F    inc         eax
>00020030    je          0001FFA5
 00020036    xor         eax,eax
 00020038    pop         edx
 00020039    pop         ecx
 0002003A    pop         ecx
 0002003B    mov         dword ptr fs:[eax],edx
 0002003E    push        20055
 00020043    mov         eax,[000B6620]
 00020048    call        TThreadList.UnlockList
 0002004D    ret
>0002004E    jmp         @HandleFinally
>00020053    jmp         00020043
 00020055    xor         eax,eax
 00020057    pop         edx
 00020058    pop         ecx
 00020059    pop         ecx
 0002005A    mov         dword ptr fs:[eax],edx
 0002005D    push        2007D
 00020062    lea         eax,[ebp-110]
 00020068    call        @LStrClr
 0002006D    lea         eax,[ebp-4]
 00020070    call        @LStrClr
 00020075    ret
>00020076    jmp         @HandleFinally
>0002007B    jmp         00020062
 0002007D    pop         esi
 0002007E    pop         ebx
 0002007F    mov         esp,ebp
 00020081    pop         ebp
 00020082    ret
*}
end;

//00020084
procedure RegisterClasses(AClasses:array[$0..-$1] of TPersistentClass; const _Dv_:$0..-$1);
begin
{*
 00020084    push        ebp
 00020085    mov         ebp,esp
 00020087    push        ebx
 00020088    push        esi
 00020089    mov         ecx,edx
 0002008B    test        ecx,ecx
>0002008D    js          00020096
 0002008F    mov         ebx,dword ptr [eax+ecx*4]
 00020092    dec         ecx
 00020093    push        ebx
>00020094    jns         0002008F
 00020096    mov         eax,esp
 00020098    mov         esi,edx
 0002009A    test        esi,esi
>0002009C    jl          000200AE
 0002009E    inc         esi
 0002009F    mov         ebx,eax
 000200A1    mov         eax,dword ptr [ebx]
 000200A3    call        RegisterClass
 000200A8    add         ebx,4
 000200AB    dec         esi
>000200AC    jne         000200A1
 000200AE    mov         esi,dword ptr [ebp-8]
 000200B1    mov         ebx,dword ptr [ebp-4]
 000200B4    mov         esp,ebp
 000200B6    pop         ebp
 000200B7    ret
*}
end;

//000200B8
procedure UnRegisterClass(AClass:TPersistentClass);
begin
{*
 000200B8    mov         edx,eax
 000200BA    mov         eax,[000B6620]
 000200BF    call        TThreadList.Remove
 000200C4    ret
*}
end;

//000200C8
procedure UnRegisterModuleClasses(Module:HMODULE);
begin
{*
 000200C8    push        ebp
 000200C9    mov         ebp,esp
 000200CB    add         esp,0FFFFFFE4
 000200CE    push        ebx
 000200CF    push        esi
 000200D0    push        edi
 000200D1    mov         esi,eax
 000200D3    mov         eax,[000B6620]
 000200D8    call        TThreadList.LockList
 000200DD    mov         edi,eax
 000200DF    xor         eax,eax
 000200E1    push        ebp
 000200E2    push        20180
 000200E7    push        dword ptr fs:[eax]
 000200EA    mov         dword ptr fs:[eax],esp
 000200ED    mov         ebx,dword ptr [edi+8]
 000200F0    dec         ebx
 000200F1    cmp         ebx,0
>000200F4    jl          00020123
 000200F6    push        1C
 000200F8    lea         eax,[ebp-1C]
 000200FB    push        eax
 000200FC    mov         edx,ebx
 000200FE    mov         eax,edi
 00020100    call        TList.Get
 00020105    push        eax
 00020106    call        kernel32.VirtualQuery
 0002010B    test        esi,esi
>0002010D    je          00020114
 0002010F    cmp         esi,dword ptr [ebp-18]
>00020112    jne         0002011D
 00020114    mov         edx,ebx
 00020116    mov         eax,edi
 00020118    call        TList.Delete
 0002011D    dec         ebx
 0002011E    cmp         ebx,0FFFFFFFF
>00020121    jne         000200F6
 00020123    mov         eax,[000B6624]
 00020128    mov         edx,dword ptr [eax]
 0002012A    call        dword ptr [edx+14]
 0002012D    mov         ebx,eax
 0002012F    dec         ebx
 00020130    cmp         ebx,0
>00020133    jl          00020168
 00020135    push        1C
 00020137    lea         eax,[ebp-1C]
 0002013A    push        eax
 0002013B    mov         edx,ebx
 0002013D    mov         eax,[000B6624]
 00020142    mov         ecx,dword ptr [eax]
 00020144    call        dword ptr [ecx+18]
 00020147    push        eax
 00020148    call        kernel32.VirtualQuery
 0002014D    test        esi,esi
>0002014F    je          00020156
 00020151    cmp         esi,dword ptr [ebp-18]
>00020154    jne         00020162
 00020156    mov         edx,ebx
 00020158    mov         eax,[000B6624]
 0002015D    mov         ecx,dword ptr [eax]
 0002015F    call        dword ptr [ecx+44]
 00020162    dec         ebx
 00020163    cmp         ebx,0FFFFFFFF
>00020166    jne         00020135
 00020168    xor         eax,eax
 0002016A    pop         edx
 0002016B    pop         ecx
 0002016C    pop         ecx
 0002016D    mov         dword ptr fs:[eax],edx
 00020170    push        20187
 00020175    mov         eax,[000B6620]
 0002017A    call        TThreadList.UnlockList
 0002017F    ret
>00020180    jmp         @HandleFinally
>00020185    jmp         00020175
 00020187    pop         edi
 00020188    pop         esi
 00020189    pop         ebx
 0002018A    mov         esp,ebp
 0002018C    pop         ebp
 0002018D    ret
*}
end;

//000201E8
constructor TIntConst.Create(AIntegerType:PTypeInfo; AIdentToInt:TIdentToInt; AIntToIdent:TIntToIdent);
begin
{*
 000201E8    push        ebp
 000201E9    mov         ebp,esp
 000201EB    test        dl,dl
>000201ED    je          000201F7
 000201EF    add         esp,0FFFFFFF0
 000201F2    call        @ClassCreate
 000201F7    mov         dword ptr [eax+4],ecx
 000201FA    mov         ecx,dword ptr [ebp+0C]
 000201FD    mov         dword ptr [eax+8],ecx
 00020200    mov         ecx,dword ptr [ebp+8]
 00020203    mov         dword ptr [eax+0C],ecx
 00020206    test        dl,dl
>00020208    je          00020219
 0002020A    call        @AfterConstruction
 0002020F    pop         dword ptr fs:[0]
 00020216    add         esp,0C
 00020219    pop         ebp
 0002021A    ret         8
*}
end;

//00020220
procedure RegisterIntegerConsts(IntegerType:Pointer; IdentToInt:TIdentToInt; IntToIdent:TIntToIdent);
begin
{*
 00020220    push        ebx
 00020221    push        esi
 00020222    push        edi
 00020223    mov         edi,ecx
 00020225    mov         esi,edx
 00020227    mov         ebx,eax
 00020229    push        esi
 0002022A    push        edi
 0002022B    mov         ecx,ebx
 0002022D    mov         dl,1
 0002022F    mov         eax,[00020190];TIntConst
 00020234    call        TIntConst.Create
 00020239    mov         edx,eax
 0002023B    mov         eax,[000B6628]
 00020240    call        TThreadList.Add
 00020245    pop         edi
 00020246    pop         esi
 00020247    pop         ebx
 00020248    ret
*}
end;

//0002024C
function IdentToInt(const Ident:AnsiString; var Int:Longint; const Map:array[$0..-$1] of TIdentMapEntry; const _Dv_:$0..-$1):Boolean;
begin
{*
 0002024C    push        ebp
 0002024D    mov         ebp,esp
 0002024F    push        ecx
 00020250    push        ebx
 00020251    push        esi
 00020252    push        edi
 00020253    mov         dword ptr [ebp-4],edx
 00020256    mov         edi,eax
 00020258    mov         esi,dword ptr [ebp+8]
 0002025B    test        esi,esi
>0002025D    jl          00020282
 0002025F    inc         esi
 00020260    lea         ebx,[ecx+4]
 00020263    mov         edx,edi
 00020265    mov         eax,dword ptr [ebx]
 00020267    call        CompareText
 0002026C    test        eax,eax
>0002026E    jne         0002027C
 00020270    mov         al,1
 00020272    mov         edx,dword ptr [ebp-4]
 00020275    mov         ecx,dword ptr [ebx-4]
 00020278    mov         dword ptr [edx],ecx
>0002027A    jmp         00020284
 0002027C    add         ebx,8
 0002027F    dec         esi
>00020280    jne         00020263
 00020282    xor         eax,eax
 00020284    pop         edi
 00020285    pop         esi
 00020286    pop         ebx
 00020287    pop         ecx
 00020288    pop         ebp
 00020289    ret         4
*}
end;

//0002028C
function IntToIdent(Int:Longint; var Ident:AnsiString; const Map:array[$0..-$1] of TIdentMapEntry; const _Dv_:$0..-$1):Boolean;
begin
{*
 0002028C    push        ebp
 0002028D    mov         ebp,esp
 0002028F    add         esp,0FFFFFFF8
 00020292    push        ebx
 00020293    push        esi
 00020294    push        edi
 00020295    mov         dword ptr [ebp-4],ecx
 00020298    mov         edi,edx
 0002029A    mov         esi,dword ptr [ebp+8]
 0002029D    test        esi,esi
>0002029F    jl          000202BF
 000202A1    inc         esi
 000202A2    mov         ebx,dword ptr [ebp-4]
 000202A5    cmp         eax,dword ptr [ebx]
>000202A7    jne         000202B9
 000202A9    mov         byte ptr [ebp-5],1
 000202AD    mov         eax,edi
 000202AF    mov         edx,dword ptr [ebx+4]
 000202B2    call        @LStrAsg
>000202B7    jmp         000202C3
 000202B9    add         ebx,8
 000202BC    dec         esi
>000202BD    jne         000202A5
 000202BF    mov         byte ptr [ebp-5],0
 000202C3    mov         al,byte ptr [ebp-5]
 000202C6    pop         edi
 000202C7    pop         esi
 000202C8    pop         ebx
 000202C9    pop         ecx
 000202CA    pop         ecx
 000202CB    pop         ebp
 000202CC    ret         4
*}
end;

//000202D0
function InternalReadComponentRes(const ResName:AnsiString; HInst:THandle; var Instance:TComponent):Boolean;
begin
{*
 000202D0    push        ebp
 000202D1    mov         ebp,esp
 000202D3    push        ecx
 000202D4    push        ebx
 000202D5    push        esi
 000202D6    push        edi
 000202D7    mov         esi,ecx
 000202D9    mov         ebx,edx
 000202DB    mov         edi,eax
 000202DD    test        ebx,ebx
>000202DF    jne         000202E9
 000202E1    mov         ebx,dword ptr ds:[0B5950];^HInstance:Longword
 000202E7    mov         ebx,dword ptr [ebx]
 000202E9    push        0A
 000202EB    mov         eax,edi
 000202ED    call        @LStrToPChar
 000202F2    push        eax
 000202F3    push        ebx
 000202F4    call        kernel32.FindResourceA
 000202F9    test        eax,eax
 000202FB    setne       al
 000202FE    test        al,al
>00020300    je          0002034F
 00020302    push        edi
 00020303    push        0A
 00020305    mov         ecx,ebx
 00020307    mov         dl,1
 00020309    mov         eax,[0001F658];TResourceStream
 0002030E    call        TResourceStream.Create
 00020313    mov         dword ptr [ebp-4],eax
 00020316    xor         eax,eax
 00020318    push        ebp
 00020319    push        20346
 0002031E    push        dword ptr fs:[eax]
 00020321    mov         dword ptr fs:[eax],esp
 00020324    mov         edx,dword ptr [esi]
 00020326    mov         eax,dword ptr [ebp-4]
 00020329    call        TStream.ReadComponent
 0002032E    mov         dword ptr [esi],eax
 00020330    xor         eax,eax
 00020332    pop         edx
 00020333    pop         ecx
 00020334    pop         ecx
 00020335    mov         dword ptr fs:[eax],edx
 00020338    push        2034D
 0002033D    mov         eax,dword ptr [ebp-4]
 00020340    call        TObject.Free
 00020345    ret
>00020346    jmp         @HandleFinally
>0002034B    jmp         0002033D
 0002034D    mov         al,1
 0002034F    pop         edi
 00020350    pop         esi
 00020351    pop         ebx
 00020352    pop         ecx
 00020353    pop         ebp
 00020354    ret
*}
end;

//00020358
procedure BeginGlobalLoading;
begin
{*
 00020358    push        ebx
 00020359    call        @GetTls
 0002035E    cmp         dword ptr [eax+0C],0;{GlobalLists:TList}
>00020365    jne         00020380
 00020367    mov         dl,1
 00020369    mov         eax,[0001EEC4];TList
 0002036E    call        TObject.Create
 00020373    mov         ebx,eax
 00020375    call        @GetTls
 0002037A    mov         dword ptr [eax+0C],ebx;{GlobalLists:TList}
 00020380    call        @GetTls
 00020385    mov         eax,dword ptr [eax+8];{GlobalLoaded:TList}
 0002038B    push        eax
 0002038C    call        @GetTls
 00020391    mov         eax,dword ptr [eax+0C];{GlobalLists:TList}
 00020397    pop         edx
 00020398    call        TList.Add
 0002039D    mov         dl,1
 0002039F    mov         eax,[0001EEC4];TList
 000203A4    call        TObject.Create
 000203A9    mov         ebx,eax
 000203AB    call        @GetTls
 000203B0    mov         dword ptr [eax+8],ebx;{GlobalLoaded:TList}
 000203B6    pop         ebx
 000203B7    ret
*}
end;

//000203B8
procedure NotifyGlobalLoading;
begin
{*
 000203B8    push        ebx
 000203B9    push        esi
 000203BA    call        @GetTls
 000203BF    mov         eax,dword ptr [eax+8];{GlobalLoaded:TList}
 000203C5    mov         ebx,dword ptr [eax+8]
 000203C8    dec         ebx
 000203C9    test        ebx,ebx
>000203CB    jl          000203EB
 000203CD    inc         ebx
 000203CE    xor         esi,esi
 000203D0    call        @GetTls
 000203D5    mov         eax,dword ptr [eax+8];{GlobalLoaded:TList}
 000203DB    mov         edx,esi
 000203DD    call        TList.Get
 000203E2    mov         edx,dword ptr [eax]
 000203E4    call        dword ptr [edx+0C]
 000203E7    inc         esi
 000203E8    dec         ebx
>000203E9    jne         000203D0
 000203EB    pop         esi
 000203EC    pop         ebx
 000203ED    ret
*}
end;

//000203F0
procedure EndGlobalLoading;
begin
{*
 000203F0    push        ebx
 000203F1    call        @GetTls
 000203F6    mov         eax,dword ptr [eax+8];{GlobalLoaded:TList}
 000203FC    call        TObject.Free
 00020401    call        @GetTls
 00020406    mov         eax,dword ptr [eax+0C];{GlobalLists:TList}
 0002040C    call        TList.Last
 00020411    mov         ebx,eax
 00020413    call        @GetTls
 00020418    mov         dword ptr [eax+8],ebx;{GlobalLoaded:TList}
 0002041E    call        @GetTls
 00020423    mov         eax,dword ptr [eax+0C];{GlobalLists:TList}
 00020429    mov         eax,dword ptr [eax+8]
 0002042C    dec         eax
 0002042D    push        eax
 0002042E    call        @GetTls
 00020433    mov         eax,dword ptr [eax+0C];{GlobalLists:TList}
 00020439    pop         edx
 0002043A    call        TList.Delete
 0002043F    call        @GetTls
 00020444    mov         eax,dword ptr [eax+0C];{GlobalLists:TList}
 0002044A    cmp         dword ptr [eax+8],0
>0002044E    jne         0002046D
 00020450    call        @GetTls
 00020455    mov         eax,dword ptr [eax+0C];{GlobalLists:TList}
 0002045B    call        TObject.Free
 00020460    call        @GetTls
 00020465    xor         edx,edx
 00020467    mov         dword ptr [eax+0C],edx;{GlobalLists:TList}
 0002046D    pop         ebx
 0002046E    ret
*}
end;

//00020470
function InitComponent(ClassType:TClass):Boolean;
begin
{*
 00020470    push        ebp
 00020471    mov         ebp,esp
 00020473    add         esp,0FFFFFEFC
 00020479    push        ebx
 0002047A    push        esi
 0002047B    xor         edx,edx
 0002047D    mov         dword ptr [ebp-4],edx
 00020480    mov         esi,eax
 00020482    xor         eax,eax
 00020484    push        ebp
 00020485    push        20506
 0002048A    push        dword ptr fs:[eax]
 0002048D    mov         dword ptr fs:[eax],esp
 00020490    xor         ebx,ebx
 00020492    cmp         esi,dword ptr ds:[1FA0C];TComponent
>00020498    je          000204F0
 0002049A    mov         eax,dword ptr [ebp+8]
 0002049D    cmp         esi,dword ptr [eax-8]
>000204A0    je          000204F0
 000204A2    mov         eax,dword ptr [ebp+8]
 000204A5    push        eax
 000204A6    mov         eax,esi
 000204A8    call        TObject.ClassParent
 000204AD    call        InitComponent
 000204B2    pop         ecx
 000204B3    mov         ebx,eax
 000204B5    lea         edx,[ebp-104]
 000204BB    mov         eax,esi
 000204BD    call        TObject.ClassName
 000204C2    lea         edx,[ebp-104]
 000204C8    lea         eax,[ebp-4]
 000204CB    call        @LStrFromString
 000204D0    mov         eax,dword ptr [ebp-4]
 000204D3    push        eax
 000204D4    mov         eax,esi
 000204D6    call        FindClassHInstance
 000204DB    call        FindResourceHInstance
 000204E0    mov         edx,eax
 000204E2    mov         eax,dword ptr [ebp+8]
 000204E5    lea         ecx,[eax-4]
 000204E8    pop         eax
 000204E9    call        InternalReadComponentRes
 000204EE    or          bl,al
 000204F0    xor         eax,eax
 000204F2    pop         edx
 000204F3    pop         ecx
 000204F4    pop         ecx
 000204F5    mov         dword ptr fs:[eax],edx
 000204F8    push        2050D
 000204FD    lea         eax,[ebp-4]
 00020500    call        @LStrClr
 00020505    ret
>00020506    jmp         @HandleFinally
>0002050B    jmp         000204FD
 0002050D    mov         eax,ebx
 0002050F    pop         esi
 00020510    pop         ebx
 00020511    mov         esp,ebp
 00020513    pop         ebp
 00020514    ret
*}
end;

//00020518
function InitInheritedComponent(Instance:TComponent; RootAncestor:TClass):Boolean;
begin
{*
 00020518    push        ebp
 00020519    mov         ebp,esp
 0002051B    add         esp,0FFFFFFF4
 0002051E    mov         dword ptr [ebp-8],edx
 00020521    mov         dword ptr [ebp-4],eax
 00020524    mov         eax,[000B6614]
 00020529    call        TMultiReadExclusiveWriteSynchronizer.BeginWrite
 0002052E    xor         eax,eax
 00020530    push        ebp
 00020531    push        20598
 00020536    push        dword ptr fs:[eax]
 00020539    mov         dword ptr fs:[eax],esp
 0002053C    call        BeginGlobalLoading
 00020541    xor         eax,eax
 00020543    push        ebp
 00020544    push        20579
 00020549    push        dword ptr fs:[eax]
 0002054C    mov         dword ptr fs:[eax],esp
 0002054F    push        ebp
 00020550    mov         eax,dword ptr [ebp-4]
 00020553    call        TObject.ClassType
 00020558    call        InitComponent
 0002055D    pop         ecx
 0002055E    mov         byte ptr [ebp-9],al
 00020561    call        NotifyGlobalLoading
 00020566    xor         eax,eax
 00020568    pop         edx
 00020569    pop         ecx
 0002056A    pop         ecx
 0002056B    mov         dword ptr fs:[eax],edx
 0002056E    push        20580
 00020573    call        EndGlobalLoading
 00020578    ret
>00020579    jmp         @HandleFinally
>0002057E    jmp         00020573
 00020580    xor         eax,eax
 00020582    pop         edx
 00020583    pop         ecx
 00020584    pop         ecx
 00020585    mov         dword ptr fs:[eax],edx
 00020588    push        2059F
 0002058D    mov         eax,[000B6614]
 00020592    call        TMultiReadExclusiveWriteSynchronizer.EndWrite
 00020597    ret
>00020598    jmp         @HandleFinally
>0002059D    jmp         0002058D
 0002059F    mov         al,byte ptr [ebp-9]
 000205A2    mov         esp,ebp
 000205A4    pop         ebp
 000205A5    ret
*}
end;

//000205A8
procedure WriteCollection(Stream:TStream; Collection:TCollection);
begin
{*
 000205A8    push        ebp
 000205A9    mov         ebp,esp
 000205AB    push        ecx
 000205AC    push        ebx
 000205AD    mov         ebx,edx
 000205AF    push        400
 000205B4    mov         ecx,eax
 000205B6    mov         dl,1
 000205B8    mov         eax,[0001F94C];TWriter
 000205BD    call        TFiler.Create
 000205C2    mov         dword ptr [ebp-4],eax
 000205C5    xor         eax,eax
 000205C7    push        ebp
 000205C8    push        205F3
 000205CD    push        dword ptr fs:[eax]
 000205D0    mov         dword ptr fs:[eax],esp
 000205D3    mov         edx,ebx
 000205D5    mov         eax,dword ptr [ebp-4]
 000205D8    call        TWriter.WriteCollection
 000205DD    xor         eax,eax
 000205DF    pop         edx
 000205E0    pop         ecx
 000205E1    pop         ecx
 000205E2    mov         dword ptr fs:[eax],edx
 000205E5    push        205FA
 000205EA    mov         eax,dword ptr [ebp-4]
 000205ED    call        TObject.Free
 000205F2    ret
>000205F3    jmp         @HandleFinally
>000205F8    jmp         000205EA
 000205FA    pop         ebx
 000205FB    pop         ecx
 000205FC    pop         ebp
 000205FD    ret
*}
end;

//00020600
function CollectionsEqual(C1:TCollection; C2:TCollection):Boolean;
begin
{*
 00020600    push        ebp
 00020601    mov         ebp,esp
 00020603    add         esp,0FFFFFFF4
 00020606    push        ebx
 00020607    push        esi
 00020608    push        edi
 00020609    mov         esi,edx
 0002060B    mov         ebx,eax
 0002060D    mov         byte ptr [ebp-1],0
 00020611    mov         eax,ebx
 00020613    call        TObject.ClassType
 00020618    mov         edi,eax
 0002061A    mov         eax,esi
 0002061C    call        TObject.ClassType
 00020621    cmp         edi,eax
>00020623    jne         00020707
 00020629    mov         eax,ebx
 0002062B    call        TCollection.GetCount
 00020630    mov         edi,eax
 00020632    mov         eax,esi
 00020634    call        TCollection.GetCount
 00020639    cmp         edi,eax
>0002063B    jne         00020707
 00020641    mov         dl,1
 00020643    mov         eax,[0001F5E8];TMemoryStream
 00020648    call        TObject.Create
 0002064D    mov         dword ptr [ebp-8],eax
 00020650    xor         eax,eax
 00020652    push        ebp
 00020653    push        20700
 00020658    push        dword ptr fs:[eax]
 0002065B    mov         dword ptr fs:[eax],esp
 0002065E    mov         edx,ebx
 00020660    mov         eax,dword ptr [ebp-8]
 00020663    call        WriteCollection
 00020668    mov         dl,1
 0002066A    mov         eax,[0001F5E8];TMemoryStream
 0002066F    call        TObject.Create
 00020674    mov         dword ptr [ebp-0C],eax
 00020677    xor         eax,eax
 00020679    push        ebp
 0002067A    push        206E3
 0002067F    push        dword ptr fs:[eax]
 00020682    mov         dword ptr fs:[eax],esp
 00020685    mov         edx,esi
 00020687    mov         eax,dword ptr [ebp-0C]
 0002068A    call        WriteCollection
 0002068F    mov         eax,dword ptr [ebp-8]
 00020692    call        TStream.GetSize
 00020697    mov         ebx,eax
 00020699    mov         eax,dword ptr [ebp-0C]
 0002069C    call        TStream.GetSize
 000206A1    cmp         ebx,eax
>000206A3    jne         000206C4
 000206A5    mov         eax,dword ptr [ebp-8]
 000206A8    call        TStream.GetSize
 000206AD    mov         ecx,eax
 000206AF    mov         eax,dword ptr [ebp-0C]
 000206B2    mov         edx,dword ptr [eax+4]
 000206B5    mov         eax,dword ptr [ebp-8]
 000206B8    mov         eax,dword ptr [eax+4]
 000206BB    call        CompareMem
 000206C0    test        al,al
>000206C2    jne         000206C8
 000206C4    xor         eax,eax
>000206C6    jmp         000206CA
 000206C8    mov         al,1
 000206CA    mov         byte ptr [ebp-1],al
 000206CD    xor         eax,eax
 000206CF    pop         edx
 000206D0    pop         ecx
 000206D1    pop         ecx
 000206D2    mov         dword ptr fs:[eax],edx
 000206D5    push        206EA
 000206DA    mov         eax,dword ptr [ebp-0C]
 000206DD    call        TObject.Free
 000206E2    ret
>000206E3    jmp         @HandleFinally
>000206E8    jmp         000206DA
 000206EA    xor         eax,eax
 000206EC    pop         edx
 000206ED    pop         ecx
 000206EE    pop         ecx
 000206EF    mov         dword ptr fs:[eax],edx
 000206F2    push        20707
 000206F7    mov         eax,dword ptr [ebp-8]
 000206FA    call        TObject.Free
 000206FF    ret
>00020700    jmp         @HandleFinally
>00020705    jmp         000206F7
 00020707    mov         al,byte ptr [ebp-1]
 0002070A    pop         edi
 0002070B    pop         esi
 0002070C    pop         ebx
 0002070D    mov         esp,ebp
 0002070F    pop         ebp
 00020710    ret
*}
end;

//00020714
destructor TList.Destroy;
begin
{*
 00020714    push        ebx
 00020715    push        esi
 00020716    push        ecx
 00020717    call        @BeforeDestruction
 0002071C    mov         byte ptr [esp],dl
 0002071F    mov         esi,eax
 00020721    mov         eax,esi
 00020723    mov         bx,0FFFF
 00020727    call        @CallDynaInst
 0002072C    cmp         byte ptr [esp],0
>00020730    jle         00020739
 00020732    mov         eax,esi
 00020734    call        @ClassDestroy
 00020739    pop         edx
 0002073A    pop         esi
 0002073B    pop         ebx
 0002073C    ret
*}
end;

//00020740
function TList.Add(Item:Pointer):Integer;
begin
{*
 00020740    push        ebx
 00020741    push        esi
 00020742    push        edi
 00020743    mov         edi,edx
 00020745    mov         ebx,eax
 00020747    mov         esi,dword ptr [ebx+8]
 0002074A    cmp         esi,dword ptr [ebx+0C]
>0002074D    jne         00020755
 0002074F    mov         eax,ebx
 00020751    mov         edx,dword ptr [eax]
 00020753    call        dword ptr [edx]
 00020755    mov         eax,dword ptr [ebx+4]
 00020758    mov         dword ptr [eax+esi*4],edi
 0002075B    inc         dword ptr [ebx+8]
 0002075E    mov         eax,esi
 00020760    pop         edi
 00020761    pop         esi
 00020762    pop         ebx
 00020763    ret
*}
end;

//00020764
procedure TList.Clear;
begin
{*
 00020764    push        ebx
 00020765    mov         ebx,eax
 00020767    xor         edx,edx
 00020769    mov         eax,ebx
 0002076B    call        TList.SetCount
 00020770    xor         edx,edx
 00020772    mov         eax,ebx
 00020774    call        TList.SetCapacity
 00020779    pop         ebx
 0002077A    ret
*}
end;

//0002077C
procedure TList.Delete(Index:Integer);
begin
{*
 0002077C    push        ebp
 0002077D    mov         ebp,esp
 0002077F    push        0
 00020781    push        ebx
 00020782    push        esi
 00020783    mov         esi,edx
 00020785    mov         ebx,eax
 00020787    xor         eax,eax
 00020789    push        ebp
 0002078A    push        207EE
 0002078F    push        dword ptr fs:[eax]
 00020792    mov         dword ptr fs:[eax],esp
 00020795    test        esi,esi
>00020797    jl          0002079E
 00020799    cmp         esi,dword ptr [ebx+8]
>0002079C    jl          000207B5
 0002079E    lea         edx,[ebp-4]
 000207A1    mov         eax,[000B5AB4];^SListIndexError:TResStringRec
 000207A6    call        LoadResString
 000207AB    mov         edx,dword ptr [ebp-4]
 000207AE    mov         ecx,esi
 000207B0    mov         eax,dword ptr [ebx]
 000207B2    call        dword ptr [eax+4]
 000207B5    dec         dword ptr [ebx+8]
 000207B8    mov         eax,dword ptr [ebx+8]
 000207BB    cmp         esi,eax
>000207BD    jge         000207D8
 000207BF    sub         eax,esi
 000207C1    mov         ecx,eax
 000207C3    shl         ecx,2
 000207C6    mov         eax,dword ptr [ebx+4]
 000207C9    lea         edx,[eax+esi*4]
 000207CC    mov         eax,dword ptr [ebx+4]
 000207CF    lea         eax,[eax+esi*4+4]
 000207D3    call        Move
 000207D8    xor         eax,eax
 000207DA    pop         edx
 000207DB    pop         ecx
 000207DC    pop         ecx
 000207DD    mov         dword ptr fs:[eax],edx
 000207E0    push        207F5
 000207E5    lea         eax,[ebp-4]
 000207E8    call        @LStrClr
 000207ED    ret
>000207EE    jmp         @HandleFinally
>000207F3    jmp         000207E5
 000207F5    pop         esi
 000207F6    pop         ebx
 000207F7    pop         ecx
 000207F8    pop         ebp
 000207F9    ret
*}
end;

//000207FC
function ReturnAddr:Pointer;
begin
{*
 000207FC    mov         eax,dword ptr [ebp+4]
 000207FF    ret
*}
end;

//00020800
procedure TList.Error(const Msg:AnsiString; Data:Integer);
begin
{*
 00020800    push        ebx
 00020801    push        esi
 00020802    add         esp,0FFFFFFF8
 00020805    mov         esi,ecx
 00020807    mov         ebx,edx
 00020809    call        ReturnAddr
 0002080E    push        eax
 0002080F    mov         dword ptr [esp+4],esi
 00020813    mov         byte ptr [esp+8],0
 00020818    lea         eax,[esp+4]
 0002081C    push        eax
 0002081D    push        0
 0002081F    mov         ecx,ebx
 00020821    mov         dl,1
 00020823    mov         eax,[0001EC9C];EListError
 00020828    call        Exception.CreateFmt
>0002082D    jmp         @RaiseExcept
 00020832    pop         ecx
 00020833    pop         edx
 00020834    pop         esi
 00020835    pop         ebx
 00020836    ret
*}
end;

//00020838
function TList.Expand:TList;
begin
{*
 00020838    push        ebx
 00020839    mov         ebx,eax
 0002083B    mov         eax,dword ptr [ebx+8]
 0002083E    cmp         eax,dword ptr [ebx+0C]
>00020841    jne         00020849
 00020843    mov         eax,ebx
 00020845    mov         edx,dword ptr [eax]
 00020847    call        dword ptr [edx]
 00020849    mov         eax,ebx
 0002084B    pop         ebx
 0002084C    ret
*}
end;

//00020850
function TList.First:Pointer;
begin
{*
 00020850    xor         edx,edx
 00020852    call        TList.Get
 00020857    ret
*}
end;

//00020858
function TList.Get(Index:Integer):Pointer;
begin
{*
 00020858    push        ebp
 00020859    mov         ebp,esp
 0002085B    push        0
 0002085D    push        ebx
 0002085E    push        esi
 0002085F    mov         esi,edx
 00020861    mov         ebx,eax
 00020863    xor         eax,eax
 00020865    push        ebp
 00020866    push        208AD
 0002086B    push        dword ptr fs:[eax]
 0002086E    mov         dword ptr fs:[eax],esp
 00020871    test        esi,esi
>00020873    jl          0002087A
 00020875    cmp         esi,dword ptr [ebx+8]
>00020878    jl          00020891
 0002087A    lea         edx,[ebp-4]
 0002087D    mov         eax,[000B5AB4];^SListIndexError:TResStringRec
 00020882    call        LoadResString
 00020887    mov         edx,dword ptr [ebp-4]
 0002088A    mov         ecx,esi
 0002088C    mov         eax,dword ptr [ebx]
 0002088E    call        dword ptr [eax+4]
 00020891    mov         eax,dword ptr [ebx+4]
 00020894    mov         ebx,dword ptr [eax+esi*4]
 00020897    xor         eax,eax
 00020899    pop         edx
 0002089A    pop         ecx
 0002089B    pop         ecx
 0002089C    mov         dword ptr fs:[eax],edx
 0002089F    push        208B4
 000208A4    lea         eax,[ebp-4]
 000208A7    call        @LStrClr
 000208AC    ret
>000208AD    jmp         @HandleFinally
>000208B2    jmp         000208A4
 000208B4    mov         eax,ebx
 000208B6    pop         esi
 000208B7    pop         ebx
 000208B8    pop         ecx
 000208B9    pop         ebp
 000208BA    ret
*}
end;

//000208BC
procedure TList.Grow;
begin
{*
 000208BC    mov         edx,dword ptr [eax+0C]
 000208BF    cmp         edx,40
>000208C2    jle         000208D2
 000208C4    mov         ecx,edx
 000208C6    test        ecx,ecx
>000208C8    jns         000208CD
 000208CA    add         ecx,3
 000208CD    sar         ecx,2
>000208D0    jmp         000208E3
 000208D2    cmp         edx,8
>000208D5    jle         000208DE
 000208D7    mov         ecx,10
>000208DC    jmp         000208E3
 000208DE    mov         ecx,4
 000208E3    add         ecx,edx
 000208E5    mov         edx,ecx
 000208E7    call        TList.SetCapacity
 000208EC    ret
*}
end;

//000208F0
function TList.IndexOf(Item:Pointer):Integer;
begin
{*
 000208F0    push        ebx
 000208F1    xor         ecx,ecx
>000208F3    jmp         000208F6
 000208F5    inc         ecx
 000208F6    cmp         ecx,dword ptr [eax+8]
>000208F9    jge         00020903
 000208FB    mov         ebx,dword ptr [eax+4]
 000208FE    cmp         edx,dword ptr [ebx+ecx*4]
>00020901    jne         000208F5
 00020903    cmp         ecx,dword ptr [eax+8]
>00020906    jne         0002090B
 00020908    or          ecx,0FFFFFFFF
 0002090B    mov         eax,ecx
 0002090D    pop         ebx
 0002090E    ret
*}
end;

//00020910
procedure TList.Insert(Index:Integer; Item:Pointer);
begin
{*
 00020910    push        ebp
 00020911    mov         ebp,esp
 00020913    add         esp,0FFFFFFF8
 00020916    push        ebx
 00020917    push        esi
 00020918    xor         ebx,ebx
 0002091A    mov         dword ptr [ebp-8],ebx
 0002091D    mov         dword ptr [ebp-4],ecx
 00020920    mov         esi,edx
 00020922    mov         ebx,eax
 00020924    xor         eax,eax
 00020926    push        ebp
 00020927    push        209A2
 0002092C    push        dword ptr fs:[eax]
 0002092F    mov         dword ptr fs:[eax],esp
 00020932    test        esi,esi
>00020934    jl          0002093B
 00020936    cmp         esi,dword ptr [ebx+8]
>00020939    jle         00020952
 0002093B    lea         edx,[ebp-8]
 0002093E    mov         eax,[000B5AB4];^SListIndexError:TResStringRec
 00020943    call        LoadResString
 00020948    mov         edx,dword ptr [ebp-8]
 0002094B    mov         ecx,esi
 0002094D    mov         eax,dword ptr [ebx]
 0002094F    call        dword ptr [eax+4]
 00020952    mov         eax,dword ptr [ebx+8]
 00020955    cmp         eax,dword ptr [ebx+0C]
>00020958    jne         00020960
 0002095A    mov         eax,ebx
 0002095C    mov         edx,dword ptr [eax]
 0002095E    call        dword ptr [edx]
 00020960    mov         eax,dword ptr [ebx+8]
 00020963    cmp         esi,eax
>00020965    jge         00020980
 00020967    sub         eax,esi
 00020969    mov         ecx,eax
 0002096B    shl         ecx,2
 0002096E    mov         eax,dword ptr [ebx+4]
 00020971    lea         edx,[eax+esi*4+4]
 00020975    mov         eax,dword ptr [ebx+4]
 00020978    lea         eax,[eax+esi*4]
 0002097B    call        Move
 00020980    mov         eax,dword ptr [ebx+4]
 00020983    mov         edx,dword ptr [ebp-4]
 00020986    mov         dword ptr [eax+esi*4],edx
 00020989    inc         dword ptr [ebx+8]
 0002098C    xor         eax,eax
 0002098E    pop         edx
 0002098F    pop         ecx
 00020990    pop         ecx
 00020991    mov         dword ptr fs:[eax],edx
 00020994    push        209A9
 00020999    lea         eax,[ebp-8]
 0002099C    call        @LStrClr
 000209A1    ret
>000209A2    jmp         @HandleFinally
>000209A7    jmp         00020999
 000209A9    pop         esi
 000209AA    pop         ebx
 000209AB    pop         ecx
 000209AC    pop         ecx
 000209AD    pop         ebp
 000209AE    ret
*}
end;

//000209B0
function TList.Last:Pointer;
begin
{*
 000209B0    mov         edx,dword ptr [eax+8]
 000209B3    dec         edx
 000209B4    call        TList.Get
 000209B9    ret
*}
end;

//000209BC
procedure TList.Move(CurIndex:Integer; NewIndex:Integer);
begin
{*
 000209BC    push        ebp
 000209BD    mov         ebp,esp
 000209BF    add         esp,0FFFFFFF8
 000209C2    push        ebx
 000209C3    push        esi
 000209C4    push        edi
 000209C5    xor         ebx,ebx
 000209C7    mov         dword ptr [ebp-8],ebx
 000209CA    mov         esi,ecx
 000209CC    mov         edi,edx
 000209CE    mov         ebx,eax
 000209D0    xor         eax,eax
 000209D2    push        ebp
 000209D3    push        20A39
 000209D8    push        dword ptr fs:[eax]
 000209DB    mov         dword ptr fs:[eax],esp
 000209DE    cmp         esi,edi
>000209E0    je          00020A23
 000209E2    test        esi,esi
>000209E4    jl          000209EB
 000209E6    cmp         esi,dword ptr [ebx+8]
>000209E9    jl          00020A02
 000209EB    lea         edx,[ebp-8]
 000209EE    mov         eax,[000B5AB4];^SListIndexError:TResStringRec
 000209F3    call        LoadResString
 000209F8    mov         edx,dword ptr [ebp-8]
 000209FB    mov         ecx,esi
 000209FD    mov         eax,dword ptr [ebx]
 000209FF    call        dword ptr [eax+4]
 00020A02    mov         edx,edi
 00020A04    mov         eax,ebx
 00020A06    call        TList.Get
 00020A0B    mov         dword ptr [ebp-4],eax
 00020A0E    mov         edx,edi
 00020A10    mov         eax,ebx
 00020A12    call        TList.Delete
 00020A17    mov         ecx,dword ptr [ebp-4]
 00020A1A    mov         edx,esi
 00020A1C    mov         eax,ebx
 00020A1E    call        TList.Insert
 00020A23    xor         eax,eax
 00020A25    pop         edx
 00020A26    pop         ecx
 00020A27    pop         ecx
 00020A28    mov         dword ptr fs:[eax],edx
 00020A2B    push        20A40
 00020A30    lea         eax,[ebp-8]
 00020A33    call        @LStrClr
 00020A38    ret
>00020A39    jmp         @HandleFinally
>00020A3E    jmp         00020A30
 00020A40    pop         edi
 00020A41    pop         esi
 00020A42    pop         ebx
 00020A43    pop         ecx
 00020A44    pop         ecx
 00020A45    pop         ebp
 00020A46    ret
*}
end;

//00020A48
procedure TList.Put(Index:Integer; Item:Pointer);
begin
{*
 00020A48    push        ebp
 00020A49    mov         ebp,esp
 00020A4B    push        0
 00020A4D    push        ebx
 00020A4E    push        esi
 00020A4F    push        edi
 00020A50    mov         edi,ecx
 00020A52    mov         esi,edx
 00020A54    mov         ebx,eax
 00020A56    xor         eax,eax
 00020A58    push        ebp
 00020A59    push        20AA0
 00020A5E    push        dword ptr fs:[eax]
 00020A61    mov         dword ptr fs:[eax],esp
 00020A64    test        esi,esi
>00020A66    jl          00020A6D
 00020A68    cmp         esi,dword ptr [ebx+8]
>00020A6B    jl          00020A84
 00020A6D    lea         edx,[ebp-4]
 00020A70    mov         eax,[000B5AB4];^SListIndexError:TResStringRec
 00020A75    call        LoadResString
 00020A7A    mov         edx,dword ptr [ebp-4]
 00020A7D    mov         ecx,esi
 00020A7F    mov         eax,dword ptr [ebx]
 00020A81    call        dword ptr [eax+4]
 00020A84    mov         eax,dword ptr [ebx+4]
 00020A87    mov         dword ptr [eax+esi*4],edi
 00020A8A    xor         eax,eax
 00020A8C    pop         edx
 00020A8D    pop         ecx
 00020A8E    pop         ecx
 00020A8F    mov         dword ptr fs:[eax],edx
 00020A92    push        20AA7
 00020A97    lea         eax,[ebp-4]
 00020A9A    call        @LStrClr
 00020A9F    ret
>00020AA0    jmp         @HandleFinally
>00020AA5    jmp         00020A97
 00020AA7    pop         edi
 00020AA8    pop         esi
 00020AA9    pop         ebx
 00020AAA    pop         ecx
 00020AAB    pop         ebp
 00020AAC    ret
*}
end;

//00020AB0
function TList.Remove(Item:Pointer):Integer;
begin
{*
 00020AB0    push        ebx
 00020AB1    push        esi
 00020AB2    mov         ebx,eax
 00020AB4    mov         eax,ebx
 00020AB6    call        TList.IndexOf
 00020ABB    mov         esi,eax
 00020ABD    cmp         esi,0FFFFFFFF
>00020AC0    je          00020ACB
 00020AC2    mov         edx,esi
 00020AC4    mov         eax,ebx
 00020AC6    call        TList.Delete
 00020ACB    mov         eax,esi
 00020ACD    pop         esi
 00020ACE    pop         ebx
 00020ACF    ret
*}
end;

//00020AD0
procedure TList.SetCapacity(NewCapacity:Integer);
begin
{*
 00020AD0    push        ebp
 00020AD1    mov         ebp,esp
 00020AD3    push        0
 00020AD5    push        ebx
 00020AD6    push        esi
 00020AD7    mov         esi,edx
 00020AD9    mov         ebx,eax
 00020ADB    xor         eax,eax
 00020ADD    push        ebp
 00020ADE    push        20B38
 00020AE3    push        dword ptr fs:[eax]
 00020AE6    mov         dword ptr fs:[eax],esp
 00020AE9    cmp         esi,dword ptr [ebx+8]
>00020AEC    jl          00020AF6
 00020AEE    cmp         esi,7FFFFFF
>00020AF4    jle         00020B0D
 00020AF6    lea         edx,[ebp-4]
 00020AF9    mov         eax,[000B5968];^SListCapacityError:TResStringRec
 00020AFE    call        LoadResString
 00020B03    mov         edx,dword ptr [ebp-4]
 00020B06    mov         ecx,esi
 00020B08    mov         eax,dword ptr [ebx]
 00020B0A    call        dword ptr [eax+4]
 00020B0D    cmp         esi,dword ptr [ebx+0C]
>00020B10    je          00020B22
 00020B12    mov         edx,esi
 00020B14    shl         edx,2
 00020B17    lea         eax,[ebx+4]
 00020B1A    call        @ReallocMem
 00020B1F    mov         dword ptr [ebx+0C],esi
 00020B22    xor         eax,eax
 00020B24    pop         edx
 00020B25    pop         ecx
 00020B26    pop         ecx
 00020B27    mov         dword ptr fs:[eax],edx
 00020B2A    push        20B3F
 00020B2F    lea         eax,[ebp-4]
 00020B32    call        @LStrClr
 00020B37    ret
>00020B38    jmp         @HandleFinally
>00020B3D    jmp         00020B2F
 00020B3F    pop         esi
 00020B40    pop         ebx
 00020B41    pop         ecx
 00020B42    pop         ebp
 00020B43    ret
*}
end;

//00020B44
procedure TList.SetCount(NewCount:Integer);
begin
{*
 00020B44    push        ebp
 00020B45    mov         ebp,esp
 00020B47    push        0
 00020B49    push        ebx
 00020B4A    push        esi
 00020B4B    mov         esi,edx
 00020B4D    mov         ebx,eax
 00020B4F    xor         eax,eax
 00020B51    push        ebp
 00020B52    push        20BC5
 00020B57    push        dword ptr fs:[eax]
 00020B5A    mov         dword ptr fs:[eax],esp
 00020B5D    test        esi,esi
>00020B5F    jl          00020B69
 00020B61    cmp         esi,7FFFFFF
>00020B67    jle         00020B80
 00020B69    lea         edx,[ebp-4]
 00020B6C    mov         eax,[000B58A0];^SListCountError:TResStringRec
 00020B71    call        LoadResString
 00020B76    mov         edx,dword ptr [ebp-4]
 00020B79    mov         ecx,esi
 00020B7B    mov         eax,dword ptr [ebx]
 00020B7D    call        dword ptr [eax+4]
 00020B80    cmp         esi,dword ptr [ebx+0C]
>00020B83    jle         00020B8E
 00020B85    mov         edx,esi
 00020B87    mov         eax,ebx
 00020B89    call        TList.SetCapacity
 00020B8E    mov         eax,dword ptr [ebx+8]
 00020B91    cmp         esi,eax
>00020B93    jle         00020BAC
 00020B95    mov         edx,dword ptr [ebx+4]
 00020B98    lea         edx,[edx+eax*4]
 00020B9B    mov         ecx,esi
 00020B9D    sub         ecx,eax
 00020B9F    mov         eax,ecx
 00020BA1    shl         eax,2
 00020BA4    xor         ecx,ecx
 00020BA6    xchg        eax,edx
 00020BA7    call        @FillChar
 00020BAC    mov         dword ptr [ebx+8],esi
 00020BAF    xor         eax,eax
 00020BB1    pop         edx
 00020BB2    pop         ecx
 00020BB3    pop         ecx
 00020BB4    mov         dword ptr fs:[eax],edx
 00020BB7    push        20BCC
 00020BBC    lea         eax,[ebp-4]
 00020BBF    call        @LStrClr
 00020BC4    ret
>00020BC5    jmp         @HandleFinally
>00020BCA    jmp         00020BBC
 00020BCC    pop         esi
 00020BCD    pop         ebx
 00020BCE    pop         ecx
 00020BCF    pop         ebp
 00020BD0    ret
*}
end;

//00020BD4
constructor TThreadList.Create;
begin
{*
 00020BD4    push        ebx
 00020BD5    push        esi
 00020BD6    test        dl,dl
>00020BD8    je          00020BE2
 00020BDA    add         esp,0FFFFFFF0
 00020BDD    call        @ClassCreate
 00020BE2    mov         ebx,edx
 00020BE4    mov         esi,eax
 00020BE6    xor         edx,edx
 00020BE8    mov         eax,esi
 00020BEA    call        TObject.Create
 00020BEF    lea         eax,[esi+8]
 00020BF2    push        eax
 00020BF3    call        kernel32.InitializeCriticalSection
 00020BF8    mov         dl,1
 00020BFA    mov         eax,[0001EEC4];TList
 00020BFF    call        TObject.Create
 00020C04    mov         dword ptr [esi+4],eax
 00020C07    mov         eax,esi
 00020C09    test        bl,bl
>00020C0B    je          00020C1C
 00020C0D    call        @AfterConstruction
 00020C12    pop         dword ptr fs:[0]
 00020C19    add         esp,0C
 00020C1C    mov         eax,esi
 00020C1E    pop         esi
 00020C1F    pop         ebx
 00020C20    ret
*}
end;

//00020C24
destructor TThreadList.Destroy;
begin
{*
 00020C24    push        ebp
 00020C25    mov         ebp,esp
 00020C27    add         esp,0FFFFFFF8
 00020C2A    call        @BeforeDestruction
 00020C2F    mov         byte ptr [ebp-5],dl
 00020C32    mov         dword ptr [ebp-4],eax
 00020C35    mov         eax,dword ptr [ebp-4]
 00020C38    call        TThreadList.LockList
 00020C3D    xor         eax,eax
 00020C3F    push        ebp
 00020C40    push        20C86
 00020C45    push        dword ptr fs:[eax]
 00020C48    mov         dword ptr fs:[eax],esp
 00020C4B    mov         eax,dword ptr [ebp-4]
 00020C4E    mov         eax,dword ptr [eax+4]
 00020C51    call        TObject.Free
 00020C56    mov         dl,byte ptr [ebp-5]
 00020C59    and         dl,0FC
 00020C5C    mov         eax,dword ptr [ebp-4]
 00020C5F    call        TObject.Destroy
 00020C64    xor         eax,eax
 00020C66    pop         edx
 00020C67    pop         ecx
 00020C68    pop         ecx
 00020C69    mov         dword ptr fs:[eax],edx
 00020C6C    push        20C8D
 00020C71    mov         eax,dword ptr [ebp-4]
 00020C74    call        TThreadList.UnlockList
 00020C79    mov         eax,dword ptr [ebp-4]
 00020C7C    add         eax,8
 00020C7F    push        eax
 00020C80    call        kernel32.DeleteCriticalSection
 00020C85    ret
>00020C86    jmp         @HandleFinally
>00020C8B    jmp         00020C71
 00020C8D    cmp         byte ptr [ebp-5],0
>00020C91    jle         00020C9B
 00020C93    mov         eax,dword ptr [ebp-4]
 00020C96    call        @ClassDestroy
 00020C9B    pop         ecx
 00020C9C    pop         ecx
 00020C9D    pop         ebp
 00020C9E    ret
*}
end;

//00020CA0
procedure TThreadList.Add(Item:Pointer);
begin
{*
 00020CA0    push        ebp
 00020CA1    mov         ebp,esp
 00020CA3    push        ecx
 00020CA4    push        ebx
 00020CA5    mov         ebx,edx
 00020CA7    mov         dword ptr [ebp-4],eax
 00020CAA    mov         eax,dword ptr [ebp-4]
 00020CAD    call        TThreadList.LockList
 00020CB2    xor         eax,eax
 00020CB4    push        ebp
 00020CB5    push        20CF3
 00020CBA    push        dword ptr fs:[eax]
 00020CBD    mov         dword ptr fs:[eax],esp
 00020CC0    mov         eax,dword ptr [ebp-4]
 00020CC3    mov         eax,dword ptr [eax+4]
 00020CC6    mov         edx,ebx
 00020CC8    call        TList.IndexOf
 00020CCD    inc         eax
>00020CCE    jne         00020CDD
 00020CD0    mov         eax,dword ptr [ebp-4]
 00020CD3    mov         eax,dword ptr [eax+4]
 00020CD6    mov         edx,ebx
 00020CD8    call        TList.Add
 00020CDD    xor         eax,eax
 00020CDF    pop         edx
 00020CE0    pop         ecx
 00020CE1    pop         ecx
 00020CE2    mov         dword ptr fs:[eax],edx
 00020CE5    push        20CFA
 00020CEA    mov         eax,dword ptr [ebp-4]
 00020CED    call        TThreadList.UnlockList
 00020CF2    ret
>00020CF3    jmp         @HandleFinally
>00020CF8    jmp         00020CEA
 00020CFA    pop         ebx
 00020CFB    pop         ecx
 00020CFC    pop         ebp
 00020CFD    ret
*}
end;

//00020D00
function TThreadList.LockList:TList;
begin
{*
 00020D00    push        ebx
 00020D01    mov         ebx,eax
 00020D03    lea         eax,[ebx+8]
 00020D06    push        eax
 00020D07    call        kernel32.EnterCriticalSection
 00020D0C    mov         eax,dword ptr [ebx+4]
 00020D0F    pop         ebx
 00020D10    ret
*}
end;

//00020D14
procedure TThreadList.Remove(Item:Pointer);
begin
{*
 00020D14    push        ebp
 00020D15    mov         ebp,esp
 00020D17    push        ecx
 00020D18    push        ebx
 00020D19    mov         ebx,edx
 00020D1B    mov         dword ptr [ebp-4],eax
 00020D1E    mov         eax,dword ptr [ebp-4]
 00020D21    call        TThreadList.LockList
 00020D26    xor         eax,eax
 00020D28    push        ebp
 00020D29    push        20D57
 00020D2E    push        dword ptr fs:[eax]
 00020D31    mov         dword ptr fs:[eax],esp
 00020D34    mov         eax,dword ptr [ebp-4]
 00020D37    mov         eax,dword ptr [eax+4]
 00020D3A    mov         edx,ebx
 00020D3C    call        TList.Remove
 00020D41    xor         eax,eax
 00020D43    pop         edx
 00020D44    pop         ecx
 00020D45    pop         ecx
 00020D46    mov         dword ptr fs:[eax],edx
 00020D49    push        20D5E
 00020D4E    mov         eax,dword ptr [ebp-4]
 00020D51    call        TThreadList.UnlockList
 00020D56    ret
>00020D57    jmp         @HandleFinally
>00020D5C    jmp         00020D4E
 00020D5E    pop         ebx
 00020D5F    pop         ecx
 00020D60    pop         ebp
 00020D61    ret
*}
end;

//00020D64
procedure TThreadList.UnlockList;
begin
{*
 00020D64    add         eax,8
 00020D67    push        eax
 00020D68    call        kernel32.LeaveCriticalSection
 00020D6D    ret
*}
end;

//00020D70
destructor TBits.Destroy;
begin
{*
 00020D70    push        ebx
 00020D71    push        esi
 00020D72    call        @BeforeDestruction
 00020D77    mov         ebx,edx
 00020D79    mov         esi,eax
 00020D7B    xor         edx,edx
 00020D7D    mov         eax,esi
 00020D7F    call        TBits.SetSize
 00020D84    mov         edx,ebx
 00020D86    and         dl,0FC
 00020D89    mov         eax,esi
 00020D8B    call        TObject.Destroy
 00020D90    test        bl,bl
>00020D92    jle         00020D9B
 00020D94    mov         eax,esi
 00020D96    call        @ClassDestroy
 00020D9B    pop         esi
 00020D9C    pop         ebx
 00020D9D    ret
*}
end;

//00020DA0
procedure TBits.Error;
begin
{*
 00020DA0    push        ebp
 00020DA1    mov         ebp,esp
 00020DA3    push        0
 00020DA5    xor         eax,eax
 00020DA7    push        ebp
 00020DA8    push        20DEA
 00020DAD    push        dword ptr fs:[eax]
 00020DB0    mov         dword ptr fs:[eax],esp
 00020DB3    lea         edx,[ebp-4]
 00020DB6    mov         eax,[000B5B20];^SBitsIndexError:TResStringRec
 00020DBB    call        LoadResString
 00020DC0    mov         ecx,dword ptr [ebp-4]
 00020DC3    mov         dl,1
 00020DC5    mov         eax,[0001ECF4];EBitsError
 00020DCA    call        Exception.Create
 00020DCF    call        @RaiseExcept
 00020DD4    xor         eax,eax
 00020DD6    pop         edx
 00020DD7    pop         ecx
 00020DD8    pop         ecx
 00020DD9    mov         dword ptr fs:[eax],edx
 00020DDC    push        20DF1
 00020DE1    lea         eax,[ebp-4]
 00020DE4    call        @LStrClr
 00020DE9    ret
>00020DEA    jmp         @HandleFinally
>00020DEF    jmp         00020DE1
 00020DF1    pop         ecx
 00020DF2    pop         ebp
 00020DF3    ret
*}
end;

//00020DF4
function Min(X:Integer; Y:Integer):Integer;
begin
{*
 00020DF4    mov         ecx,eax
 00020DF6    cmp         edx,eax
>00020DF8    jge         00020DFC
 00020DFA    mov         ecx,edx
 00020DFC    mov         eax,ecx
 00020DFE    ret
*}
end;

//00020E00
procedure TBits.SetSize(Value:Integer);
begin
{*
 00020E00    push        ebx
 00020E01    push        esi
 00020E02    push        edi
 00020E03    push        ebp
 00020E04    push        ecx
 00020E05    mov         esi,edx
 00020E07    mov         ebx,eax
 00020E09    cmp         esi,dword ptr [ebx+4]
>00020E0C    je          00020E9C
 00020E12    test        esi,esi
>00020E14    jge         00020E1D
 00020E16    mov         eax,ebx
 00020E18    call        TBits.Error
 00020E1D    lea         eax,[esi+20]
 00020E20    dec         eax
 00020E21    test        eax,eax
>00020E23    jns         00020E28
 00020E25    add         eax,1F
 00020E28    sar         eax,5
 00020E2B    mov         edi,eax
 00020E2D    shl         edi,2
 00020E30    mov         eax,dword ptr [ebx+4]
 00020E33    add         eax,20
 00020E36    dec         eax
 00020E37    test        eax,eax
>00020E39    jns         00020E3E
 00020E3B    add         eax,1F
 00020E3E    sar         eax,5
 00020E41    mov         ebp,eax
 00020E43    shl         ebp,2
 00020E46    cmp         ebp,edi
>00020E48    je          00020E99
 00020E4A    xor         eax,eax
 00020E4C    mov         dword ptr [esp],eax
 00020E4F    test        edi,edi
>00020E51    je          00020E69
 00020E53    mov         eax,edi
 00020E55    call        @GetMem
 00020E5A    mov         dword ptr [esp],eax
 00020E5D    mov         eax,dword ptr [esp]
 00020E60    xor         ecx,ecx
 00020E62    mov         edx,edi
 00020E64    call        @FillChar
 00020E69    test        ebp,ebp
>00020E6B    je          00020E93
 00020E6D    cmp         dword ptr [esp],0
>00020E71    je          00020E89
 00020E73    mov         edx,edi
 00020E75    mov         eax,ebp
 00020E77    call        Min
 00020E7C    mov         ecx,eax
 00020E7E    mov         edx,dword ptr [esp]
 00020E81    mov         eax,dword ptr [ebx+8]
 00020E84    call        Move
 00020E89    mov         edx,ebp
 00020E8B    mov         eax,dword ptr [ebx+8]
 00020E8E    call        @FreeMem
 00020E93    mov         eax,dword ptr [esp]
 00020E96    mov         dword ptr [ebx+8],eax
 00020E99    mov         dword ptr [ebx+4],esi
 00020E9C    pop         edx
 00020E9D    pop         ebp
 00020E9E    pop         edi
 00020E9F    pop         esi
 00020EA0    pop         ebx
 00020EA1    ret
*}
end;

//00020EA4
procedure TBits.SetBit(Index:Integer; Value:Boolean);
begin
{*
 00020EA4    cmp         edx,dword ptr [eax+4]
>00020EA7    jae         00020EB8
 00020EA9    mov         eax,dword ptr [eax+8]
 00020EAC    or          cl,cl
>00020EAE    je          00020EB4
 00020EB0    bts         dword ptr [eax],edx
 00020EB3    ret
 00020EB4    btr         dword ptr [eax],edx
 00020EB7    ret
 00020EB8    cmp         edx,0
>00020EBB    jl          00020DA0
 00020EC1    push        eax
 00020EC2    push        edx
 00020EC3    push        ecx
 00020EC4    inc         edx
 00020EC5    call        TBits.SetSize
 00020ECA    pop         ecx
 00020ECB    pop         edx
 00020ECC    pop         eax
>00020ECD    jmp         00020EA9
 00020ECF    ret
*}
end;

//00020ED0
function TBits.GetBit(Index:Integer):Boolean;
begin
{*
 00020ED0    cmp         edx,dword ptr [eax+4]
>00020ED3    jae         00020DA0
 00020ED9    mov         eax,dword ptr [eax+8]
 00020EDC    bt          dword ptr [eax],edx
 00020EDF    sbb         eax,eax
 00020EE1    and         eax,1
 00020EE4    ret
*}
end;

//00020EE8
function TBits.OpenBit:Integer;
begin
{*
 00020EE8    push        ebx
 00020EE9    push        esi
 00020EEA    push        edi
 00020EEB    push        ecx
 00020EEC    mov         ebx,eax
 00020EEE    mov         eax,dword ptr [ebx+4]
 00020EF1    add         eax,20
 00020EF4    dec         eax
 00020EF5    test        eax,eax
>00020EF7    jns         00020EFC
 00020EF9    add         eax,1F
 00020EFC    sar         eax,5
 00020EFF    dec         eax
 00020F00    test        eax,eax
>00020F02    jl          00020F51
 00020F04    inc         eax
 00020F05    mov         dword ptr [esp],eax
 00020F08    xor         esi,esi
 00020F0A    mov         eax,dword ptr [ebx+8]
 00020F0D    mov         edx,dword ptr ds:[20F5C]
 00020F13    cmp         edx,dword ptr [eax+esi*4]
>00020F16    je          00020F4B
 00020F18    mov         eax,dword ptr [ebx+8]
 00020F1B    mov         edi,dword ptr [eax+esi*4]
 00020F1E    xor         eax,eax
 00020F20    mov         edx,eax
 00020F22    cmp         dl,1F
>00020F25    ja          00020F2D
 00020F27    and         edx,7F
 00020F2A    bt          edi,edx
>00020F2D    jb          00020F46
 00020F2F    mov         edx,esi
 00020F31    shl         edx,5
 00020F34    and         eax,7F
 00020F37    add         edx,eax
 00020F39    mov         eax,edx
 00020F3B    mov         edx,dword ptr [ebx+4]
 00020F3E    cmp         eax,edx
>00020F40    jl          00020F54
 00020F42    mov         eax,edx
>00020F44    jmp         00020F54
 00020F46    inc         eax
 00020F47    cmp         al,20
>00020F49    jne         00020F20
 00020F4B    inc         esi
 00020F4C    dec         dword ptr [esp]
>00020F4F    jne         00020F0A
 00020F51    mov         eax,dword ptr [ebx+4]
 00020F54    pop         edx
 00020F55    pop         edi
 00020F56    pop         esi
 00020F57    pop         ebx
 00020F58    ret
*}
end;

//00020F60
destructor TMemoryStream.Destroy;
begin
{*
 00020F60    push        ebx
 00020F61    push        esi
 00020F62    call        @BeforeDestruction
 00020F67    mov         ebx,edx
 00020F69    mov         esi,eax
 00020F6B    mov         eax,esi
 00020F6D    call        TMemoryStream.Clear
 00020F72    mov         edx,ebx
 00020F74    and         dl,0FC
 00020F77    mov         eax,esi
 00020F79    call        TObject.Destroy
 00020F7E    test        bl,bl
>00020F80    jle         00020F89
 00020F82    mov         eax,esi
 00020F84    call        @ClassDestroy
 00020F89    pop         esi
 00020F8A    pop         ebx
 00020F8B    ret
*}
end;

//00020F8C
procedure TPersistent.Assign(Source:TPersistent);
begin
{*
 00020F8C    test        edx,edx
>00020F8E    je          00020F96
 00020F90    xchg        eax,edx
 00020F91    mov         ecx,dword ptr [eax]
 00020F93    call        dword ptr [ecx]
 00020F95    ret
 00020F96    xor         edx,edx
 00020F98    call        TPersistent.AssignError
 00020F9D    ret
*}
end;

//00020FA0
procedure TPersistent.AssignError(Source:TPersistent);
begin
{*
 00020FA0    push        ebp
 00020FA1    mov         ebp,esp
 00020FA3    add         esp,0FFFFFEE8
 00020FA9    push        ebx
 00020FAA    push        esi
 00020FAB    xor         ecx,ecx
 00020FAD    mov         dword ptr [ebp-118],ecx
 00020FB3    mov         dword ptr [ebp-4],ecx
 00020FB6    mov         esi,edx
 00020FB8    mov         ebx,eax
 00020FBA    xor         eax,eax
 00020FBC    push        ebp
 00020FBD    push        21077
 00020FC2    push        dword ptr fs:[eax]
 00020FC5    mov         dword ptr fs:[eax],esp
 00020FC8    test        esi,esi
>00020FCA    je          00020FE9
 00020FCC    lea         edx,[ebp-104]
 00020FD2    mov         eax,dword ptr [esi]
 00020FD4    call        TObject.ClassName
 00020FD9    lea         edx,[ebp-104]
 00020FDF    lea         eax,[ebp-4]
 00020FE2    call        @LStrFromString
>00020FE7    jmp         00020FF6
 00020FE9    lea         eax,[ebp-4]
 00020FEC    mov         edx,2108C;'nil'
 00020FF1    call        @LStrLAsg
 00020FF6    mov         eax,dword ptr [ebp-4]
 00020FF9    mov         dword ptr [ebp-114],eax
 00020FFF    mov         byte ptr [ebp-110],0B
 00021006    lea         edx,[ebp-104]
 0002100C    mov         eax,dword ptr [ebx]
 0002100E    call        TObject.ClassName
 00021013    lea         eax,[ebp-104]
 00021019    mov         dword ptr [ebp-10C],eax
 0002101F    mov         byte ptr [ebp-108],4
 00021026    lea         eax,[ebp-114]
 0002102C    push        eax
 0002102D    push        1
 0002102F    lea         edx,[ebp-118]
 00021035    mov         eax,[000B58C8];^SAssignError:TResStringRec
 0002103A    call        LoadResString
 0002103F    mov         ecx,dword ptr [ebp-118]
 00021045    mov         dl,1
 00021047    mov         eax,[00017D40];EConvertError
 0002104C    call        Exception.CreateFmt
 00021051    call        @RaiseExcept
 00021056    xor         eax,eax
 00021058    pop         edx
 00021059    pop         ecx
 0002105A    pop         ecx
 0002105B    mov         dword ptr fs:[eax],edx
 0002105E    push        2107E
 00021063    lea         eax,[ebp-118]
 00021069    call        @LStrClr
 0002106E    lea         eax,[ebp-4]
 00021071    call        @LStrClr
 00021076    ret
>00021077    jmp         @HandleFinally
>0002107C    jmp         00021063
 0002107E    pop         esi
 0002107F    pop         ebx
 00021080    mov         esp,ebp
 00021082    pop         ebp
 00021083    ret
*}
end;

//00021090
procedure TPersistent.AssignTo(Dest:TPersistent);
begin
{*
 00021090    xchg        eax,edx
 00021091    call        TPersistent.AssignError
 00021096    ret
*}
end;

//00021098
procedure TPersistent.DefineProperties(Filer:TFiler);
begin
{*
 00021098    ret
*}
end;

//0002109C
procedure TPersistent.GetNamePath;
begin
{*
 0002109C    push        ebp
 0002109D    mov         ebp,esp
 0002109F    add         esp,0FFFFFEFC
 000210A5    push        ebx
 000210A6    push        esi
 000210A7    push        edi
 000210A8    xor         ecx,ecx
 000210AA    mov         dword ptr [ebp-4],ecx
 000210AD    mov         edi,edx
 000210AF    mov         esi,eax
 000210B1    xor         eax,eax
 000210B3    push        ebp
 000210B4    push        21131
 000210B9    push        dword ptr fs:[eax]
 000210BC    mov         dword ptr fs:[eax],esp
 000210BF    lea         edx,[ebp-104]
 000210C5    mov         eax,dword ptr [esi]
 000210C7    call        TObject.ClassName
 000210CC    lea         edx,[ebp-104]
 000210D2    mov         eax,edi
 000210D4    call        @LStrFromString
 000210D9    mov         eax,esi
 000210DB    mov         bx,0FFFF
 000210DF    call        @CallDynaInst
 000210E4    test        eax,eax
>000210E6    je          0002111B
 000210E8    mov         eax,esi
 000210EA    mov         bx,0FFFF
 000210EE    call        @CallDynaInst
 000210F3    lea         edx,[ebp-4]
 000210F6    mov         bx,0FFFE
 000210FA    call        @CallDynaInst
 000210FF    cmp         dword ptr [ebp-4],0
>00021103    je          0002111B
 00021105    push        dword ptr [ebp-4]
 00021108    push        21148;'.'
 0002110D    push        dword ptr [edi]
 0002110F    mov         eax,edi
 00021111    mov         edx,3
 00021116    call        @LStrCatN
 0002111B    xor         eax,eax
 0002111D    pop         edx
 0002111E    pop         ecx
 0002111F    pop         ecx
 00021120    mov         dword ptr fs:[eax],edx
 00021123    push        21138
 00021128    lea         eax,[ebp-4]
 0002112B    call        @LStrClr
 00021130    ret
>00021131    jmp         @HandleFinally
>00021136    jmp         00021128
 00021138    pop         edi
 00021139    pop         esi
 0002113A    pop         ebx
 0002113B    mov         esp,ebp
 0002113D    pop         ebp
 0002113E    ret
*}
end;

//0002114C
procedure TPersistent.sub_0002114C;
begin
{*
 0002114C    xor         eax,eax
 0002114E    ret
*}
end;

//00021150
constructor TCollectionItem.Create(Collection:TCollection);
begin
{*
 00021150    push        ebx
 00021151    push        esi
 00021152    test        dl,dl
>00021154    je          0002115E
 00021156    add         esp,0FFFFFFF0
 00021159    call        @ClassCreate
 0002115E    mov         ebx,edx
 00021160    mov         esi,eax
 00021162    mov         edx,ecx
 00021164    mov         eax,esi
 00021166    call        TCollectionItem.SetCollection
 0002116B    mov         eax,esi
 0002116D    test        bl,bl
>0002116F    je          00021180
 00021171    call        @AfterConstruction
 00021176    pop         dword ptr fs:[0]
 0002117D    add         esp,0C
 00021180    mov         eax,esi
 00021182    pop         esi
 00021183    pop         ebx
 00021184    ret
*}
end;

//00021188
destructor TCollectionItem.Destroy;
begin
{*
 00021188    push        ebx
 00021189    push        esi
 0002118A    call        @BeforeDestruction
 0002118F    mov         ebx,edx
 00021191    mov         esi,eax
 00021193    xor         edx,edx
 00021195    mov         eax,esi
 00021197    call        TCollectionItem.SetCollection
 0002119C    mov         edx,ebx
 0002119E    and         dl,0FC
 000211A1    mov         eax,esi
 000211A3    call        TMemoryStream.Destroy
 000211A8    test        bl,bl
>000211AA    jle         000211B3
 000211AC    mov         eax,esi
 000211AE    call        @ClassDestroy
 000211B3    pop         esi
 000211B4    pop         ebx
 000211B5    ret
*}
end;

//000211B8
procedure TCollectionItem.Changed(AllItems:Boolean);
begin
{*
 000211B8    push        esi
 000211B9    mov         esi,dword ptr [eax+4]
 000211BC    test        esi,esi
>000211BE    je          000211D7
 000211C0    cmp         dword ptr [esi+0C],0
>000211C4    jne         000211D7
 000211C6    test        dl,dl
>000211C8    je          000211CE
 000211CA    xor         edx,edx
>000211CC    jmp         000211D0
 000211CE    mov         edx,eax
 000211D0    mov         eax,esi
 000211D2    mov         ecx,dword ptr [eax]
 000211D4    call        dword ptr [ecx+10]
 000211D7    pop         esi
 000211D8    ret
*}
end;

//000211DC
function TCollectionItem.GetIndex:Integer;
begin
{*
 000211DC    mov         edx,dword ptr [eax+4]
 000211DF    test        edx,edx
>000211E1    je          000211ED
 000211E3    mov         edx,dword ptr [edx+8]
 000211E6    xchg        eax,edx
 000211E7    call        TList.IndexOf
 000211EC    ret
 000211ED    or          eax,0FFFFFFFF
 000211F0    ret
*}
end;

//000211F4
function TCollectionItem.GetDisplayName:AnsiString;
begin
{*
 000211F4    push        ebx
 000211F5    push        esi
 000211F6    add         esp,0FFFFFF00
 000211FC    mov         esi,edx
 000211FE    mov         ebx,eax
 00021200    mov         edx,esp
 00021202    mov         eax,dword ptr [ebx]
 00021204    call        TObject.ClassName
 00021209    mov         edx,esp
 0002120B    mov         eax,esi
 0002120D    call        @LStrFromString
 00021212    add         esp,100
 00021218    pop         esi
 00021219    pop         ebx
 0002121A    ret
*}
end;

//0002121C
procedure TCollectionItem.GetNamePath;
begin
{*
 0002121C    push        ebp
 0002121D    mov         ebp,esp
 0002121F    add         esp,0FFFFFEEC
 00021225    push        ebx
 00021226    push        esi
 00021227    push        edi
 00021228    xor         ecx,ecx
 0002122A    mov         dword ptr [ebp-14],ecx
 0002122D    mov         edi,edx
 0002122F    mov         esi,eax
 00021231    xor         eax,eax
 00021233    push        ebp
 00021234    push        212B1
 00021239    push        dword ptr fs:[eax]
 0002123C    mov         dword ptr fs:[eax],esp
 0002123F    cmp         dword ptr [esi+4],0
>00021243    je          00021281
 00021245    push        edi
 00021246    lea         edx,[ebp-14]
 00021249    mov         eax,dword ptr [esi+4]
 0002124C    mov         bx,0FFFE
 00021250    call        @CallDynaInst
 00021255    mov         eax,dword ptr [ebp-14]
 00021258    mov         dword ptr [ebp-10],eax
 0002125B    mov         byte ptr [ebp-0C],0B
 0002125F    mov         eax,esi
 00021261    call        TCollectionItem.GetIndex
 00021266    mov         dword ptr [ebp-8],eax
 00021269    mov         byte ptr [ebp-4],0
 0002126D    lea         edx,[ebp-10]
 00021270    mov         ecx,1
 00021275    mov         eax,212C8;'%s[%d]'
 0002127A    call        Format
>0002127F    jmp         0002129B
 00021281    lea         edx,[ebp-114]
 00021287    mov         eax,dword ptr [esi]
 00021289    call        TObject.ClassName
 0002128E    lea         edx,[ebp-114]
 00021294    mov         eax,edi
 00021296    call        @LStrFromString
 0002129B    xor         eax,eax
 0002129D    pop         edx
 0002129E    pop         ecx
 0002129F    pop         ecx
 000212A0    mov         dword ptr fs:[eax],edx
 000212A3    push        212B8
 000212A8    lea         eax,[ebp-14]
 000212AB    call        @LStrClr
 000212B0    ret
>000212B1    jmp         @HandleFinally
>000212B6    jmp         000212A8
 000212B8    pop         edi
 000212B9    pop         esi
 000212BA    pop         ebx
 000212BB    mov         esp,ebp
 000212BD    pop         ebp
 000212BE    ret
*}
end;

//000212D0
procedure TCollectionItem.sub_0002114C;
begin
{*
 000212D0    mov         eax,dword ptr [eax+4];TCollectionItem.FCollection:TCollection
 000212D3    ret
*}
end;

//000212D4
procedure TCollectionItem.SetCollection(Value:TCollection);
begin
{*
 000212D4    push        ebx
 000212D5    push        esi
 000212D6    mov         esi,edx
 000212D8    mov         ebx,eax
 000212DA    mov         eax,dword ptr [ebx+4]
 000212DD    cmp         esi,eax
>000212DF    je          000212F9
 000212E1    test        eax,eax
>000212E3    je          000212EC
 000212E5    mov         edx,ebx
 000212E7    call        TCollection.RemoveItem
 000212EC    test        esi,esi
>000212EE    je          000212F9
 000212F0    mov         edx,ebx
 000212F2    mov         eax,esi
 000212F4    call        TCollection.InsertItem
 000212F9    pop         esi
 000212FA    pop         ebx
 000212FB    ret
*}
end;

//000212FC
procedure TCollectionItem.SetDisplayName(const Value:AnsiString);
begin
{*
 000212FC    xor         edx,edx
 000212FE    call        TCollectionItem.Changed
 00021303    ret
*}
end;

//00021304
procedure TCollectionItem.SetIndex(Value:Integer);
begin
{*
 00021304    push        ebx
 00021305    push        esi
 00021306    mov         esi,edx
 00021308    mov         ebx,eax
 0002130A    mov         eax,ebx
 0002130C    call        TCollectionItem.GetIndex
 00021311    test        eax,eax
>00021313    jl          00021330
 00021315    cmp         esi,eax
>00021317    je          00021330
 00021319    mov         edx,dword ptr [ebx+4]
 0002131C    mov         edx,dword ptr [edx+8]
 0002131F    mov         ecx,esi
 00021321    xchg        eax,edx
 00021322    call        TList.Move
 00021327    mov         dl,1
 00021329    mov         eax,ebx
 0002132B    call        TCollectionItem.Changed
 00021330    pop         esi
 00021331    pop         ebx
 00021332    ret
*}
end;

//00021334
constructor TCollection.Create(ItemClass:TCollectionItemClass);
begin
{*
 00021334    push        ebx
 00021335    push        esi
 00021336    test        dl,dl
>00021338    je          00021342
 0002133A    add         esp,0FFFFFFF0
 0002133D    call        @ClassCreate
 00021342    mov         ebx,edx
 00021344    mov         esi,eax
 00021346    mov         dword ptr [esi+4],ecx
 00021349    mov         dl,1
 0002134B    mov         eax,[0001EEC4];TList
 00021350    call        TObject.Create
 00021355    mov         dword ptr [esi+8],eax
 00021358    mov         eax,esi
 0002135A    test        bl,bl
>0002135C    je          0002136D
 0002135E    call        @AfterConstruction
 00021363    pop         dword ptr fs:[0]
 0002136A    add         esp,0C
 0002136D    mov         eax,esi
 0002136F    pop         esi
 00021370    pop         ebx
 00021371    ret
*}
end;

//00021374
destructor TCollection.Destroy;
begin
{*
 00021374    push        ebx
 00021375    push        esi
 00021376    call        @BeforeDestruction
 0002137B    mov         ebx,edx
 0002137D    mov         esi,eax
 0002137F    mov         dword ptr [esi+0C],1;TCollection.FUpdateCount:Integer
 00021386    cmp         dword ptr [esi+8],0;TCollection.FItems:TList
>0002138A    je          00021393
 0002138C    mov         eax,esi
 0002138E    call        TCollection.Clear
 00021393    mov         eax,dword ptr [esi+8];TCollection.FItems:TList
 00021396    call        TObject.Free
 0002139B    mov         edx,ebx
 0002139D    and         dl,0FC
 000213A0    mov         eax,esi
 000213A2    call        TMemoryStream.Destroy
 000213A7    test        bl,bl
>000213A9    jle         000213B2
 000213AB    mov         eax,esi
 000213AD    call        @ClassDestroy
 000213B2    pop         esi
 000213B3    pop         ebx
 000213B4    ret
*}
end;

//000213B8
function TCollection.Add:TCollectionItem;
begin
{*
 000213B8    mov         ecx,eax
 000213BA    mov         dl,1
 000213BC    mov         eax,dword ptr [eax+4]
 000213BF    call        dword ptr [eax+18]
 000213C2    ret
*}
end;

//000213C4
procedure TCollection.Assign(Source:TPersistent);
begin
{*
 000213C4    push        ebp
 000213C5    mov         ebp,esp
 000213C7    push        ecx
 000213C8    push        ebx
 000213C9    push        esi
 000213CA    push        edi
 000213CB    mov         esi,edx
 000213CD    mov         dword ptr [ebp-4],eax
 000213D0    mov         eax,esi
 000213D2    mov         edx,dword ptr ds:[1F124];TCollection
 000213D8    call        @IsClass
 000213DD    test        al,al
>000213DF    je          00021449
 000213E1    mov         eax,dword ptr [ebp-4]
 000213E4    mov         edx,dword ptr [eax]
 000213E6    call        dword ptr [edx+14]
 000213E9    xor         eax,eax
 000213EB    push        ebp
 000213EC    push        21442
 000213F1    push        dword ptr fs:[eax]
 000213F4    mov         dword ptr fs:[eax],esp
 000213F7    mov         eax,dword ptr [ebp-4]
 000213FA    call        TCollection.Clear
 000213FF    mov         eax,esi
 00021401    call        TCollection.GetCount
 00021406    mov         ebx,eax
 00021408    dec         ebx
 00021409    test        ebx,ebx
>0002140B    jl          0002142C
 0002140D    inc         ebx
 0002140E    xor         edi,edi
 00021410    mov         edx,edi
 00021412    mov         eax,esi
 00021414    call        TCollection.GetItem
 00021419    push        eax
 0002141A    mov         eax,dword ptr [ebp-4]
 0002141D    call        TCollection.Add
 00021422    pop         edx
 00021423    mov         ecx,dword ptr [eax]
 00021425    call        dword ptr [ecx+8]
 00021428    inc         edi
 00021429    dec         ebx
>0002142A    jne         00021410
 0002142C    xor         eax,eax
 0002142E    pop         edx
 0002142F    pop         ecx
 00021430    pop         ecx
 00021431    mov         dword ptr fs:[eax],edx
 00021434    push        21453
 00021439    mov         eax,dword ptr [ebp-4]
 0002143C    mov         edx,dword ptr [eax]
 0002143E    call        dword ptr [edx+18]
 00021441    ret
>00021442    jmp         @HandleFinally
>00021447    jmp         00021439
 00021449    mov         edx,esi
 0002144B    mov         eax,dword ptr [ebp-4]
 0002144E    call        TPersistent.Assign
 00021453    pop         edi
 00021454    pop         esi
 00021455    pop         ebx
 00021456    pop         ecx
 00021457    pop         ebp
 00021458    ret
*}
end;

//0002145C
procedure sub_0002145C;
begin
{*
 0002145C    inc         dword ptr [eax+0C];TCollection.FUpdateCount:Integer
 0002145F    ret
*}
end;

//00021460
procedure TCollection.Changed;
begin
{*
 00021460    cmp         dword ptr [eax+0C],0
>00021464    jne         0002146D
 00021466    xor         edx,edx
 00021468    mov         ecx,dword ptr [eax]
 0002146A    call        dword ptr [ecx+10]
 0002146D    ret
*}
end;

//00021470
procedure TCollection.Clear;
begin
{*
 00021470    push        ebp
 00021471    mov         ebp,esp
 00021473    push        ecx
 00021474    push        ebx
 00021475    mov         dword ptr [ebp-4],eax
 00021478    mov         eax,dword ptr [ebp-4]
 0002147B    mov         eax,dword ptr [eax+8]
 0002147E    cmp         dword ptr [eax+8],0
>00021482    jle         000214D1
 00021484    mov         eax,dword ptr [ebp-4]
 00021487    mov         edx,dword ptr [eax]
 00021489    call        dword ptr [edx+14]
 0002148C    xor         eax,eax
 0002148E    push        ebp
 0002148F    push        214CA
 00021494    push        dword ptr fs:[eax]
 00021497    mov         dword ptr fs:[eax],esp
>0002149A    jmp         000214A8
 0002149C    mov         eax,ebx
 0002149E    call        TList.Last
 000214A3    call        TObject.Free
 000214A8    mov         eax,dword ptr [ebp-4]
 000214AB    mov         ebx,dword ptr [eax+8]
 000214AE    cmp         dword ptr [ebx+8],0
>000214B2    jg          0002149C
 000214B4    xor         eax,eax
 000214B6    pop         edx
 000214B7    pop         ecx
 000214B8    pop         ecx
 000214B9    mov         dword ptr fs:[eax],edx
 000214BC    push        214D1
 000214C1    mov         eax,dword ptr [ebp-4]
 000214C4    mov         edx,dword ptr [eax]
 000214C6    call        dword ptr [edx+18]
 000214C9    ret
>000214CA    jmp         @HandleFinally
>000214CF    jmp         000214C1
 000214D1    pop         ebx
 000214D2    pop         ecx
 000214D3    pop         ebp
 000214D4    ret
*}
end;

//000214D8
procedure TCollection.EndUpdate;
begin
{*
 000214D8    dec         dword ptr [eax+0C]
 000214DB    call        TCollection.Changed
 000214E0    ret
*}
end;

//000214E4
function TCollection.FindItemID(ID:Integer):TCollectionItem;
begin
{*
 000214E4    push        ebx
 000214E5    push        esi
 000214E6    push        edi
 000214E7    push        ebp
 000214E8    mov         ebp,edx
 000214EA    mov         edi,eax
 000214EC    mov         eax,dword ptr [edi+8]
 000214EF    mov         ebx,dword ptr [eax+8]
 000214F2    dec         ebx
 000214F3    test        ebx,ebx
>000214F5    jl          0002150D
 000214F7    inc         ebx
 000214F8    xor         esi,esi
 000214FA    mov         eax,dword ptr [edi+8]
 000214FD    mov         edx,esi
 000214FF    call        TList.Get
 00021504    cmp         ebp,dword ptr [eax+8]
>00021507    je          0002150F
 00021509    inc         esi
 0002150A    dec         ebx
>0002150B    jne         000214FA
 0002150D    xor         eax,eax
 0002150F    pop         ebp
 00021510    pop         edi
 00021511    pop         esi
 00021512    pop         ebx
 00021513    ret
*}
end;

//00021514
procedure TCollection.sub_00021514;
begin
{*
 00021514    xor         eax,eax
 00021516    ret
*}
end;

//00021518
procedure TCollection.GetAttr(Index:Integer);
begin
{*
 00021518    push        ebx
 00021519    mov         ebx,ecx
 0002151B    mov         eax,ebx
 0002151D    call        @LStrClr
 00021522    pop         ebx
 00021523    ret
*}
end;

//00021524
procedure TCollection.GetItemAttr(Index:Integer; ItemIndex:Integer);
begin
{*
 00021524    push        ebp
 00021525    mov         ebp,esp
 00021527    push        ebx
 00021528    push        esi
 00021529    mov         esi,ecx
 0002152B    mov         ebx,eax
 0002152D    mov         edx,esi
 0002152F    mov         eax,ebx
 00021531    call        TCollection.GetItem
 00021536    mov         edx,dword ptr [ebp+8]
 00021539    mov         ecx,dword ptr [eax]
 0002153B    call        dword ptr [ecx+0C]
 0002153E    pop         esi
 0002153F    pop         ebx
 00021540    pop         ebp
 00021541    ret         4
*}
end;

//00021544
function TCollection.GetCount:Integer;
begin
{*
 00021544    mov         eax,dword ptr [eax+8]
 00021547    mov         eax,dword ptr [eax+8]
 0002154A    ret
*}
end;

//0002154C
function TCollection.GetItem(Index:Integer):TCollectionItem;
begin
{*
 0002154C    push        ebx
 0002154D    push        esi
 0002154E    mov         esi,edx
 00021550    mov         ebx,eax
 00021552    mov         edx,esi
 00021554    mov         eax,dword ptr [ebx+8]
 00021557    call        TList.Get
 0002155C    pop         esi
 0002155D    pop         ebx
 0002155E    ret
*}
end;

//00021560
procedure TCollection.GetNamePath;
begin
{*
 00021560    push        ebp
 00021561    mov         ebp,esp
 00021563    add         esp,0FFFFFEF8
 00021569    push        ebx
 0002156A    push        esi
 0002156B    push        edi
 0002156C    xor         ecx,ecx
 0002156E    mov         dword ptr [ebp-4],ecx
 00021571    mov         dword ptr [ebp-8],ecx
 00021574    mov         edi,edx
 00021576    mov         esi,eax
 00021578    xor         eax,eax
 0002157A    push        ebp
 0002157B    push        2160E
 00021580    push        dword ptr fs:[eax]
 00021583    mov         dword ptr fs:[eax],esp
 00021586    lea         edx,[ebp-108]
 0002158C    mov         eax,dword ptr [esi]
 0002158E    call        TObject.ClassName
 00021593    lea         edx,[ebp-108]
 00021599    mov         eax,edi
 0002159B    call        @LStrFromString
 000215A0    mov         eax,esi
 000215A2    mov         bx,0FFFF
 000215A6    call        @CallDynaInst
 000215AB    test        eax,eax
>000215AD    je          000215F3
 000215AF    mov         eax,esi
 000215B1    mov         bx,0FFFF
 000215B5    call        @CallDynaInst
 000215BA    lea         edx,[ebp-4]
 000215BD    mov         bx,0FFFE
 000215C1    call        @CallDynaInst
 000215C6    cmp         dword ptr [ebp-4],0
>000215CA    je          000215F3
 000215CC    lea         edx,[ebp-8]
 000215CF    mov         eax,esi
 000215D1    call        TCollection.GetPropName
 000215D6    cmp         dword ptr [ebp-8],0
>000215DA    je          000215F3
 000215DC    push        dword ptr [ebp-4]
 000215DF    push        21624;'.'
 000215E4    push        dword ptr [ebp-8]
 000215E7    mov         eax,edi
 000215E9    mov         edx,3
 000215EE    call        @LStrCatN
 000215F3    xor         eax,eax
 000215F5    pop         edx
 000215F6    pop         ecx
 000215F7    pop         ecx
 000215F8    mov         dword ptr fs:[eax],edx
 000215FB    push        21615
 00021600    lea         eax,[ebp-8]
 00021603    mov         edx,2
 00021608    call        @LStrArrayClr
 0002160D    ret
>0002160E    jmp         @HandleFinally
>00021613    jmp         00021600
 00021615    pop         edi
 00021616    pop         esi
 00021617    pop         ebx
 00021618    mov         esp,ebp
 0002161A    pop         ebp
 0002161B    ret
*}
end;

//00021628
function TCollection.GetPropName:AnsiString;
begin
{*
 00021628    push        ebp
 00021629    mov         ebp,esp
 0002162B    add         esp,0FFFFFFF0
 0002162E    push        ebx
 0002162F    push        esi
 00021630    push        edi
 00021631    mov         dword ptr [ebp-8],edx
 00021634    mov         dword ptr [ebp-4],eax
 00021637    mov         eax,dword ptr [ebp-8]
 0002163A    mov         edx,dword ptr [ebp-4]
 0002163D    mov         edx,dword ptr [edx+14]
 00021640    call        @LStrLAsg
 00021645    mov         eax,dword ptr [ebp-4]
 00021648    mov         bx,0FFFF
 0002164C    call        @CallDynaInst
 00021651    mov         dword ptr [ebp-10],eax
 00021654    mov         eax,dword ptr [ebp-8]
 00021657    cmp         dword ptr [eax],0
>0002165A    jne         0002173A
 00021660    cmp         dword ptr [ebp-10],0
>00021664    je          0002173A
 0002166A    mov         eax,dword ptr [ebp-10]
 0002166D    mov         eax,dword ptr [eax]
 0002166F    call        TObject.ClassInfo
 00021674    test        eax,eax
>00021676    je          0002173A
 0002167C    mov         eax,dword ptr [ebp-10]
 0002167F    mov         eax,dword ptr [eax]
 00021681    call        TObject.ClassInfo
 00021686    call        GetTypeData
 0002168B    mov         ebx,eax
 0002168D    test        ebx,ebx
>0002168F    je          0002173A
 00021695    cmp         word ptr [ebx+8],0
>0002169A    je          0002173A
 000216A0    movsx       eax,word ptr [ebx+8]
 000216A4    shl         eax,2
 000216A7    call        @GetMem
 000216AC    mov         dword ptr [ebp-0C],eax
 000216AF    xor         eax,eax
 000216B1    push        ebp
 000216B2    push        21725
 000216B7    push        dword ptr fs:[eax]
 000216BA    mov         dword ptr fs:[eax],esp
 000216BD    mov         eax,dword ptr [ebp-10]
 000216C0    mov         eax,dword ptr [eax]
 000216C2    call        TObject.ClassInfo
 000216C7    mov         edx,dword ptr [ebp-0C]
 000216CA    call        GetPropInfos
 000216CF    movsx       edi,word ptr [ebx+8]
 000216D3    dec         edi
 000216D4    test        edi,edi
>000216D6    jl          0002170F
 000216D8    inc         edi
 000216D9    xor         ebx,ebx
 000216DB    mov         eax,dword ptr [ebp-0C]
 000216DE    mov         esi,dword ptr [eax+ebx*4]
 000216E1    mov         eax,dword ptr [esi]
 000216E3    mov         eax,dword ptr [eax]
 000216E5    cmp         byte ptr [eax],7
>000216E8    jne         0002170B
 000216EA    mov         eax,dword ptr [ebp-0C]
 000216ED    mov         edx,dword ptr [eax+ebx*4]
 000216F0    mov         eax,dword ptr [ebp-10]
 000216F3    call        GetOrdProp
 000216F8    cmp         eax,dword ptr [ebp-4]
>000216FB    jne         0002170B
 000216FD    mov         eax,dword ptr [ebp-4]
 00021700    add         eax,14
 00021703    lea         edx,[esi+1A]
 00021706    call        @LStrFromString
 0002170B    inc         ebx
 0002170C    dec         edi
>0002170D    jne         000216DB
 0002170F    xor         eax,eax
 00021711    pop         edx
 00021712    pop         ecx
 00021713    pop         ecx
 00021714    mov         dword ptr fs:[eax],edx
 00021717    push        2172C
 0002171C    mov         eax,dword ptr [ebp-0C]
 0002171F    call        @FreeMem
 00021724    ret
>00021725    jmp         @HandleFinally
>0002172A    jmp         0002171C
 0002172C    mov         eax,dword ptr [ebp-8]
 0002172F    mov         edx,dword ptr [ebp-4]
 00021732    mov         edx,dword ptr [edx+14]
 00021735    call        @LStrLAsg
 0002173A    pop         edi
 0002173B    pop         esi
 0002173C    pop         ebx
 0002173D    mov         esp,ebp
 0002173F    pop         ebp
 00021740    ret
*}
end;

//00021744
procedure GetDesigner(Obj:TPersistent; var Result:IDesignerNotify);
begin
{*
 00021744    push        ebp
 00021745    mov         ebp,esp
 00021747    push        ebx
 00021748    push        esi
 00021749    push        edi
 0002174A    mov         edi,edx
 0002174C    mov         esi,eax
 0002174E    test        edi,edi
>00021750    je          00021756
 00021752    xor         eax,eax
 00021754    mov         dword ptr [edi],eax
 00021756    mov         eax,edi
 00021758    call        @IntfClear
 0002175D    test        esi,esi
>0002175F    je          000217C5
 00021761    mov         eax,esi
 00021763    mov         bx,0FFFF
 00021767    call        @CallDynaInst
 0002176C    mov         ebx,eax
 0002176E    test        ebx,ebx
>00021770    jne         0002179E
 00021772    mov         eax,esi
 00021774    mov         edx,dword ptr ds:[1FA0C];TComponent
 0002177A    call        @IsClass
 0002177F    test        al,al
>00021781    je          000217C5
 00021783    test        byte ptr [esi+20],10
>00021787    je          000217C5
 00021789    mov         eax,edi
 0002178B    call        @IntfClear
 00021790    push        eax
 00021791    push        217CC
 00021796    push        esi
 00021797    mov         eax,dword ptr [esi]
 00021799    call        dword ptr [eax+28]
>0002179C    jmp         000217C5
 0002179E    mov         eax,esi
 000217A0    mov         edx,dword ptr ds:[1FA0C];TComponent
 000217A6    call        @IsClass
 000217AB    test        al,al
>000217AD    je          000217B5
 000217AF    test        byte ptr [esi+20],10
>000217B3    je          000217C5
 000217B5    mov         eax,edi
 000217B7    call        @IntfClear
 000217BC    mov         edx,eax
 000217BE    mov         eax,ebx
 000217C0    call        GetDesigner
 000217C5    pop         edi
 000217C6    pop         esi
 000217C7    pop         ebx
 000217C8    pop         ebp
 000217C9    ret
*}
end;

//000217DC
procedure NotifyDesigner(Self:TPersistent; Item:TPersistent; Operation:TOperation);
begin
{*
 000217DC    push        ebp
 000217DD    mov         ebp,esp
 000217DF    push        0
 000217E1    push        ebx
 000217E2    push        esi
 000217E3    push        edi
 000217E4    mov         ebx,ecx
 000217E6    mov         esi,edx
 000217E8    mov         edi,eax
 000217EA    xor         eax,eax
 000217EC    push        ebp
 000217ED    push        21831
 000217F2    push        dword ptr fs:[eax]
 000217F5    mov         dword ptr fs:[eax],esp
 000217F8    lea         eax,[ebp-4]
 000217FB    call        @IntfClear
 00021800    mov         edx,eax
 00021802    mov         eax,edi
 00021804    call        GetDesigner
 00021809    cmp         dword ptr [ebp-4],0
>0002180D    je          0002181B
 0002180F    mov         ecx,ebx
 00021811    mov         edx,esi
 00021813    mov         eax,dword ptr [ebp-4]
 00021816    mov         ebx,dword ptr [eax]
 00021818    call        dword ptr [ebx+10]
 0002181B    xor         eax,eax
 0002181D    pop         edx
 0002181E    pop         ecx
 0002181F    pop         ecx
 00021820    mov         dword ptr fs:[eax],edx
 00021823    push        21838
 00021828    lea         eax,[ebp-4]
 0002182B    call        @IntfClear
 00021830    ret
>00021831    jmp         @HandleFinally
>00021836    jmp         00021828
 00021838    pop         edi
 00021839    pop         esi
 0002183A    pop         ebx
 0002183B    pop         ecx
 0002183C    pop         ebp
 0002183D    ret
*}
end;

//00021840
procedure TCollection.InsertItem(Item:TCollectionItem);
begin
{*
 00021840    push        ebp
 00021841    mov         ebp,esp
 00021843    push        0
 00021845    push        ebx
 00021846    push        esi
 00021847    mov         esi,edx
 00021849    mov         ebx,eax
 0002184B    xor         eax,eax
 0002184D    push        ebp
 0002184E    push        218CA
 00021853    push        dword ptr fs:[eax]
 00021856    mov         dword ptr fs:[eax],esp
 00021859    mov         eax,esi
 0002185B    mov         edx,dword ptr [ebx+4]
 0002185E    call        @IsClass
 00021863    test        al,al
>00021865    jne         00021883
 00021867    lea         edx,[ebp-4]
 0002186A    mov         eax,[000B59B8];^SInvalidProperty:TResStringRec
 0002186F    call        LoadResString
 00021874    mov         edx,dword ptr [ebp-4]
 00021877    xor         ecx,ecx
 00021879    mov         eax,[0001EEC4];TList
 0002187E    call        TList.Error
 00021883    mov         edx,esi
 00021885    mov         eax,dword ptr [ebx+8]
 00021888    call        TList.Add
 0002188D    mov         dword ptr [esi+4],ebx
 00021890    mov         eax,dword ptr [ebx+10]
 00021893    mov         dword ptr [esi+8],eax
 00021896    inc         dword ptr [ebx+10]
 00021899    mov         edx,esi
 0002189B    mov         eax,ebx
 0002189D    mov         ecx,dword ptr [eax]
 0002189F    call        dword ptr [ecx+0C]
 000218A2    mov         eax,ebx
 000218A4    call        TCollection.Changed
 000218A9    xor         ecx,ecx
 000218AB    mov         edx,esi
 000218AD    mov         eax,ebx
 000218AF    call        NotifyDesigner
 000218B4    xor         eax,eax
 000218B6    pop         edx
 000218B7    pop         ecx
 000218B8    pop         ecx
 000218B9    mov         dword ptr fs:[eax],edx
 000218BC    push        218D1
 000218C1    lea         eax,[ebp-4]
 000218C4    call        @LStrClr
 000218C9    ret
>000218CA    jmp         @HandleFinally
>000218CF    jmp         000218C1
 000218D1    pop         esi
 000218D2    pop         ebx
 000218D3    pop         ecx
 000218D4    pop         ebp
 000218D5    ret
*}
end;

//000218D8
procedure TCollection.RemoveItem(Item:TCollectionItem);
begin
{*
 000218D8    push        ebx
 000218D9    push        esi
 000218DA    mov         esi,edx
 000218DC    mov         ebx,eax
 000218DE    mov         cl,1
 000218E0    mov         edx,esi
 000218E2    mov         eax,ebx
 000218E4    call        NotifyDesigner
 000218E9    mov         edx,esi
 000218EB    mov         eax,dword ptr [ebx+8]
 000218EE    call        TList.Remove
 000218F3    xor         eax,eax
 000218F5    mov         dword ptr [esi+4],eax
 000218F8    mov         eax,ebx
 000218FA    call        TCollection.Changed
 000218FF    pop         esi
 00021900    pop         ebx
 00021901    ret
*}
end;

//00021904
procedure sub_00021904;
begin
{*
 00021904    ret
*}
end;

//00021908
procedure sub_00021908;
begin
{*
 00021908    ret
*}
end;

//0002190C
destructor TStrings.Destroy;
begin
{*
 0002190C    push        ebx
 0002190D    push        esi
 0002190E    call        @BeforeDestruction
 00021913    mov         ebx,edx
 00021915    mov         esi,eax
 00021917    xor         edx,edx
 00021919    mov         eax,esi
 0002191B    call        TStrings.SetStringsAdapter
 00021920    mov         edx,ebx
 00021922    and         dl,0FC
 00021925    mov         eax,esi
 00021927    call        TMemoryStream.Destroy
 0002192C    test        bl,bl
>0002192E    jle         00021937
 00021930    mov         eax,esi
 00021932    call        @ClassDestroy
 00021937    pop         esi
 00021938    pop         ebx
 00021939    ret
*}
end;

//0002193C
function TStrings.Add(const S:AnsiString):Integer;
begin
{*
 0002193C    push        ebx
 0002193D    push        esi
 0002193E    push        edi
 0002193F    mov         edi,edx
 00021941    mov         ebx,eax
 00021943    mov         eax,ebx
 00021945    mov         edx,dword ptr [eax]
 00021947    call        dword ptr [edx+14]
 0002194A    mov         esi,eax
 0002194C    mov         ecx,edi
 0002194E    mov         edx,esi
 00021950    mov         eax,ebx
 00021952    mov         ebx,dword ptr [eax]
 00021954    call        dword ptr [ebx+54]
 00021957    mov         eax,esi
 00021959    pop         edi
 0002195A    pop         esi
 0002195B    pop         ebx
 0002195C    ret
*}
end;

//00021960
function TStrings.AddObject(const S:AnsiString; AObject:TObject):Integer;
begin
{*
 00021960    push        ebx
 00021961    push        esi
 00021962    push        edi
 00021963    mov         edi,ecx
 00021965    mov         ebx,eax
 00021967    mov         eax,ebx
 00021969    mov         ecx,dword ptr [eax]
 0002196B    call        dword ptr [ecx+34]
 0002196E    mov         esi,eax
 00021970    mov         ecx,edi
 00021972    mov         edx,esi
 00021974    mov         eax,ebx
 00021976    mov         ebx,dword ptr [eax]
 00021978    call        dword ptr [ebx+24]
 0002197B    mov         eax,esi
 0002197D    pop         edi
 0002197E    pop         esi
 0002197F    pop         ebx
 00021980    ret
*}
end;

//00021984
procedure TStrings.AddStrings(Strings:TStrings);
begin
{*
 00021984    push        ebp
 00021985    mov         ebp,esp
 00021987    add         esp,0FFFFFFF4
 0002198A    push        ebx
 0002198B    push        esi
 0002198C    push        edi
 0002198D    xor         ecx,ecx
 0002198F    mov         dword ptr [ebp-0C],ecx
 00021992    mov         dword ptr [ebp-8],edx
 00021995    mov         dword ptr [ebp-4],eax
 00021998    xor         eax,eax
 0002199A    push        ebp
 0002199B    push        21A2B
 000219A0    push        dword ptr fs:[eax]
 000219A3    mov         dword ptr fs:[eax],esp
 000219A6    mov         eax,dword ptr [ebp-4]
 000219A9    call        TStrings.BeginUpdate
 000219AE    xor         eax,eax
 000219B0    push        ebp
 000219B1    push        21A0E
 000219B6    push        dword ptr fs:[eax]
 000219B9    mov         dword ptr fs:[eax],esp
 000219BC    mov         eax,dword ptr [ebp-8]
 000219BF    mov         edx,dword ptr [eax]
 000219C1    call        dword ptr [edx+14]
 000219C4    mov         esi,eax
 000219C6    dec         esi
 000219C7    test        esi,esi
>000219C9    jl          000219F8
 000219CB    inc         esi
 000219CC    xor         ebx,ebx
 000219CE    lea         ecx,[ebp-0C]
 000219D1    mov         edx,ebx
 000219D3    mov         eax,dword ptr [ebp-8]
 000219D6    mov         edi,dword ptr [eax]
 000219D8    call        dword ptr [edi+0C]
 000219DB    mov         eax,dword ptr [ebp-0C]
 000219DE    push        eax
 000219DF    mov         edx,ebx
 000219E1    mov         eax,dword ptr [ebp-8]
 000219E4    mov         ecx,dword ptr [eax]
 000219E6    call        dword ptr [ecx+18]
 000219E9    mov         ecx,eax
 000219EB    mov         eax,dword ptr [ebp-4]
 000219EE    pop         edx
 000219EF    mov         edi,dword ptr [eax]
 000219F1    call        dword ptr [edi+38]
 000219F4    inc         ebx
 000219F5    dec         esi
>000219F6    jne         000219CE
 000219F8    xor         eax,eax
 000219FA    pop         edx
 000219FB    pop         ecx
 000219FC    pop         ecx
 000219FD    mov         dword ptr fs:[eax],edx
 00021A00    push        21A15
 00021A05    mov         eax,dword ptr [ebp-4]
 00021A08    call        TStrings.EndUpdate
 00021A0D    ret
>00021A0E    jmp         @HandleFinally
>00021A13    jmp         00021A05
 00021A15    xor         eax,eax
 00021A17    pop         edx
 00021A18    pop         ecx
 00021A19    pop         ecx
 00021A1A    mov         dword ptr fs:[eax],edx
 00021A1D    push        21A32
 00021A22    lea         eax,[ebp-0C]
 00021A25    call        @LStrClr
 00021A2A    ret
>00021A2B    jmp         @HandleFinally
>00021A30    jmp         00021A22
 00021A32    pop         edi
 00021A33    pop         esi
 00021A34    pop         ebx
 00021A35    mov         esp,ebp
 00021A37    pop         ebp
 00021A38    ret
*}
end;

//00021A3C
procedure TStrings.Assign(Source:TPersistent);
begin
{*
 00021A3C    push        ebp
 00021A3D    mov         ebp,esp
 00021A3F    push        ecx
 00021A40    push        ebx
 00021A41    mov         ebx,edx
 00021A43    mov         dword ptr [ebp-4],eax
 00021A46    mov         eax,ebx
 00021A48    mov         edx,dword ptr ds:[1F220];TStrings
 00021A4E    call        @IsClass
 00021A53    test        al,al
>00021A55    je          00021A9C
 00021A57    mov         eax,dword ptr [ebp-4]
 00021A5A    call        TStrings.BeginUpdate
 00021A5F    xor         eax,eax
 00021A61    push        ebp
 00021A62    push        21A95
 00021A67    push        dword ptr fs:[eax]
 00021A6A    mov         dword ptr fs:[eax],esp
 00021A6D    mov         eax,dword ptr [ebp-4]
 00021A70    mov         edx,dword ptr [eax]
 00021A72    call        dword ptr [edx+40]
 00021A75    mov         edx,ebx
 00021A77    mov         eax,dword ptr [ebp-4]
 00021A7A    mov         ecx,dword ptr [eax]
 00021A7C    call        dword ptr [ecx+3C]
 00021A7F    xor         eax,eax
 00021A81    pop         edx
 00021A82    pop         ecx
 00021A83    pop         ecx
 00021A84    mov         dword ptr fs:[eax],edx
 00021A87    push        21AA6
 00021A8C    mov         eax,dword ptr [ebp-4]
 00021A8F    call        TStrings.EndUpdate
 00021A94    ret
>00021A95    jmp         @HandleFinally
>00021A9A    jmp         00021A8C
 00021A9C    mov         edx,ebx
 00021A9E    mov         eax,dword ptr [ebp-4]
 00021AA1    call        TPersistent.Assign
 00021AA6    pop         ebx
 00021AA7    pop         ecx
 00021AA8    pop         ebp
 00021AA9    ret
*}
end;

//00021AAC
procedure TStrings.BeginUpdate;
begin
{*
 00021AAC    push        ebx
 00021AAD    mov         ebx,eax
 00021AAF    cmp         dword ptr [ebx+4],0
>00021AB3    jne         00021ABE
 00021AB5    mov         dl,1
 00021AB7    mov         eax,ebx
 00021AB9    mov         ecx,dword ptr [eax]
 00021ABB    call        dword ptr [ecx+30]
 00021ABE    inc         dword ptr [ebx+4]
 00021AC1    pop         ebx
 00021AC2    ret
*}
end;

//00021AC4
function DoWrite:Boolean;
begin
{*
 00021AC4    push        ebp
 00021AC5    mov         ebp,esp
 00021AC7    push        ebx
 00021AC8    push        esi
 00021AC9    mov         eax,dword ptr [ebp+8]
 00021ACC    mov         eax,dword ptr [eax-4]
 00021ACF    mov         esi,dword ptr [eax+1C]
 00021AD2    test        esi,esi
>00021AD4    je          00021B03
 00021AD6    mov         bl,1
 00021AD8    mov         eax,dword ptr [ebp+8]
 00021ADB    mov         eax,esi
 00021ADD    mov         edx,dword ptr ds:[1F220];TStrings
 00021AE3    call        @IsClass
 00021AE8    test        al,al
>00021AEA    je          00021B13
 00021AEC    mov         eax,dword ptr [ebp+8]
 00021AEF    mov         edx,esi
 00021AF1    mov         eax,dword ptr [ebp+8]
 00021AF4    mov         eax,dword ptr [eax-8]
 00021AF7    call        TStrings.Equals
 00021AFC    mov         ebx,eax
 00021AFE    xor         bl,1
>00021B01    jmp         00021B13
 00021B03    mov         eax,dword ptr [ebp+8]
 00021B06    mov         eax,dword ptr [eax-8]
 00021B09    mov         edx,dword ptr [eax]
 00021B0B    call        dword ptr [edx+14]
 00021B0E    test        eax,eax
 00021B10    setg        bl
 00021B13    mov         eax,ebx
 00021B15    pop         esi
 00021B16    pop         ebx
 00021B17    pop         ebp
 00021B18    ret
*}
end;

//00021B1C
procedure TStrings.DefineProperties(Filer:TFiler);
begin
{*
 00021B1C    push        ebp
 00021B1D    mov         ebp,esp
 00021B1F    add         esp,0FFFFFFF8
 00021B22    push        ebx
 00021B23    mov         dword ptr [ebp-4],edx
 00021B26    mov         dword ptr [ebp-8],eax
 00021B29    mov         eax,dword ptr [ebp-8]
 00021B2C    push        eax
 00021B2D    push        222C0;TStrings.ReadData
 00021B32    mov         eax,dword ptr [ebp-8]
 00021B35    push        eax
 00021B36    push        22614;TStrings.WriteData
 00021B3B    push        ebp
 00021B3C    call        DoWrite
 00021B41    pop         ecx
 00021B42    mov         ecx,eax
 00021B44    mov         edx,21B60;'Strings'
 00021B49    mov         eax,dword ptr [ebp-4]
 00021B4C    mov         ebx,dword ptr [eax]
 00021B4E    call        dword ptr [ebx]
 00021B50    pop         ebx
 00021B51    pop         ecx
 00021B52    pop         ecx
 00021B53    pop         ebp
 00021B54    ret
*}
end;

//00021B68
procedure TStrings.EndUpdate;
begin
{*
 00021B68    dec         dword ptr [eax+4]
 00021B6B    cmp         dword ptr [eax+4],0
>00021B6F    jne         00021B78
 00021B71    xor         edx,edx
 00021B73    mov         ecx,dword ptr [eax]
 00021B75    call        dword ptr [ecx+30]
 00021B78    ret
*}
end;

//00021B7C
function TStrings.Equals(Strings:TStrings):Boolean;
begin
{*
 00021B7C    push        ebp
 00021B7D    mov         ebp,esp
 00021B7F    add         esp,0FFFFFFEC
 00021B82    push        ebx
 00021B83    push        esi
 00021B84    push        edi
 00021B85    xor         ecx,ecx
 00021B87    mov         dword ptr [ebp-10],ecx
 00021B8A    mov         dword ptr [ebp-14],ecx
 00021B8D    mov         dword ptr [ebp-8],edx
 00021B90    mov         dword ptr [ebp-4],eax
 00021B93    xor         eax,eax
 00021B95    push        ebp
 00021B96    push        21C11
 00021B9B    push        dword ptr fs:[eax]
 00021B9E    mov         dword ptr fs:[eax],esp
 00021BA1    mov         byte ptr [ebp-9],0
 00021BA5    mov         eax,dword ptr [ebp-4]
 00021BA8    mov         edx,dword ptr [eax]
 00021BAA    call        dword ptr [edx+14]
 00021BAD    mov         ebx,eax
 00021BAF    mov         eax,dword ptr [ebp-8]
 00021BB2    mov         edx,dword ptr [eax]
 00021BB4    call        dword ptr [edx+14]
 00021BB7    cmp         ebx,eax
>00021BB9    jne         00021BF6
 00021BBB    mov         esi,ebx
 00021BBD    dec         esi
 00021BBE    test        esi,esi
>00021BC0    jl          00021BF2
 00021BC2    inc         esi
 00021BC3    xor         ebx,ebx
 00021BC5    lea         ecx,[ebp-10]
 00021BC8    mov         edx,ebx
 00021BCA    mov         eax,dword ptr [ebp-4]
 00021BCD    mov         edi,dword ptr [eax]
 00021BCF    call        dword ptr [edi+0C]
 00021BD2    mov         eax,dword ptr [ebp-10]
 00021BD5    push        eax
 00021BD6    lea         ecx,[ebp-14]
 00021BD9    mov         edx,ebx
 00021BDB    mov         eax,dword ptr [ebp-8]
 00021BDE    mov         edi,dword ptr [eax]
 00021BE0    call        dword ptr [edi+0C]
 00021BE3    mov         edx,dword ptr [ebp-14]
 00021BE6    pop         eax
 00021BE7    call        @LStrCmp
>00021BEC    jne         00021BF6
 00021BEE    inc         ebx
 00021BEF    dec         esi
>00021BF0    jne         00021BC5
 00021BF2    mov         byte ptr [ebp-9],1
 00021BF6    xor         eax,eax
 00021BF8    pop         edx
 00021BF9    pop         ecx
 00021BFA    pop         ecx
 00021BFB    mov         dword ptr fs:[eax],edx
 00021BFE    push        21C18
 00021C03    lea         eax,[ebp-14]
 00021C06    mov         edx,2
 00021C0B    call        @LStrArrayClr
 00021C10    ret
>00021C11    jmp         @HandleFinally
>00021C16    jmp         00021C03
 00021C18    mov         al,byte ptr [ebp-9]
 00021C1B    pop         edi
 00021C1C    pop         esi
 00021C1D    pop         ebx
 00021C1E    mov         esp,ebp
 00021C20    pop         ebp
 00021C21    ret
*}
end;

//00021C24
{*function sub_00021C24:?;
begin
 00021C24    mov         eax,dword ptr [ebp+4]
 00021C27    ret
end;*}

//00021C28
procedure TStrings.Error(const Msg:AnsiString; Data:Integer);
begin
{*
 00021C28    push        ebx
 00021C29    push        esi
 00021C2A    add         esp,0FFFFFFF8
 00021C2D    mov         esi,ecx
 00021C2F    mov         ebx,edx
 00021C31    call        00021C24
 00021C36    push        eax
 00021C37    mov         dword ptr [esp+4],esi
 00021C3B    mov         byte ptr [esp+8],0
 00021C40    lea         eax,[esp+4]
 00021C44    push        eax
 00021C45    push        0
 00021C47    mov         ecx,ebx
 00021C49    mov         dl,1
 00021C4B    mov         eax,[0001ED4C];EStringListError
 00021C50    call        Exception.CreateFmt
>00021C55    jmp         @RaiseExcept
 00021C5A    pop         ecx
 00021C5B    pop         edx
 00021C5C    pop         esi
 00021C5D    pop         ebx
 00021C5E    ret
*}
end;

//00021C60
procedure TStrings.Exchange(Index1:Integer; Index2:Integer);
begin
{*
 00021C60    push        ebp
 00021C61    mov         ebp,esp
 00021C63    add         esp,0FFFFFFF0
 00021C66    push        ebx
 00021C67    push        esi
 00021C68    push        edi
 00021C69    xor         ebx,ebx
 00021C6B    mov         dword ptr [ebp-10],ebx
 00021C6E    mov         dword ptr [ebp-0C],ebx
 00021C71    mov         esi,ecx
 00021C73    mov         ebx,edx
 00021C75    mov         dword ptr [ebp-4],eax
 00021C78    xor         eax,eax
 00021C7A    push        ebp
 00021C7B    push        21D38
 00021C80    push        dword ptr fs:[eax]
 00021C83    mov         dword ptr fs:[eax],esp
 00021C86    mov         eax,dword ptr [ebp-4]
 00021C89    call        TStrings.BeginUpdate
 00021C8E    xor         eax,eax
 00021C90    push        ebp
 00021C91    push        21D16
 00021C96    push        dword ptr fs:[eax]
 00021C99    mov         dword ptr fs:[eax],esp
 00021C9C    lea         ecx,[ebp-0C]
 00021C9F    mov         edx,ebx
 00021CA1    mov         eax,dword ptr [ebp-4]
 00021CA4    mov         edi,dword ptr [eax]
 00021CA6    call        dword ptr [edi+0C]
 00021CA9    mov         edx,ebx
 00021CAB    mov         eax,dword ptr [ebp-4]
 00021CAE    mov         ecx,dword ptr [eax]
 00021CB0    call        dword ptr [ecx+18]
 00021CB3    mov         dword ptr [ebp-8],eax
 00021CB6    lea         ecx,[ebp-10]
 00021CB9    mov         edx,esi
 00021CBB    mov         eax,dword ptr [ebp-4]
 00021CBE    mov         edi,dword ptr [eax]
 00021CC0    call        dword ptr [edi+0C]
 00021CC3    mov         ecx,dword ptr [ebp-10]
 00021CC6    mov         edx,ebx
 00021CC8    mov         eax,dword ptr [ebp-4]
 00021CCB    mov         edi,dword ptr [eax]
 00021CCD    call        dword ptr [edi+20]
 00021CD0    mov         edx,esi
 00021CD2    mov         eax,dword ptr [ebp-4]
 00021CD5    mov         ecx,dword ptr [eax]
 00021CD7    call        dword ptr [ecx+18]
 00021CDA    mov         ecx,eax
 00021CDC    mov         edx,ebx
 00021CDE    mov         eax,dword ptr [ebp-4]
 00021CE1    mov         ebx,dword ptr [eax]
 00021CE3    call        dword ptr [ebx+24]
 00021CE6    mov         ecx,dword ptr [ebp-0C]
 00021CE9    mov         edx,esi
 00021CEB    mov         eax,dword ptr [ebp-4]
 00021CEE    mov         ebx,dword ptr [eax]
 00021CF0    call        dword ptr [ebx+20]
 00021CF3    mov         ecx,dword ptr [ebp-8]
 00021CF6    mov         edx,esi
 00021CF8    mov         eax,dword ptr [ebp-4]
 00021CFB    mov         ebx,dword ptr [eax]
 00021CFD    call        dword ptr [ebx+24]
 00021D00    xor         eax,eax
 00021D02    pop         edx
 00021D03    pop         ecx
 00021D04    pop         ecx
 00021D05    mov         dword ptr fs:[eax],edx
 00021D08    push        21D1D
 00021D0D    mov         eax,dword ptr [ebp-4]
 00021D10    call        TStrings.EndUpdate
 00021D15    ret
>00021D16    jmp         @HandleFinally
>00021D1B    jmp         00021D0D
 00021D1D    xor         eax,eax
 00021D1F    pop         edx
 00021D20    pop         ecx
 00021D21    pop         ecx
 00021D22    mov         dword ptr fs:[eax],edx
 00021D25    push        21D3F
 00021D2A    lea         eax,[ebp-10]
 00021D2D    mov         edx,2
 00021D32    call        @LStrArrayClr
 00021D37    ret
>00021D38    jmp         @HandleFinally
>00021D3D    jmp         00021D2A
 00021D3F    pop         edi
 00021D40    pop         esi
 00021D41    pop         ebx
 00021D42    mov         esp,ebp
 00021D44    pop         ebp
 00021D45    ret
*}
end;

//00021D48
procedure sub_00021D48;
begin
{*
 00021D48    mov         edx,dword ptr [eax]
 00021D4A    call        dword ptr [edx+14];TStrings.GetCount
 00021D4D    ret
*}
end;

//00021D50
function TStrings.GetName(Index:Integer):AnsiString;
begin
{*
 00021D50    push        ebx
 00021D51    push        esi
 00021D52    push        edi
 00021D53    mov         ebx,ecx
 00021D55    mov         edi,edx
 00021D57    mov         esi,eax
 00021D59    mov         ecx,ebx
 00021D5B    mov         edx,edi
 00021D5D    mov         eax,esi
 00021D5F    mov         esi,dword ptr [eax]
 00021D61    call        dword ptr [esi+0C]
 00021D64    mov         edx,dword ptr [ebx]
 00021D66    mov         eax,21D98;'='
 00021D6B    call        AnsiPos
 00021D70    test        eax,eax
>00021D72    je          00021D80
 00021D74    mov         edx,eax
 00021D76    dec         edx
 00021D77    mov         eax,ebx
 00021D79    call        @LStrSetLength
>00021D7E    jmp         00021D89
 00021D80    mov         eax,ebx
 00021D82    xor         edx,edx
 00021D84    call        @LStrSetLength
 00021D89    pop         edi
 00021D8A    pop         esi
 00021D8B    pop         ebx
 00021D8C    ret
*}
end;

//00021D9C
{*function sub_00021D9C:?;
begin
 00021D9C    xor         eax,eax
 00021D9E    ret
end;*}

//00021DA0
function TStrings.GetText:PChar;
begin
{*
 00021DA0    push        ebp
 00021DA1    mov         ebp,esp
 00021DA3    push        0
 00021DA5    push        ebx
 00021DA6    mov         ebx,eax
 00021DA8    xor         eax,eax
 00021DAA    push        ebp
 00021DAB    push        21DE5
 00021DB0    push        dword ptr fs:[eax]
 00021DB3    mov         dword ptr fs:[eax],esp
 00021DB6    lea         edx,[ebp-4]
 00021DB9    mov         eax,ebx
 00021DBB    mov         ecx,dword ptr [eax]
 00021DBD    call        dword ptr [ecx+1C]
 00021DC0    mov         eax,dword ptr [ebp-4]
 00021DC3    call        @LStrToPChar
 00021DC8    call        StrNew
 00021DCD    mov         ebx,eax
 00021DCF    xor         eax,eax
 00021DD1    pop         edx
 00021DD2    pop         ecx
 00021DD3    pop         ecx
 00021DD4    mov         dword ptr fs:[eax],edx
 00021DD7    push        21DEC
 00021DDC    lea         eax,[ebp-4]
 00021DDF    call        @LStrClr
 00021DE4    ret
>00021DE5    jmp         @HandleFinally
>00021DEA    jmp         00021DDC
 00021DEC    mov         eax,ebx
 00021DEE    pop         ebx
 00021DEF    pop         ecx
 00021DF0    pop         ebp
 00021DF1    ret
*}
end;

//00021DF4
function TStrings.GetTextStr:AnsiString;
begin
{*
 00021DF4    push        ebp
 00021DF5    mov         ebp,esp
 00021DF7    add         esp,0FFFFFFE8
 00021DFA    push        ebx
 00021DFB    push        esi
 00021DFC    push        edi
 00021DFD    xor         ecx,ecx
 00021DFF    mov         dword ptr [ebp-18],ecx
 00021E02    mov         dword ptr [ebp-14],ecx
 00021E05    mov         dword ptr [ebp-8],edx
 00021E08    mov         dword ptr [ebp-4],eax
 00021E0B    xor         eax,eax
 00021E0D    push        ebp
 00021E0E    push        21ECB
 00021E13    push        dword ptr fs:[eax]
 00021E16    mov         dword ptr fs:[eax],esp
 00021E19    mov         eax,dword ptr [ebp-4]
 00021E1C    mov         edx,dword ptr [eax]
 00021E1E    call        dword ptr [edx+14]
 00021E21    mov         dword ptr [ebp-10],eax
 00021E24    xor         ebx,ebx
 00021E26    mov         esi,dword ptr [ebp-10]
 00021E29    dec         esi
 00021E2A    test        esi,esi
>00021E2C    jl          00021E57
 00021E2E    inc         esi
 00021E2F    mov         dword ptr [ebp-0C],0
 00021E36    lea         ecx,[ebp-18]
 00021E39    mov         edx,dword ptr [ebp-0C]
 00021E3C    mov         eax,dword ptr [ebp-4]
 00021E3F    mov         edi,dword ptr [eax]
 00021E41    call        dword ptr [edi+0C]
 00021E44    mov         eax,dword ptr [ebp-18]
 00021E47    call        @LStrLen
 00021E4C    add         eax,2
 00021E4F    add         ebx,eax
 00021E51    inc         dword ptr [ebp-0C]
 00021E54    dec         esi
>00021E55    jne         00021E36
 00021E57    mov         eax,dword ptr [ebp-8]
 00021E5A    mov         ecx,ebx
 00021E5C    xor         edx,edx
 00021E5E    call        @LStrFromPCharLen
 00021E63    mov         ebx,dword ptr [ebp-8]
 00021E66    mov         ebx,dword ptr [ebx]
 00021E68    mov         esi,dword ptr [ebp-10]
 00021E6B    dec         esi
 00021E6C    test        esi,esi
>00021E6E    jl          00021EB0
 00021E70    inc         esi
 00021E71    mov         dword ptr [ebp-0C],0
 00021E78    lea         ecx,[ebp-14]
 00021E7B    mov         edx,dword ptr [ebp-0C]
 00021E7E    mov         eax,dword ptr [ebp-4]
 00021E81    mov         edi,dword ptr [eax]
 00021E83    call        dword ptr [edi+0C]
 00021E86    mov         eax,dword ptr [ebp-14]
 00021E89    call        @LStrLen
 00021E8E    mov         edi,eax
 00021E90    test        edi,edi
>00021E92    je          00021EA2
 00021E94    mov         edx,ebx
 00021E96    mov         eax,dword ptr [ebp-14]
 00021E99    mov         ecx,edi
 00021E9B    call        Move
 00021EA0    add         ebx,edi
 00021EA2    mov         byte ptr [ebx],0D
 00021EA5    inc         ebx
 00021EA6    mov         byte ptr [ebx],0A
 00021EA9    inc         ebx
 00021EAA    inc         dword ptr [ebp-0C]
 00021EAD    dec         esi
>00021EAE    jne         00021E78
 00021EB0    xor         eax,eax
 00021EB2    pop         edx
 00021EB3    pop         ecx
 00021EB4    pop         ecx
 00021EB5    mov         dword ptr fs:[eax],edx
 00021EB8    push        21ED2
 00021EBD    lea         eax,[ebp-18]
 00021EC0    mov         edx,2
 00021EC5    call        @LStrArrayClr
 00021ECA    ret
>00021ECB    jmp         @HandleFinally
>00021ED0    jmp         00021EBD
 00021ED2    pop         edi
 00021ED3    pop         esi
 00021ED4    pop         ebx
 00021ED5    mov         esp,ebp
 00021ED7    pop         ebp
 00021ED8    ret
*}
end;

//00021EDC
function TStrings.GetValue(const Name:AnsiString):AnsiString;
begin
{*
 00021EDC    push        ebp
 00021EDD    mov         ebp,esp
 00021EDF    add         esp,0FFFFFFF4
 00021EE2    push        ebx
 00021EE3    push        esi
 00021EE4    xor         ebx,ebx
 00021EE6    mov         dword ptr [ebp-0C],ebx
 00021EE9    mov         dword ptr [ebp-8],ecx
 00021EEC    mov         dword ptr [ebp-4],edx
 00021EEF    mov         ebx,eax
 00021EF1    xor         eax,eax
 00021EF3    push        ebp
 00021EF4    push        21F5B
 00021EF9    push        dword ptr fs:[eax]
 00021EFC    mov         dword ptr fs:[eax],esp
 00021EFF    mov         edx,dword ptr [ebp-4]
 00021F02    mov         eax,ebx
 00021F04    call        TStrings.IndexOfName
 00021F09    mov         esi,eax
 00021F0B    test        esi,esi
>00021F0D    jl          00021F3D
 00021F0F    mov         eax,dword ptr [ebp-8]
 00021F12    push        eax
 00021F13    lea         ecx,[ebp-0C]
 00021F16    mov         edx,esi
 00021F18    mov         eax,ebx
 00021F1A    mov         ebx,dword ptr [eax]
 00021F1C    call        dword ptr [ebx+0C]
 00021F1F    mov         eax,dword ptr [ebp-0C]
 00021F22    push        eax
 00021F23    mov         eax,dword ptr [ebp-4]
 00021F26    call        @LStrLen
 00021F2B    mov         edx,eax
 00021F2D    add         edx,2
 00021F30    mov         ecx,7FFFFFFF
 00021F35    pop         eax
 00021F36    call        @LStrCopy
>00021F3B    jmp         00021F45
 00021F3D    mov         eax,dword ptr [ebp-8]
 00021F40    call        @LStrClr
 00021F45    xor         eax,eax
 00021F47    pop         edx
 00021F48    pop         ecx
 00021F49    pop         ecx
 00021F4A    mov         dword ptr fs:[eax],edx
 00021F4D    push        21F62
 00021F52    lea         eax,[ebp-0C]
 00021F55    call        @LStrClr
 00021F5A    ret
>00021F5B    jmp         @HandleFinally
>00021F60    jmp         00021F52
 00021F62    pop         esi
 00021F63    pop         ebx
 00021F64    mov         esp,ebp
 00021F66    pop         ebp
 00021F67    ret
*}
end;

//00021F68
function TStrings.IndexOf(const S:AnsiString):Integer;
begin
{*
 00021F68    push        ebp
 00021F69    mov         ebp,esp
 00021F6B    add         esp,0FFFFFFF4
 00021F6E    push        ebx
 00021F6F    push        esi
 00021F70    push        edi
 00021F71    xor         ecx,ecx
 00021F73    mov         dword ptr [ebp-0C],ecx
 00021F76    mov         dword ptr [ebp-8],edx
 00021F79    mov         dword ptr [ebp-4],eax
 00021F7C    xor         eax,eax
 00021F7E    push        ebp
 00021F7F    push        21FD5
 00021F84    push        dword ptr fs:[eax]
 00021F87    mov         dword ptr fs:[eax],esp
 00021F8A    mov         eax,dword ptr [ebp-4]
 00021F8D    mov         edx,dword ptr [eax]
 00021F8F    call        dword ptr [edx+14]
 00021F92    mov         ebx,eax
 00021F94    dec         ebx
 00021F95    test        ebx,ebx
>00021F97    jl          00021FBC
 00021F99    inc         ebx
 00021F9A    xor         esi,esi
 00021F9C    lea         ecx,[ebp-0C]
 00021F9F    mov         edx,esi
 00021FA1    mov         eax,dword ptr [ebp-4]
 00021FA4    mov         edi,dword ptr [eax]
 00021FA6    call        dword ptr [edi+0C]
 00021FA9    mov         eax,dword ptr [ebp-0C]
 00021FAC    mov         edx,dword ptr [ebp-8]
 00021FAF    call        AnsiCompareText
 00021FB4    test        eax,eax
>00021FB6    je          00021FBF
 00021FB8    inc         esi
 00021FB9    dec         ebx
>00021FBA    jne         00021F9C
 00021FBC    or          esi,0FFFFFFFF
 00021FBF    xor         eax,eax
 00021FC1    pop         edx
 00021FC2    pop         ecx
 00021FC3    pop         ecx
 00021FC4    mov         dword ptr fs:[eax],edx
 00021FC7    push        21FDC
 00021FCC    lea         eax,[ebp-0C]
 00021FCF    call        @LStrClr
 00021FD4    ret
>00021FD5    jmp         @HandleFinally
>00021FDA    jmp         00021FCC
 00021FDC    mov         eax,esi
 00021FDE    pop         edi
 00021FDF    pop         esi
 00021FE0    pop         ebx
 00021FE1    mov         esp,ebp
 00021FE3    pop         ebp
 00021FE4    ret
*}
end;

//00021FE8
function TStrings.IndexOfName(const Name:AnsiString):Integer;
begin
{*
 00021FE8    push        ebp
 00021FE9    mov         ebp,esp
 00021FEB    add         esp,0FFFFFFEC
 00021FEE    push        ebx
 00021FEF    push        esi
 00021FF0    xor         ecx,ecx
 00021FF2    mov         dword ptr [ebp-14],ecx
 00021FF5    mov         dword ptr [ebp-10],ecx
 00021FF8    mov         dword ptr [ebp-8],edx
 00021FFB    mov         dword ptr [ebp-4],eax
 00021FFE    xor         eax,eax
 00022000    push        ebp
 00022001    push        2208F
 00022006    push        dword ptr fs:[eax]
 00022009    mov         dword ptr fs:[eax],esp
 0002200C    mov         eax,dword ptr [ebp-4]
 0002200F    mov         edx,dword ptr [eax]
 00022011    call        dword ptr [edx+14]
 00022014    mov         esi,eax
 00022016    dec         esi
 00022017    test        esi,esi
>00022019    jl          0002206D
 0002201B    inc         esi
 0002201C    mov         dword ptr [ebp-0C],0
 00022023    lea         ecx,[ebp-10]
 00022026    mov         edx,dword ptr [ebp-0C]
 00022029    mov         eax,dword ptr [ebp-4]
 0002202C    mov         ebx,dword ptr [eax]
 0002202E    call        dword ptr [ebx+0C]
 00022031    mov         edx,dword ptr [ebp-10]
 00022034    mov         eax,220A8;'='
 00022039    call        AnsiPos
 0002203E    mov         ebx,eax
 00022040    test        ebx,ebx
>00022042    je          00022067
 00022044    lea         eax,[ebp-14]
 00022047    push        eax
 00022048    mov         ecx,ebx
 0002204A    dec         ecx
 0002204B    mov         edx,1
 00022050    mov         eax,dword ptr [ebp-10]
 00022053    call        @LStrCopy
 00022058    mov         eax,dword ptr [ebp-14]
 0002205B    mov         edx,dword ptr [ebp-8]
 0002205E    call        AnsiCompareText
 00022063    test        eax,eax
>00022065    je          00022074
 00022067    inc         dword ptr [ebp-0C]
 0002206A    dec         esi
>0002206B    jne         00022023
 0002206D    mov         dword ptr [ebp-0C],0FFFFFFFF
 00022074    xor         eax,eax
 00022076    pop         edx
 00022077    pop         ecx
 00022078    pop         ecx
 00022079    mov         dword ptr fs:[eax],edx
 0002207C    push        22096
 00022081    lea         eax,[ebp-14]
 00022084    mov         edx,2
 00022089    call        @LStrArrayClr
 0002208E    ret
>0002208F    jmp         @HandleFinally
>00022094    jmp         00022081
 00022096    mov         eax,dword ptr [ebp-0C]
 00022099    pop         esi
 0002209A    pop         ebx
 0002209B    mov         esp,ebp
 0002209D    pop         ebp
 0002209E    ret
*}
end;

//000220AC
procedure TStrings.InsertObject(Index:Integer; const S:AnsiString; AObject:TObject);
begin
{*
 000220AC    push        ebp
 000220AD    mov         ebp,esp
 000220AF    push        ecx
 000220B0    push        ebx
 000220B1    push        esi
 000220B2    push        edi
 000220B3    mov         dword ptr [ebp-4],ecx
 000220B6    mov         ebx,edx
 000220B8    mov         esi,eax
 000220BA    mov         ecx,dword ptr [ebp-4]
 000220BD    mov         edx,ebx
 000220BF    mov         eax,esi
 000220C1    mov         edi,dword ptr [eax]
 000220C3    call        dword ptr [edi+54]
 000220C6    mov         ecx,dword ptr [ebp+8]
 000220C9    mov         edx,ebx
 000220CB    mov         eax,esi
 000220CD    mov         ebx,dword ptr [eax]
 000220CF    call        dword ptr [ebx+24]
 000220D2    pop         edi
 000220D3    pop         esi
 000220D4    pop         ebx
 000220D5    pop         ecx
 000220D6    pop         ebp
 000220D7    ret         4
*}
end;

//000220DC
procedure TStrings.LoadFromFile(const FileName:AnsiString);
begin
{*
 000220DC    push        ebp
 000220DD    mov         ebp,esp
 000220DF    push        ecx
 000220E0    push        esi
 000220E1    mov         esi,eax
 000220E3    push        20
 000220E5    mov         ecx,edx
 000220E7    mov         eax,[0001F510];TFileStream
 000220EC    mov         dl,1
 000220EE    call        TFileStream.Create
 000220F3    mov         dword ptr [ebp-4],eax
 000220F6    xor         eax,eax
 000220F8    push        ebp
 000220F9    push        22124
 000220FE    push        dword ptr fs:[eax]
 00022101    mov         dword ptr fs:[eax],esp
 00022104    mov         edx,dword ptr [ebp-4]
 00022107    mov         eax,esi
 00022109    mov         ecx,dword ptr [eax]
 0002210B    call        dword ptr [ecx+5C]
 0002210E    xor         eax,eax
 00022110    pop         edx
 00022111    pop         ecx
 00022112    pop         ecx
 00022113    mov         dword ptr fs:[eax],edx
 00022116    push        2212B
 0002211B    mov         eax,dword ptr [ebp-4]
 0002211E    call        TObject.Free
 00022123    ret
>00022124    jmp         @HandleFinally
>00022129    jmp         0002211B
 0002212B    pop         esi
 0002212C    pop         ecx
 0002212D    pop         ebp
 0002212E    ret
*}
end;

//00022130
procedure TStrings.LoadFromStream(Stream:TStream);
begin
{*
 00022130    push        ebp
 00022131    mov         ebp,esp
 00022133    add         esp,0FFFFFFF8
 00022136    push        ebx
 00022137    push        esi
 00022138    xor         ecx,ecx
 0002213A    mov         dword ptr [ebp-8],ecx
 0002213D    mov         ebx,edx
 0002213F    mov         dword ptr [ebp-4],eax
 00022142    xor         eax,eax
 00022144    push        ebp
 00022145    push        221CE
 0002214A    push        dword ptr fs:[eax]
 0002214D    mov         dword ptr fs:[eax],esp
 00022150    mov         eax,dword ptr [ebp-4]
 00022153    call        TStrings.BeginUpdate
 00022158    xor         eax,eax
 0002215A    push        ebp
 0002215B    push        221B1
 00022160    push        dword ptr fs:[eax]
 00022163    mov         dword ptr fs:[eax],esp
 00022166    mov         eax,ebx
 00022168    call        TStream.GetSize
 0002216D    mov         esi,eax
 0002216F    mov         eax,ebx
 00022171    call        TStream.GetPosition
 00022176    sub         esi,eax
 00022178    lea         eax,[ebp-8]
 0002217B    mov         ecx,esi
 0002217D    xor         edx,edx
 0002217F    call        @LStrFromPCharLen
 00022184    mov         edx,dword ptr [ebp-8]
 00022187    mov         ecx,esi
 00022189    mov         eax,ebx
 0002218B    mov         ebx,dword ptr [eax]
 0002218D    call        dword ptr [ebx+4]
 00022190    mov         edx,dword ptr [ebp-8]
 00022193    mov         eax,dword ptr [ebp-4]
 00022196    mov         ecx,dword ptr [eax]
 00022198    call        dword ptr [ecx+2C]
 0002219B    xor         eax,eax
 0002219D    pop         edx
 0002219E    pop         ecx
 0002219F    pop         ecx
 000221A0    mov         dword ptr fs:[eax],edx
 000221A3    push        221B8
 000221A8    mov         eax,dword ptr [ebp-4]
 000221AB    call        TStrings.EndUpdate
 000221B0    ret
>000221B1    jmp         @HandleFinally
>000221B6    jmp         000221A8
 000221B8    xor         eax,eax
 000221BA    pop         edx
 000221BB    pop         ecx
 000221BC    pop         ecx
 000221BD    mov         dword ptr fs:[eax],edx
 000221C0    push        221D5
 000221C5    lea         eax,[ebp-8]
 000221C8    call        @LStrClr
 000221CD    ret
>000221CE    jmp         @HandleFinally
>000221D3    jmp         000221C5
 000221D5    pop         esi
 000221D6    pop         ebx
 000221D7    pop         ecx
 000221D8    pop         ecx
 000221D9    pop         ebp
 000221DA    ret
*}
end;

//000221DC
procedure TStrings.Move(CurIndex:Integer; NewIndex:Integer);
begin
{*
 000221DC    push        ebp
 000221DD    mov         ebp,esp
 000221DF    add         esp,0FFFFFFF8
 000221E2    push        ebx
 000221E3    push        esi
 000221E4    push        edi
 000221E5    xor         ebx,ebx
 000221E7    mov         dword ptr [ebp-8],ebx
 000221EA    mov         esi,ecx
 000221EC    mov         ebx,edx
 000221EE    mov         dword ptr [ebp-4],eax
 000221F1    xor         eax,eax
 000221F3    push        ebp
 000221F4    push        2227D
 000221F9    push        dword ptr fs:[eax]
 000221FC    mov         dword ptr fs:[eax],esp
 000221FF    cmp         esi,ebx
>00022201    je          00022267
 00022203    mov         eax,dword ptr [ebp-4]
 00022206    call        TStrings.BeginUpdate
 0002220B    xor         eax,eax
 0002220D    push        ebp
 0002220E    push        22260
 00022213    push        dword ptr fs:[eax]
 00022216    mov         dword ptr fs:[eax],esp
 00022219    lea         ecx,[ebp-8]
 0002221C    mov         edx,ebx
 0002221E    mov         eax,dword ptr [ebp-4]
 00022221    mov         edi,dword ptr [eax]
 00022223    call        dword ptr [edi+0C]
 00022226    mov         edx,ebx
 00022228    mov         eax,dword ptr [ebp-4]
 0002222B    mov         ecx,dword ptr [eax]
 0002222D    call        dword ptr [ecx+18]
 00022230    mov         edi,eax
 00022232    mov         edx,ebx
 00022234    mov         eax,dword ptr [ebp-4]
 00022237    mov         ecx,dword ptr [eax]
 00022239    call        dword ptr [ecx+44]
 0002223C    push        edi
 0002223D    mov         ecx,dword ptr [ebp-8]
 00022240    mov         edx,esi
 00022242    mov         eax,dword ptr [ebp-4]
 00022245    call        TStrings.InsertObject
 0002224A    xor         eax,eax
 0002224C    pop         edx
 0002224D    pop         ecx
 0002224E    pop         ecx
 0002224F    mov         dword ptr fs:[eax],edx
 00022252    push        22267
 00022257    mov         eax,dword ptr [ebp-4]
 0002225A    call        TStrings.EndUpdate
 0002225F    ret
>00022260    jmp         @HandleFinally
>00022265    jmp         00022257
 00022267    xor         eax,eax
 00022269    pop         edx
 0002226A    pop         ecx
 0002226B    pop         ecx
 0002226C    mov         dword ptr fs:[eax],edx
 0002226F    push        22284
 00022274    lea         eax,[ebp-8]
 00022277    call        @LStrClr
 0002227C    ret
>0002227D    jmp         @HandleFinally
>00022282    jmp         00022274
 00022284    pop         edi
 00022285    pop         esi
 00022286    pop         ebx
 00022287    pop         ecx
 00022288    pop         ecx
 00022289    pop         ebp
 0002228A    ret
*}
end;

//0002228C
procedure TStrings.Put(Index:Integer; const S:AnsiString);
begin
{*
 0002228C    push        ebx
 0002228D    push        esi
 0002228E    push        edi
 0002228F    push        ebp
 00022290    mov         ebp,ecx
 00022292    mov         esi,edx
 00022294    mov         ebx,eax
 00022296    mov         edx,esi
 00022298    mov         eax,ebx
 0002229A    mov         ecx,dword ptr [eax]
 0002229C    call        dword ptr [ecx+18]
 0002229F    mov         edi,eax
 000222A1    mov         edx,esi
 000222A3    mov         eax,ebx
 000222A5    mov         ecx,dword ptr [eax]
 000222A7    call        dword ptr [ecx+44]
 000222AA    push        edi
 000222AB    mov         ecx,ebp
 000222AD    mov         edx,esi
 000222AF    mov         eax,ebx
 000222B1    call        TStrings.InsertObject
 000222B6    pop         ebp
 000222B7    pop         edi
 000222B8    pop         esi
 000222B9    pop         ebx
 000222BA    ret
*}
end;

//000222BC
procedure sub_000222BC;
begin
{*
 000222BC    ret
*}
end;

//000222C0
procedure TStrings.ReadData(Reader:TReader);
begin
{*
 000222C0    push        ebp
 000222C1    mov         ebp,esp
 000222C3    add         esp,0FFFFFFF4
 000222C6    xor         ecx,ecx
 000222C8    mov         dword ptr [ebp-0C],ecx
 000222CB    mov         dword ptr [ebp-8],edx
 000222CE    mov         dword ptr [ebp-4],eax
 000222D1    xor         eax,eax
 000222D3    push        ebp
 000222D4    push        22364
 000222D9    push        dword ptr fs:[eax]
 000222DC    mov         dword ptr fs:[eax],esp
 000222DF    mov         eax,dword ptr [ebp-8]
 000222E2    call        TReader.ReadListBegin
 000222E7    mov         eax,dword ptr [ebp-4]
 000222EA    call        TStrings.BeginUpdate
 000222EF    xor         eax,eax
 000222F1    push        ebp
 000222F2    push        2233F
 000222F7    push        dword ptr fs:[eax]
 000222FA    mov         dword ptr fs:[eax],esp
 000222FD    mov         eax,dword ptr [ebp-4]
 00022300    mov         edx,dword ptr [eax]
 00022302    call        dword ptr [edx+40]
>00022305    jmp         0002231D
 00022307    lea         edx,[ebp-0C]
 0002230A    mov         eax,dword ptr [ebp-8]
 0002230D    call        TReader.ReadString
 00022312    mov         edx,dword ptr [ebp-0C]
 00022315    mov         eax,dword ptr [ebp-4]
 00022318    mov         ecx,dword ptr [eax]
 0002231A    call        dword ptr [ecx+34]
 0002231D    mov         eax,dword ptr [ebp-8]
 00022320    call        TReader.EndOfList
 00022325    test        al,al
>00022327    je          00022307
 00022329    xor         eax,eax
 0002232B    pop         edx
 0002232C    pop         ecx
 0002232D    pop         ecx
 0002232E    mov         dword ptr fs:[eax],edx
 00022331    push        22346
 00022336    mov         eax,dword ptr [ebp-4]
 00022339    call        TStrings.EndUpdate
 0002233E    ret
>0002233F    jmp         @HandleFinally
>00022344    jmp         00022336
 00022346    mov         eax,dword ptr [ebp-8]
 00022349    call        TReader.ReadListEnd
 0002234E    xor         eax,eax
 00022350    pop         edx
 00022351    pop         ecx
 00022352    pop         ecx
 00022353    mov         dword ptr fs:[eax],edx
 00022356    push        2236B
 0002235B    lea         eax,[ebp-0C]
 0002235E    call        @LStrClr
 00022363    ret
>00022364    jmp         @HandleFinally
>00022369    jmp         0002235B
 0002236B    mov         esp,ebp
 0002236D    pop         ebp
 0002236E    ret
*}
end;

//00022370
procedure TStrings.SaveToFile(const FileName:AnsiString);
begin
{*
 00022370    push        ebp
 00022371    mov         ebp,esp
 00022373    push        ecx
 00022374    push        esi
 00022375    mov         esi,eax
 00022377    push        0FFFF
 0002237C    mov         ecx,edx
 0002237E    mov         eax,[0001F510];TFileStream
 00022383    mov         dl,1
 00022385    call        TFileStream.Create
 0002238A    mov         dword ptr [ebp-4],eax
 0002238D    xor         eax,eax
 0002238F    push        ebp
 00022390    push        223BB
 00022395    push        dword ptr fs:[eax]
 00022398    mov         dword ptr fs:[eax],esp
 0002239B    mov         edx,dword ptr [ebp-4]
 0002239E    mov         eax,esi
 000223A0    mov         ecx,dword ptr [eax]
 000223A2    call        dword ptr [ecx+68]
 000223A5    xor         eax,eax
 000223A7    pop         edx
 000223A8    pop         ecx
 000223A9    pop         ecx
 000223AA    mov         dword ptr fs:[eax],edx
 000223AD    push        223C2
 000223B2    mov         eax,dword ptr [ebp-4]
 000223B5    call        TObject.Free
 000223BA    ret
>000223BB    jmp         @HandleFinally
>000223C0    jmp         000223B2
 000223C2    pop         esi
 000223C3    pop         ecx
 000223C4    pop         ebp
 000223C5    ret
*}
end;

//000223C8
procedure TStrings.SaveToStream(Stream:TStream);
begin
{*
 000223C8    push        ebp
 000223C9    mov         ebp,esp
 000223CB    push        0
 000223CD    push        ebx
 000223CE    push        esi
 000223CF    mov         esi,edx
 000223D1    mov         ebx,eax
 000223D3    xor         eax,eax
 000223D5    push        ebp
 000223D6    push        22415
 000223DB    push        dword ptr fs:[eax]
 000223DE    mov         dword ptr fs:[eax],esp
 000223E1    lea         edx,[ebp-4]
 000223E4    mov         eax,ebx
 000223E6    mov         ecx,dword ptr [eax]
 000223E8    call        dword ptr [ecx+1C]
 000223EB    mov         eax,dword ptr [ebp-4]
 000223EE    call        @LStrLen
 000223F3    mov         ecx,eax
 000223F5    mov         edx,dword ptr [ebp-4]
 000223F8    mov         eax,esi
 000223FA    call        TStream.WriteBuffer
 000223FF    xor         eax,eax
 00022401    pop         edx
 00022402    pop         ecx
 00022403    pop         ecx
 00022404    mov         dword ptr fs:[eax],edx
 00022407    push        2241C
 0002240C    lea         eax,[ebp-4]
 0002240F    call        @LStrClr
 00022414    ret
>00022415    jmp         @HandleFinally
>0002241A    jmp         0002240C
 0002241C    pop         esi
 0002241D    pop         ebx
 0002241E    pop         ecx
 0002241F    pop         ebp
 00022420    ret
*}
end;

//00022424
procedure sub_00022424;
begin
{*
 00022424    ret
*}
end;

//00022428
procedure TStrings.SetStringsAdapter(const Value:IStringsAdapter);
begin
{*
 00022428    push        ebx
 00022429    push        esi
 0002242A    mov         esi,edx
 0002242C    mov         ebx,eax
 0002242E    cmp         dword ptr [ebx+8],0
>00022432    je          0002243C
 00022434    mov         eax,dword ptr [ebx+8]
 00022437    mov         edx,dword ptr [eax]
 00022439    call        dword ptr [edx+10]
 0002243C    lea         eax,[ebx+8]
 0002243F    mov         edx,esi
 00022441    call        @IntfCopy
 00022446    cmp         dword ptr [ebx+8],0
>0002244A    je          00022456
 0002244C    mov         edx,ebx
 0002244E    mov         eax,dword ptr [ebx+8]
 00022451    mov         ecx,dword ptr [eax]
 00022453    call        dword ptr [ecx+0C]
 00022456    pop         esi
 00022457    pop         ebx
 00022458    ret
*}
end;

//0002245C
procedure TStrings.SetText(Text:PChar);
begin
{*
 0002245C    push        ebp
 0002245D    mov         ebp,esp
 0002245F    push        0
 00022461    push        ebx
 00022462    push        esi
 00022463    mov         esi,edx
 00022465    mov         ebx,eax
 00022467    xor         eax,eax
 00022469    push        ebp
 0002246A    push        2249F
 0002246F    push        dword ptr fs:[eax]
 00022472    mov         dword ptr fs:[eax],esp
 00022475    lea         eax,[ebp-4]
 00022478    mov         edx,esi
 0002247A    call        @LStrFromPChar
 0002247F    mov         edx,dword ptr [ebp-4]
 00022482    mov         eax,ebx
 00022484    mov         ecx,dword ptr [eax]
 00022486    call        dword ptr [ecx+2C]
 00022489    xor         eax,eax
 0002248B    pop         edx
 0002248C    pop         ecx
 0002248D    pop         ecx
 0002248E    mov         dword ptr fs:[eax],edx
 00022491    push        224A6
 00022496    lea         eax,[ebp-4]
 00022499    call        @LStrClr
 0002249E    ret
>0002249F    jmp         @HandleFinally
>000224A4    jmp         00022496
 000224A6    pop         esi
 000224A7    pop         ebx
 000224A8    pop         ecx
 000224A9    pop         ebp
 000224AA    ret
*}
end;

//000224AC
procedure TStrings.SetTextStr(const Value:AnsiString);
begin
{*
 000224AC    push        ebp
 000224AD    mov         ebp,esp
 000224AF    add         esp,0FFFFFFF8
 000224B2    push        ebx
 000224B3    xor         ecx,ecx
 000224B5    mov         dword ptr [ebp-8],ecx
 000224B8    mov         ebx,edx
 000224BA    mov         dword ptr [ebp-4],eax
 000224BD    xor         eax,eax
 000224BF    push        ebp
 000224C0    push        22560
 000224C5    push        dword ptr fs:[eax]
 000224C8    mov         dword ptr fs:[eax],esp
 000224CB    mov         eax,dword ptr [ebp-4]
 000224CE    call        TStrings.BeginUpdate
 000224D3    xor         edx,edx
 000224D5    push        ebp
 000224D6    push        22543
 000224DB    push        dword ptr fs:[edx]
 000224DE    mov         dword ptr fs:[edx],esp
 000224E1    mov         eax,dword ptr [ebp-4]
 000224E4    mov         edx,dword ptr [eax]
 000224E6    call        dword ptr [edx+40]
 000224E9    test        ebx,ebx
>000224EB    je          0002252D
>000224ED    jmp         00022528
 000224EF    mov         eax,ebx
>000224F1    jmp         000224F4
 000224F3    inc         ebx
 000224F4    mov         dl,byte ptr [ebx]
 000224F6    test        dl,dl
>000224F8    je          00022504
 000224FA    sub         dl,0A
>000224FD    je          00022504
 000224FF    sub         dl,3
>00022502    jne         000224F3
 00022504    mov         ecx,ebx
 00022506    sub         ecx,eax
 00022508    lea         edx,[ebp-8]
 0002250B    xchg        eax,edx
 0002250C    call        @LStrFromPCharLen
 00022511    mov         edx,dword ptr [ebp-8]
 00022514    mov         eax,dword ptr [ebp-4]
 00022517    mov         ecx,dword ptr [eax]
 00022519    call        dword ptr [ecx+34]
 0002251C    cmp         byte ptr [ebx],0D
>0002251F    jne         00022522
 00022521    inc         ebx
 00022522    cmp         byte ptr [ebx],0A
>00022525    jne         00022528
 00022527    inc         ebx
 00022528    cmp         byte ptr [ebx],0
>0002252B    jne         000224EF
 0002252D    xor         eax,eax
 0002252F    pop         edx
 00022530    pop         ecx
 00022531    pop         ecx
 00022532    mov         dword ptr fs:[eax],edx
 00022535    push        2254A
 0002253A    mov         eax,dword ptr [ebp-4]
 0002253D    call        TStrings.EndUpdate
 00022542    ret
>00022543    jmp         @HandleFinally
>00022548    jmp         0002253A
 0002254A    xor         eax,eax
 0002254C    pop         edx
 0002254D    pop         ecx
 0002254E    pop         ecx
 0002254F    mov         dword ptr fs:[eax],edx
 00022552    push        22567
 00022557    lea         eax,[ebp-8]
 0002255A    call        @LStrClr
 0002255F    ret
>00022560    jmp         @HandleFinally
>00022565    jmp         00022557
 00022567    pop         ebx
 00022568    pop         ecx
 00022569    pop         ecx
 0002256A    pop         ebp
 0002256B    ret
*}
end;

//0002256C
procedure sub_0002256C;
begin
{*
 0002256C    ret
*}
end;

//00022570
procedure TStrings.SetValue(const Name:AnsiString; const Value:AnsiString);
begin
{*
 00022570    push        ebp
 00022571    mov         ebp,esp
 00022573    add         esp,0FFFFFFF8
 00022576    push        ebx
 00022577    push        esi
 00022578    push        edi
 00022579    xor         ebx,ebx
 0002257B    mov         dword ptr [ebp-8],ebx
 0002257E    mov         dword ptr [ebp-4],ecx
 00022581    mov         edi,edx
 00022583    mov         esi,eax
 00022585    xor         eax,eax
 00022587    push        ebp
 00022588    push        225FA
 0002258D    push        dword ptr fs:[eax]
 00022590    mov         dword ptr fs:[eax],esp
 00022593    mov         edx,edi
 00022595    mov         eax,esi
 00022597    call        TStrings.IndexOfName
 0002259C    mov         ebx,eax
 0002259E    cmp         dword ptr [ebp-4],0
>000225A2    je          000225D7
 000225A4    test        ebx,ebx
>000225A6    jge         000225B3
 000225A8    xor         edx,edx
 000225AA    mov         eax,esi
 000225AC    mov         ecx,dword ptr [eax]
 000225AE    call        dword ptr [ecx+34]
 000225B1    mov         ebx,eax
 000225B3    push        edi
 000225B4    push        22610;'='
 000225B9    push        dword ptr [ebp-4]
 000225BC    lea         eax,[ebp-8]
 000225BF    mov         edx,3
 000225C4    call        @LStrCatN
 000225C9    mov         ecx,dword ptr [ebp-8]
 000225CC    mov         edx,ebx
 000225CE    mov         eax,esi
 000225D0    mov         ebx,dword ptr [eax]
 000225D2    call        dword ptr [ebx+20]
>000225D5    jmp         000225E4
 000225D7    test        ebx,ebx
>000225D9    jl          000225E4
 000225DB    mov         edx,ebx
 000225DD    mov         eax,esi
 000225DF    mov         ecx,dword ptr [eax]
 000225E1    call        dword ptr [ecx+44]
 000225E4    xor         eax,eax
 000225E6    pop         edx
 000225E7    pop         ecx
 000225E8    pop         ecx
 000225E9    mov         dword ptr fs:[eax],edx
 000225EC    push        22601
 000225F1    lea         eax,[ebp-8]
 000225F4    call        @LStrClr
 000225F9    ret
>000225FA    jmp         @HandleFinally
>000225FF    jmp         000225F1
 00022601    pop         edi
 00022602    pop         esi
 00022603    pop         ebx
 00022604    pop         ecx
 00022605    pop         ecx
 00022606    pop         ebp
 00022607    ret
*}
end;

//00022614
procedure TStrings.WriteData(Writer:TWriter);
begin
{*
 00022614    push        ebp
 00022615    mov         ebp,esp
 00022617    add         esp,0FFFFFFF4
 0002261A    push        ebx
 0002261B    push        esi
 0002261C    push        edi
 0002261D    xor         ecx,ecx
 0002261F    mov         dword ptr [ebp-0C],ecx
 00022622    mov         dword ptr [ebp-8],edx
 00022625    mov         dword ptr [ebp-4],eax
 00022628    xor         eax,eax
 0002262A    push        ebp
 0002262B    push        2268A
 00022630    push        dword ptr fs:[eax]
 00022633    mov         dword ptr fs:[eax],esp
 00022636    mov         eax,dword ptr [ebp-8]
 00022639    call        TWriter.WriteListBegin
 0002263E    mov         eax,dword ptr [ebp-4]
 00022641    mov         edx,dword ptr [eax]
 00022643    call        dword ptr [edx+14]
 00022646    mov         ebx,eax
 00022648    dec         ebx
 00022649    test        ebx,ebx
>0002264B    jl          0002266C
 0002264D    inc         ebx
 0002264E    xor         esi,esi
 00022650    lea         ecx,[ebp-0C]
 00022653    mov         edx,esi
 00022655    mov         eax,dword ptr [ebp-4]
 00022658    mov         edi,dword ptr [eax]
 0002265A    call        dword ptr [edi+0C]
 0002265D    mov         edx,dword ptr [ebp-0C]
 00022660    mov         eax,dword ptr [ebp-8]
 00022663    call        TWriter.WriteString
 00022668    inc         esi
 00022669    dec         ebx
>0002266A    jne         00022650
 0002266C    mov         eax,dword ptr [ebp-8]
 0002266F    call        TWriter.WriteListEnd
 00022674    xor         eax,eax
 00022676    pop         edx
 00022677    pop         ecx
 00022678    pop         ecx
 00022679    mov         dword ptr fs:[eax],edx
 0002267C    push        22691
 00022681    lea         eax,[ebp-0C]
 00022684    call        @LStrClr
 00022689    ret
>0002268A    jmp         @HandleFinally
>0002268F    jmp         00022681
 00022691    pop         edi
 00022692    pop         esi
 00022693    pop         ebx
 00022694    mov         esp,ebp
 00022696    pop         ebp
 00022697    ret
*}
end;

//00022698
destructor TStringList.Destroy;
begin
{*
 00022698    push        ebx
 00022699    push        esi
 0002269A    call        @BeforeDestruction
 0002269F    mov         ebx,edx
 000226A1    mov         esi,eax
 000226A3    xor         eax,eax
 000226A5    mov         dword ptr [esi+1C],eax
 000226A8    mov         dword ptr [esi+20],eax
 000226AB    xor         eax,eax
 000226AD    mov         dword ptr [esi+24],eax
 000226B0    mov         dword ptr [esi+28],eax
 000226B3    mov         edx,ebx
 000226B5    and         dl,0FC
 000226B8    mov         eax,esi
 000226BA    call        TStrings.Destroy
 000226BF    mov         eax,dword ptr [esi+10]
 000226C2    test        eax,eax
>000226C4    je          000226D6
 000226C6    mov         edx,dword ptr [esi+0C]
 000226C9    mov         ecx,eax
 000226CB    mov         eax,[0001F31C];TStringItem
 000226D0    xchg        eax,edx
 000226D1    call        @FinalizeArray
 000226D6    xor         eax,eax
 000226D8    mov         dword ptr [esi+10],eax
 000226DB    xor         edx,edx
 000226DD    mov         eax,esi
 000226DF    mov         ecx,dword ptr [eax]
 000226E1    call        dword ptr [ecx+28]
 000226E4    test        bl,bl
>000226E6    jle         000226EF
 000226E8    mov         eax,esi
 000226EA    call        @ClassDestroy
 000226EF    pop         esi
 000226F0    pop         ebx
 000226F1    ret
*}
end;

//000226F4
function TStringList.Add(const S:AnsiString):Integer;
begin
{*
 000226F4    push        ebp
 000226F5    mov         ebp,esp
 000226F7    add         esp,0FFFFFFF8
 000226FA    push        ebx
 000226FB    push        esi
 000226FC    push        edi
 000226FD    xor         ecx,ecx
 000226FF    mov         dword ptr [ebp-8],ecx
 00022702    mov         esi,edx
 00022704    mov         ebx,eax
 00022706    xor         eax,eax
 00022708    push        ebp
 00022709    push        2277A
 0002270E    push        dword ptr fs:[eax]
 00022711    mov         dword ptr fs:[eax],esp
 00022714    cmp         byte ptr [ebx+18],0
>00022718    jne         00022722
 0002271A    mov         eax,dword ptr [ebx+10]
 0002271D    mov         dword ptr [ebp-4],eax
>00022720    jmp         00022758
 00022722    lea         ecx,[ebp-4]
 00022725    mov         edx,esi
 00022727    mov         eax,ebx
 00022729    mov         edi,dword ptr [eax]
 0002272B    call        dword ptr [edi+78]
 0002272E    test        al,al
>00022730    je          00022758
 00022732    mov         al,byte ptr [ebx+19]
 00022735    sub         al,1
>00022737    jb          00022764
 00022739    dec         al
>0002273B    je          0002273F
>0002273D    jmp         00022758
 0002273F    lea         edx,[ebp-8]
 00022742    mov         eax,[000B57A4];^SDuplicateString:TResStringRec
 00022747    call        LoadResString
 0002274C    mov         edx,dword ptr [ebp-8]
 0002274F    xor         ecx,ecx
 00022751    mov         eax,ebx
 00022753    call        TStrings.Error
 00022758    mov         ecx,esi
 0002275A    mov         edx,dword ptr [ebp-4]
 0002275D    mov         eax,ebx
 0002275F    call        TStringList.InsertItem
 00022764    xor         eax,eax
 00022766    pop         edx
 00022767    pop         ecx
 00022768    pop         ecx
 00022769    mov         dword ptr fs:[eax],edx
 0002276C    push        22781
 00022771    lea         eax,[ebp-8]
 00022774    call        @LStrClr
 00022779    ret
>0002277A    jmp         @HandleFinally
>0002277F    jmp         00022771
 00022781    mov         eax,dword ptr [ebp-4]
 00022784    pop         edi
 00022785    pop         esi
 00022786    pop         ebx
 00022787    pop         ecx
 00022788    pop         ecx
 00022789    pop         ebp
 0002278A    ret
*}
end;

//0002278C
procedure TStringList.Changed;
begin
{*
 0002278C    push        ebx
 0002278D    cmp         dword ptr [eax+4],0
>00022791    jne         000227A4
 00022793    cmp         word ptr [eax+1E],0
>00022798    je          000227A4
 0002279A    mov         ebx,eax
 0002279C    mov         edx,eax
 0002279E    mov         eax,dword ptr [ebx+20]
 000227A1    call        dword ptr [ebx+1C]
 000227A4    pop         ebx
 000227A5    ret
*}
end;

//000227A8
procedure TStringList.Changing;
begin
{*
 000227A8    push        ebx
 000227A9    cmp         dword ptr [eax+4],0
>000227AD    jne         000227C0
 000227AF    cmp         word ptr [eax+26],0
>000227B4    je          000227C0
 000227B6    mov         ebx,eax
 000227B8    mov         edx,eax
 000227BA    mov         eax,dword ptr [ebx+28]
 000227BD    call        dword ptr [ebx+24]
 000227C0    pop         ebx
 000227C1    ret
*}
end;

//000227C4
procedure TStringList.Clear;
begin
{*
 000227C4    push        ebx
 000227C5    mov         ebx,eax
 000227C7    cmp         dword ptr [ebx+10],0
>000227CB    je          000227FA
 000227CD    mov         eax,ebx
 000227CF    mov         edx,dword ptr [eax]
 000227D1    call        dword ptr [edx+74]
 000227D4    mov         eax,dword ptr [ebx+0C]
 000227D7    mov         ecx,dword ptr [ebx+10]
 000227DA    mov         edx,dword ptr ds:[1F31C];TStringItem
 000227E0    call        @FinalizeArray
 000227E5    xor         eax,eax
 000227E7    mov         dword ptr [ebx+10],eax
 000227EA    xor         edx,edx
 000227EC    mov         eax,ebx
 000227EE    mov         ecx,dword ptr [eax]
 000227F0    call        dword ptr [ecx+28]
 000227F3    mov         eax,ebx
 000227F5    mov         edx,dword ptr [eax]
 000227F7    call        dword ptr [edx+70]
 000227FA    pop         ebx
 000227FB    ret
*}
end;

//000227FC
procedure TStringList.Delete(Index:Integer);
begin
{*
 000227FC    push        ebp
 000227FD    mov         ebp,esp
 000227FF    push        0
 00022801    push        ebx
 00022802    push        esi
 00022803    mov         esi,edx
 00022805    mov         ebx,eax
 00022807    xor         eax,eax
 00022809    push        ebp
 0002280A    push        2288F
 0002280F    push        dword ptr fs:[eax]
 00022812    mov         dword ptr fs:[eax],esp
 00022815    test        esi,esi
>00022817    jl          0002281E
 00022819    cmp         esi,dword ptr [ebx+10]
>0002281C    jl          00022837
 0002281E    lea         edx,[ebp-4]
 00022821    mov         eax,[000B5AB4];^SListIndexError:TResStringRec
 00022826    call        LoadResString
 0002282B    mov         edx,dword ptr [ebp-4]
 0002282E    mov         ecx,esi
 00022830    mov         eax,ebx
 00022832    call        TStrings.Error
 00022837    mov         eax,ebx
 00022839    mov         edx,dword ptr [eax]
 0002283B    call        dword ptr [edx+74]
 0002283E    mov         eax,dword ptr [ebx+0C]
 00022841    lea         eax,[eax+esi*8]
 00022844    mov         edx,dword ptr ds:[1F31C];TStringItem
 0002284A    call        @Finalize
 0002284F    dec         dword ptr [ebx+10]
 00022852    mov         eax,dword ptr [ebx+10]
 00022855    cmp         esi,eax
>00022857    jge         00022872
 00022859    sub         eax,esi
 0002285B    mov         ecx,eax
 0002285D    shl         ecx,3
 00022860    mov         eax,dword ptr [ebx+0C]
 00022863    lea         edx,[eax+esi*8]
 00022866    mov         eax,dword ptr [ebx+0C]
 00022869    lea         eax,[eax+esi*8+8]
 0002286D    call        Move
 00022872    mov         eax,ebx
 00022874    mov         edx,dword ptr [eax]
 00022876    call        dword ptr [edx+70]
 00022879    xor         eax,eax
 0002287B    pop         edx
 0002287C    pop         ecx
 0002287D    pop         ecx
 0002287E    mov         dword ptr fs:[eax],edx
 00022881    push        22896
 00022886    lea         eax,[ebp-4]
 00022889    call        @LStrClr
 0002288E    ret
>0002288F    jmp         @HandleFinally
>00022894    jmp         00022886
 00022896    pop         esi
 00022897    pop         ebx
 00022898    pop         ecx
 00022899    pop         ebp
 0002289A    ret
*}
end;

//0002289C
procedure TStringList.Exchange(Index1:Integer; Index2:Integer);
begin
{*
 0002289C    push        ebp
 0002289D    mov         ebp,esp
 0002289F    push        0
 000228A1    push        ebx
 000228A2    push        esi
 000228A3    push        edi
 000228A4    mov         edi,ecx
 000228A6    mov         esi,edx
 000228A8    mov         ebx,eax
 000228AA    xor         eax,eax
 000228AC    push        ebp
 000228AD    push        2292B
 000228B2    push        dword ptr fs:[eax]
 000228B5    mov         dword ptr fs:[eax],esp
 000228B8    test        esi,esi
>000228BA    jl          000228C1
 000228BC    cmp         esi,dword ptr [ebx+10]
>000228BF    jl          000228DA
 000228C1    lea         edx,[ebp-4]
 000228C4    mov         eax,[000B5AB4];^SListIndexError:TResStringRec
 000228C9    call        LoadResString
 000228CE    mov         edx,dword ptr [ebp-4]
 000228D1    mov         ecx,esi
 000228D3    mov         eax,ebx
 000228D5    call        TStrings.Error
 000228DA    test        edi,edi
>000228DC    jl          000228E3
 000228DE    cmp         edi,dword ptr [ebx+10]
>000228E1    jl          000228FC
 000228E3    lea         edx,[ebp-4]
 000228E6    mov         eax,[000B5AB4];^SListIndexError:TResStringRec
 000228EB    call        LoadResString
 000228F0    mov         edx,dword ptr [ebp-4]
 000228F3    mov         ecx,edi
 000228F5    mov         eax,ebx
 000228F7    call        TStrings.Error
 000228FC    mov         eax,ebx
 000228FE    mov         edx,dword ptr [eax]
 00022900    call        dword ptr [edx+74]
 00022903    mov         ecx,edi
 00022905    mov         edx,esi
 00022907    mov         eax,ebx
 00022909    call        TStringList.ExchangeItems
 0002290E    mov         eax,ebx
 00022910    mov         edx,dword ptr [eax]
 00022912    call        dword ptr [edx+70]
 00022915    xor         eax,eax
 00022917    pop         edx
 00022918    pop         ecx
 00022919    pop         ecx
 0002291A    mov         dword ptr fs:[eax],edx
 0002291D    push        22932
 00022922    lea         eax,[ebp-4]
 00022925    call        @LStrClr
 0002292A    ret
>0002292B    jmp         @HandleFinally
>00022930    jmp         00022922
 00022932    pop         edi
 00022933    pop         esi
 00022934    pop         ebx
 00022935    pop         ecx
 00022936    pop         ebp
 00022937    ret
*}
end;

//00022938
procedure TStringList.ExchangeItems(Index1:Integer; Index2:Integer);
begin
{*
 00022938    push        ebx
 00022939    mov         ebx,dword ptr [eax+0C]
 0002293C    lea         edx,[ebx+edx*8]
 0002293F    mov         eax,dword ptr [eax+0C]
 00022942    lea         eax,[eax+ecx*8]
 00022945    mov         ecx,dword ptr [edx]
 00022947    mov         ebx,dword ptr [eax]
 00022949    mov         dword ptr [edx],ebx
 0002294B    mov         dword ptr [eax],ecx
 0002294D    mov         ecx,dword ptr [edx+4]
 00022950    mov         ebx,dword ptr [eax+4]
 00022953    mov         dword ptr [edx+4],ebx
 00022956    mov         dword ptr [eax+4],ecx
 00022959    pop         ebx
 0002295A    ret
*}
end;

//0002295C
function TStringList.Find(const S:AnsiString; var Index:Integer):Boolean;
begin
{*
 0002295C    push        ebx
 0002295D    push        esi
 0002295E    push        edi
 0002295F    push        ebp
 00022960    add         esp,0FFFFFFF4
 00022963    mov         dword ptr [esp+4],ecx
 00022967    mov         dword ptr [esp],edx
 0002296A    mov         ebp,eax
 0002296C    mov         byte ptr [esp+8],0
 00022971    xor         esi,esi
 00022973    mov         edi,dword ptr [ebp+10]
 00022976    dec         edi
 00022977    cmp         edi,esi
>00022979    jl          000229AF
 0002297B    lea         ebx,[edi+esi]
 0002297E    shr         ebx,1
 00022980    mov         eax,dword ptr [ebp+0C]
 00022983    mov         eax,dword ptr [eax+ebx*8]
 00022986    mov         edx,dword ptr [esp]
 00022989    call        AnsiCompareText
 0002298E    test        eax,eax
>00022990    jge         00022997
 00022992    lea         esi,[ebx+1]
>00022995    jmp         000229AB
 00022997    mov         edi,ebx
 00022999    dec         edi
 0002299A    test        eax,eax
>0002299C    jne         000229AB
 0002299E    mov         byte ptr [esp+8],1
 000229A3    cmp         byte ptr [ebp+19],1
>000229A7    je          000229AB
 000229A9    mov         esi,ebx
 000229AB    cmp         edi,esi
>000229AD    jge         0002297B
 000229AF    mov         eax,dword ptr [esp+4]
 000229B3    mov         dword ptr [eax],esi
 000229B5    mov         al,byte ptr [esp+8]
 000229B9    add         esp,0C
 000229BC    pop         ebp
 000229BD    pop         edi
 000229BE    pop         esi
 000229BF    pop         ebx
 000229C0    ret
*}
end;

//000229C4
function TStringList.Get(Index:Integer):AnsiString;
begin
{*
 000229C4    push        ebp
 000229C5    mov         ebp,esp
 000229C7    push        0
 000229C9    push        ebx
 000229CA    push        esi
 000229CB    push        edi
 000229CC    mov         edi,ecx
 000229CE    mov         esi,edx
 000229D0    mov         ebx,eax
 000229D2    xor         eax,eax
 000229D4    push        ebp
 000229D5    push        22A25
 000229DA    push        dword ptr fs:[eax]
 000229DD    mov         dword ptr fs:[eax],esp
 000229E0    test        esi,esi
>000229E2    jl          000229E9
 000229E4    cmp         esi,dword ptr [ebx+10]
>000229E7    jl          00022A02
 000229E9    lea         edx,[ebp-4]
 000229EC    mov         eax,[000B5AB4];^SListIndexError:TResStringRec
 000229F1    call        LoadResString
 000229F6    mov         edx,dword ptr [ebp-4]
 000229F9    mov         ecx,esi
 000229FB    mov         eax,ebx
 000229FD    call        TStrings.Error
 00022A02    mov         eax,edi
 00022A04    mov         edx,dword ptr [ebx+0C]
 00022A07    mov         edx,dword ptr [edx+esi*8]
 00022A0A    call        @LStrLAsg
 00022A0F    xor         eax,eax
 00022A11    pop         edx
 00022A12    pop         ecx
 00022A13    pop         ecx
 00022A14    mov         dword ptr fs:[eax],edx
 00022A17    push        22A2C
 00022A1C    lea         eax,[ebp-4]
 00022A1F    call        @LStrClr
 00022A24    ret
>00022A25    jmp         @HandleFinally
>00022A2A    jmp         00022A1C
 00022A2C    pop         edi
 00022A2D    pop         esi
 00022A2E    pop         ebx
 00022A2F    pop         ecx
 00022A30    pop         ebp
 00022A31    ret
*}
end;

//00022A34
{*function sub_00022A34:?;
begin
 00022A34    mov         eax,dword ptr [eax+14];TStringList.FCapacity:Integer
 00022A37    ret
end;*}

//00022A38
{*function TStringList.GetCount:?;
begin
 00022A38    mov         eax,dword ptr [eax+10];TStringList.FCount:Integer
 00022A3B    ret
end;*}

//00022A3C
function TStringList.GetObject(Index:Integer):TObject;
begin
{*
 00022A3C    push        ebp
 00022A3D    mov         ebp,esp
 00022A3F    push        0
 00022A41    push        ebx
 00022A42    push        esi
 00022A43    mov         esi,edx
 00022A45    mov         ebx,eax
 00022A47    xor         eax,eax
 00022A49    push        ebp
 00022A4A    push        22A94
 00022A4F    push        dword ptr fs:[eax]
 00022A52    mov         dword ptr fs:[eax],esp
 00022A55    test        esi,esi
>00022A57    jl          00022A5E
 00022A59    cmp         esi,dword ptr [ebx+10]
>00022A5C    jl          00022A77
 00022A5E    lea         edx,[ebp-4]
 00022A61    mov         eax,[000B5AB4];^SListIndexError:TResStringRec
 00022A66    call        LoadResString
 00022A6B    mov         edx,dword ptr [ebp-4]
 00022A6E    mov         ecx,esi
 00022A70    mov         eax,ebx
 00022A72    call        TStrings.Error
 00022A77    mov         eax,dword ptr [ebx+0C]
 00022A7A    mov         ebx,dword ptr [eax+esi*8+4]
 00022A7E    xor         eax,eax
 00022A80    pop         edx
 00022A81    pop         ecx
 00022A82    pop         ecx
 00022A83    mov         dword ptr fs:[eax],edx
 00022A86    push        22A9B
 00022A8B    lea         eax,[ebp-4]
 00022A8E    call        @LStrClr
 00022A93    ret
>00022A94    jmp         @HandleFinally
>00022A99    jmp         00022A8B
 00022A9B    mov         eax,ebx
 00022A9D    pop         esi
 00022A9E    pop         ebx
 00022A9F    pop         ecx
 00022AA0    pop         ebp
 00022AA1    ret
*}
end;

//00022AA4
procedure TStringList.Grow;
begin
{*
 00022AA4    push        esi
 00022AA5    mov         edx,dword ptr [eax+14]
 00022AA8    cmp         edx,40
>00022AAB    jle         00022ABB
 00022AAD    mov         esi,edx
 00022AAF    test        esi,esi
>00022AB1    jns         00022AB6
 00022AB3    add         esi,3
 00022AB6    sar         esi,2
>00022AB9    jmp         00022ACC
 00022ABB    cmp         edx,8
>00022ABE    jle         00022AC7
 00022AC0    mov         esi,10
>00022AC5    jmp         00022ACC
 00022AC7    mov         esi,4
 00022ACC    add         esi,edx
 00022ACE    mov         edx,esi
 00022AD0    mov         ecx,dword ptr [eax]
 00022AD2    call        dword ptr [ecx+28]
 00022AD5    pop         esi
 00022AD6    ret
*}
end;

//00022AD8
function TStringList.IndexOf(const S:AnsiString):Integer;
begin
{*
 00022AD8    push        ebx
 00022AD9    push        esi
 00022ADA    push        ecx
 00022ADB    mov         esi,edx
 00022ADD    mov         ebx,eax
 00022ADF    cmp         byte ptr [ebx+18],0
>00022AE3    jne         00022AF3
 00022AE5    mov         edx,esi
 00022AE7    mov         eax,ebx
 00022AE9    call        TStrings.IndexOf
 00022AEE    mov         dword ptr [esp],eax
>00022AF1    jmp         00022B09
 00022AF3    mov         ecx,esp
 00022AF5    mov         edx,esi
 00022AF7    mov         eax,ebx
 00022AF9    mov         ebx,dword ptr [eax]
 00022AFB    call        dword ptr [ebx+78]
 00022AFE    test        al,al
>00022B00    jne         00022B09
 00022B02    mov         dword ptr [esp],0FFFFFFFF
 00022B09    mov         eax,dword ptr [esp]
 00022B0C    pop         edx
 00022B0D    pop         esi
 00022B0E    pop         ebx
 00022B0F    ret
*}
end;

//00022B10
procedure TStringList.Insert(Index:Integer; const S:AnsiString);
begin
{*
 00022B10    push        ebp
 00022B11    mov         ebp,esp
 00022B13    push        0
 00022B15    push        ebx
 00022B16    push        esi
 00022B17    push        edi
 00022B18    mov         edi,ecx
 00022B1A    mov         esi,edx
 00022B1C    mov         ebx,eax
 00022B1E    xor         eax,eax
 00022B20    push        ebp
 00022B21    push        22B8E
 00022B26    push        dword ptr fs:[eax]
 00022B29    mov         dword ptr fs:[eax],esp
 00022B2C    cmp         byte ptr [ebx+18],0
>00022B30    je          00022B4B
 00022B32    lea         edx,[ebp-4]
 00022B35    mov         eax,[000B589C];^SSortedListError:TResStringRec
 00022B3A    call        LoadResString
 00022B3F    mov         edx,dword ptr [ebp-4]
 00022B42    xor         ecx,ecx
 00022B44    mov         eax,ebx
 00022B46    call        TStrings.Error
 00022B4B    test        esi,esi
>00022B4D    jl          00022B54
 00022B4F    cmp         esi,dword ptr [ebx+10]
>00022B52    jle         00022B6D
 00022B54    lea         edx,[ebp-4]
 00022B57    mov         eax,[000B5AB4];^SListIndexError:TResStringRec
 00022B5C    call        LoadResString
 00022B61    mov         edx,dword ptr [ebp-4]
 00022B64    mov         ecx,esi
 00022B66    mov         eax,ebx
 00022B68    call        TStrings.Error
 00022B6D    mov         ecx,edi
 00022B6F    mov         edx,esi
 00022B71    mov         eax,ebx
 00022B73    call        TStringList.InsertItem
 00022B78    xor         eax,eax
 00022B7A    pop         edx
 00022B7B    pop         ecx
 00022B7C    pop         ecx
 00022B7D    mov         dword ptr fs:[eax],edx
 00022B80    push        22B95
 00022B85    lea         eax,[ebp-4]
 00022B88    call        @LStrClr
 00022B8D    ret
>00022B8E    jmp         @HandleFinally
>00022B93    jmp         00022B85
 00022B95    pop         edi
 00022B96    pop         esi
 00022B97    pop         ebx
 00022B98    pop         ecx
 00022B99    pop         ebp
 00022B9A    ret
*}
end;

//00022B9C
procedure TStringList.InsertItem(Index:Integer; const S:AnsiString);
begin
{*
 00022B9C    push        ebx
 00022B9D    push        esi
 00022B9E    push        edi
 00022B9F    mov         edi,ecx
 00022BA1    mov         esi,edx
 00022BA3    mov         ebx,eax
 00022BA5    mov         eax,ebx
 00022BA7    mov         edx,dword ptr [eax]
 00022BA9    call        dword ptr [edx+74]
 00022BAC    mov         eax,dword ptr [ebx+10]
 00022BAF    cmp         eax,dword ptr [ebx+14]
>00022BB2    jne         00022BBB
 00022BB4    mov         eax,ebx
 00022BB6    call        TStringList.Grow
 00022BBB    mov         eax,dword ptr [ebx+10]
 00022BBE    cmp         esi,eax
>00022BC0    jge         00022BDA
 00022BC2    mov         edx,dword ptr [ebx+0C]
 00022BC5    lea         edx,[edx+esi*8+8]
 00022BC9    mov         ecx,dword ptr [ebx+0C]
 00022BCC    lea         ecx,[ecx+esi*8]
 00022BCF    sub         eax,esi
 00022BD1    shl         eax,3
 00022BD4    xchg        eax,ecx
 00022BD5    call        Move
 00022BDA    mov         eax,dword ptr [ebx+0C]
 00022BDD    lea         eax,[eax+esi*8]
 00022BE0    mov         esi,eax
 00022BE2    xor         eax,eax
 00022BE4    mov         dword ptr [esi],eax
 00022BE6    xor         eax,eax
 00022BE8    mov         dword ptr [esi+4],eax
 00022BEB    mov         eax,esi
 00022BED    mov         edx,edi
 00022BEF    call        @LStrAsg
 00022BF4    inc         dword ptr [ebx+10]
 00022BF7    mov         eax,ebx
 00022BF9    mov         edx,dword ptr [eax]
 00022BFB    call        dword ptr [edx+70]
 00022BFE    pop         edi
 00022BFF    pop         esi
 00022C00    pop         ebx
 00022C01    ret
*}
end;

//00022C04
procedure TStringList.Put(Index:Integer; const S:AnsiString);
begin
{*
 00022C04    push        ebp
 00022C05    mov         ebp,esp
 00022C07    push        0
 00022C09    push        ebx
 00022C0A    push        esi
 00022C0B    push        edi
 00022C0C    mov         edi,ecx
 00022C0E    mov         esi,edx
 00022C10    mov         ebx,eax
 00022C12    xor         eax,eax
 00022C14    push        ebp
 00022C15    push        22C92
 00022C1A    push        dword ptr fs:[eax]
 00022C1D    mov         dword ptr fs:[eax],esp
 00022C20    cmp         byte ptr [ebx+18],0
>00022C24    je          00022C3F
 00022C26    lea         edx,[ebp-4]
 00022C29    mov         eax,[000B589C];^SSortedListError:TResStringRec
 00022C2E    call        LoadResString
 00022C33    mov         edx,dword ptr [ebp-4]
 00022C36    xor         ecx,ecx
 00022C38    mov         eax,ebx
 00022C3A    call        TStrings.Error
 00022C3F    test        esi,esi
>00022C41    jl          00022C48
 00022C43    cmp         esi,dword ptr [ebx+10]
>00022C46    jl          00022C61
 00022C48    lea         edx,[ebp-4]
 00022C4B    mov         eax,[000B5AB4];^SListIndexError:TResStringRec
 00022C50    call        LoadResString
 00022C55    mov         edx,dword ptr [ebp-4]
 00022C58    mov         ecx,esi
 00022C5A    mov         eax,ebx
 00022C5C    call        TStrings.Error
 00022C61    mov         eax,ebx
 00022C63    mov         edx,dword ptr [eax]
 00022C65    call        dword ptr [edx+74]
 00022C68    mov         eax,dword ptr [ebx+0C]
 00022C6B    lea         eax,[eax+esi*8]
 00022C6E    mov         edx,edi
 00022C70    call        @LStrAsg
 00022C75    mov         eax,ebx
 00022C77    mov         edx,dword ptr [eax]
 00022C79    call        dword ptr [edx+70]
 00022C7C    xor         eax,eax
 00022C7E    pop         edx
 00022C7F    pop         ecx
 00022C80    pop         ecx
 00022C81    mov         dword ptr fs:[eax],edx
 00022C84    push        22C99
 00022C89    lea         eax,[ebp-4]
 00022C8C    call        @LStrClr
 00022C91    ret
>00022C92    jmp         @HandleFinally
>00022C97    jmp         00022C89
 00022C99    pop         edi
 00022C9A    pop         esi
 00022C9B    pop         ebx
 00022C9C    pop         ecx
 00022C9D    pop         ebp
 00022C9E    ret
*}
end;

//00022CA0
procedure TStringList.PutObject(Index:Integer; AObject:TObject);
begin
{*
 00022CA0    push        ebp
 00022CA1    mov         ebp,esp
 00022CA3    push        0
 00022CA5    push        ebx
 00022CA6    push        esi
 00022CA7    push        edi
 00022CA8    mov         edi,ecx
 00022CAA    mov         esi,edx
 00022CAC    mov         ebx,eax
 00022CAE    xor         eax,eax
 00022CB0    push        ebp
 00022CB1    push        22D09
 00022CB6    push        dword ptr fs:[eax]
 00022CB9    mov         dword ptr fs:[eax],esp
 00022CBC    test        esi,esi
>00022CBE    jl          00022CC5
 00022CC0    cmp         esi,dword ptr [ebx+10]
>00022CC3    jl          00022CDE
 00022CC5    lea         edx,[ebp-4]
 00022CC8    mov         eax,[000B5AB4];^SListIndexError:TResStringRec
 00022CCD    call        LoadResString
 00022CD2    mov         edx,dword ptr [ebp-4]
 00022CD5    mov         ecx,esi
 00022CD7    mov         eax,ebx
 00022CD9    call        TStrings.Error
 00022CDE    mov         eax,ebx
 00022CE0    mov         edx,dword ptr [eax]
 00022CE2    call        dword ptr [edx+74]
 00022CE5    mov         eax,dword ptr [ebx+0C]
 00022CE8    mov         dword ptr [eax+esi*8+4],edi
 00022CEC    mov         eax,ebx
 00022CEE    mov         edx,dword ptr [eax]
 00022CF0    call        dword ptr [edx+70]
 00022CF3    xor         eax,eax
 00022CF5    pop         edx
 00022CF6    pop         ecx
 00022CF7    pop         ecx
 00022CF8    mov         dword ptr fs:[eax],edx
 00022CFB    push        22D10
 00022D00    lea         eax,[ebp-4]
 00022D03    call        @LStrClr
 00022D08    ret
>00022D09    jmp         @HandleFinally
>00022D0E    jmp         00022D00
 00022D10    pop         edi
 00022D11    pop         esi
 00022D12    pop         ebx
 00022D13    pop         ecx
 00022D14    pop         ebp
 00022D15    ret
*}
end;

//00022D18
procedure TStringList.QuickSort(L:Integer; R:Integer);
begin
{*
 00022D18    push        ebp
 00022D19    mov         ebp,esp
 00022D1B    add         esp,0FFFFFFF4
 00022D1E    push        ebx
 00022D1F    push        esi
 00022D20    push        edi
 00022D21    xor         ebx,ebx
 00022D23    mov         dword ptr [ebp-0C],ebx
 00022D26    mov         dword ptr [ebp-8],ecx
 00022D29    mov         dword ptr [ebp-4],edx
 00022D2C    mov         edi,eax
 00022D2E    xor         eax,eax
 00022D30    push        ebp
 00022D31    push        22DC6
 00022D36    push        dword ptr fs:[eax]
 00022D39    mov         dword ptr fs:[eax],esp
 00022D3C    mov         ebx,dword ptr [ebp-4]
 00022D3F    mov         esi,dword ptr [ebp-8]
 00022D42    lea         eax,[ebp-0C]
 00022D45    mov         edx,dword ptr [ebp-4]
 00022D48    add         edx,dword ptr [ebp-8]
 00022D4B    shr         edx,1
 00022D4D    mov         ecx,dword ptr [edi+0C]
 00022D50    mov         edx,dword ptr [ecx+edx*8]
 00022D53    call        @LStrLAsg
>00022D58    jmp         00022D5B
 00022D5A    inc         ebx
 00022D5B    mov         eax,dword ptr [edi+0C]
 00022D5E    mov         eax,dword ptr [eax+ebx*8]
 00022D61    mov         edx,dword ptr [ebp-0C]
 00022D64    call        AnsiCompareText
 00022D69    test        eax,eax
>00022D6B    jl          00022D5A
>00022D6D    jmp         00022D70
 00022D6F    dec         esi
 00022D70    mov         eax,dword ptr [edi+0C]
 00022D73    mov         eax,dword ptr [eax+esi*8]
 00022D76    mov         edx,dword ptr [ebp-0C]
 00022D79    call        AnsiCompareText
 00022D7E    test        eax,eax
>00022D80    jg          00022D6F
 00022D82    cmp         esi,ebx
>00022D84    jl          00022D93
 00022D86    mov         ecx,esi
 00022D88    mov         edx,ebx
 00022D8A    mov         eax,edi
 00022D8C    call        TStringList.ExchangeItems
 00022D91    inc         ebx
 00022D92    dec         esi
 00022D93    cmp         esi,ebx
>00022D95    jge         00022D5B
 00022D97    cmp         esi,dword ptr [ebp-4]
>00022D9A    jle         00022DA8
 00022D9C    mov         ecx,esi
 00022D9E    mov         edx,dword ptr [ebp-4]
 00022DA1    mov         eax,edi
 00022DA3    call        TStringList.QuickSort
 00022DA8    mov         dword ptr [ebp-4],ebx
 00022DAB    cmp         ebx,dword ptr [ebp-8]
>00022DAE    jl          00022D3C
 00022DB0    xor         eax,eax
 00022DB2    pop         edx
 00022DB3    pop         ecx
 00022DB4    pop         ecx
 00022DB5    mov         dword ptr fs:[eax],edx
 00022DB8    push        22DCD
 00022DBD    lea         eax,[ebp-0C]
 00022DC0    call        @LStrClr
 00022DC5    ret
>00022DC6    jmp         @HandleFinally
>00022DCB    jmp         00022DBD
 00022DCD    pop         edi
 00022DCE    pop         esi
 00022DCF    pop         ebx
 00022DD0    mov         esp,ebp
 00022DD2    pop         ebp
 00022DD3    ret
*}
end;

//00022DD4
procedure TStringList.SetCapacity(NewCapacity:Integer);
begin
{*
 00022DD4    push        ebx
 00022DD5    push        esi
 00022DD6    mov         esi,edx
 00022DD8    mov         ebx,eax
 00022DDA    mov         edx,esi
 00022DDC    shl         edx,3
 00022DDF    lea         eax,[ebx+0C]
 00022DE2    call        @ReallocMem
 00022DE7    mov         dword ptr [ebx+14],esi
 00022DEA    pop         esi
 00022DEB    pop         ebx
 00022DEC    ret
*}
end;

//00022DF0
procedure TStringList.SetSorted(Value:Boolean);
begin
{*
 00022DF0    push        ebx
 00022DF1    push        esi
 00022DF2    mov         ebx,edx
 00022DF4    mov         esi,eax
 00022DF6    cmp         bl,byte ptr [esi+18]
>00022DF9    je          00022E09
 00022DFB    test        bl,bl
>00022DFD    je          00022E06
 00022DFF    mov         eax,esi
 00022E01    mov         edx,dword ptr [eax]
 00022E03    call        dword ptr [edx+7C]
 00022E06    mov         byte ptr [esi+18],bl
 00022E09    pop         esi
 00022E0A    pop         ebx
 00022E0B    ret
*}
end;

//00022E0C
procedure TStringList.SetUpdateState(Updating:Boolean);
begin
{*
 00022E0C    test        dl,dl
>00022E0E    je          00022E16
 00022E10    mov         edx,dword ptr [eax]
 00022E12    call        dword ptr [edx+74]
 00022E15    ret
 00022E16    mov         edx,dword ptr [eax]
 00022E18    call        dword ptr [edx+70]
 00022E1B    ret
*}
end;

//00022E1C
procedure TStringList.Sort;
begin
{*
 00022E1C    push        ebx
 00022E1D    mov         ebx,eax
 00022E1F    cmp         byte ptr [ebx+18],0
>00022E23    jne         00022E46
 00022E25    cmp         dword ptr [ebx+10],1
>00022E29    jle         00022E46
 00022E2B    mov         eax,ebx
 00022E2D    mov         edx,dword ptr [eax]
 00022E2F    call        dword ptr [edx+74]
 00022E32    mov         ecx,dword ptr [ebx+10]
 00022E35    dec         ecx
 00022E36    xor         edx,edx
 00022E38    mov         eax,ebx
 00022E3A    call        TStringList.QuickSort
 00022E3F    mov         eax,ebx
 00022E41    mov         edx,dword ptr [eax]
 00022E43    call        dword ptr [edx+70]
 00022E46    pop         ebx
 00022E47    ret
*}
end;

//00022E48
function TStream.GetPosition:Longint;
begin
{*
 00022E48    push        ebx
 00022E49    mov         cx,1
 00022E4D    xor         edx,edx
 00022E4F    mov         ebx,dword ptr [eax]
 00022E51    call        dword ptr [ebx+0C]
 00022E54    pop         ebx
 00022E55    ret
*}
end;

//00022E58
procedure TStream.SetPosition(Pos:Longint);
begin
{*
 00022E58    push        ebx
 00022E59    xor         ecx,ecx
 00022E5B    mov         ebx,dword ptr [eax]
 00022E5D    call        dword ptr [ebx+0C]
 00022E60    pop         ebx
 00022E61    ret
*}
end;

//00022E64
function TStream.GetSize:Longint;
begin
{*
 00022E64    push        ebx
 00022E65    push        esi
 00022E66    push        edi
 00022E67    mov         ebx,eax
 00022E69    mov         cx,1
 00022E6D    xor         edx,edx
 00022E6F    mov         eax,ebx
 00022E71    mov         esi,dword ptr [eax]
 00022E73    call        dword ptr [esi+0C]
 00022E76    mov         esi,eax
 00022E78    mov         cx,2
 00022E7C    xor         edx,edx
 00022E7E    mov         eax,ebx
 00022E80    mov         edi,dword ptr [eax]
 00022E82    call        dword ptr [edi+0C]
 00022E85    mov         edi,eax
 00022E87    xor         ecx,ecx
 00022E89    mov         edx,esi
 00022E8B    mov         eax,ebx
 00022E8D    mov         ebx,dword ptr [eax]
 00022E8F    call        dword ptr [ebx+0C]
 00022E92    mov         eax,edi
 00022E94    pop         edi
 00022E95    pop         esi
 00022E96    pop         ebx
 00022E97    ret
*}
end;

//00022E98
procedure sub_00022E98;
begin
{*
 00022E98    ret
*}
end;

//00022E9C
procedure TStream.ReadBuffer(var Buffer:void ; Count:Longint);
begin
{*
 00022E9C    push        ebp
 00022E9D    mov         ebp,esp
 00022E9F    add         esp,0FFFFFFF8
 00022EA2    push        ebx
 00022EA3    push        esi
 00022EA4    xor         ebx,ebx
 00022EA6    mov         dword ptr [ebp-8],ebx
 00022EA9    mov         ebx,ecx
 00022EAB    mov         dword ptr [ebp-4],edx
 00022EAE    mov         esi,eax
 00022EB0    xor         eax,eax
 00022EB2    push        ebp
 00022EB3    push        22F09
 00022EB8    push        dword ptr fs:[eax]
 00022EBB    mov         dword ptr fs:[eax],esp
 00022EBE    test        ebx,ebx
>00022EC0    je          00022EF3
 00022EC2    mov         edx,dword ptr [ebp-4]
 00022EC5    mov         ecx,ebx
 00022EC7    mov         eax,esi
 00022EC9    mov         esi,dword ptr [eax]
 00022ECB    call        dword ptr [esi+4]
 00022ECE    cmp         ebx,eax
>00022ED0    je          00022EF3
 00022ED2    lea         edx,[ebp-8]
 00022ED5    mov         eax,[000B5B58];^SReadError:TResStringRec
 00022EDA    call        LoadResString
 00022EDF    mov         ecx,dword ptr [ebp-8]
 00022EE2    mov         dl,1
 00022EE4    mov         eax,[0001EB34];EReadError
 00022EE9    call        Exception.Create
 00022EEE    call        @RaiseExcept
 00022EF3    xor         eax,eax
 00022EF5    pop         edx
 00022EF6    pop         ecx
 00022EF7    pop         ecx
 00022EF8    mov         dword ptr fs:[eax],edx
 00022EFB    push        22F10
 00022F00    lea         eax,[ebp-8]
 00022F03    call        @LStrClr
 00022F08    ret
>00022F09    jmp         @HandleFinally
>00022F0E    jmp         00022F00
 00022F10    pop         esi
 00022F11    pop         ebx
 00022F12    pop         ecx
 00022F13    pop         ecx
 00022F14    pop         ebp
 00022F15    ret
*}
end;

//00022F18
procedure TStream.WriteBuffer(const Buffer:void ; Count:Longint);
begin
{*
 00022F18    push        ebp
 00022F19    mov         ebp,esp
 00022F1B    add         esp,0FFFFFFF8
 00022F1E    push        ebx
 00022F1F    push        esi
 00022F20    xor         ebx,ebx
 00022F22    mov         dword ptr [ebp-8],ebx
 00022F25    mov         ebx,ecx
 00022F27    mov         dword ptr [ebp-4],edx
 00022F2A    mov         esi,eax
 00022F2C    xor         eax,eax
 00022F2E    push        ebp
 00022F2F    push        22F85
 00022F34    push        dword ptr fs:[eax]
 00022F37    mov         dword ptr fs:[eax],esp
 00022F3A    test        ebx,ebx
>00022F3C    je          00022F6F
 00022F3E    mov         edx,dword ptr [ebp-4]
 00022F41    mov         ecx,ebx
 00022F43    mov         eax,esi
 00022F45    mov         esi,dword ptr [eax]
 00022F47    call        dword ptr [esi+8]
 00022F4A    cmp         ebx,eax
>00022F4C    je          00022F6F
 00022F4E    lea         edx,[ebp-8]
 00022F51    mov         eax,[000B5930];^SWriteError:TResStringRec
 00022F56    call        LoadResString
 00022F5B    mov         ecx,dword ptr [ebp-8]
 00022F5E    mov         dl,1
 00022F60    mov         eax,[0001EB8C];EWriteError
 00022F65    call        Exception.Create
 00022F6A    call        @RaiseExcept
 00022F6F    xor         eax,eax
 00022F71    pop         edx
 00022F72    pop         ecx
 00022F73    pop         ecx
 00022F74    mov         dword ptr fs:[eax],edx
 00022F77    push        22F8C
 00022F7C    lea         eax,[ebp-8]
 00022F7F    call        @LStrClr
 00022F84    ret
>00022F85    jmp         @HandleFinally
>00022F8A    jmp         00022F7C
 00022F8C    pop         esi
 00022F8D    pop         ebx
 00022F8E    pop         ecx
 00022F8F    pop         ecx
 00022F90    pop         ebp
 00022F91    ret
*}
end;

//00022F94
function TStream.ReadComponent(Instance:TComponent):TComponent;
begin
{*
 00022F94    push        ebp
 00022F95    mov         ebp,esp
 00022F97    add         esp,0FFFFFFF8
 00022F9A    push        ebx
 00022F9B    mov         ebx,edx
 00022F9D    push        1000
 00022FA2    mov         ecx,eax
 00022FA4    mov         dl,1
 00022FA6    mov         eax,[0001F8C0];TReader
 00022FAB    call        TFiler.Create
 00022FB0    mov         dword ptr [ebp-8],eax
 00022FB3    xor         eax,eax
 00022FB5    push        ebp
 00022FB6    push        22FE4
 00022FBB    push        dword ptr fs:[eax]
 00022FBE    mov         dword ptr fs:[eax],esp
 00022FC1    mov         edx,ebx
 00022FC3    mov         eax,dword ptr [ebp-8]
 00022FC6    call        TReader.ReadRootComponent
 00022FCB    mov         dword ptr [ebp-4],eax
 00022FCE    xor         eax,eax
 00022FD0    pop         edx
 00022FD1    pop         ecx
 00022FD2    pop         ecx
 00022FD3    mov         dword ptr fs:[eax],edx
 00022FD6    push        22FEB
 00022FDB    mov         eax,dword ptr [ebp-8]
 00022FDE    call        TObject.Free
 00022FE3    ret
>00022FE4    jmp         @HandleFinally
>00022FE9    jmp         00022FDB
 00022FEB    mov         eax,dword ptr [ebp-4]
 00022FEE    pop         ebx
 00022FEF    pop         ecx
 00022FF0    pop         ecx
 00022FF1    pop         ebp
 00022FF2    ret
*}
end;

//00022FF4
procedure TStream.WriteComponent(Instance:TComponent);
begin
{*
 00022FF4    xor         ecx,ecx
 00022FF6    call        TStream.WriteDescendent
 00022FFB    ret
*}
end;

//00022FFC
procedure TStream.WriteDescendent(Instance:TComponent; Ancestor:TComponent);
begin
{*
 00022FFC    push        ebp
 00022FFD    mov         ebp,esp
 00022FFF    push        ecx
 00023000    push        ebx
 00023001    push        esi
 00023002    mov         esi,ecx
 00023004    mov         ebx,edx
 00023006    push        1000
 0002300B    mov         ecx,eax
 0002300D    mov         dl,1
 0002300F    mov         eax,[0001F94C];TWriter
 00023014    call        TFiler.Create
 00023019    mov         dword ptr [ebp-4],eax
 0002301C    xor         eax,eax
 0002301E    push        ebp
 0002301F    push        2304C
 00023024    push        dword ptr fs:[eax]
 00023027    mov         dword ptr fs:[eax],esp
 0002302A    mov         ecx,esi
 0002302C    mov         edx,ebx
 0002302E    mov         eax,dword ptr [ebp-4]
 00023031    call        TWriter.WriteDescendent
 00023036    xor         eax,eax
 00023038    pop         edx
 00023039    pop         ecx
 0002303A    pop         ecx
 0002303B    mov         dword ptr fs:[eax],edx
 0002303E    push        23053
 00023043    mov         eax,dword ptr [ebp-4]
 00023046    call        TObject.Free
 0002304B    ret
>0002304C    jmp         @HandleFinally
>00023051    jmp         00023043
 00023053    pop         esi
 00023054    pop         ebx
 00023055    pop         ecx
 00023056    pop         ebp
 00023057    ret
*}
end;

//00023058
function THandleStream.Read(var Buffer:void ; Count:Longint):Longint;
begin
{*
 00023058    mov         eax,dword ptr [eax+4]
 0002305B    call        FileRead
 00023060    cmp         eax,0FFFFFFFF
>00023063    jne         00023067
 00023065    xor         eax,eax
 00023067    ret
*}
end;

//00023068
function THandleStream.Write(const Buffer:void ; Count:Longint):Longint;
begin
{*
 00023068    mov         eax,dword ptr [eax+4]
 0002306B    call        FileWrite
 00023070    cmp         eax,0FFFFFFFF
>00023073    jne         00023077
 00023075    xor         eax,eax
 00023077    ret
*}
end;

//00023078
function THandleStream.Seek(Offset:Longint; Origin:Word):Longint;
begin
{*
 00023078    movzx       ecx,cx
 0002307B    mov         eax,dword ptr [eax+4]
 0002307E    call        FileSeek
 00023083    ret
*}
end;

//00023084
procedure THandleStream.SetSize(NewSize:Longint);
begin
{*
 00023084    push        ebx
 00023085    push        esi
 00023086    mov         ebx,eax
 00023088    xor         ecx,ecx
 0002308A    mov         eax,ebx
 0002308C    mov         esi,dword ptr [eax]
 0002308E    call        dword ptr [esi+0C]
 00023091    mov         eax,dword ptr [ebx+4]
 00023094    push        eax
 00023095    call        kernel32.SetEndOfFile
 0002309A    call        Win32Check
 0002309F    pop         esi
 000230A0    pop         ebx
 000230A1    ret
*}
end;

//000230A4
constructor TFileStream.Create(const FileName:AnsiString; Mode:Word);
begin
{*
 000230A4    push        ebp
 000230A5    mov         ebp,esp
 000230A7    add         esp,0FFFFFFF0
 000230AA    push        ebx
 000230AB    push        esi
 000230AC    push        edi
 000230AD    xor         ebx,ebx
 000230AF    mov         dword ptr [ebp-10],ebx
 000230B2    test        dl,dl
>000230B4    je          000230BE
 000230B6    add         esp,0FFFFFFF0
 000230B9    call        @ClassCreate
 000230BE    mov         esi,ecx
 000230C0    mov         byte ptr [ebp-1],dl
 000230C3    mov         ebx,eax
 000230C5    mov         edi,dword ptr [ebp+8]
 000230C8    xor         eax,eax
 000230CA    push        ebp
 000230CB    push        23174
 000230D0    push        dword ptr fs:[eax]
 000230D3    mov         dword ptr fs:[eax],esp
 000230D6    cmp         di,0FFFF
>000230DB    jne         0002311D
 000230DD    mov         eax,esi
 000230DF    call        FileCreate
 000230E4    mov         edi,eax
 000230E6    mov         dword ptr [ebx+4],edi
 000230E9    test        edi,edi
>000230EB    jge         0002315E
 000230ED    mov         dword ptr [ebp-0C],esi
 000230F0    mov         byte ptr [ebp-8],0B
 000230F4    lea         eax,[ebp-0C]
 000230F7    push        eax
 000230F8    push        0
 000230FA    lea         edx,[ebp-10]
 000230FD    mov         eax,[000B5AC4];^SFCreateError:TResStringRec
 00023102    call        LoadResString
 00023107    mov         ecx,dword ptr [ebp-10]
 0002310A    mov         dl,1
 0002310C    mov         eax,[0001EA28];EFCreateError
 00023111    call        Exception.CreateFmt
 00023116    call        @RaiseExcept
>0002311B    jmp         0002315E
 0002311D    movzx       edx,di
 00023120    mov         eax,esi
 00023122    call        FileOpen
 00023127    mov         dword ptr [ebx+4],eax
 0002312A    cmp         dword ptr [ebx+4],0
>0002312E    jge         0002315E
 00023130    mov         dword ptr [ebp-0C],esi
 00023133    mov         byte ptr [ebp-8],0B
 00023137    lea         eax,[ebp-0C]
 0002313A    push        eax
 0002313B    push        0
 0002313D    lea         edx,[ebp-10]
 00023140    mov         eax,[000B5AF4];^SFOpenError:TResStringRec
 00023145    call        LoadResString
 0002314A    mov         ecx,dword ptr [ebp-10]
 0002314D    mov         dl,1
 0002314F    mov         eax,[0001EA84];EFOpenError
 00023154    call        Exception.CreateFmt
 00023159    call        @RaiseExcept
 0002315E    xor         eax,eax
 00023160    pop         edx
 00023161    pop         ecx
 00023162    pop         ecx
 00023163    mov         dword ptr fs:[eax],edx
 00023166    push        2317B
 0002316B    lea         eax,[ebp-10]
 0002316E    call        @LStrClr
 00023173    ret
>00023174    jmp         @HandleFinally
>00023179    jmp         0002316B
 0002317B    mov         eax,ebx
 0002317D    cmp         byte ptr [ebp-1],0
>00023181    je          00023192
 00023183    call        @AfterConstruction
 00023188    pop         dword ptr fs:[0]
 0002318F    add         esp,0C
 00023192    mov         eax,ebx
 00023194    pop         edi
 00023195    pop         esi
 00023196    pop         ebx
 00023197    mov         esp,ebp
 00023199    pop         ebp
 0002319A    ret         4
*}
end;

//000231A0
destructor TFileStream.Destroy;
begin
{*
 000231A0    push        ebx
 000231A1    push        esi
 000231A2    call        @BeforeDestruction
 000231A7    mov         ebx,edx
 000231A9    mov         esi,eax
 000231AB    mov         eax,dword ptr [esi+4]
 000231AE    test        eax,eax
>000231B0    jl          000231B7
 000231B2    call        FileClose
 000231B7    test        bl,bl
>000231B9    jle         000231C2
 000231BB    mov         eax,esi
 000231BD    call        @ClassDestroy
 000231C2    pop         esi
 000231C3    pop         ebx
 000231C4    ret
*}
end;

//000231C8
procedure TCustomMemoryStream.SetPointer(Ptr:Pointer; Size:Longint);
begin
{*
 000231C8    mov         dword ptr [eax+4],edx
 000231CB    mov         dword ptr [eax+8],ecx
 000231CE    ret
*}
end;

//000231D0
function TCustomMemoryStream.Read(var Buffer:void ; Count:Longint):Longint;
begin
{*
 000231D0    push        ebx
 000231D1    push        esi
 000231D2    push        edi
 000231D3    mov         ebx,eax
 000231D5    mov         edi,dword ptr [ebx+0C]
 000231D8    test        edi,edi
>000231DA    jl          00023200
 000231DC    test        ecx,ecx
>000231DE    jl          00023200
 000231E0    mov         esi,dword ptr [ebx+8]
 000231E3    sub         esi,edi
 000231E5    test        esi,esi
>000231E7    jle         00023200
 000231E9    cmp         ecx,esi
>000231EB    jge         000231EF
 000231ED    mov         esi,ecx
 000231EF    mov         eax,dword ptr [ebx+4]
 000231F2    add         eax,edi
 000231F4    mov         ecx,esi
 000231F6    call        Move
 000231FB    add         dword ptr [ebx+0C],esi
>000231FE    jmp         00023202
 00023200    xor         esi,esi
 00023202    mov         eax,esi
 00023204    pop         edi
 00023205    pop         esi
 00023206    pop         ebx
 00023207    ret
*}
end;

//00023208
function TCustomMemoryStream.Seek(Offset:Longint; Origin:Word):Longint;
begin
{*
 00023208    sub         cx,1
>0002320C    jb          00023217
>0002320E    je          0002321C
 00023210    dec         cx
>00023213    je          00023221
>00023215    jmp         00023227
 00023217    mov         dword ptr [eax+0C],edx
>0002321A    jmp         00023227
 0002321C    add         dword ptr [eax+0C],edx
>0002321F    jmp         00023227
 00023221    add         edx,dword ptr [eax+8]
 00023224    mov         dword ptr [eax+0C],edx
 00023227    mov         eax,dword ptr [eax+0C]
 0002322A    ret
*}
end;

//0002322C
destructor TPersistent.Destroy;
begin
{*
 0002322C    push        ebx
 0002322D    push        esi
 0002322E    call        @BeforeDestruction
 00023233    mov         ebx,edx
 00023235    mov         esi,eax
 00023237    mov         eax,esi
 00023239    call        RemoveFixups
 0002323E    mov         edx,ebx
 00023240    and         dl,0FC
 00023243    mov         eax,esi
 00023245    call        TObject.Destroy
 0002324A    test        bl,bl
>0002324C    jle         00023255
 0002324E    mov         eax,esi
 00023250    call        @ClassDestroy
 00023255    pop         esi
 00023256    pop         ebx
 00023257    ret
*}
end;

//00023258
procedure RemoveFixups(Instance:TPersistent);
begin
{*
 00023258    push        ebx
 00023259    mov         ebx,eax
 0002325B    xor         edx,edx
 0002325D    mov         eax,ebx
 0002325F    call        TMemoryStream.SetCapacity
 00023264    xor         eax,eax
 00023266    mov         dword ptr [ebx+8],eax
 00023269    xor         eax,eax
 0002326B    mov         dword ptr [ebx+0C],eax
 0002326E    pop         ebx
 0002326F    ret
*}
end;

//00023270
procedure TMemoryStream.SetCapacity(NewCapacity:Longint);
begin
{*
 00023270    push        ebx
 00023271    push        ecx
 00023272    mov         dword ptr [esp],edx
 00023275    mov         ebx,eax
 00023277    mov         edx,esp
 00023279    mov         eax,ebx
 0002327B    mov         ecx,dword ptr [eax]
 0002327D    call        dword ptr [ecx+10]
 00023280    mov         edx,eax
 00023282    mov         ecx,dword ptr [ebx+8]
 00023285    mov         eax,ebx
 00023287    call        TCustomMemoryStream.SetPointer
 0002328C    mov         eax,dword ptr [esp]
 0002328F    mov         dword ptr [ebx+10],eax
 00023292    pop         edx
 00023293    pop         ebx
 00023294    ret
*}
end;

//00023298
procedure TMemoryStream.SetSize(NewSize:Longint);
begin
{*
 00023298    push        ebx
 00023299    push        esi
 0002329A    push        edi
 0002329B    mov         esi,edx
 0002329D    mov         ebx,eax
 0002329F    mov         edi,dword ptr [ebx+0C]
 000232A2    mov         edx,esi
 000232A4    mov         eax,ebx
 000232A6    call        TMemoryStream.SetCapacity
 000232AB    mov         dword ptr [ebx+8],esi
 000232AE    cmp         esi,edi
>000232B0    jge         000232BF
 000232B2    mov         cx,2
 000232B6    xor         edx,edx
 000232B8    mov         eax,ebx
 000232BA    mov         ebx,dword ptr [eax]
 000232BC    call        dword ptr [ebx+0C]
 000232BF    pop         edi
 000232C0    pop         esi
 000232C1    pop         ebx
 000232C2    ret
*}
end;

//000232C4
function TMemoryStream.Realloc(var NewCapacity:Longint):Pointer;
begin
{*
 000232C4    push        ebp
 000232C5    mov         ebp,esp
 000232C7    push        0
 000232C9    push        ebx
 000232CA    push        esi
 000232CB    push        edi
 000232CC    xor         ecx,ecx
 000232CE    push        ebp
 000232CF    push        23373
 000232D4    push        dword ptr fs:[ecx]
 000232D7    mov         dword ptr fs:[ecx],esp
 000232DA    cmp         dword ptr [edx],0
>000232DD    jle         000232EF
 000232DF    mov         ecx,dword ptr [edx]
 000232E1    add         ecx,1FFF
 000232E7    and         ecx,0FFFFE000
 000232ED    mov         dword ptr [edx],ecx
 000232EF    mov         esi,dword ptr [eax+4]
 000232F2    mov         ebx,esi
 000232F4    mov         edi,dword ptr [edx]
 000232F6    mov         ecx,dword ptr [eax+10]
 000232F9    cmp         edi,ecx
>000232FB    je          0002335D
 000232FD    cmp         dword ptr [edx],0
>00023300    jne         0002330D
 00023302    mov         eax,esi
 00023304    call        GlobalFreePtr
 00023309    xor         ebx,ebx
>0002330B    jmp         0002335D
 0002330D    test        ecx,ecx
>0002330F    jne         00023324
 00023311    mov         eax,[000B5AE0]
 00023316    movzx       eax,word ptr [eax]
 00023319    mov         edx,dword ptr [edx]
 0002331B    call        GlobalAllocPtr
 00023320    mov         ebx,eax
>00023322    jmp         00023338
 00023324    mov         ecx,dword ptr ds:[0B5AE0]
 0002332A    movzx       ecx,word ptr [ecx]
 0002332D    mov         edx,dword ptr [edx]
 0002332F    mov         eax,esi
 00023331    call        GlobalReAllocPtr
 00023336    mov         ebx,eax
 00023338    test        ebx,ebx
>0002333A    jne         0002335D
 0002333C    lea         edx,[ebp-4]
 0002333F    mov         eax,[000B5B84];^SMemoryStreamError:TResStringRec
 00023344    call        LoadResString
 00023349    mov         ecx,dword ptr [ebp-4]
 0002334C    mov         dl,1
 0002334E    mov         eax,[0001E9CC];EStreamError
 00023353    call        Exception.Create
 00023358    call        @RaiseExcept
 0002335D    xor         eax,eax
 0002335F    pop         edx
 00023360    pop         ecx
 00023361    pop         ecx
 00023362    mov         dword ptr fs:[eax],edx
 00023365    push        2337A
 0002336A    lea         eax,[ebp-4]
 0002336D    call        @LStrClr
 00023372    ret
>00023373    jmp         @HandleFinally
>00023378    jmp         0002336A
 0002337A    mov         eax,ebx
 0002337C    pop         edi
 0002337D    pop         esi
 0002337E    pop         ebx
 0002337F    pop         ecx
 00023380    pop         ebp
 00023381    ret
*}
end;

//00023384
function TMemoryStream.Write(const Buffer:void ; Count:Longint):Longint;
begin
{*
 00023384    push        ebx
 00023385    push        esi
 00023386    push        edi
 00023387    push        ebp
 00023388    mov         esi,ecx
 0002338A    mov         ebp,edx
 0002338C    mov         ebx,eax
 0002338E    mov         eax,dword ptr [ebx+0C]
 00023391    test        eax,eax
>00023393    jl          000233CD
 00023395    test        esi,esi
>00023397    jl          000233CD
 00023399    mov         edi,eax
 0002339B    add         edi,esi
 0002339D    test        edi,edi
>0002339F    jle         000233CD
 000233A1    cmp         edi,dword ptr [ebx+8]
>000233A4    jle         000233B7
 000233A6    cmp         edi,dword ptr [ebx+10]
>000233A9    jle         000233B4
 000233AB    mov         edx,edi
 000233AD    mov         eax,ebx
 000233AF    call        TMemoryStream.SetCapacity
 000233B4    mov         dword ptr [ebx+8],edi
 000233B7    mov         edx,dword ptr [ebx+4]
 000233BA    add         edx,dword ptr [ebx+0C]
 000233BD    mov         eax,ebp
 000233BF    mov         ecx,esi
 000233C1    call        Move
 000233C6    mov         dword ptr [ebx+0C],edi
 000233C9    mov         eax,esi
>000233CB    jmp         000233CF
 000233CD    xor         eax,eax
 000233CF    pop         ebp
 000233D0    pop         edi
 000233D1    pop         esi
 000233D2    pop         ebx
 000233D3    ret
*}
end;

//000233D4
constructor TResourceStream.Create(Instance:THandle; const ResName:AnsiString; ResType:PChar);
begin
{*
 000233D4    push        ebp
 000233D5    mov         ebp,esp
 000233D7    push        ebx
 000233D8    push        esi
 000233D9    push        edi
 000233DA    test        dl,dl
>000233DC    je          000233E6
 000233DE    add         esp,0FFFFFFF0
 000233E1    call        @ClassCreate
 000233E6    mov         esi,ecx
 000233E8    mov         ebx,edx
 000233EA    mov         edi,eax
 000233EC    xor         edx,edx
 000233EE    mov         eax,edi
 000233F0    call        TObject.Create
 000233F5    mov         eax,dword ptr [ebp+8]
 000233F8    push        eax
 000233F9    mov         eax,dword ptr [ebp+0C]
 000233FC    call        @LStrToPChar
 00023401    mov         ecx,eax
 00023403    mov         edx,esi
 00023405    mov         eax,edi
 00023407    call        TResourceStream.Initialize
 0002340C    mov         eax,edi
 0002340E    test        bl,bl
>00023410    je          00023421
 00023412    call        @AfterConstruction
 00023417    pop         dword ptr fs:[0]
 0002341E    add         esp,0C
 00023421    mov         eax,edi
 00023423    pop         edi
 00023424    pop         esi
 00023425    pop         ebx
 00023426    pop         ebp
 00023427    ret         8
*}
end;

//0002342C
procedure Error;
begin
{*
 0002342C    push        ebp
 0002342D    mov         ebp,esp
 0002342F    add         esp,0FFFFFFF0
 00023432    xor         eax,eax
 00023434    mov         dword ptr [ebp-4],eax
 00023437    mov         dword ptr [ebp-8],eax
 0002343A    xor         eax,eax
 0002343C    push        ebp
 0002343D    push        234A2
 00023442    push        dword ptr fs:[eax]
 00023445    mov         dword ptr fs:[eax],esp
 00023448    lea         eax,[ebp-4]
 0002344B    push        eax
 0002344C    lea         edx,[ebp-8]
 0002344F    mov         eax,[000B58DC];^SResNotFound:TResStringRec
 00023454    call        LoadResString
 00023459    mov         eax,dword ptr [ebp-8]
 0002345C    mov         edx,dword ptr [ebp+8]
 0002345F    mov         edx,dword ptr [edx-4]
 00023462    mov         dword ptr [ebp-10],edx
 00023465    mov         byte ptr [ebp-0C],6
 00023469    lea         edx,[ebp-10]
 0002346C    xor         ecx,ecx
 0002346E    call        Format
 00023473    mov         ecx,dword ptr [ebp-4]
 00023476    mov         dl,1
 00023478    mov         eax,[0001EC40];EResNotFound
 0002347D    call        Exception.Create
 00023482    call        @RaiseExcept
 00023487    xor         eax,eax
 00023489    pop         edx
 0002348A    pop         ecx
 0002348B    pop         ecx
 0002348C    mov         dword ptr fs:[eax],edx
 0002348F    push        234A9
 00023494    lea         eax,[ebp-8]
 00023497    mov         edx,2
 0002349C    call        @LStrArrayClr
 000234A1    ret
>000234A2    jmp         @HandleFinally
>000234A7    jmp         00023494
 000234A9    mov         esp,ebp
 000234AB    pop         ebp
 000234AC    ret
*}
end;

//000234B0
procedure TResourceStream.Initialize(Instance:THandle; Name:PChar; ResType:PChar);
begin
{*
 000234B0    push        ebp
 000234B1    mov         ebp,esp
 000234B3    push        ecx
 000234B4    push        ebx
 000234B5    push        esi
 000234B6    push        edi
 000234B7    mov         dword ptr [ebp-4],ecx
 000234BA    mov         esi,edx
 000234BC    mov         ebx,eax
 000234BE    mov         eax,dword ptr [ebp+8]
 000234C1    push        eax
 000234C2    mov         eax,dword ptr [ebp-4]
 000234C5    push        eax
 000234C6    push        esi
 000234C7    call        kernel32.FindResourceA
 000234CC    mov         edi,eax
 000234CE    mov         dword ptr [ebx+10],edi
 000234D1    test        edi,edi
>000234D3    jne         000234DC
 000234D5    push        ebp
 000234D6    call        Error
 000234DB    pop         ecx
 000234DC    mov         eax,dword ptr [ebx+10]
 000234DF    push        eax
 000234E0    push        esi
 000234E1    call        kernel32.LoadResource
 000234E6    mov         edi,eax
 000234E8    mov         dword ptr [ebx+14],edi
 000234EB    test        edi,edi
>000234ED    jne         000234F6
 000234EF    push        ebp
 000234F0    call        Error
 000234F5    pop         ecx
 000234F6    mov         eax,dword ptr [ebx+10]
 000234F9    push        eax
 000234FA    push        esi
 000234FB    call        kernel32.SizeofResource
 00023500    push        eax
 00023501    mov         eax,dword ptr [ebx+14]
 00023504    push        eax
 00023505    call        kernel32.LockResource
 0002350A    mov         edx,eax
 0002350C    mov         eax,ebx
 0002350E    pop         ecx
 0002350F    call        TCustomMemoryStream.SetPointer
 00023514    pop         edi
 00023515    pop         esi
 00023516    pop         ebx
 00023517    pop         ecx
 00023518    pop         ebp
 00023519    ret         4
*}
end;

//0002351C
destructor TResourceStream.Destroy;
begin
{*
 0002351C    push        ebx
 0002351D    push        esi
 0002351E    call        @BeforeDestruction
 00023523    mov         ebx,edx
 00023525    mov         esi,eax
 00023527    mov         eax,dword ptr [esi+14]
 0002352A    call        UnlockResource
 0002352F    mov         eax,dword ptr [esi+14]
 00023532    push        eax
 00023533    call        kernel32.FreeResource
 00023538    mov         edx,ebx
 0002353A    and         dl,0FC
 0002353D    mov         eax,esi
 0002353F    call        TObject.Destroy
 00023544    test        bl,bl
>00023546    jle         0002354F
 00023548    mov         eax,esi
 0002354A    call        @ClassDestroy
 0002354F    pop         esi
 00023550    pop         ebx
 00023551    ret
*}
end;

//00023554
function TResourceStream.Write(const Buffer:void ; Count:Longint):Longint;
begin
{*
 00023554    push        ebp
 00023555    mov         ebp,esp
 00023557    push        0
 00023559    push        ebx
 0002355A    xor         eax,eax
 0002355C    push        ebp
 0002355D    push        2359F
 00023562    push        dword ptr fs:[eax]
 00023565    mov         dword ptr fs:[eax],esp
 00023568    lea         edx,[ebp-4]
 0002356B    mov         eax,[000B5908];^SCantWriteResourceStreamError:TResStringRec
 00023570    call        LoadResString
 00023575    mov         ecx,dword ptr [ebp-4]
 00023578    mov         dl,1
 0002357A    mov         eax,[0001E9CC];EStreamError
 0002357F    call        Exception.Create
 00023584    call        @RaiseExcept
 00023589    xor         eax,eax
 0002358B    pop         edx
 0002358C    pop         ecx
 0002358D    pop         ecx
 0002358E    mov         dword ptr fs:[eax],edx
 00023591    push        235A6
 00023596    lea         eax,[ebp-4]
 00023599    call        @LStrClr
 0002359E    ret
>0002359F    jmp         @HandleFinally
>000235A4    jmp         00023596
 000235A6    mov         eax,ebx
 000235A8    pop         ebx
 000235A9    pop         ecx
 000235AA    pop         ebp
 000235AB    ret
*}
end;

//000235AC
constructor TFiler.Create(Stream:TStream; BufSize:Integer);
begin
{*
 000235AC    push        ebp
 000235AD    mov         ebp,esp
 000235AF    push        ebx
 000235B0    push        esi
 000235B1    push        edi
 000235B2    test        dl,dl
>000235B4    je          000235BE
 000235B6    add         esp,0FFFFFFF0
 000235B9    call        @ClassCreate
 000235BE    mov         ebx,edx
 000235C0    mov         edi,eax
 000235C2    mov         esi,dword ptr [ebp+8]
 000235C5    mov         dword ptr [edi+4],ecx
 000235C8    mov         eax,esi
 000235CA    call        @GetMem
 000235CF    mov         dword ptr [edi+8],eax
 000235D2    mov         dword ptr [edi+0C],esi
 000235D5    mov         eax,edi
 000235D7    test        bl,bl
>000235D9    je          000235EA
 000235DB    call        @AfterConstruction
 000235E0    pop         dword ptr fs:[0]
 000235E7    add         esp,0C
 000235EA    mov         eax,edi
 000235EC    pop         edi
 000235ED    pop         esi
 000235EE    pop         ebx
 000235EF    pop         ebp
 000235F0    ret         4
*}
end;

//000235F4
destructor TFiler.Destroy;
begin
{*
 000235F4    push        ebx
 000235F5    push        esi
 000235F6    call        @BeforeDestruction
 000235FB    mov         ebx,edx
 000235FD    mov         esi,eax
 000235FF    mov         eax,dword ptr [esi+8]
 00023602    test        eax,eax
>00023604    je          0002360E
 00023606    mov         edx,dword ptr [esi+0C]
 00023609    call        @FreeMem
 0002360E    test        bl,bl
>00023610    jle         00023619
 00023612    mov         eax,esi
 00023614    call        @ClassDestroy
 00023619    pop         esi
 0002361A    pop         ebx
 0002361B    ret
*}
end;

//00023690
constructor TPropFixup.Create(Instance:TPersistent; InstanceRoot:TComponent; PropInfo:PPropInfo; const RootName:AnsiString; const Name:AnsiString);
begin
{*
 00023690    push        ebp
 00023691    mov         ebp,esp
 00023693    push        ebx
 00023694    push        esi
 00023695    test        dl,dl
>00023697    je          000236A1
 00023699    add         esp,0FFFFFFF0
 0002369C    call        @ClassCreate
 000236A1    mov         ebx,edx
 000236A3    mov         esi,eax
 000236A5    mov         dword ptr [esi+4],ecx
 000236A8    mov         eax,dword ptr [ebp+14]
 000236AB    mov         dword ptr [esi+8],eax
 000236AE    mov         eax,dword ptr [ebp+10]
 000236B1    mov         dword ptr [esi+0C],eax
 000236B4    lea         eax,[esi+10]
 000236B7    mov         edx,dword ptr [ebp+0C]
 000236BA    call        @LStrAsg
 000236BF    lea         eax,[esi+14]
 000236C2    mov         edx,dword ptr [ebp+8]
 000236C5    call        @LStrAsg
 000236CA    mov         eax,esi
 000236CC    test        bl,bl
>000236CE    je          000236DF
 000236D0    call        @AfterConstruction
 000236D5    pop         dword ptr fs:[0]
 000236DC    add         esp,0C
 000236DF    mov         eax,esi
 000236E1    pop         esi
 000236E2    pop         ebx
 000236E3    pop         ebp
 000236E4    ret         10
*}
end;

//000236E8
procedure AddFinished(Instance:TPersistent);
begin
{*
 000236E8    push        ebp
 000236E9    mov         ebp,esp
 000236EB    push        ebx
 000236EC    mov         ebx,eax
 000236EE    mov         eax,dword ptr [ebp+8]
 000236F1    mov         eax,dword ptr [eax-4]
 000236F4    mov         edx,ebx
 000236F6    call        TList.IndexOf
 000236FB    test        eax,eax
>000236FD    jge         0002371D
 000236FF    mov         eax,dword ptr [ebp+8]
 00023702    mov         eax,dword ptr [eax-8]
 00023705    mov         edx,ebx
 00023707    call        TList.IndexOf
 0002370C    test        eax,eax
>0002370E    jl          0002371D
 00023710    mov         eax,dword ptr [ebp+8]
 00023713    mov         eax,dword ptr [eax-4]
 00023716    mov         edx,ebx
 00023718    call        TList.Add
 0002371D    pop         ebx
 0002371E    pop         ebp
 0002371F    ret
*}
end;

//00023720
procedure AddNotFinished(Instance:TPersistent);
begin
{*
 00023720    push        ebp
 00023721    mov         ebp,esp
 00023723    push        ebx
 00023724    mov         ebx,eax
 00023726    mov         eax,dword ptr [ebp+8]
 00023729    mov         eax,dword ptr [eax-4]
 0002372C    mov         edx,ebx
 0002372E    call        TList.IndexOf
 00023733    cmp         eax,0FFFFFFFF
>00023736    je          00023744
 00023738    mov         edx,dword ptr [ebp+8]
 0002373B    mov         edx,dword ptr [edx-4]
 0002373E    xchg        eax,edx
 0002373F    call        TList.Delete
 00023744    mov         eax,dword ptr [ebp+8]
 00023747    mov         eax,dword ptr [eax-8]
 0002374A    mov         edx,ebx
 0002374C    call        TList.IndexOf
 00023751    test        eax,eax
>00023753    jge         00023762
 00023755    mov         eax,dword ptr [ebp+8]
 00023758    mov         eax,dword ptr [eax-8]
 0002375B    mov         edx,ebx
 0002375D    call        TList.Add
 00023762    pop         ebx
 00023763    pop         ebp
 00023764    ret
*}
end;

//00023768
procedure GlobalFixupReferences;
begin
{*
 00023768    push        ebp
 00023769    mov         ebp,esp
 0002376B    add         esp,0FFFFFFF0
 0002376E    push        ebx
 0002376F    push        esi
 00023770    push        edi
 00023771    cmp         dword ptr ds:[0B6618],0
>00023778    je          00023941
 0002377E    mov         eax,[000B6614]
 00023783    call        TMultiReadExclusiveWriteSynchronizer.BeginWrite
 00023788    xor         eax,eax
 0002378A    push        ebp
 0002378B    push        2393A
 00023790    push        dword ptr fs:[eax]
 00023793    mov         dword ptr fs:[eax],esp
 00023796    mov         eax,[000B662C]
 0002379B    call        TThreadList.LockList
 000237A0    mov         edi,eax
 000237A2    xor         eax,eax
 000237A4    push        ebp
 000237A5    push        2391B
 000237AA    push        dword ptr fs:[eax]
 000237AD    mov         dword ptr fs:[eax],esp
 000237B0    cmp         dword ptr [edi+8],0
>000237B4    jle         00023903
 000237BA    mov         dl,1
 000237BC    mov         eax,[0001EEC4];TList
 000237C1    call        TObject.Create
 000237C6    mov         dword ptr [ebp-4],eax
 000237C9    xor         eax,eax
 000237CB    push        ebp
 000237CC    push        238FC
 000237D1    push        dword ptr fs:[eax]
 000237D4    mov         dword ptr fs:[eax],esp
 000237D7    mov         dl,1
 000237D9    mov         eax,[0001EEC4];TList
 000237DE    call        TObject.Create
 000237E3    mov         dword ptr [ebp-8],eax
 000237E6    xor         eax,eax
 000237E8    push        ebp
 000237E9    push        238AC
 000237EE    push        dword ptr fs:[eax]
 000237F1    mov         dword ptr fs:[eax],esp
 000237F4    xor         esi,esi
>000237F6    jmp         0002388D
 000237FB    mov         edx,esi
 000237FD    mov         eax,edi
 000237FF    call        TList.Get
 00023804    mov         ebx,eax
 00023806    mov         eax,dword ptr [ebx+10]
 00023809    call        dword ptr ds:[0B6618]
 0002380F    mov         dword ptr [ebp-0C],eax
 00023812    cmp         dword ptr [ebp-0C],0
>00023816    jne         00023827
 00023818    mov         edx,dword ptr [ebx+0C]
 0002381B    mov         eax,dword ptr [ebx+4]
 0002381E    call        GetOrdProp
 00023823    test        eax,eax
>00023825    je          00023882
 00023827    cmp         dword ptr [ebp-0C],0
>0002382B    je          00023866
 0002382D    mov         edx,dword ptr [ebx+14]
 00023830    mov         eax,dword ptr [ebp-0C]
 00023833    call        TComponent.FindComponent
 00023838    mov         dword ptr [ebp-10],eax
 0002383B    cmp         dword ptr [ebp-10],0
>0002383F    jne         00023858
 00023841    mov         eax,dword ptr [ebx+14]
 00023844    mov         edx,23950;'OWNER'
 00023849    call        CompareText
 0002384E    test        eax,eax
>00023850    jne         00023858
 00023852    mov         eax,dword ptr [ebp-0C]
 00023855    mov         dword ptr [ebp-10],eax
 00023858    mov         edx,dword ptr [ebx+0C]
 0002385B    mov         eax,dword ptr [ebx+4]
 0002385E    mov         ecx,dword ptr [ebp-10]
 00023861    call        SetOrdProp
 00023866    push        ebp
 00023867    mov         eax,dword ptr [ebx+4]
 0002386A    call        AddFinished
 0002386F    pop         ecx
 00023870    mov         edx,esi
 00023872    mov         eax,edi
 00023874    call        TList.Delete
 00023879    mov         eax,ebx
 0002387B    call        TObject.Free
>00023880    jmp         0002388D
 00023882    push        ebp
 00023883    mov         eax,dword ptr [ebx+4]
 00023886    call        AddNotFinished
 0002388B    pop         ecx
 0002388C    inc         esi
 0002388D    cmp         esi,dword ptr [edi+8]
>00023890    jl          000237FB
 00023896    xor         eax,eax
 00023898    pop         edx
 00023899    pop         ecx
 0002389A    pop         ecx
 0002389B    mov         dword ptr fs:[eax],edx
 0002389E    push        238B3
 000238A3    mov         eax,dword ptr [ebp-8]
 000238A6    call        TObject.Free
 000238AB    ret
>000238AC    jmp         @HandleFinally
>000238B1    jmp         000238A3
 000238B3    mov         eax,dword ptr [ebp-4]
 000238B6    mov         ebx,dword ptr [eax+8]
 000238B9    dec         ebx
 000238BA    test        ebx,ebx
>000238BC    jl          000238E6
 000238BE    inc         ebx
 000238BF    xor         esi,esi
 000238C1    mov         edx,esi
 000238C3    mov         eax,dword ptr [ebp-4]
 000238C6    call        TList.Get
 000238CB    mov         edi,eax
 000238CD    mov         eax,edi
 000238CF    mov         edx,dword ptr ds:[1FA0C];TComponent
 000238D5    call        @IsClass
 000238DA    test        al,al
>000238DC    je          000238E2
 000238DE    and         byte ptr [edi+20],7F
 000238E2    inc         esi
 000238E3    dec         ebx
>000238E4    jne         000238C1
 000238E6    xor         eax,eax
 000238E8    pop         edx
 000238E9    pop         ecx
 000238EA    pop         ecx
 000238EB    mov         dword ptr fs:[eax],edx
 000238EE    push        23903
 000238F3    mov         eax,dword ptr [ebp-4]
 000238F6    call        TObject.Free
 000238FB    ret
>000238FC    jmp         @HandleFinally
>00023901    jmp         000238F3
 00023903    xor         eax,eax
 00023905    pop         edx
 00023906    pop         ecx
 00023907    pop         ecx
 00023908    mov         dword ptr fs:[eax],edx
 0002390B    push        23922
 00023910    mov         eax,[000B662C]
 00023915    call        TThreadList.UnlockList
 0002391A    ret
>0002391B    jmp         @HandleFinally
>00023920    jmp         00023910
 00023922    xor         eax,eax
 00023924    pop         edx
 00023925    pop         ecx
 00023926    pop         ecx
 00023927    mov         dword ptr fs:[eax],edx
 0002392A    push        23941
 0002392F    mov         eax,[000B6614]
 00023934    call        TMultiReadExclusiveWriteSynchronizer.EndWrite
 00023939    ret
>0002393A    jmp         @HandleFinally
>0002393F    jmp         0002392F
 00023941    pop         edi
 00023942    pop         esi
 00023943    pop         ebx
 00023944    mov         esp,ebp
 00023946    pop         ebp
 00023947    ret
*}
end;

//00023958
procedure RemoveFixupReferences(Root:TComponent; const RootName:AnsiString);
begin
{*
 00023958    push        ebp
 00023959    mov         ebp,esp
 0002395B    add         esp,0FFFFFFF8
 0002395E    push        ebx
 0002395F    push        esi
 00023960    push        edi
 00023961    mov         dword ptr [ebp-8],edx
 00023964    mov         dword ptr [ebp-4],eax
 00023967    cmp         dword ptr ds:[0B662C],0
>0002396E    je          000239FA
 00023974    mov         eax,[000B662C]
 00023979    call        TThreadList.LockList
 0002397E    mov         edi,eax
 00023980    xor         eax,eax
 00023982    push        ebp
 00023983    push        239F3
 00023988    push        dword ptr fs:[eax]
 0002398B    mov         dword ptr fs:[eax],esp
 0002398E    mov         ebx,dword ptr [edi+8]
 00023991    dec         ebx
 00023992    cmp         ebx,0
>00023995    jl          000239DB
 00023997    mov         edx,ebx
 00023999    mov         eax,edi
 0002399B    call        TList.Get
 000239A0    mov         esi,eax
 000239A2    cmp         dword ptr [ebp-4],0
>000239A6    je          000239B0
 000239A8    mov         eax,dword ptr [esi+8]
 000239AB    cmp         eax,dword ptr [ebp-4]
>000239AE    jne         000239D5
 000239B0    cmp         dword ptr [ebp-8],0
>000239B4    je          000239C5
 000239B6    mov         edx,dword ptr [esi+10]
 000239B9    mov         eax,dword ptr [ebp-8]
 000239BC    call        CompareText
 000239C1    test        eax,eax
>000239C3    jne         000239D5
 000239C5    mov         edx,ebx
 000239C7    mov         eax,edi
 000239C9    call        TList.Delete
 000239CE    mov         eax,esi
 000239D0    call        TObject.Free
 000239D5    dec         ebx
 000239D6    cmp         ebx,0FFFFFFFF
>000239D9    jne         00023997
 000239DB    xor         eax,eax
 000239DD    pop         edx
 000239DE    pop         ecx
 000239DF    pop         ecx
 000239E0    mov         dword ptr fs:[eax],edx
 000239E3    push        239FA
 000239E8    mov         eax,[000B662C]
 000239ED    call        TThreadList.UnlockList
 000239F2    ret
>000239F3    jmp         @HandleFinally
>000239F8    jmp         000239E8
 000239FA    pop         edi
 000239FB    pop         esi
 000239FC    pop         ebx
 000239FD    pop         ecx
 000239FE    pop         ecx
 000239FF    pop         ebp
 00023A00    ret
*}
end;

//00023A04
procedure TMemoryStream.Clear;
begin
{*
 00023A04    push        ebp
 00023A05    mov         ebp,esp
 00023A07    push        ecx
 00023A08    push        ebx
 00023A09    push        esi
 00023A0A    push        edi
 00023A0B    mov         dword ptr [ebp-4],eax
 00023A0E    cmp         dword ptr ds:[0B662C],0
>00023A15    je          00023A82
 00023A17    mov         eax,[000B662C]
 00023A1C    call        TThreadList.LockList
 00023A21    mov         edi,eax
 00023A23    xor         eax,eax
 00023A25    push        ebp
 00023A26    push        23A7B
 00023A2B    push        dword ptr fs:[eax]
 00023A2E    mov         dword ptr fs:[eax],esp
 00023A31    mov         ebx,dword ptr [edi+8]
 00023A34    dec         ebx
 00023A35    cmp         ebx,0
>00023A38    jl          00023A63
 00023A3A    mov         edx,ebx
 00023A3C    mov         eax,edi
 00023A3E    call        TList.Get
 00023A43    mov         esi,eax
 00023A45    mov         eax,dword ptr [esi+4]
 00023A48    cmp         eax,dword ptr [ebp-4]
>00023A4B    jne         00023A5D
 00023A4D    mov         edx,ebx
 00023A4F    mov         eax,edi
 00023A51    call        TList.Delete
 00023A56    mov         eax,esi
 00023A58    call        TObject.Free
 00023A5D    dec         ebx
 00023A5E    cmp         ebx,0FFFFFFFF
>00023A61    jne         00023A3A
 00023A63    xor         eax,eax
 00023A65    pop         edx
 00023A66    pop         ecx
 00023A67    pop         ecx
 00023A68    mov         dword ptr fs:[eax],edx
 00023A6B    push        23A82
 00023A70    mov         eax,[000B662C]
 00023A75    call        TThreadList.UnlockList
 00023A7A    ret
>00023A7B    jmp         @HandleFinally
>00023A80    jmp         00023A70
 00023A82    pop         edi
 00023A83    pop         esi
 00023A84    pop         ebx
 00023A85    pop         ecx
 00023A86    pop         ebp
 00023A87    ret
*}
end;

//00023A88
procedure ReadError(const Ident:AnsiString);
begin
{*
 00023A88    push        ebx
 00023A89    mov         ebx,eax
 00023A8B    mov         ecx,ebx
 00023A8D    mov         dl,1
 00023A8F    mov         eax,[0001EB34];EReadError
 00023A94    call        Exception.Create
 00023A99    call        @RaiseExcept
 00023A9E    pop         ebx
 00023A9F    ret
*}
end;

//00023AA0
procedure PropValueError;
begin
{*
 00023AA0    push        ebp
 00023AA1    mov         ebp,esp
 00023AA3    push        0
 00023AA5    xor         eax,eax
 00023AA7    push        ebp
 00023AA8    push        23ADE
 00023AAD    push        dword ptr fs:[eax]
 00023AB0    mov         dword ptr fs:[eax],esp
 00023AB3    lea         edx,[ebp-4]
 00023AB6    mov         eax,[000B59C8];^SInvalidProperty:TResStringRec
 00023ABB    call        LoadResString
 00023AC0    mov         eax,dword ptr [ebp-4]
 00023AC3    call        ReadError
 00023AC8    xor         eax,eax
 00023ACA    pop         edx
 00023ACB    pop         ecx
 00023ACC    pop         ecx
 00023ACD    mov         dword ptr fs:[eax],edx
 00023AD0    push        23AE5
 00023AD5    lea         eax,[ebp-4]
 00023AD8    call        @LStrClr
 00023ADD    ret
>00023ADE    jmp         @HandleFinally
>00023AE3    jmp         00023AD5
 00023AE5    pop         ecx
 00023AE6    pop         ebp
 00023AE7    ret
*}
end;

//00023AE8
procedure PropertyNotFound;
begin
{*
 00023AE8    push        ebp
 00023AE9    mov         ebp,esp
 00023AEB    push        0
 00023AED    xor         eax,eax
 00023AEF    push        ebp
 00023AF0    push        23B26
 00023AF5    push        dword ptr fs:[eax]
 00023AF8    mov         dword ptr fs:[eax],esp
 00023AFB    lea         edx,[ebp-4]
 00023AFE    mov         eax,[000B5728];^SUnknownProperty:TResStringRec
 00023B03    call        LoadResString
 00023B08    mov         eax,dword ptr [ebp-4]
 00023B0B    call        ReadError
 00023B10    xor         eax,eax
 00023B12    pop         edx
 00023B13    pop         ecx
 00023B14    pop         ecx
 00023B15    mov         dword ptr fs:[eax],edx
 00023B18    push        23B2D
 00023B1D    lea         eax,[ebp-4]
 00023B20    call        @LStrClr
 00023B25    ret
>00023B26    jmp         @HandleFinally
>00023B2B    jmp         00023B1D
 00023B2D    pop         ecx
 00023B2E    pop         ebp
 00023B2F    ret
*}
end;

//00023B30
function EnumValue(EnumType:PTypeInfo; const EnumName:AnsiString):Integer;
begin
{*
 00023B30    push        ebx
 00023B31    call        GetEnumValue
 00023B36    mov         ebx,eax
 00023B38    cmp         ebx,0FFFFFFFF
>00023B3B    jne         00023B42
 00023B3D    call        PropValueError
 00023B42    mov         eax,ebx
 00023B44    pop         ebx
 00023B45    ret
*}
end;

//00023B48
destructor TReader.Destroy;
begin
{*
 00023B48    push        ebx
 00023B49    push        esi
 00023B4A    push        edi
 00023B4B    call        @BeforeDestruction
 00023B50    mov         ebx,edx
 00023B52    mov         esi,eax
 00023B54    mov         edx,dword ptr [esi+10]
 00023B57    sub         edx,dword ptr [esi+14]
 00023B5A    mov         cx,1
 00023B5E    mov         eax,dword ptr [esi+4]
 00023B61    mov         edi,dword ptr [eax]
 00023B63    call        dword ptr [edi+0C]
 00023B66    mov         edx,ebx
 00023B68    and         dl,0FC
 00023B6B    mov         eax,esi
 00023B6D    call        TFiler.Destroy
 00023B72    test        bl,bl
>00023B74    jle         00023B7D
 00023B76    mov         eax,esi
 00023B78    call        @ClassDestroy
 00023B7D    pop         edi
 00023B7E    pop         esi
 00023B7F    pop         ebx
 00023B80    ret
*}
end;

//00023B84
procedure TReader.CheckValue(Value:TValueType);
begin
{*
 00023B84    push        ebx
 00023B85    push        esi
 00023B86    mov         ebx,edx
 00023B88    mov         esi,eax
 00023B8A    mov         eax,esi
 00023B8C    call        TReader.ReadValue
 00023B91    cmp         bl,al
>00023B93    je          00023BA4
 00023B95    dec         dword ptr [esi+10]
 00023B98    mov         eax,esi
 00023B9A    call        TReader.SkipValue
 00023B9F    call        PropValueError
 00023BA4    pop         esi
 00023BA5    pop         ebx
 00023BA6    ret
*}
end;

//00023BA8
procedure TReader.DefineProperty(const Name:AnsiString; ReadData:TReaderProc; WriteData:TWriterProc; HasData:Boolean);
begin
{*
 00023BA8    push        ebp
 00023BA9    mov         ebp,esp
 00023BAB    push        ebx
 00023BAC    push        esi
 00023BAD    mov         esi,edx
 00023BAF    mov         ebx,eax
 00023BB1    mov         edx,dword ptr [ebx+60]
 00023BB4    mov         eax,esi
 00023BB6    call        CompareText
 00023BBB    test        eax,eax
>00023BBD    jne         00023BD6
 00023BBF    cmp         word ptr [ebp+12],0
>00023BC4    je          00023BD6
 00023BC6    mov         edx,ebx
 00023BC8    mov         eax,dword ptr [ebp+14]
 00023BCB    call        dword ptr [ebp+10]
 00023BCE    lea         eax,[ebx+60]
 00023BD1    call        @LStrClr
 00023BD6    pop         esi
 00023BD7    pop         ebx
 00023BD8    pop         ebp
 00023BD9    ret         10
*}
end;

//00023BDC
procedure TReader.DefineBinaryProperty(const Name:AnsiString; ReadData:TStreamProc; WriteData:TStreamProc; HasData:Boolean);
begin
{*
 00023BDC    push        ebp
 00023BDD    mov         ebp,esp
 00023BDF    add         esp,0FFFFFFF4
 00023BE2    push        ebx
 00023BE3    mov         ebx,edx
 00023BE5    mov         dword ptr [ebp-4],eax
 00023BE8    mov         eax,dword ptr [ebp-4]
 00023BEB    mov         edx,dword ptr [eax+60]
 00023BEE    mov         eax,ebx
 00023BF0    call        CompareText
 00023BF5    test        eax,eax
>00023BF7    jne         00023CAE
 00023BFD    cmp         word ptr [ebp+12],0
>00023C02    je          00023CAE
 00023C08    mov         eax,dword ptr [ebp-4]
 00023C0B    call        TReader.ReadValue
 00023C10    cmp         al,0A
>00023C12    je          00023C2E
 00023C14    mov         eax,dword ptr [ebp-4]
 00023C17    dec         dword ptr [eax+10]
 00023C1A    mov         eax,dword ptr [ebp-4]
 00023C1D    call        TReader.SkipValue
 00023C22    mov         eax,dword ptr [ebp-4]
 00023C25    mov         byte ptr [eax+5C],1
 00023C29    call        PropValueError
 00023C2E    mov         dl,1
 00023C30    mov         eax,[0001F5E8];TMemoryStream
 00023C35    call        TObject.Create
 00023C3A    mov         dword ptr [ebp-8],eax
 00023C3D    xor         eax,eax
 00023C3F    push        ebp
 00023C40    push        23C9C
 00023C45    push        dword ptr fs:[eax]
 00023C48    mov         dword ptr fs:[eax],esp
 00023C4B    lea         edx,[ebp-0C]
 00023C4E    mov         ecx,4
 00023C53    mov         eax,dword ptr [ebp-4]
 00023C56    call        TReader.Read
 00023C5B    mov         edx,dword ptr [ebp-0C]
 00023C5E    mov         eax,dword ptr [ebp-8]
 00023C61    mov         ecx,dword ptr [eax]
 00023C63    call        dword ptr [ecx]
 00023C65    mov         eax,dword ptr [ebp-8]
 00023C68    mov         edx,dword ptr [eax+4]
 00023C6B    mov         ecx,dword ptr [ebp-0C]
 00023C6E    mov         eax,dword ptr [ebp-4]
 00023C71    call        TReader.Read
 00023C76    mov         eax,dword ptr [ebp-4]
 00023C79    mov         byte ptr [eax+5C],1
 00023C7D    mov         edx,dword ptr [ebp-8]
 00023C80    mov         eax,dword ptr [ebp+14]
 00023C83    call        dword ptr [ebp+10]
 00023C86    xor         eax,eax
 00023C88    pop         edx
 00023C89    pop         ecx
 00023C8A    pop         ecx
 00023C8B    mov         dword ptr fs:[eax],edx
 00023C8E    push        23CA3
 00023C93    mov         eax,dword ptr [ebp-8]
 00023C96    call        TObject.Free
 00023C9B    ret
>00023C9C    jmp         @HandleFinally
>00023CA1    jmp         00023C93
 00023CA3    mov         eax,dword ptr [ebp-4]
 00023CA6    add         eax,60
 00023CA9    call        @LStrClr
 00023CAE    pop         ebx
 00023CAF    mov         esp,ebp
 00023CB1    pop         ebp
 00023CB2    ret         10
*}
end;

//00023CB8
function TReader.EndOfList:Boolean;
begin
{*
 00023CB8    push        ebx
 00023CB9    mov         ebx,eax
 00023CBB    mov         eax,ebx
 00023CBD    call        TReader.ReadValue
 00023CC2    test        al,al
 00023CC4    sete        al
 00023CC7    dec         dword ptr [ebx+10]
 00023CCA    pop         ebx
 00023CCB    ret
*}
end;

//00023CCC
function TReader.Error(const Message:AnsiString):Boolean;
begin
{*
 00023CCC    push        ebx
 00023CCD    push        ecx
 00023CCE    mov         byte ptr [esp],0
 00023CD2    cmp         word ptr [eax+56],0
>00023CD7    je          00023CE6
 00023CD9    push        esp
 00023CDA    mov         ebx,eax
 00023CDC    mov         ecx,edx
 00023CDE    mov         edx,eax
 00023CE0    mov         eax,dword ptr [ebx+58]
 00023CE3    call        dword ptr [ebx+54]
 00023CE6    mov         al,byte ptr [esp]
 00023CE9    pop         edx
 00023CEA    pop         ebx
 00023CEB    ret
*}
end;

//00023CEC
function TReader.FindMethod(Root:TComponent; const MethodName:AnsiString):Pointer;
begin
{*
 00023CEC    push        ebx
 00023CED    push        esi
 00023CEE    push        edi
 00023CEF    add         esp,0FFFFFEF8
 00023CF5    mov         esi,ecx
 00023CF7    mov         edi,edx
 00023CF9    mov         ebx,eax
 00023CFB    lea         eax,[esp+8]
 00023CFF    mov         edx,esi
 00023D01    mov         ecx,0FF
 00023D06    call        @LStrToString
 00023D0B    lea         edx,[esp+8]
 00023D0F    mov         eax,dword ptr [edi]
 00023D11    call        TObject.MethodAddress
 00023D16    mov         dword ptr [esp],eax
 00023D19    cmp         dword ptr [esp],0
 00023D1D    sete        byte ptr [esp+4]
 00023D22    cmp         word ptr [ebx+36],0
>00023D27    je          00023D39
 00023D29    push        esp
 00023D2A    lea         eax,[esp+8]
 00023D2E    push        eax
 00023D2F    mov         ecx,esi
 00023D31    mov         edx,ebx
 00023D33    mov         eax,dword ptr [ebx+38]
 00023D36    call        dword ptr [ebx+34]
 00023D39    cmp         byte ptr [esp+4],0
>00023D3E    je          00023D45
 00023D40    call        PropValueError
 00023D45    mov         eax,dword ptr [esp]
 00023D48    add         esp,108
 00023D4E    pop         edi
 00023D4F    pop         esi
 00023D50    pop         ebx
 00023D51    ret
*}
end;

//00023D54
procedure TReader.DoFixupReferences;
begin
{*
 00023D54    push        ebp
 00023D55    mov         ebp,esp
 00023D57    add         esp,0FFFFFFF4
 00023D5A    push        ebx
 00023D5B    push        esi
 00023D5C    push        edi
 00023D5D    xor         edx,edx
 00023D5F    mov         dword ptr [ebp-0C],edx
 00023D62    mov         dword ptr [ebp-4],eax
 00023D65    xor         eax,eax
 00023D67    push        ebp
 00023D68    push        23E36
 00023D6D    push        dword ptr fs:[eax]
 00023D70    mov         dword ptr fs:[eax],esp
 00023D73    mov         eax,dword ptr [ebp-4]
 00023D76    mov         eax,dword ptr [eax+2C]
 00023D79    test        eax,eax
>00023D7B    je          00023E20
 00023D81    xor         edx,edx
 00023D83    push        ebp
 00023D84    push        23E19
 00023D89    push        dword ptr fs:[edx]
 00023D8C    mov         dword ptr fs:[edx],esp
 00023D8F    mov         edi,dword ptr [eax+8]
 00023D92    dec         edi
 00023D93    test        edi,edi
>00023D95    jl          00023E03
 00023D97    inc         edi
 00023D98    mov         dword ptr [ebp-8],0
 00023D9F    mov         eax,dword ptr [ebp-4]
 00023DA2    mov         eax,dword ptr [eax+2C]
 00023DA5    mov         edx,dword ptr [ebp-8]
 00023DA8    call        TList.Get
 00023DAD    mov         ebx,eax
 00023DAF    lea         eax,[ebp-0C]
 00023DB2    mov         edx,dword ptr [ebx+14]
 00023DB5    call        @LStrLAsg
 00023DBA    lea         edx,[ebp-0C]
 00023DBD    mov         eax,dword ptr [ebp-4]
 00023DC0    mov         ecx,dword ptr [eax]
 00023DC2    call        dword ptr [ecx+18]
 00023DC5    mov         eax,dword ptr [ebp-4]
 00023DC8    mov         eax,dword ptr [eax+18]
 00023DCB    mov         edx,dword ptr [ebp-0C]
 00023DCE    call        TComponent.FindComponent
 00023DD3    mov         esi,eax
 00023DD5    test        esi,esi
>00023DD7    jne         00023DF0
 00023DD9    mov         edx,23E4C;'OWNER'
 00023DDE    mov         eax,dword ptr [ebp-0C]
 00023DE1    call        CompareText
 00023DE6    test        eax,eax
>00023DE8    jne         00023DF0
 00023DEA    mov         eax,dword ptr [ebp-4]
 00023DED    mov         esi,dword ptr [eax+18]
 00023DF0    mov         edx,dword ptr [ebx+0C]
 00023DF3    mov         eax,dword ptr [ebx+4]
 00023DF6    mov         ecx,esi
 00023DF8    call        SetOrdProp
 00023DFD    inc         dword ptr [ebp-8]
 00023E00    dec         edi
>00023E01    jne         00023D9F
 00023E03    xor         eax,eax
 00023E05    pop         edx
 00023E06    pop         ecx
 00023E07    pop         ecx
 00023E08    mov         dword ptr fs:[eax],edx
 00023E0B    push        23E20
 00023E10    mov         eax,dword ptr [ebp-4]
 00023E13    call        TReader.FreeFixups
 00023E18    ret
>00023E19    jmp         @HandleFinally
>00023E1E    jmp         00023E10
 00023E20    xor         eax,eax
 00023E22    pop         edx
 00023E23    pop         ecx
 00023E24    pop         ecx
 00023E25    mov         dword ptr fs:[eax],edx
 00023E28    push        23E3D
 00023E2D    lea         eax,[ebp-0C]
 00023E30    call        @LStrClr
 00023E35    ret
>00023E36    jmp         @HandleFinally
>00023E3B    jmp         00023E2D
 00023E3D    pop         edi
 00023E3E    pop         esi
 00023E3F    pop         ebx
 00023E40    mov         esp,ebp
 00023E42    pop         ebp
 00023E43    ret
*}
end;

//00023E54
procedure TReader.FlushBuffer;
begin
{*
 00023E54    push        ebx
 00023E55    mov         ebx,eax
 00023E57    mov         eax,ebx
 00023E59    call        TReader.GetPosition
 00023E5E    mov         edx,eax
 00023E60    mov         eax,dword ptr [ebx+4]
 00023E63    call        TStream.SetPosition
 00023E68    xor         eax,eax
 00023E6A    mov         dword ptr [ebx+10],eax
 00023E6D    xor         eax,eax
 00023E6F    mov         dword ptr [ebx+14],eax
 00023E72    pop         ebx
 00023E73    ret
*}
end;

//00023E74
procedure TReader.FreeFixups;
begin
{*
 00023E74    push        ebx
 00023E75    push        esi
 00023E76    push        edi
 00023E77    mov         ebx,eax
 00023E79    mov         eax,dword ptr [ebx+2C]
 00023E7C    test        eax,eax
>00023E7E    je          00023EAB
 00023E80    mov         esi,dword ptr [eax+8]
 00023E83    dec         esi
 00023E84    test        esi,esi
>00023E86    jl          00023E9E
 00023E88    inc         esi
 00023E89    xor         edi,edi
 00023E8B    mov         edx,edi
 00023E8D    mov         eax,dword ptr [ebx+2C]
 00023E90    call        TList.Get
 00023E95    call        TObject.Free
 00023E9A    inc         edi
 00023E9B    dec         esi
>00023E9C    jne         00023E8B
 00023E9E    mov         eax,dword ptr [ebx+2C]
 00023EA1    call        TObject.Free
 00023EA6    xor         eax,eax
 00023EA8    mov         dword ptr [ebx+2C],eax
 00023EAB    pop         edi
 00023EAC    pop         esi
 00023EAD    pop         ebx
 00023EAE    ret
*}
end;

//00023EB0
function TReader.GetPosition:Longint;
begin
{*
 00023EB0    push        ebx
 00023EB1    mov         ebx,eax
 00023EB3    mov         eax,dword ptr [ebx+4]
 00023EB6    call        TStream.GetPosition
 00023EBB    mov         edx,dword ptr [ebx+14]
 00023EBE    sub         edx,dword ptr [ebx+10]
 00023EC1    sub         eax,edx
 00023EC3    pop         ebx
 00023EC4    ret
*}
end;

//00023EC8
function TReader.NextValue:TValueType;
begin
{*
 00023EC8    push        ebx
 00023EC9    mov         ebx,eax
 00023ECB    mov         eax,ebx
 00023ECD    call        TReader.ReadValue
 00023ED2    dec         dword ptr [ebx+10]
 00023ED5    pop         ebx
 00023ED6    ret
*}
end;

//00023ED8
procedure TReader.PropertyError;
begin
{*
 00023ED8    call        TReader.SkipValue
 00023EDD    call        PropertyNotFound
 00023EE2    ret
*}
end;

//00023EE4
procedure TReader.Read(var Buf:void ; Count:Longint);
begin
{*
 00023EE4    push        esi
 00023EE5    push        edi
 00023EE6    push        ebx
 00023EE7    mov         edi,edx
 00023EE9    mov         ebx,ecx
 00023EEB    mov         esi,eax
>00023EED    jmp         00023F25
 00023EEF    mov         ecx,dword ptr [esi+14]
 00023EF2    sub         ecx,dword ptr [esi+10]
>00023EF5    ja          00023F01
 00023EF7    mov         eax,esi
 00023EF9    call        TReader.ReadBuffer
 00023EFE    mov         ecx,dword ptr [esi+14]
 00023F01    cmp         ecx,ebx
>00023F03    jb          00023F07
 00023F05    mov         ecx,ebx
 00023F07    push        esi
 00023F08    sub         ebx,ecx
 00023F0A    mov         eax,dword ptr [esi+8]
 00023F0D    add         eax,dword ptr [esi+10]
 00023F10    add         dword ptr [esi+10],ecx
 00023F13    mov         esi,eax
 00023F15    mov         edx,ecx
 00023F17    shr         ecx,2
 00023F1A    cld
 00023F1B    rep movs    dword ptr [edi],dword ptr [esi]
 00023F1D    mov         ecx,edx
 00023F1F    and         ecx,3
 00023F22    rep movs    byte ptr [edi],byte ptr [esi]
 00023F24    pop         esi
 00023F25    or          ebx,ebx
>00023F27    jne         00023EEF
 00023F29    pop         ebx
 00023F2A    pop         edi
 00023F2B    pop         esi
 00023F2C    ret
*}
end;

//00023F30
procedure TReader.ReadBuffer;
begin
{*
 00023F30    push        ebp
 00023F31    mov         ebp,esp
 00023F33    push        0
 00023F35    push        ebx
 00023F36    push        esi
 00023F37    mov         ebx,eax
 00023F39    xor         eax,eax
 00023F3B    push        ebp
 00023F3C    push        23F9A
 00023F41    push        dword ptr fs:[eax]
 00023F44    mov         dword ptr fs:[eax],esp
 00023F47    mov         edx,dword ptr [ebx+8]
 00023F4A    mov         ecx,dword ptr [ebx+0C]
 00023F4D    mov         eax,dword ptr [ebx+4]
 00023F50    mov         esi,dword ptr [eax]
 00023F52    call        dword ptr [esi+4]
 00023F55    mov         esi,eax
 00023F57    mov         dword ptr [ebx+14],esi
 00023F5A    test        esi,esi
>00023F5C    jne         00023F7F
 00023F5E    lea         edx,[ebp-4]
 00023F61    mov         eax,[000B5B58];^SReadError:TResStringRec
 00023F66    call        LoadResString
 00023F6B    mov         ecx,dword ptr [ebp-4]
 00023F6E    mov         dl,1
 00023F70    mov         eax,[0001EB34];EReadError
 00023F75    call        Exception.Create
 00023F7A    call        @RaiseExcept
 00023F7F    xor         eax,eax
 00023F81    mov         dword ptr [ebx+10],eax
 00023F84    xor         eax,eax
 00023F86    pop         edx
 00023F87    pop         ecx
 00023F88    pop         ecx
 00023F89    mov         dword ptr fs:[eax],edx
 00023F8C    push        23FA1
 00023F91    lea         eax,[ebp-4]
 00023F94    call        @LStrClr
 00023F99    ret
>00023F9A    jmp         @HandleFinally
>00023F9F    jmp         00023F91
 00023FA1    pop         esi
 00023FA2    pop         ebx
 00023FA3    pop         ecx
 00023FA4    pop         ebp
 00023FA5    ret
*}
end;

//00023FA8
function TReader.ReadBoolean:Boolean;
begin
{*
 00023FA8    push        ebx
 00023FA9    mov         ebx,eax
 00023FAB    mov         eax,ebx
 00023FAD    call        TReader.ReadValue
 00023FB2    cmp         al,9
 00023FB4    sete        al
 00023FB7    pop         ebx
 00023FB8    ret
*}
end;

//00023FBC
function TReader.ReadChar:Char;
begin
{*
 00023FBC    push        ebp
 00023FBD    mov         ebp,esp
 00023FBF    add         esp,0FFFFFFF8
 00023FC2    push        ebx
 00023FC3    xor         edx,edx
 00023FC5    mov         dword ptr [ebp-8],edx
 00023FC8    mov         ebx,eax
 00023FCA    xor         eax,eax
 00023FCC    push        ebp
 00023FCD    push        2402E
 00023FD2    push        dword ptr fs:[eax]
 00023FD5    mov         dword ptr fs:[eax],esp
 00023FD8    mov         dl,6
 00023FDA    mov         eax,ebx
 00023FDC    call        TReader.CheckValue
 00023FE1    lea         edx,[ebp-1]
 00023FE4    mov         ecx,1
 00023FE9    mov         eax,ebx
 00023FEB    call        TReader.Read
 00023FF0    mov         al,byte ptr [ebp-1]
 00023FF3    cmp         al,1
>00023FF5    je          00024009
 00023FF7    dec         dword ptr [ebx+10]
 00023FFA    lea         edx,[ebp-8]
 00023FFD    mov         eax,ebx
 00023FFF    call        TReader.ReadStr
 00024004    call        PropValueError
 00024009    lea         edx,[ebp-1]
 0002400C    mov         ecx,1
 00024011    mov         eax,ebx
 00024013    call        TReader.Read
 00024018    xor         eax,eax
 0002401A    pop         edx
 0002401B    pop         ecx
 0002401C    pop         ecx
 0002401D    mov         dword ptr fs:[eax],edx
 00024020    push        24035
 00024025    lea         eax,[ebp-8]
 00024028    call        @LStrClr
 0002402D    ret
>0002402E    jmp         @HandleFinally
>00024033    jmp         00024025
 00024035    mov         al,byte ptr [ebp-1]
 00024038    pop         ebx
 00024039    pop         ecx
 0002403A    pop         ecx
 0002403B    pop         ebp
 0002403C    ret
*}
end;

//00024040
procedure TReader.ReadCollection(Collection:TCollection);
begin
{*
 00024040    push        ebp
 00024041    mov         ebp,esp
 00024043    push        ecx
 00024044    push        ebx
 00024045    push        esi
 00024046    mov         dword ptr [ebp-4],edx
 00024049    mov         ebx,eax
 0002404B    mov         eax,dword ptr [ebp-4]
 0002404E    mov         edx,dword ptr [eax]
 00024050    call        dword ptr [edx+14]
 00024053    xor         eax,eax
 00024055    push        ebp
 00024056    push        240E0
 0002405B    push        dword ptr fs:[eax]
 0002405E    mov         dword ptr fs:[eax],esp
 00024061    mov         eax,ebx
 00024063    call        TReader.EndOfList
 00024068    test        al,al
>0002406A    jne         000240B8
 0002406C    mov         eax,dword ptr [ebp-4]
 0002406F    call        TCollection.Clear
>00024074    jmp         000240B8
 00024076    mov         eax,ebx
 00024078    call        TReader.NextValue
 0002407D    add         al,0FE
 0002407F    sub         al,3
>00024081    jae         0002408A
 00024083    mov         eax,ebx
 00024085    call        TReader.ReadInteger
 0002408A    mov         eax,dword ptr [ebp-4]
 0002408D    call        TCollection.Add
 00024092    mov         esi,eax
 00024094    mov         eax,ebx
 00024096    call        TReader.ReadListBegin
>0002409B    jmp         000240A6
 0002409D    mov         edx,esi
 0002409F    mov         eax,ebx
 000240A1    call        TReader.ReadProperty
 000240A6    mov         eax,ebx
 000240A8    call        TReader.EndOfList
 000240AD    test        al,al
>000240AF    je          0002409D
 000240B1    mov         eax,ebx
 000240B3    call        TReader.ReadListEnd
 000240B8    mov         eax,ebx
 000240BA    call        TReader.EndOfList
 000240BF    test        al,al
>000240C1    je          00024076
 000240C3    mov         eax,ebx
 000240C5    call        TReader.ReadListEnd
 000240CA    xor         eax,eax
 000240CC    pop         edx
 000240CD    pop         ecx
 000240CE    pop         ecx
 000240CF    mov         dword ptr fs:[eax],edx
 000240D2    push        240E7
 000240D7    mov         eax,dword ptr [ebp-4]
 000240DA    mov         edx,dword ptr [eax]
 000240DC    call        dword ptr [edx+18]
 000240DF    ret
>000240E0    jmp         @HandleFinally
>000240E5    jmp         000240D7
 000240E7    pop         esi
 000240E8    pop         ebx
 000240E9    pop         ecx
 000240EA    pop         ebp
 000240EB    ret
*}
end;

//000240EC
function ComponentCreated:Boolean;
begin
{*
 000240EC    push        ebp
 000240ED    mov         ebp,esp
 000240EF    mov         eax,dword ptr [ebp+8]
 000240F2    test        byte ptr [eax-1],1
>000240F6    jne         00024101
 000240F8    mov         eax,dword ptr [ebp+8]
 000240FB    cmp         dword ptr [eax-8],0
>000240FF    je          00024105
 00024101    xor         eax,eax
 00024103    pop         ebp
 00024104    ret
 00024105    mov         al,1
 00024107    pop         ebp
 00024108    ret
*}
end;

//0002410C
function Recover(var Component:TComponent):Boolean;
begin
{*
 0002410C    push        ebp
 0002410D    mov         ebp,esp
 0002410F    push        ebx
 00024110    push        esi
 00024111    mov         esi,eax
 00024113    xor         ebx,ebx
 00024115    call        ExceptObject
 0002411A    mov         edx,dword ptr ds:[176E8];Exception
 00024120    call        @IsClass
 00024125    test        al,al
>00024127    je          00024164
 00024129    mov         eax,dword ptr [ebp+8]
 0002412C    push        eax
 0002412D    call        ComponentCreated
 00024132    pop         ecx
 00024133    test        al,al
>00024135    je          0002413E
 00024137    mov         eax,dword ptr [esi]
 00024139    call        TObject.Free
 0002413E    xor         eax,eax
 00024140    mov         dword ptr [esi],eax
 00024142    mov         eax,dword ptr [ebp+8]
 00024145    mov         eax,dword ptr [eax-0C]
 00024148    xor         edx,edx
 0002414A    call        TReader.SkipComponent
 0002414F    call        ExceptObject
 00024154    mov         edx,dword ptr [eax+4]
 00024157    mov         eax,dword ptr [ebp+8]
 0002415A    mov         eax,dword ptr [eax-0C]
 0002415D    mov         ecx,dword ptr [eax]
 0002415F    call        dword ptr [ecx+0C]
 00024162    mov         ebx,eax
 00024164    mov         eax,ebx
 00024166    pop         esi
 00024167    pop         ebx
 00024168    pop         ebp
 00024169    ret
*}
end;

//0002416C
procedure CreateComponent;
begin
{*
 0002416C    push        ebp
 0002416D    mov         ebp,esp
 0002416F    push        ebx
 00024170    push        esi
 00024171    push        edi
 00024172    xor         eax,eax
 00024174    push        ebp
 00024175    push        241BC
 0002417A    push        dword ptr fs:[eax]
 0002417D    mov         dword ptr fs:[eax],esp
 00024180    mov         eax,dword ptr [ebp+8]
 00024183    mov         edx,dword ptr [eax-14]
 00024186    mov         eax,dword ptr [ebp+8]
 00024189    mov         eax,dword ptr [eax-0C]
 0002418C    mov         eax,dword ptr [eax+18]
 0002418F    call        FindFieldClass
 00024194    mov         edx,dword ptr [ebp+8]
 00024197    mov         edx,dword ptr [edx-0C]
 0002419A    mov         ecx,dword ptr [edx+24]
 0002419D    mov         dl,1
 0002419F    call        dword ptr [eax+2C]
 000241A2    mov         edx,dword ptr [ebp+8]
 000241A5    mov         dword ptr [edx-10],eax
 000241A8    mov         eax,dword ptr [ebp+8]
 000241AB    mov         eax,dword ptr [eax-10]
 000241AE    or          byte ptr [eax+20],1
 000241B2    xor         eax,eax
 000241B4    pop         edx
 000241B5    pop         ecx
 000241B6    pop         ecx
 000241B7    mov         dword ptr fs:[eax],edx
>000241BA    jmp         000241DF
>000241BC    jmp         @HandleAnyException
 000241C1    mov         eax,dword ptr [ebp+8]
 000241C4    push        eax
 000241C5    mov         eax,dword ptr [ebp+8]
 000241C8    add         eax,0FFFFFFF0
 000241CB    call        Recover
 000241D0    pop         ecx
 000241D1    test        al,al
>000241D3    jne         000241DA
 000241D5    call        @RaiseAgain
 000241DA    call        @DoneExcept
 000241DF    pop         edi
 000241E0    pop         esi
 000241E1    pop         ebx
 000241E2    pop         ebp
 000241E3    ret
*}
end;

//000241E4
procedure SetCompName;
begin
{*
 000241E4    push        ebp
 000241E5    mov         ebp,esp
 000241E7    push        ebx
 000241E8    push        esi
 000241E9    push        edi
 000241EA    xor         eax,eax
 000241EC    push        ebp
 000241ED    push        24231
 000241F2    push        dword ptr fs:[eax]
 000241F5    mov         dword ptr fs:[eax],esp
 000241F8    mov         eax,dword ptr [ebp+8]
 000241FB    mov         eax,dword ptr [eax-0C]
 000241FE    mov         edx,dword ptr [eax+28]
 00024201    mov         eax,dword ptr [ebp+8]
 00024204    mov         eax,dword ptr [eax-10]
 00024207    mov         bx,0FFF9
 0002420B    call        @CallDynaInst
 00024210    mov         eax,dword ptr [ebp+8]
 00024213    lea         ecx,[eax-18]
 00024216    mov         eax,dword ptr [ebp+8]
 00024219    mov         edx,dword ptr [eax-10]
 0002421C    mov         eax,dword ptr [ebp+8]
 0002421F    mov         eax,dword ptr [eax-0C]
 00024222    mov         ebx,dword ptr [eax]
 00024224    call        dword ptr [ebx+14]
 00024227    xor         eax,eax
 00024229    pop         edx
 0002422A    pop         ecx
 0002422B    pop         ecx
 0002422C    mov         dword ptr fs:[eax],edx
>0002422F    jmp         00024254
>00024231    jmp         @HandleAnyException
 00024236    mov         eax,dword ptr [ebp+8]
 00024239    push        eax
 0002423A    mov         eax,dword ptr [ebp+8]
 0002423D    add         eax,0FFFFFFF0
 00024240    call        Recover
 00024245    pop         ecx
 00024246    test        al,al
>00024248    jne         0002424F
 0002424A    call        @RaiseAgain
 0002424F    call        @DoneExcept
 00024254    pop         edi
 00024255    pop         esi
 00024256    pop         ebx
 00024257    pop         ebp
 00024258    ret
*}
end;

//0002425C
procedure FindExistingComponent;
begin
{*
 0002425C    push        ebp
 0002425D    mov         ebp,esp
 0002425F    push        ebx
 00024260    push        esi
 00024261    push        edi
 00024262    xor         eax,eax
 00024264    push        ebp
 00024265    push        242DA
 0002426A    push        dword ptr fs:[eax]
 0002426D    mov         dword ptr fs:[eax],esp
 00024270    mov         eax,dword ptr [ebp+8]
 00024273    mov         edx,dword ptr [eax-14]
 00024276    mov         eax,dword ptr [ebp+8]
 00024279    mov         eax,dword ptr [eax-0C]
 0002427C    mov         eax,dword ptr [eax+18]
 0002427F    call        FindFieldClass
 00024284    mov         ecx,eax
 00024286    mov         eax,dword ptr [ebp+8]
 00024289    mov         edx,dword ptr [eax-18]
 0002428C    mov         eax,dword ptr [ebp+8]
 0002428F    mov         eax,dword ptr [eax-0C]
 00024292    mov         ebx,dword ptr [eax]
 00024294    call        dword ptr [ebx+1C]
 00024297    mov         edx,dword ptr [ebp+8]
 0002429A    mov         dword ptr [edx-10],eax
 0002429D    mov         eax,dword ptr [ebp+8]
 000242A0    mov         eax,dword ptr [eax-10]
 000242A3    mov         bx,0FFF3
 000242A7    call        @CallDynaInst
 000242AC    mov         esi,eax
 000242AE    mov         eax,dword ptr [ebp+8]
 000242B1    mov         eax,dword ptr [eax-0C]
 000242B4    mov         dword ptr [eax+28],esi
 000242B7    mov         eax,dword ptr [ebp+8]
 000242BA    test        esi,esi
>000242BC    jne         000242D0
 000242BE    mov         eax,dword ptr [ebp+8]
 000242C1    mov         eax,dword ptr [eax-0C]
 000242C4    mov         eax,dword ptr [eax+18]
 000242C7    mov         edx,dword ptr [ebp+8]
 000242CA    mov         edx,dword ptr [edx-0C]
 000242CD    mov         dword ptr [edx+28],eax
 000242D0    xor         eax,eax
 000242D2    pop         edx
 000242D3    pop         ecx
 000242D4    pop         ecx
 000242D5    mov         dword ptr fs:[eax],edx
>000242D8    jmp         000242FD
>000242DA    jmp         @HandleAnyException
 000242DF    mov         eax,dword ptr [ebp+8]
 000242E2    push        eax
 000242E3    mov         eax,dword ptr [ebp+8]
 000242E6    add         eax,0FFFFFFF0
 000242E9    call        Recover
 000242EE    pop         ecx
 000242EF    test        al,al
>000242F1    jne         000242F8
 000242F3    call        @RaiseAgain
 000242F8    call        @DoneExcept
 000242FD    pop         edi
 000242FE    pop         esi
 000242FF    pop         ebx
 00024300    pop         ebp
 00024301    ret
*}
end;

//00024304
function TReader.ReadComponent(Component:TComponent):TComponent;
begin
{*
 00024304    push        ebp
 00024305    mov         ebp,esp
 00024307    add         esp,0FFFFFFE0
 0002430A    push        ebx
 0002430B    push        esi
 0002430C    push        edi
 0002430D    xor         ecx,ecx
 0002430F    mov         dword ptr [ebp-14],ecx
 00024312    mov         dword ptr [ebp-18],ecx
 00024315    mov         dword ptr [ebp-8],edx
 00024318    mov         dword ptr [ebp-0C],eax
 0002431B    xor         eax,eax
 0002431D    push        ebp
 0002431E    push        24471
 00024323    push        dword ptr fs:[eax]
 00024326    mov         dword ptr fs:[eax],esp
 00024329    lea         ecx,[ebp-1C]
 0002432C    lea         edx,[ebp-1]
 0002432F    mov         eax,dword ptr [ebp-0C]
 00024332    mov         ebx,dword ptr [eax]
 00024334    call        dword ptr [ebx+20]
 00024337    lea         edx,[ebp-14]
 0002433A    mov         eax,dword ptr [ebp-0C]
 0002433D    call        TReader.ReadStr
 00024342    lea         edx,[ebp-18]
 00024345    mov         eax,dword ptr [ebp-0C]
 00024348    call        TReader.ReadStr
 0002434D    mov         eax,dword ptr [ebp-0C]
 00024350    mov         eax,dword ptr [eax+28]
 00024353    mov         dword ptr [ebp-20],eax
 00024356    xor         eax,eax
 00024358    push        ebp
 00024359    push        2444F
 0002435E    push        dword ptr fs:[eax]
 00024361    mov         dword ptr fs:[eax],esp
 00024364    mov         eax,dword ptr [ebp-8]
 00024367    mov         dword ptr [ebp-10],eax
 0002436A    cmp         dword ptr [ebp-10],0
>0002436E    jne         00024386
 00024370    test        byte ptr [ebp-1],1
>00024374    je          0002437F
 00024376    push        ebp
 00024377    call        FindExistingComponent
 0002437C    pop         ecx
>0002437D    jmp         00024386
 0002437F    push        ebp
 00024380    call        CreateComponent
 00024385    pop         ecx
 00024386    cmp         dword ptr [ebp-10],0
>0002438A    je          00024438
 00024390    xor         eax,eax
 00024392    push        ebp
 00024393    push        24416
 00024398    push        dword ptr fs:[eax]
 0002439B    mov         dword ptr fs:[eax],esp
 0002439E    mov         eax,dword ptr [ebp-10]
 000243A1    or          byte ptr [eax+20],1
 000243A5    test        byte ptr [ebp-1],1
>000243A9    jne         000243B2
 000243AB    push        ebp
 000243AC    call        SetCompName
 000243B1    pop         ecx
 000243B2    cmp         dword ptr [ebp-10],0
>000243B6    jne         000243CA
 000243B8    xor         eax,eax
 000243BA    pop         edx
 000243BB    pop         ecx
 000243BC    pop         ecx
 000243BD    mov         dword ptr fs:[eax],edx
 000243C0    call        @TryFinallyExit
>000243C5    jmp         00024456
 000243CA    mov         eax,dword ptr [ebp-10]
 000243CD    or          byte ptr [eax+20],2
 000243D1    mov         edx,dword ptr [ebp-0C]
 000243D4    mov         eax,dword ptr [ebp-10]
 000243D7    mov         ecx,dword ptr [eax]
 000243D9    call        dword ptr [ecx+14]
 000243DC    mov         eax,dword ptr [ebp-10]
 000243DF    and         byte ptr [eax+20],0FD
 000243E3    test        byte ptr [ebp-1],2
>000243E7    je          000243FE
 000243E9    mov         eax,dword ptr [ebp-0C]
 000243EC    mov         eax,dword ptr [eax+28]
 000243EF    mov         ecx,dword ptr [ebp-1C]
 000243F2    mov         edx,dword ptr [ebp-10]
 000243F5    mov         bx,0FFFA
 000243F9    call        @CallDynaInst
 000243FE    mov         eax,dword ptr [ebp-0C]
 00024401    mov         eax,dword ptr [eax+30]
 00024404    mov         edx,dword ptr [ebp-10]
 00024407    call        TList.Add
 0002440C    xor         eax,eax
 0002440E    pop         edx
 0002440F    pop         ecx
 00024410    pop         ecx
 00024411    mov         dword ptr fs:[eax],edx
>00024414    jmp         00024438
>00024416    jmp         @HandleAnyException
 0002441B    push        ebp
 0002441C    call        ComponentCreated
 00024421    pop         ecx
 00024422    test        al,al
>00024424    je          0002442E
 00024426    mov         eax,dword ptr [ebp-10]
 00024429    call        TObject.Free
 0002442E    call        @RaiseAgain
 00024433    call        @DoneExcept
 00024438    xor         eax,eax
 0002443A    pop         edx
 0002443B    pop         ecx
 0002443C    pop         ecx
 0002443D    mov         dword ptr fs:[eax],edx
 00024440    push        24456
 00024445    mov         eax,dword ptr [ebp-0C]
 00024448    mov         edx,dword ptr [ebp-20]
 0002444B    mov         dword ptr [eax+28],edx
 0002444E    ret
>0002444F    jmp         @HandleFinally
>00024454    jmp         00024445
 00024456    xor         eax,eax
 00024458    pop         edx
 00024459    pop         ecx
 0002445A    pop         ecx
 0002445B    mov         dword ptr fs:[eax],edx
 0002445E    push        24478
 00024463    lea         eax,[ebp-18]
 00024466    mov         edx,2
 0002446B    call        @LStrArrayClr
 00024470    ret
>00024471    jmp         @HandleFinally
>00024476    jmp         00024463
 00024478    mov         eax,dword ptr [ebp-10]
 0002447B    pop         edi
 0002447C    pop         esi
 0002447D    pop         ebx
 0002447E    mov         esp,ebp
 00024480    pop         ebp
 00024481    ret
*}
end;

//00024484
procedure TReader.ReadData(Instance:TComponent);
begin
{*
 00024484    push        ebp
 00024485    mov         ebp,esp
 00024487    push        ecx
 00024488    push        ebx
 00024489    mov         ebx,edx
 0002448B    mov         dword ptr [ebp-4],eax
 0002448E    mov         eax,dword ptr [ebp-4]
 00024491    cmp         dword ptr [eax+2C],0
>00024495    jne         000244E6
 00024497    mov         dl,1
 00024499    mov         eax,[0001EEC4];TList
 0002449E    call        TObject.Create
 000244A3    mov         edx,dword ptr [ebp-4]
 000244A6    mov         dword ptr [edx+2C],eax
 000244A9    xor         eax,eax
 000244AB    push        ebp
 000244AC    push        244DF
 000244B1    push        dword ptr fs:[eax]
 000244B4    mov         dword ptr fs:[eax],esp
 000244B7    mov         edx,ebx
 000244B9    mov         eax,dword ptr [ebp-4]
 000244BC    call        TReader.ReadDataInner
 000244C1    mov         eax,dword ptr [ebp-4]
 000244C4    call        TReader.DoFixupReferences
 000244C9    xor         eax,eax
 000244CB    pop         edx
 000244CC    pop         ecx
 000244CD    pop         ecx
 000244CE    mov         dword ptr fs:[eax],edx
 000244D1    push        244F0
 000244D6    mov         eax,dword ptr [ebp-4]
 000244D9    call        TReader.FreeFixups
 000244DE    ret
>000244DF    jmp         @HandleFinally
>000244E4    jmp         000244D6
 000244E6    mov         edx,ebx
 000244E8    mov         eax,dword ptr [ebp-4]
 000244EB    call        TReader.ReadDataInner
 000244F0    pop         ebx
 000244F1    pop         ecx
 000244F2    pop         ebp
 000244F3    ret
*}
end;

//000244F4
procedure TReader.ReadDataInner(Instance:TComponent);
begin
{*
 000244F4    push        ebp
 000244F5    mov         ebp,esp
 000244F7    add         esp,0FFFFFFF4
 000244FA    push        ebx
 000244FB    push        esi
 000244FC    push        edi
 000244FD    mov         esi,edx
 000244FF    mov         dword ptr [ebp-4],eax
>00024502    jmp         0002450E
 00024504    mov         edx,esi
 00024506    mov         eax,dword ptr [ebp-4]
 00024509    call        TReader.ReadProperty
 0002450E    mov         eax,dword ptr [ebp-4]
 00024511    call        TReader.EndOfList
 00024516    test        al,al
>00024518    je          00024504
 0002451A    mov         eax,dword ptr [ebp-4]
 0002451D    call        TReader.ReadListEnd
 00024522    mov         eax,dword ptr [ebp-4]
 00024525    mov         eax,dword ptr [eax+28]
 00024528    mov         dword ptr [ebp-8],eax
 0002452B    mov         eax,dword ptr [ebp-4]
 0002452E    mov         eax,dword ptr [eax+24]
 00024531    mov         dword ptr [ebp-0C],eax
 00024534    mov         eax,esi
 00024536    mov         bx,0FFFB
 0002453A    call        @CallDynaInst
 0002453F    mov         edx,dword ptr [ebp-4]
 00024542    mov         dword ptr [edx+28],eax
 00024545    xor         eax,eax
 00024547    push        ebp
 00024548    push        245B6
 0002454D    push        dword ptr fs:[eax]
 00024550    mov         dword ptr fs:[eax],esp
 00024553    mov         eax,esi
 00024555    mov         bx,0FFFC
 00024559    call        @CallDynaInst
 0002455E    mov         edi,eax
 00024560    mov         eax,dword ptr [ebp-4]
 00024563    mov         dword ptr [eax+24],edi
 00024566    test        edi,edi
>00024568    jne         00024582
 0002456A    mov         eax,dword ptr [ebp-4]
 0002456D    mov         eax,dword ptr [eax+18]
 00024570    mov         edx,dword ptr [ebp-4]
 00024573    mov         dword ptr [edx+24],eax
>00024576    jmp         00024582
 00024578    xor         edx,edx
 0002457A    mov         eax,dword ptr [ebp-4]
 0002457D    call        TReader.ReadComponent
 00024582    mov         eax,dword ptr [ebp-4]
 00024585    call        TReader.EndOfList
 0002458A    test        al,al
>0002458C    je          00024578
 0002458E    mov         eax,dword ptr [ebp-4]
 00024591    call        TReader.ReadListEnd
 00024596    xor         eax,eax
 00024598    pop         edx
 00024599    pop         ecx
 0002459A    pop         ecx
 0002459B    mov         dword ptr fs:[eax],edx
 0002459E    push        245BD
 000245A3    mov         eax,dword ptr [ebp-4]
 000245A6    mov         edx,dword ptr [ebp-8]
 000245A9    mov         dword ptr [eax+28],edx
 000245AC    mov         eax,dword ptr [ebp-4]
 000245AF    mov         edx,dword ptr [ebp-0C]
 000245B2    mov         dword ptr [eax+24],edx
 000245B5    ret
>000245B6    jmp         @HandleFinally
>000245BB    jmp         000245A3
 000245BD    pop         edi
 000245BE    pop         esi
 000245BF    pop         ebx
 000245C0    mov         esp,ebp
 000245C2    pop         ebp
 000245C3    ret
*}
end;

//000245C4
function TReader.ReadFloat:Extended;
begin
{*
 000245C4    push        ebx
 000245C5    add         esp,0FFFFFFF0
 000245C8    mov         ebx,eax
 000245CA    mov         eax,ebx
 000245CC    call        TReader.ReadValue
 000245D1    cmp         al,5
>000245D3    jne         000245E5
 000245D5    mov         edx,esp
 000245D7    mov         ecx,0A
 000245DC    mov         eax,ebx
 000245DE    call        TReader.Read
>000245E3    jmp         000245FB
 000245E5    dec         dword ptr [ebx+10]
 000245E8    mov         eax,ebx
 000245EA    call        TReader.ReadInteger
 000245EF    mov         dword ptr [esp+0C],eax
 000245F3    fild        dword ptr [esp+0C]
 000245F7    fstp        tbyte ptr [esp]
 000245FA    wait
 000245FB    fld         tbyte ptr [esp]
 000245FE    add         esp,10
 00024601    pop         ebx
 00024602    ret
*}
end;

//00024604
function TReader.ReadSingle:Single;
begin
{*
 00024604    push        ebx
 00024605    add         esp,0FFFFFFF8
 00024608    mov         ebx,eax
 0002460A    mov         eax,ebx
 0002460C    call        TReader.ReadValue
 00024611    cmp         al,0F
>00024613    jne         00024625
 00024615    mov         edx,esp
 00024617    mov         ecx,4
 0002461C    mov         eax,ebx
 0002461E    call        TReader.Read
>00024623    jmp         0002463B
 00024625    dec         dword ptr [ebx+10]
 00024628    mov         eax,ebx
 0002462A    call        TReader.ReadInteger
 0002462F    mov         dword ptr [esp+4],eax
 00024633    fild        dword ptr [esp+4]
 00024637    fstp        dword ptr [esp]
 0002463A    wait
 0002463B    fld         dword ptr [esp]
 0002463E    pop         ecx
 0002463F    pop         edx
 00024640    pop         ebx
 00024641    ret
*}
end;

//00024644
function TReader.ReadCurrency:Currency;
begin
{*
 00024644    push        ebx
 00024645    add         esp,0FFFFFFF4
 00024648    mov         ebx,eax
 0002464A    mov         eax,ebx
 0002464C    call        TReader.ReadValue
 00024651    cmp         al,10
>00024653    jne         00024665
 00024655    mov         edx,esp
 00024657    mov         ecx,8
 0002465C    mov         eax,ebx
 0002465E    call        TReader.Read
>00024663    jmp         00024681
 00024665    dec         dword ptr [ebx+10]
 00024668    mov         eax,ebx
 0002466A    call        TReader.ReadInteger
 0002466F    mov         dword ptr [esp+8],eax
 00024673    fild        dword ptr [esp+8]
 00024677    fmul        dword ptr ds:[2468C]
 0002467D    fistp       qword ptr [esp]
 00024680    wait
 00024681    fild        qword ptr [esp]
 00024684    add         esp,0C
 00024687    pop         ebx
 00024688    ret
*}
end;

//00024690
function TReader.ReadDate:TDateTime;
begin
{*
 00024690    push        ebx
 00024691    add         esp,0FFFFFFF4
 00024694    mov         ebx,eax
 00024696    mov         eax,ebx
 00024698    call        TReader.ReadValue
 0002469D    cmp         al,11
>0002469F    jne         000246B1
 000246A1    mov         edx,esp
 000246A3    mov         ecx,8
 000246A8    mov         eax,ebx
 000246AA    call        TReader.Read
>000246AF    jmp         000246C7
 000246B1    dec         dword ptr [ebx+10]
 000246B4    mov         eax,ebx
 000246B6    call        TReader.ReadInteger
 000246BB    mov         dword ptr [esp+8],eax
 000246BF    fild        dword ptr [esp+8]
 000246C3    fstp        qword ptr [esp]
 000246C6    wait
 000246C7    fld         qword ptr [esp]
 000246CA    add         esp,0C
 000246CD    pop         ebx
 000246CE    ret
*}
end;

//000246D0
function TReader.ReadIdent:AnsiString;
begin
{*
 000246D0    push        ebx
 000246D1    push        esi
 000246D2    push        ecx
 000246D3    mov         esi,edx
 000246D5    mov         ebx,eax
 000246D7    mov         eax,ebx
 000246D9    call        TReader.ReadValue
 000246DE    and         eax,7F
 000246E1    cmp         eax,0D
>000246E4    ja          00024788
 000246EA    mov         al,byte ptr [eax+246F7]
 000246F0    jmp         dword ptr [eax*4+24705]
 000246F0    db          5
 000246F0    db          0
 000246F0    db          0
 000246F0    db          0
 000246F0    db          0
 000246F0    db          0
 000246F0    db          0
 000246F0    db          1
 000246F0    db          2
 000246F0    db          3
 000246F0    db          0
 000246F0    db          0
 000246F0    db          0
 000246F0    db          4
 000246F0    dd          00024788
 000246F0    dd          0002471D
 000246F0    dd          00024750
 000246F0    dd          0002475E
 000246F0    dd          0002476C
 000246F0    dd          0002477A
 0002471D    mov         edx,esp
 0002471F    mov         ecx,1
 00024724    mov         eax,ebx
 00024726    call        TReader.Read
 0002472B    xor         ecx,ecx
 0002472D    mov         cl,byte ptr [esp]
 00024730    mov         eax,esi
 00024732    xor         edx,edx
 00024734    call        @LStrFromPCharLen
 00024739    mov         eax,esi
 0002473B    call        UniqueString
 00024740    mov         edx,eax
 00024742    xor         ecx,ecx
 00024744    mov         cl,byte ptr [esp]
 00024747    mov         eax,ebx
 00024749    call        TReader.Read
>0002474E    jmp         0002478D
 00024750    mov         eax,esi
 00024752    mov         edx,2479C;'False'
 00024757    call        @LStrLAsg
>0002475C    jmp         0002478D
 0002475E    mov         eax,esi
 00024760    mov         edx,247AC;'True'
 00024765    call        @LStrLAsg
>0002476A    jmp         0002478D
 0002476C    mov         eax,esi
 0002476E    mov         edx,247BC;'nil'
 00024773    call        @LStrLAsg
>00024778    jmp         0002478D
 0002477A    mov         eax,esi
 0002477C    mov         edx,247C8;'Null'
 00024781    call        @LStrLAsg
>00024786    jmp         0002478D
 00024788    call        PropValueError
 0002478D    pop         edx
 0002478E    pop         esi
 0002478F    pop         ebx
 00024790    ret
*}
end;

//000247D0
function TReader.ReadInteger:Longint;
begin
{*
 000247D0    push        ebx
 000247D1    add         esp,0FFFFFFF8
 000247D4    mov         ebx,eax
 000247D6    mov         eax,ebx
 000247D8    call        TReader.ReadValue
 000247DD    sub         al,2
>000247DF    je          000247EB
 000247E1    dec         al
>000247E3    je          00024805
 000247E5    dec         al
>000247E7    je          0002481F
>000247E9    jmp         0002482F
 000247EB    lea         edx,[esp+4]
 000247EF    mov         ecx,1
 000247F4    mov         eax,ebx
 000247F6    call        TReader.Read
 000247FB    movsx       eax,byte ptr [esp+4]
 00024800    mov         dword ptr [esp],eax
>00024803    jmp         00024834
 00024805    lea         edx,[esp+6]
 00024809    mov         ecx,2
 0002480E    mov         eax,ebx
 00024810    call        TReader.Read
 00024815    movsx       eax,word ptr [esp+6]
 0002481A    mov         dword ptr [esp],eax
>0002481D    jmp         00024834
 0002481F    mov         edx,esp
 00024821    mov         ecx,4
 00024826    mov         eax,ebx
 00024828    call        TReader.Read
>0002482D    jmp         00024834
 0002482F    call        PropValueError
 00024834    mov         eax,dword ptr [esp]
 00024837    pop         ecx
 00024838    pop         edx
 00024839    pop         ebx
 0002483A    ret
*}
end;

//0002483C
procedure TReader.ReadListBegin;
begin
{*
 0002483C    mov         dl,1
 0002483E    call        TReader.CheckValue
 00024843    ret
*}
end;

//00024844
procedure TReader.ReadListEnd;
begin
{*
 00024844    xor         edx,edx
 00024846    call        TReader.CheckValue
 0002484B    ret
*}
end;

//0002484C
procedure TReader.ReadPrefix(var Flags:TFilerFlags; var AChildPos:Integer);
begin
{*
 0002484C    push        ebx
 0002484D    push        esi
 0002484E    push        edi
 0002484F    mov         edi,ecx
 00024851    mov         esi,edx
 00024853    mov         ebx,eax
 00024855    mov         al,[00024888]
 0002485A    mov         byte ptr [esi],al
 0002485C    mov         eax,ebx
 0002485E    call        TReader.NextValue
 00024863    and         al,0F0
 00024865    cmp         al,0F0
>00024867    jne         00024882
 00024869    mov         eax,ebx
 0002486B    call        TReader.ReadValue
 00024870    and         al,0F
 00024872    mov         byte ptr [esi],al
 00024874    test        byte ptr [esi],2
>00024877    je          00024882
 00024879    mov         eax,ebx
 0002487B    call        TReader.ReadInteger
 00024880    mov         dword ptr [edi],eax
 00024882    pop         edi
 00024883    pop         esi
 00024884    pop         ebx
 00024885    ret
*}
end;

//0002488C
procedure HandleException(E:Exception);
begin
{*
 0002488C    push        ebp
 0002488D    mov         ebp,esp
 0002488F    add         esp,0FFFFFED8
 00024895    push        ebx
 00024896    xor         edx,edx
 00024898    mov         dword ptr [ebp-128],edx
 0002489E    mov         dword ptr [ebp-4],edx
 000248A1    mov         ebx,eax
 000248A3    xor         eax,eax
 000248A5    push        ebp
 000248A6    push        2499E
 000248AB    push        dword ptr fs:[eax]
 000248AE    mov         dword ptr fs:[eax],esp
 000248B1    lea         eax,[ebp-4]
 000248B4    call        @LStrClr
 000248B9    mov         eax,dword ptr [ebp+8]
 000248BC    mov         eax,dword ptr [eax-4]
 000248BF    mov         edx,dword ptr ds:[1FA0C];TComponent
 000248C5    call        @IsClass
 000248CA    test        al,al
>000248CC    je          000248DF
 000248CE    lea         eax,[ebp-4]
 000248D1    mov         edx,dword ptr [ebp+8]
 000248D4    mov         edx,dword ptr [edx-4]
 000248D7    mov         edx,dword ptr [edx+8]
 000248DA    call        @LStrLAsg
 000248DF    cmp         dword ptr [ebp-4],0
>000248E3    jne         00024906
 000248E5    lea         edx,[ebp-104]
 000248EB    mov         eax,dword ptr [ebp+8]
 000248EE    mov         eax,dword ptr [eax-4]
 000248F1    mov         eax,dword ptr [eax]
 000248F3    call        TObject.ClassName
 000248F8    lea         edx,[ebp-104]
 000248FE    lea         eax,[ebp-4]
 00024901    call        @LStrFromString
 00024906    mov         eax,dword ptr [ebp-4]
 00024909    mov         dword ptr [ebp-124],eax
 0002490F    mov         byte ptr [ebp-120],0B
 00024916    mov         eax,[000B5840]
 0002491B    mov         eax,dword ptr [eax]
 0002491D    mov         dword ptr [ebp-11C],eax
 00024923    mov         byte ptr [ebp-118],0B
 0002492A    mov         eax,dword ptr [ebp+8]
 0002492D    mov         eax,dword ptr [eax-8]
 00024930    mov         dword ptr [ebp-114],eax
 00024936    mov         byte ptr [ebp-110],0B
 0002493D    mov         eax,dword ptr [ebx+4]
 00024940    mov         dword ptr [ebp-10C],eax
 00024946    mov         byte ptr [ebp-108],0B
 0002494D    lea         eax,[ebp-124]
 00024953    push        eax
 00024954    push        3
 00024956    lea         edx,[ebp-128]
 0002495C    mov         eax,[000B5B64];^SPropertyException:TResStringRec
 00024961    call        LoadResString
 00024966    mov         ecx,dword ptr [ebp-128]
 0002496C    mov         dl,1
 0002496E    mov         eax,[0001EB34];EReadError
 00024973    call        Exception.CreateFmt
 00024978    call        @RaiseExcept
 0002497D    xor         eax,eax
 0002497F    pop         edx
 00024980    pop         ecx
 00024981    pop         ecx
 00024982    mov         dword ptr fs:[eax],edx
 00024985    push        249A5
 0002498A    lea         eax,[ebp-128]
 00024990    call        @LStrClr
 00024995    lea         eax,[ebp-4]
 00024998    call        @LStrClr
 0002499D    ret
>0002499E    jmp         @HandleFinally
>000249A3    jmp         0002498A
 000249A5    pop         ebx
 000249A6    mov         esp,ebp
 000249A8    pop         ebp
 000249A9    ret
*}
end;

//000249AC
procedure PropPathError;
begin
{*
 000249AC    push        ebp
 000249AD    mov         ebp,esp
 000249AF    push        0
 000249B1    xor         eax,eax
 000249B3    push        ebp
 000249B4    push        249F5
 000249B9    push        dword ptr fs:[eax]
 000249BC    mov         dword ptr fs:[eax],esp
 000249BF    mov         eax,dword ptr [ebp+8]
 000249C2    mov         eax,dword ptr [eax-0C]
 000249C5    call        TReader.SkipValue
 000249CA    lea         edx,[ebp-4]
 000249CD    mov         eax,[000B5B24];^SInvalidPropertyPath:TResStringRec
 000249D2    call        LoadResString
 000249D7    mov         eax,dword ptr [ebp-4]
 000249DA    call        ReadError
 000249DF    xor         eax,eax
 000249E1    pop         edx
 000249E2    pop         ecx
 000249E3    pop         ecx
 000249E4    mov         dword ptr fs:[eax],edx
 000249E7    push        249FC
 000249EC    lea         eax,[ebp-4]
 000249EF    call        @LStrClr
 000249F4    ret
>000249F5    jmp         @HandleFinally
>000249FA    jmp         000249EC
 000249FC    pop         ecx
 000249FD    pop         ebp
 000249FE    ret
*}
end;

//00024A00
procedure TReader.ReadProperty(AInstance:TPersistent);
begin
{*
 00024A00    push        ebp
 00024A01    mov         ebp,esp
 00024A03    add         esp,0FFFFFFEC
 00024A06    push        ebx
 00024A07    push        esi
 00024A08    push        edi
 00024A09    xor         ecx,ecx
 00024A0B    mov         dword ptr [ebp-8],ecx
 00024A0E    mov         dword ptr [ebp-4],edx
 00024A11    mov         dword ptr [ebp-0C],eax
 00024A14    xor         eax,eax
 00024A16    push        ebp
 00024A17    push        24BC4
 00024A1C    push        dword ptr fs:[eax]
 00024A1F    mov         dword ptr fs:[eax],esp
 00024A22    xor         edx,edx
 00024A24    push        ebp
 00024A25    push        24B79
 00024A2A    push        dword ptr fs:[edx]
 00024A2D    mov         dword ptr fs:[edx],esp
 00024A30    lea         edx,[ebp-8]
 00024A33    mov         eax,dword ptr [ebp-0C]
 00024A36    call        TReader.ReadStr
 00024A3B    xor         edx,edx
 00024A3D    push        ebp
 00024A3E    push        24B52
 00024A43    push        dword ptr fs:[edx]
 00024A46    mov         dword ptr fs:[edx],esp
 00024A49    mov         ebx,1
 00024A4E    mov         eax,dword ptr [ebp-8]
 00024A51    call        @LStrLen
 00024A56    mov         esi,eax
 00024A58    mov         eax,dword ptr [ebp-4]
 00024A5B    mov         dword ptr [ebp-10],eax
 00024A5E    mov         eax,dword ptr [ebp-0C]
 00024A61    mov         byte ptr [eax+5C],1
 00024A65    mov         edi,ebx
>00024A67    jmp         00024A6A
 00024A69    inc         ebx
 00024A6A    cmp         esi,ebx
>00024A6C    jl          00024A78
 00024A6E    mov         eax,dword ptr [ebp-8]
 00024A71    cmp         byte ptr [eax+ebx-1],2E
>00024A76    jne         00024A69
 00024A78    mov         eax,dword ptr [ebp-0C]
 00024A7B    add         eax,60
 00024A7E    push        eax
 00024A7F    mov         ecx,ebx
 00024A81    sub         ecx,edi
 00024A83    mov         edx,edi
 00024A85    mov         eax,dword ptr [ebp-8]
 00024A88    call        @LStrCopy
 00024A8D    cmp         esi,ebx
>00024A8F    jl          00024AF4
 00024A91    mov         eax,dword ptr [ebp-10]
 00024A94    mov         eax,dword ptr [eax]
 00024A96    call        TObject.ClassInfo
 00024A9B    mov         edx,dword ptr [ebp-0C]
 00024A9E    mov         edx,dword ptr [edx+60]
 00024AA1    call        GetPropInfo
 00024AA6    mov         edi,eax
 00024AA8    test        edi,edi
>00024AAA    jne         00024AB4
 00024AAC    mov         eax,dword ptr [ebp-0C]
 00024AAF    call        TReader.PropertyError
 00024AB4    xor         eax,eax
 00024AB6    mov         dword ptr [ebp-14],eax
 00024AB9    mov         eax,dword ptr [edi]
 00024ABB    mov         eax,dword ptr [eax]
 00024ABD    cmp         byte ptr [eax],7
>00024AC0    jne         00024ACF
 00024AC2    mov         edx,edi
 00024AC4    mov         eax,dword ptr [ebp-10]
 00024AC7    call        GetOrdProp
 00024ACC    mov         dword ptr [ebp-14],eax
 00024ACF    mov         eax,dword ptr [ebp-14]
 00024AD2    mov         edx,dword ptr ds:[1EFD4];TPersistent
 00024AD8    call        @IsClass
 00024ADD    test        al,al
>00024ADF    jne         00024AE8
 00024AE1    push        ebp
 00024AE2    call        PropPathError
 00024AE7    pop         ecx
 00024AE8    mov         eax,dword ptr [ebp-14]
 00024AEB    mov         dword ptr [ebp-10],eax
 00024AEE    inc         ebx
>00024AEF    jmp         00024A65
 00024AF4    mov         eax,dword ptr [ebp-10]
 00024AF7    mov         eax,dword ptr [eax]
 00024AF9    call        TObject.ClassInfo
 00024AFE    mov         edx,dword ptr [ebp-0C]
 00024B01    mov         edx,dword ptr [edx+60]
 00024B04    call        GetPropInfo
 00024B09    mov         edi,eax
 00024B0B    test        edi,edi
>00024B0D    je          00024B1E
 00024B0F    mov         ecx,edi
 00024B11    mov         edx,dword ptr [ebp-10]
 00024B14    mov         eax,dword ptr [ebp-0C]
 00024B17    call        TReader.ReadPropValue
>00024B1C    jmp         00024B48
 00024B1E    mov         eax,dword ptr [ebp-0C]
 00024B21    mov         byte ptr [eax+5C],0
 00024B25    mov         edx,dword ptr [ebp-0C]
 00024B28    mov         eax,dword ptr [ebp-10]
 00024B2B    mov         ecx,dword ptr [eax]
 00024B2D    call        dword ptr [ecx+4]
 00024B30    mov         eax,dword ptr [ebp-0C]
 00024B33    mov         byte ptr [eax+5C],1
 00024B37    mov         eax,dword ptr [ebp-0C]
 00024B3A    cmp         dword ptr [eax+60],0
>00024B3E    je          00024B48
 00024B40    mov         eax,dword ptr [ebp-0C]
 00024B43    call        TReader.PropertyError
 00024B48    xor         eax,eax
 00024B4A    pop         edx
 00024B4B    pop         ecx
 00024B4C    pop         ecx
 00024B4D    mov         dword ptr fs:[eax],edx
>00024B50    jmp         00024B6F
>00024B52    jmp         @HandleOnException
 00024B57    dd          1
 00024B5B    dd          000176E8;Exception
 00024B5F    dd          00024B63
 00024B63    push        ebp
 00024B64    call        HandleException
 00024B69    pop         ecx
 00024B6A    call        @DoneExcept
 00024B6F    xor         eax,eax
 00024B71    pop         edx
 00024B72    pop         ecx
 00024B73    pop         ecx
 00024B74    mov         dword ptr fs:[eax],edx
>00024B77    jmp         00024BAE
>00024B79    jmp         @HandleOnException
 00024B7E    dd          1
 00024B82    dd          000176E8;Exception
 00024B86    dd          00024B8A
 00024B8A    mov         ebx,eax
 00024B8C    mov         eax,dword ptr [ebp-0C]
 00024B8F    cmp         byte ptr [eax+5C],0
>00024B93    je          00024BA4
 00024B95    mov         edx,dword ptr [ebx+4]
 00024B98    mov         eax,dword ptr [ebp-0C]
 00024B9B    mov         ecx,dword ptr [eax]
 00024B9D    call        dword ptr [ecx+0C]
 00024BA0    test        al,al
>00024BA2    jne         00024BA9
 00024BA4    call        @RaiseAgain
 00024BA9    call        @DoneExcept
 00024BAE    xor         eax,eax
 00024BB0    pop         edx
 00024BB1    pop         ecx
 00024BB2    pop         ecx
 00024BB3    mov         dword ptr fs:[eax],edx
 00024BB6    push        24BCB
 00024BBB    lea         eax,[ebp-8]
 00024BBE    call        @LStrClr
 00024BC3    ret
>00024BC4    jmp         @HandleFinally
>00024BC9    jmp         00024BBB
 00024BCB    pop         edi
 00024BCC    pop         esi
 00024BCD    pop         ebx
 00024BCE    mov         esp,ebp
 00024BD0    pop         ebp
 00024BD1    ret
*}
end;

//00024BD4
procedure SetIntIdent(Instance:TPersistent; PropInfo:Pointer; const Ident:AnsiString);
begin
{*
 00024BD4    push        ebp
 00024BD5    mov         ebp,esp
 00024BD7    add         esp,0FFFFFFE8
 00024BDA    push        ebx
 00024BDB    push        esi
 00024BDC    push        edi
 00024BDD    mov         dword ptr [ebp-0C],ecx
 00024BE0    mov         dword ptr [ebp-8],edx
 00024BE3    mov         dword ptr [ebp-4],eax
 00024BE6    mov         byte ptr [ebp-11],0
 00024BEA    xor         eax,eax
 00024BEC    mov         dword ptr [ebp-10],eax
 00024BEF    mov         eax,[000B6628]
 00024BF4    call        TThreadList.LockList
 00024BF9    mov         dword ptr [ebp-18],eax
 00024BFC    xor         eax,eax
 00024BFE    push        ebp
 00024BFF    push        24C5F
 00024C04    push        dword ptr fs:[eax]
 00024C07    mov         dword ptr fs:[eax],esp
 00024C0A    mov         eax,dword ptr [ebp-18]
 00024C0D    mov         esi,dword ptr [eax+8]
 00024C10    dec         esi
 00024C11    test        esi,esi
>00024C13    jl          00024C47
 00024C15    inc         esi
 00024C16    xor         edi,edi
 00024C18    mov         edx,edi
 00024C1A    mov         eax,dword ptr [ebp-18]
 00024C1D    call        TList.Get
 00024C22    mov         ebx,eax
 00024C24    mov         eax,dword ptr [ebp-8]
 00024C27    mov         eax,dword ptr [eax]
 00024C29    mov         eax,dword ptr [eax]
 00024C2B    cmp         eax,dword ptr [ebx+4]
>00024C2E    jne         00024C43
 00024C30    lea         edx,[ebp-10]
 00024C33    mov         eax,dword ptr [ebp-0C]
 00024C36    call        dword ptr [ebx+8]
 00024C39    test        al,al
>00024C3B    je          00024C43
 00024C3D    mov         byte ptr [ebp-11],1
>00024C41    jmp         00024C47
 00024C43    inc         edi
 00024C44    dec         esi
>00024C45    jne         00024C18
 00024C47    xor         eax,eax
 00024C49    pop         edx
 00024C4A    pop         ecx
 00024C4B    pop         ecx
 00024C4C    mov         dword ptr fs:[eax],edx
 00024C4F    push        24C66
 00024C54    mov         eax,[000B6628]
 00024C59    call        TThreadList.UnlockList
 00024C5E    ret
>00024C5F    jmp         @HandleFinally
>00024C64    jmp         00024C54
 00024C66    cmp         byte ptr [ebp-11],0
>00024C6A    je          00024C7C
 00024C6C    mov         ecx,dword ptr [ebp-10]
 00024C6F    mov         edx,dword ptr [ebp-8]
 00024C72    mov         eax,dword ptr [ebp-4]
 00024C75    call        SetOrdProp
>00024C7A    jmp         00024C81
 00024C7C    call        PropValueError
 00024C81    pop         edi
 00024C82    pop         esi
 00024C83    pop         ebx
 00024C84    mov         esp,ebp
 00024C86    pop         ebp
 00024C87    ret
*}
end;

//00024C88
procedure SetObjectIdent(Instance:TPersistent; PropInfo:Pointer; const Ident:AnsiString);
begin
{*
 00024C88    push        ebp
 00024C89    mov         ebp,esp
 00024C8B    push        0
 00024C8D    push        0
 00024C8F    push        0
 00024C91    push        ebx
 00024C92    push        esi
 00024C93    push        edi
 00024C94    mov         ebx,ecx
 00024C96    mov         dword ptr [ebp-4],edx
 00024C99    mov         edi,eax
 00024C9B    xor         eax,eax
 00024C9D    push        ebp
 00024C9E    push        24D58
 00024CA3    push        dword ptr fs:[eax]
 00024CA6    mov         dword ptr fs:[eax],esp
 00024CA9    lea         eax,[ebp-8]
 00024CAC    call        @LStrClr
 00024CB1    lea         eax,[ebp-0C]
 00024CB4    mov         edx,ebx
 00024CB6    call        @LStrLAsg
 00024CBB    mov         edx,ebx
 00024CBD    mov         eax,24D70;'.'
 00024CC2    call        @LStrPos
 00024CC7    mov         esi,eax
 00024CC9    test        esi,esi
>00024CCB    je          00024CF3
 00024CCD    lea         eax,[ebp-8]
 00024CD0    push        eax
 00024CD1    mov         ecx,esi
 00024CD3    dec         ecx
 00024CD4    mov         edx,1
 00024CD9    mov         eax,ebx
 00024CDB    call        @LStrCopy
 00024CE0    lea         eax,[ebp-0C]
 00024CE3    push        eax
 00024CE4    lea         edx,[esi+1]
 00024CE7    mov         ecx,7FFFFFFF
 00024CEC    mov         eax,ebx
 00024CEE    call        @LStrCopy
 00024CF3    mov         eax,dword ptr [ebp+8]
 00024CF6    mov         eax,dword ptr [eax-4]
 00024CF9    mov         eax,dword ptr [eax+18]
 00024CFC    push        eax
 00024CFD    mov         eax,dword ptr [ebp-4]
 00024D00    push        eax
 00024D01    mov         eax,dword ptr [ebp-8]
 00024D04    push        eax
 00024D05    mov         eax,dword ptr [ebp-0C]
 00024D08    push        eax
 00024D09    mov         ecx,edi
 00024D0B    mov         dl,1
 00024D0D    mov         eax,[0002361C];TPropFixup
 00024D12    call        TPropFixup.Create
 00024D17    mov         ebx,eax
 00024D19    cmp         dword ptr [ebp-8],0
>00024D1D    jne         00024D31
 00024D1F    mov         eax,dword ptr [ebp+8]
 00024D22    mov         eax,dword ptr [eax-4]
 00024D25    mov         eax,dword ptr [eax+2C]
 00024D28    mov         edx,ebx
 00024D2A    call        TList.Add
>00024D2F    jmp         00024D3D
 00024D31    mov         edx,ebx
 00024D33    mov         eax,[000B662C]
 00024D38    call        TThreadList.Add
 00024D3D    xor         eax,eax
 00024D3F    pop         edx
 00024D40    pop         ecx
 00024D41    pop         ecx
 00024D42    mov         dword ptr fs:[eax],edx
 00024D45    push        24D5F
 00024D4A    lea         eax,[ebp-0C]
 00024D4D    mov         edx,2
 00024D52    call        @LStrArrayClr
 00024D57    ret
>00024D58    jmp         @HandleFinally
>00024D5D    jmp         00024D4A
 00024D5F    pop         edi
 00024D60    pop         esi
 00024D61    pop         ebx
 00024D62    mov         esp,ebp
 00024D64    pop         ebp
 00024D65    ret
*}
end;

//00024D74
procedure ReadVariantProp;
begin
{*
 00024D74    push        ebp
 00024D75    mov         ebp,esp
 00024D77    xor         ecx,ecx
 00024D79    push        ecx
 00024D7A    push        ecx
 00024D7B    push        ecx
 00024D7C    push        ecx
 00024D7D    push        ecx
 00024D7E    push        ecx
 00024D7F    push        ebx
 00024D80    xor         eax,eax
 00024D82    push        ebp
 00024D83    push        24F6C
 00024D88    push        dword ptr fs:[eax]
 00024D8B    mov         dword ptr fs:[eax],esp
 00024D8E    mov         eax,dword ptr [ebp+8]
 00024D91    mov         eax,dword ptr [eax-4]
 00024D94    call        TReader.NextValue
 00024D99    mov         ebx,eax
 00024D9B    xor         eax,eax
 00024D9D    mov         al,bl
 00024D9F    cmp         eax,12
>00024DA2    ja          00024F01
 00024DA8    jmp         dword ptr [eax*4+24DAF]
 00024DA8    dd          00024DFB
 00024DA8    dd          00024F01
 00024DA8    dd          00024E2A
 00024DA8    dd          00024E3D
 00024DA8    dd          00024E51
 00024DA8    dd          00024E64
 00024DA8    dd          00024EB1
 00024DA8    dd          00024F01
 00024DA8    dd          00024EE7
 00024DA8    dd          00024EE7
 00024DA8    dd          00024F01
 00024DA8    dd          00024F01
 00024DA8    dd          00024EB1
 00024DA8    dd          00024DFB
 00024DA8    dd          00024F01
 00024DA8    dd          00024E78
 00024DA8    dd          00024E8C
 00024DA8    dd          00024EA0
 00024DA8    dd          00024ECC
 00024DFB    mov         eax,dword ptr [ebp+8]
 00024DFE    mov         eax,dword ptr [eax-4]
 00024E01    call        TReader.ReadValue
 00024E06    cmp         al,0D
>00024E08    jne         00024E17
 00024E0A    lea         eax,[ebp-10]
 00024E0D    call        @VarClear
>00024E12    jmp         00024F22
 00024E17    lea         eax,[ebp-10]
 00024E1A    mov         edx,dword ptr ds:[0B5680];^gvar_000B6404
 00024E20    call        @VarCopy
>00024E25    jmp         00024F22
 00024E2A    mov         eax,dword ptr [ebp+8]
 00024E2D    mov         eax,dword ptr [eax-4]
 00024E30    call        TReader.ReadInteger
 00024E35    mov         byte ptr [ebp-8],al
>00024E38    jmp         00024F22
 00024E3D    mov         eax,dword ptr [ebp+8]
 00024E40    mov         eax,dword ptr [eax-4]
 00024E43    call        TReader.ReadInteger
 00024E48    mov         word ptr [ebp-8],ax
>00024E4C    jmp         00024F22
 00024E51    mov         eax,dword ptr [ebp+8]
 00024E54    mov         eax,dword ptr [eax-4]
 00024E57    call        TReader.ReadInteger
 00024E5C    mov         dword ptr [ebp-8],eax
>00024E5F    jmp         00024F22
 00024E64    mov         eax,dword ptr [ebp+8]
 00024E67    mov         eax,dword ptr [eax-4]
 00024E6A    call        TReader.ReadFloat
 00024E6F    fstp        qword ptr [ebp-8]
 00024E72    wait
>00024E73    jmp         00024F22
 00024E78    mov         eax,dword ptr [ebp+8]
 00024E7B    mov         eax,dword ptr [eax-4]
 00024E7E    call        TReader.ReadSingle
 00024E83    fstp        dword ptr [ebp-8]
 00024E86    wait
>00024E87    jmp         00024F22
 00024E8C    mov         eax,dword ptr [ebp+8]
 00024E8F    mov         eax,dword ptr [eax-4]
 00024E92    call        TReader.ReadCurrency
 00024E97    fistp       qword ptr [ebp-8]
 00024E9A    wait
>00024E9B    jmp         00024F22
 00024EA0    mov         eax,dword ptr [ebp+8]
 00024EA3    mov         eax,dword ptr [eax-4]
 00024EA6    call        TReader.ReadDate
 00024EAB    fstp        qword ptr [ebp-8]
 00024EAE    wait
>00024EAF    jmp         00024F22
 00024EB1    lea         edx,[ebp-14]
 00024EB4    mov         eax,dword ptr [ebp+8]
 00024EB7    mov         eax,dword ptr [eax-4]
 00024EBA    call        TReader.ReadString
 00024EBF    mov         edx,dword ptr [ebp-14]
 00024EC2    lea         eax,[ebp-10]
 00024EC5    call        @VarFromLStr
>00024ECA    jmp         00024F22
 00024ECC    lea         edx,[ebp-18]
 00024ECF    mov         eax,dword ptr [ebp+8]
 00024ED2    mov         eax,dword ptr [eax-4]
 00024ED5    call        TReader.ReadWideString
 00024EDA    mov         edx,dword ptr [ebp-18]
 00024EDD    lea         eax,[ebp-10]
 00024EE0    call        @VarFromWStr
>00024EE5    jmp         00024F22
 00024EE7    mov         eax,dword ptr [ebp+8]
 00024EEA    mov         eax,dword ptr [eax-4]
 00024EED    call        TReader.ReadValue
 00024EF2    cmp         al,9
 00024EF4    sete        al
 00024EF7    neg         al
 00024EF9    sbb         eax,eax
 00024EFB    mov         word ptr [ebp-8],ax
>00024EFF    jmp         00024F22
 00024F01    lea         edx,[ebp-14]
 00024F04    mov         eax,[000B5B58];^SReadError:TResStringRec
 00024F09    call        LoadResString
 00024F0E    mov         ecx,dword ptr [ebp-14]
 00024F11    mov         dl,1
 00024F13    mov         eax,[0001EB34];EReadError
 00024F18    call        Exception.Create
 00024F1D    call        @RaiseExcept
 00024F22    xor         eax,eax
 00024F24    mov         al,bl
 00024F26    mov         ax,word ptr [eax*4+0B436C]
 00024F2E    mov         word ptr [ebp-10],ax
 00024F32    lea         ecx,[ebp-10]
 00024F35    mov         eax,dword ptr [ebp+8]
 00024F38    mov         edx,dword ptr [eax-0C]
 00024F3B    mov         eax,dword ptr [ebp+8]
 00024F3E    mov         eax,dword ptr [eax-8]
 00024F41    call        SetVariantProp
 00024F46    xor         eax,eax
 00024F48    pop         edx
 00024F49    pop         ecx
 00024F4A    pop         ecx
 00024F4B    mov         dword ptr fs:[eax],edx
 00024F4E    push        24F73
 00024F53    lea         eax,[ebp-18]
 00024F56    call        @WStrClr
 00024F5B    lea         eax,[ebp-14]
 00024F5E    call        @LStrClr
 00024F63    lea         eax,[ebp-10]
 00024F66    call        @VarClr
 00024F6B    ret
>00024F6C    jmp         @HandleFinally
>00024F71    jmp         00024F53
 00024F73    pop         ebx
 00024F74    mov         esp,ebp
 00024F76    pop         ebp
 00024F77    ret
*}
end;

//00024F78
procedure TReader.ReadPropValue(Instance:TPersistent; PropInfo:Pointer);
begin
{*
 00024F78    push        ebp
 00024F79    mov         ebp,esp
 00024F7B    add         esp,0FFFFFFE8
 00024F7E    push        ebx
 00024F7F    xor         ebx,ebx
 00024F81    mov         dword ptr [ebp-18],ebx
 00024F84    mov         dword ptr [ebp-0C],ecx
 00024F87    mov         dword ptr [ebp-8],edx
 00024F8A    mov         dword ptr [ebp-4],eax
 00024F8D    xor         eax,eax
 00024F8F    push        ebp
 00024F90    push        251D4
 00024F95    push        dword ptr fs:[eax]
 00024F98    mov         dword ptr fs:[eax],esp
 00024F9B    mov         eax,dword ptr [ebp-0C]
 00024F9E    cmp         dword ptr [eax+8],0
>00024FA2    jne         00024FB9
 00024FA4    lea         edx,[ebp-18]
 00024FA7    mov         eax,[000B5A64];^SReadOnlyProperty:TResStringRec
 00024FAC    call        LoadResString
 00024FB1    mov         eax,dword ptr [ebp-18]
 00024FB4    call        ReadError
 00024FB9    mov         eax,dword ptr [ebp-0C]
 00024FBC    mov         eax,dword ptr [eax]
 00024FBE    mov         ebx,dword ptr [eax]
 00024FC0    xor         eax,eax
 00024FC2    mov         al,byte ptr [ebx]
 00024FC4    cmp         eax,0C
>00024FC7    ja          000251BE
 00024FCD    jmp         dword ptr [eax*4+24FD4]
 00024FCD    dd          000251BE
 00024FCD    dd          00025008
 00024FCD    dd          0002504C
 00024FCD    dd          00025068
 00024FCD    dd          0002508F
 00024FCD    dd          000250AE
 00024FCD    dd          000250CC
 00024FCD    dd          000250E8
 00024FCD    dd          00025153
 00024FCD    dd          000251BE
 00024FCD    dd          000250AE
 00024FCD    dd          000250AE
 00024FCD    dd          000251B7
 00025008    mov         eax,dword ptr [ebp-4]
 0002500B    call        TReader.NextValue
 00025010    cmp         al,7
>00025012    jne         00025032
 00025014    lea         edx,[ebp-18]
 00025017    mov         eax,dword ptr [ebp-4]
 0002501A    call        TReader.ReadIdent
 0002501F    mov         ecx,dword ptr [ebp-18]
 00025022    mov         edx,dword ptr [ebp-0C]
 00025025    mov         eax,dword ptr [ebp-8]
 00025028    call        SetIntIdent
>0002502D    jmp         000251BE
 00025032    mov         eax,dword ptr [ebp-4]
 00025035    call        TReader.ReadInteger
 0002503A    mov         ecx,eax
 0002503C    mov         edx,dword ptr [ebp-0C]
 0002503F    mov         eax,dword ptr [ebp-8]
 00025042    call        SetOrdProp
>00025047    jmp         000251BE
 0002504C    mov         eax,dword ptr [ebp-4]
 0002504F    call        TReader.ReadChar
 00025054    xor         ecx,ecx
 00025056    mov         cl,al
 00025058    mov         edx,dword ptr [ebp-0C]
 0002505B    mov         eax,dword ptr [ebp-8]
 0002505E    call        SetOrdProp
>00025063    jmp         000251BE
 00025068    lea         edx,[ebp-18]
 0002506B    mov         eax,dword ptr [ebp-4]
 0002506E    call        TReader.ReadIdent
 00025073    mov         edx,dword ptr [ebp-18]
 00025076    mov         eax,ebx
 00025078    call        EnumValue
 0002507D    mov         ecx,eax
 0002507F    mov         edx,dword ptr [ebp-0C]
 00025082    mov         eax,dword ptr [ebp-8]
 00025085    call        SetOrdProp
>0002508A    jmp         000251BE
 0002508F    mov         eax,dword ptr [ebp-4]
 00025092    call        TReader.ReadFloat
 00025097    add         esp,0FFFFFFF4
 0002509A    fstp        tbyte ptr [esp]
 0002509D    wait
 0002509E    mov         edx,dword ptr [ebp-0C]
 000250A1    mov         eax,dword ptr [ebp-8]
 000250A4    call        SetFloatProp
>000250A9    jmp         000251BE
 000250AE    lea         edx,[ebp-18]
 000250B1    mov         eax,dword ptr [ebp-4]
 000250B4    call        TReader.ReadString
 000250B9    mov         ecx,dword ptr [ebp-18]
 000250BC    mov         edx,dword ptr [ebp-0C]
 000250BF    mov         eax,dword ptr [ebp-8]
 000250C2    call        SetStrProp
>000250C7    jmp         000251BE
 000250CC    mov         edx,ebx
 000250CE    mov         eax,dword ptr [ebp-4]
 000250D1    call        TReader.ReadSet
 000250D6    mov         ecx,eax
 000250D8    mov         edx,dword ptr [ebp-0C]
 000250DB    mov         eax,dword ptr [ebp-8]
 000250DE    call        SetOrdProp
>000250E3    jmp         000251BE
 000250E8    mov         eax,dword ptr [ebp-4]
 000250EB    call        TReader.NextValue
 000250F0    sub         al,0D
>000250F2    je          000250FA
 000250F4    dec         al
>000250F6    je          00025114
>000250F8    jmp         00025136
 000250FA    mov         eax,dword ptr [ebp-4]
 000250FD    call        TReader.ReadValue
 00025102    xor         ecx,ecx
 00025104    mov         edx,dword ptr [ebp-0C]
 00025107    mov         eax,dword ptr [ebp-8]
 0002510A    call        SetOrdProp
>0002510F    jmp         000251BE
 00025114    mov         eax,dword ptr [ebp-4]
 00025117    call        TReader.ReadValue
 0002511C    mov         edx,dword ptr [ebp-0C]
 0002511F    mov         eax,dword ptr [ebp-8]
 00025122    call        GetOrdProp
 00025127    mov         edx,eax
 00025129    mov         eax,dword ptr [ebp-4]
 0002512C    call        TReader.ReadCollection
>00025131    jmp         000251BE
 00025136    push        ebp
 00025137    lea         edx,[ebp-18]
 0002513A    mov         eax,dword ptr [ebp-4]
 0002513D    call        TReader.ReadIdent
 00025142    mov         ecx,dword ptr [ebp-18]
 00025145    mov         edx,dword ptr [ebp-0C]
 00025148    mov         eax,dword ptr [ebp-8]
 0002514B    call        SetObjectIdent
 00025150    pop         ecx
>00025151    jmp         000251BE
 00025153    mov         eax,dword ptr [ebp-4]
 00025156    call        TReader.NextValue
 0002515B    cmp         al,0D
>0002515D    jne         00025179
 0002515F    mov         eax,dword ptr [ebp-4]
 00025162    call        TReader.ReadValue
 00025167    mov         ecx,0B4364
 0002516C    mov         edx,dword ptr [ebp-0C]
 0002516F    mov         eax,dword ptr [ebp-8]
 00025172    call        SetMethodProp
>00025177    jmp         000251BE
 00025179    lea         edx,[ebp-18]
 0002517C    mov         eax,dword ptr [ebp-4]
 0002517F    call        TReader.ReadIdent
 00025184    mov         ecx,dword ptr [ebp-18]
 00025187    mov         eax,dword ptr [ebp-4]
 0002518A    mov         edx,dword ptr [eax+18]
 0002518D    mov         eax,dword ptr [ebp-4]
 00025190    mov         ebx,dword ptr [eax]
 00025192    call        dword ptr [ebx+10]
 00025195    mov         dword ptr [ebp-14],eax
 00025198    mov         eax,dword ptr [ebp-4]
 0002519B    mov         eax,dword ptr [eax+18]
 0002519E    mov         dword ptr [ebp-10],eax
 000251A1    cmp         dword ptr [ebp-14],0
>000251A5    je          000251BE
 000251A7    lea         ecx,[ebp-14]
 000251AA    mov         edx,dword ptr [ebp-0C]
 000251AD    mov         eax,dword ptr [ebp-8]
 000251B0    call        SetMethodProp
>000251B5    jmp         000251BE
 000251B7    push        ebp
 000251B8    call        ReadVariantProp
 000251BD    pop         ecx
 000251BE    xor         eax,eax
 000251C0    pop         edx
 000251C1    pop         ecx
 000251C2    pop         ecx
 000251C3    mov         dword ptr fs:[eax],edx
 000251C6    push        251DB
 000251CB    lea         eax,[ebp-18]
 000251CE    call        @LStrClr
 000251D3    ret
>000251D4    jmp         @HandleFinally
>000251D9    jmp         000251CB
 000251DB    pop         ebx
 000251DC    mov         esp,ebp
 000251DE    pop         ebp
 000251DF    ret
*}
end;

//000251E0
function FindUniqueName(const Name:AnsiString):AnsiString;
begin
{*
 000251E0    push        ebp
 000251E1    mov         ebp,esp
 000251E3    add         esp,0FFFFFFF0
 000251E6    push        ebx
 000251E7    push        esi
 000251E8    push        edi
 000251E9    mov         ebx,edx
 000251EB    mov         edi,eax
 000251ED    xor         esi,esi
 000251EF    mov         eax,ebx
 000251F1    call        @LStrClr
 000251F6    cmp         dword ptr ds:[0B6618],0
>000251FD    je          00025238
 000251FF    mov         eax,ebx
 00025201    mov         edx,edi
 00025203    call        @LStrLAsg
>00025208    jmp         0002522C
 0002520A    inc         esi
 0002520B    push        ebx
 0002520C    mov         dword ptr [ebp-10],edi
 0002520F    mov         byte ptr [ebp-0C],0B
 00025213    mov         dword ptr [ebp-8],esi
 00025216    mov         byte ptr [ebp-4],0
 0002521A    lea         edx,[ebp-10]
 0002521D    mov         ecx,1
 00025222    mov         eax,25248;'%s_%d'
 00025227    call        Format
 0002522C    mov         eax,dword ptr [ebx]
 0002522E    call        dword ptr ds:[0B6618]
 00025234    test        eax,eax
>00025236    jne         0002520A
 00025238    pop         edi
 00025239    pop         esi
 0002523A    pop         ebx
 0002523B    mov         esp,ebp
 0002523D    pop         ebp
 0002523E    ret
*}
end;

//00025250
function TReader.ReadRootComponent(Root:TComponent):TComponent;
begin
{*
 00025250    push        ebp
 00025251    mov         ebp,esp
 00025253    add         esp,0FFFFFFE4
 00025256    push        ebx
 00025257    push        esi
 00025258    push        edi
 00025259    xor         ecx,ecx
 0002525B    mov         dword ptr [ebp-18],ecx
 0002525E    mov         dword ptr [ebp-1C],ecx
 00025261    mov         dword ptr [ebp-8],edx
 00025264    mov         dword ptr [ebp-4],eax
 00025267    xor         eax,eax
 00025269    push        ebp
 0002526A    push        254AF
 0002526F    push        dword ptr fs:[eax]
 00025272    mov         dword ptr fs:[eax],esp
 00025275    mov         eax,dword ptr [ebp-4]
 00025278    call        TReader.ReadSignature
 0002527D    xor         eax,eax
 0002527F    mov         dword ptr [ebp-0C],eax
 00025282    mov         eax,[000B6614]
 00025287    call        TMultiReadExclusiveWriteSynchronizer.BeginWrite
 0002528C    xor         eax,eax
 0002528E    push        ebp
 0002528F    push        2548D
 00025294    push        dword ptr fs:[eax]
 00025297    mov         dword ptr fs:[eax],esp
 0002529A    xor         eax,eax
 0002529C    push        ebp
 0002529D    push        2544E
 000252A2    push        dword ptr fs:[eax]
 000252A5    mov         dword ptr fs:[eax],esp
 000252A8    lea         ecx,[ebp-10]
 000252AB    lea         edx,[ebp-11]
 000252AE    mov         eax,dword ptr [ebp-4]
 000252B1    mov         ebx,dword ptr [eax]
 000252B3    call        dword ptr [ebx+20]
 000252B6    cmp         dword ptr [ebp-8],0
>000252BA    jne         000252F1
 000252BC    lea         edx,[ebp-18]
 000252BF    mov         eax,dword ptr [ebp-4]
 000252C2    call        TReader.ReadStr
 000252C7    mov         eax,dword ptr [ebp-18]
 000252CA    call        FindClass
 000252CF    xor         ecx,ecx
 000252D1    mov         dl,1
 000252D3    call        dword ptr [eax+2C]
 000252D6    mov         dword ptr [ebp-0C],eax
 000252D9    lea         edx,[ebp-18]
 000252DC    mov         eax,dword ptr [ebp-4]
 000252DF    call        TReader.ReadStr
 000252E4    mov         edx,dword ptr [ebp-18]
 000252E7    mov         eax,dword ptr [ebp-0C]
 000252EA    mov         ecx,dword ptr [eax]
 000252EC    call        dword ptr [ecx+18]
>000252EF    jmp         00025339
 000252F1    mov         eax,dword ptr [ebp-8]
 000252F4    mov         dword ptr [ebp-0C],eax
 000252F7    lea         edx,[ebp-18]
 000252FA    mov         eax,dword ptr [ebp-4]
 000252FD    call        TReader.ReadStr
 00025302    mov         eax,dword ptr [ebp-0C]
 00025305    test        byte ptr [eax+20],10
>00025309    je          00025318
 0002530B    lea         edx,[ebp-18]
 0002530E    mov         eax,dword ptr [ebp-4]
 00025311    call        TReader.ReadStr
>00025316    jmp         00025339
 00025318    lea         edx,[ebp-1C]
 0002531B    mov         eax,dword ptr [ebp-4]
 0002531E    call        TReader.ReadStr
 00025323    mov         eax,dword ptr [ebp-1C]
 00025326    lea         edx,[ebp-18]
 00025329    call        FindUniqueName
 0002532E    mov         edx,dword ptr [ebp-18]
 00025331    mov         eax,dword ptr [ebp-0C]
 00025334    mov         ecx,dword ptr [eax]
 00025336    call        dword ptr [ecx+18]
 00025339    mov         eax,dword ptr [ebp-4]
 0002533C    mov         edx,dword ptr [ebp-0C]
 0002533F    mov         dword ptr [eax+18],edx
 00025342    call        @GetTls
 00025347    cmp         dword ptr [eax+8],0;{GlobalLoaded:TList}
>0002534E    je          00025363
 00025350    call        @GetTls
 00025355    mov         eax,dword ptr [eax+8];{GlobalLoaded:TList}
 0002535B    mov         edx,dword ptr [ebp-4]
 0002535E    mov         dword ptr [edx+30],eax
>00025361    jmp         00025375
 00025363    mov         dl,1
 00025365    mov         eax,[0001EEC4];TList
 0002536A    call        TObject.Create
 0002536F    mov         edx,dword ptr [ebp-4]
 00025372    mov         dword ptr [edx+30],eax
 00025375    xor         eax,eax
 00025377    push        ebp
 00025378    push        25438
 0002537D    push        dword ptr fs:[eax]
 00025380    mov         dword ptr fs:[eax],esp
 00025383    mov         eax,dword ptr [ebp-4]
 00025386    mov         edx,dword ptr [eax+18]
 00025389    mov         eax,dword ptr [ebp-4]
 0002538C    mov         eax,dword ptr [eax+30]
 0002538F    call        TList.Add
 00025394    mov         eax,dword ptr [ebp-4]
 00025397    mov         eax,dword ptr [eax+18]
 0002539A    mov         edx,dword ptr [ebp-4]
 0002539D    mov         dword ptr [edx+24],eax
 000253A0    mov         eax,dword ptr [ebp-4]
 000253A3    mov         eax,dword ptr [eax+18]
 000253A6    or          byte ptr [eax+20],1
 000253AA    mov         eax,dword ptr [ebp-4]
 000253AD    mov         eax,dword ptr [eax+18]
 000253B0    or          byte ptr [eax+20],2
 000253B4    mov         eax,dword ptr [ebp-4]
 000253B7    mov         eax,dword ptr [eax+18]
 000253BA    mov         edx,dword ptr [ebp-4]
 000253BD    mov         ecx,dword ptr [eax]
 000253BF    call        dword ptr [ecx+14]
 000253C2    mov         eax,dword ptr [ebp-4]
 000253C5    mov         eax,dword ptr [eax+18]
 000253C8    and         byte ptr [eax+20],0FD
 000253CC    call        @GetTls
 000253D1    cmp         dword ptr [eax+8],0;{GlobalLoaded:TList}
>000253D8    jne         00025409
 000253DA    mov         eax,dword ptr [ebp-4]
 000253DD    mov         eax,dword ptr [eax+30]
 000253E0    mov         ebx,dword ptr [eax+8]
 000253E3    dec         ebx
 000253E4    test        ebx,ebx
>000253E6    jl          00025409
 000253E8    inc         ebx
 000253E9    mov         dword ptr [ebp-10],0
 000253F0    mov         eax,dword ptr [ebp-4]
 000253F3    mov         eax,dword ptr [eax+30]
 000253F6    mov         edx,dword ptr [ebp-10]
 000253F9    call        TList.Get
 000253FE    mov         edx,dword ptr [eax]
 00025400    call        dword ptr [edx+0C]
 00025403    inc         dword ptr [ebp-10]
 00025406    dec         ebx
>00025407    jne         000253F0
 00025409    xor         eax,eax
 0002540B    pop         edx
 0002540C    pop         ecx
 0002540D    pop         ecx
 0002540E    mov         dword ptr fs:[eax],edx
 00025411    push        2543F
 00025416    call        @GetTls
 0002541B    cmp         dword ptr [eax+8],0;{GlobalLoaded:TList}
>00025422    jne         0002542F
 00025424    mov         eax,dword ptr [ebp-4]
 00025427    mov         eax,dword ptr [eax+30]
 0002542A    call        TObject.Free
 0002542F    mov         eax,dword ptr [ebp-4]
 00025432    xor         edx,edx
 00025434    mov         dword ptr [eax+30],edx
 00025437    ret
>00025438    jmp         @HandleFinally
>0002543D    jmp         00025416
 0002543F    call        GlobalFixupReferences
 00025444    xor         eax,eax
 00025446    pop         edx
 00025447    pop         ecx
 00025448    pop         ecx
 00025449    mov         dword ptr fs:[eax],edx
>0002544C    jmp         00025475
>0002544E    jmp         @HandleAnyException
 00025453    xor         edx,edx
 00025455    mov         eax,dword ptr [ebp-8]
 00025458    call        RemoveFixupReferences
 0002545D    cmp         dword ptr [ebp-8],0
>00025461    jne         0002546B
 00025463    mov         eax,dword ptr [ebp-0C]
 00025466    call        TObject.Free
 0002546B    call        @RaiseAgain
 00025470    call        @DoneExcept
 00025475    xor         eax,eax
 00025477    pop         edx
 00025478    pop         ecx
 00025479    pop         ecx
 0002547A    mov         dword ptr fs:[eax],edx
 0002547D    push        25494
 00025482    mov         eax,[000B6614]
 00025487    call        TMultiReadExclusiveWriteSynchronizer.EndWrite
 0002548C    ret
>0002548D    jmp         @HandleFinally
>00025492    jmp         00025482
 00025494    xor         eax,eax
 00025496    pop         edx
 00025497    pop         ecx
 00025498    pop         ecx
 00025499    mov         dword ptr fs:[eax],edx
 0002549C    push        254B6
 000254A1    lea         eax,[ebp-1C]
 000254A4    mov         edx,2
 000254A9    call        @LStrArrayClr
 000254AE    ret
>000254AF    jmp         @HandleFinally
>000254B4    jmp         000254A1
 000254B6    mov         eax,dword ptr [ebp-0C]
 000254B9    pop         edi
 000254BA    pop         esi
 000254BB    pop         ebx
 000254BC    mov         esp,ebp
 000254BE    pop         ebp
 000254BF    ret
*}
end;

//000254C0
function TReader.ReadSet(SetType:Pointer):Integer;
begin
{*
 000254C0    push        ebp
 000254C1    mov         ebp,esp
 000254C3    add         esp,0FFFFFFF8
 000254C6    push        ebx
 000254C7    push        esi
 000254C8    push        edi
 000254C9    xor         ecx,ecx
 000254CB    mov         dword ptr [ebp-8],ecx
 000254CE    mov         ebx,edx
 000254D0    mov         dword ptr [ebp-4],eax
 000254D3    xor         eax,eax
 000254D5    push        ebp
 000254D6    push        2556A
 000254DB    push        dword ptr fs:[eax]
 000254DE    mov         dword ptr fs:[eax],esp
 000254E1    xor         eax,eax
 000254E3    push        ebp
 000254E4    push        2553D
 000254E9    push        dword ptr fs:[eax]
 000254EC    mov         dword ptr fs:[eax],esp
 000254EF    mov         eax,dword ptr [ebp-4]
 000254F2    call        TReader.ReadValue
 000254F7    cmp         al,0B
>000254F9    je          00025500
 000254FB    call        PropValueError
 00025500    mov         eax,ebx
 00025502    call        GetTypeData
 00025507    mov         eax,dword ptr [eax+1]
 0002550A    mov         esi,dword ptr [eax]
 0002550C    xor         ebx,ebx
 0002550E    lea         edx,[ebp-8]
 00025511    mov         eax,dword ptr [ebp-4]
 00025514    call        TReader.ReadStr
 00025519    cmp         dword ptr [ebp-8],0
>0002551D    je          00025533
 0002551F    mov         edx,dword ptr [ebp-8]
 00025522    mov         eax,esi
 00025524    call        EnumValue
 00025529    cmp         eax,1F
>0002552C    ja          0002550E
 0002552E    bts         ebx,eax
>00025531    jmp         0002550E
 00025533    xor         eax,eax
 00025535    pop         edx
 00025536    pop         ecx
 00025537    pop         ecx
 00025538    mov         dword ptr fs:[eax],edx
>0002553B    jmp         00025554
>0002553D    jmp         @HandleAnyException
 00025542    mov         eax,dword ptr [ebp-4]
 00025545    call        TReader.SkipSetBody
 0002554A    call        @RaiseAgain
 0002554F    call        @DoneExcept
 00025554    xor         eax,eax
 00025556    pop         edx
 00025557    pop         ecx
 00025558    pop         ecx
 00025559    mov         dword ptr fs:[eax],edx
 0002555C    push        25571
 00025561    lea         eax,[ebp-8]
 00025564    call        @LStrClr
 00025569    ret
>0002556A    jmp         @HandleFinally
>0002556F    jmp         00025561
 00025571    mov         eax,ebx
 00025573    pop         edi
 00025574    pop         esi
 00025575    pop         ebx
 00025576    pop         ecx
 00025577    pop         ecx
 00025578    pop         ebp
 00025579    ret
*}
end;

//0002557C
procedure TReader.ReadSignature;
begin
{*
 0002557C    push        ebp
 0002557D    mov         ebp,esp
 0002557F    add         esp,0FFFFFFF8
 00025582    xor         edx,edx
 00025584    mov         dword ptr [ebp-8],edx
 00025587    xor         edx,edx
 00025589    push        ebp
 0002558A    push        255D8
 0002558F    push        dword ptr fs:[edx]
 00025592    mov         dword ptr fs:[edx],esp
 00025595    lea         edx,[ebp-4]
 00025598    mov         ecx,4
 0002559D    call        TReader.Read
 000255A2    mov         eax,dword ptr [ebp-4]
 000255A5    cmp         eax,dword ptr ds:[0B4360]
>000255AB    je          000255C2
 000255AD    lea         edx,[ebp-8]
 000255B0    mov         eax,[000B58B8];^SInvalidImage:TResStringRec
 000255B5    call        LoadResString
 000255BA    mov         eax,dword ptr [ebp-8]
 000255BD    call        ReadError
 000255C2    xor         eax,eax
 000255C4    pop         edx
 000255C5    pop         ecx
 000255C6    pop         ecx
 000255C7    mov         dword ptr fs:[eax],edx
 000255CA    push        255DF
 000255CF    lea         eax,[ebp-8]
 000255D2    call        @LStrClr
 000255D7    ret
>000255D8    jmp         @HandleFinally
>000255DD    jmp         000255CF
 000255DF    pop         ecx
 000255E0    pop         ecx
 000255E1    pop         ebp
 000255E2    ret
*}
end;

//000255E4
function TReader.ReadStr:AnsiString;
begin
{*
 000255E4    push        ebx
 000255E5    push        esi
 000255E6    push        ecx
 000255E7    mov         esi,edx
 000255E9    mov         ebx,eax
 000255EB    mov         edx,esp
 000255ED    mov         ecx,1
 000255F2    mov         eax,ebx
 000255F4    call        TReader.Read
 000255F9    xor         ecx,ecx
 000255FB    mov         cl,byte ptr [esp]
 000255FE    mov         eax,esi
 00025600    xor         edx,edx
 00025602    call        @LStrFromPCharLen
 00025607    mov         eax,esi
 00025609    call        UniqueString
 0002560E    mov         edx,eax
 00025610    xor         ecx,ecx
 00025612    mov         cl,byte ptr [esp]
 00025615    mov         eax,ebx
 00025617    call        TReader.Read
 0002561C    pop         edx
 0002561D    pop         esi
 0002561E    pop         ebx
 0002561F    ret
*}
end;

//00025620
function TReader.ReadString:AnsiString;
begin
{*
 00025620    push        ebx
 00025621    push        esi
 00025622    push        ecx
 00025623    mov         esi,edx
 00025625    mov         ebx,eax
 00025627    xor         eax,eax
 00025629    mov         dword ptr [esp],eax
 0002562C    mov         eax,ebx
 0002562E    call        TReader.ReadValue
 00025633    sub         al,6
>00025635    je          0002563D
 00025637    sub         al,6
>00025639    je          0002564D
>0002563B    jmp         0002565D
 0002563D    mov         edx,esp
 0002563F    mov         ecx,1
 00025644    mov         eax,ebx
 00025646    call        TReader.Read
>0002564B    jmp         00025662
 0002564D    mov         edx,esp
 0002564F    mov         ecx,4
 00025654    mov         eax,ebx
 00025656    call        TReader.Read
>0002565B    jmp         00025662
 0002565D    call        PropValueError
 00025662    mov         eax,esi
 00025664    mov         ecx,dword ptr [esp]
 00025667    xor         edx,edx
 00025669    call        @LStrFromPCharLen
 0002566E    mov         edx,dword ptr [esi]
 00025670    mov         ecx,dword ptr [esp]
 00025673    mov         eax,ebx
 00025675    call        TReader.Read
 0002567A    pop         edx
 0002567B    pop         esi
 0002567C    pop         ebx
 0002567D    ret
*}
end;

//00025680
function TReader.ReadWideString:WideString;
begin
{*
 00025680    push        ebx
 00025681    push        esi
 00025682    push        ecx
 00025683    mov         esi,edx
 00025685    mov         ebx,eax
 00025687    xor         eax,eax
 00025689    mov         dword ptr [esp],eax
 0002568C    mov         eax,ebx
 0002568E    call        TReader.ReadValue
 00025693    cmp         al,12
>00025695    je          0002569C
 00025697    call        PropValueError
 0002569C    mov         edx,esp
 0002569E    mov         ecx,4
 000256A3    mov         eax,ebx
 000256A5    call        TReader.Read
 000256AA    mov         eax,esi
 000256AC    mov         edx,dword ptr [esp]
 000256AF    call        @WStrSetLength
 000256B4    mov         ecx,dword ptr [esp]
 000256B7    add         ecx,ecx
 000256B9    mov         edx,dword ptr [esi]
 000256BB    mov         eax,ebx
 000256BD    call        TReader.Read
 000256C2    pop         edx
 000256C3    pop         esi
 000256C4    pop         ebx
 000256C5    ret
*}
end;

//000256C8
function TReader.ReadValue:TValueType;
begin
{*
 000256C8    push        ecx
 000256C9    mov         edx,esp
 000256CB    mov         ecx,1
 000256D0    call        TReader.Read
 000256D5    mov         al,byte ptr [esp]
 000256D8    pop         edx
 000256D9    ret
*}
end;

//000256DC
procedure TReader.SkipSetBody;
begin
{*
 000256DC    push        ebp
 000256DD    mov         ebp,esp
 000256DF    push        0
 000256E1    push        ebx
 000256E2    mov         ebx,eax
 000256E4    xor         eax,eax
 000256E6    push        ebp
 000256E7    push        25718
 000256EC    push        dword ptr fs:[eax]
 000256EF    mov         dword ptr fs:[eax],esp
 000256F2    lea         edx,[ebp-4]
 000256F5    mov         eax,ebx
 000256F7    call        TReader.ReadStr
 000256FC    cmp         dword ptr [ebp-4],0
>00025700    jne         000256F2
 00025702    xor         eax,eax
 00025704    pop         edx
 00025705    pop         ecx
 00025706    pop         ecx
 00025707    mov         dword ptr fs:[eax],edx
 0002570A    push        2571F
 0002570F    lea         eax,[ebp-4]
 00025712    call        @LStrClr
 00025717    ret
>00025718    jmp         @HandleFinally
>0002571D    jmp         0002570F
 0002571F    pop         ebx
 00025720    pop         ecx
 00025721    pop         ebp
 00025722    ret
*}
end;

//00025724
procedure SkipList;
begin
{*
 00025724    push        ebp
 00025725    mov         ebp,esp
 00025727    push        ebx
 00025728    mov         ebx,dword ptr [ebp+8]
 0002572B    add         ebx,0FFFFFFFC
>0002572E    jmp         00025737
 00025730    mov         eax,dword ptr [ebx]
 00025732    call        TReader.SkipValue
 00025737    mov         eax,dword ptr [ebx]
 00025739    call        TReader.EndOfList
 0002573E    test        al,al
>00025740    je          00025730
 00025742    mov         eax,dword ptr [ebx]
 00025744    call        TReader.ReadListEnd
 00025749    pop         ebx
 0002574A    pop         ebp
 0002574B    ret
*}
end;

//0002574C
procedure SkipBytes(Count:Longint);
begin
{*
 0002574C    push        ebp
 0002574D    mov         ebp,esp
 0002574F    add         esp,0FFFFFF00
 00025755    push        ebx
 00025756    mov         ebx,eax
 00025758    test        ebx,ebx
>0002575A    jle         0002579B
 0002575C    cmp         ebx,100
>00025762    jle         00025782
 00025764    lea         edx,[ebp-100]
 0002576A    mov         eax,dword ptr [ebp+8]
 0002576D    mov         eax,dword ptr [eax-4]
 00025770    mov         ecx,100
 00025775    call        TReader.Read
 0002577A    sub         ebx,100
>00025780    jmp         00025797
 00025782    lea         edx,[ebp-100]
 00025788    mov         eax,dword ptr [ebp+8]
 0002578B    mov         eax,dword ptr [eax-4]
 0002578E    mov         ecx,ebx
 00025790    call        TReader.Read
 00025795    xor         ebx,ebx
 00025797    test        ebx,ebx
>00025799    jg          0002575C
 0002579B    pop         ebx
 0002579C    mov         esp,ebp
 0002579E    pop         ebp
 0002579F    ret
*}
end;

//000257A0
procedure SkipBinary;
begin
{*
 000257A0    push        ebp
 000257A1    mov         ebp,esp
 000257A3    push        ecx
 000257A4    lea         edx,[ebp-4]
 000257A7    mov         eax,dword ptr [ebp+8]
 000257AA    mov         eax,dword ptr [eax-4]
 000257AD    mov         ecx,4
 000257B2    call        TReader.Read
 000257B7    mov         eax,dword ptr [ebp+8]
 000257BA    push        eax
 000257BB    mov         eax,dword ptr [ebp-4]
 000257BE    call        SkipBytes
 000257C3    pop         ecx
 000257C4    pop         ecx
 000257C5    pop         ebp
 000257C6    ret
*}
end;

//000257C8
procedure SkipCollection;
begin
{*
 000257C8    push        ebp
 000257C9    mov         ebp,esp
 000257CB    push        ebx
 000257CC    mov         ebx,dword ptr [ebp+8]
 000257CF    add         ebx,0FFFFFFFC
>000257D2    jmp         00025812
 000257D4    mov         eax,dword ptr [ebx]
 000257D6    call        TReader.NextValue
 000257DB    add         al,0FE
 000257DD    sub         al,3
>000257DF    jae         000257E8
 000257E1    mov         eax,dword ptr [ebx]
 000257E3    call        TReader.SkipValue
 000257E8    mov         eax,dword ptr [ebp+8]
 000257EB    push        eax
 000257EC    mov         eax,1
 000257F1    call        SkipBytes
 000257F6    pop         ecx
>000257F7    jmp         00025800
 000257F9    mov         eax,dword ptr [ebx]
 000257FB    call        TReader.SkipProperty
 00025800    mov         eax,dword ptr [ebx]
 00025802    call        TReader.EndOfList
 00025807    test        al,al
>00025809    je          000257F9
 0002580B    mov         eax,dword ptr [ebx]
 0002580D    call        TReader.ReadListEnd
 00025812    mov         eax,dword ptr [ebx]
 00025814    call        TReader.EndOfList
 00025819    test        al,al
>0002581B    je          000257D4
 0002581D    mov         eax,dword ptr [ebx]
 0002581F    call        TReader.ReadListEnd
 00025824    pop         ebx
 00025825    pop         ebp
 00025826    ret
*}
end;

//00025828
procedure TReader.SkipValue;
begin
{*
 00025828    push        ebp
 00025829    mov         ebp,esp
 0002582B    add         esp,0FFFFFFF8
 0002582E    xor         edx,edx
 00025830    mov         dword ptr [ebp-8],edx
 00025833    mov         dword ptr [ebp-4],eax
 00025836    xor         eax,eax
 00025838    push        ebp
 00025839    push        2591B
 0002583E    push        dword ptr fs:[eax]
 00025841    mov         dword ptr fs:[eax],esp
 00025844    mov         eax,dword ptr [ebp-4]
 00025847    call        TReader.ReadValue
 0002584C    and         eax,7F
 0002584F    cmp         eax,0E
>00025852    ja          00025905
 00025858    jmp         dword ptr [eax*4+2585F]
 00025858    dd          00025905
 00025858    dd          0002589D
 00025858    dd          000258A6
 00025858    dd          000258B4
 00025858    dd          000258C2
 00025858    dd          000258D0
 00025858    dd          000258DE
 00025858    dd          000258DE
 00025858    dd          00025905
 00025858    dd          00025905
 00025858    dd          000258EB
 00025858    dd          000258F4
 00025858    dd          00025905
 00025858    dd          00025905
 00025858    dd          000258FE
>0002589B    jmp         00025905
 0002589D    push        ebp
 0002589E    call        SkipList
 000258A3    pop         ecx
>000258A4    jmp         00025905
 000258A6    push        ebp
 000258A7    mov         eax,1
 000258AC    call        SkipBytes
 000258B1    pop         ecx
>000258B2    jmp         00025905
 000258B4    push        ebp
 000258B5    mov         eax,2
 000258BA    call        SkipBytes
 000258BF    pop         ecx
>000258C0    jmp         00025905
 000258C2    push        ebp
 000258C3    mov         eax,4
 000258C8    call        SkipBytes
 000258CD    pop         ecx
>000258CE    jmp         00025905
 000258D0    push        ebp
 000258D1    mov         eax,0A
 000258D6    call        SkipBytes
 000258DB    pop         ecx
>000258DC    jmp         00025905
 000258DE    lea         edx,[ebp-8]
 000258E1    mov         eax,dword ptr [ebp-4]
 000258E4    call        TReader.ReadStr
>000258E9    jmp         00025905
 000258EB    push        ebp
 000258EC    call        SkipBinary
 000258F1    pop         ecx
>000258F2    jmp         00025905
 000258F4    mov         eax,dword ptr [ebp-4]
 000258F7    call        TReader.SkipSetBody
>000258FC    jmp         00025905
 000258FE    push        ebp
 000258FF    call        SkipCollection
 00025904    pop         ecx
 00025905    xor         eax,eax
 00025907    pop         edx
 00025908    pop         ecx
 00025909    pop         ecx
 0002590A    mov         dword ptr fs:[eax],edx
 0002590D    push        25922
 00025912    lea         eax,[ebp-8]
 00025915    call        @LStrClr
 0002591A    ret
>0002591B    jmp         @HandleFinally
>00025920    jmp         00025912
 00025922    pop         ecx
 00025923    pop         ecx
 00025924    pop         ebp
 00025925    ret
*}
end;

//00025928
procedure TReader.SkipProperty;
begin
{*
 00025928    push        ebp
 00025929    mov         ebp,esp
 0002592B    push        0
 0002592D    push        ebx
 0002592E    mov         ebx,eax
 00025930    xor         eax,eax
 00025932    push        ebp
 00025933    push        25965
 00025938    push        dword ptr fs:[eax]
 0002593B    mov         dword ptr fs:[eax],esp
 0002593E    lea         edx,[ebp-4]
 00025941    mov         eax,ebx
 00025943    call        TReader.ReadStr
 00025948    mov         eax,ebx
 0002594A    call        TReader.SkipValue
 0002594F    xor         eax,eax
 00025951    pop         edx
 00025952    pop         ecx
 00025953    pop         ecx
 00025954    mov         dword ptr fs:[eax],edx
 00025957    push        2596C
 0002595C    lea         eax,[ebp-4]
 0002595F    call        @LStrClr
 00025964    ret
>00025965    jmp         @HandleFinally
>0002596A    jmp         0002595C
 0002596C    pop         ebx
 0002596D    pop         ecx
 0002596E    pop         ebp
 0002596F    ret
*}
end;

//00025970
procedure TReader.SkipComponent(SkipHeader:Boolean);
begin
{*
 00025970    push        ebp
 00025971    mov         ebp,esp
 00025973    add         esp,0FFFFFFF4
 00025976    push        ebx
 00025977    push        esi
 00025978    xor         ecx,ecx
 0002597A    mov         dword ptr [ebp-0C],ecx
 0002597D    mov         esi,eax
 0002597F    xor         eax,eax
 00025981    push        ebp
 00025982    push        25A00
 00025987    push        dword ptr fs:[eax]
 0002598A    mov         dword ptr fs:[eax],esp
 0002598D    test        dl,dl
>0002598F    je          000259BB
 00025991    lea         ecx,[ebp-8]
 00025994    lea         edx,[ebp-1]
 00025997    mov         eax,esi
 00025999    mov         ebx,dword ptr [eax]
 0002599B    call        dword ptr [ebx+20]
 0002599E    lea         edx,[ebp-0C]
 000259A1    mov         eax,esi
 000259A3    call        TReader.ReadStr
 000259A8    lea         edx,[ebp-0C]
 000259AB    mov         eax,esi
 000259AD    call        TReader.ReadStr
>000259B2    jmp         000259BB
 000259B4    mov         eax,esi
 000259B6    call        TReader.SkipProperty
 000259BB    mov         eax,esi
 000259BD    call        TReader.EndOfList
 000259C2    test        al,al
>000259C4    je          000259B4
 000259C6    mov         eax,esi
 000259C8    call        TReader.ReadListEnd
>000259CD    jmp         000259D8
 000259CF    mov         dl,1
 000259D1    mov         eax,esi
 000259D3    call        TReader.SkipComponent
 000259D8    mov         eax,esi
 000259DA    call        TReader.EndOfList
 000259DF    test        al,al
>000259E1    je          000259CF
 000259E3    mov         eax,esi
 000259E5    call        TReader.ReadListEnd
 000259EA    xor         eax,eax
 000259EC    pop         edx
 000259ED    pop         ecx
 000259EE    pop         ecx
 000259EF    mov         dword ptr fs:[eax],edx
 000259F2    push        25A07
 000259F7    lea         eax,[ebp-0C]
 000259FA    call        @LStrClr
 000259FF    ret
>00025A00    jmp         @HandleFinally
>00025A05    jmp         000259F7
 00025A07    pop         esi
 00025A08    pop         ebx
 00025A09    mov         esp,ebp
 00025A0B    pop         ebp
 00025A0C    ret
*}
end;

//00025A10
function TReader.FindAncestorComponent(const Name:AnsiString; ComponentClass:TPersistentClass):TComponent;
begin
{*
 00025A10    push        ebp
 00025A11    mov         ebp,esp
 00025A13    add         esp,0FFFFFFEC
 00025A16    push        ebx
 00025A17    push        esi
 00025A18    push        edi
 00025A19    xor         ebx,ebx
 00025A1B    mov         dword ptr [ebp-14],ebx
 00025A1E    mov         dword ptr [ebp-8],ebx
 00025A21    mov         edi,ecx
 00025A23    mov         esi,edx
 00025A25    mov         ebx,eax
 00025A27    xor         eax,eax
 00025A29    push        ebp
 00025A2A    push        25ABF
 00025A2F    push        dword ptr fs:[eax]
 00025A32    mov         dword ptr fs:[eax],esp
 00025A35    lea         eax,[ebp-8]
 00025A38    mov         edx,esi
 00025A3A    call        @LStrLAsg
 00025A3F    mov         edx,dword ptr [ebp-8]
 00025A42    mov         eax,dword ptr [ebx+18]
 00025A45    call        TComponent.FindComponent
 00025A4A    mov         dword ptr [ebp-4],eax
 00025A4D    cmp         dword ptr [ebp-4],0
>00025A51    jne         00025AA1
 00025A53    cmp         word ptr [ebx+4E],0
>00025A58    je          00025A6A
 00025A5A    push        edi
 00025A5B    lea         eax,[ebp-4]
 00025A5E    push        eax
 00025A5F    mov         ecx,dword ptr [ebp-8]
 00025A62    mov         edx,ebx
 00025A64    mov         eax,dword ptr [ebx+50]
 00025A67    call        dword ptr [ebx+4C]
 00025A6A    cmp         dword ptr [ebp-4],0
>00025A6E    jne         00025AA1
 00025A70    mov         eax,dword ptr [ebp-8]
 00025A73    mov         dword ptr [ebp-10],eax
 00025A76    mov         byte ptr [ebp-0C],0B
 00025A7A    lea         eax,[ebp-10]
 00025A7D    push        eax
 00025A7E    push        0
 00025A80    lea         edx,[ebp-14]
 00025A83    mov         eax,[000B5808];^SAncestorNotFound:TResStringRec
 00025A88    call        LoadResString
 00025A8D    mov         ecx,dword ptr [ebp-14]
 00025A90    mov         dl,1
 00025A92    mov         eax,[0001EB34];EReadError
 00025A97    call        Exception.CreateFmt
 00025A9C    call        @RaiseExcept
 00025AA1    xor         eax,eax
 00025AA3    pop         edx
 00025AA4    pop         ecx
 00025AA5    pop         ecx
 00025AA6    mov         dword ptr fs:[eax],edx
 00025AA9    push        25AC6
 00025AAE    lea         eax,[ebp-14]
 00025AB1    call        @LStrClr
 00025AB6    lea         eax,[ebp-8]
 00025AB9    call        @LStrClr
 00025ABE    ret
>00025ABF    jmp         @HandleFinally
>00025AC4    jmp         00025AAE
 00025AC6    mov         eax,dword ptr [ebp-4]
 00025AC9    pop         edi
 00025ACA    pop         esi
 00025ACB    pop         ebx
 00025ACC    mov         esp,ebp
 00025ACE    pop         ebp
 00025ACF    ret
*}
end;

//00025AD0
procedure TReader.ReferenceName(var Name:AnsiString);
begin
{*
 00025AD0    push        ebx
 00025AD1    cmp         word ptr [eax+46],0
>00025AD6    je          00025AE4
 00025AD8    mov         ecx,edx
 00025ADA    mov         ebx,eax
 00025ADC    mov         edx,eax
 00025ADE    mov         eax,dword ptr [ebx+48]
 00025AE1    call        dword ptr [ebx+44]
 00025AE4    pop         ebx
 00025AE5    ret
*}
end;

//00025AE8
procedure TReader.SetName(Component:TComponent; var Name:AnsiString);
begin
{*
 00025AE8    push        ebx
 00025AE9    push        esi
 00025AEA    push        edi
 00025AEB    mov         esi,ecx
 00025AED    mov         ebx,edx
 00025AEF    cmp         word ptr [eax+3E],0
>00025AF4    je          00025B03
 00025AF6    push        esi
 00025AF7    mov         edi,eax
 00025AF9    mov         ecx,ebx
 00025AFB    mov         edx,eax
 00025AFD    mov         eax,dword ptr [edi+40]
 00025B00    call        dword ptr [edi+3C]
 00025B03    mov         edx,dword ptr [esi]
 00025B05    mov         eax,ebx
 00025B07    mov         ecx,dword ptr [eax]
 00025B09    call        dword ptr [ecx+18]
 00025B0C    pop         edi
 00025B0D    pop         esi
 00025B0E    pop         ebx
 00025B0F    ret
*}
end;

//00025B10
destructor TWriter.Destroy;
begin
{*
 00025B10    push        ebx
 00025B11    push        esi
 00025B12    call        @BeforeDestruction
 00025B17    mov         ebx,edx
 00025B19    mov         esi,eax
 00025B1B    mov         eax,esi
 00025B1D    call        TWriter.WriteBuffer
 00025B22    mov         edx,ebx
 00025B24    and         dl,0FC
 00025B27    mov         eax,esi
 00025B29    call        TFiler.Destroy
 00025B2E    test        bl,bl
>00025B30    jle         00025B39
 00025B32    mov         eax,esi
 00025B34    call        @ClassDestroy
 00025B39    pop         esi
 00025B3A    pop         ebx
 00025B3B    ret
*}
end;

//00025B3C
procedure TWriter.AddAncestor(Component:TComponent);
begin
{*
 00025B3C    mov         eax,dword ptr [eax+2C]
 00025B3F    call        TList.Add
 00025B44    ret
*}
end;

//00025B48
procedure TWriter.DefineProperty(const Name:AnsiString; ReadData:TReaderProc; WriteData:TWriterProc; HasData:Boolean);
begin
{*
 00025B48    push        ebp
 00025B49    mov         ebp,esp
 00025B4B    push        ebx
 00025B4C    mov         ebx,eax
 00025B4E    test        cl,cl
>00025B50    je          00025B68
 00025B52    cmp         word ptr [ebp+0A],0
>00025B57    je          00025B68
 00025B59    mov         eax,ebx
 00025B5B    call        TWriter.WritePropName
 00025B60    mov         edx,ebx
 00025B62    mov         eax,dword ptr [ebp+0C]
 00025B65    call        dword ptr [ebp+8]
 00025B68    pop         ebx
 00025B69    pop         ebp
 00025B6A    ret         10
*}
end;

//00025B70
procedure TWriter.DefineBinaryProperty(const Name:AnsiString; ReadData:TStreamProc; WriteData:TStreamProc; HasData:Boolean);
begin
{*
 00025B70    push        ebp
 00025B71    mov         ebp,esp
 00025B73    push        ebx
 00025B74    mov         ebx,eax
 00025B76    test        cl,cl
>00025B78    je          00025B95
 00025B7A    cmp         word ptr [ebp+0A],0
>00025B7F    je          00025B95
 00025B81    mov         eax,ebx
 00025B83    call        TWriter.WritePropName
 00025B88    push        dword ptr [ebp+0C]
 00025B8B    push        dword ptr [ebp+8]
 00025B8E    mov         eax,ebx
 00025B90    call        TWriter.WriteBinary
 00025B95    pop         ebx
 00025B96    pop         ebp
 00025B97    ret         10
*}
end;

//00025B9C
function TWriter.GetPosition:Longint;
begin
{*
 00025B9C    push        ebx
 00025B9D    mov         ebx,eax
 00025B9F    mov         eax,dword ptr [ebx+4]
 00025BA2    call        TStream.GetPosition
 00025BA7    add         eax,dword ptr [ebx+10]
 00025BAA    pop         ebx
 00025BAB    ret
*}
end;

//00025BAC
procedure TWriter.FlushBuffer;
begin
{*
 00025BAC    call        TWriter.WriteBuffer
 00025BB1    ret
*}
end;

//00025BB4
procedure TWriter.SetPosition(Value:Longint);
begin
{*
 00025BB4    push        ebx
 00025BB5    push        esi
 00025BB6    mov         esi,edx
 00025BB8    mov         ebx,eax
 00025BBA    mov         eax,dword ptr [ebx+4]
 00025BBD    call        TStream.GetPosition
 00025BC2    cmp         eax,esi
>00025BC4    jg          00025BCF
 00025BC6    mov         edx,dword ptr [ebx+10]
 00025BC9    add         edx,eax
 00025BCB    cmp         esi,edx
>00025BCD    jle         00025BE3
 00025BCF    mov         eax,ebx
 00025BD1    call        TWriter.WriteBuffer
 00025BD6    mov         edx,esi
 00025BD8    mov         eax,dword ptr [ebx+4]
 00025BDB    call        TStream.SetPosition
 00025BE0    pop         esi
 00025BE1    pop         ebx
 00025BE2    ret
 00025BE3    sub         esi,eax
 00025BE5    mov         dword ptr [ebx+10],esi
 00025BE8    pop         esi
 00025BE9    pop         ebx
 00025BEA    ret
*}
end;

//00025BEC
procedure TWriter.Write(const Buf:void ; Count:Longint);
begin
{*
 00025BEC    push        esi
 00025BED    push        edi
 00025BEE    push        ebx
 00025BEF    mov         esi,edx
 00025BF1    mov         ebx,ecx
 00025BF3    mov         edi,eax
>00025BF5    jmp         00025C2D
 00025BF7    mov         ecx,dword ptr [edi+0C]
 00025BFA    sub         ecx,dword ptr [edi+10]
>00025BFD    ja          00025C09
 00025BFF    mov         eax,edi
 00025C01    call        TWriter.WriteBuffer
 00025C06    mov         ecx,dword ptr [edi+0C]
 00025C09    cmp         ecx,ebx
>00025C0B    jb          00025C0F
 00025C0D    mov         ecx,ebx
 00025C0F    sub         ebx,ecx
 00025C11    push        edi
 00025C12    mov         eax,dword ptr [edi+8]
 00025C15    add         eax,dword ptr [edi+10]
 00025C18    add         dword ptr [edi+10],ecx
 00025C1B    mov         edi,eax
 00025C1D    mov         edx,ecx
 00025C1F    shr         ecx,2
 00025C22    cld
 00025C23    rep movs    dword ptr [edi],dword ptr [esi]
 00025C25    mov         ecx,edx
 00025C27    and         ecx,3
 00025C2A    rep movs    byte ptr [edi],byte ptr [esi]
 00025C2C    pop         edi
 00025C2D    or          ebx,ebx
>00025C2F    jne         00025BF7
 00025C31    pop         ebx
 00025C32    pop         edi
 00025C33    pop         esi
 00025C34    ret
*}
end;

//00025C38
procedure TWriter.WriteBinary(WriteData:TStreamProc);
begin
{*
 00025C38    push        ebp
 00025C39    mov         ebp,esp
 00025C3B    add         esp,0FFFFFFF8
 00025C3E    push        ebx
 00025C3F    mov         ebx,eax
 00025C41    mov         dl,1
 00025C43    mov         eax,[0001F5E8];TMemoryStream
 00025C48    call        TObject.Create
 00025C4D    mov         dword ptr [ebp-4],eax
 00025C50    xor         eax,eax
 00025C52    push        ebp
 00025C53    push        25CB0
 00025C58    push        dword ptr fs:[eax]
 00025C5B    mov         dword ptr fs:[eax],esp
 00025C5E    mov         edx,dword ptr [ebp-4]
 00025C61    mov         eax,dword ptr [ebp+0C]
 00025C64    call        dword ptr [ebp+8]
 00025C67    mov         dl,0A
 00025C69    mov         eax,ebx
 00025C6B    call        TWriter.WriteValue
 00025C70    mov         eax,dword ptr [ebp-4]
 00025C73    call        TStream.GetSize
 00025C78    mov         dword ptr [ebp-8],eax
 00025C7B    lea         edx,[ebp-8]
 00025C7E    mov         ecx,4
 00025C83    mov         eax,ebx
 00025C85    call        TWriter.Write
 00025C8A    mov         eax,dword ptr [ebp-4]
 00025C8D    mov         edx,dword ptr [eax+4]
 00025C90    mov         ecx,dword ptr [ebp-8]
 00025C93    mov         eax,ebx
 00025C95    call        TWriter.Write
 00025C9A    xor         eax,eax
 00025C9C    pop         edx
 00025C9D    pop         ecx
 00025C9E    pop         ecx
 00025C9F    mov         dword ptr fs:[eax],edx
 00025CA2    push        25CB7
 00025CA7    mov         eax,dword ptr [ebp-4]
 00025CAA    call        TObject.Free
 00025CAF    ret
>00025CB0    jmp         @HandleFinally
>00025CB5    jmp         00025CA7
 00025CB7    pop         ebx
 00025CB8    pop         ecx
 00025CB9    pop         ecx
 00025CBA    pop         ebp
 00025CBB    ret         8
*}
end;

//00025CC0
procedure TWriter.WriteBuffer;
begin
{*
 00025CC0    push        ebx
 00025CC1    mov         ebx,eax
 00025CC3    mov         edx,dword ptr [ebx+8]
 00025CC6    mov         ecx,dword ptr [ebx+10]
 00025CC9    mov         eax,dword ptr [ebx+4]
 00025CCC    call        TStream.WriteBuffer
 00025CD1    xor         eax,eax
 00025CD3    mov         dword ptr [ebx+10],eax
 00025CD6    pop         ebx
 00025CD7    ret
*}
end;

//00025CD8
procedure TWriter.WriteBoolean(Value:Boolean);
begin
{*
 00025CD8    test        dl,dl
>00025CDA    je          00025CE4
 00025CDC    mov         dl,9
 00025CDE    call        TWriter.WriteValue
 00025CE3    ret
 00025CE4    mov         dl,8
 00025CE6    call        TWriter.WriteValue
 00025CEB    ret
*}
end;

//00025CEC
procedure TWriter.WriteChar(Value:Char);
begin
{*
 00025CEC    push        ebp
 00025CED    mov         ebp,esp
 00025CEF    push        0
 00025CF1    push        ebx
 00025CF2    push        esi
 00025CF3    mov         ebx,edx
 00025CF5    mov         esi,eax
 00025CF7    xor         eax,eax
 00025CF9    push        ebp
 00025CFA    push        25D2F
 00025CFF    push        dword ptr fs:[eax]
 00025D02    mov         dword ptr fs:[eax],esp
 00025D05    lea         eax,[ebp-4]
 00025D08    mov         edx,ebx
 00025D0A    call        @LStrFromChar
 00025D0F    mov         edx,dword ptr [ebp-4]
 00025D12    mov         eax,esi
 00025D14    call        TWriter.WriteString
 00025D19    xor         eax,eax
 00025D1B    pop         edx
 00025D1C    pop         ecx
 00025D1D    pop         ecx
 00025D1E    mov         dword ptr fs:[eax],edx
 00025D21    push        25D36
 00025D26    lea         eax,[ebp-4]
 00025D29    call        @LStrClr
 00025D2E    ret
>00025D2F    jmp         @HandleFinally
>00025D34    jmp         00025D26
 00025D36    pop         esi
 00025D37    pop         ebx
 00025D38    pop         ecx
 00025D39    pop         ebp
 00025D3A    ret
*}
end;

//00025D3C
procedure TWriter.WriteCollection(Value:TCollection);
begin
{*
 00025D3C    push        ebx
 00025D3D    push        esi
 00025D3E    push        edi
 00025D3F    push        ebp
 00025D40    mov         ebp,edx
 00025D42    mov         ebx,eax
 00025D44    mov         dl,0E
 00025D46    mov         eax,ebx
 00025D48    call        TWriter.WriteValue
 00025D4D    mov         eax,ebp
 00025D4F    call        TCollection.GetCount
 00025D54    mov         esi,eax
 00025D56    dec         esi
 00025D57    test        esi,esi
>00025D59    jl          00025D82
 00025D5B    inc         esi
 00025D5C    xor         edi,edi
 00025D5E    mov         eax,ebx
 00025D60    call        TWriter.WriteListBegin
 00025D65    mov         edx,edi
 00025D67    mov         eax,ebp
 00025D69    call        TCollection.GetItem
 00025D6E    mov         edx,eax
 00025D70    mov         eax,ebx
 00025D72    call        TWriter.WriteProperties
 00025D77    mov         eax,ebx
 00025D79    call        TWriter.WriteListEnd
 00025D7E    inc         edi
 00025D7F    dec         esi
>00025D80    jne         00025D5E
 00025D82    mov         eax,ebx
 00025D84    call        TWriter.WriteListEnd
 00025D89    pop         ebp
 00025D8A    pop         edi
 00025D8B    pop         esi
 00025D8C    pop         ebx
 00025D8D    ret
*}
end;

//00025D90
function FindAncestor(const Name:AnsiString):TComponent;
begin
{*
 00025D90    push        ebp
 00025D91    mov         ebp,esp
 00025D93    push        ecx
 00025D94    push        ebx
 00025D95    push        esi
 00025D96    push        edi
 00025D97    mov         dword ptr [ebp-4],eax
 00025D9A    mov         eax,dword ptr [ebp+8]
 00025D9D    mov         eax,dword ptr [eax-4]
 00025DA0    mov         eax,dword ptr [eax+2C]
 00025DA3    mov         ebx,dword ptr [eax+8]
 00025DA6    dec         ebx
 00025DA7    test        ebx,ebx
>00025DA9    jl          00025DD3
 00025DAB    inc         ebx
 00025DAC    xor         edi,edi
 00025DAE    mov         eax,dword ptr [ebp+8]
 00025DB1    mov         eax,dword ptr [eax-4]
 00025DB4    mov         eax,dword ptr [eax+2C]
 00025DB7    mov         edx,edi
 00025DB9    call        TList.Get
 00025DBE    mov         esi,eax
 00025DC0    mov         edx,dword ptr [ebp-4]
 00025DC3    mov         eax,dword ptr [esi+8]
 00025DC6    call        CompareText
 00025DCB    test        eax,eax
>00025DCD    je          00025DD5
 00025DCF    inc         edi
 00025DD0    dec         ebx
>00025DD1    jne         00025DAE
 00025DD3    xor         esi,esi
 00025DD5    mov         eax,esi
 00025DD7    pop         edi
 00025DD8    pop         esi
 00025DD9    pop         ebx
 00025DDA    pop         ecx
 00025DDB    pop         ebp
 00025DDC    ret
*}
end;

//00025DE0
procedure TWriter.WriteComponent(Component:TComponent);
begin
{*
 00025DE0    push        ebp
 00025DE1    mov         ebp,esp
 00025DE3    push        ecx
 00025DE4    push        ebx
 00025DE5    mov         ebx,edx
 00025DE7    mov         dword ptr [ebp-4],eax
 00025DEA    or          byte ptr [ebx+20],4
 00025DEE    mov         eax,dword ptr [ebp-4]
 00025DF1    cmp         dword ptr [eax+2C],0
>00025DF5    je          00025E07
 00025DF7    push        ebp
 00025DF8    mov         eax,dword ptr [ebx+8]
 00025DFB    call        FindAncestor
 00025E00    pop         ecx
 00025E01    mov         edx,dword ptr [ebp-4]
 00025E04    mov         dword ptr [edx+1C],eax
 00025E07    mov         edx,dword ptr [ebp-4]
 00025E0A    mov         eax,ebx
 00025E0C    mov         ecx,dword ptr [eax]
 00025E0E    call        dword ptr [ecx+24]
 00025E11    and         byte ptr [ebx+20],0FB
 00025E15    pop         ebx
 00025E16    pop         ecx
 00025E17    pop         ebp
 00025E18    ret
*}
end;

//00025E1C
procedure TWriter.WriteData(Instance:TComponent);
begin
{*
 00025E1C    push        ebp
 00025E1D    mov         ebp,esp
 00025E1F    add         esp,0FFFFFEDC
 00025E25    push        ebx
 00025E26    xor         ecx,ecx
 00025E28    mov         dword ptr [ebp-124],ecx
 00025E2E    mov         dword ptr [ebp-8],edx
 00025E31    mov         dword ptr [ebp-4],eax
 00025E34    xor         eax,eax
 00025E36    push        ebp
 00025E37    push        260DC
 00025E3C    push        dword ptr fs:[eax]
 00025E3F    mov         dword ptr fs:[eax],esp
 00025E42    lea         edx,[ebp-120]
 00025E48    mov         eax,dword ptr [ebp-8]
 00025E4B    mov         eax,dword ptr [eax]
 00025E4D    call        TObject.ClassName
 00025E52    xor         ebx,ebx
 00025E54    mov         bl,byte ptr [ebp-120]
 00025E5A    mov         eax,dword ptr [ebp-8]
 00025E5D    mov         eax,dword ptr [eax+8]
 00025E60    call        @LStrLen
 00025E65    add         ebx,eax
 00025E67    inc         ebx
 00025E68    add         ebx,5
 00025E6B    add         ebx,3
 00025E6E    mov         eax,dword ptr [ebp-4]
 00025E71    mov         eax,dword ptr [eax+0C]
 00025E74    mov         edx,dword ptr [ebp-4]
 00025E77    sub         eax,dword ptr [edx+10]
 00025E7A    cmp         ebx,eax
>00025E7C    jle         00025E86
 00025E7E    mov         eax,dword ptr [ebp-4]
 00025E81    call        TWriter.WriteBuffer
 00025E86    mov         eax,dword ptr [ebp-4]
 00025E89    call        TWriter.GetPosition
 00025E8E    mov         dword ptr [ebp-0C],eax
 00025E91    mov         al,[000260E8]
 00025E96    mov         byte ptr [ebp-1D],al
 00025E99    mov         eax,dword ptr [ebp-4]
 00025E9C    cmp         dword ptr [eax+1C],0
>00025EA0    je          00025EA6
 00025EA2    or          byte ptr [ebp-1D],1
 00025EA6    mov         eax,dword ptr [ebp-4]
 00025EA9    mov         ebx,dword ptr [eax+2C]
 00025EAC    test        ebx,ebx
>00025EAE    je          00025EE1
 00025EB0    mov         eax,dword ptr [ebp-4]
 00025EB3    mov         eax,dword ptr [eax+30]
 00025EB6    cmp         eax,dword ptr [ebx+8]
>00025EB9    jge         00025EE1
 00025EBB    mov         eax,dword ptr [ebp-4]
 00025EBE    cmp         dword ptr [eax+1C],0
>00025EC2    je          00025EDD
 00025EC4    mov         eax,dword ptr [ebp-4]
 00025EC7    mov         edx,dword ptr [eax+30]
 00025ECA    mov         eax,dword ptr [ebp-4]
 00025ECD    mov         eax,dword ptr [eax+2C]
 00025ED0    call        TList.Get
 00025ED5    mov         edx,dword ptr [ebp-4]
 00025ED8    cmp         eax,dword ptr [edx+1C]
>00025EDB    je          00025EE1
 00025EDD    or          byte ptr [ebp-1D],2
 00025EE1    mov         eax,dword ptr [ebp-4]
 00025EE4    mov         ecx,dword ptr [eax+34]
 00025EE7    mov         dl,byte ptr [ebp-1D]
 00025EEA    mov         eax,dword ptr [ebp-4]
 00025EED    call        TWriter.WritePrefix
 00025EF2    lea         edx,[ebp-120]
 00025EF8    mov         eax,dword ptr [ebp-8]
 00025EFB    mov         eax,dword ptr [eax]
 00025EFD    call        TObject.ClassName
 00025F02    lea         edx,[ebp-120]
 00025F08    lea         eax,[ebp-124]
 00025F0E    call        @LStrFromString
 00025F13    mov         edx,dword ptr [ebp-124]
 00025F19    mov         eax,dword ptr [ebp-4]
 00025F1C    call        TWriter.WriteStr
 00025F21    mov         eax,dword ptr [ebp-8]
 00025F24    mov         edx,dword ptr [eax+8]
 00025F27    mov         eax,dword ptr [ebp-4]
 00025F2A    call        TWriter.WriteStr
 00025F2F    mov         eax,dword ptr [ebp-4]
 00025F32    call        TWriter.GetPosition
 00025F37    mov         dword ptr [ebp-10],eax
 00025F3A    mov         eax,dword ptr [ebp-4]
 00025F3D    mov         eax,dword ptr [eax+2C]
 00025F40    test        eax,eax
>00025F42    je          00025F64
 00025F44    mov         edx,dword ptr [ebp-4]
 00025F47    mov         edx,dword ptr [edx+30]
 00025F4A    cmp         edx,dword ptr [eax+8]
>00025F4D    jge         00025F64
 00025F4F    mov         eax,dword ptr [ebp-4]
 00025F52    cmp         dword ptr [eax+1C],0
>00025F56    je          00025F5E
 00025F58    mov         eax,dword ptr [ebp-4]
 00025F5B    inc         dword ptr [eax+30]
 00025F5E    mov         eax,dword ptr [ebp-4]
 00025F61    inc         dword ptr [eax+34]
 00025F64    mov         edx,dword ptr [ebp-8]
 00025F67    mov         eax,dword ptr [ebp-4]
 00025F6A    call        TWriter.WriteProperties
 00025F6F    mov         eax,dword ptr [ebp-4]
 00025F72    call        TWriter.WriteListEnd
 00025F77    mov         eax,dword ptr [ebp-4]
 00025F7A    mov         eax,dword ptr [eax+2C]
 00025F7D    mov         dword ptr [ebp-14],eax
 00025F80    mov         eax,dword ptr [ebp-4]
 00025F83    mov         eax,dword ptr [eax+30]
 00025F86    mov         dword ptr [ebp-18],eax
 00025F89    mov         eax,dword ptr [ebp-4]
 00025F8C    mov         eax,dword ptr [eax+34]
 00025F8F    mov         dword ptr [ebp-1C],eax
 00025F92    xor         eax,eax
 00025F94    push        ebp
 00025F95    push        26082
 00025F9A    push        dword ptr fs:[eax]
 00025F9D    mov         dword ptr fs:[eax],esp
 00025FA0    mov         eax,dword ptr [ebp-4]
 00025FA3    xor         edx,edx
 00025FA5    mov         dword ptr [eax+2C],edx
 00025FA8    mov         eax,dword ptr [ebp-4]
 00025FAB    xor         edx,edx
 00025FAD    mov         dword ptr [eax+30],edx
 00025FB0    mov         eax,dword ptr [ebp-4]
 00025FB3    xor         edx,edx
 00025FB5    mov         dword ptr [eax+34],edx
 00025FB8    mov         eax,dword ptr [ebp-4]
 00025FBB    cmp         byte ptr [eax+20],0
>00025FBF    jne         00026059
 00025FC5    xor         eax,eax
 00025FC7    push        ebp
 00025FC8    push        26052
 00025FCD    push        dword ptr fs:[eax]
 00025FD0    mov         dword ptr fs:[eax],esp
 00025FD3    mov         eax,dword ptr [ebp-4]
 00025FD6    mov         ebx,dword ptr [eax+1C]
 00025FD9    test        ebx,ebx
>00025FDB    je          0002601E
 00025FDD    mov         eax,ebx
 00025FDF    mov         edx,dword ptr ds:[1FA0C];TComponent
 00025FE5    call        @IsClass
 00025FEA    test        al,al
>00025FEC    je          0002601E
 00025FEE    mov         dl,1
 00025FF0    mov         eax,[0001EEC4];TList
 00025FF5    call        TObject.Create
 00025FFA    mov         edx,dword ptr [ebp-4]
 00025FFD    mov         dword ptr [edx+2C],eax
 00026000    mov         eax,dword ptr [ebp-4]
 00026003    push        eax
 00026004    push        25B3C;TWriter.AddAncestor
 00026009    mov         eax,dword ptr [ebp-4]
 0002600C    mov         edx,dword ptr [eax+24]
 0002600F    mov         eax,dword ptr [ebp-4]
 00026012    mov         eax,dword ptr [eax+1C]
 00026015    mov         bx,0FFFD
 00026019    call        @CallDynaInst
 0002601E    mov         eax,dword ptr [ebp-4]
 00026021    push        eax
 00026022    push        25DE0;TWriter.WriteComponent
 00026027    mov         eax,dword ptr [ebp-4]
 0002602A    mov         edx,dword ptr [eax+18]
 0002602D    mov         eax,dword ptr [ebp-8]
 00026030    mov         bx,0FFFD
 00026034    call        @CallDynaInst
 00026039    xor         eax,eax
 0002603B    pop         edx
 0002603C    pop         ecx
 0002603D    pop         ecx
 0002603E    mov         dword ptr fs:[eax],edx
 00026041    push        26059
 00026046    mov         eax,dword ptr [ebp-4]
 00026049    mov         eax,dword ptr [eax+2C]
 0002604C    call        TObject.Free
 00026051    ret
>00026052    jmp         @HandleFinally
>00026057    jmp         00026046
 00026059    xor         eax,eax
 0002605B    pop         edx
 0002605C    pop         ecx
 0002605D    pop         ecx
 0002605E    mov         dword ptr fs:[eax],edx
 00026061    push        26089
 00026066    mov         eax,dword ptr [ebp-4]
 00026069    mov         edx,dword ptr [ebp-14]
 0002606C    mov         dword ptr [eax+2C],edx
 0002606F    mov         eax,dword ptr [ebp-4]
 00026072    mov         edx,dword ptr [ebp-18]
 00026075    mov         dword ptr [eax+30],edx
 00026078    mov         eax,dword ptr [ebp-4]
 0002607B    mov         edx,dword ptr [ebp-1C]
 0002607E    mov         dword ptr [eax+34],edx
 00026081    ret
>00026082    jmp         @HandleFinally
>00026087    jmp         00026066
 00026089    mov         eax,dword ptr [ebp-4]
 0002608C    call        TWriter.WriteListEnd
 00026091    mov         eax,dword ptr [ebp-4]
 00026094    mov         eax,dword ptr [eax+18]
 00026097    cmp         eax,dword ptr [ebp-8]
>0002609A    je          000260C3
 0002609C    mov         al,[000260EC]
 000260A1    cmp         al,byte ptr [ebp-1D]
>000260A4    jne         000260C3
 000260A6    mov         eax,dword ptr [ebp-4]
 000260A9    call        TWriter.GetPosition
 000260AE    mov         edx,dword ptr [ebp-10]
 000260B1    add         edx,2
 000260B4    cmp         eax,edx
>000260B6    jne         000260C3
 000260B8    mov         edx,dword ptr [ebp-0C]
 000260BB    mov         eax,dword ptr [ebp-4]
 000260BE    call        TWriter.SetPosition
 000260C3    xor         eax,eax
 000260C5    pop         edx
 000260C6    pop         ecx
 000260C7    pop         ecx
 000260C8    mov         dword ptr fs:[eax],edx
 000260CB    push        260E3
 000260D0    lea         eax,[ebp-124]
 000260D6    call        @LStrClr
 000260DB    ret
>000260DC    jmp         @HandleFinally
>000260E1    jmp         000260D0
 000260E3    pop         ebx
 000260E4    mov         esp,ebp
 000260E6    pop         ebp
 000260E7    ret
*}
end;

//000260F0
procedure TWriter.WriteDescendent(Root:TComponent; AAncestor:TComponent);
begin
{*
 000260F0    push        ebx
 000260F1    push        esi
 000260F2    mov         esi,edx
 000260F4    mov         ebx,eax
 000260F6    mov         dword ptr [ebx+24],ecx
 000260F9    mov         dword ptr [ebx+1C],ecx
 000260FC    mov         dword ptr [ebx+18],esi
 000260FF    mov         eax,ebx
 00026101    call        TWriter.WriteSignature
 00026106    mov         edx,esi
 00026108    mov         eax,ebx
 0002610A    call        TWriter.WriteComponent
 0002610F    pop         esi
 00026110    pop         ebx
 00026111    ret
*}
end;

//00026114
procedure TWriter.WriteFloat(const Value:Extended);
begin
{*
 00026114    push        ebp
 00026115    mov         ebp,esp
 00026117    push        ebx
 00026118    mov         ebx,eax
 0002611A    mov         dl,5
 0002611C    mov         eax,ebx
 0002611E    call        TWriter.WriteValue
 00026123    lea         edx,[ebp+8]
 00026126    mov         ecx,0A
 0002612B    mov         eax,ebx
 0002612D    call        TWriter.Write
 00026132    pop         ebx
 00026133    pop         ebp
 00026134    ret         0C
*}
end;

//00026138
procedure TWriter.WriteSingle(const Value:Single);
begin
{*
 00026138    push        ebp
 00026139    mov         ebp,esp
 0002613B    push        ebx
 0002613C    mov         ebx,eax
 0002613E    mov         dl,0F
 00026140    mov         eax,ebx
 00026142    call        TWriter.WriteValue
 00026147    lea         edx,[ebp+8]
 0002614A    mov         ecx,4
 0002614F    mov         eax,ebx
 00026151    call        TWriter.Write
 00026156    pop         ebx
 00026157    pop         ebp
 00026158    ret         4
*}
end;

//0002615C
procedure TWriter.WriteCurrency(const Value:Currency);
begin
{*
 0002615C    push        ebp
 0002615D    mov         ebp,esp
 0002615F    push        ebx
 00026160    mov         ebx,eax
 00026162    mov         dl,10
 00026164    mov         eax,ebx
 00026166    call        TWriter.WriteValue
 0002616B    lea         edx,[ebp+8]
 0002616E    mov         ecx,8
 00026173    mov         eax,ebx
 00026175    call        TWriter.Write
 0002617A    pop         ebx
 0002617B    pop         ebp
 0002617C    ret         8
*}
end;

//00026180
procedure TWriter.WriteDate(const Value:TDateTime);
begin
{*
 00026180    push        ebp
 00026181    mov         ebp,esp
 00026183    push        ebx
 00026184    mov         ebx,eax
 00026186    mov         dl,11
 00026188    mov         eax,ebx
 0002618A    call        TWriter.WriteValue
 0002618F    lea         edx,[ebp+8]
 00026192    mov         ecx,8
 00026197    mov         eax,ebx
 00026199    call        TWriter.Write
 0002619E    pop         ebx
 0002619F    pop         ebp
 000261A0    ret         8
*}
end;

//000261A4
procedure TWriter.WriteIdent(const Ident:AnsiString);
begin
{*
 000261A4    push        ebx
 000261A5    push        esi
 000261A6    mov         esi,edx
 000261A8    mov         ebx,eax
 000261AA    mov         edx,26234;'False'
 000261AF    mov         eax,esi
 000261B1    call        CompareText
 000261B6    test        eax,eax
>000261B8    jne         000261C6
 000261BA    mov         dl,8
 000261BC    mov         eax,ebx
 000261BE    call        TWriter.WriteValue
 000261C3    pop         esi
 000261C4    pop         ebx
 000261C5    ret
 000261C6    mov         edx,26244;'True'
 000261CB    mov         eax,esi
 000261CD    call        CompareText
 000261D2    test        eax,eax
>000261D4    jne         000261E1
 000261D6    mov         dl,9
 000261D8    mov         eax,ebx
 000261DA    call        TWriter.WriteValue
>000261DF    jmp         00026229
 000261E1    mov         edx,26254;'Null'
 000261E6    mov         eax,esi
 000261E8    call        CompareText
 000261ED    test        eax,eax
>000261EF    jne         000261FC
 000261F1    xor         edx,edx
 000261F3    mov         eax,ebx
 000261F5    call        TWriter.WriteValue
>000261FA    jmp         00026229
 000261FC    mov         edx,26264;'nil'
 00026201    mov         eax,esi
 00026203    call        CompareText
 00026208    test        eax,eax
>0002620A    jne         00026217
 0002620C    mov         dl,0D
 0002620E    mov         eax,ebx
 00026210    call        TWriter.WriteValue
>00026215    jmp         00026229
 00026217    mov         dl,7
 00026219    mov         eax,ebx
 0002621B    call        TWriter.WriteValue
 00026220    mov         edx,esi
 00026222    mov         eax,ebx
 00026224    call        TWriter.WriteStr
 00026229    pop         esi
 0002622A    pop         ebx
 0002622B    ret
*}
end;

//00026268
procedure TWriter.WriteInteger(Value:Longint);
begin
{*
 00026268    push        ebx
 00026269    push        ecx
 0002626A    mov         dword ptr [esp],edx
 0002626D    mov         ebx,eax
 0002626F    cmp         dword ptr [esp],0FFFFFF80
>00026273    jl          00026295
 00026275    cmp         dword ptr [esp],7F
>00026279    jg          00026295
 0002627B    mov         dl,2
 0002627D    mov         eax,ebx
 0002627F    call        TWriter.WriteValue
 00026284    mov         edx,esp
 00026286    mov         ecx,1
 0002628B    mov         eax,ebx
 0002628D    call        TWriter.Write
 00026292    pop         edx
 00026293    pop         ebx
 00026294    ret
 00026295    cmp         dword ptr [esp],0FFFF8000
>0002629C    jl          000262C0
 0002629E    cmp         dword ptr [esp],7FFF
>000262A5    jg          000262C0
 000262A7    mov         dl,3
 000262A9    mov         eax,ebx
 000262AB    call        TWriter.WriteValue
 000262B0    mov         edx,esp
 000262B2    mov         ecx,2
 000262B7    mov         eax,ebx
 000262B9    call        TWriter.Write
>000262BE    jmp         000262D7
 000262C0    mov         dl,4
 000262C2    mov         eax,ebx
 000262C4    call        TWriter.WriteValue
 000262C9    mov         edx,esp
 000262CB    mov         ecx,4
 000262D0    mov         eax,ebx
 000262D2    call        TWriter.Write
 000262D7    pop         edx
 000262D8    pop         ebx
 000262D9    ret
*}
end;

//000262DC
procedure TWriter.WriteListBegin;
begin
{*
 000262DC    mov         dl,1
 000262DE    call        TWriter.WriteValue
 000262E3    ret
*}
end;

//000262E4
procedure TWriter.WriteListEnd;
begin
{*
 000262E4    xor         edx,edx
 000262E6    call        TWriter.WriteValue
 000262EB    ret
*}
end;

//000262EC
procedure TWriter.WritePrefix(Flags:TFilerFlags; AChildPos:Integer);
begin
{*
 000262EC    push        ebx
 000262ED    push        esi
 000262EE    push        ecx
 000262EF    mov         esi,ecx
 000262F1    mov         byte ptr [esp],dl
 000262F4    mov         ebx,eax
 000262F6    mov         al,[0002632C]
 000262FB    cmp         al,byte ptr [esp]
>000262FE    je          00026328
 00026300    mov         al,byte ptr [esp]
 00026303    or          al,0F0
 00026305    mov         byte ptr [esp+1],al
 00026309    lea         edx,[esp+1]
 0002630D    mov         ecx,1
 00026312    mov         eax,ebx
 00026314    call        TWriter.Write
 00026319    test        byte ptr [esp],2
>0002631D    je          00026328
 0002631F    mov         edx,esi
 00026321    mov         eax,ebx
 00026323    call        TWriter.WriteInteger
 00026328    pop         edx
 00026329    pop         esi
 0002632A    pop         ebx
 0002632B    ret
*}
end;

//00026330
procedure TWriter.WriteProperties(Instance:TPersistent);
begin
{*
 00026330    push        ebp
 00026331    mov         ebp,esp
 00026333    add         esp,0FFFFFFF0
 00026336    push        ebx
 00026337    push        esi
 00026338    push        edi
 00026339    mov         dword ptr [ebp-8],edx
 0002633C    mov         dword ptr [ebp-4],eax
 0002633F    mov         eax,dword ptr [ebp-8]
 00026342    mov         eax,dword ptr [eax]
 00026344    call        TObject.ClassInfo
 00026349    call        GetTypeData
 0002634E    movsx       eax,word ptr [eax+8]
 00026352    mov         dword ptr [ebp-0C],eax
 00026355    cmp         dword ptr [ebp-0C],0
>00026359    jle         000263E4
 0002635F    mov         eax,dword ptr [ebp-0C]
 00026362    shl         eax,2
 00026365    call        @GetMem
 0002636A    mov         dword ptr [ebp-10],eax
 0002636D    xor         eax,eax
 0002636F    push        ebp
 00026370    push        263DD
 00026375    push        dword ptr fs:[eax]
 00026378    mov         dword ptr fs:[eax],esp
 0002637B    mov         eax,dword ptr [ebp-8]
 0002637E    mov         eax,dword ptr [eax]
 00026380    call        TObject.ClassInfo
 00026385    mov         edx,dword ptr [ebp-10]
 00026388    call        GetPropInfos
 0002638D    mov         esi,dword ptr [ebp-0C]
 00026390    dec         esi
 00026391    test        esi,esi
>00026393    jl          000263C1
 00026395    inc         esi
 00026396    xor         edi,edi
 00026398    mov         eax,dword ptr [ebp-10]
 0002639B    mov         ebx,dword ptr [eax+edi*4]
 0002639E    test        ebx,ebx
>000263A0    je          000263C1
 000263A2    mov         edx,ebx
 000263A4    mov         eax,dword ptr [ebp-8]
 000263A7    call        IsStoredProp
 000263AC    test        al,al
>000263AE    je          000263BD
 000263B0    mov         ecx,ebx
 000263B2    mov         edx,dword ptr [ebp-8]
 000263B5    mov         eax,dword ptr [ebp-4]
 000263B8    call        TWriter.WriteProperty
 000263BD    inc         edi
 000263BE    dec         esi
>000263BF    jne         00026398
 000263C1    xor         eax,eax
 000263C3    pop         edx
 000263C4    pop         ecx
 000263C5    pop         ecx
 000263C6    mov         dword ptr fs:[eax],edx
 000263C9    push        263E4
 000263CE    mov         edx,dword ptr [ebp-0C]
 000263D1    shl         edx,2
 000263D4    mov         eax,dword ptr [ebp-10]
 000263D7    call        @FreeMem
 000263DC    ret
>000263DD    jmp         @HandleFinally
>000263E2    jmp         000263CE
 000263E4    mov         edx,dword ptr [ebp-4]
 000263E7    mov         eax,dword ptr [ebp-8]
 000263EA    mov         ecx,dword ptr [eax]
 000263EC    call        dword ptr [ecx+4]
 000263EF    pop         edi
 000263F0    pop         esi
 000263F1    pop         ebx
 000263F2    mov         esp,ebp
 000263F4    pop         ebp
 000263F5    ret
*}
end;

//000263F8
function AncestorValid:Boolean;
begin
{*
 000263F8    push        ebp
 000263F9    mov         ebp,esp
 000263FB    push        ebx
 000263FC    mov         eax,dword ptr [ebp+8]
 000263FF    mov         eax,dword ptr [eax-4]
 00026402    cmp         dword ptr [eax+1C],0
>00026406    je          00026438
 00026408    mov         eax,dword ptr [ebp+8]
 0002640B    mov         eax,dword ptr [eax-8]
 0002640E    call        TObject.ClassType
 00026413    mov         ebx,eax
 00026415    mov         eax,dword ptr [ebp+8]
 00026418    mov         eax,dword ptr [eax-4]
 0002641B    mov         eax,dword ptr [eax+1C]
 0002641E    call        TObject.ClassType
 00026423    cmp         ebx,eax
>00026425    je          0002643D
 00026427    mov         eax,dword ptr [ebp+8]
 0002642A    mov         eax,dword ptr [eax-8]
 0002642D    mov         edx,dword ptr [ebp+8]
 00026430    mov         edx,dword ptr [edx-4]
 00026433    cmp         eax,dword ptr [edx+18]
>00026436    je          0002643D
 00026438    xor         eax,eax
 0002643A    pop         ebx
 0002643B    pop         ebp
 0002643C    ret
 0002643D    mov         al,1
 0002643F    pop         ebx
 00026440    pop         ebp
 00026441    ret
*}
end;

//00026444
procedure WritePropPath;
begin
{*
 00026444    push        ebp
 00026445    mov         ebp,esp
 00026447    push        0
 00026449    xor         eax,eax
 0002644B    push        ebp
 0002644C    push        2648C
 00026451    push        dword ptr fs:[eax]
 00026454    mov         dword ptr fs:[eax],esp
 00026457    lea         eax,[ebp-4]
 0002645A    mov         edx,dword ptr [ebp+8]
 0002645D    mov         edx,dword ptr [edx-0C]
 00026460    add         edx,1A
 00026463    call        @LStrFromString
 00026468    mov         edx,dword ptr [ebp-4]
 0002646B    mov         eax,dword ptr [ebp+8]
 0002646E    mov         eax,dword ptr [eax-4]
 00026471    call        TWriter.WritePropName
 00026476    xor         eax,eax
 00026478    pop         edx
 00026479    pop         ecx
 0002647A    pop         ecx
 0002647B    mov         dword ptr fs:[eax],edx
 0002647E    push        26493
 00026483    lea         eax,[ebp-4]
 00026486    call        @LStrClr
 0002648B    ret
>0002648C    jmp         @HandleFinally
>00026491    jmp         00026483
 00026493    pop         ecx
 00026494    pop         ebp
 00026495    ret
*}
end;

//00026498
procedure WriteSet(Value:Longint);
begin
{*
 00026498    push        ebp
 00026499    mov         ebp,esp
 0002649B    push        0
 0002649D    push        ebx
 0002649E    push        esi
 0002649F    push        edi
 000264A0    mov         esi,eax
 000264A2    xor         eax,eax
 000264A4    push        ebp
 000264A5    push        2651E
 000264AA    push        dword ptr fs:[eax]
 000264AD    mov         dword ptr fs:[eax],esp
 000264B0    mov         eax,dword ptr [ebp+8]
 000264B3    mov         eax,dword ptr [eax-10]
 000264B6    call        GetTypeData
 000264BB    mov         eax,dword ptr [eax+1]
 000264BE    mov         edi,dword ptr [eax]
 000264C0    mov         eax,dword ptr [ebp+8]
 000264C3    mov         eax,dword ptr [eax-4]
 000264C6    mov         dl,0B
 000264C8    call        TWriter.WriteValue
 000264CD    xor         ebx,ebx
 000264CF    mov         eax,ebx
 000264D1    cmp         eax,1F
>000264D4    ja          000264D9
 000264D6    bt          esi,eax
>000264D9    jae         000264F5
 000264DB    lea         ecx,[ebp-4]
 000264DE    mov         edx,ebx
 000264E0    mov         eax,edi
 000264E2    call        GetEnumName
 000264E7    mov         edx,dword ptr [ebp-4]
 000264EA    mov         eax,dword ptr [ebp+8]
 000264ED    mov         eax,dword ptr [eax-4]
 000264F0    call        TWriter.WriteStr
 000264F5    inc         ebx
 000264F6    cmp         ebx,20
>000264F9    jne         000264CF
 000264FB    mov         eax,dword ptr [ebp+8]
 000264FE    mov         eax,dword ptr [eax-4]
 00026501    xor         edx,edx
 00026503    call        TWriter.WriteStr
 00026508    xor         eax,eax
 0002650A    pop         edx
 0002650B    pop         ecx
 0002650C    pop         ecx
 0002650D    mov         dword ptr fs:[eax],edx
 00026510    push        26525
 00026515    lea         eax,[ebp-4]
 00026518    call        @LStrClr
 0002651D    ret
>0002651E    jmp         @HandleFinally
>00026523    jmp         00026515
 00026525    pop         edi
 00026526    pop         esi
 00026527    pop         ebx
 00026528    pop         ecx
 00026529    pop         ebp
 0002652A    ret
*}
end;

//0002652C
procedure WriteIntProp(IntType:PTypeInfo; Value:Longint);
begin
{*
 0002652C    push        ebp
 0002652D    mov         ebp,esp
 0002652F    add         esp,0FFFFFFF0
 00026532    push        ebx
 00026533    push        esi
 00026534    push        edi
 00026535    xor         ecx,ecx
 00026537    mov         dword ptr [ebp-0C],ecx
 0002653A    mov         dword ptr [ebp-8],edx
 0002653D    mov         dword ptr [ebp-4],eax
 00026540    xor         eax,eax
 00026542    push        ebp
 00026543    push        265F4
 00026548    push        dword ptr fs:[eax]
 0002654B    mov         dword ptr fs:[eax],esp
 0002654E    mov         eax,[000B6628]
 00026553    call        TThreadList.LockList
 00026558    mov         dword ptr [ebp-10],eax
 0002655B    xor         eax,eax
 0002655D    push        ebp
 0002655E    push        265C9
 00026563    push        dword ptr fs:[eax]
 00026566    mov         dword ptr fs:[eax],esp
 00026569    mov         eax,dword ptr [ebp-10]
 0002656C    mov         esi,dword ptr [eax+8]
 0002656F    dec         esi
 00026570    test        esi,esi
>00026572    jl          000265B1
 00026574    inc         esi
 00026575    xor         edi,edi
 00026577    mov         edx,edi
 00026579    mov         eax,dword ptr [ebp-10]
 0002657C    call        TList.Get
 00026581    mov         ebx,eax
 00026583    mov         eax,dword ptr [ebx+4]
 00026586    cmp         eax,dword ptr [ebp-4]
>00026589    jne         000265AD
 0002658B    lea         edx,[ebp-0C]
 0002658E    mov         eax,dword ptr [ebp-8]
 00026591    call        dword ptr [ebx+0C]
 00026594    test        al,al
>00026596    je          000265B1
 00026598    mov         eax,dword ptr [ebp+8]
 0002659B    mov         eax,dword ptr [eax-4]
 0002659E    mov         edx,dword ptr [ebp-0C]
 000265A1    call        TWriter.WriteIdent
 000265A6    call        @TryFinallyExit
>000265AB    jmp         000265DE
 000265AD    inc         edi
 000265AE    dec         esi
>000265AF    jne         00026577
 000265B1    xor         eax,eax
 000265B3    pop         edx
 000265B4    pop         ecx
 000265B5    pop         ecx
 000265B6    mov         dword ptr fs:[eax],edx
 000265B9    push        265D0
 000265BE    mov         eax,[000B6628]
 000265C3    call        TThreadList.UnlockList
 000265C8    ret
>000265C9    jmp         @HandleFinally
>000265CE    jmp         000265BE
 000265D0    mov         eax,dword ptr [ebp+8]
 000265D3    mov         eax,dword ptr [eax-4]
 000265D6    mov         edx,dword ptr [ebp-8]
 000265D9    call        TWriter.WriteInteger
 000265DE    xor         eax,eax
 000265E0    pop         edx
 000265E1    pop         ecx
 000265E2    pop         ecx
 000265E3    mov         dword ptr fs:[eax],edx
 000265E6    push        265FB
 000265EB    lea         eax,[ebp-0C]
 000265EE    call        @LStrClr
 000265F3    ret
>000265F4    jmp         @HandleFinally
>000265F9    jmp         000265EB
 000265FB    pop         edi
 000265FC    pop         esi
 000265FD    pop         ebx
 000265FE    mov         esp,ebp
 00026600    pop         ebp
 00026601    ret
*}
end;

//00026604
procedure WriteCollectionProp(Collection:TCollection);
begin
{*
 00026604    push        ebp
 00026605    mov         ebp,esp
 00026607    push        0
 00026609    push        ebx
 0002660A    mov         ebx,eax
 0002660C    xor         eax,eax
 0002660E    push        ebp
 0002660F    push        2669A
 00026614    push        dword ptr fs:[eax]
 00026617    mov         dword ptr fs:[eax],esp
 0002661A    mov         eax,dword ptr [ebp+8]
 0002661D    push        eax
 0002661E    call        WritePropPath
 00026623    pop         ecx
 00026624    lea         eax,[ebp-4]
 00026627    mov         edx,dword ptr [ebp+8]
 0002662A    mov         edx,dword ptr [edx-4]
 0002662D    mov         edx,dword ptr [edx+28]
 00026630    call        @LStrLAsg
 00026635    xor         eax,eax
 00026637    push        ebp
 00026638    push        2667D
 0002663D    push        dword ptr fs:[eax]
 00026640    mov         dword ptr fs:[eax],esp
 00026643    mov         eax,dword ptr [ebp+8]
 00026646    mov         eax,dword ptr [eax-4]
 00026649    add         eax,28
 0002664C    call        @LStrClr
 00026651    mov         eax,dword ptr [ebp+8]
 00026654    mov         eax,dword ptr [eax-4]
 00026657    mov         edx,ebx
 00026659    call        TWriter.WriteCollection
 0002665E    xor         eax,eax
 00026660    pop         edx
 00026661    pop         ecx
 00026662    pop         ecx
 00026663    mov         dword ptr fs:[eax],edx
 00026666    push        26684
 0002666B    mov         eax,dword ptr [ebp+8]
 0002666E    mov         eax,dword ptr [eax-4]
 00026671    add         eax,28
 00026674    mov         edx,dword ptr [ebp-4]
 00026677    call        @LStrAsg
 0002667C    ret
>0002667D    jmp         @HandleFinally
>00026682    jmp         0002666B
 00026684    xor         eax,eax
 00026686    pop         edx
 00026687    pop         ecx
 00026688    pop         ecx
 00026689    mov         dword ptr fs:[eax],edx
 0002668C    push        266A1
 00026691    lea         eax,[ebp-4]
 00026694    call        @LStrClr
 00026699    ret
>0002669A    jmp         @HandleFinally
>0002669F    jmp         00026691
 000266A1    pop         ebx
 000266A2    pop         ecx
 000266A3    pop         ebp
 000266A4    ret
*}
end;

//000266A8
function IsDefaultValue:Boolean;
begin
{*
 000266A8    push        ebp
 000266A9    mov         ebp,esp
 000266AB    mov         eax,dword ptr [ebp+8]
 000266AE    mov         eax,dword ptr [eax+8]
 000266B1    push        eax
 000266B2    call        AncestorValid
 000266B7    pop         ecx
 000266B8    test        al,al
>000266BA    je          000266E1
 000266BC    mov         eax,dword ptr [ebp+8]
 000266BF    mov         eax,dword ptr [eax+8]
 000266C2    mov         edx,dword ptr [eax-0C]
 000266C5    mov         eax,dword ptr [ebp+8]
 000266C8    mov         eax,dword ptr [eax+8]
 000266CB    mov         eax,dword ptr [eax-4]
 000266CE    mov         eax,dword ptr [eax+1C]
 000266D1    call        GetOrdProp
 000266D6    mov         edx,dword ptr [ebp+8]
 000266D9    cmp         eax,dword ptr [edx-4]
 000266DC    sete        al
 000266DF    pop         ebp
 000266E0    ret
 000266E1    mov         eax,dword ptr [ebp+8]
 000266E4    mov         eax,dword ptr [eax-4]
 000266E7    mov         edx,dword ptr [ebp+8]
 000266EA    mov         edx,dword ptr [edx+8]
 000266ED    mov         edx,dword ptr [edx-0C]
 000266F0    cmp         eax,dword ptr [edx+14]
 000266F3    sete        al
 000266F6    pop         ebp
 000266F7    ret
*}
end;

//000266F8
procedure WriteOrdProp;
begin
{*
 000266F8    push        ebp
 000266F9    mov         ebp,esp
 000266FB    add         esp,0FFFFFFF8
 000266FE    xor         eax,eax
 00026700    mov         dword ptr [ebp-8],eax
 00026703    xor         eax,eax
 00026705    push        ebp
 00026706    push        267C1
 0002670B    push        dword ptr fs:[eax]
 0002670E    mov         dword ptr fs:[eax],esp
 00026711    mov         eax,dword ptr [ebp+8]
 00026714    mov         edx,dword ptr [eax-0C]
 00026717    mov         eax,dword ptr [ebp+8]
 0002671A    mov         eax,dword ptr [eax-8]
 0002671D    call        GetOrdProp
 00026722    mov         dword ptr [ebp-4],eax
 00026725    push        ebp
 00026726    call        IsDefaultValue
 0002672B    pop         ecx
 0002672C    test        al,al
>0002672E    jne         000267AB
 00026730    mov         eax,dword ptr [ebp+8]
 00026733    push        eax
 00026734    call        WritePropPath
 00026739    pop         ecx
 0002673A    mov         eax,dword ptr [ebp+8]
 0002673D    mov         eax,dword ptr [eax-10]
 00026740    mov         al,byte ptr [eax]
 00026742    dec         al
>00026744    je          00026754
 00026746    dec         al
>00026748    je          0002676D
 0002674A    dec         al
>0002674C    je          0002678C
 0002674E    sub         al,3
>00026750    je          0002677D
>00026752    jmp         000267AB
 00026754    mov         eax,dword ptr [ebp+8]
 00026757    push        eax
 00026758    mov         eax,dword ptr [ebp+8]
 0002675B    mov         eax,dword ptr [eax-0C]
 0002675E    mov         eax,dword ptr [eax]
 00026760    mov         eax,dword ptr [eax]
 00026762    mov         edx,dword ptr [ebp-4]
 00026765    call        WriteIntProp
 0002676A    pop         ecx
>0002676B    jmp         000267AB
 0002676D    mov         edx,dword ptr [ebp-4]
 00026770    mov         eax,dword ptr [ebp+8]
 00026773    mov         eax,dword ptr [eax-4]
 00026776    call        TWriter.WriteChar
>0002677B    jmp         000267AB
 0002677D    mov         eax,dword ptr [ebp+8]
 00026780    push        eax
 00026781    mov         eax,dword ptr [ebp-4]
 00026784    call        WriteSet
 00026789    pop         ecx
>0002678A    jmp         000267AB
 0002678C    lea         ecx,[ebp-8]
 0002678F    mov         eax,dword ptr [ebp+8]
 00026792    mov         eax,dword ptr [eax-10]
 00026795    mov         edx,dword ptr [ebp-4]
 00026798    call        GetEnumName
 0002679D    mov         edx,dword ptr [ebp-8]
 000267A0    mov         eax,dword ptr [ebp+8]
 000267A3    mov         eax,dword ptr [eax-4]
 000267A6    call        TWriter.WriteIdent
 000267AB    xor         eax,eax
 000267AD    pop         edx
 000267AE    pop         ecx
 000267AF    pop         ecx
 000267B0    mov         dword ptr fs:[eax],edx
 000267B3    push        267C8
 000267B8    lea         eax,[ebp-8]
 000267BB    call        @LStrClr
 000267C0    ret
>000267C1    jmp         @HandleFinally
>000267C6    jmp         000267B8
 000267C8    pop         ecx
 000267C9    pop         ecx
 000267CA    pop         ebp
 000267CB    ret
*}
end;

//000267CC
function IsDefaultValue:Boolean;
begin
{*
 000267CC    push        ebp
 000267CD    mov         ebp,esp
 000267CF    mov         eax,dword ptr [ebp+8]
 000267D2    mov         eax,dword ptr [eax+8]
 000267D5    push        eax
 000267D6    call        AncestorValid
 000267DB    pop         ecx
 000267DC    test        al,al
>000267DE    je          0002680A
 000267E0    mov         eax,dword ptr [ebp+8]
 000267E3    mov         eax,dword ptr [eax+8]
 000267E6    mov         edx,dword ptr [eax-0C]
 000267E9    mov         eax,dword ptr [ebp+8]
 000267EC    mov         eax,dword ptr [eax+8]
 000267EF    mov         eax,dword ptr [eax-4]
 000267F2    mov         eax,dword ptr [eax+1C]
 000267F5    call        GetFloatProp
 000267FA    mov         eax,dword ptr [ebp+8]
 000267FD    fld         tbyte ptr [eax-0A]
 00026800    fcompp
 00026802    fnstsw      al
 00026804    sahf
 00026805    sete        al
 00026808    pop         ebp
 00026809    ret
 0002680A    mov         eax,dword ptr [ebp+8]
 0002680D    fld         tbyte ptr [eax-0A]
 00026810    fcomp       dword ptr ds:[26820]
 00026816    fnstsw      al
 00026818    sahf
 00026819    sete        al
 0002681C    pop         ebp
 0002681D    ret
*}
end;

//00026824
procedure WriteFloatProp;
begin
{*
 00026824    push        ebp
 00026825    mov         ebp,esp
 00026827    add         esp,0FFFFFFF4
 0002682A    mov         eax,dword ptr [ebp+8]
 0002682D    mov         edx,dword ptr [eax-0C]
 00026830    mov         eax,dword ptr [ebp+8]
 00026833    mov         eax,dword ptr [eax-8]
 00026836    call        GetFloatProp
 0002683B    fstp        tbyte ptr [ebp-0A]
 0002683E    wait
 0002683F    push        ebp
 00026840    call        IsDefaultValue
 00026845    pop         ecx
 00026846    test        al,al
>00026848    jne         0002686A
 0002684A    mov         eax,dword ptr [ebp+8]
 0002684D    push        eax
 0002684E    call        WritePropPath
 00026853    pop         ecx
 00026854    mov         ax,word ptr [ebp-2]
 00026858    push        eax
 00026859    push        dword ptr [ebp-6]
 0002685C    push        dword ptr [ebp-0A]
 0002685F    mov         eax,dword ptr [ebp+8]
 00026862    mov         eax,dword ptr [eax-4]
 00026865    call        TWriter.WriteFloat
 0002686A    mov         esp,ebp
 0002686C    pop         ebp
 0002686D    ret
*}
end;

//00026870
function IsDefault:Boolean;
begin
{*
 00026870    push        ebp
 00026871    mov         ebp,esp
 00026873    push        0
 00026875    push        ebx
 00026876    xor         eax,eax
 00026878    push        ebp
 00026879    push        268E5
 0002687E    push        dword ptr fs:[eax]
 00026881    mov         dword ptr fs:[eax],esp
 00026884    mov         eax,dword ptr [ebp+8]
 00026887    mov         eax,dword ptr [eax+8]
 0002688A    push        eax
 0002688B    call        AncestorValid
 00026890    pop         ecx
 00026891    test        al,al
>00026893    je          000268C5
 00026895    lea         ecx,[ebp-4]
 00026898    mov         eax,dword ptr [ebp+8]
 0002689B    mov         eax,dword ptr [eax+8]
 0002689E    mov         edx,dword ptr [eax-0C]
 000268A1    mov         eax,dword ptr [ebp+8]
 000268A4    mov         eax,dword ptr [eax+8]
 000268A7    mov         eax,dword ptr [eax-4]
 000268AA    mov         eax,dword ptr [eax+1C]
 000268AD    call        GetStrProp
 000268B2    mov         edx,dword ptr [ebp-4]
 000268B5    mov         eax,dword ptr [ebp+8]
 000268B8    mov         eax,dword ptr [eax-4]
 000268BB    call        @LStrCmp
 000268C0    sete        bl
>000268C3    jmp         000268CF
 000268C5    mov         eax,dword ptr [ebp+8]
 000268C8    cmp         dword ptr [eax-4],0
 000268CC    sete        bl
 000268CF    xor         eax,eax
 000268D1    pop         edx
 000268D2    pop         ecx
 000268D3    pop         ecx
 000268D4    mov         dword ptr fs:[eax],edx
 000268D7    push        268EC
 000268DC    lea         eax,[ebp-4]
 000268DF    call        @LStrClr
 000268E4    ret
>000268E5    jmp         @HandleFinally
>000268EA    jmp         000268DC
 000268EC    mov         eax,ebx
 000268EE    pop         ebx
 000268EF    pop         ecx
 000268F0    pop         ebp
 000268F1    ret
*}
end;

//000268F4
procedure WriteStrProp;
begin
{*
 000268F4    push        ebp
 000268F5    mov         ebp,esp
 000268F7    push        0
 000268F9    xor         eax,eax
 000268FB    push        ebp
 000268FC    push        26954
 00026901    push        dword ptr fs:[eax]
 00026904    mov         dword ptr fs:[eax],esp
 00026907    lea         ecx,[ebp-4]
 0002690A    mov         eax,dword ptr [ebp+8]
 0002690D    mov         edx,dword ptr [eax-0C]
 00026910    mov         eax,dword ptr [ebp+8]
 00026913    mov         eax,dword ptr [eax-8]
 00026916    call        GetStrProp
 0002691B    push        ebp
 0002691C    call        IsDefault
 00026921    pop         ecx
 00026922    test        al,al
>00026924    jne         0002693E
 00026926    mov         eax,dword ptr [ebp+8]
 00026929    push        eax
 0002692A    call        WritePropPath
 0002692F    pop         ecx
 00026930    mov         eax,dword ptr [ebp+8]
 00026933    mov         eax,dword ptr [eax-4]
 00026936    mov         edx,dword ptr [ebp-4]
 00026939    call        TWriter.WriteString
 0002693E    xor         eax,eax
 00026940    pop         edx
 00026941    pop         ecx
 00026942    pop         ecx
 00026943    mov         dword ptr fs:[eax],edx
 00026946    push        2695B
 0002694B    lea         eax,[ebp-4]
 0002694E    call        @LStrClr
 00026953    ret
>00026954    jmp         @HandleFinally
>00026959    jmp         0002694B
 0002695B    pop         ecx
 0002695C    pop         ebp
 0002695D    ret
*}
end;

//00026960
function IsDefault:Boolean;
begin
{*
 00026960    push        ebp
 00026961    mov         ebp,esp
 00026963    push        ebx
 00026964    xor         ebx,ebx
 00026966    mov         eax,dword ptr [ebp+8]
 00026969    mov         eax,dword ptr [eax+8]
 0002696C    push        eax
 0002696D    call        AncestorValid
 00026972    pop         ecx
 00026973    test        al,al
>00026975    je          000269E3
 00026977    mov         eax,dword ptr [ebp+8]
 0002697A    mov         eax,dword ptr [eax+8]
 0002697D    mov         edx,dword ptr [eax-0C]
 00026980    mov         eax,dword ptr [ebp+8]
 00026983    mov         eax,dword ptr [eax+8]
 00026986    mov         eax,dword ptr [eax-4]
 00026989    mov         eax,dword ptr [eax+1C]
 0002698C    call        GetOrdProp
 00026991    mov         ebx,eax
 00026993    test        ebx,ebx
>00026995    je          000269E3
 00026997    mov         eax,dword ptr [ebx+4]
 0002699A    mov         edx,dword ptr [ebp+8]
 0002699D    mov         edx,dword ptr [edx+8]
 000269A0    mov         edx,dword ptr [edx-4]
 000269A3    cmp         eax,dword ptr [edx+24]
>000269A6    jne         000269E3
 000269A8    mov         eax,dword ptr [ebp+8]
 000269AB    cmp         dword ptr [eax-4],0
>000269AF    je          000269E3
 000269B1    mov         eax,dword ptr [ebp+8]
 000269B4    mov         eax,dword ptr [eax-4]
 000269B7    mov         eax,dword ptr [eax+4]
 000269BA    mov         edx,dword ptr [ebp+8]
 000269BD    mov         edx,dword ptr [edx+8]
 000269C0    mov         edx,dword ptr [edx-4]
 000269C3    cmp         eax,dword ptr [edx+18]
>000269C6    jne         000269E3
 000269C8    mov         eax,dword ptr [ebp+8]
 000269CB    mov         eax,dword ptr [eax-4]
 000269CE    mov         edx,dword ptr [eax+8]
 000269D1    mov         eax,dword ptr [ebx+8]
 000269D4    call        CompareText
 000269D9    test        eax,eax
>000269DB    jne         000269E3
 000269DD    mov         eax,dword ptr [ebp+8]
 000269E0    mov         ebx,dword ptr [eax-4]
 000269E3    mov         eax,dword ptr [ebp+8]
 000269E6    cmp         ebx,dword ptr [eax-4]
 000269E9    sete        al
 000269EC    pop         ebx
 000269ED    pop         ebp
 000269EE    ret
*}
end;

//000269F0
function GetComponentValue(Component:TComponent):AnsiString;
begin
{*
 000269F0    push        ebp
 000269F1    mov         ebp,esp
 000269F3    push        ebx
 000269F4    push        esi
 000269F5    push        edi
 000269F6    mov         esi,edx
 000269F8    mov         ebx,eax
 000269FA    mov         eax,dword ptr [ebp+8]
 000269FD    mov         eax,dword ptr [eax+8]
 00026A00    mov         eax,dword ptr [eax-4]
 00026A03    mov         eax,dword ptr [eax+18]
 00026A06    mov         edi,dword ptr [ebx+4]
 00026A09    cmp         eax,edi
>00026A0B    jne         00026A19
 00026A0D    mov         eax,esi
 00026A0F    mov         edx,dword ptr [ebx+8]
 00026A12    call        @LStrLAsg
>00026A17    jmp         00026A5D
 00026A19    mov         edx,dword ptr [ebp+8]
 00026A1C    mov         edx,dword ptr [edx+8]
 00026A1F    cmp         eax,ebx
>00026A21    jne         00026A31
 00026A23    mov         eax,esi
 00026A25    mov         edx,26A6C;'Owner'
 00026A2A    call        @LStrLAsg
>00026A2F    jmp         00026A5D
 00026A31    test        edi,edi
>00026A33    je          00026A4E
 00026A35    push        dword ptr [edi+8]
 00026A38    push        26A7C;'.'
 00026A3D    push        dword ptr [ebx+8]
 00026A40    mov         eax,esi
 00026A42    mov         edx,3
 00026A47    call        @LStrCatN
>00026A4C    jmp         00026A5D
 00026A4E    mov         eax,esi
 00026A50    mov         ecx,26A88;'.Owner'
 00026A55    mov         edx,dword ptr [ebx+8]
 00026A58    call        @LStrCat3
 00026A5D    pop         edi
 00026A5E    pop         esi
 00026A5F    pop         ebx
 00026A60    pop         ebp
 00026A61    ret
*}
end;

//00026A90
procedure WriteObjectProp;
begin
{*
 00026A90    push        ebp
 00026A91    mov         ebp,esp
 00026A93    xor         ecx,ecx
 00026A95    push        ecx
 00026A96    push        ecx
 00026A97    push        ecx
 00026A98    push        ecx
 00026A99    push        ecx
 00026A9A    xor         eax,eax
 00026A9C    push        ebp
 00026A9D    push        26C9D
 00026AA2    push        dword ptr fs:[eax]
 00026AA5    mov         dword ptr fs:[eax],esp
 00026AA8    mov         eax,dword ptr [ebp+8]
 00026AAB    mov         edx,dword ptr [eax-0C]
 00026AAE    mov         eax,dword ptr [ebp+8]
 00026AB1    mov         eax,dword ptr [eax-8]
 00026AB4    call        GetOrdProp
 00026AB9    mov         dword ptr [ebp-4],eax
 00026ABC    cmp         dword ptr [ebp-4],0
>00026AC0    jne         00026AE9
 00026AC2    push        ebp
 00026AC3    call        IsDefault
 00026AC8    pop         ecx
 00026AC9    test        al,al
>00026ACB    jne         00026AE9
 00026ACD    mov         eax,dword ptr [ebp+8]
 00026AD0    push        eax
 00026AD1    call        WritePropPath
 00026AD6    pop         ecx
 00026AD7    mov         eax,dword ptr [ebp+8]
 00026ADA    mov         eax,dword ptr [eax-4]
 00026ADD    mov         dl,0D
 00026ADF    call        TWriter.WriteValue
>00026AE4    jmp         00026C82
 00026AE9    mov         eax,dword ptr [ebp-4]
 00026AEC    mov         edx,dword ptr ds:[1EFD4];TPersistent
 00026AF2    call        @IsClass
 00026AF7    test        al,al
>00026AF9    je          00026C82
 00026AFF    mov         eax,dword ptr [ebp-4]
 00026B02    mov         edx,dword ptr ds:[1FA0C];TComponent
 00026B08    call        @IsClass
 00026B0D    test        al,al
>00026B0F    je          00026B5F
 00026B11    push        ebp
 00026B12    call        IsDefault
 00026B17    pop         ecx
 00026B18    test        al,al
>00026B1A    jne         00026C82
 00026B20    push        ebp
 00026B21    lea         edx,[ebp-14]
 00026B24    mov         eax,dword ptr [ebp-4]
 00026B27    call        GetComponentValue
 00026B2C    pop         ecx
 00026B2D    mov         edx,dword ptr [ebp-14]
 00026B30    lea         eax,[ebp-10]
 00026B33    call        @LStrLAsg
 00026B38    cmp         dword ptr [ebp-10],0
>00026B3C    je          00026C82
 00026B42    mov         eax,dword ptr [ebp+8]
 00026B45    push        eax
 00026B46    call        WritePropPath
 00026B4B    pop         ecx
 00026B4C    mov         eax,dword ptr [ebp+8]
 00026B4F    mov         eax,dword ptr [eax-4]
 00026B52    mov         edx,dword ptr [ebp-10]
 00026B55    call        TWriter.WriteIdent
>00026B5A    jmp         00026C82
 00026B5F    mov         eax,dword ptr [ebp-4]
 00026B62    mov         edx,dword ptr ds:[1F124];TCollection
 00026B68    call        @IsClass
 00026B6D    test        al,al
>00026B6F    je          00026BB7
 00026B71    mov         eax,dword ptr [ebp+8]
 00026B74    push        eax
 00026B75    call        AncestorValid
 00026B7A    pop         ecx
 00026B7B    test        al,al
>00026B7D    je          00026BA5
 00026B7F    mov         eax,dword ptr [ebp+8]
 00026B82    mov         edx,dword ptr [eax-0C]
 00026B85    mov         eax,dword ptr [ebp+8]
 00026B88    mov         eax,dword ptr [eax-4]
 00026B8B    mov         eax,dword ptr [eax+1C]
 00026B8E    call        GetOrdProp
 00026B93    mov         edx,eax
 00026B95    mov         eax,dword ptr [ebp-4]
 00026B98    call        CollectionsEqual
 00026B9D    test        al,al
>00026B9F    jne         00026C82
 00026BA5    mov         eax,dword ptr [ebp+8]
 00026BA8    push        eax
 00026BA9    mov         eax,dword ptr [ebp-4]
 00026BAC    call        WriteCollectionProp
 00026BB1    pop         ecx
>00026BB2    jmp         00026C82
 00026BB7    mov         eax,dword ptr [ebp+8]
 00026BBA    mov         eax,dword ptr [eax-4]
 00026BBD    mov         eax,dword ptr [eax+1C]
 00026BC0    mov         dword ptr [ebp-8],eax
 00026BC3    lea         eax,[ebp-0C]
 00026BC6    mov         edx,dword ptr [ebp+8]
 00026BC9    mov         edx,dword ptr [edx-4]
 00026BCC    mov         edx,dword ptr [edx+28]
 00026BCF    call        @LStrLAsg
 00026BD4    xor         eax,eax
 00026BD6    push        ebp
 00026BD7    push        26C7B
 00026BDC    push        dword ptr fs:[eax]
 00026BDF    mov         dword ptr fs:[eax],esp
 00026BE2    mov         eax,dword ptr [ebp+8]
 00026BE5    mov         eax,dword ptr [eax-4]
 00026BE8    push        dword ptr [eax+28]
 00026BEB    lea         eax,[ebp-14]
 00026BEE    mov         edx,dword ptr [ebp+8]
 00026BF1    mov         edx,dword ptr [edx-0C]
 00026BF4    add         edx,1A
 00026BF7    call        @LStrFromString
 00026BFC    push        dword ptr [ebp-14]
 00026BFF    push        26CB0;'.'
 00026C04    mov         eax,dword ptr [ebp+8]
 00026C07    mov         eax,dword ptr [eax-4]
 00026C0A    add         eax,28
 00026C0D    mov         edx,3
 00026C12    call        @LStrCatN
 00026C17    mov         eax,dword ptr [ebp+8]
 00026C1A    push        eax
 00026C1B    call        AncestorValid
 00026C20    pop         ecx
 00026C21    test        al,al
>00026C23    je          00026C42
 00026C25    mov         eax,dword ptr [ebp+8]
 00026C28    mov         edx,dword ptr [eax-0C]
 00026C2B    mov         eax,dword ptr [ebp+8]
 00026C2E    mov         eax,dword ptr [eax-4]
 00026C31    mov         eax,dword ptr [eax+1C]
 00026C34    call        GetOrdProp
 00026C39    mov         edx,dword ptr [ebp+8]
 00026C3C    mov         edx,dword ptr [edx-4]
 00026C3F    mov         dword ptr [edx+1C],eax
 00026C42    mov         eax,dword ptr [ebp+8]
 00026C45    mov         eax,dword ptr [eax-4]
 00026C48    mov         edx,dword ptr [ebp-4]
 00026C4B    call        TWriter.WriteProperties
 00026C50    xor         eax,eax
 00026C52    pop         edx
 00026C53    pop         ecx
 00026C54    pop         ecx
 00026C55    mov         dword ptr fs:[eax],edx
 00026C58    push        26C82
 00026C5D    mov         eax,dword ptr [ebp+8]
 00026C60    mov         eax,dword ptr [eax-4]
 00026C63    mov         edx,dword ptr [ebp-8]
 00026C66    mov         dword ptr [eax+1C],edx
 00026C69    mov         eax,dword ptr [ebp+8]
 00026C6C    mov         eax,dword ptr [eax-4]
 00026C6F    add         eax,28
 00026C72    mov         edx,dword ptr [ebp-0C]
 00026C75    call        @LStrAsg
 00026C7A    ret
>00026C7B    jmp         @HandleFinally
>00026C80    jmp         00026C5D
 00026C82    xor         eax,eax
 00026C84    pop         edx
 00026C85    pop         ecx
 00026C86    pop         ecx
 00026C87    mov         dword ptr fs:[eax],edx
 00026C8A    push        26CA4
 00026C8F    lea         eax,[ebp-14]
 00026C92    mov         edx,3
 00026C97    call        @LStrArrayClr
 00026C9C    ret
>00026C9D    jmp         @HandleFinally
>00026CA2    jmp         00026C8F
 00026CA4    mov         esp,ebp
 00026CA6    pop         ebp
 00026CA7    ret
*}
end;

//00026CB4
function IsDefaultValue:Boolean;
begin
{*
 00026CB4    push        ebp
 00026CB5    mov         ebp,esp
 00026CB7    add         esp,0FFFFFEF8
 00026CBD    push        ebx
 00026CBE    push        esi
 00026CBF    xor         ebx,ebx
 00026CC1    mov         eax,dword ptr [ebp+8]
 00026CC4    mov         eax,dword ptr [eax+8]
 00026CC7    push        eax
 00026CC8    call        AncestorValid
 00026CCD    pop         ecx
 00026CCE    test        al,al
>00026CD0    je          00026CF2
 00026CD2    lea         ecx,[ebp-8]
 00026CD5    mov         eax,dword ptr [ebp+8]
 00026CD8    mov         eax,dword ptr [eax+8]
 00026CDB    mov         edx,dword ptr [eax-0C]
 00026CDE    mov         eax,dword ptr [ebp+8]
 00026CE1    mov         eax,dword ptr [eax+8]
 00026CE4    mov         eax,dword ptr [eax-4]
 00026CE7    mov         eax,dword ptr [eax+1C]
 00026CEA    call        GetMethodProp
 00026CEF    mov         ebx,dword ptr [ebp-8]
 00026CF2    mov         eax,dword ptr [ebp+8]
 00026CF5    cmp         ebx,dword ptr [eax-8]
>00026CF8    je          00026D2F
 00026CFA    mov         eax,dword ptr [ebp+8]
 00026CFD    mov         esi,dword ptr [eax-8]
 00026D00    test        esi,esi
>00026D02    je          00026D2B
 00026D04    lea         ecx,[ebp-108]
 00026D0A    mov         eax,dword ptr [ebp+8]
 00026D0D    mov         edx,esi
 00026D0F    mov         eax,dword ptr [ebp+8]
 00026D12    mov         eax,dword ptr [eax+8]
 00026D15    mov         eax,dword ptr [eax-4]
 00026D18    mov         eax,dword ptr [eax+18]
 00026D1B    mov         eax,dword ptr [eax]
 00026D1D    call        TObject.MethodName
 00026D22    cmp         byte ptr [ebp-108],0
>00026D29    je          00026D2F
 00026D2B    xor         eax,eax
>00026D2D    jmp         00026D31
 00026D2F    mov         al,1
 00026D31    pop         esi
 00026D32    pop         ebx
 00026D33    mov         esp,ebp
 00026D35    pop         ebp
 00026D36    ret
*}
end;

//00026D38
procedure WriteMethodProp;
begin
{*
 00026D38    push        ebp
 00026D39    mov         ebp,esp
 00026D3B    add         esp,0FFFFFEF4
 00026D41    push        ebx
 00026D42    xor         eax,eax
 00026D44    mov         dword ptr [ebp-0C],eax
 00026D47    xor         eax,eax
 00026D49    push        ebp
 00026D4A    push        26DDE
 00026D4F    push        dword ptr fs:[eax]
 00026D52    mov         dword ptr fs:[eax],esp
 00026D55    lea         ecx,[ebp-8]
 00026D58    mov         eax,dword ptr [ebp+8]
 00026D5B    mov         edx,dword ptr [eax-0C]
 00026D5E    mov         eax,dword ptr [ebp+8]
 00026D61    mov         eax,dword ptr [eax-8]
 00026D64    call        GetMethodProp
 00026D69    push        ebp
 00026D6A    call        IsDefaultValue
 00026D6F    pop         ecx
 00026D70    test        al,al
>00026D72    jne         00026DC8
 00026D74    mov         eax,dword ptr [ebp+8]
 00026D77    push        eax
 00026D78    call        WritePropPath
 00026D7D    pop         ecx
 00026D7E    mov         ebx,dword ptr [ebp-8]
 00026D81    test        ebx,ebx
>00026D83    jne         00026D94
 00026D85    mov         eax,dword ptr [ebp+8]
 00026D88    mov         eax,dword ptr [eax-4]
 00026D8B    mov         dl,0D
 00026D8D    call        TWriter.WriteValue
>00026D92    jmp         00026DC8
 00026D94    lea         ecx,[ebp-10C]
 00026D9A    mov         eax,dword ptr [ebp+8]
 00026D9D    mov         eax,dword ptr [eax-4]
 00026DA0    mov         eax,dword ptr [eax+18]
 00026DA3    mov         eax,dword ptr [eax]
 00026DA5    mov         edx,ebx
 00026DA7    call        TObject.MethodName
 00026DAC    lea         edx,[ebp-10C]
 00026DB2    lea         eax,[ebp-0C]
 00026DB5    call        @LStrFromString
 00026DBA    mov         edx,dword ptr [ebp-0C]
 00026DBD    mov         eax,dword ptr [ebp+8]
 00026DC0    mov         eax,dword ptr [eax-4]
 00026DC3    call        TWriter.WriteIdent
 00026DC8    xor         eax,eax
 00026DCA    pop         edx
 00026DCB    pop         ecx
 00026DCC    pop         ecx
 00026DCD    mov         dword ptr fs:[eax],edx
 00026DD0    push        26DE5
 00026DD5    lea         eax,[ebp-0C]
 00026DD8    call        @LStrClr
 00026DDD    ret
>00026DDE    jmp         @HandleFinally
>00026DE3    jmp         00026DD5
 00026DE5    pop         ebx
 00026DE6    mov         esp,ebp
 00026DE8    pop         ebp
 00026DE9    ret
*}
end;

//00026DEC
function IsDefaultValue:Boolean;
begin
{*
 00026DEC    push        ebp
 00026DED    mov         ebp,esp
 00026DEF    xor         ecx,ecx
 00026DF1    push        ecx
 00026DF2    push        ecx
 00026DF3    push        ecx
 00026DF4    push        ecx
 00026DF5    push        ebx
 00026DF6    xor         eax,eax
 00026DF8    push        ebp
 00026DF9    push        26E68
 00026DFE    push        dword ptr fs:[eax]
 00026E01    mov         dword ptr fs:[eax],esp
 00026E04    mov         eax,dword ptr [ebp+8]
 00026E07    mov         eax,dword ptr [eax+8]
 00026E0A    push        eax
 00026E0B    call        AncestorValid
 00026E10    pop         ecx
 00026E11    test        al,al
>00026E13    je          00026E45
 00026E15    lea         ecx,[ebp-10]
 00026E18    mov         eax,dword ptr [ebp+8]
 00026E1B    mov         eax,dword ptr [eax+8]
 00026E1E    mov         edx,dword ptr [eax-0C]
 00026E21    mov         eax,dword ptr [ebp+8]
 00026E24    mov         eax,dword ptr [eax+8]
 00026E27    mov         eax,dword ptr [eax-4]
 00026E2A    mov         eax,dword ptr [eax+1C]
 00026E2D    call        GetVariantProp
 00026E32    lea         edx,[ebp-10]
 00026E35    mov         eax,dword ptr [ebp+8]
 00026E38    add         eax,0FFFFFFF0
 00026E3B    call        @VarCmp
 00026E40    sete        bl
>00026E43    jmp         00026E52
 00026E45    mov         eax,dword ptr [ebp+8]
 00026E48    add         eax,0FFFFFFF0
 00026E4B    call        VarIsEmpty
 00026E50    mov         ebx,eax
 00026E52    xor         eax,eax
 00026E54    pop         edx
 00026E55    pop         ecx
 00026E56    pop         ecx
 00026E57    mov         dword ptr fs:[eax],edx
 00026E5A    push        26E6F
 00026E5F    lea         eax,[ebp-10]
 00026E62    call        @VarClr
 00026E67    ret
>00026E68    jmp         @HandleFinally
>00026E6D    jmp         00026E5F
 00026E6F    mov         eax,ebx
 00026E71    pop         ebx
 00026E72    mov         esp,ebp
 00026E74    pop         ebp
 00026E75    ret
*}
end;

//00026E78
procedure WriteVariantProp;
begin
{*
 00026E78    push        ebp
 00026E79    mov         ebp,esp
 00026E7B    xor         ecx,ecx
 00026E7D    push        ecx
 00026E7E    push        ecx
 00026E7F    push        ecx
 00026E80    push        ecx
 00026E81    push        ecx
 00026E82    push        ecx
 00026E83    push        ebx
 00026E84    push        esi
 00026E85    push        edi
 00026E86    xor         eax,eax
 00026E88    push        ebp
 00026E89    push        270FD
 00026E8E    push        dword ptr fs:[eax]
 00026E91    mov         dword ptr fs:[eax],esp
 00026E94    lea         ecx,[ebp-10]
 00026E97    mov         eax,dword ptr [ebp+8]
 00026E9A    mov         edx,dword ptr [eax-0C]
 00026E9D    mov         eax,dword ptr [ebp+8]
 00026EA0    mov         eax,dword ptr [eax-8]
 00026EA3    call        GetVariantProp
 00026EA8    push        ebp
 00026EA9    call        IsDefaultValue
 00026EAE    pop         ecx
 00026EAF    test        al,al
>00026EB1    jne         000270D7
 00026EB7    lea         eax,[ebp-10]
 00026EBA    call        VarIsArray
 00026EBF    test        al,al
>00026EC1    je          00026EE4
 00026EC3    lea         edx,[ebp-14]
 00026EC6    mov         eax,[000B5930];^SWriteError:TResStringRec
 00026ECB    call        LoadResString
 00026ED0    mov         ecx,dword ptr [ebp-14]
 00026ED3    mov         dl,1
 00026ED5    mov         eax,[0001EB8C];EWriteError
 00026EDA    call        Exception.Create
 00026EDF    call        @RaiseExcept
 00026EE4    mov         eax,dword ptr [ebp+8]
 00026EE7    push        eax
 00026EE8    call        WritePropPath
 00026EED    pop         ecx
 00026EEE    lea         eax,[ebp-10]
 00026EF1    call        VarType
 00026EF6    and         eax,0FFF
 00026EFB    cmp         eax,6
>00026EFE    jg          00026F2E
>00026F00    je          00027013
 00026F06    cmp         eax,5
>00026F09    ja          0002707B
 00026F0F    jmp         dword ptr [eax*4+26F16]
 00026F0F    dd          00026F5B
 00026F0F    dd          00026F6D
 00026F0F    dd          00026FBB
 00026F0F    dd          00026FBB
 00026F0F    dd          00026FD5
 00026F0F    dd          00026FF4
 00026F2E    cmp         eax,0B
>00026F31    jg          00026F4A
>00026F33    je          00027051
 00026F39    sub         eax,7
>00026F3C    je          00027032
 00026F42    dec         eax
>00026F43    je          00026F7F
>00026F45    jmp         0002707B
 00026F4A    sub         eax,11
>00026F4D    je          00026FBB
 00026F4F    sub         eax,0EF
>00026F54    je          00026F9D
>00026F56    jmp         0002707B
 00026F5B    mov         eax,dword ptr [ebp+8]
 00026F5E    mov         eax,dword ptr [eax-4]
 00026F61    mov         dl,0D
 00026F63    call        TWriter.WriteValue
>00026F68    jmp         000270D7
 00026F6D    mov         eax,dword ptr [ebp+8]
 00026F70    mov         eax,dword ptr [eax-4]
 00026F73    xor         edx,edx
 00026F75    call        TWriter.WriteValue
>00026F7A    jmp         000270D7
 00026F7F    lea         eax,[ebp-18]
 00026F82    lea         edx,[ebp-10]
 00026F85    call        @VarToWStr
 00026F8A    mov         edx,dword ptr [ebp-18]
 00026F8D    mov         eax,dword ptr [ebp+8]
 00026F90    mov         eax,dword ptr [eax-4]
 00026F93    call        TWriter.WriteWideString
>00026F98    jmp         000270D7
 00026F9D    lea         eax,[ebp-14]
 00026FA0    lea         edx,[ebp-10]
 00026FA3    call        @VarToLStr
 00026FA8    mov         edx,dword ptr [ebp-14]
 00026FAB    mov         eax,dword ptr [ebp+8]
 00026FAE    mov         eax,dword ptr [eax-4]
 00026FB1    call        TWriter.WriteString
>00026FB6    jmp         000270D7
 00026FBB    lea         eax,[ebp-10]
 00026FBE    call        @VarToInt
 00026FC3    mov         edx,eax
 00026FC5    mov         eax,dword ptr [ebp+8]
 00026FC8    mov         eax,dword ptr [eax-4]
 00026FCB    call        TWriter.WriteInteger
>00026FD0    jmp         000270D7
 00026FD5    lea         eax,[ebp-10]
 00026FD8    call        @VarToReal
 00026FDD    add         esp,0FFFFFFFC
 00026FE0    fstp        dword ptr [esp]
 00026FE3    wait
 00026FE4    mov         eax,dword ptr [ebp+8]
 00026FE7    mov         eax,dword ptr [eax-4]
 00026FEA    call        TWriter.WriteSingle
>00026FEF    jmp         000270D7
 00026FF4    lea         eax,[ebp-10]
 00026FF7    call        @VarToReal
 00026FFC    add         esp,0FFFFFFF4
 00026FFF    fstp        tbyte ptr [esp]
 00027002    wait
 00027003    mov         eax,dword ptr [ebp+8]
 00027006    mov         eax,dword ptr [eax-4]
 00027009    call        TWriter.WriteFloat
>0002700E    jmp         000270D7
 00027013    lea         eax,[ebp-10]
 00027016    call        @VarToCurr
 0002701B    add         esp,0FFFFFFF8
 0002701E    fistp       qword ptr [esp]
 00027021    wait
 00027022    mov         eax,dword ptr [ebp+8]
 00027025    mov         eax,dword ptr [eax-4]
 00027028    call        TWriter.WriteCurrency
>0002702D    jmp         000270D7
 00027032    lea         eax,[ebp-10]
 00027035    call        @VarToReal
 0002703A    add         esp,0FFFFFFF8
 0002703D    fstp        qword ptr [esp]
 00027040    wait
 00027041    mov         eax,dword ptr [ebp+8]
 00027044    mov         eax,dword ptr [eax-4]
 00027047    call        TWriter.WriteDate
>0002704C    jmp         000270D7
 00027051    lea         eax,[ebp-10]
 00027054    call        @VarToBool
 00027059    test        al,al
>0002705B    je          0002706C
 0002705D    mov         eax,dword ptr [ebp+8]
 00027060    mov         eax,dword ptr [eax-4]
 00027063    mov         dl,9
 00027065    call        TWriter.WriteValue
>0002706A    jmp         000270D7
 0002706C    mov         eax,dword ptr [ebp+8]
 0002706F    mov         eax,dword ptr [eax-4]
 00027072    mov         dl,8
 00027074    call        TWriter.WriteValue
>00027079    jmp         000270D7
 0002707B    xor         eax,eax
 0002707D    push        ebp
 0002707E    push        270AC
 00027083    push        dword ptr fs:[eax]
 00027086    mov         dword ptr fs:[eax],esp
 00027089    lea         eax,[ebp-14]
 0002708C    lea         edx,[ebp-10]
 0002708F    call        @VarToLStr
 00027094    mov         edx,dword ptr [ebp-14]
 00027097    mov         eax,dword ptr [ebp+8]
 0002709A    mov         eax,dword ptr [eax-4]
 0002709D    call        TWriter.WriteString
 000270A2    xor         eax,eax
 000270A4    pop         edx
 000270A5    pop         ecx
 000270A6    pop         ecx
 000270A7    mov         dword ptr fs:[eax],edx
>000270AA    jmp         000270D7
>000270AC    jmp         @HandleAnyException
 000270B1    lea         edx,[ebp-14]
 000270B4    mov         eax,[000B5930];^SWriteError:TResStringRec
 000270B9    call        LoadResString
 000270BE    mov         ecx,dword ptr [ebp-14]
 000270C1    mov         dl,1
 000270C3    mov         eax,[0001EB8C];EWriteError
 000270C8    call        Exception.Create
 000270CD    call        @RaiseExcept
 000270D2    call        @DoneExcept
 000270D7    xor         eax,eax
 000270D9    pop         edx
 000270DA    pop         ecx
 000270DB    pop         ecx
 000270DC    mov         dword ptr fs:[eax],edx
 000270DF    push        27104
 000270E4    lea         eax,[ebp-18]
 000270E7    call        @WStrClr
 000270EC    lea         eax,[ebp-14]
 000270EF    call        @LStrClr
 000270F4    lea         eax,[ebp-10]
 000270F7    call        @VarClr
 000270FC    ret
>000270FD    jmp         @HandleFinally
>00027102    jmp         000270E4
 00027104    pop         edi
 00027105    pop         esi
 00027106    pop         ebx
 00027107    mov         esp,ebp
 00027109    pop         ebp
 0002710A    ret
*}
end;

//0002710C
procedure TWriter.WriteProperty(Instance:TPersistent; PropInfo:Pointer);
begin
{*
 0002710C    push        ebp
 0002710D    mov         ebp,esp
 0002710F    add         esp,0FFFFFFF0
 00027112    mov         dword ptr [ebp-0C],ecx
 00027115    mov         dword ptr [ebp-8],edx
 00027118    mov         dword ptr [ebp-4],eax
 0002711B    mov         eax,dword ptr [ebp-0C]
 0002711E    cmp         dword ptr [eax+8],0
>00027122    je          000271A9
 00027128    mov         eax,dword ptr [eax]
 0002712A    mov         eax,dword ptr [eax]
 0002712C    mov         dword ptr [ebp-10],eax
 0002712F    mov         eax,dword ptr [ebp-10]
 00027132    movzx       eax,byte ptr [eax]
 00027135    cmp         eax,0C
>00027138    ja          000271A9
 0002713A    jmp         dword ptr [eax*4+27141]
 0002713A    dd          000271A9
 0002713A    dd          00027175
 0002713A    dd          00027175
 0002713A    dd          00027175
 0002713A    dd          0002717E
 0002713A    dd          00027187
 0002713A    dd          00027175
 0002713A    dd          00027190
 0002713A    dd          00027199
 0002713A    dd          000271A9
 0002713A    dd          00027187
 0002713A    dd          00027187
 0002713A    dd          000271A2
 00027175    push        ebp
 00027176    call        WriteOrdProp
 0002717B    pop         ecx
>0002717C    jmp         000271A9
 0002717E    push        ebp
 0002717F    call        WriteFloatProp
 00027184    pop         ecx
>00027185    jmp         000271A9
 00027187    push        ebp
 00027188    call        WriteStrProp
 0002718D    pop         ecx
>0002718E    jmp         000271A9
 00027190    push        ebp
 00027191    call        WriteObjectProp
 00027196    pop         ecx
>00027197    jmp         000271A9
 00027199    push        ebp
 0002719A    call        WriteMethodProp
 0002719F    pop         ecx
>000271A0    jmp         000271A9
 000271A2    push        ebp
 000271A3    call        WriteVariantProp
 000271A8    pop         ecx
 000271A9    mov         esp,ebp
 000271AB    pop         ebp
 000271AC    ret
*}
end;

//000271B0
procedure TWriter.WritePropName(const PropName:AnsiString);
begin
{*
 000271B0    push        ebp
 000271B1    mov         ebp,esp
 000271B3    push        0
 000271B5    push        ebx
 000271B6    push        esi
 000271B7    mov         esi,edx
 000271B9    mov         ebx,eax
 000271BB    xor         eax,eax
 000271BD    push        ebp
 000271BE    push        271F6
 000271C3    push        dword ptr fs:[eax]
 000271C6    mov         dword ptr fs:[eax],esp
 000271C9    lea         eax,[ebp-4]
 000271CC    mov         ecx,esi
 000271CE    mov         edx,dword ptr [ebx+28]
 000271D1    call        @LStrCat3
 000271D6    mov         edx,dword ptr [ebp-4]
 000271D9    mov         eax,ebx
 000271DB    call        TWriter.WriteStr
 000271E0    xor         eax,eax
 000271E2    pop         edx
 000271E3    pop         ecx
 000271E4    pop         ecx
 000271E5    mov         dword ptr fs:[eax],edx
 000271E8    push        271FD
 000271ED    lea         eax,[ebp-4]
 000271F0    call        @LStrClr
 000271F5    ret
>000271F6    jmp         @HandleFinally
>000271FB    jmp         000271ED
 000271FD    pop         esi
 000271FE    pop         ebx
 000271FF    pop         ecx
 00027200    pop         ebp
 00027201    ret
*}
end;

//00027204
procedure TWriter.WriteSignature;
begin
{*
 00027204    mov         edx,0B4360
 00027209    mov         ecx,4
 0002720E    call        TWriter.Write
 00027213    ret
*}
end;

//00027214
procedure TWriter.WriteStr(const Value:AnsiString);
begin
{*
 00027214    push        ebx
 00027215    push        esi
 00027216    push        ecx
 00027217    mov         esi,edx
 00027219    mov         ebx,eax
 0002721B    mov         eax,esi
 0002721D    call        @LStrLen
 00027222    mov         dword ptr [esp],eax
 00027225    cmp         dword ptr [esp],0FF
>0002722C    jle         00027235
 0002722E    mov         dword ptr [esp],0FF
 00027235    mov         edx,esp
 00027237    mov         ecx,1
 0002723C    mov         eax,ebx
 0002723E    call        TWriter.Write
 00027243    mov         eax,esi
 00027245    call        @LStrToPChar
 0002724A    mov         edx,eax
 0002724C    mov         ecx,dword ptr [esp]
 0002724F    mov         eax,ebx
 00027251    call        TWriter.Write
 00027256    pop         edx
 00027257    pop         esi
 00027258    pop         ebx
 00027259    ret
*}
end;

//0002725C
procedure TWriter.WriteString(const Value:AnsiString);
begin
{*
 0002725C    push        ebx
 0002725D    push        esi
 0002725E    push        ecx
 0002725F    mov         esi,edx
 00027261    mov         ebx,eax
 00027263    mov         eax,esi
 00027265    call        @LStrLen
 0002726A    mov         dword ptr [esp],eax
 0002726D    cmp         dword ptr [esp],0FF
>00027274    jg          0002728F
 00027276    mov         dl,6
 00027278    mov         eax,ebx
 0002727A    call        TWriter.WriteValue
 0002727F    mov         edx,esp
 00027281    mov         ecx,1
 00027286    mov         eax,ebx
 00027288    call        TWriter.Write
>0002728D    jmp         000272A6
 0002728F    mov         dl,0C
 00027291    mov         eax,ebx
 00027293    call        TWriter.WriteValue
 00027298    mov         edx,esp
 0002729A    mov         ecx,4
 0002729F    mov         eax,ebx
 000272A1    call        TWriter.Write
 000272A6    mov         edx,esi
 000272A8    mov         ecx,dword ptr [esp]
 000272AB    mov         eax,ebx
 000272AD    call        TWriter.Write
 000272B2    pop         edx
 000272B3    pop         esi
 000272B4    pop         ebx
 000272B5    ret
*}
end;

//000272B8
procedure TWriter.WriteWideString(const Value:WideString);
begin
{*
 000272B8    push        ebx
 000272B9    push        esi
 000272BA    push        ecx
 000272BB    mov         esi,edx
 000272BD    mov         ebx,eax
 000272BF    mov         dl,12
 000272C1    mov         eax,ebx
 000272C3    call        TWriter.WriteValue
 000272C8    mov         eax,esi
 000272CA    call        @WStrLen
 000272CF    mov         dword ptr [esp],eax
 000272D2    mov         edx,esp
 000272D4    mov         ecx,4
 000272D9    mov         eax,ebx
 000272DB    call        TWriter.Write
 000272E0    mov         ecx,dword ptr [esp]
 000272E3    add         ecx,ecx
 000272E5    mov         edx,esi
 000272E7    mov         eax,ebx
 000272E9    call        TWriter.Write
 000272EE    pop         edx
 000272EF    pop         esi
 000272F0    pop         ebx
 000272F1    ret
*}
end;

//000272F4
procedure TWriter.WriteValue(Value:TValueType);
begin
{*
 000272F4    push        ecx
 000272F5    mov         byte ptr [esp],dl
 000272F8    mov         edx,esp
 000272FA    mov         ecx,1
 000272FF    call        TWriter.Write
 00027304    pop         edx
 00027305    ret
*}
end;

//00027308
procedure FreeThreadWindow;
begin
{*
 00027308    cmp         dword ptr ds:[0B6630],0
>0002730F    je          00027323
 00027311    mov         eax,[000B6630]
 00027316    push        eax
 00027317    call        user32.DestroyWindow
 0002731C    xor         eax,eax
 0002731E    mov         [000B6630],eax
 00027323    ret
*}
end;

//00027324
constructor TComponent.Create(AOwner:TComponent);
begin
{*
 00027324    push        ebx
 00027325    push        esi
 00027326    push        edi
 00027327    test        dl,dl
>00027329    je          00027333
 0002732B    add         esp,0FFFFFFF0
 0002732E    call        @ClassCreate
 00027333    mov         esi,ecx
 00027335    mov         ebx,edx
 00027337    mov         edi,eax
 00027339    mov         al,[0002736C]
 0002733E    mov         byte ptr [edi+21],al
 00027341    test        esi,esi
>00027343    je          0002734E
 00027345    mov         edx,edi
 00027347    mov         eax,esi
 00027349    call        TComponent.InsertComponent
 0002734E    mov         eax,edi
 00027350    test        bl,bl
>00027352    je          00027363
 00027354    call        @AfterConstruction
 00027359    pop         dword ptr fs:[0]
 00027360    add         esp,0C
 00027363    mov         eax,edi
 00027365    pop         edi
 00027366    pop         esi
 00027367    pop         ebx
 00027368    ret
*}
end;

//00027370
destructor TComponent.Destroy;
begin
{*
 00027370    push        ebx
 00027371    push        esi
 00027372    push        edi
 00027373    push        ebp
 00027374    push        ecx
 00027375    call        @BeforeDestruction
 0002737A    mov         byte ptr [esp],dl
 0002737D    mov         ebx,eax
 0002737F    mov         eax,dword ptr [ebx+14]
 00027382    test        eax,eax
>00027384    je          000273B5
 00027386    mov         esi,dword ptr [eax+8]
 00027389    dec         esi
 0002738A    test        esi,esi
>0002738C    jl          000273A8
 0002738E    inc         esi
 0002738F    xor         edi,edi
 00027391    mov         edx,edi
 00027393    mov         eax,dword ptr [ebx+14]
 00027396    call        TList.Get
 0002739B    mov         cl,1
 0002739D    mov         edx,ebx
 0002739F    mov         ebp,dword ptr [eax]
 000273A1    call        dword ptr [ebp+10]
 000273A4    inc         edi
 000273A5    dec         esi
>000273A6    jne         00027391
 000273A8    mov         eax,dword ptr [ebx+14]
 000273AB    call        TObject.Free
 000273B0    xor         eax,eax
 000273B2    mov         dword ptr [ebx+14],eax
 000273B5    mov         eax,ebx
 000273B7    call        TComponent.Destroying
 000273BC    mov         eax,ebx
 000273BE    call        TComponent.DestroyComponents
 000273C3    mov         eax,dword ptr [ebx+4]
 000273C6    test        eax,eax
>000273C8    je          000273D1
 000273CA    mov         edx,ebx
 000273CC    call        TComponent.RemoveComponent
 000273D1    mov         dl,byte ptr [esp]
 000273D4    and         dl,0FC
 000273D7    mov         eax,ebx
 000273D9    call        TMemoryStream.Destroy
 000273DE    cmp         byte ptr [esp],0
>000273E2    jle         000273EB
 000273E4    mov         eax,ebx
 000273E6    call        @ClassDestroy
 000273EB    pop         edx
 000273EC    pop         ebp
 000273ED    pop         edi
 000273EE    pop         esi
 000273EF    pop         ebx
 000273F0    ret
*}
end;

//000273F4
procedure TComponent.FreeNotification(AComponent:TComponent);
begin
{*
 000273F4    push        ebx
 000273F5    push        esi
 000273F6    mov         esi,edx
 000273F8    mov         ebx,eax
 000273FA    mov         eax,dword ptr [ebx+4]
 000273FD    test        eax,eax
>000273FF    je          00027406
 00027401    cmp         eax,dword ptr [esi+4]
>00027404    je          0002743C
 00027406    cmp         dword ptr [ebx+14],0
>0002740A    jne         0002741B
 0002740C    mov         dl,1
 0002740E    mov         eax,[0001EEC4];TList
 00027413    call        TObject.Create
 00027418    mov         dword ptr [ebx+14],eax
 0002741B    mov         edx,esi
 0002741D    mov         eax,dword ptr [ebx+14]
 00027420    call        TList.IndexOf
 00027425    test        eax,eax
>00027427    jge         0002743C
 00027429    mov         edx,esi
 0002742B    mov         eax,dword ptr [ebx+14]
 0002742E    call        TList.Add
 00027433    mov         edx,ebx
 00027435    mov         eax,esi
 00027437    call        TComponent.FreeNotification
 0002743C    pop         esi
 0002743D    pop         ebx
 0002743E    ret
*}
end;

//00027440
procedure TComponent.ReadLeft(Reader:TReader);
begin
{*
 00027440    push        ebx
 00027441    push        esi
 00027442    mov         esi,edx
 00027444    mov         ebx,eax
 00027446    mov         eax,esi
 00027448    call        TReader.ReadInteger
 0002744D    mov         word ptr [ebx+18],ax
 00027451    pop         esi
 00027452    pop         ebx
 00027453    ret
*}
end;

//00027454
procedure TComponent.ReadTop(Reader:TReader);
begin
{*
 00027454    push        ebx
 00027455    push        esi
 00027456    mov         esi,edx
 00027458    mov         ebx,eax
 0002745A    mov         eax,esi
 0002745C    call        TReader.ReadInteger
 00027461    mov         word ptr [ebx+1A],ax
 00027465    pop         esi
 00027466    pop         ebx
 00027467    ret
*}
end;

//00027468
procedure TComponent.WriteLeft(Writer:TWriter);
begin
{*
 00027468    movzx       eax,word ptr [eax+18]
 0002746C    xchg        eax,edx
 0002746D    call        TWriter.WriteInteger
 00027472    ret
*}
end;

//00027474
procedure TComponent.WriteTop(Writer:TWriter);
begin
{*
 00027474    movzx       eax,word ptr [eax+1A]
 00027478    xchg        eax,edx
 00027479    call        TWriter.WriteInteger
 0002747E    ret
*}
end;

//00027480
procedure TComponent.Insert(AComponent:TComponent);
begin
{*
 00027480    push        ebx
 00027481    push        esi
 00027482    mov         esi,edx
 00027484    mov         ebx,eax
 00027486    cmp         dword ptr [ebx+10],0
>0002748A    jne         0002749B
 0002748C    mov         dl,1
 0002748E    mov         eax,[0001EEC4];TList
 00027493    call        TObject.Create
 00027498    mov         dword ptr [ebx+10],eax
 0002749B    mov         edx,esi
 0002749D    mov         eax,dword ptr [ebx+10]
 000274A0    call        TList.Add
 000274A5    mov         dword ptr [esi+4],ebx
 000274A8    pop         esi
 000274A9    pop         ebx
 000274AA    ret
*}
end;

//000274AC
procedure TComponent.Remove(AComponent:TComponent);
begin
{*
 000274AC    push        ebx
 000274AD    mov         ebx,eax
 000274AF    xor         eax,eax
 000274B1    mov         dword ptr [edx+4],eax
 000274B4    mov         eax,dword ptr [ebx+10]
 000274B7    call        TList.Remove
 000274BC    mov         eax,dword ptr [ebx+10]
 000274BF    cmp         dword ptr [eax+8],0
>000274C3    jne         000274CF
 000274C5    call        TObject.Free
 000274CA    xor         eax,eax
 000274CC    mov         dword ptr [ebx+10],eax
 000274CF    pop         ebx
 000274D0    ret
*}
end;

//000274D4
procedure TComponent.InsertComponent(AComponent:TComponent);
begin
{*
 000274D4    push        ebx
 000274D5    push        esi
 000274D6    push        edi
 000274D7    mov         esi,edx
 000274D9    mov         edi,eax
 000274DB    mov         edx,edi
 000274DD    mov         eax,esi
 000274DF    mov         bx,0FFF6
 000274E3    call        @CallDynaInst
 000274E8    mov         eax,dword ptr [esi+8]
 000274EB    push        eax
 000274EC    xor         ecx,ecx
 000274EE    mov         edx,esi
 000274F0    mov         eax,edi
 000274F2    mov         ebx,dword ptr [eax]
 000274F4    call        dword ptr [ebx+20]
 000274F7    mov         edx,esi
 000274F9    mov         eax,edi
 000274FB    call        TComponent.Insert
 00027500    mov         dl,1
 00027502    mov         eax,esi
 00027504    call        TComponent.SetReference
 00027509    test        byte ptr [edi+20],10
>0002750D    je          00027518
 0002750F    mov         dl,1
 00027511    mov         eax,esi
 00027513    call        TComponent.SetDesigning
 00027518    xor         ecx,ecx
 0002751A    mov         edx,esi
 0002751C    mov         eax,edi
 0002751E    mov         ebx,dword ptr [eax]
 00027520    call        dword ptr [ebx+10]
 00027523    pop         edi
 00027524    pop         esi
 00027525    pop         ebx
 00027526    ret
*}
end;

//00027528
procedure TComponent.RemoveComponent(AComponent:TComponent);
begin
{*
 00027528    push        ebx
 00027529    push        esi
 0002752A    push        edi
 0002752B    mov         ebx,edx
 0002752D    mov         esi,eax
 0002752F    mov         cl,1
 00027531    mov         edx,ebx
 00027533    mov         eax,esi
 00027535    mov         edi,dword ptr [eax]
 00027537    call        dword ptr [edi+10]
 0002753A    xor         edx,edx
 0002753C    mov         eax,ebx
 0002753E    call        TComponent.SetReference
 00027543    mov         edx,ebx
 00027545    mov         eax,esi
 00027547    call        TComponent.Remove
 0002754C    xor         edx,edx
 0002754E    mov         eax,ebx
 00027550    call        TComponent.SetDesigning
 00027555    push        0
 00027557    mov         ecx,dword ptr [ebx+8]
 0002755A    mov         edx,ebx
 0002755C    mov         eax,esi
 0002755E    mov         ebx,dword ptr [eax]
 00027560    call        dword ptr [ebx+20]
 00027563    pop         edi
 00027564    pop         esi
 00027565    pop         ebx
 00027566    ret
*}
end;

//00027568
procedure TComponent.DestroyComponents;
begin
{*
 00027568    push        ebx
 00027569    push        esi
 0002756A    mov         ebx,eax
>0002756C    jmp         00027589
 0002756E    mov         eax,esi
 00027570    call        TList.Last
 00027575    mov         esi,eax
 00027577    mov         edx,esi
 00027579    mov         eax,ebx
 0002757B    call        TComponent.Remove
 00027580    mov         dl,1
 00027582    mov         eax,esi
 00027584    mov         ecx,dword ptr [eax]
 00027586    call        dword ptr [ecx-4]
 00027589    mov         esi,dword ptr [ebx+10]
 0002758C    test        esi,esi
>0002758E    jne         0002756E
 00027590    pop         esi
 00027591    pop         ebx
 00027592    ret
*}
end;

//00027594
procedure TComponent.Destroying;
begin
{*
 00027594    push        ebx
 00027595    push        esi
 00027596    push        edi
 00027597    mov         ebx,eax
 00027599    test        byte ptr [ebx+20],8
>0002759D    jne         000275C8
 0002759F    or          byte ptr [ebx+20],8
 000275A3    mov         eax,dword ptr [ebx+10]
 000275A6    test        eax,eax
>000275A8    je          000275C8
 000275AA    mov         esi,dword ptr [eax+8]
 000275AD    dec         esi
 000275AE    test        esi,esi
>000275B0    jl          000275C8
 000275B2    inc         esi
 000275B3    xor         edi,edi
 000275B5    mov         edx,edi
 000275B7    mov         eax,dword ptr [ebx+10]
 000275BA    call        TList.Get
 000275BF    call        TComponent.Destroying
 000275C4    inc         edi
 000275C5    dec         esi
>000275C6    jne         000275B5
 000275C8    pop         edi
 000275C9    pop         esi
 000275CA    pop         ebx
 000275CB    ret
*}
end;

//000275CC
procedure TComponent.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 000275CC    push        ebx
 000275CD    push        esi
 000275CE    push        edi
 000275CF    push        ebp
 000275D0    add         esp,0FFFFFFF8
 000275D3    mov         byte ptr [esp+4],cl
 000275D7    mov         dword ptr [esp],edx
 000275DA    mov         ebx,eax
 000275DC    mov         eax,dword ptr [ebx+14]
 000275DF    test        eax,eax
>000275E1    je          00027605
 000275E3    cmp         byte ptr [esp+4],1
>000275E8    jne         00027605
 000275EA    mov         edx,dword ptr [esp]
 000275ED    call        TList.Remove
 000275F2    mov         eax,dword ptr [ebx+14]
 000275F5    cmp         dword ptr [eax+8],0
>000275F9    jne         00027605
 000275FB    call        TObject.Free
 00027600    xor         eax,eax
 00027602    mov         dword ptr [ebx+14],eax
 00027605    mov         eax,dword ptr [ebx+10]
 00027608    test        eax,eax
>0002760A    je          00027631
 0002760C    mov         esi,dword ptr [eax+8]
 0002760F    dec         esi
 00027610    test        esi,esi
>00027612    jl          00027631
 00027614    inc         esi
 00027615    xor         edi,edi
 00027617    mov         edx,edi
 00027619    mov         eax,dword ptr [ebx+10]
 0002761C    call        TList.Get
 00027621    mov         cl,byte ptr [esp+4]
 00027625    mov         edx,dword ptr [esp]
 00027628    mov         ebp,dword ptr [eax]
 0002762A    call        dword ptr [ebp+10]
 0002762D    inc         edi
 0002762E    dec         esi
>0002762F    jne         00027617
 00027631    pop         ecx
 00027632    pop         edx
 00027633    pop         ebp
 00027634    pop         edi
 00027635    pop         esi
 00027636    pop         ebx
 00027637    ret
*}
end;

//00027638
procedure TComponent.DefineProperties(Filer:TFiler);
begin
{*
 00027638    push        ebp
 00027639    mov         ebp,esp
 0002763B    push        ecx
 0002763C    push        ebx
 0002763D    push        esi
 0002763E    push        edi
 0002763F    mov         esi,edx
 00027641    mov         ebx,eax
 00027643    xor         eax,eax
 00027645    mov         dword ptr [ebp-4],eax
 00027648    mov         eax,dword ptr [esi+1C]
 0002764B    test        eax,eax
>0002764D    je          00027655
 0002764F    mov         eax,dword ptr [eax+18]
 00027652    mov         dword ptr [ebp-4],eax
 00027655    push        ebx
 00027656    push        27440;TComponent.ReadLeft
 0002765B    push        ebx
 0002765C    push        27468;TComponent.WriteLeft
 00027661    mov         ax,word ptr [ebx+18]
 00027665    cmp         ax,word ptr [ebp-4]
 00027669    setne       cl
 0002766C    mov         edx,276A8;'Left'
 00027671    mov         eax,esi
 00027673    mov         edi,dword ptr [eax]
 00027675    call        dword ptr [edi]
 00027677    push        ebx
 00027678    push        27454;TComponent.ReadTop
 0002767D    push        ebx
 0002767E    push        27474;TComponent.WriteTop
 00027683    mov         ax,word ptr [ebp-2]
 00027687    cmp         ax,word ptr [ebx+1A]
 0002768B    setne       cl
 0002768E    mov         edx,276B8;'Top'
 00027693    mov         eax,esi
 00027695    mov         ebx,dword ptr [eax]
 00027697    call        dword ptr [ebx]
 00027699    pop         edi
 0002769A    pop         esi
 0002769B    pop         ebx
 0002769C    pop         ecx
 0002769D    pop         ebp
 0002769E    ret
*}
end;

//000276BC
procedure TComponent.HasParent;
begin
{*
 000276BC    xor         eax,eax
 000276BE    ret
*}
end;

//000276C0
procedure TComponent.sub_000276C0;
begin
{*
 000276C0    push        ebp
 000276C1    mov         ebp,esp
 000276C3    pop         ebp
 000276C4    ret         8
*}
end;

//000276C8
procedure TComponent.sub_000276C8;
begin
{*
 000276C8    xor         eax,eax
 000276CA    ret
*}
end;

//000276CC
procedure TComponent.sub_000276CC;
begin
{*
 000276CC    ret
*}
end;

//000276D0
procedure TComponent.GetNamePath;
begin
{*
 000276D0    push        ebx
 000276D1    push        esi
 000276D2    mov         esi,edx
 000276D4    mov         ebx,eax
 000276D6    mov         eax,esi
 000276D8    mov         edx,dword ptr [ebx+8]
 000276DB    call        @LStrLAsg
 000276E0    pop         esi
 000276E1    pop         ebx
 000276E2    ret
*}
end;

//000276E4
procedure TComponent.sub_0002114C;
begin
{*
 000276E4    mov         eax,dword ptr [eax+4];TComponent.FOwner:TComponent
 000276E7    ret
*}
end;

//000276E8
procedure TComponent.sub_000276E8;
begin
{*
 000276E8    ret
*}
end;

//000276EC
procedure TComponent.GetParentComponent;
begin
{*
 000276EC    xor         eax,eax
 000276EE    ret
*}
end;

//000276F0
procedure TComponent.sub_000276F0;
begin
{*
 000276F0    ret
*}
end;

//000276F4
procedure TComponent.Updating;
begin
{*
 000276F4    push        ebx
 000276F5    mov         ebx,eax
 000276F7    or          byte ptr [ebx+20],40
 000276FB    pop         ebx
 000276FC    ret
*}
end;

//00027700
procedure TComponent.Updated;
begin
{*
 00027700    push        ebx
 00027701    mov         ebx,eax
 00027703    and         byte ptr [ebx+20],0BF
 00027707    pop         ebx
 00027708    ret
*}
end;

//0002770C
procedure TComponent.Loaded;
begin
{*
 0002770C    push        ebx
 0002770D    mov         ebx,eax
 0002770F    and         byte ptr [ebx+20],0FE
 00027713    pop         ebx
 00027714    ret
*}
end;

//00027718
procedure TComponent.ReadState(Reader:TReader);
begin
{*
 00027718    xchg        eax,edx
 00027719    call        TReader.ReadData
 0002771E    ret
*}
end;

//00027720
{*procedure sub_00027720(?:?);
begin
 00027720    xchg        eax,edx
 00027721    mov         ecx,dword ptr [eax]
 00027723    call        dword ptr [ecx+0C]
 00027726    ret
end;*}

//00027728
procedure TComponent.ValidateRename(AComponent:TComponent; const CurName:AnsiString; const NewName:AnsiString);
begin
{*
 00027728    push        ebp
 00027729    mov         ebp,esp
 0002772B    add         esp,0FFFFFFF0
 0002772E    push        ebx
 0002772F    push        esi
 00027730    push        edi
 00027731    xor         ebx,ebx
 00027733    mov         dword ptr [ebp-10],ebx
 00027736    mov         dword ptr [ebp-4],ecx
 00027739    mov         edi,edx
 0002773B    mov         ebx,eax
 0002773D    mov         esi,dword ptr [ebp+8]
 00027740    xor         eax,eax
 00027742    push        ebp
 00027743    push        277CB
 00027748    push        dword ptr fs:[eax]
 0002774B    mov         dword ptr fs:[eax],esp
 0002774E    test        edi,edi
>00027750    je          0002779B
 00027752    mov         edx,esi
 00027754    mov         eax,dword ptr [ebp-4]
 00027757    call        CompareText
 0002775C    test        eax,eax
>0002775E    je          0002779B
 00027760    mov         edx,esi
 00027762    mov         eax,ebx
 00027764    call        TComponent.FindComponent
 00027769    test        eax,eax
>0002776B    je          0002779B
 0002776D    mov         dword ptr [ebp-0C],esi
 00027770    mov         byte ptr [ebp-8],0B
 00027774    lea         eax,[ebp-0C]
 00027777    push        eax
 00027778    push        0
 0002777A    lea         edx,[ebp-10]
 0002777D    mov         eax,[000B59A4];^SDuplicateName:TResStringRec
 00027782    call        LoadResString
 00027787    mov         ecx,dword ptr [ebp-10]
 0002778A    mov         dl,1
 0002778C    mov         eax,[0001EDAC];EComponentError
 00027791    call        Exception.CreateFmt
 00027796    call        @RaiseExcept
 0002779B    test        byte ptr [ebx+20],10
>0002779F    je          000277B5
 000277A1    cmp         dword ptr [ebx+4],0
>000277A5    je          000277B5
 000277A7    push        esi
 000277A8    mov         ecx,dword ptr [ebp-4]
 000277AB    mov         edx,edi
 000277AD    mov         eax,dword ptr [ebx+4]
 000277B0    mov         ebx,dword ptr [eax]
 000277B2    call        dword ptr [ebx+20]
 000277B5    xor         eax,eax
 000277B7    pop         edx
 000277B8    pop         ecx
 000277B9    pop         ecx
 000277BA    mov         dword ptr fs:[eax],edx
 000277BD    push        277D2
 000277C2    lea         eax,[ebp-10]
 000277C5    call        @LStrClr
 000277CA    ret
>000277CB    jmp         @HandleFinally
>000277D0    jmp         000277C2
 000277D2    pop         edi
 000277D3    pop         esi
 000277D4    pop         ebx
 000277D5    mov         esp,ebp
 000277D7    pop         ebp
 000277D8    ret         4
*}
end;

//000277DC
procedure TComponent.ValidateContainer(AComponent:TComponent);
begin
{*
 000277DC    push        ebx
 000277DD    push        esi
 000277DE    mov         esi,eax
 000277E0    mov         eax,edx
 000277E2    mov         edx,esi
 000277E4    mov         bx,0FFF5
 000277E8    call        @CallDynaInst
 000277ED    pop         esi
 000277EE    pop         ebx
 000277EF    ret
*}
end;

//000277F0
procedure TComponent.sub_000277F0;
begin
{*
 000277F0    ret
*}
end;

//000277F4
function TComponent.FindComponent(const AName:AnsiString):TComponent;
begin
{*
 000277F4    push        ebx
 000277F5    push        esi
 000277F6    push        edi
 000277F7    push        ebp
 000277F8    push        ecx
 000277F9    mov         dword ptr [esp],edx
 000277FC    mov         edi,eax
 000277FE    cmp         dword ptr [esp],0
>00027802    je          00027837
 00027804    cmp         dword ptr [edi+10],0
>00027808    je          00027837
 0002780A    mov         eax,dword ptr [edi+10]
 0002780D    mov         ebx,dword ptr [eax+8]
 00027810    dec         ebx
 00027811    test        ebx,ebx
>00027813    jl          00027837
 00027815    inc         ebx
 00027816    xor         ebp,ebp
 00027818    mov         eax,dword ptr [edi+10]
 0002781B    mov         edx,ebp
 0002781D    call        TList.Get
 00027822    mov         esi,eax
 00027824    mov         edx,dword ptr [esp]
 00027827    mov         eax,dword ptr [esi+8]
 0002782A    call        CompareText
 0002782F    test        eax,eax
>00027831    je          00027839
 00027833    inc         ebp
 00027834    dec         ebx
>00027835    jne         00027818
 00027837    xor         esi,esi
 00027839    mov         eax,esi
 0002783B    pop         edx
 0002783C    pop         ebp
 0002783D    pop         edi
 0002783E    pop         esi
 0002783F    pop         ebx
 00027840    ret
*}
end;

//00027844
procedure TComponent.SetName(const NewName:TComponentName);
begin
{*
 00027844    push        ebp
 00027845    mov         ebp,esp
 00027847    add         esp,0FFFFFFF4
 0002784A    push        ebx
 0002784B    push        esi
 0002784C    push        edi
 0002784D    xor         ecx,ecx
 0002784F    mov         dword ptr [ebp-0C],ecx
 00027852    mov         esi,edx
 00027854    mov         ebx,eax
 00027856    xor         eax,eax
 00027858    push        ebp
 00027859    push        278FF
 0002785E    push        dword ptr fs:[eax]
 00027861    mov         dword ptr fs:[eax],esp
 00027864    mov         eax,dword ptr [ebx+8]
 00027867    mov         edx,esi
 00027869    call        @LStrCmp
>0002786E    je          000278E9
 00027870    test        esi,esi
>00027872    je          000278AD
 00027874    mov         eax,esi
 00027876    call        IsValidIdent
 0002787B    test        al,al
>0002787D    jne         000278AD
 0002787F    mov         dword ptr [ebp-8],esi
 00027882    mov         byte ptr [ebp-4],0B
 00027886    lea         eax,[ebp-8]
 00027889    push        eax
 0002788A    push        0
 0002788C    lea         edx,[ebp-0C]
 0002788F    mov         eax,[000B58F4];^SInvalidName:TResStringRec
 00027894    call        LoadResString
 00027899    mov         ecx,dword ptr [ebp-0C]
 0002789C    mov         dl,1
 0002789E    mov         eax,[0001EDAC];EComponentError
 000278A3    call        Exception.CreateFmt
 000278A8    call        @RaiseExcept
 000278AD    mov         eax,dword ptr [ebx+4]
 000278B0    test        eax,eax
>000278B2    je          000278C1
 000278B4    push        esi
 000278B5    mov         ecx,dword ptr [ebx+8]
 000278B8    mov         edx,ebx
 000278BA    mov         edi,dword ptr [eax]
 000278BC    call        dword ptr [edi+20]
>000278BF    jmp         000278CE
 000278C1    push        esi
 000278C2    mov         ecx,dword ptr [ebx+8]
 000278C5    xor         edx,edx
 000278C7    mov         eax,ebx
 000278C9    mov         edi,dword ptr [eax]
 000278CB    call        dword ptr [edi+20]
 000278CE    xor         edx,edx
 000278D0    mov         eax,ebx
 000278D2    call        TComponent.SetReference
 000278D7    mov         edx,esi
 000278D9    mov         eax,ebx
 000278DB    call        TComponent.ChangeName
 000278E0    mov         dl,1
 000278E2    mov         eax,ebx
 000278E4    call        TComponent.SetReference
 000278E9    xor         eax,eax
 000278EB    pop         edx
 000278EC    pop         ecx
 000278ED    pop         ecx
 000278EE    mov         dword ptr fs:[eax],edx
 000278F1    push        27906
 000278F6    lea         eax,[ebp-0C]
 000278F9    call        @LStrClr
 000278FE    ret
>000278FF    jmp         @HandleFinally
>00027904    jmp         000278F6
 00027906    pop         edi
 00027907    pop         esi
 00027908    pop         ebx
 00027909    mov         esp,ebp
 0002790B    pop         ebp
 0002790C    ret
*}
end;

//00027910
procedure TComponent.ChangeName(const NewName:TComponentName);
begin
{*
 00027910    push        ebx
 00027911    push        esi
 00027912    mov         esi,edx
 00027914    mov         ebx,eax
 00027916    lea         eax,[ebx+8]
 00027919    mov         edx,esi
 0002791B    call        @LStrAsg
 00027920    pop         esi
 00027921    pop         ebx
 00027922    ret
*}
end;

//00027924
function TComponent.GetComponent(AIndex:Integer):TComponent;
begin
{*
 00027924    push        ebp
 00027925    mov         ebp,esp
 00027927    push        0
 00027929    push        ebx
 0002792A    push        esi
 0002792B    mov         esi,edx
 0002792D    mov         ebx,eax
 0002792F    xor         eax,eax
 00027931    push        ebp
 00027932    push        27981
 00027937    push        dword ptr fs:[eax]
 0002793A    mov         dword ptr fs:[eax],esp
 0002793D    cmp         dword ptr [ebx+10],0
>00027941    jne         0002795F
 00027943    lea         edx,[ebp-4]
 00027946    mov         eax,[000B5AB4];^SListIndexError:TResStringRec
 0002794B    call        LoadResString
 00027950    mov         edx,dword ptr [ebp-4]
 00027953    mov         ecx,esi
 00027955    mov         eax,[0001EEC4];TList
 0002795A    call        TList.Error
 0002795F    mov         edx,esi
 00027961    mov         eax,dword ptr [ebx+10]
 00027964    call        TList.Get
 00027969    mov         ebx,eax
 0002796B    xor         eax,eax
 0002796D    pop         edx
 0002796E    pop         ecx
 0002796F    pop         ecx
 00027970    mov         dword ptr fs:[eax],edx
 00027973    push        27988
 00027978    lea         eax,[ebp-4]
 0002797B    call        @LStrClr
 00027980    ret
>00027981    jmp         @HandleFinally
>00027986    jmp         00027978
 00027988    mov         eax,ebx
 0002798A    pop         esi
 0002798B    pop         ebx
 0002798C    pop         ecx
 0002798D    pop         ebp
 0002798E    ret
*}
end;

//00027990
function TComponent.GetComponentCount:Integer;
begin
{*
 00027990    mov         edx,dword ptr [eax+10]
 00027993    test        edx,edx
>00027995    je          0002799B
 00027997    mov         eax,dword ptr [edx+8]
 0002799A    ret
 0002799B    xor         eax,eax
 0002799D    ret
*}
end;

//000279A0
procedure TComponent.SetComponentIndex(Value:Integer);
begin
{*
 000279A0    push        ebx
 000279A1    push        esi
 000279A2    push        edi
 000279A3    mov         esi,edx
 000279A5    mov         ebx,eax
 000279A7    mov         eax,dword ptr [ebx+4]
 000279AA    test        eax,eax
>000279AC    je          000279ED
 000279AE    mov         eax,dword ptr [eax+10]
 000279B1    mov         edx,ebx
 000279B3    call        TList.IndexOf
 000279B8    test        eax,eax
>000279BA    jl          000279ED
 000279BC    mov         edx,dword ptr [ebx+4]
 000279BF    mov         edi,dword ptr [edx+10]
 000279C2    mov         edx,dword ptr [edi+8]
 000279C5    test        esi,esi
>000279C7    jge         000279CB
 000279C9    xor         esi,esi
 000279CB    cmp         edx,esi
>000279CD    jg          000279D2
 000279CF    mov         esi,edx
 000279D1    dec         esi
 000279D2    cmp         eax,esi
>000279D4    je          000279ED
 000279D6    mov         edx,edi
 000279D8    xchg        eax,edx
 000279D9    call        TList.Delete
 000279DE    mov         eax,dword ptr [ebx+4]
 000279E1    mov         eax,dword ptr [eax+10]
 000279E4    mov         ecx,ebx
 000279E6    mov         edx,esi
 000279E8    call        TList.Insert
 000279ED    pop         edi
 000279EE    pop         esi
 000279EF    pop         ebx
 000279F0    ret
*}
end;

//000279F4
procedure TComponent.SetDesigning(Value:Boolean);
begin
{*
 000279F4    push        ebx
 000279F5    push        esi
 000279F6    push        edi
 000279F7    push        ebp
 000279F8    mov         ebx,edx
 000279FA    mov         edi,eax
 000279FC    test        bl,bl
>000279FE    je          00027A06
 00027A00    or          byte ptr [edi+20],10
>00027A04    jmp         00027A0A
 00027A06    and         byte ptr [edi+20],0EF
 00027A0A    mov         eax,edi
 00027A0C    call        TComponent.GetComponentCount
 00027A11    mov         ebp,eax
 00027A13    dec         ebp
 00027A14    test        ebp,ebp
>00027A16    jl          00027A2F
 00027A18    inc         ebp
 00027A19    xor         esi,esi
 00027A1B    mov         edx,esi
 00027A1D    mov         eax,edi
 00027A1F    call        TComponent.GetComponent
 00027A24    mov         edx,ebx
 00027A26    call        TComponent.SetDesigning
 00027A2B    inc         esi
 00027A2C    dec         ebp
>00027A2D    jne         00027A1B
 00027A2F    pop         ebp
 00027A30    pop         edi
 00027A31    pop         esi
 00027A32    pop         ebx
 00027A33    ret
*}
end;

//00027A34
procedure TComponent.SetReference(Enable:Boolean);
begin
{*
 00027A34    push        ebx
 00027A35    push        esi
 00027A36    push        edi
 00027A37    add         esp,0FFFFFF00
 00027A3D    mov         ebx,edx
 00027A3F    mov         edi,eax
 00027A41    mov         esi,dword ptr [edi+4]
 00027A44    test        esi,esi
>00027A46    je          00027A70
 00027A48    mov         eax,esp
 00027A4A    mov         edx,dword ptr [edi+8]
 00027A4D    mov         ecx,0FF
 00027A52    call        @LStrToString
 00027A57    mov         edx,esp
 00027A59    mov         eax,esi
 00027A5B    call        TObject.FieldAddress
 00027A60    test        eax,eax
>00027A62    je          00027A70
 00027A64    test        bl,bl
>00027A66    je          00027A6C
 00027A68    mov         dword ptr [eax],edi
>00027A6A    jmp         00027A70
 00027A6C    xor         edx,edx
 00027A6E    mov         dword ptr [eax],edx
 00027A70    add         esp,100
 00027A76    pop         edi
 00027A77    pop         esi
 00027A78    pop         ebx
 00027A79    ret
*}
end;

//00027A7C
procedure TComponent.ExecuteAction(Action:TBasicAction);
begin
{*
 00027A7C    push        ebx
 00027A7D    push        esi
 00027A7E    mov         esi,edx
 00027A80    mov         ebx,eax
 00027A82    mov         edx,ebx
 00027A84    mov         eax,esi
 00027A86    mov         ecx,dword ptr [eax]
 00027A88    call        dword ptr [ecx+38]
 00027A8B    test        al,al
>00027A8D    je          00027A9D
 00027A8F    mov         edx,ebx
 00027A91    mov         eax,esi
 00027A93    mov         ecx,dword ptr [eax]
 00027A95    call        dword ptr [ecx+40]
 00027A98    mov         al,1
 00027A9A    pop         esi
 00027A9B    pop         ebx
 00027A9C    ret
 00027A9D    xor         eax,eax
 00027A9F    pop         esi
 00027AA0    pop         ebx
 00027AA1    ret
*}
end;

//00027AA4
procedure TComponent.UpdateAction(Action:TBasicAction);
begin
{*
 00027AA4    push        ebx
 00027AA5    push        esi
 00027AA6    mov         esi,edx
 00027AA8    mov         ebx,eax
 00027AAA    mov         edx,ebx
 00027AAC    mov         eax,esi
 00027AAE    mov         ecx,dword ptr [eax]
 00027AB0    call        dword ptr [ecx+38]
 00027AB3    test        al,al
>00027AB5    je          00027AC5
 00027AB7    mov         edx,ebx
 00027AB9    mov         eax,esi
 00027ABB    mov         ecx,dword ptr [eax]
 00027ABD    call        dword ptr [ecx+3C]
 00027AC0    mov         al,1
 00027AC2    pop         esi
 00027AC3    pop         ebx
 00027AC4    ret
 00027AC5    xor         eax,eax
 00027AC7    pop         esi
 00027AC8    pop         ebx
 00027AC9    ret
*}
end;

//00027ACC
function TComponent.SafeCallException(ExceptObject:TObject; ExceptAddr:Pointer):HRESULT;
begin
{*
 00027ACC    push        ebx
 00027ACD    cmp         dword ptr [eax+1C],0
>00027AD1    je          00027ADD
 00027AD3    mov         eax,dword ptr [eax+1C]
 00027AD6    mov         ebx,dword ptr [eax]
 00027AD8    call        dword ptr [ebx+1C]
 00027ADB    pop         ebx
 00027ADC    ret
 00027ADD    call        TObject.SafeCallException
 00027AE2    pop         ebx
 00027AE3    ret
*}
end;

//00027AE4
procedure sub_00027AE4;
begin
{*
 00027AE4    push        ebp
 00027AE5    mov         ebp,esp
 00027AE7    pop         ebp
 00027AE8    ret         4
*}
end;

//00027AEC
function TComponent.QueryInterface(const IID:TGUID; var Obj:Pointer):HRESULT; stdcall;
begin
{*
 00027AEC    push        ebp
 00027AED    mov         ebp,esp
 00027AEF    push        ebx
 00027AF0    push        esi
 00027AF1    push        edi
 00027AF2    mov         edi,dword ptr [ebp+10]
 00027AF5    mov         esi,dword ptr [ebp+0C]
 00027AF8    mov         ebx,dword ptr [ebp+8]
 00027AFB    cmp         dword ptr [ebx+1C],0
>00027AFF    jne         00027B1B
 00027B01    mov         ecx,edi
 00027B03    mov         edx,esi
 00027B05    mov         eax,ebx
 00027B07    call        TObject.GetInterface
 00027B0C    test        al,al
>00027B0E    je          00027B14
 00027B10    xor         eax,eax
>00027B12    jmp         00027B25
 00027B14    mov         eax,80004002
>00027B19    jmp         00027B25
 00027B1B    push        edi
 00027B1C    push        esi
 00027B1D    mov         eax,dword ptr [ebx+1C]
 00027B20    push        eax
 00027B21    mov         eax,dword ptr [eax]
 00027B23    call        dword ptr [eax]
 00027B25    pop         edi
 00027B26    pop         esi
 00027B27    pop         ebx
 00027B28    pop         ebp
 00027B29    ret         0C
*}
end;

//00027B2C
constructor TBasicActionLink.Create(AClient:TObject);
begin
{*
 00027B2C    push        ebx
 00027B2D    push        esi
 00027B2E    push        edi
 00027B2F    test        dl,dl
>00027B31    je          00027B3B
 00027B33    add         esp,0FFFFFFF0
 00027B36    call        @ClassCreate
 00027B3B    mov         esi,ecx
 00027B3D    mov         ebx,edx
 00027B3F    mov         edi,eax
 00027B41    xor         edx,edx
 00027B43    mov         eax,edi
 00027B45    call        TObject.Create
 00027B4A    mov         edx,esi
 00027B4C    mov         eax,edi
 00027B4E    mov         ecx,dword ptr [eax]
 00027B50    call        dword ptr [ecx]
 00027B52    mov         eax,edi
 00027B54    test        bl,bl
>00027B56    je          00027B67
 00027B58    call        @AfterConstruction
 00027B5D    pop         dword ptr fs:[0]
 00027B64    add         esp,0C
 00027B67    mov         eax,edi
 00027B69    pop         edi
 00027B6A    pop         esi
 00027B6B    pop         ebx
 00027B6C    ret
*}
end;

//00027B70
procedure sub_00027B70;
begin
{*
 00027B70    ret
*}
end;

//00027B74
destructor TBasicActionLink.Destroy;
begin
{*
 00027B74    push        ebx
 00027B75    push        esi
 00027B76    call        @BeforeDestruction
 00027B7B    mov         ebx,edx
 00027B7D    mov         esi,eax
 00027B7F    mov         eax,dword ptr [esi+0C]
 00027B82    test        eax,eax
>00027B84    je          00027B8D
 00027B86    mov         edx,esi
 00027B88    call        TBasicAction.UnRegisterChanges
 00027B8D    mov         edx,ebx
 00027B8F    and         dl,0FC
 00027B92    mov         eax,esi
 00027B94    call        TObject.Destroy
 00027B99    test        bl,bl
>00027B9B    jle         00027BA4
 00027B9D    mov         eax,esi
 00027B9F    call        @ClassDestroy
 00027BA4    pop         esi
 00027BA5    pop         ebx
 00027BA6    ret
*}
end;

//00027BA8
procedure TBasicActionLink.Change;
begin
{*
 00027BA8    push        ebx
 00027BA9    cmp         word ptr [eax+6],0
>00027BAE    je          00027BBB
 00027BB0    mov         ebx,eax
 00027BB2    mov         edx,dword ptr [eax+0C]
 00027BB5    mov         eax,dword ptr [ebx+8]
 00027BB8    call        dword ptr [ebx+4]
 00027BBB    pop         ebx
 00027BBC    ret
*}
end;

//00027BC0
procedure TBasicActionLink.Execute;
begin
{*
 00027BC0    push        ebx
 00027BC1    mov         eax,dword ptr [eax+0C]
 00027BC4    mov         bx,0FFF0
 00027BC8    call        @CallDynaInst
 00027BCD    pop         ebx
 00027BCE    ret
*}
end;

//00027BD0
procedure TBasicActionLink.SetAction(Value:TBasicAction);
begin
{*
 00027BD0    push        ebx
 00027BD1    push        esi
 00027BD2    mov         esi,edx
 00027BD4    mov         ebx,eax
 00027BD6    mov         eax,dword ptr [ebx+0C]
 00027BD9    cmp         esi,eax
>00027BDB    je          00027BF8
 00027BDD    test        eax,eax
>00027BDF    je          00027BE8
 00027BE1    mov         edx,ebx
 00027BE3    call        TBasicAction.UnRegisterChanges
 00027BE8    mov         dword ptr [ebx+0C],esi
 00027BEB    test        esi,esi
>00027BED    je          00027BF8
 00027BEF    mov         edx,ebx
 00027BF1    mov         eax,esi
 00027BF3    call        TBasicAction.RegisterChanges
 00027BF8    pop         esi
 00027BF9    pop         ebx
 00027BFA    ret
*}
end;

//00027BFC
function TBasicActionLink.IsOnExecuteLinked:Boolean;
begin
{*
 00027BFC    mov         al,1
 00027BFE    ret
*}
end;

//00027C00
procedure sub_00027C00;
begin
{*
 00027C00    push        ebp
 00027C01    mov         ebp,esp
 00027C03    pop         ebp
 00027C04    ret         8
*}
end;

//00027C08
function TBasicActionLink.Update:Boolean;
begin
{*
 00027C08    mov         eax,dword ptr [eax+0C]
 00027C0B    mov         edx,dword ptr [eax]
 00027C0D    call        dword ptr [edx+44]
 00027C10    ret
*}
end;

//00027C14
constructor TBasicAction.Create(AOwner:TComponent);
begin
{*
 00027C14    push        ebx
 00027C15    push        esi
 00027C16    test        dl,dl
>00027C18    je          00027C22
 00027C1A    add         esp,0FFFFFFF0
 00027C1D    call        @ClassCreate
 00027C22    mov         ebx,edx
 00027C24    mov         esi,eax
 00027C26    xor         edx,edx
 00027C28    mov         eax,esi
 00027C2A    call        TComponent.Create
 00027C2F    mov         dl,1
 00027C31    mov         eax,[0001EEC4];TList
 00027C36    call        TObject.Create
 00027C3B    mov         dword ptr [esi+3C],eax
 00027C3E    mov         eax,esi
 00027C40    test        bl,bl
>00027C42    je          00027C53
 00027C44    call        @AfterConstruction
 00027C49    pop         dword ptr fs:[0]
 00027C50    add         esp,0C
 00027C53    mov         eax,esi
 00027C55    pop         esi
 00027C56    pop         ebx
 00027C57    ret
*}
end;

//00027C58
destructor TBasicAction.Destroy;
begin
{*
 00027C58    push        ebx
 00027C59    push        esi
 00027C5A    push        edi
 00027C5B    call        @BeforeDestruction
 00027C60    mov         ebx,edx
 00027C62    mov         edi,eax
 00027C64    mov         edx,ebx
 00027C66    and         dl,0FC
 00027C69    mov         eax,edi
 00027C6B    call        TComponent.Destroy
>00027C70    jmp         00027C82
 00027C72    mov         eax,esi
 00027C74    call        TList.Last
 00027C79    mov         edx,eax
 00027C7B    mov         eax,edi
 00027C7D    call        TBasicAction.UnRegisterChanges
 00027C82    mov         esi,dword ptr [edi+3C]
 00027C85    cmp         dword ptr [esi+8],0
>00027C89    jg          00027C72
 00027C8B    mov         eax,dword ptr [edi+3C]
 00027C8E    call        TObject.Free
 00027C93    test        bl,bl
>00027C95    jle         00027C9E
 00027C97    mov         eax,edi
 00027C99    call        @ClassDestroy
 00027C9E    pop         edi
 00027C9F    pop         esi
 00027CA0    pop         ebx
 00027CA1    ret
*}
end;

//00027CA4
{*function sub_00027CA4:?;
begin
 00027CA4    xor         eax,eax
 00027CA6    ret
end;*}

//00027CA8
procedure sub_00027CA8;
begin
{*
 00027CA8    ret
*}
end;

//00027CAC
procedure sub_00027CAC;
begin
{*
 00027CAC    ret
*}
end;

//00027CB0
procedure TBasicAction.Execute;
begin
{*
 00027CB0    push        ebx
 00027CB1    cmp         word ptr [eax+2E],0
>00027CB6    je          00027CC6
 00027CB8    mov         ebx,eax
 00027CBA    mov         edx,eax
 00027CBC    mov         eax,dword ptr [ebx+30]
 00027CBF    call        dword ptr [ebx+2C]
 00027CC2    mov         al,1
 00027CC4    pop         ebx
 00027CC5    ret
 00027CC6    xor         eax,eax
 00027CC8    pop         ebx
 00027CC9    ret
*}
end;

//00027CCC
function TBasicAction.Update:Boolean;
begin
{*
 00027CCC    push        ebx
 00027CCD    cmp         word ptr [eax+36],0
>00027CD2    je          00027CE2
 00027CD4    mov         ebx,eax
 00027CD6    mov         edx,eax
 00027CD8    mov         eax,dword ptr [ebx+38]
 00027CDB    call        dword ptr [ebx+34]
 00027CDE    mov         al,1
 00027CE0    pop         ebx
 00027CE1    ret
 00027CE2    xor         eax,eax
 00027CE4    pop         ebx
 00027CE5    ret
*}
end;

//00027CE8
procedure TBasicAction.SetOnExecute(Value:TNotifyEvent);
begin
{*
 00027CE8    push        ebp
 00027CE9    mov         ebp,esp
 00027CEB    push        ebx
 00027CEC    push        esi
 00027CED    push        edi
 00027CEE    mov         ebx,eax
 00027CF0    mov         eax,dword ptr [ebp+8]
 00027CF3    cmp         eax,dword ptr [ebx+2C]
>00027CF6    je          00027D32
 00027CF8    mov         eax,dword ptr [ebx+3C]
 00027CFB    mov         esi,dword ptr [eax+8]
 00027CFE    dec         esi
 00027CFF    test        esi,esi
>00027D01    jl          00027D1F
 00027D03    inc         esi
 00027D04    xor         edi,edi
 00027D06    push        dword ptr [ebp+0C]
 00027D09    push        dword ptr [ebp+8]
 00027D0C    mov         edx,edi
 00027D0E    mov         eax,dword ptr [ebx+3C]
 00027D11    call        TList.Get
 00027D16    mov         edx,dword ptr [eax]
 00027D18    call        dword ptr [edx+10]
 00027D1B    inc         edi
 00027D1C    dec         esi
>00027D1D    jne         00027D06
 00027D1F    mov         eax,dword ptr [ebp+8]
 00027D22    mov         dword ptr [ebx+2C],eax
 00027D25    mov         eax,dword ptr [ebp+0C]
 00027D28    mov         dword ptr [ebx+30],eax
 00027D2B    mov         eax,ebx
 00027D2D    mov         edx,dword ptr [eax]
 00027D2F    call        dword ptr [edx+30]
 00027D32    pop         edi
 00027D33    pop         esi
 00027D34    pop         ebx
 00027D35    pop         ebp
 00027D36    ret         8
*}
end;

//00027D3C
procedure TBasicAction.Change;
begin
{*
 00027D3C    push        ebx
 00027D3D    cmp         word ptr [eax+26],0
>00027D42    je          00027D4E
 00027D44    mov         ebx,eax
 00027D46    mov         edx,eax
 00027D48    mov         eax,dword ptr [ebx+28]
 00027D4B    call        dword ptr [ebx+24]
 00027D4E    pop         ebx
 00027D4F    ret
*}
end;

//00027D50
procedure TBasicAction.RegisterChanges(Value:TBasicActionLink);
begin
{*
 00027D50    mov         dword ptr [edx+0C],eax
 00027D53    mov         eax,dword ptr [eax+3C]
 00027D56    call        TList.Add
 00027D5B    ret
*}
end;

//00027D5C
procedure TBasicAction.UnRegisterChanges(Value:TBasicActionLink);
begin
{*
 00027D5C    push        ebx
 00027D5D    push        esi
 00027D5E    push        edi
 00027D5F    push        ebp
 00027D60    mov         ebp,edx
 00027D62    mov         edi,eax
 00027D64    mov         eax,dword ptr [edi+3C]
 00027D67    mov         esi,dword ptr [eax+8]
 00027D6A    dec         esi
 00027D6B    test        esi,esi
>00027D6D    jl          00027D95
 00027D6F    inc         esi
 00027D70    xor         ebx,ebx
 00027D72    mov         eax,dword ptr [edi+3C]
 00027D75    mov         edx,ebx
 00027D77    call        TList.Get
 00027D7C    cmp         ebp,eax
>00027D7E    jne         00027D91
 00027D80    xor         eax,eax
 00027D82    mov         dword ptr [ebp+0C],eax
 00027D85    mov         eax,dword ptr [edi+3C]
 00027D88    mov         edx,ebx
 00027D8A    call        TList.Delete
>00027D8F    jmp         00027D95
 00027D91    inc         ebx
 00027D92    dec         esi
>00027D93    jne         00027D72
 00027D95    pop         ebp
 00027D96    pop         edi
 00027D97    pop         esi
 00027D98    pop         ebx
 00027D99    ret
*}
end;

//00027D9C
constructor TStreamAdapter.Create(Stream:TStream; Ownership:TStreamOwnership);
begin
{*
 00027D9C    push        ebp
 00027D9D    mov         ebp,esp
 00027D9F    push        ebx
 00027DA0    push        esi
 00027DA1    push        edi
 00027DA2    test        dl,dl
>00027DA4    je          00027DAE
 00027DA6    add         esp,0FFFFFFF0
 00027DA9    call        @ClassCreate
 00027DAE    mov         esi,ecx
 00027DB0    mov         ebx,edx
 00027DB2    mov         edi,eax
 00027DB4    xor         edx,edx
 00027DB6    mov         eax,edi
 00027DB8    call        TObject.Create
 00027DBD    mov         dword ptr [edi+0C],esi
 00027DC0    mov         al,byte ptr [ebp+8]
 00027DC3    mov         byte ptr [edi+10],al
 00027DC6    mov         eax,edi
 00027DC8    test        bl,bl
>00027DCA    je          00027DDB
 00027DCC    call        @AfterConstruction
 00027DD1    pop         dword ptr fs:[0]
 00027DD8    add         esp,0C
 00027DDB    mov         eax,edi
 00027DDD    pop         edi
 00027DDE    pop         esi
 00027DDF    pop         ebx
 00027DE0    pop         ebp
 00027DE1    ret         4
*}
end;

//00027DE4
destructor TStreamAdapter.Destroy;
begin
{*
 00027DE4    push        ebx
 00027DE5    push        esi
 00027DE6    call        @BeforeDestruction
 00027DEB    mov         ebx,edx
 00027DED    mov         esi,eax
 00027DEF    cmp         byte ptr [esi+10],1
>00027DF3    jne         00027E02
 00027DF5    mov         eax,dword ptr [esi+0C]
 00027DF8    call        TObject.Free
 00027DFD    xor         eax,eax
 00027DFF    mov         dword ptr [esi+0C],eax
 00027E02    mov         edx,ebx
 00027E04    and         dl,0FC
 00027E07    mov         eax,esi
 00027E09    call        TObject.Destroy
 00027E0E    test        bl,bl
>00027E10    jle         00027E19
 00027E12    mov         eax,esi
 00027E14    call        @ClassDestroy
 00027E19    pop         esi
 00027E1A    pop         ebx
 00027E1B    ret
*}
end;

//00027E1C
function TStreamAdapter.Read(pv:Pointer; cb:Longint; pcbRead:PLongint):HRESULT; stdcall;
begin
{*
 00027E1C    push        ebp
 00027E1D    mov         ebp,esp
 00027E1F    push        ebx
 00027E20    push        esi
 00027E21    push        edi
 00027E22    mov         edx,dword ptr [ebp+0C]
 00027E25    mov         eax,dword ptr [ebp+8]
 00027E28    xor         ecx,ecx
 00027E2A    push        ebp
 00027E2B    push        27E6B
 00027E30    push        dword ptr fs:[ecx]
 00027E33    mov         dword ptr fs:[ecx],esp
 00027E36    test        edx,edx
>00027E38    jne         00027E49
 00027E3A    mov         ebx,80030009
 00027E3F    xor         eax,eax
 00027E41    pop         edx
 00027E42    pop         ecx
 00027E43    pop         ecx
 00027E44    mov         dword ptr fs:[eax],edx
>00027E47    jmp         00027E7A
 00027E49    mov         eax,dword ptr [eax+0C]
 00027E4C    mov         ecx,dword ptr [ebp+10]
 00027E4F    mov         ebx,dword ptr [eax]
 00027E51    call        dword ptr [ebx+4]
 00027E54    cmp         dword ptr [ebp+14],0
>00027E58    je          00027E5F
 00027E5A    mov         edx,dword ptr [ebp+14]
 00027E5D    mov         dword ptr [edx],eax
 00027E5F    xor         ebx,ebx
 00027E61    xor         eax,eax
 00027E63    pop         edx
 00027E64    pop         ecx
 00027E65    pop         ecx
 00027E66    mov         dword ptr fs:[eax],edx
>00027E69    jmp         00027E7A
>00027E6B    jmp         @HandleAnyException
 00027E70    mov         ebx,1
 00027E75    call        @DoneExcept
 00027E7A    mov         eax,ebx
 00027E7C    pop         edi
 00027E7D    pop         esi
 00027E7E    pop         ebx
 00027E7F    pop         ebp
 00027E80    ret         10
*}
end;

//00027E84
function TStreamAdapter.Write(pv:Pointer; cb:Longint; pcbWritten:PLongint):HRESULT; stdcall;
begin
{*
 00027E84    push        ebp
 00027E85    mov         ebp,esp
 00027E87    push        ebx
 00027E88    push        esi
 00027E89    push        edi
 00027E8A    mov         edx,dword ptr [ebp+0C]
 00027E8D    mov         eax,dword ptr [ebp+8]
 00027E90    xor         ecx,ecx
 00027E92    push        ebp
 00027E93    push        27ED3
 00027E98    push        dword ptr fs:[ecx]
 00027E9B    mov         dword ptr fs:[ecx],esp
 00027E9E    test        edx,edx
>00027EA0    jne         00027EB1
 00027EA2    mov         ebx,80030009
 00027EA7    xor         eax,eax
 00027EA9    pop         edx
 00027EAA    pop         ecx
 00027EAB    pop         ecx
 00027EAC    mov         dword ptr fs:[eax],edx
>00027EAF    jmp         00027EE2
 00027EB1    mov         eax,dword ptr [eax+0C]
 00027EB4    mov         ecx,dword ptr [ebp+10]
 00027EB7    mov         ebx,dword ptr [eax]
 00027EB9    call        dword ptr [ebx+8]
 00027EBC    cmp         dword ptr [ebp+14],0
>00027EC0    je          00027EC7
 00027EC2    mov         edx,dword ptr [ebp+14]
 00027EC5    mov         dword ptr [edx],eax
 00027EC7    xor         ebx,ebx
 00027EC9    xor         eax,eax
 00027ECB    pop         edx
 00027ECC    pop         ecx
 00027ECD    pop         ecx
 00027ECE    mov         dword ptr fs:[eax],edx
>00027ED1    jmp         00027EE2
>00027ED3    jmp         @HandleAnyException
 00027ED8    mov         ebx,80030103
 00027EDD    call        @DoneExcept
 00027EE2    mov         eax,ebx
 00027EE4    pop         edi
 00027EE5    pop         esi
 00027EE6    pop         ebx
 00027EE7    pop         ebp
 00027EE8    ret         10
*}
end;

//00027EEC
function TStreamAdapter.Seek(dlibMove:Largeint; dwOrigin:Longint; var libNewPosition:Largeint):HRESULT; stdcall;
begin
{*
 00027EEC    push        ebp
 00027EED    mov         ebp,esp
 00027EEF    push        ebx
 00027EF0    push        esi
 00027EF1    push        edi
 00027EF2    mov         ecx,dword ptr [ebp+14]
 00027EF5    mov         ebx,dword ptr [ebp+8]
 00027EF8    xor         eax,eax
 00027EFA    push        ebp
 00027EFB    push        27F4B
 00027F00    push        dword ptr fs:[eax]
 00027F03    mov         dword ptr fs:[eax],esp
 00027F06    test        ecx,ecx
>00027F08    jl          00027F0F
 00027F0A    cmp         ecx,2
>00027F0D    jle         00027F1E
 00027F0F    mov         ebx,80030001
 00027F14    xor         eax,eax
 00027F16    pop         edx
 00027F17    pop         ecx
 00027F18    pop         ecx
 00027F19    mov         dword ptr fs:[eax],edx
>00027F1C    jmp         00027F5A
 00027F1E    mov         eax,dword ptr [ebp+0C]
 00027F21    mov         edx,eax
 00027F23    mov         eax,dword ptr [ebx+0C]
 00027F26    mov         ebx,dword ptr [eax]
 00027F28    call        dword ptr [ebx+0C]
 00027F2B    mov         ecx,eax
 00027F2D    mov         eax,dword ptr [ebp+18]
 00027F30    test        eax,eax
>00027F32    je          00027F3F
 00027F34    mov         eax,ecx
 00027F36    cdq
 00027F37    mov         ecx,dword ptr [ebp+18]
 00027F3A    mov         dword ptr [ecx],eax
 00027F3C    mov         dword ptr [ecx+4],edx
 00027F3F    xor         ebx,ebx
 00027F41    xor         eax,eax
 00027F43    pop         edx
 00027F44    pop         ecx
 00027F45    pop         ecx
 00027F46    mov         dword ptr fs:[eax],edx
>00027F49    jmp         00027F5A
>00027F4B    jmp         @HandleAnyException
 00027F50    mov         ebx,80030009
 00027F55    call        @DoneExcept
 00027F5A    mov         eax,ebx
 00027F5C    pop         edi
 00027F5D    pop         esi
 00027F5E    pop         ebx
 00027F5F    pop         ebp
 00027F60    ret         14
*}
end;

//00027F64
function TStreamAdapter.SetSize(libNewSize:Largeint):HRESULT; stdcall;
begin
{*
 00027F64    push        ebp
 00027F65    mov         ebp,esp
 00027F67    push        ebx
 00027F68    push        esi
 00027F69    push        edi
 00027F6A    mov         ebx,dword ptr [ebp+8]
 00027F6D    xor         eax,eax
 00027F6F    push        ebp
 00027F70    push        27FAD
 00027F75    push        dword ptr fs:[eax]
 00027F78    mov         dword ptr fs:[eax],esp
 00027F7B    mov         eax,dword ptr [ebp+0C]
 00027F7E    mov         edx,eax
 00027F80    mov         eax,dword ptr [ebx+0C]
 00027F83    mov         ecx,dword ptr [eax]
 00027F85    call        dword ptr [ecx]
 00027F87    mov         eax,dword ptr [ebx+0C]
 00027F8A    call        TStream.GetSize
 00027F8F    cdq
 00027F90    cmp         edx,dword ptr [ebp+10]
>00027F93    jne         00027F98
 00027F95    cmp         eax,dword ptr [ebp+0C]
>00027F98    je          00027FA1
 00027F9A    mov         ebx,80004005
>00027F9F    jmp         00027FA3
 00027FA1    xor         ebx,ebx
 00027FA3    xor         eax,eax
 00027FA5    pop         edx
 00027FA6    pop         ecx
 00027FA7    pop         ecx
 00027FA8    mov         dword ptr fs:[eax],edx
>00027FAB    jmp         00027FBC
>00027FAD    jmp         @HandleAnyException
 00027FB2    mov         ebx,8000FFFF
 00027FB7    call        @DoneExcept
 00027FBC    mov         eax,ebx
 00027FBE    pop         edi
 00027FBF    pop         esi
 00027FC0    pop         ebx
 00027FC1    pop         ebp
 00027FC2    ret         0C
*}
end;

//00027FC8
function TStreamAdapter.CopyTo(stm:IStream; cb:Largeint; var cbRead:Largeint; var cbWritten:Largeint):HRESULT; stdcall;
begin
{*
 00027FC8    push        ebp
 00027FC9    mov         ebp,esp
 00027FCB    add         esp,0FFFFFFF0
 00027FCE    push        ebx
 00027FCF    push        esi
 00027FD0    push        edi
 00027FD1    mov         ebx,dword ptr [ebp+18]
 00027FD4    mov         esi,dword ptr [ebp+8]
 00027FD7    mov         eax,dword ptr [ebp+0C]
 00027FDA    call        @IntfAddRef
 00027FDF    xor         eax,eax
 00027FE1    push        ebp
 00027FE2    push        280B8
 00027FE7    push        dword ptr fs:[eax]
 00027FEA    mov         dword ptr fs:[eax],esp
 00027FED    xor         eax,eax
 00027FEF    push        ebp
 00027FF0    push        28091
 00027FF5    push        dword ptr fs:[eax]
 00027FF8    mov         dword ptr fs:[eax],esp
 00027FFB    mov         eax,dword ptr [ebp+10]
 00027FFE    mov         dword ptr [ebp-0C],eax
 00028001    mov         eax,dword ptr [ebp-0C]
 00028004    call        @GetMem
 00028009    mov         dword ptr [ebp-8],eax
 0002800C    xor         eax,eax
 0002800E    push        ebp
 0002800F    push        28067
 00028014    push        dword ptr fs:[eax]
 00028017    mov         dword ptr fs:[eax],esp
 0002801A    mov         edx,dword ptr [ebp-8]
 0002801D    mov         eax,dword ptr [esi+0C]
 00028020    mov         ecx,dword ptr [ebp-0C]
 00028023    mov         esi,dword ptr [eax]
 00028025    call        dword ptr [esi+4]
 00028028    mov         ecx,eax
 0002802A    test        ebx,ebx
>0002802C    je          00028036
 0002802E    mov         eax,ecx
 00028030    cdq
 00028031    mov         dword ptr [ebx],eax
 00028033    mov         dword ptr [ebx+4],edx
 00028036    lea         eax,[ebp-10]
 00028039    push        eax
 0002803A    mov         eax,dword ptr [ebp-0C]
 0002803D    push        eax
 0002803E    mov         eax,dword ptr [ebp-8]
 00028041    push        eax
 00028042    mov         eax,dword ptr [ebp+0C]
 00028045    push        eax
 00028046    mov         eax,dword ptr [eax]
 00028048    call        dword ptr [eax+10]
 0002804B    mov         dword ptr [ebp-4],eax
 0002804E    xor         eax,eax
 00028050    pop         edx
 00028051    pop         ecx
 00028052    pop         ecx
 00028053    mov         dword ptr fs:[eax],edx
 00028056    push        2806E
 0002805B    mov         edx,dword ptr [ebp-0C]
 0002805E    mov         eax,dword ptr [ebp-8]
 00028061    call        @FreeMem
 00028066    ret
>00028067    jmp         @HandleFinally
>0002806C    jmp         0002805B
 0002806E    cmp         dword ptr [ebp-4],0
>00028072    jne         00028087
 00028074    mov         eax,dword ptr [ebp+1C]
 00028077    test        eax,eax
>00028079    je          00028087
 0002807B    mov         eax,dword ptr [ebp-10]
 0002807E    cdq
 0002807F    mov         ecx,dword ptr [ebp+1C]
 00028082    mov         dword ptr [ecx],eax
 00028084    mov         dword ptr [ecx+4],edx
 00028087    xor         eax,eax
 00028089    pop         edx
 0002808A    pop         ecx
 0002808B    pop         ecx
 0002808C    mov         dword ptr fs:[eax],edx
>0002808F    jmp         000280A2
>00028091    jmp         @HandleAnyException
 00028096    mov         dword ptr [ebp-4],8000FFFF
 0002809D    call        @DoneExcept
 000280A2    xor         eax,eax
 000280A4    pop         edx
 000280A5    pop         ecx
 000280A6    pop         ecx
 000280A7    mov         dword ptr fs:[eax],edx
 000280AA    push        280BF
 000280AF    lea         eax,[ebp+0C]
 000280B2    call        @IntfClear
 000280B7    ret
>000280B8    jmp         @HandleFinally
>000280BD    jmp         000280AF
 000280BF    mov         eax,dword ptr [ebp-4]
 000280C2    pop         edi
 000280C3    pop         esi
 000280C4    pop         ebx
 000280C5    mov         esp,ebp
 000280C7    pop         ebp
 000280C8    ret         18
*}
end;

//000280CC
function TStreamAdapter.Commit(grfCommitFlags:Longint):HRESULT; stdcall;
begin
{*
 000280CC    push        ebp
 000280CD    mov         ebp,esp
 000280CF    xor         eax,eax
 000280D1    pop         ebp
 000280D2    ret         8
*}
end;

//000280D8
function TStreamAdapter.Revert:HRESULT; stdcall;
begin
{*
 000280D8    push        ebp
 000280D9    mov         ebp,esp
 000280DB    mov         eax,80030102
 000280E0    pop         ebp
 000280E1    ret         4
*}
end;

//000280E4
function TStreamAdapter.LockRegion(libOffset:Largeint; cb:Largeint; dwLockType:Longint):HRESULT; stdcall;
begin
{*
 000280E4    push        ebp
 000280E5    mov         ebp,esp
 000280E7    mov         eax,80030001
 000280EC    pop         ebp
 000280ED    ret         18
*}
end;

//000280F0
function TStreamAdapter.UnlockRegion(libOffset:Largeint; cb:Largeint; dwLockType:Longint):HRESULT; stdcall;
begin
{*
 000280F0    push        ebp
 000280F1    mov         ebp,esp
 000280F3    mov         eax,80030001
 000280F8    pop         ebp
 000280F9    ret         18
*}
end;

//000280FC
function TStreamAdapter.Stat(var statstg:TStatStg; grfStatFlag:Longint):HRESULT; stdcall;
begin
{*
 000280FC    push        ebp
 000280FD    mov         ebp,esp
 000280FF    push        ebx
 00028100    push        esi
 00028101    push        edi
 00028102    mov         ebx,dword ptr [ebp+0C]
 00028105    mov         edi,dword ptr [ebp+8]
 00028108    xor         esi,esi
 0002810A    xor         eax,eax
 0002810C    push        ebp
 0002810D    push        28161
 00028112    push        dword ptr fs:[eax]
 00028115    mov         dword ptr fs:[eax],esp
 00028118    test        ebx,ebx
>0002811A    je          00028157
 0002811C    mov         dword ptr [ebx+4],2
 00028123    mov         eax,dword ptr [edi+0C]
 00028126    call        TStream.GetSize
 0002812B    cdq
 0002812C    mov         dword ptr [ebx+8],eax
 0002812F    mov         dword ptr [ebx+0C],edx
 00028132    xor         eax,eax
 00028134    mov         dword ptr [ebx+10],eax
 00028137    xor         eax,eax
 00028139    mov         dword ptr [ebx+14],eax
 0002813C    xor         eax,eax
 0002813E    mov         dword ptr [ebx+18],eax
 00028141    xor         eax,eax
 00028143    mov         dword ptr [ebx+1C],eax
 00028146    xor         eax,eax
 00028148    mov         dword ptr [ebx+20],eax
 0002814B    xor         eax,eax
 0002814D    mov         dword ptr [ebx+24],eax
 00028150    mov         dword ptr [ebx+2C],1
 00028157    xor         eax,eax
 00028159    pop         edx
 0002815A    pop         ecx
 0002815B    pop         ecx
 0002815C    mov         dword ptr fs:[eax],edx
>0002815F    jmp         00028170
>00028161    jmp         @HandleAnyException
 00028166    mov         esi,8000FFFF
 0002816B    call        @DoneExcept
 00028170    mov         eax,esi
 00028172    pop         edi
 00028173    pop         esi
 00028174    pop         ebx
 00028175    pop         ebp
 00028176    ret         0C
*}
end;

//0002817C
function TStreamAdapter.Clone(var stm:IStream):HRESULT; stdcall;
begin
{*
 0002817C    push        ebp
 0002817D    mov         ebp,esp
 0002817F    mov         eax,dword ptr [ebp+0C]
 00028182    test        eax,eax
>00028184    je          0002818A
 00028186    xor         edx,edx
 00028188    mov         dword ptr [eax],edx
 0002818A    mov         eax,80004001
 0002818F    pop         ebp
 00028190    ret         8
*}
end;

//00028194
procedure FreeIntConstList;
begin
{*
 00028194    push        ebp
 00028195    mov         ebp,esp
 00028197    push        ebx
 00028198    push        esi
 00028199    push        edi
 0002819A    mov         eax,[000B6628]
 0002819F    call        TThreadList.LockList
 000281A4    mov         edi,eax
 000281A6    xor         eax,eax
 000281A8    push        ebp
 000281A9    push        281E9
 000281AE    push        dword ptr fs:[eax]
 000281B1    mov         dword ptr fs:[eax],esp
 000281B4    mov         ebx,dword ptr [edi+8]
 000281B7    dec         ebx
 000281B8    test        ebx,ebx
>000281BA    jl          000281D1
 000281BC    inc         ebx
 000281BD    xor         esi,esi
 000281BF    mov         edx,esi
 000281C1    mov         eax,edi
 000281C3    call        TList.Get
 000281C8    call        TObject.Free
 000281CD    inc         esi
 000281CE    dec         ebx
>000281CF    jne         000281BF
 000281D1    xor         eax,eax
 000281D3    pop         edx
 000281D4    pop         ecx
 000281D5    pop         ecx
 000281D6    mov         dword ptr fs:[eax],edx
 000281D9    push        281F0
 000281DE    mov         eax,[000B6628]
 000281E3    call        TThreadList.UnlockList
 000281E8    ret
>000281E9    jmp         @HandleFinally
>000281EE    jmp         000281DE
 000281F0    mov         eax,[000B6628]
 000281F5    call        TObject.Free
 000281FA    pop         edi
 000281FB    pop         esi
 000281FC    pop         ebx
 000281FD    pop         ebp
 000281FE    ret
*}
end;

//00028200
procedure ModuleUnload(Instance:Longint);
begin
{*
 00028200    call        UnRegisterModuleClasses
 00028205    ret
*}
end;

Initialization
//000282B4
{*
 000282B4    sub         dword ptr ds:[0B661C],1
>000282BB    jae         0002831C
 000282BD    mov         eax,28200;ModuleUnload
 000282C2    call        AddModuleUnloadProc
 000282C7    mov         dl,1
 000282C9    mov         eax,[00018104];TMultiReadExclusiveWriteSynchronizer
 000282CE    call        TMultiReadExclusiveWriteSynchronizer.Create
 000282D3    mov         [000B6614],eax
 000282D8    mov         dl,1
 000282DA    mov         eax,[0001EF28];TThreadList
 000282DF    call        TThreadList.Create
 000282E4    mov         [000B6620],eax
 000282E9    mov         dl,1
 000282EB    mov         eax,[0001F340];TStringList
 000282F0    call        TObject.Create
 000282F5    mov         [000B6624],eax
 000282FA    mov         dl,1
 000282FC    mov         eax,[0001EF28];TThreadList
 00028301    call        TThreadList.Create
 00028306    mov         [000B6628],eax
 0002830B    mov         dl,1
 0002830D    mov         eax,[0001EF28];TThreadList
 00028312    call        TThreadList.Create
 00028317    mov         [000B662C],eax
 0002831C    ret
*}
Finalization
//00028208
{*
 00028208    push        ebp
 00028209    mov         ebp,esp
 0002820B    xor         eax,eax
 0002820D    push        ebp
 0002820E    push        282A8
 00028213    push        dword ptr fs:[eax]
 00028216    mov         dword ptr fs:[eax],esp
 00028219    inc         dword ptr ds:[0B661C]
>0002821F    jne         0002829A
 00028221    mov         eax,[000B5950];^HInstance:Longword
 00028226    mov         eax,dword ptr [eax]
 00028228    call        UnRegisterModuleClasses
 0002822D    mov         eax,[000B6614]
 00028232    call        TMultiReadExclusiveWriteSynchronizer.BeginWrite
 00028237    call        FreeIntConstList
 0002823C    mov         eax,[000B6620]
 00028241    call        TObject.Free
 00028246    mov         eax,[000B6624]
 0002824B    call        TObject.Free
 00028250    xor         edx,edx
 00028252    xor         eax,eax
 00028254    call        RemoveFixupReferences
 00028259    mov         eax,[000B662C]
 0002825E    call        TObject.Free
 00028263    xor         eax,eax
 00028265    mov         [000B662C],eax
 0002826A    call        @GetTls
 0002826F    mov         eax,dword ptr [eax+0C];{GlobalLists:TList}
 00028275    call        TObject.Free
 0002827A    call        FreeThreadWindow
 0002827F    mov         eax,[000B6614]
 00028284    call        TObject.Free
 00028289    xor         eax,eax
 0002828B    mov         [000B6614],eax
 00028290    mov         eax,28200;ModuleUnload
 00028295    call        RemoveModuleUnloadProc
 0002829A    xor         eax,eax
 0002829C    pop         edx
 0002829D    pop         ecx
 0002829E    pop         ecx
 0002829F    mov         dword ptr fs:[eax],edx
 000282A2    push        282AF
 000282A7    ret
>000282A8    jmp         @HandleFinally
>000282AD    jmp         000282A7
 000282AF    pop         ebp
 000282B0    ret
*}
end.