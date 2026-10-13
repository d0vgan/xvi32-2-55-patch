//***************************************
//IDR home page: http://kpnc.org/idr32/en
//Decompiled by IDR v.01.04.2017
//***************************************
unit Controls;

interface

uses
  SysUtils, Classes, Controls, Graphics, Menus, Dialogs, CMHstBtn;

type
  TAlign = (alNone, alTop, alBottom, alLeft, alRight, alClient);
  TDragObject = class(TObject)
  public
    FDragTarget:Pointer;//f4
    FDragHandle:HWND;//f8
    FDragPos:TPoint;//fC
    FDragTargetPos:TPoint;//f14
    FMouseDeltaX:Double;//f1C
    FMouseDeltaY:Double;//f24
    FCancelling:Boolean;//f2C
    procedure v0; virtual;//v0//00040368
    function GetDragCursor(Accepted:Boolean; X:Integer; Y:Integer):TCursor; virtual;//v4//0004048C
    //function v8:?; virtual;//v8//00040488
    procedure Assign(Source:TDragObject); virtual;//vC//00040310
    function GetName:AnsiString; virtual;//v10//00040370
    procedure v14; virtual;//v14//000404A4
    function Instance:THandle; virtual;//v18//000404A8
    procedure v1C; virtual;//v1C//000404B0
    function Capture:HWND;//00040350
    procedure ReleaseCapture(Handle:HWND);//00040398
    procedure MouseMsg(var Msg:TMessage);//000403AC
  end;
  TBaseDragControlObject = class(TDragObject)
  public
    FControl:TControl;//f30
    procedure Finished(Target:TObject; X:Integer; Y:Integer; Accepted:Boolean); virtual;//v0//00040528
    procedure Assign(Source:TDragObject); virtual;//vC//000404D8
    procedure EndDrag(Target:TObject; X:Integer; Y:Integer); virtual;//v20//00040504
    constructor Create(AControl:TControl); virtual;//v24//000404B4
  end;
  TDragControlObject = class(TBaseDragControlObject)
  public
    function GetDragCursor(Accepted:Boolean; X:Integer; Y:Integer):TCursor; virtual;//v4//0004055C
    function GetDragImages:TDragImageList; virtual;//v8//00040574
    procedure HideDragImage; virtual;//v14//00040580
    procedure ShowDragImage; virtual;//v1C//000405A0
  end;
  TDragDockObject = class(TBaseDragControlObject)
  public
    FBrush:TBrush;//f34
    FDockRect:TRect;//f38
    FDropAlign:TAlign;//f48
    FDropOnControl:TControl;//f4C
    FEraseDockRect:TRect;//f50
    FFloating:Boolean;//f60
    destructor Destroy; virtual;//00040624
    function GetDragCursor(Accepted:Boolean; X:Integer; Y:Integer):TCursor; virtual;//v4//000407A4
    procedure Assign(Source:TDragObject); virtual;//vC//00040654
    procedure EndDrag(Target:TObject; X:Integer; Y:Integer); virtual;//v20//000406B8
    constructor Create(AControl:TControl); virtual;//v24//000405C0
    procedure AdjustDockRect(ARect:TRect); virtual;//v28//000406FC
    procedure DrawDragDockImage; virtual;//v2C//0004077C
    procedure EraseDragDockImage; virtual;//v30//00040790
    //function v34:?; virtual;//v34//000407B0
  end;
  TControlCanvas = class(TCanvas)
  public
    FControl:TControl;//f54
    FDeviceContext:HDC;//f58
    FWindowHandle:HWND;//f5C
    destructor Destroy; virtual;//00041874
    procedure CreateHandle; virtual;//v14//000418A0
    procedure FreeHandle;//00041948
    procedure SetControl(AControl:TControl);//0004197C
    procedure UpdateTextFlags;//00041994
  end;
  TControlActionLink = class(TActionLink)
  public
    FClient:TControl;//f10
    procedure AssignClient(AClient:TObject); virtual;//v0//00041B0C
    function IsOnExecuteLinked:Boolean; virtual;//v8//00041D18
    procedure SetOnExecute(Value:TNotifyEvent); virtual;//v10//00041DC4
    function IsCaptionLinked:Boolean; virtual;//v1C//00041C0C
    function IsEnabledLinked:Boolean; virtual;//v24//00041C80
    function IsHintLinked:Boolean; virtual;//v2C//00041CB4
    function IsVisibleLinked:Boolean; virtual;//v38//00041CE8
    procedure SetCaption(const Value:AnsiString); virtual;//v3C//00041D40
    procedure SetEnabled(Value:Boolean); virtual;//v44//00041D60
    procedure SetHint(const Value:AnsiString); virtual;//v4C//00041D80
    procedure SetVisible(Value:Boolean); virtual;//v58//00041DA4
    function DoShowHint(var HintStr:AnsiString):Boolean; virtual;//v5C//00041B28
  end;
  TMouseButton = (mbLeft, mbRight, mbMiddle);
  TDragMode = (dmManual, dmAutomatic);
  TDragKind = (dkDrag, dkDock);
  TAnchorKind = (akLeft, akTop, akRight, akBottom);
  TAnchors = set of TAnchorKind;
  TSizeConstraints = class(TPersistent)
  public
    FControl:TControl;//f4
    MaxHeight:TConstraintSize;//f8
    MaxWidth:TConstraintSize;//fC
    MinHeight:TConstraintSize;//f10
    MinWidth:TConstraintSize;//f14
    FOnChange:TNotifyEvent;//f18
    procedure AssignTo(Dest:TPersistent); virtual;//v0//00041A04
    constructor Create(Control:TControl); virtual;//vC//000419C8
    procedure Change; dynamic;//00041AF8
    procedure SetConstraints(Index:Integer; Value:TConstraintSize);//00041A50
  end;
  TMouseEvent = procedure(Sender:TObject; Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer) of object;;
  TMouseMoveEvent = procedure(Sender:TObject; Shift:TShiftState; X:Integer; Y:Integer) of object;;
  TKeyEvent = procedure(Sender:TObject; var Key:Word; Shift:TShiftState) of object;;
  TKeyPressEvent = procedure(Sender:TObject; var Key:Char) of object;;
  TDragOverEvent = procedure(Sender:TObject; Source:TObject; X:Integer; Y:Integer; State:TDragState; var Accept:Boolean) of object;;
  TDragDropEvent = procedure(Sender:TObject; Source:TObject; X:Integer; Y:Integer) of object;;
  TStartDragEvent = procedure(Sender:TObject; var DragObject:TDragObject) of object;;
  TEndDragEvent = procedure(Sender:TObject; Target:TObject; X:Integer; Y:Integer) of object;;
  TDockDropEvent = procedure(Sender:TObject; Source:TDragDockObject; X:Integer; Y:Integer) of object;;
  TDockOverEvent = procedure(Sender:TObject; Source:TDragDockObject; X:Integer; Y:Integer; State:TDragState; var Accept:Boolean) of object;;
  TUnDockEvent = procedure(Sender:TObject; Client:TControl; NewTarget:TWinControl; var Allow:Boolean) of object;;
  TStartDockEvent = procedure(Sender:TObject; var DragObject:TDragDockObject) of object;;
  TGetSiteInfoEvent = procedure(Sender:TObject; DockClient:TControl; var InfluenceRect:TRect; MousePos:TPoint; var CanDock:Boolean) of object;;
  TCanResizeEvent = procedure(Sender:TObject; var NewWidth:Integer; var NewHeight:Integer; var Resize:Boolean) of object;;
  TConstrainedResizeEvent = procedure(Sender:TObject; var MinWidth:Integer; var MinHeight:Integer; var MaxWidth:Integer; var MaxHeight:Integer) of object;;
  TMouseWheelEvent = procedure(Sender:TObject; Shift:TShiftState; WheelDelta:Integer; MousePos:TPoint; var Handled:Boolean) of object;;
  TMouseWheelUpDownEvent = procedure(Sender:TObject; Shift:TShiftState; MousePos:TPoint; var Handled:Boolean) of object;;
  TControl = class(TComponent)
  public
    FParent:TWinControl;//f24
    FWindowProc:TWndMethod;//f28
    Left:Integer;//f30
    Top:Integer;//f34
    Width:Integer;//f38
    Height:Integer;//f3C
    FControlStyle:TControlStyle;//f40
    f41:byte;//f41
    FControlState:TControlState;//f44
    FDesktopFont:Boolean;//f46
    FVisible:Boolean;//f47
    FEnabled:Boolean;//f48
    FParentFont:Boolean;//f49
    FParentColor:Boolean;//f4A
    FAlign:TAlign;//f4B
    FAutoSize:Boolean;//f4C
    FDragMode:TDragMode;//f4D
    FIsControl:Boolean;//f4E
    FBiDiMode:TBiDiMode;//f4F
    FParentBiDiMode:Boolean;//f50
    FText:PChar;//f54
    FFont:TFont;//f58
    FActionLink:TControlActionLink;//f5C
    FAnchors:TAnchors;//f60
    FColor:TColor;//f64
    FConstraints:TSizeConstraints;//f68
    Cursor:TCursor;//f6C
    FDragCursor:TCursor;//f6E
    FPopupMenu:TPopupMenu;//f70
    Hint:String;//f74
    FFontHeight:Integer;//f78
    FLastHeight:Integer;//f7C
    FLastWidth:Integer;//f80
    FScalingFlags:TScalingFlags;//f84
    FShowHint:Boolean;//f85
    FParentShowHint:Boolean;//f86
    FDragKind:TDragKind;//f87
    FDockOrientation:TDockOrientation;//f88
    FHostDockSite:TWinControl;//f8C
    FUndockWidth:Integer;//f90
    FUndockHeight:Integer;//f94
    FLRDockWidth:Integer;//f98
    FTBDockHeight:Integer;//f9C
    FFloatingDockSiteClass:TWinControlClass;//fA0
    FOnCanResize:TCanResizeEvent;//fA4
    FOnConstrainedResize:TConstrainedResizeEvent;//fAC
    FOnMouseDown:TMouseEvent;//fB4
    FOnMouseMove:TMouseMoveEvent;//fBC
    FOnMouseUp:TMouseEvent;//fC4
    FOnDragDrop:TDragDropEvent;//fCC
    FOnDragOver:TDragOverEvent;//fD4
    FOnResize:TNotifyEvent;//fDC
    FOnStartDock:TStartDockEvent;//fE4
    FOnEndDock:TEndDragEvent;//fEC
    FOnStartDrag:TStartDragEvent;//fF4
    FOnEndDrag:TEndDragEvent;//fFC
    FOnClick:TNotifyEvent;//f104
    f106:word;//f106
    f108:TMessageForm;//f108
    FOnDblClick:TNotifyEvent;//f10C
    procedure DefaultHandler(var Message:void ); virtual;//00043D18
    destructor Destroy; virtual;//00041EC0
    procedure AssignTo(Dest:TPersistent); virtual;//v0//000448F4
    procedure DefineProperties(Filer:TFiler); virtual;//v4//00043DF0
    procedure Loaded; virtual;//vC//000448C4
    procedure Notification(AComponent:TComponent; Operation:TOperation); virtual;//v10//00042194
    procedure ReadState(Reader:TReader); virtual;//v14//00042100
    procedure SetName(const Value:TComponentName); virtual;//v18//000428DC
    constructor Create(AOwner:TComponent); virtual;//v2C//00041DF0
    procedure UpdateLastResize(NewWidth:Integer; NewHeight:Integer); virtual;//v30//00044B74
    function CanResize(var NewWidth:Integer; var NewHeight:Integer):Boolean; virtual;//v34//0004394C
    //function v38:?; virtual;//v38//00043948
    procedure ConstrainedResize(var MinWidth:Integer; var MinHeight:Integer; var MaxWidth:Integer; var MaxHeight:Integer); virtual;//v3C//00043A18
    function GetClientOrigin:TPoint; virtual;//v40//000425EC
    function GetClientRect:TRect; virtual;//v44//00042550
    function GetDeviceContext(var WindowHandle:HWND):HDC; virtual;//v48//00042E28
    //function v4C:?; virtual;//v4C//00041F70
    function GetEnabled:Boolean; virtual;//v50//00041F74
    function GetFloating:Boolean; virtual;//v54//00044A88
    //function v58:?; virtual;//v58//00044AB4
    procedure SetDragMode(Value:TDragMode); virtual;//v5C//000420CC
    procedure SetEnabled(Value:Boolean); virtual;//v60//00042A8C
    procedure SetParent(AParent:TWinControl); virtual;//v64//000429C4
    procedure SetParentBiDiMode(Value:Boolean); virtual;//v68//00042D00
    procedure SetBiDiMode(Value:TBiDiMode); virtual;//v6C//00042BC4
    procedure WndProc(var Message:TMessage); virtual;//v70//00043C00
    procedure InitiateAction; virtual;//v74//00044B38
    procedure Invalidate; virtual;//v78//00042FE8
    procedure Repaint; virtual;//v7C//00043014
    procedure SetBounds(ALeft:Integer; ATop:Integer; AWidth:Integer; AHeight:Integer); virtual;//v80//0004226C
    procedure Update; virtual;//v84//00042FF8
    procedure WMCancelMode(var Message:TWMCancelMode); message WM_CANCELMODE;//00044364
    procedure WMWindowPosChanged(var Message:TWMWindowPosChanged); message WM_WINDOWPOSCHANGED;//000443A4
    procedure WMNCLButtonDown(var Message:TWMNCLButtonDown); message WM_NCLBUTTONDOWN;//00043F98
    procedure WMMouseMove(var Message:TWMMouseMove); message WM_MOUSEMOVE;//000441EC
    procedure WMLButtonDown(var Message:TWMLButtonDown); message WM_LBUTTONDOWN;//00043F4C
    procedure WMLButtonUp(var Message:TWMLButtonUp); message WM_LBUTTONUP;//0004429C
    procedure WMLButtonDblClk(var Message:TWMLButtonDblClk); message WM_LBUTTONDBLCLK;//00043FB4
    procedure WMRButtonDown(var Message:TWMRButtonDown); message WM_RBUTTONDOWN;//0004411C
    procedure WMRButtonUp(var Message:TWMRButtonUp); message WM_RBUTTONUP;//00044314
    procedure WMRButtonDblClk(var Message:TWMRButtonDblClk); message WM_RBUTTONDBLCLK;//00044144
    procedure WMMButtonDown(var Message:TWMMButtonDown); message WM_MBUTTONDOWN;//0004416C
    procedure WMMButtonUp(var Message:TWMMButtonUp); message WM_MBUTTONUP;//00044344
    procedure WMMButtonDblClk(var Message:TWMMButtonDblClk); message WM_MBUTTONDBLCLK;//00044194
    procedure CMParentFontChanged(var Message:TMessage); message CM_PARENTFONTCHANGED;//00044520
    procedure CMParentColorChanged(var Message:TMessage); message CM_PARENTCOLORCHANGED;//00044490
    procedure CMHitTest(var Message:TWMNCHitTest); message CM_HITTEST;//00044570
    procedure CMVisibleChanged(var Message:TMessage); message CM_VISIBLECHANGED;//00044450
    procedure CMEnabledChanged; message CM_ENABLEDCHANGED;//00044478
    procedure CMColorChanged(var Message:TMessage); message CM_COLORCHANGED;//00044488
    procedure CMFontChanged(var Message:TMessage); message CM_FONTCHANGED;//00044480
    procedure CMMouseEnter(var Message:TMessage); message CM_MOUSEENTER;//00044578
    procedure CMMouseLeave(var Message:TMessage); message CM_MOUSELEAVE;//00044590
    procedure CMDesignHitTest(var Message:TWMMouse); message CM_DESIGNHITTEST;//000445A8
    procedure CMParentShowHintChanged(var Message:TMessage); message CM_PARENTSHOWHINTCHANGED;//000444F8
    procedure CMHintShow(var Message:TMessage); message CM_HINTSHOW;//00044B48
    procedure CMSysFontChanged(var Message:TMessage); message CM_SYSFONTCHANGED;//00044550
    procedure CMFloat(var Message:TCMFloat); message CM_FLOAT;//000446C4
    procedure CMBiDiModeChanged(var Message:TMessage); message CM_BIDIMODECHANGED;//000444E0
    procedure CMParentBiDiModeChanged(var Message:TMessage); message CM_PARENTBIDIMODECHANGED;//000444C0
    procedure UseRightToLeftAlignment; dynamic;//00043128
    procedure sub_0004310C; dynamic;//0004310C
    procedure DragDrop(Source:TObject; X:Integer; Y:Integer); dynamic;//000432C0
    procedure Dock(NewDockSite:TWinControl; ARect:TRect); dynamic;//000423A8
    procedure sub_00043BFC; dynamic;//00043BFC
    procedure SetZOrder(TopMost:Boolean); dynamic;//00042E04
    procedure Resize; dynamic;//000420E0
    procedure RequestAlign; dynamic;//000420D0
    procedure PaletteChanged(Foreground:Boolean); dynamic;//00041FAC
    procedure PositionDockRect(DragDockObject:TDragDockObject); dynamic;//00043338
    procedure MouseUp(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer); dynamic;//00044228
    procedure MouseMove(Shift:TShiftState; X:Integer; Y:Integer); dynamic;//000441BC
    procedure MouseDown(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer); dynamic;//00043ED0
    procedure sub_00044008; dynamic;//00044008
    procedure sub_00041F78; dynamic;//00041F78
    procedure GetDockEdge(MousePos:TPoint); dynamic;//000449D8
    procedure sub_0004481C; dynamic;//0004481C
    procedure EraseDragDockImage(DragDockObject:TDragDockObject); dynamic;//000435B4
    procedure DrawDragDockImage(DragDockObject:TDragDockObject); dynamic;//000435A4
    procedure DoStartDrag(var DragObject:TDragObject); dynamic;//000432EC
    procedure DoEndDrag(Target:TObject; X:Integer; Y:Integer); dynamic;//0004330C
    procedure DragOver(Source:TObject; X:Integer; Y:Integer; State:TDragState; var Accept:Boolean); dynamic;//00043284
    procedure sub_00043274; dynamic;//00043274
    procedure DoStartDock(var DragObject:TDragObject); dynamic;//00043454
    procedure DoDock(NewDockSite:TWinControl; var ARect:TRect); dynamic;//000424B4
    procedure DoEndDock(Target:TObject; X:Integer; Y:Integer); dynamic;//00043428
    procedure DockTrackNoTarget(Source:TDragDockObject; X:Integer; Y:Integer); dynamic;//00043408
    procedure DefaultDockImage(DragDockObject:TDragDockObject; Erase:Boolean); dynamic;//00043474
    procedure DblClick; dynamic;//00043EB0
    procedure Click; dynamic;//00043E40
    procedure ChangeScale(M:Integer; D:Integer); dynamic;//0004277C
    procedure BeginAutoDrag; dynamic;//0004315C
    procedure AdjustSize; dynamic;//00044ABC
    procedure ActionChange(Sender:TObject; CheckDefaults:Boolean); dynamic;//00044724
    procedure HasParent; dynamic;//00041F7C
    procedure GetParentComponent; dynamic;//00041F84
    procedure SetParentComponent(Value:TComponent); dynamic;//00041F88
    function GetAction:TBasicAction;//00042028
    procedure SetAction(Value:TBasicAction);//00042038
    function IsAnchorsStored(Value:TAnchors):Boolean;//000420B4
    procedure SetAlign(Value:TAlign);//000421D8
    procedure SetLeft(Value:Integer);//00042314
    procedure SetTop(Value:Integer);//00042338
    procedure SetWidth(Value:Integer);//00042360
    procedure SetHeight(Value:Integer);//00042384
    function GetBoundsRect:TRect;//0004250C
    procedure SetBoundsRect(const Rect:TRect);//0004252C
    function GetClientWidth:Integer;//00042568
    procedure SetClientWidth(Value:Integer);//00042580
    function GetClientHeight:Integer;//000425AC
    procedure SetClientHeight(Value:Integer);//000425C4
    function ClientToScreen(const Point:TPoint):TPoint;//0004267C
    function ScreenToClient(const Point:TPoint):TPoint;//000426A8
    procedure SendCancelMode(Sender:TControl);//000426D4
    procedure SendDockNotification(Msg:Cardinal; WParam:Integer; LParam:Integer);//00042704
    procedure Changed;//0004276C
    procedure SetAutoSize(Value:Boolean);//000428C4
    procedure SetClientSize(Value:TPoint);//0004297C
    procedure SetVisible(Value:Boolean);//00042A48
    function GetTextLen:Integer;//00042AA4
    function GetTextBuf(Buffer:PChar; BufSize:Integer):Integer;//00042AB4
    function GetUndockHeight:Integer;//00042AC0
    function GetUndockWidth:Integer;//00042AD4
    procedure SetPopupMenu(Value:TPopupMenu);//00042AE8
    procedure SetTextBuf(Buffer:PChar);//00042B0C
    function GetText:TCaption;//00042B30
    procedure SetText(const Value:TCaption);//00042B60
    procedure FontChanged(Sender:TObject);//00042BE0
    procedure SetFont(Value:TFont);//00042C1C
    function IsFontStored(Value:TFont):Boolean;//00042C2C
    function IsShowHintStored(Value:Boolean):Boolean;//00042C40
    procedure SetParentFont(Value:Boolean);//00042C54
    procedure SetShowHint(Value:Boolean);//00042C74
    procedure SetParentShowHint(Value:Boolean);//00042C98
    procedure SetColor(Value:TColor);//00042CBC
    procedure SetParentColor(Value:Boolean);//00042CE0
    procedure SetCursor(Value:TCursor);//00042D20
    function GetMouseCapture:Boolean;//00042D3C
    procedure SetMouseCapture(Value:Boolean);//00042D4C
    procedure BringToFront;//00042D74
    procedure SetZOrderPosition(Position:Integer);//00042D84
    procedure InvalidateControl(IsVisible:Boolean; IsOpaque:Boolean);//00042F5C
    procedure Refresh;//0004300C
    function UseRightToLeftReading:Boolean;//00043110
    function UseRightToLeftScrollBar:Boolean;//00043140
    procedure BeginDrag(Immediate:Boolean; Threshold:Integer);//00043174
    function Dragging:Boolean;//00043278
    procedure DoDragMsg(var DragMsg:TCMDrag);//000435C4
    function ManualDock(NewDockSite:TWinControl; DropControl:TControl; ControlSide:TAlign):Boolean;//000436B4
    function ManualFloat(ScreenPos:TRect):Boolean;//0004389C
    procedure DoConstraintsChange(Sender:TObject);//0004393C
    function DoCanAutoSize(var NewWidth:Integer; var NewHeight:Integer):Boolean;//0004397C
    function DoCanResize(var NewWidth:Integer; var NewHeight:Integer):Boolean;//000439E8
    procedure DoConstrainedResize(var NewWidth:Integer; var NewHeight:Integer);//00043A48
    function Perform(Msg:Cardinal; WParam:Longint; LParam:Longint):Longint;//00043B1C
    procedure CalcDockSizes;//00043B50
    procedure UpdateBoundsRect(const R:TRect);//00043BC0
    procedure ReadIsControl(Reader:TReader);//00043DA0
    procedure WriteIsControl(Writer:TWriter);//00043DB4
    procedure DoMouseDown(var Message:TWMMouse; Button:TMouseButton; Shift:TShiftState);//00043F08
    procedure CheckMenuPopup(const Pos:TSmallPoint);//0004400C
    function CheckNewSize(var NewWidth:Integer; var NewHeight:Integer):Boolean;//00044080
    procedure DoMouseUp(var Message:TWMMouse; Button:TMouseButton);//00044260
    function CreateFloatingDockSite(Bounds:TRect):TWinControl;//000445B0
    procedure DoActionChange(Sender:TObject);//000447F8
    function IsCaptionStored(Value:TCaption):Boolean;//00044824
    function IsEnabledStored(Value:Boolean):Boolean;//00044844
    function IsHintStored(Value:String):Boolean;//00044864
    function IsVisibleStored(Value:Boolean):Boolean;//00044884
    function IsOnClickStored(Value:TNotifyEvent):Boolean;//000448A4
    function DrawTextBiDiModeFlags(Flags:Longint):Longint;//00044ADC
    function DrawTextBiDiModeFlagsReadingOnly:Longint;//00044B1C
  end;
  TWinControlActionLink = class(TControlActionLink)
  public
    FClient:TWinControl;//f14
    procedure AssignClient(AClient:TObject); virtual;//v0//00044B80
    function IsHelpContextLinked:Boolean; virtual;//v28//00044BA4
    procedure SetHelpContext(Value:THelpContext); virtual;//v48//00044BD8
  end;
  TImeMode = (imDisable, imClose, imOpen, imDontCare, imSAlpha, imAlpha, imHira, imSKata, imKata, imChinese, imSHanguel, imHanguel);
  TBevelCut = (bvNone, bvLowered, bvRaised, bvSpace);
  TWinControl = class(TControl)
  public
    FAlignLevel:Word;//f114
    FBevelEdges:TBevelEdges;//f116
    FBevelInner:TBevelCut;//f117
    FBevelOuter:TBevelCut;//f118
    FBevelKind:TBevelKind;//f119
    FBevelWidth:TBevelWidth;//f11C
    FBorderWidth:TBorderWidth;//f120
    FBrush:TBrush;//f124
    FControls:TList;//f128
    FCtl3D:Boolean;//f12C
    FDefWndProc:Pointer;//f130
    FDockClients:TList;//f134
    FDockSite:Boolean;//f138
    FDockManager:IDockManager;//f13C
    FHandle:HWND;//f140
    HelpContext:THelpContext;//f144
    FImeMode:TImeMode;//f148
    FImeName:TImeName;//f14C
    FLastClientWidth:Integer;//f150
    FLastClientHeight:Integer;//f154
    FLastResize:TPoint;//f158
    FObjectInstance:Pointer;//f160
    FParentCtl3D:Boolean;//f164
    FParentWindow:HWND;//f168
    FShowing:Boolean;//f16C
    FTabList:TList;//f170
    FTabOrder:Integer;//f174
    FTabStop:Boolean;//f178
    FWheelAccumulator:Integer;//f17C
    FUseDockManager:Boolean;//f180
    FWinControls:TList;//f184
    FOnDockDrop:TDockDropEvent;//f188
    FOnDockOver:TDockOverEvent;//f190
    FOnEnter:TNotifyEvent;//f198
    FOnExit:TNotifyEvent;//f1A0
    f1A4:TCMHistoryBtn;//f1A4
    FOnGetSiteInfo:TGetSiteInfoEvent;//f1A8
    FOnKeyDown:TKeyEvent;//f1B0
    f1B4:TCMHistoryBtn;//f1B4
    FOnKeyPress:TKeyPressEvent;//f1B8
    FOnKeyUp:TKeyEvent;//f1C0
    FOnMouseWheel:TMouseWheelEvent;//f1C8
    FOnMouseWheelDown:TMouseWheelUpDownEvent;//f1D0
    FOnMouseWheelUp:TMouseWheelUpDownEvent;//f1D8
    FOnUnDock:TUnDockEvent;//f1E0
    FDoubleBuffered:Boolean;//f1E8
    FInImeComposition:Boolean;//f1E9
    procedure DefaultHandler(var Message:void ); virtual;//000464D0
    destructor Destroy; virtual;//00044CDC
    procedure AssignTo(Dest:TPersistent); virtual;//v0//0004953C
    procedure ReadState(Reader:TReader); virtual;//v14//00044E84
    constructor Create(AOwner:TComponent); virtual;//v2C//00044BF8
    procedure UpdateLastResize(NewWidth:Integer; NewHeight:Integer); virtual;//v30//00048B80
    procedure CanResize(var NewWidth:Integer; var NewHeight:Integer); virtual;//v34//00049040
    function CanAutoSize(var NewWidth:Integer; var NewHeight:Integer):Boolean; virtual;//v38//0004956C
    procedure ConstrainedResize(var MinWidth:Integer; var MinHeight:Integer; var MaxWidth:Integer; var MaxHeight:Integer); virtual;//v3C//00049498
    function GetClientOrigin:TPoint; virtual;//v40//0004899C
    function GetClientRect:TRect; virtual;//v44//000489BC
    function GetDeviceContext(var WindowHandle:HWND):HDC; virtual;//v48//000486D0
    procedure WndProc(var Message:TMessage); virtual;//v70//00046314
    procedure Invalidate; virtual;//v78//00048768
    procedure Repaint; virtual;//v7C//000487E4
    procedure SetBounds(ALeft:Integer; ATop:Integer; AWidth:Integer; AHeight:Integer); virtual;//v80//00048260
    procedure Update; virtual;//v84//000487C8
    procedure AdjustClientRect(var Rect:TRect); virtual;//v88//00044EFC
    procedure AlignControls(AControl:TControl; var Rect:TRect); virtual;//v8C//00045380
    procedure CreateHandle; virtual;//v90//00045F04
    procedure CreateParams(var Params:TCreateParams); virtual;//v94//00045B28
    procedure CreateWindowHandle(const Params:TCreateParams); virtual;//v98//00045DC4
    procedure CreateWnd; virtual;//v9C//00045C58
    procedure DestroyWindowHandle; virtual;//vA0//00045E60
    procedure DestroyWnd; virtual;//vA4//00045E08
    function GetControlExtents:TRect; virtual;//vA8//00048908
    procedure PaintWindow(DC:HDC); virtual;//vAC//00046700
    procedure ShowControl(AControl:TControl); virtual;//vB0//00048580
    procedure SetFocus; virtual;//vB4//00048874
    procedure WMDestroy(var Message:TWMDestroy); message WM_DESTROY;//00047B44
    procedure WMMove(var Message:TWMMove); message WM_MOVE;//00046DA8
    procedure WMSize(var Message:TWMSize); message WM_SIZE;//00046D74
    procedure WMSetFocus(var Message:TWMSetFocus); message WM_SETFOCUS;//00046EA8
    procedure WMKillFocus(var Message:TWMSetFocus); message WM_KILLFOCUS;//00046EBC
    procedure WMPaint(var Message:TWMPaint); message WM_PAINT;//00046958
    procedure WMEraseBkgnd(var Message:TWMEraseBkgnd); message WM_ERASEBKGND;//00046C1C
    procedure WMSysColorChange(var Message:TWMSysColorChange); message WM_SYSCOLORCHANGE;//00046AFC
    procedure WMWinIniChange(var Message:TMessage); message WM_SETTINGCHANGE;//00046B18
    procedure WMFontChange(var Message:TMessage); message WM_FONTCHANGE;//00046B2C
    procedure WMTimeChange(var Message:TMessage); message WM_TIMECHANGE;//00046B3C
    procedure WMSetCursor(var Message:TWMSetCursor); message WM_SETCURSOR;//00046DBC
    procedure WMDrawItem(var Message:TWMDrawItem); message WM_DRAWITEM;//00046BD4
    procedure WMMeasureItem(var Message:TWMMeasureItem); message WM_MEASUREITEM;//00046BF8
    procedure WMDeleteItem(var Message:TWMDeleteItem); message WM_DELETEITEM;//00046BB0
    procedure WMVScroll(var Message:TWMVScroll); message WM_VKEYTOITEM;//00047B24
    procedure WMVKeyToItem(var Message:TWMVKeyToItem); message WM_CHARTOITEM;//00047AD0
    procedure WMCompareItem(var Message:TWMCompareItem); message WM_COMPAREITEM;//00046B8C
    procedure WMWindowPosChanging(var Message:TWMWindowPosChanging); message WM_WINDOWPOSCHANGING;//00046D28
    procedure WMWindowPosChanged(var Message:TWMWindowPosChanged); message WM_WINDOWPOSCHANGED;//00046C68
    procedure WMNotify(var Message:TWMNotify); message WM_NOTIFY;//00046AD8
    procedure WMNCDestroy(var Message:TWMNCDestroy); message WM_NCDESTROY;//00047B78
    procedure WMNCCalcSize(var Message:TWMNCCalcSize); message WM_NCCALCSIZE;//00049738
    procedure WMNCHitTest(var Message:TWMNCHitTest); message WM_NCHITTEST;//00047B94
    procedure WMNCPaint(var Message:TMessage); message WM_NCPAINT;//000497C8
    procedure WMKeyDown(var Message:TWMKeyDown); message WM_KEYDOWN;//00047568
    procedure WMKeyUp(var Message:TWMKeyUp); message WM_KEYUP;//0004765C
    procedure WMChar(var Message:TWMChar); message WM_CHAR;//00047728
    procedure WMSysKeyDown(var Message:TWMKeyDown); message WM_SYSKEYDOWN;//00047588
    procedure WMSysKeyUp(var Message:TWMKeyUp); message WM_SYSKEYUP;//0004767C
    procedure WMIMEStartComp(var Message:TMessage); dynamic;//00046ED0
    procedure WMIMEEndComp(var Message:TMessage); dynamic;//00046EE4
    procedure WMCharToItem(var Message:TWMCharToItem); message WM_COMMAND;//00046AB8
    procedure WMSysCommand(var Message:TWMSysCommand); message WM_SYSCOMMAND;//00047A28
    procedure WMCommand(var Message:TWMCommand); message WM_HSCROLL;//00046B4C
    procedure WMHScroll(var Message:TWMHScroll); message WM_VSCROLL;//00046B6C
    procedure WMMouseWheel(var Message:TWMMouseWheel); message WM_MOUSEWHEEL;//000477A4
    procedure WMParentNotify(var Message:TWMParentNotify); message WM_PARENTNOTIFY;//00047AF0
    procedure WMQueryNewPalette(var Message:TMessage); message WM_QUERYNEWPALETTE;//00047C1C
    procedure WMPaletteChanged(var Message:TMessage); message WM_PALETTECHANGED;//00047C40
    procedure CMDialogKey(var Message:TWMKey); message CM_DIALOGKEY;//00047D10
    procedure CMDialogChar(var Message:TWMKey); message CM_DIALOGCHAR;//00047D18
    procedure CMFocusChanged(var Message:TCMFocusChanged); message CM_FOCUSCHANGED;//00047D20
    procedure CMVisibleChanged(var Message:TMessage); message CM_VISIBLECHANGED;//00047D28
    procedure CMEnabledChanged(var Message:TMessage); message CM_ENABLEDCHANGED;//00047D80
    procedure CMColorChanged(var Message:TMessage); message CM_COLORCHANGED;//00047DC8
    procedure CMFontChanged(var Message:TMessage); message CM_FONTCHANGED;//00047DF0
    procedure CMCursorChanged(var Message:TMessage); message CM_CURSORCHANGED;//00047E2C
    procedure CMCtl3DChanged(var Message:TMessage); message CM_CTL3DCHANGED;//00047E9C
    procedure CMParentCtl3DChanged(var Message:TMessage); message CM_PARENTCTL3DCHANGED;//00047EDC
    procedure CMShowingChanged(var Message:TMessage); message CM_SHOWINGCHANGED;//00047D58
    procedure CMEnter(var Message:TWMNoParams); message CM_ENTER;//00047CB0
    procedure CMExit(var Message:TWMNoParams); message CM_EXIT;//00047CBC
    procedure CMDesignHitTest(var Message:TWMMouse); message CM_DESIGNHITTEST;//00047CC8
    procedure CMShowHintChanged(var Message:TMessage); message CM_SHOWHINTCHANGED;//00047C60
    procedure CMSysColorChange(var Message:TMessage); message CM_SYSCOLORCHANGE;//00047F1C
    procedure CMWinIniChange(var Message:TWMWinIniChange); message CM_WININICHANGE;//00047F24
    procedure CMFontChange; message CM_FONTCHANGE;//00047F2C
    procedure CMTimeChange; message CM_TIMECHANGE;//00047F34
    procedure CMControlListChange(var Message:TMessage); message CM_CONTROLLISTCHANGE;//00047F94
    procedure CMChildKey(var Message:TMessage); message CM_CHILDKEY;//00047CFC
    procedure CMDrag(var Message:TCMDrag); message CM_DRAG;//00047F3C
    procedure CMRecreateWnd(var Message:TMessage); message CM_RECREATEWND;//00045FD4
    procedure CMInvalidate(var Message:TMessage); message CM_INVALIDATE;//00048778
    procedure CMSysFontChanged(var Message:TMessage); message CM_SYSFONTCHANGED;//00047FA8
    procedure CMChanged(var Message:TMessage); message CM_CHANGED;//00047CE8
    procedure CMDockClient(var Message:TCMDockClient); message CM_DOCKCLIENT;//0004733C
    procedure CMUnDockClient(var Message:TCMUnDockClient); message CM_UNDOCKCLIENT;//0004742C
    procedure CMFloat(var Message:TCMFloat); message CM_FLOAT;//00047454
    procedure CMBorderChanged(var Message:TMessage); message CM_BORDERCHANGED;//00047E6C
    procedure CMBiDiModeChanged(var Message:TMessage); message CM_BIDIMODECHANGED;//00047C78
    procedure CMMouseWheel(var Message:TCMMouseWheel); message CM_MOUSEWHEEL;//00047748
    procedure CNKeyDown(var Message:TWMKeyDown); dynamic;//00048058
    procedure CNKeyUp(var Message:TWMKeyUp); dynamic;//00048130
    procedure CNChar(var Message:TWMChar); dynamic;//00048184
    procedure CNSysKeyDown(var Message:TWMKeyDown); dynamic;//000481D0
    procedure CNSysChar(var Message:TWMChar); dynamic;//0004822C
    procedure MouseWheelHandler(var Message:TMessage); dynamic;//000477D8
    procedure GetTabOrderList(List:TList); dynamic;//00048DF0
    procedure Focused; dynamic;//000488AC
    procedure FlipChildren(AllLevels:Boolean); dynamic;//00045634
    procedure DockDrop(Source:TDragDockObject; X:Integer; Y:Integer); dynamic;//00047048
    procedure ReloadDockedControl(const AControlName:AnsiString; var AControl:TControl); dynamic;//00047164
    procedure KeyPress(var Key:Char); dynamic;//0004769C
    procedure KeyUp(var Key:Word; Shift:TShiftState); dynamic;//000475A8
    procedure KeyDown(var Key:Word; Shift:TShiftState); dynamic;//000474D8
    procedure GetSiteInfo(Client:TControl; var InfluenceRect:TRect; MousePos:TPoint; var CanDock:Boolean); dynamic;//000471C0
    procedure DoUnDock(NewTarget:TWinControl; Client:TControl); dynamic;//0004710C
    procedure DoRemoveDockClient(Client:TControl); dynamic;//00047004
    procedure DoMouseWheelUp(Shift:TShiftState; MousePos:TPoint); dynamic;//0004792C
    procedure DoMouseWheelDown(Shift:TShiftState; MousePos:TPoint); dynamic;//000478E0
    procedure DoMouseWheel(Shift:TShiftState; WheelDelta:Integer; MousePos:TPoint); dynamic;//0004781C
    procedure DoFlipChildren; dynamic;//00045560
    procedure DoExit; dynamic;//00047028
    procedure DoEnter; dynamic;//00047008
    procedure DoDockOver(Source:TDragDockObject; X:Integer; Y:Integer; State:TDragState; var Accept:Boolean); dynamic;//00047098
    procedure DockOver(Source:TDragDockObject; X:Integer; Y:Integer; State:TDragState; var Accept:Boolean); dynamic;//000470CC
    //procedure sub_00046FFC(?:?); dynamic;//00046FFC
    procedure CreateDockManager; dynamic;//0004721C
    procedure SetZOrder(TopMost:Boolean); dynamic;//00048670
    procedure PaletteChanged(Foreground:Boolean); dynamic;//00047BB8
    procedure sub_0004481C; dynamic;//00049514
    procedure ChangeScale(M:Integer; D:Integer); dynamic;//00048398
    procedure AdjustSize; dynamic;//000489D4
    procedure ActionChange(Sender:TObject; CheckDefaults:Boolean); dynamic;//000494D4
    procedure SetChildOrder(Child:TComponent; Order:Integer); dynamic;//00049000
    procedure GetChildren(Proc:TGetChildProc; Root:TComponent); dynamic;//00048FB8
    procedure FixupTabList;//00044DB0
    procedure AlignControl(AControl:TControl);//00045488
    procedure DisableAlign;//0004551C
    procedure EnableAlign;//00045524
    procedure Realign;//00045558
    function ContainsControl(Control:TControl):Boolean;//00045774
    procedure RemoveFocus(Removing:Boolean);//00045788
    procedure Insert(AControl:TControl);//000457A8
    procedure Remove(AControl:TControl);//000457F4
    procedure InsertControl(AControl:TControl);//0004583C
    procedure RemoveControl(AControl:TControl);//00045910
    function GetControl(Index:Integer):TControl;//0004598C
    function GetControlCount:Integer;//000459C8
    procedure Broadcast(var Message:void );//000459E8
    procedure NotifyControls(Msg:Word);//00045A28
    procedure CreateSubClass(var Params:TCreateParams; ControlClassName:PChar);//00045A50
    procedure AddBiDiModeExStyle(var ExStyle:DWORD);//00045AC0
    function PrecedingWindow(Control:TWinControl):HWND;//00045EBC
    procedure DestroyHandle;//00045F74
    procedure RecreateWnd;//00045FBC
    procedure UpdateShowing;//00046010
    procedure UpdateControlState;//0004610C
    procedure MainWndProc(var Message:TMessage);//0004614C
    function ControlAtPos(const Pos:TPoint; AllowDisabled:Boolean):TControl;//000461C4
    function IsControlMouseMsg(var Message:TWMMouse):Boolean;//00046288
    procedure PaintHandler(var Message:TWMPaint);//000465D0
    procedure PaintControls(DC:HDC; First:TControl);//00046728
    procedure SetIme;//00046EF8
    procedure ResetIme;//00046FA0
    function GetDockClientCount:Integer;//00047188
    function GetDockClients(Index:Integer):TControl;//0004719C
    procedure SetDockSite(Value:Boolean);//00047288
    function DoKeyDown(var Message:TWMKey):Boolean;//00047500
    function DoKeyUp(var Message:TWMKey):Boolean;//000475D0
    function DoKeyPress(var Message:TWMKey):Boolean;//000476BC
    function IsMenuKey(var Message:TWMKey):Boolean;//00047FC4
    procedure ScaleControls(M:Integer; D:Integer);//00048350
    procedure ScaleBy(M:Integer; D:Integer);//000483F8
    procedure ScrollBy(DeltaX:Integer; DeltaY:Integer);//000484A8
    procedure SetZOrderPosition(Position:Integer);//00048598
    procedure InvalidateFrame;//000487FC
    function CanFocus:Boolean;//00048834
    procedure HandleNeeded;//000488D0
    function GetHandle:HWND;//000488F4
    procedure SetBorderWidth(Value:TBorderWidth);//00048A14
    procedure SetCtl3D(Value:Boolean);//00048A34
    function IsCtl3DStored(Value:Boolean):Boolean;//00048A58
    procedure SetParentCtl3D(Value:Boolean);//00048A64
    function GetTabOrder:TTabOrder;//00048A88
    procedure UpdateTabOrder(Value:TTabOrder);//00048AAC
    procedure SetTabOrder(Value:TTabOrder);//00048B08
    procedure SetTabStop(Value:Boolean);//00048B20
    procedure SetUseDockManager(Value:Boolean);//00048CAC
    function HandleAllocated:Boolean;//00048D1C
    procedure UpdateBounds;//00048D28
    function FindNextControl(CurControl:TWinControl; GoForward:Boolean; CheckTabStop:Boolean; CheckParent:Boolean):TWinControl;//00048E48
    procedure SelectNext(CurControl:TWinControl; GoForward:Boolean; CheckTabStop:Boolean);//00048F48
    procedure SelectFirst;//00048F74
    procedure CalcConstraints(var MinWidth:Integer; var MinHeight:Integer; var MaxWidth:Integer; var MaxHeight:Integer);//000490CC
    function IsHelpContextStored(Value:THelpContext):Boolean;//0004951C
  end;
  TGraphicControl = class(TControl)
  public
    FCanvas:TCanvas;//f114
    destructor Destroy; virtual;//00049AAC
    constructor Create(AOwner:TComponent); virtual;//v2C//00049A50
    procedure v88; virtual;//v88//00049B94
    procedure WMPaint(var Message:TWMPaint); message WM_PAINT;//00049AEC
  end;
  TCustomControl = class(TWinControl)
  public
    .......................FCanvas:TCanvas;//f1EC
    destructor Destroy; virtual;//0004A3F4
    constructor Create(AOwner:TComponent); virtual;//v2C//0004A398
    procedure PaintWindow(DC:HDC); virtual;//vAC//0004A444
    procedure vB8; virtual;//vB8//0004A4F0
    procedure WMPaint(var Message:TWMPaint); message WM_PAINT;//0004A424
  end;
  THintWindow = class(TCustomControl)
  public
    FActivating:Boolean;//f1F0
    constructor Create(AOwner:TComponent); virtual;//v2C//00049B98
    procedure CreateParams(var Params:TCreateParams); virtual;//v94//00049C44
    procedure Paint; virtual;//vB8//00049D08
    procedure ActivateHint(Rect:TRect; const AHint:AnsiString); virtual;//vBC//00049EA0
    procedure ActivateHintData(Rect:TRect; const AHint:AnsiString; AData:Pointer); virtual;//vC0//00049FBC
    function CalcHintRect(MaxWidth:Integer; const AHint:AnsiString; AData:Pointer):TRect; virtual;//vC4//00049FE8
    function IsHintMsg(var Msg:TMsg):Boolean; virtual;//vC8//00049DA4
    procedure WMNCHitTest(var Message:TWMNCHitTest); message WM_NCHITTEST;//00049C80
    procedure WMNCPaint(var Message:TMessage); message WM_NCPAINT;//00049C88
    procedure CMTextChanged(var Message:TMessage); message CM_TEXTCHANGED;//00049E10
    procedure ReleaseHandle;//00049E08
  end;
  TDragImageList = class(TCustomImageList)
  public
    FDragCursor:TCursor;//f5C
    FDragging:Boolean;//f5E
    FDragHandle:HWND;//f60
    FDragHotspot:TPoint;//f64
    FDragIndex:Integer;//f6C
    procedure Initialize; virtual;//v34//0004A084
    function GetHotSpot:TPoint; virtual;//v38//0004A1C8
    procedure CombineDragCursor;//0004A09C
    function SetDragImage(Index:Integer; HotSpotX:Integer; HotSpotY:Integer):Boolean;//0004A168
    procedure SetDragCursor(Value:TCursor);//0004A1B0
    function BeginDrag(Window:HWND; X:Integer; Y:Integer):Boolean;//0004A1F4
    function DragLock(Window:HWND; XPos:Integer; YPos:Integer):Boolean;//0004A254
    procedure DragUnlock;//0004A2B8
    function DragMove(X:Integer; Y:Integer):Boolean;//0004A2DC
    procedure ShowDragImage;//0004A320
    procedure HideDragImage;//0004A338
    function EndDrag:Boolean;//0004A350
  end;
  TImageList = class(TDragImageList)
  end;
  TDockZone = class(TObject)
  public
    FChildControl:TControl;//f4
    FChildZones:TDockZone;//f8
    FNextSibling:TDockZone;//fC
    FOrientation:TDockOrientation;//f10
    FParentZone:TDockZone;//f14
    FPrevSibling:TDockZone;//f18
    FTree:TDockTree;//f1C
    FZoneLimit:Integer;//f20
    constructor Create(Tree:TDockTree);//0004A4F4
    function GetChildCount:Integer;//0004A518
    function GetLimitBegin:Integer;//0004A52C
    function GetLimitSize:Integer;//0004A574
    function GetTopLeft(Orient:Integer):Integer;//0004A5BC
    function GetHeightWidth(Orient:Integer):Integer;//0004A628
    procedure ResetChildren;//0004A6D0
    function GetControlName:AnsiString;//0004A760
    procedure SetControlName(const Value:AnsiString);//0004A7E0
    procedure Update;//0004A880
  end;
  TDockTree = class(TInterfacedObject)
  public
    FBorderWidth:Integer;//fC
    FBrush:TBrush;//f10
    FDockSite:TWinControl;//f14
    FGrabberSize:Integer;//f18
    FGrabbersOnTop:Boolean;//f1C
    FOldRect:TRect;//f20
    FOldWndProc:TWndMethod;//f30
    FReplacementZone:TDockZone;//f38
    FScaleBy:Double;//f3C
    FShiftScaleOrient:TDockOrientation;//f44
    FShiftBy:Integer;//f48
    FSizePos:TPoint;//f4C
    FSizingDC:HDC;//f54
    FSizingWnd:HWND;//f58
    FSizingZone:TDockZone;//f5C
    FTopZone:TDockZone;//f60
    FTopXYLimit:Integer;//f64
    FUpdateCount:Integer;//f68
    FVersion:Integer;//f6C
    destructor Destroy; virtual;//0004AB2C
    procedure AdjustDockRect(Control:TControl; var ARect:TRect); virtual;//v0//0004AB78
    function HitTest(const MousePos:TPoint; var HTFlag:Integer):TControl; virtual;//v4//0004ACF0
    procedure InsertControl(Control:TControl; InsertAt:TAlign; DropCtl:TControl); virtual;//v8//0004AD00
    procedure LoadFromStream(Stream:TStream); virtual;//vC//0004B478
    procedure PaintDockFrame(Canvas:TCanvas; Control:TControl; const ARect:TRect); virtual;//v10//0004B7B4
    //procedure v14(?:?; ?:?; ?:?; ?:?); virtual;//v14//0004B9C8
    procedure RemoveControl(Control:TControl); virtual;//v18//0004BBAC
    procedure SaveToStream(Stream:TStream); virtual;//v1C//0004C088
    procedure ResetBounds(Force:Boolean); virtual;//v20//0004BE4C
    procedure PaintSite(DC:HDC); virtual;//v24//0004B870
    constructor Create(DockSite:TWinControl);//0004A9D0
    procedure BeginUpdate;//0004AB8C
    procedure EndUpdate;//0004AB90
    function FindControlZone(Control:TControl):TDockZone;//0004ABFC
    procedure ForEachAt(Zone:TDockZone; Proc:TForEachZoneProc);//0004AC64
    procedure GetControlBounds(Control:TControl; var CtlBounds:TRect);//0004AC7C
    procedure InsertNewParent(NewZone:TDockZone; SiblingZone:TDockZone; ParentOrientation:TDockOrientation; InsertLast:Boolean);//0004AF10
    procedure InsertSibling(NewZone:TDockZone; SiblingZone:TDockZone; InsertLast:Boolean);//0004B098
    function InternalHitTest(const MousePos:TPoint; var HTFlag:Integer):TDockZone;//0004B3A4
    procedure PruneZone(Zone:TDockZone);//0004BB50
    procedure RemoveZone(Zone:TDockZone);//0004BBE8
    procedure ScaleZone(Zone:TDockZone);//0004BF28
    procedure SetNewBounds(Zone:TDockZone);//0004C238
    procedure SetReplacingControl(Control:TControl);//0004C264
    procedure ShiftZone(Zone:TDockZone);//0004C27C
    procedure SplitterMouseDown(OnZone:TDockZone; MousePos:TPoint);//0004C298
    procedure SplitterMouseUp;//0004C2F8
    procedure UpdateAll;//0004C370
    procedure UpdateZone(Zone:TDockZone);//0004C398
    procedure DrawSizeSplitter;//0004C3A8
    function GetNextLimit(AZone:TDockZone):Integer;//0004C518
    procedure ControlVisibilityChanged(Control:TControl; Visible:Boolean);//0004C5D8
    procedure WindowProc(var Message:TMessage);//0004C6D8
  end;
  TMouse = class(TObject)
  public
    FDragImmediate:Boolean;//f4
    FDragThreshold:Integer;//f8
    FMousePresent:Boolean;//fC
    FNativeWheelSupport:Boolean;//fD
    FScrollLines:Integer;//f10
    FScrollLinesMessage:UINT;//f14
    FWheelHwnd:HWND;//f18
    FWheelMessage:UINT;//f1C
    FWheelPresent:Boolean;//f20
    FWheelSupportMessage:UINT;//f24
    constructor Create;//0004CAB8
    destructor Destroy;//0004CB48
    function GetCapture:HWND;//0004CB78
    procedure GetMouseData;//0004CB80
    procedure GetNativeData;//0004CB9C
    procedure GetRegisteredData;//0004CBCC
    procedure SetCapture(const Value:HWND);//0004CBF4
    procedure SettingChanged(Setting:Integer);//0004CC1C
  end;
  TSiteList = class(TList)
  public
    procedure Clear; dynamic;//00040278
    function Find(ParentWnd:HWND; var Index:Integer):Boolean;//000401A4
    procedure AddSite(ASite:TWinControl);//0004021C
    function GetTopSite:TWinControl;//000402AC
  end;
    procedure ChangeBiDiModeAlignment(var Alignment:TAlignment);//0003FD7C
    function InitWndProc(HWindow:HWND; Message:Longint; WParam:Longint; LParam:Longint):Longint; stdcall;//0003FD90
    function FindControl(Handle:HWND):TWinControl;//0003FE48
    function SendAppMessage(Msg:Cardinal; WParam:Longint; LParam:Longint):Longint;//0003FE64
    function CursorToIdent(Cursor:Longint; var Ident:AnsiString):Boolean;//00040028
    function IdentToCursor(const Ident:AnsiString; var Cursor:Longint):Boolean;//00040038
    function GetShortHint(const Hint:AnsiString):AnsiString;//00040048
    function GetLongHint(const Hint:AnsiString):AnsiString;//0004008C
    function GetCaptureControl:TControl;//000400D0
    procedure SetCaptureControl(Control:TControl);//000400F8
    function GetTopParent:HWND;//000401F4
    procedure Clear;//00040278
    procedure Assign(Source:TDragObject);//00040310
    procedure sub_00040368;//00040368
    function GetName:AnsiString;//00040370
    //function sub_00040488:?;//00040488
    function GetDragCursor(Accepted:Boolean; X:Integer; Y:Integer):TCursor;//0004048C
    procedure sub_000404A4;//000404A4
    function Instance:THandle;//000404A8
    procedure sub_000404B0;//000404B0
    constructor Create(AControl:TControl);//000404B4
    procedure Assign(Source:TDragObject);//000404D8
    procedure EndDrag(Target:TObject; X:Integer; Y:Integer);//00040504
    procedure Finished(Target:TObject; X:Integer; Y:Integer; Accepted:Boolean);//00040528
    function GetDragCursor(Accepted:Boolean; X:Integer; Y:Integer):TCursor;//0004055C
    function GetDragImages:TDragImageList;//00040574
    procedure HideDragImage;//00040580
    procedure ShowDragImage;//000405A0
    constructor Create(AControl:TControl);//000405C0
    destructor Destroy;//00040624
    procedure Assign(Source:TDragObject);//00040654
    procedure EndDrag(Target:TObject; X:Integer; Y:Integer);//000406B8
    function AbsMin(Value1:Integer; Value2:Integer):Integer;//000406D8
    procedure AdjustDockRect(ARect:TRect);//000406FC
    procedure DrawDragDockImage;//0004077C
    procedure EraseDragDockImage;//00040790
    function GetDragCursor(Accepted:Boolean; X:Integer; Y:Integer):TCursor;//000407A4
    //function sub_000407B0:?;//000407B0
    function IsBeforeTargetWindow(Window:HWND; Data:Longint):BOOL; stdcall;//000407B8
    function ValidDockTarget(Target:TWinControl):Boolean;//00040824
    function IsSiteChildOfClient:Boolean;//0004096C
    function GetDockSiteAtPos(MousePos:TPoint; Client:TControl):TWinControl;//000409B0
    procedure RegisterDockSite(Site:TWinControl; DoRegister:Boolean);//00040B00
    function DragMessage(Handle:HWND; Msg:TDragMessage; Source:TDragObject; Target:Pointer; const Pos:TPoint):Longint;//00040B60
    function IsDelphiHandle(Handle:HWND):Boolean;//00040BB8
    function DragFindWindow(const Pos:TPoint):HWND;//00040BDC
    function DragFindTarget(const Pos:TPoint; var Handle:HWND; DragKind:TDragKind; Client:TControl):Pointer;//00040C08
    function DoDragOver(DragMsg:TDragMessage):Boolean;//00040C58
    function GetDropCtl:TControl;//00040C94
    procedure DragTo(const Pos:TPoint);//00040D28
    procedure DragInit(ADragObject:TDragObject; Immediate:Boolean; Threshold:Integer);//00040FFC
    procedure DragInitControl(Control:TControl; Immediate:Boolean; Threshold:Integer);//0004116C
    function CheckUndock:Boolean;//00041334
    procedure DragDone(Drop:Boolean);//000413A4
    procedure CancelDrag;//00041604
    function FindVCLWindow(const Pos:TPoint):TWinControl;//0004161C
    function FindDragTarget(const Pos:TPoint; AllowDisabled:Boolean):TControl;//00041650
    procedure ListAdd(var List:TList; Item:Pointer);//00041694
    procedure ListRemove(var List:TList; Item:Pointer);//000416BC
    procedure MoveWindowOrg(DC:HDC; DX:Integer; DY:Integer);//000416DC
    procedure FreeDeviceContext;//0004170C
    procedure FreeDeviceContexts;//000417C8
    destructor Destroy;//00041874
    procedure CreateHandle;//000418A0
    constructor Create(Control:TControl);//000419C8
    procedure AssignTo(Dest:TPersistent);//00041A04
    procedure Change;//00041AF8
    procedure AssignClient(AClient:TObject);//00041B0C
    function DoShowHint(var HintStr:AnsiString):Boolean;//00041B28
    function IsCaptionLinked:Boolean;//00041C0C
    function IsEnabledLinked:Boolean;//00041C80
    function IsHintLinked:Boolean;//00041CB4
    function IsVisibleLinked:Boolean;//00041CE8
    function IsOnExecuteLinked:Boolean;//00041D18
    procedure SetCaption(const Value:AnsiString);//00041D40
    procedure SetEnabled(Value:Boolean);//00041D60
    procedure SetHint(const Value:AnsiString);//00041D80
    procedure SetVisible(Value:Boolean);//00041DA4
    procedure SetOnExecute(Value:TNotifyEvent);//00041DC4
    constructor Create(AOwner:TComponent);//00041DF0
    destructor Destroy;//00041EC0
    //function sub_00041F70:?;//00041F70
    function GetEnabled:Boolean;//00041F74
    procedure sub_00041F78;//00041F78
    procedure HasParent;//00041F7C
    procedure GetParentComponent;//00041F84
    procedure SetParentComponent(Value:TComponent);//00041F88
    procedure PaletteChanged(Foreground:Boolean);//00041FAC
    procedure SetDragMode(Value:TDragMode);//000420CC
    procedure RequestAlign;//000420D0
    procedure Resize;//000420E0
    procedure ReadState(Reader:TReader);//00042100
    procedure Notification(AComponent:TComponent; Operation:TOperation);//00042194
    procedure SetBounds(ALeft:Integer; ATop:Integer; AWidth:Integer; AHeight:Integer);//0004226C
    procedure Dock(NewDockSite:TWinControl; ARect:TRect);//000423A8
    procedure DoDock(NewDockSite:TWinControl; var ARect:TRect);//000424B4
    function GetClientRect:TRect;//00042550
    function GetClientOrigin:TPoint;//000425EC
    procedure ChangeScale(M:Integer; D:Integer);//0004277C
    procedure SetName(const Value:TComponentName);//000428DC
    procedure SetParent(AParent:TWinControl);//000429C4
    procedure SetEnabled(Value:Boolean);//00042A8C
    procedure SetBiDiMode(Value:TBiDiMode);//00042BC4
    procedure IsStoredBiDiMode(Value:TBiDiMode);//00042C4C
    procedure IsStoredColor(Value:TColor);//00042CD8
    procedure SetParentBiDiMode(Value:Boolean);//00042D00
    procedure SetZOrder(TopMost:Boolean);//00042E04
    function GetDeviceContext(var WindowHandle:HWND):HDC;//00042E28
    function BackgroundClipped:Boolean;//00042ED0
    procedure Invalidate;//00042FE8
    procedure Update;//00042FF8
    procedure Repaint;//00043014
    procedure sub_0004310C;//0004310C
    procedure UseRightToLeftAlignment;//00043128
    procedure BeginAutoDrag;//0004315C
    procedure sub_00043274;//00043274
    procedure DragOver(Source:TObject; X:Integer; Y:Integer; State:TDragState; var Accept:Boolean);//00043284
    procedure DragDrop(Source:TObject; X:Integer; Y:Integer);//000432C0
    procedure DoStartDrag(var DragObject:TDragObject);//000432EC
    procedure DoEndDrag(Target:TObject; X:Integer; Y:Integer);//0004330C
    procedure PositionDockRect(DragDockObject:TDragDockObject);//00043338
    procedure DockTrackNoTarget(Source:TDragDockObject; X:Integer; Y:Integer);//00043408
    procedure DoEndDock(Target:TObject; X:Integer; Y:Integer);//00043428
    procedure DoStartDock(var DragObject:TDragObject);//00043454
    procedure DefaultDockImage(DragDockObject:TDragDockObject; Erase:Boolean);//00043474
    procedure DrawDragDockImage(DragDockObject:TDragDockObject);//000435A4
    procedure EraseDragDockImage(DragDockObject:TDragDockObject);//000435B4
    //function sub_00043948:?;//00043948
    function CanResize(var NewWidth:Integer; var NewHeight:Integer):Boolean;//0004394C
    procedure ConstrainedResize(var MinWidth:Integer; var MinHeight:Integer; var MaxWidth:Integer; var MaxHeight:Integer);//00043A18
    procedure sub_00043BFC;//00043BFC
    procedure WndProc(var Message:TMessage);//00043C00
    procedure DefaultHandler(var Message:void );//00043D18
    function DoWrite:Boolean;//00043DC0
    procedure DefineProperties(Filer:TFiler);//00043DF0
    procedure Click;//00043E40
    procedure DblClick;//00043EB0
    procedure MouseDown(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);//00043ED0
    procedure WMLButtonDown(var Message:TWMLButtonDown);//00043F4C
    procedure WMNCLButtonDown(var Message:TWMNCLButtonDown);//00043F98
    procedure WMLButtonDblClk(var Message:TWMLButtonDblClk);//00043FB4
    procedure sub_00044008;//00044008
    procedure WMRButtonDown(var Message:TWMRButtonDown);//0004411C
    procedure WMRButtonDblClk(var Message:TWMRButtonDblClk);//00044144
    procedure WMMButtonDown(var Message:TWMMButtonDown);//0004416C
    procedure WMMButtonDblClk(var Message:TWMMButtonDblClk);//00044194
    procedure MouseMove(Shift:TShiftState; X:Integer; Y:Integer);//000441BC
    procedure WMMouseMove(var Message:TWMMouseMove);//000441EC
    procedure MouseUp(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);//00044228
    procedure WMLButtonUp(var Message:TWMLButtonUp);//0004429C
    procedure WMRButtonUp(var Message:TWMRButtonUp);//00044314
    procedure WMMButtonUp(var Message:TWMMButtonUp);//00044344
    procedure WMCancelMode(var Message:TWMCancelMode);//00044364
    procedure WMWindowPosChanged(var Message:TWMWindowPosChanged);//000443A4
    procedure CMVisibleChanged(var Message:TMessage);//00044450
    procedure CMEnabledChanged;//00044478
    procedure CMFontChanged(var Message:TMessage);//00044480
    procedure CMColorChanged(var Message:TMessage);//00044488
    procedure CMParentColorChanged(var Message:TMessage);//00044490
    procedure CMParentBiDiModeChanged(var Message:TMessage);//000444C0
    procedure CMBiDiModeChanged(var Message:TMessage);//000444E0
    procedure CMParentShowHintChanged(var Message:TMessage);//000444F8
    procedure CMParentFontChanged(var Message:TMessage);//00044520
    procedure CMSysFontChanged(var Message:TMessage);//00044550
    procedure CMHitTest(var Message:TWMNCHitTest);//00044570
    procedure CMMouseEnter(var Message:TMessage);//00044578
    procedure CMMouseLeave(var Message:TMessage);//00044590
    procedure CMDesignHitTest(var Message:TWMMouse);//000445A8
    procedure UpdateFloatingDockSitePos;//00044638
    procedure CMFloat(var Message:TCMFloat);//000446C4
    procedure ActionChange(Sender:TObject; CheckDefaults:Boolean);//00044724
    procedure sub_0004481C;//0004481C
    procedure Loaded;//000448C4
    procedure AssignTo(Dest:TPersistent);//000448F4
    function MinVar(const Data:array[$0..-$1] of System.Double; const _Dv_:$0..-$1):Integer;//0004499C
    procedure GetDockEdge(MousePos:TPoint);//000449D8
    function GetFloating:Boolean;//00044A88
    //function sub_00044AB4:?;//00044AB4
    procedure AdjustSize;//00044ABC
    procedure InitiateAction;//00044B38
    procedure CMHintShow(var Message:TMessage);//00044B48
    procedure UpdateLastResize(NewWidth:Integer; NewHeight:Integer);//00044B74
    procedure AssignClient(AClient:TObject);//00044B80
    function IsHelpContextLinked:Boolean;//00044BA4
    procedure SetHelpContext(Value:THelpContext);//00044BD8
    constructor Create(AOwner:TComponent);//00044BF8
    destructor Destroy;//00044CDC
    procedure ReadState(Reader:TReader);//00044E84
    procedure AdjustClientRect(var Rect:TRect);//00044EFC
    //function sub_00044F00(?:TControl; ?:Pointer; ?:?):?;//00044F00
    //procedure sub_00044F60(?:Pointer; ?:?; ?:?);//00044F60
    //procedure sub_000451CC(?:?; ?:?);//000451CC
    //function sub_0004532C(?:?):?;//0004532C
    procedure AlignControls(AControl:TControl; var Rect:TRect);//00045380
    procedure DoFlipChildren;//00045560
    procedure FlipChildren(AllLevels:Boolean);//00045634
    procedure CreateParams(var Params:TCreateParams);//00045B28
    procedure CreateWnd;//00045C58
    procedure CreateWindowHandle(const Params:TCreateParams);//00045DC4
    procedure DestroyWnd;//00045E08
    procedure DestroyWindowHandle;//00045E60
    procedure CreateHandle;//00045F04
    procedure CMRecreateWnd(var Message:TMessage);//00045FD4
    procedure WndProc(var Message:TMessage);//00046314
    procedure DefaultHandler(var Message:void );//000464D0
    function DoControlMsg(ControlHandle:HWND; var Message:void ):Boolean;//0004659C
    procedure PaintWindow(DC:HDC);//00046700
    procedure WMPaint(var Message:TWMPaint);//00046958
    procedure WMCharToItem(var Message:TWMCharToItem);//00046AB8
    procedure WMNotify(var Message:TWMNotify);//00046AD8
    procedure WMSysColorChange(var Message:TWMSysColorChange);//00046AFC
    procedure WMWinIniChange(var Message:TMessage);//00046B18
    procedure WMFontChange(var Message:TMessage);//00046B2C
    procedure WMTimeChange(var Message:TMessage);//00046B3C
    procedure WMCommand(var Message:TWMCommand);//00046B4C
    procedure WMHScroll(var Message:TWMHScroll);//00046B6C
    procedure WMCompareItem(var Message:TWMCompareItem);//00046B8C
    procedure WMDeleteItem(var Message:TWMDeleteItem);//00046BB0
    procedure WMDrawItem(var Message:TWMDrawItem);//00046BD4
    procedure WMMeasureItem(var Message:TWMMeasureItem);//00046BF8
    procedure WMEraseBkgnd(var Message:TWMEraseBkgnd);//00046C1C
    procedure WMWindowPosChanged(var Message:TWMWindowPosChanged);//00046C68
    procedure WMWindowPosChanging(var Message:TWMWindowPosChanging);//00046D28
    procedure WMSize(var Message:TWMSize);//00046D74
    procedure WMMove(var Message:TWMMove);//00046DA8
    procedure WMSetCursor(var Message:TWMSetCursor);//00046DBC
    procedure WMSetFocus(var Message:TWMSetFocus);//00046EA8
    procedure WMKillFocus(var Message:TWMSetFocus);//00046EBC
    procedure WMIMEStartComp(var Message:TMessage);//00046ED0
    procedure WMIMEEndComp(var Message:TMessage);//00046EE4
    //procedure sub_00046FFC(?:?);//00046FFC
    procedure DoRemoveDockClient(Client:TControl);//00047004
    procedure DoEnter;//00047008
    procedure DoExit;//00047028
    procedure DockDrop(Source:TDragDockObject; X:Integer; Y:Integer);//00047048
    procedure DoDockOver(Source:TDragDockObject; X:Integer; Y:Integer; State:TDragState; var Accept:Boolean);//00047098
    procedure DockOver(Source:TDragDockObject; X:Integer; Y:Integer; State:TDragState; var Accept:Boolean);//000470CC
    procedure DoUnDock(NewTarget:TWinControl; Client:TControl);//0004710C
    procedure ReloadDockedControl(const AControlName:AnsiString; var AControl:TControl);//00047164
    procedure GetSiteInfo(Client:TControl; var InfluenceRect:TRect; MousePos:TPoint; var CanDock:Boolean);//000471C0
    procedure CreateDockManager;//0004721C
    procedure CMDockClient(var Message:TCMDockClient);//0004733C
    procedure CMUnDockClient(var Message:TCMUnDockClient);//0004742C
    procedure CMFloat(var Message:TCMFloat);//00047454
    procedure KeyDown(var Key:Word; Shift:TShiftState);//000474D8
    procedure WMKeyDown(var Message:TWMKeyDown);//00047568
    procedure WMSysKeyDown(var Message:TWMKeyDown);//00047588
    procedure KeyUp(var Key:Word; Shift:TShiftState);//000475A8
    procedure WMKeyUp(var Message:TWMKeyUp);//0004765C
    procedure WMSysKeyUp(var Message:TWMKeyUp);//0004767C
    procedure KeyPress(var Key:Char);//0004769C
    procedure WMChar(var Message:TWMChar);//00047728
    procedure CMMouseWheel(var Message:TCMMouseWheel);//00047748
    procedure WMMouseWheel(var Message:TWMMouseWheel);//000477A4
    procedure MouseWheelHandler(var Message:TMessage);//000477D8
    procedure DoMouseWheel(Shift:TShiftState; WheelDelta:Integer; MousePos:TPoint);//0004781C
    procedure DoMouseWheelDown(Shift:TShiftState; MousePos:TPoint);//000478E0
    procedure DoMouseWheelUp(Shift:TShiftState; MousePos:TPoint);//0004792C
    function TraverseControls(Container:TWinControl):Boolean;//00047978
    procedure WMSysCommand(var Message:TWMSysCommand);//00047A28
    procedure WMVKeyToItem(var Message:TWMVKeyToItem);//00047AD0
    procedure WMParentNotify(var Message:TWMParentNotify);//00047AF0
    procedure WMVScroll(var Message:TWMVScroll);//00047B24
    procedure WMDestroy(var Message:TWMDestroy);//00047B44
    procedure WMNCDestroy(var Message:TWMNCDestroy);//00047B78
    procedure WMNCHitTest(var Message:TWMNCHitTest);//00047B94
    procedure PaletteChanged(Foreground:Boolean);//00047BB8
    procedure WMQueryNewPalette(var Message:TMessage);//00047C1C
    procedure WMPaletteChanged(var Message:TMessage);//00047C40
    procedure CMShowHintChanged(var Message:TMessage);//00047C60
    procedure CMBiDiModeChanged(var Message:TMessage);//00047C78
    procedure CMEnter(var Message:TWMNoParams);//00047CB0
    procedure CMExit(var Message:TWMNoParams);//00047CBC
    procedure CMDesignHitTest(var Message:TWMMouse);//00047CC8
    procedure CMChanged(var Message:TMessage);//00047CE8
    procedure CMChildKey(var Message:TMessage);//00047CFC
    procedure CMDialogKey(var Message:TWMKey);//00047D10
    procedure CMDialogChar(var Message:TWMKey);//00047D18
    procedure CMFocusChanged(var Message:TCMFocusChanged);//00047D20
    procedure CMVisibleChanged(var Message:TMessage);//00047D28
    procedure CMShowingChanged(var Message:TMessage);//00047D58
    procedure CMEnabledChanged(var Message:TMessage);//00047D80
    procedure CMColorChanged(var Message:TMessage);//00047DC8
    procedure CMFontChanged(var Message:TMessage);//00047DF0
    procedure CMCursorChanged(var Message:TMessage);//00047E2C
    procedure CMBorderChanged(var Message:TMessage);//00047E6C
    procedure CMCtl3DChanged(var Message:TMessage);//00047E9C
    procedure CMParentCtl3DChanged(var Message:TMessage);//00047EDC
    procedure CMSysColorChange(var Message:TMessage);//00047F1C
    procedure CMWinIniChange(var Message:TWMWinIniChange);//00047F24
    procedure CMFontChange;//00047F2C
    procedure CMTimeChange;//00047F34
    procedure CMDrag(var Message:TCMDrag);//00047F3C
    procedure CMControlListChange(var Message:TMessage);//00047F94
    procedure CMSysFontChanged(var Message:TMessage);//00047FA8
    procedure CNKeyDown(var Message:TWMKeyDown);//00048058
    procedure CNKeyUp(var Message:TWMKeyUp);//00048130
    procedure CNChar(var Message:TWMChar);//00048184
    procedure CNSysKeyDown(var Message:TWMKeyDown);//000481D0
    procedure CNSysChar(var Message:TWMChar);//0004822C
    procedure SetBounds(ALeft:Integer; ATop:Integer; AWidth:Integer; AHeight:Integer);//00048260
    procedure ChangeScale(M:Integer; D:Integer);//00048398
    procedure ShowControl(AControl:TControl);//00048580
    procedure SetZOrder(TopMost:Boolean);//00048670
    function GetDeviceContext(var WindowHandle:HWND):HDC;//000486D0
    procedure Invalidate;//00048768
    procedure CMInvalidate(var Message:TMessage);//00048778
    procedure Update;//000487C8
    procedure Repaint;//000487E4
    procedure SetFocus;//00048874
    procedure Focused;//000488AC
    function GetControlExtents:TRect;//00048908
    function GetClientOrigin:TPoint;//0004899C
    function GetClientRect:TRect;//000489BC
    procedure AdjustSize;//000489D4
    procedure UpdateLastResize(NewWidth:Integer; NewHeight:Integer);//00048B80
    procedure GetTabOrderList(List:TList);//00048DF0
    procedure GetChildren(Proc:TGetChildProc; Root:TComponent);//00048FB8
    procedure SetChildOrder(Child:TComponent; Order:Integer);//00049000
    procedure CanResize(var NewWidth:Integer; var NewHeight:Integer);//00049040
    procedure DoCalcConstraints(Control:TControl; var MinWidth:Integer; var MinHeight:Integer; var MaxWidth:Integer; var MaxHeight:Integer);//00049048
    procedure ConstrainedResize(var MinWidth:Integer; var MinHeight:Integer; var MaxWidth:Integer; var MaxHeight:Integer);//00049498
    procedure ActionChange(Sender:TObject; CheckDefaults:Boolean);//000494D4
    procedure sub_0004481C;//00049514
    procedure AssignTo(Dest:TPersistent);//0004953C
    function CanAutoSize(var NewWidth:Integer; var NewHeight:Integer):Boolean;//0004956C
    procedure WMNCCalcSize(var Message:TWMNCCalcSize);//00049738
    procedure WMNCPaint(var Message:TMessage);//000497C8
    constructor Create(AOwner:TComponent);//00049A50
    destructor Destroy;//00049AAC
    procedure WMPaint(var Message:TWMPaint);//00049AEC
    procedure sub_00049B94;//00049B94
    constructor Create(AOwner:TComponent);//00049B98
    procedure CreateParams(var Params:TCreateParams);//00049C44
    procedure WMNCHitTest(var Message:TWMNCHitTest);//00049C80
    procedure WMNCPaint(var Message:TMessage);//00049C88
    procedure Paint;//00049D08
    function IsHintMsg(var Msg:TMsg):Boolean;//00049DA4
    procedure CMTextChanged(var Message:TMessage);//00049E10
    procedure ActivateHint(Rect:TRect; const AHint:AnsiString);//00049EA0
    procedure ActivateHintData(Rect:TRect; const AHint:AnsiString; AData:Pointer);//00049FBC
    function CalcHintRect(MaxWidth:Integer; const AHint:AnsiString; AData:Pointer):TRect;//00049FE8
    function ClientToWindow(Handle:HWND; X:Integer; Y:Integer):TPoint;//0004A044
    procedure Initialize;//0004A084
    function GetHotSpot:TPoint;//0004A1C8
    constructor Create(AOwner:TComponent);//0004A398
    destructor Destroy;//0004A3F4
    procedure WMPaint(var Message:TWMPaint);//0004A424
    procedure PaintWindow(DC:HDC);//0004A444
    procedure sub_0004A4F0;//0004A4F0
    function ParentNotLast:Boolean;//0004A858
    destructor Destroy;//0004AB2C
    procedure AdjustDockRect(Control:TControl; var ARect:TRect);//0004AB78
    procedure DoFindControlZone(StartZone:TDockZone);//0004ABA4
    procedure DoForEach(Zone:TDockZone);//0004AC28
    function HitTest(const MousePos:TPoint; var HTFlag:Integer):TControl;//0004ACF0
    procedure InsertControl(Control:TControl; InsertAt:TAlign; DropCtl:TControl);//0004AD00
    procedure DoFindZone(Zone:TDockZone);//0004B108
    //function sub_0004B310(?:?; ?:?):?;//0004B310
    procedure ReadControlName(var ControlName:AnsiString);//0004B430
    procedure LoadFromStream(Stream:TStream);//0004B478
    procedure DrawGrabber(OnLeft:Boolean);//0004B674
    procedure DrawCloseBtn(OnLeft:Boolean);//0004B760
    procedure PaintDockFrame(Canvas:TCanvas; Control:TControl; const ARect:TRect);//0004B7B4
    procedure PaintSite(DC:HDC);//0004B870
    //procedure sub_0004B9C8(?:?; ?:?; ?:?; ?:?);//0004B9C8
    procedure DoPrune(Zone:TDockZone);//0004BB1C
    procedure RemoveControl(Control:TControl);//0004BBAC
    procedure ResetBounds(Force:Boolean);//0004BE4C
    procedure WriteControlName(ControlName:AnsiString);//0004BF54
    procedure DoSaveZone(Zone:TDockZone; Level:Integer);//0004BFCC
    procedure SaveToStream(Stream:TStream);//0004C088
    procedure DoSetNewBounds(Zone:TDockZone);//0004C1D0
    function Min(I1:Integer; I2:Integer):Integer;//0004C494
    procedure DoGetNextLimit(Zone:TDockZone);//0004C49C
    //function sub_0004C55C(?:?; ?:?):?;//0004C55C
    procedure CalcSplitterPos;//0004C644
    procedure InitIMM32;//0004CC80
    function Win32NLSEnableIME(hWnd:HWND; Enable:Boolean):Boolean;//0004CEE8
    procedure SetImeMode(hWnd:HWND; Mode:TImeMode);//0004CF00
    function Imm32IsIME(hKl:HKL):Boolean;//0004CFDC
    procedure DoneControls;//0004CFF0
    procedure InitControls;//0004D064

implementation

//0003FD7C
procedure ChangeBiDiModeAlignment(var Alignment:TAlignment);
begin
{*
 0003FD7C    mov         dl,byte ptr [eax]
 0003FD7E    sub         dl,1
>0003FD81    jb          0003FD87
>0003FD83    je          0003FD8B
>0003FD85    jmp         0003FD8E
 0003FD87    mov         byte ptr [eax],1
 0003FD8A    ret
 0003FD8B    mov         byte ptr [eax],0
 0003FD8E    ret
*}
end;

//0003FD90
function InitWndProc(HWindow:HWND; Message:Longint; WParam:Longint; LParam:Longint):Longint; stdcall;
begin
{*
 0003FD90    push        ebp
 0003FD91    mov         ebp,esp
 0003FD93    push        ecx
 0003FD94    push        ebx
 0003FD95    lea         ebx,[ebp-4]
 0003FD98    mov         eax,[000B477C]
 0003FD9D    mov         edx,dword ptr [ebp+8]
 0003FDA0    mov         dword ptr [eax+140],edx
 0003FDA6    mov         eax,[000B477C]
 0003FDAB    mov         eax,dword ptr [eax+160]
 0003FDB1    push        eax
 0003FDB2    push        0FC
 0003FDB4    mov         eax,dword ptr [ebp+8]
 0003FDB7    push        eax
 0003FDB8    call        user32.SetWindowLongA
 0003FDBD    push        0F0
 0003FDBF    mov         eax,dword ptr [ebp+8]
 0003FDC2    push        eax
 0003FDC3    call        user32.GetWindowLongA
 0003FDC8    test        eax,40000000
>0003FDCD    je          0003FDED
 0003FDCF    push        0F4
 0003FDD1    mov         eax,dword ptr [ebp+8]
 0003FDD4    push        eax
 0003FDD5    call        user32.GetWindowLongA
 0003FDDA    test        eax,eax
>0003FDDC    jne         0003FDED
 0003FDDE    mov         eax,dword ptr [ebp+8]
 0003FDE1    push        eax
 0003FDE2    push        0F4
 0003FDE4    mov         eax,dword ptr [ebp+8]
 0003FDE7    push        eax
 0003FDE8    call        user32.SetWindowLongA
 0003FDED    mov         eax,[000B477C]
 0003FDF2    push        eax
 0003FDF3    movzx       eax,word ptr ds:[0B673A]
 0003FDFA    push        eax
 0003FDFB    mov         eax,dword ptr [ebp+8]
 0003FDFE    push        eax
 0003FDFF    call        user32.SetPropA
 0003FE04    mov         eax,[000B477C]
 0003FE09    push        eax
 0003FE0A    movzx       eax,word ptr ds:[0B6738]
 0003FE11    push        eax
 0003FE12    mov         eax,dword ptr [ebp+8]
 0003FE15    push        eax
 0003FE16    call        user32.SetPropA
 0003FE1B    push        dword ptr [ebp+14]
 0003FE1E    push        dword ptr [ebp+10]
 0003FE21    push        dword ptr [ebp+0C]
 0003FE24    push        dword ptr [ebp+8]
 0003FE27    mov         eax,dword ptr ds:[0B477C]
 0003FE2D    mov         dword ptr ds:[0B477C],0
 0003FE37    call        dword ptr [eax+160]
 0003FE3D    mov         dword ptr [ebp-4],eax
 0003FE40    mov         eax,dword ptr [ebx]
 0003FE42    pop         ebx
 0003FE43    pop         ecx
 0003FE44    pop         ebp
 0003FE45    ret         10
*}
end;

//0003FE48
function FindControl(Handle:HWND):TWinControl;
begin
{*
 0003FE48    push        ebx
 0003FE49    mov         ebx,eax
 0003FE4B    xor         eax,eax
 0003FE4D    test        ebx,ebx
>0003FE4F    je          0003FE5F
 0003FE51    movzx       eax,word ptr ds:[0B673A]
 0003FE58    push        eax
 0003FE59    push        ebx
 0003FE5A    call        user32.GetPropA
 0003FE5F    pop         ebx
 0003FE60    ret
*}
end;

//0003FE64
function SendAppMessage(Msg:Cardinal; WParam:Longint; LParam:Longint):Longint;
begin
{*
 0003FE64    push        ebx
 0003FE65    push        esi
 0003FE66    mov         ebx,dword ptr ds:[0B59E8];^Application:TApplication
 0003FE6C    mov         ebx,dword ptr [ebx]
 0003FE6E    mov         esi,dword ptr [ebx+24]
 0003FE71    test        esi,esi
>0003FE73    je          0003FE86
 0003FE75    push        ecx
 0003FE76    push        edx
 0003FE77    push        eax
 0003FE78    mov         eax,[000B59E8];^Application:TApplication
 0003FE7D    push        esi
 0003FE7E    call        user32.SendMessageA
 0003FE83    pop         esi
 0003FE84    pop         ebx
 0003FE85    ret
 0003FE86    xor         eax,eax
 0003FE88    pop         esi
 0003FE89    pop         ebx
 0003FE8A    ret
*}
end;

//00040028
function CursorToIdent(Cursor:Longint; var Ident:AnsiString):Boolean;
begin
{*
 00040028    push        15
 0004002A    mov         ecx,0B4788
 0004002F    call        IntToIdent
 00040034    ret
*}
end;

//00040038
function IdentToCursor(const Ident:AnsiString; var Cursor:Longint):Boolean;
begin
{*
 00040038    push        15
 0004003A    mov         ecx,0B4788
 0004003F    call        IdentToInt
 00040044    ret
*}
end;

//00040048
function GetShortHint(const Hint:AnsiString):AnsiString;
begin
{*
 00040048    push        ebx
 00040049    push        esi
 0004004A    push        edi
 0004004B    mov         edi,edx
 0004004D    mov         esi,eax
 0004004F    mov         edx,esi
 00040051    mov         eax,40088;'|'
 00040056    call        AnsiPos
 0004005B    mov         ebx,eax
 0004005D    test        ebx,ebx
>0004005F    jne         0004006C
 00040061    mov         eax,edi
 00040063    mov         edx,esi
 00040065    call        @LStrLAsg
>0004006A    jmp         0004007C
 0004006C    push        edi
 0004006D    mov         ecx,ebx
 0004006F    dec         ecx
 00040070    mov         edx,1
 00040075    mov         eax,esi
 00040077    call        @LStrCopy
 0004007C    pop         edi
 0004007D    pop         esi
 0004007E    pop         ebx
 0004007F    ret
*}
end;

//0004008C
function GetLongHint(const Hint:AnsiString):AnsiString;
begin
{*
 0004008C    push        ebx
 0004008D    push        esi
 0004008E    push        edi
 0004008F    mov         edi,edx
 00040091    mov         esi,eax
 00040093    mov         edx,esi
 00040095    mov         eax,400CC;'|'
 0004009A    call        AnsiPos
 0004009F    mov         ebx,eax
 000400A1    test        ebx,ebx
>000400A3    jne         000400B0
 000400A5    mov         eax,edi
 000400A7    mov         edx,esi
 000400A9    call        @LStrLAsg
>000400AE    jmp         000400C0
 000400B0    push        edi
 000400B1    lea         edx,[ebx+1]
 000400B4    mov         ecx,7FFFFFFF
 000400B9    mov         eax,esi
 000400BB    call        @LStrCopy
 000400C0    pop         edi
 000400C1    pop         esi
 000400C2    pop         ebx
 000400C3    ret
*}
end;

//000400D0
function GetCaptureControl:TControl;
begin
{*
 000400D0    call        user32.GetCapture
 000400D5    call        FindControl
 000400DA    test        eax,eax
>000400DC    je          000400F7
 000400DE    cmp         dword ptr ds:[0B4838],0
>000400E5    je          000400F7
 000400E7    mov         edx,dword ptr ds:[0B4838]
 000400ED    cmp         eax,dword ptr [edx+24]
>000400F0    jne         000400F7
 000400F2    mov         eax,[000B4838]
 000400F7    ret
*}
end;

//000400F8
procedure SetCaptureControl(Control:TControl);
begin
{*
 000400F8    push        ebx
 000400F9    mov         ebx,eax
 000400FB    call        user32.ReleaseCapture
 00040100    xor         eax,eax
 00040102    mov         [000B4838],eax
 00040107    test        ebx,ebx
>00040109    je          00040138
 0004010B    mov         eax,ebx
 0004010D    mov         edx,dword ptr ds:[3F0BC];TWinControl
 00040113    call        @IsClass
 00040118    test        al,al
>0004011A    jne         0004012B
 0004011C    cmp         dword ptr [ebx+24],0
>00040120    je          00040138
 00040122    mov         dword ptr ds:[0B4838],ebx
 00040128    mov         ebx,dword ptr [ebx+24]
 0004012B    mov         eax,ebx
 0004012D    call        TWinControl.GetHandle
 00040132    push        eax
 00040133    call        user32.SetCapture
 00040138    pop         ebx
 00040139    ret
*}
end;

//000401A4
function TSiteList.Find(ParentWnd:HWND; var Index:Integer):Boolean;
begin
{*
 000401A4    push        ebx
 000401A5    push        esi
 000401A6    push        edi
 000401A7    add         esp,0FFFFFFF8
 000401AA    mov         dword ptr [esp],ecx
 000401AD    mov         byte ptr [esp+4],0
 000401B2    xor         esi,esi
 000401B4    mov         edi,dword ptr [eax+8]
 000401B7    dec         edi
 000401B8    cmp         edi,esi
>000401BA    jl          000401E5
 000401BC    lea         ebx,[edi+esi]
 000401BF    shr         ebx,1
 000401C1    mov         ecx,dword ptr [eax+4]
 000401C4    mov         ecx,dword ptr [ecx+ebx*4]
 000401C7    mov         ecx,dword ptr [ecx+4]
 000401CA    sub         ecx,edx
 000401CC    test        ecx,ecx
>000401CE    jge         000401D5
 000401D0    lea         esi,[ebx+1]
>000401D3    jmp         000401E1
 000401D5    mov         edi,ebx
 000401D7    dec         edi
 000401D8    test        ecx,ecx
>000401DA    jne         000401E1
 000401DC    mov         byte ptr [esp+4],1
 000401E1    cmp         edi,esi
>000401E3    jge         000401BC
 000401E5    mov         eax,dword ptr [esp]
 000401E8    mov         dword ptr [eax],esi
 000401EA    mov         al,byte ptr [esp+4]
 000401EE    pop         ecx
 000401EF    pop         edx
 000401F0    pop         edi
 000401F1    pop         esi
 000401F2    pop         ebx
 000401F3    ret
*}
end;

//000401F4
function GetTopParent:HWND;
begin
{*
 000401F4    push        ebp
 000401F5    mov         ebp,esp
 000401F7    push        ebx
 000401F8    mov         eax,dword ptr [ebp+8]
 000401FB    mov         eax,dword ptr [eax-4]
 000401FE    call        TWinControl.GetHandle
 00040203    mov         ebx,eax
 00040205    test        eax,eax
>00040207    je          00040215
 00040209    mov         ebx,eax
 0004020B    push        eax
 0004020C    call        user32.GetParent
 00040211    test        eax,eax
>00040213    jne         00040209
 00040215    mov         eax,ebx
 00040217    pop         ebx
 00040218    pop         ebp
 00040219    ret
*}
end;

//0004021C
procedure TSiteList.AddSite(ASite:TWinControl);
begin
{*
 0004021C    push        ebp
 0004021D    mov         ebp,esp
 0004021F    add         esp,0FFFFFFF8
 00040222    push        ebx
 00040223    push        esi
 00040224    push        edi
 00040225    mov         dword ptr [ebp-4],edx
 00040228    mov         esi,eax
 0004022A    mov         eax,8
 0004022F    call        @GetMem
 00040234    mov         ebx,eax
 00040236    mov         eax,dword ptr [ebp-4]
 00040239    mov         dword ptr [ebx],eax
 0004023B    push        ebp
 0004023C    call        GetTopParent
 00040241    pop         ecx
 00040242    mov         edi,eax
 00040244    mov         dword ptr [ebx+4],edi
 00040247    lea         ecx,[ebp-8]
 0004024A    mov         edx,edi
 0004024C    mov         eax,esi
 0004024E    call        TSiteList.Find
 00040253    test        al,al
>00040255    je          00040265
 00040257    mov         ecx,ebx
 00040259    mov         edx,dword ptr [ebp-8]
 0004025C    mov         eax,esi
 0004025E    call        TList.Insert
>00040263    jmp         0004026E
 00040265    mov         edx,ebx
 00040267    mov         eax,esi
 00040269    call        TList.Add
 0004026E    pop         edi
 0004026F    pop         esi
 00040270    pop         ebx
 00040271    pop         ecx
 00040272    pop         ecx
 00040273    pop         ebp
 00040274    ret
*}
end;

//00040278
procedure TSiteList.Clear;
begin
{*
 00040278    push        ebx
 00040279    push        esi
 0004027A    push        edi
 0004027B    mov         edi,eax
 0004027D    mov         ebx,dword ptr [edi+8]
 00040280    dec         ebx
 00040281    test        ebx,ebx
>00040283    jl          0004029F
 00040285    inc         ebx
 00040286    xor         esi,esi
 00040288    mov         edx,esi
 0004028A    mov         eax,edi
 0004028C    call        TList.Get
 00040291    mov         edx,8
 00040296    call        @FreeMem
 0004029B    inc         esi
 0004029C    dec         ebx
>0004029D    jne         00040288
 0004029F    mov         eax,edi
 000402A1    call        TList.Clear
 000402A6    pop         edi
 000402A7    pop         esi
 000402A8    pop         ebx
 000402A9    ret
*}
end;

//000402AC
function TSiteList.GetTopSite:TWinControl;
begin
{*
 000402AC    push        ebx
 000402AD    push        esi
 000402AE    push        edi
 000402AF    push        ecx
 000402B0    mov         ebx,eax
 000402B2    xor         edi,edi
 000402B4    mov         eax,dword ptr [ebx+8]
 000402B7    test        eax,eax
>000402B9    je          00040308
 000402BB    dec         eax
>000402BC    jne         000402CB
 000402BE    xor         edx,edx
 000402C0    mov         eax,ebx
 000402C2    call        TList.Get
 000402C7    mov         edi,dword ptr [eax]
>000402C9    jmp         00040308
 000402CB    call        user32.GetDesktopWindow
 000402D0    push        eax
 000402D1    call        user32.GetTopWindow
 000402D6    mov         esi,eax
>000402D8    jmp         00040300
 000402DA    mov         ecx,esp
 000402DC    mov         edx,esi
 000402DE    mov         eax,ebx
 000402E0    call        TSiteList.Find
 000402E5    test        al,al
>000402E7    je          000402F6
 000402E9    mov         eax,dword ptr [ebx+4]
 000402EC    mov         edx,dword ptr [esp]
 000402EF    mov         eax,dword ptr [eax+edx*4]
 000402F2    mov         edi,dword ptr [eax]
>000402F4    jmp         00040300
 000402F6    push        2
 000402F8    push        esi
 000402F9    call        user32.GetWindow
 000402FE    mov         esi,eax
 00040300    test        edi,edi
>00040302    jne         00040308
 00040304    test        esi,esi
>00040306    jne         000402DA
 00040308    mov         eax,edi
 0004030A    pop         edx
 0004030B    pop         edi
 0004030C    pop         esi
 0004030D    pop         ebx
 0004030E    ret
*}
end;

//00040310
procedure TDragObject.Assign(Source:TDragObject);
begin
{*
 00040310    mov         ecx,dword ptr [edx+4]
 00040313    mov         dword ptr [eax+4],ecx
 00040316    mov         ecx,dword ptr [edx+8]
 00040319    mov         dword ptr [eax+8],ecx
 0004031C    mov         ecx,dword ptr [edx+0C]
 0004031F    mov         dword ptr [eax+0C],ecx
 00040322    mov         ecx,dword ptr [edx+10]
 00040325    mov         dword ptr [eax+10],ecx
 00040328    mov         ecx,dword ptr [edx+14]
 0004032B    mov         dword ptr [eax+14],ecx
 0004032E    mov         ecx,dword ptr [edx+18]
 00040331    mov         dword ptr [eax+18],ecx
 00040334    mov         ecx,dword ptr [edx+1C]
 00040337    mov         dword ptr [eax+1C],ecx
 0004033A    mov         ecx,dword ptr [edx+20]
 0004033D    mov         dword ptr [eax+20],ecx
 00040340    mov         ecx,dword ptr [edx+24]
 00040343    mov         dword ptr [eax+24],ecx
 00040346    mov         ecx,dword ptr [edx+28]
 00040349    mov         dword ptr [eax+28],ecx
 0004034C    ret
*}
end;

//00040350
function TDragObject.Capture:HWND;
begin
{*
 00040350    push        ebx
 00040351    push        eax
 00040352    push        403AC;TDragObject.MouseMsg
 00040357    call        AllocateHWnd
 0004035C    mov         ebx,eax
 0004035E    push        ebx
 0004035F    call        user32.SetCapture
 00040364    mov         eax,ebx
 00040366    pop         ebx
 00040367    ret
*}
end;

//00040368
procedure sub_00040368;
begin
{*
 00040368    push        ebp
 00040369    mov         ebp,esp
 0004036B    pop         ebp
 0004036C    ret         8
*}
end;

//00040370
function TDragObject.GetName:AnsiString;
begin
{*
 00040370    push        ebx
 00040371    push        esi
 00040372    add         esp,0FFFFFF00
 00040378    mov         esi,edx
 0004037A    mov         ebx,eax
 0004037C    mov         edx,esp
 0004037E    mov         eax,dword ptr [ebx]
 00040380    call        TObject.ClassName
 00040385    mov         edx,esp
 00040387    mov         eax,esi
 00040389    call        @LStrFromString
 0004038E    add         esp,100
 00040394    pop         esi
 00040395    pop         ebx
 00040396    ret
*}
end;

//00040398
procedure TDragObject.ReleaseCapture(Handle:HWND);
begin
{*
 00040398    push        ebx
 00040399    mov         ebx,edx
 0004039B    call        user32.ReleaseCapture
 000403A0    mov         eax,ebx
 000403A2    call        DeallocateHWnd
 000403A7    pop         ebx
 000403A8    ret
*}
end;

//000403AC
procedure TDragObject.MouseMsg(var Msg:TMessage);
begin
{*
 000403AC    push        ebp
 000403AD    mov         ebp,esp
 000403AF    add         esp,0FFFFFFF8
 000403B2    push        ebx
 000403B3    push        esi
 000403B4    push        edi
 000403B5    mov         ebx,edx
 000403B7    xor         eax,eax
 000403B9    push        ebp
 000403BA    push        40462
 000403BF    push        dword ptr fs:[eax]
 000403C2    mov         dword ptr fs:[eax],esp
 000403C5    mov         eax,dword ptr [ebx]
 000403C7    cmp         eax,205
>000403CC    jg          000403DE
>000403CE    je          0004040E
 000403D0    sub         eax,200
>000403D5    je          000403EA
 000403D7    sub         eax,2
>000403DA    je          0004040E
>000403DC    jmp         00040458
 000403DE    sub         eax,0BD00
>000403E3    je          0004042C
 000403E5    dec         eax
>000403E6    je          00040417
>000403E8    jmp         00040458
 000403EA    lea         edx,[ebp-8]
 000403ED    mov         eax,dword ptr [ebx+8]
 000403F0    call        SmallPointToPoint
 000403F5    lea         eax,[ebp-8]
 000403F8    push        eax
 000403F9    mov         eax,[000B6748]
 000403FE    push        eax
 000403FF    call        user32.ClientToScreen
 00040404    lea         eax,[ebp-8]
 00040407    call        DragTo
>0004040C    jmp         00040458
 0004040E    mov         al,1
 00040410    call        DragDone
>00040415    jmp         00040458
 00040417    cmp         dword ptr [ebx+4],11
>0004041B    jne         00040458
 0004041D    mov         eax,[000B6740]
 00040422    add         eax,0C
 00040425    call        DragTo
>0004042A    jmp         00040458
 0004042C    mov         eax,dword ptr [ebx+4]
 0004042F    sub         eax,11
>00040432    je          0004043B
 00040434    sub         eax,0A
>00040437    je          0004044A
>00040439    jmp         00040458
 0004043B    mov         eax,[000B6740]
 00040440    add         eax,0C
 00040443    call        DragTo
>00040448    jmp         00040458
 0004044A    mov         dword ptr [ebx+0C],1
 00040451    xor         eax,eax
 00040453    call        DragDone
 00040458    xor         eax,eax
 0004045A    pop         edx
 0004045B    pop         ecx
 0004045C    pop         ecx
 0004045D    mov         dword ptr fs:[eax],edx
>00040460    jmp         00040481
>00040462    jmp         @HandleAnyException
 00040467    cmp         dword ptr ds:[0B673C],0
>0004046E    je          00040477
 00040470    xor         eax,eax
 00040472    call        DragDone
 00040477    call        @RaiseAgain
 0004047C    call        @DoneExcept
 00040481    pop         edi
 00040482    pop         esi
 00040483    pop         ebx
 00040484    pop         ecx
 00040485    pop         ecx
 00040486    pop         ebp
 00040487    ret
*}
end;

//00040488
{*function sub_00040488:?;
begin
 00040488    xor         eax,eax
 0004048A    ret
end;*}

//0004048C
function TDragObject.GetDragCursor(Accepted:Boolean; X:Integer; Y:Integer):TCursor;
begin
{*
 0004048C    push        ebp
 0004048D    mov         ebp,esp
 0004048F    test        dl,dl
>00040491    je          00040499
 00040493    mov         ax,0FFF4
>00040497    jmp         0004049D
 00040499    mov         ax,0FFF3
 0004049D    pop         ebp
 0004049E    ret         4
*}
end;

//000404A4
procedure sub_000404A4;
begin
{*
 000404A4    ret
*}
end;

//000404A8
function TDragObject.Instance:THandle;
begin
{*
 000404A8    mov         eax,[000B5950];^HInstance:Longword
 000404AD    mov         eax,dword ptr [eax]
 000404AF    ret
*}
end;

//000404B0
procedure sub_000404B0;
begin
{*
 000404B0    ret
*}
end;

//000404B4
constructor TBaseDragControlObject.Create(AControl:TControl);
begin
{*
 000404B4    test        dl,dl
>000404B6    je          000404C0
 000404B8    add         esp,0FFFFFFF0
 000404BB    call        @ClassCreate
 000404C0    mov         dword ptr [eax+30],ecx
 000404C3    test        dl,dl
>000404C5    je          000404D6
 000404C7    call        @AfterConstruction
 000404CC    pop         dword ptr fs:[0]
 000404D3    add         esp,0C
 000404D6    ret
*}
end;

//000404D8
procedure TBaseDragControlObject.Assign(Source:TDragObject);
begin
{*
 000404D8    push        ebx
 000404D9    push        esi
 000404DA    mov         esi,edx
 000404DC    mov         ebx,eax
 000404DE    mov         edx,esi
 000404E0    mov         eax,ebx
 000404E2    call        TDragObject.Assign
 000404E7    mov         eax,esi
 000404E9    mov         edx,dword ptr ds:[3DFE4];TBaseDragControlObject
 000404EF    call        @IsClass
 000404F4    test        al,al
>000404F6    je          000404FE
 000404F8    mov         eax,dword ptr [esi+30]
 000404FB    mov         dword ptr [ebx+30],eax
 000404FE    pop         esi
 000404FF    pop         ebx
 00040500    ret
*}
end;

//00040504
procedure TBaseDragControlObject.EndDrag(Target:TObject; X:Integer; Y:Integer);
begin
{*
 00040504    push        ebp
 00040505    mov         ebp,esp
 00040507    push        ebx
 00040508    push        esi
 00040509    push        edi
 0004050A    mov         edi,edx
 0004050C    mov         esi,eax
 0004050E    mov         eax,dword ptr [ebp+8]
 00040511    push        eax
 00040512    mov         edx,edi
 00040514    mov         eax,dword ptr [esi+30]
 00040517    mov         bx,0FFE3
 0004051B    call        @CallDynaInst
 00040520    pop         edi
 00040521    pop         esi
 00040522    pop         ebx
 00040523    pop         ebp
 00040524    ret         4
*}
end;

//00040528
procedure TBaseDragControlObject.Finished(Target:TObject; X:Integer; Y:Integer; Accepted:Boolean);
begin
{*
 00040528    push        ebp
 00040529    mov         ebp,esp
 0004052B    push        ebx
 0004052C    push        esi
 0004052D    push        edi
 0004052E    mov         edi,ecx
 00040530    mov         esi,eax
 00040532    cmp         byte ptr [ebp+8],0
>00040536    jne         00040546
 00040538    mov         eax,dword ptr [esi+30]
 0004053B    mov         bx,0FFE5
 0004053F    call        @CallDynaInst
 00040544    xor         edx,edx
 00040546    mov         eax,dword ptr [ebp+0C]
 00040549    push        eax
 0004054A    mov         ecx,edi
 0004054C    mov         eax,esi
 0004054E    mov         ebx,dword ptr [eax]
 00040550    call        dword ptr [ebx+20]
 00040553    pop         edi
 00040554    pop         esi
 00040555    pop         ebx
 00040556    pop         ebp
 00040557    ret         8
*}
end;

//0004055C
function TDragControlObject.GetDragCursor(Accepted:Boolean; X:Integer; Y:Integer):TCursor;
begin
{*
 0004055C    push        ebp
 0004055D    mov         ebp,esp
 0004055F    test        dl,dl
>00040561    je          0004056C
 00040563    mov         eax,dword ptr [eax+30]
 00040566    mov         ax,word ptr [eax+6E]
>0004056A    jmp         00040570
 0004056C    mov         ax,0FFF3
 00040570    pop         ebp
 00040571    ret         4
*}
end;

//00040574
function TDragControlObject.GetDragImages:TDragImageList;
begin
{*
 00040574    mov         eax,dword ptr [eax+30]
 00040577    mov         edx,dword ptr [eax]
 00040579    call        dword ptr [edx+4C]
 0004057C    ret
*}
end;

//00040580
procedure TDragControlObject.HideDragImage;
begin
{*
 00040580    push        ebx
 00040581    mov         ebx,eax
 00040583    mov         eax,dword ptr [ebx+30]
 00040586    mov         edx,dword ptr [eax]
 00040588    call        dword ptr [edx+4C]
 0004058B    test        eax,eax
>0004058D    je          0004059C
 0004058F    mov         eax,dword ptr [ebx+30]
 00040592    mov         edx,dword ptr [eax]
 00040594    call        dword ptr [edx+4C]
 00040597    call        TDragImageList.HideDragImage
 0004059C    pop         ebx
 0004059D    ret
*}
end;

//000405A0
procedure TDragControlObject.ShowDragImage;
begin
{*
 000405A0    push        ebx
 000405A1    mov         ebx,eax
 000405A3    mov         eax,dword ptr [ebx+30]
 000405A6    mov         edx,dword ptr [eax]
 000405A8    call        dword ptr [edx+4C]
 000405AB    test        eax,eax
>000405AD    je          000405BC
 000405AF    mov         eax,dword ptr [ebx+30]
 000405B2    mov         edx,dword ptr [eax]
 000405B4    call        dword ptr [edx+4C]
 000405B7    call        TDragImageList.ShowDragImage
 000405BC    pop         ebx
 000405BD    ret
*}
end;

//000405C0
constructor TDragDockObject.Create(AControl:TControl);
begin
{*
 000405C0    push        ebp
 000405C1    mov         ebp,esp
 000405C3    push        ecx
 000405C4    push        ebx
 000405C5    push        esi
 000405C6    test        dl,dl
>000405C8    je          000405D2
 000405CA    add         esp,0FFFFFFF0
 000405CD    call        @ClassCreate
 000405D2    mov         byte ptr [ebp-1],dl
 000405D5    mov         ebx,eax
 000405D7    xor         edx,edx
 000405D9    mov         eax,ebx
 000405DB    call        TBaseDragControlObject.Create
 000405E0    mov         dl,1
 000405E2    mov         eax,[0002899C];TBrush
 000405E7    call        TBrush.Create
 000405EC    mov         esi,eax
 000405EE    mov         dword ptr [ebx+34],esi
 000405F1    mov         edx,0FFFFFF
 000405F6    xor         eax,eax
 000405F8    call        AllocPatternBitmap
 000405FD    mov         edx,eax
 000405FF    mov         eax,esi
 00040601    call        TBrush.SetBitmap
 00040606    mov         eax,ebx
 00040608    cmp         byte ptr [ebp-1],0
>0004060C    je          0004061D
 0004060E    call        @AfterConstruction
 00040613    pop         dword ptr fs:[0]
 0004061A    add         esp,0C
 0004061D    mov         eax,ebx
 0004061F    pop         esi
 00040620    pop         ebx
 00040621    pop         ecx
 00040622    pop         ebp
 00040623    ret
*}
end;

//00040624
destructor TDragDockObject.Destroy;
begin
{*
 00040624    push        ebx
 00040625    push        esi
 00040626    call        @BeforeDestruction
 0004062B    mov         ebx,edx
 0004062D    mov         esi,eax
 0004062F    mov         eax,dword ptr [esi+34]
 00040632    call        TObject.Free
 00040637    mov         edx,ebx
 00040639    and         dl,0FC
 0004063C    mov         eax,esi
 0004063E    call        TObject.Destroy
 00040643    test        bl,bl
>00040645    jle         0004064E
 00040647    mov         eax,esi
 00040649    call        @ClassDestroy
 0004064E    pop         esi
 0004064F    pop         ebx
 00040650    ret
*}
end;

//00040654
procedure TDragDockObject.Assign(Source:TDragObject);
begin
{*
 00040654    push        ebx
 00040655    push        esi
 00040656    push        edi
 00040657    mov         esi,edx
 00040659    mov         ebx,eax
 0004065B    mov         edx,esi
 0004065D    mov         eax,ebx
 0004065F    call        TBaseDragControlObject.Assign
 00040664    mov         eax,esi
 00040666    mov         edx,dword ptr ds:[3E0F8];TDragDockObject
 0004066C    call        @IsClass
 00040671    test        al,al
>00040673    je          000406B2
 00040675    mov         eax,esi
 00040677    mov         dl,byte ptr [eax+48]
 0004067A    mov         byte ptr [ebx+48],dl
 0004067D    mov         edx,dword ptr [eax+4C]
 00040680    mov         dword ptr [ebx+4C],edx
 00040683    mov         dl,byte ptr [eax+60]
 00040686    mov         byte ptr [ebx+60],dl
 00040689    push        esi
 0004068A    lea         esi,[eax+38]
 0004068D    lea         edi,[ebx+38]
 00040690    mov         ecx,4
 00040695    rep movs    dword ptr [edi],dword ptr [esi]
 00040697    pop         esi
 00040698    push        esi
 00040699    lea         esi,[eax+50]
 0004069C    lea         edi,[ebx+50]
 0004069F    mov         ecx,4
 000406A4    rep movs    dword ptr [edi],dword ptr [esi]
 000406A6    pop         esi
 000406A7    mov         edx,dword ptr [eax+34]
 000406AA    mov         eax,dword ptr [ebx+34]
 000406AD    mov         ecx,dword ptr [eax]
 000406AF    call        dword ptr [ecx+8]
 000406B2    pop         edi
 000406B3    pop         esi
 000406B4    pop         ebx
 000406B5    ret
*}
end;

//000406B8
procedure TDragDockObject.EndDrag(Target:TObject; X:Integer; Y:Integer);
begin
{*
 000406B8    push        ebp
 000406B9    mov         ebp,esp
 000406BB    push        ebx
 000406BC    push        esi
 000406BD    mov         esi,eax
 000406BF    mov         eax,dword ptr [ebp+8]
 000406C2    push        eax
 000406C3    mov         eax,dword ptr [esi+30]
 000406C6    mov         bx,0FFE8
 000406CA    call        @CallDynaInst
 000406CF    pop         esi
 000406D0    pop         ebx
 000406D1    pop         ebp
 000406D2    ret         4
*}
end;

//000406D8
function AbsMin(Value1:Integer; Value2:Integer):Integer;
begin
{*
 000406D8    push        ebx
 000406D9    push        esi
 000406DA    mov         ebx,edx
 000406DC    mov         ecx,eax
 000406DE    mov         eax,ecx
 000406E0    cdq
 000406E1    xor         eax,edx
 000406E3    sub         eax,edx
 000406E5    mov         esi,eax
 000406E7    mov         eax,ebx
 000406E9    cdq
 000406EA    xor         eax,edx
 000406EC    sub         eax,edx
 000406EE    cmp         esi,eax
>000406F0    jge         000406F7
 000406F2    mov         eax,ecx
 000406F4    pop         esi
 000406F5    pop         ebx
 000406F6    ret
 000406F7    mov         eax,ebx
 000406F9    pop         esi
 000406FA    pop         ebx
 000406FB    ret
*}
end;

//000406FC
procedure TDragDockObject.AdjustDockRect(ARect:TRect);
begin
{*
 000406FC    push        ebx
 000406FD    push        esi
 000406FE    push        edi
 000406FF    add         esp,0FFFFFFF0
 00040702    mov         esi,edx
 00040704    lea         edi,[esp]
 00040707    mov         ecx,4
 0004070C    rep movs    dword ptr [edi],dword ptr [esi]
 0004070E    mov         ebx,eax
 00040710    mov         eax,dword ptr [ebx+0C]
 00040713    mov         edx,dword ptr [esp]
 00040716    cmp         eax,edx
>00040718    jl          00040720
 0004071A    cmp         eax,dword ptr [esp+8]
>0004071E    jle         00040734
 00040720    sub         edx,eax
 00040722    mov         ecx,dword ptr [esp+8]
 00040726    sub         ecx,eax
 00040728    mov         eax,ecx
 0004072A    xchg        eax,edx
 0004072B    call        AbsMin
 00040730    mov         esi,eax
>00040732    jmp         00040736
 00040734    xor         esi,esi
 00040736    mov         eax,dword ptr [ebx+10]
 00040739    mov         edx,dword ptr [esp+4]
 0004073D    cmp         eax,edx
>0004073F    jl          00040747
 00040741    cmp         eax,dword ptr [esp+0C]
>00040745    jle         00040759
 00040747    sub         edx,eax
 00040749    mov         ecx,dword ptr [esp+0C]
 0004074D    sub         ecx,eax
 0004074F    mov         eax,ecx
 00040751    xchg        eax,edx
 00040752    call        AbsMin
>00040757    jmp         0004075B
 00040759    xor         eax,eax
 0004075B    test        esi,esi
>0004075D    jne         00040763
 0004075F    test        eax,eax
>00040761    je          00040772
 00040763    neg         eax
 00040765    push        eax
 00040766    neg         esi
 00040768    push        esi
 00040769    lea         eax,[ebx+38]
 0004076C    push        eax
 0004076D    call        user32.OffsetRect
 00040772    add         esp,10
 00040775    pop         edi
 00040776    pop         esi
 00040777    pop         ebx
 00040778    ret
*}
end;

//0004077C
procedure TDragDockObject.DrawDragDockImage;
begin
{*
 0004077C    push        ebx
 0004077D    mov         edx,eax
 0004077F    mov         eax,dword ptr [eax+30]
 00040782    mov         bx,0FFE1
 00040786    call        @CallDynaInst
 0004078B    pop         ebx
 0004078C    ret
*}
end;

//00040790
procedure TDragDockObject.EraseDragDockImage;
begin
{*
 00040790    push        ebx
 00040791    mov         edx,eax
 00040793    mov         eax,dword ptr [eax+30]
 00040796    mov         bx,0FFE0
 0004079A    call        @CallDynaInst
 0004079F    pop         ebx
 000407A0    ret
*}
end;

//000407A4
function TDragDockObject.GetDragCursor(Accepted:Boolean; X:Integer; Y:Integer):TCursor;
begin
{*
 000407A4    push        ebp
 000407A5    mov         ebp,esp
 000407A7    xor         eax,eax
 000407A9    pop         ebp
 000407AA    ret         4
*}
end;

//000407B0
{*function sub_000407B0:?;
begin
 000407B0    mov         eax,4
 000407B5    ret
end;*}

//000407B8
function IsBeforeTargetWindow(Window:HWND; Data:Longint):BOOL; stdcall;
begin
{*
 000407B8    push        ebp
 000407B9    mov         ebp,esp
 000407BB    add         esp,0FFFFFFF0
 000407BE    push        ebx
 000407BF    push        esi
 000407C0    push        edi
 000407C1    mov         ebx,dword ptr [ebp+0C]
 000407C4    mov         esi,dword ptr [ebp+8]
 000407C7    mov         edi,ebx
 000407C9    cmp         esi,dword ptr [edi+4]
>000407CC    jne         000407D2
 000407CE    xor         eax,eax
>000407D0    jmp         00040818
 000407D2    cmp         dword ptr [edi+8],0
>000407D6    jne         000407F8
 000407D8    lea         eax,[ebp-10]
 000407DB    push        eax
 000407DC    push        esi
 000407DD    call        user32.GetWindowRect
 000407E2    push        dword ptr [edi+10]
 000407E5    push        dword ptr [edi+0C]
 000407E8    lea         eax,[ebp-10]
 000407EB    push        eax
 000407EC    call        user32.PtInRect
 000407F1    test        eax,eax
>000407F3    je          000407F8
 000407F5    mov         dword ptr [edi+8],esi
 000407F8    mov         edx,ebx
 000407FA    cmp         esi,dword ptr [edx]
>000407FC    jne         00040808
 000407FE    or          eax,0FFFFFFFF
 00040801    xor         ecx,ecx
 00040803    mov         dword ptr [edx+8],ecx
>00040806    jmp         00040818
 00040808    cmp         esi,dword ptr [edx+8]
>0004080B    jne         00040815
 0004080D    xor         eax,eax
 0004080F    mov         byte ptr [edx+14],1
>00040813    jmp         00040818
 00040815    or          eax,0FFFFFFFF
 00040818    pop         edi
 00040819    pop         esi
 0004081A    pop         ebx
 0004081B    mov         esp,ebp
 0004081D    pop         ebp
 0004081E    ret         8
*}
end;

//00040824
function ValidDockTarget(Target:TWinControl):Boolean;
begin
{*
 00040824    push        ebp
 00040825    mov         ebp,esp
 00040827    add         esp,0FFFFFFC8
 0004082A    push        ebx
 0004082B    push        esi
 0004082C    push        edi
 0004082D    mov         edi,eax
 0004082F    mov         bl,1
 00040831    mov         eax,dword ptr [ebp+8]
 00040834    add         eax,0FFFFFFF8
 00040837    call        DragFindWindow
 0004083C    mov         esi,eax
 0004083E    mov         dword ptr [ebp-10],esi
 00040841    push        4
 00040843    push        esi
 00040844    call        user32.GetWindow
 00040849    mov         edx,dword ptr ds:[0B59E8];^Application:TApplication
 0004084F    mov         edx,dword ptr [edx]
 00040851    cmp         eax,dword ptr [edx+24]
>00040854    je          0004087D
 00040856    mov         eax,dword ptr [ebp-10]
 00040859    call        FindControl
 0004085E    mov         esi,eax
 00040860    test        esi,esi
>00040862    je          00040962
>00040868    jmp         0004086C
 0004086A    mov         esi,eax
 0004086C    mov         eax,dword ptr [esi+24]
 0004086F    test        eax,eax
>00040871    jne         0004086A
 00040873    mov         eax,esi
 00040875    call        TWinControl.GetHandle
 0004087A    mov         dword ptr [ebp-10],eax
 0004087D    cmp         dword ptr [ebp-10],0
>00040881    je          00040962
 00040887    mov         esi,edi
>00040889    jmp         0004088D
 0004088B    mov         esi,eax
 0004088D    mov         eax,dword ptr [esi+24]
 00040890    test        eax,eax
>00040892    jne         0004088B
 00040894    mov         eax,esi
 00040896    call        TWinControl.GetHandle
 0004089B    mov         edi,eax
 0004089D    mov         dword ptr [ebp-14],edi
 000408A0    cmp         edi,dword ptr [ebp-10]
>000408A3    je          00040962
 000408A9    mov         eax,dword ptr [ebp+8]
 000408AC    mov         eax,dword ptr [eax-0C]
 000408AF    mov         eax,dword ptr [eax+24]
 000408B2    test        eax,eax
>000408B4    je          000408D2
 000408B6    mov         edx,dword ptr [ebp+8]
 000408B9    mov         esi,eax
>000408BB    jmp         000408BF
 000408BD    mov         esi,eax
 000408BF    mov         eax,dword ptr [esi+24]
 000408C2    test        eax,eax
>000408C4    jne         000408BD
 000408C6    mov         eax,esi
 000408C8    call        TWinControl.GetHandle
 000408CD    mov         dword ptr [ebp-18],eax
>000408D0    jmp         000408FC
 000408D2    mov         eax,dword ptr [ebp+8]
 000408D5    mov         eax,dword ptr [eax-0C]
 000408D8    mov         edx,dword ptr ds:[3F0BC];TWinControl
 000408DE    call        @IsClass
 000408E3    test        al,al
>000408E5    je          000408F7
 000408E7    mov         eax,dword ptr [ebp+8]
 000408EA    mov         eax,dword ptr [eax-0C]
 000408ED    call        TWinControl.GetHandle
 000408F2    mov         dword ptr [ebp-18],eax
>000408F5    jmp         000408FC
 000408F7    xor         eax,eax
 000408F9    mov         dword ptr [ebp-18],eax
 000408FC    mov         eax,dword ptr [ebp-10]
 000408FF    cmp         eax,dword ptr [ebp-18]
>00040902    je          00040962
 00040904    mov         byte ptr [ebp-4],0
 00040908    mov         eax,dword ptr [ebp+8]
 0004090B    mov         edx,dword ptr [eax-8]
 0004090E    mov         dword ptr [ebp-0C],edx
 00040911    mov         edx,dword ptr [eax-4]
 00040914    mov         dword ptr [ebp-8],edx
 00040917    lea         eax,[ebp-18]
 0004091A    push        eax
 0004091B    push        407B8;IsBeforeTargetWindow:BOOL
 00040920    call        kernel32.GetCurrentThreadId
 00040925    push        eax
 00040926    call        user32.EnumThreadWindows
 0004092B    cmp         byte ptr [ebp-4],0
>0004092F    je          00040962
 00040931    lea         eax,[ebp-28]
 00040934    push        eax
 00040935    mov         eax,dword ptr [ebp-10]
 00040938    push        eax
 00040939    call        user32.GetWindowRect
 0004093E    lea         eax,[ebp-38]
 00040941    push        eax
 00040942    mov         eax,dword ptr [ebp-14]
 00040945    push        eax
 00040946    call        user32.GetWindowRect
 0004094B    lea         eax,[ebp-38]
 0004094E    push        eax
 0004094F    lea         eax,[ebp-28]
 00040952    push        eax
 00040953    lea         eax,[ebp-28]
 00040956    push        eax
 00040957    call        user32.IntersectRect
 0004095C    test        eax,eax
>0004095E    je          00040962
 00040960    xor         ebx,ebx
 00040962    mov         eax,ebx
 00040964    pop         edi
 00040965    pop         esi
 00040966    pop         ebx
 00040967    mov         esp,ebp
 00040969    pop         ebp
 0004096A    ret
*}
end;

//0004096C
function IsSiteChildOfClient:Boolean;
begin
{*
 0004096C    push        ebp
 0004096D    mov         ebp,esp
 0004096F    mov         eax,dword ptr [ebp+8]
 00040972    mov         eax,dword ptr [eax-0C]
 00040975    mov         edx,dword ptr ds:[3F0BC];TWinControl
 0004097B    call        @IsClass
 00040980    test        al,al
>00040982    je          000409A9
 00040984    mov         eax,dword ptr [ebp+8]
 00040987    mov         eax,dword ptr [eax-10]
 0004098A    call        TWinControl.GetHandle
 0004098F    push        eax
 00040990    mov         eax,dword ptr [ebp+8]
 00040993    mov         eax,dword ptr [eax-0C]
 00040996    call        TWinControl.GetHandle
 0004099B    push        eax
 0004099C    call        user32.IsChild
 000409A1    neg         eax
 000409A3    sbb         eax,eax
 000409A5    neg         eax
 000409A7    pop         ebp
 000409A8    ret
 000409A9    xor         eax,eax
 000409AB    pop         ebp
 000409AC    ret
*}
end;

//000409B0
function GetDockSiteAtPos(MousePos:TPoint; Client:TControl):TWinControl;
begin
{*
 000409B0    push        ebp
 000409B1    mov         ebp,esp
 000409B3    add         esp,0FFFFFFD8
 000409B6    push        ebx
 000409B7    push        esi
 000409B8    push        edi
 000409B9    mov         esi,eax
 000409BB    lea         edi,[ebp-8]
 000409BE    movs        dword ptr [edi],dword ptr [esi]
 000409BF    movs        dword ptr [edi],dword ptr [esi]
 000409C0    mov         dword ptr [ebp-0C],edx
 000409C3    xor         eax,eax
 000409C5    mov         dword ptr [ebp-14],eax
 000409C8    push        11
 000409CA    call        user32.GetKeyState
 000409CF    test        ax,8000
 000409D3    setne       al
 000409D6    cmp         dword ptr ds:[0B6764],0
 000409DD    sete        dl
 000409E0    or          al,dl
>000409E2    jne         00040AF4
 000409E8    mov         eax,[000B6768]
 000409ED    mov         bx,0FFFF
 000409F1    call        @CallDynaInst
 000409F6    mov         eax,[000B6764]
 000409FB    mov         esi,dword ptr [eax+8]
 000409FE    dec         esi
 000409FF    test        esi,esi
>00040A01    jl          00040AC3
 00040A07    inc         esi
 00040A08    xor         edi,edi
 00040A0A    mov         edx,edi
 00040A0C    mov         eax,[000B6764]
 00040A11    call        TList.Get
 00040A16    mov         dword ptr [ebp-10],eax
 00040A19    mov         eax,dword ptr [ebp-10]
 00040A1C    cmp         eax,dword ptr [ebp-0C]
>00040A1F    je          00040ABB
 00040A25    mov         eax,dword ptr [ebp-10]
 00040A28    cmp         byte ptr [eax+16C],0
>00040A2F    je          00040ABB
 00040A35    mov         eax,dword ptr [ebp-10]
 00040A38    mov         edx,dword ptr [eax]
 00040A3A    call        dword ptr [edx+50]
 00040A3D    test        al,al
>00040A3F    je          00040ABB
 00040A41    mov         eax,dword ptr [ebp-10]
 00040A44    call        TWinControl.GetHandle
 00040A49    push        eax
 00040A4A    call        user32.IsWindowVisible
 00040A4F    test        eax,eax
>00040A51    je          00040ABB
 00040A53    push        ebp
 00040A54    call        IsSiteChildOfClient
 00040A59    pop         ecx
 00040A5A    test        al,al
>00040A5C    jne         00040ABB
 00040A5E    mov         eax,dword ptr [ebp-0C]
 00040A61    mov         eax,dword ptr [eax+8C]
 00040A67    cmp         eax,dword ptr [ebp-10]
>00040A6A    jne         00040A77
 00040A6C    mov         eax,dword ptr [ebp-10]
 00040A6F    call        TWinControl.GetDockClientCount
 00040A74    dec         eax
>00040A75    jle         00040ABB
 00040A77    mov         byte ptr [ebp-15],1
 00040A7B    lea         eax,[ebp-8]
 00040A7E    push        eax
 00040A7F    lea         eax,[ebp-15]
 00040A82    push        eax
 00040A83    lea         ecx,[ebp-28]
 00040A86    mov         edx,dword ptr [ebp-0C]
 00040A89    mov         eax,dword ptr [ebp-10]
 00040A8C    mov         bx,0FFC2
 00040A90    call        @CallDynaInst
 00040A95    cmp         byte ptr [ebp-15],0
>00040A99    je          00040ABB
 00040A9B    push        dword ptr [ebp-4]
 00040A9E    push        dword ptr [ebp-8]
 00040AA1    lea         eax,[ebp-28]
 00040AA4    push        eax
 00040AA5    call        user32.PtInRect
 00040AAA    test        eax,eax
>00040AAC    je          00040ABB
 00040AAE    mov         edx,dword ptr [ebp-10]
 00040AB1    mov         eax,[000B6768]
 00040AB6    call        TSiteList.AddSite
 00040ABB    inc         edi
 00040ABC    dec         esi
>00040ABD    jne         00040A0A
 00040AC3    mov         eax,[000B6768]
 00040AC8    cmp         dword ptr [eax+8],0
>00040ACC    jle         00040ADB
 00040ACE    mov         eax,[000B6768]
 00040AD3    call        TSiteList.GetTopSite
 00040AD8    mov         dword ptr [ebp-14],eax
 00040ADB    cmp         dword ptr [ebp-14],0
>00040ADF    je          00040AF4
 00040AE1    push        ebp
 00040AE2    mov         eax,dword ptr [ebp-14]
 00040AE5    call        ValidDockTarget
 00040AEA    pop         ecx
 00040AEB    test        al,al
>00040AED    jne         00040AF4
 00040AEF    xor         eax,eax
 00040AF1    mov         dword ptr [ebp-14],eax
 00040AF4    mov         eax,dword ptr [ebp-14]
 00040AF7    pop         edi
 00040AF8    pop         esi
 00040AF9    pop         ebx
 00040AFA    mov         esp,ebp
 00040AFC    pop         ebp
 00040AFD    ret
*}
end;

//00040B00
procedure RegisterDockSite(Site:TWinControl; DoRegister:Boolean);
begin
{*
 00040B00    push        ebx
 00040B01    push        esi
 00040B02    push        edi
 00040B03    mov         ebx,edx
 00040B05    mov         esi,eax
 00040B07    test        esi,esi
>00040B09    je          00040B59
 00040B0B    cmp         dword ptr ds:[0B6764],0
>00040B12    jne         00040B25
 00040B14    mov         dl,1
 00040B16    mov         eax,[0001EEC4];TList
 00040B1B    call        TObject.Create
 00040B20    mov         [000B6764],eax
 00040B25    mov         edi,esi
 00040B27    mov         edx,edi
 00040B29    mov         eax,[000B6764]
 00040B2E    call        TList.IndexOf
 00040B33    test        bl,bl
>00040B35    je          00040B48
 00040B37    inc         eax
>00040B38    jne         00040B59
 00040B3A    mov         edx,edi
 00040B3C    mov         eax,[000B6764]
 00040B41    call        TList.Add
>00040B46    jmp         00040B59
 00040B48    cmp         eax,0FFFFFFFF
>00040B4B    je          00040B59
 00040B4D    mov         edx,eax
 00040B4F    mov         eax,[000B6764]
 00040B54    call        TList.Delete
 00040B59    pop         edi
 00040B5A    pop         esi
 00040B5B    pop         ebx
 00040B5C    ret
*}
end;

//00040B60
function DragMessage(Handle:HWND; Msg:TDragMessage; Source:TDragObject; Target:Pointer; const Pos:TPoint):Longint;
begin
{*
 00040B60    push        ebp
 00040B61    mov         ebp,esp
 00040B63    add         esp,0FFFFFFE8
 00040B66    push        ebx
 00040B67    mov         dword ptr [ebp-4],ecx
 00040B6A    xor         ecx,ecx
 00040B6C    test        eax,eax
>00040B6E    je          00040BAC
 00040B70    mov         ecx,dword ptr [ebp+8]
 00040B73    mov         ebx,dword ptr [ecx]
 00040B75    mov         dword ptr [ebp-18],ebx
 00040B78    mov         ebx,dword ptr [ecx+4]
 00040B7B    mov         dword ptr [ebp-14],ebx
 00040B7E    mov         ecx,dword ptr [ebp+0C]
 00040B81    mov         dword ptr [ebp-0C],ecx
 00040B84    mov         ecx,dword ptr [ebp-4]
 00040B87    mov         dword ptr [ebp-10],ecx
 00040B8A    cmp         byte ptr ds:[0B675C],2
 00040B91    sete        cl
 00040B94    mov         byte ptr [ebp-8],cl
 00040B97    lea         ecx,[ebp-18]
 00040B9A    push        ecx
 00040B9B    and         edx,7F
 00040B9E    push        edx
 00040B9F    push        0B02F
 00040BA4    push        eax
 00040BA5    call        user32.SendMessageA
 00040BAA    mov         ecx,eax
 00040BAC    mov         eax,ecx
 00040BAE    pop         ebx
 00040BAF    mov         esp,ebp
 00040BB1    pop         ebp
 00040BB2    ret         8
*}
end;

//00040BB8
function IsDelphiHandle(Handle:HWND):Boolean;
begin
{*
 00040BB8    push        ebx
 00040BB9    mov         ebx,eax
 00040BBB    test        ebx,ebx
>00040BBD    je          00040BD1
 00040BBF    movzx       eax,word ptr ds:[0B6738]
 00040BC6    push        eax
 00040BC7    push        ebx
 00040BC8    call        user32.GetPropA
 00040BCD    test        eax,eax
>00040BCF    jne         00040BD5
 00040BD1    xor         eax,eax
 00040BD3    pop         ebx
 00040BD4    ret
 00040BD5    mov         al,1
 00040BD7    pop         ebx
 00040BD8    ret
*}
end;

//00040BDC
function DragFindWindow(const Pos:TPoint):HWND;
begin
{*
 00040BDC    push        ebx
 00040BDD    push        dword ptr [eax+4]
 00040BE0    push        dword ptr [eax]
 00040BE2    call        user32.WindowFromPoint
 00040BE7    mov         ebx,eax
 00040BE9    test        ebx,ebx
>00040BEB    je          00040C04
 00040BED    mov         eax,ebx
 00040BEF    call        IsDelphiHandle
 00040BF4    test        al,al
>00040BF6    jne         00040C04
 00040BF8    push        ebx
 00040BF9    call        user32.GetParent
 00040BFE    mov         ebx,eax
 00040C00    test        ebx,ebx
>00040C02    jne         00040BED
 00040C04    mov         eax,ebx
 00040C06    pop         ebx
 00040C07    ret
*}
end;

//00040C08
function DragFindTarget(const Pos:TPoint; var Handle:HWND; DragKind:TDragKind; Client:TControl):Pointer;
begin
{*
 00040C08    push        ebp
 00040C09    mov         ebp,esp
 00040C0B    push        ebx
 00040C0C    push        esi
 00040C0D    mov         esi,edx
 00040C0F    mov         ebx,eax
 00040C11    test        cl,cl
>00040C13    jne         00040C34
 00040C15    mov         eax,ebx
 00040C17    call        DragFindWindow
 00040C1C    mov         dword ptr [esi],eax
 00040C1E    push        0
 00040C20    push        ebx
 00040C21    mov         eax,dword ptr [esi]
 00040C23    mov         ecx,dword ptr ds:[0B6740]
 00040C29    mov         dl,5
 00040C2B    call        DragMessage
 00040C30    mov         ebx,eax
>00040C32    jmp         00040C4D
 00040C34    mov         eax,ebx
 00040C36    mov         edx,dword ptr [ebp+8]
 00040C39    call        GetDockSiteAtPos
 00040C3E    mov         ebx,eax
 00040C40    test        ebx,ebx
>00040C42    je          00040C4D
 00040C44    mov         eax,ebx
 00040C46    call        TWinControl.GetHandle
 00040C4B    mov         dword ptr [esi],eax
 00040C4D    mov         eax,ebx
 00040C4F    pop         esi
 00040C50    pop         ebx
 00040C51    pop         ebp
 00040C52    ret         4
*}
end;

//00040C58
function DoDragOver(DragMsg:TDragMessage):Boolean;
begin
{*
 00040C58    push        ebx
 00040C59    push        esi
 00040C5A    mov         ebx,eax
 00040C5C    xor         eax,eax
 00040C5E    mov         edx,dword ptr ds:[0B6740]
 00040C64    mov         esi,dword ptr [edx+4]
 00040C67    test        esi,esi
>00040C69    je          00040C90
 00040C6B    push        esi
 00040C6C    mov         eax,[000B6740]
 00040C71    add         eax,0C
 00040C74    push        eax
 00040C75    mov         eax,[000B6740]
 00040C7A    mov         eax,dword ptr [eax+8]
 00040C7D    mov         ecx,dword ptr ds:[0B6740]
 00040C83    mov         edx,ebx
 00040C85    call        DragMessage
 00040C8A    neg         eax
 00040C8C    sbb         eax,eax
 00040C8E    neg         eax
 00040C90    pop         esi
 00040C91    pop         ebx
 00040C92    ret
*}
end;

//00040C94
function GetDropCtl:TControl;
begin
{*
 00040C94    push        ebx
 00040C95    push        esi
 00040C96    push        edi
 00040C97    xor         edi,edi
 00040C99    mov         eax,[000B6740]
 00040C9E    mov         esi,dword ptr [eax+4]
 00040CA1    test        esi,esi
>00040CA3    je          00040D21
 00040CA5    cmp         byte ptr [esi+180],0
>00040CAC    je          00040D21
 00040CAE    cmp         dword ptr [esi+134],0
>00040CB5    je          00040D21
 00040CB7    mov         eax,esi
 00040CB9    call        TWinControl.GetDockClientCount
 00040CBE    test        eax,eax
>00040CC0    je          00040D21
 00040CC2    mov         eax,esi
 00040CC4    call        TWinControl.GetDockClientCount
 00040CC9    dec         eax
>00040CCA    jne         00040CE4
 00040CCC    xor         edx,edx
 00040CCE    mov         eax,dword ptr [esi+134]
 00040CD4    call        TList.Get
 00040CD9    mov         edx,dword ptr ds:[0B6740]
 00040CDF    cmp         eax,dword ptr [edx+30]
>00040CE2    je          00040D21
 00040CE4    mov         eax,[000B6740]
 00040CE9    add         eax,0C
 00040CEC    xor         edx,edx
 00040CEE    call        FindDragTarget
 00040CF3    mov         ebx,eax
>00040CF5    jmp         00040D19
 00040CF7    mov         edx,ebx
 00040CF9    mov         eax,dword ptr [esi+134]
 00040CFF    call        TList.IndexOf
 00040D04    cmp         eax,0FFFFFFFF
>00040D07    je          00040D16
 00040D09    mov         edx,eax
 00040D0B    mov         eax,esi
 00040D0D    call        TWinControl.GetDockClients
 00040D12    mov         edi,eax
>00040D14    jmp         00040D21
 00040D16    mov         ebx,dword ptr [ebx+24]
 00040D19    test        ebx,ebx
>00040D1B    je          00040D21
 00040D1D    cmp         esi,ebx
>00040D1F    jne         00040CF7
 00040D21    mov         eax,edi
 00040D23    pop         edi
 00040D24    pop         esi
 00040D25    pop         ebx
 00040D26    ret
*}
end;

//00040D28
procedure DragTo(const Pos:TPoint);
begin
{*
 00040D28    push        ebx
 00040D29    push        esi
 00040D2A    push        edi
 00040D2B    add         esp,0FFFFFFF0
 00040D2E    mov         esi,eax
 00040D30    cmp         byte ptr ds:[0B675C],0
>00040D37    jne         00040D66
 00040D39    mov         eax,[000B674C]
 00040D3E    sub         eax,dword ptr [esi]
 00040D40    cdq
 00040D41    xor         eax,edx
 00040D43    sub         eax,edx
 00040D45    cmp         eax,dword ptr ds:[0B6758]
>00040D4B    jge         00040D66
 00040D4D    mov         eax,[000B6750]
 00040D52    sub         eax,dword ptr [esi+4]
 00040D55    cdq
 00040D56    xor         eax,edx
 00040D58    sub         eax,edx
 00040D5A    cmp         eax,dword ptr ds:[0B6758]
>00040D60    jl          00040FF2
 00040D66    mov         eax,[000B673C]
 00040D6B    push        eax
 00040D6C    mov         eax,[000B673C]
 00040D71    mov         cl,byte ptr [eax+87]
 00040D77    lea         edx,[esp+4]
 00040D7B    mov         eax,esi
 00040D7D    call        DragFindTarget
 00040D82    mov         ebx,eax
 00040D84    cmp         byte ptr ds:[0B675C],0
>00040D8B    jne         00040DB3
 00040D8D    cmp         dword ptr ds:[0B6760],0
>00040D94    je          00040DB3
 00040D96    mov         eax,[000B6750]
 00040D9B    push        eax
 00040D9C    call        user32.GetDesktopWindow
 00040DA1    mov         edx,eax
 00040DA3    mov         ecx,dword ptr ds:[0B674C]
 00040DA9    mov         eax,[000B6760]
 00040DAE    call        TDragImageList.BeginDrag
 00040DB3    mov         eax,[000B673C]
 00040DB8    cmp         byte ptr [eax+87],0
>00040DBF    jne         00040DCF
 00040DC1    mov         byte ptr ds:[0B675C],1
 00040DC8    mov         byte ptr [esp+4],0
>00040DCD    jmp         00040DE2
 00040DCF    cmp         byte ptr ds:[0B675C],0
 00040DD6    setne       byte ptr [esp+4]
 00040DDB    mov         byte ptr ds:[0B675C],2
 00040DE2    mov         eax,[000B6740]
 00040DE7    cmp         ebx,dword ptr [eax+4]
>00040DEA    je          00040E37
 00040DEC    mov         al,1
 00040DEE    call        DoDragOver
 00040DF3    cmp         dword ptr ds:[0B6740],0
>00040DFA    je          00040FF2
 00040E00    mov         eax,[000B6740]
 00040E05    mov         dword ptr [eax+4],ebx
 00040E08    mov         eax,[000B6740]
 00040E0D    mov         edx,dword ptr [esp]
 00040E10    mov         dword ptr [eax+8],edx
 00040E13    mov         eax,[000B6740]
 00040E18    mov         edx,dword ptr [esi]
 00040E1A    mov         dword ptr [eax+0C],edx
 00040E1D    mov         edx,dword ptr [esi+4]
 00040E20    mov         dword ptr [eax+10],edx
 00040E23    xor         eax,eax
 00040E25    call        DoDragOver
 00040E2A    cmp         dword ptr ds:[0B6740],0
>00040E31    je          00040FF2
 00040E37    mov         eax,[000B6740]
 00040E3C    mov         edx,dword ptr [esi]
 00040E3E    mov         dword ptr [eax+0C],edx
 00040E41    mov         edx,dword ptr [esi+4]
 00040E44    mov         dword ptr [eax+10],edx
 00040E47    mov         eax,[000B6740]
 00040E4C    cmp         dword ptr [eax+4],0
>00040E50    je          00040E78
 00040E52    lea         ecx,[esp+8]
 00040E56    mov         edx,esi
 00040E58    mov         eax,[000B6740]
 00040E5D    mov         eax,dword ptr [eax+4]
 00040E60    call        TControl.ScreenToClient
 00040E65    mov         eax,[000B6740]
 00040E6A    mov         edx,dword ptr [esp+8]
 00040E6E    mov         dword ptr [eax+14],edx
 00040E71    mov         edx,dword ptr [esp+0C]
 00040E75    mov         dword ptr [eax+18],edx
 00040E78    mov         eax,dword ptr [esi+4]
 00040E7B    push        eax
 00040E7C    mov         al,2
 00040E7E    call        DoDragOver
 00040E83    mov         edx,eax
 00040E85    mov         ecx,dword ptr [esi]
 00040E87    mov         eax,[000B6740]
 00040E8C    mov         edi,dword ptr [eax]
 00040E8E    call        dword ptr [edi+4]
 00040E91    mov         edi,eax
 00040E93    cmp         dword ptr ds:[0B6760],0
>00040E9A    je          00040F06
 00040E9C    test        ebx,ebx
>00040E9E    je          00040EA6
 00040EA0    test        byte ptr [ebx+41],20
>00040EA4    je          00040EE7
 00040EA6    mov         edx,edi
 00040EA8    mov         eax,[000B6760]
 00040EAD    call        TDragImageList.SetDragCursor
 00040EB2    mov         eax,[000B6760]
 00040EB7    cmp         byte ptr [eax+5E],0
>00040EBB    jne         00040ED6
 00040EBD    mov         eax,dword ptr [esi+4]
 00040EC0    push        eax
 00040EC1    call        user32.GetDesktopWindow
 00040EC6    mov         edx,eax
 00040EC8    mov         ecx,dword ptr [esi]
 00040ECA    mov         eax,[000B6760]
 00040ECF    call        TDragImageList.BeginDrag
>00040ED4    jmp         00040F06
 00040ED6    mov         ecx,dword ptr [esi+4]
 00040ED9    mov         edx,dword ptr [esi]
 00040EDB    mov         eax,[000B6760]
 00040EE0    call        TDragImageList.DragMove
>00040EE5    jmp         00040F06
 00040EE7    mov         eax,[000B6760]
 00040EEC    call        TDragImageList.EndDrag
 00040EF1    movsx       edx,di
 00040EF4    mov         eax,[000B5BDC];^Screen:TScreen
 00040EF9    mov         eax,dword ptr [eax]
 00040EFB    call        TScreen.GetCursors
 00040F00    push        eax
 00040F01    call        user32.SetCursor
 00040F06    movsx       edx,di
 00040F09    mov         eax,[000B5BDC];^Screen:TScreen
 00040F0E    mov         eax,dword ptr [eax]
 00040F10    call        TScreen.GetCursors
 00040F15    push        eax
 00040F16    call        user32.SetCursor
 00040F1B    cmp         byte ptr ds:[0B675C],2
>00040F22    jne         00040FF2
 00040F28    test        ebx,ebx
>00040F2A    jne         00040F46
 00040F2C    mov         edx,dword ptr [esi+4]
 00040F2F    push        edx
 00040F30    mov         ecx,dword ptr [esi]
 00040F32    mov         eax,[000B6740]
 00040F37    mov         edx,dword ptr [eax+30]
 00040F3A    xchg        eax,edx
 00040F3B    mov         bx,0FFE9
 00040F3F    call        @CallDynaInst
>00040F44    jmp         00040FA2
 00040F46    call        GetDropCtl
 00040F4B    mov         edi,eax
 00040F4D    mov         eax,[000B6740]
 00040F52    mov         dword ptr [eax+4C],edi
 00040F55    test        edi,edi
>00040F57    jne         00040F7D
 00040F59    mov         eax,[000B6740]
 00040F5E    lea         edx,[eax+14]
 00040F61    mov         eax,[000B6740]
 00040F66    mov         eax,dword ptr [eax+4]
 00040F69    mov         bx,0FFDE
 00040F6D    call        @CallDynaInst
 00040F72    mov         edx,dword ptr ds:[0B6740]
 00040F78    mov         byte ptr [edx+48],al
>00040F7B    jmp         00040FA2
 00040F7D    lea         ecx,[esp+8]
 00040F81    mov         edx,esi
 00040F83    mov         eax,edi
 00040F85    call        TControl.ScreenToClient
 00040F8A    lea         edx,[esp+8]
 00040F8E    mov         eax,edi
 00040F90    mov         bx,0FFDE
 00040F94    call        @CallDynaInst
 00040F99    mov         edx,dword ptr ds:[0B6740]
 00040F9F    mov         byte ptr [edx+48],al
 00040FA2    cmp         dword ptr ds:[0B6740],0
>00040FA9    je          00040FF2
 00040FAB    mov         ebx,dword ptr ds:[0B6740]
 00040FB1    lea         edx,[ebx+50]
 00040FB4    lea         eax,[ebx+38]
 00040FB7    mov         ecx,10
 00040FBC    call        CompareMem
 00040FC1    test        al,al
>00040FC3    jne         00040FF2
 00040FC5    cmp         byte ptr [esp+4],0
>00040FCA    je          00040FD6
 00040FCC    mov         eax,[000B6740]
 00040FD1    mov         edx,dword ptr [eax]
 00040FD3    call        dword ptr [edx+30]
 00040FD6    mov         eax,[000B6740]
 00040FDB    mov         edx,dword ptr [eax]
 00040FDD    call        dword ptr [edx+2C]
 00040FE0    mov         eax,[000B6740]
 00040FE5    lea         esi,[eax+38]
 00040FE8    lea         edi,[eax+50]
 00040FEB    mov         ecx,4
 00040FF0    rep movs    dword ptr [edi],dword ptr [esi]
 00040FF2    add         esp,10
 00040FF5    pop         edi
 00040FF6    pop         esi
 00040FF7    pop         ebx
 00040FF8    ret
*}
end;

//00040FFC
procedure DragInit(ADragObject:TDragObject; Immediate:Boolean; Threshold:Integer);
begin
{*
 00040FFC    push        ebx
 00040FFD    push        esi
 00040FFE    push        edi
 00040FFF    add         esp,0FFFFFFF8
 00041002    mov         edi,ecx
 00041004    mov         ebx,edx
 00041006    mov         esi,eax
 00041008    mov         dword ptr ds:[0B6740],esi
 0004100E    mov         eax,[000B6740]
 00041013    xor         edx,edx
 00041015    mov         dword ptr [eax+4],edx
 00041018    push        0B674C
 0004101D    call        user32.GetCursorPos
 00041022    mov         eax,[000B6740]
 00041027    mov         edx,dword ptr ds:[0B674C]
 0004102D    mov         dword ptr [eax+0C],edx
 00041030    mov         edx,dword ptr ds:[0B6750]
 00041036    mov         dword ptr [eax+10],edx
 00041039    call        user32.GetCursor
 0004103E    mov         [000B6754],eax
 00041043    mov         eax,[000B6740]
 00041048    call        TDragObject.Capture
 0004104D    mov         [000B6748],eax
 00041052    mov         dword ptr ds:[0B6758],edi
 00041058    mov         eax,esi
 0004105A    mov         edx,dword ptr ds:[3E0F8];TDragDockObject
 00041060    call        @IsClass
 00041065    test        al,al
>00041067    je          000410F9
 0004106D    mov         edx,esi
 0004106F    lea         eax,[edx+38]
 00041072    mov         edi,dword ptr [eax+8]
 00041075    mov         ecx,dword ptr [eax]
 00041077    sub         edi,ecx
 00041079    test        edi,edi
>0004107B    jle         0004109D
 0004107D    mov         edi,dword ptr [edx+0C]
 00041080    sub         edi,ecx
 00041082    mov         dword ptr [esp],edi
 00041085    fild        dword ptr [esp]
 00041088    mov         ecx,dword ptr [eax+8]
 0004108B    sub         ecx,dword ptr [eax]
 0004108D    mov         dword ptr [esp+4],ecx
 00041091    fild        dword ptr [esp+4]
 00041095    fdivp       st(1),st
 00041097    fstp        qword ptr [edx+1C]
 0004109A    wait
>0004109B    jmp         000410A5
 0004109D    xor         ecx,ecx
 0004109F    mov         dword ptr [edx+1C],ecx
 000410A2    mov         dword ptr [edx+20],ecx
 000410A5    mov         ecx,dword ptr [eax+0C]
 000410A8    mov         edx,dword ptr [eax+4]
 000410AB    sub         ecx,edx
 000410AD    test        ecx,ecx
>000410AF    jle         000410D4
 000410B1    mov         ecx,esi
 000410B3    mov         edi,dword ptr [ecx+10]
 000410B6    sub         edi,edx
 000410B8    mov         dword ptr [esp],edi
 000410BB    fild        dword ptr [esp]
 000410BE    mov         edx,dword ptr [eax+0C]
 000410C1    sub         edx,dword ptr [eax+4]
 000410C4    mov         dword ptr [esp+4],edx
 000410C8    fild        dword ptr [esp+4]
 000410CC    fdivp       st(1),st
 000410CE    fstp        qword ptr [ecx+24]
 000410D1    wait
>000410D2    jmp         000410DC
 000410D4    xor         eax,eax
 000410D6    mov         dword ptr [esi+24],eax
 000410D9    mov         dword ptr [esi+28],eax
 000410DC    test        bl,bl
>000410DE    je          000410F0
 000410E0    mov         byte ptr ds:[0B675C],2
 000410E7    mov         eax,esi
 000410E9    mov         edx,dword ptr [eax]
 000410EB    call        dword ptr [edx+2C]
>000410EE    jmp         0004110D
 000410F0    mov         byte ptr ds:[0B675C],0
>000410F7    jmp         0004110D
 000410F9    test        bl,bl
>000410FB    je          00041106
 000410FD    mov         byte ptr ds:[0B675C],1
>00041104    jmp         0004110D
 00041106    mov         byte ptr ds:[0B675C],0
 0004110D    mov         eax,[000B6740]
 00041112    mov         edx,dword ptr [eax]
 00041114    call        dword ptr [edx+8]
 00041117    mov         [000B6760],eax
 0004111C    cmp         dword ptr ds:[0B6760],0
>00041123    je          00041142
 00041125    mov         eax,[000B6750]
 0004112A    push        eax
 0004112B    call        user32.GetDesktopWindow
 00041130    mov         edx,eax
 00041132    mov         ecx,dword ptr ds:[0B674C]
 00041138    mov         eax,[000B6760]
 0004113D    call        TDragImageList.BeginDrag
 00041142    mov         dl,1
 00041144    mov         eax,[0004013C];TSiteList
 00041149    call        TObject.Create
 0004114E    mov         [000B6768],eax
 00041153    cmp         byte ptr ds:[0B675C],0
>0004115A    je          00041166
 0004115C    mov         eax,0B674C
 00041161    call        DragTo
 00041166    pop         ecx
 00041167    pop         edx
 00041168    pop         edi
 00041169    pop         esi
 0004116A    pop         ebx
 0004116B    ret
*}
end;

//0004116C
procedure DragInitControl(Control:TControl; Immediate:Boolean; Threshold:Integer);
begin
{*
 0004116C    push        ebp
 0004116D    mov         ebp,esp
 0004116F    add         esp,0FFFFFFE0
 00041172    push        ebx
 00041173    push        esi
 00041174    push        edi
 00041175    mov         edi,ecx
 00041177    mov         byte ptr [ebp-1],dl
 0004117A    mov         esi,eax
 0004117C    mov         dword ptr ds:[0B673C],esi
 00041182    xor         edx,edx
 00041184    push        ebp
 00041185    push        41316
 0004118A    push        dword ptr fs:[edx]
 0004118D    mov         dword ptr fs:[edx],esp
 00041190    xor         eax,eax
 00041192    mov         dword ptr [ebp-8],eax
 00041195    mov         byte ptr ds:[0B6744],0
 0004119C    cmp         byte ptr [esi+87],0
>000411A3    jne         000411F0
 000411A5    lea         edx,[ebp-8]
 000411A8    mov         eax,esi
 000411AA    mov         bx,0FFE2
 000411AE    call        @CallDynaInst
 000411B3    cmp         dword ptr ds:[0B673C],0
>000411BA    jne         000411C9
 000411BC    xor         eax,eax
 000411BE    pop         edx
 000411BF    pop         ecx
 000411C0    pop         ecx
 000411C1    mov         dword ptr fs:[eax],edx
>000411C4    jmp         0004132C
 000411C9    cmp         dword ptr [ebp-8],0
>000411CD    jne         000412FF
 000411D3    mov         ecx,esi
 000411D5    mov         dl,1
 000411D7    mov         eax,[0003E070];TDragControlObject
 000411DC    call        TBaseDragControlObject.Create
 000411E1    mov         dword ptr [ebp-8],eax
 000411E4    mov         byte ptr ds:[0B6744],1
>000411EB    jmp         000412FF
 000411F0    lea         edx,[ebp-8]
 000411F3    mov         eax,esi
 000411F5    mov         bx,0FFE6
 000411F9    call        @CallDynaInst
 000411FE    cmp         dword ptr ds:[0B673C],0
>00041205    jne         00041214
 00041207    xor         eax,eax
 00041209    pop         edx
 0004120A    pop         ecx
 0004120B    pop         ecx
 0004120C    mov         dword ptr fs:[eax],edx
>0004120F    jmp         0004132C
 00041214    cmp         dword ptr [ebp-8],0
>00041218    jne         00041232
 0004121A    mov         ecx,esi
 0004121C    mov         dl,1
 0004121E    mov         eax,[0003E0F8];TDragDockObject
 00041223    call        TDragDockObject.Create
 00041228    mov         dword ptr [ebp-8],eax
 0004122B    mov         byte ptr ds:[0B6744],1
 00041232    mov         eax,dword ptr [ebp-8]
 00041235    mov         ebx,dword ptr [eax+30]
 00041238    mov         eax,ebx
 0004123A    mov         edx,dword ptr ds:[3F0BC];TWinControl
 00041240    call        @IsClass
 00041245    test        al,al
>00041247    je          00041262
 00041249    mov         eax,dword ptr [ebp-8]
 0004124C    add         eax,38
 0004124F    push        eax
 00041250    mov         eax,ebx
 00041252    call        TWinControl.GetHandle
 00041257    push        eax
 00041258    call        user32.GetWindowRect
>0004125D    jmp         000412ED
 00041262    mov         eax,dword ptr [ebp-8]
 00041265    mov         ebx,dword ptr [eax+30]
 00041268    cmp         dword ptr [ebx+24],0
>0004126C    jne         00041299
 0004126E    mov         eax,ebx
 00041270    mov         edx,dword ptr ds:[3F0BC];TWinControl
 00041276    call        @IsClass
 0004127B    test        al,al
>0004127D    jne         00041299
 0004127F    lea         eax,[ebp-10]
 00041282    push        eax
 00041283    call        user32.GetCursorPos
 00041288    mov         eax,dword ptr [ebp-8]
 0004128B    mov         edx,dword ptr [ebp-10]
 0004128E    mov         dword ptr [eax+38],edx
 00041291    mov         edx,dword ptr [ebp-0C]
 00041294    mov         dword ptr [eax+3C],edx
>00041297    jmp         000412C1
 00041299    lea         ecx,[ebp-20]
 0004129C    xor         edx,edx
 0004129E    xor         eax,eax
 000412A0    call        Point
 000412A5    lea         edx,[ebp-20]
 000412A8    lea         ecx,[ebp-18]
 000412AB    mov         eax,ebx
 000412AD    call        TControl.ClientToScreen
 000412B2    mov         eax,dword ptr [ebp-8]
 000412B5    mov         edx,dword ptr [ebp-18]
 000412B8    mov         dword ptr [eax+38],edx
 000412BB    mov         edx,dword ptr [ebp-14]
 000412BE    mov         dword ptr [eax+3C],edx
 000412C1    mov         ebx,dword ptr [ebp-8]
 000412C4    mov         edx,dword ptr [ebx+3C]
 000412C7    mov         eax,dword ptr [ebp-8]
 000412CA    mov         esi,dword ptr [eax+30]
 000412CD    add         edx,dword ptr [esi+3C]
 000412D0    mov         eax,dword ptr [ebx+38]
 000412D3    add         eax,dword ptr [esi+38]
 000412D6    lea         ecx,[ebp-18]
 000412D9    call        Point
 000412DE    mov         eax,dword ptr [ebp-8]
 000412E1    mov         edx,dword ptr [ebp-18]
 000412E4    mov         dword ptr [eax+40],edx
 000412E7    mov         edx,dword ptr [ebp-14]
 000412EA    mov         dword ptr [eax+44],edx
 000412ED    mov         eax,dword ptr [ebp-8]
 000412F0    push        edi
 000412F1    lea         esi,[eax+38]
 000412F4    lea         edi,[eax+50]
 000412F7    mov         ecx,4
 000412FC    rep movs    dword ptr [edi],dword ptr [esi]
 000412FE    pop         edi
 000412FF    mov         ecx,edi
 00041301    mov         dl,byte ptr [ebp-1]
 00041304    mov         eax,dword ptr [ebp-8]
 00041307    call        DragInit
 0004130C    xor         eax,eax
 0004130E    pop         edx
 0004130F    pop         ecx
 00041310    pop         ecx
 00041311    mov         dword ptr fs:[eax],edx
>00041314    jmp         0004132C
>00041316    jmp         @HandleAnyException
 0004131B    xor         eax,eax
 0004131D    mov         [000B673C],eax
 00041322    call        @RaiseAgain
 00041327    call        @DoneExcept
 0004132C    pop         edi
 0004132D    pop         esi
 0004132E    pop         ebx
 0004132F    mov         esp,ebp
 00041331    pop         ebp
 00041332    ret
*}
end;

//00041334
function CheckUndock:Boolean;
begin
{*
 00041334    push        ebp
 00041335    mov         ebp,esp
 00041337    push        ebx
 00041338    mov         eax,[000B6740]
 0004133D    cmp         dword ptr [eax+4],0
 00041341    setne       bl
 00041344    mov         eax,dword ptr [ebp+8]
 00041347    cmp         byte ptr [eax-1],0
>0004134B    je          0004139F
 0004134D    cmp         byte ptr ds:[0B675C],2
>00041354    jne         0004139F
 00041356    mov         eax,[000B673C]
 0004135B    mov         edx,dword ptr [eax]
 0004135D    call        dword ptr [edx+54]
 00041360    test        al,al
>00041362    jne         00041372
 00041364    mov         eax,[000B673C]
 00041369    cmp         dword ptr [eax+8C],0
>00041370    jne         00041376
 00041372    mov         bl,1
>00041374    jmp         0004139F
 00041376    mov         eax,[000B673C]
 0004137B    mov         eax,dword ptr [eax+8C]
 00041381    test        eax,eax
>00041383    je          0004139F
 00041385    mov         edx,dword ptr ds:[0B6740]
 0004138B    mov         edx,dword ptr [edx+4]
 0004138E    mov         ecx,dword ptr ds:[0B673C]
 00041394    mov         bx,0FFC3
 00041398    call        @CallDynaInst
 0004139D    mov         ebx,eax
 0004139F    mov         eax,ebx
 000413A1    pop         ebx
 000413A2    pop         ebp
 000413A3    ret
*}
end;

//000413A4
procedure DragDone(Drop:Boolean);
begin
{*
 000413A4    push        ebp
 000413A5    mov         ebp,esp
 000413A7    add         esp,0FFFFFFEC
 000413AA    push        ebx
 000413AB    mov         byte ptr [ebp-1],al
 000413AE    xor         ebx,ebx
 000413B0    xor         eax,eax
 000413B2    mov         dword ptr [ebp-8],eax
 000413B5    mov         byte ptr [ebp-9],0
 000413B9    cmp         dword ptr ds:[0B6740],0
>000413C0    je          000415FE
 000413C6    mov         eax,[000B6740]
 000413CB    cmp         byte ptr [eax+2C],0
>000413CF    jne         000415FE
 000413D5    xor         edx,edx
 000413D7    push        ebp
 000413D8    push        415F7
 000413DD    push        dword ptr fs:[edx]
 000413E0    mov         dword ptr fs:[edx],esp
 000413E3    mov         eax,[000B6740]
 000413E8    mov         dword ptr [ebp-8],eax
 000413EB    xor         edx,edx
 000413ED    push        ebp
 000413EE    push        415CA
 000413F3    push        dword ptr fs:[edx]
 000413F6    mov         dword ptr fs:[edx],esp
 000413F9    mov         eax,[000B6740]
 000413FE    mov         byte ptr [eax+2C],1
 00041402    mov         edx,dword ptr ds:[0B6748]
 00041408    mov         eax,[000B6740]
 0004140D    call        TDragObject.ReleaseCapture
 00041412    cmp         byte ptr ds:[0B675C],2
>00041419    jne         0004143E
 0004141B    mov         eax,[000B6740]
 00041420    mov         edx,dword ptr ds:[3E0F8];TDragDockObject
 00041426    call        @AsClass
 0004142B    mov         ebx,eax
 0004142D    mov         eax,ebx
 0004142F    mov         edx,dword ptr [eax]
 00041431    call        dword ptr [edx+30]
 00041434    cmp         dword ptr [ebx+4],0
 00041438    sete        al
 0004143B    mov         byte ptr [ebx+60],al
 0004143E    mov         eax,[000B6740]
 00041443    cmp         dword ptr [eax+4],0
>00041447    je          00041473
 00041449    mov         eax,[000B6740]
 0004144E    mov         eax,dword ptr [eax+4]
 00041451    mov         edx,dword ptr ds:[3EB50];TControl
 00041457    call        @IsClass
 0004145C    test        al,al
>0004145E    je          00041473
 00041460    mov         eax,[000B6740]
 00041465    mov         edx,dword ptr [eax+14]
 00041468    mov         dword ptr [ebp-14],edx
 0004146B    mov         edx,dword ptr [eax+18]
 0004146E    mov         dword ptr [ebp-10],edx
>00041471    jmp         00041484
 00041473    mov         eax,[000B6740]
 00041478    mov         edx,dword ptr [eax+0C]
 0004147B    mov         dword ptr [ebp-14],edx
 0004147E    mov         edx,dword ptr [eax+10]
 00041481    mov         dword ptr [ebp-10],edx
 00041484    push        ebp
 00041485    call        CheckUndock
 0004148A    pop         ecx
 0004148B    test        al,al
>0004148D    je          000414B8
 0004148F    cmp         byte ptr ds:[0B675C],2
>00041496    jne         0004149E
 00041498    cmp         byte ptr [ebx+60],0
>0004149C    jne         000414B2
 0004149E    cmp         byte ptr ds:[0B675C],0
>000414A5    je          000414B8
 000414A7    mov         al,1
 000414A9    call        DoDragOver
 000414AE    test        al,al
>000414B0    je          000414B8
 000414B2    cmp         byte ptr [ebp-1],0
>000414B6    jne         000414BC
 000414B8    xor         eax,eax
>000414BA    jmp         000414BE
 000414BC    mov         al,1
 000414BE    mov         byte ptr [ebp-9],al
 000414C1    cmp         byte ptr ds:[0B675C],2
>000414C8    jne         0004150D
 000414CA    cmp         byte ptr [ebp-9],0
>000414CE    je          0004152D
 000414D0    cmp         byte ptr [ebx+60],0
>000414D4    je          0004152D
 000414D6    mov         eax,dword ptr [ebx+30]
 000414D9    call        GetParentForm
 000414DE    test        eax,eax
>000414E0    je          000414F4
 000414E2    mov         edx,dword ptr [eax+200]
 000414E8    cmp         edx,dword ptr [ebx+30]
>000414EB    jne         000414F4
 000414ED    xor         edx,edx
 000414EF    call        TCustomForm.SetActiveControl
 000414F4    mov         eax,[000B6740]
 000414F9    push        eax
 000414FA    xor         ecx,ecx
 000414FC    mov         edx,0B03A
 00041501    mov         eax,[000B673C]
 00041506    call        TControl.Perform
>0004150B    jmp         0004152D
 0004150D    cmp         dword ptr ds:[0B6760],0
>00041514    je          00041522
 00041516    mov         eax,[000B6760]
 0004151B    call        TDragImageList.EndDrag
>00041520    jmp         0004152D
 00041522    mov         eax,[000B6754]
 00041527    push        eax
 00041528    call        user32.SetCursor
 0004152D    xor         eax,eax
 0004152F    mov         [000B673C],eax
 00041534    xor         eax,eax
 00041536    mov         [000B6740],eax
 0004153B    mov         eax,dword ptr [ebp-8]
 0004153E    cmp         dword ptr [eax+4],0
>00041542    je          00041585
 00041544    mov         al,3
 00041546    cmp         byte ptr [ebp-9],0
>0004154A    jne         00041568
 0004154C    mov         al,4
 0004154E    mov         edx,dword ptr [ebp-8]
 00041551    xor         ecx,ecx
 00041553    mov         dword ptr [edx+0C],ecx
 00041556    mov         edx,dword ptr [ebp-8]
 00041559    xor         ecx,ecx
 0004155B    mov         dword ptr [edx+10],ecx
 0004155E    xor         edx,edx
 00041560    mov         dword ptr [ebp-14],edx
 00041563    xor         edx,edx
 00041565    mov         dword ptr [ebp-10],edx
 00041568    mov         edx,dword ptr [ebp-8]
 0004156B    mov         edx,dword ptr [edx+4]
 0004156E    push        edx
 0004156F    mov         edx,dword ptr [ebp-8]
 00041572    add         edx,0C
 00041575    push        edx
 00041576    mov         edx,dword ptr [ebp-8]
 00041579    mov         edx,dword ptr [edx+8]
 0004157C    mov         ecx,dword ptr [ebp-8]
 0004157F    xchg        eax,edx
 00041580    call        DragMessage
 00041585    xor         eax,eax
 00041587    pop         edx
 00041588    pop         ecx
 00041589    pop         ecx
 0004158A    mov         dword ptr fs:[eax],edx
 0004158D    push        415D1
 00041592    mov         eax,[000B6768]
 00041597    call        TObject.Free
 0004159C    xor         eax,eax
 0004159E    mov         [000B6768],eax
 000415A3    mov         eax,dword ptr [ebp-8]
 000415A6    mov         byte ptr [eax+2C],0
 000415AA    mov         eax,dword ptr [ebp-10]
 000415AD    push        eax
 000415AE    mov         al,byte ptr [ebp-9]
 000415B1    push        eax
 000415B2    mov         eax,dword ptr [ebp-8]
 000415B5    mov         edx,dword ptr [eax+4]
 000415B8    mov         ecx,dword ptr [ebp-14]
 000415BB    mov         eax,dword ptr [ebp-8]
 000415BE    mov         ebx,dword ptr [eax]
 000415C0    call        dword ptr [ebx]
 000415C2    xor         eax,eax
 000415C4    mov         [000B6740],eax
 000415C9    ret
>000415CA    jmp         @HandleFinally
>000415CF    jmp         00041592
 000415D1    xor         eax,eax
 000415D3    pop         edx
 000415D4    pop         ecx
 000415D5    pop         ecx
 000415D6    mov         dword ptr fs:[eax],edx
 000415D9    push        415FE
 000415DE    xor         eax,eax
 000415E0    mov         [000B673C],eax
 000415E5    cmp         byte ptr ds:[0B6744],0
>000415EC    je          000415F6
 000415EE    mov         eax,dword ptr [ebp-8]
 000415F1    call        TObject.Free
 000415F6    ret
>000415F7    jmp         @HandleFinally
>000415FC    jmp         000415DE
 000415FE    pop         ebx
 000415FF    mov         esp,ebp
 00041601    pop         ebp
 00041602    ret
*}
end;

//00041604
procedure CancelDrag;
begin
{*
 00041604    cmp         dword ptr ds:[0B6740],0
>0004160B    je          00041614
 0004160D    xor         eax,eax
 0004160F    call        DragDone
 00041614    xor         eax,eax
 00041616    mov         [000B673C],eax
 0004161B    ret
*}
end;

//0004161C
function FindVCLWindow(const Pos:TPoint):TWinControl;
begin
{*
 0004161C    push        ebx
 0004161D    push        esi
 0004161E    push        dword ptr [eax+4]
 00041621    push        dword ptr [eax]
 00041623    call        user32.WindowFromPoint
 00041628    mov         ebx,eax
 0004162A    xor         esi,esi
 0004162C    test        ebx,ebx
>0004162E    je          00041649
 00041630    mov         eax,ebx
 00041632    call        FindControl
 00041637    mov         esi,eax
 00041639    test        esi,esi
>0004163B    jne         00041649
 0004163D    push        ebx
 0004163E    call        user32.GetParent
 00041643    mov         ebx,eax
 00041645    test        ebx,ebx
>00041647    jne         00041630
 00041649    mov         eax,esi
 0004164B    pop         esi
 0004164C    pop         ebx
 0004164D    ret
*}
end;

//00041650
function FindDragTarget(const Pos:TPoint; AllowDisabled:Boolean):TControl;
begin
{*
 00041650    push        ebx
 00041651    push        esi
 00041652    push        edi
 00041653    push        ebp
 00041654    add         esp,0FFFFFFF8
 00041657    mov         ebx,edx
 00041659    mov         edi,eax
 0004165B    xor         esi,esi
 0004165D    mov         eax,edi
 0004165F    call        FindVCLWindow
 00041664    mov         ebp,eax
 00041666    test        ebp,ebp
>00041668    je          00041688
 0004166A    mov         esi,ebp
 0004166C    mov         ecx,esp
 0004166E    mov         edx,edi
 00041670    mov         eax,ebp
 00041672    call        TControl.ScreenToClient
 00041677    mov         edx,esp
 00041679    mov         ecx,ebx
 0004167B    mov         eax,ebp
 0004167D    call        TWinControl.ControlAtPos
 00041682    test        eax,eax
>00041684    je          00041688
 00041686    mov         esi,eax
 00041688    mov         eax,esi
 0004168A    pop         ecx
 0004168B    pop         edx
 0004168C    pop         ebp
 0004168D    pop         edi
 0004168E    pop         esi
 0004168F    pop         ebx
 00041690    ret
*}
end;

//00041694
procedure ListAdd(var List:TList; Item:Pointer);
begin
{*
 00041694    push        ebx
 00041695    push        esi
 00041696    mov         esi,edx
 00041698    mov         ebx,eax
 0004169A    cmp         dword ptr [ebx],0
>0004169D    jne         000416AD
 0004169F    mov         dl,1
 000416A1    mov         eax,[0001EEC4];TList
 000416A6    call        TObject.Create
 000416AB    mov         dword ptr [ebx],eax
 000416AD    mov         eax,dword ptr [ebx]
 000416AF    mov         edx,esi
 000416B1    call        TList.Add
 000416B6    pop         esi
 000416B7    pop         ebx
 000416B8    ret
*}
end;

//000416BC
procedure ListRemove(var List:TList; Item:Pointer);
begin
{*
 000416BC    push        ebx
 000416BD    mov         ebx,eax
 000416BF    mov         eax,dword ptr [ebx]
 000416C1    call        TList.Remove
 000416C6    mov         eax,dword ptr [ebx]
 000416C8    cmp         dword ptr [eax+8],0
>000416CC    jne         000416D9
 000416CE    mov         eax,dword ptr [ebx]
 000416D0    call        TObject.Free
 000416D5    xor         eax,eax
 000416D7    mov         dword ptr [ebx],eax
 000416D9    pop         ebx
 000416DA    ret
*}
end;

//000416DC
procedure MoveWindowOrg(DC:HDC; DX:Integer; DY:Integer);
begin
{*
 000416DC    push        ebx
 000416DD    push        esi
 000416DE    push        edi
 000416DF    add         esp,0FFFFFFF8
 000416E2    mov         edi,ecx
 000416E4    mov         esi,edx
 000416E6    mov         ebx,eax
 000416E8    push        esp
 000416E9    push        ebx
 000416EA    call        gdi32.GetWindowOrgEx
 000416EF    push        0
 000416F1    mov         eax,dword ptr [esp+8]
 000416F5    sub         eax,edi
 000416F7    push        eax
 000416F8    mov         eax,dword ptr [esp+8]
 000416FC    sub         eax,esi
 000416FE    push        eax
 000416FF    push        ebx
 00041700    call        gdi32.SetWindowOrgEx
 00041705    pop         ecx
 00041706    pop         edx
 00041707    pop         edi
 00041708    pop         esi
 00041709    pop         ebx
 0004170A    ret
*}
end;

//0004170C
procedure FreeDeviceContext;
begin
{*
 0004170C    push        ebp
 0004170D    mov         ebp,esp
 0004170F    add         esp,0FFFFFFF0
 00041712    mov         eax,[000B676C]
 00041717    call        TThreadList.LockList
 0004171C    mov         dword ptr [ebp-8],eax
 0004171F    xor         eax,eax
 00041721    push        ebp
 00041722    push        417BC
 00041727    push        dword ptr fs:[eax]
 0004172A    mov         dword ptr fs:[eax],esp
 0004172D    mov         eax,dword ptr [ebp-8]
 00041730    mov         eax,dword ptr [eax+8]
 00041733    dec         eax
 00041734    test        eax,eax
>00041736    jl          000417A4
 00041738    inc         eax
 00041739    mov         dword ptr [ebp-0C],eax
 0004173C    mov         dword ptr [ebp-4],0
 00041743    mov         edx,dword ptr [ebp-4]
 00041746    mov         eax,dword ptr [ebp-8]
 00041749    call        TList.Get
 0004174E    mov         dword ptr [ebp-10],eax
 00041751    mov         eax,dword ptr [ebp-10]
 00041754    call        TCanvas.TryLock
 00041759    test        al,al
>0004175B    je          0004179C
 0004175D    xor         eax,eax
 0004175F    push        ebp
 00041760    push        41795
 00041765    push        dword ptr fs:[eax]
 00041768    mov         dword ptr fs:[eax],esp
 0004176B    mov         eax,dword ptr [ebp-10]
 0004176E    call        TControlCanvas.FreeHandle
 00041773    call        @TryFinallyExit
 00041778    call        @TryFinallyExit
>0004177D    jmp         000417C3
 0004177F    xor         eax,eax
 00041781    pop         edx
 00041782    pop         ecx
 00041783    pop         ecx
 00041784    mov         dword ptr fs:[eax],edx
 00041787    push        4179C
 0004178C    mov         eax,dword ptr [ebp-10]
 0004178F    call        TCanvas.Unlock
 00041794    ret
>00041795    jmp         @HandleFinally
>0004179A    jmp         0004178C
 0004179C    inc         dword ptr [ebp-4]
 0004179F    dec         dword ptr [ebp-0C]
>000417A2    jne         00041743
 000417A4    xor         eax,eax
 000417A6    pop         edx
 000417A7    pop         ecx
 000417A8    pop         ecx
 000417A9    mov         dword ptr fs:[eax],edx
 000417AC    push        417C3
 000417B1    mov         eax,[000B676C]
 000417B6    call        TThreadList.UnlockList
 000417BB    ret
>000417BC    jmp         @HandleFinally
>000417C1    jmp         000417B1
 000417C3    mov         esp,ebp
 000417C5    pop         ebp
 000417C6    ret
*}
end;

//000417C8
procedure FreeDeviceContexts;
begin
{*
 000417C8    push        ebp
 000417C9    mov         ebp,esp
 000417CB    add         esp,0FFFFFFF4
 000417CE    mov         eax,[000B676C]
 000417D3    call        TThreadList.LockList
 000417D8    mov         dword ptr [ebp-8],eax
 000417DB    xor         eax,eax
 000417DD    push        ebp
 000417DE    push        41866
 000417E3    push        dword ptr fs:[eax]
 000417E6    mov         dword ptr fs:[eax],esp
 000417E9    mov         eax,dword ptr [ebp-8]
 000417EC    mov         eax,dword ptr [eax+8]
 000417EF    dec         eax
 000417F0    cmp         eax,0
>000417F3    jl          0004184E
 000417F5    mov         dword ptr [ebp-4],eax
 000417F8    mov         edx,dword ptr [ebp-4]
 000417FB    mov         eax,dword ptr [ebp-8]
 000417FE    call        TList.Get
 00041803    mov         dword ptr [ebp-0C],eax
 00041806    mov         eax,dword ptr [ebp-0C]
 00041809    call        TCanvas.TryLock
 0004180E    test        al,al
>00041810    je          00041845
 00041812    xor         eax,eax
 00041814    push        ebp
 00041815    push        4183E
 0004181A    push        dword ptr fs:[eax]
 0004181D    mov         dword ptr fs:[eax],esp
 00041820    mov         eax,dword ptr [ebp-0C]
 00041823    call        TControlCanvas.FreeHandle
 00041828    xor         eax,eax
 0004182A    pop         edx
 0004182B    pop         ecx
 0004182C    pop         ecx
 0004182D    mov         dword ptr fs:[eax],edx
 00041830    push        41845
 00041835    mov         eax,dword ptr [ebp-0C]
 00041838    call        TCanvas.Unlock
 0004183D    ret
>0004183E    jmp         @HandleFinally
>00041843    jmp         00041835
 00041845    dec         dword ptr [ebp-4]
 00041848    cmp         dword ptr [ebp-4],0FFFFFFFF
>0004184C    jne         000417F8
 0004184E    xor         eax,eax
 00041850    pop         edx
 00041851    pop         ecx
 00041852    pop         ecx
 00041853    mov         dword ptr fs:[eax],edx
 00041856    push        4186D
 0004185B    mov         eax,[000B676C]
 00041860    call        TThreadList.UnlockList
 00041865    ret
>00041866    jmp         @HandleFinally
>0004186B    jmp         0004185B
 0004186D    mov         esp,ebp
 0004186F    pop         ebp
 00041870    ret
*}
end;

//00041874
destructor TControlCanvas.Destroy;
begin
{*
 00041874    push        ebx
 00041875    push        esi
 00041876    call        @BeforeDestruction
 0004187B    mov         ebx,edx
 0004187D    mov         esi,eax
 0004187F    mov         eax,esi
 00041881    call        TControlCanvas.FreeHandle
 00041886    mov         edx,ebx
 00041888    and         dl,0FC
 0004188B    mov         eax,esi
 0004188D    call        TCanvas.Destroy
 00041892    test        bl,bl
>00041894    jle         0004189D
 00041896    mov         eax,esi
 00041898    call        @ClassDestroy
 0004189D    pop         esi
 0004189E    pop         ebx
 0004189F    ret
*}
end;

//000418A0
procedure TControlCanvas.CreateHandle;
begin
{*
 000418A0    push        ebp
 000418A1    mov         ebp,esp
 000418A3    push        ecx
 000418A4    push        ebx
 000418A5    mov         dword ptr [ebp-4],eax
 000418A8    mov         eax,dword ptr [ebp-4]
 000418AB    cmp         dword ptr [eax+54],0
>000418AF    jne         000418BE
 000418B1    mov         eax,dword ptr [ebp-4]
 000418B4    call        TCanvas.CreateHandle
>000418B9    jmp         00041942
 000418BE    mov         eax,dword ptr [ebp-4]
 000418C1    cmp         dword ptr [eax+58],0
>000418C5    jne         0004192C
 000418C7    mov         eax,[000B676C]
 000418CC    call        TThreadList.LockList
 000418D1    mov         ebx,eax
 000418D3    xor         eax,eax
 000418D5    push        ebp
 000418D6    push        41925
 000418DB    push        dword ptr fs:[eax]
 000418DE    mov         dword ptr fs:[eax],esp
 000418E1    cmp         dword ptr [ebx+8],4
>000418E5    jl          000418EC
 000418E7    call        FreeDeviceContext
 000418EC    mov         eax,dword ptr [ebp-4]
 000418EF    lea         edx,[eax+5C]
 000418F2    mov         eax,dword ptr [ebp-4]
 000418F5    mov         eax,dword ptr [eax+54]
 000418F8    mov         ecx,dword ptr [eax]
 000418FA    call        dword ptr [ecx+48]
 000418FD    mov         edx,dword ptr [ebp-4]
 00041900    mov         dword ptr [edx+58],eax
 00041903    mov         edx,dword ptr [ebp-4]
 00041906    mov         eax,ebx
 00041908    call        TList.Add
 0004190D    xor         eax,eax
 0004190F    pop         edx
 00041910    pop         ecx
 00041911    pop         ecx
 00041912    mov         dword ptr fs:[eax],edx
 00041915    push        4192C
 0004191A    mov         eax,[000B676C]
 0004191F    call        TThreadList.UnlockList
 00041924    ret
>00041925    jmp         @HandleFinally
>0004192A    jmp         0004191A
 0004192C    mov         eax,dword ptr [ebp-4]
 0004192F    mov         edx,dword ptr [eax+58]
 00041932    mov         eax,dword ptr [ebp-4]
 00041935    call        TCanvas.SetHandle
 0004193A    mov         eax,dword ptr [ebp-4]
 0004193D    call        TControlCanvas.UpdateTextFlags
 00041942    pop         ebx
 00041943    pop         ecx
 00041944    pop         ebp
 00041945    ret
*}
end;

//00041948
procedure TControlCanvas.FreeHandle;
begin
{*
 00041948    push        ebx
 00041949    mov         ebx,eax
 0004194B    cmp         dword ptr [ebx+58],0
>0004194F    je          00041978
 00041951    xor         edx,edx
 00041953    mov         eax,ebx
 00041955    call        TCanvas.SetHandle
 0004195A    mov         edx,ebx
 0004195C    mov         eax,[000B676C]
 00041961    call        TThreadList.Remove
 00041966    mov         eax,dword ptr [ebx+58]
 00041969    push        eax
 0004196A    mov         eax,dword ptr [ebx+5C]
 0004196D    push        eax
 0004196E    call        user32.ReleaseDC
 00041973    xor         eax,eax
 00041975    mov         dword ptr [ebx+58],eax
 00041978    pop         ebx
 00041979    ret
*}
end;

//0004197C
procedure TControlCanvas.SetControl(AControl:TControl);
begin
{*
 0004197C    push        ebx
 0004197D    push        esi
 0004197E    mov         esi,edx
 00041980    mov         ebx,eax
 00041982    cmp         esi,dword ptr [ebx+54]
>00041985    je          00041991
 00041987    mov         eax,ebx
 00041989    call        TControlCanvas.FreeHandle
 0004198E    mov         dword ptr [ebx+54],esi
 00041991    pop         esi
 00041992    pop         ebx
 00041993    ret
*}
end;

//00041994
procedure TControlCanvas.UpdateTextFlags;
begin
{*
 00041994    push        ebx
 00041995    mov         ebx,eax
 00041997    cmp         dword ptr [ebx+54],0
>0004199B    je          000419C4
 0004199D    mov         eax,[000B5C08];SysLocale:TSysLocale
 000419A2    cmp         byte ptr [eax+9],0
>000419A6    je          000419BD
 000419A8    mov         eax,dword ptr [ebx+54]
 000419AB    call        TControl.UseRightToLeftReading
 000419B0    test        al,al
>000419B2    je          000419BD
 000419B4    or          dword ptr [ebx+50],80
>000419BB    jmp         000419C4
 000419BD    and         dword ptr [ebx+50],0FFFFFF7F
 000419C4    pop         ebx
 000419C5    ret
*}
end;

//000419C8
constructor TSizeConstraints.Create(Control:TControl);
begin
{*
 000419C8    push        ebx
 000419C9    push        esi
 000419CA    push        edi
 000419CB    test        dl,dl
>000419CD    je          000419D7
 000419CF    add         esp,0FFFFFFF0
 000419D2    call        @ClassCreate
 000419D7    mov         esi,ecx
 000419D9    mov         ebx,edx
 000419DB    mov         edi,eax
 000419DD    xor         edx,edx
 000419DF    mov         eax,edi
 000419E1    call        TObject.Create
 000419E6    mov         dword ptr [edi+4],esi
 000419E9    mov         eax,edi
 000419EB    test        bl,bl
>000419ED    je          000419FE
 000419EF    call        @AfterConstruction
 000419F4    pop         dword ptr fs:[0]
 000419FB    add         esp,0C
 000419FE    mov         eax,edi
 00041A00    pop         edi
 00041A01    pop         esi
 00041A02    pop         ebx
 00041A03    ret
*}
end;

//00041A04
procedure TSizeConstraints.AssignTo(Dest:TPersistent);
begin
{*
 00041A04    push        ebx
 00041A05    push        esi
 00041A06    mov         ebx,edx
 00041A08    mov         esi,eax
 00041A0A    mov         eax,ebx
 00041A0C    mov         edx,dword ptr ds:[3E41C];TSizeConstraints
 00041A12    call        @IsClass
 00041A17    test        al,al
>00041A19    je          00041A41
 00041A1B    mov         eax,ebx
 00041A1D    mov         edx,dword ptr [esi+8]
 00041A20    mov         dword ptr [eax+8],edx
 00041A23    mov         edx,dword ptr [esi+0C]
 00041A26    mov         dword ptr [eax+0C],edx
 00041A29    mov         edx,dword ptr [esi+10]
 00041A2C    mov         dword ptr [eax+10],edx
 00041A2F    mov         edx,dword ptr [esi+8]
 00041A32    mov         dword ptr [eax+8],edx
 00041A35    mov         bx,0FFFD
 00041A39    call        @CallDynaInst
 00041A3E    pop         esi
 00041A3F    pop         ebx
 00041A40    ret
 00041A41    mov         edx,ebx
 00041A43    mov         eax,esi
 00041A45    call        TPersistent.AssignTo
 00041A4A    pop         esi
 00041A4B    pop         ebx
 00041A4C    ret
*}
end;

//00041A50
procedure TSizeConstraints.SetConstraints(Index:Integer; Value:TConstraintSize);
begin
{*
 00041A50    push        ebx
 00041A51    push        esi
 00041A52    mov         esi,eax
 00041A54    sub         edx,1
>00041A57    jb          00041A66
>00041A59    je          00041A8C
 00041A5B    dec         edx
>00041A5C    je          00041AAE
 00041A5E    dec         edx
>00041A5F    je          00041AD2
>00041A61    jmp         00041AF3
 00041A66    cmp         ecx,dword ptr [esi+8]
>00041A69    je          00041AF3
 00041A6F    mov         dword ptr [esi+8],ecx
 00041A72    test        ecx,ecx
>00041A74    jbe         00041A7E
 00041A76    cmp         ecx,dword ptr [esi+10]
>00041A79    jae         00041A7E
 00041A7B    mov         dword ptr [esi+10],ecx
 00041A7E    mov         eax,esi
 00041A80    mov         bx,0FFFD
 00041A84    call        @CallDynaInst
 00041A89    pop         esi
 00041A8A    pop         ebx
 00041A8B    ret
 00041A8C    cmp         ecx,dword ptr [esi+0C]
>00041A8F    je          00041AF3
 00041A91    mov         dword ptr [esi+0C],ecx
 00041A94    test        ecx,ecx
>00041A96    jbe         00041AA0
 00041A98    cmp         ecx,dword ptr [esi+14]
>00041A9B    jae         00041AA0
 00041A9D    mov         dword ptr [esi+14],ecx
 00041AA0    mov         eax,esi
 00041AA2    mov         bx,0FFFD
 00041AA6    call        @CallDynaInst
 00041AAB    pop         esi
 00041AAC    pop         ebx
 00041AAD    ret
 00041AAE    cmp         ecx,dword ptr [esi+10]
>00041AB1    je          00041AF3
 00041AB3    mov         dword ptr [esi+10],ecx
 00041AB6    mov         eax,dword ptr [esi+8]
 00041AB9    test        eax,eax
>00041ABB    jbe         00041AC4
 00041ABD    cmp         eax,ecx
>00041ABF    jae         00041AC4
 00041AC1    mov         dword ptr [esi+8],ecx
 00041AC4    mov         eax,esi
 00041AC6    mov         bx,0FFFD
 00041ACA    call        @CallDynaInst
 00041ACF    pop         esi
 00041AD0    pop         ebx
 00041AD1    ret
 00041AD2    cmp         ecx,dword ptr [esi+14]
>00041AD5    je          00041AF3
 00041AD7    mov         dword ptr [esi+14],ecx
 00041ADA    mov         eax,dword ptr [esi+0C]
 00041ADD    test        eax,eax
>00041ADF    jbe         00041AE8
 00041AE1    cmp         eax,ecx
>00041AE3    jae         00041AE8
 00041AE5    mov         dword ptr [esi+0C],ecx
 00041AE8    mov         eax,esi
 00041AEA    mov         bx,0FFFD
 00041AEE    call        @CallDynaInst
 00041AF3    pop         esi
 00041AF4    pop         ebx
 00041AF5    ret
*}
end;

//00041AF8
procedure TSizeConstraints.Change;
begin
{*
 00041AF8    push        ebx
 00041AF9    cmp         word ptr [eax+1A],0
>00041AFE    je          00041B0A
 00041B00    mov         ebx,eax
 00041B02    mov         edx,eax
 00041B04    mov         eax,dword ptr [ebx+1C]
 00041B07    call        dword ptr [ebx+18]
 00041B0A    pop         ebx
 00041B0B    ret
*}
end;

//00041B0C
procedure TControlActionLink.AssignClient(AClient:TObject);
begin
{*
 00041B0C    push        ebx
 00041B0D    push        esi
 00041B0E    mov         esi,edx
 00041B10    mov         ebx,eax
 00041B12    mov         eax,esi
 00041B14    mov         edx,dword ptr ds:[3EB50];TControl
 00041B1A    call        @AsClass
 00041B1F    mov         dword ptr [ebx+10],eax
 00041B22    pop         esi
 00041B23    pop         ebx
 00041B24    ret
*}
end;

//00041B28
function TControlActionLink.DoShowHint(var HintStr:AnsiString):Boolean;
begin
{*
 00041B28    push        ebp
 00041B29    mov         ebp,esp
 00041B2B    add         esp,0FFFFFFE8
 00041B2E    push        ebx
 00041B2F    push        esi
 00041B30    push        edi
 00041B31    xor         ecx,ecx
 00041B33    mov         dword ptr [ebp-4],ecx
 00041B36    mov         dword ptr [ebp-18],ecx
 00041B39    mov         esi,edx
 00041B3B    mov         edi,eax
 00041B3D    xor         eax,eax
 00041B3F    push        ebp
 00041B40    push        41BE9
 00041B45    push        dword ptr fs:[eax]
 00041B48    mov         dword ptr fs:[eax],esp
 00041B4B    mov         bl,1
 00041B4D    mov         eax,dword ptr [edi+0C]
 00041B50    mov         edx,dword ptr ds:[4D3E8];TCustomAction
 00041B56    call        @IsClass
 00041B5B    test        al,al
>00041B5D    je          00041BCB
 00041B5F    mov         edx,esi
 00041B61    mov         eax,dword ptr [edi+0C]
 00041B64    call        TCustomAction.DoHint
 00041B69    test        al,al
>00041B6B    je          00041BCB
 00041B6D    mov         eax,[000B59E8];^Application:TApplication
 00041B72    mov         eax,dword ptr [eax]
 00041B74    cmp         byte ptr [eax+64],0
>00041B78    je          00041BCB
 00041B7A    mov         eax,dword ptr [edi+0C]
 00041B7D    cmp         word ptr [eax+60],0
>00041B82    je          00041BCB
 00041B84    cmp         dword ptr [esi],0
>00041B87    je          00041BCB
 00041B89    lea         eax,[ebp-4]
 00041B8C    push        eax
 00041B8D    mov         eax,dword ptr [esi]
 00041B8F    mov         dword ptr [ebp-14],eax
 00041B92    mov         byte ptr [ebp-10],0B
 00041B96    lea         edx,[ebp-18]
 00041B99    mov         eax,dword ptr [edi+0C]
 00041B9C    mov         ax,word ptr [eax+60]
 00041BA0    call        ShortCutToText
 00041BA5    mov         eax,dword ptr [ebp-18]
 00041BA8    mov         dword ptr [ebp-0C],eax
 00041BAB    mov         byte ptr [ebp-8],0B
 00041BAF    lea         edx,[ebp-14]
 00041BB2    mov         ecx,1
 00041BB7    mov         eax,41C04;'%s (%s)'
 00041BBC    call        Format
 00041BC1    mov         edx,dword ptr [ebp-4]
 00041BC4    mov         eax,esi
 00041BC6    call        @LStrAsg
 00041BCB    xor         eax,eax
 00041BCD    pop         edx
 00041BCE    pop         ecx
 00041BCF    pop         ecx
 00041BD0    mov         dword ptr fs:[eax],edx
 00041BD3    push        41BF0
 00041BD8    lea         eax,[ebp-18]
 00041BDB    call        @LStrClr
 00041BE0    lea         eax,[ebp-4]
 00041BE3    call        @LStrClr
 00041BE8    ret
>00041BE9    jmp         @HandleFinally
>00041BEE    jmp         00041BD8
 00041BF0    mov         eax,ebx
 00041BF2    pop         edi
 00041BF3    pop         esi
 00041BF4    pop         ebx
 00041BF5    mov         esp,ebp
 00041BF7    pop         ebp
 00041BF8    ret
*}
end;

//00041C0C
function TControlActionLink.IsCaptionLinked:Boolean;
begin
{*
 00041C0C    push        ebp
 00041C0D    mov         ebp,esp
 00041C0F    push        0
 00041C11    push        ebx
 00041C12    mov         ebx,eax
 00041C14    xor         eax,eax
 00041C16    push        ebp
 00041C17    push        41C73
 00041C1C    push        dword ptr fs:[eax]
 00041C1F    mov         dword ptr fs:[eax],esp
 00041C22    mov         eax,ebx
 00041C24    call        TActionLink.IsCaptionLinked
 00041C29    test        al,al
>00041C2B    je          00041C55
 00041C2D    lea         edx,[ebp-4]
 00041C30    mov         eax,dword ptr [ebx+10]
 00041C33    call        TControl.GetText
 00041C38    mov         eax,dword ptr [ebp-4]
 00041C3B    push        eax
 00041C3C    mov         eax,dword ptr [ebx+0C]
 00041C3F    mov         edx,dword ptr ds:[4D3E8];TCustomAction
 00041C45    call        @AsClass
 00041C4A    mov         edx,dword ptr [eax+4C]
 00041C4D    pop         eax
 00041C4E    call        @LStrCmp
>00041C53    je          00041C59
 00041C55    xor         eax,eax
>00041C57    jmp         00041C5B
 00041C59    mov         al,1
 00041C5B    mov         ebx,eax
 00041C5D    xor         eax,eax
 00041C5F    pop         edx
 00041C60    pop         ecx
 00041C61    pop         ecx
 00041C62    mov         dword ptr fs:[eax],edx
 00041C65    push        41C7A
 00041C6A    lea         eax,[ebp-4]
 00041C6D    call        @LStrClr
 00041C72    ret
>00041C73    jmp         @HandleFinally
>00041C78    jmp         00041C6A
 00041C7A    mov         eax,ebx
 00041C7C    pop         ebx
 00041C7D    pop         ecx
 00041C7E    pop         ebp
 00041C7F    ret
*}
end;

//00041C80
function TControlActionLink.IsEnabledLinked:Boolean;
begin
{*
 00041C80    push        ebx
 00041C81    mov         ebx,eax
 00041C83    mov         eax,ebx
 00041C85    call        TActionLink.IsEnabledLinked
 00041C8A    test        al,al
>00041C8C    je          00041CAB
 00041C8E    mov         eax,dword ptr [ebx+10]
 00041C91    mov         edx,dword ptr [eax]
 00041C93    call        dword ptr [edx+50]
 00041C96    push        eax
 00041C97    mov         eax,dword ptr [ebx+0C]
 00041C9A    mov         edx,dword ptr ds:[4D3E8];TCustomAction
 00041CA0    call        @AsClass
 00041CA5    pop         edx
 00041CA6    cmp         dl,byte ptr [eax+51]
>00041CA9    je          00041CAF
 00041CAB    xor         eax,eax
 00041CAD    pop         ebx
 00041CAE    ret
 00041CAF    mov         al,1
 00041CB1    pop         ebx
 00041CB2    ret
*}
end;

//00041CB4
function TControlActionLink.IsHintLinked:Boolean;
begin
{*
 00041CB4    push        ebx
 00041CB5    mov         ebx,eax
 00041CB7    mov         eax,ebx
 00041CB9    call        TActionLink.IsHintLinked
 00041CBE    test        al,al
>00041CC0    je          00041CE0
 00041CC2    mov         eax,dword ptr [ebx+0C]
 00041CC5    mov         edx,dword ptr ds:[4D3E8];TCustomAction
 00041CCB    call        @AsClass
 00041CD0    mov         edx,dword ptr [eax+58]
 00041CD3    mov         eax,dword ptr [ebx+10]
 00041CD6    mov         eax,dword ptr [eax+74]
 00041CD9    call        @LStrCmp
>00041CDE    je          00041CE4
 00041CE0    xor         eax,eax
 00041CE2    pop         ebx
 00041CE3    ret
 00041CE4    mov         al,1
 00041CE6    pop         ebx
 00041CE7    ret
*}
end;

//00041CE8
function TControlActionLink.IsVisibleLinked:Boolean;
begin
{*
 00041CE8    push        ebx
 00041CE9    mov         ebx,eax
 00041CEB    mov         eax,ebx
 00041CED    call        TActionLink.IsVisibleLinked
 00041CF2    test        al,al
>00041CF4    je          00041D0F
 00041CF6    mov         eax,dword ptr [ebx+0C]
 00041CF9    mov         edx,dword ptr ds:[4D3E8];TCustomAction
 00041CFF    call        @AsClass
 00041D04    mov         al,byte ptr [eax+62]
 00041D07    mov         edx,dword ptr [ebx+10]
 00041D0A    cmp         al,byte ptr [edx+47]
>00041D0D    je          00041D13
 00041D0F    xor         eax,eax
 00041D11    pop         ebx
 00041D12    ret
 00041D13    mov         al,1
 00041D15    pop         ebx
 00041D16    ret
*}
end;

//00041D18
function TControlActionLink.IsOnExecuteLinked:Boolean;
begin
{*
 00041D18    push        ebx
 00041D19    mov         ebx,eax
 00041D1B    mov         eax,ebx
 00041D1D    call        TBasicActionLink.IsOnExecuteLinked
 00041D22    test        al,al
>00041D24    je          00041D37
 00041D26    mov         eax,dword ptr [ebx+10]
 00041D29    mov         eax,dword ptr [eax+104]
 00041D2F    mov         edx,dword ptr [ebx+0C]
 00041D32    cmp         eax,dword ptr [edx+2C]
>00041D35    je          00041D3B
 00041D37    xor         eax,eax
 00041D39    pop         ebx
 00041D3A    ret
 00041D3B    mov         al,1
 00041D3D    pop         ebx
 00041D3E    ret
*}
end;

//00041D40
procedure TControlActionLink.SetCaption(const Value:AnsiString);
begin
{*
 00041D40    push        ebx
 00041D41    push        esi
 00041D42    mov         esi,edx
 00041D44    mov         ebx,eax
 00041D46    mov         eax,ebx
 00041D48    mov         edx,dword ptr [eax]
 00041D4A    call        dword ptr [edx+1C]
 00041D4D    test        al,al
>00041D4F    je          00041D5B
 00041D51    mov         edx,esi
 00041D53    mov         eax,dword ptr [ebx+10]
 00041D56    call        TControl.SetText
 00041D5B    pop         esi
 00041D5C    pop         ebx
 00041D5D    ret
*}
end;

//00041D60
procedure TControlActionLink.SetEnabled(Value:Boolean);
begin
{*
 00041D60    push        ebx
 00041D61    push        esi
 00041D62    mov         ebx,edx
 00041D64    mov         esi,eax
 00041D66    mov         eax,esi
 00041D68    mov         edx,dword ptr [eax]
 00041D6A    call        dword ptr [edx+24]
 00041D6D    test        al,al
>00041D6F    je          00041D7B
 00041D71    mov         edx,ebx
 00041D73    mov         eax,dword ptr [esi+10]
 00041D76    mov         ecx,dword ptr [eax]
 00041D78    call        dword ptr [ecx+60]
 00041D7B    pop         esi
 00041D7C    pop         ebx
 00041D7D    ret
*}
end;

//00041D80
procedure TControlActionLink.SetHint(const Value:AnsiString);
begin
{*
 00041D80    push        ebx
 00041D81    push        esi
 00041D82    mov         esi,edx
 00041D84    mov         ebx,eax
 00041D86    mov         eax,ebx
 00041D88    mov         edx,dword ptr [eax]
 00041D8A    call        dword ptr [edx+2C]
 00041D8D    test        al,al
>00041D8F    je          00041D9E
 00041D91    mov         eax,dword ptr [ebx+10]
 00041D94    add         eax,74
 00041D97    mov         edx,esi
 00041D99    call        @LStrAsg
 00041D9E    pop         esi
 00041D9F    pop         ebx
 00041DA0    ret
*}
end;

//00041DA4
procedure TControlActionLink.SetVisible(Value:Boolean);
begin
{*
 00041DA4    push        ebx
 00041DA5    push        esi
 00041DA6    mov         ebx,edx
 00041DA8    mov         esi,eax
 00041DAA    mov         eax,esi
 00041DAC    mov         edx,dword ptr [eax]
 00041DAE    call        dword ptr [edx+38]
 00041DB1    test        al,al
>00041DB3    je          00041DBF
 00041DB5    mov         edx,ebx
 00041DB7    mov         eax,dword ptr [esi+10]
 00041DBA    call        TControl.SetVisible
 00041DBF    pop         esi
 00041DC0    pop         ebx
 00041DC1    ret
*}
end;

//00041DC4
procedure TControlActionLink.SetOnExecute(Value:TNotifyEvent);
begin
{*
 00041DC4    push        ebp
 00041DC5    mov         ebp,esp
 00041DC7    push        ebx
 00041DC8    mov         ebx,eax
 00041DCA    mov         eax,ebx
 00041DCC    mov         edx,dword ptr [eax]
 00041DCE    call        dword ptr [edx+8]
 00041DD1    test        al,al
>00041DD3    je          00041DEA
 00041DD5    mov         eax,dword ptr [ebx+10]
 00041DD8    mov         edx,dword ptr [ebp+8]
 00041DDB    mov         dword ptr [eax+104],edx
 00041DE1    mov         edx,dword ptr [ebp+0C]
 00041DE4    mov         dword ptr [eax+108],edx
 00041DEA    pop         ebx
 00041DEB    pop         ebp
 00041DEC    ret         8
*}
end;

//00041DF0
constructor TControl.Create(AOwner:TComponent);
begin
{*
 00041DF0    push        ebp
 00041DF1    mov         ebp,esp
 00041DF3    push        ecx
 00041DF4    push        ebx
 00041DF5    push        esi
 00041DF6    test        dl,dl
>00041DF8    je          00041E02
 00041DFA    add         esp,0FFFFFFF0
 00041DFD    call        @ClassCreate
 00041E02    mov         byte ptr [ebp-1],dl
 00041E05    mov         ebx,eax
 00041E07    xor         edx,edx
 00041E09    mov         eax,ebx
 00041E0B    call        TComponent.Create
 00041E10    mov         dword ptr [ebx+2C],ebx
 00041E13    mov         eax,dword ptr [ebx]
 00041E15    mov         eax,dword ptr [eax+70]
 00041E18    mov         dword ptr [ebx+28],eax
 00041E1B    mov         eax,[00041EB8]
 00041E20    mov         dword ptr [ebx+40],eax
 00041E23    mov         dl,1
 00041E25    mov         eax,[00028720];TFont
 00041E2A    call        TFont.Create
 00041E2F    mov         esi,eax
 00041E31    mov         dword ptr [ebx+58],esi
 00041E34    mov         dword ptr [esi+8],ebx
 00041E37    mov         dword ptr [esi+4],42BE0;TControl.FontChanged
 00041E3E    mov         al,[00041EBC]
 00041E43    mov         byte ptr [ebx+60],al
 00041E46    mov         ecx,ebx
 00041E48    mov         dl,1
 00041E4A    mov         eax,[0003E41C];TSizeConstraints
 00041E4F    call        TSizeConstraints.Create
 00041E54    mov         esi,eax
 00041E56    mov         dword ptr [ebx+68],esi
 00041E59    mov         dword ptr [esi+1C],ebx
 00041E5C    mov         dword ptr [esi+18],4393C;TControl.DoConstraintsChange
 00041E63    mov         dword ptr [ebx+64],80000005
 00041E6A    mov         byte ptr [ebx+47],1
 00041E6E    mov         byte ptr [ebx+48],1
 00041E72    mov         byte ptr [ebx+49],1
 00041E76    mov         byte ptr [ebx+4A],1
 00041E7A    mov         byte ptr [ebx+86],1
 00041E81    mov         byte ptr [ebx+50],1
 00041E85    mov         byte ptr [ebx+4E],0
 00041E89    mov         word ptr [ebx+6E],0FFF4
 00041E8F    mov         eax,[00056148];TCustomDockForm
 00041E94    mov         dword ptr [ebx+0A0],eax
 00041E9A    mov         eax,ebx
 00041E9C    cmp         byte ptr [ebp-1],0
>00041EA0    je          00041EB1
 00041EA2    call        @AfterConstruction
 00041EA7    pop         dword ptr fs:[0]
 00041EAE    add         esp,0C
 00041EB1    mov         eax,ebx
 00041EB3    pop         esi
 00041EB4    pop         ebx
 00041EB5    pop         ecx
 00041EB6    pop         ebp
 00041EB7    ret
*}
end;

//00041EC0
destructor TControl.Destroy;
begin
{*
 00041EC0    push        ebx
 00041EC1    push        esi
 00041EC2    add         esp,0FFFFFFEC
 00041EC5    call        @BeforeDestruction
 00041ECA    mov         byte ptr [esp],dl
 00041ECD    mov         esi,eax
 00041ECF    mov         eax,[000B59E8];^Application:TApplication
 00041ED4    mov         eax,dword ptr [eax]
 00041ED6    mov         edx,esi
 00041ED8    call        TApplication.ControlDestroyed
 00041EDD    xor         edx,edx
 00041EDF    mov         eax,esi
 00041EE1    mov         ecx,dword ptr [eax]
 00041EE3    call        dword ptr [ecx+64]
 00041EE6    mov         eax,dword ptr [esi+8C]
 00041EEC    test        eax,eax
>00041EEE    je          00041F28
 00041EF0    test        byte ptr [eax+20],8
>00041EF4    jne         00041F28
 00041EF6    push        esi
 00041EF7    xor         ecx,ecx
 00041EF9    mov         edx,0B039
 00041EFE    call        TControl.Perform
 00041F03    lea         edx,[esp+4]
 00041F07    mov         eax,esi
 00041F09    call        TControl.GetBoundsRect
 00041F0E    lea         ecx,[esp+4]
 00041F12    or          edx,0FFFFFFFF
 00041F15    mov         eax,esi
 00041F17    mov         bx,0FFD2
 00041F1B    call        @CallDynaInst
 00041F20    xor         eax,eax
 00041F22    mov         dword ptr [esi+8C],eax
 00041F28    mov         eax,dword ptr [esi+5C]
 00041F2B    call        TObject.Free
 00041F30    xor         eax,eax
 00041F32    mov         dword ptr [esi+5C],eax
 00041F35    mov         eax,dword ptr [esi+68]
 00041F38    call        TObject.Free
 00041F3D    mov         eax,dword ptr [esi+58]
 00041F40    call        TObject.Free
 00041F45    mov         eax,dword ptr [esi+54]
 00041F48    call        StrDispose
 00041F4D    mov         dl,byte ptr [esp]
 00041F50    and         dl,0FC
 00041F53    mov         eax,esi
 00041F55    call        TComponent.Destroy
 00041F5A    cmp         byte ptr [esp],0
>00041F5E    jle         00041F67
 00041F60    mov         eax,esi
 00041F62    call        @ClassDestroy
 00041F67    add         esp,14
 00041F6A    pop         esi
 00041F6B    pop         ebx
 00041F6C    ret
*}
end;

//00041F70
{*function sub_00041F70:?;
begin
 00041F70    xor         eax,eax
 00041F72    ret
end;*}

//00041F74
function TGroupBox.GetEnabled:Boolean;
begin
{*
 00041F74    mov         al,byte ptr [eax+48];TGroupBox.FEnabled:Boolean
 00041F77    ret
*}
end;

//00041F78
procedure TControl.sub_00041F78;
begin
{*
 00041F78    xor         eax,eax
 00041F7A    ret
*}
end;

//00041F7C
procedure TControl.HasParent;
begin
{*
 00041F7C    cmp         dword ptr [eax+24],0
 00041F80    setne       al
 00041F83    ret
*}
end;

//00041F84
procedure TControl.GetParentComponent;
begin
{*
 00041F84    mov         eax,dword ptr [eax+24];TControl.FParent:TWinControl
 00041F87    ret
*}
end;

//00041F88
procedure TControl.SetParentComponent(Value:TComponent);
begin
{*
 00041F88    push        ebx
 00041F89    push        esi
 00041F8A    mov         esi,edx
 00041F8C    mov         ebx,eax
 00041F8E    mov         eax,esi
 00041F90    mov         edx,dword ptr ds:[3F0BC];TWinControl
 00041F96    call        @IsClass
 00041F9B    test        al,al
>00041F9D    je          00041FA8
 00041F9F    mov         edx,esi
 00041FA1    mov         eax,ebx
 00041FA3    mov         ecx,dword ptr [eax]
 00041FA5    call        dword ptr [ecx+64]
 00041FA8    pop         esi
 00041FA9    pop         ebx
 00041FAA    ret
*}
end;

//00041FAC
procedure TControl.PaletteChanged(Foreground:Boolean);
begin
{*
 00041FAC    push        ebx
 00041FAD    push        esi
 00041FAE    push        edi
 00041FAF    add         esp,0FFFFFFF8
 00041FB2    mov         byte ptr [esp],dl
 00041FB5    mov         esi,eax
 00041FB7    mov         byte ptr [esp+1],0
 00041FBC    cmp         byte ptr [esi+47],0
>00041FC0    je          0004201D
 00041FC2    mov         eax,esi
 00041FC4    mov         bx,0FFDD
 00041FC8    call        @CallDynaInst
 00041FCD    mov         edi,eax
 00041FCF    test        edi,edi
>00041FD1    je          0004201D
 00041FD3    lea         edx,[esp+4]
 00041FD7    mov         eax,esi
 00041FD9    mov         ecx,dword ptr [eax]
 00041FDB    call        dword ptr [ecx+48]
 00041FDE    mov         ebx,eax
 00041FE0    mov         al,byte ptr [esp]
 00041FE3    xor         al,1
 00041FE5    neg         al
 00041FE7    sbb         eax,eax
 00041FE9    push        eax
 00041FEA    push        edi
 00041FEB    push        ebx
 00041FEC    call        gdi32.SelectPalette
 00041FF1    mov         edi,eax
 00041FF3    push        ebx
 00041FF4    call        gdi32.RealizePalette
 00041FF9    test        eax,eax
>00041FFB    je          00042004
 00041FFD    mov         eax,esi
 00041FFF    mov         edx,dword ptr [eax]
 00042001    call        dword ptr [edx+78]
 00042004    push        0FF
 00042006    push        edi
 00042007    push        ebx
 00042008    call        gdi32.SelectPalette
 0004200D    push        ebx
 0004200E    mov         eax,dword ptr [esp+8]
 00042012    push        eax
 00042013    call        user32.ReleaseDC
 00042018    mov         byte ptr [esp+1],1
 0004201D    mov         al,byte ptr [esp+1]
 00042021    pop         ecx
 00042022    pop         edx
 00042023    pop         edi
 00042024    pop         esi
 00042025    pop         ebx
 00042026    ret
*}
end;

//00042028
function TControl.GetAction:TBasicAction;
begin
{*
 00042028    mov         edx,dword ptr [eax+5C]
 0004202B    test        edx,edx
>0004202D    je          00042033
 0004202F    mov         eax,dword ptr [edx+0C]
 00042032    ret
 00042033    xor         eax,eax
 00042035    ret
*}
end;

//00042038
procedure TControl.SetAction(Value:TBasicAction);
begin
{*
 00042038    push        ebx
 00042039    push        esi
 0004203A    push        edi
 0004203B    mov         edi,edx
 0004203D    mov         esi,eax
 0004203F    test        edi,edi
>00042041    jne         00042059
 00042043    mov         eax,dword ptr [esi+5C]
 00042046    call        TObject.Free
 0004204B    xor         eax,eax
 0004204D    mov         dword ptr [esi+5C],eax
 00042050    and         dword ptr [esi+40],0FFFF7FFF
>00042057    jmp         000420AF
 00042059    or          dword ptr [esi+40],8000
 00042060    cmp         dword ptr [esi+5C],0
>00042064    jne         0004207B
 00042066    mov         eax,esi
 00042068    mov         bx,0FFDF
 0004206C    call        @CallDynaInst
 00042071    mov         ecx,esi
 00042073    mov         dl,1
 00042075    call        dword ptr [eax+14]
 00042078    mov         dword ptr [esi+5C],eax
 0004207B    mov         edx,edi
 0004207D    mov         eax,dword ptr [esi+5C]
 00042080    mov         ecx,dword ptr [eax]
 00042082    call        dword ptr [ecx+0C]
 00042085    mov         eax,dword ptr [esi+5C]
 00042088    mov         dword ptr [eax+8],esi
 0004208B    mov         dword ptr [eax+4],447F8;TControl.DoActionChange
 00042092    test        byte ptr [edi+20],1
 00042096    setne       cl
 00042099    mov         edx,edi
 0004209B    mov         eax,esi
 0004209D    mov         bx,0FFF0
 000420A1    call        @CallDynaInst
 000420A6    mov         edx,esi
 000420A8    mov         eax,edi
 000420AA    call        TComponent.FreeNotification
 000420AF    pop         edi
 000420B0    pop         esi
 000420B1    pop         ebx
 000420B2    ret
*}
end;

//000420B4
function TControl.IsAnchorsStored(Value:TAnchors):Boolean;
begin
{*
 000420B4    push        ebx
 000420B5    mov         ebx,eax
 000420B7    xor         eax,eax
 000420B9    mov         al,byte ptr [ebx+4B]
 000420BC    mov         al,byte ptr [eax+0B4780]
 000420C2    cmp         al,byte ptr [ebx+60]
 000420C5    setne       al
 000420C8    pop         ebx
 000420C9    ret
*}
end;

//000420CC
procedure TGroupBox.SetDragMode(Value:TDragMode);
begin
{*
 000420CC    mov         byte ptr [eax+4D],dl;TGroupBox.FDragMode:TDragMode
 000420CF    ret
*}
end;

//000420D0
procedure TControl.RequestAlign;
begin
{*
 000420D0    mov         edx,dword ptr [eax+24]
 000420D3    test        edx,edx
>000420D5    je          000420DD
 000420D7    xchg        eax,edx
 000420D8    call        TWinControl.AlignControl
 000420DD    ret
*}
end;

//000420E0
procedure TControl.Resize;
begin
{*
 000420E0    push        ebx
 000420E1    cmp         word ptr [eax+0DE],0
>000420E9    je          000420FB
 000420EB    mov         ebx,eax
 000420ED    mov         edx,eax
 000420EF    mov         eax,dword ptr [ebx+0E0]
 000420F5    call        dword ptr [ebx+0DC]
 000420FB    pop         ebx
 000420FC    ret
*}
end;

//00042100
procedure TControl.ReadState(Reader:TReader);
begin
{*
 00042100    push        ebx
 00042101    push        esi
 00042102    push        edi
 00042103    mov         esi,edx
 00042105    mov         ebx,eax
 00042107    or          word ptr [ebx+44],8
 0004210C    mov         edi,dword ptr [esi+28]
 0004210F    mov         eax,edi
 00042111    mov         edx,dword ptr ds:[3F0BC];TWinControl
 00042117    call        @IsClass
 0004211C    test        al,al
>0004211E    je          00042129
 00042120    mov         edx,edi
 00042122    mov         eax,ebx
 00042124    mov         ecx,dword ptr [eax]
 00042126    call        dword ptr [ecx+64]
 00042129    mov         edx,esi
 0004212B    mov         eax,ebx
 0004212D    call        TComponent.ReadState
 00042132    and         word ptr [ebx+44],0FFFFFFF7
 00042137    cmp         dword ptr [ebx+24],0
>0004213B    je          0004218D
 0004213D    push        0
 0004213F    xor         ecx,ecx
 00042141    mov         edx,0B009
 00042146    mov         eax,ebx
 00042148    call        TControl.Perform
 0004214D    push        0
 0004214F    xor         ecx,ecx
 00042151    mov         edx,0B008
 00042156    mov         eax,ebx
 00042158    call        TControl.Perform
 0004215D    push        0
 0004215F    xor         ecx,ecx
 00042161    mov         edx,0B023
 00042166    mov         eax,ebx
 00042168    call        TControl.Perform
 0004216D    push        0
 0004216F    xor         ecx,ecx
 00042171    mov         edx,0B035
 00042176    mov         eax,ebx
 00042178    call        TControl.Perform
 0004217D    push        0
 0004217F    xor         ecx,ecx
 00042181    mov         edx,0B03D
 00042186    mov         eax,ebx
 00042188    call        TControl.Perform
 0004218D    pop         edi
 0004218E    pop         esi
 0004218F    pop         ebx
 00042190    ret
*}
end;

//00042194
procedure TControl.Notification(AComponent:TComponent; Operation:TOperation);
begin
{*
 00042194    push        ebx
 00042195    push        esi
 00042196    push        edi
 00042197    mov         ebx,ecx
 00042199    mov         edi,edx
 0004219B    mov         esi,eax
 0004219D    mov         ecx,ebx
 0004219F    mov         edx,edi
 000421A1    mov         eax,esi
 000421A3    call        TComponent.Notification
 000421A8    cmp         bl,1
>000421AB    jne         000421D1
 000421AD    cmp         edi,dword ptr [esi+70]
>000421B0    jne         000421BD
 000421B2    xor         edx,edx
 000421B4    mov         eax,esi
 000421B6    call        TControl.SetPopupMenu
>000421BB    jmp         000421D1
 000421BD    mov         eax,esi
 000421BF    call        TControl.GetAction
 000421C4    cmp         edi,eax
>000421C6    jne         000421D1
 000421C8    xor         edx,edx
 000421CA    mov         eax,esi
 000421CC    call        TControl.SetAction
 000421D1    pop         edi
 000421D2    pop         esi
 000421D3    pop         ebx
 000421D4    ret
*}
end;

//000421D8
procedure TControl.SetAlign(Value:TAlign);
begin
{*
 000421D8    push        ebx
 000421D9    push        esi
 000421DA    push        ecx
 000421DB    mov         esi,eax
 000421DD    mov         al,byte ptr [esi+4B]
 000421E0    cmp         dl,al
>000421E2    je          0004225A
 000421E4    mov         byte ptr [esp],al
 000421E7    mov         byte ptr [esi+4B],dl
 000421EA    xor         eax,eax
 000421EC    mov         al,dl
 000421EE    mov         al,byte ptr [eax+0B4780]
 000421F4    mov         byte ptr [esi+60],al
 000421F7    test        byte ptr [esi+20],1
>000421FB    jne         0004225A
 000421FD    test        byte ptr [esi+20],10
>00042201    je          00042209
 00042203    cmp         dword ptr [esi+24],0
>00042207    je          0004225A
 00042209    mov         al,byte ptr [esp]
 0004220C    dec         eax
 0004220D    sub         al,2
 0004220F    setb        al
 00042212    mov         ecx,edx
 00042214    add         cl,0FD
 00042217    sub         cl,2
 0004221A    setb        cl
 0004221D    cmp         al,cl
>0004221F    jne         0004224F
 00042221    mov         al,byte ptr [esp]
 00042224    test        al,al
>00042226    je          0004224F
 00042228    sub         al,5
>0004222A    je          0004224F
 0004222C    test        dl,dl
>0004222E    je          0004224F
 00042230    sub         dl,5
>00042233    je          0004224F
 00042235    mov         eax,dword ptr [esi+3C]
 00042238    push        eax
 00042239    mov         eax,dword ptr [esi+38]
 0004223C    push        eax
 0004223D    mov         ecx,dword ptr [esi+34]
 00042240    mov         edx,dword ptr [esi+30]
 00042243    mov         eax,esi
 00042245    mov         ebx,dword ptr [eax]
 00042247    call        dword ptr [ebx+80]
>0004224D    jmp         0004225A
 0004224F    mov         eax,esi
 00042251    mov         bx,0FFEF
 00042255    call        @CallDynaInst
 0004225A    mov         eax,esi
 0004225C    mov         bx,0FFD6
 00042260    call        @CallDynaInst
 00042265    pop         edx
 00042266    pop         esi
 00042267    pop         ebx
 00042268    ret
*}
end;

//0004226C
procedure TControl.SetBounds(ALeft:Integer; ATop:Integer; AWidth:Integer; AHeight:Integer);
begin
{*
 0004226C    push        ebp
 0004226D    mov         ebp,esp
 0004226F    push        ecx
 00042270    push        ebx
 00042271    push        esi
 00042272    push        edi
 00042273    mov         dword ptr [ebp-4],ecx
 00042276    mov         ebx,edx
 00042278    mov         esi,eax
 0004227A    lea         ecx,[ebp+8]
 0004227D    lea         edx,[ebp+0C]
 00042280    mov         eax,esi
 00042282    call        TControl.CheckNewSize
 00042287    test        al,al
>00042289    je          00042309
 0004228B    cmp         ebx,dword ptr [esi+30]
>0004228E    jne         000422A8
 00042290    mov         eax,dword ptr [ebp-4]
 00042293    cmp         eax,dword ptr [esi+34]
>00042296    jne         000422A8
 00042298    mov         eax,dword ptr [ebp+0C]
 0004229B    cmp         eax,dword ptr [esi+38]
>0004229E    jne         000422A8
 000422A0    mov         eax,dword ptr [ebp+8]
 000422A3    cmp         eax,dword ptr [esi+3C]
>000422A6    je          00042309
 000422A8    xor         ecx,ecx
 000422AA    mov         dl,byte ptr [esi+47]
 000422AD    mov         eax,esi
 000422AF    call        TControl.InvalidateControl
 000422B4    mov         ecx,dword ptr [ebp+8]
 000422B7    mov         edx,dword ptr [ebp+0C]
 000422BA    mov         eax,esi
 000422BC    mov         edi,dword ptr [eax]
 000422BE    call        dword ptr [edi+30]
 000422C1    mov         dword ptr [esi+30],ebx
 000422C4    mov         eax,dword ptr [ebp-4]
 000422C7    mov         dword ptr [esi+34],eax
 000422CA    mov         eax,dword ptr [ebp+0C]
 000422CD    mov         dword ptr [esi+38],eax
 000422D0    mov         eax,dword ptr [ebp+8]
 000422D3    mov         dword ptr [esi+3C],eax
 000422D6    mov         eax,esi
 000422D8    mov         edx,dword ptr [eax]
 000422DA    call        dword ptr [edx+78]
 000422DD    push        0
 000422DF    xor         ecx,ecx
 000422E1    mov         edx,47
 000422E6    mov         eax,esi
 000422E8    call        TControl.Perform
 000422ED    mov         eax,esi
 000422EF    mov         bx,0FFD6
 000422F3    call        @CallDynaInst
 000422F8    test        byte ptr [esi+20],1
>000422FC    jne         00042309
 000422FE    mov         eax,esi
 00042300    mov         bx,0FFD5
 00042304    call        @CallDynaInst
 00042309    pop         edi
 0004230A    pop         esi
 0004230B    pop         ebx
 0004230C    pop         ecx
 0004230D    pop         ebp
 0004230E    ret         8
*}
end;

//00042314
procedure TControl.SetLeft(Value:Integer);
begin
{*
 00042314    push        ebx
 00042315    push        esi
 00042316    mov         ebx,eax
 00042318    mov         eax,dword ptr [ebx+38]
 0004231B    push        eax
 0004231C    mov         eax,dword ptr [ebx+3C]
 0004231F    push        eax
 00042320    mov         ecx,dword ptr [ebx+34]
 00042323    mov         eax,ebx
 00042325    mov         esi,dword ptr [eax]
 00042327    call        dword ptr [esi+80]
 0004232D    or          byte ptr [ebx+84],1
 00042334    pop         esi
 00042335    pop         ebx
 00042336    ret
*}
end;

//00042338
procedure TControl.SetTop(Value:Integer);
begin
{*
 00042338    push        ebx
 00042339    push        esi
 0004233A    mov         ebx,eax
 0004233C    mov         eax,dword ptr [ebx+38]
 0004233F    push        eax
 00042340    mov         eax,dword ptr [ebx+3C]
 00042343    push        eax
 00042344    mov         ecx,edx
 00042346    mov         eax,ebx
 00042348    mov         edx,dword ptr [ebx+30]
 0004234B    mov         esi,dword ptr [eax]
 0004234D    call        dword ptr [esi+80]
 00042353    or          byte ptr [ebx+84],2
 0004235A    pop         esi
 0004235B    pop         ebx
 0004235C    ret
*}
end;

//00042360
procedure TControl.SetWidth(Value:Integer);
begin
{*
 00042360    push        ebx
 00042361    push        esi
 00042362    mov         ebx,eax
 00042364    push        edx
 00042365    mov         eax,dword ptr [ebx+3C]
 00042368    push        eax
 00042369    mov         ecx,dword ptr [ebx+34]
 0004236C    mov         eax,ebx
 0004236E    mov         edx,dword ptr [ebx+30]
 00042371    mov         esi,dword ptr [eax]
 00042373    call        dword ptr [esi+80]
 00042379    or          byte ptr [ebx+84],4
 00042380    pop         esi
 00042381    pop         ebx
 00042382    ret
*}
end;

//00042384
procedure TControl.SetHeight(Value:Integer);
begin
{*
 00042384    push        ebx
 00042385    push        esi
 00042386    mov         ebx,eax
 00042388    mov         eax,dword ptr [ebx+38]
 0004238B    push        eax
 0004238C    push        edx
 0004238D    mov         ecx,dword ptr [ebx+34]
 00042390    mov         eax,ebx
 00042392    mov         edx,dword ptr [ebx+30]
 00042395    mov         esi,dword ptr [eax]
 00042397    call        dword ptr [esi+80]
 0004239D    or          byte ptr [ebx+84],8
 000423A4    pop         esi
 000423A5    pop         ebx
 000423A6    ret
*}
end;

//000423A8
procedure TControl.Dock(NewDockSite:TWinControl; ARect:TRect);
begin
{*
 000423A8    push        ebp
 000423A9    mov         ebp,esp
 000423AB    add         esp,0FFFFFFEC
 000423AE    push        ebx
 000423AF    push        esi
 000423B0    push        edi
 000423B1    mov         esi,ecx
 000423B3    lea         edi,[ebp-14]
 000423B6    mov         ecx,4
 000423BB    rep movs    dword ptr [edi],dword ptr [esi]
 000423BD    mov         esi,edx
 000423BF    mov         dword ptr [ebp-4],eax
 000423C2    mov         eax,dword ptr [ebp-4]
 000423C5    cmp         esi,dword ptr [eax+8C]
>000423CB    je          00042411
 000423CD    mov         eax,dword ptr [ebp-4]
 000423D0    mov         eax,dword ptr [eax+8C]
 000423D6    test        eax,eax
>000423D8    je          000423F1
 000423DA    cmp         dword ptr [eax+134],0
>000423E1    je          000423F1
 000423E3    mov         eax,dword ptr [eax+134]
 000423E9    mov         edx,dword ptr [ebp-4]
 000423EC    call        TList.Remove
 000423F1    test        esi,esi
>000423F3    je          00042411
 000423F5    cmp         esi,0FFFFFFFF
>000423F8    je          00042411
 000423FA    cmp         dword ptr [esi+134],0
>00042401    je          00042411
 00042403    mov         eax,dword ptr [esi+134]
 00042409    mov         edx,dword ptr [ebp-4]
 0004240C    call        TList.Add
 00042411    mov         eax,dword ptr [ebp-4]
 00042414    or          word ptr [eax+44],400
 0004241A    xor         edx,edx
 0004241C    push        ebp
 0004241D    push        424A6
 00042422    push        dword ptr fs:[edx]
 00042425    mov         dword ptr fs:[edx],esp
 00042428    cmp         esi,0FFFFFFFF
>0004242B    je          0004243E
 0004242D    lea         ecx,[ebp-14]
 00042430    mov         edx,esi
 00042432    mov         eax,dword ptr [ebp-4]
 00042435    mov         bx,0FFE7
 00042439    call        @CallDynaInst
 0004243E    mov         eax,dword ptr [ebp-4]
 00042441    mov         eax,dword ptr [eax+8C]
 00042447    cmp         esi,eax
>00042449    je          0004248F
 0004244B    mov         edi,eax
 0004244D    cmp         esi,0FFFFFFFF
>00042450    je          00042472
 00042452    mov         eax,dword ptr [ebp-4]
 00042455    mov         dword ptr [eax+8C],esi
 0004245B    test        esi,esi
>0004245D    je          0004247D
 0004245F    lea         ecx,[ebp-14]
 00042462    mov         edx,dword ptr [ebp-4]
 00042465    mov         eax,esi
 00042467    mov         bx,0FFCD
 0004246B    call        @CallDynaInst
>00042470    jmp         0004247D
 00042472    mov         eax,dword ptr [ebp-4]
 00042475    xor         edx,edx
 00042477    mov         dword ptr [eax+8C],edx
 0004247D    test        edi,edi
>0004247F    je          0004248F
 00042481    mov         edx,dword ptr [ebp-4]
 00042484    mov         eax,edi
 00042486    mov         bx,0FFC4
 0004248A    call        @CallDynaInst
 0004248F    xor         eax,eax
 00042491    pop         edx
 00042492    pop         ecx
 00042493    pop         ecx
 00042494    mov         dword ptr fs:[eax],edx
 00042497    push        424AD
 0004249C    mov         eax,dword ptr [ebp-4]
 0004249F    and         word ptr [eax+44],0FBFF
 000424A5    ret
>000424A6    jmp         @HandleFinally
>000424AB    jmp         0004249C
 000424AD    pop         edi
 000424AE    pop         esi
 000424AF    pop         ebx
 000424B0    mov         esp,ebp
 000424B2    pop         ebp
 000424B3    ret
*}
end;

//000424B4
procedure TControl.DoDock(NewDockSite:TWinControl; var ARect:TRect);
begin
{*
 000424B4    push        ebx
 000424B5    push        esi
 000424B6    push        edi
 000424B7    mov         edi,ecx
 000424B9    mov         esi,edx
 000424BB    mov         ebx,eax
 000424BD    mov         eax,ebx
 000424BF    mov         edx,dword ptr ds:[3F0BC];TWinControl
 000424C5    call        @IsClass
 000424CA    test        al,al
>000424CC    jne         000424DA
 000424CE    xor         ecx,ecx
 000424D0    mov         dl,byte ptr [ebx+47]
 000424D3    mov         eax,ebx
 000424D5    call        TControl.InvalidateControl
 000424DA    cmp         esi,dword ptr [ebx+24]
>000424DD    je          000424EA
 000424DF    mov         edx,edi
 000424E1    mov         eax,ebx
 000424E3    call        TControl.UpdateBoundsRect
>000424E8    jmp         000424F3
 000424EA    mov         edx,edi
 000424EC    mov         eax,ebx
 000424EE    call        TControl.SetBoundsRect
 000424F3    test        esi,esi
>000424F5    je          000424FC
 000424F7    cmp         esi,0FFFFFFFF
>000424FA    jne         00042505
 000424FC    xor         edx,edx
 000424FE    mov         eax,ebx
 00042500    mov         ecx,dword ptr [eax]
 00042502    call        dword ptr [ecx+64]
 00042505    pop         edi
 00042506    pop         esi
 00042507    pop         ebx
 00042508    ret
*}
end;

//0004250C
function TControl.GetBoundsRect:TRect;
begin
{*
 0004250C    mov         ecx,dword ptr [eax+30]
 0004250F    mov         dword ptr [edx],ecx
 00042511    mov         ecx,dword ptr [eax+34]
 00042514    mov         dword ptr [edx+4],ecx
 00042517    mov         ecx,dword ptr [eax+30]
 0004251A    add         ecx,dword ptr [eax+38]
 0004251D    mov         dword ptr [edx+8],ecx
 00042520    mov         ecx,dword ptr [eax+34]
 00042523    add         ecx,dword ptr [eax+3C]
 00042526    mov         dword ptr [edx+0C],ecx
 00042529    ret
*}
end;

//0004252C
procedure TControl.SetBoundsRect(const Rect:TRect);
begin
{*
 0004252C    push        ebx
 0004252D    push        esi
 0004252E    push        edi
 0004252F    mov         ecx,dword ptr [edx+8]
 00042532    mov         esi,dword ptr [edx]
 00042534    sub         ecx,esi
 00042536    push        ecx
 00042537    mov         ecx,dword ptr [edx+0C]
 0004253A    mov         edi,dword ptr [edx+4]
 0004253D    sub         ecx,edi
 0004253F    push        ecx
 00042540    mov         ecx,edi
 00042542    mov         edx,esi
 00042544    mov         ebx,dword ptr [eax]
 00042546    call        dword ptr [ebx+80]
 0004254C    pop         edi
 0004254D    pop         esi
 0004254E    pop         ebx
 0004254F    ret
*}
end;

//00042550
function TControl.GetClientRect:TRect;
begin
{*
 00042550    xor         ecx,ecx
 00042552    mov         dword ptr [edx],ecx
 00042554    xor         ecx,ecx
 00042556    mov         dword ptr [edx+4],ecx
 00042559    mov         ecx,dword ptr [eax+38]
 0004255C    mov         dword ptr [edx+8],ecx
 0004255F    mov         eax,dword ptr [eax+3C]
 00042562    mov         dword ptr [edx+0C],eax
 00042565    ret
*}
end;

//00042568
function TControl.GetClientWidth:Integer;
begin
{*
 00042568    push        ebx
 00042569    add         esp,0FFFFFFF0
 0004256C    mov         ebx,eax
 0004256E    mov         edx,esp
 00042570    mov         eax,ebx
 00042572    mov         ecx,dword ptr [eax]
 00042574    call        dword ptr [ecx+44]
 00042577    mov         eax,dword ptr [esp+8]
 0004257B    add         esp,10
 0004257E    pop         ebx
 0004257F    ret
*}
end;

//00042580
procedure TControl.SetClientWidth(Value:Integer);
begin
{*
 00042580    push        ebx
 00042581    push        esi
 00042582    add         esp,0FFFFFFF8
 00042585    mov         esi,edx
 00042587    mov         ebx,eax
 00042589    mov         eax,ebx
 0004258B    call        TControl.GetClientHeight
 00042590    mov         edx,eax
 00042592    mov         ecx,esp
 00042594    mov         eax,esi
 00042596    call        Point
 0004259B    mov         edx,esp
 0004259D    mov         eax,ebx
 0004259F    call        TControl.SetClientSize
 000425A4    pop         ecx
 000425A5    pop         edx
 000425A6    pop         esi
 000425A7    pop         ebx
 000425A8    ret
*}
end;

//000425AC
function TControl.GetClientHeight:Integer;
begin
{*
 000425AC    push        ebx
 000425AD    add         esp,0FFFFFFF0
 000425B0    mov         ebx,eax
 000425B2    mov         edx,esp
 000425B4    mov         eax,ebx
 000425B6    mov         ecx,dword ptr [eax]
 000425B8    call        dword ptr [ecx+44]
 000425BB    mov         eax,dword ptr [esp+0C]
 000425BF    add         esp,10
 000425C2    pop         ebx
 000425C3    ret
*}
end;

//000425C4
procedure TControl.SetClientHeight(Value:Integer);
begin
{*
 000425C4    push        ebx
 000425C5    push        esi
 000425C6    add         esp,0FFFFFFF8
 000425C9    mov         esi,edx
 000425CB    mov         ebx,eax
 000425CD    mov         eax,ebx
 000425CF    call        TControl.GetClientWidth
 000425D4    mov         ecx,esp
 000425D6    mov         edx,esi
 000425D8    call        Point
 000425DD    mov         edx,esp
 000425DF    mov         eax,ebx
 000425E1    call        TControl.SetClientSize
 000425E6    pop         ecx
 000425E7    pop         edx
 000425E8    pop         esi
 000425E9    pop         ebx
 000425EA    ret
*}
end;

//000425EC
function TControl.GetClientOrigin:TPoint;
begin
{*
 000425EC    push        ebp
 000425ED    mov         ebp,esp
 000425EF    add         esp,0FFFFFFF4
 000425F2    push        ebx
 000425F3    push        esi
 000425F4    xor         ecx,ecx
 000425F6    mov         dword ptr [ebp-0C],ecx
 000425F9    mov         esi,edx
 000425FB    mov         ebx,eax
 000425FD    xor         eax,eax
 000425FF    push        ebp
 00042600    push        4266D
 00042605    push        dword ptr fs:[eax]
 00042608    mov         dword ptr fs:[eax],esp
 0004260B    cmp         dword ptr [ebx+24],0
>0004260F    jne         00042642
 00042611    mov         eax,dword ptr [ebx+8]
 00042614    mov         dword ptr [ebp-8],eax
 00042617    mov         byte ptr [ebp-4],0B
 0004261B    lea         eax,[ebp-8]
 0004261E    push        eax
 0004261F    push        0
 00042621    lea         edx,[ebp-0C]
 00042624    mov         eax,[000B5A5C];^SParentRequired:TResStringRec
 00042629    call        LoadResString
 0004262E    mov         ecx,dword ptr [ebp-0C]
 00042631    mov         dl,1
 00042633    mov         eax,[0001EE64];EInvalidOperation
 00042638    call        Exception.CreateFmt
 0004263D    call        @RaiseExcept
 00042642    mov         edx,esi
 00042644    mov         eax,dword ptr [ebx+24]
 00042647    mov         ecx,dword ptr [eax]
 00042649    call        dword ptr [ecx+40]
 0004264C    mov         eax,dword ptr [ebx+30]
 0004264F    add         dword ptr [esi],eax
 00042651    mov         eax,dword ptr [ebx+34]
 00042654    add         dword ptr [esi+4],eax
 00042657    xor         eax,eax
 00042659    pop         edx
 0004265A    pop         ecx
 0004265B    pop         ecx
 0004265C    mov         dword ptr fs:[eax],edx
 0004265F    push        42674
 00042664    lea         eax,[ebp-0C]
 00042667    call        @LStrClr
 0004266C    ret
>0004266D    jmp         @HandleFinally
>00042672    jmp         00042664
 00042674    pop         esi
 00042675    pop         ebx
 00042676    mov         esp,ebp
 00042678    pop         ebp
 00042679    ret
*}
end;

//0004267C
function TControl.ClientToScreen(const Point:TPoint):TPoint;
begin
{*
 0004267C    push        ebx
 0004267D    push        esi
 0004267E    push        edi
 0004267F    add         esp,0FFFFFFF8
 00042682    mov         edi,ecx
 00042684    mov         esi,edx
 00042686    mov         ebx,eax
 00042688    mov         edx,esp
 0004268A    mov         eax,ebx
 0004268C    mov         ecx,dword ptr [eax]
 0004268E    call        dword ptr [ecx+40]
 00042691    mov         eax,dword ptr [esi]
 00042693    add         eax,dword ptr [esp]
 00042696    mov         dword ptr [edi],eax
 00042698    mov         eax,dword ptr [esi+4]
 0004269B    add         eax,dword ptr [esp+4]
 0004269F    mov         dword ptr [edi+4],eax
 000426A2    pop         ecx
 000426A3    pop         edx
 000426A4    pop         edi
 000426A5    pop         esi
 000426A6    pop         ebx
 000426A7    ret
*}
end;

//000426A8
function TControl.ScreenToClient(const Point:TPoint):TPoint;
begin
{*
 000426A8    push        ebx
 000426A9    push        esi
 000426AA    push        edi
 000426AB    add         esp,0FFFFFFF8
 000426AE    mov         edi,ecx
 000426B0    mov         esi,edx
 000426B2    mov         ebx,eax
 000426B4    mov         edx,esp
 000426B6    mov         eax,ebx
 000426B8    mov         ecx,dword ptr [eax]
 000426BA    call        dword ptr [ecx+40]
 000426BD    mov         eax,dword ptr [esi]
 000426BF    sub         eax,dword ptr [esp]
 000426C2    mov         dword ptr [edi],eax
 000426C4    mov         eax,dword ptr [esi+4]
 000426C7    sub         eax,dword ptr [esp+4]
 000426CB    mov         dword ptr [edi+4],eax
 000426CE    pop         ecx
 000426CF    pop         edx
 000426D0    pop         edi
 000426D1    pop         esi
 000426D2    pop         ebx
 000426D3    ret
*}
end;

//000426D4
procedure TControl.SendCancelMode(Sender:TControl);
begin
{*
 000426D4    push        ebx
 000426D5    push        esi
 000426D6    mov         esi,edx
 000426D8    mov         ebx,eax
 000426DA    test        ebx,ebx
>000426DC    je          000426FF
 000426DE    mov         eax,ebx
 000426E0    mov         edx,dword ptr ds:[55208];TCustomForm
 000426E6    call        @IsClass
 000426EB    test        al,al
>000426ED    je          000426F8
 000426EF    mov         edx,esi
 000426F1    mov         eax,ebx
 000426F3    call        TCustomForm.SendCancelMode
 000426F8    mov         ebx,dword ptr [ebx+24]
 000426FB    test        ebx,ebx
>000426FD    jne         000426DE
 000426FF    pop         esi
 00042700    pop         ebx
 00042701    ret
*}
end;

//00042704
procedure TControl.SendDockNotification(Msg:Cardinal; WParam:Integer; LParam:Integer);
begin
{*
 00042704    push        ebp
 00042705    mov         ebp,esp
 00042707    add         esp,0FFFFFFF0
 0004270A    push        ebx
 0004270B    push        esi
 0004270C    push        edi
 0004270D    mov         dword ptr [ebp-4],ecx
 00042710    mov         edi,edx
 00042712    mov         ebx,eax
 00042714    mov         esi,dword ptr [ebx+8C]
 0004271A    test        esi,esi
>0004271C    je          0004275A
 0004271E    cmp         dword ptr ds:[0B6740],0
>00042725    jne         0004275A
 00042727    mov         al,[00042764]
 0004272C    and         al,byte ptr [ebx+20]
 0004272F    mov         dl,byte ptr ds:[42768]
 00042735    cmp         dl,al
>00042737    jne         0004275A
 00042739    mov         dword ptr [ebp-10],edi
 0004273C    mov         eax,dword ptr [ebp-4]
 0004273F    mov         dword ptr [ebp-0C],eax
 00042742    mov         eax,dword ptr [ebp+8]
 00042745    mov         dword ptr [ebp-8],eax
 00042748    lea         eax,[ebp-10]
 0004274B    push        eax
 0004274C    mov         ecx,ebx
 0004274E    mov         edx,0B042
 00042753    mov         eax,esi
 00042755    call        TControl.Perform
 0004275A    pop         edi
 0004275B    pop         esi
 0004275C    pop         ebx
 0004275D    mov         esp,ebp
 0004275F    pop         ebp
 00042760    ret         4
*}
end;

//0004276C
procedure TControl.Changed;
begin
{*
 0004276C    push        eax
 0004276D    xor         ecx,ecx
 0004276F    mov         edx,0B037
 00042774    call        TControl.Perform
 00042779    ret
*}
end;

//0004277C
procedure TControl.ChangeScale(M:Integer; D:Integer);
begin
{*
 0004277C    push        ebx
 0004277D    push        esi
 0004277E    push        edi
 0004277F    push        ebp
 00042780    add         esp,0FFFFFFF4
 00042783    mov         dword ptr [esp],ecx
 00042786    mov         edi,edx
 00042788    mov         esi,eax
 0004278A    cmp         edi,dword ptr [esp]
>0004278D    je          000428A8
 00042793    test        byte ptr [esi+20],1
>00042797    je          000427A1
 00042799    mov         bl,byte ptr [esi+84]
>0004279F    jmp         000427A7
 000427A1    mov         bl,byte ptr ds:[428BC]
 000427A7    test        bl,1
>000427AA    je          000427BE
 000427AC    mov         eax,dword ptr [esp]
 000427AF    push        eax
 000427B0    push        edi
 000427B1    mov         eax,dword ptr [esi+30]
 000427B4    push        eax
 000427B5    call        kernel32.MulDiv
 000427BA    mov         ebp,eax
>000427BC    jmp         000427C1
 000427BE    mov         ebp,dword ptr [esi+30]
 000427C1    test        bl,2
>000427C4    je          000427DA
 000427C6    mov         eax,dword ptr [esp]
 000427C9    push        eax
 000427CA    push        edi
 000427CB    mov         eax,dword ptr [esi+34]
 000427CE    push        eax
 000427CF    call        kernel32.MulDiv
 000427D4    mov         dword ptr [esp+4],eax
>000427D8    jmp         000427E1
 000427DA    mov         eax,dword ptr [esi+34]
 000427DD    mov         dword ptr [esp+4],eax
 000427E1    test        bl,4
>000427E4    je          0004281E
 000427E6    test        byte ptr [esi+41],1
>000427EA    jne         0004281E
 000427EC    test        bl,1
>000427EF    je          0004280A
 000427F1    mov         eax,dword ptr [esp]
 000427F4    push        eax
 000427F5    push        edi
 000427F6    mov         eax,dword ptr [esi+30]
 000427F9    add         eax,dword ptr [esi+38]
 000427FC    push        eax
 000427FD    call        kernel32.MulDiv
 00042802    sub         eax,ebp
 00042804    mov         dword ptr [esp+8],eax
>00042808    jmp         00042825
 0004280A    mov         eax,dword ptr [esp]
 0004280D    push        eax
 0004280E    push        edi
 0004280F    mov         eax,dword ptr [esi+38]
 00042812    push        eax
 00042813    call        kernel32.MulDiv
 00042818    mov         dword ptr [esp+8],eax
>0004281C    jmp         00042825
 0004281E    mov         eax,dword ptr [esi+38]
 00042821    mov         dword ptr [esp+8],eax
 00042825    test        bl,8
 00042828    setne       al
 0004282B    test        al,al
>0004282D    je          00042866
 0004282F    test        byte ptr [esi+41],2
>00042833    jne         00042866
 00042835    test        bl,8
 00042838    setne       dl
 0004283B    test        al,al
>0004283D    je          00042856
 0004283F    mov         eax,dword ptr [esp]
 00042842    push        eax
 00042843    push        edi
 00042844    mov         eax,dword ptr [esi+34]
 00042847    add         eax,dword ptr [esi+3C]
 0004284A    push        eax
 0004284B    call        kernel32.MulDiv
 00042850    sub         eax,dword ptr [esp+4]
>00042854    jmp         00042869
 00042856    mov         eax,dword ptr [esp]
 00042859    push        eax
 0004285A    push        edi
 0004285B    mov         eax,dword ptr [esi+34]
 0004285E    push        eax
 0004285F    call        kernel32.MulDiv
>00042864    jmp         00042869
 00042866    mov         eax,dword ptr [esi+3C]
 00042869    mov         edx,dword ptr [esp+8]
 0004286D    push        edx
 0004286E    push        eax
 0004286F    mov         ecx,dword ptr [esp+0C]
 00042873    mov         edx,ebp
 00042875    mov         eax,esi
 00042877    mov         ebp,dword ptr [eax]
 00042879    call        dword ptr [ebp+80]
 0004287F    cmp         byte ptr [esi+49],0
>00042883    jne         000428A8
 00042885    test        bl,10
>00042888    je          000428A8
 0004288A    mov         eax,dword ptr [esp]
 0004288D    push        eax
 0004288E    push        edi
 0004288F    mov         ebx,dword ptr [esi+58]
 00042892    mov         eax,ebx
 00042894    call        TFont.GetSize
 00042899    push        eax
 0004289A    call        kernel32.MulDiv
 0004289F    mov         edx,eax
 000428A1    mov         eax,ebx
 000428A3    call        TFont.SetSize
 000428A8    mov         al,[000428C0]
 000428AD    mov         byte ptr [esi+84],al
 000428B3    add         esp,0C
 000428B6    pop         ebp
 000428B7    pop         edi
 000428B8    pop         esi
 000428B9    pop         ebx
 000428BA    ret
*}
end;

//000428C4
procedure TControl.SetAutoSize(Value:Boolean);
begin
{*
 000428C4    push        ebx
 000428C5    cmp         dl,byte ptr [eax+4C]
>000428C8    je          000428DA
 000428CA    mov         byte ptr [eax+4C],dl
 000428CD    test        dl,dl
>000428CF    je          000428DA
 000428D1    mov         bx,0FFEF
 000428D5    call        @CallDynaInst
 000428DA    pop         ebx
 000428DB    ret
*}
end;

//000428DC
procedure TControl.SetName(const Value:TComponentName);
begin
{*
 000428DC    push        ebp
 000428DD    mov         ebp,esp
 000428DF    add         esp,0FFFFFFF8
 000428E2    push        ebx
 000428E3    push        esi
 000428E4    push        edi
 000428E5    xor         ecx,ecx
 000428E7    mov         dword ptr [ebp-8],ecx
 000428EA    mov         dword ptr [ebp-4],edx
 000428ED    mov         edi,eax
 000428EF    xor         eax,eax
 000428F1    push        ebp
 000428F2    push        4296C
 000428F7    push        dword ptr fs:[eax]
 000428FA    mov         dword ptr fs:[eax],esp
 000428FD    test        byte ptr [edi+40],20
>00042901    je          00042938
 00042903    lea         edx,[ebp-8]
 00042906    mov         eax,edi
 00042908    call        TControl.GetText
 0004290D    mov         edx,dword ptr [ebp-8]
 00042910    mov         eax,dword ptr [edi+8]
 00042913    call        @LStrCmp
>00042918    jne         00042938
 0004291A    mov         esi,dword ptr [edi+4]
 0004291D    test        esi,esi
>0004291F    je          0004293C
 00042921    mov         eax,esi
 00042923    mov         edx,dword ptr ds:[3EB50];TControl
 00042929    call        @IsClass
 0004292E    test        al,al
>00042930    je          0004293C
 00042932    test        byte ptr [esi+20],1
>00042936    je          0004293C
 00042938    xor         ebx,ebx
>0004293A    jmp         0004293E
 0004293C    mov         bl,1
 0004293E    mov         edx,dword ptr [ebp-4]
 00042941    mov         eax,edi
 00042943    call        TComponent.SetName
 00042948    test        bl,bl
>0004294A    je          00042956
 0004294C    mov         edx,dword ptr [ebp-4]
 0004294F    mov         eax,edi
 00042951    call        TControl.SetText
 00042956    xor         eax,eax
 00042958    pop         edx
 00042959    pop         ecx
 0004295A    pop         ecx
 0004295B    mov         dword ptr fs:[eax],edx
 0004295E    push        42973
 00042963    lea         eax,[ebp-8]
 00042966    call        @LStrClr
 0004296B    ret
>0004296C    jmp         @HandleFinally
>00042971    jmp         00042963
 00042973    pop         edi
 00042974    pop         esi
 00042975    pop         ebx
 00042976    pop         ecx
 00042977    pop         ecx
 00042978    pop         ebp
 00042979    ret
*}
end;

//0004297C
procedure TControl.SetClientSize(Value:TPoint);
begin
{*
 0004297C    push        ebx
 0004297D    push        esi
 0004297E    push        edi
 0004297F    add         esp,0FFFFFFE8
 00042982    mov         esi,edx
 00042984    lea         edi,[esp]
 00042987    movs        dword ptr [edi],dword ptr [esi]
 00042988    movs        dword ptr [edi],dword ptr [esi]
 00042989    mov         ebx,eax
 0004298B    lea         edx,[esp+8]
 0004298F    mov         eax,ebx
 00042991    mov         ecx,dword ptr [eax]
 00042993    call        dword ptr [ecx+44]
 00042996    mov         eax,dword ptr [ebx+38]
 00042999    sub         eax,dword ptr [esp+10]
 0004299D    add         eax,dword ptr [esp]
 000429A0    push        eax
 000429A1    mov         eax,dword ptr [ebx+3C]
 000429A4    sub         eax,dword ptr [esp+18]
 000429A8    add         eax,dword ptr [esp+8]
 000429AC    push        eax
 000429AD    mov         ecx,dword ptr [ebx+34]
 000429B0    mov         edx,dword ptr [ebx+30]
 000429B3    mov         eax,ebx
 000429B5    mov         ebx,dword ptr [eax]
 000429B7    call        dword ptr [ebx+80]
 000429BD    add         esp,18
 000429C0    pop         edi
 000429C1    pop         esi
 000429C2    pop         ebx
 000429C3    ret
*}
end;

//000429C4
procedure TControl.SetParent(AParent:TWinControl);
begin
{*
 000429C4    push        ebp
 000429C5    mov         ebp,esp
 000429C7    push        0
 000429C9    push        ebx
 000429CA    push        esi
 000429CB    mov         esi,edx
 000429CD    mov         ebx,eax
 000429CF    xor         eax,eax
 000429D1    push        ebp
 000429D2    push        42A3A
 000429D7    push        dword ptr fs:[eax]
 000429DA    mov         dword ptr fs:[eax],esp
 000429DD    mov         eax,dword ptr [ebx+24]
 000429E0    cmp         esi,eax
>000429E2    je          00042A24
 000429E4    cmp         ebx,eax
>000429E6    jne         00042A09
 000429E8    lea         edx,[ebp-4]
 000429EB    mov         eax,[000B5A60];^SControlParentSetToSelf:TResStringRec
 000429F0    call        LoadResString
 000429F5    mov         ecx,dword ptr [ebp-4]
 000429F8    mov         dl,1
 000429FA    mov         eax,[0001EE64];EInvalidOperation
 000429FF    call        Exception.Create
 00042A04    call        @RaiseExcept
 00042A09    mov         eax,dword ptr [ebx+24]
 00042A0C    test        eax,eax
>00042A0E    je          00042A17
 00042A10    mov         edx,ebx
 00042A12    call        TWinControl.RemoveControl
 00042A17    test        esi,esi
>00042A19    je          00042A24
 00042A1B    mov         edx,ebx
 00042A1D    mov         eax,esi
 00042A1F    call        TWinControl.InsertControl
 00042A24    xor         eax,eax
 00042A26    pop         edx
 00042A27    pop         ecx
 00042A28    pop         ecx
 00042A29    mov         dword ptr fs:[eax],edx
 00042A2C    push        42A41
 00042A31    lea         eax,[ebp-4]
 00042A34    call        @LStrClr
 00042A39    ret
>00042A3A    jmp         @HandleFinally
>00042A3F    jmp         00042A31
 00042A41    pop         esi
 00042A42    pop         ebx
 00042A43    pop         ecx
 00042A44    pop         ebp
 00042A45    ret
*}
end;

//00042A48
procedure TControl.SetVisible(Value:Boolean);
begin
{*
 00042A48    push        ebx
 00042A49    push        esi
 00042A4A    push        ecx
 00042A4B    mov         byte ptr [esp],dl
 00042A4E    mov         esi,eax
 00042A50    mov         al,byte ptr [esi+47]
 00042A53    cmp         al,byte ptr [esp]
>00042A56    je          00042A88
 00042A58    mov         eax,esi
 00042A5A    mov         bx,0FFD3
 00042A5E    call        @CallDynaInst
 00042A63    mov         al,byte ptr [esp]
 00042A66    mov         byte ptr [esi+47],al
 00042A69    push        0
 00042A6B    xor         ecx,ecx
 00042A6D    mov         cl,byte ptr [esp+4]
 00042A71    mov         edx,0B00B
 00042A76    mov         eax,esi
 00042A78    call        TControl.Perform
 00042A7D    mov         eax,esi
 00042A7F    mov         bx,0FFD6
 00042A83    call        @CallDynaInst
 00042A88    pop         edx
 00042A89    pop         esi
 00042A8A    pop         ebx
 00042A8B    ret
*}
end;

//00042A8C
procedure TControl.SetEnabled(Value:Boolean);
begin
{*
 00042A8C    cmp         dl,byte ptr [eax+48]
>00042A8F    je          00042AA2
 00042A91    mov         byte ptr [eax+48],dl
 00042A94    push        0
 00042A96    xor         ecx,ecx
 00042A98    mov         edx,0B00C
 00042A9D    call        TControl.Perform
 00042AA2    ret
*}
end;

//00042AA4
function TControl.GetTextLen:Integer;
begin
{*
 00042AA4    push        0
 00042AA6    xor         ecx,ecx
 00042AA8    mov         edx,0E
 00042AAD    call        TControl.Perform
 00042AB2    ret
*}
end;

//00042AB4
function TControl.GetTextBuf(Buffer:PChar; BufSize:Integer):Integer;
begin
{*
 00042AB4    push        edx
 00042AB5    mov         edx,0D
 00042ABA    call        TControl.Perform
 00042ABF    ret
*}
end;

//00042AC0
function TControl.GetUndockHeight:Integer;
begin
{*
 00042AC0    mov         edx,dword ptr [eax+94]
 00042AC6    test        edx,edx
>00042AC8    jle         00042ACD
 00042ACA    mov         eax,edx
 00042ACC    ret
 00042ACD    mov         eax,dword ptr [eax+3C]
 00042AD0    ret
*}
end;

//00042AD4
function TControl.GetUndockWidth:Integer;
begin
{*
 00042AD4    mov         edx,dword ptr [eax+90]
 00042ADA    test        edx,edx
>00042ADC    jle         00042AE1
 00042ADE    mov         eax,edx
 00042AE0    ret
 00042AE1    mov         eax,dword ptr [eax+38]
 00042AE4    ret
*}
end;

//00042AE8
procedure TControl.SetPopupMenu(Value:TPopupMenu);
begin
{*
 00042AE8    push        ebx
 00042AE9    push        esi
 00042AEA    mov         esi,edx
 00042AEC    mov         ebx,eax
 00042AEE    mov         dword ptr [ebx+70],esi
 00042AF1    test        esi,esi
>00042AF3    je          00042B07
 00042AF5    mov         edx,ebx
 00042AF7    mov         eax,esi
 00042AF9    call        TMenu.ParentBiDiModeChanged
 00042AFE    mov         edx,ebx
 00042B00    mov         eax,esi
 00042B02    call        TComponent.FreeNotification
 00042B07    pop         esi
 00042B08    pop         ebx
 00042B09    ret
*}
end;

//00042B0C
procedure TControl.SetTextBuf(Buffer:PChar);
begin
{*
 00042B0C    push        ebx
 00042B0D    mov         ebx,eax
 00042B0F    push        edx
 00042B10    xor         ecx,ecx
 00042B12    mov         eax,ebx
 00042B14    mov         edx,0C
 00042B19    call        TControl.Perform
 00042B1E    push        0
 00042B20    xor         ecx,ecx
 00042B22    mov         edx,0B012
 00042B27    mov         eax,ebx
 00042B29    call        TControl.Perform
 00042B2E    pop         ebx
 00042B2F    ret
*}
end;

//00042B30
function TControl.GetText:TCaption;
begin
{*
 00042B30    push        ebx
 00042B31    push        esi
 00042B32    push        edi
 00042B33    mov         edi,edx
 00042B35    mov         esi,eax
 00042B37    mov         eax,esi
 00042B39    call        TControl.GetTextLen
 00042B3E    mov         ebx,eax
 00042B40    mov         eax,edi
 00042B42    mov         ecx,ebx
 00042B44    xor         edx,edx
 00042B46    call        @LStrFromPCharLen
 00042B4B    test        ebx,ebx
>00042B4D    je          00042B5B
 00042B4F    lea         ecx,[ebx+1]
 00042B52    mov         edx,dword ptr [edi]
 00042B54    mov         eax,esi
 00042B56    call        TControl.GetTextBuf
 00042B5B    pop         edi
 00042B5C    pop         esi
 00042B5D    pop         ebx
 00042B5E    ret
*}
end;

//00042B60
procedure TControl.SetText(const Value:TCaption);
begin
{*
 00042B60    push        ebp
 00042B61    mov         ebp,esp
 00042B63    push        0
 00042B65    push        ebx
 00042B66    push        esi
 00042B67    mov         esi,edx
 00042B69    mov         ebx,eax
 00042B6B    xor         eax,eax
 00042B6D    push        ebp
 00042B6E    push        42BB5
 00042B73    push        dword ptr fs:[eax]
 00042B76    mov         dword ptr fs:[eax],esp
 00042B79    lea         edx,[ebp-4]
 00042B7C    mov         eax,ebx
 00042B7E    call        TControl.GetText
 00042B83    mov         eax,dword ptr [ebp-4]
 00042B86    mov         edx,esi
 00042B88    call        @LStrCmp
>00042B8D    je          00042B9F
 00042B8F    mov         eax,esi
 00042B91    call        @LStrToPChar
 00042B96    mov         edx,eax
 00042B98    mov         eax,ebx
 00042B9A    call        TControl.SetTextBuf
 00042B9F    xor         eax,eax
 00042BA1    pop         edx
 00042BA2    pop         ecx
 00042BA3    pop         ecx
 00042BA4    mov         dword ptr fs:[eax],edx
 00042BA7    push        42BBC
 00042BAC    lea         eax,[ebp-4]
 00042BAF    call        @LStrClr
 00042BB4    ret
>00042BB5    jmp         @HandleFinally
>00042BBA    jmp         00042BAC
 00042BBC    pop         esi
 00042BBD    pop         ebx
 00042BBE    pop         ecx
 00042BBF    pop         ebp
 00042BC0    ret
*}
end;

//00042BC4
procedure TControl.SetBiDiMode(Value:TBiDiMode);
begin
{*
 00042BC4    cmp         dl,byte ptr [eax+4F]
>00042BC7    je          00042BDE
 00042BC9    mov         byte ptr [eax+4F],dl
 00042BCC    mov         byte ptr [eax+50],0
 00042BD0    push        0
 00042BD2    xor         ecx,ecx
 00042BD4    mov         edx,0B03C
 00042BD9    call        TControl.Perform
 00042BDE    ret
*}
end;

//00042BE0
procedure TControl.FontChanged(Sender:TObject);
begin
{*
 00042BE0    push        ebx
 00042BE1    mov         ebx,eax
 00042BE3    mov         byte ptr [ebx+49],0
 00042BE7    mov         byte ptr [ebx+46],0
 00042BEB    mov         eax,dword ptr [ebx+58]
 00042BEE    call        TFont.GetHeight
 00042BF3    cmp         eax,dword ptr [ebx+78]
>00042BF6    je          00042C0A
 00042BF8    or          byte ptr [ebx+84],10
 00042BFF    mov         eax,dword ptr [ebx+58]
 00042C02    call        TFont.GetHeight
 00042C07    mov         dword ptr [ebx+78],eax
 00042C0A    push        0
 00042C0C    xor         ecx,ecx
 00042C0E    mov         edx,0B00E
 00042C13    mov         eax,ebx
 00042C15    call        TControl.Perform
 00042C1A    pop         ebx
 00042C1B    ret
*}
end;

//00042C1C
procedure TControl.SetFont(Value:TFont);
begin
{*
 00042C1C    push        esi
 00042C1D    mov         esi,eax
 00042C1F    mov         eax,dword ptr [esi+58]
 00042C22    mov         ecx,dword ptr [eax]
 00042C24    call        dword ptr [ecx+8]
 00042C27    pop         esi
 00042C28    ret
*}
end;

//00042C2C
function TControl.IsFontStored(Value:TFont):Boolean;
begin
{*
 00042C2C    cmp         byte ptr [eax+49],0
>00042C30    jne         00042C38
 00042C32    cmp         byte ptr [eax+46],0
>00042C36    je          00042C3B
 00042C38    xor         eax,eax
 00042C3A    ret
 00042C3B    mov         al,1
 00042C3D    ret
*}
end;

//00042C40
function TControl.IsShowHintStored(Value:Boolean):Boolean;
begin
{*
 00042C40    mov         al,byte ptr [eax+86]
 00042C46    xor         al,1
 00042C48    ret
*}
end;

//00042C4C
procedure TGroupBox.IsStoredBiDiMode(Value:TBiDiMode);
begin
{*
 00042C4C    mov         al,byte ptr [eax+50];TGroupBox.FParentBiDiMode:Boolean
 00042C4F    xor         al,1
 00042C51    ret
*}
end;

//00042C54
procedure TControl.SetParentFont(Value:Boolean);
begin
{*
 00042C54    cmp         dl,byte ptr [eax+49]
>00042C57    je          00042C70
 00042C59    mov         byte ptr [eax+49],dl
 00042C5C    cmp         dword ptr [eax+24],0
>00042C60    je          00042C70
 00042C62    push        0
 00042C64    xor         ecx,ecx
 00042C66    mov         edx,0B008
 00042C6B    call        TControl.Perform
 00042C70    ret
*}
end;

//00042C74
procedure TControl.SetShowHint(Value:Boolean);
begin
{*
 00042C74    cmp         dl,byte ptr [eax+85]
>00042C7A    je          00042C97
 00042C7C    mov         byte ptr [eax+85],dl
 00042C82    mov         byte ptr [eax+86],0
 00042C89    push        0
 00042C8B    xor         ecx,ecx
 00042C8D    mov         edx,0B022
 00042C92    call        TControl.Perform
 00042C97    ret
*}
end;

//00042C98
procedure TControl.SetParentShowHint(Value:Boolean);
begin
{*
 00042C98    cmp         dl,byte ptr [eax+86]
>00042C9E    je          00042CBA
 00042CA0    mov         byte ptr [eax+86],dl
 00042CA6    cmp         dword ptr [eax+24],0
>00042CAA    je          00042CBA
 00042CAC    push        0
 00042CAE    xor         ecx,ecx
 00042CB0    mov         edx,0B023
 00042CB5    call        TControl.Perform
 00042CBA    ret
*}
end;

//00042CBC
procedure TControl.SetColor(Value:TColor);
begin
{*
 00042CBC    cmp         edx,dword ptr [eax+64]
>00042CBF    je          00042CD6
 00042CC1    mov         dword ptr [eax+64],edx
 00042CC4    mov         byte ptr [eax+4A],0
 00042CC8    push        0
 00042CCA    xor         ecx,ecx
 00042CCC    mov         edx,0B00D
 00042CD1    call        TControl.Perform
 00042CD6    ret
*}
end;

//00042CD8
procedure TGroupBox.IsStoredColor(Value:TColor);
begin
{*
 00042CD8    mov         al,byte ptr [eax+4A];TGroupBox.FParentColor:Boolean
 00042CDB    xor         al,1
 00042CDD    ret
*}
end;

//00042CE0
procedure TControl.SetParentColor(Value:Boolean);
begin
{*
 00042CE0    cmp         dl,byte ptr [eax+4A]
>00042CE3    je          00042CFC
 00042CE5    mov         byte ptr [eax+4A],dl
 00042CE8    cmp         dword ptr [eax+24],0
>00042CEC    je          00042CFC
 00042CEE    push        0
 00042CF0    xor         ecx,ecx
 00042CF2    mov         edx,0B009
 00042CF7    call        TControl.Perform
 00042CFC    ret
*}
end;

//00042D00
procedure TControl.SetParentBiDiMode(Value:Boolean);
begin
{*
 00042D00    cmp         dl,byte ptr [eax+50]
>00042D03    je          00042D1C
 00042D05    mov         byte ptr [eax+50],dl
 00042D08    cmp         dword ptr [eax+24],0
>00042D0C    je          00042D1C
 00042D0E    push        0
 00042D10    xor         ecx,ecx
 00042D12    mov         edx,0B03D
 00042D17    call        TControl.Perform
 00042D1C    ret
*}
end;

//00042D20
procedure TControl.SetCursor(Value:TCursor);
begin
{*
 00042D20    cmp         dx,word ptr [eax+6C]
>00042D24    je          00042D38
 00042D26    mov         word ptr [eax+6C],dx
 00042D2A    push        0
 00042D2C    xor         ecx,ecx
 00042D2E    mov         edx,0B00F
 00042D33    call        TControl.Perform
 00042D38    ret
*}
end;

//00042D3C
function TControl.GetMouseCapture:Boolean;
begin
{*
 00042D3C    push        ebx
 00042D3D    mov         ebx,eax
 00042D3F    call        GetCaptureControl
 00042D44    cmp         ebx,eax
 00042D46    sete        al
 00042D49    pop         ebx
 00042D4A    ret
*}
end;

//00042D4C
procedure TControl.SetMouseCapture(Value:Boolean);
begin
{*
 00042D4C    push        ebx
 00042D4D    push        esi
 00042D4E    mov         ebx,edx
 00042D50    mov         esi,eax
 00042D52    mov         eax,esi
 00042D54    call        TControl.GetMouseCapture
 00042D59    cmp         bl,al
>00042D5B    je          00042D71
 00042D5D    test        bl,bl
>00042D5F    je          00042D6A
 00042D61    mov         eax,esi
 00042D63    call        SetCaptureControl
>00042D68    jmp         00042D71
 00042D6A    xor         eax,eax
 00042D6C    call        SetCaptureControl
 00042D71    pop         esi
 00042D72    pop         ebx
 00042D73    ret
*}
end;

//00042D74
procedure TControl.BringToFront;
begin
{*
 00042D74    push        ebx
 00042D75    mov         dl,1
 00042D77    mov         bx,0FFD4
 00042D7B    call        @CallDynaInst
 00042D80    pop         ebx
 00042D81    ret
*}
end;

//00042D84
procedure TControl.SetZOrderPosition(Position:Integer);
begin
{*
 00042D84    push        ebx
 00042D85    push        esi
 00042D86    push        edi
 00042D87    mov         esi,edx
 00042D89    mov         ebx,eax
 00042D8B    mov         eax,dword ptr [ebx+24]
 00042D8E    test        eax,eax
>00042D90    je          00042DFE
 00042D92    mov         eax,dword ptr [eax+128]
 00042D98    mov         edx,ebx
 00042D9A    call        TList.IndexOf
 00042D9F    test        eax,eax
>00042DA1    jl          00042DFE
 00042DA3    mov         edx,dword ptr [ebx+24]
 00042DA6    mov         edi,dword ptr [edx+128]
 00042DAC    mov         edx,dword ptr [edi+8]
 00042DAF    test        esi,esi
>00042DB1    jge         00042DB5
 00042DB3    xor         esi,esi
 00042DB5    cmp         edx,esi
>00042DB7    jg          00042DBC
 00042DB9    mov         esi,edx
 00042DBB    dec         esi
 00042DBC    cmp         eax,esi
>00042DBE    je          00042DFE
 00042DC0    mov         edx,edi
 00042DC2    xchg        eax,edx
 00042DC3    call        TList.Delete
 00042DC8    mov         eax,dword ptr [ebx+24]
 00042DCB    mov         eax,dword ptr [eax+128]
 00042DD1    mov         ecx,ebx
 00042DD3    mov         edx,esi
 00042DD5    call        TList.Insert
 00042DDA    mov         cl,1
 00042DDC    mov         dl,byte ptr [ebx+47]
 00042DDF    mov         eax,ebx
 00042DE1    call        TControl.InvalidateControl
 00042DE6    mov         eax,ebx
 00042DE8    call        ValidParentForm
 00042DED    test        byte ptr [eax+44],4
>00042DF1    je          00042DFE
 00042DF3    mov         dl,1
 00042DF5    mov         bx,0FFD7
 00042DF9    call        @CallDynaInst
 00042DFE    pop         edi
 00042DFF    pop         esi
 00042E00    pop         ebx
 00042E01    ret
*}
end;

//00042E04
procedure TControl.SetZOrder(TopMost:Boolean);
begin
{*
 00042E04    mov         ecx,dword ptr [eax+24]
 00042E07    test        ecx,ecx
>00042E09    je          00042E27
 00042E0B    test        dl,dl
>00042E0D    je          00042E20
 00042E0F    mov         edx,dword ptr [ecx+128]
 00042E15    mov         edx,dword ptr [edx+8]
 00042E18    dec         edx
 00042E19    call        TControl.SetZOrderPosition
>00042E1E    jmp         00042E27
 00042E20    xor         edx,edx
 00042E22    call        TControl.SetZOrderPosition
 00042E27    ret
*}
end;

//00042E28
function TControl.GetDeviceContext(var WindowHandle:HWND):HDC;
begin
{*
 00042E28    push        ebp
 00042E29    mov         ebp,esp
 00042E2B    add         esp,0FFFFFFF4
 00042E2E    push        ebx
 00042E2F    push        esi
 00042E30    xor         ecx,ecx
 00042E32    mov         dword ptr [ebp-0C],ecx
 00042E35    mov         ebx,eax
 00042E37    xor         eax,eax
 00042E39    push        ebp
 00042E3A    push        42EBE
 00042E3F    push        dword ptr fs:[eax]
 00042E42    mov         dword ptr fs:[eax],esp
 00042E45    cmp         dword ptr [ebx+24],0
>00042E49    jne         00042E7C
 00042E4B    mov         eax,dword ptr [ebx+8]
 00042E4E    mov         dword ptr [ebp-8],eax
 00042E51    mov         byte ptr [ebp-4],0B
 00042E55    lea         eax,[ebp-8]
 00042E58    push        eax
 00042E59    push        0
 00042E5B    lea         edx,[ebp-0C]
 00042E5E    mov         eax,[000B5A5C];^SParentRequired:TResStringRec
 00042E63    call        LoadResString
 00042E68    mov         ecx,dword ptr [ebp-0C]
 00042E6B    mov         dl,1
 00042E6D    mov         eax,[0001EE64];EInvalidOperation
 00042E72    call        Exception.CreateFmt
 00042E77    call        @RaiseExcept
 00042E7C    mov         eax,dword ptr [ebx+24]
 00042E7F    mov         ecx,dword ptr [eax]
 00042E81    call        dword ptr [ecx+48]
 00042E84    mov         esi,eax
 00042E86    push        0
 00042E88    mov         eax,dword ptr [ebx+34]
 00042E8B    push        eax
 00042E8C    mov         eax,dword ptr [ebx+30]
 00042E8F    push        eax
 00042E90    push        esi
 00042E91    call        gdi32.SetViewportOrgEx
 00042E96    mov         eax,dword ptr [ebx+3C]
 00042E99    push        eax
 00042E9A    mov         eax,dword ptr [ebx+38]
 00042E9D    push        eax
 00042E9E    push        0
 00042EA0    push        0
 00042EA2    push        esi
 00042EA3    call        gdi32.IntersectClipRect
 00042EA8    xor         eax,eax
 00042EAA    pop         edx
 00042EAB    pop         ecx
 00042EAC    pop         ecx
 00042EAD    mov         dword ptr fs:[eax],edx
 00042EB0    push        42EC5
 00042EB5    lea         eax,[ebp-0C]
 00042EB8    call        @LStrClr
 00042EBD    ret
>00042EBE    jmp         @HandleFinally
>00042EC3    jmp         00042EB5
 00042EC5    mov         eax,esi
 00042EC7    pop         esi
 00042EC8    pop         ebx
 00042EC9    mov         esp,ebp
 00042ECB    pop         ebp
 00042ECC    ret
*}
end;

//00042ED0
function BackgroundClipped:Boolean;
begin
{*
 00042ED0    push        ebp
 00042ED1    mov         ebp,esp
 00042ED3    add         esp,0FFFFFFDC
 00042ED6    push        ebx
 00042ED7    push        esi
 00042ED8    push        edi
 00042ED9    mov         byte ptr [ebp-1],1
 00042EDD    mov         eax,dword ptr [ebp+8]
 00042EE0    mov         eax,dword ptr [eax-4]
 00042EE3    mov         eax,dword ptr [eax+24]
 00042EE6    mov         edi,dword ptr [eax+128]
 00042EEC    mov         eax,dword ptr [ebp+8]
 00042EEF    mov         edx,dword ptr [eax-4]
 00042EF2    mov         eax,edi
 00042EF4    call        TList.IndexOf
 00042EF9    mov         esi,eax
 00042EFB    test        esi,esi
>00042EFD    jle         00042F4D
 00042EFF    dec         esi
 00042F00    mov         edx,esi
 00042F02    mov         eax,edi
 00042F04    call        TList.Get
 00042F09    mov         ebx,eax
 00042F0B    cmp         byte ptr [ebx+47],0
>00042F0F    je          00042F49
 00042F11    test        byte ptr [ebx+40],40
>00042F15    je          00042F49
 00042F17    lea         edx,[ebp-24]
 00042F1A    mov         eax,ebx
 00042F1C    call        TControl.GetBoundsRect
 00042F21    lea         eax,[ebp-24]
 00042F24    push        eax
 00042F25    mov         eax,dword ptr [ebp+8]
 00042F28    add         eax,0FFFFFFEC
 00042F2B    push        eax
 00042F2C    lea         eax,[ebp-14]
 00042F2F    push        eax
 00042F30    call        user32.IntersectRect
 00042F35    mov         eax,dword ptr [ebp+8]
 00042F38    add         eax,0FFFFFFEC
 00042F3B    push        eax
 00042F3C    lea         eax,[ebp-14]
 00042F3F    push        eax
 00042F40    call        user32.EqualRect
 00042F45    test        eax,eax
>00042F47    jne         00042F51
 00042F49    test        esi,esi
>00042F4B    jg          00042EFF
 00042F4D    mov         byte ptr [ebp-1],0
 00042F51    mov         al,byte ptr [ebp-1]
 00042F54    pop         edi
 00042F55    pop         esi
 00042F56    pop         ebx
 00042F57    mov         esp,ebp
 00042F59    pop         ebp
 00042F5A    ret
*}
end;

//00042F5C
procedure TControl.InvalidateControl(IsVisible:Boolean; IsOpaque:Boolean);
begin
{*
 00042F5C    push        ebp
 00042F5D    mov         ebp,esp
 00042F5F    add         esp,0FFFFFFE8
 00042F62    push        ebx
 00042F63    mov         byte ptr [ebp-15],cl
 00042F66    mov         ebx,edx
 00042F68    mov         dword ptr [ebp-4],eax
 00042F6B    test        bl,bl
>00042F6D    jne         00042F81
 00042F6F    mov         eax,dword ptr [ebp-4]
 00042F72    test        byte ptr [eax+20],10
>00042F76    je          00042FE1
 00042F78    mov         eax,dword ptr [ebp-4]
 00042F7B    test        byte ptr [eax+41],4
>00042F7F    jne         00042FE1
 00042F81    mov         eax,dword ptr [ebp-4]
 00042F84    cmp         dword ptr [eax+24],0
>00042F88    je          00042FE1
 00042F8A    mov         eax,dword ptr [ebp-4]
 00042F8D    mov         eax,dword ptr [eax+24]
 00042F90    call        TWinControl.HandleAllocated
 00042F95    test        al,al
>00042F97    je          00042FE1
 00042F99    lea         edx,[ebp-14]
 00042F9C    mov         eax,dword ptr [ebp-4]
 00042F9F    call        TControl.GetBoundsRect
 00042FA4    cmp         byte ptr [ebp-15],0
>00042FA8    jne         00042FC1
 00042FAA    mov         eax,dword ptr [ebp-4]
 00042FAD    mov         eax,dword ptr [eax+24]
 00042FB0    test        byte ptr [eax+40],40
>00042FB4    jne         00042FC1
 00042FB6    push        ebp
 00042FB7    call        BackgroundClipped
 00042FBC    pop         ecx
 00042FBD    test        al,al
>00042FBF    je          00042FC5
 00042FC1    xor         eax,eax
>00042FC3    jmp         00042FC7
 00042FC5    mov         al,1
 00042FC7    neg         al
 00042FC9    sbb         eax,eax
 00042FCB    push        eax
 00042FCC    lea         eax,[ebp-14]
 00042FCF    push        eax
 00042FD0    mov         eax,dword ptr [ebp-4]
 00042FD3    mov         eax,dword ptr [eax+24]
 00042FD6    call        TWinControl.GetHandle
 00042FDB    push        eax
 00042FDC    call        user32.InvalidateRect
 00042FE1    pop         ebx
 00042FE2    mov         esp,ebp
 00042FE4    pop         ebp
 00042FE5    ret
*}
end;

//00042FE8
procedure TControl.Invalidate;
begin
{*
 00042FE8    test        byte ptr [eax+40],40
 00042FEC    setne       cl
 00042FEF    mov         dl,byte ptr [eax+47]
 00042FF2    call        TControl.InvalidateControl
 00042FF7    ret
*}
end;

//00042FF8
procedure TControl.Update;
begin
{*
 00042FF8    push        esi
 00042FF9    mov         esi,dword ptr [eax+24]
 00042FFC    test        esi,esi
>00042FFE    je          0004300A
 00043000    mov         eax,esi
 00043002    mov         edx,dword ptr [eax]
 00043004    call        dword ptr [edx+84]
 0004300A    pop         esi
 0004300B    ret
*}
end;

//0004300C
procedure TControl.Refresh;
begin
{*
 0004300C    mov         edx,dword ptr [eax]
 0004300E    call        dword ptr [edx+7C]
 00043011    ret
*}
end;

//00043014
procedure TControl.Repaint;
begin
{*
 00043014    push        ebp
 00043015    mov         ebp,esp
 00043017    add         esp,0FFFFFFF8
 0004301A    push        ebx
 0004301B    mov         dword ptr [ebp-4],eax
 0004301E    mov         eax,dword ptr [ebp-4]
 00043021    cmp         byte ptr [eax+47],0
>00043025    jne         00043041
 00043027    mov         eax,dword ptr [ebp-4]
 0004302A    test        byte ptr [eax+20],10
>0004302E    je          00043107
 00043034    mov         eax,dword ptr [ebp-4]
 00043037    test        byte ptr [eax+41],4
>0004303B    jne         00043107
 00043041    mov         eax,dword ptr [ebp-4]
 00043044    cmp         dword ptr [eax+24],0
>00043048    je          00043107
 0004304E    mov         eax,dword ptr [ebp-4]
 00043051    mov         eax,dword ptr [eax+24]
 00043054    call        TWinControl.HandleAllocated
 00043059    test        al,al
>0004305B    je          00043107
 00043061    mov         eax,dword ptr [ebp-4]
 00043064    test        byte ptr [eax+40],40
>00043068    je          000430F4
 0004306E    mov         eax,dword ptr [ebp-4]
 00043071    mov         eax,dword ptr [eax+24]
 00043074    call        TWinControl.GetHandle
 00043079    push        eax
 0004307A    call        user32.GetDC
 0004307F    mov         dword ptr [ebp-8],eax
 00043082    xor         ecx,ecx
 00043084    push        ebp
 00043085    push        430ED
 0004308A    push        dword ptr fs:[ecx]
 0004308D    mov         dword ptr fs:[ecx],esp
 00043090    mov         edx,dword ptr [ebp-4]
 00043093    mov         edx,dword ptr [edx+34]
 00043096    mov         ecx,edx
 00043098    mov         ebx,dword ptr [ebp-4]
 0004309B    add         ecx,dword ptr [ebx+3C]
 0004309E    push        ecx
 0004309F    mov         eax,dword ptr [ebp-4]
 000430A2    mov         eax,dword ptr [eax+30]
 000430A5    mov         ecx,eax
 000430A7    mov         ebx,dword ptr [ebp-4]
 000430AA    add         ecx,dword ptr [ebx+38]
 000430AD    push        ecx
 000430AE    push        edx
 000430AF    push        eax
 000430B0    mov         eax,dword ptr [ebp-8]
 000430B3    push        eax
 000430B4    call        gdi32.IntersectClipRect
 000430B9    mov         eax,dword ptr [ebp-4]
 000430BC    mov         eax,dword ptr [eax+24]
 000430BF    mov         ecx,dword ptr [ebp-4]
 000430C2    mov         edx,dword ptr [ebp-8]
 000430C5    call        TWinControl.PaintControls
 000430CA    xor         eax,eax
 000430CC    pop         edx
 000430CD    pop         ecx
 000430CE    pop         ecx
 000430CF    mov         dword ptr fs:[eax],edx
 000430D2    push        43107
 000430D7    mov         eax,dword ptr [ebp-8]
 000430DA    push        eax
 000430DB    mov         eax,dword ptr [ebp-4]
 000430DE    mov         eax,dword ptr [eax+24]
 000430E1    call        TWinControl.GetHandle
 000430E6    push        eax
 000430E7    call        user32.ReleaseDC
 000430EC    ret
>000430ED    jmp         @HandleFinally
>000430F2    jmp         000430D7
 000430F4    mov         eax,dword ptr [ebp-4]
 000430F7    mov         edx,dword ptr [eax]
 000430F9    call        dword ptr [edx+78]
 000430FC    mov         eax,dword ptr [ebp-4]
 000430FF    mov         edx,dword ptr [eax]
 00043101    call        dword ptr [edx+84]
 00043107    pop         ebx
 00043108    pop         ecx
 00043109    pop         ecx
 0004310A    pop         ebp
 0004310B    ret
*}
end;

//0004310C
procedure TControl.sub_0004310C;
begin
{*
 0004310C    xor         eax,eax
 0004310E    ret
*}
end;

//00043110
function TControl.UseRightToLeftReading:Boolean;
begin
{*
 00043110    mov         edx,dword ptr ds:[0B5C08];SysLocale:TSysLocale
 00043116    cmp         byte ptr [edx+9],0
>0004311A    je          00043122
 0004311C    cmp         byte ptr [eax+4F],0
>00043120    jne         00043125
 00043122    xor         eax,eax
 00043124    ret
 00043125    mov         al,1
 00043127    ret
*}
end;

//00043128
procedure TControl.UseRightToLeftAlignment;
begin
{*
 00043128    mov         edx,dword ptr ds:[0B5C08];SysLocale:TSysLocale
 0004312E    cmp         byte ptr [edx+9],0
>00043132    je          0004313A
 00043134    cmp         byte ptr [eax+4F],1
>00043138    je          0004313D
 0004313A    xor         eax,eax
 0004313C    ret
 0004313D    mov         al,1
 0004313F    ret
*}
end;

//00043140
function TControl.UseRightToLeftScrollBar:Boolean;
begin
{*
 00043140    mov         edx,dword ptr ds:[0B5C08];SysLocale:TSysLocale
 00043146    cmp         byte ptr [edx+9],0
>0004314A    je          00043154
 0004314C    mov         al,byte ptr [eax+4F]
 0004314F    dec         eax
 00043150    sub         al,2
>00043152    jb          00043157
 00043154    xor         eax,eax
 00043156    ret
 00043157    mov         al,1
 00043159    ret
*}
end;

//0004315C
procedure TControl.BeginAutoDrag;
begin
{*
 0004315C    mov         edx,dword ptr ds:[0B672C]
 00043162    mov         ecx,dword ptr [edx+8]
 00043165    mov         edx,dword ptr ds:[0B672C]
 0004316B    mov         dl,byte ptr [edx+4]
 0004316E    call        TControl.BeginDrag
 00043173    ret
*}
end;

//00043174
procedure TControl.BeginDrag(Immediate:Boolean; Threshold:Integer);
begin
{*
 00043174    push        ebp
 00043175    mov         ebp,esp
 00043177    add         esp,0FFFFFFEC
 0004317A    push        ebx
 0004317B    push        esi
 0004317C    push        edi
 0004317D    xor         ebx,ebx
 0004317F    mov         dword ptr [ebp-0C],ebx
 00043182    mov         esi,ecx
 00043184    mov         ebx,edx
 00043186    mov         edi,eax
 00043188    xor         eax,eax
 0004318A    push        ebp
 0004318B    push        43266
 00043190    push        dword ptr fs:[eax]
 00043193    mov         dword ptr fs:[eax],esp
 00043196    mov         eax,edi
 00043198    mov         edx,dword ptr ds:[55208];TCustomForm
 0004319E    call        @IsClass
 000431A3    test        al,al
>000431A5    je          000431D1
 000431A7    cmp         byte ptr [edi+87],1
>000431AE    je          000431D1
 000431B0    lea         edx,[ebp-0C]
 000431B3    mov         eax,[000B5A44];^SCannotDragForm:TResStringRec
 000431B8    call        LoadResString
 000431BD    mov         ecx,dword ptr [ebp-0C]
 000431C0    mov         dl,1
 000431C2    mov         eax,[0001EE64];EInvalidOperation
 000431C7    call        Exception.Create
 000431CC    call        @RaiseExcept
 000431D1    mov         eax,edi
 000431D3    call        TControl.CalcDockSizes
 000431D8    cmp         dword ptr ds:[0B673C],0
>000431DF    je          000431EA
 000431E1    cmp         dword ptr ds:[0B673C],0FFFFFFFF
>000431E8    jne         00043250
 000431EA    xor         eax,eax
 000431EC    mov         [000B673C],eax
 000431F1    test        byte ptr [edi+44],1
>000431F5    je          00043230
 000431F7    lea         eax,[ebp-8]
 000431FA    push        eax
 000431FB    call        user32.GetCursorPos
 00043200    lea         ecx,[ebp-14]
 00043203    lea         edx,[ebp-8]
 00043206    mov         eax,edi
 00043208    call        TControl.ScreenToClient
 0004320D    mov         eax,dword ptr [ebp-14]
 00043210    mov         dword ptr [ebp-8],eax
 00043213    mov         eax,dword ptr [ebp-10]
 00043216    mov         dword ptr [ebp-4],eax
 00043219    lea         eax,[ebp-8]
 0004321C    call        PointToSmallPoint
 00043221    push        eax
 00043222    xor         ecx,ecx
 00043224    mov         edx,202
 00043229    mov         eax,edi
 0004322B    call        TControl.Perform
 00043230    test        esi,esi
>00043232    jge         0004323C
 00043234    mov         eax,[000B672C]
 00043239    mov         esi,dword ptr [eax+8]
 0004323C    cmp         dword ptr ds:[0B673C],0FFFFFFFF
>00043243    je          00043250
 00043245    mov         ecx,esi
 00043247    mov         edx,ebx
 00043249    mov         eax,edi
 0004324B    call        DragInitControl
 00043250    xor         eax,eax
 00043252    pop         edx
 00043253    pop         ecx
 00043254    pop         ecx
 00043255    mov         dword ptr fs:[eax],edx
 00043258    push        4326D
 0004325D    lea         eax,[ebp-0C]
 00043260    call        @LStrClr
 00043265    ret
>00043266    jmp         @HandleFinally
>0004326B    jmp         0004325D
 0004326D    pop         edi
 0004326E    pop         esi
 0004326F    pop         ebx
 00043270    mov         esp,ebp
 00043272    pop         ebp
 00043273    ret
*}
end;

//00043274
procedure TControl.sub_00043274;
begin
{*
 00043274    ret
*}
end;

//00043278
function TControl.Dragging:Boolean;
begin
{*
 00043278    cmp         eax,dword ptr ds:[0B673C]
 0004327E    sete        al
 00043281    ret
*}
end;

//00043284
procedure TControl.DragOver(Source:TObject; X:Integer; Y:Integer; State:TDragState; var Accept:Boolean);
begin
{*
 00043284    push        ebp
 00043285    mov         ebp,esp
 00043287    push        ebx
 00043288    push        esi
 00043289    mov         esi,dword ptr [ebp+8]
 0004328C    mov         byte ptr [esi],0
 0004328F    cmp         word ptr [eax+0D6],0
>00043297    je          000432B8
 00043299    mov         byte ptr [esi],1
 0004329C    push        ecx
 0004329D    mov         ecx,dword ptr [ebp+10]
 000432A0    push        ecx
 000432A1    mov         cl,byte ptr [ebp+0C]
 000432A4    push        ecx
 000432A5    push        esi
 000432A6    mov         ebx,eax
 000432A8    mov         ecx,edx
 000432AA    mov         edx,eax
 000432AC    mov         eax,dword ptr [ebx+0D8]
 000432B2    call        dword ptr [ebx+0D4]
 000432B8    pop         esi
 000432B9    pop         ebx
 000432BA    pop         ebp
 000432BB    ret         0C
*}
end;

//000432C0
procedure TControl.DragDrop(Source:TObject; X:Integer; Y:Integer);
begin
{*
 000432C0    push        ebp
 000432C1    mov         ebp,esp
 000432C3    push        ebx
 000432C4    cmp         word ptr [eax+0CE],0
>000432CC    je          000432E5
 000432CE    push        ecx
 000432CF    mov         ecx,dword ptr [ebp+8]
 000432D2    push        ecx
 000432D3    mov         ebx,eax
 000432D5    mov         ecx,edx
 000432D7    mov         edx,eax
 000432D9    mov         eax,dword ptr [ebx+0D0]
 000432DF    call        dword ptr [ebx+0CC]
 000432E5    pop         ebx
 000432E6    pop         ebp
 000432E7    ret         4
*}
end;

//000432EC
procedure TControl.DoStartDrag(var DragObject:TDragObject);
begin
{*
 000432EC    push        ebx
 000432ED    cmp         word ptr [eax+0F6],0
>000432F5    je          00043309
 000432F7    mov         ecx,edx
 000432F9    mov         ebx,eax
 000432FB    mov         edx,eax
 000432FD    mov         eax,dword ptr [ebx+0F8]
 00043303    call        dword ptr [ebx+0F4]
 00043309    pop         ebx
 0004330A    ret
*}
end;

//0004330C
procedure TControl.DoEndDrag(Target:TObject; X:Integer; Y:Integer);
begin
{*
 0004330C    push        ebp
 0004330D    mov         ebp,esp
 0004330F    push        ebx
 00043310    cmp         word ptr [eax+0FE],0
>00043318    je          00043331
 0004331A    push        ecx
 0004331B    mov         ecx,dword ptr [ebp+8]
 0004331E    push        ecx
 0004331F    mov         ebx,eax
 00043321    mov         ecx,edx
 00043323    mov         edx,eax
 00043325    mov         eax,dword ptr [ebx+100]
 0004332B    call        dword ptr [ebx+0FC]
 00043331    pop         ebx
 00043332    pop         ebp
 00043333    ret         4
*}
end;

//00043338
procedure TControl.PositionDockRect(DragDockObject:TDragDockObject);
begin
{*
 00043338    push        ebx
 00043339    push        esi
 0004333A    push        edi
 0004333B    push        ebp
 0004333C    add         esp,0FFFFFFEC
 0004333F    mov         ebx,edx
 00043341    cmp         dword ptr [ebx+4],0
>00043345    je          00043353
 00043347    mov         eax,dword ptr [ebx+4]
 0004334A    cmp         byte ptr [eax+180],0
>00043351    jne         000433C0
 00043353    mov         eax,dword ptr [ebx+30]
 00043356    call        TControl.GetUndockWidth
 0004335B    mov         edi,eax
 0004335D    mov         eax,dword ptr [ebx+30]
 00043360    call        TControl.GetUndockHeight
 00043365    mov         ebp,eax
 00043367    mov         dword ptr [esp+10],edi
 0004336B    fild        dword ptr [esp+10]
 0004336F    fmul        qword ptr [ebx+1C]
 00043372    fild        dword ptr [ebx+0C]
 00043375    fsubrp      st(1),st
 00043377    fstp        qword ptr [esp]
 0004337A    wait
 0004337B    mov         dword ptr [esp+10],ebp
 0004337F    fild        dword ptr [esp+10]
 00043383    fmul        qword ptr [ebx+24]
 00043386    fild        dword ptr [ebx+10]
 00043389    fsubrp      st(1),st
 0004338B    fstp        qword ptr [esp+8]
 0004338F    wait
 00043390    lea         esi,[ebx+38]
 00043393    fld         qword ptr [esp]
 00043396    call        @ROUND
 0004339B    mov         dword ptr [esi],eax
 0004339D    fld         qword ptr [esp+8]
 000433A1    call        @ROUND
 000433A6    mov         dword ptr [esi+4],eax
 000433A9    add         edi,dword ptr [esi]
 000433AB    mov         dword ptr [esi+8],edi
 000433AE    add         ebp,dword ptr [esi+4]
 000433B1    mov         dword ptr [esi+0C],ebp
 000433B4    lea         edx,[ebx+38]
 000433B7    mov         eax,ebx
 000433B9    mov         ecx,dword ptr [eax]
 000433BB    call        dword ptr [ecx+28]
>000433BE    jmp         00043400
 000433C0    lea         eax,[ebx+38]
 000433C3    push        eax
 000433C4    mov         eax,dword ptr [ebx+4]
 000433C7    call        TWinControl.GetHandle
 000433CC    push        eax
 000433CD    call        user32.GetWindowRect
 000433D2    mov         eax,dword ptr [ebx+4]
 000433D5    cmp         byte ptr [eax+180],0
>000433DC    je          00043400
 000433DE    cmp         dword ptr [eax+13C],0
>000433E5    je          00043400
 000433E7    mov         dl,byte ptr [ebx+48]
 000433EA    push        edx
 000433EB    lea         edx,[ebx+38]
 000433EE    push        edx
 000433EF    mov         eax,dword ptr [eax+13C]
 000433F5    mov         ecx,dword ptr [ebx+4C]
 000433F8    mov         edx,dword ptr [ebx+30]
 000433FB    mov         ebx,dword ptr [eax]
 000433FD    call        dword ptr [ebx+24]
 00043400    add         esp,14
 00043403    pop         ebp
 00043404    pop         edi
 00043405    pop         esi
 00043406    pop         ebx
 00043407    ret
*}
end;

//00043408
procedure TControl.DockTrackNoTarget(Source:TDragDockObject; X:Integer; Y:Integer);
begin
{*
 00043408    push        ebp
 00043409    mov         ebp,esp
 0004340B    push        ebx
 0004340C    push        esi
 0004340D    push        edi
 0004340E    mov         edi,edx
 00043410    mov         esi,eax
 00043412    mov         edx,edi
 00043414    mov         eax,esi
 00043416    mov         bx,0FFD8
 0004341A    call        @CallDynaInst
 0004341F    pop         edi
 00043420    pop         esi
 00043421    pop         ebx
 00043422    pop         ebp
 00043423    ret         4
*}
end;

//00043428
procedure TControl.DoEndDock(Target:TObject; X:Integer; Y:Integer);
begin
{*
 00043428    push        ebp
 00043429    mov         ebp,esp
 0004342B    push        ebx
 0004342C    cmp         word ptr [eax+0EE],0
>00043434    je          0004344D
 00043436    push        ecx
 00043437    mov         ecx,dword ptr [ebp+8]
 0004343A    push        ecx
 0004343B    mov         ebx,eax
 0004343D    mov         ecx,edx
 0004343F    mov         edx,eax
 00043441    mov         eax,dword ptr [ebx+0F0]
 00043447    call        dword ptr [ebx+0EC]
 0004344D    pop         ebx
 0004344E    pop         ebp
 0004344F    ret         4
*}
end;

//00043454
procedure TControl.DoStartDock(var DragObject:TDragObject);
begin
{*
 00043454    push        ebx
 00043455    cmp         word ptr [eax+0E6],0
>0004345D    je          00043471
 0004345F    mov         ecx,edx
 00043461    mov         ebx,eax
 00043463    mov         edx,eax
 00043465    mov         eax,dword ptr [ebx+0E8]
 0004346B    call        dword ptr [ebx+0E4]
 00043471    pop         ebx
 00043472    ret
*}
end;

//00043474
procedure TControl.DefaultDockImage(DragDockObject:TDragDockObject; Erase:Boolean);
begin
{*
 00043474    push        ebp
 00043475    mov         ebp,esp
 00043477    add         esp,0FFFFFFE0
 0004347A    push        ebx
 0004347B    push        esi
 0004347C    push        edi
 0004347D    mov         byte ptr [ebp-1],cl
 00043480    mov         esi,edx
 00043482    mov         eax,esi
 00043484    mov         edx,dword ptr [eax]
 00043486    call        dword ptr [edx+34]
 00043489    mov         ebx,eax
 0004348B    cmp         byte ptr [ebp-1],0
>0004348F    je          000434A2
 00043491    push        esi
 00043492    add         esi,50
 00043495    lea         edi,[ebp-20]
 00043498    mov         ecx,4
 0004349D    rep movs    dword ptr [edi],dword ptr [esi]
 0004349F    pop         esi
>000434A0    jmp         000434B1
 000434A2    push        esi
 000434A3    add         esi,38
 000434A6    lea         edi,[ebp-20]
 000434A9    mov         ecx,4
 000434AE    rep movs    dword ptr [edi],dword ptr [esi]
 000434B0    pop         esi
 000434B1    call        user32.GetDesktopWindow
 000434B6    mov         dword ptr [ebp-8],eax
 000434B9    push        402
 000434BE    push        0
 000434C0    mov         eax,dword ptr [ebp-8]
 000434C3    push        eax
 000434C4    call        user32.GetDCEx
 000434C9    mov         dword ptr [ebp-0C],eax
 000434CC    xor         eax,eax
 000434CE    push        ebp
 000434CF    push        43595
 000434D4    push        dword ptr fs:[eax]
 000434D7    mov         dword ptr fs:[eax],esp
 000434DA    mov         eax,dword ptr [esi+34]
 000434DD    call        TBrush.GetHandle
 000434E2    push        eax
 000434E3    mov         eax,dword ptr [ebp-0C]
 000434E6    push        eax
 000434E7    call        gdi32.SelectObject
 000434EC    mov         dword ptr [ebp-10],eax
 000434EF    push        5A0049
 000434F4    push        ebx
 000434F5    mov         eax,dword ptr [ebp-18]
 000434F8    mov         esi,dword ptr [ebp-20]
 000434FB    sub         eax,esi
 000434FD    sub         eax,ebx
 000434FF    push        eax
 00043500    mov         edi,dword ptr [ebp-1C]
 00043503    push        edi
 00043504    mov         eax,esi
 00043506    add         eax,ebx
 00043508    push        eax
 00043509    mov         eax,dword ptr [ebp-0C]
 0004350C    push        eax
 0004350D    call        gdi32.PatBlt
 00043512    push        5A0049
 00043517    mov         eax,dword ptr [ebp-14]
 0004351A    sub         eax,edi
 0004351C    sub         eax,ebx
 0004351E    push        eax
 0004351F    push        ebx
 00043520    mov         eax,edi
 00043522    add         eax,ebx
 00043524    push        eax
 00043525    mov         eax,dword ptr [ebp-18]
 00043528    sub         eax,ebx
 0004352A    push        eax
 0004352B    mov         eax,dword ptr [ebp-0C]
 0004352E    push        eax
 0004352F    call        gdi32.PatBlt
 00043534    push        5A0049
 00043539    push        ebx
 0004353A    mov         eax,dword ptr [ebp-18]
 0004353D    sub         eax,dword ptr [ebp-20]
 00043540    sub         eax,ebx
 00043542    push        eax
 00043543    mov         eax,dword ptr [ebp-14]
 00043546    sub         eax,ebx
 00043548    push        eax
 00043549    push        esi
 0004354A    mov         eax,dword ptr [ebp-0C]
 0004354D    push        eax
 0004354E    call        gdi32.PatBlt
 00043553    push        5A0049
 00043558    mov         eax,dword ptr [ebp-14]
 0004355B    sub         eax,dword ptr [ebp-1C]
 0004355E    sub         eax,ebx
 00043560    push        eax
 00043561    push        ebx
 00043562    push        edi
 00043563    push        esi
 00043564    mov         eax,dword ptr [ebp-0C]
 00043567    push        eax
 00043568    call        gdi32.PatBlt
 0004356D    mov         eax,dword ptr [ebp-10]
 00043570    push        eax
 00043571    mov         eax,dword ptr [ebp-0C]
 00043574    push        eax
 00043575    call        gdi32.SelectObject
 0004357A    xor         eax,eax
 0004357C    pop         edx
 0004357D    pop         ecx
 0004357E    pop         ecx
 0004357F    mov         dword ptr fs:[eax],edx
 00043582    push        4359C
 00043587    mov         eax,dword ptr [ebp-0C]
 0004358A    push        eax
 0004358B    mov         eax,dword ptr [ebp-8]
 0004358E    push        eax
 0004358F    call        user32.ReleaseDC
 00043594    ret
>00043595    jmp         @HandleFinally
>0004359A    jmp         00043587
 0004359C    pop         edi
 0004359D    pop         esi
 0004359E    pop         ebx
 0004359F    mov         esp,ebp
 000435A1    pop         ebp
 000435A2    ret
*}
end;

//000435A4
procedure TControl.DrawDragDockImage(DragDockObject:TDragDockObject);
begin
{*
 000435A4    push        ebx
 000435A5    xor         ecx,ecx
 000435A7    mov         bx,0FFEA
 000435AB    call        @CallDynaInst
 000435B0    pop         ebx
 000435B1    ret
*}
end;

//000435B4
procedure TControl.EraseDragDockImage(DragDockObject:TDragDockObject);
begin
{*
 000435B4    push        ebx
 000435B5    mov         cl,1
 000435B7    mov         bx,0FFEA
 000435BB    call        @CallDynaInst
 000435C0    pop         ebx
 000435C1    ret
*}
end;

//000435C4
procedure TControl.DoDragMsg(var DragMsg:TCMDrag);
begin
{*
 000435C4    push        ebx
 000435C5    push        esi
 000435C6    push        edi
 000435C7    push        ebp
 000435C8    add         esp,0FFFFFFF0
 000435CB    mov         ebp,edx
 000435CD    mov         dword ptr [esp],eax
 000435D0    mov         edi,dword ptr [ebp+8]
 000435D3    mov         esi,dword ptr [edi+8]
 000435D6    mov         eax,esi
 000435D8    mov         edx,dword ptr ds:[3E0F8];TDragDockObject
 000435DE    call        @IsClass
 000435E3    mov         ebx,eax
 000435E5    cmp         byte ptr ds:[0B6744],0
>000435EC    je          00043602
 000435EE    test        bl,bl
>000435F0    jne         00043602
 000435F2    mov         eax,esi
 000435F4    mov         edx,dword ptr ds:[3E070];TDragControlObject
 000435FA    call        @AsClass
 000435FF    mov         esi,dword ptr [eax+30]
 00043602    lea         ecx,[esp+8]
 00043606    mov         edx,edi
 00043608    mov         eax,dword ptr [esp]
 0004360B    call        TControl.ScreenToClient
 00043610    mov         al,byte ptr [ebp+4]
 00043613    sub         al,3
>00043615    jb          0004361E
>00043617    je          00043675
>00043619    jmp         000436AA
 0004361E    mov         byte ptr [esp+4],1
 00043623    test        bl,bl
>00043625    je          00043649
 00043627    mov         eax,dword ptr [esp+0C]
 0004362B    push        eax
 0004362C    mov         al,byte ptr [ebp+4]
 0004362F    push        eax
 00043630    lea         eax,[esp+0C]
 00043634    push        eax
 00043635    mov         ecx,dword ptr [esp+14]
 00043639    mov         edx,esi
 0004363B    mov         eax,dword ptr [edi+0C]
 0004363E    mov         bx,0FFCC
 00043642    call        @CallDynaInst
>00043647    jmp         0004366A
 00043649    mov         eax,dword ptr [esp+0C]
 0004364D    push        eax
 0004364E    mov         al,byte ptr [ebp+4]
 00043651    push        eax
 00043652    lea         eax,[esp+0C]
 00043656    push        eax
 00043657    mov         ecx,dword ptr [esp+14]
 0004365B    mov         edx,esi
 0004365D    mov         eax,dword ptr [esp+0C]
 00043661    mov         bx,0FFE4
 00043665    call        @CallDynaInst
 0004366A    xor         eax,eax
 0004366C    mov         al,byte ptr [esp+4]
 00043670    mov         dword ptr [ebp+0C],eax
>00043673    jmp         000436AA
 00043675    test        bl,bl
>00043677    je          00043692
 00043679    mov         eax,dword ptr [esp+0C]
 0004367D    push        eax
 0004367E    mov         ecx,dword ptr [esp+0C]
 00043682    mov         edx,esi
 00043684    mov         eax,dword ptr [edi+0C]
 00043687    mov         bx,0FFBD
 0004368B    call        @CallDynaInst
>00043690    jmp         000436AA
 00043692    mov         eax,dword ptr [esp+0C]
 00043696    push        eax
 00043697    mov         ecx,dword ptr [esp+0C]
 0004369B    mov         edx,esi
 0004369D    mov         eax,dword ptr [esp+4]
 000436A1    mov         bx,0FFD1
 000436A5    call        @CallDynaInst
 000436AA    add         esp,10
 000436AD    pop         ebp
 000436AE    pop         edi
 000436AF    pop         esi
 000436B0    pop         ebx
 000436B1    ret
*}
end;

//000436B4
function TControl.ManualDock(NewDockSite:TWinControl; DropControl:TControl; ControlSide:TAlign):Boolean;
begin
{*
 000436B4    push        ebp
 000436B5    mov         ebp,esp
 000436B7    add         esp,0FFFFFFCC
 000436BA    push        ebx
 000436BB    push        esi
 000436BC    push        edi
 000436BD    mov         dword ptr [ebp-4],ecx
 000436C0    mov         edi,edx
 000436C2    mov         esi,eax
 000436C4    test        edi,edi
>000436C6    je          000436D1
 000436C8    cmp         edi,0FFFFFFFF
>000436CB    jne         00043793
 000436D1    mov         eax,dword ptr [esi+8C]
 000436D7    test        eax,eax
>000436D9    je          00043718
 000436DB    cmp         byte ptr [eax+180],0
>000436E2    je          00043718
 000436E4    cmp         dword ptr [eax+13C],0
>000436EB    je          00043718
 000436ED    lea         ecx,[ebp-1C]
 000436F0    mov         eax,dword ptr [eax+13C]
 000436F6    mov         edx,esi
 000436F8    mov         ebx,dword ptr [eax]
 000436FA    call        dword ptr [ebx+14]
 000436FD    push        2
 000436FF    lea         eax,[ebp-1C]
 00043702    push        eax
 00043703    push        0
 00043705    mov         eax,dword ptr [esi+8C]
 0004370B    call        TWinControl.GetHandle
 00043710    push        eax
 00043711    call        user32.MapWindowPoints
>00043716    jmp         00043752
 00043718    lea         ecx,[ebp-24]
 0004371B    mov         edx,dword ptr [esi+34]
 0004371E    mov         eax,dword ptr [esi+30]
 00043721    call        Point
 00043726    mov         eax,dword ptr [ebp-24]
 00043729    mov         dword ptr [ebp-1C],eax
 0004372C    mov         eax,dword ptr [ebp-20]
 0004372F    mov         dword ptr [ebp-18],eax
 00043732    mov         ebx,dword ptr [esi+24]
 00043735    test        ebx,ebx
>00043737    je          00043752
 00043739    lea         ecx,[ebp-24]
 0004373C    lea         edx,[ebp-1C]
 0004373F    mov         eax,ebx
 00043741    call        TControl.ClientToScreen
 00043746    mov         eax,dword ptr [ebp-24]
 00043749    mov         dword ptr [ebp-1C],eax
 0004374C    mov         eax,dword ptr [ebp-20]
 0004374F    mov         dword ptr [ebp-18],eax
 00043752    mov         eax,esi
 00043754    call        TControl.GetUndockHeight
 00043759    push        eax
 0004375A    lea         eax,[ebp-34]
 0004375D    push        eax
 0004375E    mov         eax,esi
 00043760    call        TControl.GetUndockWidth
 00043765    mov         ecx,eax
 00043767    mov         edx,dword ptr [ebp-18]
 0004376A    mov         eax,dword ptr [ebp-1C]
 0004376D    call        Bounds
 00043772    push        esi
 00043773    lea         esi,[ebp-34]
 00043776    lea         edi,[ebp-1C]
 00043779    mov         ecx,4
 0004377E    rep movs    dword ptr [edi],dword ptr [esi]
 00043780    pop         esi
 00043781    lea         edx,[ebp-1C]
 00043784    mov         eax,esi
 00043786    call        TControl.ManualFloat
 0004378B    mov         byte ptr [ebp-5],al
>0004378E    jmp         0004388E
 00043793    mov         eax,esi
 00043795    call        TControl.CalcDockSizes
 0004379A    cmp         dword ptr [esi+8C],0
>000437A1    je          000437BE
 000437A3    mov         eax,dword ptr [esi+8C]
 000437A9    mov         ecx,esi
 000437AB    mov         edx,edi
 000437AD    mov         bx,0FFC3
 000437B1    call        @CallDynaInst
 000437B6    test        al,al
>000437B8    jne         000437BE
 000437BA    xor         eax,eax
>000437BC    jmp         000437C0
 000437BE    mov         al,1
 000437C0    mov         byte ptr [ebp-5],al
 000437C3    cmp         byte ptr [ebp-5],0
>000437C7    je          0004388E
 000437CD    mov         ecx,esi
 000437CF    mov         dl,1
 000437D1    mov         eax,[0003E0F8];TDragDockObject
 000437D6    call        TDragDockObject.Create
 000437DB    mov         dword ptr [ebp-0C],eax
 000437DE    xor         edx,edx
 000437E0    push        ebp
 000437E1    push        43887
 000437E6    push        dword ptr fs:[edx]
 000437E9    mov         dword ptr fs:[edx],esp
 000437EC    mov         eax,dword ptr [esi+8C]
 000437F2    test        eax,eax
>000437F4    je          000437FF
 000437F6    call        TWinControl.GetHandle
 000437FB    mov         ebx,eax
>000437FD    jmp         00043801
 000437FF    xor         ebx,ebx
 00043801    lea         edx,[ebp-1C]
 00043804    mov         eax,esi
 00043806    call        TControl.GetBoundsRect
 0004380B    test        ebx,ebx
>0004380D    je          0004381D
 0004380F    push        2
 00043811    lea         eax,[ebp-1C]
 00043814    push        eax
 00043815    push        0
 00043817    push        ebx
 00043818    call        user32.MapWindowPoints
 0004381D    mov         eax,dword ptr [ebp-0C]
 00043820    mov         dword ptr [eax+4],edi
 00043823    mov         eax,dword ptr [ebp-0C]
 00043826    mov         dl,byte ptr [ebp+8]
 00043829    mov         byte ptr [eax+48],dl
 0004382C    mov         eax,dword ptr [ebp-0C]
 0004382F    mov         edx,dword ptr [ebp-4]
 00043832    mov         dword ptr [eax+4C],edx
 00043835    mov         eax,dword ptr [ebp-0C]
 00043838    push        edi
 00043839    lea         edi,[eax+38]
 0004383C    lea         esi,[ebp-1C]
 0004383F    mov         ecx,4
 00043844    rep movs    dword ptr [edi],dword ptr [esi]
 00043846    pop         edi
 00043847    push        1
 00043849    lea         eax,[ebp-1C]
 0004384C    push        eax
 0004384D    mov         eax,edi
 0004384F    call        TWinControl.GetHandle
 00043854    push        eax
 00043855    push        0
 00043857    call        user32.MapWindowPoints
 0004385C    mov         eax,dword ptr [ebp-18]
 0004385F    push        eax
 00043860    mov         ecx,dword ptr [ebp-1C]
 00043863    mov         edx,dword ptr [ebp-0C]
 00043866    mov         eax,edi
 00043868    mov         bx,0FFBD
 0004386C    call        @CallDynaInst
 00043871    xor         eax,eax
 00043873    pop         edx
 00043874    pop         ecx
 00043875    pop         ecx
 00043876    mov         dword ptr fs:[eax],edx
 00043879    push        4388E
 0004387E    mov         eax,dword ptr [ebp-0C]
 00043881    call        TObject.Free
 00043886    ret
>00043887    jmp         @HandleFinally
>0004388C    jmp         0004387E
 0004388E    mov         al,byte ptr [ebp-5]
 00043891    pop         edi
 00043892    pop         esi
 00043893    pop         ebx
 00043894    mov         esp,ebp
 00043896    pop         ebp
 00043897    ret         4
*}
end;

//0004389C
function TControl.ManualFloat(ScreenPos:TRect):Boolean;
begin
{*
 0004389C    push        ebx
 0004389D    push        esi
 0004389E    push        edi
 0004389F    add         esp,0FFFFFFDC
 000438A2    mov         esi,edx
 000438A4    lea         edi,[esp+4]
 000438A8    mov         ecx,4
 000438AD    rep movs    dword ptr [edi],dword ptr [esi]
 000438AF    mov         esi,eax
 000438B1    mov         edi,dword ptr [esi+8C]
 000438B7    test        edi,edi
>000438B9    je          000438D2
 000438BB    mov         ecx,esi
 000438BD    xor         edx,edx
 000438BF    mov         eax,edi
 000438C1    mov         bx,0FFC3
 000438C5    call        @CallDynaInst
 000438CA    test        al,al
>000438CC    jne         000438D2
 000438CE    xor         eax,eax
>000438D0    jmp         000438D4
 000438D2    mov         al,1
 000438D4    mov         byte ptr [esp],al
 000438D7    cmp         byte ptr [esp],0
>000438DB    je          00043931
 000438DD    lea         edx,[esp+4]
 000438E1    mov         eax,esi
 000438E3    call        TControl.CreateFloatingDockSite
 000438E8    mov         edi,eax
 000438EA    test        edi,edi
>000438EC    je          00043920
 000438EE    mov         eax,edi
 000438F0    call        TControl.GetClientHeight
 000438F5    push        eax
 000438F6    lea         eax,[esp+18]
 000438FA    push        eax
 000438FB    mov         eax,edi
 000438FD    call        TControl.GetClientWidth
 00043902    mov         ecx,eax
 00043904    xor         edx,edx
 00043906    xor         eax,eax
 00043908    call        Rect
 0004390D    lea         ecx,[esp+14]
 00043911    mov         edx,edi
 00043913    mov         eax,esi
 00043915    mov         bx,0FFD2
 00043919    call        @CallDynaInst
>0004391E    jmp         00043931
 00043920    lea         ecx,[esp+4]
 00043924    mov         edx,edi
 00043926    mov         eax,esi
 00043928    mov         bx,0FFD2
 0004392C    call        @CallDynaInst
 00043931    mov         al,byte ptr [esp]
 00043934    add         esp,24
 00043937    pop         edi
 00043938    pop         esi
 00043939    pop         ebx
 0004393A    ret
*}
end;

//0004393C
procedure TControl.DoConstraintsChange(Sender:TObject);
begin
{*
 0004393C    push        ebx
 0004393D    mov         bx,0FFEF
 00043941    call        @CallDynaInst
 00043946    pop         ebx
 00043947    ret
*}
end;

//00043948
{*function sub_00043948:?;
begin
 00043948    mov         al,1
 0004394A    ret
end;*}

//0004394C
function TControl.CanResize(var NewWidth:Integer; var NewHeight:Integer):Boolean;
begin
{*
 0004394C    push        ebx
 0004394D    push        ecx
 0004394E    mov         byte ptr [esp],1
 00043952    cmp         word ptr [eax+0A6],0
>0004395A    je          00043974
 0004395C    push        ecx
 0004395D    lea         ecx,[esp+4]
 00043961    push        ecx
 00043962    mov         ecx,edx
 00043964    mov         ebx,eax
 00043966    mov         edx,eax
 00043968    mov         eax,dword ptr [ebx+0A8]
 0004396E    call        dword ptr [ebx+0A4]
 00043974    mov         al,byte ptr [esp]
 00043977    pop         edx
 00043978    pop         ebx
 00043979    ret
*}
end;

//0004397C
function TControl.DoCanAutoSize(var NewWidth:Integer; var NewHeight:Integer):Boolean;
begin
{*
 0004397C    push        ebx
 0004397D    push        esi
 0004397E    add         esp,0FFFFFFF0
 00043981    mov         dword ptr [esp+4],ecx
 00043985    mov         dword ptr [esp],edx
 00043988    mov         esi,eax
 0004398A    cmp         byte ptr [esi+4B],5
>0004398E    je          000439DD
 00043990    mov         eax,dword ptr [esp]
 00043993    mov         eax,dword ptr [eax]
 00043995    mov         dword ptr [esp+8],eax
 00043999    mov         eax,dword ptr [esp+4]
 0004399D    mov         eax,dword ptr [eax]
 0004399F    mov         dword ptr [esp+0C],eax
 000439A3    lea         ecx,[esp+0C]
 000439A7    lea         edx,[esp+8]
 000439AB    mov         eax,esi
 000439AD    mov         ebx,dword ptr [eax]
 000439AF    call        dword ptr [ebx+38]
 000439B2    mov         dl,byte ptr [esi+4B]
 000439B5    mov         ecx,edx
 000439B7    test        cl,cl
>000439B9    je          000439C3
 000439BB    add         cl,0FD
 000439BE    sub         cl,2
>000439C1    jae         000439CC
 000439C3    mov         ecx,dword ptr [esp]
 000439C6    mov         ebx,dword ptr [esp+8]
 000439CA    mov         dword ptr [ecx],ebx
 000439CC    sub         dl,3
>000439CF    jae         000439DF
 000439D1    mov         edx,dword ptr [esp+4]
 000439D5    mov         ecx,dword ptr [esp+0C]
 000439D9    mov         dword ptr [edx],ecx
>000439DB    jmp         000439DF
 000439DD    mov         al,1
 000439DF    add         esp,10
 000439E2    pop         esi
 000439E3    pop         ebx
 000439E4    ret
*}
end;

//000439E8
function TControl.DoCanResize(var NewWidth:Integer; var NewHeight:Integer):Boolean;
begin
{*
 000439E8    push        ebx
 000439E9    push        esi
 000439EA    push        edi
 000439EB    push        ecx
 000439EC    mov         dword ptr [esp],ecx
 000439EF    mov         edi,edx
 000439F1    mov         esi,eax
 000439F3    mov         ecx,dword ptr [esp]
 000439F6    mov         edx,edi
 000439F8    mov         eax,esi
 000439FA    mov         ebx,dword ptr [eax]
 000439FC    call        dword ptr [ebx+34]
 000439FF    mov         ebx,eax
 00043A01    test        bl,bl
>00043A03    je          00043A11
 00043A05    mov         ecx,dword ptr [esp]
 00043A08    mov         edx,edi
 00043A0A    mov         eax,esi
 00043A0C    call        TControl.DoConstrainedResize
 00043A11    mov         eax,ebx
 00043A13    pop         edx
 00043A14    pop         edi
 00043A15    pop         esi
 00043A16    pop         ebx
 00043A17    ret
*}
end;

//00043A18
procedure TControl.ConstrainedResize(var MinWidth:Integer; var MinHeight:Integer; var MaxWidth:Integer; var MaxHeight:Integer);
begin
{*
 00043A18    push        ebp
 00043A19    mov         ebp,esp
 00043A1B    push        ebx
 00043A1C    cmp         word ptr [eax+0AE],0
>00043A24    je          00043A41
 00043A26    push        ecx
 00043A27    mov         ecx,dword ptr [ebp+0C]
 00043A2A    push        ecx
 00043A2B    mov         ecx,dword ptr [ebp+8]
 00043A2E    push        ecx
 00043A2F    mov         ecx,edx
 00043A31    mov         ebx,eax
 00043A33    mov         edx,eax
 00043A35    mov         eax,dword ptr [ebx+0B0]
 00043A3B    call        dword ptr [ebx+0AC]
 00043A41    pop         ebx
 00043A42    pop         ebp
 00043A43    ret         8
*}
end;

//00043A48
procedure TControl.DoConstrainedResize(var NewWidth:Integer; var NewHeight:Integer);
begin
{*
 00043A48    push        ebx
 00043A49    push        esi
 00043A4A    push        edi
 00043A4B    add         esp,0FFFFFFF0
 00043A4E    mov         edi,ecx
 00043A50    mov         esi,edx
 00043A52    mov         edx,dword ptr [eax+68]
 00043A55    mov         edx,dword ptr [edx+14]
 00043A58    test        edx,edx
>00043A5A    jbe         00043A61
 00043A5C    mov         dword ptr [esp],edx
>00043A5F    jmp         00043A66
 00043A61    xor         edx,edx
 00043A63    mov         dword ptr [esp],edx
 00043A66    mov         edx,dword ptr [eax+68]
 00043A69    mov         edx,dword ptr [edx+10]
 00043A6C    test        edx,edx
>00043A6E    jbe         00043A76
 00043A70    mov         dword ptr [esp+4],edx
>00043A74    jmp         00043A7C
 00043A76    xor         edx,edx
 00043A78    mov         dword ptr [esp+4],edx
 00043A7C    mov         edx,dword ptr [eax+68]
 00043A7F    mov         edx,dword ptr [edx+0C]
 00043A82    test        edx,edx
>00043A84    jbe         00043A8C
 00043A86    mov         dword ptr [esp+8],edx
>00043A8A    jmp         00043A92
 00043A8C    xor         edx,edx
 00043A8E    mov         dword ptr [esp+8],edx
 00043A92    mov         edx,dword ptr [eax+68]
 00043A95    mov         edx,dword ptr [edx+8]
 00043A98    test        edx,edx
>00043A9A    jbe         00043AA2
 00043A9C    mov         dword ptr [esp+0C],edx
>00043AA0    jmp         00043AA8
 00043AA2    xor         edx,edx
 00043AA4    mov         dword ptr [esp+0C],edx
 00043AA8    lea         edx,[esp+8]
 00043AAC    push        edx
 00043AAD    lea         edx,[esp+10]
 00043AB1    push        edx
 00043AB2    lea         ecx,[esp+0C]
 00043AB6    lea         edx,[esp+8]
 00043ABA    mov         ebx,dword ptr [eax]
 00043ABC    call        dword ptr [ebx+3C]
 00043ABF    cmp         dword ptr [esp+8],0
>00043AC4    jle         00043AD6
 00043AC6    mov         eax,dword ptr [esi]
 00043AC8    cmp         eax,dword ptr [esp+8]
>00043ACC    jle         00043AD6
 00043ACE    mov         eax,dword ptr [esp+8]
 00043AD2    mov         dword ptr [esi],eax
>00043AD4    jmp         00043AE8
 00043AD6    cmp         dword ptr [esp],0
>00043ADA    jle         00043AE8
 00043ADC    mov         eax,dword ptr [esi]
 00043ADE    cmp         eax,dword ptr [esp]
>00043AE1    jge         00043AE8
 00043AE3    mov         eax,dword ptr [esp]
 00043AE6    mov         dword ptr [esi],eax
 00043AE8    cmp         dword ptr [esp+0C],0
>00043AED    jle         00043AFF
 00043AEF    mov         eax,dword ptr [edi]
 00043AF1    cmp         eax,dword ptr [esp+0C]
>00043AF5    jle         00043AFF
 00043AF7    mov         eax,dword ptr [esp+0C]
 00043AFB    mov         dword ptr [edi],eax
>00043AFD    jmp         00043B14
 00043AFF    cmp         dword ptr [esp+4],0
>00043B04    jle         00043B14
 00043B06    mov         eax,dword ptr [edi]
 00043B08    cmp         eax,dword ptr [esp+4]
>00043B0C    jge         00043B14
 00043B0E    mov         eax,dword ptr [esp+4]
 00043B12    mov         dword ptr [edi],eax
 00043B14    add         esp,10
 00043B17    pop         edi
 00043B18    pop         esi
 00043B19    pop         ebx
 00043B1A    ret
*}
end;

//00043B1C
function TControl.Perform(Msg:Cardinal; WParam:Longint; LParam:Longint):Longint;
begin
{*
 00043B1C    push        ebp
 00043B1D    mov         ebp,esp
 00043B1F    add         esp,0FFFFFFF0
 00043B22    push        ebx
 00043B23    mov         dword ptr [ebp-10],edx
 00043B26    mov         dword ptr [ebp-0C],ecx
 00043B29    mov         edx,dword ptr [ebp+8]
 00043B2C    mov         dword ptr [ebp-8],edx
 00043B2F    xor         edx,edx
 00043B31    mov         dword ptr [ebp-4],edx
 00043B34    test        eax,eax
>00043B36    je          00043B43
 00043B38    lea         edx,[ebp-10]
 00043B3B    mov         ebx,eax
 00043B3D    mov         eax,dword ptr [ebx+2C]
 00043B40    call        dword ptr [ebx+28]
 00043B43    mov         eax,dword ptr [ebp-4]
 00043B46    pop         ebx
 00043B47    mov         esp,ebp
 00043B49    pop         ebp
 00043B4A    ret         4
*}
end;

//00043B50
procedure TControl.CalcDockSizes;
begin
{*
 00043B50    push        ebx
 00043B51    mov         ebx,eax
 00043B53    mov         eax,ebx
 00043B55    mov         edx,dword ptr [eax]
 00043B57    call        dword ptr [edx+54]
 00043B5A    test        al,al
>00043B5C    je          00043B72
 00043B5E    mov         eax,dword ptr [ebx+3C]
 00043B61    mov         dword ptr [ebx+94],eax
 00043B67    mov         eax,dword ptr [ebx+38]
 00043B6A    mov         dword ptr [ebx+90],eax
 00043B70    pop         ebx
 00043B71    ret
 00043B72    cmp         dword ptr [ebx+8C],0
>00043B79    je          00043BBE
 00043B7B    cmp         byte ptr [ebx+88],2
>00043B82    je          00043B92
 00043B84    mov         eax,dword ptr [ebx+8C]
 00043B8A    mov         al,byte ptr [eax+4B]
 00043B8D    dec         eax
 00043B8E    sub         al,2
>00043B90    jae         00043B9D
 00043B92    mov         eax,dword ptr [ebx+3C]
 00043B95    mov         dword ptr [ebx+9C],eax
>00043B9B    jmp         00043BBE
 00043B9D    cmp         byte ptr [ebx+88],1
>00043BA4    je          00043BB5
 00043BA6    mov         eax,dword ptr [ebx+8C]
 00043BAC    mov         al,byte ptr [eax+4B]
 00043BAF    add         al,0FD
 00043BB1    sub         al,2
>00043BB3    jae         00043BBE
 00043BB5    mov         eax,dword ptr [ebx+38]
 00043BB8    mov         dword ptr [ebx+98],eax
 00043BBE    pop         ebx
 00043BBF    ret
*}
end;

//00043BC0
procedure TControl.UpdateBoundsRect(const R:TRect);
begin
{*
 00043BC0    push        ebx
 00043BC1    push        esi
 00043BC2    push        edi
 00043BC3    mov         ebx,edx
 00043BC5    mov         esi,eax
 00043BC7    mov         ecx,dword ptr [ebx+0C]
 00043BCA    sub         ecx,dword ptr [ebx+4]
 00043BCD    mov         edx,dword ptr [ebx+8]
 00043BD0    sub         edx,dword ptr [ebx]
 00043BD2    mov         eax,esi
 00043BD4    mov         edi,dword ptr [eax]
 00043BD6    call        dword ptr [edi+30]
 00043BD9    mov         eax,dword ptr [ebx]
 00043BDB    mov         dword ptr [esi+30],eax
 00043BDE    mov         eax,dword ptr [ebx+4]
 00043BE1    mov         dword ptr [esi+34],eax
 00043BE4    mov         eax,dword ptr [ebx+8]
 00043BE7    sub         eax,dword ptr [ebx]
 00043BE9    mov         dword ptr [esi+38],eax
 00043BEC    mov         eax,dword ptr [ebx+0C]
 00043BEF    sub         eax,dword ptr [ebx+4]
 00043BF2    mov         dword ptr [esi+3C],eax
 00043BF5    pop         edi
 00043BF6    pop         esi
 00043BF7    pop         ebx
 00043BF8    ret
*}
end;

//00043BFC
procedure TControl.sub_00043BFC;
begin
{*
 00043BFC    ret
*}
end;

//00043C00
procedure TControl.WndProc(var Message:TMessage);
begin
{*
 00043C00    push        ebx
 00043C01    push        esi
 00043C02    push        edi
 00043C03    mov         esi,edx
 00043C05    mov         ebx,eax
 00043C07    test        byte ptr [ebx+20],10
>00043C0B    je          00043C47
 00043C0D    mov         eax,ebx
 00043C0F    call        GetParentForm
 00043C14    mov         edi,eax
 00043C16    test        edi,edi
>00043C18    je          00043D0B
 00043C1E    cmp         dword ptr [edi+230],0
>00043C25    je          00043D0B
 00043C2B    mov         ecx,esi
 00043C2D    mov         eax,dword ptr [edi+230]
 00043C33    mov         edx,ebx
 00043C35    mov         edi,dword ptr [eax]
 00043C37    call        dword ptr [edi+24]
 00043C3A    test        al,al
>00043C3C    jne         00043D14
>00043C42    jmp         00043D0B
 00043C47    mov         eax,dword ptr [esi]
 00043C49    cmp         eax,100
>00043C4E    jb          00043C83
 00043C50    cmp         eax,108
>00043C55    ja          00043C83
 00043C57    mov         eax,ebx
 00043C59    call        GetParentForm
 00043C5E    mov         edi,eax
 00043C60    test        edi,edi
>00043C62    je          00043D0B
 00043C68    mov         ecx,esi
 00043C6A    mov         edx,ebx
 00043C6C    mov         eax,edi
 00043C6E    mov         edi,dword ptr [eax]
 00043C70    call        dword ptr [edi+0D0]
 00043C76    test        al,al
>00043C78    jne         00043D14
>00043C7E    jmp         00043D0B
 00043C83    mov         eax,dword ptr [esi]
 00043C85    cmp         eax,200
>00043C8A    jb          00043CF4
 00043C8C    cmp         eax,20A
>00043C91    ja          00043CF4
 00043C93    test        byte ptr [ebx+40],80
>00043C97    jne         00043CAD
 00043C99    sub         eax,203
>00043C9E    je          00043CAA
 00043CA0    sub         eax,3
>00043CA3    je          00043CAA
 00043CA5    sub         eax,3
>00043CA8    jne         00043CAD
 00043CAA    sub         dword ptr [esi],2
 00043CAD    mov         eax,dword ptr [esi]
 00043CAF    sub         eax,200
>00043CB4    je          00043CC1
 00043CB6    dec         eax
>00043CB7    je          00043CD3
 00043CB9    dec         eax
>00043CBA    je          00043CED
 00043CBC    dec         eax
>00043CBD    je          00043CD3
>00043CBF    jmp         00043D0B
 00043CC1    mov         ecx,esi
 00043CC3    mov         eax,[000B59E8];^Application:TApplication
 00043CC8    mov         eax,dword ptr [eax]
 00043CCA    mov         edx,ebx
 00043CCC    call        TApplication.HintMouseMessage
>00043CD1    jmp         00043D0B
 00043CD3    cmp         byte ptr [ebx+4D],1
>00043CD7    jne         00043CE6
 00043CD9    mov         eax,ebx
 00043CDB    mov         bx,0FFEE
 00043CDF    call        @CallDynaInst
>00043CE4    jmp         00043D14
 00043CE6    or          word ptr [ebx+44],1
>00043CEB    jmp         00043D0B
 00043CED    and         word ptr [ebx+44],0FFFFFFFE
>00043CF2    jmp         00043D0B
 00043CF4    cmp         eax,0B00B
>00043CF9    jne         00043D0B
 00043CFB    mov         edx,dword ptr [esi+8]
 00043CFE    push        edx
 00043CFF    mov         ecx,dword ptr [esi+4]
 00043D02    mov         edx,eax
 00043D04    mov         eax,ebx
 00043D06    call        TControl.SendDockNotification
 00043D0B    mov         edx,esi
 00043D0D    mov         eax,ebx
 00043D0F    mov         ecx,dword ptr [eax]
 00043D11    call        dword ptr [ecx-14]
 00043D14    pop         edi
 00043D15    pop         esi
 00043D16    pop         ebx
 00043D17    ret
*}
end;

//00043D18
procedure TControl.DefaultHandler(var Message:void );
begin
{*
 00043D18    push        ebx
 00043D19    push        esi
 00043D1A    push        edi
 00043D1B    mov         ebx,edx
 00043D1D    mov         esi,eax
 00043D1F    mov         eax,dword ptr [ebx]
 00043D21    sub         eax,0C
>00043D24    je          00043D70
 00043D26    dec         eax
>00043D27    je          00043D2E
 00043D29    dec         eax
>00043D2A    je          00043D56
>00043D2C    jmp         00043D95
 00043D2E    mov         eax,dword ptr [esi+54]
 00043D31    test        eax,eax
>00043D33    je          00043D39
 00043D35    mov         edi,eax
>00043D37    jmp         00043D3E
 00043D39    mov         edi,43D9C
 00043D3E    mov         ecx,dword ptr [ebx+4]
 00043D41    dec         ecx
 00043D42    mov         eax,dword ptr [ebx+8]
 00043D45    mov         edx,edi
 00043D47    call        StrLCopy
 00043D4C    call        StrLen
 00043D51    mov         dword ptr [ebx+0C],eax
>00043D54    jmp         00043D95
 00043D56    mov         edi,dword ptr [esi+54]
 00043D59    test        edi,edi
>00043D5B    jne         00043D64
 00043D5D    xor         eax,eax
 00043D5F    mov         dword ptr [ebx+0C],eax
>00043D62    jmp         00043D95
 00043D64    mov         eax,edi
 00043D66    call        StrLen
 00043D6B    mov         dword ptr [ebx+0C],eax
>00043D6E    jmp         00043D95
 00043D70    mov         eax,dword ptr [ebx+8]
 00043D73    call        StrNew
 00043D78    mov         edi,eax
 00043D7A    mov         eax,dword ptr [esi+54]
 00043D7D    call        StrDispose
 00043D82    mov         dword ptr [esi+54],edi
 00043D85    mov         eax,dword ptr [ebx+8]
 00043D88    push        eax
 00043D89    mov         ecx,dword ptr [ebx+4]
 00043D8C    mov         edx,dword ptr [ebx]
 00043D8E    mov         eax,esi
 00043D90    call        TControl.SendDockNotification
 00043D95    pop         edi
 00043D96    pop         esi
 00043D97    pop         ebx
 00043D98    ret
*}
end;

//00043DA0
procedure TControl.ReadIsControl(Reader:TReader);
begin
{*
 00043DA0    push        ebx
 00043DA1    push        esi
 00043DA2    mov         esi,edx
 00043DA4    mov         ebx,eax
 00043DA6    mov         eax,esi
 00043DA8    call        TReader.ReadBoolean
 00043DAD    mov         byte ptr [ebx+4E],al
 00043DB0    pop         esi
 00043DB1    pop         ebx
 00043DB2    ret
*}
end;

//00043DB4
procedure TControl.WriteIsControl(Writer:TWriter);
begin
{*
 00043DB4    mov         al,byte ptr [eax+4E]
 00043DB7    xchg        eax,edx
 00043DB8    call        TWriter.WriteBoolean
 00043DBD    ret
*}
end;

//00043DC0
function DoWrite:Boolean;
begin
{*
 00043DC0    push        ebp
 00043DC1    mov         ebp,esp
 00043DC3    mov         eax,dword ptr [ebp+8]
 00043DC6    mov         eax,dword ptr [eax-4]
 00043DC9    mov         eax,dword ptr [eax+1C]
 00043DCC    test        eax,eax
>00043DCE    je          00043DE4
 00043DD0    mov         edx,dword ptr [ebp+8]
 00043DD3    mov         al,byte ptr [eax+4E]
 00043DD6    mov         edx,dword ptr [ebp+8]
 00043DD9    mov         edx,dword ptr [edx-8]
 00043DDC    cmp         al,byte ptr [edx+4E]
 00043DDF    setne       al
 00043DE2    pop         ebp
 00043DE3    ret
 00043DE4    mov         eax,dword ptr [ebp+8]
 00043DE7    mov         eax,dword ptr [eax-8]
 00043DEA    mov         al,byte ptr [eax+4E]
 00043DED    pop         ebp
 00043DEE    ret
*}
end;

//00043DF0
procedure TControl.DefineProperties(Filer:TFiler);
begin
{*
 00043DF0    push        ebp
 00043DF1    mov         ebp,esp
 00043DF3    add         esp,0FFFFFFF8
 00043DF6    push        ebx
 00043DF7    mov         dword ptr [ebp-4],edx
 00043DFA    mov         dword ptr [ebp-8],eax
 00043DFD    mov         eax,dword ptr [ebp-8]
 00043E00    push        eax
 00043E01    push        43DA0;TControl.ReadIsControl
 00043E06    mov         eax,dword ptr [ebp-8]
 00043E09    push        eax
 00043E0A    push        43DB4;TControl.WriteIsControl
 00043E0F    push        ebp
 00043E10    call        DoWrite
 00043E15    pop         ecx
 00043E16    mov         ecx,eax
 00043E18    mov         edx,43E34;'IsControl'
 00043E1D    mov         eax,dword ptr [ebp-4]
 00043E20    mov         ebx,dword ptr [eax]
 00043E22    call        dword ptr [ebx]
 00043E24    pop         ebx
 00043E25    pop         ecx
 00043E26    pop         ecx
 00043E27    pop         ebp
 00043E28    ret
*}
end;

//00043E40
procedure TControl.Click;
begin
{*
 00043E40    push        ebx
 00043E41    mov         ebx,eax
 00043E43    cmp         word ptr [ebx+106],0
>00043E4B    je          00043E7A
 00043E4D    mov         eax,ebx
 00043E4F    call        TControl.GetAction
 00043E54    test        eax,eax
>00043E56    je          00043E7A
 00043E58    mov         eax,ebx
 00043E5A    call        TControl.GetAction
 00043E5F    mov         eax,dword ptr [eax+2C]
 00043E62    cmp         eax,dword ptr [ebx+104]
>00043E68    je          00043E7A
 00043E6A    mov         edx,ebx
 00043E6C    mov         eax,dword ptr [ebx+108]
 00043E72    call        dword ptr [ebx+104]
 00043E78    pop         ebx
 00043E79    ret
 00043E7A    test        byte ptr [ebx+20],10
>00043E7E    jne         00043E94
 00043E80    cmp         dword ptr [ebx+5C],0
>00043E84    je          00043E94
 00043E86    mov         eax,dword ptr [ebx+5C]
 00043E89    mov         bx,0FFFF
 00043E8D    call        @CallDynaInst
>00043E92    jmp         00043EAC
 00043E94    cmp         word ptr [ebx+106],0
>00043E9C    je          00043EAC
 00043E9E    mov         edx,ebx
 00043EA0    mov         eax,dword ptr [ebx+108]
 00043EA6    call        dword ptr [ebx+104]
 00043EAC    pop         ebx
 00043EAD    ret
*}
end;

//00043EB0
procedure TControl.DblClick;
begin
{*
 00043EB0    push        ebx
 00043EB1    cmp         word ptr [eax+10E],0
>00043EB9    je          00043ECB
 00043EBB    mov         ebx,eax
 00043EBD    mov         edx,eax
 00043EBF    mov         eax,dword ptr [ebx+110]
 00043EC5    call        dword ptr [ebx+10C]
 00043ECB    pop         ebx
 00043ECC    ret
*}
end;

//00043ED0
procedure TControl.MouseDown(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);
begin
{*
 00043ED0    push        ebp
 00043ED1    mov         ebp,esp
 00043ED3    push        ecx
 00043ED4    push        ebx
 00043ED5    mov         byte ptr [ebp-1],cl
 00043ED8    cmp         word ptr [eax+0B6],0
>00043EE0    je          00043F00
 00043EE2    mov         cl,byte ptr [ebp-1]
 00043EE5    push        ecx
 00043EE6    mov         ecx,dword ptr [ebp+0C]
 00043EE9    push        ecx
 00043EEA    mov         ecx,dword ptr [ebp+8]
 00043EED    push        ecx
 00043EEE    mov         ebx,eax
 00043EF0    mov         ecx,edx
 00043EF2    mov         edx,eax
 00043EF4    mov         eax,dword ptr [ebx+0B8]
 00043EFA    call        dword ptr [ebx+0B4]
 00043F00    pop         ebx
 00043F01    pop         ecx
 00043F02    pop         ebp
 00043F03    ret         8
*}
end;

//00043F08
procedure TControl.DoMouseDown(var Message:TWMMouse; Button:TMouseButton; Shift:TShiftState);
begin
{*
 00043F08    push        ebp
 00043F09    mov         ebp,esp
 00043F0B    push        ecx
 00043F0C    push        ebx
 00043F0D    push        esi
 00043F0E    push        edi
 00043F0F    mov         byte ptr [ebp-1],cl
 00043F12    mov         edi,edx
 00043F14    mov         esi,eax
 00043F16    test        byte ptr [esi+41],10
>00043F1A    jne         00043F42
 00043F1C    movsx       eax,word ptr [edi+8]
 00043F20    push        eax
 00043F21    movsx       eax,word ptr [edi+0A]
 00043F25    push        eax
 00043F26    mov         ax,word ptr [edi+4]
 00043F2A    call        KeysToShiftState
 00043F2F    mov         ecx,eax
 00043F31    or          cl,byte ptr [ebp+8]
 00043F34    mov         dl,byte ptr [ebp-1]
 00043F37    mov         eax,esi
 00043F39    mov         bx,0FFDB
 00043F3D    call        @CallDynaInst
 00043F42    pop         edi
 00043F43    pop         esi
 00043F44    pop         ebx
 00043F45    pop         ecx
 00043F46    pop         ebp
 00043F47    ret         4
*}
end;

//00043F4C
procedure TControl.WMLButtonDown(var Message:TWMLButtonDown);
begin
{*
 00043F4C    push        ebx
 00043F4D    push        esi
 00043F4E    mov         esi,edx
 00043F50    mov         ebx,eax
 00043F52    mov         edx,ebx
 00043F54    mov         eax,ebx
 00043F56    call        TControl.SendCancelMode
 00043F5B    mov         edx,esi
 00043F5D    mov         eax,ebx
 00043F5F    mov         ecx,dword ptr [eax]
 00043F61    call        dword ptr [ecx-10]
 00043F64    test        byte ptr [ebx+40],2
>00043F68    je          00043F73
 00043F6A    mov         dl,1
 00043F6C    mov         eax,ebx
 00043F6E    call        TControl.SetMouseCapture
 00043F73    test        byte ptr [ebx+40],8
>00043F77    je          00043F7E
 00043F79    or          word ptr [ebx+44],2
 00043F7E    mov         al,[00043F94]
 00043F83    push        eax
 00043F84    mov         edx,esi
 00043F86    xor         ecx,ecx
 00043F88    mov         eax,ebx
 00043F8A    call        TControl.DoMouseDown
 00043F8F    pop         esi
 00043F90    pop         ebx
 00043F91    ret
*}
end;

//00043F98
procedure TControl.WMNCLButtonDown(var Message:TWMNCLButtonDown);
begin
{*
 00043F98    push        ebx
 00043F99    push        esi
 00043F9A    mov         esi,edx
 00043F9C    mov         ebx,eax
 00043F9E    mov         edx,ebx
 00043FA0    mov         eax,ebx
 00043FA2    call        TControl.SendCancelMode
 00043FA7    mov         edx,esi
 00043FA9    mov         eax,ebx
 00043FAB    mov         ecx,dword ptr [eax]
 00043FAD    call        dword ptr [ecx-10]
 00043FB0    pop         esi
 00043FB1    pop         ebx
 00043FB2    ret
*}
end;

//00043FB4
procedure TControl.WMLButtonDblClk(var Message:TWMLButtonDblClk);
begin
{*
 00043FB4    push        ebx
 00043FB5    push        esi
 00043FB6    push        edi
 00043FB7    mov         edi,edx
 00043FB9    mov         esi,eax
 00043FBB    mov         edx,esi
 00043FBD    mov         eax,esi
 00043FBF    call        TControl.SendCancelMode
 00043FC4    mov         edx,edi
 00043FC6    mov         eax,esi
 00043FC8    mov         ecx,dword ptr [eax]
 00043FCA    call        dword ptr [ecx-10]
 00043FCD    test        byte ptr [esi+40],2
>00043FD1    je          00043FDC
 00043FD3    mov         dl,1
 00043FD5    mov         eax,esi
 00043FD7    call        TControl.SetMouseCapture
 00043FDC    test        byte ptr [esi+40],8
>00043FE0    je          00043FED
 00043FE2    mov         eax,esi
 00043FE4    mov         bx,0FFEB
 00043FE8    call        @CallDynaInst
 00043FED    mov         al,[00044004]
 00043FF2    push        eax
 00043FF3    mov         edx,edi
 00043FF5    xor         ecx,ecx
 00043FF7    mov         eax,esi
 00043FF9    call        TControl.DoMouseDown
 00043FFE    pop         edi
 00043FFF    pop         esi
 00044000    pop         ebx
 00044001    ret
*}
end;

//00044008
procedure TControl.sub_00044008;
begin
{*
 00044008    mov         eax,dword ptr [eax+70];TControl.FPopupMenu:TPopupMenu
 0004400B    ret
*}
end;

//0004400C
procedure TControl.CheckMenuPopup(const Pos:TSmallPoint);
begin
{*
 0004400C    push        ebx
 0004400D    push        esi
 0004400E    push        edi
 0004400F    add         esp,0FFFFFFEC
 00044012    mov         dword ptr [esp],edx
 00044015    mov         edi,eax
 00044017    test        byte ptr [edi+20],10
>0004401B    jne         00044079
 0004401D    mov         esi,edi
 0004401F    test        esi,esi
>00044021    je          00044079
 00044023    mov         eax,esi
 00044025    mov         bx,0FFDC
 00044029    call        @CallDynaInst
 0004402E    mov         ebx,eax
 00044030    test        ebx,ebx
>00044032    je          00044072
 00044034    cmp         byte ptr [ebx+51],0
>00044038    je          00044079
 0004403A    xor         edx,edx
 0004403C    mov         eax,edi
 0004403E    call        TControl.SendCancelMode
 00044043    mov         dword ptr [ebx+54],esi
 00044046    lea         edx,[esp+0C]
 0004404A    mov         eax,dword ptr [esp]
 0004404D    call        SmallPointToPoint
 00044052    lea         edx,[esp+0C]
 00044056    lea         ecx,[esp+4]
 0004405A    mov         eax,edi
 0004405C    call        TControl.ClientToScreen
 00044061    mov         ecx,dword ptr [esp+8]
 00044065    mov         edx,dword ptr [esp+4]
 00044069    mov         eax,ebx
 0004406B    mov         ebx,dword ptr [eax]
 0004406D    call        dword ptr [ebx+3C]
>00044070    jmp         00044079
 00044072    mov         esi,dword ptr [esi+24]
 00044075    test        esi,esi
>00044077    jne         00044023
 00044079    add         esp,14
 0004407C    pop         edi
 0004407D    pop         esi
 0004407E    pop         ebx
 0004407F    ret
*}
end;

//00044080
function TControl.CheckNewSize(var NewWidth:Integer; var NewHeight:Integer):Boolean;
begin
{*
 00044080    push        ebx
 00044081    push        esi
 00044082    push        edi
 00044083    push        ebp
 00044084    add         esp,0FFFFFFF0
 00044087    mov         ebp,ecx
 00044089    mov         edi,edx
 0004408B    mov         esi,eax
 0004408D    xor         ebx,ebx
 0004408F    mov         eax,dword ptr [edi]
 00044091    mov         dword ptr [esp],eax
 00044094    mov         eax,dword ptr [ebp]
 00044097    mov         dword ptr [esp+4],eax
 0004409B    lea         ecx,[esp+4]
 0004409F    mov         edx,esp
 000440A1    mov         eax,esi
 000440A3    call        TControl.DoCanResize
 000440A8    test        al,al
>000440AA    je          00044111
 000440AC    mov         eax,dword ptr [esp]
 000440AF    mov         dword ptr [esp+8],eax
 000440B3    mov         eax,dword ptr [esp+4]
 000440B7    mov         dword ptr [esp+0C],eax
 000440BB    cmp         byte ptr [esi+4C],0
>000440BF    je          000440FE
 000440C1    lea         ecx,[esp+0C]
 000440C5    lea         edx,[esp+8]
 000440C9    mov         eax,esi
 000440CB    call        TControl.DoCanAutoSize
 000440D0    test        al,al
>000440D2    je          000440E7
 000440D4    mov         eax,dword ptr [esp+8]
 000440D8    cmp         eax,dword ptr [esp]
>000440DB    jne         000440E7
 000440DD    mov         eax,dword ptr [esp+0C]
 000440E1    cmp         eax,dword ptr [esp+4]
>000440E5    je          000440FE
 000440E7    lea         ecx,[esp+0C]
 000440EB    lea         edx,[esp+8]
 000440EF    mov         eax,esi
 000440F1    call        TControl.DoCanResize
 000440F6    test        al,al
>000440F8    jne         000440FE
 000440FA    xor         ebx,ebx
>000440FC    jmp         00044100
 000440FE    mov         bl,1
 00044100    test        bl,bl
>00044102    je          00044111
 00044104    mov         eax,dword ptr [esp+8]
 00044108    mov         dword ptr [edi],eax
 0004410A    mov         eax,dword ptr [esp+0C]
 0004410E    mov         dword ptr [ebp],eax
 00044111    mov         eax,ebx
 00044113    add         esp,10
 00044116    pop         ebp
 00044117    pop         edi
 00044118    pop         esi
 00044119    pop         ebx
 0004411A    ret
*}
end;

//0004411C
procedure TControl.WMRButtonDown(var Message:TWMRButtonDown);
begin
{*
 0004411C    push        ebx
 0004411D    push        esi
 0004411E    mov         esi,edx
 00044120    mov         ebx,eax
 00044122    mov         edx,esi
 00044124    mov         eax,ebx
 00044126    mov         ecx,dword ptr [eax]
 00044128    call        dword ptr [ecx-10]
 0004412B    mov         al,[00044140]
 00044130    push        eax
 00044131    mov         edx,esi
 00044133    mov         cl,1
 00044135    mov         eax,ebx
 00044137    call        TControl.DoMouseDown
 0004413C    pop         esi
 0004413D    pop         ebx
 0004413E    ret
*}
end;

//00044144
procedure TControl.WMRButtonDblClk(var Message:TWMRButtonDblClk);
begin
{*
 00044144    push        ebx
 00044145    push        esi
 00044146    mov         esi,edx
 00044148    mov         ebx,eax
 0004414A    mov         edx,esi
 0004414C    mov         eax,ebx
 0004414E    mov         ecx,dword ptr [eax]
 00044150    call        dword ptr [ecx-10]
 00044153    mov         al,[00044168]
 00044158    push        eax
 00044159    mov         edx,esi
 0004415B    mov         cl,1
 0004415D    mov         eax,ebx
 0004415F    call        TControl.DoMouseDown
 00044164    pop         esi
 00044165    pop         ebx
 00044166    ret
*}
end;

//0004416C
procedure TControl.WMMButtonDown(var Message:TWMMButtonDown);
begin
{*
 0004416C    push        ebx
 0004416D    push        esi
 0004416E    mov         esi,edx
 00044170    mov         ebx,eax
 00044172    mov         edx,esi
 00044174    mov         eax,ebx
 00044176    mov         ecx,dword ptr [eax]
 00044178    call        dword ptr [ecx-10]
 0004417B    mov         al,[00044190]
 00044180    push        eax
 00044181    mov         edx,esi
 00044183    mov         cl,2
 00044185    mov         eax,ebx
 00044187    call        TControl.DoMouseDown
 0004418C    pop         esi
 0004418D    pop         ebx
 0004418E    ret
*}
end;

//00044194
procedure TControl.WMMButtonDblClk(var Message:TWMMButtonDblClk);
begin
{*
 00044194    push        ebx
 00044195    push        esi
 00044196    mov         esi,edx
 00044198    mov         ebx,eax
 0004419A    mov         edx,esi
 0004419C    mov         eax,ebx
 0004419E    mov         ecx,dword ptr [eax]
 000441A0    call        dword ptr [ecx-10]
 000441A3    mov         al,[000441B8]
 000441A8    push        eax
 000441A9    mov         edx,esi
 000441AB    mov         cl,2
 000441AD    mov         eax,ebx
 000441AF    call        TControl.DoMouseDown
 000441B4    pop         esi
 000441B5    pop         ebx
 000441B6    ret
*}
end;

//000441BC
procedure TControl.MouseMove(Shift:TShiftState; X:Integer; Y:Integer);
begin
{*
 000441BC    push        ebp
 000441BD    mov         ebp,esp
 000441BF    push        ecx
 000441C0    push        ebx
 000441C1    mov         byte ptr [ebp-1],dl
 000441C4    cmp         word ptr [eax+0BE],0
>000441CC    je          000441E6
 000441CE    push        ecx
 000441CF    mov         edx,dword ptr [ebp+8]
 000441D2    push        edx
 000441D3    mov         ebx,eax
 000441D5    mov         edx,eax
 000441D7    mov         cl,byte ptr [ebp-1]
 000441DA    mov         eax,dword ptr [ebx+0C0]
 000441E0    call        dword ptr [ebx+0BC]
 000441E6    pop         ebx
 000441E7    pop         ecx
 000441E8    pop         ebp
 000441E9    ret         4
*}
end;

//000441EC
procedure TControl.WMMouseMove(var Message:TWMMouseMove);
begin
{*
 000441EC    push        ebx
 000441ED    push        esi
 000441EE    push        edi
 000441EF    mov         edi,edx
 000441F1    mov         esi,eax
 000441F3    mov         edx,edi
 000441F5    mov         eax,esi
 000441F7    mov         ecx,dword ptr [eax]
 000441F9    call        dword ptr [ecx-10]
 000441FC    test        byte ptr [esi+41],10
>00044200    jne         00044221
 00044202    movsx       eax,word ptr [edi+0A]
 00044206    push        eax
 00044207    mov         ax,word ptr [edi+4]
 0004420B    call        KeysToShiftState
 00044210    mov         edx,eax
 00044212    movsx       ecx,word ptr [edi+8]
 00044216    mov         eax,esi
 00044218    mov         bx,0FFDA
 0004421C    call        @CallDynaInst
 00044221    pop         edi
 00044222    pop         esi
 00044223    pop         ebx
 00044224    ret
*}
end;

//00044228
procedure TControl.MouseUp(Button:TMouseButton; Shift:TShiftState; X:Integer; Y:Integer);
begin
{*
 00044228    push        ebp
 00044229    mov         ebp,esp
 0004422B    push        ecx
 0004422C    push        ebx
 0004422D    mov         byte ptr [ebp-1],cl
 00044230    cmp         word ptr [eax+0C6],0
>00044238    je          00044258
 0004423A    mov         cl,byte ptr [ebp-1]
 0004423D    push        ecx
 0004423E    mov         ecx,dword ptr [ebp+0C]
 00044241    push        ecx
 00044242    mov         ecx,dword ptr [ebp+8]
 00044245    push        ecx
 00044246    mov         ebx,eax
 00044248    mov         ecx,edx
 0004424A    mov         edx,eax
 0004424C    mov         eax,dword ptr [ebx+0C8]
 00044252    call        dword ptr [ebx+0C4]
 00044258    pop         ebx
 00044259    pop         ecx
 0004425A    pop         ebp
 0004425B    ret         8
*}
end;

//00044260
procedure TControl.DoMouseUp(var Message:TWMMouse; Button:TMouseButton);
begin
{*
 00044260    push        ebx
 00044261    push        esi
 00044262    push        edi
 00044263    push        ecx
 00044264    mov         byte ptr [esp],cl
 00044267    mov         edi,edx
 00044269    mov         esi,eax
 0004426B    test        byte ptr [esi+41],10
>0004426F    jne         00044295
 00044271    movsx       eax,word ptr [edi+8]
 00044275    push        eax
 00044276    movsx       eax,word ptr [edi+0A]
 0004427A    push        eax
 0004427B    mov         ax,word ptr [edi+4]
 0004427F    call        KeysToShiftState
 00044284    mov         ecx,eax
 00044286    mov         dl,byte ptr [esp+8]
 0004428A    mov         eax,esi
 0004428C    mov         bx,0FFD9
 00044290    call        @CallDynaInst
 00044295    pop         edx
 00044296    pop         edi
 00044297    pop         esi
 00044298    pop         ebx
 00044299    ret
*}
end;

//0004429C
procedure TControl.WMLButtonUp(var Message:TWMLButtonUp);
begin
{*
 0004429C    push        ebx
 0004429D    push        esi
 0004429E    push        edi
 0004429F    add         esp,0FFFFFFE8
 000442A2    mov         edi,edx
 000442A4    mov         esi,eax
 000442A6    mov         edx,edi
 000442A8    mov         eax,esi
 000442AA    mov         ecx,dword ptr [eax]
 000442AC    call        dword ptr [ecx-10]
 000442AF    test        byte ptr [esi+40],2
>000442B3    je          000442BE
 000442B5    xor         edx,edx
 000442B7    mov         eax,esi
 000442B9    call        TControl.SetMouseCapture
 000442BE    test        byte ptr [esi+44],2
>000442C2    je          000442FF
 000442C4    and         word ptr [esi+44],0FFFFFFFD
 000442C9    mov         edx,esp
 000442CB    mov         eax,dword ptr [edi+8]
 000442CE    call        SmallPointToPoint
 000442D3    push        dword ptr [esp+4]
 000442D7    push        dword ptr [esp+4]
 000442DB    lea         edx,[esp+10]
 000442DF    mov         eax,esi
 000442E1    mov         ecx,dword ptr [eax]
 000442E3    call        dword ptr [ecx+44]
 000442E6    lea         eax,[esp+10]
 000442EA    push        eax
 000442EB    call        user32.PtInRect
 000442F0    test        eax,eax
>000442F2    je          000442FF
 000442F4    mov         eax,esi
 000442F6    mov         bx,0FFEC
 000442FA    call        @CallDynaInst
 000442FF    mov         edx,edi
 00044301    xor         ecx,ecx
 00044303    mov         eax,esi
 00044305    call        TControl.DoMouseUp
 0004430A    add         esp,18
 0004430D    pop         edi
 0004430E    pop         esi
 0004430F    pop         ebx
 00044310    ret
*}
end;

//00044314
procedure TControl.WMRButtonUp(var Message:TWMRButtonUp);
begin
{*
 00044314    push        ebx
 00044315    push        esi
 00044316    mov         esi,edx
 00044318    mov         ebx,eax
 0004431A    mov         edx,esi
 0004431C    mov         eax,ebx
 0004431E    mov         ecx,dword ptr [eax]
 00044320    call        dword ptr [ecx-10]
 00044323    mov         edx,esi
 00044325    mov         cl,1
 00044327    mov         eax,ebx
 00044329    call        TControl.DoMouseUp
 0004432E    cmp         dword ptr [esi+0C],0
>00044332    jne         0004433E
 00044334    mov         edx,dword ptr [esi+8]
 00044337    mov         eax,ebx
 00044339    call        TControl.CheckMenuPopup
 0004433E    pop         esi
 0004433F    pop         ebx
 00044340    ret
*}
end;

//00044344
procedure TControl.WMMButtonUp(var Message:TWMMButtonUp);
begin
{*
 00044344    push        ebx
 00044345    push        esi
 00044346    mov         esi,edx
 00044348    mov         ebx,eax
 0004434A    mov         edx,esi
 0004434C    mov         eax,ebx
 0004434E    mov         ecx,dword ptr [eax]
 00044350    call        dword ptr [ecx-10]
 00044353    mov         edx,esi
 00044355    mov         cl,2
 00044357    mov         eax,ebx
 00044359    call        TControl.DoMouseUp
 0004435E    pop         esi
 0004435F    pop         ebx
 00044360    ret
*}
end;

//00044364
procedure TControl.WMCancelMode(var Message:TWMCancelMode);
begin
{*
 00044364    push        esi
 00044365    mov         esi,eax
 00044367    mov         eax,esi
 00044369    mov         ecx,dword ptr [eax]
 0004436B    call        dword ptr [ecx-10]
 0004436E    mov         eax,esi
 00044370    call        TControl.GetMouseCapture
 00044375    test        al,al
>00044377    je          0004439A
 00044379    xor         edx,edx
 0004437B    mov         eax,esi
 0004437D    call        TControl.SetMouseCapture
 00044382    test        byte ptr [esi+44],1
>00044386    je          0004439F
 00044388    push        0FF
 0004438A    xor         ecx,ecx
 0004438C    mov         edx,202
 00044391    mov         eax,esi
 00044393    call        TControl.Perform
 00044398    pop         esi
 00044399    ret
 0004439A    and         word ptr [esi+44],0FFFFFFFE
 0004439F    pop         esi
 000443A0    ret
*}
end;

//000443A4
procedure TControl.WMWindowPosChanged(var Message:TWMWindowPosChanged);
begin
{*
 000443A4    push        ebx
 000443A5    push        esi
 000443A6    mov         esi,edx
 000443A8    mov         ebx,eax
 000443AA    mov         edx,esi
 000443AC    mov         eax,ebx
 000443AE    mov         ecx,dword ptr [eax]
 000443B0    call        dword ptr [ecx-10]
 000443B3    mov         al,[00044448]
 000443B8    and         al,byte ptr [ebx+20]
 000443BB    mov         dl,byte ptr ds:[4444C]
 000443C1    cmp         dl,al
>000443C3    jne         00044443
 000443C5    mov         eax,dword ptr [ebx+68]
 000443C8    mov         edx,dword ptr [eax+0C]
 000443CB    test        edx,edx
>000443CD    jbe         000443DC
 000443CF    cmp         edx,dword ptr [ebx+38]
>000443D2    jge         000443DC
 000443D4    mov         edx,dword ptr [ebx+38]
 000443D7    mov         dword ptr [eax+0C],edx
>000443DA    jmp         000443EE
 000443DC    mov         edx,dword ptr [eax+14]
 000443DF    test        edx,edx
>000443E1    jbe         000443EE
 000443E3    cmp         edx,dword ptr [ebx+38]
>000443E6    jle         000443EE
 000443E8    mov         edx,dword ptr [ebx+38]
 000443EB    mov         dword ptr [eax+14],edx
 000443EE    mov         edx,dword ptr [eax+8]
 000443F1    test        edx,edx
>000443F3    jbe         00044402
 000443F5    cmp         edx,dword ptr [ebx+3C]
>000443F8    jge         00044402
 000443FA    mov         edx,dword ptr [ebx+3C]
 000443FD    mov         dword ptr [eax+8],edx
>00044400    jmp         00044414
 00044402    mov         edx,dword ptr [eax+10]
 00044405    test        edx,edx
>00044407    jbe         00044414
 00044409    cmp         edx,dword ptr [ebx+3C]
>0004440C    jle         00044414
 0004440E    mov         edx,dword ptr [ebx+3C]
 00044411    mov         dword ptr [eax+10],edx
 00044414    mov         eax,dword ptr [esi+8]
 00044417    test        eax,eax
>00044419    je          00044443
 0004441B    cmp         dword ptr [ebx+8C],0
>00044422    je          00044443
 00044424    test        byte ptr [ebx+45],4
>00044428    jne         00044443
 0004442A    test        byte ptr [eax+18],1
>0004442E    jne         00044443
 00044430    cmp         dword ptr [eax+10],0
>00044434    je          00044443
 00044436    cmp         dword ptr [eax+14],0
>0004443A    je          00044443
 0004443C    mov         eax,ebx
 0004443E    call        TControl.CalcDockSizes
 00044443    pop         esi
 00044444    pop         ebx
 00044445    ret
*}
end;

//00044450
procedure TControl.CMVisibleChanged(var Message:TMessage);
begin
{*
 00044450    test        byte ptr [eax+20],10
>00044454    je          0004445C
 00044456    test        byte ptr [eax+41],4
>0004445A    je          00044475
 0004445C    cmp         byte ptr [eax+47],0
>00044460    je          00044468
 00044462    test        byte ptr [eax+40],40
>00044466    jne         0004446C
 00044468    xor         ecx,ecx
>0004446A    jmp         0004446E
 0004446C    mov         cl,1
 0004446E    mov         dl,1
 00044470    call        TControl.InvalidateControl
 00044475    ret
*}
end;

//00044478
procedure TControl.CMEnabledChanged;
begin
{*
 00044478    mov         edx,dword ptr [eax]
 0004447A    call        dword ptr [edx+78];TControl.Invalidate
 0004447D    ret
*}
end;

//00044480
procedure TControl.CMFontChanged(var Message:TMessage);
begin
{*
 00044480    mov         edx,dword ptr [eax]
 00044482    call        dword ptr [edx+78]
 00044485    ret
*}
end;

//00044488
procedure TControl.CMColorChanged(var Message:TMessage);
begin
{*
 00044488    mov         edx,dword ptr [eax]
 0004448A    call        dword ptr [edx+78]
 0004448D    ret
*}
end;

//00044490
procedure TControl.CMParentColorChanged(var Message:TMessage);
begin
{*
 00044490    push        ebx
 00044491    mov         ebx,eax
 00044493    cmp         byte ptr [ebx+4A],0
>00044497    je          000444BC
 00044499    cmp         dword ptr [edx+4],0
>0004449D    je          000444AB
 0004449F    mov         edx,dword ptr [edx+8]
 000444A2    mov         eax,ebx
 000444A4    call        TControl.SetColor
>000444A9    jmp         000444B8
 000444AB    mov         eax,dword ptr [ebx+24]
 000444AE    mov         edx,dword ptr [eax+64]
 000444B1    mov         eax,ebx
 000444B3    call        TControl.SetColor
 000444B8    mov         byte ptr [ebx+4A],1
 000444BC    pop         ebx
 000444BD    ret
*}
end;

//000444C0
procedure TControl.CMParentBiDiModeChanged(var Message:TMessage);
begin
{*
 000444C0    push        ebx
 000444C1    mov         ebx,eax
 000444C3    cmp         byte ptr [ebx+50],0
>000444C7    je          000444DE
 000444C9    mov         eax,dword ptr [ebx+24]
 000444CC    test        eax,eax
>000444CE    je          000444DA
 000444D0    mov         dl,byte ptr [eax+4F]
 000444D3    mov         eax,ebx
 000444D5    mov         ecx,dword ptr [eax]
 000444D7    call        dword ptr [ecx+6C]
 000444DA    mov         byte ptr [ebx+50],1
 000444DE    pop         ebx
 000444DF    ret
*}
end;

//000444E0
procedure TControl.CMBiDiModeChanged(var Message:TMessage);
begin
{*
 000444E0    mov         ecx,dword ptr ds:[0B5C08];SysLocale:TSysLocale
 000444E6    cmp         byte ptr [ecx+9],0
>000444EA    je          000444F7
 000444EC    cmp         dword ptr [edx+4],0
>000444F0    jne         000444F7
 000444F2    mov         edx,dword ptr [eax]
 000444F4    call        dword ptr [edx+78]
 000444F7    ret
*}
end;

//000444F8
procedure TControl.CMParentShowHintChanged(var Message:TMessage);
begin
{*
 000444F8    push        ebx
 000444F9    mov         ebx,eax
 000444FB    cmp         byte ptr [ebx+86],0
>00044502    je          0004451B
 00044504    mov         eax,dword ptr [ebx+24]
 00044507    mov         dl,byte ptr [eax+85]
 0004450D    mov         eax,ebx
 0004450F    call        TControl.SetShowHint
 00044514    mov         byte ptr [ebx+86],1
 0004451B    pop         ebx
 0004451C    ret
*}
end;

//00044520
procedure TControl.CMParentFontChanged(var Message:TMessage);
begin
{*
 00044520    push        ebx
 00044521    mov         ebx,eax
 00044523    cmp         byte ptr [ebx+49],0
>00044527    je          0004454C
 00044529    cmp         dword ptr [edx+4],0
>0004452D    je          0004453B
 0004452F    mov         edx,dword ptr [edx+8]
 00044532    mov         eax,ebx
 00044534    call        TControl.SetFont
>00044539    jmp         00044548
 0004453B    mov         eax,dword ptr [ebx+24]
 0004453E    mov         edx,dword ptr [eax+58]
 00044541    mov         eax,ebx
 00044543    call        TControl.SetFont
 00044548    mov         byte ptr [ebx+49],1
 0004454C    pop         ebx
 0004454D    ret
*}
end;

//00044550
procedure TControl.CMSysFontChanged(var Message:TMessage);
begin
{*
 00044550    push        ebx
 00044551    mov         ebx,eax
 00044553    cmp         byte ptr [ebx+46],0
>00044557    je          0004456E
 00044559    mov         eax,[000B5BDC];^Screen:TScreen
 0004455E    mov         eax,dword ptr [eax]
 00044560    mov         edx,dword ptr [eax+74]
 00044563    mov         eax,ebx
 00044565    call        TControl.SetFont
 0004456A    mov         byte ptr [ebx+46],1
 0004456E    pop         ebx
 0004456F    ret
*}
end;

//00044570
procedure TControl.CMHitTest(var Message:TWMNCHitTest);
begin
{*
 00044570    mov         dword ptr [edx+0C],1
 00044577    ret
*}
end;

//00044578
procedure TControl.CMMouseEnter(var Message:TMessage);
begin
{*
 00044578    mov         edx,dword ptr [eax+24]
 0004457B    test        edx,edx
>0004457D    je          0004458E
 0004457F    push        eax
 00044580    xor         ecx,ecx
 00044582    mov         eax,edx
 00044584    mov         edx,0B013
 00044589    call        TControl.Perform
 0004458E    ret
*}
end;

//00044590
procedure TControl.CMMouseLeave(var Message:TMessage);
begin
{*
 00044590    mov         edx,dword ptr [eax+24]
 00044593    test        edx,edx
>00044595    je          000445A6
 00044597    push        eax
 00044598    xor         ecx,ecx
 0004459A    mov         eax,edx
 0004459C    mov         edx,0B014
 000445A1    call        TControl.Perform
 000445A6    ret
*}
end;

//000445A8
procedure TControl.CMDesignHitTest(var Message:TWMMouse);
begin
{*
 000445A8    xor         eax,eax
 000445AA    mov         dword ptr [edx+0C],eax
 000445AD    ret
*}
end;

//000445B0
function TControl.CreateFloatingDockSite(Bounds:TRect):TWinControl;
begin
{*
 000445B0    push        ebx
 000445B1    push        esi
 000445B2    push        edi
 000445B3    add         esp,0FFFFFFF0
 000445B6    mov         esi,edx
 000445B8    lea         edi,[esp]
 000445BB    mov         ecx,4
 000445C0    rep movs    dword ptr [edi],dword ptr [esi]
 000445C2    mov         ebx,eax
 000445C4    xor         esi,esi
 000445C6    mov         eax,ebx
 000445C8    mov         edx,dword ptr [eax]
 000445CA    call        dword ptr [edx+58]
 000445CD    test        eax,eax
>000445CF    je          0004462D
 000445D1    mov         eax,ebx
 000445D3    mov         edx,dword ptr [eax]
 000445D5    call        dword ptr [edx+58]
 000445D8    mov         edi,eax
 000445DA    mov         eax,ebx
 000445DC    call        TObject.ClassType
 000445E1    cmp         edi,eax
>000445E3    je          0004462D
 000445E5    mov         eax,ebx
 000445E7    mov         edx,dword ptr [eax]
 000445E9    call        dword ptr [edx+58]
 000445EC    mov         ecx,dword ptr ds:[0B59E8];^Application:TApplication
 000445F2    mov         ecx,dword ptr [ecx]
 000445F4    mov         dl,1
 000445F6    call        dword ptr [eax+2C]
 000445F9    mov         esi,eax
 000445FB    mov         edx,dword ptr [esp+4]
 000445FF    mov         eax,esi
 00044601    call        TControl.SetTop
 00044606    mov         edx,dword ptr [esp]
 00044609    mov         eax,esi
 0004460B    call        TControl.SetLeft
 00044610    mov         edx,dword ptr [esp+8]
 00044614    sub         edx,dword ptr [esp]
 00044617    mov         eax,esi
 00044619    call        TControl.SetClientWidth
 0004461E    mov         edx,dword ptr [esp+0C]
 00044622    sub         edx,dword ptr [esp+4]
 00044626    mov         eax,esi
 00044628    call        TControl.SetClientHeight
 0004462D    mov         eax,esi
 0004462F    add         esp,10
 00044632    pop         edi
 00044633    pop         esi
 00044634    pop         ebx
 00044635    ret
*}
end;

//00044638
procedure UpdateFloatingDockSitePos;
begin
{*
 00044638    push        ebp
 00044639    mov         ebp,esp
 0004463B    add         esp,0FFFFFFE0
 0004463E    push        ebx
 0004463F    push        esi
 00044640    push        edi
 00044641    mov         edi,dword ptr [ebp+8]
 00044644    add         edi,0FFFFFFFC
 00044647    lea         ecx,[ebp-10]
 0004464A    mov         eax,dword ptr [edi]
 0004464C    mov         edx,dword ptr [eax+34]
 0004464F    mov         eax,dword ptr [edi]
 00044651    mov         eax,dword ptr [eax+30]
 00044654    call        Point
 00044659    lea         edx,[ebp-10]
 0004465C    lea         ecx,[ebp-8]
 0004465F    mov         eax,dword ptr [edi]
 00044661    mov         eax,dword ptr [eax+24]
 00044664    call        TControl.ClientToScreen
 00044669    mov         eax,dword ptr [ebp+8]
 0004466C    mov         eax,dword ptr [eax-8]
 0004466F    mov         eax,dword ptr [eax+8]
 00044672    lea         ebx,[eax+38]
 00044675    mov         eax,dword ptr [ebx+0C]
 00044678    sub         eax,dword ptr [ebx+4]
 0004467B    mov         edx,dword ptr [edi]
 0004467D    mov         esi,dword ptr [edx+24]
 00044680    add         eax,dword ptr [esi+3C]
 00044683    mov         edx,dword ptr [edi]
 00044685    sub         eax,dword ptr [edx+3C]
 00044688    push        eax
 00044689    lea         eax,[ebp-20]
 0004468C    push        eax
 0004468D    mov         ecx,dword ptr [ebx+8]
 00044690    sub         ecx,dword ptr [ebx]
 00044692    add         ecx,dword ptr [esi+38]
 00044695    mov         eax,dword ptr [edi]
 00044697    sub         ecx,dword ptr [eax+38]
 0004469A    mov         edx,dword ptr [esi+34]
 0004469D    add         edx,dword ptr [ebx+4]
 000446A0    sub         edx,dword ptr [ebp-4]
 000446A3    mov         eax,dword ptr [esi+30]
 000446A6    add         eax,dword ptr [ebx]
 000446A8    sub         eax,dword ptr [ebp-8]
 000446AB    call        Bounds
 000446B0    lea         edx,[ebp-20]
 000446B3    mov         eax,esi
 000446B5    call        TControl.SetBoundsRect
 000446BA    pop         edi
 000446BB    pop         esi
 000446BC    pop         ebx
 000446BD    mov         esp,ebp
 000446BF    pop         ebp
 000446C0    ret
*}
end;

//000446C4
procedure TControl.CMFloat(var Message:TCMFloat);
begin
{*
 000446C4    push        ebp
 000446C5    mov         ebp,esp
 000446C7    add         esp,0FFFFFFF8
 000446CA    push        ebx
 000446CB    mov         dword ptr [ebp-8],edx
 000446CE    mov         dword ptr [ebp-4],eax
 000446D1    mov         eax,dword ptr [ebp-4]
 000446D4    mov         edx,dword ptr [eax]
 000446D6    call        dword ptr [edx+54]
 000446D9    test        al,al
>000446DB    je          000446EF
 000446DD    mov         eax,dword ptr [ebp-4]
 000446E0    cmp         dword ptr [eax+24],0
>000446E4    je          000446EF
 000446E6    push        ebp
 000446E7    call        UpdateFloatingDockSitePos
 000446EC    pop         ecx
>000446ED    jmp         0004471F
 000446EF    mov         eax,dword ptr [ebp-8]
 000446F2    mov         eax,dword ptr [eax+8]
 000446F5    lea         edx,[eax+38]
 000446F8    mov         eax,dword ptr [ebp-4]
 000446FB    call        TControl.CreateFloatingDockSite
 00044700    mov         ebx,eax
 00044702    test        ebx,ebx
>00044704    je          0004471F
 00044706    mov         eax,dword ptr [ebp-8]
 00044709    mov         eax,dword ptr [eax+8]
 0004470C    mov         dword ptr [eax+4],ebx
 0004470F    mov         eax,ebx
 00044711    call        TWinControl.GetHandle
 00044716    mov         edx,dword ptr [ebp-8]
 00044719    mov         edx,dword ptr [edx+8]
 0004471C    mov         dword ptr [edx+8],eax
 0004471F    pop         ebx
 00044720    pop         ecx
 00044721    pop         ecx
 00044722    pop         ebp
 00044723    ret
*}
end;

//00044724
procedure TControl.ActionChange(Sender:TObject; CheckDefaults:Boolean);
begin
{*
 00044724    push        ebp
 00044725    mov         ebp,esp
 00044727    push        0
 00044729    push        ebx
 0004472A    push        esi
 0004472B    push        edi
 0004472C    mov         ebx,ecx
 0004472E    mov         edi,edx
 00044730    mov         esi,eax
 00044732    xor         eax,eax
 00044734    push        ebp
 00044735    push        447EB
 0004473A    push        dword ptr fs:[eax]
 0004473D    mov         dword ptr fs:[eax],esp
 00044740    mov         eax,edi
 00044742    mov         edx,dword ptr ds:[4D3E8];TCustomAction
 00044748    call        @IsClass
 0004474D    test        al,al
>0004474F    je          000447D5
 00044755    test        bl,bl
>00044757    je          00044769
 00044759    lea         edx,[ebp-4]
 0004475C    mov         eax,esi
 0004475E    call        TControl.GetText
 00044763    cmp         dword ptr [ebp-4],0
>00044767    jne         00044773
 00044769    mov         edx,dword ptr [edi+4C]
 0004476C    mov         eax,esi
 0004476E    call        TControl.SetText
 00044773    test        bl,bl
>00044775    je          00044782
 00044777    mov         eax,esi
 00044779    mov         edx,dword ptr [eax]
 0004477B    call        dword ptr [edx+50]
 0004477E    cmp         al,1
>00044780    jne         0004478C
 00044782    mov         dl,byte ptr [edi+51]
 00044785    mov         eax,esi
 00044787    mov         ecx,dword ptr [eax]
 00044789    call        dword ptr [ecx+60]
 0004478C    test        bl,bl
>0004478E    je          00044796
 00044790    cmp         dword ptr [esi+74],0
>00044794    jne         000447A1
 00044796    lea         eax,[esi+74]
 00044799    mov         edx,dword ptr [edi+58]
 0004479C    call        @LStrAsg
 000447A1    test        bl,bl
>000447A3    je          000447AB
 000447A5    cmp         byte ptr [esi+47],1
>000447A9    jne         000447B5
 000447AB    mov         dl,byte ptr [edi+62]
 000447AE    mov         eax,esi
 000447B0    call        TControl.SetVisible
 000447B5    test        bl,bl
>000447B7    je          000447C3
 000447B9    cmp         word ptr [esi+106],0
>000447C1    jne         000447D5
 000447C3    mov         eax,dword ptr [edi+2C]
 000447C6    mov         dword ptr [esi+104],eax
 000447CC    mov         eax,dword ptr [edi+30]
 000447CF    mov         dword ptr [esi+108],eax
 000447D5    xor         eax,eax
 000447D7    pop         edx
 000447D8    pop         ecx
 000447D9    pop         ecx
 000447DA    mov         dword ptr fs:[eax],edx
 000447DD    push        447F2
 000447E2    lea         eax,[ebp-4]
 000447E5    call        @LStrClr
 000447EA    ret
>000447EB    jmp         @HandleFinally
>000447F0    jmp         000447E2
 000447F2    pop         edi
 000447F3    pop         esi
 000447F4    pop         ebx
 000447F5    pop         ecx
 000447F6    pop         ebp
 000447F7    ret
*}
end;

//000447F8
procedure TControl.DoActionChange(Sender:TObject);
begin
{*
 000447F8    push        ebx
 000447F9    push        esi
 000447FA    mov         esi,edx
 000447FC    mov         ebx,eax
 000447FE    mov         eax,ebx
 00044800    call        TControl.GetAction
 00044805    cmp         esi,eax
>00044807    jne         00044818
 00044809    xor         ecx,ecx
 0004480B    mov         edx,esi
 0004480D    mov         eax,ebx
 0004480F    mov         bx,0FFF0
 00044813    call        @CallDynaInst
 00044818    pop         esi
 00044819    pop         ebx
 0004481A    ret
*}
end;

//0004481C
procedure TControl.sub_0004481C;
begin
{*
 0004481C    mov         eax,[0003E22C];TControlActionLink
 00044821    ret
*}
end;

//00044824
function TControl.IsCaptionStored(Value:TCaption):Boolean;
begin
{*
 00044824    push        ebx
 00044825    push        esi
 00044826    mov         ebx,eax
 00044828    mov         esi,dword ptr [ebx+5C]
 0004482B    test        esi,esi
>0004482D    je          0004483F
 0004482F    mov         eax,esi
 00044831    mov         edx,dword ptr [eax]
 00044833    call        dword ptr [edx+1C]
 00044836    test        al,al
>00044838    je          0004483F
 0004483A    xor         eax,eax
 0004483C    pop         esi
 0004483D    pop         ebx
 0004483E    ret
 0004483F    mov         al,1
 00044841    pop         esi
 00044842    pop         ebx
 00044843    ret
*}
end;

//00044844
function TControl.IsEnabledStored(Value:Boolean):Boolean;
begin
{*
 00044844    push        ebx
 00044845    push        esi
 00044846    mov         ebx,eax
 00044848    mov         esi,dword ptr [ebx+5C]
 0004484B    test        esi,esi
>0004484D    je          0004485F
 0004484F    mov         eax,esi
 00044851    mov         edx,dword ptr [eax]
 00044853    call        dword ptr [edx+24]
 00044856    test        al,al
>00044858    je          0004485F
 0004485A    xor         eax,eax
 0004485C    pop         esi
 0004485D    pop         ebx
 0004485E    ret
 0004485F    mov         al,1
 00044861    pop         esi
 00044862    pop         ebx
 00044863    ret
*}
end;

//00044864
function TControl.IsHintStored(Value:String):Boolean;
begin
{*
 00044864    push        ebx
 00044865    push        esi
 00044866    mov         ebx,eax
 00044868    mov         esi,dword ptr [ebx+5C]
 0004486B    test        esi,esi
>0004486D    je          0004487F
 0004486F    mov         eax,esi
 00044871    mov         edx,dword ptr [eax]
 00044873    call        dword ptr [edx+2C]
 00044876    test        al,al
>00044878    je          0004487F
 0004487A    xor         eax,eax
 0004487C    pop         esi
 0004487D    pop         ebx
 0004487E    ret
 0004487F    mov         al,1
 00044881    pop         esi
 00044882    pop         ebx
 00044883    ret
*}
end;

//00044884
function TControl.IsVisibleStored(Value:Boolean):Boolean;
begin
{*
 00044884    push        ebx
 00044885    push        esi
 00044886    mov         ebx,eax
 00044888    mov         esi,dword ptr [ebx+5C]
 0004488B    test        esi,esi
>0004488D    je          0004489F
 0004488F    mov         eax,esi
 00044891    mov         edx,dword ptr [eax]
 00044893    call        dword ptr [edx+38]
 00044896    test        al,al
>00044898    je          0004489F
 0004489A    xor         eax,eax
 0004489C    pop         esi
 0004489D    pop         ebx
 0004489E    ret
 0004489F    mov         al,1
 000448A1    pop         esi
 000448A2    pop         ebx
 000448A3    ret
*}
end;

//000448A4
function TControl.IsOnClickStored(Value:TNotifyEvent):Boolean;
begin
{*
 000448A4    push        ebx
 000448A5    push        esi
 000448A6    mov         ebx,eax
 000448A8    mov         esi,dword ptr [ebx+5C]
 000448AB    test        esi,esi
>000448AD    je          000448BF
 000448AF    mov         eax,esi
 000448B1    mov         edx,dword ptr [eax]
 000448B3    call        dword ptr [edx+8]
 000448B6    test        al,al
>000448B8    je          000448BF
 000448BA    xor         eax,eax
 000448BC    pop         esi
 000448BD    pop         ebx
 000448BE    ret
 000448BF    mov         al,1
 000448C1    pop         esi
 000448C2    pop         ebx
 000448C3    ret
*}
end;

//000448C4
procedure TControl.Loaded;
begin
{*
 000448C4    push        ebx
 000448C5    mov         ebx,eax
 000448C7    mov         eax,ebx
 000448C9    call        TComponent.Loaded
 000448CE    mov         eax,ebx
 000448D0    call        TControl.GetAction
 000448D5    test        eax,eax
>000448D7    je          000448EF
 000448D9    mov         eax,ebx
 000448DB    call        TControl.GetAction
 000448E0    mov         edx,eax
 000448E2    mov         cl,1
 000448E4    mov         eax,ebx
 000448E6    mov         bx,0FFF0
 000448EA    call        @CallDynaInst
 000448EF    pop         ebx
 000448F0    ret
*}
end;

//000448F4
procedure TControl.AssignTo(Dest:TPersistent);
begin
{*
 000448F4    push        ebp
 000448F5    mov         ebp,esp
 000448F7    push        0
 000448F9    push        ebx
 000448FA    push        esi
 000448FB    push        edi
 000448FC    mov         esi,edx
 000448FE    mov         ebx,eax
 00044900    xor         eax,eax
 00044902    push        ebp
 00044903    push        4498D
 00044908    push        dword ptr fs:[eax]
 0004490B    mov         dword ptr fs:[eax],esp
 0004490E    mov         eax,esi
 00044910    mov         edx,dword ptr ds:[4D3E8];TCustomAction
 00044916    call        @IsClass
 0004491B    test        al,al
>0004491D    je          0004496E
 0004491F    mov         eax,ebx
 00044921    mov         edx,dword ptr [eax]
 00044923    call        dword ptr [edx+50]
 00044926    mov         edx,eax
 00044928    mov         edi,esi
 0004492A    mov         eax,edi
 0004492C    call        TCustomAction.SetEnabled
 00044931    mov         edx,dword ptr [ebx+74]
 00044934    mov         eax,edi
 00044936    call        TCustomAction.SetHint
 0004493B    lea         edx,[ebp-4]
 0004493E    mov         eax,ebx
 00044940    call        TControl.GetText
 00044945    mov         edx,dword ptr [ebp-4]
 00044948    mov         eax,edi
 0004494A    call        TCustomAction.SetCaption
 0004494F    mov         dl,byte ptr [ebx+47]
 00044952    mov         eax,edi
 00044954    call        TCustomAction.SetVisible
 00044959    push        dword ptr [ebx+108]
 0004495F    push        dword ptr [ebx+104]
 00044965    mov         eax,edi
 00044967    mov         edx,dword ptr [eax]
 00044969    call        dword ptr [edx+34]
>0004496C    jmp         00044977
 0004496E    mov         edx,esi
 00044970    mov         eax,ebx
 00044972    call        TPersistent.AssignTo
 00044977    xor         eax,eax
 00044979    pop         edx
 0004497A    pop         ecx
 0004497B    pop         ecx
 0004497C    mov         dword ptr fs:[eax],edx
 0004497F    push        44994
 00044984    lea         eax,[ebp-4]
 00044987    call        @LStrClr
 0004498C    ret
>0004498D    jmp         @HandleFinally
>00044992    jmp         00044984
 00044994    pop         edi
 00044995    pop         esi
 00044996    pop         ebx
 00044997    pop         ecx
 00044998    pop         ebp
 00044999    ret
*}
end;

//0004499C
function MinVar(const Data:array[$0..-$1] of System.Double; const _Dv_:$0..-$1):Integer;
begin
{*
 0004499C    push        ebp
 0004499D    mov         ebp,esp
 0004499F    push        ecx
 000449A0    push        ebx
 000449A1    push        esi
 000449A2    mov         dword ptr [ebp-4],eax
 000449A5    xor         ebx,ebx
 000449A7    mov         ecx,edx
 000449A9    test        ecx,ecx
>000449AB    jle         000449CE
 000449AD    mov         esi,1
 000449B2    mov         edx,dword ptr [ebp-4]
 000449B5    add         edx,8
 000449B8    fld         qword ptr [edx]
 000449BA    mov         eax,dword ptr [ebp-4]
 000449BD    fcomp       qword ptr [eax+ebx*8]
 000449C0    fnstsw      al
 000449C2    sahf
>000449C3    jae         000449C7
 000449C5    mov         ebx,esi
 000449C7    inc         esi
 000449C8    add         edx,8
 000449CB    dec         ecx
>000449CC    jne         000449B8
 000449CE    mov         eax,ebx
 000449D0    pop         esi
 000449D1    pop         ebx
 000449D2    pop         ecx
 000449D3    pop         ebp
 000449D4    ret
*}
end;

//000449D8
procedure TControl.GetDockEdge(MousePos:TPoint);
begin
{*
 000449D8    push        ebx
 000449D9    push        esi
 000449DA    push        edi
 000449DB    push        ebp
 000449DC    add         esp,0FFFFFFC8
 000449DF    mov         esi,edx
 000449E1    lea         edi,[esp]
 000449E4    movs        dword ptr [edi],dword ptr [esi]
 000449E5    movs        dword ptr [edi],dword ptr [esi]
 000449E6    xor         ebx,ebx
 000449E8    mov         esi,dword ptr [eax+38]
 000449EB    mov         edi,dword ptr [eax+3C]
 000449EE    mov         eax,dword ptr [esp]
 000449F1    test        eax,eax
>000449F3    jg          000449FC
 000449F5    mov         bl,3
>000449F7    jmp         00044A7D
 000449FC    cmp         esi,eax
>000449FE    jg          00044A04
 00044A00    mov         bl,4
>00044A02    jmp         00044A7D
 00044A04    mov         edx,dword ptr [esp+4]
 00044A08    test        edx,edx
>00044A0A    jg          00044A10
 00044A0C    mov         bl,1
>00044A0E    jmp         00044A7D
 00044A10    cmp         edi,edx
>00044A12    jg          00044A18
 00044A14    mov         bl,2
>00044A16    jmp         00044A7D
 00044A18    mov         ebp,edx
 00044A1A    sub         edi,edx
 00044A1C    mov         dword ptr [esp+8],eax
 00044A20    sub         esi,eax
 00044A22    fild        dword ptr [esp+8]
 00044A26    fstp        qword ptr [esp+0C]
 00044A2A    wait
 00044A2B    mov         dword ptr [esp+2C],esi
 00044A2F    fild        dword ptr [esp+2C]
 00044A33    fstp        qword ptr [esp+14]
 00044A37    wait
 00044A38    mov         dword ptr [esp+30],ebp
 00044A3C    fild        dword ptr [esp+30]
 00044A40    fstp        qword ptr [esp+1C]
 00044A44    wait
 00044A45    mov         dword ptr [esp+34],edi
 00044A49    fild        dword ptr [esp+34]
 00044A4D    fstp        qword ptr [esp+24]
 00044A51    wait
 00044A52    lea         eax,[esp+0C]
 00044A56    mov         edx,3
 00044A5B    call        MinVar
 00044A60    sub         eax,1
>00044A63    jb          00044A6F
>00044A65    je          00044A73
 00044A67    dec         eax
>00044A68    je          00044A77
 00044A6A    dec         eax
>00044A6B    je          00044A7B
>00044A6D    jmp         00044A7D
 00044A6F    mov         bl,3
>00044A71    jmp         00044A7D
 00044A73    mov         bl,4
>00044A75    jmp         00044A7D
 00044A77    mov         bl,1
>00044A79    jmp         00044A7D
 00044A7B    mov         bl,2
 00044A7D    mov         eax,ebx
 00044A7F    add         esp,38
 00044A82    pop         ebp
 00044A83    pop         edi
 00044A84    pop         esi
 00044A85    pop         ebx
 00044A86    ret
*}
end;

//00044A88
function TControl.GetFloating:Boolean;
begin
{*
 00044A88    push        ebx
 00044A89    mov         ebx,eax
 00044A8B    cmp         dword ptr [ebx+8C],0
>00044A92    je          00044AAC
 00044A94    mov         eax,ebx
 00044A96    mov         edx,dword ptr [eax]
 00044A98    call        dword ptr [edx+58]
 00044A9B    mov         edx,eax
 00044A9D    mov         eax,dword ptr [ebx+8C]
 00044AA3    call        @IsClass
 00044AA8    test        al,al
>00044AAA    jne         00044AB0
 00044AAC    xor         eax,eax
 00044AAE    pop         ebx
 00044AAF    ret
 00044AB0    mov         al,1
 00044AB2    pop         ebx
 00044AB3    ret
*}
end;

//00044AB4
{*function sub_00044AB4:?;
begin
 00044AB4    mov         eax,dword ptr [eax+0A0];TControl.FFloatingDockSiteClass:TWinControlClass
 00044ABA    ret
end;*}

//00044ABC
procedure TControl.AdjustSize;
begin
{*
 00044ABC    push        ebx
 00044ABD    test        byte ptr [eax+20],1
>00044AC1    jne         00044AD9
 00044AC3    mov         edx,dword ptr [eax+38]
 00044AC6    push        edx
 00044AC7    mov         edx,dword ptr [eax+3C]
 00044ACA    push        edx
 00044ACB    mov         ecx,dword ptr [eax+34]
 00044ACE    mov         edx,dword ptr [eax+30]
 00044AD1    mov         ebx,dword ptr [eax]
 00044AD3    call        dword ptr [ebx+80]
 00044AD9    pop         ebx
 00044ADA    ret
*}
end;

//00044ADC
function TControl.DrawTextBiDiModeFlags(Flags:Longint):Longint;
begin
{*
 00044ADC    push        ebx
 00044ADD    push        esi
 00044ADE    push        edi
 00044ADF    mov         edi,eax
 00044AE1    mov         esi,edx
 00044AE3    mov         eax,edi
 00044AE5    mov         bx,0FFCF
 00044AE9    call        @CallDynaInst
 00044AEE    test        al,al
>00044AF0    je          00044B0C
 00044AF2    mov         eax,esi
 00044AF4    and         eax,2
 00044AF7    cmp         eax,2
>00044AFA    jne         00044B01
 00044AFC    and         esi,0FFFFFFFD
>00044AFF    jmp         00044B0C
 00044B01    mov         eax,esi
 00044B03    and         eax,1
 00044B06    dec         eax
>00044B07    je          00044B0C
 00044B09    or          esi,2
 00044B0C    mov         eax,edi
 00044B0E    call        TControl.DrawTextBiDiModeFlagsReadingOnly
 00044B13    or          esi,eax
 00044B15    mov         eax,esi
 00044B17    pop         edi
 00044B18    pop         esi
 00044B19    pop         ebx
 00044B1A    ret
*}
end;

//00044B1C
function TControl.DrawTextBiDiModeFlagsReadingOnly:Longint;
begin
{*
 00044B1C    push        ebx
 00044B1D    mov         ebx,eax
 00044B1F    mov         eax,ebx
 00044B21    call        TControl.UseRightToLeftReading
 00044B26    test        al,al
>00044B28    je          00044B31
 00044B2A    mov         eax,20000
 00044B2F    pop         ebx
 00044B30    ret
 00044B31    xor         eax,eax
 00044B33    pop         ebx
 00044B34    ret
*}
end;

//00044B38
procedure TControl.InitiateAction;
begin
{*
 00044B38    mov         edx,dword ptr [eax+5C]
 00044B3B    test        edx,edx
>00044B3D    je          00044B46
 00044B3F    mov         eax,edx
 00044B41    mov         edx,dword ptr [eax]
 00044B43    call        dword ptr [edx+18]
 00044B46    ret
*}
end;

//00044B48
procedure TControl.CMHintShow(var Message:TMessage);
begin
{*
 00044B48    push        ebx
 00044B49    push        esi
 00044B4A    push        edi
 00044B4B    mov         edi,edx
 00044B4D    mov         ebx,eax
 00044B4F    mov         esi,dword ptr [ebx+5C]
 00044B52    test        esi,esi
>00044B54    je          00044B6E
 00044B56    mov         eax,dword ptr [edi+8]
 00044B59    lea         edx,[eax+38]
 00044B5C    mov         eax,esi
 00044B5E    mov         ecx,dword ptr [eax]
 00044B60    call        dword ptr [ecx+5C]
 00044B63    test        al,al
>00044B65    jne         00044B6E
 00044B67    mov         dword ptr [edi+0C],1
 00044B6E    pop         edi
 00044B6F    pop         esi
 00044B70    pop         ebx
 00044B71    ret
*}
end;

//00044B74
procedure TControl.UpdateLastResize(NewWidth:Integer; NewHeight:Integer);
begin
{*
 00044B74    mov         dword ptr [eax+80],edx
 00044B7A    mov         dword ptr [eax+7C],ecx
 00044B7D    ret
*}
end;

//00044B80
procedure TWinControlActionLink.AssignClient(AClient:TObject);
begin
{*
 00044B80    push        ebx
 00044B81    push        esi
 00044B82    mov         esi,edx
 00044B84    mov         ebx,eax
 00044B86    mov         edx,esi
 00044B88    mov         eax,ebx
 00044B8A    call        TControlActionLink.AssignClient
 00044B8F    mov         eax,esi
 00044B91    mov         edx,dword ptr ds:[3F0BC];TWinControl
 00044B97    call        @AsClass
 00044B9C    mov         dword ptr [ebx+14],eax
 00044B9F    pop         esi
 00044BA0    pop         ebx
 00044BA1    ret
*}
end;

//00044BA4
function TWinControlActionLink.IsHelpContextLinked:Boolean;
begin
{*
 00044BA4    push        ebx
 00044BA5    mov         ebx,eax
 00044BA7    mov         eax,ebx
 00044BA9    call        TActionLink.IsHelpContextLinked
 00044BAE    test        al,al
>00044BB0    je          00044BCE
 00044BB2    mov         eax,dword ptr [ebx+0C]
 00044BB5    mov         edx,dword ptr ds:[4D3E8];TCustomAction
 00044BBB    call        @AsClass
 00044BC0    mov         eax,dword ptr [eax+54]
 00044BC3    mov         edx,dword ptr [ebx+14]
 00044BC6    cmp         eax,dword ptr [edx+144]
>00044BCC    je          00044BD2
 00044BCE    xor         eax,eax
 00044BD0    pop         ebx
 00044BD1    ret
 00044BD2    mov         al,1
 00044BD4    pop         ebx
 00044BD5    ret
*}
end;

//00044BD8
procedure TWinControlActionLink.SetHelpContext(Value:THelpContext);
begin
{*
 00044BD8    push        ebx
 00044BD9    push        esi
 00044BDA    mov         esi,edx
 00044BDC    mov         ebx,eax
 00044BDE    mov         eax,ebx
 00044BE0    mov         edx,dword ptr [eax]
 00044BE2    call        dword ptr [edx+28]
 00044BE5    test        al,al
>00044BE7    je          00044BF2
 00044BE9    mov         eax,dword ptr [ebx+14]
 00044BEC    mov         dword ptr [eax+144],esi
 00044BF2    pop         esi
 00044BF3    pop         ebx
 00044BF4    ret
*}
end;

//00044BF8
constructor TWinControl.Create(AOwner:TComponent);
begin
{*
 00044BF8    push        ebp
 00044BF9    mov         ebp,esp
 00044BFB    push        ecx
 00044BFC    push        ebx
 00044BFD    push        esi
 00044BFE    test        dl,dl
>00044C00    je          00044C0A
 00044C02    add         esp,0FFFFFFF0
 00044C05    call        @ClassCreate
 00044C0A    mov         byte ptr [ebp-1],dl
 00044C0D    mov         ebx,eax
 00044C0F    xor         edx,edx
 00044C11    mov         eax,ebx
 00044C13    call        TControl.Create
 00044C18    push        ebx
 00044C19    push        4614C;TWinControl.MainWndProc
 00044C1E    call        MakeObjectInstance
 00044C23    mov         dword ptr [ebx+160],eax
 00044C29    mov         dl,1
 00044C2B    mov         eax,[0002899C];TBrush
 00044C30    call        TBrush.Create
 00044C35    mov         esi,eax
 00044C37    mov         dword ptr [ebx+124],esi
 00044C3D    mov         edx,dword ptr [ebx+64]
 00044C40    mov         eax,esi
 00044C42    call        TBrush.SetColor
 00044C47    mov         byte ptr [ebx+164],1
 00044C4E    mov         dword ptr [ebx+174],0FFFFFFFF
 00044C58    mov         byte ptr [ebx+148],3
 00044C5F    mov         eax,[000B5C08];SysLocale:TSysLocale
 00044C64    cmp         word ptr [eax+4],11
>00044C69    jne         00044C78
 00044C6B    lea         eax,[ebx+14C]
 00044C71    call        @LStrClr
>00044C76    jmp         00044C8E
 00044C78    lea         eax,[ebx+14C]
 00044C7E    mov         edx,dword ptr ds:[0B5BDC];^Screen:TScreen
 00044C84    mov         edx,dword ptr [edx]
 00044C86    mov         edx,dword ptr [edx+2C]
 00044C89    call        @LStrAsg
 00044C8E    mov         byte ptr [ebx+180],0
 00044C95    mov         al,[00044CD8]
 00044C9A    mov         byte ptr [ebx+116],al
 00044CA0    mov         byte ptr [ebx+117],2
 00044CA7    mov         byte ptr [ebx+118],1
 00044CAE    mov         dword ptr [ebx+11C],1
 00044CB8    mov         eax,ebx
 00044CBA    cmp         byte ptr [ebp-1],0
>00044CBE    je          00044CCF
 00044CC0    call        @AfterConstruction
 00044CC5    pop         dword ptr fs:[0]
 00044CCC    add         esp,0C
 00044CCF    mov         eax,ebx
 00044CD1    pop         esi
 00044CD2    pop         ebx
 00044CD3    pop         ecx
 00044CD4    pop         ebp
 00044CD5    ret
*}
end;

//00044CDC
destructor TWinControl.Destroy;
begin
{*
 00044CDC    push        ebx
 00044CDD    push        esi
 00044CDE    push        ecx
 00044CDF    call        @BeforeDestruction
 00044CE4    mov         byte ptr [esp],dl
 00044CE7    mov         ebx,eax
 00044CE9    mov         eax,ebx
 00044CEB    call        TComponent.Destroying
 00044CF0    cmp         byte ptr [ebx+138],0
>00044CF7    je          00044D09
 00044CF9    mov         byte ptr [ebx+138],0
 00044D00    xor         edx,edx
 00044D02    mov         eax,ebx
 00044D04    call        RegisterDockSite
 00044D09    lea         eax,[ebx+13C]
 00044D0F    call        @IntfClear
 00044D14    mov         eax,dword ptr [ebx+134]
 00044D1A    call        TObject.Free
 00044D1F    cmp         dword ptr [ebx+24],0
>00044D23    je          00044D2E
 00044D25    mov         dl,1
 00044D27    mov         eax,ebx
 00044D29    call        TWinControl.RemoveFocus
 00044D2E    cmp         dword ptr [ebx+140],0
>00044D35    je          00044D41
 00044D37    mov         eax,ebx
 00044D39    mov         edx,dword ptr [eax]
 00044D3B    call        dword ptr [edx+0A0]
 00044D41    mov         eax,ebx
 00044D43    call        TWinControl.GetControlCount
 00044D48    test        eax,eax
>00044D4A    je          00044D75
 00044D4C    mov         edx,eax
 00044D4E    dec         edx
 00044D4F    mov         eax,ebx
 00044D51    call        TWinControl.GetControl
 00044D56    mov         esi,eax
 00044D58    mov         edx,esi
 00044D5A    mov         eax,ebx
 00044D5C    call        TWinControl.Remove
 00044D61    mov         dl,1
 00044D63    mov         eax,esi
 00044D65    mov         ecx,dword ptr [eax]
 00044D67    call        dword ptr [ecx-4]
 00044D6A    mov         eax,ebx
 00044D6C    call        TWinControl.GetControlCount
 00044D71    test        eax,eax
>00044D73    jne         00044D4C
 00044D75    mov         eax,dword ptr [ebx+124]
 00044D7B    call        TObject.Free
 00044D80    mov         eax,dword ptr [ebx+160]
 00044D86    test        eax,eax
>00044D88    je          00044D8F
 00044D8A    call        FreeObjectInstance
 00044D8F    mov         dl,byte ptr [esp]
 00044D92    and         dl,0FC
 00044D95    mov         eax,ebx
 00044D97    call        TControl.Destroy
 00044D9C    cmp         byte ptr [esp],0
>00044DA0    jle         00044DA9
 00044DA2    mov         eax,ebx
 00044DA4    call        @ClassDestroy
 00044DA9    pop         edx
 00044DAA    pop         esi
 00044DAB    pop         ebx
 00044DAC    ret
*}
end;

//00044DB0
procedure TWinControl.FixupTabList;
begin
{*
 00044DB0    push        ebp
 00044DB1    mov         ebp,esp
 00044DB3    add         esp,0FFFFFFF4
 00044DB6    push        ebx
 00044DB7    push        esi
 00044DB8    mov         dword ptr [ebp-4],eax
 00044DBB    mov         eax,dword ptr [ebp-4]
 00044DBE    cmp         dword ptr [eax+184],0
>00044DC5    je          00044E7B
 00044DCB    mov         dl,1
 00044DCD    mov         eax,[0001EEC4];TList
 00044DD2    call        TObject.Create
 00044DD7    mov         dword ptr [ebp-0C],eax
 00044DDA    xor         ecx,ecx
 00044DDC    push        ebp
 00044DDD    push        44E74
 00044DE2    push        dword ptr fs:[ecx]
 00044DE5    mov         dword ptr fs:[ecx],esp
 00044DE8    mov         eax,dword ptr [ebp-4]
 00044DEB    mov         eax,dword ptr [eax+184]
 00044DF1    mov         eax,dword ptr [eax+8]
 00044DF4    mov         dword ptr [ebp-8],eax
 00044DF7    mov         edx,dword ptr [ebp-8]
 00044DFA    mov         eax,dword ptr [ebp-0C]
 00044DFD    call        TList.SetCount
 00044E02    mov         ebx,dword ptr [ebp-8]
 00044E05    dec         ebx
 00044E06    test        ebx,ebx
>00044E08    jl          00044E3A
 00044E0A    inc         ebx
 00044E0B    xor         esi,esi
 00044E0D    mov         eax,dword ptr [ebp-4]
 00044E10    mov         eax,dword ptr [eax+184]
 00044E16    mov         edx,esi
 00044E18    call        TList.Get
 00044E1D    mov         edx,dword ptr [eax+174]
 00044E23    test        edx,edx
>00044E25    jl          00044E36
 00044E27    cmp         edx,dword ptr [ebp-8]
>00044E2A    jge         00044E36
 00044E2C    mov         ecx,eax
 00044E2E    mov         eax,dword ptr [ebp-0C]
 00044E31    call        TList.Put
 00044E36    inc         esi
 00044E37    dec         ebx
>00044E38    jne         00044E0D
 00044E3A    mov         ebx,dword ptr [ebp-8]
 00044E3D    dec         ebx
 00044E3E    test        ebx,ebx
>00044E40    jl          00044E5E
 00044E42    inc         ebx
 00044E43    xor         esi,esi
 00044E45    mov         edx,esi
 00044E47    mov         eax,dword ptr [ebp-0C]
 00044E4A    call        TList.Get
 00044E4F    test        eax,eax
>00044E51    je          00044E5A
 00044E53    mov         edx,esi
 00044E55    call        TWinControl.UpdateTabOrder
 00044E5A    inc         esi
 00044E5B    dec         ebx
>00044E5C    jne         00044E45
 00044E5E    xor         eax,eax
 00044E60    pop         edx
 00044E61    pop         ecx
 00044E62    pop         ecx
 00044E63    mov         dword ptr fs:[eax],edx
 00044E66    push        44E7B
 00044E6B    mov         eax,dword ptr [ebp-0C]
 00044E6E    call        TObject.Free
 00044E73    ret
>00044E74    jmp         @HandleFinally
>00044E79    jmp         00044E6B
 00044E7B    pop         esi
 00044E7C    pop         ebx
 00044E7D    mov         esp,ebp
 00044E7F    pop         ebp
 00044E80    ret
*}
end;

//00044E84
procedure TWinControl.ReadState(Reader:TReader);
begin
{*
 00044E84    push        ebp
 00044E85    mov         ebp,esp
 00044E87    push        ecx
 00044E88    push        ebx
 00044E89    mov         ebx,edx
 00044E8B    mov         dword ptr [ebp-4],eax
 00044E8E    mov         eax,dword ptr [ebp-4]
 00044E91    call        TWinControl.DisableAlign
 00044E96    xor         eax,eax
 00044E98    push        ebp
 00044E99    push        44EC4
 00044E9E    push        dword ptr fs:[eax]
 00044EA1    mov         dword ptr fs:[eax],esp
 00044EA4    mov         edx,ebx
 00044EA6    mov         eax,dword ptr [ebp-4]
 00044EA9    call        TControl.ReadState
 00044EAE    xor         eax,eax
 00044EB0    pop         edx
 00044EB1    pop         ecx
 00044EB2    pop         ecx
 00044EB3    mov         dword ptr fs:[eax],edx
 00044EB6    push        44ECB
 00044EBB    mov         eax,dword ptr [ebp-4]
 00044EBE    call        TWinControl.EnableAlign
 00044EC3    ret
>00044EC4    jmp         @HandleFinally
>00044EC9    jmp         00044EBB
 00044ECB    mov         eax,dword ptr [ebp-4]
 00044ECE    call        TWinControl.FixupTabList
 00044ED3    mov         eax,dword ptr [ebp-4]
 00044ED6    cmp         dword ptr [eax+24],0
>00044EDA    je          00044EED
 00044EDC    push        0
 00044EDE    xor         ecx,ecx
 00044EE0    mov         edx,0B011
 00044EE5    mov         eax,dword ptr [ebp-4]
 00044EE8    call        TControl.Perform
 00044EED    mov         eax,dword ptr [ebp-4]
 00044EF0    call        TWinControl.UpdateControlState
 00044EF5    pop         ebx
 00044EF6    pop         ecx
 00044EF7    pop         ebp
 00044EF8    ret
*}
end;

//00044EFC
procedure TWinControl.AdjustClientRect(var Rect:TRect);
begin
{*
 00044EFC    ret
*}
end;

//00044F00
{*function sub_00044F00(?:TControl; ?:Pointer; ?:?):?;
begin
 00044F00    push        ebp
 00044F01    mov         ebp,esp
 00044F03    push        ecx
 00044F04    push        ebx
 00044F05    mov         byte ptr [ebp-1],cl
 00044F08    xor         ecx,ecx
 00044F0A    mov         bl,byte ptr [ebp-1]
 00044F0D    dec         bl
>00044F0F    je          00044F1F
 00044F11    dec         bl
>00044F13    je          00044F2A
 00044F15    dec         bl
>00044F17    je          00044F3D
 00044F19    dec         bl
>00044F1B    je          00044F48
>00044F1D    jmp         00044F59
 00044F1F    mov         edx,dword ptr [edx+34]
 00044F22    cmp         edx,dword ptr [eax+34]
 00044F25    setg        cl
>00044F28    jmp         00044F59
 00044F2A    mov         ecx,dword ptr [edx+34]
 00044F2D    add         ecx,dword ptr [edx+3C]
 00044F30    mov         edx,dword ptr [eax+34]
 00044F33    add         edx,dword ptr [eax+3C]
 00044F36    cmp         ecx,edx
 00044F38    setle       cl
>00044F3B    jmp         00044F59
 00044F3D    mov         edx,dword ptr [edx+30]
 00044F40    cmp         edx,dword ptr [eax+30]
 00044F43    setg        cl
>00044F46    jmp         00044F59
 00044F48    mov         ecx,dword ptr [edx+30]
 00044F4B    add         ecx,dword ptr [edx+38]
 00044F4E    mov         edx,dword ptr [eax+30]
 00044F51    add         edx,dword ptr [eax+38]
 00044F54    cmp         ecx,edx
 00044F56    setle       cl
 00044F59    mov         eax,ecx
 00044F5B    pop         ebx
 00044F5C    pop         ecx
 00044F5D    pop         ebp
 00044F5E    ret
end;*}

//00044F60
{*procedure sub_00044F60(?:Pointer; ?:?; ?:?);
begin
 00044F60    push        ebp
 00044F61    mov         ebp,esp
 00044F63    add         esp,0FFFFFFE4
 00044F66    push        ebx
 00044F67    push        esi
 00044F68    push        edi
 00044F69    mov         byte ptr [ebp-1],dl
 00044F6C    mov         ebx,eax
 00044F6E    cmp         byte ptr [ebp-1],0
>00044F72    je          00044F88
 00044F74    xor         eax,eax
 00044F76    mov         al,byte ptr [ebp-1]
 00044F79    mov         al,byte ptr [eax+0B4780]
 00044F7F    cmp         al,byte ptr [ebx+60]
>00044F82    je          0004506C
 00044F88    mov         eax,dword ptr [ebx+24]
 00044F8B    mov         esi,dword ptr [eax+158]
 00044F91    add         esi,dword ptr [ebx+80]
 00044F97    mov         eax,dword ptr [eax+15C]
 00044F9D    add         eax,dword ptr [ebx+7C]
 00044FA0    mov         dword ptr [ebp-0C],eax
 00044FA3    lea         edx,[ebp-1C]
 00044FA6    mov         eax,ebx
 00044FA8    call        TControl.GetBoundsRect
 00044FAD    test        byte ptr [ebx+60],1
>00044FB1    jne         00044FEE
 00044FB3    test        byte ptr [ebx+60],4
>00044FB7    jne         00044FD7
 00044FB9    push        0
 00044FBB    mov         eax,dword ptr [ebx+24]
 00044FBE    mov         eax,dword ptr [eax+158]
 00044FC4    sar         eax,1
>00044FC6    jns         00044FCB
 00044FC8    adc         eax,0
 00044FCB    push        eax
 00044FCC    lea         eax,[ebp-1C]
 00044FCF    push        eax
 00044FD0    call        user32.OffsetRect
>00044FD5    jmp         00044FFC
 00044FD7    push        0
 00044FD9    mov         eax,dword ptr [ebx+24]
 00044FDC    mov         eax,dword ptr [eax+158]
 00044FE2    push        eax
 00044FE3    lea         eax,[ebp-1C]
 00044FE6    push        eax
 00044FE7    call        user32.OffsetRect
>00044FEC    jmp         00044FFC
 00044FEE    test        byte ptr [ebx+60],4
>00044FF2    je          00044FFC
 00044FF4    mov         eax,dword ptr [ebp-1C]
 00044FF7    add         eax,esi
 00044FF9    mov         dword ptr [ebp-14],eax
 00044FFC    test        byte ptr [ebx+60],2
>00045000    jne         0004503D
 00045002    test        byte ptr [ebx+60],8
>00045006    jne         00045026
 00045008    mov         eax,dword ptr [ebx+24]
 0004500B    mov         eax,dword ptr [eax+15C]
 00045011    sar         eax,1
>00045013    jns         00045018
 00045015    adc         eax,0
 00045018    push        eax
 00045019    push        0
 0004501B    lea         eax,[ebp-1C]
 0004501E    push        eax
 0004501F    call        user32.OffsetRect
>00045024    jmp         0004504C
 00045026    mov         eax,dword ptr [ebx+24]
 00045029    mov         eax,dword ptr [eax+15C]
 0004502F    push        eax
 00045030    push        0
 00045032    lea         eax,[ebp-1C]
 00045035    push        eax
 00045036    call        user32.OffsetRect
>0004503B    jmp         0004504C
 0004503D    test        byte ptr [ebx+60],8
>00045041    je          0004504C
 00045043    mov         eax,dword ptr [ebp-18]
 00045046    add         eax,dword ptr [ebp-0C]
 00045049    mov         dword ptr [ebp-10],eax
 0004504C    lea         edx,[ebp-1C]
 0004504F    mov         eax,ebx
 00045051    call        TControl.SetBoundsRect
 00045056    mov         dword ptr [ebx+80],esi
 0004505C    mov         eax,dword ptr [ebp-0C]
 0004505F    mov         dword ptr [ebx+7C],eax
 00045062    cmp         byte ptr [ebp-1],0
>00045066    je          000451C4
 0004506C    mov         eax,dword ptr [ebp+8]
 0004506F    mov         esi,dword ptr [eax-4]
 00045072    mov         esi,dword ptr [esi+8]
 00045075    mov         eax,dword ptr [ebp+8]
 00045078    mov         eax,dword ptr [eax-4]
 0004507B    sub         esi,dword ptr [eax]
 0004507D    test        esi,esi
>0004507F    jl          0004508A
 00045081    mov         al,byte ptr [ebp-1]
 00045084    add         al,0FD
 00045086    sub         al,2
>00045088    jae         0004508D
 0004508A    mov         esi,dword ptr [ebx+38]
 0004508D    mov         eax,dword ptr [ebp+8]
 00045090    mov         eax,dword ptr [eax-4]
 00045093    mov         eax,dword ptr [eax+0C]
 00045096    mov         edx,dword ptr [ebp+8]
 00045099    mov         edx,dword ptr [edx-4]
 0004509C    sub         eax,dword ptr [edx+4]
 0004509F    mov         dword ptr [ebp-0C],eax
 000450A2    cmp         dword ptr [ebp-0C],0
>000450A6    jl          000450B0
 000450A8    mov         al,byte ptr [ebp-1]
 000450AB    dec         eax
 000450AC    sub         al,2
>000450AE    jae         000450B6
 000450B0    mov         eax,dword ptr [ebx+3C]
 000450B3    mov         dword ptr [ebp-0C],eax
 000450B6    mov         eax,dword ptr [ebp+8]
 000450B9    mov         eax,dword ptr [eax-4]
 000450BC    mov         eax,dword ptr [eax]
 000450BE    mov         edx,dword ptr [ebp+8]
 000450C1    mov         edx,dword ptr [edx-4]
 000450C4    mov         edx,dword ptr [edx+4]
 000450C7    mov         dword ptr [ebp-8],edx
 000450CA    mov         dl,byte ptr [ebp-1]
 000450CD    dec         dl
>000450CF    je          000450DF
 000450D1    dec         dl
>000450D3    je          000450ED
 000450D5    dec         dl
>000450D7    je          00045107
 000450D9    dec         dl
>000450DB    je          00045111
>000450DD    jmp         00045123
 000450DF    mov         edx,dword ptr [ebp+8]
 000450E2    mov         edx,dword ptr [edx-4]
 000450E5    mov         ecx,dword ptr [ebp-0C]
 000450E8    add         dword ptr [edx+4],ecx
>000450EB    jmp         00045123
 000450ED    mov         edx,dword ptr [ebp+8]
 000450F0    mov         edx,dword ptr [edx-4]
 000450F3    mov         ecx,dword ptr [ebp-0C]
 000450F6    sub         dword ptr [edx+0C],ecx
 000450F9    mov         edx,dword ptr [ebp+8]
 000450FC    mov         edx,dword ptr [edx-4]
 000450FF    mov         edx,dword ptr [edx+0C]
 00045102    mov         dword ptr [ebp-8],edx
>00045105    jmp         00045123
 00045107    mov         edx,dword ptr [ebp+8]
 0004510A    mov         edx,dword ptr [edx-4]
 0004510D    add         dword ptr [edx],esi
>0004510F    jmp         00045123
 00045111    mov         eax,dword ptr [ebp+8]
 00045114    mov         eax,dword ptr [eax-4]
 00045117    sub         dword ptr [eax+8],esi
 0004511A    mov         eax,dword ptr [ebp+8]
 0004511D    mov         eax,dword ptr [eax-4]
 00045120    mov         eax,dword ptr [eax+8]
 00045123    push        esi
 00045124    mov         edx,dword ptr [ebp-0C]
 00045127    push        edx
 00045128    mov         ecx,dword ptr [ebp-8]
 0004512B    mov         edx,eax
 0004512D    mov         eax,ebx
 0004512F    mov         edi,dword ptr [eax]
 00045131    call        dword ptr [edi+80]
 00045137    mov         eax,dword ptr [ebx+38]
 0004513A    cmp         esi,eax
>0004513C    jne         00045146
 0004513E    mov         edx,dword ptr [ebx+3C]
 00045141    cmp         edx,dword ptr [ebp-0C]
>00045144    je          000451C4
 00045146    xor         edx,edx
 00045148    mov         dl,byte ptr [ebp-1]
 0004514B    cmp         edx,5
>0004514E    ja          000451C4
 00045150    jmp         dword ptr [edx*4+45157]
 00045150    dd          000451C4
 00045150    dd          0004516F
 00045150    dd          00045180
 00045150    dd          00045191
 00045150    dd          0004519D
 00045150    dd          000451AA
 0004516F    mov         eax,dword ptr [ebp-0C]
 00045172    sub         eax,dword ptr [ebx+3C]
 00045175    mov         edx,dword ptr [ebp+8]
 00045178    mov         edx,dword ptr [edx-4]
 0004517B    sub         dword ptr [edx+4],eax
>0004517E    jmp         000451C4
 00045180    mov         eax,dword ptr [ebp-0C]
 00045183    sub         eax,dword ptr [ebx+3C]
 00045186    mov         edx,dword ptr [ebp+8]
 00045189    mov         edx,dword ptr [edx-4]
 0004518C    add         dword ptr [edx+0C],eax
>0004518F    jmp         000451C4
 00045191    sub         esi,eax
 00045193    mov         eax,dword ptr [ebp+8]
 00045196    mov         eax,dword ptr [eax-4]
 00045199    sub         dword ptr [eax],esi
>0004519B    jmp         000451C4
 0004519D    sub         esi,eax
 0004519F    mov         eax,dword ptr [ebp+8]
 000451A2    mov         eax,dword ptr [eax-4]
 000451A5    add         dword ptr [eax+8],esi
>000451A8    jmp         000451C4
 000451AA    sub         esi,eax
 000451AC    mov         eax,dword ptr [ebp+8]
 000451AF    mov         eax,dword ptr [eax-4]
 000451B2    add         dword ptr [eax+8],esi
 000451B5    mov         eax,dword ptr [ebp-0C]
 000451B8    sub         eax,dword ptr [ebx+3C]
 000451BB    mov         edx,dword ptr [ebp+8]
 000451BE    mov         edx,dword ptr [edx-4]
 000451C1    add         dword ptr [edx+0C],eax
 000451C4    pop         edi
 000451C5    pop         esi
 000451C6    pop         ebx
 000451C7    mov         esp,ebp
 000451C9    pop         ebp
 000451CA    ret
end;*}

//000451CC
{*procedure sub_000451CC(?:?; ?:?);
begin
 000451CC    push        ebp
 000451CD    mov         ebp,esp
 000451CF    add         esp,0FFFFFFF8
 000451D2    push        ebx
 000451D3    push        esi
 000451D4    push        edi
 000451D5    mov         byte ptr [ebp-1],al
 000451D8    mov         eax,dword ptr [ebp+8]
 000451DB    mov         eax,dword ptr [eax-8]
 000451DE    mov         bx,0FFFF
 000451E2    call        @CallDynaInst
 000451E7    mov         eax,dword ptr [ebp+8]
 000451EA    cmp         dword ptr [eax-0C],0
>000451EE    je          00045239
 000451F0    cmp         byte ptr [ebp-1],0
>000451F4    je          0004521A
 000451F6    mov         eax,dword ptr [ebp+8]
 000451F9    mov         eax,dword ptr [eax-0C]
 000451FC    cmp         byte ptr [eax+47],0
>00045200    jne         0004521A
 00045202    mov         eax,dword ptr [ebp+8]
 00045205    mov         eax,dword ptr [eax-0C]
 00045208    test        byte ptr [eax+20],10
>0004520C    je          00045239
 0004520E    mov         eax,dword ptr [ebp+8]
 00045211    mov         eax,dword ptr [eax-0C]
 00045214    test        byte ptr [eax+41],4
>00045218    jne         00045239
 0004521A    mov         eax,dword ptr [ebp+8]
 0004521D    mov         eax,dword ptr [eax-0C]
 00045220    mov         al,byte ptr [eax+4B]
 00045223    cmp         al,byte ptr [ebp-1]
>00045226    jne         00045239
 00045228    mov         eax,dword ptr [ebp+8]
 0004522B    mov         edx,dword ptr [eax-0C]
 0004522E    mov         eax,dword ptr [ebp+8]
 00045231    mov         eax,dword ptr [eax-8]
 00045234    call        TList.Add
 00045239    mov         eax,dword ptr [ebp+8]
 0004523C    mov         eax,dword ptr [eax-10]
 0004523F    call        TWinControl.GetControlCount
 00045244    mov         edi,eax
 00045246    dec         edi
 00045247    test        edi,edi
>00045249    jl          000452E7
 0004524F    inc         edi
 00045250    mov         dword ptr [ebp-8],0
 00045257    mov         eax,dword ptr [ebp+8]
 0004525A    mov         eax,dword ptr [eax-10]
 0004525D    mov         edx,dword ptr [ebp-8]
 00045260    call        TWinControl.GetControl
 00045265    mov         ebx,eax
 00045267    mov         al,byte ptr [ebx+4B];TControl.FAlign:TAlign
 0004526A    cmp         al,byte ptr [ebp-1]
>0004526D    jne         000452DD
 0004526F    cmp         byte ptr [ebp-1],0
>00045273    je          00045299
 00045275    cmp         byte ptr [ebx+47],0;TControl.FVisible:Boolean
>00045279    jne         00045299
 0004527B    mov         eax,[00045328];0x401 gvar_00045328
 00045280    and         eax,dword ptr [ebx+40];TControl.FControlStyle:TControlStyle
 00045283    mov         edx,dword ptr ds:[45328];0x401 gvar_00045328
 00045289    cmp         edx,eax
>0004528B    je          00045299
 0004528D    test        byte ptr [ebx+20],10;TControl.FComponentState:TComponentState
>00045291    je          000452DD
 00045293    test        byte ptr [ebx+41],4;TControl.?f41:byte
>00045297    jne         000452DD
 00045299    mov         eax,dword ptr [ebp+8]
 0004529C    cmp         ebx,dword ptr [eax-0C]
>0004529F    je          000452DD
 000452A1    xor         esi,esi
>000452A3    jmp         000452A6
 000452A5    inc         esi
 000452A6    mov         eax,dword ptr [ebp+8]
 000452A9    mov         eax,dword ptr [eax-8]
 000452AC    cmp         esi,dword ptr [eax+8]
>000452AF    jge         000452CE
 000452B1    mov         eax,dword ptr [ebp+8]
 000452B4    mov         eax,dword ptr [eax-8]
 000452B7    mov         edx,esi
 000452B9    call        TList.Get
 000452BE    mov         edx,eax
 000452C0    mov         cl,byte ptr [ebp-1]
 000452C3    mov         eax,ebx
 000452C5    call        00044F00
 000452CA    test        al,al
>000452CC    je          000452A5
 000452CE    mov         eax,dword ptr [ebp+8]
 000452D1    mov         eax,dword ptr [eax-8]
 000452D4    mov         ecx,ebx
 000452D6    mov         edx,esi
 000452D8    call        TList.Insert
 000452DD    inc         dword ptr [ebp-8]
 000452E0    dec         edi
>000452E1    jne         00045257
 000452E7    mov         eax,dword ptr [ebp+8]
 000452EA    mov         eax,dword ptr [eax-8]
 000452ED    mov         edi,dword ptr [eax+8]
 000452F0    dec         edi
 000452F1    test        edi,edi
>000452F3    jl          0004531E
 000452F5    inc         edi
 000452F6    mov         dword ptr [ebp-8],0
 000452FD    mov         eax,dword ptr [ebp+8]
 00045300    push        eax
 00045301    mov         eax,dword ptr [ebp+8]
 00045304    mov         eax,dword ptr [eax-8]
 00045307    mov         edx,dword ptr [ebp-8]
 0004530A    call        TList.Get
 0004530F    mov         dl,byte ptr [ebp-1]
 00045312    call        00044F60
 00045317    pop         ecx
 00045318    inc         dword ptr [ebp-8]
 0004531B    dec         edi
>0004531C    jne         000452FD
 0004531E    pop         edi
 0004531F    pop         esi
 00045320    pop         ebx
 00045321    pop         ecx
 00045322    pop         ecx
 00045323    pop         ebp
 00045324    ret
end;*}

//0004532C
{*function sub_0004532C(?:?):?;
begin
 0004532C    push        ebp
 0004532D    mov         ebp,esp
 0004532F    push        ebx
 00045330    push        esi
 00045331    push        edi
 00045332    mov         edi,dword ptr [ebp+8]
 00045335    add         edi,0FFFFFFF0
 00045338    mov         bl,1
 0004533A    mov         eax,dword ptr [edi]
 0004533C    call        TWinControl.GetControlCount
 00045341    mov         esi,eax
 00045343    dec         esi
 00045344    cmp         esi,0
>00045347    jl          00045372
 00045349    mov         eax,dword ptr [edi]
 0004534B    mov         edx,esi
 0004534D    call        TWinControl.GetControl
 00045352    cmp         byte ptr [eax+4B],0;TControl.FAlign:TAlign
>00045356    jne         00045374
 00045358    mov         eax,dword ptr [edi]
 0004535A    mov         edx,esi
 0004535C    call        TWinControl.GetControl
 00045361    mov         dl,byte ptr ds:[4537C];0x3 gvar_0004537C
 00045367    cmp         dl,byte ptr [eax+60];TControl.FAnchors:TAnchors
>0004536A    jne         00045374
 0004536C    dec         esi
 0004536D    cmp         esi,0FFFFFFFF
>00045370    jne         00045349
 00045372    xor         ebx,ebx
 00045374    mov         eax,ebx
 00045376    pop         edi
 00045377    pop         esi
 00045378    pop         ebx
 00045379    pop         ebp
 0004537A    ret
end;*}

//00045380
procedure TWinControl.AlignControls(AControl:TControl; var Rect:TRect);
begin
{*
 00045380    push        ebp
 00045381    mov         ebp,esp
 00045383    add         esp,0FFFFFFF0
 00045386    push        ebx
 00045387    mov         dword ptr [ebp-4],ecx
 0004538A    mov         dword ptr [ebp-0C],edx
 0004538D    mov         dword ptr [ebp-10],eax
 00045390    mov         eax,dword ptr [ebp-10]
 00045393    cmp         byte ptr [eax+138],0
>0004539A    je          000453C9
 0004539C    mov         eax,dword ptr [ebp-10]
 0004539F    cmp         byte ptr [eax+180],0
>000453A6    je          000453C9
 000453A8    mov         eax,dword ptr [ebp-10]
 000453AB    cmp         dword ptr [eax+13C],0
>000453B2    je          000453C9
 000453B4    mov         eax,dword ptr [ebp-10]
 000453B7    mov         eax,dword ptr [eax+13C]
 000453BD    xor         edx,edx
 000453BF    mov         ecx,dword ptr [eax]
 000453C1    call        dword ptr [ecx+2C]
>000453C4    jmp         00045452
 000453C9    push        ebp
 000453CA    call        0004532C
 000453CF    pop         ecx
 000453D0    test        al,al
>000453D2    je          00045452
 000453D4    mov         edx,dword ptr [ebp-4]
 000453D7    mov         eax,dword ptr [ebp-10]
 000453DA    mov         ecx,dword ptr [eax]
 000453DC    call        dword ptr [ecx+88]
 000453E2    mov         dl,1
 000453E4    mov         eax,[0001EEC4];TList
 000453E9    call        TObject.Create
 000453EE    mov         dword ptr [ebp-8],eax
 000453F1    xor         eax,eax
 000453F3    push        ebp
 000453F4    push        4544B
 000453F9    push        dword ptr fs:[eax]
 000453FC    mov         dword ptr fs:[eax],esp
 000453FF    push        ebp
 00045400    mov         al,1
 00045402    call        000451CC
 00045407    pop         ecx
 00045408    push        ebp
 00045409    mov         al,2
 0004540B    call        000451CC
 00045410    pop         ecx
 00045411    push        ebp
 00045412    mov         al,3
 00045414    call        000451CC
 00045419    pop         ecx
 0004541A    push        ebp
 0004541B    mov         al,4
 0004541D    call        000451CC
 00045422    pop         ecx
 00045423    push        ebp
 00045424    mov         al,5
 00045426    call        000451CC
 0004542B    pop         ecx
 0004542C    push        ebp
 0004542D    xor         eax,eax
 0004542F    call        000451CC
 00045434    pop         ecx
 00045435    xor         eax,eax
 00045437    pop         edx
 00045438    pop         ecx
 00045439    pop         ecx
 0004543A    mov         dword ptr fs:[eax],edx
 0004543D    push        45452
 00045442    mov         eax,dword ptr [ebp-8]
 00045445    call        TObject.Free
 0004544A    ret
>0004544B    jmp         @HandleFinally
>00045450    jmp         00045442
 00045452    mov         eax,dword ptr [ebp-10]
 00045455    xor         edx,edx
 00045457    mov         dword ptr [eax+158],edx
 0004545D    mov         eax,dword ptr [ebp-10]
 00045460    xor         edx,edx
 00045462    mov         dword ptr [eax+15C],edx
 00045468    mov         eax,dword ptr [ebp-10]
 0004546B    cmp         byte ptr [eax+16C],0
>00045472    je          00045480
 00045474    mov         eax,dword ptr [ebp-10]
 00045477    mov         bx,0FFEF
 0004547B    call        @CallDynaInst
 00045480    pop         ebx
 00045481    mov         esp,ebp
 00045483    pop         ebp
 00045484    ret
*}
end;

//00045488
procedure TWinControl.AlignControl(AControl:TControl);
begin
{*
 00045488    push        ebp
 00045489    mov         ebp,esp
 0004548B    add         esp,0FFFFFFEC
 0004548E    push        ebx
 0004548F    mov         ebx,edx
 00045491    mov         dword ptr [ebp-4],eax
 00045494    mov         eax,dword ptr [ebp-4]
 00045497    call        TWinControl.HandleAllocated
 0004549C    test        al,al
>0004549E    je          00045516
 000454A0    mov         eax,dword ptr [ebp-4]
 000454A3    test        byte ptr [eax+20],8
>000454A7    jne         00045516
 000454A9    mov         eax,dword ptr [ebp-4]
 000454AC    cmp         word ptr [eax+114],0
>000454B4    je          000454C0
 000454B6    mov         eax,dword ptr [ebp-4]
 000454B9    or          word ptr [eax+44],10
>000454BE    jmp         00045516
 000454C0    mov         eax,dword ptr [ebp-4]
 000454C3    call        TWinControl.DisableAlign
 000454C8    xor         eax,eax
 000454CA    push        ebp
 000454CB    push        4550F
 000454D0    push        dword ptr fs:[eax]
 000454D3    mov         dword ptr fs:[eax],esp
 000454D6    lea         edx,[ebp-14]
 000454D9    mov         eax,dword ptr [ebp-4]
 000454DC    mov         ecx,dword ptr [eax]
 000454DE    call        dword ptr [ecx+44]
 000454E1    lea         ecx,[ebp-14]
 000454E4    mov         edx,ebx
 000454E6    mov         eax,dword ptr [ebp-4]
 000454E9    mov         ebx,dword ptr [eax]
 000454EB    call        dword ptr [ebx+8C]
 000454F1    xor         eax,eax
 000454F3    pop         edx
 000454F4    pop         ecx
 000454F5    pop         ecx
 000454F6    mov         dword ptr fs:[eax],edx
 000454F9    push        45516
 000454FE    mov         eax,dword ptr [ebp-4]
 00045501    and         word ptr [eax+44],0FFFFFFEF
 00045506    mov         eax,dword ptr [ebp-4]
 00045509    call        TWinControl.EnableAlign
 0004550E    ret
>0004550F    jmp         @HandleFinally
>00045514    jmp         000454FE
 00045516    pop         ebx
 00045517    mov         esp,ebp
 00045519    pop         ebp
 0004551A    ret
*}
end;

//0004551C
procedure TWinControl.DisableAlign;
begin
{*
 0004551C    inc         word ptr [eax+114]
 00045523    ret
*}
end;

//00045524
procedure TWinControl.EnableAlign;
begin
{*
 00045524    push        ebx
 00045525    mov         ebx,eax
 00045527    dec         word ptr [ebx+114]
 0004552E    cmp         word ptr [ebx+114],0
>00045536    jne         00045555
 00045538    test        byte ptr [ebx+44],10
>0004553C    je          00045545
 0004553E    mov         eax,ebx
 00045540    call        TWinControl.Realign
 00045545    xor         eax,eax
 00045547    mov         dword ptr [ebx+158],eax
 0004554D    xor         eax,eax
 0004554F    mov         dword ptr [ebx+15C],eax
 00045555    pop         ebx
 00045556    ret
*}
end;

//00045558
procedure TWinControl.Realign;
begin
{*
 00045558    xor         edx,edx
 0004555A    call        TWinControl.AlignControl
 0004555F    ret
*}
end;

//00045560
procedure TWinControl.DoFlipChildren;
begin
{*
 00045560    push        ebp
 00045561    mov         ebp,esp
 00045563    add         esp,0FFFFFFF4
 00045566    push        ebx
 00045567    push        esi
 00045568    push        edi
 00045569    mov         dword ptr [ebp-4],eax
 0004556C    mov         dl,1
 0004556E    mov         eax,[0001EEC4];TList
 00045573    call        TObject.Create
 00045578    mov         dword ptr [ebp-0C],eax
 0004557B    xor         eax,eax
 0004557D    push        ebp
 0004557E    push        45625
 00045583    push        dword ptr fs:[eax]
 00045586    mov         dword ptr fs:[eax],esp
 00045589    mov         eax,dword ptr [ebp-4]
 0004558C    call        TControl.GetClientWidth
 00045591    mov         dword ptr [ebp-8],eax
 00045594    mov         eax,dword ptr [ebp-4]
 00045597    call        TWinControl.GetControlCount
 0004559C    mov         ebx,eax
 0004559E    dec         ebx
 0004559F    test        ebx,ebx
>000455A1    jl          000455E5
 000455A3    inc         ebx
 000455A4    xor         esi,esi
 000455A6    mov         edx,esi
 000455A8    mov         eax,dword ptr [ebp-4]
 000455AB    call        TWinControl.GetControl
 000455B0    mov         edi,eax
 000455B2    mov         eax,dword ptr [edi+4]
 000455B5    mov         edx,dword ptr [ebp-4]
 000455B8    cmp         eax,dword ptr [edx+4]
>000455BB    jne         000455E1
 000455BD    mov         edx,esi
 000455BF    mov         eax,dword ptr [ebp-4]
 000455C2    call        TWinControl.GetControl
 000455C7    mov         edx,eax
 000455C9    mov         eax,dword ptr [ebp-0C]
 000455CC    call        TList.Add
 000455D1    mov         edx,dword ptr [ebp-8]
 000455D4    sub         edx,dword ptr [edi+38]
 000455D7    sub         edx,dword ptr [edi+30]
 000455DA    mov         eax,edi
 000455DC    call        TControl.SetLeft
 000455E1    inc         esi
 000455E2    dec         ebx
>000455E3    jne         000455A6
 000455E5    mov         eax,dword ptr [ebp-0C]
 000455E8    mov         ebx,dword ptr [eax+8]
 000455EB    dec         ebx
 000455EC    test        ebx,ebx
>000455EE    jl          0004560F
 000455F0    inc         ebx
 000455F1    xor         esi,esi
 000455F3    push        0
 000455F5    mov         edx,esi
 000455F7    mov         eax,dword ptr [ebp-0C]
 000455FA    call        TList.Get
 000455FF    xor         ecx,ecx
 00045601    mov         edx,0B03E
 00045606    call        TControl.Perform
 0004560B    inc         esi
 0004560C    dec         ebx
>0004560D    jne         000455F3
 0004560F    xor         eax,eax
 00045611    pop         edx
 00045612    pop         ecx
 00045613    pop         ecx
 00045614    mov         dword ptr fs:[eax],edx
 00045617    push        4562C
 0004561C    mov         eax,dword ptr [ebp-0C]
 0004561F    call        TObject.Free
 00045624    ret
>00045625    jmp         @HandleFinally
>0004562A    jmp         0004561C
 0004562C    pop         edi
 0004562D    pop         esi
 0004562E    pop         ebx
 0004562F    mov         esp,ebp
 00045631    pop         ebp
 00045632    ret
*}
end;

//00045634
procedure TWinControl.FlipChildren(AllLevels:Boolean);
begin
{*
 00045634    push        ebp
 00045635    mov         ebp,esp
 00045637    add         esp,0FFFFFFF4
 0004563A    push        ebx
 0004563B    push        esi
 0004563C    push        edi
 0004563D    mov         byte ptr [ebp-5],dl
 00045640    mov         dword ptr [ebp-4],eax
 00045643    mov         eax,dword ptr [ebp-4]
 00045646    call        TWinControl.GetControlCount
 0004564B    test        eax,eax
>0004564D    je          0004576C
 00045653    mov         dl,1
 00045655    mov         eax,[0001EEC4];TList
 0004565A    call        TObject.Create
 0004565F    mov         dword ptr [ebp-0C],eax
 00045662    mov         eax,dword ptr [ebp-4]
 00045665    call        TWinControl.DisableAlign
 0004566A    xor         edx,edx
 0004566C    push        ebp
 0004566D    push        4571B
 00045672    push        dword ptr fs:[edx]
 00045675    mov         dword ptr fs:[edx],esp
 00045678    mov         eax,dword ptr [ebp-4]
 0004567B    call        TWinControl.GetControlCount
 00045680    mov         edi,eax
 00045682    dec         edi
 00045683    test        edi,edi
>00045685    jl          000456B5
 00045687    inc         edi
 00045688    xor         esi,esi
 0004568A    mov         edx,esi
 0004568C    mov         eax,dword ptr [ebp-4]
 0004568F    call        TWinControl.GetControl
 00045694    mov         al,byte ptr [eax+4B]
 00045697    add         al,0FD
 00045699    sub         al,2
>0004569B    jae         000456B1
 0004569D    mov         edx,esi
 0004569F    mov         eax,dword ptr [ebp-4]
 000456A2    call        TWinControl.GetControl
 000456A7    mov         edx,eax
 000456A9    mov         eax,dword ptr [ebp-0C]
 000456AC    call        TList.Add
 000456B1    inc         esi
 000456B2    dec         edi
>000456B3    jne         0004568A
 000456B5    mov         eax,dword ptr [ebp-4]
 000456B8    mov         bx,0FFC8
 000456BC    call        @CallDynaInst
 000456C1    xor         eax,eax
 000456C3    pop         edx
 000456C4    pop         ecx
 000456C5    pop         ecx
 000456C6    mov         dword ptr fs:[eax],edx
 000456C9    push        45722
>000456CE    jmp         00045700
 000456D0    mov         edx,ebx
 000456D2    dec         edx
 000456D3    mov         eax,dword ptr [ebp-0C]
 000456D6    call        TList.Get
 000456DB    cmp         byte ptr [eax+4B],3
>000456DF    jne         000456EA
 000456E1    mov         dl,4
 000456E3    call        TControl.SetAlign
>000456E8    jmp         000456F1
 000456EA    mov         dl,3
 000456EC    call        TControl.SetAlign
 000456F1    mov         eax,dword ptr [ebp-0C]
 000456F4    mov         edx,dword ptr [eax+8]
 000456F7    dec         edx
 000456F8    mov         eax,dword ptr [ebp-0C]
 000456FB    call        TList.Delete
 00045700    mov         eax,dword ptr [ebp-0C]
 00045703    mov         ebx,dword ptr [eax+8]
 00045706    test        ebx,ebx
>00045708    jg          000456D0
 0004570A    mov         eax,dword ptr [ebp-0C]
 0004570D    call        TObject.Free
 00045712    mov         eax,dword ptr [ebp-4]
 00045715    call        TWinControl.EnableAlign
 0004571A    ret
>0004571B    jmp         @HandleFinally
>00045720    jmp         00045700
 00045722    cmp         byte ptr [ebp-5],0
>00045726    je          0004576C
 00045728    mov         eax,dword ptr [ebp-4]
 0004572B    call        TWinControl.GetControlCount
 00045730    mov         edi,eax
 00045732    dec         edi
 00045733    test        edi,edi
>00045735    jl          0004576C
 00045737    inc         edi
 00045738    xor         esi,esi
 0004573A    mov         edx,esi
 0004573C    mov         eax,dword ptr [ebp-4]
 0004573F    call        TWinControl.GetControl
 00045744    mov         edx,dword ptr ds:[3F0BC];TWinControl
 0004574A    call        @IsClass
 0004574F    test        al,al
>00045751    je          00045768
 00045753    mov         edx,esi
 00045755    mov         eax,dword ptr [ebp-4]
 00045758    call        TWinControl.GetControl
 0004575D    mov         dl,1
 0004575F    mov         bx,0FFBC
 00045763    call        @CallDynaInst
 00045768    inc         esi
 00045769    dec         edi
>0004576A    jne         0004573A
 0004576C    pop         edi
 0004576D    pop         esi
 0004576E    pop         ebx
 0004576F    mov         esp,ebp
 00045771    pop         ebp
 00045772    ret
*}
end;

//00045774
function TWinControl.ContainsControl(Control:TControl):Boolean;
begin
{*
>00045774    jmp         00045779
 00045776    mov         edx,dword ptr [edx+24]
 00045779    test        edx,edx
>0004577B    je          00045781
 0004577D    cmp         eax,edx
>0004577F    jne         00045776
 00045781    test        edx,edx
 00045783    setne       al
 00045786    ret
*}
end;

//00045788
procedure TWinControl.RemoveFocus(Removing:Boolean);
begin
{*
 00045788    push        ebx
 00045789    push        esi
 0004578A    mov         ebx,edx
 0004578C    mov         esi,eax
 0004578E    mov         eax,esi
 00045790    call        GetParentForm
 00045795    test        eax,eax
>00045797    je          000457A2
 00045799    mov         ecx,ebx
 0004579B    mov         edx,esi
 0004579D    call        TCustomForm.DefocusControl
 000457A2    pop         esi
 000457A3    pop         ebx
 000457A4    ret
*}
end;

//000457A8
procedure TWinControl.Insert(AControl:TControl);
begin
{*
 000457A8    push        ebx
 000457A9    push        esi
 000457AA    mov         ebx,edx
 000457AC    mov         esi,eax
 000457AE    test        ebx,ebx
>000457B0    je          000457EF
 000457B2    mov         eax,ebx
 000457B4    mov         edx,dword ptr ds:[3F0BC];TWinControl
 000457BA    call        @IsClass
 000457BF    test        al,al
>000457C1    je          000457DF
 000457C3    lea         eax,[esi+184]
 000457C9    mov         edx,ebx
 000457CB    call        ListAdd
 000457D0    lea         eax,[esi+170]
 000457D6    mov         edx,ebx
 000457D8    call        ListAdd
>000457DD    jmp         000457EC
 000457DF    lea         eax,[esi+128]
 000457E5    mov         edx,ebx
 000457E7    call        ListAdd
 000457EC    mov         dword ptr [ebx+24],esi
 000457EF    pop         esi
 000457F0    pop         ebx
 000457F1    ret
*}
end;

//000457F4
procedure TWinControl.Remove(AControl:TControl);
begin
{*
 000457F4    push        ebx
 000457F5    push        esi
 000457F6    mov         ebx,edx
 000457F8    mov         esi,eax
 000457FA    mov         eax,ebx
 000457FC    mov         edx,dword ptr ds:[3F0BC];TWinControl
 00045802    call        @IsClass
 00045807    test        al,al
>00045809    je          00045827
 0004580B    lea         eax,[esi+170]
 00045811    mov         edx,ebx
 00045813    call        ListRemove
 00045818    lea         eax,[esi+184]
 0004581E    mov         edx,ebx
 00045820    call        ListRemove
>00045825    jmp         00045834
 00045827    lea         eax,[esi+128]
 0004582D    mov         edx,ebx
 0004582F    call        ListRemove
 00045834    xor         eax,eax
 00045836    mov         dword ptr [ebx+24],eax
 00045839    pop         esi
 0004583A    pop         ebx
 0004583B    ret
*}
end;

//0004583C
procedure TWinControl.InsertControl(AControl:TControl);
begin
{*
 0004583C    push        ebx
 0004583D    push        esi
 0004583E    push        edi
 0004583F    mov         esi,edx
 00045841    mov         edi,eax
 00045843    mov         edx,edi
 00045845    mov         eax,esi
 00045847    mov         bx,0FFF6
 0004584B    call        @CallDynaInst
 00045850    push        1
 00045852    mov         ebx,esi
 00045854    mov         ecx,ebx
 00045856    mov         edx,0B02C
 0004585B    mov         eax,edi
 0004585D    call        TControl.Perform
 00045862    mov         edx,esi
 00045864    mov         eax,edi
 00045866    call        TWinControl.Insert
 0004586B    test        byte ptr [esi+44],8
>0004586F    jne         000458FA
 00045875    push        0
 00045877    xor         ecx,ecx
 00045879    mov         edx,0B009
 0004587E    mov         eax,esi
 00045880    call        TControl.Perform
 00045885    push        0
 00045887    xor         ecx,ecx
 00045889    mov         edx,0B008
 0004588E    mov         eax,esi
 00045890    call        TControl.Perform
 00045895    push        0
 00045897    xor         ecx,ecx
 00045899    mov         edx,0B023
 0004589E    mov         eax,esi
 000458A0    call        TControl.Perform
 000458A5    push        0
 000458A7    xor         ecx,ecx
 000458A9    mov         edx,0B03D
 000458AE    mov         eax,esi
 000458B0    call        TControl.Perform
 000458B5    mov         eax,esi
 000458B7    mov         edx,dword ptr ds:[3F0BC];TWinControl
 000458BD    call        @IsClass
 000458C2    test        al,al
>000458C4    je          000458DF
 000458C6    push        0
 000458C8    xor         ecx,ecx
 000458CA    mov         edx,0B011
 000458CF    mov         eax,esi
 000458D1    call        TControl.Perform
 000458D6    mov         eax,edi
 000458D8    call        TWinControl.UpdateControlState
>000458DD    jmp         000458F1
 000458DF    mov         eax,edi
 000458E1    call        TWinControl.HandleAllocated
 000458E6    test        al,al
>000458E8    je          000458F1
 000458EA    mov         eax,esi
 000458EC    mov         edx,dword ptr [eax]
 000458EE    call        dword ptr [edx+78]
 000458F1    mov         edx,esi
 000458F3    mov         eax,edi
 000458F5    call        TWinControl.AlignControl
 000458FA    push        1
 000458FC    mov         ecx,ebx
 000458FE    mov         edx,0B036
 00045903    mov         eax,edi
 00045905    call        TControl.Perform
 0004590A    pop         edi
 0004590B    pop         esi
 0004590C    pop         ebx
 0004590D    ret
*}
end;

//00045910
procedure TWinControl.RemoveControl(AControl:TControl);
begin
{*
 00045910    push        ebx
 00045911    push        esi
 00045912    push        edi
 00045913    push        ebp
 00045914    mov         ebx,edx
 00045916    mov         esi,eax
 00045918    push        0
 0004591A    mov         edi,ebx
 0004591C    mov         ecx,edi
 0004591E    mov         edx,0B036
 00045923    mov         eax,esi
 00045925    call        TControl.Perform
 0004592A    mov         eax,ebx
 0004592C    mov         edx,dword ptr ds:[3F0BC];TWinControl
 00045932    call        @IsClass
 00045937    test        al,al
>00045939    je          0004594F
 0004593B    mov         dl,1
 0004593D    mov         ebp,ebx
 0004593F    mov         eax,ebp
 00045941    call        TWinControl.RemoveFocus
 00045946    mov         eax,ebp
 00045948    call        TWinControl.DestroyHandle
>0004594D    jmp         00045966
 0004594F    mov         eax,esi
 00045951    call        TWinControl.HandleAllocated
 00045956    test        al,al
>00045958    je          00045966
 0004595A    xor         ecx,ecx
 0004595C    mov         dl,byte ptr [ebx+47]
 0004595F    mov         eax,ebx
 00045961    call        TControl.InvalidateControl
 00045966    mov         edx,ebx
 00045968    mov         eax,esi
 0004596A    call        TWinControl.Remove
 0004596F    push        0
 00045971    mov         ecx,edi
 00045973    mov         edx,0B02C
 00045978    mov         eax,esi
 0004597A    call        TControl.Perform
 0004597F    mov         eax,esi
 00045981    call        TWinControl.Realign
 00045986    pop         ebp
 00045987    pop         edi
 00045988    pop         esi
 00045989    pop         ebx
 0004598A    ret
*}
end;

//0004598C
function TWinControl.GetControl(Index:Integer):TControl;
begin
{*
 0004598C    push        ebx
 0004598D    push        esi
 0004598E    push        edi
 0004598F    push        ebp
 00045990    mov         edi,edx
 00045992    mov         ebx,eax
 00045994    mov         ebp,dword ptr [ebx+128]
 0004599A    test        ebp,ebp
>0004599C    je          000459A3
 0004599E    mov         esi,dword ptr [ebp+8]
>000459A1    jmp         000459A5
 000459A3    xor         esi,esi
 000459A5    cmp         esi,edi
>000459A7    jle         000459B4
 000459A9    mov         edx,edi
 000459AB    mov         eax,ebp
 000459AD    call        TList.Get
>000459B2    jmp         000459C3
 000459B4    mov         edx,edi
 000459B6    sub         edx,esi
 000459B8    mov         eax,dword ptr [ebx+184]
 000459BE    call        TList.Get
 000459C3    pop         ebp
 000459C4    pop         edi
 000459C5    pop         esi
 000459C6    pop         ebx
 000459C7    ret
*}
end;

//000459C8
function TWinControl.GetControlCount:Integer;
begin
{*
 000459C8    xor         edx,edx
 000459CA    mov         ecx,dword ptr [eax+128]
 000459D0    test        ecx,ecx
>000459D2    je          000459D7
 000459D4    add         edx,dword ptr [ecx+8]
 000459D7    mov         ecx,dword ptr [eax+184]
 000459DD    test        ecx,ecx
>000459DF    je          000459E4
 000459E1    add         edx,dword ptr [ecx+8]
 000459E4    mov         eax,edx
 000459E6    ret
*}
end;

//000459E8
procedure TWinControl.Broadcast(var Message:void );
begin
{*
 000459E8    push        ebx
 000459E9    push        esi
 000459EA    push        edi
 000459EB    push        ebp
 000459EC    push        ecx
 000459ED    mov         esi,edx
 000459EF    mov         dword ptr [esp],eax
 000459F2    mov         eax,dword ptr [esp]
 000459F5    call        TWinControl.GetControlCount
 000459FA    mov         ebx,eax
 000459FC    dec         ebx
 000459FD    test        ebx,ebx
>000459FF    jl          00045A22
 00045A01    inc         ebx
 00045A02    xor         edi,edi
 00045A04    mov         edx,edi
 00045A06    mov         eax,dword ptr [esp]
 00045A09    call        TWinControl.GetControl
 00045A0E    mov         ebp,eax
 00045A10    mov         edx,esi
 00045A12    mov         eax,dword ptr [ebp+2C]
 00045A15    call        dword ptr [ebp+28]
 00045A18    cmp         dword ptr [esi+0C],0
>00045A1C    jne         00045A22
 00045A1E    inc         edi
 00045A1F    dec         ebx
>00045A20    jne         00045A04
 00045A22    pop         edx
 00045A23    pop         ebp
 00045A24    pop         edi
 00045A25    pop         esi
 00045A26    pop         ebx
 00045A27    ret
*}
end;

//00045A28
procedure TWinControl.NotifyControls(Msg:Word);
begin
{*
 00045A28    add         esp,0FFFFFFF0
 00045A2B    movzx       edx,dx
 00045A2E    mov         dword ptr [esp],edx
 00045A31    xor         edx,edx
 00045A33    mov         dword ptr [esp+4],edx
 00045A37    xor         edx,edx
 00045A39    mov         dword ptr [esp+8],edx
 00045A3D    xor         edx,edx
 00045A3F    mov         dword ptr [esp+0C],edx
 00045A43    mov         edx,esp
 00045A45    call        TWinControl.Broadcast
 00045A4A    add         esp,10
 00045A4D    ret
*}
end;

//00045A50
procedure TWinControl.CreateSubClass(var Params:TCreateParams; ControlClassName:PChar);
begin
{*
 00045A50    push        ebx
 00045A51    push        esi
 00045A52    push        edi
 00045A53    mov         esi,ecx
 00045A55    mov         ebx,edx
 00045A57    test        esi,esi
>00045A59    je          00045AB9
 00045A5B    mov         edi,dword ptr [ebx+34]
 00045A5E    lea         eax,[ebx+24]
 00045A61    push        eax
 00045A62    push        esi
 00045A63    mov         eax,[000B5950];^HInstance:Longword
 00045A68    mov         eax,dword ptr [eax]
 00045A6A    push        eax
 00045A6B    call        user32.GetClassInfoA
 00045A70    test        eax,eax
>00045A72    jne         00045AA8
 00045A74    lea         eax,[ebx+24]
 00045A77    push        eax
 00045A78    push        esi
 00045A79    push        0
 00045A7B    call        user32.GetClassInfoA
 00045A80    test        eax,eax
>00045A82    jne         00045AA8
 00045A84    lea         eax,[ebx+24]
 00045A87    push        eax
 00045A88    push        esi
 00045A89    mov         eax,[000B5800];MainInstance:Cardinal
 00045A8E    mov         eax,dword ptr [eax]
 00045A90    push        eax
 00045A91    call        user32.GetClassInfoA
 00045A96    test        eax,eax
>00045A98    jne         00045AA8
 00045A9A    lea         eax,[ebx+24]
 00045A9D    push        eax
 00045A9E    push        esi
 00045A9F    mov         eax,dword ptr [ebx+34]
 00045AA2    push        eax
 00045AA3    call        user32.GetClassInfoA
 00045AA8    mov         dword ptr [ebx+34],edi
 00045AAB    mov         eax,dword ptr [ebx+24]
 00045AAE    and         eax,0FFFFBF1F
 00045AB3    or          eax,3
 00045AB6    mov         dword ptr [ebx+24],eax
 00045AB9    pop         edi
 00045ABA    pop         esi
 00045ABB    pop         ebx
 00045ABC    ret
*}
end;

//00045AC0
procedure TWinControl.AddBiDiModeExStyle(var ExStyle:DWORD);
begin
{*
 00045AC0    push        ebx
 00045AC1    push        esi
 00045AC2    push        edi
 00045AC3    mov         edi,edx
 00045AC5    mov         esi,eax
 00045AC7    mov         eax,esi
 00045AC9    call        TControl.UseRightToLeftReading
 00045ACE    test        al,al
>00045AD0    je          00045AD8
 00045AD2    or          dword ptr [edi],2000
 00045AD8    mov         eax,esi
 00045ADA    call        TControl.UseRightToLeftScrollBar
 00045ADF    test        al,al
>00045AE1    je          00045AE9
 00045AE3    or          dword ptr [edi],4000
 00045AE9    mov         eax,esi
 00045AEB    mov         bx,0FFCF
 00045AEF    call        @CallDynaInst
 00045AF4    test        al,al
>00045AF6    je          00045B21
 00045AF8    mov         eax,esi
 00045AFA    mov         bx,0FFD0
 00045AFE    call        @CallDynaInst
 00045B03    test        al,al
>00045B05    jne         00045B0F
 00045B07    or          dword ptr [edi],1000
>00045B0D    jmp         00045B21
 00045B0F    mov         eax,esi
 00045B11    mov         bx,0FFD0
 00045B15    call        @CallDynaInst
 00045B1A    cmp         al,1
>00045B1C    jne         00045B21
 00045B1E    or          dword ptr [edi],0
 00045B21    pop         edi
 00045B22    pop         esi
 00045B23    pop         ebx
 00045B24    ret
*}
end;

//00045B28
procedure TWinControl.CreateParams(var Params:TCreateParams);
begin
{*
 00045B28    push        ebp
 00045B29    mov         ebp,esp
 00045B2B    add         esp,0FFFFFEFC
 00045B31    push        ebx
 00045B32    push        esi
 00045B33    push        edi
 00045B34    xor         ecx,ecx
 00045B36    mov         dword ptr [ebp-4],ecx
 00045B39    mov         ebx,edx
 00045B3B    mov         esi,eax
 00045B3D    xor         eax,eax
 00045B3F    push        ebp
 00045B40    push        45C48
 00045B45    push        dword ptr fs:[eax]
 00045B48    mov         dword ptr fs:[eax],esp
 00045B4B    mov         eax,ebx
 00045B4D    xor         ecx,ecx
 00045B4F    mov         edx,8C
 00045B54    call        @FillChar
 00045B59    mov         eax,dword ptr [esi+54]
 00045B5C    mov         dword ptr [ebx],eax
 00045B5E    mov         dword ptr [ebx+4],44000000
 00045B65    lea         edx,[ebx+8]
 00045B68    mov         eax,esi
 00045B6A    call        TWinControl.AddBiDiModeExStyle
 00045B6F    test        byte ptr [esi+40],1
>00045B73    je          00045B83
 00045B75    or          dword ptr [ebx+4],2000000
 00045B7C    or          dword ptr [ebx+8],10000
 00045B83    test        byte ptr [esi+20],10
>00045B87    jne         00045B9B
 00045B89    mov         eax,esi
 00045B8B    mov         edx,dword ptr [eax]
 00045B8D    call        dword ptr [edx+50]
 00045B90    test        al,al
>00045B92    jne         00045B9B
 00045B94    or          dword ptr [ebx+4],8000000
 00045B9B    cmp         byte ptr [esi+178],0
>00045BA2    je          00045BAB
 00045BA4    or          dword ptr [ebx+4],10000
 00045BAB    mov         eax,dword ptr [esi+30]
 00045BAE    mov         dword ptr [ebx+0C],eax
 00045BB1    mov         eax,dword ptr [esi+34]
 00045BB4    mov         dword ptr [ebx+10],eax
 00045BB7    mov         eax,dword ptr [esi+38]
 00045BBA    mov         dword ptr [ebx+14],eax
 00045BBD    mov         eax,dword ptr [esi+3C]
 00045BC0    mov         dword ptr [ebx+18],eax
 00045BC3    mov         edi,dword ptr [esi+24]
 00045BC6    test        edi,edi
>00045BC8    je          00045BD6
 00045BCA    mov         eax,edi
 00045BCC    call        TWinControl.GetHandle
 00045BD1    mov         dword ptr [ebx+1C],eax
>00045BD4    jmp         00045BDF
 00045BD6    mov         eax,dword ptr [esi+168]
 00045BDC    mov         dword ptr [ebx+1C],eax
 00045BDF    mov         dword ptr [ebx+24],0B
 00045BE6    mov         eax,16CA0;user32.DefWindowProcA:Longint
 00045BEB    mov         dword ptr [ebx+28],eax
 00045BEE    push        7F00
 00045BF3    push        0
 00045BF5    call        user32.LoadCursorA
 00045BFA    mov         dword ptr [ebx+3C],eax
 00045BFD    xor         eax,eax
 00045BFF    mov         dword ptr [ebx+40],eax
 00045C02    mov         eax,[000B5950];^HInstance:Longword
 00045C07    mov         eax,dword ptr [eax]
 00045C09    mov         dword ptr [ebx+34],eax
 00045C0C    lea         edx,[ebp-104]
 00045C12    mov         eax,dword ptr [esi]
 00045C14    call        TObject.ClassName
 00045C19    lea         edx,[ebp-104]
 00045C1F    lea         eax,[ebp-4]
 00045C22    call        @LStrFromString
 00045C27    mov         edx,dword ptr [ebp-4]
 00045C2A    lea         eax,[ebx+4C]
 00045C2D    call        StrPCopy
 00045C32    xor         eax,eax
 00045C34    pop         edx
 00045C35    pop         ecx
 00045C36    pop         ecx
 00045C37    mov         dword ptr fs:[eax],edx
 00045C3A    push        45C4F
 00045C3F    lea         eax,[ebp-4]
 00045C42    call        @LStrClr
 00045C47    ret
>00045C48    jmp         @HandleFinally
>00045C4D    jmp         00045C3F
 00045C4F    pop         edi
 00045C50    pop         esi
 00045C51    pop         ebx
 00045C52    mov         esp,ebp
 00045C54    pop         ebp
 00045C55    ret
*}
end;

//00045C58
procedure TWinControl.CreateWnd;
begin
{*
 00045C58    push        ebp
 00045C59    mov         ebp,esp
 00045C5B    add         esp,0FFFFFF40
 00045C61    push        ebx
 00045C62    xor         edx,edx
 00045C64    mov         dword ptr [ebp-0C0],edx
 00045C6A    mov         ebx,eax
 00045C6C    xor         eax,eax
 00045C6E    push        ebp
 00045C6F    push        45DB8
 00045C74    push        dword ptr fs:[eax]
 00045C77    mov         dword ptr fs:[eax],esp
 00045C7A    lea         edx,[ebp-8C]
 00045C80    mov         eax,ebx
 00045C82    mov         ecx,dword ptr [eax]
 00045C84    call        dword ptr [ecx+94]
 00045C8A    cmp         dword ptr [ebp-70],0
>00045C8E    jne         00045CD9
 00045C90    test        byte ptr [ebp-85],40
>00045C97    je          00045CD9
 00045C99    mov         eax,dword ptr [ebx+8]
 00045C9C    mov         dword ptr [ebp-0BC],eax
 00045CA2    mov         byte ptr [ebp-0B8],0B
 00045CA9    lea         eax,[ebp-0BC]
 00045CAF    push        eax
 00045CB0    push        0
 00045CB2    lea         edx,[ebp-0C0]
 00045CB8    mov         eax,[000B5A5C];^SParentRequired:TResStringRec
 00045CBD    call        LoadResString
 00045CC2    mov         ecx,dword ptr [ebp-0C0]
 00045CC8    mov         dl,1
 00045CCA    mov         eax,[0001EE64];EInvalidOperation
 00045CCF    call        Exception.CreateFmt
 00045CD4    call        @RaiseExcept
 00045CD9    mov         eax,dword ptr [ebp-64]
 00045CDC    mov         dword ptr [ebx+130],eax
 00045CE2    lea         eax,[ebp-0B4]
 00045CE8    push        eax
 00045CE9    lea         eax,[ebp-40]
 00045CEC    push        eax
 00045CED    mov         eax,dword ptr [ebp-58]
 00045CF0    push        eax
 00045CF1    call        user32.GetClassInfoA
 00045CF6    neg         eax
 00045CF8    sbb         eax,eax
 00045CFA    neg         eax
 00045CFC    test        al,al
>00045CFE    je          00045D0D
 00045D00    mov         edx,3FD90;InitWndProc:Longint
 00045D05    cmp         edx,dword ptr [ebp-0B0]
>00045D0B    je          00045D3E
 00045D0D    test        al,al
>00045D0F    je          00045D1E
 00045D11    mov         eax,dword ptr [ebp-58]
 00045D14    push        eax
 00045D15    lea         eax,[ebp-40]
 00045D18    push        eax
 00045D19    call        user32.UnregisterClassA
 00045D1E    mov         dword ptr [ebp-64],3FD90;InitWndProc:Longint
 00045D25    lea         eax,[ebp-40]
 00045D28    mov         dword ptr [ebp-44],eax
 00045D2B    lea         eax,[ebp-68]
 00045D2E    push        eax
 00045D2F    call        user32.RegisterClassA
 00045D34    test        ax,ax
>00045D37    jne         00045D3E
 00045D39    call        RaiseLastWin32Error
 00045D3E    mov         dword ptr ds:[0B477C],ebx
 00045D44    lea         edx,[ebp-8C]
 00045D4A    mov         eax,ebx
 00045D4C    mov         ecx,dword ptr [eax]
 00045D4E    call        dword ptr [ecx+98]
 00045D54    cmp         dword ptr [ebx+140],0
>00045D5B    jne         00045D62
 00045D5D    call        RaiseLastWin32Error
 00045D62    mov         eax,dword ptr [ebx+54]
 00045D65    call        StrDispose
 00045D6A    xor         eax,eax
 00045D6C    mov         dword ptr [ebx+54],eax
 00045D6F    mov         eax,ebx
 00045D71    call        TWinControl.UpdateBounds
 00045D76    push        1
 00045D78    mov         eax,dword ptr [ebx+58]
 00045D7B    call        TFont.GetHandle
 00045D80    mov         ecx,eax
 00045D82    mov         edx,30
 00045D87    mov         eax,ebx
 00045D89    call        TControl.Perform
 00045D8E    cmp         byte ptr [ebx+4C],0
>00045D92    je          00045D9F
 00045D94    mov         eax,ebx
 00045D96    mov         bx,0FFEF
 00045D9A    call        @CallDynaInst
 00045D9F    xor         eax,eax
 00045DA1    pop         edx
 00045DA2    pop         ecx
 00045DA3    pop         ecx
 00045DA4    mov         dword ptr fs:[eax],edx
 00045DA7    push        45DBF
 00045DAC    lea         eax,[ebp-0C0]
 00045DB2    call        @LStrClr
 00045DB7    ret
>00045DB8    jmp         @HandleFinally
>00045DBD    jmp         00045DAC
 00045DBF    pop         ebx
 00045DC0    mov         esp,ebp
 00045DC2    pop         ebp
 00045DC3    ret
*}
end;

//00045DC4
procedure TWinControl.CreateWindowHandle(const Params:TCreateParams);
begin
{*
 00045DC4    push        ebx
 00045DC5    push        esi
 00045DC6    mov         ebx,edx
 00045DC8    mov         esi,eax
 00045DCA    mov         eax,dword ptr [ebx+20]
 00045DCD    push        eax
 00045DCE    mov         eax,dword ptr [ebx+34]
 00045DD1    push        eax
 00045DD2    push        0
 00045DD4    mov         eax,dword ptr [ebx+1C]
 00045DD7    push        eax
 00045DD8    mov         eax,dword ptr [ebx+18]
 00045DDB    push        eax
 00045DDC    mov         eax,dword ptr [ebx+14]
 00045DDF    push        eax
 00045DE0    mov         eax,dword ptr [ebx+10]
 00045DE3    push        eax
 00045DE4    mov         eax,dword ptr [ebx+0C]
 00045DE7    push        eax
 00045DE8    mov         eax,dword ptr [ebx+4]
 00045DEB    push        eax
 00045DEC    mov         eax,dword ptr [ebx]
 00045DEE    push        eax
 00045DEF    lea         eax,[ebx+4C]
 00045DF2    push        eax
 00045DF3    mov         eax,dword ptr [ebx+8]
 00045DF6    push        eax
 00045DF7    call        user32.CreateWindowExA
 00045DFC    mov         dword ptr [esi+140],eax
 00045E02    pop         esi
 00045E03    pop         ebx
 00045E04    ret
*}
end;

//00045E08
procedure TWinControl.DestroyWnd;
begin
{*
 00045E08    push        ebx
 00045E09    push        esi
 00045E0A    push        edi
 00045E0B    mov         ebx,eax
 00045E0D    mov         eax,ebx
 00045E0F    call        TControl.GetTextLen
 00045E14    mov         esi,eax
 00045E16    cmp         esi,1
>00045E19    jge         00045E2A
 00045E1B    mov         eax,45E5C
 00045E20    call        StrNew
 00045E25    mov         dword ptr [ebx+54],eax
>00045E28    jmp         00045E49
 00045E2A    lea         eax,[esi+1]
 00045E2D    call        StrAlloc
 00045E32    mov         edi,eax
 00045E34    mov         dword ptr [ebx+54],edi
 00045E37    mov         eax,edi
 00045E39    call        StrBufSize
 00045E3E    mov         ecx,eax
 00045E40    mov         edx,edi
 00045E42    mov         eax,ebx
 00045E44    call        TControl.GetTextBuf
 00045E49    call        FreeDeviceContexts
 00045E4E    mov         eax,ebx
 00045E50    mov         edx,dword ptr [eax]
 00045E52    call        dword ptr [edx+0A0]
 00045E58    pop         edi
 00045E59    pop         esi
 00045E5A    pop         ebx
 00045E5B    ret
*}
end;

//00045E60
procedure TWinControl.DestroyWindowHandle;
begin
{*
 00045E60    push        ebp
 00045E61    mov         ebp,esp
 00045E63    push        ecx
 00045E64    mov         dword ptr [ebp-4],eax
 00045E67    mov         eax,dword ptr [ebp-4]
 00045E6A    or          word ptr [eax+44],200
 00045E70    xor         eax,eax
 00045E72    push        ebp
 00045E73    push        45EA4
 00045E78    push        dword ptr fs:[eax]
 00045E7B    mov         dword ptr fs:[eax],esp
 00045E7E    mov         eax,dword ptr [ebp-4]
 00045E81    mov         eax,dword ptr [eax+140]
 00045E87    push        eax
 00045E88    call        user32.DestroyWindow
 00045E8D    xor         eax,eax
 00045E8F    pop         edx
 00045E90    pop         ecx
 00045E91    pop         ecx
 00045E92    mov         dword ptr fs:[eax],edx
 00045E95    push        45EAB
 00045E9A    mov         eax,dword ptr [ebp-4]
 00045E9D    and         word ptr [eax+44],0FDFF
 00045EA3    ret
>00045EA4    jmp         @HandleFinally
>00045EA9    jmp         00045E9A
 00045EAB    mov         eax,dword ptr [ebp-4]
 00045EAE    xor         edx,edx
 00045EB0    mov         dword ptr [eax+140],edx
 00045EB6    pop         ecx
 00045EB7    pop         ebp
 00045EB8    ret
*}
end;

//00045EBC
function TWinControl.PrecedingWindow(Control:TWinControl):HWND;
begin
{*
 00045EBC    push        ebx
 00045EBD    push        esi
 00045EBE    push        edi
 00045EBF    mov         ebx,edx
 00045EC1    mov         edi,eax
 00045EC3    mov         eax,dword ptr [edi+184]
 00045EC9    mov         edx,ebx
 00045ECB    call        TList.IndexOf
 00045ED0    mov         esi,eax
 00045ED2    inc         esi
 00045ED3    mov         eax,dword ptr [edi+184]
 00045ED9    mov         ebx,dword ptr [eax+8]
 00045EDC    dec         ebx
 00045EDD    sub         ebx,esi
>00045EDF    jl          00045EFD
 00045EE1    inc         ebx
 00045EE2    mov         eax,dword ptr [edi+184]
 00045EE8    mov         edx,esi
 00045EEA    call        TList.Get
 00045EEF    mov         eax,dword ptr [eax+140]
 00045EF5    test        eax,eax
>00045EF7    jne         00045EFF
 00045EF9    inc         esi
 00045EFA    dec         ebx
>00045EFB    jne         00045EE2
 00045EFD    xor         eax,eax
 00045EFF    pop         edi
 00045F00    pop         esi
 00045F01    pop         ebx
 00045F02    ret
*}
end;

//00045F04
procedure TWinControl.CreateHandle;
begin
{*
 00045F04    push        ebx
 00045F05    push        esi
 00045F06    mov         ebx,eax
 00045F08    cmp         dword ptr [ebx+140],0
>00045F0F    jne         00045F6E
 00045F11    mov         eax,ebx
 00045F13    mov         edx,dword ptr [eax]
 00045F15    call        dword ptr [edx+9C]
 00045F1B    mov         esi,ebx
 00045F1D    push        esi
 00045F1E    movzx       eax,word ptr ds:[0B673A]
 00045F25    push        eax
 00045F26    mov         eax,dword ptr [ebx+140]
 00045F2C    push        eax
 00045F2D    call        user32.SetPropA
 00045F32    push        esi
 00045F33    movzx       eax,word ptr ds:[0B6738]
 00045F3A    push        eax
 00045F3B    mov         eax,dword ptr [ebx+140]
 00045F41    push        eax
 00045F42    call        user32.SetPropA
 00045F47    mov         esi,dword ptr [ebx+24]
 00045F4A    test        esi,esi
>00045F4C    je          00045F6E
 00045F4E    push        13
 00045F50    push        0
 00045F52    push        0
 00045F54    push        0
 00045F56    push        0
 00045F58    mov         edx,ebx
 00045F5A    mov         eax,esi
 00045F5C    call        TWinControl.PrecedingWindow
 00045F61    push        eax
 00045F62    mov         eax,dword ptr [ebx+140]
 00045F68    push        eax
 00045F69    call        user32.SetWindowPos
 00045F6E    pop         esi
 00045F6F    pop         ebx
 00045F70    ret
*}
end;

//00045F74
procedure TWinControl.DestroyHandle;
begin
{*
 00045F74    push        ebx
 00045F75    push        esi
 00045F76    push        edi
 00045F77    mov         ebx,eax
 00045F79    cmp         dword ptr [ebx+140],0
>00045F80    je          00045FB7
 00045F82    mov         eax,dword ptr [ebx+184]
 00045F88    test        eax,eax
>00045F8A    je          00045FAD
 00045F8C    mov         esi,dword ptr [eax+8]
 00045F8F    dec         esi
 00045F90    test        esi,esi
>00045F92    jl          00045FAD
 00045F94    inc         esi
 00045F95    xor         edi,edi
 00045F97    mov         edx,edi
 00045F99    mov         eax,dword ptr [ebx+184]
 00045F9F    call        TList.Get
 00045FA4    call        TWinControl.DestroyHandle
 00045FA9    inc         edi
 00045FAA    dec         esi
>00045FAB    jne         00045F97
 00045FAD    mov         eax,ebx
 00045FAF    mov         edx,dword ptr [eax]
 00045FB1    call        dword ptr [edx+0A4]
 00045FB7    pop         edi
 00045FB8    pop         esi
 00045FB9    pop         ebx
 00045FBA    ret
*}
end;

//00045FBC
procedure TWinControl.RecreateWnd;
begin
{*
 00045FBC    cmp         dword ptr [eax+140],0
>00045FC3    je          00045FD3
 00045FC5    push        0
 00045FC7    xor         ecx,ecx
 00045FC9    mov         edx,0B033
 00045FCE    call        TControl.Perform
 00045FD3    ret
*}
end;

//00045FD4
procedure TWinControl.CMRecreateWnd(var Message:TMessage);
begin
{*
 00045FD4    push        ebx
 00045FD5    push        esi
 00045FD6    mov         esi,eax
 00045FD8    mov         eax,esi
 00045FDA    mov         bx,0FFBB
 00045FDE    call        @CallDynaInst
 00045FE3    mov         ebx,eax
 00045FE5    mov         eax,esi
 00045FE7    call        TWinControl.DestroyHandle
 00045FEC    mov         eax,esi
 00045FEE    call        TWinControl.UpdateControlState
 00045FF3    test        bl,bl
>00045FF5    je          0004600C
 00045FF7    cmp         dword ptr [esi+140],0
>00045FFE    je          0004600C
 00046000    mov         eax,dword ptr [esi+140]
 00046006    push        eax
 00046007    call        user32.SetFocus
 0004600C    pop         esi
 0004600D    pop         ebx
 0004600E    ret
*}
end;

//00046010
procedure TWinControl.UpdateShowing;
begin
{*
 00046010    push        ebp
 00046011    mov         ebp,esp
 00046013    add         esp,0FFFFFFF8
 00046016    push        ebx
 00046017    push        esi
 00046018    push        edi
 00046019    mov         dword ptr [ebp-4],eax
 0004601C    mov         eax,dword ptr [ebp-4]
 0004601F    cmp         byte ptr [eax+47],0
>00046023    jne         00046037
 00046025    mov         eax,dword ptr [ebp-4]
 00046028    test        byte ptr [eax+20],10
>0004602C    je          00046040
 0004602E    mov         eax,dword ptr [ebp-4]
 00046031    test        byte ptr [eax+41],4
>00046035    jne         00046040
 00046037    mov         eax,dword ptr [ebp-4]
 0004603A    test        byte ptr [eax+44],8
>0004603E    je          00046044
 00046040    xor         eax,eax
>00046042    jmp         00046046
 00046044    mov         al,1
 00046046    mov         byte ptr [ebp-5],al
 00046049    cmp         byte ptr [ebp-5],0
>0004604D    je          00046097
 0004604F    mov         eax,dword ptr [ebp-4]
 00046052    cmp         dword ptr [eax+140],0
>00046059    jne         00046066
 0004605B    mov         eax,dword ptr [ebp-4]
 0004605E    mov         edx,dword ptr [eax]
 00046060    call        dword ptr [edx+90]
 00046066    mov         eax,dword ptr [ebp-4]
 00046069    mov         eax,dword ptr [eax+184]
 0004606F    test        eax,eax
>00046071    je          00046097
 00046073    mov         ebx,dword ptr [eax+8]
 00046076    dec         ebx
 00046077    test        ebx,ebx
>00046079    jl          00046097
 0004607B    inc         ebx
 0004607C    xor         esi,esi
 0004607E    mov         eax,dword ptr [ebp-4]
 00046081    mov         eax,dword ptr [eax+184]
 00046087    mov         edx,esi
 00046089    call        TList.Get
 0004608E    call        TWinControl.UpdateShowing
 00046093    inc         esi
 00046094    dec         ebx
>00046095    jne         0004607E
 00046097    mov         eax,dword ptr [ebp-4]
 0004609A    cmp         dword ptr [eax+140],0
>000460A1    je          00046103
 000460A3    mov         eax,dword ptr [ebp-4]
 000460A6    mov         al,byte ptr [eax+16C]
 000460AC    cmp         al,byte ptr [ebp-5]
>000460AF    je          00046103
 000460B1    mov         eax,dword ptr [ebp-4]
 000460B4    mov         dl,byte ptr [ebp-5]
 000460B7    mov         byte ptr [eax+16C],dl
 000460BD    xor         eax,eax
 000460BF    push        ebp
 000460C0    push        460E6
 000460C5    push        dword ptr fs:[eax]
 000460C8    mov         dword ptr fs:[eax],esp
 000460CB    push        0
 000460CD    xor         ecx,ecx
 000460CF    mov         edx,0B019
 000460D4    mov         eax,dword ptr [ebp-4]
 000460D7    call        TControl.Perform
 000460DC    xor         eax,eax
 000460DE    pop         edx
 000460DF    pop         ecx
 000460E0    pop         ecx
 000460E1    mov         dword ptr fs:[eax],edx
>000460E4    jmp         00046103
>000460E6    jmp         @HandleAnyException
 000460EB    mov         al,byte ptr [ebp-5]
 000460EE    xor         al,1
 000460F0    mov         edx,dword ptr [ebp-4]
 000460F3    mov         byte ptr [edx+16C],al
 000460F9    call        @RaiseAgain
 000460FE    call        @DoneExcept
 00046103    pop         edi
 00046104    pop         esi
 00046105    pop         ebx
 00046106    pop         ecx
 00046107    pop         ecx
 00046108    pop         ebp
 00046109    ret
*}
end;

//0004610C
procedure TWinControl.UpdateControlState;
begin
{*
 0004610C    push        ebx
 0004610D    push        esi
 0004610E    mov         esi,eax
 00046110    mov         ebx,esi
>00046112    jmp         0004611F
 00046114    mov         ebx,eax
 00046116    cmp         byte ptr [ebx+16C],0
>0004611D    je          00046147
 0004611F    mov         eax,dword ptr [ebx+24]
 00046122    test        eax,eax
>00046124    jne         00046114
 00046126    mov         eax,ebx
 00046128    mov         edx,dword ptr ds:[55208];TCustomForm
 0004612E    call        @IsClass
 00046133    test        al,al
>00046135    jne         00046140
 00046137    cmp         dword ptr [ebx+168],0
>0004613E    je          00046147
 00046140    mov         eax,esi
 00046142    call        TWinControl.UpdateShowing
 00046147    pop         esi
 00046148    pop         ebx
 00046149    ret
*}
end;

//0004614C
procedure TWinControl.MainWndProc(var Message:TMessage);
begin
{*
 0004614C    push        ebp
 0004614D    mov         ebp,esp
 0004614F    push        ecx
 00046150    push        ebx
 00046151    push        esi
 00046152    push        edi
 00046153    mov         dword ptr [ebp-4],eax
 00046156    xor         eax,eax
 00046158    push        ebp
 00046159    push        461A4
 0004615E    push        dword ptr fs:[eax]
 00046161    mov         dword ptr fs:[eax],esp
 00046164    xor         eax,eax
 00046166    push        ebp
 00046167    push        46193
 0004616C    push        dword ptr fs:[eax]
 0004616F    mov         dword ptr fs:[eax],esp
 00046172    mov         ebx,dword ptr [ebp-4]
 00046175    mov         eax,dword ptr [ebx+2C]
 00046178    call        dword ptr [ebx+28]
 0004617B    xor         eax,eax
 0004617D    pop         edx
 0004617E    pop         ecx
 0004617F    pop         ecx
 00046180    mov         dword ptr fs:[eax],edx
 00046183    push        4619A
 00046188    call        FreeDeviceContexts
 0004618D    call        FreeMemoryContexts
 00046192    ret
>00046193    jmp         @HandleFinally
>00046198    jmp         00046188
 0004619A    xor         eax,eax
 0004619C    pop         edx
 0004619D    pop         ecx
 0004619E    pop         ecx
 0004619F    mov         dword ptr fs:[eax],edx
>000461A2    jmp         000461BD
>000461A4    jmp         @HandleAnyException
 000461A9    mov         eax,[000B59E8];^Application:TApplication
 000461AE    mov         eax,dword ptr [eax]
 000461B0    mov         edx,dword ptr [ebp-4]
 000461B3    call        TApplication.HandleException
 000461B8    call        @DoneExcept
 000461BD    pop         edi
 000461BE    pop         esi
 000461BF    pop         ebx
 000461C0    pop         ecx
 000461C1    pop         ebp
 000461C2    ret
*}
end;

//000461C4
function TWinControl.ControlAtPos(const Pos:TPoint; AllowDisabled:Boolean):TControl;
begin
{*
 000461C4    push        ebx
 000461C5    push        esi
 000461C6    push        edi
 000461C7    push        ebp
 000461C8    add         esp,0FFFFFFE4
 000461CB    mov         byte ptr [esp],cl
 000461CE    mov         ebp,edx
 000461D0    mov         edi,eax
 000461D2    mov         eax,dword ptr [edi+128]
 000461D8    test        eax,eax
>000461DA    je          0004627C
 000461E0    mov         esi,dword ptr [eax+8]
 000461E3    dec         esi
 000461E4    cmp         esi,0
>000461E7    jl          0004627C
 000461ED    mov         eax,dword ptr [edi+128]
 000461F3    mov         edx,esi
 000461F5    call        TList.Get
 000461FA    mov         ebx,eax
 000461FC    lea         ecx,[esp+4]
 00046200    mov         edx,dword ptr [ebp+4]
 00046203    sub         edx,dword ptr [ebx+34]
 00046206    mov         eax,dword ptr [ebp]
 00046209    sub         eax,dword ptr [ebx+30]
 0004620C    call        Point
 00046211    push        dword ptr [esp+8]
 00046215    push        dword ptr [esp+8]
 00046219    lea         edx,[esp+14]
 0004621D    mov         eax,ebx
 0004621F    mov         ecx,dword ptr [eax]
 00046221    call        dword ptr [ecx+44]
 00046224    lea         eax,[esp+14]
 00046228    push        eax
 00046229    call        user32.PtInRect
 0004622E    test        eax,eax
>00046230    je          00046272
 00046232    test        byte ptr [ebx+20],10
>00046236    je          00046244
 00046238    cmp         byte ptr [ebx+47],0
>0004623C    jne         0004627E
 0004623E    test        byte ptr [ebx+41],4
>00046242    je          0004627E
 00046244    cmp         byte ptr [ebx+47],0
>00046248    je          00046272
 0004624A    mov         eax,ebx
 0004624C    mov         edx,dword ptr [eax]
 0004624E    call        dword ptr [edx+50]
 00046251    or          al,byte ptr [esp]
>00046254    je          00046272
 00046256    lea         eax,[esp+4]
 0004625A    call        PointToSmallPoint
 0004625F    push        eax
 00046260    xor         ecx,ecx
 00046262    mov         edx,0B00A
 00046267    mov         eax,ebx
 00046269    call        TControl.Perform
 0004626E    test        eax,eax
>00046270    jne         0004627E
 00046272    dec         esi
 00046273    cmp         esi,0FFFFFFFF
>00046276    jne         000461ED
 0004627C    xor         ebx,ebx
 0004627E    mov         eax,ebx
 00046280    add         esp,1C
 00046283    pop         ebp
 00046284    pop         edi
 00046285    pop         esi
 00046286    pop         ebx
 00046287    ret
*}
end;

//00046288
function TWinControl.IsControlMouseMsg(var Message:TWMMouse):Boolean;
begin
{*
 00046288    push        ebx
 00046289    push        esi
 0004628A    push        edi
 0004628B    add         esp,0FFFFFFF0
 0004628E    mov         edi,edx
 00046290    mov         esi,eax
 00046292    mov         eax,esi
 00046294    call        TWinControl.GetHandle
 00046299    mov         ebx,eax
 0004629B    call        user32.GetCapture
 000462A0    cmp         ebx,eax
>000462A2    jne         000462C1
 000462A4    xor         ebx,ebx
 000462A6    cmp         dword ptr ds:[0B4838],0
>000462AD    je          000462DC
 000462AF    mov         eax,[000B4838]
 000462B4    cmp         esi,dword ptr [eax+24]
>000462B7    jne         000462DC
 000462B9    mov         ebx,dword ptr ds:[0B4838]
>000462BF    jmp         000462DC
 000462C1    lea         edx,[esp+8]
 000462C5    mov         eax,dword ptr [edi+8]
 000462C8    call        SmallPointToPoint
 000462CD    lea         edx,[esp+8]
 000462D1    xor         ecx,ecx
 000462D3    mov         eax,esi
 000462D5    call        TWinControl.ControlAtPos
 000462DA    mov         ebx,eax
 000462DC    xor         eax,eax
 000462DE    test        ebx,ebx
>000462E0    je          0004630D
 000462E2    movsx       eax,word ptr [edi+8]
 000462E6    sub         eax,dword ptr [ebx+30]
 000462E9    mov         dword ptr [esp],eax
 000462EC    movsx       eax,word ptr [edi+0A]
 000462F0    sub         eax,dword ptr [ebx+34]
 000462F3    mov         dword ptr [esp+4],eax
 000462F7    mov         eax,esp
 000462F9    call        PointToSmallPoint
 000462FE    push        eax
 000462FF    mov         ecx,dword ptr [edi+4]
 00046302    mov         edx,dword ptr [edi]
 00046304    mov         eax,ebx
 00046306    call        TControl.Perform
 0004630B    mov         al,1
 0004630D    add         esp,10
 00046310    pop         edi
 00046311    pop         esi
 00046312    pop         ebx
 00046313    ret
*}
end;

//00046314
procedure TWinControl.WndProc(var Message:TMessage);
begin
{*
 00046314    push        ebp
 00046315    mov         ebp,esp
 00046317    add         esp,0FFFFFEE0
 0004631D    push        ebx
 0004631E    push        esi
 0004631F    push        edi
 00046320    mov         esi,edx
 00046322    mov         ebx,eax
 00046324    mov         eax,dword ptr [esi]
 00046326    cmp         eax,84
>0004632B    jg          00046345
>0004632D    je          0004639F
 0004632F    sub         eax,7
>00046332    je          00046366
 00046334    dec         eax
>00046335    je          00046390
 00046337    sub         eax,17
>0004633A    je          00046420
>00046340    jmp         0004645E
 00046345    add         eax,0FFFFFF00
 0004634A    sub         eax,9
>0004634D    jb          0004640C
 00046353    add         eax,0FFFFFF09
 00046358    sub         eax,0B
>0004635B    jb          000463F6
>00046361    jmp         0004645E
 00046366    mov         eax,ebx
 00046368    call        GetParentForm
 0004636D    mov         edi,eax
 0004636F    test        edi,edi
>00046371    je          000464BE
 00046377    mov         edx,ebx
 00046379    mov         eax,edi
 0004637B    mov         ecx,dword ptr [eax]
 0004637D    call        dword ptr [ecx+0C8]
 00046383    test        al,al
>00046385    je          000464C7
>0004638B    jmp         000464BE
 00046390    test        byte ptr [ebx+44],20
>00046394    jne         000464C7
>0004639A    jmp         000464BE
 0004639F    mov         edx,esi
 000463A1    mov         eax,ebx
 000463A3    call        TControl.WndProc
 000463A8    cmp         dword ptr [esi+0C],0FFFFFFFF
>000463AC    jne         000464C7
 000463B2    lea         edx,[ebp-120]
 000463B8    mov         eax,dword ptr [esi+8]
 000463BB    call        SmallPointToPoint
 000463C0    lea         edx,[ebp-120]
 000463C6    lea         ecx,[ebp-118]
 000463CC    mov         eax,ebx
 000463CE    call        TControl.ScreenToClient
 000463D3    lea         edx,[ebp-118]
 000463D9    xor         ecx,ecx
 000463DB    mov         eax,ebx
 000463DD    call        TWinControl.ControlAtPos
 000463E2    test        eax,eax
>000463E4    je          000464C7
 000463EA    mov         dword ptr [esi+0C],1
>000463F1    jmp         000464C7
 000463F6    mov         edx,esi
 000463F8    mov         eax,ebx
 000463FA    call        TWinControl.IsControlMouseMsg
 000463FF    test        al,al
>00046401    jne         000464C7
>00046407    jmp         000464BE
 0004640C    mov         eax,ebx
 0004640E    call        TControl.Dragging
 00046413    test        al,al
>00046415    jne         000464C7
>0004641B    jmp         000464BE
 00046420    mov         eax,ebx
 00046422    call        TWinControl.GetHandle
 00046427    mov         edi,eax
 00046429    call        user32.GetCapture
 0004642E    cmp         edi,eax
>00046430    jne         000464BE
 00046436    cmp         dword ptr ds:[0B4838],0
>0004643D    je          000464BE
 0004643F    mov         eax,[000B4838]
 00046444    cmp         ebx,dword ptr [eax+24]
>00046447    jne         000464BE
 00046449    push        0
 0004644B    xor         ecx,ecx
 0004644D    mov         edx,1F
 00046452    mov         eax,[000B4838]
 00046457    call        TControl.Perform
>0004645C    jmp         000464BE
 0004645E    mov         eax,[000B672C]
 00046463    cmp         byte ptr [eax+20],0
>00046467    je          000464BE
 00046469    mov         eax,[000B672C]
 0004646E    cmp         dword ptr [eax+1C],0
>00046472    je          000464BE
 00046474    mov         eax,dword ptr [esi]
 00046476    mov         edx,dword ptr ds:[0B672C]
 0004647C    cmp         eax,dword ptr [edx+1C]
>0004647F    jne         000464BE
 00046481    lea         eax,[ebp-110]
 00046487    push        eax
 00046488    call        user32.GetKeyboardState
 0004648D    mov         eax,dword ptr [esi]
 0004648F    mov         dword ptr [ebp-10],eax
 00046492    lea         eax,[ebp-110]
 00046498    call        KeyboardStateToShiftState
 0004649D    mov         byte ptr [ebp-0C],al
 000464A0    mov         ax,word ptr [esi+4]
 000464A4    mov         word ptr [ebp-0A],ax
 000464A8    mov         eax,dword ptr [esi+8]
 000464AB    mov         dword ptr [ebp-8],eax
 000464AE    lea         edx,[ebp-10]
 000464B1    mov         eax,ebx
 000464B3    mov         bx,0FFB9
 000464B7    call        @CallDynaInst
>000464BC    jmp         000464C7
 000464BE    mov         edx,esi
 000464C0    mov         eax,ebx
 000464C2    call        TControl.WndProc
 000464C7    pop         edi
 000464C8    pop         esi
 000464C9    pop         ebx
 000464CA    mov         esp,ebp
 000464CC    pop         ebp
 000464CD    ret
*}
end;

//000464D0
procedure TWinControl.DefaultHandler(var Message:void );
begin
{*
 000464D0    push        ebx
 000464D1    push        esi
 000464D2    push        edi
 000464D3    push        ebp
 000464D4    mov         ebx,edx
 000464D6    mov         esi,eax
 000464D8    mov         ebp,dword ptr [esi+140]
 000464DE    test        ebp,ebp
>000464E0    je          0004658D
 000464E6    mov         edi,dword ptr [ebx]
 000464E8    mov         eax,edi
 000464EA    add         eax,0FFFFFECE
 000464EF    sub         eax,7
>000464F2    jb          00046500
 000464F4    add         eax,0FFFF4407
 000464F9    sub         eax,7
>000464FC    jb          0004651A
>000464FE    jmp         00046559
 00046500    mov         ebp,dword ptr [ebx+8]
 00046503    push        ebp
 00046504    mov         eax,dword ptr [ebx+4]
 00046507    push        eax
 00046508    add         edi,0BC00
 0004650E    push        edi
 0004650F    push        ebp
 00046510    call        user32.SendMessageA
 00046515    mov         dword ptr [ebx+0C],eax
>00046518    jmp         00046574
 0004651A    mov         eax,dword ptr [esi+58]
 0004651D    mov         eax,dword ptr [eax+14]
 00046520    call        ColorToRGB
 00046525    push        eax
 00046526    mov         eax,dword ptr [ebx+4]
 00046529    push        eax
 0004652A    call        gdi32.SetTextColor
 0004652F    mov         eax,dword ptr [esi+124]
 00046535    call        TBrush.GetColor
 0004653A    call        ColorToRGB
 0004653F    push        eax
 00046540    mov         eax,dword ptr [ebx+4]
 00046543    push        eax
 00046544    call        gdi32.SetBkColor
 00046549    mov         eax,dword ptr [esi+124]
 0004654F    call        TBrush.GetHandle
 00046554    mov         dword ptr [ebx+0C],eax
>00046557    jmp         00046574
 00046559    mov         eax,dword ptr [ebx+8]
 0004655C    push        eax
 0004655D    mov         eax,dword ptr [ebx+4]
 00046560    push        eax
 00046561    mov         eax,dword ptr [ebx]
 00046563    push        eax
 00046564    push        ebp
 00046565    mov         eax,dword ptr [esi+130]
 0004656B    push        eax
 0004656C    call        user32.CallWindowProcA
 00046571    mov         dword ptr [ebx+0C],eax
 00046574    mov         eax,dword ptr [ebx]
 00046576    cmp         eax,0C
>00046579    jne         00046596
 0004657B    mov         edx,dword ptr [ebx+8]
 0004657E    push        edx
 0004657F    mov         ecx,dword ptr [ebx+4]
 00046582    mov         edx,eax
 00046584    mov         eax,esi
 00046586    call        TControl.SendDockNotification
>0004658B    jmp         00046596
 0004658D    mov         edx,ebx
 0004658F    mov         eax,esi
 00046591    call        TControl.DefaultHandler
 00046596    pop         ebp
 00046597    pop         edi
 00046598    pop         esi
 00046599    pop         ebx
 0004659A    ret
*}
end;

//0004659C
function DoControlMsg(ControlHandle:HWND; var Message:void ):Boolean;
begin
{*
 0004659C    push        ebx
 0004659D    push        esi
 0004659E    push        edi
 0004659F    mov         esi,edx
 000465A1    xor         ebx,ebx
 000465A3    call        FindControl
 000465A8    mov         edi,eax
 000465AA    test        edi,edi
>000465AC    je          000465C9
 000465AE    mov         eax,dword ptr [esi+8]
 000465B1    push        eax
 000465B2    mov         ecx,dword ptr [esi+4]
 000465B5    mov         edx,dword ptr [esi]
 000465B7    add         edx,0BC00
 000465BD    mov         eax,edi
 000465BF    call        TControl.Perform
 000465C4    mov         dword ptr [esi+0C],eax
 000465C7    mov         bl,1
 000465C9    mov         eax,ebx
 000465CB    pop         edi
 000465CC    pop         esi
 000465CD    pop         ebx
 000465CE    ret
*}
end;

//000465D0
procedure TWinControl.PaintHandler(var Message:TWMPaint);
begin
{*
 000465D0    push        ebp
 000465D1    mov         ebp,esp
 000465D3    add         esp,0FFFFFFB0
 000465D6    push        ebx
 000465D7    push        esi
 000465D8    push        edi
 000465D9    mov         dword ptr [ebp-8],edx
 000465DC    mov         dword ptr [ebp-4],eax
 000465DF    mov         ebx,dword ptr [ebp-8]
 000465E2    mov         ebx,dword ptr [ebx+4]
 000465E5    test        ebx,ebx
>000465E7    jne         000465FD
 000465E9    lea         eax,[ebp-50]
 000465EC    push        eax
 000465ED    mov         eax,dword ptr [ebp-4]
 000465F0    call        TWinControl.GetHandle
 000465F5    push        eax
 000465F6    call        user32.BeginPaint
 000465FB    mov         ebx,eax
 000465FD    xor         edx,edx
 000465FF    push        ebp
 00046600    push        466F0
 00046605    push        dword ptr fs:[edx]
 00046608    mov         dword ptr fs:[edx],esp
 0004660B    mov         eax,dword ptr [ebp-4]
 0004660E    cmp         dword ptr [eax+128],0
>00046615    jne         00046629
 00046617    mov         edx,ebx
 00046619    mov         eax,dword ptr [ebp-4]
 0004661C    mov         ecx,dword ptr [eax]
 0004661E    call        dword ptr [ecx+0AC]
>00046624    jmp         000466BB
 00046629    push        ebx
 0004662A    call        gdi32.SaveDC
 0004662F    mov         dword ptr [ebp-10],eax
 00046632    mov         dword ptr [ebp-0C],2
 00046639    mov         eax,dword ptr [ebp-4]
 0004663C    mov         eax,dword ptr [eax+128]
 00046642    mov         edi,dword ptr [eax+8]
 00046645    dec         edi
 00046646    test        edi,edi
>00046648    jl          0004669E
 0004664A    inc         edi
 0004664B    xor         esi,esi
 0004664D    mov         eax,dword ptr [ebp-4]
 00046650    mov         eax,dword ptr [eax+128]
 00046656    mov         edx,esi
 00046658    call        TList.Get
 0004665D    cmp         byte ptr [eax+47],0
>00046661    jne         0004666F
 00046663    test        byte ptr [eax+20],10
>00046667    je          0004669A
 00046669    test        byte ptr [eax+41],4
>0004666D    jne         0004669A
 0004666F    test        byte ptr [eax+40],40
>00046673    je          0004669A
 00046675    mov         edx,dword ptr [eax+34]
 00046678    add         edx,dword ptr [eax+3C]
 0004667B    push        edx
 0004667C    mov         edx,dword ptr [eax+30]
 0004667F    add         edx,dword ptr [eax+38]
 00046682    push        edx
 00046683    mov         edx,dword ptr [eax+34]
 00046686    push        edx
 00046687    mov         eax,dword ptr [eax+30]
 0004668A    push        eax
 0004668B    push        ebx
 0004668C    call        gdi32.ExcludeClipRect
 00046691    mov         dword ptr [ebp-0C],eax
 00046694    cmp         dword ptr [ebp-0C],1
>00046698    je          0004669E
 0004669A    inc         esi
 0004669B    dec         edi
>0004669C    jne         0004664D
 0004669E    cmp         dword ptr [ebp-0C],1
>000466A2    je          000466B1
 000466A4    mov         edx,ebx
 000466A6    mov         eax,dword ptr [ebp-4]
 000466A9    mov         ecx,dword ptr [eax]
 000466AB    call        dword ptr [ecx+0AC]
 000466B1    mov         eax,dword ptr [ebp-10]
 000466B4    push        eax
 000466B5    push        ebx
 000466B6    call        gdi32.RestoreDC
 000466BB    xor         ecx,ecx
 000466BD    mov         edx,ebx
 000466BF    mov         eax,dword ptr [ebp-4]
 000466C2    call        TWinControl.PaintControls
 000466C7    xor         eax,eax
 000466C9    pop         edx
 000466CA    pop         ecx
 000466CB    pop         ecx
 000466CC    mov         dword ptr fs:[eax],edx
 000466CF    push        466F7
 000466D4    mov         eax,dword ptr [ebp-8]
 000466D7    cmp         dword ptr [eax+4],0
>000466DB    jne         000466EF
 000466DD    lea         eax,[ebp-50]
 000466E0    push        eax
 000466E1    mov         eax,dword ptr [ebp-4]
 000466E4    call        TWinControl.GetHandle
 000466E9    push        eax
 000466EA    call        user32.EndPaint
 000466EF    ret
>000466F0    jmp         @HandleFinally
>000466F5    jmp         000466D4
 000466F7    pop         edi
 000466F8    pop         esi
 000466F9    pop         ebx
 000466FA    mov         esp,ebp
 000466FC    pop         ebp
 000466FD    ret
*}
end;

//00046700
procedure TWinControl.PaintWindow(DC:HDC);
begin
{*
 00046700    add         esp,0FFFFFFF0
 00046703    mov         dword ptr [esp],0F
 0004670A    mov         dword ptr [esp+4],edx
 0004670E    xor         edx,edx
 00046710    mov         dword ptr [esp+8],edx
 00046714    xor         edx,edx
 00046716    mov         dword ptr [esp+0C],edx
 0004671A    mov         edx,esp
 0004671C    mov         ecx,dword ptr [eax]
 0004671E    call        dword ptr [ecx-10]
 00046721    add         esp,10
 00046724    ret
*}
end;

//00046728
procedure TWinControl.PaintControls(DC:HDC; First:TControl);
begin
{*
 00046728    push        ebx
 00046729    push        esi
 0004672A    push        edi
 0004672B    push        ebp
 0004672C    add         esp,0FFFFFFE0
 0004672F    mov         ebx,ecx
 00046731    mov         ebp,edx
 00046733    mov         esi,eax
 00046735    cmp         byte ptr [esi+138],0
>0004673C    je          0004675D
 0004673E    cmp         byte ptr [esi+180],0
>00046745    je          0004675D
 00046747    cmp         dword ptr [esi+13C],0
>0004674E    je          0004675D
 00046750    mov         eax,dword ptr [esi+13C]
 00046756    mov         edx,ebp
 00046758    mov         ecx,dword ptr [eax]
 0004675A    call        dword ptr [ecx+20]
 0004675D    mov         eax,dword ptr [esi+128]
 00046763    test        eax,eax
>00046765    je          0004684A
 0004676B    xor         edi,edi
 0004676D    test        ebx,ebx
>0004676F    je          00046780
 00046771    mov         edx,ebx
 00046773    call        TList.IndexOf
 00046778    mov         edi,eax
 0004677A    test        edi,edi
>0004677C    jge         00046780
 0004677E    xor         edi,edi
 00046780    mov         eax,dword ptr [esi+128]
 00046786    mov         eax,dword ptr [eax+8]
 00046789    mov         dword ptr [esp],eax
 0004678C    cmp         edi,dword ptr [esp]
>0004678F    jge         0004684A
 00046795    mov         eax,dword ptr [esi+128]
 0004679B    mov         edx,edi
 0004679D    call        TList.Get
 000467A2    mov         ebx,eax
 000467A4    cmp         byte ptr [ebx+47],0
>000467A8    jne         000467BE
 000467AA    test        byte ptr [ebx+20],10
>000467AE    je          00046840
 000467B4    test        byte ptr [ebx+41],4
>000467B8    jne         00046840
 000467BE    mov         eax,dword ptr [ebx+34]
 000467C1    add         eax,dword ptr [ebx+3C]
 000467C4    push        eax
 000467C5    lea         eax,[esp+14]
 000467C9    push        eax
 000467CA    mov         ecx,dword ptr [ebx+30]
 000467CD    add         ecx,dword ptr [ebx+38]
 000467D0    mov         edx,dword ptr [ebx+34]
 000467D3    mov         eax,dword ptr [ebx+30]
 000467D6    call        Rect
 000467DB    lea         eax,[esp+10]
 000467DF    push        eax
 000467E0    push        ebp
 000467E1    call        gdi32.RectVisible
 000467E6    test        eax,eax
>000467E8    je          00046840
 000467EA    test        byte ptr [esi+44],80
>000467EE    je          000467F6
 000467F0    or          word ptr [ebx+44],80
 000467F6    push        ebp
 000467F7    call        gdi32.SaveDC
 000467FC    mov         dword ptr [esp+4],eax
 00046800    mov         ecx,dword ptr [ebx+34]
 00046803    mov         edx,dword ptr [ebx+30]
 00046806    mov         eax,ebp
 00046808    call        MoveWindowOrg
 0004680D    mov         eax,dword ptr [ebx+3C]
 00046810    push        eax
 00046811    mov         eax,dword ptr [ebx+38]
 00046814    push        eax
 00046815    push        0
 00046817    push        0
 00046819    push        ebp
 0004681A    call        gdi32.IntersectClipRect
 0004681F    push        0
 00046821    mov         ecx,ebp
 00046823    mov         edx,0F
 00046828    mov         eax,ebx
 0004682A    call        TControl.Perform
 0004682F    mov         eax,dword ptr [esp+4]
 00046833    push        eax
 00046834    push        ebp
 00046835    call        gdi32.RestoreDC
 0004683A    and         word ptr [ebx+44],0FF7F
 00046840    inc         edi
 00046841    cmp         edi,dword ptr [esp]
>00046844    jl          00046795
 0004684A    mov         eax,dword ptr [esi+184]
 00046850    test        eax,eax
>00046852    je          00046950
 00046858    mov         eax,dword ptr [eax+8]
 0004685B    dec         eax
 0004685C    test        eax,eax
>0004685E    jl          00046950
 00046864    inc         eax
 00046865    mov         dword ptr [esp+0C],eax
 00046869    xor         edi,edi
 0004686B    mov         eax,dword ptr [esi+184]
 00046871    mov         edx,edi
 00046873    call        TList.Get
 00046878    mov         ebx,eax
 0004687A    cmp         byte ptr [ebx+12C],0
>00046881    je          00046945
 00046887    test        byte ptr [ebx+40],10
>0004688B    je          00046945
 00046891    cmp         byte ptr [ebx+47],0
>00046895    jne         000468AB
 00046897    test        byte ptr [ebx+20],10
>0004689B    je          00046945
 000468A1    test        byte ptr [ebx+41],4
>000468A5    jne         00046945
 000468AB    mov         eax,80000010
 000468B0    call        ColorToRGB
 000468B5    push        eax
 000468B6    call        gdi32.CreateSolidBrush
 000468BB    mov         dword ptr [esp+8],eax
 000468BF    mov         eax,dword ptr [esp+8]
 000468C3    push        eax
 000468C4    mov         eax,dword ptr [ebx+34]
 000468C7    add         eax,dword ptr [ebx+3C]
 000468CA    push        eax
 000468CB    lea         eax,[esp+18]
 000468CF    push        eax
 000468D0    mov         ecx,dword ptr [ebx+30]
 000468D3    add         ecx,dword ptr [ebx+38]
 000468D6    mov         edx,dword ptr [ebx+34]
 000468D9    dec         edx
 000468DA    mov         eax,dword ptr [ebx+30]
 000468DD    dec         eax
 000468DE    call        Rect
 000468E3    lea         eax,[esp+14]
 000468E7    push        eax
 000468E8    push        ebp
 000468E9    call        user32.FrameRect
 000468EE    mov         eax,dword ptr [esp+8]
 000468F2    push        eax
 000468F3    call        gdi32.DeleteObject
 000468F8    mov         eax,80000014
 000468FD    call        ColorToRGB
 00046902    push        eax
 00046903    call        gdi32.CreateSolidBrush
 00046908    mov         dword ptr [esp+8],eax
 0004690C    mov         eax,dword ptr [esp+8]
 00046910    push        eax
 00046911    mov         eax,dword ptr [ebx+34]
 00046914    add         eax,dword ptr [ebx+3C]
 00046917    inc         eax
 00046918    push        eax
 00046919    lea         eax,[esp+18]
 0004691D    push        eax
 0004691E    mov         ecx,dword ptr [ebx+30]
 00046921    add         ecx,dword ptr [ebx+38]
 00046924    inc         ecx
 00046925    mov         edx,dword ptr [ebx+34]
 00046928    mov         eax,dword ptr [ebx+30]
 0004692B    call        Rect
 00046930    lea         eax,[esp+14]
 00046934    push        eax
 00046935    push        ebp
 00046936    call        user32.FrameRect
 0004693B    mov         eax,dword ptr [esp+8]
 0004693F    push        eax
 00046940    call        gdi32.DeleteObject
 00046945    inc         edi
 00046946    dec         dword ptr [esp+0C]
>0004694A    jne         0004686B
 00046950    add         esp,20
 00046953    pop         ebp
 00046954    pop         edi
 00046955    pop         esi
 00046956    pop         ebx
 00046957    ret
*}
end;

//00046958
procedure TWinControl.WMPaint(var Message:TWMPaint);
begin
{*
 00046958    push        ebp
 00046959    mov         ebp,esp
 0004695B    add         esp,0FFFFFF94
 0004695E    push        ebx
 0004695F    push        esi
 00046960    push        edi
 00046961    mov         esi,edx
 00046963    mov         ebx,eax
 00046965    cmp         byte ptr [ebx+1E8],0
>0004696C    je          00046974
 0004696E    cmp         dword ptr [esi+4],0
>00046972    je          000469A1
 00046974    test        byte ptr [ebx+45],1
>00046978    jne         00046993
 0004697A    mov         eax,ebx
 0004697C    call        TWinControl.GetControlCount
 00046981    test        eax,eax
>00046983    jne         00046993
 00046985    mov         edx,esi
 00046987    mov         eax,ebx
 00046989    mov         ecx,dword ptr [eax]
 0004698B    call        dword ptr [ecx-10]
>0004698E    jmp         00046AB1
 00046993    mov         edx,esi
 00046995    mov         eax,ebx
 00046997    call        TWinControl.PaintHandler
>0004699C    jmp         00046AB1
 000469A1    push        0
 000469A3    call        user32.GetDC
 000469A8    mov         edi,eax
 000469AA    lea         edx,[ebp-5C]
 000469AD    mov         eax,ebx
 000469AF    mov         ecx,dword ptr [eax]
 000469B1    call        dword ptr [ecx+44]
 000469B4    mov         eax,dword ptr [ebp-50]
 000469B7    push        eax
 000469B8    lea         edx,[ebp-6C]
 000469BB    mov         eax,ebx
 000469BD    mov         ecx,dword ptr [eax]
 000469BF    call        dword ptr [ecx+44]
 000469C2    mov         eax,dword ptr [ebp-64]
 000469C5    push        eax
 000469C6    push        edi
 000469C7    call        gdi32.CreateCompatibleBitmap
 000469CC    mov         dword ptr [ebp-8],eax
 000469CF    push        edi
 000469D0    push        0
 000469D2    call        user32.ReleaseDC
 000469D7    push        0
 000469D9    call        gdi32.CreateCompatibleDC
 000469DE    mov         dword ptr [ebp-4],eax
 000469E1    mov         eax,dword ptr [ebp-8]
 000469E4    push        eax
 000469E5    mov         eax,dword ptr [ebp-4]
 000469E8    push        eax
 000469E9    call        gdi32.SelectObject
 000469EE    mov         dword ptr [ebp-0C],eax
 000469F1    xor         eax,eax
 000469F3    push        ebp
 000469F4    push        46AAA
 000469F9    push        dword ptr fs:[eax]
 000469FC    mov         dword ptr fs:[eax],esp
 000469FF    lea         eax,[ebp-4C]
 00046A02    push        eax
 00046A03    mov         eax,ebx
 00046A05    call        TWinControl.GetHandle
 00046A0A    push        eax
 00046A0B    call        user32.BeginPaint
 00046A10    mov         edi,eax
 00046A12    mov         eax,dword ptr [ebp-4]
 00046A15    push        eax
 00046A16    mov         ecx,dword ptr [ebp-4]
 00046A19    mov         edx,14
 00046A1E    mov         eax,ebx
 00046A20    call        TControl.Perform
 00046A25    mov         eax,dword ptr [ebp-4]
 00046A28    mov         dword ptr [esi+4],eax
 00046A2B    mov         edx,esi
 00046A2D    mov         eax,ebx
 00046A2F    call        TWinControl.WMPaint
 00046A34    xor         eax,eax
 00046A36    mov         dword ptr [esi+4],eax
 00046A39    push        0CC0020
 00046A3E    push        0
 00046A40    push        0
 00046A42    mov         eax,dword ptr [ebp-4]
 00046A45    push        eax
 00046A46    lea         edx,[ebp-5C]
 00046A49    mov         eax,ebx
 00046A4B    mov         ecx,dword ptr [eax]
 00046A4D    call        dword ptr [ecx+44]
 00046A50    mov         eax,dword ptr [ebp-50]
 00046A53    push        eax
 00046A54    lea         edx,[ebp-6C]
 00046A57    mov         eax,ebx
 00046A59    mov         ecx,dword ptr [eax]
 00046A5B    call        dword ptr [ecx+44]
 00046A5E    mov         eax,dword ptr [ebp-64]
 00046A61    push        eax
 00046A62    push        0
 00046A64    push        0
 00046A66    push        edi
 00046A67    call        gdi32.BitBlt
 00046A6C    lea         eax,[ebp-4C]
 00046A6F    push        eax
 00046A70    mov         eax,ebx
 00046A72    call        TWinControl.GetHandle
 00046A77    push        eax
 00046A78    call        user32.EndPaint
 00046A7D    xor         eax,eax
 00046A7F    pop         edx
 00046A80    pop         ecx
 00046A81    pop         ecx
 00046A82    mov         dword ptr fs:[eax],edx
 00046A85    push        46AB1
 00046A8A    mov         eax,dword ptr [ebp-0C]
 00046A8D    push        eax
 00046A8E    mov         eax,dword ptr [ebp-4]
 00046A91    push        eax
 00046A92    call        gdi32.SelectObject
 00046A97    mov         eax,dword ptr [ebp-4]
 00046A9A    push        eax
 00046A9B    call        gdi32.DeleteDC
 00046AA0    mov         eax,dword ptr [ebp-8]
 00046AA3    push        eax
 00046AA4    call        gdi32.DeleteObject
 00046AA9    ret
>00046AAA    jmp         @HandleFinally
>00046AAF    jmp         00046A8A
 00046AB1    pop         edi
 00046AB2    pop         esi
 00046AB3    pop         ebx
 00046AB4    mov         esp,ebp
 00046AB6    pop         ebp
 00046AB7    ret
*}
end;

//00046AB8
procedure TWinControl.WMCharToItem(var Message:TWMCharToItem);
begin
{*
 00046AB8    push        ebx
 00046AB9    push        esi
 00046ABA    mov         ebx,edx
 00046ABC    mov         esi,eax
 00046ABE    mov         edx,ebx
 00046AC0    mov         eax,dword ptr [ebx+8]
 00046AC3    call        DoControlMsg
 00046AC8    test        al,al
>00046ACA    jne         00046AD5
 00046ACC    mov         edx,ebx
 00046ACE    mov         eax,esi
 00046AD0    mov         ecx,dword ptr [eax]
 00046AD2    call        dword ptr [ecx-10]
 00046AD5    pop         esi
 00046AD6    pop         ebx
 00046AD7    ret
*}
end;

//00046AD8
procedure TWinControl.WMNotify(var Message:TWMNotify);
begin
{*
 00046AD8    push        ebx
 00046AD9    push        esi
 00046ADA    mov         ebx,edx
 00046ADC    mov         esi,eax
 00046ADE    mov         edx,ebx
 00046AE0    mov         eax,dword ptr [ebx+8]
 00046AE3    mov         eax,dword ptr [eax]
 00046AE5    call        DoControlMsg
 00046AEA    test        al,al
>00046AEC    jne         00046AF7
 00046AEE    mov         edx,ebx
 00046AF0    mov         eax,esi
 00046AF2    mov         ecx,dword ptr [eax]
 00046AF4    call        dword ptr [ecx-10]
 00046AF7    pop         esi
 00046AF8    pop         ebx
 00046AF9    ret
*}
end;

//00046AFC
procedure TWinControl.WMSysColorChange(var Message:TWMSysColorChange);
begin
{*
 00046AFC    push        ebx
 00046AFD    mov         ebx,eax
 00046AFF    call        PaletteChanged
 00046B04    push        0
 00046B06    xor         ecx,ecx
 00046B08    mov         edx,0B024
 00046B0D    mov         eax,ebx
 00046B0F    call        TControl.Perform
 00046B14    pop         ebx
 00046B15    ret
*}
end;

//00046B18
procedure TWinControl.WMWinIniChange(var Message:TMessage);
begin
{*
 00046B18    mov         ecx,dword ptr [edx+8]
 00046B1B    push        ecx
 00046B1C    mov         ecx,dword ptr [edx+4]
 00046B1F    mov         edx,0B025
 00046B24    call        TControl.Perform
 00046B29    ret
*}
end;

//00046B2C
procedure TWinControl.WMFontChange(var Message:TMessage);
begin
{*
 00046B2C    push        0
 00046B2E    xor         ecx,ecx
 00046B30    mov         edx,0B026
 00046B35    call        TControl.Perform
 00046B3A    ret
*}
end;

//00046B3C
procedure TWinControl.WMTimeChange(var Message:TMessage);
begin
{*
 00046B3C    push        0
 00046B3E    xor         ecx,ecx
 00046B40    mov         edx,0B027
 00046B45    call        TControl.Perform
 00046B4A    ret
*}
end;

//00046B4C
procedure TWinControl.WMCommand(var Message:TWMCommand);
begin
{*
 00046B4C    push        ebx
 00046B4D    push        esi
 00046B4E    mov         ebx,edx
 00046B50    mov         esi,eax
 00046B52    mov         edx,ebx
 00046B54    mov         eax,dword ptr [ebx+8]
 00046B57    call        DoControlMsg
 00046B5C    test        al,al
>00046B5E    jne         00046B69
 00046B60    mov         edx,ebx
 00046B62    mov         eax,esi
 00046B64    mov         ecx,dword ptr [eax]
 00046B66    call        dword ptr [ecx-10]
 00046B69    pop         esi
 00046B6A    pop         ebx
 00046B6B    ret
*}
end;

//00046B6C
procedure TWinControl.WMHScroll(var Message:TWMHScroll);
begin
{*
 00046B6C    push        ebx
 00046B6D    push        esi
 00046B6E    mov         ebx,edx
 00046B70    mov         esi,eax
 00046B72    mov         edx,ebx
 00046B74    mov         eax,dword ptr [ebx+8]
 00046B77    call        DoControlMsg
 00046B7C    test        al,al
>00046B7E    jne         00046B89
 00046B80    mov         edx,ebx
 00046B82    mov         eax,esi
 00046B84    mov         ecx,dword ptr [eax]
 00046B86    call        dword ptr [ecx-10]
 00046B89    pop         esi
 00046B8A    pop         ebx
 00046B8B    ret
*}
end;

//00046B8C
procedure TWinControl.WMCompareItem(var Message:TWMCompareItem);
begin
{*
 00046B8C    push        ebx
 00046B8D    push        esi
 00046B8E    mov         ebx,edx
 00046B90    mov         esi,eax
 00046B92    mov         edx,ebx
 00046B94    mov         eax,dword ptr [ebx+8]
 00046B97    mov         eax,dword ptr [eax+4]
 00046B9A    call        DoControlMsg
 00046B9F    test        al,al
>00046BA1    jne         00046BAC
 00046BA3    mov         edx,ebx
 00046BA5    mov         eax,esi
 00046BA7    mov         ecx,dword ptr [eax]
 00046BA9    call        dword ptr [ecx-10]
 00046BAC    pop         esi
 00046BAD    pop         ebx
 00046BAE    ret
*}
end;

//00046BB0
procedure TWinControl.WMDeleteItem(var Message:TWMDeleteItem);
begin
{*
 00046BB0    push        ebx
 00046BB1    push        esi
 00046BB2    mov         ebx,edx
 00046BB4    mov         esi,eax
 00046BB6    mov         edx,ebx
 00046BB8    mov         eax,dword ptr [ebx+8]
 00046BBB    mov         eax,dword ptr [eax+4]
 00046BBE    call        DoControlMsg
 00046BC3    test        al,al
>00046BC5    jne         00046BD0
 00046BC7    mov         edx,ebx
 00046BC9    mov         eax,esi
 00046BCB    mov         ecx,dword ptr [eax]
 00046BCD    call        dword ptr [ecx-10]
 00046BD0    pop         esi
 00046BD1    pop         ebx
 00046BD2    ret
*}
end;

//00046BD4
procedure TWinControl.WMDrawItem(var Message:TWMDrawItem);
begin
{*
 00046BD4    push        ebx
 00046BD5    push        esi
 00046BD6    mov         ebx,edx
 00046BD8    mov         esi,eax
 00046BDA    mov         edx,ebx
 00046BDC    mov         eax,dword ptr [ebx+8]
 00046BDF    mov         eax,dword ptr [eax+4]
 00046BE2    call        DoControlMsg
 00046BE7    test        al,al
>00046BE9    jne         00046BF4
 00046BEB    mov         edx,ebx
 00046BED    mov         eax,esi
 00046BEF    mov         ecx,dword ptr [eax]
 00046BF1    call        dword ptr [ecx-10]
 00046BF4    pop         esi
 00046BF5    pop         ebx
 00046BF6    ret
*}
end;

//00046BF8
procedure TWinControl.WMMeasureItem(var Message:TWMMeasureItem);
begin
{*
 00046BF8    push        ebx
 00046BF9    push        esi
 00046BFA    mov         ebx,edx
 00046BFC    mov         esi,eax
 00046BFE    mov         edx,ebx
 00046C00    mov         eax,dword ptr [ebx+8]
 00046C03    mov         eax,dword ptr [eax+4]
 00046C06    call        DoControlMsg
 00046C0B    test        al,al
>00046C0D    jne         00046C18
 00046C0F    mov         edx,ebx
 00046C11    mov         eax,esi
 00046C13    mov         ecx,dword ptr [eax]
 00046C15    call        dword ptr [ecx-10]
 00046C18    pop         esi
 00046C19    pop         ebx
 00046C1A    ret
*}
end;

//00046C1C
procedure TWinControl.WMEraseBkgnd(var Message:TWMEraseBkgnd);
begin
{*
 00046C1C    push        ebx
 00046C1D    push        esi
 00046C1E    add         esp,0FFFFFFF0
 00046C21    mov         ebx,edx
 00046C23    mov         esi,eax
 00046C25    cmp         byte ptr [esi+1E8],0
>00046C2C    je          00046C36
 00046C2E    mov         eax,dword ptr [ebx+4]
 00046C31    cmp         eax,dword ptr [ebx+8]
>00046C34    jne         00046C5B
 00046C36    mov         eax,dword ptr [esi+124]
 00046C3C    call        TBrush.GetHandle
 00046C41    push        eax
 00046C42    lea         edx,[esp+4]
 00046C46    mov         eax,esi
 00046C48    mov         ecx,dword ptr [eax]
 00046C4A    call        dword ptr [ecx+44]
 00046C4D    lea         eax,[esp+4]
 00046C51    push        eax
 00046C52    mov         eax,dword ptr [ebx+4]
 00046C55    push        eax
 00046C56    call        user32.FillRect
 00046C5B    mov         dword ptr [ebx+0C],1
 00046C62    add         esp,10
 00046C65    pop         esi
 00046C66    pop         ebx
 00046C67    ret
*}
end;

//00046C68
procedure TWinControl.WMWindowPosChanged(var Message:TWMWindowPosChanged);
begin
{*
 00046C68    push        ebx
 00046C69    push        esi
 00046C6A    push        edi
 00046C6B    push        ecx
 00046C6C    mov         esi,edx
 00046C6E    mov         edi,eax
 00046C70    cmp         byte ptr [edi+12C],0
>00046C77    je          00046C8E
 00046C79    test        byte ptr [edi+40],10
>00046C7D    je          00046C8E
 00046C7F    cmp         dword ptr [edi+24],0
>00046C83    je          00046C8E
 00046C85    mov         eax,dword ptr [esi+8]
 00046C88    test        byte ptr [eax+18],8
>00046C8C    je          00046C92
 00046C8E    xor         ebx,ebx
>00046C90    jmp         00046C94
 00046C92    mov         bl,1
 00046C94    mov         eax,dword ptr [esi+8]
 00046C97    test        byte ptr [eax+18],2
>00046C9B    jne         00046CAD
 00046C9D    mov         eax,dword ptr [edi+140]
 00046CA3    push        eax
 00046CA4    call        user32.IsWindowVisible
 00046CA9    test        eax,eax
>00046CAB    jne         00046CB1
 00046CAD    xor         eax,eax
>00046CAF    jmp         00046CB3
 00046CB1    mov         al,1
 00046CB3    mov         byte ptr [esp],al
 00046CB6    mov         eax,dword ptr [esi+8]
 00046CB9    test        byte ptr [eax+18],1
>00046CBD    jne         00046CCF
 00046CBF    mov         eax,dword ptr [edi+140]
 00046CC5    push        eax
 00046CC6    call        user32.IsWindowVisible
 00046CCB    test        eax,eax
>00046CCD    jne         00046CD3
 00046CCF    xor         eax,eax
>00046CD1    jmp         00046CD5
 00046CD3    mov         al,1
 00046CD5    mov         byte ptr [esp+1],al
 00046CD9    test        bl,bl
>00046CDB    je          00046CED
 00046CDD    mov         al,byte ptr [esp]
 00046CE0    or          al,byte ptr [esp+1]
>00046CE4    je          00046CED
 00046CE6    mov         eax,edi
 00046CE8    call        TWinControl.InvalidateFrame
 00046CED    test        byte ptr [edi+45],2
>00046CF1    jne         00046CFA
 00046CF3    mov         eax,edi
 00046CF5    call        TWinControl.UpdateBounds
 00046CFA    mov         edx,esi
 00046CFC    mov         eax,edi
 00046CFE    call        TControl.WMWindowPosChanged
 00046D03    test        bl,bl
>00046D05    je          00046D20
 00046D07    mov         al,byte ptr [esp]
 00046D0A    or          al,byte ptr [esp+1]
>00046D0E    jne         00046D19
 00046D10    mov         eax,dword ptr [esi+8]
 00046D13    test        byte ptr [eax+18],0C0
>00046D17    je          00046D20
 00046D19    mov         eax,edi
 00046D1B    call        TWinControl.InvalidateFrame
 00046D20    pop         edx
 00046D21    pop         edi
 00046D22    pop         esi
 00046D23    pop         ebx
 00046D24    ret
*}
end;

//00046D28
procedure TWinControl.WMWindowPosChanging(var Message:TWMWindowPosChanging);
begin
{*
 00046D28    push        ebx
 00046D29    push        esi
 00046D2A    push        edi
 00046D2B    mov         edi,edx
 00046D2D    mov         ebx,eax
 00046D2F    mov         al,[00046D6C]
 00046D34    and         al,byte ptr [ebx+20]
 00046D37    mov         dl,byte ptr ds:[46D70]
 00046D3D    cmp         dl,al
>00046D3F    jne         00046D5F
 00046D41    mov         esi,dword ptr [edi+8]
 00046D44    test        byte ptr [esi+18],1
>00046D48    jne         00046D5F
 00046D4A    lea         ecx,[esi+14]
 00046D4D    lea         edx,[esi+10]
 00046D50    mov         eax,ebx
 00046D52    call        TControl.CheckNewSize
 00046D57    test        al,al
>00046D59    jne         00046D5F
 00046D5B    or          dword ptr [esi+18],1
 00046D5F    mov         edx,edi
 00046D61    mov         eax,ebx
 00046D63    mov         ecx,dword ptr [eax]
 00046D65    call        dword ptr [ecx-10]
 00046D68    pop         edi
 00046D69    pop         esi
 00046D6A    pop         ebx
 00046D6B    ret
*}
end;

//00046D74
procedure TWinControl.WMSize(var Message:TWMSize);
begin
{*
 00046D74    push        ebx
 00046D75    push        esi
 00046D76    mov         esi,edx
 00046D78    mov         ebx,eax
 00046D7A    mov         eax,ebx
 00046D7C    call        TWinControl.UpdateBounds
 00046D81    mov         edx,esi
 00046D83    mov         eax,ebx
 00046D85    mov         ecx,dword ptr [eax]
 00046D87    call        dword ptr [ecx-10]
 00046D8A    mov         eax,ebx
 00046D8C    call        TWinControl.Realign
 00046D91    test        byte ptr [ebx+20],1
>00046D95    jne         00046DA2
 00046D97    mov         eax,ebx
 00046D99    mov         bx,0FFD5
 00046D9D    call        @CallDynaInst
 00046DA2    pop         esi
 00046DA3    pop         ebx
 00046DA4    ret
*}
end;

//00046DA8
procedure TWinControl.WMMove(var Message:TWMMove);
begin
{*
 00046DA8    push        esi
 00046DA9    mov         esi,eax
 00046DAB    mov         eax,esi
 00046DAD    mov         ecx,dword ptr [eax]
 00046DAF    call        dword ptr [ecx-10]
 00046DB2    mov         eax,esi
 00046DB4    call        TWinControl.UpdateBounds
 00046DB9    pop         esi
 00046DBA    ret
*}
end;

//00046DBC
procedure TWinControl.WMSetCursor(var Message:TWMSetCursor);
begin
{*
 00046DBC    push        ebx
 00046DBD    push        esi
 00046DBE    push        edi
 00046DBF    add         esp,0FFFFFFF0
 00046DC2    mov         esi,edx
 00046DC4    mov         ebx,eax
 00046DC6    mov         eax,dword ptr [esi+4]
 00046DC9    cmp         eax,dword ptr [ebx+140]
>00046DCF    jne         00046E97
 00046DD5    mov         ax,word ptr [esi+8]
 00046DD9    sub         ax,0FFFFFFFE
>00046DDD    je          00046E59
 00046DDF    sub         ax,3
>00046DE3    jne         00046E97
 00046DE9    test        byte ptr [ebx+20],10
>00046DED    je          00046DF5
 00046DEF    mov         di,0FFFE
>00046DF3    jmp         00046E36
 00046DF5    mov         eax,[000B5BDC];^Screen:TScreen
 00046DFA    mov         eax,dword ptr [eax]
 00046DFC    mov         di,word ptr [eax+38]
 00046E00    test        di,di
>00046E03    jne         00046E36
 00046E05    push        esp
 00046E06    call        user32.GetCursorPos
 00046E0B    lea         ecx,[esp+8]
 00046E0F    mov         edx,esp
 00046E11    mov         eax,ebx
 00046E13    call        TControl.ScreenToClient
 00046E18    lea         edx,[esp+8]
 00046E1C    xor         ecx,ecx
 00046E1E    mov         eax,ebx
 00046E20    call        TWinControl.ControlAtPos
 00046E25    test        eax,eax
>00046E27    je          00046E2D
 00046E29    mov         di,word ptr [eax+6C]
 00046E2D    test        di,di
>00046E30    jne         00046E36
 00046E32    mov         di,word ptr [ebx+6C]
 00046E36    test        di,di
>00046E39    je          00046E97
 00046E3B    movsx       edx,di
 00046E3E    mov         eax,[000B5BDC];^Screen:TScreen
 00046E43    mov         eax,dword ptr [eax]
 00046E45    call        TScreen.GetCursors
 00046E4A    push        eax
 00046E4B    call        user32.SetCursor
 00046E50    mov         dword ptr [esi+0C],1
>00046E57    jmp         00046EA0
 00046E59    cmp         word ptr [esi+0A],201
>00046E5F    jne         00046E97
 00046E61    mov         eax,[000B59E8];^Application:TApplication
 00046E66    mov         eax,dword ptr [eax]
 00046E68    cmp         dword ptr [eax+24],0
>00046E6C    je          00046E97
 00046E6E    mov         eax,[000B59E8];^Application:TApplication
 00046E73    mov         eax,dword ptr [eax]
 00046E75    mov         eax,dword ptr [eax+24]
 00046E78    push        eax
 00046E79    call        user32.GetLastActivePopup
 00046E7E    mov         edi,eax
 00046E80    call        user32.GetForegroundWindow
 00046E85    cmp         edi,eax
>00046E87    je          00046E97
 00046E89    mov         eax,[000B59E8];^Application:TApplication
 00046E8E    mov         eax,dword ptr [eax]
 00046E90    call        TApplication.BringToFront
>00046E95    jmp         00046EA0
 00046E97    mov         edx,esi
 00046E99    mov         eax,ebx
 00046E9B    mov         ecx,dword ptr [eax]
 00046E9D    call        dword ptr [ecx-10]
 00046EA0    add         esp,10
 00046EA3    pop         edi
 00046EA4    pop         esi
 00046EA5    pop         ebx
 00046EA6    ret
*}
end;

//00046EA8
procedure TWinControl.WMSetFocus(var Message:TWMSetFocus);
begin
{*
 00046EA8    push        esi
 00046EA9    mov         esi,eax
 00046EAB    mov         eax,esi
 00046EAD    mov         ecx,dword ptr [eax]
 00046EAF    call        dword ptr [ecx-10]
 00046EB2    mov         eax,esi
 00046EB4    call        TWinControl.SetIme
 00046EB9    pop         esi
 00046EBA    ret
*}
end;

//00046EBC
procedure TWinControl.WMKillFocus(var Message:TWMSetFocus);
begin
{*
 00046EBC    push        esi
 00046EBD    mov         esi,eax
 00046EBF    mov         eax,esi
 00046EC1    mov         ecx,dword ptr [eax]
 00046EC3    call        dword ptr [ecx-10]
 00046EC6    mov         eax,esi
 00046EC8    call        TWinControl.ResetIme
 00046ECD    pop         esi
 00046ECE    ret
*}
end;

//00046ED0
procedure TWinControl.WMIMEStartComp(var Message:TMessage);
begin
{*
 00046ED0    push        esi
 00046ED1    mov         esi,eax
 00046ED3    mov         byte ptr [esi+1E9],1
 00046EDA    mov         eax,esi
 00046EDC    mov         ecx,dword ptr [eax]
 00046EDE    call        dword ptr [ecx-10]
 00046EE1    pop         esi
 00046EE2    ret
*}
end;

//00046EE4
procedure TWinControl.WMIMEEndComp(var Message:TMessage);
begin
{*
 00046EE4    push        esi
 00046EE5    mov         esi,eax
 00046EE7    mov         byte ptr [esi+1E9],0
 00046EEE    mov         eax,esi
 00046EF0    mov         ecx,dword ptr [eax]
 00046EF2    call        dword ptr [ecx-10]
 00046EF5    pop         esi
 00046EF6    ret
*}
end;

//00046EF8
procedure TWinControl.SetIme;
begin
{*
 00046EF8    push        ebx
 00046EF9    push        esi
 00046EFA    push        edi
 00046EFB    mov         ebx,eax
 00046EFD    mov         eax,[000B5C08];SysLocale:TSysLocale
 00046F02    cmp         byte ptr [eax+8],0
>00046F06    je          00046F9C
 00046F0C    cmp         dword ptr [ebx+14C],0
>00046F13    je          00046F8A
 00046F15    mov         eax,[000B5BDC];^Screen:TScreen
 00046F1A    mov         eax,dword ptr [eax]
 00046F1C    mov         edx,dword ptr [eax+2C]
 00046F1F    mov         eax,dword ptr [ebx+14C]
 00046F25    call        AnsiCompareText
 00046F2A    test        eax,eax
>00046F2C    je          00046F8A
 00046F2E    mov         eax,[000B5BDC];^Screen:TScreen
 00046F33    mov         eax,dword ptr [eax]
 00046F35    mov         eax,dword ptr [eax+28]
 00046F38    mov         edx,dword ptr [eax]
 00046F3A    call        dword ptr [edx+14]
 00046F3D    test        eax,eax
>00046F3F    je          00046F8A
 00046F41    mov         eax,[000B5BDC];^Screen:TScreen
 00046F46    mov         eax,dword ptr [eax]
 00046F48    mov         esi,dword ptr [eax+30]
 00046F4B    cmp         byte ptr [ebx+148],0
>00046F52    je          00046F82
 00046F54    mov         eax,[000B5BDC];^Screen:TScreen
 00046F59    mov         eax,dword ptr [eax]
 00046F5B    mov         eax,dword ptr [eax+28]
 00046F5E    mov         edx,dword ptr [ebx+14C]
 00046F64    mov         ecx,dword ptr [eax]
 00046F66    call        dword ptr [ecx+50]
 00046F69    mov         edi,eax
 00046F6B    test        edi,edi
>00046F6D    jl          00046F82
 00046F6F    mov         eax,[000B5BDC];^Screen:TScreen
 00046F74    mov         eax,dword ptr [eax]
 00046F76    mov         eax,dword ptr [eax+28]
 00046F79    mov         edx,edi
 00046F7B    mov         ecx,dword ptr [eax]
 00046F7D    call        dword ptr [ecx+18]
 00046F80    mov         esi,eax
 00046F82    push        1
 00046F84    push        esi
 00046F85    call        user32.ActivateKeyboardLayout
 00046F8A    mov         eax,ebx
 00046F8C    call        TWinControl.GetHandle
 00046F91    mov         dl,byte ptr [ebx+148]
 00046F97    call        SetImeMode
 00046F9C    pop         edi
 00046F9D    pop         esi
 00046F9E    pop         ebx
 00046F9F    ret
*}
end;

//00046FA0
procedure TWinControl.ResetIme;
begin
{*
 00046FA0    push        ebx
 00046FA1    mov         ebx,eax
 00046FA3    mov         eax,[000B5C08];SysLocale:TSysLocale
 00046FA8    cmp         byte ptr [eax+8],0
>00046FAC    je          00046FF9
 00046FAE    cmp         dword ptr [ebx+14C],0
>00046FB5    je          00046FE2
 00046FB7    mov         eax,[000B5BDC];^Screen:TScreen
 00046FBC    mov         eax,dword ptr [eax]
 00046FBE    mov         edx,dword ptr [eax+2C]
 00046FC1    mov         eax,dword ptr [ebx+14C]
 00046FC7    call        AnsiCompareText
 00046FCC    test        eax,eax
>00046FCE    je          00046FE2
 00046FD0    push        1
 00046FD2    mov         eax,[000B5BDC];^Screen:TScreen
 00046FD7    mov         eax,dword ptr [eax]
 00046FD9    mov         eax,dword ptr [eax+30]
 00046FDC    push        eax
 00046FDD    call        user32.ActivateKeyboardLayout
 00046FE2    cmp         byte ptr [ebx+148],0
>00046FE9    jne         00046FF9
 00046FEB    mov         eax,ebx
 00046FED    call        TWinControl.GetHandle
 00046FF2    mov         dl,1
 00046FF4    call        Win32NLSEnableIME
 00046FF9    pop         ebx
 00046FFA    ret
*}
end;

//00046FFC
{*procedure TWinControl.sub_00046FFC(?:?);
begin
 00046FFC    xchg        eax,edx
 00046FFD    mov         ecx,dword ptr [eax]
 00046FFF    call        dword ptr [ecx+64]
 00047002    ret
end;*}

//00047004
procedure TWinControl.DoRemoveDockClient(Client:TControl);
begin
{*
 00047004    ret
*}
end;

//00047008
procedure TWinControl.DoEnter;
begin
{*
 00047008    push        ebx
 00047009    cmp         word ptr [eax+19A],0
>00047011    je          00047023
 00047013    mov         ebx,eax
 00047015    mov         edx,eax
 00047017    mov         eax,dword ptr [ebx+19C]
 0004701D    call        dword ptr [ebx+198]
 00047023    pop         ebx
 00047024    ret
*}
end;

//00047028
procedure TWinControl.DoExit;
begin
{*
 00047028    push        ebx
 00047029    cmp         word ptr [eax+1A2],0
>00047031    je          00047043
 00047033    mov         ebx,eax
 00047035    mov         edx,eax
 00047037    mov         eax,dword ptr [ebx+1A4]
 0004703D    call        dword ptr [ebx+1A0]
 00047043    pop         ebx
 00047044    ret
*}
end;

//00047048
procedure TWinControl.DockDrop(Source:TDragDockObject; X:Integer; Y:Integer);
begin
{*
 00047048    push        ebp
 00047049    mov         ebp,esp
 0004704B    push        ebx
 0004704C    push        esi
 0004704D    push        edi
 0004704E    mov         edi,ecx
 00047050    mov         esi,edx
 00047052    mov         ebx,eax
 00047054    mov         dx,word ptr [ebp+8]
 00047058    mov         eax,edi
 0004705A    call        SmallPoint
 0004705F    push        eax
 00047060    mov         ecx,esi
 00047062    mov         edx,0B038
 00047067    mov         eax,ebx
 00047069    call        TControl.Perform
 0004706E    test        eax,eax
>00047070    jl          00047091
 00047072    cmp         word ptr [ebx+18A],0
>0004707A    je          00047091
 0004707C    push        edi
 0004707D    mov         eax,dword ptr [ebp+8]
 00047080    push        eax
 00047081    mov         ecx,esi
 00047083    mov         edx,ebx
 00047085    mov         eax,dword ptr [ebx+18C]
 0004708B    call        dword ptr [ebx+188]
 00047091    pop         edi
 00047092    pop         esi
 00047093    pop         ebx
 00047094    pop         ebp
 00047095    ret         4
*}
end;

//00047098
procedure TWinControl.DoDockOver(Source:TDragDockObject; X:Integer; Y:Integer; State:TDragState; var Accept:Boolean);
begin
{*
 00047098    push        ebp
 00047099    mov         ebp,esp
 0004709B    push        ebx
 0004709C    cmp         word ptr [eax+192],0
>000470A4    je          000470C5
 000470A6    push        ecx
 000470A7    mov         ecx,dword ptr [ebp+10]
 000470AA    push        ecx
 000470AB    mov         cl,byte ptr [ebp+0C]
 000470AE    push        ecx
 000470AF    mov         ecx,dword ptr [ebp+8]
 000470B2    push        ecx
 000470B3    mov         ebx,eax
 000470B5    mov         ecx,edx
 000470B7    mov         edx,eax
 000470B9    mov         eax,dword ptr [ebx+194]
 000470BF    call        dword ptr [ebx+190]
 000470C5    pop         ebx
 000470C6    pop         ebp
 000470C7    ret         0C
*}
end;

//000470CC
procedure TWinControl.DockOver(Source:TDragDockObject; X:Integer; Y:Integer; State:TDragState; var Accept:Boolean);
begin
{*
 000470CC    push        ebp
 000470CD    mov         ebp,esp
 000470CF    push        ecx
 000470D0    push        ebx
 000470D1    push        esi
 000470D2    push        edi
 000470D3    mov         dword ptr [ebp-4],ecx
 000470D6    mov         edi,edx
 000470D8    mov         esi,eax
 000470DA    mov         edx,edi
 000470DC    mov         eax,esi
 000470DE    mov         bx,0FFD8
 000470E2    call        @CallDynaInst
 000470E7    mov         eax,dword ptr [ebp+10]
 000470EA    push        eax
 000470EB    mov         al,byte ptr [ebp+0C]
 000470EE    push        eax
 000470EF    mov         eax,dword ptr [ebp+8]
 000470F2    push        eax
 000470F3    mov         ecx,dword ptr [ebp-4]
 000470F6    mov         edx,edi
 000470F8    mov         eax,esi
 000470FA    mov         bx,0FFCB
 000470FE    call        @CallDynaInst
 00047103    pop         edi
 00047104    pop         esi
 00047105    pop         ebx
 00047106    pop         ecx
 00047107    pop         ebp
 00047108    ret         0C
*}
end;

//0004710C
procedure TWinControl.DoUnDock(NewTarget:TWinControl; Client:TControl);
begin
{*
 0004710C    push        ebx
 0004710D    push        esi
 0004710E    push        edi
 0004710F    push        ecx
 00047110    mov         edi,ecx
 00047112    mov         esi,edx
 00047114    mov         ebx,eax
 00047116    mov         byte ptr [esp],1
 0004711A    cmp         word ptr [ebx+1E2],0
>00047122    je          0004713A
 00047124    push        esi
 00047125    lea         eax,[esp+4]
 00047129    push        eax
 0004712A    mov         ecx,edi
 0004712C    mov         edx,ebx
 0004712E    mov         eax,dword ptr [ebx+1E4]
 00047134    call        dword ptr [ebx+1E0]
 0004713A    cmp         byte ptr [esp],0
>0004713E    je          00047153
 00047140    push        edi
 00047141    mov         ecx,esi
 00047143    mov         edx,0B039
 00047148    mov         eax,ebx
 0004714A    call        TControl.Perform
 0004714F    test        eax,eax
>00047151    je          00047157
 00047153    xor         eax,eax
>00047155    jmp         00047159
 00047157    mov         al,1
 00047159    mov         byte ptr [esp],al
 0004715C    mov         al,byte ptr [esp]
 0004715F    pop         edx
 00047160    pop         edi
 00047161    pop         esi
 00047162    pop         ebx
 00047163    ret
*}
end;

//00047164
procedure TWinControl.ReloadDockedControl(const AControlName:AnsiString; var AControl:TControl);
begin
{*
 00047164    push        ebx
 00047165    push        esi
 00047166    push        edi
 00047167    mov         edi,ecx
 00047169    mov         esi,edx
 0004716B    mov         ebx,eax
 0004716D    mov         edx,esi
 0004716F    mov         eax,dword ptr [ebx+4]
 00047172    call        TComponent.FindComponent
 00047177    mov         edx,dword ptr ds:[3EB50];TControl
 0004717D    call        @AsClass
 00047182    mov         dword ptr [edi],eax
 00047184    pop         edi
 00047185    pop         esi
 00047186    pop         ebx
 00047187    ret
*}
end;

//00047188
function TWinControl.GetDockClientCount:Integer;
begin
{*
 00047188    mov         edx,dword ptr [eax+134]
 0004718E    test        edx,edx
>00047190    je          00047196
 00047192    mov         eax,dword ptr [edx+8]
 00047195    ret
 00047196    xor         eax,eax
 00047198    ret
*}
end;

//0004719C
function TWinControl.GetDockClients(Index:Integer):TControl;
begin
{*
 0004719C    push        ebx
 0004719D    push        esi
 0004719E    push        edi
 0004719F    mov         edi,edx
 000471A1    mov         ebx,eax
 000471A3    mov         esi,dword ptr [ebx+134]
 000471A9    test        esi,esi
>000471AB    je          000471B8
 000471AD    mov         edx,edi
 000471AF    mov         eax,esi
 000471B1    call        TList.Get
>000471B6    jmp         000471BA
 000471B8    xor         eax,eax
 000471BA    pop         edi
 000471BB    pop         esi
 000471BC    pop         ebx
 000471BD    ret
*}
end;

//000471C0
procedure TWinControl.GetSiteInfo(Client:TControl; var InfluenceRect:TRect; MousePos:TPoint; var CanDock:Boolean);
begin
{*
 000471C0    push        ebp
 000471C1    mov         ebp,esp
 000471C3    add         esp,0FFFFFFF8
 000471C6    push        ebx
 000471C7    push        esi
 000471C8    push        edi
 000471C9    mov         esi,dword ptr [ebp+0C]
 000471CC    lea         edi,[ebp-8]
 000471CF    movs        dword ptr [edi],dword ptr [esi]
 000471D0    movs        dword ptr [edi],dword ptr [esi]
 000471D1    mov         esi,ecx
 000471D3    mov         edi,edx
 000471D5    mov         ebx,eax
 000471D7    push        esi
 000471D8    mov         eax,ebx
 000471DA    call        TWinControl.GetHandle
 000471DF    push        eax
 000471E0    call        user32.GetWindowRect
 000471E5    push        0A
 000471E7    push        0A
 000471E9    push        esi
 000471EA    call        user32.InflateRect
 000471EF    cmp         word ptr [ebx+1AA],0
>000471F7    je          00047212
 000471F9    push        esi
 000471FA    lea         eax,[ebp-8]
 000471FD    push        eax
 000471FE    mov         eax,dword ptr [ebp+8]
 00047201    push        eax
 00047202    mov         ecx,edi
 00047204    mov         edx,ebx
 00047206    mov         eax,dword ptr [ebx+1AC]
 0004720C    call        dword ptr [ebx+1A8]
 00047212    pop         edi
 00047213    pop         esi
 00047214    pop         ebx
 00047215    pop         ecx
 00047216    pop         ecx
 00047217    pop         ebp
 00047218    ret         8
*}
end;

//0004721C
procedure TWinControl.CreateDockManager;
begin
{*
 0004721C    push        ebx
 0004721D    push        esi
 0004721E    mov         esi,edx
 00047220    mov         ebx,eax
 00047222    cmp         dword ptr [ebx+13C],0
>00047229    jne         0004725D
 0004722B    cmp         byte ptr [ebx+138],0
>00047232    je          0004725D
 00047234    cmp         byte ptr [ebx+180],0
>0004723B    je          0004725D
 0004723D    mov         ecx,ebx
 0004723F    mov         dl,1
 00047241    mov         eax,[0003FCA8];TDockTree
 00047246    call        TDockTree.Create
 0004724B    mov         edx,eax
 0004724D    test        edx,edx
>0004724F    je          00047254
 00047251    sub         edx,0FFFFFF90
 00047254    mov         eax,esi
 00047256    call        @IntfCopy
>0004725B    jmp         0004726A
 0004725D    mov         eax,esi
 0004725F    mov         edx,dword ptr [ebx+13C]
 00047265    call        @IntfCopy
 0004726A    cmp         byte ptr [ebx+1E8],0
>00047271    jne         0004727C
 00047273    cmp         dword ptr [esi],0
>00047276    jne         0004727C
 00047278    xor         eax,eax
>0004727A    jmp         0004727E
 0004727C    mov         al,1
 0004727E    mov         byte ptr [ebx+1E8],al
 00047284    pop         esi
 00047285    pop         ebx
 00047286    ret
*}
end;

//00047288
procedure TWinControl.SetDockSite(Value:Boolean);
begin
{*
 00047288    push        ebp
 00047289    mov         ebp,esp
 0004728B    push        0
 0004728D    push        ebx
 0004728E    push        esi
 0004728F    mov         ebx,edx
 00047291    mov         esi,eax
 00047293    xor         eax,eax
 00047295    push        ebp
 00047296    push        4732F
 0004729B    push        dword ptr fs:[eax]
 0004729E    mov         dword ptr fs:[eax],esp
 000472A1    cmp         bl,byte ptr [esi+138]
>000472A7    je          00047319
 000472A9    mov         byte ptr [esi+138],bl
 000472AF    test        byte ptr [esi+20],10
>000472B3    jne         00047319
 000472B5    mov         edx,ebx
 000472B7    mov         eax,esi
 000472B9    call        RegisterDockSite
 000472BE    test        bl,bl
>000472C0    jne         000472E2
 000472C2    mov         eax,dword ptr [esi+134]
 000472C8    call        TObject.Free
 000472CD    xor         eax,eax
 000472CF    mov         dword ptr [esi+134],eax
 000472D5    lea         eax,[esi+13C]
 000472DB    call        @IntfClear
>000472E0    jmp         00047319
 000472E2    cmp         dword ptr [esi+134],0
>000472E9    jne         000472FD
 000472EB    mov         dl,1
 000472ED    mov         eax,[0001EEC4];TList
 000472F2    call        TObject.Create
 000472F7    mov         dword ptr [esi+134],eax
 000472FD    lea         edx,[ebp-4]
 00047300    mov         eax,esi
 00047302    mov         bx,0FFCE
 00047306    call        @CallDynaInst
 0004730B    mov         edx,dword ptr [ebp-4]
 0004730E    lea         eax,[esi+13C]
 00047314    call        @IntfCopy
 00047319    xor         eax,eax
 0004731B    pop         edx
 0004731C    pop         ecx
 0004731D    pop         ecx
 0004731E    mov         dword ptr fs:[eax],edx
 00047321    push        47336
 00047326    lea         eax,[ebp-4]
 00047329    call        @IntfClear
 0004732E    ret
>0004732F    jmp         @HandleFinally
>00047334    jmp         00047326
 00047336    pop         esi
 00047337    pop         ebx
 00047338    pop         ecx
 00047339    pop         ebp
 0004733A    ret
*}
end;

//0004733C
procedure TWinControl.CMDockClient(var Message:TCMDockClient);
begin
{*
 0004733C    push        ebp
 0004733D    mov         ebp,esp
 0004733F    add         esp,0FFFFFFE8
 00047342    push        ebx
 00047343    push        esi
 00047344    push        edi
 00047345    mov         dword ptr [ebp-8],edx
 00047348    mov         dword ptr [ebp-4],eax
 0004734B    mov         eax,dword ptr [ebp-8]
 0004734E    cmp         dword ptr [eax+0C],0
>00047352    jne         00047423
 00047358    mov         eax,dword ptr [ebp-8]
 0004735B    mov         eax,dword ptr [eax+4]
 0004735E    lea         esi,[eax+38]
 00047361    lea         edi,[ebp-18]
 00047364    mov         ecx,4
 00047369    rep movs    dword ptr [edi],dword ptr [esi]
 0004736B    push        2
 0004736D    lea         eax,[ebp-18]
 00047370    push        eax
 00047371    mov         eax,dword ptr [ebp-4]
 00047374    call        TWinControl.GetHandle
 00047379    push        eax
 0004737A    push        0
 0004737C    call        user32.MapWindowPoints
 00047381    mov         eax,dword ptr [ebp-4]
 00047384    call        TWinControl.DisableAlign
 00047389    xor         edx,edx
 0004738B    push        ebp
 0004738C    push        47401
 00047391    push        dword ptr fs:[edx]
 00047394    mov         dword ptr fs:[edx],esp
 00047397    mov         eax,dword ptr [ebp-8]
 0004739A    mov         eax,dword ptr [eax+4]
 0004739D    mov         eax,dword ptr [eax+30]
 000473A0    lea         ecx,[ebp-18]
 000473A3    mov         edx,dword ptr [ebp-4]
 000473A6    mov         bx,0FFD2
 000473AA    call        @CallDynaInst
 000473AF    mov         eax,dword ptr [ebp-4]
 000473B2    cmp         byte ptr [eax+180],0
>000473B9    je          000473EB
 000473BB    mov         eax,dword ptr [ebp-4]
 000473BE    cmp         dword ptr [eax+13C],0
>000473C5    je          000473EB
 000473C7    mov         eax,dword ptr [ebp-8]
 000473CA    mov         eax,dword ptr [eax+4]
 000473CD    mov         edx,dword ptr [eax+4C]
 000473D0    push        edx
 000473D1    mov         edx,dword ptr [ebp-8]
 000473D4    mov         cl,byte ptr [eax+48]
 000473D7    mov         edx,dword ptr [ebp-8]
 000473DA    mov         edx,dword ptr [eax+30]
 000473DD    mov         eax,dword ptr [ebp-4]
 000473E0    mov         eax,dword ptr [eax+13C]
 000473E6    mov         ebx,dword ptr [eax]
 000473E8    call        dword ptr [ebx+18]
 000473EB    xor         eax,eax
 000473ED    pop         edx
 000473EE    pop         ecx
 000473EF    pop         ecx
 000473F0    mov         dword ptr fs:[eax],edx
 000473F3    push        47408
 000473F8    mov         eax,dword ptr [ebp-4]
 000473FB    call        TWinControl.EnableAlign
 00047400    ret
>00047401    jmp         @HandleFinally
>00047406    jmp         000473F8
 00047408    mov         eax,dword ptr [ebp-4]
 0004740B    call        GetParentForm
 00047410    test        eax,eax
>00047412    je          00047419
 00047414    call        TControl.BringToFront
 00047419    mov         eax,dword ptr [ebp-8]
 0004741C    mov         dword ptr [eax+0C],1
 00047423    pop         edi
 00047424    pop         esi
 00047425    pop         ebx
 00047426    mov         esp,ebp
 00047428    pop         ebp
 00047429    ret
*}
end;

//0004742C
procedure TWinControl.CMUnDockClient(var Message:TCMUnDockClient);
begin
{*
 0004742C    xor         ecx,ecx
 0004742E    mov         dword ptr [edx+0C],ecx
 00047431    cmp         byte ptr [eax+180],0
>00047438    je          00047451
 0004743A    cmp         dword ptr [eax+13C],0
>00047441    je          00047451
 00047443    mov         edx,dword ptr [edx+8]
 00047446    mov         eax,dword ptr [eax+13C]
 0004744C    mov         ecx,dword ptr [eax]
 0004744E    call        dword ptr [ecx+28]
 00047451    ret
*}
end;

//00047454
procedure TWinControl.CMFloat(var Message:TCMFloat);
begin
{*
 00047454    push        ebp
 00047455    mov         ebp,esp
 00047457    add         esp,0FFFFFFF8
 0004745A    push        ebx
 0004745B    push        esi
 0004745C    mov         esi,edx
 0004745E    mov         dword ptr [ebp-4],eax
 00047461    mov         eax,dword ptr [ebp-4]
 00047464    mov         edx,dword ptr [eax]
 00047466    call        dword ptr [edx+58]
 00047469    mov         ebx,eax
 0004746B    mov         eax,dword ptr [ebp-4]
 0004746E    call        TObject.ClassType
 00047473    cmp         ebx,eax
>00047475    jne         000474C5
 00047477    mov         eax,dword ptr [ebp-4]
 0004747A    mov         al,byte ptr [eax+47]
 0004747D    mov         byte ptr [ebp-5],al
 00047480    xor         eax,eax
 00047482    push        ebp
 00047483    push        474BE
 00047488    push        dword ptr fs:[eax]
 0004748B    mov         dword ptr fs:[eax],esp
 0004748E    mov         eax,dword ptr [esi+8]
 00047491    lea         ecx,[eax+38]
 00047494    xor         edx,edx
 00047496    mov         eax,dword ptr [ebp-4]
 00047499    mov         bx,0FFD2
 0004749D    call        @CallDynaInst
 000474A2    xor         eax,eax
 000474A4    pop         edx
 000474A5    pop         ecx
 000474A6    pop         ecx
 000474A7    mov         dword ptr fs:[eax],edx
 000474AA    push        474CF
 000474AF    cmp         byte ptr [ebp-5],0
>000474B3    je          000474BD
 000474B5    mov         eax,dword ptr [ebp-4]
 000474B8    call        TControl.BringToFront
 000474BD    ret
>000474BE    jmp         @HandleFinally
>000474C3    jmp         000474AF
 000474C5    mov         edx,esi
 000474C7    mov         eax,dword ptr [ebp-4]
 000474CA    call        TControl.CMFloat
 000474CF    pop         esi
 000474D0    pop         ebx
 000474D1    pop         ecx
 000474D2    pop         ecx
 000474D3    pop         ebp
 000474D4    ret
*}
end;

//000474D8
procedure TWinControl.KeyDown(var Key:Word; Shift:TShiftState);
begin
{*
 000474D8    push        ebx
 000474D9    push        ecx
 000474DA    mov         byte ptr [esp],cl
 000474DD    cmp         word ptr [eax+1B2],0
>000474E5    je          000474FD
 000474E7    mov         cl,byte ptr [esp]
 000474EA    push        ecx
 000474EB    mov         ecx,edx
 000474ED    mov         ebx,eax
 000474EF    mov         edx,eax
 000474F1    mov         eax,dword ptr [ebx+1B4]
 000474F7    call        dword ptr [ebx+1B0]
 000474FD    pop         edx
 000474FE    pop         ebx
 000474FF    ret
*}
end;

//00047500
function TWinControl.DoKeyDown(var Message:TWMKey):Boolean;
begin
{*
 00047500    push        ebx
 00047501    push        esi
 00047502    push        edi
 00047503    push        ecx
 00047504    mov         edi,edx
 00047506    mov         esi,eax
 00047508    mov         byte ptr [esp],1
 0004750C    mov         eax,esi
 0004750E    call        GetParentForm
 00047513    mov         ebx,eax
 00047515    test        ebx,ebx
>00047517    je          00047533
 00047519    cmp         esi,ebx
>0004751B    je          00047533
 0004751D    cmp         byte ptr [ebx+20D],0
>00047524    je          00047533
 00047526    mov         edx,edi
 00047528    mov         eax,ebx
 0004752A    call        TWinControl.DoKeyDown
 0004752F    test        al,al
>00047531    jne         0004755E
 00047533    mov         eax,dword ptr [edi+8]
 00047536    call        KeyDataToShiftState
 0004753B    mov         ebx,eax
 0004753D    test        byte ptr [esi+41],10
>00047541    jne         0004755A
 00047543    lea         edx,[edi+4]
 00047546    mov         ecx,ebx
 00047548    mov         eax,esi
 0004754A    mov         bx,0FFC1
 0004754E    call        @CallDynaInst
 00047553    cmp         word ptr [edi+4],0
>00047558    je          0004755E
 0004755A    mov         byte ptr [esp],0
 0004755E    mov         al,byte ptr [esp]
 00047561    pop         edx
 00047562    pop         edi
 00047563    pop         esi
 00047564    pop         ebx
 00047565    ret
*}
end;

//00047568
procedure TWinControl.WMKeyDown(var Message:TWMKeyDown);
begin
{*
 00047568    push        ebx
 00047569    push        esi
 0004756A    mov         esi,edx
 0004756C    mov         ebx,eax
 0004756E    mov         edx,esi
 00047570    mov         eax,ebx
 00047572    call        TWinControl.DoKeyDown
 00047577    test        al,al
>00047579    jne         00047584
 0004757B    mov         edx,esi
 0004757D    mov         eax,ebx
 0004757F    mov         ecx,dword ptr [eax]
 00047581    call        dword ptr [ecx-10]
 00047584    pop         esi
 00047585    pop         ebx
 00047586    ret
*}
end;

//00047588
procedure TWinControl.WMSysKeyDown(var Message:TWMKeyDown);
begin
{*
 00047588    push        ebx
 00047589    push        esi
 0004758A    mov         esi,edx
 0004758C    mov         ebx,eax
 0004758E    mov         edx,esi
 00047590    mov         eax,ebx
 00047592    call        TWinControl.DoKeyDown
 00047597    test        al,al
>00047599    jne         000475A4
 0004759B    mov         edx,esi
 0004759D    mov         eax,ebx
 0004759F    mov         ecx,dword ptr [eax]
 000475A1    call        dword ptr [ecx-10]
 000475A4    pop         esi
 000475A5    pop         ebx
 000475A6    ret
*}
end;

//000475A8
procedure TWinControl.KeyUp(var Key:Word; Shift:TShiftState);
begin
{*
 000475A8    push        ebx
 000475A9    push        ecx
 000475AA    mov         byte ptr [esp],cl
 000475AD    cmp         word ptr [eax+1C2],0
>000475B5    je          000475CD
 000475B7    mov         cl,byte ptr [esp]
 000475BA    push        ecx
 000475BB    mov         ecx,edx
 000475BD    mov         ebx,eax
 000475BF    mov         edx,eax
 000475C1    mov         eax,dword ptr [ebx+1C4]
 000475C7    call        dword ptr [ebx+1C0]
 000475CD    pop         edx
 000475CE    pop         ebx
 000475CF    ret
*}
end;

//000475D0
function TWinControl.DoKeyUp(var Message:TWMKey):Boolean;
begin
{*
 000475D0    push        ebx
 000475D1    push        esi
 000475D2    push        edi
 000475D3    push        ecx
 000475D4    mov         edi,edx
 000475D6    mov         esi,eax
 000475D8    mov         byte ptr [esp],1
 000475DC    mov         eax,esi
 000475DE    call        GetParentForm
 000475E3    mov         ebx,eax
 000475E5    test        ebx,ebx
>000475E7    je          00047603
 000475E9    cmp         esi,ebx
>000475EB    je          00047603
 000475ED    cmp         byte ptr [ebx+20D],0
>000475F4    je          00047603
 000475F6    mov         edx,edi
 000475F8    mov         eax,ebx
 000475FA    call        TWinControl.DoKeyUp
 000475FF    test        al,al
>00047601    jne         00047652
 00047603    mov         eax,dword ptr [edi+8]
 00047606    call        KeyDataToShiftState
 0004760B    mov         byte ptr [esp+1],al
 0004760F    test        byte ptr [esi+41],10
>00047613    jne         0004762E
 00047615    lea         edx,[edi+4]
 00047618    mov         cl,byte ptr [esp+1]
 0004761C    mov         eax,esi
 0004761E    mov         bx,0FFC0
 00047622    call        @CallDynaInst
 00047627    cmp         word ptr [edi+4],0
>0004762C    je          00047652
 0004762E    cmp         word ptr [edi+4],5D
>00047633    jne         0004764E
 00047635    test        byte ptr [esp+1],2
>0004763A    jne         0004764E
 0004763C    xor         edx,edx
 0004763E    xor         eax,eax
 00047640    call        SmallPoint
 00047645    mov         edx,eax
 00047647    mov         eax,esi
 00047649    call        TControl.CheckMenuPopup
 0004764E    mov         byte ptr [esp],0
 00047652    mov         al,byte ptr [esp]
 00047655    pop         edx
 00047656    pop         edi
 00047657    pop         esi
 00047658    pop         ebx
 00047659    ret
*}
end;

//0004765C
procedure TWinControl.WMKeyUp(var Message:TWMKeyUp);
begin
{*
 0004765C    push        ebx
 0004765D    push        esi
 0004765E    mov         esi,edx
 00047660    mov         ebx,eax
 00047662    mov         edx,esi
 00047664    mov         eax,ebx
 00047666    call        TWinControl.DoKeyUp
 0004766B    test        al,al
>0004766D    jne         00047678
 0004766F    mov         edx,esi
 00047671    mov         eax,ebx
 00047673    mov         ecx,dword ptr [eax]
 00047675    call        dword ptr [ecx-10]
 00047678    pop         esi
 00047679    pop         ebx
 0004767A    ret
*}
end;

//0004767C
procedure TWinControl.WMSysKeyUp(var Message:TWMKeyUp);
begin
{*
 0004767C    push        ebx
 0004767D    push        esi
 0004767E    mov         esi,edx
 00047680    mov         ebx,eax
 00047682    mov         edx,esi
 00047684    mov         eax,ebx
 00047686    call        TWinControl.DoKeyUp
 0004768B    test        al,al
>0004768D    jne         00047698
 0004768F    mov         edx,esi
 00047691    mov         eax,ebx
 00047693    mov         ecx,dword ptr [eax]
 00047695    call        dword ptr [ecx-10]
 00047698    pop         esi
 00047699    pop         ebx
 0004769A    ret
*}
end;

//0004769C
procedure TWinControl.KeyPress(var Key:Char);
begin
{*
 0004769C    push        ebx
 0004769D    cmp         word ptr [eax+1BA],0
>000476A5    je          000476B9
 000476A7    mov         ecx,edx
 000476A9    mov         ebx,eax
 000476AB    mov         edx,eax
 000476AD    mov         eax,dword ptr [ebx+1BC]
 000476B3    call        dword ptr [ebx+1B8]
 000476B9    pop         ebx
 000476BA    ret
*}
end;

//000476BC
function TWinControl.DoKeyPress(var Message:TWMKey):Boolean;
begin
{*
 000476BC    push        ebx
 000476BD    push        esi
 000476BE    push        edi
 000476BF    push        ecx
 000476C0    mov         edi,edx
 000476C2    mov         esi,eax
 000476C4    mov         byte ptr [esp],1
 000476C8    mov         eax,esi
 000476CA    call        GetParentForm
 000476CF    mov         ebx,eax
 000476D1    test        ebx,ebx
>000476D3    je          000476EF
 000476D5    cmp         esi,ebx
>000476D7    je          000476EF
 000476D9    cmp         byte ptr [ebx+20D],0
>000476E0    je          000476EF
 000476E2    mov         edx,edi
 000476E4    mov         eax,ebx
 000476E6    call        TWinControl.DoKeyPress
 000476EB    test        al,al
>000476ED    jne         0004771F
 000476EF    test        byte ptr [esi+41],10
>000476F3    jne         0004771B
 000476F5    mov         al,byte ptr [edi+4]
 000476F8    mov         byte ptr [esp+1],al
 000476FC    lea         edx,[esp+1]
 00047700    mov         eax,esi
 00047702    mov         bx,0FFBF
 00047706    call        @CallDynaInst
 0004770B    xor         eax,eax
 0004770D    mov         al,byte ptr [esp+1]
 00047711    mov         word ptr [edi+4],ax
 00047715    cmp         byte ptr [edi+4],0
>00047719    je          0004771F
 0004771B    mov         byte ptr [esp],0
 0004771F    mov         al,byte ptr [esp]
 00047722    pop         edx
 00047723    pop         edi
 00047724    pop         esi
 00047725    pop         ebx
 00047726    ret
*}
end;

//00047728
procedure TWinControl.WMChar(var Message:TWMChar);
begin
{*
 00047728    push        ebx
 00047729    push        esi
 0004772A    mov         esi,edx
 0004772C    mov         ebx,eax
 0004772E    mov         edx,esi
 00047730    mov         eax,ebx
 00047732    call        TWinControl.DoKeyPress
 00047737    test        al,al
>00047739    jne         00047744
 0004773B    mov         edx,esi
 0004773D    mov         eax,ebx
 0004773F    mov         ecx,dword ptr [eax]
 00047741    call        dword ptr [ecx-10]
 00047744    pop         esi
 00047745    pop         ebx
 00047746    ret
*}
end;

//00047748
procedure TWinControl.CMMouseWheel(var Message:TCMMouseWheel);
begin
{*
 00047748    push        ebx
 00047749    push        esi
 0004774A    push        edi
 0004774B    add         esp,0FFFFFFF8
 0004774E    mov         esi,edx
 00047750    mov         edi,eax
 00047752    xor         eax,eax
 00047754    mov         dword ptr [esi+0C],eax
 00047757    mov         edx,esp
 00047759    mov         eax,dword ptr [esi+8]
 0004775C    call        SmallPointToPoint
 00047761    push        esp
 00047762    movsx       ecx,word ptr [esi+6]
 00047766    mov         dl,byte ptr [esi+4]
 00047769    mov         eax,edi
 0004776B    mov         bx,0FFC7
 0004776F    call        @CallDynaInst
 00047774    test        al,al
>00047776    je          00047781
 00047778    mov         dword ptr [esi+0C],1
>0004777F    jmp         0004779E
 00047781    mov         ebx,dword ptr [edi+24]
 00047784    test        ebx,ebx
>00047786    je          0004779E
 00047788    mov         eax,dword ptr [esi+8]
 0004778B    push        eax
 0004778C    mov         ecx,dword ptr [esi+4]
 0004778F    mov         edx,0B043
 00047794    mov         eax,ebx
 00047796    call        TControl.Perform
 0004779B    mov         dword ptr [esi+0C],eax
 0004779E    pop         ecx
 0004779F    pop         edx
 000477A0    pop         edi
 000477A1    pop         esi
 000477A2    pop         ebx
 000477A3    ret
*}
end;

//000477A4
procedure TWinControl.WMMouseWheel(var Message:TWMMouseWheel);
begin
{*
 000477A4    push        ebx
 000477A5    push        esi
 000477A6    push        edi
 000477A7    mov         esi,edx
 000477A9    mov         edi,eax
 000477AB    mov         ax,word ptr [esi+4]
 000477AF    call        KeysToShiftState
 000477B4    mov         byte ptr [esi+4],al
 000477B7    mov         edx,esi
 000477B9    mov         eax,edi
 000477BB    mov         bx,0FFB9
 000477BF    call        @CallDynaInst
 000477C4    cmp         dword ptr [esi+0C],0
>000477C8    jne         000477D3
 000477CA    mov         edx,esi
 000477CC    mov         eax,edi
 000477CE    mov         ecx,dword ptr [eax]
 000477D0    call        dword ptr [ecx-10]
 000477D3    pop         edi
 000477D4    pop         esi
 000477D5    pop         ebx
 000477D6    ret
*}
end;

//000477D8
procedure TWinControl.MouseWheelHandler(var Message:TMessage);
begin
{*
 000477D8    push        ebx
 000477D9    push        esi
 000477DA    push        edi
 000477DB    mov         edi,edx
 000477DD    mov         ebx,eax
 000477DF    mov         eax,ebx
 000477E1    call        GetParentForm
 000477E6    mov         esi,eax
 000477E8    test        esi,esi
>000477EA    je          000477FF
 000477EC    cmp         ebx,esi
>000477EE    je          000477FF
 000477F0    mov         edx,edi
 000477F2    mov         eax,esi
 000477F4    mov         bx,0FFB9
 000477F8    call        @CallDynaInst
>000477FD    jmp         00047815
 000477FF    mov         eax,dword ptr [edi+8]
 00047802    push        eax
 00047803    mov         ecx,dword ptr [edi+4]
 00047806    mov         edx,0B043
 0004780B    mov         eax,ebx
 0004780D    call        TControl.Perform
 00047812    mov         dword ptr [edi+0C],eax
 00047815    pop         edi
 00047816    pop         esi
 00047817    pop         ebx
 00047818    ret
*}
end;

//0004781C
procedure TWinControl.DoMouseWheel(Shift:TShiftState; WheelDelta:Integer; MousePos:TPoint);
begin
{*
 0004781C    push        ebp
 0004781D    mov         ebp,esp
 0004781F    add         esp,0FFFFFFF0
 00047822    push        ebx
 00047823    push        esi
 00047824    push        edi
 00047825    mov         esi,dword ptr [ebp+8]
 00047828    lea         edi,[ebp-0C]
 0004782B    movs        dword ptr [edi],dword ptr [esi]
 0004782C    movs        dword ptr [edi],dword ptr [esi]
 0004782D    mov         ebx,ecx
 0004782F    mov         byte ptr [ebp-1],dl
 00047832    mov         esi,eax
 00047834    mov         byte ptr [ebp-0D],0
 00047838    cmp         word ptr [esi+1CA],0
>00047840    je          0004785C
 00047842    push        ebx
 00047843    lea         eax,[ebp-0C]
 00047846    push        eax
 00047847    lea         eax,[ebp-0D]
 0004784A    push        eax
 0004784B    mov         cl,byte ptr [ebp-1]
 0004784E    mov         edx,esi
 00047850    mov         eax,dword ptr [esi+1CC]
 00047856    call        dword ptr [esi+1C8]
 0004785C    cmp         byte ptr [ebp-0D],0
>00047860    jne         000478D3
 00047862    add         dword ptr [esi+17C],ebx
>00047868    jmp         000478C1
 0004786A    test        ecx,ecx
 0004786C    setl        al
 0004786F    mov         ecx,eax
 00047871    mov         eax,dword ptr [esi+17C]
 00047877    cdq
 00047878    xor         eax,edx
 0004787A    sub         eax,edx
 0004787C    mov         ebx,eax
 0004787E    sub         ebx,78
 00047881    mov         dword ptr [esi+17C],ebx
 00047887    test        cl,cl
>00047889    je          000478AD
 0004788B    test        ebx,ebx
>0004788D    je          00047897
 0004788F    neg         ebx
 00047891    mov         dword ptr [esi+17C],ebx
 00047897    lea         ecx,[ebp-0C]
 0004789A    mov         dl,byte ptr [ebp-1]
 0004789D    mov         eax,esi
 0004789F    mov         bx,0FFC6
 000478A3    call        @CallDynaInst
 000478A8    mov         byte ptr [ebp-0D],al
>000478AB    jmp         000478C1
 000478AD    lea         ecx,[ebp-0C]
 000478B0    mov         dl,byte ptr [ebp-1]
 000478B3    mov         eax,esi
 000478B5    mov         bx,0FFC5
 000478B9    call        @CallDynaInst
 000478BE    mov         byte ptr [ebp-0D],al
 000478C1    mov         ecx,dword ptr [esi+17C]
 000478C7    mov         eax,ecx
 000478C9    cdq
 000478CA    xor         eax,edx
 000478CC    sub         eax,edx
 000478CE    cmp         eax,78
>000478D1    jge         0004786A
 000478D3    mov         al,byte ptr [ebp-0D]
 000478D6    pop         edi
 000478D7    pop         esi
 000478D8    pop         ebx
 000478D9    mov         esp,ebp
 000478DB    pop         ebp
 000478DC    ret         4
*}
end;

//000478E0
procedure TWinControl.DoMouseWheelDown(Shift:TShiftState; MousePos:TPoint);
begin
{*
 000478E0    push        ebx
 000478E1    push        esi
 000478E2    push        edi
 000478E3    add         esp,0FFFFFFF0
 000478E6    mov         esi,ecx
 000478E8    lea         edi,[esp+4]
 000478EC    movs        dword ptr [edi],dword ptr [esi]
 000478ED    movs        dword ptr [edi],dword ptr [esi]
 000478EE    mov         byte ptr [esp],dl
 000478F1    mov         byte ptr [esp+0C],0
 000478F6    cmp         word ptr [eax+1D2],0
>000478FE    je          0004791E
 00047900    lea         edx,[esp+4]
 00047904    push        edx
 00047905    lea         edx,[esp+10]
 00047909    push        edx
 0004790A    mov         ebx,eax
 0004790C    mov         cl,byte ptr [esp+8]
 00047910    mov         edx,eax
 00047912    mov         eax,dword ptr [ebx+1D4]
 00047918    call        dword ptr [ebx+1D0]
 0004791E    mov         al,byte ptr [esp+0C]
 00047922    add         esp,10
 00047925    pop         edi
 00047926    pop         esi
 00047927    pop         ebx
 00047928    ret
*}
end;

//0004792C
procedure TWinControl.DoMouseWheelUp(Shift:TShiftState; MousePos:TPoint);
begin
{*
 0004792C    push        ebx
 0004792D    push        esi
 0004792E    push        edi
 0004792F    add         esp,0FFFFFFF0
 00047932    mov         esi,ecx
 00047934    lea         edi,[esp+4]
 00047938    movs        dword ptr [edi],dword ptr [esi]
 00047939    movs        dword ptr [edi],dword ptr [esi]
 0004793A    mov         byte ptr [esp],dl
 0004793D    mov         byte ptr [esp+0C],0
 00047942    cmp         word ptr [eax+1DA],0
>0004794A    je          0004796A
 0004794C    lea         edx,[esp+4]
 00047950    push        edx
 00047951    lea         edx,[esp+10]
 00047955    push        edx
 00047956    mov         ebx,eax
 00047958    mov         cl,byte ptr [esp+8]
 0004795C    mov         edx,eax
 0004795E    mov         eax,dword ptr [ebx+1DC]
 00047964    call        dword ptr [ebx+1D8]
 0004796A    mov         al,byte ptr [esp+0C]
 0004796E    add         esp,10
 00047971    pop         edi
 00047972    pop         esi
 00047973    pop         ebx
 00047974    ret
*}
end;

//00047978
function TraverseControls(Container:TWinControl):Boolean;
begin
{*
 00047978    push        ebp
 00047979    mov         ebp,esp
 0004797B    add         esp,0FFFFFFF8
 0004797E    push        ebx
 0004797F    push        esi
 00047980    push        edi
 00047981    mov         dword ptr [ebp-4],eax
 00047984    mov         byte ptr [ebp-5],0
 00047988    mov         eax,dword ptr [ebp-4]
 0004798B    cmp         byte ptr [eax+16C],0
>00047992    je          00047A1B
 00047998    mov         eax,dword ptr [ebp-4]
 0004799B    call        TWinControl.GetControlCount
 000479A0    mov         esi,eax
 000479A2    dec         esi
 000479A3    test        esi,esi
>000479A5    jl          00047A1B
 000479A7    inc         esi
 000479A8    xor         edi,edi
 000479AA    mov         edx,edi
 000479AC    mov         eax,dword ptr [ebp-4]
 000479AF    call        TWinControl.GetControl
 000479B4    mov         ebx,eax
 000479B6    cmp         byte ptr [ebx+47],0
>000479BA    je          00047A17
 000479BC    mov         eax,ebx
 000479BE    mov         edx,dword ptr [eax]
 000479C0    call        dword ptr [edx+50]
 000479C3    test        al,al
>000479C5    je          00047A17
 000479C7    test        byte ptr [ebx+42],1
>000479CB    je          000479F0
 000479CD    mov         eax,dword ptr [ebp+8]
 000479D0    mov         eax,dword ptr [eax-4]
 000479D3    mov         eax,dword ptr [eax+8]
 000479D6    push        eax
 000479D7    mov         eax,dword ptr [ebp+8]
 000479DA    mov         ecx,dword ptr [eax-4]
 000479DD    mov         ecx,dword ptr [ecx+4]
 000479E0    mov         edx,112
 000479E5    mov         eax,ebx
 000479E7    call        TControl.Perform
 000479EC    test        eax,eax
>000479EE    jne         00047A11
 000479F0    mov         eax,ebx
 000479F2    mov         edx,dword ptr ds:[3F0BC];TWinControl
 000479F8    call        @IsClass
 000479FD    test        al,al
>000479FF    je          00047A17
 00047A01    mov         eax,dword ptr [ebp+8]
 00047A04    push        eax
 00047A05    mov         eax,ebx
 00047A07    call        TraverseControls
 00047A0C    pop         ecx
 00047A0D    test        al,al
>00047A0F    je          00047A17
 00047A11    mov         byte ptr [ebp-5],1
>00047A15    jmp         00047A1B
 00047A17    inc         edi
 00047A18    dec         esi
>00047A19    jne         000479AA
 00047A1B    mov         al,byte ptr [ebp-5]
 00047A1E    pop         edi
 00047A1F    pop         esi
 00047A20    pop         ebx
 00047A21    pop         ecx
 00047A22    pop         ecx
 00047A23    pop         ebp
 00047A24    ret
*}
end;

//00047A28
procedure TWinControl.WMSysCommand(var Message:TWMSysCommand);
begin
{*
 00047A28    push        ebp
 00047A29    mov         ebp,esp
 00047A2B    push        ecx
 00047A2C    push        ebx
 00047A2D    push        esi
 00047A2E    mov         dword ptr [ebp-4],edx
 00047A31    mov         ebx,eax
 00047A33    mov         eax,dword ptr [ebp-4]
 00047A36    mov         eax,dword ptr [eax+4]
 00047A39    and         eax,0FFF0
 00047A3E    cmp         eax,0F100
>00047A43    jne         00047AA1
 00047A45    mov         eax,dword ptr [ebp-4]
 00047A48    cmp         word ptr [eax+8],20
>00047A4D    je          00047AA1
 00047A4F    mov         eax,dword ptr [ebp-4]
 00047A52    cmp         word ptr [eax+8],2D
>00047A57    je          00047AA1
 00047A59    mov         eax,dword ptr [ebx+140]
 00047A5F    push        eax
 00047A60    call        user32.IsIconic
 00047A65    test        eax,eax
>00047A67    jne         00047AA1
 00047A69    call        user32.GetCapture
 00047A6E    test        eax,eax
>00047A70    jne         00047AA1
 00047A72    mov         eax,[000B59E8];^Application:TApplication
 00047A77    mov         eax,dword ptr [eax]
 00047A79    cmp         ebx,dword ptr [eax+30]
>00047A7C    je          00047AA1
 00047A7E    mov         eax,ebx
 00047A80    call        GetParentForm
 00047A85    mov         esi,eax
 00047A87    test        esi,esi
>00047A89    je          00047AA1
 00047A8B    mov         eax,dword ptr [ebp-4]
 00047A8E    push        eax
 00047A8F    xor         ecx,ecx
 00047A91    mov         edx,0B017
 00047A96    mov         eax,esi
 00047A98    call        TControl.Perform
 00047A9D    test        eax,eax
>00047A9F    jne         00047ACA
 00047AA1    mov         eax,dword ptr [ebp-4]
 00047AA4    mov         eax,dword ptr [eax+4]
 00047AA7    and         eax,0FFF0
 00047AAC    cmp         eax,0F100
>00047AB1    jne         00047AC0
 00047AB3    push        ebp
 00047AB4    mov         eax,ebx
 00047AB6    call        TraverseControls
 00047ABB    pop         ecx
 00047ABC    test        al,al
>00047ABE    jne         00047ACA
 00047AC0    mov         edx,dword ptr [ebp-4]
 00047AC3    mov         eax,ebx
 00047AC5    mov         ecx,dword ptr [eax]
 00047AC7    call        dword ptr [ecx-10]
 00047ACA    pop         esi
 00047ACB    pop         ebx
 00047ACC    pop         ecx
 00047ACD    pop         ebp
 00047ACE    ret
*}
end;

//00047AD0
procedure TWinControl.WMVKeyToItem(var Message:TWMVKeyToItem);
begin
{*
 00047AD0    push        ebx
 00047AD1    push        esi
 00047AD2    mov         ebx,edx
 00047AD4    mov         esi,eax
 00047AD6    mov         edx,ebx
 00047AD8    mov         eax,dword ptr [ebx+8]
 00047ADB    call        DoControlMsg
 00047AE0    test        al,al
>00047AE2    jne         00047AED
 00047AE4    mov         edx,ebx
 00047AE6    mov         eax,esi
 00047AE8    mov         ecx,dword ptr [eax]
 00047AEA    call        dword ptr [ecx-10]
 00047AED    pop         esi
 00047AEE    pop         ebx
 00047AEF    ret
*}
end;

//00047AF0
procedure TWinControl.WMParentNotify(var Message:TWMParentNotify);
begin
{*
 00047AF0    push        ebx
 00047AF1    push        esi
 00047AF2    push        edi
 00047AF3    mov         ebx,edx
 00047AF5    mov         edi,eax
 00047AF7    mov         si,word ptr [ebx+4]
 00047AFB    cmp         si,1
>00047AFF    je          00047B07
 00047B01    cmp         si,2
>00047B05    jne         00047B15
 00047B07    mov         edx,ebx
 00047B09    mov         eax,dword ptr [ebx+8]
 00047B0C    call        DoControlMsg
 00047B11    test        al,al
>00047B13    jne         00047B1E
 00047B15    mov         edx,ebx
 00047B17    mov         eax,edi
 00047B19    mov         ecx,dword ptr [eax]
 00047B1B    call        dword ptr [ecx-10]
 00047B1E    pop         edi
 00047B1F    pop         esi
 00047B20    pop         ebx
 00047B21    ret
*}
end;

//00047B24
procedure TWinControl.WMVScroll(var Message:TWMVScroll);
begin
{*
 00047B24    push        ebx
 00047B25    push        esi
 00047B26    mov         ebx,edx
 00047B28    mov         esi,eax
 00047B2A    mov         edx,ebx
 00047B2C    mov         eax,dword ptr [ebx+8]
 00047B2F    call        DoControlMsg
 00047B34    test        al,al
>00047B36    jne         00047B41
 00047B38    mov         edx,ebx
 00047B3A    mov         eax,esi
 00047B3C    mov         ecx,dword ptr [eax]
 00047B3E    call        dword ptr [ecx-10]
 00047B41    pop         esi
 00047B42    pop         ebx
 00047B43    ret
*}
end;

//00047B44
procedure TWinControl.WMDestroy(var Message:TWMDestroy);
begin
{*
 00047B44    push        esi
 00047B45    mov         esi,eax
 00047B47    mov         eax,esi
 00047B49    mov         ecx,dword ptr [eax]
 00047B4B    call        dword ptr [ecx-10]
 00047B4E    movzx       eax,word ptr ds:[0B673A]
 00047B55    push        eax
 00047B56    mov         eax,dword ptr [esi+140]
 00047B5C    push        eax
 00047B5D    call        user32.RemovePropA
 00047B62    movzx       eax,word ptr ds:[0B6738]
 00047B69    push        eax
 00047B6A    mov         eax,dword ptr [esi+140]
 00047B70    push        eax
 00047B71    call        user32.RemovePropA
 00047B76    pop         esi
 00047B77    ret
*}
end;

//00047B78
procedure TWinControl.WMNCDestroy(var Message:TWMNCDestroy);
begin
{*
 00047B78    push        esi
 00047B79    mov         esi,eax
 00047B7B    mov         eax,esi
 00047B7D    mov         ecx,dword ptr [eax]
 00047B7F    call        dword ptr [ecx-10]
 00047B82    xor         eax,eax
 00047B84    mov         dword ptr [esi+140],eax
 00047B8A    mov         byte ptr [esi+16C],0
 00047B91    pop         esi
 00047B92    ret
*}
end;

//00047B94
procedure TWinControl.WMNCHitTest(var Message:TWMNCHitTest);
begin
{*
 00047B94    push        esi
 00047B95    mov         esi,eax
 00047B97    test        byte ptr [esi+20],10
>00047B9B    je          00047BAC
 00047B9D    cmp         dword ptr [esi+24],0
>00047BA1    je          00047BAC
 00047BA3    mov         dword ptr [edx+0C],1
 00047BAA    pop         esi
 00047BAB    ret
 00047BAC    mov         eax,esi
 00047BAE    mov         ecx,dword ptr [eax]
 00047BB0    call        dword ptr [ecx-10]
 00047BB3    pop         esi
 00047BB4    ret
*}
end;

//00047BB8
procedure TWinControl.PaletteChanged(Foreground:Boolean);
begin
{*
 00047BB8    push        ebx
 00047BB9    push        esi
 00047BBA    push        edi
 00047BBB    push        ecx
 00047BBC    mov         byte ptr [esp],dl
 00047BBF    mov         edi,eax
 00047BC1    mov         dl,byte ptr [esp]
 00047BC4    mov         eax,edi
 00047BC6    call        TControl.PaletteChanged
 00047BCB    mov         byte ptr [esp+1],al
 00047BCF    cmp         byte ptr [edi+47],0
>00047BD3    je          00047C10
 00047BD5    mov         eax,edi
 00047BD7    call        TWinControl.GetControlCount
 00047BDC    mov         esi,eax
 00047BDE    dec         esi
 00047BDF    cmp         esi,0
>00047BE2    jl          00047C10
 00047BE4    mov         al,byte ptr [esp]
 00047BE7    and         al,byte ptr [esp+1]
>00047BEB    jne         00047C10
 00047BED    mov         edx,esi
 00047BEF    mov         eax,edi
 00047BF1    call        TWinControl.GetControl
 00047BF6    mov         dl,byte ptr [esp]
 00047BF9    mov         bx,0FFD7
 00047BFD    call        @CallDynaInst
 00047C02    or          al,byte ptr [esp+1]
 00047C06    mov         byte ptr [esp+1],al
 00047C0A    dec         esi
 00047C0B    cmp         esi,0FFFFFFFF
>00047C0E    jne         00047BE4
 00047C10    mov         al,byte ptr [esp+1]
 00047C14    pop         edx
 00047C15    pop         edi
 00047C16    pop         esi
 00047C17    pop         ebx
 00047C18    ret
*}
end;

//00047C1C
procedure TWinControl.WMQueryNewPalette(var Message:TMessage);
begin
{*
 00047C1C    push        ebx
 00047C1D    push        esi
 00047C1E    push        edi
 00047C1F    mov         edi,edx
 00047C21    mov         esi,eax
 00047C23    or          word ptr [esi+44],4
 00047C28    mov         dl,1
 00047C2A    mov         eax,esi
 00047C2C    mov         bx,0FFD7
 00047C30    call        @CallDynaInst
 00047C35    and         eax,7F
 00047C38    mov         dword ptr [edi+0C],eax
 00047C3B    pop         edi
 00047C3C    pop         esi
 00047C3D    pop         ebx
 00047C3E    ret
*}
end;

//00047C40
procedure TWinControl.WMPaletteChanged(var Message:TMessage);
begin
{*
 00047C40    push        ebx
 00047C41    push        esi
 00047C42    push        edi
 00047C43    mov         edi,edx
 00047C45    mov         esi,eax
 00047C47    xor         edx,edx
 00047C49    mov         eax,esi
 00047C4B    mov         bx,0FFD7
 00047C4F    call        @CallDynaInst
 00047C54    and         eax,7F
 00047C57    mov         dword ptr [edi+0C],eax
 00047C5A    pop         edi
 00047C5B    pop         esi
 00047C5C    pop         ebx
 00047C5D    ret
*}
end;

//00047C60
procedure TWinControl.CMShowHintChanged(var Message:TMessage);
begin
{*
 00047C60    push        esi
 00047C61    mov         esi,eax
 00047C63    mov         eax,esi
 00047C65    mov         ecx,dword ptr [eax]
 00047C67    call        dword ptr [ecx-10]
 00047C6A    mov         dx,0B023
 00047C6E    mov         eax,esi
 00047C70    call        TWinControl.NotifyControls
 00047C75    pop         esi
 00047C76    ret
*}
end;

//00047C78
procedure TWinControl.CMBiDiModeChanged(var Message:TMessage);
begin
{*
 00047C78    push        ebx
 00047C79    push        esi
 00047C7A    mov         esi,edx
 00047C7C    mov         ebx,eax
 00047C7E    mov         edx,esi
 00047C80    mov         eax,ebx
 00047C82    call        TControl.CMBiDiModeChanged
 00047C87    mov         eax,[000B5C08];SysLocale:TSysLocale
 00047C8C    cmp         byte ptr [eax+9],0
>00047C90    je          00047C9F
 00047C92    cmp         dword ptr [esi+4],0
>00047C96    jne         00047C9F
 00047C98    mov         eax,ebx
 00047C9A    call        TWinControl.RecreateWnd
 00047C9F    mov         dx,0B03D
 00047CA3    mov         eax,ebx
 00047CA5    call        TWinControl.NotifyControls
 00047CAA    pop         esi
 00047CAB    pop         ebx
 00047CAC    ret
*}
end;

//00047CB0
procedure TWinControl.CMEnter(var Message:TWMNoParams);
begin
{*
 00047CB0    push        ebx
 00047CB1    mov         bx,0FFCA
 00047CB5    call        @CallDynaInst
 00047CBA    pop         ebx
 00047CBB    ret
*}
end;

//00047CBC
procedure TWinControl.CMExit(var Message:TWMNoParams);
begin
{*
 00047CBC    push        ebx
 00047CBD    mov         bx,0FFC9
 00047CC1    call        @CallDynaInst
 00047CC6    pop         ebx
 00047CC7    ret
*}
end;

//00047CC8
procedure TWinControl.CMDesignHitTest(var Message:TWMMouse);
begin
{*
 00047CC8    push        ebx
 00047CC9    push        esi
 00047CCA    mov         esi,edx
 00047CCC    mov         ebx,eax
 00047CCE    mov         edx,esi
 00047CD0    mov         eax,ebx
 00047CD2    call        TWinControl.IsControlMouseMsg
 00047CD7    test        al,al
>00047CD9    jne         00047CE4
 00047CDB    mov         edx,esi
 00047CDD    mov         eax,ebx
 00047CDF    call        TControl.CMDesignHitTest
 00047CE4    pop         esi
 00047CE5    pop         ebx
 00047CE6    ret
*}
end;

//00047CE8
procedure TWinControl.CMChanged(var Message:TMessage);
begin
{*
 00047CE8    push        ebx
 00047CE9    mov         ecx,dword ptr [eax+24]
 00047CEC    test        ecx,ecx
>00047CEE    je          00047CF8
 00047CF0    mov         ebx,ecx
 00047CF2    mov         eax,dword ptr [ebx+2C]
 00047CF5    call        dword ptr [ebx+28]
 00047CF8    pop         ebx
 00047CF9    ret
*}
end;

//00047CFC
procedure TWinControl.CMChildKey(var Message:TMessage);
begin
{*
 00047CFC    push        ebx
 00047CFD    mov         ecx,dword ptr [eax+24]
 00047D00    test        ecx,ecx
>00047D02    je          00047D0C
 00047D04    mov         ebx,ecx
 00047D06    mov         eax,dword ptr [ebx+2C]
 00047D09    call        dword ptr [ebx+28]
 00047D0C    pop         ebx
 00047D0D    ret
*}
end;

//00047D10
procedure TWinControl.CMDialogKey(var Message:TWMKey);
begin
{*
 00047D10    call        TWinControl.Broadcast
 00047D15    ret
*}
end;

//00047D18
procedure TWinControl.CMDialogChar(var Message:TWMKey);
begin
{*
 00047D18    call        TWinControl.Broadcast
 00047D1D    ret
*}
end;

//00047D20
procedure TWinControl.CMFocusChanged(var Message:TCMFocusChanged);
begin
{*
 00047D20    call        TWinControl.Broadcast
 00047D25    ret
*}
end;

//00047D28
procedure TWinControl.CMVisibleChanged(var Message:TMessage);
begin
{*
 00047D28    push        ebx
 00047D29    mov         ebx,eax
 00047D2B    cmp         byte ptr [ebx+47],0
>00047D2F    jne         00047D40
 00047D31    cmp         dword ptr [ebx+24],0
>00047D35    je          00047D40
 00047D37    xor         edx,edx
 00047D39    mov         eax,ebx
 00047D3B    call        TWinControl.RemoveFocus
 00047D40    test        byte ptr [ebx+20],10
>00047D44    je          00047D4C
 00047D46    test        byte ptr [ebx+41],4
>00047D4A    je          00047D53
 00047D4C    mov         eax,ebx
 00047D4E    call        TWinControl.UpdateControlState
 00047D53    pop         ebx
 00047D54    ret
*}
end;

//00047D58
procedure TWinControl.CMShowingChanged(var Message:TMessage);
begin
{*
 00047D58    xor         edx,edx
 00047D5A    mov         dl,byte ptr [eax+16C]
 00047D60    movzx       edx,word ptr [edx*2+0B483C]
 00047D68    push        edx
 00047D69    push        0
 00047D6B    push        0
 00047D6D    push        0
 00047D6F    push        0
 00047D71    push        0
 00047D73    mov         eax,dword ptr [eax+140]
 00047D79    push        eax
 00047D7A    call        user32.SetWindowPos
 00047D7F    ret
*}
end;

//00047D80
procedure TWinControl.CMEnabledChanged(var Message:TMessage);
begin
{*
 00047D80    push        ebx
 00047D81    mov         ebx,eax
 00047D83    mov         eax,ebx
 00047D85    mov         edx,dword ptr [eax]
 00047D87    call        dword ptr [edx+50]
 00047D8A    test        al,al
>00047D8C    jne         00047D9D
 00047D8E    cmp         dword ptr [ebx+24],0
>00047D92    je          00047D9D
 00047D94    xor         edx,edx
 00047D96    mov         eax,ebx
 00047D98    call        TWinControl.RemoveFocus
 00047D9D    mov         eax,ebx
 00047D9F    call        TWinControl.HandleAllocated
 00047DA4    test        al,al
>00047DA6    je          00047DC6
 00047DA8    test        byte ptr [ebx+20],10
>00047DAC    jne         00047DC6
 00047DAE    mov         eax,ebx
 00047DB0    mov         edx,dword ptr [eax]
 00047DB2    call        dword ptr [edx+50]
 00047DB5    neg         al
 00047DB7    sbb         eax,eax
 00047DB9    push        eax
 00047DBA    mov         eax,dword ptr [ebx+140]
 00047DC0    push        eax
 00047DC1    call        user32.EnableWindow
 00047DC6    pop         ebx
 00047DC7    ret
*}
end;

//00047DC8
procedure TWinControl.CMColorChanged(var Message:TMessage);
begin
{*
 00047DC8    push        ebx
 00047DC9    mov         ebx,eax
 00047DCB    mov         eax,ebx
 00047DCD    call        TControl.CMColorChanged
 00047DD2    mov         edx,dword ptr [ebx+64]
 00047DD5    mov         eax,dword ptr [ebx+124]
 00047DDB    call        TBrush.SetColor
 00047DE0    mov         dx,0B009
 00047DE4    mov         eax,ebx
 00047DE6    call        TWinControl.NotifyControls
 00047DEB    pop         ebx
 00047DEC    ret
*}
end;

//00047DF0
procedure TWinControl.CMFontChanged(var Message:TMessage);
begin
{*
 00047DF0    push        ebx
 00047DF1    mov         ebx,eax
 00047DF3    mov         eax,ebx
 00047DF5    call        TControl.CMFontChanged
 00047DFA    mov         eax,ebx
 00047DFC    call        TWinControl.HandleAllocated
 00047E01    test        al,al
>00047E03    je          00047E1D
 00047E05    push        0
 00047E07    mov         eax,dword ptr [ebx+58]
 00047E0A    call        TFont.GetHandle
 00047E0F    mov         ecx,eax
 00047E11    mov         edx,30
 00047E16    mov         eax,ebx
 00047E18    call        TControl.Perform
 00047E1D    mov         dx,0B008
 00047E21    mov         eax,ebx
 00047E23    call        TWinControl.NotifyControls
 00047E28    pop         ebx
 00047E29    ret
*}
end;

//00047E2C
procedure TWinControl.CMCursorChanged(var Message:TMessage);
begin
{*
 00047E2C    push        ebx
 00047E2D    add         esp,0FFFFFFF8
 00047E30    mov         ebx,eax
 00047E32    call        user32.GetCapture
 00047E37    test        eax,eax
>00047E39    jne         00047E65
 00047E3B    push        esp
 00047E3C    call        user32.GetCursorPos
 00047E41    mov         eax,esp
 00047E43    xor         edx,edx
 00047E45    call        FindDragTarget
 00047E4A    cmp         ebx,eax
>00047E4C    jne         00047E65
 00047E4E    push        1
 00047E50    mov         eax,ebx
 00047E52    call        TWinControl.GetHandle
 00047E57    mov         ecx,eax
 00047E59    mov         edx,20
 00047E5E    mov         eax,ebx
 00047E60    call        TControl.Perform
 00047E65    pop         ecx
 00047E66    pop         edx
 00047E67    pop         ebx
 00047E68    ret
*}
end;

//00047E6C
procedure TWinControl.CMBorderChanged(var Message:TMessage);
begin
{*
 00047E6C    push        esi
 00047E6D    mov         esi,eax
 00047E6F    mov         eax,esi
 00047E71    mov         ecx,dword ptr [eax]
 00047E73    call        dword ptr [ecx-10]
 00047E76    mov         eax,esi
 00047E78    call        TWinControl.HandleAllocated
 00047E7D    test        al,al
>00047E7F    je          00047E9A
 00047E81    push        37
 00047E83    push        0
 00047E85    push        0
 00047E87    push        0
 00047E89    push        0
 00047E8B    push        0
 00047E8D    mov         eax,esi
 00047E8F    call        TWinControl.GetHandle
 00047E94    push        eax
 00047E95    call        user32.SetWindowPos
 00047E9A    pop         esi
 00047E9B    ret
*}
end;

//00047E9C
procedure TWinControl.CMCtl3DChanged(var Message:TMessage);
begin
{*
 00047E9C    push        ebx
 00047E9D    mov         ebx,eax
 00047E9F    test        byte ptr [ebx+40],10
>00047EA3    je          00047ECD
 00047EA5    cmp         dword ptr [ebx+24],0
>00047EA9    je          00047ECD
 00047EAB    mov         eax,ebx
 00047EAD    call        TWinControl.HandleAllocated
 00047EB2    test        al,al
>00047EB4    je          00047ECD
 00047EB6    mov         eax,dword ptr [ebx+140]
 00047EBC    push        eax
 00047EBD    call        user32.IsWindowVisible
 00047EC2    test        eax,eax
>00047EC4    je          00047ECD
 00047EC6    mov         eax,ebx
 00047EC8    call        TWinControl.InvalidateFrame
 00047ECD    mov         dx,0B011
 00047ED1    mov         eax,ebx
 00047ED3    call        TWinControl.NotifyControls
 00047ED8    pop         ebx
 00047ED9    ret
*}
end;

//00047EDC
procedure TWinControl.CMParentCtl3DChanged(var Message:TMessage);
begin
{*
 00047EDC    push        ebx
 00047EDD    mov         ebx,eax
 00047EDF    cmp         byte ptr [ebx+164],0
>00047EE6    je          00047F17
 00047EE8    cmp         dword ptr [edx+4],0
>00047EEC    je          00047F00
 00047EEE    cmp         dword ptr [edx+8],0
 00047EF2    setne       al
 00047EF5    mov         edx,eax
 00047EF7    mov         eax,ebx
 00047EF9    call        TWinControl.SetCtl3D
>00047EFE    jmp         00047F10
 00047F00    mov         eax,dword ptr [ebx+24]
 00047F03    mov         dl,byte ptr [eax+12C]
 00047F09    mov         eax,ebx
 00047F0B    call        TWinControl.SetCtl3D
 00047F10    mov         byte ptr [ebx+164],1
 00047F17    pop         ebx
 00047F18    ret
*}
end;

//00047F1C
procedure TWinControl.CMSysColorChange(var Message:TMessage);
begin
{*
 00047F1C    call        TWinControl.Broadcast
 00047F21    ret
*}
end;

//00047F24
procedure TWinControl.CMWinIniChange(var Message:TWMWinIniChange);
begin
{*
 00047F24    call        TWinControl.Broadcast
 00047F29    ret
*}
end;

//00047F2C
procedure TWinControl.CMFontChange;
begin
{*
 00047F2C    call        TWinControl.Broadcast
 00047F31    ret
*}
end;

//00047F34
procedure TWinControl.CMTimeChange;
begin
{*
 00047F34    call        TWinControl.Broadcast
 00047F39    ret
*}
end;

//00047F3C
procedure TWinControl.CMDrag(var Message:TCMDrag);
begin
{*
 00047F3C    push        ebx
 00047F3D    push        esi
 00047F3E    push        edi
 00047F3F    push        ebp
 00047F40    add         esp,0FFFFFFF8
 00047F43    mov         ebx,edx
 00047F45    mov         esi,eax
 00047F47    mov         edi,dword ptr [ebx+8]
 00047F4A    mov         al,byte ptr [ebx+4]
 00047F4D    sub         al,4
>00047F4F    jb          00047F57
 00047F51    dec         al
>00047F53    je          00047F69
>00047F55    jmp         00047F8B
 00047F57    cmp         dword ptr [edi+0C],0
>00047F5B    je          00047F8B
 00047F5D    mov         edx,ebx
 00047F5F    mov         eax,dword ptr [edi+0C]
 00047F62    call        TControl.DoDragMsg
>00047F67    jmp         00047F8B
 00047F69    mov         ecx,esp
 00047F6B    mov         edx,edi
 00047F6D    mov         eax,esi
 00047F6F    call        TControl.ScreenToClient
 00047F74    mov         edx,esp
 00047F76    xor         ecx,ecx
 00047F78    mov         eax,esi
 00047F7A    call        TWinControl.ControlAtPos
 00047F7F    mov         ebp,eax
 00047F81    mov         dword ptr [ebx+0C],ebp
 00047F84    test        ebp,ebp
>00047F86    jne         00047F8B
 00047F88    mov         dword ptr [ebx+0C],esi
 00047F8B    pop         ecx
 00047F8C    pop         edx
 00047F8D    pop         ebp
 00047F8E    pop         edi
 00047F8F    pop         esi
 00047F90    pop         ebx
 00047F91    ret
*}
end;

//00047F94
procedure TWinControl.CMControlListChange(var Message:TMessage);
begin
{*
 00047F94    push        ebx
 00047F95    mov         ecx,dword ptr [eax+24]
 00047F98    test        ecx,ecx
>00047F9A    je          00047FA4
 00047F9C    mov         ebx,ecx
 00047F9E    mov         eax,dword ptr [ebx+2C]
 00047FA1    call        dword ptr [ebx+28]
 00047FA4    pop         ebx
 00047FA5    ret
*}
end;

//00047FA8
procedure TWinControl.CMSysFontChanged(var Message:TMessage);
begin
{*
 00047FA8    push        ebx
 00047FA9    push        esi
 00047FAA    mov         esi,edx
 00047FAC    mov         ebx,eax
 00047FAE    mov         edx,esi
 00047FB0    mov         eax,ebx
 00047FB2    call        TControl.CMSysFontChanged
 00047FB7    mov         edx,esi
 00047FB9    mov         eax,ebx
 00047FBB    call        TWinControl.Broadcast
 00047FC0    pop         esi
 00047FC1    pop         ebx
 00047FC2    ret
*}
end;

//00047FC4
function TWinControl.IsMenuKey(var Message:TWMKey):Boolean;
begin
{*
 00047FC4    push        ebx
 00047FC5    push        esi
 00047FC6    push        edi
 00047FC7    push        ebp
 00047FC8    add         esp,0FFFFFFF8
 00047FCB    mov         ebp,edx
 00047FCD    mov         dword ptr [esp],eax
 00047FD0    mov         byte ptr [esp+4],1
 00047FD5    mov         eax,dword ptr [esp]
 00047FD8    test        byte ptr [eax+20],10
>00047FDC    jne         00048033
 00047FDE    mov         esi,dword ptr [esp]
 00047FE1    test        esi,esi
>00047FE3    je          00048014
 00047FE5    mov         eax,esi
 00047FE7    mov         bx,0FFDC
 00047FEB    call        @CallDynaInst
 00047FF0    mov         edi,eax
 00047FF2    test        edi,edi
>00047FF4    je          0004800D
 00047FF6    cmp         dword ptr [edi+2C],0
>00047FFA    je          0004800D
 00047FFC    mov         edx,ebp
 00047FFE    mov         eax,edi
 00048000    mov         bx,0FFF0
 00048004    call        @CallDynaInst
 00048009    test        al,al
>0004800B    jne         0004804D
 0004800D    mov         esi,dword ptr [esi+24]
 00048010    test        esi,esi
>00048012    jne         00047FE5
 00048014    mov         eax,dword ptr [esp]
 00048017    call        GetParentForm
 0004801C    mov         esi,eax
 0004801E    test        esi,esi
>00048020    je          00048033
 00048022    mov         edx,ebp
 00048024    mov         eax,esi
 00048026    mov         bx,0FFB1
 0004802A    call        @CallDynaInst
 0004802F    test        al,al
>00048031    jne         0004804D
 00048033    mov         ecx,dword ptr [ebp+8]
 00048036    movzx       edx,word ptr [ebp+4]
 0004803A    mov         eax,0B016
 0004803F    call        SendAppMessage
 00048044    test        eax,eax
>00048046    jne         0004804D
 00048048    mov         byte ptr [esp+4],0
 0004804D    mov         al,byte ptr [esp+4]
 00048051    pop         ecx
 00048052    pop         edx
 00048053    pop         ebp
 00048054    pop         edi
 00048055    pop         esi
 00048056    pop         ebx
 00048057    ret
*}
end;

//00048058
procedure TWinControl.CNKeyDown(var Message:TWMKeyDown);
begin
{*
 00048058    push        ebx
 00048059    push        esi
 0004805A    push        edi
 0004805B    mov         esi,edx
 0004805D    mov         ebx,eax
 0004805F    mov         dword ptr [esi+0C],1
 00048066    mov         edx,esi
 00048068    mov         eax,ebx
 0004806A    call        TWinControl.IsMenuKey
 0004806F    test        al,al
>00048071    jne         0004812A
 00048077    test        byte ptr [ebx+20],10
>0004807B    jne         00048125
 00048081    push        ebx
 00048082    movzx       ecx,word ptr [esi+4]
 00048086    mov         edx,0B02E
 0004808B    mov         eax,ebx
 0004808D    call        TControl.Perform
 00048092    test        eax,eax
>00048094    jne         0004812A
 0004809A    xor         edi,edi
 0004809C    movzx       eax,word ptr [esi+4]
 000480A0    cmp         eax,1B
>000480A3    jg          000480B8
>000480A5    je          000480D5
 000480A7    sub         eax,3
>000480AA    je          000480D5
 000480AC    sub         eax,6
>000480AF    je          000480C7
 000480B1    sub         eax,4
>000480B4    je          000480D5
>000480B6    jmp         000480DA
 000480B8    add         eax,0FFFFFFDB
 000480BB    sub         eax,4
>000480BE    jb          000480CE
 000480C0    sub         eax,2
>000480C3    je          000480D5
>000480C5    jmp         000480DA
 000480C7    mov         edi,2
>000480CC    jmp         000480DA
 000480CE    mov         edi,1
>000480D3    jmp         000480DA
 000480D5    mov         edi,4
 000480DA    test        edi,edi
>000480DC    je          00048125
 000480DE    push        0
 000480E0    movzx       ecx,word ptr [esi+4]
 000480E4    mov         edx,0B01E
 000480E9    mov         eax,ebx
 000480EB    call        TControl.Perform
 000480F0    test        eax,eax
>000480F2    jne         00048125
 000480F4    push        0
 000480F6    xor         ecx,ecx
 000480F8    mov         edx,87
 000480FD    mov         eax,ebx
 000480FF    call        TControl.Perform
 00048104    test        eax,edi
>00048106    jne         00048125
 00048108    mov         eax,dword ptr [esi+8]
 0004810B    push        eax
 0004810C    mov         eax,ebx
 0004810E    call        GetParentForm
 00048113    movzx       ecx,word ptr [esi+4]
 00048117    mov         edx,0B005
 0004811C    call        TControl.Perform
 00048121    test        eax,eax
>00048123    jne         0004812A
 00048125    xor         eax,eax
 00048127    mov         dword ptr [esi+0C],eax
 0004812A    pop         edi
 0004812B    pop         esi
 0004812C    pop         ebx
 0004812D    ret
*}
end;

//00048130
procedure TWinControl.CNKeyUp(var Message:TWMKeyUp);
begin
{*
 00048130    push        ebx
 00048131    push        esi
 00048132    push        edi
 00048133    mov         esi,edx
 00048135    mov         ebx,eax
 00048137    test        byte ptr [ebx+20],10
>0004813B    jne         0004817D
 0004813D    mov         di,word ptr [esi+4]
 00048141    movzx       eax,di
 00048144    cmp         eax,1B
>00048147    jg          0004815C
>00048149    je          00048169
 0004814B    sub         eax,3
>0004814E    je          00048169
 00048150    sub         eax,6
>00048153    je          00048169
 00048155    sub         eax,4
>00048158    je          00048169
>0004815A    jmp         0004817D
 0004815C    add         eax,0FFFFFFDB
 0004815F    sub         eax,4
>00048162    jb          00048169
 00048164    sub         eax,2
>00048167    jne         0004817D
 00048169    push        0
 0004816B    movzx       ecx,di
 0004816E    mov         edx,0B01E
 00048173    mov         eax,ebx
 00048175    call        TControl.Perform
 0004817A    mov         dword ptr [esi+0C],eax
 0004817D    pop         edi
 0004817E    pop         esi
 0004817F    pop         ebx
 00048180    ret
*}
end;

//00048184
procedure TWinControl.CNChar(var Message:TWMChar);
begin
{*
 00048184    push        ebx
 00048185    push        esi
 00048186    mov         esi,edx
 00048188    mov         ebx,eax
 0004818A    test        byte ptr [ebx+20],10
>0004818E    jne         000481CD
 00048190    mov         dword ptr [esi+0C],1
 00048197    push        0
 00048199    xor         ecx,ecx
 0004819B    mov         edx,87
 000481A0    mov         eax,ebx
 000481A2    call        TControl.Perform
 000481A7    test        al,80
>000481A9    jne         000481C8
 000481AB    mov         eax,dword ptr [esi+8]
 000481AE    push        eax
 000481AF    mov         eax,ebx
 000481B1    call        GetParentForm
 000481B6    movzx       ecx,word ptr [esi+4]
 000481BA    mov         edx,0B006
 000481BF    call        TControl.Perform
 000481C4    test        eax,eax
>000481C6    jne         000481CD
 000481C8    xor         eax,eax
 000481CA    mov         dword ptr [esi+0C],eax
 000481CD    pop         esi
 000481CE    pop         ebx
 000481CF    ret
*}
end;

//000481D0
procedure TWinControl.CNSysKeyDown(var Message:TWMKeyDown);
begin
{*
 000481D0    push        ebx
 000481D1    push        esi
 000481D2    mov         esi,edx
 000481D4    mov         ebx,eax
 000481D6    mov         dword ptr [esi+0C],1
 000481DD    mov         edx,esi
 000481DF    mov         eax,ebx
 000481E1    call        TWinControl.IsMenuKey
 000481E6    test        al,al
>000481E8    jne         00048227
 000481EA    test        byte ptr [ebx+20],10
>000481EE    jne         00048222
 000481F0    push        ebx
 000481F1    movzx       ecx,word ptr [esi+4]
 000481F5    mov         edx,0B02E
 000481FA    mov         eax,ebx
 000481FC    call        TControl.Perform
 00048201    test        eax,eax
>00048203    jne         00048227
 00048205    mov         eax,dword ptr [esi+8]
 00048208    push        eax
 00048209    mov         eax,ebx
 0004820B    call        GetParentForm
 00048210    movzx       ecx,word ptr [esi+4]
 00048214    mov         edx,0B005
 00048219    call        TControl.Perform
 0004821E    test        eax,eax
>00048220    jne         00048227
 00048222    xor         eax,eax
 00048224    mov         dword ptr [esi+0C],eax
 00048227    pop         esi
 00048228    pop         ebx
 00048229    ret
*}
end;

//0004822C
procedure TWinControl.CNSysChar(var Message:TWMChar);
begin
{*
 0004822C    push        ebx
 0004822D    push        esi
 0004822E    mov         esi,edx
 00048230    mov         ebx,eax
 00048232    test        byte ptr [ebx+20],10
>00048236    jne         0004825B
 00048238    cmp         word ptr [esi+4],20
>0004823D    je          0004825B
 0004823F    mov         eax,dword ptr [esi+8]
 00048242    push        eax
 00048243    mov         eax,ebx
 00048245    call        GetParentForm
 0004824A    movzx       ecx,word ptr [esi+4]
 0004824E    mov         edx,0B006
 00048253    call        TControl.Perform
 00048258    mov         dword ptr [esi+0C],eax
 0004825B    pop         esi
 0004825C    pop         ebx
 0004825D    ret
*}
end;

//00048260
procedure TWinControl.SetBounds(ALeft:Integer; ATop:Integer; AWidth:Integer; AHeight:Integer);
begin
{*
 00048260    push        ebp
 00048261    mov         ebp,esp
 00048263    add         esp,0FFFFFFBC
 00048266    push        ebx
 00048267    push        esi
 00048268    push        edi
 00048269    mov         dword ptr [ebp-8],ecx
 0004826C    mov         dword ptr [ebp-4],edx
 0004826F    mov         esi,eax
 00048271    mov         ebx,dword ptr [ebp+0C]
 00048274    mov         eax,dword ptr [ebp-4]
 00048277    cmp         eax,dword ptr [esi+30]
>0004827A    jne         00048295
 0004827C    mov         eax,dword ptr [ebp-8]
 0004827F    cmp         eax,dword ptr [esi+34]
>00048282    jne         00048295
 00048284    cmp         ebx,dword ptr [esi+38]
>00048287    jne         00048295
 00048289    mov         eax,dword ptr [ebp+8]
 0004828C    cmp         eax,dword ptr [esi+3C]
>0004828F    je          00048346
 00048295    mov         eax,esi
 00048297    call        TWinControl.HandleAllocated
 0004829C    test        al,al
>0004829E    je          000482CF
 000482A0    mov         eax,dword ptr [esi+140]
 000482A6    push        eax
 000482A7    call        user32.IsIconic
 000482AC    test        eax,eax
>000482AE    jne         000482CF
 000482B0    push        14
 000482B2    mov         eax,dword ptr [ebp+8]
 000482B5    push        eax
 000482B6    push        ebx
 000482B7    mov         eax,dword ptr [ebp-8]
 000482BA    push        eax
 000482BB    mov         eax,dword ptr [ebp-4]
 000482BE    push        eax
 000482BF    push        0
 000482C1    mov         eax,dword ptr [esi+140]
 000482C7    push        eax
 000482C8    call        user32.SetWindowPos
>000482CD    jmp         0004833B
 000482CF    mov         ecx,dword ptr [ebp+8]
 000482D2    mov         edx,ebx
 000482D4    mov         eax,esi
 000482D6    mov         edi,dword ptr [eax]
 000482D8    call        dword ptr [edi+30]
 000482DB    mov         eax,dword ptr [ebp-4]
 000482DE    mov         dword ptr [esi+30],eax
 000482E1    mov         eax,dword ptr [ebp-8]
 000482E4    mov         dword ptr [esi+34],eax
 000482E7    mov         dword ptr [esi+38],ebx
 000482EA    mov         eax,dword ptr [ebp+8]
 000482ED    mov         dword ptr [esi+3C],eax
 000482F0    mov         eax,esi
 000482F2    call        TWinControl.HandleAllocated
 000482F7    test        al,al
>000482F9    je          0004833B
 000482FB    mov         dword ptr [ebp-34],2C
 00048302    lea         eax,[ebp-34]
 00048305    push        eax
 00048306    mov         eax,dword ptr [esi+140]
 0004830C    push        eax
 0004830D    call        user32.GetWindowPlacement
 00048312    lea         edx,[ebp-44]
 00048315    mov         eax,esi
 00048317    call        TControl.GetBoundsRect
 0004831C    push        esi
 0004831D    lea         esi,[ebp-44]
 00048320    lea         edi,[ebp-18]
 00048323    mov         ecx,4
 00048328    rep movs    dword ptr [edi],dword ptr [esi]
 0004832A    pop         esi
 0004832B    lea         eax,[ebp-34]
 0004832E    push        eax
 0004832F    mov         eax,dword ptr [esi+140]
 00048335    push        eax
 00048336    call        user32.SetWindowPlacement
 0004833B    mov         eax,esi
 0004833D    mov         bx,0FFD6
 00048341    call        @CallDynaInst
 00048346    pop         edi
 00048347    pop         esi
 00048348    pop         ebx
 00048349    mov         esp,ebp
 0004834B    pop         ebp
 0004834C    ret         8
*}
end;

//00048350
procedure TWinControl.ScaleControls(M:Integer; D:Integer);
begin
{*
 00048350    push        ebx
 00048351    push        esi
 00048352    push        edi
 00048353    push        ebp
 00048354    add         esp,0FFFFFFF8
 00048357    mov         dword ptr [esp+4],ecx
 0004835B    mov         dword ptr [esp],edx
 0004835E    mov         ebp,eax
 00048360    mov         eax,ebp
 00048362    call        TWinControl.GetControlCount
 00048367    mov         esi,eax
 00048369    dec         esi
 0004836A    test        esi,esi
>0004836C    jl          0004838E
 0004836E    inc         esi
 0004836F    xor         edi,edi
 00048371    mov         edx,edi
 00048373    mov         eax,ebp
 00048375    call        TWinControl.GetControl
 0004837A    mov         ecx,dword ptr [esp+4]
 0004837E    mov         edx,dword ptr [esp]
 00048381    mov         bx,0FFED
 00048385    call        @CallDynaInst
 0004838A    inc         edi
 0004838B    dec         esi
>0004838C    jne         00048371
 0004838E    pop         ecx
 0004838F    pop         edx
 00048390    pop         ebp
 00048391    pop         edi
 00048392    pop         esi
 00048393    pop         ebx
 00048394    ret
*}
end;

//00048398
procedure TWinControl.ChangeScale(M:Integer; D:Integer);
begin
{*
 00048398    push        ebp
 00048399    mov         ebp,esp
 0004839B    push        ecx
 0004839C    push        ebx
 0004839D    push        esi
 0004839E    mov         esi,ecx
 000483A0    mov         ebx,edx
 000483A2    mov         dword ptr [ebp-4],eax
 000483A5    mov         eax,dword ptr [ebp-4]
 000483A8    call        TWinControl.DisableAlign
 000483AD    xor         eax,eax
 000483AF    push        ebp
 000483B0    push        483E9
 000483B5    push        dword ptr fs:[eax]
 000483B8    mov         dword ptr fs:[eax],esp
 000483BB    mov         ecx,esi
 000483BD    mov         edx,ebx
 000483BF    mov         eax,dword ptr [ebp-4]
 000483C2    call        TWinControl.ScaleControls
 000483C7    mov         ecx,esi
 000483C9    mov         edx,ebx
 000483CB    mov         eax,dword ptr [ebp-4]
 000483CE    call        TControl.ChangeScale
 000483D3    xor         eax,eax
 000483D5    pop         edx
 000483D6    pop         ecx
 000483D7    pop         ecx
 000483D8    mov         dword ptr fs:[eax],edx
 000483DB    push        483F0
 000483E0    mov         eax,dword ptr [ebp-4]
 000483E3    call        TWinControl.EnableAlign
 000483E8    ret
>000483E9    jmp         @HandleFinally
>000483EE    jmp         000483E0
 000483F0    pop         esi
 000483F1    pop         ebx
 000483F2    pop         ecx
 000483F3    pop         ebp
 000483F4    ret
*}
end;

//000483F8
procedure TWinControl.ScaleBy(M:Integer; D:Integer);
begin
{*
 000483F8    push        ebx
 000483F9    push        esi
 000483FA    push        edi
 000483FB    add         esp,0FFFFFFEC
 000483FE    mov         edi,ecx
 00048400    mov         ebx,edx
 00048402    mov         esi,eax
 00048404    mov         eax,esi
 00048406    call        TWinControl.HandleAllocated
 0004840B    test        al,al
>0004840D    je          00048420
 0004840F    mov         eax,esi
 00048411    call        TWinControl.GetHandle
 00048416    push        eax
 00048417    call        user32.IsWindowVisible
 0004841C    test        eax,eax
>0004841E    jne         00048424
 00048420    xor         eax,eax
>00048422    jmp         00048426
 00048424    mov         al,1
 00048426    mov         byte ptr [esp],al
 00048429    cmp         byte ptr [esp],0
>0004842D    je          0004844B
 0004842F    push        97
 00048434    push        0
 00048436    push        0
 00048438    push        0
 0004843A    push        0
 0004843C    push        0
 0004843E    mov         eax,esi
 00048440    call        TWinControl.GetHandle
 00048445    push        eax
 00048446    call        user32.SetWindowPos
 0004844B    lea         edx,[esp+4]
 0004844F    mov         eax,esi
 00048451    call        TControl.GetBoundsRect
 00048456    mov         ecx,edi
 00048458    mov         edx,ebx
 0004845A    mov         eax,esi
 0004845C    mov         bx,0FFED
 00048460    call        @CallDynaInst
 00048465    mov         eax,dword ptr [esi+38]
 00048468    push        eax
 00048469    mov         eax,dword ptr [esi+3C]
 0004846C    push        eax
 0004846D    mov         ecx,dword ptr [esp+10]
 00048471    mov         edx,dword ptr [esp+0C]
 00048475    mov         eax,esi
 00048477    mov         ebx,dword ptr [eax]
 00048479    call        dword ptr [ebx+80]
 0004847F    cmp         byte ptr [esp],0
>00048483    je          0004849E
 00048485    push        57
 00048487    push        0
 00048489    push        0
 0004848B    push        0
 0004848D    push        0
 0004848F    push        0
 00048491    mov         eax,esi
 00048493    call        TWinControl.GetHandle
 00048498    push        eax
 00048499    call        user32.SetWindowPos
 0004849E    add         esp,14
 000484A1    pop         edi
 000484A2    pop         esi
 000484A3    pop         ebx
 000484A4    ret
*}
end;

//000484A8
procedure TWinControl.ScrollBy(DeltaX:Integer; DeltaY:Integer);
begin
{*
 000484A8    push        ebx
 000484A9    push        esi
 000484AA    push        edi
 000484AB    push        ebp
 000484AC    add         esp,0FFFFFFF4
 000484AF    mov         dword ptr [esp+4],ecx
 000484B3    mov         dword ptr [esp],edx
 000484B6    mov         edi,eax
 000484B8    mov         ebx,dword ptr [edi+140]
 000484BE    test        ebx,ebx
>000484C0    je          000484CC
 000484C2    push        ebx
 000484C3    call        user32.IsWindowVisible
 000484C8    test        eax,eax
>000484CA    jne         000484D0
 000484CC    xor         eax,eax
>000484CE    jmp         000484D2
 000484D0    mov         al,1
 000484D2    mov         byte ptr [esp+8],al
 000484D6    cmp         byte ptr [esp+8],0
>000484DB    je          000484F7
 000484DD    push        0
 000484DF    push        0
 000484E1    mov         eax,dword ptr [esp+0C]
 000484E5    push        eax
 000484E6    mov         eax,dword ptr [esp+0C]
 000484EA    push        eax
 000484EB    mov         eax,dword ptr [edi+140]
 000484F1    push        eax
 000484F2    call        user32.ScrollWindow
 000484F7    mov         eax,edi
 000484F9    call        TWinControl.GetControlCount
 000484FE    mov         esi,eax
 00048500    dec         esi
 00048501    test        esi,esi
>00048503    jl          00048571
 00048505    inc         esi
 00048506    xor         ebp,ebp
 00048508    mov         edx,ebp
 0004850A    mov         eax,edi
 0004850C    call        TWinControl.GetControl
 00048511    mov         ebx,eax
 00048513    mov         eax,ebx
 00048515    mov         edx,dword ptr ds:[3F0BC];TWinControl
 0004851B    call        @IsClass
 00048520    test        al,al
>00048522    je          0004852D
 00048524    cmp         dword ptr [ebx+140],0
>0004852B    jne         0004853C
 0004852D    mov         eax,dword ptr [esp]
 00048530    add         dword ptr [ebx+30],eax
 00048533    mov         eax,dword ptr [esp+4]
 00048537    add         dword ptr [ebx+34],eax
>0004853A    jmp         0004856D
 0004853C    cmp         byte ptr [esp+8],0
>00048541    jne         0004856D
 00048543    push        14
 00048545    mov         eax,ebx
 00048547    mov         edx,dword ptr [eax+3C]
 0004854A    push        edx
 0004854B    mov         edx,dword ptr [eax+38]
 0004854E    push        edx
 0004854F    mov         edx,dword ptr [eax+34]
 00048552    add         edx,dword ptr [esp+10]
 00048556    push        edx
 00048557    mov         edx,dword ptr [eax+30]
 0004855A    add         edx,dword ptr [esp+10]
 0004855E    push        edx
 0004855F    push        0
 00048561    mov         eax,dword ptr [eax+140]
 00048567    push        eax
 00048568    call        user32.SetWindowPos
 0004856D    inc         ebp
 0004856E    dec         esi
>0004856F    jne         00048508
 00048571    mov         eax,edi
 00048573    call        TWinControl.Realign
 00048578    add         esp,0C
 0004857B    pop         ebp
 0004857C    pop         edi
 0004857D    pop         esi
 0004857E    pop         ebx
 0004857F    ret
*}
end;

//00048580
procedure TWinControl.ShowControl(AControl:TControl);
begin
{*
 00048580    push        esi
 00048581    mov         esi,dword ptr [eax+24]
 00048584    test        esi,esi
>00048586    je          00048594
 00048588    mov         edx,eax
 0004858A    mov         eax,esi
 0004858C    mov         ecx,dword ptr [eax]
 0004858E    call        dword ptr [ecx+0B0]
 00048594    pop         esi
 00048595    ret
*}
end;

//00048598
procedure TWinControl.SetZOrderPosition(Position:Integer);
begin
{*
 00048598    push        ebx
 00048599    push        esi
 0004859A    push        edi
 0004859B    push        ebp
 0004859C    mov         esi,edx
 0004859E    mov         ebx,eax
 000485A0    mov         eax,dword ptr [ebx+24]
 000485A3    test        eax,eax
>000485A5    je          0004866A
 000485AB    mov         edx,dword ptr [eax+128]
 000485B1    test        edx,edx
>000485B3    je          000485B8
 000485B5    sub         esi,dword ptr [edx+8]
 000485B8    mov         eax,dword ptr [eax+184]
 000485BE    mov         edx,ebx
 000485C0    call        TList.IndexOf
 000485C5    mov         edi,eax
 000485C7    test        edi,edi
>000485C9    jl          00048603
 000485CB    mov         eax,dword ptr [ebx+24]
 000485CE    mov         edx,dword ptr [eax+184]
 000485D4    mov         eax,dword ptr [edx+8]
 000485D7    test        esi,esi
>000485D9    jge         000485DD
 000485DB    xor         esi,esi
 000485DD    cmp         eax,esi
>000485DF    jg          000485E4
 000485E1    mov         esi,eax
 000485E3    dec         esi
 000485E4    cmp         edi,esi
>000485E6    je          00048603
 000485E8    mov         eax,edx
 000485EA    mov         edx,edi
 000485EC    call        TList.Delete
 000485F1    mov         eax,dword ptr [ebx+24]
 000485F4    mov         eax,dword ptr [eax+184]
 000485FA    mov         ecx,ebx
 000485FC    mov         edx,esi
 000485FE    call        TList.Insert
 00048603    cmp         dword ptr [ebx+140],0
>0004860A    je          0004866A
 0004860C    test        esi,esi
>0004860E    jne         00048617
 00048610    mov         eax,1
>00048615    jmp         00048653
 00048617    mov         eax,dword ptr [ebx+24]
 0004861A    mov         ebp,dword ptr [eax+184]
 00048620    mov         eax,dword ptr [ebp+8]
 00048623    dec         eax
 00048624    cmp         esi,eax
>00048626    jne         0004862C
 00048628    xor         eax,eax
>0004862A    jmp         00048653
 0004862C    cmp         edi,esi
>0004862E    jge         00048641
 00048630    lea         edx,[esi+1]
 00048633    mov         eax,ebp
 00048635    call        TList.Get
 0004863A    call        TWinControl.GetHandle
>0004863F    jmp         00048653
 00048641    cmp         edi,esi
>00048643    jle         0004866A
 00048645    mov         eax,ebp
 00048647    mov         edx,esi
 00048649    call        TList.Get
 0004864E    call        TWinControl.GetHandle
 00048653    push        3
 00048655    push        0
 00048657    push        0
 00048659    push        0
 0004865B    push        0
 0004865D    push        eax
 0004865E    mov         eax,dword ptr [ebx+140]
 00048664    push        eax
 00048665    call        user32.SetWindowPos
 0004866A    pop         ebp
 0004866B    pop         edi
 0004866C    pop         esi
 0004866D    pop         ebx
 0004866E    ret
*}
end;

//00048670
procedure TWinControl.SetZOrder(TopMost:Boolean);
begin
{*
 00048670    push        ebx
 00048671    push        esi
 00048672    mov         ebx,dword ptr [eax+24]
 00048675    test        ebx,ebx
>00048677    je          000486A6
 00048679    test        dl,dl
>0004867B    je          00048689
 0004867D    mov         edx,dword ptr [ebx+184]
 00048683    mov         ecx,dword ptr [edx+8]
 00048686    dec         ecx
>00048687    jmp         0004868B
 00048689    xor         ecx,ecx
 0004868B    xor         edx,edx
 0004868D    mov         esi,dword ptr [ebx+128]
 00048693    test        esi,esi
>00048695    je          0004869A
 00048697    mov         edx,dword ptr [esi+8]
 0004869A    add         ecx,edx
 0004869C    mov         edx,ecx
 0004869E    call        TWinControl.SetZOrderPosition
 000486A3    pop         esi
 000486A4    pop         ebx
 000486A5    ret
 000486A6    mov         ecx,dword ptr [eax+140]
 000486AC    test        ecx,ecx
>000486AE    je          000486CC
 000486B0    push        3
 000486B2    push        0
 000486B4    push        0
 000486B6    push        0
 000486B8    push        0
 000486BA    and         edx,7F
 000486BD    movzx       edx,word ptr [edx*2+0B4840];WINDOWPOS
 000486C5    push        edx
 000486C6    push        ecx
 000486C7    call        user32.SetWindowPos
 000486CC    pop         esi
 000486CD    pop         ebx
 000486CE    ret
*}
end;

//000486D0
function TWinControl.GetDeviceContext(var WindowHandle:HWND):HDC;
begin
{*
 000486D0    push        ebp
 000486D1    mov         ebp,esp
 000486D3    push        0
 000486D5    push        ebx
 000486D6    push        esi
 000486D7    push        edi
 000486D8    mov         edi,edx
 000486DA    mov         ebx,eax
 000486DC    xor         eax,eax
 000486DE    push        ebp
 000486DF    push        48757
 000486E4    push        dword ptr fs:[eax]
 000486E7    mov         dword ptr fs:[eax],esp
 000486EA    test        byte ptr [ebx+20],10
>000486EE    je          00048705
 000486F0    push        12
 000486F2    push        0
 000486F4    mov         eax,ebx
 000486F6    call        TWinControl.GetHandle
 000486FB    push        eax
 000486FC    call        user32.GetDCEx
 00048701    mov         esi,eax
>00048703    jmp         00048714
 00048705    mov         eax,ebx
 00048707    call        TWinControl.GetHandle
 0004870C    push        eax
 0004870D    call        user32.GetDC
 00048712    mov         esi,eax
 00048714    test        esi,esi
>00048716    jne         00048739
 00048718    lea         edx,[ebp-4]
 0004871B    mov         eax,[000B59C4];^SWindowDCError:TResStringRec
 00048720    call        LoadResString
 00048725    mov         ecx,dword ptr [ebp-4]
 00048728    mov         dl,1
 0004872A    mov         eax,[0001EE08];EOutOfResources
 0004872F    call        Exception.Create
 00048734    call        @RaiseExcept
 00048739    mov         eax,dword ptr [ebx+140]
 0004873F    mov         dword ptr [edi],eax
 00048741    xor         eax,eax
 00048743    pop         edx
 00048744    pop         ecx
 00048745    pop         ecx
 00048746    mov         dword ptr fs:[eax],edx
 00048749    push        4875E
 0004874E    lea         eax,[ebp-4]
 00048751    call        @LStrClr
 00048756    ret
>00048757    jmp         @HandleFinally
>0004875C    jmp         0004874E
 0004875E    mov         eax,esi
 00048760    pop         edi
 00048761    pop         esi
 00048762    pop         ebx
 00048763    pop         ecx
 00048764    pop         ebp
 00048765    ret
*}
end;

//00048768
procedure TWinControl.Invalidate;
begin
{*
 00048768    push        0
 0004876A    xor         ecx,ecx
 0004876C    mov         edx,0B034
 00048771    call        TControl.Perform
 00048776    ret
*}
end;

//00048778
procedure TWinControl.CMInvalidate(var Message:TMessage);
begin
{*
 00048778    push        ebx
 00048779    push        esi
 0004877A    mov         esi,edx
 0004877C    mov         ebx,eax
 0004877E    mov         eax,ebx
 00048780    call        TWinControl.HandleAllocated
 00048785    test        al,al
>00048787    je          000487C3
 00048789    mov         eax,dword ptr [ebx+24]
 0004878C    test        eax,eax
>0004878E    je          000487A1
 00048790    push        0
 00048792    mov         ecx,1
 00048797    mov         edx,0B034
 0004879C    call        TControl.Perform
 000487A1    cmp         dword ptr [esi+4],0
>000487A5    jne         000487C3
 000487A7    test        byte ptr [ebx+40],40
 000487AB    setne       al
 000487AE    xor         al,1
 000487B0    neg         al
 000487B2    sbb         eax,eax
 000487B4    push        eax
 000487B5    push        0
 000487B7    mov         eax,dword ptr [ebx+140]
 000487BD    push        eax
 000487BE    call        user32.InvalidateRect
 000487C3    pop         esi
 000487C4    pop         ebx
 000487C5    ret
*}
end;

//000487C8
procedure TWinControl.Update;
begin
{*
 000487C8    push        ebx
 000487C9    mov         ebx,eax
 000487CB    mov         eax,ebx
 000487CD    call        TWinControl.HandleAllocated
 000487D2    test        al,al
>000487D4    je          000487E2
 000487D6    mov         eax,dword ptr [ebx+140]
 000487DC    push        eax
 000487DD    call        user32.UpdateWindow
 000487E2    pop         ebx
 000487E3    ret
*}
end;

//000487E4
procedure TWinControl.Repaint;
begin
{*
 000487E4    push        ebx
 000487E5    mov         ebx,eax
 000487E7    mov         eax,ebx
 000487E9    mov         edx,dword ptr [eax]
 000487EB    call        dword ptr [edx+78]
 000487EE    mov         eax,ebx
 000487F0    mov         edx,dword ptr [eax]
 000487F2    call        dword ptr [edx+84]
 000487F8    pop         ebx
 000487F9    ret
*}
end;

//000487FC
procedure TWinControl.InvalidateFrame;
begin
{*
 000487FC    push        ebx
 000487FD    add         esp,0FFFFFFF0
 00048800    mov         ebx,eax
 00048802    mov         edx,esp
 00048804    mov         eax,ebx
 00048806    call        TControl.GetBoundsRect
 0004880B    push        1
 0004880D    push        1
 0004880F    lea         eax,[esp+8]
 00048813    push        eax
 00048814    call        user32.InflateRect
 00048819    push        0FF
 0004881B    lea         eax,[esp+4]
 0004881F    push        eax
 00048820    mov         eax,dword ptr [ebx+24]
 00048823    mov         eax,dword ptr [eax+140]
 00048829    push        eax
 0004882A    call        user32.InvalidateRect
 0004882F    add         esp,10
 00048832    pop         ebx
 00048833    ret
*}
end;

//00048834
function TWinControl.CanFocus:Boolean;
begin
{*
 00048834    push        ebx
 00048835    push        esi
 00048836    push        ecx
 00048837    mov         ebx,eax
 00048839    mov         byte ptr [esp],0
 0004883D    mov         eax,ebx
 0004883F    call        GetParentForm
 00048844    mov         esi,eax
 00048846    test        esi,esi
>00048848    je          0004886A
 0004884A    cmp         esi,ebx
>0004884C    je          00048866
 0004884E    cmp         byte ptr [ebx+47],0
>00048852    je          0004886A
 00048854    mov         eax,ebx
 00048856    mov         edx,dword ptr [eax]
 00048858    call        dword ptr [edx+50]
 0004885B    test        al,al
>0004885D    je          0004886A
 0004885F    mov         ebx,dword ptr [ebx+24]
 00048862    cmp         esi,ebx
>00048864    jne         0004884E
 00048866    mov         byte ptr [esp],1
 0004886A    mov         al,byte ptr [esp]
 0004886D    pop         edx
 0004886E    pop         esi
 0004886F    pop         ebx
 00048870    ret
*}
end;

//00048874
procedure TWinControl.SetFocus;
begin
{*
 00048874    push        ebx
 00048875    mov         ebx,eax
 00048877    mov         eax,ebx
 00048879    call        GetParentForm
 0004887E    test        eax,eax
>00048880    je          0004888B
 00048882    mov         edx,ebx
 00048884    call        TCustomForm.FocusControl
 00048889    pop         ebx
 0004888A    ret
 0004888B    cmp         dword ptr [ebx+168],0
>00048892    je          000488A3
 00048894    mov         eax,ebx
 00048896    call        TWinControl.GetHandle
 0004889B    push        eax
 0004889C    call        user32.SetFocus
>000488A1    jmp         000488AA
 000488A3    mov         eax,ebx
 000488A5    call        ValidParentForm
 000488AA    pop         ebx
 000488AB    ret
*}
end;

//000488AC
procedure TWinControl.Focused;
begin
{*
 000488AC    push        ebx
 000488AD    mov         ebx,eax
 000488AF    cmp         dword ptr [ebx+140],0
>000488B6    je          000488C5
 000488B8    call        user32.GetFocus
 000488BD    cmp         eax,dword ptr [ebx+140]
>000488C3    je          000488C9
 000488C5    xor         eax,eax
 000488C7    pop         ebx
 000488C8    ret
 000488C9    mov         al,1
 000488CB    pop         ebx
 000488CC    ret
*}
end;

//000488D0
procedure TWinControl.HandleNeeded;
begin
{*
 000488D0    push        ebx
 000488D1    mov         ebx,eax
 000488D3    cmp         dword ptr [ebx+140],0
>000488DA    jne         000488F2
 000488DC    mov         eax,dword ptr [ebx+24]
 000488DF    test        eax,eax
>000488E1    je          000488E8
 000488E3    call        TWinControl.HandleNeeded
 000488E8    mov         eax,ebx
 000488EA    mov         edx,dword ptr [eax]
 000488EC    call        dword ptr [edx+90]
 000488F2    pop         ebx
 000488F3    ret
*}
end;

//000488F4
function TWinControl.GetHandle:HWND;
begin
{*
 000488F4    push        ebx
 000488F5    mov         ebx,eax
 000488F7    mov         eax,ebx
 000488F9    call        TWinControl.HandleNeeded
 000488FE    mov         eax,dword ptr [ebx+140]
 00048904    pop         ebx
 00048905    ret
*}
end;

//00048908
function TWinControl.GetControlExtents:TRect;
begin
{*
 00048908    push        ebx
 00048909    push        esi
 0004890A    push        edi
 0004890B    push        ebp
 0004890C    mov         ebx,edx
 0004890E    mov         edi,eax
 00048910    push        0
 00048912    push        ebx
 00048913    xor         ecx,ecx
 00048915    mov         edx,7FFFFFFF
 0004891A    mov         eax,7FFFFFFF
 0004891F    call        Rect
 00048924    mov         eax,edi
 00048926    call        TWinControl.GetControlCount
 0004892B    mov         esi,eax
 0004892D    dec         esi
 0004892E    test        esi,esi
>00048930    jl          00048996
 00048932    inc         esi
 00048933    xor         ebp,ebp
 00048935    mov         edx,ebp
 00048937    mov         eax,edi
 00048939    call        TWinControl.GetControl
 0004893E    cmp         byte ptr [eax+47],0
>00048942    jne         00048950
 00048944    test        byte ptr [eax+20],10
>00048948    je          00048992
 0004894A    test        byte ptr [eax+41],4
>0004894E    jne         00048992
 00048950    mov         edx,dword ptr [ebx]
 00048952    cmp         edx,dword ptr [eax+30]
>00048955    jle         0004895C
 00048957    mov         edx,dword ptr [eax+30]
 0004895A    mov         dword ptr [ebx],edx
 0004895C    mov         edx,dword ptr [ebx+4]
 0004895F    cmp         edx,dword ptr [eax+34]
>00048962    jle         0004896A
 00048964    mov         edx,dword ptr [eax+34]
 00048967    mov         dword ptr [ebx+4],edx
 0004896A    mov         edx,dword ptr [eax+30]
 0004896D    add         edx,dword ptr [eax+38]
 00048970    cmp         edx,dword ptr [ebx+8]
>00048973    jle         0004897E
 00048975    mov         edx,dword ptr [eax+30]
 00048978    add         edx,dword ptr [eax+38]
 0004897B    mov         dword ptr [ebx+8],edx
 0004897E    mov         edx,dword ptr [eax+34]
 00048981    add         edx,dword ptr [eax+3C]
 00048984    cmp         edx,dword ptr [ebx+0C]
>00048987    jle         00048992
 00048989    mov         edx,dword ptr [eax+34]
 0004898C    add         edx,dword ptr [eax+3C]
 0004898F    mov         dword ptr [ebx+0C],edx
 00048992    inc         ebp
 00048993    dec         esi
>00048994    jne         00048935
 00048996    pop         ebp
 00048997    pop         edi
 00048998    pop         esi
 00048999    pop         ebx
 0004899A    ret
*}
end;

//0004899C
function TWinControl.GetClientOrigin:TPoint;
begin
{*
 0004899C    push        ebx
 0004899D    push        esi
 0004899E    mov         ebx,edx
 000489A0    mov         esi,eax
 000489A2    xor         eax,eax
 000489A4    mov         dword ptr [ebx],eax
 000489A6    xor         eax,eax
 000489A8    mov         dword ptr [ebx+4],eax
 000489AB    push        ebx
 000489AC    mov         eax,esi
 000489AE    call        TWinControl.GetHandle
 000489B3    push        eax
 000489B4    call        user32.ClientToScreen
 000489B9    pop         esi
 000489BA    pop         ebx
 000489BB    ret
*}
end;

//000489BC
function TWinControl.GetClientRect:TRect;
begin
{*
 000489BC    push        ebx
 000489BD    push        esi
 000489BE    mov         esi,edx
 000489C0    mov         ebx,eax
 000489C2    push        esi
 000489C3    mov         eax,ebx
 000489C5    call        TWinControl.GetHandle
 000489CA    push        eax
 000489CB    call        user32.GetClientRect
 000489D0    pop         esi
 000489D1    pop         ebx
 000489D2    ret
*}
end;

//000489D4
procedure TWinControl.AdjustSize;
begin
{*
 000489D4    push        ebx
 000489D5    push        esi
 000489D6    mov         esi,eax
 000489D8    test        byte ptr [esi+20],1
>000489DC    jne         00048A11
 000489DE    mov         eax,esi
 000489E0    call        TWinControl.HandleAllocated
 000489E5    test        al,al
>000489E7    je          00048A11
 000489E9    push        16
 000489EB    mov         eax,dword ptr [esi+3C]
 000489EE    push        eax
 000489EF    mov         eax,dword ptr [esi+38]
 000489F2    push        eax
 000489F3    push        0
 000489F5    push        0
 000489F7    push        0
 000489F9    mov         eax,esi
 000489FB    call        TWinControl.GetHandle
 00048A00    push        eax
 00048A01    call        user32.SetWindowPos
 00048A06    mov         eax,esi
 00048A08    mov         bx,0FFD6
 00048A0C    call        @CallDynaInst
 00048A11    pop         esi
 00048A12    pop         ebx
 00048A13    ret
*}
end;

//00048A14
procedure TWinControl.SetBorderWidth(Value:TBorderWidth);
begin
{*
 00048A14    cmp         edx,dword ptr [eax+120]
>00048A1A    je          00048A30
 00048A1C    mov         dword ptr [eax+120],edx
 00048A22    push        0
 00048A24    xor         ecx,ecx
 00048A26    mov         edx,0B03B
 00048A2B    call        TControl.Perform
 00048A30    ret
*}
end;

//00048A34
procedure TWinControl.SetCtl3D(Value:Boolean);
begin
{*
 00048A34    cmp         dl,byte ptr [eax+12C]
>00048A3A    je          00048A57
 00048A3C    mov         byte ptr [eax+12C],dl
 00048A42    mov         byte ptr [eax+164],0
 00048A49    push        0
 00048A4B    xor         ecx,ecx
 00048A4D    mov         edx,0B010
 00048A52    call        TControl.Perform
 00048A57    ret
*}
end;

//00048A58
function TWinControl.IsCtl3DStored(Value:Boolean):Boolean;
begin
{*
 00048A58    mov         al,byte ptr [eax+164]
 00048A5E    xor         al,1
 00048A60    ret
*}
end;

//00048A64
procedure TWinControl.SetParentCtl3D(Value:Boolean);
begin
{*
 00048A64    cmp         dl,byte ptr [eax+164]
>00048A6A    je          00048A86
 00048A6C    mov         byte ptr [eax+164],dl
 00048A72    cmp         dword ptr [eax+24],0
>00048A76    je          00048A86
 00048A78    push        0
 00048A7A    xor         ecx,ecx
 00048A7C    mov         edx,0B011
 00048A81    call        TControl.Perform
 00048A86    ret
*}
end;

//00048A88
function TWinControl.GetTabOrder:TTabOrder;
begin
{*
 00048A88    push        ebx
 00048A89    push        esi
 00048A8A    mov         ebx,eax
 00048A8C    mov         esi,dword ptr [ebx+24]
 00048A8F    test        esi,esi
>00048A91    je          00048AA3
 00048A93    mov         eax,dword ptr [esi+170]
 00048A99    mov         edx,ebx
 00048A9B    call        TList.IndexOf
 00048AA0    pop         esi
 00048AA1    pop         ebx
 00048AA2    ret
 00048AA3    or          eax,0FFFFFFFF
 00048AA6    pop         esi
 00048AA7    pop         ebx
 00048AA8    ret
*}
end;

//00048AAC
procedure TWinControl.UpdateTabOrder(Value:TTabOrder);
begin
{*
 00048AAC    push        ebx
 00048AAD    push        esi
 00048AAE    push        edi
 00048AAF    push        ebp
 00048AB0    mov         esi,edx
 00048AB2    mov         ebx,eax
 00048AB4    mov         eax,ebx
 00048AB6    call        TWinControl.GetTabOrder
 00048ABB    movsx       eax,ax
 00048ABE    test        eax,eax
>00048AC0    jl          00048B00
 00048AC2    mov         edx,dword ptr [ebx+24]
 00048AC5    mov         ebp,dword ptr [edx+170]
 00048ACB    mov         edx,dword ptr [ebp+8]
 00048ACE    test        si,si
>00048AD1    jge         00048AD5
 00048AD3    xor         esi,esi
 00048AD5    movsx       ecx,si
 00048AD8    cmp         edx,ecx
>00048ADA    jg          00048ADF
 00048ADC    mov         esi,edx
 00048ADE    dec         esi
 00048ADF    movsx       edi,si
 00048AE2    cmp         eax,edi
>00048AE4    je          00048B00
 00048AE6    mov         edx,ebp
 00048AE8    xchg        eax,edx
 00048AE9    call        TList.Delete
 00048AEE    mov         edx,edi
 00048AF0    mov         eax,dword ptr [ebx+24]
 00048AF3    mov         eax,dword ptr [eax+170]
 00048AF9    mov         ecx,ebx
 00048AFB    call        TList.Insert
 00048B00    pop         ebp
 00048B01    pop         edi
 00048B02    pop         esi
 00048B03    pop         ebx
 00048B04    ret
*}
end;

//00048B08
procedure TWinControl.SetTabOrder(Value:TTabOrder);
begin
{*
 00048B08    test        byte ptr [eax+44],8
>00048B0C    je          00048B18
 00048B0E    movsx       edx,dx
 00048B11    mov         dword ptr [eax+174],edx
 00048B17    ret
 00048B18    call        TWinControl.UpdateTabOrder
 00048B1D    ret
*}
end;

//00048B20
procedure TWinControl.SetTabStop(Value:Boolean);
begin
{*
 00048B20    push        ebx
 00048B21    push        esi
 00048B22    mov         ebx,edx
 00048B24    mov         esi,eax
 00048B26    cmp         bl,byte ptr [esi+178]
>00048B2C    je          00048B7A
 00048B2E    mov         byte ptr [esi+178],bl
 00048B34    mov         eax,esi
 00048B36    call        TWinControl.HandleAllocated
 00048B3B    test        al,al
>00048B3D    je          00048B6A
 00048B3F    push        0F0
 00048B41    mov         eax,dword ptr [esi+140]
 00048B47    push        eax
 00048B48    call        user32.GetWindowLongA
 00048B4D    and         eax,0FFFEFFFF
 00048B52    test        bl,bl
>00048B54    je          00048B5B
 00048B56    or          eax,10000
 00048B5B    push        eax
 00048B5C    push        0F0
 00048B5E    mov         eax,dword ptr [esi+140]
 00048B64    push        eax
 00048B65    call        user32.SetWindowLongA
 00048B6A    push        0
 00048B6C    xor         ecx,ecx
 00048B6E    mov         edx,0B028
 00048B73    mov         eax,esi
 00048B75    call        TControl.Perform
 00048B7A    pop         esi
 00048B7B    pop         ebx
 00048B7C    ret
*}
end;

//00048B80
procedure TWinControl.UpdateLastResize(NewWidth:Integer; NewHeight:Integer);
begin
{*
 00048B80    push        ebx
 00048B81    push        esi
 00048B82    push        edi
 00048B83    push        ebp
 00048B84    mov         ebp,ecx
 00048B86    mov         edi,edx
 00048B88    mov         ebx,eax
 00048B8A    mov         ecx,ebp
 00048B8C    mov         edx,edi
 00048B8E    mov         eax,ebx
 00048B90    call        TControl.UpdateLastResize
 00048B95    mov         al,byte ptr [ebx+20];TWinControl.FComponentState:TComponentState
 00048B98    and         al,byte ptr ds:[48CA4];0x3 gvar_00048CA4
 00048B9E    mov         dl,byte ptr ds:[48CA8];0x0 gvar_00048CA8
 00048BA4    cmp         dl,al
>00048BA6    jne         00048C9F
 00048BAC    mov         eax,ebx
 00048BAE    call        TWinControl.HandleAllocated
 00048BB3    test        al,al
>00048BB5    jne         00048BD2
 00048BB7    mov         esi,dword ptr [ebx+24];TWinControl.FParent:TWinControl
 00048BBA    test        esi,esi
>00048BBC    je          00048BD4
 00048BBE    mov         eax,esi
 00048BC0    call        TWinControl.HandleAllocated
 00048BC5    test        al,al
>00048BC7    jne         00048BD4
 00048BC9    mov         esi,dword ptr [esi+24];TWinControl.FParent:TWinControl
 00048BCC    test        esi,esi
>00048BCE    jne         00048BBE
>00048BD0    jmp         00048BD4
 00048BD2    mov         esi,ebx
 00048BD4    test        esi,esi
>00048BD6    je          00048C9F
 00048BDC    mov         eax,edi
 00048BDE    sub         eax,dword ptr [ebx+38]
 00048BE1    test        eax,eax
>00048BE3    je          00048BED
 00048BE5    add         dword ptr [ebx+158],eax;TWinControl.FLastResize:TPoint
>00048BEB    jmp         00048C2B
 00048BED    mov         eax,ebx
 00048BEF    call        TWinControl.HandleAllocated
 00048BF4    test        al,al
>00048BF6    je          00048C2B
 00048BF8    cmp         dword ptr [ebx+150],0;TWinControl.FLastClientWidth:Integer
>00048BFF    jle         00048C2B
 00048C01    mov         eax,ebx
 00048C03    call        TControl.GetClientWidth
 00048C08    cmp         eax,dword ptr [ebx+150];TWinControl.FLastClientWidth:Integer
>00048C0E    je          00048C2B
 00048C10    mov         eax,ebx
 00048C12    call        TControl.GetClientWidth
 00048C17    mov         edx,dword ptr [ebx+150];TWinControl.FLastClientWidth:Integer
 00048C1D    add         edx,dword ptr [ebx+158];TWinControl.FLastResize:TPoint
 00048C23    sub         eax,edx
 00048C25    add         dword ptr [ebx+158],eax;TWinControl.FLastResize:TPoint
 00048C2B    mov         eax,ebp
 00048C2D    sub         eax,dword ptr [ebx+3C]
 00048C30    test        eax,eax
>00048C32    je          00048C3C
 00048C34    add         dword ptr [ebx+15C],eax
>00048C3A    jmp         00048C7A
 00048C3C    mov         eax,ebx
 00048C3E    call        TWinControl.HandleAllocated
 00048C43    test        al,al
>00048C45    je          00048C7A
 00048C47    cmp         dword ptr [ebx+154],0;TWinControl.FLastClientHeight:Integer
>00048C4E    jle         00048C7A
 00048C50    mov         eax,ebx
 00048C52    call        TControl.GetClientHeight
 00048C57    cmp         eax,dword ptr [ebx+154];TWinControl.FLastClientHeight:Integer
>00048C5D    je          00048C7A
 00048C5F    mov         eax,ebx
 00048C61    call        TControl.GetClientHeight
 00048C66    mov         edx,dword ptr [ebx+154];TWinControl.FLastClientHeight:Integer
 00048C6C    add         edx,dword ptr [ebx+15C]
 00048C72    sub         eax,edx
 00048C74    add         dword ptr [ebx+15C],eax
 00048C7A    mov         eax,ebx
 00048C7C    call        TWinControl.HandleAllocated
 00048C81    test        al,al
>00048C83    je          00048C9F
 00048C85    mov         eax,ebx
 00048C87    call        TControl.GetClientWidth
 00048C8C    mov         dword ptr [ebx+150],eax;TWinControl.FLastClientWidth:Integer
 00048C92    mov         eax,ebx
 00048C94    call        TControl.GetClientHeight
 00048C99    mov         dword ptr [ebx+154],eax;TWinControl.FLastClientHeight:Integer
 00048C9F    pop         ebp
 00048CA0    pop         edi
 00048CA1    pop         esi
 00048CA2    pop         ebx
 00048CA3    ret
*}
end;

//00048CAC
procedure TWinControl.SetUseDockManager(Value:Boolean);
begin
{*
 00048CAC    push        ebp
 00048CAD    mov         ebp,esp
 00048CAF    push        0
 00048CB1    push        ebx
 00048CB2    push        esi
 00048CB3    mov         esi,eax
 00048CB5    xor         eax,eax
 00048CB7    push        ebp
 00048CB8    push        48D10
 00048CBD    push        dword ptr fs:[eax]
 00048CC0    mov         dword ptr fs:[eax],esp
 00048CC3    cmp         dl,byte ptr [esi+180]
>00048CC9    je          00048CFA
 00048CCB    mov         byte ptr [esi+180],dl
 00048CD1    test        byte ptr [esi+20],10
 00048CD5    setne       al
 00048CD8    xor         al,1
 00048CDA    test        al,dl
>00048CDC    je          00048CFA
 00048CDE    lea         edx,[ebp-4]
 00048CE1    mov         eax,esi
 00048CE3    mov         bx,0FFCE
 00048CE7    call        @CallDynaInst
 00048CEC    mov         edx,dword ptr [ebp-4]
 00048CEF    lea         eax,[esi+13C]
 00048CF5    call        @IntfCopy
 00048CFA    xor         eax,eax
 00048CFC    pop         edx
 00048CFD    pop         ecx
 00048CFE    pop         ecx
 00048CFF    mov         dword ptr fs:[eax],edx
 00048D02    push        48D17
 00048D07    lea         eax,[ebp-4]
 00048D0A    call        @IntfClear
 00048D0F    ret
>00048D10    jmp         @HandleFinally
>00048D15    jmp         00048D07
 00048D17    pop         esi
 00048D18    pop         ebx
 00048D19    pop         ecx
 00048D1A    pop         ebp
 00048D1B    ret
*}
end;

//00048D1C
function TWinControl.HandleAllocated:Boolean;
begin
{*
 00048D1C    cmp         dword ptr [eax+140],0
 00048D23    setne       al
 00048D26    ret
*}
end;

//00048D28
procedure TWinControl.UpdateBounds;
begin
{*
 00048D28    push        ebx
 00048D29    push        esi
 00048D2A    push        edi
 00048D2B    add         esp,0FFFFFFC4
 00048D2E    mov         ebx,eax
 00048D30    mov         eax,dword ptr [ebx+140]
 00048D36    push        eax
 00048D37    call        user32.IsIconic
 00048D3C    test        eax,eax
>00048D3E    je          00048D68
 00048D40    mov         dword ptr [esp+10],2C
 00048D48    lea         eax,[esp+10]
 00048D4C    push        eax
 00048D4D    mov         eax,dword ptr [ebx+140]
 00048D53    push        eax
 00048D54    call        user32.GetWindowPlacement
 00048D59    lea         esi,[esp+2C]
 00048D5D    mov         edi,esp
 00048D5F    mov         ecx,4
 00048D64    rep movs    dword ptr [edi],dword ptr [esi]
>00048D66    jmp         00048D75
 00048D68    push        esp
 00048D69    mov         eax,dword ptr [ebx+140]
 00048D6F    push        eax
 00048D70    call        user32.GetWindowRect
 00048D75    push        0F0
 00048D77    mov         eax,dword ptr [ebx+140]
 00048D7D    push        eax
 00048D7E    call        user32.GetWindowLongA
 00048D83    test        eax,40000000
>00048D88    je          00048DB0
 00048D8A    push        0F8
 00048D8C    mov         eax,dword ptr [ebx+140]
 00048D92    push        eax
 00048D93    call        user32.GetWindowLongA
 00048D98    mov         esi,eax
 00048D9A    test        esi,esi
>00048D9C    je          00048DB0
 00048D9E    push        esp
 00048D9F    push        esi
 00048DA0    call        user32.ScreenToClient
 00048DA5    lea         eax,[esp+8]
 00048DA9    push        eax
 00048DAA    push        esi
 00048DAB    call        user32.ScreenToClient
 00048DB0    mov         ecx,dword ptr [esp+0C]
 00048DB4    sub         ecx,dword ptr [esp+4]
 00048DB8    mov         edx,dword ptr [esp+8]
 00048DBC    sub         edx,dword ptr [esp]
 00048DBF    mov         eax,ebx
 00048DC1    mov         esi,dword ptr [eax]
 00048DC3    call        dword ptr [esi+30]
 00048DC6    mov         eax,dword ptr [esp]
 00048DC9    mov         dword ptr [ebx+30],eax
 00048DCC    mov         eax,dword ptr [esp+4]
 00048DD0    mov         dword ptr [ebx+34],eax
 00048DD3    mov         eax,dword ptr [esp+8]
 00048DD7    sub         eax,dword ptr [esp]
 00048DDA    mov         dword ptr [ebx+38],eax
 00048DDD    mov         eax,dword ptr [esp+0C]
 00048DE1    sub         eax,dword ptr [esp+4]
 00048DE5    mov         dword ptr [ebx+3C],eax
 00048DE8    add         esp,3C
 00048DEB    pop         edi
 00048DEC    pop         esi
 00048DED    pop         ebx
 00048DEE    ret
*}
end;

//00048DF0
procedure TWinControl.GetTabOrderList(List:TList);
begin
{*
 00048DF0    push        ebx
 00048DF1    push        esi
 00048DF2    push        edi
 00048DF3    push        ebp
 00048DF4    push        ecx
 00048DF5    mov         ebp,edx
 00048DF7    mov         edi,eax
 00048DF9    mov         eax,dword ptr [edi+170]
 00048DFF    test        eax,eax
>00048E01    je          00048E3F
 00048E03    mov         esi,dword ptr [eax+8]
 00048E06    dec         esi
 00048E07    test        esi,esi
>00048E09    jl          00048E3F
 00048E0B    inc         esi
 00048E0C    mov         dword ptr [esp],0
 00048E13    mov         eax,dword ptr [edi+170]
 00048E19    mov         edx,dword ptr [esp]
 00048E1C    call        TList.Get
 00048E21    mov         ebx,eax
 00048E23    mov         edx,ebx
 00048E25    mov         eax,ebp
 00048E27    call        TList.Add
 00048E2C    mov         edx,ebp
 00048E2E    mov         eax,ebx
 00048E30    mov         bx,0FFBA
 00048E34    call        @CallDynaInst
 00048E39    inc         dword ptr [esp]
 00048E3C    dec         esi
>00048E3D    jne         00048E13
 00048E3F    pop         edx
 00048E40    pop         ebp
 00048E41    pop         edi
 00048E42    pop         esi
 00048E43    pop         ebx
 00048E44    ret
*}
end;

//00048E48
function TWinControl.FindNextControl(CurControl:TWinControl; GoForward:Boolean; CheckTabStop:Boolean; CheckParent:Boolean):TWinControl;
begin
{*
 00048E48    push        ebp
 00048E49    mov         ebp,esp
 00048E4B    add         esp,0FFFFFFF0
 00048E4E    push        ebx
 00048E4F    push        esi
 00048E50    push        edi
 00048E51    mov         byte ptr [ebp-1],cl
 00048E54    mov         esi,edx
 00048E56    mov         edi,eax
 00048E58    xor         eax,eax
 00048E5A    mov         dword ptr [ebp-8],eax
 00048E5D    mov         dl,1
 00048E5F    mov         eax,[0001EEC4];TList
 00048E64    call        TObject.Create
 00048E69    mov         dword ptr [ebp-10],eax
 00048E6C    xor         eax,eax
 00048E6E    push        ebp
 00048E6F    push        48F35
 00048E74    push        dword ptr fs:[eax]
 00048E77    mov         dword ptr fs:[eax],esp
 00048E7A    mov         edx,dword ptr [ebp-10]
 00048E7D    mov         eax,edi
 00048E7F    mov         bx,0FFBA
 00048E83    call        @CallDynaInst
 00048E88    mov         eax,dword ptr [ebp-10]
 00048E8B    cmp         dword ptr [eax+8],0
>00048E8F    jle         00048F1F
 00048E95    mov         edx,esi
 00048E97    mov         eax,dword ptr [ebp-10]
 00048E9A    call        TList.IndexOf
 00048E9F    mov         dword ptr [ebp-0C],eax
 00048EA2    cmp         dword ptr [ebp-0C],0FFFFFFFF
>00048EA6    jne         00048EBF
 00048EA8    cmp         byte ptr [ebp-1],0
>00048EAC    je          00048EBA
 00048EAE    mov         eax,dword ptr [ebp-10]
 00048EB1    mov         eax,dword ptr [eax+8]
 00048EB4    dec         eax
 00048EB5    mov         dword ptr [ebp-0C],eax
>00048EB8    jmp         00048EBF
 00048EBA    xor         eax,eax
 00048EBC    mov         dword ptr [ebp-0C],eax
 00048EBF    mov         ebx,dword ptr [ebp-0C]
 00048EC2    cmp         byte ptr [ebp-1],0
>00048EC6    je          00048ED5
 00048EC8    inc         ebx
 00048EC9    mov         eax,dword ptr [ebp-10]
 00048ECC    cmp         ebx,dword ptr [eax+8]
>00048ECF    jne         00048EE0
 00048ED1    xor         ebx,ebx
>00048ED3    jmp         00048EE0
 00048ED5    test        ebx,ebx
>00048ED7    jne         00048EDF
 00048ED9    mov         eax,dword ptr [ebp-10]
 00048EDC    mov         ebx,dword ptr [eax+8]
 00048EDF    dec         ebx
 00048EE0    mov         edx,ebx
 00048EE2    mov         eax,dword ptr [ebp-10]
 00048EE5    call        TList.Get
 00048EEA    mov         esi,eax
 00048EEC    mov         eax,esi
 00048EEE    call        TWinControl.CanFocus
 00048EF3    test        al,al
>00048EF5    je          00048F14
 00048EF7    cmp         byte ptr [ebp+0C],0
>00048EFB    je          00048F06
 00048EFD    cmp         byte ptr [esi+178],0
>00048F04    je          00048F14
 00048F06    cmp         byte ptr [ebp+8],0
>00048F0A    je          00048F11
 00048F0C    cmp         edi,dword ptr [esi+24]
>00048F0F    jne         00048F14
 00048F11    mov         dword ptr [ebp-8],esi
 00048F14    cmp         dword ptr [ebp-8],0
>00048F18    jne         00048F1F
 00048F1A    cmp         ebx,dword ptr [ebp-0C]
>00048F1D    jne         00048EC2
 00048F1F    xor         eax,eax
 00048F21    pop         edx
 00048F22    pop         ecx
 00048F23    pop         ecx
 00048F24    mov         dword ptr fs:[eax],edx
 00048F27    push        48F3C
 00048F2C    mov         eax,dword ptr [ebp-10]
 00048F2F    call        TObject.Free
 00048F34    ret
>00048F35    jmp         @HandleFinally
>00048F3A    jmp         00048F2C
 00048F3C    mov         eax,dword ptr [ebp-8]
 00048F3F    pop         edi
 00048F40    pop         esi
 00048F41    pop         ebx
 00048F42    mov         esp,ebp
 00048F44    pop         ebp
 00048F45    ret         8
*}
end;

//00048F48
procedure TWinControl.SelectNext(CurControl:TWinControl; GoForward:Boolean; CheckTabStop:Boolean);
begin
{*
 00048F48    push        ebp
 00048F49    mov         ebp,esp
 00048F4B    push        esi
 00048F4C    mov         esi,edx
 00048F4E    mov         edx,dword ptr [ebp+8]
 00048F51    push        edx
 00048F52    xor         dl,1
 00048F55    push        edx
 00048F56    mov         edx,esi
 00048F58    call        TWinControl.FindNextControl
 00048F5D    mov         esi,eax
 00048F5F    test        esi,esi
>00048F61    je          00048F6D
 00048F63    mov         eax,esi
 00048F65    mov         edx,dword ptr [eax]
 00048F67    call        dword ptr [edx+0B4]
 00048F6D    pop         esi
 00048F6E    pop         ebp
 00048F6F    ret         4
*}
end;

//00048F74
procedure TWinControl.SelectFirst;
begin
{*
 00048F74    push        ebx
 00048F75    push        esi
 00048F76    mov         ebx,eax
 00048F78    mov         eax,ebx
 00048F7A    call        GetParentForm
 00048F7F    mov         esi,eax
 00048F81    test        esi,esi
>00048F83    je          00048FB4
 00048F85    push        1
 00048F87    push        0
 00048F89    mov         cl,1
 00048F8B    xor         edx,edx
 00048F8D    mov         eax,ebx
 00048F8F    call        TWinControl.FindNextControl
 00048F94    test        eax,eax
>00048F96    jne         00048FA7
 00048F98    push        0
 00048F9A    push        0
 00048F9C    mov         cl,1
 00048F9E    xor         edx,edx
 00048FA0    mov         eax,ebx
 00048FA2    call        TWinControl.FindNextControl
 00048FA7    test        eax,eax
>00048FA9    je          00048FB4
 00048FAB    mov         edx,eax
 00048FAD    mov         eax,esi
 00048FAF    call        TCustomForm.SetActiveControl
 00048FB4    pop         esi
 00048FB5    pop         ebx
 00048FB6    ret
*}
end;

//00048FB8
procedure TWinControl.GetChildren(Proc:TGetChildProc; Root:TComponent);
begin
{*
 00048FB8    push        ebp
 00048FB9    mov         ebp,esp
 00048FBB    add         esp,0FFFFFFF8
 00048FBE    push        ebx
 00048FBF    push        esi
 00048FC0    mov         dword ptr [ebp-8],edx
 00048FC3    mov         dword ptr [ebp-4],eax
 00048FC6    mov         eax,dword ptr [ebp-4]
 00048FC9    call        TWinControl.GetControlCount
 00048FCE    mov         ebx,eax
 00048FD0    dec         ebx
 00048FD1    test        ebx,ebx
>00048FD3    jl          00048FF6
 00048FD5    inc         ebx
 00048FD6    xor         esi,esi
 00048FD8    mov         edx,esi
 00048FDA    mov         eax,dword ptr [ebp-4]
 00048FDD    call        TWinControl.GetControl
 00048FE2    mov         edx,dword ptr [eax+4]
 00048FE5    cmp         edx,dword ptr [ebp-8]
>00048FE8    jne         00048FF2
 00048FEA    mov         edx,eax
 00048FEC    mov         eax,dword ptr [ebp+0C]
 00048FEF    call        dword ptr [ebp+8]
 00048FF2    inc         esi
 00048FF3    dec         ebx
>00048FF4    jne         00048FD8
 00048FF6    pop         esi
 00048FF7    pop         ebx
 00048FF8    pop         ecx
 00048FF9    pop         ecx
 00048FFA    pop         ebp
 00048FFB    ret         8
*}
end;

//00049000
procedure TWinControl.SetChildOrder(Child:TComponent; Order:Integer);
begin
{*
 00049000    push        ebx
 00049001    push        esi
 00049002    mov         esi,ecx
 00049004    mov         ebx,edx
 00049006    mov         eax,ebx
 00049008    mov         edx,dword ptr ds:[3F0BC];TWinControl
 0004900E    call        @IsClass
 00049013    test        al,al
>00049015    je          00049023
 00049017    mov         edx,esi
 00049019    mov         eax,ebx
 0004901B    call        TWinControl.SetZOrderPosition
 00049020    pop         esi
 00049021    pop         ebx
 00049022    ret
 00049023    mov         eax,ebx
 00049025    mov         edx,dword ptr ds:[3EB50];TControl
 0004902B    call        @IsClass
 00049030    test        al,al
>00049032    je          0004903D
 00049034    mov         edx,esi
 00049036    mov         eax,ebx
 00049038    call        TControl.SetZOrderPosition
 0004903D    pop         esi
 0004903E    pop         ebx
 0004903F    ret
*}
end;

//00049040
procedure TWinControl.CanResize(var NewWidth:Integer; var NewHeight:Integer);
begin
{*
 00049040    call        TControl.CanResize
 00049045    ret
*}
end;

//00049048
procedure DoCalcConstraints(Control:TControl; var MinWidth:Integer; var MinHeight:Integer; var MaxWidth:Integer; var MaxHeight:Integer);
begin
{*
 00049048    push        ebp
 00049049    mov         ebp,esp
 0004904B    push        ebx
 0004904C    push        esi
 0004904D    push        edi
 0004904E    mov         edi,edx
 00049050    mov         esi,eax
 00049052    mov         eax,dword ptr [esi+68]
 00049055    cmp         dword ptr [eax+14],0
>00049059    jbe         00049065
 0004905B    mov         edx,dword ptr [esi+68]
 0004905E    mov         edx,dword ptr [edx+14]
 00049061    mov         dword ptr [edi],edx
>00049063    jmp         00049069
 00049065    xor         edx,edx
 00049067    mov         dword ptr [edi],edx
 00049069    cmp         dword ptr [eax+10],0
>0004906D    jbe         00049079
 0004906F    mov         edx,dword ptr [esi+68]
 00049072    mov         edx,dword ptr [edx+10]
 00049075    mov         dword ptr [ecx],edx
>00049077    jmp         0004907D
 00049079    xor         edx,edx
 0004907B    mov         dword ptr [ecx],edx
 0004907D    cmp         dword ptr [eax+0C],0
>00049081    jbe         00049090
 00049083    mov         edx,dword ptr [esi+68]
 00049086    mov         edx,dword ptr [edx+0C]
 00049089    mov         ebx,dword ptr [ebp+0C]
 0004908C    mov         dword ptr [ebx],edx
>0004908E    jmp         00049097
 00049090    mov         edx,dword ptr [ebp+0C]
 00049093    xor         ebx,ebx
 00049095    mov         dword ptr [edx],ebx
 00049097    cmp         dword ptr [eax+8],0
>0004909B    jbe         000490AA
 0004909D    mov         eax,dword ptr [esi+68]
 000490A0    mov         eax,dword ptr [eax+8]
 000490A3    mov         edx,dword ptr [ebp+8]
 000490A6    mov         dword ptr [edx],eax
>000490A8    jmp         000490B1
 000490AA    mov         eax,dword ptr [ebp+8]
 000490AD    xor         edx,edx
 000490AF    mov         dword ptr [eax],edx
 000490B1    mov         eax,dword ptr [ebp+0C]
 000490B4    push        eax
 000490B5    mov         eax,dword ptr [ebp+8]
 000490B8    push        eax
 000490B9    mov         edx,edi
 000490BB    mov         eax,esi
 000490BD    mov         ebx,dword ptr [eax]
 000490BF    call        dword ptr [ebx+3C]
 000490C2    pop         edi
 000490C3    pop         esi
 000490C4    pop         ebx
 000490C5    pop         ebp
 000490C6    ret         8
*}
end;

//000490CC
procedure TWinControl.CalcConstraints(var MinWidth:Integer; var MinHeight:Integer; var MaxWidth:Integer; var MaxHeight:Integer);
begin
{*
 000490CC    push        ebp
 000490CD    mov         ebp,esp
 000490CF    add         esp,0FFFFFFA0
 000490D2    push        ebx
 000490D3    push        esi
 000490D4    push        edi
 000490D5    mov         dword ptr [ebp-8],ecx
 000490D8    mov         dword ptr [ebp-4],edx
 000490DB    mov         esi,eax
 000490DD    mov         eax,esi
 000490DF    call        TWinControl.HandleAllocated
 000490E4    test        al,al
>000490E6    je          00049484
 000490EC    mov         eax,esi
 000490EE    call        TWinControl.GetControlCount
 000490F3    test        eax,eax
>000490F5    je          00049484
 000490FB    lea         edx,[ebp-60]
 000490FE    mov         eax,esi
 00049100    mov         ecx,dword ptr [eax]
 00049102    call        dword ptr [ecx+44]
 00049105    lea         edx,[ebp-60]
 00049108    mov         eax,esi
 0004910A    mov         ecx,dword ptr [eax]
 0004910C    call        dword ptr [ecx+88]
 00049112    mov         eax,dword ptr [esi+38]
 00049115    mov         edx,dword ptr [ebp-58]
 00049118    sub         edx,dword ptr [ebp-60]
 0004911B    sub         eax,edx
 0004911D    mov         dword ptr [ebp-0C],eax
 00049120    mov         edx,dword ptr [esi+3C]
 00049123    mov         ecx,dword ptr [ebp-54]
 00049126    sub         ecx,dword ptr [ebp-5C]
 00049129    sub         edx,ecx
 0004912B    mov         dword ptr [ebp-10],edx
 0004912E    mov         dword ptr [ebp-14],eax
 00049131    mov         dword ptr [ebp-18],edx
 00049134    mov         eax,dword ptr [ebp-4]
 00049137    cmp         dword ptr [eax],0
>0004913A    jle         00049144
 0004913C    mov         eax,dword ptr [ebp-4]
 0004913F    mov         edx,dword ptr [ebp-0C]
 00049142    sub         dword ptr [eax],edx
 00049144    mov         eax,dword ptr [ebp-8]
 00049147    cmp         dword ptr [eax],0
>0004914A    jle         00049154
 0004914C    mov         eax,dword ptr [ebp-8]
 0004914F    mov         edx,dword ptr [ebp-10]
 00049152    sub         dword ptr [eax],edx
 00049154    mov         eax,dword ptr [ebp+0C]
 00049157    cmp         dword ptr [eax],0
>0004915A    jle         00049164
 0004915C    mov         eax,dword ptr [ebp+0C]
 0004915F    mov         edx,dword ptr [ebp-14]
 00049162    sub         dword ptr [eax],edx
 00049164    mov         eax,dword ptr [ebp+8]
 00049167    cmp         dword ptr [eax],0
>0004916A    jle         00049174
 0004916C    mov         eax,dword ptr [ebp+8]
 0004916F    mov         edx,dword ptr [ebp-18]
 00049172    sub         dword ptr [eax],edx
 00049174    xor         ecx,ecx
 00049176    push        ebp
 00049177    push        4947D
 0004917C    push        dword ptr fs:[ecx]
 0004917F    mov         dword ptr fs:[ecx],esp
 00049182    xor         eax,eax
 00049184    mov         dword ptr [ebp-20],eax
 00049187    xor         eax,eax
 00049189    mov         dword ptr [ebp-30],eax
 0004918C    xor         eax,eax
 0004918E    mov         dword ptr [ebp-24],eax
 00049191    xor         eax,eax
 00049193    mov         dword ptr [ebp-34],eax
 00049196    xor         eax,eax
 00049198    mov         dword ptr [ebp-28],eax
 0004919B    xor         eax,eax
 0004919D    mov         dword ptr [ebp-38],eax
 000491A0    xor         eax,eax
 000491A2    mov         dword ptr [ebp-2C],eax
 000491A5    xor         eax,eax
 000491A7    mov         dword ptr [ebp-3C],eax
 000491AA    mov         eax,esi
 000491AC    call        TWinControl.GetControlCount
 000491B1    mov         edi,eax
 000491B3    dec         edi
 000491B4    test        edi,edi
>000491B6    jl          000493A7
 000491BC    inc         edi
 000491BD    mov         dword ptr [ebp-1C],0
 000491C4    mov         edx,dword ptr [ebp-1C]
 000491C7    mov         eax,esi
 000491C9    call        TWinControl.GetControl
 000491CE    mov         ebx,eax
 000491D0    cmp         byte ptr [ebx+47],0
>000491D4    jne         000491EA
 000491D6    test        byte ptr [ebx+20],10
>000491DA    je          0004939D
 000491E0    test        byte ptr [ebx+41],4
>000491E4    jne         0004939D
 000491EA    lea         eax,[ebp-44]
 000491ED    push        eax
 000491EE    lea         eax,[ebp-4C]
 000491F1    push        eax
 000491F2    lea         ecx,[ebp-48]
 000491F5    lea         edx,[ebp-40]
 000491F8    mov         eax,ebx
 000491FA    call        DoCalcConstraints
 000491FF    mov         al,byte ptr [ebx+4B]
 00049202    sub         al,1
>00049204    jb          0004921C
 00049206    sub         al,2
>00049208    jb          00049210
 0004920A    sub         al,2
>0004920C    je          00049216
>0004920E    jmp         00049265
 00049210    mov         byte ptr [ebp-4D],1
>00049214    jmp         00049269
 00049216    mov         byte ptr [ebp-4D],2
>0004921A    jmp         00049269
 0004921C    mov         al,byte ptr [ebx+60]
 0004921F    and         al,byte ptr ds:[49490]
 00049225    mov         dl,byte ptr ds:[49490]
 0004922B    cmp         dl,al
>0004922D    jne         0004925F
 0004922F    mov         byte ptr [ebp-4D],1
 00049233    cmp         dword ptr [ebp-40],0
>00049237    jle         00049248
 00049239    mov         eax,dword ptr [ebp-58]
 0004923C    sub         eax,dword ptr [ebp-60]
 0004923F    sub         eax,dword ptr [ebx+38]
 00049242    sub         eax,dword ptr [ebp-40]
 00049245    mov         dword ptr [ebp-40],eax
 00049248    cmp         dword ptr [ebp-44],0
>0004924C    jle         00049269
 0004924E    mov         eax,dword ptr [ebp-58]
 00049251    sub         eax,dword ptr [ebp-60]
 00049254    add         eax,dword ptr [ebp-44]
 00049257    sub         eax,dword ptr [ebx+38]
 0004925A    mov         dword ptr [ebp-44],eax
>0004925D    jmp         00049269
 0004925F    mov         byte ptr [ebp-4D],0
>00049263    jmp         00049269
 00049265    mov         byte ptr [ebp-4D],3
 00049269    mov         al,byte ptr [ebx+4B]
 0004926C    sub         al,1
>0004926E    jb          00049282
 00049270    add         al,0FE
 00049272    sub         al,2
>00049274    jb          0004927A
>00049276    je          0004927E
>00049278    jmp         000492C7
 0004927A    mov         al,1
>0004927C    jmp         000492C9
 0004927E    mov         al,2
>00049280    jmp         000492C9
 00049282    mov         al,byte ptr [ebx+60]
 00049285    and         al,byte ptr ds:[49494]
 0004928B    mov         dl,byte ptr ds:[49494]
 00049291    cmp         dl,al
>00049293    jne         000492C3
 00049295    mov         al,1
 00049297    cmp         dword ptr [ebp-48],0
>0004929B    jle         000492AC
 0004929D    mov         edx,dword ptr [ebp-54]
 000492A0    sub         edx,dword ptr [ebp-5C]
 000492A3    sub         edx,dword ptr [ebx+3C]
 000492A6    sub         edx,dword ptr [ebp-48]
 000492A9    mov         dword ptr [ebp-48],edx
 000492AC    cmp         dword ptr [ebp-4C],0
>000492B0    jle         000492C9
 000492B2    mov         edx,dword ptr [ebp-54]
 000492B5    sub         edx,dword ptr [ebp-5C]
 000492B8    add         edx,dword ptr [ebp-4C]
 000492BB    sub         edx,dword ptr [ebx+3C]
 000492BE    mov         dword ptr [ebp-4C],edx
>000492C1    jmp         000492C9
 000492C3    xor         eax,eax
>000492C5    jmp         000492C9
 000492C7    mov         al,3
 000492C9    mov         dl,byte ptr [ebp-4D]
 000492CC    dec         edx
 000492CD    sub         dl,2
>000492D0    jb          000492D6
>000492D2    je          0004932C
>000492D4    jmp         00049335
 000492D6    cmp         dword ptr [ebp-40],0
>000492DA    jle         00049300
 000492DC    mov         edx,dword ptr [ebp-4]
 000492DF    mov         edx,dword ptr [edx]
 000492E1    cmp         edx,dword ptr [ebp-40]
>000492E4    jge         00049300
 000492E6    mov         edx,dword ptr [ebp-4]
 000492E9    mov         ecx,dword ptr [ebp-40]
 000492EC    mov         dword ptr [edx],ecx
 000492EE    mov         edx,dword ptr [ebp-4]
 000492F1    mov         edx,dword ptr [edx]
 000492F3    cmp         edx,dword ptr [ebp-20]
>000492F6    jle         00049300
 000492F8    mov         edx,dword ptr [ebp-4]
 000492FB    mov         edx,dword ptr [edx]
 000492FD    mov         dword ptr [ebp-20],edx
 00049300    cmp         dword ptr [ebp-44],0
>00049304    jle         00049335
 00049306    mov         edx,dword ptr [ebp+0C]
 00049309    mov         edx,dword ptr [edx]
 0004930B    cmp         edx,dword ptr [ebp-44]
>0004930E    jle         00049335
 00049310    mov         edx,dword ptr [ebp+0C]
 00049313    mov         ecx,dword ptr [ebp-44]
 00049316    mov         dword ptr [edx],ecx
 00049318    mov         edx,dword ptr [ebp+0C]
 0004931B    mov         edx,dword ptr [edx]
 0004931D    cmp         edx,dword ptr [ebp-24]
>00049320    jle         00049335
 00049322    mov         edx,dword ptr [ebp+0C]
 00049325    mov         edx,dword ptr [edx]
 00049327    mov         dword ptr [ebp-24],edx
>0004932A    jmp         00049335
 0004932C    mov         edx,dword ptr [ebx+38]
 0004932F    add         dword ptr [ebp-30],edx
 00049332    add         dword ptr [ebp-34],edx
 00049335    dec         eax
 00049336    sub         al,2
>00049338    jb          0004933E
>0004933A    je          00049394
>0004933C    jmp         0004939D
 0004933E    cmp         dword ptr [ebp-48],0
>00049342    jle         00049368
 00049344    mov         eax,dword ptr [ebp-8]
 00049347    mov         eax,dword ptr [eax]
 00049349    cmp         eax,dword ptr [ebp-48]
>0004934C    jge         00049368
 0004934E    mov         eax,dword ptr [ebp-8]
 00049351    mov         edx,dword ptr [ebp-48]
 00049354    mov         dword ptr [eax],edx
 00049356    mov         eax,dword ptr [ebp-8]
 00049359    mov         eax,dword ptr [eax]
 0004935B    cmp         eax,dword ptr [ebp-28]
>0004935E    jle         00049368
 00049360    mov         eax,dword ptr [ebp-8]
 00049363    mov         eax,dword ptr [eax]
 00049365    mov         dword ptr [ebp-28],eax
 00049368    cmp         dword ptr [ebp-4C],0
>0004936C    jle         0004939D
 0004936E    mov         eax,dword ptr [ebp+8]
 00049371    mov         eax,dword ptr [eax]
 00049373    cmp         eax,dword ptr [ebp-4C]
>00049376    jle         0004939D
 00049378    mov         eax,dword ptr [ebp+8]
 0004937B    mov         edx,dword ptr [ebp-4C]
 0004937E    mov         dword ptr [eax],edx
 00049380    mov         eax,dword ptr [ebp+8]
 00049383    mov         eax,dword ptr [eax]
 00049385    cmp         eax,dword ptr [ebp-2C]
>00049388    jle         0004939D
 0004938A    mov         eax,dword ptr [ebp+8]
 0004938D    mov         eax,dword ptr [eax]
 0004938F    mov         dword ptr [ebp-2C],eax
>00049392    jmp         0004939D
 00049394    mov         eax,dword ptr [ebx+3C]
 00049397    add         dword ptr [ebp-38],eax
 0004939A    add         dword ptr [ebp-3C],eax
 0004939D    inc         dword ptr [ebp-1C]
 000493A0    dec         edi
>000493A1    jne         000491C4
 000493A7    cmp         dword ptr [ebp-20],0
>000493AB    jle         000493C5
 000493AD    mov         eax,dword ptr [ebp-20]
 000493B0    add         eax,dword ptr [ebp-30]
 000493B3    mov         edx,dword ptr [ebp-4]
 000493B6    cmp         eax,dword ptr [edx]
>000493B8    jle         000493C5
 000493BA    mov         eax,dword ptr [ebp-20]
 000493BD    add         eax,dword ptr [ebp-30]
 000493C0    mov         edx,dword ptr [ebp-4]
 000493C3    mov         dword ptr [edx],eax
 000493C5    cmp         dword ptr [ebp-24],0
>000493C9    jle         000493EB
 000493CB    mov         eax,dword ptr [ebp+0C]
 000493CE    cmp         dword ptr [eax],0
>000493D1    je          000493E0
 000493D3    mov         eax,dword ptr [ebp-24]
 000493D6    add         eax,dword ptr [ebp-34]
 000493D9    mov         edx,dword ptr [ebp+0C]
 000493DC    cmp         eax,dword ptr [edx]
>000493DE    jle         000493EB
 000493E0    mov         eax,dword ptr [ebp-24]
 000493E3    add         eax,dword ptr [ebp-34]
 000493E6    mov         edx,dword ptr [ebp+0C]
 000493E9    mov         dword ptr [edx],eax
 000493EB    cmp         dword ptr [ebp-28],0
>000493EF    jle         00049409
 000493F1    mov         eax,dword ptr [ebp-28]
 000493F4    add         eax,dword ptr [ebp-38]
 000493F7    mov         edx,dword ptr [ebp-8]
 000493FA    cmp         eax,dword ptr [edx]
>000493FC    jle         00049409
 000493FE    mov         eax,dword ptr [ebp-28]
 00049401    add         eax,dword ptr [ebp-38]
 00049404    mov         edx,dword ptr [ebp-8]
 00049407    mov         dword ptr [edx],eax
 00049409    cmp         dword ptr [ebp-2C],0
>0004940D    jle         0004942F
 0004940F    mov         eax,dword ptr [ebp+8]
 00049412    cmp         dword ptr [eax],0
>00049415    je          00049424
 00049417    mov         eax,dword ptr [ebp-2C]
 0004941A    add         eax,dword ptr [ebp-3C]
 0004941D    mov         edx,dword ptr [ebp+8]
 00049420    cmp         eax,dword ptr [edx]
>00049422    jle         0004942F
 00049424    mov         eax,dword ptr [ebp-2C]
 00049427    add         eax,dword ptr [ebp-3C]
 0004942A    mov         edx,dword ptr [ebp+8]
 0004942D    mov         dword ptr [edx],eax
 0004942F    xor         eax,eax
 00049431    pop         edx
 00049432    pop         ecx
 00049433    pop         ecx
 00049434    mov         dword ptr fs:[eax],edx
 00049437    push        49484
 0004943C    mov         eax,dword ptr [ebp-4]
 0004943F    cmp         dword ptr [eax],0
>00049442    jle         0004944C
 00049444    mov         eax,dword ptr [ebp-4]
 00049447    mov         edx,dword ptr [ebp-0C]
 0004944A    add         dword ptr [eax],edx
 0004944C    mov         eax,dword ptr [ebp-8]
 0004944F    cmp         dword ptr [eax],0
>00049452    jle         0004945C
 00049454    mov         eax,dword ptr [ebp-8]
 00049457    mov         edx,dword ptr [ebp-10]
 0004945A    add         dword ptr [eax],edx
 0004945C    mov         eax,dword ptr [ebp+0C]
 0004945F    cmp         dword ptr [eax],0
>00049462    jle         0004946C
 00049464    mov         eax,dword ptr [ebp+0C]
 00049467    mov         edx,dword ptr [ebp-14]
 0004946A    add         dword ptr [eax],edx
 0004946C    mov         eax,dword ptr [ebp+8]
 0004946F    cmp         dword ptr [eax],0
>00049472    jle         0004947C
 00049474    mov         eax,dword ptr [ebp+8]
 00049477    mov         edx,dword ptr [ebp-18]
 0004947A    add         dword ptr [eax],edx
 0004947C    ret
>0004947D    jmp         @HandleFinally
>00049482    jmp         0004943C
 00049484    pop         edi
 00049485    pop         esi
 00049486    pop         ebx
 00049487    mov         esp,ebp
 00049489    pop         ebp
 0004948A    ret         8
*}
end;

//00049498
procedure TWinControl.ConstrainedResize(var MinWidth:Integer; var MinHeight:Integer; var MaxWidth:Integer; var MaxHeight:Integer);
begin
{*
 00049498    push        ebp
 00049499    mov         ebp,esp
 0004949B    push        ebx
 0004949C    push        esi
 0004949D    push        edi
 0004949E    mov         edi,ecx
 000494A0    mov         esi,edx
 000494A2    mov         ebx,eax
 000494A4    mov         eax,dword ptr [ebp+0C]
 000494A7    push        eax
 000494A8    mov         eax,dword ptr [ebp+8]
 000494AB    push        eax
 000494AC    mov         ecx,edi
 000494AE    mov         edx,esi
 000494B0    mov         eax,ebx
 000494B2    call        TWinControl.CalcConstraints
 000494B7    mov         eax,dword ptr [ebp+0C]
 000494BA    push        eax
 000494BB    mov         eax,dword ptr [ebp+8]
 000494BE    push        eax
 000494BF    mov         ecx,edi
 000494C1    mov         edx,esi
 000494C3    mov         eax,ebx
 000494C5    call        TControl.ConstrainedResize
 000494CA    pop         edi
 000494CB    pop         esi
 000494CC    pop         ebx
 000494CD    pop         ebp
 000494CE    ret         8
*}
end;

//000494D4
procedure TWinControl.ActionChange(Sender:TObject; CheckDefaults:Boolean);
begin
{*
 000494D4    push        ebx
 000494D5    push        esi
 000494D6    push        edi
 000494D7    mov         ebx,ecx
 000494D9    mov         esi,edx
 000494DB    mov         edi,eax
 000494DD    mov         ecx,ebx
 000494DF    mov         edx,esi
 000494E1    mov         eax,edi
 000494E3    call        TControl.ActionChange
 000494E8    mov         eax,esi
 000494EA    mov         edx,dword ptr ds:[4D3E8];TCustomAction
 000494F0    call        @IsClass
 000494F5    test        al,al
>000494F7    je          0004950F
 000494F9    test        bl,bl
>000494FB    je          00049506
 000494FD    cmp         dword ptr [edi+144],0
>00049504    jne         0004950F
 00049506    mov         eax,dword ptr [esi+54]
 00049509    mov         dword ptr [edi+144],eax
 0004950F    pop         edi
 00049510    pop         esi
 00049511    pop         ebx
 00049512    ret
*}
end;

//00049514
procedure TWinControl.sub_0004481C;
begin
{*
 00049514    mov         eax,[0003EEB4];TWinControlActionLink
 00049519    ret
*}
end;

//0004951C
function TWinControl.IsHelpContextStored(Value:THelpContext):Boolean;
begin
{*
 0004951C    push        ebx
 0004951D    push        esi
 0004951E    mov         ebx,eax
 00049520    mov         esi,dword ptr [ebx+5C]
 00049523    test        esi,esi
>00049525    je          00049537
 00049527    mov         eax,esi
 00049529    mov         edx,dword ptr [eax]
 0004952B    call        dword ptr [edx+28]
 0004952E    test        al,al
>00049530    je          00049537
 00049532    xor         eax,eax
 00049534    pop         esi
 00049535    pop         ebx
 00049536    ret
 00049537    mov         al,1
 00049539    pop         esi
 0004953A    pop         ebx
 0004953B    ret
*}
end;

//0004953C
procedure TWinControl.AssignTo(Dest:TPersistent);
begin
{*
 0004953C    push        ebx
 0004953D    push        esi
 0004953E    mov         esi,edx
 00049540    mov         ebx,eax
 00049542    mov         edx,esi
 00049544    mov         eax,ebx
 00049546    call        TControl.AssignTo
 0004954B    mov         eax,esi
 0004954D    mov         edx,dword ptr ds:[4D3E8];TCustomAction
 00049553    call        @IsClass
 00049558    test        al,al
>0004955A    je          00049569
 0004955C    mov         edx,dword ptr [ebx+144]
 00049562    mov         eax,esi
 00049564    call        TCustomAction.SetHelpContext
 00049569    pop         esi
 0004956A    pop         ebx
 0004956B    ret
*}
end;

//0004956C
function TWinControl.CanAutoSize(var NewWidth:Integer; var NewHeight:Integer):Boolean;
begin
{*
 0004956C    push        ebp
 0004956D    mov         ebp,esp
 0004956F    add         esp,0FFFFFFCC
 00049572    push        ebx
 00049573    push        esi
 00049574    push        edi
 00049575    mov         dword ptr [ebp-0C],ecx
 00049578    mov         dword ptr [ebp-8],edx
 0004957B    mov         dword ptr [ebp-4],eax
 0004957E    mov         byte ptr [ebp-0D],1
 00049582    mov         eax,dword ptr [ebp-4]
 00049585    call        TWinControl.HandleAllocated
 0004958A    test        al,al
>0004958C    je          0004972B
 00049592    mov         eax,dword ptr [ebp-4]
 00049595    cmp         byte ptr [eax+4B],5
>00049599    je          0004972B
 0004959F    mov         eax,dword ptr [ebp-4]
 000495A2    test        byte ptr [eax+20],10
>000495A6    je          000495B8
 000495A8    mov         eax,dword ptr [ebp-4]
 000495AB    call        TWinControl.GetControlCount
 000495B0    test        eax,eax
>000495B2    jle         0004972B
 000495B8    lea         edx,[ebp-24]
 000495BB    mov         eax,dword ptr [ebp-4]
 000495BE    mov         ecx,dword ptr [eax]
 000495C0    call        dword ptr [ecx+0A8]
 000495C6    lea         edx,[ebp-34]
 000495C9    mov         eax,dword ptr [ebp-4]
 000495CC    mov         ecx,dword ptr [eax]
 000495CE    call        dword ptr [ecx+44]
 000495D1    lea         edx,[ebp-34]
 000495D4    mov         eax,dword ptr [ebp-4]
 000495D7    mov         ecx,dword ptr [eax]
 000495D9    call        dword ptr [ecx+88]
 000495DF    mov         eax,dword ptr [ebp-4]
 000495E2    call        TWinControl.DisableAlign
 000495E7    xor         edx,edx
 000495E9    push        ebp
 000495EA    push        49698
 000495EF    push        dword ptr fs:[edx]
 000495F2    mov         dword ptr fs:[edx],esp
 000495F5    mov         eax,dword ptr [ebp-4]
 000495F8    call        TWinControl.GetControlCount
 000495FD    mov         ebx,eax
 000495FF    dec         ebx
 00049600    test        ebx,ebx
>00049602    jl          0004967A
 00049604    inc         ebx
 00049605    mov         dword ptr [ebp-14],0
 0004960C    mov         edx,dword ptr [ebp-14]
 0004960F    mov         eax,dword ptr [ebp-4]
 00049612    call        TWinControl.GetControl
 00049617    cmp         byte ptr [eax+47],0
>0004961B    jne         00049629
 0004961D    test        byte ptr [eax+20],10
>00049621    je          00049674
 00049623    test        byte ptr [eax+41],4
>00049627    jne         00049674
 00049629    mov         edx,dword ptr [ebp-4]
 0004962C    mov         dl,byte ptr [edx+4B]
 0004962F    test        dl,dl
>00049631    je          0004963B
 00049633    add         dl,0FD
 00049636    sub         dl,2
>00049639    jae         00049643
 0004963B    mov         esi,dword ptr [ebp-24]
 0004963E    sub         esi,dword ptr [ebp-34]
>00049641    jmp         00049645
 00049643    xor         esi,esi
 00049645    mov         edx,dword ptr [ebp-4]
 00049648    mov         dl,byte ptr [edx+4B]
 0004964B    sub         dl,3
>0004964E    jae         00049658
 00049650    mov         edi,dword ptr [ebp-20]
 00049653    sub         edi,dword ptr [ebp-30]
>00049656    jmp         0004965A
 00049658    xor         edi,edi
 0004965A    mov         edx,dword ptr [eax+38]
 0004965D    push        edx
 0004965E    mov         edx,dword ptr [eax+3C]
 00049661    push        edx
 00049662    mov         ecx,dword ptr [eax+34]
 00049665    sub         ecx,edi
 00049667    mov         edx,dword ptr [eax+30]
 0004966A    sub         edx,esi
 0004966C    mov         esi,dword ptr [eax]
 0004966E    call        dword ptr [esi+80]
 00049674    inc         dword ptr [ebp-14]
 00049677    dec         ebx
>00049678    jne         0004960C
 0004967A    xor         eax,eax
 0004967C    pop         edx
 0004967D    pop         ecx
 0004967E    pop         ecx
 0004967F    mov         dword ptr fs:[eax],edx
 00049682    push        4969F
 00049687    mov         eax,dword ptr [ebp-4]
 0004968A    and         word ptr [eax+44],0FFFFFFEF
 0004968F    mov         eax,dword ptr [ebp-4]
 00049692    call        TWinControl.EnableAlign
 00049697    ret
>00049698    jmp         @HandleFinally
>0004969D    jmp         00049687
 0004969F    mov         eax,dword ptr [ebp-4]
 000496A2    mov         dl,byte ptr [eax+4B]
 000496A5    mov         eax,edx
 000496A7    test        al,al
>000496A9    je          000496B1
 000496AB    add         al,0FD
 000496AD    sub         al,2
>000496AF    jae         000496E8
 000496B1    mov         eax,dword ptr [ebp-1C]
 000496B4    sub         eax,dword ptr [ebp-24]
 000496B7    test        eax,eax
>000496B9    jle         000496E1
 000496BB    mov         ecx,dword ptr [ebp-4]
 000496BE    add         eax,dword ptr [ecx+38]
 000496C1    mov         ecx,dword ptr [ebp-2C]
 000496C4    sub         ecx,dword ptr [ebp-34]
 000496C7    sub         eax,ecx
 000496C9    mov         ecx,dword ptr [ebp-8]
 000496CC    mov         dword ptr [ecx],eax
 000496CE    cmp         dl,4
>000496D1    jne         000496E8
 000496D3    mov         eax,dword ptr [ebp-4]
 000496D6    mov         bx,0FFD6
 000496DA    call        @CallDynaInst
>000496DF    jmp         000496E8
 000496E1    mov         eax,dword ptr [ebp-8]
 000496E4    xor         edx,edx
 000496E6    mov         dword ptr [eax],edx
 000496E8    mov         eax,dword ptr [ebp-4]
 000496EB    mov         dl,byte ptr [eax+4B]
 000496EE    mov         eax,edx
 000496F0    sub         al,3
>000496F2    jae         0004972B
 000496F4    mov         eax,dword ptr [ebp-18]
 000496F7    sub         eax,dword ptr [ebp-20]
 000496FA    test        eax,eax
>000496FC    jle         00049724
 000496FE    mov         ecx,dword ptr [ebp-4]
 00049701    add         eax,dword ptr [ecx+3C]
 00049704    mov         ecx,dword ptr [ebp-28]
 00049707    sub         ecx,dword ptr [ebp-30]
 0004970A    sub         eax,ecx
 0004970C    mov         ecx,dword ptr [ebp-0C]
 0004970F    mov         dword ptr [ecx],eax
 00049711    cmp         dl,2
>00049714    jne         0004972B
 00049716    mov         eax,dword ptr [ebp-4]
 00049719    mov         bx,0FFD6
 0004971D    call        @CallDynaInst
>00049722    jmp         0004972B
 00049724    mov         eax,dword ptr [ebp-0C]
 00049727    xor         edx,edx
 00049729    mov         dword ptr [eax],edx
 0004972B    mov         al,byte ptr [ebp-0D]
 0004972E    pop         edi
 0004972F    pop         esi
 00049730    pop         ebx
 00049731    mov         esp,ebp
 00049733    pop         ebp
 00049734    ret
*}
end;

//00049738
procedure TWinControl.WMNCCalcSize(var Message:TWMNCCalcSize);
begin
{*
 00049738    push        ebx
 00049739    push        esi
 0004973A    push        edi
 0004973B    mov         esi,edx
 0004973D    mov         ebx,eax
 0004973F    mov         edx,esi
 00049741    mov         eax,ebx
 00049743    mov         ecx,dword ptr [eax]
 00049745    call        dword ptr [ecx-10]
 00049748    mov         eax,dword ptr [esi+8]
 0004974B    mov         esi,eax
 0004974D    mov         eax,dword ptr [ebx+120]
 00049753    neg         eax
 00049755    push        eax
 00049756    mov         edx,dword ptr [ebx+120]
 0004975C    neg         edx
 0004975E    push        eax
 0004975F    mov         edi,esi
 00049761    push        edi
 00049762    call        user32.InflateRect
 00049767    cmp         byte ptr [ebx+119],0
>0004976E    je          000497C1
 00049770    xor         eax,eax
 00049772    cmp         byte ptr [ebx+117],0
>00049779    je          00049781
 0004977B    add         eax,dword ptr [ebx+11C]
 00049781    cmp         byte ptr [ebx+118],0
>00049788    je          00049790
 0004978A    add         eax,dword ptr [ebx+11C]
 00049790    mov         esi,edi
 00049792    test        byte ptr [ebx+116],1
>00049799    je          0004979D
 0004979B    add         dword ptr [esi],eax
 0004979D    test        byte ptr [ebx+116],2
>000497A4    je          000497A9
 000497A6    add         dword ptr [esi+4],eax
 000497A9    test        byte ptr [ebx+116],4
>000497B0    je          000497B5
 000497B2    sub         dword ptr [esi+8],eax
 000497B5    test        byte ptr [ebx+116],8
>000497BC    je          000497C1
 000497BE    sub         dword ptr [esi+0C],eax
 000497C1    pop         edi
 000497C2    pop         esi
 000497C3    pop         ebx
 000497C4    ret
*}
end;

//000497C8
procedure TWinControl.WMNCPaint(var Message:TMessage);
begin
{*
 000497C8    push        ebp
 000497C9    mov         ebp,esp
 000497CB    add         esp,0FFFFFFC4
 000497CE    push        ebx
 000497CF    push        esi
 000497D0    push        edi
 000497D1    mov         dword ptr [ebp-8],edx
 000497D4    mov         dword ptr [ebp-4],eax
 000497D7    mov         eax,dword ptr [ebp-4]
 000497DA    cmp         byte ptr [eax+119],0
>000497E1    jne         000497F3
 000497E3    mov         eax,dword ptr [ebp-4]
 000497E6    cmp         dword ptr [eax+120],0
>000497ED    jbe         00049A3E
 000497F3    mov         eax,dword ptr [ebp-4]
 000497F6    call        TWinControl.GetHandle
 000497FB    push        eax
 000497FC    call        user32.GetWindowDC
 00049801    mov         dword ptr [ebp-0C],eax
 00049804    xor         edx,edx
 00049806    push        ebp
 00049807    push        49A37
 0004980C    push        dword ptr fs:[edx]
 0004980F    mov         dword ptr fs:[edx],esp
 00049812    lea         eax,[ebp-1C]
 00049815    push        eax
 00049816    mov         eax,dword ptr [ebp-4]
 00049819    call        TWinControl.GetHandle
 0004981E    push        eax
 0004981F    call        user32.GetClientRect
 00049824    lea         eax,[ebp-2C]
 00049827    push        eax
 00049828    mov         eax,dword ptr [ebp-4]
 0004982B    call        TWinControl.GetHandle
 00049830    push        eax
 00049831    call        user32.GetWindowRect
 00049836    push        2
 00049838    lea         eax,[ebp-2C]
 0004983B    push        eax
 0004983C    mov         eax,dword ptr [ebp-4]
 0004983F    call        TWinControl.GetHandle
 00049844    push        eax
 00049845    push        0
 00049847    call        user32.MapWindowPoints
 0004984C    mov         eax,dword ptr [ebp-28]
 0004984F    neg         eax
 00049851    push        eax
 00049852    mov         eax,dword ptr [ebp-2C]
 00049855    neg         eax
 00049857    push        eax
 00049858    lea         eax,[ebp-1C]
 0004985B    push        eax
 0004985C    call        user32.OffsetRect
 00049861    mov         eax,dword ptr [ebp-10]
 00049864    push        eax
 00049865    mov         eax,dword ptr [ebp-14]
 00049868    push        eax
 00049869    mov         eax,dword ptr [ebp-18]
 0004986C    push        eax
 0004986D    mov         eax,dword ptr [ebp-1C]
 00049870    push        eax
 00049871    mov         eax,dword ptr [ebp-0C]
 00049874    push        eax
 00049875    call        gdi32.ExcludeClipRect
 0004987A    lea         esi,[ebp-2C]
 0004987D    lea         edi,[ebp-3C]
 00049880    mov         ecx,4
 00049885    rep movs    dword ptr [edi],dword ptr [esi]
 00049887    mov         eax,dword ptr [ebp-4]
 0004988A    mov         eax,dword ptr [eax+120]
 00049890    push        eax
 00049891    push        eax
 00049892    lea         eax,[ebp-1C]
 00049895    push        eax
 00049896    call        user32.InflateRect
 0004989B    lea         esi,[ebp-1C]
 0004989E    lea         edi,[ebp-2C]
 000498A1    mov         ecx,4
 000498A6    rep movs    dword ptr [edi],dword ptr [esi]
 000498A8    mov         eax,dword ptr [ebp-4]
 000498AB    cmp         byte ptr [eax+119],0
>000498B2    je          000499C0
 000498B8    xor         ebx,ebx
 000498BA    mov         eax,dword ptr [ebp-4]
 000498BD    cmp         byte ptr [eax+117],0
>000498C4    je          000498CF
 000498C6    mov         eax,dword ptr [ebp-4]
 000498C9    add         ebx,dword ptr [eax+11C]
 000498CF    mov         eax,dword ptr [ebp-4]
 000498D2    cmp         byte ptr [eax+118],0
>000498D9    je          000498E4
 000498DB    mov         eax,dword ptr [ebp-4]
 000498DE    add         ebx,dword ptr [eax+11C]
 000498E4    push        0F0
 000498E6    mov         eax,dword ptr [ebp-4]
 000498E9    call        TWinControl.GetHandle
 000498EE    push        eax
 000498EF    call        user32.GetWindowLongA
 000498F4    mov         esi,eax
 000498F6    mov         eax,dword ptr [ebp-4]
 000498F9    test        byte ptr [eax+116],1
>00049900    je          00049905
 00049902    sub         dword ptr [ebp-2C],ebx
 00049905    mov         eax,dword ptr [ebp-4]
 00049908    test        byte ptr [eax+116],2
>0004990F    je          00049914
 00049911    sub         dword ptr [ebp-28],ebx
 00049914    mov         eax,dword ptr [ebp-4]
 00049917    test        byte ptr [eax+116],4
>0004991E    je          00049923
 00049920    add         dword ptr [ebp-24],ebx
 00049923    test        esi,200000
>00049929    je          00049939
 0004992B    push        14
 0004992D    mov         eax,[000B582C];^gvar_000B66A0
 00049932    mov         eax,dword ptr [eax]
 00049934    call        eax
 00049936    add         dword ptr [ebp-24],eax
 00049939    mov         eax,dword ptr [ebp-4]
 0004993C    test        byte ptr [eax+116],8
>00049943    je          00049948
 00049945    add         dword ptr [ebp-20],ebx
 00049948    test        esi,100000
>0004994E    je          0004995E
 00049950    push        15
 00049952    mov         eax,[000B582C];^gvar_000B66A0
 00049957    mov         eax,dword ptr [eax]
 00049959    call        eax
 0004995B    add         dword ptr [ebp-20],eax
 0004995E    mov         eax,dword ptr [ebp-4]
 00049961    movzx       eax,byte ptr [eax+116]
 00049968    mov         edx,dword ptr [ebp-4]
 0004996B    movzx       edx,byte ptr [edx+119]
 00049972    or          eax,dword ptr [edx*4+0B4864]
 00049979    mov         edx,dword ptr [ebp-4]
 0004997C    movzx       edx,byte ptr [edx+12C]
 00049983    or          eax,dword ptr [edx*4+0B4874]
 0004998A    or          eax,2000
 0004998F    push        eax
 00049990    mov         eax,dword ptr [ebp-4]
 00049993    movzx       eax,byte ptr [eax+117]
 0004999A    mov         eax,dword ptr [eax*4+0B4844]
 000499A1    mov         edx,dword ptr [ebp-4]
 000499A4    movzx       edx,byte ptr [edx+118]
 000499AB    or          eax,dword ptr [edx*4+0B4854]
 000499B2    push        eax
 000499B3    lea         eax,[ebp-2C]
 000499B6    push        eax
 000499B7    mov         eax,dword ptr [ebp-0C]
 000499BA    push        eax
 000499BB    call        user32.DrawEdge
 000499C0    mov         eax,dword ptr [ebp-20]
 000499C3    push        eax
 000499C4    mov         eax,dword ptr [ebp-24]
 000499C7    push        eax
 000499C8    mov         eax,dword ptr [ebp-28]
 000499CB    push        eax
 000499CC    mov         eax,dword ptr [ebp-2C]
 000499CF    push        eax
 000499D0    mov         eax,dword ptr [ebp-0C]
 000499D3    push        eax
 000499D4    call        gdi32.IntersectClipRect
 000499D9    lea         esi,[ebp-3C]
 000499DC    lea         edi,[ebp-2C]
 000499DF    mov         ecx,4
 000499E4    rep movs    dword ptr [edi],dword ptr [esi]
 000499E6    mov         eax,dword ptr [ebp-28]
 000499E9    neg         eax
 000499EB    push        eax
 000499EC    mov         eax,dword ptr [ebp-2C]
 000499EF    neg         eax
 000499F1    push        eax
 000499F2    lea         eax,[ebp-2C]
 000499F5    push        eax
 000499F6    call        user32.OffsetRect
 000499FB    mov         eax,dword ptr [ebp-4]
 000499FE    mov         eax,dword ptr [eax+124]
 00049A04    call        TBrush.GetHandle
 00049A09    push        eax
 00049A0A    lea         eax,[ebp-2C]
 00049A0D    push        eax
 00049A0E    mov         eax,dword ptr [ebp-0C]
 00049A11    push        eax
 00049A12    call        user32.FillRect
 00049A17    xor         eax,eax
 00049A19    pop         edx
 00049A1A    pop         ecx
 00049A1B    pop         ecx
 00049A1C    mov         dword ptr fs:[eax],edx
 00049A1F    push        49A3E
 00049A24    mov         eax,dword ptr [ebp-0C]
 00049A27    push        eax
 00049A28    mov         eax,dword ptr [ebp-4]
 00049A2B    call        TWinControl.GetHandle
 00049A30    push        eax
 00049A31    call        user32.ReleaseDC
 00049A36    ret
>00049A37    jmp         @HandleFinally
>00049A3C    jmp         00049A24
 00049A3E    mov         edx,dword ptr [ebp-8]
 00049A41    mov         eax,dword ptr [ebp-4]
 00049A44    mov         ecx,dword ptr [eax]
 00049A46    call        dword ptr [ecx-10]
 00049A49    pop         edi
 00049A4A    pop         esi
 00049A4B    pop         ebx
 00049A4C    mov         esp,ebp
 00049A4E    pop         ebp
 00049A4F    ret
*}
end;

//00049A50
constructor TGraphicControl.Create(AOwner:TComponent);
begin
{*
 00049A50    push        ebp
 00049A51    mov         ebp,esp
 00049A53    push        ecx
 00049A54    push        ebx
 00049A55    push        esi
 00049A56    test        dl,dl
>00049A58    je          00049A62
 00049A5A    add         esp,0FFFFFFF0
 00049A5D    call        @ClassCreate
 00049A62    mov         byte ptr [ebp-1],dl
 00049A65    mov         ebx,eax
 00049A67    xor         edx,edx
 00049A69    mov         eax,ebx
 00049A6B    call        TControl.Create
 00049A70    mov         dl,1
 00049A72    mov         eax,[0003E18C];TControlCanvas
 00049A77    call        TCanvas.Create
 00049A7C    mov         esi,eax
 00049A7E    mov         dword ptr [ebx+114],esi
 00049A84    mov         edx,ebx
 00049A86    mov         eax,esi
 00049A88    call        TControlCanvas.SetControl
 00049A8D    mov         eax,ebx
 00049A8F    cmp         byte ptr [ebp-1],0
>00049A93    je          00049AA4
 00049A95    call        @AfterConstruction
 00049A9A    pop         dword ptr fs:[0]
 00049AA1    add         esp,0C
 00049AA4    mov         eax,ebx
 00049AA6    pop         esi
 00049AA7    pop         ebx
 00049AA8    pop         ecx
 00049AA9    pop         ebp
 00049AAA    ret
*}
end;

//00049AAC
destructor TGraphicControl.Destroy;
begin
{*
 00049AAC    push        ebx
 00049AAD    push        esi
 00049AAE    call        @BeforeDestruction
 00049AB3    mov         ebx,edx
 00049AB5    mov         esi,eax
 00049AB7    cmp         esi,dword ptr ds:[0B4838]
>00049ABD    jne         00049AC6
 00049ABF    xor         eax,eax
 00049AC1    call        SetCaptureControl
 00049AC6    mov         eax,dword ptr [esi+114]
 00049ACC    call        TObject.Free
 00049AD1    mov         edx,ebx
 00049AD3    and         dl,0FC
 00049AD6    mov         eax,esi
 00049AD8    call        TControl.Destroy
 00049ADD    test        bl,bl
>00049ADF    jle         00049AE8
 00049AE1    mov         eax,esi
 00049AE3    call        @ClassDestroy
 00049AE8    pop         esi
 00049AE9    pop         ebx
 00049AEA    ret
*}
end;

//00049AEC
procedure TGraphicControl.WMPaint(var Message:TWMPaint);
begin
{*
 00049AEC    push        ebp
 00049AED    mov         ebp,esp
 00049AEF    push        ecx
 00049AF0    push        ebx
 00049AF1    mov         ebx,edx
 00049AF3    mov         dword ptr [ebp-4],eax
 00049AF6    cmp         dword ptr [ebx+4],0
>00049AFA    je          00049B8E
 00049B00    mov         eax,dword ptr [ebp-4]
 00049B03    mov         eax,dword ptr [eax+114]
 00049B09    call        TCanvas.Lock
 00049B0E    xor         eax,eax
 00049B10    push        ebp
 00049B11    push        49B87
 00049B16    push        dword ptr fs:[eax]
 00049B19    mov         dword ptr fs:[eax],esp
 00049B1C    mov         edx,dword ptr [ebx+4]
 00049B1F    mov         eax,dword ptr [ebp-4]
 00049B22    mov         eax,dword ptr [eax+114]
 00049B28    call        TCanvas.SetHandle
 00049B2D    xor         eax,eax
 00049B2F    push        ebp
 00049B30    push        49B64
 00049B35    push        dword ptr fs:[eax]
 00049B38    mov         dword ptr fs:[eax],esp
 00049B3B    mov         eax,dword ptr [ebp-4]
 00049B3E    mov         edx,dword ptr [eax]
 00049B40    call        dword ptr [edx+88]
 00049B46    xor         eax,eax
 00049B48    pop         edx
 00049B49    pop         ecx
 00049B4A    pop         ecx
 00049B4B    mov         dword ptr fs:[eax],edx
 00049B4E    push        49B6B
 00049B53    mov         eax,dword ptr [ebp-4]
 00049B56    mov         eax,dword ptr [eax+114]
 00049B5C    xor         edx,edx
 00049B5E    call        TCanvas.SetHandle
 00049B63    ret
>00049B64    jmp         @HandleFinally
>00049B69    jmp         00049B53
 00049B6B    xor         eax,eax
 00049B6D    pop         edx
 00049B6E    pop         ecx
 00049B6F    pop         ecx
 00049B70    mov         dword ptr fs:[eax],edx
 00049B73    push        49B8E
 00049B78    mov         eax,dword ptr [ebp-4]
 00049B7B    mov         eax,dword ptr [eax+114]
 00049B81    call        TCanvas.Unlock
 00049B86    ret
>00049B87    jmp         @HandleFinally
>00049B8C    jmp         00049B78
 00049B8E    pop         ebx
 00049B8F    pop         ecx
 00049B90    pop         ebp
 00049B91    ret
*}
end;

//00049B94
procedure sub_00049B94;
begin
{*
 00049B94    ret
*}
end;

//00049B98
constructor THintWindow.Create(AOwner:TComponent);
begin
{*
 00049B98    push        ebp
 00049B99    mov         ebp,esp
 00049B9B    add         esp,0FFFFFEAC
 00049BA1    push        ebx
 00049BA2    push        esi
 00049BA3    test        dl,dl
>00049BA5    je          00049BAF
 00049BA7    add         esp,0FFFFFFF0
 00049BAA    call        @ClassCreate
 00049BAF    mov         ebx,edx
 00049BB1    mov         esi,eax
 00049BB3    xor         edx,edx
 00049BB5    mov         eax,esi
 00049BB7    call        TCustomControl.Create
 00049BBC    mov         edx,80FFFF
 00049BC1    mov         eax,esi
 00049BC3    call        TControl.SetColor
 00049BC8    mov         dword ptr [ebp-154],154
 00049BD2    push        0
 00049BD4    lea         eax,[ebp-154]
 00049BDA    push        eax
 00049BDB    push        0
 00049BDD    push        29
 00049BDF    call        user32.SystemParametersInfoA
 00049BE4    test        eax,eax
>00049BE6    je          00049C03
 00049BE8    lea         eax,[ebp-78]
 00049BEB    push        eax
 00049BEC    call        gdi32.CreateFontIndirectA
 00049BF1    mov         edx,eax
 00049BF3    mov         eax,dword ptr [esi+1EC]
 00049BF9    mov         eax,dword ptr [eax+0C]
 00049BFC    call        TFont.SetHandle
>00049C01    jmp         00049C16
 00049C03    mov         eax,dword ptr [esi+1EC]
 00049C09    mov         eax,dword ptr [eax+0C]
 00049C0C    mov         edx,8
 00049C11    call        TFont.SetSize
 00049C16    mov         eax,dword ptr [esi+1EC]
 00049C1C    mov         eax,dword ptr [eax+14]
 00049C1F    mov         dl,1
 00049C21    call        TBrush.SetStyle
 00049C26    mov         eax,esi
 00049C28    test        bl,bl
>00049C2A    je          00049C3B
 00049C2C    call        @AfterConstruction
 00049C31    pop         dword ptr fs:[0]
 00049C38    add         esp,0C
 00049C3B    mov         eax,esi
 00049C3D    pop         esi
 00049C3E    pop         ebx
 00049C3F    mov         esp,ebp
 00049C41    pop         ebp
 00049C42    ret
*}
end;

//00049C44
procedure THintWindow.CreateParams(var Params:TCreateParams);
begin
{*
 00049C44    push        ebx
 00049C45    push        esi
 00049C46    mov         ebx,edx
 00049C48    mov         esi,eax
 00049C4A    mov         edx,ebx
 00049C4C    mov         eax,esi
 00049C4E    call        TWinControl.CreateParams
 00049C53    mov         dword ptr [ebx+4],80800000
 00049C5A    or          dword ptr [ebx+24],800
 00049C61    cmp         byte ptr ds:[0B6730],0
>00049C68    je          00049C71
 00049C6A    mov         dword ptr [ebx+8],80
 00049C71    lea         edx,[ebx+8]
 00049C74    mov         eax,esi
 00049C76    call        TWinControl.AddBiDiModeExStyle
 00049C7B    pop         esi
 00049C7C    pop         ebx
 00049C7D    ret
*}
end;

//00049C80
procedure THintWindow.WMNCHitTest(var Message:TWMNCHitTest);
begin
{*
 00049C80    mov         dword ptr [edx+0C],0FFFFFFFF
 00049C87    ret
*}
end;

//00049C88
procedure THintWindow.WMNCPaint(var Message:TMessage);
begin
{*
 00049C88    push        ebp
 00049C89    mov         ebp,esp
 00049C8B    add         esp,0FFFFFFE8
 00049C8E    mov         dword ptr [ebp-4],eax
 00049C91    mov         eax,dword ptr [ebp-4]
 00049C94    call        TWinControl.GetHandle
 00049C99    push        eax
 00049C9A    call        user32.GetWindowDC
 00049C9F    mov         dword ptr [ebp-8],eax
 00049CA2    xor         eax,eax
 00049CA4    push        ebp
 00049CA5    push        49CFB
 00049CAA    push        dword ptr fs:[eax]
 00049CAD    mov         dword ptr fs:[eax],esp
 00049CB0    mov         eax,dword ptr [ebp-4]
 00049CB3    mov         eax,dword ptr [eax+3C]
 00049CB6    push        eax
 00049CB7    lea         eax,[ebp-18]
 00049CBA    push        eax
 00049CBB    mov         eax,dword ptr [ebp-4]
 00049CBE    mov         ecx,dword ptr [eax+38]
 00049CC1    xor         edx,edx
 00049CC3    xor         eax,eax
 00049CC5    call        Rect
 00049CCA    push        0F
 00049CCC    push        1
 00049CCE    lea         eax,[ebp-18]
 00049CD1    push        eax
 00049CD2    mov         eax,dword ptr [ebp-8]
 00049CD5    push        eax
 00049CD6    call        user32.DrawEdge
 00049CDB    xor         eax,eax
 00049CDD    pop         edx
 00049CDE    pop         ecx
 00049CDF    pop         ecx
 00049CE0    mov         dword ptr fs:[eax],edx
 00049CE3    push        49D02
 00049CE8    mov         eax,dword ptr [ebp-8]
 00049CEB    push        eax
 00049CEC    mov         eax,dword ptr [ebp-4]
 00049CEF    call        TWinControl.GetHandle
 00049CF4    push        eax
 00049CF5    call        user32.ReleaseDC
 00049CFA    ret
>00049CFB    jmp         @HandleFinally
>00049D00    jmp         00049CE8
 00049D02    mov         esp,ebp
 00049D04    pop         ebp
 00049D05    ret
*}
end;

//00049D08
procedure THintWindow.Paint;
begin
{*
 00049D08    push        ebp
 00049D09    mov         ebp,esp
 00049D0B    add         esp,0FFFFFFEC
 00049D0E    push        ebx
 00049D0F    xor         edx,edx
 00049D11    mov         dword ptr [ebp-14],edx
 00049D14    mov         ebx,eax
 00049D16    xor         eax,eax
 00049D18    push        ebp
 00049D19    push        49D96
 00049D1E    push        dword ptr fs:[eax]
 00049D21    mov         dword ptr fs:[eax],esp
 00049D24    lea         edx,[ebp-10]
 00049D27    mov         eax,ebx
 00049D29    mov         ecx,dword ptr [eax]
 00049D2B    call        dword ptr [ecx+44]
 00049D2E    add         dword ptr [ebp-10],2
 00049D32    add         dword ptr [ebp-0C],2
 00049D36    mov         eax,dword ptr [ebx+1EC]
 00049D3C    mov         eax,dword ptr [eax+0C]
 00049D3F    mov         edx,80000017
 00049D44    call        TFont.SetColor
 00049D49    mov         eax,ebx
 00049D4B    call        TControl.DrawTextBiDiModeFlagsReadingOnly
 00049D50    or          eax,810
 00049D55    push        eax
 00049D56    lea         eax,[ebp-10]
 00049D59    push        eax
 00049D5A    push        0FF
 00049D5C    lea         edx,[ebp-14]
 00049D5F    mov         eax,ebx
 00049D61    call        TControl.GetText
 00049D66    mov         eax,dword ptr [ebp-14]
 00049D69    call        @LStrToPChar
 00049D6E    push        eax
 00049D6F    mov         eax,dword ptr [ebx+1EC]
 00049D75    call        TCanvas.GetHandle
 00049D7A    push        eax
 00049D7B    call        user32.DrawTextA
 00049D80    xor         eax,eax
 00049D82    pop         edx
 00049D83    pop         ecx
 00049D84    pop         ecx
 00049D85    mov         dword ptr fs:[eax],edx
 00049D88    push        49D9D
 00049D8D    lea         eax,[ebp-14]
 00049D90    call        @LStrClr
 00049D95    ret
>00049D96    jmp         @HandleFinally
>00049D9B    jmp         00049D8D
 00049D9D    pop         ebx
 00049D9E    mov         esp,ebp
 00049DA0    pop         ebp
 00049DA1    ret
*}
end;

//00049DA4
function THintWindow.IsHintMsg(var Msg:TMsg):Boolean;
begin
{*
 00049DA4    push        esi
 00049DA5    mov         eax,dword ptr [edx+4]
 00049DA8    cmp         eax,100
>00049DAD    jb          00049DB6
 00049DAF    cmp         eax,108
>00049DB4    jbe         00049E04
 00049DB6    mov         ecx,dword ptr [edx+4]
 00049DB9    cmp         ecx,0B000
>00049DBF    je          00049E04
 00049DC1    cmp         ecx,0B001
>00049DC7    je          00049E04
 00049DC9    cmp         dword ptr [edx+4],0B016
>00049DD0    je          00049E04
 00049DD2    cmp         dword ptr [edx+4],0B017
>00049DD9    je          00049E04
 00049DDB    cmp         dword ptr [edx+4],111
>00049DE2    je          00049E04
 00049DE4    mov         esi,dword ptr [edx+4]
 00049DE7    cmp         esi,200
>00049DED    jbe         00049DF7
 00049DEF    cmp         esi,20A
>00049DF5    jbe         00049E04
 00049DF7    cmp         dword ptr [edx+4],0A0
>00049DFE    je          00049E04
 00049E00    xor         eax,eax
 00049E02    pop         esi
 00049E03    ret
 00049E04    mov         al,1
 00049E06    pop         esi
 00049E07    ret
*}
end;

//00049E08
procedure THintWindow.ReleaseHandle;
begin
{*
 00049E08    call        TWinControl.DestroyHandle
 00049E0D    ret
*}
end;

//00049E10
procedure THintWindow.CMTextChanged(var Message:TMessage);
begin
{*
 00049E10    push        ebp
 00049E11    mov         ebp,esp
 00049E13    push        0
 00049E15    push        esi
 00049E16    mov         esi,eax
 00049E18    xor         eax,eax
 00049E1A    push        ebp
 00049E1B    push        49E94
 00049E20    push        dword ptr fs:[eax]
 00049E23    mov         dword ptr fs:[eax],esp
 00049E26    mov         eax,esi
 00049E28    mov         ecx,dword ptr [eax]
 00049E2A    call        dword ptr [ecx-10]
 00049E2D    cmp         byte ptr [esi+1F0],0
>00049E34    jne         00049E7E
 00049E36    lea         edx,[ebp-4]
 00049E39    mov         eax,esi
 00049E3B    call        TControl.GetText
 00049E40    mov         edx,dword ptr [ebp-4]
 00049E43    mov         eax,dword ptr [esi+1EC]
 00049E49    call        TCanvas.TextWidth
 00049E4E    mov         edx,eax
 00049E50    add         edx,6
 00049E53    mov         eax,esi
 00049E55    call        TControl.SetWidth
 00049E5A    lea         edx,[ebp-4]
 00049E5D    mov         eax,esi
 00049E5F    call        TControl.GetText
 00049E64    mov         edx,dword ptr [ebp-4]
 00049E67    mov         eax,dword ptr [esi+1EC]
 00049E6D    call        TCanvas.TextHeight
 00049E72    mov         edx,eax
 00049E74    add         edx,4
 00049E77    mov         eax,esi
 00049E79    call        TControl.SetHeight
 00049E7E    xor         eax,eax
 00049E80    pop         edx
 00049E81    pop         ecx
 00049E82    pop         ecx
 00049E83    mov         dword ptr fs:[eax],edx
 00049E86    push        49E9B
 00049E8B    lea         eax,[ebp-4]
 00049E8E    call        @LStrClr
 00049E93    ret
>00049E94    jmp         @HandleFinally
>00049E99    jmp         00049E8B
 00049E9B    pop         esi
 00049E9C    pop         ecx
 00049E9D    pop         ebp
 00049E9E    ret
*}
end;

//00049EA0
procedure THintWindow.ActivateHint(Rect:TRect; const AHint:AnsiString);
begin
{*
 00049EA0    push        ebp
 00049EA1    mov         ebp,esp
 00049EA3    add         esp,0FFFFFFEC
 00049EA6    push        ebx
 00049EA7    push        esi
 00049EA8    push        edi
 00049EA9    mov         esi,edx
 00049EAB    lea         edi,[ebp-14]
 00049EAE    push        ecx
 00049EAF    mov         ecx,4
 00049EB4    rep movs    dword ptr [edi],dword ptr [esi]
 00049EB6    pop         ecx
 00049EB7    mov         dword ptr [ebp-4],eax
 00049EBA    mov         ebx,dword ptr ds:[0B5BDC];^Screen:TScreen
 00049EC0    mov         eax,dword ptr [ebp-4]
 00049EC3    mov         byte ptr [eax+1F0],1
 00049ECA    xor         eax,eax
 00049ECC    push        ebp
 00049ECD    push        49FAD
 00049ED2    push        dword ptr fs:[eax]
 00049ED5    mov         dword ptr fs:[eax],esp
 00049ED8    mov         edx,ecx
 00049EDA    mov         eax,dword ptr [ebp-4]
 00049EDD    call        TControl.SetText
 00049EE2    add         dword ptr [ebp-8],4
 00049EE6    lea         edx,[ebp-14]
 00049EE9    mov         eax,dword ptr [ebp-4]
 00049EEC    call        TControl.UpdateBoundsRect
 00049EF1    mov         eax,dword ptr [ebx]
 00049EF3    call        TScreen.GetDesktopHeight
 00049EF8    mov         edx,dword ptr [ebp-4]
 00049EFB    mov         edx,dword ptr [edx+3C]
 00049EFE    add         edx,dword ptr [ebp-10]
 00049F01    cmp         eax,edx
>00049F03    jge         00049F15
 00049F05    mov         eax,dword ptr [ebx]
 00049F07    call        TScreen.GetDesktopHeight
 00049F0C    mov         edx,dword ptr [ebp-4]
 00049F0F    sub         eax,dword ptr [edx+3C]
 00049F12    mov         dword ptr [ebp-10],eax
 00049F15    mov         eax,dword ptr [ebx]
 00049F17    call        TScreen.GetDesktopWidth
 00049F1C    mov         edx,dword ptr [ebp-4]
 00049F1F    mov         edx,dword ptr [edx+38]
 00049F22    add         edx,dword ptr [ebp-14]
 00049F25    cmp         eax,edx
>00049F27    jge         00049F39
 00049F29    mov         eax,dword ptr [ebx]
 00049F2B    call        TScreen.GetDesktopWidth
 00049F30    mov         edx,dword ptr [ebp-4]
 00049F33    sub         eax,dword ptr [edx+38]
 00049F36    mov         dword ptr [ebp-14],eax
 00049F39    mov         eax,dword ptr [ebx]
 00049F3B    call        TScreen.GetDesktopLeft
 00049F40    cmp         eax,dword ptr [ebp-14]
>00049F43    jle         00049F4F
 00049F45    mov         eax,dword ptr [ebx]
 00049F47    call        TScreen.GetDesktopLeft
 00049F4C    mov         dword ptr [ebp-14],eax
 00049F4F    mov         eax,dword ptr [ebx]
 00049F51    call        TScreen.GetDesktopTop
 00049F56    cmp         eax,dword ptr [ebp-8]
>00049F59    jle         00049F65
 00049F5B    mov         eax,dword ptr [ebx]
 00049F5D    call        TScreen.GetDesktopTop
 00049F62    mov         dword ptr [ebp-8],eax
 00049F65    push        50
 00049F67    mov         eax,dword ptr [ebp-4]
 00049F6A    mov         eax,dword ptr [eax+3C]
 00049F6D    push        eax
 00049F6E    mov         eax,dword ptr [ebp-4]
 00049F71    mov         eax,dword ptr [eax+38]
 00049F74    push        eax
 00049F75    mov         eax,dword ptr [ebp-10]
 00049F78    push        eax
 00049F79    mov         eax,dword ptr [ebp-14]
 00049F7C    push        eax
 00049F7D    push        0FF
 00049F7F    mov         eax,dword ptr [ebp-4]
 00049F82    call        TWinControl.GetHandle
 00049F87    push        eax
 00049F88    call        user32.SetWindowPos
 00049F8D    mov         eax,dword ptr [ebp-4]
 00049F90    mov         edx,dword ptr [eax]
 00049F92    call        dword ptr [edx+78]
 00049F95    xor         eax,eax
 00049F97    pop         edx
 00049F98    pop         ecx
 00049F99    pop         ecx
 00049F9A    mov         dword ptr fs:[eax],edx
 00049F9D    push        49FB4
 00049FA2    mov         eax,dword ptr [ebp-4]
 00049FA5    mov         byte ptr [eax+1F0],0
 00049FAC    ret
>00049FAD    jmp         @HandleFinally
>00049FB2    jmp         00049FA2
 00049FB4    pop         edi
 00049FB5    pop         esi
 00049FB6    pop         ebx
 00049FB7    mov         esp,ebp
 00049FB9    pop         ebp
 00049FBA    ret
*}
end;

//00049FBC
procedure THintWindow.ActivateHintData(Rect:TRect; const AHint:AnsiString; AData:Pointer);
begin
{*
 00049FBC    push        ebp
 00049FBD    mov         ebp,esp
 00049FBF    add         esp,0FFFFFFF0
 00049FC2    push        ebx
 00049FC3    push        esi
 00049FC4    push        edi
 00049FC5    mov         esi,edx
 00049FC7    lea         edi,[ebp-10]
 00049FCA    push        ecx
 00049FCB    mov         ecx,4
 00049FD0    rep movs    dword ptr [edi],dword ptr [esi]
 00049FD2    pop         ecx
 00049FD3    lea         edx,[ebp-10]
 00049FD6    mov         ebx,dword ptr [eax]
 00049FD8    call        dword ptr [ebx+0BC]
 00049FDE    pop         edi
 00049FDF    pop         esi
 00049FE0    pop         ebx
 00049FE1    mov         esp,ebp
 00049FE3    pop         ebp
 00049FE4    ret         4
*}
end;

//00049FE8
function THintWindow.CalcHintRect(MaxWidth:Integer; const AHint:AnsiString; AData:Pointer):TRect;
begin
{*
 00049FE8    push        ebp
 00049FE9    mov         ebp,esp
 00049FEB    push        ecx
 00049FEC    push        ebx
 00049FED    push        esi
 00049FEE    push        edi
 00049FEF    mov         dword ptr [ebp-4],ecx
 00049FF2    mov         edi,edx
 00049FF4    mov         esi,eax
 00049FF6    mov         ebx,dword ptr [ebp+8]
 00049FF9    push        0
 00049FFB    push        ebx
 00049FFC    mov         ecx,edi
 00049FFE    xor         edx,edx
 0004A000    xor         eax,eax
 0004A002    call        Rect
 0004A007    mov         eax,esi
 0004A009    call        TControl.DrawTextBiDiModeFlagsReadingOnly
 0004A00E    or          eax,0C10
 0004A013    push        eax
 0004A014    push        ebx
 0004A015    push        0FF
 0004A017    mov         eax,dword ptr [ebp-4]
 0004A01A    call        @LStrToPChar
 0004A01F    push        eax
 0004A020    mov         eax,dword ptr [esi+1EC]
 0004A026    call        TCanvas.GetHandle
 0004A02B    push        eax
 0004A02C    call        user32.DrawTextA
 0004A031    add         dword ptr [ebx+8],6
 0004A035    add         dword ptr [ebx+0C],2
 0004A039    pop         edi
 0004A03A    pop         esi
 0004A03B    pop         ebx
 0004A03C    pop         ecx
 0004A03D    pop         ebp
 0004A03E    ret         8
*}
end;

//0004A044
function ClientToWindow(Handle:HWND; X:Integer; Y:Integer):TPoint;
begin
{*
 0004A044    push        ebp
 0004A045    mov         ebp,esp
 0004A047    add         esp,0FFFFFFE8
 0004A04A    push        ebx
 0004A04B    push        esi
 0004A04C    mov         ebx,eax
 0004A04E    mov         esi,dword ptr [ebp+8]
 0004A051    mov         dword ptr [ebp-8],edx
 0004A054    mov         dword ptr [ebp-4],ecx
 0004A057    lea         eax,[ebp-8]
 0004A05A    push        eax
 0004A05B    push        ebx
 0004A05C    call        user32.ClientToScreen
 0004A061    lea         eax,[ebp-18]
 0004A064    push        eax
 0004A065    push        ebx
 0004A066    call        user32.GetWindowRect
 0004A06B    mov         eax,dword ptr [ebp-8]
 0004A06E    sub         eax,dword ptr [ebp-18]
 0004A071    mov         dword ptr [esi],eax
 0004A073    mov         eax,dword ptr [ebp-4]
 0004A076    sub         eax,dword ptr [ebp-14]
 0004A079    mov         dword ptr [esi+4],eax
 0004A07C    pop         esi
 0004A07D    pop         ebx
 0004A07E    mov         esp,ebp
 0004A080    pop         ebp
 0004A081    ret         4
*}
end;

//0004A084
procedure TDragImageList.Initialize;
begin
{*
 0004A084    push        ebx
 0004A085    mov         ebx,eax
 0004A087    mov         eax,ebx
 0004A089    call        TCustomImageList.Initialize
 0004A08E    or          edx,0FFFFFFFF
 0004A091    mov         eax,ebx
 0004A093    call        TDragImageList.SetDragCursor
 0004A098    pop         ebx
 0004A099    ret
*}
end;

//0004A09C
procedure TDragImageList.CombineDragCursor;
begin
{*
 0004A09C    push        ebp
 0004A09D    mov         ebp,esp
 0004A09F    add         esp,0FFFFFFF4
 0004A0A2    push        ebx
 0004A0A3    mov         ebx,eax
 0004A0A5    cmp         word ptr [ebx+5C],0FFFFFFFF
>0004A0AA    je          0004A163
 0004A0B0    push        1
 0004A0B2    push        1
 0004A0B4    push        1
 0004A0B6    push        0E
 0004A0B8    mov         eax,[000B582C];^gvar_000B66A0
 0004A0BD    mov         eax,dword ptr [eax]
 0004A0BF    call        eax
 0004A0C1    push        eax
 0004A0C2    push        0D
 0004A0C4    mov         eax,[000B582C];^gvar_000B66A0
 0004A0C9    mov         eax,dword ptr [eax]
 0004A0CB    call        eax
 0004A0CD    push        eax
 0004A0CE    call        comctl32.ImageList_Create
 0004A0D3    mov         dword ptr [ebp-4],eax
 0004A0D6    xor         eax,eax
 0004A0D8    push        ebp
 0004A0D9    push        4A15C
 0004A0DE    push        dword ptr fs:[eax]
 0004A0E1    mov         dword ptr fs:[eax],esp
 0004A0E4    movsx       edx,word ptr [ebx+5C]
 0004A0E8    mov         eax,[000B5BDC];^Screen:TScreen
 0004A0ED    mov         eax,dword ptr [eax]
 0004A0EF    call        TScreen.GetCursors
 0004A0F4    mov         edx,eax
 0004A0F6    mov         eax,dword ptr [ebp-4]
 0004A0F9    call        ImageList_AddIcon
 0004A0FE    movsx       edx,word ptr [ebx+5C]
 0004A102    mov         eax,[000B5BDC];^Screen:TScreen
 0004A107    mov         eax,dword ptr [eax]
 0004A109    call        TScreen.GetCursors
 0004A10E    mov         edx,eax
 0004A110    mov         eax,dword ptr [ebp-4]
 0004A113    call        ImageList_AddIcon
 0004A118    push        0
 0004A11A    push        0
 0004A11C    push        0
 0004A11E    mov         eax,dword ptr [ebp-4]
 0004A121    push        eax
 0004A122    call        comctl32.ImageList_SetDragCursorImage
 0004A127    lea         eax,[ebp-0C]
 0004A12A    push        eax
 0004A12B    push        0
 0004A12D    call        comctl32.ImageList_GetDragImage
 0004A132    mov         eax,dword ptr [ebp-8]
 0004A135    push        eax
 0004A136    mov         eax,dword ptr [ebp-0C]
 0004A139    push        eax
 0004A13A    push        1
 0004A13C    mov         eax,dword ptr [ebp-4]
 0004A13F    push        eax
 0004A140    call        comctl32.ImageList_SetDragCursorImage
 0004A145    xor         eax,eax
 0004A147    pop         edx
 0004A148    pop         ecx
 0004A149    pop         ecx
 0004A14A    mov         dword ptr fs:[eax],edx
 0004A14D    push        4A163
 0004A152    mov         eax,dword ptr [ebp-4]
 0004A155    push        eax
 0004A156    call        comctl32.ImageList_Destroy
 0004A15B    ret
>0004A15C    jmp         @HandleFinally
>0004A161    jmp         0004A152
 0004A163    pop         ebx
 0004A164    mov         esp,ebp
 0004A166    pop         ebp
 0004A167    ret
*}
end;

//0004A168
function TDragImageList.SetDragImage(Index:Integer; HotSpotX:Integer; HotSpotY:Integer):Boolean;
begin
{*
 0004A168    push        ebp
 0004A169    mov         ebp,esp
 0004A16B    push        ebx
 0004A16C    push        esi
 0004A16D    push        edi
 0004A16E    mov         edi,ecx
 0004A170    mov         esi,edx
 0004A172    mov         ebx,eax
 0004A174    mov         eax,ebx
 0004A176    call        TCustomImageList.HandleAllocated
 0004A17B    test        al,al
>0004A17D    je          0004A1A5
 0004A17F    mov         dword ptr [ebx+6C],esi
 0004A182    mov         dword ptr [ebx+64],edi
 0004A185    mov         eax,dword ptr [ebp+8]
 0004A188    mov         dword ptr [ebx+68],eax
 0004A18B    mov         eax,dword ptr [ebp+8]
 0004A18E    push        eax
 0004A18F    push        edi
 0004A190    push        esi
 0004A191    mov         eax,ebx
 0004A193    call        TCustomImageList.GetHandle
 0004A198    push        eax
 0004A199    call        comctl32.ImageList_BeginDrag
 0004A19E    mov         al,1
 0004A1A0    mov         byte ptr [ebx+5E],al
>0004A1A3    jmp         0004A1A7
 0004A1A5    xor         eax,eax
 0004A1A7    pop         edi
 0004A1A8    pop         esi
 0004A1A9    pop         ebx
 0004A1AA    pop         ebp
 0004A1AB    ret         4
*}
end;

//0004A1B0
procedure TDragImageList.SetDragCursor(Value:TCursor);
begin
{*
 0004A1B0    cmp         dx,word ptr [eax+5C]
>0004A1B4    je          0004A1C5
 0004A1B6    mov         word ptr [eax+5C],dx
 0004A1BA    cmp         byte ptr [eax+5E],0
>0004A1BE    je          0004A1C5
 0004A1C0    call        TDragImageList.CombineDragCursor
 0004A1C5    ret
*}
end;

//0004A1C8
function TDragImageList.GetHotSpot:TPoint;
begin
{*
 0004A1C8    push        ebx
 0004A1C9    push        esi
 0004A1CA    mov         esi,edx
 0004A1CC    mov         ebx,eax
 0004A1CE    mov         edx,esi
 0004A1D0    mov         eax,ebx
 0004A1D2    call        TCustomImageList.GetHotSpot
 0004A1D7    mov         eax,ebx
 0004A1D9    call        TCustomImageList.HandleAllocated
 0004A1DE    test        al,al
>0004A1E0    je          0004A1F0
 0004A1E2    cmp         byte ptr [ebx+5E],0
>0004A1E6    je          0004A1F0
 0004A1E8    push        esi
 0004A1E9    push        0
 0004A1EB    call        comctl32.ImageList_GetDragImage
 0004A1F0    pop         esi
 0004A1F1    pop         ebx
 0004A1F2    ret
*}
end;

//0004A1F4
function TDragImageList.BeginDrag(Window:HWND; X:Integer; Y:Integer):Boolean;
begin
{*
 0004A1F4    push        ebp
 0004A1F5    mov         ebp,esp
 0004A1F7    push        ecx
 0004A1F8    push        ebx
 0004A1F9    push        esi
 0004A1FA    push        edi
 0004A1FB    mov         dword ptr [ebp-4],ecx
 0004A1FE    mov         edi,edx
 0004A200    mov         esi,eax
 0004A202    xor         ebx,ebx
 0004A204    mov         eax,esi
 0004A206    call        TCustomImageList.HandleAllocated
 0004A20B    test        al,al
>0004A20D    je          0004A24A
 0004A20F    cmp         byte ptr [esi+5E],0
>0004A213    jne         0004A226
 0004A215    mov         eax,dword ptr [esi+68]
 0004A218    push        eax
 0004A219    mov         ecx,dword ptr [esi+64]
 0004A21C    mov         edx,dword ptr [esi+6C]
 0004A21F    mov         eax,esi
 0004A221    call        TDragImageList.SetDragImage
 0004A226    mov         eax,esi
 0004A228    call        TDragImageList.CombineDragCursor
 0004A22D    mov         eax,dword ptr [ebp+8]
 0004A230    push        eax
 0004A231    mov         ecx,dword ptr [ebp-4]
 0004A234    mov         edx,edi
 0004A236    mov         eax,esi
 0004A238    call        TDragImageList.DragLock
 0004A23D    mov         ebx,eax
 0004A23F    test        bl,bl
>0004A241    je          0004A24A
 0004A243    push        0
 0004A245    call        user32.ShowCursor
 0004A24A    mov         eax,ebx
 0004A24C    pop         edi
 0004A24D    pop         esi
 0004A24E    pop         ebx
 0004A24F    pop         ecx
 0004A250    pop         ebp
 0004A251    ret         4
*}
end;

//0004A254
function TDragImageList.DragLock(Window:HWND; XPos:Integer; YPos:Integer):Boolean;
begin
{*
 0004A254    push        ebp
 0004A255    mov         ebp,esp
 0004A257    add         esp,0FFFFFFF4
 0004A25A    push        ebx
 0004A25B    push        esi
 0004A25C    push        edi
 0004A25D    mov         dword ptr [ebp-4],ecx
 0004A260    mov         esi,edx
 0004A262    mov         edi,eax
 0004A264    xor         ebx,ebx
 0004A266    mov         eax,edi
 0004A268    call        TCustomImageList.HandleAllocated
 0004A26D    test        al,al
>0004A26F    je          0004A2AA
 0004A271    cmp         esi,dword ptr [edi+60]
>0004A274    je          0004A2AA
 0004A276    mov         eax,edi
 0004A278    call        TDragImageList.DragUnlock
 0004A27D    mov         ebx,esi
 0004A27F    mov         dword ptr [edi+60],ebx
 0004A282    lea         eax,[ebp-0C]
 0004A285    push        eax
 0004A286    mov         ecx,dword ptr [ebp+8]
 0004A289    mov         edx,dword ptr [ebp-4]
 0004A28C    mov         eax,ebx
 0004A28E    call        ClientToWindow
 0004A293    mov         eax,dword ptr [ebp-8]
 0004A296    push        eax
 0004A297    mov         eax,dword ptr [ebp-0C]
 0004A29A    push        eax
 0004A29B    mov         eax,dword ptr [edi+60]
 0004A29E    push        eax
 0004A29F    call        comctl32.ImageList_DragEnter
 0004A2A4    neg         eax
 0004A2A6    sbb         ebx,ebx
 0004A2A8    neg         ebx
 0004A2AA    mov         eax,ebx
 0004A2AC    pop         edi
 0004A2AD    pop         esi
 0004A2AE    pop         ebx
 0004A2AF    mov         esp,ebp
 0004A2B1    pop         ebp
 0004A2B2    ret         4
*}
end;

//0004A2B8
procedure TDragImageList.DragUnlock;
begin
{*
 0004A2B8    push        ebx
 0004A2B9    mov         ebx,eax
 0004A2BB    mov         eax,ebx
 0004A2BD    call        TCustomImageList.HandleAllocated
 0004A2C2    test        al,al
>0004A2C4    je          0004A2DA
 0004A2C6    cmp         dword ptr [ebx+60],0
>0004A2CA    je          0004A2DA
 0004A2CC    mov         eax,dword ptr [ebx+60]
 0004A2CF    push        eax
 0004A2D0    call        comctl32.ImageList_DragLeave
 0004A2D5    xor         eax,eax
 0004A2D7    mov         dword ptr [ebx+60],eax
 0004A2DA    pop         ebx
 0004A2DB    ret
*}
end;

//0004A2DC
function TDragImageList.DragMove(X:Integer; Y:Integer):Boolean;
begin
{*
 0004A2DC    push        ebx
 0004A2DD    push        esi
 0004A2DE    push        edi
 0004A2DF    add         esp,0FFFFFFF8
 0004A2E2    mov         edi,ecx
 0004A2E4    mov         esi,edx
 0004A2E6    mov         ebx,eax
 0004A2E8    mov         eax,ebx
 0004A2EA    call        TCustomImageList.HandleAllocated
 0004A2EF    test        al,al
>0004A2F1    je          0004A317
 0004A2F3    push        esp
 0004A2F4    mov         ecx,edi
 0004A2F6    mov         edx,esi
 0004A2F8    mov         eax,dword ptr [ebx+60]
 0004A2FB    call        ClientToWindow
 0004A300    mov         eax,dword ptr [esp+4]
 0004A304    push        eax
 0004A305    mov         eax,dword ptr [esp+4]
 0004A309    push        eax
 0004A30A    call        comctl32.ImageList_DragMove
 0004A30F    neg         eax
 0004A311    sbb         eax,eax
 0004A313    neg         eax
>0004A315    jmp         0004A319
 0004A317    xor         eax,eax
 0004A319    pop         ecx
 0004A31A    pop         edx
 0004A31B    pop         edi
 0004A31C    pop         esi
 0004A31D    pop         ebx
 0004A31E    ret
*}
end;

//0004A320
procedure TDragImageList.ShowDragImage;
begin
{*
 0004A320    push        ebx
 0004A321    mov         ebx,eax
 0004A323    mov         eax,ebx
 0004A325    call        TCustomImageList.HandleAllocated
 0004A32A    test        al,al
>0004A32C    je          0004A335
 0004A32E    push        0FF
 0004A330    call        comctl32.ImageList_DragShowNolock
 0004A335    pop         ebx
 0004A336    ret
*}
end;

//0004A338
procedure TDragImageList.HideDragImage;
begin
{*
 0004A338    push        ebx
 0004A339    mov         ebx,eax
 0004A33B    mov         eax,ebx
 0004A33D    call        TCustomImageList.HandleAllocated
 0004A342    test        al,al
>0004A344    je          0004A34D
 0004A346    push        0
 0004A348    call        comctl32.ImageList_DragShowNolock
 0004A34D    pop         ebx
 0004A34E    ret
*}
end;

//0004A350
function TDragImageList.EndDrag:Boolean;
begin
{*
 0004A350    push        ebx
 0004A351    push        esi
 0004A352    mov         esi,eax
 0004A354    mov         eax,esi
 0004A356    call        TCustomImageList.HandleAllocated
 0004A35B    test        al,al
>0004A35D    je          0004A38E
 0004A35F    cmp         byte ptr [esi+5E],0
>0004A363    je          0004A38E
 0004A365    mov         eax,esi
 0004A367    call        TDragImageList.DragUnlock
 0004A36C    call        comctl32.ImageList_EndDrag
 0004A371    neg         eax
 0004A373    sbb         ebx,ebx
 0004A375    neg         ebx
 0004A377    mov         byte ptr [esi+5E],0
 0004A37B    or          edx,0FFFFFFFF
 0004A37E    mov         eax,esi
 0004A380    call        TDragImageList.SetDragCursor
 0004A385    push        0FF
 0004A387    call        user32.ShowCursor
>0004A38C    jmp         0004A390
 0004A38E    xor         ebx,ebx
 0004A390    mov         eax,ebx
 0004A392    pop         esi
 0004A393    pop         ebx
 0004A394    ret
*}
end;

//0004A398
constructor TCustomControl.Create(AOwner:TComponent);
begin
{*
 0004A398    push        ebp
 0004A399    mov         ebp,esp
 0004A39B    push        ecx
 0004A39C    push        ebx
 0004A39D    push        esi
 0004A39E    test        dl,dl
>0004A3A0    je          0004A3AA
 0004A3A2    add         esp,0FFFFFFF0
 0004A3A5    call        @ClassCreate
 0004A3AA    mov         byte ptr [ebp-1],dl
 0004A3AD    mov         ebx,eax
 0004A3AF    xor         edx,edx
 0004A3B1    mov         eax,ebx
 0004A3B3    call        TWinControl.Create
 0004A3B8    mov         dl,1
 0004A3BA    mov         eax,[0003E18C];TControlCanvas
 0004A3BF    call        TCanvas.Create
 0004A3C4    mov         esi,eax
 0004A3C6    mov         dword ptr [ebx+1EC],esi
 0004A3CC    mov         edx,ebx
 0004A3CE    mov         eax,esi
 0004A3D0    call        TControlCanvas.SetControl
 0004A3D5    mov         eax,ebx
 0004A3D7    cmp         byte ptr [ebp-1],0
>0004A3DB    je          0004A3EC
 0004A3DD    call        @AfterConstruction
 0004A3E2    pop         dword ptr fs:[0]
 0004A3E9    add         esp,0C
 0004A3EC    mov         eax,ebx
 0004A3EE    pop         esi
 0004A3EF    pop         ebx
 0004A3F0    pop         ecx
 0004A3F1    pop         ebp
 0004A3F2    ret
*}
end;

//0004A3F4
destructor TCustomControl.Destroy;
begin
{*
 0004A3F4    push        ebx
 0004A3F5    push        esi
 0004A3F6    call        @BeforeDestruction
 0004A3FB    mov         ebx,edx
 0004A3FD    mov         esi,eax
 0004A3FF    mov         eax,dword ptr [esi+1EC]
 0004A405    call        TObject.Free
 0004A40A    mov         edx,ebx
 0004A40C    and         dl,0FC
 0004A40F    mov         eax,esi
 0004A411    call        TWinControl.Destroy
 0004A416    test        bl,bl
>0004A418    jle         0004A421
 0004A41A    mov         eax,esi
 0004A41C    call        @ClassDestroy
 0004A421    pop         esi
 0004A422    pop         ebx
 0004A423    ret
*}
end;

//0004A424
procedure TCustomControl.WMPaint(var Message:TWMPaint);
begin
{*
 0004A424    push        ebx
 0004A425    push        esi
 0004A426    mov         esi,edx
 0004A428    mov         ebx,eax
 0004A42A    or          word ptr [ebx+44],100
 0004A430    mov         edx,esi
 0004A432    mov         eax,ebx
 0004A434    call        TWinControl.WMPaint
 0004A439    and         word ptr [ebx+44],0FEFF
 0004A43F    pop         esi
 0004A440    pop         ebx
 0004A441    ret
*}
end;

//0004A444
procedure TCustomControl.PaintWindow(DC:HDC);
begin
{*
 0004A444    push        ebp
 0004A445    mov         ebp,esp
 0004A447    push        ecx
 0004A448    push        ebx
 0004A449    mov         ebx,edx
 0004A44B    mov         dword ptr [ebp-4],eax
 0004A44E    mov         eax,dword ptr [ebp-4]
 0004A451    mov         eax,dword ptr [eax+1EC]
 0004A457    call        TCanvas.Lock
 0004A45C    xor         eax,eax
 0004A45E    push        ebp
 0004A45F    push        4A4E2
 0004A464    push        dword ptr fs:[eax]
 0004A467    mov         dword ptr fs:[eax],esp
 0004A46A    mov         eax,dword ptr [ebp-4]
 0004A46D    mov         eax,dword ptr [eax+1EC]
 0004A473    mov         edx,ebx
 0004A475    call        TCanvas.SetHandle
 0004A47A    xor         eax,eax
 0004A47C    push        ebp
 0004A47D    push        4A4BF
 0004A482    push        dword ptr fs:[eax]
 0004A485    mov         dword ptr fs:[eax],esp
 0004A488    mov         eax,dword ptr [ebp-4]
 0004A48B    mov         eax,dword ptr [eax+1EC]
 0004A491    call        TControlCanvas.UpdateTextFlags
 0004A496    mov         eax,dword ptr [ebp-4]
 0004A499    mov         edx,dword ptr [eax]
 0004A49B    call        dword ptr [edx+0B8]
 0004A4A1    xor         eax,eax
 0004A4A3    pop         edx
 0004A4A4    pop         ecx
 0004A4A5    pop         ecx
 0004A4A6    mov         dword ptr fs:[eax],edx
 0004A4A9    push        4A4C6
 0004A4AE    mov         eax,dword ptr [ebp-4]
 0004A4B1    mov         eax,dword ptr [eax+1EC]
 0004A4B7    xor         edx,edx
 0004A4B9    call        TCanvas.SetHandle
 0004A4BE    ret
>0004A4BF    jmp         @HandleFinally
>0004A4C4    jmp         0004A4AE
 0004A4C6    xor         eax,eax
 0004A4C8    pop         edx
 0004A4C9    pop         ecx
 0004A4CA    pop         ecx
 0004A4CB    mov         dword ptr fs:[eax],edx
 0004A4CE    push        4A4E9
 0004A4D3    mov         eax,dword ptr [ebp-4]
 0004A4D6    mov         eax,dword ptr [eax+1EC]
 0004A4DC    call        TCanvas.Unlock
 0004A4E1    ret
>0004A4E2    jmp         @HandleFinally
>0004A4E7    jmp         0004A4D3
 0004A4E9    pop         ebx
 0004A4EA    pop         ecx
 0004A4EB    pop         ebp
 0004A4EC    ret
*}
end;

//0004A4F0
procedure sub_0004A4F0;
begin
{*
 0004A4F0    ret
*}
end;

//0004A4F4
constructor TDockZone.Create(Tree:TDockTree);
begin
{*
 0004A4F4    test        dl,dl
>0004A4F6    je          0004A500
 0004A4F8    add         esp,0FFFFFFF0
 0004A4FB    call        @ClassCreate
 0004A500    mov         dword ptr [eax+1C],ecx
 0004A503    test        dl,dl
>0004A505    je          0004A516
 0004A507    call        @AfterConstruction
 0004A50C    pop         dword ptr fs:[0]
 0004A513    add         esp,0C
 0004A516    ret
*}
end;

//0004A518
function TDockZone.GetChildCount:Integer;
begin
{*
 0004A518    xor         edx,edx
 0004A51A    mov         eax,dword ptr [eax+8]
 0004A51D    test        eax,eax
>0004A51F    je          0004A529
 0004A521    mov         eax,dword ptr [eax+0C]
 0004A524    inc         edx
 0004A525    test        eax,eax
>0004A527    jne         0004A521
 0004A529    mov         eax,edx
 0004A52B    ret
*}
end;

//0004A52C
function TDockZone.GetLimitBegin:Integer;
begin
{*
 0004A52C    mov         edx,dword ptr [eax+1C]
 0004A52F    cmp         eax,dword ptr [edx+60]
>0004A532    jne         0004A538
 0004A534    mov         edx,eax
>0004A536    jmp         0004A53B
 0004A538    mov         edx,dword ptr [eax+14]
 0004A53B    mov         cl,byte ptr [edx+10]
 0004A53E    cmp         cl,1
>0004A541    jne         0004A54E
 0004A543    mov         edx,1
 0004A548    call        TDockZone.GetTopLeft
 0004A54D    ret
 0004A54E    cmp         cl,2
>0004A551    jne         0004A55F
 0004A553    mov         edx,2
 0004A558    call        TDockZone.GetTopLeft
>0004A55D    jmp         0004A572
 0004A55F    xor         ecx,ecx
 0004A561    mov         dl,1
 0004A563    mov         eax,[000176E8];Exception
 0004A568    call        Exception.Create
 0004A56D    call        @RaiseExcept
 0004A572    ret
*}
end;

//0004A574
function TDockZone.GetLimitSize:Integer;
begin
{*
 0004A574    mov         edx,dword ptr [eax+1C]
 0004A577    cmp         eax,dword ptr [edx+60]
>0004A57A    jne         0004A580
 0004A57C    mov         edx,eax
>0004A57E    jmp         0004A583
 0004A580    mov         edx,dword ptr [eax+14]
 0004A583    mov         cl,byte ptr [edx+10]
 0004A586    cmp         cl,1
>0004A589    jne         0004A596
 0004A58B    mov         edx,1
 0004A590    call        TDockZone.GetHeightWidth
 0004A595    ret
 0004A596    cmp         cl,2
>0004A599    jne         0004A5A7
 0004A59B    mov         edx,2
 0004A5A0    call        TDockZone.GetHeightWidth
>0004A5A5    jmp         0004A5BA
 0004A5A7    xor         ecx,ecx
 0004A5A9    mov         dl,1
 0004A5AB    mov         eax,[000176E8];Exception
 0004A5B0    call        Exception.Create
 0004A5B5    call        @RaiseExcept
 0004A5BA    ret
*}
end;

//0004A5BC
function TDockZone.GetTopLeft(Orient:Integer):Integer;
begin
{*
 0004A5BC    push        esi
 0004A5BD    push        edi
 0004A5BE    add         esp,0FFFFFFF0
 0004A5C1    mov         edi,edx
 0004A5C3    mov         esi,eax
 0004A5C5    mov         eax,esi
>0004A5C7    jmp         0004A5E3
 0004A5C9    mov         ecx,edi
 0004A5CB    mov         edx,dword ptr [eax+14]
 0004A5CE    cmp         cl,byte ptr [edx+10]
>0004A5D1    jne         0004A5E1
 0004A5D3    cmp         dword ptr [eax+18],0
>0004A5D7    je          0004A5E1
 0004A5D9    mov         eax,dword ptr [eax+18]
 0004A5DC    mov         eax,dword ptr [eax+20]
>0004A5DF    jmp         0004A61F
 0004A5E1    mov         eax,edx
 0004A5E3    mov         edx,dword ptr [esi+1C]
 0004A5E6    cmp         eax,dword ptr [edx+60]
>0004A5E9    jne         0004A5C9
 0004A5EB    mov         edx,esp
 0004A5ED    mov         eax,dword ptr [esi+1C]
 0004A5F0    mov         eax,dword ptr [eax+14]
 0004A5F3    mov         ecx,dword ptr [eax]
 0004A5F5    call        dword ptr [ecx+44]
 0004A5F8    mov         edx,esp
 0004A5FA    mov         eax,dword ptr [esi+1C]
 0004A5FD    mov         eax,dword ptr [eax+14]
 0004A600    mov         ecx,dword ptr [eax]
 0004A602    call        dword ptr [ecx+88]
 0004A608    mov         eax,edi
 0004A60A    dec         al
>0004A60C    je          0004A618
 0004A60E    dec         al
>0004A610    jne         0004A61D
 0004A612    mov         eax,dword ptr [esp+4]
>0004A616    jmp         0004A61F
 0004A618    mov         eax,dword ptr [esp]
>0004A61B    jmp         0004A61F
 0004A61D    xor         eax,eax
 0004A61F    add         esp,10
 0004A622    pop         edi
 0004A623    pop         esi
 0004A624    ret
*}
end;

//0004A628
function TDockZone.GetHeightWidth(Orient:Integer):Integer;
begin
{*
 0004A628    push        ebx
 0004A629    push        esi
 0004A62A    push        edi
 0004A62B    add         esp,0FFFFFFF0
 0004A62E    mov         edi,edx
 0004A630    mov         ebx,eax
 0004A632    mov         eax,dword ptr [ebx+1C]
 0004A635    cmp         ebx,dword ptr [eax+60]
>0004A638    je          0004A655
 0004A63A    mov         eax,dword ptr [ebx+1C]
 0004A63D    mov         esi,dword ptr [eax+60]
 0004A640    cmp         esi,dword ptr [ebx+14]
>0004A643    jne         0004A68B
 0004A645    cmp         dword ptr [ebx+4],0
>0004A649    je          0004A68B
 0004A64B    mov         eax,esi
 0004A64D    call        TDockZone.GetChildCount
 0004A652    dec         eax
>0004A653    jne         0004A68B
 0004A655    mov         edx,esp
 0004A657    mov         eax,dword ptr [ebx+1C]
 0004A65A    mov         eax,dword ptr [eax+14]
 0004A65D    mov         ecx,dword ptr [eax]
 0004A65F    call        dword ptr [ecx+44]
 0004A662    mov         edx,esp
 0004A664    mov         eax,dword ptr [ebx+1C]
 0004A667    mov         eax,dword ptr [eax+14]
 0004A66A    mov         ecx,dword ptr [eax]
 0004A66C    call        dword ptr [ecx+88]
 0004A672    mov         eax,edi
 0004A674    cmp         al,1
>0004A676    jne         0004A682
 0004A678    mov         eax,dword ptr [esp+0C]
 0004A67C    sub         eax,dword ptr [esp+4]
>0004A680    jmp         0004A6C8
 0004A682    mov         eax,dword ptr [esp+8]
 0004A686    sub         eax,dword ptr [esp]
>0004A689    jmp         0004A6C8
 0004A68B    mov         esi,ebx
>0004A68D    jmp         0004A6AB
 0004A68F    mov         edx,edi
 0004A691    mov         eax,dword ptr [esi+14]
 0004A694    cmp         dl,byte ptr [eax+10]
>0004A697    jne         0004A6A9
 0004A699    mov         eax,esi
 0004A69B    call        TDockZone.GetLimitBegin
 0004A6A0    push        eax
 0004A6A1    mov         eax,dword ptr [esi+20]
 0004A6A4    pop         edx
 0004A6A5    sub         eax,edx
>0004A6A7    jmp         0004A6C8
 0004A6A9    mov         esi,eax
 0004A6AB    mov         eax,dword ptr [ebx+1C]
 0004A6AE    cmp         esi,dword ptr [eax+60]
>0004A6B1    jne         0004A68F
 0004A6B3    mov         ecx,edi
 0004A6B5    mov         eax,dword ptr [ebx+1C]
 0004A6B8    mov         edx,dword ptr [eax+60]
 0004A6BB    cmp         cl,byte ptr [edx+10]
>0004A6BE    jne         0004A6C5
 0004A6C0    mov         eax,dword ptr [eax+64]
>0004A6C3    jmp         0004A6C8
 0004A6C5    mov         eax,dword ptr [edx+20]
 0004A6C8    add         esp,10
 0004A6CB    pop         edi
 0004A6CC    pop         esi
 0004A6CD    pop         ebx
 0004A6CE    ret
*}
end;

//0004A6D0
procedure TDockZone.ResetChildren;
begin
{*
 0004A6D0    push        ebx
 0004A6D1    push        esi
 0004A6D2    push        edi
 0004A6D3    push        ebp
 0004A6D4    mov         edi,eax
 0004A6D6    mov         al,byte ptr [edi+10]
 0004A6D9    dec         al
>0004A6DB    je          0004A6E3
 0004A6DD    dec         al
>0004A6DF    je          0004A6F3
>0004A6E1    jmp         0004A759
 0004A6E3    mov         edx,1
 0004A6E8    mov         eax,edi
 0004A6EA    call        TDockZone.GetHeightWidth
 0004A6EF    mov         esi,eax
>0004A6F1    jmp         0004A701
 0004A6F3    mov         edx,2
 0004A6F8    mov         eax,edi
 0004A6FA    call        TDockZone.GetHeightWidth
 0004A6FF    mov         esi,eax
 0004A701    mov         ebx,dword ptr [edi+8]
 0004A704    mov         ebp,esi
 0004A706    mov         eax,edi
 0004A708    call        TDockZone.GetChildCount
 0004A70D    push        eax
 0004A70E    mov         eax,esi
 0004A710    pop         edx
 0004A711    mov         ecx,edx
 0004A713    cdq
 0004A714    idiv        eax,ecx
 0004A716    mov         esi,eax
 0004A718    mov         eax,ebx
 0004A71A    call        TDockZone.GetLimitBegin
 0004A71F    add         eax,esi
 0004A721    mov         dword ptr [ebx+20],eax
 0004A724    mov         eax,ebx
 0004A726    call        TDockZone.Update
 0004A72B    mov         ebx,dword ptr [ebx+0C]
 0004A72E    test        ebx,ebx
>0004A730    je          0004A759
 0004A732    mov         eax,dword ptr [ebx+18]
 0004A735    mov         eax,dword ptr [eax+20]
 0004A738    add         eax,esi
 0004A73A    mov         dword ptr [ebx+20],eax
 0004A73D    cmp         dword ptr [ebx+0C],0
>0004A741    jne         0004A74B
 0004A743    mov         eax,ebp
 0004A745    cdq
 0004A746    idiv        eax,esi
 0004A748    add         dword ptr [ebx+20],edx
 0004A74B    mov         eax,ebx
 0004A74D    call        TDockZone.Update
 0004A752    mov         ebx,dword ptr [ebx+0C]
 0004A755    test        ebx,ebx
>0004A757    jne         0004A732
 0004A759    pop         ebp
 0004A75A    pop         edi
 0004A75B    pop         esi
 0004A75C    pop         ebx
 0004A75D    ret
*}
end;

//0004A760
function TDockZone.GetControlName:AnsiString;
begin
{*
 0004A760    push        ebp
 0004A761    mov         ebp,esp
 0004A763    push        0
 0004A765    push        ebx
 0004A766    push        esi
 0004A767    push        edi
 0004A768    mov         esi,edx
 0004A76A    mov         ebx,eax
 0004A76C    xor         eax,eax
 0004A76E    push        ebp
 0004A76F    push        4A7D2
 0004A774    push        dword ptr fs:[eax]
 0004A777    mov         dword ptr fs:[eax],esp
 0004A77A    mov         eax,esi
 0004A77C    call        @LStrClr
 0004A781    mov         edi,dword ptr [ebx+4]
 0004A784    test        edi,edi
>0004A786    je          0004A7BC
 0004A788    cmp         dword ptr [edi+8],0
>0004A78C    jne         0004A7AF
 0004A78E    lea         edx,[ebp-4]
 0004A791    mov         eax,[000B58E0];^SDockedCtlNeedsName:TResStringRec
 0004A796    call        LoadResString
 0004A79B    mov         ecx,dword ptr [ebp-4]
 0004A79E    mov         dl,1
 0004A7A0    mov         eax,[000176E8];Exception
 0004A7A5    call        Exception.Create
 0004A7AA    call        @RaiseExcept
 0004A7AF    mov         eax,esi
 0004A7B1    mov         edx,dword ptr [ebx+4]
 0004A7B4    mov         edx,dword ptr [edx+8]
 0004A7B7    call        @LStrLAsg
 0004A7BC    xor         eax,eax
 0004A7BE    pop         edx
 0004A7BF    pop         ecx
 0004A7C0    pop         ecx
 0004A7C1    mov         dword ptr fs:[eax],edx
 0004A7C4    push        4A7D9
 0004A7C9    lea         eax,[ebp-4]
 0004A7CC    call        @LStrClr
 0004A7D1    ret
>0004A7D2    jmp         @HandleFinally
>0004A7D7    jmp         0004A7C9
 0004A7D9    pop         edi
 0004A7DA    pop         esi
 0004A7DB    pop         ebx
 0004A7DC    pop         ecx
 0004A7DD    pop         ebp
 0004A7DE    ret
*}
end;

//0004A7E0
procedure TDockZone.SetControlName(const Value:AnsiString);
begin
{*
 0004A7E0    push        ebp
 0004A7E1    mov         ebp,esp
 0004A7E3    add         esp,0FFFFFFF8
 0004A7E6    push        ebx
 0004A7E7    push        esi
 0004A7E8    mov         esi,eax
 0004A7EA    xor         eax,eax
 0004A7EC    mov         dword ptr [ebp-4],eax
 0004A7EF    mov         eax,dword ptr [esi+1C]
 0004A7F2    mov         dword ptr [ebp-8],eax
 0004A7F5    lea         ecx,[ebp-4]
 0004A7F8    mov         eax,dword ptr [ebp-8]
 0004A7FB    mov         eax,dword ptr [eax+14]
 0004A7FE    mov         bx,0FFBE
 0004A802    call        @CallDynaInst
 0004A807    cmp         dword ptr [ebp-4],0
>0004A80B    je          0004A850
 0004A80D    mov         eax,dword ptr [ebp-8]
 0004A810    mov         dword ptr [eax+38],esi
 0004A813    xor         eax,eax
 0004A815    push        ebp
 0004A816    push        4A849
 0004A81B    push        dword ptr fs:[eax]
 0004A81E    mov         dword ptr fs:[eax],esp
 0004A821    push        0
 0004A823    mov         eax,dword ptr [ebp-8]
 0004A826    mov         edx,dword ptr [eax+14]
 0004A829    xor         ecx,ecx
 0004A82B    mov         eax,dword ptr [ebp-4]
 0004A82E    call        TControl.ManualDock
 0004A833    xor         eax,eax
 0004A835    pop         edx
 0004A836    pop         ecx
 0004A837    pop         ecx
 0004A838    mov         dword ptr fs:[eax],edx
 0004A83B    push        4A850
 0004A840    mov         eax,dword ptr [ebp-8]
 0004A843    xor         edx,edx
 0004A845    mov         dword ptr [eax+38],edx
 0004A848    ret
>0004A849    jmp         @HandleFinally
>0004A84E    jmp         0004A840
 0004A850    pop         esi
 0004A851    pop         ebx
 0004A852    pop         ecx
 0004A853    pop         ecx
 0004A854    pop         ebp
 0004A855    ret
*}
end;

//0004A858
function ParentNotLast:Boolean;
begin
{*
 0004A858    push        ebp
 0004A859    mov         ebp,esp
 0004A85B    xor         edx,edx
 0004A85D    mov         eax,dword ptr [ebp+8]
 0004A860    mov         eax,dword ptr [eax-4]
 0004A863    mov         eax,dword ptr [eax+14]
 0004A866    test        eax,eax
>0004A868    je          0004A87B
 0004A86A    cmp         dword ptr [eax+0C],0
>0004A86E    je          0004A874
 0004A870    mov         dl,1
>0004A872    jmp         0004A87B
 0004A874    mov         eax,dword ptr [eax+14]
 0004A877    test        eax,eax
>0004A879    jne         0004A86A
 0004A87B    mov         eax,edx
 0004A87D    pop         ebp
 0004A87E    ret
*}
end;

//0004A880
procedure TDockZone.Update;
begin
{*
 0004A880    push        ebp
 0004A881    mov         ebp,esp
 0004A883    add         esp,0FFFFFFEC
 0004A886    push        ebx
 0004A887    push        esi
 0004A888    push        edi
 0004A889    mov         dword ptr [ebp-4],eax
 0004A88C    mov         eax,dword ptr [ebp-4]
 0004A88F    mov         eax,dword ptr [eax+4]
 0004A892    test        eax,eax
>0004A894    je          0004A9C9
 0004A89A    mov         edx,dword ptr [ebp-4]
 0004A89D    mov         edx,dword ptr [edx+1C]
 0004A8A0    cmp         dword ptr [edx+68],0
>0004A8A4    jne         0004A9C9
 0004A8AA    mov         edx,dword ptr [ebp-4]
 0004A8AD    mov         edx,dword ptr [edx+14]
 0004A8B0    mov         dl,byte ptr [edx+10]
 0004A8B3    mov         byte ptr [eax+88],dl
 0004A8B9    mov         edx,2
 0004A8BE    mov         eax,dword ptr [ebp-4]
 0004A8C1    call        TDockZone.GetHeightWidth
 0004A8C6    mov         ebx,eax
 0004A8C8    mov         edx,1
 0004A8CD    mov         eax,dword ptr [ebp-4]
 0004A8D0    call        TDockZone.GetHeightWidth
 0004A8D5    mov         esi,eax
 0004A8D7    push        ebp
 0004A8D8    call        ParentNotLast
 0004A8DD    pop         ecx
 0004A8DE    test        al,al
>0004A8E0    je          0004A902
 0004A8E2    mov         eax,dword ptr [ebp-4]
 0004A8E5    mov         eax,dword ptr [eax+14]
 0004A8E8    cmp         byte ptr [eax+10],1
>0004A8EC    jne         0004A8F9
 0004A8EE    mov         eax,dword ptr [ebp-4]
 0004A8F1    mov         eax,dword ptr [eax+1C]
 0004A8F4    sub         ebx,dword ptr [eax+0C]
>0004A8F7    jmp         0004A902
 0004A8F9    mov         eax,dword ptr [ebp-4]
 0004A8FC    mov         eax,dword ptr [eax+1C]
 0004A8FF    sub         esi,dword ptr [eax+0C]
 0004A902    mov         ecx,dword ptr [ebp-4]
 0004A905    cmp         dword ptr [ecx+0C],0
>0004A909    jne         0004A960
 0004A90B    mov         ecx,dword ptr [ebp-4]
 0004A90E    mov         ecx,dword ptr [ecx+14]
 0004A911    mov         edi,dword ptr [ebp-4]
 0004A914    mov         edi,dword ptr [edi+1C]
 0004A917    cmp         ecx,dword ptr [edi+60]
>0004A91A    je          0004A93E
 0004A91C    mov         ecx,dword ptr [ebp-4]
 0004A91F    mov         ecx,dword ptr [ecx+14]
 0004A922    mov         cl,byte ptr [ecx+10]
 0004A925    mov         eax,dword ptr [ebp-4]
 0004A928    mov         eax,dword ptr [eax+1C]
 0004A92B    mov         edi,dword ptr [eax+60]
 0004A92E    cmp         cl,byte ptr [edi+10]
>0004A931    jne         0004A93E
 0004A933    mov         ecx,dword ptr [ebp-4]
 0004A936    mov         ecx,dword ptr [ecx+20]
 0004A939    cmp         ecx,dword ptr [eax+64]
>0004A93C    jl          0004A960
 0004A93E    mov         eax,dword ptr [ebp-4]
 0004A941    mov         eax,dword ptr [eax+14]
 0004A944    mov         al,byte ptr [eax+10]
 0004A947    mov         edx,dword ptr [ebp-4]
 0004A94A    mov         edx,dword ptr [edx+1C]
 0004A94D    mov         edx,dword ptr [edx+60]
 0004A950    cmp         al,byte ptr [edx+10]
>0004A953    je          0004A980
 0004A955    mov         eax,dword ptr [ebp-4]
 0004A958    mov         eax,dword ptr [eax+20]
 0004A95B    cmp         eax,dword ptr [edx+20]
>0004A95E    jge         0004A980
 0004A960    mov         eax,dword ptr [ebp-4]
 0004A963    mov         eax,dword ptr [eax+14]
 0004A966    cmp         byte ptr [eax+10],1
>0004A96A    jne         0004A977
 0004A96C    mov         eax,dword ptr [ebp-4]
 0004A96F    mov         eax,dword ptr [eax+1C]
 0004A972    sub         esi,dword ptr [eax+0C]
>0004A975    jmp         0004A980
 0004A977    mov         eax,dword ptr [ebp-4]
 0004A97A    mov         eax,dword ptr [eax+1C]
 0004A97D    sub         ebx,dword ptr [eax+0C]
 0004A980    push        esi
 0004A981    lea         eax,[ebp-14]
 0004A984    push        eax
 0004A985    mov         edx,1
 0004A98A    mov         eax,dword ptr [ebp-4]
 0004A98D    call        TDockZone.GetTopLeft
 0004A992    push        eax
 0004A993    mov         edx,2
 0004A998    mov         eax,dword ptr [ebp-4]
 0004A99B    call        TDockZone.GetTopLeft
 0004A9A0    mov         ecx,ebx
 0004A9A2    pop         edx
 0004A9A3    call        Bounds
 0004A9A8    lea         ecx,[ebp-14]
 0004A9AB    mov         eax,dword ptr [ebp-4]
 0004A9AE    mov         edx,dword ptr [eax+4]
 0004A9B1    mov         eax,dword ptr [ebp-4]
 0004A9B4    mov         eax,dword ptr [eax+1C]
 0004A9B7    mov         ebx,dword ptr [eax]
 0004A9B9    call        dword ptr [ebx]
 0004A9BB    lea         edx,[ebp-14]
 0004A9BE    mov         eax,dword ptr [ebp-4]
 0004A9C1    mov         eax,dword ptr [eax+4]
 0004A9C4    call        TControl.SetBoundsRect
 0004A9C9    pop         edi
 0004A9CA    pop         esi
 0004A9CB    pop         ebx
 0004A9CC    mov         esp,ebp
 0004A9CE    pop         ebp
 0004A9CF    ret
*}
end;

//0004A9D0
constructor TDockTree.Create(DockSite:TWinControl);
begin
{*
 0004A9D0    push        ebp
 0004A9D1    mov         ebp,esp
 0004A9D3    add         esp,0FFFFFFF4
 0004A9D6    push        ebx
 0004A9D7    push        esi
 0004A9D8    push        edi
 0004A9D9    test        dl,dl
>0004A9DB    je          0004A9E5
 0004A9DD    add         esp,0FFFFFFF0
 0004A9E0    call        @ClassCreate
 0004A9E5    mov         dword ptr [ebp-0C],ecx
 0004A9E8    mov         byte ptr [ebp-5],dl
 0004A9EB    mov         dword ptr [ebp-4],eax
 0004A9EE    mov         eax,dword ptr [ebp-4]
 0004A9F1    mov         dword ptr [eax+0C],4
 0004A9F8    mov         eax,dword ptr [ebp-4]
 0004A9FB    mov         edx,dword ptr [ebp-0C]
 0004A9FE    mov         dword ptr [eax+14],edx
 0004AA01    mov         eax,dword ptr [ebp-4]
 0004AA04    mov         dword ptr [eax+6C],40000
 0004AA0B    mov         eax,dword ptr [ebp-4]
 0004AA0E    mov         dword ptr [eax+18],0B
 0004AA15    mov         eax,dword ptr [ebp-0C]
 0004AA18    mov         al,byte ptr [eax+4B]
 0004AA1B    cmp         al,1
>0004AA1D    je          0004AA23
 0004AA1F    cmp         al,2
>0004AA21    jne         0004AA27
 0004AA23    xor         eax,eax
>0004AA25    jmp         0004AA29
 0004AA27    mov         al,1
 0004AA29    mov         edx,dword ptr [ebp-4]
 0004AA2C    mov         byte ptr [edx+1C],al
 0004AA2F    mov         ecx,dword ptr [ebp-4]
 0004AA32    mov         dl,1
 0004AA34    mov         eax,[0003FB5C];TDockZone
 0004AA39    call        TDockZone.Create
 0004AA3E    mov         edx,dword ptr [ebp-4]
 0004AA41    mov         dword ptr [edx+60],eax
 0004AA44    mov         dl,1
 0004AA46    mov         eax,[0002899C];TBrush
 0004AA4B    call        TBrush.Create
 0004AA50    mov         ebx,eax
 0004AA52    mov         eax,dword ptr [ebp-4]
 0004AA55    mov         dword ptr [eax+10],ebx
 0004AA58    mov         edx,0FFFFFF
 0004AA5D    xor         eax,eax
 0004AA5F    call        AllocPatternBitmap
 0004AA64    mov         edx,eax
 0004AA66    mov         eax,ebx
 0004AA68    call        TBrush.SetBitmap
 0004AA6D    mov         eax,dword ptr [ebp-4]
 0004AA70    call        TDockTree.BeginUpdate
 0004AA75    xor         eax,eax
 0004AA77    push        ebp
 0004AA78    push        4AAD2
 0004AA7D    push        dword ptr fs:[eax]
 0004AA80    mov         dword ptr fs:[eax],esp
 0004AA83    mov         eax,dword ptr [ebp-0C]
 0004AA86    call        TWinControl.GetControlCount
 0004AA8B    mov         ebx,eax
 0004AA8D    dec         ebx
 0004AA8E    test        ebx,ebx
>0004AA90    jl          0004AAB1
 0004AA92    inc         ebx
 0004AA93    xor         esi,esi
 0004AA95    push        0
 0004AA97    mov         edx,esi
 0004AA99    mov         eax,dword ptr [ebp-0C]
 0004AA9C    call        TWinControl.GetControl
 0004AAA1    mov         edx,eax
 0004AAA3    mov         cl,3
 0004AAA5    mov         eax,dword ptr [ebp-4]
 0004AAA8    mov         edi,dword ptr [eax]
 0004AAAA    call        dword ptr [edi+8]
 0004AAAD    inc         esi
 0004AAAE    dec         ebx
>0004AAAF    jne         0004AA95
 0004AAB1    mov         eax,dword ptr [ebp-4]
 0004AAB4    mov         eax,dword ptr [eax+60]
 0004AAB7    call        TDockZone.ResetChildren
 0004AABC    xor         eax,eax
 0004AABE    pop         edx
 0004AABF    pop         ecx
 0004AAC0    pop         ecx
 0004AAC1    mov         dword ptr fs:[eax],edx
 0004AAC4    push        4AAD9
 0004AAC9    mov         eax,dword ptr [ebp-4]
 0004AACC    call        TDockTree.EndUpdate
 0004AAD1    ret
>0004AAD2    jmp         @HandleFinally
>0004AAD7    jmp         0004AAC9
 0004AAD9    mov         eax,dword ptr [ebp-0C]
 0004AADC    test        byte ptr [eax+20],10
>0004AAE0    jne         0004AB0A
 0004AAE2    mov         eax,dword ptr [ebp-4]
 0004AAE5    mov         edx,dword ptr [ebp-4]
 0004AAE8    mov         edx,dword ptr [edx+14]
 0004AAEB    mov         ecx,dword ptr [edx+28]
 0004AAEE    mov         dword ptr [eax+30],ecx
 0004AAF1    mov         ecx,dword ptr [edx+2C]
 0004AAF4    mov         dword ptr [eax+34],ecx
 0004AAF7    mov         eax,dword ptr [ebp-4]
 0004AAFA    mov         eax,dword ptr [eax+14]
 0004AAFD    mov         edx,dword ptr [ebp-4]
 0004AB00    mov         dword ptr [eax+2C],edx
 0004AB03    mov         dword ptr [eax+28],4C6D8;TDockTree.WindowProc
 0004AB0A    mov         eax,dword ptr [ebp-4]
 0004AB0D    cmp         byte ptr [ebp-5],0
>0004AB11    je          0004AB22
 0004AB13    call        @AfterConstruction
 0004AB18    pop         dword ptr fs:[0]
 0004AB1F    add         esp,0C
 0004AB22    mov         eax,dword ptr [ebp-4]
 0004AB25    pop         edi
 0004AB26    pop         esi
 0004AB27    pop         ebx
 0004AB28    mov         esp,ebp
 0004AB2A    pop         ebp
 0004AB2B    ret
*}
end;

//0004AB2C
destructor TDockTree.Destroy;
begin
{*
 0004AB2C    push        ebx
 0004AB2D    push        esi
 0004AB2E    call        @BeforeDestruction
 0004AB33    mov         ebx,edx
 0004AB35    mov         esi,eax
 0004AB37    cmp         dword ptr [esi+30],0
>0004AB3B    je          0004AB4C
 0004AB3D    mov         eax,dword ptr [esi+14]
 0004AB40    mov         edx,dword ptr [esi+30]
 0004AB43    mov         dword ptr [eax+28],edx
 0004AB46    mov         edx,dword ptr [esi+34]
 0004AB49    mov         dword ptr [eax+2C],edx
 0004AB4C    mov         edx,dword ptr [esi+60]
 0004AB4F    mov         eax,esi
 0004AB51    call        TDockTree.PruneZone
 0004AB56    mov         eax,dword ptr [esi+10]
 0004AB59    call        TObject.Free
 0004AB5E    mov         edx,ebx
 0004AB60    and         dl,0FC
 0004AB63    mov         eax,esi
 0004AB65    call        TObject.Destroy
 0004AB6A    test        bl,bl
>0004AB6C    jle         0004AB75
 0004AB6E    mov         eax,esi
 0004AB70    call        @ClassDestroy
 0004AB75    pop         esi
 0004AB76    pop         ebx
 0004AB77    ret
*}
end;

//0004AB78
procedure TDockTree.AdjustDockRect(Control:TControl; var ARect:TRect);
begin
{*
 0004AB78    mov         eax,dword ptr [eax+14]
 0004AB7B    mov         al,byte ptr [eax+4B]
 0004AB7E    dec         eax
 0004AB7F    sub         al,2
>0004AB81    jae         0004AB87
 0004AB83    add         dword ptr [ecx],0B
 0004AB86    ret
 0004AB87    add         dword ptr [ecx+4],0B
 0004AB8B    ret
*}
end;

//0004AB8C
procedure TDockTree.BeginUpdate;
begin
{*
 0004AB8C    inc         dword ptr [eax+68]
 0004AB8F    ret
*}
end;

//0004AB90
procedure TDockTree.EndUpdate;
begin
{*
 0004AB90    dec         dword ptr [eax+68]
 0004AB93    cmp         dword ptr [eax+68],0
>0004AB97    jg          0004ABA3
 0004AB99    xor         edx,edx
 0004AB9B    mov         dword ptr [eax+68],edx
 0004AB9E    call        TDockTree.UpdateAll
 0004ABA3    ret
*}
end;

//0004ABA4
procedure DoFindControlZone(StartZone:TDockZone);
begin
{*
 0004ABA4    push        ebp
 0004ABA5    mov         ebp,esp
 0004ABA7    push        ebx
 0004ABA8    mov         ebx,eax
 0004ABAA    mov         eax,dword ptr [ebp+8]
 0004ABAD    mov         eax,dword ptr [eax-4]
 0004ABB0    cmp         eax,dword ptr [ebx+4]
>0004ABB3    jne         0004ABBE
 0004ABB5    mov         eax,dword ptr [ebp+8]
 0004ABB8    mov         dword ptr [eax-8],ebx
 0004ABBB    pop         ebx
 0004ABBC    pop         ebp
 0004ABBD    ret
 0004ABBE    mov         eax,dword ptr [ebp+8]
 0004ABC1    cmp         dword ptr [eax-8],0
>0004ABC5    jne         0004ABDA
 0004ABC7    cmp         dword ptr [ebx+0C],0
>0004ABCB    je          0004ABDA
 0004ABCD    mov         eax,dword ptr [ebp+8]
 0004ABD0    push        eax
 0004ABD1    mov         eax,dword ptr [ebx+0C]
 0004ABD4    call        DoFindControlZone
 0004ABD9    pop         ecx
 0004ABDA    mov         eax,dword ptr [ebp+8]
 0004ABDD    cmp         dword ptr [eax-8],0
>0004ABE1    jne         0004ABF6
 0004ABE3    cmp         dword ptr [ebx+8],0
>0004ABE7    je          0004ABF6
 0004ABE9    mov         eax,dword ptr [ebp+8]
 0004ABEC    push        eax
 0004ABED    mov         eax,dword ptr [ebx+8]
 0004ABF0    call        DoFindControlZone
 0004ABF5    pop         ecx
 0004ABF6    pop         ebx
 0004ABF7    pop         ebp
 0004ABF8    ret
*}
end;

//0004ABFC
function TDockTree.FindControlZone(Control:TControl):TDockZone;
begin
{*
 0004ABFC    push        ebp
 0004ABFD    mov         ebp,esp
 0004ABFF    add         esp,0FFFFFFF8
 0004AC02    mov         dword ptr [ebp-4],edx
 0004AC05    xor         edx,edx
 0004AC07    mov         dword ptr [ebp-8],edx
 0004AC0A    cmp         dword ptr [ebp-4],0
>0004AC0E    je          0004AC20
 0004AC10    cmp         dword ptr [eax+60],0
>0004AC14    je          0004AC20
 0004AC16    push        ebp
 0004AC17    mov         eax,dword ptr [eax+60]
 0004AC1A    call        DoFindControlZone
 0004AC1F    pop         ecx
 0004AC20    mov         eax,dword ptr [ebp-8]
 0004AC23    pop         ecx
 0004AC24    pop         ecx
 0004AC25    pop         ebp
 0004AC26    ret
*}
end;

//0004AC28
procedure DoForEach(Zone:TDockZone);
begin
{*
 0004AC28    push        ebp
 0004AC29    mov         ebp,esp
 0004AC2B    push        ebx
 0004AC2C    push        esi
 0004AC2D    mov         ebx,eax
 0004AC2F    mov         eax,dword ptr [ebp+8]
 0004AC32    lea         esi,[eax+8]
 0004AC35    mov         edx,ebx
 0004AC37    mov         eax,dword ptr [esi+4]
 0004AC3A    call        dword ptr [esi]
 0004AC3C    mov         eax,dword ptr [ebx+0C]
 0004AC3F    test        eax,eax
>0004AC41    je          0004AC4D
 0004AC43    mov         edx,dword ptr [ebp+8]
 0004AC46    push        edx
 0004AC47    call        DoForEach
 0004AC4C    pop         ecx
 0004AC4D    mov         eax,dword ptr [ebx+8]
 0004AC50    test        eax,eax
>0004AC52    je          0004AC5E
 0004AC54    mov         edx,dword ptr [ebp+8]
 0004AC57    push        edx
 0004AC58    call        DoForEach
 0004AC5D    pop         ecx
 0004AC5E    pop         esi
 0004AC5F    pop         ebx
 0004AC60    pop         ebp
 0004AC61    ret
*}
end;

//0004AC64
procedure TDockTree.ForEachAt(Zone:TDockZone; Proc:TForEachZoneProc);
begin
{*
 0004AC64    push        ebp
 0004AC65    mov         ebp,esp
 0004AC67    test        edx,edx
>0004AC69    jne         0004AC6E
 0004AC6B    mov         edx,dword ptr [eax+60]
 0004AC6E    push        ebp
 0004AC6F    mov         eax,edx
 0004AC71    call        DoForEach
 0004AC76    pop         ecx
 0004AC77    pop         ebp
 0004AC78    ret         8
*}
end;

//0004AC7C
procedure TDockTree.GetControlBounds(Control:TControl; var CtlBounds:TRect);
begin
{*
 0004AC7C    push        ebx
 0004AC7D    push        esi
 0004AC7E    push        edi
 0004AC7F    add         esp,0FFFFFFF0
 0004AC82    mov         esi,ecx
 0004AC84    call        TDockTree.FindControlZone
 0004AC89    mov         ebx,eax
 0004AC8B    test        ebx,ebx
>0004AC8D    jne         0004AC9F
 0004AC8F    mov         eax,esi
 0004AC91    xor         ecx,ecx
 0004AC93    mov         edx,10
 0004AC98    call        @FillChar
>0004AC9D    jmp         0004ACE9
 0004AC9F    mov         edx,1
 0004ACA4    mov         eax,ebx
 0004ACA6    call        TDockZone.GetHeightWidth
 0004ACAB    push        eax
 0004ACAC    lea         eax,[esp+4]
 0004ACB0    push        eax
 0004ACB1    mov         edx,2
 0004ACB6    mov         eax,ebx
 0004ACB8    call        TDockZone.GetHeightWidth
 0004ACBD    push        eax
 0004ACBE    mov         edx,1
 0004ACC3    mov         eax,ebx
 0004ACC5    call        TDockZone.GetTopLeft
 0004ACCA    push        eax
 0004ACCB    mov         edx,2
 0004ACD0    mov         eax,ebx
 0004ACD2    call        TDockZone.GetTopLeft
 0004ACD7    pop         edx
 0004ACD8    pop         ecx
 0004ACD9    call        Bounds
 0004ACDE    mov         edi,esi
 0004ACE0    mov         esi,esp
 0004ACE2    mov         ecx,4
 0004ACE7    rep movs    dword ptr [edi],dword ptr [esi]
 0004ACE9    add         esp,10
 0004ACEC    pop         edi
 0004ACED    pop         esi
 0004ACEE    pop         ebx
 0004ACEF    ret
*}
end;

//0004ACF0
function TDockTree.HitTest(const MousePos:TPoint; var HTFlag:Integer):TControl;
begin
{*
 0004ACF0    call        TDockTree.InternalHitTest
 0004ACF5    test        eax,eax
>0004ACF7    je          0004ACFD
 0004ACF9    mov         eax,dword ptr [eax+4]
 0004ACFC    ret
 0004ACFD    xor         eax,eax
 0004ACFF    ret
*}
end;

//0004AD00
procedure TDockTree.InsertControl(Control:TControl; InsertAt:TAlign; DropCtl:TControl);
begin
{*
 0004AD00    push        ebp
 0004AD01    mov         ebp,esp
 0004AD03    add         esp,0FFFFFFD0
 0004AD06    push        ebx
 0004AD07    push        esi
 0004AD08    push        edi
 0004AD09    mov         byte ptr [ebp-1],cl
 0004AD0C    mov         esi,edx
 0004AD0E    mov         ebx,eax
 0004AD10    cmp         byte ptr [esi+47],0
>0004AD14    je          0004AF04
 0004AD1A    mov         eax,dword ptr [ebx+38]
 0004AD1D    test        eax,eax
>0004AD1F    je          0004AD2E
 0004AD21    mov         dword ptr [eax+4],esi
 0004AD24    call        TDockZone.Update
>0004AD29    jmp         0004AEFC
 0004AD2E    mov         eax,dword ptr [ebx+60]
 0004AD31    cmp         dword ptr [eax+8],0
>0004AD35    jne         0004ADE1
 0004AD3B    lea         edx,[ebp-20]
 0004AD3E    mov         eax,dword ptr [ebx+14]
 0004AD41    mov         ecx,dword ptr [eax]
 0004AD43    call        dword ptr [ecx+44]
 0004AD46    lea         edx,[ebp-20]
 0004AD49    mov         eax,dword ptr [ebx+14]
 0004AD4C    mov         ecx,dword ptr [eax]
 0004AD4E    call        dword ptr [ecx+88]
 0004AD54    mov         edi,dword ptr [ebp-18]
 0004AD57    sub         edi,dword ptr [ebp-20]
 0004AD5A    mov         eax,dword ptr [ebp-14]
 0004AD5D    sub         eax,dword ptr [ebp-1C]
 0004AD60    mov         dword ptr [ebp-10],eax
 0004AD63    mov         eax,dword ptr [ebx+14]
 0004AD66    cmp         byte ptr [eax+4C],0
>0004AD6A    je          0004AD89
 0004AD6C    test        edi,edi
>0004AD6E    jne         0004AD79
 0004AD70    mov         eax,esi
 0004AD72    call        TControl.GetUndockWidth
 0004AD77    mov         edi,eax
 0004AD79    cmp         dword ptr [ebp-10],0
>0004AD7D    jne         0004AD89
 0004AD7F    mov         eax,esi
 0004AD81    call        TControl.GetUndockHeight
 0004AD86    mov         dword ptr [ebp-10],eax
 0004AD89    mov         eax,dword ptr [ebp-10]
 0004AD8C    push        eax
 0004AD8D    lea         eax,[ebp-30]
 0004AD90    push        eax
 0004AD91    mov         ecx,edi
 0004AD93    mov         edx,dword ptr [ebp-1C]
 0004AD96    mov         eax,dword ptr [ebp-20]
 0004AD99    call        Bounds
 0004AD9E    push        esi
 0004AD9F    lea         esi,[ebp-30]
 0004ADA2    lea         edi,[ebp-20]
 0004ADA5    mov         ecx,4
 0004ADAA    rep movs    dword ptr [edi],dword ptr [esi]
 0004ADAC    pop         esi
 0004ADAD    lea         ecx,[ebp-20]
 0004ADB0    mov         edx,esi
 0004ADB2    mov         eax,ebx
 0004ADB4    mov         edi,dword ptr [eax]
 0004ADB6    call        dword ptr [edi]
 0004ADB8    lea         edx,[ebp-20]
 0004ADBB    mov         eax,esi
 0004ADBD    call        TControl.SetBoundsRect
 0004ADC2    mov         ecx,ebx
 0004ADC4    mov         dl,1
 0004ADC6    mov         eax,[0003FB5C];TDockZone
 0004ADCB    call        TDockZone.Create
 0004ADD0    mov         edx,dword ptr [ebx+60]
 0004ADD3    mov         dword ptr [edx+8],eax
 0004ADD6    mov         dword ptr [eax+14],edx
 0004ADD9    mov         dword ptr [eax+4],esi
>0004ADDC    jmp         0004AEFC
 0004ADE1    mov         al,byte ptr [ebp-1]
 0004ADE4    test        al,al
>0004ADE6    je          0004ADEC
 0004ADE8    sub         al,5
>0004ADEA    jne         0004ADF0
 0004ADEC    mov         byte ptr [ebp-1],4
 0004ADF0    mov         edx,esi
 0004ADF2    mov         eax,ebx
 0004ADF4    call        TDockTree.FindControlZone
 0004ADF9    test        eax,eax
>0004ADFB    je          0004AE06
 0004ADFD    mov         edx,eax
 0004ADFF    mov         eax,ebx
 0004AE01    call        TDockTree.RemoveZone
 0004AE06    mov         edx,dword ptr [ebp+8]
 0004AE09    mov         eax,ebx
 0004AE0B    call        TDockTree.FindControlZone
 0004AE10    mov         dword ptr [ebp-8],eax
 0004AE13    xor         eax,eax
 0004AE15    mov         al,byte ptr [ebp-1]
 0004AE18    mov         al,byte ptr [eax+0B487C]
 0004AE1E    mov         byte ptr [ebp-9],al
 0004AE21    mov         eax,dword ptr [ebx+60]
 0004AE24    call        TDockZone.GetChildCount
 0004AE29    dec         eax
>0004AE2A    jne         0004AE90
 0004AE2C    mov         edi,dword ptr [ebx+60]
 0004AE2F    mov         al,byte ptr [ebp-9]
 0004AE32    mov         byte ptr [edi+10],al
 0004AE35    mov         al,byte ptr [ebp-9]
 0004AE38    dec         al
>0004AE3A    je          0004AE42
 0004AE3C    dec         al
>0004AE3E    je          0004AE6A
>0004AE40    jmp         0004AE90
 0004AE42    mov         eax,dword ptr [edi+8]
 0004AE45    mov         edx,2
 0004AE4A    call        TDockZone.GetHeightWidth
 0004AE4F    mov         edx,dword ptr [ebx+60]
 0004AE52    mov         dword ptr [edx+20],eax
 0004AE55    mov         eax,dword ptr [ebx+60]
 0004AE58    mov         eax,dword ptr [eax+8]
 0004AE5B    mov         edx,1
 0004AE60    call        TDockZone.GetHeightWidth
 0004AE65    mov         dword ptr [ebx+64],eax
>0004AE68    jmp         0004AE90
 0004AE6A    mov         eax,dword ptr [edi+8]
 0004AE6D    mov         edx,1
 0004AE72    call        TDockZone.GetHeightWidth
 0004AE77    mov         edx,dword ptr [ebx+60]
 0004AE7A    mov         dword ptr [edx+20],eax
 0004AE7D    mov         eax,dword ptr [ebx+60]
 0004AE80    mov         eax,dword ptr [eax+8]
 0004AE83    mov         edx,2
 0004AE88    call        TDockZone.GetHeightWidth
 0004AE8D    mov         dword ptr [ebx+64],eax
 0004AE90    mov         ecx,ebx
 0004AE92    mov         dl,1
 0004AE94    mov         eax,[0003FB5C];TDockZone
 0004AE99    call        TDockZone.Create
 0004AE9E    mov         dword ptr [eax+4],esi
 0004AEA1    cmp         dword ptr [ebp-8],0
>0004AEA5    je          0004AEB2
 0004AEA7    mov         edx,dword ptr [ebp-8]
 0004AEAA    mov         edx,dword ptr [edx+14]
 0004AEAD    mov         dl,byte ptr [edx+10]
>0004AEB0    jmp         0004AEB8
 0004AEB2    mov         edx,dword ptr [ebx+60]
 0004AEB5    mov         dl,byte ptr [edx+10]
 0004AEB8    cmp         byte ptr [ebp-9],0
>0004AEBC    jne         0004AEC1
 0004AEBE    mov         byte ptr [ebp-9],dl
 0004AEC1    cmp         dl,byte ptr [ebp-9]
>0004AEC4    jne         0004AEE0
 0004AEC6    xor         edx,edx
 0004AEC8    mov         dl,byte ptr [ebp-1]
 0004AECB    mov         dl,byte ptr [edx+0B4884]
 0004AED1    push        edx
 0004AED2    mov         ecx,dword ptr [ebp-8]
 0004AED5    mov         edx,eax
 0004AED7    mov         eax,ebx
 0004AED9    call        TDockTree.InsertSibling
>0004AEDE    jmp         0004AEFC
 0004AEE0    mov         dl,byte ptr [ebp-9]
 0004AEE3    push        edx
 0004AEE4    xor         edx,edx
 0004AEE6    mov         dl,byte ptr [ebp-1]
 0004AEE9    mov         dl,byte ptr [edx+0B4884]
 0004AEEF    push        edx
 0004AEF0    mov         ecx,dword ptr [ebp-8]
 0004AEF3    mov         edx,eax
 0004AEF5    mov         eax,ebx
 0004AEF7    call        TDockTree.InsertNewParent
 0004AEFC    mov         eax,dword ptr [ebx+14]
 0004AEFF    mov         edx,dword ptr [eax]
 0004AF01    call        dword ptr [edx+78]
 0004AF04    pop         edi
 0004AF05    pop         esi
 0004AF06    pop         ebx
 0004AF07    mov         esp,ebp
 0004AF09    pop         ebp
 0004AF0A    ret         4
*}
end;

//0004AF10
procedure TDockTree.InsertNewParent(NewZone:TDockZone; SiblingZone:TDockZone; ParentOrientation:TDockOrientation; InsertLast:Boolean);
begin
{*
 0004AF10    push        ebp
 0004AF11    mov         ebp,esp
 0004AF13    push        ecx
 0004AF14    push        ebx
 0004AF15    push        esi
 0004AF16    push        edi
 0004AF17    mov         edi,ecx
 0004AF19    mov         dword ptr [ebp-4],edx
 0004AF1C    mov         esi,eax
 0004AF1E    mov         ecx,esi
 0004AF20    mov         dl,1
 0004AF22    mov         eax,[0003FB5C];TDockZone
 0004AF27    call        TDockZone.Create
 0004AF2C    mov         ebx,eax
 0004AF2E    mov         al,byte ptr [ebp+0C]
 0004AF31    mov         byte ptr [ebx+10],al
 0004AF34    test        edi,edi
>0004AF36    jne         0004B00B
 0004AF3C    mov         eax,dword ptr [esi+64]
 0004AF3F    mov         dword ptr [ebx+20],eax
 0004AF42    mov         eax,dword ptr [esi+60]
 0004AF45    mov         eax,dword ptr [eax+20]
 0004AF48    mov         dword ptr [esi+64],eax
 0004AF4B    mov         al,byte ptr [ebp+0C]
 0004AF4E    mov         byte ptr [esi+44],al
 0004AF51    xor         eax,eax
 0004AF53    mov         dword ptr [esi+3C],eax
 0004AF56    mov         dword ptr [esi+40],3FE00000
 0004AF5D    cmp         byte ptr [ebp+8],0
>0004AF61    je          0004AF96
 0004AF63    mov         eax,dword ptr [esi+60]
 0004AF66    mov         dword ptr [ebx+8],eax
 0004AF69    mov         eax,dword ptr [esi+60]
 0004AF6C    mov         dword ptr [eax+14],ebx
 0004AF6F    mov         edx,dword ptr [ebp-4]
 0004AF72    mov         dword ptr [eax+0C],edx
 0004AF75    mov         edx,dword ptr [ebp-4]
 0004AF78    mov         dword ptr [edx+18],eax
 0004AF7B    mov         eax,dword ptr [ebp-4]
 0004AF7E    mov         dword ptr [eax+14],ebx
 0004AF81    mov         dword ptr [esi+60],ebx
 0004AF84    push        esi
 0004AF85    push        4BF28;TDockTree.ScaleZone
 0004AF8A    mov         edx,dword ptr [ebx+8]
 0004AF8D    mov         eax,esi
 0004AF8F    call        TDockTree.ForEachAt
>0004AF94    jmp         0004AFFA
 0004AF96    mov         eax,dword ptr [ebp-4]
 0004AF99    mov         dword ptr [ebx+8],eax
 0004AF9C    mov         eax,dword ptr [esi+60]
 0004AF9F    mov         dword ptr [eax+14],ebx
 0004AFA2    mov         edx,dword ptr [ebp-4]
 0004AFA5    mov         dword ptr [eax+18],edx
 0004AFA8    mov         edx,dword ptr [ebp-4]
 0004AFAB    mov         dword ptr [edx+0C],eax
 0004AFAE    mov         eax,dword ptr [ebp-4]
 0004AFB1    mov         dword ptr [eax+14],ebx
 0004AFB4    mov         dword ptr [esi+60],ebx
 0004AFB7    push        esi
 0004AFB8    push        4BF28;TDockTree.ScaleZone
 0004AFBD    mov         edx,dword ptr [ebx+8]
 0004AFC0    mov         eax,esi
 0004AFC2    call        TDockTree.ForEachAt
 0004AFC7    mov         eax,dword ptr [esi+60]
 0004AFCA    mov         eax,dword ptr [eax+20]
 0004AFCD    sar         eax,1
>0004AFCF    jns         0004AFD4
 0004AFD1    adc         eax,0
 0004AFD4    mov         dword ptr [esi+48],eax
 0004AFD7    push        esi
 0004AFD8    push        4C27C;TDockTree.ShiftZone
 0004AFDD    mov         edx,dword ptr [ebx+8]
 0004AFE0    mov         eax,esi
 0004AFE2    call        TDockTree.ForEachAt
 0004AFE7    mov         eax,dword ptr [esi+60]
 0004AFEA    mov         eax,dword ptr [eax+20]
 0004AFED    sar         eax,1
>0004AFEF    jns         0004AFF4
 0004AFF1    adc         eax,0
 0004AFF4    mov         edx,dword ptr [ebp-4]
 0004AFF7    mov         dword ptr [edx+20],eax
 0004AFFA    push        esi
 0004AFFB    push        4C398;TDockTree.UpdateZone
 0004B000    xor         edx,edx
 0004B002    mov         eax,esi
 0004B004    call        TDockTree.ForEachAt
>0004B009    jmp         0004B078
 0004B00B    mov         eax,dword ptr [edi+20]
 0004B00E    mov         dword ptr [ebx+20],eax
 0004B011    mov         eax,dword ptr [edi+14]
 0004B014    mov         dword ptr [ebx+14],eax
 0004B017    mov         eax,dword ptr [edi+18]
 0004B01A    mov         dword ptr [ebx+18],eax
 0004B01D    test        eax,eax
>0004B01F    je          0004B024
 0004B021    mov         dword ptr [eax+0C],ebx
 0004B024    mov         eax,dword ptr [edi+0C]
 0004B027    mov         dword ptr [ebx+0C],eax
 0004B02A    test        eax,eax
>0004B02C    je          0004B031
 0004B02E    mov         dword ptr [eax+18],ebx
 0004B031    mov         eax,dword ptr [ebx+14]
 0004B034    cmp         edi,dword ptr [eax+8]
>0004B037    jne         0004B03C
 0004B039    mov         dword ptr [eax+8],ebx
 0004B03C    mov         eax,dword ptr [ebp-4]
 0004B03F    mov         dword ptr [eax+14],ebx
 0004B042    mov         dword ptr [edi+14],ebx
 0004B045    cmp         byte ptr [ebp+8],0
>0004B049    je          0004B061
 0004B04B    mov         dword ptr [ebx+8],edi
 0004B04E    xor         eax,eax
 0004B050    mov         dword ptr [edi+18],eax
 0004B053    mov         eax,dword ptr [ebp-4]
 0004B056    mov         dword ptr [edi+0C],eax
 0004B059    mov         eax,dword ptr [ebp-4]
 0004B05C    mov         dword ptr [eax+18],edi
>0004B05F    jmp         0004B078
 0004B061    mov         eax,dword ptr [ebp-4]
 0004B064    mov         dword ptr [ebx+8],eax
 0004B067    mov         eax,dword ptr [ebp-4]
 0004B06A    mov         dword ptr [edi+18],eax
 0004B06D    xor         eax,eax
 0004B06F    mov         dword ptr [edi+0C],eax
 0004B072    mov         eax,dword ptr [ebp-4]
 0004B075    mov         dword ptr [eax+0C],edi
 0004B078    mov         eax,ebx
 0004B07A    call        TDockZone.ResetChildren
 0004B07F    push        esi
 0004B080    push        4C398;TDockTree.UpdateZone
 0004B085    xor         edx,edx
 0004B087    mov         eax,esi
 0004B089    call        TDockTree.ForEachAt
 0004B08E    pop         edi
 0004B08F    pop         esi
 0004B090    pop         ebx
 0004B091    pop         ecx
 0004B092    pop         ebp
 0004B093    ret         8
*}
end;

//0004B098
procedure TDockTree.InsertSibling(NewZone:TDockZone; SiblingZone:TDockZone; InsertLast:Boolean);
begin
{*
 0004B098    push        ebp
 0004B099    mov         ebp,esp
 0004B09B    push        ebx
 0004B09C    mov         ebx,dword ptr [ebp+8]
 0004B09F    test        ecx,ecx
>0004B0A1    jne         0004B0B8
 0004B0A3    mov         eax,dword ptr [eax+60]
 0004B0A6    mov         ecx,dword ptr [eax+8]
 0004B0A9    test        bl,bl
>0004B0AB    je          0004B0B8
>0004B0AD    jmp         0004B0B1
 0004B0AF    mov         ecx,eax
 0004B0B1    mov         eax,dword ptr [ecx+0C]
 0004B0B4    test        eax,eax
>0004B0B6    jne         0004B0AF
 0004B0B8    test        bl,bl
>0004B0BA    je          0004B0D7
 0004B0BC    mov         eax,dword ptr [ecx+14]
 0004B0BF    mov         dword ptr [edx+14],eax
 0004B0C2    mov         dword ptr [edx+18],ecx
 0004B0C5    mov         eax,dword ptr [ecx+0C]
 0004B0C8    mov         dword ptr [edx+0C],eax
 0004B0CB    test        eax,eax
>0004B0CD    je          0004B0D2
 0004B0CF    mov         dword ptr [eax+18],edx
 0004B0D2    mov         dword ptr [ecx+0C],edx
>0004B0D5    jmp         0004B0F8
 0004B0D7    mov         dword ptr [edx+0C],ecx
 0004B0DA    mov         eax,dword ptr [ecx+18]
 0004B0DD    mov         dword ptr [edx+18],eax
 0004B0E0    test        eax,eax
>0004B0E2    je          0004B0E7
 0004B0E4    mov         dword ptr [eax+0C],edx
 0004B0E7    mov         dword ptr [ecx+18],edx
 0004B0EA    mov         eax,dword ptr [ecx+14]
 0004B0ED    mov         dword ptr [edx+14],eax
 0004B0F0    cmp         ecx,dword ptr [eax+8]
>0004B0F3    jne         0004B0F8
 0004B0F5    mov         dword ptr [eax+8],edx
 0004B0F8    mov         eax,dword ptr [ecx+14]
 0004B0FB    call        TDockZone.ResetChildren
 0004B100    pop         ebx
 0004B101    pop         ebp
 0004B102    ret         4
*}
end;

//0004B108
procedure DoFindZone(Zone:TDockZone);
begin
{*
 0004B108    push        ebp
 0004B109    mov         ebp,esp
 0004B10B    push        ebx
 0004B10C    push        esi
 0004B10D    push        edi
 0004B10E    mov         ebx,eax
 0004B110    mov         ecx,dword ptr [ebx+14]
 0004B113    cmp         byte ptr [ecx+10],1
>0004B117    jne         0004B153
 0004B119    mov         eax,dword ptr [ebp+8]
 0004B11C    mov         eax,dword ptr [eax-4]
 0004B11F    mov         eax,dword ptr [eax+4]
 0004B122    mov         edx,dword ptr [ebx+20]
 0004B125    cmp         eax,edx
>0004B127    jg          0004B153
 0004B129    mov         ecx,dword ptr [ebp+8]
 0004B12C    mov         ecx,dword ptr [ecx-4]
 0004B12F    mov         ecx,dword ptr [ebp+8]
 0004B132    mov         ecx,dword ptr [ecx-8]
 0004B135    sub         edx,dword ptr [ecx+0C]
 0004B138    cmp         eax,edx
>0004B13A    jl          0004B153
 0004B13C    mov         eax,dword ptr [ebp+8]
 0004B13F    mov         eax,dword ptr [eax-0C]
 0004B142    mov         dword ptr [eax],12
 0004B148    mov         eax,dword ptr [ebp+8]
 0004B14B    mov         dword ptr [eax-10],ebx
>0004B14E    jmp         0004B2D2
 0004B153    mov         ecx,dword ptr [ebx+14]
 0004B156    cmp         byte ptr [ecx+10],2
>0004B15A    jne         0004B195
 0004B15C    mov         eax,dword ptr [ebp+8]
 0004B15F    mov         eax,dword ptr [eax-4]
 0004B162    mov         eax,dword ptr [eax]
 0004B164    mov         edx,dword ptr [ebx+20]
 0004B167    cmp         eax,edx
>0004B169    jg          0004B195
 0004B16B    mov         ecx,dword ptr [ebp+8]
 0004B16E    mov         ecx,dword ptr [ecx-4]
 0004B171    mov         ecx,dword ptr [ebp+8]
 0004B174    mov         ecx,dword ptr [ecx-8]
 0004B177    sub         edx,dword ptr [ecx+0C]
 0004B17A    cmp         eax,edx
>0004B17C    jl          0004B195
 0004B17E    mov         eax,dword ptr [ebp+8]
 0004B181    mov         eax,dword ptr [eax-0C]
 0004B184    mov         dword ptr [eax],12
 0004B18A    mov         eax,dword ptr [ebp+8]
 0004B18D    mov         dword ptr [eax-10],ebx
>0004B190    jmp         0004B2D2
 0004B195    cmp         dword ptr [ebx+4],0
>0004B199    je          0004B2D2
 0004B19F    mov         edx,1
 0004B1A4    mov         eax,ebx
 0004B1A6    call        TDockZone.GetTopLeft
 0004B1AB    mov         esi,eax
 0004B1AD    mov         edx,2
 0004B1B2    mov         eax,ebx
 0004B1B4    call        TDockZone.GetTopLeft
 0004B1B9    mov         edi,eax
 0004B1BB    mov         eax,dword ptr [ebp+8]
 0004B1BE    mov         eax,dword ptr [eax-8]
 0004B1C1    cmp         byte ptr [eax+1C],0
>0004B1C5    je          0004B259
 0004B1CB    mov         eax,dword ptr [ebp+8]
 0004B1CE    mov         eax,dword ptr [eax-4]
 0004B1D1    cmp         esi,dword ptr [eax+4]
>0004B1D4    jg          0004B2D2
 0004B1DA    mov         eax,dword ptr [ebp+8]
 0004B1DD    mov         eax,dword ptr [eax-4]
 0004B1E0    mov         eax,dword ptr [eax+4]
 0004B1E3    mov         edx,dword ptr [ebp+8]
 0004B1E6    mov         edx,dword ptr [edx-8]
 0004B1E9    add         esi,dword ptr [edx+18]
 0004B1EC    cmp         eax,esi
>0004B1EE    jg          0004B2D2
 0004B1F4    mov         eax,dword ptr [ebp+8]
 0004B1F7    mov         eax,dword ptr [eax-4]
 0004B1FA    cmp         edi,dword ptr [eax]
>0004B1FC    jg          0004B2D2
 0004B202    mov         edx,2
 0004B207    mov         eax,ebx
 0004B209    call        TDockZone.GetHeightWidth
 0004B20E    add         edi,eax
 0004B210    mov         eax,dword ptr [ebp+8]
 0004B213    mov         eax,dword ptr [eax-4]
 0004B216    cmp         edi,dword ptr [eax]
>0004B218    jl          0004B2D2
 0004B21E    mov         eax,dword ptr [ebp+8]
 0004B221    mov         dword ptr [eax-10],ebx
 0004B224    mov         eax,dword ptr [ebx+4]
 0004B227    mov         edx,dword ptr [eax+30]
 0004B22A    add         edx,dword ptr [eax+38]
 0004B22D    sub         edx,0F
 0004B230    mov         eax,dword ptr [ebp+8]
 0004B233    mov         eax,dword ptr [eax-4]
 0004B236    cmp         edx,dword ptr [eax]
>0004B238    jge         0004B24B
 0004B23A    mov         eax,dword ptr [ebp+8]
 0004B23D    mov         eax,dword ptr [eax-0C]
 0004B240    mov         dword ptr [eax],14
>0004B246    jmp         0004B2D2
 0004B24B    mov         eax,dword ptr [ebp+8]
 0004B24E    mov         eax,dword ptr [eax-0C]
 0004B251    mov         dword ptr [eax],2
>0004B257    jmp         0004B2D2
 0004B259    mov         eax,dword ptr [ebp+8]
 0004B25C    mov         eax,dword ptr [eax-4]
 0004B25F    cmp         edi,dword ptr [eax]
>0004B261    jg          0004B2D2
 0004B263    mov         eax,dword ptr [ebp+8]
 0004B266    mov         eax,dword ptr [eax-4]
 0004B269    mov         eax,dword ptr [eax]
 0004B26B    mov         edx,dword ptr [ebp+8]
 0004B26E    mov         edx,dword ptr [edx-8]
 0004B271    add         edi,dword ptr [edx+18]
 0004B274    cmp         eax,edi
>0004B276    jg          0004B2D2
 0004B278    mov         eax,dword ptr [ebp+8]
 0004B27B    mov         eax,dword ptr [eax-4]
 0004B27E    cmp         esi,dword ptr [eax+4]
>0004B281    jg          0004B2D2
 0004B283    mov         edx,1
 0004B288    mov         eax,ebx
 0004B28A    call        TDockZone.GetHeightWidth
 0004B28F    add         esi,eax
 0004B291    mov         eax,dword ptr [ebp+8]
 0004B294    mov         eax,dword ptr [eax-4]
 0004B297    cmp         esi,dword ptr [eax+4]
>0004B29A    jl          0004B2D2
 0004B29C    mov         eax,dword ptr [ebp+8]
 0004B29F    mov         dword ptr [eax-10],ebx
 0004B2A2    mov         eax,dword ptr [ebp+8]
 0004B2A5    mov         eax,dword ptr [eax-4]
 0004B2A8    mov         eax,dword ptr [eax+4]
 0004B2AB    mov         edx,dword ptr [ebx+4]
 0004B2AE    mov         edx,dword ptr [edx+34]
 0004B2B1    add         edx,0F
 0004B2B4    cmp         eax,edx
>0004B2B6    jge         0004B2C6
 0004B2B8    mov         eax,dword ptr [ebp+8]
 0004B2BB    mov         eax,dword ptr [eax-0C]
 0004B2BE    mov         dword ptr [eax],14
>0004B2C4    jmp         0004B2D2
 0004B2C6    mov         eax,dword ptr [ebp+8]
 0004B2C9    mov         eax,dword ptr [eax-0C]
 0004B2CC    mov         dword ptr [eax],2
 0004B2D2    mov         eax,dword ptr [ebp+8]
 0004B2D5    cmp         dword ptr [eax-10],0
>0004B2D9    jne         0004B2EE
 0004B2DB    cmp         dword ptr [ebx+0C],0
>0004B2DF    je          0004B2EE
 0004B2E1    mov         eax,dword ptr [ebp+8]
 0004B2E4    push        eax
 0004B2E5    mov         eax,dword ptr [ebx+0C]
 0004B2E8    call        DoFindZone
 0004B2ED    pop         ecx
 0004B2EE    mov         eax,dword ptr [ebp+8]
 0004B2F1    cmp         dword ptr [eax-10],0
>0004B2F5    jne         0004B30A
 0004B2F7    cmp         dword ptr [ebx+8],0
>0004B2FB    je          0004B30A
 0004B2FD    mov         eax,dword ptr [ebp+8]
 0004B300    push        eax
 0004B301    mov         eax,dword ptr [ebx+8]
 0004B304    call        DoFindZone
 0004B309    pop         ecx
 0004B30A    pop         edi
 0004B30B    pop         esi
 0004B30C    pop         ebx
 0004B30D    pop         ebp
 0004B30E    ret
*}
end;

//0004B310
{*function sub_0004B310(?:?; ?:?):?;
begin
 0004B310    push        ebp
 0004B311    mov         ebp,esp
 0004B313    add         esp,0FFFFFFE8
 0004B316    push        ebx
 0004B317    push        esi
 0004B318    push        edi
 0004B319    mov         edi,eax
 0004B31B    mov         eax,dword ptr [ebp+8]
 0004B31E    mov         eax,dword ptr [eax-8]
 0004B321    mov         eax,dword ptr [eax+14]
 0004B324    call        TWinControl.GetControlCount
 0004B329    mov         esi,eax
 0004B32B    dec         esi
 0004B32C    cmp         esi,0
>0004B32F    jl          0004B399
 0004B331    mov         eax,dword ptr [ebp+8]
 0004B334    mov         eax,dword ptr [eax-8]
 0004B337    mov         eax,dword ptr [eax+14]
 0004B33A    mov         edx,esi
 0004B33C    call        TWinControl.GetControl
 0004B341    mov         ebx,eax
 0004B343    cmp         byte ptr [ebx+47],0;TControl.FVisible:Boolean
>0004B347    je          0004B393
 0004B349    mov         eax,ebx
 0004B34B    mov         edx,dword ptr ds:[3F0BC];TWinControl
 0004B351    call        @IsClass
 0004B356    test        al,al
>0004B358    je          0004B363
 0004B35A    cmp         byte ptr [ebx+16C],0
>0004B361    je          0004B393
 0004B363    lea         ecx,[ebp-8]
 0004B366    mov         edx,dword ptr [edi+4]
 0004B369    sub         edx,dword ptr [ebx+34]
 0004B36C    mov         eax,dword ptr [edi]
 0004B36E    sub         eax,dword ptr [ebx+30]
 0004B371    call        Point
 0004B376    push        dword ptr [ebp-4]
 0004B379    push        dword ptr [ebp-8]
 0004B37C    lea         edx,[ebp-18]
 0004B37F    mov         eax,ebx
 0004B381    mov         ecx,dword ptr [eax]
 0004B383    call        dword ptr [ecx+44];TControl.GetClientRect
 0004B386    lea         eax,[ebp-18]
 0004B389    push        eax
 0004B38A    call        user32.PtInRect
 0004B38F    test        eax,eax
>0004B391    jne         0004B39B
 0004B393    dec         esi
 0004B394    cmp         esi,0FFFFFFFF
>0004B397    jne         0004B331
 0004B399    xor         ebx,ebx
 0004B39B    mov         eax,ebx
 0004B39D    pop         edi
 0004B39E    pop         esi
 0004B39F    pop         ebx
 0004B3A0    mov         esp,ebp
 0004B3A2    pop         ebp
 0004B3A3    ret
end;*}

//0004B3A4
function TDockTree.InternalHitTest(const MousePos:TPoint; var HTFlag:Integer):TDockZone;
begin
{*
 0004B3A4    push        ebp
 0004B3A5    mov         ebp,esp
 0004B3A7    add         esp,0FFFFFFF0
 0004B3AA    push        ebx
 0004B3AB    push        esi
 0004B3AC    mov         dword ptr [ebp-0C],ecx
 0004B3AF    mov         dword ptr [ebp-4],edx
 0004B3B2    mov         dword ptr [ebp-8],eax
 0004B3B5    xor         eax,eax
 0004B3B7    mov         dword ptr [ebp-10],eax
 0004B3BA    mov         eax,dword ptr [ebp-0C]
 0004B3BD    xor         edx,edx
 0004B3BF    mov         dword ptr [eax],edx
 0004B3C1    push        ebp
 0004B3C2    mov         eax,dword ptr [ebp-4]
 0004B3C5    call        0004B310
 0004B3CA    pop         ecx
 0004B3CB    mov         ebx,eax
 0004B3CD    test        ebx,ebx
>0004B3CF    je          0004B3FD
 0004B3D1    mov         eax,dword ptr [ebp-8]
 0004B3D4    mov         eax,dword ptr [eax+14]
 0004B3D7    cmp         eax,dword ptr [ebx+8C]
>0004B3DD    jne         0004B3FD
 0004B3DF    mov         edx,ebx
 0004B3E1    mov         eax,dword ptr [ebp-8]
 0004B3E4    call        TDockTree.FindControlZone
 0004B3E9    mov         dword ptr [ebp-10],eax
 0004B3EC    cmp         dword ptr [ebp-10],0
>0004B3F0    je          0004B427
 0004B3F2    mov         eax,dword ptr [ebp-0C]
 0004B3F5    mov         dword ptr [eax],1
>0004B3FB    jmp         0004B427
 0004B3FD    mov         eax,dword ptr [ebp-8]
 0004B400    mov         esi,dword ptr [eax+60]
 0004B403    cmp         dword ptr [esi+8],0
>0004B407    je          0004B427
 0004B409    mov         eax,esi
 0004B40B    call        TDockZone.GetChildCount
 0004B410    dec         eax
>0004B411    jl          0004B427
 0004B413    test        ebx,ebx
>0004B415    jne         0004B427
 0004B417    push        ebp
 0004B418    mov         eax,dword ptr [ebp-8]
 0004B41B    mov         eax,dword ptr [eax+60]
 0004B41E    mov         eax,dword ptr [eax+8]
 0004B421    call        DoFindZone
 0004B426    pop         ecx
 0004B427    mov         eax,dword ptr [ebp-10]
 0004B42A    pop         esi
 0004B42B    pop         ebx
 0004B42C    mov         esp,ebp
 0004B42E    pop         ebp
 0004B42F    ret
*}
end;

//0004B430
procedure ReadControlName(var ControlName:AnsiString);
begin
{*
 0004B430    push        ebp
 0004B431    mov         ebp,esp
 0004B433    push        ecx
 0004B434    push        ebx
 0004B435    push        esi
 0004B436    mov         ebx,eax
 0004B438    mov         eax,ebx
 0004B43A    call        @LStrClr
 0004B43F    lea         edx,[ebp-4]
 0004B442    mov         eax,dword ptr [ebp+8]
 0004B445    mov         eax,dword ptr [eax-4]
 0004B448    mov         ecx,4
 0004B44D    mov         esi,dword ptr [eax]
 0004B44F    call        dword ptr [esi+4]
 0004B452    cmp         dword ptr [ebp-4],0
>0004B456    jle         0004B472
 0004B458    mov         eax,ebx
 0004B45A    mov         edx,dword ptr [ebp-4]
 0004B45D    call        @LStrSetLength
 0004B462    mov         edx,dword ptr [ebx]
 0004B464    mov         eax,dword ptr [ebp+8]
 0004B467    mov         eax,dword ptr [eax-4]
 0004B46A    mov         ecx,dword ptr [ebp-4]
 0004B46D    mov         ebx,dword ptr [eax]
 0004B46F    call        dword ptr [ebx+4]
 0004B472    pop         esi
 0004B473    pop         ebx
 0004B474    pop         ecx
 0004B475    pop         ebp
 0004B476    ret
*}
end;

//0004B478
procedure TDockTree.LoadFromStream(Stream:TStream);
begin
{*
 0004B478    push        ebp
 0004B479    mov         ebp,esp
 0004B47B    add         esp,0FFFFFFE0
 0004B47E    push        ebx
 0004B47F    push        esi
 0004B480    push        edi
 0004B481    xor         ecx,ecx
 0004B483    mov         dword ptr [ebp-0C],ecx
 0004B486    mov         dword ptr [ebp-4],edx
 0004B489    mov         dword ptr [ebp-8],eax
 0004B48C    xor         eax,eax
 0004B48E    push        ebp
 0004B48F    push        4B663
 0004B494    push        dword ptr fs:[eax]
 0004B497    mov         dword ptr fs:[eax],esp
 0004B49A    mov         eax,dword ptr [ebp-8]
 0004B49D    mov         edx,dword ptr [eax+60]
 0004B4A0    mov         eax,dword ptr [ebp-8]
 0004B4A3    call        TDockTree.PruneZone
 0004B4A8    mov         eax,dword ptr [ebp-8]
 0004B4AB    call        TDockTree.BeginUpdate
 0004B4B0    xor         edx,edx
 0004B4B2    push        ebp
 0004B4B3    push        4B646
 0004B4B8    push        dword ptr fs:[edx]
 0004B4BB    mov         dword ptr fs:[edx],esp
 0004B4BE    lea         edx,[ebp-1C]
 0004B4C1    mov         ecx,4
 0004B4C6    mov         eax,dword ptr [ebp-4]
 0004B4C9    mov         ebx,dword ptr [eax]
 0004B4CB    call        dword ptr [ebx+4]
 0004B4CE    lea         edx,[ebp-20]
 0004B4D1    mov         ecx,4
 0004B4D6    mov         eax,dword ptr [ebp-4]
 0004B4D9    mov         ebx,dword ptr [eax]
 0004B4DB    call        dword ptr [ebx+4]
 0004B4DE    mov         esi,dword ptr [ebp-20]
 0004B4E1    dec         esi
 0004B4E2    test        esi,esi
>0004B4E4    jl          0004B53B
 0004B4E6    inc         esi
 0004B4E7    mov         dword ptr [ebp-1C],0
 0004B4EE    push        ebp
 0004B4EF    lea         eax,[ebp-0C]
 0004B4F2    call        ReadControlName
 0004B4F7    pop         ecx
 0004B4F8    cmp         dword ptr [ebp-0C],0
>0004B4FC    je          0004B535
 0004B4FE    lea         ecx,[ebp-10]
 0004B501    mov         eax,dword ptr [ebp-8]
 0004B504    mov         eax,dword ptr [eax+14]
 0004B507    mov         edx,dword ptr [ebp-0C]
 0004B50A    mov         bx,0FFBE
 0004B50E    call        @CallDynaInst
 0004B513    cmp         dword ptr [ebp-10],0
>0004B517    je          0004B535
 0004B519    xor         edx,edx
 0004B51B    mov         eax,dword ptr [ebp-10]
 0004B51E    call        TControl.SetVisible
 0004B523    push        0
 0004B525    mov         eax,dword ptr [ebp-8]
 0004B528    mov         edx,dword ptr [eax+14]
 0004B52B    xor         ecx,ecx
 0004B52D    mov         eax,dword ptr [ebp-10]
 0004B530    call        TControl.ManualDock
 0004B535    inc         dword ptr [ebp-1C]
 0004B538    dec         esi
>0004B539    jne         0004B4EE
 0004B53B    mov         eax,dword ptr [ebp-8]
 0004B53E    lea         edx,[eax+64]
 0004B541    mov         ecx,4
 0004B546    mov         eax,dword ptr [ebp-4]
 0004B549    mov         ebx,dword ptr [eax]
 0004B54B    call        dword ptr [ebx+4]
 0004B54E    xor         eax,eax
 0004B550    mov         dword ptr [ebp-18],eax
 0004B553    xor         esi,esi
 0004B555    lea         edx,[ebp-14]
 0004B558    mov         ecx,4
 0004B55D    mov         eax,dword ptr [ebp-4]
 0004B560    mov         ebx,dword ptr [eax]
 0004B562    call        dword ptr [ebx+4]
 0004B565    mov         eax,dword ptr [ebp-14]
 0004B568    cmp         eax,dword ptr ds:[0B488C]
>0004B56E    je          0004B630
 0004B574    mov         ecx,dword ptr [ebp-8]
 0004B577    mov         dl,1
 0004B579    mov         eax,[0003FB5C];TDockZone
 0004B57E    call        TDockZone.Create
 0004B583    mov         ebx,eax
 0004B585    lea         edx,[ebx+10]
 0004B588    mov         ecx,1
 0004B58D    mov         eax,dword ptr [ebp-4]
 0004B590    mov         edi,dword ptr [eax]
 0004B592    call        dword ptr [edi+4]
 0004B595    lea         edx,[ebx+20]
 0004B598    mov         ecx,4
 0004B59D    mov         eax,dword ptr [ebp-4]
 0004B5A0    mov         edi,dword ptr [eax]
 0004B5A2    call        dword ptr [edi+4]
 0004B5A5    push        ebp
 0004B5A6    lea         eax,[ebp-0C]
 0004B5A9    call        ReadControlName
 0004B5AE    pop         ecx
 0004B5AF    cmp         dword ptr [ebp-0C],0
>0004B5B3    je          0004B5BF
 0004B5B5    mov         edx,dword ptr [ebp-0C]
 0004B5B8    mov         eax,ebx
 0004B5BA    call        TDockZone.SetControlName
 0004B5BF    cmp         dword ptr [ebp-14],0
>0004B5C3    jne         0004B5CD
 0004B5C5    mov         eax,dword ptr [ebp-8]
 0004B5C8    mov         dword ptr [eax+60],ebx
>0004B5CB    jmp         0004B623
 0004B5CD    mov         eax,dword ptr [ebp-14]
 0004B5D0    cmp         eax,dword ptr [ebp-18]
>0004B5D3    jne         0004B5E3
 0004B5D5    mov         dword ptr [esi+0C],ebx
 0004B5D8    mov         dword ptr [ebx+18],esi
 0004B5DB    mov         eax,dword ptr [esi+14]
 0004B5DE    mov         dword ptr [ebx+14],eax
>0004B5E1    jmp         0004B623
 0004B5E3    mov         eax,dword ptr [ebp-14]
 0004B5E6    cmp         eax,dword ptr [ebp-18]
>0004B5E9    jle         0004B5F3
 0004B5EB    mov         dword ptr [esi+8],ebx
 0004B5EE    mov         dword ptr [ebx+14],esi
>0004B5F1    jmp         0004B623
 0004B5F3    mov         eax,dword ptr [ebp-14]
 0004B5F6    cmp         eax,dword ptr [ebp-18]
>0004B5F9    jge         0004B623
 0004B5FB    mov         eax,esi
 0004B5FD    mov         esi,dword ptr [ebp-18]
 0004B600    sub         esi,dword ptr [ebp-14]
 0004B603    test        esi,esi
>0004B605    jle         0004B617
 0004B607    mov         dword ptr [ebp-1C],1
 0004B60E    mov         eax,dword ptr [eax+14]
 0004B611    inc         dword ptr [ebp-1C]
 0004B614    dec         esi
>0004B615    jne         0004B60E
 0004B617    mov         dword ptr [eax+0C],ebx
 0004B61A    mov         dword ptr [ebx+18],eax
 0004B61D    mov         eax,dword ptr [eax+14]
 0004B620    mov         dword ptr [ebx+14],eax
 0004B623    mov         eax,dword ptr [ebp-14]
 0004B626    mov         dword ptr [ebp-18],eax
 0004B629    mov         esi,ebx
>0004B62B    jmp         0004B555
 0004B630    xor         eax,eax
 0004B632    pop         edx
 0004B633    pop         ecx
 0004B634    pop         ecx
 0004B635    mov         dword ptr fs:[eax],edx
 0004B638    push        4B64D
 0004B63D    mov         eax,dword ptr [ebp-8]
 0004B640    call        TDockTree.EndUpdate
 0004B645    ret
>0004B646    jmp         @HandleFinally
>0004B64B    jmp         0004B63D
 0004B64D    xor         eax,eax
 0004B64F    pop         edx
 0004B650    pop         ecx
 0004B651    pop         ecx
 0004B652    mov         dword ptr fs:[eax],edx
 0004B655    push        4B66A
 0004B65A    lea         eax,[ebp-0C]
 0004B65D    call        @LStrClr
 0004B662    ret
>0004B663    jmp         @HandleFinally
>0004B668    jmp         0004B65A
 0004B66A    pop         edi
 0004B66B    pop         esi
 0004B66C    pop         ebx
 0004B66D    mov         esp,ebp
 0004B66F    pop         ebp
 0004B670    ret
*}
end;

//0004B674
procedure DrawGrabber(OnLeft:Boolean);
begin
{*
 0004B674    push        ebp
 0004B675    mov         ebp,esp
 0004B677    push        ebx
 0004B678    push        esi
 0004B679    push        edi
 0004B67A    mov         ebx,eax
 0004B67C    mov         edi,dword ptr [ebp+8]
 0004B67F    add         edi,0FFFFFFEC
 0004B682    mov         esi,dword ptr [ebp+8]
 0004B685    add         esi,0FFFFFFFC
 0004B688    mov         eax,dword ptr [esi]
 0004B68A    mov         eax,dword ptr [eax+10]
 0004B68D    mov         edx,80000014
 0004B692    call        TPen.SetColor
 0004B697    test        bl,bl
>0004B699    je          0004B6FA
 0004B69B    mov         ecx,dword ptr [edi+4]
 0004B69E    mov         edx,dword ptr [edi]
 0004B6A0    add         edx,2
 0004B6A3    mov         eax,dword ptr [esi]
 0004B6A5    call        TCanvas.MoveTo
 0004B6AA    mov         ecx,dword ptr [edi+4]
 0004B6AD    mov         edx,dword ptr [edi]
 0004B6AF    mov         eax,dword ptr [esi]
 0004B6B1    call        TCanvas.LineTo
 0004B6B6    mov         ecx,dword ptr [edi+0C]
 0004B6B9    inc         ecx
 0004B6BA    mov         edx,dword ptr [edi]
 0004B6BC    mov         eax,dword ptr [esi]
 0004B6BE    call        TCanvas.LineTo
 0004B6C3    mov         eax,dword ptr [esi]
 0004B6C5    mov         eax,dword ptr [eax+10]
 0004B6C8    mov         edx,80000010
 0004B6CD    call        TPen.SetColor
 0004B6D2    mov         ecx,dword ptr [edi+4]
 0004B6D5    mov         edx,dword ptr [edi+8]
 0004B6D8    mov         eax,dword ptr [esi]
 0004B6DA    call        TCanvas.MoveTo
 0004B6DF    mov         ecx,dword ptr [edi+0C]
 0004B6E2    mov         edx,dword ptr [edi+8]
 0004B6E5    mov         eax,dword ptr [esi]
 0004B6E7    call        TCanvas.LineTo
 0004B6EC    mov         ecx,dword ptr [edi+0C]
 0004B6EF    mov         edx,dword ptr [edi]
 0004B6F1    mov         eax,dword ptr [esi]
 0004B6F3    call        TCanvas.LineTo
>0004B6F8    jmp         0004B758
 0004B6FA    mov         ecx,dword ptr [edi+4]
 0004B6FD    add         ecx,2
 0004B700    mov         edx,dword ptr [edi]
 0004B702    mov         eax,dword ptr [esi]
 0004B704    call        TCanvas.MoveTo
 0004B709    mov         ecx,dword ptr [edi+4]
 0004B70C    mov         edx,dword ptr [edi]
 0004B70E    mov         eax,dword ptr [esi]
 0004B710    call        TCanvas.LineTo
 0004B715    mov         ecx,dword ptr [edi+4]
 0004B718    mov         edx,dword ptr [edi+8]
 0004B71B    inc         edx
 0004B71C    mov         eax,dword ptr [esi]
 0004B71E    call        TCanvas.LineTo
 0004B723    mov         eax,dword ptr [esi]
 0004B725    mov         eax,dword ptr [eax+10]
 0004B728    mov         edx,80000010
 0004B72D    call        TPen.SetColor
 0004B732    mov         ecx,dword ptr [edi+0C]
 0004B735    mov         edx,dword ptr [edi]
 0004B737    mov         eax,dword ptr [esi]
 0004B739    call        TCanvas.MoveTo
 0004B73E    mov         ecx,dword ptr [edi+0C]
 0004B741    mov         edx,dword ptr [edi+8]
 0004B744    mov         eax,dword ptr [esi]
 0004B746    call        TCanvas.LineTo
 0004B74B    mov         ecx,dword ptr [edi+4]
 0004B74E    mov         edx,dword ptr [edi+8]
 0004B751    mov         eax,dword ptr [esi]
 0004B753    call        TCanvas.LineTo
 0004B758    pop         edi
 0004B759    pop         esi
 0004B75A    pop         ebx
 0004B75B    pop         ebp
 0004B75C    ret
*}
end;

//0004B760
procedure DrawCloseBtn(OnLeft:Boolean);
begin
{*
 0004B760    push        ebp
 0004B761    mov         ebp,esp
 0004B763    push        ebx
 0004B764    mov         ebx,dword ptr [ebp+8]
 0004B767    add         ebx,0FFFFFFEC
 0004B76A    test        al,al
>0004B76C    je          0004B784
 0004B76E    sub         dword ptr [ebx],5
 0004B771    add         dword ptr [ebx+8],3
 0004B775    mov         eax,dword ptr [ebx+4]
 0004B778    sub         eax,3
 0004B77B    mov         dword ptr [ebx+0C],eax
 0004B77E    sub         dword ptr [ebx+4],0F
>0004B782    jmp         0004B798
 0004B784    sub         dword ptr [ebx+4],5
 0004B788    add         dword ptr [ebx+0C],3
 0004B78C    mov         eax,dword ptr [ebx+8]
 0004B78F    add         eax,3
 0004B792    mov         dword ptr [ebx],eax
 0004B794    add         dword ptr [ebx+8],0F
 0004B798    push        0
 0004B79A    push        1
 0004B79C    push        ebx
 0004B79D    mov         eax,dword ptr [ebp+8]
 0004B7A0    mov         eax,dword ptr [eax-4]
 0004B7A3    call        TCanvas.GetHandle
 0004B7A8    push        eax
 0004B7A9    call        user32.DrawFrameControl
 0004B7AE    pop         ebx
 0004B7AF    pop         ebp
 0004B7B0    ret
*}
end;

//0004B7B4
procedure TDockTree.PaintDockFrame(Canvas:TCanvas; Control:TControl; const ARect:TRect);
begin
{*
 0004B7B4    push        ebp
 0004B7B5    mov         ebp,esp
 0004B7B7    add         esp,0FFFFFFEC
 0004B7BA    push        ebx
 0004B7BB    push        esi
 0004B7BC    mov         dword ptr [ebp-4],edx
 0004B7BF    mov         ebx,dword ptr [ebp+8]
 0004B7C2    mov         eax,dword ptr [eax+14]
 0004B7C5    mov         al,byte ptr [eax+4B]
 0004B7C8    dec         eax
 0004B7C9    sub         al,2
>0004B7CB    jae         0004B81B
 0004B7CD    mov         eax,dword ptr [ebx+0C]
 0004B7D0    inc         eax
 0004B7D1    push        eax
 0004B7D2    lea         eax,[ebp-14]
 0004B7D5    push        eax
 0004B7D6    mov         esi,dword ptr [ebx]
 0004B7D8    add         esi,2
 0004B7DB    mov         ecx,esi
 0004B7DD    add         ecx,2
 0004B7E0    mov         edx,dword ptr [ebx+4]
 0004B7E3    add         edx,2
 0004B7E6    mov         eax,esi
 0004B7E8    call        Rect
 0004B7ED    add         dword ptr [ebp-10],0F
 0004B7F1    push        ebp
 0004B7F2    mov         al,1
 0004B7F4    call        DrawGrabber
 0004B7F9    pop         ecx
 0004B7FA    push        0
 0004B7FC    push        3
 0004B7FE    lea         eax,[ebp-14]
 0004B801    push        eax
 0004B802    call        user32.OffsetRect
 0004B807    push        ebp
 0004B808    mov         al,1
 0004B80A    call        DrawGrabber
 0004B80F    pop         ecx
 0004B810    push        ebp
 0004B811    mov         al,1
 0004B813    call        DrawCloseBtn
 0004B818    pop         ecx
>0004B819    jmp         0004B867
 0004B81B    mov         esi,dword ptr [ebx+4]
 0004B81E    add         esi,2
 0004B821    mov         eax,esi
 0004B823    add         eax,2
 0004B826    push        eax
 0004B827    lea         eax,[ebp-14]
 0004B82A    push        eax
 0004B82B    mov         ecx,dword ptr [ebx+8]
 0004B82E    inc         ecx
 0004B82F    mov         edx,esi
 0004B831    mov         eax,dword ptr [ebx]
 0004B833    add         eax,2
 0004B836    call        Rect
 0004B83B    sub         dword ptr [ebp-0C],0F
 0004B83F    push        ebp
 0004B840    xor         eax,eax
 0004B842    call        DrawGrabber
 0004B847    pop         ecx
 0004B848    push        3
 0004B84A    push        0
 0004B84C    lea         eax,[ebp-14]
 0004B84F    push        eax
 0004B850    call        user32.OffsetRect
 0004B855    push        ebp
 0004B856    xor         eax,eax
 0004B858    call        DrawGrabber
 0004B85D    pop         ecx
 0004B85E    push        ebp
 0004B85F    xor         eax,eax
 0004B861    call        DrawCloseBtn
 0004B866    pop         ecx
 0004B867    pop         esi
 0004B868    pop         ebx
 0004B869    mov         esp,ebp
 0004B86B    pop         ebp
 0004B86C    ret         4
*}
end;

//0004B870
procedure TDockTree.PaintSite(DC:HDC);
begin
{*
 0004B870    push        ebp
 0004B871    mov         ebp,esp
 0004B873    add         esp,0FFFFFFE4
 0004B876    push        ebx
 0004B877    push        esi
 0004B878    push        edi
 0004B879    mov         ebx,edx
 0004B87B    mov         esi,eax
 0004B87D    mov         dl,1
 0004B87F    mov         eax,[0003E18C];TControlCanvas
 0004B884    call        TCanvas.Create
 0004B889    mov         dword ptr [ebp-4],eax
 0004B88C    xor         eax,eax
 0004B88E    push        ebp
 0004B88F    push        4B9B7
 0004B894    push        dword ptr fs:[eax]
 0004B897    mov         dword ptr fs:[eax],esp
 0004B89A    mov         edx,dword ptr [esi+14]
 0004B89D    mov         eax,dword ptr [ebp-4]
 0004B8A0    call        TControlCanvas.SetControl
 0004B8A5    mov         eax,dword ptr [ebp-4]
 0004B8A8    call        TCanvas.Lock
 0004B8AD    xor         eax,eax
 0004B8AF    push        ebp
 0004B8B0    push        4B99A
 0004B8B5    push        dword ptr fs:[eax]
 0004B8B8    mov         dword ptr fs:[eax],esp
 0004B8BB    mov         edx,ebx
 0004B8BD    mov         eax,dword ptr [ebp-4]
 0004B8C0    call        TCanvas.SetHandle
 0004B8C5    xor         eax,eax
 0004B8C7    push        ebp
 0004B8C8    push        4B97D
 0004B8CD    push        dword ptr fs:[eax]
 0004B8D0    mov         dword ptr fs:[eax],esp
 0004B8D3    mov         eax,dword ptr [esi+14]
 0004B8D6    call        TWinControl.GetControlCount
 0004B8DB    dec         eax
 0004B8DC    test        eax,eax
>0004B8DE    jl          0004B965
 0004B8E4    inc         eax
 0004B8E5    mov         dword ptr [ebp-0C],eax
 0004B8E8    mov         dword ptr [ebp-8],0
 0004B8EF    mov         eax,dword ptr [esi+14]
 0004B8F2    mov         edx,dword ptr [ebp-8]
 0004B8F5    call        TWinControl.GetControl
 0004B8FA    mov         ebx,eax
 0004B8FC    cmp         byte ptr [ebx+47],0
>0004B900    je          0004B95D
 0004B902    lea         edx,[ebp-1C]
 0004B905    mov         eax,ebx
 0004B907    call        TControl.GetBoundsRect
 0004B90C    lea         ecx,[ebp-1C]
 0004B90F    mov         edx,ebx
 0004B911    mov         eax,esi
 0004B913    mov         edi,dword ptr [eax]
 0004B915    call        dword ptr [edi]
 0004B917    mov         eax,dword ptr [ebp-1C]
 0004B91A    sub         eax,dword ptr [ebx+30]
 0004B91D    add         eax,eax
 0004B91F    sub         dword ptr [ebp-1C],eax
 0004B922    mov         eax,dword ptr [ebp-18]
 0004B925    sub         eax,dword ptr [ebx+34]
 0004B928    add         eax,eax
 0004B92A    sub         dword ptr [ebp-18],eax
 0004B92D    mov         eax,dword ptr [ebx+38]
 0004B930    mov         edx,dword ptr [ebp-14]
 0004B933    sub         edx,dword ptr [ebp-1C]
 0004B936    sub         eax,edx
 0004B938    add         eax,eax
 0004B93A    sub         dword ptr [ebp-14],eax
 0004B93D    mov         eax,dword ptr [ebx+3C]
 0004B940    mov         edx,dword ptr [ebp-10]
 0004B943    sub         edx,dword ptr [ebp-18]
 0004B946    sub         eax,edx
 0004B948    add         eax,eax
 0004B94A    sub         dword ptr [ebp-10],eax
 0004B94D    lea         eax,[ebp-1C]
 0004B950    push        eax
 0004B951    mov         ecx,ebx
 0004B953    mov         edx,dword ptr [ebp-4]
 0004B956    mov         eax,esi
 0004B958    mov         ebx,dword ptr [eax]
 0004B95A    call        dword ptr [ebx+10]
 0004B95D    inc         dword ptr [ebp-8]
 0004B960    dec         dword ptr [ebp-0C]
>0004B963    jne         0004B8EF
 0004B965    xor         eax,eax
 0004B967    pop         edx
 0004B968    pop         ecx
 0004B969    pop         ecx
 0004B96A    mov         dword ptr fs:[eax],edx
 0004B96D    push        4B984
 0004B972    xor         edx,edx
 0004B974    mov         eax,dword ptr [ebp-4]
 0004B977    call        TCanvas.SetHandle
 0004B97C    ret
>0004B97D    jmp         @HandleFinally
>0004B982    jmp         0004B972
 0004B984    xor         eax,eax
 0004B986    pop         edx
 0004B987    pop         ecx
 0004B988    pop         ecx
 0004B989    mov         dword ptr fs:[eax],edx
 0004B98C    push        4B9A1
 0004B991    mov         eax,dword ptr [ebp-4]
 0004B994    call        TCanvas.Unlock
 0004B999    ret
>0004B99A    jmp         @HandleFinally
>0004B99F    jmp         0004B991
 0004B9A1    xor         eax,eax
 0004B9A3    pop         edx
 0004B9A4    pop         ecx
 0004B9A5    pop         ecx
 0004B9A6    mov         dword ptr fs:[eax],edx
 0004B9A9    push        4B9BE
 0004B9AE    mov         eax,dword ptr [ebp-4]
 0004B9B1    call        TObject.Free
 0004B9B6    ret
>0004B9B7    jmp         @HandleFinally
>0004B9BC    jmp         0004B9AE
 0004B9BE    pop         edi
 0004B9BF    pop         esi
 0004B9C0    pop         ebx
 0004B9C1    mov         esp,ebp
 0004B9C3    pop         ebp
 0004B9C4    ret
*}
end;

//0004B9C8
{*procedure sub_0004B9C8(?:?; ?:?; ?:?; ?:?);
begin
 0004B9C8    push        ebp
 0004B9C9    mov         ebp,esp
 0004B9CB    add         esp,0FFFFFFE0
 0004B9CE    push        ebx
 0004B9CF    push        esi
 0004B9D0    push        edi
 0004B9D1    mov         ebx,eax
 0004B9D3    mov         esi,dword ptr [ebp+8]
 0004B9D6    test        ecx,ecx
>0004B9D8    je          0004B9E7
 0004B9DA    cmp         byte ptr [ecx+88],0
>0004B9E1    jne         0004BA81
 0004B9E7    mov         eax,dword ptr [ebx+14];TDockTree.FDockSite:TWinControl
 0004B9EA    call        TControl.GetClientHeight
 0004B9EF    push        eax
 0004B9F0    lea         eax,[ebp-20]
 0004B9F3    push        eax
 0004B9F4    mov         eax,dword ptr [ebx+14];TDockTree.FDockSite:TWinControl
 0004B9F7    call        TControl.GetClientWidth
 0004B9FC    mov         ecx,eax
 0004B9FE    xor         edx,edx
 0004BA00    xor         eax,eax
 0004BA02    call        Rect
 0004BA07    push        esi
 0004BA08    mov         edi,esi
 0004BA0A    lea         esi,[ebp-20]
 0004BA0D    mov         ecx,4
 0004BA12    rep movs    dword ptr [edi],dword ptr [esi]
 0004BA14    pop         esi
 0004BA15    mov         eax,dword ptr [ebx+14];TDockTree.FDockSite:TWinControl
 0004BA18    call        TWinControl.GetDockClientCount
 0004BA1D    test        eax,eax
>0004BA1F    jle         0004BB00
 0004BA25    mov         al,byte ptr [ebp+0C]
 0004BA28    dec         al
>0004BA2A    je          0004BA60
 0004BA2C    dec         al
>0004BA2E    je          0004BA72
 0004BA30    dec         al
>0004BA32    je          0004BA3D
 0004BA34    dec         al
>0004BA36    je          0004BA4F
>0004BA38    jmp         0004BB00
 0004BA3D    mov         eax,dword ptr [esi+8]
 0004BA40    sar         eax,1
>0004BA42    jns         0004BA47
 0004BA44    adc         eax,0
 0004BA47    mov         dword ptr [esi+8],eax
>0004BA4A    jmp         0004BB00
 0004BA4F    mov         eax,dword ptr [esi+8]
 0004BA52    sar         eax,1
>0004BA54    jns         0004BA59
 0004BA56    adc         eax,0
 0004BA59    mov         dword ptr [esi],eax
>0004BA5B    jmp         0004BB00
 0004BA60    mov         eax,dword ptr [esi+0C]
 0004BA63    sar         eax,1
>0004BA65    jns         0004BA6A
 0004BA67    adc         eax,0
 0004BA6A    mov         dword ptr [esi+0C],eax
>0004BA6D    jmp         0004BB00
 0004BA72    mov         eax,dword ptr [esi+0C]
 0004BA75    sar         eax,1
>0004BA77    jns         0004BA7C
 0004BA79    adc         eax,0
 0004BA7C    mov         dword ptr [esi+4],eax
>0004BA7F    jmp         0004BB00
 0004BA81    mov         eax,dword ptr [ecx+30]
 0004BA84    mov         dword ptr [ebp-4],eax
 0004BA87    mov         eax,dword ptr [ecx+34]
 0004BA8A    mov         dword ptr [ebp-8],eax
 0004BA8D    mov         edi,dword ptr [ecx+38]
 0004BA90    mov         dword ptr [ebp-0C],edi
 0004BA93    mov         eax,dword ptr [ecx+3C]
 0004BA96    mov         dword ptr [ebp-10],eax
 0004BA99    mov         al,byte ptr [ebp+0C]
 0004BA9C    add         al,0FD
 0004BA9E    sub         al,2
>0004BAA0    jae         0004BAAE
 0004BAA2    sar         edi,1
>0004BAA4    jns         0004BAA9
 0004BAA6    adc         edi,0
 0004BAA9    mov         dword ptr [ebp-0C],edi
>0004BAAC    jmp         0004BAC3
 0004BAAE    mov         al,byte ptr [ebp+0C]
 0004BAB1    dec         eax
 0004BAB2    sub         al,2
>0004BAB4    jae         0004BAC3
 0004BAB6    mov         eax,dword ptr [ecx+3C]
 0004BAB9    sar         eax,1
>0004BABB    jns         0004BAC0
 0004BABD    adc         eax,0
 0004BAC0    mov         dword ptr [ebp-10],eax
 0004BAC3    mov         al,byte ptr [ebp+0C]
 0004BAC6    sub         al,2
>0004BAC8    je          0004BAD6
 0004BACA    sub         al,2
>0004BACC    jne         0004BADC
 0004BACE    mov         eax,dword ptr [ebp-0C]
 0004BAD1    add         dword ptr [ebp-4],eax
>0004BAD4    jmp         0004BADC
 0004BAD6    mov         eax,dword ptr [ebp-10]
 0004BAD9    add         dword ptr [ebp-8],eax
 0004BADC    mov         eax,dword ptr [ebp-10]
 0004BADF    push        eax
 0004BAE0    lea         eax,[ebp-20]
 0004BAE3    push        eax
 0004BAE4    mov         ecx,dword ptr [ebp-0C]
 0004BAE7    mov         edx,dword ptr [ebp-8]
 0004BAEA    mov         eax,dword ptr [ebp-4]
 0004BAED    call        Bounds
 0004BAF2    push        esi
 0004BAF3    mov         edi,esi
 0004BAF5    lea         esi,[ebp-20]
 0004BAF8    mov         ecx,4
 0004BAFD    rep movs    dword ptr [edi],dword ptr [esi]
 0004BAFF    pop         esi
 0004BB00    push        2
 0004BB02    push        esi
 0004BB03    push        0
 0004BB05    mov         eax,dword ptr [ebx+14];TDockTree.FDockSite:TWinControl
 0004BB08    call        TWinControl.GetHandle
 0004BB0D    push        eax
 0004BB0E    call        user32.MapWindowPoints
 0004BB13    pop         edi
 0004BB14    pop         esi
 0004BB15    pop         ebx
 0004BB16    mov         esp,ebp
 0004BB18    pop         ebp
 0004BB19    ret         8
end;*}

//0004BB1C
procedure DoPrune(Zone:TDockZone);
begin
{*
 0004BB1C    push        ebp
 0004BB1D    mov         ebp,esp
 0004BB1F    push        ebx
 0004BB20    mov         ebx,eax
 0004BB22    mov         eax,dword ptr [ebx+0C]
 0004BB25    test        eax,eax
>0004BB27    je          0004BB33
 0004BB29    mov         edx,dword ptr [ebp+8]
 0004BB2C    push        edx
 0004BB2D    call        DoPrune
 0004BB32    pop         ecx
 0004BB33    mov         eax,dword ptr [ebx+8]
 0004BB36    test        eax,eax
>0004BB38    je          0004BB44
 0004BB3A    mov         edx,dword ptr [ebp+8]
 0004BB3D    push        edx
 0004BB3E    call        DoPrune
 0004BB43    pop         ecx
 0004BB44    mov         eax,ebx
 0004BB46    call        TObject.Free
 0004BB4B    pop         ebx
 0004BB4C    pop         ebp
 0004BB4D    ret
*}
end;

//0004BB50
procedure TDockTree.PruneZone(Zone:TDockZone);
begin
{*
 0004BB50    push        ebp
 0004BB51    mov         ebp,esp
 0004BB53    push        ebx
 0004BB54    push        esi
 0004BB55    mov         ebx,edx
 0004BB57    mov         esi,eax
 0004BB59    test        ebx,ebx
>0004BB5B    je          0004BBA5
 0004BB5D    mov         eax,dword ptr [ebx+8]
 0004BB60    test        eax,eax
>0004BB62    je          0004BB6B
 0004BB64    push        ebp
 0004BB65    call        DoPrune
 0004BB6A    pop         ecx
 0004BB6B    mov         eax,dword ptr [ebx+18]
 0004BB6E    test        eax,eax
>0004BB70    je          0004BB7A
 0004BB72    mov         edx,dword ptr [ebx+0C]
 0004BB75    mov         dword ptr [eax+0C],edx
>0004BB78    jmp         0004BB87
 0004BB7A    mov         eax,dword ptr [ebx+14]
 0004BB7D    test        eax,eax
>0004BB7F    je          0004BB87
 0004BB81    mov         edx,dword ptr [ebx+0C]
 0004BB84    mov         dword ptr [eax+8],edx
 0004BB87    mov         eax,dword ptr [ebx+0C]
 0004BB8A    test        eax,eax
>0004BB8C    je          0004BB94
 0004BB8E    mov         edx,dword ptr [ebx+18]
 0004BB91    mov         dword ptr [eax+18],edx
 0004BB94    cmp         ebx,dword ptr [esi+60]
>0004BB97    jne         0004BB9E
 0004BB99    xor         eax,eax
 0004BB9B    mov         dword ptr [esi+60],eax
 0004BB9E    mov         eax,ebx
 0004BBA0    call        TObject.Free
 0004BBA5    pop         esi
 0004BBA6    pop         ebx
 0004BBA7    pop         ebp
 0004BBA8    ret
*}
end;

//0004BBAC
procedure TDockTree.RemoveControl(Control:TControl);
begin
{*
 0004BBAC    push        ebx
 0004BBAD    push        esi
 0004BBAE    mov         esi,edx
 0004BBB0    mov         ebx,eax
 0004BBB2    mov         edx,esi
 0004BBB4    mov         eax,ebx
 0004BBB6    call        TDockTree.FindControlZone
 0004BBBB    test        eax,eax
>0004BBBD    je          0004BBE3
 0004BBBF    cmp         eax,dword ptr [ebx+38]
>0004BBC2    jne         0004BBCB
 0004BBC4    xor         edx,edx
 0004BBC6    mov         dword ptr [eax+4],edx
>0004BBC9    jmp         0004BBD4
 0004BBCB    mov         edx,eax
 0004BBCD    mov         eax,ebx
 0004BBCF    call        TDockTree.RemoveZone
 0004BBD4    mov         byte ptr [esi+88],0
 0004BBDB    mov         eax,dword ptr [ebx+14]
 0004BBDE    mov         edx,dword ptr [eax]
 0004BBE0    call        dword ptr [edx+78]
 0004BBE3    pop         esi
 0004BBE4    pop         ebx
 0004BBE5    ret
*}
end;

//0004BBE8
procedure TDockTree.RemoveZone(Zone:TDockZone);
begin
{*
 0004BBE8    push        ebp
 0004BBE9    mov         ebp,esp
 0004BBEB    push        0
 0004BBED    push        0
 0004BBEF    push        ebx
 0004BBF0    push        esi
 0004BBF1    push        edi
 0004BBF2    mov         ebx,edx
 0004BBF4    mov         esi,eax
 0004BBF6    xor         eax,eax
 0004BBF8    push        ebp
 0004BBF9    push        4BE3C
 0004BBFE    push        dword ptr fs:[eax]
 0004BC01    mov         dword ptr fs:[eax],esp
 0004BC04    test        ebx,ebx
>0004BC06    jne         0004BC43
 0004BC08    lea         edx,[ebp-4]
 0004BC0B    mov         eax,[000B583C];^SDockTreeRemoveError:TResStringRec
 0004BC10    call        LoadResString
 0004BC15    lea         eax,[ebp-4]
 0004BC18    push        eax
 0004BC19    lea         edx,[ebp-8]
 0004BC1C    mov         eax,[000B56B4];^SDockZoneNotFound:TResStringRec
 0004BC21    call        LoadResString
 0004BC26    mov         edx,dword ptr [ebp-8]
 0004BC29    pop         eax
 0004BC2A    call        @LStrCat
 0004BC2F    mov         ecx,dword ptr [ebp-4]
 0004BC32    mov         dl,1
 0004BC34    mov         eax,[000176E8];Exception
 0004BC39    call        Exception.Create
 0004BC3E    call        @RaiseExcept
 0004BC43    cmp         dword ptr [ebx+4],0
>0004BC47    jne         0004BC84
 0004BC49    lea         edx,[ebp-4]
 0004BC4C    mov         eax,[000B583C];^SDockTreeRemoveError:TResStringRec
 0004BC51    call        LoadResString
 0004BC56    lea         eax,[ebp-4]
 0004BC59    push        eax
 0004BC5A    lea         edx,[ebp-8]
 0004BC5D    mov         eax,[000B5A88];^SDockZoneHasNoCtl:TResStringRec
 0004BC62    call        LoadResString
 0004BC67    mov         edx,dword ptr [ebp-8]
 0004BC6A    pop         eax
 0004BC6B    call        @LStrCat
 0004BC70    mov         ecx,dword ptr [ebp-4]
 0004BC73    mov         dl,1
 0004BC75    mov         eax,[000176E8];Exception
 0004BC7A    call        Exception.Create
 0004BC7F    call        @RaiseExcept
 0004BC84    mov         eax,dword ptr [ebx+14]
 0004BC87    call        TDockZone.GetChildCount
 0004BC8C    cmp         eax,1
>0004BC8F    jne         0004BCA2
 0004BC91    mov         eax,dword ptr [esi+60]
 0004BC94    xor         edx,edx
 0004BC96    mov         dword ptr [eax+8],edx
 0004BC99    mov         byte ptr [eax+10],0
>0004BC9D    jmp         0004BE1A
 0004BCA2    cmp         eax,2
>0004BCA5    jne         0004BDCD
 0004BCAB    mov         eax,dword ptr [ebx+18]
 0004BCAE    test        eax,eax
>0004BCB0    jne         0004BCB7
 0004BCB2    mov         edi,dword ptr [ebx+0C]
>0004BCB5    jmp         0004BCB9
 0004BCB7    mov         edi,eax
 0004BCB9    cmp         dword ptr [edi+4],0
>0004BCBD    je          0004BD18
 0004BCBF    mov         edx,dword ptr [esi+60]
 0004BCC2    mov         eax,dword ptr [ebx+14]
 0004BCC5    cmp         edx,eax
>0004BCC7    jne         0004BCED
 0004BCC9    mov         eax,dword ptr [esi+60]
 0004BCCC    mov         dword ptr [eax+8],edi
 0004BCCF    xor         eax,eax
 0004BCD1    mov         dword ptr [edi+18],eax
 0004BCD4    xor         eax,eax
 0004BCD6    mov         dword ptr [edi+0C],eax
 0004BCD9    mov         eax,dword ptr [esi+60]
 0004BCDC    call        TDockZone.GetLimitSize
 0004BCE1    mov         dword ptr [edi+20],eax
 0004BCE4    mov         eax,edi
 0004BCE6    call        TDockZone.Update
>0004BCEB    jmp         0004BD03
 0004BCED    mov         byte ptr [eax+10],0
 0004BCF1    mov         edx,dword ptr [edi+4]
 0004BCF4    mov         dword ptr [eax+4],edx
 0004BCF7    xor         edx,edx
 0004BCF9    mov         dword ptr [eax+8],edx
 0004BCFC    mov         eax,edi
 0004BCFE    call        TObject.Free
 0004BD03    push        esi
 0004BD04    push        4C398;TDockTree.UpdateZone
 0004BD09    mov         edx,dword ptr [ebx+14]
 0004BD0C    mov         eax,esi
 0004BD0E    call        TDockTree.ForEachAt
>0004BD13    jmp         0004BE1A
 0004BD18    mov         eax,dword ptr [ebx+14]
 0004BD1B    cmp         eax,dword ptr [esi+60]
>0004BD1E    jne         0004BD55
 0004BD20    mov         eax,dword ptr [esi+64]
 0004BD23    mov         dword ptr [edi+20],eax
 0004BD26    mov         eax,dword ptr [esi+60]
 0004BD29    mov         eax,dword ptr [eax+20]
 0004BD2C    mov         dword ptr [esi+64],eax
 0004BD2F    mov         eax,dword ptr [esi+60]
 0004BD32    call        TObject.Free
 0004BD37    mov         dword ptr [esi+60],edi
 0004BD3A    xor         eax,eax
 0004BD3C    mov         dword ptr [edi+0C],eax
 0004BD3F    xor         eax,eax
 0004BD41    mov         dword ptr [edi+18],eax
 0004BD44    xor         eax,eax
 0004BD46    mov         dword ptr [edi+14],eax
 0004BD49    mov         eax,esi
 0004BD4B    call        TDockTree.UpdateAll
>0004BD50    jmp         0004BE1A
 0004BD55    mov         eax,dword ptr [ebx+14]
 0004BD58    mov         eax,dword ptr [eax+18]
 0004BD5B    mov         edx,dword ptr [edi+8]
 0004BD5E    mov         dword ptr [edx+18],eax
 0004BD61    test        eax,eax
>0004BD63    jne         0004BD73
 0004BD65    mov         eax,dword ptr [edi+8]
 0004BD68    mov         edx,dword ptr [ebx+14]
 0004BD6B    mov         edx,dword ptr [edx+14]
 0004BD6E    mov         dword ptr [edx+8],eax
>0004BD71    jmp         0004BD79
 0004BD73    mov         edx,dword ptr [edi+8]
 0004BD76    mov         dword ptr [eax+0C],edx
 0004BD79    mov         eax,dword ptr [edi+8]
 0004BD7C    mov         edx,dword ptr [ebx+14]
 0004BD7F    mov         edx,dword ptr [edx+14]
 0004BD82    mov         dword ptr [eax+14],edx
 0004BD85    mov         eax,dword ptr [eax+0C]
 0004BD88    mov         edx,dword ptr [ebx+14]
 0004BD8B    mov         edx,dword ptr [edx+14]
 0004BD8E    mov         dword ptr [eax+14],edx
 0004BD91    cmp         dword ptr [eax+0C],0
>0004BD95    jne         0004BD85
 0004BD97    mov         edx,dword ptr [ebx+14]
 0004BD9A    mov         edx,dword ptr [edx+0C]
 0004BD9D    mov         dword ptr [eax+0C],edx
 0004BDA0    cmp         dword ptr [eax+0C],0
>0004BDA4    je          0004BDAC
 0004BDA6    mov         edx,dword ptr [eax+0C]
 0004BDA9    mov         dword ptr [edx+18],eax
 0004BDAC    push        esi
 0004BDAD    push        4C398;TDockTree.UpdateZone
 0004BDB2    mov         edx,dword ptr [eax+14]
 0004BDB5    mov         eax,esi
 0004BDB7    call        TDockTree.ForEachAt
 0004BDBC    mov         eax,dword ptr [ebx+14]
 0004BDBF    call        TObject.Free
 0004BDC4    mov         eax,edi
 0004BDC6    call        TObject.Free
>0004BDCB    jmp         0004BE1A
 0004BDCD    mov         eax,dword ptr [ebx+18]
 0004BDD0    test        eax,eax
>0004BDD2    jne         0004BDEC
 0004BDD4    mov         eax,dword ptr [ebx+14]
 0004BDD7    mov         edx,dword ptr [ebx+0C]
 0004BDDA    mov         dword ptr [eax+8],edx
 0004BDDD    mov         eax,dword ptr [ebx+0C]
 0004BDE0    xor         edx,edx
 0004BDE2    mov         dword ptr [eax+18],edx
 0004BDE5    call        TDockZone.Update
>0004BDEA    jmp         0004BE0A
 0004BDEC    mov         edx,dword ptr [ebx+0C]
 0004BDEF    mov         dword ptr [eax+0C],edx
 0004BDF2    mov         edx,dword ptr [ebx+0C]
 0004BDF5    test        edx,edx
>0004BDF7    je          0004BDFC
 0004BDF9    mov         dword ptr [edx+18],eax
 0004BDFC    mov         eax,dword ptr [ebx+18]
 0004BDFF    mov         edx,dword ptr [ebx+20]
 0004BE02    mov         dword ptr [eax+20],edx
 0004BE05    call        TDockZone.Update
 0004BE0A    push        esi
 0004BE0B    push        4C398;TDockTree.UpdateZone
 0004BE10    mov         edx,dword ptr [ebx+14]
 0004BE13    mov         eax,esi
 0004BE15    call        TDockTree.ForEachAt
 0004BE1A    mov         eax,ebx
 0004BE1C    call        TObject.Free
 0004BE21    xor         eax,eax
 0004BE23    pop         edx
 0004BE24    pop         ecx
 0004BE25    pop         ecx
 0004BE26    mov         dword ptr fs:[eax],edx
 0004BE29    push        4BE43
 0004BE2E    lea         eax,[ebp-8]
 0004BE31    mov         edx,2
 0004BE36    call        @LStrArrayClr
 0004BE3B    ret
>0004BE3C    jmp         @HandleFinally
>0004BE41    jmp         0004BE2E
 0004BE43    pop         edi
 0004BE44    pop         esi
 0004BE45    pop         ebx
 0004BE46    pop         ecx
 0004BE47    pop         ecx
 0004BE48    pop         ebp
 0004BE49    ret
*}
end;

//0004BE4C
procedure TDockTree.ResetBounds(Force:Boolean);
begin
{*
 0004BE4C    push        ebx
 0004BE4D    push        esi
 0004BE4E    push        edi
 0004BE4F    add         esp,0FFFFFFF0
 0004BE52    mov         ebx,edx
 0004BE54    mov         edi,eax
 0004BE56    mov         esi,dword ptr [edi+14]
 0004BE59    test        byte ptr [esi+20],1
>0004BE5D    jne         0004BF20
 0004BE63    cmp         dword ptr [edi+60],0
>0004BE67    je          0004BF20
 0004BE6D    mov         eax,esi
 0004BE6F    call        TWinControl.GetDockClientCount
 0004BE74    test        eax,eax
>0004BE76    jle         0004BF20
 0004BE7C    mov         edx,esp
 0004BE7E    mov         eax,dword ptr [edi+14]
 0004BE81    mov         ecx,dword ptr [eax]
 0004BE83    call        dword ptr [ecx+44]
 0004BE86    mov         edx,esp
 0004BE88    mov         eax,dword ptr [edi+14]
 0004BE8B    mov         ecx,dword ptr [eax]
 0004BE8D    call        dword ptr [ecx+88]
 0004BE93    test        bl,bl
>0004BE95    jne         0004BEAA
 0004BE97    lea         edx,[edi+20]
 0004BE9A    mov         eax,esp
 0004BE9C    mov         ecx,10
 0004BEA1    call        CompareMem
 0004BEA6    test        al,al
>0004BEA8    jne         0004BF20
 0004BEAA    push        edi
 0004BEAB    lea         esi,[esp+4]
 0004BEAF    add         edi,20
 0004BEB2    mov         ecx,4
 0004BEB7    rep movs    dword ptr [edi],dword ptr [esi]
 0004BEB9    pop         edi
 0004BEBA    mov         eax,dword ptr [edi+60]
 0004BEBD    mov         dl,byte ptr [eax+10]
 0004BEC0    dec         dl
>0004BEC2    je          0004BECA
 0004BEC4    dec         dl
>0004BEC6    je          0004BEE1
>0004BEC8    jmp         0004BEF6
 0004BECA    mov         edx,dword ptr [esp+8]
 0004BECE    sub         edx,dword ptr [esp]
 0004BED1    mov         dword ptr [eax+20],edx
 0004BED4    mov         eax,dword ptr [esp+0C]
 0004BED8    sub         eax,dword ptr [esp+4]
 0004BEDC    mov         dword ptr [edi+64],eax
>0004BEDF    jmp         0004BEF6
 0004BEE1    mov         edx,dword ptr [esp+0C]
 0004BEE5    sub         edx,dword ptr [esp+4]
 0004BEE9    mov         dword ptr [eax+20],edx
 0004BEEC    mov         eax,dword ptr [esp+8]
 0004BEF0    sub         eax,dword ptr [esp]
 0004BEF3    mov         dword ptr [edi+64],eax
 0004BEF6    mov         eax,dword ptr [edi+14]
 0004BEF9    call        TWinControl.GetDockClientCount
 0004BEFE    test        eax,eax
>0004BF00    jle         0004BF20
 0004BF02    xor         edx,edx
 0004BF04    mov         eax,edi
 0004BF06    call        TDockTree.SetNewBounds
 0004BF0B    cmp         dword ptr [edi+68],0
>0004BF0F    jne         0004BF20
 0004BF11    push        edi
 0004BF12    push        4C398;TDockTree.UpdateZone
 0004BF17    xor         edx,edx
 0004BF19    mov         eax,edi
 0004BF1B    call        TDockTree.ForEachAt
 0004BF20    add         esp,10
 0004BF23    pop         edi
 0004BF24    pop         esi
 0004BF25    pop         ebx
 0004BF26    ret
*}
end;

//0004BF28
procedure TDockTree.ScaleZone(Zone:TDockZone);
begin
{*
 0004BF28    push        ebx
 0004BF29    push        esi
 0004BF2A    mov         ebx,edx
 0004BF2C    mov         esi,eax
 0004BF2E    test        ebx,ebx
>0004BF30    je          0004BF4F
 0004BF32    test        ebx,ebx
>0004BF34    je          0004BF4F
 0004BF36    mov         eax,dword ptr [ebx+14]
 0004BF39    mov         al,byte ptr [eax+10]
 0004BF3C    cmp         al,byte ptr [esi+44]
>0004BF3F    jne         0004BF4F
 0004BF41    fild        dword ptr [ebx+20]
 0004BF44    fmul        qword ptr [esi+3C]
 0004BF47    call        @ROUND
 0004BF4C    mov         dword ptr [ebx+20],eax
 0004BF4F    pop         esi
 0004BF50    pop         ebx
 0004BF51    ret
*}
end;

//0004BF54
procedure WriteControlName(ControlName:AnsiString);
begin
{*
 0004BF54    push        ebp
 0004BF55    mov         ebp,esp
 0004BF57    add         esp,0FFFFFFF8
 0004BF5A    push        ebx
 0004BF5B    mov         dword ptr [ebp-4],eax
 0004BF5E    mov         eax,dword ptr [ebp-4]
 0004BF61    call        @LStrAddRef
 0004BF66    xor         eax,eax
 0004BF68    push        ebp
 0004BF69    push        4BFBF
 0004BF6E    push        dword ptr fs:[eax]
 0004BF71    mov         dword ptr fs:[eax],esp
 0004BF74    mov         eax,dword ptr [ebp-4]
 0004BF77    call        @LStrLen
 0004BF7C    mov         dword ptr [ebp-8],eax
 0004BF7F    lea         edx,[ebp-8]
 0004BF82    mov         eax,dword ptr [ebp+8]
 0004BF85    mov         eax,dword ptr [eax-4]
 0004BF88    mov         ecx,4
 0004BF8D    mov         ebx,dword ptr [eax]
 0004BF8F    call        dword ptr [ebx+8]
 0004BF92    cmp         dword ptr [ebp-8],0
>0004BF96    jle         0004BFA9
 0004BF98    mov         edx,dword ptr [ebp-4]
 0004BF9B    mov         eax,dword ptr [ebp+8]
 0004BF9E    mov         eax,dword ptr [eax-4]
 0004BFA1    mov         ecx,dword ptr [ebp-8]
 0004BFA4    mov         ebx,dword ptr [eax]
 0004BFA6    call        dword ptr [ebx+8]
 0004BFA9    xor         eax,eax
 0004BFAB    pop         edx
 0004BFAC    pop         ecx
 0004BFAD    pop         ecx
 0004BFAE    mov         dword ptr fs:[eax],edx
 0004BFB1    push        4BFC6
 0004BFB6    lea         eax,[ebp-4]
 0004BFB9    call        @LStrClr
 0004BFBE    ret
>0004BFBF    jmp         @HandleFinally
>0004BFC4    jmp         0004BFB6
 0004BFC6    pop         ebx
 0004BFC7    pop         ecx
 0004BFC8    pop         ecx
 0004BFC9    pop         ebp
 0004BFCA    ret
*}
end;

//0004BFCC
procedure DoSaveZone(Zone:TDockZone; Level:Integer);
begin
{*
 0004BFCC    push        ebp
 0004BFCD    mov         ebp,esp
 0004BFCF    add         esp,0FFFFFFF8
 0004BFD2    push        ebx
 0004BFD3    push        esi
 0004BFD4    xor         ecx,ecx
 0004BFD6    mov         dword ptr [ebp-8],ecx
 0004BFD9    mov         dword ptr [ebp-4],edx
 0004BFDC    mov         ebx,eax
 0004BFDE    xor         eax,eax
 0004BFE0    push        ebp
 0004BFE1    push        4C07B
 0004BFE6    push        dword ptr fs:[eax]
 0004BFE9    mov         dword ptr fs:[eax],esp
 0004BFEC    lea         edx,[ebp-4]
 0004BFEF    mov         eax,dword ptr [ebp+8]
 0004BFF2    mov         eax,dword ptr [eax-4]
 0004BFF5    mov         ecx,4
 0004BFFA    mov         esi,dword ptr [eax]
 0004BFFC    call        dword ptr [esi+8]
 0004BFFF    lea         edx,[ebx+10]
 0004C002    mov         eax,dword ptr [ebp+8]
 0004C005    mov         eax,dword ptr [eax-4]
 0004C008    mov         ecx,1
 0004C00D    mov         esi,dword ptr [eax]
 0004C00F    call        dword ptr [esi+8]
 0004C012    lea         edx,[ebx+20]
 0004C015    mov         eax,dword ptr [ebp+8]
 0004C018    mov         eax,dword ptr [eax-4]
 0004C01B    mov         ecx,4
 0004C020    mov         esi,dword ptr [eax]
 0004C022    call        dword ptr [esi+8]
 0004C025    mov         eax,dword ptr [ebp+8]
 0004C028    push        eax
 0004C029    lea         edx,[ebp-8]
 0004C02C    mov         eax,ebx
 0004C02E    call        TDockZone.GetControlName
 0004C033    mov         eax,dword ptr [ebp-8]
 0004C036    call        WriteControlName
 0004C03B    pop         ecx
 0004C03C    mov         eax,dword ptr [ebx+8]
 0004C03F    test        eax,eax
>0004C041    je          0004C051
 0004C043    mov         edx,dword ptr [ebp+8]
 0004C046    push        edx
 0004C047    mov         edx,dword ptr [ebp-4]
 0004C04A    inc         edx
 0004C04B    call        DoSaveZone
 0004C050    pop         ecx
 0004C051    mov         eax,dword ptr [ebx+0C]
 0004C054    test        eax,eax
>0004C056    je          0004C065
 0004C058    mov         edx,dword ptr [ebp+8]
 0004C05B    push        edx
 0004C05C    mov         edx,dword ptr [ebp-4]
 0004C05F    call        DoSaveZone
 0004C064    pop         ecx
 0004C065    xor         eax,eax
 0004C067    pop         edx
 0004C068    pop         ecx
 0004C069    pop         ecx
 0004C06A    mov         dword ptr fs:[eax],edx
 0004C06D    push        4C082
 0004C072    lea         eax,[ebp-8]
 0004C075    call        @LStrClr
 0004C07A    ret
>0004C07B    jmp         @HandleFinally
>0004C080    jmp         0004C072
 0004C082    pop         esi
 0004C083    pop         ebx
 0004C084    pop         ecx
 0004C085    pop         ecx
 0004C086    pop         ebp
 0004C087    ret
*}
end;

//0004C088
procedure TDockTree.SaveToStream(Stream:TStream);
begin
{*
 0004C088    push        ebp
 0004C089    mov         ebp,esp
 0004C08B    add         esp,0FFFFFFEC
 0004C08E    push        ebx
 0004C08F    push        esi
 0004C090    push        edi
 0004C091    xor         ecx,ecx
 0004C093    mov         dword ptr [ebp-14],ecx
 0004C096    mov         dword ptr [ebp-4],edx
 0004C099    mov         dword ptr [ebp-8],eax
 0004C09C    xor         eax,eax
 0004C09E    push        ebp
 0004C09F    push        4C1C1
 0004C0A4    push        dword ptr fs:[eax]
 0004C0A7    mov         dword ptr fs:[eax],esp
 0004C0AA    mov         eax,dword ptr [ebp-8]
 0004C0AD    lea         edx,[eax+6C]
 0004C0B0    mov         ecx,4
 0004C0B5    mov         eax,dword ptr [ebp-4]
 0004C0B8    mov         ebx,dword ptr [eax]
 0004C0BA    call        dword ptr [ebx+8]
 0004C0BD    mov         dl,1
 0004C0BF    mov         eax,[0001F340];TStringList
 0004C0C4    call        TObject.Create
 0004C0C9    mov         dword ptr [ebp-10],eax
 0004C0CC    xor         eax,eax
 0004C0CE    push        ebp
 0004C0CF    push        4C170
 0004C0D4    push        dword ptr fs:[eax]
 0004C0D7    mov         dword ptr fs:[eax],esp
 0004C0DA    mov         eax,dword ptr [ebp-8]
 0004C0DD    mov         eax,dword ptr [eax+14]
 0004C0E0    call        TWinControl.GetDockClientCount
 0004C0E5    mov         ebx,eax
 0004C0E7    dec         ebx
 0004C0E8    test        ebx,ebx
>0004C0EA    jl          0004C119
 0004C0EC    inc         ebx
 0004C0ED    xor         esi,esi
 0004C0EF    mov         eax,dword ptr [ebp-8]
 0004C0F2    mov         eax,dword ptr [eax+14]
 0004C0F5    mov         edx,esi
 0004C0F7    call        TWinControl.GetDockClients
 0004C0FC    mov         edi,eax
 0004C0FE    cmp         byte ptr [edi+47],0
>0004C102    jne         0004C115
 0004C104    cmp         dword ptr [edi+8],0
>0004C108    je          0004C115
 0004C10A    mov         edx,dword ptr [edi+8]
 0004C10D    mov         eax,dword ptr [ebp-10]
 0004C110    mov         ecx,dword ptr [eax]
 0004C112    call        dword ptr [ecx+34]
 0004C115    inc         esi
 0004C116    dec         ebx
>0004C117    jne         0004C0EF
 0004C119    mov         eax,dword ptr [ebp-10]
 0004C11C    mov         edx,dword ptr [eax]
 0004C11E    call        dword ptr [edx+14]
 0004C121    mov         dword ptr [ebp-0C],eax
 0004C124    lea         edx,[ebp-0C]
 0004C127    mov         ecx,4
 0004C12C    mov         eax,dword ptr [ebp-4]
 0004C12F    mov         ebx,dword ptr [eax]
 0004C131    call        dword ptr [ebx+8]
 0004C134    mov         ebx,dword ptr [ebp-0C]
 0004C137    dec         ebx
 0004C138    test        ebx,ebx
>0004C13A    jl          0004C15A
 0004C13C    inc         ebx
 0004C13D    xor         esi,esi
 0004C13F    push        ebp
 0004C140    lea         ecx,[ebp-14]
 0004C143    mov         edx,esi
 0004C145    mov         eax,dword ptr [ebp-10]
 0004C148    mov         edi,dword ptr [eax]
 0004C14A    call        dword ptr [edi+0C]
 0004C14D    mov         eax,dword ptr [ebp-14]
 0004C150    call        WriteControlName
 0004C155    pop         ecx
 0004C156    inc         esi
 0004C157    dec         ebx
>0004C158    jne         0004C13F
 0004C15A    xor         eax,eax
 0004C15C    pop         edx
 0004C15D    pop         ecx
 0004C15E    pop         ecx
 0004C15F    mov         dword ptr fs:[eax],edx
 0004C162    push        4C177
 0004C167    mov         eax,dword ptr [ebp-10]
 0004C16A    call        TObject.Free
 0004C16F    ret
>0004C170    jmp         @HandleFinally
>0004C175    jmp         0004C167
 0004C177    mov         eax,dword ptr [ebp-8]
 0004C17A    lea         edx,[eax+64]
 0004C17D    mov         ecx,4
 0004C182    mov         eax,dword ptr [ebp-4]
 0004C185    mov         ebx,dword ptr [eax]
 0004C187    call        dword ptr [ebx+8]
 0004C18A    push        ebp
 0004C18B    mov         eax,dword ptr [ebp-8]
 0004C18E    mov         eax,dword ptr [eax+60]
 0004C191    xor         edx,edx
 0004C193    call        DoSaveZone
 0004C198    pop         ecx
 0004C199    mov         edx,0B488C
 0004C19E    mov         ecx,4
 0004C1A3    mov         eax,dword ptr [ebp-4]
 0004C1A6    mov         ebx,dword ptr [eax]
 0004C1A8    call        dword ptr [ebx+8]
 0004C1AB    xor         eax,eax
 0004C1AD    pop         edx
 0004C1AE    pop         ecx
 0004C1AF    pop         ecx
 0004C1B0    mov         dword ptr fs:[eax],edx
 0004C1B3    push        4C1C8
 0004C1B8    lea         eax,[ebp-14]
 0004C1BB    call        @LStrClr
 0004C1C0    ret
>0004C1C1    jmp         @HandleFinally
>0004C1C6    jmp         0004C1B8
 0004C1C8    pop         edi
 0004C1C9    pop         esi
 0004C1CA    pop         ebx
 0004C1CB    mov         esp,ebp
 0004C1CD    pop         ebp
 0004C1CE    ret
*}
end;

//0004C1D0
procedure DoSetNewBounds(Zone:TDockZone);
begin
{*
 0004C1D0    push        ebp
 0004C1D1    mov         ebp,esp
 0004C1D3    push        ebx
 0004C1D4    mov         ebx,eax
 0004C1D6    test        ebx,ebx
>0004C1D8    je          0004C234
 0004C1DA    cmp         dword ptr [ebx+0C],0
>0004C1DE    jne         0004C212
 0004C1E0    mov         eax,dword ptr [ebp+8]
 0004C1E3    mov         eax,dword ptr [eax-4]
 0004C1E6    cmp         ebx,dword ptr [eax+60]
>0004C1E9    je          0004C212
 0004C1EB    mov         edx,dword ptr [ebp+8]
 0004C1EE    mov         edx,dword ptr [edx-4]
 0004C1F1    mov         edx,dword ptr [edx+60]
 0004C1F4    mov         eax,dword ptr [ebx+14]
 0004C1F7    cmp         edx,eax
>0004C1F9    jne         0004C209
 0004C1FB    mov         eax,dword ptr [ebp+8]
 0004C1FE    mov         eax,dword ptr [eax-4]
 0004C201    mov         eax,dword ptr [eax+64]
 0004C204    mov         dword ptr [ebx+20],eax
>0004C207    jmp         0004C212
 0004C209    mov         eax,dword ptr [eax+14]
 0004C20C    mov         eax,dword ptr [eax+20]
 0004C20F    mov         dword ptr [ebx+20],eax
 0004C212    mov         eax,dword ptr [ebx+8]
 0004C215    test        eax,eax
>0004C217    je          0004C223
 0004C219    mov         edx,dword ptr [ebp+8]
 0004C21C    push        edx
 0004C21D    call        DoSetNewBounds
 0004C222    pop         ecx
 0004C223    mov         eax,dword ptr [ebx+0C]
 0004C226    test        eax,eax
>0004C228    je          0004C234
 0004C22A    mov         edx,dword ptr [ebp+8]
 0004C22D    push        edx
 0004C22E    call        DoSetNewBounds
 0004C233    pop         ecx
 0004C234    pop         ebx
 0004C235    pop         ebp
 0004C236    ret
*}
end;

//0004C238
procedure TDockTree.SetNewBounds(Zone:TDockZone);
begin
{*
 0004C238    push        ebp
 0004C239    mov         ebp,esp
 0004C23B    push        ecx
 0004C23C    mov         dword ptr [ebp-4],eax
 0004C23F    test        edx,edx
>0004C241    jne         0004C24C
 0004C243    mov         eax,dword ptr [ebp-4]
 0004C246    mov         eax,dword ptr [eax+60]
 0004C249    mov         edx,dword ptr [eax+8]
 0004C24C    push        ebp
 0004C24D    mov         eax,edx
 0004C24F    call        DoSetNewBounds
 0004C254    pop         ecx
 0004C255    mov         eax,dword ptr [ebp-4]
 0004C258    mov         eax,dword ptr [eax+14]
 0004C25B    mov         edx,dword ptr [eax]
 0004C25D    call        dword ptr [edx+78]
 0004C260    pop         ecx
 0004C261    pop         ebp
 0004C262    ret
*}
end;

//0004C264
procedure TDockTree.SetReplacingControl(Control:TControl);
begin
{*
 0004C264    push        ebx
 0004C265    push        esi
 0004C266    mov         esi,edx
 0004C268    mov         ebx,eax
 0004C26A    mov         edx,esi
 0004C26C    mov         eax,ebx
 0004C26E    call        TDockTree.FindControlZone
 0004C273    mov         dword ptr [ebx+38],eax
 0004C276    pop         esi
 0004C277    pop         ebx
 0004C278    ret
*}
end;

//0004C27C
procedure TDockTree.ShiftZone(Zone:TDockZone);
begin
{*
 0004C27C    test        edx,edx
>0004C27E    je          0004C296
 0004C280    cmp         edx,dword ptr [eax+60]
>0004C283    je          0004C296
 0004C285    mov         ecx,dword ptr [edx+14]
 0004C288    mov         cl,byte ptr [ecx+10]
 0004C28B    cmp         cl,byte ptr [eax+44]
>0004C28E    jne         0004C296
 0004C290    mov         eax,dword ptr [eax+48]
 0004C293    add         dword ptr [edx+20],eax
 0004C296    ret
*}
end;

//0004C298
procedure TDockTree.SplitterMouseDown(OnZone:TDockZone; MousePos:TPoint);
begin
{*
 0004C298    push        ebx
 0004C299    push        esi
 0004C29A    push        edi
 0004C29B    add         esp,0FFFFFFF8
 0004C29E    mov         esi,ecx
 0004C2A0    lea         edi,[esp]
 0004C2A3    movs        dword ptr [edi],dword ptr [esi]
 0004C2A4    movs        dword ptr [edi],dword ptr [esi]
 0004C2A5    mov         ebx,eax
 0004C2A7    mov         dword ptr [ebx+5C],edx
 0004C2AA    mov         eax,dword ptr [ebx+14]
 0004C2AD    call        TWinControl.GetHandle
 0004C2B2    mov         edx,eax
 0004C2B4    mov         eax,[000B672C]
 0004C2B9    call        TMouse.SetCapture
 0004C2BE    mov         eax,dword ptr [ebx+14]
 0004C2C1    call        TWinControl.GetHandle
 0004C2C6    mov         esi,eax
 0004C2C8    mov         dword ptr [ebx+58],esi
 0004C2CB    push        412
 0004C2D0    push        0
 0004C2D2    push        esi
 0004C2D3    call        user32.GetDCEx
 0004C2D8    mov         dword ptr [ebx+54],eax
 0004C2DB    mov         eax,dword ptr [esp]
 0004C2DE    mov         dword ptr [ebx+4C],eax
 0004C2E1    mov         eax,dword ptr [esp+4]
 0004C2E5    mov         dword ptr [ebx+50],eax
 0004C2E8    mov         eax,ebx
 0004C2EA    call        TDockTree.DrawSizeSplitter
 0004C2EF    pop         ecx
 0004C2F0    pop         edx
 0004C2F1    pop         edi
 0004C2F2    pop         esi
 0004C2F3    pop         ebx
 0004C2F4    ret
*}
end;

//0004C2F8
procedure TDockTree.SplitterMouseUp;
begin
{*
 0004C2F8    push        ebx
 0004C2F9    mov         ebx,eax
 0004C2FB    xor         edx,edx
 0004C2FD    mov         eax,[000B672C]
 0004C302    call        TMouse.SetCapture
 0004C307    mov         eax,ebx
 0004C309    call        TDockTree.DrawSizeSplitter
 0004C30E    mov         eax,dword ptr [ebx+54]
 0004C311    push        eax
 0004C312    mov         eax,dword ptr [ebx+58]
 0004C315    push        eax
 0004C316    call        user32.ReleaseDC
 0004C31B    mov         eax,dword ptr [ebx+5C]
 0004C31E    mov         edx,dword ptr [eax+14]
 0004C321    cmp         byte ptr [edx+10],1
>0004C325    jne         0004C339
 0004C327    mov         edx,dword ptr [ebx+0C]
 0004C32A    sar         edx,1
>0004C32C    jns         0004C331
 0004C32E    adc         edx,0
 0004C331    add         edx,dword ptr [ebx+50]
 0004C334    mov         dword ptr [eax+20],edx
>0004C337    jmp         0004C349
 0004C339    mov         edx,dword ptr [ebx+0C]
 0004C33C    sar         edx,1
>0004C33E    jns         0004C343
 0004C340    adc         edx,0
 0004C343    add         edx,dword ptr [ebx+4C]
 0004C346    mov         dword ptr [eax+20],edx
 0004C349    mov         eax,dword ptr [ebx+5C]
 0004C34C    mov         edx,dword ptr [eax+14]
 0004C34F    mov         eax,ebx
 0004C351    call        TDockTree.SetNewBounds
 0004C356    push        ebx
 0004C357    push        4C398;TDockTree.UpdateZone
 0004C35C    mov         eax,dword ptr [ebx+5C]
 0004C35F    mov         edx,dword ptr [eax+14]
 0004C362    mov         eax,ebx
 0004C364    call        TDockTree.ForEachAt
 0004C369    xor         eax,eax
 0004C36B    mov         dword ptr [ebx+5C],eax
 0004C36E    pop         ebx
 0004C36F    ret
*}
end;

//0004C370
procedure TDockTree.UpdateAll;
begin
{*
 0004C370    push        ebx
 0004C371    mov         ebx,eax
 0004C373    cmp         dword ptr [ebx+68],0
>0004C377    jne         0004C394
 0004C379    mov         eax,dword ptr [ebx+14]
 0004C37C    call        TWinControl.GetDockClientCount
 0004C381    test        eax,eax
>0004C383    jle         0004C394
 0004C385    push        ebx
 0004C386    push        4C398;TDockTree.UpdateZone
 0004C38B    xor         edx,edx
 0004C38D    mov         eax,ebx
 0004C38F    call        TDockTree.ForEachAt
 0004C394    pop         ebx
 0004C395    ret
*}
end;

//0004C398
procedure TDockTree.UpdateZone(Zone:TDockZone);
begin
{*
 0004C398    cmp         dword ptr [eax+68],0
>0004C39C    jne         0004C3A5
 0004C39E    mov         eax,edx
 0004C3A0    call        TDockZone.Update
 0004C3A5    ret
*}
end;

//0004C3A8
procedure TDockTree.DrawSizeSplitter;
begin
{*
 0004C3A8    push        ebx
 0004C3A9    push        esi
 0004C3AA    add         esp,0FFFFFFF0
 0004C3AD    mov         ebx,eax
 0004C3AF    mov         esi,dword ptr [ebx+5C]
 0004C3B2    test        esi,esi
>0004C3B4    je          0004C48B
 0004C3BA    mov         eax,dword ptr [esi+14]
 0004C3BD    cmp         byte ptr [eax+10],1
>0004C3C1    jne         0004C406
 0004C3C3    mov         edx,2
 0004C3C8    mov         eax,esi
 0004C3CA    call        TDockZone.GetTopLeft
 0004C3CF    mov         dword ptr [esp],eax
 0004C3D2    mov         eax,dword ptr [ebx+0C]
 0004C3D5    sar         eax,1
>0004C3D7    jns         0004C3DC
 0004C3D9    adc         eax,0
 0004C3DC    mov         edx,dword ptr [ebx+50]
 0004C3DF    sub         edx,eax
 0004C3E1    mov         dword ptr [esp+4],edx
 0004C3E5    mov         edx,2
 0004C3EA    mov         eax,dword ptr [ebx+5C]
 0004C3ED    call        TDockZone.GetHeightWidth
 0004C3F2    add         eax,dword ptr [esp]
 0004C3F5    mov         dword ptr [esp+8],eax
 0004C3F9    mov         eax,dword ptr [esp+4]
 0004C3FD    add         eax,dword ptr [ebx+0C]
 0004C400    mov         dword ptr [esp+0C],eax
>0004C404    jmp         0004C447
 0004C406    mov         eax,dword ptr [ebx+0C]
 0004C409    sar         eax,1
>0004C40B    jns         0004C410
 0004C40D    adc         eax,0
 0004C410    mov         edx,dword ptr [ebx+4C]
 0004C413    sub         edx,eax
 0004C415    mov         dword ptr [esp],edx
 0004C418    mov         edx,1
 0004C41D    mov         eax,esi
 0004C41F    call        TDockZone.GetTopLeft
 0004C424    mov         dword ptr [esp+4],eax
 0004C428    mov         eax,dword ptr [esp]
 0004C42B    add         eax,dword ptr [ebx+0C]
 0004C42E    mov         dword ptr [esp+8],eax
 0004C432    mov         edx,1
 0004C437    mov         eax,dword ptr [ebx+5C]
 0004C43A    call        TDockZone.GetHeightWidth
 0004C43F    add         eax,dword ptr [esp+4]
 0004C443    mov         dword ptr [esp+0C],eax
 0004C447    mov         eax,dword ptr [ebx+10]
 0004C44A    call        TBrush.GetHandle
 0004C44F    push        eax
 0004C450    mov         eax,dword ptr [ebx+54]
 0004C453    push        eax
 0004C454    call        gdi32.SelectObject
 0004C459    mov         esi,eax
 0004C45B    push        5A0049
 0004C460    mov         ecx,dword ptr [esp+10]
 0004C464    mov         edx,dword ptr [esp+8]
 0004C468    sub         ecx,edx
 0004C46A    push        ecx
 0004C46B    mov         ecx,dword ptr [esp+10]
 0004C46F    mov         eax,dword ptr [esp+8]
 0004C473    sub         ecx,eax
 0004C475    push        ecx
 0004C476    push        edx
 0004C477    push        eax
 0004C478    mov         eax,dword ptr [ebx+54]
 0004C47B    push        eax
 0004C47C    call        gdi32.PatBlt
 0004C481    push        esi
 0004C482    mov         eax,dword ptr [ebx+54]
 0004C485    push        eax
 0004C486    call        gdi32.SelectObject
 0004C48B    add         esp,10
 0004C48E    pop         esi
 0004C48F    pop         ebx
 0004C490    ret
*}
end;

//0004C494
function Min(I1:Integer; I2:Integer):Integer;
begin
{*
 0004C494    cmp         edx,eax
>0004C496    jge         0004C49A
 0004C498    mov         eax,edx
 0004C49A    ret
*}
end;

//0004C49C
procedure DoGetNextLimit(Zone:TDockZone);
begin
{*
 0004C49C    push        ebp
 0004C49D    mov         ebp,esp
 0004C49F    push        ebx
 0004C4A0    mov         ebx,eax
 0004C4A2    mov         edx,dword ptr [ebp+8]
 0004C4A5    cmp         ebx,dword ptr [edx-4]
>0004C4A8    je          0004C4F3
 0004C4AA    mov         edx,dword ptr [ebx+14]
 0004C4AD    mov         dl,byte ptr [edx+10]
 0004C4B0    mov         ecx,dword ptr [ebp+8]
 0004C4B3    mov         ecx,dword ptr [ecx-4]
 0004C4B6    mov         ecx,dword ptr [ecx+14]
 0004C4B9    cmp         dl,byte ptr [ecx+10]
>0004C4BC    jne         0004C4F3
 0004C4BE    mov         edx,dword ptr [ebp+8]
 0004C4C1    mov         edx,dword ptr [edx-4]
 0004C4C4    mov         edx,dword ptr [edx+20]
 0004C4C7    cmp         edx,dword ptr [ebx+20]
>0004C4CA    jge         0004C4F3
 0004C4CC    cmp         dword ptr [ebx+4],0
>0004C4D0    je          0004C4DF
 0004C4D2    mov         eax,dword ptr [ebx+4]
 0004C4D5    test        eax,eax
>0004C4D7    je          0004C4F3
 0004C4D9    cmp         byte ptr [eax+47],0
>0004C4DD    je          0004C4F3
 0004C4DF    mov         eax,dword ptr [ebp+8]
 0004C4E2    mov         eax,dword ptr [eax-8]
 0004C4E5    mov         edx,dword ptr [ebx+20]
 0004C4E8    call        Min
 0004C4ED    mov         edx,dword ptr [ebp+8]
 0004C4F0    mov         dword ptr [edx-8],eax
 0004C4F3    mov         eax,dword ptr [ebx+0C]
 0004C4F6    test        eax,eax
>0004C4F8    je          0004C504
 0004C4FA    mov         edx,dword ptr [ebp+8]
 0004C4FD    push        edx
 0004C4FE    call        DoGetNextLimit
 0004C503    pop         ecx
 0004C504    mov         eax,dword ptr [ebx+8]
 0004C507    test        eax,eax
>0004C509    je          0004C515
 0004C50B    mov         edx,dword ptr [ebp+8]
 0004C50E    push        edx
 0004C50F    call        DoGetNextLimit
 0004C514    pop         ecx
 0004C515    pop         ebx
 0004C516    pop         ebp
 0004C517    ret
*}
end;

//0004C518
function TDockTree.GetNextLimit(AZone:TDockZone):Integer;
begin
{*
 0004C518    push        ebp
 0004C519    mov         ebp,esp
 0004C51B    add         esp,0FFFFFFF8
 0004C51E    push        ebx
 0004C51F    mov         dword ptr [ebp-4],edx
 0004C522    mov         ebx,eax
 0004C524    mov         eax,dword ptr [ebp-4]
 0004C527    mov         eax,dword ptr [eax+0C]
 0004C52A    test        eax,eax
>0004C52C    je          0004C536
 0004C52E    mov         eax,dword ptr [eax+20]
 0004C531    mov         dword ptr [ebp-8],eax
>0004C534    jmp         0004C547
 0004C536    mov         eax,dword ptr [ebp-4]
 0004C539    call        TDockZone.GetLimitSize
 0004C53E    mov         edx,dword ptr [ebp-4]
 0004C541    add         eax,dword ptr [edx+20]
 0004C544    mov         dword ptr [ebp-8],eax
 0004C547    push        ebp
 0004C548    mov         eax,dword ptr [ebx+60]
 0004C54B    mov         eax,dword ptr [eax+8]
 0004C54E    call        DoGetNextLimit
 0004C553    pop         ecx
 0004C554    mov         eax,dword ptr [ebp-8]
 0004C557    pop         ebx
 0004C558    pop         ecx
 0004C559    pop         ecx
 0004C55A    pop         ebp
 0004C55B    ret
*}
end;

//0004C55C
{*function sub_0004C55C(?:?; ?:?):?;
begin
 0004C55C    push        ebp
 0004C55D    mov         ebp,esp
 0004C55F    add         esp,0FFFFFFE0
 0004C562    push        ebx
 0004C563    push        esi
 0004C564    push        edi
 0004C565    mov         esi,edx
 0004C567    mov         edi,eax
 0004C569    mov         bl,4
 0004C56B    test        esi,esi
>0004C56D    je          0004C5CF
 0004C56F    lea         edx,[ebp-10]
 0004C572    mov         eax,edi
 0004C574    call        TControl.GetBoundsRect
 0004C579    lea         edx,[ebp-20]
 0004C57C    mov         eax,esi
 0004C57E    call        TControl.GetBoundsRect
 0004C583    mov         eax,dword ptr [ebp-0C]
 0004C586    cmp         eax,dword ptr [ebp-1C]
>0004C589    jg          0004C59F
 0004C58B    mov         eax,dword ptr [ebp-4]
 0004C58E    cmp         eax,dword ptr [ebp-14]
>0004C591    jge         0004C59F
 0004C593    mov         eax,dword ptr [ebp-8]
 0004C596    cmp         eax,dword ptr [ebp-18]
>0004C599    jl          0004C59F
 0004C59B    mov         bl,1
>0004C59D    jmp         0004C5CF
 0004C59F    mov         eax,dword ptr [ebp-10]
 0004C5A2    cmp         eax,dword ptr [ebp-20]
>0004C5A5    jg          0004C5BB
 0004C5A7    mov         eax,dword ptr [ebp-8]
 0004C5AA    cmp         eax,dword ptr [ebp-18]
>0004C5AD    jge         0004C5BB
 0004C5AF    mov         eax,dword ptr [ebp-4]
 0004C5B2    cmp         eax,dword ptr [ebp-14]
>0004C5B5    jl          0004C5BB
 0004C5B7    mov         bl,3
>0004C5B9    jmp         0004C5CF
 0004C5BB    mov         eax,dword ptr [ebp-1C]
 0004C5BE    add         eax,dword ptr [ebp-14]
 0004C5C1    sar         eax,1
>0004C5C3    jns         0004C5C8
 0004C5C5    adc         eax,0
 0004C5C8    cmp         eax,dword ptr [ebp-0C]
>0004C5CB    jg          0004C5CF
 0004C5CD    mov         bl,2
 0004C5CF    mov         eax,ebx
 0004C5D1    pop         edi
 0004C5D2    pop         esi
 0004C5D3    pop         ebx
 0004C5D4    mov         esp,ebp
 0004C5D6    pop         ebp
 0004C5D7    ret
end;*}

//0004C5D8
procedure TDockTree.ControlVisibilityChanged(Control:TControl; Visible:Boolean);
begin
{*
 0004C5D8    push        ebx
 0004C5D9    push        esi
 0004C5DA    push        edi
 0004C5DB    add         esp,0FFFFFFF4
 0004C5DE    mov         edi,edx
 0004C5E0    mov         esi,eax
 0004C5E2    test        cl,cl
>0004C5E4    je          0004C631
 0004C5E6    mov         edx,edi
 0004C5E8    mov         eax,esi
 0004C5EA    call        TDockTree.FindControlZone
 0004C5EF    test        eax,eax
>0004C5F1    jne         0004C63A
 0004C5F3    lea         ecx,[esp+4]
 0004C5F7    mov         edx,dword ptr [edi+34]
 0004C5FA    mov         eax,dword ptr [edi+30]
 0004C5FD    call        Point
 0004C602    lea         edx,[esp+4]
 0004C606    mov         ecx,esp
 0004C608    mov         eax,esi
 0004C60A    call        TDockTree.InternalHitTest
 0004C60F    test        eax,eax
>0004C611    je          0004C618
 0004C613    mov         ebx,dword ptr [eax+4]
>0004C616    jmp         0004C61A
 0004C618    xor         ebx,ebx
 0004C61A    push        ebx
 0004C61B    mov         edx,ebx
 0004C61D    mov         eax,edi
 0004C61F    call        0004C55C
 0004C624    mov         ecx,eax
 0004C626    mov         edx,edi
 0004C628    mov         eax,esi
 0004C62A    mov         ebx,dword ptr [eax]
 0004C62C    call        dword ptr [ebx+8]
>0004C62F    jmp         0004C63A
 0004C631    mov         edx,edi
 0004C633    mov         eax,esi
 0004C635    mov         ecx,dword ptr [eax]
 0004C637    call        dword ptr [ecx+18]
 0004C63A    add         esp,0C
 0004C63D    pop         edi
 0004C63E    pop         esi
 0004C63F    pop         ebx
 0004C640    ret
*}
end;

//0004C644
procedure CalcSplitterPos;
begin
{*
 0004C644    push        ebp
 0004C645    mov         ebp,esp
 0004C647    push        ebx
 0004C648    push        esi
 0004C649    push        edi
 0004C64A    mov         esi,dword ptr [ebp+8]
 0004C64D    add         esi,0FFFFFFFC
 0004C650    mov         eax,dword ptr [esi]
 0004C652    mov         ebx,dword ptr [eax+18]
 0004C655    mov         eax,dword ptr [esi]
 0004C657    mov         edi,dword ptr [eax+5C]
 0004C65A    mov         eax,dword ptr [edi+14]
 0004C65D    cmp         byte ptr [eax+10],1
>0004C661    jne         0004C699
 0004C663    mov         eax,edi
 0004C665    mov         edx,1
 0004C66A    call        TDockZone.GetTopLeft
 0004C66F    add         eax,ebx
 0004C671    mov         edx,dword ptr [esi]
 0004C673    cmp         eax,dword ptr [edx+50]
>0004C676    jl          0004C67D
 0004C678    mov         edx,dword ptr [esi]
 0004C67A    mov         dword ptr [edx+50],eax
 0004C67D    mov         eax,dword ptr [esi]
 0004C67F    mov         edx,dword ptr [eax+5C]
 0004C682    mov         eax,dword ptr [esi]
 0004C684    call        TDockTree.GetNextLimit
 0004C689    sub         eax,ebx
 0004C68B    mov         edx,dword ptr [esi]
 0004C68D    cmp         eax,dword ptr [edx+50]
>0004C690    jg          0004C6D0
 0004C692    mov         edx,dword ptr [esi]
 0004C694    mov         dword ptr [edx+50],eax
>0004C697    jmp         0004C6D0
 0004C699    mov         eax,dword ptr [esi]
 0004C69B    mov         eax,dword ptr [eax+5C]
 0004C69E    mov         edx,2
 0004C6A3    call        TDockZone.GetTopLeft
 0004C6A8    add         eax,ebx
 0004C6AA    mov         edx,dword ptr [esi]
 0004C6AC    cmp         eax,dword ptr [edx+4C]
>0004C6AF    jl          0004C6B6
 0004C6B1    mov         edx,dword ptr [esi]
 0004C6B3    mov         dword ptr [edx+4C],eax
 0004C6B6    mov         eax,dword ptr [esi]
 0004C6B8    mov         edx,dword ptr [eax+5C]
 0004C6BB    mov         eax,dword ptr [esi]
 0004C6BD    call        TDockTree.GetNextLimit
 0004C6C2    sub         eax,ebx
 0004C6C4    mov         edx,dword ptr [esi]
 0004C6C6    cmp         eax,dword ptr [edx+4C]
>0004C6C9    jg          0004C6D0
 0004C6CB    mov         edx,dword ptr [esi]
 0004C6CD    mov         dword ptr [edx+4C],eax
 0004C6D0    pop         edi
 0004C6D1    pop         esi
 0004C6D2    pop         ebx
 0004C6D3    pop         ebp
 0004C6D4    ret
*}
end;

//0004C6D8
procedure TDockTree.WindowProc(var Message:TMessage);
begin
{*
 0004C6D8    push        ebp
 0004C6D9    mov         ebp,esp
 0004C6DB    add         esp,0FFFFFFB8
 0004C6DE    push        ebx
 0004C6DF    push        esi
 0004C6E0    push        edi
 0004C6E1    xor         ecx,ecx
 0004C6E3    mov         dword ptr [ebp-48],ecx
 0004C6E6    mov         ebx,edx
 0004C6E8    mov         dword ptr [ebp-4],eax
 0004C6EB    xor         eax,eax
 0004C6ED    push        ebp
 0004C6EE    push        4CAA9
 0004C6F3    push        dword ptr fs:[eax]
 0004C6F6    mov         dword ptr fs:[eax],esp
 0004C6F9    mov         eax,dword ptr [ebx]
 0004C6FB    cmp         eax,202
>0004C700    jg          0004C724
>0004C702    je          0004C8A3
 0004C708    sub         eax,20
>0004C70B    je          0004C914
 0004C711    sub         eax,1E0
>0004C716    je          0004C761
 0004C718    dec         eax
>0004C719    je          0004C7F3
>0004C71F    jmp         0004CA88
 0004C724    sub         eax,203
>0004C729    je          0004C7A4
 0004C72B    sub         eax,0AE2D
>0004C730    je          0004C9BB
 0004C736    sub         eax,12
>0004C739    jne         0004CA88
 0004C73F    mov         eax,dword ptr [ebx+8]
 0004C742    cmp         dword ptr [eax],0B00B
>0004C748    jne         0004CA88
 0004C74E    mov         cl,byte ptr [eax+4]
 0004C751    mov         edx,dword ptr [ebx+4]
 0004C754    mov         eax,dword ptr [ebp-4]
 0004C757    call        TDockTree.ControlVisibilityChanged
>0004C75C    jmp         0004CA88
 0004C761    mov         eax,dword ptr [ebp-4]
 0004C764    cmp         dword ptr [eax+5C],0
>0004C768    je          0004CA88
 0004C76E    mov         eax,dword ptr [ebp-4]
 0004C771    call        TDockTree.DrawSizeSplitter
 0004C776    lea         edx,[ebp-44]
 0004C779    mov         eax,dword ptr [ebx+8]
 0004C77C    call        SmallPointToPoint
 0004C781    mov         eax,dword ptr [ebp-4]
 0004C784    mov         edx,dword ptr [ebp-44]
 0004C787    mov         dword ptr [eax+4C],edx
 0004C78A    mov         edx,dword ptr [ebp-40]
 0004C78D    mov         dword ptr [eax+50],edx
 0004C790    push        ebp
 0004C791    call        CalcSplitterPos
 0004C796    pop         ecx
 0004C797    mov         eax,dword ptr [ebp-4]
 0004C79A    call        TDockTree.DrawSizeSplitter
>0004C79F    jmp         0004CA88
 0004C7A4    lea         edx,[ebp-44]
 0004C7A7    mov         eax,dword ptr [ebx+8]
 0004C7AA    call        SmallPointToPoint
 0004C7AF    lea         edx,[ebp-44]
 0004C7B2    lea         ecx,[ebp-10]
 0004C7B5    mov         eax,dword ptr [ebp-4]
 0004C7B8    call        TDockTree.InternalHitTest
 0004C7BD    mov         esi,eax
 0004C7BF    test        esi,esi
>0004C7C1    je          0004CA88
 0004C7C7    cmp         dword ptr [esi+4],0
>0004C7CB    je          0004CA88
 0004C7D1    cmp         dword ptr [ebp-10],2
>0004C7D5    jne         0004CA88
 0004C7DB    call        CancelDrag
 0004C7E0    push        1
 0004C7E2    xor         ecx,ecx
 0004C7E4    xor         edx,edx
 0004C7E6    mov         eax,dword ptr [esi+4]
 0004C7E9    call        TControl.ManualDock
>0004C7EE    jmp         0004CA88
 0004C7F3    lea         edx,[ebp-0C]
 0004C7F6    mov         eax,dword ptr [ebx+8]
 0004C7F9    call        SmallPointToPoint
 0004C7FE    lea         ecx,[ebp-10]
 0004C801    lea         edx,[ebp-0C]
 0004C804    mov         eax,dword ptr [ebp-4]
 0004C807    call        TDockTree.InternalHitTest
 0004C80C    mov         esi,eax
 0004C80E    test        esi,esi
>0004C810    je          0004CA88
 0004C816    cmp         dword ptr [ebp-10],12
>0004C81A    jne         0004C82E
 0004C81C    lea         ecx,[ebp-0C]
 0004C81F    mov         edx,esi
 0004C821    mov         eax,dword ptr [ebp-4]
 0004C824    call        TDockTree.SplitterMouseDown
>0004C829    jmp         0004CA88
 0004C82E    cmp         dword ptr [ebp-10],2
>0004C832    jne         0004CA88
 0004C838    push        0
 0004C83A    push        203
 0004C83F    push        203
 0004C844    mov         eax,dword ptr [ebp-4]
 0004C847    mov         eax,dword ptr [eax+14]
 0004C84A    call        TWinControl.GetHandle
 0004C84F    push        eax
 0004C850    lea         eax,[ebp-3C]
 0004C853    push        eax
 0004C854    call        user32.PeekMessageA
 0004C859    test        eax,eax
>0004C85B    jne         0004C87A
 0004C85D    mov         eax,dword ptr [esi+4]
 0004C860    mov         edx,dword ptr ds:[3F0BC];TWinControl
 0004C866    call        @IsClass
 0004C86B    test        al,al
>0004C86D    je          0004C87A
 0004C86F    mov         eax,dword ptr [esi+4]
 0004C872    mov         edx,dword ptr [eax]
 0004C874    call        dword ptr [edx+0B4]
 0004C87A    mov         eax,dword ptr [esi+4]
 0004C87D    cmp         byte ptr [eax+87],1
>0004C884    jne         0004CA93
 0004C88A    cmp         byte ptr [eax+4D],1
>0004C88E    jne         0004CA93
 0004C894    or          ecx,0FFFFFFFF
 0004C897    xor         edx,edx
 0004C899    call        TControl.BeginDrag
>0004C89E    jmp         0004CA93
 0004C8A3    mov         eax,dword ptr [ebp-4]
 0004C8A6    cmp         dword ptr [eax+5C],0
>0004C8AA    jne         0004C907
 0004C8AC    lea         edx,[ebp-0C]
 0004C8AF    mov         eax,dword ptr [ebx+8]
 0004C8B2    call        SmallPointToPoint
 0004C8B7    lea         ecx,[ebp-10]
 0004C8BA    lea         edx,[ebp-0C]
 0004C8BD    mov         eax,dword ptr [ebp-4]
 0004C8C0    call        TDockTree.InternalHitTest
 0004C8C5    mov         esi,eax
 0004C8C7    test        esi,esi
>0004C8C9    je          0004CA88
 0004C8CF    cmp         dword ptr [ebp-10],14
>0004C8D3    jne         0004CA88
 0004C8D9    mov         edi,dword ptr [esi+4]
 0004C8DC    mov         eax,edi
 0004C8DE    mov         edx,dword ptr ds:[55208];TCustomForm
 0004C8E4    call        @IsClass
 0004C8E9    test        al,al
>0004C8EB    je          0004C8F9
 0004C8ED    mov         eax,edi
 0004C8EF    call        TCustomForm.Close
>0004C8F4    jmp         0004CA88
 0004C8F9    xor         edx,edx
 0004C8FB    mov         eax,edi
 0004C8FD    call        TControl.SetVisible
>0004C902    jmp         0004CA88
 0004C907    mov         eax,dword ptr [ebp-4]
 0004C90A    call        TDockTree.SplitterMouseUp
>0004C90F    jmp         0004CA88
 0004C914    lea         eax,[ebp-0C]
 0004C917    push        eax
 0004C918    call        user32.GetCursorPos
 0004C91D    lea         ecx,[ebp-44]
 0004C920    lea         edx,[ebp-0C]
 0004C923    mov         eax,dword ptr [ebp-4]
 0004C926    mov         eax,dword ptr [eax+14]
 0004C929    call        TControl.ScreenToClient
 0004C92E    mov         eax,dword ptr [ebp-44]
 0004C931    mov         dword ptr [ebp-0C],eax
 0004C934    mov         eax,dword ptr [ebp-40]
 0004C937    mov         dword ptr [ebp-8],eax
 0004C93A    cmp         word ptr [ebx+8],1
>0004C93F    jne         0004CA88
 0004C945    mov         eax,dword ptr [ebp-4]
 0004C948    mov         eax,dword ptr [eax+14]
 0004C94B    call        TWinControl.GetHandle
 0004C950    cmp         eax,dword ptr [ebx+4]
>0004C953    jne         0004CA88
 0004C959    mov         eax,dword ptr [ebp-4]
 0004C95C    mov         eax,dword ptr [eax+14]
 0004C95F    call        TWinControl.GetDockClientCount
 0004C964    test        eax,eax
>0004C966    jle         0004CA88
 0004C96C    lea         ecx,[ebp-10]
 0004C96F    lea         edx,[ebp-0C]
 0004C972    mov         eax,dword ptr [ebp-4]
 0004C975    call        TDockTree.InternalHitTest
 0004C97A    mov         esi,eax
 0004C97C    test        esi,esi
>0004C97E    je          0004CA88
 0004C984    cmp         dword ptr [ebp-10],12
>0004C988    jne         0004CA88
 0004C98E    mov         eax,dword ptr [esi+14]
 0004C991    movzx       eax,byte ptr [eax+10]
 0004C995    movsx       edx,word ptr [eax*2+0B4890]
 0004C99D    mov         eax,[000B5BDC];^Screen:TScreen
 0004C9A2    mov         eax,dword ptr [eax]
 0004C9A4    call        TScreen.GetCursors
 0004C9A9    push        eax
 0004C9AA    call        user32.SetCursor
 0004C9AF    mov         dword ptr [ebx+0C],1
>0004C9B6    jmp         0004CA93
 0004C9BB    mov         edx,ebx
 0004C9BD    mov         esi,dword ptr [ebp-4]
 0004C9C0    mov         eax,dword ptr [esi+34]
 0004C9C3    call        dword ptr [esi+30]
 0004C9C6    cmp         dword ptr [ebx+0C],0
>0004C9CA    jne         0004CA93
 0004C9D0    lea         ecx,[ebp-10]
 0004C9D3    mov         eax,dword ptr [ebx+8]
 0004C9D6    lea         edx,[eax+28]
 0004C9D9    mov         eax,dword ptr [ebp-4]
 0004C9DC    mov         esi,dword ptr [eax]
 0004C9DE    call        dword ptr [esi+4]
 0004C9E1    mov         esi,eax
 0004C9E3    cmp         dword ptr [ebp-10],12
>0004C9E7    jne         0004C9F9
 0004C9E9    mov         eax,dword ptr [ebx+8]
 0004C9EC    add         eax,38
 0004C9EF    call        @LStrClr
>0004C9F4    jmp         0004CA93
 0004C9F9    test        esi,esi
>0004C9FB    je          0004CA93
 0004CA01    mov         eax,dword ptr [ebp-10]
 0004CA04    sub         eax,2
>0004CA07    je          0004CA12
 0004CA09    sub         eax,12
>0004CA0C    jne         0004CA93
 0004CA12    lea         edx,[ebp-20]
 0004CA15    mov         eax,esi
 0004CA17    call        TControl.GetBoundsRect
 0004CA1C    lea         ecx,[ebp-20]
 0004CA1F    mov         edx,esi
 0004CA21    mov         eax,dword ptr [ebp-4]
 0004CA24    mov         edi,dword ptr [eax]
 0004CA26    call        dword ptr [edi]
 0004CA28    mov         eax,dword ptr [ebp-20]
 0004CA2B    sub         eax,dword ptr [esi+30]
 0004CA2E    add         eax,eax
 0004CA30    sub         dword ptr [ebp-20],eax
 0004CA33    mov         eax,dword ptr [ebp-1C]
 0004CA36    sub         eax,dword ptr [esi+34]
 0004CA39    add         eax,eax
 0004CA3B    sub         dword ptr [ebp-1C],eax
 0004CA3E    mov         eax,dword ptr [esi+38]
 0004CA41    mov         edx,dword ptr [ebp-18]
 0004CA44    sub         edx,dword ptr [ebp-20]
 0004CA47    sub         eax,edx
 0004CA49    add         eax,eax
 0004CA4B    sub         dword ptr [ebp-18],eax
 0004CA4E    mov         eax,dword ptr [esi+3C]
 0004CA51    mov         edx,dword ptr [ebp-14]
 0004CA54    sub         edx,dword ptr [ebp-1C]
 0004CA57    sub         eax,edx
 0004CA59    add         eax,eax
 0004CA5B    sub         dword ptr [ebp-14],eax
 0004CA5E    lea         edx,[ebp-48]
 0004CA61    mov         eax,esi
 0004CA63    call        TControl.GetText
 0004CA68    mov         edx,dword ptr [ebp-48]
 0004CA6B    mov         eax,dword ptr [ebx+8]
 0004CA6E    add         eax,38
 0004CA71    call        @LStrAsg
 0004CA76    mov         eax,dword ptr [ebx+8]
 0004CA79    lea         edi,[eax+18]
 0004CA7C    lea         esi,[ebp-20]
 0004CA7F    mov         ecx,4
 0004CA84    rep movs    dword ptr [edi],dword ptr [esi]
>0004CA86    jmp         0004CA93
 0004CA88    mov         edx,ebx
 0004CA8A    mov         ebx,dword ptr [ebp-4]
 0004CA8D    mov         eax,dword ptr [ebx+34]
 0004CA90    call        dword ptr [ebx+30]
 0004CA93    xor         eax,eax
 0004CA95    pop         edx
 0004CA96    pop         ecx
 0004CA97    pop         ecx
 0004CA98    mov         dword ptr fs:[eax],edx
 0004CA9B    push        4CAB0
 0004CAA0    lea         eax,[ebp-48]
 0004CAA3    call        @LStrClr
 0004CAA8    ret
>0004CAA9    jmp         @HandleFinally
>0004CAAE    jmp         0004CAA0
 0004CAB0    pop         edi
 0004CAB1    pop         esi
 0004CAB2    pop         ebx
 0004CAB3    mov         esp,ebp
 0004CAB5    pop         ebp
 0004CAB6    ret
*}
end;

//0004CAB8
constructor TMouse.Create;
begin
{*
 0004CAB8    push        ebx
 0004CAB9    push        esi
 0004CABA    test        dl,dl
>0004CABC    je          0004CAC6
 0004CABE    add         esp,0FFFFFFF0
 0004CAC1    call        @ClassCreate
 0004CAC6    mov         ebx,edx
 0004CAC8    mov         esi,eax
 0004CACA    xor         edx,edx
 0004CACC    mov         eax,esi
 0004CACE    call        TObject.Create
 0004CAD3    mov         byte ptr [esi+4],1
 0004CAD7    mov         dword ptr [esi+8],5
 0004CADE    mov         eax,[000B5C00]
 0004CAE3    cmp         dword ptr [eax],2
>0004CAE6    jne         0004CAF2
 0004CAE8    mov         eax,[000B5804]
 0004CAED    cmp         dword ptr [eax],4
>0004CAF0    jge         0004CB1E
 0004CAF2    mov         eax,[000B5C00]
 0004CAF7    cmp         dword ptr [eax],1
>0004CAFA    jne         0004CB1A
 0004CAFC    mov         eax,[000B5804]
 0004CB01    cmp         dword ptr [eax],4
>0004CB04    jg          0004CB1E
 0004CB06    mov         eax,[000B5804]
 0004CB0B    cmp         dword ptr [eax],4
>0004CB0E    jne         0004CB1A
 0004CB10    mov         eax,[000B5A74]
 0004CB15    cmp         dword ptr [eax],0A
>0004CB18    jge         0004CB1E
 0004CB1A    xor         eax,eax
>0004CB1C    jmp         0004CB20
 0004CB1E    mov         al,1
 0004CB20    mov         byte ptr [esi+0D],al
 0004CB23    xor         edx,edx
 0004CB25    mov         eax,esi
 0004CB27    call        TMouse.SettingChanged
 0004CB2C    mov         eax,esi
 0004CB2E    test        bl,bl
>0004CB30    je          0004CB41
 0004CB32    call        @AfterConstruction
 0004CB37    pop         dword ptr fs:[0]
 0004CB3E    add         esp,0C
 0004CB41    mov         eax,esi
 0004CB43    pop         esi
 0004CB44    pop         ebx
 0004CB45    ret
*}
end;

//0004CB48
destructor TMouse.Destroy;
begin
{*
 0004CB48    push        ebx
 0004CB49    push        esi
 0004CB4A    call        @BeforeDestruction
 0004CB4F    mov         ebx,edx
 0004CB51    mov         esi,eax
 0004CB53    xor         edx,edx
 0004CB55    mov         eax,esi
 0004CB57    call        TMouse.SetCapture
 0004CB5C    mov         edx,ebx
 0004CB5E    and         dl,0FC
 0004CB61    mov         eax,esi
 0004CB63    call        TObject.Destroy
 0004CB68    test        bl,bl
>0004CB6A    jle         0004CB73
 0004CB6C    mov         eax,esi
 0004CB6E    call        @ClassDestroy
 0004CB73    pop         esi
 0004CB74    pop         ebx
 0004CB75    ret
*}
end;

//0004CB78
function TMouse.GetCapture:HWND;
begin
{*
 0004CB78    call        user32.GetCapture
 0004CB7D    ret
*}
end;

//0004CB80
procedure TMouse.GetMouseData;
begin
{*
 0004CB80    push        ebx
 0004CB81    mov         ebx,eax
 0004CB83    push        13
 0004CB85    mov         eax,[000B582C];^gvar_000B66A0
 0004CB8A    mov         eax,dword ptr [eax]
 0004CB8C    call        eax
 0004CB8E    neg         eax
 0004CB90    sbb         eax,eax
 0004CB92    neg         eax
 0004CB94    mov         byte ptr [ebx+0C],al
 0004CB97    pop         ebx
 0004CB98    ret
*}
end;

//0004CB9C
procedure TMouse.GetNativeData;
begin
{*
 0004CB9C    push        ebx
 0004CB9D    push        esi
 0004CB9E    mov         esi,eax
 0004CBA0    push        4B
 0004CBA2    mov         eax,[000B582C];^gvar_000B66A0
 0004CBA7    mov         eax,dword ptr [eax]
 0004CBA9    call        eax
 0004CBAB    neg         eax
 0004CBAD    sbb         ebx,ebx
 0004CBAF    neg         ebx
 0004CBB1    mov         byte ptr [esi+20],bl
 0004CBB4    test        bl,bl
>0004CBB6    je          0004CBC7
 0004CBB8    push        0
 0004CBBA    lea         eax,[esi+10]
 0004CBBD    push        eax
 0004CBBE    push        0
 0004CBC0    push        68
 0004CBC2    call        user32.SystemParametersInfoA
 0004CBC7    pop         esi
 0004CBC8    pop         ebx
 0004CBC9    ret
*}
end;

//0004CBCC
procedure TMouse.GetRegisteredData;
begin
{*
 0004CBCC    push        ebx
 0004CBCD    push        ecx
 0004CBCE    mov         ebx,eax
 0004CBD0    push        esp
 0004CBD1    lea         eax,[ebx+10]
 0004CBD4    push        eax
 0004CBD5    lea         ecx,[ebx+14]
 0004CBD8    lea         edx,[ebx+24]
 0004CBDB    lea         eax,[ebx+1C]
 0004CBDE    call        HwndMSWheel
 0004CBE3    mov         dword ptr [ebx+18],eax
 0004CBE6    cmp         dword ptr [ebx+1C],0
 0004CBEA    setne       al
 0004CBED    mov         byte ptr [ebx+20],al
 0004CBF0    pop         edx
 0004CBF1    pop         ebx
 0004CBF2    ret
*}
end;

//0004CBF4
procedure TMouse.SetCapture(const Value:HWND);
begin
{*
 0004CBF4    push        ebx
 0004CBF5    push        esi
 0004CBF6    mov         esi,edx
 0004CBF8    mov         ebx,eax
 0004CBFA    mov         eax,ebx
 0004CBFC    call        TMouse.GetCapture
 0004CC01    cmp         esi,eax
>0004CC03    je          0004CC16
 0004CC05    test        esi,esi
>0004CC07    jne         0004CC10
 0004CC09    call        user32.ReleaseCapture
>0004CC0E    jmp         0004CC16
 0004CC10    push        esi
 0004CC11    call        user32.SetCapture
 0004CC16    pop         esi
 0004CC17    pop         ebx
 0004CC18    ret
*}
end;

//0004CC1C
procedure TMouse.SettingChanged(Setting:Integer);
begin
{*
 0004CC1C    push        ebx
 0004CC1D    mov         ebx,eax
 0004CC1F    sub         edx,1
>0004CC22    jb          0004CC2B
 0004CC24    sub         edx,67
>0004CC27    je          0004CC4A
>0004CC29    jmp         0004CC7B
 0004CC2B    mov         eax,ebx
 0004CC2D    call        TMouse.GetMouseData
 0004CC32    cmp         byte ptr [ebx+0D],0
>0004CC36    jne         0004CC41
 0004CC38    mov         eax,ebx
 0004CC3A    call        TMouse.GetRegisteredData
>0004CC3F    jmp         0004CC7B
 0004CC41    mov         eax,ebx
 0004CC43    call        TMouse.GetNativeData
 0004CC48    pop         ebx
 0004CC49    ret
 0004CC4A    cmp         byte ptr [ebx+20],0
>0004CC4E    je          0004CC7B
 0004CC50    cmp         byte ptr [ebx+0D],0
>0004CC54    je          0004CC67
 0004CC56    push        0
 0004CC58    lea         eax,[ebx+10]
 0004CC5B    push        eax
 0004CC5C    push        0
 0004CC5E    push        68
 0004CC60    call        user32.SystemParametersInfoA
>0004CC65    jmp         0004CC7B
 0004CC67    push        0
 0004CC69    push        0
 0004CC6B    mov         eax,dword ptr [ebx+14]
 0004CC6E    push        eax
 0004CC6F    mov         eax,dword ptr [ebx+18]
 0004CC72    push        eax
 0004CC73    call        user32.SendMessageA
 0004CC78    mov         dword ptr [ebx+10],eax
 0004CC7B    pop         ebx
 0004CC7C    ret
*}
end;

//0004CC80
procedure InitIMM32;
begin
{*
 0004CC80    push        ebp
 0004CC81    mov         ebp,esp
 0004CC83    push        ecx
 0004CC84    push        ebx
 0004CC85    mov         eax,[000B5C08];SysLocale:TSysLocale
 0004CC8A    cmp         byte ptr [eax+8],0
>0004CC8E    je          0004CDED
 0004CC94    push        8000
 0004CC99    call        kernel32.SetErrorMode
 0004CC9E    mov         dword ptr [ebp-4],eax
 0004CCA1    xor         eax,eax
 0004CCA3    push        ebp
 0004CCA4    push        4CDE6
 0004CCA9    push        dword ptr fs:[eax]
 0004CCAC    mov         dword ptr fs:[eax],esp
 0004CCAF    cmp         dword ptr ds:[0B6770],0
>0004CCB6    jne         0004CCD4
 0004CCB8    push        4CDF4
 0004CCBD    call        kernel32.GetModuleHandleA
 0004CCC2    mov         ebx,eax
 0004CCC4    push        4CDFC
 0004CCC9    push        ebx
 0004CCCA    call        kernel32.GetProcAddress
 0004CCCF    mov         [000B6770],eax
 0004CCD4    cmp         dword ptr ds:[0B4898],0
>0004CCDB    jne         0004CDCF
 0004CCE1    push        4CE0C
 0004CCE6    call        kernel32.LoadLibraryA
 0004CCEB    mov         [000B4898],eax
 0004CCF0    cmp         dword ptr ds:[0B4898],0
>0004CCF7    je          0004CDCF
 0004CCFD    push        4CE18
 0004CD02    mov         eax,[000B4898]
 0004CD07    push        eax
 0004CD08    call        kernel32.GetProcAddress
 0004CD0D    mov         [000B6774],eax
 0004CD12    push        4CE28
 0004CD17    mov         eax,[000B4898]
 0004CD1C    push        eax
 0004CD1D    call        kernel32.GetProcAddress
 0004CD22    mov         [000B6778],eax
 0004CD27    push        4CE3C
 0004CD2C    mov         eax,[000B4898]
 0004CD31    push        eax
 0004CD32    call        kernel32.GetProcAddress
 0004CD37    mov         [000B677C],eax
 0004CD3C    push        4CE54
 0004CD41    mov         eax,[000B4898]
 0004CD46    push        eax
 0004CD47    call        kernel32.GetProcAddress
 0004CD4C    mov         [000B6780],eax
 0004CD51    push        4CE6C
 0004CD56    mov         eax,[000B4898]
 0004CD5B    push        eax
 0004CD5C    call        kernel32.GetProcAddress
 0004CD61    mov         [000B6784],eax
 0004CD66    push        4CE80
 0004CD6B    mov         eax,[000B4898]
 0004CD70    push        eax
 0004CD71    call        kernel32.GetProcAddress
 0004CD76    mov         [000B6788],eax
 0004CD7B    push        4CE98
 0004CD80    mov         eax,[000B4898]
 0004CD85    push        eax
 0004CD86    call        kernel32.GetProcAddress
 0004CD8B    mov         [000B678C],eax
 0004CD90    push        4CEB0
 0004CD95    mov         eax,[000B4898]
 0004CD9A    push        eax
 0004CD9B    call        kernel32.GetProcAddress
 0004CDA0    mov         [000B6790],eax
 0004CDA5    push        4CECC
 0004CDAA    mov         eax,[000B4898]
 0004CDAF    push        eax
 0004CDB0    call        kernel32.GetProcAddress
 0004CDB5    mov         [000B6794],eax
 0004CDBA    push        4CED8
 0004CDBF    mov         eax,[000B4898]
 0004CDC4    push        eax
 0004CDC5    call        kernel32.GetProcAddress
 0004CDCA    mov         [000B6798],eax
 0004CDCF    xor         eax,eax
 0004CDD1    pop         edx
 0004CDD2    pop         ecx
 0004CDD3    pop         ecx
 0004CDD4    mov         dword ptr fs:[eax],edx
 0004CDD7    push        4CDED
 0004CDDC    mov         eax,dword ptr [ebp-4]
 0004CDDF    push        eax
 0004CDE0    call        kernel32.SetErrorMode
 0004CDE5    ret
>0004CDE6    jmp         @HandleFinally
>0004CDEB    jmp         0004CDDC
 0004CDED    pop         ebx
 0004CDEE    pop         ecx
 0004CDEF    pop         ebp
 0004CDF0    ret
*}
end;

//0004CEE8
function Win32NLSEnableIME(hWnd:HWND; Enable:Boolean):Boolean;
begin
{*
 0004CEE8    cmp         dword ptr ds:[0B6770],0
>0004CEEF    je          0004CEFA
 0004CEF1    push        edx
 0004CEF2    push        eax
 0004CEF3    call        dword ptr ds:[0B6770]
 0004CEF9    ret
 0004CEFA    xor         eax,eax
 0004CEFC    ret
*}
end;

//0004CF00
procedure SetImeMode(hWnd:HWND; Mode:TImeMode);
begin
{*
 0004CF00    push        ebx
 0004CF01    push        esi
 0004CF02    push        edi
 0004CF03    add         esp,0FFFFFFF8
 0004CF06    mov         ebx,edx
 0004CF08    mov         esi,eax
 0004CF0A    mov         eax,[000B5C08];SysLocale:TSysLocale
 0004CF0F    cmp         byte ptr [eax+8],0
>0004CF13    je          0004CFD3
 0004CF19    cmp         bl,3
>0004CF1C    je          0004CFD3
 0004CF22    test        bl,bl
>0004CF24    jne         0004CF34
 0004CF26    xor         edx,edx
 0004CF28    mov         eax,esi
 0004CF2A    call        Win32NLSEnableIME
>0004CF2F    jmp         0004CFD3
 0004CF34    mov         dl,1
 0004CF36    mov         eax,esi
 0004CF38    call        Win32NLSEnableIME
 0004CF3D    cmp         dword ptr ds:[0B4898],0
>0004CF44    je          0004CFD3
 0004CF4A    push        esi
 0004CF4B    call        dword ptr ds:[0B6774]
 0004CF51    mov         edi,eax
 0004CF53    test        edi,edi
>0004CF55    je          0004CFD3
 0004CF57    lea         eax,[esp+4]
 0004CF5B    push        eax
 0004CF5C    lea         eax,[esp+4]
 0004CF60    push        eax
 0004CF61    push        edi
 0004CF62    call        dword ptr ds:[0B677C]
 0004CF68    mov         eax,ebx
 0004CF6A    dec         al
>0004CF6C    je          0004CF74
 0004CF6E    dec         al
>0004CF70    je          0004CF7F
>0004CF72    jmp         0004CF8A
 0004CF74    push        0
 0004CF76    push        edi
 0004CF77    call        dword ptr ds:[0B6784]
>0004CF7D    jmp         0004CFBA
 0004CF7F    push        1
 0004CF81    push        edi
 0004CF82    call        dword ptr ds:[0B6784]
>0004CF88    jmp         0004CFBA
 0004CF8A    push        1
 0004CF8C    push        edi
 0004CF8D    call        dword ptr ds:[0B6784]
 0004CF93    lea         eax,[esp+4]
 0004CF97    push        eax
 0004CF98    lea         eax,[esp+4]
 0004CF9C    push        eax
 0004CF9D    push        edi
 0004CF9E    call        dword ptr ds:[0B677C]
 0004CFA4    mov         eax,dword ptr [esp]
 0004CFA7    and         eax,0FFFFFFF4
 0004CFAA    xor         edx,edx
 0004CFAC    mov         dl,bl
 0004CFAE    movzx       edx,byte ptr [edx+0B4898]
 0004CFB5    or          eax,edx
 0004CFB7    mov         dword ptr [esp],eax
 0004CFBA    mov         eax,dword ptr [esp+4]
 0004CFBE    push        eax
 0004CFBF    mov         eax,dword ptr [esp+4]
 0004CFC3    push        eax
 0004CFC4    push        edi
 0004CFC5    call        dword ptr ds:[0B6780]
 0004CFCB    push        edi
 0004CFCC    push        esi
 0004CFCD    call        dword ptr ds:[0B6778]
 0004CFD3    pop         ecx
 0004CFD4    pop         edx
 0004CFD5    pop         edi
 0004CFD6    pop         esi
 0004CFD7    pop         ebx
 0004CFD8    ret
*}
end;

//0004CFDC
function Imm32IsIME(hKl:HKL):Boolean;
begin
{*
 0004CFDC    cmp         dword ptr ds:[0B4898],0
>0004CFE3    je          0004CFED
 0004CFE5    push        eax
 0004CFE6    call        dword ptr ds:[0B6794]
 0004CFEC    ret
 0004CFED    xor         eax,eax
 0004CFEF    ret
*}
end;

//0004CFF0
procedure DoneControls;
begin
{*
 0004CFF0    mov         eax,[000B59E8];^Application:TApplication
 0004CFF5    mov         eax,dword ptr [eax]
 0004CFF7    call        TObject.Free
 0004CFFC    mov         eax,[000B59E8];^Application:TApplication
 0004D001    xor         edx,edx
 0004D003    mov         dword ptr [eax],edx
 0004D005    mov         eax,[000B5BDC];^Screen:TScreen
 0004D00A    mov         eax,dword ptr [eax]
 0004D00C    call        TObject.Free
 0004D011    mov         eax,[000B5BDC];^Screen:TScreen
 0004D016    xor         edx,edx
 0004D018    mov         dword ptr [eax],edx
 0004D01A    mov         eax,[000B672C]
 0004D01F    call        TObject.Free
 0004D024    xor         eax,eax
 0004D026    mov         [000B672C],eax
 0004D02B    mov         eax,[000B676C]
 0004D030    call        TObject.Free
 0004D035    mov         ax,[000B673A]
 0004D03B    push        eax
 0004D03C    call        kernel32.GlobalDeleteAtom
 0004D041    mov         ax,[000B6738]
 0004D047    push        eax
 0004D048    call        kernel32.GlobalDeleteAtom
 0004D04D    cmp         dword ptr ds:[0B4898],0
>0004D054    je          0004D061
 0004D056    mov         eax,[000B4898]
 0004D05B    push        eax
 0004D05C    call        kernel32.FreeLibrary
 0004D061    ret
*}
end;

//0004D064
procedure InitControls;
begin
{*
 0004D064    add         esp,0FFFFFFC8
 0004D067    push        0
 0004D069    call        kernel32.GetCurrentProcessId
 0004D06E    mov         dword ptr [esp+24],eax
 0004D072    mov         byte ptr [esp+28],0
 0004D077    lea         ecx,[esp+24]
 0004D07B    mov         edx,4D154
 0004D080    lea         eax,[esp+4]
 0004D084    call        StrFmt
 0004D089    push        eax
 0004D08A    call        kernel32.GlobalAddAtomA
 0004D08F    mov         [000B6738],ax
 0004D095    push        1
 0004D097    mov         eax,[000B5950];^HInstance:Longword
 0004D09C    mov         eax,dword ptr [eax]
 0004D09E    mov         dword ptr [esp+2C],eax
 0004D0A2    mov         byte ptr [esp+30],0
 0004D0A7    call        kernel32.GetCurrentThreadId
 0004D0AC    mov         dword ptr [esp+34],eax
 0004D0B0    mov         byte ptr [esp+38],0
 0004D0B5    lea         ecx,[esp+2C]
 0004D0B9    mov         edx,4D160
 0004D0BE    lea         eax,[esp+4]
 0004D0C2    call        StrFmt
 0004D0C7    push        eax
 0004D0C8    call        kernel32.GlobalAddAtomA
 0004D0CD    mov         [000B673A],ax
 0004D0D3    mov         dl,1
 0004D0D5    mov         eax,[0001EF28];TThreadList
 0004D0DA    call        TThreadList.Create
 0004D0DF    mov         [000B676C],eax
 0004D0E4    call        InitIMM32
 0004D0E9    mov         dl,1
 0004D0EB    mov         eax,[0003FD28];TMouse
 0004D0F0    call        TMouse.Create
 0004D0F5    mov         [000B672C],eax
 0004D0FA    xor         ecx,ecx
 0004D0FC    mov         dl,1
 0004D0FE    mov         eax,[00056358];TScreen
 0004D103    call        TScreen.Create
 0004D108    mov         edx,dword ptr ds:[0B5BDC];^Screen:TScreen
 0004D10E    mov         dword ptr [edx],eax
 0004D110    xor         ecx,ecx
 0004D112    mov         dl,1
 0004D114    mov         eax,[00056430];TApplication
 0004D119    call        TApplication.Create
 0004D11E    mov         edx,dword ptr ds:[0B59E8];^Application:TApplication
 0004D124    mov         dword ptr [edx],eax
 0004D126    call        InitCtl3D
 0004D12B    mov         eax,[000B59E8];^Application:TApplication
 0004D130    mov         eax,dword ptr [eax]
 0004D132    mov         dl,1
 0004D134    call        TApplication.SetShowHint
 0004D139    mov         ecx,40028;CursorToIdent:Boolean
 0004D13E    mov         edx,40038;IdentToCursor:Boolean
 0004D143    mov         eax,[0003DF0C];TCursor
 0004D148    call        RegisterIntegerConsts
 0004D14D    add         esp,38
 0004D150    ret
*}
end;

Initialization
//0004D1C8
{*
 0004D1C8    sub         dword ptr ds:[0B6734],1
>0004D1CF    jae         0004D1EA
 0004D1D1    call        kernel32.GetVersion
 0004D1D6    and         ax,0FF
 0004D1DA    cmp         ax,4
 0004D1DE    setae       byte ptr ds:[0B6730]
 0004D1E5    call        InitControls
 0004D1EA    ret
*}
Finalization
//0004D174
{*
 0004D174    push        ebp
 0004D175    mov         ebp,esp
 0004D177    xor         eax,eax
 0004D179    push        ebp
 0004D17A    push        4D1BF
 0004D17F    push        dword ptr fs:[eax]
 0004D182    mov         dword ptr fs:[eax],esp
 0004D185    inc         dword ptr ds:[0B6734]
>0004D18B    jne         0004D1B1
 0004D18D    mov         eax,[000B6764]
 0004D192    call        TObject.Free
 0004D197    call        DoneControls
 0004D19C    mov         eax,0B4788
 0004D1A1    mov         ecx,16
 0004D1A6    mov         edx,dword ptr ds:[1FCC0];TIdentMapEntry
 0004D1AC    call        @FinalizeArray
 0004D1B1    xor         eax,eax
 0004D1B3    pop         edx
 0004D1B4    pop         ecx
 0004D1B5    pop         ecx
 0004D1B6    mov         dword ptr fs:[eax],edx
 0004D1B9    push        4D1C6
 0004D1BE    ret
>0004D1BF    jmp         @HandleFinally
>0004D1C4    jmp         0004D1BE
 0004D1C6    pop         ebp
 0004D1C7    ret
*}
end.