//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit Graphics;

interface

uses
  SysUtils, Classes, ComCtrls, Graphics, Cmbtn40;

type
  EInvalidGraphic = class(Exception)
  end;
  EInvalidGraphicOperation = class(Exception)
  end;
  TFontPitch = (fpDefault, fpVariable, fpFixed);
  TFontStyle = (fsBold, fsItalic, fsUnderline, fsStrikeOut);
  TFontStyles = set of TFontStyle;
  TPenStyle = (psSolid, psDash, psDot, psDashDot, psDashDotDot, psClear, psInsideFrame);
  TPenMode = (pmBlack, pmWhite, pmNop, pmNot, pmCopy, pmNotCopy, pmMergePenNot, pmMaskPenNot, pmMergeNotPen, pmMaskNotPen, pmMerge, pmNotMerge, pmMask, pmNotMask, pmXor, pmNotXor);
  TBrushStyle = (bsSolid, bsClear, bsHorizontal, bsVertical, bsFDiagonal, bsBDiagonal, bsCross, bsDiagCross);
  TGraphicsObject = class(TPersistent)
  public
    FOnChange:TNotifyEvent;//f4
    f8:TCustomListView;//f8
    FResource:PResource;//fC
    FOwnerLock:PRTLCriticalSection;//f10
    procedure Changed; dynamic;//00029A18
    procedure Lock;//00029A2C
    procedure Unlock;//00029A3C
  end;
  TFont = class(TGraphicsObject)
  public
    Color:TColor;//f14
    FPixelsPerInch:Integer;//f18
    FNotify:IChangeNotifier;//f1C
    procedure Assign(Source:TPersistent); virtual;//v8//00029D6C
    procedure Changed; dynamic;//00029D50
    constructor Create;//00029CD4
    procedure GetData(var FontData:TFontData);//00029E40
    procedure SetData(const FontData:TFontData);//00029E58
    procedure SetColor(Value:TColor);//00029EA8
    function GetHandle:HFONT;//00029EBC
    procedure SetHandle(Value:HFONT);//0002A058
    function GetHeight:Integer;//0002A07C
    procedure SetHeight(Value:Integer);//0002A084
    function GetName:TFontName;//0002A0AC
    procedure SetName(const Value:TFontName);//0002A0C4
    function GetSize:Integer;//0002A120
    procedure SetSize(Value:Integer);//0002A13C
    function GetStyle:TFontStyles;//0002A15C
    procedure SetStyle(Value:TFontStyles);//0002A168
    function GetPitch:TFontPitch;//0002A194
    procedure SetPitch(Value:TFontPitch);//0002A19C
    //function GetCharset:?;//0002A1C4
    procedure SetCharset(Value:TFontCharset);//0002A1CC
  end;
  TPen = class(TGraphicsObject)
  public
    Mode:TPenMode;//f14
    procedure Assign(Source:TPersistent); virtual;//v8//0002A260
    constructor Create;//0002A1F4
    procedure GetData(var PenData:TPenData);//0002A318
    function GetColor:TColor;//0002A380
    procedure SetColor(Value:TColor);//0002A388
    function GetHandle:HPEN;//0002A3B0
    procedure SetMode(Value:TPenMode);//0002A46C
    function GetStyle:TPenStyle;//0002A480
    procedure SetStyle(Value:TPenStyle);//0002A488
    function GetWidth:Integer;//0002A4B0
    procedure SetWidth(Value:Integer);//0002A4B8
    procedure SetData(const PenData:TPenData);//0002A614
  end;
  TBrush = class(TGraphicsObject)
  public
    procedure Assign(Source:TPersistent); virtual;//v8//0002A54C
    procedure SetData(const BrushData:TBrushData);//0002A330
    procedure SetHandle(Value:HBRUSH);//0002A448
    constructor Create;//0002A4E4
    procedure GetData(var BrushData:TBrushData);//0002A5F4
    procedure SetBitmap(Value:TBitmap);//0002A664
    function GetColor:TColor;//0002A688
    procedure SetColor(Value:TColor);//0002A690
    function GetHandle:HBRUSH;//0002A6C4
    function GetStyle:TBrushStyle;//0002A7A4
    procedure SetStyle(Value:TBrushStyle);//0002A7AC
  end;
  TCanvas = class(TPersistent)
  public
    FHandle:HDC;//f4
    State:TCanvasState;//f8
    Font:TFont;//fC
    Pen:TPen;//f10
    Brush:TBrush;//f14
    FPenPos:TPoint;//f18
    CopyMode:Integer;//f20
    FOnChange:TNotifyEvent;//f24
    FOnChanging:TNotifyEvent;//f2C
    FLock:TRTLCriticalSection;//f34
    FLockCount:Integer;//f4C
    FTextFlags:Longint;//f50
    destructor Destroy; virtual;//0002A8A4
    procedure Changed; virtual;//vC//0002B4A4
    procedure Changing; virtual;//v10//0002B490
    procedure CreateHandle; virtual;//v14//0002B370
    constructor Create;//0002A7E0
    procedure BrushCopy(const Dest:TRect; Bitmap:TBitmap; const Source:TRect; Color:TColor);//0002A900
    procedure CopyRect(const Dest:TRect; Canvas:TCanvas; const Source:TRect);//0002ABC0
    procedure Draw(X:Integer; Y:Integer; Graphic:TGraphic);//0002AC48
    procedure DrawFocusRect(const Rect:TRect);//0002ACF4
    procedure Ellipse(X1:Integer; Y1:Integer; X2:Integer; Y2:Integer);//0002AD28
    procedure FillRect(const Rect:TRect);//0002AD70
    procedure FrameRect(const Rect:TRect);//0002ADAC
    procedure LineTo(X:Integer; Y:Integer);//0002ADE8
    procedure Lock;//0002AE20
    procedure MoveTo(X:Integer; Y:Integer);//0002AE48
    procedure Pie(X1:Integer; Y1:Integer; X2:Integer; Y2:Integer; X3:Integer; Y3:Integer; X4:Integer; Y4:Integer);//0002AE74
    procedure Polyline(const Points:array[$0..-$1] of Windows.TPoint; const _Dv_:$0..-$1);//0002AECC
    procedure Rectangle(X1:Integer; Y1:Integer; X2:Integer; Y2:Integer);//0002AF04
    procedure Refresh;//0002AF4C
    procedure StretchDraw(const Rect:TRect; Graphic:TGraphic);//0002AF54
    function GetCanvasOrientation:TCanvasOrientation;//0002AF90
    procedure TextOut(X:Integer; Y:Integer; const Text:AnsiString);//0002AFBC
    procedure TextRect(Rect:TRect; X:Integer; Y:Integer; const Text:AnsiString);//0002B048
    function TextExtent(const Text:AnsiString):TSize;//0002B0EC
    function TextWidth(const Text:AnsiString):Integer;//0002B130
    function TextHeight(const Text:AnsiString):Integer;//0002B14C
    function TryLock:Boolean;//0002B16C
    procedure Unlock;//0002B1C8
    procedure SetFont(Value:TFont);//0002B1F0
    procedure SetPen(Value:TPen);//0002B200
    procedure SetBrush(Value:TBrush);//0002B20C
    function GetPenPos:TPoint;//0002B218
    procedure SetPenPos(Value:TPoint);//0002B23C
    function GetPixel(X:Integer; Y:Integer):TColor;//0002B25C
    procedure SetPixel(X:Integer; Y:Integer; Value:TColor);//0002B288
    function GetClipRect:TRect;//0002B2D0
    function GetHandle:HDC;//0002B2F4
    procedure DeselectHandles;//0002B314
    procedure SetHandle(Value:HDC);//0002B374
    procedure RequiredState(ReqState:TCanvasState);//0002B41C
    procedure CreateFont;//0002B4B8
    procedure CreatePen;//0002B4E4
    procedure CreateBrush;//0002B514
    procedure FontChanged(AFont:TObject);//0002B590
    procedure PenChanged(APen:TObject);//0002B5B0
    procedure BrushChanged(ABrush:TObject);//0002B5D0
  end;
  TProgressEvent = procedure(Sender:TObject; Stage:TProgressStage; PercentDone:Byte; RedrawNow:Boolean; const R:TRect; const Msg:String) of object;;
  TGraphic = class(TPersistent)
  public
    FOnChange:TNotifyEvent;//f4
    f8:TCMBtn;//f8
    FOnProgress:TProgressEvent;//fC
    FModified:Boolean;//f14
    FTransparent:Boolean;//f15
    FPaletteModified:Boolean;//f16
    procedure DefineProperties(Filer:TFiler); virtual;//v4//0002C92C
    constructor Create; virtual;//vC//0002C884
    procedure Changed(Sender:TObject); virtual;//v10//0002C8BC
    procedure Draw; virtual; abstract;//v14//000129A8
    function Equals(Graphic:TGraphic):Boolean; virtual;//v18//0002C978
    procedure GetEmpty; virtual; abstract;//v1C//000129A8
    procedure GetHeight; virtual; abstract;//v20//000129A8
    //function v24:?; virtual;//v24//0002CABC
    //function v28:?; virtual;//v28//0002CAC0
    procedure GetWidth; virtual; abstract;//v2C//000129A8
    procedure ReadData(Stream:TStream); virtual;//v30//0002CB40
    procedure SetHeight; virtual; abstract;//v34//000129A8
    procedure v38; virtual;//v38//0002CBA4
    procedure SetTransparent(Value:Boolean); virtual;//v3C//0002CBA8
    procedure SetWidth; virtual; abstract;//v40//000129A8
    procedure WriteData(Stream:TStream); virtual;//v44//0002CBB8
    //procedure v48(?:?); virtual;//v48//0002CAC4
    procedure SaveToFile(const Filename:AnsiString); virtual;//v4C//0002CB4C
    procedure LoadFromStream; virtual; abstract;//v50//000129A8
    procedure SaveToStream; virtual; abstract;//v54//000129A8
    procedure LoadFromClipboardFormat; virtual; abstract;//v58//000129A8
    procedure SaveToClipboardFormat; virtual; abstract;//v5C//000129A8
    procedure Progress(Sender:TObject; Stage:TProgressStage; PercentDone:Byte; RedrawNow:Boolean; const R:TRect; const Msg:AnsiString); dynamic;//0002CB18
  end;
  TPicture = class(TPersistent)
  public
    FGraphic:TGraphic;//f4
    FOnChange:TNotifyEvent;//f8
    FNotify:IChangeNotifier;//f10
    FOnProgress:TProgressEvent;//f14
    destructor Destroy; virtual;//0002D120
    procedure AssignTo(Dest:TPersistent); virtual;//v0//0002D150
    procedure DefineProperties(Filer:TFiler); virtual;//v4//0002D6A4
    procedure Assign(Source:TPersistent); virtual;//v8//0002D40C
    procedure Progress(Sender:TObject; Stage:TProgressStage; PercentDone:Byte; RedrawNow:Boolean; const R:TRect; const Msg:AnsiString); dynamic;//0002D48C
    procedure Changed(Sender:TObject); dynamic;//0002D468
    constructor Create;//0002D0E0
    procedure ForceType(GraphicType:TGraphicClass);//0002D184
    function GetBitmap:TBitmap;//0002D1E8
    function GetIcon:TIcon;//0002D200
    procedure SetGraphic(Value:TGraphic);//0002D218
    procedure LoadFromClipboardFormat(AFormat:Word; AData:THandle; APalette:HPALETTE);//0002D2C8
    procedure SaveToClipboardFormat(var AFormat:Word; var AData:THandle; var APalette:HPALETTE);//0002D3C8
    function SupportsClipboardFormat(AFormat:Word):Boolean;//0002D3F4
    procedure ReadData(Stream:TStream);//0002D4B4
    procedure WriteData(Stream:TStream);//0002D5CC
    function GetWidth:Integer;//0002D6F0
    function GetHeight:Integer;//0002D708
  end;
  TSharedImage = class(TObject)
  public
    FRefCount:Integer;//f4
    procedure FreeHandle; virtual; abstract;//v0//000129A8
    procedure Reference;//0002E8C0
    procedure Release;//0002E8C4
  end;
  TMetafileImage = class(TSharedImage)
  public
    FHandle:THandle;//f8
    FWidth:Integer;//fC
    FHeight:Integer;//f10
    FPalette:HPALETTE;//f14
    FInch:Word;//f18
    FTempWidth:Integer;//f1C
    FTempHeight:Integer;//f20
    destructor Destroy; virtual;//0002D720
    procedure FreeHandle; virtual;//v0//0002D75C
  end;
  TMetafile = class(TGraphic)
  public
    FImage:TMetafileImage;//f18
    FEnhanced:Boolean;//f1C
    destructor Destroy; virtual;//0002D7A8
    procedure Assign(Source:TPersistent); virtual;//v8//0002D7D8
    constructor Create; virtual;//vC//0002D760
    procedure Draw(ACanvas:TCanvas; const Rect:TRect); virtual;//v14//0002D86C
    function GetEmpty:Boolean; virtual;//v1C//0002D9E8
    function GetHeight:Integer; virtual;//v20//0002D9F0
    function GetPalette:HPALETTE; virtual;//v24//0002DA84
    function GetWidth:Integer; virtual;//v2C//0002DB10
    procedure ReadData(Stream:TStream); virtual;//v30//0002DBF0
    procedure SetHeight(Value:Integer); virtual;//v34//0002DF7C
    procedure SetTransparent(Value:Boolean); virtual;//v3C//0002E068
    procedure SetWidth(Value:Integer); virtual;//v40//0002E06C
    procedure WriteData(Stream:TStream); virtual;//v44//0002E1C4
    procedure SaveToFile(const Filename:AnsiString); virtual;//v4C//0002DE44
    procedure LoadFromStream(Stream:TStream); virtual;//v50//0002DB74
    procedure SaveToStream(Stream:TStream); virtual;//v54//0002DED0
    procedure LoadFromClipboardFormat(AFormat:Word; AData:THandle; APalette:HPALETTE); virtual;//v58//0002E414
    procedure SaveToClipboardFormat(var AFormat:Word; var AData:THandle; var APalette:HPALETTE); virtual;//v5C//0002E4D4
    function GetAuthor:AnsiString;//0002D900
    function GetDesc:AnsiString;//0002D968
    function GetMMHeight:Integer;//0002DA54
    function GetMMWidth:Integer;//0002DA6C
    procedure NewImage;//0002DBC8
    procedure ReadEMFStream(Stream:TStream);//0002DC4C
    procedure ReadWMFStream(Stream:TStream; Length:Longint);//0002DD1C
    procedure SetHandle(Value:THandle);//0002DEEC
    procedure SetMMHeight(Value:Integer);//0002DFF0
    procedure SetMMWidth(Value:Integer);//0002E02C
    function TestEMF(Stream:TStream):Boolean;//0002E0E0
    procedure UniqueImage;//0002E140
    procedure WriteEMFStream(Stream:TStream);//0002E248
    procedure WriteWMFStream(Stream:TStream);//0002E2CC
  end;
  TBitmapImage = class(TSharedImage)
  public
    FHandle:HBITMAP;//f8
    FMaskHandle:HBITMAP;//fC
    FPalette:HPALETTE;//f10
    FDIBHandle:HBITMAP;//f14
    FDIB:TDIBSection;//f18
    FOS2Format:Boolean;//f6C
    FHalftone:Boolean;//f6D
    destructor Destroy; virtual;//0002E8E4
    procedure FreeHandle; virtual;//v0//0002E938
  end;
  TBitmap = class(TGraphic)
  public
    FImage:TBitmapImage;//f18
    FCanvas:TCanvas;//f1C
    FIgnorePalette:Boolean;//f20
    FMaskBitsValid:Boolean;//f21
    FMaskValid:Boolean;//f22
    FTransparentColor:TColor;//f24
    FTransparentMode:TTransparentMode;//f28
    destructor Destroy; virtual;//0002F394
    procedure Assign(Source:TPersistent); virtual;//v8//0002F3D0
    constructor Create; virtual;//vC//0002F32C
    procedure Changed(Sender:TObject); virtual;//v10//0002F584
    procedure Draw(ACanvas:TCanvas; const Rect:TRect); virtual;//v14//0002F5AC
    function GetEmpty:Boolean; virtual;//v1C//0002F84C
    function GetHeight:Integer; virtual;//v20//0002F8F4
    function GetPalette:HPALETTE; virtual;//v24//0002F934
    //function GetWidth:?; virtual;//v2C//0002F990
    procedure ReadData(Stream:TStream); virtual;//v30//0002FE54
    procedure SetHeight(Value:Integer); virtual;//v34//0003052C
    procedure SetPalette(Value:HPALETTE); virtual;//v38//00030600
    procedure SetWidth(Value:Integer); virtual;//v40//00030724
    procedure WriteData(Stream:TStream); virtual;//v44//00030778
    procedure LoadFromStream(Stream:TStream); virtual;//v50//0002FCE4
    procedure SaveToStream(Stream:TStream); virtual;//v54//000309D4
    procedure LoadFromClipboardFormat(AFormat:Word; AData:THandle; APalette:HPALETTE); virtual;//v58//0002FC24
    procedure SaveToClipboardFormat(var Format:Word; var Data:THandle; var APalette:HPALETTE); virtual;//v5C//000309DC
    function GetHandle:HBITMAP; virtual;//v60//0002F8A4
    function GetMaskHandle:HBITMAP; virtual;//v64//0002F904
    procedure SetHandleType(Value:TBitmapHandleType); virtual;//v68//000303F8
    procedure CopyImage(AHandle:HBITMAP; APalette:HPALETTE; DIB:TDIBSection);//0002F4C0
    procedure Changing(Sender:TObject);//0002F57C
    procedure Dormant;//0002F590
    procedure FreeImage;//0002F7FC
    function GetCanvas:TCanvas;//0002F864
    function GetHandleType:TBitmapHandleType;//0002F8C8
    function GetMonochrome:Boolean;//0002F918
    function GetTransparentColor:TColor;//0002F948
    procedure DIBNeeded;//0002F998
    procedure FreeContext;//0002FA0C
    procedure HandleNeeded;//0002FA1C
    procedure Mask(TransparentColor:TColor);//0002FA2C
    procedure MaskHandleNeeded;//0002FB0C
    procedure PaletteNeeded;//0002FB6C
    procedure LoadFromResourceName(Instance:THandle; const ResName:AnsiString);//0002FD08
    procedure NewImage(NewHandle:HBITMAP; NewPalette:HPALETTE; const NewDIB:TDIBSection; OS2Format:Boolean);//0002FD68
    procedure ReadDIB(Stream:TStream; ImageSize:Longword);//0002FE7C
    procedure ReadStream(Stream:TStream; Size:Longint);//000302CC
    procedure SetHandle(Value:HBITMAP);//00030338
    procedure SetMonochrome(Value:Boolean);//00030580
    procedure SetTransparentColor(Value:TColor);//000306D4
    procedure WriteStream(Stream:TStream; WriteSize:Boolean);//00030780
  end;
  TIconImage = class(TSharedImage)
  public
    FHandle:HICON;//f8
    FMemoryImage:TCustomMemoryStream;//fC
    destructor Destroy; virtual;//00030A7C
    procedure FreeHandle; virtual;//v0//00030AAC
  end;
  TIcon = class(TGraphic)
  public
    .FImage:TIconImage;//f18
    destructor Destroy; virtual;//00030B18
    procedure Assign(Source:TPersistent); virtual;//v8//00030B48
    constructor Create; virtual;//vC//00030AC4
    procedure Draw(ACanvas:TCanvas; const Rect:TRect); virtual;//v14//00030BA8
    function GetEmpty:Boolean; virtual;//v1C//00030BE0
    function GetHeight:Integer; virtual;//v20//00030C0C
    function GetWidth:Integer; virtual;//v2C//00030C14
    procedure SetHeight(Value:Integer); virtual;//v34//00030E80
    procedure SetTransparent(Value:Boolean); virtual;//v3C//00030EC8
    procedure SetWidth(Value:Integer); virtual;//v40//00030ECC
    procedure LoadFromStream(Stream:TStream); virtual;//v50//00030D3C
    procedure SaveToStream(Stream:TStream); virtual;//v54//00030F14
    procedure LoadFromClipboardFormat(AFormat:Word; AData:THandle; APalette:HPALETTE); virtual;//v58//00030F40
    procedure SaveToClipboardFormat(var Format:Word; var Data:THandle; var APalette:HPALETTE); virtual;//v5C//00030F8C
    function GetHandle:HICON;//00030BF8
    procedure HandleNeeded;//00030C1C
    procedure ImageNeeded;//00030C88
    procedure NewImage(NewHandle:HICON; NewImage:TMemoryStream);//00030DF4
    procedure SetHandle(Value:HICON);//00030E68
  end;
  TResourceManager = class(TObject)
  public
    ResList:PResource;//f4
    FLock:TRTLCriticalSection;//f8
    ResDataSize:Word;//f20
    constructor Create(AResDataSize:Word);//0002920C
    destructor Destroy;//00029248
    procedure Lock;//0002926C
    procedure Unlock;//00029278
    function AllocResource(const ResData:void ):PResource;//00029284
    procedure FreeResource(Resource:PResource);//00029368
    procedure ChangeResource(GraphicsObject:TGraphicsObject; const ResData:void );//00029418
    procedure AssignResource(GraphicsObject:TGraphicsObject; AResource:PResource);//00029490
  end;
  TFileFormat = TFileFormat = record//size=10
f4:String;//f4
f8:String;//f8
end;;
  TFileFormatsList = class(TList)
  public
    destructor Destroy; virtual;//0002CD80
    constructor Create;//0002CC58
    procedure Add(const Ext:AnsiString; const Desc:AnsiString; DescID:Integer; AClass:TGraphicClass);//0002CDCC
    function FindClassName(const Classname:AnsiString):TGraphicClass;//0002CE60
  end;
  TClipboardFormats = class(TObject)
  public
    FClasses:TList;//f4
    FFormats:TList;//f8
    constructor Create;//0002CF50
    destructor Destroy;//0002CFD0
    procedure Add(Fmt:Word; AClass:TGraphicClass);//0002CFFC
    function FindFormat(Fmt:Word):TGraphicClass;//0002D064
  end;
  TBitmapCanvas = class(TCanvas)
  public
    FBitmap:TBitmap;//f54
    FOldBitmap:HBITMAP;//f58
    FOldPalette:HPALETTE;//f5C
    destructor Destroy; virtual;//0002E708
    procedure CreateHandle; virtual;//v14//0002E7D4
    constructor Create(ABitmap:TBitmap);//0002E6CC
    procedure FreeContext;//0002E734
  end;
  TPatternManager = class(TObject)
  public
    List:PPattern;//f4
    FLock:TRTLCriticalSection;//f8
    constructor Create;//00031124
    destructor Destroy;//0003115C
    procedure Lock;//00031188
    procedure Unlock;//00031194
    function AllocPattern(BkColor:TColorRef; FgColor:TColorRef):PPattern;//000311A0
    function CreateBitmap(BkColor:TColor; FgColor:TColor):TBitmap;//00031254
    procedure FreePatterns;//00031354
  end;
    procedure InternalDeletePalette(Pal:HPALETTE);//00029184
    function GetHashCode(const Buffer:void ; Count:Integer):Word;//000291F8
    procedure ClearColor(ResMan:TResourceManager);//000294FC
    procedure PaletteChanged;//00029568
    function ColorToRGB(Color:TColor):Longint;//0002996C
    function ColorToString(Color:TColor):AnsiString;//0002997C
    function StringToColor(const S:AnsiString):TColor;//000299D4
    function ColorToIdent(Color:Longint; var Ident:AnsiString):Boolean;//000299F8
    function IdentToColor(const Ident:AnsiString; var Color:Longint):Boolean;//00029A08
    procedure Changed;//00029A18
    function CharsetToIdent(Charset:Longint; var Ident:AnsiString):Boolean;//00029C00
    function IdentToCharset(const Ident:AnsiString; var Charset:Longint):Boolean;//00029C10
    function GetFontData(Font:HFONT):TFontData;//00029C20
    destructor Destroy;//00029D28
    procedure Changed;//00029D50
    procedure Assign(Source:TPersistent);//00029D6C
    destructor Destroy;//0002A238
    procedure Assign(Source:TPersistent);//0002A260
    destructor Destroy;//0002A524
    procedure Assign(Source:TPersistent);//0002A54C
    destructor Destroy;//0002A8A4
    procedure CreateHandle;//0002B370
    procedure Error;//0002B3C8
    procedure Changing;//0002B490
    procedure Changed;//0002B4A4
    procedure InvalidOperation(const Str:AnsiString);//0002B5F0
    procedure InvalidGraphic(const Str:AnsiString);//0002B608
    procedure InvalidBitmap;//0002B620
    procedure InvalidIcon;//0002B668
    procedure InvalidMetafile;//0002B6B0
    procedure OutOfResources;//0002B6F8
    procedure GDIError;//0002B74C
    function GDICheck(Value:Integer):Integer;//0002B7F4
    function DupBits(Src:HBITMAP; Size:TPoint; Mono:Boolean):HBITMAP;//0002B804
    function GetDInColors(BitCount:Word):Integer;//0002B964
    function BytesPerScanline(PixelsPerScanline:Longint; BitsPerPixel:Longint; Alignment:Longint):Longint;//0002B984
    function TransparentStretchBlt(DstDC:HDC; DstX:Integer; DstY:Integer; DstW:Integer; DstH:Integer; SrcDC:HDC; SrcX:Integer; SrcY:Integer; SrcW:Integer; SrcH:Integer; MaskDC:HDC; MaskX:Integer; MaskY:Integer):Boolean;//0002B998
    procedure RGBTripleToQuad(var ColorTable:void );//0002BC2C
    procedure RGBQuadToTriple(var ColorTable:void ; var ColorCount:Integer);//0002BC64
    procedure ByteSwapColors(var Colors:void ; Count:Integer);//0002BCDC
    function CreateSystemPalette(const Entries:array[$0..-$1] of TColor; const _Dv_:$0..-$1):HPALETTE;//0002BD34
    function SystemPaletteOverride(var Pal:TMaxLogPalette):Boolean;//0002BE4C
    function PaletteFromDIBColorTable(DIBHandle:THandle; ColorTable:Pointer; ColorCount:Integer):HPALETTE;//0002BEE4
    function PaletteToDIBColorTable(Pal:HPALETTE; var ColorTable:array[$0..-$1] of Windows.TRGBQuad; const _Dv_:$0..-$1):Integer;//0002BF88
    procedure TwoBitsFromDIB(var BI:TBitmapInfoHeader; var XorBits:HBITMAP; var AndBits:HBITMAP);//0002BFDC
    procedure ReadIcon(Stream:TStream; var Icon:HICON; ImageCount:Integer; StartOffset:Integer);//0002C1AC
    function ComputeAldusChecksum(var WMF:TMetafileHeader):Word;//0002C46C
    procedure InitializeBitmapInfoHeader(Bitmap:HBITMAP; var BI:TBitmapInfoHeader; Colors:Integer);//0002C484
    procedure InternalGetDIBSizes(Bitmap:HBITMAP; var InfoHeaderSize:DWORD; var ImageSize:DWORD; Colors:Integer);//0002C55C
    procedure GetDIBSizes(Bitmap:HBITMAP; var InfoHeaderSize:DWORD; var ImageSize:DWORD);//0002C5AC
    function InternalGetDIB(Bitmap:HBITMAP; Palette:HPALETTE; var BitmapInfo:void ; var Bits:void ; Colors:Integer):Boolean;//0002C5B4
    function GetDIB(Bitmap:HBITMAP; Palette:HPALETTE; var BitmapInfo:void ; var Bits:void ):Boolean;//0002C664
    procedure WinError;//0002C678
    procedure CheckBool(Result:BOOL);//0002C67C
    procedure WriteIcon(Stream:TStream; Icon:HICON; WriteLength:Boolean);//0002C688
    constructor Create;//0002C884
    procedure Changed(Sender:TObject);//0002C8BC
    function DoWrite:Boolean;//0002C8D4
    procedure DefineProperties(Filer:TFiler);//0002C92C
    function Equals(Graphic:TGraphic):Boolean;//0002C978
    //function sub_0002CABC:?;//0002CABC
    //function sub_0002CAC0:?;//0002CAC0
    //procedure sub_0002CAC4(?:?);//0002CAC4
    procedure Progress(Sender:TObject; Stage:TProgressStage; PercentDone:Byte; RedrawNow:Boolean; const R:TRect; const Msg:AnsiString);//0002CB18
    procedure ReadData(Stream:TStream);//0002CB40
    procedure SaveToFile(const Filename:AnsiString);//0002CB4C
    procedure sub_0002CBA4;//0002CBA4
    procedure SetTransparent(Value:Boolean);//0002CBA8
    procedure WriteData(Stream:TStream);//0002CBB8
    destructor Destroy;//0002CD80
    function GetFileFormats:TFileFormatsList;//0002D0A0
    function GetClipboardFormats:TClipboardFormats;//0002D0C0
    destructor Destroy;//0002D120
    procedure AssignTo(Dest:TPersistent);//0002D150
    procedure Assign(Source:TPersistent);//0002D40C
    procedure Changed(Sender:TObject);//0002D468
    procedure Progress(Sender:TObject; Stage:TProgressStage; PercentDone:Byte; RedrawNow:Boolean; const R:TRect; const Msg:AnsiString);//0002D48C
    function DoWrite:Boolean;//0002D628
    procedure DefineProperties(Filer:TFiler);//0002D6A4
    destructor Destroy;//0002D720
    procedure FreeHandle;//0002D75C
    constructor Create;//0002D760
    destructor Destroy;//0002D7A8
    procedure Assign(Source:TPersistent);//0002D7D8
    procedure Draw(ACanvas:TCanvas; const Rect:TRect);//0002D86C
    function GetEmpty:Boolean;//0002D9E8
    function GetHeight:Integer;//0002D9F0
    function GetPalette:HPALETTE;//0002DA84
    function GetWidth:Integer;//0002DB10
    procedure LoadFromStream(Stream:TStream);//0002DB74
    procedure ReadData(Stream:TStream);//0002DBF0
    procedure SaveToFile(const Filename:AnsiString);//0002DE44
    procedure SaveToStream(Stream:TStream);//0002DED0
    procedure SetHeight(Value:Integer);//0002DF7C
    procedure SetTransparent(Value:Boolean);//0002E068
    procedure SetWidth(Value:Integer);//0002E06C
    procedure WriteData(Stream:TStream);//0002E1C4
    procedure LoadFromClipboardFormat(AFormat:Word; AData:THandle; APalette:HPALETTE);//0002E414
    procedure SaveToClipboardFormat(var AFormat:Word; var AData:THandle; var APalette:HPALETTE);//0002E4D4
    procedure FreeMemoryContexts;//0002E5A4
    procedure DeselectBitmap(AHandle:HBITMAP);//0002E650
    destructor Destroy;//0002E708
    procedure CreateHandle;//0002E7D4
    destructor Destroy;//0002E8E4
    procedure FreeHandle;//0002E938
    procedure UpdateDIBColorTable(DIBHandle:HBITMAP; Pal:HPALETTE; const DIB:TDIBSection);//0002E984
    procedure FixupBitFields(var DIB:TDIBSection);//0002EA40
    function CopyBitmap(Handle:HBITMAP; OldPalette:HPALETTE; NewPalette:HPALETTE; var DIB:TDIBSection; Canvas:TCanvas):HBITMAP;//0002EA8C
    function CopyPalette(Palette:HPALETTE):HPALETTE;//0002F0BC
    function CopyBitmapAsMask(Handle:HBITMAP; Palette:HPALETTE; TransparentColor:TColorRef):HBITMAP;//0002F120
    constructor Create;//0002F32C
    destructor Destroy;//0002F394
    procedure Assign(Source:TPersistent);//0002F3D0
    procedure Changed(Sender:TObject);//0002F584
    procedure Draw(ACanvas:TCanvas; const Rect:TRect);//0002F5AC
    function GetEmpty:Boolean;//0002F84C
    function GetHandle:HBITMAP;//0002F8A4
    function GetHeight:Integer;//0002F8F4
    function GetMaskHandle:HBITMAP;//0002F904
    function GetPalette:HPALETTE;//0002F934
    //function GetWidth:?;//0002F990
    procedure LoadFromClipboardFormat(AFormat:Word; AData:THandle; APalette:HPALETTE);//0002FC24
    procedure LoadFromStream(Stream:TStream);//0002FCE4
    procedure ReadData(Stream:TStream);//0002FE54
    procedure SetHandleType(Value:TBitmapHandleType);//000303F8
    procedure SetHeight(Value:Integer);//0003052C
    procedure SetPalette(Value:HPALETTE);//00030600
    procedure SetWidth(Value:Integer);//00030724
    procedure WriteData(Stream:TStream);//00030778
    procedure SaveToStream(Stream:TStream);//000309D4
    procedure SaveToClipboardFormat(var Format:Word; var Data:THandle; var APalette:HPALETTE);//000309DC
    destructor Destroy;//00030A7C
    procedure FreeHandle;//00030AAC
    constructor Create;//00030AC4
    destructor Destroy;//00030B18
    procedure Assign(Source:TPersistent);//00030B48
    procedure Draw(ACanvas:TCanvas; const Rect:TRect);//00030BA8
    function GetEmpty:Boolean;//00030BE0
    function GetHeight:Integer;//00030C0C
    function GetWidth:Integer;//00030C14
    procedure LoadFromStream(Stream:TStream);//00030D3C
    procedure SetHeight(Value:Integer);//00030E80
    procedure SetTransparent(Value:Boolean);//00030EC8
    procedure SetWidth(Value:Integer);//00030ECC
    procedure SaveToStream(Stream:TStream);//00030F14
    procedure LoadFromClipboardFormat(AFormat:Word; AData:THandle; APalette:HPALETTE);//00030F40
    procedure SaveToClipboardFormat(var Format:Word; var Data:THandle; var APalette:HPALETTE);//00030F8C
    procedure InitScreenLogPixels;//00030FD8
    function GetDefFontCharSet:TFontCharset;//00031010
    procedure InitDefFontData;//00031054
    function AllocPatternBitmap(BkColor:TColor; FgColor:TColor):TBitmap;//000313CC

implementation

//00029184
procedure InternalDeletePalette(Pal:HPALETTE);
begin
{*
 00029184    test        eax,eax
>00029186    je          00029196
 00029188    cmp         eax,dword ptr ds:[0B6634]
>0002918E    je          00029196
 00029190    push        eax
 00029191    call        gdi32.DeleteObject
 00029196    ret
*}
end;

//000291F8
function GetHashCode(const Buffer:void ; Count:Integer):Word;
begin
{*
 000291F8    mov         ecx,edx
 000291FA    mov         edx,eax
 000291FC    xor         eax,eax
 000291FE    rol         ax,5
 00029202    xor         al,byte ptr [edx]
 00029204    inc         edx
 00029205    dec         ecx
>00029206    jne         000291FE
 00029208    ret
*}
end;

//0002920C
constructor TResourceManager.Create(AResDataSize:Word);
begin
{*
 0002920C    push        ebx
 0002920D    push        esi
 0002920E    test        dl,dl
>00029210    je          0002921A
 00029212    add         esp,0FFFFFFF0
 00029215    call        @ClassCreate
 0002921A    mov         ebx,edx
 0002921C    mov         esi,eax
 0002921E    mov         word ptr [esi+20],cx
 00029222    lea         eax,[esi+8]
 00029225    push        eax
 00029226    call        kernel32.InitializeCriticalSection
 0002922B    mov         eax,esi
 0002922D    test        bl,bl
>0002922F    je          00029240
 00029231    call        @AfterConstruction
 00029236    pop         dword ptr fs:[0]
 0002923D    add         esp,0C
 00029240    mov         eax,esi
 00029242    pop         esi
 00029243    pop         ebx
 00029244    ret
*}
end;

//00029248
destructor TResourceManager.Destroy;
begin
{*
 00029248    push        ebx
 00029249    push        esi
 0002924A    call        @BeforeDestruction
 0002924F    mov         ebx,edx
 00029251    mov         esi,eax
 00029253    lea         eax,[esi+8]
 00029256    push        eax
 00029257    call        kernel32.DeleteCriticalSection
 0002925C    test        bl,bl
>0002925E    jle         00029267
 00029260    mov         eax,esi
 00029262    call        @ClassDestroy
 00029267    pop         esi
 00029268    pop         ebx
 00029269    ret
*}
end;

//0002926C
procedure TResourceManager.Lock;
begin
{*
 0002926C    add         eax,8
 0002926F    push        eax
 00029270    call        kernel32.EnterCriticalSection
 00029275    ret
*}
end;

//00029278
procedure TResourceManager.Unlock;
begin
{*
 00029278    add         eax,8
 0002927B    push        eax
 0002927C    call        kernel32.LeaveCriticalSection
 00029281    ret
*}
end;

//00029284
function TResourceManager.AllocResource(const ResData:void ):PResource;
begin
{*
 00029284    push        ebp
 00029285    mov         ebp,esp
 00029287    add         esp,0FFFFFFF8
 0002928A    push        ebx
 0002928B    push        esi
 0002928C    mov         ebx,edx
 0002928E    mov         dword ptr [ebp-4],eax
 00029291    mov         eax,dword ptr [ebp-4]
 00029294    movzx       edx,word ptr [eax+20]
 00029298    mov         eax,ebx
 0002929A    call        GetHashCode
 0002929F    mov         esi,eax
 000292A1    mov         eax,dword ptr [ebp-4]
 000292A4    call        TResourceManager.Lock
 000292A9    xor         edx,edx
 000292AB    push        ebp
 000292AC    push        29358
 000292B1    push        dword ptr fs:[edx]
 000292B4    mov         dword ptr fs:[edx],esp
 000292B7    mov         eax,dword ptr [ebp-4]
 000292BA    mov         eax,dword ptr [eax+4]
 000292BD    mov         dword ptr [ebp-8],eax
>000292C0    jmp         000292CA
 000292C2    mov         eax,dword ptr [ebp-8]
 000292C5    mov         eax,dword ptr [eax]
 000292C7    mov         dword ptr [ebp-8],eax
 000292CA    cmp         dword ptr [ebp-8],0
>000292CE    je          000292F1
 000292D0    mov         eax,dword ptr [ebp-8]
 000292D3    cmp         si,word ptr [eax+0C]
>000292D7    jne         000292C2
 000292D9    mov         eax,dword ptr [ebp-4]
 000292DC    movzx       ecx,word ptr [eax+20]
 000292E0    mov         edx,ebx
 000292E2    mov         eax,dword ptr [ebp-8]
 000292E5    add         eax,10
 000292E8    call        CompareMem
 000292ED    test        al,al
>000292EF    je          000292C2
 000292F1    cmp         dword ptr [ebp-8],0
>000292F5    jne         0002933C
 000292F7    mov         eax,dword ptr [ebp-4]
 000292FA    movzx       eax,word ptr [eax+20]
 000292FE    add         eax,10
 00029301    call        @GetMem
 00029306    mov         dword ptr [ebp-8],eax
 00029309    mov         eax,dword ptr [ebp-8]
 0002930C    mov         edx,dword ptr [ebp-4]
 0002930F    mov         edx,dword ptr [edx+4]
 00029312    mov         dword ptr [eax],edx
 00029314    xor         edx,edx
 00029316    mov         dword ptr [eax+4],edx
 00029319    mov         edx,dword ptr [ebx]
 0002931B    mov         dword ptr [eax+8],edx
 0002931E    mov         word ptr [eax+0C],si
 00029322    mov         edx,dword ptr [ebp-4]
 00029325    movzx       ecx,word ptr [edx+20]
 00029329    lea         edx,[eax+10]
 0002932C    mov         eax,ebx
 0002932E    call        Move
 00029333    mov         eax,dword ptr [ebp-4]
 00029336    mov         edx,dword ptr [ebp-8]
 00029339    mov         dword ptr [eax+4],edx
 0002933C    mov         eax,dword ptr [ebp-8]
 0002933F    inc         dword ptr [eax+4]
 00029342    xor         eax,eax
 00029344    pop         edx
 00029345    pop         ecx
 00029346    pop         ecx
 00029347    mov         dword ptr fs:[eax],edx
 0002934A    push        2935F
 0002934F    mov         eax,dword ptr [ebp-4]
 00029352    call        TResourceManager.Unlock
 00029357    ret
>00029358    jmp         @HandleFinally
>0002935D    jmp         0002934F
 0002935F    mov         eax,dword ptr [ebp-8]
 00029362    pop         esi
 00029363    pop         ebx
 00029364    pop         ecx
 00029365    pop         ecx
 00029366    pop         ebp
 00029367    ret
*}
end;

//00029368
procedure TResourceManager.FreeResource(Resource:PResource);
begin
{*
 00029368    push        ebp
 00029369    mov         ebp,esp
 0002936B    add         esp,0FFFFFFF0
 0002936E    mov         dword ptr [ebp-8],edx
 00029371    mov         dword ptr [ebp-4],eax
 00029374    cmp         dword ptr [ebp-8],0
>00029378    je          00029414
 0002937E    mov         eax,dword ptr [ebp-8]
 00029381    mov         dword ptr [ebp-10],eax
 00029384    mov         eax,dword ptr [ebp-4]
 00029387    call        TResourceManager.Lock
 0002938C    xor         ecx,ecx
 0002938E    push        ebp
 0002938F    push        293EF
 00029394    push        dword ptr fs:[ecx]
 00029397    mov         dword ptr fs:[ecx],esp
 0002939A    mov         eax,dword ptr [ebp-10]
 0002939D    dec         dword ptr [eax+4]
 000293A0    mov         eax,dword ptr [ebp-10]
 000293A3    cmp         dword ptr [eax+4],0
 000293A7    sete        byte ptr [ebp-9]
 000293AB    cmp         byte ptr [ebp-9],0
>000293AF    je          000293D9
 000293B1    mov         eax,dword ptr [ebp-4]
 000293B4    mov         eax,dword ptr [eax+4]
 000293B7    cmp         eax,dword ptr [ebp-8]
>000293BA    jne         000293CB
 000293BC    mov         eax,dword ptr [ebp-8]
 000293BF    mov         eax,dword ptr [eax]
 000293C1    mov         edx,dword ptr [ebp-4]
 000293C4    mov         dword ptr [edx+4],eax
>000293C7    jmp         000293D9
 000293C9    mov         eax,edx
 000293CB    mov         edx,dword ptr [eax]
 000293CD    cmp         edx,dword ptr [ebp-8]
>000293D0    jne         000293C9
 000293D2    mov         edx,dword ptr [ebp-8]
 000293D5    mov         edx,dword ptr [edx]
 000293D7    mov         dword ptr [eax],edx
 000293D9    xor         eax,eax
 000293DB    pop         edx
 000293DC    pop         ecx
 000293DD    pop         ecx
 000293DE    mov         dword ptr fs:[eax],edx
 000293E1    push        293F6
 000293E6    mov         eax,dword ptr [ebp-4]
 000293E9    call        TResourceManager.Unlock
 000293EE    ret
>000293EF    jmp         @HandleFinally
>000293F4    jmp         000293E6
 000293F6    cmp         byte ptr [ebp-9],0
>000293FA    je          00029414
 000293FC    mov         eax,dword ptr [ebp-10]
 000293FF    mov         eax,dword ptr [eax+8]
 00029402    test        eax,eax
>00029404    je          0002940C
 00029406    push        eax
 00029407    call        gdi32.DeleteObject
 0002940C    mov         eax,dword ptr [ebp-8]
 0002940F    call        @FreeMem
 00029414    mov         esp,ebp
 00029416    pop         ebp
 00029417    ret
*}
end;

//00029418
procedure TResourceManager.ChangeResource(GraphicsObject:TGraphicsObject; const ResData:void );
begin
{*
 00029418    push        ebp
 00029419    mov         ebp,esp
 0002941B    add         esp,0FFFFFFF8
 0002941E    push        ebx
 0002941F    push        esi
 00029420    push        edi
 00029421    mov         dword ptr [ebp-8],ecx
 00029424    mov         ebx,edx
 00029426    mov         dword ptr [ebp-4],eax
 00029429    mov         eax,dword ptr [ebp-4]
 0002942C    call        TResourceManager.Lock
 00029431    xor         eax,eax
 00029433    push        ebp
 00029434    push        29481
 00029439    push        dword ptr fs:[eax]
 0002943C    mov         dword ptr fs:[eax],esp
 0002943F    mov         esi,dword ptr [ebx+0C]
 00029442    mov         edx,dword ptr [ebp-8]
 00029445    mov         eax,dword ptr [ebp-4]
 00029448    call        TResourceManager.AllocResource
 0002944D    mov         edi,eax
 0002944F    mov         dword ptr [ebx+0C],edi
 00029452    cmp         esi,edi
>00029454    je          00029461
 00029456    mov         eax,ebx
 00029458    mov         bx,0FFFD
 0002945C    call        @CallDynaInst
 00029461    mov         edx,esi
 00029463    mov         eax,dword ptr [ebp-4]
 00029466    call        TResourceManager.FreeResource
 0002946B    xor         eax,eax
 0002946D    pop         edx
 0002946E    pop         ecx
 0002946F    pop         ecx
 00029470    mov         dword ptr fs:[eax],edx
 00029473    push        29488
 00029478    mov         eax,dword ptr [ebp-4]
 0002947B    call        TResourceManager.Unlock
 00029480    ret
>00029481    jmp         @HandleFinally
>00029486    jmp         00029478
 00029488    pop         edi
 00029489    pop         esi
 0002948A    pop         ebx
 0002948B    pop         ecx
 0002948C    pop         ecx
 0002948D    pop         ebp
 0002948E    ret
*}
end;

//00029490
procedure TResourceManager.AssignResource(GraphicsObject:TGraphicsObject; AResource:PResource);
begin
{*
 00029490    push        ebp
 00029491    mov         ebp,esp
 00029493    push        ecx
 00029494    push        ebx
 00029495    push        esi
 00029496    push        edi
 00029497    mov         edi,ecx
 00029499    mov         ebx,edx
 0002949B    mov         dword ptr [ebp-4],eax
 0002949E    mov         eax,dword ptr [ebp-4]
 000294A1    call        TResourceManager.Lock
 000294A6    xor         eax,eax
 000294A8    push        ebp
 000294A9    push        294EC
 000294AE    push        dword ptr fs:[eax]
 000294B1    mov         dword ptr fs:[eax],esp
 000294B4    mov         esi,dword ptr [ebx+0C]
 000294B7    cmp         edi,esi
>000294B9    je          000294D6
 000294BB    inc         dword ptr [edi+4]
 000294BE    mov         dword ptr [ebx+0C],edi
 000294C1    mov         eax,ebx
 000294C3    mov         bx,0FFFD
 000294C7    call        @CallDynaInst
 000294CC    mov         edx,esi
 000294CE    mov         eax,dword ptr [ebp-4]
 000294D1    call        TResourceManager.FreeResource
 000294D6    xor         eax,eax
 000294D8    pop         edx
 000294D9    pop         ecx
 000294DA    pop         ecx
 000294DB    mov         dword ptr fs:[eax],edx
 000294DE    push        294F3
 000294E3    mov         eax,dword ptr [ebp-4]
 000294E6    call        TResourceManager.Unlock
 000294EB    ret
>000294EC    jmp         @HandleFinally
>000294F1    jmp         000294E3
 000294F3    pop         edi
 000294F4    pop         esi
 000294F5    pop         ebx
 000294F6    pop         ecx
 000294F7    pop         ebp
 000294F8    ret
*}
end;

//000294FC
procedure ClearColor(ResMan:TResourceManager);
begin
{*
 000294FC    push        ebp
 000294FD    mov         ebp,esp
 000294FF    push        ecx
 00029500    push        ebx
 00029501    push        esi
 00029502    mov         dword ptr [ebp-4],eax
 00029505    mov         eax,dword ptr [ebp-4]
 00029508    call        TResourceManager.Lock
 0002950D    xor         edx,edx
 0002950F    push        ebp
 00029510    push        2955B
 00029515    push        dword ptr fs:[edx]
 00029518    mov         dword ptr fs:[edx],esp
 0002951B    mov         eax,dword ptr [ebp-4]
 0002951E    mov         ebx,dword ptr [eax+4]
 00029521    test        ebx,ebx
>00029523    je          00029545
 00029525    mov         esi,ebx
 00029527    mov         eax,dword ptr [esi+8]
 0002952A    test        eax,eax
>0002952C    je          0002953F
 0002952E    cmp         dword ptr [esi+14],0
>00029532    jge         0002953F
 00029534    push        eax
 00029535    call        gdi32.DeleteObject
 0002953A    xor         eax,eax
 0002953C    mov         dword ptr [esi+8],eax
 0002953F    mov         ebx,dword ptr [ebx]
 00029541    test        ebx,ebx
>00029543    jne         00029525
 00029545    xor         eax,eax
 00029547    pop         edx
 00029548    pop         ecx
 00029549    pop         ecx
 0002954A    mov         dword ptr fs:[eax],edx
 0002954D    push        29562
 00029552    mov         eax,dword ptr [ebp-4]
 00029555    call        TResourceManager.Unlock
 0002955A    ret
>0002955B    jmp         @HandleFinally
>00029560    jmp         00029552
 00029562    pop         esi
 00029563    pop         ebx
 00029564    pop         ecx
 00029565    pop         ebp
 00029566    ret
*}
end;

//00029568
procedure PaletteChanged;
begin
{*
 00029568    push        ebp
 00029569    mov         ebp,esp
 0002956B    add         esp,0FFFFFFF8
 0002956E    push        ebx
 0002956F    push        esi
 00029570    xor         eax,eax
 00029572    mov         dword ptr [ebp-4],eax
 00029575    mov         eax,[000B668C]
 0002957A    call        TThreadList.LockList
 0002957F    mov         dword ptr [ebp-8],eax
 00029582    xor         eax,eax
 00029584    push        ebp
 00029585    push        29605
 0002958A    push        dword ptr fs:[eax]
 0002958D    mov         dword ptr fs:[eax],esp
>00029590    jmp         000295B0
 00029592    mov         edx,dword ptr [ebp-4]
 00029595    mov         eax,dword ptr [ebp-8]
 00029598    call        TList.Get
 0002959D    mov         ebx,eax
 0002959F    mov         eax,ebx
 000295A1    call        TCanvas.Lock
 000295A6    inc         dword ptr [ebp-4]
 000295A9    mov         eax,ebx
 000295AB    call        TCanvas.DeselectHandles
 000295B0    mov         eax,dword ptr [ebp-8]
 000295B3    mov         eax,dword ptr [eax+8]
 000295B6    cmp         eax,dword ptr [ebp-4]
>000295B9    jg          00029592
 000295BB    mov         eax,[000B6684]
 000295C0    call        ClearColor
 000295C5    mov         eax,[000B6688]
 000295CA    call        ClearColor
 000295CF    xor         eax,eax
 000295D1    pop         edx
 000295D2    pop         ecx
 000295D3    pop         ecx
 000295D4    mov         dword ptr fs:[eax],edx
 000295D7    push        2960C
 000295DC    mov         ebx,dword ptr [ebp-4]
 000295DF    dec         ebx
 000295E0    test        ebx,ebx
>000295E2    jl          000295FA
 000295E4    inc         ebx
 000295E5    xor         esi,esi
 000295E7    mov         edx,esi
 000295E9    mov         eax,dword ptr [ebp-8]
 000295EC    call        TList.Get
 000295F1    call        TCanvas.Unlock
 000295F6    inc         esi
 000295F7    dec         ebx
>000295F8    jne         000295E7
 000295FA    mov         eax,[000B668C]
 000295FF    call        TThreadList.UnlockList
 00029604    ret
>00029605    jmp         @HandleFinally
>0002960A    jmp         000295DC
 0002960C    pop         esi
 0002960D    pop         ebx
 0002960E    pop         ecx
 0002960F    pop         ecx
 00029610    pop         ebp
 00029611    ret
*}
end;

//0002996C
function ColorToRGB(Color:TColor):Longint;
begin
{*
 0002996C    test        eax,eax
>0002996E    jge         0002997B
 00029970    and         eax,0FF
 00029975    push        eax
 00029976    call        user32.GetSysColor
 0002997B    ret
*}
end;

//0002997C
function ColorToString(Color:TColor):AnsiString;
begin
{*
 0002997C    push        ebx
 0002997D    push        esi
 0002997E    add         esp,0FFFFFFF0
 00029981    mov         esi,edx
 00029983    mov         ebx,eax
 00029985    mov         edx,esi
 00029987    mov         eax,ebx
 00029989    call        ColorToIdent
 0002998E    test        al,al
>00029990    jne         000299BD
 00029992    push        1
 00029994    mov         eax,[000B5B7C]
 00029999    mov         eax,dword ptr [eax]
 0002999B    mov         dword ptr [esp+4],eax
 0002999F    mov         byte ptr [esp+8],0B
 000299A4    mov         dword ptr [esp+0C],ebx
 000299A8    mov         byte ptr [esp+10],0
 000299AD    lea         ecx,[esp+4]
 000299B1    mov         eax,esi
 000299B3    mov         edx,299CC;'%s%.8x'
 000299B8    call        FmtStr
 000299BD    add         esp,10
 000299C0    pop         esi
 000299C1    pop         ebx
 000299C2    ret
*}
end;

//000299D4
function StringToColor(const S:AnsiString):TColor;
begin
{*
 000299D4    push        ebx
 000299D5    push        ecx
 000299D6    mov         ebx,eax
 000299D8    mov         edx,esp
 000299DA    mov         eax,ebx
 000299DC    call        IdentToColor
 000299E1    test        al,al
>000299E3    jne         000299EF
 000299E5    mov         eax,ebx
 000299E7    call        StrToInt
 000299EC    mov         dword ptr [esp],eax
 000299EF    mov         eax,dword ptr [esp]
 000299F2    pop         edx
 000299F3    pop         ebx
 000299F4    ret
*}
end;

//000299F8
function ColorToIdent(Color:Longint; var Ident:AnsiString):Boolean;
begin
{*
 000299F8    push        29
 000299FA    mov         ecx,0B43E8
 000299FF    call        IntToIdent
 00029A04    ret
*}
end;

//00029A08
function IdentToColor(const Ident:AnsiString; var Color:Longint):Boolean;
begin
{*
 00029A08    push        29
 00029A0A    mov         ecx,0B43E8
 00029A0F    call        IdentToInt
 00029A14    ret
*}
end;

//00029A18
procedure TGraphicsObject.Changed;
begin
{*
 00029A18    push        ebx
 00029A19    cmp         word ptr [eax+6],0
>00029A1E    je          00029A2A
 00029A20    mov         ebx,eax
 00029A22    mov         edx,eax
 00029A24    mov         eax,dword ptr [ebx+8]
 00029A27    call        dword ptr [ebx+4]
 00029A2A    pop         ebx
 00029A2B    ret
*}
end;

//00029A2C
procedure TGraphicsObject.Lock;
begin
{*
 00029A2C    mov         edx,dword ptr [eax+10]
 00029A2F    test        edx,edx
>00029A31    je          00029A39
 00029A33    push        edx
 00029A34    call        kernel32.EnterCriticalSection
 00029A39    ret
*}
end;

//00029A3C
procedure TGraphicsObject.Unlock;
begin
{*
 00029A3C    mov         edx,dword ptr [eax+10]
 00029A3F    test        edx,edx
>00029A41    je          00029A49
 00029A43    push        edx
 00029A44    call        kernel32.LeaveCriticalSection
 00029A49    ret
*}
end;

//00029C00
function CharsetToIdent(Charset:Longint; var Ident:AnsiString):Boolean;
begin
{*
 00029C00    push        11
 00029C02    mov         ecx,0B4538
 00029C07    call        IntToIdent
 00029C0C    ret
*}
end;

//00029C10
function IdentToCharset(const Ident:AnsiString; var Charset:Longint):Boolean;
begin
{*
 00029C10    push        11
 00029C12    mov         ecx,0B4538
 00029C17    call        IdentToInt
 00029C1C    ret
*}
end;

//00029C20
function GetFontData(Font:HFONT):TFontData;
begin
{*
 00029C20    push        ebx
 00029C21    push        esi
 00029C22    push        edi
 00029C23    add         esp,0FFFFFFA0
 00029C26    mov         ebx,edx
 00029C28    mov         esi,eax
 00029C2A    push        esi
 00029C2B    mov         edi,ebx
 00029C2D    mov         esi,0B43B8
 00029C32    mov         ecx,0B
 00029C37    rep movs    dword ptr [edi],dword ptr [esi]
 00029C39    pop         esi
 00029C3A    test        esi,esi
>00029C3C    je          00029CCB
 00029C42    push        esp
 00029C43    push        3C
 00029C45    push        esi
 00029C46    call        gdi32.GetObjectA
 00029C4B    test        eax,eax
>00029C4D    je          00029CCB
 00029C4F    mov         eax,dword ptr [esp]
 00029C52    mov         dword ptr [ebx+4],eax
 00029C55    cmp         dword ptr [esp+10],2BC
>00029C5D    jl          00029C63
 00029C5F    or          byte ptr [ebx+9],1
 00029C63    cmp         byte ptr [esp+14],1
>00029C68    jne         00029C6E
 00029C6A    or          byte ptr [ebx+9],2
 00029C6E    cmp         byte ptr [esp+15],1
>00029C73    jne         00029C79
 00029C75    or          byte ptr [ebx+9],4
 00029C79    cmp         byte ptr [esp+16],1
>00029C7E    jne         00029C84
 00029C80    or          byte ptr [ebx+9],8
 00029C84    mov         al,byte ptr [esp+17]
 00029C88    mov         byte ptr [ebx+0A],al
 00029C8B    lea         eax,[esp+3C]
 00029C8F    lea         edx,[esp+1C]
 00029C93    mov         ecx,20
 00029C98    call        @_CLenToPasStr
 00029C9D    lea         edx,[esp+3C]
 00029CA1    lea         eax,[ebx+0B]
 00029CA4    mov         cl,1F
 00029CA6    call        @PStrNCpy
 00029CAB    mov         al,byte ptr [esp+1B]
 00029CAF    and         al,0F
 00029CB1    dec         al
>00029CB3    je          00029CBF
 00029CB5    dec         al
>00029CB7    jne         00029CC5
 00029CB9    mov         byte ptr [ebx+8],1
>00029CBD    jmp         00029CC9
 00029CBF    mov         byte ptr [ebx+8],2
>00029CC3    jmp         00029CC9
 00029CC5    mov         byte ptr [ebx+8],0
 00029CC9    mov         dword ptr [ebx],esi
 00029CCB    add         esp,60
 00029CCE    pop         edi
 00029CCF    pop         esi
 00029CD0    pop         ebx
 00029CD1    ret
*}
end;

//00029CD4
constructor TFont.Create;
begin
{*
 00029CD4    push        ebx
 00029CD5    push        esi
 00029CD6    test        dl,dl
>00029CD8    je          00029CE2
 00029CDA    add         esp,0FFFFFFF0
 00029CDD    call        @ClassCreate
 00029CE2    mov         ebx,edx
 00029CE4    mov         esi,eax
 00029CE6    xor         eax,eax
 00029CE8    mov         [000B43B8],eax
 00029CED    mov         edx,0B43B8
 00029CF2    mov         eax,[000B6680]
 00029CF7    call        TResourceManager.AllocResource
 00029CFC    mov         dword ptr [esi+0C],eax
 00029CFF    mov         dword ptr [esi+14],80000008
 00029D06    mov         eax,[000B663C]
 00029D0B    mov         dword ptr [esi+18],eax
 00029D0E    mov         eax,esi
 00029D10    test        bl,bl
>00029D12    je          00029D23
 00029D14    call        @AfterConstruction
 00029D19    pop         dword ptr fs:[0]
 00029D20    add         esp,0C
 00029D23    mov         eax,esi
 00029D25    pop         esi
 00029D26    pop         ebx
 00029D27    ret
*}
end;

//00029D28
destructor TBrush.Destroy;
begin
{*
 00029D28    push        ebx
 00029D29    push        esi
 00029D2A    call        @BeforeDestruction
 00029D2F    mov         ebx,edx
 00029D31    mov         esi,eax
 00029D33    mov         edx,dword ptr [esi+0C]
 00029D36    mov         eax,[000B6680]
 00029D3B    call        TResourceManager.FreeResource
 00029D40    test        bl,bl
>00029D42    jle         00029D4B
 00029D44    mov         eax,esi
 00029D46    call        @ClassDestroy
 00029D4B    pop         esi
 00029D4C    pop         ebx
 00029D4D    ret
*}
end;

//00029D50
procedure TFont.Changed;
begin
{*
 00029D50    push        ebx
 00029D51    mov         ebx,eax
 00029D53    mov         eax,ebx
 00029D55    call        TGraphicsObject.Changed
 00029D5A    cmp         dword ptr [ebx+1C],0
>00029D5E    je          00029D68
 00029D60    mov         eax,dword ptr [ebx+1C]
 00029D63    mov         edx,dword ptr [eax]
 00029D65    call        dword ptr [edx+0C]
 00029D68    pop         ebx
 00029D69    ret
*}
end;

//00029D6C
procedure TFont.Assign(Source:TPersistent);
begin
{*
 00029D6C    push        ebp
 00029D6D    mov         ebp,esp
 00029D6F    add         esp,0FFFFFFF8
 00029D72    push        ebx
 00029D73    mov         dword ptr [ebp-8],edx
 00029D76    mov         dword ptr [ebp-4],eax
 00029D79    mov         eax,dword ptr [ebp-8]
 00029D7C    mov         edx,dword ptr ds:[28720];TFont
 00029D82    call        @IsClass
 00029D87    test        al,al
>00029D89    je          00029E2E
 00029D8F    mov         eax,dword ptr [ebp-4]
 00029D92    call        TGraphicsObject.Lock
 00029D97    xor         eax,eax
 00029D99    push        ebp
 00029D9A    push        29E27
 00029D9F    push        dword ptr fs:[eax]
 00029DA2    mov         dword ptr fs:[eax],esp
 00029DA5    mov         ebx,dword ptr [ebp-8]
 00029DA8    mov         eax,ebx
 00029DAA    call        TGraphicsObject.Lock
 00029DAF    xor         eax,eax
 00029DB1    push        ebp
 00029DB2    push        29E0A
 00029DB7    push        dword ptr fs:[eax]
 00029DBA    mov         dword ptr fs:[eax],esp
 00029DBD    mov         ecx,dword ptr [ebx+0C]
 00029DC0    mov         edx,dword ptr [ebp-4]
 00029DC3    mov         eax,[000B6680]
 00029DC8    call        TResourceManager.AssignResource
 00029DCD    mov         edx,dword ptr [ebx+14]
 00029DD0    mov         eax,dword ptr [ebp-4]
 00029DD3    call        TFont.SetColor
 00029DD8    mov         eax,dword ptr [ebp-4]
 00029DDB    mov         eax,dword ptr [eax+18]
 00029DDE    cmp         eax,dword ptr [ebx+18]
>00029DE1    je          00029DF4
 00029DE3    mov         eax,ebx
 00029DE5    call        TFont.GetSize
 00029DEA    mov         edx,eax
 00029DEC    mov         eax,dword ptr [ebp-4]
 00029DEF    call        TFont.SetSize
 00029DF4    xor         eax,eax
 00029DF6    pop         edx
 00029DF7    pop         ecx
 00029DF8    pop         ecx
 00029DF9    mov         dword ptr fs:[eax],edx
 00029DFC    push        29E11
 00029E01    mov         eax,dword ptr [ebp-8]
 00029E04    call        TGraphicsObject.Unlock
 00029E09    ret
>00029E0A    jmp         @HandleFinally
>00029E0F    jmp         00029E01
 00029E11    xor         eax,eax
 00029E13    pop         edx
 00029E14    pop         ecx
 00029E15    pop         ecx
 00029E16    mov         dword ptr fs:[eax],edx
 00029E19    push        29E39
 00029E1E    mov         eax,dword ptr [ebp-4]
 00029E21    call        TGraphicsObject.Unlock
 00029E26    ret
>00029E27    jmp         @HandleFinally
>00029E2C    jmp         00029E1E
 00029E2E    mov         edx,dword ptr [ebp-8]
 00029E31    mov         eax,dword ptr [ebp-4]
 00029E34    call        TPersistent.Assign
 00029E39    pop         ebx
 00029E3A    pop         ecx
 00029E3B    pop         ecx
 00029E3C    pop         ebp
 00029E3D    ret
*}
end;

//00029E40
procedure TFont.GetData(var FontData:TFontData);
begin
{*
 00029E40    push        esi
 00029E41    push        edi
 00029E42    mov         eax,dword ptr [eax+0C]
 00029E45    lea         esi,[eax+10]
 00029E48    mov         edi,edx
 00029E4A    mov         ecx,0B
 00029E4F    rep movs    dword ptr [edi],dword ptr [esi]
 00029E51    xor         eax,eax
 00029E53    mov         dword ptr [edx],eax
 00029E55    pop         edi
 00029E56    pop         esi
 00029E57    ret
*}
end;

//00029E58
procedure TFont.SetData(const FontData:TFontData);
begin
{*
 00029E58    push        ebp
 00029E59    mov         ebp,esp
 00029E5B    push        ecx
 00029E5C    push        ebx
 00029E5D    mov         ebx,edx
 00029E5F    mov         dword ptr [ebp-4],eax
 00029E62    mov         eax,dword ptr [ebp-4]
 00029E65    call        TGraphicsObject.Lock
 00029E6A    xor         eax,eax
 00029E6C    push        ebp
 00029E6D    push        29E9D
 00029E72    push        dword ptr fs:[eax]
 00029E75    mov         dword ptr fs:[eax],esp
 00029E78    mov         ecx,ebx
 00029E7A    mov         edx,dword ptr [ebp-4]
 00029E7D    mov         eax,[000B6680]
 00029E82    call        TResourceManager.ChangeResource
 00029E87    xor         eax,eax
 00029E89    pop         edx
 00029E8A    pop         ecx
 00029E8B    pop         ecx
 00029E8C    mov         dword ptr fs:[eax],edx
 00029E8F    push        29EA4
 00029E94    mov         eax,dword ptr [ebp-4]
 00029E97    call        TGraphicsObject.Unlock
 00029E9C    ret
>00029E9D    jmp         @HandleFinally
>00029EA2    jmp         00029E94
 00029EA4    pop         ebx
 00029EA5    pop         ecx
 00029EA6    pop         ebp
 00029EA7    ret
*}
end;

//00029EA8
procedure TFont.SetColor(Value:TColor);
begin
{*
 00029EA8    push        ebx
 00029EA9    cmp         edx,dword ptr [eax+14]
>00029EAC    je          00029EBA
 00029EAE    mov         dword ptr [eax+14],edx
 00029EB1    mov         bx,0FFFD
 00029EB5    call        @CallDynaInst
 00029EBA    pop         ebx
 00029EBB    ret
*}
end;

//00029EBC
function TFont.GetHandle:HFONT;
begin
{*
 00029EBC    push        ebp
 00029EBD    mov         ebp,esp
 00029EBF    add         esp,0FFFFFFBC
 00029EC2    push        ebx
 00029EC3    xor         edx,edx
 00029EC5    mov         dword ptr [ebp-44],edx
 00029EC8    mov         ebx,eax
 00029ECA    xor         eax,eax
 00029ECC    push        ebp
 00029ECD    push        2A03A
 00029ED2    push        dword ptr fs:[eax]
 00029ED5    mov         dword ptr fs:[eax],esp
 00029ED8    mov         eax,dword ptr [ebx+0C]
 00029EDB    mov         dword ptr [ebp-4],eax
 00029EDE    mov         eax,dword ptr [ebp-4]
 00029EE1    cmp         dword ptr [eax+8],0
>00029EE5    jne         0002A01E
 00029EEB    mov         eax,[000B6680]
 00029EF0    call        TResourceManager.Lock
 00029EF5    xor         eax,eax
 00029EF7    push        ebp
 00029EF8    push        2A017
 00029EFD    push        dword ptr fs:[eax]
 00029F00    mov         dword ptr fs:[eax],esp
 00029F03    mov         eax,dword ptr [ebp-4]
 00029F06    cmp         dword ptr [eax+8],0
>00029F0A    jne         00029FFF
 00029F10    mov         eax,dword ptr [ebp-4]
 00029F13    mov         eax,dword ptr [eax+14]
 00029F16    mov         dword ptr [ebp-40],eax
 00029F19    xor         eax,eax
 00029F1B    mov         dword ptr [ebp-3C],eax
 00029F1E    xor         eax,eax
 00029F20    mov         dword ptr [ebp-38],eax
 00029F23    xor         eax,eax
 00029F25    mov         dword ptr [ebp-34],eax
 00029F28    mov         eax,dword ptr [ebp-4]
 00029F2B    test        byte ptr [eax+19],1
>00029F2F    je          00029F3A
 00029F31    mov         dword ptr [ebp-30],2BC
>00029F38    jmp         00029F41
 00029F3A    mov         dword ptr [ebp-30],190
 00029F41    mov         eax,dword ptr [ebp-4]
 00029F44    test        byte ptr [eax+19],2
 00029F48    setne       al
 00029F4B    mov         byte ptr [ebp-2C],al
 00029F4E    mov         eax,dword ptr [ebp-4]
 00029F51    test        byte ptr [eax+19],4
 00029F55    setne       al
 00029F58    mov         byte ptr [ebp-2B],al
 00029F5B    mov         eax,dword ptr [ebp-4]
 00029F5E    test        byte ptr [eax+19],8
 00029F62    setne       al
 00029F65    mov         byte ptr [ebp-2A],al
 00029F68    mov         eax,dword ptr [ebp-4]
 00029F6B    mov         al,byte ptr [eax+1A]
 00029F6E    mov         byte ptr [ebp-29],al
 00029F71    lea         eax,[ebp-44]
 00029F74    mov         edx,dword ptr [ebp-4]
 00029F77    add         edx,1B
 00029F7A    call        @LStrFromString
 00029F7F    mov         eax,dword ptr [ebp-44]
 00029F82    mov         edx,2A050;'Default'
 00029F87    call        AnsiCompareText
 00029F8C    test        eax,eax
>00029F8E    jne         00029FAA
 00029F90    lea         eax,[ebp-44]
 00029F93    mov         edx,0B43C3
 00029F98    call        @LStrFromString
 00029F9D    mov         edx,dword ptr [ebp-44]
 00029FA0    lea         eax,[ebp-24]
 00029FA3    call        StrPCopy
>00029FA8    jmp         00029FC3
 00029FAA    lea         eax,[ebp-44]
 00029FAD    mov         edx,dword ptr [ebp-4]
 00029FB0    add         edx,1B
 00029FB3    call        @LStrFromString
 00029FB8    mov         edx,dword ptr [ebp-44]
 00029FBB    lea         eax,[ebp-24]
 00029FBE    call        StrPCopy
 00029FC3    mov         byte ptr [ebp-26],0
 00029FC7    mov         byte ptr [ebp-28],0
 00029FCB    mov         byte ptr [ebp-27],0
 00029FCF    mov         eax,ebx
 00029FD1    call        TFont.GetPitch
 00029FD6    dec         al
>00029FD8    je          00029FE0
 00029FDA    dec         al
>00029FDC    je          00029FE6
>00029FDE    jmp         00029FEC
 00029FE0    mov         byte ptr [ebp-25],2
>00029FE4    jmp         00029FF0
 00029FE6    mov         byte ptr [ebp-25],1
>00029FEA    jmp         00029FF0
 00029FEC    mov         byte ptr [ebp-25],0
 00029FF0    lea         eax,[ebp-40]
 00029FF3    push        eax
 00029FF4    call        gdi32.CreateFontIndirectA
 00029FF9    mov         edx,dword ptr [ebp-4]
 00029FFC    mov         dword ptr [edx+8],eax
 00029FFF    xor         eax,eax
 0002A001    pop         edx
 0002A002    pop         ecx
 0002A003    pop         ecx
 0002A004    mov         dword ptr fs:[eax],edx
 0002A007    push        2A01E
 0002A00C    mov         eax,[000B6680]
 0002A011    call        TResourceManager.Unlock
 0002A016    ret
>0002A017    jmp         @HandleFinally
>0002A01C    jmp         0002A00C
 0002A01E    mov         eax,dword ptr [ebp-4]
 0002A021    mov         ebx,dword ptr [eax+8]
 0002A024    xor         eax,eax
 0002A026    pop         edx
 0002A027    pop         ecx
 0002A028    pop         ecx
 0002A029    mov         dword ptr fs:[eax],edx
 0002A02C    push        2A041
 0002A031    lea         eax,[ebp-44]
 0002A034    call        @LStrClr
 0002A039    ret
>0002A03A    jmp         @HandleFinally
>0002A03F    jmp         0002A031
 0002A041    mov         eax,ebx
 0002A043    pop         ebx
 0002A044    mov         esp,ebp
 0002A046    pop         ebp
 0002A047    ret
*}
end;

//0002A058
procedure TFont.SetHandle(Value:HFONT);
begin
{*
 0002A058    push        ebx
 0002A059    push        esi
 0002A05A    add         esp,0FFFFFFD4
 0002A05D    mov         esi,edx
 0002A05F    mov         ebx,eax
 0002A061    mov         edx,esp
 0002A063    mov         eax,esi
 0002A065    call        GetFontData
 0002A06A    mov         edx,esp
 0002A06C    mov         eax,ebx
 0002A06E    call        TFont.SetData
 0002A073    add         esp,2C
 0002A076    pop         esi
 0002A077    pop         ebx
 0002A078    ret
*}
end;

//0002A07C
function TFont.GetHeight:Integer;
begin
{*
 0002A07C    mov         eax,dword ptr [eax+0C]
 0002A07F    mov         eax,dword ptr [eax+14]
 0002A082    ret
*}
end;

//0002A084
procedure TFont.SetHeight(Value:Integer);
begin
{*
 0002A084    push        ebx
 0002A085    push        esi
 0002A086    add         esp,0FFFFFFD4
 0002A089    mov         esi,edx
 0002A08B    mov         ebx,eax
 0002A08D    mov         edx,esp
 0002A08F    mov         eax,ebx
 0002A091    call        TFont.GetData
 0002A096    mov         dword ptr [esp+4],esi
 0002A09A    mov         edx,esp
 0002A09C    mov         eax,ebx
 0002A09E    call        TFont.SetData
 0002A0A3    add         esp,2C
 0002A0A6    pop         esi
 0002A0A7    pop         ebx
 0002A0A8    ret
*}
end;

//0002A0AC
function TFont.GetName:TFontName;
begin
{*
 0002A0AC    push        ebx
 0002A0AD    push        esi
 0002A0AE    mov         esi,edx
 0002A0B0    mov         ebx,eax
 0002A0B2    mov         eax,esi
 0002A0B4    mov         edx,dword ptr [ebx+0C]
 0002A0B7    add         edx,1B
 0002A0BA    call        @LStrFromString
 0002A0BF    pop         esi
 0002A0C0    pop         ebx
 0002A0C1    ret
*}
end;

//0002A0C4
procedure TFont.SetName(const Value:TFontName);
begin
{*
 0002A0C4    push        ebx
 0002A0C5    push        esi
 0002A0C6    add         esp,0FFFFFED4
 0002A0CC    mov         esi,edx
 0002A0CE    mov         ebx,eax
 0002A0D0    test        esi,esi
>0002A0D2    je          0002A115
 0002A0D4    mov         edx,esp
 0002A0D6    mov         eax,ebx
 0002A0D8    call        TFont.GetData
 0002A0DD    lea         eax,[esp+0B]
 0002A0E1    xor         ecx,ecx
 0002A0E3    mov         edx,20
 0002A0E8    call        @FillChar
 0002A0ED    lea         eax,[esp+2C]
 0002A0F1    mov         edx,esi
 0002A0F3    mov         ecx,0FF
 0002A0F8    call        @LStrToString
 0002A0FD    lea         edx,[esp+2C]
 0002A101    lea         eax,[esp+0B]
 0002A105    mov         cl,1F
 0002A107    call        @PStrNCpy
 0002A10C    mov         edx,esp
 0002A10E    mov         eax,ebx
 0002A110    call        TFont.SetData
 0002A115    add         esp,12C
 0002A11B    pop         esi
 0002A11C    pop         ebx
 0002A11D    ret
*}
end;

//0002A120
function TFont.GetSize:Integer;
begin
{*
 0002A120    push        ebx
 0002A121    mov         ebx,eax
 0002A123    mov         eax,dword ptr [ebx+18]
 0002A126    push        eax
 0002A127    push        48
 0002A129    mov         eax,ebx
 0002A12B    call        TFont.GetHeight
 0002A130    push        eax
 0002A131    call        kernel32.MulDiv
 0002A136    neg         eax
 0002A138    pop         ebx
 0002A139    ret
*}
end;

//0002A13C
procedure TFont.SetSize(Value:Integer);
begin
{*
 0002A13C    push        ebx
 0002A13D    push        esi
 0002A13E    mov         esi,edx
 0002A140    mov         ebx,eax
 0002A142    push        48
 0002A144    mov         eax,dword ptr [ebx+18]
 0002A147    push        eax
 0002A148    push        esi
 0002A149    call        kernel32.MulDiv
 0002A14E    mov         edx,eax
 0002A150    neg         edx
 0002A152    mov         eax,ebx
 0002A154    call        TFont.SetHeight
 0002A159    pop         esi
 0002A15A    pop         ebx
 0002A15B    ret
*}
end;

//0002A15C
function TFont.GetStyle:TFontStyles;
begin
{*
 0002A15C    mov         eax,dword ptr [eax+0C]
 0002A15F    mov         dl,byte ptr [eax+19]
 0002A162    mov         eax,edx
 0002A164    ret
*}
end;

//0002A168
procedure TFont.SetStyle(Value:TFontStyles);
begin
{*
 0002A168    push        ebx
 0002A169    add         esp,0FFFFFFD0
 0002A16C    mov         byte ptr [esp],dl
 0002A16F    mov         ebx,eax
 0002A171    lea         edx,[esp+4]
 0002A175    mov         eax,ebx
 0002A177    call        TFont.GetData
 0002A17C    mov         al,byte ptr [esp]
 0002A17F    mov         byte ptr [esp+0D],al
 0002A183    lea         edx,[esp+4]
 0002A187    mov         eax,ebx
 0002A189    call        TFont.SetData
 0002A18E    add         esp,30
 0002A191    pop         ebx
 0002A192    ret
*}
end;

//0002A194
function TFont.GetPitch:TFontPitch;
begin
{*
 0002A194    mov         eax,dword ptr [eax+0C]
 0002A197    mov         al,byte ptr [eax+18]
 0002A19A    ret
*}
end;

//0002A19C
procedure TFont.SetPitch(Value:TFontPitch);
begin
{*
 0002A19C    push        ebx
 0002A19D    push        esi
 0002A19E    add         esp,0FFFFFFD4
 0002A1A1    mov         ebx,edx
 0002A1A3    mov         esi,eax
 0002A1A5    mov         edx,esp
 0002A1A7    mov         eax,esi
 0002A1A9    call        TFont.GetData
 0002A1AE    mov         byte ptr [esp+8],bl
 0002A1B2    mov         edx,esp
 0002A1B4    mov         eax,esi
 0002A1B6    call        TFont.SetData
 0002A1BB    add         esp,2C
 0002A1BE    pop         esi
 0002A1BF    pop         ebx
 0002A1C0    ret
*}
end;

//0002A1C4
{*function TFont.GetCharset:?;
begin
 0002A1C4    mov         eax,dword ptr [eax+0C];TFont.FResource:PResource
 0002A1C7    mov         al,byte ptr [eax+1A]
 0002A1CA    ret
end;*}

//0002A1CC
procedure TFont.SetCharset(Value:TFontCharset);
begin
{*
 0002A1CC    push        ebx
 0002A1CD    push        esi
 0002A1CE    add         esp,0FFFFFFD4
 0002A1D1    mov         ebx,edx
 0002A1D3    mov         esi,eax
 0002A1D5    mov         edx,esp
 0002A1D7    mov         eax,esi
 0002A1D9    call        TFont.GetData
 0002A1DE    mov         byte ptr [esp+0A],bl
 0002A1E2    mov         edx,esp
 0002A1E4    mov         eax,esi
 0002A1E6    call        TFont.SetData
 0002A1EB    add         esp,2C
 0002A1EE    pop         esi
 0002A1EF    pop         ebx
 0002A1F0    ret
*}
end;

//0002A1F4
constructor TPen.Create;
begin
{*
 0002A1F4    push        ebx
 0002A1F5    push        esi
 0002A1F6    test        dl,dl
>0002A1F8    je          0002A202
 0002A1FA    add         esp,0FFFFFFF0
 0002A1FD    call        @ClassCreate
 0002A202    mov         ebx,edx
 0002A204    mov         esi,eax
 0002A206    mov         edx,0B45C8
 0002A20B    mov         eax,[000B6684]
 0002A210    call        TResourceManager.AllocResource
 0002A215    mov         dword ptr [esi+0C],eax
 0002A218    mov         byte ptr [esi+14],4
 0002A21C    mov         eax,esi
 0002A21E    test        bl,bl
>0002A220    je          0002A231
 0002A222    call        @AfterConstruction
 0002A227    pop         dword ptr fs:[0]
 0002A22E    add         esp,0C
 0002A231    mov         eax,esi
 0002A233    pop         esi
 0002A234    pop         ebx
 0002A235    ret
*}
end;

//0002A238
destructor TFont.Destroy;
begin
{*
 0002A238    push        ebx
 0002A239    push        esi
 0002A23A    call        @BeforeDestruction
 0002A23F    mov         ebx,edx
 0002A241    mov         esi,eax
 0002A243    mov         edx,dword ptr [esi+0C]
 0002A246    mov         eax,[000B6684]
 0002A24B    call        TResourceManager.FreeResource
 0002A250    test        bl,bl
>0002A252    jle         0002A25B
 0002A254    mov         eax,esi
 0002A256    call        @ClassDestroy
 0002A25B    pop         esi
 0002A25C    pop         ebx
 0002A25D    ret
*}
end;

//0002A260
procedure TPen.Assign(Source:TPersistent);
begin
{*
 0002A260    push        ebp
 0002A261    mov         ebp,esp
 0002A263    add         esp,0FFFFFFF8
 0002A266    push        ebx
 0002A267    mov         dword ptr [ebp-8],edx
 0002A26A    mov         dword ptr [ebp-4],eax
 0002A26D    mov         eax,dword ptr [ebp-8]
 0002A270    mov         edx,dword ptr ds:[2889C];TPen
 0002A276    call        @IsClass
 0002A27B    test        al,al
>0002A27D    je          0002A306
 0002A283    mov         eax,dword ptr [ebp-4]
 0002A286    call        TGraphicsObject.Lock
 0002A28B    xor         eax,eax
 0002A28D    push        ebp
 0002A28E    push        2A2FF
 0002A293    push        dword ptr fs:[eax]
 0002A296    mov         dword ptr fs:[eax],esp
 0002A299    mov         ebx,dword ptr [ebp-8]
 0002A29C    mov         eax,ebx
 0002A29E    call        TGraphicsObject.Lock
 0002A2A3    xor         eax,eax
 0002A2A5    push        ebp
 0002A2A6    push        2A2E2
 0002A2AB    push        dword ptr fs:[eax]
 0002A2AE    mov         dword ptr fs:[eax],esp
 0002A2B1    mov         ecx,dword ptr [ebx+0C]
 0002A2B4    mov         edx,dword ptr [ebp-4]
 0002A2B7    mov         eax,[000B6684]
 0002A2BC    call        TResourceManager.AssignResource
 0002A2C1    mov         dl,byte ptr [ebx+14]
 0002A2C4    mov         eax,dword ptr [ebp-4]
 0002A2C7    call        TPen.SetMode
 0002A2CC    xor         eax,eax
 0002A2CE    pop         edx
 0002A2CF    pop         ecx
 0002A2D0    pop         ecx
 0002A2D1    mov         dword ptr fs:[eax],edx
 0002A2D4    push        2A2E9
 0002A2D9    mov         eax,dword ptr [ebp-8]
 0002A2DC    call        TGraphicsObject.Unlock
 0002A2E1    ret
>0002A2E2    jmp         @HandleFinally
>0002A2E7    jmp         0002A2D9
 0002A2E9    xor         eax,eax
 0002A2EB    pop         edx
 0002A2EC    pop         ecx
 0002A2ED    pop         ecx
 0002A2EE    mov         dword ptr fs:[eax],edx
 0002A2F1    push        2A311
 0002A2F6    mov         eax,dword ptr [ebp-4]
 0002A2F9    call        TGraphicsObject.Unlock
 0002A2FE    ret
>0002A2FF    jmp         @HandleFinally
>0002A304    jmp         0002A2F6
 0002A306    mov         edx,dword ptr [ebp-8]
 0002A309    mov         eax,dword ptr [ebp-4]
 0002A30C    call        TPersistent.Assign
 0002A311    pop         ebx
 0002A312    pop         ecx
 0002A313    pop         ecx
 0002A314    pop         ebp
 0002A315    ret
*}
end;

//0002A318
procedure TPen.GetData(var PenData:TPenData);
begin
{*
 0002A318    push        esi
 0002A319    push        edi
 0002A31A    mov         eax,dword ptr [eax+0C]
 0002A31D    lea         esi,[eax+10]
 0002A320    mov         edi,edx
 0002A322    mov         ecx,4
 0002A327    rep movs    dword ptr [edi],dword ptr [esi]
 0002A329    xor         eax,eax
 0002A32B    mov         dword ptr [edx],eax
 0002A32D    pop         edi
 0002A32E    pop         esi
 0002A32F    ret
*}
end;

//0002A330
procedure TBrush.SetData(const BrushData:TBrushData);
begin
{*
 0002A330    push        ebp
 0002A331    mov         ebp,esp
 0002A333    push        ecx
 0002A334    push        ebx
 0002A335    mov         ebx,edx
 0002A337    mov         dword ptr [ebp-4],eax
 0002A33A    mov         eax,dword ptr [ebp-4]
 0002A33D    call        TGraphicsObject.Lock
 0002A342    xor         eax,eax
 0002A344    push        ebp
 0002A345    push        2A375
 0002A34A    push        dword ptr fs:[eax]
 0002A34D    mov         dword ptr fs:[eax],esp
 0002A350    mov         ecx,ebx
 0002A352    mov         edx,dword ptr [ebp-4]
 0002A355    mov         eax,[000B6684]
 0002A35A    call        TResourceManager.ChangeResource
 0002A35F    xor         eax,eax
 0002A361    pop         edx
 0002A362    pop         ecx
 0002A363    pop         ecx
 0002A364    mov         dword ptr fs:[eax],edx
 0002A367    push        2A37C
 0002A36C    mov         eax,dword ptr [ebp-4]
 0002A36F    call        TGraphicsObject.Unlock
 0002A374    ret
>0002A375    jmp         @HandleFinally
>0002A37A    jmp         0002A36C
 0002A37C    pop         ebx
 0002A37D    pop         ecx
 0002A37E    pop         ebp
 0002A37F    ret
*}
end;

//0002A380
function TPen.GetColor:TColor;
begin
{*
 0002A380    mov         eax,dword ptr [eax+0C]
 0002A383    mov         eax,dword ptr [eax+14]
 0002A386    ret
*}
end;

//0002A388
procedure TPen.SetColor(Value:TColor);
begin
{*
 0002A388    push        ebx
 0002A389    push        esi
 0002A38A    add         esp,0FFFFFFF0
 0002A38D    mov         esi,edx
 0002A38F    mov         ebx,eax
 0002A391    mov         edx,esp
 0002A393    mov         eax,ebx
 0002A395    call        TPen.GetData
 0002A39A    mov         dword ptr [esp+4],esi
 0002A39E    mov         edx,esp
 0002A3A0    mov         eax,ebx
 0002A3A2    call        TBrush.SetData
 0002A3A7    add         esp,10
 0002A3AA    pop         esi
 0002A3AB    pop         ebx
 0002A3AC    ret
*}
end;

//0002A3B0
function TPen.GetHandle:HPEN;
begin
{*
 0002A3B0    push        ebp
 0002A3B1    mov         ebp,esp
 0002A3B3    add         esp,0FFFFFFEC
 0002A3B6    mov         eax,dword ptr [eax+0C]
 0002A3B9    mov         dword ptr [ebp-4],eax
 0002A3BC    mov         eax,dword ptr [ebp-4]
 0002A3BF    cmp         dword ptr [eax+8],0
>0002A3C3    jne         0002A43D
 0002A3C5    mov         eax,[000B6684]
 0002A3CA    call        TResourceManager.Lock
 0002A3CF    xor         eax,eax
 0002A3D1    push        ebp
 0002A3D2    push        2A436
 0002A3D7    push        dword ptr fs:[eax]
 0002A3DA    mov         dword ptr fs:[eax],esp
 0002A3DD    mov         eax,dword ptr [ebp-4]
 0002A3E0    cmp         dword ptr [eax+8],0
>0002A3E4    jne         0002A41E
 0002A3E6    mov         eax,dword ptr [ebp-4]
 0002A3E9    movzx       eax,byte ptr [eax+1C]
 0002A3ED    movzx       eax,word ptr [eax*2+0B45D8]
 0002A3F5    mov         dword ptr [ebp-14],eax
 0002A3F8    mov         eax,dword ptr [ebp-4]
 0002A3FB    mov         eax,dword ptr [eax+18]
 0002A3FE    mov         dword ptr [ebp-10],eax
 0002A401    mov         eax,dword ptr [ebp-4]
 0002A404    mov         eax,dword ptr [eax+14]
 0002A407    call        ColorToRGB
 0002A40C    mov         dword ptr [ebp-8],eax
 0002A40F    lea         eax,[ebp-14]
 0002A412    push        eax
 0002A413    call        gdi32.CreatePenIndirect
 0002A418    mov         edx,dword ptr [ebp-4]
 0002A41B    mov         dword ptr [edx+8],eax
 0002A41E    xor         eax,eax
 0002A420    pop         edx
 0002A421    pop         ecx
 0002A422    pop         ecx
 0002A423    mov         dword ptr fs:[eax],edx
 0002A426    push        2A43D
 0002A42B    mov         eax,[000B6684]
 0002A430    call        TResourceManager.Unlock
 0002A435    ret
>0002A436    jmp         @HandleFinally
>0002A43B    jmp         0002A42B
 0002A43D    mov         eax,dword ptr [ebp-4]
 0002A440    mov         eax,dword ptr [eax+8]
 0002A443    mov         esp,ebp
 0002A445    pop         ebp
 0002A446    ret
*}
end;

//0002A448
procedure TBrush.SetHandle(Value:HBRUSH);
begin
{*
 0002A448    push        esi
 0002A449    push        edi
 0002A44A    add         esp,0FFFFFFF0
 0002A44D    mov         esi,0B45C8
 0002A452    mov         edi,esp
 0002A454    mov         ecx,4
 0002A459    rep movs    dword ptr [edi],dword ptr [esi]
 0002A45B    mov         dword ptr [esp],edx
 0002A45E    mov         edx,esp
 0002A460    call        TBrush.SetData
 0002A465    add         esp,10
 0002A468    pop         edi
 0002A469    pop         esi
 0002A46A    ret
*}
end;

//0002A46C
procedure TPen.SetMode(Value:TPenMode);
begin
{*
 0002A46C    push        ebx
 0002A46D    cmp         dl,byte ptr [eax+14]
>0002A470    je          0002A47E
 0002A472    mov         byte ptr [eax+14],dl
 0002A475    mov         bx,0FFFD
 0002A479    call        @CallDynaInst
 0002A47E    pop         ebx
 0002A47F    ret
*}
end;

//0002A480
function TPen.GetStyle:TPenStyle;
begin
{*
 0002A480    mov         eax,dword ptr [eax+0C]
 0002A483    mov         al,byte ptr [eax+1C]
 0002A486    ret
*}
end;

//0002A488
procedure TPen.SetStyle(Value:TPenStyle);
begin
{*
 0002A488    push        ebx
 0002A489    push        esi
 0002A48A    add         esp,0FFFFFFF0
 0002A48D    mov         ebx,edx
 0002A48F    mov         esi,eax
 0002A491    mov         edx,esp
 0002A493    mov         eax,esi
 0002A495    call        TPen.GetData
 0002A49A    mov         byte ptr [esp+0C],bl
 0002A49E    mov         edx,esp
 0002A4A0    mov         eax,esi
 0002A4A2    call        TBrush.SetData
 0002A4A7    add         esp,10
 0002A4AA    pop         esi
 0002A4AB    pop         ebx
 0002A4AC    ret
*}
end;

//0002A4B0
function TPen.GetWidth:Integer;
begin
{*
 0002A4B0    mov         eax,dword ptr [eax+0C]
 0002A4B3    mov         eax,dword ptr [eax+18]
 0002A4B6    ret
*}
end;

//0002A4B8
procedure TPen.SetWidth(Value:Integer);
begin
{*
 0002A4B8    push        ebx
 0002A4B9    push        esi
 0002A4BA    add         esp,0FFFFFFF0
 0002A4BD    mov         esi,edx
 0002A4BF    mov         ebx,eax
 0002A4C1    test        esi,esi
>0002A4C3    jl          0002A4DB
 0002A4C5    mov         edx,esp
 0002A4C7    mov         eax,ebx
 0002A4C9    call        TPen.GetData
 0002A4CE    mov         dword ptr [esp+8],esi
 0002A4D2    mov         edx,esp
 0002A4D4    mov         eax,ebx
 0002A4D6    call        TBrush.SetData
 0002A4DB    add         esp,10
 0002A4DE    pop         esi
 0002A4DF    pop         ebx
 0002A4E0    ret
*}
end;

//0002A4E4
constructor TBrush.Create;
begin
{*
 0002A4E4    push        ebx
 0002A4E5    push        esi
 0002A4E6    test        dl,dl
>0002A4E8    je          0002A4F2
 0002A4EA    add         esp,0FFFFFFF0
 0002A4ED    call        @ClassCreate
 0002A4F2    mov         ebx,edx
 0002A4F4    mov         esi,eax
 0002A4F6    mov         edx,0B45E8
 0002A4FB    mov         eax,[000B6688]
 0002A500    call        TResourceManager.AllocResource
 0002A505    mov         dword ptr [esi+0C],eax
 0002A508    mov         eax,esi
 0002A50A    test        bl,bl
>0002A50C    je          0002A51D
 0002A50E    call        @AfterConstruction
 0002A513    pop         dword ptr fs:[0]
 0002A51A    add         esp,0C
 0002A51D    mov         eax,esi
 0002A51F    pop         esi
 0002A520    pop         ebx
 0002A521    ret
*}
end;

//0002A524
destructor TPen.Destroy;
begin
{*
 0002A524    push        ebx
 0002A525    push        esi
 0002A526    call        @BeforeDestruction
 0002A52B    mov         ebx,edx
 0002A52D    mov         esi,eax
 0002A52F    mov         edx,dword ptr [esi+0C]
 0002A532    mov         eax,[000B6688]
 0002A537    call        TResourceManager.FreeResource
 0002A53C    test        bl,bl
>0002A53E    jle         0002A547
 0002A540    mov         eax,esi
 0002A542    call        @ClassDestroy
 0002A547    pop         esi
 0002A548    pop         ebx
 0002A549    ret
*}
end;

//0002A54C
procedure TBrush.Assign(Source:TPersistent);
begin
{*
 0002A54C    push        ebp
 0002A54D    mov         ebp,esp
 0002A54F    add         esp,0FFFFFFF8
 0002A552    push        ebx
 0002A553    mov         dword ptr [ebp-8],edx
 0002A556    mov         dword ptr [ebp-4],eax
 0002A559    mov         eax,dword ptr [ebp-8]
 0002A55C    mov         edx,dword ptr ds:[2899C];TBrush
 0002A562    call        @IsClass
 0002A567    test        al,al
>0002A569    je          0002A5E3
 0002A56B    mov         eax,dword ptr [ebp-4]
 0002A56E    call        TGraphicsObject.Lock
 0002A573    xor         eax,eax
 0002A575    push        ebp
 0002A576    push        2A5DC
 0002A57B    push        dword ptr fs:[eax]
 0002A57E    mov         dword ptr fs:[eax],esp
 0002A581    mov         ebx,dword ptr [ebp-8]
 0002A584    mov         eax,ebx
 0002A586    call        TGraphicsObject.Lock
 0002A58B    xor         eax,eax
 0002A58D    push        ebp
 0002A58E    push        2A5BF
 0002A593    push        dword ptr fs:[eax]
 0002A596    mov         dword ptr fs:[eax],esp
 0002A599    mov         ecx,dword ptr [ebx+0C]
 0002A59C    mov         edx,dword ptr [ebp-4]
 0002A59F    mov         eax,[000B6688]
 0002A5A4    call        TResourceManager.AssignResource
 0002A5A9    xor         eax,eax
 0002A5AB    pop         edx
 0002A5AC    pop         ecx
 0002A5AD    pop         ecx
 0002A5AE    mov         dword ptr fs:[eax],edx
 0002A5B1    push        2A5C6
 0002A5B6    mov         eax,dword ptr [ebp-8]
 0002A5B9    call        TGraphicsObject.Unlock
 0002A5BE    ret
>0002A5BF    jmp         @HandleFinally
>0002A5C4    jmp         0002A5B6
 0002A5C6    xor         eax,eax
 0002A5C8    pop         edx
 0002A5C9    pop         ecx
 0002A5CA    pop         ecx
 0002A5CB    mov         dword ptr fs:[eax],edx
 0002A5CE    push        2A5EE
 0002A5D3    mov         eax,dword ptr [ebp-4]
 0002A5D6    call        TGraphicsObject.Unlock
 0002A5DB    ret
>0002A5DC    jmp         @HandleFinally
>0002A5E1    jmp         0002A5D3
 0002A5E3    mov         edx,dword ptr [ebp-8]
 0002A5E6    mov         eax,dword ptr [ebp-4]
 0002A5E9    call        TPersistent.Assign
 0002A5EE    pop         ebx
 0002A5EF    pop         ecx
 0002A5F0    pop         ecx
 0002A5F1    pop         ebp
 0002A5F2    ret
*}
end;

//0002A5F4
procedure TBrush.GetData(var BrushData:TBrushData);
begin
{*
 0002A5F4    push        esi
 0002A5F5    push        edi
 0002A5F6    mov         eax,dword ptr [eax+0C]
 0002A5F9    lea         esi,[eax+10]
 0002A5FC    mov         edi,edx
 0002A5FE    mov         ecx,4
 0002A603    rep movs    dword ptr [edi],dword ptr [esi]
 0002A605    xor         eax,eax
 0002A607    mov         dword ptr [edx],eax
 0002A609    xor         eax,eax
 0002A60B    mov         dword ptr [edx+8],eax
 0002A60E    pop         edi
 0002A60F    pop         esi
 0002A610    ret
*}
end;

//0002A614
procedure TPen.SetData(const PenData:TPenData);
begin
{*
 0002A614    push        ebp
 0002A615    mov         ebp,esp
 0002A617    push        ecx
 0002A618    push        ebx
 0002A619    mov         ebx,edx
 0002A61B    mov         dword ptr [ebp-4],eax
 0002A61E    mov         eax,dword ptr [ebp-4]
 0002A621    call        TGraphicsObject.Lock
 0002A626    xor         eax,eax
 0002A628    push        ebp
 0002A629    push        2A659
 0002A62E    push        dword ptr fs:[eax]
 0002A631    mov         dword ptr fs:[eax],esp
 0002A634    mov         ecx,ebx
 0002A636    mov         edx,dword ptr [ebp-4]
 0002A639    mov         eax,[000B6688]
 0002A63E    call        TResourceManager.ChangeResource
 0002A643    xor         eax,eax
 0002A645    pop         edx
 0002A646    pop         ecx
 0002A647    pop         ecx
 0002A648    mov         dword ptr fs:[eax],edx
 0002A64B    push        2A660
 0002A650    mov         eax,dword ptr [ebp-4]
 0002A653    call        TGraphicsObject.Unlock
 0002A658    ret
>0002A659    jmp         @HandleFinally
>0002A65E    jmp         0002A650
 0002A660    pop         ebx
 0002A661    pop         ecx
 0002A662    pop         ebp
 0002A663    ret
*}
end;

//0002A664
procedure TBrush.SetBitmap(Value:TBitmap);
begin
{*
 0002A664    push        esi
 0002A665    push        edi
 0002A666    add         esp,0FFFFFFF0
 0002A669    mov         esi,0B45E8
 0002A66E    mov         edi,esp
 0002A670    mov         ecx,4
 0002A675    rep movs    dword ptr [edi],dword ptr [esi]
 0002A677    mov         dword ptr [esp+8],edx
 0002A67B    mov         edx,esp
 0002A67D    call        TPen.SetData
 0002A682    add         esp,10
 0002A685    pop         edi
 0002A686    pop         esi
 0002A687    ret
*}
end;

//0002A688
function TBrush.GetColor:TColor;
begin
{*
 0002A688    mov         eax,dword ptr [eax+0C]
 0002A68B    mov         eax,dword ptr [eax+14]
 0002A68E    ret
*}
end;

//0002A690
procedure TBrush.SetColor(Value:TColor);
begin
{*
 0002A690    push        ebx
 0002A691    push        esi
 0002A692    add         esp,0FFFFFFF0
 0002A695    mov         esi,edx
 0002A697    mov         ebx,eax
 0002A699    mov         edx,esp
 0002A69B    mov         eax,ebx
 0002A69D    call        TBrush.GetData
 0002A6A2    mov         dword ptr [esp+4],esi
 0002A6A6    cmp         byte ptr [esp+0C],1
>0002A6AB    jne         0002A6B2
 0002A6AD    mov         byte ptr [esp+0C],0
 0002A6B2    mov         edx,esp
 0002A6B4    mov         eax,ebx
 0002A6B6    call        TPen.SetData
 0002A6BB    add         esp,10
 0002A6BE    pop         esi
 0002A6BF    pop         ebx
 0002A6C0    ret
*}
end;

//0002A6C4
function TBrush.GetHandle:HBRUSH;
begin
{*
 0002A6C4    push        ebp
 0002A6C5    mov         ebp,esp
 0002A6C7    add         esp,0FFFFFFF0
 0002A6CA    mov         eax,dword ptr [eax+0C]
 0002A6CD    mov         dword ptr [ebp-4],eax
 0002A6D0    mov         eax,dword ptr [ebp-4]
 0002A6D3    cmp         dword ptr [eax+8],0
>0002A6D7    jne         0002A798
 0002A6DD    mov         eax,[000B6688]
 0002A6E2    call        TResourceManager.Lock
 0002A6E7    xor         edx,edx
 0002A6E9    push        ebp
 0002A6EA    push        2A791
 0002A6EF    push        dword ptr fs:[edx]
 0002A6F2    mov         dword ptr fs:[edx],esp
 0002A6F5    mov         eax,dword ptr [ebp-4]
 0002A6F8    cmp         dword ptr [eax+8],0
>0002A6FC    jne         0002A779
 0002A6FE    mov         eax,dword ptr [ebp-4]
 0002A701    mov         eax,dword ptr [eax+18]
 0002A704    test        eax,eax
>0002A706    je          0002A726
 0002A708    mov         dword ptr [ebp-10],3
 0002A70F    mov         dl,1
 0002A711    mov         ecx,dword ptr [eax]
 0002A713    call        dword ptr [ecx+68]
 0002A716    mov         eax,dword ptr [ebp-4]
 0002A719    mov         eax,dword ptr [eax+18]
 0002A71C    mov         edx,dword ptr [eax]
 0002A71E    call        dword ptr [edx+60]
 0002A721    mov         dword ptr [ebp-8],eax
>0002A724    jmp         0002A75C
 0002A726    xor         eax,eax
 0002A728    mov         dword ptr [ebp-8],eax
 0002A72B    mov         eax,dword ptr [ebp-4]
 0002A72E    mov         al,byte ptr [eax+1C]
 0002A731    mov         edx,eax
 0002A733    sub         dl,1
>0002A736    jb          0002A73C
>0002A738    je          0002A743
>0002A73A    jmp         0002A74C
 0002A73C    xor         eax,eax
 0002A73E    mov         dword ptr [ebp-10],eax
>0002A741    jmp         0002A75C
 0002A743    mov         dword ptr [ebp-10],1
>0002A74A    jmp         0002A75C
 0002A74C    mov         dword ptr [ebp-10],2
 0002A753    and         eax,7F
 0002A756    sub         eax,2
 0002A759    mov         dword ptr [ebp-8],eax
 0002A75C    mov         eax,dword ptr [ebp-4]
 0002A75F    mov         eax,dword ptr [eax+14]
 0002A762    call        ColorToRGB
 0002A767    mov         dword ptr [ebp-0C],eax
 0002A76A    lea         eax,[ebp-10]
 0002A76D    push        eax
 0002A76E    call        gdi32.CreateBrushIndirect
 0002A773    mov         edx,dword ptr [ebp-4]
 0002A776    mov         dword ptr [edx+8],eax
 0002A779    xor         eax,eax
 0002A77B    pop         edx
 0002A77C    pop         ecx
 0002A77D    pop         ecx
 0002A77E    mov         dword ptr fs:[eax],edx
 0002A781    push        2A798
 0002A786    mov         eax,[000B6688]
 0002A78B    call        TResourceManager.Unlock
 0002A790    ret
>0002A791    jmp         @HandleFinally
>0002A796    jmp         0002A786
 0002A798    mov         eax,dword ptr [ebp-4]
 0002A79B    mov         eax,dword ptr [eax+8]
 0002A79E    mov         esp,ebp
 0002A7A0    pop         ebp
 0002A7A1    ret
*}
end;

//0002A7A4
function TBrush.GetStyle:TBrushStyle;
begin
{*
 0002A7A4    mov         eax,dword ptr [eax+0C]
 0002A7A7    mov         al,byte ptr [eax+1C]
 0002A7AA    ret
*}
end;

//0002A7AC
procedure TBrush.SetStyle(Value:TBrushStyle);
begin
{*
 0002A7AC    push        ebx
 0002A7AD    push        esi
 0002A7AE    add         esp,0FFFFFFF0
 0002A7B1    mov         ebx,edx
 0002A7B3    mov         esi,eax
 0002A7B5    mov         edx,esp
 0002A7B7    mov         eax,esi
 0002A7B9    call        TBrush.GetData
 0002A7BE    mov         eax,ebx
 0002A7C0    mov         byte ptr [esp+0C],al
 0002A7C4    cmp         al,1
>0002A7C6    jne         0002A7D0
 0002A7C8    mov         dword ptr [esp+4],0FFFFFF
 0002A7D0    mov         edx,esp
 0002A7D2    mov         eax,esi
 0002A7D4    call        TPen.SetData
 0002A7D9    add         esp,10
 0002A7DC    pop         esi
 0002A7DD    pop         ebx
 0002A7DE    ret
*}
end;

//0002A7E0
constructor TCanvas.Create;
begin
{*
 0002A7E0    push        ebx
 0002A7E1    push        esi
 0002A7E2    push        edi
 0002A7E3    test        dl,dl
>0002A7E5    je          0002A7EF
 0002A7E7    add         esp,0FFFFFFF0
 0002A7EA    call        @ClassCreate
 0002A7EF    mov         ebx,edx
 0002A7F1    mov         edi,eax
 0002A7F3    xor         edx,edx
 0002A7F5    mov         eax,edi
 0002A7F7    call        TObject.Create
 0002A7FC    lea         eax,[edi+34]
 0002A7FF    push        eax
 0002A800    call        kernel32.InitializeCriticalSection
 0002A805    mov         dl,1
 0002A807    mov         eax,[00028720];TFont
 0002A80C    call        TFont.Create
 0002A811    mov         esi,eax
 0002A813    mov         dword ptr [edi+0C],esi
 0002A816    mov         dword ptr [esi+8],edi
 0002A819    mov         dword ptr [esi+4],2B590;TCanvas.FontChanged
 0002A820    lea         eax,[edi+34]
 0002A823    mov         dword ptr [esi+10],eax
 0002A826    mov         dl,1
 0002A828    mov         eax,[0002889C];TPen
 0002A82D    call        TPen.Create
 0002A832    mov         esi,eax
 0002A834    mov         dword ptr [edi+10],esi
 0002A837    mov         dword ptr [esi+8],edi
 0002A83A    mov         dword ptr [esi+4],2B5B0;TCanvas.PenChanged
 0002A841    lea         eax,[edi+34]
 0002A844    mov         dword ptr [esi+10],eax
 0002A847    mov         dl,1
 0002A849    mov         eax,[0002899C];TBrush
 0002A84E    call        TBrush.Create
 0002A853    mov         esi,eax
 0002A855    mov         dword ptr [edi+14],esi
 0002A858    mov         dword ptr [esi+8],edi
 0002A85B    mov         dword ptr [esi+4],2B5D0;TCanvas.BrushChanged
 0002A862    lea         eax,[edi+34]
 0002A865    mov         dword ptr [esi+10],eax
 0002A868    mov         dword ptr [edi+20],0CC0020
 0002A86F    mov         al,[0002A8A0]
 0002A874    mov         byte ptr [edi+8],al
 0002A877    mov         edx,edi
 0002A879    mov         eax,[000B668C]
 0002A87E    call        TThreadList.Add
 0002A883    mov         eax,edi
 0002A885    test        bl,bl
>0002A887    je          0002A898
 0002A889    call        @AfterConstruction
 0002A88E    pop         dword ptr fs:[0]
 0002A895    add         esp,0C
 0002A898    mov         eax,edi
 0002A89A    pop         edi
 0002A89B    pop         esi
 0002A89C    pop         ebx
 0002A89D    ret
*}
end;

//0002A8A4
destructor TCanvas.Destroy;
begin
{*
 0002A8A4    push        ebx
 0002A8A5    push        esi
 0002A8A6    call        @BeforeDestruction
 0002A8AB    mov         ebx,edx
 0002A8AD    mov         esi,eax
 0002A8AF    mov         edx,esi
 0002A8B1    mov         eax,[000B668C]
 0002A8B6    call        TThreadList.Remove
 0002A8BB    xor         edx,edx
 0002A8BD    mov         eax,esi
 0002A8BF    call        TCanvas.SetHandle
 0002A8C4    mov         eax,dword ptr [esi+0C]
 0002A8C7    call        TObject.Free
 0002A8CC    mov         eax,dword ptr [esi+10]
 0002A8CF    call        TObject.Free
 0002A8D4    mov         eax,dword ptr [esi+14]
 0002A8D7    call        TObject.Free
 0002A8DC    lea         eax,[esi+34]
 0002A8DF    push        eax
 0002A8E0    call        kernel32.DeleteCriticalSection
 0002A8E5    mov         edx,ebx
 0002A8E7    and         dl,0FC
 0002A8EA    mov         eax,esi
 0002A8EC    call        TMemoryStream.Destroy
 0002A8F1    test        bl,bl
>0002A8F3    jle         0002A8FC
 0002A8F5    mov         eax,esi
 0002A8F7    call        @ClassDestroy
 0002A8FC    pop         esi
 0002A8FD    pop         ebx
 0002A8FE    ret
*}
end;

//0002A900
procedure TCanvas.BrushCopy(const Dest:TRect; Bitmap:TBitmap; const Source:TRect; Color:TColor);
begin
{*
 0002A900    push        ebp
 0002A901    mov         ebp,esp
 0002A903    add         esp,0FFFFFFD8
 0002A906    push        ebx
 0002A907    push        esi
 0002A908    push        edi
 0002A909    mov         dword ptr [ebp-8],ecx
 0002A90C    mov         esi,edx
 0002A90E    mov         dword ptr [ebp-4],eax
 0002A911    mov         ebx,dword ptr [ebp+0C]
 0002A914    cmp         dword ptr [ebp-8],0
>0002A918    je          0002ABAD
 0002A91E    mov         eax,dword ptr [ebp-4]
 0002A921    call        TCanvas.Lock
 0002A926    xor         eax,eax
 0002A928    push        ebp
 0002A929    push        2ABA6
 0002A92E    push        dword ptr fs:[eax]
 0002A931    mov         dword ptr fs:[eax],esp
 0002A934    mov         eax,dword ptr [ebp-4]
 0002A937    mov         edx,dword ptr [eax]
 0002A939    call        dword ptr [edx+10]
 0002A93C    mov         dl,byte ptr ds:[2ABB8]
 0002A942    mov         eax,dword ptr [ebp-4]
 0002A945    call        TCanvas.RequiredState
 0002A94A    mov         eax,dword ptr [ebp-8]
 0002A94D    call        TBitmap.GetCanvas
 0002A952    call        TCanvas.Lock
 0002A957    xor         eax,eax
 0002A959    push        ebp
 0002A95A    push        2AB81
 0002A95F    push        dword ptr fs:[eax]
 0002A962    mov         dword ptr fs:[eax],esp
 0002A965    mov         eax,dword ptr [esi+8]
 0002A968    sub         eax,dword ptr [esi]
 0002A96A    mov         dword ptr [ebp-10],eax
 0002A96D    mov         eax,dword ptr [esi+0C]
 0002A970    sub         eax,dword ptr [esi+4]
 0002A973    mov         dword ptr [ebp-14],eax
 0002A976    mov         edi,dword ptr [ebx+8]
 0002A979    sub         edi,dword ptr [ebx]
 0002A97B    mov         eax,dword ptr [ebx+0C]
 0002A97E    sub         eax,dword ptr [ebx+4]
 0002A981    mov         dword ptr [ebp-0C],eax
 0002A984    mov         eax,dword ptr [ebp-8]
 0002A987    call        TBitmap.GetTransparentColor
 0002A98C    cmp         eax,dword ptr [ebp+8]
>0002A98F    jne         0002A9BD
 0002A991    xor         eax,eax
 0002A993    mov         dword ptr [ebp-24],eax
 0002A996    mov         eax,dword ptr [ebp-8]
 0002A999    mov         edx,dword ptr [eax]
 0002A99B    call        dword ptr [edx+64]
 0002A99E    mov         dword ptr [ebp-28],eax
 0002A9A1    push        0
 0002A9A3    call        gdi32.CreateCompatibleDC
 0002A9A8    mov         dword ptr [ebp-20],eax
 0002A9AB    mov         eax,dword ptr [ebp-28]
 0002A9AE    push        eax
 0002A9AF    mov         eax,dword ptr [ebp-20]
 0002A9B2    push        eax
 0002A9B3    call        gdi32.SelectObject
 0002A9B8    mov         dword ptr [ebp-28],eax
>0002A9BB    jmp         0002AA08
 0002A9BD    mov         dl,1
 0002A9BF    mov         eax,[00028F70];TBitmap
 0002A9C4    call        TBitmap.Create
 0002A9C9    mov         dword ptr [ebp-24],eax
 0002A9CC    mov         edx,dword ptr [ebp-8]
 0002A9CF    mov         eax,dword ptr [ebp-24]
 0002A9D2    mov         ecx,dword ptr [eax]
 0002A9D4    call        dword ptr [ecx+8]
 0002A9D7    mov         edx,dword ptr [ebp+8]
 0002A9DA    mov         eax,dword ptr [ebp-24]
 0002A9DD    call        TBitmap.Mask
 0002A9E2    mov         eax,dword ptr [ebp-24]
 0002A9E5    call        TBitmap.GetCanvas
 0002A9EA    mov         dl,byte ptr ds:[2ABBC]
 0002A9F0    call        TCanvas.RequiredState
 0002A9F5    mov         eax,dword ptr [ebp-24]
 0002A9F8    call        TBitmap.GetCanvas
 0002A9FD    mov         eax,dword ptr [eax+4]
 0002AA00    mov         dword ptr [ebp-20],eax
 0002AA03    xor         eax,eax
 0002AA05    mov         dword ptr [ebp-28],eax
 0002AA08    xor         eax,eax
 0002AA0A    push        ebp
 0002AA0B    push        2AB5F
 0002AA10    push        dword ptr fs:[eax]
 0002AA13    mov         dword ptr fs:[eax],esp
 0002AA16    mov         eax,dword ptr [ebp-8]
 0002AA19    call        TBitmap.GetCanvas
 0002AA1E    mov         dl,byte ptr ds:[2ABBC]
 0002AA24    call        TCanvas.RequiredState
 0002AA29    mov         eax,dword ptr [ebp-4]
 0002AA2C    mov         eax,dword ptr [eax+14]
 0002AA2F    call        TBrush.GetStyle
 0002AA34    cmp         al,1
>0002AA36    jne         0002AA78
 0002AA38    mov         eax,dword ptr [ebp-10]
 0002AA3B    push        eax
 0002AA3C    mov         eax,dword ptr [ebp-14]
 0002AA3F    push        eax
 0002AA40    mov         eax,dword ptr [ebp-8]
 0002AA43    call        TBitmap.GetCanvas
 0002AA48    mov         eax,dword ptr [eax+4]
 0002AA4B    push        eax
 0002AA4C    mov         eax,dword ptr [ebx]
 0002AA4E    push        eax
 0002AA4F    mov         eax,dword ptr [ebx+4]
 0002AA52    push        eax
 0002AA53    push        edi
 0002AA54    mov         eax,dword ptr [ebp-0C]
 0002AA57    push        eax
 0002AA58    mov         eax,dword ptr [ebp-20]
 0002AA5B    push        eax
 0002AA5C    mov         eax,dword ptr [ebx]
 0002AA5E    push        eax
 0002AA5F    mov         eax,dword ptr [ebx+4]
 0002AA62    push        eax
 0002AA63    mov         ecx,dword ptr [esi+4]
 0002AA66    mov         edx,dword ptr [esi]
 0002AA68    mov         eax,dword ptr [ebp-4]
 0002AA6B    mov         eax,dword ptr [eax+4]
 0002AA6E    call        TransparentStretchBlt
>0002AA73    jmp         0002AB25
 0002AA78    push        0CC0020
 0002AA7D    mov         eax,dword ptr [ebp-0C]
 0002AA80    push        eax
 0002AA81    push        edi
 0002AA82    mov         eax,dword ptr [ebx+4]
 0002AA85    push        eax
 0002AA86    mov         eax,dword ptr [ebx]
 0002AA88    push        eax
 0002AA89    mov         eax,dword ptr [ebp-8]
 0002AA8C    call        TBitmap.GetCanvas
 0002AA91    mov         eax,dword ptr [eax+4]
 0002AA94    push        eax
 0002AA95    mov         eax,dword ptr [ebp-14]
 0002AA98    push        eax
 0002AA99    mov         eax,dword ptr [ebp-10]
 0002AA9C    push        eax
 0002AA9D    mov         eax,dword ptr [esi+4]
 0002AAA0    push        eax
 0002AAA1    mov         eax,dword ptr [esi]
 0002AAA3    push        eax
 0002AAA4    mov         eax,dword ptr [ebp-4]
 0002AAA7    mov         eax,dword ptr [eax+4]
 0002AAAA    push        eax
 0002AAAB    call        gdi32.StretchBlt
 0002AAB0    push        0
 0002AAB2    mov         eax,dword ptr [ebp-4]
 0002AAB5    mov         eax,dword ptr [eax+4]
 0002AAB8    push        eax
 0002AAB9    call        gdi32.SetTextColor
 0002AABE    mov         dword ptr [ebp-1C],eax
 0002AAC1    push        0FFFFFF
 0002AAC6    mov         eax,dword ptr [ebp-4]
 0002AAC9    mov         eax,dword ptr [eax+4]
 0002AACC    push        eax
 0002AACD    call        gdi32.SetBkColor
 0002AAD2    mov         dword ptr [ebp-18],eax
 0002AAD5    push        0E20746
 0002AADA    mov         eax,dword ptr [ebp-0C]
 0002AADD    push        eax
 0002AADE    push        edi
 0002AADF    mov         eax,dword ptr [ebx+4]
 0002AAE2    push        eax
 0002AAE3    mov         eax,dword ptr [ebx]
 0002AAE5    push        eax
 0002AAE6    mov         eax,dword ptr [ebp-20]
 0002AAE9    push        eax
 0002AAEA    mov         eax,dword ptr [ebp-14]
 0002AAED    push        eax
 0002AAEE    mov         eax,dword ptr [ebp-10]
 0002AAF1    push        eax
 0002AAF2    mov         eax,dword ptr [esi+4]
 0002AAF5    push        eax
 0002AAF6    mov         eax,dword ptr [esi]
 0002AAF8    push        eax
 0002AAF9    mov         eax,dword ptr [ebp-4]
 0002AAFC    mov         eax,dword ptr [eax+4]
 0002AAFF    push        eax
 0002AB00    call        gdi32.StretchBlt
 0002AB05    mov         eax,dword ptr [ebp-1C]
 0002AB08    push        eax
 0002AB09    mov         eax,dword ptr [ebp-4]
 0002AB0C    mov         eax,dword ptr [eax+4]
 0002AB0F    push        eax
 0002AB10    call        gdi32.SetTextColor
 0002AB15    mov         eax,dword ptr [ebp-18]
 0002AB18    push        eax
 0002AB19    mov         eax,dword ptr [ebp-4]
 0002AB1C    mov         eax,dword ptr [eax+4]
 0002AB1F    push        eax
 0002AB20    call        gdi32.SetBkColor
 0002AB25    xor         eax,eax
 0002AB27    pop         edx
 0002AB28    pop         ecx
 0002AB29    pop         ecx
 0002AB2A    mov         dword ptr fs:[eax],edx
 0002AB2D    push        2AB66
 0002AB32    cmp         dword ptr [ebp-24],0
>0002AB36    je          0002AB42
 0002AB38    mov         eax,dword ptr [ebp-24]
 0002AB3B    call        TObject.Free
>0002AB40    jmp         0002AB5E
 0002AB42    cmp         dword ptr [ebp-28],0
>0002AB46    je          0002AB55
 0002AB48    mov         eax,dword ptr [ebp-28]
 0002AB4B    push        eax
 0002AB4C    mov         eax,dword ptr [ebp-20]
 0002AB4F    push        eax
 0002AB50    call        gdi32.SelectObject
 0002AB55    mov         eax,dword ptr [ebp-20]
 0002AB58    push        eax
 0002AB59    call        gdi32.DeleteDC
 0002AB5E    ret
>0002AB5F    jmp         @HandleFinally
>0002AB64    jmp         0002AB32
 0002AB66    xor         eax,eax
 0002AB68    pop         edx
 0002AB69    pop         ecx
 0002AB6A    pop         ecx
 0002AB6B    mov         dword ptr fs:[eax],edx
 0002AB6E    push        2AB88
 0002AB73    mov         eax,dword ptr [ebp-8]
 0002AB76    call        TBitmap.GetCanvas
 0002AB7B    call        TCanvas.Unlock
 0002AB80    ret
>0002AB81    jmp         @HandleFinally
>0002AB86    jmp         0002AB73
 0002AB88    mov         eax,dword ptr [ebp-4]
 0002AB8B    mov         edx,dword ptr [eax]
 0002AB8D    call        dword ptr [edx+0C]
 0002AB90    xor         eax,eax
 0002AB92    pop         edx
 0002AB93    pop         ecx
 0002AB94    pop         ecx
 0002AB95    mov         dword ptr fs:[eax],edx
 0002AB98    push        2ABAD
 0002AB9D    mov         eax,dword ptr [ebp-4]
 0002ABA0    call        TCanvas.Unlock
 0002ABA5    ret
>0002ABA6    jmp         @HandleFinally
>0002ABAB    jmp         0002AB9D
 0002ABAD    pop         edi
 0002ABAE    pop         esi
 0002ABAF    pop         ebx
 0002ABB0    mov         esp,ebp
 0002ABB2    pop         ebp
 0002ABB3    ret         8
*}
end;

//0002ABC0
procedure TCanvas.CopyRect(const Dest:TRect; Canvas:TCanvas; const Source:TRect);
begin
{*
 0002ABC0    push        ebp
 0002ABC1    mov         ebp,esp
 0002ABC3    push        ecx
 0002ABC4    push        ebx
 0002ABC5    push        esi
 0002ABC6    push        edi
 0002ABC7    mov         dword ptr [ebp-4],ecx
 0002ABCA    mov         esi,edx
 0002ABCC    mov         ebx,eax
 0002ABCE    mov         edi,dword ptr [ebp+8]
 0002ABD1    mov         eax,ebx
 0002ABD3    mov         edx,dword ptr [eax]
 0002ABD5    call        dword ptr [edx+10]
 0002ABD8    mov         dl,byte ptr ds:[2AC40]
 0002ABDE    mov         eax,ebx
 0002ABE0    call        TCanvas.RequiredState
 0002ABE5    mov         dl,byte ptr ds:[2AC44]
 0002ABEB    mov         eax,dword ptr [ebp-4]
 0002ABEE    call        TCanvas.RequiredState
 0002ABF3    mov         edx,dword ptr [ebx+20]
 0002ABF6    push        edx
 0002ABF7    mov         edx,dword ptr [edi+0C]
 0002ABFA    sub         edx,dword ptr [edi+4]
 0002ABFD    push        edx
 0002ABFE    mov         edx,dword ptr [edi+8]
 0002AC01    sub         edx,dword ptr [edi]
 0002AC03    push        edx
 0002AC04    mov         edx,dword ptr [edi+4]
 0002AC07    push        edx
 0002AC08    mov         edx,dword ptr [edi]
 0002AC0A    push        edx
 0002AC0B    mov         edx,dword ptr [ebp-4]
 0002AC0E    mov         edx,dword ptr [edx+4]
 0002AC11    push        edx
 0002AC12    mov         edx,dword ptr [esi+0C]
 0002AC15    sub         edx,dword ptr [esi+4]
 0002AC18    push        edx
 0002AC19    mov         edx,dword ptr [esi+8]
 0002AC1C    mov         eax,dword ptr [esi]
 0002AC1E    sub         edx,eax
 0002AC20    push        edx
 0002AC21    mov         edx,dword ptr [esi+4]
 0002AC24    push        edx
 0002AC25    push        eax
 0002AC26    mov         eax,dword ptr [ebx+4]
 0002AC29    push        eax
 0002AC2A    call        gdi32.StretchBlt
 0002AC2F    mov         eax,ebx
 0002AC31    mov         edx,dword ptr [eax]
 0002AC33    call        dword ptr [edx+0C]
 0002AC36    pop         edi
 0002AC37    pop         esi
 0002AC38    pop         ebx
 0002AC39    pop         ecx
 0002AC3A    pop         ebp
 0002AC3B    ret         4
*}
end;

//0002AC48
procedure TCanvas.Draw(X:Integer; Y:Integer; Graphic:TGraphic);
begin
{*
 0002AC48    push        ebp
 0002AC49    mov         ebp,esp
 0002AC4B    add         esp,0FFFFFFEC
 0002AC4E    push        ebx
 0002AC4F    push        esi
 0002AC50    push        edi
 0002AC51    mov         dword ptr [ebp-4],ecx
 0002AC54    mov         edi,edx
 0002AC56    mov         ebx,eax
 0002AC58    mov         esi,dword ptr [ebp+8]
 0002AC5B    test        esi,esi
>0002AC5D    je          0002ACE5
 0002AC63    mov         eax,esi
 0002AC65    mov         edx,dword ptr [eax]
 0002AC67    call        dword ptr [edx+1C]
 0002AC6A    test        al,al
>0002AC6C    jne         0002ACE5
 0002AC6E    mov         eax,ebx
 0002AC70    mov         edx,dword ptr [eax]
 0002AC72    call        dword ptr [edx+10]
 0002AC75    mov         dl,byte ptr ds:[2ACF0]
 0002AC7B    mov         eax,ebx
 0002AC7D    call        TCanvas.RequiredState
 0002AC82    mov         eax,dword ptr [ebx+14]
 0002AC85    call        TBrush.GetColor
 0002AC8A    call        ColorToRGB
 0002AC8F    push        eax
 0002AC90    mov         eax,dword ptr [ebx+4]
 0002AC93    push        eax
 0002AC94    call        gdi32.SetBkColor
 0002AC99    mov         eax,dword ptr [ebx+0C]
 0002AC9C    mov         eax,dword ptr [eax+14]
 0002AC9F    call        ColorToRGB
 0002ACA4    push        eax
 0002ACA5    mov         eax,dword ptr [ebx+4]
 0002ACA8    push        eax
 0002ACA9    call        gdi32.SetTextColor
 0002ACAE    mov         eax,esi
 0002ACB0    mov         edx,dword ptr [eax]
 0002ACB2    call        dword ptr [edx+20]
 0002ACB5    add         eax,dword ptr [ebp-4]
 0002ACB8    push        eax
 0002ACB9    lea         eax,[ebp-14]
 0002ACBC    push        eax
 0002ACBD    mov         eax,esi
 0002ACBF    mov         edx,dword ptr [eax]
 0002ACC1    call        dword ptr [edx+2C]
 0002ACC4    mov         ecx,eax
 0002ACC6    add         ecx,edi
 0002ACC8    mov         edx,dword ptr [ebp-4]
 0002ACCB    mov         eax,edi
 0002ACCD    call        Rect
 0002ACD2    lea         ecx,[ebp-14]
 0002ACD5    mov         edx,ebx
 0002ACD7    mov         eax,esi
 0002ACD9    mov         esi,dword ptr [eax]
 0002ACDB    call        dword ptr [esi+14]
 0002ACDE    mov         eax,ebx
 0002ACE0    mov         edx,dword ptr [eax]
 0002ACE2    call        dword ptr [edx+0C]
 0002ACE5    pop         edi
 0002ACE6    pop         esi
 0002ACE7    pop         ebx
 0002ACE8    mov         esp,ebp
 0002ACEA    pop         ebp
 0002ACEB    ret         4
*}
end;

//0002ACF4
procedure TCanvas.DrawFocusRect(const Rect:TRect);
begin
{*
 0002ACF4    push        ebx
 0002ACF5    push        esi
 0002ACF6    mov         esi,edx
 0002ACF8    mov         ebx,eax
 0002ACFA    mov         eax,ebx
 0002ACFC    mov         edx,dword ptr [eax]
 0002ACFE    call        dword ptr [edx+10]
 0002AD01    mov         dl,byte ptr ds:[2AD24]
 0002AD07    mov         eax,ebx
 0002AD09    call        TCanvas.RequiredState
 0002AD0E    push        esi
 0002AD0F    mov         eax,dword ptr [ebx+4]
 0002AD12    push        eax
 0002AD13    call        user32.DrawFocusRect
 0002AD18    mov         eax,ebx
 0002AD1A    mov         edx,dword ptr [eax]
 0002AD1C    call        dword ptr [edx+0C]
 0002AD1F    pop         esi
 0002AD20    pop         ebx
 0002AD21    ret
*}
end;

//0002AD28
procedure TCanvas.Ellipse(X1:Integer; Y1:Integer; X2:Integer; Y2:Integer);
begin
{*
 0002AD28    push        ebp
 0002AD29    mov         ebp,esp
 0002AD2B    push        ebx
 0002AD2C    push        esi
 0002AD2D    push        edi
 0002AD2E    mov         edi,ecx
 0002AD30    mov         esi,edx
 0002AD32    mov         ebx,eax
 0002AD34    mov         eax,ebx
 0002AD36    mov         edx,dword ptr [eax]
 0002AD38    call        dword ptr [edx+10]
 0002AD3B    mov         dl,byte ptr ds:[2AD6C]
 0002AD41    mov         eax,ebx
 0002AD43    call        TCanvas.RequiredState
 0002AD48    mov         eax,dword ptr [ebp+8]
 0002AD4B    push        eax
 0002AD4C    mov         eax,dword ptr [ebp+0C]
 0002AD4F    push        eax
 0002AD50    push        edi
 0002AD51    push        esi
 0002AD52    mov         eax,dword ptr [ebx+4]
 0002AD55    push        eax
 0002AD56    call        gdi32.Ellipse
 0002AD5B    mov         eax,ebx
 0002AD5D    mov         edx,dword ptr [eax]
 0002AD5F    call        dword ptr [edx+0C]
 0002AD62    pop         edi
 0002AD63    pop         esi
 0002AD64    pop         ebx
 0002AD65    pop         ebp
 0002AD66    ret         8
*}
end;

//0002AD70
procedure TCanvas.FillRect(const Rect:TRect);
begin
{*
 0002AD70    push        ebx
 0002AD71    push        esi
 0002AD72    mov         esi,edx
 0002AD74    mov         ebx,eax
 0002AD76    mov         eax,ebx
 0002AD78    mov         edx,dword ptr [eax]
 0002AD7A    call        dword ptr [edx+10]
 0002AD7D    mov         dl,byte ptr ds:[2ADA8]
 0002AD83    mov         eax,ebx
 0002AD85    call        TCanvas.RequiredState
 0002AD8A    mov         eax,dword ptr [ebx+14]
 0002AD8D    call        TBrush.GetHandle
 0002AD92    push        eax
 0002AD93    push        esi
 0002AD94    mov         eax,dword ptr [ebx+4]
 0002AD97    push        eax
 0002AD98    call        user32.FillRect
 0002AD9D    mov         eax,ebx
 0002AD9F    mov         edx,dword ptr [eax]
 0002ADA1    call        dword ptr [edx+0C]
 0002ADA4    pop         esi
 0002ADA5    pop         ebx
 0002ADA6    ret
*}
end;

//0002ADAC
procedure TCanvas.FrameRect(const Rect:TRect);
begin
{*
 0002ADAC    push        ebx
 0002ADAD    push        esi
 0002ADAE    mov         esi,edx
 0002ADB0    mov         ebx,eax
 0002ADB2    mov         eax,ebx
 0002ADB4    mov         edx,dword ptr [eax]
 0002ADB6    call        dword ptr [edx+10]
 0002ADB9    mov         dl,byte ptr ds:[2ADE4]
 0002ADBF    mov         eax,ebx
 0002ADC1    call        TCanvas.RequiredState
 0002ADC6    mov         eax,dword ptr [ebx+14]
 0002ADC9    call        TBrush.GetHandle
 0002ADCE    push        eax
 0002ADCF    push        esi
 0002ADD0    mov         eax,dword ptr [ebx+4]
 0002ADD3    push        eax
 0002ADD4    call        user32.FrameRect
 0002ADD9    mov         eax,ebx
 0002ADDB    mov         edx,dword ptr [eax]
 0002ADDD    call        dword ptr [edx+0C]
 0002ADE0    pop         esi
 0002ADE1    pop         ebx
 0002ADE2    ret
*}
end;

//0002ADE8
procedure TCanvas.LineTo(X:Integer; Y:Integer);
begin
{*
 0002ADE8    push        ebx
 0002ADE9    push        esi
 0002ADEA    push        edi
 0002ADEB    mov         edi,ecx
 0002ADED    mov         esi,edx
 0002ADEF    mov         ebx,eax
 0002ADF1    mov         eax,ebx
 0002ADF3    mov         edx,dword ptr [eax]
 0002ADF5    call        dword ptr [edx+10]
 0002ADF8    mov         dl,byte ptr ds:[2AE1C]
 0002ADFE    mov         eax,ebx
 0002AE00    call        TCanvas.RequiredState
 0002AE05    push        edi
 0002AE06    push        esi
 0002AE07    mov         eax,dword ptr [ebx+4]
 0002AE0A    push        eax
 0002AE0B    call        gdi32.LineTo
 0002AE10    mov         eax,ebx
 0002AE12    mov         edx,dword ptr [eax]
 0002AE14    call        dword ptr [edx+0C]
 0002AE17    pop         edi
 0002AE18    pop         esi
 0002AE19    pop         ebx
 0002AE1A    ret
*}
end;

//0002AE20
procedure TCanvas.Lock;
begin
{*
 0002AE20    push        ebx
 0002AE21    mov         ebx,eax
 0002AE23    push        0B6668
 0002AE28    call        kernel32.EnterCriticalSection
 0002AE2D    inc         dword ptr [ebx+4C]
 0002AE30    push        0B6668
 0002AE35    call        kernel32.LeaveCriticalSection
 0002AE3A    lea         eax,[ebx+34]
 0002AE3D    push        eax
 0002AE3E    call        kernel32.EnterCriticalSection
 0002AE43    pop         ebx
 0002AE44    ret
*}
end;

//0002AE48
procedure TCanvas.MoveTo(X:Integer; Y:Integer);
begin
{*
 0002AE48    push        ebx
 0002AE49    push        esi
 0002AE4A    push        edi
 0002AE4B    mov         edi,ecx
 0002AE4D    mov         esi,edx
 0002AE4F    mov         ebx,eax
 0002AE51    mov         dl,byte ptr ds:[2AE70]
 0002AE57    mov         eax,ebx
 0002AE59    call        TCanvas.RequiredState
 0002AE5E    push        0
 0002AE60    push        edi
 0002AE61    push        esi
 0002AE62    mov         eax,dword ptr [ebx+4]
 0002AE65    push        eax
 0002AE66    call        gdi32.MoveToEx
 0002AE6B    pop         edi
 0002AE6C    pop         esi
 0002AE6D    pop         ebx
 0002AE6E    ret
*}
end;

//0002AE74
procedure TCanvas.Pie(X1:Integer; Y1:Integer; X2:Integer; Y2:Integer; X3:Integer; Y3:Integer; X4:Integer; Y4:Integer);
begin
{*
 0002AE74    push        ebp
 0002AE75    mov         ebp,esp
 0002AE77    push        ebx
 0002AE78    push        esi
 0002AE79    push        edi
 0002AE7A    mov         edi,ecx
 0002AE7C    mov         esi,edx
 0002AE7E    mov         ebx,eax
 0002AE80    mov         eax,ebx
 0002AE82    mov         edx,dword ptr [eax]
 0002AE84    call        dword ptr [edx+10]
 0002AE87    mov         dl,byte ptr ds:[2AEC8]
 0002AE8D    mov         eax,ebx
 0002AE8F    call        TCanvas.RequiredState
 0002AE94    mov         eax,dword ptr [ebp+8]
 0002AE97    push        eax
 0002AE98    mov         eax,dword ptr [ebp+0C]
 0002AE9B    push        eax
 0002AE9C    mov         eax,dword ptr [ebp+10]
 0002AE9F    push        eax
 0002AEA0    mov         eax,dword ptr [ebp+14]
 0002AEA3    push        eax
 0002AEA4    mov         eax,dword ptr [ebp+18]
 0002AEA7    push        eax
 0002AEA8    mov         eax,dword ptr [ebp+1C]
 0002AEAB    push        eax
 0002AEAC    push        edi
 0002AEAD    push        esi
 0002AEAE    mov         eax,dword ptr [ebx+4]
 0002AEB1    push        eax
 0002AEB2    call        gdi32.Pie
 0002AEB7    mov         eax,ebx
 0002AEB9    mov         edx,dword ptr [eax]
 0002AEBB    call        dword ptr [edx+0C]
 0002AEBE    pop         edi
 0002AEBF    pop         esi
 0002AEC0    pop         ebx
 0002AEC1    pop         ebp
 0002AEC2    ret         18
*}
end;

//0002AECC
procedure TCanvas.Polyline(const Points:array[$0..-$1] of Windows.TPoint; const _Dv_:$0..-$1);
begin
{*
 0002AECC    push        ebx
 0002AECD    push        esi
 0002AECE    push        edi
 0002AECF    mov         edi,ecx
 0002AED1    mov         esi,edx
 0002AED3    mov         ebx,eax
 0002AED5    mov         eax,ebx
 0002AED7    mov         edx,dword ptr [eax]
 0002AED9    call        dword ptr [edx+10]
 0002AEDC    mov         dl,byte ptr ds:[2AF00]
 0002AEE2    mov         eax,ebx
 0002AEE4    call        TCanvas.RequiredState
 0002AEE9    inc         edi
 0002AEEA    push        edi
 0002AEEB    push        esi
 0002AEEC    mov         eax,dword ptr [ebx+4]
 0002AEEF    push        eax
 0002AEF0    call        gdi32.Polyline
 0002AEF5    mov         eax,ebx
 0002AEF7    mov         edx,dword ptr [eax]
 0002AEF9    call        dword ptr [edx+0C]
 0002AEFC    pop         edi
 0002AEFD    pop         esi
 0002AEFE    pop         ebx
 0002AEFF    ret
*}
end;

//0002AF04
procedure TCanvas.Rectangle(X1:Integer; Y1:Integer; X2:Integer; Y2:Integer);
begin
{*
 0002AF04    push        ebp
 0002AF05    mov         ebp,esp
 0002AF07    push        ebx
 0002AF08    push        esi
 0002AF09    push        edi
 0002AF0A    mov         edi,ecx
 0002AF0C    mov         esi,edx
 0002AF0E    mov         ebx,eax
 0002AF10    mov         eax,ebx
 0002AF12    mov         edx,dword ptr [eax]
 0002AF14    call        dword ptr [edx+10]
 0002AF17    mov         dl,byte ptr ds:[2AF48]
 0002AF1D    mov         eax,ebx
 0002AF1F    call        TCanvas.RequiredState
 0002AF24    mov         eax,dword ptr [ebp+8]
 0002AF27    push        eax
 0002AF28    mov         eax,dword ptr [ebp+0C]
 0002AF2B    push        eax
 0002AF2C    push        edi
 0002AF2D    push        esi
 0002AF2E    mov         eax,dword ptr [ebx+4]
 0002AF31    push        eax
 0002AF32    call        gdi32.Rectangle
 0002AF37    mov         eax,ebx
 0002AF39    mov         edx,dword ptr [eax]
 0002AF3B    call        dword ptr [edx+0C]
 0002AF3E    pop         edi
 0002AF3F    pop         esi
 0002AF40    pop         ebx
 0002AF41    pop         ebp
 0002AF42    ret         8
*}
end;

//0002AF4C
procedure TCanvas.Refresh;
begin
{*
 0002AF4C    call        TCanvas.DeselectHandles
 0002AF51    ret
*}
end;

//0002AF54
procedure TCanvas.StretchDraw(const Rect:TRect; Graphic:TGraphic);
begin
{*
 0002AF54    push        ebx
 0002AF55    push        esi
 0002AF56    push        edi
 0002AF57    mov         esi,ecx
 0002AF59    mov         edi,edx
 0002AF5B    mov         ebx,eax
 0002AF5D    test        esi,esi
>0002AF5F    je          0002AF87
 0002AF61    mov         eax,ebx
 0002AF63    mov         edx,dword ptr [eax]
 0002AF65    call        dword ptr [edx+10]
 0002AF68    mov         dl,byte ptr ds:[2AF8C]
 0002AF6E    mov         eax,ebx
 0002AF70    call        TCanvas.RequiredState
 0002AF75    mov         ecx,edi
 0002AF77    mov         edx,ebx
 0002AF79    mov         eax,esi
 0002AF7B    mov         esi,dword ptr [eax]
 0002AF7D    call        dword ptr [esi+14]
 0002AF80    mov         eax,ebx
 0002AF82    mov         edx,dword ptr [eax]
 0002AF84    call        dword ptr [edx+0C]
 0002AF87    pop         edi
 0002AF88    pop         esi
 0002AF89    pop         ebx
 0002AF8A    ret
*}
end;

//0002AF90
function TCanvas.GetCanvasOrientation:TCanvasOrientation;
begin
{*
 0002AF90    push        ebx
 0002AF91    push        esi
 0002AF92    add         esp,0FFFFFFF8
 0002AF95    mov         esi,eax
 0002AF97    xor         ebx,ebx
 0002AF99    test        byte ptr [esi+50],80
>0002AF9D    je          0002AFB5
 0002AF9F    push        esp
 0002AFA0    mov         eax,esi
 0002AFA2    call        TCanvas.GetHandle
 0002AFA7    push        eax
 0002AFA8    call        gdi32.GetWindowOrgEx
 0002AFAD    cmp         dword ptr [esp],0
>0002AFB1    je          0002AFB5
 0002AFB3    mov         bl,1
 0002AFB5    mov         eax,ebx
 0002AFB7    pop         ecx
 0002AFB8    pop         edx
 0002AFB9    pop         esi
 0002AFBA    pop         ebx
 0002AFBB    ret
*}
end;

//0002AFBC
procedure TCanvas.TextOut(X:Integer; Y:Integer; const Text:AnsiString);
begin
{*
 0002AFBC    push        ebp
 0002AFBD    mov         ebp,esp
 0002AFBF    push        ecx
 0002AFC0    push        ebx
 0002AFC1    push        esi
 0002AFC2    push        edi
 0002AFC3    mov         dword ptr [ebp-4],ecx
 0002AFC6    mov         edi,edx
 0002AFC8    mov         ebx,eax
 0002AFCA    mov         esi,dword ptr [ebp+8]
 0002AFCD    mov         eax,ebx
 0002AFCF    mov         edx,dword ptr [eax]
 0002AFD1    call        dword ptr [edx+10]
 0002AFD4    mov         dl,byte ptr ds:[2B044]
 0002AFDA    mov         eax,ebx
 0002AFDC    call        TCanvas.RequiredState
 0002AFE1    mov         eax,ebx
 0002AFE3    call        TCanvas.GetCanvasOrientation
 0002AFE8    cmp         al,1
>0002AFEA    jne         0002AFF8
 0002AFEC    mov         edx,esi
 0002AFEE    mov         eax,ebx
 0002AFF0    call        TCanvas.TextWidth
 0002AFF5    inc         eax
 0002AFF6    add         edi,eax
 0002AFF8    push        0
 0002AFFA    mov         eax,esi
 0002AFFC    call        @LStrLen
 0002B001    push        eax
 0002B002    mov         eax,esi
 0002B004    call        @LStrToPChar
 0002B009    push        eax
 0002B00A    push        0
 0002B00C    mov         eax,dword ptr [ebx+50]
 0002B00F    push        eax
 0002B010    mov         eax,dword ptr [ebp-4]
 0002B013    push        eax
 0002B014    push        edi
 0002B015    mov         eax,dword ptr [ebx+4]
 0002B018    push        eax
 0002B019    call        gdi32.ExtTextOutA
 0002B01E    mov         edx,esi
 0002B020    mov         eax,ebx
 0002B022    call        TCanvas.TextWidth
 0002B027    mov         edx,eax
 0002B029    add         edx,edi
 0002B02B    mov         ecx,dword ptr [ebp-4]
 0002B02E    mov         eax,ebx
 0002B030    call        TCanvas.MoveTo
 0002B035    mov         eax,ebx
 0002B037    mov         edx,dword ptr [eax]
 0002B039    call        dword ptr [edx+0C]
 0002B03C    pop         edi
 0002B03D    pop         esi
 0002B03E    pop         ebx
 0002B03F    pop         ecx
 0002B040    pop         ebp
 0002B041    ret         4
*}
end;

//0002B048
procedure TCanvas.TextRect(Rect:TRect; X:Integer; Y:Integer; const Text:AnsiString);
begin
{*
 0002B048    push        ebp
 0002B049    mov         ebp,esp
 0002B04B    add         esp,0FFFFFFEC
 0002B04E    push        ebx
 0002B04F    push        esi
 0002B050    push        edi
 0002B051    mov         esi,edx
 0002B053    lea         edi,[ebp-14]
 0002B056    push        ecx
 0002B057    mov         ecx,4
 0002B05C    rep movs    dword ptr [edi],dword ptr [esi]
 0002B05E    pop         ecx
 0002B05F    mov         dword ptr [ebp-4],ecx
 0002B062    mov         ebx,eax
 0002B064    mov         esi,dword ptr [ebp+8]
 0002B067    mov         eax,ebx
 0002B069    mov         edx,dword ptr [eax]
 0002B06B    call        dword ptr [edx+10]
 0002B06E    mov         dl,byte ptr ds:[2B0E8]
 0002B074    mov         eax,ebx
 0002B076    call        TCanvas.RequiredState
 0002B07B    mov         edi,dword ptr [ebx+50]
 0002B07E    or          edi,4
 0002B081    mov         eax,dword ptr [ebx+14]
 0002B084    call        TBrush.GetStyle
 0002B089    cmp         al,1
>0002B08B    je          0002B090
 0002B08D    add         edi,2
 0002B090    test        byte ptr [ebx+50],80
>0002B094    je          0002B0AE
 0002B096    mov         eax,ebx
 0002B098    call        TCanvas.GetCanvasOrientation
 0002B09D    cmp         al,1
>0002B09F    jne         0002B0AE
 0002B0A1    mov         edx,esi
 0002B0A3    mov         eax,ebx
 0002B0A5    call        TCanvas.TextWidth
 0002B0AA    inc         eax
 0002B0AB    add         dword ptr [ebp-4],eax
 0002B0AE    push        0
 0002B0B0    mov         eax,esi
 0002B0B2    call        @LStrLen
 0002B0B7    push        eax
 0002B0B8    mov         eax,esi
 0002B0BA    call        @LStrToPChar
 0002B0BF    push        eax
 0002B0C0    lea         eax,[ebp-14]
 0002B0C3    push        eax
 0002B0C4    push        edi
 0002B0C5    mov         eax,dword ptr [ebp+0C]
 0002B0C8    push        eax
 0002B0C9    mov         eax,dword ptr [ebp-4]
 0002B0CC    push        eax
 0002B0CD    mov         eax,dword ptr [ebx+4]
 0002B0D0    push        eax
 0002B0D1    call        gdi32.ExtTextOutA
 0002B0D6    mov         eax,ebx
 0002B0D8    mov         edx,dword ptr [eax]
 0002B0DA    call        dword ptr [edx+0C]
 0002B0DD    pop         edi
 0002B0DE    pop         esi
 0002B0DF    pop         ebx
 0002B0E0    mov         esp,ebp
 0002B0E2    pop         ebp
 0002B0E3    ret         8
*}
end;

//0002B0EC
function TCanvas.TextExtent(const Text:AnsiString):TSize;
begin
{*
 0002B0EC    push        ebx
 0002B0ED    push        esi
 0002B0EE    push        edi
 0002B0EF    mov         esi,ecx
 0002B0F1    mov         edi,edx
 0002B0F3    mov         ebx,eax
 0002B0F5    mov         dl,byte ptr ds:[2B12C]
 0002B0FB    mov         eax,ebx
 0002B0FD    call        TCanvas.RequiredState
 0002B102    xor         eax,eax
 0002B104    mov         dword ptr [esi],eax
 0002B106    xor         eax,eax
 0002B108    mov         dword ptr [esi+4],eax
 0002B10B    push        esi
 0002B10C    mov         eax,edi
 0002B10E    call        @LStrLen
 0002B113    push        eax
 0002B114    mov         eax,edi
 0002B116    call        @LStrToPChar
 0002B11B    push        eax
 0002B11C    mov         eax,dword ptr [ebx+4]
 0002B11F    push        eax
 0002B120    call        gdi32.GetTextExtentPointA
 0002B125    pop         edi
 0002B126    pop         esi
 0002B127    pop         ebx
 0002B128    ret
*}
end;

//0002B130
function TCanvas.TextWidth(const Text:AnsiString):Integer;
begin
{*
 0002B130    push        ebx
 0002B131    push        esi
 0002B132    add         esp,0FFFFFFF8
 0002B135    mov         esi,edx
 0002B137    mov         ebx,eax
 0002B139    mov         ecx,esp
 0002B13B    mov         edx,esi
 0002B13D    mov         eax,ebx
 0002B13F    call        TCanvas.TextExtent
 0002B144    mov         eax,dword ptr [esp]
 0002B147    pop         ecx
 0002B148    pop         edx
 0002B149    pop         esi
 0002B14A    pop         ebx
 0002B14B    ret
*}
end;

//0002B14C
function TCanvas.TextHeight(const Text:AnsiString):Integer;
begin
{*
 0002B14C    push        ebx
 0002B14D    push        esi
 0002B14E    add         esp,0FFFFFFF8
 0002B151    mov         esi,edx
 0002B153    mov         ebx,eax
 0002B155    mov         ecx,esp
 0002B157    mov         edx,esi
 0002B159    mov         eax,ebx
 0002B15B    call        TCanvas.TextExtent
 0002B160    mov         eax,dword ptr [esp+4]
 0002B164    pop         ecx
 0002B165    pop         edx
 0002B166    pop         esi
 0002B167    pop         ebx
 0002B168    ret
*}
end;

//0002B16C
function TCanvas.TryLock:Boolean;
begin
{*
 0002B16C    push        ebp
 0002B16D    mov         ebp,esp
 0002B16F    push        ecx
 0002B170    push        ebx
 0002B171    mov         ebx,eax
 0002B173    push        0B6668
 0002B178    call        kernel32.EnterCriticalSection
 0002B17D    xor         eax,eax
 0002B17F    push        ebp
 0002B180    push        2B1B8
 0002B185    push        dword ptr fs:[eax]
 0002B188    mov         dword ptr fs:[eax],esp
 0002B18B    cmp         dword ptr [ebx+4C],0
 0002B18F    sete        byte ptr [ebp-1]
 0002B193    cmp         byte ptr [ebp-1],0
>0002B197    je          0002B1A0
 0002B199    mov         eax,ebx
 0002B19B    call        TCanvas.Lock
 0002B1A0    xor         eax,eax
 0002B1A2    pop         edx
 0002B1A3    pop         ecx
 0002B1A4    pop         ecx
 0002B1A5    mov         dword ptr fs:[eax],edx
 0002B1A8    push        2B1BF
 0002B1AD    push        0B6668
 0002B1B2    call        kernel32.LeaveCriticalSection
 0002B1B7    ret
>0002B1B8    jmp         @HandleFinally
>0002B1BD    jmp         0002B1AD
 0002B1BF    mov         al,byte ptr [ebp-1]
 0002B1C2    pop         ebx
 0002B1C3    pop         ecx
 0002B1C4    pop         ebp
 0002B1C5    ret
*}
end;

//0002B1C8
procedure TCanvas.Unlock;
begin
{*
 0002B1C8    push        ebx
 0002B1C9    mov         ebx,eax
 0002B1CB    lea         eax,[ebx+34]
 0002B1CE    push        eax
 0002B1CF    call        kernel32.LeaveCriticalSection
 0002B1D4    push        0B6668
 0002B1D9    call        kernel32.EnterCriticalSection
 0002B1DE    dec         dword ptr [ebx+4C]
 0002B1E1    push        0B6668
 0002B1E6    call        kernel32.LeaveCriticalSection
 0002B1EB    pop         ebx
 0002B1EC    ret
*}
end;

//0002B1F0
procedure TCanvas.SetFont(Value:TFont);
begin
{*
 0002B1F0    push        esi
 0002B1F1    mov         esi,eax
 0002B1F3    mov         eax,dword ptr [esi+0C]
 0002B1F6    mov         ecx,dword ptr [eax]
 0002B1F8    call        dword ptr [ecx+8]
 0002B1FB    pop         esi
 0002B1FC    ret
*}
end;

//0002B200
procedure TCanvas.SetPen(Value:TPen);
begin
{*
 0002B200    mov         eax,dword ptr [eax+10]
 0002B203    mov         ecx,dword ptr [eax]
 0002B205    call        dword ptr [ecx+8]
 0002B208    ret
*}
end;

//0002B20C
procedure TCanvas.SetBrush(Value:TBrush);
begin
{*
 0002B20C    mov         eax,dword ptr [eax+14]
 0002B20F    mov         ecx,dword ptr [eax]
 0002B211    call        dword ptr [ecx+8]
 0002B214    ret
*}
end;

//0002B218
function TCanvas.GetPenPos:TPoint;
begin
{*
 0002B218    push        ebx
 0002B219    push        esi
 0002B21A    mov         esi,edx
 0002B21C    mov         ebx,eax
 0002B21E    mov         dl,byte ptr ds:[2B238]
 0002B224    mov         eax,ebx
 0002B226    call        TCanvas.RequiredState
 0002B22B    push        esi
 0002B22C    mov         eax,dword ptr [ebx+4]
 0002B22F    push        eax
 0002B230    call        gdi32.GetCurrentPositionEx
 0002B235    pop         esi
 0002B236    pop         ebx
 0002B237    ret
*}
end;

//0002B23C
procedure TCanvas.SetPenPos(Value:TPoint);
begin
{*
 0002B23C    push        esi
 0002B23D    push        edi
 0002B23E    add         esp,0FFFFFFF8
 0002B241    mov         esi,edx
 0002B243    lea         edi,[esp]
 0002B246    movs        dword ptr [edi],dword ptr [esi]
 0002B247    movs        dword ptr [edi],dword ptr [esi]
 0002B248    mov         ecx,dword ptr [esp+4]
 0002B24C    mov         edx,dword ptr [esp]
 0002B24F    call        TCanvas.MoveTo
 0002B254    pop         ecx
 0002B255    pop         edx
 0002B256    pop         edi
 0002B257    pop         esi
 0002B258    ret
*}
end;

//0002B25C
function TCanvas.GetPixel(X:Integer; Y:Integer):TColor;
begin
{*
 0002B25C    push        ebx
 0002B25D    push        esi
 0002B25E    push        edi
 0002B25F    mov         edi,ecx
 0002B261    mov         esi,edx
 0002B263    mov         ebx,eax
 0002B265    mov         dl,byte ptr ds:[2B284]
 0002B26B    mov         eax,ebx
 0002B26D    call        TCanvas.RequiredState
 0002B272    push        edi
 0002B273    push        esi
 0002B274    mov         eax,dword ptr [ebx+4]
 0002B277    push        eax
 0002B278    call        gdi32.GetPixel
 0002B27D    pop         edi
 0002B27E    pop         esi
 0002B27F    pop         ebx
 0002B280    ret
*}
end;

//0002B288
procedure TCanvas.SetPixel(X:Integer; Y:Integer; Value:TColor);
begin
{*
 0002B288    push        ebp
 0002B289    mov         ebp,esp
 0002B28B    push        ebx
 0002B28C    push        esi
 0002B28D    push        edi
 0002B28E    mov         edi,ecx
 0002B290    mov         esi,edx
 0002B292    mov         ebx,eax
 0002B294    mov         eax,ebx
 0002B296    mov         edx,dword ptr [eax]
 0002B298    call        dword ptr [edx+10]
 0002B29B    mov         dl,byte ptr ds:[2B2CC]
 0002B2A1    mov         eax,ebx
 0002B2A3    call        TCanvas.RequiredState
 0002B2A8    mov         eax,dword ptr [ebp+8]
 0002B2AB    call        ColorToRGB
 0002B2B0    push        eax
 0002B2B1    push        edi
 0002B2B2    push        esi
 0002B2B3    mov         eax,dword ptr [ebx+4]
 0002B2B6    push        eax
 0002B2B7    call        gdi32.SetPixel
 0002B2BC    mov         eax,ebx
 0002B2BE    mov         edx,dword ptr [eax]
 0002B2C0    call        dword ptr [edx+0C]
 0002B2C3    pop         edi
 0002B2C4    pop         esi
 0002B2C5    pop         ebx
 0002B2C6    pop         ebp
 0002B2C7    ret         4
*}
end;

//0002B2D0
function TCanvas.GetClipRect:TRect;
begin
{*
 0002B2D0    push        ebx
 0002B2D1    push        esi
 0002B2D2    mov         esi,edx
 0002B2D4    mov         ebx,eax
 0002B2D6    mov         dl,byte ptr ds:[2B2F0]
 0002B2DC    mov         eax,ebx
 0002B2DE    call        TCanvas.RequiredState
 0002B2E3    push        esi
 0002B2E4    mov         eax,dword ptr [ebx+4]
 0002B2E7    push        eax
 0002B2E8    call        gdi32.GetClipBox
 0002B2ED    pop         esi
 0002B2EE    pop         ebx
 0002B2EF    ret
*}
end;

//0002B2F4
function TCanvas.GetHandle:HDC;
begin
{*
 0002B2F4    push        ebx
 0002B2F5    mov         ebx,eax
 0002B2F7    mov         eax,ebx
 0002B2F9    mov         edx,dword ptr [eax]
 0002B2FB    call        dword ptr [edx+10]
 0002B2FE    mov         dl,byte ptr ds:[2B310]
 0002B304    mov         eax,ebx
 0002B306    call        TCanvas.RequiredState
 0002B30B    mov         eax,dword ptr [ebx+4]
 0002B30E    pop         ebx
 0002B30F    ret
*}
end;

//0002B314
procedure TCanvas.DeselectHandles;
begin
{*
 0002B314    push        ebx
 0002B315    push        esi
 0002B316    mov         ebx,eax
 0002B318    mov         esi,dword ptr [ebx+4]
 0002B31B    test        esi,esi
>0002B31D    je          0002B367
 0002B31F    mov         al,[0002B36C]
 0002B324    not         eax
 0002B326    and         al,byte ptr [ebx+8]
 0002B329    mov         dl,byte ptr [ebx+8]
 0002B32C    cmp         dl,al
>0002B32E    je          0002B367
 0002B330    mov         eax,[000B6640]
 0002B335    push        eax
 0002B336    push        esi
 0002B337    call        gdi32.SelectObject
 0002B33C    mov         eax,[000B6644]
 0002B341    push        eax
 0002B342    mov         eax,dword ptr [ebx+4]
 0002B345    push        eax
 0002B346    call        gdi32.SelectObject
 0002B34B    mov         eax,[000B6648]
 0002B350    push        eax
 0002B351    mov         eax,dword ptr [ebx+4]
 0002B354    push        eax
 0002B355    call        gdi32.SelectObject
 0002B35A    mov         al,[0002B36C]
 0002B35F    not         eax
 0002B361    and         al,byte ptr [ebx+8]
 0002B364    mov         byte ptr [ebx+8],al
 0002B367    pop         esi
 0002B368    pop         ebx
 0002B369    ret
*}
end;

//0002B370
procedure TCanvas.CreateHandle;
begin
{*
 0002B370    ret
*}
end;

//0002B374
procedure TCanvas.SetHandle(Value:HDC);
begin
{*
 0002B374    push        ebx
 0002B375    push        esi
 0002B376    add         esp,0FFFFFFF8
 0002B379    mov         esi,edx
 0002B37B    mov         ebx,eax
 0002B37D    mov         eax,dword ptr [ebx+4]
 0002B380    cmp         esi,eax
>0002B382    je          0002B3C3
 0002B384    test        eax,eax
>0002B386    je          0002B3AE
 0002B388    mov         eax,ebx
 0002B38A    call        TCanvas.DeselectHandles
 0002B38F    mov         edx,esp
 0002B391    mov         eax,ebx
 0002B393    call        TCanvas.GetPenPos
 0002B398    mov         eax,dword ptr [esp]
 0002B39B    mov         dword ptr [ebx+18],eax
 0002B39E    mov         eax,dword ptr [esp+4]
 0002B3A2    mov         dword ptr [ebx+1C],eax
 0002B3A5    xor         eax,eax
 0002B3A7    mov         dword ptr [ebx+4],eax
 0002B3AA    and         byte ptr [ebx+8],0FE
 0002B3AE    test        esi,esi
>0002B3B0    je          0002B3C3
 0002B3B2    or          byte ptr [ebx+8],1
 0002B3B6    mov         dword ptr [ebx+4],esi
 0002B3B9    lea         edx,[ebx+18]
 0002B3BC    mov         eax,ebx
 0002B3BE    call        TCanvas.SetPenPos
 0002B3C3    pop         ecx
 0002B3C4    pop         edx
 0002B3C5    pop         esi
 0002B3C6    pop         ebx
 0002B3C7    ret
*}
end;

//0002B3C8
procedure Error;
begin
{*
 0002B3C8    push        ebp
 0002B3C9    mov         ebp,esp
 0002B3CB    push        0
 0002B3CD    xor         eax,eax
 0002B3CF    push        ebp
 0002B3D0    push        2B412
 0002B3D5    push        dword ptr fs:[eax]
 0002B3D8    mov         dword ptr fs:[eax],esp
 0002B3DB    lea         edx,[ebp-4]
 0002B3DE    mov         eax,[000B5844];^SNoCanvasHandle:TResStringRec
 0002B3E3    call        LoadResString
 0002B3E8    mov         ecx,dword ptr [ebp-4]
 0002B3EB    mov         dl,1
 0002B3ED    mov         eax,[0001EE64];EInvalidOperation
 0002B3F2    call        Exception.Create
 0002B3F7    call        @RaiseExcept
 0002B3FC    xor         eax,eax
 0002B3FE    pop         edx
 0002B3FF    pop         ecx
 0002B400    pop         ecx
 0002B401    mov         dword ptr fs:[eax],edx
 0002B404    push        2B419
 0002B409    lea         eax,[ebp-4]
 0002B40C    call        @LStrClr
 0002B411    ret
>0002B412    jmp         @HandleFinally
>0002B417    jmp         0002B409
 0002B419    pop         ecx
 0002B41A    pop         ebp
 0002B41B    ret
*}
end;

//0002B41C
procedure TCanvas.RequiredState(ReqState:TCanvasState);
begin
{*
 0002B41C    push        ebx
 0002B41D    push        esi
 0002B41E    push        ecx
 0002B41F    mov         byte ptr [esp],dl
 0002B422    mov         esi,eax
 0002B424    mov         bl,byte ptr [esi+8]
 0002B427    not         ebx
 0002B429    and         bl,byte ptr [esp]
 0002B42C    mov         al,[0002B48C]
 0002B431    cmp         al,bl
>0002B433    je          0002B486
 0002B435    test        bl,1
>0002B438    je          0002B44C
 0002B43A    mov         eax,esi
 0002B43C    mov         edx,dword ptr [eax]
 0002B43E    call        dword ptr [edx+14]
 0002B441    cmp         dword ptr [esi+4],0
>0002B445    jne         0002B44C
 0002B447    call        Error
 0002B44C    test        bl,2
>0002B44F    je          0002B458
 0002B451    mov         eax,esi
 0002B453    call        TCanvas.CreateFont
 0002B458    test        bl,4
>0002B45B    je          0002B474
 0002B45D    mov         eax,esi
 0002B45F    call        TCanvas.CreatePen
 0002B464    mov         eax,dword ptr [esi+10]
 0002B467    call        TPen.GetStyle
 0002B46C    dec         eax
 0002B46D    sub         al,4
>0002B46F    jae         0002B474
 0002B471    or          bl,8
 0002B474    test        bl,8
>0002B477    je          0002B480
 0002B479    mov         eax,esi
 0002B47B    call        TCanvas.CreateBrush
 0002B480    or          bl,byte ptr [esi+8]
 0002B483    mov         byte ptr [esi+8],bl
 0002B486    pop         edx
 0002B487    pop         esi
 0002B488    pop         ebx
 0002B489    ret
*}
end;

//0002B490
procedure TCanvas.Changing;
begin
{*
 0002B490    push        ebx
 0002B491    cmp         word ptr [eax+2E],0
>0002B496    je          0002B4A2
 0002B498    mov         ebx,eax
 0002B49A    mov         edx,eax
 0002B49C    mov         eax,dword ptr [ebx+30]
 0002B49F    call        dword ptr [ebx+2C]
 0002B4A2    pop         ebx
 0002B4A3    ret
*}
end;

//0002B4A4
procedure TCanvas.Changed;
begin
{*
 0002B4A4    push        ebx
 0002B4A5    cmp         word ptr [eax+26],0
>0002B4AA    je          0002B4B6
 0002B4AC    mov         ebx,eax
 0002B4AE    mov         edx,eax
 0002B4B0    mov         eax,dword ptr [ebx+28]
 0002B4B3    call        dword ptr [ebx+24]
 0002B4B6    pop         ebx
 0002B4B7    ret
*}
end;

//0002B4B8
procedure TCanvas.CreateFont;
begin
{*
 0002B4B8    push        ebx
 0002B4B9    mov         ebx,eax
 0002B4BB    mov         eax,dword ptr [ebx+0C]
 0002B4BE    call        TFont.GetHandle
 0002B4C3    push        eax
 0002B4C4    mov         eax,dword ptr [ebx+4]
 0002B4C7    push        eax
 0002B4C8    call        gdi32.SelectObject
 0002B4CD    mov         eax,dword ptr [ebx+0C]
 0002B4D0    mov         eax,dword ptr [eax+14]
 0002B4D3    call        ColorToRGB
 0002B4D8    push        eax
 0002B4D9    mov         eax,dword ptr [ebx+4]
 0002B4DC    push        eax
 0002B4DD    call        gdi32.SetTextColor
 0002B4E2    pop         ebx
 0002B4E3    ret
*}
end;

//0002B4E4
procedure TCanvas.CreatePen;
begin
{*
 0002B4E4    push        ebx
 0002B4E5    mov         ebx,eax
 0002B4E7    mov         eax,dword ptr [ebx+10]
 0002B4EA    call        TPen.GetHandle
 0002B4EF    push        eax
 0002B4F0    mov         eax,dword ptr [ebx+4]
 0002B4F3    push        eax
 0002B4F4    call        gdi32.SelectObject
 0002B4F9    mov         eax,dword ptr [ebx+10]
 0002B4FC    movzx       eax,byte ptr [eax+14]
 0002B500    movzx       eax,word ptr [eax*2+0B45F8]
 0002B508    push        eax
 0002B509    mov         eax,dword ptr [ebx+4]
 0002B50C    push        eax
 0002B50D    call        gdi32.SetROP2
 0002B512    pop         ebx
 0002B513    ret
*}
end;

//0002B514
procedure TCanvas.CreateBrush;
begin
{*
 0002B514    push        ebx
 0002B515    mov         ebx,eax
 0002B517    mov         eax,dword ptr [ebx+14]
 0002B51A    call        TBrush.GetHandle
 0002B51F    push        eax
 0002B520    call        gdi32.UnrealizeObject
 0002B525    mov         eax,dword ptr [ebx+14]
 0002B528    call        TBrush.GetHandle
 0002B52D    push        eax
 0002B52E    mov         eax,dword ptr [ebx+4]
 0002B531    push        eax
 0002B532    call        gdi32.SelectObject
 0002B537    mov         eax,dword ptr [ebx+14]
 0002B53A    call        TBrush.GetStyle
 0002B53F    test        al,al
>0002B541    jne         0002B567
 0002B543    mov         eax,dword ptr [ebx+14]
 0002B546    call        TBrush.GetColor
 0002B54B    call        ColorToRGB
 0002B550    push        eax
 0002B551    mov         eax,dword ptr [ebx+4]
 0002B554    push        eax
 0002B555    call        gdi32.SetBkColor
 0002B55A    push        2
 0002B55C    mov         eax,dword ptr [ebx+4]
 0002B55F    push        eax
 0002B560    call        gdi32.SetBkMode
 0002B565    pop         ebx
 0002B566    ret
 0002B567    mov         eax,dword ptr [ebx+14]
 0002B56A    call        TBrush.GetColor
 0002B56F    call        ColorToRGB
 0002B574    not         eax
 0002B576    push        eax
 0002B577    mov         eax,dword ptr [ebx+4]
 0002B57A    push        eax
 0002B57B    call        gdi32.SetBkColor
 0002B580    push        1
 0002B582    mov         eax,dword ptr [ebx+4]
 0002B585    push        eax
 0002B586    call        gdi32.SetBkMode
 0002B58B    pop         ebx
 0002B58C    ret
*}
end;

//0002B590
procedure TCanvas.FontChanged(AFont:TObject);
begin
{*
 0002B590    push        ebx
 0002B591    mov         ebx,eax
 0002B593    test        byte ptr [ebx+8],2
>0002B597    je          0002B5AC
 0002B599    and         byte ptr [ebx+8],0FD
 0002B59D    mov         eax,[000B6648]
 0002B5A2    push        eax
 0002B5A3    mov         eax,dword ptr [ebx+4]
 0002B5A6    push        eax
 0002B5A7    call        gdi32.SelectObject
 0002B5AC    pop         ebx
 0002B5AD    ret
*}
end;

//0002B5B0
procedure TCanvas.PenChanged(APen:TObject);
begin
{*
 0002B5B0    push        ebx
 0002B5B1    mov         ebx,eax
 0002B5B3    test        byte ptr [ebx+8],4
>0002B5B7    je          0002B5CC
 0002B5B9    and         byte ptr [ebx+8],0FB
 0002B5BD    mov         eax,[000B6640]
 0002B5C2    push        eax
 0002B5C3    mov         eax,dword ptr [ebx+4]
 0002B5C6    push        eax
 0002B5C7    call        gdi32.SelectObject
 0002B5CC    pop         ebx
 0002B5CD    ret
*}
end;

//0002B5D0
procedure TCanvas.BrushChanged(ABrush:TObject);
begin
{*
 0002B5D0    push        ebx
 0002B5D1    mov         ebx,eax
 0002B5D3    test        byte ptr [ebx+8],8
>0002B5D7    je          0002B5EC
 0002B5D9    and         byte ptr [ebx+8],0F7
 0002B5DD    mov         eax,[000B6644]
 0002B5E2    push        eax
 0002B5E3    mov         eax,dword ptr [ebx+4]
 0002B5E6    push        eax
 0002B5E7    call        gdi32.SelectObject
 0002B5EC    pop         ebx
 0002B5ED    ret
*}
end;

//0002B5F0
procedure InvalidOperation(const Str:AnsiString);
begin
{*
 0002B5F0    push        ebx
 0002B5F1    mov         ebx,eax
 0002B5F3    mov         ecx,ebx
 0002B5F5    mov         dl,1
 0002B5F7    mov         eax,[00028394];EInvalidGraphicOperation
 0002B5FC    call        Exception.Create
 0002B601    call        @RaiseExcept
 0002B606    pop         ebx
 0002B607    ret
*}
end;

//0002B608
procedure InvalidGraphic(const Str:AnsiString);
begin
{*
 0002B608    push        ebx
 0002B609    mov         ebx,eax
 0002B60B    mov         ecx,ebx
 0002B60D    mov         dl,1
 0002B60F    mov         eax,[00028338];EInvalidGraphic
 0002B614    call        Exception.Create
 0002B619    call        @RaiseExcept
 0002B61E    pop         ebx
 0002B61F    ret
*}
end;

//0002B620
procedure InvalidBitmap;
begin
{*
 0002B620    push        ebp
 0002B621    mov         ebp,esp
 0002B623    push        0
 0002B625    xor         eax,eax
 0002B627    push        ebp
 0002B628    push        2B65E
 0002B62D    push        dword ptr fs:[eax]
 0002B630    mov         dword ptr fs:[eax],esp
 0002B633    lea         edx,[ebp-4]
 0002B636    mov         eax,[000B57F8];^SInvalidBitmap:TResStringRec
 0002B63B    call        LoadResString
 0002B640    mov         eax,dword ptr [ebp-4]
 0002B643    call        InvalidGraphic
 0002B648    xor         eax,eax
 0002B64A    pop         edx
 0002B64B    pop         ecx
 0002B64C    pop         ecx
 0002B64D    mov         dword ptr fs:[eax],edx
 0002B650    push        2B665
 0002B655    lea         eax,[ebp-4]
 0002B658    call        @LStrClr
 0002B65D    ret
>0002B65E    jmp         @HandleFinally
>0002B663    jmp         0002B655
 0002B665    pop         ecx
 0002B666    pop         ebp
 0002B667    ret
*}
end;

//0002B668
procedure InvalidIcon;
begin
{*
 0002B668    push        ebp
 0002B669    mov         ebp,esp
 0002B66B    push        0
 0002B66D    xor         eax,eax
 0002B66F    push        ebp
 0002B670    push        2B6A6
 0002B675    push        dword ptr fs:[eax]
 0002B678    mov         dword ptr fs:[eax],esp
 0002B67B    lea         edx,[ebp-4]
 0002B67E    mov         eax,[000B580C];^SInvalidIcon:TResStringRec
 0002B683    call        LoadResString
 0002B688    mov         eax,dword ptr [ebp-4]
 0002B68B    call        InvalidGraphic
 0002B690    xor         eax,eax
 0002B692    pop         edx
 0002B693    pop         ecx
 0002B694    pop         ecx
 0002B695    mov         dword ptr fs:[eax],edx
 0002B698    push        2B6AD
 0002B69D    lea         eax,[ebp-4]
 0002B6A0    call        @LStrClr
 0002B6A5    ret
>0002B6A6    jmp         @HandleFinally
>0002B6AB    jmp         0002B69D
 0002B6AD    pop         ecx
 0002B6AE    pop         ebp
 0002B6AF    ret
*}
end;

//0002B6B0
procedure InvalidMetafile;
begin
{*
 0002B6B0    push        ebp
 0002B6B1    mov         ebp,esp
 0002B6B3    push        0
 0002B6B5    xor         eax,eax
 0002B6B7    push        ebp
 0002B6B8    push        2B6EE
 0002B6BD    push        dword ptr fs:[eax]
 0002B6C0    mov         dword ptr fs:[eax],esp
 0002B6C3    lea         edx,[ebp-4]
 0002B6C6    mov         eax,[000B5A3C];^SInvalidMetafile:TResStringRec
 0002B6CB    call        LoadResString
 0002B6D0    mov         eax,dword ptr [ebp-4]
 0002B6D3    call        InvalidGraphic
 0002B6D8    xor         eax,eax
 0002B6DA    pop         edx
 0002B6DB    pop         ecx
 0002B6DC    pop         ecx
 0002B6DD    mov         dword ptr fs:[eax],edx
 0002B6E0    push        2B6F5
 0002B6E5    lea         eax,[ebp-4]
 0002B6E8    call        @LStrClr
 0002B6ED    ret
>0002B6EE    jmp         @HandleFinally
>0002B6F3    jmp         0002B6E5
 0002B6F5    pop         ecx
 0002B6F6    pop         ebp
 0002B6F7    ret
*}
end;

//0002B6F8
procedure OutOfResources;
begin
{*
 0002B6F8    push        ebp
 0002B6F9    mov         ebp,esp
 0002B6FB    push        0
 0002B6FD    xor         eax,eax
 0002B6FF    push        ebp
 0002B700    push        2B742
 0002B705    push        dword ptr fs:[eax]
 0002B708    mov         dword ptr fs:[eax],esp
 0002B70B    lea         edx,[ebp-4]
 0002B70E    mov         eax,[000B56E8];^SOutOfResources:TResStringRec
 0002B713    call        LoadResString
 0002B718    mov         ecx,dword ptr [ebp-4]
 0002B71B    mov         dl,1
 0002B71D    mov         eax,[0001EE08];EOutOfResources
 0002B722    call        Exception.Create
 0002B727    call        @RaiseExcept
 0002B72C    xor         eax,eax
 0002B72E    pop         edx
 0002B72F    pop         ecx
 0002B730    pop         ecx
 0002B731    mov         dword ptr fs:[eax],edx
 0002B734    push        2B749
 0002B739    lea         eax,[ebp-4]
 0002B73C    call        @LStrClr
 0002B741    ret
>0002B742    jmp         @HandleFinally
>0002B747    jmp         0002B739
 0002B749    pop         ecx
 0002B74A    pop         ebp
 0002B74B    ret
*}
end;

//0002B74C
procedure GDIError;
begin
{*
 0002B74C    push        ebp
 0002B74D    mov         ebp,esp
 0002B74F    add         esp,0FFFFFEFC
 0002B755    push        ebx
 0002B756    xor         eax,eax
 0002B758    mov         dword ptr [ebp-104],eax
 0002B75E    xor         eax,eax
 0002B760    push        ebp
 0002B761    push        2B7E8
 0002B766    push        dword ptr fs:[eax]
 0002B769    mov         dword ptr fs:[eax],esp
 0002B76C    call        kernel32.GetLastError
 0002B771    mov         ebx,eax
 0002B773    test        ebx,ebx
>0002B775    je          0002B7CA
 0002B777    push        0
 0002B779    push        100
 0002B77E    lea         eax,[ebp-100]
 0002B784    push        eax
 0002B785    push        400
 0002B78A    push        ebx
 0002B78B    push        0
 0002B78D    push        1000
 0002B792    call        kernel32.FormatMessageA
 0002B797    test        eax,eax
>0002B799    je          0002B7CA
 0002B79B    lea         eax,[ebp-104]
 0002B7A1    lea         edx,[ebp-100]
 0002B7A7    mov         ecx,100
 0002B7AC    call        @LStrFromArray
 0002B7B1    mov         ecx,dword ptr [ebp-104]
 0002B7B7    mov         dl,1
 0002B7B9    mov         eax,[0001EE08];EOutOfResources
 0002B7BE    call        Exception.Create
 0002B7C3    call        @RaiseExcept
>0002B7C8    jmp         0002B7CF
 0002B7CA    call        OutOfResources
 0002B7CF    xor         eax,eax
 0002B7D1    pop         edx
 0002B7D2    pop         ecx
 0002B7D3    pop         ecx
 0002B7D4    mov         dword ptr fs:[eax],edx
 0002B7D7    push        2B7EF
 0002B7DC    lea         eax,[ebp-104]
 0002B7E2    call        @LStrClr
 0002B7E7    ret
>0002B7E8    jmp         @HandleFinally
>0002B7ED    jmp         0002B7DC
 0002B7EF    pop         ebx
 0002B7F0    mov         esp,ebp
 0002B7F2    pop         ebp
 0002B7F3    ret
*}
end;

//0002B7F4
function GDICheck(Value:Integer):Integer;
begin
{*
 0002B7F4    push        ebx
 0002B7F5    mov         ebx,eax
 0002B7F7    test        ebx,ebx
>0002B7F9    jne         0002B800
 0002B7FB    call        GDIError
 0002B800    mov         eax,ebx
 0002B802    pop         ebx
 0002B803    ret
*}
end;

//0002B804
function DupBits(Src:HBITMAP; Size:TPoint; Mono:Boolean):HBITMAP;
begin
{*
 0002B804    push        ebp
 0002B805    mov         ebp,esp
 0002B807    add         esp,0FFFFFFCC
 0002B80A    push        ebx
 0002B80B    push        esi
 0002B80C    push        edi
 0002B80D    mov         esi,edx
 0002B80F    lea         edi,[ebp-0C]
 0002B812    movs        dword ptr [edi],dword ptr [esi]
 0002B813    movs        dword ptr [edi],dword ptr [esi]
 0002B814    mov         ebx,ecx
 0002B816    mov         dword ptr [ebp-4],eax
 0002B819    push        0
 0002B81B    call        gdi32.CreateCompatibleDC
 0002B820    mov         dword ptr [ebp-18],eax
 0002B823    push        0
 0002B825    call        gdi32.CreateCompatibleDC
 0002B82A    mov         dword ptr [ebp-1C],eax
 0002B82D    xor         eax,eax
 0002B82F    push        ebp
 0002B830    push        2B952
 0002B835    push        dword ptr fs:[eax]
 0002B838    mov         dword ptr fs:[eax],esp
 0002B83B    lea         eax,[ebp-34]
 0002B83E    push        eax
 0002B83F    push        18
 0002B841    mov         eax,dword ptr [ebp-4]
 0002B844    push        eax
 0002B845    call        gdi32.GetObjectA
 0002B84A    test        bl,bl
>0002B84C    je          0002B866
 0002B84E    push        0
 0002B850    push        1
 0002B852    push        1
 0002B854    mov         eax,dword ptr [ebp-8]
 0002B857    push        eax
 0002B858    mov         eax,dword ptr [ebp-0C]
 0002B85B    push        eax
 0002B85C    call        gdi32.CreateBitmap
 0002B861    mov         dword ptr [ebp-10],eax
>0002B864    jmp         0002B8C8
 0002B866    push        0
 0002B868    call        user32.GetDC
 0002B86D    mov         dword ptr [ebp-14],eax
 0002B870    cmp         dword ptr [ebp-14],0
>0002B874    jne         0002B87B
 0002B876    call        GDIError
 0002B87B    xor         eax,eax
 0002B87D    push        ebp
 0002B87E    push        2B8C1
 0002B883    push        dword ptr fs:[eax]
 0002B886    mov         dword ptr fs:[eax],esp
 0002B889    mov         eax,dword ptr [ebp-8]
 0002B88C    push        eax
 0002B88D    mov         eax,dword ptr [ebp-0C]
 0002B890    push        eax
 0002B891    mov         eax,dword ptr [ebp-14]
 0002B894    push        eax
 0002B895    call        gdi32.CreateCompatibleBitmap
 0002B89A    mov         dword ptr [ebp-10],eax
 0002B89D    cmp         dword ptr [ebp-10],0
>0002B8A1    jne         0002B8A8
 0002B8A3    call        GDIError
 0002B8A8    xor         eax,eax
 0002B8AA    pop         edx
 0002B8AB    pop         ecx
 0002B8AC    pop         ecx
 0002B8AD    mov         dword ptr fs:[eax],edx
 0002B8B0    push        2B8C8
 0002B8B5    mov         eax,dword ptr [ebp-14]
 0002B8B8    push        eax
 0002B8B9    push        0
 0002B8BB    call        user32.ReleaseDC
 0002B8C0    ret
>0002B8C1    jmp         @HandleFinally
>0002B8C6    jmp         0002B8B5
 0002B8C8    cmp         dword ptr [ebp-10],0
>0002B8CC    je          0002B932
 0002B8CE    mov         eax,dword ptr [ebp-4]
 0002B8D1    push        eax
 0002B8D2    mov         eax,dword ptr [ebp-18]
 0002B8D5    push        eax
 0002B8D6    call        gdi32.SelectObject
 0002B8DB    mov         ebx,eax
 0002B8DD    mov         eax,dword ptr [ebp-10]
 0002B8E0    push        eax
 0002B8E1    mov         eax,dword ptr [ebp-1C]
 0002B8E4    push        eax
 0002B8E5    call        gdi32.SelectObject
 0002B8EA    mov         esi,eax
 0002B8EC    push        0CC0020
 0002B8F1    mov         eax,dword ptr [ebp-2C]
 0002B8F4    push        eax
 0002B8F5    mov         eax,dword ptr [ebp-30]
 0002B8F8    push        eax
 0002B8F9    push        0
 0002B8FB    push        0
 0002B8FD    mov         eax,dword ptr [ebp-18]
 0002B900    push        eax
 0002B901    mov         eax,dword ptr [ebp-8]
 0002B904    push        eax
 0002B905    mov         eax,dword ptr [ebp-0C]
 0002B908    push        eax
 0002B909    push        0
 0002B90B    push        0
 0002B90D    mov         eax,dword ptr [ebp-1C]
 0002B910    push        eax
 0002B911    call        gdi32.StretchBlt
 0002B916    test        ebx,ebx
>0002B918    je          0002B924
 0002B91A    push        ebx
 0002B91B    mov         eax,dword ptr [ebp-18]
 0002B91E    push        eax
 0002B91F    call        gdi32.SelectObject
 0002B924    test        esi,esi
>0002B926    je          0002B932
 0002B928    push        esi
 0002B929    mov         eax,dword ptr [ebp-1C]
 0002B92C    push        eax
 0002B92D    call        gdi32.SelectObject
 0002B932    xor         eax,eax
 0002B934    pop         edx
 0002B935    pop         ecx
 0002B936    pop         ecx
 0002B937    mov         dword ptr fs:[eax],edx
 0002B93A    push        2B959
 0002B93F    mov         eax,dword ptr [ebp-18]
 0002B942    push        eax
 0002B943    call        gdi32.DeleteDC
 0002B948    mov         eax,dword ptr [ebp-1C]
 0002B94B    push        eax
 0002B94C    call        gdi32.DeleteDC
 0002B951    ret
>0002B952    jmp         @HandleFinally
>0002B957    jmp         0002B93F
 0002B959    mov         eax,dword ptr [ebp-10]
 0002B95C    pop         edi
 0002B95D    pop         esi
 0002B95E    pop         ebx
 0002B95F    mov         esp,ebp
 0002B961    pop         ebp
 0002B962    ret
*}
end;

//0002B964
function GetDInColors(BitCount:Word):Integer;
begin
{*
 0002B964    mov         edx,eax
 0002B966    dec         dx
>0002B969    je          0002B977
 0002B96B    sub         dx,3
>0002B96F    je          0002B977
 0002B971    sub         dx,4
>0002B975    jne         0002B981
 0002B977    mov         ecx,eax
 0002B979    mov         eax,1
 0002B97E    shl         eax,cl
 0002B980    ret
 0002B981    xor         eax,eax
 0002B983    ret
*}
end;

//0002B984
function BytesPerScanline(PixelsPerScanline:Longint; BitsPerPixel:Longint; Alignment:Longint):Longint;
begin
{*
 0002B984    dec         ecx
 0002B985    imul        edx
 0002B987    add         eax,ecx
 0002B989    not         ecx
 0002B98B    and         eax,ecx
 0002B98D    test        eax,eax
>0002B98F    jns         0002B994
 0002B991    add         eax,7
 0002B994    sar         eax,3
 0002B997    ret
*}
end;

//0002B998
function TransparentStretchBlt(DstDC:HDC; DstX:Integer; DstY:Integer; DstW:Integer; DstH:Integer; SrcDC:HDC; SrcX:Integer; SrcY:Integer; SrcW:Integer; SrcH:Integer; MaskDC:HDC; MaskX:Integer; MaskY:Integer):Boolean;
begin
{*
 0002B998    push        ebp
 0002B999    mov         ebp,esp
 0002B99B    add         esp,0FFFFFFDC
 0002B99E    push        ebx
 0002B99F    push        esi
 0002B9A0    push        edi
 0002B9A1    mov         dword ptr [ebp-8],ecx
 0002B9A4    mov         dword ptr [ebp-4],edx
 0002B9A7    mov         edi,eax
 0002B9A9    mov         esi,dword ptr [ebp+14]
 0002B9AC    mov         ebx,dword ptr [ebp+18]
 0002B9AF    mov         byte ptr [ebp-9],1
 0002B9B3    mov         eax,[000B5C00]
 0002B9B8    cmp         dword ptr [eax],2
>0002B9BB    jne         0002BA72
 0002B9C1    cmp         ebx,dword ptr [ebp+2C]
>0002B9C4    jne         0002BA72
 0002B9CA    cmp         esi,dword ptr [ebp+28]
>0002B9CD    jne         0002BA72
 0002B9D3    push        1
 0002B9D5    push        1
 0002B9D7    mov         eax,dword ptr [ebp+24]
 0002B9DA    push        eax
 0002B9DB    call        gdi32.CreateCompatibleBitmap
 0002B9E0    call        GDICheck
 0002B9E5    mov         dword ptr [ebp-14],eax
 0002B9E8    mov         eax,dword ptr [ebp-14]
 0002B9EB    push        eax
 0002B9EC    mov         eax,dword ptr [ebp+10]
 0002B9EF    push        eax
 0002B9F0    call        gdi32.SelectObject
 0002B9F5    mov         dword ptr [ebp-14],eax
 0002B9F8    xor         eax,eax
 0002B9FA    push        ebp
 0002B9FB    push        2BA6B
 0002BA00    push        dword ptr fs:[eax]
 0002BA03    mov         dword ptr fs:[eax],esp
 0002BA06    mov         edx,0CC0020
 0002BA0B    mov         eax,0AA0029
 0002BA10    call        MakeROP4
 0002BA15    push        eax
 0002BA16    mov         eax,dword ptr [ebp+8]
 0002BA19    push        eax
 0002BA1A    mov         eax,dword ptr [ebp+0C]
 0002BA1D    push        eax
 0002BA1E    mov         eax,dword ptr [ebp-14]
 0002BA21    push        eax
 0002BA22    mov         eax,dword ptr [ebp+1C]
 0002BA25    push        eax
 0002BA26    mov         eax,dword ptr [ebp+20]
 0002BA29    push        eax
 0002BA2A    mov         eax,dword ptr [ebp+24]
 0002BA2D    push        eax
 0002BA2E    mov         eax,dword ptr [ebp+28]
 0002BA31    push        eax
 0002BA32    mov         eax,dword ptr [ebp+2C]
 0002BA35    push        eax
 0002BA36    mov         eax,dword ptr [ebp-8]
 0002BA39    push        eax
 0002BA3A    mov         eax,dword ptr [ebp-4]
 0002BA3D    push        eax
 0002BA3E    push        edi
 0002BA3F    call        gdi32.MaskBlt
 0002BA44    xor         eax,eax
 0002BA46    pop         edx
 0002BA47    pop         ecx
 0002BA48    pop         ecx
 0002BA49    mov         dword ptr fs:[eax],edx
 0002BA4C    push        2BC1F
 0002BA51    mov         eax,dword ptr [ebp-14]
 0002BA54    push        eax
 0002BA55    mov         eax,dword ptr [ebp+10]
 0002BA58    push        eax
 0002BA59    call        gdi32.SelectObject
 0002BA5E    mov         dword ptr [ebp-14],eax
 0002BA61    mov         eax,dword ptr [ebp-14]
 0002BA64    push        eax
 0002BA65    call        gdi32.DeleteObject
 0002BA6A    ret
>0002BA6B    jmp         @HandleFinally
>0002BA70    jmp         0002BA51
 0002BA72    xor         eax,eax
 0002BA74    mov         dword ptr [ebp-24],eax
 0002BA77    push        0
 0002BA79    call        gdi32.CreateCompatibleDC
 0002BA7E    call        GDICheck
 0002BA83    mov         dword ptr [ebp-10],eax
 0002BA86    xor         eax,eax
 0002BA88    push        ebp
 0002BA89    push        2BC18
 0002BA8E    push        dword ptr fs:[eax]
 0002BA91    mov         dword ptr fs:[eax],esp
 0002BA94    push        esi
 0002BA95    push        ebx
 0002BA96    mov         eax,dword ptr [ebp+24]
 0002BA99    push        eax
 0002BA9A    call        gdi32.CreateCompatibleBitmap
 0002BA9F    call        GDICheck
 0002BAA4    mov         dword ptr [ebp-14],eax
 0002BAA7    mov         eax,dword ptr [ebp-14]
 0002BAAA    push        eax
 0002BAAB    mov         eax,dword ptr [ebp-10]
 0002BAAE    push        eax
 0002BAAF    call        gdi32.SelectObject
 0002BAB4    mov         dword ptr [ebp-18],eax
 0002BAB7    push        0
 0002BAB9    mov         eax,[000B6634]
 0002BABE    push        eax
 0002BABF    mov         eax,dword ptr [ebp+24]
 0002BAC2    push        eax
 0002BAC3    call        gdi32.SelectPalette
 0002BAC8    mov         dword ptr [ebp-24],eax
 0002BACB    push        0
 0002BACD    mov         eax,dword ptr [ebp-24]
 0002BAD0    push        eax
 0002BAD1    mov         eax,dword ptr [ebp+24]
 0002BAD4    push        eax
 0002BAD5    call        gdi32.SelectPalette
 0002BADA    cmp         dword ptr [ebp-24],0
>0002BADE    je          0002BAF4
 0002BAE0    push        0FF
 0002BAE2    mov         eax,dword ptr [ebp-24]
 0002BAE5    push        eax
 0002BAE6    mov         eax,dword ptr [ebp-10]
 0002BAE9    push        eax
 0002BAEA    call        gdi32.SelectPalette
 0002BAEF    mov         dword ptr [ebp-24],eax
>0002BAF2    jmp         0002BB08
 0002BAF4    push        0FF
 0002BAF6    mov         eax,[000B6634]
 0002BAFB    push        eax
 0002BAFC    mov         eax,dword ptr [ebp-10]
 0002BAFF    push        eax
 0002BB00    call        gdi32.SelectPalette
 0002BB05    mov         dword ptr [ebp-24],eax
 0002BB08    mov         eax,dword ptr [ebp-10]
 0002BB0B    push        eax
 0002BB0C    call        gdi32.RealizePalette
 0002BB11    push        0CC0020
 0002BB16    push        esi
 0002BB17    push        ebx
 0002BB18    mov         eax,dword ptr [ebp+8]
 0002BB1B    push        eax
 0002BB1C    mov         eax,dword ptr [ebp+0C]
 0002BB1F    push        eax
 0002BB20    mov         eax,dword ptr [ebp+10]
 0002BB23    push        eax
 0002BB24    push        esi
 0002BB25    push        ebx
 0002BB26    push        0
 0002BB28    push        0
 0002BB2A    mov         eax,dword ptr [ebp-10]
 0002BB2D    push        eax
 0002BB2E    call        gdi32.StretchBlt
 0002BB33    push        440328
 0002BB38    push        esi
 0002BB39    push        ebx
 0002BB3A    mov         eax,dword ptr [ebp+1C]
 0002BB3D    push        eax
 0002BB3E    mov         eax,dword ptr [ebp+20]
 0002BB41    push        eax
 0002BB42    mov         eax,dword ptr [ebp+24]
 0002BB45    push        eax
 0002BB46    push        esi
 0002BB47    push        ebx
 0002BB48    push        0
 0002BB4A    push        0
 0002BB4C    mov         eax,dword ptr [ebp-10]
 0002BB4F    push        eax
 0002BB50    call        gdi32.StretchBlt
 0002BB55    push        0
 0002BB57    push        edi
 0002BB58    call        gdi32.SetTextColor
 0002BB5D    mov         dword ptr [ebp-1C],eax
 0002BB60    push        0FFFFFF
 0002BB65    push        edi
 0002BB66    call        gdi32.SetBkColor
 0002BB6B    mov         dword ptr [ebp-20],eax
 0002BB6E    push        8800C6
 0002BB73    push        esi
 0002BB74    push        ebx
 0002BB75    mov         eax,dword ptr [ebp+8]
 0002BB78    push        eax
 0002BB79    mov         eax,dword ptr [ebp+0C]
 0002BB7C    push        eax
 0002BB7D    mov         eax,dword ptr [ebp+10]
 0002BB80    push        eax
 0002BB81    mov         eax,dword ptr [ebp+28]
 0002BB84    push        eax
 0002BB85    mov         eax,dword ptr [ebp+2C]
 0002BB88    push        eax
 0002BB89    mov         eax,dword ptr [ebp-8]
 0002BB8C    push        eax
 0002BB8D    mov         eax,dword ptr [ebp-4]
 0002BB90    push        eax
 0002BB91    push        edi
 0002BB92    call        gdi32.StretchBlt
 0002BB97    push        660046
 0002BB9C    push        esi
 0002BB9D    push        ebx
 0002BB9E    push        0
 0002BBA0    push        0
 0002BBA2    mov         eax,dword ptr [ebp-10]
 0002BBA5    push        eax
 0002BBA6    mov         eax,dword ptr [ebp+28]
 0002BBA9    push        eax
 0002BBAA    mov         eax,dword ptr [ebp+2C]
 0002BBAD    push        eax
 0002BBAE    mov         eax,dword ptr [ebp-8]
 0002BBB1    push        eax
 0002BBB2    mov         eax,dword ptr [ebp-4]
 0002BBB5    push        eax
 0002BBB6    push        edi
 0002BBB7    call        gdi32.StretchBlt
 0002BBBC    mov         eax,dword ptr [ebp-1C]
 0002BBBF    push        eax
 0002BBC0    push        edi
 0002BBC1    call        gdi32.SetTextColor
 0002BBC6    mov         eax,dword ptr [ebp-20]
 0002BBC9    push        eax
 0002BBCA    push        edi
 0002BBCB    call        gdi32.SetBkColor
 0002BBD0    cmp         dword ptr [ebp-18],0
>0002BBD4    je          0002BBE3
 0002BBD6    mov         eax,dword ptr [ebp-18]
 0002BBD9    push        eax
 0002BBDA    mov         eax,dword ptr [ebp-10]
 0002BBDD    push        eax
 0002BBDE    call        gdi32.SelectObject
 0002BBE3    mov         eax,dword ptr [ebp-14]
 0002BBE6    push        eax
 0002BBE7    call        gdi32.DeleteObject
 0002BBEC    xor         eax,eax
 0002BBEE    pop         edx
 0002BBEF    pop         ecx
 0002BBF0    pop         ecx
 0002BBF1    mov         dword ptr fs:[eax],edx
 0002BBF4    push        2BC1F
 0002BBF9    cmp         dword ptr [ebp-24],0
>0002BBFD    je          0002BC0E
 0002BBFF    push        0
 0002BC01    mov         eax,dword ptr [ebp-24]
 0002BC04    push        eax
 0002BC05    mov         eax,dword ptr [ebp-10]
 0002BC08    push        eax
 0002BC09    call        gdi32.SelectPalette
 0002BC0E    mov         eax,dword ptr [ebp-10]
 0002BC11    push        eax
 0002BC12    call        gdi32.DeleteDC
 0002BC17    ret
>0002BC18    jmp         @HandleFinally
>0002BC1D    jmp         0002BBF9
 0002BC1F    mov         al,byte ptr [ebp-9]
 0002BC22    pop         edi
 0002BC23    pop         esi
 0002BC24    pop         ebx
 0002BC25    mov         esp,ebp
 0002BC27    pop         ebp
 0002BC28    ret         28
*}
end;

//0002BC2C
procedure RGBTripleToQuad(var ColorTable:void );
begin
{*
 0002BC2C    push        ebx
 0002BC2D    push        esi
 0002BC2E    push        edi
 0002BC2F    mov         esi,eax
 0002BC31    mov         edi,esi
 0002BC33    mov         edx,0FF
 0002BC38    lea         eax,[edi+edx*4]
 0002BC3B    lea         ecx,[edx+edx*2]
 0002BC3E    lea         ecx,[esi+ecx]
 0002BC41    mov         bl,byte ptr [ecx+2]
 0002BC44    mov         byte ptr [eax+2],bl
 0002BC47    mov         bl,byte ptr [ecx+1]
 0002BC4A    mov         byte ptr [eax+1],bl
 0002BC4D    mov         cl,byte ptr [ecx]
 0002BC4F    mov         byte ptr [eax],cl
 0002BC51    mov         byte ptr [eax+3],0
 0002BC55    dec         edx
 0002BC56    test        edx,edx
>0002BC58    jne         0002BC38
 0002BC5A    mov         byte ptr [edi+3],0
 0002BC5E    pop         edi
 0002BC5F    pop         esi
 0002BC60    pop         ebx
 0002BC61    ret
*}
end;

//0002BC64
procedure RGBQuadToTriple(var ColorTable:void ; var ColorCount:Integer);
begin
{*
 0002BC64    push        ebx
 0002BC65    push        esi
 0002BC66    push        edi
 0002BC67    add         esp,0FFFFFFF8
 0002BC6A    mov         dword ptr [esp],edx
 0002BC6D    mov         esi,eax
 0002BC6F    mov         dword ptr [esp+4],esi
 0002BC73    mov         edi,dword ptr [esp]
 0002BC76    mov         edi,dword ptr [edi]
 0002BC78    dec         edi
 0002BC79    test        edi,edi
>0002BC7B    jle         0002BCA3
 0002BC7D    mov         ecx,1
 0002BC82    mov         eax,dword ptr [esp+4]
 0002BC86    lea         eax,[eax+ecx*4]
 0002BC89    lea         edx,[ecx+ecx*2]
 0002BC8C    lea         edx,[esi+edx]
 0002BC8F    mov         bl,byte ptr [eax+2]
 0002BC92    mov         byte ptr [edx+2],bl
 0002BC95    mov         bl,byte ptr [eax+1]
 0002BC98    mov         byte ptr [edx+1],bl
 0002BC9B    mov         al,byte ptr [eax]
 0002BC9D    mov         byte ptr [edx],al
 0002BC9F    inc         ecx
 0002BCA0    dec         edi
>0002BCA1    jne         0002BC82
 0002BCA3    mov         eax,dword ptr [esp]
 0002BCA6    cmp         dword ptr [eax],100
>0002BCAC    jge         0002BCD6
 0002BCAE    mov         eax,dword ptr [esp]
 0002BCB1    mov         edx,100
 0002BCB6    sub         edx,dword ptr [eax]
 0002BCB8    lea         edx,[edx+edx*2]
 0002BCBB    mov         eax,dword ptr [esp]
 0002BCBE    mov         eax,dword ptr [eax]
 0002BCC0    lea         eax,[eax+eax*2]
 0002BCC3    lea         eax,[esi+eax]
 0002BCC6    xor         ecx,ecx
 0002BCC8    call        @FillChar
 0002BCCD    mov         eax,dword ptr [esp]
 0002BCD0    mov         dword ptr [eax],100
 0002BCD6    pop         ecx
 0002BCD7    pop         edx
 0002BCD8    pop         edi
 0002BCD9    pop         esi
 0002BCDA    pop         ebx
 0002BCDB    ret
*}
end;

//0002BCDC
procedure ByteSwapColors(var Colors:void ; Count:Integer);
begin
{*
 0002BCDC    push        ebp
 0002BCDD    mov         ebp,esp
 0002BCDF    add         esp,0FFFFFFD4
 0002BCE2    mov         dword ptr [ebp-8],edx
 0002BCE5    mov         dword ptr [ebp-4],eax
 0002BCE8    lea         eax,[ebp-2C]
 0002BCEB    push        eax
 0002BCEC    call        kernel32.GetSystemInfo
 0002BCF1    mov         edx,dword ptr [ebp-4]
 0002BCF4    mov         ecx,dword ptr [ebp-8]
 0002BCF7    dec         ecx
>0002BCF8    js          0002BD2D
 0002BCFA    lea         eax,[ebp-2C]
 0002BCFD    cmp         word ptr [eax+20],3
>0002BD02    je          0002BD14
 0002BD04    mov         eax,dword ptr [edx+ecx*4]
 0002BD07    bswap       eax
 0002BD09    shr         eax,8
 0002BD0C    mov         dword ptr [edx+ecx*4],eax
 0002BD0F    dec         ecx
>0002BD10    jns         0002BD04
>0002BD12    jmp         0002BD2D
 0002BD14    push        ebx
 0002BD15    xor         ebx,ebx
 0002BD17    mov         eax,dword ptr [edx+ecx*4]
 0002BD1A    mov         bh,al
 0002BD1C    mov         bl,ah
 0002BD1E    shr         eax,10
 0002BD21    shl         ebx,8
 0002BD24    mov         bl,al
 0002BD26    mov         dword ptr [edx+ecx*4],ebx
 0002BD29    dec         ecx
>0002BD2A    jns         0002BD15
 0002BD2C    pop         ebx
 0002BD2D    mov         esp,ebp
 0002BD2F    pop         ebp
 0002BD30    ret
*}
end;

//0002BD34
function CreateSystemPalette(const Entries:array[$0..-$1] of TColor; const _Dv_:$0..-$1):HPALETTE;
begin
{*
 0002BD34    push        ebp
 0002BD35    mov         ebp,esp
 0002BD37    add         esp,0FFFFFBF8
 0002BD3D    push        ebx
 0002BD3E    mov         word ptr [ebp-408],300
 0002BD47    mov         word ptr [ebp-406],10
 0002BD50    lea         edx,[ebp-404]
 0002BD56    mov         ecx,40
 0002BD5B    call        Move
 0002BD60    push        0
 0002BD62    call        user32.GetDC
 0002BD67    mov         dword ptr [ebp-4],eax
 0002BD6A    xor         eax,eax
 0002BD6C    push        ebp
 0002BD6D    push        2BE31
 0002BD72    push        dword ptr fs:[eax]
 0002BD75    mov         dword ptr fs:[eax],esp
 0002BD78    push        68
 0002BD7A    mov         eax,dword ptr [ebp-4]
 0002BD7D    push        eax
 0002BD7E    call        gdi32.GetDeviceCaps
 0002BD83    mov         ebx,eax
 0002BD85    cmp         ebx,10
>0002BD88    jl          0002BE18
 0002BD8E    lea         eax,[ebp-404]
 0002BD94    push        eax
 0002BD95    push        8
 0002BD97    push        0
 0002BD99    mov         eax,dword ptr [ebp-4]
 0002BD9C    push        eax
 0002BD9D    call        gdi32.GetSystemPaletteEntries
 0002BDA2    cmp         dword ptr [ebp-3E8],0C0C0C0
>0002BDAC    jne         0002BDFA
 0002BDAE    lea         eax,[ebp-3E8]
 0002BDB4    push        eax
 0002BDB5    push        1
 0002BDB7    mov         eax,ebx
 0002BDB9    sub         eax,8
 0002BDBC    push        eax
 0002BDBD    mov         eax,dword ptr [ebp-4]
 0002BDC0    push        eax
 0002BDC1    call        gdi32.GetSystemPaletteEntries
 0002BDC6    movzx       eax,word ptr [ebp-406]
 0002BDCD    lea         eax,[ebp+eax*4-420]
 0002BDD4    push        eax
 0002BDD5    push        7
 0002BDD7    sub         ebx,7
 0002BDDA    push        ebx
 0002BDDB    mov         eax,dword ptr [ebp-4]
 0002BDDE    push        eax
 0002BDDF    call        gdi32.GetSystemPaletteEntries
 0002BDE4    lea         eax,[ebp-3E4]
 0002BDEA    push        eax
 0002BDEB    push        1
 0002BDED    push        7
 0002BDEF    mov         eax,dword ptr [ebp-4]
 0002BDF2    push        eax
 0002BDF3    call        gdi32.GetSystemPaletteEntries
>0002BDF8    jmp         0002BE18
 0002BDFA    movzx       eax,word ptr [ebp-406]
 0002BE01    lea         eax,[ebp+eax*4-424]
 0002BE08    push        eax
 0002BE09    push        8
 0002BE0B    sub         ebx,8
 0002BE0E    push        ebx
 0002BE0F    mov         eax,dword ptr [ebp-4]
 0002BE12    push        eax
 0002BE13    call        gdi32.GetSystemPaletteEntries
 0002BE18    xor         eax,eax
 0002BE1A    pop         edx
 0002BE1B    pop         ecx
 0002BE1C    pop         ecx
 0002BE1D    mov         dword ptr fs:[eax],edx
 0002BE20    push        2BE38
 0002BE25    mov         eax,dword ptr [ebp-4]
 0002BE28    push        eax
 0002BE29    push        0
 0002BE2B    call        user32.ReleaseDC
 0002BE30    ret
>0002BE31    jmp         @HandleFinally
>0002BE36    jmp         0002BE25
 0002BE38    lea         eax,[ebp-408]
 0002BE3E    push        eax
 0002BE3F    call        gdi32.CreatePalette
 0002BE44    pop         ebx
 0002BE45    mov         esp,ebp
 0002BE47    pop         ebp
 0002BE48    ret
*}
end;

//0002BE4C
function SystemPaletteOverride(var Pal:TMaxLogPalette):Boolean;
begin
{*
 0002BE4C    push        ebp
 0002BE4D    mov         ebp,esp
 0002BE4F    add         esp,0FFFFFFF8
 0002BE52    push        ebx
 0002BE53    mov         ebx,eax
 0002BE55    mov         byte ptr [ebp-1],0
 0002BE59    cmp         dword ptr ds:[0B6634],0
>0002BE60    je          0002BED9
 0002BE62    push        0
 0002BE64    call        user32.GetDC
 0002BE69    mov         dword ptr [ebp-8],eax
 0002BE6C    xor         edx,edx
 0002BE6E    push        ebp
 0002BE6F    push        2BED2
 0002BE74    push        dword ptr fs:[edx]
 0002BE77    mov         dword ptr fs:[edx],esp
 0002BE7A    push        68
 0002BE7C    mov         eax,dword ptr [ebp-8]
 0002BE7F    push        eax
 0002BE80    call        gdi32.GetDeviceCaps
 0002BE85    cmp         eax,10
>0002BE88    jl          0002BEB9
 0002BE8A    lea         eax,[ebx+4]
 0002BE8D    push        eax
 0002BE8E    push        8
 0002BE90    push        0
 0002BE92    mov         eax,[000B6634]
 0002BE97    push        eax
 0002BE98    call        gdi32.GetPaletteEntries
 0002BE9D    movzx       eax,word ptr [ebx+2]
 0002BEA1    lea         eax,[ebx+eax*4-1C]
 0002BEA5    push        eax
 0002BEA6    push        8
 0002BEA8    push        8
 0002BEAA    mov         eax,[000B6634]
 0002BEAF    push        eax
 0002BEB0    call        gdi32.GetPaletteEntries
 0002BEB5    mov         byte ptr [ebp-1],1
 0002BEB9    xor         eax,eax
 0002BEBB    pop         edx
 0002BEBC    pop         ecx
 0002BEBD    pop         ecx
 0002BEBE    mov         dword ptr fs:[eax],edx
 0002BEC1    push        2BED9
 0002BEC6    mov         eax,dword ptr [ebp-8]
 0002BEC9    push        eax
 0002BECA    push        0
 0002BECC    call        user32.ReleaseDC
 0002BED1    ret
>0002BED2    jmp         @HandleFinally
>0002BED7    jmp         0002BEC6
 0002BED9    mov         al,byte ptr [ebp-1]
 0002BEDC    pop         ebx
 0002BEDD    pop         ecx
 0002BEDE    pop         ecx
 0002BEDF    pop         ebp
 0002BEE0    ret
*}
end;

//0002BEE4
function PaletteFromDIBColorTable(DIBHandle:THandle; ColorTable:Pointer; ColorCount:Integer):HPALETTE;
begin
{*
 0002BEE4    push        ebx
 0002BEE5    push        esi
 0002BEE6    push        edi
 0002BEE7    add         esp,0FFFFFBFC
 0002BEED    mov         edi,eax
 0002BEEF    xor         esi,esi
 0002BEF1    mov         word ptr [esp],300
 0002BEF7    test        edi,edi
>0002BEF9    je          0002BF33
 0002BEFB    push        0
 0002BEFD    call        gdi32.CreateCompatibleDC
 0002BF02    mov         ebx,eax
 0002BF04    push        edi
 0002BF05    push        ebx
 0002BF06    call        gdi32.SelectObject
 0002BF0B    mov         edi,eax
 0002BF0D    lea         eax,[esp+4]
 0002BF11    push        eax
 0002BF12    push        100
 0002BF17    push        0
 0002BF19    push        ebx
 0002BF1A    call        gdi32.GetDIBColorTable
 0002BF1F    mov         word ptr [esp+2],ax
 0002BF24    push        edi
 0002BF25    push        ebx
 0002BF26    call        gdi32.SelectObject
 0002BF2B    push        ebx
 0002BF2C    call        gdi32.DeleteDC
>0002BF31    jmp         0002BF46
 0002BF33    mov         word ptr [esp+2],cx
 0002BF38    mov         eax,edx
 0002BF3A    lea         edx,[esp+4]
 0002BF3E    shl         ecx,2
 0002BF41    call        Move
 0002BF46    cmp         word ptr [esp+2],0
>0002BF4C    je          0002BF79
 0002BF4E    cmp         word ptr [esp+2],10
>0002BF54    jne         0002BF61
 0002BF56    mov         eax,esp
 0002BF58    call        SystemPaletteOverride
 0002BF5D    test        al,al
>0002BF5F    jne         0002BF6F
 0002BF61    movzx       edx,word ptr [esp+2]
 0002BF66    lea         eax,[esp+4]
 0002BF6A    call        ByteSwapColors
 0002BF6F    mov         eax,esp
 0002BF71    push        eax
 0002BF72    call        gdi32.CreatePalette
 0002BF77    mov         esi,eax
 0002BF79    mov         eax,esi
 0002BF7B    add         esp,404
 0002BF81    pop         edi
 0002BF82    pop         esi
 0002BF83    pop         ebx
 0002BF84    ret
*}
end;

//0002BF88
function PaletteToDIBColorTable(Pal:HPALETTE; var ColorTable:array[$0..-$1] of Windows.TRGBQuad; const _Dv_:$0..-$1):Integer;
begin
{*
 0002BF88    push        ebx
 0002BF89    push        esi
 0002BF8A    push        edi
 0002BF8B    push        ecx
 0002BF8C    mov         edi,ecx
 0002BF8E    mov         esi,edx
 0002BF90    mov         ebx,eax
 0002BF92    xor         eax,eax
 0002BF94    mov         dword ptr [esp],eax
 0002BF97    test        ebx,ebx
>0002BF99    je          0002BFD1
 0002BF9B    push        esp
 0002BF9C    push        4
 0002BF9E    push        ebx
 0002BF9F    call        gdi32.GetObjectA
 0002BFA4    test        eax,eax
>0002BFA6    je          0002BFD1
 0002BFA8    cmp         dword ptr [esp],0
>0002BFAC    je          0002BFD1
 0002BFAE    lea         eax,[edi+1]
 0002BFB1    cmp         eax,dword ptr [esp]
>0002BFB4    jge         0002BFB9
 0002BFB6    mov         dword ptr [esp],eax
 0002BFB9    push        esi
 0002BFBA    mov         eax,dword ptr [esp+4]
 0002BFBE    push        eax
 0002BFBF    push        0
 0002BFC1    push        ebx
 0002BFC2    call        gdi32.GetPaletteEntries
 0002BFC7    mov         eax,esi
 0002BFC9    mov         edx,dword ptr [esp]
 0002BFCC    call        ByteSwapColors
 0002BFD1    mov         eax,dword ptr [esp]
 0002BFD4    pop         edx
 0002BFD5    pop         edi
 0002BFD6    pop         esi
 0002BFD7    pop         ebx
 0002BFD8    ret
*}
end;

//0002BFDC
procedure TwoBitsFromDIB(var BI:TBitmapInfoHeader; var XorBits:HBITMAP; var AndBits:HBITMAP);
begin
{*
 0002BFDC    push        ebp
 0002BFDD    mov         ebp,esp
 0002BFDF    add         esp,0FFFFFFE4
 0002BFE2    push        ebx
 0002BFE3    push        esi
 0002BFE4    push        edi
 0002BFE5    mov         dword ptr [ebp-8],ecx
 0002BFE8    mov         ebx,edx
 0002BFEA    mov         dword ptr [ebp-4],eax
 0002BFED    push        0B
 0002BFEF    call        user32.GetSystemMetrics
 0002BFF4    mov         dword ptr [ebp-1C],eax
 0002BFF7    push        0C
 0002BFF9    call        user32.GetSystemMetrics
 0002BFFE    mov         dword ptr [ebp-18],eax
 0002C001    mov         eax,dword ptr [ebp-4]
 0002C004    shr         dword ptr [eax+8],1
 0002C007    mov         edx,dword ptr [ebp-4]
 0002C00A    movzx       edx,word ptr [edx+0E]
 0002C00E    mov         eax,dword ptr [ebp-4]
 0002C011    mov         eax,dword ptr [eax+4]
 0002C014    mov         ecx,20
 0002C019    call        BytesPerScanline
 0002C01E    mov         edx,dword ptr [ebp-4]
 0002C021    imul        dword ptr [edx+8]
 0002C024    mov         edx,dword ptr [ebp-4]
 0002C027    mov         dword ptr [edx+14],eax
 0002C02A    mov         eax,dword ptr [ebp-4]
 0002C02D    mov         ax,word ptr [eax+0E]
 0002C031    call        GetDInColors
 0002C036    mov         esi,eax
 0002C038    push        0
 0002C03A    call        user32.GetDC
 0002C03F    mov         dword ptr [ebp-10],eax
 0002C042    cmp         dword ptr [ebp-10],0
>0002C046    jne         0002C04D
 0002C048    call        OutOfResources
 0002C04D    xor         edx,edx
 0002C04F    push        ebp
 0002C050    push        2C19C
 0002C055    push        dword ptr fs:[edx]
 0002C058    mov         dword ptr fs:[edx],esp
 0002C05B    mov         edi,dword ptr [ebp-4]
 0002C05E    mov         eax,edi
 0002C060    add         eax,28
 0002C063    mov         edx,esi
 0002C065    shl         edx,2
 0002C068    add         eax,edx
 0002C06A    mov         dword ptr [ebp-14],eax
 0002C06D    push        0
 0002C06F    mov         eax,dword ptr [ebp-4]
 0002C072    push        edi
 0002C073    mov         eax,dword ptr [ebp-14]
 0002C076    push        eax
 0002C077    push        4
 0002C079    mov         eax,dword ptr [ebp-4]
 0002C07C    push        eax
 0002C07D    mov         eax,dword ptr [ebp-10]
 0002C080    push        eax
 0002C081    call        gdi32.CreateDIBitmap
 0002C086    call        GDICheck
 0002C08B    mov         dword ptr [ebp-0C],eax
 0002C08E    xor         eax,eax
 0002C090    push        ebp
 0002C091    push        2C0C2
 0002C096    push        dword ptr fs:[eax]
 0002C099    mov         dword ptr fs:[eax],esp
 0002C09C    xor         ecx,ecx
 0002C09E    lea         edx,[ebp-1C]
 0002C0A1    mov         eax,dword ptr [ebp-0C]
 0002C0A4    call        DupBits
 0002C0A9    mov         dword ptr [ebx],eax
 0002C0AB    xor         eax,eax
 0002C0AD    pop         edx
 0002C0AE    pop         ecx
 0002C0AF    pop         ecx
 0002C0B0    mov         dword ptr fs:[eax],edx
 0002C0B3    push        2C0C9
 0002C0B8    mov         eax,dword ptr [ebp-0C]
 0002C0BB    push        eax
 0002C0BC    call        gdi32.DeleteObject
 0002C0C1    ret
>0002C0C2    jmp         @HandleFinally
>0002C0C7    jmp         0002C0B8
 0002C0C9    mov         eax,dword ptr [ebp-4]
 0002C0CC    mov         eax,dword ptr [eax+14]
 0002C0CF    add         dword ptr [ebp-14],eax
 0002C0D2    mov         eax,dword ptr [ebp-4]
 0002C0D5    mov         bx,1
 0002C0D9    mov         word ptr [eax+0E],bx
 0002C0DD    mov         eax,dword ptr [ebp-4]
 0002C0E0    movzx       edx,bx
 0002C0E3    mov         eax,dword ptr [ebp-4]
 0002C0E6    mov         eax,dword ptr [eax+4]
 0002C0E9    mov         ecx,20
 0002C0EE    call        BytesPerScanline
 0002C0F3    mov         edx,dword ptr [ebp-4]
 0002C0F6    imul        dword ptr [edx+8]
 0002C0F9    mov         edx,dword ptr [ebp-4]
 0002C0FC    mov         dword ptr [edx+14],eax
 0002C0FF    mov         eax,dword ptr [ebp-4]
 0002C102    mov         dword ptr [eax+20],2
 0002C109    mov         eax,dword ptr [ebp-4]
 0002C10C    mov         dword ptr [eax+24],2
 0002C113    mov         eax,dword ptr [ebp-4]
 0002C116    add         eax,28
 0002C119    xor         edx,edx
 0002C11B    mov         dword ptr [eax],edx
 0002C11D    mov         dword ptr [eax+4],0FFFFFF
 0002C124    push        0
 0002C126    mov         ebx,dword ptr [ebp-4]
 0002C129    push        ebx
 0002C12A    mov         eax,dword ptr [ebp-14]
 0002C12D    push        eax
 0002C12E    push        4
 0002C130    mov         eax,dword ptr [ebp-4]
 0002C133    push        ebx
 0002C134    mov         eax,dword ptr [ebp-10]
 0002C137    push        eax
 0002C138    call        gdi32.CreateDIBitmap
 0002C13D    call        GDICheck
 0002C142    mov         dword ptr [ebp-0C],eax
 0002C145    xor         eax,eax
 0002C147    push        ebp
 0002C148    push        2C17C
 0002C14D    push        dword ptr fs:[eax]
 0002C150    mov         dword ptr fs:[eax],esp
 0002C153    mov         cl,1
 0002C155    lea         edx,[ebp-1C]
 0002C158    mov         eax,dword ptr [ebp-0C]
 0002C15B    call        DupBits
 0002C160    mov         edx,dword ptr [ebp-8]
 0002C163    mov         dword ptr [edx],eax
 0002C165    xor         eax,eax
 0002C167    pop         edx
 0002C168    pop         ecx
 0002C169    pop         ecx
 0002C16A    mov         dword ptr fs:[eax],edx
 0002C16D    push        2C183
 0002C172    mov         eax,dword ptr [ebp-0C]
 0002C175    push        eax
 0002C176    call        gdi32.DeleteObject
 0002C17B    ret
>0002C17C    jmp         @HandleFinally
>0002C181    jmp         0002C172
 0002C183    xor         eax,eax
 0002C185    pop         edx
 0002C186    pop         ecx
 0002C187    pop         ecx
 0002C188    mov         dword ptr fs:[eax],edx
 0002C18B    push        2C1A3
 0002C190    mov         eax,dword ptr [ebp-10]
 0002C193    push        eax
 0002C194    push        0
 0002C196    call        user32.ReleaseDC
 0002C19B    ret
>0002C19C    jmp         @HandleFinally
>0002C1A1    jmp         0002C190
 0002C1A3    pop         edi
 0002C1A4    pop         esi
 0002C1A5    pop         ebx
 0002C1A6    mov         esp,ebp
 0002C1A8    pop         ebp
 0002C1A9    ret
*}
end;

//0002C1AC
procedure ReadIcon(Stream:TStream; var Icon:HICON; ImageCount:Integer; StartOffset:Integer);
begin
{*
 0002C1AC    push        ebp
 0002C1AD    mov         ebp,esp
 0002C1AF    add         esp,0FFFFFF8C
 0002C1B2    push        ebx
 0002C1B3    push        esi
 0002C1B4    push        edi
 0002C1B5    mov         dword ptr [ebp-0C],ecx
 0002C1B8    mov         dword ptr [ebp-8],edx
 0002C1BB    mov         dword ptr [ebp-4],eax
 0002C1BE    mov         eax,dword ptr [ebp-0C]
 0002C1C1    shl         eax,4
 0002C1C4    mov         dword ptr [ebp-14],eax
 0002C1C7    mov         eax,dword ptr [ebp-14]
 0002C1CA    call        AllocMem
 0002C1CF    mov         dword ptr [ebp-10],eax
 0002C1D2    push        ebp
 0002C1D3    push        2C45C
 0002C1D8    push        dword ptr fs:[0]
 0002C1DF    mov         dword ptr fs:[0],esp
 0002C1E6    mov         edx,dword ptr [ebp-10]
 0002C1E9    mov         ecx,dword ptr [ebp-14]
 0002C1EC    mov         eax,dword ptr [ebp-4]
 0002C1EF    mov         ebx,dword ptr [eax]
 0002C1F1    call        dword ptr [ebx+4]
 0002C1F4    push        0B
 0002C1F6    call        user32.GetSystemMetrics
 0002C1FB    mov         dword ptr [ebp-28],eax
 0002C1FE    push        0C
 0002C200    call        user32.GetSystemMetrics
 0002C205    mov         dword ptr [ebp-24],eax
 0002C208    push        0
 0002C20A    call        user32.GetDC
 0002C20F    mov         dword ptr [ebp-2C],eax
 0002C212    cmp         dword ptr [ebp-2C],0
>0002C216    jne         0002C21D
 0002C218    call        OutOfResources
 0002C21D    xor         edx,edx
 0002C21F    push        ebp
 0002C220    push        2C27D
 0002C225    push        dword ptr fs:[edx]
 0002C228    mov         dword ptr fs:[edx],esp
 0002C22B    push        0E
 0002C22D    mov         eax,dword ptr [ebp-2C]
 0002C230    push        eax
 0002C231    call        gdi32.GetDeviceCaps
 0002C236    mov         ebx,eax
 0002C238    push        0C
 0002C23A    mov         eax,dword ptr [ebp-2C]
 0002C23D    push        eax
 0002C23E    call        gdi32.GetDeviceCaps
 0002C243    imul        bx,ax
 0002C247    mov         eax,ebx
 0002C249    cmp         ax,18
>0002C24D    jne         0002C257
 0002C24F    mov         word ptr [ebp-1A],0
>0002C255    jmp         0002C264
 0002C257    mov         ecx,eax
 0002C259    mov         ax,1
 0002C25D    shl         ax,cl
 0002C260    mov         word ptr [ebp-1A],ax
 0002C264    xor         eax,eax
 0002C266    pop         edx
 0002C267    pop         ecx
 0002C268    pop         ecx
 0002C269    mov         dword ptr fs:[eax],edx
 0002C26C    push        2C284
 0002C271    mov         eax,dword ptr [ebp-2C]
 0002C274    push        eax
 0002C275    push        0
 0002C277    call        user32.ReleaseDC
 0002C27C    ret
>0002C27D    jmp         @HandleFinally
>0002C282    jmp         0002C271
 0002C284    or          esi,0FFFFFFFF
 0002C287    xor         eax,eax
 0002C289    mov         dword ptr [ebp-20],eax
 0002C28C    mov         ecx,dword ptr [ebp-0C]
 0002C28F    dec         ecx
 0002C290    test        ecx,ecx
>0002C292    jl          0002C2D6
 0002C294    inc         ecx
 0002C295    xor         eax,eax
 0002C297    mov         edx,eax
 0002C299    add         edx,edx
 0002C29B    mov         ebx,dword ptr [ebp-10]
 0002C29E    movzx       edx,word ptr [ebx+edx*8+2]
 0002C2A3    movzx       edi,word ptr [ebp-1A]
 0002C2A7    cmp         edx,edi
>0002C2A9    jne         0002C2AF
 0002C2AB    mov         esi,eax
>0002C2AD    jmp         0002C2D6
 0002C2AF    cmp         esi,0FFFFFFFF
>0002C2B2    jne         0002C2CB
 0002C2B4    cmp         edi,edx
>0002C2B6    jl          0002C2D2
 0002C2B8    mov         esi,eax
 0002C2BA    mov         edx,eax
 0002C2BC    add         edx,edx
 0002C2BE    mov         ebx,dword ptr [ebp-10]
 0002C2C1    movzx       edx,word ptr [ebx+edx*8+2]
 0002C2C6    mov         dword ptr [ebp-20],edx
>0002C2C9    jmp         0002C2D2
 0002C2CB    cmp         edx,dword ptr [ebp-20]
>0002C2CE    jle         0002C2D2
 0002C2D0    mov         esi,eax
 0002C2D2    inc         eax
 0002C2D3    dec         ecx
>0002C2D4    jne         0002C297
 0002C2D6    cmp         esi,0FFFFFFFF
>0002C2D9    jne         0002C2DD
 0002C2DB    xor         esi,esi
 0002C2DD    mov         eax,esi
 0002C2DF    add         eax,eax
 0002C2E1    mov         edx,dword ptr [ebp-10]
 0002C2E4    lea         eax,[edx+eax*8]
 0002C2E7    mov         dword ptr [ebp-44],eax
 0002C2EA    mov         eax,dword ptr [ebp-44]
 0002C2ED    mov         eax,dword ptr [eax+8]
 0002C2F0    call        AllocMem
 0002C2F5    mov         dword ptr [ebp-30],eax
 0002C2F8    xor         eax,eax
 0002C2FA    push        ebp
 0002C2FB    push        2C43C
 0002C300    push        dword ptr fs:[eax]
 0002C303    mov         dword ptr fs:[eax],esp
 0002C306    mov         eax,dword ptr [ebp-44]
 0002C309    mov         edx,dword ptr [eax+0C]
 0002C30C    mov         eax,dword ptr [ebp-14]
 0002C30F    add         eax,dword ptr [ebp+8]
 0002C312    sub         edx,eax
 0002C314    mov         cx,1
 0002C318    mov         eax,dword ptr [ebp-4]
 0002C31B    mov         ebx,dword ptr [eax]
 0002C31D    call        dword ptr [ebx+0C]
 0002C320    mov         eax,dword ptr [ebp-44]
 0002C323    mov         ecx,dword ptr [eax+8]
 0002C326    mov         ebx,dword ptr [ebp-30]
 0002C329    mov         edx,ebx
 0002C32B    mov         eax,dword ptr [ebp-4]
 0002C32E    mov         esi,dword ptr [eax]
 0002C330    call        dword ptr [esi+4]
 0002C333    lea         ecx,[ebp-3C]
 0002C336    lea         edx,[ebp-38]
 0002C339    mov         eax,ebx
 0002C33B    call        TwoBitsFromDIB
 0002C340    lea         eax,[ebp-74]
 0002C343    push        eax
 0002C344    push        18
 0002C346    mov         eax,dword ptr [ebp-3C]
 0002C349    push        eax
 0002C34A    call        gdi32.GetObjectA
 0002C34F    lea         eax,[ebp-5C]
 0002C352    push        eax
 0002C353    push        18
 0002C355    mov         eax,dword ptr [ebp-38]
 0002C358    push        eax
 0002C359    call        gdi32.GetObjectA
 0002C35E    mov         ebx,dword ptr [ebp-68]
 0002C361    imul        ebx,dword ptr [ebp-6C]
 0002C365    movzx       eax,word ptr [ebp-64]
 0002C369    imul        ebx,eax
 0002C36C    mov         eax,dword ptr [ebp-50]
 0002C36F    imul        dword ptr [ebp-54]
 0002C372    movzx       edx,word ptr [ebp-4C]
 0002C376    imul        edx
 0002C378    mov         dword ptr [ebp-40],eax
 0002C37B    mov         eax,dword ptr [ebp-40]
 0002C37E    add         eax,ebx
 0002C380    mov         dword ptr [ebp-18],eax
 0002C383    mov         eax,dword ptr [ebp-18]
 0002C386    call        AllocMem
 0002C38B    mov         dword ptr [ebp-34],eax
 0002C38E    xor         eax,eax
 0002C390    push        ebp
 0002C391    push        2C419
 0002C396    push        dword ptr fs:[eax]
 0002C399    mov         dword ptr fs:[eax],esp
 0002C39C    mov         edi,dword ptr [ebp-34]
 0002C39F    mov         esi,dword ptr [ebp-34]
 0002C3A2    add         esi,ebx
 0002C3A4    push        edi
 0002C3A5    push        ebx
 0002C3A6    mov         eax,dword ptr [ebp-3C]
 0002C3A9    push        eax
 0002C3AA    call        gdi32.GetBitmapBits
 0002C3AF    push        esi
 0002C3B0    mov         eax,dword ptr [ebp-40]
 0002C3B3    push        eax
 0002C3B4    mov         eax,dword ptr [ebp-38]
 0002C3B7    push        eax
 0002C3B8    call        gdi32.GetBitmapBits
 0002C3BD    mov         eax,dword ptr [ebp-38]
 0002C3C0    push        eax
 0002C3C1    call        gdi32.DeleteObject
 0002C3C6    mov         eax,dword ptr [ebp-3C]
 0002C3C9    push        eax
 0002C3CA    call        gdi32.DeleteObject
 0002C3CF    push        esi
 0002C3D0    push        edi
 0002C3D1    mov         al,byte ptr [ebp-4A]
 0002C3D4    push        eax
 0002C3D5    mov         al,byte ptr [ebp-4C]
 0002C3D8    push        eax
 0002C3D9    mov         eax,dword ptr [ebp-24]
 0002C3DC    push        eax
 0002C3DD    mov         eax,dword ptr [ebp-28]
 0002C3E0    push        eax
 0002C3E1    mov         eax,[000B5950];^HInstance:Longword
 0002C3E6    mov         eax,dword ptr [eax]
 0002C3E8    push        eax
 0002C3E9    call        user32.CreateIcon
 0002C3EE    mov         edx,dword ptr [ebp-8]
 0002C3F1    mov         dword ptr [edx],eax
 0002C3F3    mov         eax,dword ptr [ebp-8]
 0002C3F6    cmp         dword ptr [eax],0
>0002C3F9    jne         0002C400
 0002C3FB    call        GDIError
 0002C400    xor         eax,eax
 0002C402    pop         edx
 0002C403    pop         ecx
 0002C404    pop         ecx
 0002C405    mov         dword ptr fs:[eax],edx
 0002C408    push        2C420
 0002C40D    mov         edx,dword ptr [ebp-18]
 0002C410    mov         eax,dword ptr [ebp-34]
 0002C413    call        @FreeMem
 0002C418    ret
>0002C419    jmp         @HandleFinally
>0002C41E    jmp         0002C40D
 0002C420    xor         eax,eax
 0002C422    pop         edx
 0002C423    pop         ecx
 0002C424    pop         ecx
 0002C425    mov         dword ptr fs:[eax],edx
 0002C428    push        2C443
 0002C42D    mov         eax,dword ptr [ebp-44]
 0002C430    mov         edx,dword ptr [eax+8]
 0002C433    mov         eax,dword ptr [ebp-30]
 0002C436    call        @FreeMem
 0002C43B    ret
>0002C43C    jmp         @HandleFinally
>0002C441    jmp         0002C42D
 0002C443    xor         eax,eax
 0002C445    pop         edx
 0002C446    pop         ecx
 0002C447    pop         ecx
 0002C448    mov         dword ptr fs:[eax],edx
 0002C44B    push        2C463
 0002C450    mov         edx,dword ptr [ebp-14]
 0002C453    mov         eax,dword ptr [ebp-10]
 0002C456    call        @FreeMem
 0002C45B    ret
>0002C45C    jmp         @HandleFinally
>0002C461    jmp         0002C450
 0002C463    pop         edi
 0002C464    pop         esi
 0002C465    pop         ebx
 0002C466    mov         esp,ebp
 0002C468    pop         ebp
 0002C469    ret         4
*}
end;

//0002C46C
function ComputeAldusChecksum(var WMF:TMetafileHeader):Word;
begin
{*
 0002C46C    xor         ecx,ecx
 0002C46E    mov         edx,eax
 0002C470    add         eax,14
>0002C473    jmp         0002C47B
 0002C475    xor         cx,word ptr [edx]
 0002C478    add         edx,2
 0002C47B    cmp         edx,eax
>0002C47D    jl          0002C475
 0002C47F    mov         eax,ecx
 0002C481    ret
*}
end;

//0002C484
procedure InitializeBitmapInfoHeader(Bitmap:HBITMAP; var BI:TBitmapInfoHeader; Colors:Integer);
begin
{*
 0002C484    push        ebx
 0002C485    push        esi
 0002C486    push        edi
 0002C487    add         esp,0FFFFFFAC
 0002C48A    mov         esi,ecx
 0002C48C    mov         ebx,edx
 0002C48E    xor         edx,edx
 0002C490    mov         dword ptr [esp+18],edx
 0002C494    push        esp
 0002C495    push        54
 0002C497    push        eax
 0002C498    call        gdi32.GetObjectA
 0002C49D    test        eax,eax
>0002C49F    jne         0002C4A8
 0002C4A1    call        InvalidBitmap
>0002C4A6    jmp         0002C4E7
 0002C4A8    cmp         eax,40
>0002C4AB    jl          0002C4C5
 0002C4AD    cmp         dword ptr [esp+18],28
>0002C4B2    jb          0002C4C5
 0002C4B4    push        esi
 0002C4B5    mov         edi,ebx
 0002C4B7    lea         esi,[esp+1C]
 0002C4BB    mov         ecx,0A
 0002C4C0    rep movs    dword ptr [edi],dword ptr [esi]
 0002C4C2    pop         esi
>0002C4C3    jmp         0002C4E7
 0002C4C5    mov         eax,ebx
 0002C4C7    xor         ecx,ecx
 0002C4C9    mov         edx,28
 0002C4CE    call        @FillChar
 0002C4D3    mov         dword ptr [ebx],28
 0002C4D9    mov         eax,dword ptr [esp+4]
 0002C4DD    mov         dword ptr [ebx+4],eax
 0002C4E0    mov         eax,dword ptr [esp+8]
 0002C4E4    mov         dword ptr [ebx+8],eax
 0002C4E7    test        esi,esi
>0002C4E9    je          0002C517
 0002C4EB    sub         esi,2
>0002C4EE    je          0002C4FF
 0002C4F0    sub         esi,0E
>0002C4F3    je          0002C507
 0002C4F5    sub         esi,0F0
>0002C4FB    je          0002C50F
>0002C4FD    jmp         0002C525
 0002C4FF    mov         word ptr [ebx+0E],1
>0002C505    jmp         0002C525
 0002C507    mov         word ptr [ebx+0E],4
>0002C50D    jmp         0002C525
 0002C50F    mov         word ptr [ebx+0E],8
>0002C515    jmp         0002C525
 0002C517    mov         ax,word ptr [esp+12]
 0002C51C    imul        word ptr [esp+10]
 0002C521    mov         word ptr [ebx+0E],ax
 0002C525    mov         word ptr [ebx+0C],1
 0002C52B    cmp         dword ptr [ebx+14],0
>0002C52F    jne         0002C552
 0002C531    movzx       edx,word ptr [ebx+0E]
 0002C535    mov         eax,dword ptr [ebx+4]
 0002C538    mov         ecx,20
 0002C53D    call        BytesPerScanline
 0002C542    mov         ecx,eax
 0002C544    mov         eax,dword ptr [ebx+8]
 0002C547    cdq
 0002C548    xor         eax,edx
 0002C54A    sub         eax,edx
 0002C54C    imul        ecx,eax
 0002C54F    mov         dword ptr [ebx+14],ecx
 0002C552    add         esp,54
 0002C555    pop         edi
 0002C556    pop         esi
 0002C557    pop         ebx
 0002C558    ret
*}
end;

//0002C55C
procedure InternalGetDIBSizes(Bitmap:HBITMAP; var InfoHeaderSize:DWORD; var ImageSize:DWORD; Colors:Integer);
begin
{*
 0002C55C    push        ebp
 0002C55D    mov         ebp,esp
 0002C55F    add         esp,0FFFFFFD8
 0002C562    push        ebx
 0002C563    push        esi
 0002C564    mov         esi,ecx
 0002C566    mov         ebx,edx
 0002C568    lea         edx,[ebp-28]
 0002C56B    mov         ecx,dword ptr [ebp+8]
 0002C56E    call        InitializeBitmapInfoHeader
 0002C573    mov         ax,word ptr [ebp-1A]
 0002C577    cmp         ax,8
>0002C57B    jbe         0002C58E
 0002C57D    mov         dword ptr [ebx],28
 0002C583    test        byte ptr [ebp-18],3
>0002C587    je          0002C59F
 0002C589    add         dword ptr [ebx],0C
>0002C58C    jmp         0002C59F
 0002C58E    mov         ecx,eax
 0002C590    mov         eax,1
 0002C595    shl         eax,cl
 0002C597    shl         eax,2
 0002C59A    add         eax,28
 0002C59D    mov         dword ptr [ebx],eax
 0002C59F    mov         eax,dword ptr [ebp-14]
 0002C5A2    mov         dword ptr [esi],eax
 0002C5A4    pop         esi
 0002C5A5    pop         ebx
 0002C5A6    mov         esp,ebp
 0002C5A8    pop         ebp
 0002C5A9    ret         4
*}
end;

//0002C5AC
procedure GetDIBSizes(Bitmap:HBITMAP; var InfoHeaderSize:DWORD; var ImageSize:DWORD);
begin
{*
 0002C5AC    push        0
 0002C5AE    call        InternalGetDIBSizes
 0002C5B3    ret
*}
end;

//0002C5B4
function InternalGetDIB(Bitmap:HBITMAP; Palette:HPALETTE; var BitmapInfo:void ; var Bits:void ; Colors:Integer):Boolean;
begin
{*
 0002C5B4    push        ebp
 0002C5B5    mov         ebp,esp
 0002C5B7    add         esp,0FFFFFFF4
 0002C5BA    push        ebx
 0002C5BB    push        esi
 0002C5BC    push        edi
 0002C5BD    mov         ebx,ecx
 0002C5BF    mov         edi,edx
 0002C5C1    mov         esi,eax
 0002C5C3    mov         edx,ebx
 0002C5C5    mov         ecx,dword ptr [ebp+8]
 0002C5C8    mov         eax,esi
 0002C5CA    call        InitializeBitmapInfoHeader
 0002C5CF    xor         eax,eax
 0002C5D1    mov         dword ptr [ebp-8],eax
 0002C5D4    push        0
 0002C5D6    call        gdi32.CreateCompatibleDC
 0002C5DB    mov         dword ptr [ebp-0C],eax
 0002C5DE    xor         eax,eax
 0002C5E0    push        ebp
 0002C5E1    push        2C651
 0002C5E6    push        dword ptr fs:[eax]
 0002C5E9    mov         dword ptr fs:[eax],esp
 0002C5EC    test        edi,edi
>0002C5EE    je          0002C608
 0002C5F0    push        0
 0002C5F2    push        edi
 0002C5F3    mov         eax,dword ptr [ebp-0C]
 0002C5F6    push        eax
 0002C5F7    call        gdi32.SelectPalette
 0002C5FC    mov         dword ptr [ebp-8],eax
 0002C5FF    mov         eax,dword ptr [ebp-0C]
 0002C602    push        eax
 0002C603    call        gdi32.RealizePalette
 0002C608    push        0
 0002C60A    push        ebx
 0002C60B    mov         eax,dword ptr [ebp+0C]
 0002C60E    push        eax
 0002C60F    mov         eax,dword ptr [ebx+8]
 0002C612    push        eax
 0002C613    push        0
 0002C615    push        esi
 0002C616    mov         eax,dword ptr [ebp-0C]
 0002C619    push        eax
 0002C61A    call        gdi32.GetDIBits
 0002C61F    test        eax,eax
 0002C621    setne       byte ptr [ebp-1]
 0002C625    xor         eax,eax
 0002C627    pop         edx
 0002C628    pop         ecx
 0002C629    pop         ecx
 0002C62A    mov         dword ptr fs:[eax],edx
 0002C62D    push        2C658
 0002C632    cmp         dword ptr [ebp-8],0
>0002C636    je          0002C647
 0002C638    push        0
 0002C63A    mov         eax,dword ptr [ebp-8]
 0002C63D    push        eax
 0002C63E    mov         eax,dword ptr [ebp-0C]
 0002C641    push        eax
 0002C642    call        gdi32.SelectPalette
 0002C647    mov         eax,dword ptr [ebp-0C]
 0002C64A    push        eax
 0002C64B    call        gdi32.DeleteDC
 0002C650    ret
>0002C651    jmp         @HandleFinally
>0002C656    jmp         0002C632
 0002C658    mov         al,byte ptr [ebp-1]
 0002C65B    pop         edi
 0002C65C    pop         esi
 0002C65D    pop         ebx
 0002C65E    mov         esp,ebp
 0002C660    pop         ebp
 0002C661    ret         8
*}
end;

//0002C664
function GetDIB(Bitmap:HBITMAP; Palette:HPALETTE; var BitmapInfo:void ; var Bits:void ):Boolean;
begin
{*
 0002C664    push        ebp
 0002C665    mov         ebp,esp
 0002C667    push        ebx
 0002C668    mov         ebx,dword ptr [ebp+8]
 0002C66B    push        ebx
 0002C66C    push        0
 0002C66E    call        InternalGetDIB
 0002C673    pop         ebx
 0002C674    pop         ebp
 0002C675    ret         4
*}
end;

//0002C678
procedure WinError;
begin
{*
 0002C678    ret
*}
end;

//0002C67C
procedure CheckBool(Result:BOOL);
begin
{*
 0002C67C    test        eax,eax
>0002C67E    jne         0002C685
 0002C680    call        WinError
 0002C685    ret
*}
end;

//0002C688
procedure WriteIcon(Stream:TStream; Icon:HICON; WriteLength:Boolean);
begin
{*
 0002C688    push        ebp
 0002C689    mov         ebp,esp
 0002C68B    add         esp,0FFFFFFAC
 0002C68E    push        ebx
 0002C68F    push        esi
 0002C690    push        edi
 0002C691    mov         byte ptr [ebp-1],cl
 0002C694    mov         esi,edx
 0002C696    mov         ebx,eax
 0002C698    lea         eax,[ebp-2A]
 0002C69B    xor         ecx,ecx
 0002C69D    mov         edx,6
 0002C6A2    call        @FillChar
 0002C6A7    lea         eax,[ebp-54]
 0002C6AA    xor         ecx,ecx
 0002C6AC    mov         edx,10
 0002C6B1    call        @FillChar
 0002C6B6    lea         eax,[ebp-44]
 0002C6B9    push        eax
 0002C6BA    push        esi
 0002C6BB    call        user32.GetIconInfo
 0002C6C0    call        CheckBool
 0002C6C5    xor         edx,edx
 0002C6C7    push        ebp
 0002C6C8    push        2C876
 0002C6CD    push        dword ptr fs:[edx]
 0002C6D0    mov         dword ptr fs:[edx],esp
 0002C6D3    push        2
 0002C6D5    lea         ecx,[ebp-10]
 0002C6D8    lea         edx,[ebp-8]
 0002C6DB    mov         eax,dword ptr [ebp-38]
 0002C6DE    call        InternalGetDIBSizes
 0002C6E3    push        10
 0002C6E5    lea         ecx,[ebp-14]
 0002C6E8    lea         edx,[ebp-0C]
 0002C6EB    mov         eax,dword ptr [ebp-34]
 0002C6EE    call        InternalGetDIBSizes
 0002C6F3    xor         eax,eax
 0002C6F5    mov         dword ptr [ebp-18],eax
 0002C6F8    xor         eax,eax
 0002C6FA    mov         dword ptr [ebp-1C],eax
 0002C6FD    xor         eax,eax
 0002C6FF    mov         dword ptr [ebp-20],eax
 0002C702    xor         eax,eax
 0002C704    mov         dword ptr [ebp-24],eax
 0002C707    xor         edx,edx
 0002C709    push        ebp
 0002C70A    push        2C84F
 0002C70F    push        dword ptr fs:[edx]
 0002C712    mov         dword ptr fs:[edx],esp
 0002C715    mov         eax,dword ptr [ebp-8]
 0002C718    call        AllocMem
 0002C71D    mov         dword ptr [ebp-18],eax
 0002C720    mov         eax,dword ptr [ebp-10]
 0002C723    call        AllocMem
 0002C728    mov         dword ptr [ebp-1C],eax
 0002C72B    mov         eax,dword ptr [ebp-0C]
 0002C72E    call        AllocMem
 0002C733    mov         dword ptr [ebp-20],eax
 0002C736    mov         eax,dword ptr [ebp-14]
 0002C739    call        AllocMem
 0002C73E    mov         dword ptr [ebp-24],eax
 0002C741    mov         eax,dword ptr [ebp-1C]
 0002C744    push        eax
 0002C745    push        2
 0002C747    mov         ecx,dword ptr [ebp-18]
 0002C74A    xor         edx,edx
 0002C74C    mov         eax,dword ptr [ebp-38]
 0002C74F    call        InternalGetDIB
 0002C754    mov         eax,dword ptr [ebp-24]
 0002C757    push        eax
 0002C758    push        10
 0002C75A    mov         ecx,dword ptr [ebp-20]
 0002C75D    xor         edx,edx
 0002C75F    mov         eax,dword ptr [ebp-34]
 0002C762    call        InternalGetDIB
 0002C767    cmp         byte ptr [ebp-1],0
>0002C76B    je          0002C78B
 0002C76D    mov         eax,dword ptr [ebp-0C]
 0002C770    add         eax,16
 0002C773    add         eax,dword ptr [ebp-14]
 0002C776    add         eax,dword ptr [ebp-10]
 0002C779    mov         dword ptr [ebp-30],eax
 0002C77C    lea         edx,[ebp-30]
 0002C77F    mov         ecx,4
 0002C784    mov         eax,ebx
 0002C786    mov         esi,dword ptr [eax]
 0002C788    call        dword ptr [esi+8]
 0002C78B    mov         word ptr [ebp-28],1
 0002C791    mov         word ptr [ebp-26],1
 0002C797    lea         edx,[ebp-2A]
 0002C79A    mov         ecx,6
 0002C79F    mov         eax,ebx
 0002C7A1    mov         esi,dword ptr [eax]
 0002C7A3    call        dword ptr [esi+8]
 0002C7A6    mov         esi,dword ptr [ebp-20]
 0002C7A9    mov         eax,esi
 0002C7AB    mov         dl,byte ptr [eax+4]
 0002C7AE    mov         byte ptr [ebp-54],dl
 0002C7B1    mov         dl,byte ptr [eax+8]
 0002C7B4    mov         byte ptr [ebp-53],dl
 0002C7B7    mov         dx,word ptr [eax+0C]
 0002C7BB    imul        dx,word ptr [eax+0E]
 0002C7C0    mov         word ptr [ebp-52],dx
 0002C7C4    mov         eax,dword ptr [ebp-0C]
 0002C7C7    add         eax,dword ptr [ebp-14]
 0002C7CA    add         eax,dword ptr [ebp-10]
 0002C7CD    mov         dword ptr [ebp-4C],eax
 0002C7D0    mov         dword ptr [ebp-48],16
 0002C7D7    lea         edx,[ebp-54]
 0002C7DA    mov         ecx,10
 0002C7DF    mov         eax,ebx
 0002C7E1    mov         edi,dword ptr [eax]
 0002C7E3    call        dword ptr [edi+8]
 0002C7E6    mov         eax,esi
 0002C7E8    mov         edx,dword ptr [eax+8]
 0002C7EB    add         dword ptr [eax+8],edx
 0002C7EE    mov         edx,dword ptr [ebp-20]
 0002C7F1    mov         ecx,dword ptr [ebp-0C]
 0002C7F4    mov         eax,ebx
 0002C7F6    mov         esi,dword ptr [eax]
 0002C7F8    call        dword ptr [esi+8]
 0002C7FB    mov         edx,dword ptr [ebp-24]
 0002C7FE    mov         ecx,dword ptr [ebp-14]
 0002C801    mov         eax,ebx
 0002C803    mov         esi,dword ptr [eax]
 0002C805    call        dword ptr [esi+8]
 0002C808    mov         edx,dword ptr [ebp-1C]
 0002C80B    mov         ecx,dword ptr [ebp-10]
 0002C80E    mov         eax,ebx
 0002C810    mov         ebx,dword ptr [eax]
 0002C812    call        dword ptr [ebx+8]
 0002C815    xor         eax,eax
 0002C817    pop         edx
 0002C818    pop         ecx
 0002C819    pop         ecx
 0002C81A    mov         dword ptr fs:[eax],edx
 0002C81D    push        2C856
 0002C822    mov         edx,dword ptr [ebp-0C]
 0002C825    mov         eax,dword ptr [ebp-20]
 0002C828    call        @FreeMem
 0002C82D    mov         edx,dword ptr [ebp-14]
 0002C830    mov         eax,dword ptr [ebp-24]
 0002C833    call        @FreeMem
 0002C838    mov         edx,dword ptr [ebp-8]
 0002C83B    mov         eax,dword ptr [ebp-18]
 0002C83E    call        @FreeMem
 0002C843    mov         edx,dword ptr [ebp-10]
 0002C846    mov         eax,dword ptr [ebp-1C]
 0002C849    call        @FreeMem
 0002C84E    ret
>0002C84F    jmp         @HandleFinally
>0002C854    jmp         0002C822
 0002C856    xor         eax,eax
 0002C858    pop         edx
 0002C859    pop         ecx
 0002C85A    pop         ecx
 0002C85B    mov         dword ptr fs:[eax],edx
 0002C85E    push        2C87D
 0002C863    mov         eax,dword ptr [ebp-34]
 0002C866    push        eax
 0002C867    call        gdi32.DeleteObject
 0002C86C    mov         eax,dword ptr [ebp-38]
 0002C86F    push        eax
 0002C870    call        gdi32.DeleteObject
 0002C875    ret
>0002C876    jmp         @HandleFinally
>0002C87B    jmp         0002C863
 0002C87D    pop         edi
 0002C87E    pop         esi
 0002C87F    pop         ebx
 0002C880    mov         esp,ebp
 0002C882    pop         ebp
 0002C883    ret
*}
end;

//0002C884
constructor TGraphic.Create;
begin
{*
 0002C884    push        ebx
 0002C885    push        esi
 0002C886    test        dl,dl
>0002C888    je          0002C892
 0002C88A    add         esp,0FFFFFFF0
 0002C88D    call        @ClassCreate
 0002C892    mov         ebx,edx
 0002C894    mov         esi,eax
 0002C896    xor         edx,edx
 0002C898    mov         eax,esi
 0002C89A    call        TObject.Create
 0002C89F    mov         eax,esi
 0002C8A1    test        bl,bl
>0002C8A3    je          0002C8B4
 0002C8A5    call        @AfterConstruction
 0002C8AA    pop         dword ptr fs:[0]
 0002C8B1    add         esp,0C
 0002C8B4    mov         eax,esi
 0002C8B6    pop         esi
 0002C8B7    pop         ebx
 0002C8B8    ret
*}
end;

//0002C8BC
procedure TGraphic.Changed(Sender:TObject);
begin
{*
 0002C8BC    push        ebx
 0002C8BD    mov         byte ptr [eax+14],1
 0002C8C1    cmp         word ptr [eax+6],0
>0002C8C6    je          0002C8D2
 0002C8C8    mov         ebx,eax
 0002C8CA    mov         edx,eax
 0002C8CC    mov         eax,dword ptr [ebx+8]
 0002C8CF    call        dword ptr [ebx+4]
 0002C8D2    pop         ebx
 0002C8D3    ret
*}
end;

//0002C8D4
function DoWrite:Boolean;
begin
{*
 0002C8D4    push        ebp
 0002C8D5    mov         ebp,esp
 0002C8D7    push        ebx
 0002C8D8    mov         eax,dword ptr [ebp+8]
 0002C8DB    mov         eax,dword ptr [eax-4]
 0002C8DE    cmp         dword ptr [eax+1C],0
>0002C8E2    je          0002C91B
 0002C8E4    mov         eax,dword ptr [ebp+8]
 0002C8E7    mov         eax,dword ptr [eax-4]
 0002C8EA    mov         ebx,dword ptr [eax+1C]
 0002C8ED    mov         eax,ebx
 0002C8EF    mov         edx,dword ptr ds:[28BE8];TGraphic
 0002C8F5    call        @IsClass
 0002C8FA    test        al,al
>0002C8FC    je          0002C916
 0002C8FE    mov         eax,dword ptr [ebp+8]
 0002C901    mov         edx,ebx
 0002C903    mov         eax,dword ptr [ebp+8]
 0002C906    mov         eax,dword ptr [eax-8]
 0002C909    mov         ecx,dword ptr [eax]
 0002C90B    call        dword ptr [ecx+18]
 0002C90E    test        al,al
>0002C910    je          0002C916
 0002C912    xor         eax,eax
>0002C914    jmp         0002C928
 0002C916    mov         al,1
 0002C918    pop         ebx
 0002C919    pop         ebp
 0002C91A    ret
 0002C91B    mov         eax,dword ptr [ebp+8]
 0002C91E    mov         eax,dword ptr [eax-8]
 0002C921    mov         edx,dword ptr [eax]
 0002C923    call        dword ptr [edx+1C]
 0002C926    xor         al,1
 0002C928    pop         ebx
 0002C929    pop         ebp
 0002C92A    ret
*}
end;

//0002C92C
procedure TGraphic.DefineProperties(Filer:TFiler);
begin
{*
 0002C92C    push        ebp
 0002C92D    mov         ebp,esp
 0002C92F    add         esp,0FFFFFFF8
 0002C932    push        ebx
 0002C933    mov         dword ptr [ebp-4],edx
 0002C936    mov         dword ptr [ebp-8],eax
 0002C939    mov         eax,dword ptr [ebp-8]
 0002C93C    push        eax
 0002C93D    mov         eax,dword ptr [eax]
 0002C93F    mov         eax,dword ptr [eax+30]
 0002C942    push        eax
 0002C943    mov         eax,dword ptr [ebp-8]
 0002C946    push        eax
 0002C947    mov         eax,dword ptr [eax]
 0002C949    mov         eax,dword ptr [eax+44]
 0002C94C    push        eax
 0002C94D    push        ebp
 0002C94E    call        DoWrite
 0002C953    pop         ecx
 0002C954    mov         ecx,eax
 0002C956    mov         edx,2C970;'Data'
 0002C95B    mov         eax,dword ptr [ebp-4]
 0002C95E    mov         ebx,dword ptr [eax]
 0002C960    call        dword ptr [ebx+4]
 0002C963    pop         ebx
 0002C964    pop         ecx
 0002C965    pop         ecx
 0002C966    pop         ebp
 0002C967    ret
*}
end;

//0002C978
function TGraphic.Equals(Graphic:TGraphic):Boolean;
begin
{*
 0002C978    push        ebp
 0002C979    mov         ebp,esp
 0002C97B    add         esp,0FFFFFFF4
 0002C97E    push        ebx
 0002C97F    push        esi
 0002C980    push        edi
 0002C981    mov         esi,edx
 0002C983    mov         ebx,eax
 0002C985    test        esi,esi
>0002C987    je          0002C99D
 0002C989    mov         eax,ebx
 0002C98B    call        TObject.ClassType
 0002C990    mov         edi,eax
 0002C992    mov         eax,esi
 0002C994    call        TObject.ClassType
 0002C999    cmp         edi,eax
>0002C99B    je          0002C9A1
 0002C99D    xor         eax,eax
>0002C99F    jmp         0002C9A3
 0002C9A1    mov         al,1
 0002C9A3    mov         byte ptr [ebp-1],al
 0002C9A6    mov         eax,ebx
 0002C9A8    mov         edx,dword ptr [eax]
 0002C9AA    call        dword ptr [edx+1C]
 0002C9AD    test        al,al
>0002C9AF    jne         0002C9BC
 0002C9B1    mov         eax,esi
 0002C9B3    mov         edx,dword ptr [eax]
 0002C9B5    call        dword ptr [edx+1C]
 0002C9B8    test        al,al
>0002C9BA    je          0002C9E0
 0002C9BC    mov         eax,ebx
 0002C9BE    mov         edx,dword ptr [eax]
 0002C9C0    call        dword ptr [edx+1C]
 0002C9C3    test        al,al
>0002C9C5    je          0002C9D2
 0002C9C7    mov         eax,esi
 0002C9C9    mov         edx,dword ptr [eax]
 0002C9CB    call        dword ptr [edx+1C]
 0002C9CE    test        al,al
>0002C9D0    jne         0002C9D6
 0002C9D2    xor         eax,eax
>0002C9D4    jmp         0002C9D8
 0002C9D6    mov         al,1
 0002C9D8    mov         byte ptr [ebp-1],al
>0002C9DB    jmp         0002CAB0
 0002C9E0    cmp         byte ptr [ebp-1],0
>0002C9E4    je          0002CAB0
 0002C9EA    mov         dl,1
 0002C9EC    mov         eax,[0001F5E8];TMemoryStream
 0002C9F1    call        TObject.Create
 0002C9F6    mov         dword ptr [ebp-8],eax
 0002C9F9    xor         eax,eax
 0002C9FB    push        ebp
 0002C9FC    push        2CAA9
 0002CA01    push        dword ptr fs:[eax]
 0002CA04    mov         dword ptr fs:[eax],esp
 0002CA07    mov         edx,dword ptr [ebp-8]
 0002CA0A    mov         eax,ebx
 0002CA0C    mov         ecx,dword ptr [eax]
 0002CA0E    call        dword ptr [ecx+44]
 0002CA11    mov         dl,1
 0002CA13    mov         eax,[0001F5E8];TMemoryStream
 0002CA18    call        TObject.Create
 0002CA1D    mov         dword ptr [ebp-0C],eax
 0002CA20    xor         eax,eax
 0002CA22    push        ebp
 0002CA23    push        2CA8C
 0002CA28    push        dword ptr fs:[eax]
 0002CA2B    mov         dword ptr fs:[eax],esp
 0002CA2E    mov         edx,dword ptr [ebp-0C]
 0002CA31    mov         eax,esi
 0002CA33    mov         ecx,dword ptr [eax]
 0002CA35    call        dword ptr [ecx+44]
 0002CA38    mov         eax,dword ptr [ebp-8]
 0002CA3B    call        TStream.GetSize
 0002CA40    mov         ebx,eax
 0002CA42    mov         eax,dword ptr [ebp-0C]
 0002CA45    call        TStream.GetSize
 0002CA4A    cmp         ebx,eax
>0002CA4C    jne         0002CA6D
 0002CA4E    mov         eax,dword ptr [ebp-8]
 0002CA51    call        TStream.GetSize
 0002CA56    mov         ecx,eax
 0002CA58    mov         eax,dword ptr [ebp-0C]
 0002CA5B    mov         edx,dword ptr [eax+4]
 0002CA5E    mov         eax,dword ptr [ebp-8]
 0002CA61    mov         eax,dword ptr [eax+4]
 0002CA64    call        CompareMem
 0002CA69    test        al,al
>0002CA6B    jne         0002CA71
 0002CA6D    xor         eax,eax
>0002CA6F    jmp         0002CA73
 0002CA71    mov         al,1
 0002CA73    mov         byte ptr [ebp-1],al
 0002CA76    xor         eax,eax
 0002CA78    pop         edx
 0002CA79    pop         ecx
 0002CA7A    pop         ecx
 0002CA7B    mov         dword ptr fs:[eax],edx
 0002CA7E    push        2CA93
 0002CA83    mov         eax,dword ptr [ebp-0C]
 0002CA86    call        TObject.Free
 0002CA8B    ret
>0002CA8C    jmp         @HandleFinally
>0002CA91    jmp         0002CA83
 0002CA93    xor         eax,eax
 0002CA95    pop         edx
 0002CA96    pop         ecx
 0002CA97    pop         ecx
 0002CA98    mov         dword ptr fs:[eax],edx
 0002CA9B    push        2CAB0
 0002CAA0    mov         eax,dword ptr [ebp-8]
 0002CAA3    call        TObject.Free
 0002CAA8    ret
>0002CAA9    jmp         @HandleFinally
>0002CAAE    jmp         0002CAA0
 0002CAB0    mov         al,byte ptr [ebp-1]
 0002CAB3    pop         edi
 0002CAB4    pop         esi
 0002CAB5    pop         ebx
 0002CAB6    mov         esp,ebp
 0002CAB8    pop         ebp
 0002CAB9    ret
*}
end;

//0002CABC
{*function sub_0002CABC:?;
begin
 0002CABC    xor         eax,eax
 0002CABE    ret
end;*}

//0002CAC0
{*function sub_0002CAC0:?;
begin
 0002CAC0    mov         al,byte ptr [eax+15];TGraphic.FTransparent:Boolean
 0002CAC3    ret
end;*}

//0002CAC4
{*procedure sub_0002CAC4(?:?);
begin
 0002CAC4    push        ebp
 0002CAC5    mov         ebp,esp
 0002CAC7    push        ecx
 0002CAC8    push        esi
 0002CAC9    mov         esi,eax
 0002CACB    push        20
 0002CACD    mov         ecx,edx
 0002CACF    mov         eax,[0001F510];TFileStream
 0002CAD4    mov         dl,1
 0002CAD6    call        TFileStream.Create;TFileStream.Create
 0002CADB    mov         dword ptr [ebp-4],eax
 0002CADE    xor         eax,eax
 0002CAE0    push        ebp
 0002CAE1    push        2CB0C
 0002CAE6    push        dword ptr fs:[eax]
 0002CAE9    mov         dword ptr fs:[eax],esp
 0002CAEC    mov         edx,dword ptr [ebp-4]
 0002CAEF    mov         eax,esi
 0002CAF1    mov         ecx,dword ptr [eax]
 0002CAF3    call        dword ptr [ecx+50];TGraphic.LoadFromStream
 0002CAF6    xor         eax,eax
 0002CAF8    pop         edx
 0002CAF9    pop         ecx
 0002CAFA    pop         ecx
 0002CAFB    mov         dword ptr fs:[eax],edx
 0002CAFE    push        2CB13
 0002CB03    mov         eax,dword ptr [ebp-4]
 0002CB06    call        TObject.Free
 0002CB0B    ret
>0002CB0C    jmp         @HandleFinally
>0002CB11    jmp         0002CB03
 0002CB13    pop         esi
 0002CB14    pop         ecx
 0002CB15    pop         ebp
 0002CB16    ret
end;*}

//0002CB18
procedure TGraphic.Progress(Sender:TObject; Stage:TProgressStage; PercentDone:Byte; RedrawNow:Boolean; const R:TRect; const Msg:AnsiString);
begin
{*
 0002CB18    push        ebp
 0002CB19    mov         ebp,esp
 0002CB1B    push        ebx
 0002CB1C    cmp         word ptr [eax+0E],0
>0002CB21    je          0002CB3B
 0002CB23    mov         bl,byte ptr [ebp+14]
 0002CB26    push        ebx
 0002CB27    mov         bl,byte ptr [ebp+10]
 0002CB2A    push        ebx
 0002CB2B    mov         ebx,dword ptr [ebp+0C]
 0002CB2E    push        ebx
 0002CB2F    mov         ebx,dword ptr [ebp+8]
 0002CB32    push        ebx
 0002CB33    mov         ebx,eax
 0002CB35    mov         eax,dword ptr [ebx+10]
 0002CB38    call        dword ptr [ebx+0C]
 0002CB3B    pop         ebx
 0002CB3C    pop         ebp
 0002CB3D    ret         10
*}
end;

//0002CB40
procedure TGraphic.ReadData(Stream:TStream);
begin
{*
 0002CB40    push        esi
 0002CB41    mov         esi,eax
 0002CB43    mov         eax,esi
 0002CB45    mov         ecx,dword ptr [eax]
 0002CB47    call        dword ptr [ecx+50]
 0002CB4A    pop         esi
 0002CB4B    ret
*}
end;

//0002CB4C
procedure TGraphic.SaveToFile(const Filename:AnsiString);
begin
{*
 0002CB4C    push        ebp
 0002CB4D    mov         ebp,esp
 0002CB4F    push        ecx
 0002CB50    push        esi
 0002CB51    mov         esi,eax
 0002CB53    push        0FFFF
 0002CB58    mov         ecx,edx
 0002CB5A    mov         eax,[0001F510];TFileStream
 0002CB5F    mov         dl,1
 0002CB61    call        TFileStream.Create
 0002CB66    mov         dword ptr [ebp-4],eax
 0002CB69    xor         eax,eax
 0002CB6B    push        ebp
 0002CB6C    push        2CB97
 0002CB71    push        dword ptr fs:[eax]
 0002CB74    mov         dword ptr fs:[eax],esp
 0002CB77    mov         edx,dword ptr [ebp-4]
 0002CB7A    mov         eax,esi
 0002CB7C    mov         ecx,dword ptr [eax]
 0002CB7E    call        dword ptr [ecx+54]
 0002CB81    xor         eax,eax
 0002CB83    pop         edx
 0002CB84    pop         ecx
 0002CB85    pop         ecx
 0002CB86    mov         dword ptr fs:[eax],edx
 0002CB89    push        2CB9E
 0002CB8E    mov         eax,dword ptr [ebp-4]
 0002CB91    call        TObject.Free
 0002CB96    ret
>0002CB97    jmp         @HandleFinally
>0002CB9C    jmp         0002CB8E
 0002CB9E    pop         esi
 0002CB9F    pop         ecx
 0002CBA0    pop         ebp
 0002CBA1    ret
*}
end;

//0002CBA4
procedure sub_0002CBA4;
begin
{*
 0002CBA4    ret
*}
end;

//0002CBA8
procedure TGraphic.SetTransparent(Value:Boolean);
begin
{*
 0002CBA8    cmp         dl,byte ptr [eax+15]
>0002CBAB    je          0002CBB7
 0002CBAD    mov         byte ptr [eax+15],dl
 0002CBB0    mov         edx,eax
 0002CBB2    mov         ecx,dword ptr [eax]
 0002CBB4    call        dword ptr [ecx+10]
 0002CBB7    ret
*}
end;

//0002CBB8
procedure TGraphic.WriteData(Stream:TStream);
begin
{*
 0002CBB8    push        esi
 0002CBB9    mov         esi,eax
 0002CBBB    mov         eax,esi
 0002CBBD    mov         ecx,dword ptr [eax]
 0002CBBF    call        dword ptr [ecx+54]
 0002CBC2    pop         esi
 0002CBC3    ret
*}
end;

//0002CC58
constructor TFileFormatsList.Create;
begin
{*
 0002CC58    push        ebp
 0002CC59    mov         ebp,esp
 0002CC5B    push        0
 0002CC5D    push        ebx
 0002CC5E    push        esi
 0002CC5F    test        dl,dl
>0002CC61    je          0002CC6B
 0002CC63    add         esp,0FFFFFFF0
 0002CC66    call        @ClassCreate
 0002CC6B    mov         ebx,edx
 0002CC6D    mov         esi,eax
 0002CC6F    xor         eax,eax
 0002CC71    push        ebp
 0002CC72    push        2CD2C
 0002CC77    push        dword ptr fs:[eax]
 0002CC7A    mov         dword ptr fs:[eax],esp
 0002CC7D    xor         edx,edx
 0002CC7F    mov         eax,esi
 0002CC81    call        TObject.Create
 0002CC86    push        0
 0002CC88    mov         eax,[00028E34];TMetafile
 0002CC8D    push        eax
 0002CC8E    lea         edx,[ebp-4]
 0002CC91    mov         eax,[000B5940];^SVMetafiles:TResStringRec
 0002CC96    call        LoadResString
 0002CC9B    mov         ecx,dword ptr [ebp-4]
 0002CC9E    mov         edx,2CD58;'wmf'
 0002CCA3    mov         eax,esi
 0002CCA5    call        TFileFormatsList.Add
 0002CCAA    push        0
 0002CCAC    mov         eax,[00028E34];TMetafile
 0002CCB1    push        eax
 0002CCB2    lea         edx,[ebp-4]
 0002CCB5    mov         eax,[000B56F8];^SVEnhMetafiles:TResStringRec
 0002CCBA    call        LoadResString
 0002CCBF    mov         ecx,dword ptr [ebp-4]
 0002CCC2    mov         edx,2CD64;'emf'
 0002CCC7    mov         eax,esi
 0002CCC9    call        TFileFormatsList.Add
 0002CCCE    push        0
 0002CCD0    mov         eax,[000290B0];TIcon
 0002CCD5    push        eax
 0002CCD6    lea         edx,[ebp-4]
 0002CCD9    mov         eax,[000B56F4];^SVIcons:TResStringRec
 0002CCDE    call        LoadResString
 0002CCE3    mov         ecx,dword ptr [ebp-4]
 0002CCE6    mov         edx,2CD70;'ico'
 0002CCEB    mov         eax,esi
 0002CCED    call        TFileFormatsList.Add
 0002CCF2    push        0
 0002CCF4    mov         eax,[00028F70];TBitmap
 0002CCF9    push        eax
 0002CCFA    lea         edx,[ebp-4]
 0002CCFD    mov         eax,[000B56F0];^SVBitmaps:TResStringRec
 0002CD02    call        LoadResString
 0002CD07    mov         ecx,dword ptr [ebp-4]
 0002CD0A    mov         edx,2CD7C;'bmp'
 0002CD0F    mov         eax,esi
 0002CD11    call        TFileFormatsList.Add
 0002CD16    xor         eax,eax
 0002CD18    pop         edx
 0002CD19    pop         ecx
 0002CD1A    pop         ecx
 0002CD1B    mov         dword ptr fs:[eax],edx
 0002CD1E    push        2CD33
 0002CD23    lea         eax,[ebp-4]
 0002CD26    call        @LStrClr
 0002CD2B    ret
>0002CD2C    jmp         @HandleFinally
>0002CD31    jmp         0002CD23
 0002CD33    mov         eax,esi
 0002CD35    test        bl,bl
>0002CD37    je          0002CD48
 0002CD39    call        @AfterConstruction
 0002CD3E    pop         dword ptr fs:[0]
 0002CD45    add         esp,0C
 0002CD48    mov         eax,esi
 0002CD4A    pop         esi
 0002CD4B    pop         ebx
 0002CD4C    pop         ecx
 0002CD4D    pop         ebp
 0002CD4E    ret
*}
end;

//0002CD80
destructor TFileFormatsList.Destroy;
begin
{*
 0002CD80    push        ebx
 0002CD81    push        esi
 0002CD82    push        edi
 0002CD83    push        ebp
 0002CD84    call        @BeforeDestruction
 0002CD89    mov         ebx,edx
 0002CD8B    mov         edi,eax
 0002CD8D    mov         ebp,dword ptr [edi+8]
 0002CD90    dec         ebp
 0002CD91    test        ebp,ebp
>0002CD93    jl          0002CDB0
 0002CD95    inc         ebp
 0002CD96    xor         esi,esi
 0002CD98    mov         edx,esi
 0002CD9A    mov         eax,edi
 0002CD9C    call        TList.Get
 0002CDA1    mov         edx,dword ptr ds:[2CBC4];TFileFormat
 0002CDA7    call        @Dispose
 0002CDAC    inc         esi
 0002CDAD    dec         ebp
>0002CDAE    jne         0002CD98
 0002CDB0    mov         edx,ebx
 0002CDB2    and         dl,0FC
 0002CDB5    mov         eax,edi
 0002CDB7    call        TList.Destroy
 0002CDBC    test        bl,bl
>0002CDBE    jle         0002CDC7
 0002CDC0    mov         eax,edi
 0002CDC2    call        @ClassDestroy
 0002CDC7    pop         ebp
 0002CDC8    pop         edi
 0002CDC9    pop         esi
 0002CDCA    pop         ebx
 0002CDCB    ret
*}
end;

//0002CDCC
procedure TFileFormatsList.Add(const Ext:AnsiString; const Desc:AnsiString; DescID:Integer; AClass:TGraphicClass);
begin
{*
 0002CDCC    push        ebp
 0002CDCD    mov         ebp,esp
 0002CDCF    add         esp,0FFFFFFF4
 0002CDD2    push        ebx
 0002CDD3    push        esi
 0002CDD4    push        edi
 0002CDD5    xor         ebx,ebx
 0002CDD7    mov         dword ptr [ebp-0C],ebx
 0002CDDA    mov         dword ptr [ebp-8],ecx
 0002CDDD    mov         dword ptr [ebp-4],edx
 0002CDE0    mov         edi,eax
 0002CDE2    xor         eax,eax
 0002CDE4    push        ebp
 0002CDE5    push        2CE4F
 0002CDEA    push        dword ptr fs:[eax]
 0002CDED    mov         dword ptr fs:[eax],esp
 0002CDF0    mov         edx,dword ptr ds:[2CBC4];TFileFormat
 0002CDF6    mov         eax,10
 0002CDFB    call        @New
 0002CE00    mov         esi,eax
 0002CE02    mov         ebx,esi
 0002CE04    lea         edx,[ebp-0C]
 0002CE07    mov         eax,dword ptr [ebp-4]
 0002CE0A    call        AnsiLowerCase
 0002CE0F    mov         edx,dword ptr [ebp-0C]
 0002CE12    lea         eax,[ebx+4]
 0002CE15    call        @LStrAsg
 0002CE1A    mov         eax,dword ptr [ebp+8]
 0002CE1D    mov         dword ptr [ebx],eax
 0002CE1F    lea         eax,[ebx+8]
 0002CE22    mov         edx,dword ptr [ebp-8]
 0002CE25    call        @LStrAsg
 0002CE2A    mov         eax,dword ptr [ebp+0C]
 0002CE2D    mov         dword ptr [ebx+0C],eax
 0002CE30    mov         edx,esi
 0002CE32    mov         eax,edi
 0002CE34    call        TList.Add
 0002CE39    xor         eax,eax
 0002CE3B    pop         edx
 0002CE3C    pop         ecx
 0002CE3D    pop         ecx
 0002CE3E    mov         dword ptr fs:[eax],edx
 0002CE41    push        2CE56
 0002CE46    lea         eax,[ebp-0C]
 0002CE49    call        @LStrClr
 0002CE4E    ret
>0002CE4F    jmp         @HandleFinally
>0002CE54    jmp         0002CE46
 0002CE56    pop         edi
 0002CE57    pop         esi
 0002CE58    pop         ebx
 0002CE59    mov         esp,ebp
 0002CE5B    pop         ebp
 0002CE5C    ret         8
*}
end;

//0002CE60
function TFileFormatsList.FindClassName(const Classname:AnsiString):TGraphicClass;
begin
{*
 0002CE60    push        ebp
 0002CE61    mov         ebp,esp
 0002CE63    add         esp,0FFFFFEF8
 0002CE69    push        ebx
 0002CE6A    push        esi
 0002CE6B    push        edi
 0002CE6C    xor         ecx,ecx
 0002CE6E    mov         dword ptr [ebp-8],ecx
 0002CE71    mov         dword ptr [ebp-4],edx
 0002CE74    mov         edi,eax
 0002CE76    xor         eax,eax
 0002CE78    push        ebp
 0002CE79    push        2CEDE
 0002CE7E    push        dword ptr fs:[eax]
 0002CE81    mov         dword ptr fs:[eax],esp
 0002CE84    mov         ebx,dword ptr [edi+8]
 0002CE87    dec         ebx
 0002CE88    cmp         ebx,0
>0002CE8B    jl          0002CEC6
 0002CE8D    mov         edx,ebx
 0002CE8F    mov         eax,edi
 0002CE91    call        TList.Get
 0002CE96    mov         esi,dword ptr [eax]
 0002CE98    lea         edx,[ebp-108]
 0002CE9E    mov         eax,esi
 0002CEA0    call        TObject.ClassName
 0002CEA5    lea         edx,[ebp-108]
 0002CEAB    lea         eax,[ebp-8]
 0002CEAE    call        @LStrFromString
 0002CEB3    mov         eax,dword ptr [ebp-8]
 0002CEB6    mov         edx,dword ptr [ebp-4]
 0002CEB9    call        @LStrCmp
>0002CEBE    je          0002CEC8
 0002CEC0    dec         ebx
 0002CEC1    cmp         ebx,0FFFFFFFF
>0002CEC4    jne         0002CE8D
 0002CEC6    xor         esi,esi
 0002CEC8    xor         eax,eax
 0002CECA    pop         edx
 0002CECB    pop         ecx
 0002CECC    pop         ecx
 0002CECD    mov         dword ptr fs:[eax],edx
 0002CED0    push        2CEE5
 0002CED5    lea         eax,[ebp-8]
 0002CED8    call        @LStrClr
 0002CEDD    ret
>0002CEDE    jmp         @HandleFinally
>0002CEE3    jmp         0002CED5
 0002CEE5    mov         eax,esi
 0002CEE7    pop         edi
 0002CEE8    pop         esi
 0002CEE9    pop         ebx
 0002CEEA    mov         esp,ebp
 0002CEEC    pop         ebp
 0002CEED    ret
*}
end;

//0002CF50
constructor TClipboardFormats.Create;
begin
{*
 0002CF50    push        ebx
 0002CF51    push        esi
 0002CF52    test        dl,dl
>0002CF54    je          0002CF5E
 0002CF56    add         esp,0FFFFFFF0
 0002CF59    call        @ClassCreate
 0002CF5E    mov         ebx,edx
 0002CF60    mov         esi,eax
 0002CF62    mov         dl,1
 0002CF64    mov         eax,[0001EEC4];TList
 0002CF69    call        TObject.Create
 0002CF6E    mov         dword ptr [esi+4],eax
 0002CF71    mov         dl,1
 0002CF73    mov         eax,[0001EEC4];TList
 0002CF78    call        TObject.Create
 0002CF7D    mov         dword ptr [esi+8],eax
 0002CF80    mov         ecx,dword ptr ds:[28E34];TMetafile
 0002CF86    mov         dx,3
 0002CF8A    mov         eax,esi
 0002CF8C    call        TClipboardFormats.Add
 0002CF91    mov         ecx,dword ptr ds:[28E34];TMetafile
 0002CF97    mov         dx,0E
 0002CF9B    mov         eax,esi
 0002CF9D    call        TClipboardFormats.Add
 0002CFA2    mov         ecx,dword ptr ds:[28F70];TBitmap
 0002CFA8    mov         dx,2
 0002CFAC    mov         eax,esi
 0002CFAE    call        TClipboardFormats.Add
 0002CFB3    mov         eax,esi
 0002CFB5    test        bl,bl
>0002CFB7    je          0002CFC8
 0002CFB9    call        @AfterConstruction
 0002CFBE    pop         dword ptr fs:[0]
 0002CFC5    add         esp,0C
 0002CFC8    mov         eax,esi
 0002CFCA    pop         esi
 0002CFCB    pop         ebx
 0002CFCC    ret
*}
end;

//0002CFD0
destructor TClipboardFormats.Destroy;
begin
{*
 0002CFD0    push        ebx
 0002CFD1    push        esi
 0002CFD2    call        @BeforeDestruction
 0002CFD7    mov         ebx,edx
 0002CFD9    mov         esi,eax
 0002CFDB    mov         eax,dword ptr [esi+4]
 0002CFDE    call        TObject.Free
 0002CFE3    mov         eax,dword ptr [esi+8]
 0002CFE6    call        TObject.Free
 0002CFEB    test        bl,bl
>0002CFED    jle         0002CFF6
 0002CFEF    mov         eax,esi
 0002CFF1    call        @ClassDestroy
 0002CFF6    pop         esi
 0002CFF7    pop         ebx
 0002CFF8    ret
*}
end;

//0002CFFC
procedure TClipboardFormats.Add(Fmt:Word; AClass:TGraphicClass);
begin
{*
 0002CFFC    push        ebp
 0002CFFD    mov         ebp,esp
 0002CFFF    add         esp,0FFFFFFF8
 0002D002    push        ebx
 0002D003    push        esi
 0002D004    push        edi
 0002D005    mov         ebx,edx
 0002D007    mov         dword ptr [ebp-4],eax
 0002D00A    mov         eax,dword ptr [ebp-4]
 0002D00D    mov         eax,dword ptr [eax+4]
 0002D010    mov         edx,ecx
 0002D012    call        TList.Add
 0002D017    mov         dword ptr [ebp-8],eax
 0002D01A    xor         eax,eax
 0002D01C    push        ebp
 0002D01D    push        2D040
 0002D022    push        dword ptr fs:[eax]
 0002D025    mov         dword ptr fs:[eax],esp
 0002D028    movzx       edx,bx
 0002D02B    mov         eax,dword ptr [ebp-4]
 0002D02E    mov         eax,dword ptr [eax+8]
 0002D031    call        TList.Add
 0002D036    xor         eax,eax
 0002D038    pop         edx
 0002D039    pop         ecx
 0002D03A    pop         ecx
 0002D03B    mov         dword ptr fs:[eax],edx
>0002D03E    jmp         0002D05D
>0002D040    jmp         @HandleAnyException
 0002D045    mov         eax,dword ptr [ebp-4]
 0002D048    mov         eax,dword ptr [eax+4]
 0002D04B    mov         edx,dword ptr [ebp-8]
 0002D04E    call        TList.Delete
 0002D053    call        @RaiseAgain
 0002D058    call        @DoneExcept
 0002D05D    pop         edi
 0002D05E    pop         esi
 0002D05F    pop         ebx
 0002D060    pop         ecx
 0002D061    pop         ecx
 0002D062    pop         ebp
 0002D063    ret
*}
end;

//0002D064
function TClipboardFormats.FindFormat(Fmt:Word):TGraphicClass;
begin
{*
 0002D064    push        ebx
 0002D065    push        esi
 0002D066    push        edi
 0002D067    mov         edi,edx
 0002D069    mov         esi,eax
 0002D06B    mov         eax,dword ptr [esi+8]
 0002D06E    mov         ebx,dword ptr [eax+8]
 0002D071    dec         ebx
 0002D072    cmp         ebx,0
>0002D075    jl          0002D098
 0002D077    mov         edx,ebx
 0002D079    mov         eax,dword ptr [esi+8]
 0002D07C    call        TList.Get
 0002D081    cmp         di,ax
>0002D084    jne         0002D092
 0002D086    mov         edx,ebx
 0002D088    mov         eax,dword ptr [esi+4]
 0002D08B    call        TList.Get
>0002D090    jmp         0002D09A
 0002D092    dec         ebx
 0002D093    cmp         ebx,0FFFFFFFF
>0002D096    jne         0002D077
 0002D098    xor         eax,eax
 0002D09A    pop         edi
 0002D09B    pop         esi
 0002D09C    pop         ebx
 0002D09D    ret
*}
end;

//0002D0A0
function GetFileFormats:TFileFormatsList;
begin
{*
 0002D0A0    cmp         dword ptr ds:[0B461C],0
>0002D0A7    jne         0002D0BA
 0002D0A9    mov         dl,1
 0002D0AB    mov         eax,[0002CBF0];TFileFormatsList
 0002D0B0    call        TFileFormatsList.Create
 0002D0B5    mov         [000B461C],eax
 0002D0BA    mov         eax,[000B461C]
 0002D0BF    ret
*}
end;

//0002D0C0
function GetClipboardFormats:TClipboardFormats;
begin
{*
 0002D0C0    cmp         dword ptr ds:[0B4618],0
>0002D0C7    jne         0002D0DA
 0002D0C9    mov         dl,1
 0002D0CB    mov         eax,[0002CEF0];TClipboardFormats
 0002D0D0    call        TClipboardFormats.Create
 0002D0D5    mov         [000B4618],eax
 0002D0DA    mov         eax,[000B4618]
 0002D0DF    ret
*}
end;

//0002D0E0
constructor TPicture.Create;
begin
{*
 0002D0E0    push        ebx
 0002D0E1    push        esi
 0002D0E2    test        dl,dl
>0002D0E4    je          0002D0EE
 0002D0E6    add         esp,0FFFFFFF0
 0002D0E9    call        @ClassCreate
 0002D0EE    mov         ebx,edx
 0002D0F0    mov         esi,eax
 0002D0F2    xor         edx,edx
 0002D0F4    mov         eax,esi
 0002D0F6    call        TObject.Create
 0002D0FB    call        GetFileFormats
 0002D100    call        GetClipboardFormats
 0002D105    mov         eax,esi
 0002D107    test        bl,bl
>0002D109    je          0002D11A
 0002D10B    call        @AfterConstruction
 0002D110    pop         dword ptr fs:[0]
 0002D117    add         esp,0C
 0002D11A    mov         eax,esi
 0002D11C    pop         esi
 0002D11D    pop         ebx
 0002D11E    ret
*}
end;

//0002D120
destructor TPicture.Destroy;
begin
{*
 0002D120    push        ebx
 0002D121    push        esi
 0002D122    call        @BeforeDestruction
 0002D127    mov         ebx,edx
 0002D129    mov         esi,eax
 0002D12B    mov         eax,dword ptr [esi+4];TPicture.FGraphic:TGraphic
 0002D12E    call        TObject.Free
 0002D133    mov         edx,ebx
 0002D135    and         dl,0FC
 0002D138    mov         eax,esi
 0002D13A    call        TMemoryStream.Destroy
 0002D13F    test        bl,bl
>0002D141    jle         0002D14A
 0002D143    mov         eax,esi
 0002D145    call        @ClassDestroy
 0002D14A    pop         esi
 0002D14B    pop         ebx
 0002D14C    ret
*}
end;

//0002D150
procedure TPicture.AssignTo(Dest:TPersistent);
begin
{*
 0002D150    push        ebx
 0002D151    push        esi
 0002D152    mov         esi,edx
 0002D154    mov         ebx,eax
 0002D156    mov         eax,esi
 0002D158    call        TObject.ClassType
 0002D15D    mov         edx,eax
 0002D15F    mov         eax,dword ptr [ebx+4]
 0002D162    call        @IsClass
 0002D167    test        al,al
>0002D169    je          0002D178
 0002D16B    mov         edx,dword ptr [ebx+4]
 0002D16E    mov         eax,esi
 0002D170    mov         ecx,dword ptr [eax]
 0002D172    call        dword ptr [ecx+8]
 0002D175    pop         esi
 0002D176    pop         ebx
 0002D177    ret
 0002D178    mov         edx,esi
 0002D17A    mov         eax,ebx
 0002D17C    call        TPersistent.AssignTo
 0002D181    pop         esi
 0002D182    pop         ebx
 0002D183    ret
*}
end;

//0002D184
procedure TPicture.ForceType(GraphicType:TGraphicClass);
begin
{*
 0002D184    push        ebx
 0002D185    push        esi
 0002D186    push        edi
 0002D187    mov         edi,edx
 0002D189    mov         ebx,eax
 0002D18B    mov         esi,dword ptr [ebx+4]
 0002D18E    mov         eax,esi
 0002D190    mov         edx,edi
 0002D192    call        @IsClass
 0002D197    test        al,al
>0002D199    jne         0002D1E2
 0002D19B    mov         eax,esi
 0002D19D    call        TObject.Free
 0002D1A2    xor         eax,eax
 0002D1A4    mov         dword ptr [ebx+4],eax
 0002D1A7    mov         dl,1
 0002D1A9    mov         eax,edi
 0002D1AB    call        dword ptr [eax+0C]
 0002D1AE    mov         esi,eax
 0002D1B0    mov         dword ptr [ebx+4],esi
 0002D1B3    mov         dword ptr [esi+8],ebx
 0002D1B6    mov         eax,ebx
 0002D1B8    mov         dx,0FFFD
 0002D1BC    call        @FindDynaInst
 0002D1C1    mov         dword ptr [esi+4],eax
 0002D1C4    mov         dword ptr [esi+10],ebx
 0002D1C7    mov         eax,ebx
 0002D1C9    mov         dx,0FFFC
 0002D1CD    call        @FindDynaInst
 0002D1D2    mov         dword ptr [esi+0C],eax
 0002D1D5    mov         edx,ebx
 0002D1D7    mov         eax,ebx
 0002D1D9    mov         bx,0FFFD
 0002D1DD    call        @CallDynaInst
 0002D1E2    pop         edi
 0002D1E3    pop         esi
 0002D1E4    pop         ebx
 0002D1E5    ret
*}
end;

//0002D1E8
function TPicture.GetBitmap:TBitmap;
begin
{*
 0002D1E8    push        ebx
 0002D1E9    mov         ebx,eax
 0002D1EB    mov         edx,dword ptr ds:[28F70];TBitmap
 0002D1F1    mov         eax,ebx
 0002D1F3    call        TPicture.ForceType
 0002D1F8    mov         eax,dword ptr [ebx+4]
 0002D1FB    pop         ebx
 0002D1FC    ret
*}
end;

//0002D200
function TPicture.GetIcon:TIcon;
begin
{*
 0002D200    push        ebx
 0002D201    mov         ebx,eax
 0002D203    mov         edx,dword ptr ds:[290B0];TIcon
 0002D209    mov         eax,ebx
 0002D20B    call        TPicture.ForceType
 0002D210    mov         eax,dword ptr [ebx+4]
 0002D213    pop         ebx
 0002D214    ret
*}
end;

//0002D218
procedure TPicture.SetGraphic(Value:TGraphic);
begin
{*
 0002D218    push        ebp
 0002D219    mov         ebp,esp
 0002D21B    push        ecx
 0002D21C    push        ebx
 0002D21D    push        esi
 0002D21E    push        edi
 0002D21F    mov         esi,edx
 0002D221    mov         ebx,eax
 0002D223    xor         eax,eax
 0002D225    mov         dword ptr [ebp-4],eax
 0002D228    test        esi,esi
>0002D22A    je          0002D275
 0002D22C    mov         eax,esi
 0002D22E    call        TObject.ClassType
 0002D233    mov         dl,1
 0002D235    call        dword ptr [eax+0C]
 0002D238    mov         dword ptr [ebp-4],eax
 0002D23B    mov         edx,esi
 0002D23D    mov         eax,dword ptr [ebp-4]
 0002D240    mov         ecx,dword ptr [eax]
 0002D242    call        dword ptr [ecx+8]
 0002D245    mov         eax,dword ptr [ebp-4]
 0002D248    mov         dword ptr [eax+8],ebx
 0002D24B    push        eax
 0002D24C    mov         eax,ebx
 0002D24E    mov         dx,0FFFD
 0002D252    call        @FindDynaInst
 0002D257    mov         edx,eax
 0002D259    pop         eax
 0002D25A    mov         dword ptr [eax+4],edx
 0002D25D    mov         eax,dword ptr [ebp-4]
 0002D260    mov         dword ptr [eax+10],ebx
 0002D263    push        eax
 0002D264    mov         eax,ebx
 0002D266    mov         dx,0FFFC
 0002D26A    call        @FindDynaInst
 0002D26F    mov         edx,eax
 0002D271    pop         eax
 0002D272    mov         dword ptr [eax+0C],edx
 0002D275    xor         eax,eax
 0002D277    push        ebp
 0002D278    push        2D2A8
 0002D27D    push        dword ptr fs:[eax]
 0002D280    mov         dword ptr fs:[eax],esp
 0002D283    mov         eax,dword ptr [ebx+4]
 0002D286    call        TObject.Free
 0002D28B    mov         eax,dword ptr [ebp-4]
 0002D28E    mov         dword ptr [ebx+4],eax
 0002D291    mov         edx,ebx
 0002D293    mov         eax,ebx
 0002D295    mov         bx,0FFFD
 0002D299    call        @CallDynaInst
 0002D29E    xor         eax,eax
 0002D2A0    pop         edx
 0002D2A1    pop         ecx
 0002D2A2    pop         ecx
 0002D2A3    mov         dword ptr fs:[eax],edx
>0002D2A6    jmp         0002D2BF
>0002D2A8    jmp         @HandleAnyException
 0002D2AD    mov         eax,dword ptr [ebp-4]
 0002D2B0    call        TObject.Free
 0002D2B5    call        @RaiseAgain
 0002D2BA    call        @DoneExcept
 0002D2BF    pop         edi
 0002D2C0    pop         esi
 0002D2C1    pop         ebx
 0002D2C2    pop         ecx
 0002D2C3    pop         ebp
 0002D2C4    ret
*}
end;

//0002D2C8
procedure TPicture.LoadFromClipboardFormat(AFormat:Word; AData:THandle; APalette:HPALETTE);
begin
{*
 0002D2C8    push        ebp
 0002D2C9    mov         ebp,esp
 0002D2CB    add         esp,0FFFFFFF4
 0002D2CE    push        ebx
 0002D2CF    push        esi
 0002D2D0    push        edi
 0002D2D1    xor         ebx,ebx
 0002D2D3    mov         dword ptr [ebp-0C],ebx
 0002D2D6    mov         dword ptr [ebp-4],ecx
 0002D2D9    mov         edi,edx
 0002D2DB    mov         ebx,eax
 0002D2DD    xor         eax,eax
 0002D2DF    push        ebp
 0002D2E0    push        2D3B6
 0002D2E5    push        dword ptr fs:[eax]
 0002D2E8    mov         dword ptr fs:[eax],esp
 0002D2EB    mov         edx,edi
 0002D2ED    mov         eax,[000B4618]
 0002D2F2    call        TClipboardFormats.FindFormat
 0002D2F7    mov         esi,eax
 0002D2F9    test        esi,esi
>0002D2FB    jne         0002D312
 0002D2FD    lea         edx,[ebp-0C]
 0002D300    mov         eax,[000B5A14];^SUnknownClipboardFormat:TResStringRec
 0002D305    call        LoadResString
 0002D30A    mov         eax,dword ptr [ebp-0C]
 0002D30D    call        InvalidGraphic
 0002D312    mov         dl,1
 0002D314    mov         eax,esi
 0002D316    call        dword ptr [eax+0C]
 0002D319    mov         dword ptr [ebp-8],eax
 0002D31C    xor         eax,eax
 0002D31E    push        ebp
 0002D31F    push        2D35D
 0002D324    push        dword ptr fs:[eax]
 0002D327    mov         dword ptr fs:[eax],esp
 0002D32A    mov         eax,dword ptr [ebp-8]
 0002D32D    mov         dword ptr [eax+10],ebx
 0002D330    push        eax
 0002D331    mov         eax,ebx
 0002D333    mov         dx,0FFFC
 0002D337    call        @FindDynaInst
 0002D33C    mov         edx,eax
 0002D33E    pop         eax
 0002D33F    mov         dword ptr [eax+0C],edx
 0002D342    mov         eax,dword ptr [ebp+8]
 0002D345    push        eax
 0002D346    mov         ecx,dword ptr [ebp-4]
 0002D349    mov         edx,edi
 0002D34B    mov         eax,dword ptr [ebp-8]
 0002D34E    mov         esi,dword ptr [eax]
 0002D350    call        dword ptr [esi+58]
 0002D353    xor         eax,eax
 0002D355    pop         edx
 0002D356    pop         ecx
 0002D357    pop         ecx
 0002D358    mov         dword ptr fs:[eax],edx
>0002D35B    jmp         0002D374
>0002D35D    jmp         @HandleAnyException
 0002D362    mov         eax,dword ptr [ebp-8]
 0002D365    call        TObject.Free
 0002D36A    call        @RaiseAgain
 0002D36F    call        @DoneExcept
 0002D374    mov         eax,dword ptr [ebx+4]
 0002D377    call        TObject.Free
 0002D37C    mov         esi,dword ptr [ebp-8]
 0002D37F    mov         dword ptr [ebx+4],esi
 0002D382    mov         dword ptr [esi+8],ebx
 0002D385    mov         eax,ebx
 0002D387    mov         dx,0FFFD
 0002D38B    call        @FindDynaInst
 0002D390    mov         dword ptr [esi+4],eax
 0002D393    mov         edx,ebx
 0002D395    mov         eax,ebx
 0002D397    mov         bx,0FFFD
 0002D39B    call        @CallDynaInst
 0002D3A0    xor         eax,eax
 0002D3A2    pop         edx
 0002D3A3    pop         ecx
 0002D3A4    pop         ecx
 0002D3A5    mov         dword ptr fs:[eax],edx
 0002D3A8    push        2D3BD
 0002D3AD    lea         eax,[ebp-0C]
 0002D3B0    call        @LStrClr
 0002D3B5    ret
>0002D3B6    jmp         @HandleFinally
>0002D3BB    jmp         0002D3AD
 0002D3BD    pop         edi
 0002D3BE    pop         esi
 0002D3BF    pop         ebx
 0002D3C0    mov         esp,ebp
 0002D3C2    pop         ebp
 0002D3C3    ret         4
*}
end;

//0002D3C8
procedure TPicture.SaveToClipboardFormat(var AFormat:Word; var AData:THandle; var APalette:HPALETTE);
begin
{*
 0002D3C8    push        ebp
 0002D3C9    mov         ebp,esp
 0002D3CB    push        ecx
 0002D3CC    push        ebx
 0002D3CD    push        esi
 0002D3CE    push        edi
 0002D3CF    mov         dword ptr [ebp-4],ecx
 0002D3D2    mov         esi,eax
 0002D3D4    mov         edi,dword ptr [esi+4]
 0002D3D7    test        edi,edi
>0002D3D9    je          0002D3E9
 0002D3DB    mov         eax,dword ptr [ebp+8]
 0002D3DE    push        eax
 0002D3DF    mov         ecx,dword ptr [ebp-4]
 0002D3E2    mov         eax,edi
 0002D3E4    mov         ebx,dword ptr [eax]
 0002D3E6    call        dword ptr [ebx+5C]
 0002D3E9    pop         edi
 0002D3EA    pop         esi
 0002D3EB    pop         ebx
 0002D3EC    pop         ecx
 0002D3ED    pop         ebp
 0002D3EE    ret         4
*}
end;

//0002D3F4
function TPicture.SupportsClipboardFormat(AFormat:Word):Boolean;
begin
{*
 0002D3F4    push        ebx
 0002D3F5    mov         ebx,edx
 0002D3F7    call        GetClipboardFormats
 0002D3FC    mov         edx,ebx
 0002D3FE    call        TClipboardFormats.FindFormat
 0002D403    test        eax,eax
 0002D405    setne       al
 0002D408    pop         ebx
 0002D409    ret
*}
end;

//0002D40C
procedure TPicture.Assign(Source:TPersistent);
begin
{*
 0002D40C    push        ebx
 0002D40D    push        esi
 0002D40E    mov         ebx,edx
 0002D410    mov         esi,eax
 0002D412    test        ebx,ebx
>0002D414    jne         0002D422
 0002D416    xor         edx,edx
 0002D418    mov         eax,esi
 0002D41A    call        TPicture.SetGraphic
 0002D41F    pop         esi
 0002D420    pop         ebx
 0002D421    ret
 0002D422    mov         eax,ebx
 0002D424    mov         edx,dword ptr ds:[28CCC];TPicture
 0002D42A    call        @IsClass
 0002D42F    test        al,al
>0002D431    je          0002D43F
 0002D433    mov         edx,dword ptr [ebx+4]
 0002D436    mov         eax,esi
 0002D438    call        TPicture.SetGraphic
>0002D43D    jmp         0002D464
 0002D43F    mov         eax,ebx
 0002D441    mov         edx,dword ptr ds:[28BE8];TGraphic
 0002D447    call        @IsClass
 0002D44C    test        al,al
>0002D44E    je          0002D45B
 0002D450    mov         edx,ebx
 0002D452    mov         eax,esi
 0002D454    call        TPicture.SetGraphic
>0002D459    jmp         0002D464
 0002D45B    mov         edx,ebx
 0002D45D    mov         eax,esi
 0002D45F    call        TPersistent.Assign
 0002D464    pop         esi
 0002D465    pop         ebx
 0002D466    ret
*}
end;

//0002D468
procedure TPicture.Changed(Sender:TObject);
begin
{*
 0002D468    push        ebx
 0002D469    mov         ebx,eax
 0002D46B    cmp         word ptr [ebx+0A],0
>0002D470    je          0002D47A
 0002D472    mov         edx,ebx
 0002D474    mov         eax,dword ptr [ebx+0C]
 0002D477    call        dword ptr [ebx+8]
 0002D47A    cmp         dword ptr [ebx+10],0
>0002D47E    je          0002D488
 0002D480    mov         eax,dword ptr [ebx+10]
 0002D483    mov         edx,dword ptr [eax]
 0002D485    call        dword ptr [edx+0C]
 0002D488    pop         ebx
 0002D489    ret
*}
end;

//0002D48C
procedure TPicture.Progress(Sender:TObject; Stage:TProgressStage; PercentDone:Byte; RedrawNow:Boolean; const R:TRect; const Msg:AnsiString);
begin
{*
 0002D48C    push        ebp
 0002D48D    mov         ebp,esp
 0002D48F    push        ebx
 0002D490    cmp         word ptr [eax+16],0
>0002D495    je          0002D4AF
 0002D497    mov         bl,byte ptr [ebp+14]
 0002D49A    push        ebx
 0002D49B    mov         bl,byte ptr [ebp+10]
 0002D49E    push        ebx
 0002D49F    mov         ebx,dword ptr [ebp+0C]
 0002D4A2    push        ebx
 0002D4A3    mov         ebx,dword ptr [ebp+8]
 0002D4A6    push        ebx
 0002D4A7    mov         ebx,eax
 0002D4A9    mov         eax,dword ptr [ebx+18]
 0002D4AC    call        dword ptr [ebx+14]
 0002D4AF    pop         ebx
 0002D4B0    pop         ebp
 0002D4B1    ret         10
*}
end;

//0002D4B4
procedure TPicture.ReadData(Stream:TStream);
begin
{*
 0002D4B4    push        ebp
 0002D4B5    mov         ebp,esp
 0002D4B7    add         esp,0FFFFFFB8
 0002D4BA    push        ebx
 0002D4BB    push        esi
 0002D4BC    push        edi
 0002D4BD    xor         ecx,ecx
 0002D4BF    mov         dword ptr [ebp-48],ecx
 0002D4C2    mov         esi,edx
 0002D4C4    mov         ebx,eax
 0002D4C6    xor         eax,eax
 0002D4C8    push        ebp
 0002D4C9    push        2D5BB
 0002D4CE    push        dword ptr fs:[eax]
 0002D4D1    mov         dword ptr fs:[eax],esp
 0002D4D4    lea         edx,[ebp-44]
 0002D4D7    mov         ecx,1
 0002D4DC    mov         eax,esi
 0002D4DE    mov         edi,dword ptr [eax]
 0002D4E0    call        dword ptr [edi+4]
 0002D4E3    xor         ecx,ecx
 0002D4E5    mov         cl,byte ptr [ebp-44]
 0002D4E8    lea         edx,[ebp-43]
 0002D4EB    mov         eax,esi
 0002D4ED    mov         edi,dword ptr [eax]
 0002D4EF    call        dword ptr [edi+4]
 0002D4F2    lea         eax,[ebp-48]
 0002D4F5    lea         edx,[ebp-44]
 0002D4F8    call        @LStrFromString
 0002D4FD    mov         edx,dword ptr [ebp-48]
 0002D500    mov         eax,[000B461C]
 0002D505    call        TFileFormatsList.FindClassName
 0002D50A    xor         edx,edx
 0002D50C    mov         dword ptr [ebp-4],edx
 0002D50F    test        eax,eax
>0002D511    je          0002D554
 0002D513    mov         dl,1
 0002D515    call        dword ptr [eax+0C]
 0002D518    mov         dword ptr [ebp-4],eax
 0002D51B    xor         eax,eax
 0002D51D    push        ebp
 0002D51E    push        2D53D
 0002D523    push        dword ptr fs:[eax]
 0002D526    mov         dword ptr fs:[eax],esp
 0002D529    mov         edx,esi
 0002D52B    mov         eax,dword ptr [ebp-4]
 0002D52E    mov         ecx,dword ptr [eax]
 0002D530    call        dword ptr [ecx+30]
 0002D533    xor         eax,eax
 0002D535    pop         edx
 0002D536    pop         ecx
 0002D537    pop         ecx
 0002D538    mov         dword ptr fs:[eax],edx
>0002D53B    jmp         0002D554
>0002D53D    jmp         @HandleAnyException
 0002D542    mov         eax,dword ptr [ebp-4]
 0002D545    call        TObject.Free
 0002D54A    call        @RaiseAgain
 0002D54F    call        @DoneExcept
 0002D554    mov         eax,dword ptr [ebx+4]
 0002D557    call        TObject.Free
 0002D55C    mov         eax,dword ptr [ebp-4]
 0002D55F    mov         dword ptr [ebx+4],eax
 0002D562    cmp         dword ptr [ebp-4],0
>0002D566    je          0002D598
 0002D568    mov         eax,dword ptr [ebp-4]
 0002D56B    mov         dword ptr [eax+8],ebx
 0002D56E    push        eax
 0002D56F    mov         eax,ebx
 0002D571    mov         dx,0FFFD
 0002D575    call        @FindDynaInst
 0002D57A    mov         edx,eax
 0002D57C    pop         eax
 0002D57D    mov         dword ptr [eax+4],edx
 0002D580    mov         eax,dword ptr [ebp-4]
 0002D583    mov         dword ptr [eax+10],ebx
 0002D586    push        eax
 0002D587    mov         eax,ebx
 0002D589    mov         dx,0FFFC
 0002D58D    call        @FindDynaInst
 0002D592    mov         edx,eax
 0002D594    pop         eax
 0002D595    mov         dword ptr [eax+0C],edx
 0002D598    mov         edx,ebx
 0002D59A    mov         eax,ebx
 0002D59C    mov         bx,0FFFD
 0002D5A0    call        @CallDynaInst
 0002D5A5    xor         eax,eax
 0002D5A7    pop         edx
 0002D5A8    pop         ecx
 0002D5A9    pop         ecx
 0002D5AA    mov         dword ptr fs:[eax],edx
 0002D5AD    push        2D5C2
 0002D5B2    lea         eax,[ebp-48]
 0002D5B5    call        @LStrClr
 0002D5BA    ret
>0002D5BB    jmp         @HandleFinally
>0002D5C0    jmp         0002D5B2
 0002D5C2    pop         edi
 0002D5C3    pop         esi
 0002D5C4    pop         ebx
 0002D5C5    mov         esp,ebp
 0002D5C7    pop         ebp
 0002D5C8    ret
*}
end;

//0002D5CC
procedure TPicture.WriteData(Stream:TStream);
begin
{*
 0002D5CC    push        ebx
 0002D5CD    push        esi
 0002D5CE    push        edi
 0002D5CF    add         esp,0FFFFFEC0
 0002D5D5    mov         esi,edx
 0002D5D7    mov         ebx,eax
 0002D5D9    mov         edi,dword ptr [ebx+4]
 0002D5DC    test        edi,edi
>0002D5DE    je          0002D5FA
 0002D5E0    lea         edx,[esp+40]
 0002D5E4    mov         eax,dword ptr [edi]
 0002D5E6    call        TObject.ClassName
 0002D5EB    lea         edx,[esp+40]
 0002D5EF    mov         eax,esp
 0002D5F1    mov         cl,3F
 0002D5F3    call        @PStrNCpy
>0002D5F8    jmp         0002D5FE
 0002D5FA    mov         byte ptr [esp],0
 0002D5FE    xor         ecx,ecx
 0002D600    mov         cl,byte ptr [esp]
 0002D603    inc         ecx
 0002D604    mov         edx,esp
 0002D606    mov         eax,esi
 0002D608    mov         edi,dword ptr [eax]
 0002D60A    call        dword ptr [edi+8]
 0002D60D    mov         eax,dword ptr [ebx+4]
 0002D610    test        eax,eax
>0002D612    je          0002D61B
 0002D614    mov         edx,esi
 0002D616    mov         ecx,dword ptr [eax]
 0002D618    call        dword ptr [ecx+44]
 0002D61B    add         esp,140
 0002D621    pop         edi
 0002D622    pop         esi
 0002D623    pop         ebx
 0002D624    ret
*}
end;

//0002D628
function DoWrite:Boolean;
begin
{*
 0002D628    push        ebp
 0002D629    mov         ebp,esp
 0002D62B    push        ebx
 0002D62C    push        esi
 0002D62D    mov         eax,dword ptr [ebp+8]
 0002D630    mov         eax,dword ptr [eax-4]
 0002D633    mov         esi,dword ptr [eax+1C]
 0002D636    test        esi,esi
>0002D638    je          0002D691
 0002D63A    mov         bl,1
 0002D63C    mov         eax,dword ptr [ebp+8]
 0002D63F    mov         eax,esi
 0002D641    mov         edx,dword ptr ds:[28CCC];TPicture
 0002D647    call        @IsClass
 0002D64C    test        al,al
>0002D64E    je          0002D69E
 0002D650    mov         eax,dword ptr [ebp+8]
 0002D653    mov         ebx,esi
 0002D655    mov         eax,dword ptr [ebp+8]
 0002D658    mov         eax,dword ptr [eax-8]
 0002D65B    mov         eax,dword ptr [eax+4]
 0002D65E    cmp         eax,dword ptr [ebx+4]
>0002D661    je          0002D687
 0002D663    mov         eax,dword ptr [ebp+8]
 0002D666    mov         eax,dword ptr [eax-8]
 0002D669    mov         esi,dword ptr [eax+4]
 0002D66C    test        esi,esi
>0002D66E    je          0002D68B
 0002D670    cmp         dword ptr [ebx+4],0
>0002D674    je          0002D68B
 0002D676    mov         edx,dword ptr [ebx+4]
 0002D679    mov         eax,dword ptr [ebp+8]
 0002D67C    mov         eax,esi
 0002D67E    mov         ecx,dword ptr [eax]
 0002D680    call        dword ptr [ecx+18]
 0002D683    test        al,al
>0002D685    je          0002D68B
 0002D687    xor         eax,eax
>0002D689    jmp         0002D68D
 0002D68B    mov         al,1
 0002D68D    mov         ebx,eax
>0002D68F    jmp         0002D69E
 0002D691    mov         eax,dword ptr [ebp+8]
 0002D694    mov         eax,dword ptr [eax-8]
 0002D697    cmp         dword ptr [eax+4],0
 0002D69B    setne       bl
 0002D69E    mov         eax,ebx
 0002D6A0    pop         esi
 0002D6A1    pop         ebx
 0002D6A2    pop         ebp
 0002D6A3    ret
*}
end;

//0002D6A4
procedure TPicture.DefineProperties(Filer:TFiler);
begin
{*
 0002D6A4    push        ebp
 0002D6A5    mov         ebp,esp
 0002D6A7    add         esp,0FFFFFFF8
 0002D6AA    push        ebx
 0002D6AB    mov         dword ptr [ebp-4],edx
 0002D6AE    mov         dword ptr [ebp-8],eax
 0002D6B1    mov         eax,dword ptr [ebp-8]
 0002D6B4    push        eax
 0002D6B5    push        2D4B4;TPicture.ReadData
 0002D6BA    mov         eax,dword ptr [ebp-8]
 0002D6BD    push        eax
 0002D6BE    push        2D5CC;TPicture.WriteData
 0002D6C3    push        ebp
 0002D6C4    call        DoWrite
 0002D6C9    pop         ecx
 0002D6CA    mov         ecx,eax
 0002D6CC    mov         edx,2D6E8;'Data'
 0002D6D1    mov         eax,dword ptr [ebp-4]
 0002D6D4    mov         ebx,dword ptr [eax]
 0002D6D6    call        dword ptr [ebx+4]
 0002D6D9    pop         ebx
 0002D6DA    pop         ecx
 0002D6DB    pop         ecx
 0002D6DC    pop         ebp
 0002D6DD    ret
*}
end;

//0002D6F0
function TPicture.GetWidth:Integer;
begin
{*
 0002D6F0    xor         edx,edx
 0002D6F2    mov         ecx,dword ptr [eax+4]
 0002D6F5    test        ecx,ecx
>0002D6F7    je          0002D702
 0002D6F9    mov         eax,ecx
 0002D6FB    mov         edx,dword ptr [eax]
 0002D6FD    call        dword ptr [edx+2C]
 0002D700    mov         edx,eax
 0002D702    mov         eax,edx
 0002D704    ret
*}
end;

//0002D708
function TPicture.GetHeight:Integer;
begin
{*
 0002D708    xor         edx,edx
 0002D70A    mov         ecx,dword ptr [eax+4]
 0002D70D    test        ecx,ecx
>0002D70F    je          0002D71A
 0002D711    mov         eax,ecx
 0002D713    mov         edx,dword ptr [eax]
 0002D715    call        dword ptr [edx+20]
 0002D718    mov         edx,eax
 0002D71A    mov         eax,edx
 0002D71C    ret
*}
end;

//0002D720
destructor TMetafileImage.Destroy;
begin
{*
 0002D720    push        ebx
 0002D721    push        esi
 0002D722    call        @BeforeDestruction
 0002D727    mov         ebx,edx
 0002D729    mov         esi,eax
 0002D72B    mov         eax,dword ptr [esi+8]
 0002D72E    test        eax,eax
>0002D730    je          0002D738
 0002D732    push        eax
 0002D733    call        gdi32.DeleteEnhMetaFile
 0002D738    mov         eax,dword ptr [esi+14]
 0002D73B    call        InternalDeletePalette
 0002D740    mov         edx,ebx
 0002D742    and         dl,0FC
 0002D745    mov         eax,esi
 0002D747    call        TObject.Destroy
 0002D74C    test        bl,bl
>0002D74E    jle         0002D757
 0002D750    mov         eax,esi
 0002D752    call        @ClassDestroy
 0002D757    pop         esi
 0002D758    pop         ebx
 0002D759    ret
*}
end;

//0002D75C
procedure TMetafileImage.FreeHandle;
begin
{*
 0002D75C    ret
*}
end;

//0002D760
constructor TMetafile.Create;
begin
{*
 0002D760    push        ebx
 0002D761    push        esi
 0002D762    test        dl,dl
>0002D764    je          0002D76E
 0002D766    add         esp,0FFFFFFF0
 0002D769    call        @ClassCreate
 0002D76E    mov         ebx,edx
 0002D770    mov         esi,eax
 0002D772    xor         edx,edx
 0002D774    mov         eax,esi
 0002D776    call        TGraphic.Create
 0002D77B    mov         byte ptr [esi+1C],1
 0002D77F    mov         byte ptr [esi+15],1
 0002D783    xor         edx,edx
 0002D785    mov         eax,esi
 0002D787    mov         ecx,dword ptr [eax]
 0002D789    call        dword ptr [ecx+8]
 0002D78C    mov         eax,esi
 0002D78E    test        bl,bl
>0002D790    je          0002D7A1
 0002D792    call        @AfterConstruction
 0002D797    pop         dword ptr fs:[0]
 0002D79E    add         esp,0C
 0002D7A1    mov         eax,esi
 0002D7A3    pop         esi
 0002D7A4    pop         ebx
 0002D7A5    ret
*}
end;

//0002D7A8
destructor TMetafile.Destroy;
begin
{*
 0002D7A8    push        ebx
 0002D7A9    push        esi
 0002D7AA    call        @BeforeDestruction
 0002D7AF    mov         ebx,edx
 0002D7B1    mov         esi,eax
 0002D7B3    mov         eax,dword ptr [esi+18];TMetafile.FImage:TMetafileImage
 0002D7B6    call        TSharedImage.Release
 0002D7BB    mov         edx,ebx
 0002D7BD    and         dl,0FC
 0002D7C0    mov         eax,esi
 0002D7C2    call        TMemoryStream.Destroy
 0002D7C7    test        bl,bl
>0002D7C9    jle         0002D7D2
 0002D7CB    mov         eax,esi
 0002D7CD    call        @ClassDestroy
 0002D7D2    pop         esi
 0002D7D3    pop         ebx
 0002D7D4    ret
*}
end;

//0002D7D8
procedure TMetafile.Assign(Source:TPersistent);
begin
{*
 0002D7D8    push        ebx
 0002D7D9    push        esi
 0002D7DA    push        edi
 0002D7DB    mov         esi,edx
 0002D7DD    mov         ebx,eax
 0002D7DF    test        esi,esi
>0002D7E1    je          0002D7F4
 0002D7E3    mov         eax,esi
 0002D7E5    mov         edx,dword ptr ds:[28E34];TMetafile
 0002D7EB    call        @IsClass
 0002D7F0    test        al,al
>0002D7F2    je          0002D85E
 0002D7F4    xor         edi,edi
 0002D7F6    mov         eax,dword ptr [ebx+18]
 0002D7F9    test        eax,eax
>0002D7FB    je          0002D805
 0002D7FD    mov         edi,dword ptr [eax+14]
 0002D800    call        TSharedImage.Release
 0002D805    test        esi,esi
>0002D807    je          0002D819
 0002D809    mov         eax,esi
 0002D80B    mov         edx,dword ptr [eax+18]
 0002D80E    mov         dword ptr [ebx+18],edx
 0002D811    mov         al,byte ptr [eax+1C]
 0002D814    mov         byte ptr [ebx+1C],al
>0002D817    jmp         0002D82C
 0002D819    mov         dl,1
 0002D81B    mov         eax,[00028DD4];TMetafileImage
 0002D820    call        TObject.Create
 0002D825    mov         dword ptr [ebx+18],eax
 0002D828    mov         byte ptr [ebx+1C],1
 0002D82C    mov         eax,dword ptr [ebx+18]
 0002D82F    call        TSharedImage.Reference
 0002D834    mov         eax,ebx
 0002D836    mov         edx,dword ptr [eax]
 0002D838    call        dword ptr [edx+24]
 0002D83B    cmp         edi,eax
>0002D83D    je          0002D84A
 0002D83F    mov         eax,ebx
 0002D841    mov         edx,dword ptr [eax]
 0002D843    call        dword ptr [edx+24]
 0002D846    test        eax,eax
>0002D848    jne         0002D84E
 0002D84A    xor         eax,eax
>0002D84C    jmp         0002D850
 0002D84E    mov         al,1
 0002D850    mov         byte ptr [ebx+16],al
 0002D853    mov         edx,ebx
 0002D855    mov         eax,ebx
 0002D857    mov         ecx,dword ptr [eax]
 0002D859    call        dword ptr [ecx+10]
>0002D85C    jmp         0002D867
 0002D85E    mov         edx,esi
 0002D860    mov         eax,ebx
 0002D862    call        TPersistent.Assign
 0002D867    pop         edi
 0002D868    pop         esi
 0002D869    pop         ebx
 0002D86A    ret
*}
end;

//0002D86C
procedure TMetafile.Draw(ACanvas:TCanvas; const Rect:TRect);
begin
{*
 0002D86C    push        ebx
 0002D86D    push        esi
 0002D86E    push        edi
 0002D86F    push        ebp
 0002D870    add         esp,0FFFFFFEC
 0002D873    mov         dword ptr [esp],ecx
 0002D876    mov         edi,edx
 0002D878    mov         ebx,eax
 0002D87A    cmp         dword ptr [ebx+18],0
>0002D87E    je          0002D8F7
 0002D880    mov         eax,ebx
 0002D882    mov         edx,dword ptr [eax]
 0002D884    call        dword ptr [edx+24]
 0002D887    mov         esi,eax
 0002D889    xor         ebp,ebp
 0002D88B    test        esi,esi
>0002D88D    je          0002D8AE
 0002D88F    push        0FF
 0002D891    push        esi
 0002D892    mov         eax,edi
 0002D894    call        TCanvas.GetHandle
 0002D899    push        eax
 0002D89A    call        gdi32.SelectPalette
 0002D89F    mov         ebp,eax
 0002D8A1    mov         eax,edi
 0002D8A3    call        TCanvas.GetHandle
 0002D8A8    push        eax
 0002D8A9    call        gdi32.RealizePalette
 0002D8AE    mov         eax,dword ptr [esp]
 0002D8B1    push        esi
 0002D8B2    push        edi
 0002D8B3    mov         esi,eax
 0002D8B5    lea         edi,[esp+0C]
 0002D8B9    mov         ecx,4
 0002D8BE    rep movs    dword ptr [edi],dword ptr [esi]
 0002D8C0    pop         edi
 0002D8C1    pop         esi
 0002D8C2    dec         dword ptr [esp+0C]
 0002D8C6    dec         dword ptr [esp+10]
 0002D8CA    lea         eax,[esp+4]
 0002D8CE    push        eax
 0002D8CF    mov         eax,dword ptr [ebx+18]
 0002D8D2    mov         eax,dword ptr [eax+8]
 0002D8D5    push        eax
 0002D8D6    mov         eax,edi
 0002D8D8    call        TCanvas.GetHandle
 0002D8DD    push        eax
 0002D8DE    call        gdi32.PlayEnhMetaFile
 0002D8E3    test        esi,esi
>0002D8E5    je          0002D8F7
 0002D8E7    push        0FF
 0002D8E9    push        ebp
 0002D8EA    mov         eax,edi
 0002D8EC    call        TCanvas.GetHandle
 0002D8F1    push        eax
 0002D8F2    call        gdi32.SelectPalette
 0002D8F7    add         esp,14
 0002D8FA    pop         ebp
 0002D8FB    pop         edi
 0002D8FC    pop         esi
 0002D8FD    pop         ebx
 0002D8FE    ret
*}
end;

//0002D900
function TMetafile.GetAuthor:AnsiString;
begin
{*
 0002D900    push        ebx
 0002D901    push        esi
 0002D902    push        edi
 0002D903    mov         esi,edx
 0002D905    mov         ebx,eax
 0002D907    mov         eax,esi
 0002D909    call        @LStrClr
 0002D90E    mov         eax,dword ptr [ebx+18]
 0002D911    test        eax,eax
>0002D913    je          0002D961
 0002D915    cmp         dword ptr [eax+8],0
>0002D919    je          0002D961
 0002D91B    push        0
 0002D91D    push        0
 0002D91F    mov         eax,dword ptr [eax+8]
 0002D922    push        eax
 0002D923    call        gdi32.GetEnhMetaFileDescriptionA
 0002D928    mov         edi,eax
 0002D92A    test        edi,edi
>0002D92C    jle         0002D961
 0002D92E    mov         eax,esi
 0002D930    mov         edx,edi
 0002D932    call        @LStrSetLength
 0002D937    mov         eax,dword ptr [esi]
 0002D939    call        @LStrToPChar
 0002D93E    push        eax
 0002D93F    push        edi
 0002D940    mov         eax,dword ptr [ebx+18]
 0002D943    mov         eax,dword ptr [eax+8]
 0002D946    push        eax
 0002D947    call        gdi32.GetEnhMetaFileDescriptionA
 0002D94C    mov         eax,dword ptr [esi]
 0002D94E    call        @LStrToPChar
 0002D953    call        StrLen
 0002D958    mov         edx,eax
 0002D95A    mov         eax,esi
 0002D95C    call        @LStrSetLength
 0002D961    pop         edi
 0002D962    pop         esi
 0002D963    pop         ebx
 0002D964    ret
*}
end;

//0002D968
function TMetafile.GetDesc:AnsiString;
begin
{*
 0002D968    push        ebx
 0002D969    push        esi
 0002D96A    push        edi
 0002D96B    mov         ebx,edx
 0002D96D    mov         esi,eax
 0002D96F    mov         eax,ebx
 0002D971    call        @LStrClr
 0002D976    mov         eax,dword ptr [esi+18]
 0002D979    test        eax,eax
>0002D97B    je          0002D9E4
 0002D97D    cmp         dword ptr [eax+8],0
>0002D981    je          0002D9E4
 0002D983    push        0
 0002D985    push        0
 0002D987    mov         eax,dword ptr [eax+8]
 0002D98A    push        eax
 0002D98B    call        gdi32.GetEnhMetaFileDescriptionA
 0002D990    mov         edi,eax
 0002D992    test        edi,edi
>0002D994    jle         0002D9E4
 0002D996    mov         eax,ebx
 0002D998    mov         edx,edi
 0002D99A    call        @LStrSetLength
 0002D99F    mov         eax,dword ptr [ebx]
 0002D9A1    call        @LStrToPChar
 0002D9A6    push        eax
 0002D9A7    push        edi
 0002D9A8    mov         eax,dword ptr [esi+18]
 0002D9AB    mov         eax,dword ptr [eax+8]
 0002D9AE    push        eax
 0002D9AF    call        gdi32.GetEnhMetaFileDescriptionA
 0002D9B4    mov         eax,dword ptr [ebx]
 0002D9B6    call        @LStrToPChar
 0002D9BB    call        StrLen
 0002D9C0    mov         ecx,eax
 0002D9C2    inc         ecx
 0002D9C3    mov         eax,ebx
 0002D9C5    mov         edx,1
 0002D9CA    call        @LStrDelete
 0002D9CF    mov         eax,dword ptr [ebx]
 0002D9D1    call        @LStrToPChar
 0002D9D6    call        StrLen
 0002D9DB    mov         edx,eax
 0002D9DD    mov         eax,ebx
 0002D9DF    call        @LStrSetLength
 0002D9E4    pop         edi
 0002D9E5    pop         esi
 0002D9E6    pop         ebx
 0002D9E7    ret
*}
end;

//0002D9E8
function TMetafile.GetEmpty:Boolean;
begin
{*
 0002D9E8    cmp         dword ptr [eax+18],0
 0002D9EC    sete        al
 0002D9EF    ret
*}
end;

//0002D9F0
function TMetafile.GetHeight:Integer;
begin
{*
 0002D9F0    push        ebx
 0002D9F1    add         esp,0FFFFFF9C
 0002D9F4    mov         ebx,eax
 0002D9F6    cmp         dword ptr [ebx+18],0
>0002D9FA    jne         0002DA03
 0002D9FC    mov         eax,ebx
 0002D9FE    call        TMetafile.NewImage
 0002DA03    mov         ebx,dword ptr [ebx+18]
 0002DA06    cmp         word ptr [ebx+18],0
>0002DA0B    jne         0002DA38
 0002DA0D    mov         eax,dword ptr [ebx+8]
 0002DA10    test        eax,eax
>0002DA12    jne         0002DA19
 0002DA14    mov         eax,dword ptr [ebx+20]
>0002DA17    jmp         0002DA4C
 0002DA19    push        esp
 0002DA1A    push        64
 0002DA1C    push        eax
 0002DA1D    call        gdi32.GetEnhMetaFileHeader
 0002DA22    imul        eax,dword ptr [esp+54],64
 0002DA27    push        eax
 0002DA28    mov         eax,dword ptr [esp+50]
 0002DA2C    push        eax
 0002DA2D    mov         eax,dword ptr [ebx+10]
 0002DA30    push        eax
 0002DA31    call        kernel32.MulDiv
>0002DA36    jmp         0002DA4C
 0002DA38    push        9EC
 0002DA3D    mov         eax,[000B663C]
 0002DA42    push        eax
 0002DA43    mov         eax,dword ptr [ebx+10]
 0002DA46    push        eax
 0002DA47    call        kernel32.MulDiv
 0002DA4C    add         esp,64
 0002DA4F    pop         ebx
 0002DA50    ret
*}
end;

//0002DA54
function TMetafile.GetMMHeight:Integer;
begin
{*
 0002DA54    push        ebx
 0002DA55    mov         ebx,eax
 0002DA57    cmp         dword ptr [ebx+18],0
>0002DA5B    jne         0002DA64
 0002DA5D    mov         eax,ebx
 0002DA5F    call        TMetafile.NewImage
 0002DA64    mov         eax,dword ptr [ebx+18]
 0002DA67    mov         eax,dword ptr [eax+10]
 0002DA6A    pop         ebx
 0002DA6B    ret
*}
end;

//0002DA6C
function TMetafile.GetMMWidth:Integer;
begin
{*
 0002DA6C    push        ebx
 0002DA6D    mov         ebx,eax
 0002DA6F    cmp         dword ptr [ebx+18],0
>0002DA73    jne         0002DA7C
 0002DA75    mov         eax,ebx
 0002DA77    call        TMetafile.NewImage
 0002DA7C    mov         eax,dword ptr [ebx+18]
 0002DA7F    mov         eax,dword ptr [eax+0C]
 0002DA82    pop         ebx
 0002DA83    ret
*}
end;

//0002DA84
function TMetafile.GetPalette:HPALETTE;
begin
{*
 0002DA84    push        ebx
 0002DA85    push        esi
 0002DA86    push        edi
 0002DA87    add         esp,0FFFFFBFC
 0002DA8D    mov         ebx,eax
 0002DA8F    xor         edi,edi
 0002DA91    mov         eax,dword ptr [ebx+18]
 0002DA94    test        eax,eax
>0002DA96    je          0002DB01
 0002DA98    cmp         dword ptr [eax+8],0
>0002DA9C    je          0002DB01
 0002DA9E    cmp         dword ptr [eax+14],0
>0002DAA2    jne         0002DAFB
 0002DAA4    push        0
 0002DAA6    push        0
 0002DAA8    mov         eax,dword ptr [eax+8]
 0002DAAB    push        eax
 0002DAAC    call        gdi32.GetEnhMetaFilePaletteEntries
 0002DAB1    mov         esi,eax
 0002DAB3    test        esi,esi
>0002DAB5    je          0002DB01
 0002DAB7    cmp         esi,100
>0002DABD    jle         0002DAC5
 0002DABF    and         esi,0FF
 0002DAC5    mov         eax,dword ptr [ebx+18]
 0002DAC8    mov         eax,dword ptr [eax+14]
 0002DACB    call        InternalDeletePalette
 0002DAD0    mov         word ptr [esp],300
 0002DAD6    mov         word ptr [esp+2],si
 0002DADB    lea         eax,[esp+4]
 0002DADF    push        eax
 0002DAE0    push        esi
 0002DAE1    mov         eax,dword ptr [ebx+18]
 0002DAE4    mov         eax,dword ptr [eax+8]
 0002DAE7    push        eax
 0002DAE8    call        gdi32.GetEnhMetaFilePaletteEntries
 0002DAED    mov         eax,esp
 0002DAEF    push        eax
 0002DAF0    call        gdi32.CreatePalette
 0002DAF5    mov         edx,dword ptr [ebx+18]
 0002DAF8    mov         dword ptr [edx+14],eax
 0002DAFB    mov         eax,dword ptr [ebx+18]
 0002DAFE    mov         edi,dword ptr [eax+14]
 0002DB01    mov         eax,edi
 0002DB03    add         esp,404
 0002DB09    pop         edi
 0002DB0A    pop         esi
 0002DB0B    pop         ebx
 0002DB0C    ret
*}
end;

//0002DB10
function TMetafile.GetWidth:Integer;
begin
{*
 0002DB10    push        ebx
 0002DB11    add         esp,0FFFFFF9C
 0002DB14    mov         ebx,eax
 0002DB16    cmp         dword ptr [ebx+18],0
>0002DB1A    jne         0002DB23
 0002DB1C    mov         eax,ebx
 0002DB1E    call        TMetafile.NewImage
 0002DB23    mov         ebx,dword ptr [ebx+18]
 0002DB26    cmp         word ptr [ebx+18],0
>0002DB2B    jne         0002DB58
 0002DB2D    mov         eax,dword ptr [ebx+8]
 0002DB30    test        eax,eax
>0002DB32    jne         0002DB39
 0002DB34    mov         eax,dword ptr [ebx+1C]
>0002DB37    jmp         0002DB6C
 0002DB39    push        esp
 0002DB3A    push        64
 0002DB3C    push        eax
 0002DB3D    call        gdi32.GetEnhMetaFileHeader
 0002DB42    imul        eax,dword ptr [esp+50],64
 0002DB47    push        eax
 0002DB48    mov         eax,dword ptr [esp+4C]
 0002DB4C    push        eax
 0002DB4D    mov         eax,dword ptr [ebx+0C]
 0002DB50    push        eax
 0002DB51    call        kernel32.MulDiv
>0002DB56    jmp         0002DB6C
 0002DB58    push        9EC
 0002DB5D    mov         eax,[000B663C]
 0002DB62    push        eax
 0002DB63    mov         eax,dword ptr [ebx+0C]
 0002DB66    push        eax
 0002DB67    call        kernel32.MulDiv
 0002DB6C    add         esp,64
 0002DB6F    pop         ebx
 0002DB70    ret
*}
end;

//0002DB74
procedure TMetafile.LoadFromStream(Stream:TStream);
begin
{*
 0002DB74    push        ebx
 0002DB75    push        esi
 0002DB76    mov         esi,edx
 0002DB78    mov         ebx,eax
 0002DB7A    mov         edx,esi
 0002DB7C    mov         eax,ebx
 0002DB7E    call        TMetafile.TestEMF
 0002DB83    test        al,al
>0002DB85    je          0002DB92
 0002DB87    mov         edx,esi
 0002DB89    mov         eax,ebx
 0002DB8B    call        TMetafile.ReadEMFStream
>0002DB90    jmp         0002DBAD
 0002DB92    mov         eax,esi
 0002DB94    call        TStream.GetSize
 0002DB99    push        eax
 0002DB9A    mov         eax,esi
 0002DB9C    call        TStream.GetPosition
 0002DBA1    pop         ecx
 0002DBA2    sub         ecx,eax
 0002DBA4    mov         edx,esi
 0002DBA6    mov         eax,ebx
 0002DBA8    call        TMetafile.ReadWMFStream
 0002DBAD    mov         eax,ebx
 0002DBAF    mov         edx,dword ptr [eax]
 0002DBB1    call        dword ptr [edx+24]
 0002DBB4    test        eax,eax
 0002DBB6    setne       al
 0002DBB9    mov         byte ptr [ebx+16],al
 0002DBBC    mov         edx,ebx
 0002DBBE    mov         eax,ebx
 0002DBC0    mov         ecx,dword ptr [eax]
 0002DBC2    call        dword ptr [ecx+10]
 0002DBC5    pop         esi
 0002DBC6    pop         ebx
 0002DBC7    ret
*}
end;

//0002DBC8
procedure TMetafile.NewImage;
begin
{*
 0002DBC8    push        ebx
 0002DBC9    push        esi
 0002DBCA    mov         ebx,eax
 0002DBCC    mov         eax,dword ptr [ebx+18]
 0002DBCF    call        TSharedImage.Release
 0002DBD4    mov         dl,1
 0002DBD6    mov         eax,[00028DD4];TMetafileImage
 0002DBDB    call        TObject.Create
 0002DBE0    mov         esi,eax
 0002DBE2    mov         dword ptr [ebx+18],esi
 0002DBE5    mov         eax,esi
 0002DBE7    call        TSharedImage.Reference
 0002DBEC    pop         esi
 0002DBED    pop         ebx
 0002DBEE    ret
*}
end;

//0002DBF0
procedure TMetafile.ReadData(Stream:TStream);
begin
{*
 0002DBF0    push        ebx
 0002DBF1    push        esi
 0002DBF2    push        edi
 0002DBF3    push        ecx
 0002DBF4    mov         esi,edx
 0002DBF6    mov         ebx,eax
 0002DBF8    mov         edx,esp
 0002DBFA    mov         ecx,4
 0002DBFF    mov         eax,esi
 0002DC01    mov         edi,dword ptr [eax]
 0002DC03    call        dword ptr [edi+4]
 0002DC06    mov         edx,esi
 0002DC08    mov         eax,ebx
 0002DC0A    call        TMetafile.TestEMF
 0002DC0F    test        al,al
>0002DC11    je          0002DC1E
 0002DC13    mov         edx,esi
 0002DC15    mov         eax,ebx
 0002DC17    call        TMetafile.ReadEMFStream
>0002DC1C    jmp         0002DC2D
 0002DC1E    mov         ecx,dword ptr [esp]
 0002DC21    sub         ecx,4
 0002DC24    mov         edx,esi
 0002DC26    mov         eax,ebx
 0002DC28    call        TMetafile.ReadWMFStream
 0002DC2D    mov         eax,ebx
 0002DC2F    mov         edx,dword ptr [eax]
 0002DC31    call        dword ptr [edx+24]
 0002DC34    test        eax,eax
 0002DC36    setne       al
 0002DC39    mov         byte ptr [ebx+16],al
 0002DC3C    mov         edx,ebx
 0002DC3E    mov         eax,ebx
 0002DC40    mov         ecx,dword ptr [eax]
 0002DC42    call        dword ptr [ecx+10]
 0002DC45    pop         edx
 0002DC46    pop         edi
 0002DC47    pop         esi
 0002DC48    pop         ebx
 0002DC49    ret
*}
end;

//0002DC4C
procedure TMetafile.ReadEMFStream(Stream:TStream);
begin
{*
 0002DC4C    push        ebp
 0002DC4D    mov         ebp,esp
 0002DC4F    add         esp,0FFFFFF98
 0002DC52    push        ebx
 0002DC53    push        esi
 0002DC54    push        edi
 0002DC55    mov         edi,edx
 0002DC57    mov         esi,eax
 0002DC59    mov         eax,esi
 0002DC5B    call        TMetafile.NewImage
 0002DC60    lea         edx,[ebp-68]
 0002DC63    mov         ecx,64
 0002DC68    mov         eax,edi
 0002DC6A    call        TStream.ReadBuffer
 0002DC6F    cmp         dword ptr [ebp-40],464D4520
>0002DC76    je          0002DC7D
 0002DC78    call        InvalidMetafile
 0002DC7D    mov         eax,dword ptr [ebp-38]
 0002DC80    call        @GetMem
 0002DC85    mov         dword ptr [ebp-4],eax
 0002DC88    mov         ebx,dword ptr [esi+18]
 0002DC8B    xor         eax,eax
 0002DC8D    push        ebp
 0002DC8E    push        2DD0C
 0002DC93    push        dword ptr fs:[eax]
 0002DC96    mov         dword ptr fs:[eax],esp
 0002DC99    mov         edx,dword ptr [ebp-4]
 0002DC9C    lea         eax,[ebp-68]
 0002DC9F    mov         ecx,64
 0002DCA4    call        Move
 0002DCA9    mov         ecx,dword ptr [ebp-38]
 0002DCAC    sub         ecx,64
 0002DCAF    mov         edx,dword ptr [ebp-4]
 0002DCB2    add         edx,64
 0002DCB5    mov         eax,edi
 0002DCB7    call        TStream.ReadBuffer
 0002DCBC    mov         eax,dword ptr [ebp-4]
 0002DCBF    push        eax
 0002DCC0    mov         eax,dword ptr [ebp-38]
 0002DCC3    push        eax
 0002DCC4    call        gdi32.SetEnhMetaFileBits
 0002DCC9    mov         edi,eax
 0002DCCB    mov         dword ptr [ebx+8],edi
 0002DCCE    test        edi,edi
>0002DCD0    jne         0002DCD7
 0002DCD2    call        InvalidMetafile
 0002DCD7    mov         word ptr [ebx+18],0
 0002DCDD    mov         eax,dword ptr [ebp-48]
 0002DCE0    sub         eax,dword ptr [ebp-50]
 0002DCE3    mov         dword ptr [ebx+0C],eax
 0002DCE6    mov         eax,dword ptr [ebp-44]
 0002DCE9    sub         eax,dword ptr [ebp-4C]
 0002DCEC    mov         dword ptr [ebx+10],eax
 0002DCEF    mov         byte ptr [esi+1C],1
 0002DCF3    xor         eax,eax
 0002DCF5    pop         edx
 0002DCF6    pop         ecx
 0002DCF7    pop         ecx
 0002DCF8    mov         dword ptr fs:[eax],edx
 0002DCFB    push        2DD13
 0002DD00    mov         edx,dword ptr [ebp-38]
 0002DD03    mov         eax,dword ptr [ebp-4]
 0002DD06    call        @FreeMem
 0002DD0B    ret
>0002DD0C    jmp         @HandleFinally
>0002DD11    jmp         0002DD00
 0002DD13    pop         edi
 0002DD14    pop         esi
 0002DD15    pop         ebx
 0002DD16    mov         esp,ebp
 0002DD18    pop         ebp
 0002DD19    ret
*}
end;

//0002DD1C
procedure TMetafile.ReadWMFStream(Stream:TStream; Length:Longint);
begin
{*
 0002DD1C    push        ebp
 0002DD1D    mov         ebp,esp
 0002DD1F    add         esp,0FFFFFFCC
 0002DD22    push        ebx
 0002DD23    push        esi
 0002DD24    push        edi
 0002DD25    mov         dword ptr [ebp-8],ecx
 0002DD28    mov         dword ptr [ebp-4],edx
 0002DD2B    mov         ebx,eax
 0002DD2D    mov         eax,ebx
 0002DD2F    call        TMetafile.NewImage
 0002DD34    lea         edx,[ebp-22]
 0002DD37    mov         ecx,16
 0002DD3C    mov         eax,dword ptr [ebp-4]
 0002DD3F    mov         esi,dword ptr [eax]
 0002DD41    call        dword ptr [esi+4]
 0002DD44    cmp         dword ptr [ebp-22],9AC6CDD7
>0002DD4B    jne         0002DD5B
 0002DD4D    lea         eax,[ebp-22]
 0002DD50    call        ComputeAldusChecksum
 0002DD55    cmp         ax,word ptr [ebp-0E]
>0002DD59    je          0002DD60
 0002DD5B    call        InvalidMetafile
 0002DD60    sub         dword ptr [ebp-8],16
 0002DD64    mov         eax,dword ptr [ebp-8]
 0002DD67    call        @GetMem
 0002DD6C    mov         dword ptr [ebp-0C],eax
 0002DD6F    mov         esi,dword ptr [ebx+18]
 0002DD72    xor         eax,eax
 0002DD74    push        ebp
 0002DD75    push        2DE34
 0002DD7A    push        dword ptr fs:[eax]
 0002DD7D    mov         dword ptr fs:[eax],esp
 0002DD80    mov         edx,dword ptr [ebp-0C]
 0002DD83    mov         ecx,dword ptr [ebp-8]
 0002DD86    mov         eax,dword ptr [ebp-4]
 0002DD89    mov         edi,dword ptr [eax]
 0002DD8B    call        dword ptr [edi+4]
 0002DD8E    mov         eax,dword ptr [ebx+18]
 0002DD91    mov         dx,word ptr [ebp-14]
 0002DD95    mov         word ptr [eax+18],dx
 0002DD99    cmp         word ptr [ebp-14],0
>0002DD9E    jne         0002DDA6
 0002DDA0    mov         word ptr [ebp-14],60
 0002DDA6    movzx       eax,word ptr [ebp-14]
 0002DDAA    push        eax
 0002DDAB    push        9EC
 0002DDB0    movsx       eax,word ptr [ebp-18]
 0002DDB4    movsx       edx,word ptr [ebp-1C]
 0002DDB8    sub         eax,edx
 0002DDBA    push        eax
 0002DDBB    call        kernel32.MulDiv
 0002DDC0    mov         dword ptr [esi+0C],eax
 0002DDC3    movzx       eax,word ptr [ebp-14]
 0002DDC7    push        eax
 0002DDC8    push        9EC
 0002DDCD    movsx       eax,word ptr [ebp-16]
 0002DDD1    movsx       edx,word ptr [ebp-1A]
 0002DDD5    sub         eax,edx
 0002DDD7    push        eax
 0002DDD8    call        kernel32.MulDiv
 0002DDDD    mov         dword ptr [esi+10],eax
 0002DDE0    mov         dword ptr [ebp-32],8
 0002DDE7    xor         eax,eax
 0002DDE9    mov         dword ptr [ebp-2E],eax
 0002DDEC    xor         eax,eax
 0002DDEE    mov         dword ptr [ebp-2A],eax
 0002DDF1    xor         eax,eax
 0002DDF3    mov         dword ptr [ebp-26],eax
 0002DDF6    lea         eax,[ebp-32]
 0002DDF9    push        eax
 0002DDFA    push        0
 0002DDFC    mov         eax,dword ptr [ebp-0C]
 0002DDFF    push        eax
 0002DE00    mov         eax,dword ptr [ebp-8]
 0002DE03    push        eax
 0002DE04    call        gdi32.SetWinMetaFileBits
 0002DE09    mov         edi,eax
 0002DE0B    mov         dword ptr [esi+8],edi
 0002DE0E    test        edi,edi
>0002DE10    jne         0002DE17
 0002DE12    call        InvalidMetafile
 0002DE17    mov         byte ptr [ebx+1C],0
 0002DE1B    xor         eax,eax
 0002DE1D    pop         edx
 0002DE1E    pop         ecx
 0002DE1F    pop         ecx
 0002DE20    mov         dword ptr fs:[eax],edx
 0002DE23    push        2DE3B
 0002DE28    mov         edx,dword ptr [ebp-8]
 0002DE2B    mov         eax,dword ptr [ebp-0C]
 0002DE2E    call        @FreeMem
 0002DE33    ret
>0002DE34    jmp         @HandleFinally
>0002DE39    jmp         0002DE28
 0002DE3B    pop         edi
 0002DE3C    pop         esi
 0002DE3D    pop         ebx
 0002DE3E    mov         esp,ebp
 0002DE40    pop         ebp
 0002DE41    ret
*}
end;

//0002DE44
procedure TMetafile.SaveToFile(const Filename:AnsiString);
begin
{*
 0002DE44    push        ebp
 0002DE45    mov         ebp,esp
 0002DE47    push        0
 0002DE49    push        0
 0002DE4B    push        ebx
 0002DE4C    push        esi
 0002DE4D    push        edi
 0002DE4E    mov         esi,edx
 0002DE50    mov         edi,eax
 0002DE52    xor         eax,eax
 0002DE54    push        ebp
 0002DE55    push        2DEB2
 0002DE5A    push        dword ptr fs:[eax]
 0002DE5D    mov         dword ptr fs:[eax],esp
 0002DE60    mov         bl,byte ptr [edi+1C]
 0002DE63    lea         edx,[ebp-8]
 0002DE66    mov         eax,esi
 0002DE68    call        ExtractFileExt
 0002DE6D    mov         eax,dword ptr [ebp-8]
 0002DE70    lea         edx,[ebp-4]
 0002DE73    call        AnsiLowerCaseFileName
 0002DE78    mov         eax,dword ptr [ebp-4]
 0002DE7B    mov         edx,2DEC8;'.wmf'
 0002DE80    call        @LStrCmp
>0002DE85    jne         0002DE8B
 0002DE87    mov         byte ptr [edi+1C],0
 0002DE8B    mov         edx,esi
 0002DE8D    mov         eax,edi
 0002DE8F    call        TGraphic.SaveToFile
 0002DE94    mov         byte ptr [edi+1C],bl
 0002DE97    xor         eax,eax
 0002DE99    pop         edx
 0002DE9A    pop         ecx
 0002DE9B    pop         ecx
 0002DE9C    mov         dword ptr fs:[eax],edx
 0002DE9F    push        2DEB9
 0002DEA4    lea         eax,[ebp-8]
 0002DEA7    mov         edx,2
 0002DEAC    call        @LStrArrayClr
 0002DEB1    ret
>0002DEB2    jmp         @HandleFinally
>0002DEB7    jmp         0002DEA4
 0002DEB9    pop         edi
 0002DEBA    pop         esi
 0002DEBB    pop         ebx
 0002DEBC    pop         ecx
 0002DEBD    pop         ecx
 0002DEBE    pop         ebp
 0002DEBF    ret
*}
end;

//0002DED0
procedure TMetafile.SaveToStream(Stream:TStream);
begin
{*
 0002DED0    cmp         dword ptr [eax+18],0
>0002DED4    je          0002DEE8
 0002DED6    cmp         byte ptr [eax+1C],0
>0002DEDA    je          0002DEE3
 0002DEDC    call        TMetafile.WriteEMFStream
>0002DEE1    jmp         0002DEE8
 0002DEE3    call        TMetafile.WriteWMFStream
 0002DEE8    ret
*}
end;

//0002DEEC
procedure TMetafile.SetHandle(Value:THandle);
begin
{*
 0002DEEC    push        ebx
 0002DEED    push        esi
 0002DEEE    add         esp,0FFFFFF9C
 0002DEF1    mov         esi,edx
 0002DEF3    mov         ebx,eax
 0002DEF5    test        esi,esi
>0002DEF7    je          0002DF0B
 0002DEF9    push        esp
 0002DEFA    push        64
 0002DEFC    push        esi
 0002DEFD    call        gdi32.GetEnhMetaFileHeader
 0002DF02    test        eax,eax
>0002DF04    jne         0002DF0B
 0002DF06    call        InvalidMetafile
 0002DF0B    mov         eax,ebx
 0002DF0D    call        TMetafile.UniqueImage
 0002DF12    mov         eax,dword ptr [ebx+18]
 0002DF15    mov         eax,dword ptr [eax+8]
 0002DF18    test        eax,eax
>0002DF1A    je          0002DF22
 0002DF1C    push        eax
 0002DF1D    call        gdi32.DeleteEnhMetaFile
 0002DF22    mov         eax,dword ptr [ebx+18]
 0002DF25    mov         eax,dword ptr [eax+14]
 0002DF28    call        InternalDeletePalette
 0002DF2D    mov         eax,dword ptr [ebx+18]
 0002DF30    xor         edx,edx
 0002DF32    mov         dword ptr [eax+14],edx
 0002DF35    mov         dword ptr [eax+8],esi
 0002DF38    xor         edx,edx
 0002DF3A    mov         dword ptr [eax+1C],edx
 0002DF3D    xor         edx,edx
 0002DF3F    mov         dword ptr [eax+20],edx
 0002DF42    test        esi,esi
>0002DF44    je          0002DF5C
 0002DF46    mov         edx,dword ptr [esp+20]
 0002DF4A    sub         edx,dword ptr [esp+18]
 0002DF4E    mov         dword ptr [eax+0C],edx
 0002DF51    mov         edx,dword ptr [esp+24]
 0002DF55    sub         edx,dword ptr [esp+1C]
 0002DF59    mov         dword ptr [eax+10],edx
 0002DF5C    mov         eax,ebx
 0002DF5E    mov         edx,dword ptr [eax]
 0002DF60    call        dword ptr [edx+24]
 0002DF63    test        eax,eax
 0002DF65    setne       al
 0002DF68    mov         byte ptr [ebx+16],al
 0002DF6B    mov         edx,ebx
 0002DF6D    mov         eax,ebx
 0002DF6F    mov         ecx,dword ptr [eax]
 0002DF71    call        dword ptr [ecx+10]
 0002DF74    add         esp,64
 0002DF77    pop         esi
 0002DF78    pop         ebx
 0002DF79    ret
*}
end;

//0002DF7C
procedure TMetafile.SetHeight(Value:Integer);
begin
{*
 0002DF7C    push        ebx
 0002DF7D    push        esi
 0002DF7E    add         esp,0FFFFFF9C
 0002DF81    mov         esi,edx
 0002DF83    mov         ebx,eax
 0002DF85    cmp         dword ptr [ebx+18],0
>0002DF89    jne         0002DF92
 0002DF8B    mov         eax,ebx
 0002DF8D    call        TMetafile.NewImage
 0002DF92    mov         eax,dword ptr [ebx+18]
 0002DF95    cmp         word ptr [eax+18],0
>0002DF9A    jne         0002DFCD
 0002DF9C    mov         edx,dword ptr [eax+8]
 0002DF9F    test        edx,edx
>0002DFA1    jne         0002DFA8
 0002DFA3    mov         dword ptr [eax+20],esi
>0002DFA6    jmp         0002DFE7
 0002DFA8    push        esp
 0002DFA9    push        64
 0002DFAB    push        edx
 0002DFAC    call        gdi32.GetEnhMetaFileHeader
 0002DFB1    mov         eax,dword ptr [esp+4C]
 0002DFB5    push        eax
 0002DFB6    imul        eax,dword ptr [esp+58],64
 0002DFBB    push        eax
 0002DFBC    push        esi
 0002DFBD    call        kernel32.MulDiv
 0002DFC2    mov         edx,eax
 0002DFC4    mov         eax,ebx
 0002DFC6    call        TMetafile.SetMMHeight
>0002DFCB    jmp         0002DFE7
 0002DFCD    mov         eax,[000B663C]
 0002DFD2    push        eax
 0002DFD3    push        9EC
 0002DFD8    push        esi
 0002DFD9    call        kernel32.MulDiv
 0002DFDE    mov         edx,eax
 0002DFE0    mov         eax,ebx
 0002DFE2    call        TMetafile.SetMMHeight
 0002DFE7    add         esp,64
 0002DFEA    pop         esi
 0002DFEB    pop         ebx
 0002DFEC    ret
*}
end;

//0002DFF0
procedure TMetafile.SetMMHeight(Value:Integer);
begin
{*
 0002DFF0    push        ebx
 0002DFF1    push        esi
 0002DFF2    mov         esi,edx
 0002DFF4    mov         ebx,eax
 0002DFF6    cmp         dword ptr [ebx+18],0
>0002DFFA    jne         0002E003
 0002DFFC    mov         eax,ebx
 0002DFFE    call        TMetafile.NewImage
 0002E003    mov         eax,dword ptr [ebx+18]
 0002E006    xor         edx,edx
 0002E008    mov         dword ptr [eax+20],edx
 0002E00B    cmp         esi,dword ptr [eax+10]
>0002E00E    je          0002E026
 0002E010    mov         eax,ebx
 0002E012    call        TMetafile.UniqueImage
 0002E017    mov         eax,dword ptr [ebx+18]
 0002E01A    mov         dword ptr [eax+10],esi
 0002E01D    mov         edx,ebx
 0002E01F    mov         eax,ebx
 0002E021    mov         ecx,dword ptr [eax]
 0002E023    call        dword ptr [ecx+10]
 0002E026    pop         esi
 0002E027    pop         ebx
 0002E028    ret
*}
end;

//0002E02C
procedure TMetafile.SetMMWidth(Value:Integer);
begin
{*
 0002E02C    push        ebx
 0002E02D    push        esi
 0002E02E    mov         esi,edx
 0002E030    mov         ebx,eax
 0002E032    cmp         dword ptr [ebx+18],0
>0002E036    jne         0002E03F
 0002E038    mov         eax,ebx
 0002E03A    call        TMetafile.NewImage
 0002E03F    mov         eax,dword ptr [ebx+18]
 0002E042    xor         edx,edx
 0002E044    mov         dword ptr [eax+1C],edx
 0002E047    cmp         esi,dword ptr [eax+0C]
>0002E04A    je          0002E062
 0002E04C    mov         eax,ebx
 0002E04E    call        TMetafile.UniqueImage
 0002E053    mov         eax,dword ptr [ebx+18]
 0002E056    mov         dword ptr [eax+0C],esi
 0002E059    mov         edx,ebx
 0002E05B    mov         eax,ebx
 0002E05D    mov         ecx,dword ptr [eax]
 0002E05F    call        dword ptr [ecx+10]
 0002E062    pop         esi
 0002E063    pop         ebx
 0002E064    ret
*}
end;

//0002E068
procedure TMetafile.SetTransparent(Value:Boolean);
begin
{*
 0002E068    ret
*}
end;

//0002E06C
procedure TMetafile.SetWidth(Value:Integer);
begin
{*
 0002E06C    push        ebx
 0002E06D    push        esi
 0002E06E    add         esp,0FFFFFF9C
 0002E071    mov         esi,edx
 0002E073    mov         ebx,eax
 0002E075    cmp         dword ptr [ebx+18],0
>0002E079    jne         0002E082
 0002E07B    mov         eax,ebx
 0002E07D    call        TMetafile.NewImage
 0002E082    mov         eax,dword ptr [ebx+18]
 0002E085    cmp         word ptr [eax+18],0
>0002E08A    jne         0002E0BD
 0002E08C    mov         edx,dword ptr [eax+8]
 0002E08F    test        edx,edx
>0002E091    jne         0002E098
 0002E093    mov         dword ptr [eax+1C],esi
>0002E096    jmp         0002E0D7
 0002E098    push        esp
 0002E099    push        64
 0002E09B    push        edx
 0002E09C    call        gdi32.GetEnhMetaFileHeader
 0002E0A1    mov         eax,dword ptr [esp+48]
 0002E0A5    push        eax
 0002E0A6    imul        eax,dword ptr [esp+54],64
 0002E0AB    push        eax
 0002E0AC    push        esi
 0002E0AD    call        kernel32.MulDiv
 0002E0B2    mov         edx,eax
 0002E0B4    mov         eax,ebx
 0002E0B6    call        TMetafile.SetMMWidth
>0002E0BB    jmp         0002E0D7
 0002E0BD    mov         eax,[000B663C]
 0002E0C2    push        eax
 0002E0C3    push        9EC
 0002E0C8    push        esi
 0002E0C9    call        kernel32.MulDiv
 0002E0CE    mov         edx,eax
 0002E0D0    mov         eax,ebx
 0002E0D2    call        TMetafile.SetMMWidth
 0002E0D7    add         esp,64
 0002E0DA    pop         esi
 0002E0DB    pop         ebx
 0002E0DC    ret
*}
end;

//0002E0E0
function TMetafile.TestEMF(Stream:TStream):Boolean;
begin
{*
 0002E0E0    push        ebx
 0002E0E1    push        esi
 0002E0E2    push        edi
 0002E0E3    add         esp,0FFFFFF9C
 0002E0E6    mov         ebx,edx
 0002E0E8    mov         eax,ebx
 0002E0EA    call        TStream.GetSize
 0002E0EF    mov         esi,eax
 0002E0F1    mov         eax,ebx
 0002E0F3    call        TStream.GetPosition
 0002E0F8    sub         esi,eax
 0002E0FA    cmp         esi,64
>0002E0FD    jle         0002E11D
 0002E0FF    mov         edx,esp
 0002E101    mov         ecx,64
 0002E106    mov         eax,ebx
 0002E108    mov         edi,dword ptr [eax]
 0002E10A    call        dword ptr [edi+4]
 0002E10D    mov         cx,1
 0002E111    mov         edx,0FFFFFF9C
 0002E116    mov         eax,ebx
 0002E118    mov         ebx,dword ptr [eax]
 0002E11A    call        dword ptr [ebx+0C]
 0002E11D    cmp         esi,64
>0002E120    jle         0002E132
 0002E122    cmp         dword ptr [esp],1
>0002E126    jne         0002E132
 0002E128    cmp         dword ptr [esp+28],464D4520
>0002E130    je          0002E136
 0002E132    xor         eax,eax
>0002E134    jmp         0002E138
 0002E136    mov         al,1
 0002E138    add         esp,64
 0002E13B    pop         edi
 0002E13C    pop         esi
 0002E13D    pop         ebx
 0002E13E    ret
*}
end;

//0002E140
procedure TMetafile.UniqueImage;
begin
{*
 0002E140    push        ebx
 0002E141    push        esi
 0002E142    push        edi
 0002E143    mov         ebx,eax
 0002E145    mov         eax,dword ptr [ebx+18]
 0002E148    test        eax,eax
>0002E14A    jne         0002E155
 0002E14C    mov         eax,ebx
 0002E14E    call        TMetafile.NewImage
>0002E153    jmp         0002E1BF
 0002E155    cmp         dword ptr [eax+4],1
>0002E159    jle         0002E1BF
 0002E15B    mov         dl,1
 0002E15D    mov         eax,[00028DD4];TMetafileImage
 0002E162    call        TObject.Create
 0002E167    mov         esi,eax
 0002E169    mov         eax,dword ptr [ebx+18]
 0002E16C    mov         edi,dword ptr [eax+8]
 0002E16F    test        edi,edi
>0002E171    je          0002E17E
 0002E173    push        0
 0002E175    push        edi
 0002E176    call        gdi32.CopyEnhMetaFileA
 0002E17B    mov         dword ptr [esi+8],eax
 0002E17E    mov         eax,dword ptr [ebx+18]
 0002E181    mov         eax,dword ptr [eax+10]
 0002E184    mov         dword ptr [esi+10],eax
 0002E187    mov         eax,dword ptr [ebx+18]
 0002E18A    mov         eax,dword ptr [eax+0C]
 0002E18D    mov         dword ptr [esi+0C],eax
 0002E190    mov         eax,dword ptr [ebx+18]
 0002E193    mov         ax,word ptr [eax+18]
 0002E197    mov         word ptr [esi+18],ax
 0002E19B    mov         eax,dword ptr [ebx+18]
 0002E19E    mov         eax,dword ptr [eax+1C]
 0002E1A1    mov         dword ptr [esi+1C],eax
 0002E1A4    mov         eax,dword ptr [ebx+18]
 0002E1A7    mov         eax,dword ptr [eax+20]
 0002E1AA    mov         dword ptr [esi+20],eax
 0002E1AD    mov         eax,dword ptr [ebx+18]
 0002E1B0    call        TSharedImage.Release
 0002E1B5    mov         eax,esi
 0002E1B7    mov         dword ptr [ebx+18],eax
 0002E1BA    call        TSharedImage.Reference
 0002E1BF    pop         edi
 0002E1C0    pop         esi
 0002E1C1    pop         ebx
 0002E1C2    ret
*}
end;

//0002E1C4
procedure TMetafile.WriteData(Stream:TStream);
begin
{*
 0002E1C4    push        ebx
 0002E1C5    push        esi
 0002E1C6    push        edi
 0002E1C7    push        ecx
 0002E1C8    mov         ebx,edx
 0002E1CA    mov         esi,eax
 0002E1CC    cmp         dword ptr [esi+18],0
>0002E1D0    je          0002E240
 0002E1D2    xor         eax,eax
 0002E1D4    mov         dword ptr [esp],eax
 0002E1D7    mov         edx,esp
 0002E1D9    mov         ecx,4
 0002E1DE    mov         eax,ebx
 0002E1E0    mov         edi,dword ptr [eax]
 0002E1E2    call        dword ptr [edi+8]
 0002E1E5    mov         eax,ebx
 0002E1E7    call        TStream.GetPosition
 0002E1EC    sub         eax,4
 0002E1EF    mov         dword ptr [esp],eax
 0002E1F2    cmp         byte ptr [esi+1C],0
>0002E1F6    je          0002E203
 0002E1F8    mov         edx,ebx
 0002E1FA    mov         eax,esi
 0002E1FC    call        TMetafile.WriteEMFStream
>0002E201    jmp         0002E20C
 0002E203    mov         edx,ebx
 0002E205    mov         eax,esi
 0002E207    call        TMetafile.WriteWMFStream
 0002E20C    xor         ecx,ecx
 0002E20E    mov         edx,dword ptr [esp]
 0002E211    mov         eax,ebx
 0002E213    mov         esi,dword ptr [eax]
 0002E215    call        dword ptr [esi+0C]
 0002E218    mov         eax,ebx
 0002E21A    call        TStream.GetSize
 0002E21F    sub         eax,dword ptr [esp]
 0002E222    mov         dword ptr [esp],eax
 0002E225    mov         edx,esp
 0002E227    mov         ecx,4
 0002E22C    mov         eax,ebx
 0002E22E    mov         esi,dword ptr [eax]
 0002E230    call        dword ptr [esi+8]
 0002E233    mov         cx,2
 0002E237    xor         edx,edx
 0002E239    mov         eax,ebx
 0002E23B    mov         ebx,dword ptr [eax]
 0002E23D    call        dword ptr [ebx+0C]
 0002E240    pop         edx
 0002E241    pop         edi
 0002E242    pop         esi
 0002E243    pop         ebx
 0002E244    ret
*}
end;

//0002E248
procedure TMetafile.WriteEMFStream(Stream:TStream);
begin
{*
 0002E248    push        ebp
 0002E249    mov         ebp,esp
 0002E24B    add         esp,0FFFFFFF8
 0002E24E    push        ebx
 0002E24F    push        esi
 0002E250    mov         esi,edx
 0002E252    mov         ebx,eax
 0002E254    mov         eax,dword ptr [ebx+18]
 0002E257    test        eax,eax
>0002E259    je          0002E2C5
 0002E25B    push        0
 0002E25D    push        0
 0002E25F    mov         eax,dword ptr [eax+8]
 0002E262    push        eax
 0002E263    call        gdi32.GetEnhMetaFileBits
 0002E268    mov         dword ptr [ebp-8],eax
 0002E26B    mov         eax,dword ptr [ebp-8]
 0002E26E    call        @GetMem
 0002E273    mov         dword ptr [ebp-4],eax
 0002E276    xor         eax,eax
 0002E278    push        ebp
 0002E279    push        2E2BE
 0002E27E    push        dword ptr fs:[eax]
 0002E281    mov         dword ptr fs:[eax],esp
 0002E284    mov         eax,dword ptr [ebp-4]
 0002E287    push        eax
 0002E288    mov         eax,dword ptr [ebp-8]
 0002E28B    push        eax
 0002E28C    mov         eax,dword ptr [ebx+18]
 0002E28F    mov         eax,dword ptr [eax+8]
 0002E292    push        eax
 0002E293    call        gdi32.GetEnhMetaFileBits
 0002E298    mov         edx,dword ptr [ebp-4]
 0002E29B    mov         ecx,dword ptr [ebp-8]
 0002E29E    mov         eax,esi
 0002E2A0    call        TStream.WriteBuffer
 0002E2A5    xor         eax,eax
 0002E2A7    pop         edx
 0002E2A8    pop         ecx
 0002E2A9    pop         ecx
 0002E2AA    mov         dword ptr fs:[eax],edx
 0002E2AD    push        2E2C5
 0002E2B2    mov         edx,dword ptr [ebp-8]
 0002E2B5    mov         eax,dword ptr [ebp-4]
 0002E2B8    call        @FreeMem
 0002E2BD    ret
>0002E2BE    jmp         @HandleFinally
>0002E2C3    jmp         0002E2B2
 0002E2C5    pop         esi
 0002E2C6    pop         ebx
 0002E2C7    pop         ecx
 0002E2C8    pop         ecx
 0002E2C9    pop         ebp
 0002E2CA    ret
*}
end;

//0002E2CC
procedure TMetafile.WriteWMFStream(Stream:TStream);
begin
{*
 0002E2CC    push        ebp
 0002E2CD    mov         ebp,esp
 0002E2CF    add         esp,0FFFFFFDC
 0002E2D2    push        ebx
 0002E2D3    push        esi
 0002E2D4    mov         esi,edx
 0002E2D6    mov         ebx,eax
 0002E2D8    cmp         dword ptr [ebx+18],0
>0002E2DC    je          0002E40E
 0002E2E2    lea         eax,[ebp-22]
 0002E2E5    xor         ecx,ecx
 0002E2E7    mov         edx,16
 0002E2EC    call        @FillChar
 0002E2F1    mov         ebx,dword ptr [ebx+18]
 0002E2F4    mov         dword ptr [ebp-22],9AC6CDD7
 0002E2FB    mov         ax,word ptr [ebx+18]
 0002E2FF    test        ax,ax
>0002E302    jne         0002E30C
 0002E304    mov         word ptr [ebp-14],60
>0002E30A    jmp         0002E310
 0002E30C    mov         word ptr [ebp-14],ax
 0002E310    push        9EC
 0002E315    movzx       eax,word ptr [ebp-14]
 0002E319    push        eax
 0002E31A    mov         eax,dword ptr [ebx+0C]
 0002E31D    push        eax
 0002E31E    call        kernel32.MulDiv
 0002E323    mov         word ptr [ebp-18],ax
 0002E327    push        9EC
 0002E32C    movzx       eax,word ptr [ebp-14]
 0002E330    push        eax
 0002E331    mov         eax,dword ptr [ebx+10]
 0002E334    push        eax
 0002E335    call        kernel32.MulDiv
 0002E33A    mov         word ptr [ebp-16],ax
 0002E33E    lea         eax,[ebp-22]
 0002E341    call        ComputeAldusChecksum
 0002E346    mov         word ptr [ebp-0E],ax
 0002E34A    push        0
 0002E34C    call        user32.GetDC
 0002E351    mov         dword ptr [ebp-0C],eax
 0002E354    xor         eax,eax
 0002E356    push        ebp
 0002E357    push        2E407
 0002E35C    push        dword ptr fs:[eax]
 0002E35F    mov         dword ptr fs:[eax],esp
 0002E362    mov         eax,dword ptr [ebp-0C]
 0002E365    push        eax
 0002E366    push        8
 0002E368    push        0
 0002E36A    push        0
 0002E36C    mov         eax,dword ptr [ebx+8]
 0002E36F    push        eax
 0002E370    call        gdi32.GetWinMetaFileBits
 0002E375    mov         dword ptr [ebp-8],eax
 0002E378    mov         eax,dword ptr [ebp-8]
 0002E37B    call        @GetMem
 0002E380    mov         dword ptr [ebp-4],eax
 0002E383    xor         eax,eax
 0002E385    push        ebp
 0002E386    push        2E3E7
 0002E38B    push        dword ptr fs:[eax]
 0002E38E    mov         dword ptr fs:[eax],esp
 0002E391    mov         eax,dword ptr [ebp-0C]
 0002E394    push        eax
 0002E395    push        8
 0002E397    mov         eax,dword ptr [ebp-4]
 0002E39A    push        eax
 0002E39B    mov         eax,dword ptr [ebp-8]
 0002E39E    push        eax
 0002E39F    mov         eax,dword ptr [ebx+8]
 0002E3A2    push        eax
 0002E3A3    call        gdi32.GetWinMetaFileBits
 0002E3A8    cmp         eax,dword ptr [ebp-8]
>0002E3AB    jae         0002E3B2
 0002E3AD    call        GDIError
 0002E3B2    lea         edx,[ebp-22]
 0002E3B5    mov         ecx,16
 0002E3BA    mov         eax,esi
 0002E3BC    call        TStream.WriteBuffer
 0002E3C1    mov         edx,dword ptr [ebp-4]
 0002E3C4    mov         ecx,dword ptr [ebp-8]
 0002E3C7    mov         eax,esi
 0002E3C9    call        TStream.WriteBuffer
 0002E3CE    xor         eax,eax
 0002E3D0    pop         edx
 0002E3D1    pop         ecx
 0002E3D2    pop         ecx
 0002E3D3    mov         dword ptr fs:[eax],edx
 0002E3D6    push        2E3EE
 0002E3DB    mov         edx,dword ptr [ebp-8]
 0002E3DE    mov         eax,dword ptr [ebp-4]
 0002E3E1    call        @FreeMem
 0002E3E6    ret
>0002E3E7    jmp         @HandleFinally
>0002E3EC    jmp         0002E3DB
 0002E3EE    xor         eax,eax
 0002E3F0    pop         edx
 0002E3F1    pop         ecx
 0002E3F2    pop         ecx
 0002E3F3    mov         dword ptr fs:[eax],edx
 0002E3F6    push        2E40E
 0002E3FB    mov         eax,dword ptr [ebp-0C]
 0002E3FE    push        eax
 0002E3FF    push        0
 0002E401    call        user32.ReleaseDC
 0002E406    ret
>0002E407    jmp         @HandleFinally
>0002E40C    jmp         0002E3FB
 0002E40E    pop         esi
 0002E40F    pop         ebx
 0002E410    mov         esp,ebp
 0002E412    pop         ebp
 0002E413    ret
*}
end;

//0002E414
procedure TMetafile.LoadFromClipboardFormat(AFormat:Word; AData:THandle; APalette:HPALETTE);
begin
{*
 0002E414    push        ebp
 0002E415    mov         ebp,esp
 0002E417    add         esp,0FFFFFF98
 0002E41A    push        ebx
 0002E41B    push        esi
 0002E41C    push        edi
 0002E41D    xor         ebx,ebx
 0002E41F    mov         dword ptr [ebp-68],ebx
 0002E422    mov         ebx,eax
 0002E424    xor         eax,eax
 0002E426    push        ebp
 0002E427    push        2E4C2
 0002E42C    push        dword ptr fs:[eax]
 0002E42F    mov         dword ptr fs:[eax],esp
 0002E432    push        0E
 0002E434    call        user32.GetClipboardData
 0002E439    mov         edi,eax
 0002E43B    test        edi,edi
>0002E43D    jne         0002E454
 0002E43F    lea         edx,[ebp-68]
 0002E442    mov         eax,[000B5A14];^SUnknownClipboardFormat:TResStringRec
 0002E447    call        LoadResString
 0002E44C    mov         eax,dword ptr [ebp-68]
 0002E44F    call        InvalidGraphic
 0002E454    mov         eax,ebx
 0002E456    call        TMetafile.NewImage
 0002E45B    mov         esi,dword ptr [ebx+18]
 0002E45E    push        0
 0002E460    push        edi
 0002E461    call        gdi32.CopyEnhMetaFileA
 0002E466    mov         dword ptr [esi+8],eax
 0002E469    lea         eax,[ebp-64]
 0002E46C    push        eax
 0002E46D    push        64
 0002E46F    mov         eax,dword ptr [esi+8]
 0002E472    push        eax
 0002E473    call        gdi32.GetEnhMetaFileHeader
 0002E478    mov         eax,dword ptr [ebp-44]
 0002E47B    sub         eax,dword ptr [ebp-4C]
 0002E47E    mov         dword ptr [esi+0C],eax
 0002E481    mov         eax,dword ptr [ebp-40]
 0002E484    sub         eax,dword ptr [ebp-48]
 0002E487    mov         dword ptr [esi+10],eax
 0002E48A    mov         word ptr [esi+18],0
 0002E490    mov         byte ptr [ebx+1C],1
 0002E494    mov         eax,ebx
 0002E496    mov         edx,dword ptr [eax]
 0002E498    call        dword ptr [edx+24]
 0002E49B    test        eax,eax
 0002E49D    setne       al
 0002E4A0    mov         byte ptr [ebx+16],al
 0002E4A3    mov         edx,ebx
 0002E4A5    mov         eax,ebx
 0002E4A7    mov         ecx,dword ptr [eax]
 0002E4A9    call        dword ptr [ecx+10]
 0002E4AC    xor         eax,eax
 0002E4AE    pop         edx
 0002E4AF    pop         ecx
 0002E4B0    pop         ecx
 0002E4B1    mov         dword ptr fs:[eax],edx
 0002E4B4    push        2E4C9
 0002E4B9    lea         eax,[ebp-68]
 0002E4BC    call        @LStrClr
 0002E4C1    ret
>0002E4C2    jmp         @HandleFinally
>0002E4C7    jmp         0002E4B9
 0002E4C9    pop         edi
 0002E4CA    pop         esi
 0002E4CB    pop         ebx
 0002E4CC    mov         esp,ebp
 0002E4CE    pop         ebp
 0002E4CF    ret         4
*}
end;

//0002E4D4
procedure TMetafile.SaveToClipboardFormat(var AFormat:Word; var AData:THandle; var APalette:HPALETTE);
begin
{*
 0002E4D4    push        ebp
 0002E4D5    mov         ebp,esp
 0002E4D7    push        ebx
 0002E4D8    push        esi
 0002E4D9    push        edi
 0002E4DA    mov         edi,ecx
 0002E4DC    mov         ebx,eax
 0002E4DE    mov         esi,dword ptr [ebx+18]
 0002E4E1    test        esi,esi
>0002E4E3    je          0002E4FE
 0002E4E5    mov         word ptr [edx],0E
 0002E4EA    mov         eax,dword ptr [ebp+8]
 0002E4ED    xor         edx,edx
 0002E4EF    mov         dword ptr [eax],edx
 0002E4F1    push        0
 0002E4F3    mov         eax,dword ptr [esi+8]
 0002E4F6    push        eax
 0002E4F7    call        gdi32.CopyEnhMetaFileA
 0002E4FC    mov         dword ptr [edi],eax
 0002E4FE    pop         edi
 0002E4FF    pop         esi
 0002E500    pop         ebx
 0002E501    pop         ebp
 0002E502    ret         4
*}
end;

//0002E5A4
procedure FreeMemoryContexts;
begin
{*
 0002E5A4    push        ebp
 0002E5A5    mov         ebp,esp
 0002E5A7    add         esp,0FFFFFFF4
 0002E5AA    mov         eax,[000B4620]
 0002E5AF    call        TThreadList.LockList
 0002E5B4    mov         dword ptr [ebp-8],eax
 0002E5B7    xor         eax,eax
 0002E5B9    push        ebp
 0002E5BA    push        2E642
 0002E5BF    push        dword ptr fs:[eax]
 0002E5C2    mov         dword ptr fs:[eax],esp
 0002E5C5    mov         eax,dword ptr [ebp-8]
 0002E5C8    mov         eax,dword ptr [eax+8]
 0002E5CB    dec         eax
 0002E5CC    cmp         eax,0
>0002E5CF    jl          0002E62A
 0002E5D1    mov         dword ptr [ebp-4],eax
 0002E5D4    mov         edx,dword ptr [ebp-4]
 0002E5D7    mov         eax,dword ptr [ebp-8]
 0002E5DA    call        TList.Get
 0002E5DF    mov         dword ptr [ebp-0C],eax
 0002E5E2    mov         eax,dword ptr [ebp-0C]
 0002E5E5    call        TCanvas.TryLock
 0002E5EA    test        al,al
>0002E5EC    je          0002E621
 0002E5EE    xor         eax,eax
 0002E5F0    push        ebp
 0002E5F1    push        2E61A
 0002E5F6    push        dword ptr fs:[eax]
 0002E5F9    mov         dword ptr fs:[eax],esp
 0002E5FC    mov         eax,dword ptr [ebp-0C]
 0002E5FF    call        TBitmapCanvas.FreeContext
 0002E604    xor         eax,eax
 0002E606    pop         edx
 0002E607    pop         ecx
 0002E608    pop         ecx
 0002E609    mov         dword ptr fs:[eax],edx
 0002E60C    push        2E621
 0002E611    mov         eax,dword ptr [ebp-0C]
 0002E614    call        TCanvas.Unlock
 0002E619    ret
>0002E61A    jmp         @HandleFinally
>0002E61F    jmp         0002E611
 0002E621    dec         dword ptr [ebp-4]
 0002E624    cmp         dword ptr [ebp-4],0FFFFFFFF
>0002E628    jne         0002E5D4
 0002E62A    xor         eax,eax
 0002E62C    pop         edx
 0002E62D    pop         ecx
 0002E62E    pop         ecx
 0002E62F    mov         dword ptr fs:[eax],edx
 0002E632    push        2E649
 0002E637    mov         eax,[000B4620]
 0002E63C    call        TThreadList.UnlockList
 0002E641    ret
>0002E642    jmp         @HandleFinally
>0002E647    jmp         0002E637
 0002E649    mov         esp,ebp
 0002E64B    pop         ebp
 0002E64C    ret
*}
end;

//0002E650
procedure DeselectBitmap(AHandle:HBITMAP);
begin
{*
 0002E650    push        ebp
 0002E651    mov         ebp,esp
 0002E653    push        ecx
 0002E654    push        ebx
 0002E655    push        esi
 0002E656    mov         dword ptr [ebp-4],eax
 0002E659    cmp         dword ptr [ebp-4],0
>0002E65D    je          0002E6C7
 0002E65F    mov         eax,[000B4620]
 0002E664    call        TThreadList.LockList
 0002E669    mov         esi,eax
 0002E66B    xor         ecx,ecx
 0002E66D    push        ebp
 0002E66E    push        2E6C0
 0002E673    push        dword ptr fs:[ecx]
 0002E676    mov         dword ptr fs:[ecx],esp
 0002E679    mov         ebx,dword ptr [esi+8]
 0002E67C    dec         ebx
 0002E67D    cmp         ebx,0
>0002E680    jl          0002E6A8
 0002E682    mov         edx,ebx
 0002E684    mov         eax,esi
 0002E686    call        TList.Get
 0002E68B    mov         edx,dword ptr [eax+54]
 0002E68E    test        edx,edx
>0002E690    je          0002E6A2
 0002E692    mov         edx,dword ptr [edx+18]
 0002E695    mov         edx,dword ptr [edx+8]
 0002E698    cmp         edx,dword ptr [ebp-4]
>0002E69B    jne         0002E6A2
 0002E69D    call        TBitmapCanvas.FreeContext
 0002E6A2    dec         ebx
 0002E6A3    cmp         ebx,0FFFFFFFF
>0002E6A6    jne         0002E682
 0002E6A8    xor         eax,eax
 0002E6AA    pop         edx
 0002E6AB    pop         ecx
 0002E6AC    pop         ecx
 0002E6AD    mov         dword ptr fs:[eax],edx
 0002E6B0    push        2E6C7
 0002E6B5    mov         eax,[000B4620]
 0002E6BA    call        TThreadList.UnlockList
 0002E6BF    ret
>0002E6C0    jmp         @HandleFinally
>0002E6C5    jmp         0002E6B5
 0002E6C7    pop         esi
 0002E6C8    pop         ebx
 0002E6C9    pop         ecx
 0002E6CA    pop         ebp
 0002E6CB    ret
*}
end;

//0002E6CC
constructor TBitmapCanvas.Create(ABitmap:TBitmap);
begin
{*
 0002E6CC    push        ebx
 0002E6CD    push        esi
 0002E6CE    push        edi
 0002E6CF    test        dl,dl
>0002E6D1    je          0002E6DB
 0002E6D3    add         esp,0FFFFFFF0
 0002E6D6    call        @ClassCreate
 0002E6DB    mov         esi,ecx
 0002E6DD    mov         ebx,edx
 0002E6DF    mov         edi,eax
 0002E6E1    xor         edx,edx
 0002E6E3    mov         eax,edi
 0002E6E5    call        TCanvas.Create
 0002E6EA    mov         dword ptr [edi+54],esi
 0002E6ED    mov         eax,edi
 0002E6EF    test        bl,bl
>0002E6F1    je          0002E702
 0002E6F3    call        @AfterConstruction
 0002E6F8    pop         dword ptr fs:[0]
 0002E6FF    add         esp,0C
 0002E702    mov         eax,edi
 0002E704    pop         edi
 0002E705    pop         esi
 0002E706    pop         ebx
 0002E707    ret
*}
end;

//0002E708
destructor TBitmapCanvas.Destroy;
begin
{*
 0002E708    push        ebx
 0002E709    push        esi
 0002E70A    call        @BeforeDestruction
 0002E70F    mov         ebx,edx
 0002E711    mov         esi,eax
 0002E713    mov         eax,esi
 0002E715    call        TBitmapCanvas.FreeContext
 0002E71A    mov         edx,ebx
 0002E71C    and         dl,0FC
 0002E71F    mov         eax,esi
 0002E721    call        TCanvas.Destroy
 0002E726    test        bl,bl
>0002E728    jle         0002E731
 0002E72A    mov         eax,esi
 0002E72C    call        @ClassDestroy
 0002E731    pop         esi
 0002E732    pop         ebx
 0002E733    ret
*}
end;

//0002E734
procedure TBitmapCanvas.FreeContext;
begin
{*
 0002E734    push        ebp
 0002E735    mov         ebp,esp
 0002E737    push        ecx
 0002E738    push        ebx
 0002E739    mov         dword ptr [ebp-4],eax
 0002E73C    mov         eax,dword ptr [ebp-4]
 0002E73F    cmp         dword ptr [eax+4],0
>0002E743    je          0002E7CF
 0002E749    mov         eax,dword ptr [ebp-4]
 0002E74C    call        TCanvas.Lock
 0002E751    xor         edx,edx
 0002E753    push        ebp
 0002E754    push        2E7C8
 0002E759    push        dword ptr fs:[edx]
 0002E75C    mov         dword ptr fs:[edx],esp
 0002E75F    mov         eax,dword ptr [ebp-4]
 0002E762    mov         eax,dword ptr [eax+58]
 0002E765    test        eax,eax
>0002E767    je          0002E776
 0002E769    push        eax
 0002E76A    mov         eax,dword ptr [ebp-4]
 0002E76D    mov         eax,dword ptr [eax+4]
 0002E770    push        eax
 0002E771    call        gdi32.SelectObject
 0002E776    mov         eax,dword ptr [ebp-4]
 0002E779    mov         eax,dword ptr [eax+5C]
 0002E77C    test        eax,eax
>0002E77E    je          0002E78F
 0002E780    push        0FF
 0002E782    push        eax
 0002E783    mov         eax,dword ptr [ebp-4]
 0002E786    mov         eax,dword ptr [eax+4]
 0002E789    push        eax
 0002E78A    call        gdi32.SelectPalette
 0002E78F    mov         eax,dword ptr [ebp-4]
 0002E792    mov         ebx,dword ptr [eax+4]
 0002E795    xor         edx,edx
 0002E797    mov         eax,dword ptr [ebp-4]
 0002E79A    call        TCanvas.SetHandle
 0002E79F    push        ebx
 0002E7A0    call        gdi32.DeleteDC
 0002E7A5    mov         edx,dword ptr [ebp-4]
 0002E7A8    mov         eax,[000B4620]
 0002E7AD    call        TThreadList.Remove
 0002E7B2    xor         eax,eax
 0002E7B4    pop         edx
 0002E7B5    pop         ecx
 0002E7B6    pop         ecx
 0002E7B7    mov         dword ptr fs:[eax],edx
 0002E7BA    push        2E7CF
 0002E7BF    mov         eax,dword ptr [ebp-4]
 0002E7C2    call        TCanvas.Unlock
 0002E7C7    ret
>0002E7C8    jmp         @HandleFinally
>0002E7CD    jmp         0002E7BF
 0002E7CF    pop         ebx
 0002E7D0    pop         ecx
 0002E7D1    pop         ebp
 0002E7D2    ret
*}
end;

//0002E7D4
procedure TBitmapCanvas.CreateHandle;
begin
{*
 0002E7D4    push        ebp
 0002E7D5    mov         ebp,esp
 0002E7D7    push        ecx
 0002E7D8    push        ebx
 0002E7D9    push        esi
 0002E7DA    mov         dword ptr [ebp-4],eax
 0002E7DD    mov         eax,dword ptr [ebp-4]
 0002E7E0    cmp         dword ptr [eax+54],0
>0002E7E4    je          0002E8BA
 0002E7EA    mov         eax,dword ptr [ebp-4]
 0002E7ED    call        TCanvas.Lock
 0002E7F2    xor         eax,eax
 0002E7F4    push        ebp
 0002E7F5    push        2E8B3
 0002E7FA    push        dword ptr fs:[eax]
 0002E7FD    mov         dword ptr fs:[eax],esp
 0002E800    mov         eax,dword ptr [ebp-4]
 0002E803    mov         eax,dword ptr [eax+54]
 0002E806    call        TBitmap.HandleNeeded
 0002E80B    mov         eax,dword ptr [ebp-4]
 0002E80E    mov         eax,dword ptr [eax+54]
 0002E811    mov         eax,dword ptr [eax+18]
 0002E814    mov         eax,dword ptr [eax+8]
 0002E817    call        DeselectBitmap
 0002E81C    mov         eax,dword ptr [ebp-4]
 0002E81F    mov         eax,dword ptr [eax+54]
 0002E822    call        TBitmap.PaletteNeeded
 0002E827    push        0
 0002E829    call        gdi32.CreateCompatibleDC
 0002E82E    mov         ebx,eax
 0002E830    mov         eax,dword ptr [ebp-4]
 0002E833    mov         eax,dword ptr [eax+54]
 0002E836    mov         eax,dword ptr [eax+18]
 0002E839    mov         esi,dword ptr [eax+8]
 0002E83C    test        esi,esi
>0002E83E    je          0002E84F
 0002E840    push        esi
 0002E841    push        ebx
 0002E842    call        gdi32.SelectObject
 0002E847    mov         edx,dword ptr [ebp-4]
 0002E84A    mov         dword ptr [edx+58],eax
>0002E84D    jmp         0002E857
 0002E84F    mov         eax,dword ptr [ebp-4]
 0002E852    xor         edx,edx
 0002E854    mov         dword ptr [eax+58],edx
 0002E857    mov         eax,dword ptr [ebp-4]
 0002E85A    mov         eax,dword ptr [eax+54]
 0002E85D    mov         eax,dword ptr [eax+18]
 0002E860    mov         esi,dword ptr [eax+10]
 0002E863    test        esi,esi
>0002E865    je          0002E87E
 0002E867    push        0FF
 0002E869    push        esi
 0002E86A    push        ebx
 0002E86B    call        gdi32.SelectPalette
 0002E870    mov         edx,dword ptr [ebp-4]
 0002E873    mov         dword ptr [edx+5C],eax
 0002E876    push        ebx
 0002E877    call        gdi32.RealizePalette
>0002E87C    jmp         0002E886
 0002E87E    mov         eax,dword ptr [ebp-4]
 0002E881    xor         edx,edx
 0002E883    mov         dword ptr [eax+5C],edx
 0002E886    mov         edx,ebx
 0002E888    mov         eax,dword ptr [ebp-4]
 0002E88B    call        TCanvas.SetHandle
 0002E890    mov         edx,dword ptr [ebp-4]
 0002E893    mov         eax,[000B4620]
 0002E898    call        TThreadList.Add
 0002E89D    xor         eax,eax
 0002E89F    pop         edx
 0002E8A0    pop         ecx
 0002E8A1    pop         ecx
 0002E8A2    mov         dword ptr fs:[eax],edx
 0002E8A5    push        2E8BA
 0002E8AA    mov         eax,dword ptr [ebp-4]
 0002E8AD    call        TCanvas.Unlock
 0002E8B2    ret
>0002E8B3    jmp         @HandleFinally
>0002E8B8    jmp         0002E8AA
 0002E8BA    pop         esi
 0002E8BB    pop         ebx
 0002E8BC    pop         ecx
 0002E8BD    pop         ebp
 0002E8BE    ret
*}
end;

//0002E8C0
procedure TSharedImage.Reference;
begin
{*
 0002E8C0    inc         dword ptr [eax+4]
 0002E8C3    ret
*}
end;

//0002E8C4
procedure TSharedImage.Release;
begin
{*
 0002E8C4    push        ebx
 0002E8C5    mov         ebx,eax
 0002E8C7    test        ebx,ebx
>0002E8C9    je          0002E8E1
 0002E8CB    dec         dword ptr [ebx+4]
 0002E8CE    cmp         dword ptr [ebx+4],0
>0002E8D2    jne         0002E8E1
 0002E8D4    mov         eax,ebx
 0002E8D6    mov         edx,dword ptr [eax]
 0002E8D8    call        dword ptr [edx]
 0002E8DA    mov         eax,ebx
 0002E8DC    call        TObject.Free
 0002E8E1    pop         ebx
 0002E8E2    ret
*}
end;

//0002E8E4
destructor TBitmapImage.Destroy;
begin
{*
 0002E8E4    push        ebx
 0002E8E5    push        esi
 0002E8E6    call        @BeforeDestruction
 0002E8EB    mov         ebx,edx
 0002E8ED    mov         esi,eax
 0002E8EF    mov         eax,dword ptr [esi+14]
 0002E8F2    test        eax,eax
>0002E8F4    je          0002E909
 0002E8F6    call        DeselectBitmap
 0002E8FB    mov         eax,dword ptr [esi+14]
 0002E8FE    push        eax
 0002E8FF    call        gdi32.DeleteObject
 0002E904    xor         eax,eax
 0002E906    mov         dword ptr [esi+14],eax
 0002E909    mov         eax,esi
 0002E90B    mov         edx,dword ptr [eax]
 0002E90D    call        dword ptr [edx]
 0002E90F    mov         eax,dword ptr [esi+64]
 0002E912    test        eax,eax
>0002E914    je          0002E91C
 0002E916    push        eax
 0002E917    call        kernel32.CloseHandle
 0002E91C    mov         edx,ebx
 0002E91E    and         dl,0FC
 0002E921    mov         eax,esi
 0002E923    call        TObject.Destroy
 0002E928    test        bl,bl
>0002E92A    jle         0002E933
 0002E92C    mov         eax,esi
 0002E92E    call        @ClassDestroy
 0002E933    pop         esi
 0002E934    pop         ebx
 0002E935    ret
*}
end;

//0002E938
procedure TBitmapImage.FreeHandle;
begin
{*
 0002E938    push        ebx
 0002E939    mov         ebx,eax
 0002E93B    mov         eax,dword ptr [ebx+8]
 0002E93E    test        eax,eax
>0002E940    je          0002E955
 0002E942    cmp         eax,dword ptr [ebx+14]
>0002E945    je          0002E955
 0002E947    call        DeselectBitmap
 0002E94C    mov         eax,dword ptr [ebx+8]
 0002E94F    push        eax
 0002E950    call        gdi32.DeleteObject
 0002E955    mov         eax,dword ptr [ebx+0C]
 0002E958    test        eax,eax
>0002E95A    je          0002E96F
 0002E95C    call        DeselectBitmap
 0002E961    mov         eax,dword ptr [ebx+0C]
 0002E964    push        eax
 0002E965    call        gdi32.DeleteObject
 0002E96A    xor         eax,eax
 0002E96C    mov         dword ptr [ebx+0C],eax
 0002E96F    mov         eax,dword ptr [ebx+10]
 0002E972    call        InternalDeletePalette
 0002E977    xor         eax,eax
 0002E979    mov         dword ptr [ebx+8],eax
 0002E97C    xor         eax,eax
 0002E97E    mov         dword ptr [ebx+10],eax
 0002E981    pop         ebx
 0002E982    ret
*}
end;

//0002E984
procedure UpdateDIBColorTable(DIBHandle:HBITMAP; Pal:HPALETTE; const DIB:TDIBSection);
begin
{*
 0002E984    push        ebp
 0002E985    mov         ebp,esp
 0002E987    add         esp,0FFFFFBF0
 0002E98D    push        ebx
 0002E98E    push        esi
 0002E98F    mov         dword ptr [ebp-4],edx
 0002E992    mov         esi,eax
 0002E994    test        esi,esi
>0002E996    je          0002EA3A
 0002E99C    cmp         word ptr [ecx+26],8
>0002E9A1    ja          0002EA3A
 0002E9A7    lea         edx,[ebp-410]
 0002E9AD    mov         ecx,0FF
 0002E9B2    mov         eax,dword ptr [ebp-4]
 0002E9B5    call        PaletteToDIBColorTable
 0002E9BA    mov         ebx,eax
 0002E9BC    test        ebx,ebx
>0002E9BE    je          0002EA3A
 0002E9C0    push        0
 0002E9C2    call        user32.GetDC
 0002E9C7    mov         dword ptr [ebp-8],eax
 0002E9CA    mov         eax,dword ptr [ebp-8]
 0002E9CD    push        eax
 0002E9CE    call        gdi32.CreateCompatibleDC
 0002E9D3    mov         dword ptr [ebp-0C],eax
 0002E9D6    push        esi
 0002E9D7    mov         eax,dword ptr [ebp-0C]
 0002E9DA    push        eax
 0002E9DB    call        gdi32.SelectObject
 0002E9E0    mov         dword ptr [ebp-10],eax
 0002E9E3    xor         eax,eax
 0002E9E5    push        ebp
 0002E9E6    push        2EA33
 0002E9EB    push        dword ptr fs:[eax]
 0002E9EE    mov         dword ptr fs:[eax],esp
 0002E9F1    lea         eax,[ebp-410]
 0002E9F7    push        eax
 0002E9F8    push        ebx
 0002E9F9    push        0
 0002E9FB    mov         eax,dword ptr [ebp-0C]
 0002E9FE    push        eax
 0002E9FF    call        gdi32.SetDIBColorTable
 0002EA04    xor         eax,eax
 0002EA06    pop         edx
 0002EA07    pop         ecx
 0002EA08    pop         ecx
 0002EA09    mov         dword ptr fs:[eax],edx
 0002EA0C    push        2EA3A
 0002EA11    mov         eax,dword ptr [ebp-10]
 0002EA14    push        eax
 0002EA15    mov         eax,dword ptr [ebp-0C]
 0002EA18    push        eax
 0002EA19    call        gdi32.SelectObject
 0002EA1E    mov         eax,dword ptr [ebp-0C]
 0002EA21    push        eax
 0002EA22    call        gdi32.DeleteDC
 0002EA27    mov         eax,dword ptr [ebp-8]
 0002EA2A    push        eax
 0002EA2B    push        0
 0002EA2D    call        user32.ReleaseDC
 0002EA32    ret
>0002EA33    jmp         @HandleFinally
>0002EA38    jmp         0002EA11
 0002EA3A    pop         esi
 0002EA3B    pop         ebx
 0002EA3C    mov         esp,ebp
 0002EA3E    pop         ebp
 0002EA3F    ret
*}
end;

//0002EA40
procedure FixupBitFields(var DIB:TDIBSection);
begin
{*
 0002EA40    test        byte ptr [eax+28],3
>0002EA44    je          0002EA88
 0002EA46    cmp         dword ptr [eax+40],0
>0002EA4A    jne         0002EA88
 0002EA4C    mov         dx,word ptr [eax+26]
 0002EA50    cmp         dx,10
>0002EA54    jne         0002EA6D
 0002EA56    mov         dword ptr [eax+40],0F800
 0002EA5D    mov         dword ptr [eax+44],7E0
 0002EA64    mov         dword ptr [eax+48],1F
>0002EA6B    jmp         0002EA88
 0002EA6D    cmp         dx,20
>0002EA71    jne         0002EA88
 0002EA73    mov         dword ptr [eax+40],0FF0000
 0002EA7A    mov         dword ptr [eax+44],0FF00
 0002EA81    mov         dword ptr [eax+48],0FF
 0002EA88    ret
*}
end;

//0002EA8C
function CopyBitmap(Handle:HBITMAP; OldPalette:HPALETTE; NewPalette:HPALETTE; var DIB:TDIBSection; Canvas:TCanvas):HBITMAP;
begin
{*
 0002EA8C    push        ebp
 0002EA8D    mov         ebp,esp
 0002EA8F    add         esp,0FFFFFF68
 0002EA95    push        ebx
 0002EA96    push        esi
 0002EA97    push        edi
 0002EA98    mov         dword ptr [ebp-0C],ecx
 0002EA9B    mov         dword ptr [ebp-8],edx
 0002EA9E    mov         dword ptr [ebp-4],eax
 0002EAA1    xor         eax,eax
 0002EAA3    mov         dword ptr [ebp-10],eax
 0002EAA6    mov         eax,dword ptr [ebp+0C]
 0002EAA9    cmp         dword ptr [eax+18],0
>0002EAAD    je          0002EAC9
 0002EAAF    mov         eax,dword ptr [ebp+0C]
 0002EAB2    cmp         dword ptr [eax+1C],0
>0002EAB6    je          0002F0AE
 0002EABC    mov         eax,dword ptr [ebp+0C]
 0002EABF    cmp         dword ptr [eax+20],0
>0002EAC3    je          0002F0AE
 0002EAC9    mov         eax,dword ptr [ebp+0C]
 0002EACC    cmp         dword ptr [eax+18],0
>0002EAD0    jne         0002EAEC
 0002EAD2    mov         eax,dword ptr [ebp+0C]
 0002EAD5    cmp         dword ptr [eax+4],0
>0002EAD9    je          0002F0AE
 0002EADF    mov         eax,dword ptr [ebp+0C]
 0002EAE2    cmp         dword ptr [eax+8],0
>0002EAE6    je          0002F0AE
 0002EAEC    mov         eax,dword ptr [ebp-4]
 0002EAEF    call        DeselectBitmap
 0002EAF4    xor         eax,eax
 0002EAF6    mov         dword ptr [ebp-70],eax
 0002EAF9    cmp         dword ptr [ebp-4],0
>0002EAFD    je          0002EB1B
 0002EAFF    lea         eax,[ebp-88]
 0002EB05    push        eax
 0002EB06    push        54
 0002EB08    mov         eax,dword ptr [ebp-4]
 0002EB0B    push        eax
 0002EB0C    call        gdi32.GetObjectA
 0002EB11    cmp         eax,18
>0002EB14    jge         0002EB1B
 0002EB16    call        InvalidBitmap
 0002EB1B    push        0
 0002EB1D    call        user32.GetDC
 0002EB22    call        GDICheck
 0002EB27    mov         dword ptr [ebp-18],eax
 0002EB2A    mov         eax,dword ptr [ebp-18]
 0002EB2D    push        eax
 0002EB2E    call        gdi32.CreateCompatibleDC
 0002EB33    call        GDICheck
 0002EB38    mov         dword ptr [ebp-1C],eax
 0002EB3B    xor         edx,edx
 0002EB3D    push        ebp
 0002EB3E    push        2F0A7
 0002EB43    push        dword ptr fs:[edx]
 0002EB46    mov         dword ptr fs:[edx],esp
 0002EB49    mov         eax,dword ptr [ebp+0C]
 0002EB4C    cmp         dword ptr [eax+18],28
>0002EB50    jae         0002EBB0
 0002EB52    mov         eax,dword ptr [ebp+0C]
 0002EB55    mov         ax,word ptr [eax+10]
 0002EB59    mov         edx,dword ptr [ebp+0C]
 0002EB5C    or          ax,word ptr [edx+12]
 0002EB60    cmp         ax,1
>0002EB64    jne         0002EB8C
 0002EB66    push        0
 0002EB68    push        1
 0002EB6A    push        1
 0002EB6C    mov         eax,dword ptr [ebp+0C]
 0002EB6F    mov         eax,dword ptr [eax+8]
 0002EB72    push        eax
 0002EB73    mov         eax,dword ptr [ebp+0C]
 0002EB76    mov         eax,dword ptr [eax+4]
 0002EB79    push        eax
 0002EB7A    call        gdi32.CreateBitmap
 0002EB7F    call        GDICheck
 0002EB84    mov         dword ptr [ebp-10],eax
>0002EB87    jmp         0002EDB8
 0002EB8C    mov         eax,dword ptr [ebp+0C]
 0002EB8F    mov         eax,dword ptr [eax+8]
 0002EB92    push        eax
 0002EB93    mov         eax,dword ptr [ebp+0C]
 0002EB96    mov         eax,dword ptr [eax+4]
 0002EB99    push        eax
 0002EB9A    mov         eax,dword ptr [ebp-18]
 0002EB9D    push        eax
 0002EB9E    call        gdi32.CreateCompatibleBitmap
 0002EBA3    call        GDICheck
 0002EBA8    mov         dword ptr [ebp-10],eax
>0002EBAB    jmp         0002EDB8
 0002EBB0    mov         eax,42C
 0002EBB5    call        @GetMem
 0002EBBA    mov         dword ptr [ebp-24],eax
 0002EBBD    xor         edx,edx
 0002EBBF    push        ebp
 0002EBC0    push        2EDB1
 0002EBC5    push        dword ptr fs:[edx]
 0002EBC8    mov         dword ptr fs:[edx],esp
 0002EBCB    mov         eax,dword ptr [ebp+0C]
 0002EBCE    mov         dword ptr [eax+18],28
 0002EBD5    mov         eax,dword ptr [ebp+0C]
 0002EBD8    mov         word ptr [eax+24],1
 0002EBDE    mov         eax,dword ptr [ebp+0C]
 0002EBE1    mov         edx,dword ptr [ebp-24]
 0002EBE4    lea         esi,[eax+18]
 0002EBE7    mov         edi,edx
 0002EBE9    mov         ecx,0A
 0002EBEE    rep movs    dword ptr [edi],dword ptr [esi]
 0002EBF0    mov         eax,dword ptr [ebp+0C]
 0002EBF3    mov         eax,dword ptr [eax+1C]
 0002EBF6    mov         edx,dword ptr [ebp+0C]
 0002EBF9    mov         dword ptr [edx+4],eax
 0002EBFC    mov         eax,dword ptr [ebp+0C]
 0002EBFF    mov         eax,dword ptr [eax+20]
 0002EC02    mov         edx,dword ptr [ebp+0C]
 0002EC05    mov         dword ptr [edx+8],eax
 0002EC08    mov         eax,dword ptr [ebp+0C]
 0002EC0B    cmp         word ptr [eax+26],8
>0002EC10    ja          0002ECD7
 0002EC16    mov         eax,dword ptr [ebp+0C]
 0002EC19    cmp         word ptr [eax+26],1
>0002EC1E    jne         0002EC42
 0002EC20    cmp         dword ptr [ebp-74],0
>0002EC24    jne         0002EC42
 0002EC26    mov         eax,dword ptr [ebp-24]
 0002EC29    xor         edx,edx
 0002EC2B    mov         dword ptr [eax+28],edx
 0002EC2E    mov         eax,dword ptr [ebp-24]
 0002EC31    add         eax,28
 0002EC34    add         eax,4
 0002EC37    mov         dword ptr [eax],0FFFFFF
>0002EC3D    jmp         0002ED14
 0002EC42    cmp         dword ptr [ebp-0C],0
>0002EC46    je          0002EC60
 0002EC48    mov         eax,dword ptr [ebp-24]
 0002EC4B    lea         edx,[eax+28]
 0002EC4E    mov         ecx,0FF
 0002EC53    mov         eax,dword ptr [ebp-0C]
 0002EC56    call        PaletteToDIBColorTable
>0002EC5B    jmp         0002ED14
 0002EC60    cmp         dword ptr [ebp-4],0
>0002EC64    je          0002ED14
 0002EC6A    mov         eax,dword ptr [ebp-4]
 0002EC6D    push        eax
 0002EC6E    mov         eax,dword ptr [ebp-1C]
 0002EC71    push        eax
 0002EC72    call        gdi32.SelectObject
 0002EC77    mov         dword ptr [ebp-14],eax
 0002EC7A    cmp         dword ptr [ebp-70],0
>0002EC7E    jbe         0002ECA5
 0002EC80    cmp         dword ptr [ebp-74],0
>0002EC84    je          0002ECA5
 0002EC86    mov         eax,dword ptr [ebp-24]
 0002EC89    add         eax,28
 0002EC8C    push        eax
 0002EC8D    push        100
 0002EC92    push        0
 0002EC94    mov         eax,dword ptr [ebp-1C]
 0002EC97    push        eax
 0002EC98    call        gdi32.GetDIBColorTable
 0002EC9D    mov         edx,dword ptr [ebp+0C]
 0002ECA0    mov         dword ptr [edx+38],eax
>0002ECA3    jmp         0002ECC8
 0002ECA5    push        0
 0002ECA7    mov         eax,dword ptr [ebp-24]
 0002ECAA    push        eax
 0002ECAB    push        0
 0002ECAD    mov         eax,dword ptr [ebp+0C]
 0002ECB0    mov         eax,dword ptr [eax+20]
 0002ECB3    cdq
 0002ECB4    xor         eax,edx
 0002ECB6    sub         eax,edx
 0002ECB8    push        eax
 0002ECB9    push        0
 0002ECBB    mov         eax,dword ptr [ebp-4]
 0002ECBE    push        eax
 0002ECBF    mov         eax,dword ptr [ebp-1C]
 0002ECC2    push        eax
 0002ECC3    call        gdi32.GetDIBits
 0002ECC8    mov         eax,dword ptr [ebp-14]
 0002ECCB    push        eax
 0002ECCC    mov         eax,dword ptr [ebp-1C]
 0002ECCF    push        eax
 0002ECD0    call        gdi32.SelectObject
>0002ECD5    jmp         0002ED14
 0002ECD7    mov         eax,dword ptr [ebp+0C]
 0002ECDA    mov         ax,word ptr [eax+26]
 0002ECDE    cmp         ax,10
>0002ECE2    je          0002ECED
 0002ECE4    mov         edx,dword ptr [ebp+0C]
 0002ECE7    cmp         ax,20
>0002ECEB    jne         0002ED14
 0002ECED    mov         eax,dword ptr [ebp+0C]
 0002ECF0    test        byte ptr [eax+28],3
>0002ECF4    je          0002ED14
 0002ECF6    mov         eax,dword ptr [ebp+0C]
 0002ECF9    call        FixupBitFields
 0002ECFE    mov         eax,dword ptr [ebp-24]
 0002ED01    lea         edx,[eax+28]
 0002ED04    mov         eax,dword ptr [ebp+0C]
 0002ED07    add         eax,40
 0002ED0A    mov         ecx,0C
 0002ED0F    call        Move
 0002ED14    push        0
 0002ED16    push        0
 0002ED18    lea         eax,[ebp-28]
 0002ED1B    push        eax
 0002ED1C    push        0
 0002ED1E    mov         eax,dword ptr [ebp-24]
 0002ED21    push        eax
 0002ED22    mov         eax,dword ptr [ebp-18]
 0002ED25    push        eax
 0002ED26    call        gdi32.CreateDIBSection
 0002ED2B    call        GDICheck
 0002ED30    mov         dword ptr [ebp-10],eax
 0002ED33    cmp         dword ptr [ebp-28],0
>0002ED37    jne         0002ED3E
 0002ED39    call        GDIError
 0002ED3E    cmp         dword ptr [ebp-4],0
>0002ED42    je          0002ED9B
 0002ED44    mov         eax,dword ptr [ebp+0C]
 0002ED47    mov         eax,dword ptr [eax+1C]
 0002ED4A    cmp         eax,dword ptr [ebp-84]
>0002ED50    jne         0002ED9B
 0002ED52    mov         eax,dword ptr [ebp+0C]
 0002ED55    mov         eax,dword ptr [eax+20]
 0002ED58    cmp         eax,dword ptr [ebp-80]
>0002ED5B    jne         0002ED9B
 0002ED5D    mov         eax,dword ptr [ebp+0C]
 0002ED60    cmp         word ptr [eax+26],8
>0002ED65    jbe         0002ED9B
 0002ED67    push        0
 0002ED69    mov         eax,dword ptr [ebp-24]
 0002ED6C    push        eax
 0002ED6D    mov         eax,dword ptr [ebp-28]
 0002ED70    push        eax
 0002ED71    mov         eax,dword ptr [ebp+0C]
 0002ED74    mov         eax,dword ptr [eax+20]
 0002ED77    cdq
 0002ED78    xor         eax,edx
 0002ED7A    sub         eax,edx
 0002ED7C    push        eax
 0002ED7D    push        0
 0002ED7F    mov         eax,dword ptr [ebp-4]
 0002ED82    push        eax
 0002ED83    mov         eax,dword ptr [ebp-1C]
 0002ED86    push        eax
 0002ED87    call        gdi32.GetDIBits
 0002ED8C    call        @TryFinallyExit
 0002ED91    call        @TryFinallyExit
>0002ED96    jmp         0002F0AE
 0002ED9B    xor         eax,eax
 0002ED9D    pop         edx
 0002ED9E    pop         ecx
 0002ED9F    pop         ecx
 0002EDA0    mov         dword ptr fs:[eax],edx
 0002EDA3    push        2EDB8
 0002EDA8    mov         eax,dword ptr [ebp-24]
 0002EDAB    call        @FreeMem
 0002EDB0    ret
>0002EDB1    jmp         @HandleFinally
>0002EDB6    jmp         0002EDA8
 0002EDB8    mov         eax,dword ptr [ebp-10]
 0002EDBB    call        GDICheck
 0002EDC0    mov         eax,dword ptr [ebp-10]
 0002EDC3    push        eax
 0002EDC4    mov         eax,dword ptr [ebp-1C]
 0002EDC7    push        eax
 0002EDC8    call        gdi32.SelectObject
 0002EDCD    call        GDICheck
 0002EDD2    mov         dword ptr [ebp-14],eax
 0002EDD5    xor         eax,eax
 0002EDD7    push        ebp
 0002EDD8    push        2F058
 0002EDDD    push        dword ptr fs:[eax]
 0002EDE0    mov         dword ptr fs:[eax],esp
 0002EDE3    xor         eax,eax
 0002EDE5    push        ebp
 0002EDE6    push        2F047
 0002EDEB    push        dword ptr fs:[eax]
 0002EDEE    mov         dword ptr fs:[eax],esp
 0002EDF1    xor         eax,eax
 0002EDF3    mov         dword ptr [ebp-34],eax
 0002EDF6    xor         ebx,ebx
 0002EDF8    cmp         dword ptr [ebp-0C],0
>0002EDFC    je          0002EE19
 0002EDFE    push        0
 0002EE00    mov         eax,dword ptr [ebp-0C]
 0002EE03    push        eax
 0002EE04    mov         eax,dword ptr [ebp-1C]
 0002EE07    push        eax
 0002EE08    call        gdi32.SelectPalette
 0002EE0D    mov         dword ptr [ebp-34],eax
 0002EE10    mov         eax,dword ptr [ebp-1C]
 0002EE13    push        eax
 0002EE14    call        gdi32.RealizePalette
 0002EE19    xor         eax,eax
 0002EE1B    push        ebp
 0002EE1C    push        2F025
 0002EE21    push        dword ptr fs:[eax]
 0002EE24    mov         dword ptr fs:[eax],esp
 0002EE27    cmp         dword ptr [ebp+8],0
>0002EE2B    je          0002EEE6
 0002EE31    mov         eax,dword ptr [ebp+8]
 0002EE34    mov         eax,dword ptr [eax+14]
 0002EE37    call        TBrush.GetHandle
 0002EE3C    push        eax
 0002EE3D    mov         eax,dword ptr [ebp+0C]
 0002EE40    mov         eax,dword ptr [eax+8]
 0002EE43    push        eax
 0002EE44    lea         eax,[ebp-98]
 0002EE4A    push        eax
 0002EE4B    mov         ecx,dword ptr [ebp+0C]
 0002EE4E    mov         ecx,dword ptr [ecx+4]
 0002EE51    xor         edx,edx
 0002EE53    xor         eax,eax
 0002EE55    call        Rect
 0002EE5A    lea         eax,[ebp-98]
 0002EE60    push        eax
 0002EE61    mov         eax,dword ptr [ebp-1C]
 0002EE64    push        eax
 0002EE65    call        user32.FillRect
 0002EE6A    mov         eax,dword ptr [ebp+8]
 0002EE6D    mov         eax,dword ptr [eax+0C]
 0002EE70    mov         eax,dword ptr [eax+14]
 0002EE73    call        ColorToRGB
 0002EE78    push        eax
 0002EE79    mov         eax,dword ptr [ebp-1C]
 0002EE7C    push        eax
 0002EE7D    call        gdi32.SetTextColor
 0002EE82    mov         eax,dword ptr [ebp+8]
 0002EE85    mov         eax,dword ptr [eax+14]
 0002EE88    call        TBrush.GetColor
 0002EE8D    call        ColorToRGB
 0002EE92    push        eax
 0002EE93    mov         eax,dword ptr [ebp-1C]
 0002EE96    push        eax
 0002EE97    call        gdi32.SetBkColor
 0002EE9C    mov         eax,dword ptr [ebp+0C]
 0002EE9F    cmp         word ptr [eax+26],1
>0002EEA4    jne         0002EF06
 0002EEA6    mov         eax,dword ptr [ebp+0C]
 0002EEA9    cmp         dword ptr [eax+14],0
>0002EEAD    je          0002EF06
 0002EEAF    mov         eax,dword ptr [ebp+8]
 0002EEB2    mov         eax,dword ptr [eax+0C]
 0002EEB5    mov         eax,dword ptr [eax+14]
 0002EEB8    call        ColorToRGB
 0002EEBD    mov         dword ptr [ebp-30],eax
 0002EEC0    mov         eax,dword ptr [ebp+8]
 0002EEC3    mov         eax,dword ptr [eax+14]
 0002EEC6    call        TBrush.GetColor
 0002EECB    call        ColorToRGB
 0002EED0    mov         dword ptr [ebp-2C],eax
 0002EED3    lea         eax,[ebp-30]
 0002EED6    push        eax
 0002EED7    push        2
 0002EED9    push        0
 0002EEDB    mov         eax,dword ptr [ebp-1C]
 0002EEDE    push        eax
 0002EEDF    call        gdi32.SetDIBColorTable
>0002EEE4    jmp         0002EF06
 0002EEE6    push        0FF0062
 0002EEEB    mov         eax,dword ptr [ebp+0C]
 0002EEEE    mov         eax,dword ptr [eax+8]
 0002EEF1    push        eax
 0002EEF2    mov         eax,dword ptr [ebp+0C]
 0002EEF5    mov         eax,dword ptr [eax+4]
 0002EEF8    push        eax
 0002EEF9    push        0
 0002EEFB    push        0
 0002EEFD    mov         eax,dword ptr [ebp-1C]
 0002EF00    push        eax
 0002EF01    call        gdi32.PatBlt
 0002EF06    cmp         dword ptr [ebp-4],0
>0002EF0A    je          0002F002
 0002EF10    mov         eax,dword ptr [ebp-18]
 0002EF13    push        eax
 0002EF14    call        gdi32.CreateCompatibleDC
 0002EF19    call        GDICheck
 0002EF1E    mov         dword ptr [ebp-20],eax
 0002EF21    xor         eax,eax
 0002EF23    push        ebp
 0002EF24    push        2EFFB
 0002EF29    push        dword ptr fs:[eax]
 0002EF2C    mov         dword ptr fs:[eax],esp
 0002EF2F    mov         eax,dword ptr [ebp-4]
 0002EF32    push        eax
 0002EF33    mov         eax,dword ptr [ebp-20]
 0002EF36    push        eax
 0002EF37    call        gdi32.SelectObject
 0002EF3C    call        GDICheck
 0002EF41    mov         esi,eax
 0002EF43    cmp         dword ptr [ebp-8],0
>0002EF47    je          0002EF63
 0002EF49    push        0
 0002EF4B    mov         eax,dword ptr [ebp-8]
 0002EF4E    push        eax
 0002EF4F    mov         eax,dword ptr [ebp-20]
 0002EF52    push        eax
 0002EF53    call        gdi32.SelectPalette
 0002EF58    mov         ebx,eax
 0002EF5A    mov         eax,dword ptr [ebp-20]
 0002EF5D    push        eax
 0002EF5E    call        gdi32.RealizePalette
 0002EF63    cmp         dword ptr [ebp+8],0
>0002EF67    je          0002EF9B
 0002EF69    mov         eax,dword ptr [ebp+8]
 0002EF6C    mov         eax,dword ptr [eax+0C]
 0002EF6F    mov         eax,dword ptr [eax+14]
 0002EF72    call        ColorToRGB
 0002EF77    push        eax
 0002EF78    mov         eax,dword ptr [ebp-20]
 0002EF7B    push        eax
 0002EF7C    call        gdi32.SetTextColor
 0002EF81    mov         eax,dword ptr [ebp+8]
 0002EF84    mov         eax,dword ptr [eax+14]
 0002EF87    call        TBrush.GetColor
 0002EF8C    call        ColorToRGB
 0002EF91    push        eax
 0002EF92    mov         eax,dword ptr [ebp-20]
 0002EF95    push        eax
 0002EF96    call        gdi32.SetBkColor
 0002EF9B    push        0CC0020
 0002EFA0    push        0
 0002EFA2    push        0
 0002EFA4    mov         eax,dword ptr [ebp-20]
 0002EFA7    push        eax
 0002EFA8    mov         eax,dword ptr [ebp+0C]
 0002EFAB    mov         eax,dword ptr [eax+8]
 0002EFAE    push        eax
 0002EFAF    mov         eax,dword ptr [ebp+0C]
 0002EFB2    mov         eax,dword ptr [eax+4]
 0002EFB5    push        eax
 0002EFB6    push        0
 0002EFB8    push        0
 0002EFBA    mov         eax,dword ptr [ebp-1C]
 0002EFBD    push        eax
 0002EFBE    call        gdi32.BitBlt
 0002EFC3    cmp         dword ptr [ebp-8],0
>0002EFC7    je          0002EFD5
 0002EFC9    push        0FF
 0002EFCB    push        ebx
 0002EFCC    mov         eax,dword ptr [ebp-20]
 0002EFCF    push        eax
 0002EFD0    call        gdi32.SelectPalette
 0002EFD5    push        esi
 0002EFD6    mov         eax,dword ptr [ebp-20]
 0002EFD9    push        eax
 0002EFDA    call        gdi32.SelectObject
 0002EFDF    call        GDICheck
 0002EFE4    xor         eax,eax
 0002EFE6    pop         edx
 0002EFE7    pop         ecx
 0002EFE8    pop         ecx
 0002EFE9    mov         dword ptr fs:[eax],edx
 0002EFEC    push        2F002
 0002EFF1    mov         eax,dword ptr [ebp-20]
 0002EFF4    push        eax
 0002EFF5    call        gdi32.DeleteDC
 0002EFFA    ret
>0002EFFB    jmp         @HandleFinally
>0002F000    jmp         0002EFF1
 0002F002    xor         eax,eax
 0002F004    pop         edx
 0002F005    pop         ecx
 0002F006    pop         ecx
 0002F007    mov         dword ptr fs:[eax],edx
 0002F00A    push        2F02C
 0002F00F    cmp         dword ptr [ebp-0C],0
>0002F013    je          0002F024
 0002F015    push        0FF
 0002F017    mov         eax,dword ptr [ebp-34]
 0002F01A    push        eax
 0002F01B    mov         eax,dword ptr [ebp-1C]
 0002F01E    push        eax
 0002F01F    call        gdi32.SelectPalette
 0002F024    ret
>0002F025    jmp         @HandleFinally
>0002F02A    jmp         0002F00F
 0002F02C    xor         eax,eax
 0002F02E    pop         edx
 0002F02F    pop         ecx
 0002F030    pop         ecx
 0002F031    mov         dword ptr fs:[eax],edx
 0002F034    push        2F04E
 0002F039    mov         eax,dword ptr [ebp-14]
 0002F03C    push        eax
 0002F03D    mov         eax,dword ptr [ebp-1C]
 0002F040    push        eax
 0002F041    call        gdi32.SelectObject
 0002F046    ret
>0002F047    jmp         @HandleFinally
>0002F04C    jmp         0002F039
 0002F04E    xor         eax,eax
 0002F050    pop         edx
 0002F051    pop         ecx
 0002F052    pop         ecx
 0002F053    mov         dword ptr fs:[eax],edx
>0002F056    jmp         0002F070
>0002F058    jmp         @HandleAnyException
 0002F05D    mov         eax,dword ptr [ebp-10]
 0002F060    push        eax
 0002F061    call        gdi32.DeleteObject
 0002F066    call        @RaiseAgain
 0002F06B    call        @DoneExcept
 0002F070    xor         eax,eax
 0002F072    pop         edx
 0002F073    pop         ecx
 0002F074    pop         ecx
 0002F075    mov         dword ptr fs:[eax],edx
 0002F078    push        2F0AE
 0002F07D    mov         eax,dword ptr [ebp-1C]
 0002F080    push        eax
 0002F081    call        gdi32.DeleteDC
 0002F086    mov         eax,dword ptr [ebp-18]
 0002F089    push        eax
 0002F08A    push        0
 0002F08C    call        user32.ReleaseDC
 0002F091    cmp         dword ptr [ebp-10],0
>0002F095    je          0002F0A6
 0002F097    mov         eax,dword ptr [ebp+0C]
 0002F09A    push        eax
 0002F09B    push        54
 0002F09D    mov         eax,dword ptr [ebp-10]
 0002F0A0    push        eax
 0002F0A1    call        gdi32.GetObjectA
 0002F0A6    ret
>0002F0A7    jmp         @HandleFinally
>0002F0AC    jmp         0002F07D
 0002F0AE    mov         eax,dword ptr [ebp-10]
 0002F0B1    pop         edi
 0002F0B2    pop         esi
 0002F0B3    pop         ebx
 0002F0B4    mov         esp,ebp
 0002F0B6    pop         ebp
 0002F0B7    ret         8
*}
end;

//0002F0BC
function CopyPalette(Palette:HPALETTE):HPALETTE;
begin
{*
 0002F0BC    push        ebx
 0002F0BD    push        esi
 0002F0BE    add         esp,0FFFFFBF8
 0002F0C4    mov         ebx,eax
 0002F0C6    xor         esi,esi
 0002F0C8    test        ebx,ebx
>0002F0CA    je          0002F112
 0002F0CC    xor         eax,eax
 0002F0CE    mov         dword ptr [esp],eax
 0002F0D1    push        esp
 0002F0D2    push        4
 0002F0D4    push        ebx
 0002F0D5    call        gdi32.GetObjectA
 0002F0DA    test        eax,eax
>0002F0DC    je          0002F112
 0002F0DE    cmp         dword ptr [esp],0
>0002F0E2    je          0002F112
 0002F0E4    mov         word ptr [esp+4],300
 0002F0EB    mov         ax,word ptr [esp]
 0002F0EF    mov         word ptr [esp+6],ax
 0002F0F4    lea         eax,[esp+8]
 0002F0F8    push        eax
 0002F0F9    mov         eax,dword ptr [esp+4]
 0002F0FD    push        eax
 0002F0FE    push        0
 0002F100    push        ebx
 0002F101    call        gdi32.GetPaletteEntries
 0002F106    lea         eax,[esp+4]
 0002F10A    push        eax
 0002F10B    call        gdi32.CreatePalette
 0002F110    mov         esi,eax
 0002F112    mov         eax,esi
 0002F114    add         esp,408
 0002F11A    pop         esi
 0002F11B    pop         ebx
 0002F11C    ret
*}
end;

//0002F120
function CopyBitmapAsMask(Handle:HBITMAP; Palette:HPALETTE; TransparentColor:TColorRef):HBITMAP;
begin
{*
 0002F120    push        ebp
 0002F121    mov         ebp,esp
 0002F123    add         esp,0FFFFFF90
 0002F126    push        ebx
 0002F127    push        esi
 0002F128    push        edi
 0002F129    mov         edi,ecx
 0002F12B    mov         esi,edx
 0002F12D    mov         ebx,eax
 0002F12F    xor         eax,eax
 0002F131    mov         dword ptr [ebp-4],eax
 0002F134    test        ebx,ebx
>0002F136    je          0002F322
 0002F13C    lea         eax,[ebp-70]
 0002F13F    push        eax
 0002F140    push        54
 0002F142    push        ebx
 0002F143    call        gdi32.GetObjectA
 0002F148    test        eax,eax
>0002F14A    je          0002F322
 0002F150    mov         eax,ebx
 0002F152    call        DeselectBitmap
 0002F157    xor         eax,eax
 0002F159    mov         dword ptr [ebp-8],eax
 0002F15C    xor         eax,eax
 0002F15E    mov         dword ptr [ebp-10],eax
 0002F161    xor         eax,eax
 0002F163    push        ebp
 0002F164    push        2F31B
 0002F169    push        dword ptr fs:[eax]
 0002F16C    mov         dword ptr fs:[eax],esp
 0002F16F    push        0
 0002F171    call        user32.GetDC
 0002F176    call        GDICheck
 0002F17B    mov         dword ptr [ebp-8],eax
 0002F17E    mov         eax,dword ptr [ebp-8]
 0002F181    push        eax
 0002F182    call        gdi32.CreateCompatibleDC
 0002F187    call        GDICheck
 0002F18C    mov         dword ptr [ebp-10],eax
 0002F18F    push        0
 0002F191    push        1
 0002F193    push        1
 0002F195    mov         eax,dword ptr [ebp-68]
 0002F198    push        eax
 0002F199    mov         eax,dword ptr [ebp-6C]
 0002F19C    push        eax
 0002F19D    call        gdi32.CreateBitmap
 0002F1A2    mov         dword ptr [ebp-4],eax
 0002F1A5    cmp         dword ptr [ebp-4],0
>0002F1A9    je          0002F2ED
 0002F1AF    mov         eax,dword ptr [ebp-4]
 0002F1B2    push        eax
 0002F1B3    mov         eax,dword ptr [ebp-10]
 0002F1B6    push        eax
 0002F1B7    call        gdi32.SelectObject
 0002F1BC    mov         dword ptr [ebp-1C],eax
 0002F1BF    cmp         edi,1FFFFFFF
>0002F1C5    jne         0002F1E3
 0002F1C7    push        42
 0002F1C9    mov         eax,dword ptr [ebp-68]
 0002F1CC    push        eax
 0002F1CD    mov         eax,dword ptr [ebp-6C]
 0002F1D0    push        eax
 0002F1D1    push        0
 0002F1D3    push        0
 0002F1D5    mov         eax,dword ptr [ebp-10]
 0002F1D8    push        eax
 0002F1D9    call        gdi32.PatBlt
>0002F1DE    jmp         0002F2DA
 0002F1E3    mov         eax,dword ptr [ebp-8]
 0002F1E6    push        eax
 0002F1E7    call        gdi32.CreateCompatibleDC
 0002F1EC    call        GDICheck
 0002F1F1    mov         dword ptr [ebp-0C],eax
 0002F1F4    xor         eax,eax
 0002F1F6    push        ebp
 0002F1F7    push        2F2D3
 0002F1FC    push        dword ptr fs:[eax]
 0002F1FF    mov         dword ptr fs:[eax],esp
 0002F202    cmp         dword ptr [ebp-5C],0
>0002F206    je          0002F226
 0002F208    mov         byte ptr [ebp-11],1
 0002F20C    xor         eax,eax
 0002F20E    mov         dword ptr [ebp-58],eax
 0002F211    lea         eax,[ebp-70]
 0002F214    push        eax
 0002F215    push        0
 0002F217    mov         ecx,esi
 0002F219    mov         edx,esi
 0002F21B    mov         eax,ebx
 0002F21D    call        CopyBitmap
 0002F222    mov         ebx,eax
>0002F224    jmp         0002F22A
 0002F226    mov         byte ptr [ebp-11],0
 0002F22A    push        ebx
 0002F22B    mov         eax,dword ptr [ebp-0C]
 0002F22E    push        eax
 0002F22F    call        gdi32.SelectObject
 0002F234    mov         dword ptr [ebp-18],eax
 0002F237    test        esi,esi
>0002F239    je          0002F265
 0002F23B    push        0
 0002F23D    push        esi
 0002F23E    mov         eax,dword ptr [ebp-0C]
 0002F241    push        eax
 0002F242    call        gdi32.SelectPalette
 0002F247    mov         eax,dword ptr [ebp-0C]
 0002F24A    push        eax
 0002F24B    call        gdi32.RealizePalette
 0002F250    push        0
 0002F252    push        esi
 0002F253    mov         eax,dword ptr [ebp-10]
 0002F256    push        eax
 0002F257    call        gdi32.SelectPalette
 0002F25C    mov         eax,dword ptr [ebp-10]
 0002F25F    push        eax
 0002F260    call        gdi32.RealizePalette
 0002F265    push        edi
 0002F266    mov         eax,dword ptr [ebp-0C]
 0002F269    push        eax
 0002F26A    call        gdi32.SetBkColor
 0002F26F    mov         esi,eax
 0002F271    push        0CC0020
 0002F276    push        0
 0002F278    push        0
 0002F27A    mov         eax,dword ptr [ebp-0C]
 0002F27D    push        eax
 0002F27E    mov         eax,dword ptr [ebp-68]
 0002F281    push        eax
 0002F282    mov         eax,dword ptr [ebp-6C]
 0002F285    push        eax
 0002F286    push        0
 0002F288    push        0
 0002F28A    mov         eax,dword ptr [ebp-10]
 0002F28D    push        eax
 0002F28E    call        gdi32.BitBlt
 0002F293    push        esi
 0002F294    mov         eax,dword ptr [ebp-0C]
 0002F297    push        eax
 0002F298    call        gdi32.SetBkColor
 0002F29D    cmp         dword ptr [ebp-18],0
>0002F2A1    je          0002F2B0
 0002F2A3    mov         eax,dword ptr [ebp-18]
 0002F2A6    push        eax
 0002F2A7    mov         eax,dword ptr [ebp-0C]
 0002F2AA    push        eax
 0002F2AB    call        gdi32.SelectObject
 0002F2B0    cmp         byte ptr [ebp-11],0
>0002F2B4    je          0002F2BC
 0002F2B6    push        ebx
 0002F2B7    call        gdi32.DeleteObject
 0002F2BC    xor         eax,eax
 0002F2BE    pop         edx
 0002F2BF    pop         ecx
 0002F2C0    pop         ecx
 0002F2C1    mov         dword ptr fs:[eax],edx
 0002F2C4    push        2F2DA
 0002F2C9    mov         eax,dword ptr [ebp-0C]
 0002F2CC    push        eax
 0002F2CD    call        gdi32.DeleteDC
 0002F2D2    ret
>0002F2D3    jmp         @HandleFinally
>0002F2D8    jmp         0002F2C9
 0002F2DA    cmp         dword ptr [ebp-1C],0
>0002F2DE    je          0002F2ED
 0002F2E0    mov         eax,dword ptr [ebp-1C]
 0002F2E3    push        eax
 0002F2E4    mov         eax,dword ptr [ebp-10]
 0002F2E7    push        eax
 0002F2E8    call        gdi32.SelectObject
 0002F2ED    xor         eax,eax
 0002F2EF    pop         edx
 0002F2F0    pop         ecx
 0002F2F1    pop         ecx
 0002F2F2    mov         dword ptr fs:[eax],edx
 0002F2F5    push        2F322
 0002F2FA    cmp         dword ptr [ebp-10],0
>0002F2FE    je          0002F309
 0002F300    mov         eax,dword ptr [ebp-10]
 0002F303    push        eax
 0002F304    call        gdi32.DeleteDC
 0002F309    cmp         dword ptr [ebp-8],0
>0002F30D    je          0002F31A
 0002F30F    mov         eax,dword ptr [ebp-8]
 0002F312    push        eax
 0002F313    push        0
 0002F315    call        user32.ReleaseDC
 0002F31A    ret
>0002F31B    jmp         @HandleFinally
>0002F320    jmp         0002F2FA
 0002F322    mov         eax,dword ptr [ebp-4]
 0002F325    pop         edi
 0002F326    pop         esi
 0002F327    pop         ebx
 0002F328    mov         esp,ebp
 0002F32A    pop         ebp
 0002F32B    ret
*}
end;

//0002F32C
constructor TBitmap.Create;
begin
{*
 0002F32C    push        ebx
 0002F32D    push        esi
 0002F32E    push        edi
 0002F32F    test        dl,dl
>0002F331    je          0002F33B
 0002F333    add         esp,0FFFFFFF0
 0002F336    call        @ClassCreate
 0002F33B    mov         ebx,edx
 0002F33D    mov         edi,eax
 0002F33F    xor         edx,edx
 0002F341    mov         eax,edi
 0002F343    call        TGraphic.Create
 0002F348    mov         dword ptr [edi+24],20000000
 0002F34F    mov         dl,1
 0002F351    mov         eax,[00028F10];TBitmapImage
 0002F356    call        TObject.Create
 0002F35B    mov         esi,eax
 0002F35D    mov         dword ptr [edi+18],esi
 0002F360    mov         eax,esi
 0002F362    call        TSharedImage.Reference
 0002F367    cmp         byte ptr ds:[0B43E4],0
>0002F36E    je          0002F379
 0002F370    mov         dl,1
 0002F372    mov         eax,edi
 0002F374    mov         ecx,dword ptr [eax]
 0002F376    call        dword ptr [ecx+68]
 0002F379    mov         eax,edi
 0002F37B    test        bl,bl
>0002F37D    je          0002F38E
 0002F37F    call        @AfterConstruction
 0002F384    pop         dword ptr fs:[0]
 0002F38B    add         esp,0C
 0002F38E    mov         eax,edi
 0002F390    pop         edi
 0002F391    pop         esi
 0002F392    pop         ebx
 0002F393    ret
*}
end;

//0002F394
destructor TBitmap.Destroy;
begin
{*
 0002F394    push        ebx
 0002F395    push        esi
 0002F396    call        @BeforeDestruction
 0002F39B    mov         ebx,edx
 0002F39D    mov         esi,eax
 0002F39F    mov         eax,esi
 0002F3A1    call        TBitmap.FreeContext
 0002F3A6    mov         eax,dword ptr [esi+18];TBitmap.FImage:TBitmapImage
 0002F3A9    call        TSharedImage.Release
 0002F3AE    mov         eax,dword ptr [esi+1C];TBitmap.FCanvas:TCanvas
 0002F3B1    call        TObject.Free
 0002F3B6    mov         edx,ebx
 0002F3B8    and         dl,0FC
 0002F3BB    mov         eax,esi
 0002F3BD    call        TMemoryStream.Destroy
 0002F3C2    test        bl,bl
>0002F3C4    jle         0002F3CD
 0002F3C6    mov         eax,esi
 0002F3C8    call        @ClassDestroy
 0002F3CD    pop         esi
 0002F3CE    pop         ebx
 0002F3CF    ret
*}
end;

//0002F3D0
procedure TBitmap.Assign(Source:TPersistent);
begin
{*
 0002F3D0    push        ebp
 0002F3D1    mov         ebp,esp
 0002F3D3    add         esp,0FFFFFFA8
 0002F3D6    push        ebx
 0002F3D7    push        esi
 0002F3D8    mov         ebx,edx
 0002F3DA    mov         dword ptr [ebp-4],eax
 0002F3DD    test        ebx,ebx
>0002F3DF    je          0002F3F6
 0002F3E1    mov         eax,ebx
 0002F3E3    mov         edx,dword ptr ds:[28F70];TBitmap
 0002F3E9    call        @IsClass
 0002F3EE    test        al,al
>0002F3F0    je          0002F4AD
 0002F3F6    push        0B6650
 0002F3FB    call        kernel32.EnterCriticalSection
 0002F400    xor         eax,eax
 0002F402    push        ebp
 0002F403    push        2F486
 0002F408    push        dword ptr fs:[eax]
 0002F40B    mov         dword ptr fs:[eax],esp
 0002F40E    test        ebx,ebx
>0002F410    je          0002F44D
 0002F412    mov         esi,ebx
 0002F414    mov         eax,dword ptr [esi+18]
 0002F417    call        TSharedImage.Reference
 0002F41C    mov         eax,dword ptr [ebp-4]
 0002F41F    mov         eax,dword ptr [eax+18]
 0002F422    call        TSharedImage.Release
 0002F427    mov         eax,dword ptr [esi+18]
 0002F42A    mov         edx,dword ptr [ebp-4]
 0002F42D    mov         dword ptr [edx+18],eax
 0002F430    mov         al,byte ptr [esi+15]
 0002F433    mov         edx,dword ptr [ebp-4]
 0002F436    mov         byte ptr [edx+15],al
 0002F439    mov         eax,dword ptr [esi+24]
 0002F43C    mov         edx,dword ptr [ebp-4]
 0002F43F    mov         dword ptr [edx+24],eax
 0002F442    mov         al,byte ptr [esi+28]
 0002F445    mov         edx,dword ptr [ebp-4]
 0002F448    mov         byte ptr [edx+28],al
>0002F44B    jmp         0002F46E
 0002F44D    lea         eax,[ebp-58]
 0002F450    xor         ecx,ecx
 0002F452    mov         edx,54
 0002F457    call        @FillChar
 0002F45C    lea         eax,[ebp-58]
 0002F45F    push        eax
 0002F460    push        0
 0002F462    xor         ecx,ecx
 0002F464    xor         edx,edx
 0002F466    mov         eax,dword ptr [ebp-4]
 0002F469    call        TBitmap.NewImage
 0002F46E    xor         eax,eax
 0002F470    pop         edx
 0002F471    pop         ecx
 0002F472    pop         ecx
 0002F473    mov         dword ptr fs:[eax],edx
 0002F476    push        2F48D
 0002F47B    push        0B6650
 0002F480    call        kernel32.LeaveCriticalSection
 0002F485    ret
>0002F486    jmp         @HandleFinally
>0002F48B    jmp         0002F47B
 0002F48D    mov         eax,dword ptr [ebp-4]
 0002F490    mov         edx,dword ptr [eax]
 0002F492    call        dword ptr [edx+24]
 0002F495    test        eax,eax
 0002F497    setne       al
 0002F49A    mov         edx,dword ptr [ebp-4]
 0002F49D    mov         byte ptr [edx+16],al
 0002F4A0    mov         edx,dword ptr [ebp-4]
 0002F4A3    mov         eax,dword ptr [ebp-4]
 0002F4A6    mov         ecx,dword ptr [eax]
 0002F4A8    call        dword ptr [ecx+10]
>0002F4AB    jmp         0002F4B7
 0002F4AD    mov         edx,ebx
 0002F4AF    mov         eax,dword ptr [ebp-4]
 0002F4B2    call        TPersistent.Assign
 0002F4B7    pop         esi
 0002F4B8    pop         ebx
 0002F4B9    mov         esp,ebp
 0002F4BB    pop         ebp
 0002F4BC    ret
*}
end;

//0002F4C0
procedure TBitmap.CopyImage(AHandle:HBITMAP; APalette:HPALETTE; DIB:TDIBSection);
begin
{*
 0002F4C0    push        ebp
 0002F4C1    mov         ebp,esp
 0002F4C3    add         esp,0FFFFFFA4
 0002F4C6    push        ebx
 0002F4C7    push        esi
 0002F4C8    push        edi
 0002F4C9    mov         esi,dword ptr [ebp+8]
 0002F4CC    lea         edi,[ebp-5C]
 0002F4CF    push        ecx
 0002F4D0    mov         ecx,15
 0002F4D5    rep movs    dword ptr [edi],dword ptr [esi]
 0002F4D7    pop         ecx
 0002F4D8    mov         esi,ecx
 0002F4DA    mov         edi,edx
 0002F4DC    mov         ebx,eax
 0002F4DE    mov         eax,ebx
 0002F4E0    call        TBitmap.FreeContext
 0002F4E5    xor         eax,eax
 0002F4E7    mov         dword ptr [ebp-4],eax
 0002F4EA    xor         eax,eax
 0002F4EC    mov         dword ptr [ebp-8],eax
 0002F4EF    xor         eax,eax
 0002F4F1    push        ebp
 0002F4F2    push        2F54D
 0002F4F7    push        dword ptr fs:[eax]
 0002F4FA    mov         dword ptr fs:[eax],esp
 0002F4FD    cmp         esi,dword ptr ds:[0B6634]
>0002F503    jne         0002F50A
 0002F505    mov         dword ptr [ebp-8],esi
>0002F508    jmp         0002F514
 0002F50A    mov         eax,esi
 0002F50C    call        CopyPalette
 0002F511    mov         dword ptr [ebp-8],eax
 0002F514    lea         eax,[ebp-5C]
 0002F517    push        eax
 0002F518    mov         eax,dword ptr [ebx+1C]
 0002F51B    push        eax
 0002F51C    mov         ecx,dword ptr [ebp-8]
 0002F51F    mov         edx,esi
 0002F521    mov         eax,edi
 0002F523    call        CopyBitmap
 0002F528    mov         dword ptr [ebp-4],eax
 0002F52B    lea         eax,[ebp-5C]
 0002F52E    push        eax
 0002F52F    mov         eax,dword ptr [ebx+18]
 0002F532    mov         al,byte ptr [eax+6C]
 0002F535    push        eax
 0002F536    mov         ecx,dword ptr [ebp-8]
 0002F539    mov         edx,dword ptr [ebp-4]
 0002F53C    mov         eax,ebx
 0002F53E    call        TBitmap.NewImage
 0002F543    xor         eax,eax
 0002F545    pop         edx
 0002F546    pop         ecx
 0002F547    pop         ecx
 0002F548    mov         dword ptr fs:[eax],edx
>0002F54B    jmp         0002F573
>0002F54D    jmp         @HandleAnyException
 0002F552    mov         eax,dword ptr [ebp-8]
 0002F555    call        InternalDeletePalette
 0002F55A    cmp         dword ptr [ebp-4],0
>0002F55E    je          0002F569
 0002F560    mov         eax,dword ptr [ebp-4]
 0002F563    push        eax
 0002F564    call        gdi32.DeleteObject
 0002F569    call        @RaiseAgain
 0002F56E    call        @DoneExcept
 0002F573    pop         edi
 0002F574    pop         esi
 0002F575    pop         ebx
 0002F576    mov         esp,ebp
 0002F578    pop         ebp
 0002F579    ret         4
*}
end;

//0002F57C
procedure TBitmap.Changing(Sender:TObject);
begin
{*
 0002F57C    call        TBitmap.FreeImage
 0002F581    ret
*}
end;

//0002F584
procedure TBitmap.Changed(Sender:TObject);
begin
{*
 0002F584    mov         byte ptr [eax+21],0
 0002F588    call        TGraphic.Changed
 0002F58D    ret
*}
end;

//0002F590
procedure TBitmap.Dormant;
begin
{*
 0002F590    push        ebx
 0002F591    mov         ebx,eax
 0002F593    mov         eax,ebx
 0002F595    call        TBitmap.FreeContext
 0002F59A    mov         eax,ebx
 0002F59C    call        TBitmap.DIBNeeded
 0002F5A1    mov         eax,dword ptr [ebx+18]
 0002F5A4    mov         edx,dword ptr [eax]
 0002F5A6    call        dword ptr [edx]
 0002F5A8    pop         ebx
 0002F5A9    ret
*}
end;

//0002F5AC
procedure TBitmap.Draw(ACanvas:TCanvas; const Rect:TRect);
begin
{*
 0002F5AC    push        ebp
 0002F5AD    mov         ebp,esp
 0002F5AF    add         esp,0FFFFFFE4
 0002F5B2    push        ebx
 0002F5B3    push        esi
 0002F5B4    push        edi
 0002F5B5    mov         edi,ecx
 0002F5B7    mov         dword ptr [ebp-4],edx
 0002F5BA    mov         ebx,eax
 0002F5BC    mov         esi,dword ptr [ebx+18]
 0002F5BF    mov         dl,byte ptr ds:[2F7F8]
 0002F5C5    mov         eax,dword ptr [ebp-4]
 0002F5C8    call        TCanvas.RequiredState
 0002F5CD    mov         eax,ebx
 0002F5CF    call        TBitmap.PaletteNeeded
 0002F5D4    xor         eax,eax
 0002F5D6    mov         dword ptr [ebp-8],eax
 0002F5D9    mov         byte ptr [ebp-9],0
 0002F5DD    mov         eax,dword ptr [esi+10]
 0002F5E0    test        eax,eax
>0002F5E2    je          0002F606
 0002F5E4    push        0FF
 0002F5E6    push        eax
 0002F5E7    mov         eax,dword ptr [ebp-4]
 0002F5EA    mov         eax,dword ptr [eax+4]
 0002F5ED    push        eax
 0002F5EE    call        gdi32.SelectPalette
 0002F5F3    mov         dword ptr [ebp-8],eax
 0002F5F6    mov         eax,dword ptr [ebp-4]
 0002F5F9    mov         eax,dword ptr [eax+4]
 0002F5FC    push        eax
 0002F5FD    call        gdi32.RealizePalette
 0002F602    mov         byte ptr [ebp-9],1
 0002F606    push        0C
 0002F608    mov         eax,dword ptr [ebp-4]
 0002F60B    mov         eax,dword ptr [eax+4]
 0002F60E    push        eax
 0002F60F    call        gdi32.GetDeviceCaps
 0002F614    push        eax
 0002F615    push        0E
 0002F617    mov         eax,dword ptr [ebp-4]
 0002F61A    mov         eax,dword ptr [eax+4]
 0002F61D    push        eax
 0002F61E    call        gdi32.GetDeviceCaps
 0002F623    pop         edx
 0002F624    imul        edx,eax
 0002F627    mov         eax,edx
 0002F629    cmp         eax,8
>0002F62C    jg          0002F63D
 0002F62E    movzx       edx,word ptr [esi+2A]
 0002F632    movzx       ecx,word ptr [esi+28]
 0002F636    imul        edx,ecx
 0002F639    cmp         eax,edx
>0002F63B    jl          0002F641
 0002F63D    xor         eax,eax
>0002F63F    jmp         0002F643
 0002F641    mov         al,1
 0002F643    test        al,al
>0002F645    je          0002F67F
 0002F647    lea         eax,[ebp-14]
 0002F64A    push        eax
 0002F64B    mov         eax,dword ptr [ebp-4]
 0002F64E    mov         eax,dword ptr [eax+4]
 0002F651    push        eax
 0002F652    call        gdi32.GetBrushOrgEx
 0002F657    push        4
 0002F659    mov         eax,dword ptr [ebp-4]
 0002F65C    mov         eax,dword ptr [eax+4]
 0002F65F    push        eax
 0002F660    call        gdi32.SetStretchBltMode
 0002F665    lea         eax,[ebp-14]
 0002F668    push        eax
 0002F669    mov         eax,dword ptr [ebp-10]
 0002F66C    push        eax
 0002F66D    mov         eax,dword ptr [ebp-14]
 0002F670    push        eax
 0002F671    mov         eax,dword ptr [ebp-4]
 0002F674    mov         eax,dword ptr [eax+4]
 0002F677    push        eax
 0002F678    call        gdi32.SetBrushOrgEx
>0002F67D    jmp         0002F69A
 0002F67F    mov         eax,ebx
 0002F681    call        TBitmap.GetMonochrome
 0002F686    test        al,al
>0002F688    jne         0002F69A
 0002F68A    push        3
 0002F68C    mov         eax,dword ptr [ebp-4]
 0002F68F    call        TCanvas.GetHandle
 0002F694    push        eax
 0002F695    call        gdi32.SetStretchBltMode
 0002F69A    xor         eax,eax
 0002F69C    push        ebp
 0002F69D    push        2F7E9
 0002F6A2    push        dword ptr fs:[eax]
 0002F6A5    mov         dword ptr fs:[eax],esp
 0002F6A8    mov         eax,ebx
 0002F6AA    mov         edx,dword ptr [eax]
 0002F6AC    call        dword ptr [edx+28]
 0002F6AF    test        al,al
>0002F6B1    je          0002F6BA
 0002F6B3    mov         eax,ebx
 0002F6B5    call        TBitmap.MaskHandleNeeded
 0002F6BA    mov         eax,ebx
 0002F6BC    call        TBitmap.GetCanvas
 0002F6C1    mov         dl,byte ptr ds:[2F7F8]
 0002F6C7    call        TCanvas.RequiredState
 0002F6CC    mov         eax,ebx
 0002F6CE    mov         edx,dword ptr [eax]
 0002F6D0    call        dword ptr [edx+28]
 0002F6D3    test        al,al
>0002F6D5    je          0002F785
 0002F6DB    xor         eax,eax
 0002F6DD    mov         dword ptr [ebp-1C],eax
 0002F6E0    xor         eax,eax
 0002F6E2    mov         dword ptr [ebp-18],eax
 0002F6E5    xor         eax,eax
 0002F6E7    push        ebp
 0002F6E8    push        2F77E
 0002F6ED    push        dword ptr fs:[eax]
 0002F6F0    mov         dword ptr fs:[eax],esp
 0002F6F3    push        0
 0002F6F5    call        gdi32.CreateCompatibleDC
 0002F6FA    call        GDICheck
 0002F6FF    mov         dword ptr [ebp-18],eax
 0002F702    mov         eax,dword ptr [esi+0C]
 0002F705    push        eax
 0002F706    mov         eax,dword ptr [ebp-18]
 0002F709    push        eax
 0002F70A    call        gdi32.SelectObject
 0002F70F    mov         dword ptr [ebp-1C],eax
 0002F712    mov         eax,dword ptr [edi+8]
 0002F715    sub         eax,dword ptr [edi]
 0002F717    push        eax
 0002F718    mov         eax,dword ptr [edi+0C]
 0002F71B    sub         eax,dword ptr [edi+4]
 0002F71E    push        eax
 0002F71F    mov         eax,ebx
 0002F721    call        TBitmap.GetCanvas
 0002F726    mov         eax,dword ptr [eax+4]
 0002F729    push        eax
 0002F72A    push        0
 0002F72C    push        0
 0002F72E    mov         eax,dword ptr [esi+1C]
 0002F731    push        eax
 0002F732    mov         eax,dword ptr [esi+20]
 0002F735    push        eax
 0002F736    mov         eax,dword ptr [ebp-18]
 0002F739    push        eax
 0002F73A    push        0
 0002F73C    push        0
 0002F73E    mov         ecx,dword ptr [edi+4]
 0002F741    mov         edx,dword ptr [edi]
 0002F743    mov         eax,dword ptr [ebp-4]
 0002F746    mov         eax,dword ptr [eax+4]
 0002F749    call        TransparentStretchBlt
 0002F74E    xor         eax,eax
 0002F750    pop         edx
 0002F751    pop         ecx
 0002F752    pop         ecx
 0002F753    mov         dword ptr fs:[eax],edx
 0002F756    push        2F7C3
 0002F75B    cmp         dword ptr [ebp-1C],0
>0002F75F    je          0002F76E
 0002F761    mov         eax,dword ptr [ebp-1C]
 0002F764    push        eax
 0002F765    mov         eax,dword ptr [ebp-18]
 0002F768    push        eax
 0002F769    call        gdi32.SelectObject
 0002F76E    cmp         dword ptr [ebp-18],0
>0002F772    je          0002F77D
 0002F774    mov         eax,dword ptr [ebp-18]
 0002F777    push        eax
 0002F778    call        gdi32.DeleteDC
 0002F77D    ret
>0002F77E    jmp         @HandleFinally
>0002F783    jmp         0002F75B
 0002F785    mov         eax,dword ptr [ebp-4]
 0002F788    mov         eax,dword ptr [eax+20]
 0002F78B    push        eax
 0002F78C    mov         eax,dword ptr [esi+20]
 0002F78F    push        eax
 0002F790    mov         eax,dword ptr [esi+1C]
 0002F793    push        eax
 0002F794    push        0
 0002F796    push        0
 0002F798    mov         eax,ebx
 0002F79A    call        TBitmap.GetCanvas
 0002F79F    mov         eax,dword ptr [eax+4]
 0002F7A2    push        eax
 0002F7A3    mov         eax,dword ptr [edi+0C]
 0002F7A6    sub         eax,dword ptr [edi+4]
 0002F7A9    push        eax
 0002F7AA    mov         eax,dword ptr [edi+8]
 0002F7AD    sub         eax,dword ptr [edi]
 0002F7AF    push        eax
 0002F7B0    mov         eax,dword ptr [edi+4]
 0002F7B3    push        eax
 0002F7B4    mov         eax,dword ptr [edi]
 0002F7B6    push        eax
 0002F7B7    mov         eax,dword ptr [ebp-4]
 0002F7BA    mov         eax,dword ptr [eax+4]
 0002F7BD    push        eax
 0002F7BE    call        gdi32.StretchBlt
 0002F7C3    xor         eax,eax
 0002F7C5    pop         edx
 0002F7C6    pop         ecx
 0002F7C7    pop         ecx
 0002F7C8    mov         dword ptr fs:[eax],edx
 0002F7CB    push        2F7F0
 0002F7D0    cmp         byte ptr [ebp-9],0
>0002F7D4    je          0002F7E8
 0002F7D6    push        0FF
 0002F7D8    mov         eax,dword ptr [ebp-8]
 0002F7DB    push        eax
 0002F7DC    mov         eax,dword ptr [ebp-4]
 0002F7DF    mov         eax,dword ptr [eax+4]
 0002F7E2    push        eax
 0002F7E3    call        gdi32.SelectPalette
 0002F7E8    ret
>0002F7E9    jmp         @HandleFinally
>0002F7EE    jmp         0002F7D0
 0002F7F0    pop         edi
 0002F7F1    pop         esi
 0002F7F2    pop         ebx
 0002F7F3    mov         esp,ebp
 0002F7F5    pop         ebp
 0002F7F6    ret
*}
end;

//0002F7FC
procedure TBitmap.FreeImage;
begin
{*
 0002F7FC    push        ebx
 0002F7FD    push        esi
 0002F7FE    mov         esi,eax
 0002F800    mov         ebx,dword ptr [esi+18]
 0002F803    cmp         dword ptr [ebx+4],1
>0002F807    jle         0002F824
 0002F809    mov         eax,esi
 0002F80B    call        TBitmap.HandleNeeded
 0002F810    lea         eax,[ebx+18]
 0002F813    push        eax
 0002F814    mov         ecx,dword ptr [ebx+10]
 0002F817    mov         edx,dword ptr [ebx+8]
 0002F81A    mov         eax,esi
 0002F81C    call        TBitmap.CopyImage
 0002F821    pop         esi
 0002F822    pop         ebx
 0002F823    ret
 0002F824    mov         esi,dword ptr [ebx+14]
 0002F827    cmp         esi,dword ptr [ebx+8]
>0002F82A    je          0002F849
 0002F82C    test        esi,esi
>0002F82E    je          0002F83F
 0002F830    push        esi
 0002F831    call        gdi32.DeleteObject
 0002F836    test        eax,eax
>0002F838    jne         0002F83F
 0002F83A    call        GDIError
 0002F83F    xor         eax,eax
 0002F841    mov         dword ptr [ebx+14],eax
 0002F844    xor         eax,eax
 0002F846    mov         dword ptr [ebx+2C],eax
 0002F849    pop         esi
 0002F84A    pop         ebx
 0002F84B    ret
*}
end;

//0002F84C
function TBitmap.GetEmpty:Boolean;
begin
{*
 0002F84C    mov         eax,dword ptr [eax+18]
 0002F84F    cmp         dword ptr [eax+8],0
>0002F853    jne         0002F85B
 0002F855    cmp         dword ptr [eax+14],0
>0002F859    je          0002F85E
 0002F85B    xor         eax,eax
 0002F85D    ret
 0002F85E    mov         al,1
 0002F860    ret
*}
end;

//0002F864
function TBitmap.GetCanvas:TCanvas;
begin
{*
 0002F864    push        ebx
 0002F865    push        esi
 0002F866    mov         ebx,eax
 0002F868    cmp         dword ptr [ebx+1C],0
>0002F86C    jne         0002F89D
 0002F86E    mov         eax,ebx
 0002F870    call        TBitmap.HandleNeeded
 0002F875    mov         ecx,ebx
 0002F877    mov         dl,1
 0002F879    mov         eax,[0002E508];TBitmapCanvas
 0002F87E    call        TBitmapCanvas.Create
 0002F883    mov         esi,eax
 0002F885    mov         dword ptr [ebx+1C],esi
 0002F888    mov         dword ptr [esi+28],ebx
 0002F88B    mov         eax,dword ptr [ebx]
 0002F88D    mov         eax,dword ptr [eax+10]
 0002F890    mov         dword ptr [esi+24],eax
 0002F893    mov         dword ptr [esi+30],ebx
 0002F896    mov         dword ptr [esi+2C],2F57C;^sub_00027BE8
 0002F89D    mov         eax,dword ptr [ebx+1C]
 0002F8A0    pop         esi
 0002F8A1    pop         ebx
 0002F8A2    ret
*}
end;

//0002F8A4
function TBitmap.GetHandle:HBITMAP;
begin
{*
 0002F8A4    push        ebx
 0002F8A5    mov         ebx,eax
 0002F8A7    mov         eax,ebx
 0002F8A9    call        TBitmap.FreeContext
 0002F8AE    mov         eax,ebx
 0002F8B0    call        TBitmap.HandleNeeded
 0002F8B5    mov         edx,ebx
 0002F8B7    mov         eax,ebx
 0002F8B9    call        TBitmap.Changing
 0002F8BE    mov         eax,dword ptr [ebx+18]
 0002F8C1    mov         eax,dword ptr [eax+8]
 0002F8C4    pop         ebx
 0002F8C5    ret
*}
end;

//0002F8C8
function TBitmap.GetHandleType:TBitmapHandleType;
begin
{*
 0002F8C8    mov         eax,dword ptr [eax+18]
 0002F8CB    mov         edx,dword ptr [eax+8]
 0002F8CE    test        edx,edx
>0002F8D0    je          0002F8D7
 0002F8D2    cmp         edx,dword ptr [eax+14]
>0002F8D5    jne         0002F8EE
 0002F8D7    cmp         dword ptr [eax+14],0
>0002F8DB    jne         0002F8EB
 0002F8DD    cmp         dword ptr [eax+30],0
>0002F8E1    jne         0002F8E7
 0002F8E3    mov         al,1
>0002F8E5    jmp         0002F8F0
 0002F8E7    xor         eax,eax
>0002F8E9    jmp         0002F8F0
 0002F8EB    xor         eax,eax
 0002F8ED    ret
 0002F8EE    mov         al,1
 0002F8F0    ret
*}
end;

//0002F8F4
function TBitmap.GetHeight:Integer;
begin
{*
 0002F8F4    mov         ecx,eax
 0002F8F6    mov         eax,dword ptr [ecx+18]
 0002F8F9    mov         eax,dword ptr [eax+20]
 0002F8FC    cdq
 0002F8FD    xor         eax,edx
 0002F8FF    sub         eax,edx
 0002F901    ret
*}
end;

//0002F904
function TBitmap.GetMaskHandle:HBITMAP;
begin
{*
 0002F904    push        ebx
 0002F905    mov         ebx,eax
 0002F907    mov         eax,ebx
 0002F909    call        TBitmap.MaskHandleNeeded
 0002F90E    mov         eax,dword ptr [ebx+18]
 0002F911    mov         eax,dword ptr [eax+0C]
 0002F914    pop         ebx
 0002F915    ret
*}
end;

//0002F918
function TBitmap.GetMonochrome:Boolean;
begin
{*
 0002F918    mov         eax,dword ptr [eax+18]
 0002F91B    add         eax,18
 0002F91E    cmp         word ptr [eax+10],1
>0002F923    jne         0002F92C
 0002F925    cmp         word ptr [eax+12],1
>0002F92A    je          0002F92F
 0002F92C    xor         eax,eax
 0002F92E    ret
 0002F92F    mov         al,1
 0002F931    ret
*}
end;

//0002F934
function TBitmap.GetPalette:HPALETTE;
begin
{*
 0002F934    push        ebx
 0002F935    mov         ebx,eax
 0002F937    mov         eax,ebx
 0002F939    call        TBitmap.PaletteNeeded
 0002F93E    mov         eax,dword ptr [ebx+18]
 0002F941    mov         eax,dword ptr [eax+10]
 0002F944    pop         ebx
 0002F945    ret
*}
end;

//0002F948
function TBitmap.GetTransparentColor:TColor;
begin
{*
 0002F948    push        ebx
 0002F949    mov         ebx,eax
 0002F94B    mov         eax,dword ptr [ebx+24]
 0002F94E    cmp         eax,20000000
>0002F953    jne         0002F981
 0002F955    mov         eax,ebx
 0002F957    call        TBitmap.GetMonochrome
 0002F95C    test        al,al
>0002F95E    je          0002F967
 0002F960    mov         eax,0FFFFFF
>0002F965    jmp         0002F986
 0002F967    mov         eax,ebx
 0002F969    mov         edx,dword ptr [eax]
 0002F96B    call        dword ptr [edx+20]
 0002F96E    dec         eax
 0002F96F    push        eax
 0002F970    mov         eax,ebx
 0002F972    call        TBitmap.GetCanvas
 0002F977    xor         edx,edx
 0002F979    pop         ecx
 0002F97A    call        TCanvas.GetPixel
>0002F97F    jmp         0002F986
 0002F981    call        ColorToRGB
 0002F986    or          eax,2000000
 0002F98B    pop         ebx
 0002F98C    ret
*}
end;

//0002F990
{*function TBitmap.GetWidth:?;
begin
 0002F990    mov         eax,dword ptr [eax+18];TBitmap.FImage:TBitmapImage
 0002F993    mov         eax,dword ptr [eax+1C]
 0002F996    ret
end;*}

//0002F998
procedure TBitmap.DIBNeeded;
begin
{*
 0002F998    push        ebx
 0002F999    push        esi
 0002F99A    mov         ebx,dword ptr [eax+18]
 0002F99D    cmp         dword ptr [ebx+8],0
>0002F9A1    je          0002FA08
 0002F9A3    cmp         dword ptr [ebx+14],0
>0002F9A7    jne         0002FA08
 0002F9A9    call        TBitmap.PaletteNeeded
 0002F9AE    cmp         dword ptr [ebx+30],0
>0002F9B2    jne         0002F9F0
 0002F9B4    lea         eax,[ebx+18]
 0002F9B7    push        eax
 0002F9B8    push        54
 0002F9BA    mov         eax,dword ptr [ebx+8]
 0002F9BD    push        eax
 0002F9BE    call        gdi32.GetObjectA
 0002F9C3    lea         eax,[ebx+18]
 0002F9C6    mov         edx,eax
 0002F9C8    add         eax,18
 0002F9CB    mov         dword ptr [eax],28
 0002F9D1    mov         ecx,dword ptr [edx+4]
 0002F9D4    mov         dword ptr [eax+4],ecx
 0002F9D7    mov         ecx,dword ptr [edx+8]
 0002F9DA    mov         dword ptr [eax+8],ecx
 0002F9DD    mov         word ptr [eax+0C],1
 0002F9E3    mov         cx,word ptr [edx+10]
 0002F9E7    imul        cx,word ptr [edx+12]
 0002F9EC    mov         word ptr [eax+0E],cx
 0002F9F0    lea         eax,[ebx+18]
 0002F9F3    push        eax
 0002F9F4    push        0
 0002F9F6    mov         esi,dword ptr [ebx+10]
 0002F9F9    mov         ecx,esi
 0002F9FB    mov         edx,esi
 0002F9FD    mov         eax,dword ptr [ebx+8]
 0002FA00    call        CopyBitmap
 0002FA05    mov         dword ptr [ebx+14],eax
 0002FA08    pop         esi
 0002FA09    pop         ebx
 0002FA0A    ret
*}
end;

//0002FA0C
procedure TBitmap.FreeContext;
begin
{*
 0002FA0C    mov         edx,dword ptr [eax+1C]
 0002FA0F    test        edx,edx
>0002FA11    je          0002FA1A
 0002FA13    mov         eax,edx
 0002FA15    call        TBitmapCanvas.FreeContext
 0002FA1A    ret
*}
end;

//0002FA1C
procedure TBitmap.HandleNeeded;
begin
{*
 0002FA1C    mov         eax,dword ptr [eax+18]
 0002FA1F    cmp         dword ptr [eax+8],0
>0002FA23    jne         0002FA2B
 0002FA25    mov         edx,dword ptr [eax+14]
 0002FA28    mov         dword ptr [eax+8],edx
 0002FA2B    ret
*}
end;

//0002FA2C
procedure TBitmap.Mask(TransparentColor:TColor);
begin
{*
 0002FA2C    push        ebp
 0002FA2D    mov         ebp,esp
 0002FA2F    add         esp,0FFFFFFA4
 0002FA32    push        ebx
 0002FA33    push        esi
 0002FA34    push        edi
 0002FA35    mov         edi,edx
 0002FA37    mov         ebx,eax
 0002FA39    xor         eax,eax
 0002FA3B    mov         dword ptr [ebp-4],eax
 0002FA3E    xor         eax,eax
 0002FA40    mov         dword ptr [ebp-8],eax
 0002FA43    xor         edx,edx
 0002FA45    push        ebp
 0002FA46    push        2FAD4
 0002FA4B    push        dword ptr fs:[edx]
 0002FA4E    mov         dword ptr fs:[edx],esp
 0002FA51    mov         eax,ebx
 0002FA53    call        TBitmap.FreeContext
 0002FA58    mov         eax,ebx
 0002FA5A    call        TBitmap.HandleNeeded
 0002FA5F    mov         eax,edi
 0002FA61    call        ColorToRGB
 0002FA66    mov         ecx,eax
 0002FA68    mov         esi,dword ptr [ebx+18]
 0002FA6B    mov         edx,dword ptr [esi+10]
 0002FA6E    mov         eax,dword ptr [esi+8]
 0002FA71    call        CopyBitmapAsMask
 0002FA76    mov         dword ptr [ebp-4],eax
 0002FA79    lea         eax,[ebp-5C]
 0002FA7C    xor         ecx,ecx
 0002FA7E    mov         edx,54
 0002FA83    call        @FillChar
 0002FA88    lea         eax,[ebp-5C]
 0002FA8B    push        eax
 0002FA8C    push        54
 0002FA8E    mov         eax,dword ptr [ebp-4]
 0002FA91    push        eax
 0002FA92    call        gdi32.GetObjectA
 0002FA97    mov         eax,dword ptr [ebx+18]
 0002FA9A    mov         eax,dword ptr [eax+10]
 0002FA9D    cmp         eax,dword ptr ds:[0B6634]
>0002FAA3    jne         0002FAAA
 0002FAA5    mov         dword ptr [ebp-8],eax
>0002FAA8    jmp         0002FAB2
 0002FAAA    call        CopyPalette
 0002FAAF    mov         dword ptr [ebp-8],eax
 0002FAB2    lea         eax,[ebp-5C]
 0002FAB5    push        eax
 0002FAB6    mov         eax,dword ptr [ebx+18]
 0002FAB9    mov         al,byte ptr [eax+6C]
 0002FABC    push        eax
 0002FABD    mov         ecx,dword ptr [ebp-8]
 0002FAC0    mov         edx,dword ptr [ebp-4]
 0002FAC3    mov         eax,ebx
 0002FAC5    call        TBitmap.NewImage
 0002FACA    xor         eax,eax
 0002FACC    pop         edx
 0002FACD    pop         ecx
 0002FACE    pop         ecx
 0002FACF    mov         dword ptr fs:[eax],edx
>0002FAD2    jmp         0002FAFA
>0002FAD4    jmp         @HandleAnyException
 0002FAD9    mov         eax,dword ptr [ebp-8]
 0002FADC    call        InternalDeletePalette
 0002FAE1    cmp         dword ptr [ebp-4],0
>0002FAE5    je          0002FAF0
 0002FAE7    mov         eax,dword ptr [ebp-4]
 0002FAEA    push        eax
 0002FAEB    call        gdi32.DeleteObject
 0002FAF0    call        @RaiseAgain
 0002FAF5    call        @DoneExcept
 0002FAFA    mov         edx,ebx
 0002FAFC    mov         eax,ebx
 0002FAFE    mov         ecx,dword ptr [eax]
 0002FB00    call        dword ptr [ecx+10]
 0002FB03    pop         edi
 0002FB04    pop         esi
 0002FB05    pop         ebx
 0002FB06    mov         esp,ebp
 0002FB08    pop         ebp
 0002FB09    ret
*}
end;

//0002FB0C
procedure TBitmap.MaskHandleNeeded;
begin
{*
 0002FB0C    push        ebx
 0002FB0D    push        esi
 0002FB0E    mov         ebx,eax
 0002FB10    cmp         byte ptr [ebx+22],0
>0002FB14    je          0002FB1C
 0002FB16    cmp         byte ptr [ebx+21],0
>0002FB1A    jne         0002FB66
 0002FB1C    mov         esi,dword ptr [ebx+18]
 0002FB1F    mov         eax,dword ptr [esi+0C]
 0002FB22    test        eax,eax
>0002FB24    je          0002FB39
 0002FB26    call        DeselectBitmap
 0002FB2B    mov         eax,dword ptr [esi+0C]
 0002FB2E    push        eax
 0002FB2F    call        gdi32.DeleteObject
 0002FB34    xor         eax,eax
 0002FB36    mov         dword ptr [esi+0C],eax
 0002FB39    mov         eax,ebx
 0002FB3B    call        TBitmap.FreeContext
 0002FB40    mov         eax,ebx
 0002FB42    call        TBitmap.HandleNeeded
 0002FB47    mov         eax,ebx
 0002FB49    call        TBitmap.GetTransparentColor
 0002FB4E    mov         ecx,eax
 0002FB50    mov         edx,dword ptr [esi+10]
 0002FB53    mov         eax,dword ptr [esi+8]
 0002FB56    call        CopyBitmapAsMask
 0002FB5B    mov         dword ptr [esi+0C],eax
 0002FB5E    mov         byte ptr [ebx+22],1
 0002FB62    mov         byte ptr [ebx+21],1
 0002FB66    pop         esi
 0002FB67    pop         ebx
 0002FB68    ret
*}
end;

//0002FB6C
procedure TBitmap.PaletteNeeded;
begin
{*
 0002FB6C    push        ebx
 0002FB6D    push        esi
 0002FB6E    push        edi
 0002FB6F    push        ebp
 0002FB70    mov         edi,eax
 0002FB72    mov         ebp,dword ptr [edi+18]
 0002FB75    cmp         byte ptr [edi+20],0
>0002FB79    jne         0002FC1F
 0002FB7F    cmp         dword ptr [ebp+10],0
>0002FB83    jne         0002FC1F
 0002FB89    cmp         dword ptr [ebp+14],0
>0002FB8D    je          0002FC1F
 0002FB93    mov         eax,dword ptr [ebp+14]
 0002FB96    cmp         eax,dword ptr [ebp+8]
>0002FB99    jne         0002FBA0
 0002FB9B    call        DeselectBitmap
 0002FBA0    mov         cx,word ptr [ebp+3E]
 0002FBA4    mov         eax,1
 0002FBA9    shl         eax,cl
 0002FBAB    mov         ecx,eax
 0002FBAD    xor         edx,edx
 0002FBAF    mov         eax,dword ptr [ebp+14]
 0002FBB2    call        PaletteFromDIBColorTable
 0002FBB7    mov         esi,eax
 0002FBB9    mov         dword ptr [ebp+10],esi
 0002FBBC    test        esi,esi
>0002FBBE    jne         0002FC1F
 0002FBC0    push        0
 0002FBC2    call        user32.GetDC
 0002FBC7    call        GDICheck
 0002FBCC    mov         esi,eax
 0002FBCE    cmp         byte ptr [ebp+6D],0
>0002FBD2    jne         0002FBFB
 0002FBD4    push        0C
 0002FBD6    push        esi
 0002FBD7    call        gdi32.GetDeviceCaps
 0002FBDC    mov         ebx,eax
 0002FBDE    push        0E
 0002FBE0    push        esi
 0002FBE1    call        gdi32.GetDeviceCaps
 0002FBE6    imul        ebx,eax
 0002FBE9    movzx       eax,word ptr [ebp+2A]
 0002FBED    movzx       edx,word ptr [ebp+28]
 0002FBF1    imul        edx
 0002FBF3    cmp         ebx,eax
>0002FBF5    jl          0002FBFB
 0002FBF7    xor         ebx,ebx
>0002FBF9    jmp         0002FBFD
 0002FBFB    mov         bl,1
 0002FBFD    mov         byte ptr [ebp+6D],bl
 0002FC00    test        bl,bl
>0002FC02    je          0002FC0D
 0002FC04    push        esi
 0002FC05    call        gdi32.CreateHalftonePalette
 0002FC0A    mov         dword ptr [ebp+10],eax
 0002FC0D    push        esi
 0002FC0E    push        0
 0002FC10    call        user32.ReleaseDC
 0002FC15    cmp         dword ptr [ebp+10],0
>0002FC19    jne         0002FC1F
 0002FC1B    mov         byte ptr [edi+20],1
 0002FC1F    pop         ebp
 0002FC20    pop         edi
 0002FC21    pop         esi
 0002FC22    pop         ebx
 0002FC23    ret
*}
end;

//0002FC24
procedure TBitmap.LoadFromClipboardFormat(AFormat:Word; AData:THandle; APalette:HPALETTE);
begin
{*
 0002FC24    push        ebp
 0002FC25    mov         ebp,esp
 0002FC27    add         esp,0FFFFFFA8
 0002FC2A    push        ebx
 0002FC2B    push        esi
 0002FC2C    xor         ebx,ebx
 0002FC2E    mov         dword ptr [ebp-58],ebx
 0002FC31    mov         ebx,ecx
 0002FC33    mov         esi,eax
 0002FC35    xor         eax,eax
 0002FC37    push        ebp
 0002FC38    push        2FCD4
 0002FC3D    push        dword ptr fs:[eax]
 0002FC40    mov         dword ptr fs:[eax],esp
 0002FC43    cmp         dx,2
>0002FC47    jne         0002FC4D
 0002FC49    test        ebx,ebx
>0002FC4B    jne         0002FC62
 0002FC4D    lea         edx,[ebp-58]
 0002FC50    mov         eax,[000B5A14];^SUnknownClipboardFormat:TResStringRec
 0002FC55    call        LoadResString
 0002FC5A    mov         eax,dword ptr [ebp-58]
 0002FC5D    call        InvalidGraphic
 0002FC62    mov         eax,esi
 0002FC64    call        TBitmap.FreeContext
 0002FC69    lea         eax,[ebp-54]
 0002FC6C    xor         ecx,ecx
 0002FC6E    mov         edx,54
 0002FC73    call        @FillChar
 0002FC78    lea         eax,[ebp-54]
 0002FC7B    push        eax
 0002FC7C    push        54
 0002FC7E    push        ebx
 0002FC7F    call        gdi32.GetObjectA
 0002FC84    cmp         dword ptr [ebp-40],0
>0002FC88    jne         0002FC8F
 0002FC8A    xor         eax,eax
 0002FC8C    mov         dword ptr [ebp-3C],eax
 0002FC8F    lea         eax,[ebp-54]
 0002FC92    push        eax
 0002FC93    mov         ecx,dword ptr [ebp+8]
 0002FC96    mov         edx,ebx
 0002FC98    mov         eax,esi
 0002FC9A    call        TBitmap.CopyImage
 0002FC9F    mov         eax,dword ptr [esi+18]
 0002FCA2    mov         byte ptr [eax+6C],0
 0002FCA6    mov         eax,esi
 0002FCA8    mov         edx,dword ptr [eax]
 0002FCAA    call        dword ptr [edx+24]
 0002FCAD    test        eax,eax
 0002FCAF    setne       al
 0002FCB2    mov         byte ptr [esi+16],al
 0002FCB5    mov         edx,esi
 0002FCB7    mov         eax,esi
 0002FCB9    mov         ecx,dword ptr [eax]
 0002FCBB    call        dword ptr [ecx+10]
 0002FCBE    xor         eax,eax
 0002FCC0    pop         edx
 0002FCC1    pop         ecx
 0002FCC2    pop         ecx
 0002FCC3    mov         dword ptr fs:[eax],edx
 0002FCC6    push        2FCDB
 0002FCCB    lea         eax,[ebp-58]
 0002FCCE    call        @LStrClr
 0002FCD3    ret
>0002FCD4    jmp         @HandleFinally
>0002FCD9    jmp         0002FCCB
 0002FCDB    pop         esi
 0002FCDC    pop         ebx
 0002FCDD    mov         esp,ebp
 0002FCDF    pop         ebp
 0002FCE0    ret         4
*}
end;

//0002FCE4
procedure TBitmap.LoadFromStream(Stream:TStream);
begin
{*
 0002FCE4    push        ebx
 0002FCE5    push        esi
 0002FCE6    mov         ebx,edx
 0002FCE8    mov         esi,eax
 0002FCEA    mov         eax,ebx
 0002FCEC    call        TStream.GetSize
 0002FCF1    push        eax
 0002FCF2    mov         eax,ebx
 0002FCF4    call        TStream.GetPosition
 0002FCF9    pop         ecx
 0002FCFA    sub         ecx,eax
 0002FCFC    mov         edx,ebx
 0002FCFE    mov         eax,esi
 0002FD00    call        TBitmap.ReadStream
 0002FD05    pop         esi
 0002FD06    pop         ebx
 0002FD07    ret
*}
end;

//0002FD08
procedure TBitmap.LoadFromResourceName(Instance:THandle; const ResName:AnsiString);
begin
{*
 0002FD08    push        ebp
 0002FD09    mov         ebp,esp
 0002FD0B    push        ecx
 0002FD0C    push        ebx
 0002FD0D    mov         ebx,eax
 0002FD0F    push        ecx
 0002FD10    push        2
 0002FD12    mov         eax,[0001F658];TResourceStream
 0002FD17    mov         cl,1
 0002FD19    xchg        ecx,edx
 0002FD1B    call        TResourceStream.Create
 0002FD20    mov         dword ptr [ebp-4],eax
 0002FD23    xor         eax,eax
 0002FD25    push        ebp
 0002FD26    push        2FD5B
 0002FD2B    push        dword ptr fs:[eax]
 0002FD2E    mov         dword ptr fs:[eax],esp
 0002FD31    mov         eax,dword ptr [ebp-4]
 0002FD34    call        TStream.GetSize
 0002FD39    mov         ecx,eax
 0002FD3B    mov         edx,dword ptr [ebp-4]
 0002FD3E    mov         eax,ebx
 0002FD40    call        TBitmap.ReadDIB
 0002FD45    xor         eax,eax
 0002FD47    pop         edx
 0002FD48    pop         ecx
 0002FD49    pop         ecx
 0002FD4A    mov         dword ptr fs:[eax],edx
 0002FD4D    push        2FD62
 0002FD52    mov         eax,dword ptr [ebp-4]
 0002FD55    call        TObject.Free
 0002FD5A    ret
>0002FD5B    jmp         @HandleFinally
>0002FD60    jmp         0002FD52
 0002FD62    pop         ebx
 0002FD63    pop         ecx
 0002FD64    pop         ebp
 0002FD65    ret
*}
end;

//0002FD68
procedure TBitmap.NewImage(NewHandle:HBITMAP; NewPalette:HPALETTE; const NewDIB:TDIBSection; OS2Format:Boolean);
begin
{*
 0002FD68    push        ebp
 0002FD69    mov         ebp,esp
 0002FD6B    add         esp,0FFFFFFF8
 0002FD6E    push        ebx
 0002FD6F    push        esi
 0002FD70    push        edi
 0002FD71    mov         esi,ecx
 0002FD73    mov         ebx,edx
 0002FD75    mov         dword ptr [ebp-4],eax
 0002FD78    mov         dl,1
 0002FD7A    mov         eax,[00028F10];TBitmapImage
 0002FD7F    call        TObject.Create
 0002FD84    mov         dword ptr [ebp-8],eax
 0002FD87    xor         eax,eax
 0002FD89    push        ebp
 0002FD8A    push        2FDDB
 0002FD8F    push        dword ptr fs:[eax]
 0002FD92    mov         dword ptr fs:[eax],esp
 0002FD95    mov         eax,dword ptr [ebp-8]
 0002FD98    mov         dword ptr [eax+8],ebx
 0002FD9B    mov         eax,dword ptr [ebp-8]
 0002FD9E    mov         dword ptr [eax+10],esi
 0002FDA1    mov         eax,dword ptr [ebp+0C]
 0002FDA4    mov         edx,dword ptr [ebp-8]
 0002FDA7    mov         esi,eax
 0002FDA9    lea         edi,[edx+18]
 0002FDAC    mov         ecx,15
 0002FDB1    rep movs    dword ptr [edi],dword ptr [esi]
 0002FDB3    mov         eax,dword ptr [ebp-8]
 0002FDB6    mov         dl,byte ptr [ebp+8]
 0002FDB9    mov         byte ptr [eax+6C],dl
 0002FDBC    mov         eax,dword ptr [ebp-8]
 0002FDBF    cmp         dword ptr [eax+2C],0
>0002FDC3    je          0002FDD1
 0002FDC5    mov         eax,dword ptr [ebp-8]
 0002FDC8    mov         eax,dword ptr [eax+8]
 0002FDCB    mov         edx,dword ptr [ebp-8]
 0002FDCE    mov         dword ptr [edx+14],eax
 0002FDD1    xor         eax,eax
 0002FDD3    pop         edx
 0002FDD4    pop         ecx
 0002FDD5    pop         ecx
 0002FDD6    mov         dword ptr fs:[eax],edx
>0002FDD9    jmp         0002FDF2
>0002FDDB    jmp         @HandleAnyException
 0002FDE0    mov         eax,dword ptr [ebp-8]
 0002FDE3    call        TObject.Free
 0002FDE8    call        @RaiseAgain
 0002FDED    call        @DoneExcept
 0002FDF2    push        0B6650
 0002FDF7    call        kernel32.EnterCriticalSection
 0002FDFC    xor         edx,edx
 0002FDFE    push        ebp
 0002FDFF    push        2FE3B
 0002FE04    push        dword ptr fs:[edx]
 0002FE07    mov         dword ptr fs:[edx],esp
 0002FE0A    mov         eax,dword ptr [ebp-4]
 0002FE0D    mov         eax,dword ptr [eax+18]
 0002FE10    call        TSharedImage.Release
 0002FE15    mov         edx,dword ptr [ebp-4]
 0002FE18    mov         eax,dword ptr [ebp-8]
 0002FE1B    mov         dword ptr [edx+18],eax
 0002FE1E    call        TSharedImage.Reference
 0002FE23    xor         eax,eax
 0002FE25    pop         edx
 0002FE26    pop         ecx
 0002FE27    pop         ecx
 0002FE28    mov         dword ptr fs:[eax],edx
 0002FE2B    push        2FE42
 0002FE30    push        0B6650
 0002FE35    call        kernel32.LeaveCriticalSection
 0002FE3A    ret
>0002FE3B    jmp         @HandleFinally
>0002FE40    jmp         0002FE30
 0002FE42    mov         eax,dword ptr [ebp-4]
 0002FE45    mov         byte ptr [eax+22],0
 0002FE49    pop         edi
 0002FE4A    pop         esi
 0002FE4B    pop         ebx
 0002FE4C    pop         ecx
 0002FE4D    pop         ecx
 0002FE4E    pop         ebp
 0002FE4F    ret         8
*}
end;

//0002FE54
procedure TBitmap.ReadData(Stream:TStream);
begin
{*
 0002FE54    push        ebx
 0002FE55    push        esi
 0002FE56    push        edi
 0002FE57    push        ecx
 0002FE58    mov         esi,edx
 0002FE5A    mov         ebx,eax
 0002FE5C    mov         edx,esp
 0002FE5E    mov         ecx,4
 0002FE63    mov         eax,esi
 0002FE65    mov         edi,dword ptr [eax]
 0002FE67    call        dword ptr [edi+4]
 0002FE6A    mov         ecx,dword ptr [esp]
 0002FE6D    mov         edx,esi
 0002FE6F    mov         eax,ebx
 0002FE71    call        TBitmap.ReadStream
 0002FE76    pop         edx
 0002FE77    pop         edi
 0002FE78    pop         esi
 0002FE79    pop         ebx
 0002FE7A    ret
*}
end;

//0002FE7C
procedure TBitmap.ReadDIB(Stream:TStream; ImageSize:Longword);
begin
{*
 0002FE7C    push        ebp
 0002FE7D    mov         ebp,esp
 0002FE7F    add         esp,0FFFFFF68
 0002FE85    push        ebx
 0002FE86    push        esi
 0002FE87    push        edi
 0002FE88    mov         esi,ecx
 0002FE8A    mov         dword ptr [ebp-8],edx
 0002FE8D    mov         dword ptr [ebp-4],eax
 0002FE90    xor         eax,eax
 0002FE92    mov         dword ptr [ebp-30],eax
 0002FE95    lea         edx,[ebp-20]
 0002FE98    mov         ecx,4
 0002FE9D    mov         eax,dword ptr [ebp-8]
 0002FEA0    mov         ebx,dword ptr [eax]
 0002FEA2    call        dword ptr [ebx+4]
 0002FEA5    cmp         dword ptr [ebp-20],0C
 0002FEA9    sete        byte ptr [ebp-21]
 0002FEAD    cmp         byte ptr [ebp-21],0
>0002FEB1    je          0002FEBA
 0002FEB3    mov         dword ptr [ebp-20],28
 0002FEBA    mov         eax,dword ptr [ebp-20]
 0002FEBD    add         eax,0C
 0002FEC0    add         eax,400
 0002FEC5    call        @GetMem
 0002FECA    mov         dword ptr [ebp-18],eax
 0002FECD    mov         eax,dword ptr [ebp-18]
 0002FED0    mov         dword ptr [ebp-38],eax
 0002FED3    xor         edx,edx
 0002FED5    push        ebp
 0002FED6    push        30260
 0002FEDB    push        dword ptr fs:[edx]
 0002FEDE    mov         dword ptr fs:[edx],esp
 0002FEE1    cmp         byte ptr [ebp-21],0
>0002FEE5    je          0002FF30
 0002FEE7    lea         edx,[ebp-44]
 0002FEEA    add         edx,4
 0002FEED    mov         ecx,8
 0002FEF2    mov         eax,dword ptr [ebp-8]
 0002FEF5    mov         ebx,dword ptr [eax]
 0002FEF7    call        dword ptr [ebx+4]
 0002FEFA    mov         ebx,dword ptr [ebp-38]
 0002FEFD    mov         eax,ebx
 0002FEFF    xor         ecx,ecx
 0002FF01    mov         edx,28
 0002FF06    call        @FillChar
 0002FF0B    mov         eax,ebx
 0002FF0D    movzx       edx,word ptr [ebp-40]
 0002FF11    mov         dword ptr [eax+4],edx
 0002FF14    movzx       edx,word ptr [ebp-3E]
 0002FF18    mov         dword ptr [eax+8],edx
 0002FF1B    mov         dx,word ptr [ebp-3C]
 0002FF1F    mov         word ptr [eax+0C],dx
 0002FF23    mov         dx,word ptr [ebp-3A]
 0002FF27    mov         word ptr [eax+0E],dx
 0002FF2B    sub         esi,0C
>0002FF2E    jmp         0002FF47
 0002FF30    mov         ecx,dword ptr [ebp-20]
 0002FF33    sub         ecx,4
 0002FF36    mov         edx,dword ptr [ebp-18]
 0002FF39    add         edx,4
 0002FF3C    mov         eax,dword ptr [ebp-8]
 0002FF3F    mov         ebx,dword ptr [eax]
 0002FF41    call        dword ptr [ebx+4]
 0002FF44    sub         esi,dword ptr [ebp-20]
 0002FF47    mov         ebx,dword ptr [ebp-38]
 0002FF4A    mov         eax,dword ptr [ebp-20]
 0002FF4D    mov         dword ptr [ebx],eax
 0002FF4F    mov         eax,dword ptr [ebp-18]
 0002FF52    add         eax,dword ptr [ebp-20]
 0002FF55    mov         dword ptr [ebp-1C],eax
 0002FF58    cmp         word ptr [ebx+0C],1
>0002FF5D    je          0002FF64
 0002FF5F    call        InvalidBitmap
 0002FF64    cmp         dword ptr [ebp-20],28
>0002FF68    jne         0002FF97
 0002FF6A    mov         ax,word ptr [ebx+0E]
 0002FF6E    cmp         ax,10
>0002FF72    je          0002FF7A
 0002FF74    cmp         ax,20
>0002FF78    jne         0002FF97
 0002FF7A    cmp         dword ptr [ebx+10],3
>0002FF7E    jne         0002FF97
 0002FF80    mov         edx,dword ptr [ebp-1C]
 0002FF83    mov         ecx,0C
 0002FF88    mov         eax,dword ptr [ebp-8]
 0002FF8B    call        TStream.ReadBuffer
 0002FF90    add         dword ptr [ebp-1C],0C
 0002FF94    sub         esi,0C
 0002FF97    cmp         dword ptr [ebx+20],0
>0002FF9B    jne         0002FFA9
 0002FF9D    mov         ax,word ptr [ebx+0E]
 0002FFA1    call        GetDInColors
 0002FFA6    mov         dword ptr [ebx+20],eax
 0002FFA9    mov         ecx,dword ptr [ebx+20]
 0002FFAC    movzx       edi,byte ptr [ebp-21]
 0002FFB0    xor         eax,eax
 0002FFB2    mov         al,byte ptr [edi+0B4624]
 0002FFB8    imul        ecx,eax
 0002FFBB    mov         edx,dword ptr [ebp-1C]
 0002FFBE    mov         eax,dword ptr [ebp-8]
 0002FFC1    call        TStream.ReadBuffer
 0002FFC6    mov         eax,dword ptr [ebx+20]
 0002FFC9    xor         edx,edx
 0002FFCB    mov         dl,byte ptr [edi+0B4624]
 0002FFD1    imul        edx
 0002FFD3    sub         esi,eax
 0002FFD5    cmp         dword ptr [ebx+14],0
>0002FFD9    jne         0002FFFC
 0002FFDB    movzx       edx,word ptr [ebx+0E]
 0002FFDF    mov         eax,dword ptr [ebx+4]
 0002FFE2    mov         ecx,20
 0002FFE7    call        BytesPerScanline
 0002FFEC    mov         ecx,eax
 0002FFEE    mov         eax,dword ptr [ebx+8]
 0002FFF1    cdq
 0002FFF2    xor         eax,edx
 0002FFF4    sub         eax,edx
 0002FFF6    imul        ecx,eax
 0002FFF9    mov         dword ptr [ebx+14],ecx
 0002FFFC    mov         eax,dword ptr [ebx+14]
 0002FFFF    cmp         esi,eax
>00030001    jbe         00030005
 00030003    mov         esi,eax
 00030005    cmp         byte ptr [ebp-21],0
>00030009    je          00030013
 0003000B    mov         eax,dword ptr [ebp-1C]
 0003000E    call        RGBTripleToQuad
 00030013    push        0
 00030015    call        user32.GetDC
 0003001A    call        GDICheck
 0003001F    mov         dword ptr [ebp-0C],eax
 00030022    xor         edx,edx
 00030024    push        ebp
 00030025    push        30217
 0003002A    push        dword ptr fs:[edx]
 0003002D    mov         dword ptr fs:[edx],esp
 00030030    mov         eax,dword ptr [ebp-38]
 00030033    mov         eax,dword ptr [eax+10]
 00030036    cmp         eax,1
>00030039    je          0003004D
 0003003B    cmp         eax,2
>0003003E    je          0003004D
 00030040    cmp         byte ptr ds:[0B43E4],0
>00030047    je          00030186
 0003004D    xor         eax,eax
 0003004F    mov         dword ptr [ebp-10],eax
 00030052    mov         eax,esi
 00030054    call        @GetMem
 00030059    mov         dword ptr [ebp-14],eax
 0003005C    xor         edx,edx
 0003005E    push        ebp
 0003005F    push        3017F
 00030064    push        dword ptr fs:[edx]
 00030067    mov         dword ptr fs:[edx],esp
 0003006A    mov         edx,dword ptr [ebp-14]
 0003006D    mov         ecx,esi
 0003006F    mov         eax,dword ptr [ebp-8]
 00030072    call        TStream.ReadBuffer
 00030077    mov         eax,dword ptr [ebp-0C]
 0003007A    push        eax
 0003007B    call        gdi32.CreateCompatibleDC
 00030080    call        GDICheck
 00030085    mov         dword ptr [ebp-10],eax
 00030088    push        1
 0003008A    push        1
 0003008C    mov         eax,dword ptr [ebp-0C]
 0003008F    push        eax
 00030090    call        gdi32.CreateCompatibleBitmap
 00030095    push        eax
 00030096    mov         eax,dword ptr [ebp-10]
 00030099    push        eax
 0003009A    call        gdi32.SelectObject
 0003009F    mov         dword ptr [ebp-2C],eax
 000300A2    xor         eax,eax
 000300A4    mov         dword ptr [ebp-34],eax
 000300A7    mov         eax,dword ptr [ebp-38]
 000300AA    mov         eax,dword ptr [eax+20]
 000300AD    test        eax,eax
>000300AF    jbe         000300DB
 000300B1    mov         ecx,eax
 000300B3    mov         edx,dword ptr [ebp-1C]
 000300B6    xor         eax,eax
 000300B8    call        PaletteFromDIBColorTable
 000300BD    mov         dword ptr [ebp-30],eax
 000300C0    push        0
 000300C2    mov         eax,dword ptr [ebp-30]
 000300C5    push        eax
 000300C6    mov         eax,dword ptr [ebp-10]
 000300C9    push        eax
 000300CA    call        gdi32.SelectPalette
 000300CF    mov         dword ptr [ebp-34],eax
 000300D2    mov         eax,dword ptr [ebp-10]
 000300D5    push        eax
 000300D6    call        gdi32.RealizePalette
 000300DB    xor         edx,edx
 000300DD    push        ebp
 000300DE    push        30153
 000300E3    push        dword ptr fs:[edx]
 000300E6    mov         dword ptr fs:[edx],esp
 000300E9    push        0
 000300EB    mov         eax,dword ptr [ebp-18]
 000300EE    push        eax
 000300EF    mov         edx,dword ptr [ebp-14]
 000300F2    push        edx
 000300F3    push        4
 000300F5    push        eax
 000300F6    mov         eax,dword ptr [ebp-10]
 000300F9    push        eax
 000300FA    call        gdi32.CreateDIBitmap
 000300FF    mov         dword ptr [ebp-28],eax
 00030102    cmp         dword ptr [ebp-28],0
>00030106    jne         0003011D
 00030108    call        kernel32.GetLastError
 0003010D    test        eax,eax
>0003010F    jne         00030118
 00030111    call        InvalidBitmap
>00030116    jmp         0003011D
 00030118    call        RaiseLastWin32Error
 0003011D    xor         eax,eax
 0003011F    pop         edx
 00030120    pop         ecx
 00030121    pop         ecx
 00030122    mov         dword ptr fs:[eax],edx
 00030125    push        3015A
 0003012A    cmp         dword ptr [ebp-34],0
>0003012E    je          0003013F
 00030130    push        0FF
 00030132    mov         eax,dword ptr [ebp-34]
 00030135    push        eax
 00030136    mov         eax,dword ptr [ebp-10]
 00030139    push        eax
 0003013A    call        gdi32.SelectPalette
 0003013F    mov         eax,dword ptr [ebp-2C]
 00030142    push        eax
 00030143    mov         eax,dword ptr [ebp-10]
 00030146    push        eax
 00030147    call        gdi32.SelectObject
 0003014C    push        eax
 0003014D    call        gdi32.DeleteObject
 00030152    ret
>00030153    jmp         @HandleFinally
>00030158    jmp         0003012A
 0003015A    xor         eax,eax
 0003015C    pop         edx
 0003015D    pop         ecx
 0003015E    pop         ecx
 0003015F    mov         dword ptr fs:[eax],edx
 00030162    push        301FE
 00030167    cmp         dword ptr [ebp-10],0
>0003016B    je          00030176
 0003016D    mov         eax,dword ptr [ebp-10]
 00030170    push        eax
 00030171    call        gdi32.DeleteDC
 00030176    mov         eax,dword ptr [ebp-14]
 00030179    call        @FreeMem
 0003017E    ret
>0003017F    jmp         @HandleFinally
>00030184    jmp         00030167
 00030186    push        0
 00030188    push        0
 0003018A    lea         eax,[ebp-14]
 0003018D    push        eax
 0003018E    push        0
 00030190    mov         eax,dword ptr [ebp-18]
 00030193    push        eax
 00030194    mov         eax,dword ptr [ebp-0C]
 00030197    push        eax
 00030198    call        gdi32.CreateDIBSection
 0003019D    mov         dword ptr [ebp-28],eax
 000301A0    cmp         dword ptr [ebp-28],0
>000301A4    je          000301AC
 000301A6    cmp         dword ptr [ebp-14],0
>000301AA    jne         000301C1
 000301AC    call        kernel32.GetLastError
 000301B1    test        eax,eax
>000301B3    jne         000301BC
 000301B5    call        InvalidBitmap
>000301BA    jmp         000301C1
 000301BC    call        RaiseLastWin32Error
 000301C1    xor         eax,eax
 000301C3    push        ebp
 000301C4    push        301E6
 000301C9    push        dword ptr fs:[eax]
 000301CC    mov         dword ptr fs:[eax],esp
 000301CF    mov         edx,dword ptr [ebp-14]
 000301D2    mov         ecx,esi
 000301D4    mov         eax,dword ptr [ebp-8]
 000301D7    call        TStream.ReadBuffer
 000301DC    xor         eax,eax
 000301DE    pop         edx
 000301DF    pop         ecx
 000301E0    pop         ecx
 000301E1    mov         dword ptr fs:[eax],edx
>000301E4    jmp         000301FE
>000301E6    jmp         @HandleAnyException
 000301EB    mov         eax,dword ptr [ebp-28]
 000301EE    push        eax
 000301EF    call        gdi32.DeleteObject
 000301F4    call        @RaiseAgain
 000301F9    call        @DoneExcept
 000301FE    xor         eax,eax
 00030200    pop         edx
 00030201    pop         ecx
 00030202    pop         ecx
 00030203    mov         dword ptr fs:[eax],edx
 00030206    push        3021E
 0003020B    mov         eax,dword ptr [ebp-0C]
 0003020E    push        eax
 0003020F    push        0
 00030211    call        user32.ReleaseDC
 00030216    ret
>00030217    jmp         @HandleFinally
>0003021C    jmp         0003020B
 0003021E    mov         eax,dword ptr [ebp-38]
 00030221    cmp         word ptr [eax+0E],8
>00030226    jbe         0003024A
 00030228    mov         eax,dword ptr [ebp-38]
 0003022B    cmp         dword ptr [eax+20],0
>0003022F    jbe         0003024A
 00030231    cmp         dword ptr [ebp-30],0
>00030235    jne         0003024A
 00030237    mov         eax,dword ptr [ebp-38]
 0003023A    mov         ecx,dword ptr [eax+20]
 0003023D    mov         edx,dword ptr [ebp-1C]
 00030240    xor         eax,eax
 00030242    call        PaletteFromDIBColorTable
 00030247    mov         dword ptr [ebp-30],eax
 0003024A    xor         eax,eax
 0003024C    pop         edx
 0003024D    pop         ecx
 0003024E    pop         ecx
 0003024F    mov         dword ptr fs:[eax],edx
 00030252    push        30267
 00030257    mov         eax,dword ptr [ebp-18]
 0003025A    call        @FreeMem
 0003025F    ret
>00030260    jmp         @HandleFinally
>00030265    jmp         00030257
 00030267    lea         eax,[ebp-98]
 0003026D    xor         ecx,ecx
 0003026F    mov         edx,54
 00030274    call        @FillChar
 00030279    lea         eax,[ebp-98]
 0003027F    push        eax
 00030280    push        54
 00030282    mov         eax,dword ptr [ebp-28]
 00030285    push        eax
 00030286    call        gdi32.GetObjectA
 0003028B    lea         eax,[ebp-98]
 00030291    push        eax
 00030292    mov         al,byte ptr [ebp-21]
 00030295    push        eax
 00030296    mov         ecx,dword ptr [ebp-30]
 00030299    mov         edx,dword ptr [ebp-28]
 0003029C    mov         eax,dword ptr [ebp-4]
 0003029F    call        TBitmap.NewImage
 000302A4    mov         eax,dword ptr [ebp-4]
 000302A7    mov         edx,dword ptr [eax]
 000302A9    call        dword ptr [edx+24]
 000302AC    test        eax,eax
 000302AE    setne       al
 000302B1    mov         edx,dword ptr [ebp-4]
 000302B4    mov         byte ptr [edx+16],al
 000302B7    mov         edx,dword ptr [ebp-4]
 000302BA    mov         eax,dword ptr [ebp-4]
 000302BD    mov         ecx,dword ptr [eax]
 000302BF    call        dword ptr [ecx+10]
 000302C2    pop         edi
 000302C3    pop         esi
 000302C4    pop         ebx
 000302C5    mov         esp,ebp
 000302C7    pop         ebp
 000302C8    ret
*}
end;

//000302CC
procedure TBitmap.ReadStream(Stream:TStream; Size:Longint);
begin
{*
 000302CC    push        ebx
 000302CD    push        esi
 000302CE    push        edi
 000302CF    add         esp,0FFFFFF9C
 000302D2    mov         esi,ecx
 000302D4    mov         edi,edx
 000302D6    mov         ebx,eax
 000302D8    mov         eax,ebx
 000302DA    call        TBitmap.FreeContext
 000302DF    test        esi,esi
>000302E1    jne         00030307
 000302E3    lea         eax,[esp+0E]
 000302E7    xor         ecx,ecx
 000302E9    mov         edx,54
 000302EE    call        @FillChar
 000302F3    lea         eax,[esp+0E]
 000302F7    push        eax
 000302F8    push        0
 000302FA    xor         ecx,ecx
 000302FC    xor         edx,edx
 000302FE    mov         eax,ebx
 00030300    call        TBitmap.NewImage
>00030305    jmp         00030330
 00030307    mov         edx,esp
 00030309    mov         ecx,0E
 0003030E    mov         eax,edi
 00030310    call        TStream.ReadBuffer
 00030315    cmp         word ptr [esp],4D42
>0003031B    je          00030322
 0003031D    call        InvalidBitmap
 00030322    mov         ecx,esi
 00030324    sub         ecx,0E
 00030327    mov         edx,edi
 00030329    mov         eax,ebx
 0003032B    call        TBitmap.ReadDIB
 00030330    add         esp,64
 00030333    pop         edi
 00030334    pop         esi
 00030335    pop         ebx
 00030336    ret
*}
end;

//00030338
procedure TBitmap.SetHandle(Value:HBITMAP);
begin
{*
 00030338    push        ebp
 00030339    mov         ebp,esp
 0003033B    add         esp,0FFFFFFA8
 0003033E    push        ebx
 0003033F    push        esi
 00030340    push        edi
 00030341    mov         edi,edx
 00030343    mov         ebx,eax
 00030345    mov         esi,dword ptr [ebx+18]
 00030348    cmp         edi,dword ptr [esi+8]
>0003034B    je          000303F1
 00030351    mov         eax,ebx
 00030353    call        TBitmap.FreeContext
 00030358    lea         eax,[ebp-58]
 0003035B    xor         ecx,ecx
 0003035D    mov         edx,54
 00030362    call        @FillChar
 00030367    test        edi,edi
>00030369    je          00030377
 0003036B    lea         eax,[ebp-58]
 0003036E    push        eax
 0003036F    push        54
 00030371    push        edi
 00030372    call        gdi32.GetObjectA
 00030377    cmp         dword ptr [esi+4],1
>0003037B    jne         0003038A
 0003037D    mov         eax,dword ptr [esi+10]
 00030380    mov         dword ptr [ebp-4],eax
 00030383    xor         eax,eax
 00030385    mov         dword ptr [esi+10],eax
>00030388    jmp         000303A7
 0003038A    mov         eax,dword ptr [esi+10]
 0003038D    cmp         eax,dword ptr ds:[0B6634]
>00030393    jne         0003039F
 00030395    mov         eax,[000B6634]
 0003039A    mov         dword ptr [ebp-4],eax
>0003039D    jmp         000303A7
 0003039F    call        CopyPalette
 000303A4    mov         dword ptr [ebp-4],eax
 000303A7    xor         eax,eax
 000303A9    push        ebp
 000303AA    push        303D1
 000303AF    push        dword ptr fs:[eax]
 000303B2    mov         dword ptr fs:[eax],esp
 000303B5    lea         eax,[ebp-58]
 000303B8    push        eax
 000303B9    push        0
 000303BB    mov         ecx,dword ptr [ebp-4]
 000303BE    mov         edx,edi
 000303C0    mov         eax,ebx
 000303C2    call        TBitmap.NewImage
 000303C7    xor         eax,eax
 000303C9    pop         edx
 000303CA    pop         ecx
 000303CB    pop         ecx
 000303CC    mov         dword ptr fs:[eax],edx
>000303CF    jmp         000303E8
>000303D1    jmp         @HandleAnyException
 000303D6    mov         eax,dword ptr [ebp-4]
 000303D9    call        InternalDeletePalette
 000303DE    call        @RaiseAgain
 000303E3    call        @DoneExcept
 000303E8    mov         edx,ebx
 000303EA    mov         eax,ebx
 000303EC    mov         ecx,dword ptr [eax]
 000303EE    call        dword ptr [ecx+10]
 000303F1    pop         edi
 000303F2    pop         esi
 000303F3    pop         ebx
 000303F4    mov         esp,ebp
 000303F6    pop         ebp
 000303F7    ret
*}
end;

//000303F8
procedure TBitmap.SetHandleType(Value:TBitmapHandleType);
begin
{*
 000303F8    push        ebx
 000303F9    push        esi
 000303FA    push        edi
 000303FB    push        ebp
 000303FC    add         esp,0FFFFFFAC
 000303FF    mov         ebx,edx
 00030401    mov         esi,eax
 00030403    mov         eax,esi
 00030405    call        TBitmap.GetHandleType
 0003040A    cmp         bl,al
>0003040C    je          00030524
 00030412    mov         edi,dword ptr [esi+18]
 00030415    cmp         dword ptr [edi+8],0
>00030419    jne         0003043C
 0003041B    cmp         dword ptr [edi+14],0
>0003041F    jne         0003043C
 00030421    cmp         bl,1
>00030424    jne         00030430
 00030426    xor         eax,eax
 00030428    mov         dword ptr [edi+30],eax
>0003042B    jmp         00030524
 00030430    mov         dword ptr [edi+30],28
>00030437    jmp         00030524
 0003043C    test        bl,bl
>0003043E    jne         000304A6
 00030440    mov         eax,dword ptr [edi+14]
 00030443    test        eax,eax
>00030445    je          00030450
 00030447    cmp         eax,dword ptr [edi+8]
>0003044A    je          00030524
 00030450    mov         eax,esi
 00030452    call        TBitmap.FreeContext
 00030457    mov         eax,esi
 00030459    call        TBitmap.PaletteNeeded
 0003045E    mov         eax,esi
 00030460    call        TBitmap.DIBNeeded
 00030465    cmp         dword ptr [edi+4],1
>00030469    jne         00030493
 0003046B    mov         eax,dword ptr [edi+14]
 0003046E    xor         edx,edx
 00030470    mov         dword ptr [edi+14],edx
 00030473    mov         ebp,dword ptr [edi+10]
 00030476    xor         edx,edx
 00030478    mov         dword ptr [edi+10],edx
 0003047B    lea         edx,[edi+18]
 0003047E    push        edx
 0003047F    mov         dl,byte ptr [edi+6C]
 00030482    push        edx
 00030483    mov         ecx,ebp
 00030485    mov         edx,eax
 00030487    mov         eax,esi
 00030489    call        TBitmap.NewImage
>0003048E    jmp         0003051B
 00030493    lea         eax,[edi+18]
 00030496    push        eax
 00030497    mov         ecx,dword ptr [edi+10]
 0003049A    mov         edx,dword ptr [edi+14]
 0003049D    mov         eax,esi
 0003049F    call        TBitmap.CopyImage
>000304A4    jmp         0003051B
 000304A6    mov         eax,dword ptr [edi+8]
 000304A9    test        eax,eax
>000304AB    je          000304B2
 000304AD    cmp         eax,dword ptr [edi+14]
>000304B0    jne         00030524
 000304B2    mov         eax,esi
 000304B4    call        TBitmap.FreeContext
 000304B9    mov         eax,esi
 000304BB    call        TBitmap.PaletteNeeded
 000304C0    push        esi
 000304C1    push        edi
 000304C2    lea         esi,[edi+18]
 000304C5    lea         edi,[esp+8]
 000304C9    mov         ecx,15
 000304CE    rep movs    dword ptr [edi],dword ptr [esi]
 000304D0    pop         edi
 000304D1    pop         esi
 000304D2    xor         eax,eax
 000304D4    mov         dword ptr [esp+18],eax
 000304D8    cmp         dword ptr [edi+4],1
 000304DC    sete        bl
 000304DF    test        bl,bl
>000304E1    je          000304E8
 000304E3    mov         ebp,dword ptr [edi+10]
>000304E6    jmp         000304F2
 000304E8    mov         eax,dword ptr [edi+10]
 000304EB    call        CopyPalette
 000304F0    mov         ebp,eax
 000304F2    push        esp
 000304F3    push        0
 000304F5    mov         ecx,ebp
 000304F7    mov         edx,dword ptr [edi+10]
 000304FA    mov         eax,dword ptr [edi+14]
 000304FD    call        CopyBitmap
 00030502    test        bl,bl
>00030504    je          0003050B
 00030506    mov         dword ptr [edi+8],eax
>00030509    jmp         0003051B
 0003050B    push        esp
 0003050C    mov         dl,byte ptr [edi+6C]
 0003050F    push        edx
 00030510    mov         ecx,ebp
 00030512    mov         edx,eax
 00030514    mov         eax,esi
 00030516    call        TBitmap.NewImage
 0003051B    mov         edx,esi
 0003051D    mov         eax,esi
 0003051F    mov         ecx,dword ptr [eax]
 00030521    call        dword ptr [ecx+10]
 00030524    add         esp,54
 00030527    pop         ebp
 00030528    pop         edi
 00030529    pop         esi
 0003052A    pop         ebx
 0003052B    ret
*}
end;

//0003052C
procedure TBitmap.SetHeight(Value:Integer);
begin
{*
 0003052C    push        ebx
 0003052D    push        esi
 0003052E    push        edi
 0003052F    add         esp,0FFFFFFAC
 00030532    mov         edi,edx
 00030534    mov         ebx,eax
 00030536    mov         esi,dword ptr [ebx+18]
 00030539    cmp         edi,dword ptr [esi+20]
>0003053C    je          00030576
 0003053E    mov         eax,ebx
 00030540    call        TBitmap.HandleNeeded
 00030545    push        esi
 00030546    push        edi
 00030547    add         esi,18
 0003054A    lea         edi,[esp+8]
 0003054E    mov         ecx,15
 00030553    rep movs    dword ptr [edi],dword ptr [esi]
 00030555    pop         edi
 00030556    pop         esi
 00030557    mov         dword ptr [esp+8],edi
 0003055B    mov         dword ptr [esp+20],edi
 0003055F    push        esp
 00030560    mov         ecx,dword ptr [esi+10]
 00030563    mov         edx,dword ptr [esi+8]
 00030566    mov         eax,ebx
 00030568    call        TBitmap.CopyImage
 0003056D    mov         edx,ebx
 0003056F    mov         eax,ebx
 00030571    mov         ecx,dword ptr [eax]
 00030573    call        dword ptr [ecx+10]
 00030576    add         esp,54
 00030579    pop         edi
 0003057A    pop         esi
 0003057B    pop         ebx
 0003057C    ret
*}
end;

//00030580
procedure TBitmap.SetMonochrome(Value:Boolean);
begin
{*
 00030580    push        ebx
 00030581    push        esi
 00030582    push        edi
 00030583    add         esp,0FFFFFFAC
 00030586    mov         ebx,edx
 00030588    mov         edi,eax
 0003058A    mov         esi,dword ptr [edi+18]
 0003058D    lea         eax,[esi+30]
 00030590    cmp         word ptr [eax+0C],1
>00030595    jne         0003059E
 00030597    cmp         word ptr [eax+0E],1
>0003059C    je          000305A2
 0003059E    xor         eax,eax
>000305A0    jmp         000305A4
 000305A2    mov         al,1
 000305A4    cmp         bl,al
>000305A6    je          000305F6
 000305A8    mov         eax,edi
 000305AA    call        TBitmap.HandleNeeded
 000305AF    push        esi
 000305B0    push        edi
 000305B1    add         esi,18
 000305B4    lea         edi,[esp+8]
 000305B8    mov         ecx,15
 000305BD    rep movs    dword ptr [edi],dword ptr [esi]
 000305BF    pop         edi
 000305C0    pop         esi
 000305C1    xor         eax,eax
 000305C3    mov         dword ptr [esp+18],eax
 000305C7    xor         eax,eax
 000305C9    mov         al,bl
 000305CB    mov         word ptr [esp+24],ax
 000305D0    mov         word ptr [esp+26],ax
 000305D5    mov         word ptr [esp+10],ax
 000305DA    mov         word ptr [esp+12],ax
 000305DF    push        esp
 000305E0    mov         ecx,dword ptr [esi+10]
 000305E3    mov         edx,dword ptr [esi+8]
 000305E6    mov         eax,edi
 000305E8    call        TBitmap.CopyImage
 000305ED    mov         edx,edi
 000305EF    mov         eax,edi
 000305F1    mov         ecx,dword ptr [eax]
 000305F3    call        dword ptr [ecx+10]
 000305F6    add         esp,54
 000305F9    pop         edi
 000305FA    pop         esi
 000305FB    pop         ebx
 000305FC    ret
*}
end;

//00030600
procedure TBitmap.SetPalette(Value:HPALETTE);
begin
{*
 00030600    push        ebp
 00030601    mov         ebp,esp
 00030603    add         esp,0FFFFFFA8
 00030606    push        ebx
 00030607    push        esi
 00030608    push        edi
 00030609    mov         edi,edx
 0003060B    mov         ebx,eax
 0003060D    mov         eax,dword ptr [ebx+18]
 00030610    cmp         edi,dword ptr [eax+10]
>00030613    je          000306CA
 00030619    mov         esi,eax
 0003061B    test        edi,edi
>0003061D    jne         00030634
 0003061F    cmp         dword ptr [esi+4],1
>00030623    jne         00030634
 00030625    mov         eax,dword ptr [esi+10]
 00030628    call        InternalDeletePalette
 0003062D    xor         eax,eax
 0003062F    mov         dword ptr [esi+10],eax
>00030632    jmp         000306AD
 00030634    mov         eax,ebx
 00030636    call        TBitmap.FreeContext
 0003063B    mov         eax,ebx
 0003063D    call        TBitmap.HandleNeeded
 00030642    push        esi
 00030643    push        edi
 00030644    add         esi,18
 00030647    lea         edi,[ebp-58]
 0003064A    mov         ecx,15
 0003064F    rep movs    dword ptr [edi],dword ptr [esi]
 00030651    pop         edi
 00030652    pop         esi
 00030653    lea         eax,[ebp-58]
 00030656    push        eax
 00030657    push        0
 00030659    mov         edx,dword ptr [esi+10]
 0003065C    mov         eax,dword ptr [esi+8]
 0003065F    mov         ecx,edi
 00030661    call        CopyBitmap
 00030666    mov         dword ptr [ebp-4],eax
 00030669    xor         eax,eax
 0003066B    push        ebp
 0003066C    push        30695
 00030671    push        dword ptr fs:[eax]
 00030674    mov         dword ptr fs:[eax],esp
 00030677    lea         eax,[ebp-58]
 0003067A    push        eax
 0003067B    mov         al,byte ptr [esi+6C]
 0003067E    push        eax
 0003067F    mov         ecx,edi
 00030681    mov         edx,dword ptr [ebp-4]
 00030684    mov         eax,ebx
 00030686    call        TBitmap.NewImage
 0003068B    xor         eax,eax
 0003068D    pop         edx
 0003068E    pop         ecx
 0003068F    pop         ecx
 00030690    mov         dword ptr fs:[eax],edx
>00030693    jmp         000306AD
>00030695    jmp         @HandleAnyException
 0003069A    mov         eax,dword ptr [ebp-4]
 0003069D    push        eax
 0003069E    call        gdi32.DeleteObject
 000306A3    call        @RaiseAgain
 000306A8    call        @DoneExcept
 000306AD    mov         eax,dword ptr [ebx+18]
 000306B0    lea         ecx,[eax+18]
 000306B3    mov         eax,dword ptr [eax+14]
 000306B6    mov         edx,edi
 000306B8    call        UpdateDIBColorTable
 000306BD    mov         byte ptr [ebx+16],1
 000306C1    mov         edx,ebx
 000306C3    mov         eax,ebx
 000306C5    mov         ecx,dword ptr [eax]
 000306C7    call        dword ptr [ecx+10]
 000306CA    pop         edi
 000306CB    pop         esi
 000306CC    pop         ebx
 000306CD    mov         esp,ebp
 000306CF    pop         ebp
 000306D0    ret
*}
end;

//000306D4
procedure TBitmap.SetTransparentColor(Value:TColor);
begin
{*
 000306D4    push        ebx
 000306D5    push        esi
 000306D6    mov         esi,eax
 000306D8    cmp         edx,dword ptr [esi+24]
>000306DB    je          0003071E
 000306DD    cmp         edx,20000000
>000306E3    jne         000306EB
 000306E5    mov         byte ptr [esi+28],0
>000306E9    jmp         000306EF
 000306EB    mov         byte ptr [esi+28],1
 000306EF    mov         dword ptr [esi+24],edx
 000306F2    mov         eax,dword ptr [esi+18]
 000306F5    cmp         dword ptr [eax+4],1
>000306F9    jle         00030715
 000306FB    mov         ebx,eax
 000306FD    mov         eax,esi
 000306FF    call        TBitmap.HandleNeeded
 00030704    lea         eax,[ebx+18]
 00030707    push        eax
 00030708    mov         ecx,dword ptr [ebx+10]
 0003070B    mov         edx,dword ptr [ebx+8]
 0003070E    mov         eax,esi
 00030710    call        TBitmap.CopyImage
 00030715    mov         edx,esi
 00030717    mov         eax,esi
 00030719    mov         ecx,dword ptr [eax]
 0003071B    call        dword ptr [ecx+10]
 0003071E    pop         esi
 0003071F    pop         ebx
 00030720    ret
*}
end;

//00030724
procedure TBitmap.SetWidth(Value:Integer);
begin
{*
 00030724    push        ebx
 00030725    push        esi
 00030726    push        edi
 00030727    add         esp,0FFFFFFAC
 0003072A    mov         edi,edx
 0003072C    mov         ebx,eax
 0003072E    mov         esi,dword ptr [ebx+18]
 00030731    cmp         edi,dword ptr [esi+1C]
>00030734    je          0003076E
 00030736    mov         eax,ebx
 00030738    call        TBitmap.HandleNeeded
 0003073D    push        esi
 0003073E    push        edi
 0003073F    add         esi,18
 00030742    lea         edi,[esp+8]
 00030746    mov         ecx,15
 0003074B    rep movs    dword ptr [edi],dword ptr [esi]
 0003074D    pop         edi
 0003074E    pop         esi
 0003074F    mov         dword ptr [esp+4],edi
 00030753    mov         dword ptr [esp+1C],edi
 00030757    push        esp
 00030758    mov         ecx,dword ptr [esi+10]
 0003075B    mov         edx,dword ptr [esi+8]
 0003075E    mov         eax,ebx
 00030760    call        TBitmap.CopyImage
 00030765    mov         edx,ebx
 00030767    mov         eax,ebx
 00030769    mov         ecx,dword ptr [eax]
 0003076B    call        dword ptr [ecx+10]
 0003076E    add         esp,54
 00030771    pop         edi
 00030772    pop         esi
 00030773    pop         ebx
 00030774    ret
*}
end;

//00030778
procedure TBitmap.WriteData(Stream:TStream);
begin
{*
 00030778    mov         cl,1
 0003077A    call        TBitmap.WriteStream
 0003077F    ret
*}
end;

//00030780
procedure TBitmap.WriteStream(Stream:TStream; WriteSize:Boolean);
begin
{*
 00030780    push        ebx
 00030781    push        esi
 00030782    push        edi
 00030783    push        ebp
 00030784    add         esp,0FFFFFBD4
 0003078A    mov         byte ptr [esp],cl
 0003078D    mov         edi,edx
 0003078F    mov         esi,eax
 00030791    mov         eax,esi
 00030793    call        TBitmap.DIBNeeded
 00030798    mov         ebp,dword ptr [esi+18]
 0003079B    xor         eax,eax
 0003079D    mov         dword ptr [esp+4],eax
 000307A1    mov         eax,dword ptr [ebp+14]
 000307A4    test        eax,eax
>000307A6    je          000307EA
 000307A8    push        0
 000307AA    lea         ecx,[esp+8]
 000307AE    lea         edx,[esp+10]
 000307B2    call        InternalGetDIBSizes
 000307B7    cmp         byte ptr [ebp+6C],0
>000307BB    je          000307DF
 000307BD    mov         dword ptr [esp+0C],0C
 000307C5    mov         ax,word ptr [ebp+3E]
 000307C9    cmp         ax,8
>000307CD    ja          000307DF
 000307CF    mov         ecx,eax
 000307D1    mov         eax,1
 000307D6    shl         eax,cl
 000307D8    lea         eax,[eax+eax*2]
 000307DB    add         dword ptr [esp+0C],eax
 000307DF    mov         eax,dword ptr [esp+0C]
 000307E3    add         eax,0E
 000307E6    add         dword ptr [esp+4],eax
 000307EA    cmp         dword ptr [esp+4],0
>000307EF    je          000308B4
 000307F5    lea         eax,[esp+10]
 000307F9    xor         ecx,ecx
 000307FB    mov         edx,0E
 00030800    call        @FillChar
 00030805    mov         word ptr [esp+10],4D42
 0003080C    mov         eax,dword ptr [esp+4]
 00030810    mov         dword ptr [esp+12],eax
 00030814    mov         eax,dword ptr [esp+0C]
 00030818    add         eax,0E
 0003081B    mov         dword ptr [esp+1A],eax
 0003081F    mov         eax,esi
 00030821    call        TBitmap.GetCanvas
 00030826    mov         dl,byte ptr ds:[309D0]
 0003082C    call        TCanvas.RequiredState
 00030831    mov         eax,dword ptr [ebp+14]
 00030834    push        eax
 00030835    mov         eax,dword ptr [esi+1C]
 00030838    mov         eax,dword ptr [eax+4]
 0003083B    push        eax
 0003083C    call        gdi32.SelectObject
 00030841    call        GDICheck
 00030846    mov         ebx,eax
 00030848    lea         eax,[esp+2A]
 0003084C    push        eax
 0003084D    push        100
 00030852    push        0
 00030854    mov         eax,dword ptr [esi+1C]
 00030857    mov         eax,dword ptr [eax+4]
 0003085A    push        eax
 0003085B    call        gdi32.GetDIBColorTable
 00030860    mov         dword ptr [esp+8],eax
 00030864    push        ebx
 00030865    mov         eax,dword ptr [esi+1C]
 00030868    mov         eax,dword ptr [eax+4]
 0003086B    push        eax
 0003086C    call        gdi32.SelectObject
 00030871    cmp         dword ptr [esp+8],0
>00030876    jne         000308B4
 00030878    cmp         dword ptr [ebp+10],0
>0003087C    je          000308B4
 0003087E    cmp         byte ptr [ebp+6D],0
>00030882    jne         000308B4
 00030884    lea         edx,[esp+2A]
 00030888    mov         ecx,0FF
 0003088D    mov         eax,dword ptr [ebp+10]
 00030890    call        PaletteToDIBColorTable
 00030895    mov         dword ptr [esp+8],eax
 00030899    cmp         word ptr [ebp+3E],8
>0003089E    jbe         000308B4
 000308A0    xor         eax,eax
 000308A2    mov         al,byte ptr [ebp+6C]
 000308A5    movzx       eax,byte ptr [eax+0B4628]
 000308AC    imul        dword ptr [esp+8]
 000308B0    add         dword ptr [esp+4],eax
 000308B4    cmp         byte ptr [esp],0
>000308B8    je          000308CA
 000308BA    lea         edx,[esp+4]
 000308BE    mov         ecx,4
 000308C3    mov         eax,edi
 000308C5    call        TStream.WriteBuffer
 000308CA    cmp         dword ptr [esp+4],0
>000308CF    je          000309C5
 000308D5    lea         eax,[ebp+18]
 000308D8    call        FixupBitFields
 000308DD    cmp         dword ptr [esp+8],0
>000308E2    je          0003090B
 000308E4    mov         eax,dword ptr [ebp+50]
 000308E7    test        eax,eax
>000308E9    je          000308F1
 000308EB    cmp         eax,dword ptr [esp+8]
>000308EF    je          000308F8
 000308F1    mov         eax,dword ptr [esp+8]
 000308F5    mov         dword ptr [ebp+50],eax
 000308F8    cmp         byte ptr [ebp+6C],0
>000308FC    je          0003090B
 000308FE    lea         edx,[esp+8]
 00030902    lea         eax,[esp+2A]
 00030906    call        RGBQuadToTriple
 0003090B    cmp         byte ptr [ebp+6C],0
>0003090F    je          00030960
 00030911    lea         eax,[ebp+30]
 00030914    mov         dword ptr [esp+1E],0C
 0003091C    mov         dx,word ptr [eax+4]
 00030920    mov         word ptr [esp+22],dx
 00030925    mov         dx,word ptr [eax+8]
 00030929    mov         word ptr [esp+24],dx
 0003092E    mov         word ptr [esp+26],1
 00030935    mov         ax,word ptr [eax+0E]
 00030939    mov         word ptr [esp+28],ax
 0003093E    lea         edx,[esp+10]
 00030942    mov         ecx,0E
 00030947    mov         eax,edi
 00030949    call        TStream.WriteBuffer
 0003094E    lea         edx,[esp+1E]
 00030952    mov         ecx,0C
 00030957    mov         eax,edi
 00030959    call        TStream.WriteBuffer
>0003095E    jmp         0003099B
 00030960    lea         edx,[esp+10]
 00030964    mov         ecx,0E
 00030969    mov         eax,edi
 0003096B    call        TStream.WriteBuffer
 00030970    lea         edx,[ebp+30]
 00030973    mov         ecx,28
 00030978    mov         eax,edi
 0003097A    call        TStream.WriteBuffer
 0003097F    cmp         word ptr [ebp+3E],8
>00030984    jbe         0003099B
 00030986    test        byte ptr [ebp+40],3
>0003098A    je          0003099B
 0003098C    lea         edx,[ebp+58]
 0003098F    mov         ecx,0C
 00030994    mov         eax,edi
 00030996    call        TStream.WriteBuffer
 0003099B    xor         eax,eax
 0003099D    mov         al,byte ptr [ebp+6C]
 000309A0    xor         ecx,ecx
 000309A2    mov         cl,byte ptr [eax+0B4628]
 000309A8    imul        ecx,dword ptr [esp+8]
 000309AD    lea         edx,[esp+2A]
 000309B1    mov         eax,edi
 000309B3    call        TStream.WriteBuffer
 000309B8    mov         edx,dword ptr [ebp+2C]
 000309BB    mov         ecx,dword ptr [ebp+44]
 000309BE    mov         eax,edi
 000309C0    call        TStream.WriteBuffer
 000309C5    add         esp,42C
 000309CB    pop         ebp
 000309CC    pop         edi
 000309CD    pop         esi
 000309CE    pop         ebx
 000309CF    ret
*}
end;

//000309D4
procedure TBitmap.SaveToStream(Stream:TStream);
begin
{*
 000309D4    xor         ecx,ecx
 000309D6    call        TBitmap.WriteStream
 000309DB    ret
*}
end;

//000309DC
procedure TBitmap.SaveToClipboardFormat(var Format:Word; var Data:THandle; var APalette:HPALETTE);
begin
{*
 000309DC    push        ebp
 000309DD    mov         ebp,esp
 000309DF    add         esp,0FFFFFFA8
 000309E2    push        ebx
 000309E3    push        esi
 000309E4    push        edi
 000309E5    mov         dword ptr [ebp-4],ecx
 000309E8    mov         ebx,eax
 000309EA    mov         word ptr [edx],2
 000309EF    mov         eax,ebx
 000309F1    call        TBitmap.HandleNeeded
 000309F6    mov         esi,dword ptr [ebx+18]
 000309F9    push        esi
 000309FA    add         esi,18
 000309FD    lea         edi,[ebp-58]
 00030A00    mov         ecx,15
 00030A05    rep movs    dword ptr [edi],dword ptr [esi]
 00030A07    pop         esi
 00030A08    xor         eax,eax
 00030A0A    mov         dword ptr [ebp-40],eax
 00030A0D    xor         eax,eax
 00030A0F    mov         dword ptr [ebp-44],eax
 00030A12    lea         eax,[ebp-58]
 00030A15    push        eax
 00030A16    mov         eax,dword ptr [ebx+1C]
 00030A19    push        eax
 00030A1A    mov         edi,dword ptr [esi+10]
 00030A1D    mov         ecx,edi
 00030A1F    mov         edx,edi
 00030A21    mov         eax,dword ptr [esi+8]
 00030A24    call        CopyBitmap
 00030A29    mov         edx,dword ptr [ebp-4]
 00030A2C    mov         dword ptr [edx],eax
 00030A2E    xor         eax,eax
 00030A30    push        ebp
 00030A31    push        30A56
 00030A36    push        dword ptr fs:[eax]
 00030A39    mov         dword ptr fs:[eax],esp
 00030A3C    mov         eax,dword ptr [ebx+18]
 00030A3F    mov         eax,dword ptr [eax+10]
 00030A42    call        CopyPalette
 00030A47    mov         edx,dword ptr [ebp+8]
 00030A4A    mov         dword ptr [edx],eax
 00030A4C    xor         eax,eax
 00030A4E    pop         edx
 00030A4F    pop         ecx
 00030A50    pop         ecx
 00030A51    mov         dword ptr fs:[eax],edx
>00030A54    jmp         00030A70
>00030A56    jmp         @HandleAnyException
 00030A5B    mov         eax,dword ptr [ebp-4]
 00030A5E    mov         eax,dword ptr [eax]
 00030A60    push        eax
 00030A61    call        gdi32.DeleteObject
 00030A66    call        @RaiseAgain
 00030A6B    call        @DoneExcept
 00030A70    pop         edi
 00030A71    pop         esi
 00030A72    pop         ebx
 00030A73    mov         esp,ebp
 00030A75    pop         ebp
 00030A76    ret         4
*}
end;

//00030A7C
destructor TIconImage.Destroy;
begin
{*
 00030A7C    push        ebx
 00030A7D    push        esi
 00030A7E    call        @BeforeDestruction
 00030A83    mov         ebx,edx
 00030A85    mov         esi,eax
 00030A87    mov         eax,dword ptr [esi+0C]
 00030A8A    call        TObject.Free
 00030A8F    mov         edx,ebx
 00030A91    and         dl,0FC
 00030A94    mov         eax,esi
 00030A96    call        TObject.Destroy
 00030A9B    test        bl,bl
>00030A9D    jle         00030AA6
 00030A9F    mov         eax,esi
 00030AA1    call        @ClassDestroy
 00030AA6    pop         esi
 00030AA7    pop         ebx
 00030AA8    ret
*}
end;

//00030AAC
procedure TIconImage.FreeHandle;
begin
{*
 00030AAC    push        ebx
 00030AAD    mov         ebx,eax
 00030AAF    mov         eax,dword ptr [ebx+8]
 00030AB2    test        eax,eax
>00030AB4    je          00030ABC
 00030AB6    push        eax
 00030AB7    call        user32.DestroyIcon
 00030ABC    xor         eax,eax
 00030ABE    mov         dword ptr [ebx+8],eax
 00030AC1    pop         ebx
 00030AC2    ret
*}
end;

//00030AC4
constructor TIcon.Create;
begin
{*
 00030AC4    push        ebx
 00030AC5    push        esi
 00030AC6    push        edi
 00030AC7    test        dl,dl
>00030AC9    je          00030AD3
 00030ACB    add         esp,0FFFFFFF0
 00030ACE    call        @ClassCreate
 00030AD3    mov         ebx,edx
 00030AD5    mov         edi,eax
 00030AD7    xor         edx,edx
 00030AD9    mov         eax,edi
 00030ADB    call        TGraphic.Create
 00030AE0    mov         byte ptr [edi+15],1
 00030AE4    mov         dl,1
 00030AE6    mov         eax,[00029054];TIconImage
 00030AEB    call        TObject.Create
 00030AF0    mov         esi,eax
 00030AF2    mov         dword ptr [edi+18],esi
 00030AF5    mov         eax,esi
 00030AF7    call        TSharedImage.Reference
 00030AFC    mov         eax,edi
 00030AFE    test        bl,bl
>00030B00    je          00030B11
 00030B02    call        @AfterConstruction
 00030B07    pop         dword ptr fs:[0]
 00030B0E    add         esp,0C
 00030B11    mov         eax,edi
 00030B13    pop         edi
 00030B14    pop         esi
 00030B15    pop         ebx
 00030B16    ret
*}
end;

//00030B18
destructor TIcon.Destroy;
begin
{*
 00030B18    push        ebx
 00030B19    push        esi
 00030B1A    call        @BeforeDestruction
 00030B1F    mov         ebx,edx
 00030B21    mov         esi,eax
 00030B23    mov         eax,dword ptr [esi+18];TIcon...FImage:TIconImage
 00030B26    call        TSharedImage.Release
 00030B2B    mov         edx,ebx
 00030B2D    and         dl,0FC
 00030B30    mov         eax,esi
 00030B32    call        TMemoryStream.Destroy
 00030B37    test        bl,bl
>00030B39    jle         00030B42
 00030B3B    mov         eax,esi
 00030B3D    call        @ClassDestroy
 00030B42    pop         esi
 00030B43    pop         ebx
 00030B44    ret
*}
end;

//00030B48
procedure TIcon.Assign(Source:TPersistent);
begin
{*
 00030B48    push        ebx
 00030B49    push        esi
 00030B4A    push        edi
 00030B4B    mov         ebx,edx
 00030B4D    mov         esi,eax
 00030B4F    test        ebx,ebx
>00030B51    je          00030B64
 00030B53    mov         eax,ebx
 00030B55    mov         edx,dword ptr ds:[290B0];TIcon
 00030B5B    call        @IsClass
 00030B60    test        al,al
>00030B62    je          00030B98
 00030B64    test        ebx,ebx
>00030B66    je          00030B82
 00030B68    mov         edi,ebx
 00030B6A    mov         eax,dword ptr [edi+18]
 00030B6D    call        TSharedImage.Reference
 00030B72    mov         eax,dword ptr [esi+18]
 00030B75    call        TSharedImage.Release
 00030B7A    mov         eax,dword ptr [edi+18]
 00030B7D    mov         dword ptr [esi+18],eax
>00030B80    jmp         00030B8D
 00030B82    xor         ecx,ecx
 00030B84    xor         edx,edx
 00030B86    mov         eax,esi
 00030B88    call        TIcon.NewImage
 00030B8D    mov         edx,esi
 00030B8F    mov         eax,esi
 00030B91    mov         ecx,dword ptr [eax]
 00030B93    call        dword ptr [ecx+10]
>00030B96    jmp         00030BA1
 00030B98    mov         edx,ebx
 00030B9A    mov         eax,esi
 00030B9C    call        TPersistent.Assign
 00030BA1    pop         edi
 00030BA2    pop         esi
 00030BA3    pop         ebx
 00030BA4    ret
*}
end;

//00030BA8
procedure TIcon.Draw(ACanvas:TCanvas; const Rect:TRect);
begin
{*
 00030BA8    push        ebx
 00030BA9    push        esi
 00030BAA    push        edi
 00030BAB    mov         edi,ecx
 00030BAD    mov         esi,edx
 00030BAF    mov         ebx,eax
 00030BB1    mov         dl,byte ptr ds:[30BDC]
 00030BB7    mov         eax,esi
 00030BB9    call        TCanvas.RequiredState
 00030BBE    mov         eax,ebx
 00030BC0    call        TIcon.GetHandle
 00030BC5    push        eax
 00030BC6    mov         eax,dword ptr [edi+4]
 00030BC9    push        eax
 00030BCA    mov         eax,dword ptr [edi]
 00030BCC    push        eax
 00030BCD    mov         eax,dword ptr [esi+4]
 00030BD0    push        eax
 00030BD1    call        user32.DrawIcon
 00030BD6    pop         edi
 00030BD7    pop         esi
 00030BD8    pop         ebx
 00030BD9    ret
*}
end;

//00030BE0
function TIcon.GetEmpty:Boolean;
begin
{*
 00030BE0    mov         eax,dword ptr [eax+18]
 00030BE3    cmp         dword ptr [eax+8],0
>00030BE7    jne         00030BEF
 00030BE9    cmp         dword ptr [eax+0C],0
>00030BED    je          00030BF2
 00030BEF    xor         eax,eax
 00030BF1    ret
 00030BF2    mov         al,1
 00030BF4    ret
*}
end;

//00030BF8
function TIcon.GetHandle:HICON;
begin
{*
 00030BF8    push        ebx
 00030BF9    mov         ebx,eax
 00030BFB    mov         eax,ebx
 00030BFD    call        TIcon.HandleNeeded
 00030C02    mov         eax,dword ptr [ebx+18]
 00030C05    mov         eax,dword ptr [eax+8]
 00030C08    pop         ebx
 00030C09    ret
*}
end;

//00030C0C
function TIcon.GetHeight:Integer;
begin
{*
 00030C0C    push        0C
 00030C0E    call        user32.GetSystemMetrics
 00030C13    ret
*}
end;

//00030C14
function TIcon.GetWidth:Integer;
begin
{*
 00030C14    push        0B
 00030C16    call        user32.GetSystemMetrics
 00030C1B    ret
*}
end;

//00030C1C
procedure TIcon.HandleNeeded;
begin
{*
 00030C1C    push        ebx
 00030C1D    add         esp,0FFFFFFF4
 00030C20    mov         ebx,dword ptr [eax+18]
 00030C23    cmp         dword ptr [ebx+8],0
>00030C27    jne         00030C81
 00030C29    mov         eax,dword ptr [ebx+0C]
 00030C2C    test        eax,eax
>00030C2E    je          00030C81
 00030C30    xor         edx,edx
 00030C32    call        TStream.SetPosition
 00030C37    mov         edx,esp
 00030C39    mov         ecx,6
 00030C3E    mov         eax,dword ptr [ebx+0C]
 00030C41    call        TStream.ReadBuffer
 00030C46    mov         ax,word ptr [esp+2]
 00030C4B    sub         ax,1
>00030C4F    jb          00030C55
>00030C51    je          00030C60
>00030C53    jmp         00030C75
 00030C55    mov         eax,[000B664C]
 00030C5A    mov         dword ptr [esp+8],eax
>00030C5E    jmp         00030C7A
 00030C60    push        6
 00030C62    movzx       ecx,word ptr [esp+8]
 00030C67    lea         edx,[esp+0C]
 00030C6B    mov         eax,dword ptr [ebx+0C]
 00030C6E    call        ReadIcon
>00030C73    jmp         00030C7A
 00030C75    call        InvalidIcon
 00030C7A    mov         eax,dword ptr [esp+8]
 00030C7E    mov         dword ptr [ebx+8],eax
 00030C81    add         esp,0C
 00030C84    pop         ebx
 00030C85    ret
*}
end;

//00030C88
procedure TIcon.ImageNeeded;
begin
{*
 00030C88    push        ebp
 00030C89    mov         ebp,esp
 00030C8B    add         esp,0FFFFFFF4
 00030C8E    push        ebx
 00030C8F    push        esi
 00030C90    push        edi
 00030C91    mov         esi,eax
 00030C93    mov         ebx,dword ptr [esi+18]
 00030C96    cmp         dword ptr [ebx+0C],0
>00030C9A    jne         00030D32
 00030CA0    cmp         dword ptr [ebx+8],0
>00030CA4    jne         00030CAB
 00030CA6    call        InvalidIcon
 00030CAB    mov         dl,1
 00030CAD    mov         eax,[0001F5E8];TMemoryStream
 00030CB2    call        TObject.Create
 00030CB7    mov         dword ptr [ebp-4],eax
 00030CBA    xor         eax,eax
 00030CBC    push        ebp
 00030CBD    push        30D15
 00030CC2    push        dword ptr fs:[eax]
 00030CC5    mov         dword ptr fs:[eax],esp
 00030CC8    mov         eax,esi
 00030CCA    call        TIcon.GetHandle
 00030CCF    cmp         eax,dword ptr ds:[0B664C]
>00030CD5    jne         00030CF8
 00030CD7    lea         eax,[ebp-0A]
 00030CDA    xor         ecx,ecx
 00030CDC    mov         edx,6
 00030CE1    call        @FillChar
 00030CE6    lea         edx,[ebp-0A]
 00030CE9    mov         ecx,6
 00030CEE    mov         eax,dword ptr [ebp-4]
 00030CF1    call        TStream.WriteBuffer
>00030CF6    jmp         00030D0B
 00030CF8    mov         eax,esi
 00030CFA    call        TIcon.GetHandle
 00030CFF    mov         edx,eax
 00030D01    xor         ecx,ecx
 00030D03    mov         eax,dword ptr [ebp-4]
 00030D06    call        WriteIcon
 00030D0B    xor         eax,eax
 00030D0D    pop         edx
 00030D0E    pop         ecx
 00030D0F    pop         ecx
 00030D10    mov         dword ptr fs:[eax],edx
>00030D13    jmp         00030D2C
>00030D15    jmp         @HandleAnyException
 00030D1A    mov         eax,dword ptr [ebp-4]
 00030D1D    call        TObject.Free
 00030D22    call        @RaiseAgain
 00030D27    call        @DoneExcept
 00030D2C    mov         eax,dword ptr [ebp-4]
 00030D2F    mov         dword ptr [ebx+0C],eax
 00030D32    pop         edi
 00030D33    pop         esi
 00030D34    pop         ebx
 00030D35    mov         esp,ebp
 00030D37    pop         ebp
 00030D38    ret
*}
end;

//00030D3C
procedure TIcon.LoadFromStream(Stream:TStream);
begin
{*
 00030D3C    push        ebp
 00030D3D    mov         ebp,esp
 00030D3F    add         esp,0FFFFFFF4
 00030D42    push        ebx
 00030D43    push        esi
 00030D44    push        edi
 00030D45    mov         esi,edx
 00030D47    mov         ebx,eax
 00030D49    mov         dl,1
 00030D4B    mov         eax,[0001F5E8];TMemoryStream
 00030D50    call        TObject.Create
 00030D55    mov         dword ptr [ebp-4],eax
 00030D58    xor         eax,eax
 00030D5A    push        ebp
 00030D5B    push        30DCB
 00030D60    push        dword ptr fs:[eax]
 00030D63    mov         dword ptr fs:[eax],esp
 00030D66    mov         eax,esi
 00030D68    call        TStream.GetSize
 00030D6D    push        eax
 00030D6E    mov         eax,esi
 00030D70    call        TStream.GetPosition
 00030D75    pop         edx
 00030D76    sub         edx,eax
 00030D78    mov         eax,dword ptr [ebp-4]
 00030D7B    mov         ecx,dword ptr [eax]
 00030D7D    call        dword ptr [ecx]
 00030D7F    mov         eax,dword ptr [ebp-4]
 00030D82    call        TStream.GetSize
 00030D87    mov         ecx,eax
 00030D89    mov         eax,dword ptr [ebp-4]
 00030D8C    mov         edx,dword ptr [eax+4]
 00030D8F    mov         eax,esi
 00030D91    call        TStream.ReadBuffer
 00030D96    lea         edx,[ebp-0A]
 00030D99    mov         ecx,6
 00030D9E    mov         eax,dword ptr [ebp-4]
 00030DA1    call        TStream.ReadBuffer
 00030DA6    mov         ax,word ptr [ebp-8]
 00030DAA    sub         ax,2
>00030DAE    jb          00030DB5
 00030DB0    call        InvalidIcon
 00030DB5    mov         ecx,dword ptr [ebp-4]
 00030DB8    xor         edx,edx
 00030DBA    mov         eax,ebx
 00030DBC    call        TIcon.NewImage
 00030DC1    xor         eax,eax
 00030DC3    pop         edx
 00030DC4    pop         ecx
 00030DC5    pop         ecx
 00030DC6    mov         dword ptr fs:[eax],edx
>00030DC9    jmp         00030DE2
>00030DCB    jmp         @HandleAnyException
 00030DD0    mov         eax,dword ptr [ebp-4]
 00030DD3    call        TObject.Free
 00030DD8    call        @RaiseAgain
 00030DDD    call        @DoneExcept
 00030DE2    mov         edx,ebx
 00030DE4    mov         eax,ebx
 00030DE6    mov         ecx,dword ptr [eax]
 00030DE8    call        dword ptr [ecx+10]
 00030DEB    pop         edi
 00030DEC    pop         esi
 00030DED    pop         ebx
 00030DEE    mov         esp,ebp
 00030DF0    pop         ebp
 00030DF1    ret
*}
end;

//00030DF4
procedure TIcon.NewImage(NewHandle:HICON; NewImage:TMemoryStream);
begin
{*
 00030DF4    push        ebp
 00030DF5    mov         ebp,esp
 00030DF7    push        ecx
 00030DF8    push        ebx
 00030DF9    push        esi
 00030DFA    push        edi
 00030DFB    mov         edi,ecx
 00030DFD    mov         esi,edx
 00030DFF    mov         ebx,eax
 00030E01    mov         dl,1
 00030E03    mov         eax,[00029054];TIconImage
 00030E08    call        TObject.Create
 00030E0D    mov         dword ptr [ebp-4],eax
 00030E10    xor         eax,eax
 00030E12    push        ebp
 00030E13    push        30E34
 00030E18    push        dword ptr fs:[eax]
 00030E1B    mov         dword ptr fs:[eax],esp
 00030E1E    mov         eax,dword ptr [ebp-4]
 00030E21    mov         dword ptr [eax+8],esi
 00030E24    mov         eax,dword ptr [ebp-4]
 00030E27    mov         dword ptr [eax+0C],edi
 00030E2A    xor         eax,eax
 00030E2C    pop         edx
 00030E2D    pop         ecx
 00030E2E    pop         ecx
 00030E2F    mov         dword ptr fs:[eax],edx
>00030E32    jmp         00030E4B
>00030E34    jmp         @HandleAnyException
 00030E39    mov         eax,dword ptr [ebp-4]
 00030E3C    call        TObject.Free
 00030E41    call        @RaiseAgain
 00030E46    call        @DoneExcept
 00030E4B    mov         eax,dword ptr [ebp-4]
 00030E4E    call        TSharedImage.Reference
 00030E53    mov         eax,dword ptr [ebx+18]
 00030E56    call        TSharedImage.Release
 00030E5B    mov         eax,dword ptr [ebp-4]
 00030E5E    mov         dword ptr [ebx+18],eax
 00030E61    pop         edi
 00030E62    pop         esi
 00030E63    pop         ebx
 00030E64    pop         ecx
 00030E65    pop         ebp
 00030E66    ret
*}
end;

//00030E68
procedure TIcon.SetHandle(Value:HICON);
begin
{*
 00030E68    push        ebx
 00030E69    mov         ebx,eax
 00030E6B    xor         ecx,ecx
 00030E6D    mov         eax,ebx
 00030E6F    call        TIcon.NewImage
 00030E74    mov         edx,ebx
 00030E76    mov         eax,ebx
 00030E78    mov         ecx,dword ptr [eax]
 00030E7A    call        dword ptr [ecx+10]
 00030E7D    pop         ebx
 00030E7E    ret
*}
end;

//00030E80
procedure TIcon.SetHeight(Value:Integer);
begin
{*
 00030E80    push        ebp
 00030E81    mov         ebp,esp
 00030E83    push        0
 00030E85    xor         eax,eax
 00030E87    push        ebp
 00030E88    push        30EBE
 00030E8D    push        dword ptr fs:[eax]
 00030E90    mov         dword ptr fs:[eax],esp
 00030E93    lea         edx,[ebp-4]
 00030E96    mov         eax,[000B57B8];^SChangeIconSize:TResStringRec
 00030E9B    call        LoadResString
 00030EA0    mov         eax,dword ptr [ebp-4]
 00030EA3    call        InvalidOperation
 00030EA8    xor         eax,eax
 00030EAA    pop         edx
 00030EAB    pop         ecx
 00030EAC    pop         ecx
 00030EAD    mov         dword ptr fs:[eax],edx
 00030EB0    push        30EC5
 00030EB5    lea         eax,[ebp-4]
 00030EB8    call        @LStrClr
 00030EBD    ret
>00030EBE    jmp         @HandleFinally
>00030EC3    jmp         00030EB5
 00030EC5    pop         ecx
 00030EC6    pop         ebp
 00030EC7    ret
*}
end;

//00030EC8
procedure TIcon.SetTransparent(Value:Boolean);
begin
{*
 00030EC8    ret
*}
end;

//00030ECC
procedure TIcon.SetWidth(Value:Integer);
begin
{*
 00030ECC    push        ebp
 00030ECD    mov         ebp,esp
 00030ECF    push        0
 00030ED1    xor         eax,eax
 00030ED3    push        ebp
 00030ED4    push        30F0A
 00030ED9    push        dword ptr fs:[eax]
 00030EDC    mov         dword ptr fs:[eax],esp
 00030EDF    lea         edx,[ebp-4]
 00030EE2    mov         eax,[000B57B8];^SChangeIconSize:TResStringRec
 00030EE7    call        LoadResString
 00030EEC    mov         eax,dword ptr [ebp-4]
 00030EEF    call        InvalidOperation
 00030EF4    xor         eax,eax
 00030EF6    pop         edx
 00030EF7    pop         ecx
 00030EF8    pop         ecx
 00030EF9    mov         dword ptr fs:[eax],edx
 00030EFC    push        30F11
 00030F01    lea         eax,[ebp-4]
 00030F04    call        @LStrClr
 00030F09    ret
>00030F0A    jmp         @HandleFinally
>00030F0F    jmp         00030F01
 00030F11    pop         ecx
 00030F12    pop         ebp
 00030F13    ret
*}
end;

//00030F14
procedure TIcon.SaveToStream(Stream:TStream);
begin
{*
 00030F14    push        ebx
 00030F15    push        esi
 00030F16    mov         esi,edx
 00030F18    mov         ebx,eax
 00030F1A    mov         eax,ebx
 00030F1C    call        TIcon.ImageNeeded
 00030F21    mov         eax,dword ptr [ebx+18]
 00030F24    mov         ebx,dword ptr [eax+0C]
 00030F27    mov         eax,ebx
 00030F29    call        TStream.GetSize
 00030F2E    mov         ecx,eax
 00030F30    mov         edx,dword ptr [ebx+4]
 00030F33    mov         eax,esi
 00030F35    call        TStream.WriteBuffer
 00030F3A    pop         esi
 00030F3B    pop         ebx
 00030F3C    ret
*}
end;

//00030F40
procedure TIcon.LoadFromClipboardFormat(AFormat:Word; AData:THandle; APalette:HPALETTE);
begin
{*
 00030F40    push        ebp
 00030F41    mov         ebp,esp
 00030F43    push        0
 00030F45    push        ebx
 00030F46    xor         eax,eax
 00030F48    push        ebp
 00030F49    push        30F7F
 00030F4E    push        dword ptr fs:[eax]
 00030F51    mov         dword ptr fs:[eax],esp
 00030F54    lea         edx,[ebp-4]
 00030F57    mov         eax,[000B5654];^SIconToClipboard:TResStringRec
 00030F5C    call        LoadResString
 00030F61    mov         eax,dword ptr [ebp-4]
 00030F64    call        InvalidOperation
 00030F69    xor         eax,eax
 00030F6B    pop         edx
 00030F6C    pop         ecx
 00030F6D    pop         ecx
 00030F6E    mov         dword ptr fs:[eax],edx
 00030F71    push        30F86
 00030F76    lea         eax,[ebp-4]
 00030F79    call        @LStrClr
 00030F7E    ret
>00030F7F    jmp         @HandleFinally
>00030F84    jmp         00030F76
 00030F86    pop         ebx
 00030F87    pop         ecx
 00030F88    pop         ebp
 00030F89    ret         4
*}
end;

//00030F8C
procedure TIcon.SaveToClipboardFormat(var Format:Word; var Data:THandle; var APalette:HPALETTE);
begin
{*
 00030F8C    push        ebp
 00030F8D    mov         ebp,esp
 00030F8F    push        0
 00030F91    push        ebx
 00030F92    xor         eax,eax
 00030F94    push        ebp
 00030F95    push        30FCB
 00030F9A    push        dword ptr fs:[eax]
 00030F9D    mov         dword ptr fs:[eax],esp
 00030FA0    lea         edx,[ebp-4]
 00030FA3    mov         eax,[000B5654];^SIconToClipboard:TResStringRec
 00030FA8    call        LoadResString
 00030FAD    mov         eax,dword ptr [ebp-4]
 00030FB0    call        InvalidOperation
 00030FB5    xor         eax,eax
 00030FB7    pop         edx
 00030FB8    pop         ecx
 00030FB9    pop         ecx
 00030FBA    mov         dword ptr fs:[eax],edx
 00030FBD    push        30FD2
 00030FC2    lea         eax,[ebp-4]
 00030FC5    call        @LStrClr
 00030FCA    ret
>00030FCB    jmp         @HandleFinally
>00030FD0    jmp         00030FC2
 00030FD2    pop         ebx
 00030FD3    pop         ecx
 00030FD4    pop         ebp
 00030FD5    ret         4
*}
end;

//00030FD8
procedure InitScreenLogPixels;
begin
{*
 00030FD8    push        ebx
 00030FD9    push        0
 00030FDB    call        user32.GetDC
 00030FE0    mov         ebx,eax
 00030FE2    push        5A
 00030FE4    push        ebx
 00030FE5    call        gdi32.GetDeviceCaps
 00030FEA    mov         [000B663C],eax
 00030FEF    push        ebx
 00030FF0    push        0
 00030FF2    call        user32.ReleaseDC
 00030FF7    mov         eax,0B462C
 00030FFC    mov         edx,0F
 00031001    call        CreateSystemPalette
 00031006    mov         [000B6634],eax
 0003100B    pop         ebx
 0003100C    ret
*}
end;

//00031010
function GetDefFontCharSet:TFontCharset;
begin
{*
 00031010    push        ebx
 00031011    push        esi
 00031012    add         esp,0FFFFFFC8
 00031015    mov         bl,1
 00031017    push        0
 00031019    call        user32.GetDC
 0003101E    mov         esi,eax
 00031020    test        esi,esi
>00031022    je          0003104B
 00031024    mov         eax,[000B6648]
 00031029    push        eax
 0003102A    push        esi
 0003102B    call        gdi32.SelectObject
 00031030    test        eax,eax
>00031032    je          00031043
 00031034    push        esp
 00031035    push        esi
 00031036    call        gdi32.GetTextMetricsA
 0003103B    test        eax,eax
>0003103D    je          00031043
 0003103F    mov         bl,byte ptr [esp+34]
 00031043    push        esi
 00031044    push        0
 00031046    call        user32.ReleaseDC
 0003104B    mov         eax,ebx
 0003104D    add         esp,38
 00031050    pop         esi
 00031051    pop         ebx
 00031052    ret
*}
end;

//00031054
procedure InitDefFontData;
begin
{*
 00031054    push        ebx
 00031055    push        esi
 00031056    push        edi
 00031057    push        48
 00031059    mov         eax,[000B663C]
 0003105E    push        eax
 0003105F    push        8
 00031061    call        kernel32.MulDiv
 00031066    neg         eax
 00031068    mov         [000B43BC],eax
 0003106D    mov         eax,[000B5C08];SysLocale:TSysLocale
 00031072    cmp         byte ptr [eax+8],0
>00031076    je          000310B2
 00031078    call        GetDefFontCharSet
 0003107D    mov         ebx,eax
 0003107F    mov         eax,ebx
 00031081    sub         al,80
>00031083    jne         000310B2
 00031085    mov         esi,310B8
 0003108A    mov         edi,0B43C3
 0003108F    mov         ecx,4
 00031094    rep movs    dword ptr [edi],dword ptr [esi]
 00031096    push        48
 00031098    mov         eax,[000B663C]
 0003109D    push        eax
 0003109E    push        9
 000310A0    call        kernel32.MulDiv
 000310A5    neg         eax
 000310A7    mov         [000B43BC],eax
 000310AC    mov         byte ptr ds:[0B43C2],bl
 000310B2    pop         edi
 000310B3    pop         esi
 000310B4    pop         ebx
 000310B5    ret
*}
end;

//00031124
constructor TPatternManager.Create;
begin
{*
 00031124    push        ebx
 00031125    push        esi
 00031126    test        dl,dl
>00031128    je          00031132
 0003112A    add         esp,0FFFFFFF0
 0003112D    call        @ClassCreate
 00031132    mov         ebx,edx
 00031134    mov         esi,eax
 00031136    lea         eax,[esi+8]
 00031139    push        eax
 0003113A    call        kernel32.InitializeCriticalSection
 0003113F    mov         eax,esi
 00031141    test        bl,bl
>00031143    je          00031154
 00031145    call        @AfterConstruction
 0003114A    pop         dword ptr fs:[0]
 00031151    add         esp,0C
 00031154    mov         eax,esi
 00031156    pop         esi
 00031157    pop         ebx
 00031158    ret
*}
end;

//0003115C
destructor TPatternManager.Destroy;
begin
{*
 0003115C    push        ebx
 0003115D    push        esi
 0003115E    call        @BeforeDestruction
 00031163    mov         ebx,edx
 00031165    mov         esi,eax
 00031167    mov         eax,esi
 00031169    call        TPatternManager.FreePatterns
 0003116E    lea         eax,[esi+8]
 00031171    push        eax
 00031172    call        kernel32.DeleteCriticalSection
 00031177    test        bl,bl
>00031179    jle         00031182
 0003117B    mov         eax,esi
 0003117D    call        @ClassDestroy
 00031182    pop         esi
 00031183    pop         ebx
 00031184    ret
*}
end;

//00031188
procedure TPatternManager.Lock;
begin
{*
 00031188    add         eax,8
 0003118B    push        eax
 0003118C    call        kernel32.EnterCriticalSection
 00031191    ret
*}
end;

//00031194
procedure TPatternManager.Unlock;
begin
{*
 00031194    add         eax,8
 00031197    push        eax
 00031198    call        kernel32.LeaveCriticalSection
 0003119D    ret
*}
end;

//000311A0
function TPatternManager.AllocPattern(BkColor:TColorRef; FgColor:TColorRef):PPattern;
begin
{*
 000311A0    push        ebp
 000311A1    mov         ebp,esp
 000311A3    add         esp,0FFFFFFF8
 000311A6    push        ebx
 000311A7    push        esi
 000311A8    push        edi
 000311A9    mov         esi,ecx
 000311AB    mov         ebx,edx
 000311AD    mov         dword ptr [ebp-4],eax
 000311B0    mov         eax,dword ptr [ebp-4]
 000311B3    call        TPatternManager.Lock
 000311B8    xor         eax,eax
 000311BA    push        ebp
 000311BB    push        31241
 000311C0    push        dword ptr fs:[eax]
 000311C3    mov         dword ptr fs:[eax],esp
 000311C6    mov         eax,dword ptr [ebp-4]
 000311C9    mov         eax,dword ptr [eax+4]
 000311CC    mov         dword ptr [ebp-8],eax
>000311CF    jmp         000311D9
 000311D1    mov         eax,dword ptr [ebp-8]
 000311D4    mov         eax,dword ptr [eax]
 000311D6    mov         dword ptr [ebp-8],eax
 000311D9    cmp         dword ptr [ebp-8],0
>000311DD    je          000311EF
 000311DF    mov         eax,dword ptr [ebp-8]
 000311E2    cmp         ebx,dword ptr [eax+8]
>000311E5    jne         000311D1
 000311E7    mov         eax,dword ptr [ebp-8]
 000311EA    cmp         esi,dword ptr [eax+0C]
>000311ED    jne         000311D1
 000311EF    cmp         dword ptr [ebp-8],0
>000311F3    jne         0003122B
 000311F5    mov         eax,10
 000311FA    call        @GetMem
 000311FF    mov         dword ptr [ebp-8],eax
 00031202    mov         edi,dword ptr [ebp-8]
 00031205    mov         eax,dword ptr [ebp-4]
 00031208    mov         eax,dword ptr [eax+4]
 0003120B    mov         dword ptr [edi],eax
 0003120D    mov         ecx,esi
 0003120F    mov         edx,ebx
 00031211    mov         eax,dword ptr [ebp-4]
 00031214    call        TPatternManager.CreateBitmap
 00031219    mov         dword ptr [edi+4],eax
 0003121C    mov         dword ptr [edi+8],ebx
 0003121F    mov         dword ptr [edi+0C],esi
 00031222    mov         eax,dword ptr [ebp-4]
 00031225    mov         edx,dword ptr [ebp-8]
 00031228    mov         dword ptr [eax+4],edx
 0003122B    xor         eax,eax
 0003122D    pop         edx
 0003122E    pop         ecx
 0003122F    pop         ecx
 00031230    mov         dword ptr fs:[eax],edx
 00031233    push        31248
 00031238    mov         eax,dword ptr [ebp-4]
 0003123B    call        TPatternManager.Unlock
 00031240    ret
>00031241    jmp         @HandleFinally
>00031246    jmp         00031238
 00031248    mov         eax,dword ptr [ebp-8]
 0003124B    pop         edi
 0003124C    pop         esi
 0003124D    pop         ebx
 0003124E    pop         ecx
 0003124F    pop         ecx
 00031250    pop         ebp
 00031251    ret
*}
end;

//00031254
function TPatternManager.CreateBitmap(BkColor:TColor; FgColor:TColor):TBitmap;
begin
{*
 00031254    push        ebp
 00031255    mov         ebp,esp
 00031257    add         esp,0FFFFFFE8
 0003125A    push        ebx
 0003125B    push        esi
 0003125C    push        edi
 0003125D    mov         dword ptr [ebp-4],ecx
 00031260    mov         ebx,edx
 00031262    mov         dl,1
 00031264    mov         eax,[00028F70];TBitmap
 00031269    call        TBitmap.Create
 0003126E    mov         dword ptr [ebp-8],eax
 00031271    xor         eax,eax
 00031273    push        ebp
 00031274    push        31333
 00031279    push        dword ptr fs:[eax]
 0003127C    mov         dword ptr fs:[eax],esp
 0003127F    mov         edx,8
 00031284    mov         eax,dword ptr [ebp-8]
 00031287    mov         ecx,dword ptr [eax]
 00031289    call        dword ptr [ecx+40]
 0003128C    mov         edx,8
 00031291    mov         eax,dword ptr [ebp-8]
 00031294    mov         ecx,dword ptr [eax]
 00031296    call        dword ptr [ecx+34]
 00031299    mov         eax,dword ptr [ebp-8]
 0003129C    call        TBitmap.GetCanvas
 000312A1    mov         edi,eax
 000312A3    mov         eax,dword ptr [edi+14]
 000312A6    xor         edx,edx
 000312A8    call        TBrush.SetStyle
 000312AD    mov         eax,dword ptr [edi+14]
 000312B0    mov         edx,ebx
 000312B2    call        TBrush.SetColor
 000312B7    mov         eax,dword ptr [ebp-8]
 000312BA    mov         edx,dword ptr [eax]
 000312BC    call        dword ptr [edx+20]
 000312BF    push        eax
 000312C0    lea         eax,[ebp-18]
 000312C3    push        eax
 000312C4    mov         eax,dword ptr [ebp-8]
 000312C7    mov         edx,dword ptr [eax]
 000312C9    call        dword ptr [edx+2C]
 000312CC    mov         ecx,eax
 000312CE    xor         edx,edx
 000312D0    xor         eax,eax
 000312D2    call        Rect
 000312D7    lea         edx,[ebp-18]
 000312DA    mov         eax,edi
 000312DC    call        TCanvas.FillRect
 000312E1    xor         esi,esi
 000312E3    xor         ebx,ebx
 000312E5    mov         eax,esi
 000312E7    and         eax,80000001
>000312EC    jns         000312F3
 000312EE    dec         eax
 000312EF    or          eax,0FFFFFFFE
 000312F2    inc         eax
 000312F3    mov         edx,ebx
 000312F5    and         edx,80000001
>000312FB    jns         00031302
 000312FD    dec         edx
 000312FE    or          edx,0FFFFFFFE
 00031301    inc         edx
 00031302    cmp         eax,edx
>00031304    jne         00031315
 00031306    mov         eax,dword ptr [ebp-4]
 00031309    push        eax
 0003130A    mov         ecx,esi
 0003130C    mov         edx,ebx
 0003130E    mov         eax,edi
 00031310    call        TCanvas.SetPixel
 00031315    inc         ebx
 00031316    cmp         ebx,9
>00031319    jne         000312E5
 0003131B    inc         esi
 0003131C    cmp         esi,9
>0003131F    jne         000312E3
 00031321    mov         eax,dword ptr [ebp-8]
 00031324    call        TBitmap.Dormant
 00031329    xor         eax,eax
 0003132B    pop         edx
 0003132C    pop         ecx
 0003132D    pop         ecx
 0003132E    mov         dword ptr fs:[eax],edx
>00031331    jmp         0003134A
>00031333    jmp         @HandleAnyException
 00031338    mov         eax,dword ptr [ebp-8]
 0003133B    call        TObject.Free
 00031340    call        @RaiseAgain
 00031345    call        @DoneExcept
 0003134A    mov         eax,dword ptr [ebp-8]
 0003134D    pop         edi
 0003134E    pop         esi
 0003134F    pop         ebx
 00031350    mov         esp,ebp
 00031352    pop         ebp
 00031353    ret
*}
end;

//00031354
procedure TPatternManager.FreePatterns;
begin
{*
 00031354    push        ebp
 00031355    mov         ebp,esp
 00031357    add         esp,0FFFFFFF4
 0003135A    mov         dword ptr [ebp-4],eax
>0003135D    jmp         000313BD
 0003135F    mov         dword ptr [ebp-8],eax
 00031362    mov         eax,dword ptr [ebp-8]
 00031365    mov         dword ptr [ebp-0C],eax
 00031368    mov         eax,dword ptr [ebp-4]
 0003136B    call        TPatternManager.Lock
 00031370    xor         eax,eax
 00031372    push        ebp
 00031373    push        3139F
 00031378    push        dword ptr fs:[eax]
 0003137B    mov         dword ptr fs:[eax],esp
 0003137E    mov         eax,dword ptr [ebp-0C]
 00031381    mov         eax,dword ptr [eax]
 00031383    mov         edx,dword ptr [ebp-4]
 00031386    mov         dword ptr [edx+4],eax
 00031389    xor         eax,eax
 0003138B    pop         edx
 0003138C    pop         ecx
 0003138D    pop         ecx
 0003138E    mov         dword ptr fs:[eax],edx
 00031391    push        313A6
 00031396    mov         eax,dword ptr [ebp-4]
 00031399    call        TPatternManager.Unlock
 0003139E    ret
>0003139F    jmp         @HandleFinally
>000313A4    jmp         00031396
 000313A6    mov         eax,dword ptr [ebp-0C]
 000313A9    mov         eax,dword ptr [eax+4]
 000313AC    test        eax,eax
>000313AE    je          000313B5
 000313B0    call        TObject.Free
 000313B5    mov         eax,dword ptr [ebp-8]
 000313B8    call        @FreeMem
 000313BD    mov         eax,dword ptr [ebp-4]
 000313C0    mov         eax,dword ptr [eax+4]
 000313C3    test        eax,eax
>000313C5    jne         0003135F
 000313C7    mov         esp,ebp
 000313C9    pop         ebp
 000313CA    ret
*}
end;

//000313CC
function AllocPatternBitmap(BkColor:TColor; FgColor:TColor):TBitmap;
begin
{*
 000313CC    push        ebx
 000313CD    push        esi
 000313CE    mov         esi,edx
 000313D0    mov         ebx,eax
 000313D2    cmp         dword ptr ds:[0B6690],0
>000313D9    je          000313FD
 000313DB    mov         eax,esi
 000313DD    call        ColorToRGB
 000313E2    push        eax
 000313E3    mov         eax,ebx
 000313E5    call        ColorToRGB
 000313EA    mov         edx,eax
 000313EC    mov         eax,[000B6690]
 000313F1    pop         ecx
 000313F2    call        TPatternManager.AllocPattern
 000313F7    mov         eax,dword ptr [eax+4]
 000313FA    pop         esi
 000313FB    pop         ebx
 000313FC    ret
 000313FD    xor         eax,eax
 000313FF    pop         esi
 00031400    pop         ebx
 00031401    ret
*}
end;

Initialization
//000314D8
{*
 000314D8    sub         dword ptr ds:[0B6638],1
>000314DF    jae         000315D2
 000314E5    call        InitScreenLogPixels
 000314EA    push        0B6650
 000314EF    call        kernel32.InitializeCriticalSection
 000314F4    push        0B6668
 000314F9    call        kernel32.InitializeCriticalSection
 000314FE    push        7
 00031500    call        gdi32.GetStockObject
 00031505    mov         [000B6640],eax
 0003150A    push        5
 0003150C    call        gdi32.GetStockObject
 00031511    mov         [000B6644],eax
 00031516    push        0D
 00031518    call        gdi32.GetStockObject
 0003151D    mov         [000B6648],eax
 00031522    push        7F00
 00031527    push        0
 00031529    call        user32.LoadIconA
 0003152E    mov         [000B664C],eax
 00031533    call        InitDefFontData
 00031538    mov         cx,2C
 0003153C    mov         dl,1
 0003153E    mov         eax,[00029198];TResourceManager
 00031543    call        TResourceManager.Create
 00031548    mov         [000B6680],eax
 0003154D    mov         cx,10
 00031551    mov         dl,1
 00031553    mov         eax,[00029198];TResourceManager
 00031558    call        TResourceManager.Create
 0003155D    mov         [000B6684],eax
 00031562    mov         cx,10
 00031566    mov         dl,1
 00031568    mov         eax,[00029198];TResourceManager
 0003156D    call        TResourceManager.Create
 00031572    mov         [000B6688],eax
 00031577    mov         dl,1
 00031579    mov         eax,[000310C8];TPatternManager
 0003157E    call        TPatternManager.Create
 00031583    mov         [000B6690],eax
 00031588    mov         dl,1
 0003158A    mov         eax,[0001EF28];TThreadList
 0003158F    call        TThreadList.Create
 00031594    mov         [000B4620],eax
 00031599    mov         dl,1
 0003159B    mov         eax,[0001EF28];TThreadList
 000315A0    call        TThreadList.Create
 000315A5    mov         [000B668C],eax
 000315AA    mov         ecx,299F8;ColorToIdent:Boolean
 000315AF    mov         edx,29A08;IdentToColor:Boolean
 000315B4    mov         eax,[00028320];TColor
 000315B9    call        RegisterIntegerConsts
 000315BE    mov         ecx,29C00;CharsetToIdent:Boolean
 000315C3    mov         edx,29C10;IdentToCharset:Boolean
 000315C8    mov         eax,[00028448];TFontCharset
 000315CD    call        RegisterIntegerConsts
 000315D2    ret
*}
Finalization
//00031404
{*
 00031404    push        ebp
 00031405    mov         ebp,esp
 00031407    xor         eax,eax
 00031409    push        ebp
 0003140A    push        314CD
 0003140F    push        dword ptr fs:[eax]
 00031412    mov         dword ptr fs:[eax],esp
 00031415    inc         dword ptr ds:[0B6638]
>0003141B    jne         000314BF
 00031421    mov         eax,[000B6690]
 00031426    call        TObject.Free
 0003142B    mov         eax,[000B461C]
 00031430    call        TObject.Free
 00031435    mov         eax,[000B4618]
 0003143A    call        TObject.Free
 0003143F    call        FreeMemoryContexts
 00031444    mov         eax,[000B4620]
 00031449    call        TObject.Free
 0003144E    mov         eax,[000B668C]
 00031453    call        TObject.Free
 00031458    mov         eax,[000B6680]
 0003145D    call        TObject.Free
 00031462    mov         eax,[000B6684]
 00031467    call        TObject.Free
 0003146C    mov         eax,[000B6688]
 00031471    call        TObject.Free
 00031476    mov         eax,[000B6634]
 0003147B    push        eax
 0003147C    call        gdi32.DeleteObject
 00031481    push        0B6650
 00031486    call        kernel32.DeleteCriticalSection
 0003148B    push        0B6668
 00031490    call        kernel32.DeleteCriticalSection
 00031495    mov         eax,0B4538
 0003149A    mov         ecx,12
 0003149F    mov         edx,dword ptr ds:[1FCC0];TIdentMapEntry
 000314A5    call        @FinalizeArray
 000314AA    mov         eax,0B43E8
 000314AF    mov         ecx,2A
 000314B4    mov         edx,dword ptr ds:[1FCC0];TIdentMapEntry
 000314BA    call        @FinalizeArray
 000314BF    xor         eax,eax
 000314C1    pop         edx
 000314C2    pop         ecx
 000314C3    pop         ecx
 000314C4    mov         dword ptr fs:[eax],edx
 000314C7    push        314D4
 000314CC    ret
>000314CD    jmp         @HandleFinally
>000314D2    jmp         000314CC
 000314D4    pop         ebp
 000314D5    ret
*}
end.