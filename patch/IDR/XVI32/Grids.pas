//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit Grids;

interface

uses
  SysUtils, Classes, Grids;

type
  EInvalidGridOperation = class(Exception)
  end;
  TInplaceEdit = class(TCustomMaskEdit)
  public
    FGrid:TCustomGrid;//f220
    FClickTime:Longint;//f224
    constructor Create(AOwner:TComponent); virtual;//v2C//0007F6C0
    procedure WndProc(var Message:TMessage); virtual;//v70//0007FC74
    procedure CreateParams(var Params:TCreateParams); virtual;//v94//0007F720
    function EditCanModify:Boolean; virtual;//vD8//0007F80C
    procedure BoundsChanged; virtual;//vEC//0007FEA8
    procedure UpdateContents; virtual;//vF0//0007FF10
    procedure WMGetDlgCode(var Message:TWMGetDlgCode); message WM_GETDLGCODE;//0007F73C
    procedure WMCut(var Message:void ); message WM_CUT;//0007F7A4
    procedure WMPaste(var Message:void ); message WM_PASTE;//0007F764
    procedure WMClear(var Message:void ); message WM_CLEAR;//0007F784
    procedure CMShowingChanged(var Message:TMessage); message CM_SHOWINGCHANGED;//0007F738
    procedure KeyPress(var Key:Char); dynamic;//0007FB70
    procedure KeyUp(var Key:Word; Shift:TShiftState); dynamic;//0007FC58
    procedure KeyDown(var Key:Word; Shift:TShiftState); dynamic;//0007F964
    procedure DoMouseWheel(Shift:TShiftState; WheelDelta:Integer; MousePos:TPoint); dynamic;//0007F7D8
    procedure DblClick; dynamic;//0007F7C4
    procedure SetGrid(Value:TCustomGrid);//0007F730
    procedure Deselect;//0007FCEC
    procedure Invalidate;//0007FD0C
    procedure Hide;//0007FD90
    procedure InternalMove(const Loc:TRect; Redraw:Boolean);//0007FDF8
    procedure UpdateLoc(const Loc:TRect);//0007FF00
    procedure Move(const Loc:TRect);//0007FF08
  end;
  TGridOption = (goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goRowSizing, goColSizing, goRowMoving, goColMoving, goEditing, goTabs, goRowSelect, goAlwaysShowEditor, goThumbTracking);
  TGridOptions = set of TGridOption;
  TSelectCellEvent = procedure(Sender:TObject; ACol:Integer; ARow:Integer; var CanSelect:Boolean) of object;;
  TDrawCellEvent = procedure(Sender:TObject; ACol:Integer; ARow:Integer; Rect:TRect; State:TGridDrawState) of object;;
  TCustomGrid = class(TCustomControl)
  public
    FAnchor:TGridCoord;//f1F0
    FBorderStyle:TBorderStyle;//f1F8
    FCanEditModify:Boolean;//f1F9
    FColCount:Longint;//f1FC
    FColWidths:Pointer;//f200
    FTabStops:Pointer;//f204
    FCurrent:TGridCoord;//f208
    FCurrent:Longint;//f20C
    FDefaultColWidth:Integer;//f210
    FDefaultRowHeight:Integer;//f214
    FFixedCols:Integer;//f218
    FFixedRows:Integer;//f21C
    FFixedColor:TColor;//f220
    FGridLineWidth:Integer;//f224
    FOptions:TGridOptions;//f228
    f229:byte;//f229
    FRowCount:Longint;//f22C
    FRowHeights:Pointer;//f230
    FScrollBars:TScrollStyle;//f234
    FTopLeft:TGridCoord;//f238
    FTopLeft:Longint;//f23C
    FSizingIndex:Longint;//f240
    FSizingPos:Integer;//f244
    FSizingOfs:Integer;//f248
    FMoveIndex:Longint;//f24C
    FMovePos:Longint;//f250
    FHitTest:TPoint;//f254
    FInplaceEdit:TInplaceEdit;//f25C
    FInplaceCol:Longint;//f260
    FInplaceRow:Longint;//f264
    FColOffset:Integer;//f268
    FDefaultDrawing:Boolean;//f26C
    FEditorMode:Boolean;//f26D
    FGridState:TGridState;//f26E
    FSaveCellExtents:Boolean;//f26F
    DesignOptionsBoost:TGridOptions;//f270
    VirtualView:Boolean;//f272
    destructor Destroy; virtual;//00080114
    procedure DefineProperties(Filer:TFiler); virtual;//v4//00080744
    constructor Create(AOwner:TComponent); virtual;//v2C//0007FFC4
    procedure CreateParams(var Params:TCreateParams); virtual;//v94//000836A8
    procedure Paint; virtual;//vB8//00080FFC
    procedure CalcSizingState(X:Integer; Y:Integer; var State:TGridState; var Index:Longint; var SizingPos:Integer; var SizingOfs:Integer; var FixedInfo:TGridDrawInfo); virtual;//vBC//00081A28
    function CreateEditor:TInplaceEdit; virtual;//vC0//00083698
    function CanEditShow:Boolean; virtual;//vC4//00080470
    procedure DrawCell; virtual; abstract;//vC8//000129A8
    //function vCC:?; virtual;//vCC//00080998
    procedure DeleteColumn(ACol:Longint); virtual;//vD0//00085418
    procedure DeleteRow(ARow:Longint); virtual;//vD4//0008543C
    procedure WMSize(var Msg:TWMSize); message WM_SIZE;//00085028
    procedure WMSetFocus(var Msg:TWMSetFocus); message WM_SETFOCUS;//00084FDC
    procedure WMKillFocus(var Msg:TWMKillFocus); message WM_KILLFOCUS;//00084E78
    procedure WMCancelMode(var Msg:TWMCancelMode); message WM_CANCELMODE;//00085114
    procedure WMSetCursor(var Msg:TWMSetCursor); message WM_SETCURSOR;//00084F30
    procedure WMNCHitTest(var Msg:TWMNCHitTest); message WM_NCHITTEST;//00084EEC
    procedure WMGetDlgCode(var Msg:TWMGetDlgCode); message WM_GETDLGCODE;//00084E48
    procedure WMChar(var Msg:TWMChar); message WM_CHAR;//00084DEC
    procedure WMCommand(var Message:TWMCommand); message WM_COMMAND;//00084E14
    procedure WMTimer(var Msg:TWMTimer); message WM_TIMER;//00085288
    procedure WMHScroll(var Msg:TWMHScroll); message WM_HSCROLL;//0008506C
    procedure WMVScroll(var Msg:TWMVScroll); message WM_VSCROLL;//00085054
    procedure WMLButtonDown(var Message:TMessage); message WM_LBUTTONDOWN;//00084EC4
    procedure CMCancelMode(var Msg:TMessage); message CM_CANCELMODE;//00085128
    procedure CMFontChanged(var Message:TMessage); message CM_FONTCHANGED;//00085154
    procedure CMCtl3DChanged(var Message:TMessage); message CM_CTL3DCHANGED;//00085178
    procedure CMShowingChanged(var Message:TMessage); message CM_SHOWINGCHANGED;//00085578
    procedure CMDesignHitTest(var Msg:TCMDesignHitTest); message CM_DESIGNHITTEST;//0008518C
    procedure CMWantSpecialKey(var Msg:TCMWantSpecialKey); message CM_WANTSPECIALKEY;//000851AC
    procedure EndRowDrag(var Origin:Integer; var Destination:Integer; const MousePt:TPoint); dynamic;//0008556C
    procedure EndColumnDrag(var Origin:Integer; var Destination:Integer; const MousePt:TPoint); dynamic;//00085560
    procedure BeginRowDrag(var Origin:Integer; var Destination:Integer; const MousePt:TPoint); dynamic;//0008553C
    procedure BeginColumnDrag(var Origin:Integer; var Destination:Integer; const MousePt:TPoint); dynamic;//00085530
    procedure CheckRowDrag(var Origin:Integer; var Destination:Integer; const MousePt:TPoint); dynamic;//00085554
    procedure CheckColumnDrag(var Origin:Integer; var Destination:Integer; const MousePt:TPoint); dynamic;//00085548
    procedure RowHeightsChanged; dynamic;//00085404
    procedure ColWidthsChanged; dynamic;//000853F0
    procedure TimedScroll(Direction:TGridScrollDirection); dynamic;//000851D4
    procedure TopLeftChanged; dynamic;//000809F8
    procedure sub_0008099C; dynamic;//0008099C
    procedure sub_00080940; dynamic;//00080940
    procedure sub_000808B8; dynamic;//000808B8
    procedure sub_00080544; dynamic;//00080544
    procedure GetEditMask(ACol:Longint; ARow:Longint); dynamic;//0008051C
    procedure sub_0008053C; dynamic;//0008053C
    procedure GetEditText(ACol:Longint; ARow:Longint); dynamic;//0008052C
    procedure sub_00080468; dynamic;//00080468
    procedure sub_00080464; dynamic;//00080464
    procedure sub_00080460; dynamic;//00080460
    procedure AdjustSize(Index:Longint; Amount:Longint; Rows:Boolean); dynamic;//00080288
    procedure KeyPress(var Key:Char); dynamic;//00083C2C
    procedure KeyDown(Key:Word; Shift:TShiftState); dynamic;//000837D0
    procedure DoMouseWheelUp(Shift:TShiftState; MousePos:TPoint); dynamic;//000854E8
    procedure DoMouseWheelDown(Shift:TShiftState; MousePos:TPoint); dynamic;//0008549C
    procedure DoExit; dynamic;//00080420
    procedure MouseUp(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer); dynamic;//000841DC
    procedure MouseMove(Shift:TShiftState; X:Integer; Y:Integer); dynamic;//00084028
    procedure MouseDown(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer); dynamic;//00083C68
    function BoxRect(ALeft:Longint; ATop:Longint; ARight:Longint; ABottom:Longint):TRect;//000803EC
    function CellRect(ACol:Longint; ARow:Longint):TRect;//0008043C
    function IsActiveControl:Boolean;//000804CC
    procedure HideEditor;//00080548
    procedure ShowEditor;//00080558
    procedure ShowEditorChar(Ch:Char);//00080568
    procedure InvalidateEditor;//000805A0
    procedure ReadColWidths(Reader:TReader);//000805BC
    procedure ReadRowHeights(Reader:TReader);//000805FC
    procedure WriteColWidths(Writer:TWriter);//0008063C
    procedure WriteRowHeights(Writer:TWriter);//0008067C
    procedure MoveColumn(FromIndex:Longint; ToIndex:Longint);//000807E4
    procedure MoveRow(FromIndex:Longint; ToIndex:Longint);//000808BC
    function MouseCoord(X:Integer; Y:Integer):TGridCoord;//00080944
    function Sizing(X:Integer; Y:Integer):Boolean;//000809A0
    function CalcCoordFromPoint(X:Integer; Y:Integer; const DrawInfo:TGridDrawInfo):TGridCoord;//000815CC
    procedure CalcDrawInfo(var DrawInfo:TGridDrawInfo);//00081628
    procedure CalcDrawInfoXY(var DrawInfo:TGridDrawInfo; UseWidth:Integer; UseHeight:Integer);//000816A4
    procedure CalcFixedInfo(var DrawInfo:TGridDrawInfo);//00081760
    function CalcMaxTopLeft(const Coord:TGridCoord; const DrawInfo:TGridDrawInfo):TGridCoord;//00081858
    procedure ChangeGridOrientation(RightToLeftOrientation:Boolean);//00081AFC
    procedure ChangeSize(NewColCount:Longint; NewRowCount:Longint);//00081E58
    procedure ClampInView(const Coord:TGridCoord);//00081F30
    procedure DrawSizingLine(const DrawInfo:TGridDrawInfo);//00081FF8
    procedure DrawMove;//00082100
    procedure FocusCell(ACol:Longint; ARow:Longint; MoveAnchor:Boolean);//00082290
    procedure GridRectToScreenRect(GridRect:TGridRect; var ScreenRect:TRect; IncludeLine:Boolean);//000823D4
    procedure Initialize;//000824C8
    procedure InvalidateCell(ACol:Longint; ARow:Longint);//00082528
    procedure InvalidateGrid;//0008254C
    procedure InvalidateRect(ARect:TGridRect);//00082554
    procedure ModifyScrollBar(ScrollBar:Cardinal; ScrollCode:Cardinal; Pos:Cardinal; UseRightToLeft:Boolean);//0008297C
    procedure MoveAdjust(var CellPos:Longint; FromIndex:Longint; ToIndex:Longint);//00082B54
    procedure MoveAnchor(const NewAnchor:TGridCoord);//00082B88
    procedure MoveCurrent(ACol:Longint; ARow:Longint; MoveAnchor:Boolean; Show:Boolean);//00082C10
    procedure MoveTopLeft(ALeft:Longint; ATop:Longint);//00082D68
    procedure ResizeCol(Index:Longint; OldSize:Integer; NewSize:Integer);//00082DBC
    procedure ResizeRow(Index:Longint; OldSize:Integer; NewSize:Integer);//00082DC8
    procedure SelectionMoved(const OldSel:TGridRect);//00082DD4
    procedure ScrollDataInfo(DX:Integer; DY:Integer; var DrawInfo:TGridDrawInfo);//00082E4C
    procedure ScrollData(DX:Integer; DY:Integer);//00082FF8
    procedure TopLeftMoved(const OldTopLeft:TGridCoord);//000830A4
    procedure UpdateScrollPos;//000831A4
    procedure UpdateScrollRange;//00083550
    procedure MoveAndScroll(Mouse:Integer; CellHit:Integer; var DrawInfo:TGridDrawInfo; var Axis:TGridAxisDrawInfo; Scrollbar:Integer; const MousePt:TPoint);//0008446C
    function GetColWidths(Index:Longint):Integer;//000845E4
    function GetRowHeights(Index:Longint):Integer;//00084604
    function GetSelection:TGridRect;//00084624
    function GetTabStops(Index:Longint):Boolean;//00084640
    function GetVisibleColCount:Integer;//00084654
    function GetVisibleRowCount:Integer;//00084674
    procedure SetBorderStyle(Value:TBorderStyle);//00084694
    procedure SetCol(Value:Longint);//000846A8
    procedure SetColCount(Value:Longint);//000846C0
    procedure SetColWidths(Index:Longint; Value:Integer);//0008471C
    procedure SetDefaultColWidth(Value:Integer);//000847D0
    procedure SetDefaultRowHeight(Value:Integer);//0008480C
    procedure SetFixedColor(Value:TColor);//00084848
    procedure SetFixedCols(Value:Integer);//0008485C
    procedure SetFixedRows(Value:Integer);//000848EC
    procedure SetEditorMode(Value:Boolean);//0008497C
    procedure SetGridLineWidth(Value:Integer);//000849A4
    procedure SetOptions(Value:TGridOptions);//000849B8
    procedure SetRow(Value:Longint);//00084A30
    procedure SetRowCount(Value:Longint);//00084A48
    procedure SetRowHeights(Index:Longint; Value:Integer);//00084A84
    procedure SetScrollBars(Value:TScrollStyle);//00084B38
    procedure SetSelection(Value:TGridRect);//00084B4C
    procedure SetTopRow(Value:Longint);//00084BA4
    procedure HideEdit;//00084BBC
    procedure UpdateEdit;//00084C98
    procedure UpdateText;//00084D78
    procedure CancelMode;//00085080
    procedure UpdateDesigner;//00085460
  end;
  TGetEditEvent = procedure(Sender:TObject; ACol:Integer; ARow:Integer; var Value:String) of object;;
  TSetEditEvent = procedure(Sender:TObject; ACol:Integer; ARow:Integer; const Value:String) of object;;
  TMovedEvent = procedure(Sender:TObject; FromIndex:Integer; ToIndex:Integer) of object;;
  TDrawGrid = class(TCustomGrid)
  public
    OnColumnMoved:TMovedEvent;//f274
    OnDrawCell:TDrawCellEvent;//f27C
    OnGetEditMask:TGetEditEvent;//f284
    OnGetEditText:TGetEditEvent;//f28C
    OnRowMoved:TMovedEvent;//f294
    OnSelectCell:TSelectCellEvent;//f29C
    OnSetEditText:TSetEditEvent;//f2A4
    OnTopLeftChanged:TNotifyEvent;//f2AC
    procedure DrawCell(ACol:Longint; ARow:Longint; ARect:TRect; AState:TGridDrawState); virtual;//vC8//000856E8
    function SelectCell(ACol:Longint; ARow:Longint):Boolean; virtual;//vCC//0008568C
    procedure TopLeftChanged; dynamic;//0008578C
    procedure RowMoved(FromIndex:Longint; ToIndex:Longint); dynamic;//0008566C
    procedure ColumnMoved(FromIndex:Longint; ToIndex:Longint); dynamic;//000855CC
    procedure GetEditMask(ACol:Longint; ARow:Longint); dynamic;//000855EC
    procedure SetEditText(ACol:Longint; ARow:Longint; const Value:AnsiString); dynamic;//000856BC
    procedure GetEditText(ACol:Longint; ARow:Longint); dynamic;//0008562C
    procedure MouseToCell(X:Integer; Y:Integer; var ACol:Longint; var ARow:Longint);//00085594
  end;
  TStringGridStrings = class(TStrings)
  public
    FGrid:TStringGrid;//fC
    FIndex:Integer;//f10
    procedure Assign(Source:TPersistent); virtual;//v8//00086350
    function Get(Index:Integer):AnsiString; virtual;//vC//000865F4
    function GetCount:Integer; virtual;//v14//00086634
    function GetObject(Index:Integer):TObject; virtual;//v18//00086658
    procedure Put(Index:Integer; const S:AnsiString); virtual;//v20//000866D8
    procedure PutObject(Index:Integer; AObject:TObject); virtual;//v24//00086708
    procedure SetUpdateState(Updating:Boolean); virtual;//v30//00086738
    function Add(const S:AnsiString):Integer; virtual;//v34//00086488
    procedure Clear; virtual;//v40//00086538
    procedure Delete(Index:Integer); virtual;//v44//000865AC
    procedure Insert(Index:Integer; const S:AnsiString); virtual;//v54//0008668C
    constructor Create(AGrid:TStringGrid; AIndex:Longint);//00086308
    procedure CalcXY(Index:Integer; var X:Integer; var Y:Integer);//00086448
  end;
  TStringGrid = class(TDrawGrid)
  public
    FData:Pointer;//f2B4
    FRows:Pointer;//f2B8
    FCols:Pointer;//f2BC
    FUpdating:Boolean;//f2C0
    FNeedsUpdating:Boolean;//f2C1
    FEditUpdate:Integer;//f2C4
    destructor Destroy; virtual;//0008678C
    constructor Create(AOwner:TComponent); virtual;//v2C//00086744
    procedure DrawCell(ACol:Longint; ARow:Longint; ARect:TRect; AState:TGridDrawState); virtual;//vC8//000869A8
    procedure RowMoved(FromIndex:Longint; ToIndex:Longint); dynamic;//00086874
    procedure ColumnMoved(FromIndex:Longint; ToIndex:Longint); dynamic;//0008683C
    procedure SetEditText(ACol:Longint; ARow:Longint; const Value:AnsiString); dynamic;//000868E8
    procedure GetEditText(ACol:Longint; ARow:Longint); dynamic;//000868A4
    procedure DisableEditUpdate;//00086A4C
    procedure EnableEditUpdate;//00086A54
    procedure Initialize;//00086A5C
    procedure SetUpdateState(Updating:Boolean);//00086AE0
    procedure Update(ACol:Integer; ARow:Integer);//00086B08
    function EnsureColRow(Index:Integer; IsCol:Boolean):TStringGridStrings;//00086B54
    function EnsureDataRow(ARow:Integer):Pointer;//00086BB8
    function GetCells(ACol:Integer; ARow:Integer):AnsiString;//00086C0C
    function GetObjects(ACol:Integer; ARow:Integer):TObject;//00086C50
    function GetRows(Index:Integer):TStrings;//00086C7C
    procedure SetCells(ACol:Integer; ARow:Integer; const Value:AnsiString);//00086C84
    procedure SetObjects(ACol:Integer; ARow:Integer; Value:TObject);//00086CD4
  end;
  TStrItem = TStrItem = record//size=8
f4:String;//f4
end;;
  EStringSparseListError = class(Exception)
  end;
  TSparsePointerArray = class(TObject)
  public
    secDir:PSecDir;//f4
    slotsInDir:Word;//f8
    indexMask:Word;//fA
    secShift:Word;//fC
    FHighBound:Integer;//f10
    FSectionSize:Word;//f14
    cachedIndex:Integer;//f18
    cachedPointer:Pointer;//f1C
    constructor Create(Quantum:TSPAQuantum);//00085A90
    destructor Destroy;//00085AF4
    function GetAt(Index:Integer):Pointer;//00085B50
    function MakeAt(Index:Integer):PPointer;//00085B9C
    procedure PutAt(Index:Integer; Item:Pointer);//00085C08
    function ForAll(ApplyFunction:Pointer):Integer;//00085C3C
    procedure ResetHighBound;//00085CF0
  end;
  TSparseList = class(TObject)
  public
    FList:TSparsePointerArray;//f4
    FCount:Integer;//f8
    FQuantum:TSPAQuantum;//fC
    destructor Destroy; virtual;//00085D54
    procedure Error; virtual;//v0//00085DE8
    constructor Create(Quantum:TSPAQuantum);//00085D1C
    procedure Clear;//00085D7C
    procedure Delete(Index:Integer);//00085D9C
    procedure Exchange(Index1:Integer; Index2:Integer);//00085E3C
    function ForAll(ApplyFunction:Pointer):Integer;//00085E78
    function Get(Index:Integer):Pointer;//00085E84
    procedure Insert(Index:Integer; Item:Pointer);//00085EA4
    procedure Move(CurIndex:Integer; NewIndex:Integer);//00085EFC
    procedure NewList(Quantum:TSPAQuantum);//00085F30
    procedure Put(Index:Integer; Item:Pointer);//00085F50
  end;
  TStringSparseList = class(TStrings)
  public
    FList:TSparseList;//fC
    FOnChange:TNotifyEvent;//f10
    destructor Destroy; virtual;//00085FC8
    procedure DefineProperties(Filer:TFiler); virtual;//v4//000860DC
    function Get(Index:Integer):AnsiString; virtual;//vC//00086108
    //function GetCount:?; virtual;//v14//00086138
    function GetObject(Index:Integer):TObject; virtual;//v18//00086140
    procedure Put(Index:Integer; const S:AnsiString); virtual;//v20//00086160
    procedure PutObject(Index:Integer; AObject:TObject); virtual;//v24//000861C8
    procedure Clear; virtual;//v40//000862E4
    procedure Delete(Index:Integer); virtual;//v44//00086270
    procedure Exchange(Index1:Integer; Index2:Integer); virtual;//v48//000862A0
    procedure Insert(Index:Integer; const S:AnsiString); virtual;//v54//000862AC
    procedure Changed; virtual;//v70//00086208
    procedure Error; virtual;//v74//0008621C
    constructor Create(Quantum:TSPAQuantum);//00085F80
    procedure ReadData(Reader:TReader);//00085FF8
    procedure WriteData(Writer:TWriter);//000860A0
  end;
    procedure InvalidOp(const id:AnsiString);//0007F210
    function GridRect(Coord1:TGridCoord; Coord2:TGridCoord):TGridRect;//0007F228
    function PointInGridRect(Col:Longint; Row:Longint; const Rect:TGridRect):Boolean;//0007F290
    function PtInRect(X:Integer; Y:Integer; const Rect:TRect):Boolean;//0007F2AC
    function Includes(const P1:TPoint; var P2:TPoint):Boolean;//0007F2C8
    function Build(var R:TRect; const P1:TPoint; const P2:TPoint; const P3:TPoint):Boolean;//0007F314
    procedure XorRects(const R1:TRect; const R2:TRect; var XorRects:TXorRects);//0007F38C
    procedure ModifyExtents(var Extents:Pointer; Index:Longint; Amount:Longint; Default:Integer);//0007F524
    procedure UpdateExtents(var Extents:Pointer; NewSize:Longint; Default:Integer);//0007F610
    procedure MoveExtent(var Extents:Pointer; FromIndex:Longint; ToIndex:Longint);//0007F62C
    function CompareExtents(E1:Pointer; E2:Pointer):Boolean;//0007F684
    function MulDiv(nNumerator:Integer; nDenominator:Integer):Integer; stdcall;//0007F6B8
    constructor Create(AOwner:TComponent);//0007F6C0
    procedure CreateParams(var Params:TCreateParams);//0007F720
    procedure CMShowingChanged(var Message:TMessage);//0007F738
    procedure WMGetDlgCode(var Message:TWMGetDlgCode);//0007F73C
    procedure WMPaste(var Message:void );//0007F764
    procedure WMClear(var Message:void );//0007F784
    procedure WMCut(var Message:void );//0007F7A4
    procedure DblClick;//0007F7C4
    procedure DoMouseWheel(Shift:TShiftState; WheelDelta:Integer; MousePos:TPoint);//0007F7D8
    function EditCanModify:Boolean;//0007F80C
    procedure SendToParent;//0007F820
    procedure ParentEvent;//0007F854
    function ForwardMovement:Boolean;//0007F89C
    function Ctrl:Boolean;//0007F8B8
    function Selection:TSelection;//0007F8C8
    function RightSide:Boolean;//0007F8EC
    function LeftSide:Boolean;//0007F928
    procedure KeyDown(var Key:Word; Shift:TShiftState);//0007F964
    procedure KeyPress(var Key:Char);//0007FB70
    procedure KeyUp(var Key:Word; Shift:TShiftState);//0007FC58
    procedure WndProc(var Message:TMessage);//0007FC74
    procedure BoundsChanged;//0007FEA8
    procedure UpdateContents;//0007FF10
    constructor Create(AOwner:TComponent);//0007FFC4
    destructor Destroy;//00080114
    function DoSizeAdjust(var Count:Longint; var Extents:Pointer; DefaultExtent:Integer; var Current:Longint):Longint;//00080168
    procedure AdjustSize(Index:Longint; Amount:Longint; Rows:Boolean);//00080288
    procedure DoExit;//00080420
    procedure sub_00080460;//00080460
    procedure sub_00080464;//00080464
    procedure sub_00080468;//00080468
    function CanEditShow:Boolean;//00080470
    procedure GetEditMask(ACol:Longint; ARow:Longint);//0008051C
    procedure GetEditText(ACol:Longint; ARow:Longint);//0008052C
    procedure sub_0008053C;//0008053C
    procedure sub_00080544;//00080544
    function DoColWidths:Boolean;//000806BC
    function DoRowHeights:Boolean;//00080700
    procedure DefineProperties(Filer:TFiler);//00080744
    procedure sub_000808B8;//000808B8
    procedure sub_00080940;//00080940
    //function sub_00080998:?;//00080998
    procedure sub_0008099C;//0008099C
    procedure TopLeftChanged;//000809F8
    procedure FillDWord(var Dest:void ; Count:Integer; Value:Integer);//00080A38
    function StackAlloc(Size:Integer):Pointer;//00080A44
    procedure StackFree(P:Pointer);//00080A74
    procedure DrawAxisLines(const AxisInfo:TGridAxisDrawInfo; Cell:Integer; MajorIndex:Integer; UseOnColor:Boolean);//00080A8C
    procedure DrawLines(DoHorz:Boolean; DoVert:Boolean; Col:Longint; Row:Longint; const CellBounds:array[$0..-$1] of System.Integer; const _Dv_:$0..-$1; OnColor:TColor; OffColor:TColor);//00080C38
    procedure DrawCells(ACol:Longint; ARow:Longint; StartX:Integer; StartY:Integer; StopX:Integer; StopY:Integer; Color:TColor; IncludeDrawState:TGridDrawState);//00080CC8
    procedure Paint;//00080FFC
    function DoCalc(const AxisInfo:TGridAxisDrawInfo; N:Integer):Integer;//000814E8
    function DoCalcRightToLeft(const AxisInfo:TGridAxisDrawInfo; N:Integer):Integer;//00081550
    procedure CalcAxis(var AxisInfo:TGridAxisDrawInfo; UseExtent:Integer);//0008164C
    procedure CalcFixedAxis(var Axis:TGridAxisDrawInfo; LineOptions:TGridOptions; FixedCount:Integer; FirstCell:Integer; CellCount:Integer; GetExtentFunc:TGetExtentsFunc);//000816D0
    function CalcMaxCell(const Axis:TGridAxisDrawInfo; Start:Integer):Integer;//000817E4
    procedure CalcAxisState(const AxisInfo:TGridAxisDrawInfo; Pos:Integer; NewState:TGridState);//00081888
    function XOutsideHorzFixedBoundary:Boolean;//00081990
    function XOutsideOrEqualHorzFixedBoundary:Boolean;//000819DC
    procedure CalcSizingState(X:Integer; Y:Integer; var State:TGridState; var Index:Longint; var SizingPos:Integer; var SizingOfs:Integer; var FixedInfo:TGridDrawInfo);//00081A28
    procedure MinRedraw(const OldInfo:TGridAxisDrawInfo; const NewInfo:TGridAxisDrawInfo; Axis:Integer);//00081C50
    procedure DoChange;//00081CBC
    function LinePos(const AxisInfo:TGridAxisDrawInfo; Line:Integer):Integer;//000822BC
    function CalcAxis(const AxisInfo:TGridAxisDrawInfo; GridRectMin:Integer; GridRectMax:Integer; var ScreenRectMin:Integer; var ScreenRectMax:Integer):Boolean;//0008230C
    function Min:Longint;//000825A0
    function Max:Longint;//000825C8
    function PageUp:Longint;//000825E4
    function PageDown:Longint;//00082644
    function CalcScrollBar(Value:Longint; ARTLFactor:Longint):Longint;//00082698
    procedure ModifyPixelScrollBar(Code:Cardinal; Pos:Cardinal);//000827D0
    function CalcScroll(const AxisInfo:TGridAxisDrawInfo; OldPos:Integer; CurrentPos:Integer; var Amount:Longint):Boolean;//00083020
    procedure SetScroll(Code:Word; Value:Integer);//00083124
    procedure DoUpdate;//000832F0
    function ScrollBarVisible(Code:Word):Boolean;//00083314
    procedure CalcSizeInfo;//00083384
    procedure SetAxisRange(var Max:Longint; var Old:Longint; var Current:Longint; Code:Word; Fixeds:Integer);//000833FC
    procedure SetHorzRange;//00083478
    procedure SetVertRange;//0008350C
    function CreateEditor:TInplaceEdit;//00083698
    procedure CreateParams(var Params:TCreateParams);//000836A8
    procedure CalcPageExtents;//00083724
    procedure Restrict(var Coord:TGridCoord; MinX:Longint; MinY:Longint; MaxX:Longint; MaxY:Longint);//00083790
    procedure KeyDown(Key:Word; Shift:TShiftState);//000837D0
    procedure KeyPress(var Key:Char);//00083C2C
    procedure MouseDown(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);//00083C68
    procedure MouseMove(Shift:TShiftState; X:Integer; Y:Integer);//00084028
    function ResizeLine(const AxisInfo:TGridAxisDrawInfo):Integer;//0008418C
    procedure MouseUp(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);//000841DC
    procedure UpdateEditor;//00084C28
    procedure WMChar(var Msg:TWMChar);//00084DEC
    procedure WMCommand(var Message:TWMCommand);//00084E14
    procedure WMGetDlgCode(var Msg:TWMGetDlgCode);//00084E48
    procedure WMKillFocus(var Msg:TWMKillFocus);//00084E78
    procedure WMLButtonDown(var Message:TMessage);//00084EC4
    procedure WMNCHitTest(var Msg:TWMNCHitTest);//00084EEC
    procedure WMSetCursor(var Msg:TWMSetCursor);//00084F30
    procedure WMSetFocus(var Msg:TWMSetFocus);//00084FDC
    procedure WMSize(var Msg:TWMSize);//00085028
    procedure WMVScroll(var Msg:TWMVScroll);//00085054
    procedure WMHScroll(var Msg:TWMHScroll);//0008506C
    procedure WMCancelMode(var Msg:TWMCancelMode);//00085114
    procedure CMCancelMode(var Msg:TMessage);//00085128
    procedure CMFontChanged(var Message:TMessage);//00085154
    procedure CMCtl3DChanged(var Message:TMessage);//00085178
    procedure CMDesignHitTest(var Msg:TCMDesignHitTest);//0008518C
    procedure CMWantSpecialKey(var Msg:TCMWantSpecialKey);//000851AC
    procedure TimedScroll(Direction:TGridScrollDirection);//000851D4
    procedure WMTimer(var Msg:TWMTimer);//00085288
    procedure ColWidthsChanged;//000853F0
    procedure RowHeightsChanged;//00085404
    procedure DeleteColumn(ACol:Longint);//00085418
    procedure DeleteRow(ARow:Longint);//0008543C
    procedure DoMouseWheelDown(Shift:TShiftState; MousePos:TPoint);//0008549C
    procedure DoMouseWheelUp(Shift:TShiftState; MousePos:TPoint);//000854E8
    procedure BeginColumnDrag(var Origin:Integer; var Destination:Integer; const MousePt:TPoint);//00085530
    procedure BeginRowDrag(var Origin:Integer; var Destination:Integer; const MousePt:TPoint);//0008553C
    procedure CheckColumnDrag(var Origin:Integer; var Destination:Integer; const MousePt:TPoint);//00085548
    procedure CheckRowDrag(var Origin:Integer; var Destination:Integer; const MousePt:TPoint);//00085554
    procedure EndColumnDrag(var Origin:Integer; var Destination:Integer; const MousePt:TPoint);//00085560
    procedure EndRowDrag(var Origin:Integer; var Destination:Integer; const MousePt:TPoint);//0008556C
    procedure CMShowingChanged(var Message:TMessage);//00085578
    procedure ColumnMoved(FromIndex:Longint; ToIndex:Longint);//000855CC
    procedure GetEditMask(ACol:Longint; ARow:Longint);//000855EC
    procedure GetEditText(ACol:Longint; ARow:Longint);//0008562C
    procedure RowMoved(FromIndex:Longint; ToIndex:Longint);//0008566C
    function SelectCell(ACol:Longint; ARow:Longint):Boolean;//0008568C
    procedure SetEditText(ACol:Longint; ARow:Longint; const Value:AnsiString);//000856BC
    procedure DrawCell(ACol:Longint; ARow:Longint; ARect:TRect; AState:TGridDrawState);//000856E8
    procedure TopLeftChanged;//0008578C
    function NewStrItem(const AString:AnsiString; AObject:TObject):PStrItem;//000857D0
    procedure DisposeStrItem(P:PStrItem);//000857FC
    function ExpandDir(secDir:PSecDir; var slotsInDir:Word; newSlots:Word):PSecDir;//00085A2C
    function MakeSec(SecIndex:Integer; SectionSize:Word):Pointer;//00085A68
    function Detector(TheIndex:Integer; TheItem:Pointer):Integer;//00085CC8
    destructor Destroy;//00085D54
    procedure Error;//00085DE8
    destructor Destroy;//00085FC8
    function CountItem(TheIndex:Integer; TheItem:Pointer):Integer;//00086068
    function StoreItem(TheIndex:Integer; TheItem:Pointer):Integer;//00086078
    procedure DefineProperties(Filer:TFiler);//000860DC
    function Get(Index:Integer):AnsiString;//00086108
    //function GetCount:?;//00086138
    function GetObject(Index:Integer):TObject;//00086140
    procedure Put(Index:Integer; const S:AnsiString);//00086160
    procedure PutObject(Index:Integer; AObject:TObject);//000861C8
    procedure Changed;//00086208
    procedure Error;//0008621C
    procedure Delete(Index:Integer);//00086270
    procedure Exchange(Index1:Integer; Index2:Integer);//000862A0
    procedure Insert(Index:Integer; const S:AnsiString);//000862AC
    function ClearItem(TheIndex:Integer; TheItem:Pointer):Integer;//000862D8
    procedure Clear;//000862E4
    procedure Assign(Source:TPersistent);//00086350
    function Add(const S:AnsiString):Integer;//00086488
    function BlankStr(TheIndex:Integer; TheItem:Pointer):Integer;//0008650C
    procedure Clear;//00086538
    procedure Delete(Index:Integer);//000865AC
    function Get(Index:Integer):AnsiString;//000865F4
    function GetCount:Integer;//00086634
    function GetObject(Index:Integer):TObject;//00086658
    procedure Insert(Index:Integer; const S:AnsiString);//0008668C
    procedure Put(Index:Integer; const S:AnsiString);//000866D8
    procedure PutObject(Index:Integer; AObject:TObject);//00086708
    procedure SetUpdateState(Updating:Boolean);//00086738
    constructor Create(AOwner:TComponent);//00086744
    function FreeItem(TheIndex:Integer; TheItem:Pointer):Integer;//00086780
    destructor Destroy;//0008678C
    function MoveColData(Index:Integer; ARow:TStringSparseList):Integer;//00086820
    procedure ColumnMoved(FromIndex:Longint; ToIndex:Longint);//0008683C
    procedure RowMoved(FromIndex:Longint; ToIndex:Longint);//00086874
    procedure GetEditText(ACol:Longint; ARow:Longint);//000868A4
    procedure SetEditText(ACol:Longint; ARow:Longint; const Value:AnsiString);//000868E8
    procedure DrawCell(ACol:Longint; ARow:Longint; ARect:TRect; AState:TGridDrawState);//000869A8

implementation

//0007F210
procedure InvalidOp(const id:AnsiString);
begin
{*
 0007F210    push        ebx
 0007F211    mov         ebx,eax
 0007F213    mov         ecx,ebx
 0007F215    mov         dl,1
 0007F217    mov         eax,[0007DE04];EInvalidGridOperation
 0007F21C    call        Exception.Create
 0007F221    call        @RaiseExcept
 0007F226    pop         ebx
 0007F227    ret
*}
end;

//0007F228
function GridRect(Coord1:TGridCoord; Coord2:TGridCoord):TGridRect;
begin
{*
 0007F228    push        esi
 0007F229    push        edi
 0007F22A    add         esp,0FFFFFFF0
 0007F22D    mov         esi,edx
 0007F22F    lea         edi,[esp+8]
 0007F233    movs        dword ptr [edi],dword ptr [esi]
 0007F234    movs        dword ptr [edi],dword ptr [esi]
 0007F235    mov         esi,eax
 0007F237    lea         edi,[esp]
 0007F23A    movs        dword ptr [edi],dword ptr [esi]
 0007F23B    movs        dword ptr [edi],dword ptr [esi]
 0007F23C    mov         eax,dword ptr [esp+8]
 0007F240    mov         dword ptr [ecx],eax
 0007F242    mov         eax,dword ptr [esp]
 0007F245    cmp         eax,dword ptr [esp+8]
>0007F249    jge         0007F24D
 0007F24B    mov         dword ptr [ecx],eax
 0007F24D    mov         eax,dword ptr [esp]
 0007F250    mov         dword ptr [ecx+8],eax
 0007F253    mov         eax,dword ptr [esp+8]
 0007F257    cmp         eax,dword ptr [esp]
>0007F25A    jle         0007F25F
 0007F25C    mov         dword ptr [ecx+8],eax
 0007F25F    mov         eax,dword ptr [esp+0C]
 0007F263    mov         dword ptr [ecx+4],eax
 0007F266    mov         eax,dword ptr [esp+4]
 0007F26A    cmp         eax,dword ptr [esp+0C]
>0007F26E    jge         0007F273
 0007F270    mov         dword ptr [ecx+4],eax
 0007F273    mov         eax,dword ptr [esp+4]
 0007F277    mov         dword ptr [ecx+0C],eax
 0007F27A    mov         eax,dword ptr [esp+0C]
 0007F27E    cmp         eax,dword ptr [esp+4]
>0007F282    jle         0007F287
 0007F284    mov         dword ptr [ecx+0C],eax
 0007F287    add         esp,10
 0007F28A    pop         edi
 0007F28B    pop         esi
 0007F28C    ret
*}
end;

//0007F290
function PointInGridRect(Col:Longint; Row:Longint; const Rect:TGridRect):Boolean;
begin
{*
 0007F290    cmp         eax,dword ptr [ecx]
>0007F292    jl          0007F2A3
 0007F294    cmp         eax,dword ptr [ecx+8]
>0007F297    jg          0007F2A3
 0007F299    cmp         edx,dword ptr [ecx+4]
>0007F29C    jl          0007F2A3
 0007F29E    cmp         edx,dword ptr [ecx+0C]
>0007F2A1    jle         0007F2A6
 0007F2A3    xor         eax,eax
 0007F2A5    ret
 0007F2A6    mov         al,1
 0007F2A8    ret
*}
end;

//0007F2AC
function PtInRect(X:Integer; Y:Integer; const Rect:TRect):Boolean;
begin
{*
 0007F2AC    cmp         eax,dword ptr [ecx]
>0007F2AE    jl          0007F2BF
 0007F2B0    cmp         eax,dword ptr [ecx+8]
>0007F2B3    jg          0007F2BF
 0007F2B5    cmp         edx,dword ptr [ecx+4]
>0007F2B8    jl          0007F2BF
 0007F2BA    cmp         edx,dword ptr [ecx+0C]
>0007F2BD    jle         0007F2C2
 0007F2BF    xor         eax,eax
 0007F2C1    ret
 0007F2C2    mov         al,1
 0007F2C4    ret
*}
end;

//0007F2C8
function Includes(const P1:TPoint; var P2:TPoint):Boolean;
begin
{*
 0007F2C8    push        ebp
 0007F2C9    mov         ebp,esp
 0007F2CB    push        ebx
 0007F2CC    push        esi
 0007F2CD    mov         esi,edx
 0007F2CF    mov         ebx,eax
 0007F2D1    mov         eax,dword ptr [ebp+8]
 0007F2D4    mov         ecx,dword ptr [eax-4]
 0007F2D7    mov         edx,dword ptr [ebx+4]
 0007F2DA    mov         eax,dword ptr [ebx]
 0007F2DC    call        PtInRect
 0007F2E1    test        al,al
>0007F2E3    jne         0007F2FD
 0007F2E5    mov         eax,dword ptr [ebp+8]
 0007F2E8    mov         ecx,dword ptr [eax-8]
 0007F2EB    mov         edx,dword ptr [ebx+4]
 0007F2EE    mov         eax,dword ptr [ebx]
 0007F2F0    call        PtInRect
 0007F2F5    test        al,al
>0007F2F7    jne         0007F2FD
 0007F2F9    xor         eax,eax
>0007F2FB    jmp         0007F2FF
 0007F2FD    mov         al,1
 0007F2FF    test        al,al
>0007F301    je          0007F30D
 0007F303    mov         edx,dword ptr [ebx]
 0007F305    mov         dword ptr [esi],edx
 0007F307    mov         edx,dword ptr [ebx+4]
 0007F30A    mov         dword ptr [esi+4],edx
 0007F30D    pop         esi
 0007F30E    pop         ebx
 0007F30F    pop         ebp
 0007F310    ret
*}
end;

//0007F314
function Build(var R:TRect; const P1:TPoint; const P2:TPoint; const P3:TPoint):Boolean;
begin
{*
 0007F314    push        ebp
 0007F315    mov         ebp,esp
 0007F317    push        ecx
 0007F318    push        ebx
 0007F319    push        esi
 0007F31A    push        edi
 0007F31B    mov         dword ptr [ebp-4],ecx
 0007F31E    mov         edi,edx
 0007F320    mov         esi,eax
 0007F322    mov         bl,1
 0007F324    mov         eax,dword ptr [ebp+0C]
 0007F327    push        eax
 0007F328    mov         edx,esi
 0007F32A    mov         eax,edi
 0007F32C    call        Includes
 0007F331    pop         ecx
 0007F332    test        al,al
>0007F334    je          0007F35A
 0007F336    mov         eax,dword ptr [ebp+0C]
 0007F339    push        eax
 0007F33A    lea         edx,[esi+8]
 0007F33D    mov         eax,dword ptr [ebp+8]
 0007F340    call        Includes
 0007F345    pop         ecx
 0007F346    test        al,al
>0007F348    jne         0007F37F
 0007F34A    mov         eax,dword ptr [ebp-4]
 0007F34D    mov         edx,dword ptr [eax]
 0007F34F    mov         dword ptr [esi+8],edx
 0007F352    mov         edx,dword ptr [eax+4]
 0007F355    mov         dword ptr [esi+0C],edx
>0007F358    jmp         0007F37F
 0007F35A    mov         eax,dword ptr [ebp+0C]
 0007F35D    push        eax
 0007F35E    mov         edx,esi
 0007F360    mov         eax,dword ptr [ebp-4]
 0007F363    call        Includes
 0007F368    pop         ecx
 0007F369    test        al,al
>0007F36B    je          0007F37D
 0007F36D    mov         eax,dword ptr [ebp+8]
 0007F370    mov         edx,dword ptr [eax]
 0007F372    mov         dword ptr [esi+8],edx
 0007F375    mov         edx,dword ptr [eax+4]
 0007F378    mov         dword ptr [esi+0C],edx
>0007F37B    jmp         0007F37F
 0007F37D    xor         ebx,ebx
 0007F37F    mov         eax,ebx
 0007F381    pop         edi
 0007F382    pop         esi
 0007F383    pop         ebx
 0007F384    pop         ecx
 0007F385    pop         ebp
 0007F386    ret         4
*}
end;

//0007F38C
procedure XorRects(const R1:TRect; const R2:TRect; var XorRects:TXorRects);
begin
{*
 0007F38C    push        ebp
 0007F38D    mov         ebp,esp
 0007F38F    add         esp,0FFFFFFC0
 0007F392    push        ebx
 0007F393    push        esi
 0007F394    push        edi
 0007F395    mov         ebx,ecx
 0007F397    mov         dword ptr [ebp-8],edx
 0007F39A    mov         dword ptr [ebp-4],eax
 0007F39D    mov         eax,ebx
 0007F39F    xor         ecx,ecx
 0007F3A1    mov         edx,40
 0007F3A6    call        @FillChar
 0007F3AB    mov         eax,dword ptr [ebp-8]
 0007F3AE    push        eax
 0007F3AF    mov         eax,dword ptr [ebp-4]
 0007F3B2    push        eax
 0007F3B3    lea         eax,[ebp-18]
 0007F3B6    push        eax
 0007F3B7    call        user32.IntersectRect
 0007F3BC    test        eax,eax
>0007F3BE    jne         0007F3E2
 0007F3C0    mov         eax,dword ptr [ebp-4]
 0007F3C3    mov         esi,eax
 0007F3C5    mov         edi,ebx
 0007F3C7    mov         ecx,4
 0007F3CC    rep movs    dword ptr [edi],dword ptr [esi]
 0007F3CE    mov         eax,dword ptr [ebp-8]
 0007F3D1    mov         esi,eax
 0007F3D3    lea         edi,[ebx+10]
 0007F3D6    mov         ecx,4
 0007F3DB    rep movs    dword ptr [edi],dword ptr [esi]
>0007F3DD    jmp         0007F51A
 0007F3E2    mov         eax,dword ptr [ebp-8]
 0007F3E5    push        eax
 0007F3E6    mov         eax,dword ptr [ebp-4]
 0007F3E9    push        eax
 0007F3EA    lea         eax,[ebp-28]
 0007F3ED    push        eax
 0007F3EE    call        user32.UnionRect
 0007F3F3    push        ebp
 0007F3F4    lea         ecx,[ebp-30]
 0007F3F7    mov         edx,dword ptr [ebp-0C]
 0007F3FA    mov         eax,dword ptr [ebp-28]
 0007F3FD    call        Point
 0007F402    lea         eax,[ebp-30]
 0007F405    push        eax
 0007F406    lea         ecx,[ebp-38]
 0007F409    mov         edx,dword ptr [ebp-14]
 0007F40C    mov         eax,dword ptr [ebp-28]
 0007F40F    call        Point
 0007F414    lea         eax,[ebp-38]
 0007F417    push        eax
 0007F418    lea         ecx,[ebp-40]
 0007F41B    mov         edx,dword ptr [ebp-24]
 0007F41E    mov         eax,dword ptr [ebp-28]
 0007F421    call        Point
 0007F426    lea         edx,[ebp-40]
 0007F429    mov         eax,ebx
 0007F42B    pop         ecx
 0007F42C    call        Build
 0007F431    pop         ecx
 0007F432    test        al,al
>0007F434    je          0007F43C
 0007F436    mov         eax,dword ptr [ebp-18]
 0007F439    mov         dword ptr [ebx+8],eax
 0007F43C    push        ebp
 0007F43D    lea         ecx,[ebp-30]
 0007F440    mov         edx,dword ptr [ebp-24]
 0007F443    mov         eax,dword ptr [ebp-20]
 0007F446    call        Point
 0007F44B    lea         eax,[ebp-30]
 0007F44E    push        eax
 0007F44F    lea         ecx,[ebp-38]
 0007F452    mov         edx,dword ptr [ebp-24]
 0007F455    mov         eax,dword ptr [ebp-10]
 0007F458    call        Point
 0007F45D    lea         eax,[ebp-38]
 0007F460    push        eax
 0007F461    lea         ecx,[ebp-40]
 0007F464    mov         edx,dword ptr [ebp-24]
 0007F467    mov         eax,dword ptr [ebp-18]
 0007F46A    call        Point
 0007F46F    lea         edx,[ebp-40]
 0007F472    lea         eax,[ebx+10]
 0007F475    pop         ecx
 0007F476    call        Build
 0007F47B    pop         ecx
 0007F47C    test        al,al
>0007F47E    je          0007F486
 0007F480    mov         eax,dword ptr [ebp-14]
 0007F483    mov         dword ptr [ebx+1C],eax
 0007F486    push        ebp
 0007F487    lea         ecx,[ebp-30]
 0007F48A    mov         edx,dword ptr [ebp-1C]
 0007F48D    mov         eax,dword ptr [ebp-20]
 0007F490    call        Point
 0007F495    lea         eax,[ebp-30]
 0007F498    push        eax
 0007F499    lea         ecx,[ebp-38]
 0007F49C    mov         edx,dword ptr [ebp-0C]
 0007F49F    mov         eax,dword ptr [ebp-20]
 0007F4A2    call        Point
 0007F4A7    lea         eax,[ebp-38]
 0007F4AA    push        eax
 0007F4AB    lea         ecx,[ebp-40]
 0007F4AE    mov         edx,dword ptr [ebp-14]
 0007F4B1    mov         eax,dword ptr [ebp-20]
 0007F4B4    call        Point
 0007F4B9    lea         edx,[ebp-40]
 0007F4BC    lea         eax,[ebx+20]
 0007F4BF    pop         ecx
 0007F4C0    call        Build
 0007F4C5    pop         ecx
 0007F4C6    test        al,al
>0007F4C8    je          0007F4D0
 0007F4CA    mov         eax,dword ptr [ebp-10]
 0007F4CD    mov         dword ptr [ebx+20],eax
 0007F4D0    push        ebp
 0007F4D1    lea         ecx,[ebp-30]
 0007F4D4    mov         edx,dword ptr [ebp-1C]
 0007F4D7    mov         eax,dword ptr [ebp-10]
 0007F4DA    call        Point
 0007F4DF    lea         eax,[ebp-30]
 0007F4E2    push        eax
 0007F4E3    lea         ecx,[ebp-38]
 0007F4E6    mov         edx,dword ptr [ebp-1C]
 0007F4E9    mov         eax,dword ptr [ebp-18]
 0007F4EC    call        Point
 0007F4F1    lea         eax,[ebp-38]
 0007F4F4    push        eax
 0007F4F5    lea         ecx,[ebp-40]
 0007F4F8    mov         edx,dword ptr [ebp-1C]
 0007F4FB    mov         eax,dword ptr [ebp-28]
 0007F4FE    call        Point
 0007F503    lea         edx,[ebp-40]
 0007F506    lea         eax,[ebx+30]
 0007F509    pop         ecx
 0007F50A    call        Build
 0007F50F    pop         ecx
 0007F510    test        al,al
>0007F512    je          0007F51A
 0007F514    mov         eax,dword ptr [ebp-0C]
 0007F517    mov         dword ptr [ebx+34],eax
 0007F51A    pop         edi
 0007F51B    pop         esi
 0007F51C    pop         ebx
 0007F51D    mov         esp,ebp
 0007F51F    pop         ebp
 0007F520    ret
*}
end;

//0007F524
procedure ModifyExtents(var Extents:Pointer; Index:Longint; Amount:Longint; Default:Integer);
begin
{*
 0007F524    push        ebp
 0007F525    mov         ebp,esp
 0007F527    add         esp,0FFFFFFF8
 0007F52A    push        ebx
 0007F52B    push        esi
 0007F52C    push        edi
 0007F52D    xor         ebx,ebx
 0007F52F    mov         dword ptr [ebp-8],ebx
 0007F532    mov         edi,ecx
 0007F534    mov         dword ptr [ebp-4],edx
 0007F537    mov         ebx,eax
 0007F539    xor         eax,eax
 0007F53B    push        ebp
 0007F53C    push        7F5FE
 0007F541    push        dword ptr fs:[eax]
 0007F544    mov         dword ptr fs:[eax],esp
 0007F547    test        edi,edi
>0007F549    je          0007F5E8
 0007F54F    cmp         dword ptr [ebx],0
>0007F552    jne         0007F558
 0007F554    xor         esi,esi
>0007F556    jmp         0007F55C
 0007F558    mov         eax,dword ptr [ebx]
 0007F55A    mov         esi,dword ptr [eax]
 0007F55C    cmp         dword ptr [ebp-4],0
>0007F560    jl          0007F567
 0007F562    cmp         esi,dword ptr [ebp-4]
>0007F565    jge         0007F57C
 0007F567    lea         edx,[ebp-8]
 0007F56A    mov         eax,[000B5A2C];^SIndexOutOfRange:TResStringRec
 0007F56F    call        LoadResString
 0007F574    mov         eax,dword ptr [ebp-8]
 0007F577    call        InvalidOp
 0007F57C    add         edi,esi
 0007F57E    mov         esi,edi
 0007F580    test        esi,esi
>0007F582    jge         0007F59B
 0007F584    lea         edx,[ebp-8]
 0007F587    mov         eax,[000B58F8];^STooManyDeleted:TResStringRec
 0007F58C    call        LoadResString
 0007F591    mov         eax,dword ptr [ebp-8]
 0007F594    call        InvalidOp
>0007F599    jmp         0007F5B8
 0007F59B    cmp         esi,7FFFFFE
>0007F5A1    jl          0007F5B8
 0007F5A3    lea         edx,[ebp-8]
 0007F5A6    mov         eax,[000B597C];^SGridTooLarge:TResStringRec
 0007F5AB    call        LoadResString
 0007F5B0    mov         eax,dword ptr [ebp-8]
 0007F5B3    call        InvalidOp
 0007F5B8    test        esi,esi
>0007F5BA    jle         0007F5BD
 0007F5BC    inc         esi
 0007F5BD    mov         edx,esi
 0007F5BF    shl         edx,2
 0007F5C2    mov         eax,ebx
 0007F5C4    call        @ReallocMem
 0007F5C9    cmp         dword ptr [ebx],0
>0007F5CC    je          0007F5E8
 0007F5CE    mov         eax,dword ptr [ebp-4]
 0007F5D1    inc         eax
 0007F5D2    cmp         esi,eax
>0007F5D4    jle         0007F5E3
 0007F5D6    mov         edx,dword ptr [ebx]
 0007F5D8    mov         ecx,dword ptr [ebp+8]
 0007F5DB    mov         dword ptr [edx+eax*4],ecx
 0007F5DE    inc         eax
 0007F5DF    cmp         esi,eax
>0007F5E1    jg          0007F5D6
 0007F5E3    dec         esi
 0007F5E4    mov         eax,dword ptr [ebx]
 0007F5E6    mov         dword ptr [eax],esi
 0007F5E8    xor         eax,eax
 0007F5EA    pop         edx
 0007F5EB    pop         ecx
 0007F5EC    pop         ecx
 0007F5ED    mov         dword ptr fs:[eax],edx
 0007F5F0    push        7F605
 0007F5F5    lea         eax,[ebp-8]
 0007F5F8    call        @LStrClr
 0007F5FD    ret
>0007F5FE    jmp         @HandleFinally
>0007F603    jmp         0007F5F5
 0007F605    pop         edi
 0007F606    pop         esi
 0007F607    pop         ebx
 0007F608    pop         ecx
 0007F609    pop         ecx
 0007F60A    pop         ebp
 0007F60B    ret         4
*}
end;

//0007F610
procedure UpdateExtents(var Extents:Pointer; NewSize:Longint; Default:Integer);
begin
{*
 0007F610    push        ebx
 0007F611    push        esi
 0007F612    xor         esi,esi
 0007F614    cmp         dword ptr [eax],0
>0007F617    je          0007F61D
 0007F619    mov         ebx,dword ptr [eax]
 0007F61B    mov         esi,dword ptr [ebx]
 0007F61D    push        ecx
 0007F61E    mov         ecx,edx
 0007F620    sub         ecx,esi
 0007F622    mov         edx,esi
 0007F624    call        ModifyExtents
 0007F629    pop         esi
 0007F62A    pop         ebx
 0007F62B    ret
*}
end;

//0007F62C
procedure MoveExtent(var Extents:Pointer; FromIndex:Longint; ToIndex:Longint);
begin
{*
 0007F62C    push        ebx
 0007F62D    push        esi
 0007F62E    push        edi
 0007F62F    push        ebp
 0007F630    mov         esi,ecx
 0007F632    mov         ebx,eax
 0007F634    cmp         dword ptr [ebx],0
>0007F637    je          0007F67E
 0007F639    mov         eax,dword ptr [ebx]
 0007F63B    mov         edi,dword ptr [eax+edx*4]
 0007F63E    cmp         esi,edx
>0007F640    jle         0007F65E
 0007F642    mov         eax,esi
 0007F644    sub         eax,edx
 0007F646    mov         ecx,eax
 0007F648    shl         ecx,2
 0007F64B    mov         eax,dword ptr [ebx]
 0007F64D    lea         eax,[eax+edx*4+4]
 0007F651    mov         ebp,dword ptr [ebx]
 0007F653    lea         edx,[ebp+edx*4]
 0007F657    call        Move
>0007F65C    jmp         0007F679
 0007F65E    cmp         esi,edx
>0007F660    jge         0007F679
 0007F662    mov         eax,dword ptr [ebx]
 0007F664    lea         eax,[eax+esi*4]
 0007F667    mov         ecx,dword ptr [ebx]
 0007F669    lea         ecx,[ecx+esi*4+4]
 0007F66D    sub         edx,esi
 0007F66F    shl         edx,2
 0007F672    xchg        ecx,edx
 0007F674    call        Move
 0007F679    mov         eax,dword ptr [ebx]
 0007F67B    mov         dword ptr [eax+esi*4],edi
 0007F67E    pop         ebp
 0007F67F    pop         edi
 0007F680    pop         esi
 0007F681    pop         ebx
 0007F682    ret
*}
end;

//0007F684
function CompareExtents(E1:Pointer; E2:Pointer):Boolean;
begin
{*
 0007F684    push        ebx
 0007F685    push        esi
 0007F686    push        edi
 0007F687    mov         edi,edx
 0007F689    xor         edx,edx
 0007F68B    test        eax,eax
>0007F68D    je          0007F6AC
 0007F68F    test        edi,edi
>0007F691    je          0007F6B1
 0007F693    mov         esi,dword ptr [eax]
 0007F695    test        esi,esi
>0007F697    jl          0007F6A8
 0007F699    inc         esi
 0007F69A    xor         ecx,ecx
 0007F69C    mov         ebx,dword ptr [eax+ecx*4]
 0007F69F    cmp         ebx,dword ptr [edi+ecx*4]
>0007F6A2    jne         0007F6B1
 0007F6A4    inc         ecx
 0007F6A5    dec         esi
>0007F6A6    jne         0007F69C
 0007F6A8    mov         dl,1
>0007F6AA    jmp         0007F6B1
 0007F6AC    test        edi,edi
 0007F6AE    sete        dl
 0007F6B1    mov         eax,edx
 0007F6B3    pop         edi
 0007F6B4    pop         esi
 0007F6B5    pop         ebx
 0007F6B6    ret
*}
end;

//0007F6B8
function kernel32.MulDiv(nNumerator:Integer; nDenominator:Integer):Integer; stdcall;
begin
{*
 0007F6B8    jmp         dword ptr ds:[0B88A4]
*}
end;

//0007F6C0
constructor TInplaceEdit.Create(AOwner:TComponent);
begin
{*
 0007F6C0    push        ebx
 0007F6C1    push        esi
 0007F6C2    test        dl,dl
>0007F6C4    je          0007F6CE
 0007F6C6    add         esp,0FFFFFFF0
 0007F6C9    call        @ClassCreate
 0007F6CE    mov         ebx,edx
 0007F6D0    mov         esi,eax
 0007F6D2    xor         edx,edx
 0007F6D4    mov         eax,esi
 0007F6D6    call        TCustomMaskEdit.Create
 0007F6DB    xor         edx,edx
 0007F6DD    mov         eax,esi
 0007F6DF    call        TWinControl.SetParentCtl3D
 0007F6E4    xor         edx,edx
 0007F6E6    mov         eax,esi
 0007F6E8    call        TWinControl.SetCtl3D
 0007F6ED    xor         edx,edx
 0007F6EF    mov         eax,esi
 0007F6F1    call        TWinControl.SetTabStop
 0007F6F6    xor         edx,edx
 0007F6F8    mov         eax,esi
 0007F6FA    call        TCustomEdit.SetBorderStyle
 0007F6FF    mov         byte ptr [esi+1E8],0
 0007F706    mov         eax,esi
 0007F708    test        bl,bl
>0007F70A    je          0007F71B
 0007F70C    call        @AfterConstruction
 0007F711    pop         dword ptr fs:[0]
 0007F718    add         esp,0C
 0007F71B    mov         eax,esi
 0007F71D    pop         esi
 0007F71E    pop         ebx
 0007F71F    ret
*}
end;

//0007F720
procedure TInplaceEdit.CreateParams(var Params:TCreateParams);
begin
{*
 0007F720    push        ebx
 0007F721    mov         ebx,edx
 0007F723    mov         edx,ebx
 0007F725    call        TCustomEdit.CreateParams
 0007F72A    or          dword ptr [ebx+4],4
 0007F72E    pop         ebx
 0007F72F    ret
*}
end;

//0007F730
procedure TInplaceEdit.SetGrid(Value:TCustomGrid);
begin
{*
 0007F730    mov         dword ptr [eax+220],edx
 0007F736    ret
*}
end;

//0007F738
procedure TInplaceEdit.CMShowingChanged(var Message:TMessage);
begin
{*
 0007F738    ret
*}
end;

//0007F73C
procedure TInplaceEdit.WMGetDlgCode(var Message:TWMGetDlgCode);
begin
{*
 0007F73C    push        ebx
 0007F73D    push        esi
 0007F73E    mov         esi,edx
 0007F740    mov         ebx,eax
 0007F742    mov         edx,esi
 0007F744    mov         eax,ebx
 0007F746    mov         ecx,dword ptr [eax]
 0007F748    call        dword ptr [ecx-10]
 0007F74B    mov         eax,dword ptr [ebx+220]
 0007F751    test        byte ptr [eax+229],8
>0007F758    je          0007F75E
 0007F75A    or          dword ptr [esi+0C],2
 0007F75E    pop         esi
 0007F75F    pop         ebx
 0007F760    ret
*}
end;

//0007F764
procedure TInplaceEdit.WMPaste(var Message:void );
begin
{*
 0007F764    push        ebx
 0007F765    push        esi
 0007F766    mov         esi,edx
 0007F768    mov         ebx,eax
 0007F76A    mov         eax,ebx
 0007F76C    mov         edx,dword ptr [eax]
 0007F76E    call        dword ptr [edx+0D8]
 0007F774    test        al,al
>0007F776    je          0007F781
 0007F778    mov         edx,esi
 0007F77A    mov         eax,ebx
 0007F77C    call        TCustomMaskEdit.WMPaste
 0007F781    pop         esi
 0007F782    pop         ebx
 0007F783    ret
*}
end;

//0007F784
procedure TInplaceEdit.WMClear(var Message:void );
begin
{*
 0007F784    push        ebx
 0007F785    push        esi
 0007F786    mov         esi,edx
 0007F788    mov         ebx,eax
 0007F78A    mov         eax,ebx
 0007F78C    mov         edx,dword ptr [eax]
 0007F78E    call        dword ptr [edx+0D8]
 0007F794    test        al,al
>0007F796    je          0007F7A1
 0007F798    mov         edx,esi
 0007F79A    mov         eax,ebx
 0007F79C    mov         ecx,dword ptr [eax]
 0007F79E    call        dword ptr [ecx-10]
 0007F7A1    pop         esi
 0007F7A2    pop         ebx
 0007F7A3    ret
*}
end;

//0007F7A4
procedure TInplaceEdit.WMCut(var Message:void );
begin
{*
 0007F7A4    push        ebx
 0007F7A5    push        esi
 0007F7A6    mov         esi,edx
 0007F7A8    mov         ebx,eax
 0007F7AA    mov         eax,ebx
 0007F7AC    mov         edx,dword ptr [eax]
 0007F7AE    call        dword ptr [edx+0D8]
 0007F7B4    test        al,al
>0007F7B6    je          0007F7C1
 0007F7B8    mov         edx,esi
 0007F7BA    mov         eax,ebx
 0007F7BC    call        TCustomMaskEdit.WMCut
 0007F7C1    pop         esi
 0007F7C2    pop         ebx
 0007F7C3    ret
*}
end;

//0007F7C4
procedure TInplaceEdit.DblClick;
begin
{*
 0007F7C4    push        ebx
 0007F7C5    mov         eax,dword ptr [eax+220]
 0007F7CB    mov         bx,0FFEB
 0007F7CF    call        @CallDynaInst
 0007F7D4    pop         ebx
 0007F7D5    ret
*}
end;

//0007F7D8
procedure TInplaceEdit.DoMouseWheel(Shift:TShiftState; WheelDelta:Integer; MousePos:TPoint);
begin
{*
 0007F7D8    push        ebp
 0007F7D9    mov         ebp,esp
 0007F7DB    add         esp,0FFFFFFF4
 0007F7DE    push        ebx
 0007F7DF    push        esi
 0007F7E0    push        edi
 0007F7E1    mov         esi,dword ptr [ebp+8]
 0007F7E4    lea         edi,[ebp-0C]
 0007F7E7    movs        dword ptr [edi],dword ptr [esi]
 0007F7E8    movs        dword ptr [edi],dword ptr [esi]
 0007F7E9    mov         byte ptr [ebp-1],dl
 0007F7EC    lea         edx,[ebp-0C]
 0007F7EF    push        edx
 0007F7F0    mov         dl,byte ptr [ebp-1]
 0007F7F3    mov         eax,dword ptr [eax+220]
 0007F7F9    mov         bx,0FFC7
 0007F7FD    call        @CallDynaInst
 0007F802    pop         edi
 0007F803    pop         esi
 0007F804    pop         ebx
 0007F805    mov         esp,ebp
 0007F807    pop         ebp
 0007F808    ret         4
*}
end;

//0007F80C
function TInplaceEdit.EditCanModify:Boolean;
begin
{*
 0007F80C    push        ebx
 0007F80D    mov         eax,dword ptr [eax+220]
 0007F813    mov         bx,0FFB5
 0007F817    call        @CallDynaInst
 0007F81C    pop         ebx
 0007F81D    ret
*}
end;

//0007F820
procedure SendToParent;
begin
{*
 0007F820    push        ebp
 0007F821    mov         ebp,esp
 0007F823    push        ebx
 0007F824    mov         eax,dword ptr [ebp+8]
 0007F827    mov         cl,byte ptr [eax-9]
 0007F82A    mov         eax,dword ptr [ebp+8]
 0007F82D    mov         edx,dword ptr [eax-8]
 0007F830    mov         eax,dword ptr [ebp+8]
 0007F833    mov         eax,dword ptr [eax-4]
 0007F836    mov         eax,dword ptr [eax+220]
 0007F83C    mov         bx,0FFC1
 0007F840    call        @CallDynaInst
 0007F845    mov         eax,dword ptr [ebp+8]
 0007F848    mov         eax,dword ptr [eax-8]
 0007F84B    mov         word ptr [eax],0
 0007F850    pop         ebx
 0007F851    pop         ebp
 0007F852    ret
*}
end;

//0007F854
procedure ParentEvent;
begin
{*
 0007F854    push        ebp
 0007F855    mov         ebp,esp
 0007F857    add         esp,0FFFFFFF8
 0007F85A    mov         eax,dword ptr [ebp+8]
 0007F85D    mov         eax,dword ptr [eax-4]
 0007F860    mov         eax,dword ptr [eax+220]
 0007F866    mov         edx,dword ptr [eax+1B0]
 0007F86C    mov         dword ptr [ebp-8],edx
 0007F86F    mov         edx,dword ptr [eax+1B4]
 0007F875    mov         dword ptr [ebp-4],edx
 0007F878    cmp         word ptr [ebp-6],0
>0007F87D    je          0007F897
 0007F87F    mov         edx,dword ptr [ebp+8]
 0007F882    mov         dl,byte ptr [edx-9]
 0007F885    push        edx
 0007F886    mov         edx,dword ptr [ebp+8]
 0007F889    mov         ecx,dword ptr [edx-8]
 0007F88C    mov         edx,dword ptr [ebp+8]
 0007F88F    mov         edx,eax
 0007F891    mov         eax,dword ptr [ebp-4]
 0007F894    call        dword ptr [ebp-8]
 0007F897    pop         ecx
 0007F898    pop         ecx
 0007F899    pop         ebp
 0007F89A    ret
*}
end;

//0007F89C
function ForwardMovement:Boolean;
begin
{*
 0007F89C    push        ebp
 0007F89D    mov         ebp,esp
 0007F89F    mov         eax,dword ptr [ebp+8]
 0007F8A2    mov         eax,dword ptr [eax-4]
 0007F8A5    mov         eax,dword ptr [eax+220]
 0007F8AB    test        byte ptr [eax+229],20
 0007F8B2    setne       al
 0007F8B5    pop         ebp
 0007F8B6    ret
*}
end;

//0007F8B8
function Ctrl:Boolean;
begin
{*
 0007F8B8    push        ebp
 0007F8B9    mov         ebp,esp
 0007F8BB    mov         eax,dword ptr [ebp+8]
 0007F8BE    test        byte ptr [eax-9],4
 0007F8C2    setne       al
 0007F8C5    pop         ebp
 0007F8C6    ret
*}
end;

//0007F8C8
function Selection:TSelection;
begin
{*
 0007F8C8    push        ebp
 0007F8C9    mov         ebp,esp
 0007F8CB    push        ebx
 0007F8CC    mov         ebx,eax
 0007F8CE    lea         eax,[ebx+4]
 0007F8D1    push        eax
 0007F8D2    push        ebx
 0007F8D3    push        0B0
 0007F8D8    mov         eax,dword ptr [ebp+8]
 0007F8DB    mov         eax,dword ptr [eax-4]
 0007F8DE    call        TWinControl.GetHandle
 0007F8E3    push        eax
 0007F8E4    call        user32.SendMessageA
 0007F8E9    pop         ebx
 0007F8EA    pop         ebp
 0007F8EB    ret
*}
end;

//0007F8EC
function RightSide:Boolean;
begin
{*
 0007F8EC    push        ebp
 0007F8ED    mov         ebp,esp
 0007F8EF    add         esp,0FFFFFFF8
 0007F8F2    push        ebx
 0007F8F3    mov         eax,dword ptr [ebp+8]
 0007F8F6    push        eax
 0007F8F7    lea         eax,[ebp-8]
 0007F8FA    call        Selection
 0007F8FF    pop         ecx
 0007F900    mov         ebx,dword ptr [ebp-8]
 0007F903    test        ebx,ebx
>0007F905    je          0007F90C
 0007F907    cmp         ebx,dword ptr [ebp-4]
>0007F90A    jne         0007F91C
 0007F90C    mov         eax,dword ptr [ebp+8]
 0007F90F    mov         eax,dword ptr [eax-4]
 0007F912    call        TCustomMaskEdit.GetTextLen
 0007F917    cmp         eax,dword ptr [ebp-4]
>0007F91A    je          0007F920
 0007F91C    xor         eax,eax
>0007F91E    jmp         0007F922
 0007F920    mov         al,1
 0007F922    pop         ebx
 0007F923    pop         ecx
 0007F924    pop         ecx
 0007F925    pop         ebp
 0007F926    ret
*}
end;

//0007F928
function LeftSide:Boolean;
begin
{*
 0007F928    push        ebp
 0007F929    mov         ebp,esp
 0007F92B    add         esp,0FFFFFFF8
 0007F92E    push        ebx
 0007F92F    mov         eax,dword ptr [ebp+8]
 0007F932    push        eax
 0007F933    lea         eax,[ebp-8]
 0007F936    call        Selection
 0007F93B    pop         ecx
 0007F93C    cmp         dword ptr [ebp-8],0
>0007F940    jne         0007F958
 0007F942    mov         ebx,dword ptr [ebp-4]
 0007F945    test        ebx,ebx
>0007F947    je          0007F95C
 0007F949    mov         eax,dword ptr [ebp+8]
 0007F94C    mov         eax,dword ptr [eax-4]
 0007F94F    call        TCustomMaskEdit.GetTextLen
 0007F954    cmp         ebx,eax
>0007F956    je          0007F95C
 0007F958    xor         eax,eax
>0007F95A    jmp         0007F95E
 0007F95C    mov         al,1
 0007F95E    pop         ebx
 0007F95F    pop         ecx
 0007F960    pop         ecx
 0007F961    pop         ebp
 0007F962    ret
*}
end;

//0007F964
procedure TInplaceEdit.KeyDown(var Key:Word; Shift:TShiftState);
begin
{*
 0007F964    push        ebp
 0007F965    mov         ebp,esp
 0007F967    add         esp,0FFFFFFF4
 0007F96A    push        ebx
 0007F96B    mov         byte ptr [ebp-9],cl
 0007F96E    mov         dword ptr [ebp-8],edx
 0007F971    mov         dword ptr [ebp-4],eax
 0007F974    mov         eax,dword ptr [ebp-8]
 0007F977    movzx       eax,word ptr [eax]
 0007F97A    cmp         eax,25
>0007F97D    jg          0007F9B7
>0007F97F    je          0007FA39
 0007F985    cmp         eax,21
>0007F988    jge         0007F99D
 0007F98A    sub         eax,9
>0007F98D    je          0007FB0E
 0007F993    sub         eax,12
>0007F996    je          0007F9E2
>0007F998    jmp         0007FB1B
 0007F99D    add         eax,0FFFFFFDF
 0007F9A0    sub         eax,2
>0007F9A3    jb          0007F9E2
>0007F9A5    je          0007FACA
 0007F9AB    dec         eax
>0007F9AC    je          0007FAA0
>0007F9B2    jmp         0007FB1B
 0007F9B7    cmp         eax,28
>0007F9BA    jg          0007F9CF
>0007F9BC    je          0007F9E2
 0007F9BE    sub         eax,26
>0007F9C1    je          0007F9E2
 0007F9C3    dec         eax
>0007F9C4    je          0007FA6E
>0007F9CA    jmp         0007FB1B
 0007F9CF    sub         eax,2D
>0007F9D2    je          0007F9EE
 0007F9D4    sub         eax,44
>0007F9D7    je          0007FAF4
>0007F9DD    jmp         0007FB1B
 0007F9E2    push        ebp
 0007F9E3    call        SendToParent
 0007F9E8    pop         ecx
>0007F9E9    jmp         0007FB1B
 0007F9EE    mov         al,[0007FB68]
 0007F9F3    cmp         al,byte ptr [ebp-9]
>0007F9F6    jne         0007FA04
 0007F9F8    push        ebp
 0007F9F9    call        SendToParent
 0007F9FE    pop         ecx
>0007F9FF    jmp         0007FB1B
 0007FA04    mov         al,[0007FB6C]
 0007FA09    cmp         al,byte ptr [ebp-9]
>0007FA0C    jne         0007FB1B
 0007FA12    mov         eax,dword ptr [ebp-4]
 0007FA15    mov         eax,dword ptr [eax+220]
 0007FA1B    mov         bx,0FFB5
 0007FA1F    call        @CallDynaInst
 0007FA24    test        al,al
>0007FA26    jne         0007FB1B
 0007FA2C    mov         eax,dword ptr [ebp-8]
 0007FA2F    mov         word ptr [eax],0
>0007FA34    jmp         0007FB1B
 0007FA39    push        ebp
 0007FA3A    call        ForwardMovement
 0007FA3F    pop         ecx
 0007FA40    test        al,al
>0007FA42    je          0007FB1B
 0007FA48    push        ebp
 0007FA49    call        Ctrl
 0007FA4E    pop         ecx
 0007FA4F    test        al,al
>0007FA51    jne         0007FA62
 0007FA53    push        ebp
 0007FA54    call        LeftSide
 0007FA59    pop         ecx
 0007FA5A    test        al,al
>0007FA5C    je          0007FB1B
 0007FA62    push        ebp
 0007FA63    call        SendToParent
 0007FA68    pop         ecx
>0007FA69    jmp         0007FB1B
 0007FA6E    push        ebp
 0007FA6F    call        ForwardMovement
 0007FA74    pop         ecx
 0007FA75    test        al,al
>0007FA77    je          0007FB1B
 0007FA7D    push        ebp
 0007FA7E    call        Ctrl
 0007FA83    pop         ecx
 0007FA84    test        al,al
>0007FA86    jne         0007FA97
 0007FA88    push        ebp
 0007FA89    call        RightSide
 0007FA8E    pop         ecx
 0007FA8F    test        al,al
>0007FA91    je          0007FB1B
 0007FA97    push        ebp
 0007FA98    call        SendToParent
 0007FA9D    pop         ecx
>0007FA9E    jmp         0007FB1B
 0007FAA0    push        ebp
 0007FAA1    call        ForwardMovement
 0007FAA6    pop         ecx
 0007FAA7    test        al,al
>0007FAA9    je          0007FB1B
 0007FAAB    push        ebp
 0007FAAC    call        Ctrl
 0007FAB1    pop         ecx
 0007FAB2    test        al,al
>0007FAB4    jne         0007FAC1
 0007FAB6    push        ebp
 0007FAB7    call        LeftSide
 0007FABC    pop         ecx
 0007FABD    test        al,al
>0007FABF    je          0007FB1B
 0007FAC1    push        ebp
 0007FAC2    call        SendToParent
 0007FAC7    pop         ecx
>0007FAC8    jmp         0007FB1B
 0007FACA    push        ebp
 0007FACB    call        ForwardMovement
 0007FAD0    pop         ecx
 0007FAD1    test        al,al
>0007FAD3    je          0007FB1B
 0007FAD5    push        ebp
 0007FAD6    call        Ctrl
 0007FADB    pop         ecx
 0007FADC    test        al,al
>0007FADE    jne         0007FAEB
 0007FAE0    push        ebp
 0007FAE1    call        RightSide
 0007FAE6    pop         ecx
 0007FAE7    test        al,al
>0007FAE9    je          0007FB1B
 0007FAEB    push        ebp
 0007FAEC    call        SendToParent
 0007FAF1    pop         ecx
>0007FAF2    jmp         0007FB1B
 0007FAF4    push        ebp
 0007FAF5    call        ParentEvent
 0007FAFA    pop         ecx
 0007FAFB    mov         eax,dword ptr [ebp-8]
 0007FAFE    cmp         word ptr [eax],71
>0007FB02    jne         0007FB1B
 0007FB04    mov         eax,dword ptr [ebp-4]
 0007FB07    call        TInplaceEdit.Deselect
>0007FB0C    jmp         0007FB60
 0007FB0E    test        byte ptr [ebp-9],2
>0007FB12    jne         0007FB1B
 0007FB14    push        ebp
 0007FB15    call        SendToParent
 0007FB1A    pop         ecx
 0007FB1B    mov         eax,dword ptr [ebp-8]
 0007FB1E    cmp         word ptr [eax],2E
>0007FB22    jne         0007FB42
 0007FB24    mov         eax,dword ptr [ebp-4]
 0007FB27    mov         eax,dword ptr [eax+220]
 0007FB2D    mov         bx,0FFB5
 0007FB31    call        @CallDynaInst
 0007FB36    test        al,al
>0007FB38    jne         0007FB42
 0007FB3A    mov         eax,dword ptr [ebp-8]
 0007FB3D    mov         word ptr [eax],0
 0007FB42    mov         eax,dword ptr [ebp-8]
 0007FB45    cmp         word ptr [eax],0
>0007FB49    je          0007FB60
 0007FB4B    push        ebp
 0007FB4C    call        ParentEvent
 0007FB51    pop         ecx
 0007FB52    mov         edx,dword ptr [ebp-8]
 0007FB55    mov         cl,byte ptr [ebp-9]
 0007FB58    mov         eax,dword ptr [ebp-4]
 0007FB5B    call        TCustomMaskEdit.KeyDown
 0007FB60    pop         ebx
 0007FB61    mov         esp,ebp
 0007FB63    pop         ebp
 0007FB64    ret
*}
end;

//0007FB70
procedure TInplaceEdit.KeyPress(var Key:Char);
begin
{*
 0007FB70    push        ebx
 0007FB71    push        esi
 0007FB72    push        edi
 0007FB73    add         esp,0FFFFFFF8
 0007FB76    mov         esi,edx
 0007FB78    mov         edi,eax
 0007FB7A    mov         edx,esi
 0007FB7C    mov         eax,dword ptr [edi+220]
 0007FB82    mov         bx,0FFBF
 0007FB86    call        @CallDynaInst
 0007FB8B    mov         al,byte ptr [esi]
 0007FB8D    add         al,0E0
 0007FB8F    sub         al,0E0
>0007FB91    jae         0007FBB2
 0007FB93    mov         dl,byte ptr [esi]
 0007FB95    mov         eax,dword ptr [edi+220]
 0007FB9B    mov         bx,0FFB7
 0007FB9F    call        @CallDynaInst
 0007FBA4    test        al,al
>0007FBA6    jne         0007FBB2
 0007FBA8    mov         byte ptr [esi],0
 0007FBAB    push        0
 0007FBAD    call        user32.MessageBeep
 0007FBB2    xor         eax,eax
 0007FBB4    mov         al,byte ptr [esi]
 0007FBB6    cmp         eax,16
>0007FBB9    jg          0007FBCC
>0007FBBB    je          0007FC2B
 0007FBBD    sub         eax,8
>0007FBC0    je          0007FC2B
 0007FBC2    dec         eax
>0007FBC3    je          0007FBE2
 0007FBC5    sub         eax,4
>0007FBC8    je          0007FBE7
>0007FBCA    jmp         0007FC41
 0007FBCC    sub         eax,18
>0007FBCF    je          0007FC2B
 0007FBD1    sub         eax,3
>0007FBD4    je          0007FBE2
 0007FBD6    add         eax,0FFFFFFFB
 0007FBD9    sub         eax,0E0
>0007FBDE    jb          0007FC2B
>0007FBE0    jmp         0007FC41
 0007FBE2    mov         byte ptr [esi],0
>0007FBE5    jmp         0007FC41
 0007FBE7    lea         eax,[esp+4]
 0007FBEB    push        eax
 0007FBEC    lea         eax,[esp+4]
 0007FBF0    push        eax
 0007FBF1    push        0B0
 0007FBF6    mov         eax,edi
 0007FBF8    call        TWinControl.GetHandle
 0007FBFD    push        eax
 0007FBFE    call        user32.SendMessageA
 0007FC03    cmp         dword ptr [esp],0
>0007FC07    jne         0007FC1F
 0007FC09    mov         eax,edi
 0007FC0B    call        TCustomMaskEdit.GetTextLen
 0007FC10    cmp         eax,dword ptr [esp+4]
>0007FC14    jne         0007FC1F
 0007FC16    mov         eax,edi
 0007FC18    call        TInplaceEdit.Deselect
>0007FC1D    jmp         0007FC26
 0007FC1F    mov         eax,edi
 0007FC21    call        TCustomEdit.SelectAll
 0007FC26    mov         byte ptr [esi],0
>0007FC29    jmp         0007FC41
 0007FC2B    mov         eax,dword ptr [edi+220]
 0007FC31    mov         bx,0FFB5
 0007FC35    call        @CallDynaInst
 0007FC3A    test        al,al
>0007FC3C    jne         0007FC41
 0007FC3E    mov         byte ptr [esi],0
 0007FC41    cmp         byte ptr [esi],0
>0007FC44    je          0007FC4F
 0007FC46    mov         edx,esi
 0007FC48    mov         eax,edi
 0007FC4A    call        TCustomMaskEdit.KeyPress
 0007FC4F    pop         ecx
 0007FC50    pop         edx
 0007FC51    pop         edi
 0007FC52    pop         esi
 0007FC53    pop         ebx
 0007FC54    ret
*}
end;

//0007FC58
procedure TInplaceEdit.KeyUp(var Key:Word; Shift:TShiftState);
begin
{*
 0007FC58    push        ebx
 0007FC59    push        ecx
 0007FC5A    mov         byte ptr [esp],cl
 0007FC5D    mov         cl,byte ptr [esp]
 0007FC60    mov         eax,dword ptr [eax+220]
 0007FC66    mov         bx,0FFC0
 0007FC6A    call        @CallDynaInst
 0007FC6F    pop         edx
 0007FC70    pop         ebx
 0007FC71    ret
*}
end;

//0007FC74
procedure TInplaceEdit.WndProc(var Message:TMessage);
begin
{*
 0007FC74    push        ebx
 0007FC75    push        esi
 0007FC76    push        edi
 0007FC77    mov         esi,edx
 0007FC79    mov         ebx,eax
 0007FC7B    mov         eax,dword ptr [esi]
 0007FC7D    sub         eax,7
>0007FC80    je          0007FC8B
 0007FC82    sub         eax,1FA
>0007FC87    je          0007FCBA
>0007FC89    jmp         0007FCDE
 0007FC8B    mov         eax,ebx
 0007FC8D    call        GetParentForm
 0007FC92    test        eax,eax
>0007FC94    je          0007FCAF
 0007FC96    mov         eax,ebx
 0007FC98    call        GetParentForm
 0007FC9D    mov         edx,dword ptr [ebx+220]
 0007FCA3    mov         ecx,dword ptr [eax]
 0007FCA5    call        dword ptr [ecx+0C8]
 0007FCAB    test        al,al
>0007FCAD    je          0007FCE7
 0007FCAF    mov         edx,esi
 0007FCB1    mov         eax,ebx
 0007FCB3    mov         ecx,dword ptr [eax]
 0007FCB5    call        dword ptr [ecx-14]
>0007FCB8    jmp         0007FCE7
 0007FCBA    call        user32.GetMessageTime
 0007FCBF    mov         edi,eax
 0007FCC1    sub         edi,dword ptr [ebx+224]
 0007FCC7    call        user32.GetDoubleClickTime
 0007FCCC    cmp         edi,eax
>0007FCCE    jae         0007FCD6
 0007FCD0    mov         dword ptr [esi],203
 0007FCD6    xor         eax,eax
 0007FCD8    mov         dword ptr [ebx+224],eax
 0007FCDE    mov         edx,esi
 0007FCE0    mov         eax,ebx
 0007FCE2    call        TWinControl.WndProc
 0007FCE7    pop         edi
 0007FCE8    pop         esi
 0007FCE9    pop         ebx
 0007FCEA    ret
*}
end;

//0007FCEC
procedure TInplaceEdit.Deselect;
begin
{*
 0007FCEC    push        ebx
 0007FCED    mov         ebx,eax
 0007FCEF    push        0FF
 0007FCF1    push        7FFFFFFF
 0007FCF6    push        0B1
 0007FCFB    mov         eax,ebx
 0007FCFD    call        TWinControl.GetHandle
 0007FD02    push        eax
 0007FD03    call        user32.SendMessageA
 0007FD08    pop         ebx
 0007FD09    ret
*}
end;

//0007FD0C
procedure TInplaceEdit.Invalidate;
begin
{*
 0007FD0C    push        ebx
 0007FD0D    add         esp,0FFFFFFF0
 0007FD10    mov         ebx,eax
 0007FD12    push        0
 0007FD14    mov         eax,ebx
 0007FD16    call        TWinControl.GetHandle
 0007FD1B    push        eax
 0007FD1C    call        user32.ValidateRect
 0007FD21    push        0FF
 0007FD23    push        0
 0007FD25    mov         eax,ebx
 0007FD27    call        TWinControl.GetHandle
 0007FD2C    push        eax
 0007FD2D    call        user32.InvalidateRect
 0007FD32    push        esp
 0007FD33    mov         eax,ebx
 0007FD35    call        TWinControl.GetHandle
 0007FD3A    push        eax
 0007FD3B    call        user32.GetClientRect
 0007FD40    push        2
 0007FD42    lea         eax,[esp+4]
 0007FD46    push        eax
 0007FD47    mov         eax,dword ptr [ebx+220]
 0007FD4D    call        TWinControl.GetHandle
 0007FD52    push        eax
 0007FD53    mov         eax,ebx
 0007FD55    call        TWinControl.GetHandle
 0007FD5A    push        eax
 0007FD5B    call        user32.MapWindowPoints
 0007FD60    push        esp
 0007FD61    mov         eax,dword ptr [ebx+220]
 0007FD67    call        TWinControl.GetHandle
 0007FD6C    push        eax
 0007FD6D    call        user32.ValidateRect
 0007FD72    push        0
 0007FD74    lea         eax,[esp+4]
 0007FD78    push        eax
 0007FD79    mov         eax,dword ptr [ebx+220]
 0007FD7F    call        TWinControl.GetHandle
 0007FD84    push        eax
 0007FD85    call        user32.InvalidateRect
 0007FD8A    add         esp,10
 0007FD8D    pop         ebx
 0007FD8E    ret
*}
end;

//0007FD90
procedure TInplaceEdit.Hide;
begin
{*
 0007FD90    push        ebx
 0007FD91    push        esi
 0007FD92    mov         esi,eax
 0007FD94    mov         eax,esi
 0007FD96    call        TWinControl.HandleAllocated
 0007FD9B    test        al,al
>0007FD9D    je          0007FDF3
 0007FD9F    mov         eax,esi
 0007FDA1    call        TWinControl.GetHandle
 0007FDA6    push        eax
 0007FDA7    call        user32.IsWindowVisible
 0007FDAC    test        eax,eax
>0007FDAE    je          0007FDF3
 0007FDB0    mov         eax,esi
 0007FDB2    call        TInplaceEdit.Invalidate
 0007FDB7    push        8C
 0007FDBC    push        0
 0007FDBE    push        0
 0007FDC0    push        0
 0007FDC2    push        0
 0007FDC4    push        0
 0007FDC6    mov         eax,esi
 0007FDC8    call        TWinControl.GetHandle
 0007FDCD    push        eax
 0007FDCE    call        user32.SetWindowPos
 0007FDD3    mov         eax,esi
 0007FDD5    mov         bx,0FFBB
 0007FDD9    call        @CallDynaInst
 0007FDDE    test        al,al
>0007FDE0    je          0007FDF3
 0007FDE2    mov         eax,dword ptr [esi+220]
 0007FDE8    call        TWinControl.GetHandle
 0007FDED    push        eax
 0007FDEE    call        user32.SetFocus
 0007FDF3    pop         esi
 0007FDF4    pop         ebx
 0007FDF5    ret
*}
end;

//0007FDF8
procedure TInplaceEdit.InternalMove(const Loc:TRect; Redraw:Boolean);
begin
{*
 0007FDF8    push        ebx
 0007FDF9    push        esi
 0007FDFA    push        edi
 0007FDFB    push        ebp
 0007FDFC    mov         ebx,ecx
 0007FDFE    mov         edi,edx
 0007FE00    mov         esi,eax
 0007FE02    push        edi
 0007FE03    call        user32.IsRectEmpty
 0007FE08    test        eax,eax
>0007FE0A    je          0007FE18
 0007FE0C    mov         eax,esi
 0007FE0E    call        TInplaceEdit.Hide
>0007FE13    jmp         0007FEA0
 0007FE18    mov         eax,esi
 0007FE1A    mov         edx,dword ptr [eax]
 0007FE1C    call        dword ptr [edx+90]
 0007FE22    test        bl,bl
>0007FE24    jne         0007FE3B
 0007FE26    mov         eax,esi
 0007FE28    call        TWinControl.GetHandle
 0007FE2D    push        eax
 0007FE2E    call        user32.IsWindowVisible
 0007FE33    test        eax,eax
>0007FE35    je          0007FE3B
 0007FE37    xor         eax,eax
>0007FE39    jmp         0007FE3D
 0007FE3B    mov         al,1
 0007FE3D    mov         ebx,eax
 0007FE3F    mov         eax,esi
 0007FE41    call        TInplaceEdit.Invalidate
 0007FE46    push        48
 0007FE48    mov         eax,dword ptr [edi+0C]
 0007FE4B    sub         eax,dword ptr [edi+4]
 0007FE4E    push        eax
 0007FE4F    mov         eax,dword ptr [edi+8]
 0007FE52    mov         ebp,dword ptr [edi]
 0007FE54    sub         eax,ebp
 0007FE56    push        eax
 0007FE57    mov         eax,dword ptr [edi+4]
 0007FE5A    push        eax
 0007FE5B    push        ebp
 0007FE5C    push        0
 0007FE5E    mov         eax,esi
 0007FE60    call        TWinControl.GetHandle
 0007FE65    push        eax
 0007FE66    call        user32.SetWindowPos
 0007FE6B    mov         eax,esi
 0007FE6D    mov         edx,dword ptr [eax]
 0007FE6F    call        dword ptr [edx+0EC]
 0007FE75    test        bl,bl
>0007FE77    je          0007FE80
 0007FE79    mov         eax,esi
 0007FE7B    call        TInplaceEdit.Invalidate
 0007FE80    mov         eax,dword ptr [esi+220]
 0007FE86    mov         bx,0FFBB
 0007FE8A    call        @CallDynaInst
 0007FE8F    test        al,al
>0007FE91    je          0007FEA0
 0007FE93    mov         eax,esi
 0007FE95    call        TWinControl.GetHandle
 0007FE9A    push        eax
 0007FE9B    call        user32.SetFocus
 0007FEA0    pop         ebp
 0007FEA1    pop         edi
 0007FEA2    pop         esi
 0007FEA3    pop         ebx
 0007FEA4    ret
*}
end;

//0007FEA8
procedure TInplaceEdit.BoundsChanged;
begin
{*
 0007FEA8    push        ebx
 0007FEA9    add         esp,0FFFFFFF0
 0007FEAC    mov         ebx,eax
 0007FEAE    mov         eax,dword ptr [ebx+3C]
 0007FEB1    push        eax
 0007FEB2    lea         eax,[esp+4]
 0007FEB6    push        eax
 0007FEB7    mov         ecx,dword ptr [ebx+38]
 0007FEBA    sub         ecx,2
 0007FEBD    mov         edx,2
 0007FEC2    mov         eax,2
 0007FEC7    call        Rect
 0007FECC    mov         eax,esp
 0007FECE    push        eax
 0007FECF    push        0
 0007FED1    push        0B4
 0007FED6    mov         eax,ebx
 0007FED8    call        TWinControl.GetHandle
 0007FEDD    push        eax
 0007FEDE    call        user32.SendMessageA
 0007FEE3    push        0
 0007FEE5    push        0
 0007FEE7    push        0B7
 0007FEEC    mov         eax,ebx
 0007FEEE    call        TWinControl.GetHandle
 0007FEF3    push        eax
 0007FEF4    call        user32.SendMessageA
 0007FEF9    add         esp,10
 0007FEFC    pop         ebx
 0007FEFD    ret
*}
end;

//0007FF00
procedure TInplaceEdit.UpdateLoc(const Loc:TRect);
begin
{*
 0007FF00    xor         ecx,ecx
 0007FF02    call        TInplaceEdit.InternalMove
 0007FF07    ret
*}
end;

//0007FF08
procedure TInplaceEdit.Move(const Loc:TRect);
begin
{*
 0007FF08    mov         cl,1
 0007FF0A    call        TInplaceEdit.InternalMove
 0007FF0F    ret
*}
end;

//0007FF10
procedure TInplaceEdit.UpdateContents;
begin
{*
 0007FF10    push        ebp
 0007FF11    mov         ebp,esp
 0007FF13    push        0
 0007FF15    push        ebx
 0007FF16    push        esi
 0007FF17    push        edi
 0007FF18    mov         esi,eax
 0007FF1A    xor         eax,eax
 0007FF1C    push        ebp
 0007FF1D    push        7FFB5
 0007FF22    push        dword ptr fs:[eax]
 0007FF25    mov         dword ptr fs:[eax],esp
 0007FF28    xor         edx,edx
 0007FF2A    mov         eax,esi
 0007FF2C    call        TCustomMaskEdit.SetText
 0007FF31    lea         eax,[ebp-4]
 0007FF34    push        eax
 0007FF35    mov         edi,dword ptr [esi+220]
 0007FF3B    mov         ecx,dword ptr [edi+20C]
 0007FF41    mov         edx,dword ptr [edi+208]
 0007FF47    mov         eax,edi
 0007FF49    mov         bx,0FFB2
 0007FF4D    call        @CallDynaInst
 0007FF52    mov         edx,dword ptr [ebp-4]
 0007FF55    mov         eax,esi
 0007FF57    call        TCustomMaskEdit.SetEditMask
 0007FF5C    lea         eax,[ebp-4]
 0007FF5F    push        eax
 0007FF60    mov         edi,dword ptr [esi+220]
 0007FF66    mov         ecx,dword ptr [edi+20C]
 0007FF6C    mov         edx,dword ptr [edi+208]
 0007FF72    mov         eax,edi
 0007FF74    mov         bx,0FFB4
 0007FF78    call        @CallDynaInst
 0007FF7D    mov         edx,dword ptr [ebp-4]
 0007FF80    mov         eax,esi
 0007FF82    call        TCustomMaskEdit.SetText
 0007FF87    mov         eax,dword ptr [esi+220]
 0007FF8D    mov         bx,0FFB1
 0007FF91    call        @CallDynaInst
 0007FF96    mov         edx,eax
 0007FF98    mov         eax,esi
 0007FF9A    call        TCustomMaskEdit.SetMaxLength
 0007FF9F    xor         eax,eax
 0007FFA1    pop         edx
 0007FFA2    pop         ecx
 0007FFA3    pop         ecx
 0007FFA4    mov         dword ptr fs:[eax],edx
 0007FFA7    push        7FFBC
 0007FFAC    lea         eax,[ebp-4]
 0007FFAF    call        @LStrClr
 0007FFB4    ret
>0007FFB5    jmp         @HandleFinally
>0007FFBA    jmp         0007FFAC
 0007FFBC    pop         edi
 0007FFBD    pop         esi
 0007FFBE    pop         ebx
 0007FFBF    pop         ecx
 0007FFC0    pop         ebp
 0007FFC1    ret
*}
end;

//0007FFC4
constructor TCustomGrid.Create(AOwner:TComponent);
begin
{*
 0007FFC4    push        ebp
 0007FFC5    mov         ebp,esp
 0007FFC7    push        ecx
 0007FFC8    push        ebx
 0007FFC9    push        esi
 0007FFCA    test        dl,dl
>0007FFCC    je          0007FFD6
 0007FFCE    add         esp,0FFFFFFF0
 0007FFD1    call        @ClassCreate
 0007FFD6    mov         byte ptr [ebp-1],dl
 0007FFD9    mov         ebx,eax
 0007FFDB    xor         edx,edx
 0007FFDD    mov         eax,ebx
 0007FFDF    call        TCustomControl.Create
 0007FFE4    mov         eax,[000B58C0];NewStyleControls:Boolean
 0007FFE9    cmp         byte ptr [eax],0
>0007FFEC    je          0007FFF8
 0007FFEE    mov         eax,[00080104]
 0007FFF3    mov         dword ptr [ebx+40],eax
>0007FFF6    jmp         00080000
 0007FFF8    mov         eax,[00080108]
 0007FFFD    mov         dword ptr [ebx+40],eax
 00080000    mov         byte ptr [ebx+1F9],1
 00080007    mov         dword ptr [ebx+1FC],5
 00080011    mov         dword ptr [ebx+22C],5
 0008001B    mov         dword ptr [ebx+218],1
 00080025    mov         dword ptr [ebx+21C],1
 0008002F    mov         dword ptr [ebx+224],1
 00080039    mov         ax,[0008010C]
 0008003F    mov         word ptr [ebx+228],ax
 00080046    mov         ax,[00080110]
 0008004C    mov         word ptr [ebx+270],ax
 00080053    mov         dword ptr [ebx+220],8000000F
 0008005D    mov         byte ptr [ebx+234],3
 00080064    mov         byte ptr [ebx+1F8],1
 0008006B    mov         dword ptr [ebx+210],40
 00080075    mov         dword ptr [ebx+214],18
 0008007F    mov         byte ptr [ebx+26C],1
 00080086    mov         byte ptr [ebx+26F],1
 0008008D    mov         byte ptr [ebx+26D],0
 00080094    mov         edx,80000005
 00080099    mov         eax,ebx
 0008009B    call        TControl.SetColor
 000800A0    xor         edx,edx
 000800A2    mov         eax,ebx
 000800A4    call        TControl.SetParentColor
 000800A9    mov         dl,1
 000800AB    mov         eax,ebx
 000800AD    call        TWinControl.SetTabStop
 000800B2    mov         eax,dword ptr [ebx+1FC]
 000800B8    imul        dword ptr [ebx+210]
 000800BE    push        eax
 000800BF    mov         eax,dword ptr [ebx+22C]
 000800C5    imul        dword ptr [ebx+214]
 000800CB    push        eax
 000800CC    mov         ecx,dword ptr [ebx+34]
 000800CF    mov         edx,dword ptr [ebx+30]
 000800D2    mov         eax,ebx
 000800D4    mov         esi,dword ptr [eax]
 000800D6    call        dword ptr [esi+80]
 000800DC    mov         eax,ebx
 000800DE    call        TCustomGrid.Initialize
 000800E3    mov         eax,ebx
 000800E5    cmp         byte ptr [ebp-1],0
>000800E9    je          000800FA
 000800EB    call        @AfterConstruction
 000800F0    pop         dword ptr fs:[0]
 000800F7    add         esp,0C
 000800FA    mov         eax,ebx
 000800FC    pop         esi
 000800FD    pop         ebx
 000800FE    pop         ecx
 000800FF    pop         ebp
 00080100    ret
*}
end;

//00080114
destructor TCustomGrid.Destroy;
begin
{*
 00080114    push        ebx
 00080115    push        esi
 00080116    call        @BeforeDestruction
 0008011B    mov         ebx,edx
 0008011D    mov         esi,eax
 0008011F    mov         eax,dword ptr [esi+25C]
 00080125    call        TObject.Free
 0008012A    mov         edx,ebx
 0008012C    and         dl,0FC
 0008012F    mov         eax,esi
 00080131    call        TCustomControl.Destroy
 00080136    mov         eax,dword ptr [esi+200]
 0008013C    call        @FreeMem
 00080141    mov         eax,dword ptr [esi+230]
 00080147    call        @FreeMem
 0008014C    mov         eax,dword ptr [esi+204]
 00080152    call        @FreeMem
 00080157    test        bl,bl
>00080159    jle         00080162
 0008015B    mov         eax,esi
 0008015D    call        @ClassDestroy
 00080162    pop         esi
 00080163    pop         ebx
 00080164    ret
*}
end;

//00080168
function DoSizeAdjust(var Count:Longint; var Extents:Pointer; DefaultExtent:Integer; var Current:Longint):Longint;
begin
{*
 00080168    push        ebp
 00080169    mov         ebp,esp
 0008016B    add         esp,0FFFFFFF0
 0008016E    push        ebx
 0008016F    push        esi
 00080170    xor         ebx,ebx
 00080172    mov         dword ptr [ebp-10],ebx
 00080175    mov         esi,ecx
 00080177    mov         ebx,edx
 00080179    mov         dword ptr [ebp-4],eax
 0008017C    xor         eax,eax
 0008017E    push        ebp
 0008017F    push        80274
 00080184    push        dword ptr fs:[eax]
 00080187    mov         dword ptr fs:[eax],esp
 0008018A    mov         eax,dword ptr [ebp-4]
 0008018D    mov         eax,dword ptr [eax]
 0008018F    mov         edx,dword ptr [ebp+0C]
 00080192    add         eax,dword ptr [edx-4]
 00080195    mov         dword ptr [ebp-0C],eax
 00080198    mov         eax,dword ptr [ebp+0C]
 0008019B    mov         eax,dword ptr [eax-8]
 0008019E    cmp         eax,dword ptr [ebp-0C]
>000801A1    jle         000801B8
 000801A3    lea         edx,[ebp-10]
 000801A6    mov         eax,[000B58F8];^STooManyDeleted:TResStringRec
 000801AB    call        LoadResString
 000801B0    mov         eax,dword ptr [ebp-10]
 000801B3    call        InvalidOp
 000801B8    mov         eax,dword ptr [ebp+0C]
 000801BB    cmp         dword ptr [eax-4],0
>000801BF    jge         000801F1
 000801C1    cmp         dword ptr [ebx],0
>000801C4    je          000801F1
 000801C6    xor         eax,eax
 000801C8    mov         dword ptr [ebp-8],eax
 000801CB    mov         eax,dword ptr [ebp+0C]
 000801CE    mov         edx,dword ptr [eax-8]
 000801D1    mov         eax,dword ptr [ebp+0C]
 000801D4    mov         eax,dword ptr [eax-8]
 000801D7    mov         ecx,dword ptr [ebp+0C]
 000801DA    sub         eax,dword ptr [ecx-4]
 000801DD    dec         eax
 000801DE    sub         eax,edx
>000801E0    jl          000801FC
 000801E2    inc         eax
 000801E3    mov         ecx,dword ptr [ebx]
 000801E5    mov         ecx,dword ptr [ecx+edx*4]
 000801E8    add         dword ptr [ebp-8],ecx
 000801EB    inc         edx
 000801EC    dec         eax
>000801ED    jne         000801E3
>000801EF    jmp         000801FC
 000801F1    mov         eax,dword ptr [ebp+0C]
 000801F4    mov         eax,dword ptr [eax-4]
 000801F7    imul        esi
 000801F9    mov         dword ptr [ebp-8],eax
 000801FC    cmp         dword ptr [ebx],0
>000801FF    je          00080215
 00080201    push        esi
 00080202    mov         eax,dword ptr [ebp+0C]
 00080205    mov         ecx,dword ptr [eax-4]
 00080208    mov         eax,dword ptr [ebp+0C]
 0008020B    mov         edx,dword ptr [eax-8]
 0008020E    mov         eax,ebx
 00080210    call        ModifyExtents
 00080215    mov         eax,dword ptr [ebp-4]
 00080218    mov         edx,dword ptr [ebp-0C]
 0008021B    mov         dword ptr [eax],edx
 0008021D    mov         eax,dword ptr [ebp+8]
 00080220    mov         eax,dword ptr [eax]
 00080222    mov         edx,dword ptr [ebp+0C]
 00080225    cmp         eax,dword ptr [edx-8]
>00080228    jl          0008025E
 0008022A    mov         eax,dword ptr [ebp+0C]
 0008022D    cmp         dword ptr [eax-4],0
>00080231    jge         00080253
 00080233    mov         eax,dword ptr [ebp+0C]
 00080236    mov         eax,dword ptr [eax-8]
 00080239    mov         edx,dword ptr [ebp+0C]
 0008023C    sub         eax,dword ptr [edx-4]
 0008023F    mov         edx,dword ptr [ebp+8]
 00080242    cmp         eax,dword ptr [edx]
>00080244    jle         00080253
 00080246    mov         eax,dword ptr [ebp+0C]
 00080249    mov         eax,dword ptr [eax-8]
 0008024C    mov         edx,dword ptr [ebp+8]
 0008024F    mov         dword ptr [edx],eax
>00080251    jmp         0008025E
 00080253    mov         eax,dword ptr [ebp+0C]
 00080256    mov         eax,dword ptr [eax-4]
 00080259    mov         edx,dword ptr [ebp+8]
 0008025C    add         dword ptr [edx],eax
 0008025E    xor         eax,eax
 00080260    pop         edx
 00080261    pop         ecx
 00080262    pop         ecx
 00080263    mov         dword ptr fs:[eax],edx
 00080266    push        8027B
 0008026B    lea         eax,[ebp-10]
 0008026E    call        @LStrClr
 00080273    ret
>00080274    jmp         @HandleFinally
>00080279    jmp         0008026B
 0008027B    mov         eax,dword ptr [ebp-8]
 0008027E    pop         esi
 0008027F    pop         ebx
 00080280    mov         esp,ebp
 00080282    pop         ebp
 00080283    ret         4
*}
end;

//00080288
procedure TCustomGrid.AdjustSize(Index:Longint; Amount:Longint; Rows:Boolean);
begin
{*
 00080288    push        ebp
 00080289    mov         ebp,esp
 0008028B    add         esp,0FFFFFFC4
 0008028E    push        ebx
 0008028F    push        esi
 00080290    push        edi
 00080291    mov         dword ptr [ebp-4],ecx
 00080294    mov         dword ptr [ebp-8],edx
 00080297    mov         esi,eax
 00080299    cmp         dword ptr [ebp-4],0
>0008029D    je          000803E0
 000802A3    mov         eax,dword ptr [esi+208]
 000802A9    mov         dword ptr [ebp-10],eax
 000802AC    mov         eax,dword ptr [esi+20C]
 000802B2    mov         dword ptr [ebp-0C],eax
 000802B5    mov         eax,dword ptr [esi+1FC]
 000802BB    mov         dword ptr [ebp-18],eax
 000802BE    mov         edx,dword ptr [esi+22C]
 000802C4    mov         dword ptr [ebp-14],edx
 000802C7    mov         ecx,dword ptr [esi+218]
 000802CD    mov         dword ptr [ebp-2C],ecx
 000802D0    dec         eax
 000802D1    mov         dword ptr [ebp-24],eax
 000802D4    mov         eax,dword ptr [esi+21C]
 000802DA    mov         dword ptr [ebp-28],eax
 000802DD    dec         edx
 000802DE    mov         dword ptr [ebp-20],edx
 000802E1    xor         edi,edi
 000802E3    xor         eax,eax
 000802E5    mov         dword ptr [ebp-1C],eax
 000802E8    mov         ebx,dword ptr [ebp-4]
 000802EB    test        ebx,ebx
>000802ED    jge         000802F1
 000802EF    neg         ebx
 000802F1    cmp         byte ptr [ebp+8],0
>000802F5    je          00080330
 000802F7    push        ebp
 000802F8    lea         eax,[ebp-0C]
 000802FB    push        eax
 000802FC    lea         edx,[esi+230]
 00080302    lea         eax,[esi+22C]
 00080308    mov         ecx,dword ptr [esi+214]
 0008030E    call        DoSizeAdjust
 00080313    pop         ecx
 00080314    mov         dword ptr [ebp-1C],eax
 00080317    mov         eax,dword ptr [ebp-8]
 0008031A    mov         dword ptr [ebp-28],eax
 0008031D    add         ebx,dword ptr [ebp-8]
 00080320    mov         eax,dword ptr [esi+23C]
 00080326    cmp         ebx,eax
>00080328    jg          00080366
 0008032A    dec         eax
 0008032B    mov         dword ptr [ebp-20],eax
>0008032E    jmp         00080366
 00080330    push        ebp
 00080331    lea         eax,[ebp-10]
 00080334    push        eax
 00080335    lea         edx,[esi+200]
 0008033B    lea         eax,[esi+1FC]
 00080341    mov         ecx,dword ptr [esi+210]
 00080347    call        DoSizeAdjust
 0008034C    pop         ecx
 0008034D    mov         edi,eax
 0008034F    mov         eax,dword ptr [ebp-8]
 00080352    mov         dword ptr [ebp-2C],eax
 00080355    add         ebx,dword ptr [ebp-8]
 00080358    mov         eax,dword ptr [esi+238]
 0008035E    cmp         ebx,eax
>00080360    jg          00080366
 00080362    dec         eax
 00080363    mov         dword ptr [ebp-24],eax
 00080366    push        1
 00080368    lea         ecx,[ebp-3C]
 0008036B    lea         edx,[ebp-2C]
 0008036E    mov         eax,esi
 00080370    call        TCustomGrid.GridRectToScreenRect
 00080375    lea         eax,[ebp-3C]
 00080378    push        eax
 00080379    call        user32.IsRectEmpty
 0008037E    test        eax,eax
>00080380    jne         000803A9
 00080382    lea         eax,[ebp-3C]
 00080385    push        eax
 00080386    lea         eax,[ebp-3C]
 00080389    push        eax
 0008038A    mov         eax,dword ptr [ebp-1C]
 0008038D    push        eax
 0008038E    push        edi
 0008038F    mov         eax,esi
 00080391    call        TWinControl.GetHandle
 00080396    push        eax
 00080397    call        user32.ScrollWindow
 0008039C    mov         eax,esi
 0008039E    call        TWinControl.GetHandle
 000803A3    push        eax
 000803A4    call        user32.UpdateWindow
 000803A9    mov         ecx,dword ptr [ebp-14]
 000803AC    mov         edx,dword ptr [ebp-18]
 000803AF    mov         eax,esi
 000803B1    mov         bx,0FFAE
 000803B5    call        @CallDynaInst
 000803BA    mov         eax,dword ptr [ebp-10]
 000803BD    cmp         eax,dword ptr [esi+208]
>000803C3    jne         000803D0
 000803C5    mov         edx,dword ptr [ebp-0C]
 000803C8    cmp         edx,dword ptr [esi+20C]
>000803CE    je          000803E0
 000803D0    push        1
 000803D2    push        1
 000803D4    mov         ecx,dword ptr [ebp-0C]
 000803D7    mov         edx,eax
 000803D9    mov         eax,esi
 000803DB    call        TCustomGrid.MoveCurrent
 000803E0    pop         edi
 000803E1    pop         esi
 000803E2    pop         ebx
 000803E3    mov         esp,ebp
 000803E5    pop         ebp
 000803E6    ret         4
*}
end;

//000803EC
function TCustomGrid.BoxRect(ALeft:Longint; ATop:Longint; ARight:Longint; ABottom:Longint):TRect;
begin
{*
 000803EC    push        ebp
 000803ED    mov         ebp,esp
 000803EF    add         esp,0FFFFFFF0
 000803F2    push        esi
 000803F3    mov         esi,eax
 000803F5    mov         dword ptr [ebp-10],edx
 000803F8    mov         eax,dword ptr [ebp+10]
 000803FB    mov         dword ptr [ebp-8],eax
 000803FE    mov         dword ptr [ebp-0C],ecx
 00080401    mov         eax,dword ptr [ebp+0C]
 00080404    mov         dword ptr [ebp-4],eax
 00080407    push        0
 00080409    mov         ecx,dword ptr [ebp+8]
 0008040C    lea         edx,[ebp-10]
 0008040F    mov         eax,esi
 00080411    call        TCustomGrid.GridRectToScreenRect
 00080416    pop         esi
 00080417    mov         esp,ebp
 00080419    pop         ebp
 0008041A    ret         0C
*}
end;

//00080420
procedure TCustomGrid.DoExit;
begin
{*
 00080420    push        ebx
 00080421    mov         ebx,eax
 00080423    mov         eax,ebx
 00080425    call        TWinControl.DoExit
 0008042A    test        byte ptr [ebx+229],20
>00080431    jne         0008043A
 00080433    mov         eax,ebx
 00080435    call        TCustomGrid.HideEditor
 0008043A    pop         ebx
 0008043B    ret
*}
end;

//0008043C
function TCustomGrid.CellRect(ACol:Longint; ARow:Longint):TRect;
begin
{*
 0008043C    push        ebp
 0008043D    mov         ebp,esp
 0008043F    push        ebx
 00080440    push        esi
 00080441    push        edi
 00080442    mov         edi,ecx
 00080444    mov         esi,edx
 00080446    mov         ebx,eax
 00080448    push        esi
 00080449    push        edi
 0008044A    mov         eax,dword ptr [ebp+8]
 0008044D    push        eax
 0008044E    mov         ecx,edi
 00080450    mov         edx,esi
 00080452    mov         eax,ebx
 00080454    call        TCustomGrid.BoxRect
 00080459    pop         edi
 0008045A    pop         esi
 0008045B    pop         ebx
 0008045C    pop         ebp
 0008045D    ret         4
*}
end;

//00080460
procedure TCustomGrid.sub_00080460;
begin
{*
 00080460    mov         al,1
 00080462    ret
*}
end;

//00080464
procedure TCustomGrid.sub_00080464;
begin
{*
 00080464    mov         al,1
 00080466    ret
*}
end;

//00080468
procedure TCustomGrid.sub_00080468;
begin
{*
 00080468    mov         al,byte ptr [eax+1F9];TCustomGrid.FCanEditModify:Boolean
 0008046E    ret
*}
end;

//00080470
function TCustomGrid.CanEditShow:Boolean;
begin
{*
 00080470    push        ebx
 00080471    mov         ebx,eax
 00080473    mov         ax,word ptr [ebx+228]
 0008047A    and         ax,word ptr ds:[804C4]
 00080481    mov         dx,word ptr ds:[804C8]
 00080488    cmp         dx,ax
>0008048B    jne         000804BB
 0008048D    cmp         byte ptr [ebx+26D],0
>00080494    je          000804BB
 00080496    test        byte ptr [ebx+20],10
>0008049A    jne         000804BB
 0008049C    mov         eax,ebx
 0008049E    call        TWinControl.HandleAllocated
 000804A3    test        al,al
>000804A5    je          000804BB
 000804A7    test        byte ptr [ebx+229],20
>000804AE    jne         000804BF
 000804B0    mov         eax,ebx
 000804B2    call        TCustomGrid.IsActiveControl
 000804B7    test        al,al
>000804B9    jne         000804BF
 000804BB    xor         eax,eax
 000804BD    pop         ebx
 000804BE    ret
 000804BF    mov         al,1
 000804C1    pop         ebx
 000804C2    ret
*}
end;

//000804CC
function TCustomGrid.IsActiveControl:Boolean;
begin
{*
 000804CC    push        ebx
 000804CD    push        esi
 000804CE    push        edi
 000804CF    mov         esi,eax
 000804D1    xor         ebx,ebx
 000804D3    mov         eax,esi
 000804D5    call        GetParentForm
 000804DA    test        eax,eax
>000804DC    je          000804EA
 000804DE    cmp         esi,dword ptr [eax+200]
>000804E4    jne         00080515
 000804E6    mov         bl,1
>000804E8    jmp         00080515
 000804EA    call        user32.GetFocus
 000804EF    mov         edi,eax
>000804F1    jmp         00080507
 000804F3    cmp         edi,dword ptr [esi+140]
>000804F9    jne         000804FF
 000804FB    mov         bl,1
>000804FD    jmp         00080507
 000804FF    push        edi
 00080500    call        user32.GetParent
 00080505    mov         edi,eax
 00080507    push        edi
 00080508    call        user32.IsWindow
 0008050D    test        eax,eax
>0008050F    je          00080515
 00080511    test        bl,bl
>00080513    je          000804F3
 00080515    mov         eax,ebx
 00080517    pop         edi
 00080518    pop         esi
 00080519    pop         ebx
 0008051A    ret
*}
end;

//0008051C
procedure TCustomGrid.GetEditMask(ACol:Longint; ARow:Longint);
begin
{*
 0008051C    push        ebp
 0008051D    mov         ebp,esp
 0008051F    mov         eax,dword ptr [ebp+8]
 00080522    call        @LStrClr
 00080527    pop         ebp
 00080528    ret         4
*}
end;

//0008052C
procedure TCustomGrid.GetEditText(ACol:Longint; ARow:Longint);
begin
{*
 0008052C    push        ebp
 0008052D    mov         ebp,esp
 0008052F    mov         eax,dword ptr [ebp+8]
 00080532    call        @LStrClr
 00080537    pop         ebp
 00080538    ret         4
*}
end;

//0008053C
procedure TCustomGrid.sub_0008053C;
begin
{*
 0008053C    push        ebp
 0008053D    mov         ebp,esp
 0008053F    pop         ebp
 00080540    ret         4
*}
end;

//00080544
procedure TCustomGrid.sub_00080544;
begin
{*
 00080544    xor         eax,eax
 00080546    ret
*}
end;

//00080548
procedure TCustomGrid.HideEditor;
begin
{*
 00080548    mov         byte ptr [eax+26D],0
 0008054F    call        TCustomGrid.HideEdit
 00080554    ret
*}
end;

//00080558
procedure TCustomGrid.ShowEditor;
begin
{*
 00080558    mov         byte ptr [eax+26D],1
 0008055F    call        TCustomGrid.UpdateEdit
 00080564    ret
*}
end;

//00080568
procedure TCustomGrid.ShowEditorChar(Ch:Char);
begin
{*
 00080568    push        ebx
 00080569    push        esi
 0008056A    push        edi
 0008056B    mov         ebx,edx
 0008056D    mov         edi,eax
 0008056F    mov         eax,edi
 00080571    call        TCustomGrid.ShowEditor
 00080576    mov         esi,dword ptr [edi+25C]
 0008057C    test        esi,esi
>0008057E    je          00080599
 00080580    push        0
 00080582    xor         eax,eax
 00080584    mov         al,bl
 00080586    push        eax
 00080587    push        102
 0008058C    mov         eax,esi
 0008058E    call        TWinControl.GetHandle
 00080593    push        eax
 00080594    call        user32.PostMessageA
 00080599    pop         edi
 0008059A    pop         esi
 0008059B    pop         ebx
 0008059C    ret
*}
end;

//000805A0
procedure TCustomGrid.InvalidateEditor;
begin
{*
 000805A0    mov         dword ptr [eax+260],0FFFFFFFF
 000805AA    mov         dword ptr [eax+264],0FFFFFFFF
 000805B4    call        TCustomGrid.UpdateEdit
 000805B9    ret
*}
end;

//000805BC
procedure TCustomGrid.ReadColWidths(Reader:TReader);
begin
{*
 000805BC    push        ebx
 000805BD    push        esi
 000805BE    push        edi
 000805BF    push        ebp
 000805C0    mov         ebp,edx
 000805C2    mov         edi,eax
 000805C4    mov         eax,ebp
 000805C6    call        TReader.ReadListBegin
 000805CB    mov         ebx,dword ptr [edi+1FC]
 000805D1    dec         ebx
 000805D2    test        ebx,ebx
>000805D4    jl          000805EF
 000805D6    inc         ebx
 000805D7    xor         esi,esi
 000805D9    mov         eax,ebp
 000805DB    call        TReader.ReadInteger
 000805E0    mov         ecx,eax
 000805E2    mov         edx,esi
 000805E4    mov         eax,edi
 000805E6    call        TCustomGrid.SetColWidths
 000805EB    inc         esi
 000805EC    dec         ebx
>000805ED    jne         000805D9
 000805EF    mov         eax,ebp
 000805F1    call        TReader.ReadListEnd
 000805F6    pop         ebp
 000805F7    pop         edi
 000805F8    pop         esi
 000805F9    pop         ebx
 000805FA    ret
*}
end;

//000805FC
procedure TCustomGrid.ReadRowHeights(Reader:TReader);
begin
{*
 000805FC    push        ebx
 000805FD    push        esi
 000805FE    push        edi
 000805FF    push        ebp
 00080600    mov         ebp,edx
 00080602    mov         edi,eax
 00080604    mov         eax,ebp
 00080606    call        TReader.ReadListBegin
 0008060B    mov         ebx,dword ptr [edi+22C]
 00080611    dec         ebx
 00080612    test        ebx,ebx
>00080614    jl          0008062F
 00080616    inc         ebx
 00080617    xor         esi,esi
 00080619    mov         eax,ebp
 0008061B    call        TReader.ReadInteger
 00080620    mov         ecx,eax
 00080622    mov         edx,esi
 00080624    mov         eax,edi
 00080626    call        TCustomGrid.SetRowHeights
 0008062B    inc         esi
 0008062C    dec         ebx
>0008062D    jne         00080619
 0008062F    mov         eax,ebp
 00080631    call        TReader.ReadListEnd
 00080636    pop         ebp
 00080637    pop         edi
 00080638    pop         esi
 00080639    pop         ebx
 0008063A    ret
*}
end;

//0008063C
procedure TCustomGrid.WriteColWidths(Writer:TWriter);
begin
{*
 0008063C    push        ebx
 0008063D    push        esi
 0008063E    push        edi
 0008063F    push        ebp
 00080640    mov         ebp,edx
 00080642    mov         edi,eax
 00080644    mov         eax,ebp
 00080646    call        TWriter.WriteListBegin
 0008064B    mov         ebx,dword ptr [edi+1FC]
 00080651    dec         ebx
 00080652    test        ebx,ebx
>00080654    jl          0008066F
 00080656    inc         ebx
 00080657    xor         esi,esi
 00080659    mov         edx,esi
 0008065B    mov         eax,edi
 0008065D    call        TCustomGrid.GetColWidths
 00080662    mov         edx,eax
 00080664    mov         eax,ebp
 00080666    call        TWriter.WriteInteger
 0008066B    inc         esi
 0008066C    dec         ebx
>0008066D    jne         00080659
 0008066F    mov         eax,ebp
 00080671    call        TWriter.WriteListEnd
 00080676    pop         ebp
 00080677    pop         edi
 00080678    pop         esi
 00080679    pop         ebx
 0008067A    ret
*}
end;

//0008067C
procedure TCustomGrid.WriteRowHeights(Writer:TWriter);
begin
{*
 0008067C    push        ebx
 0008067D    push        esi
 0008067E    push        edi
 0008067F    push        ebp
 00080680    mov         ebp,edx
 00080682    mov         edi,eax
 00080684    mov         eax,ebp
 00080686    call        TWriter.WriteListBegin
 0008068B    mov         ebx,dword ptr [edi+22C]
 00080691    dec         ebx
 00080692    test        ebx,ebx
>00080694    jl          000806AF
 00080696    inc         ebx
 00080697    xor         esi,esi
 00080699    mov         edx,esi
 0008069B    mov         eax,edi
 0008069D    call        TCustomGrid.GetRowHeights
 000806A2    mov         edx,eax
 000806A4    mov         eax,ebp
 000806A6    call        TWriter.WriteInteger
 000806AB    inc         esi
 000806AC    dec         ebx
>000806AD    jne         00080699
 000806AF    mov         eax,ebp
 000806B1    call        TWriter.WriteListEnd
 000806B6    pop         ebp
 000806B7    pop         edi
 000806B8    pop         esi
 000806B9    pop         ebx
 000806BA    ret
*}
end;

//000806BC
function DoColWidths:Boolean;
begin
{*
 000806BC    push        ebp
 000806BD    mov         ebp,esp
 000806BF    push        ebx
 000806C0    mov         eax,dword ptr [ebp+8]
 000806C3    mov         eax,dword ptr [eax-4]
 000806C6    mov         ebx,dword ptr [eax+1C]
 000806C9    test        ebx,ebx
>000806CB    je          000806EC
 000806CD    mov         eax,dword ptr [ebp+8]
 000806D0    mov         eax,dword ptr [eax-8]
 000806D3    mov         edx,dword ptr [eax+200]
 000806D9    mov         eax,dword ptr [ebp+8]
 000806DC    mov         eax,dword ptr [ebx+200]
 000806E2    call        CompareExtents
 000806E7    xor         al,1
 000806E9    pop         ebx
 000806EA    pop         ebp
 000806EB    ret
 000806EC    mov         eax,dword ptr [ebp+8]
 000806EF    mov         eax,dword ptr [eax-8]
 000806F2    cmp         dword ptr [eax+200],0
 000806F9    setne       al
 000806FC    pop         ebx
 000806FD    pop         ebp
 000806FE    ret
*}
end;

//00080700
function DoRowHeights:Boolean;
begin
{*
 00080700    push        ebp
 00080701    mov         ebp,esp
 00080703    push        ebx
 00080704    mov         eax,dword ptr [ebp+8]
 00080707    mov         eax,dword ptr [eax-4]
 0008070A    mov         ebx,dword ptr [eax+1C]
 0008070D    test        ebx,ebx
>0008070F    je          00080730
 00080711    mov         eax,dword ptr [ebp+8]
 00080714    mov         eax,dword ptr [eax-8]
 00080717    mov         edx,dword ptr [eax+230]
 0008071D    mov         eax,dword ptr [ebp+8]
 00080720    mov         eax,dword ptr [ebx+230]
 00080726    call        CompareExtents
 0008072B    xor         al,1
 0008072D    pop         ebx
 0008072E    pop         ebp
 0008072F    ret
 00080730    mov         eax,dword ptr [ebp+8]
 00080733    mov         eax,dword ptr [eax-8]
 00080736    cmp         dword ptr [eax+230],0
 0008073D    setne       al
 00080740    pop         ebx
 00080741    pop         ebp
 00080742    ret
*}
end;

//00080744
procedure TCustomGrid.DefineProperties(Filer:TFiler);
begin
{*
 00080744    push        ebp
 00080745    mov         ebp,esp
 00080747    add         esp,0FFFFFFF8
 0008074A    push        ebx
 0008074B    mov         dword ptr [ebp-4],edx
 0008074E    mov         dword ptr [ebp-8],eax
 00080751    mov         edx,dword ptr [ebp-4]
 00080754    mov         eax,dword ptr [ebp-8]
 00080757    call        TControl.DefineProperties
 0008075C    mov         eax,dword ptr [ebp-8]
 0008075F    cmp         byte ptr [eax+26F],0
>00080766    je          000807B6
 00080768    mov         eax,dword ptr [ebp-8]
 0008076B    push        eax
 0008076C    push        805BC;TCustomGrid.ReadColWidths
 00080771    mov         eax,dword ptr [ebp-8]
 00080774    push        eax
 00080775    push        8063C;TCustomGrid.WriteColWidths
 0008077A    push        ebp
 0008077B    call        DoColWidths
 00080780    pop         ecx
 00080781    mov         ecx,eax
 00080783    mov         edx,807C4;'ColWidths'
 00080788    mov         eax,dword ptr [ebp-4]
 0008078B    mov         ebx,dword ptr [eax]
 0008078D    call        dword ptr [ebx]
 0008078F    mov         eax,dword ptr [ebp-8]
 00080792    push        eax
 00080793    push        805FC;TCustomGrid.ReadRowHeights
 00080798    mov         eax,dword ptr [ebp-8]
 0008079B    push        eax
 0008079C    push        8067C;TCustomGrid.WriteRowHeights
 000807A1    push        ebp
 000807A2    call        DoRowHeights
 000807A7    pop         ecx
 000807A8    mov         ecx,eax
 000807AA    mov         edx,807D8;'RowHeights'
 000807AF    mov         eax,dword ptr [ebp-4]
 000807B2    mov         ebx,dword ptr [eax]
 000807B4    call        dword ptr [ebx]
 000807B6    pop         ebx
 000807B7    pop         ecx
 000807B8    pop         ecx
 000807B9    pop         ebp
 000807BA    ret
*}
end;

//000807E4
procedure TCustomGrid.MoveColumn(FromIndex:Longint; ToIndex:Longint);
begin
{*
 000807E4    push        ebx
 000807E5    push        esi
 000807E6    push        edi
 000807E7    push        ebp
 000807E8    add         esp,0FFFFFFF0
 000807EB    mov         edi,ecx
 000807ED    mov         ebx,edx
 000807EF    mov         esi,eax
 000807F1    cmp         edi,ebx
>000807F3    je          000808AD
 000807F9    cmp         dword ptr [esi+200],0
>00080800    je          00080825
 00080802    lea         ecx,[edi+1]
 00080805    lea         ebp,[ebx+1]
 00080808    mov         edx,ebp
 0008080A    lea         eax,[esi+200]
 00080810    call        MoveExtent
 00080815    lea         ecx,[edi+1]
 00080818    mov         edx,ebp
 0008081A    lea         eax,[esi+204]
 00080820    call        MoveExtent
 00080825    push        edi
 00080826    lea         edx,[esi+208]
 0008082C    mov         ecx,ebx
 0008082E    mov         eax,esi
 00080830    call        TCustomGrid.MoveAdjust
 00080835    push        edi
 00080836    lea         edx,[esi+1F0]
 0008083C    mov         ecx,ebx
 0008083E    mov         eax,esi
 00080840    call        TCustomGrid.MoveAdjust
 00080845    push        edi
 00080846    lea         edx,[esi+260]
 0008084C    mov         ecx,ebx
 0008084E    mov         eax,esi
 00080850    call        TCustomGrid.MoveAdjust
 00080855    xor         eax,eax
 00080857    mov         dword ptr [esp+4],eax
 0008085B    mov         eax,esi
 0008085D    call        TCustomGrid.GetVisibleRowCount
 00080862    mov         dword ptr [esp+0C],eax
 00080866    cmp         edi,ebx
>00080868    jle         00080873
 0008086A    mov         dword ptr [esp],ebx
 0008086D    mov         dword ptr [esp+8],edi
>00080871    jmp         0008087A
 00080873    mov         dword ptr [esp],edi
 00080876    mov         dword ptr [esp+8],ebx
 0008087A    mov         edx,esp
 0008087C    mov         eax,esi
 0008087E    call        TCustomGrid.InvalidateRect
 00080883    mov         ecx,edi
 00080885    mov         edx,ebx
 00080887    mov         eax,esi
 00080889    mov         bx,0FFB0
 0008088D    call        @CallDynaInst
 00080892    cmp         dword ptr [esi+200],0
>00080899    je          000808A6
 0008089B    mov         eax,esi
 0008089D    mov         bx,0FFAB
 000808A1    call        @CallDynaInst
 000808A6    mov         eax,esi
 000808A8    call        TCustomGrid.UpdateEdit
 000808AD    add         esp,10
 000808B0    pop         ebp
 000808B1    pop         edi
 000808B2    pop         esi
 000808B3    pop         ebx
 000808B4    ret
*}
end;

//000808B8
procedure TCustomGrid.sub_000808B8;
begin
{*
 000808B8    ret
*}
end;

//000808BC
procedure TCustomGrid.MoveRow(FromIndex:Longint; ToIndex:Longint);
begin
{*
 000808BC    push        ebx
 000808BD    push        esi
 000808BE    push        edi
 000808BF    mov         edi,ecx
 000808C1    mov         ebx,edx
 000808C3    mov         esi,eax
 000808C5    cmp         dword ptr [esi+230],0
>000808CC    je          000808DF
 000808CE    lea         ecx,[edi+1]
 000808D1    lea         edx,[ebx+1]
 000808D4    lea         eax,[esi+230]
 000808DA    call        MoveExtent
 000808DF    push        edi
 000808E0    lea         edx,[esi+20C]
 000808E6    mov         ecx,ebx
 000808E8    mov         eax,esi
 000808EA    call        TCustomGrid.MoveAdjust
 000808EF    push        edi
 000808F0    lea         edx,[esi+1F4]
 000808F6    mov         ecx,ebx
 000808F8    mov         eax,esi
 000808FA    call        TCustomGrid.MoveAdjust
 000808FF    push        edi
 00080900    lea         edx,[esi+264]
 00080906    mov         ecx,ebx
 00080908    mov         eax,esi
 0008090A    call        TCustomGrid.MoveAdjust
 0008090F    mov         ecx,edi
 00080911    mov         edx,ebx
 00080913    mov         eax,esi
 00080915    mov         bx,0FFAF
 00080919    call        @CallDynaInst
 0008091E    cmp         dword ptr [esi+230],0
>00080925    je          00080932
 00080927    mov         eax,esi
 00080929    mov         bx,0FFAA
 0008092D    call        @CallDynaInst
 00080932    mov         eax,esi
 00080934    call        TCustomGrid.UpdateEdit
 00080939    pop         edi
 0008093A    pop         esi
 0008093B    pop         ebx
 0008093C    ret
*}
end;

//00080940
procedure TCustomGrid.sub_00080940;
begin
{*
 00080940    ret
*}
end;

//00080944
function TCustomGrid.MouseCoord(X:Integer; Y:Integer):TGridCoord;
begin
{*
 00080944    push        ebp
 00080945    mov         ebp,esp
 00080947    add         esp,0FFFFFFA4
 0008094A    push        ebx
 0008094B    push        esi
 0008094C    push        edi
 0008094D    mov         dword ptr [ebp-4],ecx
 00080950    mov         edi,edx
 00080952    mov         esi,eax
 00080954    mov         ebx,dword ptr [ebp+8]
 00080957    lea         edx,[ebp-5C]
 0008095A    mov         eax,esi
 0008095C    call        TCustomGrid.CalcDrawInfo
 00080961    lea         eax,[ebp-5C]
 00080964    push        eax
 00080965    push        ebx
 00080966    mov         ecx,dword ptr [ebp-4]
 00080969    mov         edx,edi
 0008096B    mov         eax,esi
 0008096D    call        TCustomGrid.CalcCoordFromPoint
 00080972    cmp         dword ptr [ebx],0
>00080975    jge         00080980
 00080977    mov         dword ptr [ebx+4],0FFFFFFFF
>0008097E    jmp         0008098C
 00080980    cmp         dword ptr [ebx+4],0
>00080984    jge         0008098C
 00080986    mov         dword ptr [ebx],0FFFFFFFF
 0008098C    pop         edi
 0008098D    pop         esi
 0008098E    pop         ebx
 0008098F    mov         esp,ebp
 00080991    pop         ebp
 00080992    ret         4
*}
end;

//00080998
{*function sub_00080998:?;
begin
 00080998    mov         al,1
 0008099A    ret
end;*}

//0008099C
procedure TCustomGrid.sub_0008099C;
begin
{*
 0008099C    ret
*}
end;

//000809A0
function TCustomGrid.Sizing(X:Integer; Y:Integer):Boolean;
begin
{*
 000809A0    push        ebx
 000809A1    push        esi
 000809A2    push        edi
 000809A3    add         esp,0FFFFFF98
 000809A6    mov         edi,ecx
 000809A8    mov         esi,edx
 000809AA    mov         ebx,eax
 000809AC    mov         al,byte ptr [ebx+26E]
 000809B2    mov         byte ptr [esp],al
 000809B5    cmp         byte ptr [esp],0
>000809B9    jne         000809E9
 000809BB    lea         edx,[esp+10]
 000809BF    mov         eax,ebx
 000809C1    call        TCustomGrid.CalcDrawInfo
 000809C6    push        esp
 000809C7    lea         eax,[esp+8]
 000809CB    push        eax
 000809CC    lea         eax,[esp+10]
 000809D0    push        eax
 000809D1    lea         eax,[esp+18]
 000809D5    push        eax
 000809D6    lea         eax,[esp+20]
 000809DA    push        eax
 000809DB    mov         ecx,edi
 000809DD    mov         edx,esi
 000809DF    mov         eax,ebx
 000809E1    mov         ebx,dword ptr [eax]
 000809E3    call        dword ptr [ebx+0BC]
 000809E9    cmp         byte ptr [esp],0
 000809ED    setne       al
 000809F0    add         esp,68
 000809F3    pop         edi
 000809F4    pop         esi
 000809F5    pop         ebx
 000809F6    ret
*}
end;

//000809F8
procedure TCustomGrid.TopLeftChanged;
begin
{*
 000809F8    push        ebx
 000809F9    add         esp,0FFFFFFF0
 000809FC    mov         ebx,eax
 000809FE    cmp         byte ptr [ebx+26D],0
>00080A05    je          00080A31
 00080A07    cmp         dword ptr [ebx+25C],0
>00080A0E    je          00080A31
 00080A10    push        esp
 00080A11    mov         ecx,dword ptr [ebx+20C]
 00080A17    mov         edx,dword ptr [ebx+208]
 00080A1D    mov         eax,ebx
 00080A1F    call        TCustomGrid.CellRect
 00080A24    mov         edx,esp
 00080A26    mov         eax,dword ptr [ebx+25C]
 00080A2C    call        TInplaceEdit.UpdateLoc
 00080A31    add         esp,10
 00080A34    pop         ebx
 00080A35    ret
*}
end;

//00080A38
procedure FillDWord(var Dest:void ; Count:Integer; Value:Integer);
begin
{*
 00080A38    xchg        ecx,edx
 00080A3A    push        edi
 00080A3B    mov         edi,eax
 00080A3D    mov         eax,edx
 00080A3F    rep stos    dword ptr [edi]
 00080A41    pop         edi
 00080A42    ret
*}
end;

//00080A44
function StackAlloc(Size:Integer):Pointer;
begin
{*
 00080A44    pop         ecx
 00080A45    mov         edx,esp
 00080A47    add         eax,3
 00080A4A    and         eax,0FFFFFFFC
 00080A4D    cmp         eax,0FFC
>00080A52    jle         00080A67
 00080A54    sub         esp,0FFC
 00080A5A    push        eax
 00080A5B    sub         eax,1000
>00080A60    jns         00080A54
 00080A62    add         eax,1000
 00080A67    sub         esp,eax
 00080A69    mov         eax,esp
 00080A6B    push        edx
 00080A6C    mov         edx,esp
 00080A6E    sub         edx,4
 00080A71    push        edx
 00080A72    push        ecx
 00080A73    ret
*}
end;

//00080A74
procedure StackFree(P:Pointer);
begin
{*
 00080A74    pop         ecx
 00080A75    mov         edx,dword ptr [esp]
 00080A78    sub         eax,8
 00080A7B    cmp         edx,esp
>00080A7D    jne         00080A87
 00080A7F    cmp         edx,eax
>00080A81    jne         00080A87
 00080A83    mov         esp,dword ptr [esp+4]
 00080A87    push        ecx
 00080A88    ret
*}
end;

//00080A8C
procedure DrawAxisLines(const AxisInfo:TGridAxisDrawInfo; Cell:Integer; MajorIndex:Integer; UseOnColor:Boolean);
begin
{*
 00080A8C    push        ebp
 00080A8D    mov         ebp,esp
 00080A8F    add         esp,0FFFFFFDC
 00080A92    push        ebx
 00080A93    push        esi
 00080A94    push        edi
 00080A95    mov         esi,ecx
 00080A97    mov         dword ptr [ebp-8],edx
 00080A9A    mov         dword ptr [ebp-4],eax
 00080A9D    mov         eax,dword ptr [ebp+0C]
 00080AA0    mov         eax,dword ptr [eax+1C]
 00080AA3    mov         eax,dword ptr [eax-4]
 00080AA6    mov         ebx,dword ptr [eax+1EC]
 00080AAC    mov         eax,dword ptr [ebp-4]
 00080AAF    cmp         dword ptr [eax],0
>00080AB2    je          00080C2F
 00080AB8    mov         eax,dword ptr [ebp+0C]
 00080ABB    mov         eax,dword ptr [eax+1C]
 00080ABE    mov         eax,dword ptr [eax-4]
 00080AC1    mov         edx,dword ptr [eax+224]
 00080AC7    mov         eax,dword ptr [ebx+10]
 00080ACA    call        TPen.SetWidth
 00080ACF    cmp         byte ptr [ebp+8],0
>00080AD3    je          00080AE5
 00080AD5    mov         eax,dword ptr [ebp+0C]
 00080AD8    mov         edx,dword ptr [eax+0C]
 00080ADB    mov         eax,dword ptr [ebx+10]
 00080ADE    call        TPen.SetColor
>00080AE3    jmp         00080AF3
 00080AE5    mov         eax,dword ptr [ebp+0C]
 00080AE8    mov         edx,dword ptr [eax+8]
 00080AEB    mov         eax,dword ptr [ebx+10]
 00080AEE    call        TPen.SetColor
 00080AF3    mov         eax,dword ptr [ebx+10]
 00080AF6    call        TPen.GetWidth
 00080AFB    dec         eax
>00080AFC    jle         00080B39
 00080AFE    xor         eax,eax
 00080B00    mov         dword ptr [ebp-24],eax
 00080B03    mov         eax,dword ptr [ebx+10]
 00080B06    call        TPen.GetColor
 00080B0B    mov         dword ptr [ebp-20],eax
 00080B0E    xor         eax,eax
 00080B10    mov         dword ptr [ebp-1C],eax
 00080B13    push        0
 00080B15    push        0
 00080B17    lea         eax,[ebp-24]
 00080B1A    push        eax
 00080B1B    mov         edi,dword ptr [ebx+10]
 00080B1E    mov         eax,edi
 00080B20    call        TPen.GetWidth
 00080B25    push        eax
 00080B26    push        12200
 00080B2B    call        gdi32.ExtCreatePen
 00080B30    mov         edx,eax
 00080B32    mov         eax,edi
 00080B34    call        TBrush.SetHandle
 00080B39    mov         eax,dword ptr [ebp+0C]
 00080B3C    mov         eax,dword ptr [eax+1C]
 00080B3F    mov         edi,dword ptr [eax-8]
 00080B42    mov         ebx,dword ptr [ebp-4]
 00080B45    mov         edx,dword ptr [ebp-8]
 00080B48    mov         eax,dword ptr [ebx+28]
 00080B4B    call        dword ptr [ebx+24]
 00080B4E    mov         edx,dword ptr [ebp+0C]
 00080B51    mov         edx,dword ptr [edx+14]
 00080B54    mov         edx,dword ptr [edx+esi*4]
 00080B57    mov         ecx,dword ptr [ebp-4]
 00080B5A    mov         ecx,dword ptr [ecx]
 00080B5C    shr         ecx,1
 00080B5E    add         edx,ecx
 00080B60    add         eax,edx
 00080B62    mov         dword ptr [ebp-0C],eax
 00080B65    mov         eax,dword ptr [ebp+0C]
 00080B68    mov         eax,dword ptr [eax+1C]
 00080B6B    mov         eax,dword ptr [eax-4]
 00080B6E    mov         bx,0FFCF
 00080B72    call        @CallDynaInst
 00080B77    test        al,al
>00080B79    je          00080B82
 00080B7B    test        esi,esi
>00080B7D    jne         00080B82
 00080B7F    inc         dword ptr [ebp-0C]
 00080B82    mov         eax,esi
 00080B84    xor         eax,1
 00080B87    mov         edx,dword ptr [ebp+0C]
 00080B8A    mov         edx,dword ptr [edx+14]
 00080B8D    mov         edx,dword ptr [edx+eax*4]
 00080B90    mov         dword ptr [ebp-14],edx
 00080B93    add         eax,2
 00080B96    mov         edx,dword ptr [ebp+0C]
 00080B99    mov         edx,dword ptr [edx+14]
 00080B9C    mov         eax,dword ptr [edx+eax*4]
 00080B9F    mov         dword ptr [ebp-18],eax
 00080BA2    lea         eax,[esi+2]
 00080BA5    mov         edx,dword ptr [ebp+0C]
 00080BA8    mov         edx,dword ptr [edx+14]
 00080BAB    mov         eax,dword ptr [edx+eax*4]
 00080BAE    mov         edx,dword ptr [ebp-4]
 00080BB1    add         eax,dword ptr [edx]
 00080BB3    mov         dword ptr [ebp-10],eax
 00080BB6    xor         ebx,ebx
 00080BB8    lea         eax,[esi+ebx]
 00080BBB    mov         edx,dword ptr [ebp-0C]
 00080BBE    mov         dword ptr [edi+eax*4],edx
 00080BC1    mov         eax,esi
 00080BC3    xor         eax,1
 00080BC6    mov         edx,eax
 00080BC8    add         edx,ebx
 00080BCA    mov         ecx,dword ptr [ebp-14]
 00080BCD    mov         dword ptr [edi+edx*4],ecx
 00080BD0    add         ebx,2
 00080BD3    lea         edx,[esi+ebx]
 00080BD6    mov         ecx,dword ptr [ebp-0C]
 00080BD9    mov         dword ptr [edi+edx*4],ecx
 00080BDC    add         eax,ebx
 00080BDE    mov         edx,dword ptr [ebp-18]
 00080BE1    mov         dword ptr [edi+eax*4],edx
 00080BE4    add         ebx,2
 00080BE7    inc         dword ptr [ebp-8]
 00080BEA    mov         ecx,dword ptr [ebp-4]
 00080BED    mov         edx,dword ptr [ebp-8]
 00080BF0    mov         eax,dword ptr [ecx+28]
 00080BF3    call        dword ptr [ecx+24]
 00080BF6    mov         edx,dword ptr [ebp-4]
 00080BF9    add         eax,dword ptr [edx]
 00080BFB    add         dword ptr [ebp-0C],eax
 00080BFE    mov         eax,dword ptr [ebp-0C]
 00080C01    cmp         eax,dword ptr [ebp-10]
>00080C04    jle         00080BB8
 00080C06    shr         ebx,2
 00080C09    push        ebx
 00080C0A    mov         eax,dword ptr [ebp+0C]
 00080C0D    mov         eax,dword ptr [eax+1C]
 00080C10    mov         eax,dword ptr [eax-0C]
 00080C13    push        eax
 00080C14    push        edi
 00080C15    mov         eax,dword ptr [ebp+0C]
 00080C18    mov         eax,dword ptr [eax+1C]
 00080C1B    mov         eax,dword ptr [eax-4]
 00080C1E    mov         eax,dword ptr [eax+1EC]
 00080C24    call        TCanvas.GetHandle
 00080C29    push        eax
 00080C2A    call        gdi32.PolyPolyline
 00080C2F    pop         edi
 00080C30    pop         esi
 00080C31    pop         ebx
 00080C32    mov         esp,ebp
 00080C34    pop         ebp
 00080C35    ret         4
*}
end;

//00080C38
procedure DrawLines(DoHorz:Boolean; DoVert:Boolean; Col:Longint; Row:Longint; const CellBounds:array[$0..-$1] of System.Integer; const _Dv_:$0..-$1; OnColor:TColor; OffColor:TColor);
begin
{*
 00080C38    push        ebp
 00080C39    mov         ebp,esp
 00080C3B    push        ecx
 00080C3C    push        ebx
 00080C3D    push        esi
 00080C3E    push        edi
 00080C3F    mov         esi,ecx
 00080C41    mov         byte ptr [ebp-1],dl
 00080C44    mov         ebx,eax
 00080C46    mov         edi,dword ptr [ebp+18]
 00080C49    mov         eax,dword ptr [ebp+14]
 00080C4C    mov         eax,dword ptr [eax]
 00080C4E    mov         edx,dword ptr [ebp+14]
 00080C51    cmp         eax,dword ptr [edx+8]
>00080C54    je          00080CBE
 00080C56    mov         eax,dword ptr [ebp+14]
 00080C59    mov         eax,dword ptr [eax+4]
 00080C5C    mov         edx,dword ptr [ebp+14]
 00080C5F    cmp         eax,dword ptr [edx+0C]
>00080C62    je          00080CBE
 00080C64    test        bl,bl
>00080C66    jne         00080C94
 00080C68    push        ebp
 00080C69    push        ebx
 00080C6A    mov         eax,dword ptr [ebp+1C]
 00080C6D    add         eax,0FFFFFFC8
 00080C70    mov         ecx,1
 00080C75    mov         edx,edi
 00080C77    call        DrawAxisLines
 00080C7C    pop         ecx
 00080C7D    push        ebp
 00080C7E    mov         al,byte ptr [ebp-1]
 00080C81    push        eax
 00080C82    mov         eax,dword ptr [ebp+1C]
 00080C85    add         eax,0FFFFFF9C
 00080C88    xor         ecx,ecx
 00080C8A    mov         edx,esi
 00080C8C    call        DrawAxisLines
 00080C91    pop         ecx
>00080C92    jmp         00080CBE
 00080C94    push        ebp
 00080C95    mov         al,byte ptr [ebp-1]
 00080C98    push        eax
 00080C99    mov         eax,dword ptr [ebp+1C]
 00080C9C    add         eax,0FFFFFF9C
 00080C9F    xor         ecx,ecx
 00080CA1    mov         edx,esi
 00080CA3    call        DrawAxisLines
 00080CA8    pop         ecx
 00080CA9    push        ebp
 00080CAA    push        ebx
 00080CAB    mov         eax,dword ptr [ebp+1C]
 00080CAE    add         eax,0FFFFFFC8
 00080CB1    mov         ecx,1
 00080CB6    mov         edx,edi
 00080CB8    call        DrawAxisLines
 00080CBD    pop         ecx
 00080CBE    pop         edi
 00080CBF    pop         esi
 00080CC0    pop         ebx
 00080CC1    pop         ecx
 00080CC2    pop         ebp
 00080CC3    ret         14
*}
end;

//00080CC8
procedure DrawCells(ACol:Longint; ARow:Longint; StartX:Integer; StartY:Integer; StopX:Integer; StopY:Integer; Color:TColor; IncludeDrawState:TGridDrawState);
begin
{*
 00080CC8    push        ebp
 00080CC9    mov         ebp,esp
 00080CCB    add         esp,0FFFFFFC0
 00080CCE    push        ebx
 00080CCF    push        esi
 00080CD0    push        edi
 00080CD1    mov         dword ptr [ebp-8],ecx
 00080CD4    mov         dword ptr [ebp-4],eax
 00080CD7    mov         esi,dword ptr [ebp+1C]
 00080CDA    add         esi,0FFFFFFFC
 00080CDD    mov         dword ptr [ebp-0C],edx
 00080CE0    mov         eax,dword ptr [ebp+18]
 00080CE3    mov         dword ptr [ebp-2C],eax
>00080CE6    jmp         00080FCD
 00080CEB    mov         edi,dword ptr [ebp-4]
 00080CEE    mov         eax,dword ptr [ebp-8]
 00080CF1    mov         dword ptr [ebp-30],eax
 00080CF4    mov         eax,dword ptr [esi]
 00080CF6    mov         edx,dword ptr [ebp-0C]
 00080CF9    call        TCustomGrid.GetRowHeights
 00080CFE    add         eax,dword ptr [ebp-2C]
 00080D01    mov         dword ptr [ebp-24],eax
>00080D04    jmp         00080FA8
 00080D09    mov         eax,dword ptr [esi]
 00080D0B    mov         edx,edi
 00080D0D    call        TCustomGrid.GetColWidths
 00080D12    add         eax,dword ptr [ebp-30]
 00080D15    mov         dword ptr [ebp-28],eax
 00080D18    mov         eax,dword ptr [ebp-28]
 00080D1B    cmp         eax,dword ptr [ebp-30]
>00080D1E    jle         00080F9B
 00080D24    lea         eax,[ebp-30]
 00080D27    push        eax
 00080D28    mov         eax,dword ptr [esi]
 00080D2A    mov         eax,dword ptr [eax+1EC]
 00080D30    call        TCanvas.GetHandle
 00080D35    push        eax
 00080D36    call        gdi32.RectVisible
 00080D3B    test        eax,eax
>00080D3D    je          00080F9B
 00080D43    mov         al,byte ptr [ebp+8]
 00080D46    mov         byte ptr [ebp-0D],al
 00080D49    mov         eax,dword ptr [esi]
 00080D4B    call        TCustomGrid.IsActiveControl
 00080D50    test        al,al
>00080D52    je          00080D6F
 00080D54    mov         eax,dword ptr [esi]
 00080D56    mov         eax,dword ptr [eax+20C]
 00080D5C    cmp         eax,dword ptr [ebp-0C]
>00080D5F    jne         00080D6F
 00080D61    mov         eax,dword ptr [esi]
 00080D63    cmp         edi,dword ptr [eax+208]
>00080D69    jne         00080D6F
 00080D6B    or          byte ptr [ebp-0D],2
 00080D6F    mov         eax,dword ptr [ebp+1C]
 00080D72    lea         ecx,[eax-74]
 00080D75    mov         edx,dword ptr [ebp-0C]
 00080D78    mov         eax,edi
 00080D7A    call        PointInGridRect
 00080D7F    test        al,al
>00080D81    je          00080D87
 00080D83    or          byte ptr [ebp-0D],1
 00080D87    test        byte ptr [ebp-0D],2
>00080D8B    je          00080DAF
 00080D8D    mov         eax,dword ptr [esi]
 00080D8F    test        byte ptr [eax+229],4
>00080D96    je          00080DAF
 00080D98    mov         eax,dword ptr [esi]
 00080D9A    cmp         byte ptr [eax+26D],0
>00080DA1    je          00080DAF
 00080DA3    mov         eax,dword ptr [esi]
 00080DA5    test        byte ptr [eax+20],10
>00080DA9    je          00080F9B
 00080DAF    mov         eax,dword ptr [esi]
 00080DB1    cmp         byte ptr [eax+26C],0
>00080DB8    jne         00080DC2
 00080DBA    mov         eax,dword ptr [esi]
 00080DBC    test        byte ptr [eax+20],10
>00080DC0    je          00080E2F
 00080DC2    mov         eax,dword ptr [esi]
 00080DC4    mov         ebx,dword ptr [eax+1EC]
 00080DCA    mov         eax,dword ptr [esi]
 00080DCC    mov         edx,dword ptr [eax+58]
 00080DCF    mov         eax,ebx
 00080DD1    call        TCanvas.SetFont
 00080DD6    test        byte ptr [ebp-0D],1
>00080DDA    je          00080E1A
 00080DDC    test        byte ptr [ebp-0D],2
>00080DE0    je          00080DFE
 00080DE2    mov         eax,dword ptr [esi]
 00080DE4    mov         ax,word ptr [eax+228]
 00080DEB    and         ax,word ptr ds:[80FF0]
 00080DF2    mov         dx,word ptr ds:[80FF4]
 00080DF9    cmp         dx,ax
>00080DFC    je          00080E1A
 00080DFE    mov         eax,dword ptr [ebx+14]
 00080E01    mov         edx,8000000D
 00080E06    call        TBrush.SetColor
 00080E0B    mov         eax,dword ptr [ebx+0C]
 00080E0E    mov         edx,8000000E
 00080E13    call        TFont.SetColor
>00080E18    jmp         00080E25
 00080E1A    mov         eax,dword ptr [ebx+14]
 00080E1D    mov         edx,dword ptr [ebp+0C]
 00080E20    call        TBrush.SetColor
 00080E25    lea         edx,[ebp-30]
 00080E28    mov         eax,ebx
 00080E2A    call        TCanvas.FillRect
 00080E2F    lea         eax,[ebp-30]
 00080E32    push        eax
 00080E33    mov         al,byte ptr [ebp-0D]
 00080E36    push        eax
 00080E37    mov         eax,dword ptr [esi]
 00080E39    mov         ecx,dword ptr [ebp-0C]
 00080E3C    mov         edx,edi
 00080E3E    mov         ebx,dword ptr [eax]
 00080E40    call        dword ptr [ebx+0C8]
 00080E46    mov         eax,dword ptr [esi]
 00080E48    cmp         byte ptr [eax+26C],0
>00080E4F    je          00080EF3
 00080E55    test        byte ptr [ebp-0D],4
>00080E59    je          00080EF3
 00080E5F    mov         eax,dword ptr [esi]
 00080E61    cmp         byte ptr [eax+12C],0
>00080E68    je          00080EF3
 00080E6E    mov         eax,dword ptr [ebp+1C]
 00080E71    mov         eax,dword ptr [eax-78]
 00080E74    mov         edx,dword ptr [ebp+1C]
 00080E77    or          eax,dword ptr [edx-7C]
>00080E7A    je          00080EF3
 00080E7C    push        esi
 00080E7D    push        edi
 00080E7E    lea         esi,[ebp-30]
 00080E81    lea         edi,[ebp-40]
 00080E84    mov         ecx,4
 00080E89    rep movs    dword ptr [edi],dword ptr [esi]
 00080E8B    pop         edi
 00080E8C    pop         esi
 00080E8D    mov         eax,dword ptr [ebp+1C]
 00080E90    test        byte ptr [eax-78],4
>00080E94    jne         00080EA1
 00080E96    mov         eax,dword ptr [ebp+1C]
 00080E99    mov         eax,dword ptr [eax-64]
 00080E9C    add         dword ptr [ebp-38],eax
>00080E9F    jmp         00080EB3
 00080EA1    mov         eax,dword ptr [ebp+1C]
 00080EA4    test        byte ptr [eax-78],8
>00080EA8    jne         00080EB3
 00080EAA    mov         eax,dword ptr [ebp+1C]
 00080EAD    mov         eax,dword ptr [eax-38]
 00080EB0    add         dword ptr [ebp-34],eax
 00080EB3    mov         eax,dword ptr [ebp+1C]
 00080EB6    mov         eax,dword ptr [eax-78]
 00080EB9    push        eax
 00080EBA    push        4
 00080EBC    lea         eax,[ebp-40]
 00080EBF    push        eax
 00080EC0    mov         eax,dword ptr [esi]
 00080EC2    mov         eax,dword ptr [eax+1EC]
 00080EC8    call        TCanvas.GetHandle
 00080ECD    push        eax
 00080ECE    call        user32.DrawEdge
 00080ED3    mov         eax,dword ptr [ebp+1C]
 00080ED6    mov         eax,dword ptr [eax-7C]
 00080ED9    push        eax
 00080EDA    push        4
 00080EDC    lea         eax,[ebp-40]
 00080EDF    push        eax
 00080EE0    mov         eax,dword ptr [esi]
 00080EE2    mov         eax,dword ptr [eax+1EC]
 00080EE8    call        TCanvas.GetHandle
 00080EED    push        eax
 00080EEE    call        user32.DrawEdge
 00080EF3    mov         eax,dword ptr [esi]
 00080EF5    cmp         byte ptr [eax+26C],0
>00080EFC    je          00080F9B
 00080F02    mov         eax,dword ptr [esi]
 00080F04    test        byte ptr [eax+20],10
>00080F08    jne         00080F9B
 00080F0E    test        byte ptr [ebp-0D],2
>00080F12    je          00080F9B
 00080F18    mov         eax,dword ptr [esi]
 00080F1A    mov         ax,word ptr [eax+228]
 00080F21    and         ax,word ptr ds:[80FF8]
 00080F28    mov         dx,word ptr ds:[80FF8]
 00080F2F    cmp         dx,ax
>00080F32    je          00080F9B
 00080F34    mov         eax,dword ptr [esi]
 00080F36    test        byte ptr [eax+229],10
>00080F3D    jne         00080F9B
 00080F3F    mov         eax,dword ptr [esi]
 00080F41    mov         bx,0FFCF
 00080F45    call        @CallDynaInst
 00080F4A    test        al,al
>00080F4C    jne         00080F67
 00080F4E    lea         eax,[ebp-30]
 00080F51    push        eax
 00080F52    mov         eax,dword ptr [esi]
 00080F54    mov         eax,dword ptr [eax+1EC]
 00080F5A    call        TCanvas.GetHandle
 00080F5F    push        eax
 00080F60    call        user32.DrawFocusRect
>00080F65    jmp         00080F9B
 00080F67    push        esi
 00080F68    push        edi
 00080F69    lea         esi,[ebp-30]
 00080F6C    lea         edi,[ebp-20]
 00080F6F    mov         ecx,4
 00080F74    rep movs    dword ptr [edi],dword ptr [esi]
 00080F76    pop         edi
 00080F77    pop         esi
 00080F78    mov         eax,dword ptr [ebp-28]
 00080F7B    mov         dword ptr [ebp-20],eax
 00080F7E    mov         eax,dword ptr [ebp-30]
 00080F81    mov         dword ptr [ebp-18],eax
 00080F84    lea         eax,[ebp-20]
 00080F87    push        eax
 00080F88    mov         eax,dword ptr [esi]
 00080F8A    mov         eax,dword ptr [eax+1EC]
 00080F90    call        TCanvas.GetHandle
 00080F95    push        eax
 00080F96    call        user32.DrawFocusRect
 00080F9B    mov         eax,dword ptr [ebp+1C]
 00080F9E    mov         eax,dword ptr [eax-64]
 00080FA1    add         eax,dword ptr [ebp-28]
 00080FA4    mov         dword ptr [ebp-30],eax
 00080FA7    inc         edi
 00080FA8    mov         eax,dword ptr [ebp-30]
 00080FAB    cmp         eax,dword ptr [ebp+14]
>00080FAE    jge         00080FBE
 00080FB0    mov         eax,dword ptr [esi]
 00080FB2    cmp         edi,dword ptr [eax+1FC]
>00080FB8    jl          00080D09
 00080FBE    mov         eax,dword ptr [ebp+1C]
 00080FC1    mov         eax,dword ptr [eax-38]
 00080FC4    add         eax,dword ptr [ebp-24]
 00080FC7    mov         dword ptr [ebp-2C],eax
 00080FCA    inc         dword ptr [ebp-0C]
 00080FCD    mov         eax,dword ptr [ebp-2C]
 00080FD0    cmp         eax,dword ptr [ebp+10]
>00080FD3    jge         00080FE6
 00080FD5    mov         eax,dword ptr [esi]
 00080FD7    mov         eax,dword ptr [eax+22C]
 00080FDD    cmp         eax,dword ptr [ebp-0C]
>00080FE0    jg          00080CEB
 00080FE6    pop         edi
 00080FE7    pop         esi
 00080FE8    pop         ebx
 00080FE9    mov         esp,ebp
 00080FEB    pop         ebp
 00080FEC    ret         14
*}
end;

//00080FFC
procedure TCustomGrid.Paint;
begin
{*
 00080FFC    push        ebp
 00080FFD    mov         ebp,esp
 00080FFF    add         esp,0FFFFFF40
 00081005    push        ebx
 00081006    push        esi
 00081007    push        edi
 00081008    mov         dword ptr [ebp-4],eax
 0008100B    lea         esi,[ebp-4]
 0008100E    lea         edi,[ebp-64]
 00081011    mov         eax,dword ptr [esi]
 00081013    mov         bx,0FFCF
 00081017    call        @CallDynaInst
 0008101C    test        al,al
>0008101E    je          00081029
 00081020    mov         dl,1
 00081022    mov         eax,dword ptr [esi]
 00081024    call        TCustomGrid.ChangeGridOrientation
 00081029    lea         edx,[ebp-90]
 0008102F    mov         eax,dword ptr [esi]
 00081031    mov         eax,dword ptr [eax+1EC]
 00081037    call        TCanvas.GetClipRect
 0008103C    mov         edx,edi
 0008103E    mov         eax,dword ptr [esi]
 00081040    call        TCustomGrid.CalcDrawInfo
 00081045    cmp         dword ptr [edi],0
>00081048    jg          00081054
 0008104A    cmp         dword ptr [edi+2C],0
>0008104E    jle         00081262
 00081054    mov         dword ptr [ebp-80],0C0C0C0
 0008105B    mov         eax,dword ptr [esi]
 0008105D    mov         edx,dword ptr [edi+3C]
 00081060    sub         edx,dword ptr [eax+23C]
 00081066    mov         eax,dword ptr [esi]
 00081068    add         edx,dword ptr [eax+21C]
 0008106E    mov         eax,dword ptr [esi]
 00081070    push        dword ptr [eax+238]
 00081076    mov         eax,dword ptr [edi+10]
 00081079    pop         ecx
 0008107A    sub         eax,ecx
 0008107C    mov         ecx,dword ptr [esi]
 0008107E    add         eax,dword ptr [ecx+218]
 00081084    call        Max
 00081089    mov         ebx,eax
 0008108B    add         ebx,3
 0008108E    mov         eax,ebx
 00081090    shl         eax,3
 00081093    add         eax,eax
 00081095    call        StackAlloc
 0008109A    mov         dword ptr [ebp-8],eax
 0008109D    mov         eax,ebx
 0008109F    shl         eax,2
 000810A2    call        StackAlloc
 000810A7    mov         dword ptr [ebp-0C],eax
 000810AA    mov         eax,dword ptr [ebp-0C]
 000810AD    mov         ecx,2
 000810B2    mov         edx,ebx
 000810B4    call        FillDWord
 000810B9    mov         eax,dword ptr [esi]
 000810BB    mov         eax,dword ptr [eax+64]
 000810BE    call        ColorToRGB
 000810C3    cmp         eax,0C0C0C0
>000810C8    jne         000810D1
 000810CA    mov         dword ptr [ebp-80],808080
 000810D1    push        ebp
 000810D2    push        0
 000810D4    xor         eax,eax
 000810D6    mov         dword ptr [ebp-0C0],eax
 000810DC    xor         eax,eax
 000810DE    mov         dword ptr [ebp-0BC],eax
 000810E4    mov         eax,dword ptr [edi+4]
 000810E7    mov         dword ptr [ebp-0B8],eax
 000810ED    mov         eax,dword ptr [edi+30]
 000810F0    mov         dword ptr [ebp-0B4],eax
 000810F6    lea         eax,[ebp-0C0]
 000810FC    push        eax
 000810FD    push        3
 000810FF    push        0
 00081101    mov         eax,dword ptr [esi]
 00081103    mov         eax,dword ptr [eax+220]
 00081109    push        eax
 0008110A    mov         eax,dword ptr [esi]
 0008110C    test        byte ptr [eax+228],1
 00081113    setne       dl
 00081116    mov         eax,dword ptr [esi]
 00081118    test        byte ptr [eax+228],2
 0008111F    setne       al
 00081122    xor         ecx,ecx
 00081124    call        DrawLines
 00081129    pop         ecx
 0008112A    push        ebp
 0008112B    push        0
 0008112D    mov         eax,dword ptr [edi+4]
 00081130    mov         dword ptr [ebp-0C0],eax
 00081136    xor         eax,eax
 00081138    mov         dword ptr [ebp-0BC],eax
 0008113E    mov         eax,dword ptr [edi+8]
 00081141    mov         dword ptr [ebp-0B8],eax
 00081147    mov         eax,dword ptr [edi+30]
 0008114A    mov         dword ptr [ebp-0B4],eax
 00081150    lea         eax,[ebp-0C0]
 00081156    push        eax
 00081157    push        3
 00081159    push        0
 0008115B    mov         eax,dword ptr [esi]
 0008115D    mov         eax,dword ptr [eax+220]
 00081163    push        eax
 00081164    mov         eax,dword ptr [esi]
 00081166    test        byte ptr [eax+228],1
 0008116D    setne       dl
 00081170    mov         eax,dword ptr [esi]
 00081172    test        byte ptr [eax+228],2
 00081179    setne       al
 0008117C    mov         ecx,dword ptr [esi]
 0008117E    mov         ecx,dword ptr [ecx+238]
 00081184    call        DrawLines
 00081189    pop         ecx
 0008118A    push        ebp
 0008118B    mov         eax,dword ptr [esi]
 0008118D    mov         eax,dword ptr [eax+23C]
 00081193    push        eax
 00081194    xor         eax,eax
 00081196    mov         dword ptr [ebp-0C0],eax
 0008119C    mov         eax,dword ptr [edi+30]
 0008119F    mov         dword ptr [ebp-0BC],eax
 000811A5    mov         eax,dword ptr [edi+4]
 000811A8    mov         dword ptr [ebp-0B8],eax
 000811AE    mov         eax,dword ptr [edi+34]
 000811B1    mov         dword ptr [ebp-0B4],eax
 000811B7    lea         eax,[ebp-0C0]
 000811BD    push        eax
 000811BE    push        3
 000811C0    push        0
 000811C2    mov         eax,dword ptr [esi]
 000811C4    mov         eax,dword ptr [eax+220]
 000811CA    push        eax
 000811CB    mov         eax,dword ptr [esi]
 000811CD    test        byte ptr [eax+228],1
 000811D4    setne       dl
 000811D7    mov         eax,dword ptr [esi]
 000811D9    test        byte ptr [eax+228],2
 000811E0    setne       al
 000811E3    xor         ecx,ecx
 000811E5    call        DrawLines
 000811EA    pop         ecx
 000811EB    push        ebp
 000811EC    mov         eax,dword ptr [esi]
 000811EE    mov         eax,dword ptr [eax+23C]
 000811F4    push        eax
 000811F5    mov         eax,dword ptr [edi+4]
 000811F8    mov         dword ptr [ebp-0C0],eax
 000811FE    mov         eax,dword ptr [edi+30]
 00081201    mov         dword ptr [ebp-0BC],eax
 00081207    mov         eax,dword ptr [edi+8]
 0008120A    mov         dword ptr [ebp-0B8],eax
 00081210    mov         eax,dword ptr [edi+34]
 00081213    mov         dword ptr [ebp-0B4],eax
 00081219    lea         eax,[ebp-0C0]
 0008121F    push        eax
 00081220    push        3
 00081222    mov         eax,dword ptr [ebp-80]
 00081225    push        eax
 00081226    mov         eax,dword ptr [esi]
 00081228    mov         eax,dword ptr [eax+64]
 0008122B    push        eax
 0008122C    mov         eax,dword ptr [esi]
 0008122E    test        byte ptr [eax+228],4
 00081235    setne       dl
 00081238    mov         eax,dword ptr [esi]
 0008123A    test        byte ptr [eax+228],8
 00081241    setne       al
 00081244    mov         ecx,dword ptr [esi]
 00081246    mov         ecx,dword ptr [ecx+238]
 0008124C    call        DrawLines
 00081251    pop         ecx
 00081252    mov         eax,dword ptr [ebp-0C]
 00081255    call        StackFree
 0008125A    mov         eax,dword ptr [ebp-8]
 0008125D    call        StackFree
 00081262    lea         edx,[ebp-74]
 00081265    mov         eax,dword ptr [esi]
 00081267    call        TCustomGrid.GetSelection
 0008126C    xor         eax,eax
 0008126E    mov         dword ptr [ebp-78],eax
 00081271    xor         eax,eax
 00081273    mov         dword ptr [ebp-7C],eax
 00081276    mov         eax,dword ptr [esi]
 00081278    test        byte ptr [eax+228],1
>0008127F    je          0008128F
 00081281    mov         dword ptr [ebp-78],4
 00081288    mov         dword ptr [ebp-7C],1
 0008128F    mov         eax,dword ptr [esi]
 00081291    test        byte ptr [eax+228],2
>00081298    je          000812A2
 0008129A    or          dword ptr [ebp-78],8
 0008129E    or          dword ptr [ebp-7C],2
 000812A2    push        ebp
 000812A3    push        0
 000812A5    mov         eax,dword ptr [edi+4]
 000812A8    push        eax
 000812A9    mov         eax,dword ptr [edi+30]
 000812AC    push        eax
 000812AD    mov         eax,dword ptr [esi]
 000812AF    mov         eax,dword ptr [eax+220]
 000812B5    push        eax
 000812B6    mov         al,[000814E0]
 000812BB    push        eax
 000812BC    xor         ecx,ecx
 000812BE    xor         edx,edx
 000812C0    xor         eax,eax
 000812C2    call        DrawCells
 000812C7    pop         ecx
 000812C8    push        ebp
 000812C9    push        0
 000812CB    mov         eax,dword ptr [edi+8]
 000812CE    push        eax
 000812CF    mov         eax,dword ptr [edi+30]
 000812D2    push        eax
 000812D3    mov         eax,dword ptr [esi]
 000812D5    mov         eax,dword ptr [eax+220]
 000812DB    push        eax
 000812DC    mov         al,[000814E0]
 000812E1    push        eax
 000812E2    mov         eax,dword ptr [esi]
 000812E4    mov         ecx,dword ptr [edi+4]
 000812E7    sub         ecx,dword ptr [eax+268]
 000812ED    mov         eax,dword ptr [esi]
 000812EF    mov         eax,dword ptr [eax+238]
 000812F5    xor         edx,edx
 000812F7    call        DrawCells
 000812FC    pop         ecx
 000812FD    push        ebp
 000812FE    mov         eax,dword ptr [edi+30]
 00081301    push        eax
 00081302    mov         eax,dword ptr [edi+4]
 00081305    push        eax
 00081306    mov         eax,dword ptr [edi+34]
 00081309    push        eax
 0008130A    mov         eax,dword ptr [esi]
 0008130C    mov         eax,dword ptr [eax+220]
 00081312    push        eax
 00081313    mov         al,[000814E0]
 00081318    push        eax
 00081319    mov         eax,dword ptr [esi]
 0008131B    mov         edx,dword ptr [eax+23C]
 00081321    xor         ecx,ecx
 00081323    xor         eax,eax
 00081325    call        DrawCells
 0008132A    pop         ecx
 0008132B    push        ebp
 0008132C    mov         eax,dword ptr [edi+30]
 0008132F    push        eax
 00081330    mov         eax,dword ptr [edi+8]
 00081333    push        eax
 00081334    mov         eax,dword ptr [edi+34]
 00081337    push        eax
 00081338    mov         eax,dword ptr [esi]
 0008133A    mov         eax,dword ptr [eax+64]
 0008133D    push        eax
 0008133E    mov         al,[000814E4]
 00081343    push        eax
 00081344    mov         eax,dword ptr [esi]
 00081346    mov         ecx,dword ptr [edi+4]
 00081349    sub         ecx,dword ptr [eax+268]
 0008134F    mov         eax,dword ptr [esi]
 00081351    mov         edx,dword ptr [eax+23C]
 00081357    mov         eax,dword ptr [esi]
 00081359    mov         eax,dword ptr [eax+238]
 0008135F    call        DrawCells
 00081364    pop         ecx
 00081365    mov         eax,dword ptr [esi]
 00081367    test        byte ptr [eax+20],10
>0008136B    jne         00081431
 00081371    mov         eax,dword ptr [esi]
 00081373    test        byte ptr [eax+229],10
>0008137A    je          00081431
 00081380    mov         eax,dword ptr [esi]
 00081382    cmp         byte ptr [eax+26C],0
>00081389    je          00081431
 0008138F    mov         eax,dword ptr [esi]
 00081391    mov         bx,0FFBB
 00081395    call        @CallDynaInst
 0008139A    test        al,al
>0008139C    je          00081431
 000813A2    push        0
 000813A4    lea         edx,[ebp-0C0]
 000813AA    mov         eax,dword ptr [esi]
 000813AC    call        TCustomGrid.GetSelection
 000813B1    lea         edx,[ebp-0C0]
 000813B7    lea         ecx,[ebp-0B0]
 000813BD    mov         eax,dword ptr [esi]
 000813BF    call        TCustomGrid.GridRectToScreenRect
 000813C4    mov         eax,dword ptr [esi]
 000813C6    mov         bx,0FFCF
 000813CA    call        @CallDynaInst
 000813CF    test        al,al
>000813D1    jne         000813E8
 000813D3    lea         edx,[ebp-0B0]
 000813D9    mov         eax,dword ptr [esi]
 000813DB    mov         eax,dword ptr [eax+1EC]
 000813E1    call        TCanvas.DrawFocusRect
>000813E6    jmp         00081431
 000813E8    push        esi
 000813E9    push        edi
 000813EA    lea         esi,[ebp-0B0]
 000813F0    lea         edi,[ebp-0A0]
 000813F6    mov         ecx,4
 000813FB    rep movs    dword ptr [edi],dword ptr [esi]
 000813FD    pop         edi
 000813FE    pop         esi
 000813FF    mov         eax,dword ptr [ebp-0A8]
 00081405    mov         dword ptr [ebp-0A0],eax
 0008140B    mov         eax,dword ptr [ebp-0B0]
 00081411    mov         dword ptr [ebp-98],eax
 00081417    lea         eax,[ebp-0A0]
 0008141D    push        eax
 0008141E    mov         eax,dword ptr [esi]
 00081420    mov         eax,dword ptr [eax+1EC]
 00081426    call        TCanvas.GetHandle
 0008142B    push        eax
 0008142C    call        user32.DrawFocusRect
 00081431    mov         eax,dword ptr [edi+8]
 00081434    cmp         eax,dword ptr [edi+0C]
>00081437    jge         00081479
 00081439    mov         eax,dword ptr [esi]
 0008143B    mov         edx,dword ptr [eax+64]
 0008143E    mov         eax,dword ptr [esi]
 00081440    mov         eax,dword ptr [eax+1EC]
 00081446    mov         eax,dword ptr [eax+14]
 00081449    call        TBrush.SetColor
 0008144E    mov         eax,dword ptr [edi+34]
 00081451    push        eax
 00081452    lea         eax,[ebp-0C0]
 00081458    push        eax
 00081459    mov         ecx,dword ptr [edi+0C]
 0008145C    xor         edx,edx
 0008145E    mov         eax,dword ptr [edi+8]
 00081461    call        Rect
 00081466    lea         edx,[ebp-0C0]
 0008146C    mov         eax,dword ptr [esi]
 0008146E    mov         eax,dword ptr [eax+1EC]
 00081474    call        TCanvas.FillRect
 00081479    mov         eax,dword ptr [edi+34]
 0008147C    cmp         eax,dword ptr [edi+38]
>0008147F    jge         000814C1
 00081481    mov         eax,dword ptr [esi]
 00081483    mov         edx,dword ptr [eax+64]
 00081486    mov         eax,dword ptr [esi]
 00081488    mov         eax,dword ptr [eax+1EC]
 0008148E    mov         eax,dword ptr [eax+14]
 00081491    call        TBrush.SetColor
 00081496    mov         eax,dword ptr [edi+38]
 00081499    push        eax
 0008149A    lea         eax,[ebp-0C0]
 000814A0    push        eax
 000814A1    mov         ecx,dword ptr [edi+0C]
 000814A4    mov         edx,dword ptr [edi+34]
 000814A7    xor         eax,eax
 000814A9    call        Rect
 000814AE    lea         edx,[ebp-0C0]
 000814B4    mov         eax,dword ptr [esi]
 000814B6    mov         eax,dword ptr [eax+1EC]
 000814BC    call        TCanvas.FillRect
 000814C1    mov         eax,dword ptr [esi]
 000814C3    mov         bx,0FFCF
 000814C7    call        @CallDynaInst
 000814CC    test        al,al
>000814CE    je          000814D9
 000814D0    xor         edx,edx
 000814D2    mov         eax,dword ptr [esi]
 000814D4    call        TCustomGrid.ChangeGridOrientation
 000814D9    pop         edi
 000814DA    pop         esi
 000814DB    pop         ebx
 000814DC    mov         esp,ebp
 000814DE    pop         ebp
 000814DF    ret
*}
end;

//000814E8
function DoCalc(const AxisInfo:TGridAxisDrawInfo; N:Integer):Integer;
begin
{*
 000814E8    push        ebp
 000814E9    mov         ebp,esp
 000814EB    add         esp,0FFFFFFF4
 000814EE    push        ebx
 000814EF    push        esi
 000814F0    push        edi
 000814F1    mov         dword ptr [ebp-4],edx
 000814F4    mov         ebx,eax
 000814F6    mov         esi,dword ptr [ebx+4]
 000814F9    cmp         esi,dword ptr [ebp-4]
>000814FC    jle         0008150B
 000814FE    xor         eax,eax
 00081500    mov         edx,dword ptr [ebx+18]
 00081503    dec         edx
 00081504    xor         ecx,ecx
 00081506    mov         dword ptr [ebp-0C],ecx
>00081509    jmp         00081515
 0008150B    mov         eax,dword ptr [ebx+1C]
 0008150E    mov         edx,dword ptr [ebx+20]
 00081511    dec         edx
 00081512    mov         dword ptr [ebp-0C],esi
 00081515    mov         dword ptr [ebp-8],0FFFFFFFF
 0008151C    mov         esi,eax
 0008151E    mov         edi,edx
 00081520    sub         edi,esi
>00081522    jl          00081543
 00081524    inc         edi
 00081525    mov         edx,esi
 00081527    mov         eax,dword ptr [ebx+28]
 0008152A    call        dword ptr [ebx+24]
 0008152D    add         eax,dword ptr [ebx]
 0008152F    add         dword ptr [ebp-0C],eax
 00081532    mov         eax,dword ptr [ebp-4]
 00081535    cmp         eax,dword ptr [ebp-0C]
>00081538    jge         0008153F
 0008153A    mov         dword ptr [ebp-8],esi
>0008153D    jmp         00081543
 0008153F    inc         esi
 00081540    dec         edi
>00081541    jne         00081525
 00081543    mov         eax,dword ptr [ebp-8]
 00081546    pop         edi
 00081547    pop         esi
 00081548    pop         ebx
 00081549    mov         esp,ebp
 0008154B    pop         ebp
 0008154C    ret
*}
end;

//00081550
function DoCalcRightToLeft(const AxisInfo:TGridAxisDrawInfo; N:Integer):Integer;
begin
{*
 00081550    push        ebp
 00081551    mov         ebp,esp
 00081553    add         esp,0FFFFFFF4
 00081556    push        ebx
 00081557    push        esi
 00081558    push        edi
 00081559    mov         dword ptr [ebp-4],edx
 0008155C    mov         ebx,eax
 0008155E    mov         eax,dword ptr [ebp+8]
 00081561    mov         eax,dword ptr [eax-4]
 00081564    call        TControl.GetClientWidth
 00081569    sub         eax,dword ptr [ebp-4]
 0008156C    mov         dword ptr [ebp-4],eax
 0008156F    mov         eax,dword ptr [ebx+4]
 00081572    cmp         eax,dword ptr [ebp-4]
>00081575    jle         0008158D
 00081577    xor         esi,esi
 00081579    mov         edi,dword ptr [ebx+18]
 0008157C    dec         edi
 0008157D    mov         eax,dword ptr [ebp+8]
 00081580    mov         eax,dword ptr [eax-4]
 00081583    call        TControl.GetClientWidth
 00081588    mov         dword ptr [ebp-0C],eax
>0008158B    jmp         00081597
 0008158D    mov         esi,dword ptr [ebx+1C]
 00081590    mov         edi,dword ptr [ebx+20]
 00081593    dec         edi
 00081594    mov         dword ptr [ebp-0C],eax
 00081597    mov         dword ptr [ebp-8],0FFFFFFFF
 0008159E    sub         edi,esi
>000815A0    jl          000815C1
 000815A2    inc         edi
 000815A3    mov         edx,esi
 000815A5    mov         eax,dword ptr [ebx+28]
 000815A8    call        dword ptr [ebx+24]
 000815AB    add         eax,dword ptr [ebx]
 000815AD    add         dword ptr [ebp-0C],eax
 000815B0    mov         eax,dword ptr [ebp-4]
 000815B3    cmp         eax,dword ptr [ebp-0C]
>000815B6    jge         000815BD
 000815B8    mov         dword ptr [ebp-8],esi
>000815BB    jmp         000815C1
 000815BD    inc         esi
 000815BE    dec         edi
>000815BF    jne         000815A3
 000815C1    mov         eax,dword ptr [ebp-8]
 000815C4    pop         edi
 000815C5    pop         esi
 000815C6    pop         ebx
 000815C7    mov         esp,ebp
 000815C9    pop         ebp
 000815CA    ret
*}
end;

//000815CC
function TCustomGrid.CalcCoordFromPoint(X:Integer; Y:Integer; const DrawInfo:TGridDrawInfo):TGridCoord;
begin
{*
 000815CC    push        ebp
 000815CD    mov         ebp,esp
 000815CF    add         esp,0FFFFFFF4
 000815D2    push        ebx
 000815D3    push        esi
 000815D4    push        edi
 000815D5    mov         dword ptr [ebp-0C],ecx
 000815D8    mov         dword ptr [ebp-8],edx
 000815DB    mov         dword ptr [ebp-4],eax
 000815DE    mov         edi,dword ptr [ebp+8]
 000815E1    mov         esi,dword ptr [ebp+0C]
 000815E4    mov         eax,dword ptr [ebp-4]
 000815E7    mov         bx,0FFCF
 000815EB    call        @CallDynaInst
 000815F0    test        al,al
>000815F2    jne         00081602
 000815F4    mov         eax,esi
 000815F6    mov         edx,dword ptr [ebp-8]
 000815F9    call        DoCalc
 000815FE    mov         dword ptr [edi],eax
>00081600    jmp         00081610
 00081602    push        ebp
 00081603    mov         eax,esi
 00081605    mov         edx,dword ptr [ebp-8]
 00081608    call        DoCalcRightToLeft
 0008160D    pop         ecx
 0008160E    mov         dword ptr [edi],eax
 00081610    lea         eax,[esi+2C]
 00081613    mov         edx,dword ptr [ebp-0C]
 00081616    call        DoCalc
 0008161B    mov         dword ptr [edi+4],eax
 0008161E    pop         edi
 0008161F    pop         esi
 00081620    pop         ebx
 00081621    mov         esp,ebp
 00081623    pop         ebp
 00081624    ret         8
*}
end;

//00081628
procedure TCustomGrid.CalcDrawInfo(var DrawInfo:TGridDrawInfo);
begin
{*
 00081628    push        ebx
 00081629    push        esi
 0008162A    mov         esi,edx
 0008162C    mov         ebx,eax
 0008162E    mov         eax,ebx
 00081630    call        TControl.GetClientHeight
 00081635    push        eax
 00081636    mov         eax,ebx
 00081638    call        TControl.GetClientWidth
 0008163D    mov         ecx,eax
 0008163F    mov         edx,esi
 00081641    mov         eax,ebx
 00081643    call        TCustomGrid.CalcDrawInfoXY
 00081648    pop         esi
 00081649    pop         ebx
 0008164A    ret
*}
end;

//0008164C
procedure CalcAxis(var AxisInfo:TGridAxisDrawInfo; UseExtent:Integer);
begin
{*
 0008164C    push        ebx
 0008164D    push        esi
 0008164E    push        edi
 0008164F    mov         ebx,eax
 00081651    mov         dword ptr [ebx+0C],edx
 00081654    mov         eax,dword ptr [ebx+4]
 00081657    mov         dword ptr [ebx+8],eax
 0008165A    mov         eax,dword ptr [ebx+4]
 0008165D    mov         dword ptr [ebx+14],eax
 00081660    mov         eax,dword ptr [ebx+1C]
 00081663    mov         dword ptr [ebx+10],eax
 00081666    mov         esi,dword ptr [ebx+1C]
 00081669    mov         edi,dword ptr [ebx+20]
 0008166C    dec         edi
 0008166D    sub         edi,esi
>0008166F    jl          0008169D
 00081671    inc         edi
 00081672    mov         edx,esi
 00081674    mov         eax,dword ptr [ebx+28]
 00081677    call        dword ptr [ebx+24]
 0008167A    add         eax,dword ptr [ebx]
 0008167C    add         dword ptr [ebx+8],eax
 0008167F    mov         eax,dword ptr [ebx+0C]
 00081682    mov         edx,eax
 00081684    add         edx,dword ptr [ebx]
 00081686    cmp         edx,dword ptr [ebx+8]
>00081689    jge         00081690
 0008168B    mov         dword ptr [ebx+8],eax
>0008168E    jmp         0008169D
 00081690    mov         dword ptr [ebx+10],esi
 00081693    mov         eax,dword ptr [ebx+8]
 00081696    mov         dword ptr [ebx+14],eax
 00081699    inc         esi
 0008169A    dec         edi
>0008169B    jne         00081672
 0008169D    pop         edi
 0008169E    pop         esi
 0008169F    pop         ebx
 000816A0    ret
*}
end;

//000816A4
procedure TCustomGrid.CalcDrawInfoXY(var DrawInfo:TGridDrawInfo; UseWidth:Integer; UseHeight:Integer);
begin
{*
 000816A4    push        ebp
 000816A5    mov         ebp,esp
 000816A7    push        ebx
 000816A8    push        esi
 000816A9    mov         esi,ecx
 000816AB    mov         ebx,edx
 000816AD    mov         edx,ebx
 000816AF    call        TCustomGrid.CalcFixedInfo
 000816B4    mov         eax,ebx
 000816B6    mov         edx,esi
 000816B8    call        CalcAxis
 000816BD    lea         eax,[ebx+2C]
 000816C0    mov         edx,dword ptr [ebp+8]
 000816C3    call        CalcAxis
 000816C8    pop         esi
 000816C9    pop         ebx
 000816CA    pop         ebp
 000816CB    ret         4
*}
end;

//000816D0
procedure CalcFixedAxis(var Axis:TGridAxisDrawInfo; LineOptions:TGridOptions; FixedCount:Integer; FirstCell:Integer; CellCount:Integer; GetExtentFunc:TGetExtentsFunc);
begin
{*
 000816D0    push        ebp
 000816D1    mov         ebp,esp
 000816D3    add         esp,0FFFFFFF8
 000816D6    push        ebx
 000816D7    push        esi
 000816D8    push        edi
 000816D9    mov         dword ptr [ebp-8],ecx
 000816DC    mov         word ptr [ebp-2],dx
 000816E0    mov         ebx,eax
 000816E2    mov         eax,dword ptr [ebp+18]
 000816E5    mov         eax,dword ptr [eax-4]
 000816E8    mov         ax,word ptr [eax+228]
 000816EF    and         ax,word ptr [ebp-2]
 000816F3    mov         dx,word ptr ds:[8175C]
 000816FA    cmp         dx,ax
>000816FD    jne         00081705
 000816FF    xor         eax,eax
 00081701    mov         dword ptr [ebx],eax
>00081703    jmp         00081713
 00081705    mov         eax,dword ptr [ebp+18]
 00081708    mov         eax,dword ptr [eax-4]
 0008170B    mov         eax,dword ptr [eax+224]
 00081711    mov         dword ptr [ebx],eax
 00081713    xor         eax,eax
 00081715    mov         dword ptr [ebx+4],eax
 00081718    mov         esi,dword ptr [ebp-8]
 0008171B    dec         esi
 0008171C    test        esi,esi
>0008171E    jl          00081734
 00081720    inc         esi
 00081721    xor         edi,edi
 00081723    mov         edx,edi
 00081725    mov         eax,dword ptr [ebp+0C]
 00081728    call        dword ptr [ebp+8]
 0008172B    add         eax,dword ptr [ebx]
 0008172D    add         dword ptr [ebx+4],eax
 00081730    inc         edi
 00081731    dec         esi
>00081732    jne         00081723
 00081734    mov         eax,dword ptr [ebp-8]
 00081737    mov         dword ptr [ebx+18],eax
 0008173A    mov         eax,dword ptr [ebp+14]
 0008173D    mov         dword ptr [ebx+1C],eax
 00081740    mov         eax,dword ptr [ebp+10]
 00081743    mov         dword ptr [ebx+20],eax
 00081746    mov         eax,dword ptr [ebp+8]
 00081749    mov         dword ptr [ebx+24],eax
 0008174C    mov         eax,dword ptr [ebp+0C]
 0008174F    mov         dword ptr [ebx+28],eax
 00081752    pop         edi
 00081753    pop         esi
 00081754    pop         ebx
 00081755    pop         ecx
 00081756    pop         ecx
 00081757    pop         ebp
 00081758    ret         10
*}
end;

//00081760
procedure TCustomGrid.CalcFixedInfo(var DrawInfo:TGridDrawInfo);
begin
{*
 00081760    push        ebp
 00081761    mov         ebp,esp
 00081763    push        ecx
 00081764    push        ebx
 00081765    mov         ebx,edx
 00081767    mov         dword ptr [ebp-4],eax
 0008176A    push        ebp
 0008176B    mov         eax,dword ptr [ebp-4]
 0008176E    mov         eax,dword ptr [eax+238]
 00081774    push        eax
 00081775    mov         eax,dword ptr [ebp-4]
 00081778    mov         eax,dword ptr [eax+1FC]
 0008177E    push        eax
 0008177F    mov         eax,dword ptr [ebp-4]
 00081782    push        eax
 00081783    push        845E4;TCustomGrid.GetColWidths:Integer
 00081788    mov         eax,dword ptr [ebp-4]
 0008178B    mov         ecx,dword ptr [eax+218]
 00081791    mov         eax,ebx
 00081793    mov         dx,word ptr ds:[817DC]
 0008179A    call        CalcFixedAxis
 0008179F    pop         ecx
 000817A0    push        ebp
 000817A1    mov         eax,dword ptr [ebp-4]
 000817A4    mov         eax,dword ptr [eax+23C]
 000817AA    push        eax
 000817AB    mov         eax,dword ptr [ebp-4]
 000817AE    mov         eax,dword ptr [eax+22C]
 000817B4    push        eax
 000817B5    mov         eax,dword ptr [ebp-4]
 000817B8    push        eax
 000817B9    push        84604;TCustomGrid.GetRowHeights:Integer
 000817BE    mov         eax,dword ptr [ebp-4]
 000817C1    mov         ecx,dword ptr [eax+21C]
 000817C7    lea         eax,[ebx+2C]
 000817CA    mov         dx,word ptr ds:[817E0]
 000817D1    call        CalcFixedAxis
 000817D6    pop         ecx
 000817D7    pop         ebx
 000817D8    pop         ecx
 000817D9    pop         ebp
 000817DA    ret
*}
end;

//000817E4
function CalcMaxCell(const Axis:TGridAxisDrawInfo; Start:Integer):Integer;
begin
{*
 000817E4    push        ebp
 000817E5    mov         ebp,esp
 000817E7    add         esp,0FFFFFFF0
 000817EA    push        ebx
 000817EB    push        esi
 000817EC    mov         dword ptr [ebp-4],edx
 000817EF    mov         ebx,eax
 000817F1    mov         eax,dword ptr [ebp-4]
 000817F4    mov         dword ptr [ebp-8],eax
 000817F7    mov         eax,dword ptr [ebx+0C]
 000817FA    add         eax,dword ptr [ebx]
 000817FC    mov         dword ptr [ebp-0C],eax
 000817FF    mov         esi,dword ptr [ebp-4]
 00081802    mov         eax,dword ptr [ebx+18]
 00081805    sub         eax,esi
>00081807    jg          0008184C
 00081809    dec         eax
 0008180A    mov         dword ptr [ebp-10],eax
 0008180D    mov         edx,esi
 0008180F    mov         eax,dword ptr [ebx+28]
 00081812    call        dword ptr [ebx+24]
 00081815    test        eax,eax
>00081817    jle         00081846
 00081819    sub         dword ptr [ebp-0C],eax
 0008181C    mov         eax,dword ptr [ebx]
 0008181E    sub         dword ptr [ebp-0C],eax
 00081821    mov         eax,dword ptr [ebx+4]
 00081824    cmp         eax,dword ptr [ebp-0C]
>00081827    jle         00081843
 00081829    mov         eax,dword ptr [ebp-8]
 0008182C    cmp         eax,dword ptr [ebp-4]
>0008182F    jne         0008184C
 00081831    mov         edx,dword ptr [ebp-4]
 00081834    mov         eax,dword ptr [ebx+28]
 00081837    call        dword ptr [ebx+24]
 0008183A    test        eax,eax
>0008183C    jg          0008184C
 0008183E    mov         dword ptr [ebp-8],esi
>00081841    jmp         0008184C
 00081843    mov         dword ptr [ebp-8],esi
 00081846    dec         esi
 00081847    inc         dword ptr [ebp-10]
>0008184A    jne         0008180D
 0008184C    mov         eax,dword ptr [ebp-8]
 0008184F    pop         esi
 00081850    pop         ebx
 00081851    mov         esp,ebp
 00081853    pop         ebp
 00081854    ret
*}
end;

//00081858
function TCustomGrid.CalcMaxTopLeft(const Coord:TGridCoord; const DrawInfo:TGridDrawInfo):TGridCoord;
begin
{*
 00081858    push        ebp
 00081859    mov         ebp,esp
 0008185B    push        ebx
 0008185C    push        esi
 0008185D    push        edi
 0008185E    mov         esi,ecx
 00081860    mov         ebx,edx
 00081862    mov         edi,dword ptr [ebp+8]
 00081865    mov         edx,dword ptr [ebx]
 00081867    mov         eax,esi
 00081869    call        CalcMaxCell
 0008186E    mov         dword ptr [edi],eax
 00081870    mov         edx,dword ptr [ebx+4]
 00081873    lea         eax,[esi+2C]
 00081876    call        CalcMaxCell
 0008187B    mov         dword ptr [edi+4],eax
 0008187E    pop         edi
 0008187F    pop         esi
 00081880    pop         ebx
 00081881    pop         ebp
 00081882    ret         4
*}
end;

//00081888
procedure CalcAxisState(const AxisInfo:TGridAxisDrawInfo; Pos:Integer; NewState:TGridState);
begin
{*
 00081888    push        ebp
 00081889    mov         ebp,esp
 0008188B    add         esp,0FFFFFFEC
 0008188E    push        ebx
 0008188F    push        esi
 00081890    push        edi
 00081891    mov         byte ptr [ebp-1],cl
 00081894    mov         edi,edx
 00081896    mov         esi,eax
 00081898    mov         eax,dword ptr [ebp+8]
 0008189B    mov         eax,dword ptr [eax-4]
 0008189E    mov         bx,0FFCF
 000818A2    call        @CallDynaInst
 000818A7    test        al,al
>000818A9    je          000818BA
 000818AB    mov         eax,dword ptr [ebp+8]
 000818AE    mov         eax,dword ptr [eax-4]
 000818B1    call        TControl.GetClientWidth
 000818B6    sub         eax,edi
 000818B8    mov         edi,eax
 000818BA    mov         ebx,dword ptr [esi+4]
 000818BD    mov         eax,dword ptr [esi]
 000818BF    mov         dword ptr [ebp-10],eax
 000818C2    xor         edx,edx
 000818C4    mov         dword ptr [ebp-0C],edx
 000818C7    cmp         dword ptr [ebp-10],7
>000818CB    jge         000818DE
 000818CD    mov         dword ptr [ebp-10],7
 000818D4    mov         edx,dword ptr [ebp-10]
 000818D7    sub         edx,eax
 000818D9    shr         edx,1
 000818DB    mov         dword ptr [ebp-0C],edx
 000818DE    mov         eax,dword ptr [esi+1C]
 000818E1    mov         edx,dword ptr [esi+20]
 000818E4    dec         edx
 000818E5    sub         edx,eax
>000818E7    jl          00081944
 000818E9    inc         edx
 000818EA    mov         dword ptr [ebp-14],edx
 000818ED    mov         dword ptr [ebp-8],eax
 000818F0    mov         edx,dword ptr [ebp-8]
 000818F3    mov         eax,dword ptr [esi+28]
 000818F6    call        dword ptr [esi+24]
 000818F9    add         ebx,eax
 000818FB    cmp         ebx,dword ptr [esi+8]
>000818FE    jg          00081944
 00081900    mov         eax,ebx
 00081902    sub         eax,dword ptr [ebp-0C]
 00081905    cmp         edi,eax
>00081907    jl          0008193A
 00081909    add         eax,dword ptr [ebp-10]
 0008190C    cmp         edi,eax
>0008190E    jg          0008193A
 00081910    mov         eax,dword ptr [ebp+8]
 00081913    mov         eax,dword ptr [eax+18]
 00081916    mov         dl,byte ptr [ebp-1]
 00081919    mov         byte ptr [eax],dl
 0008191B    mov         eax,dword ptr [ebp+8]
 0008191E    mov         eax,dword ptr [eax+10]
 00081921    mov         dword ptr [eax],ebx
 00081923    sub         ebx,edi
 00081925    mov         eax,dword ptr [ebp+8]
 00081928    mov         eax,dword ptr [eax+0C]
 0008192B    mov         dword ptr [eax],ebx
 0008192D    mov         eax,dword ptr [ebp+8]
 00081930    mov         eax,dword ptr [eax+14]
 00081933    mov         edx,dword ptr [ebp-8]
 00081936    mov         dword ptr [eax],edx
>00081938    jmp         00081988
 0008193A    add         ebx,dword ptr [esi]
 0008193C    inc         dword ptr [ebp-8]
 0008193F    dec         dword ptr [ebp-14]
>00081942    jne         000818F0
 00081944    mov         eax,dword ptr [esi+0C]
 00081947    cmp         eax,dword ptr [esi+8]
>0008194A    jne         00081988
 0008194C    mov         edx,eax
 0008194E    sub         edx,dword ptr [ebp-0C]
 00081951    cmp         edi,edx
>00081953    jl          00081988
 00081955    cmp         eax,edi
>00081957    jl          00081988
 00081959    mov         eax,dword ptr [ebp+8]
 0008195C    mov         eax,dword ptr [eax+18]
 0008195F    mov         dl,byte ptr [ebp-1]
 00081962    mov         byte ptr [eax],dl
 00081964    mov         eax,dword ptr [esi+0C]
 00081967    mov         edx,dword ptr [ebp+8]
 0008196A    mov         edx,dword ptr [edx+10]
 0008196D    mov         dword ptr [edx],eax
 0008196F    mov         eax,dword ptr [esi+0C]
 00081972    sub         eax,edi
 00081974    mov         edx,dword ptr [ebp+8]
 00081977    mov         edx,dword ptr [edx+0C]
 0008197A    mov         dword ptr [edx],eax
 0008197C    mov         eax,dword ptr [esi+10]
 0008197F    inc         eax
 00081980    mov         edx,dword ptr [ebp+8]
 00081983    mov         edx,dword ptr [edx+14]
 00081986    mov         dword ptr [edx],eax
 00081988    pop         edi
 00081989    pop         esi
 0008198A    pop         ebx
 0008198B    mov         esp,ebp
 0008198D    pop         ebp
 0008198E    ret
*}
end;

//00081990
function XOutsideHorzFixedBoundary:Boolean;
begin
{*
 00081990    push        ebp
 00081991    mov         ebp,esp
 00081993    push        ebx
 00081994    mov         eax,dword ptr [ebp+8]
 00081997    mov         eax,dword ptr [eax-4]
 0008199A    mov         bx,0FFCF
 0008199E    call        @CallDynaInst
 000819A3    test        al,al
>000819A5    jne         000819BC
 000819A7    mov         eax,dword ptr [ebp+8]
 000819AA    mov         eax,dword ptr [eax-8]
 000819AD    mov         edx,dword ptr [ebp+8]
 000819B0    mov         edx,dword ptr [edx+8]
 000819B3    cmp         eax,dword ptr [edx+4]
 000819B6    setg        al
 000819B9    pop         ebx
 000819BA    pop         ebp
 000819BB    ret
 000819BC    mov         eax,dword ptr [ebp+8]
 000819BF    mov         eax,dword ptr [eax-4]
 000819C2    call        TControl.GetClientWidth
 000819C7    mov         edx,dword ptr [ebp+8]
 000819CA    mov         edx,dword ptr [edx+8]
 000819CD    sub         eax,dword ptr [edx+4]
 000819D0    mov         edx,dword ptr [ebp+8]
 000819D3    cmp         eax,dword ptr [edx-8]
 000819D6    setg        al
 000819D9    pop         ebx
 000819DA    pop         ebp
 000819DB    ret
*}
end;

//000819DC
function XOutsideOrEqualHorzFixedBoundary:Boolean;
begin
{*
 000819DC    push        ebp
 000819DD    mov         ebp,esp
 000819DF    push        ebx
 000819E0    mov         eax,dword ptr [ebp+8]
 000819E3    mov         eax,dword ptr [eax-4]
 000819E6    mov         bx,0FFCF
 000819EA    call        @CallDynaInst
 000819EF    test        al,al
>000819F1    jne         00081A08
 000819F3    mov         eax,dword ptr [ebp+8]
 000819F6    mov         eax,dword ptr [eax-8]
 000819F9    mov         edx,dword ptr [ebp+8]
 000819FC    mov         edx,dword ptr [edx+8]
 000819FF    cmp         eax,dword ptr [edx+4]
 00081A02    setge       al
 00081A05    pop         ebx
 00081A06    pop         ebp
 00081A07    ret
 00081A08    mov         eax,dword ptr [ebp+8]
 00081A0B    mov         eax,dword ptr [eax-4]
 00081A0E    call        TControl.GetClientWidth
 00081A13    mov         edx,dword ptr [ebp+8]
 00081A16    mov         edx,dword ptr [edx+8]
 00081A19    sub         eax,dword ptr [edx+4]
 00081A1C    mov         edx,dword ptr [ebp+8]
 00081A1F    cmp         eax,dword ptr [edx-8]
 00081A22    setge       al
 00081A25    pop         ebx
 00081A26    pop         ebp
 00081A27    ret
*}
end;

//00081A28
procedure TCustomGrid.CalcSizingState(X:Integer; Y:Integer; var State:TGridState; var Index:Longint; var SizingPos:Integer; var SizingOfs:Integer; var FixedInfo:TGridDrawInfo);
begin
{*
 00081A28    push        ebp
 00081A29    mov         ebp,esp
 00081A2B    add         esp,0FFFFFFF8
 00081A2E    push        ebx
 00081A2F    push        esi
 00081A30    mov         esi,ecx
 00081A32    mov         dword ptr [ebp-8],edx
 00081A35    mov         dword ptr [ebp-4],eax
 00081A38    mov         eax,dword ptr [ebp+18]
 00081A3B    mov         byte ptr [eax],0
 00081A3E    mov         eax,dword ptr [ebp+14]
 00081A41    mov         dword ptr [eax],0FFFFFFFF
 00081A47    mov         eax,dword ptr [ebp-4]
 00081A4A    mov         bx,word ptr [eax+228]
 00081A51    mov         eax,dword ptr [ebp-4]
 00081A54    test        byte ptr [eax+20],10
>00081A58    je          00081A69
 00081A5A    mov         eax,dword ptr [ebp-4]
 00081A5D    mov         ax,word ptr [eax+270]
 00081A64    or          ax,bx
 00081A67    mov         ebx,eax
 00081A69    mov         eax,ebx
 00081A6B    and         ax,word ptr ds:[81AF4]
 00081A72    mov         dx,word ptr ds:[81AF8]
 00081A79    cmp         dx,ax
>00081A7C    je          00081AEC
 00081A7E    mov         eax,dword ptr [ebp-4]
 00081A81    call        TControl.GetClientHeight
 00081A86    mov         edx,dword ptr [ebp+8]
 00081A89    mov         dword ptr [edx+38],eax
 00081A8C    mov         eax,dword ptr [ebp-4]
 00081A8F    call        TControl.GetClientWidth
 00081A94    mov         edx,dword ptr [ebp+8]
 00081A97    mov         dword ptr [edx+0C],eax
 00081A9A    push        ebp
 00081A9B    call        XOutsideHorzFixedBoundary
 00081AA0    pop         ecx
 00081AA1    test        al,al
>00081AA3    je          00081AC3
 00081AA5    test        bl,80
>00081AA8    je          00081AC3
 00081AAA    mov         eax,dword ptr [ebp+8]
 00081AAD    cmp         esi,dword ptr [eax+30]
>00081AB0    jge         00081AEC
 00081AB2    push        ebp
 00081AB3    mov         eax,dword ptr [ebp+8]
 00081AB6    mov         cl,3
 00081AB8    mov         edx,dword ptr [ebp-8]
 00081ABB    call        CalcAxisState
 00081AC0    pop         ecx
>00081AC1    jmp         00081AEC
 00081AC3    mov         eax,dword ptr [ebp+8]
 00081AC6    cmp         esi,dword ptr [eax+30]
>00081AC9    jle         00081AEC
 00081ACB    test        bl,40
>00081ACE    je          00081AEC
 00081AD0    push        ebp
 00081AD1    call        XOutsideOrEqualHorzFixedBoundary
 00081AD6    pop         ecx
 00081AD7    test        al,al
>00081AD9    jne         00081AEC
 00081ADB    push        ebp
 00081ADC    mov         eax,dword ptr [ebp+8]
 00081ADF    add         eax,2C
 00081AE2    mov         cl,2
 00081AE4    mov         edx,esi
 00081AE6    call        CalcAxisState
 00081AEB    pop         ecx
 00081AEC    pop         esi
 00081AED    pop         ebx
 00081AEE    pop         ecx
 00081AEF    pop         ecx
 00081AF0    pop         ebp
 00081AF1    ret         14
*}
end;

//00081AFC
procedure TCustomGrid.ChangeGridOrientation(RightToLeftOrientation:Boolean);
begin
{*
 00081AFC    push        ebx
 00081AFD    add         esp,0FFFFFFF0
 00081B00    mov         ebx,eax
 00081B02    test        dl,dl
>00081B04    je          00081BAE
 00081B0A    mov         eax,ebx
 00081B0C    call        TControl.GetClientWidth
 00081B11    mov         ecx,esp
 00081B13    xor         edx,edx
 00081B15    call        Point
 00081B1A    lea         ecx,[esp+8]
 00081B1E    mov         edx,1
 00081B23    or          eax,0FFFFFFFF
 00081B26    call        Point
 00081B2B    push        8
 00081B2D    mov         eax,dword ptr [ebx+1EC]
 00081B33    call        TCanvas.GetHandle
 00081B38    push        eax
 00081B39    call        gdi32.SetMapMode
 00081B3E    push        0
 00081B40    mov         eax,dword ptr [esp+8]
 00081B44    push        eax
 00081B45    mov         eax,dword ptr [esp+8]
 00081B49    push        eax
 00081B4A    mov         eax,dword ptr [ebx+1EC]
 00081B50    call        TCanvas.GetHandle
 00081B55    push        eax
 00081B56    call        gdi32.SetWindowOrgEx
 00081B5B    push        0
 00081B5D    mov         eax,ebx
 00081B5F    call        TControl.GetClientHeight
 00081B64    push        eax
 00081B65    mov         eax,ebx
 00081B67    call        TControl.GetClientWidth
 00081B6C    push        eax
 00081B6D    mov         eax,dword ptr [ebx+1EC]
 00081B73    call        TCanvas.GetHandle
 00081B78    push        eax
 00081B79    call        gdi32.SetViewportExtEx
 00081B7E    push        0
 00081B80    mov         eax,ebx
 00081B82    call        TControl.GetClientHeight
 00081B87    imul        dword ptr [esp+10]
 00081B8B    push        eax
 00081B8C    mov         eax,ebx
 00081B8E    call        TControl.GetClientWidth
 00081B93    imul        dword ptr [esp+10]
 00081B97    push        eax
 00081B98    mov         eax,dword ptr [ebx+1EC]
 00081B9E    call        TCanvas.GetHandle
 00081BA3    push        eax
 00081BA4    call        gdi32.SetWindowExtEx
>00081BA9    jmp         00081C4A
 00081BAE    mov         ecx,esp
 00081BB0    xor         edx,edx
 00081BB2    xor         eax,eax
 00081BB4    call        Point
 00081BB9    lea         ecx,[esp+8]
 00081BBD    mov         edx,1
 00081BC2    mov         eax,1
 00081BC7    call        Point
 00081BCC    push        8
 00081BCE    mov         eax,dword ptr [ebx+1EC]
 00081BD4    call        TCanvas.GetHandle
 00081BD9    push        eax
 00081BDA    call        gdi32.SetMapMode
 00081BDF    push        0
 00081BE1    mov         eax,dword ptr [esp+8]
 00081BE5    push        eax
 00081BE6    mov         eax,dword ptr [esp+8]
 00081BEA    push        eax
 00081BEB    mov         eax,dword ptr [ebx+1EC]
 00081BF1    call        TCanvas.GetHandle
 00081BF6    push        eax
 00081BF7    call        gdi32.SetWindowOrgEx
 00081BFC    push        0
 00081BFE    mov         eax,ebx
 00081C00    call        TControl.GetClientHeight
 00081C05    push        eax
 00081C06    mov         eax,ebx
 00081C08    call        TControl.GetClientWidth
 00081C0D    push        eax
 00081C0E    mov         eax,dword ptr [ebx+1EC]
 00081C14    call        TCanvas.GetHandle
 00081C19    push        eax
 00081C1A    call        gdi32.SetViewportExtEx
 00081C1F    push        0
 00081C21    mov         eax,ebx
 00081C23    call        TControl.GetClientHeight
 00081C28    imul        dword ptr [esp+10]
 00081C2C    push        eax
 00081C2D    mov         eax,ebx
 00081C2F    call        TControl.GetClientWidth
 00081C34    imul        dword ptr [esp+10]
 00081C38    push        eax
 00081C39    mov         eax,dword ptr [ebx+1EC]
 00081C3F    call        TCanvas.GetHandle
 00081C44    push        eax
 00081C45    call        gdi32.SetWindowExtEx
 00081C4A    add         esp,10
 00081C4D    pop         ebx
 00081C4E    ret
*}
end;

//00081C50
procedure MinRedraw(const OldInfo:TGridAxisDrawInfo; const NewInfo:TGridAxisDrawInfo; Axis:Integer);
begin
{*
 00081C50    push        ebp
 00081C51    mov         ebp,esp
 00081C53    add         esp,0FFFFFFEC
 00081C56    push        ebx
 00081C57    push        esi
 00081C58    mov         esi,ecx
 00081C5A    mov         dword ptr [ebp-4],edx
 00081C5D    mov         edx,dword ptr [ebp-4]
 00081C60    mov         edx,dword ptr [edx+10]
 00081C63    mov         eax,dword ptr [eax+10]
 00081C66    call        Min
 00081C6B    mov         ebx,eax
 00081C6D    lea         eax,[ebp-14]
 00081C70    push        eax
 00081C71    mov         ecx,esi
 00081C73    and         ecx,ebx
 00081C75    mov         edx,esi
 00081C77    not         edx
 00081C79    and         edx,ebx
 00081C7B    mov         eax,dword ptr [ebp+8]
 00081C7E    mov         eax,dword ptr [eax-4]
 00081C81    call        TCustomGrid.CellRect
 00081C86    mov         eax,dword ptr [ebp+8]
 00081C89    mov         eax,dword ptr [eax-4]
 00081C8C    mov         eax,dword ptr [eax+3C]
 00081C8F    mov         dword ptr [ebp-8],eax
 00081C92    mov         eax,dword ptr [ebp+8]
 00081C95    mov         eax,dword ptr [eax-4]
 00081C98    mov         eax,dword ptr [eax+38]
 00081C9B    mov         dword ptr [ebp-0C],eax
 00081C9E    push        0
 00081CA0    lea         eax,[ebp-14]
 00081CA3    push        eax
 00081CA4    mov         eax,dword ptr [ebp+8]
 00081CA7    mov         eax,dword ptr [eax-4]
 00081CAA    call        TWinControl.GetHandle
 00081CAF    push        eax
 00081CB0    call        user32.InvalidateRect
 00081CB5    pop         esi
 00081CB6    pop         ebx
 00081CB7    mov         esp,ebp
 00081CB9    pop         ebp
 00081CBA    ret
*}
end;

//00081CBC
procedure DoChange;
begin
{*
 00081CBC    push        ebp
 00081CBD    mov         ebp,esp
 00081CBF    add         esp,0FFFFFFA0
 00081CC2    push        ebx
 00081CC3    mov         ebx,dword ptr [ebp+8]
 00081CC6    add         ebx,0FFFFFFFC
 00081CC9    mov         eax,dword ptr [ebx]
 00081CCB    cmp         dword ptr [eax+200],0
>00081CD2    je          00081D09
 00081CD4    mov         eax,dword ptr [ebx]
 00081CD6    mov         ecx,dword ptr [eax+210]
 00081CDC    mov         eax,dword ptr [ebx]
 00081CDE    mov         edx,dword ptr [eax+1FC]
 00081CE4    mov         eax,dword ptr [ebx]
 00081CE6    add         eax,200
 00081CEB    call        UpdateExtents
 00081CF0    mov         eax,dword ptr [ebx]
 00081CF2    mov         edx,dword ptr [eax+1FC]
 00081CF8    mov         eax,dword ptr [ebx]
 00081CFA    add         eax,204
 00081CFF    mov         ecx,1
 00081D04    call        UpdateExtents
 00081D09    mov         eax,dword ptr [ebx]
 00081D0B    cmp         dword ptr [eax+230],0
>00081D12    je          00081D30
 00081D14    mov         eax,dword ptr [ebx]
 00081D16    mov         ecx,dword ptr [eax+214]
 00081D1C    mov         eax,dword ptr [ebx]
 00081D1E    mov         edx,dword ptr [eax+22C]
 00081D24    mov         eax,dword ptr [ebx]
 00081D26    add         eax,230
 00081D2B    call        UpdateExtents
 00081D30    mov         eax,dword ptr [ebx]
 00081D32    mov         edx,dword ptr [eax+208]
 00081D38    mov         dword ptr [ebp-8],edx
 00081D3B    mov         edx,dword ptr [eax+20C]
 00081D41    mov         dword ptr [ebp-4],edx
 00081D44    mov         eax,dword ptr [ebx]
 00081D46    mov         eax,dword ptr [eax+22C]
 00081D4C    mov         edx,dword ptr [ebx]
 00081D4E    cmp         eax,dword ptr [edx+20C]
>00081D54    jg          00081D5A
 00081D56    dec         eax
 00081D57    mov         dword ptr [ebp-4],eax
 00081D5A    mov         eax,dword ptr [ebx]
 00081D5C    mov         eax,dword ptr [eax+1FC]
 00081D62    mov         edx,dword ptr [ebx]
 00081D64    cmp         eax,dword ptr [edx+208]
>00081D6A    jg          00081D70
 00081D6C    dec         eax
 00081D6D    mov         dword ptr [ebp-8],eax
 00081D70    mov         edx,dword ptr [ebx]
 00081D72    mov         edx,dword ptr [edx+208]
 00081D78    mov         eax,dword ptr [ebp-8]
 00081D7B    cmp         edx,eax
>00081D7D    jne         00081D8C
 00081D7F    mov         edx,dword ptr [ebx]
 00081D81    mov         edx,dword ptr [edx+20C]
 00081D87    cmp         edx,dword ptr [ebp-4]
>00081D8A    je          00081D9B
 00081D8C    push        1
 00081D8E    push        1
 00081D90    mov         edx,dword ptr [ebx]
 00081D92    mov         ecx,dword ptr [ebp-4]
 00081D95    xchg        eax,edx
 00081D96    call        TCustomGrid.MoveCurrent
 00081D9B    mov         eax,dword ptr [ebx]
 00081D9D    mov         eax,dword ptr [eax+1F0]
 00081DA3    cmp         eax,dword ptr [ebp-8]
>00081DA6    jne         00081DB5
 00081DA8    mov         eax,dword ptr [ebx]
 00081DAA    mov         eax,dword ptr [eax+1F4]
 00081DB0    cmp         eax,dword ptr [ebp-4]
>00081DB3    je          00081DBF
 00081DB5    lea         edx,[ebp-8]
 00081DB8    mov         eax,dword ptr [ebx]
 00081DBA    call        TCustomGrid.MoveAnchor
 00081DBF    mov         eax,dword ptr [ebx]
 00081DC1    cmp         byte ptr [eax+272],0
>00081DC8    jne         00081DEA
 00081DCA    mov         eax,dword ptr [ebx]
 00081DCC    mov         eax,dword ptr [eax+238]
 00081DD2    mov         edx,dword ptr [ebp+8]
 00081DD5    cmp         eax,dword ptr [edx-40]
>00081DD8    jne         00081DEA
 00081DDA    mov         eax,dword ptr [ebx]
 00081DDC    mov         eax,dword ptr [eax+23C]
 00081DE2    mov         edx,dword ptr [ebp+8]
 00081DE5    cmp         eax,dword ptr [edx-14]
>00081DE8    je          00081DF3
 00081DEA    mov         eax,dword ptr [ebx]
 00081DEC    call        TCustomGrid.InvalidateGrid
>00081DF1    jmp         00081E33
 00081DF3    mov         eax,dword ptr [ebx]
 00081DF5    call        TWinControl.HandleAllocated
 00081DFA    test        al,al
>00081DFC    je          00081E33
 00081DFE    lea         edx,[ebp-60]
 00081E01    mov         eax,dword ptr [ebx]
 00081E03    call        TCustomGrid.CalcDrawInfo
 00081E08    mov         eax,dword ptr [ebp+8]
 00081E0B    push        eax
 00081E0C    lea         edx,[ebp-60]
 00081E0F    mov         eax,dword ptr [ebp+8]
 00081E12    add         eax,0FFFFFFA4
 00081E15    xor         ecx,ecx
 00081E17    call        MinRedraw
 00081E1C    pop         ecx
 00081E1D    mov         eax,dword ptr [ebp+8]
 00081E20    push        eax
 00081E21    lea         edx,[ebp-34]
 00081E24    mov         eax,dword ptr [ebp+8]
 00081E27    add         eax,0FFFFFFD0
 00081E2A    or          ecx,0FFFFFFFF
 00081E2D    call        MinRedraw
 00081E32    pop         ecx
 00081E33    mov         eax,dword ptr [ebx]
 00081E35    call        TCustomGrid.UpdateScrollRange
 00081E3A    mov         eax,dword ptr [ebp+8]
 00081E3D    mov         ecx,dword ptr [eax-64]
 00081E40    mov         eax,dword ptr [ebp+8]
 00081E43    mov         edx,dword ptr [eax-60]
 00081E46    mov         eax,dword ptr [ebx]
 00081E48    mov         bx,0FFAE
 00081E4C    call        @CallDynaInst
 00081E51    pop         ebx
 00081E52    mov         esp,ebp
 00081E54    pop         ebp
 00081E55    ret
*}
end;

//00081E58
procedure TCustomGrid.ChangeSize(NewColCount:Longint; NewRowCount:Longint);
begin
{*
 00081E58    push        ebp
 00081E59    mov         ebp,esp
 00081E5B    add         esp,0FFFFFF9C
 00081E5E    push        ebx
 00081E5F    push        esi
 00081E60    push        edi
 00081E61    mov         esi,ecx
 00081E63    mov         ebx,edx
 00081E65    mov         dword ptr [ebp-4],eax
 00081E68    mov         eax,dword ptr [ebp-4]
 00081E6B    call        TWinControl.HandleAllocated
 00081E70    test        al,al
>00081E72    je          00081E7F
 00081E74    lea         edx,[ebp-5C]
 00081E77    mov         eax,dword ptr [ebp-4]
 00081E7A    call        TCustomGrid.CalcDrawInfo
 00081E7F    mov         eax,dword ptr [ebp-4]
 00081E82    mov         eax,dword ptr [eax+1FC]
 00081E88    mov         dword ptr [ebp-60],eax
 00081E8B    mov         eax,dword ptr [ebp-4]
 00081E8E    mov         eax,dword ptr [eax+22C]
 00081E94    mov         dword ptr [ebp-64],eax
 00081E97    mov         eax,dword ptr [ebp-4]
 00081E9A    mov         dword ptr [eax+1FC],ebx
 00081EA0    mov         eax,dword ptr [ebp-4]
 00081EA3    mov         dword ptr [eax+22C],esi
 00081EA9    mov         eax,dword ptr [ebp-4]
 00081EAC    cmp         ebx,dword ptr [eax+218]
>00081EB2    jge         00081EBE
 00081EB4    dec         ebx
 00081EB5    mov         eax,dword ptr [ebp-4]
 00081EB8    mov         dword ptr [eax+218],ebx
 00081EBE    mov         eax,dword ptr [ebp-4]
 00081EC1    cmp         esi,dword ptr [eax+21C]
>00081EC7    jge         00081ED3
 00081EC9    dec         esi
 00081ECA    mov         eax,dword ptr [ebp-4]
 00081ECD    mov         dword ptr [eax+21C],esi
 00081ED3    xor         eax,eax
 00081ED5    push        ebp
 00081ED6    push        81EF2
 00081EDB    push        dword ptr fs:[eax]
 00081EDE    mov         dword ptr fs:[eax],esp
 00081EE1    push        ebp
 00081EE2    call        DoChange
 00081EE7    pop         ecx
 00081EE8    xor         eax,eax
 00081EEA    pop         edx
 00081EEB    pop         ecx
 00081EEC    pop         ecx
 00081EED    mov         dword ptr fs:[eax],edx
>00081EF0    jmp         00081F28
>00081EF2    jmp         @HandleAnyException
 00081EF7    mov         eax,dword ptr [ebp-4]
 00081EFA    mov         edx,dword ptr [ebp-60]
 00081EFD    mov         dword ptr [eax+1FC],edx
 00081F03    mov         eax,dword ptr [ebp-4]
 00081F06    mov         edx,dword ptr [ebp-64]
 00081F09    mov         dword ptr [eax+22C],edx
 00081F0F    push        ebp
 00081F10    call        DoChange
 00081F15    pop         ecx
 00081F16    mov         eax,dword ptr [ebp-4]
 00081F19    call        TCustomGrid.InvalidateGrid
 00081F1E    call        @RaiseAgain
 00081F23    call        @DoneExcept
 00081F28    pop         edi
 00081F29    pop         esi
 00081F2A    pop         ebx
 00081F2B    mov         esp,ebp
 00081F2D    pop         ebp
 00081F2E    ret
*}
end;

//00081F30
procedure TCustomGrid.ClampInView(const Coord:TGridCoord);
begin
{*
 00081F30    push        ebx
 00081F31    push        esi
 00081F32    add         esp,0FFFFFF98
 00081F35    mov         esi,edx
 00081F37    mov         ebx,eax
 00081F39    mov         eax,ebx
 00081F3B    call        TWinControl.HandleAllocated
 00081F40    test        al,al
>00081F42    je          00081FF2
 00081F48    lea         edx,[esp+10]
 00081F4C    mov         eax,ebx
 00081F4E    call        TCustomGrid.CalcDrawInfo
 00081F53    mov         eax,dword ptr [esi]
 00081F55    cmp         eax,dword ptr [esp+20]
>00081F59    jg          00081F77
 00081F5B    mov         edx,dword ptr [esi+4]
 00081F5E    cmp         edx,dword ptr [esp+4C]
>00081F62    jg          00081F77
 00081F64    cmp         eax,dword ptr [ebx+238]
>00081F6A    jl          00081F77
 00081F6C    mov         eax,dword ptr [esi+4]
 00081F6F    cmp         eax,dword ptr [ebx+23C]
>00081F75    jge         00081FF2
 00081F77    mov         eax,dword ptr [ebx+238]
 00081F7D    mov         dword ptr [esp+8],eax
 00081F81    mov         eax,dword ptr [ebx+23C]
 00081F87    mov         dword ptr [esp+0C],eax
 00081F8B    push        esp
 00081F8C    lea         ecx,[esp+14]
 00081F90    mov         edx,esi
 00081F92    mov         eax,ebx
 00081F94    call        TCustomGrid.CalcMaxTopLeft
 00081F99    mov         eax,ebx
 00081F9B    mov         edx,dword ptr [eax]
 00081F9D    call        dword ptr [edx+84]
 00081FA3    mov         eax,dword ptr [esi]
 00081FA5    cmp         eax,dword ptr [ebx+238]
>00081FAB    jge         00081FB5
 00081FAD    mov         dword ptr [ebx+238],eax
>00081FB3    jmp         00081FC4
 00081FB5    cmp         eax,dword ptr [esp+20]
>00081FB9    jle         00081FC4
 00081FBB    mov         eax,dword ptr [esp]
 00081FBE    mov         dword ptr [ebx+238],eax
 00081FC4    mov         eax,dword ptr [esi+4]
 00081FC7    cmp         eax,dword ptr [ebx+23C]
>00081FCD    jge         00081FD7
 00081FCF    mov         dword ptr [ebx+23C],eax
>00081FD5    jmp         00081FE7
 00081FD7    cmp         eax,dword ptr [esp+4C]
>00081FDB    jle         00081FE7
 00081FDD    mov         eax,dword ptr [esp+4]
 00081FE1    mov         dword ptr [ebx+23C],eax
 00081FE7    lea         edx,[esp+8]
 00081FEB    mov         eax,ebx
 00081FED    call        TCustomGrid.TopLeftMoved
 00081FF2    add         esp,68
 00081FF5    pop         esi
 00081FF6    pop         ebx
 00081FF7    ret
*}
end;

//00081FF8
procedure TCustomGrid.DrawSizingLine(const DrawInfo:TGridDrawInfo);
begin
{*
 00081FF8    push        ebp
 00081FF9    mov         ebp,esp
 00081FFB    add         esp,0FFFFFFF8
 00081FFE    push        ebx
 00081FFF    push        esi
 00082000    mov         esi,edx
 00082002    mov         ebx,eax
 00082004    mov         dl,1
 00082006    mov         eax,[0002889C];TPen
 0008200B    call        TPen.Create
 00082010    mov         dword ptr [ebp-4],eax
 00082013    xor         eax,eax
 00082015    push        ebp
 00082016    push        820F3
 0008201B    push        dword ptr fs:[eax]
 0008201E    mov         dword ptr fs:[eax],esp
 00082021    mov         eax,dword ptr [ebx+1EC]
 00082027    mov         dword ptr [ebp-8],eax
 0008202A    mov         eax,dword ptr [ebp-8]
 0008202D    mov         edx,dword ptr [eax+10]
 00082030    mov         eax,dword ptr [ebp-4]
 00082033    mov         ecx,dword ptr [eax]
 00082035    call        dword ptr [ecx+8]
 00082038    mov         eax,dword ptr [ebp-8]
 0008203B    mov         eax,dword ptr [eax+10]
 0008203E    mov         dl,2
 00082040    call        TPen.SetStyle
 00082045    mov         eax,dword ptr [ebp-8]
 00082048    mov         eax,dword ptr [eax+10]
 0008204B    mov         dl,0E
 0008204D    call        TPen.SetMode
 00082052    mov         eax,dword ptr [ebp-8]
 00082055    mov         eax,dword ptr [eax+10]
 00082058    mov         edx,1
 0008205D    call        TPen.SetWidth
 00082062    xor         eax,eax
 00082064    push        ebp
 00082065    push        820D6
 0008206A    push        dword ptr fs:[eax]
 0008206D    mov         dword ptr fs:[eax],esp
 00082070    cmp         byte ptr [ebx+26E],2
>00082077    jne         0008209C
 00082079    mov         ecx,dword ptr [ebx+244]
 0008207F    xor         edx,edx
 00082081    mov         eax,dword ptr [ebp-8]
 00082084    call        TCanvas.MoveTo
 00082089    mov         ecx,dword ptr [ebx+244]
 0008208F    mov         edx,dword ptr [esi+8]
 00082092    mov         eax,dword ptr [ebp-8]
 00082095    call        TCanvas.LineTo
>0008209A    jmp         000820BD
 0008209C    mov         edx,dword ptr [ebx+244]
 000820A2    xor         ecx,ecx
 000820A4    mov         eax,dword ptr [ebp-8]
 000820A7    call        TCanvas.MoveTo
 000820AC    mov         ecx,dword ptr [esi+34]
 000820AF    mov         edx,dword ptr [ebx+244]
 000820B5    mov         eax,dword ptr [ebp-8]
 000820B8    call        TCanvas.LineTo
 000820BD    xor         eax,eax
 000820BF    pop         edx
 000820C0    pop         ecx
 000820C1    pop         ecx
 000820C2    mov         dword ptr fs:[eax],edx
 000820C5    push        820DD
 000820CA    mov         edx,dword ptr [ebp-4]
 000820CD    mov         eax,dword ptr [ebp-8]
 000820D0    call        TCanvas.SetPen
 000820D5    ret
>000820D6    jmp         @HandleFinally
>000820DB    jmp         000820CA
 000820DD    xor         eax,eax
 000820DF    pop         edx
 000820E0    pop         ecx
 000820E1    pop         ecx
 000820E2    mov         dword ptr fs:[eax],edx
 000820E5    push        820FA
 000820EA    mov         eax,dword ptr [ebp-4]
 000820ED    call        TObject.Free
 000820F2    ret
>000820F3    jmp         @HandleFinally
>000820F8    jmp         000820EA
 000820FA    pop         esi
 000820FB    pop         ebx
 000820FC    pop         ecx
 000820FD    pop         ecx
 000820FE    pop         ebp
 000820FF    ret
*}
end;

//00082100
procedure TCustomGrid.DrawMove;
begin
{*
 00082100    push        ebp
 00082101    mov         ebp,esp
 00082103    add         esp,0FFFFFFE8
 00082106    push        ebx
 00082107    push        esi
 00082108    mov         dword ptr [ebp-4],eax
 0008210B    mov         dl,1
 0008210D    mov         eax,[0002889C];TPen
 00082112    call        TPen.Create
 00082117    mov         dword ptr [ebp-8],eax
 0008211A    xor         eax,eax
 0008211C    push        ebp
 0008211D    push        82281
 00082122    push        dword ptr fs:[eax]
 00082125    mov         dword ptr fs:[eax],esp
 00082128    mov         eax,dword ptr [ebp-4]
 0008212B    mov         esi,dword ptr [eax+1EC]
 00082131    mov         edx,dword ptr [esi+10]
 00082134    mov         eax,dword ptr [ebp-8]
 00082137    mov         ecx,dword ptr [eax]
 00082139    call        dword ptr [ecx+8]
 0008213C    xor         eax,eax
 0008213E    push        ebp
 0008213F    push        82264
 00082144    push        dword ptr fs:[eax]
 00082147    mov         dword ptr fs:[eax],esp
 0008214A    mov         eax,dword ptr [esi+10]
 0008214D    mov         dl,2
 0008214F    call        TPen.SetStyle
 00082154    mov         eax,dword ptr [esi+10]
 00082157    mov         dl,0E
 00082159    call        TPen.SetMode
 0008215E    mov         eax,dword ptr [esi+10]
 00082161    mov         edx,5
 00082166    call        TPen.SetWidth
 0008216B    mov         eax,dword ptr [ebp-4]
 0008216E    cmp         byte ptr [eax+26E],4
>00082175    jne         000821CA
 00082177    lea         eax,[ebp-18]
 0008217A    push        eax
 0008217B    mov         eax,dword ptr [ebp-4]
 0008217E    mov         ecx,dword ptr [eax+250]
 00082184    xor         edx,edx
 00082186    mov         eax,dword ptr [ebp-4]
 00082189    call        TCustomGrid.CellRect
 0008218E    mov         eax,dword ptr [ebp-4]
 00082191    mov         eax,dword ptr [eax+250]
 00082197    mov         edx,dword ptr [ebp-4]
 0008219A    cmp         eax,dword ptr [edx+24C]
>000821A0    jle         000821A7
 000821A2    mov         ebx,dword ptr [ebp-0C]
>000821A5    jmp         000821AA
 000821A7    mov         ebx,dword ptr [ebp-14]
 000821AA    mov         ecx,ebx
 000821AC    xor         edx,edx
 000821AE    mov         eax,esi
 000821B0    call        TCanvas.MoveTo
 000821B5    mov         eax,dword ptr [ebp-4]
 000821B8    call        TControl.GetClientWidth
 000821BD    mov         edx,eax
 000821BF    mov         ecx,ebx
 000821C1    mov         eax,esi
 000821C3    call        TCanvas.LineTo
>000821C8    jmp         00082245
 000821CA    lea         eax,[ebp-18]
 000821CD    push        eax
 000821CE    mov         eax,dword ptr [ebp-4]
 000821D1    mov         edx,dword ptr [eax+250]
 000821D7    xor         ecx,ecx
 000821D9    mov         eax,dword ptr [ebp-4]
 000821DC    call        TCustomGrid.CellRect
 000821E1    mov         eax,dword ptr [ebp-4]
 000821E4    mov         eax,dword ptr [eax+250]
 000821EA    mov         edx,dword ptr [ebp-4]
 000821ED    cmp         eax,dword ptr [edx+24C]
>000821F3    jle         0008220F
 000821F5    mov         eax,dword ptr [ebp-4]
 000821F8    mov         bx,0FFCF
 000821FC    call        @CallDynaInst
 00082201    test        al,al
>00082203    jne         0008220A
 00082205    mov         ebx,dword ptr [ebp-10]
>00082208    jmp         00082227
 0008220A    mov         ebx,dword ptr [ebp-18]
>0008220D    jmp         00082227
 0008220F    mov         eax,dword ptr [ebp-4]
 00082212    mov         bx,0FFCF
 00082216    call        @CallDynaInst
 0008221B    test        al,al
>0008221D    jne         00082224
 0008221F    mov         ebx,dword ptr [ebp-18]
>00082222    jmp         00082227
 00082224    mov         ebx,dword ptr [ebp-10]
 00082227    xor         ecx,ecx
 00082229    mov         edx,ebx
 0008222B    mov         eax,esi
 0008222D    call        TCanvas.MoveTo
 00082232    mov         eax,dword ptr [ebp-4]
 00082235    call        TControl.GetClientHeight
 0008223A    mov         ecx,eax
 0008223C    mov         edx,ebx
 0008223E    mov         eax,esi
 00082240    call        TCanvas.LineTo
 00082245    xor         eax,eax
 00082247    pop         edx
 00082248    pop         ecx
 00082249    pop         ecx
 0008224A    mov         dword ptr fs:[eax],edx
 0008224D    push        8226B
 00082252    mov         eax,dword ptr [ebp-4]
 00082255    mov         eax,dword ptr [eax+1EC]
 0008225B    mov         edx,dword ptr [ebp-8]
 0008225E    call        TCanvas.SetPen
 00082263    ret
>00082264    jmp         @HandleFinally
>00082269    jmp         00082252
 0008226B    xor         eax,eax
 0008226D    pop         edx
 0008226E    pop         ecx
 0008226F    pop         ecx
 00082270    mov         dword ptr fs:[eax],edx
 00082273    push        82288
 00082278    mov         eax,dword ptr [ebp-8]
 0008227B    call        TObject.Free
 00082280    ret
>00082281    jmp         @HandleFinally
>00082286    jmp         00082278
 00082288    pop         esi
 00082289    pop         ebx
 0008228A    mov         esp,ebp
 0008228C    pop         ebp
 0008228D    ret
*}
end;

//00082290
procedure TCustomGrid.FocusCell(ACol:Longint; ARow:Longint; MoveAnchor:Boolean);
begin
{*
 00082290    push        ebp
 00082291    mov         ebp,esp
 00082293    push        ebx
 00082294    push        esi
 00082295    mov         esi,eax
 00082297    mov         al,byte ptr [ebp+8]
 0008229A    push        eax
 0008229B    push        1
 0008229D    mov         eax,esi
 0008229F    call        TCustomGrid.MoveCurrent
 000822A4    mov         eax,esi
 000822A6    call        TCustomGrid.UpdateEdit
 000822AB    mov         eax,esi
 000822AD    mov         bx,0FFEC
 000822B1    call        @CallDynaInst
 000822B6    pop         esi
 000822B7    pop         ebx
 000822B8    pop         ebp
 000822B9    ret         4
*}
end;

//000822BC
function LinePos(const AxisInfo:TGridAxisDrawInfo; Line:Integer):Integer;
begin
{*
 000822BC    push        ebp
 000822BD    mov         ebp,esp
 000822BF    push        ecx
 000822C0    push        ebx
 000822C1    push        esi
 000822C2    push        edi
 000822C3    mov         ebx,eax
 000822C5    xor         esi,esi
 000822C7    cmp         edx,dword ptr [ebx+18]
>000822CA    jge         000822D0
 000822CC    xor         eax,eax
>000822CE    jmp         000822DA
 000822D0    mov         eax,dword ptr [ebx+1C]
 000822D3    cmp         edx,eax
>000822D5    jl          000822DA
 000822D7    mov         esi,dword ptr [ebx+4]
 000822DA    mov         edi,edx
 000822DC    dec         edi
 000822DD    sub         edi,eax
>000822DF    jl          00082301
 000822E1    inc         edi
 000822E2    mov         dword ptr [ebp-4],eax
 000822E5    mov         edx,dword ptr [ebp-4]
 000822E8    mov         eax,dword ptr [ebx+28]
 000822EB    call        dword ptr [ebx+24]
 000822EE    add         eax,dword ptr [ebx]
 000822F0    add         esi,eax
 000822F2    cmp         esi,dword ptr [ebx+0C]
>000822F5    jle         000822FB
 000822F7    xor         esi,esi
>000822F9    jmp         00082301
 000822FB    inc         dword ptr [ebp-4]
 000822FE    dec         edi
>000822FF    jne         000822E5
 00082301    mov         eax,esi
 00082303    pop         edi
 00082304    pop         esi
 00082305    pop         ebx
 00082306    pop         ecx
 00082307    pop         ebp
 00082308    ret
*}
end;

//0008230C
function CalcAxis(const AxisInfo:TGridAxisDrawInfo; GridRectMin:Integer; GridRectMax:Integer; var ScreenRectMin:Integer; var ScreenRectMax:Integer):Boolean;
begin
{*
 0008230C    push        ebp
 0008230D    mov         ebp,esp
 0008230F    add         esp,0FFFFFFF8
 00082312    push        ebx
 00082313    push        esi
 00082314    push        edi
 00082315    mov         esi,ecx
 00082317    mov         dword ptr [ebp-4],edx
 0008231A    mov         ebx,eax
 0008231C    mov         edi,dword ptr [ebp+8]
 0008231F    mov         byte ptr [ebp-5],0
 00082323    mov         eax,dword ptr [ebx+18]
 00082326    cmp         eax,dword ptr [ebp-4]
>00082329    jg          00082351
 0008232B    mov         eax,dword ptr [ebx+1C]
 0008232E    cmp         eax,dword ptr [ebp-4]
>00082331    jle         00082351
 00082333    mov         eax,dword ptr [ebx+1C]
 00082336    cmp         esi,eax
>00082338    jge         0008234E
 0008233A    mov         eax,dword ptr [ebp+10]
 0008233D    mov         eax,dword ptr [eax-4]
 00082340    xor         ecx,ecx
 00082342    mov         edx,10
 00082347    call        @FillChar
>0008234C    jmp         000823C6
 0008234E    mov         dword ptr [ebp-4],eax
 00082351    mov         eax,dword ptr [ebx+10]
 00082354    cmp         esi,eax
>00082356    jle         00082371
 00082358    mov         esi,eax
 0008235A    mov         eax,dword ptr [ebx+20]
 0008235D    dec         eax
 0008235E    cmp         esi,eax
>00082360    jge         00082363
 00082362    inc         esi
 00082363    mov         eax,ebx
 00082365    mov         edx,esi
 00082367    call        LinePos
 0008236C    test        eax,eax
>0008236E    jne         00082371
 00082370    dec         esi
 00082371    mov         eax,ebx
 00082373    mov         edx,dword ptr [ebp-4]
 00082376    call        LinePos
 0008237B    mov         edx,dword ptr [ebp+0C]
 0008237E    mov         dword ptr [edx],eax
 00082380    mov         eax,ebx
 00082382    mov         edx,esi
 00082384    call        LinePos
 00082389    mov         dword ptr [edi],eax
 0008238B    cmp         dword ptr [edi],0
>0008238E    jne         000823A2
 00082390    mov         edx,dword ptr [ebp-4]
 00082393    mov         eax,dword ptr [ebx+28]
 00082396    call        dword ptr [ebx+24]
 00082399    mov         edx,dword ptr [ebp+0C]
 0008239C    add         eax,dword ptr [edx]
 0008239E    mov         dword ptr [edi],eax
>000823A0    jmp         000823AC
 000823A2    mov         edx,esi
 000823A4    mov         eax,dword ptr [ebx+28]
 000823A7    call        dword ptr [ebx+24]
 000823AA    add         dword ptr [edi],eax
 000823AC    mov         eax,dword ptr [ebx+0C]
 000823AF    cmp         eax,dword ptr [edi]
>000823B1    jge         000823B5
 000823B3    mov         dword ptr [edi],eax
 000823B5    mov         eax,dword ptr [ebp+10]
 000823B8    cmp         byte ptr [eax+8],0
>000823BC    je          000823C2
 000823BE    mov         eax,dword ptr [ebx]
 000823C0    add         dword ptr [edi],eax
 000823C2    mov         byte ptr [ebp-5],1
 000823C6    mov         al,byte ptr [ebp-5]
 000823C9    pop         edi
 000823CA    pop         esi
 000823CB    pop         ebx
 000823CC    pop         ecx
 000823CD    pop         ecx
 000823CE    pop         ebp
 000823CF    ret         8
*}
end;

//000823D4
procedure TCustomGrid.GridRectToScreenRect(GridRect:TGridRect; var ScreenRect:TRect; IncludeLine:Boolean);
begin
{*
 000823D4    push        ebp
 000823D5    mov         ebp,esp
 000823D7    add         esp,0FFFFFF94
 000823DA    push        ebx
 000823DB    push        esi
 000823DC    push        edi
 000823DD    mov         esi,edx
 000823DF    lea         edi,[ebp-14]
 000823E2    push        ecx
 000823E3    mov         ecx,4
 000823E8    rep movs    dword ptr [edi],dword ptr [esi]
 000823EA    pop         ecx
 000823EB    mov         dword ptr [ebp-4],ecx
 000823EE    mov         esi,eax
 000823F0    mov         eax,dword ptr [ebp-4]
 000823F3    xor         ecx,ecx
 000823F5    mov         edx,10
 000823FA    call        @FillChar
 000823FF    mov         eax,dword ptr [ebp-14]
 00082402    cmp         eax,dword ptr [ebp-0C]
>00082405    jg          000824BD
 0008240B    mov         eax,dword ptr [ebp-10]
 0008240E    cmp         eax,dword ptr [ebp-8]
>00082411    jg          000824BD
 00082417    lea         edx,[ebp-6C]
 0008241A    mov         eax,esi
 0008241C    call        TCustomGrid.CalcDrawInfo
 00082421    mov         eax,dword ptr [ebp-5C]
 00082424    inc         eax
 00082425    mov         ebx,dword ptr [ebp-14]
 00082428    cmp         eax,ebx
>0008242A    jl          000824BD
 00082430    mov         eax,dword ptr [ebp-30]
 00082433    inc         eax
 00082434    cmp         eax,dword ptr [ebp-10]
>00082437    jl          000824BD
 0008243D    push        ebp
 0008243E    mov         eax,dword ptr [ebp-4]
 00082441    push        eax
 00082442    mov         eax,dword ptr [ebp-4]
 00082445    add         eax,8
 00082448    push        eax
 00082449    lea         eax,[ebp-6C]
 0008244C    mov         ecx,dword ptr [ebp-0C]
 0008244F    mov         edx,ebx
 00082451    call        CalcAxis
 00082456    pop         ecx
 00082457    test        al,al
>00082459    je          00082479
 0008245B    push        ebp
 0008245C    mov         eax,dword ptr [ebp-4]
 0008245F    add         eax,4
 00082462    push        eax
 00082463    mov         eax,dword ptr [ebp-4]
 00082466    add         eax,0C
 00082469    push        eax
 0008246A    lea         eax,[ebp-40]
 0008246D    mov         ecx,dword ptr [ebp-8]
 00082470    mov         edx,dword ptr [ebp-10]
 00082473    call        CalcAxis
 00082478    pop         ecx
 00082479    mov         eax,esi
 0008247B    mov         bx,0FFCF
 0008247F    call        @CallDynaInst
 00082484    test        al,al
>00082486    je          000824BD
 00082488    mov         eax,dword ptr [esi+1EC]
 0008248E    call        TCanvas.GetCanvasOrientation
 00082493    test        al,al
>00082495    jne         000824BD
 00082497    mov         ebx,dword ptr [ebp-4]
 0008249A    mov         ebx,dword ptr [ebx]
 0008249C    mov         eax,esi
 0008249E    call        TControl.GetClientWidth
 000824A3    mov         edx,dword ptr [ebp-4]
 000824A6    sub         eax,dword ptr [edx+8]
 000824A9    mov         edx,dword ptr [ebp-4]
 000824AC    mov         dword ptr [edx],eax
 000824AE    mov         eax,esi
 000824B0    call        TControl.GetClientWidth
 000824B5    sub         eax,ebx
 000824B7    mov         edx,dword ptr [ebp-4]
 000824BA    mov         dword ptr [edx+8],eax
 000824BD    pop         edi
 000824BE    pop         esi
 000824BF    pop         ebx
 000824C0    mov         esp,ebp
 000824C2    pop         ebp
 000824C3    ret         4
*}
end;

//000824C8
procedure TCustomGrid.Initialize;
begin
{*
 000824C8    mov         edx,dword ptr [eax+218]
 000824CE    mov         dword ptr [eax+238],edx
 000824D4    mov         edx,dword ptr [eax+21C]
 000824DA    mov         dword ptr [eax+23C],edx
 000824E0    mov         edx,dword ptr [eax+238]
 000824E6    mov         dword ptr [eax+208],edx
 000824EC    mov         edx,dword ptr [eax+23C]
 000824F2    mov         dword ptr [eax+20C],edx
 000824F8    mov         edx,dword ptr [eax+208]
 000824FE    mov         dword ptr [eax+1F0],edx
 00082504    mov         edx,dword ptr [eax+20C]
 0008250A    mov         dword ptr [eax+1F4],edx
 00082510    test        byte ptr [eax+229],10
>00082517    je          00082526
 00082519    mov         edx,dword ptr [eax+1FC]
 0008251F    dec         edx
 00082520    mov         dword ptr [eax+1F0],edx
 00082526    ret
*}
end;

//00082528
procedure TCustomGrid.InvalidateCell(ACol:Longint; ARow:Longint);
begin
{*
 00082528    push        esi
 00082529    add         esp,0FFFFFFF0
 0008252C    mov         esi,eax
 0008252E    mov         dword ptr [esp+4],ecx
 00082532    mov         dword ptr [esp],edx
 00082535    mov         dword ptr [esp+0C],ecx
 00082539    mov         dword ptr [esp+8],edx
 0008253D    mov         edx,esp
 0008253F    mov         eax,esi
 00082541    call        TCustomGrid.InvalidateRect
 00082546    add         esp,10
 00082549    pop         esi
 0008254A    ret
*}
end;

//0008254C
procedure TCustomGrid.InvalidateGrid;
begin
{*
 0008254C    mov         edx,dword ptr [eax]
 0008254E    call        dword ptr [edx+78]
 00082551    ret
*}
end;

//00082554
procedure TCustomGrid.InvalidateRect(ARect:TGridRect);
begin
{*
 00082554    push        ebx
 00082555    push        esi
 00082556    push        edi
 00082557    add         esp,0FFFFFFE0
 0008255A    mov         esi,edx
 0008255C    lea         edi,[esp]
 0008255F    mov         ecx,4
 00082564    rep movs    dword ptr [edi],dword ptr [esi]
 00082566    mov         ebx,eax
 00082568    mov         eax,ebx
 0008256A    call        TWinControl.HandleAllocated
 0008256F    test        al,al
>00082571    je          00082598
 00082573    push        1
 00082575    lea         ecx,[esp+14]
 00082579    lea         edx,[esp+4]
 0008257D    mov         eax,ebx
 0008257F    call        TCustomGrid.GridRectToScreenRect
 00082584    push        0
 00082586    lea         eax,[esp+14]
 0008258A    push        eax
 0008258B    mov         eax,ebx
 0008258D    call        TWinControl.GetHandle
 00082592    push        eax
 00082593    call        user32.InvalidateRect
 00082598    add         esp,20
 0008259B    pop         edi
 0008259C    pop         esi
 0008259D    pop         ebx
 0008259E    ret
*}
end;

//000825A0
function Min:Longint;
begin
{*
 000825A0    push        ebp
 000825A1    mov         ebp,esp
 000825A3    mov         eax,dword ptr [ebp+8]
 000825A6    cmp         dword ptr [eax-4],0
>000825AA    jne         000825BA
 000825AC    mov         eax,dword ptr [ebp+8]
 000825AF    mov         eax,dword ptr [eax-8]
 000825B2    mov         eax,dword ptr [eax+218]
 000825B8    pop         ebp
 000825B9    ret
 000825BA    mov         eax,dword ptr [ebp+8]
 000825BD    mov         eax,dword ptr [eax-8]
 000825C0    mov         eax,dword ptr [eax+21C]
 000825C6    pop         ebp
 000825C7    ret
*}
end;

//000825C8
function Max:Longint;
begin
{*
 000825C8    push        ebp
 000825C9    mov         ebp,esp
 000825CB    mov         eax,dword ptr [ebp+8]
 000825CE    cmp         dword ptr [eax-4],0
>000825D2    jne         000825DC
 000825D4    mov         eax,dword ptr [ebp+8]
 000825D7    mov         eax,dword ptr [eax-10]
 000825DA    pop         ebp
 000825DB    ret
 000825DC    mov         eax,dword ptr [ebp+8]
 000825DF    mov         eax,dword ptr [eax-0C]
 000825E2    pop         ebp
 000825E3    ret
*}
end;

//000825E4
function PageUp:Longint;
begin
{*
 000825E4    push        ebp
 000825E5    mov         ebp,esp
 000825E7    add         esp,0FFFFFFF8
 000825EA    lea         eax,[ebp-8]
 000825ED    push        eax
 000825EE    mov         eax,dword ptr [ebp+8]
 000825F1    lea         ecx,[eax-68]
 000825F4    mov         eax,dword ptr [ebp+8]
 000825F7    mov         eax,dword ptr [eax-8]
 000825FA    lea         edx,[eax+238]
 00082600    mov         eax,dword ptr [ebp+8]
 00082603    mov         eax,dword ptr [eax-8]
 00082606    call        TCustomGrid.CalcMaxTopLeft
 0008260B    mov         eax,dword ptr [ebp+8]
 0008260E    cmp         dword ptr [eax-4],0
>00082612    jne         00082625
 00082614    mov         eax,dword ptr [ebp+8]
 00082617    mov         eax,dword ptr [eax-8]
 0008261A    mov         eax,dword ptr [eax+238]
 00082620    sub         eax,dword ptr [ebp-8]
>00082623    jmp         00082634
 00082625    mov         eax,dword ptr [ebp+8]
 00082628    mov         eax,dword ptr [eax-8]
 0008262B    mov         eax,dword ptr [eax+23C]
 00082631    sub         eax,dword ptr [ebp-4]
 00082634    cmp         eax,1
>00082637    jge         0008263E
 00082639    mov         eax,1
 0008263E    pop         ecx
 0008263F    pop         ecx
 00082640    pop         ebp
 00082641    ret
*}
end;

//00082644
function PageDown:Longint;
begin
{*
 00082644    push        ebp
 00082645    mov         ebp,esp
 00082647    add         esp,0FFFFFFA8
 0008264A    lea         edx,[ebp-58]
 0008264D    mov         eax,dword ptr [ebp+8]
 00082650    mov         eax,dword ptr [eax-8]
 00082653    call        TCustomGrid.CalcDrawInfo
 00082658    mov         eax,dword ptr [ebp+8]
 0008265B    cmp         dword ptr [eax-4],0
>0008265F    jne         00082675
 00082661    mov         eax,dword ptr [ebp+8]
 00082664    mov         eax,dword ptr [eax-8]
 00082667    push        dword ptr [eax+238]
 0008266D    mov         eax,dword ptr [ebp-48]
 00082670    pop         edx
 00082671    sub         eax,edx
>00082673    jmp         00082687
 00082675    mov         eax,dword ptr [ebp+8]
 00082678    mov         eax,dword ptr [eax-8]
 0008267B    push        dword ptr [eax+23C]
 00082681    mov         eax,dword ptr [ebp-1C]
 00082684    pop         edx
 00082685    sub         eax,edx
 00082687    cmp         eax,1
>0008268A    jge         00082691
 0008268C    mov         eax,1
 00082691    mov         esp,ebp
 00082693    pop         ebp
 00082694    ret
*}
end;

//00082698
function CalcScrollBar(Value:Longint; ARTLFactor:Longint):Longint;
begin
{*
 00082698    push        ebp
 00082699    mov         ebp,esp
 0008269B    push        ebx
 0008269C    push        esi
 0008269D    mov         esi,edx
 0008269F    mov         ebx,eax
 000826A1    mov         eax,dword ptr [ebp+8]
 000826A4    mov         eax,dword ptr [eax-6C]
 000826A7    cmp         eax,7
>000826AA    ja          000827C7
 000826B0    jmp         dword ptr [eax*4+826B7]
 000826B0    dd          000826D7
 000826B0    dd          000826DE
 000826B0    dd          000826E5
 000826B0    dd          000826F8
 000826B0    dd          0008270B
 000826B0    dd          0008270B
 000826B0    dd          000827BB
 000826B0    dd          000827AD
 000826D7    sub         ebx,esi
>000826D9    jmp         000827C7
 000826DE    add         ebx,esi
>000826E0    jmp         000827C7
 000826E5    mov         eax,dword ptr [ebp+8]
 000826E8    push        eax
 000826E9    call        PageUp
 000826EE    pop         ecx
 000826EF    imul        esi
 000826F1    sub         ebx,eax
>000826F3    jmp         000827C7
 000826F8    mov         eax,dword ptr [ebp+8]
 000826FB    push        eax
 000826FC    call        PageDown
 00082701    pop         ecx
 00082702    imul        esi
 00082704    add         ebx,eax
>00082706    jmp         000827C7
 0008270B    mov         eax,dword ptr [ebp+8]
 0008270E    mov         eax,dword ptr [eax-8]
 00082711    test        byte ptr [eax+229],40
>00082718    jne         00082727
 0008271A    mov         eax,dword ptr [ebp+8]
 0008271D    cmp         dword ptr [eax-6C],4
>00082721    jne         000827C7
 00082727    mov         eax,dword ptr [ebp+8]
 0008272A    mov         eax,dword ptr [eax-8]
 0008272D    mov         bx,0FFCF
 00082731    call        @CallDynaInst
 00082736    test        al,al
>00082738    je          0008273D
 0008273A    dec         esi
>0008273B    jne         00082774
 0008273D    push        7F
 0008273F    mov         eax,dword ptr [ebp+8]
 00082742    push        eax
 00082743    call        Max
 00082748    pop         ecx
 00082749    mov         ebx,eax
 0008274B    mov         eax,dword ptr [ebp+8]
 0008274E    push        eax
 0008274F    call        Min
 00082754    pop         ecx
 00082755    sub         ebx,eax
 00082757    push        ebx
 00082758    mov         eax,dword ptr [ebp+8]
 0008275B    mov         eax,dword ptr [eax+0C]
 0008275E    push        eax
 0008275F    call        kernel32.MulDiv
 00082764    mov         ebx,eax
 00082766    mov         eax,dword ptr [ebp+8]
 00082769    push        eax
 0008276A    call        Min
 0008276F    pop         ecx
 00082770    add         ebx,eax
>00082772    jmp         000827C7
 00082774    push        7F
 00082776    mov         eax,dword ptr [ebp+8]
 00082779    push        eax
 0008277A    call        Max
 0008277F    pop         ecx
 00082780    mov         ebx,eax
 00082782    mov         eax,dword ptr [ebp+8]
 00082785    push        eax
 00082786    call        Min
 0008278B    pop         ecx
 0008278C    sub         ebx,eax
 0008278E    push        ebx
 0008278F    mov         eax,dword ptr [ebp+8]
 00082792    mov         eax,dword ptr [eax+0C]
 00082795    push        eax
 00082796    call        kernel32.MulDiv
 0008279B    push        eax
 0008279C    mov         eax,dword ptr [ebp+8]
 0008279F    push        eax
 000827A0    call        Max
 000827A5    pop         ecx
 000827A6    mov         ebx,eax
 000827A8    pop         eax
 000827A9    sub         ebx,eax
>000827AB    jmp         000827C7
 000827AD    mov         eax,dword ptr [ebp+8]
 000827B0    push        eax
 000827B1    call        Max
 000827B6    pop         ecx
 000827B7    mov         ebx,eax
>000827B9    jmp         000827C7
 000827BB    mov         eax,dword ptr [ebp+8]
 000827BE    push        eax
 000827BF    call        Min
 000827C4    pop         ecx
 000827C5    mov         ebx,eax
 000827C7    mov         eax,ebx
 000827C9    pop         esi
 000827CA    pop         ebx
 000827CB    pop         ebp
 000827CC    ret
*}
end;

//000827D0
procedure ModifyPixelScrollBar(Code:Cardinal; Pos:Cardinal);
begin
{*
 000827D0    push        ebp
 000827D1    mov         ebp,esp
 000827D3    add         esp,0FFFFFFE8
 000827D6    push        ebx
 000827D7    push        esi
 000827D8    push        edi
 000827D9    mov         dword ptr [ebp-8],edx
 000827DC    mov         dword ptr [ebp-4],eax
 000827DF    mov         eax,dword ptr [ebp+8]
 000827E2    mov         eax,dword ptr [eax-8]
 000827E5    mov         ebx,dword ptr [eax+268]
 000827EB    mov         eax,dword ptr [ebp+8]
 000827EE    mov         edx,dword ptr [eax-4C]
 000827F1    mov         eax,dword ptr [ebp+8]
 000827F4    mov         eax,dword ptr [eax-8]
 000827F7    call        TCustomGrid.GetColWidths
 000827FC    mov         edi,eax
 000827FE    mov         eax,dword ptr [ebp+8]
 00082801    mov         eax,dword ptr [eax-8]
 00082804    call        TControl.GetClientWidth
 00082809    mov         esi,eax
 0008280B    mov         eax,dword ptr [ebp+8]
 0008280E    sub         esi,dword ptr [eax-64]
 00082811    mov         eax,dword ptr [ebp-4]
 00082814    cmp         eax,7
>00082817    ja          000828E2
 0008281D    jmp         dword ptr [eax*4+82824]
 0008281D    dd          00082844
 0008281D    dd          00082864
 0008281D    dd          00082884
 0008281D    dd          00082890
 0008281D    dd          0008289C
 0008281D    dd          0008289C
 0008281D    dd          000828DE
 0008281D    dd          000828DA
 00082844    mov         eax,dword ptr [ebp+8]
 00082847    mov         eax,dword ptr [eax-8]
 0008284A    mov         eax,dword ptr [eax+1EC]
 00082850    mov         edx,82978;'0'
 00082855    call        TCanvas.TextWidth
 0008285A    mov         edx,dword ptr [ebp+8]
 0008285D    imul        dword ptr [edx-70]
 00082860    sub         ebx,eax
>00082862    jmp         000828E2
 00082864    mov         eax,dword ptr [ebp+8]
 00082867    mov         eax,dword ptr [eax-8]
 0008286A    mov         eax,dword ptr [eax+1EC]
 00082870    mov         edx,82978;'0'
 00082875    call        TCanvas.TextWidth
 0008287A    mov         edx,dword ptr [ebp+8]
 0008287D    imul        dword ptr [edx-70]
 00082880    add         ebx,eax
>00082882    jmp         000828E2
 00082884    mov         eax,dword ptr [ebp+8]
 00082887    mov         eax,dword ptr [eax-70]
 0008288A    imul        esi
 0008288C    sub         ebx,eax
>0008288E    jmp         000828E2
 00082890    mov         eax,dword ptr [ebp+8]
 00082893    mov         eax,dword ptr [eax-70]
 00082896    imul        esi
 00082898    add         ebx,eax
>0008289A    jmp         000828E2
 0008289C    mov         eax,dword ptr [ebp+8]
 0008289F    mov         eax,dword ptr [eax-8]
 000828A2    test        byte ptr [eax+229],40
>000828A9    jne         000828B1
 000828AB    cmp         dword ptr [ebp-4],4
>000828AF    jne         000828E2
 000828B1    mov         eax,dword ptr [ebp+8]
 000828B4    mov         eax,dword ptr [eax-8]
 000828B7    mov         bx,0FFCF
 000828BB    call        @CallDynaInst
 000828C0    test        al,al
>000828C2    jne         000828C9
 000828C4    mov         ebx,dword ptr [ebp-8]
>000828C7    jmp         000828E2
 000828C9    mov         eax,dword ptr [ebp+8]
 000828CC    push        eax
 000828CD    call        Max
 000828D2    pop         ecx
 000828D3    mov         ebx,eax
 000828D5    sub         ebx,dword ptr [ebp-8]
>000828D8    jmp         000828E2
 000828DA    xor         ebx,ebx
>000828DC    jmp         000828E2
 000828DE    mov         ebx,edi
 000828E0    sub         ebx,esi
 000828E2    test        ebx,ebx
>000828E4    jge         000828EA
 000828E6    xor         ebx,ebx
>000828E8    jmp         000828F4
 000828EA    mov         eax,edi
 000828EC    sub         eax,esi
 000828EE    cmp         ebx,eax
>000828F0    jl          000828F4
 000828F2    mov         ebx,eax
 000828F4    mov         eax,dword ptr [ebp+8]
 000828F7    mov         eax,dword ptr [eax-8]
 000828FA    mov         eax,dword ptr [eax+268]
 00082900    cmp         ebx,eax
>00082902    je          00082969
 00082904    mov         edx,dword ptr [ebp+8]
 00082907    mov         edx,dword ptr [ebp+8]
 0008290A    mov         edx,dword ptr [edx-8]
 0008290D    mov         dword ptr [edx+268],ebx
 00082913    mov         edx,eax
 00082915    sub         edx,ebx
 00082917    mov         eax,dword ptr [ebp+8]
 0008291A    mov         eax,dword ptr [eax-8]
 0008291D    xor         ecx,ecx
 0008291F    call        TCustomGrid.ScrollData
 00082924    lea         eax,[ebp-18]
 00082927    xor         ecx,ecx
 00082929    mov         edx,10
 0008292E    call        @FillChar
 00082933    mov         eax,dword ptr [ebp+8]
 00082936    mov         eax,dword ptr [eax-8]
 00082939    mov         eax,dword ptr [eax+21C]
 0008293F    mov         dword ptr [ebp-0C],eax
 00082942    mov         eax,dword ptr [ebp+8]
 00082945    mov         eax,dword ptr [eax-8]
 00082948    lea         edx,[ebp-18]
 0008294B    call        TCustomGrid.InvalidateRect
 00082950    mov         eax,dword ptr [ebp+8]
 00082953    mov         eax,dword ptr [eax-8]
 00082956    mov         edx,dword ptr [eax]
 00082958    call        dword ptr [edx+84]
 0008295E    mov         eax,dword ptr [ebp+8]
 00082961    mov         eax,dword ptr [eax-8]
 00082964    call        TCustomGrid.UpdateScrollPos
 00082969    pop         edi
 0008296A    pop         esi
 0008296B    pop         ebx
 0008296C    mov         esp,ebp
 0008296E    pop         ebp
 0008296F    ret
*}
end;

//0008297C
procedure TCustomGrid.ModifyScrollBar(ScrollBar:Cardinal; ScrollCode:Cardinal; Pos:Cardinal; UseRightToLeft:Boolean);
begin
{*
 0008297C    push        ebp
 0008297D    mov         ebp,esp
 0008297F    add         esp,0FFFFFF80
 00082982    push        ebx
 00082983    push        esi
 00082984    push        edi
 00082985    mov         dword ptr [ebp-6C],ecx
 00082988    mov         dword ptr [ebp-4],edx
 0008298B    mov         dword ptr [ebp-8],eax
 0008298E    lea         edi,[ebp-78]
 00082991    mov         eax,dword ptr [ebp-8]
 00082994    mov         bx,0FFCF
 00082998    call        @CallDynaInst
 0008299D    test        al,al
>0008299F    je          000829A7
 000829A1    cmp         byte ptr [ebp+8],0
>000829A5    jne         000829B0
 000829A7    mov         dword ptr [ebp-70],1
>000829AE    jmp         000829B7
 000829B0    mov         dword ptr [ebp-70],0FFFFFFFF
 000829B7    mov         eax,dword ptr [ebp-8]
 000829BA    cmp         byte ptr [eax+47],0
>000829BE    je          000829EC
 000829C0    mov         eax,dword ptr [ebp-8]
 000829C3    call        TWinControl.CanFocus
 000829C8    test        al,al
>000829CA    je          000829EC
 000829CC    mov         eax,dword ptr [ebp-8]
 000829CF    cmp         byte ptr [eax+178],0
>000829D6    je          000829EC
 000829D8    mov         eax,dword ptr [ebp-8]
 000829DB    test        byte ptr [eax+20],10
>000829DF    jne         000829EC
 000829E1    mov         eax,dword ptr [ebp-8]
 000829E4    mov         edx,dword ptr [eax]
 000829E6    call        dword ptr [edx+0B4]
 000829EC    lea         edx,[ebp-68]
 000829EF    mov         eax,dword ptr [ebp-8]
 000829F2    call        TCustomGrid.CalcDrawInfo
 000829F7    cmp         dword ptr [ebp-4],0
>000829FB    jne         00082A1B
 000829FD    mov         eax,dword ptr [ebp-8]
 00082A00    cmp         dword ptr [eax+1FC],1
>00082A07    jne         00082A1B
 00082A09    push        ebp
 00082A0A    mov         edx,dword ptr [ebp+0C]
 00082A0D    mov         eax,dword ptr [ebp-6C]
 00082A10    call        ModifyPixelScrollBar
 00082A15    pop         ecx
>00082A16    jmp         00082B48
 00082A1B    mov         eax,dword ptr [ebp-8]
 00082A1E    mov         eax,dword ptr [eax+1FC]
 00082A24    dec         eax
 00082A25    mov         dword ptr [ebp-10],eax
 00082A28    mov         eax,dword ptr [ebp-8]
 00082A2B    mov         eax,dword ptr [eax+22C]
 00082A31    dec         eax
 00082A32    mov         dword ptr [ebp-0C],eax
 00082A35    lea         eax,[ebp-80]
 00082A38    push        eax
 00082A39    lea         ecx,[ebp-68]
 00082A3C    lea         edx,[ebp-10]
 00082A3F    mov         eax,dword ptr [ebp-8]
 00082A42    call        TCustomGrid.CalcMaxTopLeft
 00082A47    mov         eax,dword ptr [ebp-80]
 00082A4A    mov         dword ptr [ebp-10],eax
 00082A4D    mov         eax,dword ptr [ebp-7C]
 00082A50    mov         dword ptr [ebp-0C],eax
 00082A53    mov         eax,dword ptr [ebp-8]
 00082A56    mov         edx,dword ptr [eax+238]
 00082A5C    mov         dword ptr [edi],edx
 00082A5E    mov         edx,dword ptr [eax+23C]
 00082A64    mov         dword ptr [edi+4],edx
 00082A67    cmp         dword ptr [ebp-4],0
>00082A6B    jne         00082AA7
 00082A6D    mov         esi,dword ptr [edi]
 00082A6F    mov         ebx,esi
 00082A71    push        ebp
 00082A72    mov         edx,dword ptr [ebp-70]
 00082A75    mov         eax,esi
 00082A77    call        CalcScrollBar
 00082A7C    pop         ecx
 00082A7D    mov         dword ptr [edi],eax
 00082A7F    mov         eax,dword ptr [ebp-8]
 00082A82    mov         eax,dword ptr [eax+218]
 00082A88    mov         esi,dword ptr [edi]
 00082A8A    cmp         eax,esi
>00082A8C    jge         00082AE4
 00082A8E    cmp         esi,dword ptr [ebp-10]
>00082A91    jge         00082AE4
 00082A93    mov         edx,esi
 00082A95    mov         eax,dword ptr [ebp-8]
 00082A98    call        TCustomGrid.GetColWidths
 00082A9D    test        eax,eax
>00082A9F    jg          00082AE4
 00082AA1    cmp         esi,ebx
>00082AA3    jne         00082A6D
>00082AA5    jmp         00082AE4
 00082AA7    mov         esi,dword ptr [edi+4]
 00082AAA    mov         ebx,esi
 00082AAC    push        ebp
 00082AAD    mov         edx,1
 00082AB2    mov         eax,esi
 00082AB4    call        CalcScrollBar
 00082AB9    pop         ecx
 00082ABA    mov         dword ptr [edi+4],eax
 00082ABD    mov         eax,dword ptr [ebp-8]
 00082AC0    mov         eax,dword ptr [eax+21C]
 00082AC6    mov         esi,dword ptr [edi+4]
 00082AC9    cmp         eax,esi
>00082ACB    jge         00082AE4
 00082ACD    cmp         esi,dword ptr [ebp-0C]
>00082AD0    jge         00082AE4
 00082AD2    mov         edx,esi
 00082AD4    mov         eax,dword ptr [ebp-8]
 00082AD7    call        TCustomGrid.GetRowHeights
 00082ADC    test        eax,eax
>00082ADE    jg          00082AE4
 00082AE0    cmp         esi,ebx
>00082AE2    jne         00082AA7
 00082AE4    mov         edx,dword ptr [edi]
 00082AE6    mov         eax,dword ptr [ebp-10]
 00082AE9    call        Min
 00082AEE    mov         edx,eax
 00082AF0    mov         eax,dword ptr [ebp-8]
 00082AF3    mov         eax,dword ptr [eax+218]
 00082AF9    call        Max
 00082AFE    mov         dword ptr [edi],eax
 00082B00    mov         edx,dword ptr [edi+4]
 00082B03    mov         eax,dword ptr [ebp-0C]
 00082B06    call        Min
 00082B0B    mov         edx,eax
 00082B0D    mov         eax,dword ptr [ebp-8]
 00082B10    mov         eax,dword ptr [eax+21C]
 00082B16    call        Max
 00082B1B    mov         dword ptr [edi+4],eax
 00082B1E    mov         edx,dword ptr [ebp-8]
 00082B21    mov         edx,dword ptr [edx+238]
 00082B27    mov         eax,dword ptr [edi]
 00082B29    cmp         edx,eax
>00082B2B    jne         00082B3B
 00082B2D    mov         edx,dword ptr [ebp-8]
 00082B30    mov         edx,dword ptr [edx+23C]
 00082B36    cmp         edx,dword ptr [edi+4]
>00082B39    je          00082B48
 00082B3B    mov         ecx,dword ptr [edi+4]
 00082B3E    mov         edx,eax
 00082B40    mov         eax,dword ptr [ebp-8]
 00082B43    call        TCustomGrid.MoveTopLeft
 00082B48    pop         edi
 00082B49    pop         esi
 00082B4A    pop         ebx
 00082B4B    mov         esp,ebp
 00082B4D    pop         ebp
 00082B4E    ret         8
*}
end;

//00082B54
procedure TCustomGrid.MoveAdjust(var CellPos:Longint; FromIndex:Longint; ToIndex:Longint);
begin
{*
 00082B54    push        ebp
 00082B55    mov         ebp,esp
 00082B57    push        esi
 00082B58    push        edi
 00082B59    mov         eax,dword ptr [ebp+8]
 00082B5C    cmp         ecx,dword ptr [edx]
>00082B5E    jne         00082B64
 00082B60    mov         dword ptr [edx],eax
>00082B62    jmp         00082B82
 00082B64    mov         esi,ecx
 00082B66    mov         edi,eax
 00082B68    cmp         eax,ecx
>00082B6A    jge         00082B70
 00082B6C    mov         esi,eax
 00082B6E    mov         edi,ecx
 00082B70    cmp         esi,dword ptr [edx]
>00082B72    jg          00082B82
 00082B74    cmp         edi,dword ptr [edx]
>00082B76    jl          00082B82
 00082B78    cmp         eax,ecx
>00082B7A    jge         00082B80
 00082B7C    inc         dword ptr [edx]
>00082B7E    jmp         00082B82
 00082B80    dec         dword ptr [edx]
 00082B82    pop         edi
 00082B83    pop         esi
 00082B84    pop         ebp
 00082B85    ret         4
*}
end;

//00082B88
procedure TCustomGrid.MoveAnchor(const NewAnchor:TGridCoord);
begin
{*
 00082B88    push        ebx
 00082B89    push        esi
 00082B8A    add         esp,0FFFFFFF0
 00082B8D    mov         esi,edx
 00082B8F    mov         ebx,eax
 00082B91    mov         ax,word ptr [ebx+228]
 00082B98    and         ax,word ptr ds:[82C08]
 00082B9F    mov         dx,word ptr ds:[82C0C]
 00082BA6    cmp         dx,ax
>00082BA9    jne         00082BEF
 00082BAB    mov         edx,esp
 00082BAD    mov         eax,ebx
 00082BAF    call        TCustomGrid.GetSelection
 00082BB4    mov         eax,dword ptr [esi]
 00082BB6    mov         dword ptr [ebx+1F0],eax
 00082BBC    mov         eax,dword ptr [esi+4]
 00082BBF    mov         dword ptr [ebx+1F4],eax
 00082BC5    test        byte ptr [ebx+229],10
>00082BCC    je          00082BDB
 00082BCE    mov         eax,dword ptr [ebx+1FC]
 00082BD4    dec         eax
 00082BD5    mov         dword ptr [ebx+1F0],eax
 00082BDB    mov         edx,esi
 00082BDD    mov         eax,ebx
 00082BDF    call        TCustomGrid.ClampInView
 00082BE4    mov         edx,esp
 00082BE6    mov         eax,ebx
 00082BE8    call        TCustomGrid.SelectionMoved
>00082BED    jmp         00082BFF
 00082BEF    push        1
 00082BF1    push        1
 00082BF3    mov         ecx,dword ptr [esi+4]
 00082BF6    mov         edx,dword ptr [esi]
 00082BF8    mov         eax,ebx
 00082BFA    call        TCustomGrid.MoveCurrent
 00082BFF    add         esp,10
 00082C02    pop         esi
 00082C03    pop         ebx
 00082C04    ret
*}
end;

//00082C10
procedure TCustomGrid.MoveCurrent(ACol:Longint; ARow:Longint; MoveAnchor:Boolean; Show:Boolean);
begin
{*
 00082C10    push        ebp
 00082C11    mov         ebp,esp
 00082C13    add         esp,0FFFFFFE0
 00082C16    push        ebx
 00082C17    push        esi
 00082C18    push        edi
 00082C19    xor         ebx,ebx
 00082C1B    mov         dword ptr [ebp-20],ebx
 00082C1E    mov         dword ptr [ebp-4],ecx
 00082C21    mov         esi,edx
 00082C23    mov         ebx,eax
 00082C25    xor         eax,eax
 00082C27    push        ebp
 00082C28    push        82D55
 00082C2D    push        dword ptr fs:[eax]
 00082C30    mov         dword ptr fs:[eax],esp
 00082C33    test        esi,esi
>00082C35    jl          00082C50
 00082C37    cmp         dword ptr [ebp-4],0
>00082C3B    jl          00082C50
 00082C3D    cmp         esi,dword ptr [ebx+1FC]
>00082C43    jge         00082C50
 00082C45    mov         eax,dword ptr [ebp-4]
 00082C48    cmp         eax,dword ptr [ebx+22C]
>00082C4E    jl          00082C65
 00082C50    lea         edx,[ebp-20]
 00082C53    mov         eax,[000B5A2C];^SIndexOutOfRange:TResStringRec
 00082C58    call        LoadResString
 00082C5D    mov         eax,dword ptr [ebp-20]
 00082C60    call        InvalidOp
 00082C65    mov         ecx,dword ptr [ebp-4]
 00082C68    mov         edx,esi
 00082C6A    mov         eax,ebx
 00082C6C    mov         edi,dword ptr [eax]
 00082C6E    call        dword ptr [edi+0CC]
 00082C74    test        al,al
>00082C76    je          00082D3F
 00082C7C    lea         edx,[ebp-1C]
 00082C7F    mov         eax,ebx
 00082C81    call        TCustomGrid.GetSelection
 00082C86    mov         eax,dword ptr [ebx+208]
 00082C8C    mov         dword ptr [ebp-0C],eax
 00082C8F    mov         eax,dword ptr [ebx+20C]
 00082C95    mov         dword ptr [ebp-8],eax
 00082C98    mov         dword ptr [ebx+208],esi
 00082C9E    mov         eax,dword ptr [ebp-4]
 00082CA1    mov         dword ptr [ebx+20C],eax
 00082CA7    test        byte ptr [ebx+229],20
>00082CAE    jne         00082CB7
 00082CB0    mov         eax,ebx
 00082CB2    call        TCustomGrid.HideEditor
 00082CB7    cmp         byte ptr [ebp+0C],0
>00082CBB    jne         00082CC6
 00082CBD    test        byte ptr [ebx+228],10
>00082CC4    jne         00082CF4
 00082CC6    mov         eax,dword ptr [ebx+208]
 00082CCC    mov         dword ptr [ebx+1F0],eax
 00082CD2    mov         eax,dword ptr [ebx+20C]
 00082CD8    mov         dword ptr [ebx+1F4],eax
 00082CDE    test        byte ptr [ebx+229],10
>00082CE5    je          00082CF4
 00082CE7    mov         eax,dword ptr [ebx+1FC]
 00082CED    dec         eax
 00082CEE    mov         dword ptr [ebx+1F0],eax
 00082CF4    test        byte ptr [ebx+229],10
>00082CFB    je          00082D09
 00082CFD    mov         eax,dword ptr [ebx+218]
 00082D03    mov         dword ptr [ebx+208],eax
 00082D09    cmp         byte ptr [ebp+8],0
>00082D0D    je          00082D1C
 00082D0F    lea         edx,[ebx+208]
 00082D15    mov         eax,ebx
 00082D17    call        TCustomGrid.ClampInView
 00082D1C    lea         edx,[ebp-1C]
 00082D1F    mov         eax,ebx
 00082D21    call        TCustomGrid.SelectionMoved
 00082D26    mov         ecx,dword ptr [ebp-8]
 00082D29    mov         edx,dword ptr [ebp-0C]
 00082D2C    mov         eax,ebx
 00082D2E    call        TCustomGrid.InvalidateCell
 00082D33    mov         ecx,dword ptr [ebp-4]
 00082D36    mov         edx,esi
 00082D38    mov         eax,ebx
 00082D3A    call        TCustomGrid.InvalidateCell
 00082D3F    xor         eax,eax
 00082D41    pop         edx
 00082D42    pop         ecx
 00082D43    pop         ecx
 00082D44    mov         dword ptr fs:[eax],edx
 00082D47    push        82D5C
 00082D4C    lea         eax,[ebp-20]
 00082D4F    call        @LStrClr
 00082D54    ret
>00082D55    jmp         @HandleFinally
>00082D5A    jmp         00082D4C
 00082D5C    pop         edi
 00082D5D    pop         esi
 00082D5E    pop         ebx
 00082D5F    mov         esp,ebp
 00082D61    pop         ebp
 00082D62    ret         8
*}
end;

//00082D68
procedure TCustomGrid.MoveTopLeft(ALeft:Longint; ATop:Longint);
begin
{*
 00082D68    push        ebx
 00082D69    push        esi
 00082D6A    push        edi
 00082D6B    add         esp,0FFFFFFF8
 00082D6E    mov         edi,ecx
 00082D70    mov         esi,edx
 00082D72    mov         ebx,eax
 00082D74    cmp         esi,dword ptr [ebx+238]
>00082D7A    jne         00082D84
 00082D7C    cmp         edi,dword ptr [ebx+23C]
>00082D82    je          00082DB6
 00082D84    mov         eax,ebx
 00082D86    mov         edx,dword ptr [eax]
 00082D88    call        dword ptr [edx+84]
 00082D8E    mov         eax,dword ptr [ebx+238]
 00082D94    mov         dword ptr [esp],eax
 00082D97    mov         eax,dword ptr [ebx+23C]
 00082D9D    mov         dword ptr [esp+4],eax
 00082DA1    mov         dword ptr [ebx+238],esi
 00082DA7    mov         dword ptr [ebx+23C],edi
 00082DAD    mov         edx,esp
 00082DAF    mov         eax,ebx
 00082DB1    call        TCustomGrid.TopLeftMoved
 00082DB6    pop         ecx
 00082DB7    pop         edx
 00082DB8    pop         edi
 00082DB9    pop         esi
 00082DBA    pop         ebx
 00082DBB    ret
*}
end;

//00082DBC
procedure TCustomGrid.ResizeCol(Index:Longint; OldSize:Integer; NewSize:Integer);
begin
{*
 00082DBC    push        ebp
 00082DBD    mov         ebp,esp
 00082DBF    call        TCustomGrid.InvalidateGrid
 00082DC4    pop         ebp
 00082DC5    ret         4
*}
end;

//00082DC8
procedure TCustomGrid.ResizeRow(Index:Longint; OldSize:Integer; NewSize:Integer);
begin
{*
 00082DC8    push        ebp
 00082DC9    mov         ebp,esp
 00082DCB    call        TCustomGrid.InvalidateGrid
 00082DD0    pop         ebp
 00082DD1    ret         4
*}
end;

//00082DD4
procedure TCustomGrid.SelectionMoved(const OldSel:TGridRect);
begin
{*
 00082DD4    push        ebx
 00082DD5    push        esi
 00082DD6    push        edi
 00082DD7    add         esp,0FFFFFF90
 00082DDA    mov         ebx,edx
 00082DDC    mov         edi,eax
 00082DDE    mov         eax,edi
 00082DE0    call        TWinControl.HandleAllocated
 00082DE5    test        al,al
>00082DE7    je          00082E42
 00082DE9    push        1
 00082DEB    lea         ecx,[esp+4]
 00082DEF    mov         edx,ebx
 00082DF1    mov         eax,edi
 00082DF3    call        TCustomGrid.GridRectToScreenRect
 00082DF8    push        1
 00082DFA    lea         edx,[esp+64]
 00082DFE    mov         eax,edi
 00082E00    call        TCustomGrid.GetSelection
 00082E05    lea         edx,[esp+64]
 00082E09    lea         ecx,[esp+14]
 00082E0D    mov         eax,edi
 00082E0F    call        TCustomGrid.GridRectToScreenRect
 00082E14    lea         ecx,[esp+20]
 00082E18    lea         edx,[esp+10]
 00082E1C    mov         eax,esp
 00082E1E    call        XorRects
 00082E23    mov         esi,4
 00082E28    lea         ebx,[esp+20]
 00082E2C    push        0
 00082E2E    push        ebx
 00082E2F    mov         eax,edi
 00082E31    call        TWinControl.GetHandle
 00082E36    push        eax
 00082E37    call        user32.InvalidateRect
 00082E3C    add         ebx,10
 00082E3F    dec         esi
>00082E40    jne         00082E2C
 00082E42    add         esp,70
 00082E45    pop         edi
 00082E46    pop         esi
 00082E47    pop         ebx
 00082E48    ret
*}
end;

//00082E4C
procedure TCustomGrid.ScrollDataInfo(DX:Integer; DY:Integer; var DrawInfo:TGridDrawInfo);
begin
{*
 00082E4C    push        ebp
 00082E4D    mov         ebp,esp
 00082E4F    add         esp,0FFFFFFD8
 00082E52    push        ebx
 00082E53    push        esi
 00082E54    push        edi
 00082E55    mov         ebx,ecx
 00082E57    mov         dword ptr [ebp-4],edx
 00082E5A    mov         esi,eax
 00082E5C    mov         edi,dword ptr [ebp+8]
 00082E5F    mov         dword ptr [ebp-8],2
 00082E66    cmp         byte ptr [esi+26C],0
>00082E6D    jne         00082E73
 00082E6F    or          dword ptr [ebp-8],4
 00082E73    test        ebx,ebx
>00082E75    jne         00082EED
 00082E77    mov         eax,esi
 00082E79    mov         bx,0FFCF
 00082E7D    call        @CallDynaInst
 00082E82    test        al,al
>00082E84    jne         00082E9D
 00082E86    mov         eax,dword ptr [edi+38]
 00082E89    push        eax
 00082E8A    lea         eax,[ebp-18]
 00082E8D    push        eax
 00082E8E    mov         ecx,dword ptr [edi+0C]
 00082E91    mov         eax,dword ptr [edi+4]
 00082E94    xor         edx,edx
 00082E96    call        Rect
>00082E9B    jmp         00082EC5
 00082E9D    mov         eax,dword ptr [edi+38]
 00082EA0    push        eax
 00082EA1    lea         eax,[ebp-18]
 00082EA4    push        eax
 00082EA5    mov         eax,esi
 00082EA7    call        TControl.GetClientWidth
 00082EAC    sub         eax,dword ptr [edi+4]
 00082EAF    push        eax
 00082EB0    mov         eax,esi
 00082EB2    call        TControl.GetClientWidth
 00082EB7    sub         eax,dword ptr [edi+0C]
 00082EBA    xor         edx,edx
 00082EBC    pop         ecx
 00082EBD    call        Rect
 00082EC2    neg         dword ptr [ebp-4]
 00082EC5    mov         eax,dword ptr [ebp-8]
 00082EC8    push        eax
 00082EC9    push        0
 00082ECB    push        0
 00082ECD    lea         eax,[ebp-18]
 00082ED0    push        eax
 00082ED1    lea         eax,[ebp-18]
 00082ED4    push        eax
 00082ED5    push        0
 00082ED7    mov         eax,dword ptr [ebp-4]
 00082EDA    push        eax
 00082EDB    mov         eax,esi
 00082EDD    call        TWinControl.GetHandle
 00082EE2    push        eax
 00082EE3    call        user32.ScrollWindowEx
>00082EE8    jmp         00082FD2
 00082EED    cmp         dword ptr [ebp-4],0
>00082EF1    jne         00082F2D
 00082EF3    mov         eax,dword ptr [edi+38]
 00082EF6    push        eax
 00082EF7    lea         eax,[ebp-18]
 00082EFA    push        eax
 00082EFB    mov         ecx,dword ptr [edi+0C]
 00082EFE    mov         edx,dword ptr [edi+30]
 00082F01    xor         eax,eax
 00082F03    call        Rect
 00082F08    mov         eax,dword ptr [ebp-8]
 00082F0B    push        eax
 00082F0C    push        0
 00082F0E    push        0
 00082F10    lea         eax,[ebp-18]
 00082F13    push        eax
 00082F14    lea         eax,[ebp-18]
 00082F17    push        eax
 00082F18    push        ebx
 00082F19    push        0
 00082F1B    mov         eax,esi
 00082F1D    call        TWinControl.GetHandle
 00082F22    push        eax
 00082F23    call        user32.ScrollWindowEx
>00082F28    jmp         00082FD2
 00082F2D    mov         eax,dword ptr [edi+30]
 00082F30    push        eax
 00082F31    lea         eax,[ebp-18]
 00082F34    push        eax
 00082F35    mov         ecx,dword ptr [edi+0C]
 00082F38    mov         eax,dword ptr [edi+4]
 00082F3B    xor         edx,edx
 00082F3D    call        Rect
 00082F42    mov         eax,dword ptr [ebp-8]
 00082F45    push        eax
 00082F46    push        0
 00082F48    push        0
 00082F4A    lea         eax,[ebp-18]
 00082F4D    push        eax
 00082F4E    lea         eax,[ebp-18]
 00082F51    push        eax
 00082F52    push        0
 00082F54    mov         eax,dword ptr [ebp-4]
 00082F57    push        eax
 00082F58    mov         eax,esi
 00082F5A    call        TWinControl.GetHandle
 00082F5F    push        eax
 00082F60    call        user32.ScrollWindowEx
 00082F65    mov         eax,dword ptr [edi+38]
 00082F68    push        eax
 00082F69    lea         eax,[ebp-18]
 00082F6C    push        eax
 00082F6D    mov         ecx,dword ptr [edi+4]
 00082F70    mov         edx,dword ptr [edi+30]
 00082F73    xor         eax,eax
 00082F75    call        Rect
 00082F7A    mov         eax,dword ptr [ebp-8]
 00082F7D    push        eax
 00082F7E    push        0
 00082F80    push        0
 00082F82    lea         eax,[ebp-18]
 00082F85    push        eax
 00082F86    lea         eax,[ebp-18]
 00082F89    push        eax
 00082F8A    push        ebx
 00082F8B    push        0
 00082F8D    mov         eax,esi
 00082F8F    call        TWinControl.GetHandle
 00082F94    push        eax
 00082F95    call        user32.ScrollWindowEx
 00082F9A    mov         eax,dword ptr [edi+38]
 00082F9D    push        eax
 00082F9E    lea         eax,[ebp-18]
 00082FA1    push        eax
 00082FA2    mov         ecx,dword ptr [edi+0C]
 00082FA5    mov         edx,dword ptr [edi+30]
 00082FA8    mov         eax,dword ptr [edi+4]
 00082FAB    call        Rect
 00082FB0    mov         eax,dword ptr [ebp-8]
 00082FB3    push        eax
 00082FB4    push        0
 00082FB6    push        0
 00082FB8    lea         eax,[ebp-18]
 00082FBB    push        eax
 00082FBC    lea         eax,[ebp-18]
 00082FBF    push        eax
 00082FC0    push        ebx
 00082FC1    mov         eax,dword ptr [ebp-4]
 00082FC4    push        eax
 00082FC5    mov         eax,esi
 00082FC7    call        TWinControl.GetHandle
 00082FCC    push        eax
 00082FCD    call        user32.ScrollWindowEx
 00082FD2    test        byte ptr [esi+229],10
>00082FD9    je          00082FEF
 00082FDB    lea         edx,[ebp-28]
 00082FDE    mov         eax,esi
 00082FE0    call        TCustomGrid.GetSelection
 00082FE5    lea         edx,[ebp-28]
 00082FE8    mov         eax,esi
 00082FEA    call        TCustomGrid.InvalidateRect
 00082FEF    pop         edi
 00082FF0    pop         esi
 00082FF1    pop         ebx
 00082FF2    mov         esp,ebp
 00082FF4    pop         ebp
 00082FF5    ret         4
*}
end;

//00082FF8
procedure TCustomGrid.ScrollData(DX:Integer; DY:Integer);
begin
{*
 00082FF8    push        ebx
 00082FF9    push        esi
 00082FFA    push        edi
 00082FFB    add         esp,0FFFFFFA8
 00082FFE    mov         edi,ecx
 00083000    mov         esi,edx
 00083002    mov         ebx,eax
 00083004    mov         edx,esp
 00083006    mov         eax,ebx
 00083008    call        TCustomGrid.CalcDrawInfo
 0008300D    push        esp
 0008300E    mov         ecx,edi
 00083010    mov         edx,esi
 00083012    mov         eax,ebx
 00083014    call        TCustomGrid.ScrollDataInfo
 00083019    add         esp,58
 0008301C    pop         edi
 0008301D    pop         esi
 0008301E    pop         ebx
 0008301F    ret
*}
end;

//00083020
function CalcScroll(const AxisInfo:TGridAxisDrawInfo; OldPos:Integer; CurrentPos:Integer; var Amount:Longint):Boolean;
begin
{*
 00083020    push        ebp
 00083021    mov         ebp,esp
 00083023    add         esp,0FFFFFFF0
 00083026    push        ebx
 00083027    push        esi
 00083028    push        edi
 00083029    mov         dword ptr [ebp-8],ecx
 0008302C    mov         dword ptr [ebp-4],edx
 0008302F    mov         ebx,eax
 00083031    mov         esi,dword ptr [ebp+8]
 00083034    mov         byte ptr [ebp-9],0
 00083038    mov         eax,dword ptr [ebp-4]
 0008303B    cmp         eax,dword ptr [ebp-8]
>0008303E    jge         00083048
 00083040    mov         eax,dword ptr [ebp-4]
 00083043    mov         edx,dword ptr [ebp-8]
>00083046    jmp         0008304E
 00083048    mov         eax,dword ptr [ebp-8]
 0008304B    mov         edx,dword ptr [ebp-4]
 0008304E    xor         ecx,ecx
 00083050    mov         dword ptr [esi],ecx
 00083052    mov         edi,edx
 00083054    dec         edi
 00083055    sub         edi,eax
>00083057    jl          00083087
 00083059    inc         edi
 0008305A    mov         dword ptr [ebp-10],eax
 0008305D    mov         edx,dword ptr [ebp-10]
 00083060    mov         eax,dword ptr [ebx+28]
 00083063    call        dword ptr [ebx+24]
 00083066    add         eax,dword ptr [ebx]
 00083068    add         dword ptr [esi],eax
 0008306A    mov         eax,dword ptr [ebx+8]
 0008306D    sub         eax,dword ptr [ebx+4]
 00083070    cmp         eax,dword ptr [esi]
>00083072    jge         00083081
 00083074    mov         eax,dword ptr [ebp+0C]
 00083077    mov         eax,dword ptr [eax-4]
 0008307A    call        TCustomGrid.InvalidateGrid
>0008307F    jmp         00083095
 00083081    inc         dword ptr [ebp-10]
 00083084    dec         edi
>00083085    jne         0008305D
 00083087    mov         eax,dword ptr [ebp-4]
 0008308A    cmp         eax,dword ptr [ebp-8]
>0008308D    jge         00083091
 0008308F    neg         dword ptr [esi]
 00083091    mov         byte ptr [ebp-9],1
 00083095    mov         al,byte ptr [ebp-9]
 00083098    pop         edi
 00083099    pop         esi
 0008309A    pop         ebx
 0008309B    mov         esp,ebp
 0008309D    pop         ebp
 0008309E    ret         4
*}
end;

//000830A4
procedure TCustomGrid.TopLeftMoved(const OldTopLeft:TGridCoord);
begin
{*
 000830A4    push        ebp
 000830A5    mov         ebp,esp
 000830A7    add         esp,0FFFFFF9C
 000830AA    push        ebx
 000830AB    mov         ebx,edx
 000830AD    mov         dword ptr [ebp-4],eax
 000830B0    mov         eax,dword ptr [ebp-4]
 000830B3    call        TCustomGrid.UpdateScrollPos
 000830B8    lea         edx,[ebp-64]
 000830BB    mov         eax,dword ptr [ebp-4]
 000830BE    call        TCustomGrid.CalcDrawInfo
 000830C3    push        ebp
 000830C4    lea         eax,[ebp-0C]
 000830C7    push        eax
 000830C8    mov         eax,dword ptr [ebp-4]
 000830CB    mov         ecx,dword ptr [eax+238]
 000830D1    mov         edx,dword ptr [ebx]
 000830D3    lea         eax,[ebp-64]
 000830D6    call        CalcScroll
 000830DB    pop         ecx
 000830DC    test        al,al
>000830DE    je          00083110
 000830E0    push        ebp
 000830E1    lea         eax,[ebp-8]
 000830E4    push        eax
 000830E5    mov         eax,dword ptr [ebp-4]
 000830E8    mov         ecx,dword ptr [eax+23C]
 000830EE    mov         edx,dword ptr [ebx+4]
 000830F1    lea         eax,[ebp-38]
 000830F4    call        CalcScroll
 000830F9    pop         ecx
 000830FA    test        al,al
>000830FC    je          00083110
 000830FE    lea         eax,[ebp-64]
 00083101    push        eax
 00083102    mov         ecx,dword ptr [ebp-8]
 00083105    mov         edx,dword ptr [ebp-0C]
 00083108    mov         eax,dword ptr [ebp-4]
 0008310B    call        TCustomGrid.ScrollDataInfo
 00083110    mov         eax,dword ptr [ebp-4]
 00083113    mov         bx,0FFAD
 00083117    call        @CallDynaInst
 0008311C    pop         ebx
 0008311D    mov         esp,ebp
 0008311F    pop         ebp
 00083120    ret
*}
end;

//00083124
procedure SetScroll(Code:Word; Value:Integer);
begin
{*
 00083124    push        ebp
 00083125    mov         ebp,esp
 00083127    push        ebx
 00083128    push        esi
 00083129    push        edi
 0008312A    mov         esi,edx
 0008312C    mov         edi,eax
 0008312E    mov         eax,dword ptr [ebp+8]
 00083131    mov         eax,dword ptr [eax-4]
 00083134    mov         bx,0FFCF
 00083138    call        @CallDynaInst
 0008313D    test        al,al
>0008313F    je          00083170
 00083141    test        di,di
>00083144    jne         00083170
 00083146    mov         eax,dword ptr [ebp+8]
 00083149    mov         eax,dword ptr [eax-4]
 0008314C    cmp         dword ptr [eax+1FC],1
>00083153    je          00083160
 00083155    mov         eax,7F
 0008315A    sub         eax,esi
 0008315C    mov         esi,eax
>0008315E    jmp         00083170
 00083160    mov         eax,dword ptr [ebp+8]
 00083163    mov         eax,dword ptr [eax-8]
 00083166    mov         edx,dword ptr [ebp+8]
 00083169    sub         eax,dword ptr [edx-0C]
 0008316C    sub         eax,esi
 0008316E    mov         esi,eax
 00083170    movzx       ebx,di
 00083173    push        ebx
 00083174    mov         eax,dword ptr [ebp+8]
 00083177    mov         eax,dword ptr [eax-4]
 0008317A    call        TWinControl.GetHandle
 0008317F    push        eax
 00083180    call        user32.GetScrollPos
 00083185    cmp         esi,eax
>00083187    je          0008319E
 00083189    push        0FF
 0008318B    push        esi
 0008318C    push        ebx
 0008318D    mov         eax,dword ptr [ebp+8]
 00083190    mov         eax,dword ptr [eax-4]
 00083193    call        TWinControl.GetHandle
 00083198    push        eax
 00083199    call        user32.SetScrollPos
 0008319E    pop         edi
 0008319F    pop         esi
 000831A0    pop         ebx
 000831A1    pop         ebp
 000831A2    ret
*}
end;

//000831A4
procedure TCustomGrid.UpdateScrollPos;
begin
{*
 000831A4    push        ebp
 000831A5    mov         ebp,esp
 000831A7    add         esp,0FFFFFF8C
 000831AA    push        ebx
 000831AB    push        esi
 000831AC    mov         dword ptr [ebp-4],eax
 000831AF    lea         esi,[ebp-4]
 000831B2    mov         eax,dword ptr [esi]
 000831B4    call        TWinControl.HandleAllocated
 000831B9    test        al,al
>000831BB    je          000832EA
 000831C1    mov         eax,dword ptr [esi]
 000831C3    cmp         byte ptr [eax+234],0
>000831CA    je          000832EA
 000831D0    lea         edx,[ebp-6C]
 000831D3    mov         eax,dword ptr [esi]
 000831D5    call        TCustomGrid.CalcDrawInfo
 000831DA    mov         eax,dword ptr [esi]
 000831DC    mov         eax,dword ptr [eax+1FC]
 000831E2    dec         eax
 000831E3    mov         dword ptr [ebp-14],eax
 000831E6    mov         eax,dword ptr [esi]
 000831E8    mov         eax,dword ptr [eax+22C]
 000831EE    dec         eax
 000831EF    mov         dword ptr [ebp-10],eax
 000831F2    lea         eax,[ebp-74]
 000831F5    push        eax
 000831F6    lea         ecx,[ebp-6C]
 000831F9    lea         edx,[ebp-14]
 000831FC    mov         eax,dword ptr [esi]
 000831FE    call        TCustomGrid.CalcMaxTopLeft
 00083203    mov         eax,dword ptr [ebp-74]
 00083206    mov         dword ptr [ebp-14],eax
 00083209    mov         eax,dword ptr [ebp-70]
 0008320C    mov         dword ptr [ebp-10],eax
 0008320F    mov         eax,dword ptr [esi]
 00083211    mov         al,byte ptr [eax+234]
 00083217    sub         al,1
>00083219    je          00083223
 0008321B    sub         al,2
>0008321D    jne         000832AF
 00083223    mov         eax,dword ptr [esi]
 00083225    cmp         dword ptr [eax+1FC],1
>0008322C    jne         00083284
 0008322E    mov         edx,dword ptr [ebp-50]
 00083231    mov         eax,dword ptr [esi]
 00083233    call        TCustomGrid.GetColWidths
 00083238    mov         dword ptr [ebp-8],eax
 0008323B    mov         eax,dword ptr [esi]
 0008323D    call        TControl.GetClientWidth
 00083242    sub         eax,dword ptr [ebp-68]
 00083245    mov         dword ptr [ebp-0C],eax
 00083248    mov         eax,dword ptr [esi]
 0008324A    mov         eax,dword ptr [eax+268]
 00083250    test        eax,eax
>00083252    jle         00083277
 00083254    mov         edx,dword ptr [ebp-8]
 00083257    sub         edx,eax
 00083259    cmp         edx,dword ptr [ebp-0C]
>0008325C    jge         00083277
 0008325E    mov         eax,dword ptr [ebp-8]
 00083261    sub         eax,dword ptr [ebp-0C]
 00083264    push        eax
 00083265    push        1
 00083267    mov         ecx,4
 0008326C    xor         edx,edx
 0008326E    mov         eax,dword ptr [esi]
 00083270    call        TCustomGrid.ModifyScrollBar
>00083275    jmp         000832AF
 00083277    push        ebp
 00083278    mov         edx,eax
 0008327A    xor         eax,eax
 0008327C    call        SetScroll
 00083281    pop         ecx
>00083282    jmp         000832AF
 00083284    push        ebp
 00083285    mov         eax,dword ptr [esi]
 00083287    mov         ebx,dword ptr [eax+218]
 0008328D    mov         eax,dword ptr [ebp-14]
 00083290    sub         eax,ebx
 00083292    push        eax
 00083293    push        7F
 00083295    mov         eax,dword ptr [esi]
 00083297    mov         eax,dword ptr [eax+238]
 0008329D    sub         eax,ebx
 0008329F    push        eax
 000832A0    call        kernel32.MulDiv
 000832A5    mov         edx,eax
 000832A7    xor         eax,eax
 000832A9    call        SetScroll
 000832AE    pop         ecx
 000832AF    mov         eax,dword ptr [esi]
 000832B1    mov         al,byte ptr [eax+234]
 000832B7    add         al,0FE
 000832B9    sub         al,2
>000832BB    jae         000832EA
 000832BD    push        ebp
 000832BE    mov         eax,dword ptr [esi]
 000832C0    mov         ebx,dword ptr [eax+21C]
 000832C6    mov         eax,dword ptr [ebp-10]
 000832C9    sub         eax,ebx
 000832CB    push        eax
 000832CC    push        7F
 000832CE    mov         eax,dword ptr [esi]
 000832D0    mov         eax,dword ptr [eax+23C]
 000832D6    sub         eax,ebx
 000832D8    push        eax
 000832D9    call        kernel32.MulDiv
 000832DE    mov         edx,eax
 000832E0    mov         ax,1
 000832E4    call        SetScroll
 000832E9    pop         ecx
 000832EA    pop         esi
 000832EB    pop         ebx
 000832EC    mov         esp,ebp
 000832EE    pop         ebp
 000832EF    ret
*}
end;

//000832F0
procedure DoUpdate;
begin
{*
 000832F0    push        ebp
 000832F1    mov         ebp,esp
 000832F3    mov         eax,dword ptr [ebp+8]
 000832F6    cmp         byte ptr [eax-1],0
>000832FA    jne         00083311
 000832FC    mov         eax,dword ptr [ebp+8]
 000832FF    mov         eax,dword ptr [eax-8]
 00083302    mov         edx,dword ptr [eax]
 00083304    call        dword ptr [edx+84]
 0008330A    mov         eax,dword ptr [ebp+8]
 0008330D    mov         byte ptr [eax-1],1
 00083311    pop         ebp
 00083312    ret
*}
end;

//00083314
function ScrollBarVisible(Code:Word):Boolean;
begin
{*
 00083314    push        ebp
 00083315    mov         ebp,esp
 00083317    add         esp,0FFFFFFF8
 0008331A    push        ebx
 0008331B    mov         ebx,eax
 0008331D    xor         eax,eax
 0008331F    mov         edx,dword ptr [ebp+8]
 00083322    mov         edx,dword ptr [edx-8]
 00083325    cmp         byte ptr [edx+234],3
>0008332C    je          00083357
 0008332E    test        bx,bx
>00083331    jne         00083342
 00083333    mov         edx,dword ptr [ebp+8]
 00083336    mov         edx,dword ptr [edx-8]
 00083339    cmp         byte ptr [edx+234],1
>00083340    je          00083357
 00083342    cmp         bx,1
>00083346    jne         0008337D
 00083348    mov         edx,dword ptr [ebp+8]
 0008334B    mov         edx,dword ptr [edx-8]
 0008334E    cmp         byte ptr [edx+234],2
>00083355    jne         0008337D
 00083357    lea         eax,[ebp-8]
 0008335A    push        eax
 0008335B    lea         eax,[ebp-4]
 0008335E    push        eax
 0008335F    movzx       eax,bx
 00083362    push        eax
 00083363    mov         eax,dword ptr [ebp+8]
 00083366    mov         eax,dword ptr [eax-8]
 00083369    call        TWinControl.GetHandle
 0008336E    push        eax
 0008336F    call        user32.GetScrollRange
 00083374    mov         eax,dword ptr [ebp-4]
 00083377    cmp         eax,dword ptr [ebp-8]
 0008337A    setne       al
 0008337D    pop         ebx
 0008337E    pop         ecx
 0008337F    pop         ecx
 00083380    pop         ebp
 00083381    ret
*}
end;

//00083384
procedure CalcSizeInfo;
begin
{*
 00083384    push        ebp
 00083385    mov         ebp,esp
 00083387    add         esp,0FFFFFFF8
 0008338A    mov         eax,dword ptr [ebp+8]
 0008338D    mov         eax,dword ptr [eax-28]
 00083390    push        eax
 00083391    mov         eax,dword ptr [ebp+8]
 00083394    mov         ecx,dword ptr [eax-54]
 00083397    mov         eax,dword ptr [ebp+8]
 0008339A    lea         edx,[eax-60]
 0008339D    mov         eax,dword ptr [ebp+8]
 000833A0    mov         eax,dword ptr [eax-8]
 000833A3    call        TCustomGrid.CalcDrawInfoXY
 000833A8    mov         eax,dword ptr [ebp+8]
 000833AB    mov         eax,dword ptr [eax-8]
 000833AE    mov         eax,dword ptr [eax+1FC]
 000833B4    dec         eax
 000833B5    mov         edx,dword ptr [ebp+8]
 000833B8    mov         dword ptr [edx-68],eax
 000833BB    mov         eax,dword ptr [ebp+8]
 000833BE    mov         eax,dword ptr [eax-8]
 000833C1    mov         eax,dword ptr [eax+22C]
 000833C7    dec         eax
 000833C8    mov         edx,dword ptr [ebp+8]
 000833CB    mov         dword ptr [edx-64],eax
 000833CE    lea         eax,[ebp-8]
 000833D1    push        eax
 000833D2    mov         eax,dword ptr [ebp+8]
 000833D5    lea         ecx,[eax-60]
 000833D8    mov         eax,dword ptr [ebp+8]
 000833DB    lea         edx,[eax-68]
 000833DE    mov         eax,dword ptr [ebp+8]
 000833E1    mov         eax,dword ptr [eax-8]
 000833E4    call        TCustomGrid.CalcMaxTopLeft
 000833E9    mov         eax,dword ptr [ebp+8]
 000833EC    mov         edx,dword ptr [ebp-8]
 000833EF    mov         dword ptr [eax-68],edx
 000833F2    mov         edx,dword ptr [ebp-4]
 000833F5    mov         dword ptr [eax-64],edx
 000833F8    pop         ecx
 000833F9    pop         ecx
 000833FA    pop         ebp
 000833FB    ret
*}
end;

//000833FC
procedure SetAxisRange(var Max:Longint; var Old:Longint; var Current:Longint; Code:Word; Fixeds:Integer);
begin
{*
 000833FC    push        ebp
 000833FD    mov         ebp,esp
 000833FF    push        ecx
 00083400    push        ebx
 00083401    push        esi
 00083402    push        edi
 00083403    mov         dword ptr [ebp-4],ecx
 00083406    mov         edi,edx
 00083408    mov         ebx,eax
 0008340A    mov         esi,dword ptr [ebp+0C]
 0008340D    mov         eax,dword ptr [ebp+10]
 00083410    push        eax
 00083411    call        CalcSizeInfo
 00083416    pop         ecx
 00083417    mov         eax,dword ptr [ebx]
 00083419    cmp         eax,dword ptr [ebp+8]
>0008341C    jle         0008343B
 0008341E    push        0FF
 00083420    push        7F
 00083422    push        0
 00083424    movzx       eax,si
 00083427    push        eax
 00083428    mov         eax,dword ptr [ebp+10]
 0008342B    mov         eax,dword ptr [eax-8]
 0008342E    call        TWinControl.GetHandle
 00083433    push        eax
 00083434    call        user32.SetScrollRange
>00083439    jmp         00083456
 0008343B    push        0FF
 0008343D    push        0
 0008343F    push        0
 00083441    movzx       eax,si
 00083444    push        eax
 00083445    mov         eax,dword ptr [ebp+10]
 00083448    mov         eax,dword ptr [eax-8]
 0008344B    call        TWinControl.GetHandle
 00083450    push        eax
 00083451    call        user32.SetScrollRange
 00083456    mov         eax,dword ptr [edi]
 00083458    cmp         eax,dword ptr [ebx]
>0008345A    jle         0008346D
 0008345C    mov         eax,dword ptr [ebp+10]
 0008345F    push        eax
 00083460    call        DoUpdate
 00083465    pop         ecx
 00083466    mov         eax,dword ptr [ebx]
 00083468    mov         edx,dword ptr [ebp-4]
 0008346B    mov         dword ptr [edx],eax
 0008346D    pop         edi
 0008346E    pop         esi
 0008346F    pop         ebx
 00083470    pop         ecx
 00083471    pop         ebp
 00083472    ret         8
*}
end;

//00083478
procedure SetHorzRange;
begin
{*
 00083478    push        ebp
 00083479    mov         ebp,esp
 0008347B    push        ebx
 0008347C    mov         eax,dword ptr [ebp+8]
 0008347F    mov         al,byte ptr [eax-71]
 00083482    sub         al,1
>00083484    je          0008348A
 00083486    sub         al,2
>00083488    jne         00083506
 0008348A    mov         eax,dword ptr [ebp+8]
 0008348D    mov         eax,dword ptr [eax-8]
 00083490    cmp         dword ptr [eax+1FC],1
>00083497    jne         000834D5
 00083499    mov         eax,dword ptr [ebp+8]
 0008349C    mov         eax,dword ptr [eax-8]
 0008349F    xor         edx,edx
 000834A1    call        TCustomGrid.GetColWidths
 000834A6    mov         ebx,eax
 000834A8    mov         eax,dword ptr [ebp+8]
 000834AB    mov         eax,dword ptr [eax-8]
 000834AE    call        TControl.GetClientWidth
 000834B3    sub         ebx,eax
 000834B5    test        ebx,ebx
>000834B7    jge         000834BB
 000834B9    xor         ebx,ebx
 000834BB    push        0FF
 000834BD    push        ebx
 000834BE    push        0
 000834C0    push        0
 000834C2    mov         eax,dword ptr [ebp+8]
 000834C5    mov         eax,dword ptr [eax-8]
 000834C8    call        TWinControl.GetHandle
 000834CD    push        eax
 000834CE    call        user32.SetScrollRange
>000834D3    jmp         00083506
 000834D5    mov         eax,dword ptr [ebp+8]
 000834D8    push        eax
 000834D9    push        0
 000834DB    mov         eax,dword ptr [ebp+8]
 000834DE    mov         eax,dword ptr [eax-8]
 000834E1    mov         eax,dword ptr [eax+218]
 000834E7    push        eax
 000834E8    mov         eax,dword ptr [ebp+8]
 000834EB    mov         eax,dword ptr [eax-8]
 000834EE    lea         ecx,[eax+238]
 000834F4    mov         eax,dword ptr [ebp+8]
 000834F7    lea         edx,[eax-70]
 000834FA    mov         eax,dword ptr [ebp+8]
 000834FD    add         eax,0FFFFFF98
 00083500    call        SetAxisRange
 00083505    pop         ecx
 00083506    pop         ebx
 00083507    pop         ebp
 00083508    ret
*}
end;

//0008350C
procedure SetVertRange;
begin
{*
 0008350C    push        ebp
 0008350D    mov         ebp,esp
 0008350F    mov         eax,dword ptr [ebp+8]
 00083512    mov         al,byte ptr [eax-71]
 00083515    add         al,0FE
 00083517    sub         al,2
>00083519    jae         0008354C
 0008351B    mov         eax,dword ptr [ebp+8]
 0008351E    push        eax
 0008351F    push        1
 00083521    mov         eax,dword ptr [ebp+8]
 00083524    mov         eax,dword ptr [eax-8]
 00083527    mov         eax,dword ptr [eax+21C]
 0008352D    push        eax
 0008352E    mov         eax,dword ptr [ebp+8]
 00083531    mov         eax,dword ptr [eax-8]
 00083534    lea         ecx,[eax+23C]
 0008353A    mov         eax,dword ptr [ebp+8]
 0008353D    lea         edx,[eax-6C]
 00083540    mov         eax,dword ptr [ebp+8]
 00083543    add         eax,0FFFFFF9C
 00083546    call        SetAxisRange
 0008354B    pop         ecx
 0008354C    pop         ebp
 0008354D    ret
*}
end;

//00083550
procedure TCustomGrid.UpdateScrollRange;
begin
{*
 00083550    push        ebp
 00083551    mov         ebp,esp
 00083553    add         esp,0FFFFFF8C
 00083556    mov         dword ptr [ebp-8],eax
 00083559    mov         eax,dword ptr [ebp-8]
 0008355C    cmp         byte ptr [eax+234],0
>00083563    je          00083694
 00083569    mov         eax,dword ptr [ebp-8]
 0008356C    call        TWinControl.HandleAllocated
 00083571    test        al,al
>00083573    je          00083694
 00083579    mov         eax,dword ptr [ebp-8]
 0008357C    cmp         byte ptr [eax+16C],0
>00083583    je          00083694
 00083589    mov         eax,dword ptr [ebp-8]
 0008358C    call        TControl.GetClientWidth
 00083591    mov         dword ptr [ebp-54],eax
 00083594    mov         eax,dword ptr [ebp-8]
 00083597    call        TControl.GetClientHeight
 0008359C    mov         dword ptr [ebp-28],eax
 0008359F    push        ebp
 000835A0    xor         eax,eax
 000835A2    call        ScrollBarVisible
 000835A7    pop         ecx
 000835A8    test        al,al
>000835AA    je          000835B6
 000835AC    push        3
 000835AE    call        user32.GetSystemMetrics
 000835B3    add         dword ptr [ebp-28],eax
 000835B6    push        ebp
 000835B7    mov         ax,1
 000835BB    call        ScrollBarVisible
 000835C0    pop         ecx
 000835C1    test        al,al
>000835C3    je          000835CF
 000835C5    push        2
 000835C7    call        user32.GetSystemMetrics
 000835CC    add         dword ptr [ebp-54],eax
 000835CF    mov         eax,dword ptr [ebp-8]
 000835D2    mov         edx,dword ptr [eax+238]
 000835D8    mov         dword ptr [ebp-70],edx
 000835DB    mov         edx,dword ptr [eax+23C]
 000835E1    mov         dword ptr [ebp-6C],edx
 000835E4    mov         eax,dword ptr [ebp-8]
 000835E7    mov         al,byte ptr [eax+234]
 000835ED    mov         byte ptr [ebp-71],al
 000835F0    mov         eax,dword ptr [ebp-8]
 000835F3    mov         byte ptr [eax+234],0
 000835FA    mov         byte ptr [ebp-1],0
 000835FE    xor         eax,eax
 00083600    push        ebp
 00083601    push        8365E
 00083606    push        dword ptr fs:[eax]
 00083609    mov         dword ptr fs:[eax],esp
 0008360C    push        ebp
 0008360D    call        SetHorzRange
 00083612    pop         ecx
 00083613    mov         eax,dword ptr [ebp-8]
 00083616    call        TControl.GetClientHeight
 0008361B    mov         dword ptr [ebp-28],eax
 0008361E    push        ebp
 0008361F    call        SetVertRange
 00083624    pop         ecx
 00083625    mov         eax,dword ptr [ebp-8]
 00083628    call        TControl.GetClientWidth
 0008362D    cmp         eax,dword ptr [ebp-54]
>00083630    je          00083644
 00083632    mov         eax,dword ptr [ebp-8]
 00083635    call        TControl.GetClientWidth
 0008363A    mov         dword ptr [ebp-54],eax
 0008363D    push        ebp
 0008363E    call        SetHorzRange
 00083643    pop         ecx
 00083644    xor         eax,eax
 00083646    pop         edx
 00083647    pop         ecx
 00083648    pop         ecx
 00083649    mov         dword ptr fs:[eax],edx
 0008364C    push        83665
 00083651    mov         eax,dword ptr [ebp-8]
 00083654    mov         dl,byte ptr [ebp-71]
 00083657    mov         byte ptr [eax+234],dl
 0008365D    ret
>0008365E    jmp         @HandleFinally
>00083663    jmp         00083651
 00083665    mov         eax,dword ptr [ebp-8]
 00083668    call        TCustomGrid.UpdateScrollPos
 0008366D    mov         eax,dword ptr [ebp-8]
 00083670    mov         eax,dword ptr [eax+238]
 00083676    cmp         eax,dword ptr [ebp-70]
>00083679    jne         00083689
 0008367B    mov         eax,dword ptr [ebp-8]
 0008367E    mov         eax,dword ptr [eax+23C]
 00083684    cmp         eax,dword ptr [ebp-6C]
>00083687    je          00083694
 00083689    lea         edx,[ebp-70]
 0008368C    mov         eax,dword ptr [ebp-8]
 0008368F    call        TCustomGrid.TopLeftMoved
 00083694    mov         esp,ebp
 00083696    pop         ebp
 00083697    ret
*}
end;

//00083698
function TCustomGrid.CreateEditor:TInplaceEdit;
begin
{*
 00083698    mov         ecx,eax
 0008369A    mov         dl,1
 0008369C    mov         eax,[0007DE68];TInplaceEdit
 000836A1    call        TInplaceEdit.Create
 000836A6    ret
*}
end;

//000836A8
procedure TCustomGrid.CreateParams(var Params:TCreateParams);
begin
{*
 000836A8    push        ebx
 000836A9    push        esi
 000836AA    mov         esi,edx
 000836AC    mov         ebx,eax
 000836AE    mov         edx,esi
 000836B0    mov         eax,ebx
 000836B2    call        TWinControl.CreateParams
 000836B7    or          dword ptr [esi+4],10000
 000836BE    mov         al,byte ptr [ebx+234]
 000836C4    add         al,0FE
 000836C6    sub         al,2
>000836C8    jae         000836D1
 000836CA    or          dword ptr [esi+4],200000
 000836D1    mov         al,byte ptr [ebx+234]
 000836D7    sub         al,1
>000836D9    je          000836DF
 000836DB    sub         al,2
>000836DD    jne         000836E6
 000836DF    or          dword ptr [esi+4],100000
 000836E6    mov         dword ptr [esi+24],8
 000836ED    cmp         byte ptr [ebx+1F8],1
>000836F4    jne         00083720
 000836F6    mov         eax,[000B58C0];NewStyleControls:Boolean
 000836FB    cmp         byte ptr [eax],0
>000836FE    je          00083719
 00083700    cmp         byte ptr [ebx+12C],0
>00083707    je          00083719
 00083709    and         dword ptr [esi+4],0FF7FFFFF
 00083710    or          dword ptr [esi+8],200
>00083717    jmp         00083720
 00083719    or          dword ptr [esi+4],800000
 00083720    pop         esi
 00083721    pop         ebx
 00083722    ret
*}
end;

//00083724
procedure CalcPageExtents;
begin
{*
 00083724    push        ebp
 00083725    mov         ebp,esp
 00083727    mov         eax,dword ptr [ebp+8]
 0008372A    lea         edx,[eax-58]
 0008372D    mov         eax,dword ptr [ebp+8]
 00083730    mov         eax,dword ptr [eax-5C]
 00083733    call        TCustomGrid.CalcDrawInfo
 00083738    mov         eax,dword ptr [ebp+8]
 0008373B    mov         eax,dword ptr [eax-48]
 0008373E    mov         edx,dword ptr [ebp+8]
 00083741    mov         edx,dword ptr [edx-5C]
 00083744    sub         eax,dword ptr [edx+238]
 0008374A    mov         edx,dword ptr [ebp+8]
 0008374D    mov         dword ptr [edx-60],eax
 00083750    mov         eax,dword ptr [ebp+8]
 00083753    cmp         dword ptr [eax-60],1
>00083757    jge         00083763
 00083759    mov         eax,dword ptr [ebp+8]
 0008375C    mov         dword ptr [eax-60],1
 00083763    mov         eax,dword ptr [ebp+8]
 00083766    mov         eax,dword ptr [eax-1C]
 00083769    mov         edx,dword ptr [ebp+8]
 0008376C    mov         edx,dword ptr [edx-5C]
 0008376F    sub         eax,dword ptr [edx+23C]
 00083775    mov         edx,dword ptr [ebp+8]
 00083778    mov         dword ptr [edx-64],eax
 0008377B    mov         eax,dword ptr [ebp+8]
 0008377E    cmp         dword ptr [eax-64],1
>00083782    jge         0008378E
 00083784    mov         eax,dword ptr [ebp+8]
 00083787    mov         dword ptr [eax-64],1
 0008378E    pop         ebp
 0008378F    ret
*}
end;

//00083790
procedure Restrict(var Coord:TGridCoord; MinX:Longint; MinY:Longint; MaxX:Longint; MaxY:Longint);
begin
{*
 00083790    push        ebp
 00083791    mov         ebp,esp
 00083793    push        ecx
 00083794    push        ebx
 00083795    push        esi
 00083796    push        edi
 00083797    mov         dword ptr [ebp-4],ecx
 0008379A    mov         esi,dword ptr [ebp+8]
 0008379D    mov         ebx,dword ptr [ebp+0C]
 000837A0    mov         edi,dword ptr [eax]
 000837A2    cmp         ebx,edi
>000837A4    jge         000837AA
 000837A6    mov         dword ptr [eax],ebx
>000837A8    jmp         000837B0
 000837AA    cmp         edx,edi
>000837AC    jle         000837B0
 000837AE    mov         dword ptr [eax],edx
 000837B0    mov         edx,dword ptr [eax+4]
 000837B3    cmp         esi,edx
>000837B5    jge         000837BC
 000837B7    mov         dword ptr [eax+4],esi
>000837BA    jmp         000837C7
 000837BC    cmp         edx,dword ptr [ebp-4]
>000837BF    jge         000837C7
 000837C1    mov         edx,dword ptr [ebp-4]
 000837C4    mov         dword ptr [eax+4],edx
 000837C7    pop         edi
 000837C8    pop         esi
 000837C9    pop         ebx
 000837CA    pop         ecx
 000837CB    pop         ebp
 000837CC    ret         8
*}
end;

//000837D0
procedure TCustomGrid.KeyDown(Key:Word; Shift:TShiftState);
begin
{*
 000837D0    push        ebp
 000837D1    mov         ebp,esp
 000837D3    add         esp,0FFFFFF74
 000837D9    push        ebx
 000837DA    push        esi
 000837DB    push        edi
 000837DC    mov         byte ptr [ebp-65],cl
 000837DF    mov         esi,edx
 000837E1    mov         dword ptr [ebp-5C],eax
 000837E4    lea         edi,[ebp-5C]
 000837E7    mov         edx,esi
 000837E9    mov         cl,byte ptr [ebp-65]
 000837EC    mov         eax,dword ptr [edi]
 000837EE    call        TWinControl.KeyDown
 000837F3    mov         byte ptr [ebp-81],0
 000837FA    mov         dx,word ptr [esi]
 000837FD    mov         cl,byte ptr [ebp-65]
 00083800    mov         eax,dword ptr [edi]
 00083802    mov         bx,0FFB6
 00083806    call        @CallDynaInst;TCustomGrid.sub_00080464
 0008380B    test        al,al
>0008380D    jne         00083814
 0008380F    mov         word ptr [esi],0
 00083814    mov         eax,dword ptr [edi]
 00083816    mov         bx,0FFCF
 0008381A    call        @CallDynaInst;TControl.UseRightToLeftAlignment
 0008381F    test        al,al
>00083821    jne         0008382A
 00083823    mov         ebx,1
>00083828    jmp         0008382D
 0008382A    or          ebx,0FFFFFFFF
 0008382D    mov         eax,dword ptr [edi]
 0008382F    mov         edx,dword ptr [eax+208];TCustomGrid.FCurrent:TGridCoord
 00083835    mov         dword ptr [ebp-78],edx
 00083838    mov         edx,dword ptr [eax+20C];TCustomGrid.FCurrent:Longint
 0008383E    mov         dword ptr [ebp-74],edx
 00083841    mov         eax,dword ptr [edi]
 00083843    mov         edx,dword ptr [eax+238];TCustomGrid.FTopLeft:TGridCoord
 00083849    mov         dword ptr [ebp-70],edx
 0008384C    mov         edx,dword ptr [eax+23C];TCustomGrid.FTopLeft:Longint
 00083852    mov         dword ptr [ebp-6C],edx
 00083855    push        ebp
 00083856    call        CalcPageExtents
 0008385B    pop         ecx
 0008385C    test        byte ptr [ebp-65],4
>00083860    je          0008395F
 00083866    movzx       eax,word ptr [esi]
 00083869    add         eax,0FFFFFFDF
 0008386C    cmp         eax,7
>0008386F    ja          00083B2B
 00083875    jmp         dword ptr [eax*4+8387C]
 00083875    dd          000838EA
 00083875    dd          000838FA
 00083875    dd          00083931
 00083875    dd          00083905
 00083875    dd          000838AC
 00083875    dd          0008389C
 00083875    dd          000838CB
 00083875    dd          000838A4
 0008389C    dec         dword ptr [ebp-6C]
>0008389F    jmp         00083B2B
 000838A4    inc         dword ptr [ebp-6C]
>000838A7    jmp         00083B2B
 000838AC    mov         eax,dword ptr [edi]
 000838AE    test        byte ptr [eax+229],10;TCustomGrid.?f229:byte
>000838B5    jne         00083B2B
 000838BB    mov         eax,dword ptr [ebp-60]
 000838BE    imul        ebx
 000838C0    sub         dword ptr [ebp-78],eax
 000838C3    sub         dword ptr [ebp-70],eax
>000838C6    jmp         00083B2B
 000838CB    mov         eax,dword ptr [edi]
 000838CD    test        byte ptr [eax+229],10;TCustomGrid.?f229:byte
>000838D4    jne         00083B2B
 000838DA    mov         eax,dword ptr [ebp-60]
 000838DD    imul        ebx
 000838DF    add         dword ptr [ebp-78],eax
 000838E2    add         dword ptr [ebp-70],eax
>000838E5    jmp         00083B2B
 000838EA    mov         eax,dword ptr [edi]
 000838EC    mov         eax,dword ptr [eax+23C];TCustomGrid.FTopLeft:Longint
 000838F2    mov         dword ptr [ebp-74],eax
>000838F5    jmp         00083B2B
 000838FA    mov         eax,dword ptr [ebp-1C]
 000838FD    mov         dword ptr [ebp-74],eax
>00083900    jmp         00083B2B
 00083905    mov         eax,dword ptr [edi]
 00083907    mov         eax,dword ptr [eax+218];TCustomGrid.FFixedCols:Integer
 0008390D    mov         dword ptr [ebp-78],eax
 00083910    mov         eax,dword ptr [edi]
 00083912    mov         eax,dword ptr [eax+21C];TCustomGrid.FFixedRows:Integer
 00083918    mov         dword ptr [ebp-74],eax
 0008391B    mov         eax,dword ptr [edi]
 0008391D    mov         bx,0FFCF
 00083921    call        @CallDynaInst;TControl.UseRightToLeftAlignment
 00083926    mov         byte ptr [ebp-81],al
>0008392C    jmp         00083B2B
 00083931    mov         eax,dword ptr [edi]
 00083933    mov         eax,dword ptr [eax+1FC];TCustomGrid.FColCount:Longint
 00083939    dec         eax
 0008393A    mov         dword ptr [ebp-78],eax
 0008393D    mov         eax,dword ptr [edi]
 0008393F    mov         eax,dword ptr [eax+22C];TCustomGrid.FRowCount:Longint
 00083945    dec         eax
 00083946    mov         dword ptr [ebp-74],eax
 00083949    mov         eax,dword ptr [edi]
 0008394B    mov         bx,0FFCF
 0008394F    call        @CallDynaInst;TControl.UseRightToLeftAlignment
 00083954    mov         byte ptr [ebp-81],al
>0008395A    jmp         00083B2B
 0008395F    movzx       eax,word ptr [esi]
 00083962    cmp         eax,25
>00083965    jg          000839A0
>00083967    je          000839C9
 00083969    cmp         eax,22
>0008396C    jg          0008398B
>0008396E    je          000839FF
 00083974    sub         eax,9
>00083977    je          00083A79
 0008397D    sub         eax,18
>00083980    je          00083A10
>00083986    jmp         00083B2B
 0008398B    sub         eax,23
>0008398E    je          00083A4C
 00083994    dec         eax
>00083995    je          00083A21
>0008399B    jmp         00083B2B
 000839A0    sub         eax,26
>000839A3    je          000839B9
 000839A5    dec         eax
>000839A6    je          000839E4
 000839A8    dec         eax
>000839A9    je          000839C1
 000839AB    sub         eax,49
>000839AE    je          00083B22
>000839B4    jmp         00083B2B
 000839B9    dec         dword ptr [ebp-74]
>000839BC    jmp         00083B2B
 000839C1    inc         dword ptr [ebp-74]
>000839C4    jmp         00083B2B
 000839C9    mov         eax,dword ptr [edi]
 000839CB    test        byte ptr [eax+229],10;TCustomGrid.?f229:byte
>000839D2    je          000839DC
 000839D4    sub         dword ptr [ebp-74],ebx
>000839D7    jmp         00083B2B
 000839DC    sub         dword ptr [ebp-78],ebx
>000839DF    jmp         00083B2B
 000839E4    mov         eax,dword ptr [edi]
 000839E6    test        byte ptr [eax+229],10;TCustomGrid.?f229:byte
>000839ED    je          000839F7
 000839EF    add         dword ptr [ebp-74],ebx
>000839F2    jmp         00083B2B
 000839F7    add         dword ptr [ebp-78],ebx
>000839FA    jmp         00083B2B
 000839FF    mov         eax,dword ptr [ebp-64]
 00083A02    add         dword ptr [ebp-74],eax
 00083A05    mov         eax,dword ptr [ebp-64]
 00083A08    add         dword ptr [ebp-6C],eax
>00083A0B    jmp         00083B2B
 00083A10    mov         eax,dword ptr [ebp-64]
 00083A13    sub         dword ptr [ebp-74],eax
 00083A16    mov         eax,dword ptr [ebp-64]
 00083A19    sub         dword ptr [ebp-6C],eax
>00083A1C    jmp         00083B2B
 00083A21    mov         eax,dword ptr [edi]
 00083A23    test        byte ptr [eax+229],10;TCustomGrid.?f229:byte
>00083A2A    je          00083A3C
 00083A2C    mov         eax,dword ptr [edi]
 00083A2E    mov         eax,dword ptr [eax+21C];TCustomGrid.FFixedRows:Integer
 00083A34    mov         dword ptr [ebp-74],eax
>00083A37    jmp         00083B2B
 00083A3C    mov         eax,dword ptr [edi]
 00083A3E    mov         eax,dword ptr [eax+218];TCustomGrid.FFixedCols:Integer
 00083A44    mov         dword ptr [ebp-78],eax
>00083A47    jmp         00083B2B
 00083A4C    mov         eax,dword ptr [edi]
 00083A4E    test        byte ptr [eax+229],10;TCustomGrid.?f229:byte
>00083A55    je          00083A68
 00083A57    mov         eax,dword ptr [edi]
 00083A59    mov         eax,dword ptr [eax+22C];TCustomGrid.FRowCount:Longint
 00083A5F    dec         eax
 00083A60    mov         dword ptr [ebp-74],eax
>00083A63    jmp         00083B2B
 00083A68    mov         eax,dword ptr [edi]
 00083A6A    mov         eax,dword ptr [eax+1FC];TCustomGrid.FColCount:Longint
 00083A70    dec         eax
 00083A71    mov         dword ptr [ebp-78],eax
>00083A74    jmp         00083B2B
 00083A79    test        byte ptr [ebp-65],2
>00083A7D    jne         00083B2B
 00083A83    test        byte ptr [ebp-65],1
>00083A87    je          00083ACB
 00083A89    dec         dword ptr [ebp-78]
 00083A8C    mov         eax,dword ptr [edi]
 00083A8E    mov         eax,dword ptr [eax+218];TCustomGrid.FFixedCols:Integer
 00083A94    cmp         eax,dword ptr [ebp-78]
>00083A97    jle         00083AC1
 00083A99    mov         eax,dword ptr [edi]
 00083A9B    mov         eax,dword ptr [eax+1FC];TCustomGrid.FColCount:Longint
 00083AA1    dec         eax
 00083AA2    mov         dword ptr [ebp-78],eax
 00083AA5    dec         dword ptr [ebp-74]
 00083AA8    mov         eax,dword ptr [edi]
 00083AAA    mov         eax,dword ptr [eax+21C];TCustomGrid.FFixedRows:Integer
 00083AB0    cmp         eax,dword ptr [ebp-74]
>00083AB3    jle         00083AC1
 00083AB5    mov         eax,dword ptr [edi]
 00083AB7    mov         eax,dword ptr [eax+22C];TCustomGrid.FRowCount:Longint
 00083ABD    dec         eax
 00083ABE    mov         dword ptr [ebp-74],eax
 00083AC1    mov         al,[00083C28];0x0 gvar_00083C28
 00083AC6    mov         byte ptr [ebp-65],al
>00083AC9    jmp         00083B01
 00083ACB    inc         dword ptr [ebp-78]
 00083ACE    mov         eax,dword ptr [edi]
 00083AD0    mov         eax,dword ptr [eax+1FC];TCustomGrid.FColCount:Longint
 00083AD6    cmp         eax,dword ptr [ebp-78]
>00083AD9    jg          00083B01
 00083ADB    mov         eax,dword ptr [edi]
 00083ADD    mov         eax,dword ptr [eax+218];TCustomGrid.FFixedCols:Integer
 00083AE3    mov         dword ptr [ebp-78],eax
 00083AE6    inc         dword ptr [ebp-74]
 00083AE9    mov         eax,dword ptr [edi]
 00083AEB    mov         eax,dword ptr [eax+22C];TCustomGrid.FRowCount:Longint
 00083AF1    cmp         eax,dword ptr [ebp-74]
>00083AF4    jg          00083B01
 00083AF6    mov         eax,dword ptr [edi]
 00083AF8    mov         eax,dword ptr [eax+21C];TCustomGrid.FFixedRows:Integer
 00083AFE    mov         dword ptr [ebp-74],eax
 00083B01    mov         edx,dword ptr [ebp-78]
 00083B04    mov         eax,dword ptr [edi]
 00083B06    call        TCustomGrid.GetTabStops
 00083B0B    test        al,al
>00083B0D    jne         00083B2B
 00083B0F    mov         eax,dword ptr [edi]
 00083B11    mov         eax,dword ptr [eax+208];TCustomGrid.FCurrent:TGridCoord
 00083B17    cmp         eax,dword ptr [ebp-78]
>00083B1A    jne         00083A83
>00083B20    jmp         00083B2B
 00083B22    mov         dl,1
 00083B24    mov         eax,dword ptr [edi]
 00083B26    call        TCustomGrid.SetEditorMode
 00083B2B    mov         eax,dword ptr [edi]
 00083B2D    mov         eax,dword ptr [eax+1FC];TCustomGrid.FColCount:Longint
 00083B33    dec         eax
 00083B34    mov         dword ptr [ebp-80],eax
 00083B37    mov         eax,dword ptr [edi]
 00083B39    mov         eax,dword ptr [eax+22C];TCustomGrid.FRowCount:Longint
 00083B3F    dec         eax
 00083B40    mov         dword ptr [ebp-7C],eax
 00083B43    lea         eax,[ebp-8C]
 00083B49    push        eax
 00083B4A    lea         ecx,[ebp-58]
 00083B4D    lea         edx,[ebp-80]
 00083B50    mov         eax,dword ptr [edi]
 00083B52    call        TCustomGrid.CalcMaxTopLeft
 00083B57    mov         eax,dword ptr [ebp-8C]
 00083B5D    mov         dword ptr [ebp-80],eax
 00083B60    mov         eax,dword ptr [ebp-88]
 00083B66    mov         dword ptr [ebp-7C],eax
 00083B69    mov         eax,dword ptr [ebp-80]
 00083B6C    push        eax
 00083B6D    mov         eax,dword ptr [ebp-7C]
 00083B70    push        eax
 00083B71    mov         eax,dword ptr [edi]
 00083B73    mov         ecx,dword ptr [eax+21C];TCustomGrid.FFixedRows:Integer
 00083B79    mov         eax,dword ptr [edi]
 00083B7B    mov         edx,dword ptr [eax+218];TCustomGrid.FFixedCols:Integer
 00083B81    lea         eax,[ebp-70]
 00083B84    call        Restrict
 00083B89    mov         edx,dword ptr [edi]
 00083B8B    mov         edx,dword ptr [edx+238];TCustomGrid.FTopLeft:TGridCoord
 00083B91    mov         eax,dword ptr [ebp-70]
 00083B94    cmp         edx,eax
>00083B96    jne         00083BA5
 00083B98    mov         edx,dword ptr [edi]
 00083B9A    mov         edx,dword ptr [edx+23C];TCustomGrid.FTopLeft:Longint
 00083BA0    cmp         edx,dword ptr [ebp-6C]
>00083BA3    je          00083BB1
 00083BA5    mov         ecx,dword ptr [ebp-6C]
 00083BA8    mov         edx,eax
 00083BAA    mov         eax,dword ptr [edi]
 00083BAC    call        TCustomGrid.MoveTopLeft
 00083BB1    mov         eax,dword ptr [edi]
 00083BB3    mov         eax,dword ptr [eax+1FC];TCustomGrid.FColCount:Longint
 00083BB9    dec         eax
 00083BBA    push        eax
 00083BBB    mov         eax,dword ptr [edi]
 00083BBD    mov         eax,dword ptr [eax+22C];TCustomGrid.FRowCount:Longint
 00083BC3    dec         eax
 00083BC4    push        eax
 00083BC5    mov         eax,dword ptr [edi]
 00083BC7    mov         ecx,dword ptr [eax+21C];TCustomGrid.FFixedRows:Integer
 00083BCD    mov         eax,dword ptr [edi]
 00083BCF    mov         edx,dword ptr [eax+218];TCustomGrid.FFixedCols:Integer
 00083BD5    lea         eax,[ebp-78]
 00083BD8    call        Restrict
 00083BDD    mov         edx,dword ptr [edi]
 00083BDF    mov         edx,dword ptr [edx+208];TCustomGrid.FCurrent:TGridCoord
 00083BE5    mov         eax,dword ptr [ebp-78]
 00083BE8    cmp         edx,eax
>00083BEA    jne         00083BF9
 00083BEC    mov         edx,dword ptr [edi]
 00083BEE    mov         edx,dword ptr [edx+20C];TCustomGrid.FCurrent:Longint
 00083BF4    cmp         edx,dword ptr [ebp-74]
>00083BF7    je          00083C10
 00083BF9    test        byte ptr [ebp-65],1
 00083BFD    setne       dl
 00083C00    xor         dl,1
 00083C03    push        edx
 00083C04    mov         ecx,dword ptr [ebp-74]
 00083C07    mov         edx,eax
 00083C09    mov         eax,dword ptr [edi]
 00083C0B    call        TCustomGrid.FocusCell
 00083C10    cmp         byte ptr [ebp-81],0
>00083C17    je          00083C20
 00083C19    mov         eax,dword ptr [edi]
 00083C1B    mov         edx,dword ptr [eax]
 00083C1D    call        dword ptr [edx+78]
 00083C20    pop         edi
 00083C21    pop         esi
 00083C22    pop         ebx
 00083C23    mov         esp,ebp
 00083C25    pop         ebp
 00083C26    ret
*}
end;

//00083C2C
procedure TCustomGrid.KeyPress(var Key:Char);
begin
{*
 00083C2C    push        ebx
 00083C2D    push        esi
 00083C2E    mov         esi,edx
 00083C30    mov         ebx,eax
 00083C32    mov         edx,esi
 00083C34    mov         eax,ebx
 00083C36    call        TWinControl.KeyPress
 00083C3B    test        byte ptr [ebx+229],20
>00083C42    jne         00083C65
 00083C44    cmp         byte ptr [esi],0D
>00083C47    jne         00083C65
 00083C49    cmp         byte ptr [ebx+26D],0
>00083C50    je          00083C5B
 00083C52    mov         eax,ebx
 00083C54    call        TCustomGrid.HideEditor
>00083C59    jmp         00083C62
 00083C5B    mov         eax,ebx
 00083C5D    call        TCustomGrid.ShowEditor
 00083C62    mov         byte ptr [esi],0
 00083C65    pop         esi
 00083C66    pop         ebx
 00083C67    ret
*}
end;

//00083C68
procedure TCustomGrid.MouseDown(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);
begin
{*
 00083C68    push        ebp
 00083C69    mov         ebp,esp
 00083C6B    add         esp,0FFFFFF8C
 00083C6E    push        ebx
 00083C6F    push        esi
 00083C70    push        edi
 00083C71    mov         byte ptr [ebp-6],cl
 00083C74    mov         byte ptr [ebp-5],dl
 00083C77    mov         dword ptr [ebp-4],eax
 00083C7A    mov         edi,dword ptr [ebp+8]
 00083C7D    mov         esi,dword ptr [ebp+0C]
 00083C80    mov         byte ptr [ebp-11],0
 00083C84    mov         eax,dword ptr [ebp-4]
 00083C87    call        TCustomGrid.HideEdit
 00083C8C    mov         eax,dword ptr [ebp-4]
 00083C8F    test        byte ptr [eax+20],10
>00083C93    jne         00083CD3
 00083C95    mov         eax,dword ptr [ebp-4]
 00083C98    call        TWinControl.CanFocus
 00083C9D    test        al,al
>00083C9F    jne         00083CAD
 00083CA1    mov         eax,dword ptr [ebp-4]
 00083CA4    call        GetParentForm
 00083CA9    test        eax,eax
>00083CAB    jne         00083CD3
 00083CAD    mov         eax,dword ptr [ebp-4]
 00083CB0    mov         edx,dword ptr [eax]
 00083CB2    call        dword ptr [edx+0B4]
 00083CB8    mov         eax,dword ptr [ebp-4]
 00083CBB    call        TCustomGrid.IsActiveControl
 00083CC0    test        al,al
>00083CC2    jne         00083CD3
 00083CC4    xor         edx,edx
 00083CC6    mov         eax,dword ptr [ebp-4]
 00083CC9    call        TControl.SetMouseCapture
>00083CCE    jmp         0008401D
 00083CD3    cmp         byte ptr [ebp-5],0
>00083CD7    jne         00083CF0
 00083CD9    test        byte ptr [ebp-6],40
>00083CDD    je          00083CF0
 00083CDF    mov         eax,dword ptr [ebp-4]
 00083CE2    mov         bx,0FFEB
 00083CE6    call        @CallDynaInst
>00083CEB    jmp         00083FDD
 00083CF0    cmp         byte ptr [ebp-5],0
>00083CF4    jne         00083FDD
 00083CFA    lea         edx,[ebp-6C]
 00083CFD    mov         eax,dword ptr [ebp-4]
 00083D00    call        TCustomGrid.CalcDrawInfo
 00083D05    mov         eax,dword ptr [ebp-4]
 00083D08    add         eax,26E
 00083D0D    push        eax
 00083D0E    mov         eax,dword ptr [ebp-4]
 00083D11    add         eax,240
 00083D16    push        eax
 00083D17    mov         eax,dword ptr [ebp-4]
 00083D1A    add         eax,244
 00083D1F    push        eax
 00083D20    mov         eax,dword ptr [ebp-4]
 00083D23    add         eax,248
 00083D28    push        eax
 00083D29    lea         eax,[ebp-6C]
 00083D2C    push        eax
 00083D2D    mov         ecx,edi
 00083D2F    mov         edx,esi
 00083D31    mov         eax,dword ptr [ebp-4]
 00083D34    mov         ebx,dword ptr [eax]
 00083D36    call        dword ptr [ebx+0BC]
 00083D3C    mov         eax,dword ptr [ebp-4]
 00083D3F    cmp         byte ptr [eax+26E],0
>00083D46    je          00083D82
 00083D48    mov         eax,dword ptr [ebp-4]
 00083D4B    mov         bx,0FFCF
 00083D4F    call        @CallDynaInst
 00083D54    test        al,al
>00083D56    je          00083D72
 00083D58    mov         eax,dword ptr [ebp-4]
 00083D5B    call        TControl.GetClientWidth
 00083D60    mov         edx,dword ptr [ebp-4]
 00083D63    sub         eax,dword ptr [edx+244]
 00083D69    mov         edx,dword ptr [ebp-4]
 00083D6C    mov         dword ptr [edx+244],eax
 00083D72    lea         edx,[ebp-6C]
 00083D75    mov         eax,dword ptr [ebp-4]
 00083D78    call        TCustomGrid.DrawSizingLine
>00083D7D    jmp         0008401D
 00083D82    lea         eax,[ebp-6C]
 00083D85    push        eax
 00083D86    lea         eax,[ebp-10]
 00083D89    push        eax
 00083D8A    mov         ecx,edi
 00083D8C    mov         edx,esi
 00083D8E    mov         eax,dword ptr [ebp-4]
 00083D91    call        TCustomGrid.CalcCoordFromPoint
 00083D96    mov         eax,dword ptr [ebp-4]
 00083D99    mov         eax,dword ptr [eax+218]
 00083D9F    mov         ebx,dword ptr [ebp-10]
 00083DA2    cmp         eax,ebx
>00083DA4    jg          00083E64
 00083DAA    mov         eax,dword ptr [ebp-4]
 00083DAD    mov         eax,dword ptr [eax+21C]
 00083DB3    cmp         eax,dword ptr [ebp-0C]
>00083DB6    jg          00083E64
 00083DBC    mov         eax,dword ptr [ebp-4]
 00083DBF    test        byte ptr [eax+229],4
>00083DC6    je          00083E1A
 00083DC8    mov         edx,dword ptr [ebp-4]
 00083DCB    mov         edx,dword ptr [edx+208]
 00083DD1    mov         eax,dword ptr [ebp-10]
 00083DD4    cmp         edx,eax
>00083DD6    jne         00083DF0
 00083DD8    mov         edx,dword ptr [ebp-4]
 00083DDB    mov         edx,dword ptr [edx+20C]
 00083DE1    cmp         edx,dword ptr [ebp-0C]
>00083DE4    jne         00083DF0
 00083DE6    mov         eax,dword ptr [ebp-4]
 00083DE9    call        TCustomGrid.ShowEditor
>00083DEE    jmp         00083E09
 00083DF0    push        1
 00083DF2    push        1
 00083DF4    mov         ecx,dword ptr [ebp-0C]
 00083DF7    mov         edx,eax
 00083DF9    mov         eax,dword ptr [ebp-4]
 00083DFC    call        TCustomGrid.MoveCurrent
 00083E01    mov         eax,dword ptr [ebp-4]
 00083E04    call        TCustomGrid.UpdateEdit
 00083E09    mov         eax,dword ptr [ebp-4]
 00083E0C    mov         bx,0FFEC
 00083E10    call        @CallDynaInst
>00083E15    jmp         00083FDD
 00083E1A    mov         eax,dword ptr [ebp-4]
 00083E1D    mov         byte ptr [eax+26E],1
 00083E24    push        0
 00083E26    push        3C
 00083E28    push        1
 00083E2A    mov         eax,dword ptr [ebp-4]
 00083E2D    call        TWinControl.GetHandle
 00083E32    push        eax
 00083E33    call        user32.SetTimer
 00083E38    test        byte ptr [ebp-6],1
>00083E3C    je          00083E4E
 00083E3E    lea         edx,[ebp-10]
 00083E41    mov         eax,dword ptr [ebp-4]
 00083E44    call        TCustomGrid.MoveAnchor
>00083E49    jmp         00083FDD
 00083E4E    push        1
 00083E50    push        1
 00083E52    mov         ecx,dword ptr [ebp-0C]
 00083E55    mov         edx,ebx
 00083E57    mov         eax,dword ptr [ebp-4]
 00083E5A    call        TCustomGrid.MoveCurrent
>00083E5F    jmp         00083FDD
 00083E64    mov         eax,dword ptr [ebp-4]
 00083E67    test        byte ptr [eax+229],1
>00083E6E    je          00083F27
 00083E74    cmp         dword ptr [ebp-10],0
>00083E78    jl          00083F27
 00083E7E    mov         eax,dword ptr [ebp-4]
 00083E81    mov         eax,dword ptr [eax+218]
 00083E87    cmp         eax,dword ptr [ebp-10]
>00083E8A    jle         00083F27
 00083E90    mov         eax,dword ptr [ebp-4]
 00083E93    mov         eax,dword ptr [eax+21C]
 00083E99    cmp         eax,dword ptr [ebp-0C]
>00083E9C    jg          00083F27
 00083EA2    mov         edx,dword ptr [ebp-4]
 00083EA5    mov         eax,dword ptr [ebp-0C]
 00083EA8    mov         dword ptr [edx+24C],eax
 00083EAE    mov         edx,dword ptr [ebp-4]
 00083EB1    mov         dword ptr [edx+250],eax
 00083EB7    lea         ecx,[ebp-74]
 00083EBA    mov         edx,edi
 00083EBC    mov         eax,esi
 00083EBE    call        Point
 00083EC3    lea         eax,[ebp-74]
 00083EC6    push        eax
 00083EC7    mov         eax,dword ptr [ebp-4]
 00083ECA    lea         ecx,[eax+250]
 00083ED0    mov         eax,dword ptr [ebp-4]
 00083ED3    lea         edx,[eax+24C]
 00083ED9    mov         eax,dword ptr [ebp-4]
 00083EDC    mov         bx,0FFA8
 00083EE0    call        @CallDynaInst
 00083EE5    test        al,al
>00083EE7    je          00083FDD
 00083EED    mov         eax,dword ptr [ebp-4]
 00083EF0    mov         byte ptr [eax+26E],4
 00083EF7    mov         eax,dword ptr [ebp-4]
 00083EFA    mov         edx,dword ptr [eax]
 00083EFC    call        dword ptr [edx+84]
 00083F02    mov         eax,dword ptr [ebp-4]
 00083F05    call        TCustomGrid.DrawMove
 00083F0A    mov         byte ptr [ebp-11],1
 00083F0E    push        0
 00083F10    push        3C
 00083F12    push        1
 00083F14    mov         eax,dword ptr [ebp-4]
 00083F17    call        TWinControl.GetHandle
 00083F1C    push        eax
 00083F1D    call        user32.SetTimer
>00083F22    jmp         00083FDD
 00083F27    mov         eax,dword ptr [ebp-4]
 00083F2A    test        byte ptr [eax+229],2
>00083F31    je          00083FDD
 00083F37    cmp         dword ptr [ebp-0C],0
>00083F3B    jl          00083FDD
 00083F41    mov         eax,dword ptr [ebp-4]
 00083F44    mov         eax,dword ptr [eax+21C]
 00083F4A    cmp         eax,dword ptr [ebp-0C]
>00083F4D    jle         00083FDD
 00083F53    mov         eax,dword ptr [ebp-4]
 00083F56    mov         eax,dword ptr [eax+218]
 00083F5C    cmp         eax,dword ptr [ebp-10]
>00083F5F    jg          00083FDD
 00083F61    mov         edx,dword ptr [ebp-4]
 00083F64    mov         eax,dword ptr [ebp-10]
 00083F67    mov         dword ptr [edx+24C],eax
 00083F6D    mov         edx,dword ptr [ebp-4]
 00083F70    mov         dword ptr [edx+250],eax
 00083F76    lea         ecx,[ebp-74]
 00083F79    mov         edx,edi
 00083F7B    mov         eax,esi
 00083F7D    call        Point
 00083F82    lea         eax,[ebp-74]
 00083F85    push        eax
 00083F86    mov         eax,dword ptr [ebp-4]
 00083F89    lea         ecx,[eax+250]
 00083F8F    mov         eax,dword ptr [ebp-4]
 00083F92    lea         edx,[eax+24C]
 00083F98    mov         eax,dword ptr [ebp-4]
 00083F9B    mov         bx,0FFA9
 00083F9F    call        @CallDynaInst
 00083FA4    test        al,al
>00083FA6    je          00083FDD
 00083FA8    mov         eax,dword ptr [ebp-4]
 00083FAB    mov         byte ptr [eax+26E],5
 00083FB2    mov         eax,dword ptr [ebp-4]
 00083FB5    mov         edx,dword ptr [eax]
 00083FB7    call        dword ptr [edx+84]
 00083FBD    mov         eax,dword ptr [ebp-4]
 00083FC0    call        TCustomGrid.DrawMove
 00083FC5    mov         byte ptr [ebp-11],1
 00083FC9    push        0
 00083FCB    push        3C
 00083FCD    push        1
 00083FCF    mov         eax,dword ptr [ebp-4]
 00083FD2    call        TWinControl.GetHandle
 00083FD7    push        eax
 00083FD8    call        user32.SetTimer
 00083FDD    xor         eax,eax
 00083FDF    push        ebp
 00083FE0    push        84005
 00083FE5    push        dword ptr fs:[eax]
 00083FE8    mov         dword ptr fs:[eax],esp
 00083FEB    push        esi
 00083FEC    push        edi
 00083FED    mov         cl,byte ptr [ebp-6]
 00083FF0    mov         dl,byte ptr [ebp-5]
 00083FF3    mov         eax,dword ptr [ebp-4]
 00083FF6    call        TControl.MouseDown
 00083FFB    xor         eax,eax
 00083FFD    pop         edx
 00083FFE    pop         ecx
 00083FFF    pop         ecx
 00084000    mov         dword ptr fs:[eax],edx
>00084003    jmp         0008401D
>00084005    jmp         @HandleAnyException
 0008400A    cmp         byte ptr [ebp-11],0
>0008400E    je          00084018
 00084010    mov         eax,dword ptr [ebp-4]
 00084013    call        TCustomGrid.DrawMove
 00084018    call        @DoneExcept
 0008401D    pop         edi
 0008401E    pop         esi
 0008401F    pop         ebx
 00084020    mov         esp,ebp
 00084022    pop         ebp
 00084023    ret         8
*}
end;

//00084028
procedure TCustomGrid.MouseMove(Shift:TShiftState; X:Integer; Y:Integer);
begin
{*
 00084028    push        ebp
 00084029    mov         ebp,esp
 0008402B    add         esp,0FFFFFF94
 0008402E    push        ebx
 0008402F    push        esi
 00084030    push        edi
 00084031    mov         esi,ecx
 00084033    mov         byte ptr [ebp-1],dl
 00084036    mov         ebx,eax
 00084038    mov         edi,dword ptr [ebp+8]
 0008403B    lea         edx,[ebp-64]
 0008403E    mov         eax,ebx
 00084040    call        TCustomGrid.CalcDrawInfo
 00084045    mov         al,byte ptr [ebx+26E]
 0008404B    dec         al
>0008404D    je          00084060
 0008404F    dec         eax
 00084050    sub         al,2
>00084052    jb          0008413B
 00084058    sub         al,2
>0008405A    jae         00084176
 00084060    lea         eax,[ebp-64]
 00084063    push        eax
 00084064    lea         eax,[ebp-0C]
 00084067    push        eax
 00084068    mov         ecx,edi
 0008406A    mov         edx,esi
 0008406C    mov         eax,ebx
 0008406E    call        TCustomGrid.CalcCoordFromPoint
 00084073    mov         eax,dword ptr [ebp-0C]
 00084076    cmp         eax,dword ptr [ebx+218]
>0008407C    jl          00084176
 00084082    mov         eax,dword ptr [ebp-8]
 00084085    cmp         eax,dword ptr [ebx+21C]
>0008408B    jl          00084176
 00084091    mov         eax,dword ptr [ebp-54]
 00084094    inc         eax
 00084095    cmp         eax,dword ptr [ebp-0C]
>00084098    jl          00084176
 0008409E    mov         eax,dword ptr [ebp-28]
 000840A1    inc         eax
 000840A2    cmp         eax,dword ptr [ebp-8]
>000840A5    jl          00084176
 000840AB    mov         al,byte ptr [ebx+26E]
 000840B1    dec         al
>000840B3    je          000840C2
 000840B5    sub         al,3
>000840B7    je          00084113
 000840B9    dec         al
>000840BB    je          000840EB
>000840BD    jmp         00084176
 000840C2    mov         eax,dword ptr [ebp-0C]
 000840C5    cmp         eax,dword ptr [ebx+1F0]
>000840CB    jne         000840DC
 000840CD    mov         eax,dword ptr [ebp-8]
 000840D0    cmp         eax,dword ptr [ebx+1F4]
>000840D6    je          00084176
 000840DC    lea         edx,[ebp-0C]
 000840DF    mov         eax,ebx
 000840E1    call        TCustomGrid.MoveAnchor
>000840E6    jmp         00084176
 000840EB    lea         eax,[ebp-64]
 000840EE    push        eax
 000840EF    lea         eax,[ebp-64]
 000840F2    push        eax
 000840F3    push        0
 000840F5    lea         ecx,[ebp-6C]
 000840F8    mov         edx,edi
 000840FA    mov         eax,esi
 000840FC    call        Point
 00084101    lea         eax,[ebp-6C]
 00084104    push        eax
 00084105    mov         ecx,dword ptr [ebp-0C]
 00084108    mov         edx,esi
 0008410A    mov         eax,ebx
 0008410C    call        TCustomGrid.MoveAndScroll
>00084111    jmp         00084176
 00084113    lea         eax,[ebp-64]
 00084116    push        eax
 00084117    lea         eax,[ebp-38]
 0008411A    push        eax
 0008411B    push        1
 0008411D    lea         ecx,[ebp-6C]
 00084120    mov         edx,edi
 00084122    mov         eax,esi
 00084124    call        Point
 00084129    lea         eax,[ebp-6C]
 0008412C    push        eax
 0008412D    mov         ecx,dword ptr [ebp-8]
 00084130    mov         edx,edi
 00084132    mov         eax,ebx
 00084134    call        TCustomGrid.MoveAndScroll
>00084139    jmp         00084176
 0008413B    lea         edx,[ebp-64]
 0008413E    mov         eax,ebx
 00084140    call        TCustomGrid.DrawSizingLine
 00084145    cmp         byte ptr [ebx+26E],2
>0008414C    jne         0008415E
 0008414E    mov         eax,dword ptr [ebx+248]
 00084154    add         eax,edi
 00084156    mov         dword ptr [ebx+244],eax
>0008415C    jmp         0008416C
 0008415E    mov         eax,dword ptr [ebx+248]
 00084164    add         eax,esi
 00084166    mov         dword ptr [ebx+244],eax
 0008416C    lea         edx,[ebp-64]
 0008416F    mov         eax,ebx
 00084171    call        TCustomGrid.DrawSizingLine
 00084176    push        edi
 00084177    mov         ecx,esi
 00084179    mov         dl,byte ptr [ebp-1]
 0008417C    mov         eax,ebx
 0008417E    call        TControl.MouseMove
 00084183    pop         edi
 00084184    pop         esi
 00084185    pop         ebx
 00084186    mov         esp,ebp
 00084188    pop         ebp
 00084189    ret         4
*}
end;

//0008418C
function ResizeLine(const AxisInfo:TGridAxisDrawInfo):Integer;
begin
{*
 0008418C    push        ebp
 0008418D    mov         ebp,esp
 0008418F    push        ecx
 00084190    push        ebx
 00084191    push        esi
 00084192    push        edi
 00084193    mov         ebx,eax
 00084195    mov         eax,dword ptr [ebx+4]
 00084198    mov         dword ptr [ebp-4],eax
 0008419B    mov         edi,dword ptr [ebx+1C]
 0008419E    mov         eax,dword ptr [ebp+8]
 000841A1    mov         eax,dword ptr [eax-4]
 000841A4    mov         esi,dword ptr [eax+240]
 000841AA    dec         esi
 000841AB    sub         esi,edi
>000841AD    jl          000841C1
 000841AF    inc         esi
 000841B0    mov         edx,edi
 000841B2    mov         eax,dword ptr [ebx+28]
 000841B5    call        dword ptr [ebx+24]
 000841B8    add         eax,dword ptr [ebx]
 000841BA    add         dword ptr [ebp-4],eax
 000841BD    inc         edi
 000841BE    dec         esi
>000841BF    jne         000841B0
 000841C1    mov         eax,dword ptr [ebp+8]
 000841C4    mov         eax,dword ptr [eax-4]
 000841C7    mov         eax,dword ptr [eax+244]
 000841CD    sub         eax,dword ptr [ebp-4]
 000841D0    mov         dword ptr [ebp-4],eax
 000841D3    mov         eax,dword ptr [ebp-4]
 000841D6    pop         edi
 000841D7    pop         esi
 000841D8    pop         ebx
 000841D9    pop         ecx
 000841DA    pop         ebp
 000841DB    ret
*}
end;

//000841DC
procedure TCustomGrid.MouseUp(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);
begin
{*
 000841DC    push        ebp
 000841DD    mov         ebp,esp
 000841DF    add         esp,0FFFFFF98
 000841E2    push        ebx
 000841E3    push        esi
 000841E4    push        edi
 000841E5    mov         byte ptr [ebp-6],cl
 000841E8    mov         byte ptr [ebp-5],dl
 000841EB    mov         dword ptr [ebp-4],eax
 000841EE    mov         edi,dword ptr [ebp+8]
 000841F1    mov         esi,dword ptr [ebp+0C]
 000841F4    xor         edx,edx
 000841F6    push        ebp
 000841F7    push        8445B
 000841FC    push        dword ptr fs:[edx]
 000841FF    mov         dword ptr fs:[edx],esp
 00084202    mov         eax,dword ptr [ebp-4]
 00084205    mov         al,byte ptr [eax+26E]
 0008420B    dec         al
>0008420D    je          00084227
 0008420F    dec         eax
 00084210    sub         al,2
>00084212    jb          00084262
>00084214    je          000843A1
 0008421A    dec         al
>0008421C    je          00084314
>00084222    jmp         0008442B
 00084227    push        edi
 00084228    mov         ecx,esi
 0008422A    mov         dl,byte ptr [ebp-6]
 0008422D    mov         eax,dword ptr [ebp-4]
 00084230    mov         bx,0FFDA
 00084234    call        @CallDynaInst
 00084239    push        1
 0008423B    mov         eax,dword ptr [ebp-4]
 0008423E    call        TWinControl.GetHandle
 00084243    push        eax
 00084244    call        user32.KillTimer
 00084249    mov         eax,dword ptr [ebp-4]
 0008424C    call        TCustomGrid.UpdateEdit
 00084251    mov         eax,dword ptr [ebp-4]
 00084254    mov         bx,0FFEC
 00084258    call        @CallDynaInst
>0008425D    jmp         00084433
 00084262    lea         edx,[ebp-60]
 00084265    mov         eax,dword ptr [ebp-4]
 00084268    call        TCustomGrid.CalcDrawInfo
 0008426D    lea         edx,[ebp-60]
 00084270    mov         eax,dword ptr [ebp-4]
 00084273    call        TCustomGrid.DrawSizingLine
 00084278    mov         eax,dword ptr [ebp-4]
 0008427B    mov         bx,0FFCF
 0008427F    call        @CallDynaInst
 00084284    test        al,al
>00084286    je          000842A2
 00084288    mov         eax,dword ptr [ebp-4]
 0008428B    call        TControl.GetClientWidth
 00084290    mov         edx,dword ptr [ebp-4]
 00084293    sub         eax,dword ptr [edx+244]
 00084299    mov         edx,dword ptr [ebp-4]
 0008429C    mov         dword ptr [edx+244],eax
 000842A2    mov         eax,dword ptr [ebp-4]
 000842A5    cmp         byte ptr [eax+26E],3
>000842AC    jne         000842E1
 000842AE    push        ebp
 000842AF    lea         eax,[ebp-60]
 000842B2    call        ResizeLine
 000842B7    pop         ecx
 000842B8    cmp         eax,1
>000842BB    jle         00084433
 000842C1    mov         edx,dword ptr [ebp-4]
 000842C4    mov         edx,dword ptr [edx+240]
 000842CA    mov         ecx,eax
 000842CC    mov         eax,dword ptr [ebp-4]
 000842CF    call        TCustomGrid.SetColWidths
 000842D4    mov         eax,dword ptr [ebp-4]
 000842D7    call        TCustomGrid.UpdateDesigner
>000842DC    jmp         00084433
 000842E1    push        ebp
 000842E2    lea         eax,[ebp-34]
 000842E5    call        ResizeLine
 000842EA    pop         ecx
 000842EB    cmp         eax,1
>000842EE    jle         00084433
 000842F4    mov         edx,dword ptr [ebp-4]
 000842F7    mov         edx,dword ptr [edx+240]
 000842FD    mov         ecx,eax
 000842FF    mov         eax,dword ptr [ebp-4]
 00084302    call        TCustomGrid.SetRowHeights
 00084307    mov         eax,dword ptr [ebp-4]
 0008430A    call        TCustomGrid.UpdateDesigner
>0008430F    jmp         00084433
 00084314    mov         eax,dword ptr [ebp-4]
 00084317    call        TCustomGrid.DrawMove
 0008431C    push        1
 0008431E    mov         eax,dword ptr [ebp-4]
 00084321    call        TWinControl.GetHandle
 00084326    push        eax
 00084327    call        user32.KillTimer
 0008432C    lea         ecx,[ebp-68]
 0008432F    mov         edx,edi
 00084331    mov         eax,esi
 00084333    call        Point
 00084338    lea         eax,[ebp-68]
 0008433B    push        eax
 0008433C    mov         eax,dword ptr [ebp-4]
 0008433F    lea         ecx,[eax+250]
 00084345    mov         eax,dword ptr [ebp-4]
 00084348    lea         edx,[eax+24C]
 0008434E    mov         eax,dword ptr [ebp-4]
 00084351    mov         bx,0FFA5
 00084355    call        @CallDynaInst
 0008435A    test        al,al
>0008435C    je          00084394
 0008435E    mov         eax,dword ptr [ebp-4]
 00084361    mov         eax,dword ptr [eax+24C]
 00084367    mov         edx,dword ptr [ebp-4]
 0008436A    cmp         eax,dword ptr [edx+250]
>00084370    je          00084394
 00084372    mov         eax,dword ptr [ebp-4]
 00084375    mov         ecx,dword ptr [eax+250]
 0008437B    mov         eax,dword ptr [ebp-4]
 0008437E    mov         edx,dword ptr [eax+24C]
 00084384    mov         eax,dword ptr [ebp-4]
 00084387    call        TCustomGrid.MoveColumn
 0008438C    mov         eax,dword ptr [ebp-4]
 0008438F    call        TCustomGrid.UpdateDesigner
 00084394    mov         eax,dword ptr [ebp-4]
 00084397    call        TCustomGrid.UpdateEdit
>0008439C    jmp         00084433
 000843A1    mov         eax,dword ptr [ebp-4]
 000843A4    call        TCustomGrid.DrawMove
 000843A9    push        1
 000843AB    mov         eax,dword ptr [ebp-4]
 000843AE    call        TWinControl.GetHandle
 000843B3    push        eax
 000843B4    call        user32.KillTimer
 000843B9    lea         ecx,[ebp-68]
 000843BC    mov         edx,edi
 000843BE    mov         eax,esi
 000843C0    call        Point
 000843C5    lea         eax,[ebp-68]
 000843C8    push        eax
 000843C9    mov         eax,dword ptr [ebp-4]
 000843CC    lea         ecx,[eax+250]
 000843D2    mov         eax,dword ptr [ebp-4]
 000843D5    lea         edx,[eax+24C]
 000843DB    mov         eax,dword ptr [ebp-4]
 000843DE    mov         bx,0FFA4
 000843E2    call        @CallDynaInst
 000843E7    test        al,al
>000843E9    je          00084421
 000843EB    mov         eax,dword ptr [ebp-4]
 000843EE    mov         eax,dword ptr [eax+24C]
 000843F4    mov         edx,dword ptr [ebp-4]
 000843F7    cmp         eax,dword ptr [edx+250]
>000843FD    je          00084421
 000843FF    mov         eax,dword ptr [ebp-4]
 00084402    mov         ecx,dword ptr [eax+250]
 00084408    mov         eax,dword ptr [ebp-4]
 0008440B    mov         edx,dword ptr [eax+24C]
 00084411    mov         eax,dword ptr [ebp-4]
 00084414    call        TCustomGrid.MoveRow
 00084419    mov         eax,dword ptr [ebp-4]
 0008441C    call        TCustomGrid.UpdateDesigner
 00084421    mov         eax,dword ptr [ebp-4]
 00084424    call        TCustomGrid.UpdateEdit
>00084429    jmp         00084433
 0008442B    mov         eax,dword ptr [ebp-4]
 0008442E    call        TCustomGrid.UpdateEdit
 00084433    push        esi
 00084434    push        edi
 00084435    mov         cl,byte ptr [ebp-6]
 00084438    mov         dl,byte ptr [ebp-5]
 0008443B    mov         eax,dword ptr [ebp-4]
 0008443E    call        TControl.MouseUp
 00084443    xor         eax,eax
 00084445    pop         edx
 00084446    pop         ecx
 00084447    pop         ecx
 00084448    mov         dword ptr fs:[eax],edx
 0008444B    push        84462
 00084450    mov         eax,dword ptr [ebp-4]
 00084453    mov         byte ptr [eax+26E],0
 0008445A    ret
>0008445B    jmp         @HandleFinally
>00084460    jmp         00084450
 00084462    pop         edi
 00084463    pop         esi
 00084464    pop         ebx
 00084465    mov         esp,ebp
 00084467    pop         ebp
 00084468    ret         8
*}
end;

//0008446C
procedure TCustomGrid.MoveAndScroll(Mouse:Integer; CellHit:Integer; var DrawInfo:TGridDrawInfo; var Axis:TGridAxisDrawInfo; Scrollbar:Integer; const MousePt:TPoint);
begin
{*
 0008446C    push        ebp
 0008446D    mov         ebp,esp
 0008446F    add         esp,0FFFFFFF8
 00084472    push        ebx
 00084473    push        esi
 00084474    push        edi
 00084475    mov         dword ptr [ebp-8],ecx
 00084478    mov         dword ptr [ebp-4],edx
 0008447B    mov         esi,eax
 0008447D    mov         edi,dword ptr [ebp+10]
 00084480    mov         eax,esi
 00084482    mov         bx,0FFCF
 00084486    call        @CallDynaInst
 0008448B    test        al,al
>0008448D    je          000844A2
 0008448F    cmp         dword ptr [ebp+0C],0
>00084493    jne         000844A2
 00084495    mov         eax,esi
 00084497    call        TControl.GetClientWidth
 0008449C    sub         eax,dword ptr [ebp-4]
 0008449F    mov         dword ptr [ebp-4],eax
 000844A2    mov         eax,dword ptr [ebp-8]
 000844A5    cmp         eax,dword ptr [esi+250]
>000844AB    je          000845DB
 000844B1    mov         eax,dword ptr [edi+18]
 000844B4    cmp         eax,dword ptr [esi+250]
>000844BA    jne         000844C8
 000844BC    mov         eax,dword ptr [edi+4]
 000844BF    cmp         eax,dword ptr [ebp-4]
>000844C2    jg          000845DB
 000844C8    mov         eax,dword ptr [edi+20]
 000844CB    dec         eax
 000844CC    cmp         eax,dword ptr [esi+250]
>000844D2    jne         000844E0
 000844D4    mov         eax,dword ptr [edi+8]
 000844D7    cmp         eax,dword ptr [ebp-4]
>000844DA    jl          000845DB
 000844E0    mov         eax,esi
 000844E2    call        TCustomGrid.DrawMove
 000844E7    mov         eax,dword ptr [edi+4]
 000844EA    cmp         eax,dword ptr [ebp-4]
>000844ED    jle         00084526
 000844EF    mov         eax,dword ptr [edi+18]
 000844F2    cmp         eax,dword ptr [esi+250]
>000844F8    jge         0008451E
 000844FA    push        0
 000844FC    push        0
 000844FE    xor         ecx,ecx
 00084500    mov         edx,dword ptr [ebp+0C]
 00084503    mov         eax,esi
 00084505    call        TCustomGrid.ModifyScrollBar
 0008450A    mov         eax,esi
 0008450C    mov         edx,dword ptr [eax]
 0008450E    call        dword ptr [edx+84]
 00084514    mov         edx,dword ptr [ebp+14]
 00084517    mov         eax,esi
 00084519    call        TCustomGrid.CalcDrawInfo
 0008451E    mov         eax,dword ptr [edi+1C]
 00084521    mov         dword ptr [ebp-8],eax
>00084524    jmp         00084581
 00084526    mov         eax,dword ptr [edi+14]
 00084529    cmp         eax,dword ptr [ebp-4]
>0008452C    jg          00084572
 0008452E    mov         edx,dword ptr [edi+10]
 00084531    mov         eax,dword ptr [esi+250]
 00084537    cmp         edx,eax
>00084539    jne         0008456A
 0008453B    mov         edx,dword ptr [edi+20]
 0008453E    dec         edx
 0008453F    cmp         eax,edx
>00084541    jge         0008456A
 00084543    push        0
 00084545    push        0
 00084547    mov         ecx,1
 0008454C    mov         edx,dword ptr [ebp+0C]
 0008454F    mov         eax,esi
 00084551    call        TCustomGrid.ModifyScrollBar
 00084556    mov         eax,esi
 00084558    mov         edx,dword ptr [eax]
 0008455A    call        dword ptr [edx+84]
 00084560    mov         edx,dword ptr [ebp+14]
 00084563    mov         eax,esi
 00084565    call        TCustomGrid.CalcDrawInfo
 0008456A    mov         eax,dword ptr [edi+10]
 0008456D    mov         dword ptr [ebp-8],eax
>00084570    jmp         00084581
 00084572    cmp         dword ptr [ebp-8],0
>00084576    jge         00084581
 00084578    mov         eax,dword ptr [esi+250]
 0008457E    mov         dword ptr [ebp-8],eax
 00084581    cmp         byte ptr [esi+26E],5
>00084588    jne         000845A6
 0008458A    mov         eax,dword ptr [ebp+8]
 0008458D    push        eax
 0008458E    lea         ecx,[ebp-8]
 00084591    lea         edx,[esi+24C]
 00084597    mov         eax,esi
 00084599    mov         bx,0FFA7
 0008459D    call        @CallDynaInst
 000845A2    test        al,al
>000845A4    jne         000845CB
 000845A6    cmp         byte ptr [esi+26E],4
>000845AD    jne         000845D4
 000845AF    mov         eax,dword ptr [ebp+8]
 000845B2    push        eax
 000845B3    lea         ecx,[ebp-8]
 000845B6    lea         edx,[esi+24C]
 000845BC    mov         eax,esi
 000845BE    mov         bx,0FFA6
 000845C2    call        @CallDynaInst
 000845C7    test        al,al
>000845C9    je          000845D4
 000845CB    mov         eax,dword ptr [ebp-8]
 000845CE    mov         dword ptr [esi+250],eax
 000845D4    mov         eax,esi
 000845D6    call        TCustomGrid.DrawMove
 000845DB    pop         edi
 000845DC    pop         esi
 000845DD    pop         ebx
 000845DE    pop         ecx
 000845DF    pop         ecx
 000845E0    pop         ebp
 000845E1    ret         10
*}
end;

//000845E4
function TCustomGrid.GetColWidths(Index:Longint):Integer;
begin
{*
 000845E4    mov         ecx,dword ptr [eax+200]
 000845EA    test        ecx,ecx
>000845EC    je          000845F6
 000845EE    cmp         edx,dword ptr [eax+1FC]
>000845F4    jl          000845FD
 000845F6    mov         eax,dword ptr [eax+210]
 000845FC    ret
 000845FD    mov         eax,dword ptr [ecx+edx*4+4]
 00084601    ret
*}
end;

//00084604
function TCustomGrid.GetRowHeights(Index:Longint):Integer;
begin
{*
 00084604    mov         ecx,dword ptr [eax+230]
 0008460A    test        ecx,ecx
>0008460C    je          00084616
 0008460E    cmp         edx,dword ptr [eax+22C]
>00084614    jl          0008461D
 00084616    mov         eax,dword ptr [eax+214]
 0008461C    ret
 0008461D    mov         eax,dword ptr [ecx+edx*4+4]
 00084621    ret
*}
end;

//00084624
function TCustomGrid.GetSelection:TGridRect;
begin
{*
 00084624    push        ebx
 00084625    push        esi
 00084626    mov         esi,edx
 00084628    mov         ebx,eax
 0008462A    mov         ecx,esi
 0008462C    lea         edx,[ebx+1F0]
 00084632    lea         eax,[ebx+208]
 00084638    call        GridRect
 0008463D    pop         esi
 0008463E    pop         ebx
 0008463F    ret
*}
end;

//00084640
function TCustomGrid.GetTabStops(Index:Longint):Boolean;
begin
{*
 00084640    mov         ecx,dword ptr [eax+204]
 00084646    test        ecx,ecx
>00084648    jne         0008464D
 0008464A    mov         al,1
 0008464C    ret
 0008464D    mov         al,byte ptr [ecx+edx*4+4]
 00084651    ret
*}
end;

//00084654
function TCustomGrid.GetVisibleColCount:Integer;
begin
{*
 00084654    push        ebx
 00084655    add         esp,0FFFFFFA8
 00084658    mov         ebx,eax
 0008465A    mov         edx,esp
 0008465C    mov         eax,ebx
 0008465E    call        TCustomGrid.CalcDrawInfo
 00084663    mov         eax,dword ptr [esp+10]
 00084667    sub         eax,dword ptr [ebx+238]
 0008466D    inc         eax
 0008466E    add         esp,58
 00084671    pop         ebx
 00084672    ret
*}
end;

//00084674
function TCustomGrid.GetVisibleRowCount:Integer;
begin
{*
 00084674    push        ebx
 00084675    add         esp,0FFFFFFA8
 00084678    mov         ebx,eax
 0008467A    mov         edx,esp
 0008467C    mov         eax,ebx
 0008467E    call        TCustomGrid.CalcDrawInfo
 00084683    mov         eax,dword ptr [esp+3C]
 00084687    sub         eax,dword ptr [ebx+23C]
 0008468D    inc         eax
 0008468E    add         esp,58
 00084691    pop         ebx
 00084692    ret
*}
end;

//00084694
procedure TCustomGrid.SetBorderStyle(Value:TBorderStyle);
begin
{*
 00084694    cmp         dl,byte ptr [eax+1F8]
>0008469A    je          000846A7
 0008469C    mov         byte ptr [eax+1F8],dl
 000846A2    call        TWinControl.RecreateWnd
 000846A7    ret
*}
end;

//000846A8
procedure TCustomGrid.SetCol(Value:Longint);
begin
{*
 000846A8    cmp         edx,dword ptr [eax+208]
>000846AE    je          000846BD
 000846B0    push        1
 000846B2    mov         ecx,dword ptr [eax+20C]
 000846B8    call        TCustomGrid.FocusCell
 000846BD    ret
*}
end;

//000846C0
procedure TCustomGrid.SetColCount(Value:Longint);
begin
{*
 000846C0    push        ebx
 000846C1    push        esi
 000846C2    mov         esi,edx
 000846C4    mov         ebx,eax
 000846C6    cmp         esi,dword ptr [ebx+1FC]
>000846CC    je          00084716
 000846CE    cmp         esi,1
>000846D1    jge         000846D8
 000846D3    mov         esi,1
 000846D8    cmp         esi,dword ptr [ebx+218]
>000846DE    jg          000846EA
 000846E0    mov         edx,esi
 000846E2    dec         edx
 000846E3    mov         eax,ebx
 000846E5    call        TCustomGrid.SetFixedCols
 000846EA    mov         ecx,dword ptr [ebx+22C]
 000846F0    mov         edx,esi
 000846F2    mov         eax,ebx
 000846F4    call        TCustomGrid.ChangeSize
 000846F9    test        byte ptr [ebx+229],10
>00084700    je          00084716
 00084702    mov         eax,dword ptr [ebx+1FC]
 00084708    dec         eax
 00084709    mov         dword ptr [ebx+1F0],eax
 0008470F    mov         eax,ebx
 00084711    mov         edx,dword ptr [eax]
 00084713    call        dword ptr [edx+78]
 00084716    pop         esi
 00084717    pop         ebx
 00084718    ret
*}
end;

//0008471C
procedure TCustomGrid.SetColWidths(Index:Longint; Value:Integer);
begin
{*
 0008471C    push        ebp
 0008471D    mov         ebp,esp
 0008471F    push        0
 00084721    push        ebx
 00084722    push        esi
 00084723    push        edi
 00084724    mov         edi,ecx
 00084726    mov         esi,edx
 00084728    mov         ebx,eax
 0008472A    xor         eax,eax
 0008472C    push        ebp
 0008472D    push        847C0
 00084732    push        dword ptr fs:[eax]
 00084735    mov         dword ptr fs:[eax],esp
 00084738    cmp         dword ptr [ebx+200],0
>0008473F    jne         00084758
 00084741    lea         eax,[ebx+200]
 00084747    mov         ecx,dword ptr [ebx+210]
 0008474D    mov         edx,dword ptr [ebx+1FC]
 00084753    call        UpdateExtents
 00084758    cmp         esi,dword ptr [ebx+1FC]
>0008475E    jl          00084775
 00084760    lea         edx,[ebp-4]
 00084763    mov         eax,[000B5A2C];^SIndexOutOfRange:TResStringRec
 00084768    call        LoadResString
 0008476D    mov         eax,dword ptr [ebp-4]
 00084770    call        InvalidOp
 00084775    mov         eax,dword ptr [ebx+200]
 0008477B    mov         eax,dword ptr [eax+esi*4+4]
 0008477F    cmp         edi,eax
>00084781    je          000847AA
 00084783    push        edi
 00084784    mov         edx,dword ptr [ebx+200]
 0008478A    mov         ecx,eax
 0008478C    mov         edx,esi
 0008478E    mov         eax,ebx
 00084790    call        TCustomGrid.ResizeCol
 00084795    mov         eax,dword ptr [ebx+200]
 0008479B    mov         dword ptr [eax+esi*4+4],edi
 0008479F    mov         eax,ebx
 000847A1    mov         bx,0FFAB
 000847A5    call        @CallDynaInst
 000847AA    xor         eax,eax
 000847AC    pop         edx
 000847AD    pop         ecx
 000847AE    pop         ecx
 000847AF    mov         dword ptr fs:[eax],edx
 000847B2    push        847C7
 000847B7    lea         eax,[ebp-4]
 000847BA    call        @LStrClr
 000847BF    ret
>000847C0    jmp         @HandleFinally
>000847C5    jmp         000847B7
 000847C7    pop         edi
 000847C8    pop         esi
 000847C9    pop         ebx
 000847CA    pop         ecx
 000847CB    pop         ebp
 000847CC    ret
*}
end;

//000847D0
procedure TCustomGrid.SetDefaultColWidth(Value:Integer);
begin
{*
 000847D0    push        ebx
 000847D1    push        esi
 000847D2    mov         ebx,edx
 000847D4    mov         esi,eax
 000847D6    cmp         dword ptr [esi+200],0
>000847DD    je          000847EE
 000847DF    lea         eax,[esi+200]
 000847E5    xor         ecx,ecx
 000847E7    xor         edx,edx
 000847E9    call        UpdateExtents
 000847EE    mov         dword ptr [esi+210],ebx
 000847F4    mov         eax,esi
 000847F6    mov         bx,0FFAB
 000847FA    call        @CallDynaInst
 000847FF    mov         eax,esi
 00084801    call        TCustomGrid.InvalidateGrid
 00084806    pop         esi
 00084807    pop         ebx
 00084808    ret
*}
end;

//0008480C
procedure TCustomGrid.SetDefaultRowHeight(Value:Integer);
begin
{*
 0008480C    push        ebx
 0008480D    push        esi
 0008480E    mov         ebx,edx
 00084810    mov         esi,eax
 00084812    cmp         dword ptr [esi+230],0
>00084819    je          0008482A
 0008481B    lea         eax,[esi+230]
 00084821    xor         ecx,ecx
 00084823    xor         edx,edx
 00084825    call        UpdateExtents
 0008482A    mov         dword ptr [esi+214],ebx
 00084830    mov         eax,esi
 00084832    mov         bx,0FFAA
 00084836    call        @CallDynaInst
 0008483B    mov         eax,esi
 0008483D    call        TCustomGrid.InvalidateGrid
 00084842    pop         esi
 00084843    pop         ebx
 00084844    ret
*}
end;

//00084848
procedure TCustomGrid.SetFixedColor(Value:TColor);
begin
{*
 00084848    cmp         edx,dword ptr [eax+220]
>0008484E    je          0008485B
 00084850    mov         dword ptr [eax+220],edx
 00084856    call        TCustomGrid.InvalidateGrid
 0008485B    ret
*}
end;

//0008485C
procedure TCustomGrid.SetFixedCols(Value:Integer);
begin
{*
 0008485C    push        ebp
 0008485D    mov         ebp,esp
 0008485F    push        0
 00084861    push        ebx
 00084862    push        esi
 00084863    mov         esi,edx
 00084865    mov         ebx,eax
 00084867    xor         eax,eax
 00084869    push        ebp
 0008486A    push        848DD
 0008486F    push        dword ptr fs:[eax]
 00084872    mov         dword ptr fs:[eax],esp
 00084875    cmp         esi,dword ptr [ebx+218]
>0008487B    je          000848C7
 0008487D    test        esi,esi
>0008487F    jge         00084896
 00084881    lea         edx,[ebp-4]
 00084884    mov         eax,[000B5A2C];^SIndexOutOfRange:TResStringRec
 00084889    call        LoadResString
 0008488E    mov         eax,dword ptr [ebp-4]
 00084891    call        InvalidOp
 00084896    cmp         esi,dword ptr [ebx+1FC]
>0008489C    jl          000848B3
 0008489E    lea         edx,[ebp-4]
 000848A1    mov         eax,[000B56E4];^SFixedColTooBig:TResStringRec
 000848A6    call        LoadResString
 000848AB    mov         eax,dword ptr [ebp-4]
 000848AE    call        InvalidOp
 000848B3    mov         dword ptr [ebx+218],esi
 000848B9    mov         eax,ebx
 000848BB    call        TCustomGrid.Initialize
 000848C0    mov         eax,ebx
 000848C2    call        TCustomGrid.InvalidateGrid
 000848C7    xor         eax,eax
 000848C9    pop         edx
 000848CA    pop         ecx
 000848CB    pop         ecx
 000848CC    mov         dword ptr fs:[eax],edx
 000848CF    push        848E4
 000848D4    lea         eax,[ebp-4]
 000848D7    call        @LStrClr
 000848DC    ret
>000848DD    jmp         @HandleFinally
>000848E2    jmp         000848D4
 000848E4    pop         esi
 000848E5    pop         ebx
 000848E6    pop         ecx
 000848E7    pop         ebp
 000848E8    ret
*}
end;

//000848EC
procedure TCustomGrid.SetFixedRows(Value:Integer);
begin
{*
 000848EC    push        ebp
 000848ED    mov         ebp,esp
 000848EF    push        0
 000848F1    push        ebx
 000848F2    push        esi
 000848F3    mov         esi,edx
 000848F5    mov         ebx,eax
 000848F7    xor         eax,eax
 000848F9    push        ebp
 000848FA    push        8496D
 000848FF    push        dword ptr fs:[eax]
 00084902    mov         dword ptr fs:[eax],esp
 00084905    cmp         esi,dword ptr [ebx+21C]
>0008490B    je          00084957
 0008490D    test        esi,esi
>0008490F    jge         00084926
 00084911    lea         edx,[ebp-4]
 00084914    mov         eax,[000B5A2C];^SIndexOutOfRange:TResStringRec
 00084919    call        LoadResString
 0008491E    mov         eax,dword ptr [ebp-4]
 00084921    call        InvalidOp
 00084926    cmp         esi,dword ptr [ebx+22C]
>0008492C    jl          00084943
 0008492E    lea         edx,[ebp-4]
 00084931    mov         eax,[000B5A08];^SFixedRowTooBig:TResStringRec
 00084936    call        LoadResString
 0008493B    mov         eax,dword ptr [ebp-4]
 0008493E    call        InvalidOp
 00084943    mov         dword ptr [ebx+21C],esi
 00084949    mov         eax,ebx
 0008494B    call        TCustomGrid.Initialize
 00084950    mov         eax,ebx
 00084952    call        TCustomGrid.InvalidateGrid
 00084957    xor         eax,eax
 00084959    pop         edx
 0008495A    pop         ecx
 0008495B    pop         ecx
 0008495C    mov         dword ptr fs:[eax],edx
 0008495F    push        84974
 00084964    lea         eax,[ebp-4]
 00084967    call        @LStrClr
 0008496C    ret
>0008496D    jmp         @HandleFinally
>00084972    jmp         00084964
 00084974    pop         esi
 00084975    pop         ebx
 00084976    pop         ecx
 00084977    pop         ebp
 00084978    ret
*}
end;

//0008497C
procedure TCustomGrid.SetEditorMode(Value:Boolean);
begin
{*
 0008497C    push        ebx
 0008497D    mov         ebx,eax
 0008497F    test        dl,dl
>00084981    jne         0008498C
 00084983    mov         eax,ebx
 00084985    call        TCustomGrid.HideEditor
 0008498A    pop         ebx
 0008498B    ret
 0008498C    mov         eax,ebx
 0008498E    call        TCustomGrid.ShowEditor
 00084993    mov         eax,dword ptr [ebx+25C]
 00084999    test        eax,eax
>0008499B    je          000849A2
 0008499D    call        TInplaceEdit.Deselect
 000849A2    pop         ebx
 000849A3    ret
*}
end;

//000849A4
procedure TCustomGrid.SetGridLineWidth(Value:Integer);
begin
{*
 000849A4    cmp         edx,dword ptr [eax+224]
>000849AA    je          000849B7
 000849AC    mov         dword ptr [eax+224],edx
 000849B2    call        TCustomGrid.InvalidateGrid
 000849B7    ret
*}
end;

//000849B8
procedure TCustomGrid.SetOptions(Value:TGridOptions);
begin
{*
 000849B8    push        ebx
 000849B9    push        ecx
 000849BA    mov         word ptr [esp],dx
 000849BE    mov         ebx,eax
 000849C0    mov         ax,word ptr [esp]
 000849C4    cmp         ax,word ptr [ebx+228]
>000849CB    je          00084A2A
 000849CD    test        byte ptr [esp+1],10
>000849D2    je          000849DA
 000849D4    and         word ptr [esp],0DFFF
 000849DA    mov         ax,word ptr [esp]
 000849DE    mov         word ptr [ebx+228],ax
 000849E5    cmp         byte ptr [ebx+26D],0
>000849EC    jne         00084A05
 000849EE    test        byte ptr [esp+1],20
>000849F3    je          000849FE
 000849F5    mov         eax,ebx
 000849F7    call        TCustomGrid.ShowEditor
>000849FC    jmp         00084A05
 000849FE    mov         eax,ebx
 00084A00    call        TCustomGrid.HideEditor
 00084A05    test        byte ptr [esp+1],10
>00084A0A    je          00084A23
 00084A0C    push        1
 00084A0E    push        0
 00084A10    mov         ecx,dword ptr [ebx+20C]
 00084A16    mov         edx,dword ptr [ebx+208]
 00084A1C    mov         eax,ebx
 00084A1E    call        TCustomGrid.MoveCurrent
 00084A23    mov         eax,ebx
 00084A25    call        TCustomGrid.InvalidateGrid
 00084A2A    pop         edx
 00084A2B    pop         ebx
 00084A2C    ret
*}
end;

//00084A30
procedure TCustomGrid.SetRow(Value:Longint);
begin
{*
 00084A30    cmp         edx,dword ptr [eax+20C]
>00084A36    je          00084A47
 00084A38    push        1
 00084A3A    mov         ecx,edx
 00084A3C    mov         edx,dword ptr [eax+208]
 00084A42    call        TCustomGrid.FocusCell
 00084A47    ret
*}
end;

//00084A48
procedure TCustomGrid.SetRowCount(Value:Longint);
begin
{*
 00084A48    push        ebx
 00084A49    push        esi
 00084A4A    mov         esi,edx
 00084A4C    mov         ebx,eax
 00084A4E    cmp         esi,dword ptr [ebx+22C]
>00084A54    je          00084A81
 00084A56    cmp         esi,1
>00084A59    jge         00084A60
 00084A5B    mov         esi,1
 00084A60    cmp         esi,dword ptr [ebx+21C]
>00084A66    jg          00084A72
 00084A68    mov         edx,esi
 00084A6A    dec         edx
 00084A6B    mov         eax,ebx
 00084A6D    call        TCustomGrid.SetFixedRows
 00084A72    mov         ecx,esi
 00084A74    mov         edx,dword ptr [ebx+1FC]
 00084A7A    mov         eax,ebx
 00084A7C    call        TCustomGrid.ChangeSize
 00084A81    pop         esi
 00084A82    pop         ebx
 00084A83    ret
*}
end;

//00084A84
procedure TCustomGrid.SetRowHeights(Index:Longint; Value:Integer);
begin
{*
 00084A84    push        ebp
 00084A85    mov         ebp,esp
 00084A87    push        0
 00084A89    push        ebx
 00084A8A    push        esi
 00084A8B    push        edi
 00084A8C    mov         edi,ecx
 00084A8E    mov         esi,edx
 00084A90    mov         ebx,eax
 00084A92    xor         eax,eax
 00084A94    push        ebp
 00084A95    push        84B28
 00084A9A    push        dword ptr fs:[eax]
 00084A9D    mov         dword ptr fs:[eax],esp
 00084AA0    cmp         dword ptr [ebx+230],0
>00084AA7    jne         00084AC0
 00084AA9    lea         eax,[ebx+230]
 00084AAF    mov         ecx,dword ptr [ebx+214]
 00084AB5    mov         edx,dword ptr [ebx+22C]
 00084ABB    call        UpdateExtents
 00084AC0    cmp         esi,dword ptr [ebx+22C]
>00084AC6    jl          00084ADD
 00084AC8    lea         edx,[ebp-4]
 00084ACB    mov         eax,[000B5A2C];^SIndexOutOfRange:TResStringRec
 00084AD0    call        LoadResString
 00084AD5    mov         eax,dword ptr [ebp-4]
 00084AD8    call        InvalidOp
 00084ADD    mov         eax,dword ptr [ebx+230]
 00084AE3    mov         eax,dword ptr [eax+esi*4+4]
 00084AE7    cmp         edi,eax
>00084AE9    je          00084B12
 00084AEB    push        edi
 00084AEC    mov         edx,dword ptr [ebx+230]
 00084AF2    mov         ecx,eax
 00084AF4    mov         edx,esi
 00084AF6    mov         eax,ebx
 00084AF8    call        TCustomGrid.ResizeRow
 00084AFD    mov         eax,dword ptr [ebx+230]
 00084B03    mov         dword ptr [eax+esi*4+4],edi
 00084B07    mov         eax,ebx
 00084B09    mov         bx,0FFAA
 00084B0D    call        @CallDynaInst
 00084B12    xor         eax,eax
 00084B14    pop         edx
 00084B15    pop         ecx
 00084B16    pop         ecx
 00084B17    mov         dword ptr fs:[eax],edx
 00084B1A    push        84B2F
 00084B1F    lea         eax,[ebp-4]
 00084B22    call        @LStrClr
 00084B27    ret
>00084B28    jmp         @HandleFinally
>00084B2D    jmp         00084B1F
 00084B2F    pop         edi
 00084B30    pop         esi
 00084B31    pop         ebx
 00084B32    pop         ecx
 00084B33    pop         ebp
 00084B34    ret
*}
end;

//00084B38
procedure TCustomGrid.SetScrollBars(Value:TScrollStyle);
begin
{*
 00084B38    cmp         dl,byte ptr [eax+234]
>00084B3E    je          00084B4B
 00084B40    mov         byte ptr [eax+234],dl
 00084B46    call        TWinControl.RecreateWnd
 00084B4B    ret
*}
end;

//00084B4C
procedure TCustomGrid.SetSelection(Value:TGridRect);
begin
{*
 00084B4C    push        ebx
 00084B4D    push        esi
 00084B4E    push        edi
 00084B4F    add         esp,0FFFFFFE0
 00084B52    mov         esi,edx
 00084B54    lea         edi,[esp]
 00084B57    mov         ecx,4
 00084B5C    rep movs    dword ptr [edi],dword ptr [esi]
 00084B5E    mov         ebx,eax
 00084B60    lea         edx,[esp+10]
 00084B64    mov         eax,ebx
 00084B66    call        TCustomGrid.GetSelection
 00084B6B    mov         eax,dword ptr [esp]
 00084B6E    mov         dword ptr [ebx+1F0],eax
 00084B74    mov         eax,dword ptr [esp+4]
 00084B78    mov         dword ptr [ebx+1F4],eax
 00084B7E    mov         eax,dword ptr [esp+8]
 00084B82    mov         dword ptr [ebx+208],eax
 00084B88    mov         eax,dword ptr [esp+0C]
 00084B8C    mov         dword ptr [ebx+20C],eax
 00084B92    lea         edx,[esp+10]
 00084B96    mov         eax,ebx
 00084B98    call        TCustomGrid.SelectionMoved
 00084B9D    add         esp,20
 00084BA0    pop         edi
 00084BA1    pop         esi
 00084BA2    pop         ebx
 00084BA3    ret
*}
end;

//00084BA4
procedure TCustomGrid.SetTopRow(Value:Longint);
begin
{*
 00084BA4    cmp         edx,dword ptr [eax+23C]
>00084BAA    je          00084BB9
 00084BAC    mov         ecx,edx
 00084BAE    mov         edx,dword ptr [eax+238]
 00084BB4    call        TCustomGrid.MoveTopLeft
 00084BB9    ret
*}
end;

//00084BBC
procedure TCustomGrid.HideEdit;
begin
{*
 00084BBC    push        ebp
 00084BBD    mov         ebp,esp
 00084BBF    push        ecx
 00084BC0    mov         dword ptr [ebp-4],eax
 00084BC3    mov         eax,dword ptr [ebp-4]
 00084BC6    cmp         dword ptr [eax+25C],0
>00084BCD    je          00084C22
 00084BCF    xor         eax,eax
 00084BD1    push        ebp
 00084BD2    push        84C1B
 00084BD7    push        dword ptr fs:[eax]
 00084BDA    mov         dword ptr fs:[eax],esp
 00084BDD    mov         eax,dword ptr [ebp-4]
 00084BE0    call        TCustomGrid.UpdateText
 00084BE5    xor         eax,eax
 00084BE7    pop         edx
 00084BE8    pop         ecx
 00084BE9    pop         ecx
 00084BEA    mov         dword ptr fs:[eax],edx
 00084BED    push        84C22
 00084BF2    mov         eax,dword ptr [ebp-4]
 00084BF5    mov         dword ptr [eax+260],0FFFFFFFF
 00084BFF    mov         eax,dword ptr [ebp-4]
 00084C02    mov         dword ptr [eax+264],0FFFFFFFF
 00084C0C    mov         eax,dword ptr [ebp-4]
 00084C0F    mov         eax,dword ptr [eax+25C]
 00084C15    call        TInplaceEdit.Hide
 00084C1A    ret
>00084C1B    jmp         @HandleFinally
>00084C20    jmp         00084BF2
 00084C22    pop         ecx
 00084C23    pop         ebp
 00084C24    ret
*}
end;

//00084C28
procedure UpdateEditor;
begin
{*
 00084C28    push        ebp
 00084C29    mov         ebp,esp
 00084C2B    push        ebx
 00084C2C    mov         ebx,dword ptr [ebp+8]
 00084C2F    add         ebx,0FFFFFFFC
 00084C32    mov         eax,dword ptr [ebx]
 00084C34    mov         eax,dword ptr [eax+208]
 00084C3A    mov         edx,dword ptr [ebx]
 00084C3C    mov         dword ptr [edx+260],eax
 00084C42    mov         eax,dword ptr [ebx]
 00084C44    mov         eax,dword ptr [eax+20C]
 00084C4A    mov         edx,dword ptr [ebx]
 00084C4C    mov         dword ptr [edx+264],eax
 00084C52    mov         eax,dword ptr [ebx]
 00084C54    mov         eax,dword ptr [eax+25C]
 00084C5A    mov         edx,dword ptr [eax]
 00084C5C    call        dword ptr [edx+0F0]
 00084C62    mov         eax,dword ptr [ebx]
 00084C64    mov         eax,dword ptr [eax+25C]
 00084C6A    call        TCustomMaskEdit.GetMaxLength
 00084C6F    inc         eax
>00084C70    jne         00084C7D
 00084C72    mov         eax,dword ptr [ebx]
 00084C74    mov         byte ptr [eax+1F9],0
>00084C7B    jmp         00084C86
 00084C7D    mov         eax,dword ptr [ebx]
 00084C7F    mov         byte ptr [eax+1F9],1
 00084C86    mov         eax,dword ptr [ebx]
 00084C88    mov         eax,dword ptr [eax+25C]
 00084C8E    call        TCustomEdit.SelectAll
 00084C93    pop         ebx
 00084C94    pop         ebp
 00084C95    ret
*}
end;

//00084C98
procedure TCustomGrid.UpdateEdit;
begin
{*
 00084C98    push        ebp
 00084C99    mov         ebp,esp
 00084C9B    add         esp,0FFFFFFEC
 00084C9E    push        ebx
 00084C9F    mov         dword ptr [ebp-4],eax
 00084CA2    mov         eax,dword ptr [ebp-4]
 00084CA5    mov         edx,dword ptr [eax]
 00084CA7    call        dword ptr [edx+0C4]
 00084CAD    test        al,al
>00084CAF    je          00084D70
 00084CB5    mov         eax,dword ptr [ebp-4]
 00084CB8    cmp         dword ptr [eax+25C],0
>00084CBF    jne         00084CFB
 00084CC1    mov         eax,dword ptr [ebp-4]
 00084CC4    mov         edx,dword ptr [eax]
 00084CC6    call        dword ptr [edx+0C0]
 00084CCC    mov         ebx,eax
 00084CCE    mov         eax,dword ptr [ebp-4]
 00084CD1    mov         dword ptr [eax+25C],ebx
 00084CD7    mov         eax,ebx
 00084CD9    mov         edx,dword ptr [ebp-4]
 00084CDC    call        TInplaceEdit.SetGrid
 00084CE1    mov         eax,dword ptr [ebp-4]
 00084CE4    mov         eax,dword ptr [eax+25C]
 00084CEA    mov         edx,dword ptr [ebp-4]
 00084CED    mov         ecx,dword ptr [eax]
 00084CEF    call        dword ptr [ecx+64]
 00084CF2    push        ebp
 00084CF3    call        UpdateEditor
 00084CF8    pop         ecx
>00084CF9    jmp         00084D32
 00084CFB    mov         eax,dword ptr [ebp-4]
 00084CFE    mov         eax,dword ptr [eax+208]
 00084D04    mov         edx,dword ptr [ebp-4]
 00084D07    cmp         eax,dword ptr [edx+260]
>00084D0D    jne         00084D23
 00084D0F    mov         eax,dword ptr [ebp-4]
 00084D12    mov         eax,dword ptr [eax+20C]
 00084D18    mov         edx,dword ptr [ebp-4]
 00084D1B    cmp         eax,dword ptr [edx+264]
>00084D21    je          00084D32
 00084D23    mov         eax,dword ptr [ebp-4]
 00084D26    call        TCustomGrid.HideEdit
 00084D2B    push        ebp
 00084D2C    call        UpdateEditor
 00084D31    pop         ecx
 00084D32    mov         eax,dword ptr [ebp-4]
 00084D35    mov         edx,dword ptr [eax]
 00084D37    call        dword ptr [edx+0C4]
 00084D3D    test        al,al
>00084D3F    je          00084D70
 00084D41    lea         eax,[ebp-14]
 00084D44    push        eax
 00084D45    mov         eax,dword ptr [ebp-4]
 00084D48    mov         ecx,dword ptr [eax+20C]
 00084D4E    mov         eax,dword ptr [ebp-4]
 00084D51    mov         edx,dword ptr [eax+208]
 00084D57    mov         eax,dword ptr [ebp-4]
 00084D5A    call        TCustomGrid.CellRect
 00084D5F    lea         edx,[ebp-14]
 00084D62    mov         eax,dword ptr [ebp-4]
 00084D65    mov         eax,dword ptr [eax+25C]
 00084D6B    call        TInplaceEdit.Move
 00084D70    pop         ebx
 00084D71    mov         esp,ebp
 00084D73    pop         ebp
 00084D74    ret
*}
end;

//00084D78
procedure TCustomGrid.UpdateText;
begin
{*
 00084D78    push        ebp
 00084D79    mov         ebp,esp
 00084D7B    push        0
 00084D7D    push        ebx
 00084D7E    push        esi
 00084D7F    mov         ebx,eax
 00084D81    xor         eax,eax
 00084D83    push        ebp
 00084D84    push        84DDE
 00084D89    push        dword ptr fs:[eax]
 00084D8C    mov         dword ptr fs:[eax],esp
 00084D8F    mov         esi,dword ptr [ebx+260]
 00084D95    cmp         esi,0FFFFFFFF
>00084D98    je          00084DC8
 00084D9A    cmp         dword ptr [ebx+264],0FFFFFFFF
>00084DA1    je          00084DC8
 00084DA3    lea         edx,[ebp-4]
 00084DA6    mov         eax,dword ptr [ebx+25C]
 00084DAC    call        TCustomMaskEdit.GetText
 00084DB1    mov         eax,dword ptr [ebp-4]
 00084DB4    push        eax
 00084DB5    mov         ecx,dword ptr [ebx+264]
 00084DBB    mov         edx,esi
 00084DBD    mov         eax,ebx
 00084DBF    mov         bx,0FFB3
 00084DC3    call        @CallDynaInst
 00084DC8    xor         eax,eax
 00084DCA    pop         edx
 00084DCB    pop         ecx
 00084DCC    pop         ecx
 00084DCD    mov         dword ptr fs:[eax],edx
 00084DD0    push        84DE5
 00084DD5    lea         eax,[ebp-4]
 00084DD8    call        @LStrClr
 00084DDD    ret
>00084DDE    jmp         @HandleFinally
>00084DE3    jmp         00084DD5
 00084DE5    pop         esi
 00084DE6    pop         ebx
 00084DE7    pop         ecx
 00084DE8    pop         ebp
 00084DE9    ret
*}
end;

//00084DEC
procedure TCustomGrid.WMChar(var Msg:TWMChar);
begin
{*
 00084DEC    test        byte ptr [eax+229],4
>00084DF3    je          00084E0E
 00084DF5    mov         cl,byte ptr [edx+4]
 00084DF8    sub         cl,8
>00084DFB    je          00084E05
 00084DFD    add         cl,0E8
 00084E00    sub         cl,0E0
>00084E03    jae         00084E0E
 00084E05    mov         dl,byte ptr [edx+4]
 00084E08    call        TCustomGrid.ShowEditorChar
 00084E0D    ret
 00084E0E    call        TWinControl.WMChar
 00084E13    ret
*}
end;

//00084E14
procedure TCustomGrid.WMCommand(var Message:TWMCommand);
begin
{*
 00084E14    push        ebx
 00084E15    push        esi
 00084E16    push        edi
 00084E17    mov         edi,edx
 00084E19    mov         ebx,eax
 00084E1B    mov         esi,dword ptr [ebx+25C]
 00084E21    test        esi,esi
>00084E23    je          00084E42
 00084E25    mov         eax,esi
 00084E27    call        TWinControl.GetHandle
 00084E2C    cmp         eax,dword ptr [edi+8]
>00084E2F    jne         00084E42
 00084E31    mov         ax,word ptr [edi+6]
 00084E35    sub         ax,300
>00084E39    jne         00084E42
 00084E3B    mov         eax,ebx
 00084E3D    call        TCustomGrid.UpdateText
 00084E42    pop         edi
 00084E43    pop         esi
 00084E44    pop         ebx
 00084E45    ret
*}
end;

//00084E48
procedure TCustomGrid.WMGetDlgCode(var Msg:TWMGetDlgCode);
begin
{*
 00084E48    mov         dword ptr [edx+0C],1
 00084E4F    test        byte ptr [eax+229],10
>00084E56    jne         00084E75
 00084E58    test        byte ptr [eax+229],8
>00084E5F    je          00084E65
 00084E61    or          dword ptr [edx+0C],2
 00084E65    test        byte ptr [eax+229],4
>00084E6C    je          00084E75
 00084E6E    or          dword ptr [edx+0C],80
 00084E75    ret
*}
end;

//00084E78
procedure TCustomGrid.WMKillFocus(var Msg:TWMKillFocus);
begin
{*
 00084E78    push        ebx
 00084E79    push        esi
 00084E7A    push        edi
 00084E7B    add         esp,0FFFFFFF0
 00084E7E    mov         esi,edx
 00084E80    mov         ebx,eax
 00084E82    mov         edx,esi
 00084E84    mov         eax,ebx
 00084E86    call        TWinControl.WMKillFocus
 00084E8B    mov         edx,esp
 00084E8D    mov         eax,ebx
 00084E8F    call        TCustomGrid.GetSelection
 00084E94    mov         edx,esp
 00084E96    mov         eax,ebx
 00084E98    call        TCustomGrid.InvalidateRect
 00084E9D    mov         edi,dword ptr [ebx+25C]
 00084EA3    test        edi,edi
>00084EA5    je          00084EBA
 00084EA7    mov         eax,edi
 00084EA9    call        TWinControl.GetHandle
 00084EAE    cmp         eax,dword ptr [esi+4]
>00084EB1    je          00084EBA
 00084EB3    mov         eax,ebx
 00084EB5    call        TCustomGrid.HideEdit
 00084EBA    add         esp,10
 00084EBD    pop         edi
 00084EBE    pop         esi
 00084EBF    pop         ebx
 00084EC0    ret
*}
end;

//00084EC4
procedure TCustomGrid.WMLButtonDown(var Message:TMessage);
begin
{*
 00084EC4    push        ebx
 00084EC5    mov         ebx,eax
 00084EC7    mov         eax,ebx
 00084EC9    call        TControl.WMLButtonDown
 00084ECE    cmp         dword ptr [ebx+25C],0
>00084ED5    je          00084EE8
 00084ED7    call        user32.GetMessageTime
 00084EDC    mov         edx,dword ptr [ebx+25C]
 00084EE2    mov         dword ptr [edx+224],eax
 00084EE8    pop         ebx
 00084EE9    ret
*}
end;

//00084EEC
procedure TCustomGrid.WMNCHitTest(var Msg:TWMNCHitTest);
begin
{*
 00084EEC    push        ebx
 00084EED    push        esi
 00084EEE    add         esp,0FFFFFFF0
 00084EF1    mov         esi,edx
 00084EF3    mov         ebx,eax
 00084EF5    mov         edx,esi
 00084EF7    mov         eax,ebx
 00084EF9    mov         ecx,dword ptr [eax]
 00084EFB    call        dword ptr [ecx-10]
 00084EFE    lea         edx,[esp+8]
 00084F02    mov         eax,dword ptr [esi+8]
 00084F05    call        SmallPointToPoint
 00084F0A    lea         edx,[esp+8]
 00084F0E    mov         ecx,esp
 00084F10    mov         eax,ebx
 00084F12    call        TControl.ScreenToClient
 00084F17    mov         eax,dword ptr [esp]
 00084F1A    mov         dword ptr [ebx+254],eax
 00084F20    mov         eax,dword ptr [esp+4]
 00084F24    mov         dword ptr [ebx+258],eax
 00084F2A    add         esp,10
 00084F2D    pop         esi
 00084F2E    pop         ebx
 00084F2F    ret
*}
end;

//00084F30
procedure TCustomGrid.WMSetCursor(var Msg:TWMSetCursor);
begin
{*
 00084F30    push        ebx
 00084F31    push        esi
 00084F32    push        edi
 00084F33    push        ebp
 00084F34    add         esp,0FFFFFF98
 00084F37    mov         edi,edx
 00084F39    mov         esi,eax
 00084F3B    xor         ebx,ebx
 00084F3D    cmp         word ptr [edi+8],1
>00084F42    jne         00084FBD
 00084F44    mov         al,byte ptr [esi+26E]
 00084F4A    test        al,al
>00084F4C    jne         00084F86
 00084F4E    lea         edx,[esp+10]
 00084F52    mov         eax,esi
 00084F54    call        TCustomGrid.CalcDrawInfo
 00084F59    push        esp
 00084F5A    lea         eax,[esp+8]
 00084F5E    push        eax
 00084F5F    lea         eax,[esp+10]
 00084F63    push        eax
 00084F64    lea         eax,[esp+18]
 00084F68    push        eax
 00084F69    lea         eax,[esp+20]
 00084F6D    push        eax
 00084F6E    mov         ecx,dword ptr [esi+258]
 00084F74    mov         edx,dword ptr [esi+254]
 00084F7A    mov         eax,esi
 00084F7C    mov         ebp,dword ptr [eax]
 00084F7E    call        dword ptr [ebp+0BC]
>00084F84    jmp         00084F89
 00084F86    mov         byte ptr [esp],al
 00084F89    cmp         byte ptr [esp],2
>00084F8D    jne         00084FA4
 00084F8F    mov         eax,[000B5BDC];^Screen:TScreen
 00084F94    mov         eax,dword ptr [eax]
 00084F96    mov         edx,0FFFFFFF1
 00084F9B    call        TScreen.GetCursors
 00084FA0    mov         ebx,eax
>00084FA2    jmp         00084FBD
 00084FA4    cmp         byte ptr [esp],3
>00084FA8    jne         00084FBD
 00084FAA    mov         eax,[000B5BDC];^Screen:TScreen
 00084FAF    mov         eax,dword ptr [eax]
 00084FB1    mov         edx,0FFFFFFF2
 00084FB6    call        TScreen.GetCursors
 00084FBB    mov         ebx,eax
 00084FBD    test        ebx,ebx
>00084FBF    je          00084FC9
 00084FC1    push        ebx
 00084FC2    call        user32.SetCursor
>00084FC7    jmp         00084FD2
 00084FC9    mov         edx,edi
 00084FCB    mov         eax,esi
 00084FCD    call        TWinControl.WMSetCursor
 00084FD2    add         esp,68
 00084FD5    pop         ebp
 00084FD6    pop         edi
 00084FD7    pop         esi
 00084FD8    pop         ebx
 00084FD9    ret
*}
end;

//00084FDC
procedure TCustomGrid.WMSetFocus(var Msg:TWMSetFocus);
begin
{*
 00084FDC    push        ebx
 00084FDD    push        esi
 00084FDE    push        edi
 00084FDF    add         esp,0FFFFFFF0
 00084FE2    mov         esi,edx
 00084FE4    mov         ebx,eax
 00084FE6    mov         edx,esi
 00084FE8    mov         eax,ebx
 00084FEA    call        TWinControl.WMSetFocus
 00084FEF    mov         edi,dword ptr [ebx+25C]
 00084FF5    test        edi,edi
>00084FF7    je          00085005
 00084FF9    mov         eax,edi
 00084FFB    call        TWinControl.GetHandle
 00085000    cmp         eax,dword ptr [esi+4]
>00085003    je          0008501E
 00085005    mov         edx,esp
 00085007    mov         eax,ebx
 00085009    call        TCustomGrid.GetSelection
 0008500E    mov         edx,esp
 00085010    mov         eax,ebx
 00085012    call        TCustomGrid.InvalidateRect
 00085017    mov         eax,ebx
 00085019    call        TCustomGrid.UpdateEdit
 0008501E    add         esp,10
 00085021    pop         edi
 00085022    pop         esi
 00085023    pop         ebx
 00085024    ret
*}
end;

//00085028
procedure TCustomGrid.WMSize(var Msg:TWMSize);
begin
{*
 00085028    push        ebx
 00085029    push        esi
 0008502A    mov         esi,eax
 0008502C    mov         eax,esi
 0008502E    call        TWinControl.WMSize
 00085033    mov         eax,esi
 00085035    call        TCustomGrid.UpdateScrollRange
 0008503A    mov         eax,esi
 0008503C    mov         bx,0FFCF
 00085040    call        @CallDynaInst
 00085045    test        al,al
>00085047    je          00085050
 00085049    mov         eax,esi
 0008504B    mov         edx,dword ptr [eax]
 0008504D    call        dword ptr [edx+78]
 00085050    pop         esi
 00085051    pop         ebx
 00085052    ret
*}
end;

//00085054
procedure TCustomGrid.WMVScroll(var Msg:TWMVScroll);
begin
{*
 00085054    movsx       ecx,word ptr [edx+6]
 00085058    push        ecx
 00085059    push        1
 0008505B    movsx       ecx,word ptr [edx+4]
 0008505F    mov         edx,1
 00085064    call        TCustomGrid.ModifyScrollBar
 00085069    ret
*}
end;

//0008506C
procedure TCustomGrid.WMHScroll(var Msg:TWMHScroll);
begin
{*
 0008506C    movsx       ecx,word ptr [edx+6]
 00085070    push        ecx
 00085071    push        1
 00085073    movsx       ecx,word ptr [edx+4]
 00085077    xor         edx,edx
 00085079    call        TCustomGrid.ModifyScrollBar
 0008507E    ret
*}
end;

//00085080
procedure TCustomGrid.CancelMode;
begin
{*
 00085080    push        ebp
 00085081    mov         ebp,esp
 00085083    add         esp,0FFFFFFA4
 00085086    mov         dword ptr [ebp-4],eax
 00085089    xor         eax,eax
 0008508B    push        ebp
 0008508C    push        85109
 00085091    push        dword ptr fs:[eax]
 00085094    mov         dword ptr fs:[eax],esp
 00085097    mov         eax,dword ptr [ebp-4]
 0008509A    mov         al,byte ptr [eax+26E]
 000850A0    dec         al
>000850A2    je          000850AF
 000850A4    dec         eax
 000850A5    sub         al,2
>000850A7    jb          000850C1
 000850A9    sub         al,2
>000850AB    jb          000850D9
>000850AD    jmp         000850F1
 000850AF    push        1
 000850B1    mov         eax,dword ptr [ebp-4]
 000850B4    call        TWinControl.GetHandle
 000850B9    push        eax
 000850BA    call        user32.KillTimer
>000850BF    jmp         000850F1
 000850C1    lea         edx,[ebp-5C]
 000850C4    mov         eax,dword ptr [ebp-4]
 000850C7    call        TCustomGrid.CalcDrawInfo
 000850CC    lea         edx,[ebp-5C]
 000850CF    mov         eax,dword ptr [ebp-4]
 000850D2    call        TCustomGrid.DrawSizingLine
>000850D7    jmp         000850F1
 000850D9    mov         eax,dword ptr [ebp-4]
 000850DC    call        TCustomGrid.DrawMove
 000850E1    push        1
 000850E3    mov         eax,dword ptr [ebp-4]
 000850E6    call        TWinControl.GetHandle
 000850EB    push        eax
 000850EC    call        user32.KillTimer
 000850F1    xor         eax,eax
 000850F3    pop         edx
 000850F4    pop         ecx
 000850F5    pop         ecx
 000850F6    mov         dword ptr fs:[eax],edx
 000850F9    push        85110
 000850FE    mov         eax,dword ptr [ebp-4]
 00085101    mov         byte ptr [eax+26E],0
 00085108    ret
>00085109    jmp         @HandleFinally
>0008510E    jmp         000850FE
 00085110    mov         esp,ebp
 00085112    pop         ebp
 00085113    ret
*}
end;

//00085114
procedure TCustomGrid.WMCancelMode(var Msg:TWMCancelMode);
begin
{*
 00085114    push        ebx
 00085115    mov         ebx,eax
 00085117    mov         eax,ebx
 00085119    call        TControl.WMCancelMode
 0008511E    mov         eax,ebx
 00085120    call        TCustomGrid.CancelMode
 00085125    pop         ebx
 00085126    ret
*}
end;

//00085128
procedure TCustomGrid.CMCancelMode(var Msg:TMessage);
begin
{*
 00085128    push        ebx
 00085129    push        esi
 0008512A    mov         esi,edx
 0008512C    mov         ebx,eax
 0008512E    mov         eax,dword ptr [ebx+25C]
 00085134    test        eax,eax
>00085136    je          0008513F
 00085138    mov         edx,esi
 0008513A    mov         ecx,dword ptr [eax]
 0008513C    call        dword ptr [ecx+70]
 0008513F    mov         edx,esi
 00085141    mov         eax,ebx
 00085143    mov         ecx,dword ptr [eax]
 00085145    call        dword ptr [ecx-10]
 00085148    mov         eax,ebx
 0008514A    call        TCustomGrid.CancelMode
 0008514F    pop         esi
 00085150    pop         ebx
 00085151    ret
*}
end;

//00085154
procedure TCustomGrid.CMFontChanged(var Message:TMessage);
begin
{*
 00085154    push        ebx
 00085155    push        esi
 00085156    mov         esi,edx
 00085158    mov         ebx,eax
 0008515A    mov         eax,dword ptr [ebx+25C]
 00085160    test        eax,eax
>00085162    je          0008516C
 00085164    mov         edx,dword ptr [ebx+58]
 00085167    call        TControl.SetFont
 0008516C    mov         edx,esi
 0008516E    mov         eax,ebx
 00085170    call        TWinControl.CMFontChanged
 00085175    pop         esi
 00085176    pop         ebx
 00085177    ret
*}
end;

//00085178
procedure TCustomGrid.CMCtl3DChanged(var Message:TMessage);
begin
{*
 00085178    push        ebx
 00085179    mov         ebx,eax
 0008517B    mov         eax,ebx
 0008517D    call        TWinControl.CMCtl3DChanged
 00085182    mov         eax,ebx
 00085184    call        TWinControl.RecreateWnd
 00085189    pop         ebx
 0008518A    ret
*}
end;

//0008518C
procedure TCustomGrid.CMDesignHitTest(var Msg:TCMDesignHitTest);
begin
{*
 0008518C    push        ebx
 0008518D    push        esi
 0008518E    mov         ebx,edx
 00085190    mov         esi,eax
 00085192    movsx       ecx,word ptr [ebx+0A]
 00085196    movsx       edx,word ptr [ebx+8]
 0008519A    mov         eax,esi
 0008519C    call        TCustomGrid.Sizing
 000851A1    neg         al
 000851A3    sbb         eax,eax
 000851A5    mov         dword ptr [ebx+0C],eax
 000851A8    pop         esi
 000851A9    pop         ebx
 000851AA    ret
*}
end;

//000851AC
procedure TCustomGrid.CMWantSpecialKey(var Msg:TCMWantSpecialKey);
begin
{*
 000851AC    push        ebx
 000851AD    push        esi
 000851AE    mov         esi,edx
 000851B0    mov         ebx,eax
 000851B2    mov         edx,esi
 000851B4    mov         eax,ebx
 000851B6    mov         ecx,dword ptr [eax]
 000851B8    call        dword ptr [ecx-10]
 000851BB    test        byte ptr [ebx+229],4
>000851C2    je          000851D1
 000851C4    cmp         byte ptr [esi+4],0D
>000851C8    jne         000851D1
 000851CA    mov         dword ptr [esi+0C],1
 000851D1    pop         esi
 000851D2    pop         ebx
 000851D3    ret
*}
end;

//000851D4
procedure TCustomGrid.TimedScroll(Direction:TGridScrollDirection);
begin
{*
 000851D4    add         esp,0FFFFFFEC
 000851D7    mov         byte ptr [esp],dl
 000851DA    mov         edx,dword ptr [eax+1F0]
 000851E0    mov         dword ptr [esp+0C],edx
 000851E4    mov         edx,dword ptr [eax+1F4]
 000851EA    mov         dword ptr [esp+10],edx
 000851EE    mov         edx,dword ptr [eax+1FC]
 000851F4    dec         edx
 000851F5    mov         dword ptr [esp+4],edx
 000851F9    mov         edx,dword ptr [eax+22C]
 000851FF    dec         edx
 00085200    mov         dword ptr [esp+8],edx
 00085204    test        byte ptr [esp],1
>00085208    je          0008521C
 0008520A    mov         edx,dword ptr [eax+1F0]
 00085210    cmp         edx,dword ptr [eax+218]
>00085216    jle         0008521C
 00085218    dec         dword ptr [esp+0C]
 0008521C    test        byte ptr [esp],2
>00085220    je          00085232
 00085222    mov         edx,dword ptr [eax+1F0]
 00085228    cmp         edx,dword ptr [esp+4]
>0008522C    jge         00085232
 0008522E    inc         dword ptr [esp+0C]
 00085232    test        byte ptr [esp],4
>00085236    je          0008524A
 00085238    mov         edx,dword ptr [eax+1F4]
 0008523E    cmp         edx,dword ptr [eax+21C]
>00085244    jle         0008524A
 00085246    dec         dword ptr [esp+10]
 0008524A    test        byte ptr [esp],8
>0008524E    je          00085260
 00085250    mov         edx,dword ptr [eax+1F4]
 00085256    cmp         edx,dword ptr [esp+8]
>0008525A    jge         00085260
 0008525C    inc         dword ptr [esp+10]
 00085260    mov         edx,dword ptr [eax+1F0]
 00085266    cmp         edx,dword ptr [esp+0C]
>0008526A    jne         00085278
 0008526C    mov         edx,dword ptr [eax+1F4]
 00085272    cmp         edx,dword ptr [esp+10]
>00085276    je          00085281
 00085278    lea         edx,[esp+0C]
 0008527C    call        TCustomGrid.MoveAnchor
 00085281    add         esp,14
 00085284    ret
*}
end;

//00085288
procedure TCustomGrid.WMTimer(var Msg:TWMTimer);
begin
{*
 00085288    push        ebx
 00085289    push        esi
 0008528A    add         esp,0FFFFFF8C
 0008528D    mov         esi,eax
 0008528F    mov         al,byte ptr [esi+26E]
 00085295    sub         al,1
>00085297    je          000852A3
 00085299    add         al,0FD
 0008529B    sub         al,2
>0008529D    jae         000853E3
 000852A3    push        esp
 000852A4    call        user32.GetCursorPos
 000852A9    lea         ecx,[esp+6C]
 000852AD    mov         edx,esp
 000852AF    mov         eax,esi
 000852B1    call        TControl.ScreenToClient
 000852B6    mov         eax,dword ptr [esp+6C]
 000852BA    mov         dword ptr [esp],eax
 000852BD    mov         eax,dword ptr [esp+70]
 000852C1    mov         dword ptr [esp+4],eax
 000852C5    lea         edx,[esp+14]
 000852C9    mov         eax,esi
 000852CB    call        TCustomGrid.CalcDrawInfo
 000852D0    mov         al,[000853EC]
 000852D5    mov         byte ptr [esp+8],al
 000852D9    lea         eax,[esp+14]
 000852DD    push        eax
 000852DE    lea         eax,[esp+10]
 000852E2    push        eax
 000852E3    mov         ecx,dword ptr [esp+0C]
 000852E7    mov         edx,dword ptr [esp+8]
 000852EB    mov         eax,esi
 000852ED    call        TCustomGrid.CalcCoordFromPoint
 000852F2    mov         al,byte ptr [esi+26E]
 000852F8    dec         al
>000852FA    je          00085352
 000852FC    sub         al,3
>000852FE    je          0008532D
 00085300    dec         al
>00085302    jne         000853E3
 00085308    lea         eax,[esp+14]
 0008530C    push        eax
 0008530D    lea         eax,[esp+18]
 00085311    push        eax
 00085312    push        0
 00085314    lea         eax,[esp+0C]
 00085318    push        eax
 00085319    mov         ecx,dword ptr [esp+1C]
 0008531D    mov         edx,dword ptr [esp+10]
 00085321    mov         eax,esi
 00085323    call        TCustomGrid.MoveAndScroll
>00085328    jmp         000853E3
 0008532D    lea         eax,[esp+14]
 00085331    push        eax
 00085332    lea         eax,[esp+44]
 00085336    push        eax
 00085337    push        1
 00085339    lea         eax,[esp+0C]
 0008533D    push        eax
 0008533E    mov         ecx,dword ptr [esp+20]
 00085342    mov         edx,dword ptr [esp+14]
 00085346    mov         eax,esi
 00085348    call        TCustomGrid.MoveAndScroll
>0008534D    jmp         000853E3
 00085352    mov         eax,esi
 00085354    mov         bx,0FFCF
 00085358    call        @CallDynaInst
 0008535D    test        al,al
>0008535F    jne         0008537E
 00085361    mov         eax,dword ptr [esp]
 00085364    cmp         eax,dword ptr [esp+18]
>00085368    jge         00085371
 0008536A    or          byte ptr [esp+8],1
>0008536F    jmp         000853AD
 00085371    cmp         eax,dword ptr [esp+28]
>00085375    jle         000853AD
 00085377    or          byte ptr [esp+8],2
>0008537C    jmp         000853AD
 0008537E    mov         eax,esi
 00085380    call        TControl.GetClientWidth
 00085385    mov         ebx,eax
 00085387    sub         ebx,dword ptr [esp+28]
 0008538B    mov         eax,esi
 0008538D    call        TControl.GetClientWidth
 00085392    sub         eax,dword ptr [esp+18]
 00085396    mov         edx,dword ptr [esp]
 00085399    cmp         ebx,edx
>0008539B    jle         000853A4
 0008539D    or          byte ptr [esp+8],2
>000853A2    jmp         000853AD
 000853A4    cmp         eax,edx
>000853A6    jge         000853AD
 000853A8    or          byte ptr [esp+8],1
 000853AD    mov         eax,dword ptr [esp+4]
 000853B1    cmp         eax,dword ptr [esp+44]
>000853B5    jge         000853BE
 000853B7    or          byte ptr [esp+8],4
>000853BC    jmp         000853C9
 000853BE    cmp         eax,dword ptr [esp+54]
>000853C2    jle         000853C9
 000853C4    or          byte ptr [esp+8],8
 000853C9    mov         al,[000853EC]
 000853CE    cmp         al,byte ptr [esp+8]
>000853D2    je          000853E3
 000853D4    mov         dl,byte ptr [esp+8]
 000853D8    mov         eax,esi
 000853DA    mov         bx,0FFAC
 000853DE    call        @CallDynaInst
 000853E3    add         esp,74
 000853E6    pop         esi
 000853E7    pop         ebx
 000853E8    ret
*}
end;

//000853F0
procedure TCustomGrid.ColWidthsChanged;
begin
{*
 000853F0    push        ebx
 000853F1    mov         ebx,eax
 000853F3    mov         eax,ebx
 000853F5    call        TCustomGrid.UpdateScrollRange
 000853FA    mov         eax,ebx
 000853FC    call        TCustomGrid.UpdateEdit
 00085401    pop         ebx
 00085402    ret
*}
end;

//00085404
procedure TCustomGrid.RowHeightsChanged;
begin
{*
 00085404    push        ebx
 00085405    mov         ebx,eax
 00085407    mov         eax,ebx
 00085409    call        TCustomGrid.UpdateScrollRange
 0008540E    mov         eax,ebx
 00085410    call        TCustomGrid.UpdateEdit
 00085415    pop         ebx
 00085416    ret
*}
end;

//00085418
procedure TCustomGrid.DeleteColumn(ACol:Longint);
begin
{*
 00085418    push        ebx
 00085419    mov         ebx,eax
 0008541B    mov         ecx,dword ptr [ebx+1FC]
 00085421    dec         ecx
 00085422    mov         eax,ebx
 00085424    call        TCustomGrid.MoveColumn
 00085429    mov         edx,dword ptr [ebx+1FC]
 0008542F    dec         edx
 00085430    mov         eax,ebx
 00085432    call        TCustomGrid.SetColCount
 00085437    pop         ebx
 00085438    ret
*}
end;

//0008543C
procedure TCustomGrid.DeleteRow(ARow:Longint);
begin
{*
 0008543C    push        ebx
 0008543D    mov         ebx,eax
 0008543F    mov         ecx,dword ptr [ebx+22C]
 00085445    dec         ecx
 00085446    mov         eax,ebx
 00085448    call        TCustomGrid.MoveRow
 0008544D    mov         edx,dword ptr [ebx+22C]
 00085453    dec         edx
 00085454    mov         eax,ebx
 00085456    call        TCustomGrid.SetRowCount
 0008545B    pop         ebx
 0008545C    ret
*}
end;

//00085460
procedure TCustomGrid.UpdateDesigner;
begin
{*
 00085460    push        ebx
 00085461    mov         ebx,eax
 00085463    test        byte ptr [ebx+20],10
>00085467    je          00085499
 00085469    mov         eax,ebx
 0008546B    call        TWinControl.HandleAllocated
 00085470    test        al,al
>00085472    je          00085499
 00085474    test        byte ptr [ebx+20],40
>00085478    jne         00085499
 0008547A    mov         eax,ebx
 0008547C    call        GetParentForm
 00085481    test        eax,eax
>00085483    je          00085499
 00085485    cmp         dword ptr [eax+230],0
>0008548C    je          00085499
 0008548E    mov         eax,dword ptr [eax+230]
 00085494    mov         edx,dword ptr [eax]
 00085496    call        dword ptr [edx+0C]
 00085499    pop         ebx
 0008549A    ret
*}
end;

//0008549C
procedure TCustomGrid.DoMouseWheelDown(Shift:TShiftState; MousePos:TPoint);
begin
{*
 0008549C    push        ebx
 0008549D    push        esi
 0008549E    push        edi
 0008549F    add         esp,0FFFFFFF4
 000854A2    mov         esi,ecx
 000854A4    lea         edi,[esp+4]
 000854A8    movs        dword ptr [edi],dword ptr [esi]
 000854A9    movs        dword ptr [edi],dword ptr [esi]
 000854AA    mov         byte ptr [esp],dl
 000854AD    mov         ebx,eax
 000854AF    lea         ecx,[esp+4]
 000854B3    mov         dl,byte ptr [esp]
 000854B6    mov         eax,ebx
 000854B8    call        TWinControl.DoMouseWheelDown
 000854BD    test        al,al
>000854BF    jne         000854DE
 000854C1    mov         edx,dword ptr [ebx+22C]
 000854C7    dec         edx
 000854C8    mov         eax,dword ptr [ebx+20C]
 000854CE    cmp         edx,eax
>000854D0    jle         000854DC
 000854D2    mov         edx,eax
 000854D4    inc         edx
 000854D5    mov         eax,ebx
 000854D7    call        TCustomGrid.SetRow
 000854DC    mov         al,1
 000854DE    add         esp,0C
 000854E1    pop         edi
 000854E2    pop         esi
 000854E3    pop         ebx
 000854E4    ret
*}
end;

//000854E8
procedure TCustomGrid.DoMouseWheelUp(Shift:TShiftState; MousePos:TPoint);
begin
{*
 000854E8    push        ebx
 000854E9    push        esi
 000854EA    push        edi
 000854EB    add         esp,0FFFFFFF4
 000854EE    mov         esi,ecx
 000854F0    lea         edi,[esp+4]
 000854F4    movs        dword ptr [edi],dword ptr [esi]
 000854F5    movs        dword ptr [edi],dword ptr [esi]
 000854F6    mov         byte ptr [esp],dl
 000854F9    mov         ebx,eax
 000854FB    lea         ecx,[esp+4]
 000854FF    mov         dl,byte ptr [esp]
 00085502    mov         eax,ebx
 00085504    call        TWinControl.DoMouseWheelUp
 00085509    test        al,al
>0008550B    jne         00085527
 0008550D    mov         eax,dword ptr [ebx+20C]
 00085513    cmp         eax,dword ptr [ebx+21C]
>00085519    jle         00085525
 0008551B    mov         edx,eax
 0008551D    dec         edx
 0008551E    mov         eax,ebx
 00085520    call        TCustomGrid.SetRow
 00085525    mov         al,1
 00085527    add         esp,0C
 0008552A    pop         edi
 0008552B    pop         esi
 0008552C    pop         ebx
 0008552D    ret
*}
end;

//00085530
procedure TCustomGrid.BeginColumnDrag(var Origin:Integer; var Destination:Integer; const MousePt:TPoint);
begin
{*
 00085530    push        ebp
 00085531    mov         ebp,esp
 00085533    mov         al,1
 00085535    pop         ebp
 00085536    ret         4
*}
end;

//0008553C
procedure TCustomGrid.BeginRowDrag(var Origin:Integer; var Destination:Integer; const MousePt:TPoint);
begin
{*
 0008553C    push        ebp
 0008553D    mov         ebp,esp
 0008553F    mov         al,1
 00085541    pop         ebp
 00085542    ret         4
*}
end;

//00085548
procedure TCustomGrid.CheckColumnDrag(var Origin:Integer; var Destination:Integer; const MousePt:TPoint);
begin
{*
 00085548    push        ebp
 00085549    mov         ebp,esp
 0008554B    mov         al,1
 0008554D    pop         ebp
 0008554E    ret         4
*}
end;

//00085554
procedure TCustomGrid.CheckRowDrag(var Origin:Integer; var Destination:Integer; const MousePt:TPoint);
begin
{*
 00085554    push        ebp
 00085555    mov         ebp,esp
 00085557    mov         al,1
 00085559    pop         ebp
 0008555A    ret         4
*}
end;

//00085560
procedure TCustomGrid.EndColumnDrag(var Origin:Integer; var Destination:Integer; const MousePt:TPoint);
begin
{*
 00085560    push        ebp
 00085561    mov         ebp,esp
 00085563    mov         al,1
 00085565    pop         ebp
 00085566    ret         4
*}
end;

//0008556C
procedure TCustomGrid.EndRowDrag(var Origin:Integer; var Destination:Integer; const MousePt:TPoint);
begin
{*
 0008556C    push        ebp
 0008556D    mov         ebp,esp
 0008556F    mov         al,1
 00085571    pop         ebp
 00085572    ret         4
*}
end;

//00085578
procedure TCustomGrid.CMShowingChanged(var Message:TMessage);
begin
{*
 00085578    push        ebx
 00085579    mov         ebx,eax
 0008557B    mov         eax,ebx
 0008557D    call        TWinControl.CMShowingChanged
 00085582    cmp         byte ptr [ebx+16C],0
>00085589    je          00085592
 0008558B    mov         eax,ebx
 0008558D    call        TCustomGrid.UpdateScrollRange
 00085592    pop         ebx
 00085593    ret
*}
end;

//00085594
procedure TDrawGrid.MouseToCell(X:Integer; Y:Integer; var ACol:Longint; var ARow:Longint);
begin
{*
 00085594    push        ebp
 00085595    mov         ebp,esp
 00085597    add         esp,0FFFFFFF8
 0008559A    push        ebx
 0008559B    push        esi
 0008559C    push        edi
 0008559D    mov         edi,ecx
 0008559F    mov         esi,edx
 000855A1    mov         ebx,eax
 000855A3    lea         eax,[ebp-8]
 000855A6    push        eax
 000855A7    mov         ecx,edi
 000855A9    mov         edx,esi
 000855AB    mov         eax,ebx
 000855AD    call        TCustomGrid.MouseCoord
 000855B2    mov         eax,dword ptr [ebp+0C]
 000855B5    mov         edx,dword ptr [ebp-8]
 000855B8    mov         dword ptr [eax],edx
 000855BA    mov         eax,dword ptr [ebp+8]
 000855BD    mov         edx,dword ptr [ebp-4]
 000855C0    mov         dword ptr [eax],edx
 000855C2    pop         edi
 000855C3    pop         esi
 000855C4    pop         ebx
 000855C5    pop         ecx
 000855C6    pop         ecx
 000855C7    pop         ebp
 000855C8    ret         8
*}
end;

//000855CC
procedure TDrawGrid.ColumnMoved(FromIndex:Longint; ToIndex:Longint);
begin
{*
 000855CC    push        ebx
 000855CD    cmp         word ptr [eax+276],0
>000855D5    je          000855EA
 000855D7    push        ecx
 000855D8    mov         ebx,eax
 000855DA    mov         ecx,edx
 000855DC    mov         edx,eax
 000855DE    mov         eax,dword ptr [ebx+278]
 000855E4    call        dword ptr [ebx+274]
 000855EA    pop         ebx
 000855EB    ret
*}
end;

//000855EC
procedure TDrawGrid.GetEditMask(ACol:Longint; ARow:Longint);
begin
{*
 000855EC    push        ebp
 000855ED    mov         ebp,esp
 000855EF    push        ecx
 000855F0    push        ebx
 000855F1    push        esi
 000855F2    push        edi
 000855F3    mov         dword ptr [ebp-4],ecx
 000855F6    mov         edi,edx
 000855F8    mov         ebx,eax
 000855FA    mov         esi,dword ptr [ebp+8]
 000855FD    mov         eax,esi
 000855FF    call        @LStrClr
 00085604    cmp         word ptr [ebx+286],0
>0008560C    je          00085623
 0008560E    mov         eax,dword ptr [ebp-4]
 00085611    push        eax
 00085612    push        esi
 00085613    mov         ecx,edi
 00085615    mov         edx,ebx
 00085617    mov         eax,dword ptr [ebx+288]
 0008561D    call        dword ptr [ebx+284]
 00085623    pop         edi
 00085624    pop         esi
 00085625    pop         ebx
 00085626    pop         ecx
 00085627    pop         ebp
 00085628    ret         4
*}
end;

//0008562C
procedure TDrawGrid.GetEditText(ACol:Longint; ARow:Longint);
begin
{*
 0008562C    push        ebp
 0008562D    mov         ebp,esp
 0008562F    push        ecx
 00085630    push        ebx
 00085631    push        esi
 00085632    push        edi
 00085633    mov         dword ptr [ebp-4],ecx
 00085636    mov         edi,edx
 00085638    mov         ebx,eax
 0008563A    mov         esi,dword ptr [ebp+8]
 0008563D    mov         eax,esi
 0008563F    call        @LStrClr
 00085644    cmp         word ptr [ebx+28E],0
>0008564C    je          00085663
 0008564E    mov         eax,dword ptr [ebp-4]
 00085651    push        eax
 00085652    push        esi
 00085653    mov         ecx,edi
 00085655    mov         edx,ebx
 00085657    mov         eax,dword ptr [ebx+290]
 0008565D    call        dword ptr [ebx+28C]
 00085663    pop         edi
 00085664    pop         esi
 00085665    pop         ebx
 00085666    pop         ecx
 00085667    pop         ebp
 00085668    ret         4
*}
end;

//0008566C
procedure TDrawGrid.RowMoved(FromIndex:Longint; ToIndex:Longint);
begin
{*
 0008566C    push        ebx
 0008566D    cmp         word ptr [eax+296],0
>00085675    je          0008568A
 00085677    push        ecx
 00085678    mov         ebx,eax
 0008567A    mov         ecx,edx
 0008567C    mov         edx,eax
 0008567E    mov         eax,dword ptr [ebx+298]
 00085684    call        dword ptr [ebx+294]
 0008568A    pop         ebx
 0008568B    ret
*}
end;

//0008568C
function TDrawGrid.SelectCell(ACol:Longint; ARow:Longint):Boolean;
begin
{*
 0008568C    push        ebx
 0008568D    push        ecx
 0008568E    mov         byte ptr [esp],1
 00085692    cmp         word ptr [eax+29E],0
>0008569A    je          000856B4
 0008569C    push        ecx
 0008569D    lea         ecx,[esp+4]
 000856A1    push        ecx
 000856A2    mov         ebx,eax
 000856A4    mov         ecx,edx
 000856A6    mov         edx,eax
 000856A8    mov         eax,dword ptr [ebx+2A0]
 000856AE    call        dword ptr [ebx+29C]
 000856B4    mov         al,byte ptr [esp]
 000856B7    pop         edx
 000856B8    pop         ebx
 000856B9    ret
*}
end;

//000856BC
procedure TDrawGrid.SetEditText(ACol:Longint; ARow:Longint; const Value:AnsiString);
begin
{*
 000856BC    push        ebp
 000856BD    mov         ebp,esp
 000856BF    push        ebx
 000856C0    cmp         word ptr [eax+2A6],0
>000856C8    je          000856E1
 000856CA    push        ecx
 000856CB    mov         ecx,dword ptr [ebp+8]
 000856CE    push        ecx
 000856CF    mov         ebx,eax
 000856D1    mov         ecx,edx
 000856D3    mov         edx,eax
 000856D5    mov         eax,dword ptr [ebx+2A8]
 000856DB    call        dword ptr [ebx+2A4]
 000856E1    pop         ebx
 000856E2    pop         ebp
 000856E3    ret         4
*}
end;

//000856E8
procedure TDrawGrid.DrawCell(ACol:Longint; ARow:Longint; ARect:TRect; AState:TGridDrawState);
begin
{*
 000856E8    push        ebp
 000856E9    mov         ebp,esp
 000856EB    add         esp,0FFFFFFEC
 000856EE    push        ebx
 000856EF    push        esi
 000856F0    push        edi
 000856F1    mov         esi,dword ptr [ebp+0C]
 000856F4    lea         edi,[ebp-14]
 000856F7    push        ecx
 000856F8    mov         ecx,4
 000856FD    rep movs    dword ptr [edi],dword ptr [esi]
 000856FF    pop         ecx
 00085700    mov         dword ptr [ebp-4],ecx
 00085703    mov         edi,edx
 00085705    mov         esi,eax
 00085707    cmp         word ptr [esi+27E],0
>0008570F    je          00085782
 00085711    mov         eax,esi
 00085713    mov         bx,0FFCF
 00085717    call        @CallDynaInst
 0008571C    test        al,al
>0008571E    je          0008574E
 00085720    mov         eax,esi
 00085722    call        TControl.GetClientWidth
 00085727    sub         eax,dword ptr [ebp-14]
 0008572A    mov         dword ptr [ebp-14],eax
 0008572D    mov         eax,esi
 0008572F    call        TControl.GetClientWidth
 00085734    mov         ebx,eax
 00085736    sub         ebx,dword ptr [ebp-0C]
 00085739    mov         dword ptr [ebp-0C],ebx
 0008573C    mov         eax,dword ptr [ebp-14]
 0008573F    mov         dword ptr [ebp-14],ebx
 00085742    mov         dword ptr [ebp-0C],eax
 00085745    xor         edx,edx
 00085747    mov         eax,esi
 00085749    call        TCustomGrid.ChangeGridOrientation
 0008574E    mov         eax,dword ptr [ebp-4]
 00085751    push        eax
 00085752    lea         eax,[ebp-14]
 00085755    push        eax
 00085756    mov         al,byte ptr [ebp+8]
 00085759    push        eax
 0008575A    mov         ecx,edi
 0008575C    mov         edx,esi
 0008575E    mov         eax,dword ptr [esi+280]
 00085764    call        dword ptr [esi+27C]
 0008576A    mov         eax,esi
 0008576C    mov         bx,0FFCF
 00085770    call        @CallDynaInst
 00085775    test        al,al
>00085777    je          00085782
 00085779    mov         dl,1
 0008577B    mov         eax,esi
 0008577D    call        TCustomGrid.ChangeGridOrientation
 00085782    pop         edi
 00085783    pop         esi
 00085784    pop         ebx
 00085785    mov         esp,ebp
 00085787    pop         ebp
 00085788    ret         8
*}
end;

//0008578C
procedure TDrawGrid.TopLeftChanged;
begin
{*
 0008578C    push        ebx
 0008578D    mov         ebx,eax
 0008578F    mov         eax,ebx
 00085791    call        TCustomGrid.TopLeftChanged
 00085796    cmp         word ptr [ebx+2AE],0
>0008579E    je          000857AE
 000857A0    mov         edx,ebx
 000857A2    mov         eax,dword ptr [ebx+2B0]
 000857A8    call        dword ptr [ebx+2AC]
 000857AE    pop         ebx
 000857AF    ret
*}
end;

//000857D0
function NewStrItem(const AString:AnsiString; AObject:TObject):PStrItem;
begin
{*
 000857D0    push        ebx
 000857D1    push        esi
 000857D2    push        edi
 000857D3    mov         edi,edx
 000857D5    mov         esi,eax
 000857D7    mov         edx,dword ptr ds:[857B0];TStrItem
 000857DD    mov         eax,8
 000857E2    call        @New
 000857E7    mov         ebx,eax
 000857E9    mov         dword ptr [ebx],edi
 000857EB    lea         eax,[ebx+4]
 000857EE    mov         edx,esi
 000857F0    call        @LStrAsg
 000857F5    mov         eax,ebx
 000857F7    pop         edi
 000857F8    pop         esi
 000857F9    pop         ebx
 000857FA    ret
*}
end;

//000857FC
procedure DisposeStrItem(P:PStrItem);
begin
{*
 000857FC    mov         edx,dword ptr ds:[857B0];TStrItem
 00085802    call        @Dispose
 00085807    ret
*}
end;

//00085A2C
function ExpandDir(secDir:PSecDir; var slotsInDir:Word; newSlots:Word):PSecDir;
begin
{*
 00085A2C    push        ebx
 00085A2D    push        esi
 00085A2E    push        ecx
 00085A2F    mov         esi,ecx
 00085A31    mov         ebx,edx
 00085A33    mov         dword ptr [esp],eax
 00085A36    movzx       eax,si
 00085A39    mov         edx,eax
 00085A3B    shl         edx,2
 00085A3E    mov         eax,esp
 00085A40    call        @ReallocMem
 00085A45    movzx       edx,si
 00085A48    movzx       eax,word ptr [ebx]
 00085A4B    sub         edx,eax
 00085A4D    shl         edx,2
 00085A50    mov         ecx,dword ptr [esp]
 00085A53    lea         eax,[ecx+eax*4]
 00085A56    xor         ecx,ecx
 00085A58    call        @FillChar
 00085A5D    mov         word ptr [ebx],si
 00085A60    mov         eax,dword ptr [esp]
 00085A63    pop         edx
 00085A64    pop         esi
 00085A65    pop         ebx
 00085A66    ret
*}
end;

//00085A68
function MakeSec(SecIndex:Integer; SectionSize:Word):Pointer;
begin
{*
 00085A68    push        ebx
 00085A69    push        esi
 00085A6A    push        edi
 00085A6B    mov         esi,edx
 00085A6D    shl         esi,2
 00085A70    movzx       edi,si
 00085A73    mov         eax,edi
 00085A75    call        @GetMem
 00085A7A    mov         ebx,eax
 00085A7C    mov         edx,edi
 00085A7E    mov         eax,ebx
 00085A80    xor         ecx,ecx
 00085A82    call        @FillChar
 00085A87    mov         eax,ebx
 00085A89    pop         edi
 00085A8A    pop         esi
 00085A8B    pop         ebx
 00085A8C    ret
*}
end;

//00085A90
constructor TSparsePointerArray.Create(Quantum:TSPAQuantum);
begin
{*
 00085A90    push        ebx
 00085A91    push        esi
 00085A92    test        dl,dl
>00085A94    je          00085A9E
 00085A96    add         esp,0FFFFFFF0
 00085A99    call        @ClassCreate
 00085A9E    xor         ebx,ebx
 00085AA0    mov         dword ptr [eax+4],ebx
 00085AA3    mov         word ptr [eax+8],0
 00085AA9    mov         dword ptr [eax+10],0FFFFFFFF
 00085AB0    xor         ebx,ebx
 00085AB2    mov         bl,cl
 00085AB4    movzx       esi,byte ptr [ebx+0B4EA4]
 00085ABB    inc         esi
 00085ABC    mov         word ptr [eax+14],si
 00085AC0    movzx       esi,byte ptr [ebx+0B4EA4]
 00085AC7    mov         word ptr [eax+0A],si
 00085ACB    xor         ecx,ecx
 00085ACD    mov         cl,byte ptr [ebx+0B4EA8]
 00085AD3    mov         word ptr [eax+0C],cx
 00085AD7    mov         dword ptr [eax+18],0FFFFFFFF
 00085ADE    test        dl,dl
>00085AE0    je          00085AF1
 00085AE2    call        @AfterConstruction
 00085AE7    pop         dword ptr fs:[0]
 00085AEE    add         esp,0C
 00085AF1    pop         esi
 00085AF2    pop         ebx
 00085AF3    ret
*}
end;

//00085AF4
destructor TSparsePointerArray.Destroy;
begin
{*
 00085AF4    push        ebx
 00085AF5    push        esi
 00085AF6    push        edi
 00085AF7    push        ebp
 00085AF8    call        @BeforeDestruction
 00085AFD    mov         ebx,edx
 00085AFF    mov         esi,eax
 00085B01    xor         ebp,ebp
 00085B03    mov         di,word ptr [esi+14]
 00085B07    shl         edi,2
>00085B0A    jmp         00085B22
 00085B0C    mov         eax,dword ptr [esi+4]
 00085B0F    mov         eax,dword ptr [eax+ebp*4]
 00085B12    test        eax,eax
>00085B14    je          00085B21
 00085B16    movzx       edx,di
 00085B19    mov         ecx,dword ptr [esi+4]
 00085B1C    call        @FreeMem
 00085B21    inc         ebp
 00085B22    movzx       eax,word ptr [esi+8]
 00085B26    cmp         ebp,eax
>00085B28    jl          00085B0C
 00085B2A    mov         eax,dword ptr [esi+4]
 00085B2D    test        eax,eax
>00085B2F    je          00085B3D
 00085B31    movzx       edx,word ptr [esi+8]
 00085B35    shl         edx,2
 00085B38    call        @FreeMem
 00085B3D    test        bl,bl
>00085B3F    jle         00085B48
 00085B41    mov         eax,esi
 00085B43    call        @ClassDestroy
 00085B48    pop         ebp
 00085B49    pop         edi
 00085B4A    pop         esi
 00085B4B    pop         ebx
 00085B4C    ret
*}
end;

//00085B50
function TSparsePointerArray.GetAt(Index:Integer):Pointer;
begin
{*
 00085B50    push        ebx
 00085B51    cmp         edx,dword ptr [eax+18]
>00085B54    jne         00085B5B
 00085B56    mov         ecx,dword ptr [eax+1C]
>00085B59    jmp         00085B96
 00085B5B    mov         cx,word ptr [eax+0C]
 00085B5F    mov         ebx,edx
 00085B61    shr         ebx,cl
 00085B63    mov         ecx,ebx
 00085B65    movzx       ebx,word ptr [eax+8]
 00085B69    cmp         ecx,ebx
>00085B6B    jb          00085B71
 00085B6D    xor         ecx,ecx
>00085B6F    jmp         00085B86
 00085B71    mov         ebx,dword ptr [eax+4]
 00085B74    mov         ecx,dword ptr [ebx+ecx*4]
 00085B77    test        ecx,ecx
>00085B79    je          00085B86
 00085B7B    movzx       ebx,word ptr [eax+0A]
 00085B7F    and         ebx,edx
 00085B81    shl         ebx,2
 00085B84    add         ecx,ebx
 00085B86    test        ecx,ecx
>00085B88    jne         00085B8E
 00085B8A    xor         ecx,ecx
>00085B8C    jmp         00085B90
 00085B8E    mov         ecx,dword ptr [ecx]
 00085B90    mov         dword ptr [eax+18],edx
 00085B93    mov         dword ptr [eax+1C],ecx
 00085B96    mov         eax,ecx
 00085B98    pop         ebx
 00085B99    ret
*}
end;

//00085B9C
function TSparsePointerArray.MakeAt(Index:Integer):PPointer;
begin
{*
 00085B9C    push        ebx
 00085B9D    push        esi
 00085B9E    push        edi
 00085B9F    push        ebp
 00085BA0    mov         edi,edx
 00085BA2    mov         ebx,eax
 00085BA4    mov         cx,word ptr [ebx+0C]
 00085BA8    mov         esi,edi
 00085BAA    shr         esi,cl
 00085BAC    cmp         si,word ptr [ebx+8]
>00085BB0    jb          00085BC4
 00085BB2    lea         ecx,[esi+1]
 00085BB5    lea         edx,[ebx+8]
 00085BB8    mov         eax,dword ptr [ebx+4]
 00085BBB    call        ExpandDir
 00085BC0    mov         ebp,eax
>00085BC2    jmp         00085BC7
 00085BC4    mov         ebp,dword ptr [ebx+4]
 00085BC7    mov         dword ptr [ebx+4],ebp
 00085BCA    movzx       eax,si
 00085BCD    mov         eax,dword ptr [ebp+eax*4]
 00085BD1    test        eax,eax
>00085BD3    jne         00085BE8
 00085BD5    movzx       eax,si
 00085BD8    mov         dx,word ptr [ebx+14]
 00085BDC    call        MakeSec
 00085BE1    movzx       edx,si
 00085BE4    mov         dword ptr [ebp+edx*4],eax
 00085BE8    movzx       edx,word ptr [ebx+0A]
 00085BEC    and         edx,edi
 00085BEE    shl         edx,2
 00085BF1    add         eax,edx
 00085BF3    cmp         edi,dword ptr [ebx+10]
>00085BF6    jle         00085BFB
 00085BF8    mov         dword ptr [ebx+10],edi
 00085BFB    mov         dword ptr [ebx+18],0FFFFFFFF
 00085C02    pop         ebp
 00085C03    pop         edi
 00085C04    pop         esi
 00085C05    pop         ebx
 00085C06    ret
*}
end;

//00085C08
procedure TSparsePointerArray.PutAt(Index:Integer; Item:Pointer);
begin
{*
 00085C08    push        ebx
 00085C09    push        esi
 00085C0A    push        edi
 00085C0B    mov         esi,ecx
 00085C0D    mov         edi,edx
 00085C0F    mov         ebx,eax
 00085C11    test        esi,esi
>00085C13    jne         00085C22
 00085C15    mov         edx,edi
 00085C17    mov         eax,ebx
 00085C19    call        TSparsePointerArray.GetAt
 00085C1E    test        eax,eax
>00085C20    je          00085C38
 00085C22    mov         edx,edi
 00085C24    mov         eax,ebx
 00085C26    call        TSparsePointerArray.MakeAt
 00085C2B    mov         dword ptr [eax],esi
 00085C2D    test        esi,esi
>00085C2F    jne         00085C38
 00085C31    mov         eax,ebx
 00085C33    call        TSparsePointerArray.ResetHighBound
 00085C38    pop         edi
 00085C39    pop         esi
 00085C3A    pop         ebx
 00085C3B    ret
*}
end;

//00085C3C
function TSparsePointerArray.ForAll(ApplyFunction:Pointer):Integer;
begin
{*
 00085C3C    push        ebp
 00085C3D    mov         ebp,esp
 00085C3F    add         esp,0FFFFFFE8
 00085C42    push        ebx
 00085C43    push        esi
 00085C44    push        edi
 00085C45    mov         dword ptr [ebp-10],edx
 00085C48    mov         esi,eax
 00085C4A    xor         eax,eax
 00085C4C    mov         dword ptr [ebp-14],eax
 00085C4F    xor         eax,eax
 00085C51    mov         dword ptr [ebp-18],eax
 00085C54    mov         eax,dword ptr [ebp]
 00085C57    mov         dword ptr [ebp-4],eax
>00085C5A    jmp         00085CAC
 00085C5C    mov         eax,dword ptr [esi+4]
 00085C5F    mov         edx,dword ptr [ebp-18]
 00085C62    mov         ebx,dword ptr [eax+edx*4]
 00085C65    test        ebx,ebx
>00085C67    je          00085CA9
 00085C69    xor         edi,edi
 00085C6B    mov         cx,word ptr [esi+0C]
 00085C6F    mov         eax,dword ptr [ebp-18]
 00085C72    shl         eax,cl
 00085C74    mov         dword ptr [ebp-8],eax
>00085C77    jmp         00085C9B
 00085C79    mov         eax,dword ptr [ebx]
 00085C7B    mov         dword ptr [ebp-0C],eax
 00085C7E    cmp         dword ptr [ebp-0C],0
>00085C82    je          00085C94
 00085C84    mov         eax,dword ptr [ebp-8]
 00085C87    mov         edx,dword ptr [ebp-0C]
 00085C8A    push        dword ptr [ebp-4]
 00085C8D    call        dword ptr [ebp-10]
 00085C90    pop         ecx
 00085C91    mov         dword ptr [ebp-14],eax
 00085C94    add         ebx,4
 00085C97    inc         edi
 00085C98    inc         dword ptr [ebp-8]
 00085C9B    movzx       eax,word ptr [esi+14]
 00085C9F    cmp         edi,eax
>00085CA1    jge         00085CA9
 00085CA3    cmp         dword ptr [ebp-14],0
>00085CA7    je          00085C79
 00085CA9    inc         dword ptr [ebp-18]
 00085CAC    movzx       eax,word ptr [esi+8]
 00085CB0    cmp         eax,dword ptr [ebp-18]
>00085CB3    jbe         00085CBB
 00085CB5    cmp         dword ptr [ebp-14],0
>00085CB9    je          00085C5C
 00085CBB    mov         eax,dword ptr [ebp-14]
 00085CBE    pop         edi
 00085CBF    pop         esi
 00085CC0    pop         ebx
 00085CC1    mov         esp,ebp
 00085CC3    pop         ebp
 00085CC4    ret
*}
end;

//00085CC8
function Detector(TheIndex:Integer; TheItem:Pointer):Integer;
begin
{*
 00085CC8    push        ebp
 00085CC9    mov         ebp,esp
 00085CCB    mov         ecx,dword ptr [ebp+8]
 00085CCE    mov         ecx,dword ptr [ecx-4]
 00085CD1    cmp         eax,dword ptr [ecx+10]
>00085CD4    jle         00085CDD
 00085CD6    mov         ecx,1
>00085CDB    jmp         00085CE9
 00085CDD    xor         ecx,ecx
 00085CDF    test        edx,edx
>00085CE1    je          00085CE9
 00085CE3    mov         edx,dword ptr [ebp+8]
 00085CE6    mov         dword ptr [edx-8],eax
 00085CE9    mov         eax,ecx
 00085CEB    pop         ebp
 00085CEC    ret
*}
end;

//00085CF0
procedure TSparsePointerArray.ResetHighBound;
begin
{*
 00085CF0    push        ebp
 00085CF1    mov         ebp,esp
 00085CF3    add         esp,0FFFFFFF8
 00085CF6    mov         dword ptr [ebp-4],eax
 00085CF9    mov         dword ptr [ebp-8],0FFFFFFFF
 00085D00    mov         edx,85CC8;Detector:Integer
 00085D05    mov         eax,dword ptr [ebp-4]
 00085D08    call        TSparsePointerArray.ForAll
 00085D0D    mov         eax,dword ptr [ebp-4]
 00085D10    mov         edx,dword ptr [ebp-8]
 00085D13    mov         dword ptr [eax+10],edx
 00085D16    pop         ecx
 00085D17    pop         ecx
 00085D18    pop         ebp
 00085D19    ret
*}
end;

//00085D1C
constructor TSparseList.Create(Quantum:TSPAQuantum);
begin
{*
 00085D1C    push        ebx
 00085D1D    push        esi
 00085D1E    test        dl,dl
>00085D20    je          00085D2A
 00085D22    add         esp,0FFFFFFF0
 00085D25    call        @ClassCreate
 00085D2A    mov         ebx,edx
 00085D2C    mov         esi,eax
 00085D2E    mov         edx,ecx
 00085D30    mov         eax,esi
 00085D32    call        TSparseList.NewList
 00085D37    mov         eax,esi
 00085D39    test        bl,bl
>00085D3B    je          00085D4C
 00085D3D    call        @AfterConstruction
 00085D42    pop         dword ptr fs:[0]
 00085D49    add         esp,0C
 00085D4C    mov         eax,esi
 00085D4E    pop         esi
 00085D4F    pop         ebx
 00085D50    ret
*}
end;

//00085D54
destructor TSparseList.Destroy;
begin
{*
 00085D54    push        ebx
 00085D55    push        esi
 00085D56    call        @BeforeDestruction
 00085D5B    mov         ebx,edx
 00085D5D    mov         esi,eax
 00085D5F    mov         eax,dword ptr [esi+4]
 00085D62    test        eax,eax
>00085D64    je          00085D6D
 00085D66    mov         dl,1
 00085D68    mov         ecx,dword ptr [eax]
 00085D6A    call        dword ptr [ecx-4]
 00085D6D    test        bl,bl
>00085D6F    jle         00085D78
 00085D71    mov         eax,esi
 00085D73    call        @ClassDestroy
 00085D78    pop         esi
 00085D79    pop         ebx
 00085D7A    ret
*}
end;

//00085D7C
procedure TSparseList.Clear;
begin
{*
 00085D7C    push        ebx
 00085D7D    mov         ebx,eax
 00085D7F    mov         dl,1
 00085D81    mov         eax,dword ptr [ebx+4]
 00085D84    mov         ecx,dword ptr [eax]
 00085D86    call        dword ptr [ecx-4]
 00085D89    mov         dl,byte ptr [ebx+0C]
 00085D8C    mov         eax,ebx
 00085D8E    call        TSparseList.NewList
 00085D93    xor         eax,eax
 00085D95    mov         dword ptr [ebx+8],eax
 00085D98    pop         ebx
 00085D99    ret
*}
end;

//00085D9C
procedure TSparseList.Delete(Index:Integer);
begin
{*
 00085D9C    push        ebx
 00085D9D    push        esi
 00085D9E    push        edi
 00085D9F    push        ebp
 00085DA0    mov         ebx,eax
 00085DA2    test        edx,edx
>00085DA4    jl          00085DE2
 00085DA6    cmp         edx,dword ptr [ebx+8]
>00085DA9    jge         00085DE2
 00085DAB    mov         esi,edx
 00085DAD    mov         edi,dword ptr [ebx+8]
 00085DB0    dec         edi
 00085DB1    sub         edi,esi
>00085DB3    jl          00085DD2
 00085DB5    inc         edi
 00085DB6    lea         edx,[esi+1]
 00085DB9    mov         ebp,dword ptr [ebx+4]
 00085DBC    mov         eax,ebp
 00085DBE    call        TSparsePointerArray.GetAt
 00085DC3    mov         ecx,eax
 00085DC5    mov         edx,esi
 00085DC7    mov         eax,ebp
 00085DC9    call        TSparsePointerArray.PutAt
 00085DCE    inc         esi
 00085DCF    dec         edi
>00085DD0    jne         00085DB6
 00085DD2    xor         ecx,ecx
 00085DD4    mov         edx,dword ptr [ebx+8]
 00085DD7    mov         eax,dword ptr [ebx+4]
 00085DDA    call        TSparsePointerArray.PutAt
 00085DDF    dec         dword ptr [ebx+8]
 00085DE2    pop         ebp
 00085DE3    pop         edi
 00085DE4    pop         esi
 00085DE5    pop         ebx
 00085DE6    ret
*}
end;

//00085DE8
procedure TSparseList.Error;
begin
{*
 00085DE8    push        ebp
 00085DE9    mov         ebp,esp
 00085DEB    push        0
 00085DED    xor         eax,eax
 00085DEF    push        ebp
 00085DF0    push        85E32
 00085DF5    push        dword ptr fs:[eax]
 00085DF8    mov         dword ptr fs:[eax],esp
 00085DFB    lea         edx,[ebp-4]
 00085DFE    mov         eax,[000B5AB4];^SListIndexError:TResStringRec
 00085E03    call        LoadResString
 00085E08    mov         ecx,dword ptr [ebp-4]
 00085E0B    mov         dl,1
 00085E0D    mov         eax,[0001EC9C];EListError
 00085E12    call        Exception.Create
 00085E17    call        @RaiseExcept
 00085E1C    xor         eax,eax
 00085E1E    pop         edx
 00085E1F    pop         ecx
 00085E20    pop         ecx
 00085E21    mov         dword ptr fs:[eax],edx
 00085E24    push        85E39
 00085E29    lea         eax,[ebp-4]
 00085E2C    call        @LStrClr
 00085E31    ret
>00085E32    jmp         @HandleFinally
>00085E37    jmp         00085E29
 00085E39    pop         ecx
 00085E3A    pop         ebp
 00085E3B    ret
*}
end;

//00085E3C
procedure TSparseList.Exchange(Index1:Integer; Index2:Integer);
begin
{*
 00085E3C    push        ebx
 00085E3D    push        esi
 00085E3E    push        edi
 00085E3F    push        ebp
 00085E40    mov         edi,ecx
 00085E42    mov         esi,edx
 00085E44    mov         ebx,eax
 00085E46    mov         edx,esi
 00085E48    mov         eax,ebx
 00085E4A    call        TSparseList.Get
 00085E4F    mov         ebp,eax
 00085E51    mov         edx,edi
 00085E53    mov         eax,ebx
 00085E55    call        TSparseList.Get
 00085E5A    mov         ecx,eax
 00085E5C    mov         edx,esi
 00085E5E    mov         eax,ebx
 00085E60    call        TSparseList.Put
 00085E65    mov         ecx,ebp
 00085E67    mov         edx,edi
 00085E69    mov         eax,ebx
 00085E6B    call        TSparseList.Put
 00085E70    pop         ebp
 00085E71    pop         edi
 00085E72    pop         esi
 00085E73    pop         ebx
 00085E74    ret
*}
end;

//00085E78
function TSparseList.ForAll(ApplyFunction:Pointer):Integer;
begin
{*
 00085E78    mov         eax,dword ptr [eax+4]
>00085E7B    jmp         TSparsePointerArray.ForAll
 00085E80    ret
*}
end;

//00085E84
function TSparseList.Get(Index:Integer):Pointer;
begin
{*
 00085E84    push        ebx
 00085E85    push        esi
 00085E86    mov         esi,edx
 00085E88    mov         ebx,eax
 00085E8A    test        esi,esi
>00085E8C    jge         00085E94
 00085E8E    mov         eax,ebx
 00085E90    mov         edx,dword ptr [eax]
 00085E92    call        dword ptr [edx]
 00085E94    mov         edx,esi
 00085E96    mov         eax,dword ptr [ebx+4]
 00085E99    call        TSparsePointerArray.GetAt
 00085E9E    pop         esi
 00085E9F    pop         ebx
 00085EA0    ret
*}
end;

//00085EA4
procedure TSparseList.Insert(Index:Integer; Item:Pointer);
begin
{*
 00085EA4    push        ebx
 00085EA5    push        esi
 00085EA6    push        edi
 00085EA7    push        ebp
 00085EA8    push        ecx
 00085EA9    mov         dword ptr [esp],ecx
 00085EAC    mov         ebp,edx
 00085EAE    mov         esi,eax
 00085EB0    test        ebp,ebp
>00085EB2    jge         00085EBA
 00085EB4    mov         eax,esi
 00085EB6    mov         edx,dword ptr [eax]
 00085EB8    call        dword ptr [edx]
 00085EBA    mov         ebx,dword ptr [esi+8]
 00085EBD    cmp         ebp,ebx
>00085EBF    jge         00085EDE
 00085EC1    mov         edx,ebx
 00085EC3    dec         edx
 00085EC4    mov         edi,dword ptr [esi+4]
 00085EC7    mov         eax,edi
 00085EC9    call        TSparsePointerArray.GetAt
 00085ECE    mov         ecx,eax
 00085ED0    mov         edx,ebx
 00085ED2    mov         eax,edi
 00085ED4    call        TSparsePointerArray.PutAt
 00085ED9    dec         ebx
 00085EDA    cmp         ebp,ebx
>00085EDC    jl          00085EC1
 00085EDE    mov         ecx,dword ptr [esp]
 00085EE1    mov         edx,ebp
 00085EE3    mov         eax,dword ptr [esi+4]
 00085EE6    call        TSparsePointerArray.PutAt
 00085EEB    cmp         ebp,dword ptr [esi+8]
>00085EEE    jle         00085EF3
 00085EF0    mov         dword ptr [esi+8],ebp
 00085EF3    inc         dword ptr [esi+8]
 00085EF6    pop         edx
 00085EF7    pop         ebp
 00085EF8    pop         edi
 00085EF9    pop         esi
 00085EFA    pop         ebx
 00085EFB    ret
*}
end;

//00085EFC
procedure TSparseList.Move(CurIndex:Integer; NewIndex:Integer);
begin
{*
 00085EFC    push        ebx
 00085EFD    push        esi
 00085EFE    push        edi
 00085EFF    push        ebp
 00085F00    mov         edi,ecx
 00085F02    mov         esi,edx
 00085F04    mov         ebx,eax
 00085F06    cmp         edi,esi
>00085F08    je          00085F29
 00085F0A    mov         edx,esi
 00085F0C    mov         eax,ebx
 00085F0E    call        TSparseList.Get
 00085F13    mov         ebp,eax
 00085F15    mov         edx,esi
 00085F17    mov         eax,ebx
 00085F19    call        TSparseList.Delete
 00085F1E    mov         ecx,ebp
 00085F20    mov         edx,edi
 00085F22    mov         eax,ebx
 00085F24    call        TSparseList.Insert
 00085F29    pop         ebp
 00085F2A    pop         edi
 00085F2B    pop         esi
 00085F2C    pop         ebx
 00085F2D    ret
*}
end;

//00085F30
procedure TSparseList.NewList(Quantum:TSPAQuantum);
begin
{*
 00085F30    push        ebx
 00085F31    push        esi
 00085F32    mov         ebx,edx
 00085F34    mov         esi,eax
 00085F36    mov         byte ptr [esi+0C],bl
 00085F39    mov         ecx,ebx
 00085F3B    mov         dl,1
 00085F3D    mov         eax,[0008586C];TSparsePointerArray
 00085F42    call        TSparsePointerArray.Create
 00085F47    mov         dword ptr [esi+4],eax
 00085F4A    pop         esi
 00085F4B    pop         ebx
 00085F4C    ret
*}
end;

//00085F50
procedure TSparseList.Put(Index:Integer; Item:Pointer);
begin
{*
 00085F50    push        ebx
 00085F51    push        esi
 00085F52    push        edi
 00085F53    mov         edi,ecx
 00085F55    mov         esi,edx
 00085F57    mov         ebx,eax
 00085F59    test        esi,esi
>00085F5B    jge         00085F63
 00085F5D    mov         eax,ebx
 00085F5F    mov         edx,dword ptr [eax]
 00085F61    call        dword ptr [edx]
 00085F63    mov         ecx,edi
 00085F65    mov         edx,esi
 00085F67    mov         eax,dword ptr [ebx+4]
 00085F6A    call        TSparsePointerArray.PutAt
 00085F6F    mov         eax,dword ptr [ebx+4]
 00085F72    mov         eax,dword ptr [eax+10]
 00085F75    inc         eax
 00085F76    mov         dword ptr [ebx+8],eax
 00085F79    pop         edi
 00085F7A    pop         esi
 00085F7B    pop         ebx
 00085F7C    ret
*}
end;

//00085F80
constructor TStringSparseList.Create(Quantum:TSPAQuantum);
begin
{*
 00085F80    push        ebp
 00085F81    mov         ebp,esp
 00085F83    push        ecx
 00085F84    push        ebx
 00085F85    push        esi
 00085F86    test        dl,dl
>00085F88    je          00085F92
 00085F8A    add         esp,0FFFFFFF0
 00085F8D    call        @ClassCreate
 00085F92    mov         ebx,ecx
 00085F94    mov         byte ptr [ebp-1],dl
 00085F97    mov         esi,eax
 00085F99    mov         ecx,ebx
 00085F9B    mov         dl,1
 00085F9D    mov         eax,[000858CC];TSparseList
 00085FA2    call        TSparseList.Create
 00085FA7    mov         dword ptr [esi+0C],eax
 00085FAA    mov         eax,esi
 00085FAC    cmp         byte ptr [ebp-1],0
>00085FB0    je          00085FC1
 00085FB2    call        @AfterConstruction
 00085FB7    pop         dword ptr fs:[0]
 00085FBE    add         esp,0C
 00085FC1    mov         eax,esi
 00085FC3    pop         esi
 00085FC4    pop         ebx
 00085FC5    pop         ecx
 00085FC6    pop         ebp
 00085FC7    ret
*}
end;

//00085FC8
destructor TStringSparseList.Destroy;
begin
{*
 00085FC8    push        ebx
 00085FC9    push        esi
 00085FCA    call        @BeforeDestruction
 00085FCF    mov         ebx,edx
 00085FD1    mov         esi,eax
 00085FD3    cmp         dword ptr [esi+0C],0
>00085FD7    je          00085FEA
 00085FD9    mov         eax,esi
 00085FDB    mov         edx,dword ptr [eax]
 00085FDD    call        dword ptr [edx+40]
 00085FE0    mov         dl,1
 00085FE2    mov         eax,dword ptr [esi+0C]
 00085FE5    mov         ecx,dword ptr [eax]
 00085FE7    call        dword ptr [ecx-4]
 00085FEA    test        bl,bl
>00085FEC    jle         00085FF5
 00085FEE    mov         eax,esi
 00085FF0    call        @ClassDestroy
 00085FF5    pop         esi
 00085FF6    pop         ebx
 00085FF7    ret
*}
end;

//00085FF8
procedure TStringSparseList.ReadData(Reader:TReader);
begin
{*
 00085FF8    push        ebp
 00085FF9    mov         ebp,esp
 00085FFB    push        0
 00085FFD    push        ebx
 00085FFE    push        esi
 00085FFF    push        edi
 00086000    mov         ebx,edx
 00086002    mov         edi,eax
 00086004    xor         eax,eax
 00086006    push        ebp
 00086007    push        8605B
 0008600C    push        dword ptr fs:[eax]
 0008600F    mov         dword ptr fs:[eax],esp
 00086012    mov         eax,ebx
 00086014    call        TReader.ReadInteger
 00086019    mov         esi,eax
 0008601B    test        esi,esi
>0008601D    jle         00086045
 0008601F    push        0
 00086021    lea         edx,[ebp-4]
 00086024    mov         eax,ebx
 00086026    call        TReader.ReadString
 0008602B    mov         eax,dword ptr [ebp-4]
 0008602E    push        eax
 0008602F    mov         eax,ebx
 00086031    call        TReader.ReadInteger
 00086036    mov         edx,eax
 00086038    mov         eax,edi
 0008603A    pop         ecx
 0008603B    call        TStrings.InsertObject
 00086040    dec         esi
 00086041    test        esi,esi
>00086043    jg          0008601F
 00086045    xor         eax,eax
 00086047    pop         edx
 00086048    pop         ecx
 00086049    pop         ecx
 0008604A    mov         dword ptr fs:[eax],edx
 0008604D    push        86062
 00086052    lea         eax,[ebp-4]
 00086055    call        @LStrClr
 0008605A    ret
>0008605B    jmp         @HandleFinally
>00086060    jmp         00086052
 00086062    pop         edi
 00086063    pop         esi
 00086064    pop         ebx
 00086065    pop         ecx
 00086066    pop         ebp
 00086067    ret
*}
end;

//00086068
function CountItem(TheIndex:Integer; TheItem:Pointer):Integer;
begin
{*
 00086068    push        ebp
 00086069    mov         ebp,esp
 0008606B    mov         eax,dword ptr [ebp+8]
 0008606E    inc         dword ptr [eax-4]
 00086071    xor         eax,eax
 00086073    pop         ebp
 00086074    ret
*}
end;

//00086078
function StoreItem(TheIndex:Integer; TheItem:Pointer):Integer;
begin
{*
 00086078    push        ebp
 00086079    mov         ebp,esp
 0008607B    push        ebx
 0008607C    mov         ebx,edx
 0008607E    mov         edx,dword ptr [ebp+8]
 00086081    mov         edx,dword ptr [edx-8]
 00086084    xchg        eax,edx
 00086085    call        TWriter.WriteInteger
 0008608A    mov         edx,dword ptr [ebx+4]
 0008608D    mov         eax,dword ptr [ebp+8]
 00086090    mov         eax,dword ptr [eax-8]
 00086093    call        TWriter.WriteString
 00086098    xor         eax,eax
 0008609A    pop         ebx
 0008609B    pop         ebp
 0008609C    ret
*}
end;

//000860A0
procedure TStringSparseList.WriteData(Writer:TWriter);
begin
{*
 000860A0    push        ebp
 000860A1    mov         ebp,esp
 000860A3    add         esp,0FFFFFFF8
 000860A6    push        ebx
 000860A7    mov         dword ptr [ebp-8],edx
 000860AA    mov         ebx,eax
 000860AC    xor         eax,eax
 000860AE    mov         dword ptr [ebp-4],eax
 000860B1    mov         edx,86068;CountItem:Integer
 000860B6    mov         eax,dword ptr [ebx+0C]
 000860B9    call        TSparseList.ForAll
 000860BE    mov         edx,dword ptr [ebp-4]
 000860C1    mov         eax,dword ptr [ebp-8]
 000860C4    call        TWriter.WriteInteger
 000860C9    mov         edx,86078;StoreItem:Integer
 000860CE    mov         eax,dword ptr [ebx+0C]
 000860D1    call        TSparseList.ForAll
 000860D6    pop         ebx
 000860D7    pop         ecx
 000860D8    pop         ecx
 000860D9    pop         ebp
 000860DA    ret
*}
end;

//000860DC
procedure TStringSparseList.DefineProperties(Filer:TFiler);
begin
{*
 000860DC    push        ebx
 000860DD    push        eax
 000860DE    push        85FF8;TStringSparseList.ReadData
 000860E3    push        eax
 000860E4    push        860A0;TStringSparseList.WriteData
 000860E9    mov         cl,1
 000860EB    mov         eax,edx
 000860ED    mov         edx,86100;'List'
 000860F2    mov         ebx,dword ptr [eax]
 000860F4    call        dword ptr [ebx]
 000860F6    pop         ebx
 000860F7    ret
*}
end;

//00086108
function TStringSparseList.Get(Index:Integer):AnsiString;
begin
{*
 00086108    push        ebx
 00086109    push        esi
 0008610A    push        edi
 0008610B    mov         esi,ecx
 0008610D    mov         edi,edx
 0008610F    mov         ebx,eax
 00086111    mov         edx,edi
 00086113    mov         eax,dword ptr [ebx+0C]
 00086116    call        TSparseList.Get
 0008611B    mov         ebx,eax
 0008611D    test        ebx,ebx
>0008611F    jne         0008612A
 00086121    mov         eax,esi
 00086123    call        @LStrClr
>00086128    jmp         00086134
 0008612A    mov         eax,esi
 0008612C    mov         edx,dword ptr [ebx+4]
 0008612F    call        @LStrLAsg
 00086134    pop         edi
 00086135    pop         esi
 00086136    pop         ebx
 00086137    ret
*}
end;

//00086138
{*function TStringSparseList.GetCount:?;
begin
 00086138    mov         eax,dword ptr [eax+0C];TStringSparseList.FList:TSparseList
 0008613B    mov         eax,dword ptr [eax+8];TSparseList.FCount:Integer
 0008613E    ret
end;*}

//00086140
function TStringSparseList.GetObject(Index:Integer):TObject;
begin
{*
 00086140    push        ebx
 00086141    push        esi
 00086142    mov         esi,edx
 00086144    mov         ebx,eax
 00086146    mov         edx,esi
 00086148    mov         eax,dword ptr [ebx+0C]
 0008614B    call        TSparseList.Get
 00086150    test        eax,eax
>00086152    jne         00086159
 00086154    xor         eax,eax
 00086156    pop         esi
 00086157    pop         ebx
 00086158    ret
 00086159    mov         eax,dword ptr [eax]
 0008615B    pop         esi
 0008615C    pop         ebx
 0008615D    ret
*}
end;

//00086160
procedure TStringSparseList.Put(Index:Integer; const S:AnsiString);
begin
{*
 00086160    push        ebx
 00086161    push        esi
 00086162    push        edi
 00086163    push        ebp
 00086164    push        ecx
 00086165    mov         dword ptr [esp],ecx
 00086168    mov         ebp,edx
 0008616A    mov         ebx,eax
 0008616C    mov         edx,ebp
 0008616E    mov         eax,dword ptr [ebx+0C]
 00086171    call        TSparseList.Get
 00086176    mov         esi,eax
 00086178    test        esi,esi
>0008617A    jne         00086180
 0008617C    xor         edi,edi
>0008617E    jmp         00086182
 00086180    mov         edi,dword ptr [esi]
 00086182    cmp         dword ptr [esp],0
>00086186    jne         0008619A
 00086188    test        edi,edi
>0008618A    jne         0008619A
 0008618C    xor         ecx,ecx
 0008618E    mov         edx,ebp
 00086190    mov         eax,dword ptr [ebx+0C]
 00086193    call        TSparseList.Put
>00086198    jmp         000861B0
 0008619A    mov         edx,edi
 0008619C    mov         eax,dword ptr [esp]
 0008619F    call        NewStrItem
 000861A4    mov         ecx,eax
 000861A6    mov         edx,ebp
 000861A8    mov         eax,dword ptr [ebx+0C]
 000861AB    call        TSparseList.Put
 000861B0    test        esi,esi
>000861B2    je          000861BB
 000861B4    mov         eax,esi
 000861B6    call        DisposeStrItem
 000861BB    mov         eax,ebx
 000861BD    mov         edx,dword ptr [eax]
 000861BF    call        dword ptr [edx+70]
 000861C2    pop         edx
 000861C3    pop         ebp
 000861C4    pop         edi
 000861C5    pop         esi
 000861C6    pop         ebx
 000861C7    ret
*}
end;

//000861C8
procedure TStringSparseList.PutObject(Index:Integer; AObject:TObject);
begin
{*
 000861C8    push        ebx
 000861C9    push        esi
 000861CA    push        edi
 000861CB    mov         esi,ecx
 000861CD    mov         edi,edx
 000861CF    mov         ebx,eax
 000861D1    mov         edx,edi
 000861D3    mov         eax,dword ptr [ebx+0C]
 000861D6    call        TSparseList.Get
 000861DB    test        eax,eax
>000861DD    je          000861E3
 000861DF    mov         dword ptr [eax],esi
>000861E1    jmp         000861FC
 000861E3    test        esi,esi
>000861E5    je          000861FC
 000861E7    mov         edx,esi
 000861E9    xor         eax,eax
 000861EB    call        NewStrItem
 000861F0    mov         ecx,eax
 000861F2    mov         edx,edi
 000861F4    mov         eax,dword ptr [ebx+0C]
 000861F7    call        TSparseList.Put
 000861FC    mov         eax,ebx
 000861FE    mov         edx,dword ptr [eax]
 00086200    call        dword ptr [edx+70]
 00086203    pop         edi
 00086204    pop         esi
 00086205    pop         ebx
 00086206    ret
*}
end;

//00086208
procedure TStringSparseList.Changed;
begin
{*
 00086208    push        ebx
 00086209    cmp         word ptr [eax+12],0
>0008620E    je          0008621A
 00086210    mov         ebx,eax
 00086212    mov         edx,eax
 00086214    mov         eax,dword ptr [ebx+14]
 00086217    call        dword ptr [ebx+10]
 0008621A    pop         ebx
 0008621B    ret
*}
end;

//0008621C
procedure TStringSparseList.Error;
begin
{*
 0008621C    push        ebp
 0008621D    mov         ebp,esp
 0008621F    push        0
 00086221    xor         eax,eax
 00086223    push        ebp
 00086224    push        86266
 00086229    push        dword ptr fs:[eax]
 0008622C    mov         dword ptr fs:[eax],esp
 0008622F    lea         edx,[ebp-4]
 00086232    mov         eax,[000B5938];^SPutObjectError:TResStringRec
 00086237    call        LoadResString
 0008623C    mov         ecx,dword ptr [ebp-4]
 0008623F    mov         dl,1
 00086241    mov         eax,[00085808];EStringSparseListError
 00086246    call        Exception.Create
 0008624B    call        @RaiseExcept
 00086250    xor         eax,eax
 00086252    pop         edx
 00086253    pop         ecx
 00086254    pop         ecx
 00086255    mov         dword ptr fs:[eax],edx
 00086258    push        8626D
 0008625D    lea         eax,[ebp-4]
 00086260    call        @LStrClr
 00086265    ret
>00086266    jmp         @HandleFinally
>0008626B    jmp         0008625D
 0008626D    pop         ecx
 0008626E    pop         ebp
 0008626F    ret
*}
end;

//00086270
procedure TStringSparseList.Delete(Index:Integer);
begin
{*
 00086270    push        ebx
 00086271    push        esi
 00086272    mov         esi,edx
 00086274    mov         ebx,eax
 00086276    mov         edx,esi
 00086278    mov         eax,dword ptr [ebx+0C]
 0008627B    call        TSparseList.Get
 00086280    test        eax,eax
>00086282    je          00086289
 00086284    call        DisposeStrItem
 00086289    mov         edx,esi
 0008628B    mov         eax,dword ptr [ebx+0C]
 0008628E    call        TSparseList.Delete
 00086293    mov         eax,ebx
 00086295    mov         edx,dword ptr [eax]
 00086297    call        dword ptr [edx+70]
 0008629A    pop         esi
 0008629B    pop         ebx
 0008629C    ret
*}
end;

//000862A0
procedure TStringSparseList.Exchange(Index1:Integer; Index2:Integer);
begin
{*
 000862A0    mov         eax,dword ptr [eax+0C]
 000862A3    call        TSparseList.Exchange
 000862A8    ret
*}
end;

//000862AC
procedure TStringSparseList.Insert(Index:Integer; const S:AnsiString);
begin
{*
 000862AC    push        ebx
 000862AD    push        esi
 000862AE    push        edi
 000862AF    mov         edi,ecx
 000862B1    mov         esi,edx
 000862B3    mov         ebx,eax
 000862B5    xor         edx,edx
 000862B7    mov         eax,edi
 000862B9    call        NewStrItem
 000862BE    mov         ecx,eax
 000862C0    mov         edx,esi
 000862C2    mov         eax,dword ptr [ebx+0C]
 000862C5    call        TSparseList.Insert
 000862CA    mov         eax,ebx
 000862CC    mov         edx,dword ptr [eax]
 000862CE    call        dword ptr [edx+70]
 000862D1    pop         edi
 000862D2    pop         esi
 000862D3    pop         ebx
 000862D4    ret
*}
end;

//000862D8
function ClearItem(TheIndex:Integer; TheItem:Pointer):Integer;
begin
{*
 000862D8    mov         eax,edx
 000862DA    call        DisposeStrItem
 000862DF    xor         eax,eax
 000862E1    ret
*}
end;

//000862E4
procedure TStringSparseList.Clear;
begin
{*
 000862E4    push        ebx
 000862E5    mov         ebx,eax
 000862E7    mov         edx,862D8;ClearItem:Integer
 000862EC    mov         eax,dword ptr [ebx+0C]
 000862EF    call        TSparseList.ForAll
 000862F4    mov         eax,dword ptr [ebx+0C]
 000862F7    call        TSparseList.Clear
 000862FC    mov         eax,ebx
 000862FE    mov         edx,dword ptr [eax]
 00086300    call        dword ptr [edx+70]
 00086303    pop         ebx
 00086304    ret
*}
end;

//00086308
constructor TStringGridStrings.Create(AGrid:TStringGrid; AIndex:Longint);
begin
{*
 00086308    push        ebp
 00086309    mov         ebp,esp
 0008630B    push        ebx
 0008630C    push        esi
 0008630D    push        edi
 0008630E    test        dl,dl
>00086310    je          0008631A
 00086312    add         esp,0FFFFFFF0
 00086315    call        @ClassCreate
 0008631A    mov         esi,ecx
 0008631C    mov         ebx,edx
 0008631E    mov         edi,eax
 00086320    xor         edx,edx
 00086322    mov         eax,edi
 00086324    call        TObject.Create
 00086329    mov         dword ptr [edi+0C],esi
 0008632C    mov         eax,dword ptr [ebp+8]
 0008632F    mov         dword ptr [edi+10],eax
 00086332    mov         eax,edi
 00086334    test        bl,bl
>00086336    je          00086347
 00086338    call        @AfterConstruction
 0008633D    pop         dword ptr fs:[0]
 00086344    add         esp,0C
 00086347    mov         eax,edi
 00086349    pop         edi
 0008634A    pop         esi
 0008634B    pop         ebx
 0008634C    pop         ebp
 0008634D    ret         4
*}
end;

//00086350
procedure TStringGridStrings.Assign(Source:TPersistent);
begin
{*
 00086350    push        ebp
 00086351    mov         ebp,esp
 00086353    add         esp,0FFFFFFF4
 00086356    push        ebx
 00086357    push        esi
 00086358    push        edi
 00086359    xor         ecx,ecx
 0008635B    mov         dword ptr [ebp-0C],ecx
 0008635E    mov         esi,edx
 00086360    mov         dword ptr [ebp-4],eax
 00086363    xor         eax,eax
 00086365    push        ebp
 00086366    push        86438
 0008636B    push        dword ptr fs:[eax]
 0008636E    mov         dword ptr fs:[eax],esp
 00086371    mov         eax,esi
 00086373    mov         edx,dword ptr ds:[1F220];TStrings
 00086379    call        @IsClass
 0008637E    test        al,al
>00086380    je          00086418
 00086386    mov         eax,dword ptr [ebp-4]
 00086389    call        TStrings.BeginUpdate
 0008638E    mov         eax,esi
 00086390    mov         edx,dword ptr [eax]
 00086392    call        dword ptr [edx+14]
 00086395    mov         ebx,eax
 00086397    dec         ebx
 00086398    mov         eax,dword ptr [ebp-4]
 0008639B    mov         edx,dword ptr [eax]
 0008639D    call        dword ptr [edx+14]
 000863A0    cmp         ebx,eax
>000863A2    jl          000863AF
 000863A4    mov         eax,dword ptr [ebp-4]
 000863A7    mov         edx,dword ptr [eax]
 000863A9    call        dword ptr [edx+14]
 000863AC    mov         ebx,eax
 000863AE    dec         ebx
 000863AF    xor         eax,eax
 000863B1    push        ebp
 000863B2    push        86411
 000863B7    push        dword ptr fs:[eax]
 000863BA    mov         dword ptr fs:[eax],esp
 000863BD    test        ebx,ebx
>000863BF    jl          000863FB
 000863C1    inc         ebx
 000863C2    mov         dword ptr [ebp-8],ebx
 000863C5    xor         ebx,ebx
 000863C7    lea         ecx,[ebp-0C]
 000863CA    mov         edx,ebx
 000863CC    mov         eax,esi
 000863CE    mov         edi,dword ptr [eax]
 000863D0    call        dword ptr [edi+0C]
 000863D3    mov         ecx,dword ptr [ebp-0C]
 000863D6    mov         edx,ebx
 000863D8    mov         eax,dword ptr [ebp-4]
 000863DB    mov         edi,dword ptr [eax]
 000863DD    call        dword ptr [edi+20]
 000863E0    mov         edx,ebx
 000863E2    mov         eax,esi
 000863E4    mov         ecx,dword ptr [eax]
 000863E6    call        dword ptr [ecx+18]
 000863E9    mov         ecx,eax
 000863EB    mov         edx,ebx
 000863ED    mov         eax,dword ptr [ebp-4]
 000863F0    mov         edi,dword ptr [eax]
 000863F2    call        dword ptr [edi+24]
 000863F5    inc         ebx
 000863F6    dec         dword ptr [ebp-8]
>000863F9    jne         000863C7
 000863FB    xor         eax,eax
 000863FD    pop         edx
 000863FE    pop         ecx
 000863FF    pop         ecx
 00086400    mov         dword ptr fs:[eax],edx
 00086403    push        86422
 00086408    mov         eax,dword ptr [ebp-4]
 0008640B    call        TStrings.EndUpdate
 00086410    ret
>00086411    jmp         @HandleFinally
>00086416    jmp         00086408
 00086418    mov         edx,esi
 0008641A    mov         eax,dword ptr [ebp-4]
 0008641D    call        TStrings.Assign
 00086422    xor         eax,eax
 00086424    pop         edx
 00086425    pop         ecx
 00086426    pop         ecx
 00086427    mov         dword ptr fs:[eax],edx
 0008642A    push        8643F
 0008642F    lea         eax,[ebp-0C]
 00086432    call        @LStrClr
 00086437    ret
>00086438    jmp         @HandleFinally
>0008643D    jmp         0008642F
 0008643F    pop         edi
 00086440    pop         esi
 00086441    pop         ebx
 00086442    mov         esp,ebp
 00086444    pop         ebp
 00086445    ret
*}
end;

//00086448
procedure TStringGridStrings.CalcXY(Index:Integer; var X:Integer; var Y:Integer);
begin
{*
 00086448    push        ebp
 00086449    mov         ebp,esp
 0008644B    push        ecx
 0008644C    push        ebx
 0008644D    push        esi
 0008644E    mov         dword ptr [ebp-4],edx
 00086451    mov         edx,dword ptr [ebp+8]
 00086454    mov         ebx,dword ptr [eax+10]
 00086457    test        ebx,ebx
>00086459    jne         00086469
 0008645B    mov         dword ptr [ecx],0FFFFFFFF
 00086461    mov         dword ptr [edx],0FFFFFFFF
>00086467    jmp         00086481
 00086469    test        ebx,ebx
>0008646B    jle         00086477
 0008646D    mov         esi,dword ptr [ebp-4]
 00086470    mov         dword ptr [ecx],esi
 00086472    dec         ebx
 00086473    mov         dword ptr [edx],ebx
>00086475    jmp         00086481
 00086477    neg         ebx
 00086479    dec         ebx
 0008647A    mov         dword ptr [ecx],ebx
 0008647C    mov         eax,dword ptr [ebp-4]
 0008647F    mov         dword ptr [edx],eax
 00086481    pop         esi
 00086482    pop         ebx
 00086483    pop         ecx
 00086484    pop         ebp
 00086485    ret         4
*}
end;

//00086488
function TStringGridStrings.Add(const S:AnsiString):Integer;
begin
{*
 00086488    push        ebp
 00086489    mov         ebp,esp
 0008648B    add         esp,0FFFFFFF4
 0008648E    push        ebx
 0008648F    push        esi
 00086490    push        edi
 00086491    xor         ecx,ecx
 00086493    mov         dword ptr [ebp-0C],ecx
 00086496    mov         dword ptr [ebp-8],edx
 00086499    mov         dword ptr [ebp-4],eax
 0008649C    xor         eax,eax
 0008649E    push        ebp
 0008649F    push        864FB
 000864A4    push        dword ptr fs:[eax]
 000864A7    mov         dword ptr fs:[eax],esp
 000864AA    mov         eax,dword ptr [ebp-4]
 000864AD    mov         edx,dword ptr [eax]
 000864AF    call        dword ptr [edx+14]
 000864B2    mov         esi,eax
 000864B4    dec         esi
 000864B5    test        esi,esi
>000864B7    jl          000864E2
 000864B9    inc         esi
 000864BA    xor         ebx,ebx
 000864BC    lea         ecx,[ebp-0C]
 000864BF    mov         edx,ebx
 000864C1    mov         eax,dword ptr [ebp-4]
 000864C4    mov         edi,dword ptr [eax]
 000864C6    call        dword ptr [edi+0C]
 000864C9    cmp         dword ptr [ebp-0C],0
>000864CD    jne         000864DE
 000864CF    mov         ecx,dword ptr [ebp-8]
 000864D2    mov         edx,ebx
 000864D4    mov         eax,dword ptr [ebp-4]
 000864D7    mov         esi,dword ptr [eax]
 000864D9    call        dword ptr [esi+20]
>000864DC    jmp         000864E5
 000864DE    inc         ebx
 000864DF    dec         esi
>000864E0    jne         000864BC
 000864E2    or          ebx,0FFFFFFFF
 000864E5    xor         eax,eax
 000864E7    pop         edx
 000864E8    pop         ecx
 000864E9    pop         ecx
 000864EA    mov         dword ptr fs:[eax],edx
 000864ED    push        86502
 000864F2    lea         eax,[ebp-0C]
 000864F5    call        @LStrClr
 000864FA    ret
>000864FB    jmp         @HandleFinally
>00086500    jmp         000864F2
 00086502    mov         eax,ebx
 00086504    pop         edi
 00086505    pop         esi
 00086506    pop         ebx
 00086507    mov         esp,ebp
 00086509    pop         ebp
 0008650A    ret
*}
end;

//0008650C
function BlankStr(TheIndex:Integer; TheItem:Pointer):Integer;
begin
{*
 0008650C    push        ebp
 0008650D    mov         ebp,esp
 0008650F    push        ebx
 00086510    push        esi
 00086511    mov         ebx,eax
 00086513    mov         eax,dword ptr [ebp+8]
 00086516    mov         eax,dword ptr [eax-4]
 00086519    xor         ecx,ecx
 0008651B    mov         edx,ebx
 0008651D    mov         esi,dword ptr [eax]
 0008651F    call        dword ptr [esi+24]
 00086522    mov         eax,dword ptr [ebp+8]
 00086525    mov         eax,dword ptr [eax-4]
 00086528    xor         ecx,ecx
 0008652A    mov         edx,ebx
 0008652C    mov         ebx,dword ptr [eax]
 0008652E    call        dword ptr [ebx+20]
 00086531    xor         eax,eax
 00086533    pop         esi
 00086534    pop         ebx
 00086535    pop         ebp
 00086536    ret
*}
end;

//00086538
procedure TStringGridStrings.Clear;
begin
{*
 00086538    push        ebp
 00086539    mov         ebp,esp
 0008653B    push        ecx
 0008653C    push        ebx
 0008653D    push        esi
 0008653E    mov         dword ptr [ebp-4],eax
 00086541    mov         eax,dword ptr [ebp-4]
 00086544    mov         ebx,dword ptr [eax+10]
 00086547    test        ebx,ebx
>00086549    jle         00086572
 0008654B    mov         edx,ebx
 0008654D    dec         edx
 0008654E    mov         eax,dword ptr [ebp-4]
 00086551    mov         eax,dword ptr [eax+0C]
 00086554    mov         eax,dword ptr [eax+2B4]
 0008655A    call        TSparseList.Get
 0008655F    test        eax,eax
>00086561    je          000865A4
 00086563    mov         edx,8650C;BlankStr:Integer
 00086568    mov         eax,dword ptr [eax+0C]
 0008656B    call        TSparseList.ForAll
>00086570    jmp         000865A4
 00086572    test        ebx,ebx
>00086574    jge         000865A4
 00086576    mov         eax,dword ptr [ebp-4]
 00086579    mov         edx,dword ptr [eax]
 0008657B    call        dword ptr [edx+14]
 0008657E    mov         ebx,eax
 00086580    dec         ebx
 00086581    cmp         ebx,0
>00086584    jl          000865A4
 00086586    xor         ecx,ecx
 00086588    mov         edx,ebx
 0008658A    mov         eax,dword ptr [ebp-4]
 0008658D    mov         esi,dword ptr [eax]
 0008658F    call        dword ptr [esi+24]
 00086592    xor         ecx,ecx
 00086594    mov         edx,ebx
 00086596    mov         eax,dword ptr [ebp-4]
 00086599    mov         esi,dword ptr [eax]
 0008659B    call        dword ptr [esi+20]
 0008659E    dec         ebx
 0008659F    cmp         ebx,0FFFFFFFF
>000865A2    jne         00086586
 000865A4    pop         esi
 000865A5    pop         ebx
 000865A6    pop         ecx
 000865A7    pop         ebp
 000865A8    ret
*}
end;

//000865AC
procedure TStringGridStrings.Delete(Index:Integer);
begin
{*
 000865AC    push        ebp
 000865AD    mov         ebp,esp
 000865AF    push        0
 000865B1    xor         eax,eax
 000865B3    push        ebp
 000865B4    push        865EA
 000865B9    push        dword ptr fs:[eax]
 000865BC    mov         dword ptr fs:[eax],esp
 000865BF    lea         edx,[ebp-4]
 000865C2    mov         eax,[000B56B8];^SInvalidStringGridOp:TResStringRec
 000865C7    call        LoadResString
 000865CC    mov         eax,dword ptr [ebp-4]
 000865CF    call        InvalidOp
 000865D4    xor         eax,eax
 000865D6    pop         edx
 000865D7    pop         ecx
 000865D8    pop         ecx
 000865D9    mov         dword ptr fs:[eax],edx
 000865DC    push        865F1
 000865E1    lea         eax,[ebp-4]
 000865E4    call        @LStrClr
 000865E9    ret
>000865EA    jmp         @HandleFinally
>000865EF    jmp         000865E1
 000865F1    pop         ecx
 000865F2    pop         ebp
 000865F3    ret
*}
end;

//000865F4
function TStringGridStrings.Get(Index:Integer):AnsiString;
begin
{*
 000865F4    push        ebx
 000865F5    push        esi
 000865F6    add         esp,0FFFFFFF8
 000865F9    mov         esi,ecx
 000865FB    mov         ebx,eax
 000865FD    lea         eax,[esp+4]
 00086601    push        eax
 00086602    lea         ecx,[esp+4]
 00086606    mov         eax,ebx
 00086608    call        TStringGridStrings.CalcXY
 0008660D    cmp         dword ptr [esp],0
>00086611    jge         0008661C
 00086613    mov         eax,esi
 00086615    call        @LStrClr
>0008661A    jmp         0008662D
 0008661C    push        esi
 0008661D    mov         ecx,dword ptr [esp+8]
 00086621    mov         edx,dword ptr [esp+4]
 00086625    mov         eax,dword ptr [ebx+0C]
 00086628    call        TStringGrid.GetCells
 0008662D    pop         ecx
 0008662E    pop         edx
 0008662F    pop         esi
 00086630    pop         ebx
 00086631    ret
*}
end;

//00086634
function TStringGridStrings.GetCount:Integer;
begin
{*
 00086634    mov         edx,dword ptr [eax+10]
 00086637    test        edx,edx
>00086639    jne         0008663E
 0008663B    xor         eax,eax
 0008663D    ret
 0008663E    test        edx,edx
>00086640    jle         0008664D
 00086642    mov         eax,dword ptr [eax+0C]
 00086645    mov         eax,dword ptr [eax+1FC]
>0008664B    jmp         00086656
 0008664D    mov         eax,dword ptr [eax+0C]
 00086650    mov         eax,dword ptr [eax+22C]
 00086656    ret
*}
end;

//00086658
function TStringGridStrings.GetObject(Index:Integer):TObject;
begin
{*
 00086658    push        ebx
 00086659    add         esp,0FFFFFFF8
 0008665C    mov         ebx,eax
 0008665E    lea         eax,[esp+4]
 00086662    push        eax
 00086663    lea         ecx,[esp+4]
 00086667    mov         eax,ebx
 00086669    call        TStringGridStrings.CalcXY
 0008666E    cmp         dword ptr [esp],0
>00086672    jge         00086678
 00086674    xor         eax,eax
>00086676    jmp         00086687
 00086678    mov         ecx,dword ptr [esp+4]
 0008667C    mov         edx,dword ptr [esp]
 0008667F    mov         eax,dword ptr [ebx+0C]
 00086682    call        TStringGrid.GetObjects
 00086687    pop         ecx
 00086688    pop         edx
 00086689    pop         ebx
 0008668A    ret
*}
end;

//0008668C
procedure TStringGridStrings.Insert(Index:Integer; const S:AnsiString);
begin
{*
 0008668C    push        ebp
 0008668D    mov         ebp,esp
 0008668F    push        0
 00086691    push        ebx
 00086692    xor         eax,eax
 00086694    push        ebp
 00086695    push        866CB
 0008669A    push        dword ptr fs:[eax]
 0008669D    mov         dword ptr fs:[eax],esp
 000866A0    lea         edx,[ebp-4]
 000866A3    mov         eax,[000B56B8];^SInvalidStringGridOp:TResStringRec
 000866A8    call        LoadResString
 000866AD    mov         eax,dword ptr [ebp-4]
 000866B0    call        InvalidOp
 000866B5    xor         eax,eax
 000866B7    pop         edx
 000866B8    pop         ecx
 000866B9    pop         ecx
 000866BA    mov         dword ptr fs:[eax],edx
 000866BD    push        866D2
 000866C2    lea         eax,[ebp-4]
 000866C5    call        @LStrClr
 000866CA    ret
>000866CB    jmp         @HandleFinally
>000866D0    jmp         000866C2
 000866D2    pop         ebx
 000866D3    pop         ecx
 000866D4    pop         ebp
 000866D5    ret
*}
end;

//000866D8
procedure TStringGridStrings.Put(Index:Integer; const S:AnsiString);
begin
{*
 000866D8    push        ebx
 000866D9    push        esi
 000866DA    add         esp,0FFFFFFF8
 000866DD    mov         esi,ecx
 000866DF    mov         ebx,eax
 000866E1    lea         eax,[esp+4]
 000866E5    push        eax
 000866E6    lea         ecx,[esp+4]
 000866EA    mov         eax,ebx
 000866EC    call        TStringGridStrings.CalcXY
 000866F1    push        esi
 000866F2    mov         ecx,dword ptr [esp+8]
 000866F6    mov         edx,dword ptr [esp+4]
 000866FA    mov         eax,dword ptr [ebx+0C]
 000866FD    call        TStringGrid.SetCells
 00086702    pop         ecx
 00086703    pop         edx
 00086704    pop         esi
 00086705    pop         ebx
 00086706    ret
*}
end;

//00086708
procedure TStringGridStrings.PutObject(Index:Integer; AObject:TObject);
begin
{*
 00086708    push        ebx
 00086709    push        esi
 0008670A    add         esp,0FFFFFFF8
 0008670D    mov         esi,ecx
 0008670F    mov         ebx,eax
 00086711    lea         eax,[esp+4]
 00086715    push        eax
 00086716    lea         ecx,[esp+4]
 0008671A    mov         eax,ebx
 0008671C    call        TStringGridStrings.CalcXY
 00086721    push        esi
 00086722    mov         ecx,dword ptr [esp+8]
 00086726    mov         edx,dword ptr [esp+4]
 0008672A    mov         eax,dword ptr [ebx+0C]
 0008672D    call        TStringGrid.SetObjects
 00086732    pop         ecx
 00086733    pop         edx
 00086734    pop         esi
 00086735    pop         ebx
 00086736    ret
*}
end;

//00086738
procedure TStringGridStrings.SetUpdateState(Updating:Boolean);
begin
{*
 00086738    mov         eax,dword ptr [eax+0C]
 0008673B    call        TStringGrid.SetUpdateState
 00086740    ret
*}
end;

//00086744
constructor TStringGrid.Create(AOwner:TComponent);
begin
{*
 00086744    push        ebx
 00086745    push        esi
 00086746    test        dl,dl
>00086748    je          00086752
 0008674A    add         esp,0FFFFFFF0
 0008674D    call        @ClassCreate
 00086752    mov         ebx,edx
 00086754    mov         esi,eax
 00086756    xor         edx,edx
 00086758    mov         eax,esi
 0008675A    call        TCustomGrid.Create
 0008675F    mov         eax,esi
 00086761    call        TStringGrid.Initialize
 00086766    mov         eax,esi
 00086768    test        bl,bl
>0008676A    je          0008677B
 0008676C    call        @AfterConstruction
 00086771    pop         dword ptr fs:[0]
 00086778    add         esp,0C
 0008677B    mov         eax,esi
 0008677D    pop         esi
 0008677E    pop         ebx
 0008677F    ret
*}
end;

//00086780
function FreeItem(TheIndex:Integer; TheItem:Pointer):Integer;
begin
{*
 00086780    mov         eax,edx
 00086782    call        TObject.Free
 00086787    xor         eax,eax
 00086789    ret
*}
end;

//0008678C
destructor TStringGrid.Destroy;
begin
{*
 0008678C    push        ebx
 0008678D    push        esi
 0008678E    call        @BeforeDestruction
 00086793    mov         ebx,edx
 00086795    mov         esi,eax
 00086797    cmp         dword ptr [esi+2B8],0
>0008679E    je          000867BB
 000867A0    mov         edx,86780;FreeItem:Integer
 000867A5    mov         eax,dword ptr [esi+2B8]
 000867AB    call        TSparseList.ForAll
 000867B0    mov         eax,dword ptr [esi+2B8]
 000867B6    call        TObject.Free
 000867BB    cmp         dword ptr [esi+2BC],0
>000867C2    je          000867DF
 000867C4    mov         edx,86780;FreeItem:Integer
 000867C9    mov         eax,dword ptr [esi+2BC]
 000867CF    call        TSparseList.ForAll
 000867D4    mov         eax,dword ptr [esi+2BC]
 000867DA    call        TObject.Free
 000867DF    cmp         dword ptr [esi+2B4],0
>000867E6    je          00086803
 000867E8    mov         edx,86780;FreeItem:Integer
 000867ED    mov         eax,dword ptr [esi+2B4]
 000867F3    call        TSparseList.ForAll
 000867F8    mov         eax,dword ptr [esi+2B4]
 000867FE    call        TObject.Free
 00086803    mov         edx,ebx
 00086805    and         dl,0FC
 00086808    mov         eax,esi
 0008680A    call        TCustomGrid.Destroy
 0008680F    test        bl,bl
>00086811    jle         0008681A
 00086813    mov         eax,esi
 00086815    call        @ClassDestroy
 0008681A    pop         esi
 0008681B    pop         ebx
 0008681C    ret
*}
end;

//00086820
function MoveColData(Index:Integer; ARow:TStringSparseList):Integer;
begin
{*
 00086820    push        ebp
 00086821    mov         ebp,esp
 00086823    push        ebx
 00086824    mov         eax,dword ptr [ebp+8]
 00086827    mov         ecx,dword ptr [eax-8]
 0008682A    mov         eax,dword ptr [ebp+8]
 0008682D    mov         eax,dword ptr [eax-4]
 00086830    xchg        eax,edx
 00086831    mov         ebx,dword ptr [eax]
 00086833    call        dword ptr [ebx+60]
 00086836    xor         eax,eax
 00086838    pop         ebx
 00086839    pop         ebp
 0008683A    ret
*}
end;

//0008683C
procedure TStringGrid.ColumnMoved(FromIndex:Longint; ToIndex:Longint);
begin
{*
 0008683C    push        ebp
 0008683D    mov         ebp,esp
 0008683F    add         esp,0FFFFFFF8
 00086842    push        ebx
 00086843    mov         dword ptr [ebp-8],ecx
 00086846    mov         dword ptr [ebp-4],edx
 00086849    mov         ebx,eax
 0008684B    mov         edx,86820;MoveColData:Integer
 00086850    mov         eax,dword ptr [ebx+2B4]
 00086856    call        TSparseList.ForAll
 0008685B    mov         eax,ebx
 0008685D    mov         edx,dword ptr [eax]
 0008685F    call        dword ptr [edx+78]
 00086862    mov         ecx,dword ptr [ebp-8]
 00086865    mov         edx,dword ptr [ebp-4]
 00086868    mov         eax,ebx
 0008686A    call        TDrawGrid.ColumnMoved
 0008686F    pop         ebx
 00086870    pop         ecx
 00086871    pop         ecx
 00086872    pop         ebp
 00086873    ret
*}
end;

//00086874
procedure TStringGrid.RowMoved(FromIndex:Longint; ToIndex:Longint);
begin
{*
 00086874    push        ebx
 00086875    push        esi
 00086876    push        edi
 00086877    mov         edi,ecx
 00086879    mov         esi,edx
 0008687B    mov         ebx,eax
 0008687D    mov         ecx,edi
 0008687F    mov         edx,esi
 00086881    mov         eax,dword ptr [ebx+2B4]
 00086887    call        TSparseList.Move
 0008688C    mov         eax,ebx
 0008688E    mov         edx,dword ptr [eax]
 00086890    call        dword ptr [edx+78]
 00086893    mov         ecx,edi
 00086895    mov         edx,esi
 00086897    mov         eax,ebx
 00086899    call        TDrawGrid.RowMoved
 0008689E    pop         edi
 0008689F    pop         esi
 000868A0    pop         ebx
 000868A1    ret
*}
end;

//000868A4
procedure TStringGrid.GetEditText(ACol:Longint; ARow:Longint);
begin
{*
 000868A4    push        ebp
 000868A5    mov         ebp,esp
 000868A7    push        ebx
 000868A8    push        esi
 000868A9    push        edi
 000868AA    mov         edi,ecx
 000868AC    mov         esi,edx
 000868AE    mov         ebx,eax
 000868B0    mov         eax,dword ptr [ebp+8]
 000868B3    push        eax
 000868B4    mov         ecx,edi
 000868B6    mov         edx,esi
 000868B8    mov         eax,ebx
 000868BA    call        TStringGrid.GetCells
 000868BF    cmp         word ptr [ebx+28E],0
>000868C7    je          000868DE
 000868C9    push        edi
 000868CA    mov         eax,dword ptr [ebp+8]
 000868CD    push        eax
 000868CE    mov         ecx,esi
 000868D0    mov         edx,ebx
 000868D2    mov         eax,dword ptr [ebx+290]
 000868D8    call        dword ptr [ebx+28C]
 000868DE    pop         edi
 000868DF    pop         esi
 000868E0    pop         ebx
 000868E1    pop         ebp
 000868E2    ret         4
*}
end;

//000868E8
procedure TStringGrid.SetEditText(ACol:Longint; ARow:Longint; const Value:AnsiString);
begin
{*
 000868E8    push        ebp
 000868E9    mov         ebp,esp
 000868EB    add         esp,0FFFFFFF0
 000868EE    push        ebx
 000868EF    xor         ebx,ebx
 000868F1    mov         dword ptr [ebp-10],ebx
 000868F4    mov         dword ptr [ebp-0C],ecx
 000868F7    mov         dword ptr [ebp-8],edx
 000868FA    mov         dword ptr [ebp-4],eax
 000868FD    xor         eax,eax
 000868FF    push        ebp
 00086900    push        86997
 00086905    push        dword ptr fs:[eax]
 00086908    mov         dword ptr fs:[eax],esp
 0008690B    mov         eax,dword ptr [ebp-4]
 0008690E    call        TStringGrid.DisableEditUpdate
 00086913    xor         eax,eax
 00086915    push        ebp
 00086916    push        86968
 0008691B    push        dword ptr fs:[eax]
 0008691E    mov         dword ptr fs:[eax],esp
 00086921    lea         eax,[ebp-10]
 00086924    push        eax
 00086925    mov         ecx,dword ptr [ebp-0C]
 00086928    mov         edx,dword ptr [ebp-8]
 0008692B    mov         eax,dword ptr [ebp-4]
 0008692E    call        TStringGrid.GetCells
 00086933    mov         edx,dword ptr [ebp-10]
 00086936    mov         eax,dword ptr [ebp+8]
 00086939    call        @LStrCmp
>0008693E    je          00086952
 00086940    mov         eax,dword ptr [ebp+8]
 00086943    push        eax
 00086944    mov         ecx,dword ptr [ebp-0C]
 00086947    mov         edx,dword ptr [ebp-8]
 0008694A    mov         eax,dword ptr [ebp-4]
 0008694D    call        TStringGrid.SetCells
 00086952    xor         eax,eax
 00086954    pop         edx
 00086955    pop         ecx
 00086956    pop         ecx
 00086957    mov         dword ptr fs:[eax],edx
 0008695A    push        8696F
 0008695F    mov         eax,dword ptr [ebp-4]
 00086962    call        TStringGrid.EnableEditUpdate
 00086967    ret
>00086968    jmp         @HandleFinally
>0008696D    jmp         0008695F
 0008696F    mov         eax,dword ptr [ebp+8]
 00086972    push        eax
 00086973    mov         ecx,dword ptr [ebp-0C]
 00086976    mov         edx,dword ptr [ebp-8]
 00086979    mov         eax,dword ptr [ebp-4]
 0008697C    call        TDrawGrid.SetEditText
 00086981    xor         eax,eax
 00086983    pop         edx
 00086984    pop         ecx
 00086985    pop         ecx
 00086986    mov         dword ptr fs:[eax],edx
 00086989    push        8699E
 0008698E    lea         eax,[ebp-10]
 00086991    call        @LStrClr
 00086996    ret
>00086997    jmp         @HandleFinally
>0008699C    jmp         0008698E
 0008699E    pop         ebx
 0008699F    mov         esp,ebp
 000869A1    pop         ebp
 000869A2    ret         4
*}
end;

//000869A8
procedure TStringGrid.DrawCell(ACol:Longint; ARow:Longint; ARect:TRect; AState:TGridDrawState);
begin
{*
 000869A8    push        ebp
 000869A9    mov         ebp,esp
 000869AB    add         esp,0FFFFFFEC
 000869AE    push        ebx
 000869AF    push        esi
 000869B0    push        edi
 000869B1    xor         ebx,ebx
 000869B3    mov         dword ptr [ebp-14],ebx
 000869B6    mov         esi,dword ptr [ebp+0C]
 000869B9    lea         edi,[ebp-10]
 000869BC    push        ecx
 000869BD    mov         ecx,4
 000869C2    rep movs    dword ptr [edi],dword ptr [esi]
 000869C4    pop         ecx
 000869C5    mov         edi,ecx
 000869C7    mov         esi,edx
 000869C9    mov         ebx,eax
 000869CB    xor         eax,eax
 000869CD    push        ebp
 000869CE    push        86A39
 000869D3    push        dword ptr fs:[eax]
 000869D6    mov         dword ptr fs:[eax],esp
 000869D9    cmp         byte ptr [ebx+26C],0
>000869E0    je          00086A10
 000869E2    mov         eax,dword ptr [ebp-0C]
 000869E5    add         eax,2
 000869E8    push        eax
 000869E9    lea         eax,[ebp-14]
 000869EC    push        eax
 000869ED    mov         ecx,edi
 000869EF    mov         edx,esi
 000869F1    mov         eax,ebx
 000869F3    call        TStringGrid.GetCells
 000869F8    mov         eax,dword ptr [ebp-14]
 000869FB    push        eax
 000869FC    mov         ecx,dword ptr [ebp-10]
 000869FF    add         ecx,2
 00086A02    lea         edx,[ebp-10]
 00086A05    mov         eax,dword ptr [ebx+1EC]
 00086A0B    call        TCanvas.TextRect
 00086A10    lea         eax,[ebp-10]
 00086A13    push        eax
 00086A14    mov         al,byte ptr [ebp+8]
 00086A17    push        eax
 00086A18    mov         ecx,edi
 00086A1A    mov         edx,esi
 00086A1C    mov         eax,ebx
 00086A1E    call        TDrawGrid.DrawCell
 00086A23    xor         eax,eax
 00086A25    pop         edx
 00086A26    pop         ecx
 00086A27    pop         ecx
 00086A28    mov         dword ptr fs:[eax],edx
 00086A2B    push        86A40
 00086A30    lea         eax,[ebp-14]
 00086A33    call        @LStrClr
 00086A38    ret
>00086A39    jmp         @HandleFinally
>00086A3E    jmp         00086A30
 00086A40    pop         edi
 00086A41    pop         esi
 00086A42    pop         ebx
 00086A43    mov         esp,ebp
 00086A45    pop         ebp
 00086A46    ret         8
*}
end;

//00086A4C
procedure TStringGrid.DisableEditUpdate;
begin
{*
 00086A4C    inc         dword ptr [eax+2C4]
 00086A52    ret
*}
end;

//00086A54
procedure TStringGrid.EnableEditUpdate;
begin
{*
 00086A54    dec         dword ptr [eax+2C4]
 00086A5A    ret
*}
end;

//00086A5C
procedure TStringGrid.Initialize;
begin
{*
 00086A5C    push        ebx
 00086A5D    push        esi
 00086A5E    mov         esi,eax
 00086A60    cmp         dword ptr [esi+2BC],0
>00086A67    jne         00086A8F
 00086A69    cmp         dword ptr [esi+1FC],200
>00086A73    jle         00086A79
 00086A75    mov         bl,1
>00086A77    jmp         00086A7B
 00086A79    xor         ebx,ebx
 00086A7B    mov         ecx,ebx
 00086A7D    mov         dl,1
 00086A7F    mov         eax,[000858CC];TSparseList
 00086A84    call        TSparseList.Create
 00086A89    mov         dword ptr [esi+2BC],eax
 00086A8F    cmp         dword ptr [esi+22C],100
>00086A99    jle         00086A9F
 00086A9B    mov         bl,1
>00086A9D    jmp         00086AA1
 00086A9F    xor         ebx,ebx
 00086AA1    cmp         dword ptr [esi+2B8],0
>00086AA8    jne         00086ABE
 00086AAA    mov         ecx,ebx
 00086AAC    mov         dl,1
 00086AAE    mov         eax,[000858CC];TSparseList
 00086AB3    call        TSparseList.Create
 00086AB8    mov         dword ptr [esi+2B8],eax
 00086ABE    cmp         dword ptr [esi+2B4],0
>00086AC5    jne         00086ADB
 00086AC7    mov         ecx,ebx
 00086AC9    mov         dl,1
 00086ACB    mov         eax,[000858CC];TSparseList
 00086AD0    call        TSparseList.Create
 00086AD5    mov         dword ptr [esi+2B4],eax
 00086ADB    pop         esi
 00086ADC    pop         ebx
 00086ADD    ret
*}
end;

//00086AE0
procedure TStringGrid.SetUpdateState(Updating:Boolean);
begin
{*
 00086AE0    push        ebx
 00086AE1    mov         ebx,eax
 00086AE3    mov         byte ptr [ebx+2C0],dl
 00086AE9    test        dl,dl
>00086AEB    jne         00086B04
 00086AED    cmp         byte ptr [ebx+2C1],0
>00086AF4    je          00086B04
 00086AF6    mov         eax,ebx
 00086AF8    call        TCustomGrid.InvalidateGrid
 00086AFD    mov         byte ptr [ebx+2C1],0
 00086B04    pop         ebx
 00086B05    ret
*}
end;

//00086B08
procedure TStringGrid.Update(ACol:Integer; ARow:Integer);
begin
{*
 00086B08    push        ebx
 00086B09    push        esi
 00086B0A    push        edi
 00086B0B    mov         edi,ecx
 00086B0D    mov         esi,edx
 00086B0F    mov         ebx,eax
 00086B11    cmp         byte ptr [ebx+2C0],0
>00086B18    jne         00086B27
 00086B1A    mov         ecx,edi
 00086B1C    mov         edx,esi
 00086B1E    mov         eax,ebx
 00086B20    call        TCustomGrid.InvalidateCell
>00086B25    jmp         00086B2E
 00086B27    mov         byte ptr [ebx+2C1],1
 00086B2E    cmp         esi,dword ptr [ebx+208]
>00086B34    jne         00086B4E
 00086B36    cmp         edi,dword ptr [ebx+20C]
>00086B3C    jne         00086B4E
 00086B3E    cmp         dword ptr [ebx+2C4],0
>00086B45    jne         00086B4E
 00086B47    mov         eax,ebx
 00086B49    call        TCustomGrid.InvalidateEditor
 00086B4E    pop         edi
 00086B4F    pop         esi
 00086B50    pop         ebx
 00086B51    ret
*}
end;

//00086B54
function TStringGrid.EnsureColRow(Index:Integer; IsCol:Boolean):TStringGridStrings;
begin
{*
 00086B54    push        ebx
 00086B55    push        esi
 00086B56    push        edi
 00086B57    push        ebp
 00086B58    push        ecx
 00086B59    mov         byte ptr [esp],cl
 00086B5C    mov         ebp,edx
 00086B5E    mov         esi,eax
 00086B60    cmp         byte ptr [esp],0
>00086B64    je          00086B6E
 00086B66    lea         edi,[esi+2BC]
>00086B6C    jmp         00086B74
 00086B6E    lea         edi,[esi+2B8]
 00086B74    mov         eax,dword ptr [edi]
 00086B76    mov         edx,ebp
 00086B78    call        TSparseList.Get
 00086B7D    mov         ebx,eax
 00086B7F    test        ebx,ebx
>00086B81    jne         00086BAF
 00086B83    cmp         byte ptr [esp],0
>00086B87    je          00086B90
 00086B89    mov         eax,ebp
 00086B8B    neg         eax
 00086B8D    dec         eax
>00086B8E    jmp         00086B93
 00086B90    lea         eax,[ebp+1]
 00086B93    push        eax
 00086B94    mov         ecx,esi
 00086B96    mov         dl,1
 00086B98    mov         eax,[0007EFA4];TStringGridStrings
 00086B9D    call        TStringGridStrings.Create
 00086BA2    mov         ebx,eax
 00086BA4    mov         eax,dword ptr [edi]
 00086BA6    mov         ecx,ebx
 00086BA8    mov         edx,ebp
 00086BAA    call        TSparseList.Put
 00086BAF    mov         eax,ebx
 00086BB1    pop         edx
 00086BB2    pop         ebp
 00086BB3    pop         edi
 00086BB4    pop         esi
 00086BB5    pop         ebx
 00086BB6    ret
*}
end;

//00086BB8
function TStringGrid.EnsureDataRow(ARow:Integer):Pointer;
begin
{*
 00086BB8    push        ebx
 00086BB9    push        esi
 00086BBA    push        edi
 00086BBB    mov         edi,edx
 00086BBD    mov         ebx,eax
 00086BBF    mov         edx,edi
 00086BC1    mov         eax,dword ptr [ebx+2B4]
 00086BC7    call        TSparseList.Get
 00086BCC    mov         esi,eax
 00086BCE    test        esi,esi
>00086BD0    jne         00086C03
 00086BD2    cmp         dword ptr [ebx+1FC],200
>00086BDC    jle         00086BE2
 00086BDE    mov         al,1
>00086BE0    jmp         00086BE4
 00086BE2    xor         eax,eax
 00086BE4    mov         ecx,eax
 00086BE6    mov         dl,1
 00086BE8    mov         eax,[00085928];TStringSparseList
 00086BED    call        TStringSparseList.Create
 00086BF2    mov         esi,eax
 00086BF4    mov         ecx,esi
 00086BF6    mov         edx,edi
 00086BF8    mov         eax,dword ptr [ebx+2B4]
 00086BFE    call        TSparseList.Put
 00086C03    mov         eax,esi
 00086C05    pop         edi
 00086C06    pop         esi
 00086C07    pop         ebx
 00086C08    ret
*}
end;

//00086C0C
function TStringGrid.GetCells(ACol:Integer; ARow:Integer):AnsiString;
begin
{*
 00086C0C    push        ebp
 00086C0D    mov         ebp,esp
 00086C0F    push        ecx
 00086C10    push        ebx
 00086C11    push        esi
 00086C12    push        edi
 00086C13    mov         edi,ecx
 00086C15    mov         dword ptr [ebp-4],edx
 00086C18    mov         ebx,eax
 00086C1A    mov         esi,dword ptr [ebp+8]
 00086C1D    mov         edx,edi
 00086C1F    mov         eax,dword ptr [ebx+2B4]
 00086C25    call        TSparseList.Get
 00086C2A    mov         ebx,eax
 00086C2C    test        ebx,ebx
>00086C2E    jne         00086C39
 00086C30    mov         eax,esi
 00086C32    call        @LStrClr
>00086C37    jmp         00086C45
 00086C39    mov         ecx,esi
 00086C3B    mov         edx,dword ptr [ebp-4]
 00086C3E    mov         eax,ebx
 00086C40    mov         ebx,dword ptr [eax]
 00086C42    call        dword ptr [ebx+0C]
 00086C45    pop         edi
 00086C46    pop         esi
 00086C47    pop         ebx
 00086C48    pop         ecx
 00086C49    pop         ebp
 00086C4A    ret         4
*}
end;

//00086C50
function TStringGrid.GetObjects(ACol:Integer; ARow:Integer):TObject;
begin
{*
 00086C50    push        ebx
 00086C51    push        esi
 00086C52    push        edi
 00086C53    mov         esi,ecx
 00086C55    mov         edi,edx
 00086C57    mov         ebx,eax
 00086C59    mov         edx,esi
 00086C5B    mov         eax,dword ptr [ebx+2B4]
 00086C61    call        TSparseList.Get
 00086C66    test        eax,eax
>00086C68    jne         00086C6E
 00086C6A    xor         eax,eax
>00086C6C    jmp         00086C75
 00086C6E    mov         edx,edi
 00086C70    mov         ecx,dword ptr [eax]
 00086C72    call        dword ptr [ecx+18]
 00086C75    pop         edi
 00086C76    pop         esi
 00086C77    pop         ebx
 00086C78    ret
*}
end;

//00086C7C
function TStringGrid.GetRows(Index:Integer):TStrings;
begin
{*
 00086C7C    xor         ecx,ecx
 00086C7E    call        TStringGrid.EnsureColRow
 00086C83    ret
*}
end;

//00086C84
procedure TStringGrid.SetCells(ACol:Integer; ARow:Integer; const Value:AnsiString);
begin
{*
 00086C84    push        ebp
 00086C85    mov         ebp,esp
 00086C87    push        ecx
 00086C88    push        ebx
 00086C89    push        esi
 00086C8A    push        edi
 00086C8B    mov         dword ptr [ebp-4],ecx
 00086C8E    mov         esi,edx
 00086C90    mov         ebx,eax
 00086C92    mov         edx,dword ptr [ebp-4]
 00086C95    mov         eax,ebx
 00086C97    call        TStringGrid.EnsureDataRow
 00086C9C    mov         ecx,dword ptr [ebp+8]
 00086C9F    mov         edx,esi
 00086CA1    mov         edi,dword ptr [eax]
 00086CA3    call        dword ptr [edi+20]
 00086CA6    mov         cl,1
 00086CA8    mov         edx,esi
 00086CAA    mov         eax,ebx
 00086CAC    call        TStringGrid.EnsureColRow
 00086CB1    xor         ecx,ecx
 00086CB3    mov         edx,dword ptr [ebp-4]
 00086CB6    mov         eax,ebx
 00086CB8    call        TStringGrid.EnsureColRow
 00086CBD    mov         ecx,dword ptr [ebp-4]
 00086CC0    mov         edx,esi
 00086CC2    mov         eax,ebx
 00086CC4    call        TStringGrid.Update
 00086CC9    pop         edi
 00086CCA    pop         esi
 00086CCB    pop         ebx
 00086CCC    pop         ecx
 00086CCD    pop         ebp
 00086CCE    ret         4
*}
end;

//00086CD4
procedure TStringGrid.SetObjects(ACol:Integer; ARow:Integer; Value:TObject);
begin
{*
 00086CD4    push        ebp
 00086CD5    mov         ebp,esp
 00086CD7    push        ecx
 00086CD8    push        ebx
 00086CD9    push        esi
 00086CDA    push        edi
 00086CDB    mov         dword ptr [ebp-4],ecx
 00086CDE    mov         esi,edx
 00086CE0    mov         ebx,eax
 00086CE2    mov         edx,dword ptr [ebp-4]
 00086CE5    mov         eax,ebx
 00086CE7    call        TStringGrid.EnsureDataRow
 00086CEC    mov         ecx,dword ptr [ebp+8]
 00086CEF    mov         edx,esi
 00086CF1    mov         edi,dword ptr [eax]
 00086CF3    call        dword ptr [edi+24]
 00086CF6    mov         cl,1
 00086CF8    mov         edx,esi
 00086CFA    mov         eax,ebx
 00086CFC    call        TStringGrid.EnsureColRow
 00086D01    xor         ecx,ecx
 00086D03    mov         edx,dword ptr [ebp-4]
 00086D06    mov         eax,ebx
 00086D08    call        TStringGrid.EnsureColRow
 00086D0D    mov         ecx,dword ptr [ebp-4]
 00086D10    mov         edx,esi
 00086D12    mov         eax,ebx
 00086D14    call        TStringGrid.Update
 00086D19    pop         edi
 00086D1A    pop         esi
 00086D1B    pop         ebx
 00086D1C    pop         ecx
 00086D1D    pop         ebp
 00086D1E    ret         4
*}
end;

end.